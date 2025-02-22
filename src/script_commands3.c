#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "utils.h"
#include "constants/songs.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

u32 Command1C(struct ScriptContext * scriptCtx)
{
    u16 i;
    scriptCtx = &gScriptContext;
    switch(*scriptCtx->scriptPtr)
    {
        case 0: // enable textbox
            gMain.showTextboxCharacters = TRUE;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            gIORegisters.lcd_bg1vofs = 0;
            scriptCtx->textboxState = 0;
            CopyTextboxTilesToBG1MapBuffer();
            SetTextboxNametag(gScriptContext.unk24 & 0x7F, gMain.currentNametagRightSide);
            DmaCopy16(3, gPalEvidenceProfileDesc, PLTT, 0x20);
            break;
        case 1: // disable textbox
            gMain.showTextboxCharacters = FALSE;
            for(i = 0; i < 256; i++)
                gBG1MapBuffer[0x180 + i] = 0;
            scriptCtx->textboxState = 1;
            break;
        case 2:
            if(gMain.process[GAME_PROCESS] == 3)
            {
                DestroyAnimation(&gAnimation[1]);
                gInvestigation.personActive = 0;
                SetInactiveActionButtons(&gInvestigation, 15);
            }
            SlideTextbox(1);
            break;
        case 3:
            if(gMain.process[GAME_PROCESS] == 3)
            {
                DestroyAnimation(&gAnimation[1]);
                gInvestigation.personActive = 0;
                SetInactiveActionButtons(&gInvestigation, 15);
            }
            if(scriptCtx->textboxState != 1) {
                SlideTextbox(0);
            } else {
                gMain.advanceScriptContext = FALSE;
                gMain.showTextboxCharacters = FALSE;
                gInvestigation.actionState = 1;
            }
            if(gMain.process[GAME_PROCESS] == 4)
            {
                gInvestigation.selectedActionYOffset = 0;
                if(gMain.process[GAME_PROCESS_STATE] == 6)
                {
                    SetInactiveActionButtons(&gInvestigation, 1);
                }
                if(gMain.process[GAME_PROCESS_STATE] == 8)
                {
                    SetInactiveActionButtons(&gInvestigation, 4);
                    gInvestigation.actionState = 4;
                }
                if(gMain.process[GAME_PROCESS_STATE] == 9)
                {
                    SetInactiveActionButtons(&gInvestigation, 8);
                }
            }
            scriptCtx->textSpeed = 3;
            break;
        case 6:
            gInvestigation.selectedActionYOffset = 0;
            if(gMain.process[GAME_PROCESS_STATE] == 6)
                SetInactiveActionButtons(&gInvestigation, 1);
            if(gMain.process[GAME_PROCESS_STATE] == 8)
            {
                SetInactiveActionButtons(&gInvestigation, 4);
                gInvestigation.actionState = 4;
                gMain.advanceScriptContext = FALSE;
                gMain.showTextboxCharacters = FALSE;
                scriptCtx->textboxState = 4;
                break;
            }
            if(gMain.process[GAME_PROCESS_STATE] == 9)
                SetInactiveActionButtons(&gInvestigation, 8);
            gMain.advanceScriptContext = FALSE;
            gMain.showTextboxCharacters = FALSE;
            scriptCtx->textboxState = 4;
            gInvestigation.actionState = 1;
            break;
        case 4:
            gIORegisters.lcd_bg1vofs = 0;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            scriptCtx->textboxState = 0;
            break;
        case 5:
            gIORegisters.lcd_bg1vofs = -81;
            gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
            scriptCtx->textboxState = 1;
            break;
        default:
            break;
    }
    scriptCtx->scriptPtr++;
    gInvestigation.inspectionPaused = 0;
    return 0;
}

