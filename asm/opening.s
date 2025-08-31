	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_801C8BC
sub_801C8BC: @ 0x0801C8BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r0, _0801C8F0 @ =gIORegisters
	mov r8, r0
	ldr r1, _0801C8F4 @ =gMain
	mov sl, r1
	ldr r6, _0801C8F8 @ =gScriptContext
	mov r0, sb
	adds r0, #0x2d
	ldrb r0, [r0]
	mov r3, r8
	cmp r0, #0x63
	bls _0801C8E4
	bl _0801D2F6
_0801C8E4:
	lsls r0, r0, #2
	ldr r1, _0801C8FC @ =_0801C900
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C8F0: .4byte gIORegisters
_0801C8F4: .4byte gMain
_0801C8F8: .4byte gScriptContext
_0801C8FC: .4byte _0801C900
_0801C900: @ jump table
	.4byte _0801D2F0 @ case 0
	.4byte _0801CA90 @ case 1
	.4byte _0801CB24 @ case 2
	.4byte _0801CB52 @ case 3
	.4byte _0801CBCC @ case 4
	.4byte _0801CBF8 @ case 5
	.4byte _0801CC88 @ case 6
	.4byte _0801CCB4 @ case 7
	.4byte _0801CD10 @ case 8
	.4byte _0801CD44 @ case 9
	.4byte _0801CE48 @ case 10
	.4byte _0801CE50 @ case 11
	.4byte _0801CF7C @ case 12
	.4byte _0801D280 @ case 13
	.4byte _0801D2F6 @ case 14
	.4byte _0801D2F6 @ case 15
	.4byte _0801D2F6 @ case 16
	.4byte _0801D2F6 @ case 17
	.4byte _0801D2F6 @ case 18
	.4byte _0801D2F6 @ case 19
	.4byte _0801D2F6 @ case 20
	.4byte _0801D2F6 @ case 21
	.4byte _0801D2F6 @ case 22
	.4byte _0801D2F6 @ case 23
	.4byte _0801D2F6 @ case 24
	.4byte _0801D2F6 @ case 25
	.4byte _0801D2F6 @ case 26
	.4byte _0801D2F6 @ case 27
	.4byte _0801D2F6 @ case 28
	.4byte _0801D2F6 @ case 29
	.4byte _0801D2F6 @ case 30
	.4byte _0801D2F6 @ case 31
	.4byte _0801D2F6 @ case 32
	.4byte _0801D2F6 @ case 33
	.4byte _0801D2F6 @ case 34
	.4byte _0801D2F6 @ case 35
	.4byte _0801D2F6 @ case 36
	.4byte _0801D2F6 @ case 37
	.4byte _0801D2F6 @ case 38
	.4byte _0801D2F6 @ case 39
	.4byte _0801D2F6 @ case 40
	.4byte _0801D2F6 @ case 41
	.4byte _0801D2F6 @ case 42
	.4byte _0801D2F6 @ case 43
	.4byte _0801D2F6 @ case 44
	.4byte _0801D2F6 @ case 45
	.4byte _0801D2F6 @ case 46
	.4byte _0801D2F6 @ case 47
	.4byte _0801D2F6 @ case 48
	.4byte _0801D2F6 @ case 49
	.4byte _0801D2F6 @ case 50
	.4byte _0801D2F6 @ case 51
	.4byte _0801D2F6 @ case 52
	.4byte _0801D2F6 @ case 53
	.4byte _0801D2F6 @ case 54
	.4byte _0801D2F6 @ case 55
	.4byte _0801D2F6 @ case 56
	.4byte _0801D2F6 @ case 57
	.4byte _0801D2F6 @ case 58
	.4byte _0801D2F6 @ case 59
	.4byte _0801D2F6 @ case 60
	.4byte _0801D2F6 @ case 61
	.4byte _0801D2F6 @ case 62
	.4byte _0801D2F6 @ case 63
	.4byte _0801D2F6 @ case 64
	.4byte _0801D2F6 @ case 65
	.4byte _0801D2F6 @ case 66
	.4byte _0801D2F6 @ case 67
	.4byte _0801D2F6 @ case 68
	.4byte _0801D2F6 @ case 69
	.4byte _0801D2F6 @ case 70
	.4byte _0801D2F6 @ case 71
	.4byte _0801D2F6 @ case 72
	.4byte _0801D2F6 @ case 73
	.4byte _0801D2F6 @ case 74
	.4byte _0801D2F6 @ case 75
	.4byte _0801D2F6 @ case 76
	.4byte _0801D2F6 @ case 77
	.4byte _0801D2F6 @ case 78
	.4byte _0801D2F6 @ case 79
	.4byte _0801D2F6 @ case 80
	.4byte _0801D2F6 @ case 81
	.4byte _0801D2F6 @ case 82
	.4byte _0801D2F6 @ case 83
	.4byte _0801D2F6 @ case 84
	.4byte _0801D2F6 @ case 85
	.4byte _0801D2F6 @ case 86
	.4byte _0801D2F6 @ case 87
	.4byte _0801D2F6 @ case 88
	.4byte _0801D2F6 @ case 89
	.4byte _0801D2F6 @ case 90
	.4byte _0801D2F6 @ case 91
	.4byte _0801D2F6 @ case 92
	.4byte _0801D2F6 @ case 93
	.4byte _0801D2F6 @ case 94
	.4byte _0801D2F6 @ case 95
	.4byte _0801D2F6 @ case 96
	.4byte _0801D2F6 @ case 97
	.4byte _0801D2E8 @ case 98
	.4byte _0801D2F6 @ case 99
