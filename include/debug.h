#ifndef GUARD_DEBUG_H
#define GUARD_DEBUG_H

#include "animation.h"
#include "main.h"

struct DebugContext {
    u8 currentSubmenu;
    u8 currentSubMenuProcess;
    u8 unk2;
    u8 unk3;
    u8 process[4];
    u16 bak_lcd_dispcnt;
    u16 bak_lcd_win0h;
    u16 bak_lcd_win0v;
    u16 bak_lcd_winin;
    u16 bak_lcd_winout;
    u16 unk12; // padding?
    u16 bak_lcd_bg3hofs;
    u16 bak_lcd_bg3vofs;
    u8 unk18;
    u8 unk19;
    u8 fill1A[0x2];
    /* +0x1C */ struct AnimationListEntry anim;
    u8 bak_showTextboxCharacters;
    u8 bak_advanceScriptContext;
    u8 fill62[0x2];
    /* +0x64 */ u16 map[0x400];
    /* +0x864 */ struct OamAttrs oam[128];
    /* +0xC64 */ union {
        struct VramDebug {
            u16 unk00;
            u16 unk02;
            u8 unk04;
            u8 unk05;
            u8 unk06;
            s8 unk07;
            u16 unk08;
        } vram;
        struct FlagDebug {
            s16 unk00;
            s8 unk02;
        } flag;
        struct ScenarioDebug {
            s8 unk00;
        } scenario;
        struct SoundDebug {
            s16 unk0;
            s16 unk2;
            s16 unk4;
            s8 unk6;
            s16 unk8;
            s16 unkA;
            s16 unkC;
            s16 unkE;
        } sound;
        struct CourtScrollDebug {
            struct AnimationListEntry anim;
            struct AnimationListEntry * animPtr;
            s8 unk48;
            s8 unk49;
        } courtScroll;
    } menu;
};

void DebugPrintClearRect(u16,u16,u16,u16);

extern char gUnknown_0802813C[];

#endif//GUARD_DEBUG_H