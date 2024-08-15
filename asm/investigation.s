	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start SetRoomSeq
SetRoomSeq: @ 0x0800BF38
	ldr r2, _0800BF48 @ =gMain
	movs r3, #0x99
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r0, r0, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0800BF48: .4byte gMain

	thumb_func_start sub_800BF4C
sub_800BF4C: @ 0x0800BF4C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldr r2, _0800BF78 @ =gMain
	movs r4, #0xa4
	lsls r4, r4, #2
	adds r0, r2, r4
	ldrh r0, [r0]
	cmp r1, r0
	bhs _0800BF86
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r4, r2, r5
	adds r2, r0, #0
_0800BF6A:
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	bne _0800BF7C
	movs r0, #1
	b _0800BF88
	.align 2, 0
_0800BF78: .4byte gMain
_0800BF7C:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _0800BF6A
_0800BF86:
	movs r0, #0
_0800BF88:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetInactiveActionButtons
SetInactiveActionButtons: @ 0x0800BF90
	adds r2, r0, #0
	strb r1, [r2, #8]
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _0800BFA0
	movs r0, #0xf3
	ands r0, r1
	strb r0, [r2, #8]
_0800BFA0:
	bx lr
	.align 2, 0

	thumb_func_start InvestigationProcess
InvestigationProcess: @ 0x0800BFA4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, #5
	beq _0800BFC2
	ldr r0, _0800BFE4 @ =gUnknown_0814DB08
	adds r1, r5, #0
	adds r1, #0xc1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
_0800BFC2:
	ldr r1, _0800BFE8 @ =gInvestigationProcessStates
	ldrb r2, [r5, #9]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, _0800BFEC @ =gInvestigation
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r0, r4, #0
	bl sub_800E4F8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFE4: .4byte gUnknown_0814DB08
_0800BFE8: .4byte gInvestigationProcessStates
_0800BFEC: .4byte gInvestigation

	thumb_func_start sub_800BFF0
sub_800BFF0: @ 0x0800BFF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	ldr r7, _0800C1F8 @ =gIORegisters
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _0800C1FC @ =0x040000D4
	str r0, [r4]
	ldr r0, _0800C200 @ =gTestimony
	str r0, [r4, #4]
	ldr r0, _0800C204 @ =0x81000004
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, sp
	strh r5, [r0]
	str r0, [r4]
	ldr r0, _0800C208 @ =gInvestigation
	str r0, [r4, #4]
	ldr r0, _0800C20C @ =0x8100000E
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl HideAllSprites
	bl InitBGs
	bl ResetAnimationSystem
	bl LoadCurrentScriptIntoRam
	adds r1, r7, #0
	adds r1, #0x4a
	movs r0, #0xfa
	lsls r0, r0, #5
	strh r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r7]
	ldr r0, _0800C210 @ =0x00003D01
	strh r0, [r7, #2]
	adds r0, #0xff
	strh r0, [r7, #4]
	ldr r0, _0800C214 @ =0x00003FC7
	strh r0, [r7, #6]
	ldr r0, _0800C218 @ =gGfxSaveGameTiles
	str r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r1, _0800C21C @ =0x80000800
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C220 @ =gGfx4bppInvestigationActions
	str r0, [r4]
	ldr r0, _0800C224 @ =0x06012000
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C228 @ =gPalActionButtons1
	str r0, [r4]
	ldr r0, _0800C22C @ =0x050002A0
	str r0, [r4, #4]
	ldr r3, _0800C230 @ =0x80000020
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C234 @ =gGfx4bppInvestigationScrollButton
	str r0, [r4]
	ldr r0, _0800C238 @ =0x06013000
	str r0, [r4, #4]
	ldr r2, _0800C23C @ =0x80000100
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C240 @ =gPalInvestigationScrollPrompt
	str r0, [r4]
	ldr r0, _0800C244 @ =0x050002E0
	str r0, [r4, #4]
	ldr r1, _0800C248 @ =0x80000010
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C24C @ =gGfxExamineCursor
	str r0, [r4]
	ldr r0, _0800C250 @ =0x06013200
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C254 @ =gPalExamineCursors
	str r0, [r4]
	ldr r0, _0800C258 @ =0x05000300
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C25C @ =gPalChoiceSelected
	str r0, [r4]
	ldr r0, _0800C260 @ =0x05000320
	str r0, [r4, #4]
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0800C264 @ =gOamObjects+0x1A0
	movs r5, #0
	add r0, sp, #4
	mov sb, r0
	ldr r2, _0800C268 @ =0x000040E0
	mov ip, r2
	movs r3, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r4, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0800C0D2:
	mov r0, ip
	strh r0, [r1]
	adds r0, r3, r4
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r5, #1
	cmp r5, #3
	bls _0800C0D2
	mov r0, r8
	movs r1, #0xf
	bl SetInactiveActionButtons
	movs r4, #0
	movs r0, #0xe0
	mov r1, r8
	strb r0, [r1, #0x11]
	strb r4, [r1, #0x12]
	movs r0, #8
	strb r0, [r1, #0x13]
	strb r4, [r1, #0xc]
	strb r4, [r1, #0xd]
	ldr r1, _0800C26C @ =gUnknown_0814DA50
	movs r2, #0xc1
	adds r2, r2, r6
	mov r8, r2
	ldrb r3, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r6, #0
	adds r0, #0xc0
	ldrb r2, [r0]
	lsls r1, r2, #2
	adds r1, r1, r2
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r6, r3
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r5, #0
	bl DecompressBackgroundIntoBuffer
	adds r0, r5, #0
	bl CopyBGDataToVram
	movs r0, #0x81
	bl CopyBGDataToVram
	ldr r0, _0800C270 @ =0x0000FFAF
	strh r0, [r7, #0xe]
	adds r1, r7, #0
	adds r1, #0x4a
	ldr r5, _0800C274 @ =0x0000FDFF
	adds r0, r5, #0
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldr r1, _0800C278 @ =gCourtRecord
	adds r0, r6, #0
	bl sub_800E9C4
	str r4, [sp, #4]
	ldr r1, _0800C1FC @ =0x040000D4
	mov r3, sb
	str r3, [r1]
	adds r0, r6, #0
	adds r0, #0xc8
	str r0, [r1, #4]
	ldr r0, _0800C27C @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r6, #0
	adds r0, #0xe8
	str r4, [r0]
	movs r0, #0xf
	strb r0, [r6, #0x1a]
	movs r0, #1
	strb r0, [r6, #0x18]
	strb r0, [r6, #0x19]
	ldr r1, _0800C280 @ =gScriptContext
	ldr r0, _0800C284 @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #0x80
	bl ChangeScriptSection
	ldr r0, _0800C288 @ =gMain
	adds r4, r0, #0
	adds r4, #0xc1
	ldrb r0, [r4]
	cmp r0, #0xc
	beq _0800C19A
	movs r0, #1
	bl SlideTextbox
_0800C19A:
	ldrb r4, [r4]
	cmp r4, #7
	bne _0800C1AC
	ldr r1, _0800C1F8 @ =gIORegisters
	adds r1, #0x4a
	adds r0, r5, #0
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
_0800C1AC:
	ldr r1, _0800C28C @ =gUnknown_0814DAAC
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r6, #0
	movs r1, #0
	bl sub_800E6A4
	bl sub_800A38C
	movs r0, #0x30
	movs r1, #0xf
	bl SetTimedKeysAndDelay
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r1, r7, #0
	adds r1, #0x4e
	movs r0, #0x10
	strh r0, [r1]
	adds r0, #0xf4
	str r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C1F8: .4byte gIORegisters
_0800C1FC: .4byte 0x040000D4
_0800C200: .4byte gTestimony
_0800C204: .4byte 0x81000004
_0800C208: .4byte gInvestigation
_0800C20C: .4byte 0x8100000E
_0800C210: .4byte 0x00003D01
_0800C214: .4byte 0x00003FC7
_0800C218: .4byte gGfxSaveGameTiles
_0800C21C: .4byte 0x80000800
_0800C220: .4byte gGfx4bppInvestigationActions
_0800C224: .4byte 0x06012000
_0800C228: .4byte gPalActionButtons1
_0800C22C: .4byte 0x050002A0
_0800C230: .4byte 0x80000020
_0800C234: .4byte gGfx4bppInvestigationScrollButton
_0800C238: .4byte 0x06013000
_0800C23C: .4byte 0x80000100
_0800C240: .4byte gPalInvestigationScrollPrompt
_0800C244: .4byte 0x050002E0
_0800C248: .4byte 0x80000010
_0800C24C: .4byte gGfxExamineCursor
_0800C250: .4byte 0x06013200
_0800C254: .4byte gPalExamineCursors
_0800C258: .4byte 0x05000300
_0800C25C: .4byte gPalChoiceSelected
_0800C260: .4byte 0x05000320
_0800C264: .4byte gOamObjects+0x1A0
_0800C268: .4byte 0x000040E0
_0800C26C: .4byte gUnknown_0814DA50
_0800C270: .4byte 0x0000FFAF
_0800C274: .4byte 0x0000FDFF
_0800C278: .4byte gCourtRecord
_0800C27C: .4byte 0x85000008
_0800C280: .4byte gScriptContext
_0800C284: .4byte 0x0000FFFF
_0800C288: .4byte gMain
_0800C28C: .4byte gUnknown_0814DAAC

	thumb_func_start sub_800C290
sub_800C290: @ 0x0800C290
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x14
	bl sub_800BC08
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800C310
	ldrb r0, [r4, #0x10]
	cmp r0, #2
	beq _0800C310
	ldr r1, _0800C31C @ =gJoypad
	movs r0, #8
	ldrh r2, [r1, #2]
	ands r0, r2
	adds r3, r1, #0
	ldr r2, _0800C320 @ =gScriptContext
	cmp r0, #0
	beq _0800C2DC
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C2DC
	movs r0, #5
	ldrh r1, [r2, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800C2DC
	ldr r0, _0800C324 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800C352
_0800C2DC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r3, [r3, #2]
	ands r0, r3
	cmp r0, #0
	beq _0800C300
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C300
	movs r0, #5
	ldrh r1, [r2, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800C382
_0800C300:
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800C310
	ldrh r0, [r5, #0x18]
	cmp r0, #0
	beq _0800C328
_0800C310:
	adds r0, r5, #0
	movs r1, #0
	bl sub_800E6A4
	b _0800C50A
	.align 2, 0
_0800C31C: .4byte gJoypad
_0800C320: .4byte gScriptContext
_0800C324: .4byte gMain
_0800C328:
	adds r0, r5, #0
	movs r1, #1
	bl sub_800E6A4
	ldr r1, _0800C35C @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C364
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C364
	ldr r0, _0800C360 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	beq _0800C364
_0800C352:
	movs r0, #0
	bl sub_800A3A0
	b _0800C50A
	.align 2, 0
_0800C35C: .4byte gJoypad
_0800C360: .4byte gMain
_0800C364:
	ldr r6, _0800C3A8 @ =gJoypad
	ldrh r1, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C3B0
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800C382
	b _0800C4F6
_0800C382:
	movs r0, #0x31
	bl PlaySE
	ldr r0, _0800C3AC @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r5, #0xc]
	movs r0, #7
	str r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0
	bl sub_800E6A4
	movs r0, #0
	strb r0, [r4, #0x12]
	movs r0, #8
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	b _0800C50A
	.align 2, 0
_0800C3A8: .4byte gJoypad
_0800C3AC: .4byte gUnknown_030037B8
_0800C3B0:
	movs r0, #0x30
	ldrh r2, [r6, #8]
	ands r0, r2
	cmp r0, #0
	beq _0800C3F6
	ldrb r1, [r4, #0xc]
	strb r1, [r4, #0xd]
	movs r0, #0x20
	ldrh r6, [r6, #8]
	ands r0, r6
	cmp r0, #0
	beq _0800C3CC
	subs r0, r1, #1
	b _0800C3CE
_0800C3CC:
	adds r0, r1, #1
_0800C3CE:
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0800C3DE
	movs r0, #1
	ldrb r1, [r4, #0xc]
	ands r0, r1
	b _0800C3E4
_0800C3DE:
	movs r0, #3
	ldrb r2, [r4, #0xc]
	ands r0, r2
_0800C3E4:
	strb r0, [r4, #0xc]
	movs r0, #0x2a
	bl PlaySE
	movs r0, #0
	strb r0, [r4, #0x12]
	movs r0, #8
	strb r0, [r4, #0x13]
	b _0800C4F6
_0800C3F6:
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800C484
	movs r0, #0x2b
	bl PlaySE
	movs r6, #0
	movs r0, #0x78
	strh r0, [r4]
	movs r0, #0x32
	strh r0, [r4, #2]
	adds r0, r4, #0
	movs r1, #0xf
	bl SetInactiveActionButtons
	adds r0, r7, #0
	ldrb r1, [r4, #0xc]
	lsls r0, r1
	ldrb r2, [r4, #8]
	subs r0, r2, r0
	strb r0, [r4, #8]
	movs r0, #0xf0
	strb r0, [r4, #0x11]
	movs r0, #8
	strb r0, [r4, #0x12]
	strb r6, [r4, #0x13]
	adds r0, r1, #0
	strb r0, [r4, #0xd]
	movs r0, #3
	strb r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #0
	bl sub_800E6A4
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	bne _0800C466
	movs r0, #0xb
	bl sub_800BC08
	movs r0, #0xc
	movs r1, #1
	bl sub_8012D38
	strb r6, [r4, #0x1b]
	strb r6, [r4, #0x1a]
	ldr r1, _0800C474 @ =0x040000D4
	ldr r0, _0800C478 @ =gPalExamineCursors
	str r0, [r1]
	ldr r0, _0800C47C @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0800C480 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0800C466:
	ldrb r0, [r4, #0xc]
	adds r0, #6
	strb r0, [r5, #9]
	strb r6, [r5, #0xb]
	strb r6, [r5, #0xa]
	b _0800C50A
	.align 2, 0
_0800C474: .4byte 0x040000D4
_0800C478: .4byte gPalExamineCursors
_0800C47C: .4byte 0x05000300
_0800C480: .4byte 0x80000010
_0800C484:
	ldrh r0, [r5, #0x34]
	bl sub_80051AC
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0800C4F6
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r6, [r6, #2]
	ands r0, r6
	cmp r0, #0
	beq _0800C4F6
	adds r0, r5, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	beq _0800C4B4
	cmp r1, #0x78
	beq _0800C4B4
	cmp r1, #0xf0
	bne _0800C4F6
_0800C4B4:
	movs r0, #0x2b
	bl PlaySE
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0800C4D2
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #6
	b _0800C4E0
_0800C4D2:
	cmp r0, #0x78
	beq _0800C4DA
	cmp r0, #0xf0
	bne _0800C4E2
_0800C4DA:
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0xfa
_0800C4E0:
	strb r0, [r1]
_0800C4E2:
	movs r0, #0
	movs r1, #3
	strb r1, [r5, #9]
	strb r0, [r5, #0xb]
	strb r0, [r5, #0xa]
	strb r1, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #0xf
	bl SetInactiveActionButtons
_0800C4F6:
	ldrb r0, [r4, #0x12]
	cmp r0, #7
	bhi _0800C500
	adds r0, #1
	strb r0, [r4, #0x12]
_0800C500:
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _0800C50A
	subs r0, #1
	strb r0, [r4, #0x13]
_0800C50A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800C510
sub_800C510: @ 0x0800C510
	push {r4, lr}
	adds r4, r0, #0
	bl ClearSectionReadFlags
	adds r0, r4, #0
	bl sub_8007238
	ldr r1, _0800C54C @ =0x040000D4
	ldr r0, _0800C550 @ =gMain
	str r0, [r1]
	ldr r0, _0800C554 @ =gUnknown_02000034
	str r0, [r1, #4]
	ldr r0, _0800C558 @ =0x8000016A
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800C55C @ =0x0100000A
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800C564
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #1
	bne _0800C590
	ldr r0, _0800C560 @ =0x0100000B
	b _0800C58E
	.align 2, 0
_0800C54C: .4byte 0x040000D4
_0800C550: .4byte gMain
_0800C554: .4byte gUnknown_02000034
_0800C558: .4byte 0x8000016A
_0800C55C: .4byte 0x0100000A
_0800C560: .4byte 0x0100000B
_0800C564:
	cmp r0, #7
	bne _0800C57C
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #2
	bne _0800C590
	ldr r0, _0800C578 @ =gUnknown_0200000B
	b _0800C58E
	.align 2, 0
_0800C578: .4byte gUnknown_0200000B
_0800C57C:
	cmp r0, #0xc
	bne _0800C590
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #3
	bne _0800C590
	ldr r0, _0800C598 @ =gUnknown_0300000B
_0800C58E:
	str r0, [r4, #8]
_0800C590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C598: .4byte gUnknown_0300000B

	thumb_func_start sub_800C59C
sub_800C59C: @ 0x0800C59C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0
	bl sub_800E6A4
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0800C5F0
	ldrh r0, [r4, #0x34]
	bl sub_80051AC
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0800C5CE
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800C5DE
	cmp r0, #0xf0
	beq _0800C5DE
	b _0800C5FC
_0800C5CE:
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800C5DE
	cmp r0, #0x78
	bne _0800C5FC
_0800C5DE:
	movs r0, #0
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x13]
	movs r0, #1
	strb r0, [r5, #0x10]
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	b _0800C5FC
_0800C5F0:
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _0800C5FC
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r4, #8]
_0800C5FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800C604
sub_800C604: @ 0x0800C604
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_800E6A4
	ldr r0, _0800C624 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C61E
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r4, #8]
_0800C61E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C624: .4byte gScriptContext

	thumb_func_start sub_800C628
sub_800C628: @ 0x0800C628
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0800C680 @ =gScriptContext
	adds r0, #0x23
	ldrb r7, [r0]
	cmp r7, #1
	beq _0800C63E
	b _0800C74C
_0800C63E:
	adds r1, r6, #0
	adds r1, #0x8c
	ldr r0, _0800C684 @ =0x0000FFFF
	ldrh r1, [r1]
	cmp r1, r0
	bne _0800C650
	movs r0, #0
	bl sub_8016FEC
_0800C650:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800C74C
	adds r0, r6, #0
	adds r0, #0xc0
	ldrb r2, [r0]
	lsls r1, r2, #2
	adds r1, r1, r2
	movs r3, #0x96
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r4, r6, r1
	ldrb r0, [r6, #0xa]
	cmp r0, #0
	bne _0800C688
	bl ResetSoundControl
	ldrb r0, [r4]
	bl DecompressBackgroundIntoBuffer
	strb r7, [r6, #0xa]
	b _0800C74C
	.align 2, 0
_0800C680: .4byte gScriptContext
_0800C684: .4byte 0x0000FFFF
_0800C688:
	ldrb r0, [r4]
	movs r1, #0
	bl nullsub_8
	ldrb r0, [r4]
	bl CopyBGDataToVram
	ldr r1, _0800C758 @ =gOamObjects+0x130
	movs r2, #0
	movs r0, #0xc1
	adds r0, r0, r6
	mov r8, r0
	adds r4, r1, #0
	adds r4, #0x70
	movs r3, #0x80
	lsls r3, r3, #2
_0800C6A8:
	movs r0, #0
_0800C6AA:
	strh r3, [r1]
	adds r1, #8
	adds r0, #1
	cmp r0, #1
	bls _0800C6AA
	adds r2, #1
	cmp r2, #3
	bls _0800C6A8
	adds r1, r4, #0
	movs r2, #0
	ldr r3, _0800C75C @ =0x000040E0
	mov ip, r3
	movs r4, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r7, r0, #0
	movs r3, #0xa2
	lsls r3, r3, #7
_0800C6CE:
	mov r0, ip
	strh r0, [r1]
	adds r0, r4, r7
	strh r0, [r1, #2]
	strh r3, [r1, #4]
	adds r1, #8
	adds r4, #0x3c
	adds r3, #0x20
	adds r2, #1
	cmp r2, #3
	bls _0800C6CE
	movs r4, #0
	adds r0, r5, #0
	movs r1, #0xf
	bl SetInactiveActionButtons
	movs r0, #0xe0
	strb r0, [r5, #0x11]
	strb r4, [r5, #0x12]
	movs r0, #8
	strb r0, [r5, #0x13]
	strb r4, [r5, #0xc]
	strb r4, [r5, #0xd]
	movs r0, #1
	strb r0, [r5, #0x10]
	bl ClearAllAnimationSprites
	ldr r0, _0800C760 @ =gAnimation+0x44
	bl DestroyAnimation
	ldr r0, _0800C764 @ =gInvestigation
	strb r4, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
	ldr r1, _0800C768 @ =gUnknown_0814DAAC
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	movs r0, #3
	bl sub_8017154
	movs r0, #0xa
	bl sub_800BC08
	adds r0, r6, #0
	movs r1, #0
	bl sub_800E6A4
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
_0800C74C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C758: .4byte gOamObjects+0x130
_0800C75C: .4byte 0x000040E0
_0800C760: .4byte gAnimation+0x44
_0800C764: .4byte gInvestigation
_0800C768: .4byte gUnknown_0814DAAC

	thumb_func_start sub_800C76C
sub_800C76C: @ 0x0800C76C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r0, _0800C820 @ =gOamObjects+0x1D0
	mov r8, r0
	movs r0, #0x14
	bl sub_800BC08
	ldr r0, _0800C824 @ =gAnimation
	ldr r0, [r0, #0x44]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0800C790
	b _0800CAFA
_0800C790:
	adds r0, r7, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800C79C
	b _0800CAFA
_0800C79C:
	ldr r1, _0800C828 @ =gJoypad
	movs r0, #8
	ldrh r2, [r1, #2]
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _0800C7CC
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C7CC
	ldr r1, _0800C82C @ =gScriptContext
	movs r0, #5
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800C7CC
	ldr r0, _0800C830 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800C87A
_0800C7CC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C7F2
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C7F2
	ldr r1, _0800C82C @ =gScriptContext
	movs r0, #5
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800C8A2
_0800C7F2:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0800C7FA
	b _0800CAFA
_0800C7FA:
	ldr r0, _0800C82C @ =gScriptContext
	adds r0, #0x23
	ldrb r6, [r0]
	cmp r6, #1
	beq _0800C806
	b _0800CAFA
_0800C806:
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	beq _0800C80E
	b _0800CAFA
_0800C80E:
	ldrb r1, [r7, #0xa]
	cmp r1, #1
	beq _0800C858
	cmp r1, #1
	bgt _0800C834
	cmp r1, #0
	beq _0800C83C
	b _0800CAFA
	.align 2, 0
_0800C820: .4byte gOamObjects+0x1D0
_0800C824: .4byte gAnimation
_0800C828: .4byte gJoypad
_0800C82C: .4byte gScriptContext
_0800C830: .4byte gMain
_0800C834:
	cmp r1, #2
	bne _0800C83A
	b _0800CAB4
_0800C83A:
	b _0800CAFA
_0800C83C:
	ldrb r0, [r5, #0x12]
	cmp r0, #0xf
	bhi _0800C846
	adds r0, #1
	strb r0, [r5, #0x12]
_0800C846:
	strb r1, [r5, #0x13]
	ldrb r5, [r5, #0x12]
	cmp r5, #0xf
	bhi _0800C850
	b _0800CAFA
_0800C850:
	ldrb r0, [r7, #0xa]
	adds r0, #1
	strb r0, [r7, #0xa]
	b _0800CAFA
_0800C858:
	movs r2, #3
	movs r0, #8
	ldrh r1, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C888
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C888
	ldr r0, _0800C884 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	beq _0800C888
_0800C87A:
	movs r0, #0
	bl sub_800A3A0
	b _0800CAFA
	.align 2, 0
_0800C884: .4byte gMain
_0800C888:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C8C0
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C8C0
_0800C8A2:
	movs r0, #0x31
	bl PlaySE
	ldr r0, _0800C8BC @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r7, #0xc]
	movs r0, #7
	str r0, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	mov r2, r8
	strh r0, [r2]
	b _0800CAFA
	.align 2, 0
_0800C8BC: .4byte gUnknown_030037B8
_0800C8C0:
	ldrh r1, [r3, #2]
	movs r6, #1
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _0800C920
	movs r0, #0x2b
	bl PlaySE
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_800E72C
	adds r2, r0, #0
	bl ChangeScriptSection
	movs r0, #1
	bl SlideTextbox
	strb r6, [r5, #7]
	strb r4, [r5, #0x18]
	strb r4, [r5, #0x19]
	strb r6, [r5, #8]
	movs r0, #3
	strb r0, [r5, #0x10]
	movs r0, #0xf0
	strb r0, [r5, #0x11]
	strb r4, [r5, #0x12]
	strb r4, [r5, #0x13]
	ldr r1, _0800C914 @ =gIORegisters
	adds r2, r1, #0
	adds r2, #0x48
	ldr r0, _0800C918 @ =0x00001942
	strh r0, [r2]
	adds r1, #0x4c
	ldr r0, _0800C91C @ =0x0000071F
	strh r0, [r1]
	b _0800CAFA
	.align 2, 0
_0800C914: .4byte gIORegisters
_0800C918: .4byte 0x00001942
_0800C91C: .4byte 0x0000071F
_0800C920:
	movs r6, #2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800C944
	movs r0, #0x2c
	bl PlaySE
	strb r6, [r7, #0xa]
	adds r0, r5, #0
	movs r1, #0xe
	bl SetInactiveActionButtons
	strb r6, [r5, #0x10]
	movs r0, #0xe0
	strb r0, [r5, #0x11]
	movs r0, #0x10
	b _0800CAF6
_0800C944:
	movs r0, #0x20
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0800C970
	ldrh r1, [r5]
	subs r0, r1, r2
	strh r0, [r5]
	ldrh r1, [r5, #2]
	cmp r1, #0xf
	bhi _0800C966
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bhi _0800C966
	movs r0, #0x3c
	strh r0, [r5]
_0800C966:
	ldrh r0, [r5]
	cmp r0, #0xe0
	bls _0800C970
	movs r0, #0
	strh r0, [r5]
_0800C970:
	movs r0, #0x10
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0800C99C
	ldrh r1, [r5]
	adds r0, r1, r2
	strh r0, [r5]
	ldrh r1, [r5, #2]
	cmp r1, #0xf
	bhi _0800C992
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bhi _0800C992
	movs r0, #0x3c
	strh r0, [r5]
_0800C992:
	ldrh r0, [r5]
	cmp r0, #0xe0
	bls _0800C99C
	movs r0, #0xe0
	strh r0, [r5]
_0800C99C:
	movs r0, #0x40
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0800C9C8
	ldrh r1, [r5, #2]
	subs r0, r1, r2
	strh r0, [r5, #2]
	ldrh r1, [r5]
	cmp r1, #0x3b
	bhi _0800C9BE
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0800C9BE
	movs r0, #0x10
	strh r0, [r5, #2]
_0800C9BE:
	ldrh r0, [r5, #2]
	cmp r0, #0x90
	bls _0800C9C8
	movs r0, #0
	strh r0, [r5, #2]
_0800C9C8:
	movs r0, #0x80
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	beq _0800C9F4
	ldrh r1, [r5, #2]
	adds r0, r1, r2
	strh r0, [r5, #2]
	ldrh r2, [r5]
	cmp r2, #0x3b
	bhi _0800C9EA
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0800C9EA
	movs r0, #0x10
	strh r0, [r5, #2]
_0800C9EA:
	ldrh r0, [r5, #2]
	cmp r0, #0x90
	bls _0800C9F4
	movs r0, #0x90
	strh r0, [r5, #2]
_0800C9F4:
	adds r0, r5, #0
	bl sub_800E72C
	adds r2, r0, #0
	cmp r2, #0x1e
	beq _0800CA1A
	ldr r0, _0800CA24 @ =gMain
	adds r0, #0xc1
	ldrb r1, [r0]
	cmp r1, #2
	bne _0800CA12
	movs r0, #0x94
	lsls r0, r0, #1
	cmp r2, r0
	beq _0800CA1A
_0800CA12:
	cmp r1, #4
	bne _0800CA28
	cmp r2, #0xdf
	bne _0800CA28
_0800CA1A:
	movs r0, #0
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x19]
	b _0800CA44
	.align 2, 0
_0800CA24: .4byte gMain
_0800CA28:
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0800CA44
	movs r0, #0
	strb r0, [r5, #0x19]
	ldrb r0, [r5, #0x18]
	adds r0, #4
	movs r1, #0xf
	ands r0, r1
	strb r0, [r5, #0x18]
_0800CA44:
	ldrh r0, [r5, #2]
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0x77
	bhi _0800CA5A
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #2]
	b _0800CA64
_0800CA5A:
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r0, r1
	mov r2, r8
	strh r0, [r2, #2]
_0800CA64:
	ldrb r1, [r5, #0x18]
	ldr r2, _0800CAA0 @ =0x00008190
	adds r0, r1, r2
	mov r1, r8
	strh r0, [r1, #4]
	ldrb r0, [r5, #0x1b]
	adds r0, #1
	strb r0, [r5, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800CAFA
	movs r0, #0
	strb r0, [r5, #0x1b]
	ldrb r0, [r5, #0x1a]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r5, #0x1a]
	ldr r1, _0800CAA4 @ =0x040000D4
	lsls r0, r0, #5
	ldr r2, _0800CAA8 @ =gPalExamineCursors
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _0800CAAC @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0800CAB0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800CAFA
	.align 2, 0
_0800CAA0: .4byte 0x00008190
_0800CAA4: .4byte 0x040000D4
_0800CAA8: .4byte gPalExamineCursors
_0800CAAC: .4byte 0x05000300
_0800CAB0: .4byte 0x80000010
_0800CAB4:
	ldrb r0, [r5, #0x12]
	cmp r0, #8
	bls _0800CABE
	subs r0, #1
	strb r0, [r5, #0x12]
_0800CABE:
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _0800CAFA
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
	ldr r0, _0800CB04 @ =gAnimation+0x44
	movs r1, #1
	bl sub_801208C
	movs r0, #0xc
	bl sub_800BC08
	movs r0, #1
	movs r1, #1
	bl sub_8012D38
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r7, #8]
	ldrb r2, [r5, #0xc]
	lsls r6, r2
	ldrb r1, [r5, #8]
	adds r0, r1, r6
	strb r0, [r5, #8]
	movs r0, #8
_0800CAF6:
	strb r0, [r5, #0x12]
	strb r4, [r5, #0x13]
_0800CAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB04: .4byte gAnimation+0x44

	thumb_func_start sub_800CB08
sub_800CB08: @ 0x0800CB08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	str r1, [sp]
	ldrb r0, [r0, #0xa]
	cmp r0, #6
	bls _0800CB20
	b _0800D09E
_0800CB20:
	lsls r0, r0, #2
	ldr r1, _0800CB2C @ =_0800CB30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CB2C: .4byte _0800CB30
_0800CB30: @ jump table
	.4byte _0800CB4C @ case 0
	.4byte _0800CB6E @ case 1
	.4byte _0800CC7C @ case 2
	.4byte _0800CCF4 @ case 3
	.4byte _0800CEC4 @ case 4
	.4byte _0800CF4C @ case 5
	.4byte _0800CFC0 @ case 6
_0800CB4C:
	ldr r1, [sp]
	ldrb r0, [r1, #0x12]
	cmp r0, #0xf
	bhi _0800CB58
	adds r0, #1
	strb r0, [r1, #0x12]
_0800CB58:
	movs r0, #0
	ldr r2, [sp]
	strb r0, [r2, #0x13]
	ldrb r3, [r2, #0x12]
	cmp r3, #0xf
	bhi _0800CB66
	b _0800D09E
_0800CB66:
	mov r6, r8
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800D09C
_0800CB6E:
	ldr r4, _0800CBFC @ =gOamObjects+0x130
	mov r1, r8
	adds r1, #0xc0
	ldrb r7, [r1]
	lsls r0, r7, #2
	adds r1, r7, #0
	adds r0, r0, r1
	mov r1, r8
	adds r5, r0, r1
	ldr r2, _0800CC00 @ =0x0000012D
	adds r5, r5, r2
	movs r6, #0
	ldr r3, [sp]
	adds r3, #0x14
	mov sb, r3
_0800CB8C:
	lsls r0, r6, #0xb
	ldr r1, _0800CC04 @ =0x06013400
	adds r7, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0800CC1C
	movs r0, #1
	mov r2, sb
	strb r0, [r2]
	ldr r2, _0800CC08 @ =gUnknown_0200AFC0
	ldr r1, _0800CC0C @ =gUnknown_08026960
	ldrb r3, [r5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #8]
	bl LZ77UnCompWram
	ldr r1, _0800CC10 @ =0x040000D4
	ldr r2, [sp, #8]
	str r2, [r1]
	str r7, [r1, #4]
	ldr r0, _0800CC14 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	lsls r0, r6, #2
	adds r5, #1
	movs r7, #0x81
	lsls r7, r7, #7
	adds r7, r7, r0
	mov ip, r7
	movs r2, #0xd0
	lsls r2, r2, #1
	lsls r0, r6, #6
	str r0, [sp, #0xc]
	movs r1, #0x90
	lsls r1, r1, #8
	mov sl, r1
	ldr r1, _0800CC18 @ =0x0000C038
_0800CBDE:
	mov r7, ip
	strh r7, [r4]
	strh r1, [r4, #2]
	ldr r7, [sp, #0xc]
	adds r0, r2, r7
	mov r7, sl
	orrs r0, r7
	strh r0, [r4, #4]
	adds r4, #8
	adds r2, #0x20
	adds r1, #0x40
	adds r3, #1
	cmp r3, #1
	bls _0800CBDE
	b _0800CC30
	.align 2, 0
_0800CBFC: .4byte gOamObjects+0x130
_0800CC00: .4byte 0x0000012D
_0800CC04: .4byte 0x06013400
_0800CC08: .4byte gUnknown_0200AFC0
_0800CC0C: .4byte gUnknown_08026960
_0800CC10: .4byte 0x040000D4
_0800CC14: .4byte 0x80000400
_0800CC18: .4byte 0x0000C038
_0800CC1C:
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #2]
	adds r4, #8
	strh r0, [r4, #2]
	adds r4, #8
	adds r5, #1
_0800CC30:
	movs r2, #1
	add sb, r2
	adds r6, #1
	cmp r6, #3
	bls _0800CB8C
	movs r1, #0
	ldr r3, [sp]
	strb r1, [r3, #4]
	mov r6, r8
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	movs r6, #0
	ldr r2, _0800CC74 @ =gUnknown_03003C54
_0800CC4E:
	adds r0, r6, r2
	ldrb r0, [r0]
	adds r1, r0, r1
	adds r6, #1
	cmp r6, #3
	bls _0800CC4E
	cmp r1, #0
	beq _0800CC60
	b _0800D09E
_0800CC60:
	movs r0, #1
	bl SlideTextbox
	ldr r1, _0800CC78 @ =gInvestigation
	movs r0, #4
	strb r0, [r1, #0x10]
	movs r0, #0x1e
	bl ChangeScriptSection
	b _0800D09E
	.align 2, 0
_0800CC74: .4byte gUnknown_03003C54
_0800CC78: .4byte gInvestigation
_0800CC7C:
	ldr r5, _0800CCEC @ =gOamObjects+0x1A8
	mov r7, r8
	ldrb r7, [r7, #0xb]
	cmp r7, #0xc
	bhi _0800CCB0
	adds r4, r5, #0
	subs r4, #0x78
	movs r6, #0
	movs r2, #4
_0800CC8E:
	movs r3, #0
	subs r0, r2, r6
	lsls r1, r0, #1
_0800CC94:
	ldrh r7, [r4]
	subs r0, r7, r1
	strh r0, [r4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800CC94
	adds r6, #1
	cmp r6, #3
	bls _0800CC8E
	mov r1, r8
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800CCB0:
	adds r4, r5, #0
	ldrh r0, [r4, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	subs r0, #6
	ldr r1, _0800CCF0 @ =0x000001FF
	ands r0, r1
	strh r0, [r4, #2]
	cmp r0, #0xff
	bls _0800CCCA
	movs r0, #0
	strh r0, [r4, #2]
_0800CCCA:
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0800CCE4
	mov r3, r8
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bls _0800CCE4
	mov r6, r8
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r6, #0xb]
_0800CCE4:
	ldrh r7, [r4, #2]
	orrs r2, r7
	strh r2, [r4, #2]
	b _0800D09E
	.align 2, 0
_0800CCEC: .4byte gOamObjects+0x1A8
_0800CCF0: .4byte 0x000001FF
_0800CCF4:
	mov r0, r8
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800CD00
	b _0800D09E
_0800CD00:
	movs r4, #0
	movs r6, #0
	ldr r1, _0800CD48 @ =gUnknown_03003C54
_0800CD06:
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r4, r0, r4
	adds r6, #1
	cmp r6, #3
	bls _0800CD06
	cmp r4, #0
	bne _0800CD54
	ldr r1, _0800CD4C @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800CD24
	b _0800D0F8
_0800CD24:
	movs r0, #0
	bl SlideTextbox
	ldr r1, _0800CD50 @ =gInvestigation
	movs r0, #4
	strb r0, [r1, #0x10]
	movs r0, #0xe0
	strb r0, [r1, #0x11]
	movs r0, #0x10
	strb r0, [r1, #0x12]
	strb r4, [r1, #0x13]
	mov r1, r8
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	strb r4, [r1, #0xb]
	b _0800D0F8
	.align 2, 0
_0800CD48: .4byte gUnknown_03003C54
_0800CD4C: .4byte gScriptContext
_0800CD50: .4byte gInvestigation
_0800CD54:
	ldr r0, _0800CD84 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CD8C
	mov r0, r8
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800CD70
	b _0800D09E
_0800CD70:
	ldr r0, _0800CD88 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800CD7A
	b _0800D09E
_0800CD7A:
	movs r0, #0
	bl sub_800A3A0
	b _0800D09E
	.align 2, 0
_0800CD84: .4byte gJoypad
_0800CD88: .4byte gMain
_0800CD8C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CDDE
	mov r0, r8
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800CDA6
	b _0800D09E
_0800CDA6:
	movs r0, #0x31
	bl PlaySE
	movs r0, #6
	mov r2, r8
	strb r0, [r2, #0xa]
	ldr r0, _0800CDD0 @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r2, #0xc]
	movs r0, #7
	str r0, [r2, #8]
	ldr r4, _0800CDD4 @ =gOamObjects+0x130
	movs r6, #0
	movs r0, #0x96
	lsls r0, r0, #1
_0800CDC4:
	strh r0, [r4, #2]
	adds r4, #8
	adds r6, #1
	cmp r6, #7
	bls _0800CDC4
	b _0800D09E
	.align 2, 0
_0800CDD0: .4byte gUnknown_030037B8
_0800CDD4: .4byte gOamObjects+0x130
_0800CDD8:
	ldr r6, [sp]
	strb r3, [r6, #4]
	b _0800CE08
_0800CDDE:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800CE1A
	movs r6, #0
	ldr r7, [sp]
	ldrb r0, [r7, #4]
	subs r3, r0, #1
	adds r2, r0, #0
	movs r4, #3
	adds r1, r7, #0
	adds r1, #0x14
_0800CDF6:
	ands r3, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800CDD8
	subs r3, #1
	adds r6, #1
	cmp r6, #3
	bls _0800CDF6
_0800CE08:
	ldr r0, [sp]
	ldrb r0, [r0, #4]
	cmp r2, r0
	bne _0800CE12
	b _0800D09E
_0800CE12:
	b _0800CE4E
_0800CE14:
	ldr r1, [sp]
	strb r3, [r1, #4]
	b _0800CE44
_0800CE1A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CE56
	movs r6, #0
	ldr r2, [sp]
	ldrb r0, [r2, #4]
	adds r3, r0, #1
	adds r2, r0, #0
	movs r4, #3
	ldr r1, [sp]
	adds r1, #0x14
_0800CE32:
	ands r3, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800CE14
	adds r3, #1
	adds r6, #1
	cmp r6, #3
	bls _0800CE32
_0800CE44:
	ldr r3, [sp]
	ldrb r3, [r3, #4]
	cmp r2, r3
	bne _0800CE4E
	b _0800D09E
_0800CE4E:
	movs r0, #0x2a
	bl PlaySE
	b _0800D09E
_0800CE56:
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _0800CEA8
	movs r0, #0x2b
	bl PlaySE
	mov r2, r8
	adds r2, #0xc0
	ldr r6, [sp]
	ldrb r3, [r6, #4]
	adds r3, #1
	ldrb r7, [r2]
	lsls r1, r7, #2
	adds r0, r7, #0
	adds r1, r1, r0
	adds r1, r3, r1
	movs r0, #0x96
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0x14
	bl FadeOutBGM
	movs r0, #0xd
	bl sub_800BC08
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r0, _0800CEA4 @ =0x00000504
	mov r1, r8
	str r0, [r1, #8]
	b _0800D09E
	.align 2, 0
_0800CEA4: .4byte 0x00000504
_0800CEA8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800CEB2
	b _0800D09E
_0800CEB2:
	movs r0, #0x2c
	bl PlaySE
	mov r2, r8
	ldrb r0, [r2, #0xa]
	adds r0, #1
	strb r0, [r2, #0xa]
	strb r4, [r2, #0xb]
	b _0800D09E
_0800CEC4:
	ldr r5, _0800CF44 @ =gOamObjects+0x1A8
	mov r3, r8
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800CEFA
	adds r4, r5, #0
	subs r4, #0x78
	movs r6, #0
	movs r2, #4
_0800CED6:
	movs r3, #0
	subs r0, r2, r6
	lsls r1, r0, #1
_0800CEDC:
	ldrh r0, [r4]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800CEDC
	adds r6, #1
	cmp r6, #3
	bls _0800CED6
	mov r6, r8
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800CEFA:
	adds r4, r5, #0
	ldrh r0, [r4, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	adds r0, #6
	ldr r1, _0800CF48 @ =0x000001FF
	ands r0, r1
	strh r0, [r4, #2]
	cmp r0, #0x3b
	bls _0800CF3A
	movs r0, #0x3c
	strh r0, [r4, #2]
	ldr r0, [sp]
	movs r1, #0xd
	str r2, [sp, #8]
	bl SetInactiveActionButtons
	movs r0, #2
	ldr r7, [sp]
	strb r0, [r7, #0x10]
	movs r0, #0xe0
	strb r0, [r7, #0x11]
	movs r0, #0x10
	strb r0, [r7, #0x12]
	movs r0, #0
	strb r0, [r7, #0x13]
	mov r1, r8
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	ldr r2, [sp, #8]
_0800CF3A:
	ldrh r3, [r4, #2]
	orrs r2, r3
	strh r2, [r4, #2]
	b _0800D09E
	.align 2, 0
_0800CF44: .4byte gOamObjects+0x1A8
_0800CF48: .4byte 0x000001FF
_0800CF4C:
	mov r6, r8
	ldrb r6, [r6, #0xb]
	cmp r6, #0xc
	bhi _0800CF7E
	ldr r4, _0800CFBC @ =gOamObjects+0x130
	movs r6, #0
	movs r2, #4
_0800CF5A:
	movs r3, #0
	subs r0, r2, r6
	lsls r1, r0, #1
_0800CF60:
	ldrh r0, [r4]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800CF60
	adds r6, #1
	cmp r6, #3
	bls _0800CF5A
	mov r7, r8
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
_0800CF7E:
	ldr r1, [sp]
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bls _0800CF8A
	subs r0, #1
	strb r0, [r1, #0x12]
_0800CF8A:
	ldr r2, [sp]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _0800CF94
	b _0800D09E
_0800CF94:
	mov r3, r8
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800CF9E
	b _0800D09E
_0800CF9E:
	movs r0, #0x82
	lsls r0, r0, #1
	mov r6, r8
	str r0, [r6, #8]
	movs r0, #1
	ldrb r7, [r2, #0xc]
	lsls r0, r7
	ldrb r2, [r2, #8]
	adds r0, r2, r0
	ldr r3, [sp]
	strb r0, [r3, #8]
	movs r0, #8
	strb r0, [r3, #0x12]
	strb r1, [r3, #0x13]
	b _0800D09E
	.align 2, 0
_0800CFBC: .4byte gOamObjects+0x130
_0800CFC0:
	ldr r4, _0800D050 @ =gOamObjects+0x130
	mov r1, r8
	adds r1, #0xc0
	ldrb r6, [r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	mov r7, r8
	adds r5, r0, r7
	ldr r0, _0800D054 @ =0x0000012D
	adds r5, r5, r0
	movs r6, #0
	ldr r1, [sp]
	adds r1, #0x14
	mov sb, r1
	movs r2, #0
	str r2, [sp, #4]
_0800CFE0:
	lsls r0, r6, #0xb
	ldr r3, _0800D058 @ =0x06013400
	adds r7, r0, r3
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0800D074
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	ldr r2, _0800D05C @ =gUnknown_0200AFC0
	ldr r1, _0800D060 @ =gUnknown_08026960
	ldrb r3, [r5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #8]
	bl LZ77UnCompWram
	ldr r1, _0800D064 @ =0x040000D4
	ldr r2, [sp, #8]
	str r2, [r1]
	str r7, [r1, #4]
	ldr r0, _0800D068 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	adds r5, #1
	ldr r7, [sp, #4]
	ldr r0, _0800D06C @ =0x00004018
	adds r7, r7, r0
	mov ip, r7
	movs r2, #0xd0
	lsls r2, r2, #1
	lsls r1, r6, #6
	str r1, [sp, #0xc]
	movs r7, #0x90
	lsls r7, r7, #8
	mov sl, r7
	ldr r1, _0800D070 @ =0x0000C038
_0800D030:
	mov r0, ip
	strh r0, [r4]
	strh r1, [r4, #2]
	ldr r7, [sp, #0xc]
	adds r0, r2, r7
	mov r7, sl
	orrs r0, r7
	strh r0, [r4, #4]
	adds r4, #8
	adds r2, #0x20
	adds r1, #0x40
	adds r3, #1
	cmp r3, #1
	bls _0800D030
	b _0800D088
	.align 2, 0
_0800D050: .4byte gOamObjects+0x130
_0800D054: .4byte 0x0000012D
_0800D058: .4byte 0x06013400
_0800D05C: .4byte gUnknown_0200AFC0
_0800D060: .4byte gUnknown_08026960
_0800D064: .4byte 0x040000D4
_0800D068: .4byte 0x80000400
_0800D06C: .4byte 0x00004018
_0800D070: .4byte 0x0000C038
_0800D074:
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #2]
	adds r4, #8
	strh r0, [r4, #2]
	adds r4, #8
	adds r5, #1
_0800D088:
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #4]
	adds r3, #0x1e
	str r3, [sp, #4]
	adds r6, #1
	cmp r6, #3
	bls _0800CFE0
	movs r0, #3
	mov r6, r8
_0800D09C:
	strb r0, [r6, #0xa]
_0800D09E:
	ldr r4, _0800D0CC @ =gOamObjects+0x130
	movs r6, #0
_0800D0A2:
	ldr r7, [sp]
	ldrb r7, [r7, #4]
	cmp r6, r7
	bne _0800D0D4
	movs r3, #0
	adds r2, r6, #1
	ldr r5, _0800D0D0 @ =0x00000FFF
	movs r0, #0x90
	lsls r0, r0, #8
	adds r1, r0, #0
_0800D0B6:
	adds r0, r5, #0
	ldrh r6, [r4, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r4, #4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800D0B6
	b _0800D0F2
	.align 2, 0
_0800D0CC: .4byte gOamObjects+0x130
_0800D0D0: .4byte 0x00000FFF
_0800D0D4:
	movs r3, #0
	adds r2, r6, #1
	ldr r5, _0800D108 @ =0x00000FFF
	movs r7, #0xa0
	lsls r7, r7, #8
	adds r1, r7, #0
_0800D0E0:
	adds r0, r5, #0
	ldrh r6, [r4, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r4, #4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800D0E0
_0800D0F2:
	adds r6, r2, #0
	cmp r6, #3
	bls _0800D0A2
_0800D0F8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D108: .4byte 0x00000FFF

	thumb_func_start sub_800D10C
sub_800D10C: @ 0x0800D10C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	str r1, [sp]
	ldrb r0, [r0, #0xa]
	cmp r0, #8
	bls _0800D126
	bl _0800DB04
_0800D126:
	lsls r0, r0, #2
	ldr r1, _0800D130 @ =_0800D134
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D130: .4byte _0800D134
_0800D134: @ jump table
	.4byte _0800D158 @ case 0
	.4byte _0800D17E @ case 1
	.4byte _0800D2D4 @ case 2
	.4byte _0800D34C @ case 3
	.4byte _0800D654 @ case 4
	.4byte _0800D6DC @ case 5
	.4byte _0800D78C @ case 6
	.4byte _0800D9A8 @ case 7
	.4byte _0800D9FC @ case 8
_0800D158:
	ldr r1, [sp]
	ldrb r0, [r1, #0x12]
	cmp r0, #0xf
	bhi _0800D164
	adds r0, #1
	strb r0, [r1, #0x12]
_0800D164:
	movs r0, #0
	ldr r2, [sp]
	strb r0, [r2, #0x13]
	ldrb r3, [r2, #0x12]
	cmp r3, #0xf
	bhi _0800D174
	bl _0800DB04
_0800D174:
	mov r4, sl
	ldrb r0, [r4, #0xa]
	adds r0, #1
	bl sub_0800DB02
_0800D17E:
	ldr r3, _0800D230 @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	ldr r5, _0800D234 @ =gOamObjects+0x130
	ldr r6, [sp]
	adds r6, #0x14
	str r6, [sp, #8]
	cmp r0, #0xff
	beq _0800D1B4
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800D238 @ =gAnimation+0x52
_0800D198:
	cmp r2, r1
	bne _0800D1AA
	ldrb r0, [r4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	bne _0800D1AA
	ldrb r6, [r3, #3]
	cmp r6, #1
	beq _0800D1B4
_0800D1AA:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800D198
_0800D1B4:
	adds r6, r3, #4
	movs r7, #0
	ldr r0, [sp, #8]
	mov r8, r0
_0800D1BC:
	lsls r0, r7, #0xb
	ldr r1, _0800D23C @ =0x06013400
	adds r1, r1, r0
	mov sb, r1
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0800D254
	movs r0, #1
	mov r2, r8
	strb r0, [r2]
	ldr r2, _0800D240 @ =gUnknown_0200AFC0
	ldr r1, _0800D244 @ =gUnknown_08026810
	ldrb r3, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl LZ77UnCompWram
	ldr r1, _0800D248 @ =0x040000D4
	ldr r2, [sp, #0x10]
	str r2, [r1]
	mov r4, sb
	str r4, [r1, #4]
	ldr r0, _0800D24C @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	lsls r0, r7, #2
	adds r2, r6, #1
	movs r6, #0x81
	lsls r6, r6, #7
	adds r6, r6, r0
	mov ip, r6
	movs r3, #0xd0
	lsls r3, r3, #1
	lsls r0, r7, #6
	str r0, [sp, #0x18]
	movs r1, #0x90
	lsls r1, r1, #8
	mov sb, r1
	ldr r1, _0800D250 @ =0x0000C038
_0800D212:
	mov r6, ip
	strh r6, [r5]
	strh r1, [r5, #2]
	ldr r6, [sp, #0x18]
	adds r0, r3, r6
	mov r6, sb
	orrs r0, r6
	strh r0, [r5, #4]
	adds r5, #8
	adds r3, #0x20
	adds r1, #0x40
	adds r4, #1
	cmp r4, #1
	bls _0800D212
	b _0800D268
	.align 2, 0
_0800D230: .4byte gUnknown_03002920
_0800D234: .4byte gOamObjects+0x130
_0800D238: .4byte gAnimation+0x52
_0800D23C: .4byte 0x06013400
_0800D240: .4byte gUnknown_0200AFC0
_0800D244: .4byte gUnknown_08026810
_0800D248: .4byte 0x040000D4
_0800D24C: .4byte 0x80000400
_0800D250: .4byte 0x0000C038
_0800D254:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	adds r5, #8
	strh r0, [r5, #2]
	adds r5, #8
	adds r2, r6, #1
_0800D268:
	adds r6, r2, #0
	movs r2, #1
	add r8, r2
	adds r7, #1
	cmp r7, #3
	bls _0800D1BC
	ldr r1, _0800D2A4 @ =0x040000D4
	ldr r0, _0800D2A8 @ =gGfxCheckmark
	str r0, [r1]
	ldr r0, _0800D2AC @ =0x06015400
	str r0, [r1, #4]
	ldr r0, _0800D2B0 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800D2B4 @ =gPalCheckmark
	str r0, [r1]
	ldr r0, _0800D2B8 @ =0x05000360
	str r0, [r1, #4]
	ldr r0, _0800D2BC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, [sp]
	ldrb r1, [r3, #5]
	adds r0, r1, #0
	cmp r0, #0
	beq _0800D2C0
	movs r0, #0
	strb r1, [r3, #4]
	strb r0, [r3, #5]
	b _0800D2C4
	.align 2, 0
_0800D2A4: .4byte 0x040000D4
_0800D2A8: .4byte gGfxCheckmark
_0800D2AC: .4byte 0x06015400
_0800D2B0: .4byte 0x80000100
_0800D2B4: .4byte gPalCheckmark
_0800D2B8: .4byte 0x05000360
_0800D2BC: .4byte 0x80000010
_0800D2C0:
	ldr r4, [sp]
	strb r0, [r4, #4]
_0800D2C4:
	mov r6, sl
	ldrb r0, [r6, #0xa]
	adds r0, #1
	movs r1, #0
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	bl _0800DB04
_0800D2D4:
	ldr r3, _0800D344 @ =gOamObjects+0x1B0
	mov r0, sl
	ldrb r0, [r0, #0xb]
	cmp r0, #0xc
	bhi _0800D308
	adds r5, r3, #0
	subs r5, #0x80
	movs r7, #0
	movs r2, #4
_0800D2E6:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D2EC:
	ldrh r6, [r5]
	subs r0, r6, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D2EC
	adds r7, #1
	cmp r7, #3
	bls _0800D2E6
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D308:
	adds r5, r3, #0
	ldrh r0, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	subs r0, #9
	ldr r1, _0800D348 @ =0x000001FF
	ands r0, r1
	strh r0, [r5, #2]
	cmp r0, #0xff
	bls _0800D322
	movs r0, #0
	strh r0, [r5, #2]
_0800D322:
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _0800D33C
	mov r3, sl
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bls _0800D33C
	mov r4, sl
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	movs r0, #0
	strb r0, [r4, #0xb]
_0800D33C:
	ldrh r6, [r5, #2]
	orrs r2, r6
	strh r2, [r5, #2]
	b _0800DB04
	.align 2, 0
_0800D344: .4byte gOamObjects+0x1B0
_0800D348: .4byte 0x000001FF
_0800D34C:
	ldr r1, _0800D3D8 @ =0x040000D4
	ldr r0, _0800D3DC @ =gGfxCheckmark
	str r0, [r1]
	ldr r0, _0800D3E0 @ =0x06015400
	str r0, [r1, #4]
	ldr r0, _0800D3E4 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800D3E8 @ =gPalCheckmark
	str r0, [r1]
	ldr r0, _0800D3EC @ =0x05000360
	str r0, [r1, #4]
	ldr r0, _0800D3F0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0800D3F4 @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	mov r5, sl
	adds r5, #0x8a
	cmp r0, #0xff
	beq _0800D39C
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800D3F8 @ =gAnimation+0x52
_0800D380:
	cmp r2, r1
	bne _0800D392
	ldrb r0, [r4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	bne _0800D392
	ldrb r6, [r3, #3]
	cmp r6, #1
	beq _0800D39C
_0800D392:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800D380
_0800D39C:
	movs r0, #1
	mov sb, r0
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800D3A8
	b _0800D57C
_0800D3A8:
	ldr r0, _0800D3FC @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D404
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800D3C4
	b _0800D57C
_0800D3C4:
	ldr r0, _0800D400 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800D3CE
	b _0800D57C
_0800D3CE:
	movs r0, #0
	str r3, [sp, #0x14]
	bl sub_800A3A0
	b _0800D57A
	.align 2, 0
_0800D3D8: .4byte 0x040000D4
_0800D3DC: .4byte gGfxCheckmark
_0800D3E0: .4byte 0x06015400
_0800D3E4: .4byte 0x80000100
_0800D3E8: .4byte gPalCheckmark
_0800D3EC: .4byte 0x05000360
_0800D3F0: .4byte 0x80000010
_0800D3F4: .4byte gUnknown_03002920
_0800D3F8: .4byte gAnimation+0x52
_0800D3FC: .4byte gJoypad
_0800D400: .4byte gMain
_0800D404:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D45E
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800D41E
	b _0800D57C
_0800D41E:
	movs r0, #0x31
	str r3, [sp, #0x14]
	bl PlaySE
	movs r0, #8
	mov r1, sl
	strb r0, [r1, #0xa]
	ldr r0, _0800D450 @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r1, #0xc]
	movs r0, #7
	str r0, [r1, #8]
	ldr r5, _0800D454 @ =gOamObjects+0x130
	movs r7, #0
	movs r0, #0x96
	lsls r0, r0, #1
	ldr r3, [sp, #0x14]
_0800D440:
	strh r0, [r5, #2]
	adds r5, #8
	adds r7, #1
	cmp r7, #7
	bls _0800D440
	movs r2, #0
	mov sb, r2
	b _0800D57C
	.align 2, 0
_0800D450: .4byte gUnknown_030037B8
_0800D454: .4byte gOamObjects+0x130
_0800D458:
	ldr r6, [sp]
	strb r4, [r6, #4]
	b _0800D486
_0800D45E:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800D49E
	movs r7, #0
	ldr r1, [sp]
	ldrb r0, [r1, #4]
	subs r4, r0, #1
	adds r2, r0, #0
	movs r5, #3
	adds r1, #0x14
_0800D474:
	ands r4, r5
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D458
	subs r4, #1
	adds r7, #1
	cmp r7, #3
	bls _0800D474
_0800D486:
	ldr r4, [sp]
	ldrb r4, [r4, #4]
	cmp r2, r4
	beq _0800D57C
	movs r0, #0x2a
	str r3, [sp, #0x14]
	bl PlaySE
	b _0800D57A
_0800D498:
	ldr r6, [sp]
	strb r4, [r6, #4]
	b _0800D4CA
_0800D49E:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0800D4DC
	movs r7, #0
	ldr r1, [sp]
	ldrb r0, [r1, #4]
	adds r4, r0, #1
	adds r2, r0, #0
	movs r5, #3
	adds r1, #0x14
_0800D4B8:
	ands r4, r5
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D498
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bls _0800D4B8
_0800D4CA:
	ldr r4, [sp]
	ldrb r4, [r4, #4]
	cmp r2, r4
	beq _0800D57C
	movs r0, #0x2a
	str r3, [sp, #0x14]
	bl PlaySE
	b _0800D57A
_0800D4DC:
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0800D55C
	movs r0, #0x2b
	str r3, [sp, #0x14]
	bl PlaySE
	ldr r6, [sp]
	ldrb r6, [r6, #4]
	lsls r1, r6, #1
	ldr r3, [sp, #0x14]
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r0, r1
	ldrh r2, [r0]
	adds r0, r2, #0
	bl ChangeScriptSection
	movs r0, #1
	bl SlideTextbox
	ldr r3, [sp, #0x14]
	adds r4, r3, #0
	adds r4, #8
	ldr r1, [sp]
	ldrb r1, [r1, #4]
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #2
	bl GetFlag
	str r4, [sp, #4]
	ldr r3, [sp, #0x14]
	cmp r0, #0
	bne _0800D53A
	ldr r2, [sp]
	ldrb r2, [r2, #4]
	adds r0, r2, r4
	ldrb r1, [r0]
	movs r0, #2
	movs r2, #1
	bl ChangeFlag
	ldr r3, [sp, #0x14]
_0800D53A:
	ldr r0, [sp]
	movs r1, #4
	str r3, [sp, #0x14]
	bl SetInactiveActionButtons
	movs r0, #0xf0
	ldr r4, [sp]
	strb r0, [r4, #0x11]
	movs r0, #3
	strb r0, [r4, #0x10]
	movs r0, #6
	mov r6, sl
	strb r0, [r6, #0xa]
	strb r5, [r6, #0xb]
	movs r0, #0
	mov sb, r0
	b _0800D57A
_0800D55C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800D57C
	movs r0, #0x2c
	str r3, [sp, #0x14]
	bl PlaySE
	mov r1, sl
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	strb r4, [r1, #0xb]
	movs r2, #0
	mov sb, r2
_0800D57A:
	ldr r3, [sp, #0x14]
_0800D57C:
	ldr r5, _0800D5EC @ =gOamObjects+0x110
	mov r4, sb
	cmp r4, #0
	beq _0800D642
	movs r7, #0
	adds r6, r3, #0
	adds r6, #8
	str r6, [sp, #4]
	ldr r6, _0800D5F0 @ =0x040000D4
	movs r0, #0x10
	mov sl, r0
	movs r1, #0x16
	mov sb, r1
	adds r3, #0xc
	mov r8, r3
_0800D59A:
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	movs r4, #0
_0800D5A2:
	ldr r2, [sp, #4]
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r0, #2
	bl GetFlag
	cmp r0, #0
	beq _0800D628
	mov r3, r8
	ldrh r0, [r3]
	bl sub_800BF4C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800D610
	ldr r0, _0800D5F4 @ =gGfxInvestigationPsycheLock
	str r0, [r6]
	ldr r0, _0800D5F8 @ =0x06013000
	str r0, [r6, #4]
	ldr r0, _0800D5FC @ =0x80000100
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _0800D600 @ =gPalInvestigationPsycheLock
	str r0, [r6]
	ldr r0, _0800D604 @ =0x050002E0
	str r0, [r6, #4]
	ldr r0, _0800D608 @ =0x80000010
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r4, sb
	strh r4, [r5]
	ldr r0, _0800D60C @ =0x00008024
	strh r0, [r5, #2]
	movs r0, #0xe3
	lsls r0, r0, #7
	strh r0, [r5, #4]
	b _0800D62E
	.align 2, 0
_0800D5EC: .4byte gOamObjects+0x110
_0800D5F0: .4byte 0x040000D4
_0800D5F4: .4byte gGfxInvestigationPsycheLock
_0800D5F8: .4byte 0x06013000
_0800D5FC: .4byte 0x80000100
_0800D600: .4byte gPalInvestigationPsycheLock
_0800D604: .4byte 0x050002E0
_0800D608: .4byte 0x80000010
_0800D60C: .4byte 0x00008024
_0800D610:
	mov r0, sl
	strh r0, [r5]
	ldr r0, _0800D620 @ =0x00008030
	strh r0, [r5, #2]
	ldr r0, _0800D624 @ =0x0000B2A0
	strh r0, [r5, #4]
	b _0800D62E
	.align 2, 0
_0800D620: .4byte 0x00008030
_0800D624: .4byte 0x0000B2A0
_0800D628:
	adds r4, #1
	cmp r4, #3
	bls _0800D5A2
_0800D62E:
	adds r5, #8
	movs r1, #0x1e
	add sl, r1
	add sb, r1
	movs r2, #2
	add r8, r2
	adds r7, #1
	cmp r7, #3
	bls _0800D59A
	b _0800DB04
_0800D642:
	movs r7, #0
	movs r0, #0x96
	lsls r0, r0, #1
_0800D648:
	strh r0, [r5, #2]
	adds r5, #8
	adds r7, #1
	cmp r7, #3
	bls _0800D648
	b _0800DB04
_0800D654:
	ldr r3, _0800D6D4 @ =gOamObjects+0x1B0
	mov r4, sl
	ldrb r4, [r4, #0xb]
	cmp r4, #0xc
	bhi _0800D68A
	adds r5, r3, #0
	subs r5, #0x80
	movs r7, #0
	movs r2, #4
_0800D666:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D66C:
	ldrh r0, [r5]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D66C
	adds r7, #1
	cmp r7, #3
	bls _0800D666
	mov r6, sl
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800D68A:
	adds r5, r3, #0
	ldrh r0, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	adds r0, #9
	ldr r1, _0800D6D8 @ =0x000001FF
	ands r0, r1
	strh r0, [r5, #2]
	cmp r0, #0x77
	bls _0800D6CA
	movs r0, #0x78
	strh r0, [r5, #2]
	ldr r0, [sp]
	movs r1, #0xb
	str r2, [sp, #0x10]
	bl SetInactiveActionButtons
	movs r0, #2
	ldr r1, [sp]
	strb r0, [r1, #0x10]
	movs r0, #0xe0
	strb r0, [r1, #0x11]
	movs r0, #0x10
	strb r0, [r1, #0x12]
	movs r0, #0
	strb r0, [r1, #0x13]
	mov r3, sl
	ldrb r0, [r3, #0xa]
	adds r0, #1
	strb r0, [r3, #0xa]
	ldr r2, [sp, #0x10]
_0800D6CA:
	ldrh r4, [r5, #2]
	orrs r2, r4
	strh r2, [r5, #2]
	b _0800DB04
	.align 2, 0
_0800D6D4: .4byte gOamObjects+0x1B0
_0800D6D8: .4byte 0x000001FF
_0800D6DC:
	mov r6, sl
	ldrb r6, [r6, #0xb]
	cmp r6, #0xc
	bhi _0800D70E
	ldr r5, _0800D76C @ =gOamObjects+0x130
	movs r7, #0
	movs r2, #4
_0800D6EA:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D6F0:
	ldrh r0, [r5]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D6F0
	adds r7, #1
	cmp r7, #3
	bls _0800D6EA
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D70E:
	ldr r2, [sp]
	ldrb r0, [r2, #0x12]
	cmp r0, #8
	bls _0800D71A
	subs r0, #1
	strb r0, [r2, #0x12]
_0800D71A:
	ldr r3, [sp]
	ldrb r2, [r3, #0x10]
	cmp r2, #0
	beq _0800D724
	b _0800DB04
_0800D724:
	mov r4, sl
	ldrb r4, [r4, #0xb]
	cmp r4, #0xc
	bhi _0800D72E
	b _0800DB04
_0800D72E:
	ldr r1, _0800D770 @ =0x040000D4
	ldr r0, _0800D774 @ =gGfx4bppInvestigationScrollButton
	str r0, [r1]
	ldr r0, _0800D778 @ =0x06013000
	str r0, [r1, #4]
	ldr r0, _0800D77C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800D780 @ =gPalInvestigationScrollPrompt
	str r0, [r1]
	ldr r0, _0800D784 @ =0x050002E0
	str r0, [r1, #4]
	ldr r0, _0800D788 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x82
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #8]
	movs r0, #1
	ldrb r1, [r3, #0xc]
	lsls r0, r1
	ldrb r3, [r3, #8]
	adds r0, r3, r0
	ldr r4, [sp]
	strb r0, [r4, #8]
	movs r0, #8
	strb r0, [r4, #0x12]
	strb r2, [r4, #0x13]
	b _0800DB04
	.align 2, 0
_0800D76C: .4byte gOamObjects+0x130
_0800D770: .4byte 0x040000D4
_0800D774: .4byte gGfx4bppInvestigationScrollButton
_0800D778: .4byte 0x06013000
_0800D77C: .4byte 0x80000100
_0800D780: .4byte gPalInvestigationScrollPrompt
_0800D784: .4byte 0x050002E0
_0800D788: .4byte 0x80000010
_0800D78C:
	mov r0, sl
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800D798
	b _0800DB5C
_0800D798:
	ldr r1, _0800D7D0 @ =gJoypad
	movs r0, #8
	ldrh r6, [r1, #2]
	ands r0, r6
	adds r2, r1, #0
	ldr r6, _0800D7D4 @ =gScriptContext
	cmp r0, #0
	beq _0800D7DC
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800D7DC
	movs r0, #5
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800D7DC
	ldr r0, _0800D7D8 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	beq _0800D7DC
	movs r0, #0
	bl sub_800A3A0
	b _0800DB5C
	.align 2, 0
_0800D7D0: .4byte gJoypad
_0800D7D4: .4byte gScriptContext
_0800D7D8: .4byte gMain
_0800D7DC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r2, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800D818
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800D818
	movs r0, #5
	ldrh r2, [r6, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800D818
	movs r0, #0x31
	bl PlaySE
	ldr r0, _0800D814 @ =gUnknown_030037B8
	ldr r0, [r0]
	mov r3, sl
	str r0, [r3, #0xc]
	movs r0, #7
	str r0, [r3, #8]
	b _0800DB5C
	.align 2, 0
_0800D814: .4byte gUnknown_030037B8
_0800D818:
	mov r4, sl
	ldrb r4, [r4, #0xb]
	cmp r4, #0xc
	bhi _0800D84C
	ldr r5, _0800D924 @ =gOamObjects+0x130
	movs r7, #0
	movs r3, #4
_0800D826:
	movs r4, #0
	adds r2, r7, #1
	subs r0, r3, r7
	lsls r1, r0, #1
_0800D82E:
	ldrh r0, [r5]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D82E
	adds r7, r2, #0
	cmp r7, #3
	bls _0800D826
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D84C:
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800D858
	b _0800DB04
_0800D858:
	movs r0, #8
	ldrh r6, [r6, #0x1c]
	ands r0, r6
	cmp r0, #0
	bne _0800D864
	b _0800DB5C
_0800D864:
	ldr r5, _0800D928 @ =gOamObjects+0x1B0
	movs r0, #0xfe
	lsls r0, r0, #8
	ldrh r2, [r5, #2]
	ands r0, r2
	strh r0, [r5, #2]
	ldr r3, _0800D92C @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	subs r5, #0x80
	ldr r4, [sp]
	adds r4, #0x14
	str r4, [sp, #8]
	cmp r0, #0xff
	beq _0800D8A6
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800D930 @ =gAnimation+0x52
_0800D88A:
	cmp r2, r1
	bne _0800D89C
	ldrb r6, [r4]
	ldrb r0, [r3, #1]
	cmp r6, r0
	bne _0800D89C
	ldrb r1, [r3, #3]
	cmp r1, #1
	beq _0800D8A6
_0800D89C:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800D88A
_0800D8A6:
	adds r6, r3, #4
	movs r7, #0
	ldr r2, [sp, #8]
	mov r8, r2
_0800D8AE:
	lsls r0, r7, #0xb
	ldr r3, _0800D934 @ =0x06013400
	adds r3, r3, r0
	mov sb, r3
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0800D94C
	movs r0, #1
	mov r4, r8
	strb r0, [r4]
	ldr r2, _0800D938 @ =gUnknown_0200AFC0
	ldr r1, _0800D93C @ =gUnknown_08026810
	ldrb r3, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl LZ77UnCompWram
	ldr r1, _0800D940 @ =0x040000D4
	ldr r2, [sp, #0x10]
	str r2, [r1]
	mov r4, sb
	str r4, [r1, #4]
	ldr r0, _0800D944 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	lsls r0, r7, #2
	adds r2, r6, #1
	movs r6, #0x81
	lsls r6, r6, #7
	adds r6, r6, r0
	mov ip, r6
	movs r3, #0xd0
	lsls r3, r3, #1
	lsls r0, r7, #6
	str r0, [sp, #0x18]
	movs r1, #0x90
	lsls r1, r1, #8
	mov sb, r1
	ldr r1, _0800D948 @ =0x0000C038
_0800D904:
	mov r6, ip
	strh r6, [r5]
	strh r1, [r5, #2]
	ldr r6, [sp, #0x18]
	adds r0, r3, r6
	mov r6, sb
	orrs r0, r6
	strh r0, [r5, #4]
	adds r5, #8
	adds r3, #0x20
	adds r1, #0x40
	adds r4, #1
	cmp r4, #1
	bls _0800D904
	b _0800D960
	.align 2, 0
_0800D924: .4byte gOamObjects+0x130
_0800D928: .4byte gOamObjects+0x1B0
_0800D92C: .4byte gUnknown_03002920
_0800D930: .4byte gAnimation+0x52
_0800D934: .4byte 0x06013400
_0800D938: .4byte gUnknown_0200AFC0
_0800D93C: .4byte gUnknown_08026810
_0800D940: .4byte 0x040000D4
_0800D944: .4byte 0x80000400
_0800D948: .4byte 0x0000C038
_0800D94C:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	adds r5, #8
	strh r0, [r5, #2]
	adds r5, #8
	adds r2, r6, #1
_0800D960:
	adds r6, r2, #0
	movs r2, #1
	add r8, r2
	adds r7, #1
	cmp r7, #3
	bls _0800D8AE
	ldr r3, [sp]
	ldrb r4, [r3, #4]
	ldr r6, [sp, #8]
	adds r0, r6, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D982
	cmp r4, #0
	beq _0800D982
	subs r0, r4, #1
	strb r0, [r3, #4]
_0800D982:
	ldr r4, _0800D9A4 @ =gInvestigation
	adds r0, r4, #0
	movs r1, #4
	bl SetInactiveActionButtons
	movs r1, #0
	movs r0, #1
	strb r0, [r4, #0x10]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x13]
	mov r2, sl
	ldrb r0, [r2, #0xa]
	adds r0, #1
	strb r0, [r2, #0xa]
	strb r1, [r2, #0xb]
	b _0800DB04
	.align 2, 0
_0800D9A4: .4byte gInvestigation
_0800D9A8:
	mov r3, sl
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800D9D8
	ldr r5, _0800D9F8 @ =gOamObjects+0x130
	movs r7, #0
	movs r2, #4
_0800D9B6:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D9BC:
	ldrh r6, [r5]
	subs r0, r6, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D9BC
	adds r7, #1
	cmp r7, #3
	bls _0800D9B6
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D9D8:
	ldr r2, [sp]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _0800D9E2
	b _0800DB04
_0800D9E2:
	mov r3, sl
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800D9EC
	b _0800DB04
_0800D9EC:
	movs r0, #3
	mov r4, sl
	strb r0, [r4, #0xa]
	strb r1, [r4, #0xb]
	b _0800DB04
	.align 2, 0
_0800D9F8: .4byte gOamObjects+0x130
_0800D9FC:
	ldr r3, _0800DAB0 @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	ldr r5, _0800DAB4 @ =gOamObjects+0x130
	ldr r6, [sp]
	adds r6, #0x14
	str r6, [sp, #8]
	cmp r0, #0xff
	beq _0800DA32
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800DAB8 @ =gAnimation+0x52
_0800DA16:
	cmp r2, r1
	bne _0800DA28
	ldrb r0, [r4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	bne _0800DA28
	ldrb r6, [r3, #3]
	cmp r6, #1
	beq _0800DA32
_0800DA28:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800DA16
_0800DA32:
	adds r6, r3, #4
	movs r7, #0
	ldr r0, [sp, #8]
	mov r8, r0
	movs r1, #0
	str r1, [sp, #0xc]
_0800DA3E:
	lsls r0, r7, #0xb
	ldr r2, _0800DABC @ =0x06013400
	adds r2, r2, r0
	mov sb, r2
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0800DAD8
	movs r0, #1
	mov r3, r8
	strb r0, [r3]
	ldr r2, _0800DAC0 @ =gUnknown_0200AFC0
	ldr r1, _0800DAC4 @ =gUnknown_08026810
	ldrb r4, [r6]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl LZ77UnCompWram
	ldr r1, _0800DAC8 @ =0x040000D4
	ldr r2, [sp, #0x10]
	str r2, [r1]
	mov r0, sb
	str r0, [r1, #4]
	ldr r0, _0800DACC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	adds r2, r6, #1
	ldr r1, [sp, #0xc]
	ldr r3, _0800DAD0 @ =0x00004018
	adds r1, r1, r3
	mov ip, r1
	movs r3, #0xd0
	lsls r3, r3, #1
	lsls r6, r7, #6
	str r6, [sp, #0x18]
	movs r0, #0x90
	lsls r0, r0, #8
	mov sb, r0
	ldr r1, _0800DAD4 @ =0x0000C038
_0800DA92:
	mov r6, ip
	strh r6, [r5]
	strh r1, [r5, #2]
	ldr r6, [sp, #0x18]
	adds r0, r3, r6
	mov r6, sb
	orrs r0, r6
	strh r0, [r5, #4]
	adds r5, #8
	adds r3, #0x20
	adds r1, #0x40
	adds r4, #1
	cmp r4, #1
	bls _0800DA92
	b _0800DAEC
	.align 2, 0
_0800DAB0: .4byte gUnknown_03002920
_0800DAB4: .4byte gOamObjects+0x130
_0800DAB8: .4byte gAnimation+0x52
_0800DABC: .4byte 0x06013400
_0800DAC0: .4byte gUnknown_0200AFC0
_0800DAC4: .4byte gUnknown_08026810
_0800DAC8: .4byte 0x040000D4
_0800DACC: .4byte 0x80000400
_0800DAD0: .4byte 0x00004018
_0800DAD4: .4byte 0x0000C038
_0800DAD8:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	adds r5, #8
	strh r0, [r5, #2]
	adds r5, #8
	adds r2, r6, #1
_0800DAEC:
	adds r6, r2, #0
	movs r2, #1
	add r8, r2
	ldr r3, [sp, #0xc]
	adds r3, #0x1e
	str r3, [sp, #0xc]
	adds r7, #1
	cmp r7, #3
	bls _0800DA3E
	movs r0, #3
	mov r4, sl

	non_word_aligned_thumb_func_start sub_0800DB02
sub_0800DB02: @ 0x0800DB02
	strb r0, [r4, #0xa]
_0800DB04:
	ldr r5, _0800DB30 @ =gOamObjects+0x130
	movs r7, #0
_0800DB08:
	ldr r6, [sp]
	ldrb r6, [r6, #4]
	cmp r7, r6
	bne _0800DB38
	movs r4, #0
	adds r2, r7, #1
	ldr r3, _0800DB34 @ =0x00000FFF
	movs r0, #0x90
	lsls r0, r0, #8
	adds r1, r0, #0
_0800DB1C:
	adds r0, r3, #0
	ldrh r6, [r5, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r5, #4]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800DB1C
	b _0800DB56
	.align 2, 0
_0800DB30: .4byte gOamObjects+0x130
_0800DB34: .4byte 0x00000FFF
_0800DB38:
	movs r4, #0
	adds r2, r7, #1
	ldr r3, _0800DB6C @ =0x00000FFF
	movs r0, #0xa0
	lsls r0, r0, #8
	adds r1, r0, #0
_0800DB44:
	adds r0, r3, #0
	ldrh r6, [r5, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r5, #4]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800DB44
_0800DB56:
	adds r7, r2, #0
	cmp r7, #3
	bls _0800DB08
_0800DB5C:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DB6C: .4byte 0x00000FFF

	thumb_func_start sub_800DB70
sub_800DB70: @ 0x0800DB70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #4
	bls _0800DB7E
	b _0800DC80
_0800DB7E:
	lsls r0, r0, #2
	ldr r1, _0800DB88 @ =_0800DB8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DB88: .4byte _0800DB8C
_0800DB8C: @ jump table
	.4byte _0800DBA0 @ case 0
	.4byte _0800DBB6 @ case 1
	.4byte _0800DBD4 @ case 2
	.4byte _0800DC38 @ case 3
	.4byte _0800DC58 @ case 4
_0800DBA0:
	ldrb r0, [r4, #0x12]
	cmp r0, #0xf
	bhi _0800DBAA
	adds r0, #1
	strb r0, [r4, #0x12]
_0800DBAA:
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrb r4, [r4, #0x12]
	cmp r4, #0xf
	bls _0800DC80
	b _0800DC50
_0800DBB6:
	ldrb r4, [r4, #0x11]
	cmp r4, #0xe0
	bne _0800DC80
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	ldr r0, _0800DBCC @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r6, #0xc]
	ldr r0, _0800DBD0 @ =gUnknown_02000007
	b _0800DC7E
	.align 2, 0
_0800DBCC: .4byte gUnknown_030037B8
_0800DBD0: .4byte gUnknown_02000007
_0800DBD4:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xe0
	bne _0800DC80
	ldr r0, _0800DC2C @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DC80
	ldr r1, _0800DC30 @ =gOamObjects+0x1A0
	movs r5, #0
	ldr r0, _0800DC34 @ =0x000040E0
	mov ip, r0
	movs r3, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r7, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0800DBF8:
	mov r0, ip
	strh r0, [r1]
	adds r0, r3, r7
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r5, #1
	cmp r5, #3
	bls _0800DBF8
	adds r0, r4, #0
	movs r1, #0xf
	bl SetInactiveActionButtons
	movs r0, #0xe0
	strb r0, [r4, #0x11]
	movs r0, #0x40
	strb r0, [r4, #0x12]
	movs r0, #8
	strb r0, [r4, #0x13]
	movs r0, #3
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	b _0800DC7A
	.align 2, 0
_0800DC2C: .4byte gScriptContext
_0800DC30: .4byte gOamObjects+0x1A0
_0800DC34: .4byte 0x000040E0
_0800DC38:
	adds r0, r4, #0
	movs r1, #7
	bl SetInactiveActionButtons
	movs r1, #0
	movs r0, #2
	strb r0, [r4, #0x10]
	movs r0, #0xe0
	strb r0, [r4, #0x11]
	movs r0, #0x10
	strb r0, [r4, #0x12]
	strb r1, [r4, #0x13]
_0800DC50:
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	b _0800DC80
_0800DC58:
	ldrb r0, [r4, #0x12]
	cmp r0, #8
	bls _0800DC62
	subs r0, #1
	strb r0, [r4, #0x12]
_0800DC62:
	ldrb r1, [r4, #0x10]
	cmp r1, #0
	bne _0800DC80
	movs r0, #8
	strb r0, [r4, #0x12]
	strb r1, [r4, #0x13]
	movs r0, #1
	ldrb r1, [r4, #0xc]
	lsls r0, r1
	ldrb r1, [r4, #8]
	adds r0, r1, r0
	strb r0, [r4, #8]
_0800DC7A:
	movs r0, #0x82
	lsls r0, r0, #1
_0800DC7E:
	str r0, [r6, #8]
_0800DC80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start InvestigationPsycheLock
InvestigationPsycheLock: @ 0x0800DC88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	movs r7, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #9
	bne _0800DC9C
	b _0800E108
_0800DC9C:
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r7, r6, r0
	bl sub_8015900
	ldr r1, _0800DCC4 @ =gUnknown_0814DBE8
	ldrb r4, [r6, #0xa]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DCC4: .4byte gUnknown_0814DBE8
_0800DCC8:
	bl ResetHPBar
	ldrb r0, [r7, #9]
	movs r4, #0
	strb r0, [r7, #8]
	ldrb r1, [r7, #9]
	movs r0, #0xb
	bl sub_8014B40
	movs r0, #1
	movs r1, #0
	bl sub_8014B40
	bl sub_8015880
	ldr r0, _0800DD18 @ =gMain
	ldr r1, _0800DD1C @ =0x00000256
	adds r0, r0, r1
	strb r4, [r0]
	movs r0, #1
	mov r2, r8
	ldrb r2, [r2, #0xb]
	orrs r0, r2
	mov r4, r8
	strb r0, [r4, #0xb]
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
_0800DD00:
	bl sub_8015670
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DD0E
	b _0800E26A
_0800DD0E:
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	b _0800E26A
	.align 2, 0
_0800DD18: .4byte gMain
_0800DD1C: .4byte 0x00000256
_0800DD20:
	ldrh r0, [r7, #0xa]
	bl ChangeScriptSection
	ldr r1, _0800DDC4 @ =gMain
	movs r0, #1
	strb r0, [r1, #0x18]
	movs r0, #3
	strb r0, [r6, #0xa]
_0800DD30:
	ldr r4, _0800DDC4 @ =gMain
	ldr r0, _0800DDC8 @ =0x00000256
	adds r1, r4, r0
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DD84
	ldr r1, _0800DDCC @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	cmp r1, r0
	bne _0800DD84
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DD84
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800DD84
	ldr r1, _0800DDD0 @ =gScriptContext
	movs r0, #0xd
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800DD84
	bl sub_8015B4C
	movs r0, #0x31
	bl PlaySE
	ldr r0, [r4, #8]
	str r0, [r6, #0xc]
	ldr r0, _0800DDD4 @ =gUnknown_03000007
	str r0, [r6, #8]
_0800DD84:
	ldr r4, _0800DDC4 @ =gMain
	ldr r2, _0800DDC8 @ =0x00000256
	adds r1, r4, r2
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DDD8
	bl sub_8015BFC
	cmp r0, #0
	bne _0800DDD8
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r4, [r0]
	cmp r4, #0
	bne _0800DDD8
	ldr r1, _0800DDCC @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #2]
	cmp r1, r0
	bne _0800DDD8
	movs r0, #0x2c
	bl PlaySE
	movs r0, #8
	strb r0, [r6, #0xa]
	strb r4, [r6, #0xb]
	b _0800E038
	.align 2, 0
_0800DDC4: .4byte gMain
_0800DDC8: .4byte 0x00000256
_0800DDCC: .4byte gJoypad
_0800DDD0: .4byte gScriptContext
_0800DDD4: .4byte gUnknown_03000007
_0800DDD8:
	ldr r4, _0800DE58 @ =gMain
	ldr r2, _0800DE5C @ =0x00000256
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DE2C
	bl sub_8015BFC
	cmp r0, #0
	bne _0800DE2C
	ldr r1, _0800DE60 @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	cmp r1, r0
	bne _0800DE2C
	bl sub_8016D48
	cmp r0, #0
	bne _0800DE2C
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800DE2C
	ldr r1, _0800DE64 @ =gScriptContext
	movs r0, #5
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800DE2C
	bl sub_8016D6C
	movs r0, #0x31
	bl PlaySE
	ldr r0, [r4, #8]
	str r0, [r6, #0xc]
	ldr r0, _0800DE68 @ =0x04000007
	str r0, [r6, #8]
_0800DE2C:
	adds r0, r6, #0
	adds r0, #0xa6
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	ble _0800DE3A
	b _0800E26A
_0800DE3A:
	adds r0, r6, #0
	adds r0, #0xa8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _0800DE48
	b _0800E26A
_0800DE48:
	bl IsHPBarAnimating
	cmp r0, #0
	beq _0800DE52
	b _0800E26A
_0800DE52:
	movs r0, #0xb
	strb r0, [r6, #0xa]
	b _0800E26A
	.align 2, 0
_0800DE58: .4byte gMain
_0800DE5C: .4byte 0x00000256
_0800DE60: .4byte gJoypad
_0800DE64: .4byte gScriptContext
_0800DE68: .4byte 0x04000007
_0800DE6C:
	ldrb r2, [r6, #0xb]
	cmp r2, #1
	bne _0800DE74
	b _0800E20A
_0800DE74:
	cmp r2, #1
	bgt _0800DE7E
	cmp r2, #0
	beq _0800DE84
	b _0800E26A
_0800DE7E:
	cmp r2, #2
	beq _0800DEAC
	b _0800E26A
_0800DE84:
	ldr r0, _0800DEA0 @ =gMain
	strb r2, [r0, #0x18]
	strb r2, [r0, #0x19]
	ldr r1, _0800DEA4 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x4a
	ldr r0, _0800DEA8 @ =0x0000FDFF
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	strh r2, [r1, #0xe]
	movs r0, #4
	b _0800E1FE
	.align 2, 0
_0800DEA0: .4byte gMain
_0800DEA4: .4byte gIORegisters
_0800DEA8: .4byte 0x0000FDFF
_0800DEAC:
	ldrb r0, [r7, #8]
	subs r0, #1
	strb r0, [r7, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800DEF0
	ldr r0, _0800DEE4 @ =gMain
	ldr r1, _0800DEE8 @ =0x0000027D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DEF0
	ldr r1, _0800DEEC @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800DEF0
	movs r0, #7
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	movs r0, #3
	bl sub_8017154
	b _0800E26A
	.align 2, 0
_0800DEE4: .4byte gMain
_0800DEE8: .4byte 0x0000027D
_0800DEEC: .4byte gScriptContext
_0800DEF0:
	ldr r0, _0800DF10 @ =gMain
	movs r1, #1
	strb r1, [r0, #0x18]
	ldr r2, _0800DF14 @ =0x0000027D
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DF06
	movs r0, #1
	bl SlideTextbox
_0800DF06:
	movs r0, #3
	strb r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r6, #0xb]
	b _0800E26A
	.align 2, 0
_0800DF10: .4byte gMain
_0800DF14: .4byte 0x0000027D
_0800DF18:
	ldrh r0, [r7, #0x10]
	bl ChangeScriptSection
	movs r0, #1
	bl SlideTextbox
_0800DF24:
	movs r0, #3
	strb r0, [r6, #0xa]
	b _0800E26A
_0800DF2A:
	ldr r0, _0800DF44 @ =gMain
	adds r0, #0xae
	movs r1, #0x64
	strh r1, [r0]
	ldrb r0, [r6, #0xb]
	cmp r0, #4
	bls _0800DF3A
	b _0800E26A
_0800DF3A:
	lsls r0, r0, #2
	ldr r1, _0800DF48 @ =_0800DF4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DF44: .4byte gMain
_0800DF48: .4byte _0800DF4C
_0800DF4C: @ jump table
	.4byte _0800DF60 @ case 0
	.4byte _0800DF7A @ case 1
	.4byte _0800DFC4 @ case 2
	.4byte _0800DFE6 @ case 3
	.4byte _0800E00C @ case 4
_0800DF60:
	ldr r0, _0800DFBC @ =gMain
	movs r1, #0
	strb r1, [r0, #0x18]
	movs r0, #0x1e
	bl FadeOutBGM
	movs r0, #5
	movs r1, #0
	bl sub_8014B40
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800DF7A:
	movs r0, #0x1f
	bl sub_800BC08
	bl sub_8015670
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DF8E
	b _0800E26A
_0800DF8E:
	movs r0, #7
	movs r1, #0
	bl sub_8014B40
	ldr r4, _0800DFBC @ =gMain
	adds r0, r4, #0
	adds r0, #0xa6
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x4f
	ble _0800DFA6
	b _0800E216
_0800DFA6:
	movs r0, #1
	bl sub_8016E74
	adds r1, r4, #0
	adds r1, #0xaa
	ldr r0, _0800DFC0 @ =0x0000FFD8
	strh r0, [r1]
	movs r0, #4
	bl sub_8016E74
	b _0800E216
	.align 2, 0
_0800DFBC: .4byte gMain
_0800DFC0: .4byte 0x0000FFD8
_0800DFC4:
	bl sub_8015670
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl InitSpecialEffects
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DFDC
	b _0800E26A
_0800DFDC:
	movs r0, #6
	movs r1, #0
	bl sub_8014B40
	b _0800E216
_0800DFE6:
	bl sub_8015670
	movs r0, #0
	bl sub_800BC08
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DFFA
	b _0800E26A
_0800DFFA:
	bl IsHPBarAnimating
	cmp r0, #0
	beq _0800E004
	b _0800E26A
_0800E004:
	movs r0, #2
	bl sub_8016E74
	b _0800E216
_0800E00C:
	movs r5, #0
	movs r0, #3
	mov r2, r8
	strb r0, [r2, #0xc]
	strb r0, [r2, #0xd]
	ldr r4, _0800E034 @ =gMain
	movs r0, #1
	strb r0, [r4, #0x18]
	bl sub_800E280
	bl sub_800E4A4
	str r5, [r7]
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
	adds r4, #0xae
	movs r0, #0x14
	strh r0, [r4]
	b _0800E26A
	.align 2, 0
_0800E034: .4byte gMain
_0800E038:
	ldrb r0, [r6, #0xb]
	cmp r0, #5
	bls _0800E040
	b _0800E26A
_0800E040:
	lsls r0, r0, #2
	ldr r1, _0800E04C @ =_0800E050
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E04C: .4byte _0800E050
_0800E050: @ jump table
	.4byte _0800E068 @ case 0
	.4byte _0800E08C @ case 1
	.4byte _0800E0B8 @ case 2
	.4byte _0800E1FC @ case 3
	.4byte _0800E20A @ case 4
	.4byte _0800E0D0 @ case 5
_0800E068:
	ldrh r0, [r7, #0xc]
	bl ChangeScriptSection
	ldr r0, _0800E088 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800E07E
	cmp r0, #4
	beq _0800E07E
	b _0800E216
_0800E07E:
	movs r0, #1
	bl SlideTextbox
	b _0800E216
	.align 2, 0
_0800E088: .4byte gScriptContext
_0800E08C:
	ldr r1, _0800E0B4 @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800E09A
	b _0800E26A
_0800E09A:
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
	movs r0, #0x1e
	bl FadeOutBGM
	movs r0, #0x1e
	bl sub_800BC08
	movs r0, #2
	movs r1, #4
	b _0800E1D0
	.align 2, 0
_0800E0B4: .4byte gScriptContext
_0800E0B8:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800E0C4
	b _0800E26A
_0800E0C4:
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl InitSpecialEffects
	b _0800E216
_0800E0D0:
	bl sub_800E280
	bl sub_800E4A4
	ldr r1, _0800E100 @ =gInvestigation
	movs r0, #0xfe
	ldrb r4, [r1, #0xb]
	ands r0, r4
	strb r0, [r1, #0xb]
	movs r0, #3
	bl sub_8017154
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
	ldr r0, _0800E104 @ =0x0000FFFF
	ldrh r1, [r7, #0x14]
	cmp r1, r0
	beq _0800E0FC
	ldrh r0, [r7, #0x14]
	bl PlayBGM
_0800E0FC:
	movs r0, #1
	b _0800E1CE
	.align 2, 0
_0800E100: .4byte gInvestigation
_0800E104: .4byte 0x0000FFFF
_0800E108:
	ldrb r1, [r6, #0xb]
	cmp r1, #1
	bne _0800E110
	b _0800E20A
_0800E110:
	cmp r1, #1
	bgt _0800E11A
	cmp r1, #0
	beq _0800E120
	b _0800E26A
_0800E11A:
	cmp r1, #2
	beq _0800E150
	b _0800E26A
_0800E120:
	ldr r0, _0800E14C @ =gMain
	strb r1, [r0, #0x18]
	movs r0, #1
	mov r2, r8
	ldrb r2, [r2, #0xb]
	orrs r0, r2
	mov r4, r8
	strb r0, [r4, #0xb]
	movs r0, #0
	bl SlideTextbox
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xb
	bl sub_8014B40
	movs r0, #1
	b _0800E1FE
	.align 2, 0
_0800E14C: .4byte gMain
_0800E150:
	ldr r4, _0800E160 @ =gMain
	movs r0, #1
	strb r0, [r4, #0x18]
	bl SlideTextbox
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_0800E15E:
	b _0800E26A
	.align 2, 0
_0800E160: .4byte gMain
_0800E164:
	ldrb r0, [r6, #0xb]
	cmp r0, #5
	bls _0800E16C
	b _0800E26A
_0800E16C:
	lsls r0, r0, #2
	ldr r1, _0800E178 @ =_0800E17C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E178: .4byte _0800E17C
_0800E17C: @ jump table
	.4byte _0800E194 @ case 0
	.4byte _0800E1B4 @ case 1
	.4byte _0800E1E0 @ case 2
	.4byte _0800E1F2 @ case 3
	.4byte _0800E20A @ case 4
	.4byte _0800E21E @ case 5
_0800E194:
	ldrh r0, [r7, #0x12]
	bl ChangeScriptSection
	ldr r0, _0800E1B0 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800E1A8
	cmp r0, #4
	bne _0800E216
_0800E1A8:
	movs r0, #1
	bl SlideTextbox
	b _0800E216
	.align 2, 0
_0800E1B0: .4byte gScriptContext
_0800E1B4:
	ldr r1, _0800E1DC @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800E26A
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
	movs r0, #0x1e
	bl sub_800BC08
	movs r0, #2
_0800E1CE:
	movs r1, #1
_0800E1D0:
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	b _0800E26A
	.align 2, 0
_0800E1DC: .4byte gScriptContext
_0800E1E0:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800E26A
	movs r0, #0x1e
	bl FadeOutBGM
	b _0800E216
_0800E1F2:
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl InitSpecialEffects
_0800E1FC:
	movs r0, #7
_0800E1FE:
	movs r1, #0
	bl sub_8014B40
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800E20A:
	bl sub_8015670
	bl sub_8014BDC
	cmp r0, #0
	beq _0800E26A
_0800E216:
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
	b _0800E26A
_0800E21E:
	ldr r0, _0800E274 @ =gMain
	adds r1, r0, #0
	adds r1, #0xa8
	movs r2, #1
	strh r2, [r1]
	adds r0, #0xa6
	strh r2, [r0]
	movs r0, #3
	bl sub_8017154
	bl sub_800E280
	bl sub_800E4A4
	ldr r1, _0800E278 @ =gInvestigation
	movs r0, #0xfe
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
	movs r0, #0
	bl SlideTextbox
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
	ldr r0, _0800E27C @ =0x0000FFFF
	ldrh r4, [r7, #0x14]
	cmp r4, r0
	beq _0800E25E
	ldrh r0, [r7, #0x14]
	bl PlayBGM
_0800E25E:
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
_0800E26A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E274: .4byte gMain
_0800E278: .4byte gInvestigation
_0800E27C: .4byte 0x0000FFFF

	thumb_func_start sub_800E280
sub_800E280: @ 0x0800E280
	push {r4, r5, r6, lr}
	ldr r0, _0800E30C @ =0x040000D4
	ldr r1, _0800E310 @ =gGfx4bppInvestigationActions
	str r1, [r0]
	ldr r1, _0800E314 @ =0x06012000
	str r1, [r0, #4]
	ldr r1, _0800E318 @ =0x80000800
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E31C @ =gPalActionButtons1
	str r1, [r0]
	ldr r1, _0800E320 @ =0x050002A0
	str r1, [r0, #4]
	ldr r4, _0800E324 @ =0x80000020
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E328 @ =gGfx4bppInvestigationScrollButton
	str r1, [r0]
	ldr r1, _0800E32C @ =0x06013000
	str r1, [r0, #4]
	ldr r3, _0800E330 @ =0x80000100
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E334 @ =gPalInvestigationScrollPrompt
	str r1, [r0]
	ldr r1, _0800E338 @ =0x050002E0
	str r1, [r0, #4]
	ldr r2, _0800E33C @ =0x80000010
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E340 @ =gGfxExamineCursor
	str r1, [r0]
	ldr r1, _0800E344 @ =0x06013200
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E348 @ =gPalExamineCursors
	str r1, [r0]
	ldr r1, _0800E34C @ =0x05000300
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E350 @ =gPalChoiceSelected
	str r1, [r0]
	ldr r1, _0800E354 @ =0x05000320
	str r1, [r0, #4]
	str r4, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _0800E358 @ =gOamObjects+0x1A0
	movs r4, #0
	ldr r6, _0800E35C @ =0x000040E0
	movs r3, #0
	ldr r0, _0800E360 @ =0xFFFFC000
	adds r5, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0800E2F0:
	strh r6, [r1]
	adds r0, r3, r5
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r4, #1
	cmp r4, #3
	ble _0800E2F0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E30C: .4byte 0x040000D4
_0800E310: .4byte gGfx4bppInvestigationActions
_0800E314: .4byte 0x06012000
_0800E318: .4byte 0x80000800
_0800E31C: .4byte gPalActionButtons1
_0800E320: .4byte 0x050002A0
_0800E324: .4byte 0x80000020
_0800E328: .4byte gGfx4bppInvestigationScrollButton
_0800E32C: .4byte 0x06013000
_0800E330: .4byte 0x80000100
_0800E334: .4byte gPalInvestigationScrollPrompt
_0800E338: .4byte 0x050002E0
_0800E33C: .4byte 0x80000010
_0800E340: .4byte gGfxExamineCursor
_0800E344: .4byte 0x06013200
_0800E348: .4byte gPalExamineCursors
_0800E34C: .4byte 0x05000300
_0800E350: .4byte gPalChoiceSelected
_0800E354: .4byte 0x05000320
_0800E358: .4byte gOamObjects+0x1A0
_0800E35C: .4byte 0x000040E0
_0800E360: .4byte 0xFFFFC000

	thumb_func_start sub_800E364
sub_800E364: @ 0x0800E364
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	bl sub_800E280
	cmp r4, #0
	bne _0800E394
	ldr r0, _0800E390 @ =gInvestigation
	movs r1, #0xfe
	ldrb r2, [r0, #0xb]
	ands r1, r2
	strb r1, [r0, #0xb]
	movs r1, #3
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	b _0800E496
	.align 2, 0
_0800E390: .4byte gInvestigation
_0800E394:
	cmp r4, #1
	bne _0800E46C
	ldr r1, _0800E44C @ =gInvestigation
	movs r0, #0xfe
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
	ldr r3, _0800E450 @ =gOamObjects+0x1A0
	movs r4, #0
	adds r5, r1, #0
	ldr r7, _0800E454 @ =0x000040E0
	movs r2, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r6, r0, #0
	movs r1, #0xa2
	lsls r1, r1, #7
_0800E3B6:
	strh r7, [r3]
	adds r0, r2, r6
	strh r0, [r3, #2]
	strh r1, [r3, #4]
	adds r3, #8
	adds r2, #0x3c
	adds r1, #0x20
	adds r4, #1
	cmp r4, #3
	bls _0800E3B6
	ldr r4, _0800E450 @ =gOamObjects+0x1A0
	adds r0, r5, #0
	movs r1, #4
	bl SetInactiveActionButtons
	movs r1, #0
	movs r0, #0xd0
	strb r0, [r5, #0x11]
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x13]
	movs r0, #2
	strb r0, [r5, #0xc]
	strb r0, [r5, #0xd]
	movs r0, #0xfe
	ldrb r1, [r5, #0xb]
	ands r0, r1
	strb r0, [r5, #0xb]
	movs r0, #5
	strb r0, [r5, #0x10]
	adds r3, r4, #0
	adds r3, #0x10
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ldrh r1, [r4, #0x10]
	ands r0, r1
	movs r1, #0xf0
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r3, #2]
	ands r2, r0
	strh r2, [r3, #2]
	ldr r0, _0800E458 @ =0x00006540
	strh r0, [r3, #4]
	ldr r2, _0800E45C @ =gMain
	movs r0, #8
	strb r0, [r2, #9]
	movs r0, #1
	strb r0, [r2, #0xa]
	mov r1, r8
	strb r1, [r5, #5]
	ldr r1, _0800E460 @ =gIORegisters
	ldr r0, _0800E464 @ =0x0000FFB3
	strh r0, [r1, #0xe]
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #0xe3
	lsls r2, r2, #1
	adds r1, r0, r2
	ldr r0, _0800E468 @ =0x0000FFFF
	ldrh r2, [r1]
	cmp r2, r0
	beq _0800E496
	ldrh r0, [r1]
	bl PlayBGM
	b _0800E496
	.align 2, 0
_0800E44C: .4byte gInvestigation
_0800E450: .4byte gOamObjects+0x1A0
_0800E454: .4byte 0x000040E0
_0800E458: .4byte 0x00006540
_0800E45C: .4byte gMain
_0800E460: .4byte gIORegisters
_0800E464: .4byte 0x0000FFB3
_0800E468: .4byte 0x0000FFFF
_0800E46C:
	cmp r4, #2
	bne _0800E488
	ldr r0, _0800E484 @ =gInvestigation
	movs r1, #0xfe
	ldrb r2, [r0, #0xb]
	ands r1, r2
	movs r2, #0
	strb r1, [r0, #0xb]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	b _0800E496
	.align 2, 0
_0800E484: .4byte gInvestigation
_0800E488:
	cmp r5, #3
	beq _0800E496
	cmp r5, #4
	bne _0800E496
	ldr r1, _0800E4A0 @ =gInvestigation
	movs r0, #2
	strb r0, [r1, #0x10]
_0800E496:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E4A0: .4byte gInvestigation

	thumb_func_start sub_800E4A4
sub_800E4A4: @ 0x0800E4A4
	push {r4, lr}
	ldr r0, _0800E4F0 @ =gOamObjects+0x1A0
	ldr r3, _0800E4F4 @ =0x000040E0
	strh r3, [r0]
	movs r2, #0xfe
	lsls r2, r2, #8
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	strh r4, [r0, #2]
	adds r0, #8
	strh r3, [r0]
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	movs r1, #0x3c
	orrs r4, r1
	strh r4, [r0, #2]
	adds r0, #8
	strh r3, [r0]
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	movs r1, #0x78
	orrs r4, r1
	strh r4, [r0, #2]
	adds r0, #8
	strh r3, [r0]
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	movs r1, #0xb4
	orrs r4, r1
	strh r4, [r0, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E4F0: .4byte gOamObjects+0x1A0
_0800E4F4: .4byte 0x000040E0

	thumb_func_start sub_800E4F8
sub_800E4F8: @ 0x0800E4F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	ldr r4, _0800E524 @ =gOamObjects+0x1A0
	movs r0, #1
	ldrb r1, [r3, #0xb]
	ands r0, r1
	cmp r0, #0
	beq _0800E510
	b _0800E696
_0800E510:
	ldrb r0, [r3, #0x10]
	cmp r0, #5
	bls _0800E518
	b _0800E62A
_0800E518:
	lsls r0, r0, #2
	ldr r1, _0800E528 @ =_0800E52C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E524: .4byte gOamObjects+0x1A0
_0800E528: .4byte _0800E52C
_0800E52C: @ jump table
	.4byte _0800E544 @ case 0
	.4byte _0800E5D4 @ case 1
	.4byte _0800E5F0 @ case 2
	.4byte _0800E608 @ case 3
	.4byte _0800E62A @ case 4
	.4byte _0800E620 @ case 5
_0800E544:
	movs r5, #0
	ldr r7, _0800E580 @ =gIORegisters
	mov sb, r7
	movs r0, #0x80
	lsls r0, r0, #7
	mov ip, r0
	movs r1, #0xff
	lsls r1, r1, #8
	mov r8, r1
	movs r6, #0xaa
	lsls r6, r6, #7
	movs r7, #0
_0800E55C:
	ldrb r0, [r3, #0xc]
	cmp r0, r5
	bne _0800E584
	mov r0, ip
	strh r0, [r4]
	ldrb r2, [r3, #0x12]
	adds r2, #0xf0
	movs r0, #0xff
	ands r2, r0
	mov r1, ip
	adds r0, r2, r1
	strh r0, [r4]
	movs r1, #0xca
	lsls r1, r1, #7
	adds r0, r7, r1
	strh r0, [r4, #4]
	b _0800E5BA
	.align 2, 0
_0800E580: .4byte gIORegisters
_0800E584:
	ldrb r0, [r3, #0xd]
	cmp r0, r5
	bne _0800E59E
	mov r0, r8
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r1, [r3, #0x11]
	orrs r0, r1
	strh r0, [r4]
	ldrb r1, [r3, #0x13]
	adds r0, r1, r0
	b _0800E5B6
_0800E59E:
	ldrb r0, [r3, #8]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E5B8
	mov r0, r8
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r1, [r3, #0x11]
	orrs r0, r1
_0800E5B6:
	strh r0, [r4]
_0800E5B8:
	strh r6, [r4, #4]
_0800E5BA:
	adds r4, #8
	adds r6, #0x20
	adds r7, #0x20
	adds r5, #1
	cmp r5, #3
	bls _0800E55C
	ldr r0, _0800E5D0 @ =0x0000FFAC
	mov r5, sb
	strh r0, [r5, #0xe]
	b _0800E696
	.align 2, 0
_0800E5D0: .4byte 0x0000FFAC
_0800E5D4:
	ldrb r5, [r3, #0xc]
	lsls r0, r5, #3
	adds r4, r4, r0
	lsls r0, r5, #5
	movs r7, #0xca
	lsls r7, r7, #7
	adds r0, r0, r7
	strh r0, [r4, #4]
	movs r0, #0xe0
	strb r0, [r3, #0x11]
	ldrb r0, [r3, #0x10]
	adds r0, #1
	strb r0, [r3, #0x10]
	b _0800E62A
_0800E5F0:
	ldrb r0, [r3, #0x11]
	adds r0, #2
	strb r0, [r3, #0x11]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xef
	bls _0800E62A
	movs r0, #0xf0
	strb r0, [r3, #0x11]
	movs r0, #0
	strb r0, [r3, #0x10]
	b _0800E62A
_0800E608:
	ldrb r0, [r3, #0x11]
	subs r0, #2
	strb r0, [r3, #0x11]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe0
	bhi _0800E62A
	movs r0, #0xe0
	strb r0, [r3, #0x11]
	movs r0, #4
	strb r0, [r3, #0x10]
	b _0800E62A
_0800E620:
	movs r0, #0xf0
	strb r0, [r3, #0x11]
	movs r0, #4
	strb r0, [r3, #0x10]
	b _0800E696
_0800E62A:
	ldr r2, _0800E66C @ =gMain
	adds r0, r2, #0
	adds r0, #0xc0
	ldrb r5, [r0]
	lsls r1, r5, #2
	adds r1, r1, r5
	movs r7, #0x96
	lsls r7, r7, #1
	adds r0, r2, r7
	adds r1, r1, r0
	ldrb r5, [r1]
	ldrh r2, [r2, #0x34]
	cmp r5, r2
	beq _0800E64A
	movs r0, #0x40
	strb r0, [r3, #0x12]
_0800E64A:
	movs r5, #0
	movs r6, #0xff
	lsls r6, r6, #8
_0800E650:
	ldrb r0, [r3, #8]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E670
	adds r0, r6, #0
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r7, [r3, #0x11]
	orrs r0, r7
	b _0800E68C
	.align 2, 0
_0800E66C: .4byte gMain
_0800E670:
	ldrb r0, [r3, #0xc]
	cmp r0, r5
	bne _0800E68E
	adds r0, r6, #0
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	ldrb r7, [r3, #0x12]
	subs r2, r1, r7
	movs r1, #0xff
	ands r2, r1
	adds r0, r0, r2
_0800E68C:
	strh r0, [r4]
_0800E68E:
	adds r4, #8
	adds r5, #1
	cmp r5, #3
	bls _0800E650
_0800E696:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E6A4
sub_800E6A4: @ 0x0800E6A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0800E6E8 @ =gOamObjects+0x1C0
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4]
	cmp r1, #0
	beq _0800E720
	ldr r0, _0800E6EC @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E720
	ldrh r0, [r5, #0x34]
	bl sub_80051AC
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0800E720
	ldr r0, _0800E6F0 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0800E700
	ldr r0, _0800E6F4 @ =0x00004020
	strh r0, [r4]
	ldr r0, _0800E6F8 @ =0x000080D0
	strh r0, [r4, #2]
	ldr r0, _0800E6FC @ =0x00007188
	b _0800E71E
	.align 2, 0
_0800E6E8: .4byte gOamObjects+0x1C0
_0800E6EC: .4byte gScriptContext
_0800E6F0: .4byte gMain
_0800E6F4: .4byte 0x00004020
_0800E6F8: .4byte 0x000080D0
_0800E6FC: .4byte 0x00007188
_0800E700:
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xf0
	beq _0800E710
	cmp r0, #0x78
	bne _0800E720
_0800E710:
	ldr r0, _0800E728 @ =0x00004020
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r4, #2]
	movs r0, #0xe3
	lsls r0, r0, #7
_0800E71E:
	strh r0, [r4, #4]
_0800E720:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E728: .4byte 0x00004020

	thumb_func_start sub_800E72C
sub_800E72C: @ 0x0800E72C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r1, [r5]
	cmp r1, #0x77
	bhi _0800E748
	ldr r3, _0800E744 @ =gMain
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	adds r1, r1, r0
	b _0800E754
	.align 2, 0
_0800E744: .4byte gMain
_0800E748:
	ldr r3, _0800E7C0 @ =gMain
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r1, #0xc
_0800E754:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0800E7C4 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	adds r4, r3, #0
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	ldrh r5, [r5, #2]
	adds r1, r0, r5
	lsls r1, r1, #0x10
	ldr r2, _0800E7C8 @ =0x0000FFFF
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldr r1, _0800E7C4 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800E7CC
	adds r0, r4, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #3
	bne _0800E7E2
	movs r0, #0
	movs r1, #0x13
	bl GetFlag
	cmp r0, #0
	bne _0800E7E2
	movs r0, #0
	movs r1, #0xa
	bl GetFlag
	cmp r0, #0
	beq _0800E7E2
	movs r0, #0x94
	lsls r0, r0, #1
	b _0800E86C
	.align 2, 0
_0800E7C0: .4byte gMain
_0800E7C4: .4byte 0xFFFF0000
_0800E7C8: .4byte 0x0000FFFF
_0800E7CC:
	cmp r0, #4
	bne _0800E7E2
	adds r0, r3, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800E7E2
	movs r0, #0xdf
	b _0800E86C
_0800E7DE:
	ldrh r0, [r4]
	b _0800E86C
_0800E7E2:
	ldr r0, _0800E810 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800E802
	mov r0, sp
	ldrh r1, [r0]
	subs r1, #0xf0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0800E814 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
_0800E802:
	mov r0, sp
	bl sub_8012258
	adds r2, r0, #0
	ldr r4, _0800E818 @ =gUnknown_03003C70
	b _0800E828
	.align 2, 0
_0800E810: .4byte gMain
_0800E814: .4byte 0xFFFF0000
_0800E818: .4byte gUnknown_03003C70
_0800E81C:
	cmp r1, #0xfe
	bne _0800E826
	ldrb r0, [r4, #3]
	cmp r2, r0
	beq _0800E7DE
_0800E826:
	adds r4, #0x14
_0800E828:
	ldrb r1, [r4, #2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800E81C
	ldr r0, _0800E848 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800E844
	mov r0, sp
	ldrh r1, [r0]
	adds r1, #0xf0
	strh r1, [r0]
_0800E844:
	ldr r4, _0800E84C @ =gUnknown_03003C70
	b _0800E862
	.align 2, 0
_0800E848: .4byte gMain
_0800E84C: .4byte gUnknown_03003C70
_0800E850:
	cmp r1, #0xfe
	beq _0800E860
	adds r1, r4, #4
	mov r0, sp
	bl sub_8012504
	cmp r0, #0
	bne _0800E7DE
_0800E860:
	adds r4, #0x14
_0800E862:
	ldrb r1, [r4, #2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800E850
	movs r0, #0x1e
_0800E86C:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800E874
sub_800E874: @ 0x0800E874
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r2, _0800E8D4 @ =gMain
	adds r1, r2, #0
	adds r1, #0xc0
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r4, r2, r0
	ldr r0, _0800E8D8 @ =0x0000012D
	adds r4, r4, r0
	movs r7, #0
	ldr r2, _0800E8DC @ =gUnknown_0200AFC0
	ldr r1, _0800E8E0 @ =gUnknown_08026960
	mov r8, r1
	ldr r5, _0800E8E4 @ =0x040000D4
_0800E898:
	lsls r0, r7, #0xb
	ldr r3, _0800E8E8 @ =0x06013400
	adds r6, r0, r3
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0800E8C0
	ldrb r1, [r4]
	lsls r0, r1, #2
	add r0, r8
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp]
	bl LZ77UnCompWram
	ldr r2, [sp]
	str r2, [r5]
	str r6, [r5, #4]
	ldr r0, _0800E8EC @ =0x80000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
_0800E8C0:
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bls _0800E898
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E8D4: .4byte gMain
_0800E8D8: .4byte 0x0000012D
_0800E8DC: .4byte gUnknown_0200AFC0
_0800E8E0: .4byte gUnknown_08026960
_0800E8E4: .4byte 0x040000D4
_0800E8E8: .4byte 0x06013400
_0800E8EC: .4byte 0x80000400

	thumb_func_start sub_800E8F0
sub_800E8F0: @ 0x0800E8F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r2, _0800E98C @ =gUnknown_03002920
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800E924
	ldr r0, _0800E990 @ =gUnknown_03003870
	ldrb r3, [r0]
	ldr r4, _0800E994 @ =gAnimation+0x52
_0800E908:
	cmp r3, r1
	bne _0800E91A
	ldrb r0, [r4]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _0800E91A
	ldrb r0, [r2, #3]
	cmp r0, #1
	beq _0800E924
_0800E91A:
	adds r2, #0x14
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800E908
_0800E924:
	adds r4, r2, #4
	movs r6, #0
	ldr r2, _0800E998 @ =gUnknown_0200AFC0
	ldr r1, _0800E99C @ =gUnknown_08026810
	mov r8, r1
	ldr r5, _0800E9A0 @ =0x040000D4
_0800E930:
	lsls r0, r6, #0xb
	ldr r1, _0800E9A4 @ =0x06013400
	adds r7, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0800E958
	ldrb r1, [r4]
	lsls r0, r1, #2
	add r0, r8
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp]
	bl LZ77UnCompWram
	ldr r2, [sp]
	str r2, [r5]
	str r7, [r5, #4]
	ldr r0, _0800E9A8 @ =0x80000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
_0800E958:
	adds r4, #1
	adds r6, #1
	cmp r6, #3
	bls _0800E930
	ldr r1, _0800E9A0 @ =0x040000D4
	ldr r0, _0800E9AC @ =gGfxCheckmark
	str r0, [r1]
	ldr r0, _0800E9B0 @ =0x06015400
	str r0, [r1, #4]
	ldr r0, _0800E9B4 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800E9B8 @ =gPalCheckmark
	str r0, [r1]
	ldr r0, _0800E9BC @ =0x05000360
	str r0, [r1, #4]
	ldr r0, _0800E9C0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E98C: .4byte gUnknown_03002920
_0800E990: .4byte gUnknown_03003870
_0800E994: .4byte gAnimation+0x52
_0800E998: .4byte gUnknown_0200AFC0
_0800E99C: .4byte gUnknown_08026810
_0800E9A0: .4byte 0x040000D4
_0800E9A4: .4byte 0x06013400
_0800E9A8: .4byte 0x80000400
_0800E9AC: .4byte gGfxCheckmark
_0800E9B0: .4byte 0x06015400
_0800E9B4: .4byte 0x80000100
_0800E9B8: .4byte gPalCheckmark
_0800E9BC: .4byte 0x05000360
_0800E9C0: .4byte 0x80000010
