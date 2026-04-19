	.section .data
    .align 2, 0

    .global gFlagPtrs
gFlagPtrs:
    .4byte 0x03003878
    .4byte 0x03003898
    .4byte 0x0300389C

    .global gCourtRecordInitialItemLists
gCourtRecordInitialItemLists:
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

    .global gCourtProcessStates
gCourtProcessStates:
.4byte CourtInit
.4byte CourtMain
.4byte CourtExit

    .global gTestimonyProcessStates
gTestimonyProcessStates:
.4byte TestimonyInit
.4byte TestimonyMain
.4byte TestimonyExit
.4byte TestimonyAnim

    .global gQuestioningProcessStates
gQuestioningProcessStates:
.4byte QuestioningInit
.4byte QuestioningMain
.4byte QuestioningExit
.4byte QuestioningAnim
.4byte QuestioningHoldIt
.4byte QuestioningObjection

    .global gInvestigationProcessStates
gInvestigationProcessStates:
.4byte InvestigationInit
.4byte InvestigationMain
.4byte InvestigationExit
.4byte InvestigationBgScrollWait
.4byte InvestigationTextboxSlideWait
.4byte InvestigationRoomInit
.4byte InvestigationInspect
.4byte InvestigationMove
.4byte InvestigationTalk
.4byte InvestigationPresent
.4byte InvestigationPsycheLock

    .global gUnknown_0814DBE8
gUnknown_0814DBE8:
@ static void * states[]; for InvestigationPsycheLock()
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

    .global gCourtRecordProcessStates
gCourtRecordProcessStates:
.4byte CourtRecordInit
.4byte CourtRecordMain
.4byte CourtRecordExit
.4byte CourtRecordChangeState
.4byte CourtRecordChangeRecord
.4byte CourtRecordDetailSubMenu
.4byte CourtRecordLoadGfxChangeState
.4byte CourtRecordTakeThatSpecial

    .global gEvidenceAddedProcessStates
gEvidenceAddedProcessStates:
.4byte EvidenceAddedInit
.4byte EvidenceAddedMain
.4byte EvidenceAddedExit
