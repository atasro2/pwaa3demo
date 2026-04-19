#include "global.h"
#include "background.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "constants/process.h"

u16 gCourtScrollGfxFrameIndices[2][0x10] = {
    0x0000, 0x0001, 0x0002, 0x0003, 0x0005, 0x0008, 0x000C, 0x0012,
    0x0019, 0x0021, 0x002A, 0x0034, 0x003F, 0x0040, 0x0041, 0x0041,
    0x0000, 0x0002, 0x0004, 0x0006, 0x000D, 0x0019, 0x0025, 0x0032,
    0x003F, 0x004C, 0x0059, 0x0066, 0x0072, 0x007E, 0x0080, 0x0082,
};

extern const u8 gNameTagTiles[24];

extern const u16 gMapCourtRecordNormalWindow[32*12];
extern const u16 gMapCourtRecordSaveWindow[32*12];
extern const u16 gMapSpeedlines[0x2C0];
extern const u16 gUnknown_08024E78[0x2C0];

u8 *sub_8002278(u16 arg0)
{
    return &gBackgroundTable[arg0].bgData[40];
}

u32 sub_800228C(u16 arg0)
{
    return gBackgroundTable[arg0].controlBits;
}

// unused
void sub_80022A0()
{
    u32 i;
    u16 *dest = gBG1MapBuffer;
    for(i = 0; i < 0x400; i++, dest++) *dest = gTextboxTiles[i];
    gMain.tilemapUpdateBits |= 2;
}

// BG_all_init
void InitBGs()
{
    u32 i;
    u16 *temp;
    DmaFill16(3, 0, &gBG0MapBuffer, sizeof(gBG0MapBuffer));
    for (temp = gBG1MapBuffer, i = 0; i < ARRAY_COUNT(gTextboxTiles); i++, temp++)
    {
        (*temp) = gTextboxTiles[i];
    }
    DmaFill16(3, 0, &gBG2MapBuffer, sizeof(gBG2MapBuffer));
    gIORegisters.lcd_bg2vofs = 0;
    gIORegisters.lcd_bg2hofs = 8;
    InitBG3();
}

// BG256_init
void InitBG3()
{
    struct Main *main = &gMain;
    u32 i = 0;
    u32 j = 0;
    struct IORegisters *ioRegsp = &gIORegisters;

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++)
        {
            gBG3MapBuffer[GET_MAP_TILE_INDEX(i, j, 1, 1)] = j + i * 30;
        }
    }
    ioRegsp->lcd_bg3vofs = 8;
    ioRegsp->lcd_bg3hofs = 8;
    main->Bg256_scroll_x = 0;
    main->Bg256_scroll_y = 0;
    DmaFill16(3, 0, VRAM + 0xDD80, 0x40); // empty 8bpp tile
}

void bg256_right_scroll_end(struct Main * main, u32 sp0) // holy shit my braincells
{
    u32 i;
    u32 sl; // sl
    u32 r8; //r8
    u32 sp4; // sp4
    u8 * r6; // r6
    main->Bg256_next_line = 30;
    main->Bg256_buff_pos++;
    if(main->Bg256_buff_pos > 30)
        main->Bg256_buff_pos = 0;
    r8 = sp0 & 0x80000000 ? 4 : 8;
    sp4 = sp0 & ~0x80000000;
    sp0 = sp4 * r8;
    sl = r8 * 8;
    r8 *= 248;
    r6 = eBGDecompBuffer;
    // this makes it logically work but the stack is brok
    if(sp4 & 0x80000000) // ! this statement will never be true
        r6 += main->Bg256_next_line * 0x20;
    else 
        r6 += main->Bg256_next_line * 0x40;
    for(i = 1; i < 21; i++)
    {
        void * ptr;
        ptr = &gBG3MapBuffer[i*32];
        DmaCopy16(3, ptr, &gBG3MapBuffer[i*32+31], 2); // dear capcom dev who wrote a dma copy with size of 2 here, i am sincerely sorry but fuck you
        ptr = ((void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * sl) + (i-1) * r8);
        DmaCopy16(3, r6, ptr, sl);
        r6 += sp0;
    }
    if(++main->Bg256_buff_pos > 30)
        main->Bg256_buff_pos = 0;
    if(sp4 == 360)
        main->Bg256_stop_line = 0x2E;
    else
        main->Bg256_stop_line = 1;
    main->Bg256_next_line++;main->Bg256_next_line--; //! there was probably dead code here
    main->Bg256_next_line++;
    main->isBGScrolling = FALSE;
    main->Bg256_dir &= ~0x10;
    main->Bg256_dir |= 0x20;
    if(main->Bg256_pos_x < 0)
        main->horizontolBGScrollSpeed -= main->Bg256_pos_x;
    main->Bg256_pos_x = 0;
    main->Bg256_scroll_x = 0;
}

void bg256_right_scroll(struct Main * main, u32 sp0)
{
    u32 i;
    u32 sp4; // sp4
    u32 sp8; // sp8
    u32 spC; // sl
    u32 sp10;
    u8 * r6; // r6
    sp4 = main->Bg256_scroll_x / -8;
    sp8 = sp0 & 0x80000000 ? 4 : 8;
    sp10 = sp0;
    sp0 *= sp8;
    spC = sp8 * 8;
    sp8 *= 248;
    do
    {
        u8 * buf;
        buf = eBGDecompBuffer;
        if(sp10 & 0x80000000)
            buf += main->Bg256_next_line * 0x20;
        else 
            buf += main->Bg256_next_line * 0x40;
        for(i = 1; i < 21; i++)
        {
            void * ptr1;
            void * ptr2;
            ptr1 = &gBG3MapBuffer[i*32];
            ptr2 = &gTilemapBuffer[i*32];
            DmaCopy16(3, ptr1, ptr2, 30*2); // copy row of tiles to buffer copy
            ptr2 = &gBG3MapBuffer[i*32+30];
            DmaCopy16(3, ptr2, ptr1, 2); // stop with the size 2 dmacopies
            ptr1 = &gTilemapBuffer[i*32];
            ptr2 = &gBG3MapBuffer[i*32+1];
            DmaCopy16(3, ptr1, ptr2, 30*2);
            ptr1 = (void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * spC) + (i-1) * sp8;
            DmaCopy16(3, buf, ptr1, spC);
            buf += sp0;
        }
        if(--main->Bg256_buff_pos < 0)
            main->Bg256_buff_pos = 30;
        if(--main->Bg256_next_line < 0)
            main->Bg256_next_line = 59;
        if(main->Bg256_next_line == main->Bg256_stop_line)
        {
            bg256_right_scroll_end(main, sp10);
            break;
        }
    }
    while(--sp4);
    main->Bg256_scroll_x %= 8;
}

void bg256_left_scroll_end(struct Main * main, u32 r6)
{
    u32 i;
    u32 sl;
    u32 sp0;
    u32 sp4;
    u8 * r5;
    sl = r6 & 0x80000000 ? 4 : 8;
    r6 &= ~0x80000000;
    sp4 = r6 / 2;
    r6 *= sl;
    sp0 = sl * 8;
    sl *= 248;
    if(sp4 == 180) // i have no idea what this code is doing but the assembly didn't do the decrements but it makes the code match
    {
        main->Bg256_next_line = 15;
        main->Bg256_next_line++;main->Bg256_next_line--;
        main->Bg256_next_line--;
    }
    else
    {
        main->Bg256_next_line = 30;
        main->Bg256_next_line++;main->Bg256_next_line--;
        main->Bg256_next_line--;
    }
    if(--main->Bg256_buff_pos < 0)
        main->Bg256_buff_pos = 30;
    r5 = eBGDecompBuffer;
    if(sp4 & 0x80000000) // ! this statement will never be true
        r5 += main->Bg256_next_line * 0x20;
    else 
        r5 += main->Bg256_next_line * 0x40;
    for(i = 1; i < 21; i++)
    {
        void * ptr;
        ptr = &gBG3MapBuffer[i*32+31];
        DmaCopy16(3, &gBG3MapBuffer[i*32+31], &gBG3MapBuffer[i*32], 2); // dear capcom dev who wrote a dma copy with size of 2 here, i am sincerely sorry but fuck you
        ptr = ((void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * sp0) + (i-1) * sl);
        DmaCopy16(3, r5, ptr, sp0);
        r5 += r6;
    }
    DmaFill16(3, 0, 0x0600DD80, 0x40);
    for(i = 0; i < 32; i++) {
        gBG3MapBuffer[i*32+31] = 0x2276;
    }
    if(--main->Bg256_buff_pos < 0)
        main->Bg256_buff_pos = 30;
    main->Bg256_next_line--;
    main->Bg256_stop_line = 58;
    main->isBGScrolling = FALSE;
    main->Bg256_dir &= ~0x20;
    main->Bg256_dir |= 0x10;
    if(main->Bg256_pos_x > sp4)
        main->horizontolBGScrollSpeed -= main->Bg256_pos_x - sp4;
    main->Bg256_pos_x = sp4;
    // the address of scroll x gets computed earlier and breaks things
    main->Bg256_scroll_x = 0;
}

void bg256_left_scroll(struct Main * main, u32 sp0)
{
    u32 i;
    u32 sp4;
    u32 sp8;
    u32 spC;
    u32 sp10;
    u8 * buf;
    
    sp4 = main->Bg256_scroll_x / 8;
    sp8 = sp0 & 0x80000000 ? 4 : 8;
    sp10 = sp0;
    sp0 *= sp8; // this doesn't clear the MSB hmm
    spC = sp8 * 8;
    sp8 *= 248;
    do
    {
        buf = eBGDecompBuffer;
        if(sp10 & 0x80000000)
            buf += main->Bg256_next_line * 0x20;
        else 
            buf += main->Bg256_next_line * 0x40;
        for(i = 1; i < 21; i++)
        {
            void * ptr1;
            void * ptr2;
            ptr1 = &gBG3MapBuffer[i*32+1];
            ptr2 = &gTilemapBuffer[i*32];
            DmaCopy16(3, ptr1, ptr2, 62);
            ptr1 = &gBG3MapBuffer[i*32];
            DmaCopy16(3, ptr2, ptr1, 62);
            ptr2 = &gBG3MapBuffer[i*32+31];
            DmaCopy16(3, ptr1, ptr2, 2);
            ptr1 = (void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * spC) + (i-1) * sp8;
            DmaCopy16(3, buf, ptr1, spC);
            buf += sp0;
        }
        if(++main->Bg256_buff_pos > 30)
            main->Bg256_buff_pos = 0;
        if(++main->Bg256_next_line > 59)
            main->Bg256_next_line = 0;
        if(main->Bg256_next_line == main->Bg256_stop_line)
        {
            bg256_left_scroll_end(main, sp10);
            break;
        }
    }
    while(--sp4);
    main->Bg256_scroll_x %= 8;
}

void bg256_down_scroll_end(struct Main * main, u32 r1)
{
    u32 i;
    u32 r5;
    u32 r6;
    void * ptr1;
    void * ptr2;
    main->Bg256_next_line = 21;
    r5 = r1 & 0x80000000 ? 4 : 8;
    r6 = r1 & ~0x80000000; // r1 -> r6
    r5 *= 240;
    if(++main->Bg256_buff_pos > 20)
        main->Bg256_buff_pos = 0;
    ptr1 = &gBG3MapBuffer[0];
    ptr2 = &gBG3MapBuffer[0x2A0];
    DmaCopy16(3, ptr1, ptr2, 64);
    ptr1 = (void*)BG_CHAR_ADDR(1) + main->Bg256_buff_pos * r5;
    ptr2 = eBGDecompBuffer + main->Bg256_next_line * r5;
    ptr2 -= r5;
    DmaCopy16(3, ptr2, ptr1, r5);
    if(++main->Bg256_buff_pos > 20)
        main->Bg256_buff_pos = 0;
    if(r6 == 320)
        main->Bg256_stop_line = 1;
    else
        main->Bg256_stop_line = 0x20;
    main->isBGScrolling = 0;
    main->Bg256_dir &= ~0x40;
    main->Bg256_dir |= 0x80;
    if(main->Bg256_pos_y < 0)
        main->verticalBGScrollSpeed -= main->Bg256_pos_y;
    main->Bg256_pos_y = 0;
    main->Bg256_scroll_y = 0;
}

