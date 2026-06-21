#include "global.h"
#include "animation.h"
#include "ewram.h"
#include "sound.h"
// #include "utils.h"
#include "script.h"
#include "background.h"
#include "graphics.h"
#include "debug.h"
// #include "constants/animation.h"
#include "constants/process.h"

// #include "data/animation.h"

extern char gUnknown_080280F0[];
extern char gUnknown_08028100[];
extern char gUnknown_08028114[];
extern char gUnknown_08028128[];
extern char gUnknown_08028150[];
extern char gUnknown_08028168[];

extern struct PersonAnimationData gPersonAnimData[];
extern struct SpriteSizeData gSpriteSizeTable[];
extern struct AnimationData gAnimationData[];
extern u16 gObjPaletteBuffer[16][16];

struct AnimationListEntry * CreateAnimationFromAnimationInfo(struct AnimationInfo * animationInfo, u32 arg1, u32 flags);

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

void SetAnimationFrameOffset(struct AnimationListEntry *animation, u32 animOffset)
{
    uintptr_t animGfxData;
    uintptr_t animFrameData;
    if (animation == NULL)
    {
        nullsub_20(gUnknown_08028100, 0, 4);
    }
    else
    {
        if (animation->animationInfo.animId == 0xFF)
        {
            uintptr_t framePtr;
            framePtr = (uintptr_t)gPersonAnimData[animation->animationInfo.personId].frameData + animOffset;
            if (animation->animationInfo.animFrameDataStartPtr == framePtr)
                return;
            animation->animationInfo.animFrameDataStartPtr = framePtr;
            animation->animationInfo.animGfxDataStartPtr = (uintptr_t)gPersonAnimData[animation->animationInfo.personId].gfxData;
            sub_8016FEC(1);
        }
        else
        {
            if (animation->animationInfo.animId > 0x8)
            {
                if (animation->animationInfo.animId <= 0x1D)
                {
                    animation->animationInfo.animFrameDataStartPtr = (uintptr_t)gUnknown_08252494 + animOffset; // ! These globals are defines *sob*
                    animation->animationInfo.animGfxDataStartPtr = (uintptr_t)gUnknown_08252494;
                }
                else
                {
                    if (animation->animationInfo.animId > 0x89)
                    {
                        nullsub_20(gUnknown_0802813C, 0, 4);
                        return;
                    }
                    animation->animationInfo.animFrameDataStartPtr = (uintptr_t)gGfxSeqAnimation35 + animOffset;
                    animation->animationInfo.animGfxDataStartPtr = (uintptr_t)gUnknown_08252494;
                }
            }
            else
            {
                animation->animationInfo.animFrameDataStartPtr = (uintptr_t)gGfxSeqAnimation35 + animOffset;
                animation->animationInfo.animGfxDataStartPtr = (uintptr_t)gUnknown_08252494;
            }
        }
        animation->flags |= (ANIM_PLAYING | ANIM_QUEUED_TILE_UPLOAD);
        animation->frameDurationCounter = 0xFFFF;
        // comments mostly based on h3rmit docs
        // animation->animFrameDataStartPtr animation block beginning
        animFrameData = animation->animationInfo.animFrameDataStartPtr;
        animGfxData = animation->animationInfo.animGfxDataStartPtr + 1 [(u32 *)animFrameData]; // offsets the graphics pointer
        animation->animationInfo.animGfxDataStartPtr = animGfxData;
        animation->animationInfo.tileDataPtr = animGfxData + 4 + (*(u32 *)animGfxData) * 0x20; // skip first u32(number of palettes) and the palettes, pointer to tiles
        animation->frameData = (struct AnimationFrame *)(animFrameData + 8); // skips animation block header, pointer to frame data
        animation->spriteData = (struct SpriteTemplate *)(animFrameData + animation->frameData->spriteDataOffset); // Frame tilemap pointer
        if(gMain.unk3D & 0x8) {
            gMain.unk3D |= 0x10;
        }
    }
}

u32 CheckRectCollisionWithAnim(struct Rect *p)
{
    u32 i;
    u32 spriteSize = 0;
    struct AnimationListEntry * animation;

    for(animation = gAnimation[0].next; animation != NULL; animation = animation->next)
    {
        if(animation->animationInfo.animId != 0xFF) {
            struct Rect * rect = eGeneralScratchpadBuffer;
            struct Rect * collisionRect = rect+1;
            struct Rect * spriteRect = collisionRect+1;
            uintptr_t vram;
            struct SpriteTemplate * spriteTemplate;
            u32 spriteCount;

            *rect = *p;
            rect->w += p->x;
            rect->h += p->y;

            vram = (uintptr_t)animation->animationInfo.vramPtr;
            spriteTemplate = animation->spriteData;
            spriteCount = *(u16*)animation->spriteData;
            for(i = 0; i < spriteCount; i++)
            {
                struct SpriteSizeData * spriteSizePtr = (struct SpriteSizeData *)&spriteSize; // ! possible fakematch
                u32 mask;
                spriteTemplate++;
                *collisionRect = *rect;
                mask = 0xFFFF;
                vram += spriteSize & mask;
                *spriteSizePtr = gSpriteSizeTable[spriteTemplate->data >> 0xC];
                spriteRect->x = spriteRect->w = animation->animationInfo.xOrigin + spriteTemplate->x;
                spriteRect->w += spriteSizePtr->width;
                spriteRect->y = spriteRect->h = spriteTemplate->y + animation->animationInfo.yOrigin;
                spriteRect->h += spriteSizePtr->height;

                // Check if collision rect is in the region of the sprite rext
                if(spriteRect->x < collisionRect->w
                && collisionRect->x < spriteRect->w
                && spriteRect->y < collisionRect->h
                && collisionRect->y < spriteRect->h)
                {
                    u32 temp;
                    s32 x, y;
                    // now create the intersection rect between the two rects
                    collisionRect->x -= spriteRect->x;
                    if(collisionRect->x < 0)
                        collisionRect->x = 0;
                    collisionRect->y -= spriteRect->y;
                    if(collisionRect->y < 0)
                        collisionRect->y = 0;
                    if(collisionRect->w > spriteRect->w)
                        collisionRect->w = spriteRect->w;
                    collisionRect->w -= spriteRect->x;
                    if(collisionRect->h > spriteRect->h)
                        collisionRect->h = spriteRect->h;
                    collisionRect->h -= spriteRect->y;

                    // Check if any visible pixels are in the intersection
                    temp = spriteSizePtr->width / 8;
                    y = collisionRect->y;
                    while(y < collisionRect->h)
                    {
                        s32 yy1;
                        s32 yy2;
                        uintptr_t temp3;
                        yy1 = (y >> 3) * temp * 32;
                        yy2 = (y % 8) * 4;
                        temp3 = yy1 + yy2 + vram;
                        x = collisionRect->x;
                        while(x < collisionRect->w)
                        {
                            uintptr_t pixel;
                            s32 xx1 = (x >> 3) * 32;
                            if(x % 8 > 1){
                                uintptr_t ptr = temp3 + 1;
                                pixel = (x >> 3) * 32 + ptr;
                            }
                            else {
                                uintptr_t ptr = temp3;
                                pixel = (x >> 3) * 32 + ptr;
                            }
                            if(*(u8 *)pixel != 0)
                                return animation->animationInfo.animId;
                            x+=2;
                        }
                        y+=2;
                    }
                }
            }
        }
    }
    return 0;
}

