#include "global.h"
#include "main.h"
#include "investigation.h"
#include "save.h"
#include "court.h"
#include "script.h"
#include "background.h"
#include "animation.h"
#include "sound.h"
#include "script.h"
#include "psyche_lock.h"
#include "graphics.h"
#include "ewram.h"
#include "hp_bar.h"
#include "constants/songs.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

void (*gInvestigationProcessStates[])(struct Main *, struct InvestigationStruct *) = {
	InvestigationInit, // RNO1_TANTEI_INIT
	InvestigationMain, // RNO1_TANTEI_MAIN
	InvestigationExit, // RNO1_TANTEI_EXIT
	InvestigationBgScrollWait, // RNO1_TANTEI_BG_WAIT
	InvestigationTextboxSlideWait, // RNO1_TANTEI_MW_WAIT
	InvestigationRoomInit, // RNO1_TANTEI_ROOM_INIT
	InvestigationInspect, // RNO1_TANTEI_INSPECT
	InvestigationMove, // RNO1_TANTEI_MOVE
	InvestigationTalk, // RNO1_TANTEI_TALK
	InvestigationPresent,  // RNO1_TANTEI_SHOW
    InvestigationPsycheLock // RNO1_TANTEI_PSYCOLOCK // taken from AA4 unity mobile port
};

void UpdateScrollPromptSprite(struct Main *, u32);
void UpdateInvestigationActionSprites(struct InvestigationStruct *);
void ClearInvestigationActionButtonOAM(void);

void sub_800BC08(u32 arg0) {
    struct AnimationListEntry *animation = &gAnimation[1];
    u32 * dst;
    u8 * src;
    u32 i;
    if(animation->animationInfo.personId != 11 && animation->animationInfo.personId != 33 && animation->animationInfo.personId != 3)
        return;
    if(!(animation->flags & ANIM_ALLOCATED))
        return;
    switch(arg0) {
        case 0:
            dst = gUnknown_0826F888;
            src = gUnknown_08252498 + dst[1];
            dst = (u32*)(OBJ_PLTT+0x1A0);
            DmaCopy16(3, src, dst, 0x20);
            break;
        case 1:
            dst = gUnknown_0826FE38;
            src = gUnknown_08252498 + dst[1];
            dst = (u32*)(OBJ_PLTT+0x1A0);
            DmaCopy16(3, src, dst, 0x20);
            break;
        case 11:
            sub_800BC08(1);
            animation = sub_8016FB4();
            animation->flags |= 0x80;
            for(i = 0; i < 3; i++) {
                animation = FindAnimationFromAnimId(0x83+i);
                if(animation) animation->flags |= 0x80;
            }
            break;
        case 12:
            animation = &gAnimation[1];
            if(animation->animationInfo.personId == 3) animation->animationInfo.personId = 11;
            if(animation->animationInfo.xOrigin == -120) {
                InvestigationSetPersonAnimation(0x800B, gMain.talkingAnimationOffset, gMain.idleAnimationOffset);
            }
            // BD5A
            if((animation->animationInfo.xOrigin == 120 && gMain.Bg256_pos_x == 240) || animation->animationInfo.xOrigin == 360) {
                InvestigationSetPersonAnimation(0x400B, gMain.talkingAnimationOffset, gMain.idleAnimationOffset);
            }
            else {
                InvestigationSetPersonAnimation(0x800B, gMain.talkingAnimationOffset, gMain.idleAnimationOffset);
            }
            // BDA4
            sub_800BC08(1);
            animation = sub_8016FB4();
            animation->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
            break;
        case 10:
            sub_800BC08(1);
            animation = sub_8016FB4();
            animation->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
            break;
        case 13:
            sub_800BC08(1);
            break;
        case 20:
            animation = &gAnimation[1];
            if(!(animation->flags & (ANIM_BLEND_ACTIVE | 0x4000000))) {
                break;
            }
            if(animation->flags & 4) {
                if(gMain.blendDeltaY != 0xF) {
                    break;
                }
                gIORegisters.lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(31, 7); // blend target 2 wtf??
                gMain.blendDeltaY = 0x10;
                ChangeAnimationActivity(animation, 0);
                animation->animationInfo.personId = 3;
                sub_8016FEC(0);
                animation->flags &= ~4;
                animation->flags &= ~0x04000000;
                animation->flags &= ~ANIM_BLEND_ACTIVE;
                break;
            }
            if(gMain.blendDeltaY == 1) {
                animation->flags &= ~0x04000000;
                gIORegisters.lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(31, 7);
                gMain.blendDeltaY = 0;
                animation = sub_8016FB4();
                animation->flags |= 0x80;
                sub_800BC08(0);
                *(u16*)REG_ADDR_BLDALPHA = gIORegisters.lcd_bldalpha;
            }
            if(gMain.blendDeltaY == 2) {
                animation->flags &= ~0x80;
                animation->flags &= ~0x40;
                animation->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
                animation->flags &= ~ANIM_BLEND_ACTIVE;
                animation->flags &= ~4;
                animation->flags |= 0x4000000;
                for(i = 0; i < 3; i++) {
                    animation = FindAnimationFromAnimId(0x83+i);
                    if(animation) {
                        animation->flags &= ~0x80;
                        animation->flags &= ~0x40;
                        animation->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
                        animation->flags &= ~ANIM_BLEND_ACTIVE;
                    }
                }
                gMain.blendDeltaY = 1;
            }
            break;
        case 30:
            sub_800BC08(1);
            // fallthrough
        case 31:
            animation = sub_8016FB4();
            animation->flags &= ~ANIM_BLEND_ACTIVE;
            animation->flags &= ~0x80;
            break;
    }
}

void SetRoomSeq(u32 roomId, u32 seq)
{
    gMain.currentRoomSeq[roomId] = seq;
}

u16 IsTalkSectionPsycheLocked(u16 arg0)
{
    u16 i;
    for(i = 0; i < gMain.numPsycheLockedTalkSections; i++) {
        if(gMain.psycheLockedTalkSections[i] == arg0) return 1;
    }
    return 0;
}

void SetInactiveActionButtons(struct InvestigationStruct * investigation, u32 arg1) // menu_mv_flag_set
{
    investigation->inactiveActions = arg1;
    if(investigation->personActive == 0)
        investigation->inactiveActions &= ~0xC;
}

void InvestigationProcess(struct Main * main) // Tantei_part
{
    if(main->process[GAME_PROCESS_STATE] != INVESTIGATION_ROOM_INIT)
        gInvestigationRoomUpdateFunctions[main->scenarioIdx](main);
    gInvestigationProcessStates[main->process[GAME_PROCESS_STATE]](main, &gInvestigation);
    UpdateInvestigationActionSprites(&gInvestigation);
}

void InvestigationInit(struct Main * main, struct InvestigationStruct * investigation) // tantei_init
{
    struct IORegisters * ioRegs = &gIORegisters;
    struct OamAttrs * oam;
    u32 i;
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
    DmaCopy16(3, gGfxSaveGameTiles, VRAM, 0x1000);
    DmaCopy16(3, gGfx4bppInvestigationActions, OBJ_VRAM0 + 0x2000, 0x1000);
    DmaCopy16(3, gPalActionButtons, OBJ_PLTT+0xA0, 0x40);
    DmaCopy16(3, gGfx4bppInvestigationScrollButton, OBJ_VRAM0 + 0x3000, 0x200);
    DmaCopy16(3, gPalInvestigationScrollPrompt, OBJ_PLTT+0xE0, 0x20);
    DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0 + 0x3200, 0x200);
    DmaCopy16(3, gPalExamineCursors, OBJ_PLTT+0x100, 0x20);
    DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT+0x120, 0x40);
    oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    for(i = 0; i < 4; i++)
    {
        oam->attr0 = SPRITE_ATTR0(-32 & 0xFF, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(i*60, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x100 + i*0x20, 0, 5);
        oam++;
    }
    SetInactiveActionButtons(investigation, 0xF);
    investigation->inactiveActionButtonY = 0xE0;
    investigation->selectedActionYOffset = 0;
    investigation->lastActionYOffset = 8;
    investigation->selectedAction = 0;
    investigation->lastAction = 0;
    gInvestigationSegmentSetupFunctions[main->scenarioIdx](main);
    i = main->roomData[main->currentRoomId][0];
    DecompressBackgroundIntoBuffer(i);
    CopyBGDataToVram(i);
    CopyBGDataToVram(0x81);
    ioRegs->lcd_bg1vofs = ~80;
    ioRegs->lcd_dispcnt &= ~DISPCNT_BG1_ON;
    InitializeCourtRecordForScenario(main, &gCourtRecord);
    DmaFill32(3, 0, main->scriptFlags, sizeof(main->scriptFlags));
    main->gameStateFlags = 0;
    main->tilemapUpdateBits = 0xF;
    main->advanceScriptContext = TRUE;
    main->showTextboxCharacters = TRUE;
    gScriptContext.currentSection = 0xFFFF;
    ChangeScriptSection(0x80);
    if(gMain.scenarioIdx != 12)
        SlideTextbox(1);
    if(gMain.scenarioIdx == 7) {
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
    }
    gInvestigationRoomSetupFunctions[main->scenarioIdx](main);
    UpdateScrollPromptSprite(main, 0);
    SetCurrentEpisodeBit();
    SetTimedKeysAndDelay(DPAD_RIGHT | DPAD_LEFT, 15);
    StartHardwareBlend(1, 1, 1, 0x1F);
    ioRegs->lcd_bldy = 0x10;
    SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
}

