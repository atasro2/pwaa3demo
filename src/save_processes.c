#include "global.h"
#include "save.h"
#include "agb_sram.h"
#include "background.h"
#include "graphics.h"
#include "sound.h"
#include "constants/process.h"
#include "constants/songs.h"
#include "constants/oam_allocations.h"

extern void (*gSaveGameProcessStates[])(struct Main *);/* = {
	SaveGameInit1,
	SaveGameInit2,
	SaveGameInitButtons,
	SaveGameWaitForInput,
	SaveGameExitSaveScreen,
	SaveGame5,
	SaveGame6,
	SaveGame7,
	SaveGame8
};
*/
u32 SaveGameData()
{
    u32 mult;
    u32 size;
    gSaveDataBuffer.main.saveContinueFlags |= 0xF0;
    DmaCopy16(3, gSaveVersion, gSaveDataBuffer.saveDataVer, sizeof(gSaveVersion));
    CalculateSaveChecksum();
    mult = 0;
    if(gJoypad.heldKeys & L_BUTTON) {
        mult = 1;
    }
    else if(gJoypad.heldKeys & R_BUTTON) {
        mult = 2;
    }
    // this needs to be here, the size has to be loaded first...
    size = sizeof(gSaveDataBuffer);
    return WriteSramEx((void*)&gSaveDataBuffer, SRAM_START + size * mult, size);
}

u32 LoadSaveData()
{
    u32 i;
    u32 mult;
    char * sramVer;
    mult = 0;
    if(gJoypad.heldKeys & L_BUTTON) {
        mult = 1;
    }
    else if(gJoypad.heldKeys & R_BUTTON) {
        mult = 2;
    }
    ReadSram(SRAM_START + sizeof(gSaveDataBuffer) * mult, (void*)&gSaveDataBuffer, sizeof(gSaveDataBuffer));
    sramVer = gSaveDataBuffer.saveDataVer;
    for(i = 0; i < 0x30; i++)
    {
        if(gSaveVersion[i] != *sramVer)
        {
            gMain.saveContinueFlags = 0;
            return 2;
        }
        sramVer++;
    }
    gMain.caseEnabledFlags = gSaveDataBuffer.main.caseEnabledFlags;
    if(CheckSaveChecksum() == FALSE)
    {
        gMain.saveContinueFlags = 0;
        return 1;
    }
    gMain.saveContinueFlags = 0xF0;
    return 0;
}

void CalculateSaveChecksum()
{
    u8 *saveData;
    u32 magic;
    u32 size;
    gSaveDataBuffer.magic = 0;
    magic = 0;
    size = sizeof(gSaveDataBuffer);
    saveData = (void *) (&gSaveDataBuffer.main);
    while (saveData < (((u8 *) (&gSaveDataBuffer)) + size))
    {
        magic += saveData[0];
        saveData += 4;
    }
    magic += 2343;
    gSaveDataBuffer.magic = magic;
}

bool32 CheckSaveChecksum()
{
    u32 magic = 0;
    u8 * saveData = (u8 *)&gSaveDataBuffer.main;
    while(saveData < (u8 *)&gSaveDataBuffer+sizeof(gSaveDataBuffer))
    {
        magic += *saveData;
        saveData += 4;
    }
    magic += 2343;
    if(magic == gSaveDataBuffer.magic)
    {
        return TRUE;
    }
    return FALSE;
}

void sub_8007238(struct Main *main) {
    u8 scriptsInCaseCleared = 1;
    u8 casesCleared;
    u8 newFlags;

    switch (main->scenarioIdx) {
    case 0 ... 1:
        casesCleared = 1;
        scriptsInCaseCleared += main->scenarioIdx;
        break;
    case 2 ... 6:
        casesCleared = 2;
        scriptsInCaseCleared += main->scenarioIdx - 2;
        break;
    case 7 ... 11:
        casesCleared = 3;
        scriptsInCaseCleared += main->scenarioIdx - 7;
        break;
    case 12 ... 19:
        casesCleared = 4;
        scriptsInCaseCleared += main->scenarioIdx - 12;
        break;
    default:
        return;
    }

    if (gSaveDataBuffer.main.caseEnabledFlags >> 4 <= casesCleared &&
        (gSaveDataBuffer.main.caseEnabledFlags & 0xF) <= scriptsInCaseCleared) {
        LoadSaveData();
        newFlags = (casesCleared << 4) | scriptsInCaseCleared;
        gSaveDataBuffer.main.caseEnabledFlags = newFlags;
        gMain.caseEnabledFlags = newFlags;
        SaveGameData();
    }
}

