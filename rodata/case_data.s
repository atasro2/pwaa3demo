	.section .rodata
    .align 2, 0

    .global gUnknown_080266B0
gUnknown_080266B0:
    .incbin "baserom.gba", 0x000266B0, 0x8

    .global gUnknown_080266B8
gUnknown_080266B8:
    .incbin "baserom.gba", 0x000266B8, 0x10

    .global gUnknown_080266C8
gUnknown_080266C8:
    .incbin "baserom.gba", 0x000266C8, 0x8

    .global gCaseStartProcess
gCaseStartProcess:
    .incbin "baserom.gba", 0x000266D0, 0x18

    .global gCaseGameoverSections
gCaseGameoverSections:
    .incbin "baserom.gba", 0x000266E8, 0x30