bool32 CheckIfLinesIntersect(const struct Point *pt0, const struct Point *pt1, const struct Point *pt2, const struct Point *pt3)
{
    // check if the lines through pt0-pt1 and pt2-pt3 intersect on the screen
    s32 xd01, yd01, xd23, yd23, cp0123, xd13, yd13, cp2313, cp0113;
    xd01 = pt0->x - pt1->x;
    yd01 = pt0->y - pt1->y;
    xd23 = pt2->x - pt3->x;
    yd23 = pt2->y - pt3->y;
    cp0123 = xd01 * yd23 - yd01 * xd23;
    // are 0->1 and 2->3 collinear or 0? if yes bail
    if (cp0123 == 0)
    {
        return FALSE;
    }
    xd13 = pt1->x - pt3->x;
    yd13 = pt1->y - pt3->y;
    cp2313 = yd13 * xd23 - xd13 * yd23;
    cp0113 = yd13 * xd01 - xd13 * yd01;
    // does an intersection between the two lines exist on screen? return true if yes...
    if (((cp0123 > 0 && cp2313 >= 0 && cp2313 <= cp0123) || (cp0123 < 0 && cp2313 >= cp0123 && cp2313 <= 0)) &&
	((cp0123 > 0 && cp0113 >= 0 && cp0113 <= cp0123) || (cp0123 < 0 && cp0113 >= cp0123 && cp0113 <= 0)))
    {
        return TRUE;
    }
    // ...else false
    return FALSE;
}

bool32 CheckRectCollisionWithArea(const struct Rect * rect, const struct Point4 * area)
{
    u32 i, j, k;
    struct Point4 p;
    const struct Point *p1 = &area->points[0];
    const struct Point *p2 = &area->points[1];
    const struct Point *p3 = &p.points[0];
    const struct Point *p4 = &p.points[1];
    if (CheckPointInArea((struct Point *)rect, area))
        return TRUE;

    p.points[0].x = p.points[3].x = rect->x;
    p.points[0].y = p.points[1].y = rect->y;
    p.points[1].x = p.points[2].x = rect->x + rect->w;
    p.points[2].y = p.points[3].y = rect->y + rect->h;
    // see if any part of the rect is in area
    for (i = 0; i < 3; i++)
    {
        p1 = &area->points[0];
        p2 = &area->points[1];
        for (j = 0; j < 3; j++)
        {
            if (CheckIfLinesIntersect(p1, p2, p3, p4))
                return TRUE;
            p1++;
            p2++;
        }
        p2 = &area->points[0];
        if (CheckIfLinesIntersect(p1, p2, p3, p4))
            return TRUE;
        p3++;
        p4++;
    }
    p4 = &p.points[0];
    p1 = &area->points[0];
    p2 = &area->points[1];
    for (k = 0; k < 3; k++)
    {
        if (CheckIfLinesIntersect(p1, p2, p3, p4))
            return TRUE;
        p1++;
        p2++;
    }
    p2 = &area->points[0];
    if (CheckIfLinesIntersect(p1, p2, p3, p4))
        return TRUE;

    return FALSE;
}

void PutAnimationInAnimList(struct AnimationListEntry *animation)
{
    struct AnimationListEntry *list = gAnimation;
    u32 i;
    for (i = 0; i < 0x20; i++)
    {
        if (list->next == NULL)
        {
            animation->prev = list;
            list->next = animation;
            break;
        }
        list = list->next;
        if (list->animationInfo.priority < animation->animationInfo.priority)
        {
            animation->prev = list->prev;
            animation->next = list;
            list->prev->next = animation;
            list->prev = animation;
            break;
        }
    }
}

void DoAnimationAction(u32 action)
{
    switch (action)
    {
    case 1:
        if (!(gMain.gameStateFlags & 1))
        {
            gMain.shakeTimer = 30;
            gMain.gameStateFlags |= 1;
            gMain.shakeIntensity = 1;
        }
        break;
    case 2:
        if (gMain.blendMode == 0)
            StartHardwareBlend(3, 1, 8, 0x1F);
        break;
    default:
        break;
    }
}

