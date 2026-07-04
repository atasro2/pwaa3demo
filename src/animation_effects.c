#include "global.h"
#include "animation.h"
#include "court.h"
#include "script.h"

const s8 gCourtScroll01AnimOffsets[31] = {
	0x03, 0x00, 0x14, 0x00, 0x24, 0x00, 0x34, 0x00, 0x3c, 0x00, 0x2f, 0x00, 0x1e, 0x00, 0x0c, 0x00,
	0x02, 0x00, 0x14, 0x00, 0x28, 0x00, 0x1b, 0x00, 0x3a, 0x00, 0x2c, 0x00, 0x1c, 0x00, 0x0b
};

const s8 gCourtScroll02AnimOffsets[31] = {
	0x03, 0x00, 0x06, 0x00, 0x0a, 0x00, 0x0e, 0x00, 0x14, 0x00, 0x1a, 0x00, 0x1f, 0x00, 0x11, 0x00,
	0x1b, 0x00, 0x1f, 0x00, 0x23, 0x00, 0x26, 0x00, 0x23, 0x00, 0x23, 0x00, 0x03, 0x00, 0x00
};

const s8 gCourtScroll03AnimOffsets[31] = {
	0x02, 0x00, 0x04, 0x00, 0x0a, 0x00, 0x10, 0x00, 0x12, 0x00, 0x14, 0x00, 0x1e, 0x00, 0x26, 0x00,
	0x1b, 0x00, 0x1f, 0x00, 0x23, 0x00, 0x26, 0x00, 0x23, 0x00, 0x23, 0x00, 0x03, 0x00, 0x00
};

void ScrollMode2AnimationUpdate(struct AnimationListEntry * animation, struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    s32 i;
    s32 index;
    animation->animationInfo.xOrigin += gCourtScroll01AnimOffsets[courtScroll->frameCounter];
    if(courtScroll->frameCounter == 0xF) {
        PlayPersonAnimationAtCustomOrigin(courtScroll->scrollingPersonAnimId, courtScroll->animOffset, -110, 80, 0);
        SetCurrentPersonAnimationOffset(courtScroll->scrollingPersonAnimId, courtScroll->animOffset);
        if(scriptCtx->unk1E & 0x200) {
            gAnimation[1].flags |= ANIM_0x400;
        }
    }
    index = 0;
    for(i = 0; i < courtScroll->frameCounter; i++) {
        index += gCourtScroll01AnimOffsets[i];
    }
    if(courtScroll->frameCounter == 0xF) {
        LoadCounselBenchGraphics();
    }
    if(courtScroll->frameCounter > 0xE) {
        SetOAMForCourtBenchSpritesDefense(index-480, 0x80, 1);
    }
    else {
        SetOAMForCourtBenchSpritesProsecution(index+32, 0x80, 1);
    }
}

void ScrollMode3AnimationUpdate(struct AnimationListEntry * animation, struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    s32 i;
    s32 index;
    const s8 *ptr, *ptr2;
    animation->animationInfo.xOrigin -= gCourtScroll01AnimOffsets[30-courtScroll->frameCounter];
    if(courtScroll->frameCounter == 0xF) {
        PlayPersonAnimationAtCustomOrigin(courtScroll->scrollingPersonAnimId, courtScroll->animOffset, 350, 80, 0);
        SetCurrentPersonAnimationOffset(courtScroll->scrollingPersonAnimId, courtScroll->animOffset);
        if(scriptCtx->unk1E & 0x200) {
            gAnimation[1].flags |= ANIM_0x400;
        }
    }
    index = 0;
    for(i = 0; i < courtScroll->frameCounter; i++) {
        index += gCourtScroll01AnimOffsets[30-i];
    }
    if(courtScroll->frameCounter == 0xF) {
        LoadCounselBenchGraphics();
    }
    if(courtScroll->frameCounter > 0xE) {
        SetOAMForCourtBenchSpritesDefense(index, 0x80, 1);
    }
    else {
        SetOAMForCourtBenchSpritesProsecution(index+544, 0x80, 1);
    }
}