void ClearSaveProcess(struct Main *main)
{
    struct OamAttrs * oam;
    u32 i;
    u8 * palptr;
    u8 old_unk3D;
    switch (main->process[GAME_PROCESS_STATE])
    {
    case 0:
        i = (u32)GetBGPalettePtr(0);
        DmaCopy16(3, i, PLTT, BG_PLTT_SIZE);
        DmaCopy16(3, gGfxSaveGameTiles, VRAM, 0x1000);
        DmaCopy16(3, gGfxSaveYesNo, OBJ_VRAM0 + 0x3C00, 0x800);
        DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT + 0x120, 0x40);
        DmaCopy16(3, gTextPal, OBJ_PLTT, 0x20);
        DmaCopy16(3, gPalEvidenceProfileDesc, PLTT, 0x20);
        gIORegisters.lcd_bg0cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(28) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        gIORegisters.lcd_bg1cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        gIORegisters.lcd_bg3cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_MOSAIC | BGCNT_256COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        gMain.unk258 = 0;
        old_unk3D = main->unk3D;
        main->unk3D |= 0x40;
        DecompressBackgroundIntoBuffer(6);
        CopyBGDataToVram(6);
        main->unk3D = old_unk3D;
        for(i = 0; i < 0x400; i++)
        {
            gBG2MapBuffer[i] = 0;
        }
        SlideInBG2Window(6, 8);
        gIORegisters.lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
        main->tilemapUpdateBits = 0xC;
        gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        gIORegisters.lcd_bldy = 0x10;
        main->selectedButton = 1;
        StartHardwareBlend(1, 1, 1, 0x1F);
        main->process[GAME_PROCESS_STATE]++;
        break;
    case 1:
        if(main->blendMode == 0)
        {
            UpdateBG2Window(&gCourtRecord);
            if(gCourtRecord.windowScrollSpeed == 0)
            {
                main->advanceScriptContext = TRUE;
                main->showTextboxCharacters = TRUE;
                gScriptContext.currentSection = 0xFFFF;
                ChangeScriptSection(4);
                oam = &gOamObjects[OAM_IDX_SAVE_PROMPT];
                oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_BLEND, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(48, FALSE, FALSE, 3);
                oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 10);
                oam++;
                oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_BLEND, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(128, FALSE, FALSE, 3);
                oam->attr2 = SPRITE_ATTR2(0x200, 0, 10); 
                main->blendCounter = 0;
                main->blendDelay = 1;
                main->blendDeltaY = 0x10;
                gIORegisters.lcd_bldcnt = BLDCNT_TGT2_BG3 | BLDCNT_EFFECT_BLEND;
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0, main->blendDeltaY);
                main->process[GAME_PROCESS_STATE]++;
            }
        }
        break;
    case 2:
        if(gScriptContext.flags & SCRIPT_LOOP)
        {
            if(gJoypad.pressedKeys & (DPAD_RIGHT|DPAD_LEFT))
            {
                PlaySE(0x2A);
                main->selectedButton ^= 1;
            }
            else if(gJoypad.pressedKeys & A_BUTTON)
            {
                PlaySE(0x2B);
                StartHardwareBlend(2, 1, 1, 0x1F);
                main->tilemapUpdateBits = 0;
                main->process[GAME_PROCESS_STATE]++;
            }
        }
        oam = &gOamObjects[OAM_IDX_SAVE_PROMPT];
        if(main->selectedButton == 0)
        {
            oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 9);
            oam++;
            oam->attr2 = SPRITE_ATTR2(0x200, 0, 10);
        }
        else
        {
            oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 10);
            oam++;
            oam->attr2 = SPRITE_ATTR2(0x200, 0, 9);
        }
        if(main->process[GAME_PROCESS_STATE] == 2)
        {
            if(main->blendDeltaY > 0)
            {
                main->blendCounter++;
                if(main->blendCounter >= main->blendDelay)
                {
                    main->blendCounter = 0;
                    main->blendDeltaY--;
                }
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0x10-main->blendDeltaY, main->blendDeltaY);
            }
        }
        break;
    case 3:
        if(main->blendMode == 0)
        {
            main->advanceScriptContext = 0;
            main->showTextboxCharacters = 0;
            if(main->selectedButton == 0)
            {
                DmaFill32(3, 0, &gSaveDataBuffer, sizeof(gSaveDataBuffer));
                WriteSramEx((void*)&gSaveDataBuffer, SRAM_START, sizeof(gSaveDataBuffer));
            }
            SET_PROCESS_PTR(CAPCOM_LOGO_PROCESS, 0, 0, 0, main);
        }
        break;
    default:
        break;
    }
}