struct AnimationListEntry *PlayPersonAnimation(u32 arg0, u32 arg1, u32 talkingAnimOff, u32 arg3)
{
    u32 xOrigin = 120;
    struct Main *main = &gMain;
    if (arg0 & 0x8000 && main->Bg256_dir & 0x10)
        xOrigin -= DISPLAY_WIDTH;
    if (arg0 & 0x4000 && main->Bg256_dir & 0x20)
        xOrigin += DISPLAY_WIDTH;
    if (arg0 & 0x2000)
        arg1 |= 1;
    return PlayPersonAnimationAtCustomOrigin(arg0, talkingAnimOff, xOrigin, DISPLAY_HEIGHT/2, arg1);
}

void SetCurrentPersonAnimationOffset(u32 animId, u32 animOffset)
{
    gMain.idleAnimationOffset = animOffset;
    gMain.talkingAnimationOffset = animOffset;
}

struct AnimationListEntry *PlayPersonAnimationAtCustomOrigin(u32 arg0, u32 talkingAnimOff, u32 xOrigin, u32 yOrigin, u32 flags)
{
    struct Main *main = &gMain;
    struct AnimationListEntry *animation = &gAnimation[1];
    struct AnimationInfo animationInfo;
    u32 personId = arg0 & 0xFF;
    if (personId == 0)
    {
        sub_8016FEC(0);
        if (animation->flags & ANIM_ALLOCATED)
            DestroyAnimation(animation);
        return NULL;
    }
    animationInfo.animId = 0xFF;
    *(u16 *)(&animationInfo.personId) = arg0; // this assignment matches but sucks. doing it like this allows animationInfo to not be an array which makes everything else more sane
    arg0 = personId; // ?! just use personId for the rest of the function like the previous dev and a good human :sob:
    animationInfo.vramPtr = (uintptr_t)OBJ_VRAM0 + 0x5800;
    animationInfo.animGfxDataStartPtr = (uintptr_t)gPersonAnimData[personId].gfxData;
    animationInfo.animFrameDataStartPtr = (uintptr_t)gPersonAnimData[personId].frameData + talkingAnimOff;
    animationInfo.paletteSlot = 14;
    if(animation->animationInfo.animId == 0xFF) {
        if(arg0 == 0x11)
            animationInfo.paletteSlot = 13;
        if(arg0 == 0x19)
            animationInfo.paletteSlot = 13;
    }
    animationInfo.spriteCount = gPersonAnimData[arg0].spriteCount;
    animationInfo.priority = 0x31;
    animationInfo.xOrigin = xOrigin;
    animationInfo.yOrigin = yOrigin;
    if (!(animation->flags & ANIM_ALLOCATED))
    {
        DmaFill16(3, 0, animation, sizeof(gAnimation[1]));
        animation->flags |= ANIM_ALLOCATED;
        animation->animationInfo.animId = 0xFF;
        PutAnimationInAnimList(animation);
    }
    animation->bgId |= 0;
    CreateAnimationFromAnimationInfo(&animationInfo, 0xFF, flags);
    animation->bgId = main->currentBG;
    if(gMain.unk3D & 0x8) {
        main->unk3D |= 0x10;
    }
    sub_8016FEC(1);
    return animation;
}

struct AnimationListEntry *PlayAnimation(u32 arg0)
{
    s32 xOrigin, yOrigin;
    struct Main *main = &gMain;
    const struct AnimationData *ptr = &gAnimationData[arg0];
    xOrigin = ptr->xOrigin;
    yOrigin = ptr->yOrigin;
    if (main->Bg256_dir & 0x10 && arg0 > 0x8)
        xOrigin -= DISPLAY_WIDTH;
    return PlayAnimationAtCustomOrigin(arg0, xOrigin, yOrigin);
}

struct AnimationListEntry *PlayAnimationAtCustomOrigin(u32 arg0, s32 xOrigin, s32 yOrigin)
{
    struct AnimationListEntry *animationStruct;
    struct AnimationInfo animationInfo;
    struct Main *main = &gMain;
    const struct AnimationData *animData = &gAnimationData[arg0];
    u32 var0;
    uintptr_t var1;
    u32 var2;

    animationInfo.animId = arg0;
    animationInfo.vramPtr = (uintptr_t)animData->vramPtr;
    animationInfo.animGfxDataStartPtr = (uintptr_t)animData->gfxData;
    animationInfo.animFrameDataStartPtr = (uintptr_t)animData->frameData;
    animationInfo.paletteSlot = animData->paletteSlot;
    animationInfo.spriteCount = animData->spriteCount;
    animationInfo.priority = animData->priority;
    animationInfo.xOrigin = xOrigin;
    animationInfo.yOrigin = yOrigin;
    animationStruct = CreateAnimationFromAnimationInfo(&animationInfo, arg0, animData->flags);

    var0 = animationStruct->animationInfo.paletteSlot - 6;
    var1 = (1 << var0);
    if (!(main->allocatedObjPltts & var1) && animationStruct->animationInfo.paletteSlot < 10)
    {
        void *dest;
        u32 size;
		
        main->allocatedObjPltts |= var1;
        var1 = OBJ_PLTT;
        var1 += animationStruct->animationInfo.paletteSlot * 0x20;
        dest = gObjPaletteBuffer[var0];
        var0 = *(u32 *)animationStruct->animationInfo.animGfxDataStartPtr;
        size = var0 * 0x20;
        DmaCopy16(3, var1, dest, size);
    }
    animationStruct->bgId = main->currentBG;
    animationStruct->roomId = main->currentRoomId;
    animationStruct->flags |= ANIM_QUEUED_PAL_UPLOAD;
    if(gMain.unk3D & 0x8) {
        main->unk3D |= 0x10;
    }
    return animationStruct;
}

