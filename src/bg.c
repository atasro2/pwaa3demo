#include "global.h"
#include "background.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "m4a.h"
#include "constants/process.h"

u16 gCourtScrollGfxFrameIndices[2][0x10] = {
    0x0000, 0x0001, 0x0002, 0x0003, 0x0005, 0x0008, 0x000C, 0x0012,
    0x0019, 0x0021, 0x002A, 0x0034, 0x003F, 0x0040, 0x0041, 0x0041,
    0x0000, 0x0002, 0x0004, 0x0006, 0x000D, 0x0019, 0x0025, 0x0032,
    0x003F, 0x004C, 0x0059, 0x0066, 0x0072, 0x007E, 0x0080, 0x0082,
};
const struct Background gBackgroundTable[105] = {
    {
        .bgData = (void*)0x081cb6b4,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081d0458,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081d2000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081d3a04,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081d569c,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081dbb9c,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081e1a08,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081ecbb4,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081ecbb4,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x08206bf0,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x0820ccf0,
        .controlBits = 0x81000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081cb6b4,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081ef7d0,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000021,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000011,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081eeb48,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x081f2d90,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081f7d50,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x081fc188,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x082012f8,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x08204424,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000012,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000011,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000021,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000084,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x00000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
    {
        .bgData = (void*)0x00000000,
        .controlBits = 0x80000000,
    },
};

const u8 gNameTagTiles[24] = {
    0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f,
    0x0a, 0x0b, 0x0b, 0x0b, 0x0b, 0x0c, 0x0d, 0x0b, 0x0b, 0x0b, 0x0b, 0x0e
};

const u8 gTextboxTiles[0x400] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x02, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x03, 0x00, 0x00,
    0x06, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x07, 0x00, 0x00, 0x06, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x07, 0x00, 0x00, 0x06, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x07, 0x00, 0x00,
    0x06, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x07, 0x00, 0x00, 0x04, 0x09, 0x09, 0x09,
    0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
    0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
    0x09, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00
};

const u16 gMapCourtRecordNormalWindow[32*12] = {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,    0x0000, 0x0041, 0x0042, 0x0042, 0x0042, 0x0042, 0x0042, 0x0042,
    0x0042, 0x0042, 0x0043, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049,
    0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049,
    0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x004a, 0x0000,
    0x0000, 0x0044, 0x1140, 0x1141, 0x1142, 0x1143, 0x1144, 0x1145,
    0x1146, 0x1147, 0x0045, 0x00a0, 0x00a1, 0x00a2, 0x00a3, 0x00b0,
    0x00b1, 0x00b2, 0x00b3, 0x00c0, 0x00c1, 0x00c2, 0x00c3, 0x00d0,    0x00d1, 0x00d2, 0x00d3, 0x00e0, 0x00e1, 0x00e2, 0x004b, 0x0000,    0x0000, 0x0044, 0x1148, 0x1149, 0x114a, 0x114b, 0x114c, 0x114d,
    0x114e, 0x114f, 0x0045, 0x00a4, 0x00a5, 0x00a6, 0x00a7, 0x00b4,
    0x00b5, 0x00b6, 0x00b7, 0x00c4, 0x00c5, 0x00c6, 0x00c7, 0x00d4,    0x00d5, 0x00d6, 0x00d7, 0x00e4, 0x00e5, 0x00e6, 0x004b, 0x0000,    0x0000, 0x0044, 0x1150, 0x1151, 0x1152, 0x1153, 0x1154, 0x1155,
    0x1156, 0x1157, 0x0045, 0x00a8, 0x00a9, 0x00aa, 0x00ab, 0x00b8,
    0x00b9, 0x00ba, 0x00bb, 0x00c8, 0x00c9, 0x00ca, 0x00cb, 0x00d8,    0x00d9, 0x00da, 0x00db, 0x00e8, 0x00e9, 0x00ea, 0x004b, 0x0000,    0x0000, 0x0044, 0x1158, 0x1159, 0x115a, 0x115b, 0x115c, 0x115d,
    0x115e, 0x115f, 0x0045, 0x00ac, 0x00ad, 0x00ae, 0x00af, 0x00bc,
    0x00bd, 0x00be, 0x00bf, 0x00cc, 0x00cd, 0x00ce, 0x00cf, 0x00dc,    0x00dd, 0x00de, 0x00df, 0x00ec, 0x00ed, 0x00ee, 0x004b, 0x0000,    0x0000, 0x0044, 0x1160, 0x1161, 0x1162, 0x1163, 0x1164, 0x1165,
    0x1166, 0x1167, 0x0045, 0x00f0, 0x00f1, 0x00f2, 0x00f3, 0x0100,
    0x0101, 0x0102, 0x0103, 0x0110, 0x0111, 0x0112, 0x0113, 0x0120,    0x0121, 0x0122, 0x0123, 0x0130, 0x0131, 0x0132, 0x004b, 0x0000,
    0x0000, 0x0044, 0x1168, 0x1169, 0x116a, 0x116b, 0x116c, 0x116d,
    0x116e, 0x116f, 0x0045, 0x00f4, 0x00f5, 0x00f6, 0x00f7, 0x0104,
    0x0105, 0x0106, 0x0107, 0x0114, 0x0115, 0x0116, 0x0117, 0x0124,    0x0125, 0x0126, 0x0127, 0x0134, 0x0135, 0x0136, 0x004b, 0x0000,
    0x0000, 0x0044, 0x1170, 0x1171, 0x1172, 0x1173, 0x1174, 0x1175,
    0x1176, 0x1177, 0x0045, 0x00f8, 0x00f9, 0x00fa, 0x00fb, 0x0108,
    0x0109, 0x010a, 0x010b, 0x0118, 0x0119, 0x011a, 0x011b, 0x0128,    0x0129, 0x012a, 0x012b, 0x0138, 0x0139, 0x013a, 0x004b, 0x0000,
    0x0000, 0x0044, 0x1178, 0x1179, 0x117a, 0x117b, 0x117c, 0x117d,
    0x117e, 0x117f, 0x0045, 0x00fc, 0x00fd, 0x00fe, 0x00ff, 0x010c,
    0x010d, 0x010e, 0x010f, 0x011c, 0x011d, 0x011e, 0x011f, 0x012c,    0x012d, 0x012e, 0x012f, 0x013c, 0x013d, 0x013e, 0x004b, 0x0000,
    0x0000, 0x0046, 0x0047, 0x0047, 0x0047, 0x0047, 0x0047, 0x0047,
    0x0047, 0x0047, 0x0048, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c,
    0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c,
    0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004d, 0x0000,
};

