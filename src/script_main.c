#include "global.h"
#include "script.h"

extern void (*gUnknown_0814E338[])(struct ScriptContext *);

void sub_8016F74(void) {
    struct ScriptContext * context = &gScriptContext;
    gUnknown_0814E338[context->unk2C](context);
}

void sub_8016F98(struct ScriptContext * scriptCtx) {
    scriptCtx->unk30[7] = 0;
    scriptCtx->unk30[6] = 0;
    scriptCtx->unk30[5] = 0;
    scriptCtx->unk30[4] = 0;
    scriptCtx->unk30[3] = 0;
    scriptCtx->unk30[2] = 0;
    scriptCtx->unk30[1] = 0;
    scriptCtx->unk30[0] = 0;
    scriptCtx->unk2D = 99;
}

struct AnimationListEntry * sub_8016FB4(void) {
    u32 dahliaThing[] = { // TODO: give this a good name please
        0x74,
        0x75,
        0x76,
        0x77,
        0x78,
        0x79,
        0x7A,
        0x7B,
        0x7C,
        0x7D,
        0x7E,
        0x7F,
        0x80,
        0x81,
        0x82,
        0xFF,
    };
    u32 i;
    for(i = 0; dahliaThing[i] != 0xFF; i++) {
        struct AnimationListEntry * anim = FindAnimationFromAnimId(dahliaThing[i]);
        if(anim)
            return anim;
    }
    return NULL;
}