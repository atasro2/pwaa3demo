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

void sub_801B47C(u8 oamIdx, u8 matrixNum, u32 arg2) {
    u16 matrixIdx = matrixNum * 4;
    arg2 *= 0x1000;
    arg2 += 0x10000;
    gOamObjects[oamIdx].attr1 |= matrixNum << 9;
    gOamObjects[oamIdx].attr0 |= ST_OAM_AFFINE_DOUBLE << 8;
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

bool32 Command3F(struct ScriptContext *_unused)
{
    struct InvestigationStruct *investigation = &gInvestigation; // r5
    struct ScriptContext *scriptCtx = &gScriptContext; // r6
    const struct SpotSelectData *spotselect = &gSpotSelectData[investigation->spotselectId]; // r8
    struct Rect rect;

    if(scriptCtx->unk12 & 0xFF) {
        scriptCtx->unk12 += 3;
        if((scriptCtx->unk12 & 0xFF) == 0x04) {
            u32 attr0;
            u32 x;
            u32 attr1;
            u32 y;
            gOamObjects[87] = gOamObjects[88];
            attr0 = gOamObjects[88].attr0 & 0xFF00;
            x = (gOamObjects[88].attr0 & 0xFF) - 8;
            gOamObjects[88].attr0 = attr0 | (x & 0xFF);
            attr1 = gOamObjects[88].attr1 & 0xFE00;
            y = (gOamObjects[88].attr1 & 0x1FF) - 8;
            gOamObjects[88].attr1 = attr1 | (y & 0x1FF);
            gIORegisters.lcd_bldcnt = BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3;
        }
        if((scriptCtx->unk12 & 0xF0) == 0x00) {
            sub_801B47C(88, 4, 0x10);
            gOamObjects[88].attr0 |= ST_OAM_OBJ_BLEND << 10;
            gIORegisters.lcd_bldalpha = BLDALPHA_BLEND((scriptCtx->unk12 & 0xF), 0x10 - (scriptCtx->unk12 & 0xF));
        }
        if((scriptCtx->unk12 & 0xF0) == 0x10) {
            // applying this on a normal sprite just makes it a double size affine sprite ????
            gOamObjects[87].attr0 |= ST_OAM_AFFINE_ERASE << 8;
            sub_801B47C(88, 4, 0x10 - (scriptCtx->unk12 & 0xF));
        }
        if((scriptCtx->unk12 & 0xF0) == 0x20) {
            gOamObjects[88].attr2 &= 0xFB00;
            gOamObjects[88].attr2 |= 0x400;
            gOamObjects[87].attr0 &= ~(ST_OAM_AFFINE_ERASE << 8);
            sub_801B47C(88, 4, 0x10 - (scriptCtx->unk12 & 0xF));
            gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(12, 4);
        }
        if((scriptCtx->unk12 & 0xF0) == 0x30) {
            gOamObjects[88] = gOamObjects[87];
            gOamObjects[87].attr0 = SPRITE_ATTR0_CLEAR;
            gIORegisters.lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
            gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
            gMain.showTextboxCharacters = TRUE;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            gIORegisters.lcd_bg1vofs = 0;
            scriptCtx->textboxState = 0;
            CopyTextboxTilesToBG1MapBuffer();
            SetTextboxNametag(scriptCtx->unk24 & 0x7F, gMain.currentNametagRightSide);
            DmaCopy16(3, gPalEvidenceProfileDesc, PLTT, 0x20);
            rect.x = gMain.Bg256_pos_x + investigation->pointerX + 12;
            rect.y = gMain.Bg256_pos_y + investigation->pointerY;
            rect.w = 4;
            rect.h = 4;
            if (CheckRectCollisionWithArea(&rect, &spotselect->firstArea))
                ChangeScriptSection(spotselect->firstAreaSection);
            else if (CheckRectCollisionWithArea(&rect, &spotselect->secondArea))
                ChangeScriptSection(spotselect->secondAreaSection);
            else
                ChangeScriptSection(spotselect->defaultSection);
            scriptCtx->flags &= ~(SCRIPT_SPOTSELECT_INPUT | SCRIPT_LOOP);
            sub_8017154(0);
            return 0;
        }
        return 1;
    }

    //_0801B790
    if (scriptCtx->flags & SCRIPT_SPOTSELECT_MOVE_TO_START)
    {
        investigation->pointerX += investigation->spotselectStartCounter;
        investigation->pointerX &= 0xFF;
        investigation->spotselectStartCounter--;
        if (investigation->spotselectStartCounter == 0)
        {
            scriptCtx->flags &= ~SCRIPT_SPOTSELECT_MOVE_TO_START;
            scriptCtx->flags |= (SCRIPT_SPOTSELECT_INPUT | SCRIPT_LOOP);
        }
        if (scriptCtx->flags & SCRIPT_SPOTSELECT_PLAY_SPAWN_SOUND)
        {
            PlaySE(SE007_MENU_OPEN_SUBMENU);
            scriptCtx->flags &= ~SCRIPT_SPOTSELECT_PLAY_SPAWN_SOUND;
        }
    }
    else if (scriptCtx->flags & SCRIPT_SPOTSELECT_INPUT)
    {
        if (gJoypad.heldKeys & DPAD_LEFT)
        {
            investigation->pointerX -= 3;
            if (investigation->pointerX < spotselect->left)
                investigation->pointerX = spotselect->left;
            if (investigation->pointerX > DISPLAY_WIDTH - 16)
                investigation->pointerX = 0;
        }
        if (gJoypad.heldKeys & DPAD_RIGHT)
        {
            investigation->pointerX += 3;
            if (investigation->pointerX > spotselect->right)
                investigation->pointerX = spotselect->right;
            if (investigation->pointerX > DISPLAY_WIDTH - 16)
                investigation->pointerX = DISPLAY_WIDTH - 16;
        }
        if (gJoypad.heldKeys & DPAD_UP)
        {
            investigation->pointerY -= 3;
            if (investigation->pointerY < spotselect->top)
                investigation->pointerY = spotselect->top;
            if (investigation->pointerY > DISPLAY_HEIGHT - 16)
                investigation->pointerY = 0;
        }
        if (gJoypad.heldKeys & DPAD_DOWN)
        {
            investigation->pointerY += 3;
            if (investigation->pointerY > spotselect->bottom)
                investigation->pointerY = spotselect->bottom;
            if (investigation->pointerY > DISPLAY_HEIGHT - 16)
                investigation->pointerY = DISPLAY_HEIGHT - 16;
        }
        if (gJoypad.pressedKeys & A_BUTTON)
        {
            u16 i;
            u16 * tiles;
            // ! rect is uninitialized in this call so this is completely broken 
            if (CheckRectCollisionWithArea(&rect, &spotselect->firstArea)) {
                StartHardwareBlend(3, 1, 8, 0x1F);
                StopBGM();
                PlaySE(0x48); // Objection?
            }
            DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0, 0x80);
            tiles = OBJ_VRAM0;
            for(i = 0; i < 0x100; i++) {
                if((*tiles & 0xF000) == 0x9000) {
                    *tiles &= 0x0FFF;
                }
                if((*tiles & 0x0F00) == 0x0900) {
                    *tiles &= 0xF0FF;
                }
                if((*tiles & 0x00F0) == 0x0090) {
                    *tiles &= 0xFF0F;
                }
                if((*tiles & 0x000F) == 0x0009) {
                    *tiles &= 0xFFF0;
                }
                tiles++;
            }
            investigation->pointerY++;
            scriptCtx->flags |= SCRIPT_SPOTSELECT_SELECTION_MADE;
            DmaCopy16(3, &gPalExamineCursors[0], OBJ_PLTT + 0x140, 0x20);
            PlaySE(SE001_MENU_CONFIRM);
            gOamObjects[OAM_IDX_POINTER].attr0 = SPRITE_ATTR0(investigation->pointerY, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
            gOamObjects[OAM_IDX_POINTER].attr1 = SPRITE_ATTR1_NONAFFINE(investigation->pointerX, FALSE, FALSE, 1);
            gOamObjects[OAM_IDX_POINTER].attr2 = SPRITE_ATTR2(0xFC, 1, 10);
            scriptCtx->unk12++;
            for(i = 0; i < 256; i++)
                gBG1MapBuffer[0x180 + i] = 0;
            gScriptContext.textboxState = 1;
            return 1;
        }
        investigation->pointerColorCounter++;
        if (investigation->pointerColorCounter > 1)
        {
            investigation->pointerColorCounter = 0;
            investigation->pointerColor++;
            investigation->pointerColor &= 0xF;
            DmaCopy16(3, &gPalExamineCursors[investigation->pointerColor * 0x20], OBJ_PLTT + 0x140, 0x20);
        }
    }
    scriptCtx->flags |= SCRIPT_SPOTSELECT_SELECTION_MADE;
    gOamObjects[OAM_IDX_POINTER].attr0 = SPRITE_ATTR0(investigation->pointerY, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
    gOamObjects[OAM_IDX_POINTER].attr1 = SPRITE_ATTR1_NONAFFINE(investigation->pointerX, FALSE, FALSE, 1);
    gOamObjects[OAM_IDX_POINTER].attr2 = SPRITE_ATTR2(0xFC, 1, 10);
    return 1;
}

bool32 Command40(struct ScriptContext * _unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    scriptCtx->flags &= ~SCRIPT_SPOTSELECT_SELECTION_MADE;
    gOamObjects[OAM_IDX_POINTER].attr0 = SPRITE_ATTR0_CLEAR;
    return 0;
}

bool32 Command41(struct ScriptContext * _unused)
{
    u32 i;
    struct OamAttrs *oam;
    // this has to be outside of the loop, else the load order breaks...
    oam = &gOamObjects[OAM_IDX_INVESTIGATION_ACTIONS];
    for(i = 0; i < OAM_COUNT_INVESTIGATION_ACTIONS; i++)
    {
        oam->attr0 = SPRITE_ATTR0((-32 & 255), ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
    // 64x32 sprite size
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(60*i, 0, 0, 3);
        oam->attr2 = SPRITE_ATTR2(0x100+0x20*i, 0, 5);
        oam++;
    }
    SetInactiveActionButtons(&gInvestigation, 0xF);
    gInvestigation.inactiveActionButtonY = 0xE0;
    gInvestigation.selectedActionYOffset = 0;
    gInvestigation.lastActionYOffset = 8;
    gInvestigation.selectedAction = 0;
    gInvestigation.lastAction = 0;
    
    gIORegisters.lcd_bg1vofs = -84;

    SET_PROCESS(INVESTIGATION_PROCESS,INVESTIGATION_MAIN,0,0);
    return 0;
}

bool32 Command42(struct ScriptContext * _unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    if(*scriptCtx->scriptPtr)
    {
        gMain.soundFlags &= ~SOUND_FLAG_DISABLE_CUE;
    }
    else
    {
        gMain.soundFlags |= SOUND_FLAG_DISABLE_CUE;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command48(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    if(*scriptCtx->scriptPtr == 0xFFFF) 
    {
        gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
        scriptCtx->unk4C = 0;
        scriptCtx->unk4D = 0;
        scriptCtx->scriptPtr+=2;
    }
    else 
    {
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
        scriptCtx->unk4C = *scriptCtx->scriptPtr;
        scriptCtx->scriptPtr++;
        scriptCtx->unk4D = *scriptCtx->scriptPtr;
        scriptCtx->scriptPtr++;
    }

    return 0;
}

bool32 Command4A(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    if(*scriptCtx->scriptPtr) 
    {
        if(gMain.process[GAME_PROCESS_STATE] == VERDICT_NOTGUILTY_EXIT) 
        {
            scriptCtx->scriptPtr++;
            return 0;
        }
    }
    else 
    {
        if(gMain.process[GAME_PROCESS_STATE] == VERDICT_DRAW_CONFETTI) 
        {
            scriptCtx->scriptPtr++;
            return 0;
        }
    }
    return 1;
}

bool32 Command4B(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    u32 res;
    u32 r2;
    res = GetMapMarkerIndexFromId(*scriptCtx->scriptPtr >> 8);
    if(res != 0xFF) 
    {
        r2 = (*scriptCtx->scriptPtr & 3) << 12;
        // this clears existing hflip/vflip and sets r2 as new flips
        // the current macros dont allow easily setting this
        gMapMarker[res].attr1 = (gMapMarker[res].attr1 & 0xCFFF) + r2;
    }
    gMapMarker[res].blinkTimer = 0;
    scriptCtx->scriptPtr++;

    return 0;
}

bool32 Command4D(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.previousBG = gMain.currentBG;
    gMain.currentBG = *scriptCtx->scriptPtr;
    gMain.currentBgStripe = 1;
    scriptCtx->scriptPtr++;
    // previously would set and unset bool disableDetentionCenterMaskInDetentionCenter
    if(*scriptCtx->scriptPtr == 0)
        gMain.unk3D |= 1;
    else {
        // ~1 would appears as -2 in the assembly to and with 0xFFFFFFFE instead of 0xFE
        u32 a = gMain.unk3D & ~1;
        gMain.unk3D = a;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command4E(struct ScriptContext *_unused)
{
    u32 temp;
    struct ScriptContext *scriptCtx = &gScriptContext;

    if((scriptCtx->unk12 & 0xFF) == 0) {
        SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
        scriptCtx->unk12 |= *scriptCtx->scriptPtr;
    } else {
        scriptCtx->unk12--;
    }

    if((scriptCtx->unk12 & 0xFF) > 0) {
        return 1;
    }

    SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command4F(struct ScriptContext *_unused)
{
    struct PsycheLockData * psycheLockData;
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.currentPsycheLockDataIndex = *scriptCtx->scriptPtr;
    psycheLockData = &gMain.psycheLockData[gMain.currentPsycheLockDataIndex];
    gMain.psycheLockData[gMain.currentPsycheLockDataIndex].enabled |= 1;

    scriptCtx->scriptPtr++;
    if(*scriptCtx->scriptPtr != 0xFFFF)
        psycheLockData->numLocksRemaining = psycheLockData->numLocksTotal = *scriptCtx->scriptPtr;

    scriptCtx->scriptPtr++;
    if(*scriptCtx->scriptPtr != 0xFFFF)
        psycheLockData->personId = *scriptCtx->scriptPtr;

    scriptCtx->scriptPtr++;
    if(*scriptCtx->scriptPtr != 0xFFFF)
        psycheLockData->roomId = *scriptCtx->scriptPtr;

    scriptCtx->scriptPtr++;
    if(*scriptCtx->scriptPtr != 0xFFFF)
        psycheLockData->startScriptSection = *scriptCtx->scriptPtr;

    scriptCtx->scriptPtr++;
    if(*scriptCtx->scriptPtr != 0xFFFF)
        psycheLockData->cancelScriptSection = *scriptCtx->scriptPtr;

    scriptCtx->scriptPtr++;
    if(*scriptCtx->scriptPtr != 0xFFFF)
        psycheLockData->noHPLeftScriptSection = *scriptCtx->scriptPtr;
    
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command50(struct ScriptContext *_unused)
{
    struct PsycheLockData * psycheLockData;
    struct ScriptContext *scriptCtx = &gScriptContext;
    psycheLockData = &gMain.psycheLockData[*scriptCtx->scriptPtr];
    DmaFill16(3, 0, psycheLockData, sizeof(*psycheLockData));
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command5B(struct ScriptContext *_unused)
{
    u16 var0, var1;
    struct ScriptContext *scriptCtx = &gScriptContext;
    var0 = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    var1 = *scriptCtx->scriptPtr;
    SetInvestigationStateToReturnAfterPsycheLocks(var0, var1);
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command51(struct ScriptContext *_unused)
{
    u32 var0, var1;
    struct ScriptContext *scriptCtx = &gScriptContext;
    var0 = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    var1 = *scriptCtx->scriptPtr;
    SetRoomSeq(var0, var1);
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command52(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.psycheLockStopPresentButtonsActive |= *scriptCtx->scriptPtr;
    SetPsycheLockStopPresentButtonsState(1);
    gScriptContext.scriptPtr++;
    sub_8017154(4);
    return 0;
}

bool32 Command53(struct ScriptContext *_unused)
{
    gMain.psycheLockStopPresentButtonsActive = 0;
    SetPsycheLockStopPresentButtonsState(2);
    return 0;
}

bool32 Command57(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.currentPsycheLockDataIndex = *scriptCtx->scriptPtr;
    BACKUP_PROCESS();
    SET_PROCESS(INVESTIGATION_PROCESS, 10, 9, 0);
    gMain.psycheLockShownByScriptFlag = 1;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command58(struct ScriptContext *_unused)
{
    ClearPsycheLockLocksAndChainsWithoutAnimating();
    gMain.psycheLockShownByScriptFlag = 0;
    return 0;
}

bool32 Command59(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.psycheLockedTalkSections[gMain.numPsycheLockedTalkSections] = gLoadedPsycheLockedTalkSections[*scriptCtx->scriptPtr];
    gMain.numPsycheLockedTalkSections++;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command5A(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    u16 i, j, k;
    for(i = 0; i < gMain.numPsycheLockedTalkSections; i++) {
        if(gMain.psycheLockedTalkSections[i] == gLoadedPsycheLockedTalkSections[*scriptCtx->scriptPtr])
            gMain.psycheLockedTalkSections[i] = 0;
    }
    for(i = 0; i < gMain.numPsycheLockedTalkSections; i++) {
        if(gMain.psycheLockedTalkSections[i] == 0) {
            for(j = i+1, k = i; j < gMain.numPsycheLockedTalkSections; j++, k++) {
                gMain.psycheLockedTalkSections[k] = gMain.psycheLockedTalkSections[j];
            }
        }
    }
    gMain.numPsycheLockedTalkSections--;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command5D(struct ScriptContext *_unused) {
    struct ScriptContext *scriptCtx = &gScriptContext;
    switch(*scriptCtx->scriptPtr) {
        case 0:
            scriptCtx->unk22 &= 0xF0;
            break;
        case 1:
            scriptCtx->unk22 &= 0xF0;
            scriptCtx->unk22 |= 1;
            break;
        case 2:
            scriptCtx->unk22 &= 0xF0;
            scriptCtx->unk22 |= 2;
            break;
        case 3:
            scriptCtx->unk22 |= 0x10;
            break;
        case 4:
            scriptCtx->unk22 &= 0x0F;
            break;
        case 5:
            scriptCtx->unk22 |= 0x20;
            break;
    }
    scriptCtx->scriptPtr++;
    if(scriptCtx->unk22 & 0xF) {
        sub_8017BA8();
        sub_8017BC0();
    }
    return 0;
}

bool32 Command5E(struct ScriptContext *_unused) {
    struct ScriptContext *scriptCtx = &gScriptContext;
    scriptCtx->textColor = (scriptCtx->textColor & 0xF) + (*scriptCtx->scriptPtr << 4);
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command60(struct ScriptContext *_unused)
{
    u32 id;
    struct PsycheLockData * data;
    struct ScriptContext *scriptCtx = &gScriptContext;

    data = &gMain.psycheLockData[*scriptCtx->scriptPtr];
    scriptCtx->scriptPtr++;
    data->validEvidenceIds[0] = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    data->validEvidenceScriptSections[0] = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    data->invalidEvidencePresentedSection = *scriptCtx->scriptPtr;

    data->numValidEvidence = 1;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command61(struct ScriptContext *_unused)
{
    u32 id;
    struct PsycheLockData * data;
    struct ScriptContext *scriptCtx = &gScriptContext;

    data = &gMain.psycheLockData[*scriptCtx->scriptPtr];
    scriptCtx->scriptPtr++;
    data->validEvidenceIds[data->numValidEvidence] = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    data->validEvidenceScriptSections[data->numValidEvidence] = *scriptCtx->scriptPtr;
    data->numValidEvidence++;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command62(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    SetPsycheLockState(8, 0);
    UpdatePsycheLockAnimation();
    gMain.currentBG = 0;
    gMain.psycheLockShownByScriptFlag = 2;
    return 0;
}

bool32 Command63(struct ScriptContext *_unused)
{
    SetPsycheLockState(9, 0);
    UpdatePsycheLockAnimation();
    gMain.psycheLockShownByScriptFlag = 0;
    return 0;
}

bool32 Command64(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    struct PsycheLockData * data;
    data = &gMain.psycheLockData[*scriptCtx->scriptPtr];
    SET_PROCESS(INVESTIGATION_PROCESS, 10, 4, 0);
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command66(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    struct PsycheLockData * data;
    gMain.currentPsycheLockDataIndex = *scriptCtx->scriptPtr;
    data = &gMain.psycheLockData[gMain.currentPsycheLockDataIndex];
    scriptCtx->scriptPtr++;
    data->bgmToPlayAfterStop = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    data->bgmToPlayAfterUnlock = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command67(struct ScriptContext *_unused)
{
    LoadCurrentScriptIntoRam();
    return 0;
}

bool32 Command68(struct ScriptContext *_unused)
{
    gAnimation[1].flags |= 0x400;
    sub_8016FEC(4);
    return 0;
}

bool32 Command69(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    u16 sp00[4];
    sp00[0] = *scriptCtx->scriptPtr >> 8;
    sp00[1] = *scriptCtx->scriptPtr & 0xFF;
    scriptCtx->scriptPtr++;
    sp00[2] = *scriptCtx->scriptPtr >> 8;
    sp00[3] = *scriptCtx->scriptPtr & 0xFF;
    if(sp00[2] >> 3) {
        scriptCtx->unk2E = ((sp00[2] & 0xF0) >> 1) | (scriptCtx->unk2E & 0xF);
        scriptCtx->scriptPtr++;
        return 0;
    }
    scriptCtx->unk2C = sp00[0];
    scriptCtx->unk2D = sp00[1];
    scriptCtx->unk2E &= 0xF0;
    scriptCtx->unk2E |= sp00[2];
    scriptCtx->unk2F = sp00[3];
    if((scriptCtx->unk2E & 0xF) == 1) {
        scriptCtx->scriptPtr--;
        scriptCtx->scriptPtr--;
        op_demo_play_iOS();
        return 1;
    }
    if((scriptCtx->unk2E & 0xF) == 2) {
        op_demo_play_iOS();
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command6A(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    sub_8017AB4(*scriptCtx->scriptPtr);
    return 0;
}

bool32 Command6B(struct ScriptContext *_unused)
{
    gScriptContext.unk46[0] = *gScriptContext.scriptPtr;
    gScriptContext.scriptPtr++;
    gScriptContext.unk46[1] = *gScriptContext.scriptPtr;
    gScriptContext.scriptPtr++;
    gScriptContext.unk46[2] = *gScriptContext.scriptPtr;
    gScriptContext.scriptPtr++;
    return 0;
}

bool32 Command6C(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    if(*scriptCtx->scriptPtr == 0) {
        if(gTalkData[29].talkFlagId[2] == 0xFF) {
            switch(scriptCtx->currentSection) {
            case 0xD9:
                gTalkData[29].iconId[2] = 30;
                gTalkData[29].talkFlagId[2] = 37;
                gTalkData[29].talkSection[2] = 0xDA;
                break;
            case 0xE4:
                gTalkData[29].iconId[2] = 31;
                gTalkData[29].talkFlagId[2] = 38;
                gTalkData[29].talkSection[2] = 0xDB;
                break;
            }
        } else if(gTalkData[29].talkFlagId[3] == 0xFF) {
            switch(scriptCtx->currentSection) {
            case 0xD9:
                if(gTalkData[29].iconId[2] == 30) {
                    scriptCtx->scriptPtr++;
                    return 0;
                }
                break;
            case 0xE4:
                if(gTalkData[29].iconId[2] == 31) {
                    scriptCtx->scriptPtr++;
                    return 0;
                }
                break;
            }
                
            gTalkData[29].iconId[2] = 30;
            gTalkData[29].talkFlagId[2] = 37;
            gTalkData[29].talkSection[2] = 0xDA;
            gTalkData[29].iconId[3] = 31;
            gTalkData[29].talkFlagId[3] = 38;
            gTalkData[29].talkSection[3] = 0xDB;
        }
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command6F(struct ScriptContext *_unused)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    gMain.loopBridgeSection = *scriptCtx->scriptPtr;
    scriptCtx->scriptPtr++;
    return 0;
}

extern u32 sub_801C4E4(void);
extern u32 sub_801C66C(void);

bool32 Command73(struct ScriptContext *_unused)
{
    u8 i;
    struct ScriptContext *scriptCtx = &gScriptContext;
    switch(*scriptCtx->scriptPtr) {
        case 0:
            return sub_801C4E4();
        case 1:
            return sub_801C66C();
        case 2:
            scriptCtx->scriptPtr++;
            gUnknown_030070B0.unk20 = 0;
            for(i = 0; i < 0x10; i++) {
                gUnknown_030070B0.unk00[i] = 0;
            }
            break;
    }
    return 0;
}

extern u8 gUnknown_0802872E[];
extern u16 gUnknown_0802871C[];

u32 sub_801C4E4(void) {
    u8 i;
    struct ScriptContext *scriptCtx = &gScriptContext;
    if((scriptCtx->unk12 & 0xFF) == 0) {
        for(i = 0; i < gUnknown_0802872E[gUnknown_030070B0.unk20]; i++) {
            if(gUnknown_030070B0.unk00[i] == 0) {
                switch(Random() & 0x3) {
                    case 0:
                        gUnknown_030070B0.unk00[i] = 0x1CF;
                        break;
                    case 1:
                        gUnknown_030070B0.unk00[i] = 0x110A;
                        break;
                    case 2:
                        gUnknown_030070B0.unk00[i] = 0x2255;
                        break;
                    case 3:
                        gUnknown_030070B0.unk00[i] = 0x3245;
                        break;
                }
            }
        }
        scriptCtx->unk12++;
        return 1;
    }
    if(gUnknown_030070B0.unk00[(scriptCtx->unk12 & 0xF0) >> 4]) {
        if((scriptCtx->unk12 & 0xF) == 0x8) {
            u32 x;
            u32 c;
            u32 oldColor;
            i = (scriptCtx->unk12 & 0xF0) >> 4;
            oldColor = scriptCtx->textColor;
            scriptCtx->textColor = (gUnknown_030070B0.unk00[i] >> 0xC);
            if(i < 6) {
                c = gUnknown_030070B0.unk00[i] & 0xFFF;
                PutCharInTextbox(c, i * 2 + 2, 0);
                scriptCtx->textColor = 0;
                if(i != 0) {
                    PutCharInTextbox(0xF5, i * 2 + 1, 0);
                }
            } else {
                c = gUnknown_030070B0.unk00[i] & 0xFFF;
                PutCharInTextbox(c, (i - 6) * 2 + 2, 1);
                scriptCtx->textColor = 0;
                if(i != 6) {
                    PutCharInTextbox(0xF5, (i - 6) * 2 + 1, 1);
                }
            }
            scriptCtx->unk12 += 8;
            scriptCtx->textColor = oldColor;
            PlaySE(SE004_TEXT_BLIP_FEMALE);
        }
    } else {
        gUnknown_030070B0.unk20 = 0;
        scriptCtx->scriptPtr++;
        gMain.unk258 = 0;
        gMain.hpBarValue = 0x50;
        gMain.hpBarDisplayValue = 0x50;
        return 0;
    }
    scriptCtx->unk12++;
    return 1;
}

u32 sub_801C66C(void) {
    u8 i;
    u32 oldColor;
    struct ScriptContext *scriptCtx = &gScriptContext;
    if((scriptCtx->unk12 & 0xF0) == 0) {
        if(gMain.unk258 != 99) {
            sub_8019AAC();
            return 1;
        }
        scriptCtx->unk12++;
        if(scriptCtx->unk12 & 4) {
            gMain.hpBarValue--;
            gMain.hpBarDisplayValue = gMain.hpBarValue;
            scriptCtx->unk12 &= ~0xF;
        }
        if(gMain.hpBarValue < 2) {
            SetOrQueueHPBarState(2);
            if(gUnknown_030070B0.unk00[0xB] == 0) {
                return 0;
            }
            return 0;
        }
        if(gUnknown_030070B0.unk20 == 0) {
            gTextBoxCharacters[0].state &= 0x3FFF;
        }
        SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
        if(gUnknown_030070B0.unk00[gUnknown_030070B0.unk20] & 0xFFF) {
            SetOrQueueHPBarState(2);
            if (gUnknown_030070B0.unk00[0xB] == 0) {
                ChangeScriptSection(gUnknown_0802871C[0]);
                return 0;
            }
            return 0;
        }
        
        oldColor = gScriptContext.textColor;
        scriptCtx->textColor = gUnknown_030070B0.unk00[gUnknown_030070B0.unk20] >> 0xC;
        if (gUnknown_030070B0.unk20 < 6) {
            PutCharInTextbox(gUnknown_030070B0.unk00[gUnknown_030070B0.unk20] & 0xFFF, (gUnknown_030070B0.unk20 * 2) + 2, 0);
            scriptCtx->textColor = 0;
            if (gUnknown_030070B0.unk20 != 0) {
                PutCharInTextbox(0xF5, (gUnknown_030070B0.unk20 * 2) + 1, 0);
            }
        } else {
            PutCharInTextbox(gUnknown_030070B0.unk00[gUnknown_030070B0.unk20] & 0xFFF, (gUnknown_030070B0.unk20 - 6) * 2 + 2, 1);
            scriptCtx->textColor = 0;
            if (gUnknown_030070B0.unk20 != 6) {
                PutCharInTextbox(0xF5, ((gUnknown_030070B0.unk20 - 6) * 2) + 1, 1);
            }
        }
        scriptCtx->textColor = oldColor;
        for(i = 0; i < 8; i++) {
            if(gUnknown_0802872E[i] != 0xFF 
            && (gUnknown_030070B0.unk00[gUnknown_0802872E[i]] & 0xFFF) == 0
            && (gUnknown_0802872E[i] - 1) == gUnknown_030070B0.unk20)
            {
                gUnknown_030070B0.unk20 = i + 1;
                scriptCtx->unk12 += 0x10;
                gMain.unk258 = 0;
                PlaySE(0x48);
                return 1;
            }
        }
        gUnknown_030070B0.unk20++;
        PlaySE(0x44);
        return 1;
    }
    if((scriptCtx->unk12 & 0xFF) - 0x10 < 0x10) {
        scriptCtx->unk12++;
        return 1;
    }
    SetOrQueueHPBarState(2);
    if(gMain.unk258 != 99) {
        sub_8019BEC();
        return 1;
    }
    for(i = 0; i < 0x20; i++) {
        gTextBoxCharacters[i].state &= 0x3FFF;
    }
    ChangeScriptSection(gUnknown_0802871C[gUnknown_030070B0.unk20]);
    return 0;
}