u32 Command20(struct ScriptContext *scriptCtx)
{
    scriptCtx = &gScriptContext;
    scriptCtx->nextSection = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command21(struct ScriptContext *scriptCtx)
{
    if((gScriptContext.unk12 & 0xFF) == 0) {
        SetOrQueueHPBarState(6);
        gScriptContext.flags &= ~SCRIPT_SKIP;
        gScriptContext.unk12++;
        return 1;
    }
    PlaySE(SE007_MENU_OPEN_SUBMENU);
    gScriptContext.flags |= 0x10;
    gMain.gameStateFlags |= 0x300;
    BACKUP_PROCESS();
    SET_PROCESS(COURT_RECORD_PROCESS, 0, 0, 1);
    SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
    return 0;
}

bool32 Command25(struct ScriptContext *scriptCtx)
{
    gScriptContext.scriptPtr++; // ! this sets previousSection in the previous games
    return 0;
}

bool32 Command26(struct ScriptContext *scriptCtx)
{
    scriptCtx = &gScriptContext;
    if (*scriptCtx->scriptPtr != 0) {
        gMain.gameStateFlags |= 0x10;
    }
    else
        gMain.gameStateFlags &= ~0x10;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command29(struct ScriptContext *scriptCtx)
{
    scriptCtx = &gScriptContext;
    switch(*scriptCtx->scriptPtr)
    {
        default: 
            SET_PROCESS(COURT_PROCESS, COURT_MAIN, 0, 0);
            break;
        case 1:
            BACKUP_PROCESS();
            SET_PROCESS(QUESTIONING_PROCESS, 0, 0, 0);
            break;
        case 2:
            gTestimony.pressPromptY = 0xE0;
            gTestimony.presentPromptY = 0xE0;
            gTestimony.displayState = 0;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            if(scriptCtx->currentSection < 0x80) {
                ChangeScriptSection(scriptCtx->nextSection);
            }
            break;
        case 3:
            gTestimony.pressPromptY = 0xE0;
            gTestimony.presentPromptY = 0xE0;
            gTestimony.displayState = 2;
            gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
            break;
        case 4:
            DmaCopy16(3, gGfxPressPresentButtons, OBJ_VRAM0 + 0x3000, 0x400);
            DmaCopy16(3, gPalPressPresentButtons, OBJ_PLTT+0xA0, 0x20);
            DmaCopy16(3, gGfx4bppTestimonyArrows, 0x1A0, 0x80);
            DmaCopy16(3, gGfx4bppTestimonyArrows + 12 * TILE_SIZE_4BPP, 0x220, 0x80);
            gTestimony.pressPromptY = 0xE0;
            gTestimony.presentPromptY = 0xE0;
            gTestimony.displayState = 0;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            SET_PROCESS(QUESTIONING_PROCESS, QUESTIONING_MAIN, 0, 0);
            break;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command2A(struct ScriptContext *scriptCtx)
{
    u32 nextSection;
    scriptCtx = &gScriptContext;
    if (GetFlag(0, *scriptCtx->scriptPtr))
    {
        nextSection = *(scriptCtx->scriptPtr + 1);
    }
    else
    {
        nextSection = *(scriptCtx->scriptPtr + 2);
    }
    scriptCtx->nextSection = nextSection;
    scriptCtx->scriptPtr += 3;
    return 0;
}

bool32 Command2B(struct ScriptContext *scriptCtx) // nooped take damage command 
{
    return 0;
}

bool32 Command2C(struct ScriptContext *scriptCtx)
{
    scriptCtx = &gScriptContext;
    if(scriptCtx->unk22 & 0x20) {
        scriptCtx->unk22 &= ~0x20;
        scriptCtx->textColor = 0;
    }
    ChangeScriptSection(*scriptCtx->scriptPtr);
    return 0;
}

bool32 Command2E(struct ScriptContext *scriptCtx) {
    u32 i;
    scriptCtx = &gScriptContext;
    scriptCtx->flags &= ~SCRIPT_SKIP;
    scriptCtx->flags &= ~SCRIPT_x4000;
    if(scriptCtx->unk22 & 0x20) {
        scriptCtx->unk22 &= ~0x20;
        scriptCtx->textColor = 0;
    }
    if(scriptCtx->textboxState == 0) {
        gBG1MapBuffer[622] = 9;
        gBG1MapBuffer[623] = 9;
    } else {
        gBG1MapBuffer[622] = 0;
        gBG1MapBuffer[623] = 0;
    }
    for (i = 0; i < ARRAY_COUNT(gTextBoxCharacters); i++)
    {
        gTextBoxCharacters[i].state &= ~0xC000;
    }
    scriptCtx->unk28 = 0;
    scriptCtx->unk29 = 0;
    if(scriptCtx->unk22 & 0xF) {
        sub_8017BA8();
        sub_8017BC0();
    }
    return 0;
}

bool32 Command30(struct ScriptContext *scriptCtx)
{
    scriptCtx = &gScriptContext;
    if (*scriptCtx->scriptPtr == 2)
    {
        scriptCtx->soundCueSkip = 0;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command32(struct ScriptContext *scriptCtx)
{
    u32 location, bgId;
    scriptCtx = &gScriptContext;
    location = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    bgId = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    gMain.roomData[location][0] = bgId;
    return 0;
}

bool32 Command33(struct ScriptContext *scriptCtx)
{
    u32 startingLocation;
    u8 i;

    scriptCtx = &gScriptContext;
    startingLocation = *scriptCtx->scriptPtr++;
    for(i = 1; i < 5; i++, scriptCtx->scriptPtr++) {
        gMain.roomData[startingLocation][i] = *scriptCtx->scriptPtr;
    }
    return 0;
}

bool32 Command34(struct ScriptContext *scriptCtx)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.currentRoomId = *scriptCtx->scriptPtr;
    if((*scriptCtx->scriptPtr & 0x8000) == 0) {
        StartHardwareBlend(2, 0, 2, 0x1F);
    }
    SET_PROCESS(INVESTIGATION_PROCESS, INVESTIGATION_ROOM_INIT, 0, 0);
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command35(struct ScriptContext *scriptCtx)
{
    u32 offset;
    u32 flag;
    u32 temp;
    u16 *jmpArgs;

    scriptCtx = &gScriptContext;
    flag = *scriptCtx->scriptPtr >> 8;

    if (*scriptCtx->scriptPtr & 1)
    {
        if (!GetFlag(0, flag))
        {
            scriptCtx->scriptPtr += 2;
            return 0;
        }
    }
    else
    {
        if (GetFlag(0, flag))
        {
            scriptCtx->scriptPtr += 2;
            return 0;
        }
    }
    if (*scriptCtx->scriptPtr & 0x80)
    {
        scriptCtx->scriptPtr++;
        sub_801873C(*scriptCtx->scriptPtr);
    }
    else
    {
        scriptCtx->scriptPtr++;
        temp = *scriptCtx->scriptPtr / 2;
        scriptCtx->scriptPtr = scriptCtx->scriptSectionPtr + temp;
    }
    return 0;
}

bool32 Command36(struct ScriptContext *scriptCtx)
{
    sub_801873C(gScriptContext.scriptPtr[0]);
    return 0;
}

bool32 Command37(struct ScriptContext *scriptCtx)
{
    u32 temp;
    scriptCtx = &gScriptContext;
    temp = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    gTalkData[temp].enableFlag = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command39(struct ScriptContext *scriptCtx)
{
    u32 id;
    u32 oamIdx;
    struct MapMarker *mapMarker;
    struct OamAttrs *oamObject;
    scriptCtx = &gScriptContext;
    id = *scriptCtx->scriptPtr >> 8;
    oamIdx = GetMapMarkerIndexFromId(id);
    if (*scriptCtx->scriptPtr & 1)
    {
        if (oamIdx == 0xFF)
        {
            u32 size;
            oamIdx = GetMapMarkerIndexFromId(0xFF);
            mapMarker = &gMapMarker[oamIdx];
            oamIdx += 0x39;
            mapMarker->vramPtr = sub_801A018();
            mapMarker->id = id;
            DmaCopy16(3, sMapMarkerSprites[id].tiles, mapMarker->vramPtr, size = sMapMarkerSprites[id].size); // weird shit going on here
            DmaCopy16(3, gPalMapMarkers, OBJ_PLTT + 0xC0, 0x20);
            mapMarker->oamIdx = oamIdx;
            oamObject = &gOamObjects[oamIdx];

            oamObject->attr0 = sMapMarkerSprites[id].attr0;
            mapMarker->attr0 = oamObject->attr0;

            oamObject->attr1 = sMapMarkerSprites[id].attr1;
            mapMarker->attr1 = oamObject->attr1;

            oamIdx = ((uintptr_t)mapMarker->vramPtr - ((uintptr_t)OBJ_VRAM0 + 0x1800));
            oamIdx /= 32;
            oamObject->attr2 = SPRITE_ATTR2(oamIdx + 0xC0, 2, 6);
            mapMarker->attr2 = oamObject->attr2;

            mapMarker->flags &= ~0x4;
        }
        else
        {
            mapMarker = &gMapMarker[oamIdx];
            oamObject = &gOamObjects[mapMarker->oamIdx];
            oamObject->attr0 = mapMarker->attr0;
            oamObject->attr1 = mapMarker->attr1;
            oamObject->attr2 = mapMarker->attr2;
            mapMarker->flags &= ~0x4;
        }
    }
    else
    {
        // TODO: BUGFIX
        // ! Capcom forgot to check for 0xFF here.
        gMapMarker[oamIdx].flags |= 4;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command3A(struct ScriptContext *scriptCtx)
{
    u32 oamIdx;
    scriptCtx = &gScriptContext;
    oamIdx = GetMapMarkerIndexFromId(*scriptCtx->scriptPtr >> 8);
    scriptCtx->scriptPtr++;
    if (oamIdx != 0xFF)
    {
        gMapMarker[oamIdx].attr0 &= ~0xFF;
        gMapMarker[oamIdx].attr0 |= *scriptCtx->scriptPtr & 0xFF;
        gMapMarker[oamIdx].attr1 &= ~0x1FF;
        gMapMarker[oamIdx].attr1 |= (*scriptCtx->scriptPtr >> 8) & 0xFF;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command3B(struct ScriptContext *scriptCtx)
{
    u32 oamIdx;
    scriptCtx = &gScriptContext;
    oamIdx = GetMapMarkerIndexFromId(*scriptCtx->scriptPtr >> 8);
    if (oamIdx != 0xFF)
    {
        gMapMarker[oamIdx].direction = *scriptCtx->scriptPtr;
        scriptCtx->scriptPtr++;
        gMapMarker[oamIdx].speed = (*scriptCtx->scriptPtr >> 8) & 0xFF;
        gMapMarker[oamIdx].distanceToMove = *scriptCtx->scriptPtr & 0xFF;
        scriptCtx->scriptPtr++;
        gMapMarker[oamIdx].flags |= 2;
        gMapMarker[oamIdx].distanceMoved = 0;
    }
    else
    {
        scriptCtx->scriptPtr++;
        scriptCtx->scriptPtr++;
    }
    return 0;
}

bool32 Command3C(struct ScriptContext *scriptCtx)
{
    u32 oamIdx;
    scriptCtx = &gScriptContext;
    oamIdx = GetMapMarkerIndexFromId(*scriptCtx->scriptPtr >> 8);
    if (oamIdx != 0xFF)
    {
        gMapMarker[oamIdx].isBlinking = *scriptCtx->scriptPtr;
        if (!(*scriptCtx->scriptPtr & 1))
        {
            gOamObjects[oamIdx + 0x39].attr1 = gMapMarker[oamIdx].attr1;
        }
        gMapMarker[oamIdx].blinkTimer = 0;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command3D(struct ScriptContext *scriptCtx)
{
    u32 oamIdx;
    scriptCtx = &gScriptContext;
    oamIdx = GetMapMarkerIndexFromId(*scriptCtx->scriptPtr >> 8);
    if (oamIdx != 0xFF)
    {
        if (gMapMarker[oamIdx].flags & 2)
        {
            return 1;
        }
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command3E(struct ScriptContext *scriptCtx)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    sub_8017154(1);
    DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0 + 0x1F80, 0x80);
    DmaCopy16(3, &gPalExamineCursors[0], OBJ_PLTT + 0x140, 0x20);
    gInvestigation.pointerX = 0xF0;
    gInvestigation.pointerY = 0x30;
    gInvestigation.pointerColorCounter = 0;
    gInvestigation.pointerColor = 10;
    gInvestigation.spotselectStartCounter = 0xF;
    gInvestigation.spotselectId = *scriptCtx->scriptPtr;
    scriptCtx->flags |= (SCRIPT_SPOTSELECT_MOVE_TO_START | SCRIPT_SPOTSELECT_PLAY_SPAWN_SOUND);
    scriptCtx->scriptPtr++;
    return 0;
}

void sub_801B47C(u8 arg0, u8 arg1, u32 arg2) {
    u16 matrixIdx = arg1 * 4;
    arg2 *= 0x1000;
    arg2 += 0x10000;
    gOamObjects[arg0].attr1 |= arg1 << 9;
    gOamObjects[arg0].attr0 |= 0x300;
    gOamObjects[matrixIdx].attr3 = sub_8006364(0) * 0x10000 / arg2;
    gOamObjects[matrixIdx+1].attr3 = sub_80063E4(0) * 0x10000  / arg2;
    gOamObjects[matrixIdx+2].attr3 = -(sub_80063E4(0) * 0x10000 / arg2);
    gOamObjects[matrixIdx+3].attr3 = sub_8006364(0) * 0x10000 / arg2;
}

struct SpotSelectData
{
    /* +0x00 */ struct Point4 firstArea;
    /* +0x10 */ struct Point4 secondArea;
    /* +0x20 */ u16 firstAreaSection;
    /* +0x22 */ u16 secondAreaSection;
    /* +0x24 */ u16 defaultSection;
    /* +0x26 */ u16 filler26; // Unused, called a dummy in unity
    /* +0x28 */ u8 left;
    /* +0x29 */ u8 top;
    /* +0x2A */ u8 right;
    /* +0x2B */ u8 bottom;
};

extern const struct SpotSelectData gSpotSelectData[];
