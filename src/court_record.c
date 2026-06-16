#include "global.h"
#include "background.h"
#include "court_record.h"
#include "case_data.h"
#include "graphics.h"
#include "main.h"
#include "sound.h"
#include "court.h"
#include "script.h"
#include "investigation.h"
#include "animation.h"
#include "psyche_lock.h"
#include "hp_bar.h"
#include "save.h"
#include "ewram.h"
#include "constants/process.h"
#include "constants/songs.h"
#include "constants/animation.h"
#include "constants/oam_allocations.h"

struct EvidenceProfileData
{
    /* +0x00 */ u8 * descriptionTiles;
    /* +0x04 */ u16 evidenceImageId;
    /* +0x06 */ u16 evidenceDetailId;
};

const struct EvidenceProfileData gEvidenceProfileData[] = 
{
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 9,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08199444,
        .evidenceImageId = 10,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_0819984C,
        .evidenceImageId = 8,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08199CA0,
        .evidenceImageId = 12,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_0819A0FC,
        .evidenceImageId = 11,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_0819A55C,
        .evidenceImageId = 13,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_0819A970,
        .evidenceImageId = 0,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_0819AE04,
        .evidenceImageId = 1,
        .evidenceDetailId = 1,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 2,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 6,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 5,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 3,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 7,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 2,
        .evidenceDetailId = 3,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 3,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 4,
        .evidenceDetailId = 4,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 38,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 31,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 39,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 32,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 33,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 42,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 35,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 37,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 37,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 34,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 34,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 36,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 36,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 40,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 40,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 44,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 13,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 27,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 5,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 14,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 14,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 14,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 15,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 15,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 16,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 16,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 16,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 17,
        .evidenceDetailId = 6,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 19,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 19,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 20,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 28,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 7,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 18,
        .evidenceDetailId = 8,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 18,
        .evidenceDetailId = 8,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 21,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 21,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 22,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 22,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 22,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 9,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 23,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 24,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 43,
        .evidenceDetailId = 10,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 0,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 2,
        .evidenceDetailId = 11,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 2,
        .evidenceDetailId = 11,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 20,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 3,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 25,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 25,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 26,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 41,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 45,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 46,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 29,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 30,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 29,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 69,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 77,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 77,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 77,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 75,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 75,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 70,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 70,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 76,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 72,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 72,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 81,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 71,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 27,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 54,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 50,
        .evidenceDetailId = 13,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 50,
        .evidenceDetailId = 13,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 50,
        .evidenceDetailId = 13,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 51,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 52,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 68,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 68,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 68,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 55,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 78,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 56,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 0,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 14,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 57,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 60,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 12,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 79,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 59,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 58,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 56,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 61,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 80,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 80,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 63,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 64,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 65,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 65,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 65,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 3,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 74,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 66,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 62,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 82,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 73,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 53,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 48,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = gUnknown_08198FE4,
        .evidenceImageId = 49,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 88,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 0,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 86,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 11,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 87,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 42,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 89,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 89,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 13,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 0,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 16,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 3,
        .evidenceDetailId = 15,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 17,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 83,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 18,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 1,
        .evidenceDetailId = 18,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 84,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 84,
        .evidenceDetailId = 0,
    },
    {
        .descriptionTiles = NULL,
        .evidenceImageId = 85,
        .evidenceDetailId = 0,
    },
};

u8 *const gUnknown_08026E20[] = {
    gUnknown_0819B260,
    gUnknown_0819B500,
    gUnknown_0819B8A4,
    gUnknown_0819BDA0,
    NULL,
    gUnknown_0819C094,
    gUnknown_0819C590,
    gUnknown_0819C9F8,
    gUnknown_0819CE48,
    gUnknown_0819D384,
    gUnknown_0819D9F8,
    gUnknown_0819DF94,
    gUnknown_0819E560,
    gUnknown_0819EB70,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    gUnknown_0819EFE8,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

const u8 sCourtRecordLeftArrowTileIndexes[] = {0, 4, 8, 4};
const u8 sCourtRecordRightArrowTileIndexes[] = {12, 16, 20, 16};

void (*gCourtRecordProcessStates[8])(struct Main *, struct CourtRecord *) = {
    CourtRecordInit,
    CourtRecordMain,
    CourtRecordExit,
    CourtRecordChangeState,
    CourtRecordChangeRecord,
    CourtRecordDetailSubMenu,
    CourtRecordLoadGfxChangeState,
    CourtRecordTakeThatSpecial,
};
void (*gEvidenceAddedProcessStates[3])(struct Main *, struct CourtRecord *) = {
    EvidenceAddedInit,
    EvidenceAddedMain,
    EvidenceAddedExit,
};

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
    if(gScriptContext.textboxState == 0) {
        gBG1MapBuffer[622] = 9;
        gBG1MapBuffer[623] = 9;
    } else {
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
    //ClearHPBarOAM();
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

void sub_800EBE8(void)
{
    u16 tempSection;

    tempSection = gScriptContext.currentSection;
    if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1) {
        s32 rand = Random() & 3;
        switch (rand) {
        default:
        case 0:
            ChangeScriptSection(0x20);
            gScriptContext.slamDesk = 1;
            break;
        case 1:
            ChangeScriptSection(0x21);
            break;
        case 2:
            ChangeScriptSection(0x22);
            break;
        case 3:
            ChangeScriptSection(0x23);
            gScriptContext.slamDesk = 1;
            break;
        }
    }
    gScriptContext.nextSection = tempSection;
}

bool8 sub_800EC48(void)
{
    struct AnimationListEntry * anim;
    struct Joypad * joypad = &gJoypad;
    u16 * src;
    u16 * dst;

    if(joypad->pressedKeys & L_BUTTON)
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
            if ((anim->animationInfo.personId == 0xB) || (anim->animationInfo.personId == 0x21)) {
                dst = gUnknown_0826FE38;
                src = ((u32*)dst)[1] + gUnknown_08252498;
                dst = (void*)(OBJ_PLTT+0x1A0);
                DmaCopy16(3, src, dst, 0x20);
                anim = sub_8016FB4();
                anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
                anim->flags &= ~ANIM_0x40;
                anim->flags &= ~ANIM_0x80;
            }
            StartHardwareBlend(2, 1, 1, 0x1F);
            return TRUE;
        }
    }
    return FALSE;
}

void sub_800ED0C(void)
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

bool8 sub_800EE08(void)
{
    struct AnimationListEntry * personAnim;
    struct CourtRecord * courtRecord;
    struct OamAttrs * oam;
    struct Main * main;

    personAnim = &gAnimation[1];
    main = &gMain;
    if(main->process[GAME_PROCESS_VAR2] != 2)
        return TRUE;
    courtRecord = &gCourtRecord;
    if((courtRecord->displayItemList[courtRecord->selectedItem] != 0x21
     && courtRecord->displayItemList[courtRecord->selectedItem] != 0x57))
        return TRUE;
    if(GetPsycheLockDataIndexByRoomAndPerson(main->currentRoomId, personAnim->animationInfo.personId) < 0)
        return TRUE;
    gInvestigation.inPsycheLockChallengeFlag |= 1;
    oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    ClearEvidenceSprites(courtRecord);
    UpdateRecordInfoActionSprites(0);
    UpdateRecordPresentActionSprites(0);
    oam = gOamObjects + OAM_IDX_LR_ARROW;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    SlideInBG2Window(4, 0x12);
    if (personAnim->animationInfo.xOrigin & 0xFF00) {
        if ((GetBGControlBits(main->currentBG) & BG_MODE_SIZE_MASK) != BG_MODE_SIZE_240x160) {
            main->isBGScrolling = TRUE;
        } else {
            main->isBGScrolling = FALSE;
        }
        gMain.unk50 = 0;
        if(gMain.Bg256_pos_x == 0) {
            gMain.horizontolBGScrollSpeed = 8;
        } else if(gMain.Bg256_pos_x == 120 || gMain.Bg256_pos_x == 240) {
            gMain.horizontolBGScrollSpeed = -8;
        }
        gScriptContext.unk1E |= 0x40;
    } else {
        FadeOutBGM(30);
        courtRecord->flags |= 8;
        SlideInBG2Window(4, 0x12);
        SET_PROCESS_PTR(COURT_RECORD_PROCESS, RECORD_TAKE_THAT_SPECIAL, 0, 0, main);
    }
    sub_8017154(0);
    return FALSE;
}