void sub_8007610(u8 scenario) {
    struct Main * main = &gMain;
    u8 casesCleared = 1;
    u8 scriptsInCaseCleared = 1;
    u8 i;

    switch (scenario) {
    case 0 ... 1:
        casesCleared = 1;
        scriptsInCaseCleared += main->scenarioIdx;
        break;
    case 2 ... 6:
        casesCleared = 2;
        scriptsInCaseCleared += main->scenarioIdx - 2;
        break;
    case 7 ... 11:
        casesCleared = 3;
        scriptsInCaseCleared += main->scenarioIdx - 7;
        break;
    case 12 ... 19:
        casesCleared = 4;
        scriptsInCaseCleared += main->scenarioIdx - 12;
        break;
    }
    if(main->caseEnabledFlags < (casesCleared << 4))
        main->caseEnabledFlags = casesCleared << 4;
    
    if (main->caseEnabledFlags >> 4 > casesCleared || // if episode has been cleared
        (main->caseEnabledFlags & 0xF) > scriptsInCaseCleared) { // if part of episode has been cleared
        for(i = 0; i < 8; i++) {
            main->sectionReadFlags[i] = 0xFFFFFFFF;
        }
    }
}

void nullsub_11(u32 arg0) {
    
}

#define sIsEpisodePartOver process[GAME_PROCESS_VAR2]

void SaveGameProcess(struct Main *main)
{
    gSaveGameProcessStates[gMain.process[GAME_PROCESS_STATE]](&gMain);
}

void SaveGameInit1(struct Main *main)
{
    struct AnimationListEntry * anim;
    u32 i;
    u32 temp2BA;
    DmaCopy16(3, gBG1MapBuffer, gSaveDataBuffer.bg1Map, sizeof(gBG1MapBuffer));
    DmaCopy16(3, gBG2MapBuffer, gSaveDataBuffer.bg2Map, sizeof(gBG2MapBuffer));
    DmaCopy16(3, gTextBoxCharacters, gSaveDataBuffer.textBoxCharacters, sizeof(gTextBoxCharacters));
    DmaCopy16(3, &gUnknown_030070B0, &gSaveDataBuffer.struct30070B0, sizeof(gUnknown_030070B0));
    DmaCopy16(3, &gScriptContext, &gSaveDataBuffer.scriptCtx, sizeof(gScriptContext));
    DmaCopy16(3, &gIORegisters, &gSaveDataBuffer.ioRegs, sizeof(gIORegisters));
    DmaCopy16(3, gMapMarker, gSaveDataBuffer.mapMarker, sizeof(gMapMarker));
    for(i = 0; i < ARRAY_COUNT(gMapMarker); i++)
    {
        gMapMarker[i].id |= 0xFF;
    }
    SaveAnimationDataToBuffer(gSaveDataBuffer.backupAnimations);
    main->advanceScriptContext = FALSE;
    temp2BA = gMain.currentlyPlayingLoopedSfx;
    StopSE(temp2BA);
    gMain.currentlyPlayingLoopedSfx = temp2BA;
    anim = &gAnimation[1];
    if(anim->animationInfo.personId == 11 || anim->animationInfo.personId == 33) {
        u32 * src;
        u32 * dst;
        dst = gUnknown_0826FE38;
        src = ((u32*)dst)[1] + gUnknown_08252498;
        dst = (u32*)(OBJ_PLTT+0x1A0);
        DmaCopy16(3, src, dst, 0x20);
        anim = sub_8016FB4();
        anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
        anim->flags &= ~ANIM_0x40;
        anim->flags &= ~ANIM_0x80;
    }
    StartHardwareBlend(2, 0, 1, 0x1F);
    main->process[GAME_PROCESS_STATE]++;
    main->process[GAME_PROCESS_VAR1] = 0;
}

