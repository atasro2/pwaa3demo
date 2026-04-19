	.section .rodata
    .align 2, 0

    .global gBackgroundTable
gBackgroundTable:
    .incbin "baserom.gba", 0x00023B98, 0x348

    .global gNameTagTiles
gNameTagTiles:
    .incbin "baserom.gba", 0x00023EE0, 0x18

    .global gTextboxTiles
gTextboxTiles:
    .incbin "baserom.gba", 0x00023EF8, 0x400

    .global gMapCourtRecordNormalWindow
gMapCourtRecordNormalWindow:
    .incbin "baserom.gba", 0x000242F8, 0x300

    .global gMapCourtRecordSaveWindow
gMapCourtRecordSaveWindow:
    .incbin "baserom.gba", 0x000245F8, 0x300

    .global gMapSpeedlines
gMapSpeedlines:
    .incbin "baserom.gba", 0x000248F8, 0x580

    .global gUnknown_08024E78
gUnknown_08024E78:
    .incbin "baserom.gba", 0x00024E78, 0x5B8
