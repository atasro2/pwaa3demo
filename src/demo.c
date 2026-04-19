#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "utils.h"
#include "background.h"
#include "constants/songs.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

void CheckBGChange_iOS(u16 arg0, u32 arg1) {
    
}

void MoveNextScript_Unity(struct ScriptContext * scriptCtx) {
    gScriptContext.unk30[0] = 0;
    gScriptContext.unk30[1] = 0;
    op_proc_exit_iOS(scriptCtx);
    gScriptContext.unk2E &= 0xF0;
    gScriptContext.scriptPtr += 4;
}

void sub_801D784(u16 arg0) {
    if(FindAnimationFromAnimId(arg0) == NULL) {
        PlayAnimation(arg0);
    }
}

void sub_801D7A0(u16 arg0) {
    struct AnimationListEntry * anim = FindAnimationFromAnimId(arg0);
    if(anim) {
        DestroyAnimation(anim);
    }
}

void FadeOutObj_Unity(struct ScriptContext * scriptCtx, u16 arg1) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct AnimationListEntry * anim;
    u32 temp;
    gScriptContext.unk30[1]++;
    if(gScriptContext.unk30[1] > 30) {
        anim = FindAnimationFromAnimId(arg1);
        if(anim)
            DestroyAnimation(anim);
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 7);
        MoveNextScript_Unity(scriptCtx);
        return;
    }
    temp = gScriptContext.unk30[1] / 2;
    if(temp > 15)
        temp = 15;
    ioRegs->lcd_bldalpha = (temp << 8) + (0xF - temp);
}

void FadeInObj_Unity(struct ScriptContext * scriptCtx, u16 arg1) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct AnimationListEntry * anim;
    u32 temp;
    gScriptContext.unk30[1]++;
    if(gScriptContext.unk30[1] > 30) {
        anim = FindAnimationFromAnimId(arg1);
        anim->flags &= ~0x80;
        DestroyAnimation(anim);
        sub_801D784(arg1);
        ioRegs->lcd_bldcnt &= ~(BLDCNT_TGT1_BG1 | BLDCNT_TGT2_BG1);
        ioRegs->lcd_bldcnt |= BLDCNT_TGT1_BG1;
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 7);
        MoveNextScript_Unity(scriptCtx);
        return;
    }
    ioRegs->lcd_bldcnt &= ~BLDCNT_TGT1_BG1;
    ioRegs->lcd_bldcnt |= BLDCNT_TGT2_BG1;
    temp = gScriptContext.unk30[1] / 2;
    if(temp > 15)
        temp = 15;
    ioRegs->lcd_bldalpha = ((0xF - temp) << 8) + temp;
}

void Character_MoveH_Unity(struct ScriptContext * scriptCtx) {
    struct ScriptContext * scriptCtx2 = &gScriptContext;
    struct AnimationListEntry * anim = &gAnimation[1];
    u16 r3, r1, r2;
    if(anim == NULL)
        MoveNextScript_Unity(scriptCtx);
        //! return?
    r3 = scriptCtx2->unk46[0];
    r1 = scriptCtx2->unk46[1];
    r2 = scriptCtx2->unk46[2];
    if(r1) {
        if(anim->animationInfo.xOrigin + r2 > r3) {
            anim->animationInfo.xOrigin = r3;
            MoveNextScript_Unity(scriptCtx);
        } else {
            anim->animationInfo.xOrigin += r2;
        }
    } else {
        if(anim->animationInfo.xOrigin - r2 < r3) {
            anim->animationInfo.xOrigin = r3;
            MoveNextScript_Unity(scriptCtx);
        } else {
            anim->animationInfo.xOrigin -= r2;
        }
    } 
}

void Character_MoveV_Unity(struct ScriptContext * scriptCtx) {
    struct ScriptContext * scriptCtx2 = &gScriptContext;
    struct AnimationListEntry * anim = &gAnimation[1];
    s16 r3, r1, r2;
    if(anim == NULL)
        MoveNextScript_Unity(scriptCtx);
        //! return?
    r3 = scriptCtx2->unk46[0];
    r1 = scriptCtx2->unk46[1];
    r2 = scriptCtx2->unk46[2];
    if(r1) {
        if(anim->animationInfo.yOrigin + r2 > r3) {
            anim->animationInfo.yOrigin = r3;
            MoveNextScript_Unity(scriptCtx);
        } else {
            anim->animationInfo.yOrigin += r2;
        }
    } else {
        if(anim->animationInfo.yOrigin - r2 < r3) {
            anim->animationInfo.yOrigin = r3;
            MoveNextScript_Unity(scriptCtx);
        } else {
            anim->animationInfo.yOrigin -= r2;
        }
    } 
}

void sub_801D984(void) {
    struct IORegisters * ioRegs = &gIORegisters;
    u8 * ip = gUnknown_08208AA0;
    //u16 * r6 = gUnknown_08208AC0;
    u8 * src;
    u16 * dst = gUnknown_08208AC0;
    u16 i, j;
    s32 zero = 0;
    ioRegs->lcd_dispcnt &= ~DISPCNT_BG2_ON;
    *(u16*)&REG_DISPCNT &= ~DISPCNT_BG2_ON;
    ioRegs->lcd_bg2vofs = 0;
    ioRegs->lcd_bg2hofs = 8;
    REG_BG2HOFS = ioRegs->lcd_bg2hofs;
    REG_BG2VOFS = ioRegs->lcd_bg2vofs;
    for(i = 0; i < 0x400; i++) {
        gBG2MapBuffer[i] = 0xE000;
    }
    for(i = 0, zero = 0; i < 20; i++) {
        for(j = 0; j < 30; j++, dst++) {
            int x = (j - zero);
            zero--;zero++; // Fakematch
            if(x >= 0 && x <= 30) {
                gBG2MapBuffer[i * 32 + 1 + x] = *dst + 0x81;
            }
        }
    }
    ip += 0x4D0;
    DmaCopy16(3, ip, eVRAMScratchpadBuffer, 0x4B00);
    src = eSpeedlineDecompBuffer;
    dst = (u8*)VRAM + 0x8B20;
    DmaCopy16(3, src, dst, 0x5000);
    src = gUnknown_08208AA0;
    dst = (u8*)PLTT + 0x1C0;
    DmaCopy16(3, src, dst, 0x20);
    if(gMain.unk3D & 8) {
        u16 buf[0x10];
        DmaCopy16(3, src, buf, 0x20);
        for(i = 0; i < 0x10; i++) {
            buf[i] = ColorFadeSepia(buf[i], 0x20, 0);
        }
        DmaCopy16(3, buf, dst, 0x20);
        //The assembly loads gBG2MapBuffer here???
    } else {
        DmaCopy16(3, src, dst, 0x20);
    }
    src = gBG2MapBuffer;
    dst = (u8*)BG_SCREEN_ADDR(30);
    DmaCopy16(3, src, dst, 0x580);
    REG_BG2CNT = ioRegs->lcd_bg2cnt;
    for(i = 0; i < 0x20; i++) {
        gBG3MapBuffer[i] = 0x2258;
        gBG3MapBuffer[i + 0x3C0] = 0x2258;
    }
    DmaFill16(3, 0, (u8*)VRAM + 0x8B00, 0x20);
}