void SaveGameInit2(struct Main *main)
{
    struct OamAttrs * oam;
    u32 i;
    u8 old_unk3D;
    if(main->blendMode != 0)
        return;
    DmaCopy16(3, gBG0MapBuffer, gSaveDataBuffer.bg0Map, sizeof(gBG0MapBuffer));
    DmaCopy16(3, &gCourtRecord, &gSaveDataBuffer.courtRecord, sizeof(gCourtRecord));
    DmaCopy16(3, &gInvestigation, &gSaveDataBuffer.investigation, sizeof(gInvestigation));
    DmaCopy16(3, &gTestimony, &gSaveDataBuffer.testimony, sizeof(gTestimony));
    DmaCopy16(3, &gCourtScroll, &gSaveDataBuffer.courtScroll, sizeof(gCourtScroll))
    DmaCopy16(3, gExaminationData, gSaveDataBuffer.examinationData, sizeof(gExaminationData));
    DmaCopy16(3, gTalkData, gSaveDataBuffer.talkData, sizeof(gTalkData));
    DmaCopy16(3, gLoadedPsycheLockedTalkSections, gSaveDataBuffer.loadedPsycheLockedTalkSections, sizeof(gLoadedPsycheLockedTalkSections));
    DmaCopy16(3, gGfxNewGameContinue, OBJ_VRAM0 + 0x3800, 0x400);
    DmaCopy16(3, gPalNewGameContinue, OBJ_PLTT + 0x100, 0xC0);
    DmaCopy16(3, gGfxSaveYesNo, OBJ_VRAM0 + 0x3C00, 0x800);
    DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT + 0x120, 0x40);
    gScriptContext.unk22 = 0;
    main->animationFlags &= ~3;
    oam = gOamObjects;
    for(i = 0; i < MAX_OAM_OBJ_COUNT; i++)
    {
        oam++->attr0 = SPRITE_ATTR0_CLEAR;
    }
    for(i = 0; i < ARRAY_COUNT(gBG2MapBuffer); i++)
    {
        gBG2MapBuffer[i] = 0;
    }
    SlideInBG2Window(6, 8);
    gIORegisters.lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
    main->tilemapUpdateBits = 0xC;
    gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
    gMain.unk258 = 0;
    old_unk3D = main->unk3D;
    main->unk3D |= 0x40;
    DecompressBackgroundIntoBuffer(6);
    CopyBGDataToVram(6);
    main->unk3D = old_unk3D;
    gIORegisters.lcd_bg3vofs = 8;
    gIORegisters.lcd_bg3hofs = 8;
    gIORegisters.lcd_bg1vofs = 0;
    gIORegisters.lcd_bg1hofs = 0;
    main->showTextboxCharacters = FALSE;
    StartHardwareBlend(1, 0, 1, 0x1F);
    main->process[GAME_PROCESS_STATE]++;
}

void SaveGameInitButtons(struct Main *main)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct OamAttrs * oam;
    UpdateBG2Window(&gCourtRecord);
    if(gCourtRecord.windowScrollSpeed == 0) // ?
    {
        main->advanceScriptContext = TRUE;
        main->showTextboxCharacters = TRUE;
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
        gIORegisters.lcd_bg1vofs = 0;
        scriptCtx->textboxState = 0;
        scriptCtx->currentSection = 0xFFFF;
        scriptCtx->textColor = 0;
        if(main->sIsEpisodePartOver)
            ChangeScriptSection(0);
        else
            ChangeScriptSection(1);
        DmaCopy16(3, gGfxSaveYesNo, OBJ_VRAM0 + 0x3C00, 0x800);
        DmaCopy16(3, gUnknown_0818E780, OBJ_VRAM0 + 0x4400, 0xA00);
        DmaCopy16(3, gUnknown_08197404, OBJ_PLTT + 0x1A0, 0x20);
        oam = &gOamObjects[OAM_IDX_SAVE_PROMPT];
        oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_BLEND, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(48, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 10);
        oam++;
        oam->attr0 = SPRITE_ATTR0(96, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_BLEND, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(128, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x200, 0, 10);
        scriptCtx->unk46[0] = 0;
        main->blendCounter = 0;
        main->blendDelay = 1;
        main->blendDeltaY = 0x10;
        gIORegisters.lcd_bldcnt = BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG3;
        gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0, main->blendDeltaY);
        if(main->sIsEpisodePartOver)
            main->selectedButton = 0;
        else
            main->selectedButton = 1;
        main->process[GAME_PROCESS_STATE]++;
    }
}