_0801CA90:
	mov r0, sb
	adds r0, #0x2f
	ldrb r1, [r0]
	str r0, [sp, #4]
	cmp r1, #1
	beq _0801CAF4
	cmp r1, #1
	bgt _0801CAA8
	cmp r1, #0
	beq _0801CAB4
	bl _0801D2F6
_0801CAA8:
	cmp r1, #2
	beq _0801CAB4
	cmp r1, #3
	beq _0801CB14
	bl _0801D2F6
_0801CAB4:
	movs r0, #0x1e
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801CAC4
	bl _0801D2DC
_0801CAC4:
	movs r0, #2
	ldrh r2, [r6, #0x1c]
	orrs r0, r2
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r6, #0x1c]
	movs r0, #0x1e
	bl PlayAnimation
	ldr r3, [sp, #4]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0801CAE2
	bl _0801D2DC
_0801CAE2:
	ldr r0, _0801CAF0 @ =0x00001E01
	movs r1, #6
	bl StartAnimationBlend
	bl _0801D2DC
	.align 2, 0
_0801CAF0: .4byte 0x00001E01
_0801CAF4:
	movs r0, #0x1e
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldr r0, _0801CB0C @ =0x0000FFFD
	ldrh r4, [r6, #0x1c]
	ands r0, r4
	ldr r1, _0801CB10 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r6, #0x1c]
	b _0801D2DC
	.align 2, 0
_0801CB0C: .4byte 0x0000FFFD
_0801CB10: .4byte 0x0000FFDF
_0801CB14:
	ldr r0, _0801CB20 @ =0x00001E04
	movs r1, #6
	bl StartAnimationBlend
	b _0801D2DC
	.align 2, 0
_0801CB20: .4byte 0x00001E04
_0801CB24:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CB30
	b _0801D2F6
_0801CB30:
	movs r0, #0x1f
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801CB3E
	b _0801D2DC
_0801CB3E:
	movs r0, #0x1f
	bl PlayAnimation
	movs r0, #2
	ldrh r1, [r6, #0x1c]
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r6, #0x1c]
	b _0801D2DC
_0801CB52:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CB90
	mov r2, sb
	ldrh r0, [r2, #0x30]
	cmp r0, #0
	bne _0801CB80
	movs r0, #0x1f
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldr r0, _0801CB88 @ =0x0000FFFD
	ldrh r3, [r6, #0x1c]
	ands r0, r3
	ldr r1, _0801CB8C @ =0x0000FFDF
	ands r0, r1
	strh r0, [r6, #0x1c]
	mov r0, sb
	bl sub_801D308
_0801CB80:
	mov r0, sb
	bl sub_801D474
	b _0801D2F6
	.align 2, 0
_0801CB88: .4byte 0x0000FFFD
_0801CB8C: .4byte 0x0000FFDF
_0801CB90:
	movs r2, #0
	movs r0, #0xf8
	lsls r0, r0, #6
	mov r4, r8
	strh r0, [r4, #4]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #0xf2
	lsls r0, r0, #5
	strh r0, [r1]
	movs r0, #0xe
	mov r1, sl
	strb r0, [r1, #0x1a]
	mov r0, sp
	strh r2, [r0]
	ldr r1, _0801CBC0 @ =0x040000D4
	str r0, [r1]
	ldr r0, _0801CBC4 @ =gBG2MapBuffer
	str r0, [r1, #4]
	ldr r0, _0801CBC8 @ =0x81000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0801D2DC
	.align 2, 0
_0801CBC0: .4byte 0x040000D4
_0801CBC4: .4byte gBG2MapBuffer
_0801CBC8: .4byte 0x81000400
_0801CBCC:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CBEC
	movs r0, #0x20
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801CBE4
	b _0801D2DC
_0801CBE4:
	movs r0, #0x20
	bl PlayAnimation
	b _0801D2DC
_0801CBEC:
	movs r0, #0x20
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	b _0801D2DC
_0801CBF8:
	mov r0, sb
	adds r0, #0x2f
	ldrb r2, [r0]
	cmp r2, #0
	bne _0801CC48
	movs r0, #0xfb
	mov r3, sl
	ldrb r3, [r3, #0x1a]
	ands r0, r3
	mov r4, sl
	strb r0, [r4, #0x1a]
	ldr r1, _0801CC34 @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _0801CC38 @ =gBG2MapBuffer
	str r0, [r1, #4]
	ldr r0, _0801CC3C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, sp
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _0801CC40 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0801CC44 @ =0x810000F0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0801D2DC
	.align 2, 0
_0801CC34: .4byte 0x040000D4
_0801CC38: .4byte gBG2MapBuffer
_0801CC3C: .4byte 0x80000100
_0801CC40: .4byte 0x05000020
_0801CC44: .4byte 0x810000F0
_0801CC48:
	adds r0, r3, #0
	adds r0, #0x48
	movs r2, #0xc9
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0801CC78 @ =0x04000050
	str r2, [r0]
	ldr r1, _0801CC7C @ =0x04000054
	movs r0, #0x10
	strh r0, [r1]
	adds r1, #0x80
	ldr r0, _0801CC80 @ =gBG2MapBuffer
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0801CC84 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0801D2DC
	.align 2, 0
_0801CC78: .4byte 0x04000050
_0801CC7C: .4byte 0x04000054
_0801CC80: .4byte gBG2MapBuffer
_0801CC84: .4byte 0x80000100
_0801CC88:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CCA8
	movs r0, #0x21
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801CCA0
	b _0801D2DC
_0801CCA0:
	movs r0, #0x21
	bl PlayAnimation
	b _0801D2DC
_0801CCA8:
	movs r0, #0x21
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	b _0801D2DC
_0801CCB4:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CCC0
	b _0801D2F6
_0801CCC0:
	bl sub_80060E8
	mov r1, sp
	ldr r2, _0801CCF4 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0801CCF8 @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	ldr r0, _0801CCFC @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _0801CD00 @ =0x810000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r2, sp
	ldr r4, _0801CD04 @ =0x00002222
	adds r0, r4, #0
	strh r0, [r2]
	str r3, [r1]
	ldr r0, _0801CD08 @ =0x06004000
	str r0, [r1, #4]
	ldr r0, _0801CD0C @ =0x81004B00
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0801D2DC
	.align 2, 0
_0801CCF4: .4byte 0x0000FFFF
_0801CCF8: .4byte 0x040000D4
_0801CCFC: .4byte 0x05000040
_0801CD00: .4byte 0x810000E0
_0801CD04: .4byte 0x00002222
_0801CD08: .4byte 0x06004000
_0801CD0C: .4byte 0x81004B00
_0801CD10:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CD30
	movs r0, #0x73
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801CD28
	b _0801D2DC
_0801CD28:
	movs r0, #0x73
	bl PlayAnimation
	b _0801D2DC
_0801CD30:
	movs r0, #0x73
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	bne _0801CD3E
	b _0801D2DC
_0801CD3E:
	bl DestroyAnimation
	b _0801D2DC
_0801CD44:
	mov r0, sb
	adds r0, #0x2f
	ldrb r1, [r0]
	str r0, [sp, #4]
	cmp r1, #1
	beq _0801CE08
	cmp r1, #1
	bgt _0801CD5A
	cmp r1, #0
	beq _0801CD60
	b _0801D2F6
_0801CD5A:
	cmp r1, #2
	beq _0801CE2A
	b _0801D2F6
_0801CD60:
	ldrh r1, [r6, #0x3a]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x40
	movs r2, #0
	ldrh r3, [r6, #0x1c]
	orrs r0, r3
	strh r0, [r6, #0x1c]
	lsls r0, r4, #8
	adds r0, r0, r4
	mov r4, r8
	str r0, [r4, #0x44]
	ldrh r0, [r6, #0x3a]
	adds r0, #1
	strh r0, [r6, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0801CD8C
	b _0801D2F6
_0801CD8C:
	ldr r1, _0801CDB8 @ =0x040000D4
	ldr r0, _0801CDBC @ =gUnknown_020365C0
	str r0, [r1]
	ldr r0, _0801CDC0 @ =0x06004000
	str r0, [r1, #4]
	ldr r0, _0801CDC4 @ =0x80004B00
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r0, [r6, #0x38]
	cmp r0, #0
	beq _0801CDD0
	movs r0, #0x80
	ldrh r2, [r4, #6]
	orrs r0, r2
	strh r0, [r4, #6]
	ldr r0, _0801CDC8 @ =gBG0MapBuffer
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0801CDCC @ =0x80000100
	b _0801CDE6
	.align 2, 0
_0801CDB8: .4byte 0x040000D4
_0801CDBC: .4byte gUnknown_020365C0
_0801CDC0: .4byte 0x06004000
_0801CDC4: .4byte 0x80004B00
_0801CDC8: .4byte gBG0MapBuffer
_0801CDCC: .4byte 0x80000100
_0801CDD0:
	ldr r0, _0801CDF8 @ =0x0000FF7F
	mov r3, r8
	ldrh r3, [r3, #6]
	ands r0, r3
	mov r4, r8
	strh r0, [r4, #6]
	ldr r0, _0801CDFC @ =gBG0MapBuffer
	str r0, [r1]
	ldr r0, _0801CE00 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _0801CE04 @ =0x80000010
_0801CDE6:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xe
	strh r0, [r6, #0x3a]
	movs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1]
	b _0801D2F6
	.align 2, 0
_0801CDF8: .4byte 0x0000FF7F
_0801CDFC: .4byte gBG0MapBuffer
_0801CE00: .4byte 0x05000040
_0801CE04: .4byte 0x80000010
_0801CE08:
	ldrh r2, [r6, #0x3a]
	lsls r0, r2, #4
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #8
	adds r0, r0, r4
	mov r3, r8
	str r0, [r3, #0x44]
	ldrh r0, [r6, #0x3a]
	cmp r0, #0
	beq _0801CE26
	subs r0, #1
	strh r0, [r6, #0x3a]
	b _0801D2F6
_0801CE26:
	movs r0, #2
	b _0801D062
_0801CE2A:
	ldr r0, _0801CE44 @ =0x0000FFBF
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	movs r1, #0
	strh r0, [r6, #0x1c]
	adds r0, r6, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #8
	str r0, [r6]
	b _0801D2DC
	.align 2, 0
_0801CE44: .4byte 0x0000FFBF
_0801CE48:
	mov r0, sb
	bl sub_801D548
	b _0801D2F6
_0801CE50:
	movs r2, #0
	ldr r0, _0801CE90 @ =0x00003C03
	mov r4, r8
	strh r0, [r4]
	ldr r0, _0801CE94 @ =0x00003FC6
	strh r0, [r4, #6]
	mov r1, r8
	adds r1, #0x4a
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	ldrh r4, [r1]
	orrs r0, r4
	strh r0, [r1]
	movs r0, #1
	mov r1, sl
	ldrb r1, [r1, #0x1a]
	orrs r0, r1
	mov r4, sl
	strb r0, [r4, #0x1a]
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CE9C
	mov r1, r8
	adds r1, #0x48
	ldr r0, _0801CE98 @ =0x000004C9
	strh r0, [r1]
	adds r1, #6
	movs r0, #0x10
	b _0801CEC6
	.align 2, 0
_0801CE90: .4byte 0x00003C03
_0801CE94: .4byte 0x00003FC6
_0801CE98: .4byte 0x000004C9
_0801CE9C:
	mov r1, r8
	adds r1, #0x48
	ldr r0, _0801CF48 @ =0x00000489
	strh r0, [r1]
	adds r1, #6
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0801CF4C @ =0x04000050
	adds r0, r3, #0
	adds r0, #0x48
	ldrh r0, [r0]
	str r0, [r1]
	subs r1, #0x50
	adds r0, r3, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r1]
	adds r1, #0x54
	adds r0, r3, #0
	adds r0, #0x4e
	ldrh r0, [r0]
_0801CEC6:
	strh r0, [r1]
	ldr r5, _0801CF50 @ =gUnknown_081FFD28
	ldr r6, _0801CF54 @ =eBGDecompBuffer
	ldr r0, _0801CF58 @ =gUnknown_081FFD48
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r0, _0801CF5C @ =0x040000D4
	str r5, [r0]
	ldr r1, _0801CF60 @ =0x05000020
	str r1, [r0, #4]
	ldr r1, _0801CF64 @ =0x80000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r5, r6, #0
	ldr r6, _0801CF68 @ =0x06001000
	str r5, [r0]
	str r6, [r0, #4]
	ldr r1, _0801CF6C @ =0x80000600
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0
	ldr r4, _0801CF70 @ =gBG0MapBuffer
	ldr r3, _0801CF74 @ =0x0000108B
	ldr r1, _0801CF78 @ =0x000003FF
_0801CEF8:
	lsls r0, r2, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r1
	bls _0801CEF8
	movs r2, #0
	ldr r6, _0801CF70 @ =gBG0MapBuffer
	movs r0, #0x84
	lsls r0, r0, #5
	adds r7, r0, #0
_0801CF12:
	movs r3, #0
	lsls r0, r2, #1
	adds r5, r2, #1
	lsls r4, r2, #5
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r2, r0, r7
_0801CF20:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r4, r0
	lsls r0, r0, #1
	adds r0, r0, r6
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r2
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xb
	bls _0801CF20
	lsls r0, r5, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #7
	bls _0801CF12
	b _0801D2DC
	.align 2, 0
_0801CF48: .4byte 0x00000489
_0801CF4C: .4byte 0x04000050
_0801CF50: .4byte gUnknown_081FFD28
_0801CF54: .4byte eBGDecompBuffer
_0801CF58: .4byte gUnknown_081FFD48
_0801CF5C: .4byte 0x040000D4
_0801CF60: .4byte 0x05000020
_0801CF64: .4byte 0x80000010
_0801CF68: .4byte 0x06001000
_0801CF6C: .4byte 0x80000600
_0801CF70: .4byte gBG0MapBuffer
_0801CF74: .4byte 0x0000108B
_0801CF78: .4byte 0x000003FF
_0801CF7C:
	mov r0, sb
	adds r0, #0x2f
	ldrb r7, [r0]
	str r0, [sp, #4]
	cmp r7, #1
	bne _0801CF8A
	b _0801D090
_0801CF8A:
	cmp r7, #1
	bgt _0801CF94
	cmp r7, #0
	beq _0801CFA2
	b _0801D2F6
_0801CF94:
	cmp r7, #2
	bne _0801CF9A
	b _0801D158
_0801CF9A:
	cmp r7, #3
	bne _0801CFA0
	b _0801D1D0
_0801CFA0:
	b _0801D2F6
_0801CFA2:
	movs r0, #0x1e
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldr r0, _0801D068 @ =0x0000FFFD
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	ldr r1, _0801D06C @ =0x0000FFDF
	ands r0, r1
	strh r0, [r6, #0x1c]
	movs r2, #0x46
	adds r2, r2, r6
	mov sb, r2
	ldrh r0, [r2]
	strh r0, [r6, #0x32]
	mov r0, r8
	adds r0, #0x4e
	strh r7, [r0]
	mov r1, r8
	adds r1, #0x48
	ldr r0, _0801D070 @ =0x00001D42
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801D074 @ =0x0000071F
	strh r0, [r1]
	mov r0, sl
	adds r0, #0x8a
	strh r7, [r0]
	movs r0, #0xfe
	mov r3, sl
	ldrb r3, [r3, #0x1a]
	ands r0, r3
	mov r4, sl
	strb r0, [r4, #0x1a]
	mov r4, r8
	adds r4, #0x4a
	ldr r0, _0801D078 @ =0x0000FEFF
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	mov r0, sp
	strh r7, [r0]
	ldr r1, _0801D07C @ =0x040000D4
	str r0, [r1]
	ldr r5, _0801D080 @ =gBG0MapBuffer
	str r5, [r1, #4]
	ldr r0, _0801D084 @ =0x81000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x24
	bl PlayAnimation
	movs r2, #0x30
	rsbs r2, r2, #0
	movs r0, #0x23
	movs r1, #0x78
	bl PlayAnimationAtCustomOrigin
	movs r2, #0x70
	rsbs r2, r2, #0
	movs r0, #0x22
	movs r1, #0x78
	bl PlayAnimationAtCustomOrigin
	mov r2, sb
	strh r7, [r2]
	adds r0, r6, #0
	adds r0, #0x48
	strh r7, [r0]
	adds r0, #2
	strh r7, [r0]
	movs r2, #0
	ldr r1, _0801D088 @ =0x0000108B
	ldr r3, _0801D08C @ =0x000003FF
_0801D038:
	lsls r0, r2, #1
	adds r0, r0, r5
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _0801D038
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #1
	mov r2, sl
	ldrb r2, [r2, #0x1a]
	orrs r0, r2
	mov r3, sl
	strb r0, [r3, #0x1a]
	movs r0, #1
_0801D062:
	ldr r4, [sp, #4]
	strb r0, [r4]
	b _0801D2F6
	.align 2, 0
_0801D068: .4byte 0x0000FFFD
_0801D06C: .4byte 0x0000FFDF
_0801D070: .4byte 0x00001D42
_0801D074: .4byte 0x0000071F
_0801D078: .4byte 0x0000FEFF
_0801D07C: .4byte 0x040000D4
_0801D080: .4byte gBG0MapBuffer
_0801D084: .4byte 0x81000200
_0801D088: .4byte 0x0000108B
_0801D08C: .4byte 0x000003FF
_0801D090:
	adds r1, r6, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r6, #0x32]
	cmp r0, r2
	bhi _0801D0A6
	b _0801D2F6
_0801D0A6:
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r1, [sp, #8]
	cmp r0, #1
	bls _0801D112
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r4, #7
	ands r4, r1
	mov ip, r0
	cmp r4, #0
	bne _0801D0F6
	movs r2, #0x15
	ldr r7, _0801D14C @ =gBG3MapBuffer
	ldr r3, _0801D150 @ =0x040000D4
	ldr r0, _0801D154 @ =0x80000020
	mov sl, r0
_0801D0DA:
	subs r1, r2, #1
	lsls r0, r1, #6
	adds r5, r0, r7
	lsls r0, r2, #6
	adds r6, r0, r7
	str r5, [r3]
	str r6, [r3, #4]
	mov r2, sl
	str r2, [r3, #8]
	ldr r0, [r3, #8]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r2, #0
	bne _0801D0DA
_0801D0F6:
	mov r3, ip
	ldrh r3, [r3]
	cmp r3, #0x4c
	bne _0801D104
	mov r0, sb
	bl op_proc_exit_iOS
_0801D104:
	movs r0, #8
	subs r0, r0, r4
	movs r1, #0
	mov r4, r8
	strh r0, [r4, #0x16]
	ldr r0, [sp, #8]
	strh r1, [r0]
_0801D112:
	movs r0, #0x24
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801D124
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
_0801D124:
	movs r0, #0x23
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	beq _0801D136
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
_0801D136:
	movs r0, #0x22
	bl FindAnimationFromAnimId
	adds r1, r0, #0
	cmp r1, #0
	bne _0801D144
	b _0801D2F6
_0801D144:
	ldrh r0, [r1, #0x12]
	adds r0, #1
	strh r0, [r1, #0x12]
	b _0801D2F6
	.align 2, 0
_0801D14C: .4byte gBG3MapBuffer
_0801D150: .4byte 0x040000D4
_0801D154: .4byte 0x80000020
_0801D158:
	movs r1, #0
	movs r0, #8
	mov r2, r8
	strh r0, [r2, #0x16]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0801D1BC @ =0x040000D4
	str r0, [r1]
	ldr r0, _0801D1C0 @ =gBG0MapBuffer
	str r0, [r1, #4]
	ldr r0, _0801D1C4 @ =0x81000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, r8
	adds r1, #0x4a
	ldr r0, _0801D1C8 @ =0x0000FEFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r0, #0xfe
	mov r4, sl
	ldrb r4, [r4, #0x1a]
	ands r0, r4
	mov r1, sl
	strb r0, [r1, #0x1a]
	movs r0, #0x1e
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x22
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x23
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x24
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldr r0, _0801D1CC @ =0x00003FC7
	mov r2, r8
	strh r0, [r2, #6]
	b _0801D2DC
	.align 2, 0
_0801D1BC: .4byte 0x040000D4
_0801D1C0: .4byte gBG0MapBuffer
_0801D1C4: .4byte 0x81000200
_0801D1C8: .4byte 0x0000FEFF
_0801D1CC: .4byte 0x00003FC7
_0801D1D0:
	mov r1, r8
	adds r1, #0x4a
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	mov r4, sl
	ldrb r4, [r4, #0x1a]
	orrs r0, r4
	mov r1, sl
	strb r0, [r1, #0x1a]
	mov r1, r8
	adds r1, #0x48
	ldr r0, _0801D258 @ =0x00000489
	strh r0, [r1]
	adds r1, #6
	movs r0, #0x10
	strh r0, [r1]
	movs r2, #0
	ldr r6, _0801D25C @ =gBG0MapBuffer
	adds r5, r6, #0
	ldr r4, _0801D260 @ =0x0000108B
	ldr r1, _0801D264 @ =0x000003FF
_0801D204:
	lsls r0, r2, #1
	adds r0, r0, r5
	strh r4, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r1
	bls _0801D204
	ldr r1, _0801D268 @ =0x040000D4
	str r6, [r1]
	ldr r0, _0801D26C @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0801D270 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r5, _0801D274 @ =0x06001160
	mov r2, sp
	ldr r4, _0801D278 @ =0x00001111
	adds r0, r4, #0
	strh r0, [r2]
	str r2, [r1]
	str r5, [r1, #4]
	ldr r0, _0801D27C @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xd4
	adds r0, r3, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r1]
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x48
	ldrh r0, [r0]
	str r0, [r1]
	adds r1, #4
	adds r0, r3, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	strh r0, [r1]
	b _0801D2DC
	.align 2, 0
_0801D258: .4byte 0x00000489
_0801D25C: .4byte gBG0MapBuffer
_0801D260: .4byte 0x0000108B
_0801D264: .4byte 0x000003FF
_0801D268: .4byte 0x040000D4
_0801D26C: .4byte 0x0600E000
_0801D270: .4byte 0x80000400
_0801D274: .4byte 0x06001160
_0801D278: .4byte 0x00001111
_0801D27C: .4byte 0x81000010
_0801D280:
	mov r0, sb
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D2BE
	movs r5, #6
	bl Random
	movs r4, #0xf
	adds r1, r4, #0
	ands r1, r0
	ands r1, r5
	mov r0, sl
	strb r1, [r0, #0x12]
	bl Random
	ands r4, r0
	ands r4, r5
	mov r1, sl
	strb r4, [r1, #0x13]
	mov r2, sl
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	movs r0, #0x80
	ldrh r2, [r6, #0x1e]
	orrs r0, r2
	strh r0, [r6, #0x1e]
	b _0801D2F6
_0801D2BE:
	movs r0, #0
	mov r3, sl
	strb r0, [r3, #0x12]
	strb r0, [r3, #0x13]
	mov r2, sl
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801D2E4 @ =0x0000FF7F
	ldrh r4, [r6, #0x1e]
	ands r0, r4
	strh r0, [r6, #0x1e]
_0801D2DC:
	mov r0, sb
	bl op_proc_exit_iOS
	b _0801D2F6
	.align 2, 0
_0801D2E4: .4byte 0x0000FF7F
_0801D2E8:
	mov r0, sb
	bl Demo_Proc_iOS
	b _0801D2F6
_0801D2F0:
	mov r0, sb
	bl op_proc_exit_iOS
_0801D2F6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801D308
sub_801D308: @ 0x0801D308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, _0801D424 @ =gMain
	mov r8, r0
	ldr r7, _0801D428 @ =gBG2MapBuffer
	movs r0, #0xfe
	mov r1, r8
	ldrb r1, [r1, #0x1a]
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #0x1a]
	ldr r2, _0801D42C @ =gIORegisters
	adds r2, #0x4a
	ldr r0, _0801D430 @ =0x0000FEFF
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _0801D434 @ =0x0000FBFF
	ands r0, r1
	ldr r1, _0801D438 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x13
	strh r0, [r1]
	movs r3, #0
	adds r6, r7, #0
	movs r2, #0
	ldr r1, _0801D43C @ =0x000003FF
_0801D344:
	adds r0, r7, r3
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _0801D344
	ldr r4, _0801D440 @ =0x040000D4
	str r6, [r4]
	ldr r0, _0801D444 @ =0x0600F000
	str r0, [r4, #4]
	ldr r0, _0801D448 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0
	movs r0, #1
	strh r0, [r5, #0x30]
	strh r1, [r5, #0x32]
	strh r1, [r5, #0x34]
	strh r1, [r5, #0x36]
	ldr r5, _0801D44C @ =gUnknown_08200308
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, r2
	ldr r6, _0801D450 @ =eBGDecompBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	str r6, [r4]
	ldr r0, _0801D454 @ =0x06004000
	str r0, [r4, #4]
	ldr r0, _0801D458 @ =0x80002000
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, #0x40
	str r5, [r4]
	ldr r0, _0801D45C @ =0x05000040
	str r0, [r4, #4]
	ldr r0, _0801D460 @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r3, #0
	movs r2, #2
	ldr r5, _0801D42C @ =gIORegisters
_0801D39C:
	movs r1, #7
	lsls r0, r2, #5
	adds r4, r0, r7
_0801D3A2:
	adds r0, r4, r1
	strb r3, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xe
	bls _0801D3A2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x11
	bls _0801D39C
	movs r3, #0x80
	movs r2, #2
_0801D3C4:
	movs r1, #0xf
	lsls r0, r2, #5
	adds r4, r2, #1
	adds r2, r0, r7
_0801D3CC:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x16
	bls _0801D3CC
	lsls r0, r4, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x11
	bls _0801D3C4
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldr r0, _0801D464 @ =0x00001741
	strh r0, [r1]
	ldr r0, _0801D468 @ =0x00005E86
	strh r0, [r5, #4]
	subs r1, #2
	ldr r0, _0801D46C @ =0x00001542
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801D470 @ =0x0000071F
	strh r0, [r1]
	str r2, [r5, #0x20]
	str r2, [r5, #0x24]
	strh r2, [r5, #0x18]
	strh r2, [r5, #0x1a]
	strh r2, [r5, #0x1c]
	strh r2, [r5, #0x1e]
	movs r0, #4
	mov r1, r8
	ldrb r1, [r1, #0x1a]
	orrs r0, r1
	mov r2, r8
	strb r0, [r2, #0x1a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D424: .4byte gMain
_0801D428: .4byte gBG2MapBuffer
_0801D42C: .4byte gIORegisters
_0801D430: .4byte 0x0000FEFF
_0801D434: .4byte 0x0000FBFF
_0801D438: .4byte 0x0000F7FF
_0801D43C: .4byte 0x000003FF
_0801D440: .4byte 0x040000D4
_0801D444: .4byte 0x0600F000
_0801D448: .4byte 0x80000400
_0801D44C: .4byte gUnknown_08200308
_0801D450: .4byte eBGDecompBuffer
_0801D454: .4byte 0x06004000
_0801D458: .4byte 0x80002000
_0801D45C: .4byte 0x05000040
_0801D460: .4byte 0x80000010
_0801D464: .4byte 0x00001741
_0801D468: .4byte 0x00005E86
_0801D46C: .4byte 0x00001542
_0801D470: .4byte 0x0000071F

	thumb_func_start sub_801D474
sub_801D474: @ 0x0801D474
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	ldrh r3, [r1, #0x32]
	ldr r7, _0801D540 @ =0x00000FFF
	ands r7, r3
	ldrh r0, [r1, #0x34]
	adds r0, #1
	strh r0, [r1, #0x34]
	adds r2, r1, #0
	adds r2, #0x46
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r2]
	cmp r0, r2
	bls _0801D4B0
	adds r0, r1, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r1, #0x32]
	movs r0, #0
	strh r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x48
	ldrh r2, [r1, #0x36]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1, #0x36]
_0801D4B0:
	movs r4, #0x80
	lsls r4, r4, #9
	ldrh r1, [r1, #0x36]
	orrs r4, r1
	adds r0, r7, #0
	bl sub_8006364
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	mov r8, r0
	adds r0, r7, #0
	bl sub_80063E4
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r7, #0
	bl sub_80063E4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	adds r0, r7, #0
	bl sub_8006364
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	mov r4, r8
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #3
	rsbs r3, r3, #0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #4
	subs r3, r3, r1
	movs r1, #0xf0
	lsls r1, r1, #7
	adds r3, r3, r1
	lsls r2, r5, #4
	subs r2, r2, r5
	lsls r2, r2, #3
	rsbs r2, r2, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	subs r2, r2, r1
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r2, r2, r4
	ldr r1, _0801D544 @ =gIORegisters
	mov r4, r8
	strh r4, [r1, #0x18]
	strh r6, [r1, #0x1a]
	strh r5, [r1, #0x1c]
	strh r0, [r1, #0x1e]
	str r3, [r1, #0x20]
	str r2, [r1, #0x24]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D540: .4byte 0x00000FFF
_0801D544: .4byte gIORegisters

	thumb_func_start sub_801D548
sub_801D548: @ 0x0801D548
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0801D564 @ =gIORegisters
	ldr r6, _0801D568 @ =gScriptContext
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _0801D55A
	b _0801D74C
_0801D55A:
	lsls r0, r0, #2
	ldr r1, _0801D56C @ =_0801D570
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D564: .4byte gIORegisters
_0801D568: .4byte gScriptContext
_0801D56C: .4byte _0801D570
_0801D570: @ jump table
	.4byte _0801D5A8 @ case 0
	.4byte _0801D5AC @ case 1
	.4byte _0801D5B4 @ case 2
	.4byte _0801D5B8 @ case 3
	.4byte _0801D5C0 @ case 4
	.4byte _0801D5C4 @ case 5
	.4byte _0801D5CC @ case 6
	.4byte _0801D600 @ case 7
	.4byte _0801D63C @ case 8
	.4byte _0801D670 @ case 9
	.4byte _0801D6A4 @ case 10
	.4byte _0801D6E2 @ case 11
	.4byte _0801D6F0 @ case 12
	.4byte _0801D72C @ case 13
_0801D5A8:
	movs r0, #0x6e
	b _0801D6E4
_0801D5AC:
	movs r0, #0x6e
	bl sub_801D7A0
	b _0801D6E8
_0801D5B4:
	movs r0, #0x6f
	b _0801D6E4
_0801D5B8:
	movs r0, #0x6f
	bl sub_801D7A0
	b _0801D6E8
_0801D5C0:
	movs r0, #0x70
	b _0801D6E4
_0801D5C4:
	movs r0, #0x70
	bl sub_801D7A0
	b _0801D6E8
_0801D5CC:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D5D8
	cmp r4, #1
	beq _0801D5F6
	b _0801D74C
_0801D5D8:
	movs r0, #0x6f
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D5F6:
	adds r0, r5, #0
	movs r1, #0x6f
	bl sub_801D7B8
	b _0801D74C
_0801D600:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D60C
	cmp r4, #1
	beq _0801D632
	b _0801D74C
_0801D60C:
	movs r0, #0x70
	bl sub_801D784
	movs r0, #0x70
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D632:
	adds r0, r5, #0
	movs r1, #0x70
	bl sub_801D818
	b _0801D74C
_0801D63C:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D648
	cmp r4, #1
	beq _0801D666
	b _0801D74C
_0801D648:
	movs r0, #0x70
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D666:
	adds r0, r5, #0
	movs r1, #0x70
	bl sub_801D7B8
	b _0801D74C
_0801D670:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D67C
	cmp r4, #1
	beq _0801D69A
	b _0801D74C
_0801D67C:
	movs r0, #0x6e
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D69A:
	adds r0, r5, #0
	movs r1, #0x6e
	bl sub_801D7B8
	b _0801D74C
_0801D6A4:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D6B0
	cmp r4, #1
	beq _0801D6D8
	b _0801D74C
_0801D6B0:
	movs r0, #0x71
	bl sub_801D784
	movs r0, #0x71
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
	b _0801D74C
_0801D6D8:
	adds r0, r5, #0
	movs r1, #0x71
	bl sub_801D818
	b _0801D74C
_0801D6E2:
	movs r0, #0x72
_0801D6E4:
	bl sub_801D784
_0801D6E8:
	adds r0, r5, #0
	bl op_proc_exit_iOS
	b _0801D74C
_0801D6F0:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D6FC
	cmp r4, #1
	beq _0801D722
	b _0801D74C
_0801D6FC:
	movs r0, #0x72
	bl sub_801D784
	movs r0, #0x72
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D722:
	adds r0, r5, #0
	movs r1, #0x72
	bl sub_801D818
	b _0801D74C
_0801D72C:
	movs r4, #0
_0801D72E:
	adds r0, r4, #0
	adds r0, #0x6e
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	cmp r2, #0
	beq _0801D740
	bl DestroyAnimation
_0801D740:
	adds r4, #1
	cmp r4, #5
	bls _0801D72E
	adds r0, r5, #0
	bl op_proc_exit_iOS
_0801D74C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