const u16 gMapCourtRecordSaveWindow[32*12] = {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004e, 0x0049, 0x0049, 0x0049,
    0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049,
    0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049, 0x0049,
    0x0049, 0x0049, 0x0049, 0x004a, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0060, 0x0061, 0x0062, 0x0063, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0070, 0x0071, 0x0072, 0x0073, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0064, 0x0065, 0x0066, 0x0067, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0074, 0x0075, 0x0076, 0x0077, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0068, 0x0069, 0x006a, 0x006b, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0078, 0x0079, 0x007a, 0x007b, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x006c, 0x006d, 0x006e, 0x006f, 0x0040, 0x0040,
    0x0040, 0x0040, 0x007c, 0x007d, 0x007e, 0x007f, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x004f, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
    0x0040, 0x0040, 0x0040, 0x004b, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0050, 0x004c, 0x004c, 0x004c,
    0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c,
    0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c, 0x004c,
    0x004c, 0x004c, 0x004c, 0x004d, 0x0000, 0x0000, 0x0000, 0x0000,
};

const u16 gMapSpeedlines[0x2C0] = {
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2000, 0x2001, 0x2002, 0x2003, 0x2004, 0x2005, 0x2006,
    0x2007, 0x2008, 0x2009, 0x200a, 0x200b, 0x200c, 0x200d, 0x200e,
    0x200f, 0x2010, 0x2011, 0x2012, 0x2013, 0x2014, 0x2015, 0x2016,
    0x2017, 0x2018, 0x2019, 0x201a, 0x201b, 0x201c, 0x201d, 0x2276,
    0x2276, 0x201e, 0x201f, 0x2020, 0x2021, 0x2022, 0x2023, 0x2024,
    0x2025, 0x2026, 0x2027, 0x2028, 0x2029, 0x202a, 0x202b, 0x202c,
    0x202d, 0x202e, 0x202f, 0x2030, 0x2031, 0x2032, 0x2033, 0x2034,
    0x2035, 0x2036, 0x2037, 0x2038, 0x2039, 0x203a, 0x203b, 0x2276,
    0x2276, 0x203c, 0x203d, 0x203e, 0x203f, 0x2040, 0x2041, 0x2042,
    0x2043, 0x2044, 0x2045, 0x2046, 0x2047, 0x2048, 0x2049, 0x204a,
    0x204b, 0x204c, 0x204d, 0x204e, 0x204f, 0x2050, 0x2051, 0x2052,
    0x2053, 0x2054, 0x2055, 0x2056, 0x2057, 0x2058, 0x2059, 0x2276,
    0x2276, 0x205a, 0x205b, 0x205c, 0x205d, 0x205e, 0x205f, 0x2060,
    0x2061, 0x2062, 0x2063, 0x2064, 0x2065, 0x2066, 0x2067, 0x2068,
    0x2069, 0x206a, 0x206b, 0x206c, 0x206d, 0x206e, 0x206f, 0x2070,
    0x2071, 0x2072, 0x2073, 0x2074, 0x2075, 0x2076, 0x2077, 0x2276,
    0x2276, 0x2078, 0x2079, 0x207a, 0x207b, 0x207c, 0x207d, 0x207e,
    0x207f, 0x2080, 0x2081, 0x2082, 0x2083, 0x2084, 0x2085, 0x2086,
    0x2087, 0x2088, 0x2089, 0x208a, 0x208b, 0x208c, 0x208d, 0x208e,
    0x208f, 0x2090, 0x2091, 0x2092, 0x2093, 0x2094, 0x2095, 0x2276,
    0x2276, 0x2096, 0x2097, 0x2098, 0x2099, 0x209a, 0x209b, 0x209c,
    0x209d, 0x209e, 0x209f, 0x20a0, 0x20a1, 0x20a2, 0x20a3, 0x20a4,
    0x20a5, 0x20a6, 0x20a7, 0x20a8, 0x20a9, 0x20aa, 0x20ab, 0x20ac,
    0x20ad, 0x20ae, 0x20af, 0x20b0, 0x20b1, 0x20b2, 0x20b3, 0x2276,
    0x2276, 0x20b4, 0x20b5, 0x20b6, 0x20b7, 0x20b8, 0x20b9, 0x20ba,
    0x20bb, 0x20bc, 0x20bd, 0x20be, 0x20bf, 0x20c0, 0x20c1, 0x20c2,
    0x20c3, 0x20c4, 0x20c5, 0x20c6, 0x20c7, 0x20c8, 0x20c9, 0x20ca,
    0x20cb, 0x20cc, 0x20cd, 0x20ce, 0x20cf, 0x20d0, 0x20d1, 0x2276,
    0x2276, 0x20d2, 0x20d3, 0x20d4, 0x20d5, 0x20d6, 0x20d7, 0x20d8,
    0x20d9, 0x20da, 0x20db, 0x20dc, 0x20dd, 0x20de, 0x20df, 0x20e0,
    0x20e1, 0x20e2, 0x20e3, 0x20e4, 0x20e5, 0x20e6, 0x20e7, 0x20e8,
    0x20e9, 0x20ea, 0x20eb, 0x20ec, 0x20ed, 0x20ee, 0x20ef, 0x2276,
    0x2276, 0x20f0, 0x20f1, 0x20f2, 0x20f3, 0x20f4, 0x20f5, 0x20f6,
    0x20f7, 0x20f8, 0x20f9, 0x20fa, 0x20fb, 0x20fc, 0x20fd, 0x20fe,
    0x20ff, 0x2100, 0x2101, 0x2102, 0x2103, 0x2104, 0x2105, 0x2106,
    0x2107, 0x2108, 0x2109, 0x210a, 0x210b, 0x210c, 0x210d, 0x2276,
    0x2276, 0x210e, 0x210f, 0x2110, 0x2111, 0x2112, 0x2113, 0x2114,
    0x2115, 0x2116, 0x2117, 0x2118, 0x2119, 0x211a, 0x211b, 0x211c,
    0x211d, 0x211e, 0x211f, 0x2120, 0x2121, 0x2122, 0x2123, 0x2124,
    0x2125, 0x2126, 0x2127, 0x2128, 0x2129, 0x212a, 0x212b, 0x2276,
    0x2276, 0x212c, 0x212d, 0x212e, 0x212f, 0x2130, 0x2131, 0x2132,
    0x2133, 0x2134, 0x2135, 0x2136, 0x2137, 0x2138, 0x2139, 0x213a,
    0x213b, 0x213c, 0x213d, 0x213e, 0x213f, 0x2140, 0x2141, 0x2142,
    0x2143, 0x2144, 0x2145, 0x2146, 0x2147, 0x2148, 0x2149, 0x2276,
    0x2276, 0x214a, 0x214b, 0x214c, 0x214d, 0x214e, 0x214f, 0x2150,
    0x2151, 0x2152, 0x2153, 0x2154, 0x2155, 0x2156, 0x2157, 0x2158,
    0x2159, 0x215a, 0x215b, 0x215c, 0x215d, 0x215e, 0x215f, 0x2160,
    0x2161, 0x2162, 0x2163, 0x2164, 0x2165, 0x2166, 0x2167, 0x2276,
    0x2276, 0x2168, 0x2169, 0x216a, 0x216b, 0x216c, 0x216d, 0x216e,
    0x216f, 0x2170, 0x2171, 0x2172, 0x2173, 0x2174, 0x2175, 0x2176,
    0x2177, 0x2178, 0x2179, 0x217a, 0x217b, 0x217c, 0x217d, 0x217e,
    0x217f, 0x2180, 0x2181, 0x2182, 0x2183, 0x2184, 0x2185, 0x2276,
    0x2276, 0x2186, 0x2187, 0x2188, 0x2189, 0x218a, 0x218b, 0x218c,
    0x218d, 0x218e, 0x218f, 0x2190, 0x2191, 0x2192, 0x2193, 0x2194,
    0x2195, 0x2196, 0x2197, 0x2198, 0x2199, 0x219a, 0x219b, 0x219c,
    0x219d, 0x219e, 0x219f, 0x21a0, 0x21a1, 0x21a2, 0x21a3, 0x2276,
    0x2276, 0x21a4, 0x21a5, 0x21a6, 0x21a7, 0x21a8, 0x21a9, 0x21aa,
    0x21ab, 0x21ac, 0x21ad, 0x21ae, 0x21af, 0x21b0, 0x21b1, 0x21b2,
    0x21b3, 0x21b4, 0x21b5, 0x21b6, 0x21b7, 0x21b8, 0x21b9, 0x21ba,
    0x21bb, 0x21bc, 0x21bd, 0x21be, 0x21bf, 0x21c0, 0x21c1, 0x2276,
    0x2276, 0x21c2, 0x21c3, 0x21c4, 0x21c5, 0x21c6, 0x21c7, 0x21c8,
    0x21c9, 0x21ca, 0x21cb, 0x21cc, 0x21cd, 0x21ce, 0x21cf, 0x21d0,
    0x21d1, 0x21d2, 0x21d3, 0x21d4, 0x21d5, 0x21d6, 0x21d7, 0x21d8,
    0x21d9, 0x21da, 0x21db, 0x21dc, 0x21dd, 0x21de, 0x21df, 0x2276,
    0x2276, 0x21e0, 0x21e1, 0x21e2, 0x21e3, 0x21e4, 0x21e5, 0x21e6,
    0x21e7, 0x21e8, 0x21e9, 0x21ea, 0x21eb, 0x21ec, 0x21ed, 0x21ee,
    0x21ef, 0x21f0, 0x21f1, 0x21f2, 0x21f3, 0x21f4, 0x21f5, 0x21f6,
    0x21f7, 0x21f8, 0x21f9, 0x21fa, 0x21fb, 0x21fc, 0x21fd, 0x2276,
    0x2276, 0x21fe, 0x21ff, 0x2200, 0x2201, 0x2202, 0x2203, 0x2204,
    0x2205, 0x2206, 0x2207, 0x2208, 0x2209, 0x220a, 0x220b, 0x220c,
    0x220d, 0x220e, 0x220f, 0x2210, 0x2211, 0x2212, 0x2213, 0x2214,
    0x2215, 0x2216, 0x2217, 0x2218, 0x2219, 0x221a, 0x221b, 0x2276,
    0x2276, 0x221c, 0x221d, 0x221e, 0x221f, 0x2220, 0x2221, 0x2222,
    0x2223, 0x2224, 0x2225, 0x2226, 0x2227, 0x2228, 0x2229, 0x222a,
    0x222b, 0x222c, 0x222d, 0x222e, 0x222f, 0x2230, 0x2231, 0x2232,
    0x2233, 0x2234, 0x2235, 0x2236, 0x2237, 0x2238, 0x2239, 0x2276,
    0x2276, 0x223a, 0x223b, 0x223c, 0x223d, 0x223e, 0x223f, 0x2240,
    0x2241, 0x2242, 0x2243, 0x2244, 0x2245, 0x2246, 0x2247, 0x2248,
    0x2249, 0x224a, 0x224b, 0x224c, 0x224d, 0x224e, 0x224f, 0x2250,
    0x2251, 0x2252, 0x2253, 0x2254, 0x2255, 0x2256, 0x2257, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
    0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276, 0x2276,
};

