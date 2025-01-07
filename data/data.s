	.section .data
    .align 2, 0

    .global gCourtScrollGfxFrameIndices
gCourtScrollGfxFrameIndices:
    .2byte 0x0000, 0x0001, 0x0002, 0x0003
    .2byte 0x0005, 0x0008, 0x000C, 0x0012
    .2byte 0x0019, 0x0021, 0x002A, 0x0034
    .2byte 0x003F, 0x0040, 0x0041, 0x0041
    .2byte 0x0000, 0x0002, 0x0004, 0x0006
    .2byte 0x000D, 0x0019, 0x0025, 0x0032
    .2byte 0x003F, 0x004C, 0x0059, 0x0066
    .2byte 0x0072, 0x007E, 0x0080, 0x0082

    .global gWindowFunctions
gWindowFunctions:
    .4byte WindowDummy
    .4byte ScrollWindowWithPrevWindow
    .4byte ScrollWindowWithPrevWindow
    .4byte ScrollWindowWithoutPrevWindow
    .4byte ScrollWindowWithoutPrevWindow

    .global gSpeakerToNametagMap
gSpeakerToNametagMap:
    .byte 0x00, 0x07, 0x07, 0x01
    .byte 0x15, 0x05, 0x13, 0x02
    .byte 0x28, 0x04, 0x01, 0x06
    .byte 0x0A, 0x0F, 0x0B, 0x14
    .byte 0x0D, 0x0E, 0x1D, 0x19
    .byte 0x1C, 0x1B, 0x02, 0x1E
    .byte 0x1A, 0x00, 0x26, 0x25
    .byte 0x00, 0x00, 0x10, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x01, 0x02, 0x00, 0x00
    .byte 0x00, 0x02, 0x03, 0x02
    .byte 0x15, 0x00, 0x12, 0x16
    .byte 0x09, 0x08, 0x11, 0x0C
    .byte 0x17, 0x18, 0x00, 0x00
    .byte 0x0E, 0x20, 0x1F, 0x21
    .byte 0x22, 0x23, 0x27, 0x24
    .byte 0x10, 0x27, 0xE8, 0x03
    .byte 0x64, 0x00, 0x0A, 0x00

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
.4byte sub_8007718
.4byte sub_8007880
.4byte sub_8007A98
.4byte sub_8007BD4
.4byte sub_8007E84
.4byte sub_80082DC
.4byte sub_8008338
.4byte sub_80083E4
.4byte sub_8008434

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
