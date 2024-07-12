	.include "asm/macros.inc"
	.syntax unified


	thumb_func_start sub_8001F08
sub_8001F08: @ 0x08001F08
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08001F28 @ =0x00000C64
	adds r3, r1, r0
	ldr r0, _08001F2C @ =gJoypad
	movs r2, #0xf0
	ldrh r4, [r0]
	ands r2, r4
	adds r4, r0, #0
	cmp r2, #0
	beq _08001F30
	ldrb r0, [r1, #0x18]
	adds r0, #1
	strb r0, [r1, #0x18]
	b _08001F32
	.align 2, 0
_08001F28: .4byte 0x00000C64
_08001F2C: .4byte gJoypad
_08001F30:
	strh r2, [r1, #0x18]
_08001F32:
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	beq _08001F42
	movs r0, #1
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	b _08001F52
_08001F42:
	movs r0, #0x1f
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	cmp r0, #0x1f
	bne _08001F52
	movs r0, #1
	strb r0, [r1, #0x19]
_08001F52:
	ldrb r1, [r1, #0x18]
	cmp r1, #1
	bne _08001F92
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08001F68
	ldrh r0, [r3]
	subs r0, #1
	b _08001F90
_08001F68:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08001F76
	ldrh r0, [r3]
	adds r0, #1
	b _08001F90
_08001F76:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08001F84
	ldrh r0, [r3]
	subs r0, #0x10
	b _08001F90
_08001F84:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001F92
	ldrh r0, [r3]
	adds r0, #0x10
_08001F90:
	strh r0, [r3]
_08001F92:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8001F98
sub_8001F98: @ 0x08001F98
	ldr r1, _08001FAC @ =0x00000C64
	adds r2, r0, r1
	movs r1, #0
	strb r1, [r2, #2]
	strh r1, [r2]
	ldrb r1, [r0, #1]
	adds r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08001FAC: .4byte 0x00000C64

	thumb_func_start sub_8001FB0
sub_8001FB0: @ 0x08001FB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08002004 @ =0x00000C64
	adds r1, r1, r0
	mov sl, r1
	bl sub_8001F08
	mov r2, sl
	movs r0, #2
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	ldr r3, _08002008 @ =gUnknown_0814D804
	adds r0, r0, r3
	str r0, [sp]
	ldrh r2, [r2]
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r4, #0xe
	ldrsh r0, [r0, r4]
	cmp r1, r0
	blt _0800200C
	mov r5, sl
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	ldr r1, [sp]
	ldrh r1, [r1, #0xe]
	subs r0, r2, r1
	strh r0, [r5]
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #2
	blt _08002036
	movs r0, #0
	strb r0, [r5, #2]
	b _08002036
	.align 2, 0
_08002004: .4byte 0x00000C64
_08002008: .4byte gUnknown_0814D804
_0800200C:
	cmp r1, #0
	bge _08002036
	mov r2, sl
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002022
	movs r0, #1
	strb r0, [r2, #2]
_08002022:
	mov r4, sl
	movs r0, #2
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r3
	str r0, [sp]
	ldrh r5, [r4]
	ldrh r1, [r0, #0xe]
	adds r0, r5, r1
	strh r0, [r4]
_08002036:
	ldr r2, [sp]
	ldrh r0, [r2, #0xc]
	mov r3, sl
	movs r4, #0
	ldrsh r1, [r3, r4]
	bl sub_80065E8
	adds r3, r0, #0
	ldr r1, _0800213C @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08002068
	ldr r5, [sp]
	ldrh r0, [r5, #0xc]
	mov r2, sl
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r2, #0
	cmp r3, #0
	bne _08002064
	movs r2, #1
_08002064:
	bl sub_80065AC
_08002068:
	movs r0, #5
	movs r1, #0x19
	movs r2, #2
	movs r3, #8
	bl sub_8001610
	ldr r5, [sp]
	ldr r0, [r5]
	movs r1, #5
	movs r2, #6
	bl nullsub_20
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r5, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #5
	movs r2, #7
	bl nullsub_20
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	movs r1, #9
	movs r2, #6
	bl sub_8006470
	mov r5, sl
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _080020B0
	adds r0, #0x1f
_080020B0:
	asrs r0, r0, #5
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #0
	mov sb, r2
_080020BA:
	movs r3, #0
	mov r8, r3
	mov r4, sb
	lsls r4, r4, #4
	str r4, [sp, #0x10]
	mov r5, sb
	adds r5, #1
	str r5, [sp, #8]
_080020CA:
	movs r6, #0
	mov r0, r8
	lsls r7, r0, #2
	adds r0, #1
	str r0, [sp, #0xc]
_080020D4:
	movs r5, #0
	ldr r1, [sp]
	ldrh r0, [r1, #0xc]
	ldr r2, [sp, #0x10]
	adds r4, r2, r7
	adds r4, r4, r6
	ldr r3, [sp, #4]
	adds r1, r4, r3
	bl sub_80065E8
	adds r3, r0, #0
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [sp, #4]
	subs r0, r0, r1
	cmp r0, r4
	bne _08002102
	subs r5, #1
	mov r2, sb
	cmp r2, #0
	beq _08002102
	movs r5, #1
_08002102:
	mov r4, r8
	adds r1, r7, r4
	adds r1, r1, r6
	adds r1, #5
	adds r2, r5, #3
	add r2, sb
	adds r0, r3, #0
	bl sub_8006470
	adds r6, #1
	cmp r6, #3
	ble _080020D4
	ldr r5, [sp, #0xc]
	mov r8, r5
	cmp r5, #3
	ble _080020CA
	ldr r0, [sp, #8]
	mov sb, r0
	cmp r0, #1
	ble _080020BA
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800213C: .4byte gJoypad

	thumb_func_start sub_8002140
sub_8002140: @ 0x08002140
	ldr r1, _08002148 @ =gMain
	movs r0, #3
	strb r0, [r1, #9]
	bx lr
	.align 2, 0
_08002148: .4byte gMain

	thumb_func_start sub_800214C
sub_800214C: @ 0x0800214C
	push {lr}
	adds r2, r0, #0
	ldr r1, _08002174 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08002160
	movs r0, #2
	strb r0, [r2, #1]
_08002160:
	ldr r0, _08002178 @ =gUnknown_0814D824
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08002174: .4byte gJoypad
_08002178: .4byte gUnknown_0814D824

	thumb_func_start sub_800217C
sub_800217C: @ 0x0800217C
	ldr r1, _08002190 @ =0x00000C64
	adds r2, r0, r1
	ldr r1, _08002194 @ =gMain
	adds r1, #0xc1
	ldrb r1, [r1]
	strb r1, [r2]
	ldrb r1, [r0, #1]
	adds r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_08002190: .4byte 0x00000C64
_08002194: .4byte gMain

	thumb_func_start sub_8002198
sub_8002198: @ 0x08002198
	push {r4, r5, lr}
	ldr r1, _080021C4 @ =0x00000C64
	adds r4, r0, r1
	ldr r5, _080021C8 @ =gMain
	ldr r1, _080021CC @ =gJoypad
	ldrh r2, [r1, #2]
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080021D0
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _080021E8
	movs r0, #0x15
	strb r0, [r4]
	b _080021E8
	.align 2, 0
_080021C4: .4byte 0x00000C64
_080021C8: .4byte gMain
_080021CC: .4byte gJoypad
_080021D0:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080021E8
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x15
	ble _080021E8
	strb r3, [r4]
_080021E8:
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08002210
	bl ResetGameState
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0xc1
	strb r0, [r1]
	ldr r0, _0800220C @ =gUnknown_080266D0
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [r5, #8]
	b _0800222E
	.align 2, 0
_0800220C: .4byte gUnknown_080266D0
_08002210:
	ldr r0, _08002234 @ =gUnknown_08023B80
	movs r1, #5
	movs r2, #3
	bl nullsub_20
	ldr r1, _08002238 @ =gUnknown_0814D830
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #5
	movs r2, #5
	bl nullsub_20
_0800222E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002234: .4byte gUnknown_08023B80
_08002238: .4byte gUnknown_0814D830

	thumb_func_start sub_800223C
sub_800223C: @ 0x0800223C
	ldr r1, _08002244 @ =gMain
	movs r0, #3
	strb r0, [r1, #9]
	bx lr
	.align 2, 0
_08002244: .4byte gMain

	thumb_func_start sub_8002248
sub_8002248: @ 0x08002248
	push {lr}
	adds r2, r0, #0
	ldr r1, _08002270 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800225C
	movs r0, #2
	strb r0, [r2, #1]
_0800225C:
	ldr r0, _08002274 @ =gUnknown_0814D888
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08002270: .4byte gJoypad
_08002274: .4byte gUnknown_0814D888

	thumb_func_start sub_8002278
sub_8002278: @ 0x08002278
	lsls r0, r0, #0x10
	ldr r1, _08002288 @ =gUnknown_08023B98
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x28
	bx lr
	.align 2, 0
_08002288: .4byte gUnknown_08023B98

	thumb_func_start sub_800228C
sub_800228C: @ 0x0800228C
	lsls r0, r0, #0x10
	ldr r1, _0800229C @ =gUnknown_08023B98
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800229C: .4byte gUnknown_08023B98

	thumb_func_start sub_80022A0
sub_80022A0: @ 0x080022A0
	push {r4, r5, lr}
	ldr r2, _080022C8 @ =gBG1MapBuffer
	movs r1, #0
	ldr r4, _080022CC @ =0x000003FF
	ldr r5, _080022D0 @ =gMain
	ldr r3, _080022D4 @ =gUnknown_08023EF8
_080022AC:
	adds r0, r1, r3
	ldrb r0, [r0]
	strh r0, [r2]
	adds r1, #1
	adds r2, #2
	cmp r1, r4
	bls _080022AC
	movs r0, #2
	ldrb r1, [r5, #0x1a]
	orrs r0, r1
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080022C8: .4byte gBG1MapBuffer
_080022CC: .4byte 0x000003FF
_080022D0: .4byte gMain
_080022D4: .4byte gUnknown_08023EF8
