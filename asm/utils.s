	.include "asm/macros.inc"
	.syntax unified

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
