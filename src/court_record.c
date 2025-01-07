#include "global.h"
#include "background.h"
#include "court_record.h"
#include "case_data.h"
#include "graphics.h"
#include "main.h"
#include "sound.h"
// #include "court.h"
// #include "script.h"
// #include "investigation.h"
#include "animation.h"
// #include "psyche_lock.h"
// #include "save.h"
// #include "ewram.h"
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

//TODO: from hp_bar
void sub_8016E74(u32); // related to resetting of the bar?

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
    if(!gScriptContext.unk23) {
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
        sub_8016E74(6);
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
    gScriptContext.unkE = section;
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
            sub_8010720(0);
            sub_8010780(0);
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
