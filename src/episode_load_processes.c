#include "global.h"
#include "background.h"
#include "ewram.h"
#include "animation.h"
#include "sound.h"
#include "agb_sram.h"
#include "save.h"
#include "graphics.h"
#include "court.h"
// #include "constants/script.h"
#include "constants/songs.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

void EpisodeInit(struct Main * main)
{
    main->advanceScriptContext = FALSE;
    main->showTextboxCharacters = FALSE;
    StartHardwareBlend(2, 0, 1, 0x1F);
    main->process[GAME_PROCESS_STATE]++;
}

void EpisodeLoadGfx(struct Main * main)
{
    struct OamAttrs * oam;
    u32 i, j;
    u8 oldunk3D;

    gMain.unk258 = 0;
    oldunk3D = main->unk3D;
    main->unk3D |= 0x40;
    DecompressBackgroundIntoBuffer(6);
    CopyBGDataToVram(6);
    main->unk3D = oldunk3D;
    gIORegisters.lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON; 
    main->tilemapUpdateBits = 0xA;
    oam = gOamObjects;
    for(i = 0; i < MAX_OAM_OBJ_COUNT; i++)
        oam++->attr0 = SPRITE_ATTR0_CLEAR;
    ResetAnimationSystem();
    DmaCopy16(3, eBGDecompBuffer, OBJ_VRAM0+0x3400, 0x2800);
    DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT+0x120, 0x40);
    DmaCopy16(3, gGfxSaveGameTiles, VRAM, 0x1000);
    SetTextboxSize(2);
    main->xPosCounter = 0;
    PlaySE(SE007_MENU_OPEN_SUBMENU);
    StartHardwareBlend(1, 0, 1, 0x1F);
    main->process[GAME_PROCESS_STATE]++;
}

extern u8 gUnknown_080267F8[12][2];

void sub_80085D8(struct AnimationListEntry * anim, u8 * arg1) {
    u16 i;
    u8 * src = anim->animationInfo.vramPtr;
    u8 * dst = arg1;
    struct SpriteTemplate * sprite = anim->spriteData;
    u32 spriteCount = *(u16*)anim->spriteData;
    for(i = 0; i < spriteCount; i++) {
        u16 j;
        u16 shape;
        u16 size;
        u8 r5;
        u8 r2;
        u32 r6;
        u32 r0;
        sprite++;
        shape = sprite->data & 0x3000;
        size = sprite->data & 0xC000;
        size >>= 14;
        shape >>= 12;
        r5 = gUnknown_080267F8[shape * 4 + size][0];
        r2 = gUnknown_080267F8[shape * 4 + size][1];
        r6 = (sprite->x + 64) / 8;
        r0 = (sprite->y + 32) / 8;
        for(j = 0; j < r2; j++) {
            DmaCopy16(3, src + (j * r5) * 32, dst + ((r0 * 16 + r6) + j * 16) * 32, r5 * 32);
        }
        src += r5 * r2 * 32;
    }
}

void sub_80086B0(u8 * arg0, u8 * arg1) {
    u32 r5 = 8;
    u8 * src = arg0;
    u8 * dst = arg1;
    u16 i;
    for(i = 0; i < 8; i++) {
        DmaCopy16(3, src + ((i * 2) * r5) * 32, dst + i * r5 * 32, 0x100);
        DmaCopy16(3, src + ((i * 2 + 1) * r5) * 32, dst + i * r5 * 32 + 0x800, 0x100);
    }
}

extern u8 * gUnknown_080267E4[];