bool8 sub_800EF34(void)
{
    if (!(gJoypad.heldKeys & DPAD_RIGHT)) {
        return FALSE;
    }
    SlideInBG2Window(1, 0xC);
    gCourtRecord.selectedItem++;
    if(gCourtRecord.selectedItem >= gCourtRecord.displayItemCount)
        gCourtRecord.selectedItem = 0;
    sub_800ED0C();
    return TRUE;
}

bool8 sub_800EF78(void)
{
    if (!(gJoypad.heldKeys & DPAD_LEFT)) {
        return FALSE;
    }
    SlideInBG2Window(2, 0xC);
    gCourtRecord.selectedItem--;
    if(gCourtRecord.selectedItem > gCourtRecord.displayItemCount)
        gCourtRecord.selectedItem = gCourtRecord.displayItemCount-1;
    sub_800ED0C();
    //return TRUE;
}


bool8 sub_800EFBC(void)
{
    struct OamAttrs * oam;
    if (!(gJoypad.pressedKeys & A_BUTTON)) {
        return FALSE;
    }
    if (sub_800EE08()) {
        PlaySE(SE001_MENU_CONFIRM);
        if (gMain.process[GAME_PROCESS_VAR2] == 2) {
            ChangeScriptSection(GetEvidenceCommentSection(&gMain, gCourtRecord.displayItemList[gCourtRecord.selectedItem], 1 & gCourtRecord.flags));
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
        if (gMain.process[3] == 3) {
            gInvestigation.actionState = 4;   
            SlideInBG2Window(4, 0x12);
            SET_PROCESS(COURT_RECORD_PROCESS, RECORD_TAKE_THAT_SPECIAL, 0, 0);
            gCourtRecord.flags |= 0x10;
            if (IsPresentedEvidenceValidForPsycheLock(&gMain.psycheLockData[gMain.currentPsycheLockDataIndex], gCourtRecord.displayItemList[gCourtRecord.selectedItem]) != -1) {
                SetOrQueueHPBarState(3);
                gMain.hpBarDamageAmount = 0;
                oam = gOamObjects + 50;
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                oam++;
                oam->attr0 = SPRITE_ATTR0_CLEAR;
            } else {
                SetOrQueueHPBarState(8);
            }
            if (IsPresentedEvidenceValidForPsycheLock(&gMain.psycheLockData[gMain.currentPsycheLockDataIndex], gCourtRecord.displayItemList[gCourtRecord.selectedItem]) != -1) {
                StopBGM();
            }
        } else {
            gInvestigation.actionState = 3;
            gInvestigation.inactiveActions = 8;
            gInvestigation.inactiveActionButtonY = 0xF0;
            RESTORE_PROCESS();
        }
    }
    return TRUE;
}

bool8 sub_800F120(void)
{
    struct OamAttrs * oam;
    u8 section; // ! holy crap this is dumb. sections can be and are above 0xFF in ID
    if (!(gJoypad.pressedKeys & A_BUTTON)) {
        return FALSE;
    }
    if ((gMain.gameStateFlags & 0x100) == 0 && (gMain.currentBG != 3)) {
        ChangeAnimationActivity(&gAnimation[1], 1);
        gMain.previousBG = gMain.currentBG;
        gMain.currentBG = 3;
        gMain.currentBgStripe = 1;
        gMain.unk258 = 0;
        gScriptContext.unk40 = 0x80;
    }
    SlideInBG2Window(3, 0xC);
    oam = gOamObjects + OAM_IDX_LR_ARROW;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    section = GetQuestioningPresentedSection(gScriptContext.currentSection, gCourtRecord.displayItemList[gCourtRecord.selectedItem]);
    if (sub_8016ED8() != 0) {
        if (section) {
            SetOrQueueHPBarState(3);
            gMain.hpBarDamageAmount = 0;
        } else {
            SetOrQueueHPBarState(8);
        }
    }
    if (gMain.gameStateFlags & 0x200) {
        SlideInBG2Window(4, 0x12);
        SET_PROCESS(COURT_RECORD_PROCESS, RECORD_TAKE_THAT_SPECIAL, 0, 0);
    } else {
        if (gMain.gameStateFlags & 0x100) {
            PlayAnimation(ANIM_TAKETHAT_LEFT);
            if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1 || gMain.scenarioIdx == 12 || gMain.scenarioIdx == 13) {
                PlaySE(0x173);
            } else if (gMain.scenarioIdx == 0x14) {
                PlaySE(0x170);
            } else {
                PlaySE(SE00D_VOICE_PHOENIX_TAKE_THAT_JP);
            }
        } else {
            PlayAnimation(ANIM_OBJECTION_LEFT);
            if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1 || gMain.scenarioIdx == 12 || gMain.scenarioIdx == 13) {
                PlaySE(0x171);
            } else if (gMain.scenarioIdx == 0x14) {
                PlaySE(0x51);
            } else {
                PlaySE(SE027_VOICE_PHOENIX_OBJECTION_JP);
            }
        }
        StartHardwareBlend(3, 1, 8, 0x1F);
        gTestimony.timer = 0xA;
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
        gMain.advanceScriptContext = FALSE;
        gMain.showTextboxCharacters = FALSE;
        gMain.shakeTimer = 30;
        gMain.shakeIntensity = 1;
        gMain.gameStateFlags |= 1;
        section = GetQuestioningPresentedSection(gScriptContext.currentSection, gCourtRecord.displayItemList[gCourtRecord.selectedItem]);
        if (section != 0) {
            if (sub_8016ED8()) {
                SetOrQueueHPBarState(3);
                gMain.hpBarDamageAmount = 0;
            }
            StopBGM();
            ChangeScriptSection(section);
            SET_PROCESS_BACKUP(COURT_PROCESS, COURT_MAIN, 0, 0);
        } else {
            if (sub_8016ED8()) {
                SetOrQueueHPBarState(8);
            }
            if (gScriptContext.flags & 0x10) {
                sub_800EBE8();
            } else {
                sub_800EBE8();
            }
            gScriptContext.flags &= ~0x10;
            SET_PROCESS_BACKUP(QUESTIONING_PROCESS, QUESTIONING_MAIN, 0, 0);
        }
        SET_PROCESS(QUESTIONING_PROCESS, QUESTIONING_OBJECTION, 0, 0);
    }
    SetTextboxNametag(0, 0);
    UpdateBG2Window(&gCourtRecord);
    UpdateRecordSprites(&gCourtRecord);
    UpdateRecordPresentActionSprites(0);
    if (!(gMain.gameStateFlags & 0x300) || (gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS)) {
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG2_ON;
        ClearEvidenceSprites(&gCourtRecord);
        UpdateRecordInfoActionSprites(0);
    }
    gMain.gameStateFlags &= ~0x300;
    gScriptContext.unk10 = 0;
    return TRUE;
}

