#ifndef GUARD_HP_BAR_H
#define GUARD_HP_BAR_H

void SetOrQueueHPBarState(u32);
void ResetHPBar(void);
void ResetHPBarHealthToMax(void);
bool32 IsHPBarAnimating(void);
bool32 sub_8016ED8(void);

extern u16 gUnknown_080266E8[];

#endif//GUARD_HP_BAR_H