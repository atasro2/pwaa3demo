#include "global.h"
#include "background.h"
#include "ewram.h"
#include "script.h"
#include "utils.h"
#include "save.h"
#include "sound.h"
#include "investigation.h"
#include "graphics.h"
#include "constants/songs.h"
#include "constants/process.h"
#include "constants/oam_allocations.h"

void sub_80067A8(struct Main * main) {
	struct OamAttrs * oam;
	if(main->selectedButton == 0)
	{
		oam = &gOamObjects[OAM_IDX_TITLE_SCREEN_OPTIONS];
		oam->attr2 = SPRITE_ATTR2(0x20, 1, gInvestigation.pointerFrame);
		oam++;
		oam->attr2 = SPRITE_ATTR2(0x28, 1, gInvestigation.pointerFrame);
		oam++;
		if(main->saveContinueFlags & 0xF0)
		{
			oam->attr2 = SPRITE_ATTR2(0x30, 0, 5);
			oam++;
			oam->attr2 = SPRITE_ATTR2(0x38, 0, 5);
		}
	}
	else
	{
		oam = &gOamObjects[OAM_IDX_TITLE_SCREEN_OPTIONS];
		oam->attr2 = SPRITE_ATTR2(0x20, 1, 5);
		oam++;
		oam->attr2 = SPRITE_ATTR2(0x28, 1, 5);
		oam++;
		if(main->saveContinueFlags & 0xF0)
		{
			do {
				oam->attr2 = SPRITE_ATTR2(0x30, 0, gInvestigation.pointerFrame);
				oam++;
				oam->attr2 = SPRITE_ATTR2(0x38, 0, gInvestigation.pointerFrame);
			} while(0);
		}
	}
}

