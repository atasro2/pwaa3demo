	.section .data
    .align 2, 0

    .global gFlagPtrs
gFlagPtrs:
    .incbin "baserom.gba", 0x0014D930, 0xC

    .global gCourtRecordInitialItemLists
gCourtRecordInitialItemLists:
@ replacing .incbin "baserom.gba", 0x0014d93c, 0x5c
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080253F8
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8 
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8
.4byte gUnknown_080266C8

    .global gCourtPresentData
gCourtPresentData:
@ replacing .incbin "baserom.gba", 0x0014d998, 0x5c
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_08025410
.4byte gUnknown_080266B0
.4byte gUnknown_080266B0
.4byte gUnknown_080266B0
.4byte gUnknown_080266B0
.4byte gUnknown_080266B0
.4byte gUnknown_080266B0
.4byte gUnknown_080266B0
.4byte gUnknown_08025410
.4byte gUnknown_080266B0

    .global gInvestigationPresentData
gInvestigationPresentData:
@ replacing .incbin "baserom.gba", 0x0014d9f4, 0x5c
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8
.4byte gUnknown_080266B8

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
.4byte SaveGameInit1
.4byte SaveGameInit2
.4byte SaveGameInitButtons
.4byte SaveGameWaitForInput
.4byte SaveGameExitSaveScreen
.4byte SaveGame5
.4byte SaveGame6
.4byte SaveGame7
.4byte SaveGame8

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
