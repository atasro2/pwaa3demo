	.section .data
    .align 2, 0

    .global gUnknown_0814D894
gUnknown_0814D894:
    .incbin "baserom.gba", 0x0014D894, 0x40

    .global gUnknown_0814D8D4
gUnknown_0814D8D4:
@ replacing .incbin "baserom.gba", 0x0014d8d4, 0x14
    .4byte nullsub_13
    .4byte sub_8005D80
    .4byte sub_8005D80
    .4byte sub_8005F68
    .4byte sub_8005F68

    .global gUnknown_0814D8E8
gUnknown_0814D8E8:
    .incbin "baserom.gba", 0x0014D8E8, 0x48

    .global gFlagPtrs
gFlagPtrs:
    .incbin "baserom.gba", 0x0014D930, 0xC

    .global gUnknown_0814D93C
gUnknown_0814D93C:
@ replacing .incbin "baserom.gba", 0x0014d93c, 0x5c
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80253f8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8
.4byte 0x80266c8

    .global gUnknown_0814D998
gUnknown_0814D998:
@ replacing .incbin "baserom.gba", 0x0014d998, 0x5c
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x8025410
.4byte 0x80266b0
.4byte 0x80266b0
.4byte 0x80266b0
.4byte 0x80266b0
.4byte 0x80266b0
.4byte 0x80266b0
.4byte 0x80266b0
.4byte 0x8025410
.4byte 0x80266b0

    .global gUnknown_0814D9F4
gUnknown_0814D9F4:
@ replacing .incbin "baserom.gba", 0x0014d9f4, 0x5c
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8
.4byte 0x80266b8

    .global gUnknown_0814DA50
gUnknown_0814DA50:
@ replacing .incbin "baserom.gba", 0x0014da50, 0x5c
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy

    .global gUnknown_0814DAAC
gUnknown_0814DAAC:
@ replacing .incbin "baserom.gba", 0x0014daac, 0x5c
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy

    .global gUnknown_0814DB08
gUnknown_0814DB08:
@ replacing .incbin "baserom.gba", 0x0014db08, 0x5c
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy
.4byte InvestigationDummy

    .global gSaveGameProcessStates
gSaveGameProcessStates:
@ replacing .incbin "baserom.gba", 0x0014db64, 0x24
.4byte sub_8007718
.4byte sub_8007880
.4byte sub_8007A98
.4byte sub_8007BD4
.4byte sub_8007E84
.4byte sub_80082DC
.4byte sub_8008338
.4byte sub_80083E4
.4byte sub_8008434

    .global gUnknown_0814DB88
gUnknown_0814DB88:
@ replacing .incbin "baserom.gba", 0x0014db88, 0xc
.4byte sub_800A51C
.4byte sub_800A780
.4byte sub_800A6D4

    .global gUnknown_0814DB94
gUnknown_0814DB94:
@ replacing .incbin "baserom.gba", 0x0014db94, 0x10
.4byte sub_800A968
.4byte sub_800A9B4
.4byte sub_800AA20
.4byte sub_800A804

    .global gUnknown_0814DBA4
gUnknown_0814DBA4:
@ replacing .incbin "baserom.gba", 0x0014dba4, 0x18
.4byte sub_800AB7C
.4byte sub_800ACD4
.4byte nullsub_16
.4byte sub_800AA34
.4byte sub_800AEF4
.4byte sub_800B0B0

    .global gInvestigationProcessStates
gInvestigationProcessStates:
@ replacing .incbin "baserom.gba", 0x0014dbbc, 0x2c
.4byte sub_800BFF0
.4byte sub_800C290
.4byte sub_800C510
.4byte sub_800C59C
.4byte sub_800C604
.4byte sub_800C628
.4byte sub_800C76C
.4byte sub_800CB08
.4byte sub_800D10C
.4byte sub_800DB70
.4byte InvestigationPsycheLock

    .global gUnknown_0814DBE8
gUnknown_0814DBE8:
@ replacing .incbin "baserom.gba", 0x0014dbe8, 0x30
.4byte 0x800dcc8
.4byte 0x800dd00
.4byte 0x800dd20
.4byte 0x800dd30
.4byte 0x800de6c
.4byte 0x800df18
.4byte 0x800df24
.4byte 0x800df2a
.4byte 0x800e038
.4byte 0x800e108
.4byte 0x800e15e
.4byte 0x800e164

    .global gUnknown_0814DC18
gUnknown_0814DC18:
@ replacing .incbin "baserom.gba", 0x0014dc18, 0x20
.4byte 0x800eaed
.4byte 0x800f3e1
.4byte 0x800f551
.4byte 0x800f615
.4byte 0x800f679
.4byte 0x800f731
.4byte 0x800fecd
.4byte 0x800fee9

    .global gUnknown_0814DC38
gUnknown_0814DC38:
@ replacing .incbin "baserom.gba", 0x0014dc38, 0xc
.4byte 0x801028d
.4byte 0x8010311
.4byte 0x80103b5
