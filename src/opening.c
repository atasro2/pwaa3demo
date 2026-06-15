#include "global.h"
#include "script.h"
#include "animation.h"
#include "main.h"
#include "graphics.h"
#include "ewram.h"
#include "save.h"
#include "sound.h"
#include "utils.h"
#include "demo.h"

void sub_801D308(struct ScriptContext* scriptCtx);
void sub_801D474(struct ScriptContext* scriptCtx);
void sub_801D548(struct ScriptContext *scriptCtx);

void sub_801C8BC(struct ScriptContext* scriptCtx) {
    struct IORegisters * ioRegs = &gIORegisters;
    struct Main * main = &gMain;
    struct ScriptContext * scriptCtx2 = &gScriptContext;
    struct AnimationListEntry * anim;
    u16 i, j;
    u16 r4;
    u8 * src;
    u8 * dst;
    switch (scriptCtx->unk2D) {
    case 1:
        switch (scriptCtx->unk2F) {
        case 2:
        case 0:
            anim = FindAnimationFromAnimId(30);
            if (anim == NULL) {
                scriptCtx2->flags |= 0x2;
                scriptCtx2->flags |= 0x20;
                PlayAnimation(30);
                if (scriptCtx->unk2F == 0) {
                    StartAnimationBlend((30 << 8) | 1, 6);
                }
            }
            op_proc_exit_iOS(scriptCtx);
            break;
        case 1:
            DestroyAnimation(FindAnimationFromAnimId(30));
            scriptCtx2->flags &= ~0x2;
            scriptCtx2->flags &= ~0x20;
            op_proc_exit_iOS(scriptCtx);
            break;
        case 3:
            StartAnimationBlend((30 << 8) | 4, 6);
            op_proc_exit_iOS(scriptCtx);
            break;
        }
        break;
    case 2:
        if (scriptCtx->unk2F == 0) {
            anim = FindAnimationFromAnimId(31);
            if (anim == NULL) {
                PlayAnimation(31);
                scriptCtx2->flags |= 0x2;
                scriptCtx2->flags |= 0x20;
            }
            op_proc_exit_iOS(scriptCtx);
        }
        break;
    case 3:
        if (scriptCtx->unk2F == 0) {
            if (scriptCtx->unk30[0] == 0) {
                DestroyAnimation(FindAnimationFromAnimId(31));
                scriptCtx2->flags &= ~2;
                scriptCtx2->flags &= ~0x20;
                sub_801D308(scriptCtx);
            }
            sub_801D474(scriptCtx);
        } else {
            ioRegs->lcd_bg2cnt = 0x3E00;
            gIORegisters.lcd_dispcnt = 0x1E40;
            main->tilemapUpdateBits = 0xE;
            DmaFill16(3, 0, gBG2MapBuffer, sizeof(gBG2MapBuffer));
            op_proc_exit_iOS(scriptCtx);
        }
        break;
    case 4:
        if (scriptCtx->unk2F == 0) {
            anim = FindAnimationFromAnimId(32);
            if (anim == NULL) {
                PlayAnimation(32);
            }
        } else {
            DestroyAnimation(FindAnimationFromAnimId(32));
        }
        op_proc_exit_iOS(scriptCtx);
        break;
    case 5:
        if (scriptCtx->unk2F == 0) {
            main->tilemapUpdateBits &= ~4;
            DmaCopy16(3, PLTT, gBG2MapBuffer, 0x200);
            DmaFill16(3, 0, PLTT+0x20, 0x1E0);
            op_proc_exit_iOS(scriptCtx);
        } else {
            gIORegisters.lcd_bldcnt = 0xC9;
            gIORegisters.lcd_bldy = 0x10;
            *(u32*)&REG_BLDCNT = gIORegisters.lcd_bldcnt;
            *(u16*)&REG_BLDY = gIORegisters.lcd_bldy;
            DmaCopy16(3, gBG2MapBuffer, PLTT, 0x200);
            op_proc_exit_iOS(scriptCtx);
        }
        break;
    case 6:
        if (scriptCtx->unk2F == 0) {
            anim = FindAnimationFromAnimId(33);
            if (anim == NULL) {
                PlayAnimation(33);
            }
        } else {
            DestroyAnimation(FindAnimationFromAnimId(33));
        }
        op_proc_exit_iOS(scriptCtx);
        break;
    case 7:
        if (scriptCtx->unk2F == 0) {
            sub_80060E8();
            DmaFill16(3, 0xFFFF, PLTT+0x40, 0x1C0);
            DmaFill16(3, 0x2222, BG_CHAR_ADDR(1), 0x9600);
            op_proc_exit_iOS(scriptCtx);
        }
        break;
    case 8:
        if (scriptCtx->unk2F == 0) {
            anim = FindAnimationFromAnimId(115);
            if (anim == NULL) {
                PlayAnimation(115);
            }
        } else {
            anim = FindAnimationFromAnimId(115);
            if (anim != NULL) {
                DestroyAnimation(anim);
            }
        }
        op_proc_exit_iOS(scriptCtx);
        break;
    case 9:
        switch (scriptCtx->unk2F) {
        case 0:
            r4 = scriptCtx2->unk30[5] * 0x11;
            scriptCtx2->flags |= 0x40;
            ioRegs->lcd_mosaic = r4 * 0x101;
            scriptCtx2->unk30[5]++;
            if (scriptCtx2->unk30[5] > 15) {
                DmaCopy16(3, eBGDecompBuffer2+0xC0, BG_CHAR_ADDR(1), 0x9600);
                if (scriptCtx2->unk30[4]) {
                    ioRegs->lcd_bg3cnt |= 0x80;
                    DmaCopy16(3, gBG0MapBuffer, PLTT, 0x200);
                } else {
                    ioRegs->lcd_bg3cnt &= ~0x80;
                    DmaCopy16(3, gBG0MapBuffer, PLTT+0x40, 0x20);
                }
                scriptCtx2->unk30[5] = 14;
                scriptCtx->unk2F = 1;
            }
            break;
        case 1:
            r4 = scriptCtx2->unk30[5] * 0x11;
            ioRegs->lcd_mosaic = r4 * 0x101;
            if (scriptCtx2->unk30[5] > 0) {
                scriptCtx2->unk30[5]--;
            } else {
                scriptCtx->unk2F = 2;
            }
            break;
        case 2:
            scriptCtx2->flags &= ~0x40;
            scriptCtx2->unk2E = 0;
            scriptCtx2->scriptPtr += 4;
            op_proc_exit_iOS(scriptCtx);
            break;
        }
        break;
    case 10:
        sub_801D548(scriptCtx);
        break;
    case 11:
        ioRegs->lcd_bg0cnt = 0x3C03;
        ioRegs->lcd_bg3cnt = 0x3FC6;
        ioRegs->lcd_dispcnt |= 0x100;
        main->tilemapUpdateBits |= 1;
        if (scriptCtx->unk2F == 0) {
            ioRegs->lcd_bldcnt = 0x4C9;
            ioRegs->lcd_bldy = 0x10;
        } else {
            ioRegs->lcd_bldcnt = 0x489;
            ioRegs->lcd_bldy = 0x10;
            *(u32*)&REG_BLDCNT = gIORegisters.lcd_bldcnt;
            *(u32*)&REG_DISPCNT = gIORegisters.lcd_dispcnt;
            *(u16*)&REG_BLDY = gIORegisters.lcd_bldy;
        }
        src = gUnknown_081FFD28;
        dst = eBGDecompBuffer;
        LZ77UnCompWram(gUnknown_081FFD48, dst);
        DmaCopy16(3, src, PLTT+0x20, 0x20);
        src = eBGDecompBuffer;
        dst = (void*)VRAM+0x1000;
        DmaCopy16(3, src, dst, 0xC00);
        for(i = 0; i < 0x400; i++)
            gBG0MapBuffer[i] = 0x108B;
        for(i = 0; i < 8; i++) {
            for(j = 0; j < 12; j++) {
                gBG0MapBuffer[i * 32 + 8 + j] = j + ((i * 12) + 0x1080);
            }
        }
        op_proc_exit_iOS(scriptCtx);
        break;
    case 12:
        switch (scriptCtx->unk2F) {
        case 0:
            DestroyAnimation(FindAnimationFromAnimId(30));
            scriptCtx2->flags &= ~2;
            scriptCtx2->flags &= ~0x20;
            scriptCtx2->unk30[1] = scriptCtx2->unk46[0];
            ioRegs->lcd_bldy = 0;
            ioRegs->lcd_bldcnt = 0x1D42;
            ioRegs->lcd_bldalpha = 0x71F;
            main->blendMode = 0;
            main->tilemapUpdateBits &= ~1;
            ioRegs->lcd_dispcnt &= ~DISPCNT_BG0_ON;
            DmaFill16(3, 0, gBG0MapBuffer, 0x400);
            PlayAnimation(36);
            PlayAnimationAtCustomOrigin(35, 0x78, -0x30);
            PlayAnimationAtCustomOrigin(34, 0x78, -0x70);
            scriptCtx2->unk46[0] = 0;
            scriptCtx2->unk46[1] = 0;
            scriptCtx2->unk46[2] = 0;
            for(i = 0; i < 0x400; i++)
                gBG0MapBuffer[i] = 0x108B;
            ioRegs->lcd_dispcnt |= 0x100;
            main->tilemapUpdateBits |= 1;
            scriptCtx->unk2F = 1;
            break;
        case 1:
            if (++scriptCtx2->unk46[1] <= scriptCtx2->unk30[1]) {
                break;
            }
            scriptCtx2->unk46[1] = 0;
            scriptCtx2->unk46[2]++;
            if (scriptCtx2->unk46[2] > 1) {
                scriptCtx2->unk46[0]++;
                r4 = scriptCtx2->unk46[0] % 8;
                if (r4 == 0) {
                    for(i = 21; i != 0; i--) {
                        src = (void*)&gBG3MapBuffer[(i-1)*32];
                        dst = (void*)&gBG3MapBuffer[i*32];
                        DmaCopy16(3, src, dst, 0x40);
                    }
                }
                if (scriptCtx2->unk46[0] == 76) {
                    op_proc_exit_iOS(scriptCtx);
                }
                ioRegs->lcd_bg3vofs = 8 - r4;
                scriptCtx2->unk46[2] = 0;
            }
            anim = FindAnimationFromAnimId(36);
            if (anim != NULL) {
                anim->animationInfo.yOrigin++;
            }
            anim = FindAnimationFromAnimId(35);
            if (anim != NULL) {
                anim->animationInfo.yOrigin++;
            }
            anim = FindAnimationFromAnimId(34);
            if (anim != NULL) {
                anim->animationInfo.yOrigin++;
            }
            break;
        case 2:
            ioRegs->lcd_bg3vofs = 8;
            DmaFill16(3, 0, gBG0MapBuffer, 0x400);
            ioRegs->lcd_dispcnt &= ~DISPCNT_BG0_ON;
            main->tilemapUpdateBits &= ~1;
            DestroyAnimation(FindAnimationFromAnimId(30));
            DestroyAnimation(FindAnimationFromAnimId(34));
            DestroyAnimation(FindAnimationFromAnimId(35));
            DestroyAnimation(FindAnimationFromAnimId(36));
            ioRegs->lcd_bg3cnt = 0x3FC7;
            op_proc_exit_iOS(scriptCtx);
            break;
        case 3:
            ioRegs->lcd_dispcnt |= 0x100;
            main->tilemapUpdateBits |= 1;
            ioRegs->lcd_bldcnt = 0x489;
            ioRegs->lcd_bldy = 0x10;
            for(i = 0; i < 0x400; i++)
                gBG0MapBuffer[i] = 0x108B;
            DmaCopy16(3, gBG0MapBuffer, BG_SCREEN_ADDR(28), sizeof(gBG0MapBuffer));
            src = (void*)VRAM+0x1160;
            DmaFill16(3, 0x1111, src, TILE_SIZE_4BPP);
            *(u32*)&REG_DISPCNT = gIORegisters.lcd_dispcnt;
            *(u32*)&REG_BLDCNT = gIORegisters.lcd_bldcnt;
            *(u16*)&REG_BLDY = gIORegisters.lcd_bldy;
            op_proc_exit_iOS(scriptCtx);
            break;
        }
        break;
    case 13:
        if (scriptCtx->unk2F == 0) {
            u8 r5 = 6;
            main->shakeAmountX = (Random() & 0xF);
            main->shakeAmountX &= r5;
            main->shakeAmountY = (Random() & 0xF);
            main->shakeAmountY &= r5;
            main->gameStateFlags |= 1;
            scriptCtx2->unk1E |= 0x80;
        } else {
            main->shakeAmountX = 0;
            main->shakeAmountY = 0;
            main->gameStateFlags &= ~1;
            scriptCtx2->unk1E &= ~0x80;
            op_proc_exit_iOS(scriptCtx);
        }
        break;
    case 98:
        Demo_Proc_iOS(scriptCtx);
        break;
    case 99:
        break;
    case 0:
        op_proc_exit_iOS(scriptCtx);
        break;
    }
}

