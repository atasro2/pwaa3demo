	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_8013050
sub_8013050: @ 0x08013050
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _080131B0 @ =gMain
	str r0, [sp]
	movs r7, #0x80
	ldr r5, _080131B4 @ =gBG0MapBuffer
	ldr r0, _080131B8 @ =gAnimation
	ldr r1, [r0, #8]
	mov ip, r1
	ldr r2, [sp]
	str r2, [sp, #0x14]
	cmp r1, #0
	bne _08013074
	b _08013382
_08013074:
	mov r3, ip
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08013084
	b _08013376
_08013084:
	mov r1, ip
	adds r1, #0x3f
	strb r7, [r1]
	ldr r2, [sp]
	adds r2, #0x27
	movs r0, #2
	ldrb r2, [r2]
	ands r0, r2
	str r1, [sp, #0x10]
	adds r3, #0x25
	str r3, [sp, #0x18]
	mov r4, ip
	adds r4, #0x3e
	str r4, [sp, #0xc]
	cmp r0, #0
	bne _080130A6
	b _080132EE
_080130A6:
	mov r6, ip
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	bne _080130B6
	b _080132EE
_080130B6:
	ldr r4, [r6, #0x34]
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	ldr r2, [sp]
	movs r0, #0x12
	ldrsb r0, [r2, r0]
	subs r1, r1, r0
	mov sl, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	subs r1, r1, r0
	str r1, [sp, #4]
	ldr r6, _080131BC @ =0x000003FF
	mov r0, ip
	ldrh r1, [r0, #0x3c]
	ands r1, r6
	mov r8, r1
	ldrh r2, [r4]
	str r2, [sp, #8]
	lsls r0, r7, #2
	ldr r3, _080131C0 @ =gUnknown_0200AFC0
	adds r6, r0, r3
	movs r0, #0
	mov sb, r0
	cmp sb, r2
	blo _080130F0
	b _080132EE
_080130F0:
	ldr r1, _080131C4 @ =gSpriteSizeTable
	str r1, [sp, #0x1c]
_080130F4:
	subs r7, #1
	subs r5, #8
	subs r6, #4
	adds r4, #4
	ldrh r2, [r4, #2]
	lsrs r0, r2, #0xc
	lsls r0, r0, #2
	ldr r3, [sp, #0x1c]
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r6]
	movs r0, #0xc0
	lsls r0, r0, #6
	ldrh r1, [r4, #2]
	ands r0, r1
	lsls r2, r0, #2
	strh r2, [r5]
	mov r3, ip
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _08013142
	ldrb r1, [r6, #3]
	lsrs r0, r1, #1
	mov r3, sl
	subs r3, r3, r0
	mov sl, r3
	ldrb r1, [r6, #2]
	lsrs r0, r1, #1
	ldr r3, [sp, #4]
	subs r3, r3, r0
	str r3, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r2, r0
	strh r2, [r5]
_08013142:
	movs r0, #1
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #4]
	adds r1, r2, r0
	movs r0, #0x60
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08013156
	movs r1, #0x58
	rsbs r1, r1, #0
_08013156:
	cmp r1, #0xe0
	ble _0801315C
	movs r1, #0xe0
_0801315C:
	movs r0, #0xff
	adds r2, r1, #0
	ands r2, r0
	ldrh r3, [r5]
	orrs r2, r3
	strh r2, [r5]
	mov r1, ip
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08013180
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r5]
_08013180:
	movs r2, #0xc0
	lsls r2, r2, #8
	ldrh r0, [r4, #2]
	ands r2, r0
	strh r2, [r5, #2]
	mov r1, ip
	ldr r0, [r1]
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _080131CC
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrb r1, [r6, #3]
	adds r0, r1, r0
	mov r3, sl
	subs r0, r3, r0
	ldr r3, _080131C8 @ =0x000001FF
	adds r1, r3, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	b _080131E0
	.align 2, 0
_080131B0: .4byte gMain
_080131B4: .4byte gBG0MapBuffer
_080131B8: .4byte gAnimation
_080131BC: .4byte 0x000003FF
_080131C0: .4byte gUnknown_0200AFC0
_080131C4: .4byte gSpriteSizeTable
_080131C8: .4byte 0x000001FF
_080131CC:
	movs r0, #0
	ldrsb r0, [r4, r0]
	add r0, sl
	ldr r3, _0801325C @ =0x000001FF
	adds r1, r3, #0
	ands r0, r1
	mov r1, ip
	adds r1, #0x42
	ldrb r1, [r1]
	lsls r1, r1, #9
_080131E0:
	orrs r0, r1
	orrs r2, r0
	strh r2, [r5, #2]
	mov r1, ip
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08013214
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r3, [r5]
	orrs r0, r3
	strh r0, [r5]
	ldr r0, _08013260 @ =0x0000C1FF
	ldrh r1, [r5, #2]
	ands r0, r1
	strh r0, [r5, #2]
	mov r1, ip
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #9
	orrs r0, r1
	strh r0, [r5, #2]
_08013214:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r4, #2]
	ands r0, r2
	cmp r0, #0
	beq _0801322A
	movs r0, #0x80
	lsls r0, r0, #5
	ldrh r3, [r5, #2]
	orrs r0, r3
	strh r0, [r5, #2]
_0801322A:
	mov r0, ip
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r3, r0, #0xa
	mov r0, r8
	orrs r3, r0
	strh r3, [r5, #4]
	mov r1, ip
	ldr r0, [r1, #0x38]
	ldrb r1, [r0, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08013264
	mov r0, ip
	adds r0, #0x24
	ldrh r2, [r4, #2]
	lsrs r1, r2, #9
	movs r2, #7
	ands r1, r2
	ldrb r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #0xc
	orrs r3, r1
	b _08013296
	.align 2, 0
_0801325C: .4byte 0x000001FF
_08013260: .4byte 0x0000C1FF
_08013264:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013282
	mov r0, ip
	adds r0, #0x24
	ldrh r2, [r4, #2]
	lsrs r1, r2, #0xa
	movs r2, #3
	ands r1, r2
	ldrb r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #0xc
	orrs r3, r1
	b _08013296
_08013282:
	mov r1, ip
	adds r1, #0x24
	ldrh r2, [r4, #2]
	lsrs r0, r2, #0xb
	movs r2, #1
	ands r0, r2
	ldrb r1, [r1]
	adds r0, r1, r0
	lsls r0, r0, #0xc
	orrs r3, r0
_08013296:
	strh r3, [r5, #4]
	ldrh r3, [r6]
	lsrs r0, r3, #5
	add r8, r0
	ldr r0, [sp]
	adds r0, #0x90
	ldrh r1, [r0]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080132C0
	ldr r0, _080133F8 @ =0x0000FFFF
	cmp r1, r0
	beq _080132C0
	movs r0, #0x40
	ldr r1, _080133FC @ =gScriptContext
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _080132CA
_080132C0:
	movs r0, #0x80
	lsls r0, r0, #5
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
_080132CA:
	mov r3, ip
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080132E2
	movs r0, #0x80
	lsls r0, r0, #5
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
_080132E2:
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #8]
	cmp sb, r3
	bhs _080132EE
	b _080130F4
_080132EE:
	ldr r4, [sp, #0x10]
	ldrb r6, [r4]
	ldr r4, [sp, #0x18]
	ldrb r4, [r4]
	subs r0, r6, r4
	ldr r6, [sp, #0xc]
	strb r0, [r6]
	subs r7, r7, r0
	subs r7, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	beq _08013316
	movs r1, #0x80
	lsls r1, r1, #2
_0801330C:
	subs r5, #8
	strh r1, [r5]
	subs r7, #1
	cmp r7, r0
	bne _0801330C
_08013316:
	ldr r1, [sp, #0xc]
	ldrb r7, [r1]
	mov r2, ip
	ldrh r0, [r2, #0xc]
	subs r0, #0x6b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08013376
	lsls r3, r7, #3
	ldr r4, _08013400 @ =gOamObjects
	adds r3, r3, r4
	ldrh r6, [r2, #0xc]
	lsls r2, r6, #3
	ldr r1, _08013404 @ =0xFFFFFE78
	adds r0, r4, r1
	adds r2, r2, r0
	ldrh r0, [r3]
	strh r0, [r2]
	ldrh r0, [r3, #2]
	strh r0, [r2, #2]
	mov r4, ip
	adds r4, #0x24
	ldrb r6, [r4]
	lsls r1, r6, #0xc
	ldr r0, _08013408 @ =0x000003FF
	ldrh r6, [r3, #4]
	ands r0, r6
	orrs r1, r0
	strh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	mov r1, ip
	ldr r0, [r1, #0x20]
	adds r0, #4
	ldr r2, _0801340C @ =0x040000D4
	str r0, [r2]
	movs r0, #0xf
	ldrb r4, [r4]
	ands r0, r4
	lsls r0, r0, #5
	ldr r1, _08013410 @ =0x05000200
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08013414 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08013376:
	mov r3, ip
	ldr r3, [r3, #8]
	mov ip, r3
	cmp r3, #0
	beq _08013382
	b _08013074
_08013382:
	ldr r4, [sp, #0x14]
	ldrb r2, [r4, #8]
	cmp r2, #4
	beq _0801338C
	b _0801349C
_0801338C:
	ldr r0, _08013418 @ =gAnimation
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0xb
	beq _0801339C
	cmp r0, #0x21
	beq _0801339C
	b _0801349C
_0801339C:
	ldr r6, _08013418 @ =gAnimation
	ldr r0, [r6, #0x44]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _0801349C
	ldr r7, [sp, #0x14]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _0801349C
	ldr r0, _080133FC @ =gScriptContext
	ldrh r0, [r0, #0x1c]
	ands r2, r0
	cmp r2, #0
	beq _0801349C
	movs r1, #2
	mov sb, r1
	ldr r0, _08013400 @ =gOamObjects
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r6, r0, r2
	movs r3, #0x80
	lsls r3, r3, #2
	movs r4, #0xe4
	lsls r4, r4, #1
	adds r2, r0, r4
	movs r7, #0xe5
	lsls r7, r7, #1
	adds r4, r0, r7
	adds r1, r0, #0
	adds r1, #0x10
	adds r7, #2
	adds r5, r0, r7
_080133E0:
	adds r0, r3, #0
	ldrh r7, [r1]
	ands r0, r7
	cmp r0, #0
	beq _0801341C
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
	b _08013428
	.align 2, 0
_080133F8: .4byte 0x0000FFFF
_080133FC: .4byte gScriptContext
_08013400: .4byte gOamObjects
_08013404: .4byte 0xFFFFFE78
_08013408: .4byte 0x000003FF
_0801340C: .4byte 0x040000D4
_08013410: .4byte 0x05000200
_08013414: .4byte 0x80000010
_08013418: .4byte gAnimation
_0801341C:
	adds r1, #8
	movs r0, #1
	add sb, r0
	mov r7, sb
	cmp r7, #0x21
	bls _080133E0
_08013428:
	adds r5, r6, #0
	movs r0, #0x20
	mov sb, r0
	ldr r0, _08013478 @ =gTextBoxCharacters
	movs r1, #0x80
	lsls r1, r1, #8
	mov r8, r1
	movs r2, #0x80
	lsls r2, r2, #5
	mov sl, r2
	ldr r4, _0801347C @ =0x0000FBFF
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r2, r0, r3
_08013444:
	mov r0, r8
	ldrh r6, [r2]
	ands r0, r6
	cmp r0, #0
	beq _0801348E
	ldrh r1, [r2, #6]
	movs r3, #0
	strh r1, [r5]
	ldrh r7, [r2, #4]
	ldr r6, _08013480 @ =0x00004009
	adds r0, r7, r6
	strh r0, [r5, #2]
	ldrh r0, [r2, #2]
	strh r0, [r5, #4]
	mov r0, sl
	ldr r7, _08013484 @ =gScriptContext
	ldrh r7, [r7, #0x1c]
	ands r0, r7
	cmp r0, #0
	beq _08013488
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	orrs r0, r1
	b _0801348C
	.align 2, 0
_08013478: .4byte gTextBoxCharacters
_0801347C: .4byte 0x0000FBFF
_08013480: .4byte 0x00004009
_08013484: .4byte gScriptContext
_08013488:
	adds r0, r4, #0
	ands r0, r1
_0801348C:
	strh r0, [r5]
_0801348E:
	adds r5, #8
	adds r2, #0xc
	movs r6, #1
	add sb, r6
	mov r7, sb
	cmp r7, #0x3f
	bls _08013444
_0801349C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MoveAnimationTilesToRam
MoveAnimationTilesToRam: @ 0x080134AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xd4
	str r0, [sp, #0xc4]
	ldr r0, _0801357C @ =gAnimation
	ldr r0, [r0, #8]
	mov r8, r0
	cmp r0, #0
	bne _080134C6
	b _08013772
_080134C6:
	ldr r0, _08013580 @ =0x040000D4
	mov sl, r0
_080134CA:
	mov r2, r8
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	bne _080134DA
	b _08013766
_080134DA:
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r1
	cmp r0, #0
	bne _080134E6
	b _08013766
_080134E6:
	ldr r6, _08013584 @ =gUnknown_0200B1C0
	ldr r3, [sp, #0xc4]
	cmp r3, #0
	bne _080134F0
	ldr r6, [r2, #0x1c]
_080134F0:
	mov r0, r8
	ldr r0, [r0, #0x34]
	mov ip, r0
	ldrh r2, [r0]
	str r2, [sp, #0xc8]
	mov r0, r8
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _08013588 @ =gUnknown_0200AFC0
	adds r7, r0, r3
	ldr r0, _0801358C @ =0xBFFFFFFF
	ands r1, r0
	mov r0, r8
	str r1, [r0]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	str r0, [sp, #0xcc]
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r0, r1
	cmp r0, #0
	beq _080135C0
	movs r5, #0
	cmp r5, r2
	bhs _0801360C
_08013524:
	movs r2, #4
	add ip, r2
	subs r7, #4
	ldrh r3, [r7]
	adds r3, r3, r6
	mov sb, r3
	ldr r0, _08013590 @ =0x000001FF
	mov r1, ip
	ldrh r1, [r1, #2]
	ands r0, r1
	mov r2, r8
	ldr r1, [r2, #0x18]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r1, r0
	adds r5, #1
	str r5, [sp, #0xd0]
	cmp sb, r6
	bls _080135B6
	ldr r4, _08013580 @ =0x040000D4
	mov r5, sp
_08013550:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08013598
	ldr r1, _08013594 @ =0x00007FFF
	ands r1, r2
	ldrh r0, [r3, #2]
	strh r0, [r5]
	mov r0, sp
	str r0, [r4]
	str r6, [r4, #4]
	lsls r2, r1, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	adds r6, r6, r2
	adds r3, #4
	b _080135B2
	.align 2, 0
_0801357C: .4byte gAnimation
_08013580: .4byte 0x040000D4
_08013584: .4byte gUnknown_0200B1C0
_08013588: .4byte gUnknown_0200AFC0
_0801358C: .4byte 0xBFFFFFFF
_08013590: .4byte 0x000001FF
_08013594: .4byte 0x00007FFF
_08013598:
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r3, #2
	str r3, [r4]
	str r6, [r4, #4]
	lsrs r1, r0, #1
	movs r2, #0x80
	lsls r2, r2, #0x18
	orrs r1, r2
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	adds r6, r6, r0
	adds r3, r3, r0
_080135B2:
	cmp sb, r6
	bhi _08013550
_080135B6:
	ldr r5, [sp, #0xd0]
	ldr r3, [sp, #0xc8]
	cmp r5, r3
	blo _08013524
	b _0801360C
_080135C0:
	mov r0, r8
	ldr r1, [r0, #0x38]
	movs r0, #1
	ldrb r1, [r1, #3]
	ands r0, r1
	ldr r1, _08013694 @ =0x000001FF
	mov sb, r1
	movs r5, #0
	ldr r2, [sp, #0xc8]
	cmp r5, r2
	bhs _0801360C
	ldr r2, _08013698 @ =0x040000D4
	movs r4, #0x80
	lsls r4, r4, #0x18
_080135DC:
	movs r3, #4
	add ip, r3
	subs r7, #4
	mov r0, sb
	mov r1, ip
	ldrh r1, [r1, #2]
	ands r0, r1
	lsls r0, r0, #5
	mov r3, r8
	ldr r1, [r3, #0x18]
	adds r3, r1, r0
	str r3, [r2]
	str r6, [r2, #4]
	ldrh r1, [r7]
	lsrs r0, r1, #1
	orrs r0, r4
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r3, r1, #0
	adds r6, r3, r6
	adds r5, #1
	ldr r0, [sp, #0xc8]
	cmp r5, r0
	blo _080135DC
_0801360C:
	mov r1, r8
	ldrh r4, [r1, #0xc]
	adds r0, r4, #0
	subs r0, #0x83
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0801361E
	b _08013766
_0801361E:
	ldr r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	bne _0801362C
	b _08013766
_0801362C:
	adds r1, #0x24
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #5
	ldr r3, _0801369C @ =0x05000200
	adds r3, r3, r0
	mov sb, r3
	ldr r0, [sp, #0xcc]
	lsls r0, r0, #5
	str r0, [sp, #0xcc]
	mov r1, r8
	ldr r0, [r1, #0x20]
	adds r3, r0, #4
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08013654
	ldr r3, [r1, #0x30]
_08013654:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	cmp r2, #0
	beq _080136D0
	mov r2, sl
	str r3, [r2]
	add r2, sp, #4
	mov r3, sl
	str r2, [r3, #4]
	ldr r0, [sp, #0xcc]
	lsrs r1, r0, #1
	adds r0, r1, #0
	movs r3, #0x80
	lsls r3, r3, #0x18
	orrs r0, r3
	mov r3, sl
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	adds r5, r2, #0
	adds r6, r1, #0
	ldr r7, _080136A0 @ =0x0000FFFE
	adds r4, r5, #0
_08013682:
	ldr r0, _080136A4 @ =gUnknown_03003840
	ldrh r0, [r0]
	cmp r0, r7
	bne _080136A8
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #1
	b _080136AE
	.align 2, 0
_08013694: .4byte 0x000001FF
_08013698: .4byte 0x040000D4
_0801369C: .4byte 0x05000200
_080136A0: .4byte 0x0000FFFE
_080136A4: .4byte gUnknown_03003840
_080136A8:
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
_080136AE:
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #0
	adds r0, #0x5e
	cmp r4, r0
	bls _08013682
	mov r1, sl
	str r5, [r1]
	mov r2, sb
	str r2, [r1, #4]
	movs r3, #0x80
	lsls r3, r3, #0x18
	orrs r6, r3
	str r6, [r1, #8]
	b _0801375A
_080136D0:
	ldr r1, _08013740 @ =gMain
	adds r1, #0x3d
	movs r0, #0x10
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08013744
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _08013744
	adds r0, r4, #0
	subs r0, #0x52
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x37
	bls _08013744
	mov r2, sl
	str r3, [r2]
	add r2, sp, #0x64
	mov r3, sl
	str r2, [r3, #4]
	ldr r0, [sp, #0xcc]
	lsrs r1, r0, #1
	adds r0, r1, #0
	movs r3, #0x80
	lsls r3, r3, #0x18
	orrs r0, r3
	mov r3, sl
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r5, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r7, #0
_08013716:
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0x2f
	bls _08013716
	mov r0, sl
	str r7, [r0]
	mov r1, sb
	str r1, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #0x18
	orrs r6, r2
	str r6, [r0, #8]
	ldr r0, [r0, #8]
	b _0801375C
	.align 2, 0
_08013740: .4byte gMain
_08013744:
	mov r0, sl
	str r3, [r0]
	mov r1, sb
	str r1, [r0, #4]
	ldr r2, [sp, #0xcc]
	lsrs r0, r2, #1
	movs r3, #0x80
	lsls r3, r3, #0x18
	orrs r0, r3
	mov r1, sl
	str r0, [r1, #8]
_0801375A:
	ldr r0, [r1, #8]
_0801375C:
	mov r2, r8
	ldr r0, [r2]
	ldr r1, _080137BC @ =0xFEFFFFFF
	ands r0, r1
	str r0, [r2]
_08013766:
	mov r3, r8
	ldr r3, [r3, #8]
	mov r8, r3
	cmp r3, #0
	beq _08013772
	b _080134CA
_08013772:
	ldr r2, _080137C0 @ =gMain
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013788
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08013788:
	ldr r0, _080137C4 @ =gUnknown_08028150
	movs r1, #0
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _080137C8 @ =0x04000006
	ldrb r0, [r0]
	cmp r0, #0x9f
	bgt _080137AA
	ldr r0, [sp, #0xc4]
	cmp r0, #0
	bne _080137AA
	ldr r0, _080137CC @ =gUnknown_08028168
	movs r1, #0
	movs r2, #0xd
	bl nullsub_20
_080137AA:
	add sp, #0xd4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080137BC: .4byte 0xFEFFFFFF
_080137C0: .4byte gMain
_080137C4: .4byte gUnknown_08028150
_080137C8: .4byte 0x04000006
_080137CC: .4byte gUnknown_08028168

	thumb_func_start UpdateAnimations
UpdateAnimations: @ 0x080137D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r5, _08013834 @ =gMain
	ldr r2, _08013838 @ =gAnimation
	ldr r0, _0801383C @ =gCourtScroll
	mov r8, r0
	ldr r1, _08013840 @ =gScriptContext
	mov sl, r1
	ldr r3, _08013844 @ =gIORegisters
	str r3, [sp]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080137FE
	b _08013992
_080137FE:
	ldr r4, [r2, #8]
	cmp r4, #0
	bne _08013806
	b _08013992
_08013806:
	adds r6, r3, #0
	adds r6, #0x48
_0801380A:
	ldrh r1, [r4, #0xc]
	adds r0, r1, #0
	subs r0, #0x1b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0801389A
	adds r2, r4, #0
	adds r2, #0x2c
	ldrh r1, [r5, #0x34]
	ldrb r7, [r2]
	cmp r1, r7
	beq _08013862
	movs r0, #0x20
	mov r3, sl
	ldrh r3, [r3, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _08013848
	strb r1, [r2]
	b _0801388A
	.align 2, 0
_08013834: .4byte gMain
_08013838: .4byte gAnimation
_0801383C: .4byte gCourtScroll
_08013840: .4byte gScriptContext
_08013844: .4byte gIORegisters
_08013848:
	adds r0, r5, #0
	adds r0, #0xc0
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080138B0
	adds r0, r4, #0
	movs r1, #0
	bl ChangeAnimationActivity
	b _0801398A
_08013862:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	bne _0801388A
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801388A
	ldrh r0, [r4, #0xc]
	bl PlayAnimation
	adds r0, r4, #0
	movs r1, #1
	bl ChangeAnimationActivity
_0801388A:
	ldrh r7, [r5, #0x36]
	cmp r7, #0x80
	bne _080138D6
	adds r0, r4, #0
	movs r1, #0
	bl ChangeAnimationActivity
	b _080138D6
_0801389A:
	adds r0, r1, #0
	subs r0, #0x8a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _080138B8
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp sb, r0
	beq _080138D6
_080138B0:
	adds r0, r4, #0
	bl DestroyAnimation
	b _0801398A
_080138B8:
	adds r0, r1, #0
	subs r0, #0xa8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _080138D6
	adds r0, r4, #0
	adds r0, #0x2c
	ldrh r1, [r5, #0x34]
	ldrb r0, [r0]
	cmp r1, r0
	beq _080138D6
	adds r0, r4, #0
	bl DestroyAnimation
_080138D6:
	ldr r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013912
	ldr r3, [sp]
	adds r3, #0x48
	ldr r2, [sp]
	adds r2, #0x4c
	ldrh r7, [r4, #0xc]
	cmp r7, #0x70
	bne _08013906
	movs r0, #0x88
	lsls r0, r0, #0x16
	orrs r1, r0
	str r1, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r7, [r6]
	orrs r0, r7
	strh r0, [r6]
	ldr r0, _080139DC @ =0x00000B08
	strh r0, [r2]
_08013906:
	ldr r1, _080139E0 @ =0x04000050
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2]
	strh r0, [r1]
_08013912:
	ldr r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013930
	movs r0, #0x88
	lsls r0, r0, #0x16
	orrs r1, r0
	str r1, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r3, [r6]
	orrs r0, r3
	strh r0, [r6]
_08013930:
	ldr r0, [r4]
	ldr r1, _080139E4 @ =gUnknown_02000080
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	bne _0801394E
	ldrh r0, [r4, #0xc]
	subs r0, #0x52
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x37
	bls _0801394E
	adds r0, r4, #0
	bl UpdateAnimationBlend
_0801394E:
	ldr r0, [r4]
	cmp r0, #0
	bge _0801395E
	adds r0, r4, #0
	bl AdvanceAnimationFrame
	cmp r0, #0
	beq _0801398A
_0801395E:
	ldrh r7, [r4, #0xc]
	cmp r7, #8
	bhi _08013976
	ldr r0, _080139E8 @ =gUnknown_0814DC70
	adds r1, r7, #0
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
_08013976:
	mov r1, r8
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _0801398A
	ldrh r3, [r4, #0xc]
	cmp r3, #0xff
	bne _0801398A
	adds r0, r4, #0
	bl sub_8014328
_0801398A:
	ldr r4, [r4, #8]
	cmp r4, #0
	beq _08013992
	b _0801380A
_08013992:
	ldr r4, _080139EC @ =gAnimation+0x44
	mov r7, r8
	ldrh r0, [r7, #4]
	cmp r0, #0
	beq _080139AE
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _080139AE
	adds r0, r4, #0
	bl sub_8014328
_080139AE:
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080139C6
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
	bl ClearAllAnimationSprites
_080139C6:
	bl sub_8013050
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080139DC: .4byte 0x00000B08
_080139E0: .4byte 0x04000050
_080139E4: .4byte gUnknown_02000080
_080139E8: .4byte gUnknown_0814DC70
_080139EC: .4byte gAnimation+0x44

	thumb_func_start nullsub_7
nullsub_7: @ 0x080139F0
	bx lr
	.align 2, 0

	thumb_func_start sub_80139F4
sub_80139F4: @ 0x080139F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _08013ABC @ =gAnimation
	ldr r6, [r0, #8]
	cmp r6, #0
	bne _08013A0A
	b _08013B4C
_08013A0A:
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	ldr r2, [r6, #8]
	str r2, [sp, #4]
	cmp r0, #0
	bne _08013A1C
	b _08013B44
_08013A1C:
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r1
	cmp r0, #0
	bne _08013A28
	b _08013B44
_08013A28:
	ldrh r0, [r6, #0xc]
	subs r0, #0x83
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08013A36
	b _08013B44
_08013A36:
	ldr r5, [r6, #0x1c]
	ldr r3, [r6, #0x34]
	mov ip, r3
	ldrh r0, [r3]
	mov sl, r0
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r2, _08013AC0 @ =gUnknown_0200AFC0
	adds r7, r0, r2
	ldr r0, _08013AC4 @ =0xBFFFFFFF
	ands r1, r0
	str r1, [r6]
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #0x18
	cmp r0, #0
	bge _08013AFA
	movs r2, #0
	cmp r2, sl
	bhs _08013B3C
_08013A64:
	movs r3, #4
	add ip, r3
	subs r7, #4
	ldrh r0, [r7]
	adds r0, r0, r5
	mov r8, r0
	ldr r0, _08013AC8 @ =0x000001FF
	mov r1, ip
	ldrh r1, [r1, #2]
	ands r0, r1
	ldr r1, [r6, #0x18]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r1, r0
	adds r2, #1
	str r2, [sp, #8]
	cmp r8, r5
	bls _08013AF2
	ldr r4, _08013ACC @ =0x040000D4
	mov sb, sp
_08013A8E:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08013AD4
	ldr r1, _08013AD0 @ =0x00007FFF
	ands r1, r2
	ldrh r0, [r3, #2]
	mov r2, sb
	strh r0, [r2]
	mov r0, sp
	str r0, [r4]
	str r5, [r4, #4]
	lsls r2, r1, #1
	movs r0, #0x81
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, r5, r2
	adds r3, #4
	b _08013AEE
	.align 2, 0
_08013ABC: .4byte gAnimation
_08013AC0: .4byte gUnknown_0200AFC0
_08013AC4: .4byte 0xBFFFFFFF
_08013AC8: .4byte 0x000001FF
_08013ACC: .4byte 0x040000D4
_08013AD0: .4byte 0x00007FFF
_08013AD4:
	ldrh r1, [r3]
	lsls r2, r1, #1
	adds r3, #2
	str r3, [r4]
	str r5, [r4, #4]
	lsrs r1, r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, r5, r2
	adds r3, r3, r2
_08013AEE:
	cmp r8, r5
	bhi _08013A8E
_08013AF2:
	ldr r2, [sp, #8]
	cmp r2, sl
	blo _08013A64
	b _08013B3C
_08013AFA:
	ldr r1, [r6, #0x38]
	movs r0, #1
	ldrb r1, [r1, #3]
	ands r0, r1
	ldr r2, _08013B74 @ =0x000001FF
	mov sb, r2
	movs r2, #0
	cmp r2, sl
	bhs _08013B3C
	ldr r4, _08013B78 @ =0x040000D4
	mov r8, r3
_08013B10:
	movs r3, #4
	add ip, r3
	subs r7, #4
	mov r0, sb
	mov r1, ip
	ldrh r1, [r1, #2]
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, [r6, #0x18]
	adds r3, r1, r0
	str r3, [r4]
	str r5, [r4, #4]
	ldrh r3, [r7]
	lsrs r0, r3, #1
	mov r1, r8
	orrs r0, r1
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, r3, r5
	adds r2, #1
	cmp r2, sl
	blo _08013B10
_08013B3C:
	ldr r0, [r6]
	ldr r1, _08013B7C @ =0xFEFFFFFF
	ands r0, r1
	str r0, [r6]
_08013B44:
	ldr r6, [sp, #4]
	cmp r6, #0
	beq _08013B4C
	b _08013A0A
_08013B4C:
	ldr r2, _08013B80 @ =gMain
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013B62
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_08013B62:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013B74: .4byte 0x000001FF
_08013B78: .4byte 0x040000D4
_08013B7C: .4byte 0xFEFFFFFF
_08013B80: .4byte gMain

	thumb_func_start sub_8013B84
sub_8013B84: @ 0x08013B84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r5, _08013BF8 @ =gMain
	ldr r2, _08013BFC @ =gAnimation
	ldr r0, _08013C00 @ =gCourtScroll
	mov r8, r0
	ldr r1, _08013C04 @ =gScriptContext
	mov sl, r1
	ldr r3, _08013C08 @ =gIORegisters
	str r3, [sp]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08013BB2
	b _08013D56
_08013BB2:
	ldr r4, [r2, #8]
	cmp r4, #0
	bne _08013BBA
	b _08013D56
_08013BBA:
	adds r6, r3, #0
	adds r6, #0x48
_08013BBE:
	ldrh r1, [r4, #0xc]
	adds r0, r1, #0
	subs r0, #0x83
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08013BCE
	b _08013D4E
_08013BCE:
	adds r0, r1, #0
	subs r0, #0x1b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08013C5E
	adds r2, r4, #0
	adds r2, #0x2c
	ldrh r1, [r5, #0x34]
	ldrb r7, [r2]
	cmp r1, r7
	beq _08013C26
	movs r0, #0x20
	mov r3, sl
	ldrh r3, [r3, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _08013C0C
	strb r1, [r2]
	b _08013C4E
	.align 2, 0
_08013BF8: .4byte gMain
_08013BFC: .4byte gAnimation
_08013C00: .4byte gCourtScroll
_08013C04: .4byte gScriptContext
_08013C08: .4byte gIORegisters
_08013C0C:
	adds r0, r5, #0
	adds r0, #0xc0
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08013C74
	adds r0, r4, #0
	movs r1, #0
	bl ChangeAnimationActivity
	b _08013D4E
_08013C26:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	bne _08013C4E
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08013C4E
	ldrh r0, [r4, #0xc]
	bl PlayAnimation
	adds r0, r4, #0
	movs r1, #1
	bl ChangeAnimationActivity
_08013C4E:
	ldrh r7, [r5, #0x36]
	cmp r7, #0x80
	bne _08013C9A
	adds r0, r4, #0
	movs r1, #0
	bl ChangeAnimationActivity
	b _08013C9A
_08013C5E:
	adds r0, r1, #0
	subs r0, #0x8a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08013C7C
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp sb, r0
	beq _08013C9A
_08013C74:
	adds r0, r4, #0
	bl DestroyAnimation
	b _08013D4E
_08013C7C:
	adds r0, r1, #0
	subs r0, #0xa8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _08013C9A
	adds r0, r4, #0
	adds r0, #0x2c
	ldrh r1, [r5, #0x34]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08013C9A
	adds r0, r4, #0
	bl DestroyAnimation
_08013C9A:
	ldr r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013CD6
	ldr r3, [sp]
	adds r3, #0x48
	ldr r2, [sp]
	adds r2, #0x4c
	ldrh r7, [r4, #0xc]
	cmp r7, #0x70
	bne _08013CCA
	movs r0, #0x88
	lsls r0, r0, #0x16
	orrs r1, r0
	str r1, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r7, [r6]
	orrs r0, r7
	strh r0, [r6]
	ldr r0, _08013D9C @ =0x00000B08
	strh r0, [r2]
_08013CCA:
	ldr r1, _08013DA0 @ =0x04000050
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2]
	strh r0, [r1]
_08013CD6:
	ldr r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013CF4
	movs r0, #0x88
	lsls r0, r0, #0x16
	orrs r1, r0
	str r1, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r3, [r6]
	orrs r0, r3
	strh r0, [r6]
_08013CF4:
	ldr r0, [r4]
	ldr r1, _08013DA4 @ =gUnknown_02000080
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	bne _08013D12
	ldrh r0, [r4, #0xc]
	subs r0, #0x52
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x37
	bls _08013D12
	adds r0, r4, #0
	bl UpdateAnimationBlend
_08013D12:
	ldr r0, [r4]
	cmp r0, #0
	bge _08013D22
	adds r0, r4, #0
	bl AdvanceAnimationFrame
	cmp r0, #0
	beq _08013D4E
_08013D22:
	ldrh r7, [r4, #0xc]
	cmp r7, #8
	bhi _08013D3A
	ldr r0, _08013DA8 @ =gUnknown_0814DC70
	adds r1, r7, #0
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
_08013D3A:
	mov r1, r8
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _08013D4E
	ldrh r3, [r4, #0xc]
	cmp r3, #0xff
	bne _08013D4E
	adds r0, r4, #0
	bl sub_8014328
_08013D4E:
	ldr r4, [r4, #8]
	cmp r4, #0
	beq _08013D56
	b _08013BBE
_08013D56:
	ldr r4, _08013DAC @ =gAnimation+0x44
	mov r7, r8
	ldrh r0, [r7, #4]
	cmp r0, #0
	beq _08013D72
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08013D72
	adds r0, r4, #0
	bl sub_8014328
_08013D72:
	adds r2, r5, #0
	adds r2, #0x27
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08013D8A
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
	bl ClearAllAnimationSprites
_08013D8A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013D9C: .4byte 0x00000B08
_08013DA0: .4byte 0x04000050
_08013DA4: .4byte gUnknown_02000080
_08013DA8: .4byte gUnknown_0814DC70
_08013DAC: .4byte gAnimation+0x44

	thumb_func_start sub_8013DB0
sub_8013DB0: @ 0x08013DB0
	adds r2, r0, #0
	ldr r1, _08013DC4 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08013DC2
	movs r0, #3
	strb r0, [r2, #1]
_08013DC2:
	bx lr
	.align 2, 0
_08013DC4: .4byte gJoypad

	thumb_func_start sub_8013DC8
sub_8013DC8: @ 0x08013DC8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r5, _08013E5C @ =gScriptContext
	ldr r2, _08013E60 @ =gUnknown_0802817C
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrh r2, [r0, #0x10]
	adds r1, r2, r1
	strh r1, [r0, #0x10]
	ldrh r3, [r4, #0xc]
	cmp r3, #0xf
	bne _08013E1C
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #0x6e
	rsbs r2, r2, #0
	movs r3, #0
	str r3, [sp]
	movs r3, #0x50
	bl PlayPersonAnimationAtCustomOrigin
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SetCurrentPersonAnimationOffset
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r5, [r5, #0x1e]
	ands r0, r5
	cmp r0, #0
	beq _08013E1C
	ldr r0, _08013E64 @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
_08013E1C:
	movs r5, #0
	movs r1, #0
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	cmp r5, r2
	bge _08013E3A
	ldr r3, _08013E60 @ =gUnknown_0802817C
_08013E2A:
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r5, r0
	adds r1, #1
	cmp r1, r2
	blt _08013E2A
_08013E3A:
	ldrh r1, [r4, #0xc]
	cmp r1, #0xf
	bne _08013E44
	bl LoadCounselBenchGraphics
_08013E44:
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0xe
	ble _08013E6C
	ldr r3, _08013E68 @ =0xFFFFFE20
	adds r0, r5, r3
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesDefense
	b _08013E78
	.align 2, 0
_08013E5C: .4byte gScriptContext
_08013E60: .4byte gUnknown_0802817C
_08013E64: .4byte gAnimation
_08013E68: .4byte 0xFFFFFE20
_08013E6C:
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesProsecution
_08013E78:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8013E80
sub_8013E80: @ 0x08013E80
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r5, _08013F14 @ =gScriptContext
	ldr r3, _08013F18 @ =gUnknown_0802817C
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	movs r1, #0x1e
	subs r1, r1, r2
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrh r2, [r0, #0x10]
	subs r1, r2, r1
	strh r1, [r0, #0x10]
	ldrh r0, [r4, #0xc]
	cmp r0, #0xf
	bne _08013ED8
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #0xaf
	lsls r2, r2, #1
	movs r3, #0
	str r3, [sp]
	movs r3, #0x50
	bl PlayPersonAnimationAtCustomOrigin
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SetCurrentPersonAnimationOffset
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r5, [r5, #0x1e]
	ands r0, r5
	cmp r0, #0
	beq _08013ED8
	ldr r0, _08013F1C @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
_08013ED8:
	movs r5, #0
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	cmp r5, r1
	bge _08013EF6
	ldr r0, _08013F18 @ =gUnknown_0802817C
	adds r2, r0, #0
	adds r2, #0x1e
_08013EE8:
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r5, r5, r0
	subs r2, #1
	subs r1, #1
	cmp r1, #0
	bne _08013EE8
_08013EF6:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xf
	bne _08013F00
	bl LoadCounselBenchGraphics
_08013F00:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xe
	ble _08013F20
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesDefense
	b _08013F2E
	.align 2, 0
_08013F14: .4byte gScriptContext
_08013F18: .4byte gUnknown_0802817C
_08013F1C: .4byte gAnimation
_08013F20:
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r5, r2
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesProsecution
_08013F2E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013F38
sub_8013F38: @ 0x08013F38
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _08013FE8 @ =gScriptContext
	ldr r0, _08013FEC @ =gUnknown_0802819B
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, #0x10]
	adds r0, r1, r0
	strh r0, [r5, #0x10]
	ldrh r2, [r4, #0xc]
	cmp r2, #0xe
	bne _08013F8C
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #0x54
	rsbs r2, r2, #0
	movs r3, #0
	str r3, [sp]
	movs r3, #0x50
	bl PlayPersonAnimationAtCustomOrigin
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SetCurrentPersonAnimationOffset
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r6, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _08013F8C
	ldr r0, _08013FF0 @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
_08013F8C:
	ldrb r0, [r5, #0xe]
	cmp r0, #0xb
	beq _08013F96
	cmp r0, #0x21
	bne _08013FAC
_08013F96:
	bl sub_8016FB4
	ldrh r1, [r5, #0x10]
	strh r1, [r0, #0x10]
	adds r1, r6, #0
	adds r1, #0x4e
	ldrh r2, [r1]
	cmp r2, #6
	bne _08013FAC
	movs r0, #9
	strh r0, [r1]
_08013FAC:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xe
	bne _08013FB6
	bl LoadWitnessBenchGraphics
_08013FB6:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	ble _08013FF4
	movs r3, #0
	movs r2, #0xf
	adds r1, r0, #0
	cmp r2, r1
	bge _08013FDA
	ldr r4, _08013FEC @ =gUnknown_0802819B
_08013FCA:
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r2, #1
	cmp r2, r1
	blt _08013FCA
_08013FDA:
	adds r0, r3, #0
	subs r0, #0xb4
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesWitness
	b _0801401E
	.align 2, 0
_08013FE8: .4byte gScriptContext
_08013FEC: .4byte gUnknown_0802819B
_08013FF0: .4byte gAnimation
_08013FF4:
	movs r3, #0
	movs r2, #0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	cmp r3, r1
	bge _08014012
	ldr r4, _08014028 @ =gUnknown_0802819B
_08014002:
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r2, #1
	cmp r2, r1
	blt _08014002
_08014012:
	adds r0, r3, #0
	adds r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesProsecution
_0801401E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014028: .4byte gUnknown_0802819B

	thumb_func_start sub_801402C
sub_801402C: @ 0x0801402C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _080140E4 @ =gScriptContext
	ldr r0, _080140E8 @ =gUnknown_080281BA
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, #0x10]
	subs r0, r1, r0
	strh r0, [r5, #0x10]
	ldrh r2, [r4, #0xc]
	cmp r2, #0xd
	bne _08014094
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #0
	str r2, [sp]
	movs r2, #0xdc
	movs r3, #0x50
	bl PlayPersonAnimationAtCustomOrigin
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SetCurrentPersonAnimationOffset
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r6, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _0801407E
	ldr r0, _080140EC @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
_0801407E:
	adds r2, r6, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	adds r0, r1, #0
	cmp r0, #0
	beq _08014094
	cmp r0, #6
	beq _08014094
	strh r1, [r6, #0x20]
	movs r0, #5
	strh r0, [r2]
_08014094:
	ldrb r0, [r5, #0xe]
	cmp r0, #0xb
	beq _0801409E
	cmp r0, #0x21
	bne _080140A6
_0801409E:
	bl sub_8016FB4
	ldrh r1, [r5, #0x10]
	strh r1, [r0, #0x10]
_080140A6:
	ldrh r2, [r4, #0xc]
	cmp r2, #0xd
	bne _080140B0
	bl LoadCounselBenchGraphics
_080140B0:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	ble _080140F4
	movs r3, #0
	movs r1, #0xf
	adds r2, r0, #0
	cmp r1, r2
	bge _080140D4
	ldr r4, _080140F0 @ =gUnknown_0802819B
_080140C4:
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r1, #1
	cmp r1, r2
	blt _080140C4
_080140D4:
	adds r0, r3, #0
	subs r0, #0xb4
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesWitness
	b _08014124
	.align 2, 0
_080140E4: .4byte gScriptContext
_080140E8: .4byte gUnknown_080281BA
_080140EC: .4byte gAnimation
_080140F0: .4byte gUnknown_0802819B
_080140F4:
	movs r3, #0
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r0, #0x20
	subs r1, r0, r1
	cmp r3, r1
	bge _08014116
	ldr r0, _0801412C @ =gUnknown_0802819B
	adds r2, r0, #0
	adds r2, #0x20
_08014108:
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r3, r3, r0
	subs r2, #1
	subs r1, #1
	cmp r1, #0
	bne _08014108
_08014116:
	movs r0, #0xb5
	lsls r0, r0, #1
	subs r0, r0, r3
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesProsecution
_08014124:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801412C: .4byte gUnknown_0802819B

	thumb_func_start sub_8014130
sub_8014130: @ 0x08014130
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _080141E0 @ =gScriptContext
	ldr r0, _080141E4 @ =gUnknown_0802819B
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, #0x10]
	subs r0, r1, r0
	strh r0, [r5, #0x10]
	ldrh r2, [r4, #0xc]
	cmp r2, #0xe
	bne _08014184
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #0xa2
	lsls r2, r2, #1
	movs r3, #0
	str r3, [sp]
	movs r3, #0x50
	bl PlayPersonAnimationAtCustomOrigin
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SetCurrentPersonAnimationOffset
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r6, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _08014184
	ldr r0, _080141E8 @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
_08014184:
	ldrb r0, [r5, #0xe]
	cmp r0, #0xb
	beq _0801418E
	cmp r0, #0x21
	bne _080141A4
_0801418E:
	bl sub_8016FB4
	ldrh r1, [r5, #0x10]
	strh r1, [r0, #0x10]
	adds r1, r6, #0
	adds r1, #0x4e
	ldrh r2, [r1]
	cmp r2, #6
	bne _080141A4
	movs r0, #9
	strh r0, [r1]
_080141A4:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xe
	bne _080141AE
	bl LoadWitnessBenchGraphics
_080141AE:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	ble _080141EC
	movs r3, #0
	movs r2, #0xf
	adds r1, r0, #0
	cmp r2, r1
	bge _080141D2
	ldr r4, _080141E4 @ =gUnknown_0802819B
_080141C2:
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r2, #1
	cmp r2, r1
	blt _080141C2
_080141D2:
	movs r0, #0xe4
	subs r0, r0, r3
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesWitness
	b _08014214
	.align 2, 0
_080141E0: .4byte gScriptContext
_080141E4: .4byte gUnknown_0802819B
_080141E8: .4byte gAnimation
_080141EC:
	movs r2, #0
	movs r3, #0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	cmp r3, r1
	bge _0801420A
	ldr r4, _0801421C @ =gUnknown_0802819B
_080141FA:
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r2, #1
	cmp r2, r1
	blt _080141FA
_0801420A:
	rsbs r0, r3, #0
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesDefense
_08014214:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801421C: .4byte gUnknown_0802819B

	thumb_func_start sub_8014220
sub_8014220: @ 0x08014220
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _080142D8 @ =gScriptContext
	ldr r0, _080142DC @ =gUnknown_080281BA
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, #0x10]
	adds r0, r1, r0
	strh r0, [r5, #0x10]
	ldrh r2, [r4, #0xc]
	cmp r2, #0xd
	bne _08014288
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #0
	str r2, [sp]
	movs r2, #0x14
	movs r3, #0x50
	bl PlayPersonAnimationAtCustomOrigin
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SetCurrentPersonAnimationOffset
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r6, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _08014272
	ldr r0, _080142E0 @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
_08014272:
	adds r2, r6, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	adds r0, r1, #0
	cmp r0, #0
	beq _08014288
	cmp r0, #6
	beq _08014288
	strh r1, [r6, #0x20]
	movs r0, #5
	strh r0, [r2]
_08014288:
	ldrb r0, [r5, #0xe]
	cmp r0, #0xb
	beq _08014292
	cmp r0, #0x21
	bne _0801429A
_08014292:
	bl sub_8016FB4
	ldrh r1, [r5, #0x10]
	strh r1, [r0, #0x10]
_0801429A:
	ldrh r2, [r4, #0xc]
	cmp r2, #0xd
	bne _080142A4
	bl LoadCounselBenchGraphics
_080142A4:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	ble _080142E8
	movs r3, #0
	movs r1, #0xf
	adds r2, r0, #0
	cmp r1, r2
	bge _080142C8
	ldr r4, _080142E4 @ =gUnknown_0802819B
_080142B8:
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	adds r1, #1
	cmp r1, r2
	blt _080142B8
_080142C8:
	movs r0, #0xe4
	subs r0, r0, r3
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesWitness
	b _08014316
	.align 2, 0
_080142D8: .4byte gScriptContext
_080142DC: .4byte gUnknown_080281BA
_080142E0: .4byte gAnimation
_080142E4: .4byte gUnknown_0802819B
_080142E8:
	movs r3, #0
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r0, #0x20
	subs r1, r0, r1
	cmp r3, r1
	bge _0801430A
	ldr r0, _08014320 @ =gUnknown_0802819B
	adds r2, r0, #0
	adds r2, #0x20
_080142FC:
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r3, r3, r0
	subs r2, #1
	subs r1, #1
	cmp r1, #0
	bne _080142FC
_0801430A:
	ldr r1, _08014324 @ =0xFFFFFEB6
	adds r0, r3, r1
	movs r1, #0x80
	movs r2, #1
	bl SetOAMForCourtBenchSpritesDefense
_08014316:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014320: .4byte gUnknown_0802819B
_08014324: .4byte 0xFFFFFEB6

	thumb_func_start sub_8014328
sub_8014328: @ 0x08014328
	push {lr}
	ldr r3, _0801433C @ =gCourtScroll
	cmp r0, #0
	bne _08014344
	ldr r0, _08014340 @ =gUnknown_080281DC
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08014356
	.align 2, 0
_0801433C: .4byte gCourtScroll
_08014340: .4byte gUnknown_080281DC
_08014344:
	ldr r0, _0801435C @ =gUnknown_0814DC90
	ldrb r2, [r3, #6]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, _08014360 @ =gAnimation+0x44
	ldr r2, [r1]
	adds r1, r3, #0
	bl _call_via_r2
_08014356:
	pop {r0}
	bx r0
	.align 2, 0
_0801435C: .4byte gUnknown_0814DC90
_08014360: .4byte gAnimation+0x44

	thumb_func_start SetCourtScrollPersonAnim
SetCourtScrollPersonAnim: @ 0x08014364
	push {r4, r5, lr}
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r2, _08014388 @ =gCourtScroll
	lsls r3, r0, #1
	strb r3, [r2, #6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801437C
	adds r0, r3, #1
	strb r0, [r2, #6]
_0801437C:
	strh r4, [r2, #8]
	strh r5, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014388: .4byte gCourtScroll

	thumb_func_start sub_801438C
sub_801438C: @ 0x0801438C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl Random
	movs r1, #3
	ands r1, r0
	adds r5, r1, #1
	bl Random
	movs r1, #7
	ands r1, r0
	subs r1, #4
	adds r3, r4, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0
	bne _080143B2
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0x2e]
_080143B2:
	ldrb r2, [r3]
	adds r2, #1
	strb r2, [r3]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bhi _080143F2
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _080143CE
	ldrh r2, [r4, #0x2e]
	adds r0, r2, r5
	b _080143D2
_080143CE:
	ldrh r2, [r4, #0x2e]
	subs r0, r2, r5
_080143D2:
	strh r0, [r4, #0x10]
	ldrh r2, [r4, #0x12]
	adds r0, r2, r1
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	ble _080143E8
	movs r0, #0x5a
	strh r0, [r4, #0x12]
	b _080143F6
_080143E8:
	cmp r0, #0x45
	bgt _080143F6
	movs r0, #0x46
	strh r0, [r4, #0x12]
	b _080143F6
_080143F2:
	movs r0, #0x28
	strb r0, [r3]
_080143F6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start Case3OpeningAnimationEffect
Case3OpeningAnimationEffect: @ 0x080143FC
	bx lr
	.align 2, 0
