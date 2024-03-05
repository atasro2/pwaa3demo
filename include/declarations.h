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

void sub_8006918(struct Main *);
void sub_8006AA4(struct Main *);
void sub_8006CE8(struct Main *);
void sub_800A434(struct Main *);
void sub_800BFA4(struct Main *);
void sub_800A950(struct Main *);
void sub_800AB64(struct Main *);
void sub_800EA6C(struct Main *);
void sub_800EACC(struct Main *);
void sub_800B208(struct Main *);
void sub_80076F8(struct Main *);
void sub_8008708(struct Main *);
void sub_8008D7C(struct Main *);
void sub_800985C(struct Main *);
void sub_800730C(struct Main *);
void sub_80018F8(struct Main *);

void ProcessHPBar(void);
void VBlankIntr();
void HBlankIntr();
void IntrDummy();


// stubbed out stuff
void sub_8006470(u32, u32, u32);

void RunScriptContext(void);
void sub_801DF10(struct ScriptContext *);
void nullsub_6(u32, u32, u32, u32);
struct AnimationListEntry * sub_8016FB4(void);

#endif//GUARD_DECLARATIONS_H