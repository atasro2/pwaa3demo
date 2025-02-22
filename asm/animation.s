	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start InitCurrentAnimationToNull
InitCurrentAnimationToNull: @ 0x08011C98
	ldr r0, _08011CA8 @ =gAnimation
	movs r1, #1
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_08011CA8: .4byte gAnimation

	thumb_func_start ResetAnimationSystem
ResetAnimationSystem: @ 0x08011CAC
	push {r4, lr}
	sub sp, #4
	ldr r2, _08011CE8 @ =gAnimation
	mov r0, sp
	movs r3, #0
	strh r3, [r0]
	ldr r0, _08011CEC @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _08011CF0 @ =0x81000440
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _08011CF4 @ =gMain
	adds r0, #0x27
	movs r1, #3
	ldrb r4, [r0]
	orrs r1, r4
	strb r1, [r0]
	adds r2, #0x44
	movs r0, #0xff
	strh r0, [r2, #0xc]
	strb r3, [r2, #0xe]
	bl InitCurrentAnimationToNull
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011CE8: .4byte gAnimation
_08011CEC: .4byte 0x040000D4
_08011CF0: .4byte 0x81000440
_08011CF4: .4byte gMain

	thumb_func_start ClearAllAnimationSprites
ClearAllAnimationSprites: @ 0x08011CF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08011D5C @ =gAnimation+0x44
	ldr r1, _08011D60 @ =0x0000083C
	adds r0, r4, r1
	cmp r4, r0
	bhs _08011D52
	ldr r7, _08011D64 @ =gOamObjects
	mov ip, r7
	mov r8, r0
_08011D0E:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r1, r0
	adds r6, r4, #0
	adds r6, #0x44
	mov r5, r8
	cmp r1, #0
	beq _08011D4C
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #3
	mov r3, ip
	adds r2, r0, r3
	adds r1, r4, #0
	adds r1, #0x3f
	ldrb r4, [r1]
	lsls r0, r4, #3
	adds r0, r0, r3
	cmp r2, r0
	bhs _08011D4C
	movs r4, #0x80
	lsls r4, r4, #2
_08011D3E:
	strh r4, [r2]
	adds r2, #8
	ldrb r7, [r1]
	lsls r0, r7, #3
	adds r0, r0, r3
	cmp r2, r0
	blo _08011D3E
_08011D4C:
	adds r4, r6, #0
	cmp r4, r5
	blo _08011D0E
_08011D52:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011D5C: .4byte gAnimation+0x44
_08011D60: .4byte 0x0000083C
_08011D64: .4byte gOamObjects

	thumb_func_start FindAnimationFromAnimId
FindAnimationFromAnimId: @ 0x08011D68
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r1, _08011D8C @ =gAnimation+0x83C
	movs r2, #0x1f
	movs r5, #0x80
	lsls r5, r5, #0x15
	movs r4, #1
	rsbs r4, r4, #0
_08011D78:
	ldrh r0, [r1, #0xc]
	cmp r0, r3
	bne _08011D90
	ldr r0, [r1]
	ands r0, r5
	cmp r0, #0
	beq _08011D90
	adds r0, r1, #0
	b _08011D9A
	.align 2, 0
_08011D8C: .4byte gAnimation+0x83C
_08011D90:
	subs r1, #0x44
	subs r2, #1
	cmp r2, r4
	bne _08011D78
	movs r0, #0
_08011D9A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8011DA0
sub_8011DA0: @ 0x08011DA0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	bl FindAnimationFromAnimId
	adds r4, r0, #0
	cmp r4, #0
	beq _08011E38
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r0, #0
	ands r1, r2
	rsbs r1, r1, #0
	asrs r5, r1, #0x1f
	ands r5, r2
	movs r6, #0x80
	lsls r6, r6, #0x14
	ands r0, r6
	cmp r0, #0
	beq _08011DCC
	adds r5, r6, #0
_08011DCC:
	adds r0, r4, #0
	bl DestroyAnimation
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08011E00 @ =0x040000D4
	str r1, [r0]
	str r4, [r0, #4]
	ldr r1, _08011E04 @ =0x81000022
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r1, #0xf1
	lsls r1, r1, #0x18
	orrs r1, r5
	str r1, [r4]
	ldr r0, _08011E08 @ =0x0000FFFF
	strh r0, [r4, #0x28]
	ands r5, r6
	cmp r5, #0
	beq _08011E28
	ldr r0, _08011E0C @ =0xDFFFFFFF
	ands r1, r0
	str r1, [r4]
	b _08011E28
	.align 2, 0
_08011E00: .4byte 0x040000D4
_08011E04: .4byte 0x81000022
_08011E08: .4byte 0x0000FFFF
_08011E0C: .4byte 0xDFFFFFFF
_08011E10:
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08011E30 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r4, [r0, #4]
	ldr r1, _08011E34 @ =0x81000022
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r0, #0xf1
	lsls r0, r0, #0x18
	str r0, [r4]
_08011E28:
	strh r7, [r4, #0xc]
	adds r0, r4, #0
	b _08011E68
	.align 2, 0
_08011E30: .4byte 0x040000D4
_08011E34: .4byte 0x81000022
_08011E38:
	ldr r4, _08011E70 @ =gAnimation+0x83C
	movs r0, #0x1f
	movs r5, #0x80
	lsls r5, r5, #0x15
	ldr r1, _08011E74 @ =0xFFFFF808
	adds r3, r4, r1
	movs r2, #1
	rsbs r2, r2, #0
_08011E48:
	ldr r1, [r4]
	ands r1, r5
	cmp r1, #0
	bne _08011E54
	cmp r4, r3
	bne _08011E10
_08011E54:
	subs r4, #0x44
	subs r0, #1
	cmp r0, r2
	bne _08011E48
	ldr r0, _08011E78 @ =gUnknown_080280F0
	movs r1, #0
	movs r2, #3
	bl nullsub_20
	movs r0, #0
_08011E68:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08011E70: .4byte gAnimation+0x83C
_08011E74: .4byte 0xFFFFF808
_08011E78: .4byte gUnknown_080280F0

	thumb_func_start SetAnimationOriginCoords
SetAnimationOriginCoords: @ 0x08011E7C
	push {lr}
	cmp r0, #0
	bne _08011E94
	ldr r0, _08011E90 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08011E98
	.align 2, 0
_08011E90: .4byte gUnknown_08028100
_08011E94:
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
_08011E98:
	pop {r0}
	bx r0

	thumb_func_start sub_8011E9C
sub_8011E9C: @ 0x08011E9C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	lsls r5, r3, #2
	cmp r4, #0
	bne _08011EB8
	ldr r0, _08011EB4 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08011F2C
	.align 2, 0
_08011EB4: .4byte gUnknown_08028100
_08011EB8:
	cmp r3, #0x1f
	bls _08011EC8
	ldr r0, _08011F34 @ =gUnknown_08028114
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	movs r3, #0x1f
_08011EC8:
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	strh r0, [r1]
	adds r2, r4, #0
	adds r2, #0x42
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r3
	strh r0, [r2]
	ldr r2, _08011F38 @ =gSineTable
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r4, [r0, r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r2, [r1, r0]
	rsbs r3, r2, #0
	ldr r1, _08011F3C @ =gOamObjects
	lsls r0, r5, #3
	adds r0, r0, r1
	strh r4, [r0, #6]
	adds r5, #1
	lsls r0, r5, #3
	adds r0, r0, r1
	strh r2, [r0, #6]
	adds r5, #1
	lsls r0, r5, #3
	adds r0, r0, r1
	strh r3, [r0, #6]
	adds r5, #1
	lsls r0, r5, #3
	adds r0, r0, r1
	strh r4, [r0, #6]
_08011F2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011F34: .4byte gUnknown_08028114
_08011F38: .4byte gSineTable
_08011F3C: .4byte gOamObjects

	thumb_func_start sub_8011F40
sub_8011F40: @ 0x08011F40
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _08011F58
	ldr r0, _08011F54 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08011F64
	.align 2, 0
_08011F54: .4byte gUnknown_08028100
_08011F58:
	adds r0, r3, #0
	adds r0, #0x40
	strh r2, [r0]
	adds r0, r3, #0
	bl sub_8011E9C
_08011F64:
	pop {r0}
	bx r0

	thumb_func_start sub_8011F68
sub_8011F68: @ 0x08011F68
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	bne _08011F80
	ldr r0, _08011F7C @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08011F88
	.align 2, 0
_08011F7C: .4byte gUnknown_08028100
_08011F80:
	ldr r0, [r2]
	ldr r1, _08011F8C @ =0xFFEFFFFF
	ands r0, r1
	str r0, [r2]
_08011F88:
	pop {r0}
	bx r0
	.align 2, 0
_08011F8C: .4byte 0xFFEFFFFF

	thumb_func_start SetAnimationScale
SetAnimationScale: @ 0x08011F90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	lsls r7, r3, #2
	cmp r4, #0
	bne _08011FB4
	ldr r0, _08011FB0 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _0801204C
	.align 2, 0
_08011FB0: .4byte gUnknown_08028100
_08011FB4:
	cmp r3, #0x1f
	bls _08011FC4
	ldr r0, _08012058 @ =gUnknown_08028114
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	movs r3, #0x1f
_08011FC4:
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r2, [r1]
	ands r0, r2
	orrs r0, r3
	strh r0, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl fix_inverse
	adds r4, r0, #0
	ldr r5, _0801205C @ =gSineTable
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	ldr r6, _08012060 @ =gOamObjects
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r7, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r4, #0
	bl fix_mul
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r7, #1
	ldrh r5, [r5]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl fix_mul
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r7, #1
	mov r0, r8
	adds r1, r4, #0
	bl fix_mul
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
_0801204C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012058: .4byte gUnknown_08028114
_0801205C: .4byte gSineTable
_08012060: .4byte gOamObjects

	thumb_func_start DisableAnimationScale
DisableAnimationScale: @ 0x08012064
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	bne _0801207C
	ldr r0, _08012078 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08012084
	.align 2, 0
_08012078: .4byte gUnknown_08028100
_0801207C:
	ldr r0, [r2]
	ldr r1, _08012088 @ =0xFFEFFFFF
	ands r0, r1
	str r0, [r2]
_08012084:
	pop {r0}
	bx r0
	.align 2, 0
_08012088: .4byte 0xFFEFFFFF

	thumb_func_start ChangeAnimationActivity
ChangeAnimationActivity: @ 0x0801208C
	push {r4, lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _080120A4
	ldr r0, _080120A0 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _080120F8
	.align 2, 0
_080120A0: .4byte gUnknown_08028100
_080120A4:
	ldr r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	cmp r0, #0
	beq _080120F8
	cmp r1, #0
	beq _080120C8
	ldr r0, _080120C4 @ =0xF7FFFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x16
	orrs r2, r0
	str r2, [r3]
	b _080120F8
	.align 2, 0
_080120C4: .4byte 0xF7FFFFFF
_080120C8:
	ldr r0, _08012100 @ =0xDFFFFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x14
	orrs r2, r0
	str r2, [r3]
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r2, [r0]
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r2, r0
	bhs _080120F8
	ldr r1, _08012104 @ =gOamObjects
	movs r4, #0x80
	lsls r4, r4, #2
	lsls r0, r2, #3
	adds r0, r0, r1
_080120EC:
	strh r4, [r0]
	adds r0, #8
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blo _080120EC
_080120F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012100: .4byte 0xDFFFFFFF
_08012104: .4byte gOamObjects

	thumb_func_start sub_8012108
sub_8012108: @ 0x08012108
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	bne _08012120
	ldr r0, _0801211C @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08012136
	.align 2, 0
_0801211C: .4byte gUnknown_08028100
_08012120:
	cmp r1, #0
	beq _0801212C
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	b _08012134
_0801212C:
	ldr r0, [r2]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08012134:
	str r0, [r2]
_08012136:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801213C
sub_801213C: @ 0x0801213C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	cmp r4, #0
	bne _08012158
	ldr r0, _08012154 @ =gUnknown_08028100
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08012174
	.align 2, 0
_08012154: .4byte gUnknown_08028100
_08012158:
	cmp r0, #3
	bls _08012168
	ldr r0, _0801217C @ =gUnknown_08028128
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	movs r0, #3
_08012168:
	adds r1, r4, #0
	adds r1, #0x42
	lsls r0, r0, #8
	ldrb r2, [r1]
	orrs r0, r2
	strh r0, [r1]
_08012174:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801217C: .4byte gUnknown_08028128

	thumb_func_start SetAnimationFrameOffset
SetAnimationFrameOffset: @ 0x08012180
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	cmp r4, #0
	bne _08012194
	ldr r0, _08012190 @ =gUnknown_08028100
	b _080121E6
	.align 2, 0
_08012190: .4byte gUnknown_08028100
_08012194:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xff
	bne _080121C8
	ldr r5, _080121C4 @ =gUnknown_08027090
	ldrb r1, [r4, #0xe]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r5, #4
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r2
	ldr r0, [r4, #0x14]
	cmp r0, r1
	beq _08012242
	str r1, [r4, #0x14]
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r4, #0x20]
	movs r0, #1
	bl sub_8016FEC
	b _080121FE
	.align 2, 0
_080121C4: .4byte gUnknown_08027090
_080121C8:
	cmp r0, #8
	bls _080121F4
	cmp r0, #0x1d
	bhi _080121E0
	ldr r1, _080121DC @ =gUnknown_08252494
	adds r0, r2, r1
	str r0, [r4, #0x14]
	str r1, [r4, #0x20]
	b _080121FE
	.align 2, 0
_080121DC: .4byte gUnknown_08252494
_080121E0:
	cmp r0, #0x89
	bls _080121F4
	ldr r0, _080121F0 @ =gUnknown_0802813C
_080121E6:
	movs r1, #0
	movs r2, #4
	bl nullsub_20
	b _08012242
	.align 2, 0
_080121F0: .4byte gUnknown_0802813C
_080121F4:
	ldr r1, _08012248 @ =gGfxSeqAnimation35
	adds r0, r2, r1
	str r0, [r4, #0x14]
	ldr r0, _0801224C @ =gUnknown_08252494
	str r0, [r4, #0x20]
_080121FE:
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r4]
	ldr r0, _08012250 @ =0x0000FFFF
	strh r0, [r4, #0x28]
	ldr r2, [r4, #0x14]
	ldr r1, [r4, #0x20]
	ldr r0, [r2, #4]
	adds r1, r1, r0
	str r1, [r4, #0x20]
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r0, #4
	adds r1, r1, r0
	str r1, [r4, #0x18]
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4, #0x38]
	ldrh r0, [r2, #8]
	adds r2, r0, r2
	str r2, [r4, #0x34]
	ldr r0, _08012254 @ =gMain
	adds r2, r0, #0
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08012242
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_08012242:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012248: .4byte gGfxSeqAnimation35
_0801224C: .4byte gUnknown_08252494
_08012250: .4byte 0x0000FFFF
_08012254: .4byte gMain

	thumb_func_start sub_8012258
sub_8012258: @ 0x08012258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp]
	ldr r0, _08012404 @ =gAnimation
	ldr r7, [r0, #8]
	cmp r7, #0
	bne _08012274
	b _0801244E
_08012274:
	ldrh r0, [r7, #0xc]
	cmp r0, #0xff
	bne _0801227C
	b _08012446
_0801227C:
	ldr r1, _08012408 @ =gUnknown_0200AFC0
	adds r1, #8
	mov ip, r1
	movs r2, #8
	add r2, ip
	mov sb, r2
	ldr r3, [sp, #4]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r4, _08012408 @ =gUnknown_0200AFC0
	str r0, [r4]
	str r1, [r4, #4]
	ldrh r0, [r4, #4]
	ldrh r6, [r3]
	adds r0, r6, r0
	strh r0, [r4, #4]
	ldrh r0, [r4, #6]
	ldrh r1, [r3, #2]
	adds r0, r1, r0
	strh r0, [r4, #6]
	ldr r2, [r7, #0x1c]
	mov sl, r2
	ldr r3, [r7, #0x34]
	mov r8, r3
	ldrh r4, [r3]
	str r4, [sp, #0xc]
	movs r6, #0
	str r6, [sp, #8]
	cmp r6, r4
	blo _080122BA
	b _08012446
_080122BA:
	mov r0, sp
	str r0, [sp, #0x10]
_080122BE:
	movs r1, #4
	add r8, r1
	ldr r2, _08012408 @ =gUnknown_0200AFC0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	mov r3, ip
	str r0, [r3]
	str r1, [r3, #4]
	ldr r1, _0801240C @ =0x0000FFFF
	ldr r0, [sp]
	ands r0, r1
	add sl, r0
	mov r4, r8
	ldrh r4, [r4, #2]
	lsrs r0, r4, #0xc
	lsls r0, r0, #2
	ldr r6, _08012410 @ =gUnknown_080280B4
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [sp]
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r2, [r7, #0x10]
	adds r3, r2, r0
	mov r4, sb
	strh r3, [r4, #4]
	strh r3, [r4]
	ldr r6, [sp, #0x10]
	ldrb r0, [r6, #3]
	adds r4, r3, r0
	mov r0, sb
	strh r4, [r0, #4]
	movs r0, #1
	ldrsb r0, [r1, r0]
	ldrh r1, [r7, #0x12]
	adds r2, r1, r0
	mov r6, sb
	strh r2, [r6, #6]
	strh r2, [r6, #2]
	ldr r1, [sp, #0x10]
	ldrb r0, [r1, #2]
	adds r5, r2, r0
	strh r5, [r6, #6]
	mov r6, ip
	ldrh r0, [r6, #4]
	lsls r1, r3, #0x10
	lsls r0, r0, #0x10
	cmp r1, r0
	blt _08012324
	b _08012438
_08012324:
	ldrh r1, [r6]
	mov r0, sp
	strh r1, [r0, #0x14]
	lsls r1, r4, #0x10
	ldrh r4, [r6]
	lsls r0, r4, #0x10
	cmp r0, r1
	blt _08012336
	b _08012438
_08012336:
	ldrh r0, [r6, #6]
	lsls r1, r2, #0x10
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _08012438
	ldrh r2, [r6, #2]
	lsls r1, r2, #0x10
	lsls r0, r5, #0x10
	cmp r1, r0
	bge _08012438
	mov r6, sp
	ldrh r6, [r6, #0x14]
	subs r0, r6, r3
	mov r1, ip
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801235E
	movs r3, #0
	strh r3, [r1]
_0801235E:
	mov r4, sb
	ldrh r3, [r4, #2]
	subs r0, r2, r3
	mov r6, ip
	strh r0, [r6, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08012372
	movs r0, #0
	strh r0, [r6, #2]
_08012372:
	mov r2, ip
	ldrh r1, [r2, #4]
	mov r4, sb
	ldrh r2, [r4, #4]
	lsls r1, r1, #0x10
	lsls r0, r2, #0x10
	cmp r1, r0
	ble _08012386
	mov r6, ip
	strh r2, [r6, #4]
_08012386:
	mov r1, ip
	ldrh r0, [r1, #4]
	mov r2, sb
	ldrh r2, [r2]
	subs r0, r0, r2
	strh r0, [r1, #4]
	ldrh r1, [r1, #6]
	mov r4, sb
	ldrh r2, [r4, #6]
	lsls r1, r1, #0x10
	lsls r0, r2, #0x10
	cmp r1, r0
	ble _080123A4
	mov r6, ip
	strh r2, [r6, #6]
_080123A4:
	mov r1, ip
	ldrh r0, [r1, #6]
	subs r0, r0, r3
	strh r0, [r1, #6]
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #3]
	lsrs r5, r0, #3
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r4, #6
	ldrsh r0, [r1, r4]
	cmp r2, r0
	bge _08012438
_080123BE:
	asrs r0, r2, #3
	muls r0, r5, r0
	lsls r1, r0, #5
	adds r0, r2, #0
	cmp r2, #0
	bge _080123CC
	adds r0, r2, #7
_080123CC:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r2, r0
	lsls r0, r0, #2
	adds r0, r1, r0
	mov r6, sl
	adds r4, r0, r6
	mov r0, ip
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r6, #4
	ldrsh r0, [r0, r6]
	cmp r1, r0
	bge _0801242C
_080123E8:
	asrs r0, r1, #3
	lsls r3, r0, #5
	adds r0, r1, #0
	cmp r1, #0
	bge _080123F4
	adds r0, r1, #7
_080123F4:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	cmp r0, #1
	ble _08012414
	adds r0, r4, #1
	adds r0, r3, r0
	b _08012416
	.align 2, 0
_08012404: .4byte gAnimation
_08012408: .4byte gUnknown_0200AFC0
_0801240C: .4byte 0x0000FFFF
_08012410: .4byte gUnknown_080280B4
_08012414:
	adds r0, r3, r4
_08012416:
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012420
	ldrh r0, [r7, #0xc]
	b _08012450
_08012420:
	adds r1, #2
	mov r3, ip
	movs r6, #4
	ldrsh r0, [r3, r6]
	cmp r1, r0
	blt _080123E8
_0801242C:
	adds r2, #2
	mov r1, ip
	movs r3, #6
	ldrsh r0, [r1, r3]
	cmp r2, r0
	blt _080123BE
_08012438:
	ldr r4, [sp, #8]
	adds r4, #1
	str r4, [sp, #8]
	ldr r6, [sp, #0xc]
	cmp r4, r6
	bhs _08012446
	b _080122BE
_08012446:
	ldr r7, [r7, #8]
	cmp r7, #0
	beq _0801244E
	b _08012274
_0801244E:
	movs r0, #0
_08012450:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8012460
sub_8012460: @ 0x08012460
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldrh r4, [r1]
	mov sb, r4
	ldrh r5, [r0]
	subs r4, r5, r4
	str r4, [sp]
	ldrh r1, [r1, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	subs r1, r0, r1
	mov sl, r1
	ldrh r7, [r3]
	ldrh r4, [r2]
	subs r4, r4, r7
	mov ip, r4
	ldrh r5, [r3, #2]
	ldrh r2, [r2, #2]
	subs r6, r2, r5
	ldr r0, [sp]
	adds r1, r0, #0
	muls r1, r6, r1
	mov r0, sl
	muls r0, r4, r0
	subs r4, r1, r0
	cmp r4, #0
	beq _080124F0
	mov r1, sb
	subs r3, r1, r7
	mov r0, r8
	subs r2, r0, r5
	mov r1, ip
	muls r1, r2, r1
	adds r0, r3, #0
	muls r0, r6, r0
	subs r5, r1, r0
	ldr r0, [sp]
	adds r1, r2, #0
	muls r1, r0, r1
	mov r0, sl
	muls r0, r3, r0
	subs r0, r1, r0
	cmp r4, #0
	ble _080124C8
	cmp r5, #0
	blt _080124C8
	cmp r5, r4
	ble _080124D4
_080124C8:
	cmp r4, #0
	bge _080124F0
	cmp r5, r4
	blt _080124F0
	cmp r5, #0
	bgt _080124F0
_080124D4:
	cmp r4, #0
	ble _080124E0
	cmp r0, #0
	blt _080124E0
	cmp r0, r4
	ble _080124EC
_080124E0:
	cmp r4, #0
	bge _080124F0
	cmp r0, r4
	blt _080124F0
	cmp r0, #0
	bgt _080124F0
_080124EC:
	movs r0, #1
	b _080124F2
_080124F0:
	movs r0, #0
_080124F2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckRectCollisionWithArea
CheckRectCollisionWithArea: @ 0x08012504
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	mov sl, r4
	mov r8, sp
	add r7, sp, #4
	mov r1, sl
	bl CheckPointInArea
	cmp r0, #0
	bne _080125D8
	mov r2, sp
	mov r0, sp
	ldrh r1, [r5]
	strh r1, [r0, #0xc]
	ldr r3, _080125D4 @ =0x0000FFFF
	strh r1, [r2]
	mov r4, sp
	ldrh r2, [r5, #2]
	strh r2, [r0, #6]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r4, #2]
	mov r0, sp
	ldrh r6, [r5, #4]
	adds r1, r6, r1
	strh r1, [r0, #8]
	ands r1, r3
	strh r1, [r4, #4]
	mov r1, sp
	ldrh r5, [r5, #6]
	adds r2, r5, r2
	strh r2, [r0, #0xe]
	ands r2, r3
	strh r2, [r1, #0xa]
	movs r0, #0
	mov sb, r0
_08012558:
	mov r4, sl
	adds r5, r4, #4
	movs r6, #0
_0801255E:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_8012460
	cmp r0, #0
	bne _080125D8
	adds r4, #4
	adds r5, #4
	adds r6, #1
	cmp r6, #2
	bls _0801255E
	mov r5, sl
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_8012460
	cmp r0, #0
	bne _080125D8
	movs r6, #4
	add r8, r6
	adds r7, #4
	movs r0, #1
	add sb, r0
	mov r6, sb
	cmp r6, #2
	bls _08012558
	mov r7, sp
	adds r4, r5, #0
	adds r5, #4
	movs r6, #0
_080125A2:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_8012460
	cmp r0, #0
	bne _080125D8
	adds r4, #4
	adds r5, #4
	adds r6, #1
	cmp r6, #2
	bls _080125A2
	mov r5, sl
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_8012460
	cmp r0, #0
	bne _080125D8
	movs r0, #0
	b _080125DA
	.align 2, 0
_080125D4: .4byte 0x0000FFFF
_080125D8:
	movs r0, #1
_080125DA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80125EC
sub_80125EC: @ 0x080125EC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, _080125FC @ =gAnimation
	movs r4, #0
	movs r0, #0x26
	adds r0, r0, r2
	mov ip, r0
	b _08012602
	.align 2, 0
_080125FC: .4byte gAnimation
_08012600:
	adds r4, #1
_08012602:
	cmp r4, #0x1f
	bhi _0801262E
	ldr r1, [r3, #8]
	cmp r1, #0
	bne _08012612
	str r3, [r2, #4]
	str r2, [r3, #8]
	b _0801262E
_08012612:
	adds r3, r1, #0
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	mov r5, ip
	ldrb r5, [r5]
	cmp r0, r5
	bhs _08012600
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	str r1, [r2, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	str r2, [r1, #4]
_0801262E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start DoAnimationAction
DoAnimationAction: @ 0x08012634
	push {r4, lr}
	adds r2, r0, #0
	cmp r2, #1
	beq _08012642
	cmp r2, #2
	beq _08012664
	b _0801267A
_08012642:
	ldr r3, _08012660 @ =gMain
	adds r4, r3, #0
	adds r4, #0xe8
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0801267A
	movs r0, #0x1e
	strh r0, [r3, #0x14]
	orrs r1, r2
	str r1, [r4]
	strb r2, [r3, #0x16]
	b _0801267A
	.align 2, 0
_08012660: .4byte gMain
_08012664:
	ldr r0, _08012680 @ =gMain
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0801267A
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
_0801267A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012680: .4byte gMain

	thumb_func_start PlayPersonAnimation
PlayPersonAnimation: @ 0x08012684
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r2, #0x78
	ldr r1, _080126E8 @ =gMain
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _080126AC
	adds r3, r1, #0
	adds r3, #0x4a
	movs r0, #0x10
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	beq _080126AC
	subs r2, #0xf0
_080126AC:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _080126C4
	adds r1, #0x4a
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080126C4
	adds r2, #0xf0
_080126C4:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r4
	cmp r0, #0
	beq _080126D2
	movs r0, #1
	orrs r5, r0
_080126D2:
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x50
	bl sub_8012700
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080126E8: .4byte gMain

	thumb_func_start sub_80126EC
sub_80126EC: @ 0x080126EC
	ldr r0, _080126FC @ =gMain
	adds r2, r0, #0
	adds r2, #0xc6
	strh r1, [r2]
	adds r0, #0xc4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080126FC: .4byte gMain

	thumb_func_start sub_8012700
sub_8012700: @ 0x08012700
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _0801273C @ =gMain
	mov r8, r0
	ldr r5, _08012740 @ =gAnimation+0x44
	movs r2, #0xff
	adds r1, r4, #0
	ands r1, r2
	cmp r1, #0
	bne _08012744
	movs r0, #0
	bl sub_8016FEC
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08012736
	adds r0, r5, #0
	bl DestroyAnimation
_08012736:
	movs r0, #0
	b _08012802
	.align 2, 0
_0801273C: .4byte gMain
_08012740: .4byte gAnimation+0x44
_08012744:
	mov r0, sp
	strh r2, [r0]
	strh r4, [r0, #2]
	adds r4, r1, #0
	ldr r0, _08012810 @ =0x06015800
	str r0, [sp, #0x10]
	ldr r2, _08012814 @ =gUnknown_08027090
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r2
	ldr r1, [r1]
	str r1, [sp, #0x14]
	adds r1, r2, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	str r0, [sp, #8]
	mov r1, sp
	movs r0, #0xe
	strb r0, [r1, #0x18]
	ldrh r1, [r5, #0xc]
	cmp r1, #0xff
	bne _08012788
	cmp r4, #0x11
	bne _0801277E
	mov r1, sp
	movs r0, #0xd
	strb r0, [r1, #0x18]
_0801277E:
	cmp r4, #0x19
	bne _08012788
	mov r1, sp
	movs r0, #0xd
	strb r0, [r1, #0x18]
_08012788:
	mov r1, sp
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	strb r0, [r1, #0x19]
	movs r0, #0x31
	strb r0, [r1, #0x1a]
	mov r0, sp
	strh r7, [r0, #4]
	strh r3, [r0, #6]
	ldr r2, [r5]
	movs r3, #0x80
	lsls r3, r3, #0x15
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _080127CC
	add r1, sp, #0x1c
	strh r0, [r1]
	ldr r0, _08012818 @ =0x040000D4
	str r1, [r0]
	str r5, [r0, #4]
	ldr r1, _0801281C @ =0x81000022
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	orrs r2, r3
	str r2, [r5]
	movs r0, #0xff
	strh r0, [r5, #0xc]
	adds r0, r5, #0
	bl sub_80125EC
_080127CC:
	adds r4, r5, #0
	adds r4, #0x2c
	mov r0, sp
	movs r1, #0xff
	ldr r2, [sp, #0x38]
	bl sub_8012AD4
	mov r2, r8
	ldrh r0, [r2, #0x34]
	strb r0, [r4]
	ldr r1, _08012820 @ =gMain
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080127FA
	mov r1, r8
	adds r1, #0x3d
	movs r0, #0x10
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080127FA:
	movs r0, #1
	bl sub_8016FEC
	adds r0, r5, #0
_08012802:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012810: .4byte 0x06015800
_08012814: .4byte gUnknown_08027090
_08012818: .4byte 0x040000D4
_0801281C: .4byte 0x81000022
_08012820: .4byte gMain

	thumb_func_start PlayAnimation
PlayAnimation: @ 0x08012824
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _0801285C @ =gMain
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _08012860 @ =gUnknown_080272B8
	adds r0, r0, r1
	movs r4, #0xc
	ldrsh r1, [r0, r4]
	movs r5, #0xe
	ldrsh r4, [r0, r5]
	adds r2, #0x4a
	movs r0, #0x10
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _0801284E
	cmp r3, #8
	bls _0801284E
	subs r1, #0xf0
_0801284E:
	adds r0, r3, #0
	adds r2, r4, #0
	bl PlayAnimationAtCustomOrigin
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801285C: .4byte gMain
_08012860: .4byte gUnknown_080272B8

	thumb_func_start PlayAnimationAtCustomOrigin
PlayAnimationAtCustomOrigin: @ 0x08012864
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r7, _08012934 @ =gMain
	lsls r3, r5, #2
	adds r3, r3, r5
	lsls r3, r3, #2
	ldr r0, _08012938 @ =gUnknown_080272B8
	adds r3, r3, r0
	mov r0, sp
	strh r5, [r0]
	ldr r0, [r3, #4]
	str r0, [sp, #0x10]
	ldr r0, [r3]
	str r0, [sp, #0x14]
	ldr r0, [r3, #8]
	str r0, [sp, #8]
	mov r4, sp
	ldrb r0, [r3, #0x10]
	strb r0, [r4, #0x18]
	ldrb r0, [r3, #0x11]
	strb r0, [r4, #0x19]
	ldrb r0, [r3, #0x12]
	strb r0, [r4, #0x1a]
	mov r0, sp
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	ldrb r2, [r3, #0x13]
	adds r1, r5, #0
	bl sub_8012AD4
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x24
	ldrb r3, [r6]
	subs r1, r3, #6
	movs r5, #1
	lsls r5, r1
	movs r0, #0x26
	adds r0, r0, r7
	mov ip, r0
	ldrb r2, [r0]
	adds r0, r2, #0
	ands r0, r5
	cmp r0, #0
	bne _080128F0
	cmp r3, #9
	bhi _080128F0
	orrs r2, r5
	mov r0, ip
	strb r2, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #5
	ldr r2, _0801293C @ =0x05000200
	adds r5, r0, r2
	lsls r3, r1, #5
	ldr r0, _08012940 @ =gUnknown_03004150
	adds r3, r3, r0
	ldr r0, [r4, #0x20]
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r2, _08012944 @ =0x040000D4
	str r5, [r2]
	str r3, [r2, #4]
	lsrs r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r2, #8]
	ldr r0, [r2, #8]
_080128F0:
	ldrh r1, [r7, #0x34]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2d
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x11
	orrs r0, r1
	str r0, [r4]
	ldr r1, _08012934 @ =gMain
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08012928
	adds r1, r7, #0
	adds r1, #0x3d
	movs r0, #0x10
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_08012928:
	adds r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012934: .4byte gMain
_08012938: .4byte gUnknown_080272B8
_0801293C: .4byte 0x05000200
_08012940: .4byte gUnknown_03004150
_08012944: .4byte 0x040000D4

	thumb_func_start sub_8012948
sub_8012948: @ 0x08012948
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r6, _08012A80 @ =gAnimation+0x44
	bl ResetAnimationSystem
	ldr r0, [r4, #0x14]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08012A36
	mov r1, sp
	movs r0, #0xff
	strh r0, [r1]
	mov r0, sp
	ldrb r3, [r4, #2]
	strb r3, [r0, #2]
	ldr r0, _08012A84 @ =0x06015800
	str r0, [sp, #0x10]
	ldr r2, _08012A88 @ =gUnknown_08027090
	ldrb r1, [r4, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r0, [r4, #8]
	str r0, [sp, #8]
	mov r1, sp
	movs r0, #0xe
	strb r0, [r1, #0x18]
	ldrb r5, [r4, #2]
	ldrh r0, [r6, #0xc]
	cmp r0, #0xff
	bne _080129A8
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x11
	bne _0801299E
	movs r0, #0xd
	strb r0, [r1, #0x18]
_0801299E:
	cmp r3, #0x19
	bne _080129A8
	mov r1, sp
	movs r0, #0xd
	strb r0, [r1, #0x18]
_080129A8:
	mov r1, sp
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	strb r0, [r1, #0x19]
	movs r0, #0x31
	strb r0, [r1, #0x1a]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	ldrh r0, [r4, #6]
	strh r0, [r1, #6]
	ldr r1, _08012A8C @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	adds r0, r6, #0
	adds r0, #0xc
	str r0, [r1, #4]
	ldr r0, _08012A90 @ =0x8000000E
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, [r6, #0x14]
	str r2, [r6, #0x38]
	ldr r1, [r6, #0x20]
	ldr r0, [r2, #4]
	adds r1, r1, r0
	str r1, [r6, #0x20]
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r0, #4
	adds r1, r1, r0
	str r1, [r6, #0x18]
	ldr r0, [r4, #0x18]
	str r0, [r6, #0x38]
	ldrh r0, [r0]
	adds r2, r0, r2
	str r2, [r6, #0x34]
	ldr r0, [r4, #0x14]
	movs r1, #0x82
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r6]
	ldr r0, [r6, #0x1c]
	lsrs r0, r0, #5
	ldrh r3, [r6, #0x3c]
	orrs r0, r3
	strh r0, [r6, #0x3c]
	adds r1, r6, #0
	adds r1, #0x42
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r5, r6, #0
	adds r5, #0x26
	ldrb r0, [r5]
	lsrs r1, r0, #4
	adds r0, r6, #0
	bl sub_801213C
	movs r0, #0xf
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	ldrb r1, [r4, #0x10]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_80125EC
_08012A36:
	adds r4, #0x1c
	movs r5, #2
_08012A3A:
	ldr r0, [r4, #0x14]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08012A70
	ldrh r0, [r4]
	movs r2, #4
	ldrsh r1, [r4, r2]
	movs r3, #6
	ldrsh r2, [r4, r3]
	bl PlayAnimationAtCustomOrigin
	adds r6, r0, #0
	ldr r0, [r4, #0x14]
	movs r1, #0x82
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r6]
	ldr r1, [r4, #0x18]
	str r1, [r6, #0x38]
	ldr r0, [r6, #0x14]
	ldrh r1, [r1]
	adds r0, r1, r0
	str r0, [r6, #0x34]
	ldr r0, [r4, #0x10]
	str r0, [r6, #0x2c]
_08012A70:
	adds r5, #1
	adds r4, #0x1c
	cmp r5, #0x1f
	bls _08012A3A
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012A80: .4byte gAnimation+0x44
_08012A84: .4byte 0x06015800
_08012A88: .4byte gUnknown_08027090
_08012A8C: .4byte 0x040000D4
_08012A90: .4byte 0x8000000E

	thumb_func_start sub_8012A94
sub_8012A94: @ 0x08012A94
	adds r1, r0, #0
	ldr r2, _08012ACC @ =gAnimation+0x44
	ldr r3, _08012AD0 @ =0x0000083C
	adds r0, r2, r3
	cmp r2, r0
	bhs _08012AC6
	adds r3, r0, #0
_08012AA2:
	ldr r0, [r2, #0xc]
	str r0, [r1]
	ldr r0, [r2, #0x10]
	str r0, [r1, #4]
	ldr r0, [r2, #0x28]
	str r0, [r1, #0xc]
	ldr r0, [r2, #0x2c]
	str r0, [r1, #0x10]
	ldr r0, [r2, #0x14]
	str r0, [r1, #8]
	ldr r0, [r2]
	str r0, [r1, #0x14]
	ldr r0, [r2, #0x38]
	str r0, [r1, #0x18]
	adds r2, #0x44
	adds r1, #0x1c
	cmp r2, r3
	blo _08012AA2
_08012AC6:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08012ACC: .4byte gAnimation+0x44
_08012AD0: .4byte 0x0000083C

	thumb_func_start sub_8012AD4
sub_8012AD4: @ 0x08012AD4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	ldrh r0, [r5]
	bl sub_8011DA0
	adds r4, r0, #0
	cmp r4, #0
	bne _08012AF8
	ldr r0, _08012AF4 @ =gUnknown_080280F0
	movs r1, #0
	movs r2, #5
	bl nullsub_20
	movs r0, #0
	b _08012B9C
	.align 2, 0
_08012AF4: .4byte gUnknown_080280F0
_08012AF8:
	ldr r1, _08012BA4 @ =0x040000D4
	str r5, [r1]
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [r1, #4]
	ldr r0, _08012BA8 @ =0x8000000E
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, [r4, #0x14]
	ldr r1, [r4, #0x20]
	ldr r0, [r2, #4]
	adds r1, r1, r0
	str r1, [r4, #0x20]
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r0, #4
	adds r1, r1, r0
	str r1, [r4, #0x18]
	adds r0, r2, #0
	adds r0, #8
	str r0, [r4, #0x38]
	ldrh r0, [r2, #8]
	adds r2, r0, r2
	str r2, [r4, #0x34]
	ldr r1, [r4]
	orrs r1, r6
	str r1, [r4]
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _08012B3C
	ldr r0, _08012BAC @ =0x7FFFFFFF
	ands r1, r0
	str r1, [r4]
_08012B3C:
	ldr r0, [r4, #0x1c]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x16
	ldrh r1, [r4, #0x3c]
	orrs r0, r1
	movs r1, #0
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x26
	ldrb r2, [r5]
	lsrs r1, r2, #4
	adds r0, r4, #0
	bl sub_801213C
	movs r0, #0xf
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_80125EC
	ldr r1, [r4, #0x38]
	movs r0, #2
	ldrb r2, [r1, #3]
	ands r0, r2
	cmp r0, #0
	beq _08012B88
	ldrb r0, [r1, #4]
	bl PlaySE
_08012B88:
	ldr r1, [r4, #0x38]
	movs r0, #4
	ldrb r2, [r1, #3]
	ands r0, r2
	cmp r0, #0
	beq _08012B9A
	ldrb r0, [r1, #5]
	bl DoAnimationAction
_08012B9A:
	adds r0, r4, #0
_08012B9C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012BA4: .4byte 0x040000D4
_08012BA8: .4byte 0x8000000E
_08012BAC: .4byte 0x7FFFFFFF

	thumb_func_start sub_8012BB0
sub_8012BB0: @ 0x08012BB0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #4
	ldr r0, _08012BC8 @ =gCourtScroll
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _08012BCC
	ldrb r0, [r4, #0xe]
	cmp r0, #6
	bne _08012BCC
	movs r0, #4
	b _08012C88
	.align 2, 0
_08012BC8: .4byte gCourtScroll
_08012BCC:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, #0
	ands r2, r1
	cmp r2, #0
	beq _08012BE0
	orrs r0, r1
	str r0, [r4]
	b _08012C86
_08012BE0:
	ldr r3, [r4, #0x38]
	ldrb r1, [r3, #2]
	ldrh r0, [r4, #0x28]
	adds r0, #1
	strh r0, [r4, #0x28]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08012C86
	strh r2, [r4, #0x28]
	adds r1, r3, #0
	adds r1, #8
	str r1, [r4, #0x38]
	movs r0, #2
	ldrb r2, [r1, #3]
	ands r0, r2
	cmp r0, #0
	beq _08012C0A
	ldrb r0, [r1, #4]
	bl PlaySE
_08012C0A:
	ldr r1, [r4, #0x38]
	movs r0, #4
	ldrb r2, [r1, #3]
	ands r0, r2
	cmp r0, #0
	beq _08012C1C
	ldrb r0, [r1, #5]
	bl DoAnimationAction
_08012C1C:
	ldr r0, [r4, #0x38]
	ldrb r1, [r0, #2]
	adds r2, r0, #0
	cmp r1, #0xfe
	beq _08012C50
	cmp r1, #0xfe
	bgt _08012C30
	cmp r1, #0xfd
	beq _08012C68
	b _08012C72
_08012C30:
	cmp r1, #0xff
	bne _08012C72
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r4, #0x38]
	ldrh r1, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x34]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r4]
	movs r5, #7
	b _08012C86
_08012C50:
	ldr r0, [r4]
	ldr r1, _08012C64 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r4]
	movs r5, #0
	adds r0, r2, #0
	subs r0, #8
	str r0, [r4, #0x38]
	b _08012C86
	.align 2, 0
_08012C64: .4byte 0x7FFFFFFF
_08012C68:
	adds r0, r4, #0
	bl DestroyAnimation
	movs r5, #0
	b _08012C86
_08012C72:
	ldr r0, [r4, #0x14]
	ldrh r2, [r2]
	adds r0, r2, r0
	str r0, [r4, #0x34]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r4]
	movs r5, #5
_08012C86:
	adds r0, r5, #0
_08012C88:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8012C90
sub_8012C90: @ 0x08012C90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	ldr r0, _08012D2C @ =gAnimation
	ldr r4, [r0, #8]
	cmp r4, #0
	beq _08012D1E
_08012CA6:
	ldr r0, [r4]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08012D18
	ldrh r0, [r4, #0x10]
	add r0, r8
	strh r0, [r4, #0x10]
	ldrh r1, [r4, #0x12]
	adds r0, r1, r7
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r5, _08012D30 @ =gOamObjects
	adds r3, r0, r5
	movs r2, #0x3f
	adds r2, r2, r4
	mov ip, r2
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r5
	cmp r3, r0
	bhs _08012D18
	movs r2, #0xff
	mov sl, r2
	ldr r6, _08012D34 @ =0x000001FF
	movs r0, #0xfe
	lsls r0, r0, #8
	mov sb, r0
_08012CE4:
	movs r1, #0xff
	lsls r1, r1, #8
	ldrh r2, [r3]
	ands r1, r2
	ldrb r2, [r3]
	adds r0, r2, r7
	mov r2, sl
	ands r0, r2
	orrs r1, r0
	strh r1, [r3]
	ldrh r2, [r3, #2]
	adds r0, r6, #0
	ands r0, r2
	mov r1, sb
	ands r1, r2
	add r0, r8
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, #2]
	adds r3, #8
	mov r1, ip
	ldrb r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r5
	cmp r3, r0
	blo _08012CE4
_08012D18:
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _08012CA6
_08012D1E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012D2C: .4byte gAnimation
_08012D30: .4byte gOamObjects
_08012D34: .4byte 0x000001FF

	thumb_func_start StartAnimationBlend
StartAnimationBlend: @ 0x08012D38
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	mov sb, r1
	ldr r0, _08012D64 @ =gIORegisters
	mov r8, r0
	ldr r7, _08012D68 @ =gMain
	ldr r5, _08012D6C @ =gScriptContext
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08012D70
	lsrs r0, r4, #8
	movs r1, #0xff
	ands r4, r1
	bl FindAnimationFromAnimId
	adds r3, r0, #0
	b _08012D72
	.align 2, 0
_08012D64: .4byte gIORegisters
_08012D68: .4byte gMain
_08012D6C: .4byte gScriptContext
_08012D70:
	ldr r3, _08012DC0 @ =gAnimation+0x44
_08012D72:
	mov r0, r8
	adds r0, #0x4e
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _08012D86
	movs r0, #0x20
	ldrh r5, [r5, #0x1c]
	ands r0, r5
	cmp r0, #0
	beq _08012E52
_08012D86:
	ldr r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	cmp r0, #0
	bne _08012D9A
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08012E52
_08012D9A:
	movs r5, #1
	ands r5, r4
	cmp r5, #0
	beq _08012DCC
	ldr r0, _08012DC4 @ =gUnknown_02000004
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	beq _08012E52
	ldr r0, _08012DC8 @ =0xF3FFFFFB
	ands r2, r0
	str r2, [r3]
	adds r1, r7, #0
	adds r1, #0x8f
	movs r0, #0x10
	strb r0, [r1]
	adds r2, r1, #0
	b _08012E14
	.align 2, 0
_08012DC0: .4byte gAnimation+0x44
_08012DC4: .4byte gUnknown_02000004
_08012DC8: .4byte 0xF3FFFFFB
_08012DCC:
	movs r6, #4
	adds r0, r4, #0
	ands r0, r6
	cmp r0, #0
	beq _08012E52
	ldr r1, _08012E60 @ =gUnknown_02000004
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	beq _08012E52
	orrs r2, r6
	str r2, [r3]
	adds r0, r7, #0
	adds r0, #0x8f
	strb r5, [r0]
	ldr r1, [r3]
	movs r2, #0x40
	ands r1, r2
	adds r2, r0, #0
	cmp r1, #0
	beq _08012E02
	strb r6, [r2]
	ldr r0, [r3]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
_08012E02:
	movs r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq _08012E14
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r3]
_08012E14:
	ldr r0, [r3]
	movs r1, #0x88
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
	adds r0, r7, #0
	adds r0, #0x8e
	movs r1, #0
	mov r3, sb
	strb r3, [r0]
	subs r0, #2
	strh r1, [r0]
	mov r3, r8
	adds r3, #0x48
	movs r0, #0x94
	lsls r0, r0, #4
	strh r0, [r3]
	ldrb r2, [r2]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	mov r2, r8
	adds r2, #0x4c
	strh r1, [r2]
	ldr r1, _08012E64 @ =0x04000050
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2]
	strh r0, [r1]
_08012E52:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012E60: .4byte gUnknown_02000004
_08012E64: .4byte 0x04000050

	thumb_func_start sub_8012E68
sub_8012E68: @ 0x08012E68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _08012ED8 @ =gMain
	ldr r0, _08012EDC @ =gIORegisters
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	movs r6, #0
	strh r0, [r2]
	adds r1, r3, #0
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	blo _08012F28
	movs r0, #0
	strh r0, [r2]
	ldr r2, [r4]
	movs r0, #4
	ands r0, r2
	adds r5, r2, #0
	cmp r0, #0
	beq _08012EF4
	adds r1, r3, #0
	adds r1, #0x8f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _08012F28
	mov r1, ip
	adds r1, #0x48
	ldr r0, _08012EE0 @ =0x00003942
	strh r0, [r1]
	adds r1, #4
	ldr r0, _08012EE4 @ =0x0000071F
	strh r0, [r1]
	ldr r0, _08012EE8 @ =0xFDFFFFFF
	ands r0, r5
	str r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08012EEC
	adds r0, r4, #0
	movs r1, #0
	bl ChangeAnimationActivity
	b _08012F3C
	.align 2, 0
_08012ED8: .4byte gMain
_08012EDC: .4byte gIORegisters
_08012EE0: .4byte 0x00003942
_08012EE4: .4byte 0x0000071F
_08012EE8: .4byte 0xFDFFFFFF
_08012EEC:
	adds r0, r4, #0
	bl DestroyAnimation
	b _08012F3C
_08012EF4:
	adds r1, r3, #0
	adds r1, #0x8f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012F28
	mov r1, ip
	adds r1, #0x48
	ldr r0, _08012F1C @ =0x00003942
	strh r0, [r1]
	adds r1, #4
	ldr r0, _08012F20 @ =0x0000071F
	strh r0, [r1]
	ldr r0, _08012F24 @ =0xFDFFFFFF
	ands r2, r0
	str r2, [r4]
	b _08012F3C
	.align 2, 0
_08012F1C: .4byte 0x00003942
_08012F20: .4byte 0x0000071F
_08012F24: .4byte 0xFDFFFFFF
_08012F28:
	adds r0, r3, #0
	adds r0, #0x8f
	ldrb r2, [r0]
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	mov r0, ip
	adds r0, #0x4c
	strh r1, [r0]
_08012F3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ActivateAllAllocatedAnimations
ActivateAllAllocatedAnimations: @ 0x08012F44
	push {r4, r5, lr}
	ldr r2, _08012F78 @ =gAnimation
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r2, r1
	cmp r2, r0
	bhs _08012F70
	movs r5, #0x80
	lsls r5, r5, #0x15
	movs r4, #0xc0
	lsls r4, r4, #0x17
	adds r3, r0, #0
_08012F5C:
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	beq _08012F6A
	orrs r1, r4
	str r1, [r2]
_08012F6A:
	adds r2, #0x44
	cmp r2, r3
	blo _08012F5C
_08012F70:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012F78: .4byte gAnimation

	thumb_func_start DestroyAnimation
DestroyAnimation: @ 0x08012F7C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, _0801303C @ =gMain
	cmp r3, #0
	beq _08013034
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08013034
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r4, _08013040 @ =gOamObjects
	adds r1, r0, r4
	adds r2, r3, #0
	adds r2, #0x3f
	ldrb r5, [r2]
	lsls r0, r5, #3
	adds r0, r0, r4
	movs r7, #0x27
	adds r7, r7, r6
	mov ip, r7
	cmp r1, r0
	bhs _08012FC4
	movs r5, #0x80
	lsls r5, r5, #2
_08012FB6:
	strh r5, [r1]
	adds r1, #8
	ldrb r7, [r2]
	lsls r0, r7, #3
	adds r0, r0, r4
	cmp r1, r0
	blo _08012FB6
_08012FC4:
	movs r0, #4
	mov r1, ip
	ldrb r1, [r1]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2]
	ldr r1, [r3, #4]
	ldr r0, [r3, #8]
	str r0, [r1, #8]
	ldr r1, [r3, #8]
	ldr r0, [r3, #4]
	str r0, [r1, #4]
	ldrh r5, [r3, #0xc]
	cmp r5, #0xff
	beq _08013030
	adds r4, r3, #0
	adds r4, #0x24
	ldrb r7, [r4]
	cmp r7, #9
	bhi _08013030
	ldr r0, [r3]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08013030
	adds r2, r7, #0
	subs r2, #6
	movs r0, #1
	lsls r0, r2
	adds r1, r6, #0
	adds r1, #0x26
	ldrb r5, [r1]
	bics r5, r0
	adds r0, r5, #0
	strb r0, [r1]
	lsls r2, r2, #5
	ldr r0, _08013044 @ =gUnknown_03004150
	adds r5, r2, r0
	ldrb r4, [r4]
	lsls r1, r4, #5
	ldr r7, _08013048 @ =0x05000200
	adds r1, r1, r7
	ldr r0, [r3, #0x20]
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r2, _0801304C @ =0x040000D4
	str r5, [r2]
	str r1, [r2, #4]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08013030:
	movs r0, #0
	str r0, [r3]
_08013034:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801303C: .4byte gMain
_08013040: .4byte gOamObjects
_08013044: .4byte gUnknown_03004150
_08013048: .4byte 0x05000200
_0801304C: .4byte 0x040000D4

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
	ldr r1, _080131C4 @ =gUnknown_080280B4
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
_080131C4: .4byte gUnknown_080280B4
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
	bl sub_8012E68
_0801394E:
	ldr r0, [r4]
	cmp r0, #0
	bge _0801395E
	adds r0, r4, #0
	bl sub_8012BB0
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
	bl sub_8012E68
_08013D12:
	ldr r0, [r4]
	cmp r0, #0
	bge _08013D22
	adds r0, r4, #0
	bl sub_8012BB0
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
	bl sub_8012700
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl sub_80126EC
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
	bl sub_8012700
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl sub_80126EC
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
	bl sub_8012700
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl sub_80126EC
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
	bl sub_8012700
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl sub_80126EC
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
	bl sub_8012700
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl sub_80126EC
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
	bl sub_8012700
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl sub_80126EC
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