void CourtRecordMain(struct Main * main, struct CourtRecord * courtRecord)
{
    if (gScriptContext.unk1E & 0x40) {
        if (main->isBGScrolling == FALSE) {
            gScriptContext.unk1E &= ~0x40;
            FadeOutBGM(30);
            gCourtRecord.flags |= 8;
            SET_PROCESS(COURT_RECORD_PROCESS, RECORD_TAKE_THAT_SPECIAL, 0, 0);
            return;
        }
        UpdateBG2Window(&gCourtRecord);
        UpdateRecordSprites(&gCourtRecord);
        return;
    }
    if (sub_800EC48() == 0
     && ((courtRecord->displayItemCount <= 1) || ((sub_800EF34() == 0) && (sub_800EF78() == 0)))) {
        if (gJoypad.pressedKeys & 0x100) {
            PlaySE(0x34);
            SlideInBG2Window(3, 0xC);
            courtRecord->nextState = RECORD_CHANGE_RECORD;
            main->process[GAME_PROCESS_STATE] = RECORD_CHANGE_RECORD;
            return;
        }
        if (main->process[GAME_PROCESS_VAR2] == 1) {
            if (sub_800F120())
                return;
            if (main->gameStateFlags & 0x100) {
                UpdateBG2Window(&gCourtRecord);
                UpdateRecordSprites(&gCourtRecord);
                return;
            }
        } else  if (main->process[GAME_PROCESS_VAR2] == 2 || main->process[GAME_PROCESS_VAR2] == 3) {
            if(sub_800EFBC())
                return;
        }
        if (gJoypad.pressedKeys & B_BUTTON) {
            PlaySE(0x2C);
            SlideInBG2Window(3, 0xC);
            if ((main->process[GAME_PROCESS_VAR2] != 2 && main->process[GAME_PROCESS_VAR2] != 3) && (gScriptContext.flags & 8)) {
                gMain.hpBarDamageAmount = 0;
            }
            if (main->process[GAME_PROCESS_VAR2] == 2) {
                SET_PROCESS_BACKUP_PTR(INVESTIGATION_PROCESS, INVESTIGATION_PRESENT, 3, 0, main);
            }
            if (main->process[GAME_PROCESS_VAR2] == 3) {
                SET_PROCESS_BACKUP_PTR(INVESTIGATION_PROCESS, INVESTIGATION_10, 6, 0, main);
            }
            if (sub_8016ED8() != 0) {
                SetOrQueueHPBarState(8);
            }
            main->process[GAME_PROCESS_STATE] = RECORD_EXIT;
        }
        UpdateBG2Window(&gCourtRecord);
        UpdateRecordSprites(&gCourtRecord);
    }
}

void CourtRecordExit(struct Main * main, struct CourtRecord * courtRecord) // status_exit
{
    struct OamAttrs * oam;
    if(main->process[GAME_PROCESS_VAR2] == 2 && courtRecord->windowTileX > 8)
    {
        u16 attr1;
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
        attr1 = oam->attr1 & ~0x1FF;
        oam->attr1 += 12;
        oam->attr1 &= 0x1FF;
        if(oam->attr1 >= 0xB4)
            oam->attr1 = 0xB4;
        oam->attr1 |= attr1;
    }
    if(main->process[GAME_PROCESS_VAR2] == 3 && courtRecord->windowTileX > 8)
    {
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
        oam->attr0 = SPRITE_ATTR0_CLEAR;
    }
    UpdateBG2Window(courtRecord);
    UpdateRecordSprites(courtRecord);
    if(courtRecord->windowScrollSpeed == 0)
    {
        courtRecord->flags |= 4;
        courtRecord->flags &= ~2;
        if(main->process[GAME_PROCESS_VAR2] == 0 && !(gScriptContext.flags & SCRIPT_FULLSCREEN))
        {
            gBG1MapBuffer[622] = 0x20;
            gBG1MapBuffer[623] = 0x21;
        }
        RESTORE_PROCESS_PTR(main);
        if(gMain.currentlyPlayingLoopedSfx)
            PlaySE(gMain.currentlyPlayingLoopedSfx);
    }
}

void CourtRecordChangeState(struct Main * main, struct CourtRecord * courtRecord) // status_wait
{
    struct OamAttrs * oam;
    if(main->process[GAME_PROCESS_VAR2] == 2 && courtRecord->windowTileX > 8)
    {
        u16 attr1;
        oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTION_PRESENT];
        attr1 = oam->attr1 & ~0x1FF;
        oam->attr1 -= 12;
        oam->attr1 &= 0x1FF;
        if(oam->attr1 >= 0x100) // what the fuck
            oam->attr1 = 0;
        oam->attr1 |= attr1;
    }
    UpdateBG2Window(courtRecord);
    UpdateRecordSprites(courtRecord);
    if(courtRecord->windowScrollSpeed == 0)
    {
        courtRecord->flags |= 4;
        courtRecord->flags &= ~2;
        main->process[GAME_PROCESS_STATE] = courtRecord->nextState;
    }
}

void CourtRecordChangeRecord(struct Main * main, struct CourtRecord * courtRecord) // status_menu_change
{
    UpdateBG2Window(courtRecord);
    UpdateRecordSprites(courtRecord);
    if(courtRecord->windowScrollSpeed == 0)
    {
        u32 temp;
        courtRecord->flags &= ~2;
        SlideInBG2Window(2, 0xC);
        courtRecord->nextState = RECORD_MAIN;
        main->process[GAME_PROCESS_STATE] = RECORD_CHANGE_STATE;
        temp = courtRecord->selectedItem;
        courtRecord->selectedItem = courtRecord->selectedItemBackup;
        courtRecord->selectedItemBackup = temp;
        if(courtRecord->flags & COURT_RECORD_VIEW_PROFILES)
        {
            courtRecord->flags &= ~COURT_RECORD_VIEW_PROFILES;
            DmaCopy16(3, gGfx4bppProfileTextTiles, OBJ_VRAM0+0x3500, TILE_SIZE_4BPP*16);
            courtRecord->displayItemCount = courtRecord->evidenceCount;
            courtRecord->displayItemList = courtRecord->evidenceList;
        }
        else
        {
            courtRecord->flags |= COURT_RECORD_VIEW_PROFILES;
            DmaCopy16(3, gGfxEvidenceText, OBJ_VRAM0+0x3500, 0x200);
            courtRecord->displayItemCount = courtRecord->profileCount;
            courtRecord->displayItemList = courtRecord->profileList;
        }

        LoadEvidenceGraphics(courtRecord->displayItemList[courtRecord->selectedItem]);
    }
}