void InvestigationMain(struct Main * main, struct InvestigationStruct * investigation) // tantei_main
{
    sub_800BC08(20);
    if(main->blendMode || investigation->actionState == 0x02)
    {
        UpdateScrollPromptSprite(main, 0);
        return;
    }

    if(gJoypad.pressedKeys & START_BUTTON)
    {
        if(!(main->gameStateFlags & 0x10))
        {
            if(gScriptContext.flags & (SCRIPT_FULLSCREEN | 1) && gMain.currentDisplayBG != 0x80)
            {
                sub_800A3A0(0);
                return;
            }
        }
    }

    if(gJoypad.pressedKeys & R_BUTTON)
    {
        if(!(main->gameStateFlags & 0x10) && (gScriptContext.flags & (SCRIPT_FULLSCREEN | 1)))
        {
            goto r;
        }
    }
    if(gScriptContext.textboxState != 1 || 
    main->advanceScriptContext || 
    main->showTextboxCharacters)
    {
        UpdateScrollPromptSprite(main, 0);
        return;
    }
    UpdateScrollPromptSprite(main, 1);
    if(gJoypad.pressedKeys & START_BUTTON)
    {
        if(!(main->gameStateFlags & 0x10) && gMain.currentDisplayBG != 0x80)
        {
            sub_800A3A0(0);
            return;
        }
    }

    if(gJoypad.pressedKeys & R_BUTTON)
    {
        if(!(main->gameStateFlags & 0x10)) {
            r:
            PlaySE(SE007_MENU_OPEN_SUBMENU);
            BACKUP_PROCESS_PTR(main);
            SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0, main);
            UpdateScrollPromptSprite(main, 0);
            investigation->selectedActionYOffset = 0;
            investigation->lastActionYOffset = 8;
            investigation->lastAction = investigation->selectedAction;
            return;
        }
    }
    else if(gJoypad.activeTimedKeys & (DPAD_RIGHT | DPAD_LEFT))
    {
        investigation->lastAction = investigation->selectedAction;
        if(gJoypad.activeTimedKeys & DPAD_LEFT)
            investigation->selectedAction--;
        else
            investigation->selectedAction++;
        if(investigation->personActive == 0)
            investigation->selectedAction &= 1;
        else
            investigation->selectedAction &= 3;
        PlaySE(SE000_MENU_CHANGE);
        investigation->selectedActionYOffset = 0;
        investigation->lastActionYOffset = 8;
    }
    else if(gJoypad.pressedKeys & A_BUTTON)
    {
        PlaySE(SE001_MENU_CONFIRM);
        investigation->pointerX = 120;
        investigation->pointerY = 50;
        SetInactiveActionButtons(investigation, 0xF);
        investigation->inactiveActions -= 1 << investigation->selectedAction;
        investigation->inactiveActionButtonY = 240;
        investigation->selectedActionYOffset = 8;
        investigation->lastActionYOffset = 0;
        investigation->lastAction = investigation->selectedAction;
        investigation->actionState = 3;
        UpdateScrollPromptSprite(main, 0);
        if(investigation->selectedAction == 0)
        {
            sub_800BC08(11);
            StartAnimationBlend(0xC, 1);
            investigation->pointerColorCounter = 0;
            investigation->pointerColor = 0;
            DmaCopy16(3, gPalExamineCursors, OBJ_PLTT+0x100, 0x20);
        }
        main->process[GAME_PROCESS_STATE] = INVESTIGATION_INSPECT + investigation->selectedAction;
        main->process[GAME_PROCESS_VAR2] = 0;
        main->process[GAME_PROCESS_VAR1] = 0;
        return;
    }
    else
    {
        u32 bgBits = GetBGControlBits(main->currentBG);
        if((bgBits & BG_MODE_SIZE_480x160 || bgBits & BG_MODE_SIZE_360x160)
         && gJoypad.pressedKeys & L_BUTTON)
        {
            if(main->Bg256_pos_x == 0 || 
            main->Bg256_pos_x == 120 ||
            main->Bg256_pos_x == 240)
            {
                PlaySE(SE001_MENU_CONFIRM);
                main->isBGScrolling = TRUE;
                if(main->Bg256_pos_x == 0)
                    main->horizontolBGScrollSpeed = 6;
                else if(main->Bg256_pos_x == 120 || main->Bg256_pos_x == 240)
                    main->horizontolBGScrollSpeed = -6;
                main->process[GAME_PROCESS_STATE] = INVESTIGATION_BG_SCROLL_WAIT;
                main->process[GAME_PROCESS_VAR2] = 0;
                main->process[GAME_PROCESS_VAR1] = 0;
                investigation->actionState = 3;
                SetInactiveActionButtons(investigation, 0xF);
            }
        }
    }
    if(investigation->selectedActionYOffset < 8)
        investigation->selectedActionYOffset++;
    if(investigation->lastActionYOffset > 0)
        investigation->lastActionYOffset--;
}

