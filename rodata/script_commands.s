	.section .rodata
    .align 2, 0

    .global gMapMarkerSprites
gMapMarkerSprites:
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

    .global gSpotSelectData
gSpotSelectData:

