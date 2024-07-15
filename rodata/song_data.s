	.section .rodata

    .incbin "baserom.gba", 0x00028A70, 0xA1E4
    
    .global gMPlayTable
gMPlayTable:
    .incbin "baserom.gba", 0x00032C54, 0x30

    .global gSongTable
gSongTable:
    .incbin "baserom.gba", 0x00032C84, 0xBA8

    .incbin "baserom.gba", 0x3382C, 0x1199C0
