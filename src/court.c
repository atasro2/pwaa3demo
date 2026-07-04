#include "global.h"
#include "court.h"
#include "script.h"
#include "graphics.h"
#include "investigation.h"
#include "background.h"
#include "animation.h"
#include "sound.h"
#include "save.h"
#include "hp_bar.h"
#include "constants/animation.h"
#include "constants/process.h"
#include "constants/songs.h"
#include "constants/oam_allocations.h"
#include "constants/persons.h"

static void SetMosaicFlagOnCourtBenchSprites(void);

void SetCurrentEpisodeBit(void) {
    sub_8007610(gMain.scenarioIdx);
}

void sub_800A3A0(u8 arg0) {
    struct Main * main = &gMain;
    PauseBGM();
    DmaCopy16(3, gOamObjects, gSaveDataBuffer.oam, sizeof(gOamObjects));
    DmaCopy16(3, &gMain, &gSaveDataBuffer.main, sizeof(gMain));
    if(gScriptContext.textboxState == 2 && gScriptContext.textboxYPos == 1) {
        gSaveDataBuffer.main.showTextboxCharacters = 1;
    }
    PlaySE(SE007_MENU_OPEN_SUBMENU);
    main->gameStateFlags &= ~1;
    BACKUP_PROCESS_PTR(main);
    SET_PROCESS_PTR(SAVE_GAME_PROCESS, 0, 0, arg0, main);
}

void (*gCourtProcessStates[])(struct Main *) = {
	CourtInit,
	CourtMain,
	CourtExit
};

void CourtProcess(struct Main * main)
{
    gCourtProcessStates[main->process[GAME_PROCESS_STATE]](main);
}

bool32 sub_800A44C(void) {
    if((gScriptContext.unk1E & 0x2000) == 0 &&
    (gJoypad.pressedKeys & START_BUTTON) &&
    (!gMain.isBGScrolling || (gMain.unk3D & 2)))
    {
        sub_800A3A0(0);
        return TRUE;
    }
    return FALSE;
}

bool32 sub_800A4A0(void) {
    if(!(gJoypad.pressedKeys & R_BUTTON))
        return FALSE;
    if((gMain.gameStateFlags & 0x10))
        return FALSE;
    if((gScriptContext.flags & SCRIPT_LOOP) && (gTestimony.displayState != 0 || gTestimony.pressPromptY != 0))
        return FALSE;
    if(gScriptContext.flags & SCRIPT_FULLSCREEN)
        ClearHPBarOAM();
    PlaySE(SE007_MENU_OPEN_SUBMENU);
    BACKUP_PROCESS();
    SET_PROCESS(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0);
    return TRUE;
}

void CourtInit(struct Main * main)
{
    struct IORegisters * ioRegs = &gIORegisters;
    DmaFill16(3, 0, &gTestimony, sizeof(gTestimony));
    DmaFill16(3, 0, &gInvestigation, sizeof(gInvestigation));
    HideAllSprites();
    InitBGs();
    ResetAnimationSystem();
    LoadCurrentScriptIntoRam();
    ioRegs->lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
    ioRegs->lcd_bg0cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(28) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
    ioRegs->lcd_bg1cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
    ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
    ioRegs->lcd_bg3cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_MOSAIC | BGCNT_256COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
    //DmaCopy16(3, gUnusedAsciiCharSet, VRAM + 0x3800, 0x800);
    DmaCopy16(3, gGfxSaveGameTiles, VRAM, 0x1000);
    DmaCopy16(3, &gPalExamineCursors[0], OBJ_PLTT+0x100, 0x20);
    DmaCopy16(3, gPalEvidenceProfileDesc, OBJ_PLTT + 0x40, 0x20);
    DecompressBackgroundIntoBuffer(1);
    CopyBGDataToVram(1);
    CopyBGDataToVram(0x81);
    ioRegs->lcd_bg1vofs = ~80; // ??????
    ioRegs->lcd_dispcnt &= ~DISPCNT_BG1_ON; // what the fuck is this doing
    InitializeCourtRecordForScenario(main, &gCourtRecord);
    ResetHPBar();
    DmaFill32(3, 0, main->scriptFlags, sizeof(main->scriptFlags));
    main->gameStateFlags = 0;
    DmaFill32(3, 0, main->sectionReadFlags, sizeof(main->sectionReadFlags));
    DmaFill32(3, 0, main->currentRoomSeq, sizeof(main->currentRoomSeq));
    DmaFill32(3, 0, main->psycheLockedTalkSections, sizeof(main->psycheLockedTalkSections));
    main->numPsycheLockedTalkSections = 0;
    main->tilemapUpdateBits = 0xF; 
    main->advanceScriptContext = TRUE;
    main->showTextboxCharacters = TRUE;
    SetCurrentEpisodeBit();
    gScriptContext.holdItSection = 0;
    gScriptContext.currentSection = 0xFFFF;
    ChangeScriptSection(0x80);
    SetTimedKeysAndDelay(DPAD_RIGHT | DPAD_LEFT, 15);
    StartHardwareBlend(1, 1, 1, 0x1F);
    ioRegs->lcd_bldy = 0x10;
    SET_PROCESS(COURT_PROCESS, COURT_MAIN, 0, 0);
}

