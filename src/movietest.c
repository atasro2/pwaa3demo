#include "global.h"
#include "debug.h"
#include "animation.h"
#include "background.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

extern char gUnknown_080281F0[];
extern char gUnknown_08028208[];
extern char gUnknown_08028214[];
extern char gUnknown_08028220[];
extern char gUnknown_0802822C[];
extern char gUnknown_08028238[];

void sub_8014400(struct DebugContext * debugCtx) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct CourtScrollDebug * courtScrollDebug = &debugCtx->menu.courtScroll;
    struct AnimationListEntry * anim;
    anim = FindAnimationFromAnimId(0xFF);
    courtScrollDebug->animPtr = anim;
    courtScrollDebug->anim = *anim;
    ClearAllAnimationSprites();
    anim->flags = 0;
    courtScrollDebug->unk48 = 0;
    courtScrollDebug->unk49 = 0;
    debugCtx->unk1++;
    ioRegs->lcd_dispcnt &= ~DISPCNT_BG1_ON;
    CopyBGDataToVram(2);
    PlayPersonAnimation(17 , 0, 0, 0);
}

void sub_801447C(struct DebugContext * debugCtx) {
    struct CourtScroll * courtScroll = &gCourtScroll;
    struct CourtScrollDebug * courtScrollDebug = &debugCtx->menu.courtScroll;
    u32 r8 = 0;
    FindAnimationFromAnimId(0xFF); // !??
    if(courtScroll->state)
        return;
    nullsub_20(gUnknown_080281F0, 0, 2); // "                       "
    if(gJoypad.pressedKeys & DPAD_UP) {
        courtScrollDebug->unk48--;
        r8 = 1;
        if(courtScrollDebug->unk48 < 0) {
            courtScrollDebug->unk48 = 2;
        }
    } else if(gJoypad.pressedKeys & DPAD_DOWN) {
        courtScrollDebug->unk48++;
        r8 = 1;
        if(courtScrollDebug->unk48 > 2) {
            courtScrollDebug->unk48 = 0;
        }
    } else if(gJoypad.pressedKeys & A_BUTTON) {
        void * pal = NULL;
        switch(courtScrollDebug->unk48) {
            case 0:
                pal = gPalCourtScroll;
                if(courtScrollDebug->unk49) {
                    SetCourtScrollPersonAnim(1, 1, 0x11, 0);
                } else {
                    SetCourtScrollPersonAnim(1, 0x1000, 3, 0);
                }
                break;
            case 1:
                pal = gPalCourtScroll;
                if(courtScrollDebug->unk49) {
                    SetCourtScrollPersonAnim(2, 1, 0x11, 0);
                }
                break;
            case 2:
                pal = gPalCourtScroll;
                if(courtScrollDebug->unk49) {
                    SetCourtScrollPersonAnim(0, 1, 3, 0);
                }
                break;
            default:
                break;
        }
        if(courtScrollDebug->unk49) {
            InitCourtScroll(pal, 30, 31, 1);
            courtScrollDebug->unk49 = 0;
        } else {
            InitCourtScroll(pal, 0, 31, 0x1000);
            courtScrollDebug->unk49 = 1;
        }
    }
    if(r8) {
        courtScrollDebug->unk49 = 0;
        switch(courtScrollDebug->unk48) {
            case 0:
                CopyBGDataToVram(2);
                PlayPersonAnimation(17,0,0,0);
                break;
            case 1:
                CopyBGDataToVram(2);
                PlayPersonAnimation(17,0,0,0);
                break;
            case 2:
                CopyBGDataToVram(1);
                PlayPersonAnimation(3,0,0,0);
                break;
            default:
                break;
        }
    }
    nullsub_20(gUnknown_08028208, 10, 5); // "MOVIE TEST"
    nullsub_20(gUnknown_08028214, 10, 6); // " MOVIE00"
    nullsub_20(gUnknown_08028220, 10, 7); // " MOVIE01"
    nullsub_20(gUnknown_0802822C, 10, 8); // " MOVIE02"
    nullsub_20(gUnknown_08028238, 10, 6 + courtScrollDebug->unk48); // ">"
}

void sub_8014688(struct DebugContext * debugCtx) {
    struct CourtScrollDebug * courtScrollDebug = &debugCtx->menu.courtScroll;
    DestroyAnimation(&gAnimation[0xFF]); // !!!!?????
    *courtScrollDebug->animPtr = courtScrollDebug->anim;
    gMain.process[GAME_PROCESS_STATE] = 3;
}

extern void (*gDebugMovieTestStates[])(struct DebugContext *ctx);

void sub_80146B8(struct DebugContext * debugCtx) {
    if(gJoypad.pressedKeys & START_BUTTON)
        debugCtx->unk1 = 2;
    sub_8001610(10, 20, 5, 10);
    gDebugMovieTestStates[debugCtx->unk1](debugCtx);
}