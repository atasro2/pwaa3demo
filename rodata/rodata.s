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
    .incbin "baserom.gba", 0x00026430, 0x80

    .global gUnknown_080264B0
gUnknown_080264B0:
    .incbin "baserom.gba", 0x000264B0, 0x220

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

    .global gUnknown_08026F94
gUnknown_08026F94:
    .incbin "baserom.gba", 0x00026F94, 0xC

    .global gUnknown_08026FA0
gUnknown_08026FA0:
    .incbin "baserom.gba", 0x00026FA0, 0x10

    .global gUnknown_08026FB0
gUnknown_08026FB0:
    .incbin "baserom.gba", 0x00026FB0, 0xC

    .global gUnknown_08026FBC
gUnknown_08026FBC:
    .incbin "baserom.gba", 0x00026FBC, 0xC

    .global gUnknown_08026FC8
gUnknown_08026FC8:
    .incbin "baserom.gba", 0x00026FC8, 0xC

    .global gUnknown_08026FD4
gUnknown_08026FD4:
    .incbin "baserom.gba", 0x00026FD4, 0xC

    .global gUnknown_08026FE0
gUnknown_08026FE0:
    .incbin "baserom.gba", 0x00026FE0, 0xC

    .global gUnknown_08026FEC
gUnknown_08026FEC:
    .incbin "baserom.gba", 0x00026FEC, 0xC

    .global gUnknown_08026FF8
gUnknown_08026FF8:
    .incbin "baserom.gba", 0x00026FF8, 0xC

    .global gUnknown_08027004
gUnknown_08027004:
    .incbin "baserom.gba", 0x00027004, 0xC

    .global gUnknown_08027010
gUnknown_08027010:
    .incbin "baserom.gba", 0x00027010, 0xC

    .global gUnknown_0802701C
gUnknown_0802701C:
    .incbin "baserom.gba", 0x0002701C, 0xC

    .global gUnknown_08027028
gUnknown_08027028:
    .incbin "baserom.gba", 0x00027028, 0xC

    .global gUnknown_08027034
gUnknown_08027034:
    .incbin "baserom.gba", 0x00027034, 0xC

    .global gUnknown_08027040
gUnknown_08027040:
    .incbin "baserom.gba", 0x00027040, 0xC

    .global gUnknown_0802704C
gUnknown_0802704C:
    .incbin "baserom.gba", 0x0002704C, 0xC

    .global gUnknown_08027058
gUnknown_08027058:
    .incbin "baserom.gba", 0x00027058, 0x18

    .global gUnknown_08027070
gUnknown_08027070:
    .incbin "baserom.gba", 0x00027070, 0x4

    .global gUnknown_08027074
gUnknown_08027074:
    .incbin "baserom.gba", 0x00027074, 0x8

    .global gUnknown_0802707C
gUnknown_0802707C:
    .incbin "baserom.gba", 0x0002707C, 0x8

    .global gUnknown_08027084
gUnknown_08027084:
    .incbin "baserom.gba", 0x00027084, 0x8

    .global gUnknown_0802708C
gUnknown_0802708C:
    .incbin "baserom.gba", 0x0002708C, 0x4

    .global gUnknown_08027090
gUnknown_08027090:
    .incbin "baserom.gba", 0x00027090, 0x228

    .global gUnknown_080272B8
gUnknown_080272B8:
    .incbin "baserom.gba", 0x000272B8, 0xDFC

    .global gUnknown_080280B4
gUnknown_080280B4:
    .incbin "baserom.gba", 0x000280B4, 0x3C

    .global gUnknown_080280F0
gUnknown_080280F0:
    .incbin "baserom.gba", 0x000280F0, 0x10

    .global gUnknown_08028100
gUnknown_08028100:
    .incbin "baserom.gba", 0x00028100, 0x14

    .global gUnknown_08028114
gUnknown_08028114:
    .incbin "baserom.gba", 0x00028114, 0x14

    .global gUnknown_08028128
gUnknown_08028128:
    .incbin "baserom.gba", 0x00028128, 0x14

    .global gUnknown_0802813C
