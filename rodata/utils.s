	.section .rodata
    .align 2, 0

    .global gUnknown_080253F8
gUnknown_080253F8:
    .incbin "baserom.gba", 0x000253F8, 0x8

    .global gUnknown_08025400
gUnknown_08025400:
    .incbin "baserom.gba", 0x00025400, 0x10
 
    .global gUnknown_08025410
gUnknown_08025410:
    .incbin "baserom.gba", 0x00025410, 0x20

    .global gUnknown_08025430
gUnknown_08025430:
    .incbin "baserom.gba", 0x00025430, 0x800

    .global gUnknown_08025C30
gUnknown_08025C30:
    .incbin "baserom.gba", 0x00025C30, 0x800

    .global gSineTable
gSineTable:
    .incbin "baserom.gba", 0x00026430, 0x280