void CourtExit(struct Main * main)
{
    ClearSectionReadFlags(main);
    sub_8007238(main);
    DmaCopy16(3, &gMain, &gSaveDataBuffer.main, sizeof(gMain));
    SET_PROCESS_PTR(SAVE_GAME_PROCESS, 0, 0, 1, main);
    CopyTextboxTilesToBG1MapBuffer();
    if(main->scenarioIdx == 2)
    {
        ResetHPBarHealthToMax();
        if((main->caseEnabledFlags >> 4) == 1)
            SET_PROCESS_PTR(EPISODE_CLEAR_PROCESS, 0, 0, 1, main);
    }
    else if(main->scenarioIdx == 7)
    {
        if((main->caseEnabledFlags >> 4) == 2)
            SET_PROCESS_PTR(EPISODE_CLEAR_PROCESS, 0, 0, 2, main);
    }
    else if(main->scenarioIdx == 12)
    {
        if((main->caseEnabledFlags >> 4) == 3)
            SET_PROCESS_PTR(EPISODE_CLEAR_PROCESS, 0, 0, 3, main);
    }
    else if(main->scenarioIdx == 14)
    {
        if((main->caseEnabledFlags >> 4) == 4)
            SET_PROCESS_PTR(EPISODE_CLEAR_PROCESS, 0, 0, 4, main);
    }
}

void CourtMain(struct Main * main) {
    if(main->blendMode)
        return;
    if(gScriptContext.flags & 1) 
    {
        if(sub_800A44C() == FALSE)
            sub_800A4A0();
    }
}

void sub_800A7AC(void)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS];
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam = &gOamObjects[OAM_IDX_GENERAL_2];
    if (sub_8016ED8() != 0) {
        oam = &gOamObjects[OAM_IDX_ITEMPLATE_ITEM+7];
    }
    oam->attr0 = 0x4000;
    oam->attr1 = 0x80BA;
    oam->attr2 = 0x5D90;
    oam++;
    oam->attr0 = 0x4000;
    oam->attr1 = 0x80DA;
    oam->attr2 = 0x5D98;
}

void TestimonyAnim(struct Main * main)
{
    struct AnimationListEntry * animation;
    struct AnimationListEntry * animation2;
    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            PlayAnimation(ANIM_TESTIMONY_START_LEFT);
            PlayAnimation(ANIM_TESTIMONY_START_RIGHT);
            PlaySE(SE029_BEGIN_QUESTIONING);
            gTestimony.animationOffsetX = 0;
            main->process[GAME_PROCESS_VAR1]++;
            break;
        case 1:
            animation = FindAnimationFromAnimId(ANIM_TESTIMONY_START_LEFT);
            animation2 = FindAnimationFromAnimId(ANIM_TESTIMONY_START_RIGHT);
            animation->animationInfo.xOrigin += 10;
            animation->flags |= ANIM_ACTIVE;
            animation2->animationInfo.xOrigin -= 10;
            animation2->flags |= ANIM_ACTIVE;
            if(animation->animationInfo.xOrigin >= 120)
            {
                StartHardwareBlend(3, 1, 8, 0x1F);
                DestroyAnimation(animation);
                DestroyAnimation(animation2);
                PlayAnimation(ANIM_TESTIMONY_START);
                main->process[GAME_PROCESS_VAR1]++;
            }
            break;
        case 2: // why not just do it in the next case like please
            if(main->blendMode == 0)
                main->process[GAME_PROCESS_VAR1]++;
            break;
        case 3:
            animation = FindAnimationFromAnimId(ANIM_TESTIMONY_START);
            if(!(animation->flags & ANIM_PLAYING))
            {
                DestroyAnimation(animation);
                PlayAnimationAtCustomOrigin(ANIM_TESTIMONY_START_LEFT, 120, 60);
                PlayAnimationAtCustomOrigin(ANIM_TESTIMONY_START_RIGHT, 120, 60);
                main->process[GAME_PROCESS_VAR1]++;
            }
            break;
        case 4:
            animation = FindAnimationFromAnimId(ANIM_TESTIMONY_START_LEFT);
            animation2 = FindAnimationFromAnimId(ANIM_TESTIMONY_START_RIGHT);
            animation->animationInfo.xOrigin += gTestimony.animationOffsetX;
            animation->flags |= ANIM_ACTIVE;
            animation2->animationInfo.xOrigin -= gTestimony.animationOffsetX;
            animation2->flags |= ANIM_ACTIVE;
            gTestimony.animationOffsetX++;
            if(gTestimony.animationOffsetX > 12)
                gTestimony.animationOffsetX = 12;
            if(animation->animationInfo.xOrigin > 300)
            {
                DestroyAnimation(animation);
                DestroyAnimation(animation2);
                main->process[GAME_PROCESS_STATE] = TESTIMONY_MAIN;
            }
        default:
            break;
    }
}

