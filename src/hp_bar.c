#include "global.h"
#include "graphics.h"

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
