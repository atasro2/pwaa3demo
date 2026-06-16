#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "hp_bar.h"
#include "court.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

bool32 Command05(struct ScriptContext * scriptCtx) {
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    FadeInBGM(args[1], args[0]);
    return 0;
}

bool32 Command06(struct ScriptContext * scriptCtx) {
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    if(args[1] & 1)
        PlaySE(args[0]);
    else
        StopSE(args[0]);
    return 0;
}

bool32 Command12(struct ScriptContext * scriptCtx) {
    u16 args[3];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 3);
    StartHardwareBlend(args[0] >> 8, args[0] & 0xFF, args[1], args[2]);
    return 0;
}

bool32 Command16(struct ScriptContext * scriptCtx)
{
    struct Main *main = &gMain;
    main->advanceScriptContext = FALSE;
    main->showTextboxCharacters = FALSE;
    main->hpBarValue += 40;
    if(main->hpBarValue > 80)
        main->hpBarValue = 80;
    // ! address of hpBarValueScenarioEnd is loaded into r3 *before*
    // the below assignment and this forces it for
    // the following hpBarValueScenarioEnd assignment
    main->hpBarValueScenarioEnd = main->hpBarValue;
    main->hpBarDisplayValue = main->hpBarValue;
    main->hpBarValueScenarioEnd = main->hpBarValue;
    SET_PROCESS(COURT_PROCESS, COURT_EXIT, 0, 0);
    gInvestigation.selectedAction = 0;
    gInvestigation.lastAction = 0;
    main->scenarioIdx++;
    PlayBGM(0xE6);
    return 0;
}

bool32 Command17(struct ScriptContext * scriptCtx)
{
    u16 arg;
    u16 evidenceId;
    u16 isProfile;
    s32 evidenceSlot;
    scriptCtx = &gScriptContext;
    arg = *scriptCtx->scriptPtr++;
    evidenceId = arg & 0x3FFF;
    isProfile = arg & 0x8000;
    evidenceSlot = FindEvidenceInCourtRecord(isProfile, evidenceId);
    if(evidenceSlot < 0)
    {
        evidenceSlot = FindFirstEmptySlotInCourtRecord(isProfile);
        if(evidenceSlot >= 0)
        {
            if(isProfile)
            {
                gCourtRecord.profileList[evidenceSlot] = evidenceId;
                gCourtRecord.profileCount++;
            }
            else
            {
                gCourtRecord.evidenceList[evidenceSlot] = evidenceId;
                gCourtRecord.evidenceCount++;
            }
            
            if(arg & 0x4000) // should play animation for getting evidence
            {
                gMain.gottenEvidenceType = isProfile;
                gMain.gottenEvidenceId = evidenceId;
                BACKUP_PROCESS();
                SET_PROCESS(EVIDENCE_ADDED_PROCESS, EVIDENCE_ADD_INIT, 0, 0);
            }
            
        }
    }
    return 0;
}

bool32 Command18(struct ScriptContext * scriptCtx)
{
    u16 arg;
    u16 evidenceId;
    u16 isProfile;
    s32 evidenceSlot;
    scriptCtx = &gScriptContext;
    arg = *scriptCtx->scriptPtr++;
    evidenceId = arg & 0x3FFF;
    isProfile = arg & 0x8000;
    evidenceSlot = FindEvidenceInCourtRecord(isProfile, evidenceId);
    if(evidenceSlot >= 0)
    {
        if(isProfile)
        {
            gCourtRecord.profileList[evidenceSlot] = 0xFF;
        }
        else
        {
            gCourtRecord.evidenceList[evidenceSlot] = 0xFF;
        }
        SortCourtRecordAndSyncListCount(&gCourtRecord);
    }
    return 0;
}

bool32 Command19(struct ScriptContext * scriptCtx)
{
    u16 args[2];
    u16 arg0;
    u16 evidenceId;
    u16 isProfile;
    s32 evidenceSlot;
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    evidenceId = args[0] & 0x3FFF;
    isProfile = args[0] & 0x8000;
    arg0 = args[0];
    evidenceSlot = FindEvidenceInCourtRecord(isProfile, evidenceId);
    if(evidenceSlot >= 0)
    {
        evidenceId = args[1] & 0x3FFF;
        if(isProfile)
        {
            gCourtRecord.profileList[evidenceSlot] = evidenceId;
        }
        else
        {
            gCourtRecord.evidenceList[evidenceSlot] = evidenceId;
        }
        if(arg0 & 0x4000) // should play animation for getting evidence
        {
            gMain.gottenEvidenceType = isProfile;
            gMain.gottenEvidenceId = evidenceId;
            BACKUP_PROCESS();
            SET_PROCESS(EVIDENCE_ADDED_PROCESS, EVIDENCE_ADD_INIT, 0, 0);
        }
    }
    return 0;
}

