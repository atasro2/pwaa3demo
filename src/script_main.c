#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "constants/process.h"

extern void (*gUnknown_0814E338[])(struct ScriptContext *);

void sub_8016F74(void) {
    struct ScriptContext * context = &gScriptContext;
    gUnknown_0814E338[context->unk2C](context);
}

void sub_8016F98(struct ScriptContext * scriptCtx) {
    scriptCtx->unk30[7] = 0;
    scriptCtx->unk30[6] = 0;
    scriptCtx->unk30[5] = 0;
    scriptCtx->unk30[4] = 0;
    scriptCtx->unk30[3] = 0;
    scriptCtx->unk30[2] = 0;
    scriptCtx->unk30[1] = 0;
    scriptCtx->unk30[0] = 0;
    scriptCtx->unk2D = 99;
}

struct AnimationListEntry * sub_8016FB4(void) {
    u32 dahliaThing[] = { // TODO: give this a good name please
        0x74,
        0x75,
        0x76,
        0x77,
        0x78,
        0x79,
        0x7A,
        0x7B,
        0x7C,
        0x7D,
        0x7E,
        0x7F,
        0x80,
        0x81,
        0x82,
        0xFF,
    };
    u32 i;
    for(i = 0; dahliaThing[i] != 0xFF; i++) {
        struct AnimationListEntry * anim = FindAnimationFromAnimId(dahliaThing[i]);
        if(anim)
            return anim;
    }
    return NULL;
}

void sub_8016FEC(u16 arg0) { // dahlia shawl stuff probs
    u32 r5 = 0xFF;
    struct ScriptContext * scriptCtx = &gScriptContext;
    u32 array[] = { // ? array of animation offsets? 
        0x0,
        0x1A8,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x6D8,
    };
    struct AnimationListEntry * animation = &gAnimation[1];
    u8 i;

    if(arg0) {
        if(animation == NULL
        || (animation->animationInfo.personId != 11 && animation->animationInfo.personId != 33)
        || !(animation->flags & ANIM_ALLOCATED)) {
            sub_8016FEC(0); // recursing!!
            return;
        }
    }

    for(i = 0; i < 16; i++) {
        if(animation->animationInfo.animFrameDataStartPtr - (u8*)0x8249e10 == array[i]) {
            r5 = i;
        }
    }

    if(arg0 && r5 == 0xFF) {
        sub_8016FEC(0);
        return;
    }

    animation = sub_8016FB4();
    if(arg0 == 0) {
        DestroyAnimation(animation);
        return;
    }
    if(arg0 == 1) {
        sub_8016FEC(0);
        if(r5 == 14)
            r5 = 7;
        if(r5 == 15)
            r5 = 14;
        PlayAnimation(r5 + 0x74);
        if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS) {
            s16 xOrigin;
            animation = &gAnimation[1];
            xOrigin = animation->animationInfo.xOrigin;
            animation = sub_8016FB4();
            animation->animationInfo.xOrigin = xOrigin;
        }
        if(gScriptContext.unk1E & 0x8000) { // ! mixing global and local memes continue
            if(scriptCtx->unk4A & 0xF0) {
                animation = sub_8016FB4();
                animation->flags |= ANIM_0x400;
            }
        }
        animation = &gAnimation[1];
        if(animation->flags & ANIM_0x400) {
            animation = sub_8016FB4();
            animation->flags |= ANIM_0x400 | ANIM_QUEUED_PAL_UPLOAD;
        }
        if(r5 == 0xC) {
            scriptCtx->unk4E &= 0xFF00;
            scriptCtx->unk4E += 11;
            return;
        }
        if(scriptCtx->unk4E == 6) {
            scriptCtx->unk4E = 9;
        }
    } else if(arg0 == 2) {
        animation->flags &= ~ANIM_ACTIVE;
    } else if(arg0 == 3) {
        animation->flags |= ANIM_ACTIVE;
    } else if(arg0 == 4) {
        animation->flags |= ANIM_0x400 | ANIM_QUEUED_PAL_UPLOAD;
    }
}