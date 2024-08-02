	.include "asm/macros.inc"
	.syntax unified

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
	bl PutCharInTextbox
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
	ldr r1, _080185FC @ =gTextBoxCharacters
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
	ldr r1, _08018604 @ =gMapMarker
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
_080185FC: .4byte gTextBoxCharacters
_08018600: .4byte gUnknown_02011FC0
_08018604: .4byte gMapMarker

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
	ldr r1, _080186EC @ =gMapMarker
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
	ldr r1, _080186F4 @ =gTextBoxCharacters
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
_080186EC: .4byte gMapMarker
_080186F0: .4byte 0x00003FFF
_080186F4: .4byte gTextBoxCharacters
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
	ldr r6, _0801885C @ =gTextBoxCharacters
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
_0801885C: .4byte gTextBoxCharacters
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
	ldr r0, _08018A2C @ =gTextBoxCharacters
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
_08018A2C: .4byte gTextBoxCharacters
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
	bl DrawTextAndMapMarkers
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
	ldr r4, _08018B54 @ =gTextBoxCharacters
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
_08018B54: .4byte gTextBoxCharacters
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