void sub_801D308(struct ScriptContext* scriptCtx)
{
    struct Main * main = &gMain;
    u8 * map = (u8*)gBG2MapBuffer;
    u16 i, j, k;
    u8 * src;

    main->tilemapUpdateBits &= ~1;
    gIORegisters.lcd_dispcnt &= ~DISPCNT_BG0_ON;
    gIORegisters.lcd_dispcnt &= ~DISPCNT_BG2_ON;
    gIORegisters.lcd_dispcnt &= ~DISPCNT_BG3_ON;
    REG_DISPCNT = gIORegisters.lcd_dispcnt;
    for(i = 0; i < 0x400; i++) {
        map[i] = 0;
    }
    DmaCopy16(3, gBG2MapBuffer, BG_SCREEN_ADDR(30), sizeof(gBG0MapBuffer));
    scriptCtx->unk30[0] = 1;
    scriptCtx->unk30[1] = 0;
    scriptCtx->unk30[2] = 0;
    scriptCtx->unk30[3] = 0;
    src = gUnknown_08200308;
    LZ77UnCompWram(src + 0x200, eBGDecompBuffer);
    DmaCopy16(3, eBGDecompBuffer, BG_CHAR_ADDR(1), 0x4000);
    DmaCopy16(3, src + 0x40, PLTT+0x40, 0x20);
    i = 0;
    for(j = 2; j < 18; j++) {
        for(k = 7; k < 15; k++) {
            (&map[j*32])[k] = i;
            i++;
        }
    }
    i = 0x80;
    for(j = 2; j < 18; j++) {
        for(k = 15; k < 23; k++) {
            (&map[j*32])[k] = i;
            i++;
        }
    }
    gIORegisters.lcd_dispcnt = 0x1741;
    gIORegisters.lcd_bg2cnt = 0x5E86;
    gIORegisters.lcd_bldcnt = 0x1542;
    gIORegisters.lcd_bldalpha = 0x71F;
    gIORegisters.lcd_bg2x = 0;
    gIORegisters.lcd_bg2y = 0;
    gIORegisters.lcd_bg2pa = 0;
    gIORegisters.lcd_bg2pb = 0;
    gIORegisters.lcd_bg2pc = 0;
    gIORegisters.lcd_bg2pd = 0;
    main->tilemapUpdateBits |= 4;
}

