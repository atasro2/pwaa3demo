	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_800A38C
sub_800A38C: @ 0x0800A38C
	push {lr}
	ldr r0, _0800A39C @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	bl sub_8007610
	pop {r0}
	bx r0
	.align 2, 0
_0800A39C: .4byte gMain

	thumb_func_start sub_800A3A0
sub_800A3A0: @ 0x0800A3A0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _0800A40C @ =gMain
	bl PauseBGM
	ldr r0, _0800A410 @ =0x040000D4
	ldr r1, _0800A414 @ =gOamObjects
	str r1, [r0]
	ldr r3, _0800A418 @ =gUnknown_020009D4
	str r3, [r0, #4]
	ldr r1, _0800A41C @ =0x80000200
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [r0]
	ldr r2, _0800A420 @ =0xFFFFF660
	adds r1, r3, r2
	str r1, [r0, #4]
	ldr r1, _0800A424 @ =0x8000016A
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0800A428 @ =gScriptContext
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r1, #2
	bne _0800A3E4
	adds r0, #0x2b
	ldrb r2, [r0]
	cmp r2, #1
	bne _0800A3E4
	ldr r1, _0800A42C @ =0xFFFFF679
	adds r0, r3, r1
	strb r2, [r0]
_0800A3E4:
	movs r0, #0x31
	bl PlaySE
	adds r2, r4, #0
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800A430 @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r4, #0xc]
	lsls r0, r5, #0x18
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A40C: .4byte gMain
_0800A410: .4byte 0x040000D4
_0800A414: .4byte gOamObjects
_0800A418: .4byte gUnknown_020009D4
_0800A41C: .4byte 0x80000200
_0800A420: .4byte 0xFFFFF660
_0800A424: .4byte 0x8000016A
_0800A428: .4byte gScriptContext
_0800A42C: .4byte 0xFFFFF679
_0800A430: .4byte gUnknown_030037B8

	thumb_func_start CourtProcess
CourtProcess: @ 0x0800A434
	push {lr}
	ldr r2, _0800A448 @ =gUnknown_0814DB88
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800A448: .4byte gUnknown_0814DB88

	thumb_func_start sub_800A44C
sub_800A44C: @ 0x0800A44C
	push {lr}
	ldr r1, _0800A48C @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #6
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	cmp r0, #0
	bne _0800A498
	ldr r1, _0800A490 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800A498
	ldr r1, _0800A494 @ =gMain
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800A480
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800A498
_0800A480:
	movs r0, #0
	bl sub_800A3A0
	movs r0, #1
	b _0800A49A
	.align 2, 0
_0800A48C: .4byte gScriptContext
_0800A490: .4byte gJoypad
_0800A494: .4byte gMain
_0800A498:
	movs r0, #0
_0800A49A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800A4A0
sub_800A4A0: @ 0x0800A4A0
	push {lr}
	ldr r1, _0800A4DC @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800A4D8
	ldr r0, _0800A4E0 @ =gMain
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800A4D8
	ldr r1, _0800A4E4 @ =gScriptContext
	movs r0, #8
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0800A4F0
	ldr r0, _0800A4E8 @ =gTestimony
	ldr r0, [r0]
	ldr r1, _0800A4EC @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	beq _0800A4F0
_0800A4D8:
	movs r0, #0
	b _0800A512
	.align 2, 0
_0800A4DC: .4byte gJoypad
_0800A4E0: .4byte gMain
_0800A4E4: .4byte gScriptContext
_0800A4E8: .4byte gTestimony
_0800A4EC: .4byte 0x00FF00FF
_0800A4F0:
	movs r0, #4
	ldrh r2, [r2, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800A4FE
	bl sub_8016D6C
_0800A4FE:
	movs r0, #0x31
	bl PlaySE
	ldr r1, _0800A518 @ =gUnknown_030037BC
	subs r2, r1, #4
	ldr r0, [r2]
	str r0, [r1]
	movs r0, #7
	str r0, [r2]
	movs r0, #1
_0800A512:
	pop {r1}
	bx r1
	.align 2, 0
_0800A518: .4byte gUnknown_030037BC

	thumb_func_start sub_800A51C
sub_800A51C: @ 0x0800A51C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0800A674 @ =gIORegisters
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _0800A678 @ =0x040000D4
	str r0, [r4]
	ldr r0, _0800A67C @ =gTestimony
	str r0, [r4, #4]
	ldr r0, _0800A680 @ =0x81000004
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, sp
	strh r5, [r0]
	str r0, [r4]
	ldr r0, _0800A684 @ =gInvestigation
	str r0, [r4, #4]
	ldr r0, _0800A688 @ =0x8100000E
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl HideAllSprites
	bl InitBGs
	bl ResetAnimationSystem
	bl LoadCurrentScriptIntoRam
	movs r0, #0x4a
	adds r0, r0, r6
	mov r8, r0
	movs r5, #0
	movs r0, #0xfa
	lsls r0, r0, #5
	mov r1, r8
	strh r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r6]
	ldr r0, _0800A68C @ =0x00003D01
	strh r0, [r6, #2]
	adds r0, #0xff
	strh r0, [r6, #4]
	ldr r0, _0800A690 @ =0x00003FC7
	strh r0, [r6, #6]
	ldr r0, _0800A694 @ =gGfxSaveGameTiles
	str r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _0800A698 @ =0x80000800
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800A69C @ =gPalExamineCursors
	str r0, [r4]
	ldr r0, _0800A6A0 @ =0x05000300
	str r0, [r4, #4]
	ldr r1, _0800A6A4 @ =0x80000010
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800A6A8 @ =gPalEvidenceProfileDesc
	str r0, [r4]
	ldr r0, _0800A6AC @ =0x05000240
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #1
	bl DecompressBackgroundIntoBuffer
	movs r0, #1
	bl CopyBGDataToVram
	movs r0, #0x81
	bl CopyBGDataToVram
	ldr r0, _0800A6B0 @ =0x0000FFAF
	strh r0, [r6, #0xe]
	ldr r0, _0800A6B4 @ =0x0000FDFF
	mov r2, r8
	ldrh r2, [r2]
	ands r0, r2
	mov r3, r8
	strh r0, [r3]
	ldr r1, _0800A6B8 @ =gCourtRecord
	adds r0, r7, #0
	bl sub_800E9C4
	bl ResetHPBar
	str r5, [sp, #4]
	add r1, sp, #4
	str r1, [r4]
	adds r0, r7, #0
	adds r0, #0xc8
	str r0, [r4, #4]
	ldr r2, _0800A6BC @ =0x85000008
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	adds r0, #0xe8
	str r5, [r0]
	str r5, [sp, #4]
	str r1, [r4]
	movs r3, #0x86
	lsls r3, r3, #1
	adds r0, r7, r3
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	str r5, [sp, #4]
	str r1, [r4]
	movs r2, #0x99
	lsls r2, r2, #2
	adds r0, r7, r2
	str r0, [r4, #4]
	ldr r0, _0800A6C0 @ =0x85000006
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	str r5, [sp, #4]
	str r1, [r4]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r7, r3
	str r0, [r4, #4]
	ldr r0, _0800A6C4 @ =0x85000004
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0xa4
	lsls r1, r1, #2
	adds r0, r7, r1
	strh r5, [r0]
	movs r0, #0xf
	strb r0, [r7, #0x1a]
	movs r0, #1
	strb r0, [r7, #0x18]
	strb r0, [r7, #0x19]
	bl sub_800A38C
	ldr r1, _0800A6C8 @ =gScriptContext
	strh r5, [r1, #0x10]
	ldr r0, _0800A6CC @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #0x80
	bl ChangeScriptSection
	movs r0, #0x30
	movs r1, #0xf
	bl SetTimedKeysAndDelay
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r6, #0x4e
	movs r0, #0x10
	strh r0, [r6]
	ldr r1, _0800A6D0 @ =gUnknown_030037B8
	adds r0, #0xf3
	str r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A674: .4byte gIORegisters
_0800A678: .4byte 0x040000D4
_0800A67C: .4byte gTestimony
_0800A680: .4byte 0x81000004
_0800A684: .4byte gInvestigation
_0800A688: .4byte 0x8100000E
_0800A68C: .4byte 0x00003D01
_0800A690: .4byte 0x00003FC7
_0800A694: .4byte gGfxSaveGameTiles
_0800A698: .4byte 0x80000800
_0800A69C: .4byte gPalExamineCursors
_0800A6A0: .4byte 0x05000300
_0800A6A4: .4byte 0x80000010
_0800A6A8: .4byte gPalEvidenceProfileDesc
_0800A6AC: .4byte 0x05000240
_0800A6B0: .4byte 0x0000FFAF
_0800A6B4: .4byte 0x0000FDFF
_0800A6B8: .4byte gCourtRecord
_0800A6BC: .4byte 0x85000008
_0800A6C0: .4byte 0x85000006
_0800A6C4: .4byte 0x85000004
_0800A6C8: .4byte gScriptContext
_0800A6CC: .4byte 0x0000FFFF
_0800A6D0: .4byte gUnknown_030037B8

	thumb_func_start sub_800A6D4
sub_800A6D4: @ 0x0800A6D4
	push {r4, lr}
	adds r4, r0, #0
	bl ClearSectionReadFlags
	adds r0, r4, #0
	bl sub_8007238
	ldr r1, _0800A718 @ =0x040000D4
	ldr r0, _0800A71C @ =gMain
	str r0, [r1]
	ldr r0, _0800A720 @ =gUnknown_02000034
	str r0, [r1, #4]
	ldr r0, _0800A724 @ =0x8000016A
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800A728 @ =0x0100000A
	str r0, [r4, #8]
	bl sub_80053C8
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800A730
	bl ResetHPBarHealthToMax
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #1
	bne _0800A774
	ldr r0, _0800A72C @ =0x0100000B
	b _0800A772
	.align 2, 0
_0800A718: .4byte 0x040000D4
_0800A71C: .4byte gMain
_0800A720: .4byte gUnknown_02000034
_0800A724: .4byte 0x8000016A
_0800A728: .4byte 0x0100000A
_0800A72C: .4byte 0x0100000B
_0800A730:
	cmp r0, #7
	bne _0800A748
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #2
	bne _0800A774
	ldr r0, _0800A744 @ =gUnknown_0200000B
	b _0800A772
	.align 2, 0
_0800A744: .4byte gUnknown_0200000B
_0800A748:
	cmp r0, #0xc
	bne _0800A760
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #3
	bne _0800A774
	ldr r0, _0800A75C @ =gUnknown_0300000B
	b _0800A772
	.align 2, 0
_0800A75C: .4byte gUnknown_0300000B
_0800A760:
	cmp r0, #0xe
	bne _0800A774
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #4
	bne _0800A774
	ldr r0, _0800A77C @ =0x0400000B
_0800A772:
	str r0, [r4, #8]
_0800A774:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A77C: .4byte 0x0400000B

	thumb_func_start sub_800A780
sub_800A780: @ 0x0800A780
	push {lr}
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800A7A2
	ldr r1, _0800A7A8 @ =gScriptContext
	movs r0, #1
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800A7A2
	bl sub_800A44C
	cmp r0, #0
	bne _0800A7A2
	bl sub_800A4A0
_0800A7A2:
	pop {r0}
	bx r0
	.align 2, 0
_0800A7A8: .4byte gScriptContext

	thumb_func_start sub_800A7AC
sub_800A7AC: @ 0x0800A7AC
	push {r4, lr}
	ldr r4, _0800A7F0 @ =gOamObjects+0x1A8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	bl sub_8016ED8
	cmp r0, #0
	beq _0800A7CE
	adds r4, #0x78
_0800A7CE:
	movs r1, #0x80
	lsls r1, r1, #7
	strh r1, [r4]
	ldr r0, _0800A7F4 @ =0x000080BA
	strh r0, [r4, #2]
	ldr r0, _0800A7F8 @ =0x00005D90
	strh r0, [r4, #4]
	adds r4, #8
	strh r1, [r4]
	ldr r0, _0800A7FC @ =0x000080DA
	strh r0, [r4, #2]
	ldr r0, _0800A800 @ =0x00005D98
	strh r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A7F0: .4byte gOamObjects+0x1A8
_0800A7F4: .4byte 0x000080BA
_0800A7F8: .4byte 0x00005D90
_0800A7FC: .4byte 0x000080DA
_0800A800: .4byte 0x00005D98

	thumb_func_start sub_800A804
sub_800A804: @ 0x0800A804
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #4
	bls _0800A810
	b _0800A944
_0800A810:
	lsls r0, r0, #2
	ldr r1, _0800A81C @ =_0800A820
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A81C: .4byte _0800A820
_0800A820: @ jump table
	.4byte _0800A834 @ case 0
	.4byte _0800A854 @ case 1
	.4byte _0800A8A8 @ case 2
	.4byte _0800A8B4 @ case 3
	.4byte _0800A8E4 @ case 4
_0800A834:
	movs r0, #0x54
	bl sub_8012824
	movs r0, #0x55
	bl sub_8012824
	movs r0, #0x53
	bl PlaySE
	ldr r0, _0800A850 @ =gTestimony
	movs r1, #0
	strb r1, [r0, #4]
	b _0800A8DC
	.align 2, 0
_0800A850: .4byte gTestimony
_0800A854:
	movs r0, #0x54
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x55
	bl sub_8011D68
	adds r5, r0, #0
	ldrh r0, [r4, #0x10]
	adds r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x10]
	subs r0, #0xa
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x77
	ble _0800A944
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #0x52
	bl sub_8012824
	b _0800A8DC
_0800A8A8:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800A944
	b _0800A8DC
_0800A8B4:
	movs r0, #0x52
	bl sub_8011D68
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _0800A944
	adds r0, r4, #0
	bl sub_8012F7C
	movs r0, #0x54
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	movs r0, #0x55
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
_0800A8DC:
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	b _0800A944
_0800A8E4:
	movs r0, #0x54
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x55
	bl sub_8011D68
	adds r5, r0, #0
	ldr r2, _0800A94C @ =gTestimony
	ldrh r3, [r4, #0x10]
	ldrb r7, [r2, #4]
	adds r0, r3, r7
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r3, [r5, #0x10]
	ldrb r7, [r2, #4]
	subs r0, r3, r7
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	ldrb r0, [r2, #4]
	adds r0, #1
	strb r0, [r2, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	bls _0800A928
	movs r0, #0xc
	strb r0, [r2, #4]
_0800A928:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800A944
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #1
	strb r0, [r6, #9]
_0800A944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A94C: .4byte gTestimony

	thumb_func_start TestimonyProcess
TestimonyProcess: @ 0x0800A950
	push {lr}
	ldr r2, _0800A964 @ =gUnknown_0814DB94
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800A964: .4byte gUnknown_0814DB94

	thumb_func_start sub_800A968
sub_800A968: @ 0x0800A968
	ldr r2, _0800A994 @ =0x040000D4
	ldr r1, _0800A998 @ =gGfx4bppTestimonyTextTiles
	str r1, [r2]
	ldr r1, _0800A99C @ =0x06013000
	str r1, [r2, #4]
	ldr r1, _0800A9A0 @ =0x80000400
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _0800A9A4 @ =gPalTestimonyTextTiles
	str r1, [r2]
	ldr r1, _0800A9A8 @ =0x050002A0
	str r1, [r2, #4]
	ldr r1, _0800A9AC @ =0x80000010
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r2, _0800A9B0 @ =gTestimony
	movs r1, #0
	strb r1, [r2, #1]
	movs r1, #3
	strb r1, [r0, #9]
	bx lr
	.align 2, 0
_0800A994: .4byte 0x040000D4
_0800A998: .4byte gGfx4bppTestimonyTextTiles
_0800A99C: .4byte 0x06013000
_0800A9A0: .4byte 0x80000400
_0800A9A4: .4byte gPalTestimonyTextTiles
_0800A9A8: .4byte 0x050002A0
_0800A9AC: .4byte 0x80000010
_0800A9B0: .4byte gTestimony

	thumb_func_start sub_800A9B4
sub_800A9B4: @ 0x0800A9B4
	push {lr}
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800AA1A
	ldr r1, _0800AA08 @ =gScriptContext
	movs r0, #1
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800A9D6
	bl sub_800A44C
	cmp r0, #1
	beq _0800A9D6
	bl sub_800A4A0
_0800A9D6:
	ldr r1, _0800AA0C @ =gTestimony
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bls _0800A9EA
	movs r0, #0
	strb r0, [r1, #1]
_0800A9EA:
	ldr r2, _0800AA10 @ =gOamObjects+0x1C8
	ldrb r1, [r1, #1]
	cmp r1, #0x50
	bhi _0800AA14
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #8
	strh r0, [r2, #2]
	movs r0, #0xb3
	lsls r0, r0, #7
	strh r0, [r2, #4]
	b _0800AA1A
	.align 2, 0
_0800AA08: .4byte gScriptContext
_0800AA0C: .4byte gTestimony
_0800AA10: .4byte gOamObjects+0x1C8
_0800AA14:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
_0800AA1A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800AA20
sub_800AA20: @ 0x0800AA20
	ldr r2, _0800AA30 @ =gOamObjects+0x1C8
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r2]
	subs r1, #0xfd
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0800AA30: .4byte gOamObjects+0x1C8

	thumb_func_start sub_800AA34
sub_800AA34: @ 0x0800AA34
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x56
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x57
	bl sub_8011D68
	adds r5, r0, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #4
	bls _0800AA50
	b _0800AB5E
_0800AA50:
	lsls r0, r0, #2
	ldr r1, _0800AA5C @ =_0800AA60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800AA5C: .4byte _0800AA60
_0800AA60: @ jump table
	.4byte _0800AA74 @ case 0
	.4byte _0800AA8C @ case 1
	.4byte _0800AAD4 @ case 2
	.4byte _0800AAE4 @ case 3
	.4byte _0800AB12 @ case 4
_0800AA74:
	movs r0, #0x56
	bl sub_8012824
	movs r0, #0x57
	bl sub_8012824
	movs r0, #0x53
	bl PlaySE
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AA8C:
	ldrh r0, [r4, #0x10]
	adds r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x10]
	subs r0, #0xa
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x77
	ble _0800AB5E
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #0x53
	bl sub_8012824
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AAD4:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800AB5E
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AAE4:
	movs r0, #0x53
	bl sub_8011D68
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _0800AB5E
	adds r0, r4, #0
	bl sub_8012F7C
	movs r0, #0x56
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	movs r0, #0x57
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AB12:
	movs r0, #0x56
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x57
	bl sub_8011D68
	adds r5, r0, #0
	ldrh r0, [r4, #0x12]
	subs r0, #7
	strh r0, [r4, #0x12]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x12]
	adds r0, #7
	strh r0, [r5, #0x12]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0x3c
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0800AB5E
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #1
	strb r0, [r6, #9]
	movs r0, #0
_0800AB5C:
	strb r0, [r6, #0xa]
_0800AB5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start QuestioningProcess
QuestioningProcess: @ 0x0800AB64
	push {lr}
	ldr r2, _0800AB78 @ =gUnknown_0814DBA4
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800AB78: .4byte gUnknown_0814DBA4

	thumb_func_start sub_800AB7C
sub_800AB7C: @ 0x0800AB7C
	push {lr}
	ldr r1, _0800ABE4 @ =0x040000D4
	ldr r2, _0800ABE8 @ =gGfxPressPresentButtons
	str r2, [r1]
	ldr r2, _0800ABEC @ =0x06013000
	str r2, [r1, #4]
	ldr r2, _0800ABF0 @ =0x80000200
	str r2, [r1, #8]
	ldr r2, [r1, #8]
	ldr r2, _0800ABF4 @ =gPalPressPresentButtons
	str r2, [r1]
	ldr r2, _0800ABF8 @ =0x050002A0
	str r2, [r1, #4]
	ldr r2, _0800ABFC @ =0x80000010
	str r2, [r1, #8]
	ldr r2, [r1, #8]
	ldr r2, _0800AC00 @ =gGfx4bppTestimonyArrows
	str r2, [r1]
	movs r2, #0xd0
	lsls r2, r2, #1
	str r2, [r1, #4]
	ldr r3, _0800AC04 @ =0x80000040
	str r3, [r1, #8]
	ldr r2, [r1, #8]
	ldr r2, _0800AC08 @ =gGfx4bppTestimonyArrows+0x180
	str r2, [r1]
	movs r2, #0x88
	lsls r2, r2, #2
	str r2, [r1, #4]
	str r3, [r1, #8]
	ldr r1, [r1, #8]
	ldr r1, _0800AC0C @ =gScriptContext
	ldrh r1, [r1, #0xc]
	movs r3, #0
	strh r1, [r0, #0x1c]
	ldr r1, _0800AC10 @ =gCourtRecord
	strb r3, [r1, #9]
	ldrb r2, [r1, #8]
	adds r2, #1
	strb r2, [r1, #8]
	ldr r1, _0800AC14 @ =gTestimony
	movs r2, #0xe0
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	strb r3, [r1]
	movs r1, #3
	strb r1, [r0, #9]
	bl ResetHPBar
	pop {r0}
	bx r0
	.align 2, 0
_0800ABE4: .4byte 0x040000D4
_0800ABE8: .4byte gGfxPressPresentButtons
_0800ABEC: .4byte 0x06013000
_0800ABF0: .4byte 0x80000200
_0800ABF4: .4byte gPalPressPresentButtons
_0800ABF8: .4byte 0x050002A0
_0800ABFC: .4byte 0x80000010
_0800AC00: .4byte gGfx4bppTestimonyArrows
_0800AC04: .4byte 0x80000040
_0800AC08: .4byte gGfx4bppTestimonyArrows+0x180
_0800AC0C: .4byte gScriptContext
_0800AC10: .4byte gCourtRecord
_0800AC14: .4byte gTestimony

	thumb_func_start sub_800AC18
sub_800AC18: @ 0x0800AC18
	push {r4, lr}
	ldr r4, _0800AC48 @ =gMain
	ldr r1, _0800AC4C @ =gTestimony
	adds r0, r4, #0
	movs r2, #1
	bl sub_800B6EC
	ldr r0, _0800AC50 @ =gCourtRecord
	bl sub_8010420
	ldr r2, _0800AC54 @ =gOamObjects
	ldr r1, _0800AC58 @ =gScriptContext
	movs r0, #8
	ldrh r3, [r1, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _0800ACA4
	ldrh r0, [r1, #0xc]
	subs r0, #1
	ldrh r4, [r4, #0x1c]
	cmp r0, r4
	beq _0800AC5C
	movs r0, #0x80
	b _0800AC60
	.align 2, 0
_0800AC48: .4byte gMain
_0800AC4C: .4byte gTestimony
_0800AC50: .4byte gCourtRecord
_0800AC54: .4byte gOamObjects
_0800AC58: .4byte gScriptContext
_0800AC5C:
	movs r0, #0x80
	lsls r0, r0, #2
_0800AC60:
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r2, #2]
	ldr r0, _0800AC80 @ =0x000021A0
	strh r0, [r2, #4]
	adds r2, #8
	ldr r1, _0800AC84 @ =gScriptContext
	ldr r0, _0800AC88 @ =gMain
	ldrh r1, [r1, #0xe]
	ldrh r0, [r0, #0x1e]
	cmp r1, r0
	beq _0800AC8C
	movs r0, #0x80
	b _0800AC90
	.align 2, 0
_0800AC80: .4byte 0x000021A0
_0800AC84: .4byte gScriptContext
_0800AC88: .4byte gMain
_0800AC8C:
	movs r0, #0x80
	lsls r0, r0, #2
_0800AC90:
	strh r0, [r2]
	ldr r0, _0800AC9C @ =0x000040E0
	strh r0, [r2, #2]
	ldr r0, _0800ACA0 @ =0x000021A4
	strh r0, [r2, #4]
	b _0800ACAC
	.align 2, 0
_0800AC9C: .4byte 0x000040E0
_0800ACA0: .4byte 0x000021A4
_0800ACA4:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	strh r0, [r2, #8]
_0800ACAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800ACB4
sub_800ACB4: @ 0x0800ACB4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2b
	bl PlaySE
	adds r0, r4, #0
	bl ChangeScriptSection
	bl RunScriptContext
	bl sub_8016DA4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800ACD4
sub_800ACD4: @ 0x0800ACD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800ACE2
	b _0800AEE6
_0800ACE2:
	ldr r4, _0800ACFC @ =gScriptContext
	ldrh r1, [r4, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AD04
	ldr r1, _0800AD00 @ =gTestimony
	adds r0, r5, #0
	movs r2, #1
	bl sub_800B6EC
	b _0800AEE6
	.align 2, 0
_0800ACFC: .4byte gScriptContext
_0800AD00: .4byte gTestimony
_0800AD04:
	movs r6, #8
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0800AD18
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800AD18
	b _0800AEE6
_0800AD18:
	bl sub_800A44C
	cmp r0, #0
	beq _0800AD22
	b _0800AEE2
_0800AD22:
	adds r0, r6, #0
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800AD2E
	b _0800AED4
_0800AD2E:
	ldr r7, _0800AD60 @ =gTestimony
	ldr r0, [r7]
	ldr r1, _0800AD64 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	beq _0800AD3C
	b _0800AED4
_0800AD3C:
	bl sub_800A4A0
	adds r6, r0, #0
	cmp r6, #0
	beq _0800AD70
	ldr r4, _0800AD68 @ =gMain
	adds r1, r4, #0
	adds r1, #0xaa
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #6
	bl sub_8016E74
	bl sub_800A7AC
	ldr r0, _0800AD6C @ =0x01000007
	str r0, [r4, #8]
	b _0800AEE6
	.align 2, 0
_0800AD60: .4byte gTestimony
_0800AD64: .4byte 0x00FF00FF
_0800AD68: .4byte gMain
_0800AD6C: .4byte 0x01000007
_0800AD70:
	ldr r1, _0800AD98 @ =gJoypad
	ldrh r2, [r1, #2]
	movs r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0800ADF8
	movs r0, #2
	ldrh r3, [r4, #0x12]
	ands r0, r3
	cmp r0, #0
	beq _0800ADF8
	ldrh r0, [r4, #0xe]
	ldrh r1, [r5, #0x1e]
	cmp r0, r1
	beq _0800AD9C
	ldrh r0, [r4, #0xe]
	bl sub_800ACB4
	b _0800AEE2
	.align 2, 0
_0800AD98: .4byte gJoypad
_0800AD9C:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0800ADA6
	b _0800AEE2
_0800ADA6:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_800B6EC
	ldrh r0, [r4, #0xe]
	bl sub_800ACB4
	movs r1, #0
	strh r6, [r4, #0x10]
	ldr r0, _0800ADE8 @ =gMain
	strb r1, [r0, #0x19]
	movs r1, #0
	ldr r0, _0800ADEC @ =gBG1MapBuffer
	movs r2, #0
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
_0800ADCA:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #0xff
	bls _0800ADCA
	ldr r0, _0800ADF0 @ =gScriptContext
	adds r0, #0x23
	movs r1, #1
	strb r1, [r0]
	ldr r1, _0800ADF4 @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	b _0800AEE6
	.align 2, 0
_0800ADE8: .4byte gMain
_0800ADEC: .4byte gBG1MapBuffer
_0800ADF0: .4byte gScriptContext
_0800ADF4: .4byte gOamObjects
_0800ADF8:
	movs r0, #0x22
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800AE24
	ldr r2, _0800AE20 @ =gScriptContext
	movs r0, #2
	ldrh r3, [r2, #0x12]
	ands r0, r3
	cmp r0, #0
	beq _0800AE24
	ldrh r0, [r2, #0xc]
	subs r0, #1
	ldrh r5, [r5, #0x1c]
	cmp r0, r5
	beq _0800AEE2
	bl sub_800ACB4
	b _0800AEE2
	.align 2, 0
_0800AE20: .4byte gScriptContext
_0800AE24:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800AEE2
	ldr r0, _0800AE4C @ =gScriptContext
	ldrh r0, [r0, #0x10]
	cmp r0, #0
	beq _0800AEE2
	ldr r4, _0800AE50 @ =gMain
	ldrh r0, [r4, #0x34]
	cmp r0, #3
	beq _0800AE54
	movs r0, #4
	strb r0, [r5, #9]
	movs r0, #2
	strb r0, [r5, #0xa]
	b _0800AEE6
	.align 2, 0
_0800AE4C: .4byte gScriptContext
_0800AE50: .4byte gMain
_0800AE54:
	movs r0, #1
	bl sub_8012824
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800AE6C
	cmp r0, #0xc
	beq _0800AE6C
	cmp r0, #0xd
	bne _0800AE76
_0800AE6C:
	movs r0, #0xb9
	lsls r0, r0, #1
	bl PlaySE
	b _0800AE8E
_0800AE76:
	cmp r0, #0x14
	bne _0800AE88
	ldr r0, _0800AE84 @ =0x0000016F
	bl PlaySE
	b _0800AE8E
	.align 2, 0
_0800AE84: .4byte 0x0000016F
_0800AE88:
	movs r0, #0x47
	bl PlaySE
_0800AE8E:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _0800AEC8 @ =gTestimony
	movs r0, #0x40
	strb r0, [r1, #1]
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldr r1, _0800AECC @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800AED0 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	strb r4, [r5, #0x18]
	strb r4, [r5, #0x19]
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	movs r0, #4
	strb r0, [r5, #9]
	strb r4, [r5, #0xa]
	b _0800AEE6
	.align 2, 0
_0800AEC8: .4byte gTestimony
_0800AECC: .4byte gIORegisters
_0800AED0: .4byte 0x0000FDFF
_0800AED4:
	bl sub_800A4A0
	cmp r0, #0
	beq _0800AEE2
	ldr r1, _0800AEEC @ =gUnknown_030037B8
	movs r0, #7
	str r0, [r1]
_0800AEE2:
	bl sub_800AC18
_0800AEE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AEEC: .4byte gUnknown_030037B8

	thumb_func_start nullsub_16
nullsub_16: @ 0x0800AEF0
	bx lr
	.align 2, 0

	thumb_func_start sub_800AEF4
sub_800AEF4: @ 0x0800AEF4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r4, [r5, #0xa]
	cmp r4, #1
	beq _0800AF86
	cmp r4, #1
	bgt _0800AF08
	cmp r4, #0
	beq _0800AF0E
	b _0800B08C
_0800AF08:
	cmp r4, #2
	beq _0800AFD8
	b _0800B08C
_0800AF0E:
	ldr r1, _0800AF38 @ =gTestimony
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0800AF80
	ldr r0, _0800AF3C @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800AF28
	cmp r0, #0xc
	beq _0800AF28
	cmp r0, #0xd
	bne _0800AF44
_0800AF28:
	ldr r3, _0800AF40 @ =0x00001770
	movs r0, #0
	movs r1, #1
	movs r2, #7
	bl SetCourtScrollPersonAnim
	b _0800AF62
	.align 2, 0
_0800AF38: .4byte gTestimony
_0800AF3C: .4byte gMain
_0800AF40: .4byte 0x00001770
_0800AF44:
	cmp r0, #0x14
	bne _0800AF56
	movs r0, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0
	bl SetCourtScrollPersonAnim
	b _0800AF62
_0800AF56:
	movs r0, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl SetCourtScrollPersonAnim
_0800AF62:
	ldr r0, _0800AF7C @ =gPalCourtScroll
	movs r1, #0x1e
	movs r2, #0x1f
	movs r3, #1
	bl InitCourtScroll
	movs r0, #0
	bl SlideTextbox
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
	b _0800B08C
	.align 2, 0
_0800AF7C: .4byte gPalCourtScroll
_0800AF80:
	subs r0, #1
	strb r0, [r1, #1]
	b _0800B08C
_0800AF86:
	ldr r0, _0800AFC4 @ =gCourtScroll
	ldrh r6, [r0, #4]
	cmp r6, #0
	beq _0800AF90
	b _0800B08C
_0800AF90:
	ldr r7, _0800AFC8 @ =gScriptContext
	ldrh r0, [r7, #0x10]
	cmp r0, #0
	beq _0800AFAA
	ldr r0, _0800AFCC @ =gMain
	strb r4, [r0, #0x18]
	strb r4, [r0, #0x19]
	ldr r0, _0800AFD0 @ =gIORegisters
	movs r1, #0
	strh r6, [r0, #0xe]
	adds r0, r7, #0
	adds r0, #0x23
	strb r1, [r0]
_0800AFAA:
	ldrh r0, [r7, #0x10]
	bl ChangeScriptSection
	movs r2, #0
	strh r6, [r7, #0x10]
	ldr r0, _0800AFD4 @ =gTestimony
	movs r1, #0xe0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r2, [r0]
	strb r4, [r5, #9]
	strb r2, [r5, #0xa]
	b _0800B08C
	.align 2, 0
_0800AFC4: .4byte gCourtScroll
_0800AFC8: .4byte gScriptContext
_0800AFCC: .4byte gMain
_0800AFD0: .4byte gIORegisters
_0800AFD4: .4byte gTestimony
_0800AFD8:
	ldr r0, _0800B024 @ =gAnimation+0x44
	movs r1, #1
	bl sub_801208C
	ldrh r0, [r5, #0x34]
	movs r2, #0
	strh r0, [r5, #0x38]
	movs r0, #3
	strh r0, [r5, #0x34]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r5, r1
	strb r2, [r0]
	ldr r0, _0800B028 @ =gScriptContext
	adds r0, #0x40
	movs r1, #0x80
	strh r1, [r0]
	movs r0, #1
	bl sub_8012824
	ldr r0, _0800B02C @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800B01A
	cmp r0, #0xc
	beq _0800B01A
	cmp r0, #0xd
	bne _0800B030
_0800B01A:
	movs r0, #0xb9
	lsls r0, r0, #1
	bl PlaySE
	b _0800B046
	.align 2, 0
_0800B024: .4byte gAnimation+0x44
_0800B028: .4byte gScriptContext
_0800B02C: .4byte gMain
_0800B030:
	cmp r0, #0x14
	bne _0800B040
	ldr r0, _0800B03C @ =0x0000016F
	bl PlaySE
	b _0800B046
	.align 2, 0
_0800B03C: .4byte 0x0000016F
_0800B040:
	movs r0, #0x47
	bl PlaySE
_0800B046:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _0800B080 @ =gTestimony
	movs r0, #0x40
	strb r0, [r1, #1]
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldr r1, _0800B084 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800B088 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	strb r4, [r5, #0x18]
	strb r4, [r5, #0x19]
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	movs r0, #4
	strb r0, [r5, #9]
	strb r4, [r5, #0xa]
	b _0800B0A0
	.align 2, 0
_0800B080: .4byte gTestimony
_0800B084: .4byte gIORegisters
_0800B088: .4byte 0x0000FDFF
_0800B08C:
	ldr r1, _0800B0A8 @ =gTestimony
	adds r0, r5, #0
	movs r2, #0
	bl sub_800B6EC
	ldr r1, _0800B0AC @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
_0800B0A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0A8: .4byte gTestimony
_0800B0AC: .4byte gOamObjects

	thumb_func_start sub_800B0B0
sub_800B0B0: @ 0x0800B0B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r0, #5
	bls _0800B0BC
	b _0800B1F4
_0800B0BC:
	lsls r0, r0, #2
	ldr r1, _0800B0C8 @ =_0800B0CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B0C8: .4byte _0800B0CC
_0800B0CC: @ jump table
	.4byte _0800B0E4 @ case 0
	.4byte _0800B10A @ case 1
	.4byte _0800B178 @ case 2
	.4byte _0800B198 @ case 3
	.4byte _0800B1FE @ case 4
	.4byte _0800B1FE @ case 5
_0800B0E4:
	ldr r4, _0800B100 @ =gTestimony
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0800B104
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x40
	strb r0, [r4, #1]
	b _0800B186
	.align 2, 0
_0800B100: .4byte gTestimony
_0800B104:
	subs r0, #1
	strb r0, [r4, #1]
	b _0800B1F4
_0800B10A:
	ldr r1, _0800B134 @ =gTestimony
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0800B1F0
	ldr r0, _0800B138 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800B124
	cmp r0, #0xc
	beq _0800B124
	cmp r0, #0xd
	bne _0800B140
_0800B124:
	ldr r3, _0800B13C @ =0x00001770
	movs r0, #0
	movs r1, #1
	movs r2, #7
	bl SetCourtScrollPersonAnim
	b _0800B15E
	.align 2, 0
_0800B134: .4byte gTestimony
_0800B138: .4byte gMain
_0800B13C: .4byte 0x00001770
_0800B140:
	cmp r0, #0x14
	bne _0800B152
	movs r0, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0
	bl SetCourtScrollPersonAnim
	b _0800B15E
_0800B152:
	movs r0, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl SetCourtScrollPersonAnim
_0800B15E:
	ldr r0, _0800B174 @ =gPalCourtScroll
	movs r1, #0x1e
	movs r2, #0x1f
	movs r3, #1
	bl InitCourtScroll
	movs r0, #0
	bl SlideTextbox
	b _0800B186
	.align 2, 0
_0800B174: .4byte gPalCourtScroll
_0800B178:
	ldr r0, _0800B190 @ =gCourtScroll
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0800B1F4
	ldr r0, _0800B194 @ =gTestimony
	movs r1, #0x14
	strb r1, [r0, #1]
_0800B186:
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
	b _0800B1F4
	.align 2, 0
_0800B190: .4byte gCourtScroll
_0800B194: .4byte gTestimony
_0800B198:
	ldr r1, _0800B1CC @ =gTestimony
	ldrb r0, [r1, #1]
	adds r2, r0, #0
	cmp r2, #0
	bne _0800B1F0
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r2, [r1]
	ldr r3, _0800B1D0 @ =gScriptContext
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B1DC
	ldr r1, _0800B1D4 @ =gMain
	movs r0, #1
	strb r0, [r1, #0x18]
	ldr r0, _0800B1D8 @ =gIORegisters
	movs r1, #0
	strh r2, [r0, #0xe]
	adds r0, r3, #0
	adds r0, #0x23
	strb r1, [r0]
	b _0800B1E2
	.align 2, 0
_0800B1CC: .4byte gTestimony
_0800B1D0: .4byte gScriptContext
_0800B1D4: .4byte gMain
_0800B1D8: .4byte gIORegisters
_0800B1DC:
	movs r0, #1
	bl SlideTextbox
_0800B1E2:
	ldr r1, _0800B1EC @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	b _0800B1F4
	.align 2, 0
_0800B1EC: .4byte gUnknown_030037B8
_0800B1F0:
	subs r0, #1
	strb r0, [r1, #1]
_0800B1F4:
	ldr r1, _0800B204 @ =gTestimony
	adds r0, r5, #0
	movs r2, #0
	bl sub_800B6EC
_0800B1FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B204: .4byte gTestimony

	thumb_func_start VerdictProcess
VerdictProcess: @ 0x0800B208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _0800B22C @ =gOamObjects+0x188
	mov sl, r0
	ldrb r0, [r7, #9]
	cmp r0, #8
	bls _0800B220
	b _0800B6DA
_0800B220:
	lsls r0, r0, #2
	ldr r1, _0800B230 @ =_0800B234
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B22C: .4byte gOamObjects+0x188
_0800B230: .4byte _0800B234
_0800B234: @ jump table
	.4byte _0800B258 @ case 0
	.4byte _0800B334 @ case 1
	.4byte _0800B3CC @ case 2
	.4byte _0800B4B4 @ case 3
	.4byte _0800B4D0 @ case 4
	.4byte _0800B598 @ case 5
	.4byte _0800B5D4 @ case 6
	.4byte _0800B630 @ case 7
	.4byte _0800B6D4 @ case 8
_0800B258:
	ldr r0, _0800B2CC @ =gMain
	adds r0, #0xa0
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0800B2D8
	bl fix_inverse
	adds r4, r0, #0
	ldr r6, _0800B2D0 @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _0800B2D4 @ =gOamObjects
	strh r0, [r5, #6]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0xe]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x1e]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x56
	bl PlaySE
	b _0800B4F0
	.align 2, 0
_0800B2CC: .4byte gMain
_0800B2D0: .4byte gSineTable
_0800B2D4: .4byte gOamObjects
_0800B2D8:
	adds r0, r7, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl fix_inverse
	adds r4, r0, #0
	ldr r6, _0800B32C @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _0800B330 @ =gOamObjects
	strh r0, [r5, #6]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0xe]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x1e]
	b _0800B6DA
	.align 2, 0
_0800B32C: .4byte gSineTable
_0800B330: .4byte gOamObjects
_0800B334:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bhi _0800B344
	b _0800B6DA
_0800B344:
	ldr r0, _0800B3B4 @ =gMain
	adds r0, #0xa0
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r0]
	movs r2, #8
	add sl, r2
	ldr r0, _0800B3B8 @ =0x000003EF
	mov r1, sl
	strh r0, [r1]
	ldr r0, _0800B3BC @ =0x0000C280
	strh r0, [r1, #2]
	ldr r0, _0800B3C0 @ =0x000051E0
	strh r0, [r1, #4]
	adds r0, r7, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl fix_inverse
	adds r4, r0, #0
	ldr r6, _0800B3C4 @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _0800B3C8 @ =gOamObjects
	strh r0, [r5, #0x26]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x2e]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x3e]
	b _0800B6CC
	.align 2, 0
_0800B3B4: .4byte gMain
_0800B3B8: .4byte 0x000003EF
_0800B3BC: .4byte 0x0000C280
_0800B3C0: .4byte 0x000051E0
_0800B3C4: .4byte gSineTable
_0800B3C8: .4byte gOamObjects
_0800B3CC:
	ldr r0, _0800B44C @ =gMain
	adds r0, #0xa0
	mov sl, r0
	ldrh r0, [r0]
	subs r0, #0x10
	mov r2, sl
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	cmp r0, sb
	bgt _0800B458
	mov r0, sb
	bl fix_inverse
	adds r4, r0, #0
	ldr r6, _0800B450 @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _0800B454 @ =gOamObjects
	strh r0, [r5, #0x26]
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x2e]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x3e]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x56
	bl PlaySE
	mov r1, sb
	mov r0, sl
	strh r1, [r0]
	b _0800B4F0
	.align 2, 0
_0800B44C: .4byte gMain
_0800B450: .4byte gSineTable
_0800B454: .4byte gOamObjects
_0800B458:
	adds r0, r7, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl fix_inverse
	adds r4, r0, #0
	ldr r6, _0800B4AC @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _0800B4B0 @ =gOamObjects
	strh r0, [r5, #0x26]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x2e]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x3e]
	b _0800B6DA
	.align 2, 0
_0800B4AC: .4byte gSineTable
_0800B4B0: .4byte gOamObjects
_0800B4B4:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	bhi _0800B4C4
	b _0800B6DA
_0800B4C4:
	ldrb r0, [r7, #9]
	adds r0, #1
	movs r1, #0
	strb r0, [r7, #9]
	strb r1, [r7, #0xa]
	b _0800B6DA
_0800B4D0:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _0800B4FC
	movs r0, #0x80
	lsls r0, r0, #2
	mov r2, sl
	strh r0, [r2]
	strh r0, [r2, #8]
	ldrb r0, [r7, #0xb]
	cmp r0, #0
	bne _0800B4F0
	b _0800B6D4
_0800B4F0:
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r0, #0
	strb r0, [r7, #0xa]
	b _0800B6DA
_0800B4FC:
	adds r0, r7, #0
	adds r0, #0xa0
	ldrh r1, [r0]
	adds r1, #8
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl fix_inverse
	adds r4, r0, #0
	ldr r6, _0800B590 @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r5, _0800B594 @ =gOamObjects
	strh r0, [r5, #6]
	movs r0, #0
	ldrsh r2, [r6, r0]
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0xe]
	ldrh r6, [r6]
	rsbs r6, r6, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x1e]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x26]
	mov r0, sb
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x3e]
	mov r1, sl
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldrh r0, [r1, #8]
	subs r0, #1
	strh r0, [r1, #8]
	b _0800B6DA
	.align 2, 0
_0800B590: .4byte gSineTable
_0800B594: .4byte gOamObjects
_0800B598:
	ldr r1, _0800B5B8 @ =0x040000D4
	ldr r0, _0800B5BC @ =gGfxConfetti
	str r0, [r1]
	ldr r0, _0800B5C0 @ =0x06011F80
	str r0, [r1, #4]
	ldr r0, _0800B5C4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800B5C8 @ =gPalConfetti0
	str r0, [r1]
	ldr r0, _0800B5CC @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _0800B5D0 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800B6CC
	.align 2, 0
_0800B5B8: .4byte 0x040000D4
_0800B5BC: .4byte gGfxConfetti
_0800B5C0: .4byte 0x06011F80
_0800B5C4: .4byte 0x80000010
_0800B5C8: .4byte gPalConfetti0
_0800B5CC: .4byte 0x050002A0
_0800B5D0: .4byte 0x80000040
_0800B5D4:
	ldr r2, _0800B628 @ =gOamObjects+0x1D0
	mov sl, r2
	movs r6, #0
_0800B5DA:
	bl Random
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r6, #5
	adds r5, r5, r4
	movs r0, #0x7f
	ands r5, r0
	mov r0, sl
	strh r5, [r0]
	bl Random
	movs r5, #0x1f
	ands r5, r0
	adds r5, r5, r4
	movs r0, #0xff
	ands r5, r0
	mov r1, sl
	strh r5, [r1, #2]
	bl Random
	movs r1, #3
	ands r1, r0
	adds r5, r1, #5
	lsls r5, r5, #0xc
	ldr r2, _0800B62C @ =0x000004FC
	adds r0, r2, #0
	adds r0, r5, r0
	mov r1, sl
	strh r0, [r1, #4]
	movs r2, #8
	add sl, r2
	adds r6, #1
	cmp r6, #0x1e
	bls _0800B5DA
	movs r0, #0x66
	bl PlaySE
	b _0800B6CC
	.align 2, 0
_0800B628: .4byte gOamObjects+0x1D0
_0800B62C: .4byte 0x000004FC
_0800B630:
	ldr r0, _0800B688 @ =gOamObjects+0x1D0
	mov sl, r0
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xef
	bhi _0800B6B8
	movs r6, #0
	movs r4, #3
_0800B646:
	mov r1, sl
	ldrh r5, [r1]
	bl Random
	adds r1, r4, #0
	ands r1, r0
	adds r5, r5, r1
	cmp r5, #0xa3
	bls _0800B65A
	movs r5, #0
_0800B65A:
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	mov r1, sl
	ldrh r1, [r1]
	ands r0, r1
	adds r0, r0, r5
	mov r2, sl
	strh r0, [r2]
	ldrh r5, [r2, #2]
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0800B68C
	bl Random
	adds r1, r4, #0
	ands r1, r0
	adds r5, r5, r1
	b _0800B696
	.align 2, 0
_0800B688: .4byte gOamObjects+0x1D0
_0800B68C:
	bl Random
	adds r1, r4, #0
	ands r1, r0
	subs r5, r5, r1
_0800B696:
	movs r0, #0xff
	ands r5, r0
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	mov r2, sl
	ldrh r2, [r2, #2]
	ands r0, r2
	adds r0, r0, r5
	mov r1, sl
	strh r0, [r1, #2]
	movs r2, #8
	add sl, r2
	adds r6, #1
	cmp r6, #0x1e
	bls _0800B646
	b _0800B6DA
_0800B6B8:
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #2
_0800B6BE:
	mov r1, sl
	strh r0, [r1]
	movs r2, #8
	add sl, r2
	adds r6, #1
	cmp r6, #0x1e
	bls _0800B6BE
_0800B6CC:
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	b _0800B6DA
_0800B6D4:
	ldr r1, _0800B6E8 @ =gUnknown_030037B8
	ldr r0, [r7, #0xc]
	str r0, [r1]
_0800B6DA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B6E8: .4byte gUnknown_030037B8

	thumb_func_start sub_800B6EC
sub_800B6EC: @ 0x0800B6EC
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, _0800B704 @ =gScriptContext
	ldrh r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r1, #0
	beq _0800B6FE
	cmp r2, #0
	bne _0800B70C
_0800B6FE:
	ldr r2, _0800B708 @ =gOamObjects+0x1A8
	b _0800B74E
	.align 2, 0
_0800B704: .4byte gScriptContext
_0800B708: .4byte gOamObjects+0x1A8
_0800B70C:
	ldrb r0, [r3]
	cmp r0, #1
	bne _0800B72E
	ldrb r0, [r3, #2]
	cmp r0, #0xe0
	bls _0800B71C
	subs r0, #2
	b _0800B71E
_0800B71C:
	movs r0, #0xe0
_0800B71E:
	strb r0, [r3, #2]
	ldrb r0, [r3, #3]
	cmp r0, #0xe0
	bls _0800B72A
	subs r0, #2
	b _0800B744
_0800B72A:
	movs r0, #0xe0
	b _0800B744
_0800B72E:
	cmp r0, #0
	bne _0800B746
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0800B73C
	adds r0, #2
	strb r0, [r3, #2]
_0800B73C:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _0800B746
	adds r0, #2
_0800B744:
	strb r0, [r3, #3]
_0800B746:
	ldr r2, _0800B760 @ =gOamObjects+0x1A8
	ldrh r4, [r4, #0x10]
	cmp r4, #0x7f
	bhi _0800B764
_0800B74E:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	adds r2, #8
	strh r0, [r2]
	adds r2, #8
	strh r0, [r2]
	strh r0, [r2, #8]
	b _0800B7AC
	.align 2, 0
_0800B760: .4byte gOamObjects+0x1A8
_0800B764:
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrb r0, [r3, #2]
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r2, #2]
	movs r0, #0xab
	lsls r0, r0, #7
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r0, [r3, #2]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0800B7B4 @ =0x00008020
	strh r0, [r2, #2]
	ldr r0, _0800B7B8 @ =0x00005588
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r0, [r3, #3]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0800B7BC @ =0x000080B0
	strh r0, [r2, #2]
	ldr r0, _0800B7C0 @ =0x00005590
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r3, [r3, #3]
	orrs r1, r3
	strh r1, [r2]
	ldr r0, _0800B7C4 @ =0x000080D0
	strh r0, [r2, #2]
	ldr r0, _0800B7C8 @ =0x00005598
	strh r0, [r2, #4]
_0800B7AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7B4: .4byte 0x00008020
_0800B7B8: .4byte 0x00005588
_0800B7BC: .4byte 0x000080B0
_0800B7C0: .4byte 0x00005590
_0800B7C4: .4byte 0x000080D0
_0800B7C8: .4byte 0x00005598

	thumb_func_start sub_800B7CC
sub_800B7CC: @ 0x0800B7CC
	push {r4, r5, lr}
	sub sp, #0x20
	ldr r2, _0800B830 @ =0x040000D4
	ldr r0, _0800B834 @ =gGfxWitnessBench1
	str r0, [r2]
	ldr r0, _0800B838 @ =0x06012000
	str r0, [r2, #4]
	ldr r0, _0800B83C @ =0x80000300
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0800B840 @ =gMain
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B850
	ldr r0, _0800B844 @ =gPalWitnessBench
	str r0, [r2]
	mov r0, sp
	str r0, [r2, #4]
	ldr r0, _0800B848 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r5, #0
_0800B800:
	lsls r0, r5, #1
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0800B800
	ldr r1, _0800B830 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800B84C @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0800B848 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800B882
	.align 2, 0
_0800B830: .4byte 0x040000D4
_0800B834: .4byte gGfxWitnessBench1
_0800B838: .4byte 0x06012000
_0800B83C: .4byte 0x80000300
_0800B840: .4byte gMain
_0800B844: .4byte gPalWitnessBench
_0800B848: .4byte 0x80000010
_0800B84C: .4byte 0x05000340
_0800B850:
	adds r0, r3, #0
	adds r0, #0x90
	ldrh r1, [r0]
	cmp r1, #7
	beq _0800B864
	cmp r1, #3
	beq _0800B864
	ldr r0, _0800B870 @ =0x0000FFFD
	cmp r1, r0
	bne _0800B874
_0800B864:
	movs r0, #3
	movs r1, #0xff
	movs r2, #1
	bl LoadAndAdjustCounselWitnessBenchPaletteByMode
	b _0800B882
	.align 2, 0
_0800B870: .4byte 0x0000FFFD
_0800B874:
	ldr r0, _0800B88C @ =gPalWitnessBench
	str r0, [r2]
	ldr r0, _0800B890 @ =0x05000340
	str r0, [r2, #4]
	ldr r0, _0800B894 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0800B882:
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B88C: .4byte gPalWitnessBench
_0800B890: .4byte 0x05000340
_0800B894: .4byte 0x80000010

	thumb_func_start sub_800B898
sub_800B898: @ 0x0800B898
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r6, _0800B8C4 @ =gOamObjects+0x180
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0800B8C8
	movs r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
_0800B8B8:
	strh r1, [r6]
	adds r6, #8
	adds r0, #1
	cmp r0, #3
	bls _0800B8B8
	b _0800B946
	.align 2, 0
_0800B8C4: .4byte gOamObjects+0x180
_0800B8C8:
	ldr r0, _0800B958 @ =0x000001FF
	ands r5, r0
	subs r0, #0xff
	mov r8, r0
	bl fix_inverse
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r1, _0800B95C @ =0xFFFFFE80
	adds r7, r6, r1
	strh r0, [r7, #6]
	movs r0, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0xe]
	movs r0, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0x1e]
	movs r3, #0x80
	lsls r3, r3, #7
	add r3, sb
	strh r3, [r6]
	ldr r4, _0800B960 @ =0xFFFFC000
	adds r0, r4, #0
	adds r0, r5, r0
	strh r0, [r6, #2]
	movs r2, #0xad
	lsls r2, r2, #8
	strh r2, [r6, #4]
	adds r6, #8
	mov r0, sb
	strh r0, [r6]
	ldr r1, _0800B964 @ =0xFFFF8040
	adds r0, r5, r1
	strh r0, [r6, #2]
	ldr r1, _0800B968 @ =0x0000AD20
	strh r1, [r6, #4]
	adds r6, #8
	mov r4, sb
	strh r4, [r6]
	ldr r4, _0800B96C @ =0xFFFF9060
	adds r0, r5, r4
	strh r0, [r6, #2]
	strh r1, [r6, #4]
	adds r6, #8
	strh r3, [r6]
	ldr r1, _0800B970 @ =0xFFFFD080
	adds r0, r5, r1
	strh r0, [r6, #2]
	strh r2, [r6, #4]
_0800B946:
	bl sub_800BBE4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B958: .4byte 0x000001FF
_0800B95C: .4byte 0xFFFFFE80
_0800B960: .4byte 0xFFFFC000
_0800B964: .4byte 0xFFFF8040
_0800B968: .4byte 0x0000AD20
_0800B96C: .4byte 0xFFFF9060
_0800B970: .4byte 0xFFFFD080

	thumb_func_start LoadCounselBenchGraphics
LoadCounselBenchGraphics: @ 0x0800B974
	push {r4, r5, lr}
	sub sp, #0x20
	ldr r2, _0800B9D8 @ =0x040000D4
	ldr r0, _0800B9DC @ =gGfxCounselBench1
	str r0, [r2]
	ldr r0, _0800B9E0 @ =0x06012000
	str r0, [r2, #4]
	ldr r0, _0800B9E4 @ =0x80000680
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0800B9E8 @ =gMain
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B9F8
	ldr r0, _0800B9EC @ =gPalCounselBench
	str r0, [r2]
	mov r0, sp
	str r0, [r2, #4]
	ldr r0, _0800B9F0 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r5, #0
_0800B9A8:
	lsls r0, r5, #1
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0800B9A8
	ldr r1, _0800B9D8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800B9F4 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0800B9F0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800BA2A
	.align 2, 0
_0800B9D8: .4byte 0x040000D4
_0800B9DC: .4byte gGfxCounselBench1
_0800B9E0: .4byte 0x06012000
_0800B9E4: .4byte 0x80000680
_0800B9E8: .4byte gMain
_0800B9EC: .4byte gPalCounselBench
_0800B9F0: .4byte 0x80000010
_0800B9F4: .4byte 0x05000340
_0800B9F8:
	adds r0, r3, #0
	adds r0, #0x90
	ldrh r1, [r0]
	cmp r1, #7
	beq _0800BA0C
	cmp r1, #3
	beq _0800BA0C
	ldr r0, _0800BA18 @ =0x0000FFFD
	cmp r1, r0
	bne _0800BA1C
_0800BA0C:
	movs r0, #2
	movs r1, #0xff
	movs r2, #1
	bl LoadAndAdjustCounselWitnessBenchPaletteByMode
	b _0800BA2A
	.align 2, 0
_0800BA18: .4byte 0x0000FFFD
_0800BA1C:
	ldr r0, _0800BA34 @ =gPalCounselBench
	str r0, [r2]
	ldr r0, _0800BA38 @ =0x05000340
	str r0, [r2, #4]
	ldr r0, _0800BA3C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0800BA2A:
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA34: .4byte gPalCounselBench
_0800BA38: .4byte 0x05000340
_0800BA3C: .4byte 0x80000010

	thumb_func_start sub_800BA40
sub_800BA40: @ 0x0800BA40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0800BA74 @ =0x000001FF
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r6, _0800BA78 @ =gOamObjects+0x180
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0800BA7C
	movs r0, #0x80
	lsls r0, r0, #2
	movs r2, #3
_0800BA68:
	strh r0, [r6]
	adds r6, #8
	subs r2, #1
	cmp r2, #0
	bge _0800BA68
	b _0800BAF2
	.align 2, 0
_0800BA74: .4byte 0x000001FF
_0800BA78: .4byte gOamObjects+0x180
_0800BA7C:
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	bl fix_inverse
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl fix_mul
	ldr r3, _0800BB04 @ =0xFFFFFE80
	adds r7, r6, r3
	strh r0, [r7, #6]
	movs r0, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0xe]
	movs r0, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0x16]
	adds r0, r5, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0x1e]
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #7
	add r3, sb
	ldr r0, _0800BB08 @ =0xFFFFC000
	add r0, r8
	ldr r1, _0800BB0C @ =0xFFFFAD00
_0800BAC6:
	strh r3, [r6]
	strh r0, [r6, #2]
	strh r1, [r6, #4]
	adds r6, #8
	adds r0, #0x40
	adds r1, #0x20
	adds r2, #1
	cmp r2, #2
	ble _0800BAC6
	ldr r1, _0800BB10 @ =0xFFFF8000
	adds r0, r1, #0
	mov r3, sb
	adds r1, r3, r0
	strh r1, [r6]
	add r0, r8
	lsls r1, r2, #6
	adds r0, r0, r1
	strh r0, [r6, #2]
	lsls r0, r2, #5
	ldr r1, _0800BB0C @ =0xFFFFAD00
	adds r0, r0, r1
	strh r0, [r6, #4]
_0800BAF2:
	bl sub_800BBE4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB04: .4byte 0xFFFFFE80
_0800BB08: .4byte 0xFFFFC000
_0800BB0C: .4byte 0xFFFFAD00
_0800BB10: .4byte 0xFFFF8000

	thumb_func_start sub_800BB14
sub_800BB14: @ 0x0800BB14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0800BB44 @ =0x000001FF
	ands r5, r0
	ldr r6, _0800BB48 @ =gOamObjects+0x180
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0800BB4C
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #2
_0800BB38:
	strh r0, [r6]
	adds r6, #8
	adds r2, #1
	cmp r2, #3
	bls _0800BB38
	b _0800BBBA
	.align 2, 0
_0800BB44: .4byte 0x000001FF
_0800BB48: .4byte gOamObjects+0x180
_0800BB4C:
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	bl fix_inverse
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r1, _0800BBCC @ =0xFFFFFE80
	adds r7, r6, r1
	strh r0, [r7, #6]
	movs r0, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0xe]
	movs r0, #0
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r7, #0x1e]
	ldr r0, _0800BBD0 @ =0xFFFF8000
	add r0, sb
	strh r0, [r6]
	ldr r3, _0800BBD4 @ =0xFFFF9000
	adds r0, r5, r3
	strh r0, [r6, #2]
	ldr r0, _0800BBD8 @ =0x0000AD60
	strh r0, [r6, #4]
	adds r6, #8
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #7
	add r1, sb
	ldr r3, _0800BBDC @ =0x0000D010
	adds r0, r5, r3
	ldr r3, _0800BBE0 @ =0x0000AD40
_0800BBA8:
	strh r1, [r6]
	strh r0, [r6, #2]
	strh r3, [r6, #4]
	adds r6, #8
	adds r0, #0x40
	subs r3, #0x20
	adds r2, #1
	cmp r2, #2
	bls _0800BBA8
_0800BBBA:
	bl sub_800BBE4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BBCC: .4byte 0xFFFFFE80
_0800BBD0: .4byte 0xFFFF8000
_0800BBD4: .4byte 0xFFFF9000
_0800BBD8: .4byte 0x0000AD60
_0800BBDC: .4byte 0x0000D010
_0800BBE0: .4byte 0x0000AD40

	thumb_func_start sub_800BBE4
sub_800BBE4: @ 0x0800BBE4
	push {r4, lr}
	ldr r1, _0800BC04 @ =gOamObjects+0x180
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #5
	adds r3, r0, #0
_0800BBF0:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #8
	adds r2, #1
	cmp r2, #3
	bls _0800BBF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC04: .4byte gOamObjects+0x180
