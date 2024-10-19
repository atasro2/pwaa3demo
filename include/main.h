#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#define SOUND_FLAG_DISABLE_SE (1 << 0)
#define SOUND_FLAG_DISABLE_BGM (1 << 1)
#define SOUND_FLAG_DISABLE_CUE (1 << 2)

#include "psyche_lock.h"

struct Joypad
{
    /* +0x00 */ u16 heldKeys;
    /* +0x02 */ u16 pressedKeys;
    /* +0x04 */ u16 previousHeldKeys;
    /* +0x06 */ u16 previousPressedKeys;
    /* +0x08 */ u16 activeTimedKeys;
    /* +0x0A */ u16 timedKeys;
    /* +0x0C */ u16 timedHoldDelay;
    /* +0x0E */ u16 timedHoldTimer;
};

struct Main
{
    /* +0x000 */ u32 frameCounter;
    /* +0x004 */ u32 unk4;
    /* +0x008 */ u8 process[0x4];
    /* +0x00C */ u8 processCopy[0x4];
    /* +0x010 */ u8 vblankWaitCounter;
    /* +0x011 */ u8 vblankWaitAmount;
    /* +0x012 */ s8 shakeAmountX; // unity: Quake_x
    /* +0x013 */ s8 shakeAmountY; // unity: Quake_y
    /* +0x014 */ u16 shakeTimer; // unity: Quake_timer
    /* +0x016 */ u8 shakeIntensity; // unity: Quake_power
    /* +0x017 */ u8 selectedButton; // unity: Cursol
    /* +0x018 */ bool8 advanceScriptContext; // unity: Mess_move_flag
    /* +0x019 */ bool8 showTextboxCharacters; // unity: message_active_window
    /* +0x01A */ u8 tilemapUpdateBits;
    /* +0x01B */ u8 saveContinueFlags;
    /* +0x01C */ u8 fill1C[0x4];
    /* +0x020 */ s16 bgmFadeVolume;
    /* +0x022 */ u8 fill22[0x2];
    /* +0x024 */ u8 soundStatus;
    /* +0x025 */ u8 fill25[0x3];
    /* +0x028 */ u16 currentPlayingBgm;
    /* +0x02A */ u8 allocatedObjPltts; // unity: Obj_plt_use_flag
    /* +0x02B */ u8 animationFlags; // unity: Obj_flag
    /* +0x02C */ s16 bgmFadeAmount;
    /* +0x02E */ s16 bgmVolume;
    /* +0x030 */ u16 rngSeed; // unity: Random_seed
    /* +0x032 */ u8 fill32[0x2];
    /* +0x034 */ u16 currentBG;
    /* +0x036 */ u16 currentDisplayedBG;
    /* +0x038 */ s16 previousBG;
    /* +0x03A */ u8 fill3A[2];
    /* +0x03C */ s8 currentBgStripe;
    /* +0x03D */ u8 unk3D;
    /* +0x03E */ bool8 isBGScrolling; // unity AA4: Bg256_scroll_flag
    /* +0x03F */ u8 Bg256_stop_line; // unity AA4: Bg256_stop_line
    /* +0x040 */ s16 Bg256_scroll_x; // unity AA4: Bg256_scroll_x
    /* +0x042 */ s16 Bg256_scroll_y; // unity AA4: Bg256_scroll_y
    /* +0x044 */ s16 Bg256_pos_x; // unity AA4: Bg256_pos_x
    /* +0x046 */ s16 Bg256_pos_y; // unity AA4: Bg256_pos_y
    /* +0x048 */ u16 unused48; // unity AA4: Bg256_add? unused but is background related 100%
    /* +0x04A */ s16 Bg256_dir; // unity AA4: Bg256_dir
    /* +0x04C */ s8 horizontolBGScrollSpeed; // unity AA4: Bg256_scroll_speed_x
    /* +0x04D */ s8 verticalBGScrollSpeed; // unity AA4: Bg256_scroll_speed_y
    /* +0x04E */ s8 Bg256_next_line; // unity AA4: Bg256_next_line
    /* +0x04F */ s8 Bg256_buff_pos; // unity AA4: Bg256_buff_pos
    /* +0x050 */ u8 fill50[0x38];
    /* +0x088 */ u16 blendTarget; // unity: Fade_object
    /* +0x08A */ u16 blendMode; // unity: Fade_status
    /* +0x08C */ u16 blendCounter; // unity: Fade_timer
    /* +0x08E */ u8 blendDelay; // unity: fade_time
    /* +0x08F */ u8 blendDeltaY; // unity: fade_speed
    /* +0x090 */ u16 effectType;
    /* +0x092 */ u8 fill92[0x2];
    /* +0x094 */ u16 effectCounter;
    /* +0x096 */ u8 effectDelay;
    /* +0x097 */ u8 effectIntensity;
    /* +0x098 */ u8 fill98[0x6];
    /* +0x09E */ u8 itemPlateAction;
    /* +0x0A0 */ u8 fillA0[0x2];
    /* +0x0A2 */ u16 xPosCounter; // used in episode selection menu
    /* +0x0A4 */ u8 fillA4[0x1C];
    /* +0x0C0 */ u8 currentRoomId;
    /* +0x0C1 */ u8 scenarioIdx;
    /* +0x0C2 */ u8 caseEnabledFlags;
    /* +0x0C3 */ u8 fillC3[1];
    /* +0x0C4 */ u16 talkingAnimationOffset; // unity: Def_talk_foa
    /* +0x0C6 */ u16 idleAnimationOffset; // unity: Def_wait_foa
    /* +0x0C8 */ u32 scriptFlags[8];
    /* +0x0E8 */ u32 gameStateFlags; // unity: status_flag matches debug menu
    /* +0x0EC */ u32 talkEndFlags[8]; // unity: talk_end_flag
    /* +0x10C */ u32 sectionReadFlags[8]; // script related, apollo's FW_Mess_flag??
    /* +0x12C */ u8 roomData[26][5]; // unity: Map_data //TODO: first size might be wrong
    /* +0x1B0 */ struct PsycheLockData psycheLockData[4];
    /* +0x250 */ u8 fill250[0x2];
    /* +0x252 */ u16 psycheLockStopPresentButtonsY;
    /* +0x254 */ u8 psycheLockStopPresentButtonsState;
    /* +0x255 */ u8 psycheLockStopPresentButtonsSubstate;
    /* +0x256 */ u8 psycheLockStopPresentButtonsActive;
    /* +0x257 */ u8 unk257;
    /* +0x258 */ u8 unk258;
    /* +0x259 */ u8 fill259[0x3];
    /* +0x25C */ u32 soundFlags;
    /* +0x260 */ u32 unk260;
    /* +0x264 */ u8 fill264[0x5C];
    /* +0x2C0 */ u16 currentlyPlayingSfx;
    /* +0x2C2 */ u16 currentlyPlayingLoopedSfx;
    /* +0x2C4 */ u8 fill2C4[0x3];
    /* +0x2C7 */ u8 unk2C7;
    /* +0x2C8 */ u8 fill2C8[0x8];
    /* +0x2D0 */ u32 unk2D0;
}; /* size 0x2D4 */

