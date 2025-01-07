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

const u16 gUnknown_08028288[] = {
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800, 0x0800,
    0x0800, 0x0800, 0x0800, 0x0800
};

const u16 gUnknown_08028370[] = {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
};

const u16 gUnknown_0802845E[] = {
    0x0000, 0x0000, 0x0000, 0x0001, 0x0001, 0x0002, 0x0001, 0x0000, 0x0002, 0x0003, 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0002,
    0x0001, 0x0000, 0x0003, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0001, 0x0002, 0x0004, 0x0001, 0x0001, 0x0001, 0x0003, 0x0000,
    0x0001, 0x0000, 0x0002, 0x0002, 0x0000, 0x0001, 0x0001, 0x0002, 0x0001, 0x0001, 0x0003, 0x0000, 0x0001, 0x0000, 0x0000, 0x0002,
    0x0001, 0x0002, 0x0002, 0x0005, 0x0001, 0x0002, 0x0001, 0x0002, 0x0001, 0x0001, 0x0002, 0x0002, 0x0001, 0x0001, 0x0001, 0x0000,
    0x0000, 0x0000, 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0002, 0x0002, 0x0000, 0x0001, 0x0001, 0x0000, 0x0002, 0x0001, 0x0007,
    0x0001, 0x0002, 0x0001, 0x0001, 0x0002, 0x0001, 0x0002, 0x0001, 0x0000, 0x0001, 0x0001, 0x0002, 0x0003, 0x0000, 0x0000, 0x0003,
    0x0004, 0x0003, 0x0000, 0x0000, 0x0001, 0x0002, 0x0003, 0x0000, 0x0000, 0x0004, 0x0001, 0x0003, 0x0001, 0x0001, 0x0001, 0x0001,
    0x0003, 0x0003, 0x0000, 0x0000
};

const u8 gUnknown_08028546[] = {
    0x02, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01,
    0x00, 0x00
};

const uintptr_t gScriptTable[] = {
    0x8271a2c,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0x8271a2c,
    0x8271a2c,
    0x8271a2c,
    0x8271a2c,
    0x8271a2c,
    0x8271a2c,
    0x8271a2c,
    0,
    0,
};


extern void (*gUnknown_0814E338[])(struct ScriptContext *);

void op_demo_play_iOS(void) {
    struct ScriptContext * context = &gScriptContext;
    gUnknown_0814E338[context->unk2C](context);
}

