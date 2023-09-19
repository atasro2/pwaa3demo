#include "global.h"
#include "main.h"
#include "animation.h"
#include "sound.h"
#include "m4a.h"
#include "ewram.h"
#include "utils.h"
#include "script.h"
#include "background.h"
#include "court_record.h"
#include "investigation.h"
#include "save.h"
#include "court.h"
#include "declarations.h"
#include "constants/animation.h"

void UpdateSpecialEffects(void);

void nullsub_1(void) {

}

void sub_80001F0(void) {
    DmaCopy16(3, VRAM + 0xE2A0, OBJ_VRAM0 + 0x1FC0, 0x40);
    gOamObjects[0].attr0 = 0;
    gOamObjects[0].attr1 = 0;
    gOamObjects[0].attr2 = 0xFE;
}

void CheckClearSaveComboAndSwitchProcess(void)
{
    if ((gMain.process[GAME_PROCESS] == 0))
    {
        u16 keys = KEY_NEW();
        if(R_BUTTON & keys && B_BUTTON & keys)
            gMain.process[GAME_PROCESS] = 0xE;
    }
}

void sub_8000250(void){
    struct Main * main = &gMain;
    struct Struct30070E0 * struct30070E0 = &gUnknown_030070E0;
    u32 amplitude;
    u32 rand;
    u32 temp;
    switch (main->shakeIntensity)
    {
    case 0:
        amplitude = 1;
        break;
    case 1:
        amplitude = 3;
        break;
    case 2:
        amplitude = 6;
        break;
    default:
        amplitude = 3;
        break;
    }

    rand = Random() & 0xF;

    if (rand > 7)
    {
        main->shakeAmountX = rand & amplitude;
        main->shakeAmountX *= -1;
    }
    else
    {
        main->shakeAmountX = rand & amplitude;
    }

    rand = Random() & 0xF;

    if (rand > 7)
    {
        main->shakeAmountY = rand & amplitude;
        main->shakeAmountY *= -1;
    }
    else
    {
        main->shakeAmountY = rand & amplitude;
    }

    gIORegisters.lcd_bg3vofs = main->shakeAmountY + 8;
    if(main->currentBG != 0xE)
    {
        gIORegisters.lcd_bg3hofs = main->shakeAmountX + 8;
    }
    temp = main->shakeAmountY;
    if(struct30070E0->unk1E & 0x20)
        temp += 8;
    gIORegisters.lcd_bg2vofs = temp;
    temp = main->shakeAmountX + 8;
    if(struct30070E0->unk1E & 0x10)
        temp += 8;
    gIORegisters.lcd_bg2hofs = temp;
    gIORegisters.lcd_bg1vofs = main->shakeAmountX;
    gIORegisters.lcd_bg1hofs = main->shakeAmountY;
    if (main->currentBG == 0x11)
    {
        gIORegisters.lcd_bg0vofs = main->shakeAmountY;
        gIORegisters.lcd_bg0hofs = main->shakeAmountX;
    }
    else
    {
        gIORegisters.lcd_bg0vofs = main->shakeAmountX;
        gIORegisters.lcd_bg0hofs = main->shakeAmountY;
    }
    
    if (main->shakeTimer != 0)
    {
        main->shakeTimer--;
        if (main->shakeTimer == 0)
        {
            main->gameStateFlags &= ~1; // disable shakes
            gIORegisters.lcd_bg3vofs = 8;
            gIORegisters.lcd_bg3hofs = 8;
            gIORegisters.lcd_bg2vofs = (struct30070E0->unk1E & 0x20) ? 8 : 0;
            gIORegisters.lcd_bg2hofs = (struct30070E0->unk1E & 0x10) ? 16 : 8;
            gIORegisters.lcd_bg1vofs = 0;
            gIORegisters.lcd_bg1hofs = 0;
            gIORegisters.lcd_bg0vofs = 0;
            gIORegisters.lcd_bg0hofs = 0;
            main->shakeAmountX = 0;
            main->shakeAmountY = 0;
        }
    }
}

void AgbMain(void)
{
    struct Main * main = &gMain;
    
    DmaFill32(3, 0, IWRAM_START, 0x7E00); // clear IWRAM

    reset:
    ClearRamAndInitGame();
    CheckClearSaveComboAndSwitchProcess();
    for(;;)
    {
        if (ReadKeysAndTestResetCombo())
            goto reset; // tfw no SoftReset

        gMain.vblankWaitCounter = 0;

        waitForVblank:
        if(gMain.vblankWaitCounter != gMain.vblankWaitAmount) goto waitForVblank;

        if(main->unk2C7 == 0) {
            if (gMain.currentBgStripe == 0)
            {
                gMain.unk0++;
                UpdateBackground();
                UpdateBGTilemaps();
                MoveAnimationTilesToRam(0);
                MoveSpritesToOAM();
                SetLCDIORegs();
                RunScriptContext();
                UpdateTextbox();
                UpdateItemPlate(&gMain);
                DoGameProcess();
                UpdateAnimations(gMain.previousBG);
                UpdateHardwareBlend();
                UpdateSpecialEffects();
            } else {
                sub_80139F4();
                nullsub_7();
                sub_8013B84(gMain.previousBG);
                if (gMain.currentBgStripe > 10)
                {
                    gMain.currentBgStripe = 0;
                    if(gMain.unk258 != 0) {
                        gSaveDataBuffer.main.currentBG = gMain.currentBG;
                        switch(gMain.unk258)
                        {
                        case 5:
                            sub_800482C(gMain.currentBG);
                            gMain.currentBG = gMain.previousBG;
                            sub_80049A0(gMain.currentBG);
                            break;
                        case 6:
                        case 7:    
                            sub_800482C(gMain.currentBG);
                            gMain.currentBG = gMain.previousBG;
                            break;
                        }
                        gMain.unk258 = 0;
                    } else {
                        struct Struct30070E0 * struct30070E0 = &gUnknown_030070E0;
                        if(gMain.currentBG == 0xE
                        && !(gMain.unk3D & 4)) {
                            sub_80049A0(gMain.currentBG);
                            struct30070E0->unk2F = 0x1F;
                            struct30070E0->unk30 = 2;
                            sub_801DF10(struct30070E0);
                        } else if(struct30070E0->unk3E == 0xFFFE) {
                            struct30070E0->unk2F = 0x12;
                            struct30070E0->unk30 = 0;
                            sub_801DF10(struct30070E0);
                            sub_80049A0(gMain.currentBG);
                            struct30070E0->unk3E = 0;
                        } else {
                            nullsub_8(gMain.currentBG, 0);
                            sub_80049A0(gMain.currentBG);
                        }
                    }
                } else {
                    DecompressCurrentBGStripe(gMain.currentBG);
                }
            }
            sub_801FFBC();
        } else {
            if (gMain.currentBgStripe == 0)
                nullsub_1();
        }
        UpdateBGMFade();
        m4aSoundMain();
        sub_800156C();
        nullsub_6(gMain.process[GAME_PROCESS], 10, 0, 2);
        nullsub_6(gMain.process[GAME_PROCESS_STATE], 12, 0, 2);
        nullsub_6(gMain.process[GAME_PROCESS_VAR1], 14, 0, 2);
        nullsub_6(gMain.process[GAME_PROCESS_VAR2], 16, 0, 2);
        if(gMain.unk2D0 & 2)
            sub_80015CC();
        if(gMain.unk2D0 & 1)
            sub_80015E8();
    }
}
