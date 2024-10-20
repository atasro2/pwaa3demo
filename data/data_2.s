	.section .data
    .align 2, 0

    .global gUnknown_0814DC64
gUnknown_0814DC64:
@ replacing .incbin "baserom.gba", 0x0014dc64, 0xc
.4byte 0x80116b1
.4byte 0x8011715
.4byte 0x8011c09

    .global gUnknown_0814DC70
gUnknown_0814DC70:
@ replacing .incbin "baserom.gba", 0x0014dc70, 0x20
.4byte 0x801438d
.4byte 0x801438d
.4byte 0x801438d
.4byte 0x801438d
.4byte 0x801438d
.4byte 0x801438d
.4byte 0x801438d
.4byte 0x801438d

    .global gUnknown_0814DC90
gUnknown_0814DC90:
@ replacing .incbin "baserom.gba", 0x0014dc90, 0x18
.4byte 0x8014131
.4byte 0x8014221
.4byte 0x8013dc9
.4byte 0x8013e81
.4byte 0x8013f39
.4byte 0x801402d

    .global gDebugMovieTestStates
gDebugMovieTestStates:
@ replacing .incbin "baserom.gba", 0x0014dca8, 0xc
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