void bg256_down_scroll(struct Main * main, u32 sp0)
{
    u32 i;
    u32 r8;
    u32 r6;
    u16 * map;
    r8 = main->Bg256_scroll_y / -8;
    r6 = sp0 & 0x80000000 ? 4 : 8;
    r6 *= 240;
    do
    {
        void * ptr;
        void * buf;
        DmaCopy16(3, gBG3MapBuffer, gTilemapBuffer, 0x540);
        ptr = gBG3MapBuffer + 0x20;
        DmaCopy16(3, gTilemapBuffer, ptr, 0x540);
        DmaCopy16(3, gBG3MapBuffer + 0x2A0, gBG3MapBuffer, 0x40);
        buf = eBGDecompBuffer;
        buf += main->Bg256_next_line * r6;
        ptr = (void*)BG_CHAR_ADDR(1) + main->Bg256_buff_pos * r6;
        DmaCopy16(3, buf, ptr, r6);
        if(--main->Bg256_buff_pos < 0)
            main->Bg256_buff_pos = 20;
        if(--main->Bg256_next_line < 0)
            main->Bg256_next_line = 39;
        if(main->Bg256_next_line == main->Bg256_stop_line)
        {
            bg256_down_scroll_end(main, sp0);
            break;
        }
    }
    while(--r8);
    main->Bg256_scroll_y %= 8;
}

void bg256_up_scroll_end(struct Main * main, u32 r4)
{
    u32 r5;
    void * buf;
    void * ptr1;
    void * ptr2;
    r5 = r4 & 0x80000000 ? 4 : 8;
    r4 &= ~0x80000000;
    r5 *= 240;
    if(r4 == 320)
        main->Bg256_next_line = 18;
    else
        main->Bg256_next_line = 8;
    if(--main->Bg256_buff_pos < 0)
        main->Bg256_buff_pos = 20;
    ptr1 = gBG3MapBuffer + 0x2A0;
    ptr2 = gBG3MapBuffer;
    DmaCopy16(3, ptr1, ptr2, 0x40);
    buf = eBGDecompBuffer + main->Bg256_next_line * r5;
    buf += r5;
    ptr1 = (void*)BG_CHAR_ADDR(1) + main->Bg256_buff_pos * r5;
    DmaCopy16(3, buf, ptr1, r5);
    if(--main->Bg256_buff_pos < 0)
        main->Bg256_buff_pos = 20;
    main->Bg256_stop_line = 0x26;
    main->isBGScrolling = FALSE;
    main->Bg256_dir &= ~0x80;
    main->Bg256_dir |= 0x40;
    r4 /= 2;
    if(main->Bg256_pos_y > r4)
        main->verticalBGScrollSpeed -= main->Bg256_pos_y - r4;
    main->Bg256_pos_y = r4;
    main->Bg256_scroll_y = 0;
}

void bg256_up_scroll(struct Main * main, u32 arg0)
{
    u32 i;
    u32 sp0;
    u32 r8;
    u32 r6;
    r8 = main->Bg256_scroll_y >> 3; // oh yeah you know all those divisions we did in those function before this? yeah forget about them just do a fucking right shift 
    r6 = arg0 & 0x80000000 ? 4 : 8;
    sp0 = arg0;
    r6 *= 240;
    do
    {
        void * ptr1;
        void * ptr2;
        void * buf;

        ptr1 = gBG3MapBuffer + 0x20;
        ptr2 = gBG3MapBuffer + 0x2C0;
        DmaCopy16(3, ptr1, ptr2, 0x40);
        DmaCopy16(3, gBG3MapBuffer, gTilemapBuffer, 0x5C0);
        ptr2 = gTilemapBuffer + 0x20;
        do{}while(0); // TODO: find actual match, gBG3MapBuffer gets loaded from the pool instead of ptr1 - 0x40
        DmaCopy16(3, ptr2, gBG3MapBuffer, sizeof(gMapSpeedlines));
        buf = eBGDecompBuffer;
        buf += main->Bg256_next_line * r6;
        ptr2 = (void*)BG_CHAR_ADDR(1) + main->Bg256_buff_pos * r6;
        DmaCopy16(3, buf, ptr2, r6);
        if(++main->Bg256_buff_pos > 20)
            main->Bg256_buff_pos = 0;
        if(++main->Bg256_next_line > 39)
            main->Bg256_next_line = 0;
        if(main->Bg256_next_line == main->Bg256_stop_line)
        {
            bg256_up_scroll_end(main, sp0);
            break;
        }
    }
    while(--r8);
    main->Bg256_scroll_y %= 8;
}

void sub_8002E80(struct Main * main, u32 arg1) {
    u32 i, j;
    u32 tilesScrolledX;
    u32 bytesPerLine = arg1;
    u32 bpp;
    u32 tileSize;
    u8 * buf;
    void * src;
    void * dst;
    tilesScrolledX = main->Bg256_scroll_x / 8;
    bpp = arg1 & 0x80000000 ? 4 : 8;
    bytesPerLine = arg1 * bpp;
    tileSize = bpp * 8;
    bpp *= 8 * 31; // lineSize
    main->Bg256_next_line = tilesScrolledX+1;
    for(i = tilesScrolledX; i > 0; i--) {
        buf = eBGDecompBuffer;
        buf += main->Bg256_next_line * 0x40; // does not check for 4bpp 
        for(j = 1; j < 21; j++)
        {
            src = &gBG3MapBuffer[j*32+1];
            dst = &gTilemapBuffer[j*32];
            DmaCopy16(3, src, dst, 31 * 2);
            src = &gBG3MapBuffer[j*32];
            DmaCopy16(3, dst, src, 31 * 2);
            dst = &gBG3MapBuffer[j*32+31];
            DmaCopy16(3, src, dst, 2);
            src = (void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * tileSize) + (j-1) * bpp;
            DmaCopy16(3, buf, src, tileSize);
            buf += bytesPerLine;
        }
        if(++main->Bg256_buff_pos > 30)
            main->Bg256_buff_pos = 0;
        main->Bg256_next_line++;
    }
    main->Bg256_scroll_x %= 8;
    gIORegisters.lcd_bg3vofs = main->Bg256_scroll_y + 8;
    gIORegisters.lcd_bg3hofs = main->Bg256_scroll_x + 8;
    
    if(main->Bg256_dir & 0x10) {
        if(main->Bg256_next_line > 59)
            main->Bg256_next_line -= 32;
        main->Bg256_stop_line = 58;
        if(--main->Bg256_buff_pos < 0)
            main->Bg256_buff_pos = 30;
        buf = eBGDecompBuffer;
        buf += main->Bg256_next_line * 0x40; 
        for(j = 1; j < 21; j++)
        {
            src = &gBG3MapBuffer[j*32+31];
            dst = &gBG3MapBuffer[j*32];
            DmaCopy16(3, src, dst, 2);
            src = (void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * tileSize) + (j-1) * bpp;
            DmaCopy16(3, buf, src, tileSize);
            buf += bytesPerLine;
        }
        DmaFill16(3, 0, BG_CHAR_ADDR(1)+0x9D80, 0x40);
        for(j = 0; j < 32; j++)
        {
            gBG3MapBuffer[j*32+31] = 0x2276; // 0x9D80 / 0x40 = 0x276
        }
        if(--main->Bg256_buff_pos < 0)
            main->Bg256_buff_pos = 30;
        main->Bg256_next_line--;
        main->isBGScrolling = FALSE;
    }
}

void sub_80030EC(struct Main * main, u32 arg1) {
    u32 i, j;
    u32 tilesScrolledX;
    u32 bytesPerLine = arg1;
    u32 bpp;
    u32 lineSize;
    u32 tileSize;
    u32 bgWidth;
    u8 * buf;
    void * src;
    void * dst;
    tilesScrolledX = main->Bg256_scroll_x / -8;
    bpp = arg1 & 0x80000000 ? 4 : 8;
    bgWidth = arg1;
    bytesPerLine = arg1 * bpp;
    tileSize = bpp * 8;
    bpp *= 8 * 31; // lineSize
    //main->Bg256_next_line = tilesScrolledX+1;
    for(i = tilesScrolledX; i > 0; i--) {
        buf = eBGDecompBuffer;
        buf += main->Bg256_next_line * 0x40; // does not check for 4bpp 
        for(j = 1; j < 21; j++)
        {

            src = &gBG3MapBuffer[j*32];
            dst = &gTilemapBuffer[j*32];
            DmaCopy16(3, src, dst, 30 * 2);
            dst = &gBG3MapBuffer[j*32+30];
            DmaCopy16(3, dst, src, 2);
            src = &gTilemapBuffer[j*32];
            dst = &gBG3MapBuffer[j*32+1];
            DmaCopy16(3, src, dst, 30 * 2);
            src = (void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * tileSize) + (j-1) * bpp;
            DmaCopy16(3, buf, src, tileSize);
            buf += bytesPerLine;
        }
        if(--main->Bg256_buff_pos < 0)
            main->Bg256_buff_pos = 30;
        main->Bg256_next_line--;
    }
    main->Bg256_scroll_x %= 8;
    gIORegisters.lcd_bg3vofs = main->Bg256_scroll_y + 8;
    gIORegisters.lcd_bg3hofs = main->Bg256_scroll_x + 8;
    
    if(main->Bg256_dir & 0x20) {
        if(main->Bg256_next_line < 0)
            main->Bg256_next_line += 32;
        if(++main->Bg256_buff_pos > 30)
            main->Bg256_buff_pos = 0;
        buf = eBGDecompBuffer;
        buf += main->Bg256_next_line * 0x40; 
        for(j = 1; j < 21; j++)
        {
            src = &gBG3MapBuffer[j*32];
            dst = &gBG3MapBuffer[j*32+31];
            DmaCopy16(3, src, dst, 2);
            src = (void*)BG_CHAR_ADDR(1) + (main->Bg256_buff_pos * tileSize) + (j-1) * bpp;
            DmaCopy16(3, buf, src, tileSize);
            buf += bytesPerLine;
        }
        main->Bg256_buff_pos--;main->Bg256_buff_pos++; // fakematch
        if(++main->Bg256_buff_pos > 30)
            main->Bg256_buff_pos = 0;
        if(bgWidth == 360)
            main->Bg256_stop_line = 47;
        else
            main->Bg256_stop_line = 1;
        
        main->Bg256_next_line++;
        main->isBGScrolling = FALSE;
        if(main->Bg256_pos_x < 0)
            main->horizontolBGScrollSpeed -= main->Bg256_pos_x;
    }
}

