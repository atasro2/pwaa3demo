#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "hp_bar.h"
#include "constants/songs.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

void sub_8019AAC(void) {
    struct Main * main = &gMain;
    struct AnimationListEntry * anim;
    switch(main->unk258) {
        case 0:
            PlayAnimation(0x55);
            PlaySE(SE029_BEGIN_QUESTIONING);
            main->unk258 = 1;
            break;
        case 1:
            anim = FindAnimationFromAnimId(0x55);
            anim->animationInfo.xOrigin -= 10;
            anim->flags |= ANIM_ACTIVE; // why would you need to activate the animation after playing?
            if(anim->animationInfo.xOrigin <= 88) {
                anim->animationInfo.xOrigin = 88;
                StartHardwareBlend(3, 1, 8, 0x1F);
                main->unk258 = 2;
                main->unk259 = 0;
            }
            break;
        case 2:
            if(main->unk259++ > 20) {
                main->unk258 = 3;
                main->unk259 = 0;
            }
            break;
        case 3:
            anim = FindAnimationFromAnimId(0x55);
            anim->animationInfo.xOrigin -= 10;
            anim->flags |= ANIM_ACTIVE; // why would you need to activate the animation after playing?
            if(anim->animationInfo.xOrigin <= -32) {
                DestroyAnimation(anim);
                main->unk258 = 4;
            }
            break;
        case 4:
            SetOrQueueHPBarState(1);
            main->unk258 = 5;
            break;
        case 5:
            if(IsHPBarAnimating() != TRUE) {
                gMain.showTextboxCharacters = TRUE; // ! inconsistent blah blah
                gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
                PlaySE(0x57);
                main->unk258 = 99;
            }
            break;
    }
}

