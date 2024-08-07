#include "global.h"
#include "case_data.h"
#include "animation.h"
#include "background.h"
#include "investigation.h"
#include "script.h"
#include "utils.h"
#include "sound.h"
#include "constants/oam_allocations.h"

void InvestigationSetPersonAnimation(u32 arg0, u32 arg1, u32 arg2) // Set_char
{
    struct Main *main = &gMain;
    main->talkingAnimationOffset = arg1;
    main->idleAnimationOffset = arg2;
    PlayPersonAnimation(arg0, 0, arg1, 0);
    gInvestigation.personActive = 1;
    SetInactiveActionButtons(&gInvestigation, 0xF);
}

void InvestigationSetScriptSectionAndFlag(u32 section, u32 flagId) // Set_event
{
    ChangeFlag(0, flagId, TRUE);
    ChangeScriptSection(section);
    SlideTextbox(1);
    PauseBGM();
}

void InvestigationSetScriptSectionAndFlagTextboxSlide2(u32 section, u32 flagId) // Set_event
{
    ChangeFlag(0, flagId, TRUE);
    ChangeScriptSection(section);
    SlideTextbox(2);
}

void sub_8006728(u32 section, u32 flagId) // unused? Set_event2?
{
    struct OamAttrs *sprite = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    u32 i = 0;

    for (i = 0; i < 4; sprite++, i++)
    {
        sprite->attr0 = SPRITE_ATTR0((-64 & 255), ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        // 64x32 sprite
        sprite->attr1 = SPRITE_ATTR1_NONAFFINE(60 * i, 0, 0, 3);
        sprite->attr2 = SPRITE_ATTR2((0x100 + i * 0x20), 0, 5);
    }
    SET_PROCESS(4, 1, 0, 0);
    ChangeFlag(0, flagId, TRUE);
    ChangeScriptSection(section);
    SlideTextbox(1);
    SetInactiveActionButtons(&gInvestigation, 0xF);
    gInvestigation.selectedActionYOffset = 0x40;
}

void InvestigationDummy(struct Main *main)
{
}
