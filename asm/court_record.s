	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_800F120
sub_800F120: @ 0x0800F120
	push {r4, r5, r6, lr}
	ldr r1, _0800F134 @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800F138
	movs r0, #0
	b _0800F3B2
	.align 2, 0
_0800F134: .4byte gJoypad
_0800F138:
	ldr r4, _0800F1C0 @ =gMain
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800F17A
	ldrh r0, [r4, #0x34]
	cmp r0, #3
	beq _0800F17A
	ldr r0, _0800F1C4 @ =gAnimation+0x44
	movs r1, #1
	bl ChangeAnimationActivity
	ldrh r0, [r4, #0x34]
	movs r2, #0
	strh r0, [r4, #0x38]
	movs r0, #3
	strh r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0800F1C8 @ =gScriptContext
	adds r0, #0x40
	movs r1, #0x80
	strh r1, [r0]
_0800F17A:
	movs r0, #3
	movs r1, #0xc
	bl SlideInBG2Window
	ldr r1, _0800F1CC @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	ldr r0, _0800F1C8 @ =gScriptContext
	ldrh r0, [r0, #0xc]
	ldr r2, _0800F1D0 @ =gCourtRecord
	ldr r1, [r2, #0x18]
	ldrb r2, [r2, #0xd]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_8010A34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F1DA
	cmp r5, #0
	beq _0800F1D4
	movs r0, #3
	bl SetOrQueueHPBarState
	ldr r0, _0800F1C0 @ =gMain
	adds r0, #0xaa
	movs r1, #0
	strh r1, [r0]
	b _0800F1DA
	.align 2, 0
_0800F1C0: .4byte gMain
_0800F1C4: .4byte gAnimation+0x44
_0800F1C8: .4byte gScriptContext
_0800F1CC: .4byte gOamObjects
_0800F1D0: .4byte gCourtRecord
_0800F1D4:
	movs r0, #8
	bl SetOrQueueHPBarState
_0800F1DA:
	ldr r4, _0800F1FC @ =gMain
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F204
	movs r0, #4
	movs r1, #0x12
	bl SlideInBG2Window
	ldr r0, _0800F200 @ =0x00000707
	str r0, [r4, #8]
	b _0800F352
	.align 2, 0
_0800F1FC: .4byte gMain
_0800F200: .4byte 0x00000707
_0800F204:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800F24A
	movs r0, #4
	bl PlayAnimation
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800F226
	cmp r0, #0xc
	beq _0800F226
	cmp r0, #0xd
	bne _0800F234
_0800F226:
	ldr r0, _0800F230 @ =0x00000173
	bl PlaySE
	b _0800F282
	.align 2, 0
_0800F230: .4byte 0x00000173
_0800F234:
	cmp r0, #0x14
	bne _0800F242
	movs r0, #0xb8
	lsls r0, r0, #1
	bl PlaySE
	b _0800F282
_0800F242:
	movs r0, #0x37
	bl PlaySE
	b _0800F282
_0800F24A:
	movs r0, #2
	bl PlayAnimation
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800F262
	cmp r0, #0xc
	beq _0800F262
	cmp r0, #0xd
	bne _0800F270
_0800F262:
	ldr r0, _0800F26C @ =0x00000171
	bl PlaySE
	b _0800F282
	.align 2, 0
_0800F26C: .4byte 0x00000171
_0800F270:
	cmp r0, #0x14
	bne _0800F27C
	movs r0, #0x51
	bl PlaySE
	b _0800F282
_0800F27C:
	movs r0, #0x51
	bl PlaySE
_0800F282:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _0800F2FC @ =gTestimony
	movs r0, #0xa
	strb r0, [r1, #1]
	ldr r1, _0800F300 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800F304 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	movs r2, #0
	strh r0, [r1]
	ldr r4, _0800F308 @ =gMain
	strb r2, [r4, #0x18]
	strb r2, [r4, #0x19]
	movs r0, #0x1e
	strh r0, [r4, #0x14]
	movs r2, #1
	strb r2, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
	ldr r6, _0800F30C @ =gScriptContext
	ldrh r0, [r6, #0xc]
	ldr r2, _0800F310 @ =gCourtRecord
	ldr r1, [r2, #0x18]
	ldrb r2, [r2, #0xd]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_8010A34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0800F318
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F2EA
	movs r0, #3
	bl SetOrQueueHPBarState
	adds r1, r4, #0
	adds r1, #0xaa
	movs r0, #0
	strh r0, [r1]
_0800F2EA:
	bl StopBGM
	adds r0, r5, #0
	bl ChangeScriptSection
	ldr r0, _0800F314 @ =0x00000103
	str r0, [r4, #0xc]
	b _0800F34C
	.align 2, 0
_0800F2FC: .4byte gTestimony
_0800F300: .4byte gIORegisters
_0800F304: .4byte 0x0000FDFF
_0800F308: .4byte gMain
_0800F30C: .4byte gScriptContext
_0800F310: .4byte gCourtRecord
_0800F314: .4byte 0x00000103
_0800F318:
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F326
	movs r0, #8
	bl SetOrQueueHPBarState
_0800F326:
	movs r0, #0x10
	ldrh r6, [r6, #0x1c]
	ands r0, r6
	cmp r0, #0
	beq _0800F336
	bl sub_800EBE8
	b _0800F33A
_0800F336:
	bl sub_800EBE8
_0800F33A:
	ldr r1, _0800F3B8 @ =gScriptContext
	ldr r0, _0800F3BC @ =0x0000FFEF
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	strh r0, [r1, #0x1c]
	ldr r1, _0800F3C0 @ =gUnknown_030037BC
	movs r0, #0x83
	lsls r0, r0, #1
	str r0, [r1]
_0800F34C:
	ldr r1, _0800F3C4 @ =gUnknown_030037B8
	ldr r0, _0800F3C8 @ =0x00000506
	str r0, [r1]
_0800F352:
	movs r0, #0
	movs r1, #0
	bl SetTextboxNametag
	ldr r4, _0800F3CC @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	movs r0, #0
	bl UpdateRecordPresentActionSprites
	ldr r2, _0800F3D0 @ =gMain
	adds r0, r2, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F386
	ldrb r2, [r2, #8]
	cmp r2, #4
	bne _0800F39E
_0800F386:
	ldr r1, _0800F3D4 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800F3D8 @ =0x0000FBFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	adds r0, r4, #0
	bl ClearEvidenceSprites
	movs r0, #0
	bl UpdateRecordInfoActionSprites
_0800F39E:
	ldr r1, _0800F3D0 @ =gMain
	adds r1, #0xe8
	ldr r0, [r1]
	ldr r2, _0800F3DC @ =0xFFFFFCFF
	ands r0, r2
	str r0, [r1]
	ldr r1, _0800F3B8 @ =gScriptContext
	movs r0, #0
	strh r0, [r1, #0x10]
	movs r0, #1
_0800F3B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800F3B8: .4byte gScriptContext
_0800F3BC: .4byte 0x0000FFEF
_0800F3C0: .4byte gUnknown_030037BC
_0800F3C4: .4byte gUnknown_030037B8
_0800F3C8: .4byte 0x00000506
_0800F3CC: .4byte gCourtRecord
_0800F3D0: .4byte gMain
_0800F3D4: .4byte gIORegisters
_0800F3D8: .4byte 0x0000FBFF
_0800F3DC: .4byte 0xFFFFFCFF

	thumb_func_start CourtRecordMain
CourtRecordMain: @ 0x0800F3E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r2, _0800F41C @ =gScriptContext
	ldrh r1, [r2, #0x1e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800F430
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800F49C
	ldr r0, _0800F420 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2, #0x1e]
	movs r0, #0x1e
	bl FadeOutBGM
	ldr r1, _0800F424 @ =gCourtRecord
	movs r0, #8
	ldrb r2, [r1, #0xc]
	orrs r0, r2
	strb r0, [r1, #0xc]
	ldr r1, _0800F428 @ =gUnknown_030037B8
	ldr r0, _0800F42C @ =0x00000707
	str r0, [r1]
	b _0800F530
	.align 2, 0
_0800F41C: .4byte gScriptContext
_0800F420: .4byte 0x0000FFBF
_0800F424: .4byte gCourtRecord
_0800F428: .4byte gUnknown_030037B8
_0800F42C: .4byte 0x00000707
_0800F430:
	bl sub_800EC48
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
	ldrb r0, [r6, #0xe]
	cmp r0, #1
	bls _0800F454
	bl sub_800EF34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
	bl sub_800EF78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
_0800F454:
	ldr r1, _0800F47C @ =gJoypad
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800F480
	movs r0, #0x34
	bl PlaySE
	movs r0, #3
	movs r1, #0xc
	bl SlideInBG2Window
	movs r0, #4
	strb r0, [r6, #0xf]
	strb r0, [r4, #9]
	b _0800F530
	.align 2, 0
_0800F47C: .4byte gJoypad
_0800F480:
	ldrb r0, [r4, #0xb]
	cmp r0, #1
	bne _0800F4B0
	bl sub_800F120
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0800F4C4
_0800F49C:
	ldr r4, _0800F4AC @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	b _0800F530
	.align 2, 0
_0800F4AC: .4byte gCourtRecord
_0800F4B0:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0800F4C4
	bl sub_800EFBC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
_0800F4C4:
	ldr r1, _0800F538 @ =gJoypad
	movs r0, #2
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800F522
	movs r0, #0x2c
	bl PlaySE
	movs r0, #3
	movs r1, #0xc
	bl SlideInBG2Window
	ldrb r0, [r4, #0xb]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800F4FE
	ldr r1, _0800F53C @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800F4FE
	ldr r0, _0800F540 @ =gMain
	adds r0, #0xaa
	movs r1, #0
	strh r1, [r0]
_0800F4FE:
	ldrb r1, [r4, #0xb]
	cmp r1, #2
	bne _0800F508
	ldr r0, _0800F544 @ =0x00030904
	str r0, [r4, #0xc]
_0800F508:
	cmp r1, #3
	bne _0800F510
	ldr r0, _0800F548 @ =0x00060A04
	str r0, [r4, #0xc]
_0800F510:
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F51E
	movs r0, #8
	bl SetOrQueueHPBarState
_0800F51E:
	movs r0, #2
	strb r0, [r4, #9]
_0800F522:
	ldr r4, _0800F54C @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
_0800F530:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F538: .4byte gJoypad
_0800F53C: .4byte gScriptContext
_0800F540: .4byte gMain
_0800F544: .4byte 0x00030904
_0800F548: .4byte 0x00060A04
_0800F54C: .4byte gCourtRecord

	thumb_func_start CourtRecordExit
CourtRecordExit: @ 0x0800F550
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _0800F582
	ldrb r1, [r4, #2]
	cmp r1, #8
	bls _0800F582
	ldr r3, _0800F5F4 @ =gOamObjects+0x1B8
	ldrh r0, [r3, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	adds r0, #0xc
	ldr r1, _0800F5F8 @ =0x000001FF
	ands r0, r1
	strh r0, [r3, #2]
	cmp r0, #0xb3
	bls _0800F57C
	movs r0, #0xb4
	strh r0, [r3, #2]
_0800F57C:
	ldrh r0, [r3, #2]
	orrs r2, r0
	strh r2, [r3, #2]
_0800F582:
	ldrb r1, [r5, #0xb]
	cmp r1, #3
	bne _0800F596
	ldrb r2, [r4, #2]
	cmp r2, #8
	bls _0800F596
	ldr r3, _0800F5F4 @ =gOamObjects+0x1B8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
_0800F596:
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0800F5EE
	movs r0, #4
	ldrb r1, [r4, #0xc]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	bne _0800F5DA
	ldr r1, _0800F5FC @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800F5DA
	ldr r1, _0800F600 @ =gBG1MapBuffer
	ldr r0, _0800F604 @ =0x000004DC
	adds r2, r1, r0
	movs r0, #0x20
	strh r0, [r2]
	ldr r2, _0800F608 @ =0x000004DE
	adds r1, r1, r2
	movs r0, #0x21
	strh r0, [r1]
_0800F5DA:
	ldr r0, _0800F60C @ =gUnknown_030037B8
	ldr r1, [r5, #0xc]
	str r1, [r0]
	ldr r2, _0800F610 @ =0x000002BA
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800F5EE
	bl PlaySE
_0800F5EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F5F4: .4byte gOamObjects+0x1B8
_0800F5F8: .4byte 0x000001FF
_0800F5FC: .4byte gScriptContext
_0800F600: .4byte gBG1MapBuffer
_0800F604: .4byte 0x000004DC
_0800F608: .4byte 0x000004DE
_0800F60C: .4byte gUnknown_030037B8
_0800F610: .4byte 0x000002BA

	thumb_func_start CourtRecordChangeState
CourtRecordChangeState: @ 0x0800F614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _0800F646
	ldrb r1, [r4, #2]
	cmp r1, #8
	bls _0800F646
	ldr r3, _0800F670 @ =gOamObjects+0x1B8
	ldrh r0, [r3, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	subs r0, #0xc
	ldr r1, _0800F674 @ =0x000001FF
	ands r0, r1
	strh r0, [r3, #2]
	cmp r0, #0xff
	bls _0800F640
	movs r0, #0
	strh r0, [r3, #2]
_0800F640:
	ldrh r0, [r3, #2]
	orrs r2, r0
	strh r2, [r3, #2]
_0800F646:
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0800F66A
	movs r0, #4
	ldrb r1, [r4, #0xc]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xf]
	strb r0, [r5, #9]
_0800F66A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F670: .4byte gOamObjects+0x1B8
_0800F674: .4byte 0x000001FF

	thumb_func_start CourtRecordChangeRecord
CourtRecordChangeRecord: @ 0x0800F678
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0800F718
	movs r0, #0xfd
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	movs r0, #2
	movs r1, #0xc
	bl SlideInBG2Window
	movs r1, #1
	strb r1, [r4, #0xf]
	movs r0, #3
	strb r0, [r5, #9]
	ldrb r2, [r4, #0xd]
	ldrb r0, [r4, #0x12]
	strb r0, [r4, #0xd]
	strb r2, [r4, #0x12]
	ldrb r2, [r4, #0xc]
	ands r1, r2
	cmp r1, #0
	beq _0800F6EC
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r4, #0xc]
	ldr r1, _0800F6DC @ =0x040000D4
	ldr r0, _0800F6E0 @ =gGfx4bppProfileTextTiles
	str r0, [r1]
	ldr r0, _0800F6E4 @ =0x06013500
	str r0, [r1, #4]
	ldr r0, _0800F6E8 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r4, #0x10]
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	adds r0, #0x1c
	b _0800F70A
	.align 2, 0
_0800F6DC: .4byte 0x040000D4
_0800F6E0: .4byte gGfx4bppProfileTextTiles
_0800F6E4: .4byte 0x06013500
_0800F6E8: .4byte 0x80000100
_0800F6EC:
	movs r0, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	ldr r1, _0800F720 @ =0x040000D4
	ldr r0, _0800F724 @ =gGfxEvidenceText
	str r0, [r1]
	ldr r0, _0800F728 @ =0x06013500
	str r0, [r1, #4]
	ldr r0, _0800F72C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r4, #0x11]
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	adds r0, #0x3c
_0800F70A:
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r0, r4, r0
	ldrb r0, [r0]
	bl LoadEvidenceGraphics
_0800F718:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F720: .4byte 0x040000D4
_0800F724: .4byte gGfxEvidenceText
_0800F728: .4byte 0x06013500
_0800F72C: .4byte 0x80000100

	thumb_func_start CourtRecordDetailSubMenu
CourtRecordDetailSubMenu: @ 0x0800F730
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F758
	ldr r0, _0800F76C @ =gIORegisters
	movs r2, #0
	movs r1, #8
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x14]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0xc]
_0800F758:
	ldrb r0, [r5, #0xa]
	cmp r0, #6
	bls _0800F760
	b _0800FEBC
_0800F760:
	lsls r0, r0, #2
	ldr r1, _0800F770 @ =_0800F774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F76C: .4byte gIORegisters
_0800F770: .4byte _0800F774
_0800F774: @ jump table
	.4byte _0800F790 @ case 0
	.4byte _0800FAAC @ case 1
	.4byte _0800FAC4 @ case 2
	.4byte _0800FB90 @ case 3
	.4byte _0800FD78 @ case 4
	.4byte _0800FE40 @ case 5
	.4byte _0800FE68 @ case 6
_0800F790:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800F79C
	b _0800FEBC
_0800F79C:
	ldr r1, _0800F7C8 @ =gMain
	ldr r0, _0800F7CC @ =0x00000A04
	ldrh r2, [r1, #0xc]
	cmp r2, r0
	bne _0800F7D4
	ldr r3, _0800F7D0 @ =0x00000257
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #2
	beq _0800F7E2
	ldrh r1, [r1, #0x36]
	cmp r1, #0x80
	bne _0800F7E2
	movs r0, #8
	movs r1, #0
	bl SetPsycheLockState
	bl UpdatePsycheLockAnimation
	bl ClearPsycheLockStopPresentButtonsOAM
	b _0800F7E2
	.align 2, 0
_0800F7C8: .4byte gMain
_0800F7CC: .4byte 0x00000A04
_0800F7D0: .4byte 0x00000257
_0800F7D4:
	ldr r6, _0800F814 @ =0x00000257
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800F7E2
	bl ClearPsycheLockLocksAndChainsWithoutAnimating
_0800F7E2:
	movs r0, #0
	strb r0, [r4, #0x13]
	ldr r0, [r4, #0x18]
	ldrb r1, [r4, #0xd]
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r1, _0800F818 @ =0x040000D4
	ldr r0, _0800F81C @ =gMain
	str r0, [r1]
	ldr r0, _0800F820 @ =gUnknown_02000034
	str r0, [r1, #4]
	ldr r0, _0800F824 @ =0x8000016A
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800F828 @ =gEvidenceProfileData
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #0x12
	bhi _0800F8C4
	lsls r0, r0, #2
	ldr r1, _0800F82C @ =_0800F830
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F814: .4byte 0x00000257
_0800F818: .4byte 0x040000D4
_0800F81C: .4byte gMain
_0800F820: .4byte gUnknown_02000034
_0800F824: .4byte 0x8000016A
_0800F828: .4byte gEvidenceProfileData
_0800F82C: .4byte _0800F830
_0800F830: @ jump table
	.4byte _0800F8C4 @ case 0
	.4byte _0800F87C @ case 1
	.4byte _0800F880 @ case 2
	.4byte _0800F884 @ case 3
	.4byte _0800F888 @ case 4
	.4byte _0800F88C @ case 5
	.4byte _0800F890 @ case 6
	.4byte _0800F894 @ case 7
	.4byte _0800F898 @ case 8
	.4byte _0800F89C @ case 9
	.4byte _0800F8A0 @ case 10
	.4byte _0800F8A4 @ case 11
	.4byte _0800F8A8 @ case 12
	.4byte _0800F8AC @ case 13
	.4byte _0800F8B0 @ case 14
	.4byte _0800F8B4 @ case 15
	.4byte _0800F8B8 @ case 16
	.4byte _0800F8BC @ case 17
	.4byte _0800F8C0 @ case 18
_0800F87C:
	movs r0, #0x2d
	b _0800F8C2
_0800F880:
	movs r0, #0x2e
	b _0800F8C2
_0800F884:
	movs r0, #0x31
	b _0800F8C2
_0800F888:
	movs r0, #0x32
	b _0800F8C2
_0800F88C:
	movs r0, #0x34
	b _0800F8C2
_0800F890:
	movs r0, #0x4a
	b _0800F8C2
_0800F894:
	movs r0, #0x39
	b _0800F8C2
_0800F898:
	movs r0, #0x4b
	b _0800F8C2
_0800F89C:
	movs r0, #0x3a
	b _0800F8C2
_0800F8A0:
	movs r0, #0x4c
	b _0800F8C2
_0800F8A4:
	movs r0, #0x43
	b _0800F8C2
_0800F8A8:
	movs r0, #0x50
	b _0800F8C2
_0800F8AC:
	movs r0, #0x54
	b _0800F8C2
_0800F8B0:
	movs r0, #0x56
	b _0800F8C2
_0800F8B4:
	movs r0, #0x64
	b _0800F8C2
_0800F8B8:
	movs r0, #0x65
	b _0800F8C2
_0800F8BC:
	movs r0, #0x66
	b _0800F8C2
_0800F8C0:
	movs r0, #0x67
_0800F8C2:
	strh r0, [r5, #0x34]
_0800F8C4:
	ldrh r0, [r5, #0x34]
	bl DecompressBackgroundIntoBuffer
	ldr r1, _0800F930 @ =0x040000D4
	ldr r0, _0800F934 @ =gOamObjects
	str r0, [r1]
	ldr r2, _0800F938 @ =gUnknown_020009D4
	str r2, [r1, #4]
	ldr r0, _0800F93C @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0800F940 @ =gMapMarker
	str r3, [r1]
	subs r2, #0xa0
	str r2, [r1, #4]
	ldr r0, _0800F944 @ =0x80000050
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r1, #0
	adds r7, r5, #0
	adds r7, #0x27
	movs r2, #0xff
_0800F8F0:
	ldrb r0, [r3]
	orrs r0, r2
	strb r0, [r3]
	adds r3, #0x14
	adds r1, #1
	cmp r1, #7
	bls _0800F8F0
	ldrb r0, [r5, #0xc]
	cmp r0, #4
	bne _0800F95C
	ldr r3, _0800F948 @ =gOamObjects+0x1A0
	movs r1, #0
	ldr r2, _0800F94C @ =gIORegisters
	mov sb, r2
	ldr r6, _0800F950 @ =gScriptContext
	mov ip, r6
	ldr r0, _0800F954 @ =gSaveDataBuffer
	mov r8, r0
	movs r6, #0x80
	lsls r6, r6, #2
	adds r2, r6, #0
_0800F91A:
	ldr r0, _0800F958 @ =0x0000FCFF
	ldrh r6, [r3]
	ands r0, r6
	orrs r0, r2
	strh r0, [r3]
	adds r3, #8
	adds r1, #1
	cmp r1, #3
	bls _0800F91A
	b _0800F9C4
	.align 2, 0
_0800F930: .4byte 0x040000D4
_0800F934: .4byte gOamObjects
_0800F938: .4byte gUnknown_020009D4
_0800F93C: .4byte 0x80000200
_0800F940: .4byte gMapMarker
_0800F944: .4byte 0x80000050
_0800F948: .4byte gOamObjects+0x1A0
_0800F94C: .4byte gIORegisters
_0800F950: .4byte gScriptContext
_0800F954: .4byte gSaveDataBuffer
_0800F958: .4byte 0x0000FCFF
_0800F95C:
	cmp r0, #5
	bne _0800F988
	ldr r3, _0800F978 @ =gOamObjects+0x1C8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	ldr r0, _0800F97C @ =gIORegisters
	mov sb, r0
	ldr r1, _0800F980 @ =gScriptContext
	mov ip, r1
	ldr r2, _0800F984 @ =gSaveDataBuffer
	mov r8, r2
	b _0800F9C4
	.align 2, 0
_0800F978: .4byte gOamObjects+0x1C8
_0800F97C: .4byte gIORegisters
_0800F980: .4byte gScriptContext
_0800F984: .4byte gSaveDataBuffer
_0800F988:
	ldr r3, _0800FA84 @ =gIORegisters
	mov sb, r3
	ldr r6, _0800FA88 @ =gScriptContext
	mov ip, r6
	ldr r1, _0800FA8C @ =gSaveDataBuffer
	mov r8, r1
	cmp r0, #6
	bne _0800F9C4
	ldr r3, _0800FA90 @ =gOamObjects+0x1B8
	ldr r1, _0800FA94 @ =0x0000FCFF
	adds r0, r1, #0
	ldrh r2, [r3]
	ands r0, r2
	movs r6, #0x80
	lsls r6, r6, #2
	adds r2, r6, #0
	orrs r0, r2
	strh r0, [r3]
	adds r3, #8
	ldrh r0, [r3]
	ands r1, r0
	orrs r1, r2
	strh r1, [r3]
	adds r3, #0x80
	ldrh r0, [r3]
	orrs r0, r2
	strh r0, [r3]
	ldrh r1, [r3, #8]
	orrs r2, r1
	strh r2, [r3, #8]
_0800F9C4:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r2, ip
	ldrh r2, [r2, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800F9DA
	ldr r3, _0800FA98 @ =gOamObjects+0x1D0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
_0800F9DA:
	ldrb r0, [r5, #0x19]
	mov r1, r8
	adds r1, #0x4d
	movs r2, #0
	strb r0, [r1]
	ldrb r1, [r5, #0x18]
	mov r0, r8
	adds r0, #0x4c
	strb r1, [r0]
	strb r2, [r5, #0x19]
	strb r2, [r5, #0x18]
	mov r2, sb
	adds r2, #0x4a
	ldr r0, _0800FA9C @ =0x0000FDFF
	ldrh r3, [r2]
	ands r0, r3
	ldr r1, _0800FAA0 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xfc
	ldrb r6, [r7]
	ands r0, r6
	strb r0, [r7]
	adds r0, r4, #0
	bl ClearEvidenceSprites
	movs r0, #0
	bl UpdateRecordInfoActionSprites
	movs r0, #1
	bl sub_80108BC
	ldr r3, _0800FAA4 @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	strh r0, [r3, #8]
	movs r1, #0
	adds r2, r3, #0
_0800FA28:
	strh r0, [r2]
	adds r2, #8
	adds r1, #1
	cmp r1, #0x1f
	bls _0800FA28
	movs r1, #0
	ldr r3, _0800FAA8 @ =gAnimation
	ldr r0, _0800FAA4 @ =gOamObjects
	movs r2, #0x80
	lsls r2, r2, #2
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r0, r0, r4
_0800FA42:
	strh r2, [r0]
	adds r0, #8
	adds r1, #1
	cmp r1, #0x1f
	bls _0800FA42
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0xb
	beq _0800FA5A
	cmp r0, #0x21
	bne _0800FA7E
_0800FA5A:
	ldr r1, _0800FA88 @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800FA7E
	movs r1, #0
	ldr r0, _0800FAA4 @ =gOamObjects
	movs r2, #0x80
	lsls r2, r2, #2
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r0, r0, r6
_0800FA74:
	strh r2, [r0]
	adds r0, #8
	adds r1, #1
	cmp r1, #0x1e
	bls _0800FA74
_0800FA7E:
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FA84: .4byte gIORegisters
_0800FA88: .4byte gScriptContext
_0800FA8C: .4byte gSaveDataBuffer
_0800FA90: .4byte gOamObjects+0x1B8
_0800FA94: .4byte 0x0000FCFF
_0800FA98: .4byte gOamObjects+0x1D0
_0800FA9C: .4byte 0x0000FDFF
_0800FAA0: .4byte 0x0000FBFF
_0800FAA4: .4byte gOamObjects
_0800FAA8: .4byte gAnimation
_0800FAAC:
	ldrh r0, [r5, #0x34]
	bl CopyBGDataToVram
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
_0800FAC4:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800FAD0
	b _0800FEBC
_0800FAD0:
	ldr r0, _0800FAF4 @ =gJoypad
	ldrh r1, [r0, #2]
	ldr r6, _0800FAF8 @ =0x00000202
	ands r6, r1
	cmp r6, #0
	beq _0800FAFC
	movs r0, #0x2c
	bl PlaySE
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FAF4: .4byte gJoypad
_0800FAF8: .4byte 0x00000202
_0800FAFC:
	movs r0, #0x81
	ands r0, r1
	cmp r0, #0
	beq _0800FB44
	ldr r0, [r4, #0x18]
	ldrb r1, [r4, #0xd]
	adds r0, r1, r0
	ldr r1, _0800FB40 @ =gEvidenceProfileData
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #4
	beq _0800FB1A
	b _0800FEBC
_0800FB1A:
	movs r0, #0x2b
	bl PlaySE
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800FB30
	strb r6, [r4, #0x13]
_0800FB30:
	movs r0, #2
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #6
	b _0800FEBA
	.align 2, 0
_0800FB40: .4byte gEvidenceProfileData
_0800FB44:
	movs r0, #0x41
	ands r0, r1
	cmp r0, #0
	bne _0800FB4E
	b _0800FEBC
_0800FB4E:
	ldr r0, [r4, #0x18]
	ldrb r2, [r4, #0xd]
	adds r0, r2, r0
	ldr r1, _0800FB8C @ =gEvidenceProfileData
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #4
	beq _0800FB64
	b _0800FEBC
_0800FB64:
	movs r0, #0x2b
	bl PlaySE
	ldrb r0, [r4, #0x13]
	subs r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0800FB7C
	movs r0, #1
	strb r0, [r4, #0x13]
_0800FB7C:
	movs r0, #2
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #6
	b _0800FEBA
	.align 2, 0
_0800FB8C: .4byte gEvidenceProfileData
_0800FB90:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800FB9C
	b _0800FEBC
_0800FB9C:
	ldr r2, _0800FD30 @ =gSaveDataBuffer
	adds r0, r2, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r5, #0x34]
	adds r0, r2, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r5, #0x38]
	adds r0, r2, #0
	adds r0, #0x70
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x71
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x73
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x78
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7a
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7e
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x80
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x81
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x82
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x83
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x88
	ldr r0, [r0]
	str r0, [r5, #0x54]
	movs r1, #0
	adds r7, r5, #0
	adds r7, #0x27
	adds r3, r2, #0
	adds r3, #0x8c
	adds r2, r5, #0
	adds r2, #0x58
_0800FC64:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #0xb
	bls _0800FC64
	ldrh r0, [r5, #0x34]
	bl DecompressBackgroundIntoBuffer
	ldrh r0, [r5, #0x34]
	bl sub_8004FAC
	ldr r3, _0800FD30 @ =gSaveDataBuffer
	adds r0, r3, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	strb r0, [r5, #0x19]
	adds r0, r3, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	strb r0, [r5, #0x18]
	ldr r2, _0800FD34 @ =gIORegisters
	adds r2, #0x4a
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	movs r6, #0
	ldrh r1, [r2]
	orrs r0, r1
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _0800FD38 @ =0x040000D4
	ldr r1, _0800FD3C @ =0x000009D4
	adds r0, r3, r1
	str r0, [r4]
	ldr r0, _0800FD40 @ =gOamObjects
	str r0, [r4, #4]
	ldr r0, _0800FD44 @ =0x80000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _0800FD48 @ =0x00000934
	adds r3, r3, r2
	str r3, [r4]
	ldr r0, _0800FD4C @ =gMapMarker
	str r0, [r4, #4]
	ldr r0, _0800FD50 @ =0x80000050
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl MakeMapMarkerSprites
	ldrb r3, [r5, #0xc]
	cmp r3, #5
	bne _0800FCD6
	ldr r0, _0800FD54 @ =gTestimony
	strb r6, [r0, #1]
_0800FCD6:
	movs r0, #3
	ldrb r6, [r7]
	orrs r0, r6
	strb r0, [r7]
	ldr r2, _0800FD58 @ =gAnimation+0x44
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _0800FCEA
	cmp r0, #0x21
	bne _0800FD1A
_0800FCEA:
	ldr r1, _0800FD5C @ =gUnknown_0826FE38
	ldr r0, [r1, #4]
	ldr r1, _0800FD60 @ =gUnknown_08252498
	adds r0, r0, r1
	ldr r1, _0800FD64 @ =0x050003A0
	str r0, [r4]
	str r1, [r4, #4]
	ldr r0, _0800FD68 @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0800FD6C @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	ldr r1, _0800FD70 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2]
_0800FD1A:
	ldr r4, _0800FD74 @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FD30: .4byte gSaveDataBuffer
_0800FD34: .4byte gIORegisters
_0800FD38: .4byte 0x040000D4
_0800FD3C: .4byte 0x000009D4
_0800FD40: .4byte gOamObjects
_0800FD44: .4byte 0x80000200
_0800FD48: .4byte 0x00000934
_0800FD4C: .4byte gMapMarker
_0800FD50: .4byte 0x80000050
_0800FD54: .4byte gTestimony
_0800FD58: .4byte gAnimation+0x44
_0800FD5C: .4byte gUnknown_0826FE38
_0800FD60: .4byte gUnknown_08252498
_0800FD64: .4byte 0x050003A0
_0800FD68: .4byte 0x80000010
_0800FD6C: .4byte 0xFEFFFFFF
_0800FD70: .4byte 0xFDFFFFFF
_0800FD74: .4byte gCourtRecord
_0800FD78:
	ldrh r0, [r5, #0x34]
	bl sub_8004FAC
	ldr r0, _0800FDA0 @ =gMain
	ldr r2, _0800FDA4 @ =0x000002C6
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800FDDC
	lsrs r0, r1, #4
	cmp r0, #1
	beq _0800FDBE
	cmp r0, #1
	bgt _0800FDA8
	cmp r0, #0
	beq _0800FDAE
	b _0800FDDC
	.align 2, 0
_0800FDA0: .4byte gMain
_0800FDA4: .4byte 0x000002C6
_0800FDA8:
	cmp r0, #2
	beq _0800FDCE
	b _0800FDDC
_0800FDAE:
	bl LoadWitnessBenchGraphics
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesWitness
	b _0800FDDC
_0800FDBE:
	bl LoadCounselBenchGraphics
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesDefense
	b _0800FDDC
_0800FDCE:
	bl LoadCounselBenchGraphics
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesProsecution
_0800FDDC:
	ldr r1, _0800FE04 @ =gMain
	ldr r0, _0800FE08 @ =0x00000A04
	ldrh r3, [r1, #0xc]
	cmp r3, r0
	bne _0800FE10
	ldr r4, _0800FE0C @ =0x00000257
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #2
	beq _0800FDFC
	movs r0, #9
	movs r1, #0
	bl SetPsycheLockState
	bl UpdatePsycheLockAnimation
_0800FDFC:
	bl SetPsycheLockPresentButtonOAMInCourtRecord
	b _0800FE2A
	.align 2, 0
_0800FE04: .4byte gMain
_0800FE08: .4byte 0x00000A04
_0800FE0C: .4byte 0x00000257
_0800FE10:
	ldr r6, _0800FE3C @ =0x00000257
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800FE2A
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ShowPsycheLockLocksAndChainsWithoutAnimating
_0800FE2A:
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FE3C: .4byte 0x00000257
_0800FE40:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r4, [r0]
	cmp r4, #0
	bne _0800FE54
	bl UnpauseBGM
	movs r0, #1
	strb r0, [r5, #9]
	strb r4, [r5, #0xa]
_0800FE54:
	ldr r4, _0800FE64 @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
	b _0800FEBC
	.align 2, 0
_0800FE64: .4byte gCourtRecord
_0800FE68:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FEBC
	ldr r0, [r4, #0x18]
	ldrb r3, [r4, #0xd]
	adds r0, r3, r0
	ldr r1, _0800FE94 @ =gEvidenceProfileData
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #4
	bne _0800FEA0
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _0800FE98
	cmp r0, #1
	beq _0800FE9C
	b _0800FEA0
	.align 2, 0
_0800FE94: .4byte gEvidenceProfileData
_0800FE98:
	movs r0, #0x32
	b _0800FE9E
_0800FE9C:
	movs r0, #0x33
_0800FE9E:
	strh r0, [r5, #0x34]
_0800FEA0:
	ldrh r0, [r5, #0x34]
	bl DecompressBackgroundIntoBuffer
	ldrh r0, [r5, #0x34]
	bl CopyBGDataToVram
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #1
_0800FEBA:
	strb r0, [r5, #0xa]
_0800FEBC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CourtRecordLoadGfxChangeState
CourtRecordLoadGfxChangeState: @ 0x0800FECC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1, #0x18]
	ldrb r1, [r1, #0xd]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl LoadEvidenceGraphics
	movs r0, #3
	strb r0, [r4, #9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CourtRecordTakeThatSpecial
CourtRecordTakeThatSpecial: @ 0x0800FEE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r7, _0800FF08 @ =gOamObjects+0x1A0
	ldr r3, _0800FF0C @ =gAnimation+0x44
	ldrb r1, [r5, #0xa]
	cmp r1, #2
	bgt _0800FF10
	cmp r1, #1
	blt _0800FF02
	b _08010014
_0800FF02:
	cmp r1, #0
	beq _0800FF18
	b _08010036
	.align 2, 0
_0800FF08: .4byte gOamObjects+0x1A0
_0800FF0C: .4byte gAnimation+0x44
_0800FF10:
	cmp r1, #3
	bne _0800FF16
	b _0801003C
_0800FF16:
	b _08010036
_0800FF18:
	adds r0, r5, #0
	adds r0, #0xa0
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r7]
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r6, r0, #0
	cmp r1, #0
	beq _0800FF30
	b _080101CE
_0800FF30:
	movs r0, #4
	bl PlayAnimation
	ldr r0, _0800FF50 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800FF48
	cmp r0, #0xc
	beq _0800FF48
	cmp r0, #0xd
	bne _0800FF58
_0800FF48:
	ldr r0, _0800FF54 @ =0x00000173
	bl PlaySE
	b _0800FF6C
	.align 2, 0
_0800FF50: .4byte gMain
_0800FF54: .4byte 0x00000173
_0800FF58:
	cmp r0, #0x14
	bne _0800FF66
	movs r0, #0xb8
	lsls r0, r0, #1
	bl PlaySE
	b _0800FF6C
_0800FF66:
	movs r0, #0x37
	bl PlaySE
_0800FF6C:
	ldr r1, _0800FFE4 @ =gTestimony
	movs r0, #6
	strb r0, [r1, #1]
	ldr r0, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r0, r4, r0
	ldr r4, _0800FFE8 @ =gUnknown_0200AFC0
	ldr r2, _0800FFEC @ =gUnknown_08026E20
	ldr r1, _0800FFF0 @ =gEvidenceProfileData
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0800FFF4 @ =0x040000D4
	str r4, [r0]
	ldr r1, _0800FFF8 @ =0x05000220
	str r1, [r0, #4]
	ldr r1, _0800FFFC @ =0x80000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r4, #0x20
	str r4, [r0]
	ldr r1, _08010000 @ =0x06011000
	str r1, [r0, #4]
	ldr r1, _08010004 @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0
	movs r0, #0x10
	strh r0, [r7]
	ldr r0, _08010008 @ =0x0000C058
	strh r0, [r7, #2]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r7, #4]
	adds r0, r5, #0
	adds r0, #0x9b
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6]
	ldr r1, _0801000C @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08010010 @ =0x0000FDFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	strb r2, [r5, #0x18]
	strb r2, [r5, #0x19]
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
	strb r2, [r5, #0xb]
	b _080101CE
	.align 2, 0
_0800FFE4: .4byte gTestimony
_0800FFE8: .4byte gUnknown_0200AFC0
_0800FFEC: .4byte gUnknown_08026E20
_0800FFF0: .4byte gEvidenceProfileData
_0800FFF4: .4byte 0x040000D4
_0800FFF8: .4byte 0x05000220
_0800FFFC: .4byte 0x80000010
_08010000: .4byte 0x06011000
_08010004: .4byte 0x80000400
_08010008: .4byte 0x0000C058
_0801000C: .4byte gIORegisters
_08010010: .4byte 0x0000FDFF
_08010014:
	ldrb r0, [r5, #0xb]
	cmp r0, #7
	bls _08010032
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	movs r1, #0
	strb r0, [r5, #0xa]
	strb r1, [r5, #0xb]
	b _08010036
_08010032:
	adds r0, #1
	strb r0, [r5, #0xb]
_08010036:
	adds r6, r5, #0
	adds r6, #0xa0
	b _080101CE
_0801003C:
	ldrb r0, [r5, #0xb]
	cmp r0, #0x25
	bhi _08010044
	b _080101B4
_08010044:
	ldrb r1, [r4, #0xc]
	movs r6, #8
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08010080
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7]
	movs r0, #0xf7
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	ldrb r1, [r3, #0xe]
	bl GetPsycheLockDataIndexByRoomAndPerson
	movs r2, #0x94
	lsls r2, r2, #2
	adds r1, r5, r2
	strb r0, [r1]
	ldr r0, _0801007C @ =0x00000A04
	str r0, [r5, #8]
	b _08010272
	.align 2, 0
_0801007C: .4byte 0x00000A04
_08010080:
	movs r3, #0x10
	mov r8, r3
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _0801012C
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4, #0xc]
	ldr r0, _080100FC @ =gMain
	ldr r1, _08010100 @ =0x00000256
	adds r0, r0, r1
	strb r2, [r0]
	movs r2, #0x94
	lsls r2, r2, #2
	adds r6, r5, r2
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r3, #0xd8
	lsls r3, r3, #1
	adds r0, r0, r3
	adds r0, r5, r0
	ldr r1, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r1, r4, r1
	ldrb r1, [r1]
	bl IsPresentedEvidenceValidForPsycheLock
	adds r3, r0, #0
	cmp r3, #0
	blt _08010104
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r5, r0
	lsls r1, r3, #1
	adds r1, r1, r0
	movs r3, #0xe8
	lsls r3, r3, #1
	adds r0, r5, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r3, #0x12
	adds r2, r2, r3
	strh r0, [r2]
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r5, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	bl ChangeScriptSection
	b _0801011C
	.align 2, 0
_080100FC: .4byte gMain
_08010100: .4byte 0x00000256
_08010104:
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r5, r1
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl ChangeScriptSection
_0801011C:
	movs r0, #1
	bl SlideTextbox
	ldr r0, _08010128 @ =0x00030A04
	str r0, [r5, #8]
	b _08010272
	.align 2, 0
_08010128: .4byte 0x00030A04
_0801012C:
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7]
	ldr r1, _0801016C @ =gInvestigation
	strb r3, [r1, #0x12]
	strb r6, [r1, #0x13]
	ldr r2, _08010170 @ =gIORegisters
	adds r2, #0x4a
	ldrh r1, [r2]
	orrs r0, r1
	orrs r0, r3
	movs r1, #1
	strb r1, [r5, #0x18]
	strb r1, [r5, #0x19]
	ldr r1, _08010174 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r6, _08010178 @ =gScriptContext
	ldrh r0, [r6, #0xc]
	ldr r1, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r1, r4, r1
	ldrb r1, [r1]
	bl sub_8010A34
	cmp r0, #0
	beq _0801017C
	bl ChangeScriptSection
	b _0801019E
	.align 2, 0
_0801016C: .4byte gInvestigation
_08010170: .4byte gIORegisters
_08010174: .4byte 0x0000FDFF
_08010178: .4byte gScriptContext
_0801017C:
	mov r0, r8
	ldrh r2, [r6, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _08010190
	ldrh r0, [r6, #0xc]
	adds r0, #1
	bl ChangeScriptSection
	b _08010194
_08010190:
	bl sub_800EBE8
_08010194:
	ldr r1, _080101A8 @ =gScriptContext
	ldr r0, _080101AC @ =0x0000FFEF
	ldrh r3, [r1, #0x1c]
	ands r0, r3
	strh r0, [r1, #0x1c]
_0801019E:
	ldr r1, _080101B0 @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	b _08010272
	.align 2, 0
_080101A8: .4byte gScriptContext
_080101AC: .4byte 0x0000FFEF
_080101B0: .4byte gUnknown_030037B8
_080101B4:
	adds r0, #1
	strb r0, [r5, #0xb]
	adds r1, r5, #0
	adds r1, #0x9b
	ldrb r0, [r1]
	adds r0, #0xc
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldrh r1, [r0]
	subs r1, #8
	strh r1, [r0]
	adds r6, r0, #0
_080101CE:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bgt _080101EC
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7]
	bl sub_8016ED8
	cmp r0, #0
	beq _08010264
	movs r0, #8
	bl SetOrQueueHPBarState
	b _08010264
_080101EC:
	movs r2, #0
	ldrsh r0, [r6, r2]
	bl fix_inverse
	adds r4, r0, #0
	ldr r3, _0801027C @ =gSineTable
	mov r8, r3
	adds r6, r5, #0
	adds r6, #0x9b
	ldrb r0, [r6]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _08010280 @ =gOamObjects
	strh r0, [r5, #6]
	ldrb r2, [r6]
	lsls r0, r2, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0xe]
	ldrb r1, [r6]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x16]
	ldrb r0, [r6]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x1e]
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r7]
	ldr r0, _08010284 @ =0x0000C058
	strh r0, [r7, #2]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r7, #4]
_08010264:
	ldr r4, _08010288 @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateRecordSprites
_08010272:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801027C: .4byte gSineTable
_08010280: .4byte gOamObjects
_08010284: .4byte 0x0000C058
_08010288: .4byte gCourtRecord

	thumb_func_start EvidenceAddedInit
EvidenceAddedInit: @ 0x0801028C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r1, _08010304 @ =gBG2MapBuffer
	movs r0, #0
	ldr r3, _08010308 @ =0x000003FF
	ldr r2, _0801030C @ =gIORegisters
	mov r8, r2
	movs r2, #0
_080102A0:
	strh r2, [r1]
	adds r0, #1
	adds r1, #2
	cmp r0, r3
	bls _080102A0
	mov r7, r8
	adds r7, #0x4a
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r0, #0
	movs r5, #0
	ldrh r0, [r7]
	orrs r0, r4
	strh r0, [r7]
	bl LoadEvidenceWindowGraphics
	adds r0, r6, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl LoadEvidenceGraphics
	ldrh r1, [r6, #0x2e]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	movs r1, #4
	bl SetBGMVolume
	movs r0, #0xf
	bl PlaySE
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	strb r5, [r6, #0xa]
	ldrh r2, [r7]
	orrs r4, r2
	strh r4, [r7]
	movs r0, #0xf8
	lsls r0, r0, #6
	mov r1, r8
	strh r0, [r1, #4]
	movs r0, #4
	ldrb r2, [r6, #0x1a]
	orrs r0, r2
	strb r0, [r6, #0x1a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010304: .4byte gBG2MapBuffer
_08010308: .4byte 0x000003FF
_0801030C: .4byte gIORegisters

	thumb_func_start EvidenceAddedMain
EvidenceAddedMain: @ 0x08010310
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateEvidenceSprites
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0801039A
	ldr r4, _080103A0 @ =gScriptContext
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0801039A
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	bne _0801034C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x1e
	bl SetBGMVolume
	movs r0, #1
	strb r0, [r5, #0xa]
_0801034C:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	bl sub_801A054
	ldr r1, _080103A4 @ =gJoypad
	adds r0, r6, #0
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0801036C
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801039A
_0801036C:
	movs r0, #0x2b
	bl PlaySE
	movs r0, #3
	movs r1, #0xe
	bl SlideInBG2Window
	movs r0, #2
	strb r0, [r5, #9]
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r1, #0
	ldrh r2, [r4, #0x1c]
	orrs r0, r2
	strh r0, [r4, #0x1c]
	ldr r0, _080103A8 @ =gBG1MapBuffer
	ldr r2, _080103AC @ =0x000004DC
	adds r1, r0, r2
	movs r2, #9
	strh r2, [r1]
	ldr r1, _080103B0 @ =0x000004DE
	adds r0, r0, r1
	strh r2, [r0]
_0801039A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080103A0: .4byte gScriptContext
_080103A4: .4byte gJoypad
_080103A8: .4byte gBG1MapBuffer
_080103AC: .4byte 0x000004DC
_080103B0: .4byte 0x000004DE

	thumb_func_start EvidenceAddedExit
EvidenceAddedExit: @ 0x080103B4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl UpdateBG2Window
	adds r0, r4, #0
	bl UpdateEvidenceSprites
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08010414
	ldr r1, _080103EC @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	subs r1, #8
	ldrb r0, [r1, #8]
	cmp r0, #4
	bne _08010414
	ldrb r1, [r1, #9]
	cmp r1, #6
	bne _080103F4
	ldr r0, _080103F0 @ =gInvestigation
	movs r1, #1
	bl SetInactiveActionButtons
	b _08010414
	.align 2, 0
_080103EC: .4byte gUnknown_030037B8
_080103F0: .4byte gInvestigation
_080103F4:
	ldrb r5, [r5, #9]
	cmp r5, #8
	bne _08010408
	ldr r0, _08010404 @ =gInvestigation
	movs r1, #4
	bl SetInactiveActionButtons
	b _08010414
	.align 2, 0
_08010404: .4byte gInvestigation
_08010408:
	cmp r1, #9
	bne _08010414
	ldr r0, _0801041C @ =gInvestigation
	movs r1, #8
	bl SetInactiveActionButtons
_08010414:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801041C: .4byte gInvestigation

	thumb_func_start sub_8010420
sub_8010420: @ 0x08010420
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08010472
	movs r0, #0
	strb r0, [r4, #9]
	ldrb r0, [r4, #8]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r4, #8]
	ldr r1, _08010478 @ =0x040000D4
	ldr r0, _0801047C @ =gUnknown_08026F8C
	ldrb r2, [r4, #8]
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08010480 @ =gGfx4bppTestimonyArrows
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _08010484 @ =0x06013400
	str r0, [r1, #4]
	ldr r2, _08010488 @ =0x80000040
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801048C @ =gUnknown_08026F90
	ldrb r4, [r4, #8]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _08010490 @ =0x06013480
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
_08010472:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010478: .4byte 0x040000D4
_0801047C: .4byte gUnknown_08026F8C
_08010480: .4byte gGfx4bppTestimonyArrows
_08010484: .4byte 0x06013400
_08010488: .4byte 0x80000040
_0801048C: .4byte gUnknown_08026F90
_08010490: .4byte 0x06013480

	thumb_func_start LoadEvidenceWindowGraphics
LoadEvidenceWindowGraphics: @ 0x08010494
	push {lr}
	movs r0, #1
	movs r1, #0xc
	bl SlideInBG2Window
	ldr r0, _0801050C @ =0x040000D4
	ldr r1, _08010510 @ =gGfx4bppTestimonyArrows
	str r1, [r0]
	ldr r1, _08010514 @ =0x06013400
	str r1, [r0, #4]
	ldr r2, _08010518 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801051C @ =gGfx4bppTestimonyArrows+0x180
	str r1, [r0]
	ldr r1, _08010520 @ =0x06013480
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08010524 @ =gGfx4bppControllerButtons
	str r1, [r0]
	ldr r1, _08010528 @ =0x06013800
	str r1, [r0, #4]
	adds r2, #0xc0
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801052C @ =gGfx4bppPresentBackTextTiles
	str r1, [r0]
	ldr r1, _08010530 @ =0x06013A00
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08010534 @ =gGfx4bppProfileTextTiles
	str r1, [r0]
	ldr r1, _08010538 @ =0x06013500
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801053C @ =gPalCrossExamUI
	str r1, [r0]
	ldr r1, _08010540 @ =0x05000260
	str r1, [r0, #4]
	subs r2, #0xf0
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08010544 @ =gPalCourtRecordActionText
	str r1, [r0]
	ldr r1, _08010548 @ =0x05000280
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801054C @ =gPalEvidenceProfileDesc
	str r1, [r0]
	ldr r1, _08010550 @ =0x05000240
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0801050C: .4byte 0x040000D4
_08010510: .4byte gGfx4bppTestimonyArrows
_08010514: .4byte 0x06013400
_08010518: .4byte 0x80000040
_0801051C: .4byte gGfx4bppTestimonyArrows+0x180
_08010520: .4byte 0x06013480
_08010524: .4byte gGfx4bppControllerButtons
_08010528: .4byte 0x06013800
_0801052C: .4byte gGfx4bppPresentBackTextTiles
_08010530: .4byte 0x06013A00
_08010534: .4byte gGfx4bppProfileTextTiles
_08010538: .4byte 0x06013500
_0801053C: .4byte gPalCrossExamUI
_08010540: .4byte 0x05000260
_08010544: .4byte gPalCourtRecordActionText
_08010548: .4byte 0x05000280
_0801054C: .4byte gPalEvidenceProfileDesc
_08010550: .4byte 0x05000240

	thumb_func_start UpdateRecordSprites
UpdateRecordSprites: @ 0x08010554
	push {r4, lr}
	adds r4, r0, #0
	bl UpdateEvidenceSprites
	movs r0, #4
	ldrb r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080105D8
	adds r0, r4, #0
	bl sub_8010420
	ldr r1, _08010578 @ =gOamObjects
	ldrb r0, [r4, #0xe]
	cmp r0, #1
	bls _0801057C
	movs r0, #0x30
	b _08010580
	.align 2, 0
_08010578: .4byte gOamObjects
_0801057C:
	movs r0, #0x80
	lsls r0, r0, #2
_08010580:
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r1, #2]
	ldr r0, _08010598 @ =0x000021A0
	strh r0, [r1, #4]
	adds r1, #8
	ldrb r4, [r4, #0xe]
	cmp r4, #1
	bls _0801059C
	movs r0, #0x30
	b _080105A0
	.align 2, 0
_08010598: .4byte 0x000021A0
_0801059C:
	movs r0, #0x80
	lsls r0, r0, #2
_080105A0:
	strh r0, [r1]
	ldr r0, _080105C4 @ =0x000040E0
	strh r0, [r1, #2]
	ldr r0, _080105C8 @ =0x000021A4
	strh r0, [r1, #4]
	ldr r0, _080105CC @ =gMain
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _080105BA
	cmp r0, #4
	beq _080105BA
	cmp r0, #5
	bne _080105D0
_080105BA:
	movs r0, #1
	bl UpdateRecordInfoActionSprites
	b _0801060A
	.align 2, 0
_080105C4: .4byte 0x000040E0
_080105C8: .4byte 0x000021A4
_080105CC: .4byte gMain
_080105D0:
	movs r0, #1
	bl UpdateRecordPresentActionSprites
	b _0801060A
_080105D8:
	ldr r1, _080105FC @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	ldr r0, _08010600 @ =gMain
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _080105F2
	cmp r0, #4
	beq _080105F2
	cmp r0, #5
	bne _08010604
_080105F2:
	movs r0, #0
	bl UpdateRecordInfoActionSprites
	b _0801060A
	.align 2, 0
_080105FC: .4byte gOamObjects
_08010600: .4byte gMain
_08010604:
	movs r0, #0
	bl UpdateRecordPresentActionSprites
_0801060A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start LoadEvidenceGraphics
LoadEvidenceGraphics: @ 0x08010610
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08010668 @ =gUnknown_0200AFC0
	ldr r1, _0801066C @ =gUnknown_08026E20
	ldr r0, _08010670 @ =gEvidenceProfileData
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrh r2, [r5, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r4, _08010674 @ =0x040000D4
	str r6, [r4]
	ldr r0, _08010678 @ =0x05000220
	str r0, [r4, #4]
	ldr r0, _0801067C @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r6, #0x20
	str r6, [r4]
	ldr r0, _08010680 @ =0x06015000
	str r0, [r4, #4]
	ldr r0, _08010684 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r6, [r5]
	ldr r5, _08010668 @ =gUnknown_0200AFC0
	adds r0, r6, #0
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [r4]
	ldr r0, _08010688 @ =0x06013C00
	str r0, [r4, #4]
	ldr r0, _0801068C @ =0x80000A00
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010668: .4byte gUnknown_0200AFC0
_0801066C: .4byte gUnknown_08026E20
_08010670: .4byte gEvidenceProfileData
_08010674: .4byte 0x040000D4
_08010678: .4byte 0x05000220
_0801067C: .4byte 0x80000010
_08010680: .4byte 0x06015000
_08010684: .4byte 0x80000400
_08010688: .4byte 0x06013C00
_0801068C: .4byte 0x80000A00

	thumb_func_start UpdateEvidenceSprites
UpdateEvidenceSprites: @ 0x08010690
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, _080106F4 @ =gOamObjects+0x110
	movs r0, #0x18
	strh r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #8
	strh r0, [r1, #2]
	ldrh r2, [r5, #4]
	adds r0, r2, r0
	strh r0, [r1, #2]
	movs r0, #0x94
	lsls r0, r0, #5
	strh r0, [r1, #4]
	adds r1, #8
	movs r3, #0
	movs r6, #0x18
	ldr r4, _080106F8 @ =0x000021E0
	ldr r2, _080106FC @ =0x00008048
_080106B6:
	strh r6, [r1]
	strh r2, [r1, #2]
	ldrh r7, [r5, #4]
	adds r0, r7, r2
	strh r0, [r1, #2]
	strh r4, [r1, #4]
	adds r1, #8
	adds r4, #0x10
	adds r2, #0x20
	adds r3, #1
	cmp r3, #4
	bls _080106B6
	movs r3, #0
	movs r6, #0x38
	ldr r4, _08010700 @ =0x00002230
	ldr r2, _080106FC @ =0x00008048
_080106D6:
	strh r6, [r1]
	strh r2, [r1, #2]
	ldrh r7, [r5, #4]
	adds r0, r7, r2
	strh r0, [r1, #2]
	strh r4, [r1, #4]
	adds r1, #8
	adds r4, #0x10
	adds r2, #0x20
	adds r3, #1
	cmp r3, #4
	bls _080106D6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080106F4: .4byte gOamObjects+0x110
_080106F8: .4byte 0x000021E0
_080106FC: .4byte 0x00008048
_08010700: .4byte 0x00002230

	thumb_func_start ClearEvidenceSprites
ClearEvidenceSprites: @ 0x08010704
	ldr r1, _0801071C @ =gOamObjects+0x110
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r1, #8
	movs r2, #0
_08010710:
	strh r0, [r1]
	adds r1, #8
	adds r2, #1
	cmp r2, #9
	bls _08010710
	bx lr
	.align 2, 0
_0801071C: .4byte gOamObjects+0x110

	thumb_func_start UpdateRecordInfoActionSprites
UpdateRecordInfoActionSprites: @ 0x08010720
	ldr r2, _08010750 @ =gOamObjects+0x168
	cmp r0, #0
	beq _08010770
	movs r0, #0x60
	strh r0, [r2]
	ldr r0, _08010754 @ =0x000040A0
	strh r0, [r2, #2]
	ldr r0, _08010758 @ =0x000041C8
	strh r0, [r2, #4]
	adds r2, #8
	ldr r1, _0801075C @ =0x00004060
	strh r1, [r2]
	ldr r0, _08010760 @ =0x000080B0
	strh r0, [r2, #2]
	ldr r0, _08010764 @ =0x000041A8
	strh r0, [r2, #4]
	adds r2, #8
	strh r1, [r2]
	ldr r0, _08010768 @ =0x000080D0
	strh r0, [r2, #2]
	ldr r0, _0801076C @ =0x000041B0
	strh r0, [r2, #4]
	b _0801077C
	.align 2, 0
_08010750: .4byte gOamObjects+0x168
_08010754: .4byte 0x000040A0
_08010758: .4byte 0x000041C8
_0801075C: .4byte 0x00004060
_08010760: .4byte 0x000080B0
_08010764: .4byte 0x000041A8
_08010768: .4byte 0x000080D0
_0801076C: .4byte 0x000041B0
_08010770:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	adds r2, #8
	strh r0, [r2]
	strh r0, [r2, #8]
_0801077C:
	bx lr
	.align 2, 0

	thumb_func_start UpdateRecordPresentActionSprites
UpdateRecordPresentActionSprites: @ 0x08010780
	ldr r3, _080107E0 @ =gOamObjects+0x168
	cmp r0, #0
	bne _08010788
	b _0801089C
_08010788:
	ldr r0, _080107E4 @ =gMain
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801080C
	movs r2, #0x60
	strh r2, [r3]
	ldr r0, _080107E8 @ =0x0000403C
	strh r0, [r3, #2]
	ldr r0, _080107EC @ =0x000041C8
	strh r0, [r3, #4]
	adds r3, #8
	ldr r1, _080107F0 @ =0x00004060
	strh r1, [r3]
	ldr r0, _080107F4 @ =0x0000804C
	strh r0, [r3, #2]
	ldr r0, _080107F8 @ =0x000041A8
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _080107FC @ =0x0000806C
	strh r0, [r3, #2]
	ldr r0, _08010800 @ =0x000041B0
	strh r0, [r3, #4]
	adds r3, #0x50
	strh r2, [r3]
	subs r0, #0xe8
	strh r0, [r3, #2]
	adds r0, #0xf8
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010804 @ =0x000080D8
	strh r0, [r3, #2]
	ldr r0, _08010808 @ =0x000041D0
	strh r0, [r3, #4]
	adds r3, #8
	movs r0, #0x80
	lsls r0, r0, #2
	b _080108B4
	.align 2, 0
_080107E0: .4byte gOamObjects+0x168
_080107E4: .4byte gMain
_080107E8: .4byte 0x0000403C
_080107EC: .4byte 0x000041C8
_080107F0: .4byte 0x00004060
_080107F4: .4byte 0x0000804C
_080107F8: .4byte 0x000041A8
_080107FC: .4byte 0x0000806C
_08010800: .4byte 0x000041B0
_08010804: .4byte 0x000080D8
_08010808: .4byte 0x000041D0
_0801080C:
	movs r2, #0x60
	strh r2, [r3]
	ldr r0, _08010864 @ =0x0000403C
	strh r0, [r3, #2]
	ldr r0, _08010868 @ =0x000041C8
	strh r0, [r3, #4]
	adds r3, #8
	ldr r1, _0801086C @ =0x00004060
	strh r1, [r3]
	ldr r0, _08010870 @ =0x0000804C
	strh r0, [r3, #2]
	ldr r0, _08010874 @ =0x000041A8
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010878 @ =0x0000806C
	strh r0, [r3, #2]
	ldr r0, _0801087C @ =0x000041B0
	strh r0, [r3, #4]
	adds r3, #0x50
	strh r2, [r3]
	ldr r0, _08010880 @ =0x0000408C
	strh r0, [r3, #2]
	ldr r0, _08010884 @ =0x000041C0
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010888 @ =0x0000809C
	strh r0, [r3, #2]
	ldr r0, _0801088C @ =0x000041D0
	strh r0, [r3, #4]
	adds r3, #8
	strh r2, [r3]
	ldr r0, _08010890 @ =0x000040C8
	strh r0, [r3, #2]
	adds r0, #0xfc
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010894 @ =0x000080D8
	strh r0, [r3, #2]
	ldr r0, _08010898 @ =0x000041D8
	strh r0, [r3, #4]
	b _080108B8
	.align 2, 0
_08010864: .4byte 0x0000403C
_08010868: .4byte 0x000041C8
_0801086C: .4byte 0x00004060
_08010870: .4byte 0x0000804C
_08010874: .4byte 0x000041A8
_08010878: .4byte 0x0000806C
_0801087C: .4byte 0x000041B0
_08010880: .4byte 0x0000408C
_08010884: .4byte 0x000041C0
_08010888: .4byte 0x0000809C
_0801088C: .4byte 0x000041D0
_08010890: .4byte 0x000040C8
_08010894: .4byte 0x000080D8
_08010898: .4byte 0x000041D8
_0801089C:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	adds r3, #8
	strh r0, [r3]
	adds r3, #8
	strh r0, [r3]
	adds r3, #0x50
	strh r0, [r3]
	adds r3, #8
	strh r0, [r3]
	adds r3, #8
_080108B4:
	strh r0, [r3]
	strh r0, [r3, #8]
_080108B8:
	bx lr
	.align 2, 0

	thumb_func_start sub_80108BC
sub_80108BC: @ 0x080108BC
	ldr r0, _080108F0 @ =gOamObjects+0x168
	movs r2, #0x90
	strh r2, [r0]
	ldr r1, _080108F4 @ =0x000040B8
	strh r1, [r0, #2]
	ldr r1, _080108F8 @ =0x000041C4
	strh r1, [r0, #4]
	adds r0, #8
	strh r2, [r0]
	subs r1, #0xfc
	strh r1, [r0, #2]
	ldr r1, _080108FC @ =0x000041CC
	strh r1, [r0, #4]
	adds r0, #8
	ldr r1, _08010900 @ =0x00004090
	strh r1, [r0]
	ldr r1, _08010904 @ =0x000080D8
	strh r1, [r0, #2]
	ldr r1, _08010908 @ =0x000041D8
	strh r1, [r0, #4]
	adds r0, #0x50
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	strh r1, [r0, #8]
	bx lr
	.align 2, 0
_080108F0: .4byte gOamObjects+0x168
_080108F4: .4byte 0x000040B8
_080108F8: .4byte 0x000041C4
_080108FC: .4byte 0x000041CC
_08010900: .4byte 0x00004090
_08010904: .4byte 0x000080D8
_08010908: .4byte 0x000041D8

	thumb_func_start FindEvidenceInCourtRecord
FindEvidenceInCourtRecord: @ 0x0801090C
	push {r4, lr}
	adds r4, r1, #0
	cmp r0, #0
	beq _08010928
	ldr r3, _08010920 @ =gUnknown_030028FC
	adds r0, r3, #0
	subs r0, #0x3c
	ldrb r1, [r0, #0x11]
	b _08010930
	.align 2, 0
_08010920: .4byte gUnknown_030028FC
_08010924:
	adds r0, r2, #0
	b _08010948
_08010928:
	ldr r3, _08010950 @ =gUnknown_030028DC
	adds r0, r3, #0
	subs r0, #0x1c
	ldrb r1, [r0, #0x10]
_08010930:
	movs r2, #0
	cmp r2, r1
	bhs _08010944
_08010936:
	ldrb r0, [r3]
	cmp r0, r4
	beq _08010924
	adds r2, #1
	adds r3, #1
	cmp r2, r1
	blo _08010936
_08010944:
	movs r0, #1
	rsbs r0, r0, #0
_08010948:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010950: .4byte gUnknown_030028DC

	thumb_func_start FindFirstEmptySlotInCourtRecord
FindFirstEmptySlotInCourtRecord: @ 0x08010954
	ldr r2, _08010968 @ =gUnknown_030028DC
	cmp r0, #0
	beq _0801095C
	adds r2, #0x20
_0801095C:
	movs r1, #0
_0801095E:
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0801096C
	adds r0, r1, #0
	b _08010978
	.align 2, 0
_08010968: .4byte gUnknown_030028DC
_0801096C:
	adds r1, #1
	adds r2, #1
	cmp r1, #0x1f
	bls _0801095E
	movs r0, #1
	rsbs r0, r0, #0
_08010978:
	bx lr
	.align 2, 0

	thumb_func_start SortCourtRecordAndSyncListCount
SortCourtRecordAndSyncListCount: @ 0x0801097C
	push {r4, r5, r6, lr}
	sub sp, #4
	mov ip, r0
	ldr r4, _08010A20 @ =gUnknown_0200AFC0
	ldr r1, _08010A24 @ =0x040000D4
	mov r3, ip
	adds r3, #0x3c
	str r3, [r1]
	str r4, [r1, #4]
	ldr r0, _08010A28 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r2, sp
	ldr r5, _08010A2C @ =0x0000FFFF
	adds r0, r5, #0
	strh r0, [r2]
	str r2, [r1]
	str r3, [r1, #4]
	ldr r0, _08010A30 @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	mov r6, ip
	strb r0, [r6, #0x11]
	movs r2, #0
_080109AE:
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080109C8
	mov r5, ip
	ldrb r5, [r5, #0x11]
	adds r0, r5, r3
	strb r1, [r0]
	mov r6, ip
	ldrb r0, [r6, #0x11]
	adds r0, #1
	strb r0, [r6, #0x11]
_080109C8:
	adds r2, #1
	cmp r2, #0x1f
	bls _080109AE
	ldr r1, _08010A24 @ =0x040000D4
	mov r3, ip
	adds r3, #0x1c
	str r3, [r1]
	str r4, [r1, #4]
	ldr r0, _08010A28 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r2, sp
	ldr r5, _08010A2C @ =0x0000FFFF
	adds r0, r5, #0
	strh r0, [r2]
	str r2, [r1]
	str r3, [r1, #4]
	ldr r0, _08010A30 @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	mov r6, ip
	strb r0, [r6, #0x10]
	movs r2, #0
_080109F8:
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08010A12
	mov r5, ip
	ldrb r5, [r5, #0x10]
	adds r0, r5, r3
	strb r1, [r0]
	mov r6, ip
	ldrb r0, [r6, #0x10]
	adds r0, #1
	strb r0, [r6, #0x10]
_08010A12:
	adds r2, #1
	cmp r2, #0x1f
	bls _080109F8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010A20: .4byte gUnknown_0200AFC0
_08010A24: .4byte 0x040000D4
_08010A28: .4byte 0x80000010
_08010A2C: .4byte 0x0000FFFF
_08010A30: .4byte 0x81000010

	thumb_func_start sub_8010A34
sub_8010A34: @ 0x08010A34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	ldr r0, _08010A8C @ =gUnknown_0814D998
	ldr r1, _08010A90 @ =gMain
	adds r1, #0xc1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, [r1]
	ldr r0, _08010A94 @ =0x0000FFFF
	ldrh r1, [r4]
	cmp r1, r0
	beq _08010AE0
	ldr r6, _08010A98 @ =gUnknown_0300710A
	movs r1, #0xf0
	lsls r1, r1, #8
	adds r5, r1, #0
	mov sb, r0
_08010A60:
	ldrb r0, [r4, #6]
	cmp r0, #0xff
	beq _08010A72
	adds r1, r0, #0
	movs r0, #0
	bl GetFlag
	cmp r0, #0
	beq _08010AD8
_08010A72:
	ldr r0, _08010A9C @ =gScriptContext
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _08010AA0
	ldrh r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	adds r2, r0, #0
	cmp r1, #0
	bne _08010AAC
	b _08010AD8
	.align 2, 0
_08010A8C: .4byte gUnknown_0814D998
_08010A90: .4byte gMain
_08010A94: .4byte 0x0000FFFF
_08010A98: .4byte gUnknown_0300710A
_08010A9C: .4byte gScriptContext
_08010AA0:
	ldrh r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	adds r2, r0, #0
	cmp r1, #0
	bne _08010AD8
_08010AAC:
	ldr r1, _08010ACC @ =0x00000FFF
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r8
	bne _08010AD8
	ldrh r0, [r4, #2]
	cmp r0, r7
	beq _08010AC0
	cmp r0, #0xff
	bne _08010AD8
_08010AC0:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _08010AD0
	movs r0, #0
	b _08010AD2
	.align 2, 0
_08010ACC: .4byte 0x00000FFF
_08010AD0:
	movs r0, #1
_08010AD2:
	strb r0, [r6]
	ldrh r0, [r4, #4]
	b _08010AEA
_08010AD8:
	adds r4, #8
	ldrh r0, [r4]
	cmp r0, sb
	bne _08010A60
_08010AE0:
	ldr r0, _08010AF8 @ =gScriptContext
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
_08010AEA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010AF8: .4byte gScriptContext

	thumb_func_start GetEvidenceCommentSection
GetEvidenceCommentSection: @ 0x08010AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _08010B88 @ =gUnknown_0814D9F4
	adds r0, #0xc1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	ldrb r0, [r3, #4]
	cmp r0, #0xff
	beq _08010B40
	mov r0, ip
	adds r0, #0xc0
	adds r1, r0, #0
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	beq _08010B4E
_08010B30:
	adds r3, #0x10
	ldrb r0, [r3, #4]
	cmp r0, #0xff
	beq _08010B40
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bne _08010B30
_08010B40:
	mov r0, ip
	adds r0, #0xc0
	adds r1, r0, #0
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bne _08010B9A
_08010B4E:
	ldr r0, _08010B8C @ =gAnimation+0x52
	ldrb r7, [r0]
	adds r2, r1, #0
	ldrb r6, [r2]
	movs r5, #0x99
	lsls r5, r5, #2
	add r5, ip
_08010B5C:
	ldrb r0, [r3, #3]
	cmp r7, r0
	bne _08010B92
	ldrb r1, [r3, #4]
	cmp r8, r1
	bne _08010B92
	ldrb r1, [r2]
	adds r0, r1, r5
	ldrb r1, [r3, #1]
	ldrb r0, [r0]
	cmp r0, r1
	beq _08010B78
	cmp r1, #0xff
	bne _08010B92
_08010B78:
	ldrb r0, [r3, #2]
	cmp sb, r0
	beq _08010B82
	cmp r0, #0xff
	bne _08010B90
_08010B82:
	ldrh r0, [r3, #6]
	b _08010B9C
	.align 2, 0
_08010B88: .4byte gUnknown_0814D9F4
_08010B8C: .4byte gAnimation+0x52
_08010B90:
	ldrh r4, [r3, #8]
_08010B92:
	adds r3, #0x10
	ldrb r0, [r3]
	cmp r0, r6
	beq _08010B5C
_08010B9A:
	adds r0, r4, #0
_08010B9C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start UpdateItemPlate
UpdateItemPlate: @ 0x08010BA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08010BD0 @ =gOamObjects+0x208
	bl sub_8016ED8
	cmp r0, #1
	bne _08010BB8
	adds r5, #0x38
_08010BB8:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #6
	bls _08010BC6
	b _08010DD2
_08010BC6:
	lsls r0, r1, #2
	ldr r1, _08010BD4 @ =_08010BD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010BD0: .4byte gOamObjects+0x208
_08010BD4: .4byte _08010BD8
_08010BD8: @ jump table
	.4byte _08010DD2 @ case 0
	.4byte _08010BF4 @ case 1
	.4byte _08010C5A @ case 2
	.4byte _08010C9C @ case 3
	.4byte _08010CDA @ case 4
	.4byte _08010D64 @ case 5
	.4byte _08010DC8 @ case 6
_08010BF4:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5]
	bl sub_8016ED8
	cmp r0, #0
	bne _08010C18
	ldr r1, _08010C0C @ =0x040000D4
	ldr r0, _08010C10 @ =gOamObjects+0x208
	str r0, [r1]
	ldr r0, _08010C14 @ =0x07000208
	b _08010C20
	.align 2, 0
_08010C0C: .4byte 0x040000D4
_08010C10: .4byte gOamObjects+0x208
_08010C14: .4byte 0x07000208
_08010C18:
	ldr r1, _08010C3C @ =0x040000D4
	ldr r0, _08010C40 @ =gOamObjects+0x240
	str r0, [r1]
	ldr r0, _08010C44 @ =0x07000240
_08010C20:
	str r0, [r1, #4]
	ldr r0, _08010C48 @ =0x80000004
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010C4C
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #4
	b _08010C52
	.align 2, 0
_08010C3C: .4byte 0x040000D4
_08010C40: .4byte gOamObjects+0x240
_08010C44: .4byte 0x07000240
_08010C48: .4byte 0x80000004
_08010C4C:
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #6
_08010C52:
	strb r0, [r1]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08010C5A:
	adds r0, r4, #0
	bl sub_801100C
	adds r0, r4, #0
	adds r0, #0x9e
	ldrb r0, [r0]
	cmp r0, #2
	beq _08010C6C
	b _08010DD2
_08010C6C:
	ldr r3, _08010C98 @ =gBG1MapBuffer
	adds r0, r3, #0
	adds r0, #0x42
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x3e
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #0xc
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #0x42
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	strb r2, [r6]
	b _08010DD2
	.align 2, 0
_08010C98: .4byte gBG1MapBuffer
_08010C9C:
	adds r0, r4, #0
	bl sub_8010DD8
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010CBC
	ldr r0, _08010CB8 @ =0x0000C010
	strh r0, [r5, #2]
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #3
	b _08010CC6
	.align 2, 0
_08010CB8: .4byte 0x0000C010
_08010CBC:
	ldr r0, _08010CE4 @ =0x0000C0A0
	strh r0, [r5, #2]
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #5
_08010CC6:
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r5, #4]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08010CDA:
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	bne _08010CE8
	movs r0, #6
	b _08010DD0
	.align 2, 0
_08010CE4: .4byte 0x0000C0A0
_08010CE8:
	adds r0, r4, #0
	bl sub_801100C
	adds r0, r4, #0
	adds r0, #0x9e
	ldrb r0, [r0]
	cmp r0, #1
	bne _08010CFC
	movs r0, #0x10
	strh r0, [r5]
_08010CFC:
	ldrb r4, [r4, #8]
	cmp r4, #6
	bls _08010DD2
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5]
	bl sub_8016ED8
	cmp r0, #0
	bne _08010D28
	ldr r1, _08010D1C @ =0x040000D4
	ldr r0, _08010D20 @ =gOamObjects+0x208
	str r0, [r1]
	ldr r0, _08010D24 @ =0x07000208
	b _08010D30
	.align 2, 0
_08010D1C: .4byte 0x040000D4
_08010D20: .4byte gOamObjects+0x208
_08010D24: .4byte 0x07000208
_08010D28:
	ldr r1, _08010D50 @ =0x040000D4
	ldr r0, _08010D54 @ =gOamObjects+0x240
	str r0, [r1]
	ldr r0, _08010D58 @ =0x07000240
_08010D30:
	str r0, [r1, #4]
	ldr r0, _08010D5C @ =0x80000004
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _08010D60 @ =gBG1MapBuffer
	movs r2, #0
	movs r0, #0xb0
	lsls r0, r0, #1
_08010D40:
	strh r2, [r1]
	subs r0, #1
	adds r1, #2
	cmp r0, #0
	bne _08010D40
	ldrb r0, [r6]
	adds r0, #1
	b _08010DD0
	.align 2, 0
_08010D50: .4byte 0x040000D4
_08010D54: .4byte gOamObjects+0x240
_08010D58: .4byte 0x07000240
_08010D5C: .4byte 0x80000004
_08010D60: .4byte gBG1MapBuffer
_08010D64:
	ldrb r2, [r4, #8]
	cmp r2, #6
	bhi _08010DD2
	adds r0, r4, #0
	bl sub_8010DD8
	movs r1, #0
	movs r0, #0x10
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010D88
	ldr r0, _08010D84 @ =0x0000C010
	b _08010D8A
	.align 2, 0
_08010D84: .4byte 0x0000C010
_08010D88:
	ldr r0, _08010DB8 @ =0x0000C0A0
_08010D8A:
	strh r0, [r5, #2]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r5, #4]
	ldr r1, _08010DBC @ =gMain
	ldr r0, _08010DC0 @ =0x00000A04
	ldrh r1, [r1, #8]
	cmp r1, r0
	bne _08010DAC
	ldr r1, _08010DC4 @ =gIORegisters
	adds r1, #0x4a
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
_08010DAC:
	adds r0, r4, #0
	bl sub_801100C
	movs r0, #4
	b _08010DD0
	.align 2, 0
_08010DB8: .4byte 0x0000C0A0
_08010DBC: .4byte gMain
_08010DC0: .4byte 0x00000A04
_08010DC4: .4byte gIORegisters
_08010DC8:
	ldrb r4, [r4, #8]
	cmp r4, #0xa
	beq _08010DD2
	movs r0, #5
_08010DD0:
	strb r0, [r6]
_08010DD2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8010DD8
sub_8010DD8: @ 0x08010DD8
	push {r4, lr}
	ldr r4, _08010E18 @ =gUnknown_0200AFC0
	ldr r2, _08010E1C @ =gUnknown_08026E20
	ldr r1, _08010E20 @ =gEvidenceProfileData
	adds r0, #0x98
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08010E24 @ =0x040000D4
	str r4, [r0]
	ldr r1, _08010E28 @ =0x05000220
	str r1, [r0, #4]
	ldr r1, _08010E2C @ =0x80000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r4, #0x20
	str r4, [r0]
	ldr r1, _08010E30 @ =0x06011000
	str r1, [r0, #4]
	ldr r1, _08010E34 @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010E18: .4byte gUnknown_0200AFC0
_08010E1C: .4byte gUnknown_08026E20
_08010E20: .4byte gEvidenceProfileData
_08010E24: .4byte 0x040000D4
_08010E28: .4byte 0x05000220
_08010E2C: .4byte 0x80000010
_08010E30: .4byte 0x06011000
_08010E34: .4byte 0x80000400

	thumb_func_start sub_8010E38
sub_8010E38: @ 0x08010E38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r4, _08010F24 @ =gUnknown_030020C2
	adds r4, #2
	movs r2, #0
	adds r3, r7, #0
	adds r3, #0x9c
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	ldr r1, _08010F24 @ =gUnknown_030020C2
	mov r8, r1
	cmp r2, r0
	bhs _08010E90
	adds r6, r3, #0
	movs r0, #0x20
	mov ip, r0
_08010E5E:
	movs r1, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r5, r2, #1
	cmp r1, r0
	bhs _08010E7A
	movs r2, #0x38
_08010E6C:
	strh r2, [r4]
	adds r4, #2
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	blo _08010E6C
_08010E7A:
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r2, ip
	subs r0, r2, r1
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r2, r5, #0
	adds r3, r6, #0
	adds r1, #1
	cmp r2, r1
	blo _08010E5E
_08010E90:
	mov r4, r8
	movs r0, #0x30
	strh r0, [r4]
	adds r4, #2
	movs r2, #0
	adds r1, r7, #0
	adds r1, #0x9c
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r3, r1, #0
	cmp r2, r0
	bhs _08010EB8
	movs r5, #0x31
_08010EAA:
	strh r5, [r4]
	adds r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010EAA
_08010EB8:
	movs r0, #0x32
	strh r0, [r4]
	adds r5, r3, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	adds r0, #0x40
	mov r1, r8
	adds r4, r0, r1
	movs r0, #0x35
	strh r0, [r4]
	adds r4, #2
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bhs _08010EEA
	movs r1, #0x36
_08010EDC:
	strh r1, [r4]
	adds r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r2, r0
	blo _08010EDC
_08010EEA:
	movs r0, #0x37
	strh r0, [r4]
	mov r4, r8
	adds r4, #0x40
	movs r2, #0
	adds r1, r3, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bhs _08010F1A
	movs r5, #0x33
	movs r3, #0x34
_08010F02:
	strh r5, [r4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0, #2]
	adds r4, #0x40
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010F02
_08010F1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010F24: .4byte gUnknown_030020C2

	thumb_func_start sub_8010F28
sub_8010F28: @ 0x08010F28
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _08011008 @ =gUnknown_030020F8
	subs r4, #2
	movs r2, #0
	adds r3, r7, #0
	adds r3, #0x9c
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	ldr r1, _08011008 @ =gUnknown_030020F8
	mov ip, r1
	cmp r2, r0
	bhs _08010F76
	adds r6, r3, #0
_08010F46:
	movs r1, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r5, r2, #1
	cmp r1, r0
	bhs _08010F62
	movs r2, #0x38
_08010F54:
	strh r2, [r4]
	subs r4, #2
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	blo _08010F54
_08010F62:
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, #0x40
	adds r4, r4, r0
	adds r2, r5, #0
	adds r3, r6, #0
	adds r1, #1
	cmp r2, r1
	blo _08010F46
_08010F76:
	mov r4, ip
	movs r0, #0x32
	strh r0, [r4]
	subs r4, #2
	movs r2, #0
	adds r1, r7, #0
	adds r1, #0x9c
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r3, r1, #0
	cmp r2, r0
	bhs _08010F9E
	movs r5, #0x31
_08010F90:
	strh r5, [r4]
	subs r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010F90
_08010F9E:
	movs r0, #0x30
	strh r0, [r4]
	adds r5, r3, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	adds r0, #0x40
	mov r1, ip
	adds r4, r0, r1
	movs r0, #0x37
	strh r0, [r4]
	subs r4, #2
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bhs _08010FD0
	movs r1, #0x36
_08010FC2:
	strh r1, [r4]
	subs r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r2, r0
	blo _08010FC2
_08010FD0:
	movs r0, #0x35
	strh r0, [r4]
	mov r4, ip
	adds r4, #0x40
	movs r2, #0
	adds r1, r3, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bhs _08011002
	movs r5, #0x34
	movs r3, #0x33
_08010FE8:
	strh r5, [r4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	subs r0, r4, r0
	subs r0, #2
	strh r3, [r0]
	adds r4, #0x40
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010FE8
_08011002:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011008: .4byte gUnknown_030020F8

	thumb_func_start sub_801100C
sub_801100C: @ 0x0801100C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x9e
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801102A
	ldr r1, _08011040 @ =gUnknown_030020C0
	movs r0, #0
	ldr r3, _08011044 @ =0x0000013F
	movs r2, #0
_08011020:
	strh r2, [r1]
	adds r0, #1
	adds r1, #2
	cmp r0, r3
	bls _08011020
_0801102A:
	adds r0, r4, #0
	adds r0, #0x9e
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #6
	bhi _08011088
	lsls r0, r1, #2
	ldr r1, _08011048 @ =_0801104C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08011040: .4byte gUnknown_030020C0
_08011044: .4byte 0x0000013F
_08011048: .4byte _0801104C
_0801104C: @ jump table
	.4byte _08011088 @ case 0
	.4byte _08011068 @ case 1
	.4byte _08011088 @ case 2
	.4byte _0801107A @ case 3
	.4byte _0801107A @ case 4
	.4byte _08011082 @ case 5
	.4byte _08011082 @ case 6
_08011068:
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801107A
	adds r0, r4, #0
	bl sub_8010F28
	b _08011088
_0801107A:
	adds r0, r4, #0
	bl sub_8010E38
	b _08011088
_08011082:
	adds r0, r4, #0
	bl sub_8010F28
_08011088:
	adds r1, r4, #0
	adds r1, #0x9d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080110DA
	movs r0, #0
	strb r0, [r1]
	adds r3, r5, #0
	ldrb r0, [r3]
	cmp r0, #4
	beq _080110A8
	cmp r0, #6
	bne _080110C2
_080110A8:
	adds r1, r4, #0
	adds r1, #0x9c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080110BC
	subs r0, r2, #1
	strb r0, [r1]
	b _080110DA
_080110BC:
	movs r0, #2
	strb r0, [r3]
	b _080110DA
_080110C2:
	adds r1, r4, #0
	adds r1, #0x9c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #7
	bgt _080110D6
	adds r0, r2, #1
	strb r0, [r1]
	b _080110DA
_080110D6:
	movs r0, #1
	strb r0, [r5]
_080110DA:
	pop {r4, r5}
	pop {r0}
	bx r0