void EpisodeClearedProcess(struct Main * main)
{
    struct OamAttrs * oam;
    u32 i, j;
    u32 temp;
    struct AnimationListEntry * anims[4]; // sp0
    switch(main->process[GAME_PROCESS_STATE])
    {
        case 0: // OK
            EpisodeInit(main);
            break;
        case 1:
            if(main->blendMode != 0)
                break;
            gIORegisters.lcd_dispcnt |= DISPCNT_BG1_ON;
            gIORegisters.lcd_bg1vofs = 0;
            EpisodeLoadGfx(main);
            if(gMain.saveContinueFlags & 0xF0)
            {
                u32 saveSlot = 0;
                if(gJoypad.heldKeys & L_BUTTON) {
                    saveSlot = 1;
                } else if(gJoypad.heldKeys & R_BUTTON) {
                    saveSlot = 2;
                }
                ReadSram(saveSlot * sizeof(struct SaveData) + SRAM_START, (void*)&gSaveDataBuffer, sizeof(gSaveDataBuffer));
                gSaveDataBuffer.main.caseEnabledFlags = (main->process[GAME_PROCESS_VAR2] + 1) << 4;
                SaveGameData();
            }
            else
            {
                u32 saveSlot;
                DmaCopy16(3, gSaveVersion, gSaveDataBuffer.saveDataVer, sizeof(gSaveVersion));
                gSaveDataBuffer.magic = 0;
                gSaveDataBuffer.main.caseEnabledFlags = (main->process[GAME_PROCESS_VAR2] + 1) << 4;
                saveSlot = 0;
                if(gJoypad.heldKeys & L_BUTTON) {
                    saveSlot = 1;
                } else if(gJoypad.heldKeys & R_BUTTON) {
                    saveSlot = 2;
                }
                WriteSramEx((void*)&gSaveDataBuffer, saveSlot * sizeof(struct SaveData) + SRAM_START, sizeof(gSaveDataBuffer));
            }
            // ! inconsistent use of pointer and global
            gMain.caseEnabledFlags = (main->process[GAME_PROCESS_VAR2] + 1) << 4;
            main->selectedButton = 1;
            PlayAnimationAtCustomOrigin(15, 368, 72);
            if(main->selectedButton != main->process[GAME_PROCESS_VAR2]) {
                PlayAnimationAtCustomOrigin(16, 368, 72);
            } else {
                PlayAnimationAtCustomOrigin(9, 368, 72);
            }
            main->process[GAME_PROCESS_VAR1] = 0;
            // _08008854
            break;
        case 2: // _080088A0
            anims[0] = FindAnimationFromAnimId(main->selectedButton+14);
            if(main->selectedButton == main->process[GAME_PROCESS_VAR2]) {
                anims[1] = FindAnimationFromAnimId(9);
            } else {
                anims[1] = FindAnimationFromAnimId(main->selectedButton+15);
            }
            if(main->selectedButton+1 == main->process[GAME_PROCESS_VAR2]) {
                anims[2] = FindAnimationFromAnimId(9);
            } else {
                anims[2] = FindAnimationFromAnimId(main->selectedButton+16);
            }
            anims[3] = FindAnimationFromAnimId(main->selectedButton+13);
            anims[1]->animationInfo.xOrigin -= 6;
            if(anims[1]->animationInfo.xOrigin <= 184) {
                if(anims[2] == 0) {
                    if(main->selectedButton < main->process[GAME_PROCESS_VAR2]) {
                        if(main->selectedButton+1 == main->process[GAME_PROCESS_VAR2]) {
                            PlayAnimationAtCustomOrigin(9, 368, 72);
                        } else {
                            PlayAnimationAtCustomOrigin(main->selectedButton+16, 368, 72);
                        }
                    }
                }
            }
            if (anims[1]->animationInfo.xOrigin <= 120) {
                if (main->selectedButton == main->process[GAME_PROCESS_VAR2]) {
                    anims[1]->animationInfo.xOrigin = 120;
                    PlayAnimationAtCustomOrigin(main->selectedButton + 0x14, 0x78, 0x48);
                    main->unk258 = main->selectedButton + 1;
                    main->unk259 = main->selectedButton + 2;
                    main->unk25A = main->selectedButton + 3;
                    if (main->unk258 > 4) {
                        main->unk258 -= 5;
                    }
                    if (main->unk259 > 4) {
                        main->unk259 -= 5;
                    }
                    if (main->unk25A > 4) {
                        main->unk25A -= 5;
                    }
                    sub_80085D8(anims[1], gUnknown_080267E4[main->unk258]);
                    main->process[GAME_PROCESS_STATE]++;
                } else {
                    main->selectedButton++;
                }
            }
            if (anims[0] != NULL) {
                anims[0]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin - 152;
            }
            if (anims[2] != NULL) {
                anims[2]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin + 152;
            }
            if (anims[3] != NULL) {
                anims[3]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin - 304;
                if (anims[3]->animationInfo.xOrigin < -64) {
                    DestroyAnimation(anims[3]);
                }
            }
            break;
        case 3: // _080089FC
            sub_80086B0(gUnknown_080267E4[main->unk258], gUnknown_080267E4[main->unk259]);
            main->process[GAME_PROCESS_STATE]++;
            break;
        case 4: // _08008A28
            PlayAnimationAtCustomOrigin(main->selectedButton + 10, 368, 72);
            main->process[GAME_PROCESS_STATE]++;
            break;
        case 5: // _08008A38
            anims[0] = FindAnimationFromAnimId(main->selectedButton + 10);
            sub_80085D8(anims[0], gUnknown_080267E4[main->unk258]);
            main->process[GAME_PROCESS_STATE]++;
            break;
        case 6: // _08008A5C
            sub_80086B0(gUnknown_080267E4[main->unk258], gUnknown_080267E4[main->unk25A]);
            main->process[GAME_PROCESS_STATE]++;
            break;
        case 7: // _08008A88
            anims[0] = FindAnimationFromAnimId(main->selectedButton + 0xA);
            DestroyAnimation(anims[0]);
            anims[0] = FindAnimationFromAnimId(9);
            oam = &gOamObjects[0x3A]; 
            oam->attr0 = anims[0]->animationInfo.yOrigin + 0xE0;
            oam->attr1 = anims[0]->animationInfo.xOrigin - (0x40 + 0x4000);
            oam->attr2 = (((uintptr_t)gUnknown_080267E4[main->unk259] - (uintptr_t)OBJ_VRAM0) / 0x20) | 0xB000;
            oam++;
            oam->attr0 = anims[0]->animationInfo.yOrigin + 0xE0;
            oam->attr1 = anims[0]->animationInfo.xOrigin - (0 + 0x4000);
            oam->attr2 = ((((uintptr_t)gUnknown_080267E4[main->unk259] - (uintptr_t)OBJ_VRAM0) / 0x20) | 0xB000) + 0x40;
            DestroyAnimation(anims[0]);
            main->process[GAME_PROCESS_STATE]++;
            main->process[GAME_PROCESS_VAR1] = 0;
            break;
        case 8: // _08008B24
            if (main->process[GAME_PROCESS_VAR1]++ > 10) {
                main->affineScale = 0x100;
                gOamObjects[0].attr3 = fix_mul(_Cos(0), fix_inverse(0x100));
                gOamObjects[1].attr3 = fix_mul(_Sin(0), fix_inverse(0x100));
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[3].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
                main->process[GAME_PROCESS_STATE]++;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            break;
        case 9: // _08008BD4
            main->affineScale -= 0x10;
            oam = &gOamObjects[OAM_IDX_GENERIC_TEXT_ICON];
            oam += main->process[GAME_PROCESS_VAR2]*2;
            if(main->affineScale != 0) {
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[3].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
            } else {
                oam = &gOamObjects[0x3A]; 
                oam->attr2 = (((uintptr_t)gUnknown_080267E4[main->unk25A] - (uintptr_t)OBJ_VRAM0) / 0x20) | 0xA000;
                oam++;
                oam->attr2 = ((((uintptr_t)gUnknown_080267E4[main->unk25A] - (uintptr_t)OBJ_VRAM0) / 0x20) | 0xA000) + 0x40;
                main->process[GAME_PROCESS_STATE]++;
            }
            break;
        case 10: // _08008C74

            main->affineScale += 0x10;
            if(main->affineScale >= 0x100)
            {
                main->advanceScriptContext = TRUE;
                main->showTextboxCharacters = TRUE;
                gScriptContext.currentSection = 0xFFFF;
                ChangeScriptSection(5);
                oam = &gOamObjects[0x3A]; 
                oam->attr0 &= ~0x100;
                oam++;
                oam->attr0 &= ~0x100;
                main->process[GAME_PROCESS_STATE]++;
            }
            else
            {
                gOamObjects[2].attr3 = fix_mul(-_Sin(0), fix_inverse(main->affineScale));
                gOamObjects[3].attr3 = fix_mul(_Cos(0), fix_inverse(main->affineScale));
            }
            break;
        case 11:
            if(gScriptContext.flags & 8)
            {
                if(gJoypad.pressedKeys & (A_BUTTON|B_BUTTON|SELECT_BUTTON|START_BUTTON))
                {
                    PauseBGM();
                    PlaySE(SE001_MENU_CONFIRM);
                    gSaveDataBuffer.main.scenarioIdx = main->scenarioIdx;
                    gSaveDataBuffer.main.caseEnabledFlags = (main->process[GAME_PROCESS_VAR2] + 1) << 4;
                    gMain.caseEnabledFlags = (main->process[GAME_PROCESS_VAR2] + 1) << 4;
                    SET_PROCESS_PTR(SAVE_GAME_PROCESS, 0, 0, 1, main);
                }
            }
            break;
        default:
            break;
    }
}

void SelectEpisodeProcess(struct Main * main)
{
    struct OamAttrs * oam;
    u32 i, j;
    u32 temp;
    bool32 buttonEnabled;
    struct AnimationListEntry * anims[4];

    switch(main->process[GAME_PROCESS_STATE])
    {
        case 0:
            EpisodeInit(main);
            break;
        case 1:
            if(main->blendMode)
                return;
            EpisodeLoadGfx(main);
            if(main->saveContinueFlags & 0xF0)
                main->caseEnabledFlags = gSaveDataBuffer.main.caseEnabledFlags;
            switch (main->scenarioIdx) {
            case 2:
                main->unk258 = 2;
                break;
            case 7:
                main->unk258 = 3;
                break;
            case 12:
                main->unk258 = 4;
                break;
            case 20:
                main->unk258 = 5;
                break;
            case 0:
            default:
                main->unk258 = 1;
                break;
            }
            if (main->unk258 == 1) {
                main->selectedButton = main->process[GAME_PROCESS_VAR2];
                PlayAnimationAtCustomOrigin(0xA, 0x170, 0x48);
                PlayAnimationAtCustomOrigin(0x10, 0x170, 0x48);
                PlayAnimationAtCustomOrigin(0x14, 0x78, 0x48);
                main->process[GAME_PROCESS_VAR1] = 0;
            } else {
                main->selectedButton = 1;
                PlayAnimationAtCustomOrigin(0xF, 0x170, 0x48);
                if (main->selectedButton != (main->unk258 - 1)) {
                    PlayAnimationAtCustomOrigin(0x10, 0x170, 0x48);
                } else {
                    PlayAnimationAtCustomOrigin(0xB, 0x170, 0x48);
                }
                main->unk258 -= 1;
                main->process[GAME_PROCESS_STATE] = 100;
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            break;
        case 2:
            anims[0] = FindAnimationFromAnimId(0xA);
            anims[1] = FindAnimationFromAnimId(0x10);
            anims[0]->animationInfo.xOrigin -= 8;
            if (anims[0]->animationInfo.xOrigin <= 0x78) {
                anims[0]->animationInfo.xOrigin = 0x78;
                main->advanceScriptContext = 1;
                main->showTextboxCharacters = 1;
                main->selectedButton = 1;
                gScriptContext.currentSection = 0xFFFF;
                ChangeScriptSection(2);
                SetTimedKeysAndDelay(0x30, 0x14);
                main->process[GAME_PROCESS_STATE]++;
            }
            if (anims[0]->animationInfo.xOrigin <= 184) {
                if ((main->caseEnabledFlags >> 4) > 1) {
                    anims[1]->animationInfo.xOrigin = anims[0]->animationInfo.xOrigin + 0x98;
                }
            }
            break;
        case 3:
            if ((gScriptContext.flags & 8)) {
                if (main->selectedButton > 1) {
                    anims[0] = FindAnimationFromAnimId(0x19);
                    if (anims[0] == NULL) {
                        PlayAnimationAtCustomOrigin(0x19, 0x78, 0x48);
                    }
                    if (gJoypad.activeTimedKeys & DPAD_LEFT) {
                        DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 9));
                        DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 0xD));
                        DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 0x13));
                        DestroyAnimation(FindAnimationFromAnimId(0x19));
                        DestroyAnimation(FindAnimationFromAnimId(0x1A));
                        PlayAnimationAtCustomOrigin(main->selectedButton + 0xE, 0x78, 0x48);
                        PlayAnimationAtCustomOrigin(main->selectedButton + 8, -0x20, 0x48);
                        PlayAnimationAtCustomOrigin(main->selectedButton + 0x12, 0x78, 0x48);
                        PlaySE(0x2A);
                        main->process[GAME_PROCESS_STATE] = 11;
                    }
                }
                if (main->process[GAME_PROCESS_STATE] == 3) {
                    if (main->selectedButton < (main->caseEnabledFlags >> 4)) {
                        anims[0] = FindAnimationFromAnimId(0x1A);
                        if (anims[0] == NULL) {
                            PlayAnimationAtCustomOrigin(0x1A, 0x78, 0x48);
                        }
                        if (gJoypad.activeTimedKeys & DPAD_RIGHT) {
                            DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 9));
                            DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 0xF));
                            DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 0x13));
                            DestroyAnimation(FindAnimationFromAnimId(0x19));
                            DestroyAnimation(FindAnimationFromAnimId(0x1A));
                            PlayAnimationAtCustomOrigin(main->selectedButton + 0xE, 0x78, 0x48);
                            PlayAnimationAtCustomOrigin(main->selectedButton + 0xA, 0x110, 0x48);
                            PlayAnimationAtCustomOrigin(main->selectedButton + 0x14, 0x78, 0x48);
                            PlaySE(0x2A);
                            main->process[GAME_PROCESS_STATE] = 10;
                        }
                    }
                }
                if (main->process[GAME_PROCESS_STATE] == 3) {
                    if (gJoypad.pressedKeys & A_BUTTON) {
                        DestroyAnimation(FindAnimationFromAnimId(0x19));
                        DestroyAnimation(FindAnimationFromAnimId(0x1A));
                        PlaySE(0x2B);
                        main->xPosCounter = 0;
                        main->advanceScriptContext = 0;
                        main->showTextboxCharacters = 0;
                        gIORegisters.lcd_dispcnt &= 0xFDFF;
                        main->tilemapUpdateBits &= 0xFD;
                        main->process[GAME_PROCESS_VAR2] = 0;
                        main->process[GAME_PROCESS_VAR1] = 0;
                        main->process[GAME_PROCESS_STATE] = 20;
                    }
                    else if ((gJoypad.pressedKeys & B_BUTTON)) {
                        PlaySE(0x2C);
                        StartHardwareBlend(2, 0, 1, 0x1F);
                        main->process[GAME_PROCESS_STATE] = 99;
                    }
                }
            }
            break;
        case 10:
            anims[0] = FindAnimationFromAnimId(main->selectedButton + 14);
            anims[1] = FindAnimationFromAnimId(main->selectedButton + 10);
            anims[2] = FindAnimationFromAnimId(main->selectedButton + 13);
            anims[3] = FindAnimationFromAnimId(main->selectedButton + 16);
            anims[1]->animationInfo.xOrigin -= 8;
            if (anims[1]->animationInfo.xOrigin <= 120) {
                anims[1]->animationInfo.xOrigin = 120;
                main->selectedButton++;
                main->process[GAME_PROCESS_STATE] = 3;
            } else if (anims[1]->animationInfo.xOrigin <= 184) {
                if (((main->caseEnabledFlags >> 4) > main->selectedButton+1) && (main->selectedButton <= 3)) {
                    anims[3] = FindAnimationFromAnimId(main->selectedButton + 16);
                    if (anims[3] == NULL) {
                        PlayAnimationAtCustomOrigin(main->selectedButton + 16, 368, 72);
                        anims[3] = FindAnimationFromAnimId(main->selectedButton + 16);
                    }
                }
            }
            anims[0]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin - 152;
            if (anims[3] != NULL) {
                anims[3]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin + 152;
            }
            if (anims[2] != NULL) {
                anims[2]->animationInfo.xOrigin = anims[0]->animationInfo.xOrigin - 152;
                if (anims[2]->animationInfo.xOrigin <= -64) {
                    DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 13));
                }
            }
            break;
        case 11:
                anims[0] = FindAnimationFromAnimId(main->selectedButton + 14);
                anims[1] = FindAnimationFromAnimId(main->selectedButton + 8);
                anims[2] = FindAnimationFromAnimId(main->selectedButton + 15);
                anims[3] = FindAnimationFromAnimId(main->selectedButton + 12);
                anims[1]->animationInfo.xOrigin += 8;
                if (anims[1]->animationInfo.xOrigin >= 120) {
                    anims[1]->animationInfo.xOrigin = 120;
                    main->selectedButton--;
                    main->process[GAME_PROCESS_STATE] = 3;
                } else if (anims[1]->animationInfo.xOrigin >= 56) {
                    if (main->selectedButton > 2) {
                        anims[3] = FindAnimationFromAnimId(main->selectedButton + 12);
                        if (anims[3] == NULL) {
                            PlayAnimationAtCustomOrigin(main->selectedButton + 12, -64, 72);
                            anims[3] = FindAnimationFromAnimId(main->selectedButton + 12);
                        }
                    }
                }
                anims[0]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin + 152;
                if (anims[3] != NULL) {
                    anims[3]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin - 152;
                }
                if (anims[2] != NULL) {
                    anims[2]->animationInfo.xOrigin = anims[0]->animationInfo.xOrigin + 152;
                    if (anims[0]->animationInfo.xOrigin >= 184) {
                        DestroyAnimation(FindAnimationFromAnimId(main->selectedButton + 15));
                    }
                }
                break;
        case 20:
            anims[0] = FindAnimationFromAnimId(main->selectedButton + 9);
            anims[1] = FindAnimationFromAnimId(main->selectedButton + 15);
            anims[2] = FindAnimationFromAnimId(main->selectedButton + 13);
            if (anims[2] != NULL) {
                anims[2]->animationInfo.xOrigin -= 8;
                if (anims[2]->animationInfo.xOrigin < -64) {
                    DestroyAnimation(anims[2]);
                }
            }
            if (anims[1] != NULL) {
                anims[1]->animationInfo.xOrigin += 8;
                if (anims[1]->animationInfo.xOrigin > 0x130) {
                    DestroyAnimation(anims[1]);
                }
            }
            if (anims[1] == NULL && anims[2] == NULL) {
                main->process[GAME_PROCESS_VAR2] = 0;
                main->process[GAME_PROCESS_STATE] = 21;
            }
            break;
        case 21:
            anims[0] = FindAnimationFromAnimId(main->selectedButton + 9);
            anims[3] = FindAnimationFromAnimId(main->selectedButton + 0xE);
            if (main->process[GAME_PROCESS_VAR1]++ > 2) {
                if (anims[0] != NULL) {
                    DestroyAnimation(anims[0]);
                    PlayAnimationAtCustomOrigin(main->selectedButton + 0xE, 0x78, 0x48);
                } else {
                    DestroyAnimation(anims[3]);
                    PlayAnimationAtCustomOrigin(main->selectedButton + 9, 0x78, 0x48);
                }
                main->process[GAME_PROCESS_VAR1] = 0;
            }
            if (main->process[GAME_PROCESS_VAR2]++ > 40) {
                if (anims[0] == NULL) {
                    PlayAnimationAtCustomOrigin(main->selectedButton + 9, 0x78, 0x48);
                }
                main->process[GAME_PROCESS_VAR2] = 0;
                main->process[GAME_PROCESS_STATE] = 22;
            }
            break;
        case 22:
            if (main->process[GAME_PROCESS_VAR2]++ > 40) {   
                StartHardwareBlend(2, 4, 1, 0x1F);
                main->process[GAME_PROCESS_VAR2] = 0;
                main->process[GAME_PROCESS_STATE] = 23;
            }
            break;
        case 23:
            if (main->blendMode) {
                break;
            }
            switch (main->selectedButton) {
            case 1:
                main->scenarioIdx = 0;
                if (gJoypad.heldKeys & L_BUTTON) {
                    main->scenarioIdx = 22;
                } else if (gJoypad.heldKeys & R_BUTTON) {
                    main->scenarioIdx = 21;
                }
                break;
            case 2:
                main->scenarioIdx = 2;
                break;
            case 3:
                main->scenarioIdx = 7;
                break;
            case 4:
                main->scenarioIdx = 12;
                break;
            case 5:
                main->scenarioIdx = 20;
                break;
            default:
                main->scenarioIdx = 0;
                break;
            }
            sub_8007610(main->scenarioIdx);
            gMain.unk4 = 0;
            SET_PROCESS_PTR(gCaseStartProcess[main->scenarioIdx], 0, 0, 0, main);
            DestroyAnimation(FindAnimationFromAnimId(9));
            DestroyAnimation(FindAnimationFromAnimId(0xA));
            DestroyAnimation(FindAnimationFromAnimId(0xB));
            DestroyAnimation(FindAnimationFromAnimId(0xC));
            DestroyAnimation(FindAnimationFromAnimId(0xD));
            DestroyAnimation(FindAnimationFromAnimId(0xE));
            DestroyAnimation(FindAnimationFromAnimId(0xF));
            DestroyAnimation(FindAnimationFromAnimId(0x10));
            DestroyAnimation(FindAnimationFromAnimId(0x11));
            DestroyAnimation(FindAnimationFromAnimId(0x12));
            DestroyAnimation(FindAnimationFromAnimId(0x19));
            DestroyAnimation(FindAnimationFromAnimId(0x1A));
            break;
        case 99:
            if (main->blendMode == 0) {
                DestroyAnimation(FindAnimationFromAnimId(9));
                DestroyAnimation(FindAnimationFromAnimId(0xA));
                DestroyAnimation(FindAnimationFromAnimId(0xB));
                DestroyAnimation(FindAnimationFromAnimId(0xC));
                DestroyAnimation(FindAnimationFromAnimId(0xD));
                DestroyAnimation(FindAnimationFromAnimId(0xE));
                DestroyAnimation(FindAnimationFromAnimId(0xF));
                DestroyAnimation(FindAnimationFromAnimId(0x10));
                DestroyAnimation(FindAnimationFromAnimId(0x11));
                DestroyAnimation(FindAnimationFromAnimId(0x12));
                DestroyAnimation(FindAnimationFromAnimId(0x19));
                DestroyAnimation(FindAnimationFromAnimId(0x1A));
                SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 0, 0, 0, main);
            }
            break;
        case 100:
            anims[0] = FindAnimationFromAnimId(main->selectedButton + 14);
            if (main->selectedButton == main->unk258) {
                anims[1] = FindAnimationFromAnimId(main->selectedButton + 10);
            } else {
                anims[1] = FindAnimationFromAnimId(main->selectedButton + 15);
            }
            
            if ((main->selectedButton + 1) == main->unk258) {
                anims[2] = FindAnimationFromAnimId(main->selectedButton + 11);
            } else {
                anims[2] = FindAnimationFromAnimId(main->selectedButton + 16);
            }
            anims[3] = FindAnimationFromAnimId(main->selectedButton + 0xD);
            anims[1]->animationInfo.xOrigin -= 6;
            if ((anims[1]->animationInfo.xOrigin <= 0xB8) && (anims[2] == NULL) && (main->selectedButton < main->unk258)) {
                if (main->selectedButton+1 == main->unk258) {
                    PlayAnimationAtCustomOrigin(main->selectedButton + 11, 0x170, 0x48);
                } else {
                    PlayAnimationAtCustomOrigin(main->selectedButton + 16, 0x170, 0x48);
                }
            }
            if (anims[1]->animationInfo.xOrigin <= 0x78) {
                anims[1]->animationInfo.xOrigin = 0x78;
                if (main->selectedButton == main->unk258) {
                    PlayAnimationAtCustomOrigin(main->selectedButton + 20, 0x78, 0x48);
                    main->advanceScriptContext = 1;
                    main->showTextboxCharacters = 1;
                    gScriptContext.currentSection = 0xFFFF;
                    ChangeScriptSection(2);
                    SetTimedKeysAndDelay(0x30, 0x14);
                    main->selectedButton += 1;
                    main->process[GAME_PROCESS_STATE] = 3;
                } else {
                    main->selectedButton++;
                }
            }
            if (anims[0] != NULL) {
                anims[0]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin - 152;
            }
            if (anims[2] != NULL) {
                anims[2]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin + 152;
            }
            if (anims[3] != NULL) {
                anims[3]->animationInfo.xOrigin = anims[1]->animationInfo.xOrigin - 304;
                if (anims[3]->animationInfo.xOrigin < -0x40) {
                    DestroyAnimation(anims[3]);
                }
            }
            break;
    }
}