struct AnimationBackupStruct * RestoreAnimationsFromBuffer(struct AnimationBackupStruct * backupAnimation) // ! UB: this function doesn't return anything
{
    u32 i;
    uintptr_t animFrameData;
    uintptr_t animGfxData;
    struct AnimationListEntry *animation = &gAnimation[1];
    struct AnimationInfo animationInfo;
    ResetAnimationSystem();
    if (backupAnimation->flags & ANIM_ALLOCATED)
    {
        animationInfo.animId = 0xFF;
        animationInfo.personId = backupAnimation->personId;
        animationInfo.vramPtr = (uintptr_t)OBJ_VRAM0 + 0x5800;
        animationInfo.animGfxDataStartPtr = (uintptr_t)gPersonAnimData[backupAnimation->personId].gfxData;
        animationInfo.animFrameDataStartPtr = backupAnimation->animFrameDataStartPtr;
        animationInfo.paletteSlot = 0xE;
        if(animation->animationInfo.animId == 0xFF) {
            if(backupAnimation->personId == 0x11) {
                animationInfo.paletteSlot = 0xD;
            }
            if(backupAnimation->personId == 0x19) {
                animationInfo.paletteSlot = 0xD;
            }
        }
        animationInfo.spriteCount = gPersonAnimData[backupAnimation->personId].spriteCount;
        animationInfo.priority = 0x31;
        animationInfo.xOrigin = backupAnimation->xOrigin;
        animationInfo.yOrigin = backupAnimation->yOrigin;
        DmaCopy16(3, &animationInfo, &animation->animationInfo, sizeof(animationInfo));
        animFrameData = animation->animationInfo.animFrameDataStartPtr;
        animation->frameData = (struct AnimationFrame *)animFrameData;
        animGfxData = animation->animationInfo.animGfxDataStartPtr + 1 [(u32 *)animFrameData];
        animation->animationInfo.animGfxDataStartPtr = animGfxData; // offsets the graphics pointer
        animation->animationInfo.tileDataPtr = animGfxData + 4 + (*(u32 *)animGfxData) * 0x20;
        animation->frameData = backupAnimation->frameData;
        animation->spriteData = (void *)(animFrameData + animation->frameData->spriteDataOffset);
        animation->flags = backupAnimation->flags | (ANIM_QUEUED_TILE_UPLOAD | ANIM_QUEUED_PAL_UPLOAD);
        animation->tileNum |= (uintptr_t)animation->animationInfo.vramPtr / TILE_SIZE_4BPP; // get OAM tile num from VRAM address
        animation->spritePriorityMatrixIndex = 0x300;
        SetAnimationPriority(animation, animation->animationInfo.priority >> 4);
        animation->animationInfo.priority &= 0xF;
        animation->bgId = backupAnimation->bgId;
        PutAnimationInAnimList(animation);
    }
    backupAnimation++;
    for (i = 2; i < 0x20; i++, backupAnimation++)
    {
        if (backupAnimation->flags & ANIM_ALLOCATED)
        {
            animation = PlayAnimationAtCustomOrigin(backupAnimation->animId, backupAnimation->xOrigin, backupAnimation->yOrigin);
            animation->flags = backupAnimation->flags | (ANIM_QUEUED_TILE_UPLOAD | ANIM_QUEUED_PAL_UPLOAD);
            animation->frameData = backupAnimation->frameData;
            animation->spriteData = (void *)(animation->animationInfo.animFrameDataStartPtr + animation->frameData->spriteDataOffset);
            DataCopy32(&animation->bgId, &backupAnimation->bgId);
        }
    }
}

struct AnimationBackupStruct * SaveAnimationDataToBuffer(struct AnimationBackupStruct * backupAnimation)
{
    struct AnimationListEntry *animation;
    for (animation = &gAnimation[1]; animation < &gAnimation[0x20]; animation++, backupAnimation++)
    {
        DataCopy32(&backupAnimation->animId, &animation->animationInfo.animId);
        DataCopy32(&backupAnimation->xOrigin, &animation->animationInfo.xOrigin);
        DataCopy32(&backupAnimation->frameDurationCounter, &animation->frameDurationCounter);
        DataCopy32(&backupAnimation->bgId, &animation->bgId);
        backupAnimation->animFrameDataStartPtr = animation->animationInfo.animFrameDataStartPtr;
        backupAnimation->flags = animation->flags;
        backupAnimation->frameData = animation->frameData;
    }
    return backupAnimation;
}

struct AnimationListEntry * CreateAnimationFromAnimationInfo(struct AnimationInfo * animationInfo, u32 arg1, u32 flags)
{
    uintptr_t animFrameData;
    uintptr_t animGfxData;
    struct AnimationListEntry *animation = AllocateAnimationWithId(animationInfo->animId);
    if (animation == NULL) {
        nullsub_20(gUnknown_080280F0, 0, 5);
        return NULL;
    }
    DmaCopy16(3, animationInfo, &animation->animationInfo, sizeof(animation->animationInfo));
    animFrameData = animation->animationInfo.animFrameDataStartPtr;
    animGfxData = animation->animationInfo.animGfxDataStartPtr +  1 [(u32 *)animFrameData];
    animation->animationInfo.animGfxDataStartPtr = animGfxData;                                      // offsets the graphics pointer
    animation->animationInfo.tileDataPtr = animGfxData + 4 + (*(u32 *)animGfxData) * 0x20; // skip first u32(number of palettes) and the palettes, pointer to tiles
    animation->frameData = (struct AnimationFrame *)(animFrameData + 8);                                  // skips animation block header, pointer to frame data
    animation->spriteData = (void *)(animFrameData + animation->frameData->spriteDataOffset);                  // Frame tilemap pointer
    animation->flags |= flags;
    if (flags & 0x10)
        animation->flags &= ~ANIM_PLAYING;
    animation->tileNum |= ((uintptr_t)animation->animationInfo.vramPtr & 0x7FFF) / TILE_SIZE_4BPP; // get OAM tile num from VRAM address
    animation->rotationAmount = 0;
    animation->spritePriorityMatrixIndex = 0x300;
    SetAnimationPriority(animation, animation->animationInfo.priority >> 4);
    animation->animationInfo.priority &= 0xF;
    PutAnimationInAnimList(animation);
    if (animation->frameData->flags & 0x2)
        PlaySE(animation->frameData->songId);
    if (animation->frameData->flags & 0x4)
        DoAnimationAction(animation->frameData->action);
    return animation;
}