void InvestigationExit(struct Main * main, struct InvestigationStruct * investigation) // tantei_exit
{
    ClearSectionReadFlags(main);
    sub_8007238(main);
    DmaCopy16(3, &gMain, &gSaveDataBuffer.main, sizeof(gMain));
    SET_PROCESS_PTR(SAVE_GAME_PROCESS, 0, 0, 1, main);
    if(main->scenarioIdx == 2)
    {
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
}

void InvestigationBgScrollWait(struct Main * main, struct InvestigationStruct * investigation) // tantei_bg_scroll_wait
{
    bool32 finishedScrolling;
    UpdateScrollPromptSprite(main, 0);
    if(main->process[GAME_PROCESS_VAR1] == 0)
    {
        if(GetBGControlBits(main->currentBG) & BG_MODE_SIZE_480x160)
        {
            if(main->Bg256_pos_x == 0 || main->Bg256_pos_x == 240)
                finishedScrolling = TRUE;
            else
                finishedScrolling = FALSE;
        }
        else 
        {
            if(main->Bg256_pos_x == 0 || main->Bg256_pos_x == 120)
                finishedScrolling = TRUE;
            else
                finishedScrolling = FALSE;
        }
        if(finishedScrolling)
        {
            investigation->selectedActionYOffset = 0;
            investigation->lastActionYOffset = 0;
            investigation->actionState = 1;
            main->process[GAME_PROCESS_VAR1]++;
        }
    }
    else
    {
        if(investigation->actionState == 0)
            SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
    }
}

void InvestigationTextboxSlideWait(struct Main * main, struct InvestigationStruct * investigation) // tantei_mw_scroll_wait
{
    UpdateScrollPromptSprite(main, 0);
    if(gScriptContext.textboxState == 0)
        SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
}

void InvestigationRoomInit(struct Main * main, struct InvestigationStruct * investigation) // tantei_room_init
{
    u32 i, j;
    u8 * roomData;
    struct OamAttrs * oam;

    if(gScriptContext.textboxState != 1)
        return;
    if (main->blendCounter == 0xFFFF) {
        sub_8016FEC(0);
    }
    if(main->blendMode)
        return;
    roomData = main->roomData[main->currentRoomId];
    if(main->process[GAME_PROCESS_VAR1] == 0)
    {
        ResetSoundControl();
        DecompressBackgroundIntoBuffer(roomData[0]);
        main->process[GAME_PROCESS_VAR1] = 1;
        return;
    }
    CheckBGChange_iOS(roomData[0], 0);
    CopyBGDataToVram(roomData[0]);
    oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
    for(i = 0; i < 4; i++)
    {
        for(j = 0; j < 2; oam++, j++)
            oam->attr0 = SPRITE_ATTR0_CLEAR;
    }
    oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
    {
        oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(i*60, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x100+i*0x20, 0, 5);
        oam++;
    }
    SetInactiveActionButtons(investigation, 0xF);
    investigation->inactiveActionButtonY = 0xE0;
    investigation->selectedActionYOffset = 0;
    investigation->lastActionYOffset = 8;
    investigation->selectedAction = 0;
    investigation->lastAction = 0;
    investigation->actionState = 1;
    ClearAllAnimationSprites();
    DestroyAnimation(&gAnimation[1]);
    gInvestigation.personActive = 0;
    SetInactiveActionButtons(&gInvestigation, 0xF);
    gInvestigationRoomSetupFunctions[main->scenarioIdx](main);
    sub_8017154(3);
    sub_800BC08(0xA);
    UpdateScrollPromptSprite(main, 0);
    StartHardwareBlend(1, 1, 1, 0x1F);
    SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
}

void InvestigationInspect(struct Main * main, struct InvestigationStruct * investigation) // tantei_inspect // ! goto
{
    u32 temp;
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_GENERAL_2+1]; // this was OAM_IDX_38_1 in pwaa2
    
    sub_800BC08(20);
    if(gAnimation[1].flags & ANIM_BLEND_ACTIVE)
        return;
    if(main->blendMode)
        return;
    
    if(gJoypad.pressedKeys & START_BUTTON) {
        if(!(main->gameStateFlags & 0x10)) {
            if(gScriptContext.flags & (SCRIPT_FULLSCREEN | 1) && gMain.currentDisplayBG != 0x80) {   
                sub_800A3A0(0);
                return;
            }
        }
    }
    if(gJoypad.pressedKeys & R_BUTTON) {
        if(!(main->gameStateFlags & 0x10)) {
            if(gScriptContext.flags & (SCRIPT_FULLSCREEN | 1))
                goto r;
            
        }
    }
    if(investigation->inspectionPaused)
        return;
    if(gScriptContext.textboxState != 1)
        return;
    if(!(main->advanceScriptContext == FALSE && main->showTextboxCharacters == FALSE))
        return;
    switch(main->process[GAME_PROCESS_VAR1])
    {
        default:
            break;
        case 0:
            if(investigation->selectedActionYOffset <= 0xF)
                investigation->selectedActionYOffset++;
            investigation->lastActionYOffset = 0;
            if (investigation->selectedActionYOffset > 0xF)
                main->process[GAME_PROCESS_VAR1]++;
            break;
        case 1:
            temp = 3;
            if(gJoypad.pressedKeys & START_BUTTON)
            {
                if(!(main->gameStateFlags & 0x10)) {
                    if(gMain.currentDisplayBG != 0x80) {   
                        sub_800A3A0(0);
                        return;
                    }
                }
            }
            if(gJoypad.pressedKeys & R_BUTTON)
            {
                if(!(main->gameStateFlags & 0x10)) {
                    r:
                    PlaySE(49);
                    BACKUP_PROCESS_PTR(main);
                    SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0, main);
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                    return;
                }
            }
            if(gJoypad.pressedKeys & A_BUTTON)
            {
                PlaySE(43);
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                temp = GetExaminedAreaSection(investigation);
                ChangeScriptSection(temp);
                SlideTextbox(1);
                investigation->inspectionPaused = TRUE;
                investigation->pointerFrame = 0;
                investigation->pointerFrameCounter = 0;
                investigation->inactiveActions = 1;
                investigation->actionState = 3;
                investigation->inactiveActionButtonY = 0xF0;
                investigation->selectedActionYOffset = 0;
                investigation->lastActionYOffset = 0;
                gIORegisters.lcd_bldcnt = 0x1942;
                gIORegisters.lcd_bldalpha = 0x71F;
                return;
            }
            if(gJoypad.pressedKeys & B_BUTTON)
            {
                PlaySE(44);
                main->process[GAME_PROCESS_VAR1] = 2;
                SetInactiveActionButtons(investigation, 0xE);
                investigation->actionState = 2;
                investigation->inactiveActionButtonY = 0xE0;
                investigation->selectedActionYOffset = 0x10;
                investigation->lastActionYOffset = 0;
                return;
            }
            
            if(gJoypad.heldKeys & DPAD_LEFT)
            {
                investigation->pointerX -= temp;
                if(investigation->pointerY < 16 && investigation->pointerX < 60)
                    investigation->pointerX = 60;
                if(investigation->pointerX > 224)
                    investigation->pointerX = 0;
            }
            if(gJoypad.heldKeys & DPAD_RIGHT)
            {
                investigation->pointerX += temp;
                if(investigation->pointerY < 16 && investigation->pointerX < 60)
                    investigation->pointerX = 60;
                if(investigation->pointerX > 224)
                    investigation->pointerX = 224;
            }
            if(gJoypad.heldKeys & DPAD_UP)
            {
                investigation->pointerY -= temp;
                if(investigation->pointerX < 60 && investigation->pointerY < 16)
                    investigation->pointerY = 16;
                if(investigation->pointerY > 144)
                    investigation->pointerY = 0;
            }
            if(gJoypad.heldKeys & DPAD_DOWN)
            {
                investigation->pointerY += temp;
                if(investigation->pointerX < 60 && investigation->pointerY < 16)
                    investigation->pointerY = 16;
                if(investigation->pointerY > 144)
                    investigation->pointerY = 144;
            }
            temp = GetExaminedAreaSection(investigation);
            if(temp == 0x1E ||
                (
                    (gMain.scenarioIdx == 2 && temp == 0x128) ||
                    (gMain.scenarioIdx == 4 && temp == 0xDF)
                )
            ) // ! come one just a little more hardcoding please :(
            {
                
                investigation->pointerFrame = 0;
                investigation->pointerFrameCounter = 0;
            }
            else
            {
                investigation->pointerFrameCounter++;
                if(investigation->pointerFrameCounter > 8)
                {
                    investigation->pointerFrameCounter = 0;
                    investigation->pointerFrame += 4;
                    investigation->pointerFrame &= 0xF;
                }
            }
            oam->attr0 = SPRITE_ATTR0(investigation->pointerY, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            if(investigation->pointerX < 120)
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(investigation->pointerX, TRUE, FALSE, 1);
            else
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(investigation->pointerX, FALSE, FALSE, 1);
            oam->attr2 = SPRITE_ATTR2(0x190+investigation->pointerFrame, 0, 8);
            investigation->pointerColorCounter++;
            if(investigation->pointerColorCounter > 1)
            {
                investigation->pointerColorCounter = 0;
                investigation->pointerColor += 1;
                investigation->pointerColor &= 0xF;
                DmaCopy16(3, gPalExamineCursors+investigation->pointerColor*32, OBJ_PLTT+0x100, 0x20);
            }
            break;
        case 2:
            if(investigation->selectedActionYOffset > 8)
                investigation->selectedActionYOffset--;
            if(investigation->actionState == 0)
            {
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                ChangeAnimationActivity(&gAnimation[1], TRUE);
                sub_800BC08(12);
                StartAnimationBlend(1, 1);
                SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
                investigation->inactiveActions += 1 << investigation->selectedAction;
                investigation->selectedActionYOffset = 8;
                investigation->lastActionYOffset = 0;
            }
            break;
    }
}

extern const u8 * gUnknown_08026960[];

