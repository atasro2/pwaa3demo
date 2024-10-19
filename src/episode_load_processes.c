#include "global.h"
#include "background.h"
#include "ewram.h"
#include "animation.h"
#include "sound.h"
// #include "agb_sram.h"
// #include "save.h"
#include "graphics.h"
// #include "constants/script.h"
#include "constants/songs.h"
// #include "constants/process.h"
#include "constants/oam_allocations.h"

void EpisodeInit(struct Main * main)
{
    main->advanceScriptContext = FALSE;
    main->showTextboxCharacters = FALSE;
    StartHardwareBlend(2, 0, 1, 0x1F);
    main->process[GAME_PROCESS_STATE]++;
}

void EpisodeLoadGfx(struct Main * main)
{
    struct OamAttrs * oam;
    u32 i, j;
    u8 oldunk3D;

    gMain.unk258 = 0;
    oldunk3D = main->unk3D;
    main->unk3D |= 0x40;
    DecompressBackgroundIntoBuffer(6);
    CopyBGDataToVram(6);
    main->unk3D = oldunk3D;
    gIORegisters.lcd_dispcnt = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON; 
    main->tilemapUpdateBits = 0xA;
    oam = gOamObjects;
    for(i = 0; i < MAX_OAM_OBJ_COUNT; i++)
        oam++->attr0 = SPRITE_ATTR0_CLEAR;
    ResetAnimationSystem();
    DmaCopy16(3, eBGDecompBuffer, OBJ_VRAM0+0x3400, 0x2800);
    DmaCopy16(3, gPalChoiceSelected, OBJ_PLTT+0x120, 0x40);
    DmaCopy16(3, gGfxSaveGameTiles, VRAM, 0x1000);
    sub_80051CC(2);
    main->xPosCounter = 0;
    PlaySE(SE007_MENU_OPEN_SUBMENU);
    StartHardwareBlend(1, 0, 1, 0x1F);
    main->process[GAME_PROCESS_STATE]++;
}
