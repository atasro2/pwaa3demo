#include "global.h"
#include "main.h"
#include "background.h"
#include "animation.h"
#include "declarations.h"

struct DebugContext {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 process[4];
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    u16 unk14;
    u16 unk16;
    u8 unk18;
    u8 unk19;
    u8 fill1A[0x2];
    /* +0x1C */ struct AnimationListEntry anim;
    u8 unk60;
    u8 unk61;
    u8 fill62[0x2];
    /* +0x64 */ u16 map[0x400];
    /* +0x864 */ struct OamAttrs oam[128];
    /* +0xC64 */ struct DebugC64 {
        u16 unk00;
        u16 unk02;
        u8 unk04;
        u8 unk05;
        u8 unk06;
        s8 unk07;
        u16 unk08;
    } unkC64;
};

extern struct DebugContext gDebugCtx;

void sub_800156C(void) {
    nullsub_20("/   ", 26, 0);
    sub_8006470(*(u8*)REG_ADDR_VCOUNT, 27, 0);
    if (gMain.unk0 & 1) {
        nullsub_20("0", 6, 0);
    } else {
        nullsub_20("1", 6, 0);
    }
    nullsub_20("      ", 11, 0);
}

void sub_80015CC(void) {
    gOamObjects[0].attr0 = 0;
    gOamObjects[0].attr1 = 8 + *(u8*)REG_ADDR_VCOUNT;
    gOamObjects[0].attr2 = 0xFE;
}

void sub_80015E8(void) {
    struct Main * main = &gMain;
    u32 i;

    main->unk19 = FALSE;
    for(i = 0; i < 0x100; i++) {
        gBG1MapBuffer[0x180 + i] = 0;
    }
}

void nullsub_10() {

}

void sub_8001610(u16 arg0, u16 arg1, u16 arg2, u16 arg3) {
    s32 i, j;
    for(i = arg0; i <= arg1; i++) {
        for(j = arg2; j <= arg3; j++) {
            nullsub_20(" ", i, j);
        }
    }
}

void DebugProcessInit(struct DebugContext * debug) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct Main * main = &gMain;
    int i;

    debug->unk3 = 0;
    debug->unk2 = 0;
    debug->unk1 = 0;
    debug->unk0 = 0;
    main->process[GAME_PROCESS_STATE] = 1;
    debug->unk8 = ioRegs->lcd_dispcnt;
    debug->unkA = ioRegs->lcd_win0h;
    debug->unkC = ioRegs->lcd_win0v;
    debug->unkE = ioRegs->lcd_winin;
    debug->unk10 = ioRegs->lcd_winout;
    debug->unk14 = ioRegs->lcd_bg3hofs;
    debug->unk16 = ioRegs->lcd_bg3vofs;
    DmaCopy16(3, gOamObjects, debug->oam, OAM_SIZE);
    debug->unk60 = main->unk19;
    debug->unk61 = main->unk18;
    main->unk19 = FALSE;
    main->unk18 = FALSE;
    for(i = 0; i < 128; i++)
        gOamObjects[i].attr1 = 0x12C;
    debug->anim = gAnimation[0];
    gAnimation[0].next = NULL;
    DmaCopy16(3, gBG3MapBuffer, debug->map, 0x800);
    ioRegs->lcd_bg3hofs = 8;
    ioRegs->lcd_bg3vofs = 8;
    main->unk260 &= ~4;
}

