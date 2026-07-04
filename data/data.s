	.section .data
    .align 2, 0

    .global gFlagPtrs
gFlagPtrs:
    .4byte 0x03003878
    .4byte 0x03003898
    .4byte 0x0300389C

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

    .global gInvestigationSegmentSetupFunctions
gInvestigationSegmentSetupFunctions:
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

    .global gInvestigationRoomSetupFunctions
gInvestigationRoomSetupFunctions:
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

    .global gInvestigationRoomUpdateFunctions
gInvestigationRoomUpdateFunctions:
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
