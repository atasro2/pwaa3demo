#include "global.h"
#include "constants/oam_allocations.h"

void UpdateScrollPromptSpriteSignalDetector(bool32 show) { // copy of UpdateScrollPromptSprite
    struct OamAttrs * oam = &gOamObjects[OAM_IDX_BUTTON_PROMPTS+3];
    oam->attr0 = SPRITE_ATTR0_CLEAR;
    if(show) {
        if(gMain.Bg256_pos_x == 0) {
            oam->attr0 = 0x4020;
            oam->attr1 = 0x80D0;
            oam->attr2 = 0x7188;
        } else if(gMain.Bg256_pos_x == 240 || gMain.Bg256_pos_x == 120) {
            oam->attr0 = 0x4020;
            oam->attr1 = 0x8000;
            oam->attr2 = 0x7180;
        }
    }
}