void UpdateBackground() // BG256_main
{
    struct AnimationListEntry * animation;
    struct Main * main = &gMain;
    struct IORegisters * ioRegs = &gIORegisters;
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct CourtScroll * courtScroll = &gCourtScroll;
    u32 unk0;
    u32 unk1;
    if(courtScroll->state != 0 && (courtScroll->frameCounter & 1) == 0) // frameCounter divisible by 2?
    {
        u8 * courtScrollGfx = courtScroll->frameDataPtr; //r3
        u8 * vram; // r4
        u32 temp = 0; // r8
        u16 i, j;
        u32 sl;
        u16 buf[16];
        u16 buf2[16];
        switch(courtScroll->scrollMode) {
            case 0:
            case 1:
                temp = gCourtScrollGfxFrameIndices[0][courtScroll->frameCounter / 2];
                break;
            case 2:
            case 3: {
                temp = 130 - gCourtScrollGfxFrameIndices[1][courtScroll->frameCounter / 2];
                break;
            }
            case 4:
            case 5:
                temp = 130 - gCourtScrollGfxFrameIndices[0][courtScroll->frameCounter / 2];
                break;
        }
        gIORegisters.lcd_bg3cnt &= ~BGCNT_256COLOR;
        if(gMain.unk3D & 8) {
            gMain.unk3D |= 0x10;
            DmaCopy16(3, courtScrollGfx, buf, 0x20);
            for(i = 0; i < 16; i++) {
                buf[i] = ColorFadeSepia(buf[i], 0x20, 0);
            }
            DmaCopy16(3, buf, PLTT+0x40, 0x20);
        } else if(scriptCtx->unk1E & 0x200) {
            DmaCopy16(3, courtScrollGfx, buf2, 0x20);
            for(i = 0; i < 16; i++) {
                buf2[i] = ColorFadeGrayscale(buf2[i], 0x20, 0);
            }
            DmaCopy16(3, buf2, PLTT+0x40, 0x20);
        } else if(scriptCtx->unk1E & 0x400) {
            for(i = 0; i < 16; i++) {
                buf2[i] = 0;
            }
            DmaCopy16(3, buf2, PLTT+0x40, 0x20);
        } else {
            DmaCopy16(3, courtScrollGfx, PLTT+0x40, 0x20);
        }
        // _0800354C
        if(temp < 50) {
            courtScrollGfx += 0x20;
            courtScrollGfx += temp * 0x20;
            sl = 0xA00;
            vram = BG_CHAR_ADDR(1);
            for(i = 0; i < 20; i++) {
                DmaCopy16(3, courtScrollGfx, vram, 0x3C0);
                vram += 0x3C0;
                courtScrollGfx += sl;
            }
            DmaCopy16(3, gMapSpeedlines, gBG3MapBuffer, sizeof(gMapSpeedlines));
        } else {
            u32 size;
            courtScrollGfx += 0x20;
            courtScrollGfx += temp * 0x20;
            sl = 0xA00;
            vram = BG_CHAR_ADDR(1);
            if(temp < 80) {
                for(i = 0; i < 20; i++) {
                    DmaCopy16(3, courtScrollGfx, vram, (80 - temp) * 0x20);
                    vram += 0x3C0;
                    courtScrollGfx += sl;
                }
            }
            courtScrollGfx = courtScroll->frameDataPtr;
            courtScrollGfx += 0x20;
            if(temp >= 80) {
                courtScrollGfx += (130 - temp) * 0x20;
                vram = BG_CHAR_ADDR(1);
                size = 0x1E;
            } else {
                courtScrollGfx += (130 - temp) * 0x20;
                vram = BG_CHAR_ADDR(1) + (80 - temp) * 0x20;
                size = temp - 50;
            }
            for(i = 0; i < 20; i++) {
                DmaCopy16(3, courtScrollGfx, vram, size * 0x20);
                vram += 0x3C0;
                courtScrollGfx += sl;
            }

            if(temp < 80) {
                for(j = 0; j < 20; j++) {
                    for(i = temp; i < 80; i++) {
                        u16 idx = (j+1) * 0x20 + (i - temp) + 1;
                        s16 tile = (j * 30 + (i - temp)) | 0x2000;
                        gBG3MapBuffer[idx] = tile;
                    }
                }
                for(j = 0; j < 20; j++) {
                    for(i = 0; i < temp - 50; i++) {
                        u16 idx = (j+1) * 0x20  + 80 + 1 + (i - temp);
                        s16 tile = (j * 30 - (s16)(i - 30 + 1)) | 0x2400;
                        gBG3MapBuffer[idx]  = tile;
                    }
                }
            } else {
                for(j = 0; j < 20; j++) {
                    for(i = 0; i < 30; i++) {
                        u16 idx = (j+1) * 0x20 + i + 1;
                        s16 tile = (j * 30 - (s16)(i - 30 + 1)) | 0x2400;
                        gBG3MapBuffer[idx]  = tile;
                    }
                }
            }
            
        }

    }
    if((main->unk3D & 2) && main->currentBG == 14)
    {
        ioRegs->lcd_bg3hofs += main->horizontolBGScrollSpeed;
        return;
    }
    unk1 = gBackgroundTable[main->currentBG].controlBits;
    if (main->isBGScrolling == FALSE)
        return;
    unk0 = main->Bg256_dir;
    if ((0xF0 & unk1) == 0) {
        main->isBGScrolling = FALSE;
        return;
    }
    if ((unk0 & 0x30) && !(unk1 & 0x30)) {
        unk0 &= ~0x30;
    }
    if ((unk0 & 0xC0) && !(unk1 & 0xC0)) {
        unk0 &= ~0xC0;
    }
    if (unk0 == 0) {
        main->isBGScrolling = FALSE;
        main->Bg256_dir &= ~0xF0;
        return;
    }
    if(unk0 & 0x10)
    {
        if(main->horizontolBGScrollSpeed > 0)
        {
            main->isBGScrolling = FALSE;
            return;
        }
        main->Bg256_scroll_x += main->horizontolBGScrollSpeed;
        main->Bg256_pos_x += main->horizontolBGScrollSpeed;
        unk0 = gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_480x160 ? 480 : 360;
        unk1 = gBackgroundTable[main->currentBG].controlBits & 0x80000000;
        unk0 |= unk1;
        if(main->Bg256_scroll_x <= -8)
            bg256_right_scroll(main, unk0);
        else if(main->Bg256_pos_x < 0)
        {
            if(--main->Bg256_buff_pos < 0)
                main->Bg256_buff_pos = 30;
            bg256_right_scroll_end(main, unk0);
        }
        if (main->unk50 != 0 && main->Bg256_pos_x <= main->unk50) {
            main->isBGScrolling = FALSE;
        }
        OffsetAllAnimations(-main->horizontolBGScrollSpeed, 0);
    }
    else if(unk0 & 0x20)
    {
        if(main->horizontolBGScrollSpeed < 0)
        {
            main->isBGScrolling = FALSE;
            return;
        }
        main->Bg256_scroll_x += main->horizontolBGScrollSpeed;
        main->Bg256_pos_x += main->horizontolBGScrollSpeed;
        unk0 = gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_480x160 ? 480 : 360;
        unk1 = gBackgroundTable[main->currentBG].controlBits & 0x80000000;
        unk0 |= unk1;
        if(main->Bg256_scroll_x >= 8)
            bg256_left_scroll(main, unk0);
        if (main->unk50 != 0 && main->Bg256_pos_x >= main->unk50) {
            main->isBGScrolling = FALSE;
        }
        if(main->Bg256_pos_x > unk0/2)
        {
            if(++main->Bg256_buff_pos > 30)
                main->Bg256_buff_pos = 0;
            bg256_left_scroll_end(main, unk0);
        }
        OffsetAllAnimations(-main->horizontolBGScrollSpeed, 0);
    }
    else if(unk0 & 0x40)
    {
        if(main->verticalBGScrollSpeed > 0)
        {
            main->isBGScrolling = FALSE;
            return;
        }
        if (main->currentBG == 42) {
            if(gMain.frameCounter % 3)
                return;
        }
        main->Bg256_scroll_y += main->verticalBGScrollSpeed;
        main->Bg256_pos_y += main->verticalBGScrollSpeed;
        unk0 = gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_240x320 ? 320 : 240;
        unk1 = gBackgroundTable[main->currentBG].controlBits & 0x80000000;
        unk0 |= unk1;
        if(main->Bg256_scroll_y <= -8)
            bg256_down_scroll(main, unk0);
        else if(main->Bg256_pos_y <= 0)
        {
            if(--main->Bg256_buff_pos < 0)
                main->Bg256_buff_pos = 20;
            bg256_down_scroll_end(main, unk0);
        }
        if (main->unk50 != 0 && main->Bg256_pos_y <= main->unk50) {
            main->isBGScrolling = FALSE;
        }
        OffsetAllAnimations(0, -main->verticalBGScrollSpeed);
    }
    else if(unk0 & 0x80)
    {
        if(main->verticalBGScrollSpeed < 0)
        {
            main->isBGScrolling = FALSE;
            return;
        }
        main->Bg256_scroll_y += main->verticalBGScrollSpeed;
        main->Bg256_pos_y += main->verticalBGScrollSpeed;
        unk0 = gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_240x320 ? 320 : 240;
        unk1 = gBackgroundTable[main->currentBG].controlBits & 0x80000000;
        unk0 |= unk1;
        if(main->Bg256_scroll_y >= 8)
            bg256_up_scroll(main, unk0);
        else if(main->Bg256_pos_y > unk0/2)
        {
            if(++main->Bg256_buff_pos > 20)
                main->Bg256_buff_pos = 0;
            bg256_up_scroll_end(main, unk0*2);
        }
        if (main->unk50 != 0 && main->Bg256_pos_y >= main->unk50) {
            main->isBGScrolling = FALSE;
        }
        OffsetAllAnimations(0, -main->verticalBGScrollSpeed);
    }
    ioRegs->lcd_bg3vofs = main->Bg256_scroll_y + 8;
    ioRegs->lcd_bg3hofs = main->Bg256_scroll_x + 8;
}

void DecompressCurrentBGStripe(u32 bgId)
{
    u32 i;
    u32 size;
    u32 flags;
    #ifndef NONMATCHING
    register u8 * bgData asm("r4");
    #elif
    u8 * bgData;
    #endif
    bgId &= ~0x8000;
    if(bgId == 0x81)
    {
        gMain.currentBgStripe = 11;
        UpdateAnimations(gMain.previousBG);
        return;
    }
    bgData = (void*)gBackgroundTable[bgId].bgData;
    if(gMain.currentBgStripe == 1)
    {
        u32 * ptr = (u32 *)bgData;
        flags = (u32)ptr;
        for(i = 1; i < 11; i++)
            gMain.bgStripeOffsets[i] = *ptr++;
        UpdateAnimations(gMain.previousBG);
    }
    bgData += gMain.bgStripeOffsets[gMain.currentBgStripe];
    flags = gBackgroundTable[bgId].controlBits; 
    if(flags & BG_MODE_SIZE_480x160)
        i = 0x1E00;
    else if(flags & BG_MODE_SIZE_360x160)
        i = 0x1680;
    else if(flags & BG_MODE_SIZE_240x320)
        i = 0x1E00;
    else
        i = 0xF00;
    switch (gMain.unk258) {
    case 1:
    case 2:
    case 6:
    case 7:
        i = 0x1E00;
        break;
    case 3:
    case 4:
    case 5:
        i = 0xF00;
        break;
    case 9:
        i = 0x1680;
        break;
    }

    if(flags & BG_MODE_4BPP)
        i /= 2;
    if(gMain.currentBgStripe == 1)
    {
        if(flags & BG_MODE_4BPP)
            bgData += 0x20;
        else
            bgData += 0x200;
        switch (gMain.unk258) {
        default:
        case 0:
        case 1:
        case 7:
        case 8:
        case 9:
            gMain.bgStripeDestPtr = eBGDecompBuffer;
            break;
        case 2:
            gMain.bgStripeDestPtr = eBGDecompBuffer + i / 4;
            break;
        case 3:
            gMain.bgStripeDestPtr = eBGDecompBuffer;
            break;
        case 4:
            gMain.bgStripeDestPtr = eBGDecompBuffer + i * 10;
            break;
        case 5:
            gMain.bgStripeDestPtr = eBGDecompBuffer2 + 0xC0;
            break;
        case 6:
            gMain.bgStripeDestPtr = eBGDecompBuffer + 0x780;
            break;
        }
    }
    else
        gMain.bgStripeDestPtr = (u8*)gMain.bgStripeDestPtr + i;
    switch (gMain.unk258) {
    case 1:
    case 2:
    case 6: {
        u8 * src = gUnknown_0202B1C0;
        LZ77UnCompWram(bgData, src);
        bgData = gMain.bgStripeDestPtr;
        DmaCopy16(3, src, bgData, i / 4);
        bgData += i / 2;
        src += i / 4 ;
        DmaCopy16(3, src, bgData, i / 4);
    }
    break;
    default:
    case 0:
    case 3:
    case 4:
    case 5:
    case 7:
        LZ77UnCompWram(bgData, gMain.bgStripeDestPtr);
        break;
    }
    gMain.currentBgStripe++;
}