void SaveGameWaitForInput(struct Main *main)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct OamAttrs * oam;
    s32 temp;
    if(scriptCtx->unk46[0] == 2 && (scriptCtx->flags & SCRIPT_LOOP))
    {
        if(gJoypad.pressedKeys & (DPAD_RIGHT | DPAD_LEFT))
        {
            main->selectedButton ^= 1;
            PlaySE(SE000_MENU_CHANGE);
        }
        else if(gJoypad.pressedKeys & A_BUTTON)
        {
            PlaySE(SE016_CONFIRM_SAVE);
            if(main->selectedButton == 0)
            {
                if(main->sIsEpisodePartOver)
                    gSaveDataBuffer.main.saveContinueFlags &= 0xF0;
                else
                    gSaveDataBuffer.main.saveContinueFlags |= 0x1;
                if(SaveGameData())
                {
                    gScriptContext.currentSection = 0xFFFF;
                    ChangeScriptSection(3);
                    main->process[GAME_PROCESS_STATE] = 6;
                    return;
                }
                if(!main->sIsEpisodePartOver)
                {
                    gScriptContext.currentSection = 0xFFFF;
                    ChangeScriptSection(6);
                    main->blendCounter = 0;
                    main->blendDelay = 1;
                    main->blendDeltaY = 0;
                }
            }
            scriptCtx->unk46[0] = 0;
            scriptCtx->unk46[1] = 0;
            scriptCtx->unk46[2] = 1;
            main->process[GAME_PROCESS_STATE] = 8;
            main->process[GAME_PROCESS_VAR1] = 0;
            return;
        }
        else if(!main->sIsEpisodePartOver && gJoypad.pressedKeys & B_BUTTON)
        {
            PlaySE(SE002_MENU_CANCEL);
            main->selectedButton = 1;
            scriptCtx->unk46[0] = 0;
            scriptCtx->unk46[1] = 0;
            scriptCtx->unk46[2] = 1;
            main->process[GAME_PROCESS_STATE] = 8;
            main->process[GAME_PROCESS_VAR1] = 0;
            return;
        }
    }
    if (main->blendDeltaY == 0) {
        if (scriptCtx->unk46[0] == 0) {
            u32 attr2;
            oam = &gOamObjects[OAM_IDX_SAVE_PROMPT+2];
            oam->attr0 = 0x4480;
            oam->attr1 = 0xC028;
            attr2 = 0x80000 + 0x220;
            oam->attr2 = attr2 + 0xD000;
            oam++;
            oam->attr0 = 0x4480;
            oam->attr1 = 0xC068;
            oam->attr2 = attr2 + 0x20 + 0xD000;
            oam++;
            oam->attr0 = 0x4480;
            oam->attr1 = 0x40A8;
            oam->attr2 = attr2 + 0x40 + 0xD000;
            oam++;
            oam->attr0 = 0x4490;
            oam->attr1 = 0x40A8;
            oam->attr2 = attr2 + 0x44 + 0xD000;
            oam++;
            oam->attr0 = 0x4488;
            oam->attr1 = 0x40A8;
            oam->attr2 = attr2 + 0x48 + 0xD000;
            oam++;
            oam->attr0 = 0x4498;
            oam->attr1 = 0x40A8;
            oam->attr2 = attr2 + 0x4C + 0xD000;
            scriptCtx->unk46[0] = 1;
            main->blendCounter = 0;
            main->blendDelay = 1;
            main->blendDeltaY = 0x10;
            gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0x10 - main->blendDeltaY, main->blendDeltaY);
        } else if (scriptCtx->unk46[0] == 1) {
            scriptCtx->unk46[0] = 2;
        }
    }
    temp = scriptCtx->unk46[0] == 1 ? 0x4000 : 0x4400;
    oam = &gOamObjects[OAM_IDX_SAVE_PROMPT];
    if(main->selectedButton == 0)
    {
        oam->attr0 = temp + 96;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(48, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 9);
        oam++;
        oam->attr0 = temp + 96;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(128, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x200, 0, 10);
    }
    else
    {
        oam->attr0 = temp + 96;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(48, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x1E0, 0, 10);
        oam++;
        oam->attr0 = temp + 96;
        oam->attr1 = SPRITE_ATTR1_NONAFFINE(128, FALSE, FALSE, 3);
        oam->attr2 = SPRITE_ATTR2(0x200, 0, 9);
    }
    if(main->process[GAME_PROCESS_STATE] == 3)
    {
        if(main->blendDeltaY > 0)
        {
            main->blendCounter++;
            if(main->blendCounter >= main->blendDelay)
            {
                main->blendCounter = 0;
                main->blendDeltaY--;
            }
            gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0x10 - main->blendDeltaY, main->blendDeltaY);
        }
    }
}

