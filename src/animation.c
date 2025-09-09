#include "global.h"
#include "animation.h"
// #include "ewram.h"
// #include "sound.h"
// #include "utils.h"
// #include "script.h"
// #include "background.h"
// #include "graphics.h"
// #include "constants/animation.h"
// #include "constants/process.h"

// #include "data/animation.h"

extern char gUnknown_080280F0[];
extern char gUnknown_08028100[];
extern char gUnknown_08028114[];
extern char gUnknown_08028128[];

static void InitCurrentAnimationToNull()
{
    gAnimation[0].flags = ANIM_ENABLE_XFLIP;
    gAnimation[0].next = NULL;
    gAnimation[0].prev = NULL;
}

void ResetAnimationSystem()
{
    struct AnimationListEntry *animation = gAnimation;
    DmaFill16(3, 0, gAnimation, sizeof(gAnimation));
    gMain.animationFlags |= 3;
    animation = &gAnimation[1];
    animation->animationInfo.animId = 0xFF;
    animation->animationInfo.personId = 0;
    InitCurrentAnimationToNull();
}

void ClearAllAnimationSprites()
{
    struct AnimationListEntry *animation;
    for (animation = &gAnimation[1]; animation < &gAnimation[0x20]; animation++)
    {
        if (animation->flags & ANIM_ALLOCATED)
        {
            if (&gOamObjects[animation->animtionOamStartIdx] < &gOamObjects[animation->animtionOamEndIdx])
            {
                struct OamAttrs *oam;
                for (oam = &gOamObjects[animation->animtionOamStartIdx]; oam < &gOamObjects[animation->animtionOamEndIdx]; oam++)
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
            }
        }
    }
}

struct AnimationListEntry * FindAnimationFromAnimId(u32 animId)
{
    struct AnimationListEntry *animation = &gAnimation[0x1F];
    s32 i;
    for(i = 0x1F; i != -1; i--) // ! HM
    {
        if (animation->animationInfo.animId == animId && animation->flags & ANIM_ALLOCATED)
            return animation;
        animation--;
    }
    return NULL;
}

/* static */ struct AnimationListEntry *AllocateAnimationWithId(u32 animId)
{
    u32 flags = 0;
    s32 i;
    struct AnimationListEntry *animation = FindAnimationFromAnimId(animId);
    if (animation != NULL)
    {
        flags = (animation->flags & 0x02000000) ? 0x02000000 : flags;
        flags = (animation->flags & ANIM_INACTIVE) ? ANIM_INACTIVE : flags;
        DestroyAnimation(animation);
        DmaFill16(3, 0, animation, 0x44)
        animation->flags = (ANIM_PLAYING | ANIM_QUEUED_TILE_UPLOAD | ANIM_ACTIVE | ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD) | flags;
        animation->frameDurationCounter = 0xffff;
        if (flags & ANIM_INACTIVE)
            animation->flags &= ~ANIM_ACTIVE;
        animation->animationInfo.animId = animId;
        return animation;
    }
    else
    {
        animation = &gAnimation[0x1F];
        for (i = 0x1f; i != -1; i--)
        {
            if (!(animation->flags & ANIM_ALLOCATED))
            {
                if (animation != &gAnimation[1])
                {
                    DmaFill16(3, 0, animation, 0x44)
                    animation->flags = (ANIM_PLAYING | ANIM_QUEUED_TILE_UPLOAD | ANIM_ACTIVE | ANIM_ALLOCATED | ANIM_QUEUED_PAL_UPLOAD);
                    animation->animationInfo.animId = animId;
                    return animation;
                }
            }
            animation--;
        }
        nullsub_20(gUnknown_080280F0, 0, 3);
        return NULL;
    }
}

void SetAnimationOriginCoords(struct AnimationListEntry *animation, u32 xOrigin, u32 yOrigin) // unused
{
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        animation->animationInfo.xOrigin = xOrigin;
        animation->animationInfo.yOrigin = yOrigin;
    }
}