void DecompressBackgroundIntoBuffer(u32 bgId)
{
    u32 i;
    u32 size;
    u32 flags;
    u8 * bgData;
    u32 * ptr;
    UpdateAnimations(gMain.previousBG);
    bgId &= ~0x8000;
    if(bgId == 0x81) 
        return;
    bgData = (void*)gBackgroundTable[bgId].bgData;
    ptr = (u32 *)bgData;
    for(i = 1; i < 11; i++)
        gMain.bgStripeOffsets[i] = *ptr++;
    flags = gBackgroundTable[bgId].controlBits;
    if(flags & BG_MODE_SIZE_480x160)
        size = 0x1E00;
    else if(flags & BG_MODE_SIZE_360x160)
        size = 0x1680;
    else if(flags & BG_MODE_SIZE_240x320)
        size = 0x1E00;
    else
        size = 0xF00;
    switch (gMain.unk258) {
    case 1:
    case 2:
        size = 0x1E00;
        break;
    case 3:
    case 4:
    case 5:
        size = 0xF00;
        break;
    case 6:
        size = 0x1680;
        break;
    }
    if(flags & BG_MODE_4BPP) {
        size /= 2;
        bgData += 0x20;
    }
    else
        bgData += 0x200;
    bgData += gMain.bgStripeOffsets[1];
    if(gMain.unk258) {
        switch (gMain.unk258) {
        case 2:
            gMain.bgStripeDestPtr = eBGDecompBuffer + size / 4;
            break;
        case 1:
        case 3:
        case 6:
        case 8:
        case 9:
            gMain.bgStripeDestPtr = eBGDecompBuffer;
            break;
        case 4:
            gMain.bgStripeDestPtr = eBGDecompBuffer + size * 10;
            break;
        case 5:
            gMain.bgStripeDestPtr = eBGDecompBuffer2 + 0xC0;
            break;
        }
    }
    else {
        gMain.bgStripeDestPtr = eBGDecompBuffer;
    }
    m4aSoundVSyncOff();
    for(i = 1; i < 11; i++)
    {
        if(i > 1) {
            gMain.bgStripeDestPtr = (u8*)gMain.bgStripeDestPtr + size;
            bgData = gBackgroundTable[bgId].bgData;
            bgData += gMain.bgStripeOffsets[i];
        }
        switch (gMain.unk258) {
        case 1:
        case 2:
        case 6: {
            u8 * src = gSaveDataBuffer.bg0Map; // what
            LZ77UnCompWram(bgData, src);
            bgData = gMain.bgStripeDestPtr;
            DmaCopy16(3, src, bgData, size / 4);
            bgData += size / 2;
            src += size / 4 ;
            DmaCopy16(3, src, bgData, size / 4);
            break;
        }
        default:
        case 0:
        case 3:
        case 4:
        case 5:
            LZ77UnCompWram(bgData, gMain.bgStripeDestPtr);
            break;
        }
    }
    m4aSoundVSyncOn();
}

void EnableDetentionCenterMask(bool16 enable)
{
    u16 i, j;
    u16 r4;
    u16 * map;
    if(enable) {
        DmaFill16(3, 0, gBG0MapBuffer, sizeof(gBG0MapBuffer));
    }
    map = &gBG0MapBuffer[0x202];
    map += 0x20;
    for(r4 = 0, i = 0; i < 3; r4++, i++) {
        for(j = 0; j < 26; j++) {
            if(enable)
                *map++ = 0x2000 | (0x80 + r4);
            else
                *map++ = 0;
        }
        map += 6;
    }
    if(enable) {
        DmaCopy16(3, gGfxDetentionCenterBottomTiles, VRAM+0x1000, 0x60);
        gIORegisters.lcd_bg0cnt &= ~0x3;
        gIORegisters.lcd_bg0cnt |= BGCNT_PRIORITY(2);
        gIORegisters.lcd_dispcnt |= DISPCNT_BG0_ON;
        gMain.tilemapUpdateBits |= 1;
    } else {
        gMain.tilemapUpdateBits &= ~1;
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG0_ON;
    }
}

s32 sub_800407C(s32 bgId)
{
    struct IORegisters * ioRegs = &gIORegisters;
    u16 buf[0x10];
    u16 *src;
    u16 *dst;
    u16 i;
    
    switch (gAnimation[1].animationInfo.personId) {
    case 39:
        src = NULL;
        dst = PLTT+0x1E0;
        break;
    case 40:
        src = NULL;
        dst = PLTT+0x1A0;
        break;
    case 37:
        src = gPal_BustupMia;
        dst = PLTT+0x1C0;
        break;
    default:
    case 36:
    case 38:
        src = NULL;
        dst = PLTT+0x1C0;
    }
    DmaCopy16(3, src, dst, 0x20); // i hate capcom
    
    do {
        if(gMain.unk3D & 8) {
            DmaCopy16(3, src, buf, 0x20);
            for(i = 0; i < 0x10; i++) {
                buf[i] = ColorFadeSepia(buf[i], 0x20, 0);
            }
            DmaCopy16(3, buf, dst, 0x20);
        } else {
            DmaCopy16(3, src, dst, 0x20);
        }
    } while(0);
    DmaCopy16(3, gGfxSpeedlinesFirstAndLastColumns, eSpeedlineDecompBuffer, 0x500);
    src = eSpeedlineDecompBuffer;
    dst = VRAM+0x8B00;
    DmaCopy16(3, src, dst, 0x5000);
    src = gBG2MapBuffer;
    dst = BG_SCREEN_ADDR(30);
    DmaCopy16(3, src, dst, sizeof(gMapSpeedlines));
    *(u16*)&REG_BG2CNT = ioRegs->lcd_bg2cnt;
    if (bgId == 0x81) {
        *(u16*)&REG_BG3CNT &= ~BGCNT_256COLOR;
        DmaFill16(3, 0x2222, BG_CHAR_ADDR(1), TILE_SIZE_4BPP);
        dst = BG_SCREEN_ADDR(31);
        DmaFill16(3, 0x0, dst, 0x800);
        MoveAnimationTilesToRam(0);
        MoveSpritesToOAM();
        return -1;
    }
    return 0;
}

void sub_8004218(s32 arg0)
{
    struct ScriptContext * scriptCtx = &gScriptContext;

    if(arg0 == 1) {
        LoadCounselBenchGraphics();
        SetOAMForCourtBenchSpritesDefense(0, 0x80, 1);
        scriptCtx->unk30[6] = 0;
        scriptCtx->unk30[7] = 0;
    } else if(arg0 == 2) {
        LoadCounselBenchGraphics();
        SetOAMForCourtBenchSpritesProsecution(0x20, 0x80, 1);
        scriptCtx->unk30[6] = 0;
        scriptCtx->unk30[7] = 0;
    } else if(arg0 == 3) {
        LoadWitnessBenchGraphics();
        SetOAMForCourtBenchSpritesWitness(0x18, 0x80, 1);
        scriptCtx->unk30[6] = 0;
        scriptCtx->unk30[7] = 0;
    } else if(arg0 == 0x81 && (gAnimation[1].flags & 0x30000000) == 0x30000000) {
        switch (gAnimation[1].animationInfo.personId) {
        case 3:
        case 7:
            LoadCounselBenchGraphics();
            SetOAMForCourtBenchSpritesDefense(0, 0x80, 1);
            break;
        case 17:
            LoadCounselBenchGraphics();
            SetOAMForCourtBenchSpritesProsecution(0x18, 0x80, 1);
            break;
        default:
            if (scriptCtx->unk30[7] == 0xFFFF) {
                switch (scriptCtx->unk30[6]) {
                case 0:
                    LoadWitnessBenchGraphics();
                    SetOAMForCourtBenchSpritesWitness(0x18, 0x80, 1);
                    break;
                case 1:
                    LoadCounselBenchGraphics();
                    SetOAMForCourtBenchSpritesDefense(0, 0x80, 1);
                    break;
                case 2:
                    LoadCounselBenchGraphics();
                    SetOAMForCourtBenchSpritesProsecution(0x18, 0x80, 1);
                    break;
                }
                scriptCtx->unk30[6] = 0;
                scriptCtx->unk30[7] = 0;
            } else {
                SetOAMForCourtBenchSpritesWitness(0, 0, 0);
                SetOAMForCourtBenchSpritesDefense(0, 0, 0);
            }
        }
    } else {
        SetOAMForCourtBenchSpritesWitness(0, 0, 0);
        SetOAMForCourtBenchSpritesDefense(0, 0, 0);
    }
}

void sub_8004318() {
    struct Main * main = &gMain;
    u16 * src;
    u16 * dst;
    src = gMapSpeedlines;
    dst = gBG3MapBuffer;
    DmaCopy16(3, src, dst, sizeof(gMapSpeedlines));
    if(main->effectType == 0xFFFE) {
        DmaFill16(3, 0x001F, PLTT+0x40, 0x1C0);
        DmaFill16(3, 0x2222, BG_CHAR_ADDR(1), 0x9600);
    } else {
        DmaFill16(3, 0x0000, PLTT+0x40, 0x1C0);
        DmaFill16(3, 0x2222, BG_CHAR_ADDR(1), 0x9600);
    }
}