void DebugProcessMain(struct DebugContext * debug) {
    int length = 7;
    nullsub_20("DEBUG MENU", 10, 3);
    nullsub_20(" VRAM VIEW", 9, 5);
    nullsub_20(" SOUND TEST", 9, 6);
    nullsub_20(" OBJ TEST", 9, 7);
    nullsub_20(" MOVIE TEST", 9, 8);
    nullsub_20(" FLAG EDIT", 9, 9);
    nullsub_20(" SCENARIO", 9, 10);
    nullsub_20(" EXIT", 9, 11);
    nullsub_20(">", 9, 5 + debug->unk0);
    if((gJoypad.pressedKeys & DPAD_UP) && debug->unk0 > 0) {
        debug->unk0--;
    } else if((gJoypad.pressedKeys & DPAD_DOWN) && debug->unk0 < length - 1) {
        debug->unk0++;
    } else if(gJoypad.pressedKeys & A_BUTTON) {
        gMain.process[GAME_PROCESS_STATE] = 2;
        sub_8001610(0, 29, 0, 19);
    }
}

void (*(gUnknown_0814D348)[])(struct DebugContext * debug);
void DebugProcessSubMenuMain(struct DebugContext * debug) {
    gUnknown_0814D348[debug->unk0](debug);
}

void DebugProcessExit(struct DebugContext * debug) {
    struct Main * main = &gMain;
    struct IORegisters * ioRegs = &gIORegisters;
    DmaCopy16(3, debug->map, gBG3MapBuffer, 0x800);
    ioRegs->lcd_dispcnt = debug->unk8;
    ioRegs->lcd_win0h = debug->unkA;
    ioRegs->lcd_win0v = debug->unkC;
    ioRegs->lcd_winin = debug->unkE;
    ioRegs->lcd_winout = debug->unk10;
    ioRegs->lcd_bg3hofs = debug->unk14;
    ioRegs->lcd_bg3vofs = debug->unk16;
    gAnimation[0] = debug->anim;
    ActivateAllAllocatedAnimations();
    DmaCopy16(3, debug->oam, gOamObjects, OAM_SIZE);
    sub_8001610(0, 29, 0, 19);
    main->unk19 = debug->unk60;
    main->unk18 = debug->unk61;
    *(u32*)main->process = *(u32*)gDebugCtx.process;
}

void DebugProcess(struct Main * main) {
    extern void (*gUnknown_0814D364[])(struct DebugContext * debug);
    gUnknown_0814D364[main->process[GAME_PROCESS_STATE]](&gDebugCtx);
}

void sub_8001918(struct DebugContext * debug) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct DebugC64 * debugC64 = &debug->unkC64;
    ioRegs->lcd_dispcnt |= DISPCNT_WIN0_ON;
    ioRegs->lcd_win0v = WIN_RANGE(16, 144);
    ioRegs->lcd_win0h = WIN_RANGE(16, 144);
    ioRegs->lcd_winin = WININ_WIN0_BG0 | WININ_WIN0_OBJ;
    ioRegs->lcd_winout = WINOUT_WIN01_BG0;
    debugC64->unk08 = ioRegs->lcd_bg3cnt;
    ioRegs->lcd_bg3cnt &= ~(BGCNT_256COLOR | 0xC);
    nullsub_20("OBJ MODE", 20, 3);
    nullsub_20("16  COL ", 20, 4);
    nullsub_20("0   PAL ", 20, 5);
    nullsub_20("0   BG", 20, 6);
    debugC64->unk00 = 0;
    debugC64->unk02 = 0;
    debugC64->unk04 = 0;
    debugC64->unk05 = 0;
    debugC64->unk06 = 0;
    debugC64->unk07 = 4;
    debug->unk1++;
}