void InvestigationMove(struct Main * main, struct InvestigationStruct * investigation) // tantei_move
{
    struct OamAttrs * oam;
    u8 * moveLocations;
    uintptr_t vram;
    uintptr_t temp;
    u32 i;
    u32 j;
    u32 k;
    
    switch(main->process[GAME_PROCESS_VAR1])
    {
        default:
            break;
        case 0:
            if(investigation->selectedActionYOffset < 16)
                investigation->selectedActionYOffset++;
            investigation->lastActionYOffset = 0;
            if (investigation->selectedActionYOffset >= 16)
                main->process[GAME_PROCESS_VAR1]++;
            break;
        case 1:
            oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
            moveLocations = main->roomData[main->currentRoomId];
            moveLocations += 1;
            for(i = 0; i < 4; i++)
            {
                vram = (uintptr_t)OBJ_VRAM0 + 0x3400;
                vram += i * 0x800;
                if(*moveLocations != 0xFF)
                {
                    investigation->activeOptions[i] = TRUE;
                    temp = (uintptr_t)eGeneralScratchpadBuffer;
                    LZ77UnCompWram(gUnknown_08026960[*moveLocations], (u8*)temp);
                    DmaCopy16(3, temp, vram, 0x800);
                    for(j = 0, k = i * 4; j < 2; j++)
                    {
                        u32 baseTile = 0x1A0;
                        oam->attr0 = k + 0x4080;
                        oam->attr1 = j * 64 + 0xC038;
                        oam->attr2 = (j * 0x20 + baseTile + i * 0x40) | 0x9000; // priority 0, palette 9 
                        oam++;
                    }
                }
                else
                {
                    investigation->activeOptions[i] = FALSE;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                }
                moveLocations++;
            }
            investigation->selectedOption = 0;
            main->process[GAME_PROCESS_VAR1]++;
            main->process[GAME_PROCESS_VAR2] = 0;
            {   
                u32 temp = 0;
                for(i = 0; i < 4; i++) {
                    temp += gInvestigation.activeOptions[i];
                }
                if(temp == 0) {
                    SlideTextbox(1);
                    gInvestigation.actionState = 4;
                    ChangeScriptSection(0x1E);
                }
            }
            break;
        case 2:
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 -= (4-i) << 1;
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS];
            temp = (u16)(oam->attr1 & ~0x1ff);
            oam->attr1 -= 6;
            oam->attr1 &= 0x1FF;
            if(oam->attr1 >= 0x100)
                oam->attr1 = 0;
            if(oam->attr1 == 0 && main->process[GAME_PROCESS_VAR2] > 0xC)
            {
                main->process[GAME_PROCESS_VAR1]++;
                main->process[GAME_PROCESS_VAR2] = 0;
            }
            oam->attr1 |= temp;
            break;
        case 3:
            if(main->blendMode)
                break;
            {
                u32 temp = 0;
                for(i = 0; i < 4; i++) {
                    temp += gInvestigation.activeOptions[i];
                }
                if(temp == 0) {
                    if((gScriptContext.flags & 0x8) == 0) {
                        return;
                    }
                    else {
                        SlideTextbox(0);
                        gInvestigation.actionState = 4;
                        gInvestigation.inactiveActionButtonY = 0xE0;
                        gInvestigation.selectedActionYOffset = 0x10;
                        gInvestigation.lastActionYOffset = 0;
                        main->process[GAME_PROCESS_VAR1]++;
                        main->process[GAME_PROCESS_VAR2] = 0;
                        return;
                    }
                }
            }
            if(gJoypad.pressedKeys & START_BUTTON)
            {
                if(!(main->gameStateFlags & 0x10) && gMain.currentDisplayBG != 0x80)
                {
                    sub_800A3A0(0);
                }
                break;
            }
            else if(gJoypad.pressedKeys & R_BUTTON)
            {
                if(!(main->gameStateFlags & 0x10))
                {
                    PlaySE(SE007_MENU_OPEN_SUBMENU);
                    main->process[GAME_PROCESS_VAR1] = 6; //! tries opening court record from switch case 6 but fails spectacularly
                    BACKUP_PROCESS_PTR(main);
                    SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0, main);
                    oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                    for(i = 0; i < 8; oam++, i++)
                        oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                }
                break;
            }
            if(gJoypad.pressedKeys & DPAD_UP)
            {
                i = 0;
                j = investigation->selectedOption-1;
                temp = investigation->selectedOption;
                do
                {
                    j &= 3;
                    if(investigation->activeOptions[j] != FALSE)
                    {
                        investigation->selectedOption = j;
                        break;                    
                    }
                    j--;
                }
                while(++i < 4);
                if(temp != investigation->selectedOption)
                    PlaySE(SE000_MENU_CHANGE);
                break;
            }
            else if(gJoypad.pressedKeys & DPAD_DOWN)
            {
                i = 0;
                j = investigation->selectedOption+1;
                temp = investigation->selectedOption;
                do
                {
                    j &= 3;
                    if(investigation->activeOptions[j] != FALSE)
                    {
                        investigation->selectedOption = j;
                        break;                    
                    }
                    j++;
                }
                while(++i < 4) ;
                if(temp != investigation->selectedOption)
                    PlaySE(SE000_MENU_CHANGE);
                break;
            }
            else if(gJoypad.pressedKeys & A_BUTTON)
            {
                u32 roomId;
                PlaySE(SE001_MENU_CONFIRM);
                roomId = main->currentRoomId;
                j = investigation->selectedOption+1;
                main->currentRoomId = main->roomData[roomId][j];
                FadeOutBGM(20);
                sub_800BC08(13);
                StartHardwareBlend(2, 1, 1, 0x1F);
                SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_ROOM_INIT, 0, 0, main);
                break;
            }
            else if(gJoypad.pressedKeys & B_BUTTON)
            {
                PlaySE(SE002_MENU_CANCEL);
                main->process[GAME_PROCESS_VAR1]++;
                main->process[GAME_PROCESS_VAR2] = 0;
                break;
            }
            break;
        case 4:
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 += ((4-i) << 1) + 4;
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS];
            temp = (u16)(oam->attr1 & ~0x1ff);
            oam->attr1 += 6;
            oam->attr1 &= 0x1FF;
            if(oam->attr1 >= 60)
            {
                oam->attr1 = 60;
                SetInactiveActionButtons(investigation, 13);
                investigation->actionState = 2;
                investigation->inactiveActionButtonY = 0xE0;
                investigation->selectedActionYOffset = 0x10;
                investigation->lastActionYOffset = 0;
                main->process[GAME_PROCESS_VAR1]++;
            }
            oam->attr1 |= temp;
            break;
        case 5:
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 += ((4-i) << 1) + 4;
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            if(investigation->selectedActionYOffset > 8)
                investigation->selectedActionYOffset--;
            if(investigation->actionState == 0 && main->process[GAME_PROCESS_VAR2] > 12)
            {
                SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
                investigation->inactiveActions += 1 << investigation->selectedAction;
                investigation->selectedActionYOffset = 8;
                investigation->lastActionYOffset = 0;
            }
            break;
        case 6:
            oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
            moveLocations = main->roomData[main->currentRoomId];
            moveLocations += 1;
            for(i = 0; i < 4; i++)
            {
                vram = (uintptr_t)OBJ_VRAM0 + 0x3400;
                vram += i * 0x800;
                if(*moveLocations != 0xFF)
                {
                    investigation->activeOptions[i] = TRUE;
                    temp = (uintptr_t)eGeneralScratchpadBuffer;
                    LZ77UnCompWram(gUnknown_08026960[*moveLocations], (u8*)temp);
                    DmaCopy16(3, temp, vram, 0x800);
                    for(j = 0; j < 2; j++)
                    {
                        u32 baseTile = 0x1A0;
                        oam->attr0 = i * 30 + 0x4018;
                        oam->attr1 = j * 64 + 0xC038;
                        oam->attr2 = (j * 0x20 + baseTile + i * 0x40) | 0x9000; // priority 0, palette 9
                        oam++;
                    }
                }
                else
                {
                    investigation->activeOptions[i] = FALSE;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                }
                moveLocations++;
            }
            main->process[GAME_PROCESS_VAR1] = 3;
            break;
    }
    oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
    for(i = 0; i < 4; i++)
    {
        if(i == investigation->selectedOption)
        {
            for(j = 0; j < 2; j++)
            {
                oam->attr2 &= ~0xF000;
                oam->attr2 += 0x9000;
                oam++;
            }
        }
        else
        {
            for(j = 0; j < 2; j++)
            {
                oam->attr2 &= ~0xF000;
                oam->attr2 += 0xA000;
                oam++;
            }
        }
    }
}
 
extern const u8 * gUnknown_08026810[];