void SaveGameExitSaveScreen(struct Main * main) {
    struct AnimationListEntry * anim;
    u32 i;
    
    if(main->blendMode != 0)
        return;
    if(main->selectedButton == 0)
    {
        SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 0, 0, 0, main);
        return;
    }
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
    for(i = 0; i < 12; i++) {
        main->bgStripeOffsets[i] = gSaveDataBuffer.main.bgStripeOffsets[i];
    }
    DmaCopy16(3, gSaveDataBuffer.bg2Map, gBG2MapBuffer, sizeof(gBG2MapBuffer));
    DmaCopy16(3, gSaveDataBuffer.textBoxCharacters, gTextBoxCharacters, sizeof(gTextBoxCharacters));
    RedrawTextboxCharacters();
    DmaCopy16(3, &gSaveDataBuffer.struct30070B0, &gUnknown_030070B0, sizeof(gUnknown_030070B0));
    DmaCopy16(3, &gSaveDataBuffer.scriptCtx, &gScriptContext, sizeof(gScriptContext));
    DmaCopy16(3, &gSaveDataBuffer.ioRegs, &gIORegisters, sizeof(gIORegisters));
    DmaCopy16(3, gSaveDataBuffer.mapMarker, gMapMarker, sizeof(gMapMarker));
    DmaCopy16(3, gSaveDataBuffer.talkData, gTalkData, sizeof(gTalkData));
    DmaCopy16(3, gSaveDataBuffer.loadedPsycheLockedTalkSections, gLoadedPsycheLockedTalkSections, sizeof(gLoadedPsycheLockedTalkSections));
    main->advanceScriptContext = gSaveDataBuffer.main.advanceScriptContext;
    main->showTextboxCharacters = gSaveDataBuffer.main.showTextboxCharacters;
    main->gameStateFlags = gSaveDataBuffer.main.gameStateFlags;
    main->shakeTimer = gSaveDataBuffer.main.shakeTimer;
    main->tilemapUpdateBits = gSaveDataBuffer.main.tilemapUpdateBits;
    loadSectionReadFlagsFromSaveDataBuffer(main);
    RestoreAnimationsFromBuffer(gSaveDataBuffer.backupAnimations);
    if (main->process[GAME_PROCESS_STATE] != 8 || main->process[GAME_PROCESS_VAR1] != 6) {
        sub_8017154(3);
    }
    gMain.animationFlags |= 3;
    DmaCopy16(3, gSaveDataBuffer.oam, gOamObjects, sizeof(gOamObjects));
    DmaCopy16(3, &gPalExamineCursors[0], OBJ_PLTT+0x100, 0x20);
    main->soundFlags = gSaveDataBuffer.main.soundFlags;
    if (gMain.unk3D & 8) {
        gMain.unk3D |= 0x10;
    }
    i = gMain.Bg256_dir;
    DecompressBackgroundIntoBuffer(main->currentBG);
    CopyBGDataToVramAndScrollBG(main->currentBG);
    if (gScriptContext.unk40 != 0x80) {
        gMain.unk258 = gScriptContext.unk42 + 1;
        gMain.previousBG = gMain.currentBG;
        gMain.currentBG = gScriptContext.unk40;
        DecompressBackgroundIntoBuffer(gScriptContext.unk40);
        if (gMain.unk258 == 5) {
            sub_800482C(gMain.currentBG);
        }
        gMain.unk258 = 0;
        gMain.currentBG = gMain.previousBG;
        sub_8004940(gMain.currentBG, i);
        gMain.Bg256_dir = gSaveDataBuffer.main.Bg256_dir;
        gMain.currentBgStripe = 0;
    }
    gScriptContext.flags &= 0xFFF7;
    RESTORE_PROCESS_PTR(main);
    if (main->process[GAME_PROCESS] == INVESTIGATION_PROCESS && main->process[GAME_PROCESS_VAR1] == 3) {
        if (main->process[GAME_PROCESS_STATE] == INVESTIGATION_MOVE) {
            LoadLocationChoiceGraphics();
        } else if (main->process[GAME_PROCESS_STATE] == INVESTIGATION_TALK) {
            LoadTalkChoiceGraphics();
        }
    }
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
    if(gMain.currentlyPlayingLoopedSfx != 0)
        PlaySE(gMain.currentlyPlayingLoopedSfx);
    anim = &gAnimation[1];
    if(anim->animationInfo.personId == 11 || anim->animationInfo.personId == 33) {
        u32 * src;
        u32 * dst;
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
    FadeInBGM(0x1E, 0xFF); // unpause BGM
    StartHardwareBlend(1, 0, 1, 0x1F);
}