const u16 gUnknown_08024E78[0x2C0] = {
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x3080, 0x3081, 0x3082, 0x3083, 0x3084, 0x3085, 0x3086,
    0x3087, 0x3088, 0x3089, 0x308a, 0x308b, 0x308c, 0x308d, 0x308e,
    0x308f, 0x3090, 0x3091, 0x3092, 0x3093, 0x3094, 0x3095, 0x3096,
    0x3097, 0x3098, 0x3099, 0x309a, 0x309b, 0x309c, 0x309d, 0x32d8,
    0x32d8, 0x309e, 0x309f, 0x30a0, 0x30a1, 0x30a2, 0x30a3, 0x30a4,
    0x30a5, 0x30a6, 0x30a7, 0x30a8, 0x30a9, 0x30aa, 0x30ab, 0x30ac,
    0x30ad, 0x30ae, 0x30af, 0x30b0, 0x30b1, 0x30b2, 0x30b3, 0x30b4,
    0x30b5, 0x30b6, 0x30b7, 0x30b8, 0x30b9, 0x30ba, 0x30bb, 0x32d8,
    0x32d8, 0x30bc, 0x30bd, 0x30be, 0x30bf, 0x30c0, 0x30c1, 0x30c2,
    0x30c3, 0x30c4, 0x30c5, 0x30c6, 0x30c7, 0x30c8, 0x30c9, 0x30ca,
    0x30cb, 0x30cc, 0x30cd, 0x30ce, 0x30cf, 0x30d0, 0x30d1, 0x30d2,
    0x30d3, 0x30d4, 0x30d5, 0x30d6, 0x30d7, 0x30d8, 0x30d9, 0x32d8,
    0x32d8, 0x30da, 0x30db, 0x30dc, 0x30dd, 0x30de, 0x30df, 0x30e0,
    0x30e1, 0x30e2, 0x30e3, 0x30e4, 0x30e5, 0x30e6, 0x30e7, 0x30e8,
    0x30e9, 0x30ea, 0x30eb, 0x30ec, 0x30ed, 0x30ee, 0x30ef, 0x30f0,
    0x30f1, 0x30f2, 0x30f3, 0x30f4, 0x30f5, 0x30f6, 0x30f7, 0x32f6,
    0x32f6, 0x30f8, 0x30f9, 0x30fa, 0x30fb, 0x30fc, 0x30fd, 0x30fe,
    0x30ff, 0x3100, 0x3101, 0x3102, 0x3103, 0x3104, 0x3105, 0x3106,
    0x3107, 0x3108, 0x3109, 0x310a, 0x310b, 0x310c, 0x310d, 0x310e,
    0x310f, 0x3110, 0x3111, 0x3112, 0x3113, 0x3114, 0x3115, 0x32d8,
    0x32d8, 0x3116, 0x3117, 0x3118, 0x3119, 0x311a, 0x311b, 0x311c,
    0x311d, 0x311e, 0x311f, 0x3120, 0x3121, 0x3122, 0x3123, 0x3124,
    0x3125, 0x3126, 0x3127, 0x3128, 0x3129, 0x312a, 0x312b, 0x312c,
    0x312d, 0x312e, 0x312f, 0x3130, 0x3131, 0x3132, 0x3133, 0x32d8,
    0x32d8, 0x3134, 0x3135, 0x3136, 0x3137, 0x3138, 0x3139, 0x313a,
    0x313b, 0x313c, 0x313d, 0x313e, 0x313f, 0x3140, 0x3141, 0x3142,
    0x3143, 0x3144, 0x3145, 0x3146, 0x3147, 0x3148, 0x3149, 0x314a,
    0x314b, 0x314c, 0x314d, 0x314e, 0x314f, 0x3150, 0x3151, 0x32d8,
    0x32d8, 0x3152, 0x3153, 0x3154, 0x3155, 0x3156, 0x3157, 0x3158,
    0x3159, 0x315a, 0x315b, 0x315c, 0x315d, 0x315e, 0x315f, 0x3160,
    0x3161, 0x3162, 0x3163, 0x3164, 0x3165, 0x3166, 0x3167, 0x3168,
    0x3169, 0x316a, 0x316b, 0x316c, 0x316d, 0x316e, 0x316f, 0x32d8,
    0x32d8, 0x3170, 0x3171, 0x3172, 0x3173, 0x3174, 0x3175, 0x3176,
    0x3177, 0x3178, 0x3179, 0x317a, 0x317b, 0x317c, 0x317d, 0x317e,
    0x317f, 0x3180, 0x3181, 0x3182, 0x3183, 0x3184, 0x3185, 0x3186,
    0x3187, 0x3188, 0x3189, 0x318a, 0x318b, 0x318c, 0x318d, 0x32d8,
    0x32d8, 0x318e, 0x318f, 0x3190, 0x3191, 0x3192, 0x3193, 0x3194,
    0x3195, 0x3196, 0x3197, 0x3198, 0x3199, 0x319a, 0x319b, 0x319c,
    0x319d, 0x319e, 0x319f, 0x31a0, 0x31a1, 0x31a2, 0x31a3, 0x31a4,
    0x31a5, 0x31a6, 0x31a7, 0x31a8, 0x31a9, 0x31aa, 0x31ab, 0x32d8,
    0x32d8, 0x31ac, 0x31ad, 0x31ae, 0x31af, 0x31b0, 0x31b1, 0x31b2,
    0x31b3, 0x31b4, 0x31b5, 0x31b6, 0x31b7, 0x31b8, 0x31b9, 0x31ba,
    0x31bb, 0x31bc, 0x31bd, 0x31be, 0x31bf, 0x31c0, 0x31c1, 0x31c2,
    0x31c3, 0x31c4, 0x31c5, 0x31c6, 0x31c7, 0x31c8, 0x31c9, 0x32d8,
    0x32d8, 0x31ca, 0x31cb, 0x31cc, 0x31cd, 0x31ce, 0x31cf, 0x31d0,
    0x31d1, 0x31d2, 0x31d3, 0x31d4, 0x31d5, 0x31d6, 0x31d7, 0x31d8,
    0x31d9, 0x31da, 0x31db, 0x31dc, 0x31dd, 0x31de, 0x31df, 0x31e0,
    0x31e1, 0x31e2, 0x31e3, 0x31e4, 0x31e5, 0x31e6, 0x31e7, 0x32d8,
    0x32d8, 0x31e8, 0x31e9, 0x31ea, 0x31eb, 0x31ec, 0x31ed, 0x31ee,
    0x31ef, 0x31f0, 0x31f1, 0x31f2, 0x31f3, 0x31f4, 0x31f5, 0x31f6,
    0x31f7, 0x31f8, 0x31f9, 0x31fa, 0x31fb, 0x31fc, 0x31fd, 0x31fe,
    0x31ff, 0x3200, 0x3201, 0x3202, 0x3203, 0x3204, 0x3205, 0x32d8,
    0x32d8, 0x3206, 0x3207, 0x3208, 0x3209, 0x320a, 0x320b, 0x320c,
    0x320d, 0x320e, 0x320f, 0x3210, 0x3211, 0x3212, 0x3213, 0x3214,
    0x3215, 0x3216, 0x3217, 0x3218, 0x3219, 0x321a, 0x321b, 0x321c,
    0x321d, 0x321e, 0x321f, 0x3220, 0x3221, 0x3222, 0x3223, 0x32d8,
    0x32d8, 0x3224, 0x3225, 0x3226, 0x3227, 0x3228, 0x3229, 0x322a,
    0x322b, 0x322c, 0x322d, 0x322e, 0x322f, 0x3230, 0x3231, 0x3232,
    0x3233, 0x3234, 0x3235, 0x3236, 0x3237, 0x3238, 0x3239, 0x323a,
    0x323b, 0x323c, 0x323d, 0x323e, 0x323f, 0x3240, 0x3241, 0x32d8,
    0x32d8, 0x3242, 0x3243, 0x3244, 0x3245, 0x3246, 0x3247, 0x3248,
    0x3249, 0x324a, 0x324b, 0x324c, 0x324d, 0x324e, 0x324f, 0x3250,
    0x3251, 0x3252, 0x3253, 0x3254, 0x3255, 0x3256, 0x3257, 0x3258,
    0x3259, 0x325a, 0x325b, 0x325c, 0x325d, 0x325e, 0x325f, 0x32d8,
    0x32d8, 0x3260, 0x3261, 0x3262, 0x3263, 0x3264, 0x3265, 0x3266,
    0x3267, 0x3268, 0x3269, 0x326a, 0x326b, 0x326c, 0x326d, 0x326e,
    0x326f, 0x3270, 0x3271, 0x3272, 0x3273, 0x3274, 0x3275, 0x3276,
    0x3277, 0x3278, 0x3279, 0x327a, 0x327b, 0x327c, 0x327d, 0x32d8,
    0x32d8, 0x327e, 0x327f, 0x3280, 0x3281, 0x3282, 0x3283, 0x3284,
    0x3285, 0x3286, 0x3287, 0x3288, 0x3289, 0x328a, 0x328b, 0x328c,
    0x328d, 0x328e, 0x328f, 0x3290, 0x3291, 0x3292, 0x3293, 0x3294,
    0x3295, 0x3296, 0x3297, 0x3298, 0x3299, 0x329a, 0x329b, 0x32d8,
    0x32d8, 0x329c, 0x329d, 0x329e, 0x329f, 0x32a0, 0x32a1, 0x32a2,
    0x32a3, 0x32a4, 0x32a5, 0x32a6, 0x32a7, 0x32a8, 0x32a9, 0x32aa,
    0x32ab, 0x32ac, 0x32ad, 0x32ae, 0x32af, 0x32b0, 0x32b1, 0x32b2,
    0x32b3, 0x32b4, 0x32b5, 0x32b6, 0x32b7, 0x32b8, 0x32b9, 0x32d8,
    0x32d8, 0x32ba, 0x32bb, 0x32bc, 0x32bd, 0x32be, 0x32bf, 0x32c0,
    0x32c1, 0x32c2, 0x32c3, 0x32c4, 0x32c5, 0x32c6, 0x32c7, 0x32c8,
    0x32c9, 0x32ca, 0x32cb, 0x32cc, 0x32cd, 0x32ce, 0x32cf, 0x32d0,
    0x32d1, 0x32d2, 0x32d3, 0x32d4, 0x32d5, 0x32d6, 0x32d7, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
    0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8, 0x32d8,
};