u32 AdvanceAnimationFrame(struct AnimationListEntry * animation)
{
    uintptr_t gfxDataStart;
    u32 retVal = 4;
    if(gCourtScroll.state && animation->animationInfo.personId == 6) {
        return retVal;
    }
    if(animation->flags & 0x100) {
        animation->flags |= 0x100;
    }
    else {
        if (animation->frameData->frameDuration > ++animation->frameDurationCounter)
            return retVal;
        animation->frameDurationCounter = 0;
        animation->frameData++;
        if (animation->frameData->flags & 0x2)
            PlaySE(animation->frameData->songId);
        if (animation->frameData->flags & 0x4)
            DoAnimationAction(animation->frameData->action);
        switch (animation->frameData->frameDuration)
        {
        case ANIM_LOOP:
            gfxDataStart = animation->animationInfo.animFrameDataStartPtr;
            animation->frameData = (struct AnimationFrame *)(gfxDataStart + 8);
            animation->spriteData = (struct SpriteTemplate *)(gfxDataStart + animation->frameData->spriteDataOffset);
            animation->flags |= ANIM_QUEUED_TILE_UPLOAD;
            retVal = 7;
            break;
        case ANIM_STOP:
            animation->flags &= ~ANIM_PLAYING;
            retVal = 0;
            animation->frameData--;
            break;
        case ANIM_DESTROY:
            DestroyAnimation(animation);
            retVal = 0;
            break;
        default:
            animation->spriteData = (void *)(animation->animationInfo.animFrameDataStartPtr + animation->frameData->spriteDataOffset);
            animation->flags |= ANIM_QUEUED_TILE_UPLOAD;
            retVal = 5;
            break;
        }
    }
    return retVal;
}

void OffsetAllAnimations(s32 xOffset, s32 yOffset)
{
    struct AnimationListEntry *animation;
    for (animation = gAnimation[0].next; animation != NULL; animation = animation->next)
    {
        struct OamAttrs *oam;
        if (animation->flags & 8)
            continue;
        animation->animationInfo.xOrigin += xOffset;
        animation->animationInfo.yOrigin += yOffset;
        for (oam = &gOamObjects[animation->animtionOamStartIdx]; oam < &gOamObjects[animation->animtionOamEndIdx]; oam++)
        {
            u32 y;
            u32 x;
            u32 xMask;
            u32 yMask = 0xFF;
            y = (u8)oam->attr0;
            oam->attr0 &= ~0xFF;
            y += yOffset;
            y &= yMask; // lulwut
            oam->attr0 |= y;

            xMask = 0x1FF;
            x = oam->attr1 & 0x1FF;
            oam->attr1 &= ~0x1FF;
            x += xOffset;
            x &= xMask;
            oam->attr1 |= x;
        }
    }
}

void StartAnimationBlend(u32 arg0, u32 arg1)
{
    struct AnimationListEntry *animation2;
    struct IORegisters *ioRegsp = &gIORegisters;
    struct Main *main = &gMain;
    struct ScriptContext *context = &gScriptContext;
    if (arg0 & 0xFF00)
    {
        u32 animationId = arg0 >> 8;
        arg0 &= 0xFF;
        animation2 = FindAnimationFromAnimId(animationId);
    }
    else
        animation2 = &gAnimation[1];

    if ((ioRegsp->lcd_bldy == 0x10 && (context->flags & 0x20) == 0) || (!(animation2->flags & ANIM_ALLOCATED) && !(arg0 & 2)))
        return;

    if (arg0 & 1)
    {
        if ((animation2->flags & 0x02000000) && !(animation2->flags & 0x4))
            return;
        animation2->flags &= ~(ANIM_INACTIVE | 0x04000000 | 4);
        main->blendDeltaY = 0x10;
    }
    else if (arg0 & 4)
    {
        if ((animation2->flags & 0x02000000) && (animation2->flags & 0x4))
            return;
        animation2->flags |= 0x4;
        main->blendDeltaY = 0;
        if(animation2->flags & 0x40) {
            main->blendDeltaY = 4;
            animation2->flags &= ~0x40;
        }
        if (arg0 & (4 | 8))
        {
            animation2->flags |= 0x04000000;
        }
    }
    else
        return;
    animation2->flags |= (ANIM_ACTIVE | ANIM_BLEND_ACTIVE);
    main->blendDelay = arg1;
    main->blendCounter = 0;
    ioRegsp->lcd_bldcnt = BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3;
    ioRegsp->lcd_bldalpha = BLDALPHA_BLEND(0x10 - main->blendDeltaY, main->blendDeltaY);
    REG_BLDCNT = ioRegsp->lcd_bldcnt;
    REG_BLDALPHA = ioRegsp->lcd_bldalpha;
}

void UpdateAnimationBlend(struct AnimationListEntry *animation)
{
    struct Main *main = &gMain;
    struct IORegisters *ioRegsp = &gIORegisters;
    struct AnimationListEntry *animation2 = NULL;

    if (++main->blendCounter >= main->blendDelay)
    {
        main->blendCounter = 0;
        if (animation->flags & 4)
        {
            main->blendDeltaY++;
            if (main->blendDeltaY == 0x10)
            {
                ioRegsp->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
                ioRegsp->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
                animation->flags &= ~ANIM_BLEND_ACTIVE;
                if (animation->flags & 0x04000000)
                {
                    ChangeAnimationActivity(animation, 0);
                    if (animation2 != NULL)
                        ChangeAnimationActivity(animation2, 0);
                    return;
                }
                DestroyAnimation(animation);
                if (animation2 != NULL)
                    DestroyAnimation(animation2);
                return;
            }
        }
        else
        {
            main->blendDeltaY--;
            if (main->blendDeltaY == 0)
            {
                ioRegsp->lcd_bldcnt = BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
                ioRegsp->lcd_bldalpha = BLDALPHA_BLEND(0x1F, 0x7);
                animation->flags &= ~ANIM_BLEND_ACTIVE;
                if (animation2 != NULL)
                    animation2->flags &= ~ANIM_BLEND_ACTIVE;
                return;
            }
        }
    }
    ioRegsp->lcd_bldalpha = BLDALPHA_BLEND(0x10 - main->blendDeltaY, main->blendDeltaY);
}

