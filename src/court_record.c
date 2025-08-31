#include "global.h"
#include "background.h"
#include "court_record.h"
#include "case_data.h"
#include "graphics.h"
#include "main.h"
#include "sound.h"
#include "court.h"
// #include "script.h"
#include "investigation.h"
#include "animation.h"
#include "psyche_lock.h"
// #include "save.h"
// #include "ewram.h"
#include "hp_bar.h"
#include "constants/process.h"
#include "constants/songs.h"
// #include "constants/animation.h"
#include "constants/oam_allocations.h"

struct EvidenceProfileData
{
    /* +0x00 */ u8 * descriptionTiles;
    /* +0x04 */ u16 evidenceImageId;
    /* +0x06 */ u16 evidenceDetailId;
};
extern void (*gCourtRecordProcessStates[8])(struct Main *, struct CourtRecord *);
extern void (*gEvidenceAddedProcessStates[3])(struct Main *, struct CourtRecord *);
extern const struct EvidenceProfileData gEvidenceProfileData[];

void InitializeCourtRecordForScenario(struct Main * main, struct CourtRecord * courtRecord) // Status_init
{
    const u8 * recordIds;
    u32 i;

    for(i = 0; i < 32; i++)
        courtRecord->profileList[i] |= 0xFF;
    courtRecord->profileCount = 0;
    for(i = 0; i < 32; i++)
        courtRecord->evidenceList[i] |= 0xFF;
    courtRecord->evidenceCount = 0;
    recordIds = gCourtRecordInitialItemLists[main->scenarioIdx];
    for(i = 0; *recordIds != 0xFE; i++)
    {
        courtRecord->profileList[i] = *recordIds;
        courtRecord->profileCount++;
        recordIds++;
    }
    recordIds++;
    for(i = 0; *recordIds != 0xFF; i++)
    {
        courtRecord->evidenceList[i] = *recordIds;
        courtRecord->evidenceCount++;
        recordIds++;
    }
}

void CourtRecordProcess(struct Main * main) // Status
{
    if(!gScriptContext.textboxState) {
        gBG1MapBuffer[622] = 9;
        gBG1MapBuffer[623] = 9;
    }
    else {
        gBG1MapBuffer[622] = 0;
        gBG1MapBuffer[623] = 0;
    }
    gCourtRecordProcessStates[main->process[GAME_PROCESS_STATE]](main, &gCourtRecord);
}

void EvidenceAddedProcess(struct Main * main) // Note_add_disp
{
    gEvidenceAddedProcessStates[main->process[GAME_PROCESS_STATE]](main, &gCourtRecord);
}

void CourtRecordInit(struct Main * main, struct CourtRecord * courtRecord) // status_init
{
    u32 i;
    u32 temp;
    u16 * map;
    struct OamAttrs * oam;
    temp = gMain.currentlyPlayingLoopedSfx;
    StopSE(gMain.currentlyPlayingLoopedSfx);
    gMain.currentlyPlayingLoopedSfx = temp;
    map = gBG2MapBuffer; 
    for(i = 0; i < 0x400; i++, map++)
        *map = 0;
    if(main->processCopy[GAME_PROCESS] != QUESTIONING_PROCESS)
    {
        if(main->processCopy[GAME_PROCESS] == INVESTIGATION_PROCESS && main->processCopy[GAME_PROCESS_STATE] < INVESTIGATION_INSPECT)
        {
            oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
            for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
            {
                oam->attr2 = SPRITE_ATTR2(0x100+i*0x20, 1, 5);
                oam++;
            }
        }
    }
    if(main->processCopy[GAME_PROCESS] == TESTIMONY_PROCESS)
    {
        oam = &gOamObjects[OAM_IDX_ITESTIMONY_INDICATOR];
        oam->attr0 = SPRITE_ATTR0_CLEAR;
    }
    if(main->process[GAME_PROCESS_VAR2] == 2)
    {
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
        oam->attr2 = SPRITE_ATTR2(0x160, 1, 6);
    }
    if(main->process[GAME_PROCESS_VAR2] == 3)
    {
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        SetOrQueueHPBarState(6);
    }
    gIORegisters.lcd_dispcnt |= DISPCNT_BG2_ON;
    gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_WRAP | BGCNT_TXT256x256;
    main->tilemapUpdateBits |= 0x4;
    courtRecord->flags = 0;
    courtRecord->selectedItem = 0;
    courtRecord->selectedItemBackup = 0;
    courtRecord->displayItemCount = courtRecord->evidenceCount;
    courtRecord->displayItemList = courtRecord->evidenceList;
    LoadEvidenceWindowGraphics();
    LoadEvidenceGraphics(courtRecord->displayItemList[courtRecord->selectedItem]);
    if(main->process[GAME_PROCESS_VAR2] == 1)
        SlideInBG2Window(2, 0xC);
    courtRecord->nextState = RECORD_MAIN;
    main->process[GAME_PROCESS_STATE] = RECORD_CHANGE_STATE;
}

