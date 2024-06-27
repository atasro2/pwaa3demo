	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_800BC08
sub_800BC08: @ 0x0800BC08
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r5, _0800BC40 @ =gAnimation+0x44
	ldrb r0, [r5, #0xe]
	adds r3, r5, #0
	cmp r0, #0xb
	beq _0800BC20
	cmp r0, #0x21
	beq _0800BC20
	cmp r0, #3
	beq _0800BC20
	b _0800BF2E
_0800BC20:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _0800BC2E
	b _0800BF2E
_0800BC2E:
	cmp r2, #0x1f
	bls _0800BC34
	b _0800BF2E
_0800BC34:
	lsls r0, r2, #2
	ldr r1, _0800BC44 @ =_0800BC48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BC40: .4byte gAnimation+0x44
_0800BC44: .4byte _0800BC48
_0800BC48: @ jump table
	.4byte _0800BCC8 @ case 0
	.4byte _0800BCD0 @ case 1
	.4byte _0800BF2E @ case 2
	.4byte _0800BF2E @ case 3
	.4byte _0800BF2E @ case 4
	.4byte _0800BF2E @ case 5
	.4byte _0800BF2E @ case 6
	.4byte _0800BF2E @ case 7
	.4byte _0800BF2E @ case 8
	.4byte _0800BF2E @ case 9
	.4byte _0800BDC0 @ case 10
	.4byte _0800BCFC @ case 11
	.4byte _0800BD30 @ case 12
	.4byte _0800BDD8 @ case 13
	.4byte _0800BF2E @ case 14
	.4byte _0800BF2E @ case 15
	.4byte _0800BF2E @ case 16
	.4byte _0800BF2E @ case 17
	.4byte _0800BF2E @ case 18
	.4byte _0800BF2E @ case 19
	.4byte _0800BDE0 @ case 20
	.4byte _0800BF2E @ case 21
	.4byte _0800BF2E @ case 22
	.4byte _0800BF2E @ case 23
	.4byte _0800BF2E @ case 24
	.4byte _0800BF2E @ case 25
	.4byte _0800BF2E @ case 26
	.4byte _0800BF2E @ case 27
	.4byte _0800BF2E @ case 28
	.4byte _0800BF2E @ case 29
	.4byte _0800BF14 @ case 30
	.4byte _0800BF1A @ case 31
_0800BCC8:
	ldr r1, _0800BCCC @ =gUnknown_0826F888
	b _0800BCD2
	.align 2, 0
_0800BCCC: .4byte gUnknown_0826F888
_0800BCD0:
	ldr r1, _0800BCE8 @ =gUnknown_0826FE38
_0800BCD2:
	ldr r0, [r1, #4]
	ldr r1, _0800BCEC @ =gUnknown_08252498
	adds r2, r0, r1
	ldr r1, _0800BCF0 @ =0x050003A0
	ldr r0, _0800BCF4 @ =0x040000D4
	str r2, [r0]
	str r1, [r0, #4]
	ldr r1, _0800BCF8 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0800BF2E
	.align 2, 0
_0800BCE8: .4byte gUnknown_0826FE38
_0800BCEC: .4byte gUnknown_08252498
_0800BCF0: .4byte 0x050003A0
_0800BCF4: .4byte 0x040000D4
_0800BCF8: .4byte 0x80000010
_0800BCFC:
	movs r0, #1
	bl sub_800BC08
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r5]
	movs r4, #0
	movs r6, #0x80
_0800BD14:
	adds r0, r4, #0
	adds r0, #0x83
	bl sub_8011D68
	adds r5, r0, #0
	cmp r5, #0
	beq _0800BD28
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
_0800BD28:
	adds r4, #1
	cmp r4, #2
	bls _0800BD14
	b _0800BF2E
_0800BD30:
	adds r5, r3, #0
	ldrb r0, [r5, #0xe]
	cmp r0, #3
	bne _0800BD3C
	movs r0, #0xb
	strb r0, [r5, #0xe]
_0800BD3C:
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	movs r0, #0x78
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800BD5A
	ldr r0, _0800BD88 @ =0x0000800B
	ldr r2, _0800BD8C @ =gMain
	adds r1, r2, #0
	adds r1, #0xc4
	ldrh r1, [r1]
	adds r2, #0xc6
	ldrh r2, [r2]
	bl sub_80066B0
_0800BD5A:
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	ldr r2, _0800BD8C @ =gMain
	cmp r1, #0x78
	bne _0800BD6E
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0xf0
	beq _0800BD76
_0800BD6E:
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bne _0800BD94
_0800BD76:
	ldr r0, _0800BD90 @ =0x0000400B
	adds r1, r2, #0
	adds r1, #0xc4
	ldrh r1, [r1]
	adds r2, #0xc6
	ldrh r2, [r2]
	bl sub_80066B0
	b _0800BDA4
	.align 2, 0
_0800BD88: .4byte 0x0000800B
_0800BD8C: .4byte gMain
_0800BD90: .4byte 0x0000400B
_0800BD94:
	ldr r0, _0800BDB8 @ =0x0000800B
	adds r1, r2, #0
	adds r1, #0xc4
	ldrh r1, [r1]
	adds r2, #0xc6
	ldrh r2, [r2]
	bl sub_80066B0
_0800BDA4:
	movs r0, #1
	bl sub_800BC08
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r1, _0800BDBC @ =0xFEFFFFFF
	b _0800BF2A
	.align 2, 0
_0800BDB8: .4byte 0x0000800B
_0800BDBC: .4byte 0xFEFFFFFF
_0800BDC0:
	movs r0, #1
	bl sub_800BC08
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r1, _0800BDD4 @ =0xFEFFFFFF
	b _0800BF2A
	.align 2, 0
_0800BDD4: .4byte 0xFEFFFFFF
_0800BDD8:
	movs r0, #1
	bl sub_800BC08
	b _0800BF2E
_0800BDE0:
	adds r5, r3, #0
	ldr r1, [r5]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	bne _0800BDF0
	b _0800BF2E
_0800BDF0:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BE54
	ldr r0, _0800BE3C @ =gMain
	adds r3, r0, #0
	adds r3, #0x8f
	ldrb r1, [r3]
	cmp r1, #0xf
	beq _0800BE06
	b _0800BF2E
_0800BE06:
	ldr r1, _0800BE40 @ =gIORegisters
	adds r2, r1, #0
	adds r2, #0x48
	ldr r0, _0800BE44 @ =0x00003942
	strh r0, [r2]
	adds r1, #0x4c
	ldr r0, _0800BE48 @ =0x0000071F
	strh r0, [r1]
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r5, #0
	movs r1, #0
	bl sub_801208C
	movs r0, #3
	strb r0, [r5, #0xe]
	movs r0, #0
	bl sub_8016FEC
	ldr r0, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0800BE4C @ =0xFBFFFFFF
	ands r0, r1
	ldr r1, _0800BE50 @ =0xFDFFFFFF
	b _0800BF2A
	.align 2, 0
_0800BE3C: .4byte gMain
_0800BE40: .4byte gIORegisters
_0800BE44: .4byte 0x00003942
_0800BE48: .4byte 0x0000071F
_0800BE4C: .4byte 0xFBFFFFFF
_0800BE50: .4byte 0xFDFFFFFF
_0800BE54:
	ldr r0, _0800BEF4 @ =gMain
	adds r6, r0, #0
	adds r6, #0x8f
	ldrb r0, [r6]
	cmp r0, #1
	bne _0800BE94
	ldr r0, _0800BEF8 @ =0xFBFFFFFF
	ands r1, r0
	str r1, [r5]
	ldr r4, _0800BEFC @ =gIORegisters
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldr r0, _0800BF00 @ =0x00003942
	strh r0, [r1]
	adds r4, #0x4c
	ldr r0, _0800BF04 @ =0x0000071F
	strh r0, [r4]
	strb r2, [r6]
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r5]
	movs r0, #0
	bl sub_800BC08
	ldr r1, _0800BF08 @ =0x04000052
	ldrh r0, [r4]
	strh r0, [r1]
_0800BE94:
	ldrb r6, [r6]
	cmp r6, #2
	bne _0800BF2E
	ldr r0, [r5]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x40
	ands r0, r1
	ldr r1, _0800BF0C @ =0xFEFFFFFF
	ands r0, r1
	ldr r1, _0800BF10 @ =0xFDFFFFFF
	ands r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r5]
	movs r4, #0
_0800BEBE:
	adds r0, r4, #0
	adds r0, #0x83
	bl sub_8011D68
	adds r5, r0, #0
	cmp r5, #0
	beq _0800BEE2
	ldr r0, [r5]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x40
	ands r0, r1
	ldr r1, _0800BF0C @ =0xFEFFFFFF
	ands r0, r1
	ldr r1, _0800BF10 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r5]
_0800BEE2:
	adds r4, #1
	cmp r4, #2
	bls _0800BEBE
	ldr r0, _0800BEF4 @ =gMain
	adds r0, #0x8f
	movs r1, #1
	strb r1, [r0]
	b _0800BF2E
	.align 2, 0
_0800BEF4: .4byte gMain
_0800BEF8: .4byte 0xFBFFFFFF
_0800BEFC: .4byte gIORegisters
_0800BF00: .4byte 0x00003942
_0800BF04: .4byte 0x0000071F
_0800BF08: .4byte 0x04000052
_0800BF0C: .4byte 0xFEFFFFFF
_0800BF10: .4byte 0xFDFFFFFF
_0800BF14:
	movs r0, #1
	bl sub_800BC08
_0800BF1A:
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r1, _0800BF34 @ =0xFDFFFFFF
	ands r0, r1
	movs r1, #0x81
	rsbs r1, r1, #0
_0800BF2A:
	ands r0, r1
	str r0, [r5]
_0800BF2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF34: .4byte 0xFDFFFFFF