void ActivateAllAllocatedAnimations() // unused
{
    struct AnimationListEntry *animation = gAnimation;

    for (; animation < &gAnimation[ARRAY_COUNT(gAnimation)]; animation++)
    {
        if (animation->flags & ANIM_ALLOCATED)
            animation->flags |= (ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD);
    }
}

void DestroyAnimation(struct AnimationListEntry *animation)
{
    struct AnimationListEntry *animation2;
    struct Main *main = &gMain;
    struct OamAttrs *oam;
    u32 var0;
    uintptr_t var1;
    if (animation == NULL)
        return;

    if (animation->flags & ANIM_ALLOCATED)
    {
        void *dst;
        u32 size;
        for (oam = &gOamObjects[animation->animtionOamStartIdx]; oam < &gOamObjects[animation->animtionOamEndIdx]; oam++)
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        main->animationFlags |= 4;
        // animation->flags = 0;
        animation->prev->next = animation->next;
        animation->next->prev = animation->prev;
        if (animation->animationInfo.animId != 0xFF
            && animation->animationInfo.paletteSlot < 10
            && !(animation->flags & 0x20))
        {
            var0 = animation->animationInfo.paletteSlot - 6;
            var1 = 1 << var0;
            main->allocatedObjPltts &= ~var1;
            var1 = (uintptr_t)gObjPaletteBuffer[var0];
            dst = (void*)OBJ_PLTT;
            dst += animation->animationInfo.paletteSlot * 0x20;
            size = *(u32 *)animation->animationInfo.animGfxDataStartPtr * 0x20;
            DmaCopy16(3, var1, dst, size);
        }
        animation->flags = 0;
    }
}

void UpdateAllAnimationSprites()
{
    struct Main * main = &gMain;
    u32 var0 = 0x80;
    struct OamAttrs *oam = &gOamObjects[ARRAY_COUNT(gOamObjects)];
    struct ScriptContext *context = &gScriptContext;
    struct AnimationListEntry *animation;
    u32 i, j;
    for (animation = gAnimation[0].next; animation != NULL; animation = animation->next)
    {
        if ((animation->flags & ANIM_ALLOCATED) == 0)
            continue;
        animation->animtionOamEndIdx = var0;
        if ((main->animationFlags & 2) && (animation->flags & ANIM_ACTIVE))
        {
            void *ptr = (void *)animation->spriteData;
            struct SpriteTemplate *spriteTemplates = animation->spriteData;
            s32 xOrigin = animation->animationInfo.xOrigin - main->shakeAmountX;
            s32 yOrigin = animation->animationInfo.yOrigin - main->shakeAmountY;
            u32 tileNum = animation->tileNum & 0x3FF;
            s32 spriteCount = *(u16 *)ptr;
            struct SpriteSizeData *spriteSizeData = eGeneralScratchpadBuffer;
            spriteSizeData += var0;
            for (i = 0; i < spriteCount; i++)
            {
                s32 y;
                var0--;
                oam--;
                spriteSizeData--;
                spriteTemplates++;
                *spriteSizeData = gSpriteSizeTable[spriteTemplates->data >> 0xC];
                oam->attr0 = (spriteTemplates->data & 0x3000) << 2; // Sprite Shape
                if (animation->flags & ANIM_ENABLE_ROTATION) {
                    xOrigin -= spriteSizeData->width / 2;
                    yOrigin -= spriteSizeData->height / 2;
                    oam->attr0 |= ST_OAM_AFFINE_DOUBLE << 8;
                }
                y = yOrigin + spriteTemplates->y;
                if (y < -96)
                    y = -88;
                if (y > 224)
                    y = 224;
                oam->attr0 |= y & 0xFF;
                if (animation->flags & ANIM_BLEND_ACTIVE)
                    oam->attr0 |= 0x400;
                oam->attr1 = spriteTemplates->data & 0xC000;
                if (animation->flags & ANIM_ENABLE_XFLIP)
                {
                    u16 x = (xOrigin - (spriteTemplates->x + spriteSizeData->width)) & 0x1FF;
                    oam->attr1 |= 0x1000 | x;
                }
                else
                {
                    u16 x = (xOrigin + spriteTemplates->x) & 0x1FF;
                    oam->attr1 |= (*(u8 *)(&animation->spritePriorityMatrixIndex)) << 9 | x;
                }
                if(animation->flags & 0x200000) {
                    oam->attr0 |= 0x300;
                    oam->attr1 &= 0xC1FF;
                    oam->attr1 |= animation->spritePriorityMatrixIndex << 9;
                }
                if(spriteTemplates->data & 0x200) {
                    oam->attr1 |= 0x1000;
                }
                oam->attr2 = tileNum | *((u8 *)(&animation->spritePriorityMatrixIndex) + 1) << 10;
                if (animation->frameData->flags & 1)
                    oam->attr2 |= (animation->animationInfo.paletteSlot + ((spriteTemplates->data >> 9) & 7)) << 12;
                else if (animation->frameData->flags & 8)
                    oam->attr2 |= (animation->animationInfo.paletteSlot + ((spriteTemplates->data >> 10) & 3)) << 12;
                else
                    oam->attr2 |= (animation->animationInfo.paletteSlot + ((spriteTemplates->data >> 11) & 1)) << 12;
                tileNum += spriteSizeData->tileSize / TILE_SIZE_4BPP;
                if(main->effectType == 1 || main->effectType == 2 || main->effectType == 0xFFFF || context->flags & 0x40) {
                    oam->attr0 |= 0x1000; // mosaic
                }
                if(animation->flags & 0x800) {
                    oam->attr0 |= 0x1000; // mosaic
                }
            }
        }
        animation->animtionOamStartIdx = animation->animtionOamEndIdx - animation->animationInfo.spriteCount;
        var0 -= animation->animtionOamStartIdx;
        for (var0 -= 1; var0 != -1; var0--)
        {
            oam--;
            oam->attr0 = SPRITE_ATTR0_CLEAR;
        }
        var0 = animation->animtionOamStartIdx;
        if(animation->animationInfo.animId == 0x6B 
        || animation->animationInfo.animId == 0x6C
        || animation->animationInfo.animId == 0x6D) {
            struct OamAttrs * oam1 = &gOamObjects[var0];
            struct OamAttrs * oam2 = &gOamObjects[animation->animationInfo.animId-0x31];
            u32 palslot;
            uintptr_t palPtr;
            oam2->attr0 = oam1->attr0;
            oam2->attr1 = oam1->attr1;
            palslot = animation->animationInfo.paletteSlot << 0xC;
            oam2->attr2 = palslot | (oam1->attr2 & 0x3FF);
            oam1->attr0 = SPRITE_ATTR0_CLEAR;
            palPtr = animation->animationInfo.animGfxDataStartPtr+4;
            DmaCopy16(3, palPtr, OBJ_PLTT + (animation->animationInfo.paletteSlot & 0xF) * 0x20, 0x20);
        }
    }
    if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS) {
        if(gAnimation[1].animationInfo.personId == 0xB || gAnimation[1].animationInfo.personId == 0x21) {
            if(gAnimation[1].flags & ANIM_ALLOCATED && gMain.showTextboxCharacters && context->flags & SCRIPT_FULLSCREEN) {
                for(i = 2; i < 0x22; i++) {
                    if(gOamObjects[i].attr0 & 0x200) {
                        gOamObjects[i].attr0 = gOamObjects[0x39].attr0;
                        gOamObjects[i].attr1 = gOamObjects[0x39].attr1;
                        gOamObjects[i].attr2 = gOamObjects[0x39].attr2;
                        break;
                    }
                }
                oam = &gOamObjects[0x30];
                for(i = 0x20; i < 0x40; i++) {
                    if(gTextBoxCharacters[i].state & 0x8000) {
                        oam->attr0 = gTextBoxCharacters[i].y;
                        oam->attr1 = gTextBoxCharacters[i].x + 0x4009;
                        oam->attr2 = gTextBoxCharacters[i].objAttr2;
                        if(gScriptContext.flags & 0x1000) {
                            oam->attr0 |= 0x400;
                        }
                        else {
                            oam->attr0 &= ~0x400;
                        }
                    }
                    oam++;
                }
            }
        }
    }
}

