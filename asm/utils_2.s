	.include "asm/macros.inc"
	.syntax unified

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

	thumb_func_start ChangeFlag
ChangeFlag: @ 0x080065AC
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _080065D0 @ =gFlagPtrs
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
_080065D0: .4byte gFlagPtrs
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

	thumb_func_start GetFlag
GetFlag: @ 0x080065E8
	ldr r2, _0800660C @ =gFlagPtrs
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
_0800660C: .4byte gFlagPtrs

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
	bl fix_mul
	strh r0, [r5, #0x18]
	movs r3, #0
	ldrsh r0, [r6, r3]
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x1a]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	strh r0, [r5, #0x1c]
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
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
