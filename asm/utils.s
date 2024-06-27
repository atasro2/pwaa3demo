	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start MoveSpritesToOAM
MoveSpritesToOAM: @ 0x08006344
	ldr r1, _08006358 @ =0x040000D4
	ldr r0, _0800635C @ =gOamObjects
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08006360 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08006358: .4byte 0x040000D4
_0800635C: .4byte gOamObjects
_08006360: .4byte 0x80000200

	thumb_func_start sub_8006364
sub_8006364: @ 0x08006364
	lsls r0, r0, #0x14
	lsrs r2, r0, #0x14
	adds r3, r2, #0
	ldr r1, _08006378 @ =0x000003FF
	cmp r2, r1
	bhi _08006380
	ldr r0, _0800637C @ =gUnknown_08025C30
	ands r2, r1
	lsls r1, r2, #1
	b _08006398
	.align 2, 0
_08006378: .4byte 0x000003FF
_0800637C: .4byte gUnknown_08025C30
_08006380:
	ldr r0, _080063A0 @ =0x00000BFF
	cmp r2, r0
	bls _080063A8
	adds r0, #1
	cmp r2, r0
	beq _080063E0
	ldr r0, _080063A4 @ =gUnknown_08025C30
	ands r2, r1
	movs r1, #0x80
	lsls r1, r1, #3
	subs r1, r1, r2
	lsls r1, r1, #1
_08006398:
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	b _080063E2
	.align 2, 0
_080063A0: .4byte 0x00000BFF
_080063A4: .4byte gUnknown_08025C30
_080063A8:
	ldr r0, _080063B8 @ =0x000007FF
	cmp r2, r0
	bls _080063C0
	ldr r0, _080063BC @ =gUnknown_08025C30
	ands r2, r1
	lsls r1, r2, #1
	b _080063D0
	.align 2, 0
_080063B8: .4byte 0x000007FF
_080063BC: .4byte gUnknown_08025C30
_080063C0:
	movs r2, #0x80
	lsls r2, r2, #3
	cmp r3, r2
	beq _080063E0
	ldr r0, _080063DC @ =gUnknown_08025C30
	ands r3, r1
	subs r1, r2, r3
	lsls r1, r1, #1
_080063D0:
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	b _080063E2
	.align 2, 0
_080063DC: .4byte gUnknown_08025C30
_080063E0:
	movs r0, #0
_080063E2:
	bx lr

	thumb_func_start sub_80063E4
sub_80063E4: @ 0x080063E4
	lsls r0, r0, #0x14
	lsrs r2, r0, #0x14
	adds r3, r2, #0
	ldr r1, _080063F8 @ =0x000003FF
	cmp r2, r1
	bhi _08006400
	ldr r0, _080063FC @ =gUnknown_08025430
	ands r2, r1
	lsls r1, r2, #1
	b _0800645C
	.align 2, 0
_080063F8: .4byte 0x000003FF
_080063FC: .4byte gUnknown_08025430
_08006400:
	ldr r0, _08006410 @ =0x00000BFF
	cmp r2, r0
	bls _0800642C
	adds r0, #1
	cmp r2, r0
	bne _08006418
	ldr r0, _08006414 @ =0xFFFFFF00
	b _0800646C
	.align 2, 0
_08006410: .4byte 0x00000BFF
_08006414: .4byte 0xFFFFFF00
_08006418:
	ldr r0, _08006428 @ =gUnknown_08025430
	ands r2, r1
	movs r1, #0x80
	lsls r1, r1, #3
	subs r1, r1, r2
	lsls r1, r1, #1
	b _08006438
	.align 2, 0
_08006428: .4byte gUnknown_08025430
_0800642C:
	ldr r0, _08006444 @ =0x000007FF
	cmp r2, r0
	bls _0800644C
	ldr r0, _08006448 @ =gUnknown_08025430
	ands r2, r1
	lsls r1, r2, #1
_08006438:
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	b _0800646C
	.align 2, 0
_08006444: .4byte 0x000007FF
_08006448: .4byte gUnknown_08025430
_0800644C:
	movs r2, #0x80
	lsls r2, r2, #3
	cmp r3, r2
	beq _08006468
	ldr r0, _08006464 @ =gUnknown_08025430
	ands r3, r1
	subs r1, r2, r3
	lsls r1, r1, #1
_0800645C:
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	b _0800646C
	.align 2, 0
_08006464: .4byte gUnknown_08025430
_08006468:
	movs r0, #0x80
	lsls r0, r0, #1
_0800646C:
	bx lr
	.align 2, 0

	thumb_func_start sub_8006470
sub_8006470: @ 0x08006470
	bx lr
	.align 2, 0

	thumb_func_start nullsub_20
nullsub_20: @ 0x08006474
	bx lr
	.align 2, 0

	thumb_func_start nullsub_6
nullsub_6: @ 0x08006478
	bx lr
	.align 2, 0

	thumb_func_start sub_800647C
