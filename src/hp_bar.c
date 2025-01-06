#include "global.h"
#include "animation.h"
#include "graphics.h"
#include "utils.h"
#include "constants/oam_allocations.h"

int FindPlayingHPBarSmokeAnimations(void);

extern u16 gPalHPBarLoseLifePalettes[15][16];
extern u16 gPalHPBarGainLifePalettes[15][16];

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

// ! i am still not sure whether this inline is real or not but it appears on
// the 2008 PC port of this code and is used like the function below soooo
// important thing is that it matches!
static inline void SetHVScalingMatrix(u16 matrix, s16 horizontalScale, s16 verticalScale) {
    gOamObjects[matrix*4 + 0].attr3 = fix_mul(_Cos(0), horizontalScale);
    gOamObjects[matrix*4 + 1].attr3 = fix_mul(_Sin(0), verticalScale);
    gOamObjects[matrix*4 + 2].attr3 = fix_mul(-_Sin(0), horizontalScale);
    gOamObjects[matrix*4 + 3].attr3 = fix_mul(_Cos(0), verticalScale);
}

// This runs, from left to right, through all affected OAMs according to hpValue and configures the OAM values
// The bar animation within an OAM block is done via a scaling matrix (horizontal scale)
// Returns the first OAM _after_ the affected ones
// Return value is used in AnimateHPBar to animate the static and dynamic parts different
// E.g. when gaining HP, the complete bar shakes but the amount gained is colored differently
u32 SetHPBarOAMAndMatrices(s16 x, s16 y, int hpValue, int tileId, int barFillStartOAM, int firstOAMToApplyTo, int paletteId, int matrixId)
{
    struct OamAttrs * oam;
    s16 res;
    s16 scale;
    u32 temp;
    s32 i;
    if(hpValue < 0)
        hpValue = 0;
    oam = &gOamObjects[barFillStartOAM + firstOAMToApplyTo];
    SetHVScalingMatrix(22, Q_8_8(1), Q_8_8(1));

    firstOAMToApplyTo--;
    if(firstOAMToApplyTo < 0)
        firstOAMToApplyTo = 0;

    for(i = firstOAMToApplyTo; i < (hpValue / 16); i++)
    {
        temp = i * 16;
        {
            u32 attr0, attr1, attr2;
            u16 x2 = x + temp;
            u16 y2 = y;
            u16 tileId2 = tileId;
            u16 pal = paletteId;

            oam->attr0 = y2;
            oam->attr0 &= 0xFF;
            attr0 = 0x300;
            oam->attr0 |= attr0;

            attr1 = x2 & 0x1FF;
            attr1 |= 0x2C00;
            attr1 |= 0x4000;
            oam->attr1 = attr1;

            attr2 = tileId2;
            attr2 &= 0x3FF;
            oam->attr2 = attr2 | pal << 12;
        }
        oam++;
    }
    if(i <= 4) {
        temp = hpValue % 16;
        if(temp) {
            SetHVScalingMatrix(matrixId, fix_inverse(temp*16), Q_8_8(1));
            {
                u32 attr0, attr1, attr2;
                u16 x2;
                u16 y2;
                u16 tileId2;
                u16 palette;
                u16 matrix = matrixId;
                x2 = i * 16 - (16 - temp) / 2 - temp % 2 + x;
                y2 = y;
                tileId2 = tileId;
                palette = paletteId;

                attr0 = y2;
                attr0 &= 0xFF;
                attr0 |= 0x300;
                oam->attr0 = attr0;

                attr1 = x2;
                attr1 &= 0x1FF;
                attr1 |= matrix << 9;
                attr1 |= 0x4000;
                oam->attr1 = attr1;

                attr2 = tileId2;
                attr2 &= 0x3FF;
                attr2 |= palette << 12;
                oam->attr2 = attr2;
            }
            i++;
        }
    }
    return i;
}

void LoadHPBarPaletteIntoSlotOnIntervalByInterval(u16 pltt[][16], u16 slot)
{
    int interval = 4;
    if((gMain.frameCounter & 3) == 0)
    {
        int index = (gMain.frameCounter / 4) % 15;
        DmaCopy16(3, pltt[index], OBJ_PLTT + slot * 0x20, 0x20);
    }
}

