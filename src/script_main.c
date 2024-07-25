#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
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

void sub_8017154(u8 arg0) {
    struct AnimationListEntry * animation = &gAnimation[1];
    if(animation == NULL
    || (animation->animationInfo.personId != 11 && animation->animationInfo.personId != 33)
    || !(animation->flags & ANIM_ALLOCATED)) {
        return;
    }
    switch(arg0) {
        case 0:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x1C00;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x1E00;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x2D00;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
                DmaCopy16(3, gGfxPressPresentButtons, OBJ_VRAM0 + 0x3000, 0x400);
            }
            break;
        case 1:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x3200;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x3000;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x2E00;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            break;
        case 2:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x1800;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x1A00;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x1C00;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            break;
        case 3:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x200;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x400;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
                DmaCopy16(3, gGfx4bppInvestigationActions, OBJ_VRAM0 + 0x2000, 0x1000);
                DmaCopy16(3, gGfx4bppInvestigationScrollButton, OBJ_VRAM0 + 0x3000, 0x200);
                DmaCopy16(3, gGfxExamineCursor, OBJ_VRAM0 + 0x3200, 0x200);
            }
            break;
        case 4:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x2800;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x2880;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->animationInfo.vramPtr = OBJ_VRAM0 + 0x2900;
                animation->flags |= ANIM_ACTIVE | ANIM_QUEUED_TILE_UPLOAD;
                animation->tileNum = ((uintptr_t)animation->animationInfo.vramPtr / 32) & 0x3FF;
            }
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        case 9:
            break;
        case 10:
            break;
        case 11:
            break;
        case 12:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->flags &= ~ANIM_ACTIVE;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
               animation->flags &= ~ANIM_ACTIVE;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->flags &= ~ANIM_ACTIVE;
            }
            break;
        case 13:
            animation = FindAnimationFromAnimId(0x83);
            if(animation) {
                animation->flags |= ANIM_ACTIVE;
            }
            animation = FindAnimationFromAnimId(0x84);
            if(animation) {
               animation->flags |= ANIM_ACTIVE;
            }
            animation = FindAnimationFromAnimId(0x85);
            if(animation) {
                animation->flags |= ANIM_ACTIVE;
            }
            break;
    }
    //_080174F2 func end
}

void sub_80174F8(u8 * dest, u32 charCode, u16 color, struct OamAttrs * oam, u16 x, u16 y) {
    uintptr_t glyphGfx;
    u8 glyphBuf[0x80];
    u32 i;

    charCode &= 0xFFF;
    glyphGfx = charCode * 0x80;
    glyphGfx += (uintptr_t)gCharSet;
    if(color) {
        u8 * vram;
        u8 * pixel;
        DmaCopy16(3, glyphGfx, glyphBuf, 0x80);
        pixel = glyphBuf;
        glyphGfx = color * 3;
        for(i = 0; i < 0x80; i++)
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
        DmaCopy16(3, glyphBuf, dest, 0x80);
    } else {
        DmaCopy16(3, glyphGfx, dest, 0x80);
    }
    if(oam) {
        oam->attr0 = 0x200 + y;
        oam->attr1 = 0x4000 + x;
        oam->attr2 = 0xD400 + (((uintptr_t)dest & 0x7FFF) / 32);
    }
}