void CourtRecordDetailSubMenu(struct Main * main, struct CourtRecord * courtRecord) // status_exception ?
{
    struct AnimationListEntry * anim;
    u32 evidenceId;
    u32 i;
    u32 * src;
    u32 * dst;
    if(main->gameStateFlags & 1)
    {
        gIORegisters.lcd_bg3vofs = 8;
        gIORegisters.lcd_bg3hofs = 8;
        gIORegisters.lcd_bg1vofs = 0;
        gIORegisters.lcd_bg1hofs = 0;
    }
    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
        {
            struct OamAttrs * oam;
            u32 i;
            
            if(main->blendMode != 0)
                break;
            if(gMain.processCopy[GAME_PROCESS] == INVESTIGATION_PROCESS
            && gMain.processCopy[GAME_PROCESS_STATE] == INVESTIGATION_10) {
                if(gMain.psycheLockShownByScriptFlag != 2 && gMain.currentDisplayBG == 0x80) {
                    SetPsycheLockState(8, 0);
                    UpdatePsycheLockAnimation();
                    ClearPsycheLockStopPresentButtonsOAM();
                }
            } else {
                if(gMain.psycheLockShownByScriptFlag == 1){
                    ClearPsycheLockLocksAndChainsWithoutAnimating();
                }
            }
            courtRecord->fullScreenPage = 0;
            evidenceId = courtRecord->displayItemList[courtRecord->selectedItem];
            DmaCopy16(3, &gMain, &gSaveDataBuffer.main, sizeof(struct Main));
            switch(gEvidenceProfileData[evidenceId].evidenceDetailId)
            {
                case 0:
                    break;
                case 1:
                    main->currentBG = 0x2D;
                    break;
                case 2:
                    main->currentBG = 0x2E;
                    break;
                case 3:
                    main->currentBG = 0x31;
                    break;
                case 4:
                    main->currentBG = 0x32;
                    break;
                case 5:
                    main->currentBG = 0x34;
                    break;
                case 6:
                    main->currentBG = 0x4A;
                    break;
                case 7:
                    main->currentBG = 0x39;
                    break;
                case 8:
                    main->currentBG = 0x4B;
                    break;
                case 9:
                    main->currentBG = 0x3A;
                    break;
                case 10:
                    main->currentBG = 0x4C;
                    break;
                case 11:
                    main->currentBG = 0x43;
                    break;
                case 12:
                    main->currentBG = 0x50;
                    break;
                case 13:
                    main->currentBG = 0x54;
                    break;
                case 14:
                    main->currentBG = 0x56;
                    break;
                case 15:
                    main->currentBG = 0x64;
                    break;
                case 16:
                    main->currentBG = 0x65;
                    break;
                case 17:
                    main->currentBG = 0x66;
                    break;
                case 18:
                    main->currentBG = 0x67;
                    break;
                default: 
                    break;
            }
            DecompressBackgroundIntoBuffer(main->currentBG);
            DmaCopy16(3, gOamObjects, gSaveDataBuffer.oam, sizeof(gOamObjects));
            DmaCopy16(3, gMapMarker, gSaveDataBuffer.mapMarker, sizeof(gMapMarker));
            for(i = 0; i < 8; i++)
                gMapMarker[i].id |= 0xFF;
            if(main->processCopy[GAME_PROCESS] == INVESTIGATION_PROCESS)
            {
                oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
                for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
                {
                    oam->attr0 &= ~0x300;
                    oam->attr0 |= (ST_OAM_AFFINE_ERASE << 8);
                    oam++;
                }
            }
            else if(main->processCopy[GAME_PROCESS] == TESTIMONY_PROCESS)
            {
                oam = &gOamObjects[OAM_IDX_ITESTIMONY_INDICATOR];
                oam->attr0 = SPRITE_ATTR0_CLEAR;
            }
            else if(main->processCopy[GAME_PROCESS] == QUESTIONING_PROCESS)
            {
                oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS+2];
                oam->attr0 &= ~0x300;
                oam->attr0 |= (ST_OAM_AFFINE_ERASE << 8);
                oam++;
                oam->attr0 &= ~0x300;
                oam->attr0 |= (ST_OAM_AFFINE_ERASE << 8);
                oam = &gOamObjects[72];
                oam->attr0 |= (ST_OAM_AFFINE_ERASE << 8);
                oam++;
                oam->attr0 |= (ST_OAM_AFFINE_ERASE << 8);
            }
            if(gScriptContext.flags & SCRIPT_SPOTSELECT_SELECTION_MADE)
            {
                oam = &gOamObjects[OAM_IDX_GENERAL_2+1];
                oam->attr0 = SPRITE_ATTR0_CLEAR;
            }
            gSaveDataBuffer.main.showTextboxCharacters = main->showTextboxCharacters;
            gSaveDataBuffer.main.advanceScriptContext = main->advanceScriptContext;
            main->showTextboxCharacters = FALSE;
            main->advanceScriptContext = FALSE;
            gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
            gIORegisters.lcd_dispcnt &= ~DISPCNT_BG2_ON;
            main->animationFlags &= ~(2 | 1);
            ClearEvidenceSprites(courtRecord);
            UpdateRecordInfoActionSprites(0);
            UpdateEvidenceDetailActionSprites(1);
            oam = gOamObjects + OAM_IDX_LR_ARROW;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            for(i = 0; i < 32; i++) {
                gOamObjects[i].attr0 = SPRITE_ATTR0_CLEAR;
            }
            for(i = 0; i < 32; i++) {
                gOamObjects[OAM_IDX_TEXT_FULLSCREEN+i].attr0 = SPRITE_ATTR0_CLEAR;
            }
            if((gAnimation[1].animationInfo.personId == 11 || gAnimation[1].animationInfo.personId == 33) && (gScriptContext.flags & SCRIPT_FULLSCREEN))
            {
                for(i = 0; i < 31; i++) {
                    gOamObjects[48+i].attr0 = SPRITE_ATTR0_CLEAR;
                }
            }
            main->process[GAME_PROCESS_VAR1]++;
            break;
        }
        case 1:
            CopyBGDataToVram(main->currentBG);
            StartHardwareBlend(1, 1, 2, 0x1F);
            main->process[GAME_PROCESS_VAR1]++;
            break;
        case 2:
            if(main->blendMode != 0)
                break;
            if(gJoypad.pressedKeys & (L_BUTTON | B_BUTTON))
            {
                PlaySE(SE002_MENU_CANCEL);
                StartHardwareBlend(2, 1, 1, 0x1F);
                main->process[GAME_PROCESS_VAR1]++;
            }
            else if(gJoypad.pressedKeys & (DPAD_DOWN | A_BUTTON))
            {
                evidenceId = courtRecord->displayItemList[courtRecord->selectedItem];
                if(gEvidenceProfileData[evidenceId].evidenceDetailId == 4)
                {
                    PlaySE(SE001_MENU_CONFIRM);
                    courtRecord->fullScreenPage++;
                    if(courtRecord->fullScreenPage > 1)
                        courtRecord->fullScreenPage = 0;
                    StartHardwareBlend(2, 1, 2, 0x1F);
                    main->process[GAME_PROCESS_VAR1] = 6;
                }
            }
            else if(gJoypad.pressedKeys & (DPAD_UP | A_BUTTON)) {
                evidenceId = courtRecord->displayItemList[courtRecord->selectedItem];
                if(gEvidenceProfileData[evidenceId].evidenceDetailId == 4)
                {
                    PlaySE(SE001_MENU_CONFIRM);
                    courtRecord->fullScreenPage--;
                    if(courtRecord->fullScreenPage == 0xFF)
                        courtRecord->fullScreenPage = 1;
                    StartHardwareBlend(2, 1, 2, 0x1F);
                    main->process[GAME_PROCESS_VAR1] = 6;
                }
            }
            break;
        case 3:
        {
            u32 i;
            if(main->blendMode != 0)
                break;
            main->currentBG = gSaveDataBuffer.main.currentBG;
            main->previousBG = gSaveDataBuffer.main.previousBG;
            main->currentBgStripe = gSaveDataBuffer.main.currentBgStripe;
            main->unk3D = gSaveDataBuffer.main.unk3D;
            main->isBGScrolling = gSaveDataBuffer.main.isBGScrolling;
            main->Bg256_stop_line = gSaveDataBuffer.main.Bg256_stop_line;
            main->Bg256_scroll_x = gSaveDataBuffer.main.Bg256_scroll_x;
            main->Bg256_scroll_y = gSaveDataBuffer.main.Bg256_scroll_y;
            main->Bg256_pos_x = gSaveDataBuffer.main.Bg256_pos_x;
            main->Bg256_pos_y = gSaveDataBuffer.main.Bg256_pos_y;
            main->unused48 = gSaveDataBuffer.main.unused48;
            main->Bg256_dir = gSaveDataBuffer.main.Bg256_dir;
            main->horizontolBGScrollSpeed = gSaveDataBuffer.main.horizontolBGScrollSpeed;
            main->verticalBGScrollSpeed = gSaveDataBuffer.main.verticalBGScrollSpeed;
            main->Bg256_next_line = gSaveDataBuffer.main.Bg256_next_line;
            main->Bg256_buff_pos = gSaveDataBuffer.main.Bg256_buff_pos;
            main->bgStripeDestPtr = gSaveDataBuffer.main.bgStripeDestPtr;
            for(i = 0; i < 12; i++)
            {
                main->bgStripeOffsets[i] = gSaveDataBuffer.main.bgStripeOffsets[i];
            }
            DecompressBackgroundIntoBuffer(main->currentBG);
            CopyBGDataToVramAndScrollBG(main->currentBG);
            main->showTextboxCharacters = gSaveDataBuffer.main.showTextboxCharacters;
            main->advanceScriptContext = gSaveDataBuffer.main.advanceScriptContext;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG2_ON;
            DmaCopy16(3, gSaveDataBuffer.oam, gOamObjects, sizeof(gOamObjects));
            DmaCopy16(3, gSaveDataBuffer.mapMarker, gMapMarker, sizeof(gMapMarker));
            MakeMapMarkerSprites();
            if(main->processCopy[GAME_PROCESS] == TESTIMONY_PROCESS)
                gTestimony.timer = 0;
            main->animationFlags |= (2 | 1);
            anim = &gAnimation[1];
            if ((anim->animationInfo.personId == 0xB) || (anim->animationInfo.personId == 0x21)) {
                dst = gUnknown_0826FE38;
                src = ((u32*)dst)[1] + gUnknown_08252498;
                dst = (u32*)(OBJ_PLTT+0x1A0);
                DmaCopy16(3, src, dst, 0x20);
                anim = sub_8016FB4();
                anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
                anim->flags &= ~ANIM_0x40;
                anim->flags &= ~ANIM_0x80;
                anim->flags &= ~ANIM_BLEND_ACTIVE;
            }
            UpdateBG2Window(&gCourtRecord);
            UpdateRecordSprites(&gCourtRecord);
            main->process[GAME_PROCESS_VAR1]++;
            break;
        }
        case 4: {
            CopyBGDataToVramAndScrollBG(main->currentBG);
            if(gMain.currentCourtroomScene & 0xF) {
                switch(gMain.currentCourtroomScene >> 4) {
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
                        SetOAMForCourtBenchSpritesProsecution(0x20, 0x80, 1);
                }
            }
            if(gMain.processCopy[GAME_PROCESS] == INVESTIGATION_PROCESS
            && gMain.processCopy[GAME_PROCESS_STATE] == INVESTIGATION_10) {
                if(gMain.psycheLockShownByScriptFlag != 2) {
                    SetPsycheLockState(9, 0);
                    UpdatePsycheLockAnimation();
                }
                SetPsycheLockPresentButtonOAMInCourtRecord();
            } else {
                if(gMain.psycheLockShownByScriptFlag == 1) {
                    ShowPsycheLockLocksAndChainsWithoutAnimating(gMain.currentPsycheLockDataIndex);
                }
            }
            StartHardwareBlend(1, 1, 2, 0x1F);
            main->process[GAME_PROCESS_VAR1]++;
            break;
        }
        case 5:
        {
            if(main->blendMode == 0)
            {
                UnpauseBGM();
                main->process[GAME_PROCESS_STATE] = RECORD_MAIN;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            UpdateBG2Window(&gCourtRecord);
            UpdateRecordSprites(&gCourtRecord);
            break;
        }
        case 6:
        {
            if(main->blendMode != 0)
                break;
            evidenceId = courtRecord->displayItemList[courtRecord->selectedItem];
            if(gEvidenceProfileData[evidenceId].evidenceDetailId == 4)
            {
                switch(courtRecord->fullScreenPage)
                {
                    case 0:
                        main->currentBG = 0x32;
                        break;
                    case 1:
                        main->currentBG = 0x33;
                        break;
                }
            }
            DecompressBackgroundIntoBuffer(main->currentBG);
            CopyBGDataToVram(main->currentBG);
            StartHardwareBlend(1, 1, 2, 0x1F);
            main->process[GAME_PROCESS_VAR1] = 1;
            break;
        }
        default:
            break;
    }
}