void sub_8019BEC(void) {
    struct Main * main = &gMain;
    struct AnimationListEntry * anim;
    switch(main->unk258) {
        case 0:
            PlayAnimation(0x6A);
            main->unk258 = 1;
            break;
        case 1:
            anim = FindAnimationFromAnimId(0x6A);
            anim->flags |= 0x200000;
            anim->spritePriorityMatrixIndex = 0;
            anim->animationInfo.xOrigin = 56;
            anim->animationInfo.yOrigin = 48;
            main->affineScale = Q_8_8(2);
            gOamObjects[0].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
            gOamObjects[1].attr3 = fix_mul(_Sin(0), fix_inverse(main->affineScale));
            gOamObjects[2].attr3 = fix_mul(-_Sin(0), fix_inverse(main->affineScale));
            gOamObjects[3].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
            main->unk258 = 2;
            break;
        case 2:
            main->affineScale -= 0x10; // 1/16 steps
            if(main->affineScale <= Q_8_8(1)) {
                gOamObjects[0].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
                gOamObjects[1].attr3 = fix_mul(_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[3].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
                anim = FindAnimationFromAnimId(0x6A);
                anim->flags &= ~0x200000;
                anim->animationInfo.xOrigin = 88;
                anim->animationInfo.yOrigin = 64;
                StartHardwareBlend(3, 1, 8, 0x1F);
                main->unk259 = 0;
                main->unk258 = 3;
            } else {
                gOamObjects[0].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
                gOamObjects[1].attr3 = fix_mul(_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[3].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
            }
            break;
        case 3:
            if(main->unk259++ > 40) {
                main->unk259 = 0;
                main->unk258 = 4;
            }
            break;
        case 4:
            anim = FindAnimationFromAnimId(0x6A);
            anim->animationInfo.yOrigin -= 10;
            if(anim->animationInfo.yOrigin <= -32) {
                DestroyAnimation(anim);
                main->unk258 = 99;
            }
            break;
    }
}

void sub_8019E98(u16 color) {
    u8 glyphBuf[0x80];
    uintptr_t glyphGfx;
    u32 color2;
    u32 x;
    u32 y;
    u32 i;

    for(i = 0; i < 32; i++)
    {
        glyphGfx = gTextBoxCharacters[i].state;
        glyphGfx &= 0xFFF;
        x = i % 16;
        y = (i / 16) % 16;
        glyphGfx *= 0x80;
        glyphGfx += (uintptr_t)gCharSet;
        if(color)
            color2 = color;
        else
            color2 = gTextBoxCharacters[i].color2;
        if(color2) {
            u32 j;
            u8 * vram;
            u8 * pixel;
            DmaCopy16(3, glyphGfx, glyphBuf, 0x80);
            pixel = glyphBuf;
            glyphGfx = color2 * 3;
            for(j = 0; j < 0x80; j++)
            {
                u32 pixelLeft, pixelRight;
                pixelLeft = pixelRight = *pixel;
                pixelLeft &= 0xF;
                pixelRight &= 0xF0;
                if(pixelLeft)
                    pixelLeft += glyphGfx;
                if(pixelRight)
                    pixelRight += glyphGfx << 4;
                *pixel++ = pixelLeft | pixelRight;
            }
            DmaCopy16(3, glyphBuf, OBJ_VRAM0 + x * 0x80 + 0x80 * (y * 16), 0x80);
        } else {
            DmaCopy16(3, glyphGfx, OBJ_VRAM0 + x * 0x80 + 0x80 * (y * 16), 0x80);
        }
    }
}

const struct MapMarkerSprite sMapMarkerSprites[] = {
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x0000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x0000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x4000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x4000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x0000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = (u8*)0x800,
        .size = 0x800,
        .attr0 = 0x0200,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x0000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x4000,
        .attr1 = 0x8000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x4000,
        .attr1 = 0x8000,
        .attr2 = 0x0000,
    },
    {
        .tiles = (u8*)0x800,
        .size = 0x800,
        .attr0 = 0x0200,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
    {
        .tiles = 0,
        .size = 0,
        .attr0 = 0x0000,
        .attr1 = 0x4000,
        .attr2 = 0x0000,
    },
};

void MakeMapMarkerSprites()
{
    u32 i = 0;
    u32 id;
    struct MapMarker *mapMarker;
    struct OamAttrs *oam;
    for (i = 0; i < 8; i++)
    {
        if (gMapMarker[i].id == 0xFF)
            continue;

        id = gMapMarker[i].id;
        DmaCopy16(3, sMapMarkerSprites[id].tiles, (gMapMarker + i)->vramPtr, sMapMarkerSprites[id].size);
        mapMarker = &gMapMarker[i];
        if (!(mapMarker->flags & 4))
        {
            oam = &gOamObjects[mapMarker->oamIdx];
            oam->attr0 = mapMarker->attr0;
            oam->attr1 = mapMarker->attr1;
            oam->attr2 = mapMarker->attr2;
        }

        if (mapMarker->id)
            ; // needed for matching wtf
    }
}

u32 GetMapMarkerIndexFromId(u32 id) // GetExplCharWorkIndexById
{
    u32 i = 0;
    do
    {
        if (gMapMarker[i].id == id)
            return i;
        i++;
    } while (i < ARRAY_COUNT(gMapMarker));
    return 0xFF;
}

u8 * sub_801A018(void) // get vram address for marker
{
    u32 i = 0;
    u32 id;
    struct MapMarker *mapMarker;
    struct OamAttrs *oam;
    u8 * vramPtr = OBJ_VRAM0 + 0x1800;
    for (i = 0; i < 8; i++)
    {
        if (gMapMarker[i].id == 0xFF)
            continue;
        vramPtr += sMapMarkerSprites[gMapMarker[i].id].size;    
    }
    return vramPtr;
}

extern const u8 gUnknown_08028736[];
void sub_801A054(void) {
    if((gScriptContext.unk12 & 0xFF) == 0x28) {
        gScriptContext.unk12 &= 0xFF00;
        gScriptContext.unk12 += 1;
    }
    if(gMain.showTextboxCharacters == TRUE && gScriptContext.textboxState == 0) {
        gBG1MapBuffer[622] = gUnknown_08028736[(gScriptContext.unk12 & 0xFF) / 8];
        gBG1MapBuffer[623] = gUnknown_08028736[(gScriptContext.unk12 & 0xFF) / 8] + 1;
    }
}

bool32 Command00(struct ScriptContext * scriptCtx) {
    u8 i;
    scriptCtx = &gScriptContext;
    scriptCtx->textColor = 0;
    for(i = 0; i < 32; i++) {
        gTextBoxCharacters[i].state &= 0x3FFF;
    }
    return 0;
}

bool32 Command01(struct ScriptContext * scriptCtx)
{
    scriptCtx = &gScriptContext;
    scriptCtx->unk28 = 0;
    scriptCtx->unk29++;

    if(scriptCtx->unk22 & 0x20)
    {
        scriptCtx->unk22 &= ~0x20;
        scriptCtx->textColor = 0;
    }

    if(scriptCtx->unk22 & 0xF)
    {
        sub_8017BC0(); // possibly designed for proper centering
    }

    return 0;
}

void sub_801A148(u32 arg0) { // ! Unused
    u32 evidenceId = arg0 & 0x3FFF;
    u32 isProfile = arg0 & 0x8000;
    s32 evidenceSlot = FindEvidenceInCourtRecord(isProfile, evidenceId);
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
        }
    }
}