void sub_80175D8(u8 * dest, u32 charCode, u16 color, struct OamAttrs * oam, u16 x, u16 y) {
    u8 glyphBuf[0x80];
    u32 * pixel;
    uintptr_t temp;
    u32 temp2;
    u32 row;
    u32 r7;
    u32 pix1;
    u32 pix2;
    u32 i, j;
    
    charCode &= 0xFFF;
    temp = charCode * 0x80;
    temp += (uintptr_t)gCharSet;
    if(color) {

        DmaCopy16(3, temp, glyphBuf, 0x80);
        pixel = glyphBuf;
        for(i = 0; i < 7; i++) {
            row = 0;
            temp = pixel[i];
            temp |= (pixel[i] >> 4); // ??
            temp2 = pixel[i+1] >> 4;
            for(j = 0; j < 8; j++) {
                pix1 = temp & 0xF;
                pix2 = temp2 & 0xF;
                if(pix2) {
                    row |= (color + 1) << j * 4;
                } else if(pix1) {
                    row |= color << j * 4;
                }
                temp >>= 4;
                temp2 >>= 4;
            }
            pixel[i] = row;
        }
        for(i = 8; i < 15; i++) {
            //_08017694
            temp = pixel[i];
            if(pixel[i] & 0xF) {
                row = pixel[i - 8];
                row &= 0x0FFFFFFF;
                row |= color << 28;
                pixel[i - 8] = row;
            }
            temp |= temp >> 4;
            temp2 = pixel[i + 1];
            if(temp2 & 0xF) {
                row = pixel[i - 8];
                row &= 0x0FFFFFFF;
                row |= (color+1) << 28;
                pixel[i - 8] = row;
            }
            temp2 >>= 4;
            row = 0;
            for(j = 0; j < 8; j++) {
                //_080176EE
                pix1 = temp & 0xF;
                pix2 = temp2 & 0xF;
                if(pix2) {
                    row |= (color + 1) << j * 4;;
                } else if(pix1) {
                    row |= color << j * 4;;
                }
                temp >>= 4;
                temp2 >>= 4;
            }
            pixel[i] = row;
        }
        row = 0;
        temp = pixel[7];
        temp |= pixel[7] >> 4;
        temp2 = pixel[16] >> 4;
        for(j = 0; j < 8; j++) {
            //_08017740
            pix1 = temp & 0xF;
            pix2 = temp2 & 0xF;
            if(pix2) {
                row |= (color + 1) << j * 4;;
            } else if(pix1) {
                row |= color << j * 4;;
            }
            temp >>= 4;
            temp2 >>= 4;
        }
        pixel[7] = row;
        for(i = 16; i < 23; i++) {
            //_08017772
            row = 0;
            temp = pixel[i];
            temp |= (pixel[i] >> 4);
            temp2 = pixel[i+1] >> 4;
            for(j = 0; j < 8; j++) {
                pix1 = temp & 0xF;
                pix2 = temp2 & 0xF;
                if(pix2) {
                    row |= (color + 1) << j * 4;;
                } else if(pix1) {
                    row |= color << j * 4;;
                }
                temp >>= 4;
                temp2 >>= 4;
            }
            pixel[i] = row;
        }
        temp = pixel[23];
        temp |= pixel[23] >> 4;
        row = 0;
        for(j = 0; j < 8; j++) {
            //_08017740
            pix1 = temp & 0xF;
            if(pix1) {
                row |= color << j * 4;;
            }
            temp >>= 4;
        }
        pixel[23] = row;
        temp = pixel[7];
        temp2 = pixel[24];
        if(temp2 & 0xF) {
            row = pixel[7];
            row &= 0x0FFFFFFF;
            row |= (color + 1) << 28;
            pixel[7] = row;
        }
        temp2 >>= 4;
        row = 0;
        temp = pixel[15];
        temp |= (pixel[15] >> 4);
        for(j = 0; j < 8; j++) {
            //_08017828
            pix1 = temp & 0xF;
            pix2 = temp2 & 0xF;
            if(pix2) {
                row |= (color + 1) << j * 4;;
            } else if(pix1) {
                row |= color << j * 4;;
            }
            temp >>= 4;
            temp2 >>= 4;
        }
        pixel[15] = row;
        for(i = 24; i < 31; i++) {
            //_08017860
            temp = pixel[i];
            if(pixel[i] & 0xF) {
                row = pixel[i - 8];
                row &= 0x0FFFFFFF;
                row |= color << 28;
                pixel[i - 8] = row;
            }
            temp |= temp >> 4;
            temp2 = pixel[i + 1];
            if(temp2 & 0xF) {
                row = pixel[i - 8];
                row &= 0x0FFFFFFF;
                row |= (color+1) << 28;
                pixel[i - 8] = row;
            }
            temp2 >>= 4;
            row = 0;
            for(j = 0; j < 8; j++) {
                //_080178BA
                pix1 = temp & 0xF;
                pix2 = temp2 & 0xF;
                if(pix2) {
                    row |= (color + 1) << j * 4;;
                } else if(pix1) {
                    row |= color << j * 4;;
                }
                temp >>= 4;
                temp2 >>= 4;
            }
            pixel[i] = row;
        }
        temp = pixel[31];
        temp |= (pixel[31] >> 4);
        row = 0;
        for(j = 0; j < 8; j++) {
            //_08017740
            pix1 = temp & 0xF;
            if(pix1) {
                row |= color << j * 4;;
            }
            temp >>= 4;
        }
        pixel[31] = row;
        DmaCopy16(3, glyphBuf, dest, 0x80);
    } else {
        DmaCopy16(3, temp, dest, 0x80);
    }
    if(oam) {
        oam->attr0 = 0x200 + y;
        oam->attr1 = 0x4000 + x;
        oam->attr2 = 0xD400 + (((uintptr_t)dest & 0x7FFF) / 32);
    }
}