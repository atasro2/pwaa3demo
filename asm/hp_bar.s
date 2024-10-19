	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_801621C
sub_801621C: @ 0x0801621C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r2, #0
	str r3, [sp, #8]
	ldr r6, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	cmp r7, #0
	bge _08016240
	movs r7, #0
_08016240:
	ldr r0, [sp, #0x38]
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _080162D8 @ =gOamObjects
	mov r8, r1
	add r0, r8
	mov sb, r0
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r4, _080162DC @ =gSineTable
	movs r2, #0x80
	adds r2, r2, r4
	mov sl, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r1, r5, #0
	bl fix_mul
	movs r1, #0xb0
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r1, r5, #0
	bl fix_mul
	movs r1, #0xb2
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	ldrh r4, [r4]
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	bl fix_mul
	movs r1, #0xb4
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r5, #0
	bl fix_mul
	movs r1, #0xb6
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	subs r6, #1
	cmp r6, #0
	bge _080162B0
	movs r6, #0
_080162B0:
	mov sl, r6
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x40]
	lsls r0, r2, #0x10
	lsrs r4, r0, #4
	lsls r1, r6, #0x14
	ldr r2, [sp]
	lsls r0, r2, #0x10
	adds r2, r1, r0
	movs r3, #0xff
	ldr r0, [sp, #4]
	ands r3, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r3, r0
	ldr r6, _080162E0 @ =0x000001FF
	b _08016312
	.align 2, 0
_080162D8: .4byte gOamObjects
_080162DC: .4byte gSineTable
_080162E0: .4byte 0x000001FF
_080162E4:
	lsrs r0, r2, #0x10
	mov r1, sb
	strh r3, [r1]
	ands r0, r6
	movs r1, #0xb0
	lsls r1, r1, #6
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	mov r1, sb
	strh r0, [r1, #2]
	ldr r0, _08016410 @ =0x000003FF
	ands r0, r5
	orrs r0, r4
	strh r0, [r1, #4]
	movs r0, #8
	add sb, r0
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r2, r2, r1
	movs r0, #1
	add sl, r0
_08016312:
	adds r0, r7, #0
	cmp r7, #0
	bge _0801631A
	adds r0, #0xf
_0801631A:
	asrs r0, r0, #4
	cmp sl, r0
	blt _080162E4
	mov r1, sl
	cmp r1, #4
	bgt _080163FC
	lsls r0, r0, #4
	subs r7, r7, r0
	cmp r7, #0
	beq _080163FC
	ldr r2, [sp, #0x44]
	lsls r2, r2, #0x10
	str r2, [sp, #0x10]
	lsrs r0, r2, #0x10
	str r0, [sp, #0xc]
	lsls r0, r7, #0x14
	asrs r0, r0, #0x10
	bl fix_inverse
	adds r5, r0, #0
	ldr r1, _08016414 @ =gSineTable
	mov r8, r1
	ldr r2, _08016418 @ =gUnknown_080264B0
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r5, #0
	bl fix_mul
	ldr r2, [sp, #0xc]
	lsls r1, r2, #5
	ldr r2, _0801641C @ =gOamObjects
	adds r1, r1, r2
	strh r0, [r1, #6]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #1
	bl fix_mul
	ldr r1, [sp, #0xc]
	lsls r4, r1, #2
	adds r1, r4, #1
	lsls r1, r1, #3
	ldr r2, _0801641C @ =gOamObjects
	adds r1, r1, r2
	strh r0, [r1, #6]
	mov r1, r8
	ldrh r1, [r1]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	bl fix_mul
	adds r1, r4, #2
	lsls r1, r1, #3
	ldr r2, _0801641C @ =gOamObjects
	adds r1, r1, r2
	strh r0, [r1, #6]
	ldr r1, _08016418 @ =gUnknown_080264B0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #1
	bl fix_mul
	adds r4, #3
	lsls r4, r4, #3
	ldr r1, _0801641C @ =gOamObjects
	adds r4, r4, r1
	strh r0, [r4, #6]
	mov r2, sl
	lsls r1, r2, #4
	movs r0, #0x10
	subs r0, r0, r7
	lsrs r0, r0, #1
	subs r1, r1, r0
	movs r0, #1
	ands r7, r0
	subs r1, r1, r7
	ldr r0, [sp]
	adds r1, r1, r0
	ldr r2, [sp, #0x40]
	lsls r3, r2, #0x10
	movs r0, #0xff
	ldr r2, [sp, #4]
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #2
	orrs r0, r2
	mov r2, sb
	strh r0, [r2]
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x17
	ldr r0, [sp, #0xc]
	lsls r0, r0, #9
	str r0, [sp, #0x14]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r1, r0
	strh r1, [r2, #2]
	ldr r1, [sp, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x16
	lsrs r3, r3, #4
	orrs r0, r3
	strh r0, [r2, #4]
	movs r2, #1
	add sl, r2
_080163FC:
	mov r0, sl
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016410: .4byte 0x000003FF
_08016414: .4byte gSineTable
_08016418: .4byte gUnknown_080264B0
_0801641C: .4byte gOamObjects

	thumb_func_start sub_8016420
sub_8016420: @ 0x08016420
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _08016458 @ =gMain
	ldr r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08016452
	lsrs r0, r1, #2
	movs r1, #0xf
	bl __umodsi3
	ldr r1, _0801645C @ =0x040000D4
	lsls r0, r0, #5
	adds r0, r5, r0
	str r0, [r1]
	lsls r0, r4, #5
	ldr r2, _08016460 @ =0x05000200
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _08016464 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08016452:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016458: .4byte gMain
_0801645C: .4byte 0x040000D4
_08016460: .4byte 0x05000200
_08016464: .4byte 0x80000010

	thumb_func_start sub_8016468
sub_8016468: @ 0x08016468
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	str r0, [sp, #0x4c]
	str r1, [sp, #0x50]
	mov r1, sp
	ldr r0, _08016534 @ =gUnknown_0802823C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	add r4, sp, #0x30
	adds r1, r4, #0
	ldr r0, _08016538 @ =gUnknown_0802826C
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801653C @ =gMain
	ldr r0, [r0]
	ldr r1, [r4, #0x18]
	bl __umodsi3
	mov sl, r0
	movs r0, #0
	mov r8, r0
	mov r7, sp
	mov sb, r4
_080164B2:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, sl
	beq _080164C2
	bl sub_8016D48
	cmp r0, #0
	bne _08016512
_080164C2:
	mov r0, r8
	movs r1, #3
	bl __modsi3
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x6b
	adds r0, r5, #0
	bl FindAnimationFromAnimId
	adds r4, r0, #0
	cmp r4, #0
	bne _08016512
	ldr r1, [r7]
	ldr r2, [sp, #0x4c]
	adds r1, r2, r1
	ldr r2, [r7, #4]
	ldr r3, [sp, #0x50]
	adds r2, r3, r2
	adds r2, #8
	adds r0, r5, #0
	bl PlayAnimationAtCustomOrigin
	adds r4, r0, #0
	subs r5, #0x5b
	bl Random
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	asrs r2, r2, #8
	lsls r2, r2, #8
	subs r2, r0, r2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetAnimationScale
_08016512:
	adds r7, #8
	movs r1, #4
	add sb, r1
	movs r2, #1
	add r8, r2
	mov r3, r8
	cmp r3, #5
	ble _080164B2
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016534: .4byte gUnknown_0802823C
_08016538: .4byte gUnknown_0802826C
_0801653C: .4byte gMain

	thumb_func_start AnimateHPBar
AnimateHPBar: @ 0x08016540
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _08016568 @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _08016570
	ldr r7, _0801656C @ =0x06011880
	movs r2, #0x3d
	mov sb, r2
	b _08016576
	.align 2, 0
_08016568: .4byte gScriptContext
_0801656C: .4byte 0x06011880
_08016570:
	ldr r7, _08016630 @ =0x06015000
	movs r3, #0x25
	mov sb, r3
_08016576:
	movs r1, #0
	ldr r2, _08016634 @ =gMapMarker
_0801657A:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0801658A
	ldr r7, _08016638 @ =0x06011080
_0801658A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _0801657A
	ldr r4, _0801663C @ =0xF9FF0000
	adds r7, r7, r4
	lsrs r7, r7, #5
	ldr r4, _08016640 @ =gMain
	movs r5, #0xa8
	adds r5, r5, r4
	mov sl, r5
	ldr r6, _08016644 @ =gUnknown_03003856
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0801664C
	ldr r0, _08016648 @ =gUnknown_0814DF88
	movs r1, #9
	bl sub_8016420
	movs r3, #0
	str r3, [sp, #0x10]
	ldr r0, [r4]
	lsrs r0, r0, #1
	str r0, [sp, #0x14]
	movs r0, #1
	ldr r5, [sp, #0x14]
	ands r5, r0
	str r5, [sp, #0x14]
	movs r6, #0xac
	adds r6, r6, r4
	mov r8, r6
	ldrh r0, [r6]
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0xae
	ldr r4, [sp, #0x14]
	subs r4, #8
	ldrh r2, [r5]
	adds r1, r2, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, sl
	movs r6, #0
	ldrsh r2, [r3, r6]
	mov r3, sb
	str r3, [sp]
	ldr r6, [sp, #0x10]
	str r6, [sp, #4]
	movs r3, #8
	str r3, [sp, #8]
	movs r3, #0x14
	str r3, [sp, #0xc]
	adds r3, r7, #0
	bl sub_801621C
	adds r3, r0, #0
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r5, [r5]
	adds r4, r5, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r5, _08016644 @ =gUnknown_03003856
	movs r6, #0
	ldrsh r2, [r5, r6]
	mov r1, sb
	str r1, [sp]
	str r3, [sp, #4]
	movs r1, #9
	str r1, [sp, #8]
	movs r1, #0x15
	str r1, [sp, #0xc]
	adds r1, r4, #0
	b _08016782
	.align 2, 0
_08016630: .4byte 0x06015000
_08016634: .4byte gMapMarker
_08016638: .4byte 0x06011080
_0801663C: .4byte 0xF9FF0000
_08016640: .4byte gMain
_08016644: .4byte gUnknown_03003856
_08016648: .4byte gUnknown_0814DF88
_0801664C:
	cmp r1, r0
	bge _0801670C
	movs r2, #0xac
	adds r2, r2, r4
	mov r8, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	mov r5, sl
	movs r6, #0
	ldrsh r1, [r5, r6]
	adds r0, r0, r1
	adds r6, r4, #0
	adds r6, #0xae
	movs r2, #0
	ldrsh r1, [r6, r2]
	bl sub_8016468
	ldr r0, _08016704 @ =gUnknown_0814DDA8
	movs r1, #9
	bl sub_8016420
	bl Random
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #1
	ands r5, r0
	subs r3, r5, #2
	str r3, [sp, #0x10]
	bl Random
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r0, r4, #4
	str r0, [sp, #0x14]
	subs r5, #0xa
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r1, r5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r4, #0xc
	ldrh r2, [r6]
	adds r1, r2, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08016708 @ =gUnknown_03003856
	movs r2, #0
	ldrsh r3, [r3, r2]
	mov ip, r3
	mov r3, sb
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	movs r3, #8
	str r3, [sp, #8]
	movs r3, #0x14
	str r3, [sp, #0xc]
	mov r2, ip
	adds r3, r7, #0
	bl sub_801621C
	adds r3, r0, #0
	mov r0, r8
	ldrh r0, [r0]
	adds r5, r0, r5
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldrh r6, [r6]
	adds r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r6, #0
	ldrsh r2, [r1, r6]
	mov r0, sb
	str r0, [sp]
	str r3, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #0x15
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	b _08016782
	.align 2, 0
_08016704: .4byte gUnknown_0814DDA8
_08016708: .4byte gUnknown_03003856
_0801670C:
	movs r1, #0xaa
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08016794
	ldr r0, _0801678C @ =gUnknown_0814DDA8
	movs r1, #9
	bl sub_8016420
	adds r5, r4, #0
	adds r5, #0xac
	ldrh r0, [r5]
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, #0xae
	ldrh r1, [r4]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08016790 @ =gUnknown_03003856
	movs r6, #0
	ldrsh r2, [r3, r6]
	mov r3, r8
	movs r6, #0
	ldrsh r3, [r3, r6]
	subs r2, r2, r3
	mov r3, sb
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	movs r3, #8
	str r3, [sp, #8]
	movs r3, #0x14
	str r3, [sp, #0xc]
	adds r3, r7, #0
	bl sub_801621C
	adds r3, r0, #0
	ldrh r0, [r5]
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _08016790 @ =gUnknown_03003856
	movs r5, #0
	ldrsh r2, [r4, r5]
	mov r6, sb
	str r6, [sp]
	str r3, [sp, #4]
	movs r3, #9
	str r3, [sp, #8]
	movs r3, #0x15
	str r3, [sp, #0xc]
_08016782:
	adds r3, r7, #0
	bl sub_801621C
	b _080167D0
	.align 2, 0
_0801678C: .4byte gUnknown_0814DDA8
_08016790: .4byte gUnknown_03003856
_08016794:
	ldr r0, _080167FC @ =gUnknown_0814DDA8
	movs r1, #9
	bl sub_8016420
	adds r0, r4, #0
	adds r0, #0xac
	ldrh r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0xae
	ldrh r1, [r1]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08016800 @ =gUnknown_03003856
	movs r4, #0
	ldrsh r2, [r3, r4]
	mov r5, sb
	str r5, [sp]
	movs r3, #0
	str r3, [sp, #4]
	movs r3, #8
	str r3, [sp, #8]
	movs r3, #0x14
	str r3, [sp, #0xc]
	adds r3, r7, #0
	bl sub_801621C
_080167D0:
	ldr r1, _08016804 @ =gMain
	adds r0, r1, #0
	adds r0, #0xac
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, #0xae
	movs r3, #0
	ldrsh r1, [r1, r3]
	ldr r4, [sp, #0x14]
	adds r1, r1, r4
	bl sub_80160E0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080167FC: .4byte gUnknown_0814DDA8
_08016800: .4byte gUnknown_03003856
_08016804: .4byte gMain

	thumb_func_start sub_8016808
sub_8016808: @ 0x08016808
	push {lr}
	ldr r1, _08016824 @ =gMain
	adds r0, r1, #0
	adds r0, #0xb2
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	ble _08016828
	adds r0, r1, #0
	adds r0, #0xa4
	strb r2, [r0]
	b _0801682E
	.align 2, 0
_08016824: .4byte gMain
_08016828:
	adds r1, #0xa4
	movs r0, #0
	strb r0, [r1]
_0801682E:
	ldr r2, _08016880 @ =gMain
	adds r3, r2, #0
	adds r3, #0xac
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _08016884 @ =0x0000011B
	cmp r1, r0
	ble _08016868
	adds r0, #1
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0xae
	movs r0, #0x14
	strh r0, [r1]
	subs r3, #0x13
	ldrb r1, [r3]
	cmp r1, #4
	bne _08016868
	ldr r0, _08016888 @ =gOamObjects
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #0x40
	strh r1, [r0]
	movs r0, #3
	strb r0, [r3]
	adds r0, r2, #0
	bl UpdateItemPlate
_08016868:
	ldr r2, _08016880 @ =gMain
	adds r1, r2, #0
	adds r1, #0xa5
	movs r0, #0
	strb r0, [r1]
	adds r1, #0xb
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08016880: .4byte gMain
_08016884: .4byte 0x0000011B
_08016888: .4byte gOamObjects

	thumb_func_start sub_801688C
sub_801688C: @ 0x0801688C
	push {lr}
	ldr r0, _080168C4 @ =gMain
	adds r1, r0, #0
	adds r1, #0xa6
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bgt _080168C0
	ldrb r1, [r0, #8]
	cmp r1, #3
	beq _080168AA
	cmp r1, #6
	beq _080168AA
	cmp r1, #5
	bne _080168C0
_080168AA:
	ldr r1, _080168C8 @ =gUnknown_080266E8
	adds r0, #0xc1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl ChangeScriptSection
	movs r0, #5
	bl sub_8016E74
_080168C0:
	pop {r0}
	bx r0
	.align 2, 0
_080168C4: .4byte gMain
_080168C8: .4byte gUnknown_080266E8

	thumb_func_start sub_80168CC
sub_80168CC: @ 0x080168CC
	push {r4, lr}
	ldr r0, _080168E4 @ =gMain
	adds r2, r0, #0
	adds r2, #0xa5
	ldrb r1, [r2]
	adds r4, r0, #0
	cmp r1, #0
	beq _080168E8
	cmp r1, #1
	beq _080168EC
	b _0801692C
	.align 2, 0
_080168E4: .4byte gMain
_080168E8:
	movs r0, #1
	strb r0, [r2]
_080168EC:
	adds r3, r4, #0
	adds r3, #0xac
	ldrh r2, [r3]
	subs r2, #4
	strh r2, [r3]
	ldr r0, [r4, #8]
	ldr r1, _08016914 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08016918 @ =0x00070A04
	cmp r0, r1
	bne _0801691C
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x54
	bgt _0801692C
	movs r0, #0x54
	strh r0, [r3]
	bl sub_8016808
	b _0801692C
	.align 2, 0
_08016914: .4byte 0x00FFFFFF
_08016918: .4byte 0x00070A04
_0801691C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9c
	bgt _0801692C
	movs r0, #0x9c
	strh r0, [r3]
	bl sub_8016808
_0801692C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8016934
sub_8016934: @ 0x08016934
	push {r4, lr}
	ldr r4, _08016948 @ =gMain
	adds r1, r4, #0
	adds r1, #0xa5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801694C
	cmp r0, #1
	beq _08016972
	b _080169A6
	.align 2, 0
_08016948: .4byte gMain
_0801694C:
	movs r0, #1
	strb r0, [r1]
	bl sub_8016D6C
	ldr r2, _080169AC @ =gOamObjects
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r2, r1
	subs r1, #0x40
	strh r1, [r0]
	movs r3, #0x92
	lsls r3, r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _080169B0 @ =gTestimony
	adds r0, r4, #0
	movs r2, #1
	bl sub_800B6EC
_08016972:
	ldr r2, _080169B4 @ =gMain
	adds r3, r2, #0
	adds r3, #0xac
	ldrh r1, [r3]
	adds r1, #4
	strh r1, [r3]
	adds r0, r2, #0
	adds r0, #0xa4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0801698C
	adds r0, r1, #4
	strh r0, [r3]
_0801698C:
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _080169B8 @ =0x0000011B
	cmp r1, r0
	ble _080169A6
	adds r0, #1
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0xae
	movs r0, #0x14
	strh r0, [r1]
	bl sub_8016808
_080169A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080169AC: .4byte gOamObjects
_080169B0: .4byte gTestimony
_080169B4: .4byte gMain
_080169B8: .4byte 0x0000011B

	thumb_func_start sub_80169BC
sub_80169BC: @ 0x080169BC
	push {r4, r5, r6, lr}
	ldr r4, _080169D8 @ =gMain
	adds r0, r4, #0
	adds r0, #0xa5
	ldrb r0, [r0]
	adds r5, r4, #0
	cmp r0, #1
	beq _08016A80
	cmp r0, #1
	bgt _080169DC
	cmp r0, #0
	beq _080169E4
	b _08016B62
	.align 2, 0
_080169D8: .4byte gMain
_080169DC:
	cmp r0, #2
	bne _080169E2
	b _08016B22
_080169E2:
	b _08016B62
_080169E4:
	adds r0, r4, #0
	adds r0, #0xaa
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080169F8
	movs r0, #0x9c
	bl PlaySE
	b _08016A02
_080169F8:
	cmp r0, #0
	ble _08016A02
	movs r0, #0x4c
	bl PlaySE
_08016A02:
	ldr r1, _08016A64 @ =gMain
	adds r3, r1, #0
	adds r3, #0xa6
	adds r2, r1, #0
	adds r2, #0xaa
	ldrh r4, [r3]
	ldrh r5, [r2]
	subs r0, r4, r5
	movs r4, #0
	strh r0, [r3]
	lsls r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #0
	bge _08016A20
	strh r4, [r3]
_08016A20:
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r0, #0x50
	ble _08016A2C
	movs r0, #0x50
	strh r0, [r3]
_08016A2C:
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r6, #0
	ldrsh r0, [r2, r6]
	str r0, [r1]
	strh r4, [r2]
	adds r1, r5, #0
	adds r1, #0xb8
	adds r2, r5, #0
	adds r2, #0xa8
	ldrh r4, [r2]
	lsls r0, r4, #0x10
	str r0, [r1]
	adds r4, r5, #0
	adds r4, #0xbc
	movs r6, #0
	ldrsh r0, [r3, r6]
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	str r0, [r4]
	cmp r0, #0
	bgt _08016A68
	movs r1, #0x28
	b _08016A6A
	.align 2, 0
_08016A64: .4byte gMain
_08016A68:
	movs r1, #0x64
_08016A6A:
	bl __divsi3
	str r0, [r4]
	ldr r1, _08016A7C @ =gTestimony
	movs r2, #0
	movs r0, #0x28
	strb r0, [r1, #4]
	strb r2, [r5, #0x18]
	b _08016B16
	.align 2, 0
_08016A7C: .4byte gTestimony
_08016A80:
	adds r2, r4, #0
	adds r2, #0xb8
	adds r1, r4, #0
	adds r1, #0xbc
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	asrs r2, r0, #0x10
	adds r3, r4, #0
	adds r3, #0xa8
	strh r2, [r3]
	cmp r1, #0
	bgt _08016AAC
	adds r0, r4, #0
	adds r0, #0xa6
	ldrh r1, [r0]
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r2, r0
	bge _08016ABC
	b _08016ABA
_08016AAC:
	adds r0, r4, #0
	adds r0, #0xa6
	ldrh r1, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r2, r0
	ble _08016ABC
_08016ABA:
	strh r1, [r3]
_08016ABC:
	ldr r3, _08016AF0 @ =gTestimony
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _08016AC8
	subs r0, #1
	strb r0, [r3, #4]
_08016AC8:
	adds r1, r5, #0
	adds r0, r1, #0
	adds r0, #0xa6
	adds r2, r1, #0
	adds r2, #0xa8
	ldrh r4, [r2]
	ldrh r0, [r0]
	cmp r0, r4
	bne _08016B62
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _08016AFA
	adds r0, r1, #0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	bgt _08016AF4
	adds r0, r4, #1
	strh r0, [r2]
	b _08016B62
	.align 2, 0
_08016AF0: .4byte gTestimony
_08016AF4:
	subs r0, r4, #1
	strh r0, [r2]
	b _08016B62
_08016AFA:
	bl sub_8016D48
	adds r4, r0, #0
	cmp r4, #0
	bne _08016B62
	movs r0, #0x4c
	bl StopSE
	movs r0, #0x9c
	bl StopSE
	adds r0, r5, #0
	adds r0, #0xb0
	strh r4, [r0]
_08016B16:
	adds r1, r5, #0
	adds r1, #0xa5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08016B62
_08016B22:
	adds r1, r4, #0
	adds r1, #0xb0
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _08016B36
	adds r0, r2, #1
	strh r0, [r1]
	b _08016B62
_08016B36:
	adds r2, r4, #0
	adds r2, #0xac
	ldrh r0, [r2]
	adds r0, #4
	strh r0, [r2]
	lsls r0, r0, #0x10
	ldr r1, _08016B68 @ =0x011B0000
	cmp r0, r1
	ble _08016B62
	movs r0, #0x8e
	lsls r0, r0, #1
	strh r0, [r2]
	bl sub_8016808
	movs r5, #0xa6
	lsls r5, r5, #2
	adds r0, r4, r5
	ldr r0, [r0]
	cmp r0, #0
	ble _08016B62
	movs r0, #1
	strb r0, [r4, #0x18]
_08016B62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016B68: .4byte 0x011B0000

	thumb_func_start sub_8016B6C
sub_8016B6C: @ 0x08016B6C
	ldr r3, _08016B84 @ =gMain
	adds r2, r3, #0
	adds r2, #0xa5
	ldrb r1, [r2]
	cmp r1, #0
	bne _08016B82
	movs r0, #1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0xb4
	strh r1, [r0]
_08016B82:
	bx lr
	.align 2, 0
_08016B84: .4byte gMain

	thumb_func_start sub_8016B88
sub_8016B88: @ 0x08016B88
	push {r4, lr}
	ldr r0, _08016B9C @ =gMain
	adds r1, r0, #0
	adds r1, #0xa5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08016BA0
	cmp r0, #1
	beq _08016BAE
	b _08016BEC
	.align 2, 0
_08016B9C: .4byte gMain
_08016BA0:
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	bl sub_8016E74
	bl sub_8016D6C
_08016BAE:
	ldr r2, _08016BC8 @ =gMain
	adds r3, r2, #0
	adds r3, #0xac
	ldrh r1, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, #0x50
	ble _08016BCC
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r3]
	b _08016BEC
	.align 2, 0
_08016BC8: .4byte gMain
_08016BCC:
	movs r0, #0x50
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0xae
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _08016BE2
	subs r0, r2, #4
	strh r0, [r1]
_08016BE2:
	ldr r0, [r3]
	cmp r0, #0x50
	bne _08016BEC
	bl sub_8016808
_08016BEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8016BF4
sub_8016BF4: @ 0x08016BF4
	push {lr}
	ldr r0, _08016C08 @ =gMain
	adds r1, r0, #0
	adds r1, #0xa5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08016C0C
	cmp r0, #1
	beq _08016C1A
	b _08016C34
	.align 2, 0
_08016C08: .4byte gMain
_08016C0C:
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	bl sub_8016E74
	bl sub_8016D6C
_08016C1A:
	ldr r0, _08016C2C @ =gMain
	adds r1, r0, #0
	adds r1, #0xae
	ldrh r0, [r1]
	cmp r0, #4
	beq _08016C30
	subs r0, #4
	strh r0, [r1]
	b _08016C34
	.align 2, 0
_08016C2C: .4byte gMain
_08016C30:
	bl sub_8016808
_08016C34:
	pop {r0}
	bx r0

	thumb_func_start sub_8016C38
sub_8016C38: @ 0x08016C38
	push {r4, lr}
	ldr r0, _08016C4C @ =gMain
	adds r1, r0, #0
	adds r1, #0xa5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08016C50
	cmp r0, #1
	beq _08016C5A
	b _08016CBE
	.align 2, 0
_08016C4C: .4byte gMain
_08016C50:
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	bl sub_8016E74
_08016C5A:
	ldr r3, _08016C74 @ =gMain
	adds r1, r3, #0
	adds r1, #0xac
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #8
	cmp r0, #0x9b
	bgt _08016C78
	ldrh r0, [r1]
	adds r0, #8
	strh r0, [r1]
	b _08016CBE
	.align 2, 0
_08016C74: .4byte gMain
_08016C78:
	movs r0, #0x9c
	strh r0, [r1]
	adds r1, r3, #0
	adds r1, #0xae
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0x14
	ble _08016C92
	adds r0, r2, #0
	subs r0, #8
	strh r0, [r1]
	b _08016CBE
_08016C92:
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r0, #4
	cmp r0, #0x13
	bgt _08016CA2
	adds r0, r2, #4
	strh r0, [r1]
	b _08016CBE
_08016CA2:
	movs r0, #0x14
	strh r0, [r1]
	ldr r1, _08016CC4 @ =gOamObjects+0x240
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	ldr r1, _08016CC8 @ =gTestimony
	adds r0, r3, #0
	movs r2, #1
	bl sub_800B6EC
	bl sub_8016808
_08016CBE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016CC4: .4byte gOamObjects+0x240
_08016CC8: .4byte gTestimony

	thumb_func_start ProcessHPBar
ProcessHPBar: @ 0x08016CCC
	push {lr}
	ldr r0, _08016CE4 @ =gMain
	adds r0, #0xa4
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08016D3E
	lsls r0, r0, #2
	ldr r1, _08016CE8 @ =_08016CEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016CE4: .4byte gMain
_08016CE8: .4byte _08016CEC
_08016CEC: @ jump table
	.4byte _08016D10 @ case 0
	.4byte _08016D16 @ case 1
	.4byte _08016D1C @ case 2
	.4byte _08016D1C @ case 3
	.4byte _08016D22 @ case 4
	.4byte _08016D28 @ case 5
	.4byte _08016D2E @ case 6
	.4byte _08016D34 @ case 7
	.4byte _08016D3A @ case 8
_08016D10:
	bl sub_801688C
	b _08016D3E
_08016D16:
	bl sub_80168CC
	b _08016D3E
_08016D1C:
	bl sub_8016934
	b _08016D3E
_08016D22:
	bl sub_80169BC
	b _08016D3E
_08016D28:
	bl sub_8016B6C
	b _08016D3E
_08016D2E:
	bl sub_8016B88
	b _08016D3E
_08016D34:
	bl sub_8016BF4
	b _08016D3E
_08016D3A:
	bl sub_8016C38
_08016D3E:
	bl sub_8016DA4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8016D48
sub_8016D48: @ 0x08016D48
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_08016D4E:
	adds r0, r4, #0
	adds r0, #0x6b
	bl FindAnimationFromAnimId
	cmp r0, #0
	beq _08016D5C
	adds r5, #1
_08016D5C:
	adds r4, #1
	cmp r4, #2
	ble _08016D4E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8016D6C
sub_8016D6C: @ 0x08016D6C
	push {r4, lr}
	ldr r1, _08016D9C @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	movs r3, #0x22
	cmp r0, #0
	bne _08016D7E
	movs r3, #0x3a
_08016D7E:
	ldr r1, _08016DA0 @ =gOamObjects
	movs r4, #0x80
	lsls r4, r4, #2
	movs r2, #0xd
	lsls r0, r3, #3
	adds r0, r0, r1
	adds r0, #0x68
_08016D8C:
	strh r4, [r0]
	subs r0, #8
	subs r2, #1
	cmp r2, #0
	bge _08016D8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016D9C: .4byte gScriptContext
_08016DA0: .4byte gOamObjects

	thumb_func_start sub_8016DA4
sub_8016DA4: @ 0x08016DA4
	push {r4, lr}
	bl sub_8016ED8
	cmp r0, #0
	beq _08016E1C
	bl sub_8016D6C
	ldr r4, _08016E24 @ =gMain
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #4
	bne _08016DC4
	adds r0, r4, #0
	bl UpdateItemPlate
_08016DC4:
	ldrh r0, [r4, #0x34]
	cmp r0, #0x81
	beq _08016E1C
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	bne _08016DD6
	ldrb r1, [r4, #9]
	cmp r1, #1
	bls _08016E14
_08016DD6:
	cmp r0, #7
	bne _08016DEE
	ldrb r0, [r4, #9]
	cmp r0, #7
	beq _08016DEE
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _08016E1C
	cmp r0, #4
	beq _08016E1C
	cmp r0, #5
	beq _08016E1C
_08016DEE:
	ldr r2, _08016E24 @ =gMain
	ldr r0, _08016E28 @ =0x00000507
	ldrh r1, [r2, #8]
	cmp r1, r0
	bne _08016E08
	ldrb r1, [r2, #0xa]
	subs r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08016E1C
	cmp r1, #6
	beq _08016E1C
_08016E08:
	ldrb r0, [r2, #8]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _08016E1C
_08016E14:
	bl LoadHPBarGraphics
	bl AnimateHPBar
_08016E1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016E24: .4byte gMain
_08016E28: .4byte 0x00000507

	thumb_func_start ResetHPBar
ResetHPBar: @ 0x08016E2C
	push {lr}
	ldr r3, _08016E58 @ =gMain
	adds r1, r3, #0
	adds r1, #0xac
	movs r2, #0
	movs r0, #0x8e
	lsls r0, r0, #1
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x14
	strh r0, [r1]
	adds r1, #6
	movs r0, #1
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xaa
	strh r2, [r0]
	movs r0, #0
	bl sub_8016E74
	pop {r0}
	bx r0
	.align 2, 0
_08016E58: .4byte gMain

	thumb_func_start ResetHPBarHealthToMax
ResetHPBarHealthToMax: @ 0x08016E5C
	ldr r2, _08016E70 @ =gMain
	adds r1, r2, #0
	adds r1, #0xb6
	movs r0, #0x50
	strh r0, [r1]
	subs r1, #0xe
	strh r0, [r1]
	subs r1, #2
	strh r0, [r1]
	bx lr
	.align 2, 0
_08016E70: .4byte gMain

	thumb_func_start sub_8016E74
sub_8016E74: @ 0x08016E74
	adds r3, r0, #0
	ldr r2, _08016EB0 @ =gMain
	cmp r3, #8
	bne _08016E8C
	adds r0, r2, #0
	adds r0, #0xa4
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08016EB8
_08016E8C:
	adds r1, r2, #0
	adds r1, #0xa5
	movs r0, #0
	strb r0, [r1]
	adds r1, #0xb
	strh r0, [r1]
	movs r1, #0xb2
	adds r1, r1, r2
	mov ip, r1
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0xa4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08016EB4
	strb r3, [r1]
	b _08016EB8
	.align 2, 0
_08016EB0: .4byte gMain
_08016EB4:
	mov r0, ip
	strh r3, [r0]
_08016EB8:
	bx lr
	.align 2, 0

	thumb_func_start IsHPBarAnimating
IsHPBarAnimating: @ 0x08016EBC
	ldr r0, _08016ED0 @ =gMain
	adds r0, #0xa4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016ECA
	cmp r0, #5
	bne _08016ED4
_08016ECA:
	movs r0, #0
	b _08016ED6
	.align 2, 0
_08016ED0: .4byte gMain
_08016ED4:
	movs r0, #1
_08016ED6:
	bx lr

	thumb_func_start sub_8016ED8
sub_8016ED8: @ 0x08016ED8
	ldr r2, _08016F08 @ =gMain
	adds r0, r2, #0
	adds r0, #0xac
	ldr r1, [r0]
	ldr r0, _08016F0C @ =0x0014011C
	cmp r1, r0
	beq _08016F04
	ldrb r0, [r2, #8]
	cmp r0, #7
	bne _08016EF8
	ldr r1, _08016F10 @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _08016F04
_08016EF8:
	adds r0, r2, #0
	adds r0, #0xb4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08016F14
_08016F04:
	movs r0, #0
	b _08016F16
	.align 2, 0
_08016F08: .4byte gMain
_08016F0C: .4byte 0x0014011C
_08016F10: .4byte gScriptContext
_08016F14:
	movs r0, #1
_08016F16:
	bx lr
