	.include "asm/macros.inc"
	.syntax unified


	thumb_func_start sub_8001918
sub_8001918: @ 0x08001918
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r2, _080019A0 @ =gIORegisters
	ldr r0, _080019A4 @ =0x00000C64
	adds r4, r6, r0
	adds r1, r2, #0
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	movs r5, #0
	movs r3, #0
	mov r8, r3
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _080019A8 @ =0x00001090
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x38]
	subs r1, #0xa
	movs r0, #0x11
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	ldrh r1, [r2, #6]
	strh r1, [r4, #8]
	ldr r0, _080019AC @ =0x0000FF73
	ands r0, r1
	strh r0, [r2, #6]
	ldr r0, _080019B0 @ =gUnknown_08022E40
	movs r1, #0x14
	movs r2, #3
	bl nullsub_20
	ldr r0, _080019B4 @ =gUnknown_08022E4C
	movs r1, #0x14
	movs r2, #4
	bl nullsub_20
	ldr r0, _080019B8 @ =gUnknown_08022E58
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	ldr r0, _080019BC @ =gUnknown_08022E64
	movs r1, #0x14
	movs r2, #6
	bl nullsub_20
	mov r0, r8
	strh r0, [r4]
	strh r0, [r4, #2]
	strb r5, [r4, #4]
	strb r5, [r4, #5]
	strb r5, [r4, #6]
	movs r0, #4
	strb r0, [r4, #7]
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r6, #1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080019A0: .4byte gIORegisters
_080019A4: .4byte 0x00000C64
_080019A8: .4byte 0x00001090
_080019AC: .4byte 0x0000FF73
_080019B0: .4byte gUnknown_08022E40
_080019B4: .4byte gUnknown_08022E4C
_080019B8: .4byte gUnknown_08022E58
_080019BC: .4byte gUnknown_08022E64

	thumb_func_start sub_80019C0
sub_80019C0: @ 0x080019C0
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r4, r0, #0
	ldr r1, _080019E8 @ =gUnknown_08022E6B
	mov r0, sp
	movs r2, #0x33
	bl memcpy
	ldr r0, _080019EC @ =0x00000C64
	adds r6, r4, r0
	ldr r0, _080019F0 @ =gJoypad
	movs r1, #0xf0
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080019F4
	ldrb r0, [r4, #0x18]
	adds r0, #1
	strb r0, [r4, #0x18]
	b _080019F6
	.align 2, 0
_080019E8: .4byte gUnknown_08022E6B
_080019EC: .4byte 0x00000C64
_080019F0: .4byte gJoypad
_080019F4:
	strh r1, [r4, #0x18]
_080019F6:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _08001A06
	movs r0, #1
	ldrb r1, [r4, #0x18]
	ands r0, r1
	strb r0, [r4, #0x18]
	b _08001A16
_08001A06:
	movs r0, #0x1f
	ldrb r1, [r4, #0x18]
	ands r0, r1
	strb r0, [r4, #0x18]
	cmp r0, #0x1f
	bne _08001A16
	movs r0, #1
	strb r0, [r4, #0x19]
_08001A16:
	ldrb r4, [r4, #0x18]
	cmp r4, #1
	bne _08001A70
	ldr r0, _08001A34 @ =gJoypad
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08001A38
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _08001A70
	subs r0, #1
	strh r0, [r6, #2]
	b _08001A70
	.align 2, 0
_08001A34: .4byte gJoypad
_08001A38:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001A4C
	ldrh r0, [r6, #2]
	cmp r0, #0xf
	bhi _08001A70
	adds r0, #1
	strh r0, [r6, #2]
	b _08001A70
_08001A4C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08001A5E
	ldrh r0, [r6]
	cmp r0, #0
	beq _08001A70
	subs r0, #1
	b _08001A6E
_08001A5E:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08001A70
	ldrh r0, [r6]
	cmp r0, #0xf
	bhi _08001A70
	adds r0, #1
_08001A6E:
	strh r0, [r6]
_08001A70:
	movs r5, #0
_08001A72:
	ldrh r0, [r6]
	adds r1, r0, r5
	cmp r1, #0x10
	bgt _08001A8A
	lsls r0, r1, #1
	adds r0, r0, r1
	add r0, sp
	adds r1, r5, #2
	movs r2, #1
	bl nullsub_20
	b _08001A9A
_08001A8A:
	lsls r0, r1, #1
	adds r0, r0, r1
	subs r0, #0x30
	add r0, sp
	adds r1, r5, #2
	movs r2, #1
	bl nullsub_20
_08001A9A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001A72
	ldrh r1, [r6]
	cmp r1, #0x10
	bne _08001ABC
	ldr r0, _08001AB8 @ =gUnknown_08022EA0
	movs r1, #1
	movs r2, #1
	bl nullsub_20
	b _08001AC6
	.align 2, 0
_08001AB8: .4byte gUnknown_08022EA0
_08001ABC:
	ldr r0, _08001AF0 @ =gUnknown_08022DDC
	movs r1, #1
	movs r2, #1
	bl nullsub_20
_08001AC6:
	movs r5, #0
_08001AC8:
	ldrh r1, [r6, #2]
	adds r0, r1, r5
	cmp r0, #0xf
	bgt _08001AF4
	adds r4, r5, #2
	ldr r0, _08001AF0 @ =gUnknown_08022DDC
	movs r1, #0
	adds r2, r4, #0
	bl nullsub_20
	ldrh r0, [r6, #2]
	adds r1, r0, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	add r0, sp
	movs r1, #1
	adds r2, r4, #0
	bl nullsub_20
	b _08001B14
	.align 2, 0
_08001AF0: .4byte gUnknown_08022DDC
_08001AF4:
	adds r4, r5, #2
	ldr r0, _08001B28 @ =gUnknown_08022EA0
	movs r1, #0
	adds r2, r4, #0
	bl nullsub_20
	ldrh r0, [r6, #2]
	adds r1, r0, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	subs r0, #0x30
	add r0, sp
	movs r1, #1
	adds r2, r4, #0
	bl nullsub_20
_08001B14:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001AC8
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001B28: .4byte gUnknown_08022EA0

	thumb_func_start sub_8001B2C
sub_8001B2C: @ 0x08001B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08001BB0 @ =0x00000C64
	adds r4, r0, r1
	ldrb r7, [r4, #7]
	cmp r7, #4
	bne _08001B42
	bl sub_80019C0
_08001B42:
	movs r6, #0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _08001B4C
	strh r6, [r4, #2]
_08001B4C:
	movs r5, #0
	ldr r0, _08001BB4 @ =gOamObjects
	mov r8, r0
_08001B52:
	movs r3, #0
	lsls r1, r5, #3
	mov sb, r1
	adds r7, r5, #1
	mov ip, r7
_08001B5C:
	lsls r2, r6, #3
	add r2, r8
	ldrb r1, [r4, #5]
	lsls r0, r1, #0xd
	ldr r7, _08001BB8 @ =0x00004010
	adds r0, r0, r7
	add r0, sb
	strh r0, [r2]
	lsls r0, r3, #4
	adds r0, #0x10
	strh r0, [r2, #2]
	ldrb r0, [r4, #4]
	lsls r1, r0, #0xc
	lsls r0, r3, #1
	ldrh r7, [r4]
	adds r0, r7, r0
	adds r1, r1, r0
	ldrh r7, [r4, #2]
	adds r0, r7, r5
	lsls r0, r0, #5
	adds r1, r1, r0
	strh r1, [r2, #4]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08001B5C
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001B52
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BB0: .4byte 0x00000C64
_08001BB4: .4byte gOamObjects
_08001BB8: .4byte 0x00004010

	thumb_func_start sub_8001BBC
sub_8001BBC: @ 0x08001BBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08001C1C @ =0x00000C64
	adds r4, r0, r1
	ldrb r7, [r4, #7]
	cmp r7, #4
	bne _08001BD0
	bl sub_80019C0
_08001BD0:
	movs r5, #0
	ldr r0, _08001C20 @ =gBG3MapBuffer
	mov ip, r0
_08001BD6:
	movs r3, #0
	adds r0, r5, #2
	adds r1, r5, #1
	mov r8, r1
	lsls r6, r0, #5
_08001BE0:
	adds r2, r3, r6
	adds r2, #0x23
	lsls r2, r2, #1
	add r2, ip
	ldrh r7, [r4, #2]
	adds r0, r7, r5
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrh r1, [r4]
	adds r0, r1, r0
	ldrb r7, [r4, #4]
	lsls r1, r7, #0xc
	adds r0, r0, r1
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08001BE0
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001BD6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001C1C: .4byte 0x00000C64
_08001C20: .4byte gBG3MapBuffer

	thumb_func_start sub_8001C24
sub_8001C24: @ 0x08001C24
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _08001C54 @ =gIORegisters
	ldr r0, _08001C58 @ =0x00000C64
	adds r5, r6, r0
	movs r4, #0
_08001C30:
	adds r2, r4, #3
	ldr r0, _08001C5C @ =gUnknown_08022EA4
	movs r1, #0x12
	bl nullsub_20
	adds r4, #1
	cmp r4, #3
	ble _08001C30
	ldr r0, _08001C60 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08001C64
	movs r0, #4
	strb r0, [r5, #7]
	b _08001E52
	.align 2, 0
_08001C54: .4byte gIORegisters
_08001C58: .4byte 0x00000C64
_08001C5C: .4byte gUnknown_08022EA4
_08001C60: .4byte gJoypad
_08001C64:
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08001C82
	ldrb r0, [r5, #7]
	subs r0, #1
	strb r0, [r5, #7]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08001C9A
	movs r0, #3
	strb r0, [r5, #7]
	b _08001C9A
_08001C82:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001C9A
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08001C9A
	strb r2, [r5, #7]
_08001C9A:
	ldr r0, _08001CBC @ =gUnknown_08022EA8
	movs r2, #7
	ldrsb r2, [r5, r2]
	adds r2, #3
	movs r1, #0x12
	bl nullsub_20
	movs r3, #7
	ldrsb r3, [r5, r3]
	cmp r3, #1
	beq _08001D14
	cmp r3, #1
	bgt _08001CC0
	cmp r3, #0
	beq _08001CCC
	b _08001E52
	.align 2, 0
_08001CBC: .4byte gUnknown_08022EA8
_08001CC0:
	cmp r3, #2
	beq _08001D90
	cmp r3, #3
	bne _08001CCA
	b _08001DEC
_08001CCA:
	b _08001E52
_08001CCC:
	ldr r1, _08001CF0 @ =gJoypad
	movs r0, #0x30
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08001CDA
	b _08001E52
_08001CDA:
	ldrb r1, [r6, #1]
	cmp r1, #2
	bne _08001CF8
	movs r0, #1
	strb r0, [r6, #1]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #0x11
	strh r0, [r1]
	ldr r0, _08001CF4 @ =gUnknown_08022E40
	b _08001D06
	.align 2, 0
_08001CF0: .4byte gJoypad
_08001CF4: .4byte gUnknown_08022E40
_08001CF8:
	movs r0, #2
	strb r0, [r6, #1]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08001D10 @ =gUnknown_08022EAC
_08001D06:
	movs r1, #0x14
	movs r2, #3
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001D10: .4byte gUnknown_08022EAC
_08001D14:
	ldr r1, _08001D40 @ =gJoypad
	movs r0, #0x30
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08001D22
	b _08001E52
_08001D22:
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _08001D4C
	ldr r0, _08001D44 @ =0x0000FF7F
	ldrh r2, [r7, #6]
	ands r0, r2
	movs r1, #0
	strh r0, [r7, #6]
	strb r1, [r5, #5]
	ldr r0, _08001D48 @ =gUnknown_08022EB8
	movs r1, #0x14
	movs r2, #4
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001D40: .4byte gJoypad
_08001D44: .4byte 0x0000FF7F
_08001D48: .4byte gUnknown_08022EB8
_08001D4C:
	movs r0, #0x80
	movs r2, #0
	ldrh r1, [r7, #6]
	orrs r0, r1
	ldr r1, _08001D80 @ =0x0000FFF3
	ands r0, r1
	strh r0, [r7, #6]
	strb r2, [r5, #6]
	strb r3, [r5, #5]
	ldr r0, _08001D84 @ =gUnknown_08022EC0
	movs r1, #0x14
	movs r2, #4
	bl nullsub_20
	ldr r0, _08001D88 @ =gUnknown_08022EC8
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	ldr r0, _08001D8C @ =gUnknown_08022E64
	movs r1, #0x14
	movs r2, #6
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001D80: .4byte 0x0000FFF3
_08001D84: .4byte gUnknown_08022EC0
_08001D88: .4byte gUnknown_08022EC8
_08001D8C: .4byte gUnknown_08022E64
_08001D90:
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _08001DDC
	ldr r0, _08001DA8 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08001DAC
	ldrb r0, [r5, #4]
	subs r0, #1
	b _08001DB8
	.align 2, 0
_08001DA8: .4byte gJoypad
_08001DAC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08001DBA
	ldrb r0, [r5, #4]
	adds r0, #1
_08001DB8:
	strb r0, [r5, #4]
_08001DBA:
	movs r0, #0xf
	ldrb r2, [r5, #4]
	ands r0, r2
	strb r0, [r5, #4]
	ldr r0, _08001DD8 @ =gUnknown_08022ED0
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	ldrb r0, [r5, #4]
	movs r1, #0x14
	movs r2, #5
	bl sub_8006470
	b _08001E52
	.align 2, 0
_08001DD8: .4byte gUnknown_08022ED0
_08001DDC:
	ldr r0, _08001DE8 @ =gUnknown_08022EC8
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001DE8: .4byte gUnknown_08022EC8
_08001DEC:
	ldrb r6, [r6, #1]
	cmp r6, #2
	bne _08001E52
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _08001E52
	ldr r1, _08001E10 @ =gJoypad
	movs r0, #0x20
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08001E14
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _08001E14
	subs r0, #1
	b _08001E26
	.align 2, 0
_08001E10: .4byte gJoypad
_08001E14:
	movs r0, #0x10
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08001E28
	ldrb r0, [r5, #6]
	cmp r0, #1
	bhi _08001E28
	adds r0, #1
_08001E26:
	strb r0, [r5, #6]
_08001E28:
	ldr r0, _08001E58 @ =0x0000FFF3
	ldrh r1, [r7, #6]
	ands r0, r1
	ldrb r2, [r5, #6]
	lsls r1, r2, #2
	orrs r0, r1
	strh r0, [r7, #6]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08001E5C @ =gUnknown_08022ED8
	movs r1, #0x14
	movs r2, #6
	bl nullsub_20
	ldrb r0, [r5, #6]
	movs r1, #0x14
	movs r2, #6
	bl sub_8006470
_08001E52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001E58: .4byte 0x0000FFF3
_08001E5C: .4byte gUnknown_08022ED8

	thumb_func_start sub_8001E60
sub_8001E60: @ 0x08001E60
	push {r4, r5, lr}
	ldr r1, _08001EA0 @ =0x00000C64
	adds r0, r0, r1
	ldr r3, _08001EA4 @ =gIORegisters
	ldr r2, _08001EA8 @ =gMain
	movs r1, #3
	strb r1, [r2, #9]
	movs r1, #4
	strb r1, [r0, #7]
	ldrh r0, [r0, #8]
	strh r0, [r3, #6]
	movs r0, #0
	ldr r5, _08001EAC @ =gOamObjects
	movs r4, #0x96
	lsls r4, r4, #1
	movs r2, #0
_08001E80:
	adds r3, r0, #1
	movs r1, #7
	adds r0, r2, r5
_08001E86:
	strh r4, [r0, #2]
	adds r0, #8
	adds r2, #8
	subs r1, #1
	cmp r1, #0
	bge _08001E86
	adds r0, r3, #0
	cmp r0, #0xf
	ble _08001E80
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001EA0: .4byte 0x00000C64
_08001EA4: .4byte gIORegisters
_08001EA8: .4byte gMain
_08001EAC: .4byte gOamObjects

	thumb_func_start sub_8001EB0
sub_8001EB0: @ 0x08001EB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08001EE8 @ =0x00000C64
	adds r5, r4, r0
	ldr r6, _08001EEC @ =gJoypad
	movs r0, #8
	ldrh r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	beq _08001EC8
	movs r0, #3
	strb r0, [r4, #1]
_08001EC8:
	ldr r0, _08001EF0 @ =gUnknown_0814D374
	ldrb r2, [r4, #1]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r0, [r5, #7]
	cmp r0, #4
	beq _08001EF4
	adds r0, r4, #0
	bl sub_8001C24
	b _08001F02
	.align 2, 0
_08001EE8: .4byte 0x00000C64
_08001EEC: .4byte gJoypad
_08001EF0: .4byte gUnknown_0814D374
_08001EF4:
	movs r0, #1
	ldrh r6, [r6, #2]
	ands r0, r6
	cmp r0, #0
	beq _08001F02
	movs r0, #0
	strb r0, [r5, #7]
_08001F02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8001F08
sub_8001F08: @ 0x08001F08
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08001F28 @ =0x00000C64
	adds r3, r1, r0
	ldr r0, _08001F2C @ =gJoypad
	movs r2, #0xf0
	ldrh r4, [r0]
	ands r2, r4
	adds r4, r0, #0
	cmp r2, #0
	beq _08001F30
	ldrb r0, [r1, #0x18]
	adds r0, #1
	strb r0, [r1, #0x18]
	b _08001F32
	.align 2, 0
_08001F28: .4byte 0x00000C64
_08001F2C: .4byte gJoypad
_08001F30:
	strh r2, [r1, #0x18]
_08001F32:
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	beq _08001F42
	movs r0, #1
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	b _08001F52
_08001F42:
	movs r0, #0x1f
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	cmp r0, #0x1f
	bne _08001F52
	movs r0, #1
	strb r0, [r1, #0x19]
_08001F52:
	ldrb r1, [r1, #0x18]
	cmp r1, #1
	bne _08001F92
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08001F68
	ldrh r0, [r3]
	subs r0, #1
	b _08001F90
_08001F68:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08001F76
	ldrh r0, [r3]
	adds r0, #1
	b _08001F90
_08001F76:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08001F84
	ldrh r0, [r3]
	subs r0, #0x10
	b _08001F90
_08001F84:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001F92
	ldrh r0, [r3]
	adds r0, #0x10
_08001F90:
	strh r0, [r3]
_08001F92:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8001F98
sub_8001F98: @ 0x08001F98
	ldr r1, _08001FAC @ =0x00000C64
	adds r2, r0, r1
	movs r1, #0
	strb r1, [r2, #2]
	strh r1, [r2]
	ldrb r1, [r0, #1]
	adds r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08001FAC: .4byte 0x00000C64

	thumb_func_start sub_8001FB0
sub_8001FB0: @ 0x08001FB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08002004 @ =0x00000C64
	adds r1, r1, r0
	mov sl, r1
	bl sub_8001F08
	mov r2, sl
	movs r0, #2
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	ldr r3, _08002008 @ =gUnknown_0814D804
	adds r0, r0, r3
	str r0, [sp]
	ldrh r2, [r2]
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r4, #0xe
	ldrsh r0, [r0, r4]
	cmp r1, r0
	blt _0800200C
	mov r5, sl
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	ldr r1, [sp]
	ldrh r1, [r1, #0xe]
	subs r0, r2, r1
	strh r0, [r5]
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #2
	blt _08002036
	movs r0, #0
	strb r0, [r5, #2]
	b _08002036
	.align 2, 0
_08002004: .4byte 0x00000C64
_08002008: .4byte gUnknown_0814D804
_0800200C:
	cmp r1, #0
	bge _08002036
	mov r2, sl
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002022
	movs r0, #1
	strb r0, [r2, #2]
_08002022:
	mov r4, sl
	movs r0, #2
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r3
	str r0, [sp]
	ldrh r5, [r4]
	ldrh r1, [r0, #0xe]
	adds r0, r5, r1
	strh r0, [r4]
_08002036:
	ldr r2, [sp]
	ldrh r0, [r2, #0xc]
	mov r3, sl
	movs r4, #0
	ldrsh r1, [r3, r4]
	bl sub_80065E8
	adds r3, r0, #0
	ldr r1, _0800213C @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08002068
	ldr r5, [sp]
	ldrh r0, [r5, #0xc]
	mov r2, sl
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r2, #0
	cmp r3, #0
	bne _08002064
	movs r2, #1
_08002064:
	bl sub_80065AC
_08002068:
	movs r0, #5
	movs r1, #0x19
	movs r2, #2
	movs r3, #8
	bl sub_8001610
	ldr r5, [sp]
	ldr r0, [r5]
	movs r1, #5
	movs r2, #6
	bl nullsub_20
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r5, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #5
	movs r2, #7
	bl nullsub_20
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	movs r1, #9
	movs r2, #6
	bl sub_8006470
	mov r5, sl
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _080020B0
	adds r0, #0x1f
_080020B0:
	asrs r0, r0, #5
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #0
	mov sb, r2
_080020BA:
	movs r3, #0
	mov r8, r3
	mov r4, sb
	lsls r4, r4, #4
	str r4, [sp, #0x10]
	mov r5, sb
	adds r5, #1
	str r5, [sp, #8]
_080020CA:
	movs r6, #0
	mov r0, r8
	lsls r7, r0, #2
	adds r0, #1
	str r0, [sp, #0xc]
_080020D4:
	movs r5, #0
	ldr r1, [sp]
	ldrh r0, [r1, #0xc]
	ldr r2, [sp, #0x10]
	adds r4, r2, r7
	adds r4, r4, r6
	ldr r3, [sp, #4]
	adds r1, r4, r3
	bl sub_80065E8
	adds r3, r0, #0
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [sp, #4]
	subs r0, r0, r1
	cmp r0, r4
	bne _08002102
	subs r5, #1
	mov r2, sb
	cmp r2, #0
	beq _08002102
	movs r5, #1
_08002102:
	mov r4, r8
	adds r1, r7, r4
	adds r1, r1, r6
	adds r1, #5
	adds r2, r5, #3
	add r2, sb
	adds r0, r3, #0
	bl sub_8006470
	adds r6, #1
	cmp r6, #3
	ble _080020D4
	ldr r5, [sp, #0xc]
	mov r8, r5
	cmp r5, #3
	ble _080020CA
	ldr r0, [sp, #8]
	mov sb, r0
	cmp r0, #1
	ble _080020BA
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800213C: .4byte gJoypad

	thumb_func_start sub_8002140
sub_8002140: @ 0x08002140
	ldr r1, _08002148 @ =gMain
	movs r0, #3
	strb r0, [r1, #9]
	bx lr
	.align 2, 0
_08002148: .4byte gMain

	thumb_func_start sub_800214C
sub_800214C: @ 0x0800214C
	push {lr}
	adds r2, r0, #0
	ldr r1, _08002174 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08002160
	movs r0, #2
	strb r0, [r2, #1]
_08002160:
	ldr r0, _08002178 @ =gUnknown_0814D824
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08002174: .4byte gJoypad
_08002178: .4byte gUnknown_0814D824

	thumb_func_start sub_800217C
sub_800217C: @ 0x0800217C
	ldr r1, _08002190 @ =0x00000C64
	adds r2, r0, r1
	ldr r1, _08002194 @ =gMain
	adds r1, #0xc1
	ldrb r1, [r1]
	strb r1, [r2]
	ldrb r1, [r0, #1]
	adds r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08002190: .4byte 0x00000C64
_08002194: .4byte gMain

	thumb_func_start sub_8002198
sub_8002198: @ 0x08002198
	push {r4, r5, lr}
	ldr r1, _080021C4 @ =0x00000C64
	adds r4, r0, r1
	ldr r5, _080021C8 @ =gMain
	ldr r1, _080021CC @ =gJoypad
	ldrh r2, [r1, #2]
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080021D0
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _080021E8
	movs r0, #0x15
	strb r0, [r4]
	b _080021E8
	.align 2, 0
_080021C4: .4byte 0x00000C64
_080021C8: .4byte gMain
_080021CC: .4byte gJoypad
_080021D0:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080021E8
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x15
	ble _080021E8
	strb r3, [r4]
_080021E8:
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08002210
	bl ResetGameState
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0xc1
	strb r0, [r1]
	ldr r0, _0800220C @ =gUnknown_080266D0
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [r5, #8]
	b _0800222E
	.align 2, 0
_0800220C: .4byte gUnknown_080266D0
_08002210:
	ldr r0, _08002234 @ =gUnknown_08023B80
	movs r1, #5
	movs r2, #3
	bl nullsub_20
	ldr r1, _08002238 @ =gUnknown_0814D830
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #5
	movs r2, #5
	bl nullsub_20
_0800222E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002234: .4byte gUnknown_08023B80
_08002238: .4byte gUnknown_0814D830

	thumb_func_start sub_800223C
sub_800223C: @ 0x0800223C
	ldr r1, _08002244 @ =gMain
	movs r0, #3
	strb r0, [r1, #9]
	bx lr
	.align 2, 0
_08002244: .4byte gMain

	thumb_func_start sub_8002248
sub_8002248: @ 0x08002248
	push {lr}
	adds r2, r0, #0
	ldr r1, _08002270 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800225C
	movs r0, #2
	strb r0, [r2, #1]
_0800225C:
	ldr r0, _08002274 @ =gUnknown_0814D888
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08002270: .4byte gJoypad
_08002274: .4byte gUnknown_0814D888

	thumb_func_start sub_8002278
sub_8002278: @ 0x08002278
	lsls r0, r0, #0x10
	ldr r1, _08002288 @ =gUnknown_08023B98
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x28
	bx lr
	.align 2, 0
_08002288: .4byte gUnknown_08023B98

	thumb_func_start sub_800228C
sub_800228C: @ 0x0800228C
	lsls r0, r0, #0x10
	ldr r1, _0800229C @ =gUnknown_08023B98
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800229C: .4byte gUnknown_08023B98

	thumb_func_start sub_80022A0
sub_80022A0: @ 0x080022A0
	push {r4, r5, lr}
	ldr r2, _080022C8 @ =gBG1MapBuffer
	movs r1, #0
	ldr r4, _080022CC @ =0x000003FF
	ldr r5, _080022D0 @ =gMain
	ldr r3, _080022D4 @ =gUnknown_08023EF8
_080022AC:
	adds r0, r1, r3
	ldrb r0, [r0]
	strh r0, [r2]
	adds r1, #1
	adds r2, #2
	cmp r1, r4
	bls _080022AC
	movs r0, #2
	ldrb r1, [r5, #0x1a]
	orrs r0, r1
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080022C8: .4byte gBG1MapBuffer
_080022CC: .4byte 0x000003FF
_080022D0: .4byte gMain
_080022D4: .4byte gUnknown_08023EF8