void ScrollMode4AnimationUpdate(struct AnimationListEntry * animation, struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    s32 i;
    u32 index;
    animation->animationInfo.xOrigin += gCourtScroll02AnimOffsets[courtScroll->frameCounter];
    if(courtScroll->frameCounter == 0xE) {
        PlayPersonAnimationAtCustomOrigin(courtScroll->scrollingPersonAnimId, courtScroll->animOffset, -84, 80, 0);
        SetCurrentPersonAnimationOffset(courtScroll->scrollingPersonAnimId, courtScroll->animOffset);
        if(scriptCtx->unk1E & 0x200) {
            gAnimation[1].flags |= ANIM_0x400;
        }
    }
    if(animation->animationInfo.personId == 11 || animation->animationInfo.personId == 33) {
        struct AnimationListEntry * anim2 = sub_8016FB4();
        anim2->animationInfo.xOrigin = animation->animationInfo.xOrigin;
        if(scriptCtx->unk4E == 6) {
            scriptCtx->unk4E = 9;
        }
    }
    if(courtScroll->frameCounter == 0xE) {
        LoadWitnessBenchGraphics();
    }
    if(courtScroll->frameCounter > 0xD) {
        index = 0;
        for(i = 0xF; i < courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[i];
        }
        SetOAMForCourtBenchSpritesWitness(index-180, 0x80, 1);
    }
    else {
        index = 0;
        for(i = 0; i < courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[i];
        }
        SetOAMForCourtBenchSpritesProsecution(index+32, 0x80, 1);
    }
}

void ScrollMode5AnimationUpdate(struct AnimationListEntry * animation, struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    s32 i;
    s32 index;
    animation->animationInfo.xOrigin -= gCourtScroll03AnimOffsets[courtScroll->frameCounter];
    if(courtScroll->frameCounter == 0xD) {
        PlayPersonAnimationAtCustomOrigin(courtScroll->scrollingPersonAnimId, courtScroll->animOffset, 220, 80, 0);
        SetCurrentPersonAnimationOffset(courtScroll->scrollingPersonAnimId, courtScroll->animOffset);
        if(scriptCtx->unk1E & 0x200) {
            gAnimation[1].flags |= ANIM_0x400;
        }
        if(scriptCtx->unk4E != 0 && scriptCtx->unk4E != 6) {
            scriptCtx->unk20 = scriptCtx->unk4E;
            scriptCtx->unk4E = 5;
        }
    }
    if(animation->animationInfo.personId == 11 || animation->animationInfo.personId == 33) {
        struct AnimationListEntry * anim2 = sub_8016FB4();
        anim2->animationInfo.xOrigin = animation->animationInfo.xOrigin;
    }
    if(courtScroll->frameCounter == 0xD) {
        LoadCounselBenchGraphics();
    }
    if(courtScroll->frameCounter > 0xD) {
        index = 0;
        for(i = 15; i < courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[i];
        }
        SetOAMForCourtBenchSpritesWitness(index-180, 0x80, 1);
    }
    else {

        index = 0;
        for(i = 0; i < 32-courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[32-i];
        }
        SetOAMForCourtBenchSpritesProsecution(362-index, 0x80, 1);
    }
}

void ScrollMode0AnimationUpdate(struct AnimationListEntry * animation, struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    s32 i;
    u32 index;
    animation->animationInfo.xOrigin -= gCourtScroll02AnimOffsets[courtScroll->frameCounter];
    if(courtScroll->frameCounter == 0xE) {
        PlayPersonAnimationAtCustomOrigin(courtScroll->scrollingPersonAnimId, courtScroll->animOffset, 324, 80, 0);
        SetCurrentPersonAnimationOffset(courtScroll->scrollingPersonAnimId, courtScroll->animOffset);
        if(scriptCtx->unk1E & 0x200) {
            gAnimation[1].flags |= ANIM_0x400;
        }
    }
    if(animation->animationInfo.personId == 11 || animation->animationInfo.personId == 33) {
        struct AnimationListEntry * anim2 = sub_8016FB4();
        anim2->animationInfo.xOrigin = animation->animationInfo.xOrigin;
        if(scriptCtx->unk4E == 6) {
            scriptCtx->unk4E = 9;
        }
    }

    if(courtScroll->frameCounter == 0xE) {
        LoadWitnessBenchGraphics();
    }
    if(courtScroll->frameCounter > 0xD) {
        index = 0;
        for(i = 0xF; i < courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[i];
        }
        SetOAMForCourtBenchSpritesWitness(228-index, 0x80, 1);
    }
    else {
        for(i = 0, index = 0; i < courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[i];
        }
        SetOAMForCourtBenchSpritesDefense(0-index, 0x80, 1);
    }
}