sub_800647C: @ 0x0800647C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r2, r1, #0
	ldrh r4, [r2]
	ldrh r1, [r2, #2]
	mov ip, r1
	ldrh r1, [r0]
	subs r5, r1, r4
	ldrh r0, [r0, #2]
	mov r1, ip
	subs r3, r0, r1
	ldrh r0, [r2, #4]
	subs r0, r0, r4
	mov r8, r0
	ldrh r0, [r2, #6]
	subs r6, r0, r1
	ldrh r1, [r2, #0xc]
	subs r1, r1, r4
	mov sb, r1
	ldrh r0, [r2, #0xe]
	mov r1, ip
	subs r7, r0, r1
	mov r1, r8
	muls r1, r3, r1
	adds r0, r6, #0
	muls r0, r5, r0
	cmp r1, r0
	blt _080064FA
	mov r1, sb
	muls r1, r3, r1
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r1, r0
	bgt _080064FA
	ldrh r0, [r2, #8]
	subs r1, r0, r4
	subs r5, r5, r1
	ldrh r2, [r2, #0xa]
	mov r4, ip
	subs r0, r2, r4
	subs r3, r3, r0
	mov r2, r8
	subs r2, r2, r1
	mov r8, r2
	subs r6, r6, r0
	mov r4, sb
	subs r4, r4, r1
	mov sb, r4
	subs r7, r7, r0
	mov r1, r8
	muls r1, r3, r1
	adds r0, r6, #0
	muls r0, r5, r0
	cmp r1, r0
	bgt _080064FA
	mov r1, sb
	muls r1, r3, r1
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r1, r0
	bge _080064FE
_080064FA:
	movs r0, #0
	b _08006500
_080064FE:
	movs r0, #1
_08006500:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800650C
sub_800650C: @ 0x0800650C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	adds r1, r0, #0
	cmp r0, #0
	bge _0800651E
	adds r1, #0xff
_0800651E:
	lsls r0, r1, #8
	asrs r0, r0, #0x10
	bx lr

	thumb_func_start sub_8006524
sub_8006524: @ 0x08006524
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800653C
sub_800653C: @ 0x0800653C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1

	thumb_func_start Random
Random: @ 0x08006554
	push {r4, r5, lr}
	ldr r3, _0800659C @ =gMain
	ldr r2, _080065A0 @ =0xFFFF0000
	ands r4, r2
	ldrh r0, [r3, #0x30]
	orrs r4, r0
	movs r0, #0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ands r5, r2
	orrs r5, r0
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	adds r0, r1, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080065A4 @ =0xFFFFFF00
	ands r4, r2
	orrs r4, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	ldr r0, _080065A8 @ =0xFFFF00FF
	ands r4, r0
	orrs r4, r1
	ldrh r1, [r3]
	adds r0, r1, r4
	strh r0, [r3, #0x30]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800659C: .4byte gMain
_080065A0: .4byte 0xFFFF0000
_080065A4: .4byte 0xFFFFFF00
_080065A8: .4byte 0xFFFF00FF

	thumb_func_start sub_80065AC
sub_80065AC: @ 0x080065AC
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _080065D0 @ =gUnknown_0814D930
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	lsrs r0, r4, #5
	lsls r0, r0, #2
	adds r3, r3, r0
	cmp r2, #0
	beq _080065D4
	movs r0, #0x1f
	ands r0, r4
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3]
	orrs r0, r1
	b _080065E0
	.align 2, 0
_080065D0: .4byte gUnknown_0814D930
_080065D4:
	movs r0, #0x1f
	ands r0, r4
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3]
	bics r0, r1
_080065E0:
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80065E8
sub_80065E8: @ 0x080065E8
	ldr r2, _0800660C @ =gUnknown_0814D930
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	lsrs r0, r1, #5
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08006608
	movs r0, #1
_08006608:
	bx lr
	.align 2, 0
_0800660C: .4byte gUnknown_0814D930

	thumb_func_start sub_8006610
sub_8006610: @ 0x08006610
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldr r5, _0800669C @ =gIORegisters
	ldr r6, _080066A0 @ =gUnknown_08026430
	adds r0, r6, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x18]
	movs r3, #0
	ldrsh r0, [r6, r3]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1a]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1c]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1e]
	ldrh r1, [r5, #0x1a]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, _080066A4 @ =0x00007788
	subs r1, r1, r0
	ldrh r2, [r5, #0x18]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #3
	subs r1, r1, r0
	ldr r2, _080066A8 @ =0x0FFFFFFF
	ands r1, r2
	str r1, [r5, #0x20]
	ldrh r3, [r5, #0x1e]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #4
	ldr r1, _080066AC @ =0x00004FB0
	subs r1, r1, r0
	ldrh r3, [r5, #0x1c]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #3
	subs r1, r1, r0
	ands r1, r2
	str r1, [r5, #0x24]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800669C: .4byte gIORegisters
_080066A0: .4byte gUnknown_08026430
_080066A4: .4byte 0x00007788
_080066A8: .4byte 0x0FFFFFFF
_080066AC: .4byte 0x00004FB0
