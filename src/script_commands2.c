#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

void sub_8019AAC(void) {
    struct Main * main = &gMain;
    struct AnimationListEntry * anim;
    switch(main->unk258) {
        case 0:
            PlayAnimation(0x55);
            PlaySE(0x53);
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

struct MapMarkerSprite
{
    /* +0x00 */ u8 *tiles;
    /* +0x04 */ u16 size;
    /* +0x06 */ u16 attr0;
    /* +0x08 */ u16 attr1;
    /* +0x0A */ u16 attr2;
};
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
        .tiles = 0x800,
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
        .tiles = 0x800,
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
    if(gMain.showTextboxCharacters == TRUE && gScriptContext.unk23 == 0) {
        gBG1MapBuffer[622] = gUnknown_08028736[(gScriptContext.unk12 & 0xFF) / 8];
        gBG1MapBuffer[623] = gUnknown_08028736[(gScriptContext.unk12 & 0xFF) / 8] + 1;
    }
}