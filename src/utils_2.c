#include "global.h"
#include "main.h"
#include "utils.h"
#include "animation.h"
#include "sound.h"
#include "background.h"

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