void (*gTestimonyProcessStates[])(struct Main *) = {
	TestimonyInit,
	TestimonyMain,
	TestimonyExit,
	TestimonyAnim
};

void TestimonyProcess(struct Main * main)
{
    gTestimonyProcessStates[main->process[GAME_PROCESS_STATE]](main);
}

void TestimonyInit(struct Main * main)
{
    DmaCopy16(3, gGfx4bppTestimonyTextTiles, OBJ_VRAM0+0x3000, 0x800);
    DmaCopy16(3, gPalTestimonyTextTiles, OBJ_PLTT+0xA0, 0x20);
    gTestimony.timer = 0;
    main->process[GAME_PROCESS_STATE] = TESTIMONY_ANIM;
}

void TestimonyMain(struct Main * main)
{
    struct OamAttrs * oam;
    if(main->blendMode)
        return;
    if(gScriptContext.flags & 1) 
    {
        if(sub_800A44C() != TRUE)
            sub_800A4A0();
    }
    gTestimony.timer++;
    if(gTestimony.timer > 100)
        gTestimony.timer = 0;
    oam = &gOamObjects[OAM_IDX_ITESTIMONY_INDICATOR];
    if(gTestimony.timer <= 80)
    {
        oam->attr0 = SPRITE_ATTR0(0, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(0, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x180, 2, 5);
    }
    else
        oam->attr0 = SPRITE_ATTR0_CLEAR;
}

void TestimonyExit(struct Main * main)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_ITESTIMONY_INDICATOR];
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    SET_PROCESS_PTR(COURT_PROCESS, COURT_MAIN, 0, 0, main);
}

void QuestioningAnim(struct Main * main)
{
    struct AnimationListEntry * animation = FindAnimationFromAnimId(ANIM_CROSS_EXAMINATION_START_LEFT);
    struct AnimationListEntry * animation2 = FindAnimationFromAnimId(ANIM_CROSS_EXAMINATION_START_RIGHT);
    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            PlayAnimation(ANIM_CROSS_EXAMINATION_START_LEFT);
            PlayAnimation(ANIM_CROSS_EXAMINATION_START_RIGHT);
            PlaySE(SE029_BEGIN_QUESTIONING);
            main->process[GAME_PROCESS_VAR1]++;
            break;
        case 1:
            animation->animationInfo.xOrigin += 10;
            animation->flags |= ANIM_ACTIVE;
            animation2->animationInfo.xOrigin -= 10;
            animation2->flags |= ANIM_ACTIVE;
            if(animation->animationInfo.xOrigin >= 120)
            {
                StartHardwareBlend(3, 1, 8, 0x1F);
                DestroyAnimation(animation);
                DestroyAnimation(animation2);
                PlayAnimation(ANIM_CROSS_EXAMINATION_START);
                main->process[GAME_PROCESS_VAR1]++;
            }
            break;
        case 2: // why not just do it in the next case like please
            if(main->blendMode == 0)
                main->process[GAME_PROCESS_VAR1]++;
            break;
        case 3:
            animation = FindAnimationFromAnimId(ANIM_CROSS_EXAMINATION_START);
            if(!(animation->flags & ANIM_PLAYING))
            {
                DestroyAnimation(animation);
                PlayAnimationAtCustomOrigin(ANIM_CROSS_EXAMINATION_START_LEFT, 120, 60);
                PlayAnimationAtCustomOrigin(ANIM_CROSS_EXAMINATION_START_RIGHT, 120, 60);
                main->process[GAME_PROCESS_VAR1]++;
            }
            break;
        case 4:
            animation = FindAnimationFromAnimId(ANIM_CROSS_EXAMINATION_START_LEFT);
            animation2 = FindAnimationFromAnimId(ANIM_CROSS_EXAMINATION_START_RIGHT);
            animation->animationInfo.yOrigin -= 7;
            animation->flags |= ANIM_ACTIVE;
            animation2->animationInfo.yOrigin += 7;
            animation2->flags |= ANIM_ACTIVE;
            if(animation->animationInfo.yOrigin < -60)
            {
                DestroyAnimation(animation);
                DestroyAnimation(animation2);
                main->process[GAME_PROCESS_STATE] = QUESTIONING_MAIN;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
        default:
            break;
    }
}

void (*gQuestioningProcessStates[])(struct Main *) = {
	QuestioningInit,
	QuestioningMain,
	QuestioningExit,
	QuestioningAnim,
	QuestioningHoldIt,
	QuestioningObjection
};

void QuestioningProcess(struct Main * main)
{
    gQuestioningProcessStates[main->process[GAME_PROCESS_STATE]](main);
}