void sub_8004390(u8* tiles, u32 arg1, u32 is4bpp) {
    struct Main * main = &gMain;
    u16 * src;
    u16 * dst;
    u32 i, j;
    if((arg1 & 0xF) == 0) {
        src = gMapSpeedlines;
        dst = gBG3MapBuffer;
        DmaCopy16(3, src, dst, sizeof(gMapSpeedlines));
        if(arg1 & 0x1000000) {
            j = 600;
            for(i = 0; i < 20; i++, j++) {
                gBG3MapBuffer[i*32+63] = j | 0x2000;
            }
            for(i = 0; i < 20; i++, j++) {
                gBG3MapBuffer[i*32+32] = j | 0x2000;
            }
            main->isBGScrolling = TRUE;
            DmaCopy16(3, gGfxSpeedlinesFirstAndLastColumns, eSpeedlineDecompBuffer, 0x500);
        } else {
            DmaFill16(3, 0, BG_CHAR_ADDR(1) + (0x9D80 >> is4bpp), 0x40);
        }
        src = gBG3MapBuffer;
        dst = BG_SCREEN_ADDR(31);
        DmaCopy16(3, src, dst, 0x800);
        DmaCopy16(3, tiles, BG_CHAR_ADDR(1), 0x9600 >> is4bpp);
    } else if(arg1 & 0xC) {
        if(arg1 & 0x40) {
            if(arg1 & 0x4) {
                tiles += 0x9600 >> is4bpp;
                main->Bg256_next_line = 18;
                main->Bg256_pos_y = 160;
            } else {
                tiles -= 0x4B00 >> is4bpp;
                main->Bg256_next_line = 8;
                main->Bg256_pos_y = 80;
            }
            DmaCopy16(3, tiles, BG_CHAR_ADDR(1), 0x9600 >> is4bpp);
            tiles = eBGDecompBuffer + ((main->Bg256_next_line * 0x780) >> is4bpp);
            tiles += 0x780 >> is4bpp;
            DmaCopy16(3, tiles, BG_CHAR_ADDR(1) + (0x9600 >> is4bpp), 0x780 >> is4bpp);
            main->Bg256_buff_pos = 19;
            main->Bg256_stop_line = 38;
            for(i = 0; i < 20; i++) {
                for(j = 0; j < 30; j++) {
                    gBG3MapBuffer[i*32+32+j+1] = (j + i * 30) | 0x2000;
                }
            }
        } else {
            //_08004590
            DmaCopy16(3, tiles, BG_CHAR_ADDR(1), 0x9D80 >> is4bpp);
            main->Bg256_pos_y = 0;
            main->Bg256_buff_pos = 0;
            main->Bg256_next_line = 21;
            if(arg1 & 0x4) {
                main->Bg256_stop_line = 1;
            } else {
                main->Bg256_stop_line = 32;
            }
            for(i = 0; i < 20; i++) {
                for(j = 0; j < 30; j++) {
                    gBG3MapBuffer[i*32+32+j+1] = (j + i * 30) | 0x2000;
                }
            }
        }
        for(i = 0; i < 2; i++) {
            for(j = 0; j < 30; j++) {
                gBG3MapBuffer[i*0x2A0+j+1] = (600 + j) | 0x2000;
            }
        }
        src = gBG3MapBuffer;
        dst = BG_SCREEN_ADDR(31);
        DmaCopy16(3, src, dst, 0x800);
    } else {
        u32 r5 = arg1 & 1 ? 0xF00 : 0xB40;
        if (arg1 & 0x10) {
            main->Bg256_buff_pos = 30;
            main->Bg256_stop_line = 58;
            if (arg1 & 1) {
                tiles += 0x740 >> is4bpp;
                main->Bg256_next_line = 28;
                main->Bg256_pos_x = 240;
            } else {
                tiles += 0x380 >> is4bpp;
                gMain.Bg256_next_line = 0xD;
                main->Bg256_pos_x = 120;
            }
            for(i = 0; i < 20; i++) {
                for(j = 0; j < 31; j++) {
                    gBG3MapBuffer[i*32+32+j] = (j + i * 31) | 0x2000;
                }
            }
        } else { 
            if (arg1 & 0x20) {
                main->Bg256_next_line = 0x1F;
                main->Bg256_pos_x = 0;
                main->Bg256_buff_pos = 0;
                if (arg1 & 1) {
                    main->Bg256_stop_line = 1;
                } else {
                    main->Bg256_stop_line = 0x2E;
                }
                for(i = 0; i < 20; i++) {
                    for(j = 0; j < 31; j++) {
                        gBG3MapBuffer[i*32+32+j+1] = (j + i * 31) | 0x2000;
                    }
                }
            }
        }
        for(i = 0; i < 2; i++) {
            for(j = 0; j < 32; j++) {
                gBG3MapBuffer[i*0x2A0+j] = 0x2276;
            }
        }
        arg1 = (intptr_t)BG_CHAR_ADDR(1); // ! why
        for(i = 0; i < 20; i++) {
            DmaCopy16(3, tiles, arg1, 0x7C0 >> is4bpp);
            tiles += r5 >> is4bpp;
            arg1 += 0x7C0 >> is4bpp;
        }
        src = gBG3MapBuffer;
        dst = BG_SCREEN_ADDR(31);
        DmaCopy16(3, src, dst, 0x800);
        DmaFill16(3, 0, BG_CHAR_ADDR(1) + (0x9D80 >> is4bpp), 0x40);
    }
}

void sub_800482C(u32 arg0)
{
    struct Main * main = &gMain;
    struct ScriptContext * scriptCtx = &gScriptContext;
    u32 flags;
    u8 * data;
    if (scriptCtx->unk1E & 4) {
        main->tilemapUpdateBits &= ~4;
        if (arg0 == 0x81) {
            DmaFill16(3, 0, gBG2MapBuffer, 0x20);
            scriptCtx->unk30[4] = 0;
            return;
        }
        flags = gBackgroundTable[arg0].controlBits;
        data = gBackgroundTable[arg0].bgData + 0x28;
        if (flags & 0x80000000) {
            DmaCopy16(3, data, gBG2MapBuffer, 0x20);
            scriptCtx->unk30[4] = 0;
        } else {
            DmaCopy16(3, data, gBG2MapBuffer, 0x200);
            scriptCtx->unk30[4] = 1;
        }
        scriptCtx->unk30[7] = 0;
        scriptCtx->unk30[6] = 0;
        scriptCtx->unk30[5] = 0;
    } else {
        main->tilemapUpdateBits &= ~1;
        if (arg0 == 0x81) {
            DmaFill16(3, 0, gBG0MapBuffer, 0x20);
            scriptCtx->unk30[4] = 0;
            return;
        }
        flags = gBackgroundTable[arg0].controlBits;
        data = gBackgroundTable[arg0].bgData + 0x28;
        if (flags & 0x80000000) {
            DmaCopy16(3, data, gBG0MapBuffer, 0x20);
            scriptCtx->unk30[4] = 0;
        } else {
            DmaCopy16(3, data, gBG0MapBuffer, 0x200);
            scriptCtx->unk30[4] = 1;
        }
        scriptCtx->unk30[7] = 0;
        scriptCtx->unk30[6] = 0;
        scriptCtx->unk30[5] = 0;
    }
}

void sub_8004940(u32 arg0, u32 arg1) // Bg256_set_ex
{
    s32 temp_r1;
    s32 temp_r2;
    s32 temp_r3;

    temp_r2 = arg1 & 0xF0;
    temp_r3 = arg0;
    temp_r1 = gBackgroundTable[arg0].controlBits;
    if (temp_r1 & 0x40) {
        if(temp_r2 & 0x80) {
            temp_r3 |= 0x8000;
        }
    } else if (temp_r1 & 0x80) {
        if(temp_r2 & 0x40) {
            temp_r3 |= 0x8000;
        }
    } else if (temp_r1 & 0x10) {
        if(temp_r2 & 0x20) {
            temp_r3 |= 0x8000;
        }
    } else if (temp_r1 & 0x20) {   
        if(temp_r2 & 0x10) {
            temp_r3 |= 0x8000;
        }
    }
    CopyBGDataToVram(temp_r3);
}

void CopyBGDataToVram(u32 bgId)
{
    void * dst;
    const void * src;
    u8 * tempPtr;
    u8 * bgData;
    bool32 is4bpp;
    u32 tempBgCtrl;
    u32 tempSize;
    u32 i, j;
    u32 sp4;
    u32 swap;
    
    struct Main *main = &gMain;
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct IORegisters *ioReg = &gIORegisters;
    
    if(scriptCtx->unk1E & 2)
        return;

    if(bgId == 0x11) {
        if(main->unk3D & 1)
            EnableDetentionCenterMask(FALSE);
        else
            EnableDetentionCenterMask(TRUE);
    } else if(bgId != 0x2a && bgId != 0x14) {
        u32 a = gMain.unk3D & ~1;
        gMain.unk3D = a;
        EnableDetentionCenterMask(FALSE);
    }

    if(scriptCtx->unk30[7] == 0xFFFF || gMain.process[GAME_PROCESS] != INVESTIGATION_PROCESS)
        sub_8004218(bgId);

    if((main->unk3D & 4) && sub_800407C(bgId))
        return;

    if(bgId == 0xe && !(main->unk3D & 4))
    {
        DmaCopy16(3, gGfxSpeedlinesFirstAndLastColumns, eSpeedlineDecompBuffer, 0x500);
        src = eSpeedlineDecompBuffer;
        dst = (void *)VRAM + 0x8B00;
        DmaCopy16(3, src, dst, 0x5000);
    }
    else
    {
        MoveAnimationTilesToRam(FALSE);
        MoveSpritesToOAM();
    }

    tempBgCtrl = bgId;
    bgId &= ~0x8000u;
    ioReg->lcd_bg3vofs = 8;
    ioReg->lcd_bg3hofs = 8;
    main->isBGScrolling = FALSE;
    main->Bg256_pos_x = 0;
    main->Bg256_pos_y = 0;
    main->currentBG = bgId;
    main->currentDisplayBG = bgId;

    if(bgId == 0x81)
    {
        src = gMapSpeedlines;
        dst = gBG3MapBuffer;
        DmaCopy16(3, src, dst, sizeof(gMapSpeedlines));
        if(main->effectType == 0xFFFE) {
            DmaFill16(3, 0x1f, (void *)(BG_PLTT + 0x40), 0x1C0);
            DmaFill16(3, 0x2222, BG_CHAR_ADDR(1), 0x9600);
        }
        else {
            DmaFill16(3, 0, (void *)(BG_PLTT + 0x40), 0x1C0);
            DmaFill16(3, 0x2222, BG_CHAR_ADDR(1), 0x9600);
        }
        return;
    }

    if(tempBgCtrl & 0x8000)
    {
        tempBgCtrl = gBackgroundTable[bgId].controlBits;
        if(tempBgCtrl & BG_MODE_VSCROLL_TOP)
        {
            tempBgCtrl &= ~BG_MODE_VSCROLL_TOP;
            tempBgCtrl |= BG_MODE_VSCROLL_DOWN;
        }
        else if(tempBgCtrl & BG_MODE_VSCROLL_DOWN)
        {
            tempBgCtrl &= ~BG_MODE_VSCROLL_DOWN;
            tempBgCtrl |= BG_MODE_VSCROLL_TOP;
        }
        else if(tempBgCtrl & BG_MODE_HSCROLL_RIGHT)
        {
            tempBgCtrl &= ~BG_MODE_HSCROLL_RIGHT;
            tempBgCtrl |= BG_MODE_HSCROLL_LEFT;
        }
        else if(tempBgCtrl & BG_MODE_HSCROLL_LEFT)
        {
            tempBgCtrl &= ~BG_MODE_HSCROLL_LEFT;
            tempBgCtrl |= BG_MODE_HSCROLL_RIGHT;
        }
    }
    else
        tempBgCtrl = gBackgroundTable[bgId].controlBits;

    sp4 = tempBgCtrl;
    
    bgData = gBackgroundTable[bgId].bgData + 0x28;
    if(sp4 & BG_MODE_4BPP)
    {
        is4bpp = TRUE;
        ioReg->lcd_bg3cnt &= ~BGCNT_256COLOR;
        if((main->unk3D & 2) && bgId == 0xe)
        {
            if(main->unk3D & 4)
            {
                DmaCopy16(3, bgData, (void *)(BG_PLTT + 0x40), 0x20);
            }
        }
        else
        {
            u32 a = main->unk3D & ~2;
            main->unk3D = a;
            DmaFill16(3, 0, (void *)(VRAM + 0x8EC0), 0x20);
            if(scriptCtx->unk1E & 1)
            {
                scriptCtx->unk1E &= ~1;
                for(i = 0; i < 16; i++)
                    ((u16 *)(BG_PLTT + 0x40))[i] = ColorFadeGrayscale(((u16 *)bgData)[i], 0x1f, 0);
            }
            else
            {
                DmaCopy16(3, bgData, (void *)(BG_PLTT + 0x40), 0x20);
            }
        }
    }
    else
    {
        is4bpp = FALSE;
        ioReg->lcd_bg3cnt |= BGCNT_256COLOR;
        if(bgId != 0x14)
        {
            if(scriptCtx->unk1E & 1)
            {
                scriptCtx->unk1E &= ~1;
                for(i = 32; i < 256; i++)
                    ((u16 *)(BG_PLTT + 0x00))[i] = ColorFadeGrayscale(((u16 *)bgData)[i], 0x1f, 0);
            }
            else
            {
                DmaCopy16(3, bgData, (void *)BG_PLTT, 0x200);
            }
        } else {   
            DmaCopy16(3, bgData + 0x40, (void *)(BG_PLTT + 0x40), 0x1C0);
        }
    }

    *(u16 *)REG_ADDR_DISPCNT = ioReg->lcd_dispcnt;
    *(u16 *)REG_ADDR_BG3CNT = ioReg->lcd_bg3cnt;
    *(u32 *)REG_ADDR_BG3HOFS = *(u32 *)&ioReg->lcd_bg3hofs;

    if(gMain.unk258)
        tempBgCtrl = main->Bg256_dir;
    main->Bg256_dir = tempBgCtrl;

    bgData = eBGDecompBuffer;
    {
        // ! Why
        int a = 0x3F;
        int b = 0x3E;
        if((bgId > a) || (bgId < b)) {
            sub_8004390(bgData, tempBgCtrl, is4bpp);
        }
    }
    
    if(sp4 & 0x100)
    {
        for(i = 0; i < 0x400; i++)
            gBG3MapBuffer[i] |= 0x400;
        for(i = 0; i < 32; i++)
        {
            for(j = 0; j < 16; j++)
            {
                swap = gBG3MapBuffer[i * 32 + j];
                gBG3MapBuffer[i * 32 + j] = gBG3MapBuffer[i * 32 + (31 - j)];
                gBG3MapBuffer[i * 32 + (31 - j)] = swap;
            }
        }
        src = gBG3MapBuffer;
        dst = BG_SCREEN_ADDR(31);
        DmaCopy16(3, src, dst, BG_SCREEN_SIZE);
    }

    if(sp4 & 0x200)
    {
        for(i = 0; i < 0x400; i++)
            gBG3MapBuffer[i] |= 0x800;
        for(i = 0; i <= 10; i++)
        {
            for(j = 0; j <= 31; j++)
            {
                swap = gBG3MapBuffer[i * 32 + j];
                gBG3MapBuffer[i * 32 + j] = gBG3MapBuffer[(21 - i) * 32 + j];
                gBG3MapBuffer[(21 - i) * 32 + j] = swap;
            }
        }
        src = gBG3MapBuffer;
        dst = BG_SCREEN_ADDR(31);
        DmaCopy16(3, src, dst, BG_SCREEN_SIZE);
    }

    if(!(main->process[GAME_PROCESS] == COURT_RECORD_PROCESS && main->process[GAME_PROCESS_STATE] == 0x5) || main->process[GAME_PROCESS_VAR1] == 0x4)
    {
        if(main->effectType == 0xFFFD || main->effectType == 0xFFFE)
        {
            if(main->effectType == 0xFFFE)
                LoadAndAdjustBGPaletteByMode(main->currentBG, 0x20, 1);
            else
                LoadAndAdjustBGPaletteByMode(main->currentBG, 0x20, 0);
            if(main->currentBG == 1 || main->currentBG == 2 || main->currentBG == 3)
            {
                if(main->effectType == 0xFFFE)
                    LoadAndAdjustCounselWitnessBenchPaletteByMode(main->currentBG, 0x20, 1);
                else
                    LoadAndAdjustCounselWitnessBenchPaletteByMode(main->currentBG, 0x20, 0);
            }
        }
    }

    if(main->unk3D & 8)
    {
        LoadAndAdjustBGPaletteSepia(main->currentBG, 0x20, 0);
        if(main->currentBG == 1 || main->currentBG == 2 || main->currentBG == 3)
            LoadAndAdjustCounselWitnessBenchPaletteSepia(main->currentBG, 0x20, 0);
    }

    if((main->unk3D & 0x40) && main->currentBG == 6)
        LoadAndAdjustBGPaletteGreenTint(main->currentBG, 0x20, 0);
}