// causes off by 4???
void sub_800EBE8()
{
    u32 section = gScriptContext.currentSection;
    if(gMain.scenarioIdx < 2)
    {
        s32 rand = Random() & 3;
        switch(rand)
        {
            default:
            case 0:
                ChangeScriptSection(0x20);
                gScriptContext.slamDesk = TRUE;
                break;
            case 1:
                ChangeScriptSection(0x21);
                break;
            case 2:
                ChangeScriptSection(0x22);
                break;
            case 3:
                ChangeScriptSection(0x23);
                gScriptContext.slamDesk = TRUE;
                break;
        }
    }
    gScriptContext.nextSection = section;
}

u32 sub_800EC48()
{
    u8 * src;
    u32 * dst;
    struct AnimationListEntry * anim;
    if(gJoypad.pressedKeys & L_BUTTON)
    {
        if(gEvidenceProfileData[gCourtRecord.displayItemList[gCourtRecord.selectedItem]].evidenceDetailId)
        {
            PauseBGM();
            PlaySE(SE001_MENU_CONFIRM);
            gMain.process[GAME_PROCESS_STATE] = RECORD_DETAIL_SUBMENU;
            gMain.process[GAME_PROCESS_VAR1] = 0;
            UpdateRecordInfoActionSprites(0);
            UpdateRecordPresentActionSprites(0);
            anim = &gAnimation[1];
            if(anim->animationInfo.personId == 0xB || anim->animationInfo.personId == 0x21) {
                dst = gUnknown_0826FE38;
                src = gUnknown_08252498 + dst[1];
                dst = (u32*)(OBJ_PLTT+0x1A0);
                DmaCopy16(3, src, dst, 0x20);
                anim = sub_8016FB4();
                anim->flags &= ~(1<<24);
                anim->flags &= ~(1<<6);
                anim->flags &= ~(1<<7);
            }
            StartHardwareBlend(2, 1, 1, 0x1F);
            return 1;
        }
    }
    return 0;
}

void sub_800ED0C()
{
    struct OamAttrs * oam;
    PlaySE(SE00C_MENU_CHANGE_PAGE);
    gCourtRecord.nextState = RECORD_MAIN;
    gCourtRecord.flags |= 2;
    DmaCopy16(3, OBJ_VRAM0+0x3C00, VRAM+0x1400, 0x1C00);
    DmaCopy16(3, OBJ_PLTT+0x20, PLTT+0x20, 0x20);
    UpdateEvidenceSprites(&gCourtRecord);
    DmaCopy16(3, &gOamObjects[OAM_IDX_EVIDENCE_DISPLAY], OAM + OAM_IDX_EVIDENCE_DISPLAY*8, OAM_COUNT_EVIDENCE_DISPLAY*8);
    gMain.process[GAME_PROCESS_STATE] = RECORD_LOAD_GFX_CHANGE_STATE;
    if(gMain.process[GAME_PROCESS_VAR2] == 1)
    {
        if(gMain.processCopy[GAME_PROCESS] != INVESTIGATION_PROCESS)
            UpdateQuestioningMenuSprites(&gMain, &gTestimony, 0);
        oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS+2];
        if(!(gMain.gameStateFlags & 0x100))
        {
            oam->attr0 = SPRITE_ATTR0(0, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(186, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x190, 1, 5);
            oam++;
            oam->attr0 = SPRITE_ATTR0(0, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(218, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x198, 1, 5);
        }
        else
        {
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        }
    }
    UpdateBG2Window(&gCourtRecord);
    UpdateRecordSprites(&gCourtRecord);
}

u32 sub_800EE08()
{
    u32 section;
    u32 evidenceId;
    struct OamAttrs * oam;
    struct AnimationListEntry * anim;
    anim = &gAnimation[1];
    if(gMain.process[GAME_PROCESS_VAR2] != 2) {
        return 1;
    }
    evidenceId = gCourtRecord.displayItemList[gCourtRecord.selectedItem];
    if(evidenceId == 0x21 || evidenceId == 0x57) {
        if(GetPsycheLockDataIndexByRoomAndPerson(gMain.currentRoomId, anim->animationInfo.personId) < 0) {
            return 1;
        }
    }
    else {
        return 1;
    }
    gInvestigation.inPsycheLockChallengeFlag |= 1;
    oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    ClearEvidenceSprites(&gCourtRecord);
    UpdateRecordInfoActionSprites(0);
    UpdateRecordPresentActionSprites(0);
    oam = gOamObjects + OAM_IDX_LR_ARROW;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    SlideInBG2Window(4, 0x12);
    if(anim->animationInfo.xOrigin & 0xFF00) {
        if(GetBGControlBits(gMain.currentBG) & 0xF) {
            gMain.isBGScrolling = 1;
        }
        else {
            gMain.isBGScrolling = 0;
        }
        gMain.unk50 = 0;
        if(gMain.Bg256_pos_x == 0) {
            gMain.horizontolBGScrollSpeed = 8;
        }
        else if(gMain.Bg256_pos_x == 120 || gMain.Bg256_pos_x == 240) {
            gMain.horizontolBGScrollSpeed = -8;
        }
        gScriptContext.unk1E |= 0x40;
        sub_8017154(0);
        return 0;
    }
    FadeOutBGM(30);
    gCourtRecord.flags |= 8;
 
    SlideInBG2Window(4, 0x12);
    SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_TAKE_THAT_SPECIAL, 0, 0, (&gMain));
    sub_8017154(0);
    return 0;
}

