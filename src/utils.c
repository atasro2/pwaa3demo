#include "global.h"
#include "main.h"
#include "utils.h"
#include "animation.h"
#include "sound.h"
#include "background.h"

void MoveSpritesToOAM(void)
{
    DmaCopy16(3, gOamObjects, OAM, sizeof(gOamObjects));
}

s32 sub_8006364(u16 arg0) {
    arg0 &= 0xFFF;
    if(arg0 < 0x400) {
        return gUnknown_08025C30[arg0 & 0x3FF];
    }
    else if(arg0 > 0xBFF) {
        if(arg0 == 0xC00) return 0;
        return gUnknown_08025C30[0x400 - (arg0 & 0x3FF)];
    }
    else if(arg0 > 0x7FF) {
        return -gUnknown_08025C30[(arg0 & 0x3FF)];
    }
    else if(arg0 == 0x400) {
        return 0;
    }
    else {
        return -gUnknown_08025C30[0x400 - (arg0 & 0x3FF)];
    }
    return 0;
}

s32 sub_80063E4(u16 arg0) {
    arg0 &= 0xFFF;
    if(arg0 < 0x400) {
        return gUnknown_08025430[arg0 & 0x3FF];
    }
    else if(arg0 > 0xBFF) {
        if(arg0 == 0xC00) return -0x100;
        return -gUnknown_08025430[(0x400 - (arg0 & 0x3FF))];
    }
    else if(arg0 > 0x7FF) {
        return -gUnknown_08025430[(arg0 & 0x3FF)];
    }
    else if(arg0 == 0x400) {
        return 0x100;
    }
    else {
        return gUnknown_08025430[0x400 - (arg0 & 0x3FF)];
    }
    return 0x100;
}

void sub_8006470(u32 arg0, u32 arg1, u32 arg2) {

}

void nullsub_20(char *arg0, u32 arg1, u32 arg2) {

}

void nullsub_6(u32 arg0, u32 arg1, u32 arg2, u32 arg3) {

}

bool32 CheckPointInArea(const struct Point * point, const struct Point4 * area)
{
    s32 num;
    s32 num2;
    s32 num3;
    s32 num4;
    s32 num5;
    s32 num6;
    s32 x;
    s32 y;

    x = area->points[0].x;
    y = area->points[0].y;
    num = point->x - x;
    num2 = point->y - y;
    num3 = area->points[1].x - x;
    num4 = area->points[1].y - y;
    num5 = area->points[3].x - x;
    num6 = area->points[3].y - y;
    if (num3 * num2 < num4 * num || num5 * num2 > num6 * num)
    {
        return FALSE;
    }

    num -= area->points[2].x - x;
    num2 -= area->points[2].y - y;
    num3 -= area->points[2].x - x;
    num4 -= area->points[2].y - y;
    num5 -= area->points[2].x - x;
    num6 -= area->points[2].y - y;
    
    if (num3 * num2 > num4 * num || num5 * num2 < num6 * num)
    {
        return FALSE;
    }
    return TRUE;
}

s16 fix_mul(s16 a, s16 b)
{
    s32 tmp;
    tmp = a;
    tmp *= b;
    tmp /= 0x100;
    return tmp;
}

s16 fix_div(s16 a, s16 b)
{
    s32 tmp;
    tmp = a;
    tmp *= 0x100;
    tmp /= b;
    return tmp;
}

s16 fix_inverse(s16 b)
{
    s32 tmp;
    tmp = 0x10000;
    tmp /= b;
    return tmp;
}

union s32asBitfields
{
    struct
    {
        s32 low:8;
        s32 high:8;
    } bytes;
    struct
    {
        s32 low:16;
        s32 high:16;
    } shorts;
    s32 w:32;
};

u8 Random()
{
    struct Main * main = &gMain;
    union s32asBitfields val0;
    union s32asBitfields val1;
    val0.shorts.low = (s16)main->rngSeed;
    val1.shorts.low = (s16)main->rngSeed * 3;
    val0.bytes.low += (u8)val1.bytes.high;
    val0.bytes.high = val1.bytes.high;
    main->rngSeed = val0.w + main->frameCounter;
    return val0.w;
}

extern u32 * gFlagPtrs[];

void ChangeFlag(u32 flagType, u32 id, bool32 set)
{
    u32 * flagPtr = gFlagPtrs[flagType];
    flagPtr += id / 32;
    if(set)
    {
        u32 flag = 1 << (id & 0x1F);
        *flagPtr |= flag;
    }
    else
    {
        u32 flag = 1 << (id & 0x1F);
        *flagPtr &= ~flag;
    }
}

bool32 GetFlag(u32 flagType, u32 id)
{
    u32 * flagPtr = gFlagPtrs[flagType];
    u32 flag;
    flagPtr += id / 32;
    flag = 1 << (id & 0x1F);

    return (*flagPtr & flag) ? TRUE : FALSE;
}

void sub_8006610(s16 scale)
{
    struct IORegisters * ioRegsp = &gIORegisters;
    ioRegsp->lcd_bg2pa = fix_mul(_Cos(0), scale);
    ioRegsp->lcd_bg2pb = fix_mul(_Sin(0), scale);
    ioRegsp->lcd_bg2pc = fix_mul(-_Sin(0), scale);
    ioRegsp->lcd_bg2pd = fix_mul(_Cos(0), scale);
    ioRegsp->lcd_bg2x = (((120 * 0x100 - 120) - ioRegsp->lcd_bg2pa * 120) - (ioRegsp->lcd_bg2pb * 80)) & 0x0FFFFFFF;
    ioRegsp->lcd_bg2y = (((80 * 0x100 - 80) - ioRegsp->lcd_bg2pc * 120) - (ioRegsp->lcd_bg2pd * 80)) & 0x0FFFFFFF;
}
