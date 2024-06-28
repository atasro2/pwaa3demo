#include "global.h"
#include "background.h"
#include "ewram.h"

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
        if(sp10 & 0x80000000) // ! this statement will never be true
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
        if(sp10 & 0x80000000) // ! this statement will never be true
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
        DmaCopy16(3, gTilemapBuffer, ptr, 0x540);;
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
        DmaCopy16(3, ptr2, gBG3MapBuffer, 0x580);
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
