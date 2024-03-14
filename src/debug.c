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
    u8 fill18[0x4];
    struct AnimationListEntry anim;
    u8 unk60;
    u8 unk61;
    u8 fill62[0x2];
    u16 map[0x400];
    struct OamAttrs oam[128];
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