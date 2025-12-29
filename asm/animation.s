	.include "asm/macros.inc"
	.syntax unified

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
	ldr r3, _08013588 @ =eGeneralScratchpadBuffer
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
_08013588: .4byte eGeneralScratchpadBuffer
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
	bl AdjustColorByMode
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
