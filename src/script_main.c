#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

extern void (*gUnknown_0814E338[])(struct ScriptContext *);
extern u16 gUnknown_0802845E[];
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
    scriptPtr = (void*)gUnknown_08270934 + ((u32*)gUnknown_08270934)[1+section];
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

bool32 sub_8017C70(void) {
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

void DrawTextAndMapMarkers(void) {
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

extern const u16 gUnknown_08028370[]; 
extern const u16 gUnknown_08028288[]; 

void sub_8017EF4(u32 arg0) {
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