void CopyBGDataToVramAndScrollBG(u32 bgId)
{
    struct Main * main = &gMain;
    u16 sp0 = main->previousBG;
    bool32 r8 = main->isBGScrolling;
    u16 sl = main->Bg256_pos_x;
    u16 spC = main->Bg256_pos_y;
    u8 r6 = main->horizontolBGScrollSpeed;
    u8 r5 = main->verticalBGScrollSpeed;
    s16 sp1C = main->Bg256_dir;
    s16 sp18 = main->Bg256_dir;
    u32 unk0;
    if (main->unk52) {
        main->unk258 = (main->unk52 & 0xFF00) >> 8;
        DecompressBackgroundIntoBuffer(main->unk52 & 0xFF);
        main->unk258 = 0;
    }
    CheckBGChange_iOS(bgId, 0);
    CopyBGDataToVram(bgId);
    main->previousBG = sp0;
    main->isBGScrolling = r8;
    main->horizontolBGScrollSpeed = r6;
    main->verticalBGScrollSpeed = r5;
    main->Bg256_scroll_x = main->Bg256_pos_x - sl;
    main->Bg256_scroll_y = main->Bg256_pos_y - spC;
    unk0 = gBackgroundTable[main->currentBG].controlBits;
    if(unk0 & BG_MODE_SPECIAL_SPEEDLINE)
        return;
    unk0 &= BG_MODE_4BPP;
    if(main->Bg256_scroll_x < 0)
    {
        main->Bg256_dir = sp18;
        main->Bg256_pos_x = sl;
        main->Bg256_scroll_x *= -1;
        if(gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_480x160)
            unk0 |= 480;
        else
            unk0 |= 360;
        sub_8002E80(main, unk0);
    }
    else if(main->Bg256_scroll_x > 0)
    {
        main->Bg256_dir = sp1C;
        main->Bg256_pos_x = sl;
        main->Bg256_scroll_x *= -1;
        if(gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_480x160)
            unk0 |= 480;
        else
            unk0 |= 360;
        sub_80030EC(main, unk0);
    }
    else if(main->Bg256_scroll_y > 0)
    {
        main->Bg256_pos_y = spC;
        main->Bg256_scroll_y *= -1;
        if(gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_240x320)
            unk0 |= 320;
        else
            unk0 |= 240;
        bg256_down_scroll(main, unk0);
    }
    else if(main->Bg256_scroll_y < 0)
    {
        main->Bg256_pos_y = spC;
        main->Bg256_scroll_y *= -1;
        if(gBackgroundTable[main->currentBG].controlBits & BG_MODE_SIZE_240x320)
            unk0 |= 320;
        else
            unk0 |= 240;
        bg256_up_scroll(main, unk0);
    }
}

u32 GetBGControlBits(u32 bgId)
{
    return gBackgroundTable[bgId].controlBits;
}

u8 * GetBGPalettePtr(u32 bgId)
{
    return gBackgroundTable[bgId].bgData + 0x28;
}

void SetTextboxSize(u32 arg0)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    u16 * map;
    u32 i;
    switch(arg0)
    {
    case 0:
        map = gBG1MapBuffer;
        for(i = 0; i < 0x2C0; i++, map++)
        {
            *map = gTextboxTiles[i];
        }
        scriptCtx->textboxState = 0;
        SetTextboxNametag(gScriptContext.textboxNameId & 0x7F, (u8)(gScriptContext.textboxNameId & 0x80));
        break;
    case 1:
        scriptCtx->textboxYPos = 14;
        scriptCtx->textboxState = 2;
        SetTextboxNametag(0, FALSE);
        break;
    case 2:
        map = gBG1MapBuffer;
        for(i = 0; i < 0x1C0; i++, map++)
        {
            *map = gTextboxTiles[i];
        }
        map = gBG1MapBuffer + 0x1C0;
        for(i = 0x1C0; i < 0x220; i++, map++)
        {
            *map = 0;
        }
        map = gBG1MapBuffer + 0x200;
        for(i = 0x1C0; i < 0x1E0; i++, map++)
        {
            *map = gTextboxTiles[i];
        }
        scriptCtx->textboxState = 0;
        break;
    default:
        break;
    }
}

void UpdateTextbox()
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    u32 tiley;
    u32 i;
    switch(scriptCtx->textboxState)
    {
    case 0:
        break;
    case 1:
        gMain.showTextboxCharacters = FALSE; 
        break;
    case 2:
        tiley = scriptCtx->textboxYPos * 32;
        for(i = 0; i < 32; i++)
        {
            u16 * dest = &gBG1MapBuffer[tiley - 32 + i];
            u16 * src = &gBG1MapBuffer[tiley + i];
            *dest = *src;
        }
        for(i = 0; i < 32; i++)
        {
            u16 * dest = &gBG1MapBuffer[tiley + i];
            u16 * src = &gBG1MapBuffer[tiley + 32 + i];
            *dest = *src;
        }
        scriptCtx->textboxYPos--;
        if(scriptCtx->textboxYPos == 0)
        {
            gMain.showTextboxCharacters = TRUE;
            scriptCtx->textboxState = 0;
        }
        break;
    case 3:
        gIORegisters.lcd_bg1vofs += 4;
        if(gIORegisters.lcd_bg1vofs < (u16)-80u)
        {
            gMain.advanceScriptContext = TRUE;
            gMain.showTextboxCharacters = TRUE;
            gIORegisters.lcd_bg1vofs = 0;
            scriptCtx->textboxState = 0;
        }
        break;
    case 4:
        gIORegisters.lcd_bg1vofs -= 4;
        if(gIORegisters.lcd_bg1vofs < (u16)-80u)
        {
            gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
            scriptCtx->textboxState = 1;
        }
        break;
    }
}

void CopyTextboxTilesToBG1MapBuffer()
{
    s32 i;
    for(i = 0x1C0; i < 0x3C0; i++) {
        gBG1MapBuffer[i] = gTextboxTiles[i];
    }
}

void SlideTextbox(u32 slideUp)
{
    gMain.advanceScriptContext = 0;
    gMain.showTextboxCharacters = 0;
    CopyTextboxTilesToBG1MapBuffer();
    SetTextboxNametag(0, FALSE);
    if(slideUp == 1)
    {
        gScriptContext.textboxState = 3;
        gInvestigation.actionState = 3;
        gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
        gBG1MapBuffer[622] = 9;
        gBG1MapBuffer[623] = 9;
    }
    else if(slideUp == 2) {
        gScriptContext.textboxState = 3;
        gInvestigation.actionState = 3;
    }
    else
    {
        gScriptContext.textboxState = 4;
        gInvestigation.actionState = 1;
    }
}

u16 ColorFadeSepia(u16 color, u16 intensity, u16 mode)
{
    u16 r;
    u16 g;
    u16 b;
    u32 Y;
    s16 ro;
    s16 go;
    s16 bo;
    u32 i_inverse;
    u16 outColor;

    r = (color & 0x1F);
    g = ((color & 0x3E0) >> 5);
    b = ((color & 0x7C00) >> 10);
    if (intensity > 0x20) {
        intensity = 0x20;
    }
    r <<= 3;
    g <<= 3;
    b <<= 3;
    // ITU-R BT.601 Luminance * 1024
    Y = (r * 306) + (g * 601) + (b * 117);
    
    ro = ((Y * 147) >> 7) / 1024;
    go = ((Y * 134) >> 7) / 1024;
    bo = ((Y * 115) >> 7) / 1024;
    if (ro > 0xFF) {
        ro = 0xFF;
    }
    if (go > 0xFF) {
        go = 0xFF;
    }
    if (bo > 0xFF) {
        bo = 0xFF;
    }
    i_inverse = 0x20 - intensity;
    r = ((r * i_inverse) + (ro * intensity)) / 256;
    g = ((g * i_inverse) + (go * intensity)) / 256;
    b = ((b * i_inverse) + (bo * intensity)) / 256;
    r &= 0x1F;
    g &= 0x1F;
    b &= 0x1F;
    outColor = b << 10;
    outColor |= g << 5;
    outColor |= r;
    return outColor;
}