void sub_8006830(struct Main * main) {
	struct OamAttrs * oam;
	struct IORegisters *ioRegsp = &gIORegisters;
	
	DmaCopy16(3, gPalNewGameContinue, OBJ_PLTT + 0x40, 0xC0);
	DmaCopy16(3, gGfxNewGameContinue, OBJ_VRAM0 + 0x400, 0x400);
	oam = &gOamObjects[OAM_IDX_TITLE_SCREEN_OPTIONS];
	oam->attr0 = SPRITE_ATTR0(112, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
	oam->attr1 = SPRITE_ATTR1_NONAFFINE(88, FALSE, FALSE, 2);
	oam->attr2 = SPRITE_ATTR2(0x20, 1, 2);
	oam++;
	oam->attr0 = SPRITE_ATTR0(112, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
	oam->attr1 = SPRITE_ATTR1_NONAFFINE(120, FALSE, FALSE, 2);
	oam->attr2 = SPRITE_ATTR2(0x28, 1, 2);
	oam++;
	if(main->saveContinueFlags & 0xF0)
	{
		oam->attr0 = SPRITE_ATTR0(132, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
		oam->attr1 = SPRITE_ATTR1_NONAFFINE(88, FALSE, FALSE, 2);
		oam->attr2 = SPRITE_ATTR2(0x30, 0, 2);
		oam++;
		oam->attr0 = SPRITE_ATTR0(132, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
		oam->attr1 = SPRITE_ATTR1_NONAFFINE(120, FALSE, FALSE, 2);
		oam->attr2 = SPRITE_ATTR2(0x38, 0, 2);
	}
	ioRegsp->lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;
	gInvestigation.pointerFrameCounter = 0;
	gInvestigation.pointerFrame = 2;
	main->selectedButton = 0;
	if(main->saveContinueFlags & 0xF0)
		main->selectedButton = 1;
	main->unk260 |= 4;
	main->tilemapUpdateBits = 9;
	sub_80067A8(main);
}

void CapcomLogoProcess(struct Main *main)
{
    struct IORegisters *ioRegsp = &gIORegisters;
	void * src;
	void * dst;
	u32 i;
    switch (main->process[GAME_PROCESS_STATE])
    {
    case 0:
        ioRegsp->lcd_bg0cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(28) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        ioRegsp->lcd_bg1cnt = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(29) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        ioRegsp->lcd_bg2cnt = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(30) | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        ioRegsp->lcd_bg3cnt = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_WRAP | BGCNT_TXT256x256;
        src = gUnknown_0820E31C;
		dst = eScriptHeap; // ! what the fuck man
		LZ77UnCompWram(gUnknown_0820E33C, dst);
		DmaCopy16(3, src, PLTT, 0x20);
		for(i = 0; i < 0x400; i++)
			gBG3MapBuffer[i] = 0;
		for(i = 0; i < 0x10; i++) {
			gBG3MapBuffer[0x107 + i] = i + 1;
			gBG3MapBuffer[0x127 + i] = i + 0x11;
			gBG3MapBuffer[0x147 + i] = i + 0x21;
			gBG3MapBuffer[0x167 + i] = i + 0x31;
		}
		gIORegisters.lcd_bg2hofs = 0;
		gIORegisters.lcd_bg2vofs = 8;
		src = eScriptHeap;
		dst = VRAM + 0x4020; //TODO: i was lazy. there is a macro for tile blocks
		DmaCopy16(3, src, dst, 0x800);
		DmaFill16(3, 0, VRAM + 0x4000, 0x20); // clear first tile in block 1
        ioRegsp->lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_BG3_ON;
        ioRegsp->lcd_bldy = 0x10;
        StartHardwareBlend(1, 1, 1, 0x1F);
        main->tilemapUpdateBits = 8;
        main->process[GAME_PROCESS_STATE]++;
        main->process[GAME_PROCESS_VAR2] = 120; // 2 second timer for showing Capcom logo
        break;
    case 1:
        if (main->blendMode == 0)
        {
            if (main->process[GAME_PROCESS_VAR2] != 0)
            {
                main->process[GAME_PROCESS_VAR2]--;
                break;
            }
            StartHardwareBlend(2, 1, 1, 0x1F);
            main->tilemapUpdateBits = 0;
            main->process[GAME_PROCESS_STATE]++;
        }
        break;
    case 2:
        if (main->blendMode == 0)
        {
            SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 0, 0, 0, main);
        }
        break;
    default:
        break;
    }
}

void TitleScreenProcess(struct Main *main)
{
    u32 temp;
    struct IORegisters *ioRegsp = &gIORegisters;
    struct OamAttrs * oam;
    switch (main->process[GAME_PROCESS_STATE])
    {
    case 0:
        ResetGameState();
        LoadSaveData();
        SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 1, 0, 0, main);
        break;
    case 1:
		DecompressBackgroundIntoBuffer(0x14);
		CopyBGDataToVram(0x14);
		sub_8006830(main);
        StartHardwareBlend(1, 1, 1, 0x1F);
        SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 2, 0, 0, main);
        break;
    case 2:
        if(gJoypad.pressedKeys & (A_BUTTON | START_BUTTON))
        {
            PlaySE(SE010_GAVEL_SLAM);
            gScriptContext.soundCueSkip = 0; // ! Why not use GAME_PROCESS_VAR2 you *screams every profanity ever*
            SET_PROCESS_PTR(TITLE_SCREEN_PROCESS, 3, 0, 0, main);
        }
        else if(main->saveContinueFlags & 0xF0 && gJoypad.pressedKeys & (DPAD_DOWN | DPAD_UP))
        {
            gInvestigation.pointerFrameCounter = 0;
            gInvestigation.pointerFrame = 2;
            main->selectedButton ^= 1; // selected button on title screen
            PlaySE(SE000_MENU_CHANGE);
        }
        if(gInvestigation.pointerFrame == 2) {
            gInvestigation.pointerFrameCounter++;
            if(gInvestigation.pointerFrameCounter >= 20) {
                gInvestigation.pointerFrameCounter = 0;
                gInvestigation.pointerFrame++;
            }
        } else {
            gInvestigation.pointerFrameCounter++;
            if(gInvestigation.pointerFrameCounter >= 6) {
                gInvestigation.pointerFrameCounter = 0;
                gInvestigation.pointerFrame++;
            }
        }
        if(gInvestigation.pointerFrame > 6)
            gInvestigation.pointerFrame = 2;
		sub_80067A8(main);
        break;
    case 3:
        main->process[GAME_PROCESS_VAR2]++;
        if(main->process[GAME_PROCESS_VAR2] >= 40)
        {
            if(main->selectedButton == 0)
            {
                SET_PROCESS_PTR(EPISODE_SELECT_PROCESS, 0, 0, 0, main);
            }
            else
            {
                SET_PROCESS_PTR(CONTINUE_SAVE_PROCESS, 0, 0, 0, main);
            }
        }
        if(main->selectedButton == 0)
        {
            main->process[GAME_PROCESS_VAR1]++;
            if(main->process[GAME_PROCESS_VAR1] > 4)
            {
                oam = &gOamObjects[OAM_IDX_TITLE_SCREEN_OPTIONS];
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                oam->attr2 = SPRITE_ATTR2(0x20, 0, 2);
                oam++;
                oam->attr0 = SPRITE_ATTR0_CLEAR;
                oam->attr2 = SPRITE_ATTR2(0x28, 0, 2);
                oam++;
                if(main->process[GAME_PROCESS_VAR1] > 8)
                {
                    main->process[GAME_PROCESS_VAR1] = 0;
                }
            }
            else
            {
                oam = &gOamObjects[OAM_IDX_TITLE_SCREEN_OPTIONS];
                oam->attr0 = SPRITE_ATTR0(112, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
                oam->attr2 = SPRITE_ATTR2(0x20, 0, 2);
                oam++;
                oam->attr0 = SPRITE_ATTR0(112, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
                oam->attr2 = SPRITE_ATTR2(0x28, 0, 2);
                oam++;
            }
            if(main->saveContinueFlags & 0xF0)
            {
                if((oam->attr0 & 0xFF) <= DISPLAY_WIDTH - 16)
                {
                    oam->attr0 += gScriptContext.soundCueSkip;
                }
                oam++;
                if((oam->attr0 & 0xFF) <= DISPLAY_WIDTH - 16)
                {
                    oam->attr0 += gScriptContext.soundCueSkip;
                }
            }
        }
        else
        {
            oam = &gOamObjects[OAM_IDX_TITLE_SCREEN_OPTIONS];
            if((oam->attr0 & 0xFF) <= DISPLAY_WIDTH - 16)
            {
                oam->attr0 += gScriptContext.soundCueSkip;
            }
            oam++;
            if((oam->attr0 & 0xFF) <= DISPLAY_WIDTH - 16)
            {
                oam->attr0 += gScriptContext.soundCueSkip;
            }
            oam++;
            if(main->saveContinueFlags & 0xF0)
            {
                main->process[GAME_PROCESS_VAR1]++;
                if(main->process[GAME_PROCESS_VAR1] > 4)
                {
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                    oam->attr2 = SPRITE_ATTR2(0x30, 0, 2);
                    oam++;
                    oam->attr0 = SPRITE_ATTR0_CLEAR;
                    oam->attr2 = SPRITE_ATTR2(0x38, 0, 2);
                    oam++;
                    if(main->process[GAME_PROCESS_VAR1] > 8)
                    {
                        main->process[GAME_PROCESS_VAR1] = 0;
                    }
                }
                else
                {
                    oam->attr0 = SPRITE_ATTR0(132, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
                    oam->attr2 = SPRITE_ATTR2(0x30, 0, 2);
                    oam++;
                    oam->attr0 = SPRITE_ATTR0(132, ST_OAM_AFFINE_OFF, ST_OAM_OBJ_NORMAL, FALSE, ST_OAM_4BPP, ST_OAM_H_RECTANGLE);
                    oam->attr2 = SPRITE_ATTR2(0x38, 0, 2);
                    oam++;
                }
            }
        }
        gScriptContext.soundCueSkip++;
        break;
    default:
        break;
    }
}
