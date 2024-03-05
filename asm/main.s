	.include "asm/macros.inc"
	.syntax unified


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
	ldr r0, _08001028 @ =gAnimation
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
_08001028: .4byte gAnimation
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
	ldr r0, _08001098 @ =gAnimation
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
_08001098: .4byte gAnimation
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
	ldr r0, _08001100 @ =gAnimation
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
_08001100: .4byte gAnimation
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
	ldr r0, _08001174 @ =gAnimation
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
_08001174: .4byte gAnimation
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
	ldr r0, _080012AC @ =gAnimation
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
_080012AC: .4byte gAnimation
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
	ldr r0, _08001320 @ =gAnimation
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
_08001320: .4byte gAnimation
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
	ldr r0, _08001490 @ =gAnimation
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
_08001490: .4byte gAnimation
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
	ldr r0, _080014E8 @ =gAnimation
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
_080014E8: .4byte gAnimation

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
