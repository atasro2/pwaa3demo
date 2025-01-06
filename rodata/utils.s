	.section .rodata
    .align 2, 0

    .global gUnknown_08025430
gUnknown_08025430:
    .incbin "baserom.gba", 0x00025430, 0x800

    .global gUnknown_08025C30
gUnknown_08025C30:
    .incbin "baserom.gba", 0x00025C30, 0x800

    .global gSineTable
gSineTable:
    .incbin "baserom.gba", 0x00026430, 0x280

    .global gUnknown_080266B0
gUnknown_080266B0:
    .incbin "baserom.gba", 0x000266B0, 0x20