void CourtRecordLoadGfxChangeState(struct Main * main, struct CourtRecord * courtRecord) // status_melt ?
{
    LoadEvidenceGraphics(courtRecord->displayItemList[courtRecord->selectedItem]);
    main->process[GAME_PROCESS_STATE] = RECORD_CHANGE_STATE;
}

void CourtRecordTakeThatSpecial(struct Main * main, struct CourtRecord * courtRecord) // status_effect ?
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_TAKE_THAT_EVIDENCE_THROW];
    struct AnimationListEntry * anim = &gAnimation[1];
    u32 section;
    u32 temp2;
    u32 temp;
    u8 * ptr;

    switch(main->process[GAME_PROCESS_VAR1])
    {
        case 0:
            main->affineScale = 0;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            if(courtRecord->windowScrollSpeed == 0)
            {
                PlayAnimation(ANIM_TAKETHAT_LEFT);
                if (gMain.scenarioIdx == 0 || gMain.scenarioIdx == 1 || gMain.scenarioIdx == 12 || gMain.scenarioIdx == 13) {
                    PlaySE(0x173);
                } else if (gMain.scenarioIdx == 0x14) {
                    PlaySE(0x170);
                } else {
                    PlaySE(SE00D_VOICE_PHOENIX_TAKE_THAT_JP);
                }
                gTestimony.timer = 6;
                temp2 = courtRecord->displayItemList[courtRecord->selectedItem];
                /*
                if(courtRecord->flags & 0x20) {
                    temp2 = 6;
                }
                */
                ptr = eGeneralScratchpadBuffer;
                LZ77UnCompWram(gUnknown_08026E20[gEvidenceProfileData[temp2].evidenceImageId], ptr);
                DmaCopy16(3, ptr, OBJ_PLTT+0x20, 0x20);
                DmaCopy16(3, ptr+0x20, OBJ_VRAM0+0x1000, TILE_SIZE_4BPP * 64);
                oam->attr0 = SPRITE_ATTR0(16, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(88, FALSE, FALSE, 3);
                oam->attr2 = SPRITE_ATTR2(0x80, 0, 1);
                main->itemPlateRotation = 0;
                main->affineScale = 0x100;
                gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
                main->advanceScriptContext = FALSE;
                main->showTextboxCharacters = FALSE;
                main->process[GAME_PROCESS_VAR1]++;
                main->process[GAME_PROCESS_VAR2] = 0;
            }
            break;
        case 1:
        case 2:
            if(main->process[GAME_PROCESS_VAR2] >= 8)
            {
                StartHardwareBlend(3, 1, 8, 0x1F);
                main->process[GAME_PROCESS_VAR1]++;
                main->process[GAME_PROCESS_VAR2] = 0;
            }
            else
                main->process[GAME_PROCESS_VAR2]++;
            break;
        case 3:
            if(main->process[GAME_PROCESS_VAR2] >= 38)
            {
                if(courtRecord->flags & 8) {
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                    courtRecord->flags &= ~8;
                    main->currentPsycheLockDataIndex = GetPsycheLockDataIndexByRoomAndPerson(main->currentRoomId, anim->animationInfo.personId);
                    SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_10, 0, 0, main);
                    return;
                }
                if(courtRecord->flags & 0x10) {
                    s32 answer;
                    courtRecord->flags &= ~0x10;
                    gMain.psycheLockStopPresentButtonsActive = 0;
                    answer = IsPresentedEvidenceValidForPsycheLock(&main->psycheLockData[main->currentPsycheLockDataIndex], courtRecord->displayItemList[courtRecord->selectedItem]);
                    if(answer >= 0) {
                        main->psycheLockData[main->currentPsycheLockDataIndex].validEvidencePresentedSection = main->psycheLockData[main->currentPsycheLockDataIndex].validEvidenceScriptSections[answer];
                        ChangeScriptSection(main->psycheLockData[main->currentPsycheLockDataIndex].validEvidencePresentedSection);
                    } else {
                        ChangeScriptSection(main->psycheLockData[main->currentPsycheLockDataIndex].invalidEvidencePresentedSection);
                    }
                    SlideTextbox(1);
                    SET_PROCESS_PTR(INVESTIGATION_PROCESS, INVESTIGATION_10, 3, 0, main);
                    return;
                }
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                gInvestigation.selectedActionYOffset = 0;
                gInvestigation.lastActionYOffset = 8;
                gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
                main->advanceScriptContext = TRUE;
                main->showTextboxCharacters = TRUE;
                gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
                temp2 = GetQuestioningPresentedSection(gScriptContext.currentSection, courtRecord->displayItemList[courtRecord->selectedItem]);
                if(temp2) {
                    ChangeScriptSection(temp2);
                } else {
                    if(gScriptContext.flags & 0x10)
                    {
                        ChangeScriptSection(gScriptContext.currentSection + 1);
                    }
                    else
                    {
                        sub_800EBE8();
                    }
                    gScriptContext.flags &= ~0x10;
                }
                RESTORE_PROCESS_PTR(main);
                return;
            }
            main->process[GAME_PROCESS_VAR2]++;
            main->itemPlateRotation += 12;
            main->affineScale -= 8;
            break;
        default:
            break;
    }
    if(main->affineScale <= 4) {
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        if (sub_8016ED8() != 0) {
            SetOrQueueHPBarState(8);
        }
    } else {
        s32 scale;
        scale = fix_inverse(main->affineScale);
        gOamObjects[0].attr3 = fix_mul(_Cos(main->itemPlateRotation), scale);
        gOamObjects[1].attr3 = fix_mul(_Sin(main->itemPlateRotation), scale);
        gOamObjects[2].attr3 = fix_mul(-_Sin(main->itemPlateRotation), scale);
        gOamObjects[3].attr3 = fix_mul(_Cos(main->itemPlateRotation), scale);
        oam->attr0 = SPRITE_ATTR0(16, ST_OAM_AFFINE_NORMAL, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        oam->attr1 = SPRITE_ATTR1_AFFINE(88, 0, 3);
        oam->attr2 = SPRITE_ATTR2(0x80, 0, 1);
    }
    UpdateBG2Window(&gCourtRecord);
    UpdateRecordSprites(&gCourtRecord);
}

