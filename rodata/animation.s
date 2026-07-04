	.section .rodata
    .align 2, 0

    .global gPersonAnimData
gPersonAnimData:
    .incbin "baserom.gba", 0x00027090, 0x228

    .global gAnimationData
gAnimationData:
    .incbin "baserom.gba", 0x000272B8, 0xDFC