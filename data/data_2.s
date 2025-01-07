	.section .data
    .align 2, 0

    .global gUnknown_0814DC64
gUnknown_0814DC64:
.4byte sub_80116B0
.4byte sub_8011714
.4byte sub_8011C08

    .global gUnknown_0814DC70
gUnknown_0814DC70:
.4byte sub_801438C
.4byte sub_801438C
.4byte sub_801438C
.4byte sub_801438C
.4byte sub_801438C
.4byte sub_801438C
.4byte sub_801438C
.4byte sub_801438C

    .global gUnknown_0814DC90
gUnknown_0814DC90:
.4byte sub_8014130
.4byte sub_8014220
.4byte sub_8013DC8
.4byte sub_8013E80
.4byte sub_8013F38
.4byte sub_801402C

    .global gDebugMovieTestStates
gDebugMovieTestStates:
.4byte sub_8014400
.4byte sub_801447C
.4byte sub_8014688

    .global gPsycheLockChainPalettes
gPsycheLockChainPalettes:
    .incbin "baserom.gba", 0x0014DCB4, 0x40

    .global gPsycheLockLockPositions
gPsycheLockLockPositions:
    .incbin "baserom.gba", 0x0014DCF4, 0x64

    .global gPsycheLockChainTilemaps
gPsycheLockChainTilemaps:
    .incbin "baserom.gba", 0x0014DD58, 0x50

    .global gPalHPBarLoseLifePalettes
gPalHPBarLoseLifePalettes:
    .incbin "baserom.gba", 0x0014DDA8, 0x1E0

    .global gPalHPBarGainLifePalettes
gPalHPBarGainLifePalettes:
    .incbin "baserom.gba", 0x0014DF88, 0x1E0
