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
    .incbin "baserom.gba", 0x000267F8, 0x18

    .global gUnknown_08026810
gUnknown_08026810:
    .incbin "baserom.gba", 0x00026810, 0x150

    .global gUnknown_08026960
gUnknown_08026960:
    .incbin "baserom.gba", 0x00026960, 0x38
