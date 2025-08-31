	.section .rodata
    .align 2, 0

    .global gBackgroundTable
gBackgroundTable:
    .incbin "baserom.gba", 0x00023B98, 0x348

    .global gUnknown_08023EE0
gUnknown_08023EE0:
    .incbin "baserom.gba", 0x00023EE0, 0xC

    .global gUnknown_08023EEC
gUnknown_08023EEC:
    .incbin "baserom.gba", 0x00023EEC, 0x6

    .global gUnknown_08023EF2
gUnknown_08023EF2:
    .incbin "baserom.gba", 0x00023EF2, 0x6

    .global gTextboxTiles
gTextboxTiles:
    .incbin "baserom.gba", 0x00023EF8, 0x400

    .global gUnknown_080242F8
gUnknown_080242F8:
    .incbin "baserom.gba", 0x000242F8, 0x300

    .global gUnknown_080245F8
gUnknown_080245F8:
    .incbin "baserom.gba", 0x000245F8, 0x300

    .global gUnknown_080248F8
gUnknown_080248F8:
    .incbin "baserom.gba", 0x000248F8, 0x580

    .global gUnknown_08024E78
gUnknown_08024E78:
    .incbin "baserom.gba", 0x00024E78, 0x5B8
