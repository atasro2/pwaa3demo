#ifndef GUARD_HP_BAR
#define GUARD_HP_BAR

void SetOrQueueHPBarState(u32);
void ResetHPBar(void);
void ResetHPBarHealthToMax(void);
bool32 IsHPBarAnimating(void);
bool32 sub_8016ED8(void);

#endif//GUARD_HP_BAR