void sub_801D474(struct ScriptContext* scriptCtx)
{
    s32 pa;
    s32 pb;
    s32 pc;
    s32 pd;
    s32 x;
    s32 y;
    s32 temp_r4;
    u16 temp_r7;

    temp_r7 = scriptCtx->unk30[1] & 0xFFF;
    scriptCtx->unk30[2]++;
    if (scriptCtx->unk30[2] > scriptCtx->unk46[0]) {
        scriptCtx->unk30[1] += scriptCtx->unk46[2];
        scriptCtx->unk30[2] = 0;
        scriptCtx->unk30[3] += scriptCtx->unk46[1];
    }
    temp_r4 = scriptCtx->unk30[3] | 0x10000;
    pa = (sub_8006364(temp_r7) << 0x10) / temp_r4;
    pb = (sub_80063E4(temp_r7) << 0x10) / temp_r4;
    pc = ((-sub_80063E4(temp_r7)) << 0x10) / temp_r4;
    pd = (sub_8006364(temp_r7) << 0x10) / temp_r4;
    x = ((0 - (pa * 120)) - (pb * 80)) + (120 * 0x100);
    y = ((0 - (pc * 120)) - (pd * 80)) + (80 * 0x100);
    gIORegisters.lcd_bg2pa = pa;
    gIORegisters.lcd_bg2pb = pb;
    gIORegisters.lcd_bg2pc = pc;
    gIORegisters.lcd_bg2pd = pd;
    gIORegisters.lcd_bg2x = x;
    gIORegisters.lcd_bg2y = y;
}