void ContinueSaveProcess(struct Main * main) {
    struct OamAttrs * oam;
    struct AnimationListEntry * personAnim = &gAnimation[1];
    uintptr_t i, j;
    u32 temp;

    switch (main->process[GAME_PROCESS_STATE]) {
        case 0:
            LoadSaveData();
            EpisodeInit(main);
            break;
        case 1:
            if (main->blendMode == 0) {
                u8 oldunk3D;
                main->saveContinueFlags = gSaveDataBuffer.main.saveContinueFlags;
                main->scenarioIdx = gSaveDataBuffer.main.scenarioIdx;
                DmaCopy16(3, gGfxSaveGameTiles, BG_CHAR_ADDR(0), 0x1000);
                DmaCopy16(3, gGfxFromSaveOrBeginningOptions, OBJ_VRAM0 + 0x3400, 0x1000);
                DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT + 0x120, 0x40);
                gMain.unk258 = 0;
                oldunk3D = main->unk3D; 
                main->unk3D |= 0x40;
                DecompressBackgroundIntoBuffer(6);
                CopyBGDataToVram(6);
                main->unk3D = oldunk3D;
                main->animationFlags &= ~3;
                oam = gOamObjects;
                for (i = 0; i < MAX_OAM_OBJ_COUNT; ++i) {
                    oam->attr0 = 0x200;
                    ++oam;
                }
                for (i = 0; i < 0x400; ++i) {
                    gBG2MapBuffer[i] = 0;
                }
                SlideInBG2Window(5, 8);
                PlaySE(SE007_MENU_OPEN_SUBMENU);
                gIORegisters.lcd_dispcnt = 0x1C40;
                main->tilemapUpdateBits = 0xC;
                gIORegisters.lcd_bg2cnt = 0x3E01;
                main->selectedButton = 0;
                StartHardwareBlend(1, 0, 1, 0x1F);
                ++main->process[GAME_PROCESS_STATE];
            }
            break;
        case 2:
            UpdateBG2Window(&gCourtRecord);
            if (gCourtRecord.windowScrollSpeed == 0) {
                main->advanceScriptContext = TRUE;
                main->showTextboxCharacters = TRUE;
                gScriptContext.currentSection = 0xFFFF;
                ChangeScriptSection(main->scenarioIdx + 7);
                main->blendCounter = 0;
                main->blendDelay = 1;
                main->blendDeltaY = 16;
                gIORegisters.lcd_bldcnt = 0x840;
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0, main->blendDeltaY);
                ++main->process[GAME_PROCESS_STATE];
            }
            break;
        case 3:
            if (gScriptContext.flags & 8) {
                if (main->saveContinueFlags & 1 && gJoypad.pressedKeys & 0xC0) {
                    PlaySE(SE000_MENU_CHANGE);
                    main->selectedButton ^= 1;
                } else if (gJoypad.pressedKeys & 1) {
                    PlaySE(SE001_MENU_CONFIRM);
                    main->advanceScriptContext = FALSE;
                    main->showTextboxCharacters = TRUE;
                    if ((main->saveContinueFlags & 1) == 0) {
                        StartHardwareBlend(2, 0, 1, 0x1F);
                        main->process[GAME_PROCESS_STATE] = 5;
                    } else {
                        main->blendCounter = 0;
                        main->blendDelay = 1;
                        main->blendDeltaY = 0;
                        main->process[GAME_PROCESS_STATE] = 7;
                        main->process[GAME_PROCESS_VAR1] = 0;
                    }
                } else if (gJoypad.pressedKeys & 2) {
                    PlaySE(SE002_MENU_CANCEL);
                    StartHardwareBlend(2, 0, 1, 0x1F);
                    main->process[GAME_PROCESS_STATE] += 3;
                }
            }
            if (main->saveContinueFlags & 1) {
                oam = gOamObjects + OAM_IDX_GENERIC_TEXT_ICON;
                for (i = 0; i < 2; ++i) {
                    for (j = 0; j < 2; ++j) {
                        oam->attr0 = 0x4462 + i * 32;
                        oam->attr1 = 0xC038 + j * 64;
                        if (main->selectedButton == i) {
                            oam->attr2 = j * 0x20 + 0x91A0 + i * 0x40;
                        } else {
                            oam->attr2 = j * 0x20 + 0xA1A0 + i * 0x40;
                        }
                        ++oam;
                    }
                }
            } else {
                oam = gOamObjects + OAM_IDX_GENERIC_TEXT_ICON;
                for (j = 0; j < 2; ++j) {
                    oam->attr0 = 0x4462;
                    oam->attr1 = 0xC038 + j * 64;
                    oam->attr2 = 0x91E0 + j * 32;
                    ++oam;
                }
            }
            if (main->process[GAME_PROCESS_STATE] == 3 && main->blendDeltaY != 0) {
                ++main->blendCounter;
                if (main->blendCounter >= main->blendDelay) {
                    main->blendCounter = 0;
                    --main->blendDeltaY;
                }
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0x10 - main->blendDeltaY, main->blendDeltaY);
            }
            break;
        case 4:
            if(main->blendMode != 0)
                return;
            HideAllSprites();
            InitBGs();
            ResetAnimationSystem();
            ResetSoundControl();
            LoadCurrentScriptIntoRam();
            //DmaCopy16(3, gUnusedAsciiCharSet, BG_VRAM + 0x3800, 0x800);
            DmaCopy16(3, gGfxSaveGameTiles, BG_VRAM, 0x1000);
            DmaCopy16(3, gPalEvidenceProfileDesc, OBJ_PLTT+0x40, 0x20);
            i = (uintptr_t)GetBGPalettePtr(0); // ! BAD FAKEMATCH?
            DmaCopy16(3, i, BG_PLTT, 0x200);
            DmaCopy16(3, &gSaveDataBuffer.main, &gMain, sizeof(gMain));
            DmaCopy16(3, gPalEvidenceProfileDesc, BG_PLTT, 0x20);
            LoadCurrentScriptIntoRam();
            DmaCopy16(3, gPalExamineCursors, OBJ_PLTT + 0x100, 0x20);
            DmaCopy16(3, &gSaveDataBuffer.talkData, &gTalkData, sizeof(gTalkData));
            DmaCopy16(3, &gSaveDataBuffer.loadedPsycheLockedTalkSections, &gLoadedPsycheLockedTalkSections, sizeof(gLoadedPsycheLockedTalkSections));
            RestoreAnimationsFromBuffer(gSaveDataBuffer.backupAnimations);

            if (main->process[GAME_PROCESS] == INVESTIGATION_PROCESS) {
                if(!(main->process[GAME_PROCESS_STATE] == INVESTIGATION_TALK && main->process[GAME_PROCESS_VAR1] == 6)) {
                    sub_8017154(3);
                }
                DmaCopy16(3, gGfx4bppInvestigationActions, OBJ_VRAM0 + 0x2000, 0x1000);
                DmaCopy16(3, gPalActionButtons, OBJ_PLTT + 0xA0, 0x40);
                DmaCopy16(3, gGfx4bppInvestigationScrollButton, OBJ_VRAM0 + 0x3000, 0x200);
                DmaCopy16(3, gPalInvestigationScrollPrompt, OBJ_PLTT + 0xE0, 0x20);
                DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0 + 0x3200, 0x200);
                DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT + 0x120, 0x40);

                if (main->process[GAME_PROCESS_VAR1] == 3) {
                    if (main->process[GAME_PROCESS_STATE] == INVESTIGATION_MOVE) {
                        LoadLocationChoiceGraphics();
                    } else if (main->process[GAME_PROCESS_STATE] == INVESTIGATION_TALK) {
                        LoadTalkChoiceGraphics();
                    }
                }
            } else {
                DmaCopy16(3, gPalMapMarkers, OBJ_PLTT+0xC0, 0x20);
                if(main->process[GAME_PROCESS] == TESTIMONY_PROCESS) {
                    DmaCopy16(3, gGfx4bppTestimonyTextTiles, OBJ_VRAM0 + 0x3000, 0x800);
                    DmaCopy16(3, gPalTestimonyTextTiles, OBJ_PLTT + 0xA0, 0x20);
                } else if(main->process[GAME_PROCESS] == QUESTIONING_PROCESS) {
                    DmaCopy16(3, gGfxPressPresentButtons, OBJ_VRAM0 + 0x3000, 0x400);
                    DmaCopy16(3, gPalPressPresentButtons, OBJ_PLTT+0xA0, 0x20);
                    DmaCopy16(3, gGfx4bppTestimonyArrows, OBJ_VRAM0 + 0x3400, 0x80);
                    DmaCopy16(3, gGfx4bppTestimonyArrows + 12 * TILE_SIZE_4BPP, OBJ_VRAM0 + 0x3480, 0x80);            
                }
            }
            DmaCopy16(3, &gSaveDataBuffer.scriptCtx, &gScriptContext, sizeof(gScriptContext));
            sub_8017AB4(gScriptContext.unk44);
            DmaCopy16(3, &gSaveDataBuffer.scriptCtx, &gScriptContext, sizeof(gScriptContext));

            
            DmaCopy16(3, &gSaveDataBuffer.textBoxCharacters, &gTextBoxCharacters, sizeof(gTextBoxCharacters));
            DmaCopy16(3, &gSaveDataBuffer.struct30070B0, &gUnknown_030070B0, sizeof(gUnknown_030070B0));
            RedrawTextboxCharacters();
            DmaCopy16(3, &gSaveDataBuffer.ioRegs, &gIORegisters, sizeof(gIORegisters));
            DmaCopy16(3, &gSaveDataBuffer.courtRecord, &gCourtRecord, sizeof(gCourtRecord));
            DmaCopy16(3, &gSaveDataBuffer.investigation, &gInvestigation, sizeof(gInvestigation));
            DmaCopy16(3, &gSaveDataBuffer.testimony, &gTestimony, sizeof(gTestimony));
            DmaCopy16(3, &gSaveDataBuffer.courtScroll, &gCourtScroll, sizeof(gCourtScroll));
            DmaCopy16(3, gSaveDataBuffer.examinationData, gExaminationData, sizeof(gExaminationData));
            loadSectionReadFlagsFromSaveDataBuffer(main);
            sub_8007610(main->scenarioIdx);
            if(gMain.unk3D & 8) {
                gMain.unk3D |= 0x10;
            }
            DmaCopy16(3, gSaveDataBuffer.mapMarker, gMapMarker, sizeof(gMapMarker));
            MakeMapMarkerSprites();
            SetTextboxNametag(gScriptContext.textboxNameId & 0x7F, gScriptContext.textboxNameId & 0x80);
            DmaCopy16(3, gSaveDataBuffer.bg1Map, gBG1MapBuffer, sizeof(gBG1MapBuffer));
            DmaCopy16(3, gSaveDataBuffer.bg0Map, gBG0MapBuffer, sizeof(gBG0MapBuffer));
            switch(personAnim->animationInfo.personId) {
                case 36:
                    nullsub_11(0);
                    break;
                case 39:
                    nullsub_11(1);
                    break;
                case 40:
                    nullsub_11(2);
                    break;
                case 37:
                    nullsub_11(3);
                    break;
                case 38:
                    nullsub_11(4);
                    break;
            }
            temp = gMain.Bg256_dir;
            DecompressBackgroundIntoBuffer(main->currentBG);
            CopyBGDataToVramAndScrollBG(main->currentBG);
            if(gScriptContext.unk40 != 0x80) {
                gMain.unk258 = gScriptContext.unk42+1;
                gMain.previousBG = gMain.currentBG;
                gMain.currentBG = gScriptContext.unk40;
                DecompressBackgroundIntoBuffer(gScriptContext.unk40);
                if(gMain.unk258 == 5) {
                    sub_800482C(gMain.currentBG);
                }
                gMain.unk258 = 0;
                gMain.currentBG = gMain.previousBG;
                sub_8004940(gMain.currentBG, temp);
                gMain.Bg256_dir = gSaveDataBuffer.main.Bg256_dir;
                gMain.currentBgStripe = 0;
            }
            if (gScriptContext.flags & 4) {
                DmaCopy16(3, gCharSet + 0x7100, OBJ_VRAM0 + 0x1F80, 0x80);
            }
            if (gScriptContext.flags & 0x400) {
                DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0 + 0x1F80, 0x80);
            }
            DmaCopy16(3, gSaveDataBuffer.oam, gOamObjects, sizeof(gOamObjects));
            gJoypad.heldKeys = gJoypad.pressedKeys = gJoypad.previousHeldKeys = gJoypad.previousPressedKeys = 0;
            SetTimedKeysAndDelay(0x30, 0xF);
            if (main->itemPlateState > 3) {
                LoadItemPlateGfx(main);
            }
            FadeInBGM(20, main->currentPlayingBgm);
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
            StartHardwareBlend(1, 1, 1, 0x1F);
            break;
        case 5:
            if (main->blendMode == 0) {
                ClearSectionReadFlags(main);
                gMain.hpBarValueScenarioEnd = gSaveDataBuffer.main.hpBarValueScenarioEnd;
                gMain.hpBarDisplayValue = gSaveDataBuffer.main.hpBarValueScenarioEnd;
                gMain.hpBarValue = gSaveDataBuffer.main.hpBarValueScenarioEnd;
                sub_800A38C();
                SET_PROCESS_PTR(gCaseStartProcess[main->scenarioIdx], 0, 0, 0, main);
            }
            break;
        case 6:
            if (main->blendMode == 0) {
                SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 0, 0, 0, main);
            }
            break;
        case 7:
            ++main->process[GAME_PROCESS_VAR1];
            if (main->process[GAME_PROCESS_VAR1] >= 0x30) {
                if (main->selectedButton == 0) {
                    main->process[GAME_PROCESS_STATE] = 4;
                } else {
                    main->process[GAME_PROCESS_STATE] = 5;
                }
                main->process[GAME_PROCESS_VAR1] = 0;
                oam = gOamObjects + OAM_IDX_GENERIC_TEXT_ICON;
                if (main->selectedButton == 0) {
                    oam = gOamObjects + OAM_IDX_GENERIC_TEXT_ICON2;
                }
                for (i = 0; i < 2; ++i) {
                    oam->attr0 = 0x200;
                    ++oam;
                }
                StartHardwareBlend(2, 0, 1, 0x1F);
                break;
            } else if (main->saveContinueFlags & 1) {
                oam = gOamObjects + OAM_IDX_GENERIC_TEXT_ICON;
                for (i = 0; i < 2; ++i) {
                    for (j = 0; j < 2; ++j) {
                        oam->attr1 = 0xC038 + j * 64;
                        if (main->selectedButton == i) {
                            oam->attr0 = 0x4062 + i * 32;
                            oam->attr2 = j * 32 + 0x91A0 + i * 64;
                        } else {
                            oam->attr0 = 0x4462 + i * 32;
                            oam->attr2 = j * 32 + 0xA1A0 + i * 64;
                        }
                        ++oam;
                    }
                }
            } else {
                oam = gOamObjects + OAM_IDX_GENERIC_TEXT_ICON;
                for (j = 0; j < 2; ++j) {
                    oam->attr0 = 0x4062;
                    oam->attr1 = 0xC038 + j * 64;
                    oam->attr2 = 0x91E0 + j * 32;
                    ++oam;
                }
            }
            if(main->process[GAME_PROCESS_STATE] == 7 && main->blendDeltaY < 0x10) {
                    ++main->blendCounter;
                    if (main->blendCounter >= main->blendDelay) {
                        main->blendCounter = 0;
                        ++main->blendDeltaY;
                    }
                gIORegisters.lcd_bldalpha = BLDALPHA_BLEND(0x10 - main->blendDeltaY, main->blendDeltaY);
            }
            break;
        // why is this needed for matching
        case 100:
        case 101:
    }
}
