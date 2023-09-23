	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start UpdateHardwareBlend
UpdateHardwareBlend: @ 0x08000B0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08000B5C @ =gMain
	mov ip, r0
	ldr r4, _08000B60 @ =gIORegisters
	ldr r1, _08000B64 @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #7
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08000B44
	adds r2, r4, #0
	adds r2, #0x4a
	ldr r0, _08000B68 @ =0x0000DFFF
	ldrh r3, [r2]
	ands r0, r3
	strh r0, [r2]
	strh r1, [r4, #0x38]
	strh r1, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_08000B44:
	mov r0, ip
	adds r0, #0x8a
	ldrh r1, [r0]
	mov r8, r0
	cmp r1, #4
	bls _08000B52
	b _08000DDA
_08000B52:
	lsls r0, r1, #2
	ldr r1, _08000B6C @ =_08000B70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08000B5C: .4byte gMain
_08000B60: .4byte gIORegisters
_08000B64: .4byte gScriptContext
_08000B68: .4byte 0x0000DFFF
_08000B6C: .4byte _08000B70
_08000B70: @ jump table
	.4byte _08000DDA @ case 0
	.4byte _08000B84 @ case 1
	.4byte _08000CA0 @ case 2
	.4byte _08000D04 @ case 3
	.4byte _08000D74 @ case 4
_08000B84:
	mov r1, ip
	adds r1, #0x88
	movs r0, #0xc0
	adds r5, r4, #0
	adds r5, #0x48
	movs r7, #0
	movs r6, #0
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r5]
	mov r3, ip
	adds r3, #0x8c
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _08000BC2
	strh r6, [r3]
	mov r0, ip
	adds r0, #0x8f
	ldrh r1, [r2]
	ldrb r0, [r0]
	subs r0, r1, r0
	strh r0, [r2]
_08000BC2:
	movs r0, #0x1f
	ldrh r3, [r2]
	ands r0, r3
	strh r0, [r2]
	cmp r0, #0
	beq _08000BDA
	mov r0, ip
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08000BDA
	b _08000DDA