void InvestigationTalk(struct Main * main, struct InvestigationStruct * investigation) // tantei_talk
{
    uintptr_t temp;
    u32 i;
    u32 j;
    u8 * icons;
    uintptr_t vram;
    struct OamAttrs * oam;
    struct TalkData * talkData;
    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            if(investigation->selectedActionYOffset < 16)
                investigation->selectedActionYOffset++;
            investigation->lastActionYOffset = 0;
            if(investigation->selectedActionYOffset >= 16)
                main->process[GAME_PROCESS_VAR1]++;
            break;
        case 1:
        {
            for(talkData = gTalkData; talkData->roomId != 0xFF; talkData++)
            {
                if(main->currentRoomId == talkData->roomId
                && gAnimation[1].animationInfo.personId == talkData->personId
                && talkData->enableFlag == TRUE)
                    break;
            }
            oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
            icons = talkData->iconId;
            for(i = 0; i < 4; i++)
            {
                vram = (uintptr_t)OBJ_VRAM0 + 0x3400;
                vram += i * 0x800;
                if(*icons != 0xFF)
                {
                    investigation->activeOptions[i] = TRUE;
                    temp = (uintptr_t)eGeneralScratchpadBuffer;
                    LZ77UnCompWram(gUnknown_08026810[*icons], (u8*)temp);
                    DmaCopy16(3, temp, vram, 0x800);
                    for(j = 0; j < 2; j++)
                    {
                        u32 baseTile = 0x1A0;
                        oam->attr0 = i * 4 + 0x4080;
                        oam->attr1 = j * 64 + 0xC038;
                        oam->attr2 = (j * 0x20 + baseTile + i * 0x40) | 0x9000; // priority 0, palette 9 
                        oam++;
                    }
                }
                else
                {
                    investigation->activeOptions[i] = FALSE;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                }
                icons++;
            }
            DmaCopy16(3, gGfxCheckmark, OBJ_VRAM0+0x5400, 0x200);
            DmaCopy16(3, gPalCheckmark, PLTT+0x360, 0x20);
            if(investigation->previousSelectedOption) {
                investigation->selectedOption = investigation->previousSelectedOption;
                investigation->previousSelectedOption = 0;
            }
            else {
                investigation->selectedOption = 0;
            }
            main->process[GAME_PROCESS_VAR1]++;
            main->process[GAME_PROCESS_VAR2] = 0;

            break;
        }
        case 2:
        {
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 -= ((4-i) << 1);
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_TALK];
            temp = (u16)(oam->attr1 & ~0x1ff);
            oam->attr1 -= 9;
            oam->attr1 &= 0x1FF;
            if(oam->attr1 >= 256)
                oam->attr1 = 0;
            if(oam->attr1 == 0 && main->process[GAME_PROCESS_VAR2] > 12)
            {
                main->process[GAME_PROCESS_VAR1]++;
                main->process[GAME_PROCESS_VAR2] = 0;
            }
            oam->attr1 |= temp;
            break;
        }
        case 3:
        {
            DmaCopy16(3, gGfxCheckmark, OBJ_VRAM0+0x5400, 0x200);
            DmaCopy16(3, gPalCheckmark, OBJ_PLTT+0x160, 0x20);
            for(talkData = gTalkData; talkData->roomId != 0xFF; talkData++)
            {
                if(main->currentRoomId == talkData->roomId
                && gAnimation[1].animationInfo.personId == talkData->personId
                && talkData->enableFlag == TRUE)
                    break;
            }
            vram = TRUE;
            if(main->blendMode == 0)
            {
                if(gJoypad.pressedKeys & START_BUTTON)
                {
                    if(!(main->gameStateFlags & 0x10) && gMain.currentDisplayBG != 0x80)
                    {
                        sub_800A3A0(0);
                    }
                }
                else if(gJoypad.pressedKeys & R_BUTTON)
                {
                    if(!(main->gameStateFlags & 0x10))
                    {
                        PlaySE(SE007_MENU_OPEN_SUBMENU);
                        main->process[GAME_PROCESS_VAR1] = 8;
                        BACKUP_PROCESS_PTR(main);
                        SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0, main);
                        oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                        for(i = 0; i < 8; oam++, i++)
                            oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                        vram = FALSE;
                    }
                }
                else if(gJoypad.pressedKeys & DPAD_UP)
                {
                    i = 0;
                    j = investigation->selectedOption-1;
                    temp = investigation->selectedOption;
                    do
                    {
                        j &= 3;
                        if(investigation->activeOptions[j] != FALSE)
                        {
                            investigation->selectedOption = j;
                            break;                    
                        }
                        j--;
                    }
                    while(++i < 4);
                    if(temp != investigation->selectedOption)
                        PlaySE(SE000_MENU_CHANGE);
                }
                else if(gJoypad.pressedKeys & DPAD_DOWN)
                {
                    i = 0;
                    j = investigation->selectedOption+1;
                    temp = investigation->selectedOption;
                    do
                    {
                        j &= 3;
                        if(investigation->activeOptions[j] != FALSE)
                        {
                            investigation->selectedOption = j;
                            break;                    
                        }
                        j++;
                    }
                    while(++i < 4);
                    if(temp != investigation->selectedOption)
                        PlaySE(SE000_MENU_CHANGE);
                }
                else if(gJoypad.pressedKeys & A_BUTTON)
                {
                    PlaySE(SE001_MENU_CONFIRM);
                    temp = talkData->talkSection[investigation->selectedOption];
                    ChangeScriptSection(temp);
                    SlideTextbox(1);
                    if(!GetFlag(2, talkData->talkFlagId[investigation->selectedOption]))
                    {
                        ChangeFlag(2, talkData->talkFlagId[investigation->selectedOption], TRUE);
                    }
                    SetInactiveActionButtons(investigation, 4);
                    investigation->inactiveActionButtonY = 0xF0;
                    investigation->actionState = 3;
                    main->process[GAME_PROCESS_VAR1] = 6;
                    main->process[GAME_PROCESS_VAR2] = 0;
                    vram = FALSE;
                }
                else if(gJoypad.pressedKeys & B_BUTTON)
                {
                    PlaySE(SE002_MENU_CANCEL);
                    main->process[GAME_PROCESS_VAR1]++;
                    main->process[GAME_PROCESS_VAR2] = 0;
                    vram = FALSE;
                }
            }
            oam = &gOamObjects[OAM_IDX_TALK_TICK];
            if(vram)
            {
                for(i = 0; i < 4; i++)
                {
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    for(j = 0; j < 4; j++)
                    {
                        if(GetFlag(2, talkData->talkFlagId[i]))
                        {
                            u16 blab = IsTalkSectionPsycheLocked(talkData->talkSection[i]);
                            if(blab) {
                                DmaCopy16(3, gGfxInvestigationPsycheLock, OBJ_VRAM0+0x3000, 0x200);
                                DmaCopy16(3, gPalInvestigationPsycheLock, OBJ_PLTT+0xE0, 0x20);
                                oam->attr0 = 0x16 + i * 30;
                                oam->attr1 = 0x8024;
                                oam->attr2 = 0x7180;
                            }
                            else {
                                oam->attr0 = 0x10 + i * 30;
                                oam->attr1 = 0x8030;
                                oam->attr2 = 0xB2A0;
                            }
                            break;
                        }
                    }
                    oam++;
                }
            }
            else
            {
                for(i = 0; i < 4; i++)
                {
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                }
            }
            break;
        }
        case 4:
        {
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 += ((4-i) << 1) + 4;
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_TALK];
            temp = (u16)(oam->attr1 & ~0x1ff);
            oam->attr1 += 9;
            oam->attr1 &= 0x1FF;
            if(oam->attr1 >= 120)
            {
                oam->attr1 = 120;
                SetInactiveActionButtons(investigation, 0xB);
                investigation->actionState = 2;
                investigation->inactiveActionButtonY = 0xE0;
                investigation->selectedActionYOffset = 0x10;
                investigation->lastActionYOffset = 0;
                main->process[GAME_PROCESS_VAR1]++;
            }
            oam->attr1 |= temp;
            break;
        }
        case 5:
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 += ((4-i) << 1) + 4;
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            if(investigation->selectedActionYOffset > 8)
                investigation->selectedActionYOffset--;
            if(investigation->actionState == 0 && main->process[GAME_PROCESS_VAR2] > 12)
            {

                DmaCopy16(3, gGfx4bppInvestigationScrollButton, OBJ_VRAM0+0x3000, 0x200);
                DmaCopy16(3, gPalInvestigationScrollPrompt, OBJ_PLTT+0xE0, 0x20);
                SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
                investigation->inactiveActions += 1 << investigation->selectedAction;
                investigation->selectedActionYOffset = 8;
                investigation->lastActionYOffset = 0;
            }
            break;
        case 6:
            if(main->blendMode)
                return;
            if(gJoypad.pressedKeys & START_BUTTON)
            {
                if(!(main->gameStateFlags & 0x10))
                {
                    if((gScriptContext.flags & (SCRIPT_FULLSCREEN | 1)) && gMain.currentDisplayBG != 0x80)
                    {
                        sub_800A3A0(0);
                        return;
                    }
                }
            }
            if(gJoypad.pressedKeys & R_BUTTON)
            {
                if(!(main->gameStateFlags & 0x10))
                {
                    if(gScriptContext.flags & (SCRIPT_FULLSCREEN | 1))
                    {
                        PlaySE(SE007_MENU_OPEN_SUBMENU);
                        BACKUP_PROCESS_PTR(main);
                        SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_INIT, 0, 0, main);
                        return;
                    }
                }
            }
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 += ((4-i) << 1) + 4;
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            if(gScriptContext.textboxState == 1)
            {
                if(!(gScriptContext.flags & SCRIPT_LOOP))
                    return;
                oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_TALK];
                oam->attr1 &= ~0x1FF;
                for(talkData = gTalkData; talkData->roomId != 0xFF; talkData++)
                {
                    if(main->currentRoomId == talkData->roomId
                    && gAnimation[1].animationInfo.personId == talkData->personId
                    && talkData->enableFlag == TRUE)
                        break;
                }
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                icons = talkData->iconId;
                for(i = 0; i < 4; i++)
                {
                    vram = (uintptr_t)OBJ_VRAM0 + 0x3400;
                    vram += i * 0x800;
                    if(*icons != 0xFF)
                    {
                        investigation->activeOptions[i] = TRUE;
                        temp = (uintptr_t)eGeneralScratchpadBuffer;
                        LZ77UnCompWram(gUnknown_08026810[*icons], (u8*)temp);
                        DmaCopy16(3, temp, vram, 0x800);
                        for(j = 0; j < 2; j++)
                        {
                            u32 baseTile = 0x1A0;
                            oam->attr0 = i * 4 + 0x4080;
                            oam->attr1 = j * 64 + 0xC038;
                            oam->attr2 = (j * 0x20 + baseTile + i * 0x40) | 0x9000; // priority 0, palette 9 
                            oam++;
                        }
                    }
                    else
                    {
                        investigation->activeOptions[i] = FALSE;
                        oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                        oam++;
                        oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                        oam++;
                    }
                    icons++;
                }
                j = investigation->selectedOption;
                if(!investigation->activeOptions[j] && investigation->selectedOption) {
                    investigation->selectedOption--;
                }
                SetInactiveActionButtons(&gInvestigation, 4);
                gInvestigation.actionState = 1;
                gInvestigation.selectedActionYOffset = 0;
                gInvestigation.lastActionYOffset = 0;
                main->process[GAME_PROCESS_VAR1]++;
                main->process[GAME_PROCESS_VAR2] = 0;
            }
            break;
        case 7:
            if(main->process[GAME_PROCESS_VAR2] <= 12)
            {
                oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
                for(i = 0; i < 4; i++)
                {
                    for(j = 0; j < 2; j++)
                    {
                        oam->attr0 -= ((4-i) << 1);
                        oam++;
                    }
                }
                main->process[GAME_PROCESS_VAR2]++;
            }
            if(investigation->actionState == 0 && main->process[GAME_PROCESS_VAR2] > 12)
            {
                main->process[GAME_PROCESS_VAR1] = 3;
                main->process[GAME_PROCESS_VAR2] = 0;
            }
            break;
        case 8:
        {
            for(talkData = gTalkData; talkData->roomId != 0xFF; talkData++)
            {
                if(main->currentRoomId == talkData->roomId
                && gAnimation[1].animationInfo.personId == talkData->personId
                && talkData->enableFlag == TRUE)
                    break;
            }
            oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
            icons = talkData->iconId;
            for(i = 0; i < 4; i++)
            {
                vram = (uintptr_t)OBJ_VRAM0 + 0x3400;
                vram += i * 0x800;
                if(*icons != 0xFF)
                {
                    investigation->activeOptions[i] = TRUE;
                    temp = (uintptr_t)eGeneralScratchpadBuffer;
                    LZ77UnCompWram(gUnknown_08026810[*icons], (u8*)temp);
                    DmaCopy16(3, temp, vram, 0x800);
                    for(j = 0; j < 2; j++)
                    {
                        u32 baseTile = 0x1A0;
                        oam->attr0 = i * 30 + 0x4018;
                        oam->attr1 = j * 64 + 0xC038;
                        oam->attr2 = (j * 0x20 + baseTile + i * 0x40) | 0x9000; // priority 0, palette 9 
                        oam++;
                    }
                }
                else
                {
                    investigation->activeOptions[i] = FALSE;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH+60, FALSE, FALSE, 0);
                    oam++;
                }
                icons++;
            }
            main->process[GAME_PROCESS_VAR1] = 3;
            break;
        }
    }
    oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
    for(i = 0; i < 4; i++)
    {
        if(i == investigation->selectedOption)
        {
            for(j = 0; j < 2; j++)
            {
                oam->attr2 &= ~0xF000;
                oam->attr2 += 0x9000;
                oam++;
            }
        }
        else
        {
            for(j = 0; j < 2; j++)
            {
                oam->attr2 &= ~0xF000;
                oam->attr2 += 0xA000;
                oam++;
            }
        }
    }
}

