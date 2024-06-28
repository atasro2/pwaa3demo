	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_80066B0
sub_80066B0: @ 0x080066B0
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _080066DC @ =gMain
	adds r3, r1, #0
	adds r3, #0xc4
	strh r4, [r3]
	adds r1, #0xc6
	strh r2, [r1]
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8012684
	ldr r0, _080066E0 @ =gInvestigation
	movs r1, #1
	strb r1, [r0, #6]
	movs r1, #0xf
	bl sub_800BF90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080066DC: .4byte gMain
_080066E0: .4byte gInvestigation

	thumb_func_start sub_80066E4
sub_80066E4: @ 0x080066E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r2, #1
	bl ChangeFlag
	adds r0, r4, #0
	bl sub_8018778
	movs r0, #1
	bl sub_80053FC
	bl sub_80112C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8006708
sub_8006708: @ 0x08006708
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r2, #1
	bl ChangeFlag
	adds r0, r4, #0
	bl sub_8018778
	movs r0, #2
	bl sub_80053FC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8006728
sub_8006728: @ 0x08006728
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	ldr r2, _08006794 @ =gUnknown_03002D40
	movs r1, #0
	ldr r0, _08006798 @ =gUnknown_030037B8
	mov ip, r0
	ldr r6, _0800679C @ =0x000040C0
	movs r4, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r5, r0, #0
	movs r3, #0xa2
	lsls r3, r3, #7
_08006748:
	strh r6, [r2]
	adds r0, r4, r5
	strh r0, [r2, #2]
	strh r3, [r2, #4]
	adds r2, #8
	adds r4, #0x3c
	adds r3, #0x20
	adds r1, #1
	cmp r1, #3
	bls _08006748
	movs r0, #0x82
	lsls r0, r0, #1
	mov r1, ip
	str r0, [r1]
	movs r0, #0
	adds r1, r7, #0
	movs r2, #1
	bl ChangeFlag
	mov r0, r8
	bl sub_8018778
	movs r0, #1
	bl sub_80053FC
	ldr r4, _080067A0 @ =gInvestigation
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_800BF90
	movs r0, #0x40
	strb r0, [r4, #0x12]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006794: .4byte gUnknown_03002D40
_08006798: .4byte gUnknown_030037B8
_0800679C: .4byte 0x000040C0
_080067A0: .4byte gInvestigation

	thumb_func_start nullsub_15
nullsub_15: @ 0x080067A4
	bx lr
	.align 2, 0
