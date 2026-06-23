	.section .data
    .align 2, 0

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