void sub_801D548(struct ScriptContext *scriptCtx)
{
    struct IORegisters * ioRegs = &gIORegisters;
    struct ScriptContext * scriptCtx2 = &gScriptContext;
    struct AnimationListEntry *anim;
    u32 i;

    switch (scriptCtx->unk2F) {
    case 0:
        sub_801D784(110);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 1:
        sub_801D7A0(110);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 2:
        sub_801D784(111);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 3:
        sub_801D7A0(111);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 4:
        sub_801D784(112);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 5:
        sub_801D7A0(112);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 6:
        switch (scriptCtx2->unk30[0]) {
        case 0:
            anim = FindAnimationFromAnimId(111);
            anim->flags |= 0x80;
            ioRegs->lcd_bldalpha = 0xF;
            scriptCtx2->unk30[1] = 0;
            scriptCtx2->unk30[0] = 1;
            
        case 1:
            FadeOutObj_Unity(scriptCtx, 111);
            break;
        }
        break;
    case 7:
        switch (scriptCtx2->unk30[0]) {
        case 0:
            sub_801D784(0x70);
            anim = FindAnimationFromAnimId(0x70);
            anim->flags |= 0x80;
            ioRegs->lcd_bldalpha = 0xF00;
            scriptCtx2->unk30[1] = 0;
            scriptCtx2->unk30[0] = 1;
            
        case 1:
            FadeInObj_Unity(scriptCtx, 0x70);
            break;
        }
        break;
    case 8:
        switch (scriptCtx2->unk30[0]) {
        case 0:
            anim = FindAnimationFromAnimId(0x70);
            anim->flags |= 0x80;
            ioRegs->lcd_bldalpha = 0xF;
            scriptCtx2->unk30[1] = 0;
            scriptCtx2->unk30[0] = 1;
            
        case 1:
            FadeOutObj_Unity(scriptCtx, 0x70);
            break;
        }
        break;
    case 9:
        switch (scriptCtx2->unk30[0]) {
        case 0:
            anim = FindAnimationFromAnimId(0x6E);
            anim->flags |= 0x80;
            ioRegs->lcd_bldalpha = 0xF;
            scriptCtx2->unk30[1] = 0;
            scriptCtx2->unk30[0] = 1;
            
        case 1:
            FadeOutObj_Unity(scriptCtx, 0x6E);
            break;
        }
        break;
    case 10:
        switch (scriptCtx2->unk30[0]) {
        case 0:
            sub_801D784(0x71);
            anim = FindAnimationFromAnimId(0x71);
            anim->flags |= 0x80;
            ioRegs->lcd_bldalpha = 0xF00;
            scriptCtx2->unk30[1] = 0;
            scriptCtx2->unk30[0] = 1;
            break;
        case 1:
            FadeInObj_Unity(scriptCtx, 0x71);
            break;
        }
        break;
    case 11:
        sub_801D784(114);
        op_proc_exit_iOS(scriptCtx);
        break;
    case 12:
        switch (scriptCtx2->unk30[0]) {
        case 0:
            sub_801D784(114);
            anim = FindAnimationFromAnimId(114);
            anim->flags |= 0x80;
            ioRegs->lcd_bldalpha = 0xF00;
            scriptCtx2->unk30[1] = 0;
            scriptCtx2->unk30[0] = 1;
            
        case 1:
            FadeInObj_Unity(scriptCtx, 114);
            break;
        }
        break;
    case 13:
        for(i = 0; i < 6; i++) {    
            anim = FindAnimationFromAnimId(i + 110);
            if (anim != NULL) {
                DestroyAnimation(anim);
            }
        }
        op_proc_exit_iOS(scriptCtx);
        break;
    }
}