_08000BDA:
	strh r6, [r2]
	ldr r0, _08000C7C @ =0x00001D42
	strh r0, [r5]
	adds r7, r4, #0
	adds r7, #0x4c
	ldr r0, _08000C80 @ =0x0000071F
	strh r0, [r7]
	mov r4, r8
	strh r6, [r4]
	ldr r4, _08000C84 @ =gUnknown_03000844
	ldrb r0, [r4, #0xe]
	cmp r0, #0xb
	beq _08000BFA
	cmp r0, #0x21
	beq _08000BFA
	b _08000DDA
_08000BFA:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08000C08
	b _08000DDA
_08000C08:
	bl sub_8016FB4
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	movs r1, #0x88
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldr r2, _08000C88 @ =gUnknown_0826F888
	ldr r0, [r2, #4]
	ldr r1, _08000C8C @ =gUnknown_08252498
	adds r0, r0, r1
	ldr r2, _08000C90 @ =0x050003A0
	ldr r1, _08000C94 @ =0x040000D4
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _08000C98 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0x82
	ldrh r0, [r7]
	strh r0, [r1]
	subs r1, #2
	ldrh r0, [r5]
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r3, [r0]
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r3, r0
	blo _08000C4E
	b _08000DDA
_08000C4E:
	movs r7, #0xe0
	lsls r7, r7, #0x13
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	ldr r6, _08000C9C @ =gOamObjects
_08000C5A:
	lsls r1, r3, #3
	adds r2, r1, r7
	ldrh r0, [r2]
	orrs r0, r5
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r1, [r4]
	cmp r3, r1
	blo _08000C5A
	b _08000DDA
	.align 2, 0
_08000C7C: .4byte 0x00001D42
_08000C80: .4byte 0x0000071F
_08000C84: .4byte gUnknown_03000844
_08000C88: .4byte gUnknown_0826F888
_08000C8C: .4byte gUnknown_08252498
_08000C90: .4byte 0x050003A0
_08000C94: .4byte 0x040000D4
_08000C98: .4byte 0x80000010
_08000C9C: .4byte gOamObjects
_08000CA0:
	mov r2, ip
	adds r2, #0x88
	movs r0, #0xc0
	adds r1, r4, #0
	adds r1, #0x48
	movs r6, #0
	ldrh r2, [r2]
	orrs r0, r2
	strh r0, [r1]
	mov r3, ip
	adds r3, #0x8c
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	ldr r1, _08000D00 @ =0x0000FFFF
	adds r5, r1, #0
	mov r1, ip
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _08000CE0
	strh r6, [r3]
	mov r0, ip
	adds r0, #0x8f
	ldrh r4, [r2]
	ldrb r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
_08000CE0:
	movs r0, #0x1f
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	cmp r0, #0x10
	beq _08000CF6
	mov r0, ip
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08000DDA
_08000CF6:
	movs r0, #0x10
	strh r0, [r2]
	mov r4, r8
	strh r6, [r4]
	b _08000DD4
	.align 2, 0
_08000D00: .4byte 0x0000FFFF
_08000D04:
	mov r1, ip
	adds r1, #0x88
	movs r0, #0xa0
	adds r6, r4, #0
	adds r6, #0x48
	movs r7, #0
	movs r5, #0
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r6]
	mov r3, ip
	adds r3, #0x8c
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _08000D42
	strh r5, [r3]
	mov r0, ip
	adds r0, #0x8f
	ldrh r1, [r2]
	ldrb r0, [r0]
	subs r0, r1, r0
	strh r0, [r2]
_08000D42:
	movs r0, #0x1f
	ldrh r3, [r2]
	ands r0, r3
	strh r0, [r2]
	cmp r0, #0
	beq _08000D58
	mov r0, ip
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08000DDA
_08000D58:
	strh r5, [r2]
	ldr r0, _08000D6C @ =0x00001D42
	strh r0, [r6]
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _08000D70 @ =0x0000071F
	strh r0, [r1]
	mov r4, r8
	strh r5, [r4]
	b _08000DDA
	.align 2, 0
_08000D6C: .4byte 0x00001D42
_08000D70: .4byte 0x0000071F
_08000D74:
	mov r2, ip
	adds r2, #0x88
	movs r0, #0xa0
	adds r1, r4, #0
	adds r1, #0x48
	movs r6, #0
	ldrh r2, [r2]
	orrs r0, r2
	strh r0, [r1]
	mov r3, ip
	adds r3, #0x8c
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	ldr r1, _08000E24 @ =0x0000FFFF
	adds r5, r1, #0
	mov r1, ip
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _08000DB4
	strh r6, [r3]
	mov r0, ip
	adds r0, #0x8f
	ldrh r4, [r2]
	ldrb r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
_08000DB4:
	adds r1, r2, #0
	movs r0, #0x1f
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	cmp r0, #0x10
	beq _08000DCC
	mov r0, ip
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08000DDA
_08000DCC:
	movs r0, #0x10
	strh r0, [r2]
	mov r0, r8
	strh r6, [r0]
_08000DD4:
	ldrh r0, [r3]
	orrs r0, r5
	strh r0, [r3]
_08000DDA:
	ldr r0, _08000E28 @ =gMain
	adds r1, r0, #0
	adds r1, #0x9e
	ldrb r1, [r1]
	cmp r1, #1
	bne _08000E54
	adds r1, r0, #0
	adds r1, #0x8a
	ldrh r2, [r1]
	cmp r2, #0
	bne _08000E54
	adds r1, #2
	ldr r0, _08000E24 @ =0x0000FFFF
	ldrh r1, [r1]
	cmp r1, r0
	beq _08000E38
	ldr r2, _08000E2C @ =gIORegisters
	adds r1, r2, #0
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r4, [r1]
	orrs r0, r4
	strh r0, [r1]
	movs r0, #0xef
	strh r0, [r2, #0x38]
	movs r0, #0x64
	strh r0, [r2, #0x3c]
	subs r1, #0xa
	ldr r0, _08000E30 @ =0x00001F1F
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08000E34 @ =0x00003F3F
	strh r0, [r1]
	b _08000E54
	.align 2, 0
_08000E24: .4byte 0x0000FFFF
_08000E28: .4byte gMain
_08000E2C: .4byte gIORegisters
_08000E30: .4byte 0x00001F1F
_08000E34: .4byte 0x00003F3F
_08000E38:
	ldr r1, _08000E60 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x4a
	ldr r0, _08000E64 @ =0x0000DFFF
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	strh r2, [r1, #0x38]
	strh r2, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x40
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
_08000E54:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000E60: .4byte gIORegisters
_08000E64: .4byte 0x0000DFFF

	thumb_func_start UpdateSpecialEffects
UpdateSpecialEffects: @ 0x08000E68
	push {r4, r5, r6, lr}
	ldr r5, _08000E9C @ =gMain
	ldr r6, _08000EA0 @ =gIORegisters
	adds r3, r5, #0
	adds r3, #0x90
	ldrh r0, [r3]
	cmp r0, #0xc
	bne _08000E7A
	b _080011BE
_08000E7A:
	cmp r0, #0xc
	bgt _08000EF6
	cmp r0, #5
	bne _08000E84
	b _0800109C
_08000E84:
	cmp r0, #5
	bgt _08000EB2
	cmp r0, #2
	beq _08000F82
	cmp r0, #2
	bgt _08000EA4
	cmp r0, #0
	bne _08000E96
	b _080014E0
_08000E96:
	cmp r0, #1
	beq _08000F46
	b _080014E0
	.align 2, 0
_08000E9C: .4byte gMain
_08000EA0: .4byte gIORegisters
_08000EA4:
	cmp r0, #3
	bne _08000EAA
	b _08000FB6
_08000EAA:
	cmp r0, #4
	bne _08000EB0
	b _0800102C
_08000EB0:
	b _080014E0
_08000EB2:
	cmp r0, #8
	bne _08000EB8
	b _0800102C
_08000EB8:
	cmp r0, #8
	bgt _08000EC8
	cmp r0, #6
	bne _08000EC2
	b _08001104
_08000EC2:
	cmp r0, #7
	beq _08000FB6
	b _080014E0
_08000EC8:
	cmp r0, #0xa
	bne _08000ECE
	b _080011BE
_08000ECE:
	adds r2, r5, #0
	adds r2, #0x96
	ldrb r0, [r2]
	adds r6, r5, #0
	adds r6, #0x97
	cmp r0, #0
	bne _08000EDE
	b _080011A8
_08000EDE:
	adds r1, r5, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2]
	cmp r0, r2
	bhs _08000EF4
	b _080011A8
_08000EF4:
	b _0800117C
_08000EF6:
	cmp r0, #0x12
	bne _08000EFC
	b _08001372
_08000EFC:
	cmp r0, #0x12
	bgt _08000F26
	cmp r0, #0xf
	bne _08000F06
	b _08001232
_08000F06:
	cmp r0, #0xf
	bgt _08000F18
	cmp r0, #0xd
	bne _08000F10
	b _08001232
_08000F10:
	cmp r0, #0xe
	bne _08000F16
	b _080012B4
_08000F16:
	b _080014E0
_08000F18:
	cmp r0, #0x10
	bne _08000F1E
	b _080012B4
_08000F1E:
	cmp r0, #0x11
	bne _08000F24
	b _08001324
_08000F24:
	b _080014E0
_08000F26:
	cmp r0, #0x15
	bne _08000F2C
	b _08001444
_08000F2C:
	cmp r0, #0x15
	bgt _08000F3E
	cmp r0, #0x13
	bne _08000F36
	b _080013BE
_08000F36:
	cmp r0, #0x14
	bne _08000F3C
	b _0800140C
_08000F3C:
	b _080014E0
_08000F3E:
	cmp r0, #0x16
	bne _08000F44
	b _08001498
_08000F44:
	b _080014E0
_08000F46:
	ldr r2, [r6, #0x44]
	movs r0, #0xff
	ands r0, r2
	adds r1, r5, #0
	adds r1, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08000F78
	movs r2, #0
	str r2, [r6, #0x44]
	adds r0, r5, #0
	adds r0, #0x94
	strh r2, [r0]
	ldr r1, _08000F74 @ =0x0000FFBF
	adds r0, r1, #0
	ldrh r4, [r6, #6]
	ands r0, r4
	strh r0, [r6, #6]
	ldrh r0, [r6, #4]
	ands r1, r0
	strh r1, [r6, #4]
	strh r2, [r3]
	b _080014E0
	.align 2, 0
_08000F74: .4byte 0x0000FFBF
_08000F78:
	lsls r0, r1, #8
	adds r0, r0, r1
	subs r0, r2, r0
	str r0, [r6, #0x44]
	b _080014E0
_08000F82:
	ldr r2, [r6, #0x44]
	movs r0, #0xff
	ands r0, r2
	adds r1, r5, #0
	adds r1, #0x97
	ldrb r1, [r1]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _08000FAC
	ldr r0, _08000FA8 @ =0x0000FFFF
	orrs r2, r0
	str r2, [r6, #0x44]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r3]
	adds r1, r5, #0
	adds r1, #0x94
	b _0800136C
	.align 2, 0
_08000FA8: .4byte 0x0000FFFF
_08000FAC:
	lsls r0, r1, #8
	adds r0, r0, r1
	adds r0, r2, r0
	str r0, [r6, #0x44]
	b _080014E0
_08000FB6:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08000FD4
	b _08001480
_08000FD4:
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_80057F4
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #3
	bne _08001008
	ldr r0, _08001028 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08001008
	ldrb r0, [r6]
	movs r1, #0
	bl sub_80058E8
_08001008:
	ldrh r1, [r5, #0x34]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _0800101A
	cmp r1, #0x81
	beq _0800101A
	b _08001480
_0800101A:
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_800598C
	b _08001480
	.align 2, 0
_08001028: .4byte gUnknown_03000800
_0800102C:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0800104A
	b _080014D4
_0800104A:
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_80057F4
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #4
	bne _0800107E
	ldr r0, _08001098 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _0800107E
	ldrb r0, [r6]
	movs r1, #0
	bl sub_80058E8
_0800107E:
	ldrh r0, [r5, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _0800108C
	b _080014D4
_0800108C:
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_800598C
	b _080014D4
	.align 2, 0
_08001098: .4byte gUnknown_03000800
_0800109C:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080010BA
	b _080014D4
_080010BA:
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_80057F4
	ldr r0, _08001100 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _080010E4
	ldrb r0, [r6]
	movs r1, #1
	bl sub_80058E8
_080010E4:
	ldrh r0, [r5, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080010F2
	b _080014D4
_080010F2:
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_800598C
	b _080014D4
	.align 2, 0
_08001100: .4byte gUnknown_03000800
_08001104:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	blo _08001160
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_80057F4
	ldr r0, _08001174 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _0800114A
	ldrb r0, [r6]
	movs r1, #1
	bl sub_80058E8
_0800114A:
	ldrh r0, [r5, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08001160
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_800598C
_08001160:
	ldrb r6, [r6]
	cmp r6, #0x20
	beq _08001168
	b _080014E0
_08001168:
	adds r1, r5, #0
	adds r1, #0x90
	ldr r0, _08001178 @ =0x0000FFFE
	strh r0, [r1]
	b _080014E0
	.align 2, 0
_08001174: .4byte gUnknown_03000800
_08001178: .4byte 0x0000FFFE
_0800117C:
	movs r0, #0
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x97
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x90
	adds r6, r0, #0
	ldrh r1, [r1]
	cmp r1, #0xb
	bne _080011A0
	ldrb r0, [r6]
	movs r1, #2
	bl nullsub_2
	b _080011A8
_080011A0:
	ldrb r0, [r6]
	movs r1, #0
	bl nullsub_2
_080011A8:
	ldrb r4, [r6]
	cmp r4, #0x20
	beq _080011B0
	b _080014E0
_080011B0:
	adds r0, r5, #0
	adds r0, #0x90
	adds r4, r0, #0
	ldrh r0, [r4]
	cmp r0, #0xb
	beq _0800121A
	b _08001224
_080011BE:
	adds r2, r5, #0
	adds r2, #0x96
	ldrb r0, [r2]
	adds r6, r5, #0
	adds r6, #0x97
	cmp r0, #0
	beq _08001206
	adds r1, r5, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2]
	cmp r0, r2
	blo _08001206
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0xc
	bne _080011FE
	ldrb r0, [r6]
	movs r1, #2
	bl nullsub_2
	b _08001206
_080011FE:
	ldrb r0, [r6]
	movs r1, #0
	bl nullsub_2
_08001206:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800120E
	b _080014E0
_0800120E:
	adds r0, r5, #0
	adds r0, #0x90
	adds r4, r0, #0
	ldrh r1, [r4]
	cmp r1, #0xc
	bne _08001224
_0800121A:
	ldrb r0, [r6]
	movs r1, #2
	bl nullsub_2
	b _0800122C
_08001224:
	ldrb r0, [r6]
	movs r1, #0
	bl nullsub_2
_0800122C:
	movs r0, #0
	strh r0, [r4]
	b _080014E0
_08001232:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	blo _08001298
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_8005A00
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0xf
	bne _08001282
	ldr r0, _080012AC @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08001282
	ldrb r0, [r6]
	movs r1, #0
	bl sub_8005BE8
_08001282:
	ldrh r0, [r5, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08001298
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_8005C88
_08001298:
	ldrb r6, [r6]
	cmp r6, #0x20
	beq _080012A0
	b _080014E0
_080012A0:
	adds r1, r5, #0
	adds r1, #0x90
	ldr r0, _080012B0 @ =0x0000FFFC
	strh r0, [r1]
	b _080014E0
	.align 2, 0
_080012AC: .4byte gUnknown_03000800
_080012B0: .4byte 0x0000FFFC
_080012B4:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080012D2
	b _080014D4
_080012D2:
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_8005A00
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _08001306
	ldr r0, _08001320 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08001306
	ldrb r0, [r6]
	movs r1, #0
	bl sub_8005BE8
_08001306:
	ldrh r0, [r5, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08001314
	b _080014D4
_08001314:
	ldrh r0, [r5, #0x34]
	ldrb r1, [r6]
	movs r2, #0
	bl sub_8005C88
	b _080014D4
	.align 2, 0
_08001320: .4byte gUnknown_03000800
_08001324:
	adds r2, r5, #0
	adds r2, #0x96
	ldrb r0, [r2]
	adds r6, r5, #0
	adds r6, #0x97
	cmp r0, #0
	beq _08001358
	adds r1, r5, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2]
	cmp r0, r2
	blo _08001358
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r1, #0
	bl nullsub_3
_08001358:
	ldrb r4, [r6]
	cmp r4, #0x20
	beq _08001360
	b _080014E0
_08001360:
	ldrb r0, [r6]
	movs r1, #0
	bl nullsub_3
	adds r1, r5, #0
	adds r1, #0x90
_0800136C:
	movs r0, #0
	strh r0, [r1]
	b _080014E0
_08001372:
	adds r2, r5, #0
	adds r2, #0x96
	ldrb r0, [r2]
	adds r6, r5, #0
	adds r6, #0x97
	cmp r0, #0
	beq _080013A6
	adds r1, r5, #0
	adds r1, #0x94
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2]
	cmp r0, r2
	blo _080013A6
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r1, #0
	bl nullsub_3
_080013A6:
	ldrb r4, [r6]
	cmp r4, #0
	beq _080013AE
	b _080014E0
_080013AE:
	adds r0, r4, #0
	movs r1, #0
	bl nullsub_3
	adds r0, r5, #0
	adds r0, #0x90
	strh r4, [r0]
	b _080014E0
_080013BE:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bhs _080013D8
	b _080014E0
_080013D8:
	movs r0, #0
	strh r0, [r2]
	bl Random
	adds r4, r0, #0
	bl Random
	ldr r1, _08001408 @ =gScriptContext
	adds r1, #0x46
	ldrh r3, [r1]
	adds r1, r5, #0
	adds r1, #0x97
	ldrb r2, [r1]
	adds r1, r2, #0
	ands r1, r4
	adds r1, r3, r1
	lsls r1, r1, #8
	ands r2, r0
	adds r3, r3, r2
	lsls r3, r3, #0xc
	orrs r1, r3
	str r1, [r6, #0x44]
	b _080014E0
	.align 2, 0
_08001408: .4byte gScriptContext
_0800140C:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	blo _080014E0
	movs r0, #0
	strh r0, [r2]
	adds r2, r6, #0
	adds r2, #0x4e
	adds r0, r5, #0
	adds r0, #0x97
	ldrh r1, [r2]
	ldrb r0, [r0]
	subs r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2]
	cmp r0, #0
	bne _080014E0
	strh r0, [r3]
	b _080014E0
_08001444:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	blo _08001480
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _08001490 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08001480
	ldrb r0, [r6]
	movs r1, #0
	bl sub_80058E8
_08001480:
	ldrb r6, [r6]
	cmp r6, #0x20
	bne _080014E0
	adds r1, r5, #0
	adds r1, #0x90
	ldr r0, _08001494 @ =0x0000FFFD
	strh r0, [r1]
	b _080014E0
	.align 2, 0
_08001490: .4byte gUnknown_03000800
_08001494: .4byte 0x0000FFFD
_08001498:
	adds r2, r5, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x96
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x97
	ldrb r1, [r1]
	cmp r0, r1
	blo _080014D4
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _080014E8 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x88
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _080014D4
	ldrb r0, [r6]
	movs r1, #0
	bl sub_80058E8
_080014D4:
	ldrb r1, [r6]
	cmp r1, #0
	bne _080014E0
	adds r0, r5, #0
	adds r0, #0x90
	strh r1, [r0]
_080014E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080014E8: .4byte gUnknown_03000800

	thumb_func_start InitSpecialEffectsWithMosaic
InitSpecialEffectsWithMosaic: @ 0x080014EC
	push {r4, r5, lr}
	ldr r3, _08001520 @ =gMain
	mov ip, r3
	ldr r4, _08001524 @ =gIORegisters
	adds r3, #0x90
	movs r5, #0
	strh r0, [r3]
	mov r0, ip
	adds r0, #0x96
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #0x40
	ldrh r0, [r4, #6]
	orrs r0, r1
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	orrs r0, r1
	strh r0, [r4, #4]
	mov r0, ip
	adds r0, #0x94
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001520: .4byte gMain
_08001524: .4byte gIORegisters

	thumb_func_start InitSpecialEffects
InitSpecialEffects: @ 0x08001528
	push {r4, lr}
	ldr r3, _08001548 @ =gMain
	mov ip, r3
	adds r3, #0x90
	movs r4, #0
	strh r0, [r3]
	mov r0, ip
	adds r0, #0x96
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	subs r0, #3
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001548: .4byte gMain

	thumb_func_start VBlankIntr
VBlankIntr: @ 0x0800154C
	push {lr}
	bl m4aSoundVSync
	ldr r1, _08001560 @ =gMain
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08001560: .4byte gMain

	thumb_func_start HBlankIntr
HBlankIntr: @ 0x08001564
	bx lr
	.align 2, 0

	thumb_func_start IntrDummy
IntrDummy: @ 0x08001568
	bx lr
	.align 2, 0