void op_proc_exit_iOS(struct ScriptContext * scriptCtx) {
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

void sub_8016FEC(u16 arg0) { // dahlia shawl stuff / Unity CtrlChinamiObj
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

u32 sub_8017980(u32 section, u8 * dest, u32 x, u32 y, u32 color, struct OamAttrs * oamStart, u16 * metadata) {
    u8 charCount;
    u16 metadataCount;
    u32 textSpeed;
    u32 xStart;
    u16 * scriptPtr;
    struct OamAttrs * oam;
    
    xStart = x;
    charCount = 0;
    metadataCount = 0;
    textSpeed = 8; // 8???
    oam = oamStart;
    scriptPtr = (void*)std_scripts + ((u32*)std_scripts)[1+section];
    for(;*scriptPtr != 0x45; scriptPtr++) {
        if(*scriptPtr > 0x80) {
            sub_80175D8(dest + charCount * 0x80, *scriptPtr - 0x80, color, oam, x, y);
            x += 14;
            charCount++;
            metadata[metadataCount++] = textSpeed;
            if(oam) {
                oam++;
            }
            continue;
        }
        if(*scriptPtr == 0x2E) {
            x = xStart;
            y += 18;
        }
        if(*scriptPtr == 0xC) {
            scriptPtr++;
            metadata[metadataCount++] = *scriptPtr + 0x8000;
        }
        else if(*scriptPtr == 0xB) {
            scriptPtr++;
            textSpeed = *scriptPtr;
        }
        else if(*scriptPtr == 0x20) {
            scriptPtr++;
            metadata[metadataCount++] = *scriptPtr + 0x4000;
        }
    }
    sub_80174F8(dest + charCount * 0x80, 0xFF, color, oam, x, y);
    metadata[metadataCount++] = 0xFFFF;
    return metadataCount;
}

void sub_8017AB4(u32 arg0) {
    gScriptContext.unk44 = arg0;
    switch(arg0) {
        default:
        case 2:
            return;
        case 3:
        case 9:
            LZ77UnCompWram(NULL, eScriptHeap);
            sub_8018CA8(&gMain, 0xA0);
            break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
            LZ77UnCompWram(NULL, eScriptHeap);
            return;
        case 1:
        case 15:
            LZ77UnCompWram(NULL, eScriptHeap);
            sub_8018CA8(&gMain, 0x90);
            break;
        case 16:
            LZ77UnCompWram(NULL, eScriptHeap);
            sub_8018CA8(&gMain, 0xB0);
            break;
        case 17:
            LZ77UnCompWram(NULL, eScriptHeap);
            sub_8018CA8(&gMain, 0xA0);
            break;
    }
    sub_8007610(gMain.scenarioIdx);
    ChangeScriptSection(0x80);
}

void sub_8017BA8(void) {
    u32 i;
    for(i = 0; i < 2; i++) {
        gScriptContext.unk18[i] = 0;
    }
}

void sub_8017BC0(void) {
    u32 r4 = 16;
    u16 * scriptPtr = gScriptContext.scriptPtr;
    u32 i;

    if(gScriptContext.unk29 > 2)
        return;
    while(TRUE) {
        if(*scriptPtr < 0x80) {
            u32 argCount;
            if (*scriptPtr == 1
             || *scriptPtr == 2
             || *scriptPtr == 7
             || *scriptPtr == 8
             || *scriptPtr == 9
             || *scriptPtr == 10
             || *scriptPtr == 13
             || *scriptPtr == 21
             || *scriptPtr == 42
             || *scriptPtr == 45
             || *scriptPtr == 46
             || *scriptPtr == 69) {
                break;
            }
            argCount = gUnknown_0802845E[*scriptPtr];
            for(i = 0; i < argCount; i++) {
                scriptPtr++;
            }
        }
        else {
            r4--;
            if(r4 == 0)
                break;
        }
        scriptPtr++;
    }
    if(gScriptContext.unk29 == 0) {
        if(*scriptPtr == 1 || *scriptPtr == 0x2E) {
            gScriptContext.unk18[1] = 1;
        }
    }
    gScriptContext.unk18[gScriptContext.unk29] = r4;
}

bool32 CommandUnimplemented(void) {
    u8 argCount = gUnknown_0802845E[gScriptContext.unkA];
    u8 i;
    if(argCount == 0)
        gScriptContext.scriptPtr++;
    for(i = 0; i < argCount; i++) {
        gScriptContext.scriptPtr++;
    }
    return FALSE;
}

void sub_8017CA8(u16 *markerAttr, u16 fieldMask, u16 notFieldMask, u16 delta, u16 *oamAttr) {
    u32 attr = *markerAttr;
    u32 field = fieldMask;
    u32 result = notFieldMask;

    field &= attr;
    result &= attr;

    field += delta;
    field &= fieldMask;
    result += field;

    *markerAttr = result;
    *oamAttr = result;
}

void DrawMapMarkers(void) {
    struct OamAttrs * oam;
    u32 i;
    u32 y, x;
    u32 size;

    if((gScriptContext.flags & SCRIPT_FULLSCREEN))
        return;
    if(gMain.process[GAME_PROCESS] < COURT_PROCESS || gMain.process[GAME_PROCESS] > QUESTIONING_PROCESS)
        return;
    oam = &gOamObjects[OAM_IDX_MAP_MARKER];
    for(i = 0; i < ARRAY_COUNT(gMapMarker); i++) 
    {
        if(gMapMarker[i].id != 0xFF)
        {
            u16 r4 = oam->attr1 & 0x1FF;
            u16 r3 = oam->attr0 & 0xFF;

            oam->attr0 = gMapMarker[i].attr0;
            oam->attr1 = gMapMarker[i].attr1;
            if(gMapMarker[i].isBlinking)
            {
                gMapMarker[i].blinkTimer++;
                gMapMarker[i].blinkTimer &= 0x1F;
                if (gMapMarker[i].blinkTimer < 16)
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
            }
            if(gMapMarker[i].flags & 0x2)
            {
                if(gMapMarker[i].direction != 4) {
                    gMapMarker[i].distanceMoved += gMapMarker[i].speed;
                    if (gMapMarker[i].distanceMoved >= gMapMarker[i].distanceToMove)
                    {
                        gMapMarker[i].speed -= gMapMarker[i].distanceMoved - gMapMarker[i].distanceToMove;
                        gMapMarker[i].flags &= ~2;
                    }
                } else {
                    r4 += gScriptContext.unk46;
                    r3 += gScriptContext.unk48;
                    gScriptContext.unk4A--;
                    if(gScriptContext.unk4A == 0) {
                        gMapMarker[i].flags &= ~2;
                        gMapMarker[i].attr0 &= ~0xFF;
                        gMapMarker[i].attr0 |= r3 & 0xFF;
                        gMapMarker[i].attr1 &= ~0x1FF;
                        gMapMarker[i].attr1 |= r4 & 0x1FF;   
                    }
                    oam->attr0 &= ~0xFF;
                    oam->attr0 |= r3 & 0xFF;
                    oam->attr1 &= ~0x1FF;
                    oam->attr1 |= r4 & 0x1FF;
                }
                switch(gMapMarker[i].direction)
                {
                    case 0:
                        sub_8017CA8(&gMapMarker[i].attr0, 0xFF, 0xFF00, -gMapMarker[i].speed, &oam->attr0);
                        break;
                    case 1:
                        sub_8017CA8(&gMapMarker[i].attr0, 0xFF, 0xFF00, gMapMarker[i].speed, &oam->attr0);
                        break;
                    case 2:
                        sub_8017CA8(&gMapMarker[i].attr1, 0x1FF, 0xFE00, -gMapMarker[i].speed, &oam->attr1);
                        break;
                    case 3:
                        sub_8017CA8(&gMapMarker[i].attr1, 0x1FF, 0xFE00, gMapMarker[i].speed, &oam->attr1);
                        break;
                    default:
                        break;
                }
            }
            if(gMapMarker[i].flags & 0x4)
                oam->attr0 = SPRITE_ATTR0_CLEAR;
            if(gMapMarker[i].oamIdx < OAM_IDX_GENERAL_2 || gMapMarker[i].oamIdx > OAM_IDX_ITEMPLATE_ITEM) {
                gOamObjects[gMapMarker[i].oamIdx].attr0 = gMapMarker[i].attr0;
                gOamObjects[gMapMarker[i].oamIdx].attr1 = gMapMarker[i].attr1;
                gOamObjects[gMapMarker[i].oamIdx].attr2 = gMapMarker[i].attr2;
            }
            oam++;
        }
        else
        {
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
    }
}

void sub_8017EF4(u32 arg0) { // unity SetScript
    if(gScriptContext.unkA == arg0)
        return;
    if(arg0 != 12)
        gScriptContext.flags &= ~SCRIPT_x8000;

    gScriptContext.unk14 = gScriptContext.unk12;
    gScriptContext.unk12 = 0;
    gScriptContext.unk12 = gUnknown_08028288[arg0];
    gScriptContext.unk12 |= gUnknown_08028370[arg0];
    gScriptContext.unkA = arg0;
}

void PutCharInTextbox(u32 characterCode, u32 x, u32 y) {
    u8 sp0[0x80];
    u32 things[] = {4, 8, 11, 14, 16};
    u32 sp98 = x;
    u32 lol = 2 * 0x800;
    uintptr_t vram;
    uintptr_t temp;
    u32 i;
    if(gScriptContext.flags & SCRIPT_FULLSCREEN) {
        for(i = 32; i < 64; i++) {
            if(!(gTextBoxCharacters[i].state & 0x8000)) {
                sp98 = i - 32;
                break;
            }
        }
    }
    vram = 0x6010000 + sp98 * 128;
    if(gScriptContext.flags & SCRIPT_FULLSCREEN) {
        vram += lol;
    } else {
        vram += y * 0x800;
    }
    temp = characterCode * 0x80;
    temp += (uintptr_t)gCharSet;
    if(gScriptContext.unk22 & 0x20) {
        u32 val;
        for(i = 0; i < 5; i++) {
            if(things[i] > x)
                break;
        }
        if(i == 5) 
            return;
        if(i == 0)
            i = 5;
        gScriptContext.unk25 = ((5 - i) << 4) | (gScriptContext.unk25 & 0xF);
    }
    if(gScriptContext.unk25) {
        u8 * pixel;
        u32 half1, half2;
        if(gScriptContext.unk25 & 0xF0) {
            DmaCopy16(3, temp, sp0, 0x80);
            pixel = sp0;
            temp = (gScriptContext.unk25 & 0xF0) >> 4;
            for(i = 0; i < 0x80; i++) {
                half2 = *pixel;
                half1 = half2 & 0xF;
                half2 = half2 & 0xF0;
                if(half1 == 3)
                    half1 = temp;
                else if(half1 == 2) {
                    half1 = 0;
                    if(temp % 5 != 1) {
                        half1 = temp - 1;
                    }
                } else {
                    half1 = 0;
                }
                if(half2 == 0x30)
                    half2 = temp << 4;
                else if(half2 == 0x20 && temp % 5 != 1) {
                    half2 = (temp - 1) << 4;
                } else {
                    half2 = 0;
                }
                *pixel++ = half1 | half2;
            }
        } else {
            DmaCopy16(3, temp, sp0, 0x80);
            pixel = sp0;
            temp = gScriptContext.unk25 * 3;
            for(i = 0; i < 0x80; i++) {
                half2 = *pixel;
                half1 = half2 & 0xF;
                half2 = half2 & 0xF0;
                if(half1)
                    half1 += temp;
                if(half2)
                    half2 += temp << 4;
                *pixel++ = half1 | half2;
            }
        }
        DmaCopy16(3, sp0, vram, 0x80);
    } else {
        DmaCopy16(3, temp, vram, 0x80);
    }
    if(gScriptContext.flags & SCRIPT_FULLSCREEN) {
        for(i = 32; i < 64; i++) {
            if(!(gTextBoxCharacters[i].state & 0x8000)) {
                temp = i;
                break;
            }
        }
    } else {
        temp = x + y * 16;
    }
    gTextBoxCharacters[temp].x = x * 14;
    gTextBoxCharacters[temp].y = y * 18;
    gTextBoxCharacters[temp].state = characterCode | 0x8000;
    if((gScriptContext.unk22 & 0xF0) == 0x10) {
        gTextBoxCharacters[temp].state |= 0x4000;
        gTextBoxCharacters[temp].x = x * 28;
    } else {
        gTextBoxCharacters[temp].state &= ~0x4000;
    }
    gTextBoxCharacters[temp].objAttr2 = x * 4 + y * 0x40;
    if(gScriptContext.unk25 & 0xF0) {
        gTextBoxCharacters[temp].color = gScriptContext.unk25;
        gTextBoxCharacters[temp].color |= 0x8000;
    }
    else {   
        gTextBoxCharacters[temp].color = gScriptContext.unk25 & 0xF0;
    }
    
    if(gScriptContext.flags & SCRIPT_FULLSCREEN) {
        gTextBoxCharacters[temp].x += 14;
        gTextBoxCharacters[temp].y += 36;
        gTextBoxCharacters[temp].objAttr2 = sp98 * 4 + 0x80;
        if(gScriptContext.flags & SCRIPT_FULLSCREEN) {
            gTextBoxCharacters[temp].x += gScriptContext.unk4C;
            gTextBoxCharacters[temp].y += gScriptContext.unk4D;
        }
    }
    gTextBoxCharacters[temp].objAttr2 += 0x400;
    gTextBoxCharacters[temp].color2 = gScriptContext.unk25;
}

extern bool32 (*gScriptCmdFuncs[0x72])(struct ScriptContext *);

void AdvanceScriptContext(void) {
    u32 r7 = 0;
    struct ScriptContext * scriptCtx = &gScriptContext;
    
    if(gMain.process[GAME_PROCESS] == TITLE_SCREEN_PROCESS)
        return;
    
    gUnknown_0814E338[scriptCtx->unk2C](scriptCtx);
    
    if(gMain.blendMode && !(scriptCtx->flags & SCRIPT_x2))
        return;
    
    if((scriptCtx->unk2E & 0xF) == 1)
        return;
    for(;;)
    {
        if(IsHPBarAnimating() == TRUE)
            return;
        if(gMain.blendMode)
            return;
    
        if(scriptCtx->flags & SCRIPT_FULLSCREEN && scriptCtx->unk23 == 2)
            return;
        if(scriptCtx->unk23 == 3)
            return;

        scriptCtx->currentToken = *scriptCtx->scriptPtr++;
        if(scriptCtx->currentToken < 0x80)
        {
            u32 retval;
            sub_8017EF4(scriptCtx->currentToken);
            retval = gScriptCmdFuncs[scriptCtx->unkA](NULL);
            if(retval == 0)
                continue;
            scriptCtx->scriptPtr--;
            return;
        }
        if((scriptCtx->unk2E >> 4) != 1) {
            if(scriptCtx->flags & SCRIPT_x800) {
                if((gJoypad.heldKeys & B_BUTTON || gJoypad.pressedKeys & A_BUTTON))
                    scriptCtx->flags |= SCRIPT_x2000;
            } 
        }
        
        if(!(scriptCtx->flags & SCRIPT_FULLSCREEN)) {
            if(scriptCtx->flags & SCRIPT_x2000 &&
               scriptCtx->flags & SCRIPT_x800) {
                if(r7 != 0)
                {
                    scriptCtx->scriptPtr--;
                    return;
                }
            } else {
                scriptCtx->flags &= ~SCRIPT_x2000;
                if(scriptCtx->unk27 & 0xF) {
                    scriptCtx->unk27--;
                    scriptCtx->scriptPtr--;
                    return;
                } else {
                    scriptCtx->unk27 = scriptCtx->textSpeed + (scriptCtx->unk27 & 0xF0); 
                }
            }
        }
        scriptCtx->flags |= SCRIPT_x8000;
        scriptCtx->currentToken -= 0x80;
        PutCharInTextbox(scriptCtx->currentToken, scriptCtx->unk28, scriptCtx->unk29);
        scriptCtx->unk28++;
        if (scriptCtx->currentToken != 0xFF && 
            scriptCtx->textSpeed > 0 &&
            !(scriptCtx->flags & SCRIPT_FULLSCREEN) &&
            scriptCtx->unk29 < 2 &&
            (r7 == 0 || scriptCtx->soundCueSkip == 1))
        {
            if (scriptCtx->soundCueSkip != 0 && scriptCtx->textSpeed > 5)
                scriptCtx->soundCueSkip = 1;
            if(scriptCtx->soundCueSkip > 1) {
                scriptCtx->soundCueSkip--;
                continue;
            }
            if(scriptCtx->soundCueSkip == 1)
                scriptCtx->soundCueSkip = 2;
            if(r7 == 0 || scriptCtx->soundCueSkip != 0) {
                if(scriptCtx->currentSection > 26) {
                    if (!(gMain.soundFlags & SOUND_FLAG_DISABLE_CUE))
                    {
                        if (scriptCtx->soundCueSkip == 0)
                        {
                            PlaySE(68);
                        } else {
                            if (gUnknown_08028546[scriptCtx->unk24] == 1)
                            {
                                PlaySE(46);
                            }
                            do{}while(0); // ! fakematch? probably has deadcode somewhere thus needing this (permuter match)
                            if (gUnknown_08028546[scriptCtx->unk24] == 0)
                            {
                                PlaySE(45);
                            }
                        }
                    }
                }
            }
        }
    }
}

void LoadCurrentScriptIntoRam(void)
{
    u32 i;

    gScriptContext.unk28 = 0;
    gScriptContext.unk29 = 0;
    gScriptContext.unk4C = 0;
    gScriptContext.unk4D = 0;
    gScriptContext.soundCueSkip = 0;
    gScriptContext.textSpeed = 0;
    gScriptContext.flags = 0;
    gScriptContext.unk27 = 0;
    gScriptContext.unk24 = 0;
    gScriptContext.unk22 = 0;
    gScriptContext.unk40 = 0x80;
    gScriptContext.unk44 = 0;
    gScriptContext.unk1E = 0;
    gUnknown_030070B0.unk20 = 0;
    gScriptContext.unk4E = 0;
    for(i = 0; i < 3; i++) {
        gScriptContext.unk54[i][0] = 0;
        gScriptContext.unk54[i][1] = 0;
        gScriptContext.unk54[i][2] = 0;
    }
    for(i = 0; i < 16; i++) {
        gUnknown_030070B0.unk00[i] = 0;
    }
    DmaCopy16(3, gTextPal, OBJ_PLTT, 0x20);

    for (i = 0; i < ARRAY_COUNT(gTextBoxCharacters); i++)
    {
        gTextBoxCharacters[i].state &= ~(0x8000|0x4000);
    }

    LZ77UnCompWram(gScriptTable[gMain.scenarioIdx], eScriptHeap);

    for (i = 0; i < ARRAY_COUNT(gMapMarker); i++)
    {
        gMapMarker[i].id |= 0xFF;
        gMapMarker[i].isBlinking = 0;
        gMapMarker[i].flags = 0;
        gMapMarker[i].attr0 = SPRITE_ATTR0_CLEAR;
    }
}

void MarkSectionAsRead(struct Main * main, s32 section)
{
    u32 word;
    u32 bit;
    
    if(section == 0xFFFF)
        return;

    section -= 0x80;
    if(section < 0)
        return;
    
    word = section / 32;
    bit = section % 32;
    main->sectionReadFlags[word] |= 1 << bit;
}

void sub_8018638(u32 section) // init new section??
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    u32 i;
    
    if(section != scriptCtx->currentSection+1) {
        for (i = 0; i < ARRAY_COUNT(gMapMarker); i++)
        {
            gMapMarker[i].id |= 0xFF;
        }
    }
    MarkSectionAsRead(&gMain, scriptCtx->currentSection);
    for (i = 0; i < 0x21; i++)
    {
        gTextBoxCharacters[i].state &= ~(0x8000|0x4000);
    }
    scriptCtx->currentSection = section;
    scriptCtx->unkE = section+1;
    scriptCtx->unk28 = 0;
    scriptCtx->unk29 = 0;
    scriptCtx->flags &= ~SCRIPT_LOOP;
    scriptCtx->flags &= ~SCRIPT_FULLSCREEN;
    scriptCtx->flags &= ~SCRIPT_x1;
    if(scriptCtx->unk22 & 0xF) {
        sub_8017BA8();
        sub_8017BC0();
    }
    if(HasSectionBeenRead(&gMain, scriptCtx->currentSection)) {
        scriptCtx->flags |= SCRIPT_x800;
    } else {
        scriptCtx->flags &= ~SCRIPT_x800;
    }
    if(gMain.unk2D0 & 4) { //!debug
        scriptCtx->flags |= SCRIPT_x800;
    }
}

void sub_801873C(u32 idx) // goto jump section
{
    struct ScriptContext * scriptCtx = &gScriptContext;
    u32 offset;
    u32 *heapPtr;
    u16 *ptr;
    heapPtr = eScriptHeap;
    ptr = (u16 *)(heapPtr + idx + 1);
    offset = ptr[0] / 2;
    idx = ptr[1];
    sub_8018638(idx + 0x80);
    scriptCtx->scriptSectionPtr = eScriptHeap + ((u32 *)eScriptHeap)[idx + 1];
    scriptCtx->scriptPtr = scriptCtx->scriptSectionPtr + offset;
}

void ChangeScriptSection(u32 section) {
    struct ScriptContext * scriptCtx = &gScriptContext;
    uintptr_t scriptStart;
    u32 *sectionOffset;
    //struct Main * main = &gMain;
    if(gMain.unk2D0 & 8) { //!debug
        if(section >= 0x80 &&
           scriptCtx->currentSection >= 0x80) {
            section = scriptCtx->currentSection + 1; // why?
        }
    }
    if(gMain.process[GAME_PROCESS] == INVESTIGATION_PROCESS ||
       gMain.processCopy[GAME_PROCESS] == INVESTIGATION_PROCESS) {
        if(gMain.process[GAME_PROCESS_STATE] != INVESTIGATION_10) { // psychelock?
            if(sub_8016ED8() == FALSE) {
                sub_8017154(2);
            } else {
                sub_8017154(4);
            }
        }
    }
    sub_8018638(section);

    if (scriptCtx->currentSection >= 0x80)
    {
        scriptStart = eScriptHeap;
        sectionOffset = (u32 *)eScriptHeap + (scriptCtx->currentSection-0x80);
    }
    else
    {
        scriptStart = std_scripts;
        sectionOffset = (u32 *)std_scripts + scriptCtx->currentSection;
    }
    scriptCtx->scriptPtr = sectionOffset[1] + scriptStart;
    scriptCtx->scriptSectionPtr = scriptCtx->scriptPtr;
}

void DrawText(void) {
    struct OamAttrs * oam;
    u32 matrixNum = 5;
    bool32 secondaryPaletteLoaded = FALSE;
    u32 i;
    if(gMain.showTextboxCharacters) {
        oam = &gOamObjects[OAM_IDX_TEXT];
        for(i = 0; i < 32; i++) {
            if(gTextBoxCharacters[i].state & 0x8000)
            {
                if(gScriptContext.flags & SCRIPT_FULLSCREEN)
                    oam->attr0 = SPRITE_ATTR0(gTextBoxCharacters[i].y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                else
                    oam->attr0 = SPRITE_ATTR0(gTextBoxCharacters[i].y + 116, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                oam->attr1 = SPRITE_ATTR1_NONAFFINE(gTextBoxCharacters[i].x + 9, FALSE, FALSE, 1);
                if(gScriptContext.currentSection == 6 ||
                   gScriptContext.currentSection == 7 ||
                   gScriptContext.currentSection == 8 ||
                   gScriptContext.currentSection == 9 ||
                   gScriptContext.currentSection == 10 ||
                   gScriptContext.currentSection == 11 ||
                   gScriptContext.currentSection == 12 ||
                   gScriptContext.currentSection == 13 ||
                   gScriptContext.currentSection == 14 ||
                   gScriptContext.currentSection == 15 ||
                   gScriptContext.currentSection == 16 ||
                   gScriptContext.currentSection == 17 ||
                   gScriptContext.currentSection == 18 ||
                   gScriptContext.currentSection == 19 ||
                   gScriptContext.currentSection == 20 ||
                   gScriptContext.currentSection == 21 ||
                   gScriptContext.currentSection == 22 ||
                   gScriptContext.currentSection == 23 ||
                   gScriptContext.currentSection == 24 ||
                   gScriptContext.currentSection == 25 ||
                   gScriptContext.currentSection == 26 ||
                   gScriptContext.currentSection == 27 ||
                   gScriptContext.currentSection == 28 ||
                   gScriptContext.currentSection == 29 ||
                   gScriptContext.currentSection <= 1 ||
                   gScriptContext.currentSection == 3 ||
                   gScriptContext.currentSection == 4) 
                {
                    oam->attr0 -= 64;
                } else if((gScriptContext.flags & SCRIPT_FULLSCREEN) == 0 &&
                          (gScriptContext.unk22 & 0xF))
                {
                    oam->attr1 += gScriptContext.unk18[(u8)(gTextBoxCharacters[i].y / 18)] * 7 - 2;
                    if((gScriptContext.unk22 & 0xF) == 2) {
                        if(gScriptContext.unk18[1]) {
                            oam->attr0 -= 54;
                        } else {
                            oam->attr0 = SPRITE_ATTR0(71, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                        }
                    }
                }
                oam->attr2 = gTextBoxCharacters[i].objAttr2;
                if(gTextBoxCharacters[i].color & 0x8000) {
                    oam->attr2 &= 0xFFF;
                    oam->attr2 |= 0xD000;
                    if(secondaryPaletteLoaded == FALSE) {
                        static const u16 gUnknown_08028678[] = {
                            0x0000, 0x318c, 0x4210, 0x4e73, 0x6739, 0x0000, 0x000b, 0x0010, 0x0014, 0x0017, 0x001b, 0x0160, 0x0200, 0x0280, 0x02e0, 0x0360
                        };

                        DmaCopy16(3, gUnknown_08028678, OBJ_PLTT + 13 * 0x20, 0x20);
                        secondaryPaletteLoaded = TRUE;
                    }
                }
                if(gTextBoxCharacters[i].state & 0x4000) {
                    oam->attr0 |= ST_OAM_AFFINE_DOUBLE << 8; // !!!???
                    oam->attr1 |= matrixNum << 9;
                    if(gTextBoxCharacters[i].y != 0 || gTextBoxCharacters[i].x >= 198) {
                        oam->attr0 = SPRITE_ATTR0_CLEAR;
                    }
                }
                //_08018974
                if(gScriptContext.flags & SCRIPT_x1000) {
                    oam->attr0 |= ST_OAM_OBJ_BLEND << 10;
                } else {
                    oam->attr0 &= ~(ST_OAM_OBJ_BLEND << 10);
                }
            } else {
                oam->attr0 = SPRITE_ATTR0_CLEAR;
            }
            //_080189B8
            oam++;
        }
        //oam = &gOamObjects[OAM_IDX_TEXT];
        if(gScriptContext.flags & SCRIPT_FULLSCREEN) {
            oam = &gOamObjects[OAM_IDX_TEXT_FULLSCREEN];
            for(i = 32; i < ARRAY_COUNT(gTextBoxCharacters); i++)
            {
                if(gTextBoxCharacters[i].state & 0x8000)
                {
                    oam->attr0 = SPRITE_ATTR0(gTextBoxCharacters[i].y, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_SQUARE);
                    oam->attr1 = SPRITE_ATTR1_NONAFFINE(gTextBoxCharacters[i].x + 9, FALSE, FALSE, 1);
                    oam->attr2 = gTextBoxCharacters[i].objAttr2;
                    if(gScriptContext.flags & SCRIPT_x1000) {
                        oam->attr0 |= ST_OAM_OBJ_BLEND << 10;
                    } else {
                        oam->attr0 &= ~(ST_OAM_OBJ_BLEND << 10);
                    }
                }
                else
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                oam++;
            }
        }
    } else {
        oam = &gOamObjects[OAM_IDX_TEXT];
        for(i = 0; i < 32; i++)
        {
            oam->attr0 = SPRITE_ATTR0_CLEAR;
            oam++;
        }
    }
}

void RunScriptContext(void) {
    if (gMain.advanceScriptContext && gMain.blendMode == 0)
        AdvanceScriptContext();
    if((gScriptContext.unk1E & 0x800) == 0)
        DrawMapMarkers();
    DrawText();
}

void RedrawTextboxCharacters(void)
{
    u32 i;
    u8 * src;
    uintptr_t dst;
    for(i = 0; i < ARRAY_COUNT(gTextBoxCharacters); i++)
    {
        struct TextBoxCharacter *theCharacter = &gTextBoxCharacters[i];
        if(theCharacter->state & 0x8000)
        {
            u32 temp = theCharacter->state & 0x3FFF;
            temp *= 0x80;
            temp += (u32)gCharSet; //! why tho
            if(theCharacter->color2) {
                u8 * pixel;
                u32 half1, half2;
                if(theCharacter->color2 & 0xF0) {
                    DmaCopy16(3, temp, gTextColorTileBuffer, 0x80);
                    pixel = gTextColorTileBuffer;
                    temp = (theCharacter->color2 & 0xF0) >> 4;
                    for(dst = 0; dst < 0x80; dst++) {
                        half2 = *pixel;
                        half1 = half2 & 0xF;
                        half2 = half2 & 0xF0;
                        if(half1 == 3)
                            half1 = temp;
                        else if(half1 == 2) {
                            half1 = 0;
                            if(temp % 5 != 1) {
                                half1 = temp - 1;
                            }
                        } else {
                            half1 = 0;
                        }
                        if(half2 == 0x30)
                            half2 = temp << 4;
                        else if(half2 == 0x20 && temp % 5 != 1) {
                            half2 = (temp - 1) << 4;
                        } else {
                            half2 = 0;
                        }
                        *pixel++ = half1 | half2;
                    }
                } else {
                    DmaCopy16(3, temp, gTextColorTileBuffer, 0x80);
                    pixel = gTextColorTileBuffer;
                    temp = theCharacter->color2 * 3;
                    for(dst = 0; dst < 0x80; dst++) {
                        half2 = *pixel;
                        half1 = half2 & 0xF;
                        half2 = half2 & 0xF0;
                        if(half1)
                            half1 += temp;
                        if(half2)
                            half2 += temp << 4;
                        *pixel++ = half1 | half2;
                    }
                }
                src = gTextColorTileBuffer;
                dst = (u8*)(OBJ_VRAM0 + i * 0x80);
                DmaCopy16(3, src, dst, 0x80);
            }
            else
            {
                dst = (u8*)(OBJ_VRAM0 + i * 0x80);
                DmaCopy16(3, temp, dst, 0x80);
            }
        }
    }
}

bool32 HasSectionBeenRead(struct Main * main, s32 section)
{
    u32 word;
    u32 bit;
    
    if(section == 0xFFFF)
        return FALSE;

    section -= 0x80;
    if(section < 0)
        return FALSE;

    word = section / 32;
    bit = section % 32;
    return main->sectionReadFlags[word] & (1 << bit); // please return a bool :(
}

void ClearSectionReadFlags(struct Main * main)
{
    u16 i;
    for(i = 0; i < 8; i++)
    {
        main->sectionReadFlags[i] = 0;
        main->talkEndFlags[i] = 0;
    }
}

void loadSectionReadFlagsFromSaveDataBuffer(struct Main * main)
{
    u16 i;
    for(i = 0; i < 8; i++)
    {
        main->sectionReadFlags[i] = gSaveDataBuffer.main.sectionReadFlags[i];
    }
}

void sub_8018CA8(struct Main * main, u32 arg1) {
    u32 * flags;
    s32 i;
    s32 section;
    s32 word;
    s32 bit;
    for(i = 0x80; i < arg1; i++) {
        if(i == 0xFFFF)
            return;

        section = i;
        section -= 0x80;
        if(section < 0)
            return;
        if(section != 0) {
            word = section / 32;
            bit = section % 32;
        } else {
            word = 0;
            bit = 0;
        }

        main->sectionReadFlags[word] &= ~(1 << bit);
    }
}