u32 sub_800EF34()
{
    if(!(gJoypad.heldKeys & DPAD_RIGHT))
    {
        return 0;
    }
    SlideInBG2Window(1, 0xC);
    if(++gCourtRecord.selectedItem >= gCourtRecord.displayItemCount)
        gCourtRecord.selectedItem = 0;
    sub_800ED0C();
    return 1;
}

u32 sub_800EF78()
{
    if(!(gJoypad.heldKeys & DPAD_LEFT))
        return 0;
    SlideInBG2Window(2, 0xC);
    gCourtRecord.selectedItem--;
    if(gCourtRecord.selectedItem > gCourtRecord.displayItemCount)
        gCourtRecord.selectedItem = gCourtRecord.displayItemCount-1;
    sub_800ED0C();
}


u32 sub_800EFBC()
{
    u32 section;
    struct OamAttrs * oam;
    struct AnimationListEntry * anim;
    if(!(gJoypad.pressedKeys & A_BUTTON))
    {
        return 0;
    }
    if(!(sub_800EE08() << 24)) {
        return 1;
    }
    PlaySE(SE001_MENU_CONFIRM);
    if(gMain.process[GAME_PROCESS_VAR2] == 2) {
        section = GetEvidenceCommentSection(&gMain, gCourtRecord.displayItemList[gCourtRecord.selectedItem], gCourtRecord.flags & COURT_RECORD_VIEW_PROFILES);
        ChangeScriptSection(section);
        SlideTextbox(1);
    }
    ClearEvidenceSprites(&gCourtRecord);
    UpdateRecordInfoActionSprites(0);
    UpdateRecordPresentActionSprites(0);
    gIORegisters.lcd_dispcnt &= ~DISPCNT_BG2_ON;
    oam = gOamObjects + OAM_IDX_LR_ARROW;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    if(gMain.process[GAME_PROCESS_VAR2] == 3) {
        gInvestigation.actionState = 4;   
        SlideInBG2Window(4, 0x12);
        SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_TAKE_THAT_SPECIAL, 0, 0, (&gMain));
        gCourtRecord.flags |= 0x10;
        if(IsPresentedEvidenceValidForPsycheLock(&gMain.psycheLockData[gMain.currentPsycheLockDataIndex], gCourtRecord.displayItemList[gCourtRecord.selectedItem]) != -1) {
            SetOrQueueHPBarState(3);
            gMain.hpBarDamageAmount = 0;
            oam = gOamObjects + 50;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        }
        else {
            SetOrQueueHPBarState(8);
        }
        if(IsPresentedEvidenceValidForPsycheLock(&gMain.psycheLockData[gMain.currentPsycheLockDataIndex], gCourtRecord.displayItemList[gCourtRecord.selectedItem]) != -1) {
            StopBGM();
            return 1;
        }
        return 1;
    }
    gInvestigation.actionState = 3;
    gInvestigation.inactiveActions = 8;
    gInvestigation.inactiveActionButtonY = 0xF0;
    RESTORE_PROCESS_PTR((&gMain));

    return 1;
}
