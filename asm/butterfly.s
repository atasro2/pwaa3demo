	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start init_move_butterfly_Unity
init_move_butterfly_Unity: @ 0x0801F9E4
	push {r4, r5, r6, r7, lr}
	ldr r2, _0801FA18 @ =gScriptContext
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x54
	adds r2, r1, r2
	ldrh r6, [r2, #2]
	ldr r1, _0801FA1C @ =gUnknown_08028764
	ldrb r3, [r2, #0x17]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrh r4, [r0, #2]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r3, _0801FA20 @ =0x0000FFFF
	cmp r1, r0
	ble _0801FA0E
	movs r3, #1
_0801FA0E:
	adds r7, r3, #0
	cmp r1, r0
	ble _0801FA24
	subs r0, r1, r0
	b _0801FA26
	.align 2, 0
_0801FA18: .4byte gScriptContext
_0801FA1C: .4byte gUnknown_08028764
_0801FA20: .4byte 0x0000FFFF
_0801FA24:
	subs r0, r0, r1
_0801FA26:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0801FA48 @ =0x0000FFFF
	cmp r1, r0
	ble _0801FA3C
	movs r3, #1
_0801FA3C:
	adds r4, r3, #0
	cmp r1, r0
	ble _0801FA4C
	subs r0, r1, r0
	b _0801FA4E
	.align 2, 0
_0801FA48: .4byte 0x0000FFFF
_0801FA4C:
	subs r0, r0, r1
_0801FA4E:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _0801FA64
	rsbs r0, r1, #0
	b _0801FA66
_0801FA64:
	rsbs r0, r0, #0
_0801FA66:
	strh r0, [r2, #0xa]
	movs r0, #0
	strh r5, [r2, #0x10]
	strh r3, [r2, #0x12]
	strh r7, [r2, #0xc]
	strh r4, [r2, #0xe]
	strh r0, [r2, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start move_butterfly_Unity
move_butterfly_Unity: @ 0x0801FA7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801FAC0 @ =gScriptContext
	mov sl, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x54
	mov r2, sl
	adds r5, r1, r2
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	ldr r3, _0801FAC4 @ =gAnimation+0x44
	mov sb, r3
	ldr r1, _0801FAC8 @ =gUnknown_08028764
	ldrb r4, [r5, #0x17]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrh r2, [r0]
	ldrh r3, [r0, #2]
	movs r6, #0xc
	ldrsh r0, [r5, r6]
	cmp r0, #0
	ble _0801FACC
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0801FAD2
	.align 2, 0
_0801FAC0: .4byte gScriptContext
_0801FAC4: .4byte gAnimation+0x44
_0801FAC8: .4byte gUnknown_08028764
_0801FACC:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_0801FAD2:
	str r0, [r7]
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	cmp r1, r0
	blt _0801FB1E
	ldrh r6, [r5]
	ldrh r1, [r5, #0xc]
	adds r0, r6, r1
	strh r0, [r5]
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	lsls r0, r0, #1
	ldrh r6, [r5, #0xa]
	adds r1, r6, r0
	strh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _0801FB0C
	ldrh r4, [r5, #2]
	ldrh r6, [r5, #0xe]
	adds r0, r4, r6
	strh r0, [r5, #2]
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	lsls r0, r0, #1
	subs r0, r1, r0
	strh r0, [r5, #0xa]
_0801FB0C:
	ldrh r0, [r5, #6]
	adds r0, #1
	strh r0, [r5, #6]
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	ldrh r1, [r5, #6]
	cmp r1, r0
	blt _0801FB5E
	b _0801FB5A
_0801FB1E:
	ldrh r4, [r5, #2]
	ldrh r6, [r5, #0xe]
	adds r0, r4, r6
	strh r0, [r5, #2]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	ldrh r4, [r5, #0xa]
	adds r1, r4, r0
	strh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _0801FB4A
	ldrh r6, [r5]
	ldrh r4, [r5, #0xc]
	adds r0, r6, r4
	strh r0, [r5]
	movs r6, #0x12
	ldrsh r0, [r5, r6]
	lsls r0, r0, #1
	subs r0, r1, r0
	strh r0, [r5, #0xa]
_0801FB4A:
	ldrh r0, [r5, #6]
	adds r0, #1
	strh r0, [r5, #6]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	ldrh r4, [r5, #6]
	cmp r4, r0
	blt _0801FB5E
_0801FB5A:
	strh r2, [r5]
	strh r3, [r5, #2]
_0801FB5E:
	ldrh r6, [r5]
	mov r8, r6
	cmp r6, r2
	bne _0801FC3C
	ldrh r0, [r5, #2]
	cmp r0, r3
	bne _0801FC3C
	ldrb r0, [r5, #0x17]
	strb r0, [r5, #0x14]
	ldrb r1, [r5, #0x15]
	lsrs r6, r1, #1
	movs r2, #0xf
	mov r8, r2
	mov r3, r8
	ands r6, r3
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	ldr r3, _0801FBE4 @ =gUnknown_08028764
	ldrb r4, [r5, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r5]
	adds r1, r4, #0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	strh r1, [r5, #2]
	mov r4, sb
	ldrh r4, [r4, #0x10]
	adds r2, r2, r4
	ldr r1, _0801FBE8 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r6, sb
	ldrh r1, [r6, #0x12]
	ldrh r6, [r5, #2]
	adds r1, r1, r6
	mov sb, r1
	ldr r1, _0801FBEC @ =gUnknown_08028741
	mov r2, r8
	ands r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	strh r0, [r7, #0x12]
	ldrb r4, [r5, #0x14]
	lsls r0, r4, #2
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	bge _0801FBF0
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0801FBF6
	.align 2, 0
_0801FBE4: .4byte gUnknown_08028764
_0801FBE8: .4byte gUnknown_08028751
_0801FBEC: .4byte gUnknown_08028741
_0801FBF0:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_0801FBF6:
	str r0, [r7]
	mov r0, sl
	adds r0, #0x4e
	ldrh r0, [r0]
	cmp r0, #0xa
	bne _0801FC08
	movs r0, #0
	strh r0, [r5, #4]
	b _0801FC34
_0801FC08:
	movs r0, #7
	strh r0, [r5, #4]
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x52
	strh r0, [r1]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0801FC34
	movs r0, #0
	strb r0, [r1]
_0801FC34:
	movs r0, #0
	strb r0, [r5, #0x17]
	strh r0, [r5, #8]
	b _0801FC78
_0801FC3C:
	ldrb r0, [r5, #0x15]
	lsrs r6, r0, #1
	movs r4, #0xf
	ands r6, r4
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	mov r1, sb
	ldrh r2, [r1, #0x10]
	add r2, r8
	ldr r1, _0801FC94 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r3, sb
	ldrh r3, [r3, #0x12]
	ldrh r6, [r5, #2]
	adds r2, r3, r6
	ldr r1, _0801FC98 @ =gUnknown_08028741
	ands r0, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r7, #0x12]
_0801FC78:
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x16]
	adds r0, #1
	strb r0, [r5, #0x16]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC94: .4byte gUnknown_08028751
_0801FC98: .4byte gUnknown_08028741

	thumb_func_start CheckButterfly_Unity
CheckButterfly_Unity: @ 0x0801FC9C
	adds r3, r0, #0
	ldr r0, _0801FCB4 @ =gScriptContext
	movs r1, #0
	adds r2, r0, #0
	adds r2, #0x54
_0801FCA6:
	ldrb r0, [r2, #0x14]
	cmp r0, r3
	bne _0801FCB8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	b _0801FCC4
	.align 2, 0
_0801FCB4: .4byte gScriptContext
_0801FCB8:
	adds r2, #0x18
	adds r1, #1
	cmp r1, #2
	bls _0801FCA6
	movs r0, #1
	rsbs r0, r0, #0
_0801FCC4:
	bx lr
	.align 2, 0

	thumb_func_start CheckMoveButterfly_Unity
CheckMoveButterfly_Unity: @ 0x0801FCC8
	ldr r0, _0801FCDC @ =gScriptContext
	movs r1, #0
	adds r0, #0x54
_0801FCCE:
	ldrh r2, [r0, #4]
	cmp r2, #6
	bne _0801FCE0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	b _0801FCEC
	.align 2, 0
_0801FCDC: .4byte gScriptContext
_0801FCE0:
	adds r0, #0x18
	adds r1, #1
	cmp r1, #2
	bls _0801FCCE
	movs r0, #1
	rsbs r0, r0, #0
_0801FCEC:
	bx lr
	.align 2, 0

	thumb_func_start CheckLRButterfly_Unity
CheckLRButterfly_Unity: @ 0x0801FCF0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0801FD0C @ =gScriptContext
	movs r1, #0
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x68
_0801FD00:
	cmp r4, #0
	bne _0801FD10
	ldrb r0, [r2]
	cmp r0, #2
	bhi _0801FD20
	b _0801FD16
	.align 2, 0
_0801FD0C: .4byte gScriptContext
_0801FD10:
	ldrb r0, [r2]
	cmp r0, #2
	bls _0801FD20
_0801FD16:
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
_0801FD20:
	adds r2, #0x18
	adds r3, #1
	cmp r3, #2
	bls _0801FD00
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start InstructionButterfly_Unity
InstructionButterfly_Unity: @ 0x0801FD34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r7, _0801FD5C @ =gScriptContext
	lsls r0, r0, #1
	add r0, r8
	lsls r0, r0, #3
	adds r0, #0x54
	adds r5, r0, r7
	movs r6, #0
	ldrb r0, [r5, #0x14]
	cmp r0, #5
	bls _0801FD52
	b _0801FFB2
_0801FD52:
	lsls r0, r0, #2
	ldr r1, _0801FD60 @ =_0801FD64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801FD5C: .4byte gScriptContext
_0801FD60: .4byte _0801FD64
_0801FD64: @ jump table
	.4byte _0801FD7C @ case 0
	.4byte _0801FDA8 @ case 1
	.4byte _0801FE12 @ case 2
	.4byte _0801FE4C @ case 3
	.4byte _0801FEEC @ case 4
	.4byte _0801FF1E @ case 5
_0801FD7C:
	movs r0, #1
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _0801FDA2
	movs r0, #2
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	beq _0801FD9E
	b _0801FF76
_0801FD9E:
	movs r0, #2
	b _0801FDA4
_0801FDA2:
	movs r0, #1
_0801FDA4:
	strb r0, [r5, #0x17]
	b _0801FFA8
_0801FDA8:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FE04
	cmp r0, #1
	bgt _0801FDD0
_0801FDCA:
	cmp r0, #0
	beq _0801FDF6
	b _0801FF6A
_0801FDD0:
	cmp r0, #3
	ble _0801FDD6
	b _0801FF6A
_0801FDD6:
	movs r0, #1
	bl CheckLRButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0801FDE8
	b _0801FF6A
_0801FDE8:
	movs r0, #5
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #5
	b _0801FF6A
_0801FDF6:
	movs r0, #0
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #0
	b _0801FF6A
_0801FE04:
	movs r0, #2
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #2
	b _0801FF6A
_0801FE12:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FE3E
	cmp r0, #1
	ble _0801FDCA
	cmp r0, #2
	beq _0801FDF6
	cmp r0, #3
	beq _0801FE3E
	b _0801FF6A
_0801FE3E:
	movs r0, #1
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #1
	b _0801FF6A
_0801FE4C:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FEA4
	cmp r0, #1
	bgt _0801FE74
	cmp r0, #0
	beq _0801FE96
	b _0801FEB0
_0801FE74:
	cmp r0, #3
	bgt _0801FEB0
	movs r0, #0
	bl CheckLRButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _0801FEB0
	movs r0, #2
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #2
	b _0801FEB0
_0801FE96:
	movs r0, #5
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #5
	b _0801FEB0
_0801FEA4:
	movs r0, #4
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #4
_0801FEB0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801FFA6
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x52
	movs r2, #0
	strh r0, [r1]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0801FEE4
	strb r2, [r1]
_0801FEE4:
	movs r0, #0
	strh r0, [r5, #8]
	strb r2, [r5, #0x17]
	b _0801FFB2
_0801FEEC:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	bne _0801FF0C
	b _0801FDE8
_0801FF0C:
	cmp r0, #1
	ble _0801FF40
	cmp r0, #2
	bne _0801FF16
	b _0801FDE8
_0801FF16:
	cmp r0, #3
	bne _0801FF6A
	movs r2, #1
	b _0801FF6A
_0801FF1E:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FF5E
	cmp r0, #1
	bgt _0801FF46
_0801FF40:
	cmp r0, #0
	beq _0801FF50
	b _0801FF6A
_0801FF46:
	cmp r0, #2
	beq _0801FF50
	cmp r0, #4
	beq _0801FF5E
	b _0801FF6A
_0801FF50:
	movs r0, #3
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #3
	b _0801FF6A
_0801FF5E:
	movs r0, #4
	bl CheckButterfly_Unity
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #4
_0801FF6A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801FFA6
_0801FF76:
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x52
	movs r2, #0
	strh r0, [r1]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0801FF9E
	strb r2, [r1]
_0801FF9E:
	strb r2, [r5, #0x17]
	movs r0, #0
	strh r0, [r5, #8]
	b _0801FFB2
_0801FFA6:
	strb r6, [r5, #0x17]
_0801FFA8:
	mov r0, r8
	bl init_move_butterfly_Unity
	movs r0, #6
	strh r0, [r5, #4]
_0801FFB2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Butterfly_Unity
Butterfly_Unity: @ 0x0801FFBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0802001C @ =gScriptContext
	mov sl, r0
	adds r0, #0x4e
	ldrh r0, [r0]
	cmp r0, #0
	beq _08020004
	ldr r7, _08020020 @ =gAnimation+0x44
	ldrb r0, [r7, #0xe]
	cmp r0, #0xb
	beq _0801FFE0
	cmp r0, #0x21
	bne _0801FFEC
_0801FFE0:
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08020004
_0801FFEC:
	mov r2, sl
	adds r2, #0x4e
	ldrh r1, [r2]
	subs r0, r1, #5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08020004
	mov r3, sl
	strh r1, [r3, #0x20]
	movs r0, #5
	strh r0, [r2]
_08020004:
	mov r0, sl
	adds r0, #0x4e
	ldrb r1, [r0]
	str r0, [sp, #4]
	cmp r1, #0xc
	bls _08020012
	b _080206DC
_08020012:
	lsls r0, r1, #2
	ldr r1, _08020024 @ =_08020028
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802001C: .4byte gScriptContext
_08020020: .4byte gAnimation+0x44
_08020024: .4byte _08020028
_08020028: @ jump table
	.4byte _080206DC @ case 0
	.4byte _08020106 @ case 1
	.4byte _08020398 @ case 2
	.4byte _080201B4 @ case 3
	.4byte _08020314 @ case 4
	.4byte _08020084 @ case 5
	.4byte _080206DC @ case 6
	.4byte _0802005C @ case 7
	.4byte _08020270 @ case 8
	.4byte _080200D0 @ case 9
	.4byte _08020398 @ case 10
	.4byte _08020360 @ case 11
	.4byte _08020398 @ case 12
_0802005C:
	movs r4, #0
	mov r8, r4
_08020060:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	beq _08020072
	bl DestroyAnimation
_08020072:
	movs r6, #1
	add r8, r6
	mov r0, r8
	cmp r0, #5
	bls _08020060
	bl sub_8013050
	movs r0, #0
	b _08020394
_08020084:
	movs r2, #0
	mov r8, r2
_08020088:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	beq _080200A4
	ldr r0, [r7]
	ldr r1, _080200C4 @ =0xDFFFFFFF
	ands r0, r1
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7]
_080200A4:
	movs r3, #1
	add r8, r3
	mov r4, r8
	cmp r4, #5
	bls _08020088
	bl sub_8013050
	ldr r6, [sp, #4]
	ldrh r6, [r6]
	cmp r6, #5
	bne _080200C8
	movs r0, #6
	ldr r1, [sp, #4]
	strh r0, [r1]
	b _080206DC
	.align 2, 0
_080200C4: .4byte 0xDFFFFFFF
_080200C8:
	movs r0, #0
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _080206DC
_080200D0:
	movs r3, #0
	mov r8, r3
	movs r4, #0x80
	lsls r4, r4, #0x16
_080200D8:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	beq _080200EC
	ldr r0, [r7]
	orrs r0, r4
	str r0, [r7]
_080200EC:
	movs r6, #1
	add r8, r6
	mov r0, r8
	cmp r0, #5
	bls _080200D8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	cmp r0, #0
	bne _08020100
	b _08020398
_08020100:
	mov r2, sl
	ldrh r0, [r2, #0x20]
	b _08020396
_08020106:
	movs r3, #0
	mov r8, r3
	mov r6, sl
	adds r6, #0x50
	movs r4, #0x51
	add r4, sl
	mov sb, r4
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	ldr r7, _080201A8 @ =gAnimation+0x44
	mov r4, sl
	adds r4, #0x54
	movs r5, #0
_08020122:
	mov r1, r8
	lsls r2, r1, #1
	movs r0, #1
	strh r0, [r4, #4]
	ldr r0, _080201AC @ =gUnknown_08028794
	add r0, r8
	ldrb r1, [r0]
	adds r0, r1, #6
	strb r0, [r4, #0x14]
	strb r2, [r4, #0x15]
	strb r5, [r4, #0x16]
	strb r1, [r4, #0x17]
	movs r2, #0
	strh r2, [r4, #8]
	mov r0, r8
	adds r0, #0x83
	movs r1, #0x10
	ldrsh r3, [r7, r1]
	str r3, [sp, #0x10]
	ldrb r2, [r4, #0x14]
	lsls r3, r2, #2
	ldr r1, _080201B0 @ =gUnknown_08028764
	adds r3, r3, r1
	movs r1, #0
	ldrsh r2, [r3, r1]
	mov ip, r2
	ldr r2, [sp, #0x10]
	add r2, ip
	str r2, [sp, #0x10]
	movs r2, #0x12
	ldrsh r1, [r7, r2]
	mov ip, r1
	movs r2, #2
	ldrsh r1, [r3, r2]
	adds r2, r1, #0
	add r2, ip
	ldr r1, [sp, #0x10]
	bl PlayAnimationAtCustomOrigin
	ldrb r3, [r4, #0x14]
	lsls r0, r3, #2
	ldr r1, _080201B0 @ =gUnknown_08028764
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r2, r3, #0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	strh r0, [r4, #2]
	adds r4, #0x18
	adds r5, #3
	movs r3, #1
	add r8, r3
	mov r0, r8
	cmp r0, #2
	bls _08020122
	movs r1, #2
	movs r0, #0
	strb r0, [r6]
	mov r2, sb
	strb r0, [r2]
	ldr r3, [sp, #8]
	strh r0, [r3]
	ldr r4, [sp, #4]
	strh r1, [r4]
	b _08020398
	.align 2, 0
_080201A8: .4byte gAnimation+0x44
_080201AC: .4byte gUnknown_08028794
_080201B0: .4byte gUnknown_08028764
_080201B4:
	movs r6, #0
	mov r8, r6
	mov r6, sl
	adds r6, #0x4a
	mov r5, sl
	adds r5, #0x58
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
_080201C6:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	beq _08020230
	mov r1, r8
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	movs r2, #0
	mov r0, sl
	adds r0, #0x46
	ldr r3, [sp, #0xc]
	adds r0, r0, r3
	ldrh r4, [r6]
	ldrh r0, [r0]
	cmp r4, r0
	bls _080201F0
	movs r2, #1
_080201F0:
	ands r1, r2
	cmp r1, #0
	bne _080201FC
	mov r0, r8
	cmp r0, #0
	bne _08020230
_080201FC:
	mov r4, r8
	adds r4, #0x86
	movs r2, #0x10
	ldrsh r1, [r7, r2]
	movs r3, #0x12
	ldrsh r2, [r7, r3]
	adds r0, r4, #0
	bl PlayAnimationAtCustomOrigin
	adds r0, r4, #0
	bl FindAnimationFromAnimId
	mov sb, r0
	ldr r0, [r7, #0x1c]
	mov r4, sb
	str r0, [r4, #0x1c]
	adds r0, r7, #0
	bl DestroyAnimation
	movs r0, #5
	strh r0, [r5]
	mov r0, r8
	cmp r0, #2
	bne _08020230
	ldr r1, [sp, #4]
	strh r0, [r1]
_08020230:
	adds r5, #0x18
	ldr r2, [sp, #0xc]
	adds r2, #2
	str r2, [sp, #0xc]
	movs r3, #1
	add r8, r3
	mov r4, r8
	cmp r4, #2
	bls _080201C6
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r6, #0x4e
	mov r8, r6
	ldr r0, _0802026C @ =gOamObjects
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x9c
	lsls r2, r2, #2
	adds r0, r0, r2
_08020258:
	strh r1, [r0]
	adds r0, #8
	movs r3, #1
	add r8, r3
	mov r4, r8
	cmp r4, #0x7f
	bls _08020258
	bl sub_8013050
	b _080206DC
	.align 2, 0
_0802026C: .4byte gOamObjects
_08020270:
	movs r6, #0
	mov r8, r6
	mov r6, sl
	adds r6, #0x50
	movs r0, #0x51
	add r0, sl
	mov sb, r0
	mov r1, sl
	adds r1, #0x52
	str r1, [sp, #8]
	ldr r7, _08020308 @ =gAnimation+0x44
	mov r4, sl
	adds r4, #0x58
	movs r5, #0
_0802028C:
	mov r2, r8
	lsls r1, r2, #1
	movs r0, #7
	strh r0, [r4]
	ldr r0, _0802030C @ =gUnknown_08028794
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	strb r1, [r4, #0x11]
	strb r5, [r4, #0x12]
	movs r3, #0
	strb r3, [r4, #0x13]
	movs r0, #0
	strh r0, [r4, #4]
	mov r0, r8
	adds r0, #0x83
	movs r2, #0x10
	ldrsh r1, [r7, r2]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #0x10]
	lsls r3, r1, #2
	ldr r2, _08020310 @ =gUnknown_08028764
	adds r3, r3, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	mov ip, r1
	ldr r1, [sp, #0x10]
	add r1, ip
	str r1, [sp, #0x10]
	movs r1, #0x12
	ldrsh r2, [r7, r1]
	mov ip, r2
	movs r1, #2
	ldrsh r2, [r3, r1]
	add r2, ip
	ldr r1, [sp, #0x10]
	bl PlayAnimationAtCustomOrigin
	adds r4, #0x18
	adds r5, #3
	movs r2, #1
	add r8, r2
	mov r3, r8
	cmp r3, #2
	bls _0802028C
	movs r4, #2
	movs r0, #0
	strb r0, [r6]
	mov r6, sb
	strb r0, [r6]
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	strh r0, [r1]
	ldr r2, [sp, #4]
	strh r4, [r2]
	b _08020398
	.align 2, 0
_08020308: .4byte gAnimation+0x44
_0802030C: .4byte gUnknown_08028794
_08020310: .4byte gUnknown_08028764
_08020314:
	movs r3, #0
	mov r8, r3
	mov r6, sl
	adds r6, #0x50
	movs r4, #0x51
	add r4, sl
	mov sb, r4
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	movs r3, #0xf
	movs r2, #4
	mov r1, sl
	adds r1, #0x58
_08020330:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #1
	bne _0802033E
	ldrb r0, [r1, #0x13]
	strb r0, [r1, #0x10]
_0802033E:
	strh r2, [r1]
	adds r1, #0x18
	movs r0, #1
	add r8, r0
	mov r4, r8
	cmp r4, #2
	bls _08020330
	movs r0, #0
	strb r0, [r6]
	mov r6, sb
	strb r0, [r6]
	ldr r1, [sp, #8]
	strh r0, [r1]
	movs r0, #0xa
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _08020398
_08020360:
	movs r3, #0
	mov r8, r3
	mov r6, sl
	adds r6, #0x50
	movs r4, #0x51
	add r4, sl
	mov sb, r4
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	movs r1, #9
	adds r0, #2
_08020378:
	strh r1, [r0, #4]
	adds r0, #0x18
	movs r2, #1
	add r8, r2
	mov r3, r8
	cmp r3, #2
	bls _08020378
	movs r0, #0
	strb r0, [r6]
	mov r4, sb
	strb r0, [r4]
	ldr r6, [sp, #8]
	strh r0, [r6]
	movs r0, #0xc
_08020394:
	ldr r1, [sp, #4]
_08020396:
	strh r0, [r1]
_08020398:
	movs r2, #0
	str r2, [sp]
	mov r8, r2
_0802039E:
	mov r3, r8
	lsls r0, r3, #1
	add r0, r8
	lsls r0, r0, #3
	adds r0, #0x54
	mov r4, sl
	adds r5, r4, r0
	movs r0, #0xf
	ldrh r6, [r5, #4]
	ands r0, r6
	mov r6, r8
	adds r6, #1
	cmp r0, #9
	bls _080203BC
	b _080206AC
_080203BC:
	lsls r0, r0, #2
	ldr r1, _080203C8 @ =_080203CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080203C8: .4byte _080203CC
_080203CC: @ jump table
	.4byte _080203F4 @ case 0
	.4byte _0802043E @ case 1
	.4byte _080206AC @ case 2
	.4byte _080206AC @ case 3
	.4byte _0802063A @ case 4
	.4byte _080204F0 @ case 5
	.4byte _08020668 @ case 6
	.4byte _08020528 @ case 7
	.4byte _080206AC @ case 8
	.4byte _08020670 @ case 9
_080203F4:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	beq _0802040A
	bl DestroyAnimation
	movs r0, #1
	str r0, [sp]
_0802040A:
	mov r6, r8
	adds r6, #1
	mov r1, r8
	cmp r1, #2
	beq _08020416
	b _080206AC
_08020416:
	movs r4, #0
	movs r5, #0
_0802041A:
	adds r0, r4, #0
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	bne _0802042A
	adds r5, #1
_0802042A:
	adds r4, #1
	cmp r4, #2
	bls _0802041A
	cmp r5, #3
	beq _08020436
	b _080206AC
_08020436:
	movs r0, #0
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _080206AC
_0802043E:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	bne _08020452
	b _080206AC
_08020452:
	ldr r3, _080204C0 @ =gAnimation+0x44
	mov sb, r3
	ldrb r4, [r5, #0x15]
	lsrs r6, r4, #1
	movs r4, #0xf
	ands r6, r4
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	ands r0, r4
	ldr r3, _080204C4 @ =gUnknown_08028764
	ldrb r2, [r5, #0x14]
	lsls r1, r2, #2
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r5]
	ldrb r4, [r5, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	strh r1, [r5, #2]
	mov r1, sb
	ldrh r1, [r1, #0x10]
	adds r2, r2, r1
	ldr r1, _080204C8 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r4, sb
	ldrh r4, [r4, #0x12]
	ldrh r6, [r5, #2]
	adds r2, r4, r6
	ldr r1, _080204CC @ =gUnknown_08028741
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r7, #0x12]
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _080204D0
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _080204D6
	.align 2, 0
_080204C0: .4byte gAnimation+0x44
_080204C4: .4byte gUnknown_08028764
_080204C8: .4byte gUnknown_08028751
_080204CC: .4byte gUnknown_08028741
_080204D0:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_080204D6:
	str r0, [r7]
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x16]
	adds r0, #1
	strb r0, [r5, #0x16]
	mov r0, r8
	bl init_move_butterfly_Unity
	movs r0, #6
	strh r0, [r5, #4]
	b _0802067E
_080204F0:
	movs r0, #2
	strh r0, [r5, #4]
	mov r6, r8
	adds r6, #1
	mov r3, r8
	cmp r3, #2
	beq _08020500
	b _080206AC
_08020500:
	movs r4, #0
	movs r5, #0
_08020504:
	adds r0, r4, #0
	adds r0, #0x86
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	cmp r7, #0
	bne _08020514
	adds r5, #1
_08020514:
	adds r4, #1
	cmp r4, #2
	bls _08020504
	cmp r5, #3
	beq _08020520
	b _080206AC
_08020520:
	movs r0, #0
	ldr r4, [sp, #4]
	strh r0, [r4]
	b _080206AC
_08020528:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	bne _0802053C
	b _080206AC
_0802053C:
	ldr r6, _080205AC @ =gAnimation+0x44
	mov sb, r6
	ldrb r0, [r5, #0x15]
	lsrs r6, r0, #1
	movs r4, #0xf
	ands r6, r4
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	ands r0, r4
	ldr r3, _080205B0 @ =gUnknown_08028764
	ldrb r2, [r5, #0x14]
	lsls r1, r2, #2
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r5]
	ldrb r4, [r5, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	strh r1, [r5, #2]
	mov r1, sb
	ldrh r1, [r1, #0x10]
	adds r2, r2, r1
	ldr r1, _080205B4 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r4, sb
	ldrh r4, [r4, #0x12]
	ldrh r6, [r5, #2]
	adds r2, r4, r6
	ldr r1, _080205B8 @ =gUnknown_08028741
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r7, #0x12]
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _080205BC
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _080205C2
	.align 2, 0
_080205AC: .4byte gAnimation+0x44
_080205B0: .4byte gUnknown_08028764
_080205B4: .4byte gUnknown_08028751
_080205B8: .4byte gUnknown_08028741
_080205BC:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_080205C2:
	str r0, [r7]
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x16]
	adds r0, #1
	strb r0, [r5, #0x16]
	mov r4, sl
	adds r4, #0x50
	mov r6, r8
	adds r6, #1
	ldrb r3, [r4]
	cmp r8, r3
	bne _080206AC
	ldrh r0, [r5, #8]
	adds r0, #1
	movs r1, #0
	mov sb, r1
	strh r0, [r5, #8]
	mov r7, sl
	adds r7, #0x52
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r7]
	cmp r0, r2
	bls _080206AC
	bl CheckMoveButterfly_Unity
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08020632
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r7]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08020628
	mov r3, sb
	strb r3, [r4]
_08020628:
	mov r4, sb
	strb r4, [r5, #0x17]
	movs r0, #0
	strh r0, [r5, #8]
	b _080206AC
_08020632:
	mov r0, r8
	bl InstructionButterfly_Unity
	b _080206AC
_0802063A:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	beq _080206AC
	ldr r0, _08020664 @ =gUnknown_08028794
	add r0, r8
	ldrb r0, [r0]
	adds r0, #6
	strb r0, [r5, #0x17]
	mov r0, r8
	bl init_move_butterfly_Unity
	movs r0, #6
	strh r0, [r5, #4]
	b _080206AC
	.align 2, 0
_08020664: .4byte gUnknown_08028794
_08020668:
	mov r0, r8
	bl move_butterfly_Unity
	b _0802067E
_08020670:
	mov r1, sl
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0xe
	bhi _08020684
	adds r0, #1
	strh r0, [r1]
_0802067E:
	mov r6, r8
	adds r6, #1
	b _080206AC
_08020684:
	mov r0, r8
	adds r0, #0x83
	bl FindAnimationFromAnimId
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	beq _080206AC
	ldrh r0, [r7, #0x10]
	adds r0, #6
	movs r1, #0
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #0x12]
	subs r0, #2
	strh r0, [r7, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080206AC
	strh r1, [r5, #4]
_080206AC:
	mov r8, r6
	cmp r6, #2
	bhi _080206B4
	b _0802039E
_080206B4:
	ldr r1, [sp]
	cmp r1, #0
	beq _080206D8
	movs r2, #0x4e
	mov r8, r2
	ldr r0, _080206EC @ =gOamObjects
	movs r1, #0x80
	lsls r1, r1, #2
	movs r3, #0x9c
	lsls r3, r3, #2
	adds r0, r0, r3
_080206CA:
	strh r1, [r0]
	adds r0, #8
	movs r4, #1
	add r8, r4
	mov r6, r8
	cmp r6, #0x7f
	bls _080206CA
_080206D8:
	bl sub_8013050
_080206DC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080206EC: .4byte gOamObjects