struct IORegisters
{
    /* +0x00 */ u16 lcd_bg0cnt;
    /* +0x02 */ u16 lcd_bg1cnt;
    /* +0x04 */ u16 lcd_bg2cnt;
    /* +0x06 */ u16 lcd_bg3cnt;
    /* +0x08 */ u16 lcd_bg0hofs;
    /* +0x0A */ u16 lcd_bg0vofs;
    /* +0x0C */ u16 lcd_bg1hofs;
    /* +0x0E */ u16 lcd_bg1vofs;
    /* +0x10 */ u16 lcd_bg2hofs;
    /* +0x12 */ u16 lcd_bg2vofs;
    /* +0x14 */ u16 lcd_bg3hofs;
    /* +0x16 */ u16 lcd_bg3vofs;
    /* +0x18 */ u16 lcd_bg2pa;
    /* +0x1A */ u16 lcd_bg2pb;
    /* +0x1C */ u16 lcd_bg2pc;
    /* +0x1E */ u16 lcd_bg2pd;
    /* +0x20 */ u32 lcd_bg2x;
    /* +0x24 */ u32 lcd_bg2y;
    /* +0x28 */ u16 lcd_bg3pa;
    /* +0x2A */ u16 lcd_bg3pb;
    /* +0x2C */ u16 lcd_bg3pc;
    /* +0x2E */ u16 lcd_bg3pd;
    /* +0x30 */ u32 lcd_bg3x;
    /* +0x34 */ u32 lcd_bg3y;
    /* +0x38 */ u16 lcd_win0h;
    /* +0x3A */ u16 lcd_win1h;
    /* +0x3C */ u16 lcd_win0v;
    /* +0x3E */ u16 lcd_win1v;
    /* +0x40 */ u16 lcd_winin;
    /* +0x42 */ u16 lcd_winout;
    /* +0x44 */ u32 lcd_mosaic;
    /* +0x48 */ u16 lcd_bldcnt;
    /* +0x4A */ u16 lcd_dispcnt;
    /* +0x4C */ u16 lcd_bldalpha;
    /* +0x4E */ u16 lcd_bldy;
    /* +0x50 */ u16 iwp_ie;
    /* +0x52 */ u16 lcd_dispstat;
};