void InvestigationPresent(struct Main * main, struct InvestigationStruct * investigation) // tantei_show
{
    struct OamAttrs * oam;
    u32 i;

    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            if(investigation->selectedActionYOffset < 16)
                investigation->selectedActionYOffset++;
            investigation->lastActionYOffset = 0;
            if (investigation->selectedActionYOffset >= 16)
                main->process[GAME_PROCESS_VAR1]++;
            break;
        case 1:
            if(investigation->inactiveActionButtonY == 0xE0)
            {
                main->process[GAME_PROCESS_VAR1]++;
                BACKUP_PROCESS_PTR(main);
                SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_INIT, 0, 2, main);
            }
            break;
        case 2:
            if(investigation->inactiveActionButtonY == 0xE0
            && gScriptContext.textboxState == 0)
            {
                oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
                for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
                {
                    oam->attr0 = 0x40E0;
                    oam->attr1 = i * 60 + 0xC000;
                    oam->attr2 = i * 0x20 + 0x5100;
                    oam++;
                }
                SetInactiveActionButtons(investigation, 0xF);
                investigation->inactiveActionButtonY = 0xE0; // inactiveActionButtonY is already 0xE0 wtf
                investigation->selectedActionYOffset = 0x40;
                investigation->lastActionYOffset = 8;
                investigation->selectedAction = 3;
                investigation->lastAction = 3;
                SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
            }
            break;
        case 3:
            SetInactiveActionButtons(investigation, 7);
            investigation->actionState = 2;
            investigation->inactiveActionButtonY = 0xE0;
            investigation->selectedActionYOffset = 0x10;
            investigation->lastActionYOffset = 0;
            main->process[GAME_PROCESS_VAR1]++;
            break;
        case 4:
            if(investigation->selectedActionYOffset > 8)
                investigation->selectedActionYOffset--;
            if(investigation->actionState == 0)
            {
                investigation->selectedActionYOffset = 8;
                investigation->lastActionYOffset = 0;
                investigation->inactiveActions += 1 << investigation->selectedAction;
                SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
            }
            break;
    }
}