void QuestioningInit(struct Main * main)
{
    DmaCopy16(3, gGfxPressPresentButtons, OBJ_VRAM0+0x3000, 0x400);
    DmaCopy16(3, gPalPressPresentButtons, OBJ_PLTT+0xA0, 0x20);
    DmaCopy16(3, gGfx4bppTestimonyArrows, 0x1A0, 0x80); // ! WHAT, HOW
    DmaCopy16(3, gGfx4bppTestimonyArrows + 12 * TILE_SIZE_4BPP, 0x220, 0x80); // ! WHAT, HOW
    main->testimonyBeginningSection = gScriptContext.currentSection;
    gCourtRecord.recordArrowCounter = 0;
    gCourtRecord.recordArrowFrame++;
    // gTestimony.healthPointX = 0xF0;
    gTestimony.pressPromptY = 0xE0;
    gTestimony.presentPromptY = 0xE0;
    gTestimony.displayState = 0;
    main->process[GAME_PROCESS_STATE] = QUESTIONING_ANIM;
    ResetHPBar();
}

void sub_800AC18(void) {
    struct OamAttrs * oam;

    UpdateQuestioningMenuSprites(&gMain, &gTestimony, 1);
    UpdateCourtRecordArrows(&gCourtRecord);
    oam = gOamObjects + OAM_IDX_LR_ARROW;
    if(gScriptContext.flags & SCRIPT_LOOP)
    {
        if(gScriptContext.currentSection-1 != gMain.testimonyBeginningSection)
            oam->attr0 = SPRITE_ATTR0(128, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        else
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(0, FALSE, FALSE, 1);
        oam->attr2 = SPRITE_ATTR2(0x1A0, 0, 2);
        oam++;
        if(gScriptContext.nextSection != gMain.loopBridgeSection)
            oam->attr0 = SPRITE_ATTR0(128, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        else
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH-16, FALSE, FALSE, 1);
        oam->attr2 = SPRITE_ATTR2(0x1A4, 0, 2);
    }
    else
    {
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
    }
}

void sub_800ACB4(u32 section) {
    PlaySE(SE001_MENU_CONFIRM);
    ChangeScriptSection(section);
    RunScriptContext();
    CheckAndDrawHPBar();
}

void QuestioningMain(struct Main * main)
{
    struct OamAttrs * oam;
    u32 i;

    if(main->blendMode)
        return;
    if(gScriptContext.flags & (SCRIPT_SPOTSELECT_MOVE_TO_START | SCRIPT_SPOTSELECT_INPUT)) {
        UpdateQuestioningMenuSprites(main, &gTestimony, 1);
        return;
    }
    else if((gScriptContext.flags & SCRIPT_LOOP) || (gScriptContext.flags & 1))
    {
        if(sub_800A44C() == FALSE) {

            if(gScriptContext.flags & SCRIPT_LOOP && (gTestimony.displayState == 0 && gTestimony.pressPromptY == 0))
            {
                if(sub_800A4A0()) {
                    gMain.hpBarDamageAmount = 0x10;
                    SetOrQueueHPBarState(6);
                    sub_800A7AC();
                    SET_PROCESS(COURT_RECORD_PROCESS, RECORD_INIT, 0, 1);
                    return;
                }
                
                if((gJoypad.pressedKeys & (A_BUTTON|DPAD_RIGHT)) && (gScriptContext.unk12 & 2))
                {
                    if(gScriptContext.nextSection != main->loopBridgeSection) {
                        sub_800ACB4(gScriptContext.nextSection);
                    } else if(gJoypad.pressedKeys & A_BUTTON) {
                        UpdateQuestioningMenuSprites(main, &gTestimony, 0);
                        sub_800ACB4(gScriptContext.nextSection);
                        gScriptContext.holdItSection = 0;
                        gMain.showTextboxCharacters = FALSE;
                        for(i = 0; i < 0x100; i++) {
                            gBG1MapBuffer[0x180+i] = 0; 
                        }
                        gScriptContext.textboxState = 1;
                        oam = &gOamObjects[OAM_IDX_LR_ARROW];
                        oam->attr0 = SPRITE_ATTR0_CLEAR;
                        oam++;
                        oam->attr0 = SPRITE_ATTR0_CLEAR;
                        return;
                    }
                }
                else if(gJoypad.pressedKeys & (B_BUTTON|DPAD_LEFT) && (gScriptContext.unk12 & 2))
                {
                    if(gScriptContext.currentSection-1 != main->testimonyBeginningSection)
                    {
                        sub_800ACB4(gScriptContext.currentSection-1);
                    }
                }
                else if(gJoypad.pressedKeys & L_BUTTON)
                {
                    if(gScriptContext.holdItSection != 0)
                    {
                        if(gMain.currentBG != 3) {
                            main->process[GAME_PROCESS_STATE] = QUESTIONING_HOLD_IT;
                            main->process[GAME_PROCESS_VAR1] = 2;
                            return;
                        }
                        PlayAnimation(ANIM_HOLDIT_LEFT);
                        if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1 || gMain.scenarioIdx == 12 || gMain.scenarioIdx == 13) {
                            PlaySE(0x172);
                        } else if (gMain.scenarioIdx == 0x14) {
                            PlaySE(0x16F);
                        } else {
                            PlaySE(SE01D_VOICE_PHOENIX_HOLD_IT_JP);
                        }
                        StartHardwareBlend(3, 1, 8, 0x1F);
                        gTestimony.timer = 0x40;
                        gTestimony.pressPromptY = 0xE0;
                        gTestimony.presentPromptY = 0xE0;
                        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
                        main->advanceScriptContext = FALSE;
                        main->showTextboxCharacters = FALSE;
                        SetTextboxNametag(0, 0);
                        main->process[GAME_PROCESS_STATE] = QUESTIONING_HOLD_IT;
                        main->process[GAME_PROCESS_VAR1] = 0;
                        return;
                    }
                }
            } else if(sub_800A4A0()) {
                SET_PROCESS(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0);
            }
        }
        sub_800AC18();
    }
}

