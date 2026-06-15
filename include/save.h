#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

#include "main.h"
#include "script.h"
#include "court_record.h"
#include "background.h"
#include "court.h"
#include "investigation.h"
#include "animation.h"

struct SaveData
{
    /* +0x0000 */ char saveDataVer[0x30];
    /* +0x0030 */ u32 magic;
    /* +0x0034 */ struct Main main;
    /* +0x0308 */ struct IORegisters ioRegs;
    /* +0x035C */ struct ScriptContext scriptCtx;
    /* +0x03F8 */ struct Struct30070B0 struct30070B0;
    /* +0x041C */ struct CourtRecord courtRecord;
    /* +0x0478 */ struct CourtScroll courtScroll;
    /* +0x0488 */ struct TestimonyStruct testimony;
    /* +0x???? */ struct InvestigationStruct investigation;
    /* +0x???? */ struct ExaminationData examinationData[24];
    /* +0x???? */ struct TalkData talkData[32];
    /* +0x???? */ u16 loadedPsycheLockedTalkSections[20];
    /* +0x???? */ struct MapMarker mapMarker[8];
    /* +0x???? */ struct OamAttrs oam[128];
    /* +0x???? */ struct TextBoxCharacter textBoxCharacters[0x40];
    /* +0x10D4 */ u16 bg0Map[0x400];
    /* +0x18D4 */ u16 bg1Map[0x400];
    /* +0x20D4 */ u16 bg2Map[0x400];
    /* +0x28D4 */ struct AnimationBackupStruct backupAnimations[0x20];
};

extern EWRAM_DATA struct SaveData gSaveDataBuffer;

extern const char gSaveVersion[0x32];

u32 SaveGameData();
u32 LoadSaveData();
void CalculateSaveChecksum();
bool32 CheckSaveChecksum();
void sub_8007610(u8);

void nullsub_11(u32);

void SaveGameInit1(struct Main *);
void SaveGameInit2(struct Main *);
void SaveGameInitButtons(struct Main *);
void SaveGameWaitForInput(struct Main *);
void SaveGameExitSaveScreen(struct Main *);
void SaveGame5(struct Main *);
void SaveGame6(struct Main *);
void SaveGame7(struct Main *);

#endif//GUARD_SAVE_H