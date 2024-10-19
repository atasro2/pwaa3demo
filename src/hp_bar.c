#include "global.h"
#include "graphics.h"
#include "constants/oam_allocations.h"

void LoadHPBarGraphics(void)
{
    u8 i;
    void *dest;
    if(!(gScriptContext.flags & 0x4)) dest = OBJ_VRAM0+0x1880;
    else dest = OBJ_VRAM1+0x1000;
    for(i = 0; i < 8; i++) {
        if(gMapMarker[i].id != 0xFF) dest = OBJ_VRAM0+0x1080;
    }

    DmaCopy16(3, gGfxHPBarProgress, dest, 0x180);
    dest += 0x180;
    DmaCopy16(3, gGfxHPBarFrame3, dest, 0x80);
    dest += 0x80;
    DmaCopy16(3, gGfxHPBarFrame2, dest, 0x100);
    dest += 0x100;
    DmaCopy16(3, gGfxHPBarFrame1, dest, 0x80);
    DmaCopy16(3, gPalHPBarFrame, OBJ_PLTT+0x180, 0x20);
    DmaCopy16(3, gPalHPBarProgress, OBJ_PLTT+0x100, 0x20);
}

void sub_80160E0(int xPos, int yPos)
{
    u8 i;
    struct OamAttrs * next;
    u32 tileStart;
    if(!(gScriptContext.flags & 0x4)) {
        tileStart = (u32)OBJ_VRAM0+0x1880;
        next = &gOamObjects[OAM_IDX_HPBAR_SOMETHING+24];
    }
    else {
        tileStart = (u32)OBJ_VRAM0+0x5000;
        next = &gOamObjects[OAM_IDX_HPBAR_SOMETHING];
    }
    for(i = 0; i < 8; i++) {
        if(gMapMarker[i].id != 0xFF) tileStart = (u32)OBJ_VRAM0+0x1080;
    }
    tileStart = ((u32)(tileStart -= (u32)OBJ_VRAM0))/32;
    {
        u32 attr0;
        u32 attr1;
        u32 attr2;
        u16 x = (xPos -= 8);
        u16 y = yPos;
        u16 tile = tileStart + 24;
        struct OamAttrs * oam = next++;
        attr0 = y;
        attr0 &= 0xFF;
        oam->attr0 = attr0;
        attr1 = x;
        attr1 &= 0x1FF;
        attr1 |= 0x4000;
        oam->attr1 = attr1;
        attr2 = tile;
        attr2 &= 0x3FF;
        attr2 |= 0xC000;
        oam->attr2 = attr2 | 0xC000;
    }
    {
        u32 attr0;
        u32 attr1;
        u32 attr2;
        u16 x = (xPos += 0x10);
        u16 y = yPos;
        u16 tile = tileStart + 16;
        struct OamAttrs * oam = next++;
        attr0 = y;
        attr0 &= 0xFF;
        attr0 |= 0x4000;
        oam->attr0 = attr0;
        attr1 = x;
        attr1 &= 0x1FF;
        attr1 |= 0x8000;
        oam->attr1 = attr1;
        attr2 = tile;
        attr2 &= 0x3FF;
        oam->attr2 = attr2 | 0xC000;
    }
    {
        u32 attr0;
        u32 attr1;
        u32 attr2;
        u16 x = (xPos += 0x20);
        u16 y = yPos;
        u16 tile = tileStart + 16;
        struct OamAttrs * oam = next++;
        attr0 = y;
        attr0 &= 0xFF;
        attr0 |= 0x4000;
        oam->attr0 = attr0;
        attr1 = x;
        attr1 &= 0x1FF;
        attr1 |= 0x8000;
        oam->attr1 = attr1;
        attr2 = tile;
        attr2 &= 0x3FF;
        oam->attr2 = attr2 | 0xC000;
    }
    {
        u32 attr0;
        u32 attr1;
        u32 attr2;
        u16 x = (xPos += 0x20);
        u16 y = yPos;
        u16 tile = tileStart + 12;
        struct OamAttrs * oam = next++;
        attr0 = y;
        attr0 &= 0xFF;
        oam->attr0 = attr0;
        attr1 = x;
        attr1 &= 0x1FF;
        attr1 |= 0x4000;
        oam->attr1 = attr1;
        attr2 = tile;
        attr2 &= 0x3FF;

        oam->attr2 = attr2 | 0xC000;
    }
}