void sub_801DB60(void) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct ScriptContext * scriptCtx = &gScriptContext;
    u16 * src;
    u16 * dst;
    u32 i;

    switch (scriptCtx->unk46[2] >> 0xC) {
    case 1:
        if (scriptCtx->unk30[4]) {
            src = eBGDecompBuffer;
            for(i = 0; i < 20; i++) {
                DmaCopy16(3, src, BG_CHAR_ADDR(1) + i * 0x780, 0x780);
                src += 0x780;
            }
        } else {
            src = eBGDecompBuffer;
            for(i = 0; i < 20; i++) {
                DmaCopy16(3, src, BG_CHAR_ADDR(1) + i * 0x3C0, 0x3C0);
                src += 0x3C0;
            }
        }
        sub_80060E8();
        break;
    case 2:
        if (scriptCtx->unk30[4]) {
            src = eBGDecompBuffer+0x780;
            for(i = 0; i < 20; i++) {
                DmaCopy16(3, src, BG_CHAR_ADDR(1) + i * 0x780, 0x780);
                src += 0x780;
            }
        } else {
            src = eBGDecompBuffer+0x780;
            for(i = 0; i < 20; i++) {
                DmaCopy16(3, src, BG_CHAR_ADDR(1) + i * 0x3C0, 0x3C0);
                src += 0x3C0;
            }
        }
        sub_80060E8();
        break;
    case 3:
        sub_8004940(gSaveDataBuffer.main.currentBG, 0x20);
        break;
    case 4:
        sub_8004940(gSaveDataBuffer.main.currentBG, 0x10);
        break;
    case 0:
    default:
        DmaCopy16(3, eBGDecompBuffer2+0xC0, BG_CHAR_ADDR(1), 0x9600);
        break;
    }
    if (scriptCtx->unk1E & 2) {
        if (gMain.process[0] == 4 && gMain.process[1] == 10) {
            sub_8015C18();
            gMain.psycheLockShownByScriptFlag = 0;
            ioRegs->lcd_bg3cnt |= BGCNT_PRIORITY(3);
            ioRegs->lcd_dispcnt &= ~DISPCNT_BG0_ON;
        }
        sub_80060E8();
        scriptCtx->unk1E &= ~2;
    }
    if (scriptCtx->unk1E & 4) {
        scriptCtx->unk1E &= ~4;
        src = gBG2MapBuffer;
    } else {
        src = gBG0MapBuffer;
    }
    switch(scriptCtx->unk46[2] & 0xF) {
    case 1:
        if (scriptCtx->unk30[4]) {
            ioRegs->lcd_bg3cnt |= BGCNT_256COLOR;
            for(i = 0x20; i < 0x100; i++) {
                src[i] = ColorFadeGrayscale(src[i], 0x1F, 0);
            }
            DmaCopy16(3, src, PLTT, 0x200);
        } else {
            ioRegs->lcd_bg3cnt &= ~BGCNT_256COLOR;
            for(i = 0; i < 0x10; i++) {
                src[i] = ColorFadeGrayscale(src[i], 0x1F, 0);
            }
            DmaCopy16(3, src, PLTT+0x40, 0x20);
        }
        break;
    case 0:
        if (scriptCtx->unk30[4]) {
            ioRegs->lcd_bg3cnt |= BGCNT_256COLOR;
            DmaCopy16(3, src, PLTT, 0x200);
        } else {
            ioRegs->lcd_bg3cnt &= ~BGCNT_256COLOR;
            DmaCopy16(3, src, PLTT+0x40, 0x20);
        }
        break;
    }
    SetOAMForCourtBenchSpritesWitness(0, 0, 0);
    EnableDetentionCenterMask(0);
    if (scriptCtx->unk46[2] & 0xF00) {
        s32 temp = (scriptCtx->unk46[2] & 0xF00) >> 8;
        if (((scriptCtx->unk46[2] & 0xF00) >> 8) < 4) {
            if ((scriptCtx->unk46[2] & 0xF) == 1) {
                gMain.effectType = 0xFFFD;
            } else {
                gMain.effectType = 0;
            }
        }
        switch (temp) {
        case 1:
            LoadCounselBenchGraphics();
            SetOAMForCourtBenchSpritesDefense(0, 0x80, 1);
            return;
        case 2:
            LoadWitnessBenchGraphics();
            SetOAMForCourtBenchSpritesWitness(0x18, 0x80, 1);
            return;
        case 3:
            LoadCounselBenchGraphics();
            SetOAMForCourtBenchSpritesProsecution(0x20, 0x80, 1);
            return;
        case 4:
            EnableDetentionCenterMask(1);
            ioRegs->lcd_bg0cnt |= BGCNT_MOSAIC;
            break;
        }
    }
}

