#include "global.h"
#include "main.h"
#include "utils.h"
#include "animation.h"
#include "sound.h"
#include "background.h"

void MoveSpritesToOAM(void)
{
    DmaCopy16(3, gOamObjects, OAM, sizeof(gOamObjects));
}
