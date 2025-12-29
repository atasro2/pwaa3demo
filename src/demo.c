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

void CheckBGChange_iOS(u32 arg0, u32 arg1) {
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