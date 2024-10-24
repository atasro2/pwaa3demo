	.section .rodata
    .align 2, 0

    .global gSaveVersion
gSaveVersion:
    .asciz "2002 CAPCOM GBA GYAKUTEN-SAIBAN2 07/15 Ver 1.000-"

    .align 2, 0

    .global gUnknown_080267E4
gUnknown_080267E4:
    .incbin "baserom.gba", 0x000267E4, 0x14

    .global gUnknown_080267F8
gUnknown_080267F8:
    .incbin "baserom.gba", 0x000267F8, 0x1

    .global gUnknown_080267F9
gUnknown_080267F9:
    .incbin "baserom.gba", 0x000267F9, 0x17

    .global gUnknown_08026810
gUnknown_08026810:
    .incbin "baserom.gba", 0x00026810, 0x150

    .global gUnknown_08026960
gUnknown_08026960:
    .incbin "baserom.gba", 0x00026960, 0x38

    .global gUnknown_08026998
gUnknown_08026998:
    .incbin "baserom.gba", 0x00026998, 0x488

    .global gUnknown_08026E20
gUnknown_08026E20:
    .incbin "baserom.gba", 0x00026E20, 0x16C

    .global gUnknown_08026F8C
gUnknown_08026F8C:
    .incbin "baserom.gba", 0x00026F8C, 0x4

    .global gUnknown_08026F90
gUnknown_08026F90:
    .incbin "baserom.gba", 0x00026F90, 0x4
