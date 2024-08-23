#ifndef GUARD_STRUCTS_H //TODO: get rid of this file and move everything to the place they should be in
#define GUARD_STRUCTS_H

struct Struct3006390 { // unity class is different names are interpreted
    u8 unk0;
    u8 fill1[0x3];
    s32 unk4; // unity: pos_x
    s32 unk8; // unity: pos_y
    s32 unkC; // unity: speed_x
    s32 unk10; // unity: speed_y
    s32 unk14; // unity: yuragi_cnt
    s32 unk18; // unity: yuragi_add
    struct AnimationListEntry * anim;
    u16 fill20;
    s16 unk22; // unity: cnt
};

#endif//GUARD_STRUCTS_H