u16 ColorFadeGrayscale(u16 color, u16 intensity, u16 mode)
{
    u16 r;
    u16 g;
    u16 b;
    u32 Y;
    s16 ro;
    s16 go;
    s16 bo;
    u32 i_inverse;
    u16 outColor;

    r = (color & 0x1F);
    g = ((color & 0x3E0) >> 5);
    b = ((color & 0x7C00) >> 10);
    if (intensity > 0x20) {
        intensity = 0x20;
    }
    r <<= 3;
    g <<= 3;
    b <<= 3;
    // ITU-R BT.601 Luminance * 1024
    Y = (r * 306) + (g * 601) + (b * 117);
    ro = Y / 1024;
    go = Y / 1024;
    bo = Y / 1024;
    if (ro > 0xFF) {
        ro = 0xFF;
    }
    if (go > 0xFF) {
        go = 0xFF;
    }
    if (bo > 0xFF) {
        bo = 0xFF;
    }
    i_inverse = 0x20 - intensity;
    r = ((r * i_inverse) + (ro * intensity)) / 256;
    g = ((g * i_inverse) + (go * intensity)) / 256;
    b = ((b * i_inverse) + (bo * intensity)) / 256;
    r &= 0x1F;
    g &= 0x1F;
    b &= 0x1F;
    outColor = b << 10;
    outColor |= g << 5;
    outColor |= r;
    return outColor;
}

u16 ColorFadeGreen(u16 color, u16 intensity, u16 mode)
{
    u16 r;
    u16 g;
    u16 b;
    u32 Y;
    s16 ro;
    s16 go;
    s16 bo;
    u32 i_inverse;
    u16 outColor;

    r = (color & 0x1F);
    g = ((color & 0x3E0) >> 5);
    b = ((color & 0x7C00) >> 10);
    if (intensity > 0x20) {
        intensity = 0x20;
    }
    r <<= 3;
    g <<= 3;
    b <<= 3;
    // ITU-R BT.601 Luminance * 1024
    Y = (r * 306) + (g * 601) + (b * 117);
    ro = ((Y * 64) >> 7) / 1024;
    go = ((Y * 96) >> 7) / 1024;
    bo = ((Y * 64) >> 7) / 1024;
    if (ro > 0xFF) {
        ro = 0xFF;
    }
    if (go > 0xFF) {
        go = 0xFF;
    }
    if (bo > 0xFF) {
        bo = 0xFF;
    }
    i_inverse = 0x20 - intensity;
    r = ((r * i_inverse) + (ro * intensity)) / 256;
    g = ((g * i_inverse) + (go * intensity)) / 256;
    b = ((b * i_inverse) + (bo * intensity)) / 256;
    r &= 0x1F;
    g &= 0x1F;
    b &= 0x1F;
    outColor = b << 10;
    outColor |= g << 5;
    outColor |= r;
    return outColor;
}

u16 ColorFadeGreen2(u16 color, u16 intensity, u16 mode)
{
    u16 r;
    u16 g;
    u16 b;
    u32 Y;
    s16 ro;
    s16 go;
    s16 bo;
    u32 i_inverse;
    u16 outColor;

    r = (color & 0x1F);
    g = ((color & 0x3E0) >> 5);
    b = ((color & 0x7C00) >> 10);
    if (intensity > 0x20) {
        intensity = 0x20;
    }
    r <<= 3;
    g <<= 3;
    b <<= 3;
    // ITU-R BT.601 Luminance * 1024
    Y = (r * 306) + (g * 601) + (b * 117);
    ro = ((Y * 64) >> 7) / 1024;
    go = ((Y * 96) >> 7) / 1024;
    bo = ((Y * 64) >> 7) / 1024;
    if (ro > 0xFF) {
        ro = 0xFF;
    }
    if (go > 0xFF) {
        go = 0xFF;
    }
    if (bo > 0xFF) {
        bo = 0xFF;
    }
    i_inverse = 0x20 - intensity;
    r = ((r * i_inverse) + (ro * intensity)) / 256;
    g = ((g * i_inverse) + (go * intensity)) / 256;
    b = ((b * i_inverse) + (bo * intensity)) / 256;
    r &= 0x1F;
    g &= 0x1F;
    b &= 0x1F;
    outColor = b << 10;
    outColor |= g << 5;
    outColor |= r;
    return outColor;
}

void LoadAndAdjustBGPaletteByMode(u16 bgId, u16 intensity, u16 mode)
{
    u16 pal[0x100];
    u32 i;
    if(bgId == 0x81) {
        for(i = 0x20; i < 0x100; i++) {
            pal[i] = 0;
            pal[i] = ColorFadeGrayscale(pal[i], intensity, mode);
        }
        DmaCopy16(3, pal+0x20, PLTT+0x40, 0x1C0);
    } else {
        u32 bits = GetBGControlBits(bgId);
        u16 * bgpal = (u16 *)GetBGPalettePtr(bgId);
        if(bits & 0x80000000) {
            // 4bpp
            DmaCopy16(3, bgpal, pal, 0x20);
            for(i = 0; i < 0x10; i++) {
                pal[i] = ColorFadeGrayscale(pal[i], intensity, mode);
            }
            DmaCopy16(3, pal, PLTT+0x40, 0x20);
        } else {
            // 8bpp
            DmaCopy16(3, bgpal, pal, 0x200);
            for(i = 0x20; i < 0x100; i++) {
                pal[i] = ColorFadeGrayscale(pal[i], intensity, mode);
            }
            DmaCopy16(3, pal+0x20, PLTT+0x40, 0x1C0);
        }
    }
}

void LoadAndAdjustCurrentAnimation01PaletteByMode(u16 intensity, u16 mode) {
    u16 pal[0x30];
    u32 * gfx = (u32*)gAnimation[1].animationInfo.animGfxDataStartPtr;
    u32 paletteCount = *(u16*)gfx;
    s32 i;
    gfx++;
    DmaCopy16(3, gfx, pal, 0x40);
    for(i = 0; i < paletteCount*16; i++) {
        pal[i] = ColorFadeGrayscale(pal[i], intensity, mode);
    }
    if(paletteCount == 3) {
        DmaCopy16(3, pal, OBJ_PLTT+0x1A0, 0x60);
    } else {
        DmaCopy16(3, pal, OBJ_PLTT+0x1C0, paletteCount*0x20);
    }
}

void LoadAndAdjustCounselWitnessBenchPaletteByMode(u16 bgId, u16 intensity, u16 mode)
{
    u16 pal[0x10];
    u16 * benchpal;
    u32 i;
    benchpal = bgId > 0 && bgId < 3 ? (u16*)gPalCounselBench : (u16*)gPalWitnessBench;
    DmaCopy16(3, benchpal, pal, 0x20);
    for(i = 0; i < 0x10; i++) {
        pal[i] = ColorFadeGrayscale(pal[i], intensity, mode);
    }
    DmaCopy16(3, pal, OBJ_PLTT+0x140, 0x20);
}

void LoadAndAdjustAnimation10PaletteByMode(u16 intensity, u16 mode)
{
}

void LoadAndAdjustBGPaletteSepia(u16 bgId, u16 intensity, u16 mode)
{
    u16 pal[0x100];
    u32 i;
    if(bgId == 0x81) {
        for(i = 0x20; i < 0x100; i++) {
            pal[i] = 0;
            pal[i] = ColorFadeSepia(pal[i], intensity, mode);
        }
        DmaCopy16(3, pal+0x20, PLTT+0x40, 0x1C0);
    } else {
        u32 bits = GetBGControlBits(bgId);
        u16 * bgpal = (u16 *)GetBGPalettePtr(bgId);
        if(bits & 0x80000000) {
            // 4bpp
            DmaCopy16(3, bgpal, pal, 0x20);
            for(i = 0; i < 0x10; i++) {
                pal[i] = ColorFadeSepia(pal[i], intensity, mode);
            }
            DmaCopy16(3, pal, PLTT+0x40, 0x20);
        } else {
            // 8bpp
            DmaCopy16(3, bgpal, pal, 0x200);
            for(i = 0x20; i < 0x100; i++) {
                pal[i] = ColorFadeSepia(pal[i], intensity, mode);
            }
            DmaCopy16(3, pal+0x20, PLTT+0x40, 0x1C0);
        }
    }
}

void LoadAndAdjustBGPaletteGreenTint(u16 bgId, u16 intensity, u16 mode)
{
    u16 pal[0x100];
    u32 i;
    if(bgId == 0x81) {
        for(i = 0x20; i < 0x100; i++) {
            pal[i] = 0;
            pal[i] = ColorFadeSepia(pal[i], intensity, mode);
        }
        DmaCopy16(3, pal+0x20, PLTT+0x40, 0x1C0);
    } else {
        u32 bits = GetBGControlBits(bgId);
        u16 * bgpal = (u16 *)GetBGPalettePtr(bgId);
        if(bits & 0x80000000) {
            // 4bpp
            DmaCopy16(3, bgpal, pal, 0x20);
            for(i = 0; i < 0x10; i++) {
                pal[i] = ColorFadeGreen(pal[i], intensity, mode);
            }
            DmaCopy16(3, pal, PLTT+0x40, 0x20);
        } else {
            // 8bpp
            DmaCopy16(3, bgpal, pal, 0x200);
            for(i = 0x20; i < 0x100; i++) {
                pal[i] = ColorFadeGreen(pal[i], intensity, mode);
            }
            DmaCopy16(3, pal+0x20, PLTT+0x40, 0x1C0);
        }
    }
}

void LoadAndAdjustCurrentAnimation01PaletteSepia(u16 intensity, u16 mode) {
    u16 pal[0x30];
    u32 * gfx = (u32*)gAnimation[1].animationInfo.animGfxDataStartPtr;
    u32 paletteCount = *(u32*)gfx;
    s32 i;
    gfx++;
    do{
    DmaCopy16(3, gfx, pal, 0x40);
    }while(0);
    for(i = 0; i < paletteCount*16; i++) {
        pal[i] = ColorFadeSepia(pal[i], intensity, mode);
    }
    if(paletteCount == 3) {
        DmaCopy16(3, pal, OBJ_PLTT+0x1A0, 0x60);
    } else {
        DmaCopy16(3, pal, OBJ_PLTT+0x1C0, paletteCount*0x20);
    }
}

void LoadAndAdjustCounselWitnessBenchPaletteSepia(u16 bgId, u16 intensity, u16 mode)
{
    u16 pal[0x10];
    u16 * benchpal;
    u32 i;
    benchpal = bgId > 0 && bgId < 3 ? (u16*)gPalCounselBench : (u16*)gPalWitnessBench;
    DmaCopy16(3, benchpal, pal, 0x20);
    for(i = 0; i < 0x10; i++) {
        pal[i] = ColorFadeSepia(pal[i], intensity, mode);
    }
    DmaCopy16(3, pal, OBJ_PLTT+0x140, 0x20);
}

void nullsub_3(u16 intensity, u16 mode) {
}