void ScrollMode1AnimationUpdate(struct AnimationListEntry * animation, struct CourtScroll * courtScroll)
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    s32 i;
    s32 index;
    animation->animationInfo.xOrigin += gCourtScroll03AnimOffsets[courtScroll->frameCounter];
    if(courtScroll->frameCounter == 0xD) {
        PlayPersonAnimationAtCustomOrigin(courtScroll->scrollingPersonAnimId, courtScroll->animOffset, 20, 80, 0);
        SetCurrentPersonAnimationOffset(courtScroll->scrollingPersonAnimId, courtScroll->animOffset);
        if(scriptCtx->unk1E & 0x200) {
            gAnimation[1].flags |= ANIM_0x400;
        }
        if(scriptCtx->unk4E != 0 && scriptCtx->unk4E != 6) {
            scriptCtx->unk20 = scriptCtx->unk4E;
            scriptCtx->unk4E = 5;
        }
    }
    if(animation->animationInfo.personId == 11 || animation->animationInfo.personId == 33) {
        struct AnimationListEntry * anim2 = sub_8016FB4();
        anim2->animationInfo.xOrigin = animation->animationInfo.xOrigin;
    }
    if(courtScroll->frameCounter == 0xD) {
        LoadCounselBenchGraphics();
    }
    if(courtScroll->frameCounter > 0xD) {
        index = 0;
        for(i = 15; i < courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[i];
        }
        SetOAMForCourtBenchSpritesWitness(228-index, 0x80, 1);
    }
    else {

        index = 0;
        for(i = 0; i < 32-courtScroll->frameCounter; i++) {
            index += gCourtScroll02AnimOffsets[32-i];
        }
        SetOAMForCourtBenchSpritesDefense(index-330, 0x80, 1);
    }
}

void UpdatePersonAnimationForCourtScroll(struct AnimationListEntry * animation)
{
    struct CourtScroll * courtScroll = &gCourtScroll;
    if(animation == NULL) {
        nullsub_20("NOT FOUND OBJ WORK.", 0, 4);
        return;
    }
    gCourtScrollPersonAnimationUpdateFuncs[courtScroll->scrollMode](&gAnimation[1], courtScroll);
}

void SetCourtScrollPersonAnim(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
{
    gCourtScroll.scrollMode = arg0 * 2;
    if(arg1 & 1)
        gCourtScroll.scrollMode++;
    gCourtScroll.scrollingPersonAnimId = arg2;
    gCourtScroll.animOffset = arg3;
}

void SpeechBubbleAnimationEffect(struct AnimationListEntry * animation)
{
    s32 rand = (Random() & 3) + 1; // 1 to 4
    s32 rand2 = (Random() & 7) - 4; // -4 to 3
    if(animation->animVar1 == 0)
        animation->specialEffectVar = animation->animationInfo.xOrigin;
    animation->animVar1++;
    if(animation->animVar1 < 0x1F)
    {
        if((animation->animVar1 & 1) != 0)
            animation->animationInfo.xOrigin = animation->specialEffectVar + rand;
        else
            animation->animationInfo.xOrigin = animation->specialEffectVar - rand;
        animation->animationInfo.yOrigin += rand2;
        if(animation->animationInfo.yOrigin > 90)
            animation->animationInfo.yOrigin = 90;
        else if(animation->animationInfo.yOrigin < 70)
            animation->animationInfo.yOrigin = 70;
    }
    else
        animation->animVar1 = 40;
}

// leftover from GS1
void Case3OpeningAnimationEffect(struct AnimationListEntry * animation)
{
}