bool32 Command1A(struct ScriptContext * scriptCtx)
{
    u16 args[4];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 4);
    
    SetCourtScrollPersonAnim(args[0], args[1], args[2], args[3]);
    if(args[1] & 1)
        args[2] = 30;
    else
        args[2] = 0;
    InitCourtScroll(gPalCourtScroll, args[2], 31, args[1]);
    return 0;
}

bool32 Command1B(struct ScriptContext * unused_scriptCtx)
{
    // ! No comments about this absolute stupidity from capcom until now
    // but if you assign gScriptContext to the scriptCtx from 
    // the function argument list then the compiler goes ape shit
    // and causes some optimization to behave differently for some
    // ungodly reason.
    // And here I thought I could get away with not making a new variable
    // for the script context just to be screwed sideways by the compiler and
    // exactly this function.
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct Main * main = &gMain;
    u32 bg;
    if((scriptCtx->unk12 & 0xFF) == 0) {
        bg = *scriptCtx->scriptPtr;
        main->previousBG = main->currentBG;
        main->currentBG = bg;
        main->currentBgStripe = 1;    
        main->unk258 = 0;
        scriptCtx->unk40 = 0x80;
        scriptCtx->unk12 |= 1;
        return 1;
    }
    if(main->currentBgStripe != 0) {
        return 1; // waits until background is loaded
    }
    if(main->currentBgStripe == 0) {
        scriptCtx->scriptPtr++;
        scriptCtx->unk12 &= 0xFF00;
        return 0;
    }
}