void SetAnimationRotScaleParams(struct AnimationListEntry *animation, u32 rotscaleIdx)
{
    s32 sin, cos;
    u32 oamIdx;
    oamIdx = rotscaleIdx << 2;
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        if (rotscaleIdx > 0x1f)
        {
            nullsub_20(gUnknown_08028114, 0, 4);
            rotscaleIdx = 0x1f;
        }
        animation->flags = (animation->flags & ~ANIM_ENABLE_XFLIP) | ANIM_ENABLE_ROTATION;
        animation->rotationAmount &= 0xff;
        animation->spritePriorityMatrixIndex &= 0xff00;
        animation->spritePriorityMatrixIndex |= rotscaleIdx;
        cos = _Cos(animation->rotationAmount);
        sin = -_Sin(animation->rotationAmount);
        gOamObjects[oamIdx++].attr3 = cos;
        gOamObjects[oamIdx++].attr3 = -sin;
        gOamObjects[oamIdx++].attr3 = sin;
        gOamObjects[oamIdx++].attr3 = cos;
    }
}

void SetAnimationRotation(struct AnimationListEntry *animation, u32 rotscaleIdx, u32 rotation)
{
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        animation->rotationAmount = rotation;
        SetAnimationRotScaleParams(animation, rotscaleIdx);
    }
}

void DisableAnimationRotation(struct AnimationListEntry *animation)
{
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        animation->flags &= ~ANIM_ENABLE_ROTATION;
    }
}

void SetAnimationScale(struct AnimationListEntry *animation, u32 rotscaleIdx, u32 scale)
{
	s16 temp;
    u32 oamIdx;
    oamIdx = rotscaleIdx << 2;
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        if (rotscaleIdx > 0x1f)
        {
            nullsub_20(gUnknown_08028114, 0, 4);
            rotscaleIdx = 0x1f;
        }
        animation->flags = (animation->flags & ~ANIM_ENABLE_XFLIP) | ANIM_ENABLE_ROTATION;
        animation->rotationAmount &= 0xff;
        animation->spritePriorityMatrixIndex &= 0xff00;
        animation->spritePriorityMatrixIndex |= rotscaleIdx;
        temp = fix_inverse(scale); 
        gOamObjects[oamIdx++].attr3 = fix_mul(_Cos(0), temp);
        gOamObjects[oamIdx++].attr3 = fix_mul(_Sin(0), temp);
        gOamObjects[oamIdx++].attr3 = fix_mul(-_Sin(0), temp);
        gOamObjects[oamIdx++].attr3 = fix_mul(_Cos(0), temp);
    }
}

void DisableAnimationScale(struct AnimationListEntry *animation)
{
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        animation->flags &= ~ANIM_ENABLE_ROTATION;
    }
}

void ChangeAnimationActivity(struct AnimationListEntry *animation, bool32 activate)
{
    u32 i;
    
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else if(animation->flags & ANIM_ALLOCATED)
    {
        if (activate)
        {
            animation->flags &= ~ANIM_INACTIVE;
            animation->flags |= ANIM_ACTIVE;
        }
        else
        {
            animation->flags &= ~ANIM_ACTIVE;
            animation->flags |= ANIM_INACTIVE;
            for (i = animation->animtionOamStartIdx; i < animation->animtionOamEndIdx; i++)
                gOamObjects[i].attr0 = SPRITE_ATTR0_CLEAR;
        }
    }
}

void SetAnimationXFlip(struct AnimationListEntry *animation, bool32 flipX)
{
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        if (flipX)
            animation->flags |= 1;
        else
            animation->flags &= ~1;
    }
}

void SetAnimationPriority(struct AnimationListEntry *animation, u32 priority)
{
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        if (priority > 3)
        {
            nullsub_20(gUnknown_08028128, 0, 4);
            priority = 3;
        }
        animation->spritePriorityMatrixIndex &= 0xff;
        animation->spritePriorityMatrixIndex |= priority << 8;
    }
}
