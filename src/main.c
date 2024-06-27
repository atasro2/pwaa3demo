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
#include "graphics.h"
#include "constants/animation.h"
#include "constants/oam_allocations.h"

void UpdateSpecialEffects(void);

static void UpdateCourtScroll(struct CourtScroll *);

void (*gGameProcesses[])(struct Main *) = {
    CapcomLogoProcess,
    TitleScreenProcess,
    GameOverScreenProcess,
    CourtProcess,
    InvestigationProcess,
    TestimonyProcess,
    QuestioningProcess,
    CourtRecordProcess,
    EvidenceAddedProcess,
    VerdictProcess,
    SaveGameProcess,
    EpisodeClearedProcess,
    SelectEpisodeProcess,
    ContinueSaveProcess,
    ClearSaveProcess,
    sub_80018F8
};
extern void (*gIntrTable[0x10]);

static void (* const IntrTableFunctionPtrs[])() =
{
    VBlankIntr,
    HBlankIntr,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy,
    IntrDummy
};

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

void UpdateScreenShake(void){
    struct Main * main = &gMain;
    struct ScriptContext * scriptCtx = &gScriptContext;
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
    if(scriptCtx->unk1E & 0x20)
        temp += 8;
    gIORegisters.lcd_bg2vofs = temp;
    temp = main->shakeAmountX + 8;
    if(scriptCtx->unk1E & 0x10)
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
            gIORegisters.lcd_bg2vofs = (scriptCtx->unk1E & 0x20) ? 8 : 0;
            gIORegisters.lcd_bg2hofs = (scriptCtx->unk1E & 0x10) ? 16 : 8;
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
                        struct ScriptContext * ScriptContext = &gScriptContext;
                        if(gMain.currentBG == 0xE
                        && !(gMain.unk3D & 4)) {
                            sub_80049A0(gMain.currentBG);
                            ScriptContext->unk2F = 0x1F;
                            ScriptContext->unk30 = 2;
                            sub_801DF10(ScriptContext);
                        } else if(ScriptContext->unk3E == 0xFFFE) {
                            ScriptContext->unk2F = 0x12;
                            ScriptContext->unk30 = 0;
                            sub_801DF10(ScriptContext);
                            sub_80049A0(gMain.currentBG);
                            ScriptContext->unk3E = 0;
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

void DoGameProcess(void)
{
    struct CourtScroll *courtScroll = &gCourtScroll;
    struct Main *main = &gMain;

    u8 amplitude;
    u8 rand;

    if (main->gameStateFlags & 1)
    {
        UpdateScreenShake();
    }
    else
    {
        main->shakeAmountY = 0;
        main->shakeAmountX = 0;
    }
    ProcessHPBar();
    gGameProcesses[gMain.process[GAME_PROCESS]](&gMain);
    sub_8006470(gMain.unk4 / 3600, 0, 2);
    gMain.unk4++;

    if (courtScroll->state != 0)
    {
        UpdateCourtScroll(courtScroll);
    }
}

void ClearRamAndInitGame(void)
{
    struct Main *main = &gMain;
    struct IORegisters *ioRegsp = &gIORegisters;
    u32 temp = main->process[GAME_PROCESS] ? 1 : 0;

    RegisterRamReset(RESET_SIO_REGS | RESET_SOUND_REGS | RESET_REGS);
    DmaFill32(3, 0, IWRAM_START, 0x7E00);  // Clear IWRAM
    DmaFill32(3, 0, EWRAM_START, 0x40000); // Clear EWRAM

    SET_PROCESS(temp, 0, 0, 0);

    RegisterRamReset(RESET_OAM | RESET_VRAM | RESET_PALETTE);

    for (temp = 0; temp < ARRAY_COUNT(IntrTableFunctionPtrs); temp++)
    {
        gIntrTable[temp] = IntrTableFunctionPtrs[temp];
    }

    m4aSoundInit();
    REG_WAITCNT = WAITCNT_SRAM_4 | WAITCNT_WS0_N_3 | WAITCNT_WS0_S_1 | WAITCNT_WS1_N_4 | WAITCNT_WS1_S_4 | WAITCNT_WS2_N_4 | WAITCNT_WS2_S_8 | WAITCNT_PHI_OUT_NONE | WAITCNT_PREFETCH_ENABLE;
    ioRegsp->iwp_ie = INTR_FLAG_VBLANK | INTR_FLAG_GAMEPAK;
    ioRegsp->lcd_dispstat = DISPSTAT_VBLANK_INTR;
    ioRegsp->lcd_bldcnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_DARKEN;
    ioRegsp->lcd_bldy = 0x10;
    REG_IE = ioRegsp->iwp_ie;
    REG_DISPSTAT = ioRegsp->lcd_dispstat;
    REG_IME = TRUE;
}

void ResetGameState(void)
{
    struct IORegisters *ioRegsp = &gIORegisters;
    struct Main *main = &gMain;
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill16(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    DmaFill16(3, 0, &gMain, sizeof(gMain));
    ClearSectionReadFlags(main);
    DmaFill16(3, 0, &gScriptContext, 0x9C);
    DmaFill16(3, 0, &gCourtScroll, sizeof(gCourtScroll));
    DmaFill16(3, 0, &gTestimony, sizeof(gTestimony));
    DmaFill16(3, 0, &gInvestigation, sizeof(gInvestigation));
    DmaFill16(3, 0, &gCourtRecord, sizeof(gCourtRecord));
    DmaFill16(3, 0, &gSaveDataBuffer, sizeof(gSaveDataBuffer));
    main->rngSeed = 3383;
    main->scenarioIdx = 0;
    main->caseEnabledFlags = 1;
    ioRegsp->lcd_bg0cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(28) | BGCNT_16COLOR | BGCNT_WRAP;                 // TODO: add TXT/AFF macro once known which one is used
    ioRegsp->lcd_bg1cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29) | BGCNT_16COLOR | BGCNT_WRAP;                 // TODO: add TXT/AFF macro once known which one is used
    ioRegsp->lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP;                 // TODO: add TXT/AFF macro once known which one is used
    ioRegsp->lcd_bg3cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_MOSAIC | BGCNT_256COLOR | BGCNT_WRAP; // TODO: add TXT/AFF macro once known which one is used
    ioRegsp->lcd_bldcnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_DARKEN;
    ioRegsp->lcd_bldy = 0x10;
    HideAllSprites();
    InitBGs();
    ResetAnimationSystem(); //init animation system?
    ResetSoundControl();
    LoadCurrentScriptIntoRam();
    nullsub_10();
    ResetHPBar();
    ResetHPBarHealthToMax();
    SetTimedKeysAndDelay(DPAD_RIGHT | DPAD_LEFT, 15);
    m4aMPlayAllStop();
}

void sub_8000844(void) // partial ResetGameState
{
    struct IORegisters *ioRegsp = &gIORegisters;
    struct Main *main = &gMain;
    DmaFill16(3, 0, OAM, OAM_SIZE);
    ClearSectionReadFlags(main);
    DmaFill16(3, 0, &gCourtScroll, sizeof(gCourtScroll));
    DmaFill16(3, 0, &gTestimony, sizeof(gTestimony));
    DmaFill16(3, 0, &gInvestigation, sizeof(gInvestigation));
    DmaFill16(3, 0, &gCourtRecord, sizeof(gCourtRecord));
    DmaFill16(3, 0, &gSaveDataBuffer, sizeof(gSaveDataBuffer));
    main->rngSeed = 3383;
    main->scenarioIdx = 0;
    main->caseEnabledFlags = 1;
    ioRegsp->lcd_bg0cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(28) | BGCNT_16COLOR | BGCNT_WRAP;                 // TODO: add TXT/AFF macro once known which one is used
    ioRegsp->lcd_bg1cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29) | BGCNT_16COLOR | BGCNT_WRAP;                 // TODO: add TXT/AFF macro once known which one is used
    ioRegsp->lcd_bg3cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_MOSAIC | BGCNT_256COLOR | BGCNT_WRAP; // TODO: add TXT/AFF macro once known which one is used
    HideAllSprites();
    ResetAnimationSystem(); //init animation system?
    nullsub_10();
    ResetHPBar();
    ResetHPBarHealthToMax();
    SetTimedKeysAndDelay(DPAD_RIGHT | DPAD_LEFT, 15);
}

void HideAllSprites(void)
{
    u32 i;
    for (i = 0; i < MAX_OAM_OBJ_COUNT; i++)
        gOamObjects[i].attr0 = SPRITE_ATTR0_CLEAR;
}

void SetLCDIORegs(void)
{
    struct IORegisters *ioRegsp = &gIORegisters;
    REG_IE = ioRegsp->iwp_ie;
    REG_DISPSTAT = ioRegsp->lcd_dispstat;
    REG_DISPCNT = ioRegsp->lcd_dispcnt;
    DataCopy32(&REG_WIN0H, &ioRegsp->lcd_win0h);
    DataCopy32(&REG_WIN0V, &ioRegsp->lcd_win0v);
    DataCopy32(&REG_WININ, &ioRegsp->lcd_winin);
    DataCopy32(&REG_MOSAIC, &ioRegsp->lcd_mosaic); // this writes to REG_BLDCNT, it shouldn't, should theoretically just write 0.
    REG_BLDCNT = ioRegsp->lcd_bldcnt;
    REG_BLDALPHA = ioRegsp->lcd_bldalpha;
    REG_BLDY = ioRegsp->lcd_bldy;
}

void ReadKeys(void)
{
    struct Joypad *joypadCtrl = &gJoypad;
    u16 keyInput = KEY_NEW();

    joypadCtrl->previousHeldKeys = joypadCtrl->heldKeys;
    joypadCtrl->previousPressedKeys = joypadCtrl->pressedKeys;
    joypadCtrl->heldKeys = KEY_NEW();
    joypadCtrl->pressedKeys = keyInput & ~joypadCtrl->previousHeldKeys;
    joypadCtrl->activeTimedKeys = 0;

    if (KEY_NEW() & joypadCtrl->timedKeys)
    {
        if (joypadCtrl->timedHoldTimer >= joypadCtrl->timedHoldDelay)
        {
            joypadCtrl->timedHoldTimer = 0;
            joypadCtrl->activeTimedKeys = keyInput & joypadCtrl->timedKeys;
        }
        else
        {
            joypadCtrl->timedHoldTimer++;
        }
    }
    else
    {
        joypadCtrl->timedHoldTimer = joypadCtrl->timedHoldDelay;
    }
}

void SetTimedKeysAndDelay(u32 keyBits, u32 delay)
{
    gJoypad.timedKeys = keyBits;
    gJoypad.timedHoldDelay = delay;
}

u32 ReadKeysAndTestResetCombo(void)
{
    struct Main *main = &gMain;
    struct Joypad *joypadCtrl = &gJoypad;
    if (main->currentBgStripe == 0)
        ReadKeys();

    main->vblankWaitAmount = 1;

    if (joypadCtrl->heldKeys == (A_BUTTON|B_BUTTON|START_BUTTON|SELECT_BUTTON))
        return 1;

    return 0;
}

void InitCourtScroll(u8 * arg0, u32 arg1, u32 arg2, u32 arg3)
{
    gCourtScroll.frameDataPtr = arg0;
    gCourtScroll.state = arg3;
    gCourtScroll.frameCounter = arg1;
    gCourtScroll.endFrame = arg2;
    gMain.isBGScrolling = FALSE;
}

static void UpdateCourtScroll(struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    if (courtScroll->state & 1)
    {
        courtScroll->frameCounter--;
        if (courtScroll->frameCounter < 0)
        {
            courtScroll->state = 0;
            scriptCtx->unk1E &= ~0x200;
            scriptCtx->unk1E &= ~0x400;
        }
    }
    else
    {
        courtScroll->frameCounter++;
        if (courtScroll->frameCounter >= courtScroll->endFrame)
        {
            courtScroll->state &= 1;
            scriptCtx->unk1E &= 0xFDFF;
            scriptCtx->unk1E &= 0xFBFF;
        }
    }
}

void StartHardwareBlend(u32 mode, u32 delay, u32 deltaY, u32 target)
{
    gMain.blendTarget = target;
    gMain.blendMode = mode;
    gMain.blendDelay = delay;
    gMain.blendDeltaY = deltaY;
    gMain.blendCounter = 0;
}

void UpdateHardwareBlend(void)
{
    struct Main * main = &gMain;
    struct IORegisters * ioRegs = &gIORegisters;
    struct ScriptContext * scriptCtx = &gScriptContext;

    if(!(scriptCtx->unk1E & 0x4000)) {
        gIORegisters.lcd_dispcnt &= ~DISPCNT_WIN0_ON;
        gIORegisters.lcd_win0h = 0;
        gIORegisters.lcd_win0v = 0;
        gIORegisters.lcd_winin = 0;
        gIORegisters.lcd_winout = 0;
    }

    switch(main->blendMode)
    {
        case 0:
            break;
        case 1:
            ioRegs->lcd_bldcnt = main->blendTarget | BLDCNT_EFFECT_DARKEN;
            if(++main->blendCounter >= main->blendDelay)
            {
                main->blendCounter = 0;
                ioRegs->lcd_bldy -= main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if(ioRegs->lcd_bldy == 0 || main->blendDeltaY == 0)
            {
                struct AnimationListEntry *anim;
                ioRegs->lcd_bldy = 0;
                ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_EFFECT_BLEND;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
                main->blendMode = 0;
                anim = &gAnimation[1];
                if((anim->animationInfo.personId == 0xB || anim->animationInfo.personId == 0x21) && anim->flags & (0x10000000)) {
                    u16 i;
                    u8 * src;
                    u32 * dst;
                    anim = sub_8016FB4();
                    anim->flags |= 0x80;
                    anim->flags |= 0x22000000;
                    dst = gUnknown_0826F888;
                    src = gUnknown_08252498 + dst[1];
                    dst = (u32*)(OBJ_PLTT+0x1A0);
                    DmaCopy16(3, src, dst, 0x20);
                    REG_BLDALPHA = ioRegs->lcd_bldalpha;
                    REG_BLDCNT = ioRegs->lcd_bldcnt;
                    for(i = anim->animtionOamStartIdx; i < anim->animtionOamEndIdx; i++)
                    {
                        ((struct OamAttrs *)OAM)[i].attr0 |= 0x400;
                        gOamObjects[i].attr0 |= 0x400;
                    }
                }
            }
            break;
        case 2:
            ioRegs->lcd_bldcnt = main->blendTarget | BLDCNT_EFFECT_DARKEN;
            if(++main->blendCounter >= main->blendDelay)
            {
                main->blendCounter = 0;
                ioRegs->lcd_bldy += main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if(ioRegs->lcd_bldy == 0x10 || main->blendDeltaY == 0)
            {
                ioRegs->lcd_bldy = 0x10;
                main->blendMode = 0;
                main->blendCounter |= 0xFFFF;
            }
            break;
        case 3:
            ioRegs->lcd_bldcnt = main->blendTarget | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD;
            if(++main->blendCounter >= main->blendDelay)
            {
                main->blendCounter = 0;
                ioRegs->lcd_bldy -= main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if(ioRegs->lcd_bldy == 0 || main->blendDeltaY == 0)
            {
                ioRegs->lcd_bldy = 0;
                ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_EFFECT_BLEND;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
                main->blendMode = 0;
            }
            break;
        case 4:
            ioRegs->lcd_bldcnt = main->blendTarget | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD;
            if(++main->blendCounter >= main->blendDelay)
            {
                main->blendCounter = 0;
                ioRegs->lcd_bldy += main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if(ioRegs->lcd_bldy == 0x10 || main->blendDeltaY == 0)
            {
                ioRegs->lcd_bldy = 0x10;
                main->blendMode = 0;
                main->blendCounter |= 0xFFFF;
            }
            break;
    }
    if(gMain.itemPlateAction == 1
    && gMain.blendMode == 0) {
        if(gMain.blendCounter != 0xFFFF)
        {
            gIORegisters.lcd_dispcnt |= DISPCNT_WIN0_ON;
            gIORegisters.lcd_win0h = 239;
            gIORegisters.lcd_win0v = 100;
            gIORegisters.lcd_winin = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ;
            gIORegisters.lcd_winout = WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR;
        }
        else {
            gIORegisters.lcd_dispcnt &= ~DISPCNT_WIN0_ON;
            gIORegisters.lcd_win0h = 0;
            gIORegisters.lcd_win0v = 0;
            gIORegisters.lcd_winin = 0;
            gIORegisters.lcd_winout = 0;
        }
    }
}

void UpdateSpecialEffects(void)
{
    struct Main * main = &gMain;
    struct IORegisters * ioRegs = &gIORegisters;

    switch(main->effectType)
    {
        case 0:
        case 0xFFFD:
        case 0xFFFE:
        case 0xFFFF:
            break;
        case 1:
            if((ioRegs->lcd_mosaic & 0xFF) < main->effectIntensity) {
                ioRegs->lcd_mosaic = 0;
                main->effectCounter = 0;
                ioRegs->lcd_bg3cnt &= ~BGCNT_MOSAIC;
                ioRegs->lcd_bg2cnt &= ~BGCNT_MOSAIC;
                main->effectType = 0;
            } else {
                ioRegs->lcd_mosaic -= (main->effectIntensity << 8) + main->effectIntensity;
            }
            break;
        case 2:
            if((ioRegs->lcd_mosaic & 0xFF) + main->effectIntensity >= 0x100) {
                ioRegs->lcd_mosaic |= 0xFFFF; //??
                main->effectType |= 0xFFFF; // ?????
                main->effectCounter = 0;
            } else {
                ioRegs->lcd_mosaic += (main->effectIntensity << 8) + main->effectIntensity;
            }
            break;
        case 3:
        case 7:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity++;
                LoadAndAdjustBGPaletteByMode(main->currentBG, main->effectIntensity, 0);
                if(main->effectType == 3 && gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    LoadAndAdjustCurrentAnimation01PaletteByMode(main->effectIntensity, 0);
                if(main->currentBG == 1 
                || main->currentBG == 2 
                || main->currentBG == 3
                || main->currentBG == 0x81)
                    LoadAndAdjustCounselWitnessBenchPaletteByMode(main->currentBG, main->effectIntensity, 0);
            }
            
            if(main->effectIntensity == 0x20)
                main->effectType = 0xFFFD;
            break;
        case 4:
        case 8:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity--;
                LoadAndAdjustBGPaletteByMode(main->currentBG, main->effectIntensity, 0);
                if(main->effectType == 4 && gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    LoadAndAdjustCurrentAnimation01PaletteByMode(main->effectIntensity, 0);
                if(main->currentBG == 1 
                || main->currentBG == 2 
                || main->currentBG == 3)
                    LoadAndAdjustCounselWitnessBenchPaletteByMode(main->currentBG, main->effectIntensity, 0);
            }
            
            if(main->effectIntensity == 0)
                main->effectType = 0;
            break;
        case 5:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity--;
                LoadAndAdjustBGPaletteByMode(main->currentBG, main->effectIntensity, 1);
                if(gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    LoadAndAdjustCurrentAnimation01PaletteByMode(main->effectIntensity, 1);
                if(main->currentBG == 1
                || main->currentBG == 2 
                || main->currentBG == 3)
                    LoadAndAdjustCounselWitnessBenchPaletteByMode(main->currentBG, main->effectIntensity, 1);
            }
            
            if(main->effectIntensity == 0)
                main->effectType = 0;
            break;
        case 6:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity++;
                LoadAndAdjustBGPaletteByMode(main->currentBG, main->effectIntensity, 1);
                if(gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    LoadAndAdjustCurrentAnimation01PaletteByMode(main->effectIntensity, 1);
                if(main->currentBG == 1 
                || main->currentBG == 2 
                || main->currentBG == 3)
                    LoadAndAdjustCounselWitnessBenchPaletteByMode(main->currentBG, main->effectIntensity, 1);
            }
            
            if(main->effectIntensity == 0x20)
                main->effectType = 0xFFFE;
            break;
        case 9:
        case 11:
            if(main->effectDelay != 0)
            {
                main->effectCounter++;
                if(main->effectCounter >= main->effectDelay)
                {
                    main->effectCounter = 0;
                    main->effectIntensity++;
                    if(main->effectType == 11)
                        LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 2);
                    else
                        LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 0);
                }
            }
            if(main->effectIntensity == 0x20)
            {
                if(main->effectType == 11)
                    LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 2);
                else
                    LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 0);
                main->effectType = 0;
            }
            break;
        case 10:
        case 12:
            if(main->effectDelay != 0)
            {
                main->effectCounter++;
                if(main->effectCounter >= main->effectDelay)
                {
                    main->effectCounter = 0;
                    main->effectIntensity--;
                    if(main->effectType == 12)
                        LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 2);
                    else
                        LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 0);
                }
            }
            if(main->effectIntensity == 0)
            {
                if(main->effectType == 12)
                    LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 2);
                else
                    LoadAndAdjustAnimation10PaletteByMode(main->effectIntensity, 0);
                main->effectType = 0;
            }
            break;
        case 13:
        case 15:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity++;
                sub_8005A00(main->currentBG, main->effectIntensity, 0);
                if(main->effectType == 15 && gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    sub_8005BE8(main->effectIntensity, 0);
                if(main->currentBG == 1
                || main->currentBG == 2 
                || main->currentBG == 3)
                    sub_8005C88(main->currentBG, main->effectIntensity, 0);
            }
            
            if(main->effectIntensity == 0x20)
                main->effectType = 0xFFFC;
            break;
        case 14:
        case 16:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity--;
                sub_8005A00(main->currentBG, main->effectIntensity, 0);
                if(main->effectType == 16 && gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    sub_8005BE8(main->effectIntensity, 0);
                if(main->currentBG == 1
                || main->currentBG == 2 
                || main->currentBG == 3)
                    sub_8005C88(main->currentBG, main->effectIntensity, 0);
            }
            
            if(main->effectIntensity == 0)
                main->effectType = 0;
            break;
        case 17:
            if(main->effectDelay != 0)
            {
                main->effectCounter++;
                if(main->effectCounter >= main->effectDelay)
                {
                    main->effectCounter = 0;
                    main->effectIntensity++;
                    nullsub_3(main->effectIntensity, 0);
                }
            }
            if(main->effectIntensity == 0x20)
            {
                nullsub_3(main->effectIntensity, 0);
                main->effectType = 0;
            }
            break;
        case 18:
            if(main->effectDelay != 0)
            {
                main->effectCounter++;
                if(main->effectCounter >= main->effectDelay)
                {
                    main->effectCounter = 0;
                    main->effectIntensity--;
                    nullsub_3(main->effectIntensity, 0);
                }
            }
            if(main->effectIntensity == 0)
            {
                nullsub_3(main->effectIntensity, 0);
                main->effectType = 0;
            }
            break;
        case 19:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                ioRegs->lcd_mosaic = ((gScriptContext.unk46 + (main->effectIntensity & Random())) << 8)
                                   | ((gScriptContext.unk46 + (main->effectIntensity & Random())) << 12);
            }
            break;
        case 20:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                ioRegs->lcd_bldy -= main->effectIntensity;
                ioRegs->lcd_bldy &= 0xF;
                if(ioRegs->lcd_bldy == 0) {
                    main->effectType = 0;
                }
            }
            break;
        case 21:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity++;
                if(gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    LoadAndAdjustCurrentAnimation01PaletteByMode(main->effectIntensity, 0);
            }
            if(main->effectIntensity == 0x20) {
                main->effectType = 0xFFFD;
            }
            break;
        case 22:
            main->effectCounter++;
            if(main->effectCounter >= main->effectDelay)
            {
                main->effectCounter = 0;
                main->effectIntensity--;
                if(gAnimation[1].flags & (ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD))
                    LoadAndAdjustCurrentAnimation01PaletteByMode(main->effectIntensity, 0);
            }
            if(main->effectIntensity == 0) {
                main->effectType = 0;
            }
            break;
    }
}

void InitSpecialEffectsWithMosaic(u32 type, u32 delay, u32 intensity)
{
    struct Main * main = &gMain;
    struct IORegisters * ioRegs = &gIORegisters;
    main->effectType = type;
    main->effectDelay = delay;
    main->effectIntensity = intensity;
    ioRegs->lcd_bg3cnt |= BGCNT_MOSAIC;
    ioRegs->lcd_bg2cnt |= BGCNT_MOSAIC;
    main->effectCounter = 0;
}

void InitSpecialEffects(u32 type, u32 delay, u32 intensity)
{
    struct Main * main = &gMain;
    main->effectType = type;
    main->effectDelay = delay;
    main->effectIntensity = intensity;
    main->effectCounter = 0;
}


void VBlankIntr()
{
    m4aSoundVSync();
    gMain.vblankWaitCounter++;
}

void HBlankIntr()
{
}

void IntrDummy()
{
}