void MoveAnimationTilesToRam(bool32 arg0)
{
    struct AnimationListEntry *animation;
    s32 vcount;
    for (animation = gAnimation[0].next; animation != NULL; animation = animation->next)
    {
        uintptr_t tileData;
        uintptr_t tileStart;
        struct SpriteTemplate * spriteTemplate; // ip
        struct SpriteSizeData * spriteSizeData; // r7
        uintptr_t tileDest; // r6
        uintptr_t nextTileDest; // r8
        u32 spriteCount; // sl
        u32 palCount; //sp08
        u32 i;

        if(!(animation->flags & ANIM_QUEUED_TILE_UPLOAD))
            continue;
        if(!(animation->flags & ANIM_ACTIVE))
            continue;
        tileDest = arg0 ? (uintptr_t)eGeneralScratchpadBuffer + 0x200 : animation->animationInfo.vramPtr;
        spriteTemplate = animation->spriteData;
        spriteCount = *(u16*)animation->spriteData;
        spriteSizeData = eGeneralScratchpadBuffer;
        spriteSizeData += animation->animtionOamEndIdx;
        animation->flags &= ~ANIM_QUEUED_TILE_UPLOAD;
        palCount = *(u32*)animation->animationInfo.animGfxDataStartPtr;
        // RLE
        if(palCount & 0x80000000)
        {
            for(i = 0; i < spriteCount; i++)
            {
                //void * tileData;
                u32 * offsets;
                u32 tileNum;
                u32 size;
                spriteTemplate++;
                spriteSizeData--;
                size = spriteSizeData->tileSize;
                nextTileDest = tileDest + size;
                tileNum = (spriteTemplate->data & 0x1FF);
                tileStart = animation->animationInfo.tileDataPtr;
                offsets = (u32*)tileStart;
                tileStart += offsets[tileNum];
                tileData = tileStart;
                while(nextTileDest > tileDest)
                {
                    if(*(u16*)tileData & 0x8000)
                    {
                        u32 repeatCount = *(u16*)tileData & 0x7FFF;
                        DmaFill16(3, *((u16*)tileData+1), tileDest, repeatCount*=2);
                        tileDest += repeatCount;
                        tileData += 4;
                    }
                    else
                    {
                        u32 size = *(u16*)tileData * 2;
                        tileData+=2;
                        DmaCopy16(3, tileData, tileDest, size);
                        tileDest += size;
                        tileData += size;
                    }
                }
            }
        }
        // plain
        else
        {
            u32 tileNumMask;
            // This is correct trust me
            if(animation->frameData->flags & 1)
                tileNumMask = 0x1FF;
            else if(animation->frameData->flags & 8)
                tileNumMask = 0x1FF;
            else
                tileNumMask = 0x1FF;
            for(i = 0; i < spriteCount; i++)
            {
                u16 * sizePtr;
                u32 tileNum;
                spriteTemplate++;
                spriteSizeData--;
                sizePtr = &spriteSizeData->tileSize; // !! SCRUB C probably fakematch
                tileData = animation->animationInfo.tileDataPtr + (spriteTemplate->data & tileNumMask) * TILE_SIZE_4BPP;
                DmaCopy16(3, tileData, tileDest, *sizePtr);
                tileDest += *sizePtr;
            }
        }
        
        if((animation->animationInfo.animId != 131
            && animation->animationInfo.animId != 132
            && animation->animationInfo.animId != 133) 
        && animation->flags & ANIM_QUEUED_PAL_UPLOAD)
        {
            u32 palOffset = (animation->animationInfo.paletteSlot & 0xF) * 32;
            uintptr_t dest = OBJ_PLTT + palOffset;
            palCount = palCount * 32;
            tileData = animation->animationInfo.animGfxDataStartPtr+4;
            if(animation->flags & 0x200)
                tileData = (uintptr_t)animation->overridePalette;
            
            if(animation->flags & 0x400) {
                u16 buf[0x30];
                DmaCopy16(3, tileData, buf, palCount);
                for(i = 0; i < 0x30; i++) {
                    if(gMain.effectType == 0xFFFE) // effectType is gUnknown_03003840
                        buf[i] = ColorFadeGrayscale(buf[i], 0x20, 1);
                    else
                        buf[i] = ColorFadeGrayscale(buf[i], 0x20, 0);
                }
                DmaCopy16(3, buf, dest, palCount);
            } else if(gMain.unk3D & 0x10) {
                if(animation->animationInfo.animId < 9 || (animation->animationInfo.animId >= 82 && animation->animationInfo.animId < 138)) {
                    DmaCopy16(3, tileData, dest, palCount);
                } else {
                    u16 buf[0x30];
                    DmaCopy16(3, tileData, buf, palCount);
                    for(i = 0; i < 0x30; i++) {
                        buf[i] = ColorFadeSepia(buf[i], 0x20, 0);
                    }
                    DmaCopy16(3, buf, dest, palCount);
                }
            }
            else {
                DmaCopy16(3, tileData, dest, palCount);
            }
            animation->flags &= ~ANIM_QUEUED_PAL_UPLOAD;
        }
    }
    // 13772
    if(gMain.unk3D & 0x10) {
        u32 flag = ~0x10;
        gMain.unk3D &= flag;
    }
    // 13788
    nullsub_20(gUnknown_08028150, 0, 13);
    vcount = *(u8*)&REG_VCOUNT;
    if(vcount < 160) {
        if(!arg0)
            nullsub_20(gUnknown_08028168, 0, 13);
    }
}

