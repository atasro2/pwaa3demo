	.section .rodata
    .align 2, 0

    .global gCaseStartProcess
gCaseStartProcess:
    .incbin "baserom.gba", 0x000266D0, 0x18

    .global gUnknown_080266E8
gUnknown_080266E8:
    .incbin "baserom.gba", 0x000266E8, 0x30
