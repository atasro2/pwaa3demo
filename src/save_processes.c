#include "global.h"
#include "save.h"
#include "agb_sram.h"
#include "graphics.h"
#include "sound.h"
#include "constants/process.h"
#include "constants/songs.h"
#include "constants/oam_allocations.h"

u32 SaveGameData()
{
    u32 mult;
    u32 size;
    gSaveDataBuffer.main.saveContinueFlags |= 0xF0;
    DmaCopy16(3, gSaveVersion, gSaveDataBuffer.saveDataVer, sizeof(gSaveVersion));
    CalculateSaveChecksum();
    mult = 0;
    if(gJoypad.heldKeys & L_BUTTON) {
        mult = 1;
    }
    else if(gJoypad.heldKeys & R_BUTTON) {
        mult = 2;
    }
    // this needs to be here, the size has to be loaded first...
    size = sizeof(gSaveDataBuffer);
    return WriteSramEx((void*)&gSaveDataBuffer, SRAM_START + size * mult, size);
}

u32 LoadSaveData()
{
    u32 i;
    u32 mult;
    char * sramVer;
    mult = 0;
    if(gJoypad.heldKeys & L_BUTTON) {
        mult = 1;
    }
    else if(gJoypad.heldKeys & R_BUTTON) {
        mult = 2;
    }
    ReadSram(SRAM_START + sizeof(gSaveDataBuffer) * mult, (void*)&gSaveDataBuffer, sizeof(gSaveDataBuffer));
    sramVer = gSaveDataBuffer.saveDataVer;
    for(i = 0; i < 0x30; i++)
    {
        if(gSaveVersion[i] != *sramVer)
        {
            gMain.saveContinueFlags = 0;
            return 2;
        }
        sramVer++;
    }
    gMain.caseEnabledFlags = gSaveDataBuffer.main.caseEnabledFlags;
    if(CheckSaveChecksum() == FALSE)
    {
        gMain.saveContinueFlags = 0;
        return 1;
    }
    gMain.saveContinueFlags = 0xF0;
    return 0;
}

void CalculateSaveChecksum()
{
    u8 *saveData;
    u32 magic;
    u32 size;
    gSaveDataBuffer.magic = 0;
    magic = 0;
    size = sizeof(gSaveDataBuffer);
    saveData = (void *) (&gSaveDataBuffer.main);
    while (saveData < (((u8 *) (&gSaveDataBuffer)) + size))
    {
        magic += saveData[0];
        saveData += 4;
    }
    magic += 2343;
    gSaveDataBuffer.magic = magic;
}

bool32 CheckSaveChecksum()
{
    u32 magic = 0;
    u8 * saveData = (u8 *)&gSaveDataBuffer.main;
    while(saveData < (u8 *)&gSaveDataBuffer+sizeof(gSaveDataBuffer))
    {
        magic += *saveData;
        saveData += 4;
    }
    magic += 2343;
    if(magic == gSaveDataBuffer.magic)
    {
        return TRUE;
    }
    return FALSE;
}