bool32 Command02(struct ScriptContext * unused_scriptCtx) {
    u16 i;
    struct ScriptContext * scriptCtx = &gScriptContext;
    scriptCtx->flags |= SCRIPT_x1;
    if(gMain.process[GAME_PROCESS_STATE] != TESTIMONY_MAIN && gMain.process[GAME_PROCESS] == TESTIMONY_PROCESS)
        return 1;
    if(gMain.process[GAME_PROCESS_STATE] != QUESTIONING_MAIN && gMain.process[GAME_PROCESS] == QUESTIONING_PROCESS)
        return 1; 
    if(gMain.process[GAME_PROCESS] == COURT_RECORD_PROCESS)
        return 1;
    if(gMain.process[GAME_PROCESS] == EVIDENCE_ADDED_PROCESS)
        return 1;
    if ((scriptCtx->unk12 & 0xFF) == 0) {
        SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
        scriptCtx->unk12++;
        return 1;
    }
    scriptCtx->unk12++;
    sub_801A054();
    if(scriptCtx->unk12 & SCRIPT_x8000) {
        if(gJoypad.pressedKeys & A_BUTTON) {
            DmaCopy16(3, gSaveDataBuffer.textBoxCharacters+3, gTextBoxCharacters, sizeof(gTextBoxCharacters));
            sub_8019E98(0);
            scriptCtx->unk12 &= ~SCRIPT_x8000;
        }
        return 1;
    }
    scriptCtx->flags &= ~SCRIPT_SKIP;
    if(scriptCtx->flags & SCRIPT_SECTION_READ && gJoypad.heldKeys & B_BUTTON) {
        scriptCtx->flags |= SCRIPT_SKIP;
    }
    if(scriptCtx->flags & SCRIPT_SKIP && (scriptCtx->unk12 & 0xFF) < 8) {
        return 1;
    }
    if((gJoypad.pressedKeys & A_BUTTON) || (scriptCtx->flags & SCRIPT_SKIP || scriptCtx->flags & SCRIPT_x4000)) {
        DmaCopy16(3, gTextBoxCharacters, gUnknown_03007180, sizeof(gTextBoxCharacters));
        scriptCtx->soundCueSkip = 2;
        scriptCtx->flags &= ~SCRIPT_SKIP;
        scriptCtx->flags &= ~SCRIPT_x4000;
        if(scriptCtx->unk22 & 0x20) {
            scriptCtx->unk22 &= ~0x20;
            scriptCtx->textColor = 0;
        }
        scriptCtx->flags &= ~SCRIPT_x1;
        scriptCtx->flags &= ~SCRIPT_LOOP;
        PlaySE(SE005_TEXT_ADVANCE);
        if(scriptCtx->textboxState == 0) {
            gBG1MapBuffer[622] = 9;
            gBG1MapBuffer[623] = 9;
        } else {
            gBG1MapBuffer[622] = 0;
            gBG1MapBuffer[623] = 0;
        }
        if(scriptCtx->currentToken == 0xA) {
            ChangeScriptSection(*scriptCtx->scriptPtr);
        } else if(scriptCtx->currentToken == 0x2) {
            SetAnimationFrameOffset(&gAnimation[1], gMain.talkingAnimationOffset);
        } else if(scriptCtx->currentToken == 0x7) {
            gMain.showTextboxCharacters = FALSE;
            sub_8016D6C();
            scriptCtx->flags |= SCRIPT_FULLSCREEN;
            scriptCtx->unk28 = 0;
            scriptCtx->unk29++;
            if(gMain.process[GAME_PROCESS] != INVESTIGATION_PROCESS) {
                sub_8017154(1);
            } else {
                sub_8017154(4);
            }
            DmaCopy16(3, &((u8*)gCharSet)[226*0x80], OBJ_VRAM0 + 0x1F80, 0x80);
            if(scriptCtx->unk22 & 0xF) {
                sub_8017BC0();
            }
            for(i = 0; i < 0x40; i++) {
                gTextBoxCharacters[i].y += 18;
            }
            sub_80051CC(1);
            scriptCtx->scriptPtr++;
            return 1;
        }
        scriptCtx->unk12 &= ~0xFF;
        for(i = 0; i < 0x40; i++) {
            gTextBoxCharacters[i].state &= 0x3FFF;
        }
        scriptCtx->unk28 = 0;
        scriptCtx->unk29 = 0;
        if(scriptCtx->unk22 & 0xF) {
            sub_8017BA8();
            sub_8017BC0();
        }
        scriptCtx->scriptPtr++;
    }
    return 1;
}