void EvidenceAddedInit(struct Main * main, struct CourtRecord * courtRecord) // note_add_init
{
    u32 i;
    u16 * map = gBG2MapBuffer;
    for(i = 0; i < 0x400; i++, map++)
        *map = 0;
    gIORegisters.lcd_dispcnt |= DISPCNT_BG2_ON;
    LoadEvidenceWindowGraphics();
    LoadEvidenceGraphics(main->gottenEvidenceId);
    SetBGMVolume(main->bgmVolume >> 1, 4);
    PlaySE(BGM015_JINGLE_EVIDENCE);
    main->process[GAME_PROCESS_STATE]++;
    main->process[GAME_PROCESS_VAR1] = 0;
    gIORegisters.lcd_dispcnt |= DISPCNT_BG2_ON;
    gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
    main->tilemapUpdateBits |= 4;
}

void EvidenceAddedMain(struct Main * main, struct CourtRecord * courtRecord) // note_add_main
{
    UpdateBG2Window(courtRecord);
    UpdateEvidenceSprites(courtRecord);
    if(courtRecord->windowScrollSpeed == 0 && gScriptContext.flags & 1)
    {
        if(main->process[GAME_PROCESS_VAR1] == 0)
        {
            SetBGMVolume(0x100, 0x1E);
            main->process[GAME_PROCESS_VAR1] = 1;
        }
        gScriptContext.unk12++;
        sub_801A054();
        if((gJoypad.pressedKeys & A_BUTTON) || (gJoypad.heldKeys & B_BUTTON))
        {
            PlaySE(SE001_MENU_CONFIRM);
            SlideInBG2Window(3, 0xE);
            main->process[GAME_PROCESS_STATE] = EVIDENCE_ADD_EXIT;
            gScriptContext.flags |= SCRIPT_x4000;
            gBG1MapBuffer[0x26E] = 9;
            gBG1MapBuffer[0x26F] = 9;
        }
    }
}

void EvidenceAddedExit(struct Main * main, struct CourtRecord * courtRecord) // note_add_exit
{
    UpdateBG2Window(courtRecord);
    UpdateEvidenceSprites(courtRecord);
    if(courtRecord->windowScrollSpeed == 0)
    {
        RESTORE_PROCESS_PTR(main);
        if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS)
        {
            if(gMain.process[GAME_PROCESS_STATE] == INVESTIGATION_INSPECT)
                SetInactiveActionButtons(&gInvestigation, 1);
            else if(main->process[GAME_PROCESS_STATE] == INVESTIGATION_TALK) //! why?? why???? why are you using that pointer when the other ones are noooot
                SetInactiveActionButtons(&gInvestigation, 4);
            else if(gMain.process[GAME_PROCESS_STATE] == INVESTIGATION_PRESENT)
                SetInactiveActionButtons(&gInvestigation, 8);
        }
    }
}

void UpdateCourtRecordArrows(struct CourtRecord * courtRecord)
{
    courtRecord->recordArrowCounter++;
    if(courtRecord->recordArrowCounter > 4)
    {
        courtRecord->recordArrowCounter = 0;
        courtRecord->recordArrowFrame++;
        courtRecord->recordArrowFrame &= 3;
        DmaCopy16(3, gGfx4bppTestimonyArrows + sCourtRecordLeftArrowTileIndexes[courtRecord->recordArrowFrame] * 32, OBJ_VRAM0+0x3400, TILE_SIZE_4BPP*4);
        DmaCopy16(3, gGfx4bppTestimonyArrows + sCourtRecordRightArrowTileIndexes[courtRecord->recordArrowFrame] * 32, OBJ_VRAM0+0x3480, TILE_SIZE_4BPP*4);
    }
}

void LoadEvidenceWindowGraphics(void)
{
    SlideInBG2Window(1, 0xC);
    DmaCopy16(3, gGfx4bppTestimonyArrows, OBJ_VRAM0+0x3400, TILE_SIZE_4BPP*4);
    DmaCopy16(3, gGfx4bppTestimonyArrows + TILE_SIZE_4BPP*4 * 3, OBJ_VRAM0+0x3480, TILE_SIZE_4BPP*4);
    DmaCopy16(3, gGfx4bppControllerButtons, OBJ_VRAM0+0x3800, TILE_SIZE_4BPP*16);
    DmaCopy16(3, gGfx4bppPresentBackTextTiles, OBJ_VRAM0+0x3A00, TILE_SIZE_4BPP*16);
    DmaCopy16(3, gGfx4bppProfileTextTiles, OBJ_VRAM0+0x3500, TILE_SIZE_4BPP*16);
    DmaCopy16(3, gPalCrossExaminationUI, OBJ_PLTT+0x60, 0x20);
    DmaCopy16(3, gPalCourtRecordActionText, OBJ_PLTT+0x80, 0x20);
    DmaCopy16(3, gPalEvidenceProfileDesc, OBJ_PLTT+0x40, 0x20);
}

void UpdateRecordSprites(struct CourtRecord * courtRecord)
{
    struct OamAttrs * oam;
    UpdateEvidenceSprites(courtRecord);
    if(courtRecord->flags & 4)
    {
        UpdateCourtRecordArrows(courtRecord);
        oam = gOamObjects + OAM_IDX_LR_ARROW;
        if(courtRecord->displayItemCount > 1)
            oam->attr0 = SPRITE_ATTR0(48, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        else
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(0, FALSE, FALSE, 1);
        oam->attr2 = SPRITE_ATTR2(0x1A0, 0, 2);
        oam++;
        if(courtRecord->displayItemCount > 1)
            oam->attr0 = SPRITE_ATTR0(48, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        else
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(DISPLAY_WIDTH-16, FALSE, FALSE, 1);
        oam->attr2 = SPRITE_ATTR2(0x1A4, 0, 2);
        if(gMain.process[GAME_PROCESS_VAR2] == 0
        || gMain.process[GAME_PROCESS_VAR2] == 4
        || gMain.process[GAME_PROCESS_VAR2] == 5)
            UpdateRecordInfoActionSprites(1);
        else
            UpdateRecordPresentActionSprites(1);
        return;
    }
    else
    {
        oam = gOamObjects + OAM_IDX_LR_ARROW;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        if(gMain.process[GAME_PROCESS_VAR2] == 0
        || gMain.process[GAME_PROCESS_VAR2] == 4
        || gMain.process[GAME_PROCESS_VAR2] == 5)
            UpdateRecordInfoActionSprites(0);
        else
            UpdateRecordPresentActionSprites(0);
    }
}

void LoadEvidenceGraphics(u32 evidenceId)
{
    u32 offset;
    u8 * src;

    src = eGeneralScratchpadBuffer;
    LZ77UnCompWram(gUnknown_08026E20[gEvidenceProfileData[evidenceId].evidenceImageId], src);
    DmaCopy16(3, src, OBJ_PLTT+0x20, 0x20);
    src += 0x20;
    DmaCopy16(3, src, OBJ_VRAM0+0x5000, TILE_SIZE_4BPP * 64);
    src = gEvidenceProfileData[evidenceId].descriptionTiles;
    LZ77UnCompWram(src, eGeneralScratchpadBuffer);
    DmaCopy16(3, eGeneralScratchpadBuffer, (void *)OBJ_VRAM0+0x3C00, TILE_SIZE_4BPP * 160);
}

void UpdateEvidenceSprites(struct CourtRecord * courtRecord)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_EVIDENCE_DISPLAY];
    u32 i;

    oam->attr0 = SPRITE_ATTR0(24, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
    oam->attr1 = SPRITE_ATTR1_NONAFFINE(0, FALSE, FALSE, 3);
    oam->attr1 += courtRecord->windowX;
    oam->attr2 = SPRITE_ATTR2(0x280, 0, 1);
    oam++;
    for(i = 0; i < 5; i++)
    {
        oam->attr0 = SPRITE_ATTR0(24, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(72 + i*32, FALSE, FALSE, 2);
        oam->attr1 += courtRecord->windowX;
        oam->attr2 = SPRITE_ATTR2(0x1E0 + i*0x10, 0, 2);
        oam++;
    }
    for(i = 0; i < 5; i++)
    {
        oam->attr0 = SPRITE_ATTR0(56, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(72 + i*32, FALSE, FALSE, 2);
        oam->attr1 += courtRecord->windowX;
        oam->attr2 = SPRITE_ATTR2(0x230 + i*0x10, 0, 2);
        oam++;
    }
}

void ClearEvidenceSprites(struct CourtRecord * courtRecord)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_EVIDENCE_DISPLAY];
    u32 i;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    for(i = 0; i < 10; i++)
    {
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
    }
}

void UpdateRecordInfoActionSprites(bool32 showSprites)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_EVIDENCE_RECORD_ACTIONS];
    if(showSprites)
    {
        oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(160, FALSE, FALSE, 1);
        oam->attr2 = SPRITE_ATTR2(0x1C8, 0, 4);
        oam++;
        oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(176, FALSE, FALSE, 2);
        oam->attr2 = SPRITE_ATTR2(0x1A8, 0, 4);
        oam++;
        oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(208, FALSE, FALSE, 2);
        oam->attr2 = SPRITE_ATTR2(0x1B0, 0, 4);
    }
    else
    {
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
    }
}