void DoHPBarSmokeAnimations(int xPos, int yPos)
{
    int smokeOffsetPairs[12] = {-4, 4, 0, 8, 8, 6, -11, -8, 18, -2, 8, -8};
    int smokePlayFrameTimes[7] = {0, 9, 18, 27, 42, 51, 60}; // hardcoded for 60Hz refresh!
    int i; // r8
    int currentFrameInSecond = gMain.frameCounter % smokePlayFrameTimes[6];
    for(i = 0; i < 6; i++)
    {
        struct AnimationListEntry * animation;
        if(smokePlayFrameTimes[i] == currentFrameInSecond || FindPlayingHPBarSmokeAnimations() == 0)
        {
            animation = FindAnimationFromAnimId(107 + i % 3);
            if(animation == NULL)
            {
                animation = PlayAnimationAtCustomOrigin(107 + i % 3, xPos + smokeOffsetPairs[i * 2], yPos + smokeOffsetPairs[i * 2 + 1] + 8);
                SetAnimationScale(animation, 16 + i % 3, 256 + Random() % 256);
            }
        }
    }
}

void AnimateHPBar(void)
{
    int xOffset = 0;
    int yOffset = 0;
    int nextIndex;
    u8 i;
    struct OamAttrs * next;
    u32 tileStart;
    u32 oamidx;
    if(!(gScriptContext.flags & 0x4)) {
        tileStart = (u32)OBJ_VRAM0+0x1880;
        next = &gOamObjects[OAM_IDX_HPBAR_SOMETHING+24];
        oamidx = 0x3d;
    }
    else {
        tileStart = (u32)OBJ_VRAM0+0x5000;
        next = &gOamObjects[OAM_IDX_HPBAR_SOMETHING];
        oamidx = 0x25;
    }
    for(i = 0; i < 8; i++) {
        if(gMapMarker[i].id != 0xFF) tileStart = (u32)OBJ_VRAM0+0x1080;
    }
    tileStart = ((u32)(tileStart -= (u32)OBJ_VRAM0))/32;
    if(gMain.hpBarValue > gMain.hpBarDisplayValue)
    {
        LoadHPBarPaletteIntoSlotOnIntervalByInterval(gPalHPBarGainLifePalettes, 9);
        xOffset = 0; // useless!
        yOffset = (gMain.frameCounter / 2) % 2;
        nextIndex = SetHPBarOAMAndMatrices(gMain.hpBarX - 8 + xOffset, gMain.hpBarY - 8 + yOffset, gMain.hpBarDisplayValue, tileStart, oamidx, 0, 8, 20);
        SetHPBarOAMAndMatrices(gMain.hpBarX - 8 + xOffset, gMain.hpBarY - 8 + yOffset, gMain.hpBarValue, tileStart, oamidx, nextIndex, 9, 21);
    }
    else if(gMain.hpBarValue < gMain.hpBarDisplayValue)
    {
        DoHPBarSmokeAnimations(gMain.hpBarX + gMain.hpBarDisplayValue, gMain.hpBarY);
        LoadHPBarPaletteIntoSlotOnIntervalByInterval(gPalHPBarLoseLifePalettes, 9);
        xOffset = Random() % 2 - 2;
        yOffset = Random() % 3 - 4;
        nextIndex = SetHPBarOAMAndMatrices(gMain.hpBarX - 8 + xOffset, gMain.hpBarY - 8 + yOffset, gMain.hpBarValue, tileStart, oamidx, 0, 8, 20);
        SetHPBarOAMAndMatrices(gMain.hpBarX - 8 + xOffset, gMain.hpBarY - 8 + yOffset, gMain.hpBarDisplayValue, tileStart, oamidx, nextIndex, 9, 21);
    }
    else if(gMain.hpBarDamageAmount > 0)
    {
        LoadHPBarPaletteIntoSlotOnIntervalByInterval(gPalHPBarLoseLifePalettes, 9);
        nextIndex = SetHPBarOAMAndMatrices(gMain.hpBarX - 8, gMain.hpBarY - 8, gMain.hpBarValue - gMain.hpBarDamageAmount, tileStart, oamidx, 0, 8, 20);
        SetHPBarOAMAndMatrices(gMain.hpBarX - 8, gMain.hpBarY - 8, gMain.hpBarValue, tileStart, oamidx, nextIndex, 9, 21);
    }
    else
    {
        LoadHPBarPaletteIntoSlotOnIntervalByInterval(gPalHPBarLoseLifePalettes, 9);
        SetHPBarOAMAndMatrices(gMain.hpBarX - 8, gMain.hpBarY - 8, gMain.hpBarValue, tileStart, oamidx, 0, 8, 20);
    }
    sub_80160E0(gMain.hpBarX + xOffset, gMain.hpBarY + yOffset);
}