void SlideInBG2Window(u32 mode, u32 speed)
{
    struct CourtRecord * courtRecord = &gCourtRecord;
    if(mode > 4) // is for save screens
    {
        courtRecord->windowIsSaveScreen = TRUE;
        mode -= 4;
    }
    else
    {
        courtRecord->windowIsSaveScreen = FALSE;
    }
    courtRecord->windowMode = mode;
    courtRecord->windowOffset = 0;
    courtRecord->windowPrevX = courtRecord->windowX;
    courtRecord->flags &= ~0x4;
    switch(mode)
    {
    case 0:
        break;
    case 1:
        courtRecord->windowScrollSpeed = speed;
        courtRecord->windowTileX = 0;
        courtRecord->windowX = 0x100;
        break;
    case 2:
        courtRecord->windowScrollSpeed = -speed;
        courtRecord->windowTileX = 31;
        courtRecord->windowX = 0x110;
        break;
    case 3:
        courtRecord->windowScrollSpeed = speed;
        break;
    case 4:
        courtRecord->windowScrollSpeed = -speed;
        break;
    default:
        break;
    }
}

// St_bg2_main00
void WindowDummy(struct CourtRecord * courtRecord)
{

}

// St_bg2_main01
void ScrollWindowWithPrevWindow(struct CourtRecord * courtRecord)
{
    u32 i;
    courtRecord->windowOffset += courtRecord->windowScrollSpeed;
    courtRecord->windowX -= courtRecord->windowScrollSpeed;
    courtRecord->windowX &= 0x1FF;
    courtRecord->windowPrevX -= courtRecord->windowScrollSpeed;
    courtRecord->windowPrevX &= 0x1FF;
    while(courtRecord->windowOffset >= 8)
    {
        courtRecord->windowOffset -= 8;
        courtRecord->windowTileX++;
        courtRecord->windowTileX &= 0x1F;
        if(courtRecord->windowTileX == 0x1F)
        {
            courtRecord->windowOffset = 0;
            courtRecord->windowScrollSpeed = 0;
            courtRecord->windowX = 8;
        }
        for(i = 2; i < 12; i++)
        {
            DmaCopy16(3, &gBG2MapBuffer[i*0x20], gTilemapBuffer, 0x40);
            DmaCopy16(3, gTilemapBuffer+1, &gBG2MapBuffer[i*0x20], 0x3E);
        }
        if(courtRecord->windowIsSaveScreen)
        {
            for(i = 0x40; i < 0x180; i += 0x20)
            {
                gBG2MapBuffer[i + 31] = gMapCourtRecordSaveWindow[courtRecord->windowTileX + i];
            }
        }
        else
        {
            for(i = 0x40; i < 0x180; i += 0x20)
            {
                gBG2MapBuffer[i + 31] = gMapCourtRecordNormalWindow[courtRecord->windowTileX + i];
            }
        }
    }
    while(courtRecord->windowOffset <= -8)
    {
        courtRecord->windowOffset += 8;
        courtRecord->windowTileX--;
        courtRecord->windowTileX &= 0x1F;
        if(courtRecord->windowTileX == 0)
        {
            courtRecord->windowOffset = 0;
            courtRecord->windowScrollSpeed = 0;
            courtRecord->windowX = 8;
        }
        for(i = 2; i < 12; i++)
        {
            DmaCopy16(3, &gBG2MapBuffer[i*0x20], gTilemapBuffer, 0x40);
            DmaCopy16(3, gTilemapBuffer, &gBG2MapBuffer[i*0x20+1], 0x3E);
        }
        if(courtRecord->windowIsSaveScreen)
        {
            for(i = 0x40; i < 0x180; i += 0x20)
            {
                gBG2MapBuffer[i] = gMapCourtRecordSaveWindow[courtRecord->windowTileX + i];
            }
        }
        else
        {
            for(i = 0x40; i < 0x180; i += 0x20)
            {
                gBG2MapBuffer[i] = gMapCourtRecordNormalWindow[courtRecord->windowTileX + i];
            }
        }
    }
}

// St_bg2_main02
void ScrollWindowWithoutPrevWindow(struct CourtRecord * courtRecord)
{
    u32 i;
    courtRecord->windowOffset += courtRecord->windowScrollSpeed;
    courtRecord->windowX -= courtRecord->windowScrollSpeed;
    courtRecord->windowX &= 0x1FF;
    while(courtRecord->windowOffset >= 8)
    {
        courtRecord->windowOffset -= 8;
        courtRecord->windowTileX++;
        courtRecord->windowTileX &= 0x1F;
        if(courtRecord->windowTileX == 0x1F)
        {
            courtRecord->windowOffset = 0;
            courtRecord->windowScrollSpeed = 0;
        }
        for(i = 2; i < 12; i++)
        {
            DmaCopy16(3, &gBG2MapBuffer[i*0x20], gTilemapBuffer, 0x40);
            DmaCopy16(3, gTilemapBuffer+1, &gBG2MapBuffer[i*0x20], 0x3E);
        }
        for(i = 0x40; i < 0x180; i += 0x20)
        {
            gBG2MapBuffer[i+31] = 0;
        }
    }
    while(courtRecord->windowOffset <= -8)
    {
        courtRecord->windowOffset += 8;
        courtRecord->windowTileX--;
        courtRecord->windowTileX &= 0x1F;
        if(courtRecord->windowTileX == 0)
        {
            courtRecord->windowOffset = 0;
            courtRecord->windowScrollSpeed = 0;
        }
        for(i = 2; i < 12; i++)
        {
            DmaCopy16(3, &gBG2MapBuffer[i*0x20], gTilemapBuffer, 0x40);
            DmaCopy16(3, gTilemapBuffer, &gBG2MapBuffer[i*0x20+1], 0x3E);
        }
        for(i = 0x40; i < 0x180; i += 0x20)
        {
            gBG2MapBuffer[i] = 0;
        }
    }
}

// st_bg2_main_proc_tbl
void (*gWindowFunctions[])(struct CourtRecord *) = {
    WindowDummy,
	ScrollWindowWithPrevWindow,
	ScrollWindowWithPrevWindow,
	ScrollWindowWithoutPrevWindow,
	ScrollWindowWithoutPrevWindow,
};

void UpdateBG2Window(struct CourtRecord * courtRecord)
{
    if(gMain.blendMode == 0)
    {
        gWindowFunctions[courtRecord->windowMode](courtRecord);
        gIORegisters.lcd_bg2hofs = courtRecord->windowOffset + 8;
    }
}

void sub_80060E8(void)
{
    u16 * src;
    u16 * dst;
    src = gMapSpeedlines;
    dst = gBG3MapBuffer;
    DmaCopy16(3, src, dst, sizeof(gMapSpeedlines));
}

void sub_800610C(void)
{
    u16 * src;
    u16 * dst;
    src = gUnknown_08024E78;
    dst = gBG3MapBuffer;
    DmaCopy16(3, src, dst, sizeof(gUnknown_08024E78));
}

u8 gSpeakerToNametagMap[72] = {
	0x00, 0x07, 0x07, 0x01, 0x15, 0x05, 0x13, 0x02, 0x28, 0x04, 0x01, 0x06,
	0x0A, 0x0F, 0x0B, 0x14, 0x0D, 0x0E, 0x1D, 0x19, 0x1C, 0x1B, 0x02, 0x1E,
	0x1A, 0x00, 0x26, 0x25, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x02, 0x00, 0x00, 0x00, 0x02, 0x03, 0x02, 0x15, 0x00, 0x12, 0x16,
	0x09, 0x08, 0x11, 0x0C, 0x17, 0x18, 0x00, 0x00, 0x0E, 0x20, 0x1F, 0x21,
	0x22, 0x23, 0x27, 0x24, 0x10, 0x27, 0xE8, 0x03, 0x64, 0x00, 0x0A, 0x00
};

// Mess_win_name_set
void SetTextboxNametag(u32 nametagId, u32 rightSide)
{
    u32 i;
    u32 j;
    void * tiles;
    const u8 * tileId;
    u16 * map;
    u32 offset = rightSide;

    /* begin wat */
    gMain.currentSpeaker = nametagId;
    gMain.currentNametagRightSide = rightSide;
    nametagId = gSpeakerToNametagMap[nametagId];
    /* end wat */
    
    // this reuses r0 instead of loading into r5
    if(nametagId == 0)
    {
        for(i = 0x180; i < 0x1E0; i++)
            gBG1MapBuffer[i] = gTextboxTiles[i];
        return;
    }
    i = (nametagId / 5);
    j = (nametagId % 5);
    i *= 0x800;
    j *= 0xC0;
    tiles = gGfx4bppNametags + j + i;
    DmaCopy16(3, tiles, VRAM+0xA80, 0xC0);
    DmaCopy16(3, tiles+0x400, VRAM+0xB40, 0xC0);
    if(rightSide)
    {
        offset = 24;
        tileId = gNameTagTiles+18;
    }
    else
    {
        offset = 0;
        tileId = gNameTagTiles+12;
    }

    map = gBG1MapBuffer + 0x1C0;
    map += offset;
    for(i = 0; i < 6; i++)
    {
        *map = *tileId;
        map++;
        tileId++;
    }
    map = gBG1MapBuffer + 0x180;
    map += offset;
    tileId = gNameTagTiles;
    for(i = 0; i < 6; i++)
    {
        *map = *tileId;
        map++;
        tileId++;
    }
    map = gBG1MapBuffer + 0x1A0;
    map += offset;
    tileId = gNameTagTiles+6;
    for(i = 0; i < 6; i++)
    {
        *map = *tileId;
        map++;
        tileId++;
    }
}

void UpdateBGTilemaps()
{
    struct Main * main = &gMain;
    struct IORegisters * ioRegs = &gIORegisters;
    if(main->tilemapUpdateBits & 1) {
        DmaCopy16(3, gBG0MapBuffer, BG_SCREEN_ADDR(28), BG_SCREEN_SIZE);
        *(u32*)&REG_BG0HOFS = *(u32*)&ioRegs->lcd_bg0hofs;
    }
    if(main->tilemapUpdateBits & 2) {
        DmaCopy16(3, gBG1MapBuffer, BG_SCREEN_ADDR(29), BG_SCREEN_SIZE);
        *(u32*)&REG_BG1HOFS = *(u32*)&ioRegs->lcd_bg1hofs;
    }
    if(main->tilemapUpdateBits & 4) {
        DmaCopy16(3, gBG2MapBuffer, BG_SCREEN_ADDR(30), BG_SCREEN_SIZE);
        *(u32*)&REG_BG2HOFS = *(u32*)&ioRegs->lcd_bg2hofs;
        *(u32*)&REG_BG2PA = *(u32*)&ioRegs->lcd_bg2pa;
        *(u32*)&REG_BG2PC = *(u32*)&ioRegs->lcd_bg2pc;
        REG_BG2X = ioRegs->lcd_bg2x;
        REG_BG2Y = ioRegs->lcd_bg2y;
    }
    if(main->tilemapUpdateBits & 8) {
        DmaCopy16(3, gBG3MapBuffer, BG_SCREEN_ADDR(31), BG_SCREEN_SIZE);
        *(u32*)&REG_BG3HOFS = *(u32*)&ioRegs->lcd_bg3hofs;
        *(u32*)&REG_BG3PA = *(u32*)&ioRegs->lcd_bg3pa;
        *(u32*)&REG_BG3PC = *(u32*)&ioRegs->lcd_bg3pc;
        REG_BG3X = ioRegs->lcd_bg3x;
        REG_BG3Y = ioRegs->lcd_bg3y;
    }
    *(u32*)&REG_BG0CNT = *(u32*)&ioRegs->lcd_bg0cnt;
    *(u32*)&REG_BG2CNT = *(u32*)&ioRegs->lcd_bg2cnt;
}