void SaveGame5(struct Main *main)
{
    u32 showNewEpisode;
    u32 newEpisodeId;
    if(main->blendMode != 0)
        return;

    if(main->scenarioIdx == 2)
    {
        newEpisodeId = 1;
        showNewEpisode = TRUE;
    }
    else if(main->scenarioIdx == 7)
    {
        newEpisodeId = 2;
        showNewEpisode = TRUE;
    }
    else if(main->scenarioIdx == 12)
    {
        newEpisodeId = 3;
        showNewEpisode = TRUE;
    }
    else
        showNewEpisode = FALSE;

    if(showNewEpisode)
    {
        main->advanceScriptContext = 0;
        main->showTextboxCharacters = 0;
        SET_PROCESS_PTR(EPISODE_SELECT_PROCESS, 1, 0, newEpisodeId, main);
        return;
    }
    gIORegisters.lcd_dispcnt = 0;
    gScriptContext.currentSection = 0x80;
    SET_PROCESS_PTR(gCaseStartProcess[main->scenarioIdx], 0, 0, 0, main);
}

void SaveGame6(struct Main * main)
{
    if(gScriptContext.flags & SCRIPT_LOOP && gJoypad.pressedKeys & A_BUTTON)
    {
        main->advanceScriptContext = 1;
        main->showTextboxCharacters = 1;
        gScriptContext.currentSection = 0xFFFF;
        if(main->sIsEpisodePartOver)
            ChangeScriptSection(0);
        else
            ChangeScriptSection(1);
        main->blendCounter = 0;
        main->blendDelay = 1;
        main->blendDeltaY = 0x10;
        gIORegisters.lcd_bldcnt = BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG3;
        gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0, main->blendDeltaY);
        if(main->sIsEpisodePartOver)
            main->selectedButton = 0;
        else
            main->selectedButton = 1;
        main->process[GAME_PROCESS_STATE] = 3;
    }
    else
    {
        u16 i;
        for(i = 0; i < 8; i++) {
            struct OamAttrs * oam = &gOamObjects[OAM_IDX_SAVE_PROMPT + i];
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        }
    }
}

void SaveGame7(struct Main* main) {
    u16 i;
    u32 temp;
    if (main->blendMode == 0) {
        if (--main->process[2]) {
            for(i = 0; i < 8; i++) {
                struct OamAttrs * oam = &gOamObjects[OAM_IDX_SAVE_PROMPT + i];
                oam->attr0 = SPRITE_ATTR0_CLEAR;
            }
            if (main->sIsEpisodePartOver) {
                main->process[GAME_PROCESS_STATE] = 5;
            } else {
                main->process[GAME_PROCESS_STATE] = 4;
            }
            main->process[GAME_PROCESS_VAR1] = 0;
        }
    }
}

void SaveGame8(struct Main * main) {
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_SAVE_PROMPT + main->selectedButton];

    if (++scriptCtx->unk46[0] > 60) {
        oam->attr0 &= ~0x200;
        if (scriptCtx->unk46[0] > 80) {
            StartHardwareBlend(2, 0, 1, 0x1F);
            if (main->sIsEpisodePartOver) {
                main->process[GAME_PROCESS_VAR1] = 60;
            } else {
                main->process[GAME_PROCESS_VAR1] = 20;
            }
            main->process[GAME_PROCESS_STATE] = 7;
        }
    } else {
        if (++scriptCtx->unk46[1] > 3) {
            scriptCtx->unk46[1] = 0;
            scriptCtx->unk46[2]  ^= 1;
            if (scriptCtx->unk46[2] == 0) {
                oam->attr0 |= 0x200;
            } else {
                oam->attr0 &= ~0x200;
            }
        }
    }
}

#undef sIsEpisodePartOver