bool32 Command1D(struct ScriptContext * scriptCtx)
{
    struct Main * main;
    u16 bits;
    s32 var0;
    s32 var1;
    scriptCtx = &gScriptContext;
    main = &gMain;
    bits = GetBGControlBits(main->currentBG);
    if(bits & 0xF)
        main->isBGScrolling = 1;
    else
        main->isBGScrolling = 0;
    main->unk50 = 0;
    var0 = *scriptCtx->scriptPtr;
    var1 = *scriptCtx->scriptPtr >> 8;
    switch(var1)
    {
        case BG_SHIFT_LEFT:
            main->horizontolBGScrollSpeed = -var0 & 0xFF;
            break;
        case BG_SHIFT_RIGHT:
            main->horizontolBGScrollSpeed = var0 & 0xFF;
            break;
        case BG_SHIFT_UP:
            main->verticalBGScrollSpeed = -var0 & 0xFF;
            break;
        case BG_SHIFT_DOWN:
            main->verticalBGScrollSpeed = var0 & 0xFF;
            break;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command1E(struct ScriptContext * scriptCtx)
{
    u16 args[3];
    struct Main * main;
    scriptCtx = &gScriptContext;
    main = &gMain;
    PULL_ARGS(scriptCtx, args, 3);
    main->talkingAnimationOffset = args[1];
    main->idleAnimationOffset = args[2];
    if(args[0] != 0)
    {
        PlayPersonAnimation(args[0], 0, args[1], 0);
        gInvestigation.personActive = 1;
        SetInactiveActionButtons(&gInvestigation, 15);
    }
    else
    {
        sub_8016FEC(0);
        DestroyAnimation(&gAnimation[1]);
        gInvestigation.personActive = 0;
        SetInactiveActionButtons(&gInvestigation, 15);
    }
    return 0;
}

bool32 Command1F(struct ScriptContext * scriptCtx)
{
    s32 i;
    u32 flags = ~(2 | 4);
    u16 * tilemapBuffer;
    struct Main * main = &gMain;
    gIORegisters.lcd_dispcnt &= ~DISPCNT_BG2_ON;
    gIORegisters.lcd_dispcnt |= DISPCNT_BG3_ON;
    tilemapBuffer = gBG2MapBuffer;
    for(i = 0; i < 0x2A0; i++, tilemapBuffer++)
       *tilemapBuffer = 0;
    gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP; // TODO: add TXT/AFF macro once known which one is used
    gIORegisters.lcd_bg2hofs = 8;
    DestroyAnimation(&gAnimation[1]);
    main->unk3D &= flags;
    return 0;
}

bool32 Command22(struct ScriptContext *scriptCtx)
{
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    // ! STOPSDAPD why 2 ???
    if (args[1])
        FadeOutBGM(args[1]);
    else
        StopBGM();
    return 0;
}

bool32 Command23(struct ScriptContext *scriptCtx)
{
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    // ! STOPSDAPD why 2 ???
    if (args[1])
        UnpauseBGM();
    else
        PauseBGM();
    return 0;
}

bool32 Command24(struct ScriptContext *scriptCtx)
{
    gMain.advanceScriptContext = FALSE;
    gMain.showTextboxCharacters = FALSE;
    SET_PROCESS(2, 0, 0, 0);
    return 0;
}

bool32 Command27(struct ScriptContext *scriptCtx)
{
    struct Main * main;
    u16 args[2];
    scriptCtx = &gScriptContext;
    main = &gMain;
    PULL_ARGS(scriptCtx, args, 2)
    main->shakeTimer = args[0];
    main->gameStateFlags |= 1;
    main->shakeIntensity = args[1];
    return 0;
}

bool32 Command28(struct ScriptContext *scriptCtx)
{
    u16 arg0;
    scriptCtx = &gScriptContext;
    arg0 = *scriptCtx->scriptPtr++;
    if (arg0)
    {
        BACKUP_PROCESS();
        SET_PROCESS(5, 0, 0, 0); // start testimony
    }
    else
    {
        gMain.process[GAME_PROCESS_STATE]++;
    }
    return 0;
}

bool32 Command2F(struct ScriptContext *scriptCtx)
{
    struct Main * main;
    u16 args[2];
    scriptCtx = &gScriptContext;
    main = &gMain;
    PULL_ARGS(scriptCtx, args, 2);
    if (args[1])
        PlayAnimation(args[0]);
    else
        DestroyAnimation(FindAnimationFromAnimId(args[0]));
    return 0;
}

bool32 Command31(struct ScriptContext *scriptCtx)
{
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    StartAnimationBlend(args[0], args[1]);
    return 0;
}

bool32 Command38(struct ScriptContext *scriptCtx)
{
    scriptCtx = &gScriptContext;
    if (*scriptCtx->scriptPtr++)
    {
        ChangeAnimationActivity(&gAnimation[1], 1);
    }
    else
    {
        ChangeAnimationActivity(&gAnimation[1], 0);
    }

    return 0;
}

bool32 Command43(struct ScriptContext * scriptCtx)
{
    scriptCtx = &gScriptContext;
    if(*scriptCtx->scriptPtr++)
        SetOrQueueHPBarState(1);
    else
        SetOrQueueHPBarState(2);
    return 0;
}

bool32 Command44(struct ScriptContext * scriptCtx)
{
    struct OamAttrs *oam;
    struct Main * main;
    u16 arg0;
    u32 i;
    scriptCtx = &gScriptContext;
    main = &gMain;
    oam = &gOamObjects[OAM_IDX_VERDICT_KANJI];
    arg0 = *scriptCtx->scriptPtr++;
    main->affineScale = 0x280;
    BACKUP_PROCESS();
    if(arg0) 
    {
        DmaCopy16(3, gGfxGuilty1, OBJ_VRAM0+0x3400, 0x1000);
        DmaCopy16(3, gPalGuilty, OBJ_PLTT+0xA0, 0x20);
        SET_PROCESS(VERDICT_PROCESS,0,0,0);
    }
    else 
    {
        DmaCopy16(3, gGfxNotGuilty1, OBJ_VRAM0+0x3400, 0x800);
        DmaCopy16(3, gGfxGuiltyNotGuilty2, OBJ_VRAM0+0x3C00, 0x800);
        DmaCopy16(3, gPalNotGuilty, OBJ_PLTT+0xA0, 0x20);
        SET_PROCESS(VERDICT_PROCESS,0,0,1);
    }
    oam->attr0 = SPRITE_ATTR0((~16 & 255), ST_OAM_AFFINE_DOUBLE, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
    oam->attr1 = SPRITE_ATTR1_AFFINE((~16 & 511), 0, 3);
    oam->attr2 = SPRITE_ATTR2(0x1A0, 0, 5);
    oam++;
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    return 0;
}

bool32 Command46(struct ScriptContext * scriptCtx)
{
    struct Main * main;
    s32 i, j;
    u8 *r6;
    u16 *r3;
    u32 flag;
    s32 id;
    s32 xOffset;
    scriptCtx = &gScriptContext;
    main = &gMain;
    flag = *scriptCtx->scriptPtr++;
    id = flag & 0xF;
    switch(id)
    {
        default:
        case 0: // Phoenix Defense?
            main->horizontolBGScrollSpeed = 14;
            r6 = (u8 *)0x0;
            r3 = (u16 *)0x20;
            break;
        case 1: // Edgeworth Prosecution?
            main->horizontolBGScrollSpeed = -14;
            r6 = (u8 *)0x0;
            r3 = (u16 *)0x20;
            break;
        case 2: // Franziska Prosecution?
            main->horizontolBGScrollSpeed = -14;
            r6 = (u8 *)0x0;
            r3 = (u16 *)0x20;
            break;
        case 3: // Mia Defense
            main->horizontolBGScrollSpeed = 14;
            r6 = gPal_BustupMia;
            r3 = (u16 *)gMap_BustupMia;
            break;
        case 4: // Godot Prosecution?
            main->horizontolBGScrollSpeed = -14;
            r6 = 0x0;
            r3 = (u16 *)0x20;
            break;
        // ! No Edgeworth Defense!!!!
    }
    if((flag & 0x10) == 0) {
        u32 flag = 2;
        xOffset = 0;
        main->unk3D |= flag;
    } else {
        u32 flag = 2;
        main->horizontolBGScrollSpeed = 0;
        main->unk3D &= ~flag;
        switch(id)
        {
            case 4:
                xOffset = -0x28;
                break;
            case 0:
                xOffset = 0x30;
                break;
            case 1:
                xOffset = -0x28;
                break;
            case 2:
                xOffset = -0x28;
                break;
            case 3:
                xOffset = 0x30;
                break;
            default:
                xOffset = 0;
        }
        SetAnimationOriginCoords(&gAnimation[1], gAnimation[1].animationInfo.xOrigin - xOffset, gAnimation[1].animationInfo.yOrigin);
    }
    for(i = 0; i < 0x400; i++) {
        gBG2MapBuffer[i] = 0xE080;
    }
    for(i = 0; i < 20; i++) 
    {
        for(j = 0; j < 30; j++, r3++) 
        {
            u32 x = j - xOffset / 8;
            if(x <= 30)
                gBG2MapBuffer[i * 32 + 1 + x] = *r3 + 0x80;
        }
    }
    r6 += 32 + 20*30*2;
    DmaCopy16(3, r6, eVRAMScratchpadBuffer, 30*20*TILE_SIZE_4BPP);
    gIORegisters.lcd_dispcnt |= DISPCNT_BG2_ON;
    gIORegisters.lcd_bg2cnt = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR;
    if(flag & 0x20)
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG3_ON;
    main->unk3D |= 0x4;
    return 0;
}

bool32 Command47(struct ScriptContext *scriptCtx)
{
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    SetBGMVolume(args[0], args[1]);
    return 0;
}

bool32 Command49(struct ScriptContext *scriptCtx)
{
    gMain.advanceScriptContext = FALSE;
    gMain.showTextboxCharacters = FALSE;
    //LoadSaveData();
    //gSaveDataBuffer.main.caseEnabledFlags |= 0x80;
    //SaveGameData();
    SET_PROCESS(TITLE_SCREEN_PROCESS, 0, 0, 0);
    return 0;
}

bool32 Command4C(struct ScriptContext *scriptCtx)
{
    return !!gMain.isBGScrolling;
}

bool32 Command54(struct ScriptContext *scriptCtx)
{
    struct Main * main;
    u16 args[2];
    scriptCtx = &gScriptContext;
    main = &gMain;
    PULL_ARGS(scriptCtx, args, 2);
    switch(args[0]) {
        case 0:
            SetOrQueueHPBarState(args[1]);
            break;
        case 1:
            main->hpBarDisplayFlag = args[1];
            break;
        case 2:
            main->hpBarDamageAmount = args[1];
            break;
        case 3:
            main->hpBarDisplayFlag = 1;
            main->hpBarState = 0;
            ResetHPBarHealthToMax();
    }
    return 0;
}

bool32 Command55(struct ScriptContext *unused_scriptCtx)
{
    struct ScriptContext *scriptCtx = &gScriptContext;
    struct Main * main = &gMain;
    u16 args[2];
    args[0] = scriptCtx->scriptPtr[0];
    args[1] = scriptCtx->scriptPtr[1];
    if((scriptCtx->unk12 & 0xFF) == 0) {
        scriptCtx->unk40 = args[0];
        scriptCtx->unk42 = args[1];
        {
            u32 swap = args[0];
            main->previousBG = main->currentBG;
            main->currentBG = swap;
        }
        main->currentBgStripe = 1;    
        main->unk258 = args[1] + 1;
        scriptCtx->unk12 |= 1;
        return 1;
    }
    if(main->currentBgStripe != 0) {
        return 1; // waits until background is loaded
    }
    if(main->currentBgStripe == 0) {
        scriptCtx->unk12 &= 0xFF00;
        main->currentBG = main->previousBG;
        scriptCtx->scriptPtr += 2;
        return 0;
    }
}
 
bool32 Command56(struct ScriptContext * scriptCtx)
{
    struct Main * main;
    u16 bits;
    u16 arg0;
    s32 var0;
    s32 var1;
    scriptCtx = &gScriptContext;
    main = &gMain;
    bits = GetBGControlBits(main->currentBG);
    if(bits & 0xF)
        main->isBGScrolling = 1;
    else
        main->isBGScrolling = 0;

    arg0 = *scriptCtx->scriptPtr++;
    var0 = arg0;
    var1 = arg0 >> 8;
    switch(var1)
    {
        case BG_SHIFT_LEFT:
            main->horizontolBGScrollSpeed = -var0 & 0xFF;
            break;
        case BG_SHIFT_RIGHT:
            main->horizontolBGScrollSpeed = var0 & 0xFF;
            break;
        case BG_SHIFT_UP:
            main->verticalBGScrollSpeed = -var0 & 0xFF;
            break;
        case BG_SHIFT_DOWN:
            main->verticalBGScrollSpeed = var0 & 0xFF;
            break;
    }
    main->unk50 = *scriptCtx->scriptPtr;
    main->unk50 &= 0xF0;
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command5C(struct ScriptContext *unused_scriptCtx)
{
    struct ScriptContext * scriptCtx;
    struct Main * main;
    scriptCtx = &gScriptContext;
    main = &gMain;
    if((scriptCtx->unk12 & 0xFF) == 0) {
        u16 args[3];
        args[0] = scriptCtx->scriptPtr[0];
        args[1] = scriptCtx->scriptPtr[1];
        args[2] = scriptCtx->scriptPtr[2];
        InitSpecialEffectsWithMosaic(args[0], args[1], args[2]);
        scriptCtx->unk12 |= 1;
        return 1;
    }
    if(!(main->effectType == 0xFFFF || main->effectType == 0))
        return 1;
    scriptCtx->scriptPtr += 3;
    scriptCtx->unk12 &= 0xFF00;
    return 0;
}

bool32 Command5F(struct ScriptContext *unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    u16 args[3];
    args[0] = scriptCtx->scriptPtr[0];
    args[1] = scriptCtx->scriptPtr[1];
    args[2] = scriptCtx->scriptPtr[2];
    InitSpecialEffects(args[0], args[1], args[2]);
    scriptCtx->scriptPtr+=3;
    return 0;
}

bool32 Command65(struct ScriptContext *scriptCtx)
{
    u16 args[2];
    scriptCtx = &gScriptContext;
    PULL_ARGS(scriptCtx, args, 2);
    gMain.currentCourtroomScene = (args[0] << 4) | (args[1] & 0xF);
    switch(args[0]) {
        case 0:
            if(args[1] == 1) {
                LoadWitnessBenchGraphics();
                SetOAMForCourtBenchSpritesWitness(0x18, 0x80, 1);
            } else {
                SetOAMForCourtBenchSpritesWitness(0x18, 0x80, 0);
            }
            break;
        case 1:
            if(args[1] == 1) {
                LoadCounselBenchGraphics();
                SetOAMForCourtBenchSpritesDefense(0, 0x80, 1);
            } else {
                SetOAMForCourtBenchSpritesDefense(0, 0, 0);
            }
            break;
        case 2:
            if(args[1] == 1) {
                LoadCounselBenchGraphics();
                SetOAMForCourtBenchSpritesProsecution(0x20, 0x80, 1);
            } else {
                SetOAMForCourtBenchSpritesDefense(0, 0, 0);
            }
            break;
    }
    return 0;
}

bool32 Command72(struct ScriptContext *scriptCtx) {
    if(gMain.effectType == 0)
        return 0;
    if((gMain.effectType & 0x8000) == 0)
        return 1;
    return 0;
}