void QuestioningExit(struct Main * main) // ! why a nullsub??
{

}

void QuestioningHoldIt(struct Main * main)
{
    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            if(gTestimony.timer == 0)
            {
                if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1 || gMain.scenarioIdx == 12 || gMain.scenarioIdx == 13) {
                    SetCourtScrollPersonAnim(0, 1, 7, 0x1770);
                } else if (gMain.scenarioIdx == 0x14) {
                    SetCourtScrollPersonAnim(0, 1, 31, 0);
                } else {
                    SetCourtScrollPersonAnim(0, 1, PERSON_ANIM_PHOENIX, 0);
                }
                InitCourtScroll(gPalCourtScroll, 0x1E, 0x1F, 1);
                SlideTextbox(0);
                main->process[GAME_PROCESS_VAR1]++;
                break;
            }
            gTestimony.timer--;
            break;
        case 1:
            if(gCourtScroll.state)
                break;
            if(gScriptContext.holdItSection)
            {
                gMain.advanceScriptContext = TRUE;
                gMain.showTextboxCharacters = TRUE;
                gIORegisters.lcd_bg1vofs = 0;
                gScriptContext.textboxState = 0;
            }
            ChangeScriptSection(gScriptContext.holdItSection);
            gScriptContext.holdItSection = 0;
            // gTestimony.healthPointX = 0xF0;
            gTestimony.pressPromptY = 0xE0;
            gTestimony.presentPromptY = 0xE0;
            gTestimony.displayState = 0;
            main->process[GAME_PROCESS_STATE] = QUESTIONING_MAIN;
            main->process[GAME_PROCESS_VAR1] = 0;
            break;
        case 2:
            ChangeAnimationActivity(&gAnimation[1], 1);
            main->previousBG = main->currentBG;
            main->currentBG = 3;
            main->currentBgStripe = 1;
            main->unk258 = 0;
            gScriptContext.unk40 = 0x80;
            PlayAnimation(ANIM_HOLDIT_LEFT);
            if ((gMain.scenarioIdx <= 1) || (gMain.scenarioIdx == 0xC) || (gMain.scenarioIdx == 0xD)) {
                PlaySE(0x172);
            } else if (gMain.scenarioIdx == 0x14) {
                PlaySE(0x16F);
            } else {
                PlaySE(SE01D_VOICE_PHOENIX_HOLD_IT_JP);
            }
            StartHardwareBlend(3, 1, 8, 0x1F);
            gTestimony.timer = 64;
            gTestimony.pressPromptY = 0xE0;
            gTestimony.presentPromptY = 0xE0;
            gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
            main->advanceScriptContext = FALSE;
            main->showTextboxCharacters = FALSE;
            SetTextboxNametag(0, 0);
            main->process[GAME_PROCESS_STATE] = QUESTIONING_HOLD_IT;
            main->process[GAME_PROCESS_VAR1] = 0;
            return;
        default:
            break;
    }
    UpdateQuestioningMenuSprites(main, &gTestimony, 0);
    gOamObjects[OAM_IDX_LR_ARROW_LEFT].attr0 = SPRITE_ATTR0_CLEAR;
    gOamObjects[OAM_IDX_LR_ARROW_RIGHT].attr0 = SPRITE_ATTR0_CLEAR;
}

void QuestioningObjection(struct Main * main)
{
    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            if(gTestimony.timer == 0)
            {
                StartHardwareBlend(3, 1, 8, 0x1F);
                gTestimony.timer = 0x40;
                main->process[GAME_PROCESS_VAR1]++;
                break;
            }
            gTestimony.timer--;
            break;
        case 1:
            if(gTestimony.timer == 0)
            {
                if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1 || gMain.scenarioIdx == 12 || gMain.scenarioIdx == 13) {
                    SetCourtScrollPersonAnim(0, 1, 7, 0x1770);
                } else if (gMain.scenarioIdx == 0x14) {
                    SetCourtScrollPersonAnim(0, 1, 31, 0);
                } else {
                    SetCourtScrollPersonAnim(0, 1, PERSON_ANIM_PHOENIX, 0);
                }
                InitCourtScroll(gPalCourtScroll, 0x1E, 0x1F, 1);
                SlideTextbox(0);
                main->process[GAME_PROCESS_VAR1]++;
                break;
            }
            gTestimony.timer--;
            break;
        case 2:
            if(gCourtScroll.state)
                break;
            gTestimony.timer = 0x14;
            main->process[GAME_PROCESS_VAR1]++;
            break;
        case 3:
            if(gTestimony.timer == 0)
            {
                // gTestimony.healthPointX = 0xF0;
                gTestimony.pressPromptY = 0xE0;
                gTestimony.presentPromptY = 0xE0;
                gTestimony.displayState = 0;
                if(gScriptContext.slamDesk)
                {
                    gMain.advanceScriptContext = TRUE;
                    gIORegisters.lcd_bg1vofs = 0;
                    gScriptContext.textboxState = 0;
                }
                else
                    SlideTextbox(1);
                RESTORE_PROCESS_PTR(main);
                break;
            } 
            gTestimony.timer--;
            break;
        case 4:
            return;
        case 5:
            return;
        default:
            break;
    }
    UpdateQuestioningMenuSprites(main, &gTestimony, 0);
}