void sub_80019C0(struct DebugContext * debug) {
    char addresses[][3] = {
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "O"
    };
    struct DebugC64 * debugC64 = &debug->unkC64;
    u8 i;

    if(gJoypad.heldKeys & DPAD_ANY)
        debug->unk18++;
    else {
        *(u16*)&debug->unk18 = 0;
    }

    if(debug->unk19) {
        debug->unk18 &= 1;
    } else {
        debug->unk18 &= 0x1F;
        if(debug->unk18 == 0x1F)
            debug->unk19 = 1;
    }
    if(debug->unk18 == 1) {
        if(gJoypad.heldKeys & DPAD_UP) {
            if(debugC64->unk02 > 0)
                debugC64->unk02--;
        } else if(gJoypad.heldKeys & DPAD_DOWN) {
            if(debugC64->unk02 <= 0xF)
                debugC64->unk02++;
        } else if(gJoypad.heldKeys & DPAD_LEFT) {
            if(debugC64->unk00 > 0)
                debugC64->unk00--;
        } else if(gJoypad.heldKeys & DPAD_RIGHT) {
            if(debugC64->unk00 <= 0xF)
                debugC64->unk00++;
        }
    }
    for(i = 0; i < 0x10; i++) {
        if(debugC64->unk00 + i <= 0x10) {
            nullsub_20(addresses[debugC64->unk00 + i], i + 2, 1);
        } else {
            nullsub_20(addresses[debugC64->unk00 + i-0x10], i + 2, 1);
        }
    }
    if(debugC64->unk00 == 0x10) {
        nullsub_20("1\0", 1, 1);
    } else {
        nullsub_20(" ", 1, 1);
    }
    for(i = 0; i < 0x10; i++) {
        if(debugC64->unk02 + i < 0x10) {
            nullsub_20(" ", 0, i + 2);
            nullsub_20(addresses[debugC64->unk02 + i], 1, i + 2);
        } else {
            nullsub_20("1\0", 0, i + 2);
            nullsub_20(addresses[debugC64->unk02 + i-0x10], 1, i + 2);
        }
    }
}

void sub_8001B2C(struct DebugContext * debug) {
    u16 r6;
    u8 i, j;
    struct DebugC64 * debugC64 = &debug->unkC64;
    if(debugC64->unk07 == 4)
        sub_80019C0(debug);
    r6 = 0;
    if(debugC64->unk05)
        debugC64->unk02 = 0;
    for(i = 0; i < 16; i++) {
        for(j = 0; j < 8; j++) {
            gOamObjects[r6].attr0 = (debugC64->unk05 << 13) + 16 + (ST_OAM_H_RECTANGLE << 14) + i * 8;
            gOamObjects[r6].attr1 = SPRITE_ATTR1_NONAFFINE(16 + j * 16, FALSE, FALSE, 0);
            gOamObjects[r6].attr2 = (debugC64->unk04 << 12) + (debugC64->unk00 + j*2) + (debugC64->unk02 + i) * 32;
            r6++;
        }
    }
}

void sub_8001BBC(struct DebugContext * debug) {
    struct DebugC64 * debugC64 = &debug->unkC64;
    u8 i, j;
    
    if(debugC64->unk07 == 4)
        sub_80019C0(debug);
    for(i = 0; i < 16; i++) {
        for(j = 0; j < 16; j++) {
            gBG3MapBuffer[j + (i + 2) * 32 + 0x23] = (debugC64->unk02 + i) * 32 + j + debugC64->unk00 + (debugC64->unk04 << 12);
        }
    }
}