gUnknown_0802813C:
    .incbin "baserom.gba", 0x0002813C, 0x14

    .global gUnknown_08028150
gUnknown_08028150:
    .incbin "baserom.gba", 0x00028150, 0x18

    .global gUnknown_08028168
gUnknown_08028168:
    .incbin "baserom.gba", 0x00028168, 0x14

    .global gUnknown_0802817C
gUnknown_0802817C:
    .incbin "baserom.gba", 0x0002817C, 0x1F

    .global gUnknown_0802819B
gUnknown_0802819B:
    .incbin "baserom.gba", 0x0002819B, 0x1F

    .global gUnknown_080281BA
gUnknown_080281BA:
    .incbin "baserom.gba", 0x000281BA, 0x22

    .global gUnknown_080281DC
gUnknown_080281DC:
    .incbin "baserom.gba", 0x000281DC, 0x14

    .global gUnknown_080281F0
gUnknown_080281F0:
    .incbin "baserom.gba", 0x000281F0, 0x18

    .global gUnknown_08028208
gUnknown_08028208:
    .incbin "baserom.gba", 0x00028208, 0xC

    .global gUnknown_08028214
gUnknown_08028214:
    .incbin "baserom.gba", 0x00028214, 0xC

    .global gUnknown_08028220
gUnknown_08028220:
    .incbin "baserom.gba", 0x00028220, 0xC

    .global gUnknown_0802822C
gUnknown_0802822C:
    .incbin "baserom.gba", 0x0002822C, 0xC

    .global gUnknown_08028238
gUnknown_08028238:
    .incbin "baserom.gba", 0x00028238, 0x4

    .global gUnknown_0802823C
gUnknown_0802823C:
    .incbin "baserom.gba", 0x0002823C, 0x30

    .global gUnknown_0802826C
gUnknown_0802826C:
    .incbin "baserom.gba", 0x0002826C, 0x1C

    .global gUnknown_08028288
gUnknown_08028288:
    .incbin "baserom.gba", 0x00028288, 0xE8

    .global gUnknown_08028370
gUnknown_08028370:
    .incbin "baserom.gba", 0x00028370, 0xEE

    .global gUnknown_0802845E
gUnknown_0802845E:
    .incbin "baserom.gba", 0x0002845E, 0xE8

    .global gUnknown_08028546
gUnknown_08028546:
    .incbin "baserom.gba", 0x00028546, 0x42

    .global gUnknown_08028588
gUnknown_08028588:
    .incbin "baserom.gba", 0x00028588, 0x5C

    .global gUnknown_080285E4
gUnknown_080285E4:
    .incbin "baserom.gba", 0x000285E4, 0x40

    .global gUnknown_08028624
gUnknown_08028624:
    .incbin "baserom.gba", 0x00028624, 0x40

    .global gUnknown_08028664
gUnknown_08028664:
    .incbin "baserom.gba", 0x00028664, 0x14

    .global gUnknown_08028678
gUnknown_08028678:
    .incbin "baserom.gba", 0x00028678, 0x20

    .global gUnknown_08028698
gUnknown_08028698:
    .incbin "baserom.gba", 0x00028698, 0x84

    .global gUnknown_0802871C
gUnknown_0802871C:
    .incbin "baserom.gba", 0x0002871C, 0x12

    .global gUnknown_0802872E
gUnknown_0802872E:
    .incbin "baserom.gba", 0x0002872E, 0x8

    .global gUnknown_08028736
gUnknown_08028736:
    .incbin "baserom.gba", 0x00028736, 0x6

    .global gUnknown_0802873C
gUnknown_0802873C:
    .incbin "baserom.gba", 0x0002873C, 0x5

    .global gUnknown_08028741
gUnknown_08028741:
    .incbin "baserom.gba", 0x00028741, 0x10

    .global gUnknown_08028751
gUnknown_08028751:
    .incbin "baserom.gba", 0x00028751, 0x13

    .global gUnknown_08028764
gUnknown_08028764:
    .incbin "baserom.gba", 0x00028764, 0x30

    .global gUnknown_08028794
gUnknown_08028794:
    .incbin "baserom.gba", 0x00028794, 0x4