void VerdictProcess(struct Main * main)
{
    u32 i;
    s16 temp;
    u32 temp2;
    struct OamAttrs *oam = &gOamObjects[OAM_IDX_VERDICT_KANJI];
    switch(main->process[GAME_PROCESS_STATE]) {
        case VERDICT_SHRINK_KANJI1: { // B088
            gMain.affineScale -= 0x10; // 1/16 steps 
            if(gMain.affineScale <= Q_8_8(1.0)) 
            {
                temp = fix_inverse(Q_8_8(1.0));
                gOamObjects[0].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[1].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[3].attr3 = fix_mul(_Cos(0), temp);
                StartHardwareBlend(3, 1, 8, 0x1F);
                PlaySE(SE02C_GAME_OVER);
                main->process[GAME_PROCESS_STATE]++;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            else {
                temp = fix_inverse(main->affineScale);
                gOamObjects[0].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[1].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[3].attr3 = fix_mul(_Cos(0), temp);
            }
            break;
        }
        case VERDICT_WAIT_INIT_KANJI2: { // B164
            if(main->process[GAME_PROCESS_VAR1]++ > 40) {
                gMain.affineScale = Q_8_8(2.5); // 2.5 times scale
                oam++;
                oam->attr0 = SPRITE_ATTR0(255-16, ST_OAM_AFFINE_DOUBLE, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                oam->attr1 = SPRITE_ATTR1_AFFINE(128, 1, 3);
                oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 5);
                temp = fix_inverse(main->affineScale);
                gOamObjects[4].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[5].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[6].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[7].attr3 = fix_mul(_Cos(0), temp);
                main->process[GAME_PROCESS_STATE]++;
            }
            break;
        }
        case VERDICT_SHRINK_KANJI2: { // B1FC
            gMain.affineScale -= 0x10; // 1/16 steps
            if(gMain.affineScale <= Q_8_8(1.0)) {
                temp = fix_inverse(Q_8_8(1.0));
                gOamObjects[4].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[5].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[6].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[7].attr3 = fix_mul(_Cos(0), temp);
                StartHardwareBlend(3, 1, 8, 0x1F);
                PlaySE(SE02C_GAME_OVER);
                gMain.affineScale = Q_8_8(1.0);
                main->process[GAME_PROCESS_STATE]++;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            else {
                temp = fix_inverse(main->affineScale);
                gOamObjects[4].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[5].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[6].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[7].attr3 = fix_mul(_Cos(0), temp);
            }
            break;
        }
        case VERDICT_WAIT: { // B2E4
            if(main->process[GAME_PROCESS_VAR1]++ > 64) {
                main->process[GAME_PROCESS_STATE]++;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            break;
        }
        case VERDICT_GROW_KANJI: { // B300
            if(main->process[GAME_PROCESS_VAR1]++ > 32) {
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                oam++;
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                if(main->process[GAME_PROCESS_VAR2]) {
                    main->process[GAME_PROCESS_STATE]++;
                    main->process[GAME_PROCESS_VAR1] = 0;
                    break;
                }
                RESTORE_PROCESS_PTR(main);
            }
            else {
                main->affineScale += 8; // 1/32 steps
                temp = fix_inverse(main->affineScale);
                gOamObjects[0].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[1].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[3].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[4].attr3 = fix_mul(_Cos(0), temp);
                gOamObjects[5].attr3 = fix_mul(_Sin(0), temp);
                gOamObjects[6].attr3 = fix_mul(-_Sin(0), temp);
                gOamObjects[7].attr3 = fix_mul(_Cos(0), temp);
                oam->attr0--;
                oam++;
                oam->attr0--;
            }
            break;
        }
        case VERDICT_INIT_CONFETTI: { // B3C8
            DmaCopy16(3, gGfxConfetti, OBJ_VRAM0+0x1F80, 0x20);
            DmaCopy16(3, gPalConfetti0, OBJ_PLTT+0xA0, 0x80);
            main->process[GAME_PROCESS_STATE]++;
            break;
        }
        case VERDICT_DRAW_CONFETTI: { // B404
            oam = &gOamObjects[OAM_IDX_CONFETTI];
            for(i = 0; i < OAM_COUNT_CONFETTI; i++) 
            {
                temp2 = Random();
                temp2 += i * 32;
                temp2 &= 0x7F;
                oam->attr0 = temp2;
                temp2 = Random() & 0x1F;
                temp2 += i * 32;
                temp2 &= 0xFF;
                oam->attr1 = temp2;
                temp2 = ((Random() & 3) + 5);
                temp2 <<= 12;
                oam->attr2 = temp2 + 0xFC + (1 << 10); // random palette + tile 0xFC + priority
                oam++;
            }
            PlaySE(SE03C_COURTROOM_AUDIENCE_VICTORY);
            main->process[GAME_PROCESS_STATE]++;
            break;
        }
        case VERDICT_ANIMATE_CONFETTI: { // B460
            oam = &gOamObjects[OAM_IDX_CONFETTI];
            if(main->process[GAME_PROCESS_VAR1]++ < 240)
            {
                for(i = 0; i < OAM_COUNT_CONFETTI; i++)
                {
                    
                    u16 attr0, attr1;
                    temp2 = oam->attr0;
                    temp2 += Random() & 3;
                    if(temp2 >= DISPLAY_HEIGHT+4)
                        temp2 = 0;
                    attr0 = oam->attr0 & ~0xFF;
                    oam->attr0 = attr0 + temp2;
                    temp2 = oam->attr1;
                    if(Random() & 1)
                        temp2 += Random() & 3;
                    else
                        temp2 -= Random() & 3;
                    temp2 &= 0xFF;
                    attr1 = oam->attr1 & ~0x1FF;
                    oam->attr1 = attr1 + temp2;
                    oam++;
                }
            }
            else
            {
                for(i = 0; i < OAM_COUNT_CONFETTI; i++)
                {
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                    oam++;
                }
                main->process[GAME_PROCESS_STATE]++;
            }
            break;
        }
        case VERDICT_NOTGUILTY_EXIT: { // B504
            RESTORE_PROCESS_PTR(main);
            break;
        }
    }
}

void UpdateQuestioningMenuSprites(struct Main * main, struct TestimonyStruct * testimony, u32 arg2) // questioning_menu_disp
{
    u32 i;
    struct OamAttrs * oam;
    if(gScriptContext.holdItSection == 0 || arg2 == 0)
    {
        oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS];
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam = &gOamObjects[OAM_IDX_HPBAR+1];
        return;
    }
    if(testimony->displayState == 1)
    {
        if(testimony->pressPromptY > 224)
            testimony->pressPromptY -= 2;
        else
            testimony->pressPromptY = 224;

        if(testimony->presentPromptY > 224)
            testimony->presentPromptY -= 2;
        else
            testimony->presentPromptY = 224;
    }
    else if(testimony->displayState == 0)
    {
        if(testimony->pressPromptY > 0)
            testimony->pressPromptY += 2;

        if(testimony->presentPromptY > 0)
            testimony->presentPromptY += 2;
    }
    oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS];
    if(gScriptContext.holdItSection < 0x80)
    {
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
    }
    else
    {
        u32 attr1; // needed for matching
        oam->attr0 = testimony->pressPromptY | 0x4000;
        attr1 = SPRITE_ATTR1_NONAFFINE(0, FALSE, FALSE, 2);
        oam->attr1 = attr1;
        oam->attr2 = SPRITE_ATTR2(0x180, 1, 5);
        oam++;
        oam->attr0 = testimony->pressPromptY | 0x4000;
        attr1 = SPRITE_ATTR1_NONAFFINE(32, FALSE, FALSE, 2);
        oam->attr1 = attr1;
        oam->attr2 = SPRITE_ATTR2(0x188, 1, 5);
        oam++;
        oam->attr0 = testimony->presentPromptY | 0x4000;
        attr1 = SPRITE_ATTR1_NONAFFINE(176, FALSE, FALSE, 2);
        oam->attr1 = attr1;
        oam->attr2 = SPRITE_ATTR2(0x190, 1, 5);
        oam++;
        oam->attr0 = testimony->presentPromptY | 0x4000;
        attr1 = SPRITE_ATTR1_NONAFFINE(208, FALSE, FALSE, 2);
        oam->attr1 = attr1;
        oam->attr2 = SPRITE_ATTR2(0x198, 1, 5);
    }
}

void LoadWitnessBenchGraphics(void) {
    u16 i;
    DmaCopy16(3, gGfxWitnessBench1, OBJ_VRAM0+0x2000, 0x600);
    if(gMain.unk3D & 8) {
        u16 pal[0x10];
        DmaCopy16(3, gPalWitnessBench, pal, 0x20);
        for(i = 0; i < 16; i++) {
            pal[i] = ColorFadeSepia(pal[i], 0x20, 0);
        }
        DmaCopy16(3, pal, OBJ_PLTT+0x140, 0x20);
        
    } else if ((gMain.effectType == 7) || (gMain.effectType == 3) || (gMain.effectType == 0xFFFD)) {
        LoadAndAdjustCounselWitnessBenchPaletteByMode(3, 0xFF, 1);
    } else {
        DmaCopy16(3, gPalWitnessBench, OBJ_PLTT+0x140, 0x20);
    }
}

void SetOAMForCourtBenchSpritesWitness(s32 x, s32 y, u8 clearOAM)
{
    struct OamAttrs * oam;
    s16 inverseOne;
    u32 i;
    oam = &gOamObjects[OAM_IDX_COURT_BENCH];
    if(!(clearOAM & 1)) {
        for(i = 0; i < OAM_COUNT_COURT_BENCH; i++) {
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
    } else {
        x &= 0x1FF;
        inverseOne = fix_inverse(0x100);
        gOamObjects[0].attr3 = fix_mul(0x100, inverseOne);
        gOamObjects[1].attr3 = fix_mul(0, inverseOne);
        gOamObjects[2].attr3 = fix_mul(0, inverseOne);
        gOamObjects[3].attr3 = fix_mul(0x100, inverseOne);
        
        oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(x, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x100, 3, 10);
        oam++;
        oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(x + 64, FALSE, FALSE, 2);
        oam->attr2 = SPRITE_ATTR2(0x120, 3, 10);
        oam++;
        oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(x + 96, TRUE, FALSE, 2);
        oam->attr2 = SPRITE_ATTR2(0x120, 3, 10);
        oam++;
        oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(x + 128, TRUE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x100, 3, 10);
    }
    SetMosaicFlagOnCourtBenchSprites();
}

void LoadCounselBenchGraphics(void) {
    u16 i;
    DmaCopy16(3, gGfxCounselBench1, OBJ_VRAM0+0x2000, 0xD00);
    if(gMain.unk3D & 8) {
        u16 pal[0x10];
        DmaCopy16(3, gPalCounselBench, pal, 0x20);
        for(i = 0; i < 16; i++) {
            pal[i] = ColorFadeSepia(pal[i], 0x20, 0);
        }
        DmaCopy16(3, pal, OBJ_PLTT+0x140, 0x20);
        
    } else if ((gMain.effectType == 7) || (gMain.effectType == 3) || (gMain.effectType == 0xFFFD)) {
        LoadAndAdjustCounselWitnessBenchPaletteByMode(2, 0xFF, 1);
    } else {
        DmaCopy16(3, gPalCounselBench, OBJ_PLTT+0x140, 0x20);
    }
}

void SetOAMForCourtBenchSpritesDefense(s32 x, s32 y, u8 clearOAM) {
    struct OamAttrs * oam;
    s16 inverseOne;
    s32 i;
    x &= 0x1FF;
    oam = &gOamObjects[OAM_IDX_COURT_BENCH];
    if(!(clearOAM & 1)) {
        for(i = 0; i < OAM_COUNT_COURT_BENCH; i++) {
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
    } else {
        inverseOne = fix_inverse(Q_8_8(1));
        gOamObjects[0].attr3 = fix_mul(Q_8_8(1), inverseOne);
        gOamObjects[1].attr3 = fix_mul(0, inverseOne);
        gOamObjects[2].attr3 = fix_mul(0, inverseOne);
        gOamObjects[3].attr3 = fix_mul(Q_8_8(1), inverseOne);
        for(i = 0; i < 3; i++) {        
            oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(x, FALSE, FALSE, 3) + i * 0x40;
            oam->attr2 = SPRITE_ATTR2(0x100, 3, 10) + i * 0x20;
            oam++;
        }
        oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_V_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(x, FALSE, FALSE, 2) + i * 0x40;
        oam->attr2 = SPRITE_ATTR2(0x100, 3, 10) + i * 0x20;
    }
    SetMosaicFlagOnCourtBenchSprites();
}

void SetOAMForCourtBenchSpritesProsecution(s32 x, s32 y, u8 clearOAM)
{
    struct OamAttrs * oam;
    s16 inverseOne;
    u32 i;
    x &= 0x1FF;
    oam = &gOamObjects[OAM_IDX_COURT_BENCH];
    if(!(clearOAM & 1)) {
        for(i = 0; i < OAM_COUNT_COURT_BENCH; i++) {
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
    } else {
        inverseOne = fix_inverse(0x100);
        gOamObjects[0].attr3 = fix_mul(0x100, inverseOne);
        gOamObjects[1].attr3 = fix_mul(0, inverseOne);
        gOamObjects[2].attr3 = fix_mul(0, inverseOne);
        gOamObjects[3].attr3 = fix_mul(0x100, inverseOne);

        oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_V_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(x, TRUE, FALSE, 2);
        oam->attr2 = SPRITE_ATTR2(0x160, 3, 10);
        oam++;
        for(i = 0; i < 3; i++) {        
            oam->attr0 = SPRITE_ATTR0(y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(16, TRUE, FALSE, 3) + i * 0x40 + x;
            oam->attr2 = SPRITE_ATTR2(0x140, 3, 10) - i * 0x20;
            oam++;
        }
    }
    SetMosaicFlagOnCourtBenchSprites();
}

static void SetMosaicFlagOnCourtBenchSprites(void)
{
    u32 i;
    struct OamAttrs * oam;
    oam = &gOamObjects[OAM_IDX_COURT_BENCH];
    for(i = 0; i < OAM_COUNT_COURT_BENCH; i++) {
        oam->attr0 |= 0x1000;
        oam++;
    }
}