void sub_8001C24(struct DebugContext * debug) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct DebugC64 * debugC64 = &debug->unkC64;
    s32 i;
    for(i = 0; i < 4; i++) {
        nullsub_20("  ", 18, 3 + i);
    }
    if(gJoypad.pressedKeys & A_BUTTON) {
        debugC64->unk07 = 4;
        return;
    } else if(gJoypad.pressedKeys & DPAD_UP) {
        debugC64->unk07--;
        if(debugC64->unk07 < 0)
            debugC64->unk07 = 3;
    } else if(gJoypad.pressedKeys & DPAD_DOWN) {
        debugC64->unk07++;
        if(debugC64->unk07 > 3)
            debugC64->unk07 = 0;
    }
    nullsub_20(" >", 18, debugC64->unk07 + 3);
    switch(debugC64->unk07) {
        case 0:
            if(gJoypad.pressedKeys & DPAD_LEFT || gJoypad.pressedKeys & DPAD_RIGHT) {
                if(debug->unk1 == 2) {
                    debug->unk1 = 1;
                    ioRegs->lcd_winin = WININ_WIN0_BG0 | WININ_WIN0_OBJ;
                    nullsub_20("OBJ MODE", 20, 3);
                } else {
                    debug->unk1 = 2;
                    ioRegs->lcd_winin = WININ_WIN0_BG0 | WININ_WIN0_BG3;
                    nullsub_20("SCR MODE", 20, 3);
                }
            }
            break;
        case 1:
            if(gJoypad.pressedKeys & DPAD_LEFT || gJoypad.pressedKeys & DPAD_RIGHT) {
                if(debugC64->unk05) {
                    ioRegs->lcd_bg3cnt &= ~BGCNT_256COLOR;
                    debugC64->unk05 = 0;
                    nullsub_20("16  COL", 20, 4);
                } else {
                    ioRegs->lcd_bg3cnt |= BGCNT_256COLOR;
                    ioRegs->lcd_bg3cnt &= ~0xC; // clear char base
                    debugC64->unk06 = 0;
                    debugC64->unk05 = 1;
                    nullsub_20("256 COL", 20, 4);
                    nullsub_20("0   PAL", 20, 5);
                    nullsub_20("0   BG", 20, 6);
                }
            } 
            break;
        case 2:
            if(debugC64->unk05 == 0) {
                if(gJoypad.pressedKeys & DPAD_LEFT)
                    debugC64->unk04--;
                else if(gJoypad.pressedKeys & DPAD_RIGHT) 
                    debugC64->unk04++;
                debugC64->unk04 &= 0xF;
                nullsub_20("    PAL", 20, 5);
                sub_8006470(debugC64->unk04, 20, 5);
            } else {
                nullsub_20("0   PAL", 20, 5);
            }
            break;
        case 3:
            if(debug->unk1 == 2) {
                if(debugC64->unk05 == 0) {
                    if(gJoypad.pressedKeys & DPAD_LEFT && debugC64->unk06 > 0)
                        debugC64->unk06--;
                    else if(gJoypad.pressedKeys & DPAD_RIGHT && debugC64->unk06 < 2)
                        debugC64->unk06++;
                    
                    // set charbase
                    ioRegs->lcd_bg3cnt &= ~0xC;
                    ioRegs->lcd_bg3cnt |= debugC64->unk06 << 2;
                    ioRegs->lcd_winin = WININ_WIN0_BG0 | WININ_WIN0_BG3;
                    nullsub_20("    BG", 20, 6);
                    sub_8006470(debugC64->unk06, 20, 6);
                }
            }
            break;
    }
    // _08001E52
}

void sub_8001E60(struct DebugContext * debug) {
    struct DebugC64 * debugC64 = &debug->unkC64;
    struct IORegisters * ioRegs = &gIORegisters;
    s32 i, j;
    s32 oam;
    
    gMain.process[GAME_PROCESS_STATE] = 3;
    debugC64->unk07 = 4;
    ioRegs->lcd_bg3cnt = debugC64->unk08;
    for(i = 0, oam = 0; i < 16; i++) {
        for(j = 0; j < 8; j++) {
            gOamObjects[oam].attr1 = SPRITE_ATTR1_NONAFFINE(300, FALSE, FALSE, 0);
            oam++;
        }
    }
}

extern void (*gUnknown_0814D374[])(struct DebugContext * debug);

void sub_8001EB0(struct DebugContext * debug) {
    struct DebugC64 * debugC64 = &debug->unkC64;
    if(gJoypad.pressedKeys & START_BUTTON)
        debug->unk1 = 3;
    gUnknown_0814D374[debug->unk1](debug);
    if(debugC64->unk07 != 4)
        sub_8001C24(debug);
    else if(gJoypad.pressedKeys & A_BUTTON)
        debugC64->unk07 = 0;
}