void InvestigationPsycheLock(struct Main * main, struct InvestigationStruct * investigation)  // ! inconsistent use of pointer vs global
{
    struct PsycheLockData * psycheLockData = NULL;
    static void * states[] = {
        &&_08010A78,
        &&_08010AA6,
        &&_08010AC4,
        &&_08010AD4,
        &&_08010C14,
        &&_08010CA4,
        &&_08010CB0,
        &&_08010CB6,
        &&_08010D9C,
        &&_08010E54,
        &&_08010EA6,
        &&_08010EAC
    };
    
    if(main->process[GAME_PROCESS_VAR1] == 9)
    goto _08010E54;
    
    psycheLockData = &main->psycheLockData[main->currentPsycheLockDataIndex];
    AnimatePsycheLockStopBresentButtons();
    goto *states[main->process[GAME_PROCESS_VAR1]];
    
    _08010A78:
    ResetHPBar();
    psycheLockData->numLocksRemaining = psycheLockData->numLocksTotal;
    SetPsycheLockState(11, psycheLockData->numLocksTotal);
    SetPsycheLockState(1, 0);
    ResetPsycheLockStopPresentButtonsState();
    gMain.psycheLockStopPresentButtonsActive = 0;
    investigation->inPsycheLockChallengeFlag |= 1;
    main->process[GAME_PROCESS_VAR1]++;
    _08010AA6:
    UpdatePsycheLockAnimation();
    if(IsPsycheLockAnimationInWaitState())
    main->process[GAME_PROCESS_VAR1]++;
    return;
    _08010AC4:
    ChangeScriptSection(psycheLockData->startScriptSection);
    gMain.advanceScriptContext = TRUE;
    main->process[GAME_PROCESS_VAR1] = 3;
    _08010AD4:
    if(gMain.psycheLockStopPresentButtonsActive & PSYLOCK_ENABLE_PRESENT
    && gJoypad.pressedKeys == R_BUTTON
    && gMain.psycheLockStopPresentButtonsState == 0
    && (main->gameStateFlags & 0x10) == 0
    && gScriptContext.flags & (1 | SCRIPT_FULLSCREEN | SCRIPT_LOOP))
    {
        SetPsycheLockPresentButtonOAMInCourtRecord();
        PlaySE(SE007_MENU_OPEN_SUBMENU);
        BACKUP_PROCESS_PTR(main);
        SET_PROCESS_PTR(COURT_RECORD_PROCESS, COURT_INIT, 0, 3, main);
    }
    if(gMain.psycheLockStopPresentButtonsActive & PSYLOCK_ENABLE_STOP
    && IsPsycheLockStopPresentButtonsAnimating() == FALSE
    && gMain.psycheLockStopPresentButtonsState == 0
    && gJoypad.pressedKeys == L_BUTTON)
    {
        PlaySE(SE002_MENU_CANCEL);
        main->process[GAME_PROCESS_VAR1] = 8;
        main->process[GAME_PROCESS_VAR2] = 0;
        goto _08010D9C; // goto state 8 immediately
    }
    if(gMain.psycheLockStopPresentButtonsActive == 0
    && IsPsycheLockStopPresentButtonsAnimating() == FALSE
    && gJoypad.pressedKeys == R_BUTTON
    && FindPlayingHPBarSmokeAnimations() == 0
    && (main->gameStateFlags & 0x10) == 0
    && gScriptContext.flags & (1 | SCRIPT_FULLSCREEN))
    {
        ClearHPBarOAM();
        PlaySE(SE007_MENU_OPEN_SUBMENU);
        BACKUP_PROCESS_PTR(main);
        SET_PROCESS_PTR(COURT_RECORD_PROCESS, COURT_INIT, 0, 4, main);
    }
    if(main->hpBarValue <= 0
    && main->hpBarDisplayValue <= 0
    && IsHPBarAnimating() == FALSE)
    main->process[GAME_PROCESS_VAR1] = 11;
    return;
    _08010C14:
    switch(main->process[GAME_PROCESS_VAR2]) {
        case 0:
        gMain.advanceScriptContext = FALSE;
        gMain.showTextboxCharacters = FALSE;
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
        gIORegisters.lcd_bg1vofs = 0;
        SetPsycheLockState(4, 0);
        main->process[GAME_PROCESS_VAR2]++;
        case 1:
        UpdatePsycheLockAnimation();
        if(IsPsycheLockAnimationInWaitState()) {
            main->process[GAME_PROCESS_VAR2]++;
            break;
        }
        break;
        case 2:
        psycheLockData->numLocksRemaining--;
        if(psycheLockData->numLocksRemaining == 0 && gMain.preventUnlockFlag == 0) {
            if((gScriptContext.unk1E & 0x100) == 0) {
                main->process[GAME_PROCESS_VAR1] = 7;
                main->process[GAME_PROCESS_VAR2] = 0;
                sub_8017154(3);
                break;
            }
        }
        gMain.advanceScriptContext = TRUE;
        if(gMain.preventUnlockFlag == 0)
        SlideTextbox(1);
        main->process[GAME_PROCESS_VAR1] = 3;
        main->process[GAME_PROCESS_VAR2] = 0;
        break;
    }
    return;
    _08010CA4:
    ChangeScriptSection(psycheLockData->invalidEvidencePresentedSection);
    SlideTextbox(1);
    _08010CB0:
    main->process[GAME_PROCESS_VAR1] = 3;
    return;
    _08010CB6:
    gMain.hpBarY = 100;
    switch(main->process[GAME_PROCESS_VAR2]) {
        case 0:
        gMain.advanceScriptContext = FALSE;
        FadeOutBGM(30);
        SetPsycheLockState(5, 0);
        main->process[GAME_PROCESS_VAR2]++;
        case 1:
        sub_800BC08(31);
        UpdatePsycheLockAnimation();
        if(!IsPsycheLockAnimationInWaitState())
        break;
        SetPsycheLockState(7, 0);
        if(gMain.hpBarValue < 80) {
            SetOrQueueHPBarState(1);
            gMain.hpBarDamageAmount = -40;
                SetOrQueueHPBarState(4);
            }
            main->process[GAME_PROCESS_VAR2]++;
            break;
        case 2:
        UpdatePsycheLockAnimation();
        InitSpecialEffects(4, 1, 1);
        if(!IsPsycheLockAnimationInWaitState())
        break;
        SetPsycheLockState(6, 0);
        main->process[GAME_PROCESS_VAR2]++;
        break;
        case 3:
        UpdatePsycheLockAnimation();
        sub_800BC08(0);
        if(!IsPsycheLockAnimationInWaitState())
        break;
        if(IsHPBarAnimating())
        break;
        SetOrQueueHPBarState(2);
        main->process[GAME_PROCESS_VAR2]++;
        break;
        case 4:
        investigation->selectedAction = 3;
        investigation->lastAction = 3;
        gMain.advanceScriptContext = 1;
        ReloadInvestigationGraphics();
        ClearInvestigationActionButtonOAM();
        psycheLockData->enabled = 0;
        SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
        gMain.hpBarY = 20;
    }
    return;
    _08010D9C:
    switch(main->process[GAME_PROCESS_VAR2]) {
        case 0:
        ChangeScriptSection(psycheLockData->cancelScriptSection);
        if(gScriptContext.textboxState == 1 || gScriptContext.textboxState == 4)
        SlideTextbox(1);
        main->process[GAME_PROCESS_VAR2]++;
        break;
        case 1:
        if(gScriptContext.flags & 8) {
            main->process[GAME_PROCESS_VAR2]++;
            FadeOutBGM(30);
            sub_800BC08(30);
            StartHardwareBlend(2, 4, 1, 0x1F);
        }
        break;
        case 2:
        if(main->blendMode)
            break;
        InitSpecialEffects(4, 1, 1);
        main->process[GAME_PROCESS_VAR2]++;
        break;
        case 3:
        SetPsycheLockState(7, 0);
        main->process[GAME_PROCESS_VAR2]++;
        case 4:
        UpdatePsycheLockAnimation();
        if(IsPsycheLockAnimationInWaitState()) {
            main->process[GAME_PROCESS_VAR2]++;
            break;
        }
        break;
        case 5:
        ReloadInvestigationGraphics();
        ClearInvestigationActionButtonOAM();
        gInvestigation.inPsycheLockChallengeFlag &= ~1;
        sub_8017154(3);
        SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
        if(psycheLockData->bgmToPlayAfterStop != 0xFFFF)
        PlayBGM(psycheLockData->bgmToPlayAfterStop);
        StartHardwareBlend(1, 1, 1, 0x1F);
        break;
    }
    return;
    _08010E54:
    switch(main->process[GAME_PROCESS_VAR2]) {
        case 0:
        gMain.advanceScriptContext = FALSE;
        investigation->inPsycheLockChallengeFlag |= 1;
        SlideTextbox(0);
        SetPsycheLockState(11, main->currentPsycheLockDataIndex);
        SetPsycheLockState(1, 0);
        main->process[GAME_PROCESS_VAR2]++;
        case 1:
        UpdatePsycheLockAnimation();
        if(IsPsycheLockAnimationInWaitState()) {
            main->process[GAME_PROCESS_VAR2]++;
            break;
        }
        break;
        case 2:
        gMain.advanceScriptContext = TRUE;
        SlideTextbox(1);
        RESTORE_PROCESS();
    }
    return;
    _08010EA6: // what the fuck
    return;
    _08010EAC:
    switch(main->process[GAME_PROCESS_VAR2]) {
        case 0:
        ChangeScriptSection(psycheLockData->noHPLeftScriptSection);
        if(gScriptContext.textboxState == 1 || gScriptContext.textboxState == 4)
        SlideTextbox(1);
        main->process[GAME_PROCESS_VAR2]++;
        break;
        case 1:
        if(gScriptContext.flags & 8) {
            main->process[GAME_PROCESS_VAR2]++;
            sub_800BC08(30);
            StartHardwareBlend(2, 1, 1, 0x1F);
        }
        break;
        case 2:
        if(main->blendMode == 0) {
            FadeOutBGM(30);
            main->process[GAME_PROCESS_VAR2]++;
        }
        break;
        case 3:
        InitSpecialEffects(4, 1, 1);
        SetPsycheLockState(7, 0);
        main->process[GAME_PROCESS_VAR2]++;
        case 4:
        UpdatePsycheLockAnimation();
        if(IsPsycheLockAnimationInWaitState()) {
            main->process[GAME_PROCESS_VAR2]++;
            break;
        }
        break;
        case 5:
        gMain.hpBarDisplayValue = 1;
        gMain.hpBarValue = 1;
        sub_8017154(3);
        ReloadInvestigationGraphics();
        ClearInvestigationActionButtonOAM();
        gInvestigation.inPsycheLockChallengeFlag &= ~1;
        SlideTextbox(0);
        SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_MAIN, 0, 0, main);
        if(psycheLockData->bgmToPlayAfterStop != 0xFFFF)
        PlayBGM(psycheLockData->bgmToPlayAfterStop);
        StartHardwareBlend(1, 1, 1, 0x1F);
        break;
    }
}

void ReloadInvestigationGraphics(void) {
    struct OamAttrs * oam;
    int i;

    DmaCopy16(3, gGfx4bppInvestigationActions, OBJ_VRAM0 + 0x2000, 0x1000);
    DmaCopy16(3, gPalActionButtons, OBJ_PLTT + 0xA0, 0x40);
    DmaCopy16(3, gGfx4bppInvestigationScrollButton, OBJ_VRAM0 + 0x3000, 0x200);
    DmaCopy16(3, gPalInvestigationScrollPrompt, OBJ_PLTT + 0xE0, 0x20);
    DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0 + 0x3200, 0x200);
    DmaCopy16(3, gPalExamineCursors, OBJ_PLTT + 0x100, 0x20);
    DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT + 0x120, 0x40);
    oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    for(i = 0; i < 4; i++) {
        oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(i * 60, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x100 + i * 0x20, 0, 5);
        oam++;
    }
}