struct OamAttrs 
{
    /* +0x00 */ u16 attr0;
    /* +0x02 */ u16 attr1;
    /* +0x04 */ u16 attr2;
    /* +0x06 */ u16 attr3;
};

extern struct Joypad gJoypad;
extern struct Main gMain;
extern struct IORegisters gIORegisters;
extern struct OamAttrs gOamObjects[128];

#define GAME_PROCESS 0
#define GAME_PROCESS_STATE 1
#define GAME_PROCESS_VAR1 2
#define GAME_PROCESS_VAR2 3

#define SET_PROCESS_PTR(no_0, no_1, no_2, no_3, main) (*(u32*)main->process = ((no_0) | ((no_1) << 8) | ((no_2) << 16) | ((no_3) << 24)))
#define SET_PROCESS(no_0, no_1, no_2, no_3) (*(u32*)gMain.process = ((no_0) | ((no_1) << 8) | ((no_2) << 16) | ((no_3) << 24)))
#define SET_PROCESS_BACKUP_PTR(no_0, no_1, no_2, no_3, main) (*(u32*)main->processCopy = ((no_0) | ((no_1) << 8) | ((no_2) << 16) | ((no_3) << 24)))
#define BACKUP_PROCESS() (*(u32*)gMain.processCopy = *(u32*)gMain.process)
#define BACKUP_PROCESS_PTR(main) (*(u32*)main->processCopy = *(u32*)gMain.process)
#define RESTORE_PROCESS() (*(u32*)gMain.process = *(u32*)gMain.processCopy)
#define RESTORE_PROCESS_PTR(main) (*(u32*)gMain.process = *(u32*)main->processCopy)

void ClearRamAndInitGame(void);
void HideAllSprites(void);
void SetLCDIORegs(void);
void SetTimedKeysAndDelay(u32 keyBits, u32 delay);
u32 ReadKeysAndTestResetCombo(void);
void StartHardwareBlend(u32 mode, u32 delay, u32 deltaY, u32 target);
void InitCourtScroll(u8 *, u32, u32, u32);
void ResetGameState(void);
void sub_8000E78(u32, u32, u32);
void sub_8000EB4(u32, u32, u32);
#endif//GUARD_MAIN_H