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

extern struct PersonAnimationData gPersonAnimData[];
extern struct SpriteSizeData gSpriteSizeTable[];
extern struct AnimationData gAnimationData[];
extern u16 gObjPaletteBuffer[16][16];

struct AnimationListEntry * CreateAnimationFromAnimationInfo(struct AnimationInfo * animationInfo, u32 arg1, u32 flags);


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
