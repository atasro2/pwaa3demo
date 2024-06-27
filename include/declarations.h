#ifndef GUARD_DECLARATIONS_H //TODO: get rid of this file when it's possible to move everything to its own header
#define GUARD_DECLARATIONS_H

void DoGameProcess(void);
void UpdateHardwareBlend(void);
void sub_80139F4(void);
void nullsub_7(void);
void sub_8013B84(u32);
void sub_800482C(u32);
void sub_80049A0(u32);
void nullsub_8(u32, u32);
void sub_801FFBC(void);
void sub_800156C(void);
void sub_80015CC(void);
void sub_80015E8(void);

void CapcomLogoProcess(struct Main *);
void TitleScreenProcess(struct Main *);
void GameOverScreenProcess(struct Main *);
void CourtProcess(struct Main *);
void InvestigationProcess(struct Main *);
void TestimonyProcess(struct Main *);
void QuestioningProcess(struct Main *);
void CourtRecordProcess(struct Main *);
void EvidenceAddedProcess(struct Main *);
void VerdictProcess(struct Main *);
void SaveGameProcess(struct Main *);
void EpisodeClearedProcess(struct Main *);
void SelectEpisodeProcess(struct Main *);
void ContinueSaveProcess(struct Main *);
void ClearSaveProcess(struct Main *);
void sub_80018F8(struct Main *);

void ProcessHPBar(void);
void VBlankIntr();
void HBlankIntr();
void IntrDummy();

extern void LoadAndAdjustBGPaletteByMode(u16,u16,u16);
extern void LoadAndAdjustCurrentAnimation01PaletteByMode(u16,u16);
extern void LoadAndAdjustCounselWitnessBenchPaletteByMode(u16,u16,u16);
extern void LoadAndAdjustAnimation10PaletteByMode(u16,u16);

extern void sub_8005A00(u16,u16,u16);
extern void sub_8005BE8(u16,u16);
extern void sub_8005C88(u16,u16,u16);
extern void nullsub_3(u16,u16);


// stubbed out stuff
void sub_8006470(u32, u32, u32);

void RunScriptContext(void);
void sub_801DF10(struct ScriptContext *);
void nullsub_6(u32, u32, u32, u32);
struct AnimationListEntry * sub_8016FB4(void);

#endif//GUARD_DECLARATIONS_H