void UpdateAnimations(u32 arg0)
{
    struct Main * main = &gMain;
    struct AnimationListEntry *animation;
    struct AnimationListEntry *animation2 = gAnimation;
    struct CourtScroll * courtScroll = &gCourtScroll;
    struct ScriptContext * context = &gScriptContext;
    struct IORegisters * ioRegs = &gIORegisters;

    if(main->animationFlags & 1)
    {
        for (animation = animation2->next; animation != NULL; animation = animation->next)
        {
            if(animation->animationInfo.animId >= 27 && animation->animationInfo.animId <= 29)
            {
                if(main->currentBG != animation->bgId)
                {
                    if(context->flags & 0x20) {
                        animation->bgId = main->currentBG;
                    }
                    else if(main->currentRoomId == animation->roomId) {
                        ChangeAnimationActivity(animation, 0);
                        continue;
                    }
                    else {
                        DestroyAnimation(animation);
                        continue;
                    }
                }
                else
                {
                    if(!(animation->flags & ANIM_ACTIVE))
                    {
                        if(main->currentBgStripe == 0)
                        {
                            PlayAnimation(animation->animationInfo.animId);
                            ChangeAnimationActivity(animation, 1);
                        }
                    }
                }
                if(main->currentDisplayBG == 0x80)
                    ChangeAnimationActivity(animation, 0);
            } else if(animation->animationInfo.animId >= 138 && animation->animationInfo.animId <= 167) {
                if(arg0 != animation->bgId) {
                    DestroyAnimation(animation);
                    continue;
                }
            } else if(animation->animationInfo.animId >= 168 && animation->animationInfo.animId <= 176) {
                if(main->currentBG != animation->bgId)
                    DestroyAnimation(animation);
            }
            if(animation->flags & 0x40) {
                if(animation->animationInfo.animId == 0x70) {
                    animation->flags |= ANIM_ACTIVE | ANIM_BLEND_ACTIVE;
                    ioRegs->lcd_bldcnt |= BLDCNT_TGT2_BG3;
                    ioRegs->lcd_bldalpha = BLDALPHA_BLEND(8, 11); // blend target 2 wtf??
                }
                *(u16*)REG_ADDR_BLDCNT = ioRegs->lcd_bldcnt;
                *(u16*)REG_ADDR_BLDALPHA = ioRegs->lcd_bldalpha;
            }
            if(animation->flags & 0x80) {
                animation->flags |= ANIM_ACTIVE | ANIM_BLEND_ACTIVE;
                ioRegs->lcd_bldcnt |= BLDCNT_TGT2_BG3;
            }
            if(((animation->flags & (ANIM_BLEND_ACTIVE | 0x80)) == ANIM_BLEND_ACTIVE) && !(animation->animationInfo.animId <= 137 && animation->animationInfo.animId >= 82)) {
                UpdateAnimationBlend(animation);
            }
            if(animation->flags & ANIM_PLAYING && AdvanceAnimationFrame(animation) == 0)
                continue;
            if(animation->animationInfo.animId <= 8)
                gSpecialAnimationEffectFunctions[animation->animationInfo.animId - 1](animation);
            if(courtScroll->state != 0 && animation->animationInfo.animId == 0xFF) {
                UpdatePersonAnimationForCourtScroll(animation);
            }
        }
    }
    animation = &gAnimation[1];
    if(courtScroll->state != 0 && !(animation->flags & ANIM_ALLOCATED)) {
        UpdatePersonAnimationForCourtScroll(animation);
    }
    if(main->animationFlags & 0x4)
    {
        main->animationFlags &= ~0x4;
        ClearAllAnimationSprites();
    }
    UpdateAllAnimationSprites();
}

void nullsub_7() {
    
}