void UpdateRecordPresentActionSprites(bool32 showSprites)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_EVIDENCE_RECORD_ACTIONS];
    if(showSprites)
    {
        if(gMain.gameStateFlags & 0x100)
        {
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(60, FALSE, FALSE, 1);
            oam->attr2 = SPRITE_ATTR2(0x1C8, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(76, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1A8, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(108, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1B0, 0, 4);
            oam++;
            oam = &gOamObjects[OAM_IDX_EVIDENCE_PRESENT_ACTIONS];
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(200, FALSE, FALSE, 1);
            oam->attr2 = SPRITE_ATTR2(0x1C0, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(216, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1D0, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
        else
        {
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(60, FALSE, FALSE, 1);
            oam->attr2 = SPRITE_ATTR2(0x1C8, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(76, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1A8, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(108, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1B0, 0, 4);
            oam++;
            oam = &gOamObjects[OAM_IDX_EVIDENCE_PRESENT_ACTIONS];
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(140, FALSE, FALSE, 1);
            oam->attr2 = SPRITE_ATTR2(0x1C0, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(156, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1D0, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(200, FALSE, FALSE, 1);
            oam->attr2 = SPRITE_ATTR2(0x1C4, 0, 4);
            oam++;
            oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
            oam->attr1 = SPRITE_ATTR1_NONAFFINE(216, FALSE, FALSE, 2);
            oam->attr2 = SPRITE_ATTR2(0x1D8, 0, 4);
            oam++;
        }
    }
    else
    {
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam = &gOamObjects[OAM_IDX_EVIDENCE_PRESENT_ACTIONS];
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
        oam->attr0 = SPRITE_ATTR0_CLEAR;
        oam++;
    }
}

void UpdateEvidenceDetailActionSprites(bool32 showSprites)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_EVIDENCE_RECORD_ACTIONS];
    
    oam->attr0 = SPRITE_ATTR0(144, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
    oam->attr1 = SPRITE_ATTR1_NONAFFINE(184, FALSE, FALSE, 1);
    oam->attr2 = SPRITE_ATTR2(0x1C4, 0, 4);
    oam++;
    oam->attr0 = SPRITE_ATTR0(144, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
    oam->attr1 = SPRITE_ATTR1_NONAFFINE(200, FALSE, FALSE, 1);
    oam->attr2 = SPRITE_ATTR2(0x1CC, 0, 4);
    oam++;
    oam->attr0 = SPRITE_ATTR0(144, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
    oam->attr1 = SPRITE_ATTR1_NONAFFINE(216, FALSE, FALSE, 2);
    oam->attr2 = SPRITE_ATTR2(0x1D8, 0, 4);
    oam = &gOamObjects[OAM_IDX_GENERAL_2];
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
}

s32 FindEvidenceInCourtRecord(u32 isProfile, u32 evidenceId)
{
    u8 * list;
    u32 evidenceCount;
    u32 i;

    if(isProfile)
    {
        list = gCourtRecord.profileList;
        evidenceCount = gCourtRecord.profileCount;
    }
    else
    {
        list = gCourtRecord.evidenceList;
        evidenceCount = gCourtRecord.evidenceCount;
    }
    for(i = 0; i < evidenceCount; i++, list++)
    {
        if(*list == evidenceId)
            return i;
    }
    return -1;
}

s32 FindFirstEmptySlotInCourtRecord(u32 isProfile)
{
    u32 i;
    u8 * list = gCourtRecord.evidenceList;
    if(isProfile)
        list = gCourtRecord.profileList;
    for(i = 0; i < 0x20; i++, list++)
    {
        if(*list == 0xFF)
            return i;
    }
    return -1;
}

void SortCourtRecordAndSyncListCount(struct CourtRecord * courtRecord)
{
    u8 * ewram = eGeneralScratchpadBuffer;
    u32 i;

    DmaCopy16(3, courtRecord->profileList, ewram, 0x20);
    DmaFill16(3, 0xFFFF, courtRecord->profileList, 0x20);
    courtRecord->profileCount = 0;
    for(i = 0; i < 0x20; i++)
    {
        if(ewram[i] != 0xFF)
        {
            courtRecord->profileList[courtRecord->profileCount] = ewram[i];
            courtRecord->profileCount++;
        }
    }
    DmaCopy16(3, courtRecord->evidenceList, ewram, 0x20);
    DmaFill16(3, 0xFFFF, courtRecord->evidenceList, 0x20);
    courtRecord->evidenceCount = 0;
    for(i = 0; i < 0x20; i++)
    {
        if(ewram[i] != 0xFF)
        {
            courtRecord->evidenceList[courtRecord->evidenceCount] = ewram[i];
            courtRecord->evidenceCount++;
        }
    }
}

u32 GetQuestioningPresentedSection(u32 section, u32 evidenceId)
{
    const struct CourtPresentData * presentData;
    presentData = gCourtPresentData[gMain.scenarioIdx];
    for(; presentData->presentingSection != 0xFFFF; presentData++) {
        if(presentData->flagId != 0xFF) {
            if(!GetFlag(0, presentData->flagId))
                continue;
        }
        if(gScriptContext.unk44) {
            // ! this is needed for matching
            if ((presentData->presentingSection & 0xF000) == 0)
            if ((presentData->presentingSection & 0xF000) == 0)
                continue;
        } else {
            if ((presentData->presentingSection & 0xF000) != 0)
                continue;
        }
        if((presentData->presentingSection & 0xFFF) == section && (presentData->evidenceId == evidenceId || presentData->evidenceId == 0xFF))
        {
            if(presentData->action != 0)
                gScriptContext.slamDesk = FALSE;
            else
                gScriptContext.slamDesk = TRUE;
            return presentData->presentedSection;
        }
    }
    gScriptContext.slamDesk = FALSE;
    return 0;
}

u32 GetEvidenceCommentSection(struct Main * main, u32 evidenceId, bool8 isProfile) // unity tantei_show_check
{
    const struct InvestigationPresentData * presetData;
    u32 retVal;

    presetData = gInvestigationPresentData[main->scenarioIdx];
    retVal = presetData->uninterestedSection;
    
    for(; presetData->isProfile != 0xFF && presetData->roomId != main->currentRoomId; presetData++)
        ; // this loop has to be a for loop otherwise bad regalloc! :))))
    
    for(; presetData->roomId == main->currentRoomId; presetData++)
    {
        if(gAnimation[1].animationInfo.personId == presetData->personId
        && isProfile == presetData->isProfile
        && (main->currentRoomSeq[main->currentRoomId] == presetData->roomseq || presetData->roomseq == 0xFF))
        {
            if(evidenceId == presetData->evidenceId
            || presetData->evidenceId == 0xFF)
                return presetData->interestedSection;
            retVal = presetData->uninterestedSection;
        }
    }

    return retVal;
}

void UpdateItemPlate(struct Main * main)
{
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_ITEMPLATE_ITEM];
    if(sub_8016ED8() == 1) {
        oam = &gOamObjects[OAM_IDX_ITEMPLATE_ITEM+7];
    }
    switch(main->itemPlateState)
    {
        case 0:
        default:
            break;
        case 1:
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            if(sub_8016ED8() == 0) {
                DmaCopy16(3, &gOamObjects[OAM_IDX_ITEMPLATE_ITEM], OAM+OAM_IDX_ITEMPLATE_ITEM*8, 0x8);
            }
            else {
                DmaCopy16(3, &gOamObjects[OAM_IDX_ITEMPLATE_ITEM+7], OAM+(OAM_IDX_ITEMPLATE_ITEM+7)*8, 0x8);
            }
            if(main->itemPlateSide == 0)
                main->itemPlateAction = 4;
            else
                main->itemPlateAction = 6;
            main->itemPlateState++;
        case 2: // fallthrough
            DrawItemPlate(main);
            if(main->itemPlateAction == 2)
            {
                gBG1MapBuffer[GET_MAP_TILE_INDEX(1, 1, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(1, 2, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(2, 1, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(2, 2, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(1, 28, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(1, 27, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(2, 28, 0, 0)] = 0;
                gBG1MapBuffer[GET_MAP_TILE_INDEX(2, 27, 0, 0)] = 0;
                main->itemPlateState = 0;
            }
            break;
        case 3:
            LoadItemPlateGfx(main);
            if(main->itemPlateSide == 0)
            {
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(16, FALSE, FALSE, 3);
                main->itemPlateAction = 3;
            }
            else
            {
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(160, FALSE, FALSE, 3);
                main->itemPlateAction = 5;
            }
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam->attr2 = SPRITE_ATTR2(0x80, 0, 1);
            main->itemPlateState++;
        case 4: // fallthrough
            if(main->process[GAME_PROCESS] == SAVE_GAME_PROCESS)
            {
                main->itemPlateState = 6;
                return;
            }    
            DrawItemPlate(main);
            if(main->itemPlateAction == 1)
                oam->attr0 = SPRITE_ATTR0(16, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            
            if(main->process[GAME_PROCESS] >= COURT_RECORD_PROCESS)
            {
                int i;
                u16 * map;
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                if(sub_8016ED8() == 0) {
                    DmaCopy16(3, &gOamObjects[OAM_IDX_ITEMPLATE_ITEM], OAM+OAM_IDX_ITEMPLATE_ITEM*8, 0x8);
                }
                else {
                    DmaCopy16(3, &gOamObjects[OAM_IDX_ITEMPLATE_ITEM+7], OAM+(OAM_IDX_ITEMPLATE_ITEM+7)*8, 0x8);
                }
                map = gBG1MapBuffer;
                for(i = 0; i < 352; i++, map++)
                    *map = 0;
                main->itemPlateState++;
            }
            break;
        case 5:
            if(main->process[GAME_PROCESS] < COURT_RECORD_PROCESS)
            {
                LoadItemPlateGfx(main);
                oam->attr0 = SPRITE_ATTR0(16, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                if(main->itemPlateSide == 0)
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(16, FALSE, FALSE, 3);
                else
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(160, FALSE, FALSE, 3);
                oam->attr2 = SPRITE_ATTR2(0x80, 0, 1);
                if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS && gMain.process[GAME_PROCESS_STATE] == INVESTIGATION_10)
                    gIORegisters.lcd_dispcnt |= DISPCNT_BG0_ON;
                DrawItemPlate(main);
                main->itemPlateState = 4;
            }
            break;
        case 6:
            if(main->process[GAME_PROCESS] != SAVE_GAME_PROCESS)
                main->itemPlateState = 5;
            break;
    }
}

void LoadItemPlateGfx(struct Main * main)
{
    u8 * src;
    src = eGeneralScratchpadBuffer;
    LZ77UnCompWram(gUnknown_08026E20[gEvidenceProfileData[main->itemPlateEvidenceId].evidenceImageId], src);
    DmaCopy16(3, src, OBJ_PLTT+0x20, 0x20);
    DmaCopy16(3, src+0x20, OBJ_VRAM0+0x1000, TILE_SIZE_4BPP * 64);
}

void DrawItemPlateLeftSide(struct Main * main) {
    u16 * map = gBG1MapBuffer+32+1;
    u32 i;
    map++;
    for(i = 0; i < main->itemPlateSize+1; i++)
    {
        u32 j;
        for(j = 0; j < main->itemPlateSize; j++)
            *map++ = 0x38;
        map += (0x20 - main->itemPlateSize);
    }
    map = gBG1MapBuffer+32+1;
    *map++ = 0x30;
    for(i = 0; i < main->itemPlateSize; i++)
        *map++ = 0x31;
    *map++ = 0x32;
    map = gBG1MapBuffer+32+1; 
    map += main->itemPlateSize*32 + 32;
    *map++ = 0x35;
    for(i = 0; i < main->itemPlateSize; i++)
        *map++ = 0x36;
    *map++ = 0x37;
    map = gBG1MapBuffer+32+1;
    map += 32;
    for(i = 0; i < main->itemPlateSize; i++)
    {
        *map = 0x33;
        map[main->itemPlateSize+1] = 0x34;
        map += 32;
    }
}

void DrawItemPlateRightSide(struct Main * main) {
    u16 * map = gBG1MapBuffer+32+28;
    u32 i;
    map--;
    for(i = 0; i < main->itemPlateSize+1; i++)
    {
        u32 j;
        for(j = 0; j < main->itemPlateSize; j++)
            *map-- = 0x38;
        map += (0x20 + main->itemPlateSize);
    }
    map = gBG1MapBuffer+32+28;
    *map-- = 0x32;
    for(i = 0; i < main->itemPlateSize; i++)
        *map-- = 0x31;
    *map-- = 0x30;
    map = gBG1MapBuffer+32+28;
    map += main->itemPlateSize*32 + 32;
    *map-- = 0x37;
    for(i = 0; i < main->itemPlateSize; i++)
        *map-- = 0x36;
    *map-- = 0x35;
    map = gBG1MapBuffer+32+28;
    map += 32;
    for(i = 0; i < main->itemPlateSize; i++)
    {
        *map = 0x34;
        map[-main->itemPlateSize-1] = 0x33;
        map += 32;
    }
}

void DrawItemPlate(struct Main * main)
{
    u16 * map;
    u32 i;

    if(main->itemPlateAction > 2)
    {
        map = gBG1MapBuffer+32; // start at y 1
        for(i = 0; i < 0x140; i++, map++)
            *map = 0;
    }
    switch(main->itemPlateAction)
    {
        case 0:
            break;
        case 1:
            if(main->itemPlateSide != 0)
                DrawItemPlateRightSide(main);
            else
                DrawItemPlateLeftSide(main);
            break;
        case 2:
        default:
            break;
        case 3:
        case 4:
            DrawItemPlateLeftSide(main);
            break;
        case 5:
        case 6:
            DrawItemPlateRightSide(main);
            break;
    }
    main->itemPlateCounter++;
    if(main->itemPlateCounter > 0)
    {
        main->itemPlateCounter = 0;
        if(main->itemPlateAction == 4 || main->itemPlateAction == 6)
        {
            if(main->itemPlateSize > 0)
            {
                main->itemPlateSize--;
                return;
            }
            main->itemPlateAction = 2;
        }
        else
        {
            if(main->itemPlateSize < 8)
            {
                main->itemPlateSize++;
                return;
            }
            main->itemPlateAction = 1;
        }
    }
}
