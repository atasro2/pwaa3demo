#ifndef GUARD_DECLARATIONS_H //TODO: get rid of this file when it's possible to move everything to its own header
#define GUARD_DECLARATIONS_H

extern struct Struct30070E0 gUnknown_030070E0;

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

void RunScriptContext(void);
void sub_801DF10(struct Struct30070E0 *);
void nullsub_6(u32, u32, u32, u32);

#endif//GUARD_DECLARATIONS_H