	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_8016FEC
sub_8016FEC: @ 0x08016FEC
	push {r4, r5, r6, lr}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0xff
	ldr r6, _08017050 @ =gScriptContext
	ldr r1, _08017054 @ =gUnknown_08028624
	mov r0, sp
	movs r2, #0x40
	bl memcpy
	ldr r2, _08017058 @ =gAnimation+0x44
	cmp r4, #0
	beq _08017022
	cmp r2, #0
	beq _08017048
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _08017016
	cmp r0, #0x21
	bne _08017048
_08017016:
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08017048
_08017022:
	movs r1, #0
	ldr r0, [r2, #0x14]
	ldr r3, _0801705C @ =0xF7DB61F0
	adds r2, r0, r3
_0801702A:
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	cmp r2, r0
	bne _08017036
	adds r5, r1, #0
_08017036:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0801702A
	cmp r4, #0
	beq _08017060
	cmp r5, #0xff
	bne _08017060
_08017048:
	movs r0, #0
	bl sub_8016FEC
	b _08017148
	.align 2, 0
_08017050: .4byte gScriptContext
_08017054: .4byte gUnknown_08028624
_08017058: .4byte gAnimation+0x44
_0801705C: .4byte 0xF7DB61F0
_08017060:
	bl sub_8016FB4
	adds r2, r0, #0
	cmp r4, #0
	bne _08017070
	bl DestroyAnimation
	b _08017148
_08017070:
	cmp r4, #1
	bne _08017120
	movs r0, #0
	bl sub_8016FEC
	cmp r5, #0xe
	bne _08017080
	movs r5, #7
_08017080:
	cmp r5, #0xf
	bne _08017086
	movs r5, #0xe
_08017086:
	adds r0, r5, #0
	adds r0, #0x74
	bl PlayAnimation
	ldr r0, _08017100 @ =gMain
	ldrb r0, [r0, #8]
	cmp r0, #4
	bne _080170A2
	ldr r2, _08017104 @ =gAnimation+0x44
	ldrh r4, [r2, #0x10]
	bl sub_8016FB4
	adds r2, r0, #0
	strh r4, [r2, #0x10]
_080170A2:
	ldr r1, _08017108 @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _080170CE
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0xf0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080170CE
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2]
_080170CE:
	ldr r2, _08017104 @ =gAnimation+0x44
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080170EA
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0801710C @ =0x01000400
	orrs r0, r1
	str r0, [r2]
_080170EA:
	cmp r5, #0xc
	bne _08017110
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r2, [r1]
	ands r0, r2
	adds r0, #0xb
	strh r0, [r1]
	b _08017148
	.align 2, 0
_08017100: .4byte gMain
_08017104: .4byte gAnimation+0x44
_08017108: .4byte gScriptContext
_0801710C: .4byte 0x01000400
_08017110:
	adds r1, r6, #0
	adds r1, #0x4e
	ldrh r3, [r1]
	cmp r3, #6
	bne _08017148
	movs r0, #9
	strh r0, [r1]
	b _08017148
_08017120:
	cmp r4, #2
	bne _08017130
	ldr r0, [r2]
	ldr r1, _0801712C @ =0xDFFFFFFF
	ands r0, r1
	b _08017146
	.align 2, 0
_0801712C: .4byte 0xDFFFFFFF
_08017130:
	cmp r4, #3
	bne _0801713C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x16
	b _08017144
_0801713C:
	cmp r4, #4
	bne _08017148
	ldr r0, [r2]
	ldr r1, _08017150 @ =0x01000400
_08017144:
	orrs r0, r1
_08017146:
	str r0, [r2]
_08017148:
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017150: .4byte 0x01000400

	thumb_func_start sub_8017154
sub_8017154: @ 0x08017154
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _0801718C @ =gAnimation+0x44
	cmp r3, #0
	bne _08017162
	b _080174F2
_08017162:
	ldrb r0, [r3, #0xe]
	cmp r0, #0xb
	beq _0801716E
	cmp r0, #0x21
	beq _0801716E
	b _080174F2
_0801716E:
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _0801717C
	b _080174F2
_0801717C:
	cmp r2, #0xd
	bls _08017182
	b _080174F2
_08017182:
	lsls r0, r2, #2
	ldr r1, _08017190 @ =_08017194
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801718C: .4byte gAnimation+0x44
_08017190: .4byte _08017194
_08017194: @ jump table
	.4byte _080171CC @ case 0
	.4byte _08017260 @ case 1
	.4byte _080172CC @ case 2
	.4byte _08017338 @ case 3
	.4byte _080173F0 @ case 4
	.4byte _080174F2 @ case 5
	.4byte _080174F2 @ case 6
	.4byte _080174F2 @ case 7
	.4byte _080174F2 @ case 8
	.4byte _080174F2 @ case 9
	.4byte _080174F2 @ case 10
	.4byte _080174F2 @ case 11
	.4byte _08017470 @ case 12
	.4byte _080174B0 @ case 13
_080171CC:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080171EA
	ldr r0, _08017240 @ =0x06011C00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xe0
	strh r0, [r3, #0x3c]
_080171EA:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017208
	ldr r0, _08017244 @ =0x06011E00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xf0
	strh r0, [r3, #0x3c]
_08017208:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	bne _08017216
	b _080174F2
_08017216:
	ldr r2, _08017248 @ =0x06012D00
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _0801724C @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
	ldr r1, _08017250 @ =0x040000D4
	ldr r0, _08017254 @ =gGfxPressPresentButtons
	str r0, [r1]
	ldr r0, _08017258 @ =0x06013000
	str r0, [r1, #4]
	ldr r0, _0801725C @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080174F2
	.align 2, 0
_08017240: .4byte 0x06011C00
_08017244: .4byte 0x06011E00
_08017248: .4byte 0x06012D00
_0801724C: .4byte 0x000003FF
_08017250: .4byte 0x040000D4
_08017254: .4byte gGfxPressPresentButtons
_08017258: .4byte 0x06013000
_0801725C: .4byte 0x80000200
_08017260:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017284
	ldr r2, _080172BC @ =0x06013200
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _080172C0 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_08017284:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080172A8
	ldr r2, _080172C4 @ =0x06013000
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _080172C0 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_080172A8:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	bne _080172B6
	b _080174F2
_080172B6:
	ldr r2, _080172C8 @ =0x06012E00
	b _08017446
	.align 2, 0
_080172BC: .4byte 0x06013200
_080172C0: .4byte 0x000003FF
_080172C4: .4byte 0x06013000
_080172C8: .4byte 0x06012E00
_080172CC:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080172EA
	ldr r0, _0801732C @ =0x06011800
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xc0
	strh r0, [r3, #0x3c]
_080172EA:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017308
	ldr r0, _08017330 @ =0x06011A00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xd0
	strh r0, [r3, #0x3c]
_08017308:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	bne _08017316
	b _080174F2
_08017316:
	ldr r0, _08017334 @ =0x06011C00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xe0
	strh r0, [r3, #0x3c]
	b _080174F2
	.align 2, 0
_0801732C: .4byte 0x06011800
_08017330: .4byte 0x06011A00
_08017334: .4byte 0x06011C00
_08017338:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017356
	ldr r0, _080173C0 @ =0x06010000
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0
	strh r0, [r3, #0x3c]
_08017356:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017374
	ldr r0, _080173C4 @ =0x06010200
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x10
	strh r0, [r3, #0x3c]
_08017374:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	bne _08017382
	b _080174F2
_08017382:
	ldr r0, _080173C8 @ =0x06010400
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x20
	strh r0, [r3, #0x3c]
	ldr r1, _080173CC @ =0x040000D4
	ldr r0, _080173D0 @ =gGfx4bppInvestigationActions
	str r0, [r1]
	ldr r0, _080173D4 @ =0x06012000
	str r0, [r1, #4]
	ldr r0, _080173D8 @ =0x80000800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080173DC @ =gGfx4bppInvestigationScrollButton
	str r0, [r1]
	ldr r0, _080173E0 @ =0x06013000
	str r0, [r1, #4]
	ldr r2, _080173E4 @ =0x80000100
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080173E8 @ =gGfxExamineCursor
	str r0, [r1]
	ldr r0, _080173EC @ =0x06013200
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	b _080174F2
	.align 2, 0
_080173C0: .4byte 0x06010000
_080173C4: .4byte 0x06010200
_080173C8: .4byte 0x06010400
_080173CC: .4byte 0x040000D4
_080173D0: .4byte gGfx4bppInvestigationActions
_080173D4: .4byte 0x06012000
_080173D8: .4byte 0x80000800
_080173DC: .4byte gGfx4bppInvestigationScrollButton
_080173E0: .4byte 0x06013000
_080173E4: .4byte 0x80000100
_080173E8: .4byte gGfxExamineCursor
_080173EC: .4byte 0x06013200
_080173F0:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017414
	ldr r2, _08017460 @ =0x06012800
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _08017464 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_08017414:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017438
	ldr r2, _08017468 @ =0x06012880
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _08017464 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_08017438:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080174F2
	ldr r2, _0801746C @ =0x06012900
_08017446:
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _08017464 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
	b _080174F2
	.align 2, 0
_08017460: .4byte 0x06012800
_08017464: .4byte 0x000003FF
_08017468: .4byte 0x06012880
_0801746C: .4byte 0x06012900
_08017470:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017484
	ldr r0, [r3]
	ldr r1, _080174AC @ =0xDFFFFFFF
	ands r0, r1
	str r0, [r3]
_08017484:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _08017498
	ldr r0, [r3]
	ldr r1, _080174AC @ =0xDFFFFFFF
	ands r0, r1
	str r0, [r3]
_08017498:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080174F2
	ldr r0, [r3]
	ldr r1, _080174AC @ =0xDFFFFFFF
	ands r0, r1
	b _080174F0
	.align 2, 0
_080174AC: .4byte 0xDFFFFFFF
_080174B0:
	movs r0, #0x83
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080174C6
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
_080174C6:
	movs r0, #0x84
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080174DC
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
_080174DC:
	movs r0, #0x85
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	cmp r3, #0
	beq _080174F2
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
_080174F0:
	str r0, [r3]
_080174F2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80174F8
sub_80174F8: @ 0x080174F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	str r0, [sp, #0x80]
	adds r6, r3, #0
	ldr r0, [sp, #0xa4]
	ldr r3, [sp, #0xa8]
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r0, _0801757C @ =0x00000FFF
	ands r0, r1
	lsls r3, r0, #7
	ldr r0, _08017580 @ =gCharSet
	adds r3, r3, r0
	cmp r4, #0
	beq _0801758C
	ldr r0, _08017584 @ =0x040000D4
	str r3, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08017588 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	mov r2, sp
	lsls r0, r4, #1
	adds r3, r0, r4
	movs r4, #0
	movs r7, #0xf
	mov r8, r7
	movs r0, #0xf0
	mov ip, r0
	lsls r5, r3, #4
_0801754A:
	ldrb r1, [r2]
	adds r0, r1, #0
	mov r7, r8
	ands r0, r7
	mov r7, ip
	ands r1, r7
	cmp r0, #0
	beq _0801755C
	adds r0, r0, r3
_0801755C:
	cmp r1, #0
	beq _08017562
	adds r1, r1, r5
_08017562:
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	adds r4, #1
	cmp r4, #0x7f
	bls _0801754A
	ldr r0, _08017584 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r2, [sp, #0x80]
	str r2, [r0, #4]
	b _08017594
	.align 2, 0
_0801757C: .4byte 0x00000FFF
_08017580: .4byte gCharSet
_08017584: .4byte 0x040000D4
_08017588: .4byte 0x80000040
_0801758C:
	ldr r0, _080175D0 @ =0x040000D4
	str r3, [r0]
	ldr r7, [sp, #0x80]
	str r7, [r0, #4]
_08017594:
	ldr r1, _080175D4 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	cmp r6, #0
	beq _080175BE
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sb
	strh r0, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	add r0, sl
	strh r0, [r6, #2]
	ldr r1, [sp, #0x80]
	lsls r0, r1, #0x11
	lsrs r0, r0, #0x16
	movs r2, #0xd4
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r6, #4]
_080175BE:
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080175D0: .4byte 0x040000D4
_080175D4: .4byte 0x80000040

	thumb_func_start sub_80175D8
sub_80175D8: @ 0x080175D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xa0
	str r0, [sp, #0x80]
	str r3, [sp, #0x84]
	ldr r0, [sp, #0xc0]
	ldr r3, [sp, #0xc4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x88]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x8c]
	ldr r0, _08017654 @ =0x00000FFF
	ands r0, r1
	lsls r3, r0, #7
	ldr r0, _08017658 @ =gCharSet
	adds r3, r3, r0
	cmp r2, #0
	bne _0801760E
	b _0801792C
_0801760E:
	ldr r0, _0801765C @ =0x040000D4
	str r3, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08017660 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	mov sl, sp
	movs r2, #0xf
	mov sb, r2
	movs r4, #1
	add r4, ip
	mov r8, r4
	mov r7, sp
	str r7, [sp, #0x9c]
_0801762C:
	movs r5, #0
	ldr r0, [sp, #0x9c]
	ldr r3, [r0]
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r1, [sp, #0x9c]
	ldr r0, [r1, #4]
	lsrs r4, r0, #4
	movs r6, #0
	movs r2, #0
_08017640:
	adds r1, r3, #0
	mov r7, sb
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08017664
	mov r0, r8
	b _0801766A
	.align 2, 0
_08017654: .4byte 0x00000FFF
_08017658: .4byte gCharSet
_0801765C: .4byte 0x040000D4
_08017660: .4byte 0x80000040
_08017664:
	cmp r1, #0
	beq _0801766E
	mov r0, ip
_0801766A:
	lsls r0, r2
	orrs r5, r0
_0801766E:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _08017640
	ldr r0, [sp, #0x9c]
	stm r0!, {r5}
	str r0, [sp, #0x9c]
	mov r0, sl
	adds r0, #0x18
	ldr r1, [sp, #0x9c]
	cmp r1, r0
	bls _0801762C
	movs r7, #8
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x1c
	str r0, [sp, #0x90]
_08017694:
	lsls r1, r7, #2
	mov r4, sl
	adds r2, r1, r4
	ldr r3, [r2]
	adds r0, r3, #0
	movs r4, #0xf
	ands r0, r4
	str r1, [sp, #0x98]
	cmp r0, #0
	beq _080176BA
	adds r4, r2, #0
	subs r4, #0x20
	ldr r5, [r4]
	ldr r0, _08017700 @ =0x0FFFFFFF
	ands r5, r0
	mov r1, ip
	lsls r0, r1, #0x1c
	orrs r5, r0
	str r5, [r4]
_080176BA:
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r4, [r2, #4]
	adds r0, r4, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080176DA
	adds r0, r2, #0
	subs r0, #0x20
	ldr r5, [r0]
	ldr r2, _08017700 @ =0x0FFFFFFF
	ands r5, r2
	ldr r1, [sp, #0x90]
	orrs r5, r1
	str r5, [r0]
_080176DA:
	lsrs r4, r4, #4
	movs r5, #0
	movs r6, #0
	adds r7, #1
	mov r8, r7
	movs r7, #0xf
	movs r2, #1
	add r2, ip
	mov sb, r2
	movs r2, #0
_080176EE:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08017704
	mov r0, sb
	b _0801770A
	.align 2, 0
_08017700: .4byte 0x0FFFFFFF
_08017704:
	cmp r1, #0
	beq _0801770E
	mov r0, ip
_0801770A:
	lsls r0, r2
	orrs r5, r0
_0801770E:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _080176EE
	ldr r0, [sp, #0x98]
	add r0, sl
	str r5, [r0]
	mov r7, r8
	cmp r7, #0xe
	bls _08017694
	movs r5, #0
	mov r4, sl
	ldr r3, [r4, #0x1c]
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r0, [r4, #0x40]
	lsrs r4, r0, #4
	movs r6, #0
	movs r7, #0xf
	movs r0, #1
	add r0, ip
	mov r8, r0
	movs r2, #0
_08017740:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08017750
	mov r0, r8
	b _08017756
_08017750:
	cmp r1, #0
	beq _0801775A
	mov r0, ip
_08017756:
	lsls r0, r2
	orrs r5, r0
_0801775A:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _08017740
	mov r1, sl
	str r5, [r1, #0x1c]
	movs r7, #0x10
	movs r2, #1
	add r2, ip
	mov sb, r2
_08017772:
	movs r5, #0
	lsls r2, r7, #2
	mov r4, sl
	adds r1, r2, r4
	ldr r3, [r1]
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r0, [r1, #4]
	lsrs r4, r0, #4
	movs r6, #0
	str r2, [sp, #0x98]
	adds r7, #1
	mov r8, r7
	movs r2, #0
_0801778E:
	adds r1, r3, #0
	movs r7, #0xf
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _080177A0
	mov r0, sb
	b _080177A6
_080177A0:
	cmp r1, #0
	beq _080177AA
	mov r0, ip
_080177A6:
	lsls r0, r2
	orrs r5, r0
_080177AA:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _0801778E
	ldr r0, [sp, #0x98]
	add r0, sl
	str r5, [r0]
	mov r7, r8
	cmp r7, #0x16
	bls _08017772
	mov r0, sl
	ldr r3, [r0, #0x5c]
	lsrs r0, r3, #4
	orrs r3, r0
	movs r5, #0
	movs r6, #0
	mov r1, sl
	ldr r4, [r1, #0x1c]
	ldr r7, [r1, #0x60]
	ldr r2, [r1, #0x3c]
	mov r8, r2
	movs r2, #0xf
_080177DA:
	adds r1, r3, #0
	ands r1, r2
	cmp r1, #0
	beq _080177EA
	lsls r1, r6, #2
	mov r0, ip
	lsls r0, r1
	orrs r5, r0
_080177EA:
	lsrs r3, r3, #4
	adds r6, #1
	cmp r6, #7
	bls _080177DA
	mov r0, sl
	str r5, [r0, #0x5c]
	adds r3, r4, #0
	adds r4, r7, #0
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	beq _08017812
	ldr r5, _08017838 @ =0x0FFFFFFF
	ands r5, r3
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x1c
	orrs r5, r0
	mov r1, sl
	str r5, [r1, #0x1c]
_08017812:
	lsrs r4, r4, #4
	movs r5, #0
	mov r2, r8
	lsrs r3, r2, #4
	orrs r3, r2
	movs r6, #0
	movs r7, #0xf
	movs r0, #1
	add r0, ip
	mov r8, r0
	movs r2, #0
_08017828:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _0801783C
	mov r0, r8
	b _08017842
	.align 2, 0
_08017838: .4byte 0x0FFFFFFF
_0801783C:
	cmp r1, #0
	beq _08017846
	mov r0, ip
_08017842:
	lsls r0, r2
	orrs r5, r0
_08017846:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _08017828
	mov r1, sl
	str r5, [r1, #0x3c]
	movs r7, #0x18
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x1c
	str r0, [sp, #0x94]
_08017860:
	lsls r1, r7, #2
	mov r4, sl
	adds r2, r1, r4
	ldr r3, [r2]
	adds r0, r3, #0
	movs r4, #0xf
	ands r0, r4
	str r1, [sp, #0x98]
	cmp r0, #0
	beq _08017886
	adds r4, r2, #0
	subs r4, #0x20
	ldr r5, [r4]
	ldr r0, _080178CC @ =0x0FFFFFFF
	ands r5, r0
	mov r1, ip
	lsls r0, r1, #0x1c
	orrs r5, r0
	str r5, [r4]
_08017886:
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r4, [r2, #4]
	adds r0, r4, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080178A6
	adds r0, r2, #0
	subs r0, #0x20
	ldr r5, [r0]
	ldr r2, _080178CC @ =0x0FFFFFFF
	ands r5, r2
	ldr r1, [sp, #0x94]
	orrs r5, r1
	str r5, [r0]
_080178A6:
	lsrs r4, r4, #4
	movs r5, #0
	movs r6, #0
	adds r7, #1
	mov r8, r7
	movs r7, #0xf
	movs r2, #1
	add r2, ip
	mov sb, r2
	movs r2, #0
_080178BA:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _080178D0
	mov r0, sb
	b _080178D6
	.align 2, 0
_080178CC: .4byte 0x0FFFFFFF
_080178D0:
	cmp r1, #0
	beq _080178DA
	mov r0, ip
_080178D6:
	lsls r0, r2
	orrs r5, r0
_080178DA:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _080178BA
	ldr r0, [sp, #0x98]
	add r0, sl
	str r5, [r0]
	mov r7, r8
	cmp r7, #0x1e
	bls _08017860
	mov r4, sl
	ldr r3, [r4, #0x7c]
	lsrs r0, r3, #4
	orrs r3, r0
	movs r5, #0
	movs r6, #0
	movs r2, #0xf
_08017900:
	adds r1, r3, #0
	ands r1, r2
	cmp r1, #0
	beq _08017910
	lsls r1, r6, #2
	mov r0, ip
	lsls r0, r1
	orrs r5, r0
_08017910:
	lsrs r3, r3, #4
	adds r6, #1
	cmp r6, #7
	bls _08017900
	mov r7, sl
	str r5, [r7, #0x7c]
	ldr r0, _08017928 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r2, [sp, #0x80]
	str r2, [r0, #4]
	b _08017934
	.align 2, 0
_08017928: .4byte 0x040000D4
_0801792C:
	ldr r0, _08017978 @ =0x040000D4
	str r3, [r0]
	ldr r4, [sp, #0x80]
	str r4, [r0, #4]
_08017934:
	ldr r1, _0801797C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r7, [sp, #0x84]
	cmp r7, #0
	beq _08017968
	ldr r1, [sp, #0x8c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	strh r0, [r7]
	ldr r4, [sp, #0x88]
	movs r7, #0x80
	lsls r7, r7, #7
	adds r0, r4, r7
	ldr r1, [sp, #0x84]
	strh r0, [r1, #2]
	ldr r2, [sp, #0x80]
	lsls r0, r2, #0x11
	lsrs r0, r0, #0x16
	movs r4, #0xd4
	lsls r4, r4, #8
	adds r1, r4, #0
	adds r0, r0, r1
	ldr r7, [sp, #0x84]
	strh r0, [r7, #4]
_08017968:
	add sp, #0xa0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017978: .4byte 0x040000D4
_0801797C: .4byte 0x80000040

	thumb_func_start sub_8017980
sub_8017980: @ 0x08017980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r1, [sp, #8]
	adds r5, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x40]
	mov sl, r1
	str r5, [sp, #0x10]
	movs r2, #0
	mov sb, r2
	movs r6, #0
	movs r3, #8
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x3c]
	lsls r0, r0, #2
	ldr r1, _08017A0C @ =gUnknown_08270938
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, _08017A10 @ =gUnknown_08270934
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, #0x45
	beq _08017A68
	ldr r3, [sp, #0x38]
	lsls r3, r3, #0x10
	str r3, [sp, #0x14]
_080179BC:
	cmp r0, #0x80
	bls _08017A14
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldrh r1, [r4]
	subs r1, #0x80
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	mov r3, r8
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	ldr r3, [sp, #0x14]
	lsrs r2, r3, #0x10
	adds r3, r7, #0
	bl sub_80175D8
	adds r5, #0xe
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #1
	add r1, sl
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	cmp r7, #0
	beq _08017A60
	adds r7, #8
	b _08017A60
	.align 2, 0
_08017A0C: .4byte gUnknown_08270938
_08017A10: .4byte gUnknown_08270934
_08017A14:
	cmp r0, #0x2e
	bne _08017A1E
	ldr r5, [sp, #0x10]
	movs r1, #0x12
	add r8, r1
_08017A1E:
	cmp r0, #0xc
	bne _08017A38
	adds r4, #2
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r4]
	movs r3, #0x80
	lsls r3, r3, #8
	b _08017A5C
_08017A38:
	cmp r0, #0xb
	bne _08017A44
	adds r4, #2
	ldrh r0, [r4]
	str r0, [sp, #0xc]
	b _08017A60
_08017A44:
	cmp r0, #0x20
	bne _08017A60
	adds r4, #2
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r4]
	movs r3, #0x80
	lsls r3, r3, #7
_08017A5C:
	adds r1, r2, r3
	strh r1, [r0]
_08017A60:
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, #0x45
	bne _080179BC
_08017A68:
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldr r3, [sp, #0x38]
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	mov r3, r8
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0xff
	adds r3, r7, #0
	bl sub_80174F8
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #1
	add r1, sl
	ldr r2, _08017AB0 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	adds r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017AB0: .4byte 0x0000FFFF

	thumb_func_start sub_8017AB4
sub_8017AB4: @ 0x08017AB4
	push {lr}
	ldr r1, _08017ACC @ =gScriptContext
	adds r1, #0x44
	strh r0, [r1]
	subs r0, #1
	cmp r0, #0x10
	bhi _08017B9C
	lsls r0, r0, #2
	ldr r1, _08017AD0 @ =_08017AD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017ACC: .4byte gScriptContext
_08017AD0: .4byte _08017AD4
_08017AD4: @ jump table
	.4byte _08017B44 @ case 0
	.4byte _08017B9C @ case 1
	.4byte _08017B18 @ case 2
	.4byte _08017B34 @ case 3
	.4byte _08017B34 @ case 4
	.4byte _08017B34 @ case 5
	.4byte _08017B34 @ case 6
	.4byte _08017B34 @ case 7
	.4byte _08017B18 @ case 8
	.4byte _08017B34 @ case 9
	.4byte _08017B34 @ case 10
	.4byte _08017B34 @ case 11
	.4byte _08017B34 @ case 12
	.4byte _08017B34 @ case 13
	.4byte _08017B44 @ case 14
	.4byte _08017B60 @ case 15
	.4byte _08017B7C @ case 16
_08017B18:
	ldr r1, _08017B2C @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017B30 @ =gMain
	movs r1, #0xa0
	bl sub_8018CA8
	b _08017B8C
	.align 2, 0
_08017B2C: .4byte gUnknown_02011FC0
_08017B30: .4byte gMain
_08017B34:
	ldr r1, _08017B40 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	b _08017B9C
	.align 2, 0
_08017B40: .4byte gUnknown_02011FC0
_08017B44:
	ldr r1, _08017B58 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017B5C @ =gMain
	movs r1, #0x90
	bl sub_8018CA8
	b _08017B8C
	.align 2, 0
_08017B58: .4byte gUnknown_02011FC0
_08017B5C: .4byte gMain
_08017B60:
	ldr r1, _08017B74 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017B78 @ =gMain
	movs r1, #0xb0
	bl sub_8018CA8
	b _08017B8C
	.align 2, 0
_08017B74: .4byte gUnknown_02011FC0
_08017B78: .4byte gMain
_08017B7C:
	ldr r1, _08017BA0 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017BA4 @ =gMain
	movs r1, #0xa0
	bl sub_8018CA8
_08017B8C:
	ldr r0, _08017BA4 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	bl sub_8007610
	movs r0, #0x80
	bl ChangeScriptSection
_08017B9C:
	pop {r0}
	bx r0
	.align 2, 0
_08017BA0: .4byte gUnknown_02011FC0
_08017BA4: .4byte gMain

	thumb_func_start sub_8017BA8
sub_8017BA8: @ 0x08017BA8
	movs r1, #0
	ldr r0, _08017BBC @ =gScriptContext
	movs r2, #0
	adds r0, #0x18
_08017BB0:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #1
	bls _08017BB0
	bx lr
	.align 2, 0
_08017BBC: .4byte gScriptContext

	thumb_func_start sub_8017BC0
sub_8017BC0: @ 0x08017BC0
	push {r4, r5, lr}
	movs r4, #0x10
	ldr r0, _08017C2C @ =gScriptContext
	ldr r2, [r0]
	adds r1, r0, #0
	adds r1, #0x29
	mov ip, r0
	ldrb r1, [r1]
	cmp r1, #2
	bhi _08017C68
	ldr r5, _08017C30 @ =gUnknown_0802845E
_08017BD6:
	ldrh r0, [r2]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #0x7f
	bhi _08017C34
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08017C3E
	cmp r1, #7
	beq _08017C3E
	cmp r1, #8
	beq _08017C3E
	cmp r1, #9
	beq _08017C3E
	cmp r1, #0xa
	beq _08017C3E
	cmp r1, #0xd
	beq _08017C3E
	cmp r1, #0x15
	beq _08017C3E
	cmp r1, #0x2a
	beq _08017C3E
	cmp r1, #0x2d
	beq _08017C3E
	cmp r1, #0x2e
	beq _08017C3E
	cmp r1, #0x45
	beq _08017C3E
	adds r1, r3, #0
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0
	cmp r0, r1
	bhs _08017C3A
_08017C20:
	adds r2, #2
	adds r0, #1
	cmp r0, r1
	blo _08017C20
	b _08017C3A
	.align 2, 0
_08017C2C: .4byte gScriptContext
_08017C30: .4byte gUnknown_0802845E
_08017C34:
	subs r4, #1
	cmp r4, #0
	beq _08017C3E
_08017C3A:
	adds r2, #2
	b _08017BD6
_08017C3E:
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017C58
	adds r0, r3, #0
	cmp r0, #1
	beq _08017C52
	cmp r0, #0x2e
	bne _08017C58
_08017C52:
	movs r0, #1
	mov r1, ip
	strh r0, [r1, #0x1a]
_08017C58:
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x18
	adds r0, r0, r1
	strh r4, [r0]
_08017C68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8017C70
sub_8017C70: @ 0x08017C70
	ldr r1, _08017CA0 @ =gUnknown_0802845E
	ldr r3, _08017CA4 @ =gScriptContext
	ldrh r2, [r3, #0xa]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #0
	bne _08017C86
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
_08017C86:
	movs r0, #0
	cmp r0, r2
	bhs _08017C9C
	ldr r1, [r3]
_08017C8E:
	adds r1, #2
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r2
	blo _08017C8E
	str r1, [r3]
_08017C9C:
	movs r0, #0
	bx lr
	.align 2, 0
_08017CA0: .4byte gUnknown_0802845E
_08017CA4: .4byte gScriptContext

	thumb_func_start sub_8017CA8
sub_8017CA8: @ 0x08017CA8
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r5, [r0]
	adds r4, r1, #0
	ands r4, r5
	ands r2, r5
	adds r4, r4, r3
	ands r4, r1
	adds r2, r2, r4
	strh r2, [r0]
	strh r2, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8017CD0
sub_8017CD0: @ 0x08017CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08017D74 @ =gScriptContext
	movs r0, #4
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _08017CEA
	b _08017EE2
_08017CEA:
	ldr r0, _08017D78 @ =gMain
	ldrb r0, [r0, #8]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08017CFA
	b _08017EE2
_08017CFA:
	ldr r6, _08017D7C @ =gOamObjects+0x1C8
	movs r5, #0
	mov sl, r5
	ldr r5, _08017D80 @ =gUnknown_03003AF0
	mov r8, r1
	movs r7, #0
	ldr r0, _08017D84 @ =0x000001FF
	mov sb, r0
_08017D0A:
	adds r2, r7, r5
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08017D14
	b _08017ECC
_08017D14:
	ldrh r4, [r6, #2]
	mov r1, sb
	ands r4, r1
	ldrb r3, [r6]
	ldrh r0, [r2, #8]
	strh r0, [r6]
	ldrh r0, [r2, #0xa]
	strh r0, [r6, #2]
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _08017D3E
	ldrb r1, [r2, #2]
	adds r1, #1
	movs r0, #0x1f
	ands r1, r0
	strb r1, [r2, #2]
	cmp r1, #0xf
	bhi _08017D3E
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
_08017D3E:
	adds r2, r7, r5
	ldrb r5, [r2, #5]
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _08017D4C
	b _08017E7C
_08017D4C:
	ldrb r0, [r2, #4]
	cmp r0, #4
	beq _08017D88
	ldrb r4, [r2, #3]
	ldrb r0, [r2, #7]
	adds r1, r4, r0
	strb r1, [r2, #7]
	ldrb r3, [r2, #6]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	blo _08017E00
	subs r0, r1, r3
	subs r0, r4, r0
	strb r0, [r2, #3]
	movs r0, #0xfd
	ands r0, r5
	strb r0, [r2, #5]
	b _08017E00
	.align 2, 0
_08017D74: .4byte gScriptContext
_08017D78: .4byte gMain
_08017D7C: .4byte gOamObjects+0x1C8
_08017D80: .4byte gUnknown_03003AF0
_08017D84: .4byte 0x000001FF
_08017D88:
	mov r0, r8
	adds r0, #0x46
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, r8
	adds r0, #0x48
	ldrh r0, [r0]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _08017E14 @ =gUnknown_0300712A
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08017DDC
	movs r0, #0xfd
	ldrb r5, [r2, #5]
	ands r0, r5
	strb r0, [r2, #5]
	movs r0, #0xff
	lsls r0, r0, #8
	adds r1, r0, #0
	ldrh r5, [r2, #8]
	ands r1, r5
	movs r0, #0xff
	ands r0, r3
	orrs r1, r0
	strh r1, [r2, #8]
	movs r0, #0xfe
	lsls r0, r0, #8
	adds r1, r0, #0
	ldrh r5, [r2, #0xa]
	ands r1, r5
	adds r0, r4, #0
	mov r5, sb
	ands r0, r5
	orrs r1, r0
	strh r1, [r2, #0xa]
_08017DDC:
	movs r0, #0xff
	lsls r0, r0, #8
	adds r1, r0, #0
	ldrh r2, [r6]
	ands r1, r2
	movs r0, #0xff
	ands r3, r0
	orrs r1, r3
	strh r1, [r6]
	movs r5, #0xfe
	lsls r5, r5, #8
	adds r0, r5, #0
	ldrh r1, [r6, #2]
	ands r0, r1
	mov r2, sb
	ands r4, r2
	orrs r0, r4
	strh r0, [r6, #2]
_08017E00:
	ldr r0, _08017E18 @ =gUnknown_03003AF0
	adds r2, r7, r0
	ldrb r1, [r2, #4]
	cmp r1, #1
	beq _08017E34
	cmp r1, #1
	bgt _08017E1C
	cmp r1, #0
	beq _08017E26
	b _08017E7C
	.align 2, 0
_08017E14: .4byte gUnknown_0300712A
_08017E18: .4byte gUnknown_03003AF0
_08017E1C:
	cmp r1, #2
	beq _08017E48
	cmp r1, #3
	beq _08017E68
	b _08017E7C
_08017E26:
	adds r0, #8
	adds r0, r7, r0
	ldrb r2, [r2, #3]
	rsbs r3, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	b _08017E3A
_08017E34:
	adds r0, #8
	adds r0, r7, r0
	ldrb r3, [r2, #3]
_08017E3A:
	str r6, [sp]
	movs r1, #0xff
	movs r2, #0xff
	lsls r2, r2, #8
	bl sub_8017CA8
	b _08017E7C
_08017E48:
	adds r0, #0xa
	adds r0, r7, r0
	ldrb r2, [r2, #3]
	rsbs r3, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r1, r6, #2
	str r1, [sp]
	ldr r1, _08017E64 @ =0x000001FF
	movs r2, #0xfe
	lsls r2, r2, #8
	bl sub_8017CA8
	b _08017E7C
	.align 2, 0
_08017E64: .4byte 0x000001FF
_08017E68:
	adds r0, #0xa
	adds r0, r7, r0
	ldrb r3, [r2, #3]
	adds r1, r6, #2
	str r1, [sp]
	ldr r1, _08017EC0 @ =0x000001FF
	movs r2, #0xfe
	lsls r2, r2, #8
	bl sub_8017CA8
_08017E7C:
	ldr r1, _08017EC4 @ =gUnknown_03003AF0
	adds r3, r7, r1
	movs r0, #4
	ldrb r5, [r3, #5]
	ands r0, r5
	adds r5, r1, #0
	cmp r0, #0
	beq _08017E92
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
_08017E92:
	ldrh r0, [r3, #0xe]
	subs r0, #0x39
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _08017ED2
	ldr r2, _08017EC8 @ =gOamObjects
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r1, [r3, #8]
	strh r1, [r0]
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r1, [r3, #0xa]
	strh r1, [r0, #2]
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r1, [r3, #0xc]
	strh r1, [r0, #4]
	b _08017ED2
	.align 2, 0
_08017EC0: .4byte 0x000001FF
_08017EC4: .4byte gUnknown_03003AF0
_08017EC8: .4byte gOamObjects
_08017ECC:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
_08017ED2:
	adds r6, #8
	adds r7, #0x14
	movs r2, #1
	add sl, r2
	mov r0, sl
	cmp r0, #7
	bhi _08017EE2
	b _08017D0A
_08017EE2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8017EF4
sub_8017EF4: @ 0x08017EF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _08017F30 @ =gScriptContext
	ldrh r0, [r3, #0xa]
	cmp r0, r4
	beq _08017F2A
	cmp r4, #0xc
	beq _08017F0C
	ldr r0, _08017F34 @ =0x00007FFF
	ldrh r1, [r3, #0x1c]
	ands r0, r1
	strh r0, [r3, #0x1c]
_08017F0C:
	ldrh r0, [r3, #0x12]
	movs r1, #0
	strh r0, [r3, #0x14]
	strh r1, [r3, #0x12]
	ldr r0, _08017F38 @ =gUnknown_08028288
	lsls r1, r4, #1
	adds r0, r1, r0
	ldrh r2, [r0]
	strh r2, [r3, #0x12]
	ldr r0, _08017F3C @ =gUnknown_08028370
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r3, #0x12]
	strh r4, [r3, #0xa]
_08017F2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017F30: .4byte gScriptContext
_08017F34: .4byte 0x00007FFF
_08017F38: .4byte gUnknown_08028288
_08017F3C: .4byte gUnknown_08028370

	thumb_func_start sub_8017F40
sub_8017F40: @ 0x08017F40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xac
	str r0, [sp, #0x94]
	adds r7, r1, #0
	mov sb, r2
	add r2, sp, #0x80
	adds r1, r2, #0
	ldr r0, _08017F90 @ =gUnknown_08028664
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	str r7, [sp, #0x98]
	ldr r1, _08017F94 @ =gScriptContext
	movs r0, #4
	ldrh r5, [r1, #0x1c]
	ands r0, r5
	adds r3, r2, #0
	mov r8, r1
	cmp r0, #0
	beq _08017FBC
	movs r5, #0x20
	ldr r2, _08017F98 @ =gUnknown_03003E50
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08017F9C
	movs r1, #0
	str r1, [sp, #0x98]
	b _08017FBC
	.align 2, 0
_08017F90: .4byte gUnknown_08028664
_08017F94: .4byte gScriptContext
_08017F98: .4byte gUnknown_03003E50
_08017F9C:
	adds r5, #1
	cmp r5, #0x3f
	bhi _08017FBC
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r2, _08017FDC @ =gUnknown_03003E50
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08017F9C
	subs r5, #0x20
	str r5, [sp, #0x98]
_08017FBC:
	ldr r4, [sp, #0x98]
	lsls r0, r4, #7
	ldr r5, _08017FE0 @ =0x06010000
	adds r5, r5, r0
	mov sl, r5
	movs r0, #4
	mov r1, r8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _08017FE4
	movs r2, #0x80
	lsls r2, r2, #5
	add sl, r2
	b _08017FEA
	.align 2, 0
_08017FDC: .4byte gUnknown_03003E50
_08017FE0: .4byte 0x06010000
_08017FE4:
	mov r4, sb
	lsls r0, r4, #0xb
	add sl, r0
_08017FEA:
	ldr r5, [sp, #0x94]
	lsls r6, r5, #7
	ldr r0, _08018090 @ =gCharSet
	adds r6, r6, r0
	mov r1, r8
	adds r1, #0x22
	movs r0, #0x20
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08018038
	movs r5, #0
	ldr r0, [r3]
	cmp r0, r7
	bhi _08018018
	adds r2, r3, #0
_0801800A:
	adds r2, #4
	adds r5, #1
	cmp r5, #4
	bhi _08018018
	ldr r0, [r2]
	cmp r0, r7
	bls _0801800A
_08018018:
	cmp r5, #5
	bne _0801801E
	b _0801829E
_0801801E:
	cmp r5, #0
	bne _08018024
	movs r5, #5
_08018024:
	movs r1, #5
	subs r1, r1, r5
	lsls r1, r1, #4
	mov r2, r8
	adds r2, #0x25
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	orrs r1, r0
	strb r1, [r2]
_08018038:
	mov r3, r8
	adds r3, #0x25
	ldrb r1, [r3]
	cmp r1, #0
	bne _08018044
	b _08018140
_08018044:
	movs r0, #0xf0
	ands r0, r1
	lsls r2, r0, #0x18
	cmp r2, #0
	beq _080180D2
	ldr r0, _08018094 @ =0x040000D4
	str r6, [r0]
	mov r4, sp
	str r4, [r0, #4]
	ldr r1, _08018098 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	lsrs r6, r2, #0x1c
	movs r5, #0
	lsls r0, r7, #3
	str r0, [sp, #0xa0]
	mov r1, sb
	lsls r1, r1, #3
	str r1, [sp, #0xa4]
	lsls r2, r7, #2
	str r2, [sp, #0x9c]
	mov r3, sb
	lsls r3, r3, #6
	str r3, [sp, #0xa8]
	adds r0, r6, #0
	movs r1, #5
	bl __umodsi3
	adds r3, r0, #0
_0801807E:
	ldrb r1, [r4]
	movs r2, #0xf
	ands r2, r1
	movs r0, #0xf0
	ands r1, r0
	cmp r2, #3
	bne _0801809C
	adds r2, r6, #0
	b _080180AC
	.align 2, 0
_08018090: .4byte gCharSet
_08018094: .4byte 0x040000D4
_08018098: .4byte 0x80000040
_0801809C:
	cmp r2, #2
	bne _080180AA
	movs r2, #0
	cmp r3, #1
	beq _080180AC
	subs r2, r6, #1
	b _080180AC
_080180AA:
	movs r2, #0
_080180AC:
	cmp r1, #0x30
	bne _080180B4
	lsls r1, r6, #4
	b _080180C4
_080180B4:
	cmp r1, #0x20
	bne _080180C2
	cmp r3, #1
	beq _080180C2
	subs r0, r6, #1
	lsls r1, r0, #4
	b _080180C4
_080180C2:
	movs r1, #0
_080180C4:
	orrs r2, r1
	strb r2, [r4]
	adds r4, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _0801807E
	b _08018126
_080180D2:
	ldr r0, _08018138 @ =0x040000D4
	str r6, [r0]
	mov r4, sp
	str r4, [r0, #4]
	ldr r1, _0801813C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldrb r5, [r3]
	lsls r0, r5, #1
	adds r6, r0, r5
	movs r5, #0
	lsls r0, r7, #3
	str r0, [sp, #0xa0]
	mov r1, sb
	lsls r1, r1, #3
	str r1, [sp, #0xa4]
	lsls r2, r7, #2
	str r2, [sp, #0x9c]
	mov r3, sb
	lsls r3, r3, #6
	str r3, [sp, #0xa8]
	movs r0, #0xf
	mov ip, r0
	lsls r0, r6, #4
_08018102:
	ldrb r1, [r4]
	adds r2, r1, #0
	mov r3, ip
	ands r2, r3
	movs r3, #0xf0
	ands r1, r3
	cmp r2, #0
	beq _08018114
	adds r2, r2, r6
_08018114:
	cmp r1, #0
	beq _0801811A
	adds r1, r1, r0
_0801811A:
	orrs r2, r1
	strb r2, [r4]
	adds r4, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _08018102
_08018126:
	ldr r0, _08018138 @ =0x040000D4
	mov r4, sp
	str r4, [r0]
	mov r5, sl
	str r5, [r0, #4]
	ldr r1, _0801813C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _08018162
	.align 2, 0
_08018138: .4byte 0x040000D4
_0801813C: .4byte 0x80000040
_08018140:
	ldr r0, _08018188 @ =0x040000D4
	str r6, [r0]
	mov r1, sl
	str r1, [r0, #4]
	ldr r1, _0801818C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	lsls r2, r7, #3
	str r2, [sp, #0xa0]
	mov r3, sb
	lsls r3, r3, #3
	str r3, [sp, #0xa4]
	lsls r4, r7, #2
	str r4, [sp, #0x9c]
	mov r5, sb
	lsls r5, r5, #6
	str r5, [sp, #0xa8]
_08018162:
	movs r0, #4
	mov r1, r8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _080181B8
	movs r5, #0x20
	ldr r2, _08018190 @ =gUnknown_03003E50
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08018194
	movs r6, #0x20
	b _080181BE
	.align 2, 0
_08018188: .4byte 0x040000D4
_0801818C: .4byte 0x80000040
_08018190: .4byte gUnknown_03003E50
_08018194:
	adds r5, #1
	cmp r5, #0x3f
	bhi _080181BE
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r4, _080181B4 @ =gUnknown_03003E50
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08018194
	adds r6, r5, #0
	b _080181BE
	.align 2, 0
_080181B4: .4byte gUnknown_03003E50
_080181B8:
	mov r5, sb
	lsls r0, r5, #4
	adds r6, r7, r0
_080181BE:
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r2, _08018208 @ =gUnknown_03003E50
	adds r4, r0, r2
	ldr r3, [sp, #0xa0]
	subs r5, r3, r7
	lsls r0, r5, #1
	movs r7, #0
	strh r0, [r4, #4]
	ldr r0, [sp, #0xa4]
	add r0, sb
	lsls r0, r0, #1
	strh r0, [r4, #6]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ldr r2, [sp, #0x94]
	orrs r2, r0
	orrs r2, r7
	strh r2, [r4]
	mov r3, r8
	adds r3, #0x22
	movs r0, #0xf0
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0x10
	bne _0801820C
	movs r3, #0x80
	lsls r3, r3, #7
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r4]
	lsls r0, r5, #2
	strh r0, [r4, #4]
	b _08018212
	.align 2, 0
_08018208: .4byte gUnknown_03003E50
_0801820C:
	ldr r0, _080182B0 @ =0x0000BFFF
	ands r2, r0
	strh r2, [r4]
_08018212:
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r4, _080182B4 @ =gUnknown_03003E50
	adds r2, r0, r4
	ldr r5, [sp, #0x9c]
	ldr r7, [sp, #0xa8]
	adds r0, r5, r7
	strh r0, [r2, #2]
	mov r3, r8
	adds r3, #0x25
	movs r0, #0xf0
	ldrb r4, [r3]
	ands r0, r4
	cmp r0, #0
	beq _08018238
	movs r5, #0x80
	lsls r5, r5, #8
	adds r0, r5, #0
	orrs r0, r4
_08018238:
	strh r0, [r2, #8]
	movs r5, #4
	adds r0, r5, #0
	mov r7, r8
	ldrh r7, [r7, #0x1c]
	ands r0, r7
	cmp r0, #0
	beq _08018284
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r3, _080182B4 @ =gUnknown_03003E50
	adds r2, r0, r3
	ldrh r3, [r2, #4]
	adds r3, #0xe
	strh r3, [r2, #4]
	ldrh r4, [r2, #6]
	adds r4, #0x24
	strh r4, [r2, #6]
	ldr r7, [sp, #0x98]
	lsls r0, r7, #2
	adds r0, #0x80
	strh r0, [r2, #2]
	adds r0, r5, #0
	mov r5, r8
	ldrh r5, [r5, #0x1c]
	ands r0, r5
	cmp r0, #0
	beq _08018284
	mov r0, r8
	adds r0, #0x4c
	ldrb r0, [r0]
	adds r0, r0, r3
	strh r0, [r2, #4]
	mov r0, r8
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r0, r4
	strh r0, [r2, #6]
_08018284:
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r7, _080182B4 @ =gUnknown_03003E50
	adds r0, r0, r7
	ldrh r2, [r0, #2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r2, r3
	strh r1, [r0, #2]
	mov r1, r8
	adds r1, #0x25
	ldrb r1, [r1]
	strb r1, [r0, #0xa]
_0801829E:
	add sp, #0xac
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080182B0: .4byte 0x0000BFFF
_080182B4: .4byte gUnknown_03003E50

	thumb_func_start sub_80182B8
sub_80182B8: @ 0x080182B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	ldr r5, _08018378 @ =gScriptContext
	ldr r4, _0801837C @ =gMain
	ldrb r0, [r4, #8]
	cmp r0, #1
	bne _080182CE
	b _080184F8
_080182CE:
	ldr r1, _08018380 @ =gUnknown_0814E338
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r4, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _080182F8
	movs r0, #2
	ldrh r1, [r5, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _080182F8
	b _080184F8
_080182F8:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	mov sb, r1
	cmp r0, #1
	bne _0801830A
	b _080184F8
_0801830A:
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r8, r0
_08018312:
	bl IsHPBarAnimating
	cmp r0, #1
	bne _0801831C
	b _080184F8
_0801831C:
	ldr r0, _0801837C @ =gMain
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _08018328
	b _080184F8
_08018328:
	ldrh r2, [r5, #0x1c]
	movs r0, #4
	ands r0, r2
	adds r1, r5, #0
	adds r1, #0x23
	cmp r0, #0
	beq _0801833E
	ldrb r4, [r1]
	cmp r4, #2
	bne _0801833E
	b _080184F8
_0801833E:
	ldrb r1, [r1]
	cmp r1, #3
	bne _08018346
	b _080184F8
_08018346:
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r3, #0
	strh r1, [r5, #8]
	adds r0, #2
	str r0, [r5]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x7f
	bhi _08018388
	ldrh r0, [r5, #8]
	bl sub_8017EF4
	ldr r1, _08018384 @ =gScriptCmdFuncs
	ldrh r2, [r5, #0xa]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	bl _call_via_r1
	cmp r0, #0
	beq _08018312
	b _080183FA
	.align 2, 0
_08018378: .4byte gScriptContext
_0801837C: .4byte gMain
_08018380: .4byte gUnknown_0814E338
_08018384: .4byte gScriptCmdFuncs
_08018388:
	mov r4, sb
	ldrb r4, [r4]
	lsrs r0, r4, #4
	cmp r0, #1
	beq _080183BE
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080183BE
	ldr r1, _080183DC @ =gJoypad
	movs r0, #2
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _080183B4
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _080183BE
_080183B4:
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r5, #0x1c]
_080183BE:
	ldrh r2, [r5, #0x1c]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _08018416
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r1
	bne _080183E0
	cmp r7, #0
	beq _08018416
	b _080183FA
	.align 2, 0
_080183DC: .4byte gJoypad
_080183E0:
	ldr r4, _08018404 @ =0x0000DFFF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r5, #0x1c]
	adds r3, r5, #0
	adds r3, #0x27
	ldrb r1, [r3]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08018408
	subs r0, r1, #1
	strb r0, [r3]
_080183FA:
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
	b _080184F8
	.align 2, 0
_08018404: .4byte 0x0000DFFF
_08018408:
	adds r2, r5, #0
	adds r2, #0x26
	movs r0, #0xf0
	ands r0, r1
	ldrb r2, [r2]
	adds r0, r2, r0
	strb r0, [r3]
_08018416:
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	ldrh r2, [r5, #0x1c]
	orrs r0, r2
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #8]
	subs r0, #0x80
	strh r0, [r5, #8]
	ldrh r0, [r5, #8]
	adds r4, r5, #0
	adds r4, #0x28
	ldrb r1, [r4]
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r2, [r6]
	bl sub_8017F40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrh r4, [r5, #8]
	cmp r4, #0xff
	bne _08018448
	b _08018312
_08018448:
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r1, [r0]
	cmp r1, #0
	bne _08018454
	b _08018312
_08018454:
	movs r0, #4
	ldrh r2, [r5, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _08018460
	b _08018312
_08018460:
	ldrb r6, [r6]
	cmp r6, #1
	bls _08018468
	b _08018312
_08018468:
	cmp r7, #0
	beq _08018474
	ldrh r4, [r5, #0x16]
	cmp r4, #1
	beq _08018474
	b _08018312
_08018474:
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _08018482
	cmp r1, #5
	bls _08018482
	movs r0, #1
	strh r0, [r5, #0x16]
_08018482:
	ldrh r0, [r5, #0x16]
	adds r1, r0, #0
	cmp r1, #1
	bls _08018490
	subs r0, #1
	strh r0, [r5, #0x16]
	b _08018312
_08018490:
	cmp r1, #1
	bne _08018498
	movs r0, #2
	strh r0, [r5, #0x16]
_08018498:
	cmp r7, #0
	beq _080184A4
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	bne _080184A4
	b _08018312
_080184A4:
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1a
	bhi _080184AC
	b _08018312
_080184AC:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080184BA
	b _08018312
_080184BA:
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	bne _080184C8
	movs r0, #0x44
	bl PlaySE
	b _08018312
_080184C8:
	ldr r6, _080184F4 @ =gUnknown_08028546
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _080184DE
	movs r0, #0x2e
	bl PlaySE
_080184DE:
	ldrb r4, [r4]
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080184EA
	b _08018312
_080184EA:
	movs r0, #0x2d
	bl PlaySE
	b _08018312
	.align 2, 0
_080184F4: .4byte gUnknown_08028546
_080184F8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start LoadCurrentScriptIntoRam
LoadCurrentScriptIntoRam: @ 0x08018504
	push {r4, r5, r6, lr}
	ldr r0, _080185D8 @ =gScriptContext
	mov ip, r0
	adds r0, #0x28
	movs r1, #0
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x29
	strb r1, [r0]
	adds r0, #0x23
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r3, #0
	mov r6, ip
	strh r1, [r6, #0x16]
	subs r0, #0x27
	strb r3, [r0]
	strh r1, [r6, #0x1c]
	adds r0, #1
	strb r3, [r0]
	subs r0, #3
	strb r3, [r0]
	subs r0, #2
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x40
	movs r0, #0x80
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strh r1, [r0]
	strh r1, [r6, #0x1e]
	ldr r0, _080185DC @ =gUnknown_030070B0
	adds r0, #0x20
	strb r3, [r0]
	mov r0, ip
	adds r0, #0x4e
	strh r1, [r0]
	movs r2, #0
	ldr r5, _080185E0 @ =gUnknown_08028588
	ldr r4, _080185E4 @ =gMain
	adds r0, #6
_0801855A:
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	adds r0, #0x18
	adds r2, #1
	cmp r2, #2
	bls _0801855A
	movs r2, #0
	movs r1, #0
	ldr r0, _080185DC @ =gUnknown_030070B0
_0801856E:
	strh r1, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, #0xf
	bls _0801856E
	ldr r1, _080185E8 @ =0x040000D4
	ldr r0, _080185EC @ =gTextPal
	str r0, [r1]
	ldr r0, _080185F0 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _080185F4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0
	ldr r3, _080185F8 @ =0x00003FFF
	ldr r1, _080185FC @ =gUnknown_03003E50
_0801858E:
	adds r0, r3, #0
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	adds r1, #0xc
	adds r2, #1
	cmp r2, #0x3f
	bls _0801858E
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08018600 @ =gUnknown_02011FC0
	bl LZ77UnCompWram
	movs r2, #0
	movs r5, #0xff
	movs r3, #0
	movs r4, #0x80
	lsls r4, r4, #2
	ldr r1, _08018604 @ =gUnknown_03003AF0
_080185BC:
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	strb r3, [r1, #1]
	strb r3, [r1, #5]
	strh r4, [r1, #8]
	adds r1, #0x14
	adds r2, #1
	cmp r2, #7
	bls _080185BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080185D8: .4byte gScriptContext
_080185DC: .4byte gUnknown_030070B0
_080185E0: .4byte gUnknown_08028588
_080185E4: .4byte gMain
_080185E8: .4byte 0x040000D4
_080185EC: .4byte gTextPal
_080185F0: .4byte 0x05000200
_080185F4: .4byte 0x80000010
_080185F8: .4byte 0x00003FFF
_080185FC: .4byte gUnknown_03003E50
_08018600: .4byte gUnknown_02011FC0
_08018604: .4byte gUnknown_03003AF0

	thumb_func_start sub_8018608
sub_8018608: @ 0x08018608
	adds r2, r0, #0
	ldr r0, _08018634 @ =0x0000FFFF
	cmp r1, r0
	beq _08018630
	subs r1, #0x80
	cmp r1, #0
	blt _08018630
	asrs r0, r1, #5
	lsls r3, r0, #5
	subs r3, r1, r3
	lsls r0, r0, #2
	movs r1, #0x86
	lsls r1, r1, #1
	adds r2, r2, r1
	adds r2, r2, r0
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
_08018630:
	bx lr
	.align 2, 0
_08018634: .4byte 0x0000FFFF

	thumb_func_start sub_8018638
sub_8018638: @ 0x08018638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r4, _080186E4 @ =gScriptContext
	ldrh r0, [r4, #0xc]
	adds r0, #1
	ldr r6, _080186E8 @ =gMain
	cmp r5, r0
	beq _08018664
	movs r2, #0
	movs r3, #0xff
	ldr r1, _080186EC @ =gUnknown_03003AF0
_08018656:
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r1, #0x14
	adds r2, #1
	cmp r2, #7
	bls _08018656
_08018664:
	ldrh r1, [r4, #0xc]
	adds r0, r6, #0
	bl sub_8018608
	movs r2, #0
	adds r0, r5, #1
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x28
	movs r1, #0x29
	adds r1, r1, r4
	mov ip, r1
	movs r7, #0x22
	adds r7, r7, r4
	mov sb, r7
	ldr r3, _080186F0 @ =0x00003FFF
	ldr r1, _080186F4 @ =gUnknown_03003E50
_08018686:
	adds r0, r3, #0
	ldrh r7, [r1]
	ands r0, r7
	strh r0, [r1]
	adds r1, #0xc
	adds r2, #1
	cmp r2, #0x20
	bls _08018686
	movs r0, #0
	mov r8, r0
	strh r5, [r4, #0xc]
	mov r1, sl
	strh r1, [r4, #0xe]
	mov r2, r8
	strb r2, [r6]
	mov r7, ip
	strb r2, [r7]
	ldr r0, _080186F8 @ =0x0000FFF7
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	ldr r1, _080186FC @ =0x0000FFFB
	ands r0, r1
	adds r1, #3
	ands r0, r1
	strh r0, [r4, #0x1c]
	movs r0, #0xf
	mov r2, sb
	ldrb r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080186CC
	bl sub_8017BA8
	bl sub_8017BC0
_080186CC:
	ldr r0, _080186E8 @ =gMain
	ldrh r1, [r4, #0xc]
	bl sub_8018C1C
	cmp r0, #0
	beq _08018700
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r7, #0
	ldrh r1, [r4, #0x1c]
	orrs r0, r1
	b _08018706
	.align 2, 0
_080186E4: .4byte gScriptContext
_080186E8: .4byte gMain
_080186EC: .4byte gUnknown_03003AF0
_080186F0: .4byte 0x00003FFF
_080186F4: .4byte gUnknown_03003E50
_080186F8: .4byte 0x0000FFF7
_080186FC: .4byte 0x0000FFFB
_08018700:
	ldr r0, _08018734 @ =0x0000F7FF
	ldrh r2, [r4, #0x1c]
	ands r0, r2
_08018706:
	strh r0, [r4, #0x1c]
	ldr r0, _08018738 @ =gMain
	movs r7, #0xb4
	lsls r7, r7, #2
	adds r0, r0, r7
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08018726
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r4, #0x1c]
	orrs r0, r2
	strh r0, [r4, #0x1c]
_08018726:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018734: .4byte 0x0000F7FF
_08018738: .4byte gMain

	thumb_func_start sub_801873C
sub_801873C: @ 0x0801873C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08018770 @ =gScriptContext
	lsls r0, r6, #2
	ldr r1, _08018774 @ =gUnknown_02011FC4
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r4, r1, #1
	ldrh r6, [r0, #2]
	adds r0, r6, #0
	adds r0, #0x80
	bl sub_8018638
	lsls r0, r6, #2
	ldr r1, _08018774 @ =gUnknown_02011FC4
	adds r0, r0, r1
	ldr r0, [r0]
	subs r1, #4
	adds r0, r0, r1
	str r0, [r5, #4]
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018770: .4byte gScriptContext
_08018774: .4byte gUnknown_02011FC4

	thumb_func_start ChangeScriptSection
ChangeScriptSection: @ 0x08018778
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080187C4 @ =gScriptContext
	ldr r2, _080187C8 @ =gMain
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801879E
	cmp r5, #0x7f
	bls _0801879E
	ldrh r0, [r4, #0xc]
	cmp r0, #0x7f
	bls _0801879E
	adds r5, r0, #0
	adds r5, #1
_0801879E:
	adds r0, r2, #0
	ldrb r1, [r0, #8]
	cmp r1, #4
	beq _080187AC
	ldrb r0, [r0, #0xc]
	cmp r0, #4
	bne _080187D2
_080187AC:
	ldrb r2, [r2, #9]
	cmp r2, #0xa
	beq _080187D2
	bl sub_8016ED8
	cmp r0, #0
	bne _080187CC
	movs r0, #2
	bl sub_8017154
	b _080187D2
	.align 2, 0
_080187C4: .4byte gScriptContext
_080187C8: .4byte gMain
_080187CC:
	movs r0, #4
	bl sub_8017154
_080187D2:
	adds r0, r5, #0
	bl sub_8018638
	ldrh r2, [r4, #0xc]
	cmp r2, #0x7f
	bls _080187F0
	ldr r1, _080187E8 @ =gUnknown_02011FC0
	lsls r0, r2, #2
	ldr r2, _080187EC @ =gUnknown_02011DC0
	adds r0, r0, r2
	b _080187F8
	.align 2, 0
_080187E8: .4byte gUnknown_02011FC0
_080187EC: .4byte gUnknown_02011DC0
_080187F0:
	ldr r1, _08018808 @ =gUnknown_08270934
	ldrh r2, [r4, #0xc]
	lsls r0, r2, #2
	adds r0, r0, r1
_080187F8:
	ldr r0, [r0, #4]
	adds r0, r0, r1
	str r0, [r4]
	str r0, [r4, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018808: .4byte gUnknown_08270934

	thumb_func_start sub_801880C
sub_801880C: @ 0x0801880C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #5
	mov sl, r0
	movs r3, #0
	ldr r0, _08018850 @ =gMain
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	bne _08018828
	b _08018A54
_08018828:
	ldr r4, _08018854 @ =gOamObjects+0x10
	mov sb, r3
	ldr r5, _08018858 @ =gScriptContext
	ldr r6, _0801885C @ =gUnknown_03003E50
_08018830:
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	ldrh r2, [r6]
	ands r0, r2
	cmp r0, #0
	bne _08018840
	b _080189B4
_08018840:
	movs r0, #4
	ldrh r7, [r5, #0x1c]
	ands r0, r7
	cmp r0, #0
	beq _08018860
	ldrh r0, [r6, #6]
	b _08018864
	.align 2, 0
_08018850: .4byte gMain
_08018854: .4byte gOamObjects+0x10
_08018858: .4byte gScriptContext
_0801885C: .4byte gUnknown_03003E50
_08018860:
	ldrh r0, [r6, #6]
	adds r0, #0x74
_08018864:
	strh r0, [r4]
	ldr r1, _08018890 @ =0x00004009
	ldrh r0, [r6, #4]
	adds r1, r0, r1
	str r1, [sp, #8]
	strh r1, [r4, #2]
	ldrh r1, [r5, #0xc]
	subs r0, r1, #6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x17
	bls _0801888A
	adds r0, r1, #0
	cmp r0, #1
	bls _0801888A
	cmp r0, #3
	beq _0801888A
	cmp r0, #4
	bne _08018894
_0801888A:
	ldrh r0, [r4]
	subs r0, #0x40
	b _080188FE
	.align 2, 0
_08018890: .4byte 0x00004009
_08018894:
	movs r0, #4
	ldrh r7, [r5, #0x1c]
	ands r0, r7
	cmp r0, #0
	bne _08018900
	movs r0, #0x22
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0xf
	adds r0, r2, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08018900
	movs r7, #6
	ldrsh r0, [r6, r7]
	movs r1, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r1, r5, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldrh r7, [r0]
	lsls r1, r7, #3
	adds r0, r7, #0
	subs r1, r1, r0
	ldr r0, _080188F8 @ =0x0000FFFE
	adds r1, r1, r0
	ldr r7, [sp, #8]
	adds r1, r7, r1
	strh r1, [r4, #2]
	ldr r2, [sp]
	adds r0, r2, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	ldr r3, [sp, #4]
	cmp r0, #2
	bne _08018900
	ldrh r0, [r5, #0x1a]
	cmp r0, #0
	beq _080188FC
	ldrh r0, [r4]
	subs r0, #0x36
	b _080188FE
	.align 2, 0
_080188F8: .4byte 0x0000FFFE
_080188FC:
	movs r0, #0x47
_080188FE:
	strh r0, [r4]
_08018900:
	ldrh r1, [r6, #2]
	movs r2, #0
	strh r1, [r4, #4]
	movs r7, #0x80
	lsls r7, r7, #8
	adds r0, r7, #0
	ldrh r7, [r6, #8]
	ands r0, r7
	cmp r0, #0
	beq _0801893A
	ldr r2, _08018990 @ =0x00000FFF
	adds r0, r2, #0
	ands r0, r1
	movs r7, #0xd0
	lsls r7, r7, #8
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r4, #4]
	cmp r3, #0
	bne _0801893A
	ldr r1, _08018994 @ =0x040000D4
	ldr r0, _08018998 @ =gUnknown_08028678
	str r0, [r1]
	ldr r0, _0801899C @ =0x050003A0
	str r0, [r1, #4]
	ldr r0, _080189A0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #1
_0801893A:
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r1, #0
	ldrh r2, [r6]
	ands r0, r2
	cmp r0, #0
	beq _08018974
	movs r7, #0xc0
	lsls r7, r7, #2
	adds r0, r7, #0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	mov r2, sl
	lsls r0, r2, #9
	ldrh r7, [r4, #2]
	orrs r0, r7
	strh r0, [r4, #2]
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0801896E
	movs r2, #4
	ldrsh r0, [r6, r2]
	cmp r0, #0xc5
	ble _08018974
_0801896E:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4]
_08018974:
	movs r7, #0x80
	lsls r7, r7, #5
	adds r0, r7, #0
	ldrh r1, [r5, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _080189A4
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r7, [r4]
	orrs r0, r7
	b _080189B8
	.align 2, 0
_08018990: .4byte 0x00000FFF
_08018994: .4byte 0x040000D4
_08018998: .4byte gUnknown_08028678
_0801899C: .4byte 0x050003A0
_080189A0: .4byte 0x80000010
_080189A4:
	ldr r1, _080189B0 @ =0x0000FBFF
	adds r0, r1, #0
	ldrh r2, [r4]
	ands r0, r2
	b _080189B8
	.align 2, 0
_080189B0: .4byte 0x0000FBFF
_080189B4:
	movs r0, #0x80
	lsls r0, r0, #2
_080189B8:
	strh r0, [r4]
	adds r4, #8
	adds r6, #0xc
	movs r7, #1
	add sb, r7
	mov r0, sb
	cmp r0, #0x1f
	bhi _080189CA
	b _08018830
_080189CA:
	ldr r1, _08018A28 @ =gOamObjects+0x10
	movs r0, #4
	ldrh r2, [r5, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _08018A6C
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r4, r1, r3
	movs r6, #0x20
	mov sb, r6
	ldr r0, _08018A2C @ =gUnknown_03003E50
	movs r7, #0x80
	lsls r7, r7, #8
	mov r8, r7
	movs r1, #0x80
	lsls r1, r1, #5
	mov sl, r1
	subs r3, #0x40
	adds r2, r0, r3
	ldr r6, _08018A30 @ =0x0000FBFF
	mov ip, r6
_080189F6:
	mov r0, r8
	ldrh r7, [r2]
	ands r0, r7
	cmp r0, #0
	beq _08018A3E
	ldrh r1, [r2, #6]
	movs r3, #0
	strh r1, [r4]
	ldrh r6, [r2, #4]
	ldr r7, _08018A34 @ =0x00004009
	adds r0, r6, r7
	strh r0, [r4, #2]
	ldrh r0, [r2, #2]
	strh r0, [r4, #4]
	mov r0, sl
	ldrh r6, [r5, #0x1c]
	ands r0, r6
	cmp r0, #0
	beq _08018A38
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _08018A42
	.align 2, 0
_08018A28: .4byte gOamObjects+0x10
_08018A2C: .4byte gUnknown_03003E50
_08018A30: .4byte 0x0000FBFF
_08018A34: .4byte 0x00004009
_08018A38:
	mov r0, ip
	ands r0, r1
	b _08018A42
_08018A3E:
	movs r0, #0x80
	lsls r0, r0, #2
_08018A42:
	strh r0, [r4]
	adds r4, #8
	adds r2, #0xc
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #0x3f
	bls _080189F6
	b _08018A6C
_08018A54:
	ldr r4, _08018A7C @ =gOamObjects+0x10
	movs r2, #0
	mov sb, r2
	movs r0, #0x80
	lsls r0, r0, #2
_08018A5E:
	strh r0, [r4]
	adds r4, #8
	movs r3, #1
	add sb, r3
	mov r6, sb
	cmp r6, #0x1f
	bls _08018A5E
_08018A6C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018A7C: .4byte gOamObjects+0x10

	thumb_func_start RunScriptContext
RunScriptContext: @ 0x08018A80
	push {lr}
	ldr r1, _08018AB4 @ =gMain
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _08018A98
	adds r0, r1, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _08018A98
	bl sub_80182B8
_08018A98:
	ldr r1, _08018AB8 @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #4
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	cmp r0, #0
	bne _08018AAA
	bl sub_8017CD0
_08018AAA:
	bl sub_801880C
	pop {r0}
	bx r0
	.align 2, 0
_08018AB4: .4byte gMain
_08018AB8: .4byte gScriptContext

	thumb_func_start sub_8018ABC
sub_8018ABC: @ 0x08018ABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r3, #0
	ldr r7, _08018B48 @ =0x040000D4
	ldr r0, _08018B4C @ =gUnknown_03003BC0
	mov sb, r0
	ldr r1, _08018B50 @ =0x80000040
	mov sl, r1
_08018AD4:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r4, _08018B54 @ =gUnknown_03003E50
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r0, r1
	adds r4, r3, #1
	str r4, [sp]
	cmp r0, #0
	bne _08018AF2
	b _08018C00
_08018AF2:
	ldr r4, _08018B58 @ =0x00003FFF
	adds r0, r4, #0
	adds r4, r0, #0
	ands r4, r1
	lsls r4, r4, #7
	ldr r0, _08018B5C @ =gCharSet
	adds r4, r4, r0
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	beq _08018BF0
	movs r5, #0xf0
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08018B96
	str r4, [r7]
	mov r1, sb
	str r1, [r7, #4]
	mov r4, sl
	str r4, [r7, #8]
	ldr r0, [r7, #8]
	mov r6, sb
	adds r0, r5, #0
	ldrb r2, [r2, #0xa]
	ands r0, r2
	lsrs r4, r0, #4
	movs r5, #0
	lsls r3, r3, #7
	mov r8, r3
	adds r0, r4, #0
	movs r1, #5
	bl __umodsi3
	adds r3, r0, #0
_08018B36:
	ldrb r1, [r6]
	movs r2, #0xf
	ands r2, r1
	movs r0, #0xf0
	ands r1, r0
	cmp r2, #3
	bne _08018B60
	adds r2, r4, #0
	b _08018B70
	.align 2, 0
_08018B48: .4byte 0x040000D4
_08018B4C: .4byte gUnknown_03003BC0
_08018B50: .4byte 0x80000040
_08018B54: .4byte gUnknown_03003E50
_08018B58: .4byte 0x00003FFF
_08018B5C: .4byte gCharSet
_08018B60:
	cmp r2, #2
	bne _08018B6E
	movs r2, #0
	cmp r3, #1
	beq _08018B70
	subs r2, r4, #1
	b _08018B70
_08018B6E:
	movs r2, #0
_08018B70:
	cmp r1, #0x30
	bne _08018B78
	lsls r1, r4, #4
	b _08018B88
_08018B78:
	cmp r1, #0x20
	bne _08018B86
	cmp r3, #1
	beq _08018B86
	subs r0, r4, #1
	lsls r1, r0, #4
	b _08018B88
_08018B86:
	movs r1, #0
_08018B88:
	orrs r2, r1
	strb r2, [r6]
	adds r6, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _08018B36
	b _08018BDA
_08018B96:
	str r4, [r7]
	mov r0, sb
	str r0, [r7, #4]
	mov r1, sl
	str r1, [r7, #8]
	ldr r0, [r7, #8]
	mov r6, sb
	ldrb r4, [r2, #0xa]
	lsls r0, r4, #1
	adds r4, r0, r4
	movs r5, #0
	lsls r3, r3, #7
	mov r8, r3
	movs r0, #0xf
	mov ip, r0
	lsls r0, r4, #4
_08018BB6:
	ldrb r1, [r6]
	adds r2, r1, #0
	mov r3, ip
	ands r2, r3
	movs r3, #0xf0
	ands r1, r3
	cmp r2, #0
	beq _08018BC8
	adds r2, r2, r4
_08018BC8:
	cmp r1, #0
	beq _08018BCE
	adds r1, r1, r0
_08018BCE:
	orrs r2, r1
	strb r2, [r6]
	adds r6, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _08018BB6
_08018BDA:
	ldr r5, _08018BEC @ =0x06010000
	add r5, r8
	mov r4, sb
	str r4, [r7]
	str r5, [r7, #4]
	mov r0, sl
	str r0, [r7, #8]
	b _08018BFE
	.align 2, 0
_08018BEC: .4byte 0x06010000
_08018BF0:
	lsls r0, r3, #7
	ldr r1, _08018C18 @ =0x06010000
	adds r5, r0, r1
	str r4, [r7]
	str r5, [r7, #4]
	mov r3, sl
	str r3, [r7, #8]
_08018BFE:
	ldr r0, [r7, #8]
_08018C00:
	ldr r3, [sp]
	cmp r3, #0x3f
	bhi _08018C08
	b _08018AD4
_08018C08:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018C18: .4byte 0x06010000

	thumb_func_start sub_8018C1C
sub_8018C1C: @ 0x08018C1C
	adds r2, r0, #0
	ldr r0, _08018C30 @ =0x0000FFFF
	cmp r1, r0
	beq _08018C2A
	subs r1, #0x80
	cmp r1, #0
	bge _08018C34
_08018C2A:
	movs r0, #0
	b _08018C4C
	.align 2, 0
_08018C30: .4byte 0x0000FFFF
_08018C34:
	asrs r0, r1, #5
	lsls r3, r0, #5
	subs r3, r1, r3
	lsls r0, r0, #2
	movs r1, #0x86
	lsls r1, r1, #1
	adds r2, r2, r1
	adds r2, r2, r0
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	ands r0, r1
_08018C4C:
	bx lr
	.align 2, 0

	thumb_func_start ClearSectionReadFlags
ClearSectionReadFlags: @ 0x08018C50
	push {r4, r5, lr}
	movs r2, #0
	movs r1, #0x86
	lsls r1, r1, #1
	adds r5, r0, r1
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0xec
_08018C60:
	lsls r1, r2, #2
	adds r0, r5, r1
	str r3, [r0]
	adds r1, r4, r1
	str r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #7
	bls _08018C60
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8018C7C
sub_8018C7C: @ 0x08018C7C
	push {r4, lr}
	movs r2, #0
	movs r1, #0x86
	lsls r1, r1, #1
	adds r3, r0, r1
	ldr r4, _08018CA4 @ =gUnknown_02000140
_08018C88:
	lsls r0, r2, #2
	adds r1, r3, r0
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #7
	bls _08018C88
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018CA4: .4byte gUnknown_02000140

	thumb_func_start sub_8018CA8
sub_8018CA8: @ 0x08018CA8
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r3, #0x80
	cmp r3, r4
	bhs _08018CFC
	movs r1, #0x86
	lsls r1, r1, #1
	adds r5, r0, r1
_08018CB8:
	ldr r0, _08018CE0 @ =0x0000FFFF
	cmp r3, r0
	beq _08018CFC
	adds r1, r3, #0
	subs r1, #0x80
	cmp r1, #0
	blt _08018CFC
	cmp r1, #0
	beq _08018CE4
	adds r0, r1, #0
	cmp r1, #0
	bge _08018CD4
	adds r0, r3, #0
	subs r0, #0x61
_08018CD4:
	asrs r0, r0, #5
	adds r2, r0, #0
	lsls r0, r2, #5
	subs r0, r1, r0
	b _08018CE8
	.align 2, 0
_08018CE0: .4byte 0x0000FFFF
_08018CE4:
	movs r2, #0
	movs r0, #0
_08018CE8:
	lsls r2, r2, #2
	adds r2, r5, r2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	adds r3, #1
	cmp r3, r4
	blo _08018CB8
_08018CFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8018D04
sub_8018D04: @ 0x08018D04
	push {r4, lr}
	sub sp, #4
	ldr r4, _08018D3C @ =gScriptContext
	movs r3, #0
_08018D0C:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08018D0C
	mov r0, sp
	ldrh r0, [r0, #2]
	mov r1, sp
	ldrh r1, [r1]
	bl FadeInBGM
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018D3C: .4byte gScriptContext

	thumb_func_start sub_8018D40
sub_8018D40: @ 0x08018D40
	push {r4, lr}
	sub sp, #4
	ldr r4, _08018D78 @ =gScriptContext
	movs r3, #0
_08018D48:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08018D48
	mov r0, sp
	ldrh r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08018D7C
	mov r0, sp
	ldrh r0, [r0]
	bl PlaySE
	b _08018D84
	.align 2, 0
_08018D78: .4byte gScriptContext
_08018D7C:
	mov r0, sp
	ldrh r0, [r0]
	bl StopSE
_08018D84:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8018D90
sub_8018D90: @ 0x08018D90
	push {r4, lr}
	sub sp, #8
	ldr r4, _08018DD4 @ =gScriptContext
	movs r3, #0
_08018D98:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #2
	bls _08018D98
	mov r0, sp
	ldrh r2, [r0]
	lsrs r0, r2, #8
	movs r1, #0xff
	ands r1, r2
	mov r2, sp
	ldrh r2, [r2, #2]
	mov r3, sp
	ldrh r3, [r3, #4]
	bl StartHardwareBlend
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018DD4: .4byte gScriptContext

	thumb_func_start sub_8018DD8
sub_8018DD8: @ 0x08018DD8
	push {r4, lr}
	ldr r2, _08018E2C @ =gMain
	movs r0, #0
	strb r0, [r2, #0x18]
	strb r0, [r2, #0x19]
	adds r1, r2, #0
	adds r1, #0xa6
	ldrh r0, [r1]
	adds r0, #0x28
	movs r4, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _08018DFA
	movs r0, #0x50
	strh r0, [r1]
_08018DFA:
	ldrh r1, [r1]
	adds r3, r2, #0
	adds r3, #0xb6
	adds r0, r2, #0
	adds r0, #0xa8
	strh r1, [r0]
	strh r1, [r3]
	ldr r0, _08018E30 @ =0x00000203
	str r0, [r2, #8]
	ldr r0, _08018E34 @ =gInvestigation
	strb r4, [r0, #0xc]
	strb r4, [r0, #0xd]
	adds r1, r2, #0
	adds r1, #0xc1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xe6
	bl PlayBGM
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018E2C: .4byte gMain
_08018E30: .4byte 0x00000203
_08018E34: .4byte gInvestigation

	thumb_func_start sub_8018E38
sub_8018E38: @ 0x08018E38
	push {r4, r5, r6, lr}
	ldr r1, _08018E84 @ =gScriptContext
	ldr r0, [r1]
	ldrh r4, [r0]
	adds r0, #2
	str r0, [r1]
	ldr r6, _08018E88 @ =0x00003FFF
	ands r6, r4
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_801090C
	adds r2, r0, #0
	cmp r2, #0
	bge _08018EBE
	adds r0, r5, #0
	bl sub_8010954
	adds r2, r0, #0
	cmp r2, #0
	blt _08018EBE
	cmp r5, #0
	beq _08018E90
	ldr r0, _08018E8C @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x3c
	adds r1, r2, r1
	strb r6, [r1]
	ldrb r1, [r0, #0x11]
	adds r1, #1
	strb r1, [r0, #0x11]
	b _08018EA0
	.align 2, 0
_08018E84: .4byte gScriptContext
_08018E88: .4byte 0x00003FFF
_08018E8C: .4byte gCourtRecord
_08018E90:
	ldr r0, _08018EC8 @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x1c
	adds r1, r2, r1
	strb r6, [r1]
	ldrb r1, [r0, #0x10]
	adds r1, #1
	strb r1, [r0, #0x10]
_08018EA0:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r4, r0
	cmp r4, #0
	beq _08018EBE
	ldr r1, _08018ECC @ =gMain
	adds r0, r1, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	movs r0, #8
	str r0, [r1, #8]
_08018EBE:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018EC8: .4byte gCourtRecord
_08018ECC: .4byte gMain

	thumb_func_start sub_8018ED0
sub_8018ED0: @ 0x08018ED0
	push {r4, lr}
	ldr r1, _08018F04 @ =gScriptContext
	ldr r0, [r1]
	ldrh r2, [r0]
	adds r0, #2
	str r0, [r1]
	ldr r1, _08018F08 @ =0x00003FFF
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r0, r4, #0
	bl sub_801090C
	adds r2, r0, #0
	cmp r2, #0
	blt _08018F20
	cmp r4, #0
	beq _08018F10
	ldr r0, _08018F0C @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x3c
	b _08018F16
	.align 2, 0
_08018F04: .4byte gScriptContext
_08018F08: .4byte 0x00003FFF
_08018F0C: .4byte gCourtRecord
_08018F10:
	ldr r0, _08018F28 @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x1c
_08018F16:
	adds r1, r2, r1
	movs r2, #0xff
	strb r2, [r1]
	bl sub_801097C
_08018F20:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018F28: .4byte gCourtRecord

	thumb_func_start sub_8018F2C
sub_8018F2C: @ 0x08018F2C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08018F88 @ =gScriptContext
	movs r3, #0
_08018F34:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08018F34
	mov r0, sp
	ldrh r1, [r0]
	ldr r6, _08018F8C @ =0x00003FFF
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sp
	ldrh r4, [r0]
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_801090C
	adds r1, r0, #0
	cmp r1, #0
	blt _08018FBA
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r2, r6, #0
	ands r2, r0
	cmp r5, #0
	beq _08018F94
	ldr r0, _08018F90 @ =gCourtRecord
	adds r0, #0x3c
	b _08018F98
	.align 2, 0
_08018F88: .4byte gScriptContext
_08018F8C: .4byte 0x00003FFF
_08018F90: .4byte gCourtRecord
_08018F94:
	ldr r0, _08018FC4 @ =gCourtRecord
	adds r0, #0x1c
_08018F98:
	adds r0, r1, r0
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r4, r0
	cmp r4, #0
	beq _08018FBA
	ldr r1, _08018FC8 @ =gMain
	adds r0, r1, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	movs r0, #8
	str r0, [r1, #8]
_08018FBA:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018FC4: .4byte gCourtRecord
_08018FC8: .4byte gMain

	thumb_func_start sub_8018FCC
sub_8018FCC: @ 0x08018FCC
	push {r4, lr}
	sub sp, #8
	ldr r4, _08019018 @ =gScriptContext
	movs r3, #0
_08018FD4:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _08018FD4
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	mov r2, sp
	ldrh r2, [r2, #4]
	mov r3, sp
	ldrh r3, [r3, #6]
	bl SetCourtScrollPersonAnim
	mov r0, sp
	ldrh r0, [r0, #2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0801901C
	mov r1, sp
	movs r0, #0x1e
	strh r0, [r1, #4]
	b _08019020
	.align 2, 0
_08019018: .4byte gScriptContext
_0801901C:
	mov r0, sp
	strh r1, [r0, #4]
_08019020:
	ldr r0, _0801903C @ =gPalCourtScroll
	mov r1, sp
	ldrh r1, [r1, #4]
	mov r2, sp
	ldrh r3, [r2, #2]
	movs r2, #0x1f
	bl InitCourtScroll
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801903C: .4byte gPalCourtScroll

	thumb_func_start sub_8019040
sub_8019040: @ 0x08019040
	push {r4, r5, lr}
	ldr r4, _0801907C @ =gScriptContext
	ldr r3, _08019080 @ =gMain
	ldrh r5, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _08019084
	ldr r0, [r4]
	ldrh r1, [r0]
	ldrh r0, [r3, #0x34]
	movs r2, #0
	strh r0, [r3, #0x38]
	strh r1, [r3, #0x34]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r3, r1
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x80
	strh r0, [r1]
	movs r0, #1
	orrs r0, r5
	strh r0, [r4, #0x12]
	movs r0, #1
	b _080190A6
	.align 2, 0
_0801907C: .4byte gScriptContext
_08019080: .4byte gMain
_08019084:
	adds r0, r3, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08019096
	movs r0, #1
	b _080190A6
_08019096:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r5
	strh r0, [r4, #0x12]
	movs r0, #0
_080190A6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80190AC
sub_80190AC: @ 0x080190AC
	push {r4, r5, lr}
	ldr r5, _080190D0 @ =gScriptContext
	ldr r4, _080190D4 @ =gMain
	ldrh r0, [r4, #0x34]
	bl sub_80051AC
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080190D8
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	b _080190DE
	.align 2, 0
_080190D0: .4byte gScriptContext
_080190D4: .4byte gMain
_080190D8:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r1, [r0]
_080190DE:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5]
	ldrh r1, [r0]
	lsrs r0, r1, #8
	cmp r0, #1
	beq _0801910C
	cmp r0, #1
	bgt _080190FA
	cmp r0, #0
	beq _08019104
	b _0801911A
_080190FA:
	cmp r0, #2
	beq _08019112
	cmp r0, #3
	beq _08019114
	b _0801911A
_08019104:
	rsbs r1, r1, #0
	adds r0, r4, #0
	adds r0, #0x4c
	b _08019118
_0801910C:
	adds r0, r4, #0
	adds r0, #0x4c
	b _08019118
_08019112:
	rsbs r1, r1, #0
_08019114:
	adds r0, r4, #0
	adds r0, #0x4d
_08019118:
	strb r1, [r0]
_0801911A:
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8019128
sub_8019128: @ 0x08019128
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _08019188 @ =gScriptContext
	ldr r5, _0801918C @ =gMain
	movs r3, #0
_08019132:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #2
	bls _08019132
	mov r0, sp
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xc4
	strh r1, [r0]
	mov r0, sp
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0xc6
	strh r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #0
	beq _08019194
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r2, [r1, #2]
	movs r1, #0
	movs r3, #0
	bl PlayPersonAnimation
	ldr r0, _08019190 @ =gInvestigation
	movs r1, #1
	strb r1, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
	b _080191AC
	.align 2, 0
_08019188: .4byte gScriptContext
_0801918C: .4byte gMain
_08019190: .4byte gInvestigation
_08019194:
	movs r0, #0
	bl sub_8016FEC
	ldr r0, _080191B8 @ =gAnimation+0x44
	bl DestroyAnimation
	ldr r0, _080191BC @ =gInvestigation
	movs r1, #0
	strb r1, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
_080191AC:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080191B8: .4byte gAnimation+0x44
_080191BC: .4byte gInvestigation

	thumb_func_start sub_80191C0
sub_80191C0: @ 0x080191C0
	push {r4, r5, lr}
	ldr r5, _08019218 @ =gMain
	ldr r0, _0801921C @ =gIORegisters
	adds r3, r0, #0
	adds r3, #0x4a
	ldr r1, _08019220 @ =0x0000FBFF
	ldrh r2, [r3]
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	ldr r1, _08019224 @ =gBG2MapBuffer
	adds r3, r0, #0
	ldr r4, _08019228 @ =gAnimation+0x44
	movs r2, #0
	movs r0, #0xa8
	lsls r0, r0, #2
_080191E6:
	strh r2, [r1]
	subs r0, #1
	adds r1, #2
	cmp r0, #0
	bne _080191E6
	movs r0, #0xf8
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #8
	strh r0, [r3, #0x10]
	adds r0, r4, #0
	bl DestroyAnimation
	adds r1, r5, #0
	adds r1, #0x3d
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08019218: .4byte gMain
_0801921C: .4byte gIORegisters
_08019220: .4byte 0x0000FBFF
_08019224: .4byte gBG2MapBuffer
_08019228: .4byte gAnimation+0x44

	thumb_func_start sub_801922C
sub_801922C: @ 0x0801922C
	push {r4, lr}
	sub sp, #4
	ldr r4, _08019260 @ =gScriptContext
	movs r3, #0
_08019234:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08019234
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _08019264
	mov r0, sp
	ldrh r0, [r0, #2]
	bl FadeOutBGM
	b _08019268
	.align 2, 0
_08019260: .4byte gScriptContext
_08019264:
	bl StopBGM
_08019268:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8019274
sub_8019274: @ 0x08019274
	push {r4, lr}
	sub sp, #4
	ldr r4, _080192A4 @ =gScriptContext
	movs r3, #0
_0801927C:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _0801927C
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _080192A8
	bl UnpauseBGM
	b _080192AC
	.align 2, 0
_080192A4: .4byte gScriptContext
_080192A8:
	bl PauseBGM
_080192AC:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80192B8
sub_80192B8: @ 0x080192B8
	ldr r0, _080192C8 @ =gMain
	movs r1, #0
	strb r1, [r0, #0x18]
	strb r1, [r0, #0x19]
	movs r1, #2
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
_080192C8: .4byte gMain

	thumb_func_start sub_80192CC
sub_80192CC: @ 0x080192CC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08019314 @ =gScriptContext
	ldr r5, _08019318 @ =gMain
	movs r3, #0
_080192D6:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080192D6
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r2, r5, #0
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	mov r0, sp
	ldrh r0, [r0, #2]
	strb r0, [r5, #0x16]
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08019314: .4byte gScriptContext
_08019318: .4byte gMain

	thumb_func_start sub_801931C
sub_801931C: @ 0x0801931C
	ldr r0, _08019338 @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _08019340
	ldr r1, _0801933C @ =gUnknown_030037BC
	subs r2, r1, #4
	ldr r0, [r2]
	str r0, [r1]
	movs r0, #5
	str r0, [r2]
	b _08019348
	.align 2, 0
_08019338: .4byte gScriptContext
_0801933C: .4byte gUnknown_030037BC
_08019340:
	ldr r1, _0801934C @ =gMain
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_08019348:
	movs r0, #0
	bx lr
	.align 2, 0
_0801934C: .4byte gMain

	thumb_func_start sub_8019350
sub_8019350: @ 0x08019350
	push {r4, lr}
	sub sp, #4
	ldr r4, _08019384 @ =gScriptContext
	movs r3, #0
_08019358:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08019358
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _08019388
	mov r0, sp
	ldrh r0, [r0]
	bl PlayAnimation
	b _08019394
	.align 2, 0
_08019384: .4byte gScriptContext
_08019388:
	mov r0, sp
	ldrh r0, [r0]
	bl FindAnimationFromAnimId
	bl DestroyAnimation
_08019394:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80193A0
sub_80193A0: @ 0x080193A0
	push {r4, lr}
	sub sp, #4
	ldr r4, _080193D8 @ =gScriptContext
	movs r3, #0
_080193A8:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080193A8
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	bl sub_8012D38
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080193D8: .4byte gScriptContext

	thumb_func_start sub_80193DC
sub_80193DC: @ 0x080193DC
	push {lr}
	ldr r0, _080193F8 @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _08019400
	ldr r0, _080193FC @ =gAnimation+0x44
	movs r1, #1
	bl sub_801208C
	b _08019408
	.align 2, 0
_080193F8: .4byte gScriptContext
_080193FC: .4byte gAnimation+0x44
_08019400:
	ldr r0, _08019410 @ =gAnimation+0x44
	movs r1, #0
	bl sub_801208C
_08019408:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08019410: .4byte gAnimation+0x44

	thumb_func_start sub_8019414
sub_8019414: @ 0x08019414
	push {lr}
	ldr r0, _0801942C @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _08019430
	movs r0, #1
	bl sub_8016E74
	b _08019436
	.align 2, 0
_0801942C: .4byte gScriptContext
_08019430:
	movs r0, #2
	bl sub_8016E74
_08019436:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_801943C
sub_801943C: @ 0x0801943C
	push {r4, lr}
	ldr r1, _08019480 @ =gScriptContext
	ldr r3, _08019484 @ =gMain
	ldr r4, _08019488 @ =gOamObjects+0x188
	ldr r0, [r1]
	ldrh r2, [r0]
	adds r0, #2
	str r0, [r1]
	adds r1, r3, #0
	adds r1, #0xa0
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1]
	ldr r0, [r3, #8]
	str r0, [r3, #0xc]
	cmp r2, #0
	beq _080194A8
	ldr r1, _0801948C @ =0x040000D4
	ldr r0, _08019490 @ =gGfxGuilty1
	str r0, [r1]
	ldr r0, _08019494 @ =0x06013400
	str r0, [r1, #4]
	ldr r0, _08019498 @ =0x80000800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801949C @ =gPalGuilty
	str r0, [r1]
	ldr r0, _080194A0 @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _080194A4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #9
	b _080194D4
	.align 2, 0
_08019480: .4byte gScriptContext
_08019484: .4byte gMain
_08019488: .4byte gOamObjects+0x188
_0801948C: .4byte 0x040000D4
_08019490: .4byte gGfxGuilty1
_08019494: .4byte 0x06013400
_08019498: .4byte 0x80000800
_0801949C: .4byte gPalGuilty
_080194A0: .4byte 0x050002A0
_080194A4: .4byte 0x80000010
_080194A8:
	ldr r1, _080194F0 @ =0x040000D4
	ldr r0, _080194F4 @ =gGfxNotGuilty1
	str r0, [r1]
	ldr r0, _080194F8 @ =0x06013400
	str r0, [r1, #4]
	ldr r2, _080194FC @ =0x80000400
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08019500 @ =gGfxGuiltyNotGuilty2
	str r0, [r1]
	ldr r0, _08019504 @ =0x06013C00
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08019508 @ =gPalNotGuilty
	str r0, [r1]
	ldr r0, _0801950C @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _08019510 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08019514 @ =0x01000009
_080194D4:
	str r0, [r3, #8]
	ldr r0, _08019518 @ =0x000003EF
	strh r0, [r4]
	ldr r0, _0801951C @ =0x0000C1EF
	strh r0, [r4, #2]
	ldr r0, _08019520 @ =0x000051A0
	strh r0, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080194F0: .4byte 0x040000D4
_080194F4: .4byte gGfxNotGuilty1
_080194F8: .4byte 0x06013400
_080194FC: .4byte 0x80000400
_08019500: .4byte gGfxGuiltyNotGuilty2
_08019504: .4byte 0x06013C00
_08019508: .4byte gPalNotGuilty
_0801950C: .4byte 0x050002A0
_08019510: .4byte 0x80000010
_08019514: .4byte 0x01000009
_08019518: .4byte 0x000003EF
_0801951C: .4byte 0x0000C1EF
_08019520: .4byte 0x000051A0

	thumb_func_start sub_8019524
sub_8019524: @ 0x08019524
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08019554 @ =gScriptContext
	ldr r2, _08019558 @ =gMain
	ldr r0, [r1]
	ldrh r3, [r0]
	mov r8, r3
	adds r0, #2
	str r0, [r1]
	movs r3, #0xf
	mov r4, r8
	ands r3, r4
	cmp r3, #4
	bhi _08019574
	lsls r0, r3, #2
	ldr r1, _0801955C @ =_08019560
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019554: .4byte gScriptContext
_08019558: .4byte gMain
_0801955C: .4byte _08019560
_08019560: @ jump table
	.4byte _08019574 @ case 0
	.4byte _080195B4 @ case 1
	.4byte _08019586 @ case 2
	.4byte _08019598 @ case 3
	.4byte _080195B4 @ case 4
_08019574:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xe
	strb r0, [r1]
	movs r7, #0
	mov sl, r7
	movs r0, #0x20
	mov sb, r0
	b _080195C4
_08019586:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xf2
	strb r0, [r1]
	movs r0, #0
	mov sl, r0
	movs r4, #0x20
	mov sb, r4
	b _080195C4
_08019598:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xe
	strb r0, [r1]
	ldr r7, _080195AC @ =gUnknown_08206BF0
	mov sl, r7
	ldr r0, _080195B0 @ =gUnknown_08206C10
	mov sb, r0
	b _080195C4
	.align 2, 0
_080195AC: .4byte gUnknown_08206BF0
_080195B0: .4byte gUnknown_08206C10
_080195B4:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xf2
	strb r0, [r1]
	movs r4, #0
	mov sl, r4
	movs r7, #0x20
	mov sb, r7
_080195C4:
	movs r0, #0x10
	mov r4, r8
	ands r0, r4
	cmp r0, #0
	bne _080195E0
	movs r5, #0
	adds r0, r2, #0
	adds r0, #0x3d
	movs r1, #2
	ldrb r7, [r0]
	orrs r1, r7
	strb r1, [r0]
	str r0, [sp]
	b _08019634
_080195E0:
	movs r0, #0
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x3d
	subs r0, #3
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	str r1, [sp]
	cmp r3, #4
	bhi _08019622
	lsls r0, r3, #2
	ldr r1, _08019600 @ =_08019604
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019600: .4byte _08019604
_08019604: @ jump table
	.4byte _0801961E @ case 0
	.4byte _08019618 @ case 1
	.4byte _08019618 @ case 2
	.4byte _0801961E @ case 3
	.4byte _08019618 @ case 4
_08019618:
	movs r5, #0x28
	rsbs r5, r5, #0
	b _08019624
_0801961E:
	movs r5, #0x30
	b _08019624
_08019622:
	movs r5, #0
_08019624:
	ldr r0, _080196E0 @ =gAnimation+0x44
	movs r3, #0x10
	ldrsh r1, [r0, r3]
	subs r1, r1, r5
	movs r4, #0x12
	ldrsh r2, [r0, r4]
	bl sub_8011E7C
_08019634:
	ldr r7, _080196E4 @ =gIORegisters
	mov ip, r7
	ldr r2, _080196E8 @ =0x0000E080
	ldr r1, _080196EC @ =gBG2MapBuffer
	movs r0, #0x80
	lsls r0, r0, #3
_08019640:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bne _08019640
	movs r0, #0
	ldr r6, _080196EC @ =gBG2MapBuffer
_0801964E:
	movs r2, #0
	adds r4, r0, #1
	lsls r3, r0, #5
_08019654:
	adds r0, r5, #0
	cmp r0, #0
	bge _0801965C
	adds r0, #7
_0801965C:
	asrs r0, r0, #3
	subs r0, r2, r0
	cmp r0, #0x1e
	bhi _08019674
	adds r0, #1
	adds r0, r3, r0
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r7, sb
	ldrh r1, [r7]
	adds r1, #0x80
	strh r1, [r0]
_08019674:
	adds r2, #1
	movs r0, #2
	add sb, r0
	cmp r2, #0x1d
	ble _08019654
	adds r0, r4, #0
	cmp r0, #0x13
	ble _0801964E
	movs r1, #0x9a
	lsls r1, r1, #3
	add sl, r1
	ldr r1, _080196F0 @ =0x040000D4
	mov r2, sl
	str r2, [r1]
	ldr r0, _080196F4 @ =gUnknown_0203B500
	str r0, [r1, #4]
	ldr r0, _080196F8 @ =0x80002580
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, ip
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r4, [r1]
	orrs r0, r4
	strh r0, [r1]
	ldr r0, _080196FC @ =0x00001E0A
	mov r7, ip
	strh r0, [r7, #4]
	movs r0, #0x20
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	beq _080196C2
	ldr r0, _08019700 @ =0x0000F7FF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
_080196C2:
	movs r0, #4
	ldr r4, [sp]
	ldrb r4, [r4]
	orrs r0, r4
	ldr r7, [sp]
	strb r0, [r7]
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080196E0: .4byte gAnimation+0x44
_080196E4: .4byte gIORegisters
_080196E8: .4byte 0x0000E080
_080196EC: .4byte gBG2MapBuffer
_080196F0: .4byte 0x040000D4
_080196F4: .4byte gUnknown_0203B500
_080196F8: .4byte 0x80002580
_080196FC: .4byte 0x00001E0A
_08019700: .4byte 0x0000F7FF

	thumb_func_start sub_8019704
sub_8019704: @ 0x08019704
	push {r4, lr}
	sub sp, #4
	ldr r4, _0801973C @ =gScriptContext
	movs r3, #0
_0801970C:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _0801970C
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	bl SetBGMVolume
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801973C: .4byte gScriptContext

	thumb_func_start sub_8019740
sub_8019740: @ 0x08019740
	ldr r0, _08019750 @ =gMain
	movs r1, #0
	strb r1, [r0, #0x18]
	strb r1, [r0, #0x19]
	movs r1, #1
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
_08019750: .4byte gMain

	thumb_func_start sub_8019754
sub_8019754: @ 0x08019754
	ldr r1, _08019764 @ =gMain
	adds r1, #0x3e
	ldrb r2, [r1]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_08019764: .4byte gMain

	thumb_func_start sub_8019768
sub_8019768: @ 0x08019768
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _080197A0 @ =gScriptContext
	ldr r5, _080197A4 @ =gMain
	movs r3, #0
_08019772:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08019772
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #1
	beq _080197BC
	cmp r0, #1
	bgt _080197A8
	cmp r0, #0
	beq _080197B2
	b _080197E8
	.align 2, 0
_080197A0: .4byte gScriptContext
_080197A4: .4byte gMain
_080197A8:
	cmp r0, #2
	beq _080197C8
	cmp r0, #3
	beq _080197D4
	b _080197E8
_080197B2:
	mov r0, sp
	ldrh r0, [r0, #2]
	bl sub_8016E74
	b _080197E8
_080197BC:
	mov r0, sp
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xb4
	strh r1, [r0]
	b _080197E8
_080197C8:
	mov r0, sp
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xaa
	strh r1, [r0]
	b _080197E8
_080197D4:
	adds r1, r5, #0
	adds r1, #0xb4
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa4
	strb r2, [r0]
	bl ResetHPBarHealthToMax
_080197E8:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80197F4
sub_80197F4: @ 0x080197F4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _08019848 @ =gScriptContext
	ldr r2, _0801984C @ =gMain
	mov r1, sp
	ldr r5, [r3]
	ldrh r0, [r5]
	strh r0, [r1]
	mov r0, sp
	ldrh r4, [r5, #2]
	strh r4, [r0, #2]
	ldrh r6, [r3, #0x12]
	ldrb r0, [r3, #0x12]
	cmp r0, #0
	bne _08019850
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r4, [r0]
	mov r0, sp
	ldrh r1, [r0]
	ldrh r0, [r2, #0x34]
	strh r0, [r2, #0x38]
	strh r1, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #1
	movs r4, #0x96
	lsls r4, r4, #2
	adds r0, r2, r4
	strb r1, [r0]
	movs r0, #1
	orrs r0, r6
	strh r0, [r3, #0x12]
	movs r0, #1
	b _08019874
	.align 2, 0
_08019848: .4byte gScriptContext
_0801984C: .4byte gMain
_08019850:
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08019862
	movs r0, #1
	b _08019874
_08019862:
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r6
	strh r0, [r3, #0x12]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x34]
	adds r0, r5, #4
	str r0, [r3]
	movs r0, #0
_08019874:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_801987C
sub_801987C: @ 0x0801987C
	push {r4, r5, lr}
	ldr r5, _080198A0 @ =gScriptContext
	ldr r4, _080198A4 @ =gMain
	ldrh r0, [r4, #0x34]
	bl sub_80051AC
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080198A8
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	b _080198AE
	.align 2, 0
_080198A0: .4byte gScriptContext
_080198A4: .4byte gMain
_080198A8:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r1, [r0]
_080198AE:
	ldr r0, [r5]
	ldrh r1, [r0]
	adds r0, #2
	str r0, [r5]
	lsrs r0, r1, #8
	cmp r0, #1
	beq _080198D8
	cmp r0, #1
	bgt _080198C6
	cmp r0, #0
	beq _080198D0
	b _080198EE
_080198C6:
	cmp r0, #2
	beq _080198DE
	cmp r0, #3
	beq _080198E8
	b _080198EE
_080198D0:
	rsbs r1, r1, #0
	adds r0, r4, #0
	adds r0, #0x4c
	b _080198EC
_080198D8:
	adds r0, r4, #0
	adds r0, #0x4c
	b _080198EC
_080198DE:
	rsbs r0, r1, #0
	adds r2, r4, #0
	adds r2, #0x4d
	strb r0, [r2]
	b _080198EE
_080198E8:
	adds r0, r4, #0
	adds r0, #0x4d
_080198EC:
	strb r1, [r0]
_080198EE:
	ldr r1, [r5]
	adds r2, r4, #0
	adds r2, #0x50
	movs r0, #0xf0
	ldrh r1, [r1]
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801990C
sub_801990C: @ 0x0801990C
	push {r4, lr}
	sub sp, #8
	ldr r4, _08019944 @ =gScriptContext
	ldr r1, _08019948 @ =gMain
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _0801994C
	mov r2, sp
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #4]
	bl InitSpecialEffectsWithMosaic
	movs r0, #1
	ldrh r1, [r4, #0x12]
	orrs r0, r1
	strh r0, [r4, #0x12]
	movs r0, #1
	b _08019976
	.align 2, 0
_08019944: .4byte gScriptContext
_08019948: .4byte gMain
_0801994C:
	adds r0, r1, #0
	adds r0, #0x90
	ldrh r1, [r0]
	ldr r0, _08019960 @ =0x0000FFFF
	cmp r1, r0
	beq _08019964
	cmp r1, #0
	beq _08019964
	movs r0, #1
	b _08019976
	.align 2, 0
_08019960: .4byte 0x0000FFFF
_08019964:
	ldr r0, [r4]
	adds r0, #6
	str r0, [r4]
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r1, [r4, #0x12]
	ands r0, r1
	strh r0, [r4, #0x12]
	movs r0, #0
_08019976:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8019980
sub_8019980: @ 0x08019980
	push {r4, lr}
	sub sp, #8
	ldr r4, _080199B4 @ =gScriptContext
	mov r2, sp
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #4]
	bl InitSpecialEffects
	ldr r0, [r4]
	adds r0, #6
	str r0, [r4]
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080199B4: .4byte gScriptContext

	thumb_func_start sub_80199B8
sub_80199B8: @ 0x080199B8
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08019A04 @ =gScriptContext
	movs r3, #0
	ldr r5, _08019A08 @ =gMain
_080199C2:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080199C2
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, #4
	mov r0, sp
	ldrh r2, [r0, #2]
	movs r0, #0xf
	ands r0, r2
	orrs r1, r0
	ldr r3, _08019A0C @ =0x000002C6
	adds r0, r5, r3
	strb r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #1
	beq _08019A3A
	cmp r0, #1
	bgt _08019A10
	cmp r0, #0
	beq _08019A16
	b _08019A80
	.align 2, 0
_08019A04: .4byte gScriptContext
_08019A08: .4byte gMain
_08019A0C: .4byte 0x000002C6
_08019A10:
	cmp r0, #2
	beq _08019A5E
	b _08019A80
_08019A16:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08019A2E
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _08019A80
_08019A2E:
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #0
	bl sub_800B898
	b _08019A80
_08019A3A:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08019A52
	bl LoadCounselBenchGraphics
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08019A80
_08019A52:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800BA40
	b _08019A80
_08019A5E:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08019A76
	bl LoadCounselBenchGraphics
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
	b _08019A80
_08019A76:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800BA40
_08019A80:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8019A8C
sub_8019A8C: @ 0x08019A8C
	ldr r0, _08019AA4 @ =gMain
	adds r0, #0x90
	ldrh r1, [r0]
	cmp r1, #0
	beq _08019AA0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08019AA8
_08019AA0:
	movs r0, #0
	b _08019AAA
	.align 2, 0
_08019AA4: .4byte gMain
_08019AA8:
	movs r0, #1
_08019AAA:
	bx lr

	thumb_func_start sub_8019AAC
sub_8019AAC: @ 0x08019AAC
	push {r4, lr}
	ldr r4, _08019AC8 @ =gMain
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #5
	bls _08019ABE
	b _08019BDE
_08019ABE:
	lsls r0, r0, #2
	ldr r1, _08019ACC @ =_08019AD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019AC8: .4byte gMain
_08019ACC: .4byte _08019AD0
_08019AD0: @ jump table
	.4byte _08019AE8 @ case 0
	.4byte _08019AFE @ case 1
	.4byte _08019B44 @ case 2
	.4byte _08019B6C @ case 3
	.4byte _08019BA0 @ case 4
	.4byte _08019BB0 @ case 5
_08019AE8:
	movs r0, #0x55
	bl PlayAnimation
	movs r0, #0x53
	bl PlaySE
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #1
	b _08019BDC
_08019AFE:
	movs r0, #0x55
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	ldrh r0, [r3, #0x10]
	subs r0, #0xa
	strh r0, [r3, #0x10]
	ldr r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #0x16
	orrs r1, r2
	str r1, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x58
	bgt _08019BDE
	movs r0, #0x58
	strh r0, [r3, #0x10]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #2
	strb r0, [r1]
	ldr r2, _08019B40 @ =0x00000259
	adds r1, r4, r2
	movs r0, #0
	b _08019BDC
	.align 2, 0
_08019B40: .4byte 0x00000259
_08019B44:
	ldr r0, _08019B68 @ =0x00000259
	adds r3, r4, r0
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _08019BDE
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	strb r2, [r3]
	b _08019BDE
	.align 2, 0
_08019B68: .4byte 0x00000259
_08019B6C:
	movs r0, #0x55
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	ldrh r2, [r3, #0x10]
	subs r2, #0xa
	strh r2, [r3, #0x10]
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _08019BDE
	adds r0, r3, #0
	bl DestroyAnimation
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #4
	b _08019BDC
_08019BA0:
	movs r0, #1
	bl sub_8016E74
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #5
	b _08019BDC
_08019BB0:
	bl IsHPBarAnimating
	cmp r0, #1
	beq _08019BDE
	ldr r1, _08019BE4 @ =gMain
	movs r0, #1
	strb r0, [r1, #0x19]
	ldr r0, _08019BE8 @ =gIORegisters
	adds r0, #0x4a
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0x57
	bl PlaySE
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x63
_08019BDC:
	strb r0, [r1]
_08019BDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019BE4: .4byte gMain
_08019BE8: .4byte gIORegisters

	thumb_func_start sub_8019BEC
sub_8019BEC: @ 0x08019BEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08019C14 @ =gMain
	mov sl, r0
	movs r0, #0x96
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #4
	bls _08019C08
	b _08019E8A
_08019C08:
	lsls r0, r0, #2
	ldr r1, _08019C18 @ =_08019C1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019C14: .4byte gMain
_08019C18: .4byte _08019C1C
_08019C1C: @ jump table
	.4byte _08019C30 @ case 0
	.4byte _08019C40 @ case 1
	.4byte _08019CF4 @ case 2
	.4byte _08019E3C @ case 3
	.4byte _08019E60 @ case 4
_08019C30:
	movs r0, #0x6a
	bl PlayAnimation
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #1
	b _08019E88
_08019C40:
	movs r0, #0x6a
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x38
	strh r0, [r2, #0x10]
	movs r0, #0x30
	strh r0, [r2, #0x12]
	movs r1, #0xa0
	add r1, sl
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	ldr r4, _08019CEC @ =gSineTable
	adds r1, r4, #0
	adds r1, #0x80
	movs r3, #0
	ldrsh r2, [r1, r3]
	mov sb, r2
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl fix_mul
	ldr r6, _08019CF0 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r3, r8
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
	strh r0, [r6, #0x16]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl fix_mul
	strh r0, [r6, #0x1e]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #2
	b _08019E88
	.align 2, 0
_08019CEC: .4byte gSineTable
_08019CF0: .4byte gOamObjects
_08019CF4:
	mov r7, sl
	adds r7, #0xa0
	ldrh r0, [r7]
	subs r0, #0x10
	strh r0, [r7]
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x11
	cmp r0, r1
	bgt _08019DC0
	ldr r4, _08019DB0 @ =gSineTable
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	ldr r6, _08019DB4 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	movs r1, #0
	ldrsh r0, [r7, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r7, r2]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
	strh r0, [r6, #0x16]
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	strh r0, [r6, #0x1e]
	movs r0, #0x6a
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _08019DB8 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x58
	strh r0, [r2, #0x10]
	movs r0, #0x40
	strh r0, [r2, #0x12]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _08019DBC @ =0x00000259
	add r1, sl
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #3
	b _08019E88
	.align 2, 0
_08019DB0: .4byte gSineTable
_08019DB4: .4byte gOamObjects
_08019DB8: .4byte 0xFFDFFFFF
_08019DBC: .4byte 0x00000259
_08019DC0:
	ldr r4, _08019E34 @ =gSineTable
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	ldr r6, _08019E38 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	movs r1, #0
	ldrsh r0, [r7, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r7, r2]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
	strh r0, [r6, #0x16]
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	strh r0, [r6, #0x1e]
	b _08019E8A
	.align 2, 0
_08019E34: .4byte gSineTable
_08019E38: .4byte gOamObjects
_08019E3C:
	ldr r2, _08019E5C @ =0x00000259
	add r2, sl
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bls _08019E8A
	movs r0, #0
	strb r0, [r2]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #4
	b _08019E88
	.align 2, 0
_08019E5C: .4byte 0x00000259
_08019E60:
	movs r0, #0x6a
	bl FindAnimationFromAnimId
	adds r2, r0, #0
	ldrh r0, [r2, #0x12]
	subs r0, #0xa
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08019E8A
	adds r0, r2, #0
	bl DestroyAnimation
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0x63
_08019E88:
	strb r0, [r1]
_08019E8A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8019E98
sub_8019E98: @ 0x08019E98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x88
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x80]
	movs r7, #0
	ldr r6, _08019F3C @ =0x040000D4
_08019EAE:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r2, _08019F40 @ =gUnknown_03003E50
	adds r1, r0, r2
	ldr r0, _08019F44 @ =0x00000FFF
	ldrh r2, [r1]
	ands r0, r2
	adds r3, r7, #0
	movs r2, #0xf
	ands r3, r2
	lsrs r4, r7, #4
	ands r4, r2
	lsls r0, r0, #7
	ldr r2, _08019F48 @ =gCharSet
	adds r0, r0, r2
	ldr r2, [sp, #0x80]
	cmp r2, #0
	bne _08019EDA
	ldrb r2, [r1, #0xa]
	cmp r2, #0
	beq _08019F54
_08019EDA:
	str r0, [r6]
	mov r0, sp
	str r0, [r6, #4]
	ldr r0, _08019F4C @ =0x80000040
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r1, sp
	lsls r0, r2, #1
	adds r0, r0, r2
	movs r5, #0
	lsls r3, r3, #7
	mov r8, r3
	lsls r4, r4, #0xb
	mov ip, r4
	adds r2, r7, #1
	str r2, [sp, #0x84]
	movs r7, #0xf
	mov sl, r7
	movs r2, #0xf0
	mov sb, r2
	lsls r4, r0, #4
_08019F04:
	ldrb r3, [r1]
	adds r2, r3, #0
	mov r7, sl
	ands r2, r7
	mov r7, sb
	ands r3, r7
	cmp r2, #0
	beq _08019F16
	adds r2, r2, r0
_08019F16:
	cmp r3, #0
	beq _08019F1C
	adds r3, r3, r4
_08019F1C:
	orrs r2, r3
	strb r2, [r1]
	adds r1, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _08019F04
	mov r0, sp
	str r0, [r6]
	ldr r0, _08019F50 @ =0x06010000
	add r0, ip
	add r0, r8
	str r0, [r6, #4]
	ldr r2, _08019F4C @ =0x80000040
	str r2, [r6, #8]
	ldr r0, [r6, #8]
	b _08019F6C
	.align 2, 0
_08019F3C: .4byte 0x040000D4
_08019F40: .4byte gUnknown_03003E50
_08019F44: .4byte 0x00000FFF
_08019F48: .4byte gCharSet
_08019F4C: .4byte 0x80000040
_08019F50: .4byte 0x06010000
_08019F54:
	str r0, [r6]
	lsls r0, r3, #7
	lsls r1, r4, #0xb
	ldr r2, _08019F84 @ =0x06010000
	adds r1, r1, r2
	adds r0, r0, r1
	str r0, [r6, #4]
	ldr r0, _08019F88 @ =0x80000040
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	adds r2, r7, #1
	str r2, [sp, #0x84]
_08019F6C:
	ldr r7, [sp, #0x84]
	cmp r7, #0x1f
	bls _08019EAE
	add sp, #0x88
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019F84: .4byte 0x06010000
_08019F88: .4byte 0x80000040

	thumb_func_start sub_8019F8C
sub_8019F8C: @ 0x08019F8C
	push {r4, r5, lr}
	movs r4, #0
	ldr r3, _08019FE8 @ =0x040000D4
	ldr r5, _08019FEC @ =gUnknown_08028698
	ldr r2, _08019FF0 @ =gUnknown_03003AF0
_08019F96:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08019FDA
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	str r1, [r3]
	ldr r1, [r2, #0x10]
	str r1, [r3, #4]
	ldrh r0, [r0, #4]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r0, #4
	ldrb r1, [r2, #5]
	ands r0, r1
	cmp r0, #0
	bne _08019FDA
	ldrh r0, [r2, #0xe]
	lsls r1, r0, #3
	ldr r0, _08019FF4 @ =gOamObjects
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	strh r0, [r1]
	ldrh r0, [r2, #0xa]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0xc]
	strh r0, [r1, #4]
_08019FDA:
	adds r2, #0x14
	adds r4, #1
	cmp r4, #7
	bls _08019F96
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019FE8: .4byte 0x040000D4
_08019FEC: .4byte gUnknown_08028698
_08019FF0: .4byte gUnknown_03003AF0
_08019FF4: .4byte gOamObjects

	thumb_func_start sub_8019FF8
sub_8019FF8: @ 0x08019FF8
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _0801A010 @ =gUnknown_03003AF0
_08019FFE:
	ldrb r0, [r2]
	cmp r0, r3
	beq _0801A014
	adds r2, #0x14
	adds r1, #1
	cmp r1, #7
	bls _08019FFE
	movs r0, #0xff
	b _0801A016
	.align 2, 0
_0801A010: .4byte gUnknown_03003AF0
_0801A014:
	adds r0, r1, #0
_0801A016:
	bx lr

	thumb_func_start sub_801A018
sub_801A018: @ 0x0801A018
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0801A048 @ =0x06011800
	ldr r4, _0801A04C @ =gUnknown_08028698
	ldr r1, _0801A050 @ =gUnknown_03003AF0
_0801A022:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801A036
	ldrb r5, [r1]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	adds r3, r0, r3
_0801A036:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #7
	bls _0801A022
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A048: .4byte 0x06011800
_0801A04C: .4byte gUnknown_08028698
_0801A050: .4byte gUnknown_03003AF0

	thumb_func_start sub_801A054
sub_801A054: @ 0x0801A054
	push {r4, lr}
	ldr r3, _0801A0A4 @ =gScriptContext
	ldrh r1, [r3, #0x12]
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0x28
	bne _0801A06E
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	adds r0, #1
	strh r0, [r3, #0x12]
_0801A06E:
	ldr r0, _0801A0A8 @ =gMain
	ldrb r0, [r0, #0x19]
	cmp r0, #1
	bne _0801A09E
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A09E
	ldr r2, _0801A0AC @ =gBG1MapBuffer
	ldr r1, _0801A0B0 @ =gUnknown_08028736
	adds r0, r4, #0
	ldrh r3, [r3, #0x12]
	ands r0, r3
	lsrs r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, _0801A0B4 @ =0x000004DC
	adds r1, r2, r3
	strh r0, [r1]
	adds r0, #1
	ldr r1, _0801A0B8 @ =0x000004DE
	adds r2, r2, r1
	strh r0, [r2]
_0801A09E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A0A4: .4byte gScriptContext
_0801A0A8: .4byte gMain
_0801A0AC: .4byte gBG1MapBuffer
_0801A0B0: .4byte gUnknown_08028736
_0801A0B4: .4byte 0x000004DC
_0801A0B8: .4byte 0x000004DE