bool32 Command03(struct ScriptContext * scriptCtx)
{
    scriptCtx = &gScriptContext;
    scriptCtx->textColor = *scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command04(struct ScriptContext * scriptCtx)
{
    scriptCtx = &gScriptContext;
    if(gJoypad.pressedKeys & *scriptCtx->scriptPtr) // ! This is bugged since it doesn't increment the ptr when returning 0
        return 0;
    return 1;
}

bool32 Command08(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct OamAttrs * oam;
    u16 i;
    scriptCtx->flags |= SCRIPT_FULLSCREEN;
    scriptCtx->flags |= SCRIPT_x1;
    if(scriptCtx->textboxState)
        return 1;
    if(gMain.process[GAME_PROCESS] == COURT_RECORD_PROCESS)
        return 1;
    if ((scriptCtx->unk12 & 0xFF) == 0) {
        scriptCtx->unk12 |= 1;
        if(sub_8016ED8()) {
            SetOrQueueHPBarState(7);
        }
        return 1;
    }
    if(gJoypad.pressedKeys & DPAD_UP) {
        PlaySE(SE000_MENU_CHANGE);
        scriptCtx->unk12--;
        if ((scriptCtx->unk12 & 0xFF) == 0) {
            if(scriptCtx->currentToken == 8) {
                scriptCtx->unk12 &= ~0xFF;
                scriptCtx->unk12 += 2;
            } else {
                scriptCtx->unk12 &= ~0xFF;
                scriptCtx->unk12 += 3;
            }
        }
        gOamObjects[OAM_IDX_GENERAL_2].attr2 -= 1;
    }
    if(gJoypad.pressedKeys & DPAD_DOWN) {
        PlaySE(SE000_MENU_CHANGE);
        scriptCtx->unk12++;
        if(scriptCtx->currentToken == 8) {
            if ((scriptCtx->unk12 & 0xFF) == 3) {
                scriptCtx->unk12 &= ~0xFF;
                scriptCtx->unk12 += 1;
            }
        } else {
            if ((scriptCtx->unk12 & 0xFF) == 4) {
                scriptCtx->unk12 &= ~0xFF;
                scriptCtx->unk12 += 1;
            }
        }
    }
    if(gJoypad.pressedKeys & A_BUTTON) {
        PlaySE(SE001_MENU_CONFIRM);
        sub_8016D6C();
        scriptCtx->flags &= ~SCRIPT_FULLSCREEN;
        scriptCtx->flags &= ~SCRIPT_x1;
        scriptCtx->flags &= ~SCRIPT_SKIP;
        if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS) {
            sub_8017154(0);
        }
        if(gAnimation[1].animationInfo.personId == 0xB || gAnimation[1].animationInfo.personId == 0x21)
        {
            if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS) {
                oam = &gOamObjects[48];
                for(i = 32; i < 64; i++) {
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                    oam++;
                }
            }
        }
        i = 0;
        oam = &gOamObjects[OAM_IDX_TEXT];
        for(; i < 32; i++) {
            gTextBoxCharacters[i].state &= 0x3FFF;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
        i = 32;
        oam = &gOamObjects[OAM_IDX_TEXT_FULLSCREEN];
        for(; i < 64; i++) {
            gTextBoxCharacters[i].state &= 0x3FFF;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
        gOamObjects[OAM_IDX_GENERAL_2].attr0 = SPRITE_ATTR0_CLEAR;
        scriptCtx->unk28 = 0;
        scriptCtx->unk29 = 0;
        if(scriptCtx->unk22 & 0xF) {
            sub_8017BA8();
            sub_8017BC0();
        }
        sub_80051CC(0);
        gIORegisters.lcd_dispcnt &= ~DISPCNT_BG1_ON;
        MoveSpritesToOAM();
        // ! this code is technically bugged but the ChangeScriptSection correct it
        // ! what the fuck is with the 10
        for(i = 1; i < 10; i++) {
            if((scriptCtx->unk12 & 0xFF) == i) {
                ChangeScriptSection(*scriptCtx->scriptPtr);
                break;
            }
            scriptCtx->scriptPtr++;
        }
        if(sub_8016ED8())
            SetOrQueueHPBarState(8);
        scriptCtx->scriptPtr++;
        return 1;
    }
    if(scriptCtx->currentToken == 8)
        i = scriptCtx->unk29;
    else
        i = scriptCtx->unk29-1;
    gOamObjects[OAM_IDX_GENERAL_2].attr0 = ((scriptCtx->unk12 & 0xFF) + i) * 18;
    gOamObjects[OAM_IDX_GENERAL_2].attr1 = 0x4009;
    gOamObjects[OAM_IDX_GENERAL_2].attr2 = 0x4FC;
    return 1;
}

bool32 Command0B(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    scriptCtx->textSpeed = *scriptCtx->scriptPtr;
    if(scriptCtx->textSpeed == 0xFF)
    {
        scriptCtx->textSpeed = 3;
    }
    scriptCtx->scriptPtr++;
    return 0;
}

bool32 Command0C(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    if ((scriptCtx->unk12 & 0xFF) == 0)
        scriptCtx->unk12 |= *scriptCtx->scriptPtr;
    else
        scriptCtx->unk12--;
    if((scriptCtx->flags & SCRIPT_SECTION_READ) && (scriptCtx->flags & SCRIPT_SKIP)) {
        if(scriptCtx->flags & SCRIPT_x8000) {
            if(*(scriptCtx->scriptPtr+1) > 0x80) // Only skip if there is text directly after the wait
                scriptCtx->unk12 &= ~0xFF;
        }
    }
    if(scriptCtx->unk12 & 0xFF)
        return TRUE;
    scriptCtx->scriptPtr++;
    scriptCtx->unkA = 0;
    return FALSE;
}

bool32 Command0D(struct ScriptContext * unused_scriptCtx) {
    struct ScriptContext * scriptCtx = &gScriptContext;
    ChangeScriptSection(scriptCtx->nextSection);
    return FALSE;
}

bool32 Command0E(struct ScriptContext * unused_scriptCtx) {
    struct ScriptContext * scriptCtx = &gScriptContext;
    scriptCtx->unk24 = *scriptCtx->scriptPtr >> 8;
    scriptCtx->unk24 &= 0x7F;
    if(scriptCtx->unk24 == 21 && gMain.scenarioIdx < 10 && !GetFlag(0, 0x8D)) {
        scriptCtx->unk24 = 2;
    }
    if(gMain.showTextboxCharacters == TRUE) {
        CopyTextboxTilesToBG1MapBuffer();
        SetTextboxNametag(scriptCtx->unk24 & 0x7F, *scriptCtx->scriptPtr & 0xFF);
    }
    scriptCtx->scriptPtr++;
    scriptCtx->soundCueSkip = 2;
    return FALSE;
}

bool32 Command0F(struct ScriptContext * unused_scriptCtx) {
    struct ScriptContext * scriptCtx = &gScriptContext;
    scriptCtx->unk10 = *scriptCtx->scriptPtr++;
    if(scriptCtx->scriptPtr) { // ! this does not dereference the pointer 
        scriptCtx->slamDesk = 1;
    }
    scriptCtx->scriptPtr++;
    return FALSE;
}

bool32 Command10(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    u32 flagType;
    u32 id;
    bool32 setFlag;
    flagType = id = (setFlag = *scriptCtx->scriptPtr);
    scriptCtx->scriptPtr++;
    flagType = (flagType & 0x7F00) >> 8;
    id &= 0xFF;
    setFlag >>= 15;
    ChangeFlag(flagType, id, setFlag);
    return FALSE;
}

bool32 Command11(struct ScriptContext * scriptCtx)
{
    PlaySE(SE007_MENU_OPEN_SUBMENU);
    gScriptContext.flags |= 0x10;
    gMain.gameStateFlags |= 0x100;
    BACKUP_PROCESS();
    SET_PROCESS(COURT_RECORD_PROCESS, RECORD_INIT, 0, 1);
    SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
    return FALSE;
}

bool32 Command13(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    if((scriptCtx->unk12 & 0xFF) == 0) {
        gMain.itemPlateState = 3;
        gMain.itemPlateEvidenceId = *scriptCtx->scriptPtr;
        gMain.itemPlateSide = (*scriptCtx->scriptPtr >> 8) & 0xF;
        if(((*scriptCtx->scriptPtr >> 8) & 0xF0) == 0) {
            PlaySE(SE009_DISPLAY_EVIDENCE);
        }
    }
    if((scriptCtx->unk12 & 0xF0) == 0) {
        scriptCtx->unk12++;
        return TRUE;
    }
    scriptCtx->scriptPtr++;
    return FALSE;
}

bool32 Command14(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    if((scriptCtx->unk12 & 0xFF) == 0) {
        gMain.itemPlateState = 1;
        if (scriptCtx->unk46[0] != 30000 || scriptCtx->unk46[1] != 30000 || scriptCtx->unk46[2] != 30000)
            PlaySE(SE009_DISPLAY_EVIDENCE);
    }
    if((scriptCtx->unk12 & 0xF0) == 0) {
        scriptCtx->unk12++;
        return TRUE;
    }
    return FALSE;
}

bool32 Command15(struct ScriptContext * unused_scriptCtx)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    if((scriptCtx->unk12 & 2) == 0)
        scriptCtx->unk12++;
    if(scriptCtx->flags & SCRIPT_LOOP)
        return 1;
    if(scriptCtx->currentToken == 0x15)
        SetAnimationFrameOffset(&gAnimation[1], gMain.idleAnimationOffset);
    scriptCtx->flags &= ~SCRIPT_SKIP;
    scriptCtx->flags |= SCRIPT_LOOP;
    return TRUE;
}