void SetInvestigationStateToReturnAfterPsycheLocks(u16 arg0, u16 arg1) {
    struct OamAttrs * oam;
    u32 i;
    ReloadInvestigationGraphics();
    if(arg0 == 0) {
        gInvestigation.inPsycheLockChallengeFlag &= ~1;
        gInvestigation.selectedAction = 3;
        gInvestigation.lastAction = 3;
    } else if(arg0 == 1) {
        gInvestigation.inPsycheLockChallengeFlag &= ~1;
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
        for(i = 0; i < 4; i++) {
            oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(i * 60, FALSE, FALSE, 3);
            oam->attr2 = SPRITE_ATTR2(0x100 + i * 0x20, 0, 5);
            oam++;
        }
        SetInactiveActionButtons(&gInvestigation, 4);
        gInvestigation.inactiveActionButtonY = 208;
        gInvestigation.selectedActionYOffset = 0;
        gInvestigation.lastActionYOffset = 0;
        gInvestigation.selectedAction = 2;
        gInvestigation.lastAction = 2;
        gInvestigation.inPsycheLockChallengeFlag &= ~1;
        gInvestigation.actionState = 5;
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_TALK];
        oam->attr0 &= 0xFF00;
        oam->attr0 |= 240;
        oam->attr1 &= 0xFF00;
        oam->attr2 = SPRITE_ATTR2(0x140, 1, 6);
        gMain.process[GAME_PROCESS_STATE] = INVESTIGATION_TALK; // this has to only be in investigation otherwise ????
        gMain.process[GAME_PROCESS_VAR1] = 1;
        gInvestigation.previousSelectedOption = arg1;
        gIORegisters.lcd_bg1vofs = -77;
        if(gMain.psycheLockData[gMain.currentPsycheLockDataIndex].bgmToPlayAfterUnlock != 0xFFFF)
            PlayBGM(gMain.psycheLockData[gMain.currentPsycheLockDataIndex].bgmToPlayAfterUnlock);
    } else if(arg0 == 2) {
        gInvestigation.inPsycheLockChallengeFlag &= ~1;
        gInvestigation.selectedAction = 0;
        gInvestigation.lastAction = 0;
    } else if(arg0 == 3) {
        // what
    } else if(arg0 == 4) {
        gInvestigation.actionState = 2;
    }
}

void ClearInvestigationActionButtonOAM(void) {
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    u32 attr1;
    oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
    attr1 = oam->attr1 & 0xFE00;
    oam->attr1 = attr1;
    oam++;
    oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
    attr1 = oam->attr1 & 0xFE00;
    oam->attr1 = attr1 | 60;
    oam++;
    oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
    attr1 = oam->attr1 & 0xFE00;
    oam->attr1 = attr1 | 120;
    oam++;
    oam->attr0 = SPRITE_ATTR0(224, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
    attr1 = oam->attr1 & 0xFE00;
    oam->attr1 = attr1 | 180;
    oam++;
}

void UpdateInvestigationActionSprites(struct InvestigationStruct * investigation)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    u32 i;
    u32 y;

    if(!(investigation->inPsycheLockChallengeFlag & 1)) {
        switch(investigation->actionState)
        {
            case 0:
                for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
                {
                    if(investigation->selectedAction == i)
                    {
                        oam->attr0 = 0x4000;
                        y = investigation->selectedActionYOffset + 240;
                        y &= 0xFF;
                        oam->attr0 += y; 
                        oam->attr2 = i * 0x20 + 0x6500;
                    }
                    else if(investigation->lastAction == i)
                    {
                        oam->attr0 &= ~0xFF;
                        oam->attr0 |= investigation->inactiveActionButtonY;
                        oam->attr0 += investigation->lastActionYOffset;
                        oam->attr2 = i * 0x20 + 0x5500;
                    }
                    else if((investigation->inactiveActions >> i) & 1)
                    {
                        oam->attr0 &= ~0xFF;
                        oam->attr0 |= investigation->inactiveActionButtonY;
                        oam->attr2 = i * 0x20 + 0x5500;
                    }
                    else
                    {
                        oam->attr2 = i * 0x20 + 0x5500;
                    }
                    oam++;
                }
                gIORegisters.lcd_bg1vofs = -84;
                return;
            case 1:
                i = investigation->selectedAction; // ! variable re(ab)use
                oam += i;
                oam->attr2 = 0x6500 + i * 0x20;
                investigation->inactiveActionButtonY = 0xE0;
                investigation->actionState++;
                break;
            case 2:
                investigation->inactiveActionButtonY += 2;
                if(investigation->inactiveActionButtonY >= 0xF0)
                {
                    investigation->inactiveActionButtonY = 0xF0;
                    investigation->actionState = 0;
                }
                break;
            case 3:
                investigation->inactiveActionButtonY -= 2;
                if(investigation->inactiveActionButtonY <= 0xE0)
                {
                    investigation->inactiveActionButtonY = 0xE0;
                    investigation->actionState = 4;
                }
                break;
            case 4:
                break;
            case 5:
                investigation->inactiveActionButtonY = 0xF0;
                investigation->actionState = 4;
                return;
        }
        i = gMain.roomData[gMain.currentRoomId][0]; //! re(ab)use
        if(i != gMain.currentBG)
            investigation->selectedActionYOffset = 0x40;
        for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
        {
            if(investigation->inactiveActions >> i & 1)
            {
                oam->attr0 &= 0xFF00;
                oam->attr0 |= investigation->inactiveActionButtonY;
            }
            else if(investigation->selectedAction == i)
            {
                oam->attr0 &= 0xFF00;
                y = 0x100 - investigation->selectedActionYOffset;
                y &= 0xFF;
                oam->attr0 += y;
            }
            oam++;
        }
    }
}

void UpdateScrollPromptSprite(struct Main * main, u32 show)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS+3];
    u32 r6 = 0; // ! UNUSED, This is present in the assembly for this function somehow
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    if(show && gScriptContext.textboxState == 1 
    && GetBGControlBits(main->currentBG) & (BG_MODE_SIZE_480x160 | BG_MODE_SIZE_360x160))
    {
        if(gMain.Bg256_pos_x == 0) // ! inconsistent use of global vs pointer
        {
            oam->attr0 = 0x4020;
            oam->attr1 = 0x80D0;
            oam->attr2 = 0x7188;
        }
        else if(main->Bg256_pos_x == 240 || main->Bg256_pos_x == 120)
        {
            oam->attr0 = 0x4020;
            oam->attr1 = 0x8000;
            oam->attr2 = 0x7180;
        }
    }
}

u32 GetExaminedAreaSection(struct InvestigationStruct * investigation) // finger_pos_check
{
    struct Rect rect;
    u32 animId;
    struct ExaminationData * examData;
    if(investigation->pointerX < 120)
        rect.x = gMain.Bg256_pos_x + investigation->pointerX;
    else
        rect.x = gMain.Bg256_pos_x + investigation->pointerX + 12;
    rect.y = gMain.Bg256_pos_y + investigation->pointerY;
    rect.w = 4;
    rect.h = 16;
    if(gMain.scenarioIdx == 2) {
        if(gMain.currentRoomId == 3 && GetFlag(0, 0x13) == FALSE && GetFlag(0, 0xA) != FALSE)
            return 0x128;
    }
    else if (gMain.scenarioIdx == 4) {
        if(gMain.currentRoomId == 2)
            return 0xDF;
    }
    if (gMain.Bg256_pos_x != 0)
        rect.x -= 0xF0;
    animId = CheckRectCollisionWithAnim(&rect);
    for(examData = gExaminationData; examData->type != 0xFF; examData++) // Check for collision with animation
    {
        if(examData->type == 0xFE && animId == examData->animId)
            return examData->examinationSection;
    }
    if (gMain.Bg256_pos_x != 0)
        rect.x += 0xF0;
    for(examData = gExaminationData; examData->type != 0xFF; examData++) // Check for collision with area
    {
        if(examData->type == 0xFE)
            continue;
        if(CheckRectCollisionWithArea(&rect, &examData->area))
            return examData->examinationSection;
    }

    return 0x1E;
}

void LoadLocationChoiceGraphics(void)
{
    uintptr_t src;
    uintptr_t vram;
    u32 i;
    u8 *roomptr = gMain.roomData[gMain.currentRoomId];
    roomptr += 1;
    for(i = 0; i < 4; i++)
    {
        vram = VRAM+0x13400;
        vram += i*0x800;
        if(*roomptr != 0xFF)
	    {
            src = (uintptr_t)eGeneralScratchpadBuffer;
            LZ77UnCompWram(gUnknown_08026960[*roomptr], (u8*)src);
            DmaCopy16(3, src, vram, 0x800);
        }
        roomptr++;
        i++;i--; // fakematch
    }
}

void LoadTalkChoiceGraphics(void)
{
    u32 i;
    struct TalkData *talkdata;
    u8 *icons;
    for(talkdata = gTalkData; talkdata->roomId != 0xFF; talkdata++)
    {
        if(gMain.currentRoomId == talkdata->roomId)
	    {
            if(gAnimation[1].animationInfo.personId == talkdata->personId)
	        {
                if(talkdata->enableFlag == 1)
		            break;
            }
        }
    }
    icons = talkdata->iconId;
    for(i = 0; i < 4; i++)
    {
        uintptr_t src;
        uintptr_t destination = VRAM+0x13400;
        destination += i*0x800;
        if(*icons != 0xFF)
	    {
            src = (uintptr_t)eGeneralScratchpadBuffer;
            LZ77UnCompWram(gUnknown_08026810[*icons], (u8*)src);
            DmaCopy16(3, src, destination, 0x800);
        }
        icons++;
    }
    DmaCopy16(3, gGfxCheckmark, VRAM+0x15400, 0x200);
    DmaCopy16(3, gPalCheckmark, PLTT+0x360, 0x20);
}