void Demo_Proc_iOS(struct ScriptContext * arg0) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct ScriptContext * scriptCtx = &gScriptContext;
    struct Main * main = &gMain;
    struct AnimationListEntry * anim;
    u32 i;
    u16 temp_r2;
    u16 * src;
    u16 * dst;
    switch(arg0->unk2F) {
    case 0:
        anim = &gAnimation[1]; 
        anim->flags |= ANIM_0x80;
        op_proc_exit_iOS(arg0);
        break;
    case 1:
        anim = &gAnimation[1];
        if(anim != NULL) {
            anim->flags &= ~ANIM_0x80;
            anim->flags &= ~ANIM_BLEND_ACTIVE;
        }
        op_proc_exit_iOS(arg0);
        break;
    case 2:
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0, 15);
        op_proc_exit_iOS(arg0);
        break;
    case 3:
        anim = &gAnimation[1];
        anim->animationInfo.xOrigin = scriptCtx->unk46[0];
        anim->animationInfo.yOrigin = scriptCtx->unk46[1];
        op_proc_exit_iOS(arg0);
        break;
    case 4:
        Character_MoveH_Unity(arg0);
        break;
    case 5:
        Character_MoveV_Unity(arg0);
        break;
    case 6:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0, 15);
            scriptCtx->unk30[1] = 0;
            scriptCtx->unk30[0] = 1;
            break;
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 15) {
                anim = &gAnimation[1]; 
                anim->flags &= ~ANIM_0x80;
                anim->flags &= ~ANIM_BLEND_ACTIVE;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(31, 7);
                MoveNextScript_Unity(arg0);
                break;
            }
            i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
            if (i > 15) {
                i = 15;
            }
            ioRegs->lcd_bldalpha = ((15 - i) << 8) + i;
            break;
        }
        break;
    case 7:
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(15, 0);
        op_proc_exit_iOS(arg0);
        break;
    case 8:
        scriptCtx->flags |= SCRIPT_FULLSCREEN;
        op_proc_exit_iOS(arg0);
        break;
    case 9:
        scriptCtx->flags &= ~SCRIPT_FULLSCREEN;
        op_proc_exit_iOS(arg0);
        break;
    case 10:
        scriptCtx->flags |= SCRIPT_x1000;
        op_proc_exit_iOS(arg0);
        break;
    case 11:
        scriptCtx->flags &= ~SCRIPT_x1000;
        op_proc_exit_iOS(arg0);
        break;
    case 12:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(15, 0);
            scriptCtx->unk30[1] = 0;
            scriptCtx->unk30[0] = 1;
            break;
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 15) {
                anim = &gAnimation[1]; 
                anim->flags &= ~ANIM_0x80;
                anim->flags &= ~ANIM_BLEND_ACTIVE;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(31, 7);
                MoveNextScript_Unity(arg0);
                break;
            }
            i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
            if (i > 0xF) {
                i = 0xF;
            }
            ioRegs->lcd_bldalpha = (i << 8) + (0xF - i);
            break;
        }
        break;
    case 13:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0, 15);
            scriptCtx->unk30[1] = 0;
            scriptCtx->unk30[0] = 1;
            break;
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 15) {
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(31, 7);
                MoveNextScript_Unity(arg0);
                break;
            }
            i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
            if (i > 0xF) {
                i = 0xF;
            }
            ioRegs->lcd_bldalpha = ((0xF - i) << 8) + i;
        }
        break;
    case 14:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(15, 0);
            scriptCtx->unk30[1] = 0;
            scriptCtx->unk30[0] = 1;
            break;
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 15) {
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(31, 7);
                MoveNextScript_Unity(arg0);
                break;
            }
            i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
            if (i > 0xF) {
                i = 0xF;
            }
            ioRegs->lcd_bldalpha = (i << 8) + (0xF - i);
        }
        break;
    case 15:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(24, 15);
            scriptCtx->unk30[1] = 0;
            scriptCtx->unk30[0] = 1;
            main->blendDelay = scriptCtx->unk46[0];
            main->blendDeltaY = scriptCtx->unk46[1];
            scriptCtx->unk46[0] = 1;
            break;
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 24) {
                ioRegs->lcd_dispcnt &= ~DISPCNT_BG2_ON;
                for(i = 0; i < 0x400; i++) // ! i should be another variable or is this just i reuse galore?
                {
                    gBG2MapBuffer[i] = 0xE0A0;
                }
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(31, 7);
                ioRegs->lcd_bldcnt &= ~BLDCNT_TGT1_BG2;
                ioRegs->lcd_bldcnt |= BLDCNT_TGT2_BG2;
                ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_TXT256x256;
                src = gBG2MapBuffer;
                dst = BG_SCREEN_ADDR(30);
                DmaCopy16(3, src, dst, 0x580);
                scriptCtx->unk30[0] = 2;
            } else {
            // BLDALPHA_BLEND(24 - scriptCtx->unk30[1] / scriptCtx->unk46[0], 15)
                i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
                ioRegs->lcd_bldalpha = 0xF18 - i;
            }
            break;
        case 2:
            ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_DARKEN;
            if (++main->blendCounter >= main->blendDelay) {
                main->blendCounter = 0;
                ioRegs->lcd_bldy += main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if ((ioRegs->lcd_bldy == 0x10) || (main->blendDeltaY == 0)) {
                ioRegs->lcd_bldy = 0x10;
                main->blendCounter = 0xFFFF;
                anim = FindAnimationFromAnimId(0xB1U);
                if (anim != NULL) {
                    DestroyAnimation(anim);
                }
                anim = FindAnimationFromAnimId(0xB2U);
                if (anim != NULL) {
                    DestroyAnimation(anim);
                }
                MoveNextScript_Unity(arg0);
                break;
            }
        }
        break;
    case 16:
        switch (scriptCtx->unk30[0]) {
        case 0:
            scriptCtx->unk1E |= 0x8000;
            temp_r2 = (scriptCtx->unk30[5] / 2) * 0x11;
            if (temp_r2 > 0xFF) {
                temp_r2 = 0xFF;
            }
            scriptCtx->flags |= SCRIPT_x40;
            ioRegs->lcd_bg0cnt |= BGCNT_MOSAIC;
            ioRegs->lcd_mosaic = temp_r2 * 0x101;
            scriptCtx->unk30[5]++;
            if (scriptCtx->unk30[5] > 30) {
                if (scriptCtx->unk1E & 8) {
                    scriptCtx->unk1E &= ~8;
                    SetPsycheLockState(9, 0);
                    UpdatePsycheLockAnimation();
                    gMain.psycheLockShownByScriptFlag = 0;
                    DmaCopy16(3, gPsycheLockChainPalettes[0], BG_PLTT+0x1C0, 0x20);
                    DmaCopy16(3, gPsycheLockChainPalettes[1], BG_PLTT+0x1E0, 0x20);
                    ioRegs->lcd_bg3cnt &= ~0x3;
                    ioRegs->lcd_bg3cnt += BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0);
                } else {
                    temp_r2 = (scriptCtx->unk46[2] & 0xF000) >> 0xC;
                    if (temp_r2 == 2) {
                        CheckBGChange_iOS(gSaveDataBuffer.main.currentBG, 1);
                    } else {
                        CheckBGChange_iOS(gSaveDataBuffer.main.currentBG, 0);
                    }
                    sub_801DB60();
                }
                PlayPersonAnimation(scriptCtx->unk46[0], 0, scriptCtx->unk46[1], 0);
                main->talkingAnimationOffset = scriptCtx->unk46[1];
                main->idleAnimationOffset = scriptCtx->unk46[1];
                scriptCtx->unk30[5] = 29;
                scriptCtx->unk30[0] = 1;
            }
            break;
        case 1:
            if ((scriptCtx->unk30[5] == 29) && (scriptCtx->unk46[0] != 0)) {
                if(scriptCtx->unk46[2] & 0xF0) {
                    temp_r2 = (scriptCtx->unk46[2] & 0xF0) >> 4;
                    if(temp_r2 == 1)
                        LoadAndAdjustCurrentAnimation01PaletteByMode(0x1F, 0);
                }
            }
            temp_r2 = (scriptCtx->unk30[5] / 2) * 0x11;
            if (temp_r2 > 0xFF) {
                temp_r2 = 0xFF;
            }
            ioRegs->lcd_mosaic = temp_r2 * 0x101;
            if (scriptCtx->unk30[5] != 0) {
                scriptCtx->unk30[5]--;
                break;
            }
            scriptCtx->unk30[0] = 2;
            break;
        case 2: 
            scriptCtx->flags &= ~SCRIPT_x40;
            if((s32)(s16)scriptCtx->unk46[2] & 0xF) {
                temp_r2 = scriptCtx->unk46[2] & 0xF;
                if (temp_r2 == 0) {
                    //! Dead code causes unk46 to be loaded and shifted
                    temp_r2++;temp_r2--;
                }
            }
                
            scriptCtx->unk1E &= ~0x8000;
            scriptCtx->unk2E = 0;
            scriptCtx->scriptPtr += 4;
            op_proc_exit_iOS(arg0);
            break;
        }
        break;
    case 17:
        switch (scriptCtx->unk30[0]) {
        case 0:
            sub_801D984();
            scriptCtx->unk30[0] = 1;
            scriptCtx->unk30[1] = 0;
            break;
        case 1:
            scriptCtx->unk30[1]++;
            if (scriptCtx->unk30[1] > 21) {
                if (scriptCtx->unk46[0]) {
                    PlaySE(111);
                } else {
                    PlaySE(SE010_GAVEL_SLAM);
                }
                main->shakeTimer = 0xA;
                main->gameStateFlags |= 1;
                main->shakeIntensity = 1;
                ioRegs->lcd_dispcnt |= DISPCNT_BG2_ON;
                ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(2) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT256x256;
                ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(24, 15);
                scriptCtx->unk2E = 0;
                scriptCtx->scriptPtr += 4;
                scriptCtx->unk30[6] = 0;
                scriptCtx->unk30[5] = 0;
                scriptCtx->unk30[4] = 0;
                scriptCtx->unk30[3] = 0;
                scriptCtx->unk30[2] = 0;
                scriptCtx->unk30[1] = 0;
                scriptCtx->unk30[0] = 0;
                scriptCtx->unk30[7] = 0xFFFE;
                scriptCtx->unk2D = 99;
            }
            break;
        }
        break;
    case 18:
        for(i = 0; i < 0x400; i++) {
            gBG2MapBuffer[i] = 0xE0B0; 
        }
        DmaFill16(3, 0, VRAM + 0x9600, 0x20);
        src = gBG2MapBuffer;
        dst = BG_SCREEN_ADDR(30);
        DmaCopy16(3, src, dst, 0x580);
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
        ioRegs->lcd_bldcnt &= ~BLDCNT_TGT1_BG2;
        ioRegs->lcd_bldcnt |= BLDCNT_TGT2_BG2;
        ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_TXT256x256;
        ioRegs->lcd_dispcnt &= ~DISPCNT_BG2_ON;
        *(u32*)&REG_DISPCNT = ioRegs->lcd_dispcnt;
        *(u32*)&REG_BLDCNT = ioRegs->lcd_bldcnt;
        *(u32*)&REG_BG2CNT = ioRegs->lcd_bg2cnt;
        anim = FindAnimationFromAnimId(0xB1U);
        if (anim != NULL) {
            DestroyAnimation(anim);
        }
        anim = FindAnimationFromAnimId(0xB2U);
        if (anim != NULL) {
            DestroyAnimation(anim);
        }
        op_proc_exit_iOS(arg0);
        break;
    case 19:
        switch (scriptCtx->unk30[0]) {
        case 0:
            sub_801D984();
            scriptCtx->unk30[0] = 1;
            scriptCtx->unk30[1] = 0;
            break;
        case 1:
            scriptCtx->unk30[1]++;
            if (scriptCtx->unk30[1] > 21) {
                if (scriptCtx->unk46[0] != 0) {
                    PlaySE(111);
                } else {
                    PlaySE(SE010_GAVEL_SLAM);
                }
                main->shakeTimer = 0xA;
                main->gameStateFlags |= 1;
                main->shakeIntensity = 1;
                ioRegs->lcd_dispcnt |= DISPCNT_BG2_ON;
                ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_TXT256x256;
                ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(24, 15);
                scriptCtx->unk30[0] = 2;
            }
            break;
        case 2:
            if (++scriptCtx->unk30[1] > 31) {
                ioRegs->lcd_dispcnt &= ~DISPCNT_BG2_ON;
                scriptCtx->unk30[0] = 3;
            }
            break;
        case 3:
            scriptCtx->unk30[1]++;
            if (scriptCtx->unk30[1] > 43) {
                ioRegs->lcd_dispcnt |= DISPCNT_BG2_ON;
                if (scriptCtx->unk46[0] != 0) {
                    PlaySE(111);
                } else {
                    PlaySE(SE010_GAVEL_SLAM);
                }
                main->shakeTimer = 0xA;
                main->gameStateFlags |= 1;
                main->shakeIntensity = 1;
                scriptCtx->unk30[0] = 4;
            }
            break;
        case 4:
            scriptCtx->unk30[1]++;
            if (scriptCtx->unk30[1] > 53) {
                ioRegs->lcd_dispcnt &= ~DISPCNT_BG2_ON;
                scriptCtx->unk30[0] = 5;
                return;
            }
            break;
        case 5:
            scriptCtx->unk30[1]++;
            if (scriptCtx->unk30[1] > 66) {
                ioRegs->lcd_dispcnt |= DISPCNT_BG2_ON;
                if (scriptCtx->unk46[0] != 0) {
                    PlaySE(0x6FU);
                } else {
                    PlaySE(SE010_GAVEL_SLAM);
                }
                main->shakeTimer = 0xA;
                main->gameStateFlags |= 1;
                main->shakeIntensity = 1;
                scriptCtx->unk2E = 0;
                scriptCtx->scriptPtr += 4;
                scriptCtx->unk30[6] = 0;
                scriptCtx->unk30[5] = 0;
                scriptCtx->unk30[4] = 0;
                scriptCtx->unk30[3] = 0;
                scriptCtx->unk30[2] = 0;
                scriptCtx->unk30[1] = 0;
                scriptCtx->unk30[0] = 0;
                scriptCtx->unk30[7] = 0xFFFE;
                scriptCtx->unk2D = 99;
            }
            break;
        }
        break;
        // ! case 20: Doesn't exist
    case 21:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0xF, 0);
            scriptCtx->unk30[1] = 2;
            scriptCtx->unk30[0] = 1;
            dst = gUnknown_0826FE38;
            src = ((u32*)dst)[1] + gUnknown_08252498;
            dst = (u32*)(OBJ_PLTT+0x1A0);
            anim = &gAnimation[1];
            if (anim->flags & ANIM_0x400) {
                for(i = 0; i < 0x10; i++) {
                    *dst = ColorFadeGrayscale(*src, 0x20, 0);
                    src++;
                    dst++;
                }
            } else {
                DmaCopy16(3, src, dst, 0x20);
            }
            anim = &gAnimation[1];
            anim->flags |= 0x80;
            for(i = 0; i < 3; i++) {
                anim = FindAnimationFromAnimId(i + 0x83);
                if (anim != NULL) {
                    anim->flags |= ANIM_0x80;
                }
            }
            // fallthrough
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 15) {
                sub_8016FEC(0);
                DestroyAnimation(&gAnimation[1]);
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 7);
                if (scriptCtx->unk4E != 5 && scriptCtx->unk4E != 6) {
                    scriptCtx->unk20 = scriptCtx->unk4E;
                    scriptCtx->unk4E = 6;
                }
                MoveNextScript_Unity(arg0);
                break;
            }
            i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
            if (i > 15) {
                i = 15;
            }
            ioRegs->lcd_bldalpha = (i << 8) + (15 - i);
            break;
        }
        break;
    case 22:
        switch (scriptCtx->unk30[0]) {
        case 0:
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0xF, 0);
            scriptCtx->unk30[1] = 2;
            scriptCtx->unk30[0] = 1;
            PlayPersonAnimationAtCustomOrigin(scriptCtx->unk46[1], scriptCtx->unk46[2], 0x78, 0x50, 0x80);
            main->talkingAnimationOffset = scriptCtx->unk46[2];
            main->idleAnimationOffset = scriptCtx->unk46[2];
            anim = &gAnimation[1];
            anim->flags |= 0x80;
            dst = gUnknown_0826FE38;
            src = ((u32*)dst)[1] + gUnknown_08252498;
            dst = (u32*)(OBJ_PLTT+0x1A0);
            DmaCopy16(3, src, dst, 0x20);
            anim = sub_8016FB4();
            anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
            if (scriptCtx->unk4E == 6) {
                scriptCtx->unk4E = scriptCtx->unk20;
                for(i = 0; i < 3; i++) {
                    anim = FindAnimationFromAnimId(i + 0x83);
                    if (anim != NULL) {
                        anim->flags |= ANIM_0x80;
                    }
                }
            }
            // fallthrough
            // ! doesn't change state
        case 1:
            if (++scriptCtx->unk30[1] > scriptCtx->unk46[0] * 0xF) {
                anim = &gAnimation[1];
                anim->flags &= ~ANIM_0x80;
                anim->flags &= ~ANIM_0x40; 
                anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD; 
                anim->flags &= ~ANIM_BLEND_ACTIVE;
                scriptCtx->unk30[0] = 2;
                scriptCtx->unk30[1] = 0;
                scriptCtx->unk46[0] = 1;
            } else {
                i = scriptCtx->unk30[1] / scriptCtx->unk46[0];
                if (i > 0xF) {
                    i = 0xF;
                }
                ioRegs->lcd_bldalpha = ((0xF - i) << 8) + i;
            }
            break;
        case 2:
            if (++scriptCtx->unk30[1] >= scriptCtx->unk46[0] * 7) {
                dst = gUnknown_0826F888;
                src = gUnknown_08252498 + 1[(u32*)dst];
                dst = (u32*)(OBJ_PLTT+0x1A0);
                DmaCopy16(3, src, dst, 0x20);
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 7);
                *(u16*)&REG_BLDALPHA = ioRegs->lcd_bldalpha;
                for(i = 0; i < 3; i++) {
                    anim = FindAnimationFromAnimId(i + 0x83);
                    if (anim != NULL) {
                        anim->flags &= ~ANIM_0x80;
                        anim->flags &= ~ANIM_0x40;
                        anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
                        anim->flags &= ~ANIM_BLEND_ACTIVE;
                    }
                }
                MoveNextScript_Unity(arg0);
            } else {
                temp_r2 = scriptCtx->unk30[1] / scriptCtx->unk46[0];
                ioRegs->lcd_bldalpha = (temp_r2 << 8) + (0x10 - (temp_r2 / 2));
            }
            break;
        }
        break;
    case 23:
        switch (scriptCtx->unk30[0]) {
        case 0:
            dst = gUnknown_0826FE38;
            src = ((u32*)dst)[1] + gUnknown_08252498;
            dst = (u32*)(OBJ_PLTT+0x1A0);
            anim = &gAnimation[1];
            if (anim->flags & ANIM_0x400) {
                for(i = 0; i < 0x10; i++) {
                    *dst = ColorFadeGrayscale(*src, 0x20, 0);
                    src++;
                    dst++;
                }
            } else {
                DmaCopy16(3, src, dst, 0x20);
            }
            main->blendDelay = scriptCtx->unk46[0];
            main->blendDeltaY = scriptCtx->unk46[1];
            anim = sub_8016FB4();
            anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
            anim->flags &= ~ANIM_0x40;
            anim->flags &= ~ANIM_0x80;
            scriptCtx->unk30[0] = 1;

        case 1:
            ioRegs->lcd_bldcnt = BLDCNT_EFFECT_DARKEN | scriptCtx->unk46[2];
            if (++main->blendCounter >= main->blendDelay) {
                main->blendCounter = 0;
                ioRegs->lcd_bldy += main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if ((ioRegs->lcd_bldy == 0x10) || (main->blendDeltaY == 0)) {
                ioRegs->lcd_bldy = 0x10;
                main->blendCounter = 0xFFFF;
                if (scriptCtx->unk46[2] & BLDCNT_TGT1_OBJ) {
                    sub_8016FEC(0);
                    DestroyAnimation(&gAnimation[1]);
                }
                MoveNextScript_Unity(arg0);
            }
            break;
        }
        break;
    case 24:
        switch (scriptCtx->unk30[0]) {
        case 0:
            dst = gUnknown_0826FE38;
            src = ((u32*)dst)[1] + gUnknown_08252498;
            anim = &gAnimation[1];
            dst = (u32*)(OBJ_PLTT+0x1A0);
            if (anim->flags & ANIM_0x400) {
                for(i = 0; i < 0x10; i++) {
                    *dst = ColorFadeGrayscale(*src, 0x20, 0);
                    src++;
                    dst++;
                }
            } else {
                DmaCopy16(3, src, dst, 0x20);
            }
            main->blendDelay = scriptCtx->unk46[0];
            main->blendDeltaY = scriptCtx->unk46[1];
            anim = sub_8016FB4();
            anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD; 
            anim->flags &= ~ANIM_0x40; 
            anim->flags &= ~ANIM_0x80; 
            anim->flags &= ~ANIM_BLEND_ACTIVE; 
            scriptCtx->unk30[0] = 1;

        case 1:
            ioRegs->lcd_bldcnt = BLDCNT_EFFECT_DARKEN | scriptCtx->unk46[2];
            if (++main->blendCounter >= main->blendDelay) {
                main->blendCounter = 0;
                ioRegs->lcd_bldy -= main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if ((ioRegs->lcd_bldy == 0) || (main->blendDeltaY == 0)) {
                ioRegs->lcd_bldy = 0;
                main->blendCounter = 0xFFFF;
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x10, 0);
                ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ;
                anim = sub_8016FB4();
                anim->flags |= ANIM_0x80;
                scriptCtx->unk30[1] = 0;
                scriptCtx->unk46[1] = 1;
                scriptCtx->unk30[0] = 2;
            }
            break;
        case 2:
            if (++scriptCtx->unk30[1] >= scriptCtx->unk46[1] * 7) {   
                dst = gUnknown_0826F888;
                src = ((u32*)dst)[1] + gUnknown_08252498;
                dst = (u32*)(OBJ_PLTT+0x1A0);
                anim = &gAnimation[1];
                if (anim->flags & ANIM_0x400) {
                    for(i = 0; i < 0x10; i++) {
                        *dst = ColorFadeGrayscale(*src, 0x20, 0);
                        src++;
                        dst++;
                    }
                } else {
                    DmaCopy16(3, src, dst, 0x20);
                }
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 7);
                *(u16*)&REG_BLDALPHA = BLDALPHA_BLEND(0x1F, 7);
                MoveNextScript_Unity(arg0);
            } else {
                i = scriptCtx->unk30[1] / scriptCtx->unk46[1];
                ioRegs->lcd_bldalpha = (i << 8) + (0x10 - (i / 2));
            }
            break;
        }
        break;
    case 25:
        switch (scriptCtx->unk30[0]) {
        case 0:
            dst = gUnknown_0826FE38;
            src = ((u32*)dst)[1] + gUnknown_08252498;
            dst = (u32*)(OBJ_PLTT+0x1A0);
            anim = &gAnimation[1];
            if (anim->flags & ANIM_0x400) {
                for(i = 0; i < 0x10; i++) {
                    *dst = ColorFadeGrayscale(*src, 0x20, 0);
                    src++;
                    dst++;
                }
            } else {
                DmaCopy16(3, src, dst, 0x20);
            }
            main->blendDelay = scriptCtx->unk46[1];
            main->blendDeltaY = scriptCtx->unk46[0];
            anim = sub_8016FB4();
            anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD; 
            anim->flags &= ~ANIM_0x40; 
            anim->flags &= ~ANIM_0x80; 
            anim->flags &= ~ANIM_BLEND_ACTIVE; 
            scriptCtx->unk30[0] = 1;

        case 1:
            ioRegs->lcd_bldcnt = main->blendTarget | BLDCNT_EFFECT_LIGHTEN;
            if (++main->blendCounter >= main->blendDelay) {
                main->blendCounter = 0;
                ioRegs->lcd_bldy += main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if ((ioRegs->lcd_bldy == 0x10) || (main->blendDeltaY == 0)) {
                ioRegs->lcd_bldy = 0x10;
                main->blendMode = 0;
                main->blendCounter = 0xFFFF;
                sub_8016FEC(0);
                DestroyAnimation(&gAnimation[1]);
                MoveNextScript_Unity(arg0);
            }
            break;
        }
        break;
    case 26:
        switch (scriptCtx->unk30[0]) {
        case 0:
            dst = gUnknown_0826FE38;
            src = ((u32*)dst)[1] + gUnknown_08252498;
            dst = (u32*)(OBJ_PLTT+0x1A0);
            anim = &gAnimation[1];
            if (anim->flags & ANIM_0x400) {
                for(i = 0; i < 0x10; i++) {
                    *dst = ColorFadeGrayscale(*src, 0x20, 0);
                    src++;
                    dst++;
                }
            } else {
                DmaCopy16(3, src, dst, 0x20);
            }
            main->blendDelay = scriptCtx->unk46[0];
            main->blendDeltaY = scriptCtx->unk46[1];
            anim = sub_8016FB4();
            anim->flags &= ~ANIM_QUEUED_PAL_UPLOAD; 
            anim->flags &= ~ANIM_0x40; 
            anim->flags &= ~ANIM_0x80; 
            anim->flags &= ~ANIM_BLEND_ACTIVE; 
            scriptCtx->unk30[0] = 1;

        case 1:
            ioRegs->lcd_bldcnt = main->blendTarget | BLDCNT_EFFECT_LIGHTEN;
            if (++main->blendCounter >= main->blendDelay) {
                main->blendCounter = 0;
                ioRegs->lcd_bldy -= main->blendDeltaY;
            }
            ioRegs->lcd_bldy &= 0x1F;
            if ((ioRegs->lcd_bldy == 0) || (main->blendDeltaY == 0)) {
                ioRegs->lcd_bldy = 0;
                main->blendMode = 0;
                main->blendCounter = 0xFFFF;
                ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ;
                anim = sub_8016FB4();
                anim->flags |= ANIM_0x80;
                scriptCtx->unk30[1] = 0;
                scriptCtx->unk46[1] = 1;
                scriptCtx->unk30[0] = 2;
            }
            break;
        case 2:
            if (++scriptCtx->unk30[1] >= scriptCtx->unk46[1] * 7) {
                dst = gUnknown_0826F888;
                src = ((u32*)dst)[1] + gUnknown_08252498;
                dst = (u32*)(OBJ_PLTT+0x1A0);
                anim = &gAnimation[1]; 
                if (anim->flags & ANIM_0x400) {
                    for(i = 0; i < 0x10; i++) {
                        *dst = ColorFadeGrayscale(*src, 0x20, 0);
                        src++;
                        dst++;
                    }
                } else {
                    DmaCopy16(3, src, dst, 0x20);
                }
                ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 7);
                *(u16*)&REG_BLDALPHA = BLDALPHA_BLEND(0x1F, 7);
                MoveNextScript_Unity(arg0);
            } else {
                i = scriptCtx->unk30[1] / scriptCtx->unk46[1];
                ioRegs->lcd_bldalpha = (i << 8) + (0x10 - (i / 2));
            }
            break;
        }
        break;
    case 27:
        scriptCtx->unk4E = 1;
        op_proc_exit_iOS(arg0);
        break;
    case 28:
        scriptCtx->unk4E = 3;
        op_proc_exit_iOS(arg0);
        break;
    case 29:
        scriptCtx->unk4E = 8;
        op_proc_exit_iOS(arg0);
        break;
    case 30:
        scriptCtx->unk4E = 4;
        op_proc_exit_iOS(arg0);
        break;
    case 31:
        switch (scriptCtx->unk30[0]) {
        case 1:
            break;
        case 0:
            main->previousBG = main->currentBG;
            main->currentBG = 14;
            main->currentBgStripe = 1;
            main->unk258 = 0;
            scriptCtx->unk40 = 0x80;
            main->unk3D |= 2;
            scriptCtx->unk30[1] = 1;
            break;
        case 2:
            src = sub_8002278(14);    
            DmaCopy16(3, src, PLTT+0x40, 0x20);
            if (scriptCtx->unk46[0]) {
                switch (scriptCtx->unk46[1]) {
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
                    break;
                }
            }
            gMain.horizontolBGScrollSpeed = scriptCtx->unk46[2] != 0 ? 14 : -14;
            MoveNextScript_Unity(arg0);
        }
        break;
    case 32:
        arg0->unk30[5] = 0;
        arg0->unk30[4] = 0;
        arg0->unk30[3] = 0;
        arg0->unk30[2] = 0;
        arg0->unk30[1] = 0;
        arg0->unk30[0] = 0;
        arg0->unk30[6] = scriptCtx->unk46[0];
        arg0->unk30[7] = 0xFFFF;
        scriptCtx->unk2D = 99;
        break;
    case 33:
        i = *(u32*)gAnimation[1].animationInfo.animGfxDataStartPtr;
        // ! BUG this is doing a DmaCopy16 from NULL! it should be a DmaFill16 instead
        if (i == 3) {
            DmaCopy16(3, 0, OBJ_PLTT + 0x1A0, 0x60);
        } else {
            DmaCopy16(3, 0, OBJ_PLTT + 0x1C0, i * 0x20);
        }
        op_proc_exit_iOS(arg0);
        break;
    case 34:
        anim = &gAnimation[1]; 
        anim->flags |= ANIM_0x800;
        gIORegisters.lcd_mosaic = (scriptCtx->unk46[0] << 8) | (scriptCtx->unk46[0] << 0xC);
        ioRegs->lcd_bg3cnt &= ~BGCNT_MOSAIC;
        ioRegs->lcd_bg2cnt &= ~BGCNT_MOSAIC;
        main->effectType = 19;
        main->effectIntensity = scriptCtx->unk46[1];
        main->effectDelay = scriptCtx->unk46[2];
        main->effectCounter = 0;
        for(i = 0; i < 4; i++) {
            gOamObjects[0x30 + i].attr0 &= 0xEFFF;
        }
        op_proc_exit_iOS(arg0);
        break;
    case 35:
        ioRegs->lcd_bldcnt = BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT2_BG3;
        ioRegs->lcd_bldy = 0x10;
        main->effectType = 20;
        main->effectIntensity = scriptCtx->unk46[0];
        main->effectDelay = scriptCtx->unk46[1];
        main->effectCounter = 0;
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0xF, 0);
        for(i = 0; i < 4; i++) {
            gOamObjects[0x30 + i].attr0 |= ST_OAM_OBJ_BLEND << 10;
        }
        op_proc_exit_iOS(arg0);
        break;
    case 36:
        anim = &gAnimation[1];
        anim->flags &= ~ANIM_0x800;
        ioRegs->lcd_mosaic = 0;
        ioRegs->lcd_bg3cnt |= BGCNT_MOSAIC;
        ioRegs->lcd_bg2cnt |= BGCNT_MOSAIC;
        main->effectType = 0;
        main->effectIntensity = 0;
        main->effectDelay = 0;
        main->effectCounter = 0;
        op_proc_exit_iOS(arg0);
        break;
    case 37:
        if (main->effectType != 0) {
            return;
        }
        if (ioRegs->lcd_bldy == 0x10) {
            return;
        }
        ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_DARKEN;
        ioRegs->lcd_bldy = 0;
        main->effectType = 0;
        main->effectIntensity = 0;
        main->effectDelay = 0;
        main->effectCounter = 0;
        ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0xF, 0);
        for(i = 0; i < 4; i++) {
            gOamObjects[0x30 + i].attr0 &= ~(ST_OAM_OBJ_BLEND << 10);
        }
        scriptCtx->unk2E &= 0xF0;
        MoveNextScript_Unity(arg0);
        op_proc_exit_iOS(arg0);
        break;
    case 38:
        scriptCtx->unk1E |= 1;
        op_proc_exit_iOS(arg0);
        break;
    case 39:
        scriptCtx->unk1E |= 2;
        op_proc_exit_iOS(arg0);
        break;
    case 40:
        scriptCtx->unk1E |= 4;
        op_proc_exit_iOS(arg0);
        break;
    case 41:
        scriptCtx->unk1E |= 8;
        op_proc_exit_iOS(arg0);
        break;
    case 42:
        scriptCtx->unk1E |= 0x10;
        scriptCtx->unk1E |= 0x20;
        op_proc_exit_iOS(arg0);
        break;
    case 43:
        scriptCtx->unk1E &= ~0x10;
        scriptCtx->unk1E &= ~0x20;
        op_proc_exit_iOS(arg0);
        break;
    case 44:
        scriptCtx->unk1E |= 0x10;
        op_proc_exit_iOS(arg0);
        break;
    case 45:
        scriptCtx->unk1E |= 0x20;
        op_proc_exit_iOS(arg0);
        break;
    case 46:
        sub_8015C18();
        op_proc_exit_iOS(arg0);
        break;
    case 47:
        sub_8006EAC(&gMain);
        if (arg0->unk46[0] != 99) {
            return;
        }
        arg0->unk2E &= 0xF0;
        MoveNextScript_Unity(arg0);
        break;
    case 48:
    {
        u8 arr[] = {
            72,
            32,
            32,
            32,
            80
        };
        switch (scriptCtx->unk30[0]) {
        case 0:
            anim = &gAnimation[1];
            DestroyAnimation(anim);
            if (scriptCtx->unk46[0] != 0) {
                anim->flags |= ANIM_0x400;
            }
            scriptCtx->unk30[2] = 0;
            scriptCtx->unk30[1] = 0;
            scriptCtx->unk30[0] += 1;
            return;
        case 1:
            if (++scriptCtx->unk30[1] >= arr[scriptCtx->unk30[2]]) {
                scriptCtx->unk30[1] = 0;
                anim = &gAnimation[1];
                anim->animationInfo.yOrigin -= 12;
                if (++scriptCtx->unk30[2] >= ARRAY_COUNT(arr)) {
                    MoveNextScript_Unity(arg0);
                }
            }
            break;
        }
        break;
    }
    case 49:
        scriptCtx->unk4E = 7;
        op_proc_exit_iOS(arg0);
        break;
    case 50:
        arg0->unk46[0] &= 3;
        gIORegisters.lcd_bg3cnt = arg0->unk46[0] + (gIORegisters.lcd_bg3cnt & ~0x3);
        op_proc_exit_iOS(arg0);
        break;
    case 51:
        if (arg0->unk46[0] != 0) {
            arg0->unk1E &= ~0x100;
            main->process[2] = 7;
            main->process[3] = 0;
        } else {
            arg0->unk1E |= 0x100;
        }
        op_proc_exit_iOS(arg0);
        break;
    case 52:
        anim = FindAnimationFromAnimId(scriptCtx->unk46[0]);
        anim->flags |= ANIM_0x400;
        op_proc_exit_iOS(arg0);
        break;
    case 53:
        scriptCtx->unk1E |= 0x200;
        op_proc_exit_iOS(arg0);
        break;
    case 54:
        scriptCtx->unk1E |= 0x400;
        op_proc_exit_iOS(arg0);
        break;
    case 55:
        switch (scriptCtx->unk30[0]) {
        case 0:
            main->previousBG = main->currentBG;
            main->currentBG = scriptCtx->unk46[0];
            main->currentBgStripe = 1;
            main->unk258 = 4;
            scriptCtx->unk40 = 0x80;
            scriptCtx->unk30[0] = 1;
            break;
        case 1:
            DmaCopy16(3, gBG3MapBuffer, gBG2MapBuffer, 0x800);
            ioRegs->lcd_bg2vofs = 8;
            ioRegs->lcd_bg2hofs = 8;
            *(u16*)&REG_BG2HOFS = ioRegs->lcd_bg2hofs;
            *(u16*)&REG_BG2VOFS = ioRegs->lcd_bg2vofs;
            main->tilemapUpdateBits |= 4;
            ioRegs->lcd_dispcnt |= DISPCNT_BG2_ON;
            ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_WRAP;
            ioRegs->lcd_bg3cnt = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_SCREENBASE(31) | BGCNT_WRAP;
            src = eBGDecompBuffer+0x4B00;
            dst = VRAM + 0x9000;
            DmaCopy16(3, src, dst, 0x4B00);
            src = sub_8002278(scriptCtx->unk46[0]);
            dst = PLTT+0x60;
            DmaCopy16(3, src, dst, 0x20);
            sub_800610C();
            ioRegs->lcd_bldy = 0;
            ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_OBJ;
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0, 0x10);
            scriptCtx->unk46[0] = 0;
            scriptCtx->unk46[2] = 0;
            scriptCtx->unk30[0] = 2;
            break;
        case 2:
            scriptCtx->unk46[0]++;
            if (scriptCtx->unk46[0] > scriptCtx->unk46[1]) {
                scriptCtx->unk46[0] = 0;
                scriptCtx->unk46[2]++;
                ioRegs->lcd_bldalpha = scriptCtx->unk46[2] + ((0x10 - scriptCtx->unk46[2]) << 8);
            }
            if (scriptCtx->unk46[2] != 0x10) {
                break;
            }
            scriptCtx->unk30[0] = 3;
            break;
        case 3:
            src = VRAM + 0x9000;
            dst = VRAM + 0x4000;
            DmaCopy16(3, src, dst, 0x4B00);
            src = PLTT + 0x60;
            dst = PLTT + 0x40;
            DmaCopy16(3, src, dst, 0x20);
            sub_80060E8();
            ioRegs->lcd_bg3cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_SCREENBASE(31) | BGCNT_WRAP | BGCNT_TXT256x256;
            ioRegs->lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_WRAP | BGCNT_TXT256x256;
            
            ioRegs->lcd_bg3hofs = 8;
            ioRegs->lcd_bg3vofs = 8;
            ioRegs->lcd_bg2hofs = 8;
            ioRegs->lcd_bg2vofs = 0;
            main->tilemapUpdateBits = (0xFB & main->tilemapUpdateBits) | 8;
            ioRegs->lcd_dispcnt &= ~DISPCNT_BG2_ON;
            ioRegs->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ;
            ioRegs->lcd_bldy = 0;
            ioRegs->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
            MoveNextScript_Unity(arg0);
        }
        break;
    case 56:
        if (scriptCtx->unk46[0] != 0) {
            main->currentBG = 95;
            CopyBGDataToVram(95);
        } else {
            main->currentBG = 94;
            CopyBGDataToVram(94);
        }
        op_proc_exit_iOS(arg0);
        break;
    case 57:
        if (scriptCtx->unk46[2] != 1) {
            gOamObjects[scriptCtx->unk46[1]].attr0 = SPRITE_ATTR0_CLEAR;
        } else {
            gMapMarker[scriptCtx->unk46[0]].oamIdx = scriptCtx->unk46[1];
        }
        op_proc_exit_iOS(arg0);
        break;
    case 58:
        if (scriptCtx->unk46[0] != 1) {
            scriptCtx->unk1E &= ~0x2000;
        } else {
            scriptCtx->unk1E |= 0x2000;
        }
        op_proc_exit_iOS(arg0);
        break;
    }
}