void LoadAndAdjustBGPaletteGreenTint(u16 bgId, u16 intensity, u16 mode);

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
        gMain.bgStripeDestPtr = (u32*)((u8*)gMain.bgStripeDestPtr + i);
    switch (gMain.unk258) {
    case 1:
    case 2:
    case 6: {
        u8 * src = gUnknown_0202B1C0;
        LZ77UnCompWram(bgData, src);
        bgData = (u8*)gMain.bgStripeDestPtr;
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
            gMain.bgStripeDestPtr = (void*)gMain.bgStripeDestPtr + size;
            bgData = gBackgroundTable[bgId].bgData;
            bgData += gMain.bgStripeOffsets[i];
        }
        switch (gMain.unk258) {
        case 1:
        case 2:
        case 6: {
            u8 * src = (void*)gSaveDataBuffer.bg0Map; // what
            LZ77UnCompWram(bgData, src);
            bgData = (void*)gMain.bgStripeDestPtr;
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
        dst = (void*)PLTT+0x1E0;
        break;
    case 40:
        src = NULL;
        dst = (void*)PLTT+0x1A0;
        break;
    case 37:
        src = gPal_BustupMia;
        dst = (void*)PLTT+0x1C0;
        break;
    default:
    case 36:
    case 38:
        src = NULL;
        dst = (void*)PLTT+0x1C0;
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
    dst = (void*)VRAM+0x8B00;
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
    src = (void*)gMapSpeedlines;
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
        src = (void*)gMapSpeedlines;
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
    src = (void*)gMapSpeedlines;
    dst = gBG3MapBuffer;
    DmaCopy16(3, src, dst, sizeof(gMapSpeedlines));
}

void sub_800610C(void)
{
    u16 * src;
    u16 * dst;
    src = (void*)gUnknown_08024E78;
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
