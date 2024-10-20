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

    .global gUnknown_080266D0
gUnknown_080266D0:
    .incbin "baserom.gba", 0x000266D0, 0x18

    .global gUnknown_080266E8
gUnknown_080266E8:
    .incbin "baserom.gba", 0x000266E8, 0x30

    .global gUnknown_08026718
gUnknown_08026718:
    .incbin "baserom.gba", 0x00026718, 0x98

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
