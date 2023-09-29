	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_800156C
sub_800156C: @ 0x0800156C
	push {lr}
	ldr r0, _0800159C @ =gUnknown_08022DC4
	movs r1, #0x1a
	movs r2, #0
	bl nullsub_20
	ldr r0, _080015A0 @ =0x04000006
	ldrb r0, [r0]
	movs r1, #0x1b
	movs r2, #0
	bl sub_8006470
	ldr r0, _080015A4 @ =gMain
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080015AC
	ldr r0, _080015A8 @ =gUnknown_08022DCC
	movs r1, #6
	movs r2, #0
	bl nullsub_20
	b _080015B6
	.align 2, 0
_0800159C: .4byte gUnknown_08022DC4
_080015A0: .4byte 0x04000006
_080015A4: .4byte gMain
_080015A8: .4byte gUnknown_08022DCC
_080015AC:
	ldr r0, _080015C4 @ =gUnknown_08022DD0
	movs r1, #6
	movs r2, #0
	bl nullsub_20
_080015B6:
	ldr r0, _080015C8 @ =gUnknown_08022DD4
	movs r1, #0xb
	movs r2, #0
	bl nullsub_20
	pop {r0}
	bx r0
	.align 2, 0
_080015C4: .4byte gUnknown_08022DD0
_080015C8: .4byte gUnknown_08022DD4

	thumb_func_start sub_80015CC
sub_80015CC: @ 0x080015CC
	ldr r1, _080015E0 @ =gOamObjects
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080015E4 @ =0x04000006
	ldrb r0, [r0]
	adds r0, #8
	strh r0, [r1, #2]
	movs r0, #0xfe
	strh r0, [r1, #4]
	bx lr
	.align 2, 0
_080015E0: .4byte gOamObjects
_080015E4: .4byte 0x04000006

	thumb_func_start sub_80015E8
sub_80015E8: @ 0x080015E8
	ldr r0, _08001604 @ =gMain
	movs r1, #0
	strb r1, [r0, #0x19]
	ldr r0, _08001608 @ =gUnknown_03002080
	movs r2, #0
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
_080015F8:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #0xff
	bls _080015F8
	bx lr
	.align 2, 0
_08001604: .4byte gMain
_08001608: .4byte gUnknown_03002080

	thumb_func_start nullsub_10
nullsub_10: @ 0x0800160C
	bx lr
	.align 2, 0

	thumb_func_start sub_8001610
sub_8001610: @ 0x08001610
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r8
	bgt _0800164E
_08001630:
	mov r4, sb
	adds r6, r5, #1
	cmp r4, r7
	bgt _08001648
_08001638:
	ldr r0, _0800165C @ =gUnknown_08022DDC
	adds r1, r5, #0
	adds r2, r4, #0
	bl nullsub_20
	adds r4, #1
	cmp r4, r7
	ble _08001638
_08001648:
	adds r5, r6, #0
	cmp r5, r8
	ble _08001630
_0800164E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800165C: .4byte gUnknown_08022DDC

	thumb_func_start sub_8001660
sub_8001660: @ 0x08001660
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r6, _08001724 @ =gIORegisters
	ldr r7, _08001728 @ =gMain
	movs r0, #0
	strb r0, [r5, #3]
	strb r0, [r5, #2]
	strb r0, [r5, #1]
	strb r0, [r5]
	movs r0, #1
	strb r0, [r7, #9]
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r3, #0
	strh r0, [r5, #8]
	ldrh r0, [r6, #0x38]
	strh r0, [r5, #0xa]
	ldrh r0, [r6, #0x3c]
	strh r0, [r5, #0xc]
	adds r0, r6, #0
	adds r0, #0x40
	ldrh r0, [r0]
	strh r0, [r5, #0xe]
	adds r0, r6, #0
	adds r0, #0x42
	ldrh r0, [r0]
	strh r0, [r5, #0x10]
	ldrh r0, [r6, #0x14]
	strh r0, [r5, #0x14]
	ldrh r0, [r6, #0x16]
	strh r0, [r5, #0x16]
	ldr r1, _0800172C @ =0x040000D4
	ldr r2, _08001730 @ =gOamObjects
	str r2, [r1]
	ldr r4, _08001734 @ =0x00000864
	adds r0, r5, r4
	str r0, [r1, #4]
	ldr r0, _08001738 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r1, [r7, #0x19]
	adds r0, r5, #0
	adds r0, #0x60
	strb r1, [r0]
	ldrb r0, [r7, #0x18]
	adds r1, r5, #0
	adds r1, #0x61
	strb r0, [r1]
	strb r3, [r7, #0x19]
	strb r3, [r7, #0x18]
	ldr r0, _0800173C @ =gUnknown_03000800
	mov r8, r0
	movs r1, #0x96
	lsls r1, r1, #1
	movs r3, #0xfe
	lsls r3, r3, #2
	adds r0, r2, r3
_080016D8:
	strh r1, [r0, #2]
	subs r0, #8
	cmp r0, r2
	bge _080016D8
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x1c
	mov r1, r8
	movs r2, #0x44
	bl memcpy
	mov r0, r8
	str r4, [r0, #8]
	ldr r1, _0800172C @ =0x040000D4
	ldr r0, _08001740 @ =gUnknown_03001080
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1, #4]
	ldr r0, _08001744 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #8
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x16]
	movs r3, #0x98
	lsls r3, r3, #2
	adds r2, r7, r3
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001724: .4byte gIORegisters
_08001728: .4byte gMain
_0800172C: .4byte 0x040000D4
_08001730: .4byte gOamObjects
_08001734: .4byte 0x00000864
_08001738: .4byte 0x80000200
_0800173C: .4byte gUnknown_03000800
_08001740: .4byte gUnknown_03001080
_08001744: .4byte 0x80000400

	thumb_func_start sub_8001748
sub_8001748: @ 0x08001748
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080017C0 @ =gUnknown_08022DE0
	movs r1, #0xa
	movs r2, #3
	bl nullsub_20
	ldr r0, _080017C4 @ =gUnknown_08022DEC
	movs r1, #9
	movs r2, #5
	bl nullsub_20
	ldr r0, _080017C8 @ =gUnknown_08022DF8
	movs r1, #9
	movs r2, #6
	bl nullsub_20
	ldr r0, _080017CC @ =gUnknown_08022E04
	movs r1, #9
	movs r2, #7
	bl nullsub_20
	ldr r0, _080017D0 @ =gUnknown_08022E10
	movs r1, #9
	movs r2, #8
	bl nullsub_20
	ldr r0, _080017D4 @ =gUnknown_08022E1C
	movs r1, #9
	movs r2, #9
	bl nullsub_20
	ldr r0, _080017D8 @ =gUnknown_08022E28
	movs r1, #9
	movs r2, #0xa
	bl nullsub_20
	ldr r0, _080017DC @ =gUnknown_08022E34
	movs r1, #9
	movs r2, #0xb
	bl nullsub_20
	ldr r0, _080017E0 @ =gUnknown_08022E3C
	ldrb r2, [r4]
	adds r2, #5
	movs r1, #9
	bl nullsub_20
	ldr r1, _080017E4 @ =gJoypad
	movs r0, #0x40
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _080017E8
	ldrb r0, [r4]
	cmp r0, #0
	beq _080017E8
	subs r0, #1
	strb r0, [r4]
	b _08001824
	.align 2, 0
_080017C0: .4byte gUnknown_08022DE0
_080017C4: .4byte gUnknown_08022DEC
_080017C8: .4byte gUnknown_08022DF8
_080017CC: .4byte gUnknown_08022E04
_080017D0: .4byte gUnknown_08022E10
_080017D4: .4byte gUnknown_08022E1C
_080017D8: .4byte gUnknown_08022E28
_080017DC: .4byte gUnknown_08022E34
_080017E0: .4byte gUnknown_08022E3C
_080017E4: .4byte gJoypad
_080017E8:
	ldr r1, _08001804 @ =gJoypad
	movs r0, #0x80
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08001808
	ldrb r2, [r4]
	movs r0, #6
	cmp r2, r0
	bge _08001808
	adds r0, r2, #1
	strb r0, [r4]
	b _08001824
	.align 2, 0
_08001804: .4byte gJoypad
_08001808:
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08001824
	ldr r1, _0800182C @ =gMain
	movs r0, #2
	strb r0, [r1, #9]
	movs r0, #0
	movs r1, #0x1d
	movs r2, #0
	movs r3, #0x13
	bl sub_8001610
_08001824:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800182C: .4byte gMain

	thumb_func_start sub_8001830
sub_8001830: @ 0x08001830
	push {lr}
	ldr r2, _08001844 @ =gUnknown_0814D348
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08001844: .4byte gUnknown_0814D348

	thumb_func_start sub_8001848
sub_8001848: @ 0x08001848
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080018D0 @ =gMain
	ldr r2, _080018D4 @ =gIORegisters
	ldr r4, _080018D8 @ =0x040000D4
	adds r0, #0x64
	str r0, [r4]
	ldr r0, _080018DC @ =gUnknown_03001080
	str r0, [r4, #4]
	ldr r0, _080018E0 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldrh r0, [r6, #8]
	adds r1, r2, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r6, #0xa]
	strh r0, [r2, #0x38]
	ldrh r0, [r6, #0xc]
	strh r0, [r2, #0x3c]
	ldrh r1, [r6, #0xe]
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	ldrh r0, [r6, #0x10]
	adds r1, r2, #0
	adds r1, #0x42
	strh r0, [r1]
	ldrh r0, [r6, #0x14]
	strh r0, [r2, #0x14]
	ldrh r0, [r6, #0x16]
	strh r0, [r2, #0x16]
	ldr r0, _080018E4 @ =gUnknown_03000800
	adds r1, r6, #0
	adds r1, #0x1c
	movs r2, #0x44
	bl memcpy
	bl sub_8012F44
	ldr r1, _080018E8 @ =0x00000864
	adds r0, r6, r1
	str r0, [r4]
	ldr r0, _080018EC @ =gOamObjects
	str r0, [r4, #4]
	ldr r0, _080018F0 @ =0x80000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0
	movs r1, #0x1d
	movs r2, #0
	movs r3, #0x13
	bl sub_8001610
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r5, #0x19]
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	strb r0, [r5, #0x18]
	ldr r0, _080018F4 @ =gUnknown_03006024
	ldr r0, [r0]
	str r0, [r5, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080018D0: .4byte gMain
_080018D4: .4byte gIORegisters
_080018D8: .4byte 0x040000D4
_080018DC: .4byte gUnknown_03001080
_080018E0: .4byte 0x80000400
_080018E4: .4byte gUnknown_03000800
_080018E8: .4byte 0x00000864
_080018EC: .4byte gOamObjects
_080018F0: .4byte 0x80000200
_080018F4: .4byte gUnknown_03006024

	thumb_func_start sub_80018F8
sub_80018F8: @ 0x080018F8
	push {lr}
	ldr r2, _08001910 @ =gUnknown_0814D364
	ldrb r0, [r0, #9]
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r0, _08001914 @ =gUnknown_03006020
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08001910: .4byte gUnknown_0814D364
_08001914: .4byte gUnknown_03006020

	thumb_func_start sub_8001918
sub_8001918: @ 0x08001918
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r2, _080019A0 @ =gIORegisters
	ldr r0, _080019A4 @ =0x00000C64
	adds r4, r6, r0
	adds r1, r2, #0
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	movs r5, #0
	movs r3, #0
	mov r8, r3
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _080019A8 @ =0x00001090
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x38]
	subs r1, #0xa
	movs r0, #0x11
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	ldrh r1, [r2, #6]
	strh r1, [r4, #8]
	ldr r0, _080019AC @ =0x0000FF73
	ands r0, r1
	strh r0, [r2, #6]
	ldr r0, _080019B0 @ =gUnknown_08022E40
	movs r1, #0x14
	movs r2, #3
	bl nullsub_20
	ldr r0, _080019B4 @ =gUnknown_08022E4C
	movs r1, #0x14
	movs r2, #4
	bl nullsub_20
	ldr r0, _080019B8 @ =gUnknown_08022E58
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	ldr r0, _080019BC @ =gUnknown_08022E64
	movs r1, #0x14
	movs r2, #6
	bl nullsub_20
	mov r0, r8
	strh r0, [r4]
	strh r0, [r4, #2]
	strb r5, [r4, #4]
	strb r5, [r4, #5]
	strb r5, [r4, #6]
	movs r0, #4
	strb r0, [r4, #7]
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r6, #1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080019A0: .4byte gIORegisters
_080019A4: .4byte 0x00000C64
_080019A8: .4byte 0x00001090
_080019AC: .4byte 0x0000FF73
_080019B0: .4byte gUnknown_08022E40
_080019B4: .4byte gUnknown_08022E4C
_080019B8: .4byte gUnknown_08022E58
_080019BC: .4byte gUnknown_08022E64

	thumb_func_start sub_80019C0
sub_80019C0: @ 0x080019C0
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r4, r0, #0
	ldr r1, _080019E8 @ =gUnknown_08022E6B
	mov r0, sp
	movs r2, #0x33
	bl memcpy
	ldr r0, _080019EC @ =0x00000C64
	adds r6, r4, r0
	ldr r0, _080019F0 @ =gJoypad
	movs r1, #0xf0
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080019F4
	ldrb r0, [r4, #0x18]
	adds r0, #1
	strb r0, [r4, #0x18]
	b _080019F6
	.align 2, 0
_080019E8: .4byte gUnknown_08022E6B
_080019EC: .4byte 0x00000C64
_080019F0: .4byte gJoypad
_080019F4:
	strh r1, [r4, #0x18]
_080019F6:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _08001A06
	movs r0, #1
	ldrb r1, [r4, #0x18]
	ands r0, r1
	strb r0, [r4, #0x18]
	b _08001A16
_08001A06:
	movs r0, #0x1f
	ldrb r1, [r4, #0x18]
	ands r0, r1
	strb r0, [r4, #0x18]
	cmp r0, #0x1f
	bne _08001A16
	movs r0, #1
	strb r0, [r4, #0x19]
_08001A16:
	ldrb r4, [r4, #0x18]
	cmp r4, #1
	bne _08001A70
	ldr r0, _08001A34 @ =gJoypad
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08001A38
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _08001A70
	subs r0, #1
	strh r0, [r6, #2]
	b _08001A70
	.align 2, 0
_08001A34: .4byte gJoypad
_08001A38:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001A4C
	ldrh r0, [r6, #2]
	cmp r0, #0xf
	bhi _08001A70
	adds r0, #1
	strh r0, [r6, #2]
	b _08001A70
_08001A4C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08001A5E
	ldrh r0, [r6]
	cmp r0, #0
	beq _08001A70
	subs r0, #1
	b _08001A6E
_08001A5E:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08001A70
	ldrh r0, [r6]
	cmp r0, #0xf
	bhi _08001A70
	adds r0, #1
_08001A6E:
	strh r0, [r6]
_08001A70:
	movs r5, #0
_08001A72:
	ldrh r0, [r6]
	adds r1, r0, r5
	cmp r1, #0x10
	bgt _08001A8A
	lsls r0, r1, #1
	adds r0, r0, r1
	add r0, sp
	adds r1, r5, #2
	movs r2, #1
	bl nullsub_20
	b _08001A9A
_08001A8A:
	lsls r0, r1, #1
	adds r0, r0, r1
	subs r0, #0x30
	add r0, sp
	adds r1, r5, #2
	movs r2, #1
	bl nullsub_20
_08001A9A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001A72
	ldrh r1, [r6]
	cmp r1, #0x10
	bne _08001ABC
	ldr r0, _08001AB8 @ =gUnknown_08022EA0
	movs r1, #1
	movs r2, #1
	bl nullsub_20
	b _08001AC6
	.align 2, 0
_08001AB8: .4byte gUnknown_08022EA0
_08001ABC:
	ldr r0, _08001AF0 @ =gUnknown_08022DDC
	movs r1, #1
	movs r2, #1
	bl nullsub_20
_08001AC6:
	movs r5, #0
_08001AC8:
	ldrh r1, [r6, #2]
	adds r0, r1, r5
	cmp r0, #0xf
	bgt _08001AF4
	adds r4, r5, #2
	ldr r0, _08001AF0 @ =gUnknown_08022DDC
	movs r1, #0
	adds r2, r4, #0
	bl nullsub_20
	ldrh r0, [r6, #2]
	adds r1, r0, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	add r0, sp
	movs r1, #1
	adds r2, r4, #0
	bl nullsub_20
	b _08001B14
	.align 2, 0
_08001AF0: .4byte gUnknown_08022DDC
_08001AF4:
	adds r4, r5, #2
	ldr r0, _08001B28 @ =gUnknown_08022EA0
	movs r1, #0
	adds r2, r4, #0
	bl nullsub_20
	ldrh r0, [r6, #2]
	adds r1, r0, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	subs r0, #0x30
	add r0, sp
	movs r1, #1
	adds r2, r4, #0
	bl nullsub_20
_08001B14:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001AC8
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001B28: .4byte gUnknown_08022EA0

	thumb_func_start sub_8001B2C
sub_8001B2C: @ 0x08001B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08001BB0 @ =0x00000C64
	adds r4, r0, r1
	ldrb r7, [r4, #7]
	cmp r7, #4
	bne _08001B42
	bl sub_80019C0
_08001B42:
	movs r6, #0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _08001B4C
	strh r6, [r4, #2]
_08001B4C:
	movs r5, #0
	ldr r0, _08001BB4 @ =gOamObjects
	mov r8, r0
_08001B52:
	movs r3, #0
	lsls r1, r5, #3
	mov sb, r1
	adds r7, r5, #1
	mov ip, r7
_08001B5C:
	lsls r2, r6, #3
	add r2, r8
	ldrb r1, [r4, #5]
	lsls r0, r1, #0xd
	ldr r7, _08001BB8 @ =0x00004010
	adds r0, r0, r7
	add r0, sb
	strh r0, [r2]
	lsls r0, r3, #4
	adds r0, #0x10
	strh r0, [r2, #2]
	ldrb r0, [r4, #4]
	lsls r1, r0, #0xc
	lsls r0, r3, #1
	ldrh r7, [r4]
	adds r0, r7, r0
	adds r1, r1, r0
	ldrh r7, [r4, #2]
	adds r0, r7, r5
	lsls r0, r0, #5
	adds r1, r1, r0
	strh r1, [r2, #4]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08001B5C
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001B52
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BB0: .4byte 0x00000C64
_08001BB4: .4byte gOamObjects
_08001BB8: .4byte 0x00004010

	thumb_func_start sub_8001BBC
sub_8001BBC: @ 0x08001BBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08001C1C @ =0x00000C64
	adds r4, r0, r1
	ldrb r7, [r4, #7]
	cmp r7, #4
	bne _08001BD0
	bl sub_80019C0
_08001BD0:
	movs r5, #0
	ldr r0, _08001C20 @ =gUnknown_03001080
	mov ip, r0
_08001BD6:
	movs r3, #0
	adds r0, r5, #2
	adds r1, r5, #1
	mov r8, r1
	lsls r6, r0, #5
_08001BE0:
	adds r2, r3, r6
	adds r2, #0x23
	lsls r2, r2, #1
	add r2, ip
	ldrh r7, [r4, #2]
	adds r0, r7, r5
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrh r1, [r4]
	adds r0, r1, r0
	ldrb r7, [r4, #4]
	lsls r1, r7, #0xc
	adds r0, r0, r1
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08001BE0
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08001BD6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001C1C: .4byte 0x00000C64
_08001C20: .4byte gUnknown_03001080

	thumb_func_start sub_8001C24
sub_8001C24: @ 0x08001C24
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _08001C54 @ =gIORegisters
	ldr r0, _08001C58 @ =0x00000C64
	adds r5, r6, r0
	movs r4, #0
_08001C30:
	adds r2, r4, #3
	ldr r0, _08001C5C @ =gUnknown_08022EA4
	movs r1, #0x12
	bl nullsub_20
	adds r4, #1
	cmp r4, #3
	ble _08001C30
	ldr r0, _08001C60 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08001C64
	movs r0, #4
	strb r0, [r5, #7]
	b _08001E52
	.align 2, 0
_08001C54: .4byte gIORegisters
_08001C58: .4byte 0x00000C64
_08001C5C: .4byte gUnknown_08022EA4
_08001C60: .4byte gJoypad
_08001C64:
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08001C82
	ldrb r0, [r5, #7]
	subs r0, #1
	strb r0, [r5, #7]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08001C9A
	movs r0, #3
	strb r0, [r5, #7]
	b _08001C9A
_08001C82:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001C9A
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08001C9A
	strb r2, [r5, #7]
_08001C9A:
	ldr r0, _08001CBC @ =gUnknown_08022EA8
	movs r2, #7
	ldrsb r2, [r5, r2]
	adds r2, #3
	movs r1, #0x12
	bl nullsub_20
	movs r3, #7
	ldrsb r3, [r5, r3]
	cmp r3, #1
	beq _08001D14
	cmp r3, #1
	bgt _08001CC0
	cmp r3, #0
	beq _08001CCC
	b _08001E52
	.align 2, 0
_08001CBC: .4byte gUnknown_08022EA8
_08001CC0:
	cmp r3, #2
	beq _08001D90
	cmp r3, #3
	bne _08001CCA
	b _08001DEC
_08001CCA:
	b _08001E52
_08001CCC:
	ldr r1, _08001CF0 @ =gJoypad
	movs r0, #0x30
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08001CDA
	b _08001E52
_08001CDA:
	ldrb r1, [r6, #1]
	cmp r1, #2
	bne _08001CF8
	movs r0, #1
	strb r0, [r6, #1]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #0x11
	strh r0, [r1]
	ldr r0, _08001CF4 @ =gUnknown_08022E40
	b _08001D06
	.align 2, 0
_08001CF0: .4byte gJoypad
_08001CF4: .4byte gUnknown_08022E40
_08001CF8:
	movs r0, #2
	strb r0, [r6, #1]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08001D10 @ =gUnknown_08022EAC
_08001D06:
	movs r1, #0x14
	movs r2, #3
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001D10: .4byte gUnknown_08022EAC
_08001D14:
	ldr r1, _08001D40 @ =gJoypad
	movs r0, #0x30
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08001D22
	b _08001E52
_08001D22:
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _08001D4C
	ldr r0, _08001D44 @ =0x0000FF7F
	ldrh r2, [r7, #6]
	ands r0, r2
	movs r1, #0
	strh r0, [r7, #6]
	strb r1, [r5, #5]
	ldr r0, _08001D48 @ =gUnknown_08022EB8
	movs r1, #0x14
	movs r2, #4
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001D40: .4byte gJoypad
_08001D44: .4byte 0x0000FF7F
_08001D48: .4byte gUnknown_08022EB8
_08001D4C:
	movs r0, #0x80
	movs r2, #0
	ldrh r1, [r7, #6]
	orrs r0, r1
	ldr r1, _08001D80 @ =0x0000FFF3
	ands r0, r1
	strh r0, [r7, #6]
	strb r2, [r5, #6]
	strb r3, [r5, #5]
	ldr r0, _08001D84 @ =gUnknown_08022EC0
	movs r1, #0x14
	movs r2, #4
	bl nullsub_20
	ldr r0, _08001D88 @ =gUnknown_08022EC8
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	ldr r0, _08001D8C @ =gUnknown_08022E64
	movs r1, #0x14
	movs r2, #6
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001D80: .4byte 0x0000FFF3
_08001D84: .4byte gUnknown_08022EC0
_08001D88: .4byte gUnknown_08022EC8
_08001D8C: .4byte gUnknown_08022E64
_08001D90:
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _08001DDC
	ldr r0, _08001DA8 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08001DAC
	ldrb r0, [r5, #4]
	subs r0, #1
	b _08001DB8
	.align 2, 0
_08001DA8: .4byte gJoypad
_08001DAC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08001DBA
	ldrb r0, [r5, #4]
	adds r0, #1
_08001DB8:
	strb r0, [r5, #4]
_08001DBA:
	movs r0, #0xf
	ldrb r2, [r5, #4]
	ands r0, r2
	strb r0, [r5, #4]
	ldr r0, _08001DD8 @ =gUnknown_08022ED0
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	ldrb r0, [r5, #4]
	movs r1, #0x14
	movs r2, #5
	bl sub_8006470
	b _08001E52
	.align 2, 0
_08001DD8: .4byte gUnknown_08022ED0
_08001DDC:
	ldr r0, _08001DE8 @ =gUnknown_08022EC8
	movs r1, #0x14
	movs r2, #5
	bl nullsub_20
	b _08001E52
	.align 2, 0
_08001DE8: .4byte gUnknown_08022EC8
_08001DEC:
	ldrb r6, [r6, #1]
	cmp r6, #2
	bne _08001E52
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _08001E52
	ldr r1, _08001E10 @ =gJoypad
	movs r0, #0x20
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08001E14
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _08001E14
	subs r0, #1
	b _08001E26
	.align 2, 0
_08001E10: .4byte gJoypad
_08001E14:
	movs r0, #0x10
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08001E28
	ldrb r0, [r5, #6]
	cmp r0, #1
	bhi _08001E28
	adds r0, #1
_08001E26:
	strb r0, [r5, #6]
_08001E28:
	ldr r0, _08001E58 @ =0x0000FFF3
	ldrh r1, [r7, #6]
	ands r0, r1
	ldrb r2, [r5, #6]
	lsls r1, r2, #2
	orrs r0, r1
	strh r0, [r7, #6]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08001E5C @ =gUnknown_08022ED8
	movs r1, #0x14
	movs r2, #6
	bl nullsub_20
	ldrb r0, [r5, #6]
	movs r1, #0x14
	movs r2, #6
	bl sub_8006470
_08001E52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001E58: .4byte 0x0000FFF3
_08001E5C: .4byte gUnknown_08022ED8

	thumb_func_start sub_8001E60
sub_8001E60: @ 0x08001E60
	push {r4, r5, lr}
	ldr r1, _08001EA0 @ =0x00000C64
	adds r0, r0, r1
	ldr r3, _08001EA4 @ =gIORegisters
	ldr r2, _08001EA8 @ =gMain
	movs r1, #3
	strb r1, [r2, #9]
	movs r1, #4
	strb r1, [r0, #7]
	ldrh r0, [r0, #8]
	strh r0, [r3, #6]
	movs r0, #0
	ldr r5, _08001EAC @ =gOamObjects
	movs r4, #0x96
	lsls r4, r4, #1
	movs r2, #0
_08001E80:
	adds r3, r0, #1
	movs r1, #7
	adds r0, r2, r5
_08001E86:
	strh r4, [r0, #2]
	adds r0, #8
	adds r2, #8
	subs r1, #1
	cmp r1, #0
	bge _08001E86
	adds r0, r3, #0
	cmp r0, #0xf
	ble _08001E80
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001EA0: .4byte 0x00000C64
_08001EA4: .4byte gIORegisters
_08001EA8: .4byte gMain
_08001EAC: .4byte gOamObjects

	thumb_func_start sub_8001EB0
sub_8001EB0: @ 0x08001EB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08001EE8 @ =0x00000C64
	adds r5, r4, r0
	ldr r6, _08001EEC @ =gJoypad
	movs r0, #8
	ldrh r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	beq _08001EC8
	movs r0, #3
	strb r0, [r4, #1]
_08001EC8:
	ldr r0, _08001EF0 @ =gUnknown_0814D374
	ldrb r2, [r4, #1]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r0, [r5, #7]
	cmp r0, #4
	beq _08001EF4
	adds r0, r4, #0
	bl sub_8001C24
	b _08001F02
	.align 2, 0
_08001EE8: .4byte 0x00000C64
_08001EEC: .4byte gJoypad
_08001EF0: .4byte gUnknown_0814D374
_08001EF4:
	movs r0, #1
	ldrh r6, [r6, #2]
	ands r0, r6
	cmp r0, #0
	beq _08001F02
	movs r0, #0
	strb r0, [r5, #7]
_08001F02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

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
	ldr r2, _080022C8 @ =gUnknown_03002080
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
_080022C8: .4byte gUnknown_03002080
_080022CC: .4byte 0x000003FF
_080022D0: .4byte gMain
_080022D4: .4byte gUnknown_08023EF8

	thumb_func_start InitBGs
InitBGs: @ 0x080022D8
	push {r4, r5, r6, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08002334 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08002338 @ =gUnknown_03002FA0
	str r0, [r1, #4]
	ldr r0, _0800233C @ =0x81000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08002340 @ =gUnknown_03002080
	movs r1, #0
	ldr r4, _08002344 @ =0x000003FF
	ldr r6, _08002348 @ =gUnknown_03000000
	ldr r5, _0800234C @ =gIORegisters
	ldr r3, _08002350 @ =gUnknown_08023EF8
_080022FE:
	adds r0, r1, r3
	ldrb r0, [r0]
	strh r0, [r2]
	adds r1, #1
	adds r2, #2
	cmp r1, r4
	bls _080022FE
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08002334 @ =0x040000D4
	str r1, [r0]
	str r6, [r0, #4]
	ldr r1, _0800233C @ =0x81000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r0, #0
	strh r0, [r5, #0x12]
	movs r0, #8
	strh r0, [r5, #0x10]
	bl sub_8002354
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002334: .4byte 0x040000D4
_08002338: .4byte gUnknown_03002FA0
_0800233C: .4byte 0x81000400
_08002340: .4byte gUnknown_03002080
_08002344: .4byte 0x000003FF
_08002348: .4byte gUnknown_03000000
_0800234C: .4byte gIORegisters
_08002350: .4byte gUnknown_08023EF8

	thumb_func_start sub_8002354
sub_8002354: @ 0x08002354
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _080023B4 @ =gMain
	movs r1, #0
	ldr r6, _080023B8 @ =gIORegisters
	adds r7, r0, #0
	adds r7, #0x40
	adds r0, #0x42
	mov ip, r0
	ldr r5, _080023BC @ =gUnknown_03001080
_08002368:
	movs r2, #0
	lsls r0, r1, #4
	adds r4, r1, #1
	subs r0, r0, r1
	lsls r3, r0, #1
	lsls r0, r1, #6
	adds r0, #0x42
	adds r1, r0, r5
_08002378:
	adds r0, r2, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x1d
	bls _08002378
	adds r1, r4, #0
	cmp r1, #0x13
	bls _08002368
	movs r1, #0
	movs r0, #8
	strh r0, [r6, #0x16]
	strh r0, [r6, #0x14]
	strh r1, [r7]
	mov r0, ip
	strh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _080023C0 @ =0x040000D4
	str r0, [r1]
	ldr r0, _080023C4 @ =0x0600DD80
	str r0, [r1, #4]
	ldr r0, _080023C8 @ =0x81000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080023B4: .4byte gMain
_080023B8: .4byte gIORegisters
_080023BC: .4byte gUnknown_03001080
_080023C0: .4byte 0x040000D4
_080023C4: .4byte 0x0600DD80
_080023C8: .4byte 0x81000020

	thumb_func_start sub_80023CC
sub_80023CC: @ 0x080023CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov ip, r0
	mov sl, r1
	mov r2, ip
	adds r2, #0x4e
	movs r0, #0x1e
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x4f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	ble _080023FA
	movs r0, #0
	strb r0, [r1]
_080023FA:
	movs r1, #0x80
	lsls r1, r1, #0x18
	movs r0, #8
	mov r8, r0
	mov r3, sl
	cmp r3, #0
	bge _0800240C
	movs r4, #4
	mov r8, r4
_0800240C:
	ldr r7, _08002440 @ =0x7FFFFFFF
	mov r0, sl
	ands r0, r7
	str r0, [sp, #4]
	mov r3, r8
	muls r3, r0, r3
	mov sl, r3
	mov r4, r8
	lsls r4, r4, #3
	str r4, [sp]
	mov r7, r8
	lsls r0, r7, #5
	subs r0, r0, r7
	lsls r0, r0, #3
	mov r8, r0
	ldr r0, [sp, #4]
	ands r1, r0
	cmp r1, #0
	beq _08002448
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #5
	ldr r1, _08002444 @ =gUnknown_0202CFC0
	adds r3, r0, r1
	b _08002452
	.align 2, 0
_08002440: .4byte 0x7FFFFFFF
_08002444: .4byte gUnknown_0202CFC0
_08002448:
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #6
	ldr r2, _080024F8 @ =gUnknown_0202CFC0
	adds r3, r0, r2
_08002452:
	movs r5, #1
	mov r4, ip
	adds r4, #0x4e
	str r4, [sp, #0x14]
	movs r7, #0x4f
	add r7, ip
	mov sb, r7
	ldr r0, [sp]
	lsrs r0, r0, #1
	str r0, [sp, #0x24]
	mov r1, ip
	adds r1, #0x3f
	str r1, [sp, #0x1c]
	mov r2, ip
	adds r2, #0x3e
	str r2, [sp, #0x18]
	subs r4, #4
	str r4, [sp, #0x10]
	mov r7, ip
	adds r7, #0x44
	str r7, [sp, #0xc]
	mov r0, ip
	adds r0, #0x40
	str r0, [sp, #0x20]
	ldr r2, _080024FC @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x24]
	orrs r1, r0
	str r1, [sp, #0x24]
	movs r4, #0
	ldr r6, _08002500 @ =gUnknown_03001080
	adds r6, #0x7e
	mov r7, sb
	str r7, [sp, #8]
_08002498:
	lsls r0, r5, #6
	ldr r1, _08002500 @ =gUnknown_03001080
	adds r0, r0, r1
	str r0, [r2]
	str r6, [r2, #4]
	ldr r7, _08002504 @ =0x80000001
	str r7, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, [sp, #8]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r7, [sp]
	adds r1, r0, #0
	muls r1, r7, r1
	ldr r7, _08002508 @ =0x06004000
	adds r0, r4, r7
	adds r0, r1, r0
	str r3, [r2]
	str r0, [r2, #4]
	ldr r0, [sp, #0x24]
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	add r3, sl
	add r4, r8
	adds r6, #0x40
	adds r5, #1
	cmp r5, #0x14
	bls _08002498
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	ble _080024E4
	movs r0, #0
	strb r0, [r1]
_080024E4:
	movs r0, #0xb4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	cmp r2, r0
	bne _0800250C
	movs r0, #0x2e
	ldr r3, [sp, #0x1c]
	strb r0, [r3]
	b _08002512
	.align 2, 0
_080024F8: .4byte gUnknown_0202CFC0
_080024FC: .4byte 0x040000D4
_08002500: .4byte gUnknown_03001080
_08002504: .4byte 0x80000001
_08002508: .4byte 0x06004000
_0800250C:
	movs r0, #1
	ldr r4, [sp, #0x1c]
	strb r0, [r4]
_08002512:
	ldr r7, [sp, #0x14]
	ldrb r0, [r7]
	adds r0, #1
	movs r3, #0
	strb r0, [r7]
	ldr r0, [sp, #0x18]
	strb r3, [r0]
	movs r0, #0x11
	rsbs r0, r0, #0
	ldr r1, [sp, #0x10]
	ldrh r1, [r1]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r4, [sp, #0xc]
	ldrh r2, [r4]
	movs r7, #0
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bge _08002548
	mov r1, ip
	adds r1, #0x4c
	ldrb r4, [r1]
	subs r0, r4, r2
	strb r0, [r1]
_08002548:
	ldr r7, [sp, #0xc]
	strh r3, [r7]
	ldr r0, [sp, #0x20]
	strh r3, [r0]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8002560
sub_8002560: @ 0x08002560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0800257E
	adds r0, #7
_0800257E:
	asrs r0, r0, #3
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r3, #8
	str r3, [sp, #0xc]
	ldr r6, [sp, #4]
	cmp r6, #0
	bge _08002592
	movs r0, #4
	str r0, [sp, #0xc]
_08002592:
	ldr r2, [sp, #4]
	str r2, [sp, #0x14]
	ldr r6, [sp, #0xc]
	adds r3, r2, #0
	muls r3, r6, r3
	str r3, [sp, #4]
	lsls r0, r6, #3
	str r0, [sp, #0x10]
	lsls r0, r6, #5
	subs r0, r0, r6
	lsls r0, r0, #3
	str r0, [sp, #0xc]
	str r1, [sp, #0x1c]
	ldr r1, [sp]
	adds r1, #0x4e
	mov sb, r1
	ldr r2, [sp]
	adds r2, #0x4f
	mov ip, r2
	ldr r3, [sp]
	adds r3, #0x3f
	str r3, [sp, #0x18]
	b _080025CA
_080025C0:
	ldr r6, [sp, #8]
	subs r6, #1
	str r6, [sp, #8]
	cmp r6, #0
	beq _080026A6
_080025CA:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _080025E4
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r2, _080025E0 @ =gUnknown_0202CFC0
	adds r5, r0, r2
	b _080025F0
	.align 2, 0
_080025E0: .4byte gUnknown_0202CFC0
_080025E4:
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	ldr r6, _080026D0 @ =gUnknown_0202CFC0
	adds r5, r0, r6
_080025F0:
	movs r7, #1
	ldr r0, [sp, #0x10]
	lsrs r0, r0, #1
	str r0, [sp, #0x20]
	ldr r1, _080026D4 @ =gUnknown_03001080
	mov r8, r1
	ldr r3, _080026D8 @ =0x040000D4
	ldr r2, _080026DC @ =0x8000001E
	mov sl, r2
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r6, [sp, #0x20]
	orrs r6, r0
	str r6, [sp, #0x20]
_0800260E:
	lsls r1, r7, #6
	mov r0, r8
	adds r2, r1, r0
	ldr r6, _080026E0 @ =gUnknown_03001880
	adds r0, r1, r6
	str r2, [r3]
	str r0, [r3, #4]
	mov r0, sl
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	mov r0, r8
	adds r0, #0x3c
	adds r0, r1, r0
	str r0, [r3]
	str r2, [r3, #4]
	ldr r0, _080026E4 @ =0x80000001
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	adds r2, r1, r6
	ldr r6, _080026E8 @ =gUnknown_03001082
	adds r0, r1, r6
	str r2, [r3]
	str r0, [r3, #4]
	mov r0, sl
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #0x10]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r6, _080026EC @ =0x06004000
	adds r0, r4, r6
	adds r2, r1, r0
	str r5, [r3]
	str r2, [r3, #4]
	ldr r0, [sp, #0x20]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #4]
	adds r5, r5, r1
	ldr r2, [sp, #0xc]
	adds r4, r4, r2
	adds r7, #1
	cmp r7, #0x14
	bls _0800260E
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0800267E
	movs r0, #0x1e
	strb r0, [r3]
_0800267E:
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002690
	movs r0, #0x3b
	strb r0, [r1]
_08002690:
	mov r6, sb
	movs r0, #0
	ldrsb r0, [r6, r0]
	ldr r1, [sp, #0x18]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080025C0
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl sub_80023CC
_080026A6:
	ldr r2, [sp, #0x1c]
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r1, #0
	cmp r1, #0
	bge _080026B4
	adds r0, r1, #7
_080026B4:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	ldr r6, [sp, #0x1c]
	strh r0, [r6]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080026D0: .4byte gUnknown_0202CFC0
_080026D4: .4byte gUnknown_03001080
_080026D8: .4byte 0x040000D4
_080026DC: .4byte 0x8000001E
_080026E0: .4byte gUnknown_03001880
_080026E4: .4byte 0x80000001
_080026E8: .4byte gUnknown_03001082
_080026EC: .4byte 0x06004000

	thumb_func_start sub_80026F0
sub_80026F0: @ 0x080026F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	adds r6, r1, #0
	movs r0, #8
	mov sb, r0
	cmp r6, #0
	bge _0800270C
	movs r1, #4
	mov sb, r1
_0800270C:
	ldr r0, _08002738 @ =0x7FFFFFFF
	ands r6, r0
	lsrs r2, r6, #1
	str r2, [sp, #8]
	mov r4, sb
	muls r4, r6, r4
	adds r6, r4, #0
	mov r7, sb
	lsls r7, r7, #3
	str r7, [sp, #4]
	mov r1, sb
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #3
	mov sb, r0
	cmp r2, #0xb4
	bne _0800273C
	mov r1, r8
	adds r1, #0x4e
	movs r0, #0xe
	b _08002742
	.align 2, 0
_08002738: .4byte 0x7FFFFFFF
_0800273C:
	mov r1, r8
	adds r1, #0x4e
	movs r0, #0x1d
_08002742:
	strb r0, [r1]
	str r1, [sp, #0x24]
	mov r1, r8
	adds r1, #0x4f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	mov sl, r1
	cmp r0, #0
	bge _0800275C
	movs r0, #0x1e
	strb r0, [r1]
_0800275C:
	ldr r1, [sp, #0x24]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #6
	ldr r2, _08002878 @ =gUnknown_0202CFC0
	adds r4, r0, r2
	movs r3, #1
	ldr r7, [sp, #4]
	lsrs r7, r7, #1
	mov ip, r7
	mov r0, r8
	adds r0, #0x3f
	str r0, [sp, #0x14]
	mov r1, r8
	adds r1, #0x3e
	str r1, [sp, #0x10]
	mov r2, r8
	adds r2, #0x4a
	str r2, [sp, #0x20]
	mov r7, r8
	adds r7, #0x44
	str r7, [sp, #0x1c]
	adds r0, #1
	str r0, [sp, #0x18]
	ldr r2, _0800287C @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov r1, ip
	orrs r1, r0
	mov ip, r1
	movs r5, #0
	ldr r7, _08002880 @ =gUnknown_030010BE
	adds r7, #2
	str r7, [sp, #0x28]
	mov r0, sl
	str r0, [sp, #0xc]
_080027A4:
	lsls r0, r3, #6
	ldr r1, _08002880 @ =gUnknown_030010BE
	adds r0, r0, r1
	str r0, [r2]
	ldr r7, [sp, #0x28]
	str r7, [r2, #4]
	ldr r0, _08002884 @ =0x80000001
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r7, [sp, #4]
	adds r1, r0, #0
	muls r1, r7, r1
	ldr r7, _08002888 @ =0x06004000
	adds r0, r5, r7
	adds r0, r1, r0
	str r4, [r2]
	str r0, [r2, #4]
	mov r0, ip
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r4, r4, r6
	add r5, sb
	ldr r1, [sp, #0x28]
	adds r1, #0x40
	str r1, [sp, #0x28]
	adds r3, #1
	cmp r3, #0x14
	bls _080027A4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0800287C @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _0800288C @ =0x0600DD80
	str r0, [r1, #4]
	ldr r0, _08002890 @ =0x81000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	ldr r0, _08002894 @ =gUnknown_03001080
	ldr r1, _08002898 @ =0x00002276
	adds r0, #0x3e
_08002800:
	strh r1, [r0]
	adds r0, #0x40
	adds r3, #1
	cmp r3, #0x1f
	bls _08002800
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0800281E
	movs r0, #0x1e
	strb r0, [r4]
_0800281E:
	ldr r7, [sp, #0x24]
	ldrb r0, [r7]
	subs r0, #1
	strb r0, [r7]
	movs r0, #0x3a
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	ldr r2, [sp, #0x10]
	strb r3, [r2]
	subs r0, #0x5b
	ldr r4, [sp, #0x20]
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #0x10
	orrs r0, r1
	ldr r7, [sp, #0x20]
	strh r0, [r7]
	ldr r2, [sp, #0x1c]
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r4, [sp, #8]
	cmp r0, r4
	bls _0800285A
	mov r1, r8
	adds r1, #0x4c
	ldrb r2, [r2]
	subs r0, r2, r4
	ldrb r7, [r1]
	subs r0, r7, r0
	strb r0, [r1]
_0800285A:
	mov r0, sp
	ldrh r1, [r0, #8]
	ldr r0, [sp, #0x1c]
	strh r1, [r0]
	ldr r2, [sp, #0x18]
	strh r3, [r2]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002878: .4byte gUnknown_0202CFC0
_0800287C: .4byte 0x040000D4
_08002880: .4byte gUnknown_030010BE
_08002884: .4byte 0x80000001
_08002888: .4byte 0x06004000
_0800288C: .4byte 0x0600DD80
_08002890: .4byte 0x81000020
_08002894: .4byte gUnknown_03001080
_08002898: .4byte 0x00002276

	thumb_func_start sub_800289C
sub_800289C: @ 0x0800289C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080028BA
	adds r0, #7
_080028BA:
	asrs r0, r0, #3
	str r0, [sp, #8]
	movs r3, #8
	str r3, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _080028CC
	movs r2, #4
	str r2, [sp, #0xc]
_080028CC:
	ldr r3, [sp, #4]
	str r3, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r0, r3, #0
	muls r0, r2, r0
	str r0, [sp, #4]
	lsls r3, r2, #3
	str r3, [sp, #0x10]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #3
	str r0, [sp, #0xc]
	str r1, [sp, #0x1c]
	ldr r0, [sp]
	adds r0, #0x4e
	mov sb, r0
	ldr r1, [sp]
	adds r1, #0x4f
	mov r8, r1
	ldr r2, [sp]
	adds r2, #0x3f
	str r2, [sp, #0x18]
	b _08002904
_080028FA:
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #8]
	cmp r3, #0
	beq _080029D6
_08002904:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _0800291C
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r2, _08002918 @ =gUnknown_0202CFC0
	adds r6, r0, r2
	b _08002928
	.align 2, 0
_08002918: .4byte gUnknown_0202CFC0
_0800291C:
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	ldr r1, _08002A00 @ =gUnknown_0202CFC0
	adds r6, r0, r1
_08002928:
	movs r2, #1
	mov ip, r2
	ldr r3, [sp, #0x10]
	lsrs r7, r3, #1
	ldr r4, _08002A04 @ =0x040000D4
	ldr r0, _08002A08 @ =0x8000001F
	mov sl, r0
	movs r5, #0
	subs r0, #0x1f
	orrs r7, r0
_0800293C:
	mov r2, ip
	lsls r1, r2, #6
	ldr r3, _08002A0C @ =gUnknown_03001082
	adds r2, r1, r3
	ldr r0, _08002A10 @ =gUnknown_03001880
	adds r3, r1, r0
	str r2, [r4]
	str r3, [r4, #4]
	mov r2, sl
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08002A14 @ =gUnknown_03001080
	adds r2, r1, r0
	str r3, [r4]
	str r2, [r4, #4]
	mov r3, sl
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08002A18 @ =gUnknown_030010BE
	adds r3, r1, r0
	str r2, [r4]
	str r3, [r4, #4]
	ldr r0, _08002A1C @ =0x80000001
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #0x10]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r3, _08002A20 @ =0x06004000
	adds r0, r5, r3
	adds r2, r1, r0
	str r6, [r4]
	str r2, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp, #4]
	adds r6, r6, r0
	ldr r1, [sp, #0xc]
	adds r5, r5, r1
	movs r2, #1
	add ip, r2
	mov r3, ip
	cmp r3, #0x14
	bls _0800293C
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	ble _080029AE
	strb r2, [r1]
_080029AE:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3b
	ble _080029C0
	strb r2, [r1]
_080029C0:
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldr r3, [sp, #0x18]
	ldrb r3, [r3]
	cmp r0, r3
	bne _080028FA
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl sub_80026F0
_080029D6:
	ldr r0, [sp, #0x1c]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _080029E4
	adds r0, r1, #7
_080029E4:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002A00: .4byte gUnknown_0202CFC0
_08002A04: .4byte 0x040000D4
_08002A08: .4byte 0x8000001F
_08002A0C: .4byte gUnknown_03001082
_08002A10: .4byte gUnknown_03001880
_08002A14: .4byte gUnknown_03001080
_08002A18: .4byte gUnknown_030010BE
_08002A1C: .4byte 0x80000001
_08002A20: .4byte 0x06004000

	thumb_func_start sub_8002A24
sub_8002A24: @ 0x08002A24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	mov r6, ip
	adds r6, #0x4e
	movs r0, #0
	mov r8, r0
	movs r0, #0x15
	strb r0, [r6]
	movs r2, #0x80
	lsls r2, r2, #0x18
	mov sb, r2
	movs r4, #8
	cmp r1, #0
	bge _08002A48
	movs r4, #4
_08002A48:
	ldr r5, _08002AC4 @ =0x7FFFFFFF
	ands r5, r1
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r4, r0, #4
	mov r2, ip
	adds r2, #0x4f
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	ble _08002A68
	mov r3, r8
	strb r3, [r2]
_08002A68:
	ldr r3, _08002AC8 @ =gUnknown_03001080
	movs r7, #0xa8
	lsls r7, r7, #3
	adds r0, r3, r7
	ldr r1, _08002ACC @ =0x040000D4
	str r3, [r1]
	str r0, [r1, #4]
	ldr r0, _08002AD0 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	ldrsb r0, [r2, r0]
	muls r0, r4, r0
	ldr r7, _08002AD4 @ =0x06004000
	adds r3, r0, r7
	movs r0, #0
	ldrsb r0, [r6, r0]
	muls r0, r4, r0
	ldr r6, _08002AD8 @ =gUnknown_0202CFC0
	adds r0, r0, r6
	subs r0, r0, r4
	str r0, [r1]
	str r3, [r1, #4]
	lsrs r0, r4, #1
	mov r7, sb
	orrs r0, r7
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	ble _08002AB2
	mov r0, r8
	strb r0, [r2]
_08002AB2:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r5, r0
	bne _08002ADC
	mov r1, ip
	adds r1, #0x3f
	movs r0, #1
	b _08002AE2
	.align 2, 0
_08002AC4: .4byte 0x7FFFFFFF
_08002AC8: .4byte gUnknown_03001080
_08002ACC: .4byte 0x040000D4
_08002AD0: .4byte 0x80000020
_08002AD4: .4byte 0x06004000
_08002AD8: .4byte gUnknown_0202CFC0
_08002ADC:
	mov r1, ip
	adds r1, #0x3f
	movs r0, #0x20
_08002AE2:
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x3e
	movs r4, #0
	strb r4, [r0]
	mov r2, ip
	adds r2, #0x4a
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	mov r1, ip
	adds r1, #0x46
	ldrh r3, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08002B16
	mov r2, ip
	adds r2, #0x4d
	ldrb r5, [r2]
	subs r0, r5, r3
	strb r0, [r2]
_08002B16:
	strh r4, [r1]
	mov r0, ip
	adds r0, #0x42
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8002B2C
sub_8002B2C: @ 0x08002B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	str r1, [sp]
	adds r1, r4, #0
	adds r1, #0x42
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08002B4A
	adds r0, #7
_08002B4A:
	asrs r0, r0, #3
	rsbs r0, r0, #0
	mov r8, r0
	movs r6, #8
	ldr r3, [sp]
	cmp r3, #0
	bge _08002B5A
	movs r6, #4
_08002B5A:
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r6, r0, #4
	mov sl, r1
	ldr r5, _08002B78 @ =gUnknown_03001080
	adds r7, r4, #0
	adds r7, #0x4e
	str r7, [sp, #4]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	movs r1, #0x3f
	adds r1, r1, r4
	mov sb, r1
	b _08002B88
	.align 2, 0
_08002B78: .4byte gUnknown_03001080
_08002B7C:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r3, r8
	cmp r3, #0
	beq _08002C14
_08002B88:
	ldr r2, _08002C3C @ =0x040000D4
	str r5, [r2]
	ldr r7, _08002C40 @ =gUnknown_03001880
	str r7, [r2, #4]
	ldr r1, _08002C44 @ =0x800002A0
	str r1, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r5, #0
	adds r0, #0x40
	str r7, [r2]
	str r0, [r2, #4]
	str r1, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0xa8
	lsls r1, r1, #3
	adds r0, r5, r1
	str r0, [r2]
	str r5, [r2, #4]
	ldr r0, _08002C48 @ =0x80000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, [sp, #4]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r7, _08002C4C @ =gUnknown_0202CFC0
	adds r1, r1, r7
	mov r7, ip
	movs r0, #0
	ldrsb r0, [r7, r0]
	muls r0, r6, r0
	ldr r7, _08002C50 @ =0x06004000
	adds r0, r0, r7
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r6, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002BEE
	movs r0, #0x14
	strb r0, [r1]
_08002BEE:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002BFE
	movs r0, #0x27
	strb r0, [r3]
_08002BFE:
	ldr r2, [sp, #4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	mov r3, sb
	ldrb r3, [r3]
	cmp r0, r3
	bne _08002B7C
	adds r0, r4, #0
	ldr r1, [sp]
	bl sub_8002A24
_08002C14:
	mov r7, sl
	movs r0, #0
	ldrsh r1, [r7, r0]
	adds r0, r1, #0
	cmp r1, #0
	bge _08002C22
	adds r0, r1, #7
_08002C22:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	mov r1, sl
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C3C: .4byte 0x040000D4
_08002C40: .4byte gUnknown_03001880
_08002C44: .4byte 0x800002A0
_08002C48: .4byte 0x80000020
_08002C4C: .4byte gUnknown_0202CFC0
_08002C50: .4byte 0x06004000

	thumb_func_start sub_8002C54
sub_8002C54: @ 0x08002C54
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	adds r4, r1, #0
	movs r5, #8
	cmp r4, #0
	bge _08002C62
	movs r5, #4
_08002C62:
	ldr r0, _08002C7C @ =0x7FFFFFFF
	ands r4, r0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r5, r0, #4
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r4, r0
	bne _08002C80
	mov r1, ip
	adds r1, #0x4e
	movs r0, #0x12
	b _08002C86
	.align 2, 0
_08002C7C: .4byte 0x7FFFFFFF
_08002C80:
	mov r1, ip
	adds r1, #0x4e
	movs r0, #8
_08002C86:
	strb r0, [r1]
	adds r6, r1, #0
	mov r3, ip
	adds r3, #0x4f
	ldrb r0, [r3]
	subs r0, #1
	movs r7, #0
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002CA0
	movs r0, #0x14
	strb r0, [r3]
_08002CA0:
	ldr r1, _08002D34 @ =gUnknown_030015C0
	ldr r2, _08002D38 @ =0xFFFFFAC0
	adds r0, r1, r2
	ldr r2, _08002D3C @ =0x040000D4
	str r1, [r2]
	str r0, [r2, #4]
	ldr r0, _08002D40 @ =0x80000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	ldrsb r0, [r6, r0]
	muls r0, r5, r0
	ldr r6, _08002D44 @ =gUnknown_0202CFC0
	adds r0, r0, r6
	adds r0, r0, r5
	movs r1, #0
	ldrsb r1, [r3, r1]
	muls r1, r5, r1
	ldr r6, _08002D48 @ =0x06004000
	adds r1, r1, r6
	str r0, [r2]
	str r1, [r2, #4]
	lsrs r0, r5, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08002CE8
	movs r0, #0x14
	strb r0, [r3]
_08002CE8:
	mov r1, ip
	adds r1, #0x3f
	movs r0, #0x26
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x3e
	strb r7, [r0]
	mov r2, ip
	adds r2, #0x4a
	movs r0, #0x81
	rsbs r0, r0, #0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	lsrs r4, r4, #1
	mov r1, ip
	adds r1, #0x46
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bls _08002D24
	mov r2, ip
	adds r2, #0x4d
	ldrb r3, [r1]
	subs r0, r3, r4
	ldrb r6, [r2]
	subs r0, r6, r0
	strb r0, [r2]
_08002D24:
	strh r4, [r1]
	mov r0, ip
	adds r0, #0x42
	strh r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002D34: .4byte gUnknown_030015C0
_08002D38: .4byte 0xFFFFFAC0
_08002D3C: .4byte 0x040000D4
_08002D40: .4byte 0x80000020
_08002D44: .4byte gUnknown_0202CFC0
_08002D48: .4byte 0x06004000

	thumb_func_start sub_8002D4C
sub_8002D4C: @ 0x08002D4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x42
	ldrh r3, [r2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x13
	mov r8, r0
	movs r6, #8
	cmp r1, #0
	bge _08002D6E
	movs r6, #4
_08002D6E:
	str r1, [sp]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r6, r0, #4
	mov sl, r2
	ldr r5, _08002D90 @ =gUnknown_030010C0
	adds r7, r4, #0
	adds r7, #0x4e
	str r7, [sp, #4]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	movs r1, #0x3f
	adds r1, r1, r4
	mov sb, r1
	b _08002DA0
	.align 2, 0
_08002D90: .4byte gUnknown_030010C0
_08002D94:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r3, r8
	cmp r3, #0
	beq _08002E38
_08002DA0:
	movs r7, #0xa8
	lsls r7, r7, #3
	adds r0, r5, r7
	ldr r2, _08002E60 @ =0x040000D4
	str r5, [r2]
	str r0, [r2, #4]
	ldr r0, _08002E64 @ =0x80000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r5, #0
	subs r0, #0x40
	str r0, [r2]
	ldr r0, _08002E68 @ =gUnknown_03001880
	str r0, [r2, #4]
	ldr r0, _08002E6C @ =0x800002E0
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _08002E68 @ =gUnknown_03001880
	adds r0, #0x40
	str r0, [r2]
	ldr r1, _08002E70 @ =gUnknown_03001080
	str r1, [r2, #4]
	ldr r0, _08002E74 @ =0x800002C0
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, [sp, #4]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r7, _08002E78 @ =gUnknown_0202CFC0
	adds r1, r1, r7
	mov r7, ip
	movs r0, #0
	ldrsb r0, [r7, r0]
	muls r0, r6, r0
	ldr r7, _08002E7C @ =0x06004000
	adds r0, r0, r7
	str r1, [r2]
	str r0, [r2, #4]
	lsrs r0, r6, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	movs r1, #0
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	ble _08002E12
	strb r1, [r2]
_08002E12:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x27
	ble _08002E22
	strb r1, [r3]
_08002E22:
	ldr r3, [sp, #4]
	movs r0, #0
	ldrsb r0, [r3, r0]
	mov r7, sb
	ldrb r7, [r7]
	cmp r0, r7
	bne _08002D94
	adds r0, r4, #0
	ldr r1, [sp]
	bl sub_8002C54
_08002E38:
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _08002E46
	adds r0, r1, #7
_08002E46:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	mov r3, sl
	strh r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002E60: .4byte 0x040000D4
_08002E64: .4byte 0x80000020
_08002E68: .4byte gUnknown_03001880
_08002E6C: .4byte 0x800002E0
_08002E70: .4byte gUnknown_03001080
_08002E74: .4byte 0x800002C0
_08002E78: .4byte gUnknown_0202CFC0
_08002E7C: .4byte 0x06004000

	thumb_func_start sub_8002E80
sub_8002E80: @ 0x08002E80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sl, r0
	str r1, [sp, #4]
	mov r3, sl
	adds r3, #0x40
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08002E9E
	adds r0, #7
_08002E9E:
	asrs r2, r0, #3
	movs r5, #0x80
	lsls r5, r5, #0x18
	movs r4, #8
	str r4, [sp, #8]
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08002EB2
	movs r1, #4
	str r1, [sp, #8]
_08002EB2:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r4, r0, #0
	muls r4, r1, r4
	str r4, [sp, #4]
	lsls r4, r1, #3
	str r4, [sp, #0xc]
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #3
	str r0, [sp, #8]
	adds r0, r2, #1
	mov r1, sl
	adds r1, #0x4e
	strb r0, [r1]
	str r3, [sp, #0x14]
	str r1, [sp, #0x20]
	mov r0, sl
	adds r0, #0x42
	str r0, [sp, #0x18]
	subs r1, #4
	str r1, [sp, #0x1c]
	cmp r2, #0
	beq _08002F92
	ldr r4, [sp, #0x20]
	mov r8, r4
	movs r0, #0x4f
	add r0, sl
	mov ip, r0
	ldr r1, [sp, #0xc]
	lsrs r1, r1, #1
	ldr r4, _080030B8 @ =0x040000D4
	ldr r0, [sp, #8]
	rsbs r0, r0, #0
	str r0, [sp, #0x28]
	orrs r1, r5
	mov sb, r1
_08002EFC:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #6
	ldr r1, _080030BC @ =gUnknown_0202CFC0
	adds r6, r0, r1
	movs r7, #1
	subs r2, #1
	str r2, [sp, #0x24]
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x28]
	adds r5, r2, r0
_08002F14:
	lsls r1, r7, #6
	ldr r0, _080030C0 @ =gUnknown_03001082
	adds r2, r1, r0
	ldr r0, _080030C4 @ =gUnknown_03001880
	adds r3, r1, r0
	str r2, [r4]
	str r3, [r4, #4]
	ldr r2, _080030C8 @ =0x8000001F
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080030CC @ =gUnknown_03001080
	adds r2, r1, r0
	str r3, [r4]
	str r2, [r4, #4]
	ldr r0, _080030C8 @ =0x8000001F
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080030D0 @ =gUnknown_030010BE
	adds r3, r1, r0
	str r2, [r4]
	str r3, [r4, #4]
	ldr r0, _080030D4 @ =0x80000001
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r2, _080030D8 @ =0x06004000
	adds r0, r5, r2
	adds r2, r1, r0
	str r6, [r4]
	str r2, [r4, #4]
	mov r0, sb
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, [sp, #4]
	adds r6, r6, r1
	ldr r2, [sp, #8]
	adds r5, r5, r2
	adds r7, #1
	cmp r7, #0x14
	bls _08002F14
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	movs r1, #0
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	ble _08002F84
	strb r1, [r2]
_08002F84:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0x24]
	cmp r2, #0
	bne _08002EFC
_08002F92:
	ldr r2, [sp, #0x14]
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r0, r1, #0
	cmp r1, #0
	bge _08002FA0
	adds r0, r1, #7
_08002FA0:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	ldr r1, [sp, #0x14]
	strh r0, [r1]
	ldr r2, [sp, #0x18]
	ldrh r1, [r2]
	adds r1, #8
	ldr r4, _080030DC @ =gIORegisters
	strh r1, [r4, #0x16]
	adds r0, #8
	strh r0, [r4, #0x14]
	movs r0, #0x10
	ldr r1, [sp, #0x1c]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080030A8
	ldr r2, [sp, #0x20]
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x3b
	ble _08002FD6
	adds r0, r1, #0
	subs r0, #0x20
	strb r0, [r2]
_08002FD6:
	mov r1, sl
	adds r1, #0x3f
	movs r0, #0x3a
	strb r0, [r1]
	adds r1, #0x10
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	mov ip, r1
	cmp r0, #0
	bge _08002FF2
	movs r0, #0x1e
	strb r0, [r1]
_08002FF2:
	ldr r4, [sp, #0x20]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #6
	ldr r1, _080030BC @ =gUnknown_0202CFC0
	adds r6, r0, r1
	movs r7, #1
	ldr r2, [sp, #0xc]
	lsrs r5, r2, #1
	mov r4, sl
	adds r4, #0x3e
	str r4, [sp, #0x10]
	ldr r0, _080030D0 @ =gUnknown_030010BE
	mov sb, r0
	ldr r3, _080030B8 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r5, r0
	movs r4, #0
	movs r1, #2
	add r1, sb
	mov r8, r1
	ldr r2, _080030D4 @ =0x80000001
	mov sl, r2
_08003022:
	lsls r0, r7, #6
	mov r1, sb
	adds r2, r0, r1
	str r2, [r3]
	mov r2, r8
	str r2, [r3, #4]
	mov r0, sl
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r2, _080030D8 @ =0x06004000
	adds r0, r4, r2
	adds r2, r1, r0
	str r6, [r3]
	str r2, [r3, #4]
	str r5, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [sp, #4]
	adds r6, r6, r0
	ldr r1, [sp, #8]
	adds r4, r4, r1
	movs r2, #0x40
	add r8, r2
	adds r7, #1
	cmp r7, #0x14
	bls _08003022
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080030B8 @ =0x040000D4
	mov r4, sp
	str r4, [r1]
	ldr r0, _080030E0 @ =0x0600DD80
	str r0, [r1, #4]
	ldr r0, _080030E4 @ =0x81000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r7, #0
	ldr r0, _080030CC @ =gUnknown_03001080
	ldr r1, _080030E8 @ =0x00002276
	adds r0, #0x3e
_0800307E:
	strh r1, [r0]
	adds r0, #0x40
	adds r7, #1
	cmp r7, #0x1f
	bls _0800307E
	mov r1, ip
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0800309A
	movs r0, #0x1e
	strb r0, [r1]
_0800309A:
	ldr r2, [sp, #0x20]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r0, #0
	ldr r4, [sp, #0x10]
	strb r0, [r4]
_080030A8:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080030B8: .4byte 0x040000D4
_080030BC: .4byte gUnknown_0202CFC0
_080030C0: .4byte gUnknown_03001082
_080030C4: .4byte gUnknown_03001880
_080030C8: .4byte 0x8000001F
_080030CC: .4byte gUnknown_03001080
_080030D0: .4byte gUnknown_030010BE
_080030D4: .4byte 0x80000001
_080030D8: .4byte 0x06004000
_080030DC: .4byte gIORegisters
_080030E0: .4byte 0x0600DD80
_080030E4: .4byte 0x81000020
_080030E8: .4byte 0x00002276

	thumb_func_start sub_80030EC
sub_80030EC: @ 0x080030EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov sl, r0
	str r1, [sp]
	mov r2, sl
	adds r2, #0x40
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _0800310A
	adds r0, #7
_0800310A:
	asrs r0, r0, #3
	rsbs r1, r0, #0
	movs r4, #0x80
	lsls r4, r4, #0x18
	movs r3, #8
	str r3, [sp, #4]
	ldr r5, [sp]
	cmp r5, #0
	bge _08003120
	movs r7, #4
	str r7, [sp, #4]
_08003120:
	ldr r0, [sp]
	str r0, [sp, #0xc]
	ldr r5, [sp, #4]
	adds r3, r0, #0
	muls r3, r5, r3
	str r3, [sp]
	lsls r7, r5, #3
	str r7, [sp, #8]
	lsls r0, r5, #5
	subs r0, r0, r5
	lsls r0, r0, #3
	str r0, [sp, #4]
	str r2, [sp, #0x18]
	mov r0, sl
	adds r0, #0x42
	str r0, [sp, #0x1c]
	mov r2, sl
	adds r2, #0x4a
	str r2, [sp, #0x24]
	cmp r1, #0
	beq _08003204
	movs r3, #0x4e
	add r3, sl
	mov sb, r3
	mov r5, sl
	adds r5, #0x4f
	str r5, [sp, #0x30]
	lsrs r7, r7, #1
	ldr r0, _08003308 @ =gUnknown_03001080
	mov r8, r0
	ldr r3, _0800330C @ =0x040000D4
	ldr r2, [sp, #4]
	rsbs r2, r2, #0
	str r2, [sp, #0x2c]
	adds r5, r7, #0
	orrs r5, r4
	mov ip, r5
_0800316A:
	mov r0, sl
	adds r0, #0x4e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	ldr r7, _08003310 @ =gUnknown_0202CFC0
	adds r5, r0, r7
	movs r6, #1
	subs r1, #1
	str r1, [sp, #0x28]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x2c]
	adds r4, r0, r1
_08003186:
	lsls r1, r6, #6
	mov r7, r8
	adds r2, r1, r7
	ldr r7, _08003314 @ =gUnknown_03001880
	adds r0, r1, r7
	str r2, [r3]
	str r0, [r3, #4]
	ldr r0, _08003318 @ =0x8000001E
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	mov r0, r8
	adds r0, #0x3c
	adds r0, r1, r0
	str r0, [r3]
	str r2, [r3, #4]
	ldr r0, _0800331C @ =0x80000001
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	adds r2, r1, r7
	ldr r7, _08003320 @ =gUnknown_03001082
	adds r0, r1, r7
	str r2, [r3]
	str r0, [r3, #4]
	ldr r0, _08003318 @ =0x8000001E
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0x30]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r7, _08003324 @ =0x06004000
	adds r0, r4, r7
	adds r2, r1, r0
	str r5, [r3]
	str r2, [r3, #4]
	mov r0, ip
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp]
	adds r5, r5, r1
	ldr r2, [sp, #4]
	adds r4, r4, r2
	adds r6, #1
	cmp r6, #0x14
	bls _08003186
	ldr r5, [sp, #0x30]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _080031F6
	movs r0, #0x1e
	strb r0, [r5]
_080031F6:
	mov r7, sb
	ldrb r0, [r7]
	subs r0, #1
	strb r0, [r7]
	ldr r1, [sp, #0x28]
	cmp r1, #0
	bne _0800316A
_08003204:
	ldr r0, [sp, #0x18]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _08003212
	adds r0, r1, #7
_08003212:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3]
	ldr r5, [sp, #0x1c]
	ldrh r1, [r5]
	adds r1, #8
	ldr r7, _08003328 @ =gIORegisters
	strh r1, [r7, #0x16]
	adds r0, #8
	strh r0, [r7, #0x14]
	movs r0, #0x20
	ldr r1, [sp, #0x24]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08003238
	b _08003356
_08003238:
	mov r0, sl
	adds r0, #0x4e
	ldrb r2, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	bge _08003250
	adds r0, r2, #0
	adds r0, #0x20
	mov r2, sb
	strb r0, [r2]
_08003250:
	mov r1, sl
	adds r1, #0x4f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r1, [sp, #0x30]
	cmp r0, #0x1e
	ble _08003268
	movs r0, #0
	strb r0, [r1]
_08003268:
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	ldr r7, _08003310 @ =gUnknown_0202CFC0
	adds r5, r0, r7
	movs r6, #1
	ldr r0, [sp, #8]
	lsrs r0, r0, #1
	mov ip, r0
	mov r1, sl
	adds r1, #0x3f
	str r1, [sp, #0x14]
	mov r2, sl
	adds r2, #0x3e
	str r2, [sp, #0x10]
	mov r3, sl
	adds r3, #0x44
	str r3, [sp, #0x20]
	ldr r3, _0800330C @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov r7, ip
	orrs r7, r0
	mov ip, r7
	movs r4, #0
	ldr r0, _08003308 @ =gUnknown_03001080
	adds r0, #0x7e
	mov r8, r0
_080032A2:
	lsls r0, r6, #6
	ldr r1, _08003308 @ =gUnknown_03001080
	adds r2, r0, r1
	str r2, [r3]
	mov r2, r8
	str r2, [r3, #4]
	ldr r7, _0800331C @ =0x80000001
	str r7, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0x30]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r7, _08003324 @ =0x06004000
	adds r0, r4, r7
	adds r2, r1, r0
	str r5, [r3]
	str r2, [r3, #4]
	mov r0, ip
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp]
	adds r5, r5, r1
	ldr r2, [sp, #4]
	adds r4, r4, r2
	movs r7, #0x40
	add r8, r7
	adds r6, #1
	cmp r6, #0x14
	bls _080032A2
	ldr r1, [sp, #0x30]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	ble _080032F6
	movs r0, #0
	strb r0, [r1]
_080032F6:
	movs r0, #0xb4
	lsls r0, r0, #1
	ldr r2, [sp, #0xc]
	cmp r2, r0
	bne _0800332C
	movs r0, #0x2f
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	b _08003332
	.align 2, 0
_08003308: .4byte gUnknown_03001080
_0800330C: .4byte 0x040000D4
_08003310: .4byte gUnknown_0202CFC0
_08003314: .4byte gUnknown_03001880
_08003318: .4byte 0x8000001E
_0800331C: .4byte 0x80000001
_08003320: .4byte gUnknown_03001082
_08003324: .4byte 0x06004000
_08003328: .4byte gIORegisters
_0800332C:
	movs r0, #1
	ldr r5, [sp, #0x14]
	strb r0, [r5]
_08003332:
	mov r7, sb
	ldrb r0, [r7]
	adds r0, #1
	movs r1, #0
	strb r0, [r7]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	ldr r1, [sp, #0x20]
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _08003356
	mov r1, sl
	adds r1, #0x4c
	ldrb r5, [r1]
	subs r0, r5, r2
	strb r0, [r1]
_08003356:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateBackground
UpdateBackground: @ 0x08003368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r7, _080033AC @ =gMain
	ldr r0, _080033B0 @ =gScriptContext
	mov sb, r0
	ldr r1, _080033B4 @ =gCourtScroll
	ldrh r0, [r1, #4]
	adds r4, r7, #0
	ldr r5, _080033B8 @ =gIORegisters
	cmp r0, #0
	bne _08003388
	b _08003750
_08003388:
	movs r0, #1
	ldrh r2, [r1, #0xc]
	ands r0, r2
	cmp r0, #0
	beq _08003394
	b _08003750
_08003394:
	ldr r3, [r1]
	movs r6, #0
	mov r8, r6
	ldrb r0, [r1, #6]
	cmp r0, #5
	bhi _0800342E
	lsls r0, r0, #2
	ldr r1, _080033BC @ =_080033C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080033AC: .4byte gMain
_080033B0: .4byte gScriptContext
_080033B4: .4byte gCourtScroll
_080033B8: .4byte gIORegisters
_080033BC: .4byte _080033C0
_080033C0: @ jump table
	.4byte _080033D8 @ case 0
	.4byte _080033D8 @ case 1
	.4byte _080033F8 @ case 2
	.4byte _080033F8 @ case 3
	.4byte _08003414 @ case 4
	.4byte _08003414 @ case 5
_080033D8:
	ldr r0, _080033F0 @ =gUnknown_0814D894
	ldr r2, _080033F4 @ =gCourtScroll
	movs r6, #0xc
	ldrsh r1, [r2, r6]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r8, r1
	b _0800342E
	.align 2, 0
_080033F0: .4byte gUnknown_0814D894
_080033F4: .4byte gCourtScroll
_080033F8:
	ldr r2, _0800340C @ =gUnknown_0814D894
	ldr r1, _08003410 @ =gCourtScroll
	movs r6, #0xc
	ldrsh r0, [r1, r6]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #1
	adds r2, #0x20
	b _08003424
	.align 2, 0
_0800340C: .4byte gUnknown_0814D894
_08003410: .4byte gCourtScroll
_08003414:
	ldr r2, _08003488 @ =gUnknown_0814D894
	ldr r1, _0800348C @ =gCourtScroll
	movs r6, #0xc
	ldrsh r0, [r1, r6]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #1
_08003424:
	adds r0, r0, r2
	movs r1, #0x82
	ldrh r0, [r0]
	subs r0, r1, r0
	mov r8, r0
_0800342E:
	ldr r0, _08003490 @ =0x0000FF7F
	ldrh r1, [r5, #6]
	ands r0, r1
	strh r0, [r5, #6]
	adds r2, r4, #0
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800349C
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08003494 @ =0x040000D4
	str r3, [r0]
	mov r2, sp
	str r2, [r0, #4]
	ldr r1, _08003498 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0
	adds r3, #0x20
	mov sl, r3
	mov r6, r8
	lsls r6, r6, #5
	mov sb, r6
_08003464:
	lsls r0, r5, #1
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _08003464
	ldr r1, _08003494 @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	b _0800351C
	.align 2, 0
_08003488: .4byte gUnknown_0814D894
_0800348C: .4byte gCourtScroll
_08003490: .4byte 0x0000FF7F
_08003494: .4byte 0x040000D4
_08003498: .4byte 0x80000010
_0800349C:
	mov r6, sb
	ldrh r1, [r6, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080034EC
	ldr r1, _080034E4 @ =0x040000D4
	str r3, [r1]
	add r2, sp, #0x20
	str r2, [r1, #4]
	ldr r0, _080034E8 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	adds r6, r2, #0
	adds r3, #0x20
	mov sl, r3
	mov r0, r8
	lsls r0, r0, #5
	mov sb, r0
_080034C6:
	lsls r4, r5, #1
	adds r4, r6, r4
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_8005574
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _080034C6
	b _08003518
	.align 2, 0
_080034E4: .4byte 0x040000D4
_080034E8: .4byte 0x80000010
_080034EC:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08003534
	movs r5, #0
	add r6, sp, #0x20
	adds r3, #0x20
	mov sl, r3
	mov r1, r8
	lsls r1, r1, #5
	mov sb, r1
	adds r2, r6, #0
	movs r1, #0
_08003508:
	lsls r0, r5, #1
	adds r0, r2, r0
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _08003508
_08003518:
	ldr r1, _08003528 @ =0x040000D4
	str r6, [r1]
_0800351C:
	ldr r0, _0800352C @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08003530 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800354C
	.align 2, 0
_08003528: .4byte 0x040000D4
_0800352C: .4byte 0x05000040
_08003530: .4byte 0x80000010
_08003534:
	ldr r1, _08003598 @ =0x040000D4
	str r3, [r1]
	ldr r0, _0800359C @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _080035A0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, #0x20
	mov sl, r3
	mov r2, r8
	lsls r2, r2, #5
	mov sb, r2
_0800354C:
	mov r6, r8
	cmp r6, #0x31
	bhi _080035B8
	mov r3, sl
	add r3, sb
	movs r0, #0xa0
	lsls r0, r0, #4
	mov sl, r0
	ldr r4, _080035A4 @ =0x06004000
	movs r5, #0
	ldr r1, _080035A8 @ =gUnknown_080248F8
	mov r8, r1
	ldr r2, _080035AC @ =gUnknown_03001080
	mov sb, r2
	ldr r1, _08003598 @ =0x040000D4
	ldr r6, _080035B0 @ =0x800001E0
	movs r2, #0xf0
	lsls r2, r2, #2
_08003570:
	str r3, [r1]
	str r4, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r4, r4, r2
	add r3, sl
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bls _08003570
	ldr r0, _08003598 @ =0x040000D4
	mov r6, r8
	str r6, [r0]
	mov r1, sb
	str r1, [r0, #4]
	ldr r1, _080035B4 @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _08003750
	.align 2, 0
_08003598: .4byte 0x040000D4
_0800359C: .4byte 0x05000040
_080035A0: .4byte 0x80000010
_080035A4: .4byte 0x06004000
_080035A8: .4byte gUnknown_080248F8
_080035AC: .4byte gUnknown_03001080
_080035B0: .4byte 0x800001E0
_080035B4: .4byte 0x800002C0
_080035B8:
	mov r3, sl
	add r3, sb
	movs r2, #0xa0
	lsls r2, r2, #4
	mov sl, r2
	ldr r4, _08003614 @ =0x06004000
	ldr r6, _08003618 @ =gCourtScroll
	ldr r6, [r6]
	mov sb, r6
	mov r0, r8
	cmp r0, #0x4f
	bhi _080035FC
	movs r5, #0
	ldr r1, _0800361C @ =0x040000D4
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	lsls r2, r0, #4
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
	movs r6, #0xf0
	lsls r6, r6, #2
_080035E6:
	str r3, [r1]
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	adds r4, r4, r6
	add r3, sl
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bls _080035E6
_080035FC:
	mov r3, sb
	adds r3, #0x20
	mov r6, r8
	cmp r6, #0x4f
	bls _08003620
	movs r0, #0x82
	subs r0, r0, r6
	lsls r0, r0, #5
	adds r3, r3, r0
	ldr r4, _08003614 @ =0x06004000
	movs r0, #0x1e
	b _08003638
	.align 2, 0
_08003614: .4byte 0x06004000
_08003618: .4byte gCourtScroll
_0800361C: .4byte 0x040000D4
_08003620:
	movs r0, #0x82
	mov r1, r8
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r3, r3, r0
	movs r0, #0x50
	subs r0, r0, r1
	lsls r0, r0, #5
	ldr r2, _08003704 @ =0x06004000
	adds r4, r0, r2
	mov r0, r8
	subs r0, #0x32
_08003638:
	movs r5, #0
	lsls r2, r0, #4
	ldr r1, _08003708 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
	movs r6, #0xf0
	lsls r6, r6, #2
_08003648:
	str r3, [r1]
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	adds r4, r4, r6
	add r3, sl
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bls _08003648
	mov r6, r8
	cmp r6, #0x4f
	bhi _08003710
	movs r2, #0
	movs r0, #0x32
	rsbs r0, r0, #0
	add r0, r8
	mov ip, r0
	lsls r6, r6, #0x10
	mov sl, r6
	ldr r1, _0800370C @ =gUnknown_03001080
	mov sb, r1
_08003676:
	mov r6, sl
	lsrs r5, r6, #0x10
	adds r3, r2, #1
	cmp r5, #0x4f
	bhi _080036AC
	lsls r4, r3, #5
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r3, r0, #1
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r0, #0
_0800368E:
	mov r0, r8
	subs r1, r5, r0
	adds r0, r4, r1
	adds r0, #1
	lsls r0, r0, #0x10
	adds r1, r3, r1
	orrs r1, r6
	lsrs r0, r0, #0xf
	add r0, sb
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x4f
	bls _0800368E
_080036AC:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bls _08003676
	movs r2, #0
	mov sl, ip
	ldr r1, _0800370C @ =gUnknown_03001080
	mov sb, r1
_080036BE:
	movs r5, #0
	adds r3, r2, #1
	cmp r5, sl
	bhs _080036FA
	lsls r4, r3, #5
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r2, r0, #1
	movs r6, #0x90
	lsls r6, r6, #6
	mov ip, r6
_080036D4:
	mov r0, r8
	subs r1, r5, r0
	adds r1, #0x51
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #0x1d
	subs r0, r2, r0
	mov r6, ip
	orrs r0, r6
	lsrs r1, r1, #0xf
	add r1, sb
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	blo _080036D4
_080036FA:
	lsls r0, r3, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bls _080036BE
	b _08003750
	.align 2, 0
_08003704: .4byte 0x06004000
_08003708: .4byte 0x040000D4
_0800370C: .4byte gUnknown_03001080
_08003710:
	movs r2, #0
	ldr r0, _08003778 @ =gUnknown_03001080
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #6
	adds r6, r1, #0
_0800371C:
	movs r5, #0
	adds r3, r2, #1
	lsls r0, r2, #4
	lsls r4, r3, #5
	subs r0, r0, r2
	lsls r2, r0, #1
_08003728:
	adds r1, r5, r4
	adds r1, #1
	lsls r1, r1, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #0x1d
	subs r0, r2, r0
	orrs r0, r6
	lsrs r1, r1, #0xf
	add r1, r8
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1d
	bls _08003728
	lsls r0, r3, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bls _0800371C
_08003750:
	adds r1, r7, #0
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08003780
	ldrh r2, [r7, #0x34]
	cmp r2, #0xe
	bne _08003780
	adds r0, r7, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, _0800377C @ =gIORegisters
	ldrh r6, [r6, #0x14]
	adds r0, r6, r0
	ldr r1, _0800377C @ =gIORegisters
	b _08003B08
	.align 2, 0
_08003778: .4byte gUnknown_03001080
_0800377C: .4byte gIORegisters
_08003780:
	ldr r2, _080037B4 @ =gUnknown_08023B98
	ldrh r6, [r7, #0x34]
	lsls r0, r6, #3
	adds r1, r2, #4
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	adds r6, r2, #0
	mov sb, r0
	cmp r1, #0
	bne _0800379C
	b _08003B0A
_0800379C:
	adds r0, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	movs r1, #0xf0
	ands r1, r3
	adds r2, r0, #0
	cmp r1, #0
	bne _080037B8
	mov r2, sb
	strb r1, [r2]
	b _08003B0A
	.align 2, 0
_080037B4: .4byte gUnknown_08023B98
_080037B8:
	movs r1, #0x30
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080037D0
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080037D0
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r4, r0
_080037D0:
	movs r1, #0xc0
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080037E6
	ands r3, r1
	cmp r3, #0
	bne _080037E6
	movs r0, #0xc1
	rsbs r0, r0, #0
	ands r4, r0
_080037E6:
	cmp r4, #0
	bne _080037FA
	mov r6, sb
	strb r4, [r6]
	movs r0, #0xf1
	rsbs r0, r0, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	b _08003B0A
_080037FA:
	movs r2, #0x10
	ands r2, r4
	cmp r2, #0
	beq _080038AE
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	ble _08003818
	movs r0, #0
	mov r2, sb
	strb r0, [r2]
	b _08003B0A
_08003818:
	adds r3, r7, #0
	adds r3, #0x40
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r3]
	adds r0, r1, r0
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x44
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r2]
	adds r1, r1, r0
	mov r8, r1
	strh r1, [r2]
	ldrh r1, [r7, #0x34]
	lsls r0, r1, #3
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	ands r0, r1
	movs r4, #0xb4
	lsls r4, r4, #1
	adds r6, r2, #0
	cmp r0, #0
	beq _08003850
	adds r4, #0x78
_08003850:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ands r1, r0
	orrs r4, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _0800386E
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8002560
	b _08003892
_0800386E:
	mov r1, r8
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _08003892
	adds r1, r7, #0
	adds r1, #0x4f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0800388A
	movs r0, #0x1e
	strb r0, [r1]
_0800388A:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_80023CC
_08003892:
	adds r1, r7, #0
	adds r1, #0x50
	ldrh r0, [r1]
	cmp r0, #0
	beq _08003956
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldrh r1, [r1]
	cmp r0, r1
	bgt _08003956
	movs r0, #0
	mov r6, sb
	strb r0, [r6]
	b _08003956
_080038AE:
	movs r3, #0x20
	ands r3, r4
	cmp r3, #0
	beq _08003964
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080038C6
	b _08003A52
_080038C6:
	adds r3, r7, #0
	adds r3, #0x40
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r3]
	adds r0, r1, r0
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x44
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r2]
	adds r0, r1, r0
	strh r0, [r2]
	ldrh r1, [r7, #0x34]
	lsls r0, r1, #3
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	ands r0, r1
	movs r4, #0xb4
	lsls r4, r4, #1
	adds r6, r2, #0
	cmp r0, #0
	beq _080038FC
	adds r4, #0x78
_080038FC:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ands r1, r0
	orrs r4, r1
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #7
	ble _08003914
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_800289C
_08003914:
	adds r1, r7, #0
	adds r1, #0x50
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800392E
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldrh r1, [r1]
	cmp r0, r1
	blt _0800392E
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
_0800392E:
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsrs r0, r4, #1
	cmp r1, r0
	bls _08003956
	adds r1, r7, #0
	adds r1, #0x4f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	ble _0800394E
	movs r0, #0
	strb r0, [r1]
_0800394E:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_80026F0
_08003956:
	movs r0, #0
	ldrsb r0, [r5, r0]
	rsbs r0, r0, #0
	movs r1, #0
	bl sub_8012C90
	b _08003AF4
_08003964:
	movs r2, #0x40
	ands r2, r4
	cmp r2, #0
	beq _08003A3C
	adds r0, r7, #0
	adds r0, #0x4d
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	ble _08003980
	mov r6, sb
	strb r3, [r6]
	b _08003B0A
_08003980:
	ldrh r0, [r7, #0x34]
	cmp r0, #0x2a
	bne _08003996
	ldr r0, _080039EC @ =gMain
	ldr r0, [r0]
	movs r1, #3
	bl __umodsi3
	cmp r0, #0
	beq _08003996
	b _08003B0A
_08003996:
	adds r3, r7, #0
	adds r3, #0x42
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r3]
	adds r0, r1, r0
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r2]
	adds r1, r1, r0
	mov r8, r1
	strh r1, [r2]
	ldrh r1, [r7, #0x34]
	lsls r0, r1, #3
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #4
	ands r0, r1
	movs r4, #0xf0
	adds r6, r2, #0
	cmp r0, #0
	beq _080039CC
	adds r4, #0x50
_080039CC:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ands r1, r0
	orrs r4, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _080039F0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8002B2C
	b _08003A14
	.align 2, 0
_080039EC: .4byte gMain
_080039F0:
	mov r1, r8
	lsls r0, r1, #0x10
	cmp r0, #0
	bgt _08003A14
	adds r1, r7, #0
	adds r1, #0x4f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08003A0C
	movs r0, #0x14
	strb r0, [r1]
_08003A0C:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8002A24
_08003A14:
	adds r1, r7, #0
	adds r1, #0x50
	ldrh r0, [r1]
	cmp r0, #0
	beq _08003A2E
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldrh r1, [r1]
	cmp r0, r1
	bgt _08003A2E
	movs r0, #0
	mov r6, sb
	strb r0, [r6]
_08003A2E:
	movs r1, #0
	ldrsb r1, [r5, r1]
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_8012C90
	b _08003AF4
_08003A3C:
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	beq _08003AF4
	adds r0, r7, #0
	adds r0, #0x4d
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08003A58
_08003A52:
	mov r0, sb
	strb r2, [r0]
	b _08003B0A
_08003A58:
	adds r3, r7, #0
	adds r3, #0x42
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r3]
	adds r0, r1, r0
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldrh r1, [r2]
	adds r0, r1, r0
	strh r0, [r2]
	ldrh r1, [r7, #0x34]
	lsls r0, r1, #3
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #4
	ands r0, r1
	movs r4, #0xf0
	adds r6, r2, #0
	cmp r0, #0
	beq _08003A8C
	adds r4, #0x50
_08003A8C:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ands r1, r0
	orrs r4, r1
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #7
	ble _08003AA6
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8002D4C
	b _08003ACE
_08003AA6:
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsrs r0, r4, #1
	cmp r1, r0
	bls _08003ACE
	adds r1, r7, #0
	adds r1, #0x4f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	ble _08003AC6
	movs r0, #0
	strb r0, [r1]
_08003AC6:
	lsls r1, r4, #1
	adds r0, r7, #0
	bl sub_8002C54
_08003ACE:
	adds r1, r7, #0
	adds r1, #0x50
	ldrh r0, [r1]
	cmp r0, #0
	beq _08003AE8
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldrh r1, [r1]
	cmp r0, r1
	blt _08003AE8
	movs r0, #0
	mov r6, sb
	strb r0, [r6]
_08003AE8:
	movs r1, #0
	ldrsb r1, [r5, r1]
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_8012C90
_08003AF4:
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r0, #8
	ldr r1, _08003B1C @ =gIORegisters
	strh r0, [r1, #0x16]
	adds r0, r7, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r0, #8
_08003B08:
	strh r0, [r1, #0x14]
_08003B0A:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B1C: .4byte gIORegisters

	thumb_func_start DecompressCurrentBGStripe
DecompressCurrentBGStripe: @ 0x08003B20
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, _08003B40 @ =0xFFFF7FFF
	ands r1, r0
	cmp r1, #0x81
	bne _08003B48
	ldr r2, _08003B44 @ =gMain
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xb
	strb r0, [r1]
	movs r1, #0x38
	ldrsh r0, [r2, r1]
	bl UpdateAnimations
	b _08003D50
	.align 2, 0
_08003B40: .4byte 0xFFFF7FFF
_08003B44: .4byte gMain
_08003B48:
	ldr r0, _08003BB0 @ =gUnknown_08023B98
	lsls r1, r1, #3
	adds r0, r1, r0
	ldr r4, [r0]
	ldr r2, _08003BB4 @ =gMain
	adds r0, r2, #0
	adds r0, #0x3c
	adds r5, r1, #0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08003B78
	adds r1, r4, #0
	movs r6, #1
	adds r2, #0x5c
_08003B64:
	ldm r1!, {r0}
	stm r2!, {r0}
	adds r6, #1
	cmp r6, #0xa
	bls _08003B64
	ldr r0, _08003BB4 @ =gMain
	movs r1, #0x38
	ldrsh r0, [r0, r1]
	bl UpdateAnimations
_08003B78:
	ldr r2, _08003BB4 @ =gMain
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x58
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, _08003BB0 @ =gUnknown_08023B98
	adds r0, #4
	adds r0, r5, r0
	ldr r3, [r0]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _08003BC4
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08003BB8
	movs r6, #0xb4
	lsls r6, r6, #5
	b _08003BC8
	.align 2, 0
_08003BB0: .4byte gUnknown_08023B98
_08003BB4: .4byte gMain
_08003BB8:
	movs r0, #4
	ands r0, r3
	movs r6, #0xf0
	lsls r6, r6, #4
	cmp r0, #0
	beq _08003BC8
_08003BC4:
	movs r6, #0xf0
	lsls r6, r6, #5
_08003BC8:
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #8
	bhi _08003C18
	lsls r0, r0, #2
	ldr r1, _08003BE0 @ =_08003BE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003BE0: .4byte _08003BE4
_08003BE4: @ jump table
	.4byte _08003C08 @ case 0
	.4byte _08003C08 @ case 1
	.4byte _08003C0E @ case 2
	.4byte _08003C0E @ case 3
	.4byte _08003C0E @ case 4
	.4byte _08003C08 @ case 5
	.4byte _08003C08 @ case 6
	.4byte _08003C18 @ case 7
	.4byte _08003C14 @ case 8
_08003C08:
	movs r6, #0xf0
	lsls r6, r6, #5
	b _08003C18
_08003C0E:
	movs r6, #0xf0
	lsls r6, r6, #4
	b _08003C18
_08003C14:
	movs r6, #0xb4
	lsls r6, r6, #5
_08003C18:
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r3
	cmp r1, #0
	beq _08003C24
	lsrs r6, r6, #1
_08003C24:
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	bne _08003CBC
	cmp r1, #0
	beq _08003C36
	adds r4, #0x20
	b _08003C3C
_08003C36:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r4, r4, r0
_08003C3C:
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08003C80
	lsls r0, r0, #2
	ldr r1, _08003C54 @ =_08003C58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003C54: .4byte _08003C58
_08003C58: @ jump table
	.4byte _08003C80 @ case 0
	.4byte _08003C80 @ case 1
	.4byte _08003C88 @ case 2
	.4byte _08003C94 @ case 3
	.4byte _08003C9C @ case 4
	.4byte _08003CAC @ case 5
	.4byte _08003CB4 @ case 6
	.4byte _08003C80 @ case 7
	.4byte _08003C80 @ case 8
	.4byte _08003C80 @ case 9
_08003C80:
	ldr r0, _08003C84 @ =gUnknown_0202CFC0
	b _08003CC0
	.align 2, 0
_08003C84: .4byte gUnknown_0202CFC0
_08003C88:
	lsrs r0, r6, #2
	ldr r1, _08003C90 @ =gUnknown_0202CFC0
	adds r0, r0, r1
	b _08003CC0
	.align 2, 0
_08003C90: .4byte gUnknown_0202CFC0
_08003C94:
	ldr r0, _08003C98 @ =gUnknown_0202CFC0
	b _08003CC0
	.align 2, 0
_08003C98: .4byte gUnknown_0202CFC0
_08003C9C:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08003CA8 @ =gUnknown_0202CFC0
	adds r0, r0, r1
	b _08003CC0
	.align 2, 0
_08003CA8: .4byte gUnknown_0202CFC0
_08003CAC:
	ldr r0, _08003CB0 @ =gUnknown_020365C0
	b _08003CC0
	.align 2, 0
_08003CB0: .4byte gUnknown_020365C0
_08003CB4:
	ldr r0, _08003CB8 @ =gUnknown_0202D740
	b _08003CC0
	.align 2, 0
_08003CB8: .4byte gUnknown_0202D740
_08003CBC:
	ldr r0, [r2, #0x54]
	adds r0, r0, r6
_08003CC0:
	str r0, [r2, #0x54]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #7
	bhi _08003D3C
	lsls r0, r0, #2
	ldr r1, _08003CD8 @ =_08003CDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003CD8: .4byte _08003CDC
_08003CDC: @ jump table
	.4byte _08003D3C @ case 0
	.4byte _08003CFC @ case 1
	.4byte _08003CFC @ case 2
	.4byte _08003D3C @ case 3
	.4byte _08003D3C @ case 4
	.4byte _08003D3C @ case 5
	.4byte _08003CFC @ case 6
	.4byte _08003D3C @ case 7
_08003CFC:
	ldr r5, _08003D30 @ =gUnknown_0202B1C0
	adds r0, r4, #0
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, _08003D34 @ =gMain
	ldr r4, [r0, #0x54]
	ldr r1, _08003D38 @ =0x040000D4
	str r5, [r1]
	str r4, [r1, #4]
	lsrs r2, r6, #3
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	lsrs r0, r6, #1
	adds r4, r4, r0
	lsrs r0, r6, #2
	adds r5, r0, r5
	str r5, [r1]
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	b _08003D46
	.align 2, 0
_08003D30: .4byte gUnknown_0202B1C0
_08003D34: .4byte gMain
_08003D38: .4byte 0x040000D4
_08003D3C:
	ldr r0, _08003D58 @ =gMain
	ldr r1, [r0, #0x54]
	adds r0, r4, #0
	bl LZ77UnCompWram
_08003D46:
	ldr r0, _08003D58 @ =gMain
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
_08003D50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003D58: .4byte gMain

	thumb_func_start sub_8003D5C
sub_8003D5C: @ 0x08003D5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _08003DB4 @ =gMain
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	bl UpdateAnimations
	ldr r0, _08003DB8 @ =0xFFFF7FFF
	ands r5, r0
	cmp r5, #0x81
	bne _08003D78
	b _08003F72
_08003D78:
	ldr r0, _08003DBC @ =gUnknown_08023B98
	lsls r2, r5, #3
	adds r1, r2, r0
	ldr r5, [r1]
	adds r1, r5, #0
	movs r6, #1
	adds r3, r0, #0
	mov r8, r2
	adds r2, r4, #0
	adds r2, #0x5c
_08003D8C:
	ldm r1!, {r0}
	stm r2!, {r0}
	adds r6, #1
	cmp r6, #0xa
	bls _08003D8C
	adds r0, r3, #4
	add r0, r8
	ldr r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08003DCC
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08003DC0
	movs r7, #0xb4
	lsls r7, r7, #5
	b _08003DD0
	.align 2, 0
_08003DB4: .4byte gMain
_08003DB8: .4byte 0xFFFF7FFF
_08003DBC: .4byte gUnknown_08023B98
_08003DC0:
	movs r0, #4
	ands r0, r2
	movs r7, #0xf0
	lsls r7, r7, #4
	cmp r0, #0
	beq _08003DD0
_08003DCC:
	movs r7, #0xf0
	lsls r7, r7, #5
_08003DD0:
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #5
	bhi _08003E14
	lsls r0, r0, #2
	ldr r1, _08003DE8 @ =_08003DEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003DE8: .4byte _08003DEC
_08003DEC: @ jump table
	.4byte _08003E04 @ case 0
	.4byte _08003E04 @ case 1
	.4byte _08003E0A @ case 2
	.4byte _08003E0A @ case 3
	.4byte _08003E0A @ case 4
	.4byte _08003E10 @ case 5
_08003E04:
	movs r7, #0xf0
	lsls r7, r7, #5
	b _08003E14
_08003E0A:
	movs r7, #0xf0
	lsls r7, r7, #4
	b _08003E14
_08003E10:
	movs r7, #0xb4
	lsls r7, r7, #5
_08003E14:
	cmp r2, #0
	bge _08003E1E
	lsrs r7, r7, #1
	adds r5, #0x20
	b _08003E24
_08003E1E:
	movs r2, #0x80
	lsls r2, r2, #2
	adds r5, r5, r2
_08003E24:
	ldr r0, [r4, #0x5c]
	adds r5, r5, r0
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08003EB4
	ldrb r0, [r1]
	subs r0, #1
	cmp r0, #8
	bhi _08003EB8
	lsls r0, r0, #2
	ldr r1, _08003E48 @ =_08003E4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003E48: .4byte _08003E4C
_08003E4C: @ jump table
	.4byte _08003E7C @ case 0
	.4byte _08003E70 @ case 1
	.4byte _08003E7C @ case 2
	.4byte _08003E8C @ case 3
	.4byte _08003EA4 @ case 4
	.4byte _08003E7C @ case 5
	.4byte _08003EB8 @ case 6
	.4byte _08003E7C @ case 7
	.4byte _08003E7C @ case 8
_08003E70:
	ldr r1, _08003E78 @ =gMain
	lsrs r0, r7, #2
	b _08003E94
	.align 2, 0
_08003E78: .4byte gMain
_08003E7C:
	ldr r1, _08003E84 @ =gMain
	ldr r0, _08003E88 @ =gUnknown_0202CFC0
	str r0, [r1, #0x54]
	b _08003EB8
	.align 2, 0
_08003E84: .4byte gMain
_08003E88: .4byte gUnknown_0202CFC0
_08003E8C:
	ldr r1, _08003E9C @ =gMain
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #1
_08003E94:
	ldr r2, _08003EA0 @ =gUnknown_0202CFC0
	adds r0, r0, r2
	str r0, [r1, #0x54]
	b _08003EB8
	.align 2, 0
_08003E9C: .4byte gMain
_08003EA0: .4byte gUnknown_0202CFC0
_08003EA4:
	ldr r1, _08003EAC @ =gMain
	ldr r0, _08003EB0 @ =gUnknown_020365C0
	str r0, [r1, #0x54]
	b _08003EB8
	.align 2, 0
_08003EAC: .4byte gMain
_08003EB0: .4byte gUnknown_020365C0
_08003EB4:
	ldr r0, _08003EF4 @ =gUnknown_0202CFC0
	str r0, [r4, #0x54]
_08003EB8:
	bl m4aSoundVSyncOff
	movs r6, #1
_08003EBE:
	ldr r4, _08003EF8 @ =gMain
	cmp r6, #1
	bls _08003EDC
	ldr r0, [r4, #0x54]
	adds r0, r0, r7
	str r0, [r4, #0x54]
	ldr r0, _08003EFC @ =gUnknown_08023B98
	add r0, r8
	ldr r5, [r0]
	lsls r0, r6, #2
	adds r1, r4, #0
	adds r1, #0x58
	adds r0, r0, r1
	ldr r0, [r0]
	adds r5, r5, r0
_08003EDC:
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #6
	bhi _08003F60
	lsls r0, r0, #2
	ldr r1, _08003F00 @ =_08003F04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003EF4: .4byte gUnknown_0202CFC0
_08003EF8: .4byte gMain
_08003EFC: .4byte gUnknown_08023B98
_08003F00: .4byte _08003F04
_08003F04: @ jump table
	.4byte _08003F60 @ case 0
	.4byte _08003F20 @ case 1
	.4byte _08003F20 @ case 2
	.4byte _08003F60 @ case 3
	.4byte _08003F60 @ case 4
	.4byte _08003F60 @ case 5
	.4byte _08003F20 @ case 6
_08003F20:
	ldr r4, _08003F54 @ =gUnknown_020010D4
	adds r0, r5, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08003F58 @ =gMain
	ldr r5, [r0, #0x54]
	ldr r1, _08003F5C @ =0x040000D4
	str r4, [r1]
	str r5, [r1, #4]
	lsrs r2, r7, #3
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	lsrs r0, r7, #1
	adds r5, r5, r0
	lsrs r0, r7, #2
	adds r4, r0, r4
	str r4, [r1]
	str r5, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	b _08003F68
	.align 2, 0
_08003F54: .4byte gUnknown_020010D4
_08003F58: .4byte gMain
_08003F5C: .4byte 0x040000D4
_08003F60:
	ldr r1, [r4, #0x54]
	adds r0, r5, #0
	bl LZ77UnCompWram
_08003F68:
	adds r6, #1
	cmp r6, #0xa
	bls _08003EBE
	bl m4aSoundVSyncOn
_08003F72:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8003F7C
sub_8003F7C: @ 0x08003F7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08003FA2
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08003FCC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08003FD0 @ =gUnknown_03002FA0
	str r0, [r1, #4]
	ldr r0, _08003FD4 @ =0x81000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08003FA2:
	ldr r2, _08003FD8 @ =gUnknown_030033A4
	adds r2, #0x40
	movs r4, #0
	movs r1, #0
	ldr r7, _08003FDC @ =gIORegisters
	ldr r0, _08003FE0 @ =gMain
	mov ip, r0
	movs r0, #0x80
	lsls r0, r0, #6
	mov r8, r0
_08003FB6:
	movs r0, #0
	adds r5, r4, #1
	adds r6, r1, #1
	adds r1, r4, #0
	adds r1, #0x80
	mov r4, r8
	orrs r1, r4
_08003FC4:
	cmp r3, #0
	beq _08003FE4
	strh r1, [r2]
	b _08003FE6
	.align 2, 0
_08003FCC: .4byte 0x040000D4
_08003FD0: .4byte gUnknown_03002FA0
_08003FD4: .4byte 0x81000400
_08003FD8: .4byte gUnknown_030033A4
_08003FDC: .4byte gIORegisters
_08003FE0: .4byte gMain
_08003FE4:
	strh r3, [r2]
_08003FE6:
	adds r2, #2
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x19
	bls _08003FC4
	adds r2, #0xc
	lsls r0, r5, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #2
	bls _08003FB6
	cmp r3, #0
	beq _08004054
	ldr r1, _08004040 @ =0x040000D4
	ldr r0, _08004044 @ =gGfxDetentionCenterBottomTiles
	str r0, [r1]
	ldr r0, _08004048 @ =0x06001000
	str r0, [r1, #4]
	ldr r0, _0800404C @ =0x80000030
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08004050 @ =0x0000FFFC
	ldrh r1, [r7]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r7]
	adds r1, r7, #0
	adds r1, #0x4a
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r4, [r1]
	orrs r0, r4
	strh r0, [r1]
	movs r0, #1
	mov r1, ip
	ldrb r1, [r1, #0x1a]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x1a]
	b _0800406C
	.align 2, 0
_08004040: .4byte 0x040000D4
_08004044: .4byte gGfxDetentionCenterBottomTiles
_08004048: .4byte 0x06001000
_0800404C: .4byte 0x80000030
_08004050: .4byte 0x0000FFFC
_08004054:
	movs r0, #0xfe
	mov r4, ip
	ldrb r4, [r4, #0x1a]
	ands r0, r4
	mov r1, ip
	strb r0, [r1, #0x1a]
	adds r1, r7, #0
	adds r1, #0x4a
	ldr r0, _08004078 @ =0x0000FEFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
_0800406C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004078: .4byte 0x0000FEFF

	thumb_func_start sub_800407C
sub_800407C: @ 0x0800407C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r7, r0, #0
	ldr r0, _080040A0 @ =gIORegisters
	mov r8, r0
	ldr r0, _080040A4 @ =gUnknown_03000800
	adds r0, #0x52
	ldrb r0, [r0]
	subs r0, #0x24
	cmp r0, #4
	bhi _080040E0
	lsls r0, r0, #2
	ldr r1, _080040A8 @ =_080040AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080040A0: .4byte gIORegisters
_080040A4: .4byte gUnknown_03000800
_080040A8: .4byte _080040AC
_080040AC: @ jump table
	.4byte _080040E0 @ case 0
	.4byte _080040D8 @ case 1
	.4byte _080040E0 @ case 2
	.4byte _080040C0 @ case 3
	.4byte _080040CC @ case 4
_080040C0:
	movs r4, #0
	ldr r6, _080040C8 @ =0x050001E0
	b _080040E4
	.align 2, 0
_080040C8: .4byte 0x050001E0
_080040CC:
	movs r4, #0
	ldr r6, _080040D4 @ =0x050001A0
	b _080040E4
	.align 2, 0
_080040D4: .4byte 0x050001A0
_080040D8:
	ldr r4, _080040DC @ =gUnknown_08206BF0
	b _080040E2
	.align 2, 0
_080040DC: .4byte gUnknown_08206BF0
_080040E0:
	movs r4, #0
_080040E2:
	ldr r6, _08004138 @ =0x050001C0
_080040E4:
	ldr r2, _0800413C @ =0x040000D4
	str r4, [r2]
	str r6, [r2, #4]
	ldr r3, _08004140 @ =0x80000010
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08004144 @ =gMain
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08004148
	str r4, [r2]
	mov r1, sp
	str r1, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	movs r5, #0
_0800410A:
	lsls r0, r5, #1
	mov r3, sp
	adds r4, r3, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0800410A
	ldr r0, _0800413C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r6, [r0, #4]
	ldr r1, _08004140 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _08004150
	.align 2, 0
_08004138: .4byte 0x050001C0
_0800413C: .4byte 0x040000D4
_08004140: .4byte 0x80000010
_08004144: .4byte gMain
_08004148:
	str r4, [r2]
	str r6, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
_08004150:
	ldr r2, _0800418C @ =0x040000D4
	ldr r0, _08004190 @ =gGfxSpeedlinesFirstAndLastColumns
	str r0, [r2]
	ldr r1, _08004194 @ =gUnknown_0203B000
	str r1, [r2, #4]
	ldr r0, _08004198 @ =0x80000280
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r4, r1, #0
	ldr r6, _0800419C @ =0x06008B00
	str r4, [r2]
	str r6, [r2, #4]
	ldr r0, _080041A0 @ =0x80002800
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r4, _080041A4 @ =gUnknown_03000000
	ldr r6, _080041A8 @ =0x0600F000
	str r4, [r2]
	str r6, [r2, #4]
	ldr r0, _080041AC @ =0x800002C0
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _080041B0 @ =0x0400000C
	mov r3, r8
	ldrh r0, [r3, #4]
	strh r0, [r1]
	cmp r7, #0x81
	beq _080041B4
	movs r0, #0
	b _080041F0
	.align 2, 0
_0800418C: .4byte 0x040000D4
_08004190: .4byte gGfxSpeedlinesFirstAndLastColumns
_08004194: .4byte gUnknown_0203B000
_08004198: .4byte 0x80000280
_0800419C: .4byte 0x06008B00
_080041A0: .4byte 0x80002800
_080041A4: .4byte gUnknown_03000000
_080041A8: .4byte 0x0600F000
_080041AC: .4byte 0x800002C0
_080041B0: .4byte 0x0400000C
_080041B4:
	ldr r1, _080041FC @ =0x0400000E
	ldr r0, _08004200 @ =0x0000FF7F
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	add r1, sp, #0x20
	ldr r3, _08004204 @ =0x00002222
	adds r0, r3, #0
	strh r0, [r1]
	str r1, [r2]
	ldr r0, _08004208 @ =0x06004000
	str r0, [r2, #4]
	ldr r0, _0800420C @ =0x81000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r6, _08004210 @ =0x0600F800
	movs r0, #0
	strh r0, [r1]
	str r1, [r2]
	str r6, [r2, #4]
	ldr r0, _08004214 @ =0x81000400
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	bl MoveAnimationTilesToRam
	bl MoveSpritesToOAM
	movs r0, #1
	rsbs r0, r0, #0
_080041F0:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080041FC: .4byte 0x0400000E
_08004200: .4byte 0x0000FF7F
_08004204: .4byte 0x00002222
_08004208: .4byte 0x06004000
_0800420C: .4byte 0x81000010
_08004210: .4byte 0x0600F800
_08004214: .4byte 0x81000400

	thumb_func_start sub_8004218
sub_8004218: @ 0x08004218
	push {r4, lr}
	ldr r4, _08004234 @ =gScriptContext
	cmp r0, #1
	beq _080042C2
	cmp r0, #2
	bne _08004238
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
	b _080042E0
	.align 2, 0
_08004234: .4byte gScriptContext
_08004238:
	cmp r0, #3
	beq _080042B2
	cmp r0, #0x81
	bne _080042FE
	ldr r2, _08004264 @ =gUnknown_03000800
	ldr r0, [r2, #0x44]
	movs r1, #0xc0
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, r1
	bne _080042FE
	adds r0, r2, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #7
	beq _0800426E
	cmp r0, #7
	bgt _08004268
	cmp r0, #3
	beq _0800426E
	b _0800428E
	.align 2, 0
_08004264: .4byte gUnknown_03000800
_08004268:
	cmp r0, #0x11
	beq _0800427E
	b _0800428E
_0800426E:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08004312
_0800427E:
	bl sub_800B974
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
	b _08004312
_0800428E:
	ldr r0, _080042A8 @ =0x0000FFFF
	ldrh r1, [r4, #0x3e]
	cmp r1, r0
	bne _080042E8
	ldrh r0, [r4, #0x3c]
	cmp r0, #1
	beq _080042C2
	cmp r0, #1
	bgt _080042AC
	cmp r0, #0
	beq _080042B2
	b _080042E0
	.align 2, 0
_080042A8: .4byte 0x0000FFFF
_080042AC:
	cmp r0, #2
	beq _080042D2
	b _080042E0
_080042B2:
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _080042E0
_080042C2:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _080042E0
_080042D2:
	bl sub_800B974
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
_080042E0:
	movs r0, #0
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3e]
	b _08004312
_080042E8:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800B898
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800BA40
	b _08004312
_080042FE:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800B898
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800BA40
_08004312:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8004318
sub_8004318: @ 0x08004318
	sub sp, #4
	ldr r1, _0800433C @ =gMain
	ldr r0, _08004340 @ =gUnknown_080248F8
	ldr r2, _08004344 @ =gUnknown_03001080
	ldr r3, _08004348 @ =0x040000D4
	str r0, [r3]
	str r2, [r3, #4]
	ldr r0, _0800434C @ =0x800002C0
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	adds r1, #0x90
	ldr r0, _08004350 @ =0x0000FFFE
	ldrh r1, [r1]
	cmp r1, r0
	bne _08004354
	mov r1, sp
	movs r0, #0x1f
	b _08004358
	.align 2, 0
_0800433C: .4byte gMain
_08004340: .4byte gUnknown_080248F8
_08004344: .4byte gUnknown_03001080
_08004348: .4byte 0x040000D4
_0800434C: .4byte 0x800002C0
_08004350: .4byte 0x0000FFFE
_08004354:
	mov r1, sp
	movs r0, #0
_08004358:
	strh r0, [r1]
	str r1, [r3]
	ldr r0, _0800437C @ =0x05000040
	str r0, [r3, #4]
	ldr r0, _08004380 @ =0x810000E0
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08004384 @ =0x00002222
	adds r0, r2, #0
	strh r0, [r1]
	str r1, [r3]
	ldr r0, _08004388 @ =0x06004000
	str r0, [r3, #4]
	ldr r0, _0800438C @ =0x81004B00
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0800437C: .4byte 0x05000040
_08004380: .4byte 0x810000E0
_08004384: .4byte 0x00002222
_08004388: .4byte 0x06004000
_0800438C: .4byte 0x81004B00

	thumb_func_start sub_8004390
sub_8004390: @ 0x08004390
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	ldr r0, _08004424 @ =gMain
	mov ip, r0
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	bne _080044A4
	ldr r3, _08004428 @ =gUnknown_080248F8
	ldr r5, _0800442C @ =gUnknown_03001080
	ldr r2, _08004430 @ =0x040000D4
	str r3, [r2]
	str r5, [r2, #4]
	ldr r0, _08004434 @ =0x800002C0
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r4
	mov sl, r5
	cmp r1, #0
	beq _08004444
	movs r2, #0x96
	lsls r2, r2, #2
	movs r3, #0
	mov r1, ip
	adds r1, #0x3e
	movs r4, #0x80
	lsls r4, r4, #6
	adds r7, r4, #0
	adds r4, r5, #0
	adds r4, #0x7e
_080043DE:
	adds r0, r2, #0
	orrs r0, r7
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #1
	adds r2, #1
	cmp r3, #0x13
	bls _080043DE
	movs r3, #0
	ldr r0, _0800442C @ =gUnknown_03001080
	movs r4, #0x80
	lsls r4, r4, #6
	adds r5, r4, #0
	movs r7, #0
	adds r4, r0, #0
	adds r4, #0x40
_080043FE:
	adds r0, r2, #0
	orrs r0, r5
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #1
	adds r2, #1
	cmp r3, #0x13
	bls _080043FE
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08004430 @ =0x040000D4
	ldr r0, _08004438 @ =gGfxSpeedlinesFirstAndLastColumns
	str r0, [r1]
	ldr r0, _0800443C @ =gUnknown_0203B000
	str r0, [r1, #4]
	ldr r0, _08004440 @ =0x80000280
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800445C
	.align 2, 0
_08004424: .4byte gMain
_08004428: .4byte gUnknown_080248F8
_0800442C: .4byte gUnknown_03001080
_08004430: .4byte 0x040000D4
_08004434: .4byte 0x800002C0
_08004438: .4byte gGfxSpeedlinesFirstAndLastColumns
_0800443C: .4byte gUnknown_0203B000
_08004440: .4byte 0x80000280
_08004444:
	mov r0, sp
	strh r1, [r0]
	str r0, [r2]
	ldr r0, _0800448C @ =0x00009D80
	mov r7, r8
	asrs r0, r7
	ldr r1, _08004490 @ =0x06004000
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08004494 @ =0x81000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0800445C:
	mov r3, sl
	ldr r5, _08004498 @ =0x0600F800
	ldr r2, _0800449C @ =0x040000D4
	str r3, [r2]
	str r5, [r2, #4]
	ldr r0, _080044A0 @ =0x80000400
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	str r6, [r2]
	ldr r0, _08004490 @ =0x06004000
	str r0, [r2, #4]
	movs r0, #0x96
	lsls r0, r0, #8
	mov r4, r8
	asrs r0, r4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _080047FA
	.align 2, 0
_0800448C: .4byte 0x00009D80
_08004490: .4byte 0x06004000
_08004494: .4byte 0x81000020
_08004498: .4byte 0x0600F800
_0800449C: .4byte 0x040000D4
_080044A0: .4byte 0x80000400
_080044A4:
	movs r0, #0xc
	ands r0, r4
	cmp r0, #0
	bne _080044AE
	b _08004670
_080044AE:
	movs r3, #0x40
	ands r3, r4
	cmp r3, #0
	beq _08004590
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _080044D8
	movs r0, #0x96
	lsls r0, r0, #8
	mov r7, r8
	asrs r0, r7
	adds r6, r6, r0
	mov r1, ip
	adds r1, #0x4e
	movs r0, #0x12
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x46
	movs r0, #0xa0
	b _080044F0
_080044D8:
	movs r0, #0x96
	lsls r0, r0, #7
	mov r1, r8
	asrs r0, r1
	subs r6, r6, r0
	mov r1, ip
	adds r1, #0x4e
	movs r0, #8
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x46
	movs r0, #0x50
_080044F0:
	strh r0, [r2]
	ldr r3, _08004580 @ =0x040000D4
	str r6, [r3]
	ldr r5, _08004584 @ =0x06004000
	str r5, [r3, #4]
	movs r2, #0x96
	lsls r2, r2, #8
	mov r4, r8
	asrs r2, r4
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	movs r4, #0x80
	lsls r4, r4, #0x18
	orrs r0, r4
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	mov r7, r8
	asrs r0, r7
	ldr r1, _08004588 @ =gUnknown_0202CFC0
	adds r6, r0, r1
	movs r0, #0xf0
	lsls r0, r0, #3
	asrs r0, r7
	adds r6, r6, r0
	str r6, [r3]
	adds r2, r2, r5
	str r2, [r3, #4]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	orrs r0, r4
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	mov r1, ip
	adds r1, #0x4f
	movs r0, #0x13
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #0x26
	strb r0, [r1]
	movs r3, #0
	ldr r2, _0800458C @ =gUnknown_03001080
	mov sl, r2
	mov r7, sl
	movs r5, #0
	movs r4, #0x80
	lsls r4, r4, #6
	adds r6, r4, #0
_0800455E:
	movs r2, #0
	adds r4, r5, #0
	lsls r0, r3, #6
	adds r0, #0x42
	adds r1, r0, r7
_08004568:
	adds r0, r2, r4
	orrs r0, r6
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x1d
	bls _08004568
	adds r5, #0x1e
	adds r3, #1
	cmp r3, #0x13
	bls _0800455E
	b _08004614
	.align 2, 0
_08004580: .4byte 0x040000D4
_08004584: .4byte 0x06004000
_08004588: .4byte gUnknown_0202CFC0
_0800458C: .4byte gUnknown_03001080
_08004590:
	ldr r2, _080045D0 @ =0x040000D4
	str r6, [r2]
	ldr r0, _080045D4 @ =0x06004000
	str r0, [r2, #4]
	ldr r0, _080045D8 @ =0x00009D80
	mov r1, r8
	asrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	adds r1, #0x46
	movs r0, #0
	strh r3, [r1]
	adds r1, #9
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x15
	strb r0, [r1]
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _080045DC
	subs r1, #0xf
	movs r0, #1
	b _080045E2
	.align 2, 0
_080045D0: .4byte 0x040000D4
_080045D4: .4byte 0x06004000
_080045D8: .4byte 0x00009D80
_080045DC:
	mov r1, ip
	adds r1, #0x3f
	movs r0, #0x20
_080045E2:
	strb r0, [r1]
	movs r3, #0
	ldr r2, _08004660 @ =gUnknown_03001080
	mov sl, r2
	mov r7, sl
	movs r5, #0
	movs r4, #0x80
	lsls r4, r4, #6
	adds r6, r4, #0
_080045F4:
	movs r2, #0
	adds r4, r5, #0
	lsls r0, r3, #6
	adds r0, #0x42
	adds r1, r0, r7
_080045FE:
	adds r0, r2, r4
	orrs r0, r6
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x1d
	bls _080045FE
	adds r5, #0x1e
	adds r3, #1
	cmp r3, #0x13
	bls _080045F4
_08004614:
	movs r3, #0
	ldr r7, _08004660 @ =gUnknown_03001080
	movs r1, #0x96
	lsls r1, r1, #2
	adds r6, r1, #0
	movs r2, #0x80
	lsls r2, r2, #6
	adds r5, r2, #0
_08004624:
	movs r2, #0
	adds r4, r3, #1
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r0, #1
	lsls r0, r0, #1
	adds r1, r0, r7
_08004638:
	adds r0, r2, r6
	orrs r0, r5
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x1d
	bls _08004638
	adds r3, r4, #0
	cmp r3, #1
	bls _08004624
	mov r3, sl
	ldr r5, _08004664 @ =0x0600F800
	ldr r0, _08004668 @ =0x040000D4
	str r3, [r0]
	str r5, [r0, #4]
	ldr r1, _0800466C @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _080047FA
	.align 2, 0
_08004660: .4byte gUnknown_03001080
_08004664: .4byte 0x0600F800
_08004668: .4byte 0x040000D4
_0800466C: .4byte 0x80000400
_08004670:
	movs r7, #1
	adds r2, r4, #0
	ands r2, r7
	movs r5, #0xb4
	lsls r5, r5, #4
	cmp r2, #0
	beq _08004682
	movs r5, #0xf0
	lsls r5, r5, #4
_08004682:
	movs r3, #0x10
	ands r3, r4
	cmp r3, #0
	beq _08004708
	mov r1, ip
	adds r1, #0x4f
	movs r0, #0x1e
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #0x3a
	strb r0, [r1]
	cmp r2, #0
	beq _080046B2
	movs r0, #0xe8
	lsls r0, r0, #3
	mov r7, r8
	asrs r0, r7
	adds r6, r6, r0
	adds r1, #0xf
	movs r0, #0x1c
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0xf0
	b _080046C8
_080046B2:
	movs r0, #0xe0
	lsls r0, r0, #2
	mov r1, r8
	asrs r0, r1
	adds r6, r6, r0
	mov r1, ip
	adds r1, #0x4e
	movs r0, #0xd
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0x78
_080046C8:
	strh r0, [r1]
	movs r3, #0
	ldr r2, _08004704 @ =gUnknown_03001080
	mov sl, r2
	mov r4, r8
	lsrs r5, r4
	mov sb, r5
	mov ip, sl
	movs r5, #0
_080046DA:
	movs r2, #0
	adds r4, r5, #0
	lsls r0, r3, #6
	adds r0, #0x40
	mov r7, ip
	adds r1, r0, r7
_080046E6:
	adds r0, r2, r4
	movs r7, #0x80
	lsls r7, r7, #6
	orrs r0, r7
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x1e
	bls _080046E6
	adds r5, #0x1f
	adds r3, #1
	cmp r3, #0x13
	bls _080046DA
	b _0800477E
	.align 2, 0
_08004704: .4byte gUnknown_03001080
_08004708:
	movs r0, #0x20
	ands r0, r4
	ldr r1, _0800473C @ =gUnknown_03001080
	mov sl, r1
	mov sb, r5
	mov r4, sb
	mov r1, r8
	lsrs r4, r1
	mov sb, r4
	cmp r0, #0
	beq _0800477E
	mov r1, ip
	adds r1, #0x4e
	movs r0, #0x1f
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strh r3, [r0]
	adds r0, #0xb
	strb r1, [r0]
	cmp r2, #0
	beq _08004740
	subs r0, #0x10
	strb r7, [r0]
	b _08004748
	.align 2, 0
_0800473C: .4byte gUnknown_03001080
_08004740:
	mov r1, ip
	adds r1, #0x3f
	movs r0, #0x2e
	strb r0, [r1]
_08004748:
	movs r3, #0
	ldr r2, _0800480C @ =gUnknown_03001080
	mov sl, r2
	mov r4, r8
	lsrs r5, r4
	mov sb, r5
	mov ip, sl
	movs r5, #0
_08004758:
	movs r2, #0
	adds r4, r5, #0
	lsls r0, r3, #6
	adds r0, #0x42
	mov r7, ip
	adds r1, r0, r7
_08004764:
	adds r0, r2, r4
	movs r7, #0x80
	lsls r7, r7, #6
	orrs r0, r7
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x1e
	bls _08004764
	adds r5, #0x1f
	adds r3, #1
	cmp r3, #0x13
	bls _08004758
_0800477E:
	movs r3, #0
	ldr r5, _0800480C @ =gUnknown_03001080
	ldr r4, _08004810 @ =0x00002276
	movs r1, #0
_08004786:
	movs r2, #0
	lsls r0, r1, #1
	adds r0, r0, r5
_0800478C:
	strh r4, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, #0x1f
	bls _0800478C
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r3, #1
	cmp r3, #1
	bls _08004786
	ldr r4, _08004814 @ =0x06004000
	movs r3, #0
	ldr r2, _08004818 @ =0x040000D4
	movs r5, #0xf8
	lsls r5, r5, #3
	mov r1, r8
	asrs r5, r1
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r1, r0, #1
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r1, r0
	mov r7, sb
_080047BE:
	str r6, [r2]
	str r4, [r2, #4]
	str r1, [r2, #8]
	ldr r0, [r2, #8]
	adds r6, r6, r7
	adds r4, r4, r5
	adds r3, #1
	cmp r3, #0x13
	bls _080047BE
	mov r3, sl
	ldr r5, _0800481C @ =0x0600F800
	ldr r1, _08004818 @ =0x040000D4
	str r3, [r1]
	str r5, [r1, #4]
	ldr r0, _08004820 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r2, sp
	movs r0, #0
	strh r0, [r2]
	str r2, [r1]
	ldr r0, _08004824 @ =0x00009D80
	mov r2, r8
	asrs r0, r2
	ldr r4, _08004814 @ =0x06004000
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, _08004828 @ =0x81000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080047FA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800480C: .4byte gUnknown_03001080
_08004810: .4byte 0x00002276
_08004814: .4byte 0x06004000
_08004818: .4byte 0x040000D4
_0800481C: .4byte 0x0600F800
_08004820: .4byte 0x80000400
_08004824: .4byte 0x00009D80
_08004828: .4byte 0x81000020

	thumb_func_start sub_800482C
sub_800482C: @ 0x0800482C
	push {r4, r5, lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, _08004860 @ =gMain
	ldr r5, _08004864 @ =gScriptContext
	movs r0, #4
	ldrh r3, [r5, #0x1e]
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080048A8
	movs r0, #0xfb
	ldrb r3, [r2, #0x1a]
	ands r0, r3
	movs r4, #0
	strb r0, [r2, #0x1a]
	cmp r1, #0x81
	bne _08004870
	mov r0, sp
	strh r4, [r0]
	ldr r1, _08004868 @ =0x040000D4
	str r0, [r1]
	ldr r0, _0800486C @ =gUnknown_03000000
	b _080048BE
	.align 2, 0
_08004860: .4byte gMain
_08004864: .4byte gScriptContext
_08004868: .4byte 0x040000D4
_0800486C: .4byte gUnknown_03000000
_08004870:
	ldr r2, _0800488C @ =gUnknown_08023B98
	lsls r1, r1, #3
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r3, [r0]
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x28
	cmp r3, #0
	bge _08004898
	ldr r1, _08004890 @ =0x040000D4
	str r0, [r1]
	ldr r0, _08004894 @ =gUnknown_03000000
	b _080048F2
	.align 2, 0
_0800488C: .4byte gUnknown_08023B98
_08004890: .4byte 0x040000D4
_08004894: .4byte gUnknown_03000000
_08004898:
	ldr r1, _080048A0 @ =0x040000D4
	str r0, [r1]
	ldr r0, _080048A4 @ =gUnknown_03000000
	b _08004916
	.align 2, 0
_080048A0: .4byte 0x040000D4
_080048A4: .4byte gUnknown_03000000
_080048A8:
	movs r0, #0xfe
	ldrb r3, [r2, #0x1a]
	ands r0, r3
	strb r0, [r2, #0x1a]
	cmp r1, #0x81
	bne _080048D8
	mov r0, sp
	strh r4, [r0]
	ldr r1, _080048CC @ =0x040000D4
	str r0, [r1]
	ldr r0, _080048D0 @ =gUnknown_03002FA0
_080048BE:
	str r0, [r1, #4]
	ldr r0, _080048D4 @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r4, [r5, #0x38]
	b _0800492A
	.align 2, 0
_080048CC: .4byte 0x040000D4
_080048D0: .4byte gUnknown_03002FA0
_080048D4: .4byte 0x81000010
_080048D8:
	ldr r2, _08004900 @ =gUnknown_08023B98
	lsls r1, r1, #3
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r3, [r0]
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x28
	cmp r3, #0
	bge _08004910
	ldr r1, _08004904 @ =0x040000D4
	str r0, [r1]
	ldr r0, _08004908 @ =gUnknown_03002FA0
_080048F2:
	str r0, [r1, #4]
	ldr r0, _0800490C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r4, [r5, #0x38]
	b _08004922
	.align 2, 0
_08004900: .4byte gUnknown_08023B98
_08004904: .4byte 0x040000D4
_08004908: .4byte gUnknown_03002FA0
_0800490C: .4byte 0x80000010
_08004910:
	ldr r1, _08004934 @ =0x040000D4
	str r0, [r1]
	ldr r0, _08004938 @ =gUnknown_03002FA0
_08004916:
	str r0, [r1, #4]
	ldr r0, _0800493C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	strh r0, [r5, #0x38]
_08004922:
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x3c]
	strh r0, [r5, #0x3a]
_0800492A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004934: .4byte 0x040000D4
_08004938: .4byte gUnknown_03002FA0
_0800493C: .4byte 0x80000100

	thumb_func_start sub_8004940
sub_8004940: @ 0x08004940
	push {r4, lr}
	movs r2, #0xf0
	ands r2, r1
	adds r3, r0, #0
	ldr r0, _08004964 @ =gUnknown_08023B98
	lsls r1, r3, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r1, [r1]
	movs r4, #0x40
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	beq _08004968
	movs r0, #0x80
	ands r2, r0
	b _0800498A
	.align 2, 0
_08004964: .4byte gUnknown_08023B98
_08004968:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08004988
	movs r4, #0x10
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	beq _08004980
	movs r0, #0x20
	ands r2, r0
	b _0800498A
_08004980:
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _08004994
_08004988:
	ands r2, r4
_0800498A:
	cmp r2, #0
	beq _08004994
	movs r0, #0x80
	lsls r0, r0, #8
	orrs r3, r0
_08004994:
	adds r0, r3, #0
	bl sub_80049A0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80049A0
sub_80049A0: @ 0x080049A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	ldr r0, _080049E0 @ =gMain
	str r0, [sp, #0xc]
	ldr r7, _080049E4 @ =gScriptContext
	ldr r1, _080049E8 @ =gIORegisters
	str r1, [sp, #0x10]
	movs r0, #2
	ldrh r2, [r7, #0x1e]
	ands r0, r2
	cmp r0, #0
	beq _080049C4
	b _08004F98
_080049C4:
	mov r4, sl
	cmp r4, #0x11
	bne _080049F4
	ldr r1, [sp, #0xc]
	adds r1, #0x3d
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080049EC
	movs r0, #0
	bl sub_8003F7C
	b _08004A12
	.align 2, 0
_080049E0: .4byte gMain
_080049E4: .4byte gScriptContext
_080049E8: .4byte gIORegisters
_080049EC:
	movs r0, #1
	bl sub_8003F7C
	b _08004A12
_080049F4:
	mov r4, sl
	cmp r4, #0x2a
	beq _08004A12
	cmp r4, #0x14
	beq _08004A12
	movs r0, #2
	rsbs r0, r0, #0
	ldr r1, _08004A74 @ =gUnknown_030037ED
	ldrb r1, [r1]
	ands r0, r1
	ldr r2, _08004A74 @ =gUnknown_030037ED
	strb r0, [r2]
	movs r0, #0
	bl sub_8003F7C
_08004A12:
	ldr r0, _08004A78 @ =0x0000FFFF
	ldrh r4, [r7, #0x3e]
	cmp r4, r0
	beq _08004A22
	ldr r0, _08004A7C @ =gMain
	ldrb r0, [r0, #8]
	cmp r0, #4
	beq _08004A28
_08004A22:
	mov r0, sl
	bl sub_8004218
_08004A28:
	movs r4, #4
	adds r0, r4, #0
	ldr r1, _08004A74 @ =gUnknown_030037ED
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08004A42
	mov r0, sl
	bl sub_800407C
	cmp r0, #0
	beq _08004A42
	b _08004F98
_08004A42:
	mov r2, sl
	cmp r2, #0xe
	bne _08004A98
	adds r0, r4, #0
	ldr r4, _08004A74 @ =gUnknown_030037ED
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _08004A98
	ldr r1, _08004A80 @ =0x040000D4
	ldr r0, _08004A84 @ =gGfxSpeedlinesFirstAndLastColumns
	str r0, [r1]
	ldr r2, _08004A88 @ =gUnknown_0203B000
	str r2, [r1, #4]
	ldr r0, _08004A8C @ =0x80000280
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _08004A90 @ =0x06008B00
	str r2, [r1]
	str r4, [r1, #4]
	ldr r0, _08004A94 @ =0x80002800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08004AA2
	.align 2, 0
_08004A74: .4byte gUnknown_030037ED
_08004A78: .4byte 0x0000FFFF
_08004A7C: .4byte gMain
_08004A80: .4byte 0x040000D4
_08004A84: .4byte gGfxSpeedlinesFirstAndLastColumns
_08004A88: .4byte gUnknown_0203B000
_08004A8C: .4byte 0x80000280
_08004A90: .4byte 0x06008B00
_08004A94: .4byte 0x80002800
_08004A98:
	movs r0, #0
	bl MoveAnimationTilesToRam
	bl MoveSpritesToOAM
_08004AA2:
	mov r6, sl
	ldr r0, _08004B10 @ =0xFFFF7FFF
	mov sl, r0
	mov r1, sl
	ands r1, r6
	mov sl, r1
	movs r1, #0
	movs r5, #0
	movs r0, #8
	ldr r2, [sp, #0x10]
	strh r0, [r2, #0x16]
	strh r0, [r2, #0x14]
	ldr r0, [sp, #0xc]
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0x44
	strh r5, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0x46
	strh r5, [r0]
	mov r0, sl
	ldr r4, [sp, #0xc]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	mov r1, sl
	cmp r1, #0x81
	bne _08004B70
	ldr r2, _08004B14 @ =gUnknown_080248F8
	ldr r4, _08004B18 @ =gUnknown_03001080
	ldr r3, _08004B1C @ =0x040000D4
	str r2, [r3]
	str r4, [r3, #4]
	ldr r0, _08004B20 @ =0x800002C0
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x90
	ldr r0, _08004B24 @ =0x0000FFFE
	ldrh r1, [r1]
	cmp r1, r0
	bne _08004B34
	mov r1, sp
	movs r0, #0x1f
	strh r0, [r1]
	str r1, [r3]
	ldr r0, _08004B28 @ =0x05000040
	str r0, [r3, #4]
	ldr r0, _08004B2C @ =0x810000E0
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08004B30 @ =0x00002222
	adds r0, r2, #0
	b _08004B4A
	.align 2, 0
_08004B10: .4byte 0xFFFF7FFF
_08004B14: .4byte gUnknown_080248F8
_08004B18: .4byte gUnknown_03001080
_08004B1C: .4byte 0x040000D4
_08004B20: .4byte 0x800002C0
_08004B24: .4byte 0x0000FFFE
_08004B28: .4byte 0x05000040
_08004B2C: .4byte 0x810000E0
_08004B30: .4byte 0x00002222
_08004B34:
	mov r0, sp
	strh r5, [r0]
	str r0, [r3]
	ldr r0, _08004B5C @ =0x05000040
	str r0, [r3, #4]
	ldr r0, _08004B60 @ =0x810000E0
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	mov r1, sp
	ldr r4, _08004B64 @ =0x00002222
	adds r0, r4, #0
_08004B4A:
	strh r0, [r1]
	str r1, [r3]
	ldr r0, _08004B68 @ =0x06004000
	str r0, [r3, #4]
	ldr r0, _08004B6C @ =0x81004B00
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	b _08004F98
	.align 2, 0
_08004B5C: .4byte 0x05000040
_08004B60: .4byte 0x810000E0
_08004B64: .4byte 0x00002222
_08004B68: .4byte 0x06004000
_08004B6C: .4byte 0x81004B00
_08004B70:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r6
	cmp r0, #0
	beq _08004BD6
	ldr r1, _08004B9C @ =gUnknown_08023B98
	mov r0, sl
	lsls r2, r0, #3
	adds r0, r1, #4
	adds r0, r2, r0
	ldr r6, [r0]
	movs r3, #0x40
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _08004BA0
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r6, r0
	movs r0, #0x80
	orrs r6, r0
	b _08004BE4
	.align 2, 0
_08004B9C: .4byte gUnknown_08023B98
_08004BA0:
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _08004BAE
	movs r0, #0x81
	rsbs r0, r0, #0
	b _08004BD0
_08004BAE:
	movs r3, #0x10
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _08004BC4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r6, r0
	movs r0, #0x20
	orrs r6, r0
	b _08004BE4
_08004BC4:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _08004BE4
	movs r0, #0x21
	rsbs r0, r0, #0
_08004BD0:
	ands r6, r0
	orrs r6, r3
	b _08004BE4
_08004BD6:
	ldr r0, _08004C3C @ =gUnknown_08023B98
	mov r1, sl
	lsls r2, r1, #3
	adds r1, r0, #4
	adds r1, r2, r1
	ldr r6, [r1]
	adds r1, r0, #0
_08004BE4:
	str r6, [sp, #8]
	adds r0, r2, r1
	ldr r2, [r0]
	adds r3, r2, #0
	adds r3, #0x28
	cmp r6, #0
	blt _08004BF4
	b _08004CEC
_08004BF4:
	movs r2, #1
	str r2, [sp, #4]
	ldr r0, _08004C40 @ =0x0000FF7F
	ldr r4, [sp, #0x10]
	ldrh r4, [r4, #6]
	ands r0, r4
	ldr r1, [sp, #0x10]
	strh r0, [r1, #6]
	ldr r2, _08004C44 @ =gUnknown_030037ED
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08004C54
	mov r4, sl
	cmp r4, #0xe
	bne _08004C54
	movs r0, #4
	ands r0, r1
	ldr r1, [sp, #0x10]
	adds r1, #0x4a
	mov sb, r1
	ldr r2, [sp, #0xc]
	adds r2, #0x4a
	mov r8, r2
	cmp r0, #0
	bne _08004C2C
	b _08004D8E
_08004C2C:
	ldr r1, _08004C48 @ =0x040000D4
	str r3, [r1]
	ldr r0, _08004C4C @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08004C50 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08004D8E
	.align 2, 0
_08004C3C: .4byte gUnknown_08023B98
_08004C40: .4byte 0x0000FF7F
_08004C44: .4byte gUnknown_030037ED
_08004C48: .4byte 0x040000D4
_08004C4C: .4byte 0x05000040
_08004C50: .4byte 0x80000010
_08004C54:
	movs r0, #3
	rsbs r0, r0, #0
	ldr r4, _08004CB0 @ =gUnknown_030037ED
	ldrb r4, [r4]
	ands r0, r4
	movs r1, #0
	ldr r2, _08004CB0 @ =gUnknown_030037ED
	strb r0, [r2]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _08004CB4 @ =0x040000D4
	str r0, [r1]
	ldr r0, _08004CB8 @ =0x06008EC0
	str r0, [r1, #4]
	ldr r0, _08004CBC @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r7, #0x1e]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08004CC8
	ldr r0, _08004CC0 @ =0x0000FFFE
	ands r0, r2
	strh r0, [r7, #0x1e]
	movs r4, #0
	ldr r0, [sp, #0x10]
	adds r0, #0x4a
	mov sb, r0
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	mov r8, r1
	ldr r7, _08004CC4 @ =0x05000040
	adds r5, r3, #0
_08004C98:
	ldrh r0, [r5]
	movs r1, #0x1f
	movs r2, #0
	bl sub_8005574
	strh r0, [r7]
	adds r7, #2
	adds r5, #2
	adds r4, #1
	cmp r4, #0xf
	bls _08004C98
	b _08004D8E
	.align 2, 0
_08004CB0: .4byte gUnknown_030037ED
_08004CB4: .4byte 0x040000D4
_08004CB8: .4byte 0x06008EC0
_08004CBC: .4byte 0x81000010
_08004CC0: .4byte 0x0000FFFE
_08004CC4: .4byte 0x05000040
_08004CC8:
	str r3, [r1]
	ldr r0, _08004CE4 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08004CE8 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, [sp, #0x10]
	adds r2, #0x4a
	mov sb, r2
	ldr r4, [sp, #0xc]
	adds r4, #0x4a
	mov r8, r4
	b _08004D8E
	.align 2, 0
_08004CE4: .4byte 0x05000040
_08004CE8: .4byte 0x80000010
_08004CEC:
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x80
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #6]
	orrs r0, r1
	ldr r4, [sp, #0x10]
	strh r0, [r4, #6]
	mov r0, sl
	cmp r0, #0x14
	beq _08004D70
	ldrh r1, [r7, #0x1e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08004D48
	ldr r0, _08004D40 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x1e]
	movs r4, #0x20
	ldr r1, [sp, #0x10]
	adds r1, #0x4a
	mov sb, r1
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	mov r8, r0
	ldr r7, _08004D44 @ =0x05000040
	adds r5, r2, #0
	adds r5, #0x68
_08004D26:
	ldrh r0, [r5]
	movs r1, #0x1f
	movs r2, #0
	bl sub_8005574
	strh r0, [r7]
	adds r7, #2
	adds r5, #2
	adds r4, #1
	cmp r4, #0xff
	bls _08004D26
	b _08004D8E
	.align 2, 0
_08004D40: .4byte 0x0000FFFE
_08004D44: .4byte 0x05000040
_08004D48:
	ldr r1, _08004D68 @ =0x040000D4
	str r3, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08004D6C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, [sp, #0x10]
	adds r1, #0x4a
	mov sb, r1
	ldr r2, [sp, #0xc]
	adds r2, #0x4a
	mov r8, r2
	b _08004D8E
	.align 2, 0
_08004D68: .4byte 0x040000D4
_08004D6C: .4byte 0x80000100
_08004D70:
	ldr r1, _08004EDC @ =0x040000D4
	adds r0, r2, #0
	adds r0, #0x68
	str r0, [r1]
	ldr r0, _08004EE0 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08004EE4 @ =0x800000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, [sp, #0x10]
	adds r4, #0x4a
	mov sb, r4
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	mov r8, r0
_08004D8E:
	movs r1, #0x80
	lsls r1, r1, #0x13
	mov r2, sb
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, #0xe
	ldr r4, [sp, #0x10]
	ldrh r0, [r4, #6]
	strh r0, [r1]
	adds r1, #0xe
	ldr r0, [r4, #0x14]
	str r0, [r1]
	ldr r0, _08004EE8 @ =gMain
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08004DBA
	mov r2, r8
	movs r4, #0
	ldrsh r6, [r2, r4]
_08004DBA:
	mov r0, r8
	strh r6, [r0]
	ldr r3, _08004EEC @ =gUnknown_0202CFC0
	mov r1, sl
	cmp r1, #0x3f
	bhi _08004DCA
	cmp r1, #0x3e
	bhs _08004DD4
_08004DCA:
	adds r0, r3, #0
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl sub_8004390
_08004DD4:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp, #8]
	ands r0, r2
	cmp r0, #0
	beq _08004E3A
	movs r4, #0
	ldr r5, _08004EF0 @ =0x000003FF
	ldr r0, _08004EF4 @ =gUnknown_03001080
	mov sb, r0
	movs r1, #0x80
	lsls r1, r1, #3
	adds r3, r1, #0
	mov r1, sb
_08004DF0:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r4, #1
	cmp r4, r5
	bls _08004DF0
	movs r4, #0
	ldr r7, _08004EF4 @ =gUnknown_03001080
_08004E02:
	movs r5, #0
	adds r6, r4, #1
	lsls r1, r4, #5
	adds r1, #0x1f
	lsls r0, r4, #6
	adds r2, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
_08004E12:
	ldrh r3, [r2]
	ldrh r0, [r1]
	strh r0, [r2]
	strh r3, [r1]
	adds r2, #2
	subs r1, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08004E12
	adds r4, r6, #0
	cmp r4, #0x1f
	bls _08004E02
	mov r2, sb
	ldr r4, _08004EF8 @ =0x0600F800
	ldr r0, _08004EDC @ =0x040000D4
	str r2, [r0]
	str r4, [r0, #4]
	ldr r1, _08004EFC @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
_08004E3A:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, [sp, #8]
	ands r2, r0
	cmp r2, #0
	beq _08004EA4
	movs r4, #0
	ldr r5, _08004EF0 @ =0x000003FF
	ldr r0, _08004EF4 @ =gUnknown_03001080
	mov sb, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r1, #0
	mov r1, sb
_08004E56:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r4, #1
	cmp r4, r5
	bls _08004E56
	movs r4, #0
	ldr r7, _08004EF4 @ =gUnknown_03001080
	movs r2, #0x15
	mov r8, r2
_08004E6C:
	movs r5, #0
	adds r6, r4, #1
	mov r1, r8
	subs r0, r1, r4
	lsls r0, r0, #6
	adds r2, r0, r7
	lsls r0, r4, #6
	adds r1, r0, r7
_08004E7C:
	ldrh r3, [r1]
	ldrh r0, [r2]
	strh r0, [r1]
	strh r3, [r2]
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0x1f
	bls _08004E7C
	adds r4, r6, #0
	cmp r4, #0xa
	bls _08004E6C
	mov r2, sb
	ldr r4, _08004EF8 @ =0x0600F800
	ldr r0, _08004EDC @ =0x040000D4
	str r2, [r0]
	str r4, [r0, #4]
	ldr r1, _08004EFC @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
_08004EA4:
	ldr r0, _08004F00 @ =0x00000507
	ldr r2, [sp, #0xc]
	ldrh r2, [r2, #8]
	cmp r2, r0
	bne _08004EB6
	ldr r4, [sp, #0xc]
	ldrb r4, [r4, #0xa]
	cmp r4, #4
	bne _08004F48
_08004EB6:
	ldr r1, [sp, #0xc]
	adds r1, #0x90
	ldrh r2, [r1]
	adds r0, r2, #3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r0, #1
	bhi _08004F48
	ldr r0, _08004F04 @ =0x0000FFFE
	cmp r2, r0
	bne _08004F08
	ldr r1, [sp, #0xc]
	ldrh r0, [r1, #0x34]
	movs r1, #0x20
	movs r2, #1
	bl sub_80057F4
	b _08004F14
	.align 2, 0
_08004EDC: .4byte 0x040000D4
_08004EE0: .4byte 0x05000040
_08004EE4: .4byte 0x800000E0
_08004EE8: .4byte gMain
_08004EEC: .4byte gUnknown_0202CFC0
_08004EF0: .4byte 0x000003FF
_08004EF4: .4byte gUnknown_03001080
_08004EF8: .4byte 0x0600F800
_08004EFC: .4byte 0x80000400
_08004F00: .4byte 0x00000507
_08004F04: .4byte 0x0000FFFE
_08004F08:
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl sub_80057F4
_08004F14:
	ldr r1, [sp, #0xc]
	ldrh r0, [r1, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08004F48
	ldr r0, _08004F38 @ =0x0000FFFE
	ldrh r4, [r4]
	cmp r4, r0
	bne _08004F3C
	ldrh r0, [r1, #0x34]
	movs r1, #0x20
	movs r2, #1
	bl sub_800598C
	b _08004F48
	.align 2, 0
_08004F38: .4byte 0x0000FFFE
_08004F3C:
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl sub_800598C
_08004F48:
	movs r0, #8
	ldr r4, _08004FA8 @ =gUnknown_030037ED
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _08004F78
	ldr r1, [sp, #0xc]
	ldrh r0, [r1, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl sub_8005A00
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08004F78
	ldrh r0, [r2, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl sub_8005C88
_08004F78:
	movs r0, #0x40
	ldr r4, _08004FA8 @ =gUnknown_030037ED
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _08004F98
	ldr r0, [sp, #0xc]
	ldrh r0, [r0, #0x34]
	cmp r0, #6
	bne _08004F98
	ldr r1, [sp, #0xc]
	ldrh r0, [r1, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl sub_8005AF4
_08004F98:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004FA8: .4byte gUnknown_030037ED

	thumb_func_start sub_8004FAC
sub_8004FAC: @ 0x08004FAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r6, _080050B0 @ =gMain
	ldrh r0, [r6, #0x38]
	str r0, [sp]
	ldr r1, _080050B4 @ =gUnknown_030037EE
	ldrb r1, [r1]
	str r1, [sp, #4]
	movs r2, #0x44
	adds r2, r2, r6
	mov sl, r2
	ldrh r3, [r2]
	mov r8, r3
	mov r4, r8
	str r4, [sp, #8]
	ldr r0, _080050B8 @ =gUnknown_030037F6
	ldrh r0, [r0]
	mov sb, r0
	mov r1, sb
	str r1, [sp, #0xc]
	ldr r2, _080050BC @ =gUnknown_030037FC
	ldrb r2, [r2]
	str r2, [sp, #0x10]
	ldr r3, _080050C0 @ =gUnknown_030037FD
	ldrb r3, [r3]
	str r3, [sp, #0x14]
	ldr r4, _080050C4 @ =gUnknown_030037FA
	ldrh r4, [r4]
	str r4, [sp, #0x1c]
	str r4, [sp, #0x18]
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r1, [r0]
	cmp r1, #0
	beq _08005012
	lsrs r0, r1, #8
	movs r2, #0x96
	lsls r2, r2, #2
	adds r4, r6, r2
	movs r5, #0
	strb r0, [r4]
	movs r0, #0xff
	ands r0, r1
	bl sub_8003D5C
	strb r5, [r4]
_08005012:
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl nullsub_8
	adds r0, r7, #0
	bl sub_80049A0
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r6, #0x38]
	mov r4, sp
	ldrb r0, [r4, #4]
	ldr r4, _080050B4 @ =gUnknown_030037EE
	strb r0, [r4]
	mov r1, sp
	ldrb r2, [r1, #0x10]
	ldr r1, _080050BC @ =gUnknown_030037FC
	strb r2, [r1]
	mov r3, sp
	ldrb r4, [r3, #0x14]
	ldr r3, _080050C0 @ =gUnknown_030037FD
	strb r4, [r3]
	mov r0, sl
	ldrh r0, [r0]
	mov r1, r8
	subs r5, r0, r1
	adds r3, r6, #0
	adds r3, #0x40
	strh r5, [r3]
	ldr r2, _080050B8 @ =gUnknown_030037F6
	ldrh r2, [r2]
	mov r4, sb
	subs r7, r2, r4
	adds r4, r6, #0
	adds r4, #0x42
	strh r7, [r4]
	ldr r1, _080050C8 @ =gUnknown_08023B98
	ldrh r2, [r6, #0x34]
	lsls r0, r2, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _08005074
	b _0800519C
_08005074:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ands r2, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080050DC
	mov r4, sp
	ldrh r0, [r4, #0x1c]
	ldr r4, _080050C4 @ =gUnknown_030037FA
	strh r0, [r4]
	mov r0, r8
	mov r4, sl
	strh r0, [r4]
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	strh r0, [r3]
	ldrh r3, [r6, #0x34]
	lsls r0, r3, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080050CC
	movs r0, #0xf0
	lsls r0, r0, #1
	b _080050D0
	.align 2, 0
_080050B0: .4byte gMain
_080050B4: .4byte gUnknown_030037EE
_080050B8: .4byte gUnknown_030037F6
_080050BC: .4byte gUnknown_030037FC
_080050C0: .4byte gUnknown_030037FD
_080050C4: .4byte gUnknown_030037FA
_080050C8: .4byte gUnknown_08023B98
_080050CC:
	movs r0, #0xb4
	lsls r0, r0, #1
_080050D0:
	orrs r2, r0
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_8002E80
	b _0800519C
_080050DC:
	cmp r0, #0
	ble _08005124
	mov r4, sp
	ldrh r0, [r4, #0x18]
	ldr r4, _08005110 @ =gUnknown_030037FA
	strh r0, [r4]
	mov r4, sp
	ldrh r0, [r4, #8]
	mov r4, sl
	strh r0, [r4]
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	strh r0, [r3]
	ldrh r3, [r6, #0x34]
	lsls r0, r3, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08005114
	movs r0, #0xf0
	lsls r0, r0, #1
	b _08005118
	.align 2, 0
_08005110: .4byte gUnknown_030037FA
_08005114:
	movs r0, #0xb4
	lsls r0, r0, #1
_08005118:
	orrs r2, r0
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_80030EC
	b _0800519C
_08005124:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _08005162
	mov r3, sb
	ldr r0, _08005150 @ =gUnknown_030037F6
	strh r3, [r0]
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4]
	ldrh r4, [r6, #0x34]
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08005154
	movs r0, #0xa0
	lsls r0, r0, #1
	b _08005156
	.align 2, 0
_08005150: .4byte gUnknown_030037F6
_08005154:
	movs r0, #0xf0
_08005156:
	orrs r2, r0
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_8002B2C
	b _0800519C
_08005162:
	cmp r0, #0
	bge _0800519C
	mov r0, sp
	ldrh r3, [r0, #0xc]
	ldr r0, _0800518C @ =gUnknown_030037F6
	strh r3, [r0]
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4]
	ldrh r4, [r6, #0x34]
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08005190
	movs r0, #0xa0
	lsls r0, r0, #1
	b _08005192
	.align 2, 0
_0800518C: .4byte gUnknown_030037F6
_08005190:
	movs r0, #0xf0
_08005192:
	orrs r2, r0
	adds r0, r6, #0
	adds r1, r2, #0
	bl sub_8002D4C
_0800519C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80051AC
sub_80051AC: @ 0x080051AC
	ldr r1, _080051B8 @ =gUnknown_08023B98
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080051B8: .4byte gUnknown_08023B98

	thumb_func_start sub_80051BC
sub_80051BC: @ 0x080051BC
	ldr r1, _080051C8 @ =gUnknown_08023B98
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x28
	bx lr
	.align 2, 0
_080051C8: .4byte gUnknown_08023B98

	thumb_func_start sub_80051CC
sub_80051CC: @ 0x080051CC
	push {r4, r5, r6, r7, lr}
	ldr r1, _080051E0 @ =gScriptContext
	adds r5, r1, #0
	cmp r0, #1
	beq _08005228
	cmp r0, #1
	blo _080051E4
	cmp r0, #2
	beq _08005240
	b _08005294
	.align 2, 0
_080051E0: .4byte gScriptContext
_080051E4:
	ldr r3, _0800521C @ =gUnknown_03002080
	movs r2, #0
	ldr r4, _08005220 @ =0x000002BF
	adds r7, r1, #0
	adds r7, #0x23
	ldr r1, _08005224 @ =gUnknown_08023EF8
_080051F0:
	adds r0, r2, r1
	ldrb r0, [r0]
	strh r0, [r3]
	adds r2, #1
	adds r3, #2
	cmp r2, r4
	bls _080051F0
	movs r0, #0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	movs r1, #0x80
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_8006130
	b _08005294
	.align 2, 0
_0800521C: .4byte gUnknown_03002080
_08005220: .4byte 0x000002BF
_08005224: .4byte gUnknown_08023EF8
_08005228:
	adds r2, r1, #0
	adds r2, #0x2b
	movs r0, #0xe
	strb r0, [r2]
	adds r1, #0x23
	movs r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	b _08005294
_08005240:
	ldr r3, _0800529C @ =gUnknown_03002080
	movs r2, #0
	ldr r4, _080052A0 @ =0x000001BF
	adds r7, r1, #0
	adds r7, #0x23
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r5, r3, r0
	adds r0, #0x80
	adds r6, r3, r0
	ldr r1, _080052A4 @ =gUnknown_08023EF8
_08005256:
	adds r0, r2, r1
	ldrb r0, [r0]
	strh r0, [r3]
	adds r2, #1
	adds r3, #2
	cmp r2, r4
	bls _08005256
	adds r3, r5, #0
	movs r2, #0xe0
	lsls r2, r2, #1
	ldr r1, _080052A8 @ =0x0000021F
	movs r0, #0
_0800526E:
	strh r0, [r3]
	adds r2, #1
	adds r3, #2
	cmp r2, r1
	bls _0800526E
	adds r3, r6, #0
	movs r2, #0xe0
	lsls r2, r2, #1
	ldr r4, _080052AC @ =0x000001DF
	ldr r1, _080052A4 @ =gUnknown_08023EF8
_08005282:
	adds r0, r2, r1
	ldrb r0, [r0]
	strh r0, [r3]
	adds r2, #1
	adds r3, #2
	cmp r2, r4
	bls _08005282
	movs r0, #0
	strb r0, [r7]
_08005294:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800529C: .4byte gUnknown_03002080
_080052A0: .4byte 0x000001BF
_080052A4: .4byte gUnknown_08023EF8
_080052A8: .4byte 0x0000021F
_080052AC: .4byte 0x000001DF

	thumb_func_start UpdateTextbox
UpdateTextbox: @ 0x080052B0
	push {r4, r5, lr}
	ldr r0, _080052CC @ =gScriptContext
	mov ip, r0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #4
	bls _080052C0
	b _080053B4
_080052C0:
	lsls r0, r0, #2
	ldr r1, _080052D0 @ =_080052D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080052CC: .4byte gScriptContext
_080052D0: .4byte _080052D4
_080052D4: @ jump table
	.4byte _080053B4 @ case 0
	.4byte _080052E8 @ case 1
	.4byte _080052F4 @ case 2
	.4byte _08005360 @ case 3
	.4byte _08005390 @ case 4
_080052E8:
	ldr r1, _080052F0 @ =gMain
	movs r0, #0
	strb r0, [r1, #0x19]
	b _080053B4
	.align 2, 0
_080052F0: .4byte gMain
_080052F4:
	mov r1, ip
	adds r1, #0x2b
	ldrb r0, [r1]
	lsls r2, r0, #5
	movs r4, #0
	adds r5, r1, #0
	ldr r1, _08005358 @ =gUnknown_03002080
	lsls r0, r0, #6
	adds r3, r0, r1
	adds r0, r2, #0
	subs r0, #0x20
	lsls r0, r0, #1
	adds r1, r0, r1
_0800530E:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0x1f
	bls _0800530E
	movs r4, #0
	ldr r0, _08005358 @ =gUnknown_03002080
	adds r1, r2, #0
	adds r1, #0x20
	lsls r2, r2, #1
	adds r2, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r0
_0800532C:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0x1f
	bls _0800532C
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080053B4
	ldr r0, _0800535C @ =gMain
	movs r1, #1
	strb r1, [r0, #0x19]
	mov r0, ip
	adds r0, #0x23
	strb r2, [r0]
	b _080053B4
	.align 2, 0
_08005358: .4byte gUnknown_03002080
_0800535C: .4byte gMain
_08005360:
	ldr r2, _08005384 @ =gIORegisters
	ldrh r0, [r2, #0xe]
	adds r0, #4
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	ldr r1, _08005388 @ =0xFFAF0000
	cmp r0, r1
	bhi _080053B4
	ldr r1, _0800538C @ =gMain
	movs r0, #1
	strb r0, [r1, #0x18]
	strb r0, [r1, #0x19]
	movs r0, #0
	strh r0, [r2, #0xe]
	mov r1, ip
	adds r1, #0x23
	b _080053B2
	.align 2, 0
_08005384: .4byte gIORegisters
_08005388: .4byte 0xFFAF0000
_0800538C: .4byte gMain
_08005390:
	ldr r2, _080053BC @ =gIORegisters
	ldrh r0, [r2, #0xe]
	subs r0, #4
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	ldr r1, _080053C0 @ =0xFFAF0000
	cmp r0, r1
	bhi _080053B4
	adds r1, r2, #0
	adds r1, #0x4a
	ldr r0, _080053C4 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	mov r1, ip
	adds r1, #0x23
	movs r0, #1
_080053B2:
	strb r0, [r1]
_080053B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080053BC: .4byte gIORegisters
_080053C0: .4byte 0xFFAF0000
_080053C4: .4byte 0x0000FDFF

	thumb_func_start sub_80053C8
sub_80053C8: @ 0x080053C8
	push {r4, r5, lr}
	movs r1, #0xe0
	lsls r1, r1, #1
	ldr r4, _080053F0 @ =0x000003BF
	ldr r0, _080053F4 @ =gUnknown_03002080
	ldr r3, _080053F8 @ =gUnknown_08023EF8
	movs r5, #0xe0
	lsls r5, r5, #2
	adds r2, r0, r5
_080053DA:
	adds r0, r1, r3
	ldrb r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, r4
	ble _080053DA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080053F0: .4byte 0x000003BF
_080053F4: .4byte gUnknown_03002080
_080053F8: .4byte gUnknown_08023EF8

	thumb_func_start sub_80053FC
sub_80053FC: @ 0x080053FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08005448 @ =gMain
	movs r0, #0
	strb r0, [r1, #0x18]
	strb r0, [r1, #0x19]
	bl sub_80053C8
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	cmp r4, #1
	bne _08005464
	ldr r0, _0800544C @ =gScriptContext
	adds r0, #0x23
	movs r1, #3
	strb r1, [r0]
	ldr r0, _08005450 @ =gInvestigation
	strb r1, [r0, #0x10]
	ldr r0, _08005454 @ =gIORegisters
	adds r0, #0x4a
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _08005458 @ =gUnknown_03002080
	ldr r2, _0800545C @ =0x000004DC
	adds r1, r0, r2
	movs r2, #9
	strh r2, [r1]
	ldr r1, _08005460 @ =0x000004DE
	adds r0, r0, r1
	strh r2, [r0]
	b _0800548E
	.align 2, 0
_08005448: .4byte gMain
_0800544C: .4byte gScriptContext
_08005450: .4byte gInvestigation
_08005454: .4byte gIORegisters
_08005458: .4byte gUnknown_03002080
_0800545C: .4byte 0x000004DC
_08005460: .4byte 0x000004DE
_08005464:
	cmp r4, #2
	bne _08005480
	ldr r0, _08005478 @ =gScriptContext
	adds r0, #0x23
	movs r1, #3
	strb r1, [r0]
	ldr r0, _0800547C @ =gInvestigation
	strb r1, [r0, #0x10]
	b _0800548E
	.align 2, 0
_08005478: .4byte gScriptContext
_0800547C: .4byte gInvestigation
_08005480:
	ldr r0, _08005494 @ =gScriptContext
	adds r0, #0x23
	movs r1, #4
	strb r1, [r0]
	ldr r1, _08005498 @ =gInvestigation
	movs r0, #1
	strb r0, [r1, #0x10]
_0800548E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005494: .4byte gScriptContext
_08005498: .4byte gInvestigation

	thumb_func_start sub_800549C
sub_800549C: @ 0x0800549C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	ands r3, r1
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r1, r0
	lsrs r5, r1, #5
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r1, r0
	lsrs r4, r1, #0xa
	mov r2, r8
	cmp r2, #0x20
	bls _080054D0
	movs r0, #0x20
	mov r8, r0
_080054D0:
	lsls r0, r3, #0x13
	lsrs r3, r0, #0x10
	lsls r0, r5, #0x13
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x13
	lsrs r4, r0, #0x10
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08005570 @ =0x00000259
	muls r1, r5, r1
	adds r0, r0, r1
	movs r1, #0x75
	muls r1, r4, r1
	adds r0, r0, r1
	movs r1, #0x93
	muls r1, r0, r1
	lsrs r6, r1, #0x11
	movs r1, #0x86
	muls r1, r0, r1
	lsrs r7, r1, #0x11
	movs r1, #0x73
	muls r0, r1, r0
	lsrs r0, r0, #0x11
	mov ip, r0
	cmp r6, #0xff
	ble _0800550C
	movs r6, #0xff
_0800550C:
	cmp r7, #0xff
	ble _08005512
	movs r7, #0xff
_08005512:
	mov r1, ip
	cmp r1, #0xff
	ble _0800551C
	movs r2, #0xff
	mov ip, r2
_0800551C:
	movs r2, #0x20
	mov r0, r8
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r2, r0
	mov r1, r8
	muls r1, r6, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	muls r0, r2, r0
	mov r1, r8
	muls r1, r7, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	muls r0, r2, r0
	mov r2, r8
	mov r1, ip
	muls r1, r2, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r4, r0, #0x10
	mov r0, sb
	ands r3, r0
	ands r5, r0
	ands r4, r0
	lsls r0, r4, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r3, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005570: .4byte 0x00000259

	thumb_func_start sub_8005574
sub_8005574: @ 0x08005574
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	ands r3, r1
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r1, r0
	lsrs r6, r1, #5
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r1, r0
	lsrs r4, r1, #0xa
	mov r2, ip
	cmp r2, #0x20
	bls _080055A8
	movs r5, #0x20
	mov ip, r5
_080055A8:
	lsls r0, r3, #0x13
	lsrs r3, r0, #0x10
	lsls r0, r6, #0x13
	lsrs r6, r0, #0x10
	lsls r0, r4, #0x13
	lsrs r4, r0, #0x10
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08005650 @ =0x00000259
	muls r1, r6, r1
	adds r0, r0, r1
	movs r1, #0x75
	muls r1, r4, r1
	adds r0, r0, r1
	lsls r0, r0, #6
	lsrs r5, r0, #0x10
	mov r8, r5
	adds r7, r5, #0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080055EA
	movs r1, #0xff
	mov r8, r1
	cmp r0, #0xff
	ble _080055EA
	movs r5, #0xff
	cmp r0, #0xff
	ble _080055EA
	movs r7, #0xff
_080055EA:
	movs r2, #0x20
	mov r0, ip
	subs r2, r2, r0
	adds r1, r3, #0
	muls r1, r2, r1
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r3, ip
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r1, r0
	lsls r1, r1, #8
	lsrs r3, r1, #0x10
	adds r1, r6, #0
	muls r1, r2, r1
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov r5, ip
	muls r5, r0, r5
	adds r0, r5, #0
	adds r1, r1, r0
	lsls r1, r1, #8
	lsrs r6, r1, #0x10
	adds r1, r4, #0
	muls r1, r2, r1
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, ip
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	lsls r1, r1, #8
	lsrs r4, r1, #0x10
	mov r5, sb
	ands r3, r5
	ands r6, r5
	ands r4, r5
	lsls r0, r4, #0xa
	lsls r1, r6, #5
	orrs r0, r1
	orrs r3, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005650: .4byte 0x00000259

	thumb_func_start sub_8005654
sub_8005654: @ 0x08005654
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	ands r3, r1
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r1, r0
	lsrs r5, r1, #5
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r1, r0
	lsrs r4, r1, #0xa
	mov r2, r8
	cmp r2, #0x20
	bls _08005688
	movs r0, #0x20
	mov r8, r0
_08005688:
	lsls r0, r3, #0x13
	lsrs r3, r0, #0x10
	lsls r0, r5, #0x13
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x13
	lsrs r4, r0, #0x10
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r0, r1, #4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08005720 @ =0x00000259
	muls r0, r5, r0
	adds r1, r1, r0
	movs r0, #0x75
	muls r0, r4, r0
	adds r1, r1, r0
	lsls r0, r1, #6
	lsrs r6, r0, #0x11
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	lsrs r7, r0, #0x11
	mov ip, r6
	mov r0, ip
	cmp r0, #0xff
	ble _080056C0
	movs r6, #0xff
_080056C0:
	cmp r7, #0xff
	ble _080056C6
	movs r7, #0xff
_080056C6:
	cmp r0, #0xff
	ble _080056CE
	movs r1, #0xff
	mov ip, r1
_080056CE:
	movs r2, #0x20
	mov r0, r8
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r2, r0
	mov r1, r8
	muls r1, r6, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	muls r0, r2, r0
	mov r1, r8
	muls r1, r7, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	muls r0, r2, r0
	mov r2, r8
	mov r1, ip
	muls r1, r2, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r4, r0, #0x10
	mov r0, sb
	ands r3, r0
	ands r5, r0
	ands r4, r0
	lsls r0, r4, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r3, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005720: .4byte 0x00000259

	thumb_func_start sub_8005724
sub_8005724: @ 0x08005724
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	ands r3, r1
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r1, r0
	lsrs r5, r1, #5
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r1, r0
	lsrs r4, r1, #0xa
	mov r2, r8
	cmp r2, #0x20
	bls _08005758
	movs r0, #0x20
	mov r8, r0
_08005758:
	lsls r0, r3, #0x13
	lsrs r3, r0, #0x10
	lsls r0, r5, #0x13
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x13
	lsrs r4, r0, #0x10
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r0, r1, #4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080057F0 @ =0x00000259
	muls r0, r5, r0
	adds r1, r1, r0
	movs r0, #0x75
	muls r0, r4, r0
	adds r1, r1, r0
	lsls r0, r1, #6
	lsrs r6, r0, #0x11
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	lsrs r7, r0, #0x11
	mov ip, r6
	mov r0, ip
	cmp r0, #0xff
	ble _08005790
	movs r6, #0xff
_08005790:
	cmp r7, #0xff
	ble _08005796
	movs r7, #0xff
_08005796:
	cmp r0, #0xff
	ble _0800579E
	movs r1, #0xff
	mov ip, r1
_0800579E:
	movs r2, #0x20
	mov r0, r8
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r2, r0
	mov r1, r8
	muls r1, r6, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	muls r0, r2, r0
	mov r1, r8
	muls r1, r7, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	muls r0, r2, r0
	mov r2, r8
	mov r1, ip
	muls r1, r2, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	lsrs r4, r0, #0x10
	mov r0, sb
	ands r3, r0
	ands r5, r0
	ands r4, r0
	lsls r0, r4, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r3, r0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080057F0: .4byte 0x00000259

	thumb_func_start sub_80057F4
sub_80057F4: @ 0x080057F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08005838 @ =0xFFFFFE00
	add sp, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r5, #0x81
	bne _0800583C
	movs r5, #0x20
	add r6, sp, #0x40
	adds r4, r6, #0
	movs r0, #0
	mov sb, r0
_0800581C:
	mov r1, sb
	strh r1, [r4]
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _0800581C
	b _080058B8
	.align 2, 0
_08005838: .4byte 0xFFFFFE00
_0800583C:
	adds r0, r5, #0
	bl sub_80051AC
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_80051BC
	adds r1, r0, #0
	cmp r4, #0
	bge _08005890
	ldr r0, _08005884 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08005888 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0
	mov r4, sp
_08005862:
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08005862
	ldr r1, _08005884 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800588C @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08005888 @ =0x80000010
	b _080058C2
	.align 2, 0
_08005884: .4byte 0x040000D4
_08005888: .4byte 0x80000010
_0800588C: .4byte 0x05000040
_08005890:
	ldr r0, _080058D8 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _080058DC @ =0x80000100
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0x20
	add r6, sp, #0x40
	adds r4, r6, #0
_080058A4:
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _080058A4
_080058B8:
	ldr r1, _080058D8 @ =0x040000D4
	str r6, [r1]
	ldr r0, _080058E0 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _080058E4 @ =0x800000E0
_080058C2:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080058D8: .4byte 0x040000D4
_080058DC: .4byte 0x80000100
_080058E0: .4byte 0x05000040
_080058E4: .4byte 0x800000E0

	thumb_func_start sub_80058E8
sub_80058E8: @ 0x080058E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x60
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _0800594C @ =gUnknown_03000800
	ldr r0, [r0, #0x64]
	ldrh r6, [r0]
	adds r0, #4
	ldr r1, _08005950 @ =0x040000D4
	str r0, [r1]
	mov r0, sp
	str r0, [r1, #4]
	ldr r0, _08005954 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	lsls r0, r6, #4
	cmp r5, r0
	bhs _08005934
	adds r7, r0, #0
	mov r4, sp
_08005920:
	ldrh r0, [r4]
	mov r1, sb
	mov r2, r8
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, r7
	blo _08005920
_08005934:
	cmp r6, #3
	bne _08005960
	ldr r1, _08005950 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08005958 @ =0x050003A0
	str r0, [r1, #4]
	ldr r0, _0800595C @ =0x80000030
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08005976
	.align 2, 0
_0800594C: .4byte gUnknown_03000800
_08005950: .4byte 0x040000D4
_08005954: .4byte 0x80000020
_08005958: .4byte 0x050003A0
_0800595C: .4byte 0x80000030
_08005960:
	ldr r2, _08005984 @ =0x040000D4
	mov r0, sp
	str r0, [r2]
	ldr r0, _08005988 @ =0x050003C0
	str r0, [r2, #4]
	lsls r0, r6, #4
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08005976:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005984: .4byte 0x040000D4
_08005988: .4byte 0x050003C0

	thumb_func_start sub_800598C
sub_800598C: @ 0x0800598C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r1, _080059E8 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r1, _080059EC @ =gPalWitnessBench
	cmp r0, #1
	bhi _080059A8
	adds r1, #0x20
_080059A8:
	ldr r0, _080059F0 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _080059F4 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0
	mov r4, sp
_080059BA:
	ldrh r0, [r4]
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	bls _080059BA
	ldr r1, _080059F0 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080059F8 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _080059F4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080059E8: .4byte 0xFFFF0000
_080059EC: .4byte gPalWitnessBench
_080059F0: .4byte 0x040000D4
_080059F4: .4byte 0x80000010
_080059F8: .4byte 0x05000340

	thumb_func_start nullsub_2
nullsub_2: @ 0x080059FC
	bx lr
	.align 2, 0

	thumb_func_start sub_8005A00
sub_8005A00: @ 0x08005A00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08005A44 @ =0xFFFFFE00
	add sp, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r5, #0x81
	bne _08005A48
	movs r5, #0x20
	add r6, sp, #0x40
	adds r4, r6, #0
	movs r0, #0
	mov sb, r0
_08005A28:
	mov r1, sb
	strh r1, [r4]
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _08005A28
	b _08005AC4
	.align 2, 0
_08005A44: .4byte 0xFFFFFE00
_08005A48:
	adds r0, r5, #0
	bl sub_80051AC
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_80051BC
	adds r1, r0, #0
	cmp r4, #0
	bge _08005A9C
	ldr r0, _08005A90 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08005A94 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0
	mov r4, sp
_08005A6E:
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08005A6E
	ldr r1, _08005A90 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08005A98 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08005A94 @ =0x80000010
	b _08005ACE
	.align 2, 0
_08005A90: .4byte 0x040000D4
_08005A94: .4byte 0x80000010
_08005A98: .4byte 0x05000040
_08005A9C:
	ldr r0, _08005AE4 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08005AE8 @ =0x80000100
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0x20
	add r6, sp, #0x40
	adds r4, r6, #0
_08005AB0:
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _08005AB0
_08005AC4:
	ldr r1, _08005AE4 @ =0x040000D4
	str r6, [r1]
	ldr r0, _08005AEC @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08005AF0 @ =0x800000E0
_08005ACE:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005AE4: .4byte 0x040000D4
_08005AE8: .4byte 0x80000100
_08005AEC: .4byte 0x05000040
_08005AF0: .4byte 0x800000E0

	thumb_func_start sub_8005AF4
sub_8005AF4: @ 0x08005AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08005B38 @ =0xFFFFFE00
	add sp, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r5, #0x81
	bne _08005B3C
	movs r5, #0x20
	add r6, sp, #0x40
	adds r4, r6, #0
	movs r0, #0
	mov sb, r0
_08005B1C:
	mov r1, sb
	strh r1, [r4]
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _08005B1C
	b _08005BB8
	.align 2, 0
_08005B38: .4byte 0xFFFFFE00
_08005B3C:
	adds r0, r5, #0
	bl sub_80051AC
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_80051BC
	adds r1, r0, #0
	cmp r4, #0
	bge _08005B90
	ldr r0, _08005B84 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08005B88 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0
	mov r4, sp
_08005B62:
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_8005654
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08005B62
	ldr r1, _08005B84 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08005B8C @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08005B88 @ =0x80000010
	b _08005BC2
	.align 2, 0
_08005B84: .4byte 0x040000D4
_08005B88: .4byte 0x80000010
_08005B8C: .4byte 0x05000040
_08005B90:
	ldr r0, _08005BD8 @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08005BDC @ =0x80000100
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0x20
	add r6, sp, #0x40
	adds r4, r6, #0
_08005BA4:
	ldrh r0, [r4]
	mov r1, r8
	adds r2, r7, #0
	bl sub_8005654
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _08005BA4
_08005BB8:
	ldr r1, _08005BD8 @ =0x040000D4
	str r6, [r1]
	ldr r0, _08005BE0 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _08005BE4 @ =0x800000E0
_08005BC2:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005BD8: .4byte 0x040000D4
_08005BDC: .4byte 0x80000100
_08005BE0: .4byte 0x05000040
_08005BE4: .4byte 0x800000E0

	thumb_func_start sub_8005BE8
sub_8005BE8: @ 0x08005BE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x60
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _08005C48 @ =gUnknown_03000800
	ldr r0, [r0, #0x64]
	ldm r0!, {r6}
	ldr r1, _08005C4C @ =0x040000D4
	str r0, [r1]
	mov r0, sp
	str r0, [r1, #4]
	ldr r0, _08005C50 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	lsls r0, r6, #4
	cmp r5, r0
	bhs _08005C32
	adds r7, r0, #0
	mov r4, sp
_08005C1E:
	ldrh r0, [r4]
	mov r1, sb
	mov r2, r8
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, r7
	blo _08005C1E
_08005C32:
	cmp r6, #3
	bne _08005C5C
	ldr r1, _08005C4C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08005C54 @ =0x050003A0
	str r0, [r1, #4]
	ldr r0, _08005C58 @ =0x80000030
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08005C72
	.align 2, 0
_08005C48: .4byte gUnknown_03000800
_08005C4C: .4byte 0x040000D4
_08005C50: .4byte 0x80000020
_08005C54: .4byte 0x050003A0
_08005C58: .4byte 0x80000030
_08005C5C:
	ldr r2, _08005C80 @ =0x040000D4
	mov r0, sp
	str r0, [r2]
	ldr r0, _08005C84 @ =0x050003C0
	str r0, [r2, #4]
	lsls r0, r6, #4
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08005C72:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005C80: .4byte 0x040000D4
_08005C84: .4byte 0x050003C0

	thumb_func_start sub_8005C88
sub_8005C88: @ 0x08005C88
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r1, _08005CE4 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	ldr r1, _08005CE8 @ =gPalWitnessBench
	cmp r0, #1
	bhi _08005CA4
	adds r1, #0x20
_08005CA4:
	ldr r0, _08005CEC @ =0x040000D4
	str r1, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08005CF0 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r5, #0
	mov r4, sp
_08005CB6:
	ldrh r0, [r4]
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_800549C
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08005CB6
	ldr r1, _08005CEC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08005CF4 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _08005CF0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005CE4: .4byte 0xFFFF0000
_08005CE8: .4byte gPalWitnessBench
_08005CEC: .4byte 0x040000D4
_08005CF0: .4byte 0x80000010
_08005CF4: .4byte 0x05000340

	thumb_func_start nullsub_3
nullsub_3: @ 0x08005CF8
	bx lr
	.align 2, 0

	thumb_func_start sub_8005CFC
sub_8005CFC: @ 0x08005CFC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r2, _08005D10 @ =gCourtRecord
	cmp r3, #4
	bls _08005D14
	movs r0, #1
	strb r0, [r2, #0xa]
	subs r3, #4
	b _08005D18
	.align 2, 0
_08005D10: .4byte gCourtRecord
_08005D14:
	movs r0, #0
	strb r0, [r2, #0xa]
_08005D18:
	movs r0, #0
	strb r3, [r2, #3]
	strb r0, [r2]
	ldrh r0, [r2, #4]
	strh r0, [r2, #6]
	movs r0, #0xfb
	ldrb r1, [r2, #0xc]
	ands r0, r1
	strb r0, [r2, #0xc]
	cmp r3, #4
	bhi _08005D74
	lsls r0, r3, #2
	ldr r1, _08005D38 @ =_08005D3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005D38: .4byte _08005D3C
_08005D3C: @ jump table
	.4byte _08005D74 @ case 0
	.4byte _08005D50 @ case 1
	.4byte _08005D5E @ case 2
	.4byte _08005D6C @ case 3
	.4byte _08005D70 @ case 4
_08005D50:
	movs r0, #0
	strb r4, [r2, #1]
	strb r0, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #4]
	b _08005D74
_08005D5E:
	rsbs r0, r4, #0
	strb r0, [r2, #1]
	movs r0, #0x1f
	strb r0, [r2, #2]
	adds r0, #0xf1
	strh r0, [r2, #4]
	b _08005D74
_08005D6C:
	strb r4, [r2, #1]
	b _08005D74
_08005D70:
	rsbs r0, r4, #0
	strb r0, [r2, #1]
_08005D74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_13
nullsub_13: @ 0x08005D7C
	bx lr
	.align 2, 0

	thumb_func_start sub_8005D80
sub_8005D80: @ 0x08005D80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldrb r0, [r5]
	ldrb r2, [r5, #1]
	adds r1, r0, r2
	strb r1, [r5]
	movs r0, #1
	ldrsb r0, [r5, r0]
	ldrh r3, [r5, #4]
	subs r0, r3, r0
	ldr r2, _08005E34 @ =0x000001FF
	ands r0, r2
	strh r0, [r5, #4]
	movs r0, #1
	ldrsb r0, [r5, r0]
	ldrh r6, [r5, #6]
	subs r0, r6, r0
	ands r0, r2
	strh r0, [r5, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #7
	ble _08005E7E
	movs r0, #0
	mov sl, r0
	ldr r2, _08005E38 @ =gUnknown_03000000
	mov ip, r2
	ldr r3, _08005E3C @ =0x0000017F
	mov sb, r3
_08005DC2:
	ldrb r0, [r5]
	subs r0, #8
	strb r0, [r5]
	ldrb r1, [r5, #2]
	adds r1, #1
	movs r0, #0x1f
	ands r1, r0
	strb r1, [r5, #2]
	cmp r1, #0x1f
	bne _08005DE0
	mov r6, sl
	strb r6, [r5]
	strb r6, [r5, #1]
	movs r0, #8
	strh r0, [r5, #4]
_08005DE0:
	movs r3, #2
	ldr r1, _08005E40 @ =0x040000D4
	ldr r0, _08005E44 @ =gUnknown_03001880
	mov r8, r0
	ldr r7, _08005E48 @ =gUnknown_03001882
	mov r2, ip
	adds r2, #0x80
	ldr r6, _08005E4C @ =0x80000020
	ldr r4, _08005E50 @ =0x8000001F
_08005DF2:
	str r2, [r1]
	mov r0, r8
	str r0, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	str r7, [r1]
	str r2, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, #0x40
	adds r3, #1
	cmp r3, #0xb
	bls _08005DF2
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	beq _08005E58
	movs r3, #0x40
	mov r2, sb
	ldr r4, _08005E54 @ =gUnknown_080245F8
	mov r1, ip
	adds r1, #0xbe
_08005E1C:
	ldrb r6, [r5, #2]
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x40
	adds r3, #0x20
	cmp r3, r2
	bls _08005E1C
	b _08005E76
	.align 2, 0
_08005E34: .4byte 0x000001FF
_08005E38: .4byte gUnknown_03000000
_08005E3C: .4byte 0x0000017F
_08005E40: .4byte 0x040000D4
_08005E44: .4byte gUnknown_03001880
_08005E48: .4byte gUnknown_03001882
_08005E4C: .4byte 0x80000020
_08005E50: .4byte 0x8000001F
_08005E54: .4byte gUnknown_080245F8
_08005E58:
	movs r3, #0x40
	mov r2, sb
	ldr r4, _08005F0C @ =gUnknown_080242F8
	mov r1, ip
	adds r1, #0xbe
_08005E62:
	ldrb r6, [r5, #2]
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x40
	adds r3, #0x20
	cmp r3, r2
	bls _08005E62
_08005E76:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #7
	bgt _08005DC2
_08005E7E:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #8
	rsbs r2, r2, #0
	cmp r0, r2
	bgt _08005F58
	ldr r0, _08005F10 @ =0x0000017F
	mov sb, r0
	ldr r2, _08005F0C @ =gUnknown_080242F8
	mov sl, r2
	ldr r3, _08005F14 @ =gUnknown_03000000
	mov ip, r3
_08005E98:
	adds r0, r1, #0
	adds r0, #8
	strb r0, [r5]
	ldrb r1, [r5, #2]
	subs r1, #1
	movs r0, #0x1f
	ands r1, r0
	strb r1, [r5, #2]
	cmp r1, #0
	bne _08005EB4
	strb r1, [r5]
	strb r1, [r5, #1]
	movs r0, #8
	strh r0, [r5, #4]
_08005EB4:
	movs r3, #2
	ldr r1, _08005F18 @ =0x040000D4
	ldr r6, _08005F1C @ =gUnknown_03001880
	mov r4, ip
	adds r4, #0x82
	mov r2, ip
	adds r2, #0x80
	ldr r0, _08005F20 @ =0x80000020
	mov r8, r0
	ldr r7, _08005F24 @ =0x8000001F
_08005EC8:
	str r2, [r1]
	str r6, [r1, #4]
	mov r0, r8
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r6, [r1]
	str r4, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r4, #0x40
	adds r2, #0x40
	adds r3, #1
	cmp r3, #0xb
	bls _08005EC8
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	beq _08005F2C
	movs r3, #0x40
	mov r2, sb
	ldr r4, _08005F28 @ =gUnknown_080245F8
	mov r1, ip
	adds r1, #0x80
_08005EF4:
	ldrb r6, [r5, #2]
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x40
	adds r3, #0x20
	cmp r3, r2
	bls _08005EF4
	b _08005F4A
	.align 2, 0
_08005F0C: .4byte gUnknown_080242F8
_08005F10: .4byte 0x0000017F
_08005F14: .4byte gUnknown_03000000
_08005F18: .4byte 0x040000D4
_08005F1C: .4byte gUnknown_03001880
_08005F20: .4byte 0x80000020
_08005F24: .4byte 0x8000001F
_08005F28: .4byte gUnknown_080245F8
_08005F2C:
	movs r3, #0x40
	mov r2, sb
	mov r4, sl
	mov r1, ip
	adds r1, #0x80
_08005F36:
	ldrb r6, [r5, #2]
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x40
	adds r3, #0x20
	cmp r3, r2
	bls _08005F36
_08005F4A:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #8
	rsbs r2, r2, #0
	cmp r0, r2
	ble _08005E98
_08005F58:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8005F68
sub_8005F68: @ 0x08005F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldrb r1, [r5]
	ldrb r2, [r5, #1]
	adds r0, r1, r2
	strb r0, [r5]
	movs r1, #1
	ldrsb r1, [r5, r1]
	ldrh r2, [r5, #4]
	subs r1, r2, r1
	ldr r2, _0800608C @ =0x000001FF
	ands r1, r2
	strh r1, [r5, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _08005FFE
	movs r0, #0
	mov sb, r0
	ldr r1, _08006090 @ =gUnknown_03001880
	mov sl, r1
	ldr r2, _08006094 @ =gUnknown_03000000
	mov r8, r2
_08005F9E:
	ldrb r0, [r5]
	subs r0, #8
	strb r0, [r5]
	ldrb r1, [r5, #2]
	adds r1, #1
	movs r0, #0x1f
	ands r1, r0
	strb r1, [r5, #2]
	cmp r1, #0x1f
	bne _08005FB8
	mov r0, sb
	strb r0, [r5]
	strb r0, [r5, #1]
_08005FB8:
	movs r4, #2
	ldr r1, _08006098 @ =0x040000D4
	mov ip, sl
	ldr r7, _0800609C @ =gUnknown_03001882
	mov r2, r8
	adds r2, #0x80
	ldr r6, _080060A0 @ =0x80000020
	ldr r3, _080060A4 @ =0x8000001F
_08005FC8:
	str r2, [r1]
	mov r0, ip
	str r0, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	str r7, [r1]
	str r2, [r1, #4]
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #0xb
	bls _08005FC8
	movs r4, #0x40
	ldr r2, _080060A8 @ =0x0000017F
	movs r1, #0
	mov r0, r8
	adds r0, #0xbe
_08005FEC:
	strh r1, [r0]
	adds r0, #0x40
	adds r4, #0x20
	cmp r4, r2
	bls _08005FEC
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #7
	bgt _08005F9E
_08005FFE:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #8
	rsbs r2, r2, #0
	cmp r0, r2
	bgt _0800607C
	mov sl, r2
	ldr r2, _08006090 @ =gUnknown_03001880
	mov sb, r2
	ldr r0, _08006094 @ =gUnknown_03000000
	mov r8, r0
_08006016:
	adds r0, r1, #0
	adds r0, #8
	strb r0, [r5]
	ldrb r1, [r5, #2]
	subs r1, #1
	movs r0, #0x1f
	ands r1, r0
	strb r1, [r5, #2]
	cmp r1, #0
	bne _0800602E
	strb r1, [r5]
	strb r1, [r5, #1]
_0800602E:
	movs r4, #2
	ldr r1, _08006098 @ =0x040000D4
	mov r6, sb
	mov r3, r8
	adds r3, #0x82
	mov r2, r8
	adds r2, #0x80
	ldr r0, _080060A0 @ =0x80000020
	mov ip, r0
	ldr r7, _080060A4 @ =0x8000001F
_08006042:
	str r2, [r1]
	str r6, [r1, #4]
	mov r0, ip
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r6, [r1]
	str r3, [r1, #4]
	str r7, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, #0x40
	adds r2, #0x40
	adds r4, #1
	cmp r4, #0xb
	bls _08006042
	movs r4, #0x40
	ldr r2, _080060A8 @ =0x0000017F
	movs r1, #0
	mov r0, r8
	adds r0, #0x80
_08006068:
	strh r1, [r0]
	adds r0, #0x40
	adds r4, #0x20
	cmp r4, r2
	bls _08006068
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, sl
	ble _08006016
_0800607C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800608C: .4byte 0x000001FF
_08006090: .4byte gUnknown_03001880
_08006094: .4byte gUnknown_03000000
_08006098: .4byte 0x040000D4
_0800609C: .4byte gUnknown_03001882
_080060A0: .4byte 0x80000020
_080060A4: .4byte 0x8000001F
_080060A8: .4byte 0x0000017F

	thumb_func_start sub_80060AC
sub_80060AC: @ 0x080060AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080060DC @ =gMain
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _080060D4
	ldr r1, _080060E0 @ =gUnknown_0814D8D4
	ldrb r2, [r4, #3]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r1, _080060E4 @ =gIORegisters
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #8
	strh r0, [r1, #0x10]
_080060D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080060DC: .4byte gMain
_080060E0: .4byte gUnknown_0814D8D4
_080060E4: .4byte gIORegisters

	thumb_func_start sub_80060E8
sub_80060E8: @ 0x080060E8
	ldr r1, _080060FC @ =gUnknown_080248F8
	ldr r2, _08006100 @ =gUnknown_03001080
	ldr r0, _08006104 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _08006108 @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_080060FC: .4byte gUnknown_080248F8
_08006100: .4byte gUnknown_03001080
_08006104: .4byte 0x040000D4
_08006108: .4byte 0x800002C0

	thumb_func_start sub_800610C
sub_800610C: @ 0x0800610C
	ldr r1, _08006120 @ =gUnknown_08024E78
	ldr r2, _08006124 @ =gUnknown_03001080
	ldr r0, _08006128 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0800612C @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_08006120: .4byte gUnknown_08024E78
_08006124: .4byte gUnknown_03001080
_08006128: .4byte 0x040000D4
_0800612C: .4byte 0x800002C0

	thumb_func_start sub_8006130
sub_8006130: @ 0x08006130
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08006170 @ =gMain
	movs r2, #0xb1
	lsls r2, r2, #2
	adds r1, r0, r2
	strb r5, [r1]
	ldr r3, _08006174 @ =0x000002C5
	adds r0, r0, r3
	strb r6, [r0]
	ldr r0, _08006178 @ =gUnknown_0814D8E8
	adds r0, r5, r0
	ldrb r5, [r0]
	cmp r5, #0
	bne _08006184
	movs r4, #0xc0
	lsls r4, r4, #1
	subs r3, #0xe6
	ldr r0, _0800617C @ =gUnknown_03002080
	ldr r2, _08006180 @ =gUnknown_08023EF8
	movs r5, #0xc0
	lsls r5, r5, #2
	adds r1, r0, r5
_08006160:
	adds r0, r4, r2
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r4, #1
	cmp r4, r3
	bls _08006160
	b _08006232
	.align 2, 0
_08006170: .4byte gMain
_08006174: .4byte 0x000002C5
_08006178: .4byte gUnknown_0814D8E8
_0800617C: .4byte gUnknown_03002080
_08006180: .4byte gUnknown_08023EF8
_08006184:
	adds r0, r5, #0
	movs r1, #5
	bl __udivsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #5
	bl __umodsi3
	lsls r4, r4, #0xb
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #6
	ldr r2, _080061CC @ =gUnknown_08181820
	adds r0, r4, r2
	adds r1, r1, r0
	ldr r0, _080061D0 @ =0x040000D4
	str r1, [r0]
	ldr r2, _080061D4 @ =0x06000A80
	str r2, [r0, #4]
	ldr r2, _080061D8 @ =0x80000060
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r1, r3
	str r1, [r0]
	ldr r1, _080061DC @ =0x06000B40
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	cmp r6, #0
	beq _080061E4
	movs r6, #0x18
	ldr r2, _080061E0 @ =gUnknown_08023EF2
	b _080061E6
	.align 2, 0
_080061CC: .4byte gUnknown_08181820
_080061D0: .4byte 0x040000D4
_080061D4: .4byte 0x06000A80
_080061D8: .4byte 0x80000060
_080061DC: .4byte 0x06000B40
_080061E0: .4byte gUnknown_08023EF2
_080061E4:
	ldr r2, _08006238 @ =gUnknown_08023EEC
_080061E6:
	ldr r3, _0800623C @ =gUnknown_03002400
	lsls r0, r6, #1
	adds r3, r0, r3
	movs r4, #0
	adds r1, r0, #0
	ldr r5, _08006240 @ =gUnknown_03002380
	ldr r6, _08006244 @ =gUnknown_08023EE0
	adds r7, r5, #0
	adds r7, #0x40
	adds r0, r6, #6
	mov ip, r0
_080061FC:
	ldrb r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	adds r4, #1
	cmp r4, #5
	bls _080061FC
	adds r3, r1, r5
	adds r2, r6, #0
	movs r4, #0
_08006210:
	ldrb r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	adds r4, #1
	cmp r4, #5
	bls _08006210
	adds r3, r1, r7
	mov r2, ip
	movs r4, #0
_08006224:
	ldrb r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	adds r4, #1
	cmp r4, #5
	bls _08006224
_08006232:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006238: .4byte gUnknown_08023EEC
_0800623C: .4byte gUnknown_03002400
_08006240: .4byte gUnknown_03002380
_08006244: .4byte gUnknown_08023EE0

	thumb_func_start UpdateBGTilemaps
UpdateBGTilemaps: @ 0x08006248
	push {r4, lr}
	ldr r3, _08006310 @ =gMain
	ldr r2, _08006314 @ =gIORegisters
	movs r0, #1
	ldrb r1, [r3, #0x1a]
	ands r0, r1
	cmp r0, #0
	beq _0800626E
	ldr r1, _08006318 @ =0x040000D4
	ldr r0, _0800631C @ =gUnknown_03002FA0
	str r0, [r1]
	ldr r0, _08006320 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _08006324 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xc4
	ldr r0, [r2, #8]
	str r0, [r1]
_0800626E:
	ldrb r3, [r3, #0x1a]
	movs r0, #2
	ands r0, r3
	adds r4, r3, #0
	cmp r0, #0
	beq _08006290
	ldr r1, _08006318 @ =0x040000D4
	ldr r0, _08006328 @ =gUnknown_03002080
	str r0, [r1]
	ldr r0, _0800632C @ =0x0600E800
	str r0, [r1, #4]
	ldr r0, _08006324 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xc0
	ldr r0, [r2, #0xc]
	str r0, [r1]
_08006290:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _080062C6
	ldr r1, _08006318 @ =0x040000D4
	ldr r0, _08006330 @ =gUnknown_03000000
	str r0, [r1]
	ldr r0, _08006334 @ =0x0600F000
	str r0, [r1, #4]
	ldr r0, _08006324 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xbc
	ldr r0, [r2, #0x10]
	str r0, [r1]
	adds r1, #8
	ldr r0, [r2, #0x18]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x1c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x20]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x24]
	str r0, [r1]
_080062C6:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _080062FC
	ldr r1, _08006318 @ =0x040000D4
	ldr r0, _08006338 @ =gUnknown_03001080
	str r0, [r1]
	ldr r0, _0800633C @ =0x0600F800
	str r0, [r1, #4]
	ldr r0, _08006324 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xb8
	ldr r0, [r2, #0x14]
	str r0, [r1]
	adds r1, #0x14
	ldr r0, [r2, #0x28]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x2c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x30]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x34]
	str r0, [r1]
_080062FC:
	ldr r1, _08006340 @ =0x04000008
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006310: .4byte gMain
_08006314: .4byte gIORegisters
_08006318: .4byte 0x040000D4
_0800631C: .4byte gUnknown_03002FA0
_08006320: .4byte 0x0600E000
_08006324: .4byte 0x80000400
_08006328: .4byte gUnknown_03002080
_0800632C: .4byte 0x0600E800
_08006330: .4byte gUnknown_03000000
_08006334: .4byte 0x0600F000
_08006338: .4byte gUnknown_03001080
_0800633C: .4byte 0x0600F800
_08006340: .4byte 0x04000008

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
	bl sub_80065AC
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
	bl sub_80065AC
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
	bl sub_80065AC
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

	thumb_func_start sub_80067A8
sub_80067A8: @ 0x080067A8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	bne _080067F4
	ldr r3, _080067E8 @ =gUnknown_03002D40
	ldr r2, _080067EC @ =gInvestigation
	ldrb r1, [r2, #0x18]
	lsls r0, r1, #0xc
	movs r5, #0x84
	lsls r5, r5, #3
	adds r1, r5, #0
	adds r0, r0, r1
	strh r0, [r3, #4]
	adds r3, #8
	ldrb r2, [r2, #0x18]
	lsls r0, r2, #0xc
	movs r2, #0x85
	lsls r2, r2, #3
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r3, #4]
	adds r3, #8
	movs r0, #0xf0
	ldrb r4, [r4, #0x1b]
	ands r0, r4
	cmp r0, #0
	beq _0800681E
	ldr r0, _080067F0 @ =0x00005030
	strh r0, [r3, #4]
	adds r0, #8
	b _0800681C
	.align 2, 0
_080067E8: .4byte gUnknown_03002D40
_080067EC: .4byte gInvestigation
_080067F0: .4byte 0x00005030
_080067F4:
	ldr r3, _08006824 @ =gUnknown_03002D40
	ldr r0, _08006828 @ =0x00005420
	strh r0, [r3, #4]
	adds r3, #8
	adds r0, #8
	strh r0, [r3, #4]
	adds r3, #8
	movs r0, #0xf0
	ldrb r4, [r4, #0x1b]
	ands r0, r4
	cmp r0, #0
	beq _0800681E
	ldr r0, _0800682C @ =gInvestigation
	ldrb r5, [r0, #0x18]
	lsls r1, r5, #0xc
	adds r1, #0x30
	strh r1, [r3, #4]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0xc
	adds r0, #0x38
_0800681C:
	strh r0, [r3, #0xc]
_0800681E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006824: .4byte gUnknown_03002D40
_08006828: .4byte 0x00005420
_0800682C: .4byte gInvestigation

	thumb_func_start sub_8006830
sub_8006830: @ 0x08006830
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _080068D4 @ =gIORegisters
	mov ip, r0
	ldr r1, _080068D8 @ =0x040000D4
	ldr r0, _080068DC @ =gPalNewGameContinue
	str r0, [r1]
	ldr r0, _080068E0 @ =0x05000240
	str r0, [r1, #4]
	ldr r0, _080068E4 @ =0x80000060
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080068E8 @ =gGfxNewGameContinue
	str r0, [r1]
	ldr r0, _080068EC @ =0x06010400
	str r0, [r1, #4]
	ldr r0, _080068F0 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _080068F4 @ =gUnknown_03002D40
	movs r7, #0
	ldr r1, _080068F8 @ =0x00004070
	strh r1, [r2]
	ldr r5, _080068FC @ =0x00008058
	strh r5, [r2, #2]
	ldr r0, _08006900 @ =0x00002420
	strh r0, [r2, #4]
	adds r2, #8
	strh r1, [r2]
	ldr r4, _08006904 @ =0x00008078
	strh r4, [r2, #2]
	adds r0, #8
	strh r0, [r2, #4]
	adds r2, #8
	movs r6, #0xf0
	adds r0, r6, #0
	ldrb r1, [r3, #0x1b]
	ands r0, r1
	cmp r0, #0
	beq _08006894
	ldr r0, _08006908 @ =0x00004084
	strh r0, [r2]
	strh r5, [r2, #2]
	ldr r1, _0800690C @ =0x00002030
	strh r1, [r2, #4]
	adds r2, #8
	strh r0, [r2]
	strh r4, [r2, #2]
	ldr r0, _08006910 @ =0x00002038
	strh r0, [r2, #4]
_08006894:
	mov r1, ip
	adds r1, #0x4a
	movs r0, #0xca
	lsls r0, r0, #5
	strh r0, [r1]
	ldr r1, _08006914 @ =gInvestigation
	strb r7, [r1, #0x19]
	movs r0, #2
	strb r0, [r1, #0x18]
	strb r7, [r3, #0x17]
	adds r0, r6, #0
	ldrb r1, [r3, #0x1b]
	ands r0, r1
	cmp r0, #0
	beq _080068B6
	movs r0, #1
	strb r0, [r3, #0x17]
_080068B6:
	movs r0, #0x98
	lsls r0, r0, #2
	adds r2, r3, r0
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #9
	strb r0, [r3, #0x1a]
	adds r0, r3, #0
	bl sub_80067A8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080068D4: .4byte gIORegisters
_080068D8: .4byte 0x040000D4
_080068DC: .4byte gPalNewGameContinue
_080068E0: .4byte 0x05000240
_080068E4: .4byte 0x80000060
_080068E8: .4byte gGfxNewGameContinue
_080068EC: .4byte 0x06010400
_080068F0: .4byte 0x80000200
_080068F4: .4byte gUnknown_03002D40
_080068F8: .4byte 0x00004070
_080068FC: .4byte 0x00008058
_08006900: .4byte 0x00002420
_08006904: .4byte 0x00008078
_08006908: .4byte 0x00004084
_0800690C: .4byte 0x00002030
_08006910: .4byte 0x00002038
_08006914: .4byte gInvestigation

	thumb_func_start sub_8006918
sub_8006918: @ 0x08006918
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08006934 @ =gIORegisters
	ldrb r0, [r6, #9]
	cmp r0, #1
	bne _08006928
	b _08006A60
_08006928:
	cmp r0, #1
	bgt _08006938
	cmp r0, #0
	beq _08006940
	b _08006A9C
	.align 2, 0
_08006934: .4byte gIORegisters
_08006938:
	cmp r0, #2
	bne _0800693E
	b _08006A8E
_0800693E:
	b _08006A9C
_08006940:
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r4]
	ldr r0, _08006A1C @ =0x00003D01
	strh r0, [r4, #2]
	adds r0, #0xff
	strh r0, [r4, #4]
	ldr r0, _08006A20 @ =0x00003F47
	strh r0, [r4, #6]
	ldr r5, _08006A24 @ =gUnknown_0820E31C
	ldr r1, _08006A28 @ =gUnknown_02011FC0
	ldr r0, _08006A2C @ =gUnknown_0820E33C
	bl LZ77UnCompWram
	ldr r1, _08006A30 @ =0x040000D4
	str r5, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08006A34 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0
	ldr r3, _08006A38 @ =0x000003FF
	movs r0, #0x4a
	adds r0, r0, r4
	mov ip, r0
	adds r7, r4, #0
	adds r7, #0x4e
	movs r1, #0
	ldr r0, _08006A3C @ =gUnknown_03001080
_0800697E:
	strh r1, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, r3
	bls _0800697E
	movs r2, #0
	ldr r5, _08006A40 @ =gIORegisters
	ldr r4, _08006A3C @ =gUnknown_03001080
_0800698E:
	ldr r1, _08006A44 @ =0x00000107
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r3, r2, #1
	strh r3, [r0]
	adds r1, #0x20
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r1, r2, #0
	adds r1, #0x11
	strh r1, [r0]
	ldr r1, _08006A48 @ =0x00000147
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r1, r2, #0
	adds r1, #0x21
	strh r1, [r0]
	ldr r1, _08006A4C @ =0x00000167
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r1, r2, #0
	adds r1, #0x31
	strh r1, [r0]
	adds r2, r3, #0
	cmp r2, #0xf
	bls _0800698E
	movs r2, #0
	strh r2, [r5, #0x10]
	movs r4, #8
	movs r0, #8
	strh r0, [r5, #0x12]
	ldr r5, _08006A28 @ =gUnknown_02011FC0
	ldr r1, _08006A50 @ =0x06004020
	ldr r0, _08006A30 @ =0x040000D4
	str r5, [r0]
	str r1, [r0, #4]
	ldr r1, _08006A54 @ =0x80000400
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r2, [r1]
	str r1, [r0]
	ldr r1, _08006A58 @ =0x06004000
	str r1, [r0, #4]
	ldr r1, _08006A5C @ =0x81000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #4
	mov r1, ip
	strh r0, [r1]
	movs r0, #0x10
	strh r0, [r7]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	strb r4, [r6, #0x1a]
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	movs r0, #0x78
	strb r0, [r6, #0xb]
	b _08006A9C
	.align 2, 0
_08006A1C: .4byte 0x00003D01
_08006A20: .4byte 0x00003F47
_08006A24: .4byte gUnknown_0820E31C
_08006A28: .4byte gUnknown_02011FC0
_08006A2C: .4byte gUnknown_0820E33C
_08006A30: .4byte 0x040000D4
_08006A34: .4byte 0x80000010
_08006A38: .4byte 0x000003FF
_08006A3C: .4byte gUnknown_03001080
_08006A40: .4byte gIORegisters
_08006A44: .4byte 0x00000107
_08006A48: .4byte 0x00000147
_08006A4C: .4byte 0x00000167
_08006A50: .4byte 0x06004020
_08006A54: .4byte 0x80000400
_08006A58: .4byte 0x06004000
_08006A5C: .4byte 0x81000010
_08006A60:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _08006A9C
	ldrb r0, [r6, #0xb]
	adds r4, r0, #0
	cmp r4, #0
	beq _08006A78
	subs r0, #1
	strb r0, [r6, #0xb]
	b _08006A9C
_08006A78:
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	strb r4, [r6, #0x1a]
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	b _08006A9C
_08006A8E:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _08006A9C
	movs r0, #1
	str r0, [r6, #8]
_08006A9C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8006AA4
sub_8006AA4: @ 0x08006AA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #9]
	cmp r1, #1
	beq _08006AD4
	cmp r1, #1
	bgt _08006AB8
	cmp r1, #0
	beq _08006AC2
	b _08006CD6
_08006AB8:
	cmp r1, #2
	beq _08006AFC
	cmp r1, #3
	beq _08006B94
	b _08006CD6
_08006AC2:
	bl ResetGameState
	bl sub_8007120
	ldr r0, _08006AD0 @ =0x00000101
	str r0, [r4, #8]
	b _08006CD6
	.align 2, 0
_08006AD0: .4byte 0x00000101
_08006AD4:
	movs r0, #0x14
	bl sub_8003D5C
	movs r0, #0x14
	bl sub_80049A0
	adds r0, r4, #0
	bl sub_8006830
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r0, _08006AF8 @ =0x00000201
	str r0, [r4, #8]
	b _08006CD6
	.align 2, 0
_08006AF8: .4byte 0x00000201
_08006AFC:
	ldr r0, _08006B1C @ =gJoypad
	ldrh r3, [r0, #2]
	movs r2, #9
	ands r2, r3
	cmp r2, #0
	beq _08006B28
	movs r0, #0x3a
	bl sub_8011150
	ldr r0, _08006B20 @ =gScriptContext
	movs r1, #0
	strh r1, [r0, #0x16]
	ldr r0, _08006B24 @ =0x00000301
	str r0, [r4, #8]
	b _08006B4E
	.align 2, 0
_08006B1C: .4byte gJoypad
_08006B20: .4byte gScriptContext
_08006B24: .4byte 0x00000301
_08006B28:
	movs r0, #0xf0
	ldrb r5, [r4, #0x1b]
	ands r0, r5
	cmp r0, #0
	beq _08006B4E
	movs r0, #0xc0
	ands r0, r3
	cmp r0, #0
	beq _08006B4E
	ldr r0, _08006B68 @ =gInvestigation
	strb r2, [r0, #0x19]
	strb r1, [r0, #0x18]
	movs r0, #1
	ldrb r6, [r4, #0x17]
	eors r0, r6
	strb r0, [r4, #0x17]
	movs r0, #0x2a
	bl sub_8011150
_08006B4E:
	ldr r0, _08006B68 @ =gInvestigation
	ldrb r2, [r0, #0x18]
	adds r1, r0, #0
	cmp r2, #2
	bne _08006B6C
	ldrb r0, [r1, #0x19]
	adds r0, #1
	strb r0, [r1, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bls _08006B82
	b _08006B7A
	.align 2, 0
_08006B68: .4byte gInvestigation
_08006B6C:
	ldrb r0, [r1, #0x19]
	adds r0, #1
	strb r0, [r1, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08006B82
_08006B7A:
	movs r0, #0
	strb r0, [r1, #0x19]
	adds r0, r2, #1
	strb r0, [r1, #0x18]
_08006B82:
	ldrb r0, [r1, #0x18]
	cmp r0, #6
	bls _08006B8C
	movs r0, #2
	strb r0, [r1, #0x18]
_08006B8C:
	adds r0, r4, #0
	bl sub_80067A8
	b _08006CD6
_08006B94:
	ldrb r0, [r4, #0xb]
	adds r0, #1
	strb r0, [r4, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4, #0x17]
	cmp r0, #0x27
	bls _08006BB0
	cmp r1, #0
	bne _08006BAC
	movs r0, #0xc
	b _08006BAE
_08006BAC:
	movs r0, #0xd
_08006BAE:
	str r0, [r4, #8]
_08006BB0:
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _08006C50
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08006BF4
	ldr r2, _08006BE8 @ =gUnknown_03002D40
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	ldr r1, _08006BEC @ =0x00002020
	strh r1, [r2, #4]
	adds r2, #8
	strh r0, [r2]
	ldr r0, _08006BF0 @ =0x00002028
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r1, [r4, #0xa]
	cmp r1, #8
	bls _08006C08
	movs r0, #0
	strb r0, [r4, #0xa]
	b _08006C08
	.align 2, 0
_08006BE8: .4byte gUnknown_03002D40
_08006BEC: .4byte 0x00002020
_08006BF0: .4byte 0x00002028
_08006BF4:
	ldr r2, _08006C3C @ =gUnknown_03002D40
	ldr r0, _08006C40 @ =0x00004070
	strh r0, [r2]
	ldr r1, _08006C44 @ =0x00002020
	strh r1, [r2, #4]
	adds r2, #8
	strh r0, [r2]
	ldr r0, _08006C48 @ =0x00002028
	strh r0, [r2, #4]
	adds r2, #8
_08006C08:
	movs r0, #0xf0
	ldrb r4, [r4, #0x1b]
	ands r0, r4
	ldr r5, _08006C4C @ =gScriptContext
	cmp r0, #0
	beq _08006CD0
	ldrh r1, [r2]
	movs r3, #0xff
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0xe0
	bhi _08006C26
	ldrh r4, [r5, #0x16]
	adds r0, r4, r1
	strh r0, [r2]
_08006C26:
	adds r2, #8
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0xe0
	bhi _08006CD0
	ldrh r6, [r5, #0x16]
	adds r0, r6, r1
	strh r0, [r2]
	b _08006CD0
	.align 2, 0
_08006C3C: .4byte gUnknown_03002D40
_08006C40: .4byte 0x00004070
_08006C44: .4byte 0x00002020
_08006C48: .4byte 0x00002028
_08006C4C: .4byte gScriptContext
_08006C50:
	ldr r2, _08006CB0 @ =gUnknown_03002D40
	ldrh r1, [r2]
	movs r3, #0xff
	adds r0, r3, #0
	ands r0, r1
	ldr r5, _08006CB4 @ =gScriptContext
	cmp r0, #0xe0
	bhi _08006C66
	ldrh r6, [r5, #0x16]
	adds r0, r6, r1
	strh r0, [r2]
_08006C66:
	adds r2, #8
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0xe0
	bhi _08006C78
	ldrh r3, [r5, #0x16]
	adds r0, r3, r1
	strh r0, [r2]
_08006C78:
	adds r2, #8
	movs r0, #0xf0
	ldrb r6, [r4, #0x1b]
	ands r0, r6
	cmp r0, #0
	beq _08006CD0
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08006CC0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	ldr r1, _08006CB8 @ =0x00002030
	strh r1, [r2, #4]
	adds r2, #8
	strh r0, [r2]
	ldr r0, _08006CBC @ =0x00002038
	strh r0, [r2, #4]
	ldrb r0, [r4, #0xa]
	cmp r0, #8
	bls _08006CD0
	movs r0, #0
	strb r0, [r4, #0xa]
	b _08006CD0
	.align 2, 0
_08006CB0: .4byte gUnknown_03002D40
_08006CB4: .4byte gScriptContext
_08006CB8: .4byte 0x00002030
_08006CBC: .4byte 0x00002038
_08006CC0:
	ldr r0, _08006CDC @ =0x00004084
	strh r0, [r2]
	ldr r1, _08006CE0 @ =0x00002030
	strh r1, [r2, #4]
	adds r2, #8
	strh r0, [r2]
	ldr r0, _08006CE4 @ =0x00002038
	strh r0, [r2, #4]
_08006CD0:
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
_08006CD6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006CDC: .4byte 0x00004084
_08006CE0: .4byte 0x00002030
_08006CE4: .4byte 0x00002038

	thumb_func_start sub_8006CE8
sub_8006CE8: @ 0x08006CE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, _08006D08 @ =gIORegisters
	ldrb r0, [r6, #9]
	cmp r0, #1
	beq _08006D94
	cmp r0, #1
	bgt _08006D0C
	cmp r0, #0
	beq _08006D1A
	b _08006E92
	.align 2, 0
_08006D08: .4byte gIORegisters
_08006D0C:
	cmp r0, #2
	bne _08006D12
	b _08006E50
_08006D12:
	cmp r0, #3
	bne _08006D18
	b _08006E70
_08006D18:
	b _08006E92
_08006D1A:
	ldr r1, _08006D70 @ =0x040000D4
	ldr r0, _08006D74 @ =gGfxGameOverDoors
	str r0, [r1]
	ldr r0, _08006D78 @ =0x06001400
	str r0, [r1, #4]
	ldr r0, _08006D7C @ =0x80000170
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08006D80 @ =gPalGameOverDoors
	str r0, [r1]
	ldr r0, _08006D84 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _08006D88 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	ldr r2, _08006D8C @ =0x000003FF
	adds r4, r3, #0
	adds r4, #0x4a
	movs r1, #0
	ldr r0, _08006D90 @ =gUnknown_03000000
_08006D44:
	strh r1, [r0]
	adds r0, #2
	adds r5, #1
	cmp r5, r2
	bls _08006D44
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #0x12]
	movs r0, #8
	strh r0, [r3, #0x10]
	movs r0, #0xf8
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #0xea
	lsls r0, r0, #5
	strh r0, [r4]
	movs r0, #0xc
	strb r0, [r6, #0x1a]
	ldrb r0, [r6, #9]
	adds r0, #1
	b _08006E42
	.align 2, 0
_08006D70: .4byte 0x040000D4
_08006D74: .4byte gGfxGameOverDoors
_08006D78: .4byte 0x06001400
_08006D7C: .4byte 0x80000170
_08006D80: .4byte gPalGameOverDoors
_08006D84: .4byte 0x05000020
_08006D88: .4byte 0x80000010
_08006D8C: .4byte 0x000003FF
_08006D90: .4byte gUnknown_03000000
_08006D94:
	movs r5, #0
	ldr r0, _08006E48 @ =gUnknown_03000000
	mov sb, r0
	mov r8, r5
	ldr r0, _08006E4C @ =gUnknown_08026718
	adds r0, #0xe
	mov sl, r0
_08006DA2:
	lsls r0, r5, #6
	mov r1, sb
	adds r2, r0, r1
	ldrb r1, [r6, #0xa]
	lsls r0, r1, #1
	adds r2, r2, r0
	movs r4, #0
	cmp r4, r1
	bhs _08006DD8
	mov r3, r8
	add r3, sl
	movs r0, #0x85
	lsls r0, r0, #5
	mov ip, r0
	movs r7, #0xa0
	lsls r7, r7, #2
_08006DC2:
	ldrb r1, [r3]
	add r1, ip
	strh r1, [r2]
	adds r0, r2, r7
	strh r1, [r0]
	subs r2, #2
	subs r3, #1
	adds r4, #1
	ldrb r1, [r6, #0xa]
	cmp r4, r1
	blo _08006DC2
_08006DD8:
	movs r0, #0xf
	add r8, r0
	adds r5, #1
	cmp r5, #9
	bls _08006DA2
	movs r5, #0
	ldr r0, _08006E4C @ =gUnknown_08026718
	adds r0, #0xe
	mov r8, r0
_08006DEA:
	lsls r0, r5, #6
	mov r1, sb
	adds r2, r0, r1
	ldrb r1, [r6, #0xa]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r4, #0
	adds r7, r5, #1
	cmp r4, r1
	bhs _08006E2A
	lsls r0, r5, #4
	subs r0, r0, r5
	mov r1, r8
	adds r3, r0, r1
	movs r0, #0xa5
	lsls r0, r0, #5
	mov ip, r0
	movs r5, #0xa0
	lsls r5, r5, #2
_08006E14:
	ldrb r1, [r3]
	add r1, ip
	strh r1, [r2]
	adds r0, r2, r5
	strh r1, [r0]
	adds r2, #2
	subs r3, #1
	adds r4, #1
	ldrb r1, [r6, #0xa]
	cmp r4, r1
	blo _08006E14
_08006E2A:
	adds r5, r7, #0
	cmp r5, #9
	bls _08006DEA
	ldrb r0, [r6, #0xa]
	cmp r0, #0xe
	bls _08006E6A
	movs r0, #0x56
	bl sub_8011150
	ldrb r0, [r6, #9]
	adds r0, #1
	movs r1, #0
_08006E42:
	strb r0, [r6, #9]
	strb r1, [r6, #0xa]
	b _08006E92
	.align 2, 0
_08006E48: .4byte gUnknown_03000000
_08006E4C: .4byte gUnknown_08026718
_08006E50:
	ldrb r0, [r6, #0xa]
	cmp r0, #0x77
	bls _08006E6A
	movs r0, #2
	movs r1, #3
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	b _08006E92
_08006E6A:
	adds r0, #1
	strb r0, [r6, #0xa]
	b _08006E92
_08006E70:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r1, [r0]
	cmp r1, #0
	bne _08006E92
	mov r0, sp
	strh r1, [r0]
	ldr r1, _08006EA4 @ =0x040000D4
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08006EA8 @ =0x81000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	str r0, [r6, #8]
_08006E92:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006EA4: .4byte 0x040000D4
_08006EA8: .4byte 0x81000200

	thumb_func_start sub_8006EAC
sub_8006EAC: @ 0x08006EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r3, _08006ED0 @ =gIORegisters
	ldr r2, _08006ED4 @ =gScriptContext
	adds r4, r2, #0
	adds r4, #0x46
	ldrh r0, [r4]
	cmp r0, #1
	beq _08006F70
	cmp r0, #1
	bgt _08006ED8
	cmp r0, #0
	beq _08006EE6
	b _08007096
	.align 2, 0
_08006ED0: .4byte gIORegisters
_08006ED4: .4byte gScriptContext
_08006ED8:
	cmp r0, #2
	bne _08006EDE
	b _08007048
_08006EDE:
	cmp r0, #3
	bne _08006EE4
	b _0800706C
_08006EE4:
	b _08007096
_08006EE6:
	ldr r1, _08006F48 @ =0x040000D4
	ldr r0, _08006F4C @ =gGfxGameOverDoors
	str r0, [r1]
	ldr r0, _08006F50 @ =0x06001400
	str r0, [r1, #4]
	ldr r0, _08006F54 @ =0x80000170
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08006F58 @ =gPalGameOverDoors
	str r0, [r1]
	ldr r0, _08006F5C @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _08006F60 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	ldr r2, _08006F64 @ =0x000003FF
	adds r4, r3, #0
	adds r4, #0x4a
	movs r1, #0
	ldr r0, _08006F68 @ =gUnknown_03002FA0
_08006F10:
	strh r1, [r0]
	adds r0, #2
	adds r5, #1
	cmp r5, r2
	bls _08006F10
	movs r1, #0
	movs r0, #8
	strh r0, [r3, #8]
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r3]
	movs r0, #0xfa
	lsls r0, r0, #5
	strh r0, [r4]
	movs r0, #0xb
	strb r0, [r6, #0x1a]
	ldr r2, _08006F6C @ =gScriptContext
	adds r2, #0x46
	movs r0, #1
	strh r0, [r2]
	ldr r0, _08006F6C @ =gScriptContext
	adds r0, #0x48
	strh r1, [r0]
	ldr r0, _08006F6C @ =gScriptContext
	adds r0, #0x4a
	strh r1, [r0]
	b _08007096
	.align 2, 0
_08006F48: .4byte 0x040000D4
_08006F4C: .4byte gGfxGameOverDoors
_08006F50: .4byte 0x06001400
_08006F54: .4byte 0x80000170
_08006F58: .4byte gPalGameOverDoors
_08006F5C: .4byte 0x05000020
_08006F60: .4byte 0x80000010
_08006F64: .4byte 0x000003FF
_08006F68: .4byte gUnknown_03002FA0
_08006F6C: .4byte gScriptContext
_08006F70:
	movs r5, #0
	ldr r0, _08007038 @ =gUnknown_03002FA0
	mov sb, r0
	adds r2, #0x48
	mov r8, r2
	mov ip, r5
	ldr r0, _0800703C @ =gUnknown_08026718
	adds r0, #0xe
	mov sl, r0
_08006F82:
	lsls r0, r5, #6
	mov r1, sb
	adds r2, r0, r1
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r2, r2, r0
	movs r4, #0
	cmp r4, r1
	bhs _08006FBA
	mov r3, ip
	add r3, sl
	movs r7, #0x85
	lsls r7, r7, #5
	movs r6, #0xa0
	lsls r6, r6, #2
_08006FA2:
	ldrb r0, [r3]
	adds r1, r0, r7
	strh r1, [r2]
	adds r0, r2, r6
	strh r1, [r0]
	subs r2, #2
	subs r3, #1
	adds r4, #1
	mov r1, r8
	ldrh r1, [r1]
	cmp r4, r1
	blo _08006FA2
_08006FBA:
	movs r0, #0xf
	add ip, r0
	adds r5, #1
	cmp r5, #9
	bls _08006F82
	movs r5, #0
	ldr r1, _08007040 @ =gUnknown_03007128
	mov r8, r1
	ldr r0, _0800703C @ =gUnknown_08026718
	adds r0, #0xe
	mov sl, r0
_08006FD0:
	lsls r0, r5, #6
	mov r1, sb
	adds r2, r0, r1
	mov r0, r8
	ldrh r1, [r0]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r4, #0
	adds r6, r5, #1
	cmp r4, r1
	bhs _08007012
	lsls r0, r5, #4
	subs r0, r0, r5
	mov r1, sl
	adds r3, r0, r1
	movs r7, #0xa5
	lsls r7, r7, #5
	movs r5, #0xa0
	lsls r5, r5, #2
_08006FFA:
	ldrb r0, [r3]
	adds r1, r0, r7
	strh r1, [r2]
	adds r0, r2, r5
	strh r1, [r0]
	adds r2, #2
	subs r3, #1
	adds r4, #1
	mov r1, r8
	ldrh r1, [r1]
	cmp r4, r1
	blo _08006FFA
_08007012:
	adds r5, r6, #0
	cmp r5, #9
	bls _08006FD0
	ldr r4, _08007044 @ =gScriptContext
	adds r4, #0x48
	ldrh r0, [r4]
	cmp r0, #0xe
	bls _08007060
	movs r0, #0x56
	bl sub_8011150
	ldr r0, _08007044 @ =gScriptContext
	adds r0, #0x46
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	strh r2, [r4]
	b _08007096
	.align 2, 0
_08007038: .4byte gUnknown_03002FA0
_0800703C: .4byte gUnknown_08026718
_08007040: .4byte gUnknown_03007128
_08007044: .4byte gScriptContext
_08007048:
	adds r1, r2, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0x77
	bls _08007066
	movs r0, #2
	movs r1, #3
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrh r0, [r4]
_08007060:
	adds r0, #1
	strh r0, [r4]
	b _08007096
_08007066:
	adds r0, #1
	strh r0, [r1]
	b _08007096
_0800706C:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r1, [r0]
	cmp r1, #0
	bne _08007096
	movs r0, #0x63
	strh r0, [r4]
	adds r0, r2, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r5, #0
	ldr r2, _080070A4 @ =0x000003FF
	movs r1, #0
	ldr r0, _080070A8 @ =gUnknown_03002FA0
_0800708C:
	strh r1, [r0]
	adds r0, #2
	adds r5, #1
	cmp r5, r2
	bls _0800708C
_08007096:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080070A4: .4byte 0x000003FF
_080070A8: .4byte gUnknown_03002FA0

	thumb_func_start sub_80070AC
sub_80070AC: @ 0x080070AC
	push {lr}
	ldr r2, _080070E4 @ =gSaveDataBuffer
	adds r1, r2, #0
	adds r1, #0x4f
	movs r0, #0xf0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _080070E8 @ =0x040000D4
	ldr r0, _080070EC @ =gUnknown_080267B0
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _080070F0 @ =0x80000019
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl sub_80071BC
	movs r1, #0
	ldr r0, _080070F4 @ =gJoypad
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080070F8
	movs r1, #1
	b _08007104
	.align 2, 0
_080070E4: .4byte gSaveDataBuffer
_080070E8: .4byte 0x040000D4
_080070EC: .4byte gUnknown_080267B0
_080070F0: .4byte 0x80000019
_080070F4: .4byte gJoypad
_080070F8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08007104
	movs r1, #2
_08007104:
	ldr r2, _08007118 @ =0x00002C54
	ldr r0, _0800711C @ =gSaveDataBuffer
	muls r1, r2, r1
	movs r3, #0xe0
	lsls r3, r3, #0x14
	adds r1, r1, r3
	bl WriteSramEx
	pop {r1}
	bx r1
	.align 2, 0
_08007118: .4byte 0x00002C54
_0800711C: .4byte gSaveDataBuffer

	thumb_func_start sub_8007120
sub_8007120: @ 0x08007120
	push {r4, lr}
	movs r3, #0
	ldr r0, _08007138 @ =gJoypad
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800713C
	movs r3, #1
	b _08007148
	.align 2, 0
_08007138: .4byte gJoypad
_0800713C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08007148
	movs r3, #2
_08007148:
	ldr r2, _08007190 @ =0x00002C54
	adds r0, r3, #0
	muls r0, r2, r0
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r0, r1
	ldr r4, _08007194 @ =gSaveDataBuffer
	adds r1, r4, #0
	bl ReadSram
	movs r1, #0
	ldr r2, _08007198 @ =gUnknown_080267B0
_08007160:
	adds r0, r1, r2
	ldrb r0, [r0]
	ldrb r3, [r4]
	cmp r0, r3
	bne _080071A0
	adds r4, #1
	adds r1, #1
	cmp r1, #0x2f
	bls _08007160
	ldr r4, _0800719C @ =gMain
	ldr r0, _08007194 @ =gSaveDataBuffer
	adds r0, #0xf6
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0xc2
	strb r0, [r1]
	bl sub_80071F8
	cmp r0, #0
	beq _080071B0
	movs r0, #0xf0
	strb r0, [r4, #0x1b]
	movs r0, #0
	b _080071B4
	.align 2, 0
_08007190: .4byte 0x00002C54
_08007194: .4byte gSaveDataBuffer
_08007198: .4byte gUnknown_080267B0
_0800719C: .4byte gMain
_080071A0:
	ldr r1, _080071AC @ =gMain
	movs r0, #0
	strb r0, [r1, #0x1b]
	movs r0, #2
	b _080071B4
	.align 2, 0
_080071AC: .4byte gMain
_080071B0:
	strb r0, [r4, #0x1b]
	movs r0, #1
_080071B4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80071BC
sub_80071BC: @ 0x080071BC
	push {r4, lr}
	ldr r1, _080071EC @ =gSaveDataBuffer
	movs r0, #0
	str r0, [r1, #0x30]
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x34
	ldr r4, _080071F0 @ =0x00002C54
	adds r3, r1, r4
	adds r4, r1, #0
	cmp r0, r3
	bhs _080071E0
	adds r1, r3, #0
_080071D6:
	ldrb r3, [r0]
	adds r2, r3, r2
	adds r0, #4
	cmp r0, r1
	blo _080071D6
_080071E0:
	ldr r0, _080071F4 @ =0x00000927
	adds r2, r2, r0
	str r2, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080071EC: .4byte gSaveDataBuffer
_080071F0: .4byte 0x00002C54
_080071F4: .4byte 0x00000927

	thumb_func_start sub_80071F8
sub_80071F8: @ 0x080071F8
	push {r4, lr}
	movs r1, #0
	ldr r0, _08007224 @ =gUnknown_02000034
	ldr r3, _08007228 @ =0x00002C20
	adds r2, r0, r3
	adds r3, r0, #0
	subs r3, #0x34
	cmp r0, r2
	bhs _08007214
_0800720A:
	ldrb r4, [r0]
	adds r1, r4, r1
	adds r0, #4
	cmp r0, r2
	blo _0800720A
_08007214:
	ldr r0, _0800722C @ =0x00000927
	adds r1, r1, r0
	ldr r0, [r3, #0x30]
	cmp r1, r0
	beq _08007230
	movs r0, #0
	b _08007232
	.align 2, 0
_08007224: .4byte gUnknown_02000034
_08007228: .4byte 0x00002C20
_0800722C: .4byte 0x00000927
_08007230:
	movs r0, #1
_08007232:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8007238
sub_8007238: @ 0x08007238
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	movs r4, #1
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #0x13
	bhi _080072FC
	lsls r0, r0, #2
	ldr r1, _08007250 @ =_08007254
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007250: .4byte _08007254
_08007254: @ jump table
	.4byte _080072A4 @ case 0
	.4byte _080072A4 @ case 1
	.4byte _080072B0 @ case 2
	.4byte _080072B0 @ case 3
	.4byte _080072B0 @ case 4
	.4byte _080072B0 @ case 5
	.4byte _080072B0 @ case 6
	.4byte _080072B8 @ case 7
	.4byte _080072B8 @ case 8
	.4byte _080072B8 @ case 9
	.4byte _080072B8 @ case 10
	.4byte _080072B8 @ case 11
	.4byte _080072C0 @ case 12
	.4byte _080072C0 @ case 13
	.4byte _080072C0 @ case 14
	.4byte _080072C0 @ case 15
	.4byte _080072C0 @ case 16
	.4byte _080072C0 @ case 17
	.4byte _080072C0 @ case 18
	.4byte _080072C0 @ case 19
_080072A4:
	movs r5, #1
	adds r0, r2, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	adds r0, r0, r4
	b _080072CE
_080072B0:
	movs r5, #2
	adds r0, r4, #0
	adds r0, #0xfe
	b _080072C6
_080072B8:
	movs r5, #3
	adds r0, r4, #0
	adds r0, #0xf9
	b _080072C6
_080072C0:
	movs r5, #4
	adds r0, r4, #0
	adds r0, #0xf4
_080072C6:
	adds r1, r2, #0
	adds r1, #0xc1
	ldrb r1, [r1]
	adds r0, r1, r0
_080072CE:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08007304 @ =gSaveDataBuffer
	adds r6, r0, #0
	adds r6, #0xf6
	ldrb r1, [r6]
	lsrs r0, r1, #4
	cmp r0, r5
	bhi _080072FC
	movs r0, #0xf
	ands r0, r1
	cmp r0, r4
	bhi _080072FC
	bl sub_8007120
	lsls r1, r5, #4
	orrs r1, r4
	strb r1, [r6]
	ldr r0, _08007308 @ =gMain
	adds r0, #0xc2
	strb r1, [r0]
	bl sub_80070AC
_080072FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007304: .4byte gSaveDataBuffer
_08007308: .4byte gMain

	thumb_func_start sub_800730C
sub_800730C: @ 0x0800730C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrb r5, [r6, #9]
	cmp r5, #1
	bne _0800731A
	b _08007464
_0800731A:
	cmp r5, #1
	bgt _08007324
	cmp r5, #0
	beq _08007332
	b _080075F6
_08007324:
	cmp r5, #2
	bne _0800732A
	b _08007500
_0800732A:
	cmp r5, #3
	bne _08007330
	b _080075C4
_08007330:
	b _080075F6
_08007332:
	movs r0, #0
	bl sub_80051BC
	adds r1, r0, #0
	ldr r0, _08007410 @ =0x040000D4
	str r1, [r0]
	movs r3, #0xa0
	lsls r3, r3, #0x13
	str r3, [r0, #4]
	ldr r1, _08007414 @ =0x80000100
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007418 @ =gGfxSaveGameTiles
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _0800741C @ =0x80000800
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007420 @ =gGfxSaveYesNo
	str r1, [r0]
	ldr r1, _08007424 @ =0x06013C00
	str r1, [r0, #4]
	ldr r1, _08007428 @ =0x80000400
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800742C @ =gPalChoiceSelected
	str r1, [r0]
	ldr r1, _08007430 @ =0x05000320
	str r1, [r0, #4]
	ldr r1, _08007434 @ =0x80000020
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007438 @ =gUnknown_0819F674
	str r1, [r0]
	ldr r1, _0800743C @ =0x05000200
	str r1, [r0, #4]
	ldr r2, _08007440 @ =0x80000010
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007444 @ =gPalEvidenceProfileDesc
	str r1, [r0]
	str r3, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _08007448 @ =gIORegisters
	movs r2, #0
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r1]
	ldr r0, _0800744C @ =0x00003D01
	strh r0, [r1, #2]
	adds r0, #0xff
	strh r0, [r1, #4]
	ldr r0, _08007450 @ =0x00003FC7
	strh r0, [r1, #6]
	ldr r0, _08007454 @ =gMain
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r0, r1
	strb r2, [r0]
	adds r5, r6, #0
	adds r5, #0x3d
	ldrb r4, [r5]
	movs r1, #0x40
	adds r0, r4, #0
	orrs r0, r1
	strb r0, [r5]
	movs r0, #6
	bl sub_8003D5C
	movs r0, #6
	bl sub_80049A0
	strb r4, [r5]
	movs r1, #0
	ldr r3, _08007458 @ =0x000003FF
	movs r2, #0
	ldr r0, _0800745C @ =gUnknown_03000000
_080073D2:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, r3
	bls _080073D2
	movs r0, #6
	movs r1, #8
	bl sub_8005CFC
	ldr r1, _08007448 @ =gIORegisters
	adds r2, r1, #0
	adds r2, #0x4a
	movs r0, #0xe2
	lsls r0, r0, #5
	strh r0, [r2]
	movs r0, #0xc
	strb r0, [r6, #0x1a]
	ldr r0, _08007460 @ =0x00003E01
	strh r0, [r1, #4]
	adds r1, #0x4e
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #1
	strb r0, [r6, #0x17]
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	b _080074D2
	.align 2, 0
_08007410: .4byte 0x040000D4
_08007414: .4byte 0x80000100
_08007418: .4byte gGfxSaveGameTiles
_0800741C: .4byte 0x80000800
_08007420: .4byte gGfxSaveYesNo
_08007424: .4byte 0x06013C00
_08007428: .4byte 0x80000400
_0800742C: .4byte gPalChoiceSelected
_08007430: .4byte 0x05000320
_08007434: .4byte 0x80000020
_08007438: .4byte gUnknown_0819F674
_0800743C: .4byte 0x05000200
_08007440: .4byte 0x80000010
_08007444: .4byte gPalEvidenceProfileDesc
_08007448: .4byte gIORegisters
_0800744C: .4byte 0x00003D01
_08007450: .4byte 0x00003FC7
_08007454: .4byte gMain
_08007458: .4byte 0x000003FF
_0800745C: .4byte gUnknown_03000000
_08007460: .4byte 0x00003E01
_08007464:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _08007470
	b _080075F6
_08007470:
	ldr r4, _080074DC @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	ldrb r4, [r4, #1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #0
	beq _08007484
	b _080075F6
_08007484:
	strb r5, [r6, #0x18]
	strb r5, [r6, #0x19]
	ldr r1, _080074E0 @ =gScriptContext
	ldr r0, _080074E4 @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #4
	bl sub_8018778
	ldr r2, _080074E8 @ =gUnknown_03002CE0
	ldr r1, _080074EC @ =0x00004460
	strh r1, [r2]
	ldr r0, _080074F0 @ =0x0000C030
	strh r0, [r2, #2]
	ldr r0, _080074F4 @ =0x0000A1E0
	strh r0, [r2, #4]
	adds r2, #8
	strh r1, [r2]
	ldr r0, _080074F8 @ =0x0000C080
	strh r0, [r2, #2]
	movs r0, #0xa2
	lsls r0, r0, #8
	strh r0, [r2, #4]
	adds r0, r6, #0
	adds r0, #0x8c
	strh r4, [r0]
	adds r0, #2
	strb r5, [r0]
	adds r0, #1
	movs r2, #0x10
	strb r2, [r0]
	ldr r1, _080074FC @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x48
	movs r0, #0x84
	lsls r0, r0, #4
	strh r0, [r3]
	lsls r2, r2, #8
	adds r1, #0x4c
	strh r2, [r1]
_080074D2:
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	b _080075F6
	.align 2, 0
_080074DC: .4byte gCourtRecord
_080074E0: .4byte gScriptContext
_080074E4: .4byte 0x0000FFFF
_080074E8: .4byte gUnknown_03002CE0
_080074EC: .4byte 0x00004460
_080074F0: .4byte 0x0000C030
_080074F4: .4byte 0x0000A1E0
_080074F8: .4byte 0x0000C080
_080074FC: .4byte gIORegisters
_08007500:
	ldr r1, _08007528 @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _08007552
	ldr r0, _0800752C @ =gJoypad
	ldrh r1, [r0, #2]
	movs r4, #0x30
	ands r4, r1
	cmp r4, #0
	beq _08007530
	movs r0, #0x2a
	bl sub_8011150
	movs r0, #1
	ldrb r1, [r6, #0x17]
	eors r0, r1
	strb r0, [r6, #0x17]
	b _08007552
	.align 2, 0
_08007528: .4byte gScriptContext
_0800752C: .4byte gJoypad
_08007530:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08007552
	movs r0, #0x2b
	bl sub_8011150
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	strb r4, [r6, #0x1a]
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
_08007552:
	ldr r2, _08007564 @ =gUnknown_03002CE0
	ldrb r0, [r6, #0x17]
	cmp r0, #0
	bne _0800756C
	ldr r0, _08007568 @ =0x000091E0
	strh r0, [r2, #4]
	movs r0, #0xa2
	lsls r0, r0, #8
	b _08007574
	.align 2, 0
_08007564: .4byte gUnknown_03002CE0
_08007568: .4byte 0x000091E0
_0800756C:
	ldr r0, _080075BC @ =0x0000A1E0
	strh r0, [r2, #4]
	movs r0, #0x92
	lsls r0, r0, #8
_08007574:
	strh r0, [r2, #0xc]
	ldrb r0, [r6, #9]
	cmp r0, #2
	bne _080075F6
	adds r3, r6, #0
	adds r3, #0x8f
	ldrb r0, [r3]
	cmp r0, #0
	beq _080075F6
	adds r2, r6, #0
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	blo _080075A8
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
_080075A8:
	ldr r2, _080075C0 @ =gIORegisters
	ldrb r3, [r3]
	lsls r1, r3, #8
	movs r0, #0x10
	subs r0, r0, r3
	orrs r1, r0
	adds r2, #0x4c
	strh r1, [r2]
	b _080075F6
	.align 2, 0
_080075BC: .4byte 0x0000A1E0
_080075C0: .4byte gIORegisters
_080075C4:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r4, [r0]
	cmp r4, #0
	bne _080075F6
	strb r4, [r6, #0x18]
	strb r4, [r6, #0x19]
	ldrb r0, [r6, #0x17]
	cmp r0, #0
	bne _080075F4
	str r4, [sp]
	ldr r2, _08007600 @ =0x040000D4
	mov r1, sp
	str r1, [r2]
	ldr r0, _08007604 @ =gSaveDataBuffer
	str r0, [r2, #4]
	ldr r1, _08007608 @ =0x85000B15
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	movs r1, #0xe0
	lsls r1, r1, #0x14
	ldr r2, _0800760C @ =0x00002C54
	bl WriteSramEx
_080075F4:
	str r4, [r6, #8]
_080075F6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007600: .4byte 0x040000D4
_08007604: .4byte gSaveDataBuffer
_08007608: .4byte 0x85000B15
_0800760C: .4byte 0x00002C54

	thumb_func_start sub_8007610
sub_8007610: @ 0x08007610
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0800762C @ =gMain
	movs r4, #1
	movs r2, #1
	cmp r0, #0x13
	bhi _080076B2
	lsls r0, r0, #2
	ldr r1, _08007630 @ =_08007634
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800762C: .4byte gMain
_08007630: .4byte _08007634
_08007634: @ jump table
	.4byte _08007684 @ case 0
	.4byte _08007684 @ case 1
	.4byte _08007690 @ case 2
	.4byte _08007690 @ case 3
	.4byte _08007690 @ case 4
	.4byte _08007690 @ case 5
	.4byte _08007690 @ case 6
	.4byte _08007698 @ case 7
	.4byte _08007698 @ case 8
	.4byte _08007698 @ case 9
	.4byte _08007698 @ case 10
	.4byte _08007698 @ case 11
	.4byte _080076A0 @ case 12
	.4byte _080076A0 @ case 13
	.4byte _080076A0 @ case 14
	.4byte _080076A0 @ case 15
	.4byte _080076A0 @ case 16
	.4byte _080076A0 @ case 17
	.4byte _080076A0 @ case 18
	.4byte _080076A0 @ case 19
_08007684:
	movs r4, #1
	adds r0, r3, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	adds r0, r0, r2
	b _080076AE
_08007690:
	movs r4, #2
	adds r0, r2, #0
	adds r0, #0xfe
	b _080076A6
_08007698:
	movs r4, #3
	adds r0, r2, #0
	adds r0, #0xf9
	b _080076A6
_080076A0:
	movs r4, #4
	adds r0, r2, #0
	adds r0, #0xf4
_080076A6:
	adds r1, r3, #0
	adds r1, #0xc1
	ldrb r1, [r1]
	adds r0, r1, r0
_080076AE:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080076B2:
	adds r0, r3, #0
	adds r0, #0xc2
	lsls r1, r4, #4
	ldrb r5, [r0]
	cmp r5, r1
	bge _080076C0
	strb r1, [r0]
_080076C0:
	ldrb r1, [r0]
	lsrs r0, r1, #4
	cmp r0, r4
	bhi _080076D0
	movs r0, #0xf
	ands r0, r1
	cmp r0, r2
	bls _080076EC
_080076D0:
	movs r1, #0
	movs r0, #0x86
	lsls r0, r0, #1
	adds r2, r3, r0
	movs r3, #1
	rsbs r3, r3, #0
_080076DC:
	lsls r0, r1, #2
	adds r0, r2, r0
	str r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _080076DC
_080076EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_11
nullsub_11: @ 0x080076F4
	bx lr
	.align 2, 0

	thumb_func_start sub_80076F8
sub_80076F8: @ 0x080076F8
	push {lr}
	ldr r2, _08007710 @ =gUnknown_0814DB64
	ldr r0, _08007714 @ =gMain
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08007710: .4byte gUnknown_0814DB64
_08007714: .4byte gMain

	thumb_func_start sub_8007718
sub_8007718: @ 0x08007718
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08007814 @ =0x040000D4
	ldr r1, _08007818 @ =gUnknown_03002080
	str r1, [r0]
	ldr r2, _0800781C @ =gUnknown_020018D4
	str r2, [r0, #4]
	ldr r3, _08007820 @ =0x80000400
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007824 @ =gUnknown_03000000
	str r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r2, r4
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007828 @ =gUnknown_03003E50
	str r1, [r0]
	ldr r3, _0800782C @ =0xFFFFF500
	adds r1, r2, r3
	str r1, [r0, #4]
	ldr r1, _08007830 @ =0x80000180
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007834 @ =gUnknown_030070B0
	str r1, [r0]
	ldr r4, _08007838 @ =0xFFFFEB24
	adds r1, r2, r4
	str r1, [r0, #4]
	ldr r1, _0800783C @ =0x80000012
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007840 @ =gScriptContext
	str r1, [r0]
	ldr r3, _08007844 @ =0xFFFFEA88
	adds r1, r2, r3
	str r1, [r0, #4]
	ldr r1, _08007848 @ =0x8000004E
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800784C @ =gIORegisters
	str r1, [r0]
	subs r4, #0xf0
	adds r1, r2, r4
	str r1, [r0, #4]
	ldr r1, _08007850 @ =0x8000002A
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r3, _08007854 @ =gUnknown_03003AF0
	str r3, [r0]
	ldr r4, _08007858 @ =0xFFFFF060
	adds r1, r2, r4
	str r1, [r0, #4]
	ldr r1, _0800785C @ =0x80000050
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #5
	adds r2, r2, r0
	movs r4, #0xff
_08007796:
	ldrb r0, [r3]
	orrs r0, r4
	strb r0, [r3]
	adds r3, #0x14
	adds r1, #1
	cmp r1, #7
	bls _08007796
	adds r0, r2, #0
	bl sub_8012A94
	movs r0, #0
	strb r0, [r6, #0x18]
	ldr r4, _08007860 @ =gMain
	ldr r1, _08007864 @ =0x000002C2
	adds r4, r4, r1
	ldrh r5, [r4]
	adds r0, r5, #0
	bl sub_8011194
	strh r5, [r4]
	ldr r2, _08007868 @ =gUnknown_03000844
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _080077CA
	cmp r0, #0x21
	bne _080077F8
_080077CA:
	ldr r2, _0800786C @ =gUnknown_0826FE38
	ldr r0, [r2, #4]
	ldr r3, _08007870 @ =gUnknown_08252498
	adds r0, r0, r3
	ldr r2, _08007874 @ =0x050003A0
	ldr r1, _08007814 @ =0x040000D4
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _08007878 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0800787C @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	str r0, [r2]
_080077F8:
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r6, #9]
	adds r0, #1
	movs r1, #0
	strb r0, [r6, #9]
	strb r1, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007814: .4byte 0x040000D4
_08007818: .4byte gUnknown_03002080
_0800781C: .4byte gUnknown_020018D4
_08007820: .4byte 0x80000400
_08007824: .4byte gUnknown_03000000
_08007828: .4byte gUnknown_03003E50
_0800782C: .4byte 0xFFFFF500
_08007830: .4byte 0x80000180
_08007834: .4byte gUnknown_030070B0
_08007838: .4byte 0xFFFFEB24
_0800783C: .4byte 0x80000012
_08007840: .4byte gScriptContext
_08007844: .4byte 0xFFFFEA88
_08007848: .4byte 0x8000004E
_0800784C: .4byte gIORegisters
_08007850: .4byte 0x8000002A
_08007854: .4byte gUnknown_03003AF0
_08007858: .4byte 0xFFFFF060
_0800785C: .4byte 0x80000050
_08007860: .4byte gMain
_08007864: .4byte 0x000002C2
_08007868: .4byte gUnknown_03000844
_0800786C: .4byte gUnknown_0826FE38
_08007870: .4byte gUnknown_08252498
_08007874: .4byte 0x050003A0
_08007878: .4byte 0x80000010
_0800787C: .4byte 0xFEFFFFFF

	thumb_func_start sub_8007880
sub_8007880: @ 0x08007880
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r0, #0x8a
	ldrh r4, [r0]
	cmp r4, #0
	beq _08007894
	b _080079F0
_08007894:
	ldr r0, _080079FC @ =0x040000D4
	ldr r1, _08007A00 @ =gUnknown_03002FA0
	str r1, [r0]
	ldr r2, _08007A04 @ =gUnknown_020010D4
	str r2, [r0, #4]
	ldr r3, _08007A08 @ =0x80000400
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A0C @ =gCourtRecord
	str r1, [r0]
	ldr r5, _08007A10 @ =0xFFFFF348
	adds r1, r2, r5
	str r1, [r0, #4]
	ldr r1, _08007A14 @ =0x8000002E
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A18 @ =gInvestigation
	str r1, [r0]
	adds r5, #0x74
	adds r1, r2, r5
	str r1, [r0, #4]
	ldr r1, _08007A1C @ =0x8000000E
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A20 @ =gTestimony
	str r1, [r0]
	subs r5, #8
	adds r1, r2, r5
	str r1, [r0, #4]
	ldr r1, _08007A24 @ =0x80000004
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A28 @ =gCourtScroll
	str r1, [r0]
	subs r5, #0x10
	adds r1, r2, r5
	str r1, [r0, #4]
	ldr r1, _08007A2C @ =0x80000008
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A30 @ =gUnknown_03003C70
	str r1, [r0]
	adds r5, #0x34
	adds r1, r2, r5
	str r1, [r0, #4]
	ldr r1, _08007A34 @ =0x800000F0
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A38 @ =gUnknown_03002920
	str r1, [r0]
	ldr r5, _08007A3C @ =0xFFFFF5B8
	adds r1, r2, r5
	str r1, [r0, #4]
	ldr r1, _08007A40 @ =0x80000140
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A44 @ =gUnknown_03003B90
	str r1, [r0]
	ldr r1, _08007A48 @ =0xFFFFF838
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r1, _08007A4C @ =0x80000014
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A50 @ =gGfxNewGameContinue
	str r1, [r0]
	ldr r1, _08007A54 @ =0x06013800
	str r1, [r0, #4]
	ldr r1, _08007A58 @ =0x80000200
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A5C @ =gPalNewGameContinue
	str r1, [r0]
	ldr r1, _08007A60 @ =0x05000300
	str r1, [r0, #4]
	ldr r1, _08007A64 @ =0x80000060
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A68 @ =gGfxSaveYesNo
	str r1, [r0]
	ldr r1, _08007A6C @ =0x06013C00
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007A70 @ =gPalChoiceSelected
	str r1, [r0]
	ldr r1, _08007A74 @ =0x05000320
	str r1, [r0, #4]
	ldr r1, _08007A78 @ =0x80000020
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _08007A7C @ =gScriptContext
	adds r0, #0x22
	strb r4, [r0]
	mov r1, sb
	adds r1, #0x27
	movs r0, #0xfc
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08007A80 @ =gOamObjects
	movs r0, #0
	mov r7, sb
	adds r7, #0x3d
	movs r2, #0x80
	lsls r2, r2, #2
_08007968:
	strh r2, [r1]
	adds r1, #8
	adds r0, #1
	cmp r0, #0x7f
	bls _08007968
	movs r0, #0
	ldr r3, _08007A84 @ =0x000003FF
	movs r2, #0
	ldr r1, _08007A88 @ =gUnknown_03000000
_0800797A:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, r3
	bls _0800797A
	movs r0, #6
	movs r1, #8
	bl sub_8005CFC
	ldr r4, _08007A8C @ =gIORegisters
	adds r1, r4, #0
	adds r1, #0x4a
	movs r5, #0
	mov r8, r5
	movs r6, #0
	movs r0, #0xe2
	lsls r0, r0, #5
	strh r0, [r1]
	movs r0, #0xc
	mov r1, sb
	strb r0, [r1, #0x1a]
	ldr r0, _08007A90 @ =0x00003E01
	strh r0, [r4, #4]
	ldr r0, _08007A94 @ =gMain
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r0, r2
	mov r5, r8
	strb r5, [r0]
	ldrb r5, [r7]
	movs r1, #0x40
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r7]
	movs r0, #6
	bl sub_8003D5C
	movs r0, #6
	bl sub_80049A0
	strb r5, [r7]
	movs r0, #8
	strh r0, [r4, #0x16]
	strh r0, [r4, #0x14]
	strh r6, [r4, #0xe]
	strh r6, [r4, #0xc]
	mov r1, r8
	mov r0, sb
	strb r1, [r0, #0x19]
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	mov r2, sb
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r2, #9]
_080079F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080079FC: .4byte 0x040000D4
_08007A00: .4byte gUnknown_03002FA0
_08007A04: .4byte gUnknown_020010D4
_08007A08: .4byte 0x80000400
_08007A0C: .4byte gCourtRecord
_08007A10: .4byte 0xFFFFF348
_08007A14: .4byte 0x8000002E
_08007A18: .4byte gInvestigation
_08007A1C: .4byte 0x8000000E
_08007A20: .4byte gTestimony
_08007A24: .4byte 0x80000004
_08007A28: .4byte gCourtScroll
_08007A2C: .4byte 0x80000008
_08007A30: .4byte gUnknown_03003C70
_08007A34: .4byte 0x800000F0
_08007A38: .4byte gUnknown_03002920
_08007A3C: .4byte 0xFFFFF5B8
_08007A40: .4byte 0x80000140
_08007A44: .4byte gUnknown_03003B90
_08007A48: .4byte 0xFFFFF838
_08007A4C: .4byte 0x80000014
_08007A50: .4byte gGfxNewGameContinue
_08007A54: .4byte 0x06013800
_08007A58: .4byte 0x80000200
_08007A5C: .4byte gPalNewGameContinue
_08007A60: .4byte 0x05000300
_08007A64: .4byte 0x80000060
_08007A68: .4byte gGfxSaveYesNo
_08007A6C: .4byte 0x06013C00
_08007A70: .4byte gPalChoiceSelected
_08007A74: .4byte 0x05000320
_08007A78: .4byte 0x80000020
_08007A7C: .4byte gScriptContext
_08007A80: .4byte gOamObjects
_08007A84: .4byte 0x000003FF
_08007A88: .4byte gUnknown_03000000
_08007A8C: .4byte gIORegisters
_08007A90: .4byte 0x00003E01
_08007A94: .4byte gMain

	thumb_func_start sub_8007A98
sub_8007A98: @ 0x08007A98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08007AE8 @ =gScriptContext
	ldr r4, _08007AEC @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	ldrb r4, [r4, #1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #0
	beq _08007AB2
	b _08007BCC
_08007AB2:
	movs r0, #1
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x19]
	ldr r1, _08007AF0 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x4a
	ldr r0, _08007AF4 @ =0x0000FDFF
	ldrh r2, [r3]
	ands r0, r2
	movs r2, #0
	strh r0, [r3]
	strh r4, [r1, #0xe]
	adds r0, r6, #0
	adds r0, #0x23
	strb r2, [r0]
	ldr r0, _08007AF8 @ =0x0000FFFF
	strh r0, [r6, #0xc]
	adds r0, r6, #0
	adds r0, #0x25
	strb r2, [r0]
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _08007AFC
	movs r0, #0
	bl sub_8018778
	b _08007B02
	.align 2, 0
_08007AE8: .4byte gScriptContext
_08007AEC: .4byte gCourtRecord
_08007AF0: .4byte gIORegisters
_08007AF4: .4byte 0x0000FDFF
_08007AF8: .4byte 0x0000FFFF
_08007AFC:
	movs r0, #1
	bl sub_8018778
_08007B02:
	ldr r1, _08007B84 @ =0x040000D4
	ldr r0, _08007B88 @ =gGfxSaveYesNo
	str r0, [r1]
	ldr r0, _08007B8C @ =0x06013C00
	str r0, [r1, #4]
	ldr r0, _08007B90 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08007B94 @ =gUnknown_0818E780
	str r0, [r1]
	ldr r0, _08007B98 @ =0x06014400
	str r0, [r1, #4]
	ldr r0, _08007B9C @ =0x80000500
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08007BA0 @ =gUnknown_08197404
	str r0, [r1]
	ldr r0, _08007BA4 @ =0x050003A0
	str r0, [r1, #4]
	ldr r0, _08007BA8 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08007BAC @ =gUnknown_03002CE0
	movs r3, #0
	ldr r2, _08007BB0 @ =0x00004460
	strh r2, [r0]
	ldr r1, _08007BB4 @ =0x0000C030
	strh r1, [r0, #2]
	ldr r1, _08007BB8 @ =0x0000A1E0
	strh r1, [r0, #4]
	adds r0, #8
	strh r2, [r0]
	ldr r1, _08007BBC @ =0x0000C080
	strh r1, [r0, #2]
	movs r1, #0xa2
	lsls r1, r1, #8
	strh r1, [r0, #4]
	adds r0, r6, #0
	adds r0, #0x46
	strh r3, [r0]
	adds r0, r5, #0
	adds r0, #0x8c
	strh r3, [r0]
	adds r0, #2
	movs r4, #1
	strb r4, [r0]
	adds r0, #1
	movs r2, #0x10
	strb r2, [r0]
	ldr r1, _08007BC0 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x48
	movs r0, #0x84
	lsls r0, r0, #4
	strh r0, [r3]
	lsls r2, r2, #8
	adds r1, #0x4c
	strh r2, [r1]
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _08007BC4
	movs r0, #0
	strb r0, [r5, #0x17]
	b _08007BC6
	.align 2, 0
_08007B84: .4byte 0x040000D4
_08007B88: .4byte gGfxSaveYesNo
_08007B8C: .4byte 0x06013C00
_08007B90: .4byte 0x80000400
_08007B94: .4byte gUnknown_0818E780
_08007B98: .4byte 0x06014400
_08007B9C: .4byte 0x80000500
_08007BA0: .4byte gUnknown_08197404
_08007BA4: .4byte 0x050003A0
_08007BA8: .4byte 0x80000010
_08007BAC: .4byte gUnknown_03002CE0
_08007BB0: .4byte 0x00004460
_08007BB4: .4byte 0x0000C030
_08007BB8: .4byte 0x0000A1E0
_08007BBC: .4byte 0x0000C080
_08007BC0: .4byte gIORegisters
_08007BC4:
	strb r4, [r5, #0x17]
_08007BC6:
	ldrb r0, [r5, #9]
	adds r0, #1
	strb r0, [r5, #9]
_08007BCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8007BD4
sub_8007BD4: @ 0x08007BD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r6, _08007C14 @ =gScriptContext
	movs r0, #0x46
	adds r0, r0, r6
	mov r8, r0
	ldrh r2, [r0]
	cmp r2, #2
	beq _08007BEC
	b _08007CFE
_08007BEC:
	movs r0, #8
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _08007BF8
	b _08007CFE
_08007BF8:
	ldr r0, _08007C18 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08007C1C
	movs r0, #1
	ldrb r2, [r5, #0x17]
	eors r0, r2
	strb r0, [r5, #0x17]
	movs r0, #0x2a
	bl sub_8011150
	b _08007CFE
	.align 2, 0
_08007C14: .4byte gScriptContext
_08007C18: .4byte gJoypad
_08007C1C:
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08007CD0
	movs r0, #0x40
	bl sub_8011150
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	bne _08007CA8
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _08007C4C
	ldr r1, _08007C48 @ =gSaveDataBuffer
	adds r1, #0x4f
	movs r0, #0xf0
	ldrb r7, [r1]
	ands r0, r7
	strb r0, [r1]
	b _08007C58
	.align 2, 0
_08007C48: .4byte gSaveDataBuffer
_08007C4C:
	ldr r0, _08007C74 @ =gSaveDataBuffer
	adds r0, #0x4f
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_08007C58:
	bl sub_80070AC
	cmp r0, #0
	beq _08007C80
	ldr r0, _08007C78 @ =gScriptContext
	ldr r1, _08007C7C @ =0x0000FFFF
	strh r1, [r0, #0xc]
	movs r0, #3
	bl sub_8018778
	movs r0, #6
	strb r0, [r5, #9]
	b _08007E68
	.align 2, 0
_08007C74: .4byte gSaveDataBuffer
_08007C78: .4byte gScriptContext
_08007C7C: .4byte 0x0000FFFF
_08007C80:
	ldrb r4, [r5, #0xb]
	cmp r4, #0
	bne _08007CA8
	ldr r1, _08007CC8 @ =gScriptContext
	ldr r0, _08007CCC @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #6
	bl sub_8018778
	adds r0, r5, #0
	adds r0, #0x8c
	movs r1, #0
	strh r4, [r0]
	adds r2, r5, #0
	adds r2, #0x8e
	movs r0, #1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x8f
	strb r1, [r0]
_08007CA8:
	adds r0, r6, #0
	adds r0, #0x46
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
	movs r0, #8
	strb r0, [r5, #9]
	strb r2, [r5, #0xa]
	b _08007E68
	.align 2, 0
_08007CC8: .4byte gScriptContext
_08007CCC: .4byte 0x0000FFFF
_08007CD0:
	ldrb r4, [r5, #0xb]
	cmp r4, #0
	bne _08007CFE
	ands r2, r1
	cmp r2, #0
	beq _08007CFE
	movs r0, #0x2c
	bl sub_8011150
	movs r0, #1
	strb r0, [r5, #0x17]
	movs r1, #0
	mov r0, r8
	strh r4, [r0]
	adds r0, r6, #0
	adds r0, #0x48
	strh r4, [r0]
	adds r0, #2
	strh r7, [r0]
	movs r0, #8
	strb r0, [r5, #9]
	strb r1, [r5, #0xa]
	b _08007E68
_08007CFE:
	adds r0, r5, #0
	adds r0, #0x8f
	ldrb r1, [r0]
	adds r6, #0x46
	mov r8, r0
	cmp r1, #0
	bne _08007DCC
	ldrh r4, [r6]
	cmp r4, #0
	bne _08007DC4
	ldr r3, _08007D94 @ =gUnknown_03002CF0
	movs r1, #0x89
	lsls r1, r1, #7
	strh r1, [r3]
	ldr r0, _08007D98 @ =0x0000C028
	strh r0, [r3, #2]
	ldr r2, _08007D9C @ =0x00080220
	ldr r0, _08007DA0 @ =0x0008D220
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08007DA4 @ =0x0000C068
	strh r0, [r3, #2]
	ldr r7, _08007DA8 @ =0x0000D020
	adds r0, r2, r7
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r1, _08007DAC @ =0x000040A8
	strh r1, [r3, #2]
	adds r7, #0x20
	adds r0, r7, #0
	adds r0, r0, r2
	strh r0, [r3, #4]
	adds r3, #8
	ldr r0, _08007DB0 @ =0x00004490
	strh r0, [r3]
	strh r1, [r3, #2]
	adds r7, #4
	adds r0, r7, #0
	adds r0, r0, r2
	strh r0, [r3, #4]
	adds r3, #8
	ldr r0, _08007DB4 @ =0x00004488
	strh r0, [r3]
	strh r1, [r3, #2]
	adds r7, #4
	adds r0, r7, #0
	adds r0, r0, r2
	strh r0, [r3, #4]
	adds r3, #8
	ldr r0, _08007DB8 @ =0x00004498
	strh r0, [r3]
	strh r1, [r3, #2]
	ldr r1, _08007DBC @ =0x0000D04C
	adds r0, r1, #0
	adds r0, r0, r2
	strh r0, [r3, #4]
	movs r1, #1
	movs r0, #1
	strh r0, [r6]
	adds r0, r5, #0
	adds r0, #0x8c
	strh r4, [r0]
	adds r0, #2
	strb r1, [r0]
	movs r1, #0x10
	mov r2, r8
	strb r1, [r2]
	ldr r0, _08007DC0 @ =gIORegisters
	lsls r1, r1, #8
	adds r0, #0x4c
	strh r1, [r0]
	b _08007DCC
	.align 2, 0
_08007D94: .4byte gUnknown_03002CF0
_08007D98: .4byte 0x0000C028
_08007D9C: .4byte 0x00080220
_08007DA0: .4byte 0x0008D220
_08007DA4: .4byte 0x0000C068
_08007DA8: .4byte 0x0000D020
_08007DAC: .4byte 0x000040A8
_08007DB0: .4byte 0x00004490
_08007DB4: .4byte 0x00004488
_08007DB8: .4byte 0x00004498
_08007DBC: .4byte 0x0000D04C
_08007DC0: .4byte gIORegisters
_08007DC4:
	cmp r4, #1
	bne _08007DCC
	movs r0, #2
	strh r0, [r6]
_08007DCC:
	movs r1, #0x88
	lsls r1, r1, #7
	ldrh r6, [r6]
	cmp r6, #1
	bne _08007DDA
	movs r1, #0x80
	lsls r1, r1, #7
_08007DDA:
	ldr r3, _08007DFC @ =gUnknown_03002CE0
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	bne _08007E0C
	adds r1, #0x60
	strh r1, [r3]
	ldr r0, _08007E00 @ =0x0000C030
	strh r0, [r3, #2]
	ldr r0, _08007E04 @ =0x000091E0
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08007E08 @ =0x0000C080
	strh r0, [r3, #2]
	movs r0, #0xa2
	lsls r0, r0, #8
	b _08007E24
	.align 2, 0
_08007DFC: .4byte gUnknown_03002CE0
_08007E00: .4byte 0x0000C030
_08007E04: .4byte 0x000091E0
_08007E08: .4byte 0x0000C080
_08007E0C:
	adds r1, #0x60
	strh r1, [r3]
	ldr r0, _08007E74 @ =0x0000C030
	strh r0, [r3, #2]
	ldr r0, _08007E78 @ =0x0000A1E0
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08007E7C @ =0x0000C080
	strh r0, [r3, #2]
	movs r0, #0x92
	lsls r0, r0, #8
_08007E24:
	strh r0, [r3, #4]
	ldrb r7, [r5, #9]
	cmp r7, #3
	bne _08007E68
	mov r3, r8
	ldrb r0, [r3]
	cmp r0, #0
	beq _08007E68
	adds r2, r5, #0
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	blo _08007E56
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
_08007E56:
	ldr r2, _08007E80 @ =gIORegisters
	mov r0, r8
	ldrb r3, [r0]
	lsls r1, r3, #8
	movs r0, #0x10
	subs r0, r0, r3
	orrs r1, r0
	adds r2, #0x4c
	strh r1, [r2]
_08007E68:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007E74: .4byte 0x0000C030
_08007E78: .4byte 0x0000A1E0
_08007E7C: .4byte 0x0000C080
_08007E80: .4byte gIORegisters

	thumb_func_start sub_8007E84
sub_8007E84: @ 0x08007E84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _08007E9A
	b _080082A6
_08007E9A:
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	bne _08007EA6
	movs r0, #1
	str r0, [r5, #8]
	b _080082A6
_08007EA6:
	ldr r2, _08008130 @ =gSaveDataBuffer
	adds r0, r2, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r5, #0x34]
	adds r0, r2, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r5, #0x38]
	adds r0, r2, #0
	adds r0, #0x70
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x71
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x73
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x78
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7a
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7e
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x80
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x81
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x82
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x83
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x88
	ldr r0, [r0]
	str r0, [r5, #0x54]
	movs r4, #0
	ldr r3, _08008134 @ =gUnknown_03000000
	ldr r6, _08008138 @ =gUnknown_03003E50
	movs r0, #0xe8
	adds r0, r0, r5
	mov sb, r0
	adds r2, #0x8c
	adds r1, #9
_08007F70:
	ldm r2!, {r0}
	stm r1!, {r0}
	adds r4, #1
	cmp r4, #0xb
	bls _08007F70
	ldr r4, _0800813C @ =0x040000D4
	ldr r7, _08008140 @ =gUnknown_020020D4
	str r7, [r4]
	str r3, [r4, #4]
	ldr r0, _08008144 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08008148 @ =0xFFFFED00
	adds r0, r7, r1
	str r0, [r4]
	str r6, [r4, #4]
	ldr r0, _0800814C @ =0x80000180
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl sub_8018ABC
	ldr r2, _08008150 @ =0xFFFFE324
	adds r0, r7, r2
	str r0, [r4]
	ldr r0, _08008154 @ =gUnknown_030070B0
	str r0, [r4, #4]
	ldr r0, _08008158 @ =0x80000012
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _0800815C @ =0xFFFFE288
	adds r0, r7, r3
	str r0, [r4]
	ldr r0, _08008160 @ =gScriptContext
	mov r8, r0
	str r0, [r4, #4]
	ldr r0, _08008164 @ =0x8000004E
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08008168 @ =0xFFFFE234
	adds r0, r7, r1
	str r0, [r4]
	ldr r0, _0800816C @ =gIORegisters
	str r0, [r4, #4]
	ldr r0, _08008170 @ =0x8000002A
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _08008174 @ =0xFFFFE860
	adds r0, r7, r2
	str r0, [r4]
	ldr r0, _08008178 @ =gUnknown_03003AF0
	str r0, [r4, #4]
	ldr r0, _0800817C @ =0x80000050
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _08008180 @ =0xFFFFE5B8
	adds r0, r7, r3
	str r0, [r4]
	ldr r0, _08008184 @ =gUnknown_03002920
	str r0, [r4, #4]
	ldr r0, _08008188 @ =0x80000140
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0800818C @ =0xFFFFE838
	adds r0, r7, r1
	str r0, [r4]
	ldr r0, _08008190 @ =gUnknown_03003B90
	str r0, [r4, #4]
	ldr r0, _08008194 @ =0x80000014
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _08008198 @ =0xFFFFDF78
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r5, #0x18]
	ldr r3, _0800819C @ =0xFFFFDF79
	adds r0, r7, r3
	ldrb r0, [r0]
	strb r0, [r5, #0x19]
	ldr r1, _080081A0 @ =0xFFFFE048
	adds r0, r7, r1
	ldr r0, [r0]
	mov r2, sb
	str r0, [r2]
	subs r3, #5
	adds r0, r7, r3
	ldrh r0, [r0]
	movs r1, #0
	mov sl, r1
	strh r0, [r5, #0x14]
	ldr r2, _080081A4 @ =0xFFFFDF7A
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r5, #0x1a]
	adds r0, r5, #0
	bl sub_8018C7C
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r7, r3
	bl sub_8012948
	ldr r0, [r5, #8]
	ldr r1, _080081A8 @ =0x00FFFF00
	ands r0, r1
	movs r1, #0xc1
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _0800804E
	movs r0, #3
	bl sub_8017154
_0800804E:
	ldr r6, _080081AC @ =gMain
	adds r1, r6, #0
	adds r1, #0x27
	movs r0, #3
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _080081B0 @ =0xFFFFE900
	adds r0, r7, r3
	str r0, [r4]
	ldr r0, _080081B4 @ =gOamObjects
	str r0, [r4, #4]
	ldr r0, _080081B8 @ =0x80000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080081BC @ =gPalExamineCursors
	str r0, [r4]
	ldr r0, _080081C0 @ =0x05000300
	str r0, [r4, #4]
	ldr r0, _080081C4 @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x97
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r2, _080081C8 @ =0xFFFFE1BC
	adds r0, r7, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r2, r6, #0
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800809C
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_0800809C:
	movs r3, #0x4a
	adds r3, r3, r6
	mov sb, r3
	movs r0, #0
	ldrsh r4, [r3, r0]
	ldrh r0, [r5, #0x34]
	bl sub_8003D5C
	ldrh r0, [r5, #0x34]
	bl sub_8004FAC
	mov r2, r8
	adds r2, #0x40
	ldrh r1, [r2]
	cmp r1, #0x80
	beq _08008108
	mov r0, r8
	adds r0, #0x42
	ldrb r0, [r0]
	adds r0, #1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r7, r6, r3
	strb r0, [r7]
	ldrh r0, [r6, #0x34]
	strh r0, [r6, #0x38]
	strh r1, [r6, #0x34]
	ldrh r0, [r2]
	bl sub_8003D5C
	ldrb r0, [r7]
	cmp r0, #5
	bne _080080E4
	ldrh r0, [r6, #0x34]
	bl sub_800482C
_080080E4:
	mov r1, sl
	strb r1, [r7]
	ldrh r0, [r6, #0x38]
	strh r0, [r6, #0x34]
	ldrh r0, [r6, #0x34]
	adds r1, r4, #0
	bl sub_8004940
	ldr r2, _08008140 @ =gUnknown_020020D4
	ldr r3, _080081CC @ =0xFFFFDFAA
	adds r0, r2, r3
	ldrh r0, [r0]
	mov r1, sb
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x3c
	mov r2, sl
	strb r2, [r0]
_08008108:
	ldr r1, _08008160 @ =gScriptContext
	ldr r0, _080081D0 @ =0x0000FFF7
	ldrh r3, [r1, #0x1c]
	ands r0, r3
	strh r0, [r1, #0x1c]
	ldr r1, _080081D4 @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	ldr r0, [r5, #8]
	ldr r1, _080081D8 @ =0x00FF00FF
	ands r0, r1
	ldr r1, _080081DC @ =0x00030004
	cmp r0, r1
	bne _080081E8
	ldrb r0, [r5, #9]
	cmp r0, #7
	bne _080081E0
	bl sub_800E874
	b _080081E8
	.align 2, 0
_08008130: .4byte gSaveDataBuffer
_08008134: .4byte gUnknown_03000000
_08008138: .4byte gUnknown_03003E50
_0800813C: .4byte 0x040000D4
_08008140: .4byte gUnknown_020020D4
_08008144: .4byte 0x80000400
_08008148: .4byte 0xFFFFED00
_0800814C: .4byte 0x80000180
_08008150: .4byte 0xFFFFE324
_08008154: .4byte gUnknown_030070B0
_08008158: .4byte 0x80000012
_0800815C: .4byte 0xFFFFE288
_08008160: .4byte gScriptContext
_08008164: .4byte 0x8000004E
_08008168: .4byte 0xFFFFE234
_0800816C: .4byte gIORegisters
_08008170: .4byte 0x8000002A
_08008174: .4byte 0xFFFFE860
_08008178: .4byte gUnknown_03003AF0
_0800817C: .4byte 0x80000050
_08008180: .4byte 0xFFFFE5B8
_08008184: .4byte gUnknown_03002920
_08008188: .4byte 0x80000140
_0800818C: .4byte 0xFFFFE838
_08008190: .4byte gUnknown_03003B90
_08008194: .4byte 0x80000014
_08008198: .4byte 0xFFFFDF78
_0800819C: .4byte 0xFFFFDF79
_080081A0: .4byte 0xFFFFE048
_080081A4: .4byte 0xFFFFDF7A
_080081A8: .4byte 0x00FFFF00
_080081AC: .4byte gMain
_080081B0: .4byte 0xFFFFE900
_080081B4: .4byte gOamObjects
_080081B8: .4byte 0x80000200
_080081BC: .4byte gPalExamineCursors
_080081C0: .4byte 0x05000300
_080081C4: .4byte 0x80000010
_080081C8: .4byte 0xFFFFE1BC
_080081CC: .4byte 0xFFFFDFAA
_080081D0: .4byte 0x0000FFF7
_080081D4: .4byte gUnknown_030037B8
_080081D8: .4byte 0x00FF00FF
_080081DC: .4byte 0x00030004
_080081E0:
	cmp r0, #8
	bne _080081E8
	bl sub_800E8F0
_080081E8:
	ldr r0, _08008208 @ =gMain
	ldr r1, _0800820C @ =0x000002C6
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08008244
	lsrs r0, r1, #4
	cmp r0, #1
	beq _08008226
	cmp r0, #1
	bgt _08008210
	cmp r0, #0
	beq _08008216
	b _08008244
	.align 2, 0
_08008208: .4byte gMain
_0800820C: .4byte 0x000002C6
_08008210:
	cmp r0, #2
	beq _08008236
	b _08008244
_08008216:
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _08008244
_08008226:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08008244
_08008236:
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
_08008244:
	ldr r0, _080082B4 @ =gMain
	ldr r2, _080082B8 @ =0x000002C2
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _08008254
	bl sub_8011150
_08008254:
	ldr r2, _080082BC @ =gUnknown_03000844
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _08008260
	cmp r0, #0x21
	bne _08008292
_08008260:
	ldr r2, _080082C0 @ =gUnknown_0826FE38
	ldr r0, [r2, #4]
	ldr r3, _080082C4 @ =gUnknown_08252498
	adds r0, r0, r3
	ldr r2, _080082C8 @ =0x050003A0
	ldr r1, _080082CC @ =0x040000D4
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _080082D0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _080082D4 @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	ldr r1, _080082D8 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2]
_08008292:
	movs r0, #0x1e
	movs r1, #0xff
	bl sub_80113E8
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
_080082A6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080082B4: .4byte gMain
_080082B8: .4byte 0x000002C2
_080082BC: .4byte gUnknown_03000844
_080082C0: .4byte gUnknown_0826FE38
_080082C4: .4byte gUnknown_08252498
_080082C8: .4byte 0x050003A0
_080082CC: .4byte 0x040000D4
_080082D0: .4byte 0x80000010
_080082D4: .4byte 0xFEFFFFFF
_080082D8: .4byte 0xFDFFFFFF

	thumb_func_start sub_80082DC
sub_80082DC: @ 0x080082DC
	adds r2, r0, #0
	adds r0, #0x8a
	ldrh r1, [r0]
	cmp r1, #0
	bne _08008328
	adds r3, r2, #0
	adds r3, #0xc1
	ldrb r0, [r3]
	cmp r0, #2
	bne _080082F4
	movs r1, #1
	b _08008302
_080082F4:
	cmp r0, #7
	bne _080082FC
	movs r1, #2
	b _08008302
_080082FC:
	cmp r0, #0xc
	bne _08008312
	movs r1, #3
_08008302:
	movs r0, #0
	strb r0, [r2, #0x18]
	strb r0, [r2, #0x19]
	lsls r0, r1, #0x18
	movs r1, #0x86
	lsls r1, r1, #1
	orrs r0, r1
	b _08008326
_08008312:
	ldr r0, _0800832C @ =gIORegisters
	adds r0, #0x4a
	strh r1, [r0]
	ldr r1, _08008330 @ =gScriptContext
	movs r0, #0x80
	strh r0, [r1, #0xc]
	ldr r0, _08008334 @ =gUnknown_080266D0
	ldrb r3, [r3]
	adds r0, r3, r0
	ldrb r0, [r0]
_08008326:
	str r0, [r2, #8]
_08008328:
	bx lr
	.align 2, 0
_0800832C: .4byte gIORegisters
_08008330: .4byte gScriptContext
_08008334: .4byte gUnknown_080266D0

	thumb_func_start sub_8008338
sub_8008338: @ 0x08008338
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0800836C @ =gScriptContext
	movs r0, #8
	ldrh r1, [r3, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _080083C0
	ldr r1, _08008370 @ =gJoypad
	movs r2, #1
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _080083C0
	strb r2, [r4, #0x18]
	strb r2, [r4, #0x19]
	ldr r0, _08008374 @ =0x0000FFFF
	strh r0, [r3, #0xc]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _08008378
	movs r0, #0
	bl sub_8018778
	b _0800837E
	.align 2, 0
_0800836C: .4byte gScriptContext
_08008370: .4byte gJoypad
_08008374: .4byte 0x0000FFFF
_08008378:
	movs r0, #1
	bl sub_8018778
_0800837E:
	adds r1, r4, #0
	adds r1, #0x8c
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x8e
	movs r5, #1
	strb r5, [r0]
	adds r0, #1
	movs r2, #0x10
	strb r2, [r0]
	ldr r1, _080083B4 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x48
	movs r0, #0x84
	lsls r0, r0, #4
	strh r0, [r3]
	lsls r2, r2, #8
	adds r1, #0x4c
	strh r2, [r1]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _080083B8
	movs r0, #0
	strb r0, [r4, #0x17]
	b _080083BA
	.align 2, 0
_080083B4: .4byte gIORegisters
_080083B8:
	strb r5, [r4, #0x17]
_080083BA:
	movs r0, #3
	strb r0, [r4, #9]
	b _080083D8
_080083C0:
	movs r1, #0
	ldr r3, _080083E0 @ =gUnknown_03002CE0
	movs r2, #0x80
	lsls r2, r2, #2
_080083C8:
	lsls r0, r1, #3
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _080083C8
_080083D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080083E0: .4byte gUnknown_03002CE0

	thumb_func_start sub_80083E4
sub_80083E4: @ 0x080083E4
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800842C
	ldrb r0, [r2, #0xa]
	subs r0, #1
	strb r0, [r2, #0xa]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800842C
	movs r1, #0
	ldr r4, _08008420 @ =gUnknown_03002CE0
	movs r3, #0x80
	lsls r3, r3, #2
_08008404:
	lsls r0, r1, #3
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #7
	bls _08008404
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _08008424
	movs r0, #5
	b _08008426
	.align 2, 0
_08008420: .4byte gUnknown_03002CE0
_08008424:
	movs r0, #4
_08008426:
	strb r0, [r2, #9]
	movs r0, #0
	strb r0, [r2, #0xa]
_0800842C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8008434
sub_8008434: @ 0x08008434
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _0800847C @ =gScriptContext
	ldrb r0, [r4, #0x17]
	lsls r1, r0, #3
	ldr r0, _08008480 @ =gUnknown_03002CE0
	adds r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x46
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r6, _08008484 @ =0x0000FFFF
	adds r5, r6, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _08008496
	ldr r0, _08008488 @ =0x0000FDFF
	ldrh r3, [r2]
	ands r0, r3
	strh r0, [r2]
	ldrh r1, [r1]
	cmp r1, #0x50
	bls _080084CC
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0800848C
	movs r0, #0x3c
	b _0800848E
	.align 2, 0
_0800847C: .4byte gScriptContext
_08008480: .4byte gUnknown_03002CE0
_08008484: .4byte 0x0000FFFF
_08008488: .4byte 0x0000FDFF
_0800848C:
	movs r0, #0x14
_0800848E:
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #9]
	b _080084CC
_08008496:
	adds r1, r3, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ands r0, r5
	cmp r0, #3
	bls _080084CC
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	ldrh r6, [r1]
	eors r0, r6
	strh r0, [r1]
	cmp r0, #0
	bne _080084C4
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r3, [r2]
	orrs r0, r3
	b _080084CA
_080084C4:
	ldr r0, _080084D4 @ =0x0000FDFF
	ldrh r6, [r2]
	ands r0, r6
_080084CA:
	strh r0, [r2]
_080084CC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080084D4: .4byte 0x0000FDFF

	thumb_func_start sub_80084D8
sub_80084D8: @ 0x080084D8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #0x18]
	strb r0, [r4, #0x19]
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80084FC
sub_80084FC: @ 0x080084FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080085A8 @ =gMain
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x3d
	ldrb r4, [r5]
	movs r1, #0x40
	adds r0, r4, #0
	orrs r0, r1
	strb r0, [r5]
	movs r0, #6
	bl sub_8003D5C
	movs r0, #6
	bl sub_80049A0
	strb r4, [r5]
	ldr r0, _080085AC @ =gIORegisters
	adds r0, #0x4a
	movs r1, #0xd2
	lsls r1, r1, #5
	strh r1, [r0]
	movs r0, #0xa
	strb r0, [r6, #0x1a]
	ldr r1, _080085B0 @ =gOamObjects
	movs r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
_0800853E:
	strh r2, [r1]
	adds r1, #8
	adds r0, #1
	cmp r0, #0x7f
	bls _0800853E
	bl ResetAnimationSystem
	ldr r1, _080085B4 @ =0x040000D4
	ldr r0, _080085B8 @ =gUnknown_0202CFC0
	str r0, [r1]
	ldr r0, _080085BC @ =0x06013400
	str r0, [r1, #4]
	ldr r0, _080085C0 @ =0x80001400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080085C4 @ =gPalChoiceSelected
	str r0, [r1]
	ldr r0, _080085C8 @ =0x05000320
	str r0, [r1, #4]
	ldr r0, _080085CC @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080085D0 @ =gGfxSaveGameTiles
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080085D4 @ =0x80000800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #2
	bl sub_80051CC
	adds r1, r6, #0
	adds r1, #0xa2
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x31
	bl sub_8011150
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080085A8: .4byte gMain
_080085AC: .4byte gIORegisters
_080085B0: .4byte gOamObjects
_080085B4: .4byte 0x040000D4
_080085B8: .4byte gUnknown_0202CFC0
_080085BC: .4byte 0x06013400
_080085C0: .4byte 0x80001400
_080085C4: .4byte gPalChoiceSelected
_080085C8: .4byte 0x05000320
_080085CC: .4byte 0x80000020
_080085D0: .4byte gGfxSaveGameTiles
_080085D4: .4byte 0x80000800

	thumb_func_start sub_80085D8
sub_80085D8: @ 0x080085D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, [r0, #0x1c]
	mov ip, r2
	str r1, [sp]
	ldr r7, [r0, #0x34]
	ldrh r6, [r7]
	mov sl, r6
	movs r4, #0
	cmp r4, sl
	bhs _08008692
_080085F6:
	adds r7, #4
	ldrh r2, [r7, #2]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r1, r2
	lsrs r1, r1, #0xe
	lsrs r0, r0, #0xa
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _080086A4 @ =gUnknown_080267F8
	adds r1, r0, r2
	ldrb r5, [r1]
	ldr r6, _080086A8 @ =gUnknown_080267F9
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r0, r1, #0
	adds r0, #0x40
	cmp r0, #0
	bge _08008628
	adds r0, #7
_08008628:
	asrs r6, r0, #3
	movs r1, #1
	ldrsb r1, [r7, r1]
	adds r0, r1, #0
	adds r0, #0x20
	cmp r0, #0
	bge _08008638
	adds r0, #7
_08008638:
	asrs r0, r0, #3
	movs r3, #0
	adds r1, r2, #0
	adds r2, r5, #0
	muls r2, r1, r2
	mov r8, r2
	adds r4, #1
	mov sb, r4
	cmp r3, r1
	bhs _08008682
	ldr r4, _080086AC @ =0x040000D4
	lsls r0, r0, #4
	adds r0, r0, r6
	str r0, [sp, #4]
	lsls r2, r5, #4
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
_0800865C:
	adds r0, r3, #0
	muls r0, r5, r0
	lsls r0, r0, #5
	add r0, ip
	str r0, [r4]
	lsls r0, r3, #4
	ldr r6, [sp, #4]
	adds r0, r6, r0
	lsls r0, r0, #5
	ldr r6, [sp]
	adds r0, r6, r0
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blo _0800865C
_08008682:
	mov r1, r8
	lsls r0, r1, #5
	add ip, r0
	mov r2, sb
	lsls r0, r2, #0x10
	lsrs r4, r0, #0x10
	cmp r4, sl
	blo _080085F6
_08008692:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080086A4: .4byte gUnknown_080267F8
_080086A8: .4byte gUnknown_080267F9
_080086AC: .4byte 0x040000D4

	thumb_func_start sub_80086B0
sub_80086B0: @ 0x080086B0
	push {r4, r5, r6, r7, lr}
	movs r5, #8
	adds r4, r0, #0
	adds r7, r1, #0
	movs r3, #0
	ldr r2, _08008700 @ =0x040000D4
	ldr r6, _08008704 @ =0x80000080
_080086BE:
	lsls r0, r5, #1
	muls r0, r3, r0
	lsls r0, r0, #5
	adds r0, r4, r0
	str r0, [r2]
	adds r1, r3, #0
	muls r1, r5, r1
	lsls r1, r1, #5
	adds r1, r7, r1
	str r1, [r2, #4]
	str r6, [r2, #8]
	ldr r0, [r2, #8]
	lsls r0, r3, #1
	adds r0, #1
	muls r0, r5, r0
	lsls r0, r0, #5
	adds r0, r4, r0
	str r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r2, #4]
	str r6, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #7
	bls _080086BE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008700: .4byte 0x040000D4
_08008704: .4byte 0x80000080

	thumb_func_start sub_8008708
sub_8008708: @ 0x08008708
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	ldrb r0, [r7, #9]
	cmp r0, #0xb
	bls _0800871E
	b _08008D58
_0800871E:
	lsls r0, r0, #2
	ldr r1, _08008728 @ =_0800872C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008728: .4byte _0800872C
_0800872C: @ jump table
	.4byte _0800875C @ case 0
	.4byte _08008764 @ case 1
	.4byte _080088A0 @ case 2
	.4byte _080089FC @ case 3
	.4byte _08008A28 @ case 4
	.4byte _08008A38 @ case 5
	.4byte _08008A5C @ case 6
	.4byte _08008A88 @ case 7
	.4byte _08008B24 @ case 8
	.4byte _08008BD4 @ case 9
	.4byte _08008C74 @ case 10
	.4byte _08008D14 @ case 11
_0800875C:
	adds r0, r7, #0
	bl sub_80084D8
	b _08008D58
_08008764:
	adds r0, r7, #0
	adds r0, #0x8a
	ldrh r2, [r0]
	cmp r2, #0
	beq _08008770
	b _08008D58
_08008770:
	ldr r0, _080087A8 @ =gIORegisters
	adds r3, r0, #0
	adds r3, #0x4a
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r1, #0
	ldrh r1, [r3]
	orrs r1, r4
	strh r1, [r3]
	strh r2, [r0, #0xe]
	adds r0, r7, #0
	bl sub_80084FC
	ldr r0, _080087AC @ =gMain
	movs r3, #0xf0
	ldrb r0, [r0, #0x1b]
	ands r3, r0
	cmp r3, #0
	beq _080087F0
	movs r3, #0
	ldr r0, _080087B0 @ =gJoypad
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080087B4
	movs r3, #1
	b _080087C0
	.align 2, 0
_080087A8: .4byte gIORegisters
_080087AC: .4byte gMain
_080087B0: .4byte gJoypad
_080087B4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080087C0
	movs r3, #2
_080087C0:
	ldr r2, _080087E4 @ =0x00002C54
	adds r0, r3, #0
	muls r0, r2, r0
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r0, r1
	ldr r5, _080087E8 @ =gSaveDataBuffer
	adds r1, r5, #0
	bl ReadSram
	ldrb r0, [r7, #0xb]
	adds r0, #1
	lsls r0, r0, #4
	ldr r2, _080087EC @ =gUnknown_020000F6
	strb r0, [r2]
	bl sub_80070AC
	b _08008854
	.align 2, 0
_080087E4: .4byte 0x00002C54
_080087E8: .4byte gSaveDataBuffer
_080087EC: .4byte gUnknown_020000F6
_080087F0:
	ldr r1, _08008824 @ =0x040000D4
	ldr r0, _08008828 @ =gUnknown_080267B0
	str r0, [r1]
	ldr r2, _0800882C @ =gSaveDataBuffer
	str r2, [r1, #4]
	ldr r0, _08008830 @ =0x80000019
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r3, [r2, #0x30]
	ldrb r0, [r7, #0xb]
	adds r0, #1
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #0xf6
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08008834 @ =gJoypad
	ldrh r3, [r0]
	adds r0, r4, #0
	ands r0, r3
	adds r4, r2, #0
	cmp r0, #0
	beq _08008838
	movs r1, #1
	b _08008844
	.align 2, 0
_08008824: .4byte 0x040000D4
_08008828: .4byte gUnknown_080267B0
_0800882C: .4byte gSaveDataBuffer
_08008830: .4byte 0x80000019
_08008834: .4byte gJoypad
_08008838:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08008844
	movs r1, #2
_08008844:
	ldr r2, _08008888 @ =0x00002C54
	muls r1, r2, r1
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r1, r1, r0
	adds r0, r4, #0
	bl WriteSramEx
_08008854:
	ldr r0, _0800888C @ =gMain
	ldrb r1, [r7, #0xb]
	adds r1, #1
	lsls r1, r1, #4
	adds r0, #0xc2
	strb r1, [r0]
	movs r0, #1
	strb r0, [r7, #0x17]
	movs r4, #0xb8
	lsls r4, r4, #1
	movs r0, #0xf
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
	ldrb r3, [r7, #0x17]
	ldrb r0, [r7, #0xb]
	cmp r3, r0
	beq _08008890
	movs r0, #0x10
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
	b _0800889A
	.align 2, 0
_08008888: .4byte 0x00002C54
_0800888C: .4byte gMain
_08008890:
	movs r0, #9
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
_0800889A:
	movs r0, #0
	strb r0, [r7, #0xa]
	b _08008D58
_080088A0:
	ldrb r0, [r7, #0x17]
	adds r0, #0xe
	bl sub_8011D68
	str r0, [sp]
	ldrb r1, [r7, #0x17]
	ldrb r2, [r7, #0xb]
	cmp r1, r2
	bne _080088B6
	movs r0, #9
	b _080088BA
_080088B6:
	ldrb r0, [r7, #0x17]
	adds r0, #0xf
_080088BA:
	bl sub_8011D68
	str r0, [sp, #4]
	ldrb r1, [r7, #0x17]
	adds r0, r1, #1
	ldrb r3, [r7, #0xb]
	cmp r0, r3
	bne _080088CE
	movs r0, #9
	b _080088D2
_080088CE:
	adds r0, r1, #0
	adds r0, #0x10
_080088D2:
	bl sub_8011D68
	str r0, [sp, #8]
	ldrb r0, [r7, #0x17]
	adds r0, #0xd
	bl sub_8011D68
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x10]
	subs r0, #6
	strh r0, [r1, #0x10]
	ldr r0, [sp, #4]
	movs r4, #0x10
	ldrsh r0, [r0, r4]
	cmp r0, #0xb8
	bgt _08008928
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _08008928
	ldrb r0, [r7, #0x17]
	ldrb r1, [r7, #0xb]
	cmp r0, r1
	bhs _08008928
	ldrb r1, [r7, #0x17]
	adds r0, r1, #1
	ldrb r2, [r7, #0xb]
	cmp r0, r2
	bne _0800891A
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r0, #9
	movs r2, #0x48
	bl sub_8012864
	b _08008928
_0800891A:
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x48
	bl sub_8012864
_08008928:
	ldr r1, [sp, #4]
	movs r3, #0x10
	ldrsh r0, [r1, r3]
	cmp r0, #0x78
	bgt _080089B0
	ldrb r0, [r7, #0x17]
	ldrb r4, [r7, #0xb]
	cmp r0, r4
	bne _080089AC
	movs r0, #0x78
	strh r0, [r1, #0x10]
	ldrb r0, [r7, #0x17]
	adds r0, #0x14
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r7, #0x17]
	adds r0, #1
	movs r1, #0x96
	lsls r1, r1, #2
	adds r3, r7, r1
	strb r0, [r3]
	ldrb r0, [r7, #0x17]
	adds r0, #2
	ldr r2, _080089A0 @ =0x00000259
	adds r1, r7, r2
	strb r0, [r1]
	ldrb r0, [r7, #0x17]
	adds r0, #3
	ldr r4, _080089A4 @ =0x0000025A
	adds r2, r7, r4
	strb r0, [r2]
	ldrb r0, [r3]
	cmp r0, #4
	bls _08008974
	subs r0, #5
	strb r0, [r3]
_08008974:
	ldrb r0, [r1]
	cmp r0, #4
	bls _0800897E
	subs r0, #5
	strb r0, [r1]
_0800897E:
	ldrb r0, [r2]
	cmp r0, #4
	bls _08008988
	subs r0, #5
	strb r0, [r2]
_08008988:
	ldr r0, [sp, #4]
	ldr r2, _080089A8 @ =gUnknown_080267E4
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_80085D8
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	b _080089B0
	.align 2, 0
_080089A0: .4byte 0x00000259
_080089A4: .4byte 0x0000025A
_080089A8: .4byte gUnknown_080267E4
_080089AC:
	adds r0, #1
	strb r0, [r7, #0x17]
_080089B0:
	ldr r1, [sp]
	cmp r1, #0
	beq _080089BE
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	subs r0, #0x98
	strh r0, [r1, #0x10]
_080089BE:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _080089CC
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	adds r0, #0x98
	strh r0, [r1, #0x10]
_080089CC:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _080089D4
	b _08008D58
_080089D4:
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	ldr r2, _080089F8 @ =0xFFFFFED0
	adds r0, r0, r2
	strh r0, [r1, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0x10
	ldrsh r1, [r2, r3]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080089EE
	b _08008D58
_080089EE:
	adds r0, r2, #0
	bl sub_8012F7C
	b _08008D58
	.align 2, 0
_080089F8: .4byte 0xFFFFFED0
_080089FC:
	ldr r2, _08008A20 @ =gUnknown_080267E4
	movs r4, #0x96
	lsls r4, r4, #2
	adds r0, r7, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r3, _08008A24 @ =0x00000259
	adds r1, r7, r3
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_80086B0
	b _08008CAA
	.align 2, 0
_08008A20: .4byte gUnknown_080267E4
_08008A24: .4byte 0x00000259
_08008A28:
	ldrb r0, [r7, #0x17]
	adds r0, #0xa
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x48
	bl sub_8012864
	b _08008CAA
_08008A38:
	ldrb r0, [r7, #0x17]
	adds r0, #0xa
	bl sub_8011D68
	str r0, [sp]
	ldr r2, _08008A58 @ =gUnknown_080267E4
	movs r4, #0x96
	lsls r4, r4, #2
	adds r1, r7, r4
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_80085D8
	b _08008CAA
	.align 2, 0
_08008A58: .4byte gUnknown_080267E4
_08008A5C:
	ldr r2, _08008A80 @ =gUnknown_080267E4
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r3, _08008A84 @ =0x0000025A
	adds r1, r7, r3
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_80086B0
	b _08008CAA
	.align 2, 0
_08008A80: .4byte gUnknown_080267E4
_08008A84: .4byte 0x0000025A
_08008A88:
	ldrb r0, [r7, #0x17]
	adds r0, #0xa
	bl sub_8011D68
	str r0, [sp]
	bl sub_8012F7C
	movs r0, #9
	bl sub_8011D68
	str r0, [sp]
	ldr r6, _08008B0C @ =gUnknown_03002D70
	ldrh r0, [r0, #0x12]
	adds r0, #0xe0
	strh r0, [r6]
	ldr r0, [sp]
	ldrh r0, [r0, #0x10]
	ldr r4, _08008B10 @ =0xFFFFBFC0
	adds r0, r0, r4
	strh r0, [r6, #2]
	ldr r0, _08008B14 @ =gUnknown_080267E4
	mov r8, r0
	ldr r1, _08008B18 @ =0x00000259
	adds r3, r7, r1
	ldrb r2, [r3]
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldr r2, _08008B1C @ =0xF9FF0000
	adds r0, r0, r2
	lsrs r0, r0, #5
	movs r4, #0xb0
	lsls r4, r4, #8
	adds r1, r4, #0
	movs r4, #0
	mov sb, r4
	orrs r0, r1
	strh r0, [r6, #4]
	adds r6, #8
	ldr r0, [sp]
	ldrh r0, [r0, #0x12]
	adds r0, #0xe0
	strh r0, [r6]
	ldr r0, [sp]
	ldrh r0, [r0, #0x10]
	ldr r4, _08008B20 @ =0xFFFFC000
	adds r0, r0, r4
	strh r0, [r6, #2]
	ldrb r3, [r3]
	lsls r0, r3, #2
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r2
	lsrs r0, r0, #5
	orrs r0, r1
	adds r0, #0x40
	strh r0, [r6, #4]
	ldr r0, [sp]
	bl sub_8012F7C
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	mov r0, sb
	strb r0, [r7, #0xa]
	b _08008D58
	.align 2, 0
_08008B0C: .4byte gUnknown_03002D70
_08008B10: .4byte 0xFFFFBFC0
_08008B14: .4byte gUnknown_080267E4
_08008B18: .4byte 0x00000259
_08008B1C: .4byte 0xF9FF0000
_08008B20: .4byte 0xFFFFC000
_08008B24:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _08008B34
	b _08008D58
_08008B34:
	movs r1, #0xa0
	adds r1, r1, r7
	mov sb, r1
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	mov r3, sl
	strh r3, [r1]
	ldr r6, _08008BCC @ =gUnknown_08026430
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x10]
	mov r0, sl
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	bl sub_800650C
	ldr r2, _08008BD0 @ =gOamObjects
	mov r8, r2
	strh r0, [r2, #6]
	movs r3, #0
	ldrsh r4, [r6, r3]
	mov r0, sl
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_800650C
	mov r4, r8
	strh r0, [r4, #0xe]
	ldrh r6, [r6]
	rsbs r6, r6, #0
	str r6, [sp, #0x14]
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_800650C
	strh r0, [r4, #0x16]
	mov r3, sb
	movs r4, #0
	ldrsh r0, [r3, r4]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	bl sub_800650C
	mov r1, r8
	strh r0, [r1, #0x1e]
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r2, #0
	strb r2, [r7, #0xa]
	b _08008D58
	.align 2, 0
_08008BCC: .4byte gUnknown_08026430
_08008BD0: .4byte gOamObjects
_08008BD4:
	movs r3, #0xa0
	adds r3, r3, r7
	mov r8, r3
	ldrh r0, [r3]
	subs r0, #0x10
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08008C30
	ldr r7, _08008C24 @ =gUnknown_08026430
	ldrh r4, [r7]
	rsbs r4, r4, #0
	str r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl sub_800650C
	ldr r6, _08008C28 @ =gOamObjects
	strh r0, [r6, #0x16]
	ldr r2, _08008C2C @ =gUnknown_080264B0
	movs r3, #0
	ldrsh r5, [r2, r3]
	mov r4, r8
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	b _08008CFE
	.align 2, 0
_08008C24: .4byte gUnknown_08026430
_08008C28: .4byte gOamObjects
_08008C2C: .4byte gUnknown_080264B0
_08008C30:
	ldr r6, _08008C64 @ =gUnknown_03002D70
	ldr r5, _08008C68 @ =gUnknown_080267E4
	ldr r2, _08008C6C @ =0x0000025A
	adds r3, r7, r2
	ldrb r4, [r3]
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r2, _08008C70 @ =0xF9FF0000
	adds r0, r0, r2
	lsrs r0, r0, #5
	movs r4, #0xa0
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r6, #4]
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r0, r0, r2
	lsrs r0, r0, #5
	orrs r0, r1
	adds r0, #0x40
	strh r0, [r6, #0xc]
	b _08008CAA
	.align 2, 0
_08008C64: .4byte gUnknown_03002D70
_08008C68: .4byte gUnknown_080267E4
_08008C6C: .4byte 0x0000025A
_08008C70: .4byte 0xF9FF0000
_08008C74:
	adds r5, r7, #0
	adds r5, #0xa0
	ldrh r0, [r5]
	adds r0, #0x10
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08008CC4
	movs r0, #1
	strb r0, [r7, #0x18]
	strb r0, [r7, #0x19]
	ldr r1, _08008CB4 @ =gScriptContext
	ldr r0, _08008CB8 @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #5
	bl sub_8018778
	ldr r6, _08008CBC @ =gUnknown_03002D70
	ldr r1, _08008CC0 @ =0x0000FEFF
	adds r0, r1, #0
	ldrh r2, [r6]
	ands r0, r2
	strh r0, [r6]
	ldrh r3, [r6, #8]
	ands r1, r3
	strh r1, [r6, #8]
_08008CAA:
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	b _08008D58
	.align 2, 0
_08008CB4: .4byte gScriptContext
_08008CB8: .4byte 0x0000FFFF
_08008CBC: .4byte gUnknown_03002D70
_08008CC0: .4byte 0x0000FEFF
_08008CC4:
	ldr r7, _08008D08 @ =gUnknown_08026430
	ldrh r4, [r7]
	rsbs r4, r4, #0
	str r4, [sp, #0x24]
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl sub_800650C
	ldr r6, _08008D0C @ =gOamObjects
	strh r0, [r6, #0x16]
	ldr r2, _08008D10 @ =gUnknown_080264B0
	movs r3, #0
	ldrsh r7, [r2, r3]
	movs r4, #0
	ldrsh r0, [r5, r4]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r7, #0
_08008CFE:
	bl sub_800650C
	strh r0, [r6, #0x1e]
	b _08008D58
	.align 2, 0
_08008D08: .4byte gUnknown_08026430
_08008D0C: .4byte gOamObjects
_08008D10: .4byte gUnknown_080264B0
_08008D14:
	ldr r1, _08008D68 @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _08008D58
	ldr r1, _08008D6C @ =gJoypad
	movs r0, #0xf
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08008D58
	bl sub_80112C8
	movs r0, #0x2b
	bl sub_8011150
	ldr r0, _08008D70 @ =gSaveDataBuffer
	adds r1, r7, #0
	adds r1, #0xc1
	ldrb r1, [r1]
	adds r2, r0, #0
	adds r2, #0xf5
	strb r1, [r2]
	ldrb r1, [r7, #0xb]
	adds r1, #1
	lsls r1, r1, #4
	adds r0, #0xf6
	strb r1, [r0]
	ldr r0, _08008D74 @ =gMain
	adds r0, #0xc2
	strb r1, [r0]
	ldr r0, _08008D78 @ =0x0100000A
	str r0, [r7, #8]
_08008D58:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008D68: .4byte gScriptContext
_08008D6C: .4byte gJoypad
_08008D70: .4byte gSaveDataBuffer
_08008D74: .4byte gMain
_08008D78: .4byte 0x0100000A

	thumb_func_start sub_8008D7C
sub_8008D7C: @ 0x08008D7C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldrb r0, [r6, #9]
	cmp r0, #0x64
	bls _08008D8C
	bl _08009850
_08008D8C:
	lsls r0, r0, #2
	ldr r1, _08008D98 @ =_08008D9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008D98: .4byte _08008D9C
_08008D9C: @ jump table
	.4byte _08008F30 @ case 0
	.4byte _08008F3A @ case 1
	.4byte _08009088 @ case 2
	.4byte _08009100 @ case 3
	.4byte _08009850 @ case 4
	.4byte _08009850 @ case 5
	.4byte _08009850 @ case 6
	.4byte _08009850 @ case 7
	.4byte _08009850 @ case 8
	.4byte _08009850 @ case 9
	.4byte _080092CA @ case 10
	.4byte _0800938E @ case 11
	.4byte _08009850 @ case 12
	.4byte _08009850 @ case 13
	.4byte _08009850 @ case 14
	.4byte _08009850 @ case 15
	.4byte _08009850 @ case 16
	.4byte _08009850 @ case 17
	.4byte _08009850 @ case 18
	.4byte _08009850 @ case 19
	.4byte _08009442 @ case 20
	.4byte _080094B8 @ case 21
	.4byte _08009536 @ case 22
	.4byte _0800955C @ case 23
	.4byte _08009850 @ case 24
	.4byte _08009850 @ case 25
	.4byte _08009850 @ case 26
	.4byte _08009850 @ case 27
	.4byte _08009850 @ case 28
	.4byte _08009850 @ case 29
	.4byte _08009850 @ case 30
	.4byte _08009850 @ case 31
	.4byte _08009850 @ case 32
	.4byte _08009850 @ case 33
	.4byte _08009850 @ case 34
	.4byte _08009850 @ case 35
	.4byte _08009850 @ case 36
	.4byte _08009850 @ case 37
	.4byte _08009850 @ case 38
	.4byte _08009850 @ case 39
	.4byte _08009850 @ case 40
	.4byte _08009850 @ case 41
	.4byte _08009850 @ case 42
	.4byte _08009850 @ case 43
	.4byte _08009850 @ case 44
	.4byte _08009850 @ case 45
	.4byte _08009850 @ case 46
	.4byte _08009850 @ case 47
	.4byte _08009850 @ case 48
	.4byte _08009850 @ case 49
	.4byte _08009850 @ case 50
	.4byte _08009850 @ case 51
	.4byte _08009850 @ case 52
	.4byte _08009850 @ case 53
	.4byte _08009850 @ case 54
	.4byte _08009850 @ case 55
	.4byte _08009850 @ case 56
	.4byte _08009850 @ case 57
	.4byte _08009850 @ case 58
	.4byte _08009850 @ case 59
	.4byte _08009850 @ case 60
	.4byte _08009850 @ case 61
	.4byte _08009850 @ case 62
	.4byte _08009850 @ case 63
	.4byte _08009850 @ case 64
	.4byte _08009850 @ case 65
	.4byte _08009850 @ case 66
	.4byte _08009850 @ case 67
	.4byte _08009850 @ case 68
	.4byte _08009850 @ case 69
	.4byte _08009850 @ case 70
	.4byte _08009850 @ case 71
	.4byte _08009850 @ case 72
	.4byte _08009850 @ case 73
	.4byte _08009850 @ case 74
	.4byte _08009850 @ case 75
	.4byte _08009850 @ case 76
	.4byte _08009850 @ case 77
	.4byte _08009850 @ case 78
	.4byte _08009850 @ case 79
	.4byte _08009850 @ case 80
	.4byte _08009850 @ case 81
	.4byte _08009850 @ case 82
	.4byte _08009850 @ case 83
	.4byte _08009850 @ case 84
	.4byte _08009850 @ case 85
	.4byte _08009850 @ case 86
	.4byte _08009850 @ case 87
	.4byte _08009850 @ case 88
	.4byte _08009850 @ case 89
	.4byte _08009850 @ case 90
	.4byte _08009850 @ case 91
	.4byte _08009850 @ case 92
	.4byte _08009850 @ case 93
	.4byte _08009850 @ case 94
	.4byte _08009850 @ case 95
	.4byte _08009850 @ case 96
	.4byte _08009850 @ case 97
	.4byte _08009850 @ case 98
	.4byte _0800968C @ case 99
	.4byte _08009716 @ case 100
_08008F30:
	adds r0, r6, #0
	bl sub_80084D8
	bl _08009850
_08008F3A:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _08008F48
	bl _08009850
_08008F48:
	adds r0, r6, #0
	bl sub_80084FC
	movs r0, #0xf0
	ldrb r1, [r6, #0x1b]
	ands r0, r1
	cmp r0, #0
	beq _08008F64
	ldr r0, _08008F78 @ =gSaveDataBuffer
	adds r0, #0xf6
	ldrb r0, [r0]
	adds r1, r6, #0
	adds r1, #0xc2
	strb r0, [r1]
_08008F64:
	adds r0, r6, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #0x14
	bhi _08008FFC
	lsls r0, r0, #2
	ldr r1, _08008F7C @ =_08008F80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008F78: .4byte gSaveDataBuffer
_08008F7C: .4byte _08008F80
_08008F80: @ jump table
	.4byte _08008FFC @ case 0
	.4byte _08008FFC @ case 1
	.4byte _08008FD4 @ case 2
	.4byte _08008FFC @ case 3
	.4byte _08008FFC @ case 4
	.4byte _08008FFC @ case 5
	.4byte _08008FFC @ case 6
	.4byte _08008FDE @ case 7
	.4byte _08008FFC @ case 8
	.4byte _08008FFC @ case 9
	.4byte _08008FFC @ case 10
	.4byte _08008FFC @ case 11
	.4byte _08008FE8 @ case 12
	.4byte _08008FFC @ case 13
	.4byte _08008FFC @ case 14
	.4byte _08008FFC @ case 15
	.4byte _08008FFC @ case 16
	.4byte _08008FFC @ case 17
	.4byte _08008FFC @ case 18
	.4byte _08008FFC @ case 19
	.4byte _08008FF2 @ case 20
_08008FD4:
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	b _08009004
_08008FDE:
	movs r3, #0x96
	lsls r3, r3, #2
	adds r1, r6, r3
	movs r0, #3
	b _08009004
_08008FE8:
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #4
	b _08009004
_08008FF2:
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #5
	b _08009004
_08008FFC:
	movs r3, #0x96
	lsls r3, r3, #2
	adds r1, r6, r3
	movs r0, #1
_08009004:
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #2
	adds r5, r6, r0
	ldrb r1, [r5]
	cmp r1, #1
	bne _08009040
	ldrb r0, [r6, #0xb]
	movs r5, #0
	strb r0, [r6, #0x17]
	movs r4, #0xb8
	lsls r4, r4, #1
	movs r0, #0xa
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
	movs r0, #0x10
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
	movs r0, #0x14
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	strb r5, [r6, #0xa]
	bl _08009850
_08009040:
	movs r0, #1
	strb r0, [r6, #0x17]
	movs r4, #0xb8
	lsls r4, r4, #1
	movs r0, #0xf
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
	ldrb r1, [r6, #0x17]
	ldrb r0, [r5]
	subs r0, #1
	cmp r1, r0
	beq _08009068
	movs r0, #0x10
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
	b _08009072
_08009068:
	movs r0, #0xb
	adds r1, r4, #0
	movs r2, #0x48
	bl sub_8012864
_08009072:
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r1, [r0]
	subs r1, #1
	movs r2, #0
	strb r1, [r0]
	movs r0, #0x64
	strb r0, [r6, #9]
	strb r2, [r6, #0xa]
	b _08009850
_08009088:
	movs r0, #0xa
	bl sub_8011D68
	str r0, [sp]
	movs r0, #0x10
	bl sub_8011D68
	str r0, [sp, #4]
	ldr r1, [sp]
	ldrh r0, [r1, #0x10]
	subs r0, #8
	strh r0, [r1, #0x10]
	ldr r1, [sp]
	movs r3, #0x10
	ldrsh r0, [r1, r3]
	cmp r0, #0x78
	bgt _080090D0
	movs r0, #0x78
	strh r0, [r1, #0x10]
	movs r0, #1
	strb r0, [r6, #0x18]
	strb r0, [r6, #0x19]
	strb r0, [r6, #0x17]
	ldr r1, _080090F8 @ =gScriptContext
	ldr r0, _080090FC @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #2
	bl sub_8018778
	movs r0, #0x30
	movs r1, #0x14
	bl SetTimedKeysAndDelay
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
_080090D0:
	ldr r0, [sp]
	ldrh r2, [r0, #0x10]
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0xb8
	ble _080090DE
	b _08009850
_080090DE:
	adds r0, r6, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #1
	bhi _080090EC
	b _08009850
_080090EC:
	ldr r1, [sp, #4]
	adds r0, r2, #0
	adds r0, #0x98
	strh r0, [r1, #0x10]
	b _08009850
	.align 2, 0
_080090F8: .4byte gScriptContext
_080090FC: .4byte 0x0000FFFF
_08009100:
	ldr r1, _08009298 @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800910E
	b _08009850
_0800910E:
	ldrb r2, [r6, #0x17]
	cmp r2, #1
	bls _0800919E
	movs r0, #0x19
	bl sub_8011D68
	str r0, [sp]
	cmp r0, #0
	bne _0800912A
	movs r0, #0x19
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
_0800912A:
	ldr r1, _0800929C @ =gJoypad
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800919E
	ldrb r0, [r6, #0x17]
	adds r0, #9
	bl sub_8011D68
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl sub_8011D68
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0x13
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x19
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x1a
	bl sub_8011D68
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r6, #0x17]
	adds r0, #8
	movs r1, #0x20
	rsbs r1, r1, #0
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r6, #0x17]
	adds r0, #0x12
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	movs r0, #0x2a
	bl sub_8011150
	movs r0, #0xb
	strb r0, [r6, #9]
_0800919E:
	ldrb r3, [r6, #9]
	cmp r3, #3
	beq _080091A6
	b _08009850
_080091A6:
	adds r0, r6, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	ldrb r1, [r6, #0x17]
	cmp r1, r0
	bhs _0800923E
	movs r0, #0x1a
	bl sub_8011D68
	str r0, [sp]
	cmp r0, #0
	bne _080091CA
	movs r0, #0x1a
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
_080091CA:
	ldr r1, _0800929C @ =gJoypad
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800923E
	ldrb r0, [r6, #0x17]
	adds r0, #9
	bl sub_8011D68
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	bl sub_8011D68
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0x13
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x19
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x1a
	bl sub_8011D68
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r6, #0x17]
	adds r0, #0xa
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r6, #0x17]
	adds r0, #0x14
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	movs r0, #0x2a
	bl sub_8011150
	movs r0, #0xa
	strb r0, [r6, #9]
_0800923E:
	ldrb r2, [r6, #9]
	cmp r2, #3
	beq _08009246
	b _08009850
_08009246:
	ldr r0, _0800929C @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080092A8
	movs r0, #0x19
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x1a
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x2b
	bl sub_8011150
	adds r1, r6, #0
	adds r1, #0xa2
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	strb r2, [r6, #0x18]
	strb r2, [r6, #0x19]
	ldr r1, _080092A0 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _080092A4 @ =0x0000FDFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r0, #0xfd
	ldrb r1, [r6, #0x1a]
	ands r0, r1
	strb r0, [r6, #0x1a]
	strb r2, [r6, #0xb]
	strb r2, [r6, #0xa]
	movs r0, #0x14
	strb r0, [r6, #9]
	b _08009850
	.align 2, 0
_08009298: .4byte gScriptContext
_0800929C: .4byte gJoypad
_080092A0: .4byte gIORegisters
_080092A4: .4byte 0x0000FDFF
_080092A8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080092B2
	b _08009850
_080092B2:
	movs r0, #0x2c
	bl sub_8011150
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x63
	strb r0, [r6, #9]
	b _08009850
_080092CA:
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	bl sub_8011D68
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #0xa
	bl sub_8011D68
	str r0, [sp, #4]
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl sub_8011D68
	str r0, [sp, #8]
	ldrb r0, [r6, #0x17]
	adds r0, #0x10
	bl sub_8011D68
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x10]
	subs r0, #8
	strh r0, [r1, #0x10]
	ldr r1, [sp, #4]
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	cmp r0, #0x78
	bgt _08009314
	movs r0, #0x78
	strh r0, [r1, #0x10]
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
	movs r0, #3
	strb r0, [r6, #9]
	b _08009350
_08009314:
	cmp r0, #0xb8
	bgt _08009350
	adds r0, r6, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r1, r0, #4
	ldrb r2, [r6, #0x17]
	adds r0, r2, #1
	cmp r1, r0
	ble _08009350
	cmp r2, #3
	bhi _08009350
	adds r0, #0xf
	bl sub_8011D68
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _08009350
	ldrb r0, [r6, #0x17]
	adds r0, #0x10
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r6, #0x17]
	adds r0, #0x10
	bl sub_8011D68
	str r0, [sp, #0xc]
_08009350:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x10]
	subs r1, #0x98
	strh r1, [r0, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08009368
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	adds r0, #0x98
	strh r0, [r1, #0x10]
_08009368:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _08009370
	b _08009850
_08009370:
	ldr r0, [sp]
	ldrh r0, [r0, #0x10]
	subs r0, #0x98
	strh r0, [r1, #0x10]
	ldr r0, [sp, #8]
	movs r3, #0x10
	ldrsh r1, [r0, r3]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08009388
	b _08009850
_08009388:
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	b _0800967A
_0800938E:
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	bl sub_8011D68
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #8
	bl sub_8011D68
	str r0, [sp, #4]
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	bl sub_8011D68
	str r0, [sp, #8]
	ldrb r0, [r6, #0x17]
	adds r0, #0xc
	bl sub_8011D68
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x10]
	adds r0, #8
	strh r0, [r1, #0x10]
	ldr r1, [sp, #4]
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	cmp r0, #0x77
	ble _080093D8
	movs r0, #0x78
	strh r0, [r1, #0x10]
	ldrb r0, [r6, #0x17]
	subs r0, #1
	strb r0, [r6, #0x17]
	movs r0, #3
	strb r0, [r6, #9]
	b _08009408
_080093D8:
	cmp r0, #0x37
	ble _08009408
	ldrb r3, [r6, #0x17]
	cmp r3, #2
	bls _08009408
	adds r0, r3, #0
	adds r0, #0xc
	bl sub_8011D68
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _08009408
	ldrb r0, [r6, #0x17]
	adds r0, #0xc
	movs r1, #0x40
	rsbs r1, r1, #0
	movs r2, #0x48
	bl sub_8012864
	ldrb r0, [r6, #0x17]
	adds r0, #0xc
	bl sub_8011D68
	str r0, [sp, #0xc]
_08009408:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x10]
	adds r1, #0x98
	strh r1, [r0, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08009420
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	subs r0, #0x98
	strh r0, [r1, #0x10]
_08009420:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _08009428
	b _08009850
_08009428:
	ldr r0, [sp]
	ldrh r0, [r0, #0x10]
	adds r0, #0x98
	strh r0, [r1, #0x10]
	ldr r0, [sp]
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0xb7
	bgt _0800943C
	b _08009850
_0800943C:
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	b _0800967A
_08009442:
	ldrb r0, [r6, #0x17]
	adds r0, #9
	bl sub_8011D68
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	bl sub_8011D68
	str r0, [sp, #4]
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl sub_8011D68
	adds r1, r0, #0
	str r1, [sp, #8]
	cmp r1, #0
	beq _08009480
	ldrh r0, [r1, #0x10]
	subs r0, #8
	strh r0, [r1, #0x10]
	ldr r2, [sp, #8]
	movs r3, #0x10
	ldrsh r1, [r2, r3]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08009480
	adds r0, r2, #0
	bl sub_8012F7C
_08009480:
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _080094A8
	ldrh r0, [r1, #0x10]
	adds r0, #8
	strh r0, [r1, #0x10]
	ldr r2, [sp, #4]
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	movs r0, #0x98
	lsls r0, r0, #1
	cmp r1, r0
	ble _080094A0
	adds r0, r2, #0
	bl sub_8012F7C
_080094A0:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080094A8
	b _08009850
_080094A8:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _080094B0
	b _08009850
_080094B0:
	strb r0, [r6, #0xb]
	movs r0, #0x15
	strb r0, [r6, #9]
	b _08009850
_080094B8:
	ldrb r0, [r6, #0x17]
	adds r0, #9
	bl sub_8011D68
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	bl sub_8011D68
	adds r2, r0, #0
	str r2, [sp, #0xc]
	ldrb r0, [r6, #0xa]
	adds r1, r0, #1
	strb r1, [r6, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0800950A
	ldr r0, [sp]
	cmp r0, #0
	beq _080094F4
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	b _08009506
_080094F4:
	adds r0, r2, #0
	bl sub_8012F7C
	ldrb r0, [r6, #0x17]
	adds r0, #9
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
_08009506:
	movs r0, #0
	strb r0, [r6, #0xa]
_0800950A:
	ldrb r0, [r6, #0xb]
	adds r1, r0, #1
	strb r1, [r6, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bhi _0800951A
	b _08009850
_0800951A:
	ldr r0, [sp]
	cmp r0, #0
	bne _0800952C
	ldrb r0, [r6, #0x17]
	adds r0, #9
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
_0800952C:
	movs r0, #0
	strb r0, [r6, #0xb]
	movs r0, #0x16
	strb r0, [r6, #9]
	b _08009850
_08009536:
	ldrb r0, [r6, #0xb]
	adds r1, r0, #1
	strb r1, [r6, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bhi _08009546
	b _08009850
_08009546:
	movs r0, #2
	movs r1, #4
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0
	strb r0, [r6, #0xb]
	movs r0, #0x17
	strb r0, [r6, #9]
	b _08009850
_0800955C:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r1, [r0]
	cmp r1, #0
	beq _08009568
	b _08009850
_08009568:
	ldrb r0, [r6, #0x17]
	subs r0, #1
	cmp r0, #4
	bhi _080095EC
	lsls r0, r0, #2
	ldr r1, _0800957C @ =_08009580
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800957C: .4byte _08009580
_08009580: @ jump table
	.4byte _08009594 @ case 0
	.4byte _080095C8 @ case 1
	.4byte _080095D0 @ case 2
	.4byte _080095D8 @ case 3
	.4byte _080095E0 @ case 4
_08009594:
	adds r1, r6, #0
	adds r1, #0xc1
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080095B4 @ =gJoypad
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _080095B8
	movs r0, #0x16
	strb r0, [r4]
	b _080095F4
	.align 2, 0
_080095B4: .4byte gJoypad
_080095B8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080095F4
	movs r0, #0x15
	strb r0, [r4]
	b _080095F4
_080095C8:
	adds r1, r6, #0
	adds r1, #0xc1
	movs r0, #2
	b _080095E6
_080095D0:
	adds r1, r6, #0
	adds r1, #0xc1
	movs r0, #7
	b _080095E6
_080095D8:
	adds r1, r6, #0
	adds r1, #0xc1
	movs r0, #0xc
	b _080095E6
_080095E0:
	adds r1, r6, #0
	adds r1, #0xc1
	movs r0, #0x14
_080095E6:
	strb r0, [r1]
	adds r4, r1, #0
	b _080095F4
_080095EC:
	adds r0, r6, #0
	adds r0, #0xc1
	strb r1, [r0]
	adds r4, r0, #0
_080095F4:
	ldrb r0, [r4]
	bl sub_8007610
	ldr r1, _08009684 @ =gMain
	movs r0, #0
	str r0, [r1, #4]
	ldr r0, _08009688 @ =gUnknown_080266D0
	ldrb r4, [r4]
	adds r0, r4, r0
	ldrb r0, [r0]
	str r0, [r6, #8]
	movs r0, #9
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xa
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xb
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xc
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xd
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xe
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xf
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x10
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x11
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x12
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x19
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x1a
_0800967A:
	bl sub_8011D68
	bl sub_8012F7C
	b _08009850
	.align 2, 0
_08009684: .4byte gMain
_08009688: .4byte gUnknown_080266D0
_0800968C:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _08009698
	b _08009850
_08009698:
	movs r0, #9
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xa
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xb
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xc
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xd
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xe
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0xf
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x10
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x11
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x12
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x19
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x1a
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #1
	str r0, [r6, #8]
	b _08009850
_08009716:
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	bl sub_8011D68
	str r0, [sp]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r2, [r6, #0x17]
	ldrb r0, [r0]
	cmp r2, r0
	bne _08009734
	adds r0, r2, #0
	adds r0, #0xa
	b _08009738
_08009734:
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
_08009738:
	bl sub_8011D68
	str r0, [sp, #4]
	ldrb r2, [r6, #0x17]
	adds r1, r2, #1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _08009754
	adds r0, r2, #0
	adds r0, #0xb
	b _08009758
_08009754:
	adds r0, r2, #0
	adds r0, #0x10
_08009758:
	bl sub_8011D68
	str r0, [sp, #8]
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl sub_8011D68
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x10]
	subs r0, #6
	strh r0, [r1, #0x10]
	ldr r0, [sp, #4]
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0xb8
	bgt _080097B4
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080097B4
	movs r3, #0x96
	lsls r3, r3, #2
	adds r2, r6, r3
	ldrb r0, [r6, #0x17]
	ldrb r1, [r2]
	cmp r0, r1
	bhs _080097B4
	ldrb r1, [r6, #0x17]
	adds r0, r1, #1
	ldrb r2, [r2]
	cmp r0, r2
	bne _080097A6
	adds r0, #0xa
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x48
	bl sub_8012864
	b _080097B4
_080097A6:
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0xb8
	lsls r1, r1, #1
	movs r2, #0x48
	bl sub_8012864
_080097B4:
	ldr r1, [sp, #4]
	movs r2, #0x10
	ldrsh r0, [r1, r2]
	cmp r0, #0x78
	bgt _08009810
	movs r0, #0x78
	strh r0, [r1, #0x10]
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r6, r3
	ldrb r1, [r6, #0x17]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0800980C
	adds r0, r1, #0
	adds r0, #0x14
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	movs r0, #1
	strb r0, [r6, #0x18]
	strb r0, [r6, #0x19]
	ldr r1, _08009804 @ =gScriptContext
	ldr r0, _08009808 @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #2
	bl sub_8018778
	movs r0, #0x30
	movs r1, #0x14
	bl SetTimedKeysAndDelay
	ldrb r0, [r6, #0x17]
	adds r0, #1
	strb r0, [r6, #0x17]
	movs r0, #3
	strb r0, [r6, #9]
	b _08009810
	.align 2, 0
_08009804: .4byte gScriptContext
_08009808: .4byte 0x0000FFFF
_0800980C:
	adds r0, r1, #1
	strb r0, [r6, #0x17]
_08009810:
	ldr r1, [sp]
	cmp r1, #0
	beq _0800981E
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	subs r0, #0x98
	strh r0, [r1, #0x10]
_0800981E:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0800982C
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	adds r0, #0x98
	strh r0, [r1, #0x10]
_0800982C:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08009850
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x10]
	ldr r2, _08009858 @ =0xFFFFFED0
	adds r0, r0, r2
	strh r0, [r1, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0x10
	ldrsh r1, [r2, r3]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08009850
	adds r0, r2, #0
	bl sub_8012F7C
_08009850:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009858: .4byte 0xFFFFFED0

	thumb_func_start sub_800985C
sub_800985C: @ 0x0800985C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrb r0, [r0, #9]
	cmp r0, #4
	bne _08009872
	b _08009BE8
_08009872:
	cmp r0, #4
	bgt _08009896
	cmp r0, #1
	beq _080098C8
	cmp r0, #1
	bgt _08009886
	cmp r0, #0
	beq _080098BA
	bl _0800A368
_08009886:
	cmp r0, #2
	bne _0800988C
	b _080099EC
_0800988C:
	cmp r0, #3
	bne _08009892
	b _08009A58
_08009892:
	bl _0800A368
_08009896:
	cmp r0, #7
	bne _0800989E
	bl sub_0800A230
_0800989E:
	cmp r0, #7
	ble _080098A6
	bl _0800A368
_080098A6:
	cmp r0, #5
	bne _080098AE
	bl sub_0800A1D0
_080098AE:
	cmp r0, #6
	bne _080098B6
	bl sub_0800A21C
_080098B6:
	bl _0800A368
_080098BA:
	bl sub_8007120
	mov r0, r8
	bl sub_80084D8
	bl _0800A368
_080098C8:
	mov r0, r8
	adds r0, #0x8a
	ldrh r3, [r0]
	cmp r3, #0
	beq _080098D6
	bl _0800A368
_080098D6:
	ldr r0, _080099B0 @ =gSaveDataBuffer
	adds r1, r0, #0
	adds r1, #0x4f
	ldrb r1, [r1]
	mov r2, r8
	strb r1, [r2, #0x1b]
	adds r0, #0xf5
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0xc1
	strb r0, [r1]
	ldr r1, _080099B4 @ =0x040000D4
	ldr r0, _080099B8 @ =gGfxSaveGameTiles
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r2, _080099BC @ =0x80000800
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080099C0 @ =gGfxFromSaveOrBeginningOptions
	str r0, [r1]
	ldr r0, _080099C4 @ =0x06013400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080099C8 @ =gPalChoiceSelected
	str r0, [r1]
	ldr r0, _080099CC @ =0x05000320
	str r0, [r1, #4]
	ldr r0, _080099D0 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080099D4 @ =gMain
	movs r6, #0x96
	lsls r6, r6, #2
	adds r0, r0, r6
	strb r3, [r0]
	mov r5, r8
	adds r5, #0x3d
	ldrb r4, [r5]
	movs r1, #0x40
	adds r0, r4, #0
	orrs r0, r1
	strb r0, [r5]
	movs r0, #6
	bl sub_8003D5C
	movs r0, #6
	bl sub_80049A0
	strb r4, [r5]
	mov r1, r8
	adds r1, #0x27
	movs r0, #0xfc
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r2, _080099D8 @ =gOamObjects
	movs r7, #0
	movs r0, #0x80
	lsls r0, r0, #2
_08009952:
	strh r0, [r2]
	adds r2, #8
	adds r7, #1
	cmp r7, #0x7f
	bls _08009952
	movs r7, #0
	ldr r2, _080099DC @ =0x000003FF
	movs r1, #0
	ldr r0, _080099E0 @ =gUnknown_03000000
_08009964:
	strh r1, [r0]
	adds r0, #2
	adds r7, #1
	cmp r7, r2
	bls _08009964
	movs r0, #5
	movs r1, #8
	bl sub_8005CFC
	movs r0, #0x31
	bl sub_8011150
	ldr r1, _080099E4 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x4a
	movs r2, #0
	movs r0, #0xe2
	lsls r0, r0, #5
	strh r0, [r3]
	movs r0, #0xc
	mov r3, r8
	strb r0, [r3, #0x1a]
	ldr r0, _080099E8 @ =0x00003E01
	strh r0, [r1, #4]
	strb r2, [r3, #0x17]
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	mov r6, r8
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	bl _0800A368
	.align 2, 0
_080099B0: .4byte gSaveDataBuffer
_080099B4: .4byte 0x040000D4
_080099B8: .4byte gGfxSaveGameTiles
_080099BC: .4byte 0x80000800
_080099C0: .4byte gGfxFromSaveOrBeginningOptions
_080099C4: .4byte 0x06013400
_080099C8: .4byte gPalChoiceSelected
_080099CC: .4byte 0x05000320
_080099D0: .4byte 0x80000020
_080099D4: .4byte gMain
_080099D8: .4byte gOamObjects
_080099DC: .4byte 0x000003FF
_080099E0: .4byte gUnknown_03000000
_080099E4: .4byte gIORegisters
_080099E8: .4byte 0x00003E01
_080099EC:
	ldr r4, _08009A48 @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	movs r5, #1
	ldrsb r5, [r4, r5]
	cmp r5, #0
	beq _08009A00
	bl _0800A368
_08009A00:
	movs r4, #1
	mov r0, r8
	strb r4, [r0, #0x18]
	strb r4, [r0, #0x19]
	ldr r1, _08009A4C @ =gScriptContext
	ldr r0, _08009A50 @ =0x0000FFFF
	strh r0, [r1, #0xc]
	mov r0, r8
	adds r0, #0xc1
	ldrb r0, [r0]
	adds r0, #7
	bl sub_8018778
	mov r0, r8
	adds r0, #0x8c
	strh r5, [r0]
	adds r0, #2
	strb r4, [r0]
	adds r0, #1
	movs r2, #0x10
	strb r2, [r0]
	ldr r1, _08009A54 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x48
	movs r0, #0x84
	lsls r0, r0, #4
	strh r0, [r3]
	lsls r2, r2, #8
	adds r1, #0x4c
	strh r2, [r1]
	mov r1, r8
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
	bl _0800A368
	.align 2, 0
_08009A48: .4byte gCourtRecord
_08009A4C: .4byte gScriptContext
_08009A50: .4byte 0x0000FFFF
_08009A54: .4byte gIORegisters
_08009A58:
	ldr r1, _08009A90 @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _08009B0E
	movs r0, #1
	mov r2, r8
	ldrb r2, [r2, #0x1b]
	ands r0, r2
	ldr r1, _08009A94 @ =gJoypad
	cmp r0, #0
	beq _08009A98
	movs r0, #0xc0
	ldrh r3, [r1, #2]
	ands r0, r3
	cmp r0, #0
	beq _08009A98
	movs r0, #0x2a
	bl sub_8011150
	movs r0, #1
	mov r6, r8
	ldrb r6, [r6, #0x17]
	eors r0, r6
	mov r1, r8
	strb r0, [r1, #0x17]
	b _08009B0E
	.align 2, 0
_08009A90: .4byte gScriptContext
_08009A94: .4byte gJoypad
_08009A98:
	ldrh r1, [r1, #2]
	movs r5, #1
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08009AEC
	movs r0, #0x2b
	bl sub_8011150
	movs r2, #0
	mov r3, r8
	strb r2, [r3, #0x18]
	strb r5, [r3, #0x19]
	adds r0, r4, #0
	ldrb r6, [r3, #0x1b]
	ands r0, r6
	cmp r0, #0
	bne _08009AD2
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #5
	mov r1, r8
	strb r0, [r1, #9]
	b _08009B0E
_08009AD2:
	mov r0, r8
	adds r0, #0x8c
	movs r1, #0
	strh r2, [r0]
	adds r0, #2
	strb r5, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #7
	mov r2, r8
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	b _08009B0E
_08009AEC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009B0E
	movs r0, #0x2c
	bl sub_8011150
	movs r0, #2
	movs r1, #0
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	mov r3, r8
	ldrb r0, [r3, #9]
	adds r0, #3
	strb r0, [r3, #9]
_08009B0E:
	movs r0, #1
	mov r6, r8
	ldrb r6, [r6, #0x1b]
	ands r0, r6
	cmp r0, #0
	beq _08009B80
	ldr r2, _08009B54 @ =gUnknown_03002CD0
	movs r7, #0
	ldr r0, _08009B58 @ =0x0000A1A0
	mov sl, r0
	ldr r1, _08009B5C @ =0x0000C038
	mov sb, r1
_08009B26:
	movs r5, #0
	adds r3, r7, #1
	mov ip, r3
	lsls r0, r7, #5
	lsls r1, r7, #6
	ldr r6, _08009B60 @ =0x00004462
	adds r0, r0, r6
	str r0, [sp]
	mov r0, sl
	adds r4, r1, r0
	ldr r6, _08009B64 @ =0x000091A0
	adds r3, r1, r6
	mov r1, sb
_08009B40:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r2]
	strh r1, [r2, #2]
	mov r6, r8
	ldrb r0, [r6, #0x17]
	cmp r0, r7
	bne _08009B68
	strh r3, [r2, #4]
	b _08009B6A
	.align 2, 0
_08009B54: .4byte gUnknown_03002CD0
_08009B58: .4byte 0x0000A1A0
_08009B5C: .4byte 0x0000C038
_08009B60: .4byte 0x00004462
_08009B64: .4byte 0x000091A0
_08009B68:
	strh r4, [r2, #4]
_08009B6A:
	adds r2, #8
	adds r4, #0x20
	adds r3, #0x20
	adds r1, #0x40
	adds r5, #1
	cmp r5, #1
	bls _08009B40
	mov r7, ip
	cmp r7, #1
	bls _08009B26
	b _08009B9C
_08009B80:
	ldr r2, _08009BD8 @ =gUnknown_03002CD0
	movs r5, #0
	ldr r3, _08009BDC @ =0x00004462
	ldr r1, _08009BE0 @ =0x0000C038
	ldr r0, _08009BE4 @ =0x000091E0
_08009B8A:
	strh r3, [r2]
	strh r1, [r2, #2]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #0x40
	adds r0, #0x20
	adds r5, #1
	cmp r5, #1
	bls _08009B8A
_08009B9C:
	mov r0, r8
	ldrb r0, [r0, #9]
	cmp r0, #3
	beq _08009BA6
	b _0800A368
_08009BA6:
	mov r3, r8
	adds r3, #0x8f
	ldrb r0, [r3]
	cmp r0, #0
	bne _08009BB2
	b _0800A368
_08009BB2:
	mov r2, r8
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	mov r1, r8
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08009BCC
	b _0800A358
_08009BCC:
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r3]
	subs r0, #1
	b _0800A356
	.align 2, 0
_08009BD8: .4byte gUnknown_03002CD0
_08009BDC: .4byte 0x00004462
_08009BE0: .4byte 0x0000C038
_08009BE4: .4byte 0x000091E0
_08009BE8:
	mov r0, r8
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _08009BF4
	b _0800A368
_08009BF4:
	bl HideAllSprites
	bl InitBGs
	bl ResetAnimationSystem
	bl ResetSoundControl
	bl LoadCurrentScriptIntoRam
	ldr r6, _08009D20 @ =0x040000D4
	ldr r0, _08009D24 @ =gGfxSaveGameTiles
	str r0, [r6]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r6, #4]
	ldr r1, _08009D28 @ =0x80000800
	mov sl, r1
	str r1, [r6, #8]
	ldr r0, [r6, #8]
	ldr r5, _08009D2C @ =gPalEvidenceProfileDesc
	str r5, [r6]
	ldr r0, _08009D30 @ =0x05000240
	str r0, [r6, #4]
	ldr r2, _08009D34 @ =0x80000010
	mov sb, r2
	str r2, [r6, #8]
	ldr r0, [r6, #8]
	movs r0, #0
	bl sub_80051BC
	adds r7, r0, #0
	str r7, [r6]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r6, #4]
	ldr r7, _08009D38 @ =0x80000100
	str r7, [r6, #8]
	ldr r0, [r6, #8]
	ldr r4, _08009D3C @ =gUnknown_02000034
	str r4, [r6]
	ldr r0, _08009D40 @ =gMain
	str r0, [r6, #4]
	ldr r0, _08009D44 @ =0x8000016A
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	str r5, [r6]
	str r1, [r6, #4]
	mov r3, sb
	str r3, [r6, #8]
	ldr r0, [r6, #8]
	bl LoadCurrentScriptIntoRam
	ldr r0, _08009D48 @ =gPalExamineCursors
	str r0, [r6]
	ldr r0, _08009D4C @ =0x05000300
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	movs r1, #0xcb
	lsls r1, r1, #3
	adds r0, r4, r1
	str r0, [r6]
	ldr r0, _08009D50 @ =gUnknown_03002920
	str r0, [r6, #4]
	ldr r0, _08009D54 @ =0x80000140
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r2, _08009D58 @ =0x000008D8
	adds r0, r4, r2
	str r0, [r6]
	ldr r0, _08009D5C @ =gUnknown_03003B90
	str r0, [r6, #4]
	ldr r0, _08009D60 @ =0x80000014
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r3, _08009D64 @ =0x000028A0
	adds r4, r4, r3
	adds r0, r4, #0
	bl sub_8012948
	mov r0, r8
	ldrb r0, [r0, #8]
	cmp r0, #4
	beq _08009CA2
	b _08009DAA
_08009CA2:
	mov r1, r8
	ldr r0, [r1, #8]
	ldr r1, _08009D68 @ =0x00FFFF00
	ands r0, r1
	movs r1, #0xc1
	lsls r1, r1, #0xb
	cmp r0, r1
	beq _08009CB8
	movs r0, #3
	bl sub_8017154
_08009CB8:
	ldr r0, _08009D6C @ =gGfx4bppInvestigationActions
	str r0, [r6]
	ldr r0, _08009D70 @ =0x06012000
	str r0, [r6, #4]
	mov r2, sl
	str r2, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009D74 @ =gPalActionButtons1
	str r0, [r6]
	ldr r0, _08009D78 @ =0x050002A0
	str r0, [r6, #4]
	ldr r1, _08009D7C @ =0x80000020
	str r1, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009D80 @ =gGfx4bppInvestigationScrollButton
	str r0, [r6]
	ldr r0, _08009D84 @ =0x06013000
	str r0, [r6, #4]
	str r7, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009D88 @ =gPalInvestigationScrollPrompt
	str r0, [r6]
	ldr r0, _08009D8C @ =0x050002E0
	str r0, [r6, #4]
	mov r3, sb
	str r3, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009D90 @ =gGfxExamineCursor
	str r0, [r6]
	ldr r0, _08009D94 @ =0x06013200
	str r0, [r6, #4]
	str r7, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009D98 @ =gPalChoiceSelected
	str r0, [r6]
	ldr r0, _08009D9C @ =0x05000320
	str r0, [r6, #4]
	str r1, [r6, #8]
	ldr r0, [r6, #8]
	mov r6, r8
	ldrb r6, [r6, #0xa]
	cmp r6, #3
	beq _08009D10
	b _08009E32
_08009D10:
	mov r1, r8
	ldrb r0, [r1, #9]
	cmp r0, #7
	bne _08009DA0
	bl sub_800E874
	b _08009E32
	.align 2, 0
_08009D20: .4byte 0x040000D4
_08009D24: .4byte gGfxSaveGameTiles
_08009D28: .4byte 0x80000800
_08009D2C: .4byte gPalEvidenceProfileDesc
_08009D30: .4byte 0x05000240
_08009D34: .4byte 0x80000010
_08009D38: .4byte 0x80000100
_08009D3C: .4byte gUnknown_02000034
_08009D40: .4byte gMain
_08009D44: .4byte 0x8000016A
_08009D48: .4byte gPalExamineCursors
_08009D4C: .4byte 0x05000300
_08009D50: .4byte gUnknown_03002920
_08009D54: .4byte 0x80000140
_08009D58: .4byte 0x000008D8
_08009D5C: .4byte gUnknown_03003B90
_08009D60: .4byte 0x80000014
_08009D64: .4byte 0x000028A0
_08009D68: .4byte 0x00FFFF00
_08009D6C: .4byte gGfx4bppInvestigationActions
_08009D70: .4byte 0x06012000
_08009D74: .4byte gPalActionButtons1
_08009D78: .4byte 0x050002A0
_08009D7C: .4byte 0x80000020
_08009D80: .4byte gGfx4bppInvestigationScrollButton
_08009D84: .4byte 0x06013000
_08009D88: .4byte gPalInvestigationScrollPrompt
_08009D8C: .4byte 0x050002E0
_08009D90: .4byte gGfxExamineCursor
_08009D94: .4byte 0x06013200
_08009D98: .4byte gPalChoiceSelected
_08009D9C: .4byte 0x05000320
_08009DA0:
	cmp r0, #8
	bne _08009E32
	bl sub_800E8F0
	b _08009E32
_08009DAA:
	ldr r0, _08009DDC @ =gUnknown_081CB694
	str r0, [r6]
	ldr r0, _08009DE0 @ =0x050002C0
	str r0, [r6, #4]
	mov r2, sb
	str r2, [r6, #8]
	ldr r0, [r6, #8]
	mov r3, r8
	ldrb r0, [r3, #8]
	cmp r0, #5
	bne _08009DF8
	ldr r0, _08009DE4 @ =gGfx4bppTestimonyTextTiles
	str r0, [r6]
	ldr r0, _08009DE8 @ =0x06013000
	str r0, [r6, #4]
	ldr r0, _08009DEC @ =0x80000400
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009DF0 @ =gPalTestimonyTextTiles
	str r0, [r6]
	ldr r0, _08009DF4 @ =0x050002A0
	str r0, [r6, #4]
	str r2, [r6, #8]
	b _08009E30
	.align 2, 0
_08009DDC: .4byte gUnknown_081CB694
_08009DE0: .4byte 0x050002C0
_08009DE4: .4byte gGfx4bppTestimonyTextTiles
_08009DE8: .4byte 0x06013000
_08009DEC: .4byte 0x80000400
_08009DF0: .4byte gPalTestimonyTextTiles
_08009DF4: .4byte 0x050002A0
_08009DF8:
	cmp r0, #6
	bne _08009E32
	ldr r0, _08009F64 @ =gGfxPressPresentButtons
	str r0, [r6]
	ldr r0, _08009F68 @ =0x06013000
	str r0, [r6, #4]
	ldr r0, _08009F6C @ =0x80000200
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009F70 @ =gPalPressPresentButtons
	str r0, [r6]
	ldr r0, _08009F74 @ =0x050002A0
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009F78 @ =gGfx4bppTestimonyArrows
	str r0, [r6]
	ldr r0, _08009F7C @ =0x06013400
	str r0, [r6, #4]
	ldr r1, _08009F80 @ =0x80000040
	str r1, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _08009F84 @ =gGfx4bppTestimonyArrows+0x180
	str r0, [r6]
	ldr r0, _08009F88 @ =0x06013480
	str r0, [r6, #4]
	str r1, [r6, #8]
_08009E30:
	ldr r0, [r6, #8]
_08009E32:
	ldr r5, _08009F8C @ =0x040000D4
	ldr r6, _08009F90 @ =gUnknown_0200035C
	str r6, [r5]
	ldr r7, _08009F94 @ =gScriptContext
	str r7, [r5, #4]
	ldr r4, _08009F98 @ =0x8000004E
	str r4, [r5, #8]
	ldr r0, [r5, #8]
	adds r0, r7, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_8017AB4
	str r6, [r5]
	str r7, [r5, #4]
	str r4, [r5, #8]
	ldr r0, [r5, #8]
	ldr r1, _08009F9C @ =0x00000A78
	adds r0, r6, r1
	str r0, [r5]
	ldr r0, _08009FA0 @ =gUnknown_03003E50
	str r0, [r5, #4]
	ldr r0, _08009FA4 @ =0x80000180
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	adds r0, r6, #0
	adds r0, #0x9c
	str r0, [r5]
	ldr r0, _08009FA8 @ =gUnknown_030070B0
	str r0, [r5, #4]
	ldr r0, _08009FAC @ =0x80000012
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	bl sub_8018ABC
	adds r0, r6, #0
	subs r0, #0x54
	str r0, [r5]
	ldr r0, _08009FB0 @ =gIORegisters
	str r0, [r5, #4]
	ldr r0, _08009FB4 @ =0x8000002A
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	adds r0, r6, #0
	adds r0, #0xc0
	str r0, [r5]
	ldr r0, _08009FB8 @ =gCourtRecord
	str r0, [r5, #4]
	ldr r0, _08009FBC @ =0x8000002E
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r6, r2
	str r0, [r5]
	ldr r0, _08009FC0 @ =gInvestigation
	str r0, [r5, #4]
	ldr r0, _08009FC4 @ =0x8000000E
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r6, r3
	str r0, [r5]
	ldr r0, _08009FC8 @ =gTestimony
	str r0, [r5, #4]
	ldr r0, _08009FCC @ =0x80000004
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r0, r6, r1
	str r0, [r5]
	ldr r0, _08009FD0 @ =gCourtScroll
	str r0, [r5, #4]
	ldr r0, _08009FD4 @ =0x80000008
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	adds r2, #0x1c
	adds r0, r6, r2
	str r0, [r5]
	ldr r0, _08009FD8 @ =gUnknown_03003C70
	str r0, [r5, #4]
	ldr r0, _08009FDC @ =0x800000F0
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	mov r0, r8
	bl sub_8018C7C
	mov r0, r8
	adds r0, #0xc1
	ldrb r0, [r0]
	bl sub_8007610
	ldr r0, _08009FE0 @ =gMain
	adds r2, r0, #0
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08009F04
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_08009F04:
	movs r3, #0xbb
	lsls r3, r3, #3
	adds r0, r6, r3
	str r0, [r5]
	ldr r0, _08009FE4 @ =gUnknown_03003AF0
	str r0, [r5, #4]
	ldr r0, _08009FE8 @ =0x80000050
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	bl sub_8019F8C
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	movs r1, #0x80
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_8006130
	ldr r1, _08009FEC @ =0x00001578
	adds r0, r6, r1
	str r0, [r5]
	ldr r0, _08009FF0 @ =gUnknown_03002080
	str r0, [r5, #4]
	ldr r1, _08009FF4 @ =0x80000400
	str r1, [r5, #8]
	ldr r0, [r5, #8]
	ldr r2, _08009FF8 @ =0x00000D78
	adds r0, r6, r2
	str r0, [r5]
	ldr r0, _08009FFC @ =gUnknown_03002FA0
	str r0, [r5, #4]
	str r1, [r5, #8]
	ldr r0, [r5, #8]
	ldr r3, _0800A000 @ =gUnknown_03000844
	ldrb r0, [r3, #0xe]
	subs r0, #0x24
	cmp r0, #4
	bhi _0800A042
	lsls r0, r0, #2
	ldr r1, _0800A004 @ =_0800A008
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009F64: .4byte gGfxPressPresentButtons
_08009F68: .4byte 0x06013000
_08009F6C: .4byte 0x80000200
_08009F70: .4byte gPalPressPresentButtons
_08009F74: .4byte 0x050002A0
_08009F78: .4byte gGfx4bppTestimonyArrows
_08009F7C: .4byte 0x06013400
_08009F80: .4byte 0x80000040
_08009F84: .4byte gGfx4bppTestimonyArrows+0x180
_08009F88: .4byte 0x06013480
_08009F8C: .4byte 0x040000D4
_08009F90: .4byte gUnknown_0200035C
_08009F94: .4byte gScriptContext
_08009F98: .4byte 0x8000004E
_08009F9C: .4byte 0x00000A78
_08009FA0: .4byte gUnknown_03003E50
_08009FA4: .4byte 0x80000180
_08009FA8: .4byte gUnknown_030070B0
_08009FAC: .4byte 0x80000012
_08009FB0: .4byte gIORegisters
_08009FB4: .4byte 0x8000002A
_08009FB8: .4byte gCourtRecord
_08009FBC: .4byte 0x8000002E
_08009FC0: .4byte gInvestigation
_08009FC4: .4byte 0x8000000E
_08009FC8: .4byte gTestimony
_08009FCC: .4byte 0x80000004
_08009FD0: .4byte gCourtScroll
_08009FD4: .4byte 0x80000008
_08009FD8: .4byte gUnknown_03003C70
_08009FDC: .4byte 0x800000F0
_08009FE0: .4byte gMain
_08009FE4: .4byte gUnknown_03003AF0
_08009FE8: .4byte 0x80000050
_08009FEC: .4byte 0x00001578
_08009FF0: .4byte gUnknown_03002080
_08009FF4: .4byte 0x80000400
_08009FF8: .4byte 0x00000D78
_08009FFC: .4byte gUnknown_03002FA0
_0800A000: .4byte gUnknown_03000844
_0800A004: .4byte _0800A008
_0800A008: @ jump table
	.4byte _0800A01C @ case 0
	.4byte _0800A034 @ case 1
	.4byte _0800A03C @ case 2
	.4byte _0800A024 @ case 3
	.4byte _0800A02C @ case 4
_0800A01C:
	movs r0, #0
	bl nullsub_11
	b _0800A042
_0800A024:
	movs r0, #1
	bl nullsub_11
	b _0800A042
_0800A02C:
	movs r0, #2
	bl nullsub_11
	b _0800A042
_0800A034:
	movs r0, #3
	bl nullsub_11
	b _0800A042
_0800A03C:
	movs r0, #4
	bl nullsub_11
_0800A042:
	ldr r4, _0800A148 @ =gMain
	movs r6, #0x4a
	adds r6, r6, r4
	mov sb, r6
	movs r0, #0
	ldrsh r7, [r6, r0]
	mov r1, r8
	ldrh r0, [r1, #0x34]
	bl sub_8003D5C
	mov r2, r8
	ldrh r0, [r2, #0x34]
	bl sub_8004FAC
	ldr r0, _0800A14C @ =gScriptContext
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r2]
	cmp r1, #0x80
	beq _0800A0B0
	adds r0, #0x42
	ldrb r0, [r0]
	adds r0, #1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r5, r4, r3
	strb r0, [r5]
	ldrh r0, [r4, #0x34]
	movs r6, #0
	strh r0, [r4, #0x38]
	strh r1, [r4, #0x34]
	ldrh r0, [r2]
	bl sub_8003D5C
	ldrb r0, [r5]
	cmp r0, #5
	bne _0800A092
	ldrh r0, [r4, #0x34]
	bl sub_800482C
_0800A092:
	strb r6, [r5]
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x34]
	adds r1, r7, #0
	bl sub_8004940
	ldr r0, _0800A150 @ =gSaveDataBuffer
	adds r0, #0x7e
	ldrh r0, [r0]
	mov r1, sb
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3c
	strb r6, [r0]
_0800A0B0:
	ldr r2, _0800A14C @ =gScriptContext
	movs r0, #4
	ldrh r3, [r2, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _0800A0CC
	ldr r1, _0800A154 @ =0x040000D4
	ldr r0, _0800A158 @ =gUnknown_081A6794
	str r0, [r1]
	ldr r0, _0800A15C @ =0x06011F80
	str r0, [r1, #4]
	ldr r0, _0800A160 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0800A0CC:
	movs r0, #0x80
	lsls r0, r0, #3
	ldrh r2, [r2, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800A0E8
	ldr r1, _0800A154 @ =0x040000D4
	ldr r0, _0800A164 @ =gGfxExamineCursor
	str r0, [r1]
	ldr r0, _0800A15C @ =0x06011F80
	str r0, [r1, #4]
	ldr r0, _0800A160 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0800A0E8:
	ldr r1, _0800A154 @ =0x040000D4
	ldr r0, _0800A168 @ =gUnknown_020009D4
	str r0, [r1]
	ldr r0, _0800A16C @ =gOamObjects
	str r0, [r1, #4]
	ldr r0, _0800A170 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800A174 @ =gJoypad
	movs r0, #0
	strh r0, [r1, #6]
	strh r0, [r1, #4]
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r0, #0x30
	movs r1, #0xf
	bl SetTimedKeysAndDelay
	mov r0, r8
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #3
	bls _0800A11C
	mov r0, r8
	bl sub_8010DD8
_0800A11C:
	mov r6, r8
	ldrh r1, [r6, #0x28]
	movs r0, #0x14
	bl sub_80113E8
	ldr r0, _0800A148 @ =gMain
	ldr r1, _0800A178 @ =0x000002C6
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800A1B0
	lsrs r0, r1, #4
	cmp r0, #1
	beq _0800A192
	cmp r0, #1
	bgt _0800A17C
	cmp r0, #0
	beq _0800A182
	b _0800A1B0
	.align 2, 0
_0800A148: .4byte gMain
_0800A14C: .4byte gScriptContext
_0800A150: .4byte gSaveDataBuffer
_0800A154: .4byte 0x040000D4
_0800A158: .4byte gUnknown_081A6794
_0800A15C: .4byte 0x06011F80
_0800A160: .4byte 0x80000040
_0800A164: .4byte gGfxExamineCursor
_0800A168: .4byte gUnknown_020009D4
_0800A16C: .4byte gOamObjects
_0800A170: .4byte 0x80000200
_0800A174: .4byte gJoypad
_0800A178: .4byte 0x000002C6
_0800A17C:
	cmp r0, #2
	beq _0800A1A2
	b _0800A1B0
_0800A182:
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _0800A1B0
_0800A192:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _0800A1B0
_0800A1A2:
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
_0800A1B0:
	ldr r0, _0800A1C8 @ =gMain
	ldr r2, _0800A1CC @ =0x000002C2
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800A1C0
	bl sub_8011150
_0800A1C0:
	movs r0, #1
	movs r1, #1
	b _0800A27A
	.align 2, 0
_0800A1C8: .4byte gMain
_0800A1CC: .4byte 0x000002C2

	thumb_func_start sub_0800A1D0
sub_0800A1D0: @ 0x0800A1D0
	mov r0, r8
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800A1DC
	b _0800A368
_0800A1DC:
	mov r0, r8
	bl ClearSectionReadFlags
	ldr r2, _0800A210 @ =gMain
	ldr r0, _0800A214 @ =gSaveDataBuffer
	adds r0, #0xea
	ldrh r1, [r0]
	adds r0, r2, #0
	adds r0, #0xb6
	strh r1, [r0]
	subs r0, #0xe
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	bl sub_800A38C
	ldr r0, _0800A218 @ =gUnknown_080266D0
	mov r1, r8
	adds r1, #0xc1
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r3, r8
	str r0, [r3, #8]
	b _0800A368
	.align 2, 0
_0800A210: .4byte gMain
_0800A214: .4byte gSaveDataBuffer
_0800A218: .4byte gUnknown_080266D0

	thumb_func_start sub_0800A21C
sub_0800A21C: @ 0x0800A21C
	mov r0, r8
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800A228
	b _0800A368
_0800A228:
	movs r0, #1
	mov r6, r8
	str r0, [r6, #8]
	b _0800A368

	thumb_func_start sub_0800A230
sub_0800A230: @ 0x0800A230
	mov r1, r8
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bls _0800A288
	ldrb r0, [r1, #0x17]
	adds r1, r0, #0
	cmp r1, #0
	bne _0800A250
	movs r0, #4
	mov r2, r8
	strb r0, [r2, #9]
	b _0800A256
_0800A250:
	movs r0, #5
	mov r3, r8
	strb r0, [r3, #9]
_0800A256:
	movs r0, #0
	mov r6, r8
	strb r0, [r6, #0xa]
	ldr r2, _0800A284 @ =gUnknown_03002CD0
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _0800A266
	adds r2, #0x10
_0800A266:
	movs r7, #0
	movs r0, #0x80
	lsls r0, r0, #2
_0800A26C:
	strh r0, [r2]
	adds r2, #8
	adds r7, #1
	cmp r7, #1
	bls _0800A26C
	movs r0, #2
	movs r1, #0
_0800A27A:
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	b _0800A368
	.align 2, 0
_0800A284: .4byte gUnknown_03002CD0
_0800A288:
	movs r0, #1
	mov r1, r8
	ldrb r1, [r1, #0x1b]
	ands r0, r1
	cmp r0, #0
	beq _0800A308
	ldr r2, _0800A2D0 @ =gUnknown_03002CD0
	movs r7, #0
_0800A298:
	movs r5, #0
	adds r3, r7, #1
	mov ip, r3
	lsls r0, r7, #5
	lsls r1, r7, #6
	ldr r6, _0800A2D4 @ =0x00004062
	adds r6, r6, r0
	mov sl, r6
	ldr r3, _0800A2D8 @ =0x00004462
	adds r3, r3, r0
	mov sb, r3
	movs r4, #0
	ldr r6, _0800A2DC @ =0x000091A0
	adds r3, r1, r6
	ldr r0, _0800A2E0 @ =0x0000A1A0
	adds r1, r1, r0
	str r1, [sp]
	ldr r1, _0800A2E4 @ =0x0000C038
_0800A2BC:
	strh r1, [r2, #2]
	mov r6, r8
	ldrb r0, [r6, #0x17]
	cmp r0, r7
	bne _0800A2E8
	mov r0, sl
	strh r0, [r2]
	strh r3, [r2, #4]
	b _0800A2F2
	.align 2, 0
_0800A2D0: .4byte gUnknown_03002CD0
_0800A2D4: .4byte 0x00004062
_0800A2D8: .4byte 0x00004462
_0800A2DC: .4byte 0x000091A0
_0800A2E0: .4byte 0x0000A1A0
_0800A2E4: .4byte 0x0000C038
_0800A2E8:
	mov r6, sb
	strh r6, [r2]
	ldr r6, [sp]
	adds r0, r4, r6
	strh r0, [r2, #4]
_0800A2F2:
	adds r2, #8
	adds r4, #0x20
	adds r3, #0x20
	adds r1, #0x40
	adds r5, #1
	cmp r5, #1
	bls _0800A2BC
	mov r7, ip
	cmp r7, #1
	bls _0800A298
	b _0800A324
_0800A308:
	ldr r2, _0800A378 @ =gUnknown_03002CD0
	movs r5, #0
	ldr r3, _0800A37C @ =0x00004062
	ldr r1, _0800A380 @ =0x0000C038
	ldr r0, _0800A384 @ =0x000091E0
_0800A312:
	strh r3, [r2]
	strh r1, [r2, #2]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #0x40
	adds r0, #0x20
	adds r5, #1
	cmp r5, #1
	bls _0800A312
_0800A324:
	mov r0, r8
	ldrb r0, [r0, #9]
	cmp r0, #7
	bne _0800A368
	mov r3, r8
	adds r3, #0x8f
	ldrb r1, [r3]
	cmp r1, #0xf
	bhi _0800A368
	mov r2, r8
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	mov r1, r8
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	blo _0800A358
	movs r0, #0
	strh r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
_0800A356:
	strb r0, [r3]
_0800A358:
	ldr r2, _0800A388 @ =gIORegisters
	ldrb r3, [r3]
	lsls r1, r3, #8
	movs r0, #0x10
	subs r0, r0, r3
	orrs r1, r0
	adds r2, #0x4c
	strh r1, [r2]
_0800A368:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A378: .4byte gUnknown_03002CD0
_0800A37C: .4byte 0x00004062
_0800A380: .4byte 0x0000C038
_0800A384: .4byte 0x000091E0
_0800A388: .4byte gIORegisters

	thumb_func_start sub_800A38C
sub_800A38C: @ 0x0800A38C
	push {lr}
	ldr r0, _0800A39C @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	bl sub_8007610
	pop {r0}
	bx r0
	.align 2, 0
_0800A39C: .4byte gMain

	thumb_func_start sub_800A3A0
sub_800A3A0: @ 0x0800A3A0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _0800A40C @ =gMain
	bl sub_80112C8
	ldr r0, _0800A410 @ =0x040000D4
	ldr r1, _0800A414 @ =gOamObjects
	str r1, [r0]
	ldr r3, _0800A418 @ =gUnknown_020009D4
	str r3, [r0, #4]
	ldr r1, _0800A41C @ =0x80000200
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [r0]
	ldr r2, _0800A420 @ =0xFFFFF660
	adds r1, r3, r2
	str r1, [r0, #4]
	ldr r1, _0800A424 @ =0x8000016A
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0800A428 @ =gScriptContext
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r1, [r1]
	cmp r1, #2
	bne _0800A3E4
	adds r0, #0x2b
	ldrb r2, [r0]
	cmp r2, #1
	bne _0800A3E4
	ldr r1, _0800A42C @ =0xFFFFF679
	adds r0, r3, r1
	strb r2, [r0]
_0800A3E4:
	movs r0, #0x31
	bl sub_8011150
	adds r2, r4, #0
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800A430 @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r4, #0xc]
	lsls r0, r5, #0x18
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A40C: .4byte gMain
_0800A410: .4byte 0x040000D4
_0800A414: .4byte gOamObjects
_0800A418: .4byte gUnknown_020009D4
_0800A41C: .4byte 0x80000200
_0800A420: .4byte 0xFFFFF660
_0800A424: .4byte 0x8000016A
_0800A428: .4byte gScriptContext
_0800A42C: .4byte 0xFFFFF679
_0800A430: .4byte gUnknown_030037B8

	thumb_func_start sub_800A434
sub_800A434: @ 0x0800A434
	push {lr}
	ldr r2, _0800A448 @ =gUnknown_0814DB88
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800A448: .4byte gUnknown_0814DB88

	thumb_func_start sub_800A44C
sub_800A44C: @ 0x0800A44C
	push {lr}
	ldr r1, _0800A48C @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #6
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	cmp r0, #0
	bne _0800A498
	ldr r1, _0800A490 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800A498
	ldr r1, _0800A494 @ =gMain
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800A480
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800A498
_0800A480:
	movs r0, #0
	bl sub_800A3A0
	movs r0, #1
	b _0800A49A
	.align 2, 0
_0800A48C: .4byte gScriptContext
_0800A490: .4byte gJoypad
_0800A494: .4byte gMain
_0800A498:
	movs r0, #0
_0800A49A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800A4A0
sub_800A4A0: @ 0x0800A4A0
	push {lr}
	ldr r1, _0800A4DC @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800A4D8
	ldr r0, _0800A4E0 @ =gMain
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800A4D8
	ldr r1, _0800A4E4 @ =gScriptContext
	movs r0, #8
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0800A4F0
	ldr r0, _0800A4E8 @ =gTestimony
	ldr r0, [r0]
	ldr r1, _0800A4EC @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	beq _0800A4F0
_0800A4D8:
	movs r0, #0
	b _0800A512
	.align 2, 0
_0800A4DC: .4byte gJoypad
_0800A4E0: .4byte gMain
_0800A4E4: .4byte gScriptContext
_0800A4E8: .4byte gTestimony
_0800A4EC: .4byte 0x00FF00FF
_0800A4F0:
	movs r0, #4
	ldrh r2, [r2, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800A4FE
	bl sub_8016D6C
_0800A4FE:
	movs r0, #0x31
	bl sub_8011150
	ldr r1, _0800A518 @ =gUnknown_030037BC
	subs r2, r1, #4
	ldr r0, [r2]
	str r0, [r1]
	movs r0, #7
	str r0, [r2]
	movs r0, #1
_0800A512:
	pop {r1}
	bx r1
	.align 2, 0
_0800A518: .4byte gUnknown_030037BC

	thumb_func_start sub_800A51C
sub_800A51C: @ 0x0800A51C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0800A674 @ =gIORegisters
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _0800A678 @ =0x040000D4
	str r0, [r4]
	ldr r0, _0800A67C @ =gTestimony
	str r0, [r4, #4]
	ldr r0, _0800A680 @ =0x81000004
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, sp
	strh r5, [r0]
	str r0, [r4]
	ldr r0, _0800A684 @ =gInvestigation
	str r0, [r4, #4]
	ldr r0, _0800A688 @ =0x8100000E
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl HideAllSprites
	bl InitBGs
	bl ResetAnimationSystem
	bl LoadCurrentScriptIntoRam
	movs r0, #0x4a
	adds r0, r0, r6
	mov r8, r0
	movs r5, #0
	movs r0, #0xfa
	lsls r0, r0, #5
	mov r1, r8
	strh r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r6]
	ldr r0, _0800A68C @ =0x00003D01
	strh r0, [r6, #2]
	adds r0, #0xff
	strh r0, [r6, #4]
	ldr r0, _0800A690 @ =0x00003FC7
	strh r0, [r6, #6]
	ldr r0, _0800A694 @ =gGfxSaveGameTiles
	str r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _0800A698 @ =0x80000800
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800A69C @ =gPalExamineCursors
	str r0, [r4]
	ldr r0, _0800A6A0 @ =0x05000300
	str r0, [r4, #4]
	ldr r1, _0800A6A4 @ =0x80000010
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800A6A8 @ =gPalEvidenceProfileDesc
	str r0, [r4]
	ldr r0, _0800A6AC @ =0x05000240
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #1
	bl sub_8003D5C
	movs r0, #1
	bl sub_80049A0
	movs r0, #0x81
	bl sub_80049A0
	ldr r0, _0800A6B0 @ =0x0000FFAF
	strh r0, [r6, #0xe]
	ldr r0, _0800A6B4 @ =0x0000FDFF
	mov r2, r8
	ldrh r2, [r2]
	ands r0, r2
	mov r3, r8
	strh r0, [r3]
	ldr r1, _0800A6B8 @ =gCourtRecord
	adds r0, r7, #0
	bl sub_800E9C4
	bl ResetHPBar
	str r5, [sp, #4]
	add r1, sp, #4
	str r1, [r4]
	adds r0, r7, #0
	adds r0, #0xc8
	str r0, [r4, #4]
	ldr r2, _0800A6BC @ =0x85000008
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	adds r0, #0xe8
	str r5, [r0]
	str r5, [sp, #4]
	str r1, [r4]
	movs r3, #0x86
	lsls r3, r3, #1
	adds r0, r7, r3
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	str r5, [sp, #4]
	str r1, [r4]
	movs r2, #0x99
	lsls r2, r2, #2
	adds r0, r7, r2
	str r0, [r4, #4]
	ldr r0, _0800A6C0 @ =0x85000006
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	str r5, [sp, #4]
	str r1, [r4]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r7, r3
	str r0, [r4, #4]
	ldr r0, _0800A6C4 @ =0x85000004
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0xa4
	lsls r1, r1, #2
	adds r0, r7, r1
	strh r5, [r0]
	movs r0, #0xf
	strb r0, [r7, #0x1a]
	movs r0, #1
	strb r0, [r7, #0x18]
	strb r0, [r7, #0x19]
	bl sub_800A38C
	ldr r1, _0800A6C8 @ =gScriptContext
	strh r5, [r1, #0x10]
	ldr r0, _0800A6CC @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #0x80
	bl sub_8018778
	movs r0, #0x30
	movs r1, #0xf
	bl SetTimedKeysAndDelay
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r6, #0x4e
	movs r0, #0x10
	strh r0, [r6]
	ldr r1, _0800A6D0 @ =gUnknown_030037B8
	adds r0, #0xf3
	str r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A674: .4byte gIORegisters
_0800A678: .4byte 0x040000D4
_0800A67C: .4byte gTestimony
_0800A680: .4byte 0x81000004
_0800A684: .4byte gInvestigation
_0800A688: .4byte 0x8100000E
_0800A68C: .4byte 0x00003D01
_0800A690: .4byte 0x00003FC7
_0800A694: .4byte gGfxSaveGameTiles
_0800A698: .4byte 0x80000800
_0800A69C: .4byte gPalExamineCursors
_0800A6A0: .4byte 0x05000300
_0800A6A4: .4byte 0x80000010
_0800A6A8: .4byte gPalEvidenceProfileDesc
_0800A6AC: .4byte 0x05000240
_0800A6B0: .4byte 0x0000FFAF
_0800A6B4: .4byte 0x0000FDFF
_0800A6B8: .4byte gCourtRecord
_0800A6BC: .4byte 0x85000008
_0800A6C0: .4byte 0x85000006
_0800A6C4: .4byte 0x85000004
_0800A6C8: .4byte gScriptContext
_0800A6CC: .4byte 0x0000FFFF
_0800A6D0: .4byte gUnknown_030037B8

	thumb_func_start sub_800A6D4
sub_800A6D4: @ 0x0800A6D4
	push {r4, lr}
	adds r4, r0, #0
	bl ClearSectionReadFlags
	adds r0, r4, #0
	bl sub_8007238
	ldr r1, _0800A718 @ =0x040000D4
	ldr r0, _0800A71C @ =gMain
	str r0, [r1]
	ldr r0, _0800A720 @ =gUnknown_02000034
	str r0, [r1, #4]
	ldr r0, _0800A724 @ =0x8000016A
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800A728 @ =0x0100000A
	str r0, [r4, #8]
	bl sub_80053C8
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800A730
	bl ResetHPBarHealthToMax
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #1
	bne _0800A774
	ldr r0, _0800A72C @ =0x0100000B
	b _0800A772
	.align 2, 0
_0800A718: .4byte 0x040000D4
_0800A71C: .4byte gMain
_0800A720: .4byte gUnknown_02000034
_0800A724: .4byte 0x8000016A
_0800A728: .4byte 0x0100000A
_0800A72C: .4byte 0x0100000B
_0800A730:
	cmp r0, #7
	bne _0800A748
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #2
	bne _0800A774
	ldr r0, _0800A744 @ =gUnknown_0200000B
	b _0800A772
	.align 2, 0
_0800A744: .4byte gUnknown_0200000B
_0800A748:
	cmp r0, #0xc
	bne _0800A760
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #3
	bne _0800A774
	ldr r0, _0800A75C @ =gUnknown_0300000B
	b _0800A772
	.align 2, 0
_0800A75C: .4byte gUnknown_0300000B
_0800A760:
	cmp r0, #0xe
	bne _0800A774
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #4
	bne _0800A774
	ldr r0, _0800A77C @ =0x0400000B
_0800A772:
	str r0, [r4, #8]
_0800A774:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A77C: .4byte 0x0400000B

	thumb_func_start sub_800A780
sub_800A780: @ 0x0800A780
	push {lr}
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800A7A2
	ldr r1, _0800A7A8 @ =gScriptContext
	movs r0, #1
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800A7A2
	bl sub_800A44C
	cmp r0, #0
	bne _0800A7A2
	bl sub_800A4A0
_0800A7A2:
	pop {r0}
	bx r0
	.align 2, 0
_0800A7A8: .4byte gScriptContext

	thumb_func_start sub_800A7AC
sub_800A7AC: @ 0x0800A7AC
	push {r4, lr}
	ldr r4, _0800A7F0 @ =gUnknown_03002D48
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	bl sub_8016ED8
	cmp r0, #0
	beq _0800A7CE
	adds r4, #0x78
_0800A7CE:
	movs r1, #0x80
	lsls r1, r1, #7
	strh r1, [r4]
	ldr r0, _0800A7F4 @ =0x000080BA
	strh r0, [r4, #2]
	ldr r0, _0800A7F8 @ =0x00005D90
	strh r0, [r4, #4]
	adds r4, #8
	strh r1, [r4]
	ldr r0, _0800A7FC @ =0x000080DA
	strh r0, [r4, #2]
	ldr r0, _0800A800 @ =0x00005D98
	strh r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A7F0: .4byte gUnknown_03002D48
_0800A7F4: .4byte 0x000080BA
_0800A7F8: .4byte 0x00005D90
_0800A7FC: .4byte 0x000080DA
_0800A800: .4byte 0x00005D98

	thumb_func_start sub_800A804
sub_800A804: @ 0x0800A804
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #4
	bls _0800A810
	b _0800A944
_0800A810:
	lsls r0, r0, #2
	ldr r1, _0800A81C @ =_0800A820
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A81C: .4byte _0800A820
_0800A820: @ jump table
	.4byte _0800A834 @ case 0
	.4byte _0800A854 @ case 1
	.4byte _0800A8A8 @ case 2
	.4byte _0800A8B4 @ case 3
	.4byte _0800A8E4 @ case 4
_0800A834:
	movs r0, #0x54
	bl sub_8012824
	movs r0, #0x55
	bl sub_8012824
	movs r0, #0x53
	bl sub_8011150
	ldr r0, _0800A850 @ =gTestimony
	movs r1, #0
	strb r1, [r0, #4]
	b _0800A8DC
	.align 2, 0
_0800A850: .4byte gTestimony
_0800A854:
	movs r0, #0x54
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x55
	bl sub_8011D68
	adds r5, r0, #0
	ldrh r0, [r4, #0x10]
	adds r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x10]
	subs r0, #0xa
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x77
	ble _0800A944
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #0x52
	bl sub_8012824
	b _0800A8DC
_0800A8A8:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800A944
	b _0800A8DC
_0800A8B4:
	movs r0, #0x52
	bl sub_8011D68
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _0800A944
	adds r0, r4, #0
	bl sub_8012F7C
	movs r0, #0x54
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	movs r0, #0x55
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
_0800A8DC:
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	b _0800A944
_0800A8E4:
	movs r0, #0x54
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x55
	bl sub_8011D68
	adds r5, r0, #0
	ldr r2, _0800A94C @ =gTestimony
	ldrh r3, [r4, #0x10]
	ldrb r7, [r2, #4]
	adds r0, r3, r7
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r3, [r5, #0x10]
	ldrb r7, [r2, #4]
	subs r0, r3, r7
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	ldrb r0, [r2, #4]
	adds r0, #1
	strb r0, [r2, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	bls _0800A928
	movs r0, #0xc
	strb r0, [r2, #4]
_0800A928:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800A944
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #1
	strb r0, [r6, #9]
_0800A944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A94C: .4byte gTestimony

	thumb_func_start sub_800A950
sub_800A950: @ 0x0800A950
	push {lr}
	ldr r2, _0800A964 @ =gUnknown_0814DB94
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800A964: .4byte gUnknown_0814DB94

	thumb_func_start sub_800A968
sub_800A968: @ 0x0800A968
	ldr r2, _0800A994 @ =0x040000D4
	ldr r1, _0800A998 @ =gGfx4bppTestimonyTextTiles
	str r1, [r2]
	ldr r1, _0800A99C @ =0x06013000
	str r1, [r2, #4]
	ldr r1, _0800A9A0 @ =0x80000400
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _0800A9A4 @ =gPalTestimonyTextTiles
	str r1, [r2]
	ldr r1, _0800A9A8 @ =0x050002A0
	str r1, [r2, #4]
	ldr r1, _0800A9AC @ =0x80000010
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r2, _0800A9B0 @ =gTestimony
	movs r1, #0
	strb r1, [r2, #1]
	movs r1, #3
	strb r1, [r0, #9]
	bx lr
	.align 2, 0
_0800A994: .4byte 0x040000D4
_0800A998: .4byte gGfx4bppTestimonyTextTiles
_0800A99C: .4byte 0x06013000
_0800A9A0: .4byte 0x80000400
_0800A9A4: .4byte gPalTestimonyTextTiles
_0800A9A8: .4byte 0x050002A0
_0800A9AC: .4byte 0x80000010
_0800A9B0: .4byte gTestimony

	thumb_func_start sub_800A9B4
sub_800A9B4: @ 0x0800A9B4
	push {lr}
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800AA1A
	ldr r1, _0800AA08 @ =gScriptContext
	movs r0, #1
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800A9D6
	bl sub_800A44C
	cmp r0, #1
	beq _0800A9D6
	bl sub_800A4A0
_0800A9D6:
	ldr r1, _0800AA0C @ =gTestimony
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bls _0800A9EA
	movs r0, #0
	strb r0, [r1, #1]
_0800A9EA:
	ldr r2, _0800AA10 @ =gUnknown_03002D68
	ldrb r1, [r1, #1]
	cmp r1, #0x50
	bhi _0800AA14
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #8
	strh r0, [r2, #2]
	movs r0, #0xb3
	lsls r0, r0, #7
	strh r0, [r2, #4]
	b _0800AA1A
	.align 2, 0
_0800AA08: .4byte gScriptContext
_0800AA0C: .4byte gTestimony
_0800AA10: .4byte gUnknown_03002D68
_0800AA14:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
_0800AA1A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800AA20
sub_800AA20: @ 0x0800AA20
	ldr r2, _0800AA30 @ =gUnknown_03002D68
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r2]
	subs r1, #0xfd
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0800AA30: .4byte gUnknown_03002D68

	thumb_func_start sub_800AA34
sub_800AA34: @ 0x0800AA34
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x56
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x57
	bl sub_8011D68
	adds r5, r0, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #4
	bls _0800AA50
	b _0800AB5E
_0800AA50:
	lsls r0, r0, #2
	ldr r1, _0800AA5C @ =_0800AA60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800AA5C: .4byte _0800AA60
_0800AA60: @ jump table
	.4byte _0800AA74 @ case 0
	.4byte _0800AA8C @ case 1
	.4byte _0800AAD4 @ case 2
	.4byte _0800AAE4 @ case 3
	.4byte _0800AB12 @ case 4
_0800AA74:
	movs r0, #0x56
	bl sub_8012824
	movs r0, #0x57
	bl sub_8012824
	movs r0, #0x53
	bl sub_8011150
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AA8C:
	ldrh r0, [r4, #0x10]
	adds r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x10]
	subs r0, #0xa
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x77
	ble _0800AB5E
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #0x53
	bl sub_8012824
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AAD4:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800AB5E
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AAE4:
	movs r0, #0x53
	bl sub_8011D68
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _0800AB5E
	adds r0, r4, #0
	bl sub_8012F7C
	movs r0, #0x56
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	movs r0, #0x57
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800AB5C
_0800AB12:
	movs r0, #0x56
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x57
	bl sub_8011D68
	adds r5, r0, #0
	ldrh r0, [r4, #0x12]
	subs r0, #7
	strh r0, [r4, #0x12]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x12]
	adds r0, #7
	strh r0, [r5, #0x12]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0x3c
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0800AB5E
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
	movs r0, #1
	strb r0, [r6, #9]
	movs r0, #0
_0800AB5C:
	strb r0, [r6, #0xa]
_0800AB5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800AB64
sub_800AB64: @ 0x0800AB64
	push {lr}
	ldr r2, _0800AB78 @ =gUnknown_0814DBA4
	ldrb r3, [r0, #9]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0800AB78: .4byte gUnknown_0814DBA4

	thumb_func_start sub_800AB7C
sub_800AB7C: @ 0x0800AB7C
	push {lr}
	ldr r1, _0800ABE4 @ =0x040000D4
	ldr r2, _0800ABE8 @ =gGfxPressPresentButtons
	str r2, [r1]
	ldr r2, _0800ABEC @ =0x06013000
	str r2, [r1, #4]
	ldr r2, _0800ABF0 @ =0x80000200
	str r2, [r1, #8]
	ldr r2, [r1, #8]
	ldr r2, _0800ABF4 @ =gPalPressPresentButtons
	str r2, [r1]
	ldr r2, _0800ABF8 @ =0x050002A0
	str r2, [r1, #4]
	ldr r2, _0800ABFC @ =0x80000010
	str r2, [r1, #8]
	ldr r2, [r1, #8]
	ldr r2, _0800AC00 @ =gGfx4bppTestimonyArrows
	str r2, [r1]
	movs r2, #0xd0
	lsls r2, r2, #1
	str r2, [r1, #4]
	ldr r3, _0800AC04 @ =0x80000040
	str r3, [r1, #8]
	ldr r2, [r1, #8]
	ldr r2, _0800AC08 @ =gGfx4bppTestimonyArrows+0x180
	str r2, [r1]
	movs r2, #0x88
	lsls r2, r2, #2
	str r2, [r1, #4]
	str r3, [r1, #8]
	ldr r1, [r1, #8]
	ldr r1, _0800AC0C @ =gScriptContext
	ldrh r1, [r1, #0xc]
	movs r3, #0
	strh r1, [r0, #0x1c]
	ldr r1, _0800AC10 @ =gCourtRecord
	strb r3, [r1, #9]
	ldrb r2, [r1, #8]
	adds r2, #1
	strb r2, [r1, #8]
	ldr r1, _0800AC14 @ =gTestimony
	movs r2, #0xe0
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	strb r3, [r1]
	movs r1, #3
	strb r1, [r0, #9]
	bl ResetHPBar
	pop {r0}
	bx r0
	.align 2, 0
_0800ABE4: .4byte 0x040000D4
_0800ABE8: .4byte gGfxPressPresentButtons
_0800ABEC: .4byte 0x06013000
_0800ABF0: .4byte 0x80000200
_0800ABF4: .4byte gPalPressPresentButtons
_0800ABF8: .4byte 0x050002A0
_0800ABFC: .4byte 0x80000010
_0800AC00: .4byte gGfx4bppTestimonyArrows
_0800AC04: .4byte 0x80000040
_0800AC08: .4byte gGfx4bppTestimonyArrows+0x180
_0800AC0C: .4byte gScriptContext
_0800AC10: .4byte gCourtRecord
_0800AC14: .4byte gTestimony

	thumb_func_start sub_800AC18
sub_800AC18: @ 0x0800AC18
	push {r4, lr}
	ldr r4, _0800AC48 @ =gMain
	ldr r1, _0800AC4C @ =gTestimony
	adds r0, r4, #0
	movs r2, #1
	bl sub_800B6EC
	ldr r0, _0800AC50 @ =gCourtRecord
	bl sub_8010420
	ldr r2, _0800AC54 @ =gOamObjects
	ldr r1, _0800AC58 @ =gScriptContext
	movs r0, #8
	ldrh r3, [r1, #0x1c]
	ands r0, r3
	cmp r0, #0
	beq _0800ACA4
	ldrh r0, [r1, #0xc]
	subs r0, #1
	ldrh r4, [r4, #0x1c]
	cmp r0, r4
	beq _0800AC5C
	movs r0, #0x80
	b _0800AC60
	.align 2, 0
_0800AC48: .4byte gMain
_0800AC4C: .4byte gTestimony
_0800AC50: .4byte gCourtRecord
_0800AC54: .4byte gOamObjects
_0800AC58: .4byte gScriptContext
_0800AC5C:
	movs r0, #0x80
	lsls r0, r0, #2
_0800AC60:
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r2, #2]
	ldr r0, _0800AC80 @ =0x000021A0
	strh r0, [r2, #4]
	adds r2, #8
	ldr r1, _0800AC84 @ =gScriptContext
	ldr r0, _0800AC88 @ =gMain
	ldrh r1, [r1, #0xe]
	ldrh r0, [r0, #0x1e]
	cmp r1, r0
	beq _0800AC8C
	movs r0, #0x80
	b _0800AC90
	.align 2, 0
_0800AC80: .4byte 0x000021A0
_0800AC84: .4byte gScriptContext
_0800AC88: .4byte gMain
_0800AC8C:
	movs r0, #0x80
	lsls r0, r0, #2
_0800AC90:
	strh r0, [r2]
	ldr r0, _0800AC9C @ =0x000040E0
	strh r0, [r2, #2]
	ldr r0, _0800ACA0 @ =0x000021A4
	strh r0, [r2, #4]
	b _0800ACAC
	.align 2, 0
_0800AC9C: .4byte 0x000040E0
_0800ACA0: .4byte 0x000021A4
_0800ACA4:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	strh r0, [r2, #8]
_0800ACAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800ACB4
sub_800ACB4: @ 0x0800ACB4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2b
	bl sub_8011150
	adds r0, r4, #0
	bl sub_8018778
	bl RunScriptContext
	bl sub_8016DA4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800ACD4
sub_800ACD4: @ 0x0800ACD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800ACE2
	b _0800AEE6
_0800ACE2:
	ldr r4, _0800ACFC @ =gScriptContext
	ldrh r1, [r4, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AD04
	ldr r1, _0800AD00 @ =gTestimony
	adds r0, r5, #0
	movs r2, #1
	bl sub_800B6EC
	b _0800AEE6
	.align 2, 0
_0800ACFC: .4byte gScriptContext
_0800AD00: .4byte gTestimony
_0800AD04:
	movs r6, #8
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0800AD18
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800AD18
	b _0800AEE6
_0800AD18:
	bl sub_800A44C
	cmp r0, #0
	beq _0800AD22
	b _0800AEE2
_0800AD22:
	adds r0, r6, #0
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800AD2E
	b _0800AED4
_0800AD2E:
	ldr r7, _0800AD60 @ =gTestimony
	ldr r0, [r7]
	ldr r1, _0800AD64 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	beq _0800AD3C
	b _0800AED4
_0800AD3C:
	bl sub_800A4A0
	adds r6, r0, #0
	cmp r6, #0
	beq _0800AD70
	ldr r4, _0800AD68 @ =gMain
	adds r1, r4, #0
	adds r1, #0xaa
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #6
	bl sub_8016E74
	bl sub_800A7AC
	ldr r0, _0800AD6C @ =0x01000007
	str r0, [r4, #8]
	b _0800AEE6
	.align 2, 0
_0800AD60: .4byte gTestimony
_0800AD64: .4byte 0x00FF00FF
_0800AD68: .4byte gMain
_0800AD6C: .4byte 0x01000007
_0800AD70:
	ldr r1, _0800AD98 @ =gJoypad
	ldrh r2, [r1, #2]
	movs r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0800ADF8
	movs r0, #2
	ldrh r3, [r4, #0x12]
	ands r0, r3
	cmp r0, #0
	beq _0800ADF8
	ldrh r0, [r4, #0xe]
	ldrh r1, [r5, #0x1e]
	cmp r0, r1
	beq _0800AD9C
	ldrh r0, [r4, #0xe]
	bl sub_800ACB4
	b _0800AEE2
	.align 2, 0
_0800AD98: .4byte gJoypad
_0800AD9C:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0800ADA6
	b _0800AEE2
_0800ADA6:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_800B6EC
	ldrh r0, [r4, #0xe]
	bl sub_800ACB4
	movs r1, #0
	strh r6, [r4, #0x10]
	ldr r0, _0800ADE8 @ =gMain
	strb r1, [r0, #0x19]
	movs r1, #0
	ldr r0, _0800ADEC @ =gUnknown_03002080
	movs r2, #0
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
_0800ADCA:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #0xff
	bls _0800ADCA
	ldr r0, _0800ADF0 @ =gScriptContext
	adds r0, #0x23
	movs r1, #1
	strb r1, [r0]
	ldr r1, _0800ADF4 @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	b _0800AEE6
	.align 2, 0
_0800ADE8: .4byte gMain
_0800ADEC: .4byte gUnknown_03002080
_0800ADF0: .4byte gScriptContext
_0800ADF4: .4byte gOamObjects
_0800ADF8:
	movs r0, #0x22
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800AE24
	ldr r2, _0800AE20 @ =gScriptContext
	movs r0, #2
	ldrh r3, [r2, #0x12]
	ands r0, r3
	cmp r0, #0
	beq _0800AE24
	ldrh r0, [r2, #0xc]
	subs r0, #1
	ldrh r5, [r5, #0x1c]
	cmp r0, r5
	beq _0800AEE2
	bl sub_800ACB4
	b _0800AEE2
	.align 2, 0
_0800AE20: .4byte gScriptContext
_0800AE24:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800AEE2
	ldr r0, _0800AE4C @ =gScriptContext
	ldrh r0, [r0, #0x10]
	cmp r0, #0
	beq _0800AEE2
	ldr r4, _0800AE50 @ =gMain
	ldrh r0, [r4, #0x34]
	cmp r0, #3
	beq _0800AE54
	movs r0, #4
	strb r0, [r5, #9]
	movs r0, #2
	strb r0, [r5, #0xa]
	b _0800AEE6
	.align 2, 0
_0800AE4C: .4byte gScriptContext
_0800AE50: .4byte gMain
_0800AE54:
	movs r0, #1
	bl sub_8012824
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800AE6C
	cmp r0, #0xc
	beq _0800AE6C
	cmp r0, #0xd
	bne _0800AE76
_0800AE6C:
	movs r0, #0xb9
	lsls r0, r0, #1
	bl sub_8011150
	b _0800AE8E
_0800AE76:
	cmp r0, #0x14
	bne _0800AE88
	ldr r0, _0800AE84 @ =0x0000016F
	bl sub_8011150
	b _0800AE8E
	.align 2, 0
_0800AE84: .4byte 0x0000016F
_0800AE88:
	movs r0, #0x47
	bl sub_8011150
_0800AE8E:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _0800AEC8 @ =gTestimony
	movs r0, #0x40
	strb r0, [r1, #1]
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldr r1, _0800AECC @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800AED0 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	strb r4, [r5, #0x18]
	strb r4, [r5, #0x19]
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	movs r0, #4
	strb r0, [r5, #9]
	strb r4, [r5, #0xa]
	b _0800AEE6
	.align 2, 0
_0800AEC8: .4byte gTestimony
_0800AECC: .4byte gIORegisters
_0800AED0: .4byte 0x0000FDFF
_0800AED4:
	bl sub_800A4A0
	cmp r0, #0
	beq _0800AEE2
	ldr r1, _0800AEEC @ =gUnknown_030037B8
	movs r0, #7
	str r0, [r1]
_0800AEE2:
	bl sub_800AC18
_0800AEE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AEEC: .4byte gUnknown_030037B8

	thumb_func_start nullsub_16
nullsub_16: @ 0x0800AEF0
	bx lr
	.align 2, 0

	thumb_func_start sub_800AEF4
sub_800AEF4: @ 0x0800AEF4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r4, [r5, #0xa]
	cmp r4, #1
	beq _0800AF86
	cmp r4, #1
	bgt _0800AF08
	cmp r4, #0
	beq _0800AF0E
	b _0800B08C
_0800AF08:
	cmp r4, #2
	beq _0800AFD8
	b _0800B08C
_0800AF0E:
	ldr r1, _0800AF38 @ =gTestimony
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0800AF80
	ldr r0, _0800AF3C @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800AF28
	cmp r0, #0xc
	beq _0800AF28
	cmp r0, #0xd
	bne _0800AF44
_0800AF28:
	ldr r3, _0800AF40 @ =0x00001770
	movs r0, #0
	movs r1, #1
	movs r2, #7
	bl sub_8014364
	b _0800AF62
	.align 2, 0
_0800AF38: .4byte gTestimony
_0800AF3C: .4byte gMain
_0800AF40: .4byte 0x00001770
_0800AF44:
	cmp r0, #0x14
	bne _0800AF56
	movs r0, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0
	bl sub_8014364
	b _0800AF62
_0800AF56:
	movs r0, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl sub_8014364
_0800AF62:
	ldr r0, _0800AF7C @ =gPalCourtScroll
	movs r1, #0x1e
	movs r2, #0x1f
	movs r3, #1
	bl InitCourtScroll
	movs r0, #0
	bl sub_80053FC
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
	b _0800B08C
	.align 2, 0
_0800AF7C: .4byte gPalCourtScroll
_0800AF80:
	subs r0, #1
	strb r0, [r1, #1]
	b _0800B08C
_0800AF86:
	ldr r0, _0800AFC4 @ =gCourtScroll
	ldrh r6, [r0, #4]
	cmp r6, #0
	beq _0800AF90
	b _0800B08C
_0800AF90:
	ldr r7, _0800AFC8 @ =gScriptContext
	ldrh r0, [r7, #0x10]
	cmp r0, #0
	beq _0800AFAA
	ldr r0, _0800AFCC @ =gMain
	strb r4, [r0, #0x18]
	strb r4, [r0, #0x19]
	ldr r0, _0800AFD0 @ =gIORegisters
	movs r1, #0
	strh r6, [r0, #0xe]
	adds r0, r7, #0
	adds r0, #0x23
	strb r1, [r0]
_0800AFAA:
	ldrh r0, [r7, #0x10]
	bl sub_8018778
	movs r2, #0
	strh r6, [r7, #0x10]
	ldr r0, _0800AFD4 @ =gTestimony
	movs r1, #0xe0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r2, [r0]
	strb r4, [r5, #9]
	strb r2, [r5, #0xa]
	b _0800B08C
	.align 2, 0
_0800AFC4: .4byte gCourtScroll
_0800AFC8: .4byte gScriptContext
_0800AFCC: .4byte gMain
_0800AFD0: .4byte gIORegisters
_0800AFD4: .4byte gTestimony
_0800AFD8:
	ldr r0, _0800B024 @ =gUnknown_03000844
	movs r1, #1
	bl sub_801208C
	ldrh r0, [r5, #0x34]
	movs r2, #0
	strh r0, [r5, #0x38]
	movs r0, #3
	strh r0, [r5, #0x34]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r5, r1
	strb r2, [r0]
	ldr r0, _0800B028 @ =gScriptContext
	adds r0, #0x40
	movs r1, #0x80
	strh r1, [r0]
	movs r0, #1
	bl sub_8012824
	ldr r0, _0800B02C @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800B01A
	cmp r0, #0xc
	beq _0800B01A
	cmp r0, #0xd
	bne _0800B030
_0800B01A:
	movs r0, #0xb9
	lsls r0, r0, #1
	bl sub_8011150
	b _0800B046
	.align 2, 0
_0800B024: .4byte gUnknown_03000844
_0800B028: .4byte gScriptContext
_0800B02C: .4byte gMain
_0800B030:
	cmp r0, #0x14
	bne _0800B040
	ldr r0, _0800B03C @ =0x0000016F
	bl sub_8011150
	b _0800B046
	.align 2, 0
_0800B03C: .4byte 0x0000016F
_0800B040:
	movs r0, #0x47
	bl sub_8011150
_0800B046:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _0800B080 @ =gTestimony
	movs r0, #0x40
	strb r0, [r1, #1]
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldr r1, _0800B084 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800B088 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	strb r4, [r5, #0x18]
	strb r4, [r5, #0x19]
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	movs r0, #4
	strb r0, [r5, #9]
	strb r4, [r5, #0xa]
	b _0800B0A0
	.align 2, 0
_0800B080: .4byte gTestimony
_0800B084: .4byte gIORegisters
_0800B088: .4byte 0x0000FDFF
_0800B08C:
	ldr r1, _0800B0A8 @ =gTestimony
	adds r0, r5, #0
	movs r2, #0
	bl sub_800B6EC
	ldr r1, _0800B0AC @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
_0800B0A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0A8: .4byte gTestimony
_0800B0AC: .4byte gOamObjects

	thumb_func_start sub_800B0B0
sub_800B0B0: @ 0x0800B0B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r0, #5
	bls _0800B0BC
	b _0800B1F4
_0800B0BC:
	lsls r0, r0, #2
	ldr r1, _0800B0C8 @ =_0800B0CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B0C8: .4byte _0800B0CC
_0800B0CC: @ jump table
	.4byte _0800B0E4 @ case 0
	.4byte _0800B10A @ case 1
	.4byte _0800B178 @ case 2
	.4byte _0800B198 @ case 3
	.4byte _0800B1FE @ case 4
	.4byte _0800B1FE @ case 5
_0800B0E4:
	ldr r4, _0800B100 @ =gTestimony
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0800B104
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x40
	strb r0, [r4, #1]
	b _0800B186
	.align 2, 0
_0800B100: .4byte gTestimony
_0800B104:
	subs r0, #1
	strb r0, [r4, #1]
	b _0800B1F4
_0800B10A:
	ldr r1, _0800B134 @ =gTestimony
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0800B1F0
	ldr r0, _0800B138 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800B124
	cmp r0, #0xc
	beq _0800B124
	cmp r0, #0xd
	bne _0800B140
_0800B124:
	ldr r3, _0800B13C @ =0x00001770
	movs r0, #0
	movs r1, #1
	movs r2, #7
	bl sub_8014364
	b _0800B15E
	.align 2, 0
_0800B134: .4byte gTestimony
_0800B138: .4byte gMain
_0800B13C: .4byte 0x00001770
_0800B140:
	cmp r0, #0x14
	bne _0800B152
	movs r0, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0
	bl sub_8014364
	b _0800B15E
_0800B152:
	movs r0, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl sub_8014364
_0800B15E:
	ldr r0, _0800B174 @ =gPalCourtScroll
	movs r1, #0x1e
	movs r2, #0x1f
	movs r3, #1
	bl InitCourtScroll
	movs r0, #0
	bl sub_80053FC
	b _0800B186
	.align 2, 0
_0800B174: .4byte gPalCourtScroll
_0800B178:
	ldr r0, _0800B190 @ =gCourtScroll
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0800B1F4
	ldr r0, _0800B194 @ =gTestimony
	movs r1, #0x14
	strb r1, [r0, #1]
_0800B186:
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
	b _0800B1F4
	.align 2, 0
_0800B190: .4byte gCourtScroll
_0800B194: .4byte gTestimony
_0800B198:
	ldr r1, _0800B1CC @ =gTestimony
	ldrb r0, [r1, #1]
	adds r2, r0, #0
	cmp r2, #0
	bne _0800B1F0
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r2, [r1]
	ldr r3, _0800B1D0 @ =gScriptContext
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B1DC
	ldr r1, _0800B1D4 @ =gMain
	movs r0, #1
	strb r0, [r1, #0x18]
	ldr r0, _0800B1D8 @ =gIORegisters
	movs r1, #0
	strh r2, [r0, #0xe]
	adds r0, r3, #0
	adds r0, #0x23
	strb r1, [r0]
	b _0800B1E2
	.align 2, 0
_0800B1CC: .4byte gTestimony
_0800B1D0: .4byte gScriptContext
_0800B1D4: .4byte gMain
_0800B1D8: .4byte gIORegisters
_0800B1DC:
	movs r0, #1
	bl sub_80053FC
_0800B1E2:
	ldr r1, _0800B1EC @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	b _0800B1F4
	.align 2, 0
_0800B1EC: .4byte gUnknown_030037B8
_0800B1F0:
	subs r0, #1
	strb r0, [r1, #1]
_0800B1F4:
	ldr r1, _0800B204 @ =gTestimony
	adds r0, r5, #0
	movs r2, #0
	bl sub_800B6EC
_0800B1FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B204: .4byte gTestimony

	thumb_func_start sub_800B208
sub_800B208: @ 0x0800B208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _0800B22C @ =gUnknown_03002D28
	mov sl, r0
	ldrb r0, [r7, #9]
	cmp r0, #8
	bls _0800B220
	b _0800B6DA
_0800B220:
	lsls r0, r0, #2
	ldr r1, _0800B230 @ =_0800B234
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B22C: .4byte gUnknown_03002D28
_0800B230: .4byte _0800B234
_0800B234: @ jump table
	.4byte _0800B258 @ case 0
	.4byte _0800B334 @ case 1
	.4byte _0800B3CC @ case 2
	.4byte _0800B4B4 @ case 3
	.4byte _0800B4D0 @ case 4
	.4byte _0800B598 @ case 5
	.4byte _0800B5D4 @ case 6
	.4byte _0800B630 @ case 7
	.4byte _0800B6D4 @ case 8
_0800B258:
	ldr r0, _0800B2CC @ =gMain
	adds r0, #0xa0
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0800B2D8
	bl sub_800653C
	adds r4, r0, #0
	ldr r6, _0800B2D0 @ =gUnknown_08026430
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
	ldr r5, _0800B2D4 @ =gOamObjects
	strh r0, [r5, #6]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0xe]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1e]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x56
	bl sub_8011150
	b _0800B4F0
	.align 2, 0
_0800B2CC: .4byte gMain
_0800B2D0: .4byte gUnknown_08026430
_0800B2D4: .4byte gOamObjects
_0800B2D8:
	adds r0, r7, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_800653C
	adds r4, r0, #0
	ldr r6, _0800B32C @ =gUnknown_08026430
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
	ldr r5, _0800B330 @ =gOamObjects
	strh r0, [r5, #6]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0xe]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1e]
	b _0800B6DA
	.align 2, 0
_0800B32C: .4byte gUnknown_08026430
_0800B330: .4byte gOamObjects
_0800B334:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bhi _0800B344
	b _0800B6DA
_0800B344:
	ldr r0, _0800B3B4 @ =gMain
	adds r0, #0xa0
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r0]
	movs r2, #8
	add sl, r2
	ldr r0, _0800B3B8 @ =0x000003EF
	mov r1, sl
	strh r0, [r1]
	ldr r0, _0800B3BC @ =0x0000C280
	strh r0, [r1, #2]
	ldr r0, _0800B3C0 @ =0x000051E0
	strh r0, [r1, #4]
	adds r0, r7, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_800653C
	adds r4, r0, #0
	ldr r6, _0800B3C4 @ =gUnknown_08026430
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
	ldr r5, _0800B3C8 @ =gOamObjects
	strh r0, [r5, #0x26]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x2e]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x3e]
	b _0800B6CC
	.align 2, 0
_0800B3B4: .4byte gMain
_0800B3B8: .4byte 0x000003EF
_0800B3BC: .4byte 0x0000C280
_0800B3C0: .4byte 0x000051E0
_0800B3C4: .4byte gUnknown_08026430
_0800B3C8: .4byte gOamObjects
_0800B3CC:
	ldr r0, _0800B44C @ =gMain
	adds r0, #0xa0
	mov sl, r0
	ldrh r0, [r0]
	subs r0, #0x10
	mov r2, sl
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	cmp r0, sb
	bgt _0800B458
	mov r0, sb
	bl sub_800653C
	adds r4, r0, #0
	ldr r6, _0800B450 @ =gUnknown_08026430
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	ldr r5, _0800B454 @ =gOamObjects
	strh r0, [r5, #0x26]
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x2e]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x3e]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x56
	bl sub_8011150
	mov r1, sb
	mov r0, sl
	strh r1, [r0]
	b _0800B4F0
	.align 2, 0
_0800B44C: .4byte gMain
_0800B450: .4byte gUnknown_08026430
_0800B454: .4byte gOamObjects
_0800B458:
	adds r0, r7, #0
	adds r0, #0xa0
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_800653C
	adds r4, r0, #0
	ldr r6, _0800B4AC @ =gUnknown_08026430
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
	ldr r5, _0800B4B0 @ =gOamObjects
	strh r0, [r5, #0x26]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x2e]
	ldrh r6, [r6]
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x3e]
	b _0800B6DA
	.align 2, 0
_0800B4AC: .4byte gUnknown_08026430
_0800B4B0: .4byte gOamObjects
_0800B4B4:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	bhi _0800B4C4
	b _0800B6DA
_0800B4C4:
	ldrb r0, [r7, #9]
	adds r0, #1
	movs r1, #0
	strb r0, [r7, #9]
	strb r1, [r7, #0xa]
	b _0800B6DA
_0800B4D0:
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _0800B4FC
	movs r0, #0x80
	lsls r0, r0, #2
	mov r2, sl
	strh r0, [r2]
	strh r0, [r2, #8]
	ldrb r0, [r7, #0xb]
	cmp r0, #0
	bne _0800B4F0
	b _0800B6D4
_0800B4F0:
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r0, #0
	strb r0, [r7, #0xa]
	b _0800B6DA
_0800B4FC:
	adds r0, r7, #0
	adds r0, #0xa0
	ldrh r1, [r0]
	adds r1, #8
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_800653C
	adds r4, r0, #0
	ldr r6, _0800B590 @ =gUnknown_08026430
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	ldr r5, _0800B594 @ =gOamObjects
	strh r0, [r5, #6]
	movs r0, #0
	ldrsh r2, [r6, r0]
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0xe]
	ldrh r6, [r6]
	rsbs r6, r6, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1e]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x26]
	mov r0, sb
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x36]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x3e]
	mov r1, sl
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldrh r0, [r1, #8]
	subs r0, #1
	strh r0, [r1, #8]
	b _0800B6DA
	.align 2, 0
_0800B590: .4byte gUnknown_08026430
_0800B594: .4byte gOamObjects
_0800B598:
	ldr r1, _0800B5B8 @ =0x040000D4
	ldr r0, _0800B5BC @ =gGfxConfetti
	str r0, [r1]
	ldr r0, _0800B5C0 @ =0x06011F80
	str r0, [r1, #4]
	ldr r0, _0800B5C4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800B5C8 @ =gPalConfetti0
	str r0, [r1]
	ldr r0, _0800B5CC @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _0800B5D0 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800B6CC
	.align 2, 0
_0800B5B8: .4byte 0x040000D4
_0800B5BC: .4byte gGfxConfetti
_0800B5C0: .4byte 0x06011F80
_0800B5C4: .4byte 0x80000010
_0800B5C8: .4byte gPalConfetti0
_0800B5CC: .4byte 0x050002A0
_0800B5D0: .4byte 0x80000040
_0800B5D4:
	ldr r2, _0800B628 @ =gUnknown_03002D70
	mov sl, r2
	movs r6, #0
_0800B5DA:
	bl Random
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r4, r6, #5
	adds r5, r5, r4
	movs r0, #0x7f
	ands r5, r0
	mov r0, sl
	strh r5, [r0]
	bl Random
	movs r5, #0x1f
	ands r5, r0
	adds r5, r5, r4
	movs r0, #0xff
	ands r5, r0
	mov r1, sl
	strh r5, [r1, #2]
	bl Random
	movs r1, #3
	ands r1, r0
	adds r5, r1, #5
	lsls r5, r5, #0xc
	ldr r2, _0800B62C @ =0x000004FC
	adds r0, r2, #0
	adds r0, r5, r0
	mov r1, sl
	strh r0, [r1, #4]
	movs r2, #8
	add sl, r2
	adds r6, #1
	cmp r6, #0x1e
	bls _0800B5DA
	movs r0, #0x66
	bl sub_8011150
	b _0800B6CC
	.align 2, 0
_0800B628: .4byte gUnknown_03002D70
_0800B62C: .4byte 0x000004FC
_0800B630:
	ldr r0, _0800B688 @ =gUnknown_03002D70
	mov sl, r0
	ldrb r0, [r7, #0xa]
	adds r1, r0, #1
	strb r1, [r7, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xef
	bhi _0800B6B8
	movs r6, #0
	movs r4, #3
_0800B646:
	mov r1, sl
	ldrh r5, [r1]
	bl Random
	adds r1, r4, #0
	ands r1, r0
	adds r5, r5, r1
	cmp r5, #0xa3
	bls _0800B65A
	movs r5, #0
_0800B65A:
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	mov r1, sl
	ldrh r1, [r1]
	ands r0, r1
	adds r0, r0, r5
	mov r2, sl
	strh r0, [r2]
	ldrh r5, [r2, #2]
	bl Random
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0800B68C
	bl Random
	adds r1, r4, #0
	ands r1, r0
	adds r5, r5, r1
	b _0800B696
	.align 2, 0
_0800B688: .4byte gUnknown_03002D70
_0800B68C:
	bl Random
	adds r1, r4, #0
	ands r1, r0
	subs r5, r5, r1
_0800B696:
	movs r0, #0xff
	ands r5, r0
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	mov r2, sl
	ldrh r2, [r2, #2]
	ands r0, r2
	adds r0, r0, r5
	mov r1, sl
	strh r0, [r1, #2]
	movs r2, #8
	add sl, r2
	adds r6, #1
	cmp r6, #0x1e
	bls _0800B646
	b _0800B6DA
_0800B6B8:
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #2
_0800B6BE:
	mov r1, sl
	strh r0, [r1]
	movs r2, #8
	add sl, r2
	adds r6, #1
	cmp r6, #0x1e
	bls _0800B6BE
_0800B6CC:
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	b _0800B6DA
_0800B6D4:
	ldr r1, _0800B6E8 @ =gUnknown_030037B8
	ldr r0, [r7, #0xc]
	str r0, [r1]
_0800B6DA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B6E8: .4byte gUnknown_030037B8

	thumb_func_start sub_800B6EC
sub_800B6EC: @ 0x0800B6EC
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, _0800B704 @ =gScriptContext
	ldrh r1, [r0, #0x10]
	adds r4, r0, #0
	cmp r1, #0
	beq _0800B6FE
	cmp r2, #0
	bne _0800B70C
_0800B6FE:
	ldr r2, _0800B708 @ =gUnknown_03002D48
	b _0800B74E
	.align 2, 0
_0800B704: .4byte gScriptContext
_0800B708: .4byte gUnknown_03002D48
_0800B70C:
	ldrb r0, [r3]
	cmp r0, #1
	bne _0800B72E
	ldrb r0, [r3, #2]
	cmp r0, #0xe0
	bls _0800B71C
	subs r0, #2
	b _0800B71E
_0800B71C:
	movs r0, #0xe0
_0800B71E:
	strb r0, [r3, #2]
	ldrb r0, [r3, #3]
	cmp r0, #0xe0
	bls _0800B72A
	subs r0, #2
	b _0800B744
_0800B72A:
	movs r0, #0xe0
	b _0800B744
_0800B72E:
	cmp r0, #0
	bne _0800B746
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0800B73C
	adds r0, #2
	strb r0, [r3, #2]
_0800B73C:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _0800B746
	adds r0, #2
_0800B744:
	strb r0, [r3, #3]
_0800B746:
	ldr r2, _0800B760 @ =gUnknown_03002D48
	ldrh r4, [r4, #0x10]
	cmp r4, #0x7f
	bhi _0800B764
_0800B74E:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	adds r2, #8
	strh r0, [r2]
	adds r2, #8
	strh r0, [r2]
	strh r0, [r2, #8]
	b _0800B7AC
	.align 2, 0
_0800B760: .4byte gUnknown_03002D48
_0800B764:
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrb r0, [r3, #2]
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r2, #2]
	movs r0, #0xab
	lsls r0, r0, #7
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r0, [r3, #2]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0800B7B4 @ =0x00008020
	strh r0, [r2, #2]
	ldr r0, _0800B7B8 @ =0x00005588
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r0, [r3, #3]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0800B7BC @ =0x000080B0
	strh r0, [r2, #2]
	ldr r0, _0800B7C0 @ =0x00005590
	strh r0, [r2, #4]
	adds r2, #8
	ldrb r3, [r3, #3]
	orrs r1, r3
	strh r1, [r2]
	ldr r0, _0800B7C4 @ =0x000080D0
	strh r0, [r2, #2]
	ldr r0, _0800B7C8 @ =0x00005598
	strh r0, [r2, #4]
_0800B7AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7B4: .4byte 0x00008020
_0800B7B8: .4byte 0x00005588
_0800B7BC: .4byte 0x000080B0
_0800B7C0: .4byte 0x00005590
_0800B7C4: .4byte 0x000080D0
_0800B7C8: .4byte 0x00005598

	thumb_func_start sub_800B7CC
sub_800B7CC: @ 0x0800B7CC
	push {r4, r5, lr}
	sub sp, #0x20
	ldr r2, _0800B830 @ =0x040000D4
	ldr r0, _0800B834 @ =gGfxWitnessBench1
	str r0, [r2]
	ldr r0, _0800B838 @ =0x06012000
	str r0, [r2, #4]
	ldr r0, _0800B83C @ =0x80000300
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0800B840 @ =gMain
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B850
	ldr r0, _0800B844 @ =gPalWitnessBench
	str r0, [r2]
	mov r0, sp
	str r0, [r2, #4]
	ldr r0, _0800B848 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r5, #0
_0800B800:
	lsls r0, r5, #1
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0800B800
	ldr r1, _0800B830 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800B84C @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0800B848 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800B882
	.align 2, 0
_0800B830: .4byte 0x040000D4
_0800B834: .4byte gGfxWitnessBench1
_0800B838: .4byte 0x06012000
_0800B83C: .4byte 0x80000300
_0800B840: .4byte gMain
_0800B844: .4byte gPalWitnessBench
_0800B848: .4byte 0x80000010
_0800B84C: .4byte 0x05000340
_0800B850:
	adds r0, r3, #0
	adds r0, #0x90
	ldrh r1, [r0]
	cmp r1, #7
	beq _0800B864
	cmp r1, #3
	beq _0800B864
	ldr r0, _0800B870 @ =0x0000FFFD
	cmp r1, r0
	bne _0800B874
_0800B864:
	movs r0, #3
	movs r1, #0xff
	movs r2, #1
	bl sub_800598C
	b _0800B882
	.align 2, 0
_0800B870: .4byte 0x0000FFFD
_0800B874:
	ldr r0, _0800B88C @ =gPalWitnessBench
	str r0, [r2]
	ldr r0, _0800B890 @ =0x05000340
	str r0, [r2, #4]
	ldr r0, _0800B894 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0800B882:
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B88C: .4byte gPalWitnessBench
_0800B890: .4byte 0x05000340
_0800B894: .4byte 0x80000010

	thumb_func_start sub_800B898
sub_800B898: @ 0x0800B898
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r6, _0800B8C4 @ =gUnknown_03002D20
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0800B8C8
	movs r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
_0800B8B8:
	strh r1, [r6]
	adds r6, #8
	adds r0, #1
	cmp r0, #3
	bls _0800B8B8
	b _0800B946
	.align 2, 0
_0800B8C4: .4byte gUnknown_03002D20
_0800B8C8:
	ldr r0, _0800B958 @ =0x000001FF
	ands r5, r0
	subs r0, #0xff
	mov r8, r0
	bl sub_800653C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	ldr r1, _0800B95C @ =0xFFFFFE80
	adds r7, r6, r1
	strh r0, [r7, #6]
	movs r0, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0xe]
	movs r0, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0x1e]
	movs r3, #0x80
	lsls r3, r3, #7
	add r3, sb
	strh r3, [r6]
	ldr r4, _0800B960 @ =0xFFFFC000
	adds r0, r4, #0
	adds r0, r5, r0
	strh r0, [r6, #2]
	movs r2, #0xad
	lsls r2, r2, #8
	strh r2, [r6, #4]
	adds r6, #8
	mov r0, sb
	strh r0, [r6]
	ldr r1, _0800B964 @ =0xFFFF8040
	adds r0, r5, r1
	strh r0, [r6, #2]
	ldr r1, _0800B968 @ =0x0000AD20
	strh r1, [r6, #4]
	adds r6, #8
	mov r4, sb
	strh r4, [r6]
	ldr r4, _0800B96C @ =0xFFFF9060
	adds r0, r5, r4
	strh r0, [r6, #2]
	strh r1, [r6, #4]
	adds r6, #8
	strh r3, [r6]
	ldr r1, _0800B970 @ =0xFFFFD080
	adds r0, r5, r1
	strh r0, [r6, #2]
	strh r2, [r6, #4]
_0800B946:
	bl sub_800BBE4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B958: .4byte 0x000001FF
_0800B95C: .4byte 0xFFFFFE80
_0800B960: .4byte 0xFFFFC000
_0800B964: .4byte 0xFFFF8040
_0800B968: .4byte 0x0000AD20
_0800B96C: .4byte 0xFFFF9060
_0800B970: .4byte 0xFFFFD080

	thumb_func_start sub_800B974
sub_800B974: @ 0x0800B974
	push {r4, r5, lr}
	sub sp, #0x20
	ldr r2, _0800B9D8 @ =0x040000D4
	ldr r0, _0800B9DC @ =gGfxCounselBench1
	str r0, [r2]
	ldr r0, _0800B9E0 @ =0x06012000
	str r0, [r2, #4]
	ldr r0, _0800B9E4 @ =0x80000680
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0800B9E8 @ =gMain
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B9F8
	ldr r0, _0800B9EC @ =gPalCounselBench
	str r0, [r2]
	mov r0, sp
	str r0, [r2, #4]
	ldr r0, _0800B9F0 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r5, #0
_0800B9A8:
	lsls r0, r5, #1
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0800B9A8
	ldr r1, _0800B9D8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800B9F4 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0800B9F0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800BA2A
	.align 2, 0
_0800B9D8: .4byte 0x040000D4
_0800B9DC: .4byte gGfxCounselBench1
_0800B9E0: .4byte 0x06012000
_0800B9E4: .4byte 0x80000680
_0800B9E8: .4byte gMain
_0800B9EC: .4byte gPalCounselBench
_0800B9F0: .4byte 0x80000010
_0800B9F4: .4byte 0x05000340
_0800B9F8:
	adds r0, r3, #0
	adds r0, #0x90
	ldrh r1, [r0]
	cmp r1, #7
	beq _0800BA0C
	cmp r1, #3
	beq _0800BA0C
	ldr r0, _0800BA18 @ =0x0000FFFD
	cmp r1, r0
	bne _0800BA1C
_0800BA0C:
	movs r0, #2
	movs r1, #0xff
	movs r2, #1
	bl sub_800598C
	b _0800BA2A
	.align 2, 0
_0800BA18: .4byte 0x0000FFFD
_0800BA1C:
	ldr r0, _0800BA34 @ =gPalCounselBench
	str r0, [r2]
	ldr r0, _0800BA38 @ =0x05000340
	str r0, [r2, #4]
	ldr r0, _0800BA3C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0800BA2A:
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA34: .4byte gPalCounselBench
_0800BA38: .4byte 0x05000340
_0800BA3C: .4byte 0x80000010

	thumb_func_start sub_800BA40
sub_800BA40: @ 0x0800BA40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0800BA74 @ =0x000001FF
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r6, _0800BA78 @ =gUnknown_03002D20
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0800BA7C
	movs r0, #0x80
	lsls r0, r0, #2
	movs r2, #3
_0800BA68:
	strh r0, [r6]
	adds r6, #8
	subs r2, #1
	cmp r2, #0
	bge _0800BA68
	b _0800BAF2
	.align 2, 0
_0800BA74: .4byte 0x000001FF
_0800BA78: .4byte gUnknown_03002D20
_0800BA7C:
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	bl sub_800653C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800650C
	ldr r3, _0800BB04 @ =0xFFFFFE80
	adds r7, r6, r3
	strh r0, [r7, #6]
	movs r0, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0xe]
	movs r0, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0x16]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0x1e]
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #7
	add r3, sb
	ldr r0, _0800BB08 @ =0xFFFFC000
	add r0, r8
	ldr r1, _0800BB0C @ =0xFFFFAD00
_0800BAC6:
	strh r3, [r6]
	strh r0, [r6, #2]
	strh r1, [r6, #4]
	adds r6, #8
	adds r0, #0x40
	adds r1, #0x20
	adds r2, #1
	cmp r2, #2
	ble _0800BAC6
	ldr r1, _0800BB10 @ =0xFFFF8000
	adds r0, r1, #0
	mov r3, sb
	adds r1, r3, r0
	strh r1, [r6]
	add r0, r8
	lsls r1, r2, #6
	adds r0, r0, r1
	strh r0, [r6, #2]
	lsls r0, r2, #5
	ldr r1, _0800BB0C @ =0xFFFFAD00
	adds r0, r0, r1
	strh r0, [r6, #4]
_0800BAF2:
	bl sub_800BBE4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB04: .4byte 0xFFFFFE80
_0800BB08: .4byte 0xFFFFC000
_0800BB0C: .4byte 0xFFFFAD00
_0800BB10: .4byte 0xFFFF8000

	thumb_func_start sub_800BB14
sub_800BB14: @ 0x0800BB14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0800BB44 @ =0x000001FF
	ands r5, r0
	ldr r6, _0800BB48 @ =gUnknown_03002D20
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0800BB4C
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #2
_0800BB38:
	strh r0, [r6]
	adds r6, #8
	adds r2, #1
	cmp r2, #3
	bls _0800BB38
	b _0800BBBA
	.align 2, 0
_0800BB44: .4byte 0x000001FF
_0800BB48: .4byte gUnknown_03002D20
_0800BB4C:
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	bl sub_800653C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	ldr r1, _0800BBCC @ =0xFFFFFE80
	adds r7, r6, r1
	strh r0, [r7, #6]
	movs r0, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0xe]
	movs r0, #0
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0x16]
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r7, #0x1e]
	ldr r0, _0800BBD0 @ =0xFFFF8000
	add r0, sb
	strh r0, [r6]
	ldr r3, _0800BBD4 @ =0xFFFF9000
	adds r0, r5, r3
	strh r0, [r6, #2]
	ldr r0, _0800BBD8 @ =0x0000AD60
	strh r0, [r6, #4]
	adds r6, #8
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #7
	add r1, sb
	ldr r3, _0800BBDC @ =0x0000D010
	adds r0, r5, r3
	ldr r3, _0800BBE0 @ =0x0000AD40
_0800BBA8:
	strh r1, [r6]
	strh r0, [r6, #2]
	strh r3, [r6, #4]
	adds r6, #8
	adds r0, #0x40
	subs r3, #0x20
	adds r2, #1
	cmp r2, #2
	bls _0800BBA8
_0800BBBA:
	bl sub_800BBE4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BBCC: .4byte 0xFFFFFE80
_0800BBD0: .4byte 0xFFFF8000
_0800BBD4: .4byte 0xFFFF9000
_0800BBD8: .4byte 0x0000AD60
_0800BBDC: .4byte 0x0000D010
_0800BBE0: .4byte 0x0000AD40

	thumb_func_start sub_800BBE4
sub_800BBE4: @ 0x0800BBE4
	push {r4, lr}
	ldr r1, _0800BC04 @ =gUnknown_03002D20
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #5
	adds r3, r0, #0
_0800BBF0:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #8
	adds r2, #1
	cmp r2, #3
	bls _0800BBF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC04: .4byte gUnknown_03002D20

	thumb_func_start sub_800BC08
sub_800BC08: @ 0x0800BC08
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r5, _0800BC40 @ =gUnknown_03000844
	ldrb r0, [r5, #0xe]
	adds r3, r5, #0
	cmp r0, #0xb
	beq _0800BC20
	cmp r0, #0x21
	beq _0800BC20
	cmp r0, #3
	beq _0800BC20
	b _0800BF2E
_0800BC20:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _0800BC2E
	b _0800BF2E
_0800BC2E:
	cmp r2, #0x1f
	bls _0800BC34
	b _0800BF2E
_0800BC34:
	lsls r0, r2, #2
	ldr r1, _0800BC44 @ =_0800BC48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BC40: .4byte gUnknown_03000844
_0800BC44: .4byte _0800BC48
_0800BC48: @ jump table
	.4byte _0800BCC8 @ case 0
	.4byte _0800BCD0 @ case 1
	.4byte _0800BF2E @ case 2
	.4byte _0800BF2E @ case 3
	.4byte _0800BF2E @ case 4
	.4byte _0800BF2E @ case 5
	.4byte _0800BF2E @ case 6
	.4byte _0800BF2E @ case 7
	.4byte _0800BF2E @ case 8
	.4byte _0800BF2E @ case 9
	.4byte _0800BDC0 @ case 10
	.4byte _0800BCFC @ case 11
	.4byte _0800BD30 @ case 12
	.4byte _0800BDD8 @ case 13
	.4byte _0800BF2E @ case 14
	.4byte _0800BF2E @ case 15
	.4byte _0800BF2E @ case 16
	.4byte _0800BF2E @ case 17
	.4byte _0800BF2E @ case 18
	.4byte _0800BF2E @ case 19
	.4byte _0800BDE0 @ case 20
	.4byte _0800BF2E @ case 21
	.4byte _0800BF2E @ case 22
	.4byte _0800BF2E @ case 23
	.4byte _0800BF2E @ case 24
	.4byte _0800BF2E @ case 25
	.4byte _0800BF2E @ case 26
	.4byte _0800BF2E @ case 27
	.4byte _0800BF2E @ case 28
	.4byte _0800BF2E @ case 29
	.4byte _0800BF14 @ case 30
	.4byte _0800BF1A @ case 31
_0800BCC8:
	ldr r1, _0800BCCC @ =gUnknown_0826F888
	b _0800BCD2
	.align 2, 0
_0800BCCC: .4byte gUnknown_0826F888
_0800BCD0:
	ldr r1, _0800BCE8 @ =gUnknown_0826FE38
_0800BCD2:
	ldr r0, [r1, #4]
	ldr r1, _0800BCEC @ =gUnknown_08252498
	adds r2, r0, r1
	ldr r1, _0800BCF0 @ =0x050003A0
	ldr r0, _0800BCF4 @ =0x040000D4
	str r2, [r0]
	str r1, [r0, #4]
	ldr r1, _0800BCF8 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0800BF2E
	.align 2, 0
_0800BCE8: .4byte gUnknown_0826FE38
_0800BCEC: .4byte gUnknown_08252498
_0800BCF0: .4byte 0x050003A0
_0800BCF4: .4byte 0x040000D4
_0800BCF8: .4byte 0x80000010
_0800BCFC:
	movs r0, #1
	bl sub_800BC08
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r5]
	movs r4, #0
	movs r6, #0x80
_0800BD14:
	adds r0, r4, #0
	adds r0, #0x83
	bl sub_8011D68
	adds r5, r0, #0
	cmp r5, #0
	beq _0800BD28
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
_0800BD28:
	adds r4, #1
	cmp r4, #2
	bls _0800BD14
	b _0800BF2E
_0800BD30:
	adds r5, r3, #0
	ldrb r0, [r5, #0xe]
	cmp r0, #3
	bne _0800BD3C
	movs r0, #0xb
	strb r0, [r5, #0xe]
_0800BD3C:
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	movs r0, #0x78
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800BD5A
	ldr r0, _0800BD88 @ =0x0000800B
	ldr r2, _0800BD8C @ =gMain
	adds r1, r2, #0
	adds r1, #0xc4
	ldrh r1, [r1]
	adds r2, #0xc6
	ldrh r2, [r2]
	bl sub_80066B0
_0800BD5A:
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	ldr r2, _0800BD8C @ =gMain
	cmp r1, #0x78
	bne _0800BD6E
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0xf0
	beq _0800BD76
_0800BD6E:
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bne _0800BD94
_0800BD76:
	ldr r0, _0800BD90 @ =0x0000400B
	adds r1, r2, #0
	adds r1, #0xc4
	ldrh r1, [r1]
	adds r2, #0xc6
	ldrh r2, [r2]
	bl sub_80066B0
	b _0800BDA4
	.align 2, 0
_0800BD88: .4byte 0x0000800B
_0800BD8C: .4byte gMain
_0800BD90: .4byte 0x0000400B
_0800BD94:
	ldr r0, _0800BDB8 @ =0x0000800B
	adds r1, r2, #0
	adds r1, #0xc4
	ldrh r1, [r1]
	adds r2, #0xc6
	ldrh r2, [r2]
	bl sub_80066B0
_0800BDA4:
	movs r0, #1
	bl sub_800BC08
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r1, _0800BDBC @ =0xFEFFFFFF
	b _0800BF2A
	.align 2, 0
_0800BDB8: .4byte 0x0000800B
_0800BDBC: .4byte 0xFEFFFFFF
_0800BDC0:
	movs r0, #1
	bl sub_800BC08
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r1, _0800BDD4 @ =0xFEFFFFFF
	b _0800BF2A
	.align 2, 0
_0800BDD4: .4byte 0xFEFFFFFF
_0800BDD8:
	movs r0, #1
	bl sub_800BC08
	b _0800BF2E
_0800BDE0:
	adds r5, r3, #0
	ldr r1, [r5]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	bne _0800BDF0
	b _0800BF2E
_0800BDF0:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BE54
	ldr r0, _0800BE3C @ =gMain
	adds r3, r0, #0
	adds r3, #0x8f
	ldrb r1, [r3]
	cmp r1, #0xf
	beq _0800BE06
	b _0800BF2E
_0800BE06:
	ldr r1, _0800BE40 @ =gIORegisters
	adds r2, r1, #0
	adds r2, #0x48
	ldr r0, _0800BE44 @ =0x00003942
	strh r0, [r2]
	adds r1, #0x4c
	ldr r0, _0800BE48 @ =0x0000071F
	strh r0, [r1]
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r5, #0
	movs r1, #0
	bl sub_801208C
	movs r0, #3
	strb r0, [r5, #0xe]
	movs r0, #0
	bl sub_8016FEC
	ldr r0, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0800BE4C @ =0xFBFFFFFF
	ands r0, r1
	ldr r1, _0800BE50 @ =0xFDFFFFFF
	b _0800BF2A
	.align 2, 0
_0800BE3C: .4byte gMain
_0800BE40: .4byte gIORegisters
_0800BE44: .4byte 0x00003942
_0800BE48: .4byte 0x0000071F
_0800BE4C: .4byte 0xFBFFFFFF
_0800BE50: .4byte 0xFDFFFFFF
_0800BE54:
	ldr r0, _0800BEF4 @ =gMain
	adds r6, r0, #0
	adds r6, #0x8f
	ldrb r0, [r6]
	cmp r0, #1
	bne _0800BE94
	ldr r0, _0800BEF8 @ =0xFBFFFFFF
	ands r1, r0
	str r1, [r5]
	ldr r4, _0800BEFC @ =gIORegisters
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldr r0, _0800BF00 @ =0x00003942
	strh r0, [r1]
	adds r4, #0x4c
	ldr r0, _0800BF04 @ =0x0000071F
	strh r0, [r4]
	strb r2, [r6]
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r5]
	movs r0, #0
	bl sub_800BC08
	ldr r1, _0800BF08 @ =0x04000052
	ldrh r0, [r4]
	strh r0, [r1]
_0800BE94:
	ldrb r6, [r6]
	cmp r6, #2
	bne _0800BF2E
	ldr r0, [r5]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x40
	ands r0, r1
	ldr r1, _0800BF0C @ =0xFEFFFFFF
	ands r0, r1
	ldr r1, _0800BF10 @ =0xFDFFFFFF
	ands r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r5]
	movs r4, #0
_0800BEBE:
	adds r0, r4, #0
	adds r0, #0x83
	bl sub_8011D68
	adds r5, r0, #0
	cmp r5, #0
	beq _0800BEE2
	ldr r0, [r5]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x40
	ands r0, r1
	ldr r1, _0800BF0C @ =0xFEFFFFFF
	ands r0, r1
	ldr r1, _0800BF10 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r5]
_0800BEE2:
	adds r4, #1
	cmp r4, #2
	bls _0800BEBE
	ldr r0, _0800BEF4 @ =gMain
	adds r0, #0x8f
	movs r1, #1
	strb r1, [r0]
	b _0800BF2E
	.align 2, 0
_0800BEF4: .4byte gMain
_0800BEF8: .4byte 0xFBFFFFFF
_0800BEFC: .4byte gIORegisters
_0800BF00: .4byte 0x00003942
_0800BF04: .4byte 0x0000071F
_0800BF08: .4byte 0x04000052
_0800BF0C: .4byte 0xFEFFFFFF
_0800BF10: .4byte 0xFDFFFFFF
_0800BF14:
	movs r0, #1
	bl sub_800BC08
_0800BF1A:
	bl sub_8016FB4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r1, _0800BF34 @ =0xFDFFFFFF
	ands r0, r1
	movs r1, #0x81
	rsbs r1, r1, #0
_0800BF2A:
	ands r0, r1
	str r0, [r5]
_0800BF2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF34: .4byte 0xFDFFFFFF

	thumb_func_start sub_800BF38
sub_800BF38: @ 0x0800BF38
	ldr r2, _0800BF48 @ =gMain
	movs r3, #0x99
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r0, r0, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0800BF48: .4byte gMain

	thumb_func_start sub_800BF4C
sub_800BF4C: @ 0x0800BF4C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldr r2, _0800BF78 @ =gMain
	movs r4, #0xa4
	lsls r4, r4, #2
	adds r0, r2, r4
	ldrh r0, [r0]
	cmp r1, r0
	bhs _0800BF86
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r4, r2, r5
	adds r2, r0, #0
_0800BF6A:
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	bne _0800BF7C
	movs r0, #1
	b _0800BF88
	.align 2, 0
_0800BF78: .4byte gMain
_0800BF7C:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r2
	blo _0800BF6A
_0800BF86:
	movs r0, #0
_0800BF88:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800BF90
sub_800BF90: @ 0x0800BF90
	adds r2, r0, #0
	strb r1, [r2, #8]
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _0800BFA0
	movs r0, #0xf3
	ands r0, r1
	strb r0, [r2, #8]
_0800BFA0:
	bx lr
	.align 2, 0

	thumb_func_start sub_800BFA4
sub_800BFA4: @ 0x0800BFA4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, #5
	beq _0800BFC2
	ldr r0, _0800BFE4 @ =gUnknown_0814DB08
	adds r1, r5, #0
	adds r1, #0xc1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
_0800BFC2:
	ldr r1, _0800BFE8 @ =gUnknown_0814DBBC
	ldrb r2, [r5, #9]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, _0800BFEC @ =gInvestigation
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r0, r4, #0
	bl sub_800E4F8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFE4: .4byte gUnknown_0814DB08
_0800BFE8: .4byte gUnknown_0814DBBC
_0800BFEC: .4byte gInvestigation

	thumb_func_start sub_800BFF0
sub_800BFF0: @ 0x0800BFF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	ldr r7, _0800C1F8 @ =gIORegisters
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _0800C1FC @ =0x040000D4
	str r0, [r4]
	ldr r0, _0800C200 @ =gTestimony
	str r0, [r4, #4]
	ldr r0, _0800C204 @ =0x81000004
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, sp
	strh r5, [r0]
	str r0, [r4]
	ldr r0, _0800C208 @ =gInvestigation
	str r0, [r4, #4]
	ldr r0, _0800C20C @ =0x8100000E
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl HideAllSprites
	bl InitBGs
	bl ResetAnimationSystem
	bl LoadCurrentScriptIntoRam
	adds r1, r7, #0
	adds r1, #0x4a
	movs r0, #0xfa
	lsls r0, r0, #5
	strh r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r7]
	ldr r0, _0800C210 @ =0x00003D01
	strh r0, [r7, #2]
	adds r0, #0xff
	strh r0, [r7, #4]
	ldr r0, _0800C214 @ =0x00003FC7
	strh r0, [r7, #6]
	ldr r0, _0800C218 @ =gGfxSaveGameTiles
	str r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r1, _0800C21C @ =0x80000800
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C220 @ =gGfx4bppInvestigationActions
	str r0, [r4]
	ldr r0, _0800C224 @ =0x06012000
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C228 @ =gPalActionButtons1
	str r0, [r4]
	ldr r0, _0800C22C @ =0x050002A0
	str r0, [r4, #4]
	ldr r3, _0800C230 @ =0x80000020
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C234 @ =gGfx4bppInvestigationScrollButton
	str r0, [r4]
	ldr r0, _0800C238 @ =0x06013000
	str r0, [r4, #4]
	ldr r2, _0800C23C @ =0x80000100
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C240 @ =gPalInvestigationScrollPrompt
	str r0, [r4]
	ldr r0, _0800C244 @ =0x050002E0
	str r0, [r4, #4]
	ldr r1, _0800C248 @ =0x80000010
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C24C @ =gGfxExamineCursor
	str r0, [r4]
	ldr r0, _0800C250 @ =0x06013200
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C254 @ =gPalExamineCursors
	str r0, [r4]
	ldr r0, _0800C258 @ =0x05000300
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0800C25C @ =gPalChoiceSelected
	str r0, [r4]
	ldr r0, _0800C260 @ =0x05000320
	str r0, [r4, #4]
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0800C264 @ =gUnknown_03002D40
	movs r5, #0
	add r0, sp, #4
	mov sb, r0
	ldr r2, _0800C268 @ =0x000040E0
	mov ip, r2
	movs r3, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r4, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0800C0D2:
	mov r0, ip
	strh r0, [r1]
	adds r0, r3, r4
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r5, #1
	cmp r5, #3
	bls _0800C0D2
	mov r0, r8
	movs r1, #0xf
	bl sub_800BF90
	movs r4, #0
	movs r0, #0xe0
	mov r1, r8
	strb r0, [r1, #0x11]
	strb r4, [r1, #0x12]
	movs r0, #8
	strb r0, [r1, #0x13]
	strb r4, [r1, #0xc]
	strb r4, [r1, #0xd]
	ldr r1, _0800C26C @ =gUnknown_0814DA50
	movs r2, #0xc1
	adds r2, r2, r6
	mov r8, r2
	ldrb r3, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r6, #0
	adds r0, #0xc0
	ldrb r2, [r0]
	lsls r1, r2, #2
	adds r1, r1, r2
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r6, r3
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r5, #0
	bl sub_8003D5C
	adds r0, r5, #0
	bl sub_80049A0
	movs r0, #0x81
	bl sub_80049A0
	ldr r0, _0800C270 @ =0x0000FFAF
	strh r0, [r7, #0xe]
	adds r1, r7, #0
	adds r1, #0x4a
	ldr r5, _0800C274 @ =0x0000FDFF
	adds r0, r5, #0
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldr r1, _0800C278 @ =gCourtRecord
	adds r0, r6, #0
	bl sub_800E9C4
	str r4, [sp, #4]
	ldr r1, _0800C1FC @ =0x040000D4
	mov r3, sb
	str r3, [r1]
	adds r0, r6, #0
	adds r0, #0xc8
	str r0, [r1, #4]
	ldr r0, _0800C27C @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r6, #0
	adds r0, #0xe8
	str r4, [r0]
	movs r0, #0xf
	strb r0, [r6, #0x1a]
	movs r0, #1
	strb r0, [r6, #0x18]
	strb r0, [r6, #0x19]
	ldr r1, _0800C280 @ =gScriptContext
	ldr r0, _0800C284 @ =0x0000FFFF
	strh r0, [r1, #0xc]
	movs r0, #0x80
	bl sub_8018778
	ldr r0, _0800C288 @ =gMain
	adds r4, r0, #0
	adds r4, #0xc1
	ldrb r0, [r4]
	cmp r0, #0xc
	beq _0800C19A
	movs r0, #1
	bl sub_80053FC
_0800C19A:
	ldrb r4, [r4]
	cmp r4, #7
	bne _0800C1AC
	ldr r1, _0800C1F8 @ =gIORegisters
	adds r1, #0x4a
	adds r0, r5, #0
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
_0800C1AC:
	ldr r1, _0800C28C @ =gUnknown_0814DAAC
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	adds r0, r6, #0
	movs r1, #0
	bl sub_800E6A4
	bl sub_800A38C
	movs r0, #0x30
	movs r1, #0xf
	bl SetTimedKeysAndDelay
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	adds r1, r7, #0
	adds r1, #0x4e
	movs r0, #0x10
	strh r0, [r1]
	adds r0, #0xf4
	str r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C1F8: .4byte gIORegisters
_0800C1FC: .4byte 0x040000D4
_0800C200: .4byte gTestimony
_0800C204: .4byte 0x81000004
_0800C208: .4byte gInvestigation
_0800C20C: .4byte 0x8100000E
_0800C210: .4byte 0x00003D01
_0800C214: .4byte 0x00003FC7
_0800C218: .4byte gGfxSaveGameTiles
_0800C21C: .4byte 0x80000800
_0800C220: .4byte gGfx4bppInvestigationActions
_0800C224: .4byte 0x06012000
_0800C228: .4byte gPalActionButtons1
_0800C22C: .4byte 0x050002A0
_0800C230: .4byte 0x80000020
_0800C234: .4byte gGfx4bppInvestigationScrollButton
_0800C238: .4byte 0x06013000
_0800C23C: .4byte 0x80000100
_0800C240: .4byte gPalInvestigationScrollPrompt
_0800C244: .4byte 0x050002E0
_0800C248: .4byte 0x80000010
_0800C24C: .4byte gGfxExamineCursor
_0800C250: .4byte 0x06013200
_0800C254: .4byte gPalExamineCursors
_0800C258: .4byte 0x05000300
_0800C25C: .4byte gPalChoiceSelected
_0800C260: .4byte 0x05000320
_0800C264: .4byte gUnknown_03002D40
_0800C268: .4byte 0x000040E0
_0800C26C: .4byte gUnknown_0814DA50
_0800C270: .4byte 0x0000FFAF
_0800C274: .4byte 0x0000FDFF
_0800C278: .4byte gCourtRecord
_0800C27C: .4byte 0x85000008
_0800C280: .4byte gScriptContext
_0800C284: .4byte 0x0000FFFF
_0800C288: .4byte gMain
_0800C28C: .4byte gUnknown_0814DAAC

	thumb_func_start sub_800C290
sub_800C290: @ 0x0800C290
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x14
	bl sub_800BC08
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800C310
	ldrb r0, [r4, #0x10]
	cmp r0, #2
	beq _0800C310
	ldr r1, _0800C31C @ =gJoypad
	movs r0, #8
	ldrh r2, [r1, #2]
	ands r0, r2
	adds r3, r1, #0
	ldr r2, _0800C320 @ =gScriptContext
	cmp r0, #0
	beq _0800C2DC
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C2DC
	movs r0, #5
	ldrh r1, [r2, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800C2DC
	ldr r0, _0800C324 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800C352
_0800C2DC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r3, [r3, #2]
	ands r0, r3
	cmp r0, #0
	beq _0800C300
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C300
	movs r0, #5
	ldrh r1, [r2, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800C382
_0800C300:
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800C310
	ldrh r0, [r5, #0x18]
	cmp r0, #0
	beq _0800C328
_0800C310:
	adds r0, r5, #0
	movs r1, #0
	bl sub_800E6A4
	b _0800C50A
	.align 2, 0
_0800C31C: .4byte gJoypad
_0800C320: .4byte gScriptContext
_0800C324: .4byte gMain
_0800C328:
	adds r0, r5, #0
	movs r1, #1
	bl sub_800E6A4
	ldr r1, _0800C35C @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C364
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C364
	ldr r0, _0800C360 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	beq _0800C364
_0800C352:
	movs r0, #0
	bl sub_800A3A0
	b _0800C50A
	.align 2, 0
_0800C35C: .4byte gJoypad
_0800C360: .4byte gMain
_0800C364:
	ldr r6, _0800C3A8 @ =gJoypad
	ldrh r1, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C3B0
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800C382
	b _0800C4F6
_0800C382:
	movs r0, #0x31
	bl sub_8011150
	ldr r0, _0800C3AC @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r5, #0xc]
	movs r0, #7
	str r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0
	bl sub_800E6A4
	movs r0, #0
	strb r0, [r4, #0x12]
	movs r0, #8
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	b _0800C50A
	.align 2, 0
_0800C3A8: .4byte gJoypad
_0800C3AC: .4byte gUnknown_030037B8
_0800C3B0:
	movs r0, #0x30
	ldrh r2, [r6, #8]
	ands r0, r2
	cmp r0, #0
	beq _0800C3F6
	ldrb r1, [r4, #0xc]
	strb r1, [r4, #0xd]
	movs r0, #0x20
	ldrh r6, [r6, #8]
	ands r0, r6
	cmp r0, #0
	beq _0800C3CC
	subs r0, r1, #1
	b _0800C3CE
_0800C3CC:
	adds r0, r1, #1
_0800C3CE:
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0800C3DE
	movs r0, #1
	ldrb r1, [r4, #0xc]
	ands r0, r1
	b _0800C3E4
_0800C3DE:
	movs r0, #3
	ldrb r2, [r4, #0xc]
	ands r0, r2
_0800C3E4:
	strb r0, [r4, #0xc]
	movs r0, #0x2a
	bl sub_8011150
	movs r0, #0
	strb r0, [r4, #0x12]
	movs r0, #8
	strb r0, [r4, #0x13]
	b _0800C4F6
_0800C3F6:
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800C484
	movs r0, #0x2b
	bl sub_8011150
	movs r6, #0
	movs r0, #0x78
	strh r0, [r4]
	movs r0, #0x32
	strh r0, [r4, #2]
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_800BF90
	adds r0, r7, #0
	ldrb r1, [r4, #0xc]
	lsls r0, r1
	ldrb r2, [r4, #8]
	subs r0, r2, r0
	strb r0, [r4, #8]
	movs r0, #0xf0
	strb r0, [r4, #0x11]
	movs r0, #8
	strb r0, [r4, #0x12]
	strb r6, [r4, #0x13]
	adds r0, r1, #0
	strb r0, [r4, #0xd]
	movs r0, #3
	strb r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #0
	bl sub_800E6A4
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	bne _0800C466
	movs r0, #0xb
	bl sub_800BC08
	movs r0, #0xc
	movs r1, #1
	bl sub_8012D38
	strb r6, [r4, #0x1b]
	strb r6, [r4, #0x1a]
	ldr r1, _0800C474 @ =0x040000D4
	ldr r0, _0800C478 @ =gPalExamineCursors
	str r0, [r1]
	ldr r0, _0800C47C @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0800C480 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0800C466:
	ldrb r0, [r4, #0xc]
	adds r0, #6
	strb r0, [r5, #9]
	strb r6, [r5, #0xb]
	strb r6, [r5, #0xa]
	b _0800C50A
	.align 2, 0
_0800C474: .4byte 0x040000D4
_0800C478: .4byte gPalExamineCursors
_0800C47C: .4byte 0x05000300
_0800C480: .4byte 0x80000010
_0800C484:
	ldrh r0, [r5, #0x34]
	bl sub_80051AC
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0800C4F6
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r6, [r6, #2]
	ands r0, r6
	cmp r0, #0
	beq _0800C4F6
	adds r0, r5, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	beq _0800C4B4
	cmp r1, #0x78
	beq _0800C4B4
	cmp r1, #0xf0
	bne _0800C4F6
_0800C4B4:
	movs r0, #0x2b
	bl sub_8011150
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0800C4D2
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #6
	b _0800C4E0
_0800C4D2:
	cmp r0, #0x78
	beq _0800C4DA
	cmp r0, #0xf0
	bne _0800C4E2
_0800C4DA:
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0xfa
_0800C4E0:
	strb r0, [r1]
_0800C4E2:
	movs r0, #0
	movs r1, #3
	strb r1, [r5, #9]
	strb r0, [r5, #0xb]
	strb r0, [r5, #0xa]
	strb r1, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_800BF90
_0800C4F6:
	ldrb r0, [r4, #0x12]
	cmp r0, #7
	bhi _0800C500
	adds r0, #1
	strb r0, [r4, #0x12]
_0800C500:
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _0800C50A
	subs r0, #1
	strb r0, [r4, #0x13]
_0800C50A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800C510
sub_800C510: @ 0x0800C510
	push {r4, lr}
	adds r4, r0, #0
	bl ClearSectionReadFlags
	adds r0, r4, #0
	bl sub_8007238
	ldr r1, _0800C54C @ =0x040000D4
	ldr r0, _0800C550 @ =gMain
	str r0, [r1]
	ldr r0, _0800C554 @ =gUnknown_02000034
	str r0, [r1, #4]
	ldr r0, _0800C558 @ =0x8000016A
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800C55C @ =0x0100000A
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800C564
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #1
	bne _0800C590
	ldr r0, _0800C560 @ =0x0100000B
	b _0800C58E
	.align 2, 0
_0800C54C: .4byte 0x040000D4
_0800C550: .4byte gMain
_0800C554: .4byte gUnknown_02000034
_0800C558: .4byte 0x8000016A
_0800C55C: .4byte 0x0100000A
_0800C560: .4byte 0x0100000B
_0800C564:
	cmp r0, #7
	bne _0800C57C
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #2
	bne _0800C590
	ldr r0, _0800C578 @ =gUnknown_0200000B
	b _0800C58E
	.align 2, 0
_0800C578: .4byte gUnknown_0200000B
_0800C57C:
	cmp r0, #0xc
	bne _0800C590
	adds r0, r4, #0
	adds r0, #0xc2
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #3
	bne _0800C590
	ldr r0, _0800C598 @ =gUnknown_0300000B
_0800C58E:
	str r0, [r4, #8]
_0800C590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C598: .4byte gUnknown_0300000B

	thumb_func_start sub_800C59C
sub_800C59C: @ 0x0800C59C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0
	bl sub_800E6A4
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0800C5F0
	ldrh r0, [r4, #0x34]
	bl sub_80051AC
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0800C5CE
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800C5DE
	cmp r0, #0xf0
	beq _0800C5DE
	b _0800C5FC
_0800C5CE:
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800C5DE
	cmp r0, #0x78
	bne _0800C5FC
_0800C5DE:
	movs r0, #0
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x13]
	movs r0, #1
	strb r0, [r5, #0x10]
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	b _0800C5FC
_0800C5F0:
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _0800C5FC
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r4, #8]
_0800C5FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800C604
sub_800C604: @ 0x0800C604
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_800E6A4
	ldr r0, _0800C624 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800C61E
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r4, #8]
_0800C61E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C624: .4byte gScriptContext

	thumb_func_start sub_800C628
sub_800C628: @ 0x0800C628
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0800C680 @ =gScriptContext
	adds r0, #0x23
	ldrb r7, [r0]
	cmp r7, #1
	beq _0800C63E
	b _0800C74C
_0800C63E:
	adds r1, r6, #0
	adds r1, #0x8c
	ldr r0, _0800C684 @ =0x0000FFFF
	ldrh r1, [r1]
	cmp r1, r0
	bne _0800C650
	movs r0, #0
	bl sub_8016FEC
_0800C650:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800C74C
	adds r0, r6, #0
	adds r0, #0xc0
	ldrb r2, [r0]
	lsls r1, r2, #2
	adds r1, r1, r2
	movs r3, #0x96
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r4, r6, r1
	ldrb r0, [r6, #0xa]
	cmp r0, #0
	bne _0800C688
	bl ResetSoundControl
	ldrb r0, [r4]
	bl sub_8003D5C
	strb r7, [r6, #0xa]
	b _0800C74C
	.align 2, 0
_0800C680: .4byte gScriptContext
_0800C684: .4byte 0x0000FFFF
_0800C688:
	ldrb r0, [r4]
	movs r1, #0
	bl nullsub_8
	ldrb r0, [r4]
	bl sub_80049A0
	ldr r1, _0800C758 @ =gUnknown_03002CD0
	movs r2, #0
	movs r0, #0xc1
	adds r0, r0, r6
	mov r8, r0
	adds r4, r1, #0
	adds r4, #0x70
	movs r3, #0x80
	lsls r3, r3, #2
_0800C6A8:
	movs r0, #0
_0800C6AA:
	strh r3, [r1]
	adds r1, #8
	adds r0, #1
	cmp r0, #1
	bls _0800C6AA
	adds r2, #1
	cmp r2, #3
	bls _0800C6A8
	adds r1, r4, #0
	movs r2, #0
	ldr r3, _0800C75C @ =0x000040E0
	mov ip, r3
	movs r4, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r7, r0, #0
	movs r3, #0xa2
	lsls r3, r3, #7
_0800C6CE:
	mov r0, ip
	strh r0, [r1]
	adds r0, r4, r7
	strh r0, [r1, #2]
	strh r3, [r1, #4]
	adds r1, #8
	adds r4, #0x3c
	adds r3, #0x20
	adds r2, #1
	cmp r2, #3
	bls _0800C6CE
	movs r4, #0
	adds r0, r5, #0
	movs r1, #0xf
	bl sub_800BF90
	movs r0, #0xe0
	strb r0, [r5, #0x11]
	strb r4, [r5, #0x12]
	movs r0, #8
	strb r0, [r5, #0x13]
	strb r4, [r5, #0xc]
	strb r4, [r5, #0xd]
	movs r0, #1
	strb r0, [r5, #0x10]
	bl sub_8011CF8
	ldr r0, _0800C760 @ =gUnknown_03000844
	bl sub_8012F7C
	ldr r0, _0800C764 @ =gInvestigation
	strb r4, [r0, #6]
	movs r1, #0xf
	bl sub_800BF90
	ldr r1, _0800C768 @ =gUnknown_0814DAAC
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	movs r0, #3
	bl sub_8017154
	movs r0, #0xa
	bl sub_800BC08
	adds r0, r6, #0
	movs r1, #0
	bl sub_800E6A4
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
_0800C74C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C758: .4byte gUnknown_03002CD0
_0800C75C: .4byte 0x000040E0
_0800C760: .4byte gUnknown_03000844
_0800C764: .4byte gInvestigation
_0800C768: .4byte gUnknown_0814DAAC

	thumb_func_start sub_800C76C
sub_800C76C: @ 0x0800C76C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r0, _0800C820 @ =gUnknown_03002D70
	mov r8, r0
	movs r0, #0x14
	bl sub_800BC08
	ldr r0, _0800C824 @ =gUnknown_03000800
	ldr r0, [r0, #0x44]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0800C790
	b _0800CAFA
_0800C790:
	adds r0, r7, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800C79C
	b _0800CAFA
_0800C79C:
	ldr r1, _0800C828 @ =gJoypad
	movs r0, #8
	ldrh r2, [r1, #2]
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _0800C7CC
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C7CC
	ldr r1, _0800C82C @ =gScriptContext
	movs r0, #5
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800C7CC
	ldr r0, _0800C830 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800C87A
_0800C7CC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C7F2
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C7F2
	ldr r1, _0800C82C @ =gScriptContext
	movs r0, #5
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800C8A2
_0800C7F2:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0800C7FA
	b _0800CAFA
_0800C7FA:
	ldr r0, _0800C82C @ =gScriptContext
	adds r0, #0x23
	ldrb r6, [r0]
	cmp r6, #1
	beq _0800C806
	b _0800CAFA
_0800C806:
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	beq _0800C80E
	b _0800CAFA
_0800C80E:
	ldrb r1, [r7, #0xa]
	cmp r1, #1
	beq _0800C858
	cmp r1, #1
	bgt _0800C834
	cmp r1, #0
	beq _0800C83C
	b _0800CAFA
	.align 2, 0
_0800C820: .4byte gUnknown_03002D70
_0800C824: .4byte gUnknown_03000800
_0800C828: .4byte gJoypad
_0800C82C: .4byte gScriptContext
_0800C830: .4byte gMain
_0800C834:
	cmp r1, #2
	bne _0800C83A
	b _0800CAB4
_0800C83A:
	b _0800CAFA
_0800C83C:
	ldrb r0, [r5, #0x12]
	cmp r0, #0xf
	bhi _0800C846
	adds r0, #1
	strb r0, [r5, #0x12]
_0800C846:
	strb r1, [r5, #0x13]
	ldrb r5, [r5, #0x12]
	cmp r5, #0xf
	bhi _0800C850
	b _0800CAFA
_0800C850:
	ldrb r0, [r7, #0xa]
	adds r0, #1
	strb r0, [r7, #0xa]
	b _0800CAFA
_0800C858:
	movs r2, #3
	movs r0, #8
	ldrh r1, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C888
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C888
	ldr r0, _0800C884 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	beq _0800C888
_0800C87A:
	movs r0, #0
	bl sub_800A3A0
	b _0800CAFA
	.align 2, 0
_0800C884: .4byte gMain
_0800C888:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800C8C0
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800C8C0
_0800C8A2:
	movs r0, #0x31
	bl sub_8011150
	ldr r0, _0800C8BC @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r7, #0xc]
	movs r0, #7
	str r0, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	mov r2, r8
	strh r0, [r2]
	b _0800CAFA
	.align 2, 0
_0800C8BC: .4byte gUnknown_030037B8
_0800C8C0:
	ldrh r1, [r3, #2]
	movs r6, #1
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _0800C920
	movs r0, #0x2b
	bl sub_8011150
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_800E72C
	adds r2, r0, #0
	bl sub_8018778
	movs r0, #1
	bl sub_80053FC
	strb r6, [r5, #7]
	strb r4, [r5, #0x18]
	strb r4, [r5, #0x19]
	strb r6, [r5, #8]
	movs r0, #3
	strb r0, [r5, #0x10]
	movs r0, #0xf0
	strb r0, [r5, #0x11]
	strb r4, [r5, #0x12]
	strb r4, [r5, #0x13]
	ldr r1, _0800C914 @ =gIORegisters
	adds r2, r1, #0
	adds r2, #0x48
	ldr r0, _0800C918 @ =0x00001942
	strh r0, [r2]
	adds r1, #0x4c
	ldr r0, _0800C91C @ =0x0000071F
	strh r0, [r1]
	b _0800CAFA
	.align 2, 0
_0800C914: .4byte gIORegisters
_0800C918: .4byte 0x00001942
_0800C91C: .4byte 0x0000071F
_0800C920:
	movs r6, #2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800C944
	movs r0, #0x2c
	bl sub_8011150
	strb r6, [r7, #0xa]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_800BF90
	strb r6, [r5, #0x10]
	movs r0, #0xe0
	strb r0, [r5, #0x11]
	movs r0, #0x10
	b _0800CAF6
_0800C944:
	movs r0, #0x20
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0800C970
	ldrh r1, [r5]
	subs r0, r1, r2
	strh r0, [r5]
	ldrh r1, [r5, #2]
	cmp r1, #0xf
	bhi _0800C966
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bhi _0800C966
	movs r0, #0x3c
	strh r0, [r5]
_0800C966:
	ldrh r0, [r5]
	cmp r0, #0xe0
	bls _0800C970
	movs r0, #0
	strh r0, [r5]
_0800C970:
	movs r0, #0x10
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0800C99C
	ldrh r1, [r5]
	adds r0, r1, r2
	strh r0, [r5]
	ldrh r1, [r5, #2]
	cmp r1, #0xf
	bhi _0800C992
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bhi _0800C992
	movs r0, #0x3c
	strh r0, [r5]
_0800C992:
	ldrh r0, [r5]
	cmp r0, #0xe0
	bls _0800C99C
	movs r0, #0xe0
	strh r0, [r5]
_0800C99C:
	movs r0, #0x40
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0800C9C8
	ldrh r1, [r5, #2]
	subs r0, r1, r2
	strh r0, [r5, #2]
	ldrh r1, [r5]
	cmp r1, #0x3b
	bhi _0800C9BE
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0800C9BE
	movs r0, #0x10
	strh r0, [r5, #2]
_0800C9BE:
	ldrh r0, [r5, #2]
	cmp r0, #0x90
	bls _0800C9C8
	movs r0, #0
	strh r0, [r5, #2]
_0800C9C8:
	movs r0, #0x80
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	beq _0800C9F4
	ldrh r1, [r5, #2]
	adds r0, r1, r2
	strh r0, [r5, #2]
	ldrh r2, [r5]
	cmp r2, #0x3b
	bhi _0800C9EA
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0800C9EA
	movs r0, #0x10
	strh r0, [r5, #2]
_0800C9EA:
	ldrh r0, [r5, #2]
	cmp r0, #0x90
	bls _0800C9F4
	movs r0, #0x90
	strh r0, [r5, #2]
_0800C9F4:
	adds r0, r5, #0
	bl sub_800E72C
	adds r2, r0, #0
	cmp r2, #0x1e
	beq _0800CA1A
	ldr r0, _0800CA24 @ =gMain
	adds r0, #0xc1
	ldrb r1, [r0]
	cmp r1, #2
	bne _0800CA12
	movs r0, #0x94
	lsls r0, r0, #1
	cmp r2, r0
	beq _0800CA1A
_0800CA12:
	cmp r1, #4
	bne _0800CA28
	cmp r2, #0xdf
	bne _0800CA28
_0800CA1A:
	movs r0, #0
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x19]
	b _0800CA44
	.align 2, 0
_0800CA24: .4byte gMain
_0800CA28:
	ldrb r0, [r5, #0x19]
	adds r0, #1
	strb r0, [r5, #0x19]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0800CA44
	movs r0, #0
	strb r0, [r5, #0x19]
	ldrb r0, [r5, #0x18]
	adds r0, #4
	movs r1, #0xf
	ands r0, r1
	strb r0, [r5, #0x18]
_0800CA44:
	ldrh r0, [r5, #2]
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0x77
	bhi _0800CA5A
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #2]
	b _0800CA64
_0800CA5A:
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r0, r1
	mov r2, r8
	strh r0, [r2, #2]
_0800CA64:
	ldrb r1, [r5, #0x18]
	ldr r2, _0800CAA0 @ =0x00008190
	adds r0, r1, r2
	mov r1, r8
	strh r0, [r1, #4]
	ldrb r0, [r5, #0x1b]
	adds r0, #1
	strb r0, [r5, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800CAFA
	movs r0, #0
	strb r0, [r5, #0x1b]
	ldrb r0, [r5, #0x1a]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r5, #0x1a]
	ldr r1, _0800CAA4 @ =0x040000D4
	lsls r0, r0, #5
	ldr r2, _0800CAA8 @ =gPalExamineCursors
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _0800CAAC @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0800CAB0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800CAFA
	.align 2, 0
_0800CAA0: .4byte 0x00008190
_0800CAA4: .4byte 0x040000D4
_0800CAA8: .4byte gPalExamineCursors
_0800CAAC: .4byte 0x05000300
_0800CAB0: .4byte 0x80000010
_0800CAB4:
	ldrb r0, [r5, #0x12]
	cmp r0, #8
	bls _0800CABE
	subs r0, #1
	strb r0, [r5, #0x12]
_0800CABE:
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _0800CAFA
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
	ldr r0, _0800CB04 @ =gUnknown_03000844
	movs r1, #1
	bl sub_801208C
	movs r0, #0xc
	bl sub_800BC08
	movs r0, #1
	movs r1, #1
	bl sub_8012D38
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r7, #8]
	ldrb r2, [r5, #0xc]
	lsls r6, r2
	ldrb r1, [r5, #8]
	adds r0, r1, r6
	strb r0, [r5, #8]
	movs r0, #8
_0800CAF6:
	strb r0, [r5, #0x12]
	strb r4, [r5, #0x13]
_0800CAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB04: .4byte gUnknown_03000844

	thumb_func_start sub_800CB08
sub_800CB08: @ 0x0800CB08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	str r1, [sp]
	ldrb r0, [r0, #0xa]
	cmp r0, #6
	bls _0800CB20
	b _0800D09E
_0800CB20:
	lsls r0, r0, #2
	ldr r1, _0800CB2C @ =_0800CB30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CB2C: .4byte _0800CB30
_0800CB30: @ jump table
	.4byte _0800CB4C @ case 0
	.4byte _0800CB6E @ case 1
	.4byte _0800CC7C @ case 2
	.4byte _0800CCF4 @ case 3
	.4byte _0800CEC4 @ case 4
	.4byte _0800CF4C @ case 5
	.4byte _0800CFC0 @ case 6
_0800CB4C:
	ldr r1, [sp]
	ldrb r0, [r1, #0x12]
	cmp r0, #0xf
	bhi _0800CB58
	adds r0, #1
	strb r0, [r1, #0x12]
_0800CB58:
	movs r0, #0
	ldr r2, [sp]
	strb r0, [r2, #0x13]
	ldrb r3, [r2, #0x12]
	cmp r3, #0xf
	bhi _0800CB66
	b _0800D09E
_0800CB66:
	mov r6, r8
	ldrb r0, [r6, #0xa]
	adds r0, #1
	b _0800D09C
_0800CB6E:
	ldr r4, _0800CBFC @ =gUnknown_03002CD0
	mov r1, r8
	adds r1, #0xc0
	ldrb r7, [r1]
	lsls r0, r7, #2
	adds r1, r7, #0
	adds r0, r0, r1
	mov r1, r8
	adds r5, r0, r1
	ldr r2, _0800CC00 @ =0x0000012D
	adds r5, r5, r2
	movs r6, #0
	ldr r3, [sp]
	adds r3, #0x14
	mov sb, r3
_0800CB8C:
	lsls r0, r6, #0xb
	ldr r1, _0800CC04 @ =0x06013400
	adds r7, r0, r1
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0800CC1C
	movs r0, #1
	mov r2, sb
	strb r0, [r2]
	ldr r2, _0800CC08 @ =gUnknown_0200AFC0
	ldr r1, _0800CC0C @ =gUnknown_08026960
	ldrb r3, [r5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #8]
	bl LZ77UnCompWram
	ldr r1, _0800CC10 @ =0x040000D4
	ldr r2, [sp, #8]
	str r2, [r1]
	str r7, [r1, #4]
	ldr r0, _0800CC14 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	lsls r0, r6, #2
	adds r5, #1
	movs r7, #0x81
	lsls r7, r7, #7
	adds r7, r7, r0
	mov ip, r7
	movs r2, #0xd0
	lsls r2, r2, #1
	lsls r0, r6, #6
	str r0, [sp, #0xc]
	movs r1, #0x90
	lsls r1, r1, #8
	mov sl, r1
	ldr r1, _0800CC18 @ =0x0000C038
_0800CBDE:
	mov r7, ip
	strh r7, [r4]
	strh r1, [r4, #2]
	ldr r7, [sp, #0xc]
	adds r0, r2, r7
	mov r7, sl
	orrs r0, r7
	strh r0, [r4, #4]
	adds r4, #8
	adds r2, #0x20
	adds r1, #0x40
	adds r3, #1
	cmp r3, #1
	bls _0800CBDE
	b _0800CC30
	.align 2, 0
_0800CBFC: .4byte gUnknown_03002CD0
_0800CC00: .4byte 0x0000012D
_0800CC04: .4byte 0x06013400
_0800CC08: .4byte gUnknown_0200AFC0
_0800CC0C: .4byte gUnknown_08026960
_0800CC10: .4byte 0x040000D4
_0800CC14: .4byte 0x80000400
_0800CC18: .4byte 0x0000C038
_0800CC1C:
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #2]
	adds r4, #8
	strh r0, [r4, #2]
	adds r4, #8
	adds r5, #1
_0800CC30:
	movs r2, #1
	add sb, r2
	adds r6, #1
	cmp r6, #3
	bls _0800CB8C
	movs r1, #0
	ldr r3, [sp]
	strb r1, [r3, #4]
	mov r6, r8
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	movs r6, #0
	ldr r2, _0800CC74 @ =gUnknown_03003C54
_0800CC4E:
	adds r0, r6, r2
	ldrb r0, [r0]
	adds r1, r0, r1
	adds r6, #1
	cmp r6, #3
	bls _0800CC4E
	cmp r1, #0
	beq _0800CC60
	b _0800D09E
_0800CC60:
	movs r0, #1
	bl sub_80053FC
	ldr r1, _0800CC78 @ =gInvestigation
	movs r0, #4
	strb r0, [r1, #0x10]
	movs r0, #0x1e
	bl sub_8018778
	b _0800D09E
	.align 2, 0
_0800CC74: .4byte gUnknown_03003C54
_0800CC78: .4byte gInvestigation
_0800CC7C:
	ldr r5, _0800CCEC @ =gUnknown_03002D48
	mov r7, r8
	ldrb r7, [r7, #0xb]
	cmp r7, #0xc
	bhi _0800CCB0
	adds r4, r5, #0
	subs r4, #0x78
	movs r6, #0
	movs r2, #4
_0800CC8E:
	movs r3, #0
	subs r0, r2, r6
	lsls r1, r0, #1
_0800CC94:
	ldrh r7, [r4]
	subs r0, r7, r1
	strh r0, [r4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800CC94
	adds r6, #1
	cmp r6, #3
	bls _0800CC8E
	mov r1, r8
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800CCB0:
	adds r4, r5, #0
	ldrh r0, [r4, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	subs r0, #6
	ldr r1, _0800CCF0 @ =0x000001FF
	ands r0, r1
	strh r0, [r4, #2]
	cmp r0, #0xff
	bls _0800CCCA
	movs r0, #0
	strh r0, [r4, #2]
_0800CCCA:
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0800CCE4
	mov r3, r8
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bls _0800CCE4
	mov r6, r8
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r6, #0xb]
_0800CCE4:
	ldrh r7, [r4, #2]
	orrs r2, r7
	strh r2, [r4, #2]
	b _0800D09E
	.align 2, 0
_0800CCEC: .4byte gUnknown_03002D48
_0800CCF0: .4byte 0x000001FF
_0800CCF4:
	mov r0, r8
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800CD00
	b _0800D09E
_0800CD00:
	movs r4, #0
	movs r6, #0
	ldr r1, _0800CD48 @ =gUnknown_03003C54
_0800CD06:
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r4, r0, r4
	adds r6, #1
	cmp r6, #3
	bls _0800CD06
	cmp r4, #0
	bne _0800CD54
	ldr r1, _0800CD4C @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800CD24
	b _0800D0F8
_0800CD24:
	movs r0, #0
	bl sub_80053FC
	ldr r1, _0800CD50 @ =gInvestigation
	movs r0, #4
	strb r0, [r1, #0x10]
	movs r0, #0xe0
	strb r0, [r1, #0x11]
	movs r0, #0x10
	strb r0, [r1, #0x12]
	strb r4, [r1, #0x13]
	mov r1, r8
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	strb r4, [r1, #0xb]
	b _0800D0F8
	.align 2, 0
_0800CD48: .4byte gUnknown_03003C54
_0800CD4C: .4byte gScriptContext
_0800CD50: .4byte gInvestigation
_0800CD54:
	ldr r0, _0800CD84 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CD8C
	mov r0, r8
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800CD70
	b _0800D09E
_0800CD70:
	ldr r0, _0800CD88 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800CD7A
	b _0800D09E
_0800CD7A:
	movs r0, #0
	bl sub_800A3A0
	b _0800D09E
	.align 2, 0
_0800CD84: .4byte gJoypad
_0800CD88: .4byte gMain
_0800CD8C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CDDE
	mov r0, r8
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800CDA6
	b _0800D09E
_0800CDA6:
	movs r0, #0x31
	bl sub_8011150
	movs r0, #6
	mov r2, r8
	strb r0, [r2, #0xa]
	ldr r0, _0800CDD0 @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r2, #0xc]
	movs r0, #7
	str r0, [r2, #8]
	ldr r4, _0800CDD4 @ =gUnknown_03002CD0
	movs r6, #0
	movs r0, #0x96
	lsls r0, r0, #1
_0800CDC4:
	strh r0, [r4, #2]
	adds r4, #8
	adds r6, #1
	cmp r6, #7
	bls _0800CDC4
	b _0800D09E
	.align 2, 0
_0800CDD0: .4byte gUnknown_030037B8
_0800CDD4: .4byte gUnknown_03002CD0
_0800CDD8:
	ldr r6, [sp]
	strb r3, [r6, #4]
	b _0800CE08
_0800CDDE:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800CE1A
	movs r6, #0
	ldr r7, [sp]
	ldrb r0, [r7, #4]
	subs r3, r0, #1
	adds r2, r0, #0
	movs r4, #3
	adds r1, r7, #0
	adds r1, #0x14
_0800CDF6:
	ands r3, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800CDD8
	subs r3, #1
	adds r6, #1
	cmp r6, #3
	bls _0800CDF6
_0800CE08:
	ldr r0, [sp]
	ldrb r0, [r0, #4]
	cmp r2, r0
	bne _0800CE12
	b _0800D09E
_0800CE12:
	b _0800CE4E
_0800CE14:
	ldr r1, [sp]
	strb r3, [r1, #4]
	b _0800CE44
_0800CE1A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CE56
	movs r6, #0
	ldr r2, [sp]
	ldrb r0, [r2, #4]
	adds r3, r0, #1
	adds r2, r0, #0
	movs r4, #3
	ldr r1, [sp]
	adds r1, #0x14
_0800CE32:
	ands r3, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800CE14
	adds r3, #1
	adds r6, #1
	cmp r6, #3
	bls _0800CE32
_0800CE44:
	ldr r3, [sp]
	ldrb r3, [r3, #4]
	cmp r2, r3
	bne _0800CE4E
	b _0800D09E
_0800CE4E:
	movs r0, #0x2a
	bl sub_8011150
	b _0800D09E
_0800CE56:
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	beq _0800CEA8
	movs r0, #0x2b
	bl sub_8011150
	mov r2, r8
	adds r2, #0xc0
	ldr r6, [sp]
	ldrb r3, [r6, #4]
	adds r3, #1
	ldrb r7, [r2]
	lsls r1, r7, #2
	adds r0, r7, #0
	adds r1, r1, r0
	adds r1, r3, r1
	movs r0, #0x96
	lsls r0, r0, #1
	add r0, r8
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0x14
	bl sub_80113B8
	movs r0, #0xd
	bl sub_800BC08
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r0, _0800CEA4 @ =0x00000504
	mov r1, r8
	str r0, [r1, #8]
	b _0800D09E
	.align 2, 0
_0800CEA4: .4byte 0x00000504
_0800CEA8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800CEB2
	b _0800D09E
_0800CEB2:
	movs r0, #0x2c
	bl sub_8011150
	mov r2, r8
	ldrb r0, [r2, #0xa]
	adds r0, #1
	strb r0, [r2, #0xa]
	strb r4, [r2, #0xb]
	b _0800D09E
_0800CEC4:
	ldr r5, _0800CF44 @ =gUnknown_03002D48
	mov r3, r8
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800CEFA
	adds r4, r5, #0
	subs r4, #0x78
	movs r6, #0
	movs r2, #4
_0800CED6:
	movs r3, #0
	subs r0, r2, r6
	lsls r1, r0, #1
_0800CEDC:
	ldrh r0, [r4]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800CEDC
	adds r6, #1
	cmp r6, #3
	bls _0800CED6
	mov r6, r8
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800CEFA:
	adds r4, r5, #0
	ldrh r0, [r4, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	adds r0, #6
	ldr r1, _0800CF48 @ =0x000001FF
	ands r0, r1
	strh r0, [r4, #2]
	cmp r0, #0x3b
	bls _0800CF3A
	movs r0, #0x3c
	strh r0, [r4, #2]
	ldr r0, [sp]
	movs r1, #0xd
	str r2, [sp, #8]
	bl sub_800BF90
	movs r0, #2
	ldr r7, [sp]
	strb r0, [r7, #0x10]
	movs r0, #0xe0
	strb r0, [r7, #0x11]
	movs r0, #0x10
	strb r0, [r7, #0x12]
	movs r0, #0
	strb r0, [r7, #0x13]
	mov r1, r8
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	ldr r2, [sp, #8]
_0800CF3A:
	ldrh r3, [r4, #2]
	orrs r2, r3
	strh r2, [r4, #2]
	b _0800D09E
	.align 2, 0
_0800CF44: .4byte gUnknown_03002D48
_0800CF48: .4byte 0x000001FF
_0800CF4C:
	mov r6, r8
	ldrb r6, [r6, #0xb]
	cmp r6, #0xc
	bhi _0800CF7E
	ldr r4, _0800CFBC @ =gUnknown_03002CD0
	movs r6, #0
	movs r2, #4
_0800CF5A:
	movs r3, #0
	subs r0, r2, r6
	lsls r1, r0, #1
_0800CF60:
	ldrh r0, [r4]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800CF60
	adds r6, #1
	cmp r6, #3
	bls _0800CF5A
	mov r7, r8
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
_0800CF7E:
	ldr r1, [sp]
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bls _0800CF8A
	subs r0, #1
	strb r0, [r1, #0x12]
_0800CF8A:
	ldr r2, [sp]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _0800CF94
	b _0800D09E
_0800CF94:
	mov r3, r8
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800CF9E
	b _0800D09E
_0800CF9E:
	movs r0, #0x82
	lsls r0, r0, #1
	mov r6, r8
	str r0, [r6, #8]
	movs r0, #1
	ldrb r7, [r2, #0xc]
	lsls r0, r7
	ldrb r2, [r2, #8]
	adds r0, r2, r0
	ldr r3, [sp]
	strb r0, [r3, #8]
	movs r0, #8
	strb r0, [r3, #0x12]
	strb r1, [r3, #0x13]
	b _0800D09E
	.align 2, 0
_0800CFBC: .4byte gUnknown_03002CD0
_0800CFC0:
	ldr r4, _0800D050 @ =gUnknown_03002CD0
	mov r1, r8
	adds r1, #0xc0
	ldrb r6, [r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	mov r7, r8
	adds r5, r0, r7
	ldr r0, _0800D054 @ =0x0000012D
	adds r5, r5, r0
	movs r6, #0
	ldr r1, [sp]
	adds r1, #0x14
	mov sb, r1
	movs r2, #0
	str r2, [sp, #4]
_0800CFE0:
	lsls r0, r6, #0xb
	ldr r3, _0800D058 @ =0x06013400
	adds r7, r0, r3
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0800D074
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	ldr r2, _0800D05C @ =gUnknown_0200AFC0
	ldr r1, _0800D060 @ =gUnknown_08026960
	ldrb r3, [r5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #8]
	bl LZ77UnCompWram
	ldr r1, _0800D064 @ =0x040000D4
	ldr r2, [sp, #8]
	str r2, [r1]
	str r7, [r1, #4]
	ldr r0, _0800D068 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	adds r5, #1
	ldr r7, [sp, #4]
	ldr r0, _0800D06C @ =0x00004018
	adds r7, r7, r0
	mov ip, r7
	movs r2, #0xd0
	lsls r2, r2, #1
	lsls r1, r6, #6
	str r1, [sp, #0xc]
	movs r7, #0x90
	lsls r7, r7, #8
	mov sl, r7
	ldr r1, _0800D070 @ =0x0000C038
_0800D030:
	mov r0, ip
	strh r0, [r4]
	strh r1, [r4, #2]
	ldr r7, [sp, #0xc]
	adds r0, r2, r7
	mov r7, sl
	orrs r0, r7
	strh r0, [r4, #4]
	adds r4, #8
	adds r2, #0x20
	adds r1, #0x40
	adds r3, #1
	cmp r3, #1
	bls _0800D030
	b _0800D088
	.align 2, 0
_0800D050: .4byte gUnknown_03002CD0
_0800D054: .4byte 0x0000012D
_0800D058: .4byte 0x06013400
_0800D05C: .4byte gUnknown_0200AFC0
_0800D060: .4byte gUnknown_08026960
_0800D064: .4byte 0x040000D4
_0800D068: .4byte 0x80000400
_0800D06C: .4byte 0x00004018
_0800D070: .4byte 0x0000C038
_0800D074:
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #2]
	adds r4, #8
	strh r0, [r4, #2]
	adds r4, #8
	adds r5, #1
_0800D088:
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #4]
	adds r3, #0x1e
	str r3, [sp, #4]
	adds r6, #1
	cmp r6, #3
	bls _0800CFE0
	movs r0, #3
	mov r6, r8
_0800D09C:
	strb r0, [r6, #0xa]
_0800D09E:
	ldr r4, _0800D0CC @ =gUnknown_03002CD0
	movs r6, #0
_0800D0A2:
	ldr r7, [sp]
	ldrb r7, [r7, #4]
	cmp r6, r7
	bne _0800D0D4
	movs r3, #0
	adds r2, r6, #1
	ldr r5, _0800D0D0 @ =0x00000FFF
	movs r0, #0x90
	lsls r0, r0, #8
	adds r1, r0, #0
_0800D0B6:
	adds r0, r5, #0
	ldrh r6, [r4, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r4, #4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800D0B6
	b _0800D0F2
	.align 2, 0
_0800D0CC: .4byte gUnknown_03002CD0
_0800D0D0: .4byte 0x00000FFF
_0800D0D4:
	movs r3, #0
	adds r2, r6, #1
	ldr r5, _0800D108 @ =0x00000FFF
	movs r7, #0xa0
	lsls r7, r7, #8
	adds r1, r7, #0
_0800D0E0:
	adds r0, r5, #0
	ldrh r6, [r4, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r4, #4]
	adds r4, #8
	adds r3, #1
	cmp r3, #1
	bls _0800D0E0
_0800D0F2:
	adds r6, r2, #0
	cmp r6, #3
	bls _0800D0A2
_0800D0F8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D108: .4byte 0x00000FFF

	thumb_func_start sub_800D10C
sub_800D10C: @ 0x0800D10C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	str r1, [sp]
	ldrb r0, [r0, #0xa]
	cmp r0, #8
	bls _0800D126
	bl _0800DB04
_0800D126:
	lsls r0, r0, #2
	ldr r1, _0800D130 @ =_0800D134
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D130: .4byte _0800D134
_0800D134: @ jump table
	.4byte _0800D158 @ case 0
	.4byte _0800D17E @ case 1
	.4byte _0800D2D4 @ case 2
	.4byte _0800D34C @ case 3
	.4byte _0800D654 @ case 4
	.4byte _0800D6DC @ case 5
	.4byte _0800D78C @ case 6
	.4byte _0800D9A8 @ case 7
	.4byte _0800D9FC @ case 8
_0800D158:
	ldr r1, [sp]
	ldrb r0, [r1, #0x12]
	cmp r0, #0xf
	bhi _0800D164
	adds r0, #1
	strb r0, [r1, #0x12]
_0800D164:
	movs r0, #0
	ldr r2, [sp]
	strb r0, [r2, #0x13]
	ldrb r3, [r2, #0x12]
	cmp r3, #0xf
	bhi _0800D174
	bl _0800DB04
_0800D174:
	mov r4, sl
	ldrb r0, [r4, #0xa]
	adds r0, #1
	bl sub_0800DB02
_0800D17E:
	ldr r3, _0800D230 @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	ldr r5, _0800D234 @ =gUnknown_03002CD0
	ldr r6, [sp]
	adds r6, #0x14
	str r6, [sp, #8]
	cmp r0, #0xff
	beq _0800D1B4
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800D238 @ =gUnknown_03000852
_0800D198:
	cmp r2, r1
	bne _0800D1AA
	ldrb r0, [r4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	bne _0800D1AA
	ldrb r6, [r3, #3]
	cmp r6, #1
	beq _0800D1B4
_0800D1AA:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800D198
_0800D1B4:
	adds r6, r3, #4
	movs r7, #0
	ldr r0, [sp, #8]
	mov r8, r0
_0800D1BC:
	lsls r0, r7, #0xb
	ldr r1, _0800D23C @ =0x06013400
	adds r1, r1, r0
	mov sb, r1
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0800D254
	movs r0, #1
	mov r2, r8
	strb r0, [r2]
	ldr r2, _0800D240 @ =gUnknown_0200AFC0
	ldr r1, _0800D244 @ =gUnknown_08026810
	ldrb r3, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl LZ77UnCompWram
	ldr r1, _0800D248 @ =0x040000D4
	ldr r2, [sp, #0x10]
	str r2, [r1]
	mov r4, sb
	str r4, [r1, #4]
	ldr r0, _0800D24C @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	lsls r0, r7, #2
	adds r2, r6, #1
	movs r6, #0x81
	lsls r6, r6, #7
	adds r6, r6, r0
	mov ip, r6
	movs r3, #0xd0
	lsls r3, r3, #1
	lsls r0, r7, #6
	str r0, [sp, #0x18]
	movs r1, #0x90
	lsls r1, r1, #8
	mov sb, r1
	ldr r1, _0800D250 @ =0x0000C038
_0800D212:
	mov r6, ip
	strh r6, [r5]
	strh r1, [r5, #2]
	ldr r6, [sp, #0x18]
	adds r0, r3, r6
	mov r6, sb
	orrs r0, r6
	strh r0, [r5, #4]
	adds r5, #8
	adds r3, #0x20
	adds r1, #0x40
	adds r4, #1
	cmp r4, #1
	bls _0800D212
	b _0800D268
	.align 2, 0
_0800D230: .4byte gUnknown_03002920
_0800D234: .4byte gUnknown_03002CD0
_0800D238: .4byte gUnknown_03000852
_0800D23C: .4byte 0x06013400
_0800D240: .4byte gUnknown_0200AFC0
_0800D244: .4byte gUnknown_08026810
_0800D248: .4byte 0x040000D4
_0800D24C: .4byte 0x80000400
_0800D250: .4byte 0x0000C038
_0800D254:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	adds r5, #8
	strh r0, [r5, #2]
	adds r5, #8
	adds r2, r6, #1
_0800D268:
	adds r6, r2, #0
	movs r2, #1
	add r8, r2
	adds r7, #1
	cmp r7, #3
	bls _0800D1BC
	ldr r1, _0800D2A4 @ =0x040000D4
	ldr r0, _0800D2A8 @ =gGfxCheckmark
	str r0, [r1]
	ldr r0, _0800D2AC @ =0x06015400
	str r0, [r1, #4]
	ldr r0, _0800D2B0 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800D2B4 @ =gPalCheckmark
	str r0, [r1]
	ldr r0, _0800D2B8 @ =0x05000360
	str r0, [r1, #4]
	ldr r0, _0800D2BC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, [sp]
	ldrb r1, [r3, #5]
	adds r0, r1, #0
	cmp r0, #0
	beq _0800D2C0
	movs r0, #0
	strb r1, [r3, #4]
	strb r0, [r3, #5]
	b _0800D2C4
	.align 2, 0
_0800D2A4: .4byte 0x040000D4
_0800D2A8: .4byte gGfxCheckmark
_0800D2AC: .4byte 0x06015400
_0800D2B0: .4byte 0x80000100
_0800D2B4: .4byte gPalCheckmark
_0800D2B8: .4byte 0x05000360
_0800D2BC: .4byte 0x80000010
_0800D2C0:
	ldr r4, [sp]
	strb r0, [r4, #4]
_0800D2C4:
	mov r6, sl
	ldrb r0, [r6, #0xa]
	adds r0, #1
	movs r1, #0
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	bl _0800DB04
_0800D2D4:
	ldr r3, _0800D344 @ =gUnknown_03002D50
	mov r0, sl
	ldrb r0, [r0, #0xb]
	cmp r0, #0xc
	bhi _0800D308
	adds r5, r3, #0
	subs r5, #0x80
	movs r7, #0
	movs r2, #4
_0800D2E6:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D2EC:
	ldrh r6, [r5]
	subs r0, r6, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D2EC
	adds r7, #1
	cmp r7, #3
	bls _0800D2E6
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D308:
	adds r5, r3, #0
	ldrh r0, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	subs r0, #9
	ldr r1, _0800D348 @ =0x000001FF
	ands r0, r1
	strh r0, [r5, #2]
	cmp r0, #0xff
	bls _0800D322
	movs r0, #0
	strh r0, [r5, #2]
_0800D322:
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _0800D33C
	mov r3, sl
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bls _0800D33C
	mov r4, sl
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	movs r0, #0
	strb r0, [r4, #0xb]
_0800D33C:
	ldrh r6, [r5, #2]
	orrs r2, r6
	strh r2, [r5, #2]
	b _0800DB04
	.align 2, 0
_0800D344: .4byte gUnknown_03002D50
_0800D348: .4byte 0x000001FF
_0800D34C:
	ldr r1, _0800D3D8 @ =0x040000D4
	ldr r0, _0800D3DC @ =gGfxCheckmark
	str r0, [r1]
	ldr r0, _0800D3E0 @ =0x06015400
	str r0, [r1, #4]
	ldr r0, _0800D3E4 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800D3E8 @ =gPalCheckmark
	str r0, [r1]
	ldr r0, _0800D3EC @ =0x05000360
	str r0, [r1, #4]
	ldr r0, _0800D3F0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0800D3F4 @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	mov r5, sl
	adds r5, #0x8a
	cmp r0, #0xff
	beq _0800D39C
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800D3F8 @ =gUnknown_03000852
_0800D380:
	cmp r2, r1
	bne _0800D392
	ldrb r0, [r4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	bne _0800D392
	ldrb r6, [r3, #3]
	cmp r6, #1
	beq _0800D39C
_0800D392:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800D380
_0800D39C:
	movs r0, #1
	mov sb, r0
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800D3A8
	b _0800D57C
_0800D3A8:
	ldr r0, _0800D3FC @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D404
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800D3C4
	b _0800D57C
_0800D3C4:
	ldr r0, _0800D400 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	bne _0800D3CE
	b _0800D57C
_0800D3CE:
	movs r0, #0
	str r3, [sp, #0x14]
	bl sub_800A3A0
	b _0800D57A
	.align 2, 0
_0800D3D8: .4byte 0x040000D4
_0800D3DC: .4byte gGfxCheckmark
_0800D3E0: .4byte 0x06015400
_0800D3E4: .4byte 0x80000100
_0800D3E8: .4byte gPalCheckmark
_0800D3EC: .4byte 0x05000360
_0800D3F0: .4byte 0x80000010
_0800D3F4: .4byte gUnknown_03002920
_0800D3F8: .4byte gUnknown_03000852
_0800D3FC: .4byte gJoypad
_0800D400: .4byte gMain
_0800D404:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D45E
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800D41E
	b _0800D57C
_0800D41E:
	movs r0, #0x31
	str r3, [sp, #0x14]
	bl sub_8011150
	movs r0, #8
	mov r1, sl
	strb r0, [r1, #0xa]
	ldr r0, _0800D450 @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r1, #0xc]
	movs r0, #7
	str r0, [r1, #8]
	ldr r5, _0800D454 @ =gUnknown_03002CD0
	movs r7, #0
	movs r0, #0x96
	lsls r0, r0, #1
	ldr r3, [sp, #0x14]
_0800D440:
	strh r0, [r5, #2]
	adds r5, #8
	adds r7, #1
	cmp r7, #7
	bls _0800D440
	movs r2, #0
	mov sb, r2
	b _0800D57C
	.align 2, 0
_0800D450: .4byte gUnknown_030037B8
_0800D454: .4byte gUnknown_03002CD0
_0800D458:
	ldr r6, [sp]
	strb r4, [r6, #4]
	b _0800D486
_0800D45E:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800D49E
	movs r7, #0
	ldr r1, [sp]
	ldrb r0, [r1, #4]
	subs r4, r0, #1
	adds r2, r0, #0
	movs r5, #3
	adds r1, #0x14
_0800D474:
	ands r4, r5
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D458
	subs r4, #1
	adds r7, #1
	cmp r7, #3
	bls _0800D474
_0800D486:
	ldr r4, [sp]
	ldrb r4, [r4, #4]
	cmp r2, r4
	beq _0800D57C
	movs r0, #0x2a
	str r3, [sp, #0x14]
	bl sub_8011150
	b _0800D57A
_0800D498:
	ldr r6, [sp]
	strb r4, [r6, #4]
	b _0800D4CA
_0800D49E:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0800D4DC
	movs r7, #0
	ldr r1, [sp]
	ldrb r0, [r1, #4]
	adds r4, r0, #1
	adds r2, r0, #0
	movs r5, #3
	adds r1, #0x14
_0800D4B8:
	ands r4, r5
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D498
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bls _0800D4B8
_0800D4CA:
	ldr r4, [sp]
	ldrb r4, [r4, #4]
	cmp r2, r4
	beq _0800D57C
	movs r0, #0x2a
	str r3, [sp, #0x14]
	bl sub_8011150
	b _0800D57A
_0800D4DC:
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0800D55C
	movs r0, #0x2b
	str r3, [sp, #0x14]
	bl sub_8011150
	ldr r6, [sp]
	ldrb r6, [r6, #4]
	lsls r1, r6, #1
	ldr r3, [sp, #0x14]
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r0, r1
	ldrh r2, [r0]
	adds r0, r2, #0
	bl sub_8018778
	movs r0, #1
	bl sub_80053FC
	ldr r3, [sp, #0x14]
	adds r4, r3, #0
	adds r4, #8
	ldr r1, [sp]
	ldrb r1, [r1, #4]
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #2
	bl sub_80065E8
	str r4, [sp, #4]
	ldr r3, [sp, #0x14]
	cmp r0, #0
	bne _0800D53A
	ldr r2, [sp]
	ldrb r2, [r2, #4]
	adds r0, r2, r4
	ldrb r1, [r0]
	movs r0, #2
	movs r2, #1
	bl sub_80065AC
	ldr r3, [sp, #0x14]
_0800D53A:
	ldr r0, [sp]
	movs r1, #4
	str r3, [sp, #0x14]
	bl sub_800BF90
	movs r0, #0xf0
	ldr r4, [sp]
	strb r0, [r4, #0x11]
	movs r0, #3
	strb r0, [r4, #0x10]
	movs r0, #6
	mov r6, sl
	strb r0, [r6, #0xa]
	strb r5, [r6, #0xb]
	movs r0, #0
	mov sb, r0
	b _0800D57A
_0800D55C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800D57C
	movs r0, #0x2c
	str r3, [sp, #0x14]
	bl sub_8011150
	mov r1, sl
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	strb r4, [r1, #0xb]
	movs r2, #0
	mov sb, r2
_0800D57A:
	ldr r3, [sp, #0x14]
_0800D57C:
	ldr r5, _0800D5EC @ =gUnknown_03002CB0
	mov r4, sb
	cmp r4, #0
	beq _0800D642
	movs r7, #0
	adds r6, r3, #0
	adds r6, #8
	str r6, [sp, #4]
	ldr r6, _0800D5F0 @ =0x040000D4
	movs r0, #0x10
	mov sl, r0
	movs r1, #0x16
	mov sb, r1
	adds r3, #0xc
	mov r8, r3
_0800D59A:
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	movs r4, #0
_0800D5A2:
	ldr r2, [sp, #4]
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r0, #2
	bl sub_80065E8
	cmp r0, #0
	beq _0800D628
	mov r3, r8
	ldrh r0, [r3]
	bl sub_800BF4C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800D610
	ldr r0, _0800D5F4 @ =gGfxInvestigationPsycheLock
	str r0, [r6]
	ldr r0, _0800D5F8 @ =0x06013000
	str r0, [r6, #4]
	ldr r0, _0800D5FC @ =0x80000100
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	ldr r0, _0800D600 @ =gPalInvestigationPsycheLock
	str r0, [r6]
	ldr r0, _0800D604 @ =0x050002E0
	str r0, [r6, #4]
	ldr r0, _0800D608 @ =0x80000010
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r4, sb
	strh r4, [r5]
	ldr r0, _0800D60C @ =0x00008024
	strh r0, [r5, #2]
	movs r0, #0xe3
	lsls r0, r0, #7
	strh r0, [r5, #4]
	b _0800D62E
	.align 2, 0
_0800D5EC: .4byte gUnknown_03002CB0
_0800D5F0: .4byte 0x040000D4
_0800D5F4: .4byte gGfxInvestigationPsycheLock
_0800D5F8: .4byte 0x06013000
_0800D5FC: .4byte 0x80000100
_0800D600: .4byte gPalInvestigationPsycheLock
_0800D604: .4byte 0x050002E0
_0800D608: .4byte 0x80000010
_0800D60C: .4byte 0x00008024
_0800D610:
	mov r0, sl
	strh r0, [r5]
	ldr r0, _0800D620 @ =0x00008030
	strh r0, [r5, #2]
	ldr r0, _0800D624 @ =0x0000B2A0
	strh r0, [r5, #4]
	b _0800D62E
	.align 2, 0
_0800D620: .4byte 0x00008030
_0800D624: .4byte 0x0000B2A0
_0800D628:
	adds r4, #1
	cmp r4, #3
	bls _0800D5A2
_0800D62E:
	adds r5, #8
	movs r1, #0x1e
	add sl, r1
	add sb, r1
	movs r2, #2
	add r8, r2
	adds r7, #1
	cmp r7, #3
	bls _0800D59A
	b _0800DB04
_0800D642:
	movs r7, #0
	movs r0, #0x96
	lsls r0, r0, #1
_0800D648:
	strh r0, [r5, #2]
	adds r5, #8
	adds r7, #1
	cmp r7, #3
	bls _0800D648
	b _0800DB04
_0800D654:
	ldr r3, _0800D6D4 @ =gUnknown_03002D50
	mov r4, sl
	ldrb r4, [r4, #0xb]
	cmp r4, #0xc
	bhi _0800D68A
	adds r5, r3, #0
	subs r5, #0x80
	movs r7, #0
	movs r2, #4
_0800D666:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D66C:
	ldrh r0, [r5]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D66C
	adds r7, #1
	cmp r7, #3
	bls _0800D666
	mov r6, sl
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800D68A:
	adds r5, r3, #0
	ldrh r0, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	adds r0, #9
	ldr r1, _0800D6D8 @ =0x000001FF
	ands r0, r1
	strh r0, [r5, #2]
	cmp r0, #0x77
	bls _0800D6CA
	movs r0, #0x78
	strh r0, [r5, #2]
	ldr r0, [sp]
	movs r1, #0xb
	str r2, [sp, #0x10]
	bl sub_800BF90
	movs r0, #2
	ldr r1, [sp]
	strb r0, [r1, #0x10]
	movs r0, #0xe0
	strb r0, [r1, #0x11]
	movs r0, #0x10
	strb r0, [r1, #0x12]
	movs r0, #0
	strb r0, [r1, #0x13]
	mov r3, sl
	ldrb r0, [r3, #0xa]
	adds r0, #1
	strb r0, [r3, #0xa]
	ldr r2, [sp, #0x10]
_0800D6CA:
	ldrh r4, [r5, #2]
	orrs r2, r4
	strh r2, [r5, #2]
	b _0800DB04
	.align 2, 0
_0800D6D4: .4byte gUnknown_03002D50
_0800D6D8: .4byte 0x000001FF
_0800D6DC:
	mov r6, sl
	ldrb r6, [r6, #0xb]
	cmp r6, #0xc
	bhi _0800D70E
	ldr r5, _0800D76C @ =gUnknown_03002CD0
	movs r7, #0
	movs r2, #4
_0800D6EA:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D6F0:
	ldrh r0, [r5]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D6F0
	adds r7, #1
	cmp r7, #3
	bls _0800D6EA
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D70E:
	ldr r2, [sp]
	ldrb r0, [r2, #0x12]
	cmp r0, #8
	bls _0800D71A
	subs r0, #1
	strb r0, [r2, #0x12]
_0800D71A:
	ldr r3, [sp]
	ldrb r2, [r3, #0x10]
	cmp r2, #0
	beq _0800D724
	b _0800DB04
_0800D724:
	mov r4, sl
	ldrb r4, [r4, #0xb]
	cmp r4, #0xc
	bhi _0800D72E
	b _0800DB04
_0800D72E:
	ldr r1, _0800D770 @ =0x040000D4
	ldr r0, _0800D774 @ =gGfx4bppInvestigationScrollButton
	str r0, [r1]
	ldr r0, _0800D778 @ =0x06013000
	str r0, [r1, #4]
	ldr r0, _0800D77C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800D780 @ =gPalInvestigationScrollPrompt
	str r0, [r1]
	ldr r0, _0800D784 @ =0x050002E0
	str r0, [r1, #4]
	ldr r0, _0800D788 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x82
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #8]
	movs r0, #1
	ldrb r1, [r3, #0xc]
	lsls r0, r1
	ldrb r3, [r3, #8]
	adds r0, r3, r0
	ldr r4, [sp]
	strb r0, [r4, #8]
	movs r0, #8
	strb r0, [r4, #0x12]
	strb r2, [r4, #0x13]
	b _0800DB04
	.align 2, 0
_0800D76C: .4byte gUnknown_03002CD0
_0800D770: .4byte 0x040000D4
_0800D774: .4byte gGfx4bppInvestigationScrollButton
_0800D778: .4byte 0x06013000
_0800D77C: .4byte 0x80000100
_0800D780: .4byte gPalInvestigationScrollPrompt
_0800D784: .4byte 0x050002E0
_0800D788: .4byte 0x80000010
_0800D78C:
	mov r0, sl
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800D798
	b _0800DB5C
_0800D798:
	ldr r1, _0800D7D0 @ =gJoypad
	movs r0, #8
	ldrh r6, [r1, #2]
	ands r0, r6
	adds r2, r1, #0
	ldr r6, _0800D7D4 @ =gScriptContext
	cmp r0, #0
	beq _0800D7DC
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800D7DC
	movs r0, #5
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800D7DC
	ldr r0, _0800D7D8 @ =gMain
	ldrh r0, [r0, #0x36]
	cmp r0, #0x80
	beq _0800D7DC
	movs r0, #0
	bl sub_800A3A0
	b _0800DB5C
	.align 2, 0
_0800D7D0: .4byte gJoypad
_0800D7D4: .4byte gScriptContext
_0800D7D8: .4byte gMain
_0800D7DC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r2, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800D818
	mov r0, sl
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800D818
	movs r0, #5
	ldrh r2, [r6, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800D818
	movs r0, #0x31
	bl sub_8011150
	ldr r0, _0800D814 @ =gUnknown_030037B8
	ldr r0, [r0]
	mov r3, sl
	str r0, [r3, #0xc]
	movs r0, #7
	str r0, [r3, #8]
	b _0800DB5C
	.align 2, 0
_0800D814: .4byte gUnknown_030037B8
_0800D818:
	mov r4, sl
	ldrb r4, [r4, #0xb]
	cmp r4, #0xc
	bhi _0800D84C
	ldr r5, _0800D924 @ =gUnknown_03002CD0
	movs r7, #0
	movs r3, #4
_0800D826:
	movs r4, #0
	adds r2, r7, #1
	subs r0, r3, r7
	lsls r1, r0, #1
_0800D82E:
	ldrh r0, [r5]
	adds r0, #4
	adds r0, r0, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D82E
	adds r7, r2, #0
	cmp r7, #3
	bls _0800D826
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D84C:
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800D858
	b _0800DB04
_0800D858:
	movs r0, #8
	ldrh r6, [r6, #0x1c]
	ands r0, r6
	cmp r0, #0
	bne _0800D864
	b _0800DB5C
_0800D864:
	ldr r5, _0800D928 @ =gUnknown_03002D50
	movs r0, #0xfe
	lsls r0, r0, #8
	ldrh r2, [r5, #2]
	ands r0, r2
	strh r0, [r5, #2]
	ldr r3, _0800D92C @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	subs r5, #0x80
	ldr r4, [sp]
	adds r4, #0x14
	str r4, [sp, #8]
	cmp r0, #0xff
	beq _0800D8A6
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800D930 @ =gUnknown_03000852
_0800D88A:
	cmp r2, r1
	bne _0800D89C
	ldrb r6, [r4]
	ldrb r0, [r3, #1]
	cmp r6, r0
	bne _0800D89C
	ldrb r1, [r3, #3]
	cmp r1, #1
	beq _0800D8A6
_0800D89C:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800D88A
_0800D8A6:
	adds r6, r3, #4
	movs r7, #0
	ldr r2, [sp, #8]
	mov r8, r2
_0800D8AE:
	lsls r0, r7, #0xb
	ldr r3, _0800D934 @ =0x06013400
	adds r3, r3, r0
	mov sb, r3
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0800D94C
	movs r0, #1
	mov r4, r8
	strb r0, [r4]
	ldr r2, _0800D938 @ =gUnknown_0200AFC0
	ldr r1, _0800D93C @ =gUnknown_08026810
	ldrb r3, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl LZ77UnCompWram
	ldr r1, _0800D940 @ =0x040000D4
	ldr r2, [sp, #0x10]
	str r2, [r1]
	mov r4, sb
	str r4, [r1, #4]
	ldr r0, _0800D944 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	lsls r0, r7, #2
	adds r2, r6, #1
	movs r6, #0x81
	lsls r6, r6, #7
	adds r6, r6, r0
	mov ip, r6
	movs r3, #0xd0
	lsls r3, r3, #1
	lsls r0, r7, #6
	str r0, [sp, #0x18]
	movs r1, #0x90
	lsls r1, r1, #8
	mov sb, r1
	ldr r1, _0800D948 @ =0x0000C038
_0800D904:
	mov r6, ip
	strh r6, [r5]
	strh r1, [r5, #2]
	ldr r6, [sp, #0x18]
	adds r0, r3, r6
	mov r6, sb
	orrs r0, r6
	strh r0, [r5, #4]
	adds r5, #8
	adds r3, #0x20
	adds r1, #0x40
	adds r4, #1
	cmp r4, #1
	bls _0800D904
	b _0800D960
	.align 2, 0
_0800D924: .4byte gUnknown_03002CD0
_0800D928: .4byte gUnknown_03002D50
_0800D92C: .4byte gUnknown_03002920
_0800D930: .4byte gUnknown_03000852
_0800D934: .4byte 0x06013400
_0800D938: .4byte gUnknown_0200AFC0
_0800D93C: .4byte gUnknown_08026810
_0800D940: .4byte 0x040000D4
_0800D944: .4byte 0x80000400
_0800D948: .4byte 0x0000C038
_0800D94C:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	adds r5, #8
	strh r0, [r5, #2]
	adds r5, #8
	adds r2, r6, #1
_0800D960:
	adds r6, r2, #0
	movs r2, #1
	add r8, r2
	adds r7, #1
	cmp r7, #3
	bls _0800D8AE
	ldr r3, [sp]
	ldrb r4, [r3, #4]
	ldr r6, [sp, #8]
	adds r0, r6, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D982
	cmp r4, #0
	beq _0800D982
	subs r0, r4, #1
	strb r0, [r3, #4]
_0800D982:
	ldr r4, _0800D9A4 @ =gInvestigation
	adds r0, r4, #0
	movs r1, #4
	bl sub_800BF90
	movs r1, #0
	movs r0, #1
	strb r0, [r4, #0x10]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x13]
	mov r2, sl
	ldrb r0, [r2, #0xa]
	adds r0, #1
	strb r0, [r2, #0xa]
	strb r1, [r2, #0xb]
	b _0800DB04
	.align 2, 0
_0800D9A4: .4byte gInvestigation
_0800D9A8:
	mov r3, sl
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800D9D8
	ldr r5, _0800D9F8 @ =gUnknown_03002CD0
	movs r7, #0
	movs r2, #4
_0800D9B6:
	movs r4, #0
	subs r0, r2, r7
	lsls r1, r0, #1
_0800D9BC:
	ldrh r6, [r5]
	subs r0, r6, r1
	strh r0, [r5]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800D9BC
	adds r7, #1
	cmp r7, #3
	bls _0800D9B6
	mov r1, sl
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
_0800D9D8:
	ldr r2, [sp]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _0800D9E2
	b _0800DB04
_0800D9E2:
	mov r3, sl
	ldrb r3, [r3, #0xb]
	cmp r3, #0xc
	bhi _0800D9EC
	b _0800DB04
_0800D9EC:
	movs r0, #3
	mov r4, sl
	strb r0, [r4, #0xa]
	strb r1, [r4, #0xb]
	b _0800DB04
	.align 2, 0
_0800D9F8: .4byte gUnknown_03002CD0
_0800D9FC:
	ldr r3, _0800DAB0 @ =gUnknown_03002920
	ldrb r1, [r3]
	adds r0, r1, #0
	ldr r5, _0800DAB4 @ =gUnknown_03002CD0
	ldr r6, [sp]
	adds r6, #0x14
	str r6, [sp, #8]
	cmp r0, #0xff
	beq _0800DA32
	mov r0, sl
	adds r0, #0xc0
	ldrb r2, [r0]
	ldr r4, _0800DAB8 @ =gUnknown_03000852
_0800DA16:
	cmp r2, r1
	bne _0800DA28
	ldrb r0, [r4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	bne _0800DA28
	ldrb r6, [r3, #3]
	cmp r6, #1
	beq _0800DA32
_0800DA28:
	adds r3, #0x14
	ldrb r1, [r3]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800DA16
_0800DA32:
	adds r6, r3, #4
	movs r7, #0
	ldr r0, [sp, #8]
	mov r8, r0
	movs r1, #0
	str r1, [sp, #0xc]
_0800DA3E:
	lsls r0, r7, #0xb
	ldr r2, _0800DABC @ =0x06013400
	adds r2, r2, r0
	mov sb, r2
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0800DAD8
	movs r0, #1
	mov r3, r8
	strb r0, [r3]
	ldr r2, _0800DAC0 @ =gUnknown_0200AFC0
	ldr r1, _0800DAC4 @ =gUnknown_08026810
	ldrb r4, [r6]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl LZ77UnCompWram
	ldr r1, _0800DAC8 @ =0x040000D4
	ldr r2, [sp, #0x10]
	str r2, [r1]
	mov r0, sb
	str r0, [r1, #4]
	ldr r0, _0800DACC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	adds r2, r6, #1
	ldr r1, [sp, #0xc]
	ldr r3, _0800DAD0 @ =0x00004018
	adds r1, r1, r3
	mov ip, r1
	movs r3, #0xd0
	lsls r3, r3, #1
	lsls r6, r7, #6
	str r6, [sp, #0x18]
	movs r0, #0x90
	lsls r0, r0, #8
	mov sb, r0
	ldr r1, _0800DAD4 @ =0x0000C038
_0800DA92:
	mov r6, ip
	strh r6, [r5]
	strh r1, [r5, #2]
	ldr r6, [sp, #0x18]
	adds r0, r3, r6
	mov r6, sb
	orrs r0, r6
	strh r0, [r5, #4]
	adds r5, #8
	adds r3, #0x20
	adds r1, #0x40
	adds r4, #1
	cmp r4, #1
	bls _0800DA92
	b _0800DAEC
	.align 2, 0
_0800DAB0: .4byte gUnknown_03002920
_0800DAB4: .4byte gUnknown_03002CD0
_0800DAB8: .4byte gUnknown_03000852
_0800DABC: .4byte 0x06013400
_0800DAC0: .4byte gUnknown_0200AFC0
_0800DAC4: .4byte gUnknown_08026810
_0800DAC8: .4byte 0x040000D4
_0800DACC: .4byte 0x80000400
_0800DAD0: .4byte 0x00004018
_0800DAD4: .4byte 0x0000C038
_0800DAD8:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r5, #2]
	adds r5, #8
	strh r0, [r5, #2]
	adds r5, #8
	adds r2, r6, #1
_0800DAEC:
	adds r6, r2, #0
	movs r2, #1
	add r8, r2
	ldr r3, [sp, #0xc]
	adds r3, #0x1e
	str r3, [sp, #0xc]
	adds r7, #1
	cmp r7, #3
	bls _0800DA3E
	movs r0, #3
	mov r4, sl

	non_word_aligned_thumb_func_start sub_0800DB02
sub_0800DB02: @ 0x0800DB02
	strb r0, [r4, #0xa]
_0800DB04:
	ldr r5, _0800DB30 @ =gUnknown_03002CD0
	movs r7, #0
_0800DB08:
	ldr r6, [sp]
	ldrb r6, [r6, #4]
	cmp r7, r6
	bne _0800DB38
	movs r4, #0
	adds r2, r7, #1
	ldr r3, _0800DB34 @ =0x00000FFF
	movs r0, #0x90
	lsls r0, r0, #8
	adds r1, r0, #0
_0800DB1C:
	adds r0, r3, #0
	ldrh r6, [r5, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r5, #4]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800DB1C
	b _0800DB56
	.align 2, 0
_0800DB30: .4byte gUnknown_03002CD0
_0800DB34: .4byte 0x00000FFF
_0800DB38:
	movs r4, #0
	adds r2, r7, #1
	ldr r3, _0800DB6C @ =0x00000FFF
	movs r0, #0xa0
	lsls r0, r0, #8
	adds r1, r0, #0
_0800DB44:
	adds r0, r3, #0
	ldrh r6, [r5, #4]
	ands r0, r6
	adds r0, r0, r1
	strh r0, [r5, #4]
	adds r5, #8
	adds r4, #1
	cmp r4, #1
	bls _0800DB44
_0800DB56:
	adds r7, r2, #0
	cmp r7, #3
	bls _0800DB08
_0800DB5C:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DB6C: .4byte 0x00000FFF

	thumb_func_start sub_800DB70
sub_800DB70: @ 0x0800DB70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #4
	bls _0800DB7E
	b _0800DC80
_0800DB7E:
	lsls r0, r0, #2
	ldr r1, _0800DB88 @ =_0800DB8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DB88: .4byte _0800DB8C
_0800DB8C: @ jump table
	.4byte _0800DBA0 @ case 0
	.4byte _0800DBB6 @ case 1
	.4byte _0800DBD4 @ case 2
	.4byte _0800DC38 @ case 3
	.4byte _0800DC58 @ case 4
_0800DBA0:
	ldrb r0, [r4, #0x12]
	cmp r0, #0xf
	bhi _0800DBAA
	adds r0, #1
	strb r0, [r4, #0x12]
_0800DBAA:
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrb r4, [r4, #0x12]
	cmp r4, #0xf
	bls _0800DC80
	b _0800DC50
_0800DBB6:
	ldrb r4, [r4, #0x11]
	cmp r4, #0xe0
	bne _0800DC80
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	ldr r0, _0800DBCC @ =gUnknown_030037B8
	ldr r0, [r0]
	str r0, [r6, #0xc]
	ldr r0, _0800DBD0 @ =gUnknown_02000007
	b _0800DC7E
	.align 2, 0
_0800DBCC: .4byte gUnknown_030037B8
_0800DBD0: .4byte gUnknown_02000007
_0800DBD4:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xe0
	bne _0800DC80
	ldr r0, _0800DC2C @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DC80
	ldr r1, _0800DC30 @ =gUnknown_03002D40
	movs r5, #0
	ldr r0, _0800DC34 @ =0x000040E0
	mov ip, r0
	movs r3, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r7, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0800DBF8:
	mov r0, ip
	strh r0, [r1]
	adds r0, r3, r7
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r5, #1
	cmp r5, #3
	bls _0800DBF8
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_800BF90
	movs r0, #0xe0
	strb r0, [r4, #0x11]
	movs r0, #0x40
	strb r0, [r4, #0x12]
	movs r0, #8
	strb r0, [r4, #0x13]
	movs r0, #3
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	b _0800DC7A
	.align 2, 0
_0800DC2C: .4byte gScriptContext
_0800DC30: .4byte gUnknown_03002D40
_0800DC34: .4byte 0x000040E0
_0800DC38:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800BF90
	movs r1, #0
	movs r0, #2
	strb r0, [r4, #0x10]
	movs r0, #0xe0
	strb r0, [r4, #0x11]
	movs r0, #0x10
	strb r0, [r4, #0x12]
	strb r1, [r4, #0x13]
_0800DC50:
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	b _0800DC80
_0800DC58:
	ldrb r0, [r4, #0x12]
	cmp r0, #8
	bls _0800DC62
	subs r0, #1
	strb r0, [r4, #0x12]
_0800DC62:
	ldrb r1, [r4, #0x10]
	cmp r1, #0
	bne _0800DC80
	movs r0, #8
	strb r0, [r4, #0x12]
	strb r1, [r4, #0x13]
	movs r0, #1
	ldrb r1, [r4, #0xc]
	lsls r0, r1
	ldrb r1, [r4, #8]
	adds r0, r1, r0
	strb r0, [r4, #8]
_0800DC7A:
	movs r0, #0x82
	lsls r0, r0, #1
_0800DC7E:
	str r0, [r6, #8]
_0800DC80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800DC88
sub_800DC88: @ 0x0800DC88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	movs r7, #0
	ldrb r0, [r6, #0xa]
	cmp r0, #9
	bne _0800DC9C
	b _0800E108
_0800DC9C:
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r7, r6, r0
	bl sub_8015900
	ldr r1, _0800DCC4 @ =gUnknown_0814DBE8
	ldrb r4, [r6, #0xa]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DCC4: .4byte gUnknown_0814DBE8
_0800DCC8:
	bl ResetHPBar
	ldrb r0, [r7, #9]
	movs r4, #0
	strb r0, [r7, #8]
	ldrb r1, [r7, #9]
	movs r0, #0xb
	bl sub_8014B40
	movs r0, #1
	movs r1, #0
	bl sub_8014B40
	bl sub_8015880
	ldr r0, _0800DD18 @ =gMain
	ldr r1, _0800DD1C @ =0x00000256
	adds r0, r0, r1
	strb r4, [r0]
	movs r0, #1
	mov r2, r8
	ldrb r2, [r2, #0xb]
	orrs r0, r2
	mov r4, r8
	strb r0, [r4, #0xb]
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
_0800DD00:
	bl sub_8015670
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DD0E
	b _0800E26A
_0800DD0E:
	ldrb r0, [r6, #0xa]
	adds r0, #1
	strb r0, [r6, #0xa]
	b _0800E26A
	.align 2, 0
_0800DD18: .4byte gMain
_0800DD1C: .4byte 0x00000256
_0800DD20:
	ldrh r0, [r7, #0xa]
	bl sub_8018778
	ldr r1, _0800DDC4 @ =gMain
	movs r0, #1
	strb r0, [r1, #0x18]
	movs r0, #3
	strb r0, [r6, #0xa]
_0800DD30:
	ldr r4, _0800DDC4 @ =gMain
	ldr r0, _0800DDC8 @ =0x00000256
	adds r1, r4, r0
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DD84
	ldr r1, _0800DDCC @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	cmp r1, r0
	bne _0800DD84
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DD84
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800DD84
	ldr r1, _0800DDD0 @ =gScriptContext
	movs r0, #0xd
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800DD84
	bl sub_8015B4C
	movs r0, #0x31
	bl sub_8011150
	ldr r0, [r4, #8]
	str r0, [r6, #0xc]
	ldr r0, _0800DDD4 @ =gUnknown_03000007
	str r0, [r6, #8]
_0800DD84:
	ldr r4, _0800DDC4 @ =gMain
	ldr r2, _0800DDC8 @ =0x00000256
	adds r1, r4, r2
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DDD8
	bl sub_8015BFC
	cmp r0, #0
	bne _0800DDD8
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r4, [r0]
	cmp r4, #0
	bne _0800DDD8
	ldr r1, _0800DDCC @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #2]
	cmp r1, r0
	bne _0800DDD8
	movs r0, #0x2c
	bl sub_8011150
	movs r0, #8
	strb r0, [r6, #0xa]
	strb r4, [r6, #0xb]
	b _0800E038
	.align 2, 0
_0800DDC4: .4byte gMain
_0800DDC8: .4byte 0x00000256
_0800DDCC: .4byte gJoypad
_0800DDD0: .4byte gScriptContext
_0800DDD4: .4byte gUnknown_03000007
_0800DDD8:
	ldr r4, _0800DE58 @ =gMain
	ldr r2, _0800DE5C @ =0x00000256
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DE2C
	bl sub_8015BFC
	cmp r0, #0
	bne _0800DE2C
	ldr r1, _0800DE60 @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	cmp r1, r0
	bne _0800DE2C
	bl sub_8016D48
	cmp r0, #0
	bne _0800DE2C
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800DE2C
	ldr r1, _0800DE64 @ =gScriptContext
	movs r0, #5
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800DE2C
	bl sub_8016D6C
	movs r0, #0x31
	bl sub_8011150
	ldr r0, [r4, #8]
	str r0, [r6, #0xc]
	ldr r0, _0800DE68 @ =0x04000007
	str r0, [r6, #8]
_0800DE2C:
	adds r0, r6, #0
	adds r0, #0xa6
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	ble _0800DE3A
	b _0800E26A
_0800DE3A:
	adds r0, r6, #0
	adds r0, #0xa8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _0800DE48
	b _0800E26A
_0800DE48:
	bl sub_8016EBC
	cmp r0, #0
	beq _0800DE52
	b _0800E26A
_0800DE52:
	movs r0, #0xb
	strb r0, [r6, #0xa]
	b _0800E26A
	.align 2, 0
_0800DE58: .4byte gMain
_0800DE5C: .4byte 0x00000256
_0800DE60: .4byte gJoypad
_0800DE64: .4byte gScriptContext
_0800DE68: .4byte 0x04000007
_0800DE6C:
	ldrb r2, [r6, #0xb]
	cmp r2, #1
	bne _0800DE74
	b _0800E20A
_0800DE74:
	cmp r2, #1
	bgt _0800DE7E
	cmp r2, #0
	beq _0800DE84
	b _0800E26A
_0800DE7E:
	cmp r2, #2
	beq _0800DEAC
	b _0800E26A
_0800DE84:
	ldr r0, _0800DEA0 @ =gMain
	strb r2, [r0, #0x18]
	strb r2, [r0, #0x19]
	ldr r1, _0800DEA4 @ =gIORegisters
	adds r3, r1, #0
	adds r3, #0x4a
	ldr r0, _0800DEA8 @ =0x0000FDFF
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	strh r2, [r1, #0xe]
	movs r0, #4
	b _0800E1FE
	.align 2, 0
_0800DEA0: .4byte gMain
_0800DEA4: .4byte gIORegisters
_0800DEA8: .4byte 0x0000FDFF
_0800DEAC:
	ldrb r0, [r7, #8]
	subs r0, #1
	strb r0, [r7, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800DEF0
	ldr r0, _0800DEE4 @ =gMain
	ldr r1, _0800DEE8 @ =0x0000027D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DEF0
	ldr r1, _0800DEEC @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800DEF0
	movs r0, #7
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	movs r0, #3
	bl sub_8017154
	b _0800E26A
	.align 2, 0
_0800DEE4: .4byte gMain
_0800DEE8: .4byte 0x0000027D
_0800DEEC: .4byte gScriptContext
_0800DEF0:
	ldr r0, _0800DF10 @ =gMain
	movs r1, #1
	strb r1, [r0, #0x18]
	ldr r2, _0800DF14 @ =0x0000027D
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800DF06
	movs r0, #1
	bl sub_80053FC
_0800DF06:
	movs r0, #3
	strb r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r6, #0xb]
	b _0800E26A
	.align 2, 0
_0800DF10: .4byte gMain
_0800DF14: .4byte 0x0000027D
_0800DF18:
	ldrh r0, [r7, #0x10]
	bl sub_8018778
	movs r0, #1
	bl sub_80053FC
_0800DF24:
	movs r0, #3
	strb r0, [r6, #0xa]
	b _0800E26A
_0800DF2A:
	ldr r0, _0800DF44 @ =gMain
	adds r0, #0xae
	movs r1, #0x64
	strh r1, [r0]
	ldrb r0, [r6, #0xb]
	cmp r0, #4
	bls _0800DF3A
	b _0800E26A
_0800DF3A:
	lsls r0, r0, #2
	ldr r1, _0800DF48 @ =_0800DF4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DF44: .4byte gMain
_0800DF48: .4byte _0800DF4C
_0800DF4C: @ jump table
	.4byte _0800DF60 @ case 0
	.4byte _0800DF7A @ case 1
	.4byte _0800DFC4 @ case 2
	.4byte _0800DFE6 @ case 3
	.4byte _0800E00C @ case 4
_0800DF60:
	ldr r0, _0800DFBC @ =gMain
	movs r1, #0
	strb r1, [r0, #0x18]
	movs r0, #0x1e
	bl sub_80113B8
	movs r0, #5
	movs r1, #0
	bl sub_8014B40
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800DF7A:
	movs r0, #0x1f
	bl sub_800BC08
	bl sub_8015670
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DF8E
	b _0800E26A
_0800DF8E:
	movs r0, #7
	movs r1, #0
	bl sub_8014B40
	ldr r4, _0800DFBC @ =gMain
	adds r0, r4, #0
	adds r0, #0xa6
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x4f
	ble _0800DFA6
	b _0800E216
_0800DFA6:
	movs r0, #1
	bl sub_8016E74
	adds r1, r4, #0
	adds r1, #0xaa
	ldr r0, _0800DFC0 @ =0x0000FFD8
	strh r0, [r1]
	movs r0, #4
	bl sub_8016E74
	b _0800E216
	.align 2, 0
_0800DFBC: .4byte gMain
_0800DFC0: .4byte 0x0000FFD8
_0800DFC4:
	bl sub_8015670
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl InitSpecialEffects
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DFDC
	b _0800E26A
_0800DFDC:
	movs r0, #6
	movs r1, #0
	bl sub_8014B40
	b _0800E216
_0800DFE6:
	bl sub_8015670
	movs r0, #0
	bl sub_800BC08
	bl sub_8014BDC
	cmp r0, #0
	bne _0800DFFA
	b _0800E26A
_0800DFFA:
	bl sub_8016EBC
	cmp r0, #0
	beq _0800E004
	b _0800E26A
_0800E004:
	movs r0, #2
	bl sub_8016E74
	b _0800E216
_0800E00C:
	movs r5, #0
	movs r0, #3
	mov r2, r8
	strb r0, [r2, #0xc]
	strb r0, [r2, #0xd]
	ldr r4, _0800E034 @ =gMain
	movs r0, #1
	strb r0, [r4, #0x18]
	bl sub_800E280
	bl sub_800E4A4
	str r5, [r7]
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
	adds r4, #0xae
	movs r0, #0x14
	strh r0, [r4]
	b _0800E26A
	.align 2, 0
_0800E034: .4byte gMain
_0800E038:
	ldrb r0, [r6, #0xb]
	cmp r0, #5
	bls _0800E040
	b _0800E26A
_0800E040:
	lsls r0, r0, #2
	ldr r1, _0800E04C @ =_0800E050
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E04C: .4byte _0800E050
_0800E050: @ jump table
	.4byte _0800E068 @ case 0
	.4byte _0800E08C @ case 1
	.4byte _0800E0B8 @ case 2
	.4byte _0800E1FC @ case 3
	.4byte _0800E20A @ case 4
	.4byte _0800E0D0 @ case 5
_0800E068:
	ldrh r0, [r7, #0xc]
	bl sub_8018778
	ldr r0, _0800E088 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800E07E
	cmp r0, #4
	beq _0800E07E
	b _0800E216
_0800E07E:
	movs r0, #1
	bl sub_80053FC
	b _0800E216
	.align 2, 0
_0800E088: .4byte gScriptContext
_0800E08C:
	ldr r1, _0800E0B4 @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800E09A
	b _0800E26A
_0800E09A:
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
	movs r0, #0x1e
	bl sub_80113B8
	movs r0, #0x1e
	bl sub_800BC08
	movs r0, #2
	movs r1, #4
	b _0800E1D0
	.align 2, 0
_0800E0B4: .4byte gScriptContext
_0800E0B8:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800E0C4
	b _0800E26A
_0800E0C4:
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl InitSpecialEffects
	b _0800E216
_0800E0D0:
	bl sub_800E280
	bl sub_800E4A4
	ldr r1, _0800E100 @ =gInvestigation
	movs r0, #0xfe
	ldrb r4, [r1, #0xb]
	ands r0, r4
	strb r0, [r1, #0xb]
	movs r0, #3
	bl sub_8017154
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
	ldr r0, _0800E104 @ =0x0000FFFF
	ldrh r1, [r7, #0x14]
	cmp r1, r0
	beq _0800E0FC
	ldrh r0, [r7, #0x14]
	bl sub_8011278
_0800E0FC:
	movs r0, #1
	b _0800E1CE
	.align 2, 0
_0800E100: .4byte gInvestigation
_0800E104: .4byte 0x0000FFFF
_0800E108:
	ldrb r1, [r6, #0xb]
	cmp r1, #1
	bne _0800E110
	b _0800E20A
_0800E110:
	cmp r1, #1
	bgt _0800E11A
	cmp r1, #0
	beq _0800E120
	b _0800E26A
_0800E11A:
	cmp r1, #2
	beq _0800E150
	b _0800E26A
_0800E120:
	ldr r0, _0800E14C @ =gMain
	strb r1, [r0, #0x18]
	movs r0, #1
	mov r2, r8
	ldrb r2, [r2, #0xb]
	orrs r0, r2
	mov r4, r8
	strb r0, [r4, #0xb]
	movs r0, #0
	bl sub_80053FC
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xb
	bl sub_8014B40
	movs r0, #1
	b _0800E1FE
	.align 2, 0
_0800E14C: .4byte gMain
_0800E150:
	ldr r4, _0800E160 @ =gMain
	movs r0, #1
	strb r0, [r4, #0x18]
	bl sub_80053FC
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_0800E15E:
	b _0800E26A
	.align 2, 0
_0800E160: .4byte gMain
_0800E164:
	ldrb r0, [r6, #0xb]
	cmp r0, #5
	bls _0800E16C
	b _0800E26A
_0800E16C:
	lsls r0, r0, #2
	ldr r1, _0800E178 @ =_0800E17C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E178: .4byte _0800E17C
_0800E17C: @ jump table
	.4byte _0800E194 @ case 0
	.4byte _0800E1B4 @ case 1
	.4byte _0800E1E0 @ case 2
	.4byte _0800E1F2 @ case 3
	.4byte _0800E20A @ case 4
	.4byte _0800E21E @ case 5
_0800E194:
	ldrh r0, [r7, #0x12]
	bl sub_8018778
	ldr r0, _0800E1B0 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800E1A8
	cmp r0, #4
	bne _0800E216
_0800E1A8:
	movs r0, #1
	bl sub_80053FC
	b _0800E216
	.align 2, 0
_0800E1B0: .4byte gScriptContext
_0800E1B4:
	ldr r1, _0800E1DC @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800E26A
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
	movs r0, #0x1e
	bl sub_800BC08
	movs r0, #2
_0800E1CE:
	movs r1, #1
_0800E1D0:
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	b _0800E26A
	.align 2, 0
_0800E1DC: .4byte gScriptContext
_0800E1E0:
	adds r0, r6, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800E26A
	movs r0, #0x1e
	bl sub_80113B8
	b _0800E216
_0800E1F2:
	movs r0, #4
	movs r1, #1
	movs r2, #1
	bl InitSpecialEffects
_0800E1FC:
	movs r0, #7
_0800E1FE:
	movs r1, #0
	bl sub_8014B40
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
_0800E20A:
	bl sub_8015670
	bl sub_8014BDC
	cmp r0, #0
	beq _0800E26A
_0800E216:
	ldrb r0, [r6, #0xb]
	adds r0, #1
	strb r0, [r6, #0xb]
	b _0800E26A
_0800E21E:
	ldr r0, _0800E274 @ =gMain
	adds r1, r0, #0
	adds r1, #0xa8
	movs r2, #1
	strh r2, [r1]
	adds r0, #0xa6
	strh r2, [r0]
	movs r0, #3
	bl sub_8017154
	bl sub_800E280
	bl sub_800E4A4
	ldr r1, _0800E278 @ =gInvestigation
	movs r0, #0xfe
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
	movs r0, #0
	bl sub_80053FC
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r6, #8]
	ldr r0, _0800E27C @ =0x0000FFFF
	ldrh r4, [r7, #0x14]
	cmp r4, r0
	beq _0800E25E
	ldrh r0, [r7, #0x14]
	bl sub_8011278
_0800E25E:
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
_0800E26A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E274: .4byte gMain
_0800E278: .4byte gInvestigation
_0800E27C: .4byte 0x0000FFFF

	thumb_func_start sub_800E280
sub_800E280: @ 0x0800E280
	push {r4, r5, r6, lr}
	ldr r0, _0800E30C @ =0x040000D4
	ldr r1, _0800E310 @ =gGfx4bppInvestigationActions
	str r1, [r0]
	ldr r1, _0800E314 @ =0x06012000
	str r1, [r0, #4]
	ldr r1, _0800E318 @ =0x80000800
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E31C @ =gPalActionButtons1
	str r1, [r0]
	ldr r1, _0800E320 @ =0x050002A0
	str r1, [r0, #4]
	ldr r4, _0800E324 @ =0x80000020
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E328 @ =gGfx4bppInvestigationScrollButton
	str r1, [r0]
	ldr r1, _0800E32C @ =0x06013000
	str r1, [r0, #4]
	ldr r3, _0800E330 @ =0x80000100
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E334 @ =gPalInvestigationScrollPrompt
	str r1, [r0]
	ldr r1, _0800E338 @ =0x050002E0
	str r1, [r0, #4]
	ldr r2, _0800E33C @ =0x80000010
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E340 @ =gGfxExamineCursor
	str r1, [r0]
	ldr r1, _0800E344 @ =0x06013200
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E348 @ =gPalExamineCursors
	str r1, [r0]
	ldr r1, _0800E34C @ =0x05000300
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0800E350 @ =gPalChoiceSelected
	str r1, [r0]
	ldr r1, _0800E354 @ =0x05000320
	str r1, [r0, #4]
	str r4, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _0800E358 @ =gUnknown_03002D40
	movs r4, #0
	ldr r6, _0800E35C @ =0x000040E0
	movs r3, #0
	ldr r0, _0800E360 @ =0xFFFFC000
	adds r5, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0800E2F0:
	strh r6, [r1]
	adds r0, r3, r5
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r4, #1
	cmp r4, #3
	ble _0800E2F0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E30C: .4byte 0x040000D4
_0800E310: .4byte gGfx4bppInvestigationActions
_0800E314: .4byte 0x06012000
_0800E318: .4byte 0x80000800
_0800E31C: .4byte gPalActionButtons1
_0800E320: .4byte 0x050002A0
_0800E324: .4byte 0x80000020
_0800E328: .4byte gGfx4bppInvestigationScrollButton
_0800E32C: .4byte 0x06013000
_0800E330: .4byte 0x80000100
_0800E334: .4byte gPalInvestigationScrollPrompt
_0800E338: .4byte 0x050002E0
_0800E33C: .4byte 0x80000010
_0800E340: .4byte gGfxExamineCursor
_0800E344: .4byte 0x06013200
_0800E348: .4byte gPalExamineCursors
_0800E34C: .4byte 0x05000300
_0800E350: .4byte gPalChoiceSelected
_0800E354: .4byte 0x05000320
_0800E358: .4byte gUnknown_03002D40
_0800E35C: .4byte 0x000040E0
_0800E360: .4byte 0xFFFFC000

	thumb_func_start sub_800E364
sub_800E364: @ 0x0800E364
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	bl sub_800E280
	cmp r4, #0
	bne _0800E394
	ldr r0, _0800E390 @ =gInvestigation
	movs r1, #0xfe
	ldrb r2, [r0, #0xb]
	ands r1, r2
	strb r1, [r0, #0xb]
	movs r1, #3
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	b _0800E496
	.align 2, 0
_0800E390: .4byte gInvestigation
_0800E394:
	cmp r4, #1
	bne _0800E46C
	ldr r1, _0800E44C @ =gInvestigation
	movs r0, #0xfe
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
	ldr r3, _0800E450 @ =gUnknown_03002D40
	movs r4, #0
	adds r5, r1, #0
	ldr r7, _0800E454 @ =0x000040E0
	movs r2, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r6, r0, #0
	movs r1, #0xa2
	lsls r1, r1, #7
_0800E3B6:
	strh r7, [r3]
	adds r0, r2, r6
	strh r0, [r3, #2]
	strh r1, [r3, #4]
	adds r3, #8
	adds r2, #0x3c
	adds r1, #0x20
	adds r4, #1
	cmp r4, #3
	bls _0800E3B6
	ldr r4, _0800E450 @ =gUnknown_03002D40
	adds r0, r5, #0
	movs r1, #4
	bl sub_800BF90
	movs r1, #0
	movs r0, #0xd0
	strb r0, [r5, #0x11]
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x13]
	movs r0, #2
	strb r0, [r5, #0xc]
	strb r0, [r5, #0xd]
	movs r0, #0xfe
	ldrb r1, [r5, #0xb]
	ands r0, r1
	strb r0, [r5, #0xb]
	movs r0, #5
	strb r0, [r5, #0x10]
	adds r3, r4, #0
	adds r3, #0x10
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ldrh r1, [r4, #0x10]
	ands r0, r1
	movs r1, #0xf0
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r3, #2]
	ands r2, r0
	strh r2, [r3, #2]
	ldr r0, _0800E458 @ =0x00006540
	strh r0, [r3, #4]
	ldr r2, _0800E45C @ =gMain
	movs r0, #8
	strb r0, [r2, #9]
	movs r0, #1
	strb r0, [r2, #0xa]
	mov r1, r8
	strb r1, [r5, #5]
	ldr r1, _0800E460 @ =gIORegisters
	ldr r0, _0800E464 @ =0x0000FFB3
	strh r0, [r1, #0xe]
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r2, #0xe3
	lsls r2, r2, #1
	adds r1, r0, r2
	ldr r0, _0800E468 @ =0x0000FFFF
	ldrh r2, [r1]
	cmp r2, r0
	beq _0800E496
	ldrh r0, [r1]
	bl sub_8011278
	b _0800E496
	.align 2, 0
_0800E44C: .4byte gInvestigation
_0800E450: .4byte gUnknown_03002D40
_0800E454: .4byte 0x000040E0
_0800E458: .4byte 0x00006540
_0800E45C: .4byte gMain
_0800E460: .4byte gIORegisters
_0800E464: .4byte 0x0000FFB3
_0800E468: .4byte 0x0000FFFF
_0800E46C:
	cmp r4, #2
	bne _0800E488
	ldr r0, _0800E484 @ =gInvestigation
	movs r1, #0xfe
	ldrb r2, [r0, #0xb]
	ands r1, r2
	movs r2, #0
	strb r1, [r0, #0xb]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	b _0800E496
	.align 2, 0
_0800E484: .4byte gInvestigation
_0800E488:
	cmp r5, #3
	beq _0800E496
	cmp r5, #4
	bne _0800E496
	ldr r1, _0800E4A0 @ =gInvestigation
	movs r0, #2
	strb r0, [r1, #0x10]
_0800E496:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E4A0: .4byte gInvestigation

	thumb_func_start sub_800E4A4
sub_800E4A4: @ 0x0800E4A4
	push {r4, lr}
	ldr r0, _0800E4F0 @ =gUnknown_03002D40
	ldr r3, _0800E4F4 @ =0x000040E0
	strh r3, [r0]
	movs r2, #0xfe
	lsls r2, r2, #8
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	strh r4, [r0, #2]
	adds r0, #8
	strh r3, [r0]
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	movs r1, #0x3c
	orrs r4, r1
	strh r4, [r0, #2]
	adds r0, #8
	strh r3, [r0]
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	movs r1, #0x78
	orrs r4, r1
	strh r4, [r0, #2]
	adds r0, #8
	strh r3, [r0]
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ands r4, r1
	movs r1, #0xb4
	orrs r4, r1
	strh r4, [r0, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E4F0: .4byte gUnknown_03002D40
_0800E4F4: .4byte 0x000040E0

	thumb_func_start sub_800E4F8
sub_800E4F8: @ 0x0800E4F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	ldr r4, _0800E524 @ =gUnknown_03002D40
	movs r0, #1
	ldrb r1, [r3, #0xb]
	ands r0, r1
	cmp r0, #0
	beq _0800E510
	b _0800E696
_0800E510:
	ldrb r0, [r3, #0x10]
	cmp r0, #5
	bls _0800E518
	b _0800E62A
_0800E518:
	lsls r0, r0, #2
	ldr r1, _0800E528 @ =_0800E52C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E524: .4byte gUnknown_03002D40
_0800E528: .4byte _0800E52C
_0800E52C: @ jump table
	.4byte _0800E544 @ case 0
	.4byte _0800E5D4 @ case 1
	.4byte _0800E5F0 @ case 2
	.4byte _0800E608 @ case 3
	.4byte _0800E62A @ case 4
	.4byte _0800E620 @ case 5
_0800E544:
	movs r5, #0
	ldr r7, _0800E580 @ =gIORegisters
	mov sb, r7
	movs r0, #0x80
	lsls r0, r0, #7
	mov ip, r0
	movs r1, #0xff
	lsls r1, r1, #8
	mov r8, r1
	movs r6, #0xaa
	lsls r6, r6, #7
	movs r7, #0
_0800E55C:
	ldrb r0, [r3, #0xc]
	cmp r0, r5
	bne _0800E584
	mov r0, ip
	strh r0, [r4]
	ldrb r2, [r3, #0x12]
	adds r2, #0xf0
	movs r0, #0xff
	ands r2, r0
	mov r1, ip
	adds r0, r2, r1
	strh r0, [r4]
	movs r1, #0xca
	lsls r1, r1, #7
	adds r0, r7, r1
	strh r0, [r4, #4]
	b _0800E5BA
	.align 2, 0
_0800E580: .4byte gIORegisters
_0800E584:
	ldrb r0, [r3, #0xd]
	cmp r0, r5
	bne _0800E59E
	mov r0, r8
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r1, [r3, #0x11]
	orrs r0, r1
	strh r0, [r4]
	ldrb r1, [r3, #0x13]
	adds r0, r1, r0
	b _0800E5B6
_0800E59E:
	ldrb r0, [r3, #8]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E5B8
	mov r0, r8
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r1, [r3, #0x11]
	orrs r0, r1
_0800E5B6:
	strh r0, [r4]
_0800E5B8:
	strh r6, [r4, #4]
_0800E5BA:
	adds r4, #8
	adds r6, #0x20
	adds r7, #0x20
	adds r5, #1
	cmp r5, #3
	bls _0800E55C
	ldr r0, _0800E5D0 @ =0x0000FFAC
	mov r5, sb
	strh r0, [r5, #0xe]
	b _0800E696
	.align 2, 0
_0800E5D0: .4byte 0x0000FFAC
_0800E5D4:
	ldrb r5, [r3, #0xc]
	lsls r0, r5, #3
	adds r4, r4, r0
	lsls r0, r5, #5
	movs r7, #0xca
	lsls r7, r7, #7
	adds r0, r0, r7
	strh r0, [r4, #4]
	movs r0, #0xe0
	strb r0, [r3, #0x11]
	ldrb r0, [r3, #0x10]
	adds r0, #1
	strb r0, [r3, #0x10]
	b _0800E62A
_0800E5F0:
	ldrb r0, [r3, #0x11]
	adds r0, #2
	strb r0, [r3, #0x11]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xef
	bls _0800E62A
	movs r0, #0xf0
	strb r0, [r3, #0x11]
	movs r0, #0
	strb r0, [r3, #0x10]
	b _0800E62A
_0800E608:
	ldrb r0, [r3, #0x11]
	subs r0, #2
	strb r0, [r3, #0x11]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe0
	bhi _0800E62A
	movs r0, #0xe0
	strb r0, [r3, #0x11]
	movs r0, #4
	strb r0, [r3, #0x10]
	b _0800E62A
_0800E620:
	movs r0, #0xf0
	strb r0, [r3, #0x11]
	movs r0, #4
	strb r0, [r3, #0x10]
	b _0800E696
_0800E62A:
	ldr r2, _0800E66C @ =gMain
	adds r0, r2, #0
	adds r0, #0xc0
	ldrb r5, [r0]
	lsls r1, r5, #2
	adds r1, r1, r5
	movs r7, #0x96
	lsls r7, r7, #1
	adds r0, r2, r7
	adds r1, r1, r0
	ldrb r5, [r1]
	ldrh r2, [r2, #0x34]
	cmp r5, r2
	beq _0800E64A
	movs r0, #0x40
	strb r0, [r3, #0x12]
_0800E64A:
	movs r5, #0
	movs r6, #0xff
	lsls r6, r6, #8
_0800E650:
	ldrb r0, [r3, #8]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E670
	adds r0, r6, #0
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r7, [r3, #0x11]
	orrs r0, r7
	b _0800E68C
	.align 2, 0
_0800E66C: .4byte gMain
_0800E670:
	ldrb r0, [r3, #0xc]
	cmp r0, r5
	bne _0800E68E
	adds r0, r6, #0
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	ldrb r7, [r3, #0x12]
	subs r2, r1, r7
	movs r1, #0xff
	ands r2, r1
	adds r0, r0, r2
_0800E68C:
	strh r0, [r4]
_0800E68E:
	adds r4, #8
	adds r5, #1
	cmp r5, #3
	bls _0800E650
_0800E696:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E6A4
sub_800E6A4: @ 0x0800E6A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0800E6E8 @ =gUnknown_03002D60
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4]
	cmp r1, #0
	beq _0800E720
	ldr r0, _0800E6EC @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E720
	ldrh r0, [r5, #0x34]
	bl sub_80051AC
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0800E720
	ldr r0, _0800E6F0 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0800E700
	ldr r0, _0800E6F4 @ =0x00004020
	strh r0, [r4]
	ldr r0, _0800E6F8 @ =0x000080D0
	strh r0, [r4, #2]
	ldr r0, _0800E6FC @ =0x00007188
	b _0800E71E
	.align 2, 0
_0800E6E8: .4byte gUnknown_03002D60
_0800E6EC: .4byte gScriptContext
_0800E6F0: .4byte gMain
_0800E6F4: .4byte 0x00004020
_0800E6F8: .4byte 0x000080D0
_0800E6FC: .4byte 0x00007188
_0800E700:
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xf0
	beq _0800E710
	cmp r0, #0x78
	bne _0800E720
_0800E710:
	ldr r0, _0800E728 @ =0x00004020
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r4, #2]
	movs r0, #0xe3
	lsls r0, r0, #7
_0800E71E:
	strh r0, [r4, #4]
_0800E720:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800E728: .4byte 0x00004020

	thumb_func_start sub_800E72C
sub_800E72C: @ 0x0800E72C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r1, [r5]
	cmp r1, #0x77
	bhi _0800E748
	ldr r3, _0800E744 @ =gMain
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	adds r1, r1, r0
	b _0800E754
	.align 2, 0
_0800E744: .4byte gMain
_0800E748:
	ldr r3, _0800E7C0 @ =gMain
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r1, #0xc
_0800E754:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0800E7C4 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	adds r4, r3, #0
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	ldrh r5, [r5, #2]
	adds r1, r0, r5
	lsls r1, r1, #0x10
	ldr r2, _0800E7C8 @ =0x0000FFFF
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldr r1, _0800E7C4 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800E7CC
	adds r0, r4, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #3
	bne _0800E7E2
	movs r0, #0
	movs r1, #0x13
	bl sub_80065E8
	cmp r0, #0
	bne _0800E7E2
	movs r0, #0
	movs r1, #0xa
	bl sub_80065E8
	cmp r0, #0
	beq _0800E7E2
	movs r0, #0x94
	lsls r0, r0, #1
	b _0800E86C
	.align 2, 0
_0800E7C0: .4byte gMain
_0800E7C4: .4byte 0xFFFF0000
_0800E7C8: .4byte 0x0000FFFF
_0800E7CC:
	cmp r0, #4
	bne _0800E7E2
	adds r0, r3, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800E7E2
	movs r0, #0xdf
	b _0800E86C
_0800E7DE:
	ldrh r0, [r4]
	b _0800E86C
_0800E7E2:
	ldr r0, _0800E810 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800E802
	mov r0, sp
	ldrh r1, [r0]
	subs r1, #0xf0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0800E814 @ =0xFFFF0000
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
_0800E802:
	mov r0, sp
	bl sub_8012258
	adds r2, r0, #0
	ldr r4, _0800E818 @ =gUnknown_03003C70
	b _0800E828
	.align 2, 0
_0800E810: .4byte gMain
_0800E814: .4byte 0xFFFF0000
_0800E818: .4byte gUnknown_03003C70
_0800E81C:
	cmp r1, #0xfe
	bne _0800E826
	ldrb r0, [r4, #3]
	cmp r2, r0
	beq _0800E7DE
_0800E826:
	adds r4, #0x14
_0800E828:
	ldrb r1, [r4, #2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800E81C
	ldr r0, _0800E848 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0800E844
	mov r0, sp
	ldrh r1, [r0]
	adds r1, #0xf0
	strh r1, [r0]
_0800E844:
	ldr r4, _0800E84C @ =gUnknown_03003C70
	b _0800E862
	.align 2, 0
_0800E848: .4byte gMain
_0800E84C: .4byte gUnknown_03003C70
_0800E850:
	cmp r1, #0xfe
	beq _0800E860
	adds r1, r4, #4
	mov r0, sp
	bl sub_8012504
	cmp r0, #0
	bne _0800E7DE
_0800E860:
	adds r4, #0x14
_0800E862:
	ldrb r1, [r4, #2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800E850
	movs r0, #0x1e
_0800E86C:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800E874
sub_800E874: @ 0x0800E874
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r2, _0800E8D4 @ =gMain
	adds r1, r2, #0
	adds r1, #0xc0
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r4, r2, r0
	ldr r0, _0800E8D8 @ =0x0000012D
	adds r4, r4, r0
	movs r7, #0
	ldr r2, _0800E8DC @ =gUnknown_0200AFC0
	ldr r1, _0800E8E0 @ =gUnknown_08026960
	mov r8, r1
	ldr r5, _0800E8E4 @ =0x040000D4
_0800E898:
	lsls r0, r7, #0xb
	ldr r3, _0800E8E8 @ =0x06013400
	adds r6, r0, r3
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0800E8C0
	ldrb r1, [r4]
	lsls r0, r1, #2
	add r0, r8
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp]
	bl LZ77UnCompWram
	ldr r2, [sp]
	str r2, [r5]
	str r6, [r5, #4]
	ldr r0, _0800E8EC @ =0x80000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
_0800E8C0:
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bls _0800E898
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E8D4: .4byte gMain
_0800E8D8: .4byte 0x0000012D
_0800E8DC: .4byte gUnknown_0200AFC0
_0800E8E0: .4byte gUnknown_08026960
_0800E8E4: .4byte 0x040000D4
_0800E8E8: .4byte 0x06013400
_0800E8EC: .4byte 0x80000400

	thumb_func_start sub_800E8F0
sub_800E8F0: @ 0x0800E8F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r2, _0800E98C @ =gUnknown_03002920
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800E924
	ldr r0, _0800E990 @ =gUnknown_03003870
	ldrb r3, [r0]
	ldr r4, _0800E994 @ =gUnknown_03000852
_0800E908:
	cmp r3, r1
	bne _0800E91A
	ldrb r0, [r4]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _0800E91A
	ldrb r0, [r2, #3]
	cmp r0, #1
	beq _0800E924
_0800E91A:
	adds r2, #0x14
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800E908
_0800E924:
	adds r4, r2, #4
	movs r6, #0
	ldr r2, _0800E998 @ =gUnknown_0200AFC0
	ldr r1, _0800E99C @ =gUnknown_08026810
	mov r8, r1
	ldr r5, _0800E9A0 @ =0x040000D4
_0800E930:
	lsls r0, r6, #0xb
	ldr r1, _0800E9A4 @ =0x06013400
	adds r7, r0, r1
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0800E958
	ldrb r1, [r4]
	lsls r0, r1, #2
	add r0, r8
	ldr r0, [r0]
	adds r1, r2, #0
	str r2, [sp]
	bl LZ77UnCompWram
	ldr r2, [sp]
	str r2, [r5]
	str r7, [r5, #4]
	ldr r0, _0800E9A8 @ =0x80000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
_0800E958:
	adds r4, #1
	adds r6, #1
	cmp r6, #3
	bls _0800E930
	ldr r1, _0800E9A0 @ =0x040000D4
	ldr r0, _0800E9AC @ =gGfxCheckmark
	str r0, [r1]
	ldr r0, _0800E9B0 @ =0x06015400
	str r0, [r1, #4]
	ldr r0, _0800E9B4 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800E9B8 @ =gPalCheckmark
	str r0, [r1]
	ldr r0, _0800E9BC @ =0x05000360
	str r0, [r1, #4]
	ldr r0, _0800E9C0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E98C: .4byte gUnknown_03002920
_0800E990: .4byte gUnknown_03003870
_0800E994: .4byte gUnknown_03000852
_0800E998: .4byte gUnknown_0200AFC0
_0800E99C: .4byte gUnknown_08026810
_0800E9A0: .4byte 0x040000D4
_0800E9A4: .4byte 0x06013400
_0800E9A8: .4byte 0x80000400
_0800E9AC: .4byte gGfxCheckmark
_0800E9B0: .4byte 0x06015400
_0800E9B4: .4byte 0x80000100
_0800E9B8: .4byte gPalCheckmark
_0800E9BC: .4byte 0x05000360
_0800E9C0: .4byte 0x80000010

	thumb_func_start sub_800E9C4
sub_800E9C4: @ 0x0800E9C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov ip, r1
	movs r3, #0
	ldr r0, _0800EA68 @ =gUnknown_0814D93C
	mov r8, r0
	mov r2, ip
	adds r2, #0x3c
	movs r4, #0xff
	adds r7, r2, #0
_0800E9DC:
	adds r1, r2, r3
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r3, #1
	cmp r3, #0x1f
	bls _0800E9DC
	movs r0, #0
	mov r1, ip
	strb r0, [r1, #0x11]
	movs r3, #0
	mov r6, ip
	adds r6, #0x1c
	adds r5, #0xc1
	adds r2, r6, #0
	movs r4, #0xff
_0800E9FC:
	adds r1, r2, r3
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r3, #1
	cmp r3, #0x1f
	bls _0800E9FC
	movs r0, #0
	mov r1, ip
	strb r0, [r1, #0x10]
	ldrb r5, [r5]
	lsls r0, r5, #2
	add r0, r8
	ldr r2, [r0]
	movs r3, #0
	ldrb r1, [r2]
	cmp r1, #0xfe
	beq _0800EA38
	adds r4, r7, #0
_0800EA22:
	adds r0, r4, r3
	strb r1, [r0]
	mov r1, ip
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	adds r2, #1
	adds r3, #1
	ldrb r1, [r2]
	cmp r1, #0xfe
	bne _0800EA22
_0800EA38:
	adds r2, #1
	movs r3, #0
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800EA5E
	adds r4, r6, #0
_0800EA46:
	adds r0, r4, r3
	strb r1, [r0]
	mov r1, ip
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	adds r2, #1
	adds r3, #1
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800EA46
_0800EA5E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EA68: .4byte gUnknown_0814D93C

	thumb_func_start sub_800EA6C
sub_800EA6C: @ 0x0800EA6C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0800EA84 @ =gScriptContext
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800EA90
	ldr r0, _0800EA88 @ =gUnknown_03002080
	ldr r2, _0800EA8C @ =0x000004DC
	adds r1, r0, r2
	movs r2, #9
	b _0800EA98
	.align 2, 0
_0800EA84: .4byte gScriptContext
_0800EA88: .4byte gUnknown_03002080
_0800EA8C: .4byte 0x000004DC
_0800EA90:
	ldr r0, _0800EAB8 @ =gUnknown_03002080
	ldr r2, _0800EABC @ =0x000004DC
	adds r1, r0, r2
	movs r2, #0
_0800EA98:
	strh r2, [r1]
	ldr r1, _0800EAC0 @ =0x000004DE
	adds r0, r0, r1
	strh r2, [r0]
	ldr r1, _0800EAC4 @ =gUnknown_0814DC18
	ldrb r2, [r3, #9]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _0800EAC8 @ =gCourtRecord
	ldr r2, [r0]
	adds r0, r3, #0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0800EAB8: .4byte gUnknown_03002080
_0800EABC: .4byte 0x000004DC
_0800EAC0: .4byte 0x000004DE
_0800EAC4: .4byte gUnknown_0814DC18
_0800EAC8: .4byte gCourtRecord

	thumb_func_start sub_800EACC
sub_800EACC: @ 0x0800EACC
	push {lr}
	ldr r1, _0800EAE4 @ =gUnknown_0814DC38
	ldrb r3, [r0, #9]
	lsls r2, r3, #2
	adds r2, r2, r1
	ldr r1, _0800EAE8 @ =gCourtRecord
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0800EAE4: .4byte gUnknown_0814DC38
_0800EAE8: .4byte gCourtRecord

	thumb_func_start sub_800EAEC
sub_800EAEC: @ 0x0800EAEC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _0800EBC4 @ =gMain
	ldr r0, _0800EBC8 @ =0x000002C2
	adds r4, r4, r0
	ldrh r5, [r4]
	adds r0, r5, #0
	bl sub_8011194
	strh r5, [r4]
	ldr r1, _0800EBCC @ =gUnknown_03000000
	movs r0, #0
	ldr r3, _0800EBD0 @ =0x000003FF
	movs r2, #0
_0800EB0A:
	strh r2, [r1]
	adds r0, #1
	adds r1, #2
	cmp r0, r3
	bls _0800EB0A
	ldrb r0, [r7, #0xc]
	adds r4, r6, #0
	adds r4, #0x1c
	cmp r0, #6
	beq _0800EB3C
	cmp r0, #4
	bne _0800EB3C
	ldrb r1, [r7, #0xd]
	cmp r1, #5
	bhi _0800EB3C
	ldr r1, _0800EBD4 @ =gUnknown_03002D40
	movs r0, #0
	movs r2, #0xaa
	lsls r2, r2, #7
_0800EB30:
	strh r2, [r1, #4]
	adds r1, #8
	adds r2, #0x20
	adds r0, #1
	cmp r0, #3
	bls _0800EB30
_0800EB3C:
	ldrb r2, [r7, #0xc]
	cmp r2, #5
	bne _0800EB4A
	ldr r1, _0800EBD8 @ =gUnknown_03002D68
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_0800EB4A:
	ldrb r5, [r7, #0xb]
	cmp r5, #2
	bne _0800EB56
	ldr r1, _0800EBDC @ =gUnknown_03002D58
	ldr r0, _0800EBE0 @ =0x00006560
	strh r0, [r1, #4]
_0800EB56:
	ldrb r0, [r7, #0xb]
	cmp r0, #3
	bne _0800EB6A
	ldr r1, _0800EBDC @ =gUnknown_03002D58
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	movs r0, #6
	bl sub_8016E74
_0800EB6A:
	ldr r2, _0800EBE4 @ =gIORegisters
	adds r3, r2, #0
	adds r3, #0x4a
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	ldrh r5, [r3]
	orrs r0, r5
	strh r0, [r3]
	movs r0, #0xf8
	lsls r0, r0, #6
	strh r0, [r2, #4]
	movs r0, #4
	ldrb r2, [r7, #0x1a]
	orrs r0, r2
	strb r0, [r7, #0x1a]
	strb r1, [r6, #0xc]
	strb r1, [r6, #0xd]
	strb r1, [r6, #0x12]
	ldrb r0, [r6, #0x10]
	strb r0, [r6, #0xe]
	str r4, [r6, #0x18]
	bl sub_8010494
	ldr r0, [r6, #0x18]
	ldrb r5, [r6, #0xd]
	adds r0, r5, r0
	ldrb r0, [r0]
	bl sub_8010610
	ldrb r0, [r7, #0xb]
	cmp r0, #1
	bne _0800EBB6
	movs r0, #2
	movs r1, #0xc
	bl sub_8005CFC
_0800EBB6:
	movs r0, #1
	strb r0, [r6, #0xf]
	movs r0, #3
	strb r0, [r7, #9]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EBC4: .4byte gMain
_0800EBC8: .4byte 0x000002C2
_0800EBCC: .4byte gUnknown_03000000
_0800EBD0: .4byte 0x000003FF
_0800EBD4: .4byte gUnknown_03002D40
_0800EBD8: .4byte gUnknown_03002D68
_0800EBDC: .4byte gUnknown_03002D58
_0800EBE0: .4byte 0x00006560
_0800EBE4: .4byte gIORegisters

	thumb_func_start sub_800EBE8
sub_800EBE8: @ 0x0800EBE8
	push {r4, r5, lr}
	ldr r4, _0800EC14 @ =gScriptContext
	ldrh r5, [r4, #0xc]
	ldr r0, _0800EC18 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0800EC3A
	bl Random
	movs r1, #3
	ands r1, r0
	cmp r1, #1
	beq _0800EC1C
	cmp r1, #1
	ble _0800EC10
	cmp r1, #2
	beq _0800EC24
	cmp r1, #3
	beq _0800EC2C
_0800EC10:
	movs r0, #0x20
	b _0800EC2E
	.align 2, 0
_0800EC14: .4byte gScriptContext
_0800EC18: .4byte gMain
_0800EC1C:
	movs r0, #0x21
	bl sub_8018778
	b _0800EC3A
_0800EC24:
	movs r0, #0x22
	bl sub_8018778
	b _0800EC3A
_0800EC2C:
	movs r0, #0x23
_0800EC2E:
	bl sub_8018778
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_0800EC3A:
	ldr r0, _0800EC44 @ =gScriptContext
	strh r5, [r0, #0xe]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC44: .4byte gScriptContext

	thumb_func_start sub_800EC48
sub_800EC48: @ 0x0800EC48
	push {lr}
	ldr r1, _0800ECD8 @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800ED04
	ldr r2, _0800ECDC @ =gUnknown_08026998
	ldr r1, _0800ECE0 @ =gCourtRecord
	ldr r0, [r1, #0x18]
	ldrb r1, [r1, #0xd]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _0800ED04
	bl sub_80112C8
	movs r0, #0x2b
	bl sub_8011150
	ldr r0, _0800ECE4 @ =gMain
	movs r2, #0
	movs r1, #5
	strb r1, [r0, #9]
	strb r2, [r0, #0xa]
	movs r0, #0
	bl sub_8010720
	movs r0, #0
	bl sub_8010780
	ldr r2, _0800ECE8 @ =gUnknown_03000844
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _0800EC9A
	cmp r0, #0x21
	bne _0800ECC8
_0800EC9A:
	ldr r2, _0800ECEC @ =gUnknown_0826FE38
	ldr r0, [r2, #4]
	ldr r1, _0800ECF0 @ =gUnknown_08252498
	adds r0, r0, r1
	ldr r2, _0800ECF4 @ =0x050003A0
	ldr r1, _0800ECF8 @ =0x040000D4
	str r0, [r1]
	str r2, [r1, #4]
	ldr r0, _0800ECFC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0800ED00 @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	str r0, [r2]
_0800ECC8:
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #1
	b _0800ED06
	.align 2, 0
_0800ECD8: .4byte gJoypad
_0800ECDC: .4byte gUnknown_08026998
_0800ECE0: .4byte gCourtRecord
_0800ECE4: .4byte gMain
_0800ECE8: .4byte gUnknown_03000844
_0800ECEC: .4byte gUnknown_0826FE38
_0800ECF0: .4byte gUnknown_08252498
_0800ECF4: .4byte 0x050003A0
_0800ECF8: .4byte 0x040000D4
_0800ECFC: .4byte 0x80000010
_0800ED00: .4byte 0xFEFFFFFF
_0800ED04:
	movs r0, #0
_0800ED06:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800ED0C
sub_800ED0C: @ 0x0800ED0C
	push {r4, r5, lr}
	movs r0, #0x36
	bl sub_8011150
	ldr r0, _0800EDA0 @ =gCourtRecord
	movs r1, #1
	strb r1, [r0, #0xf]
	movs r1, #2
	ldrb r2, [r0, #0xc]
	orrs r1, r2
	strb r1, [r0, #0xc]
	ldr r4, _0800EDA4 @ =0x040000D4
	ldr r1, _0800EDA8 @ =0x06013C00
	str r1, [r4]
	ldr r1, _0800EDAC @ =0x06001400
	str r1, [r4, #4]
	ldr r1, _0800EDB0 @ =0x80000E00
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	ldr r1, _0800EDB4 @ =0x05000220
	str r1, [r4]
	ldr r1, _0800EDB8 @ =0x05000020
	str r1, [r4, #4]
	ldr r1, _0800EDBC @ =0x80000010
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	bl sub_8010690
	ldr r5, _0800EDC0 @ =gUnknown_03002CB0
	str r5, [r4]
	ldr r0, _0800EDC4 @ =0x07000110
	str r0, [r4, #4]
	ldr r0, _0800EDC8 @ =0x8000002C
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r4, _0800EDCC @ =gMain
	movs r0, #6
	strb r0, [r4, #9]
	ldrb r0, [r4, #0xb]
	cmp r0, #1
	bne _0800EDF0
	ldrb r2, [r4, #0xc]
	cmp r2, #4
	beq _0800ED6E
	ldr r1, _0800EDD0 @ =gTestimony
	adds r0, r4, #0
	movs r2, #0
	bl sub_800B6EC
_0800ED6E:
	adds r2, r5, #0
	adds r2, #0xa8
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800EDE4
	movs r1, #0x80
	lsls r1, r1, #7
	strh r1, [r2]
	ldr r0, _0800EDD4 @ =0x000080BA
	strh r0, [r2, #2]
	ldr r0, _0800EDD8 @ =0x00005590
	strh r0, [r2, #4]
	adds r2, #8
	strh r1, [r2]
	ldr r0, _0800EDDC @ =0x000080DA
	strh r0, [r2, #2]
	ldr r0, _0800EDE0 @ =0x00005598
	strh r0, [r2, #4]
	b _0800EDF0
	.align 2, 0
_0800EDA0: .4byte gCourtRecord
_0800EDA4: .4byte 0x040000D4
_0800EDA8: .4byte 0x06013C00
_0800EDAC: .4byte 0x06001400
_0800EDB0: .4byte 0x80000E00
_0800EDB4: .4byte 0x05000220
_0800EDB8: .4byte 0x05000020
_0800EDBC: .4byte 0x80000010
_0800EDC0: .4byte gUnknown_03002CB0
_0800EDC4: .4byte 0x07000110
_0800EDC8: .4byte 0x8000002C
_0800EDCC: .4byte gMain
_0800EDD0: .4byte gTestimony
_0800EDD4: .4byte 0x000080BA
_0800EDD8: .4byte 0x00005590
_0800EDDC: .4byte 0x000080DA
_0800EDE0: .4byte 0x00005598
_0800EDE4:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	adds r2, r5, #0
	adds r2, #0xb0
	strh r0, [r2]
_0800EDF0:
	ldr r4, _0800EE04 @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE04: .4byte gCourtRecord

	thumb_func_start sub_800EE08
sub_800EE08: @ 0x0800EE08
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0800EE44 @ =gUnknown_03000844
	mov sb, r0
	ldr r7, _0800EE48 @ =gMain
	ldrb r1, [r7, #0xb]
	cmp r1, #2
	bne _0800EE40
	ldr r6, _0800EE4C @ =gCourtRecord
	ldr r0, [r6, #0x18]
	ldrb r2, [r6, #0xd]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0x21
	beq _0800EE2E
	cmp r0, #0x57
	bne _0800EE40
_0800EE2E:
	adds r0, r7, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	mov r2, sb
	ldrb r1, [r2, #0xe]
	bl sub_8015810
	cmp r0, #0
	bge _0800EE50
_0800EE40:
	movs r0, #1
	b _0800EF22
	.align 2, 0
_0800EE44: .4byte gUnknown_03000844
_0800EE48: .4byte gMain
_0800EE4C: .4byte gCourtRecord
_0800EE50:
	ldr r1, _0800EEAC @ =gInvestigation
	movs r0, #1
	movs r2, #0
	mov r8, r2
	ldrb r2, [r1, #0xb]
	orrs r0, r2
	strb r0, [r1, #0xb]
	ldr r5, _0800EEB0 @ =gUnknown_03002D58
	movs r4, #0x80
	lsls r4, r4, #2
	strh r4, [r5]
	adds r0, r6, #0
	bl sub_8010704
	movs r0, #0
	bl sub_8010720
	movs r0, #0
	bl sub_8010780
	ldr r0, _0800EEB4 @ =0xFFFFFE48
	adds r5, r5, r0
	strh r4, [r5]
	strh r4, [r5, #8]
	movs r0, #4
	movs r1, #0x12
	bl sub_8005CFC
	movs r0, #0xff
	lsls r0, r0, #8
	mov r1, sb
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _0800EF00
	ldrh r0, [r7, #0x34]
	bl sub_80051AC
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0800EEB8
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #1
	b _0800EEBE
	.align 2, 0
_0800EEAC: .4byte gInvestigation
_0800EEB0: .4byte gUnknown_03002D58
_0800EEB4: .4byte 0xFFFFFE48
_0800EEB8:
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #0
_0800EEBE:
	strb r0, [r1]
	ldr r2, _0800EEDC @ =gMain
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	subs r0, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0800EEE0
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #8
	b _0800EEEE
	.align 2, 0
_0800EEDC: .4byte gMain
_0800EEE0:
	cmp r0, #0x78
	beq _0800EEE8
	cmp r0, #0xf0
	bne _0800EEF0
_0800EEE8:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xf8
_0800EEEE:
	strb r0, [r1]
_0800EEF0:
	ldr r0, _0800EEFC @ =gScriptContext
	movs r1, #0x40
	ldrh r2, [r0, #0x1e]
	orrs r1, r2
	strh r1, [r0, #0x1e]
	b _0800EF1A
	.align 2, 0
_0800EEFC: .4byte gScriptContext
_0800EF00:
	movs r0, #0x1e
	bl sub_80113B8
	movs r0, #8
	ldrb r1, [r6, #0xc]
	orrs r0, r1
	strb r0, [r6, #0xc]
	movs r0, #4
	movs r1, #0x12
	bl sub_8005CFC
	ldr r0, _0800EF30 @ =0x00000707
	str r0, [r7, #8]
_0800EF1A:
	movs r0, #0
	bl sub_8017154
	movs r0, #0
_0800EF22:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800EF30: .4byte 0x00000707

	thumb_func_start sub_800EF34
sub_800EF34: @ 0x0800EF34
	push {lr}
	ldr r1, _0800EF48 @ =gJoypad
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800EF4C
	movs r0, #0
	b _0800EF70
	.align 2, 0
_0800EF48: .4byte gJoypad
_0800EF4C:
	movs r0, #1
	movs r1, #0xc
	bl sub_8005CFC
	ldr r1, _0800EF74 @ =gCourtRecord
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r1, #0xe]
	cmp r0, r2
	blo _0800EF6A
	movs r0, #0
	strb r0, [r1, #0xd]
_0800EF6A:
	bl sub_800ED0C
	movs r0, #1
_0800EF70:
	pop {r1}
	bx r1
	.align 2, 0
_0800EF74: .4byte gCourtRecord

	thumb_func_start sub_800EF78
sub_800EF78: @ 0x0800EF78
	push {lr}
	ldr r1, _0800EF8C @ =gJoypad
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800EF90
	movs r0, #0
	b _0800EFB2
	.align 2, 0
_0800EF8C: .4byte gJoypad
_0800EF90:
	movs r0, #2
	movs r1, #0xc
	bl sub_8005CFC
	ldr r1, _0800EFB8 @ =gCourtRecord
	ldrb r0, [r1, #0xd]
	subs r0, #1
	strb r0, [r1, #0xd]
	ldrb r2, [r1, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r2
	bls _0800EFAE
	subs r0, r2, #1
	strb r0, [r1, #0xd]
_0800EFAE:
	bl sub_800ED0C
_0800EFB2:
	pop {r1}
	bx r1
	.align 2, 0
_0800EFB8: .4byte gCourtRecord

	thumb_func_start sub_800EFBC
sub_800EFBC: @ 0x0800EFBC
	push {r4, r5, r6, r7, lr}
	ldr r1, _0800EFD0 @ =gJoypad
	movs r4, #1
	adds r0, r4, #0
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800EFD4
	movs r0, #0
	b _0800F114
	.align 2, 0
_0800EFD0: .4byte gJoypad
_0800EFD4:
	bl sub_800EE08
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800EFE0
	b _0800F112
_0800EFE0:
	movs r0, #0x2b
	bl sub_8011150
	ldr r5, _0800F0A0 @ =gMain
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _0800F00E
	ldr r3, _0800F0A4 @ =gCourtRecord
	ldr r0, [r3, #0x18]
	ldrb r1, [r3, #0xd]
	adds r0, r1, r0
	ldrb r1, [r0]
	adds r2, r4, #0
	ldrb r3, [r3, #0xc]
	ands r2, r3
	adds r0, r5, #0
	bl sub_8010AFC
	bl sub_8018778
	movs r0, #1
	bl sub_80053FC
_0800F00E:
	ldr r6, _0800F0A4 @ =gCourtRecord
	adds r0, r6, #0
	bl sub_8010704
	movs r0, #0
	bl sub_8010720
	movs r0, #0
	bl sub_8010780
	ldr r1, _0800F0A8 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800F0AC @ =0x0000FBFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldr r4, _0800F0B0 @ =gOamObjects
	movs r7, #0x80
	lsls r7, r7, #2
	strh r7, [r4]
	adds r4, #8
	strh r7, [r4]
	ldrb r3, [r5, #0xb]
	cmp r3, #3
	bne _0800F100
	ldr r1, _0800F0B4 @ =gInvestigation
	movs r0, #4
	strb r0, [r1, #0x10]
	movs r1, #0x12
	bl sub_8005CFC
	ldr r0, _0800F0B8 @ =0x00000707
	str r0, [r5, #8]
	movs r0, #0x10
	ldrb r1, [r6, #0xc]
	orrs r0, r1
	strb r0, [r6, #0xc]
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r5, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r3, #0xd8
	lsls r3, r3, #1
	adds r1, r5, r3
	adds r0, r0, r1
	ldr r1, [r6, #0x18]
	ldrb r6, [r6, #0xd]
	adds r1, r6, r1
	ldrb r1, [r1]
	bl sub_8015850
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800F0BC
	movs r0, #3
	bl sub_8016E74
	adds r1, r5, #0
	adds r1, #0xaa
	movs r0, #0
	strh r0, [r1]
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r4, r4, r0
	strh r7, [r4]
	strh r7, [r4, #8]
	b _0800F0C2
	.align 2, 0
_0800F0A0: .4byte gMain
_0800F0A4: .4byte gCourtRecord
_0800F0A8: .4byte gIORegisters
_0800F0AC: .4byte 0x0000FBFF
_0800F0B0: .4byte gOamObjects
_0800F0B4: .4byte gInvestigation
_0800F0B8: .4byte 0x00000707
_0800F0BC:
	movs r0, #8
	bl sub_8016E74
_0800F0C2:
	ldr r2, _0800F0F8 @ =gMain
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r3, #0xd8
	lsls r3, r3, #1
	adds r1, r2, r3
	adds r0, r0, r1
	ldr r2, _0800F0FC @ =gCourtRecord
	ldr r1, [r2, #0x18]
	ldrb r2, [r2, #0xd]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_8015850
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800F112
	bl sub_8011324
	b _0800F112
	.align 2, 0
_0800F0F8: .4byte gMain
_0800F0FC: .4byte gCourtRecord
_0800F100:
	ldr r1, _0800F11C @ =gInvestigation
	movs r0, #3
	strb r0, [r1, #0x10]
	movs r0, #8
	strb r0, [r1, #8]
	movs r0, #0xf0
	strb r0, [r1, #0x11]
	ldr r0, [r5, #0xc]
	str r0, [r5, #8]
_0800F112:
	movs r0, #1
_0800F114:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F11C: .4byte gInvestigation

	thumb_func_start sub_800F120
sub_800F120: @ 0x0800F120
	push {r4, r5, r6, lr}
	ldr r1, _0800F134 @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800F138
	movs r0, #0
	b _0800F3B2
	.align 2, 0
_0800F134: .4byte gJoypad
_0800F138:
	ldr r4, _0800F1C0 @ =gMain
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800F17A
	ldrh r0, [r4, #0x34]
	cmp r0, #3
	beq _0800F17A
	ldr r0, _0800F1C4 @ =gUnknown_03000844
	movs r1, #1
	bl sub_801208C
	ldrh r0, [r4, #0x34]
	movs r2, #0
	strh r0, [r4, #0x38]
	movs r0, #3
	strh r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0800F1C8 @ =gScriptContext
	adds r0, #0x40
	movs r1, #0x80
	strh r1, [r0]
_0800F17A:
	movs r0, #3
	movs r1, #0xc
	bl sub_8005CFC
	ldr r1, _0800F1CC @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	ldr r0, _0800F1C8 @ =gScriptContext
	ldrh r0, [r0, #0xc]
	ldr r2, _0800F1D0 @ =gCourtRecord
	ldr r1, [r2, #0x18]
	ldrb r2, [r2, #0xd]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_8010A34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F1DA
	cmp r5, #0
	beq _0800F1D4
	movs r0, #3
	bl sub_8016E74
	ldr r0, _0800F1C0 @ =gMain
	adds r0, #0xaa
	movs r1, #0
	strh r1, [r0]
	b _0800F1DA
	.align 2, 0
_0800F1C0: .4byte gMain
_0800F1C4: .4byte gUnknown_03000844
_0800F1C8: .4byte gScriptContext
_0800F1CC: .4byte gOamObjects
_0800F1D0: .4byte gCourtRecord
_0800F1D4:
	movs r0, #8
	bl sub_8016E74
_0800F1DA:
	ldr r4, _0800F1FC @ =gMain
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F204
	movs r0, #4
	movs r1, #0x12
	bl sub_8005CFC
	ldr r0, _0800F200 @ =0x00000707
	str r0, [r4, #8]
	b _0800F352
	.align 2, 0
_0800F1FC: .4byte gMain
_0800F200: .4byte 0x00000707
_0800F204:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800F24A
	movs r0, #4
	bl sub_8012824
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800F226
	cmp r0, #0xc
	beq _0800F226
	cmp r0, #0xd
	bne _0800F234
_0800F226:
	ldr r0, _0800F230 @ =0x00000173
	bl sub_8011150
	b _0800F282
	.align 2, 0
_0800F230: .4byte 0x00000173
_0800F234:
	cmp r0, #0x14
	bne _0800F242
	movs r0, #0xb8
	lsls r0, r0, #1
	bl sub_8011150
	b _0800F282
_0800F242:
	movs r0, #0x37
	bl sub_8011150
	b _0800F282
_0800F24A:
	movs r0, #2
	bl sub_8012824
	adds r0, r4, #0
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800F262
	cmp r0, #0xc
	beq _0800F262
	cmp r0, #0xd
	bne _0800F270
_0800F262:
	ldr r0, _0800F26C @ =0x00000171
	bl sub_8011150
	b _0800F282
	.align 2, 0
_0800F26C: .4byte 0x00000171
_0800F270:
	cmp r0, #0x14
	bne _0800F27C
	movs r0, #0x51
	bl sub_8011150
	b _0800F282
_0800F27C:
	movs r0, #0x51
	bl sub_8011150
_0800F282:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _0800F2FC @ =gTestimony
	movs r0, #0xa
	strb r0, [r1, #1]
	ldr r1, _0800F300 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800F304 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	movs r2, #0
	strh r0, [r1]
	ldr r4, _0800F308 @ =gMain
	strb r2, [r4, #0x18]
	strb r2, [r4, #0x19]
	movs r0, #0x1e
	strh r0, [r4, #0x14]
	movs r2, #1
	strb r2, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r0, [r1]
	orrs r0, r2
	str r0, [r1]
	ldr r6, _0800F30C @ =gScriptContext
	ldrh r0, [r6, #0xc]
	ldr r2, _0800F310 @ =gCourtRecord
	ldr r1, [r2, #0x18]
	ldrb r2, [r2, #0xd]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_8010A34
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0800F318
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F2EA
	movs r0, #3
	bl sub_8016E74
	adds r1, r4, #0
	adds r1, #0xaa
	movs r0, #0
	strh r0, [r1]
_0800F2EA:
	bl sub_8011324
	adds r0, r5, #0
	bl sub_8018778
	ldr r0, _0800F314 @ =0x00000103
	str r0, [r4, #0xc]
	b _0800F34C
	.align 2, 0
_0800F2FC: .4byte gTestimony
_0800F300: .4byte gIORegisters
_0800F304: .4byte 0x0000FDFF
_0800F308: .4byte gMain
_0800F30C: .4byte gScriptContext
_0800F310: .4byte gCourtRecord
_0800F314: .4byte 0x00000103
_0800F318:
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F326
	movs r0, #8
	bl sub_8016E74
_0800F326:
	movs r0, #0x10
	ldrh r6, [r6, #0x1c]
	ands r0, r6
	cmp r0, #0
	beq _0800F336
	bl sub_800EBE8
	b _0800F33A
_0800F336:
	bl sub_800EBE8
_0800F33A:
	ldr r1, _0800F3B8 @ =gScriptContext
	ldr r0, _0800F3BC @ =0x0000FFEF
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	strh r0, [r1, #0x1c]
	ldr r1, _0800F3C0 @ =gUnknown_030037BC
	movs r0, #0x83
	lsls r0, r0, #1
	str r0, [r1]
_0800F34C:
	ldr r1, _0800F3C4 @ =gUnknown_030037B8
	ldr r0, _0800F3C8 @ =0x00000506
	str r0, [r1]
_0800F352:
	movs r0, #0
	movs r1, #0
	bl sub_8006130
	ldr r4, _0800F3CC @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	movs r0, #0
	bl sub_8010780
	ldr r2, _0800F3D0 @ =gMain
	adds r0, r2, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F386
	ldrb r2, [r2, #8]
	cmp r2, #4
	bne _0800F39E
_0800F386:
	ldr r1, _0800F3D4 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0800F3D8 @ =0x0000FBFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8010704
	movs r0, #0
	bl sub_8010720
_0800F39E:
	ldr r1, _0800F3D0 @ =gMain
	adds r1, #0xe8
	ldr r0, [r1]
	ldr r2, _0800F3DC @ =0xFFFFFCFF
	ands r0, r2
	str r0, [r1]
	ldr r1, _0800F3B8 @ =gScriptContext
	movs r0, #0
	strh r0, [r1, #0x10]
	movs r0, #1
_0800F3B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800F3B8: .4byte gScriptContext
_0800F3BC: .4byte 0x0000FFEF
_0800F3C0: .4byte gUnknown_030037BC
_0800F3C4: .4byte gUnknown_030037B8
_0800F3C8: .4byte 0x00000506
_0800F3CC: .4byte gCourtRecord
_0800F3D0: .4byte gMain
_0800F3D4: .4byte gIORegisters
_0800F3D8: .4byte 0x0000FBFF
_0800F3DC: .4byte 0xFFFFFCFF

	thumb_func_start sub_800F3E0
sub_800F3E0: @ 0x0800F3E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r2, _0800F41C @ =gScriptContext
	ldrh r1, [r2, #0x1e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800F430
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800F49C
	ldr r0, _0800F420 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2, #0x1e]
	movs r0, #0x1e
	bl sub_80113B8
	ldr r1, _0800F424 @ =gCourtRecord
	movs r0, #8
	ldrb r2, [r1, #0xc]
	orrs r0, r2
	strb r0, [r1, #0xc]
	ldr r1, _0800F428 @ =gUnknown_030037B8
	ldr r0, _0800F42C @ =0x00000707
	str r0, [r1]
	b _0800F530
	.align 2, 0
_0800F41C: .4byte gScriptContext
_0800F420: .4byte 0x0000FFBF
_0800F424: .4byte gCourtRecord
_0800F428: .4byte gUnknown_030037B8
_0800F42C: .4byte 0x00000707
_0800F430:
	bl sub_800EC48
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
	ldrb r0, [r6, #0xe]
	cmp r0, #1
	bls _0800F454
	bl sub_800EF34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
	bl sub_800EF78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
_0800F454:
	ldr r1, _0800F47C @ =gJoypad
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800F480
	movs r0, #0x34
	bl sub_8011150
	movs r0, #3
	movs r1, #0xc
	bl sub_8005CFC
	movs r0, #4
	strb r0, [r6, #0xf]
	strb r0, [r4, #9]
	b _0800F530
	.align 2, 0
_0800F47C: .4byte gJoypad
_0800F480:
	ldrb r0, [r4, #0xb]
	cmp r0, #1
	bne _0800F4B0
	bl sub_800F120
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0800F4C4
_0800F49C:
	ldr r4, _0800F4AC @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	b _0800F530
	.align 2, 0
_0800F4AC: .4byte gCourtRecord
_0800F4B0:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0800F4C4
	bl sub_800EFBC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F530
_0800F4C4:
	ldr r1, _0800F538 @ =gJoypad
	movs r0, #2
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0800F522
	movs r0, #0x2c
	bl sub_8011150
	movs r0, #3
	movs r1, #0xc
	bl sub_8005CFC
	ldrb r0, [r4, #0xb]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800F4FE
	ldr r1, _0800F53C @ =gScriptContext
	movs r0, #8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800F4FE
	ldr r0, _0800F540 @ =gMain
	adds r0, #0xaa
	movs r1, #0
	strh r1, [r0]
_0800F4FE:
	ldrb r1, [r4, #0xb]
	cmp r1, #2
	bne _0800F508
	ldr r0, _0800F544 @ =0x00030904
	str r0, [r4, #0xc]
_0800F508:
	cmp r1, #3
	bne _0800F510
	ldr r0, _0800F548 @ =0x00060A04
	str r0, [r4, #0xc]
_0800F510:
	bl sub_8016ED8
	cmp r0, #0
	beq _0800F51E
	movs r0, #8
	bl sub_8016E74
_0800F51E:
	movs r0, #2
	strb r0, [r4, #9]
_0800F522:
	ldr r4, _0800F54C @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
_0800F530:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F538: .4byte gJoypad
_0800F53C: .4byte gScriptContext
_0800F540: .4byte gMain
_0800F544: .4byte 0x00030904
_0800F548: .4byte 0x00060A04
_0800F54C: .4byte gCourtRecord

	thumb_func_start sub_800F550
sub_800F550: @ 0x0800F550
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _0800F582
	ldrb r1, [r4, #2]
	cmp r1, #8
	bls _0800F582
	ldr r3, _0800F5F4 @ =gUnknown_03002D58
	ldrh r0, [r3, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	adds r0, #0xc
	ldr r1, _0800F5F8 @ =0x000001FF
	ands r0, r1
	strh r0, [r3, #2]
	cmp r0, #0xb3
	bls _0800F57C
	movs r0, #0xb4
	strh r0, [r3, #2]
_0800F57C:
	ldrh r0, [r3, #2]
	orrs r2, r0
	strh r2, [r3, #2]
_0800F582:
	ldrb r1, [r5, #0xb]
	cmp r1, #3
	bne _0800F596
	ldrb r2, [r4, #2]
	cmp r2, #8
	bls _0800F596
	ldr r3, _0800F5F4 @ =gUnknown_03002D58
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
_0800F596:
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0800F5EE
	movs r0, #4
	ldrb r1, [r4, #0xc]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	bne _0800F5DA
	ldr r1, _0800F5FC @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0800F5DA
	ldr r1, _0800F600 @ =gUnknown_03002080
	ldr r0, _0800F604 @ =0x000004DC
	adds r2, r1, r0
	movs r0, #0x20
	strh r0, [r2]
	ldr r2, _0800F608 @ =0x000004DE
	adds r1, r1, r2
	movs r0, #0x21
	strh r0, [r1]
_0800F5DA:
	ldr r0, _0800F60C @ =gUnknown_030037B8
	ldr r1, [r5, #0xc]
	str r1, [r0]
	ldr r2, _0800F610 @ =0x000002BA
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800F5EE
	bl sub_8011150
_0800F5EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F5F4: .4byte gUnknown_03002D58
_0800F5F8: .4byte 0x000001FF
_0800F5FC: .4byte gScriptContext
_0800F600: .4byte gUnknown_03002080
_0800F604: .4byte 0x000004DC
_0800F608: .4byte 0x000004DE
_0800F60C: .4byte gUnknown_030037B8
_0800F610: .4byte 0x000002BA

	thumb_func_start sub_800F614
sub_800F614: @ 0x0800F614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _0800F646
	ldrb r1, [r4, #2]
	cmp r1, #8
	bls _0800F646
	ldr r3, _0800F670 @ =gUnknown_03002D58
	ldrh r0, [r3, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	subs r0, #0xc
	ldr r1, _0800F674 @ =0x000001FF
	ands r0, r1
	strh r0, [r3, #2]
	cmp r0, #0xff
	bls _0800F640
	movs r0, #0
	strh r0, [r3, #2]
_0800F640:
	ldrh r0, [r3, #2]
	orrs r2, r0
	strh r2, [r3, #2]
_0800F646:
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0800F66A
	movs r0, #4
	ldrb r1, [r4, #0xc]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xf]
	strb r0, [r5, #9]
_0800F66A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F670: .4byte gUnknown_03002D58
_0800F674: .4byte 0x000001FF

	thumb_func_start sub_800F678
sub_800F678: @ 0x0800F678
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0800F718
	movs r0, #0xfd
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	movs r0, #2
	movs r1, #0xc
	bl sub_8005CFC
	movs r1, #1
	strb r1, [r4, #0xf]
	movs r0, #3
	strb r0, [r5, #9]
	ldrb r2, [r4, #0xd]
	ldrb r0, [r4, #0x12]
	strb r0, [r4, #0xd]
	strb r2, [r4, #0x12]
	ldrb r2, [r4, #0xc]
	ands r1, r2
	cmp r1, #0
	beq _0800F6EC
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r4, #0xc]
	ldr r1, _0800F6DC @ =0x040000D4
	ldr r0, _0800F6E0 @ =gGfx4bppProfileTextTiles
	str r0, [r1]
	ldr r0, _0800F6E4 @ =0x06013500
	str r0, [r1, #4]
	ldr r0, _0800F6E8 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r4, #0x10]
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	adds r0, #0x1c
	b _0800F70A
	.align 2, 0
_0800F6DC: .4byte 0x040000D4
_0800F6E0: .4byte gGfx4bppProfileTextTiles
_0800F6E4: .4byte 0x06013500
_0800F6E8: .4byte 0x80000100
_0800F6EC:
	movs r0, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	ldr r1, _0800F720 @ =0x040000D4
	ldr r0, _0800F724 @ =gGfxEvidenceText
	str r0, [r1]
	ldr r0, _0800F728 @ =0x06013500
	str r0, [r1, #4]
	ldr r0, _0800F72C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r4, #0x11]
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	adds r0, #0x3c
_0800F70A:
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r0, r4, r0
	ldrb r0, [r0]
	bl sub_8010610
_0800F718:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F720: .4byte 0x040000D4
_0800F724: .4byte gGfxEvidenceText
_0800F728: .4byte 0x06013500
_0800F72C: .4byte 0x80000100

	thumb_func_start sub_800F730
sub_800F730: @ 0x0800F730
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F758
	ldr r0, _0800F76C @ =gIORegisters
	movs r2, #0
	movs r1, #8
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x14]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0xc]
_0800F758:
	ldrb r0, [r5, #0xa]
	cmp r0, #6
	bls _0800F760
	b _0800FEBC
_0800F760:
	lsls r0, r0, #2
	ldr r1, _0800F770 @ =_0800F774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F76C: .4byte gIORegisters
_0800F770: .4byte _0800F774
_0800F774: @ jump table
	.4byte _0800F790 @ case 0
	.4byte _0800FAAC @ case 1
	.4byte _0800FAC4 @ case 2
	.4byte _0800FB90 @ case 3
	.4byte _0800FD78 @ case 4
	.4byte _0800FE40 @ case 5
	.4byte _0800FE68 @ case 6
_0800F790:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800F79C
	b _0800FEBC
_0800F79C:
	ldr r1, _0800F7C8 @ =gMain
	ldr r0, _0800F7CC @ =0x00000A04
	ldrh r2, [r1, #0xc]
	cmp r2, r0
	bne _0800F7D4
	ldr r3, _0800F7D0 @ =0x00000257
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #2
	beq _0800F7E2
	ldrh r1, [r1, #0x36]
	cmp r1, #0x80
	bne _0800F7E2
	movs r0, #8
	movs r1, #0
	bl sub_8014B40
	bl sub_8015670
	bl sub_8015BD4
	b _0800F7E2
	.align 2, 0
_0800F7C8: .4byte gMain
_0800F7CC: .4byte 0x00000A04
_0800F7D0: .4byte 0x00000257
_0800F7D4:
	ldr r6, _0800F814 @ =0x00000257
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800F7E2
	bl sub_80157C0
_0800F7E2:
	movs r0, #0
	strb r0, [r4, #0x13]
	ldr r0, [r4, #0x18]
	ldrb r1, [r4, #0xd]
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r1, _0800F818 @ =0x040000D4
	ldr r0, _0800F81C @ =gMain
	str r0, [r1]
	ldr r0, _0800F820 @ =gUnknown_02000034
	str r0, [r1, #4]
	ldr r0, _0800F824 @ =0x8000016A
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800F828 @ =gUnknown_08026998
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #0x12
	bhi _0800F8C4
	lsls r0, r0, #2
	ldr r1, _0800F82C @ =_0800F830
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F814: .4byte 0x00000257
_0800F818: .4byte 0x040000D4
_0800F81C: .4byte gMain
_0800F820: .4byte gUnknown_02000034
_0800F824: .4byte 0x8000016A
_0800F828: .4byte gUnknown_08026998
_0800F82C: .4byte _0800F830
_0800F830: @ jump table
	.4byte _0800F8C4 @ case 0
	.4byte _0800F87C @ case 1
	.4byte _0800F880 @ case 2
	.4byte _0800F884 @ case 3
	.4byte _0800F888 @ case 4
	.4byte _0800F88C @ case 5
	.4byte _0800F890 @ case 6
	.4byte _0800F894 @ case 7
	.4byte _0800F898 @ case 8
	.4byte _0800F89C @ case 9
	.4byte _0800F8A0 @ case 10
	.4byte _0800F8A4 @ case 11
	.4byte _0800F8A8 @ case 12
	.4byte _0800F8AC @ case 13
	.4byte _0800F8B0 @ case 14
	.4byte _0800F8B4 @ case 15
	.4byte _0800F8B8 @ case 16
	.4byte _0800F8BC @ case 17
	.4byte _0800F8C0 @ case 18
_0800F87C:
	movs r0, #0x2d
	b _0800F8C2
_0800F880:
	movs r0, #0x2e
	b _0800F8C2
_0800F884:
	movs r0, #0x31
	b _0800F8C2
_0800F888:
	movs r0, #0x32
	b _0800F8C2
_0800F88C:
	movs r0, #0x34
	b _0800F8C2
_0800F890:
	movs r0, #0x4a
	b _0800F8C2
_0800F894:
	movs r0, #0x39
	b _0800F8C2
_0800F898:
	movs r0, #0x4b
	b _0800F8C2
_0800F89C:
	movs r0, #0x3a
	b _0800F8C2
_0800F8A0:
	movs r0, #0x4c
	b _0800F8C2
_0800F8A4:
	movs r0, #0x43
	b _0800F8C2
_0800F8A8:
	movs r0, #0x50
	b _0800F8C2
_0800F8AC:
	movs r0, #0x54
	b _0800F8C2
_0800F8B0:
	movs r0, #0x56
	b _0800F8C2
_0800F8B4:
	movs r0, #0x64
	b _0800F8C2
_0800F8B8:
	movs r0, #0x65
	b _0800F8C2
_0800F8BC:
	movs r0, #0x66
	b _0800F8C2
_0800F8C0:
	movs r0, #0x67
_0800F8C2:
	strh r0, [r5, #0x34]
_0800F8C4:
	ldrh r0, [r5, #0x34]
	bl sub_8003D5C
	ldr r1, _0800F930 @ =0x040000D4
	ldr r0, _0800F934 @ =gOamObjects
	str r0, [r1]
	ldr r2, _0800F938 @ =gUnknown_020009D4
	str r2, [r1, #4]
	ldr r0, _0800F93C @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0800F940 @ =gUnknown_03003AF0
	str r3, [r1]
	subs r2, #0xa0
	str r2, [r1, #4]
	ldr r0, _0800F944 @ =0x80000050
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r1, #0
	adds r7, r5, #0
	adds r7, #0x27
	movs r2, #0xff
_0800F8F0:
	ldrb r0, [r3]
	orrs r0, r2
	strb r0, [r3]
	adds r3, #0x14
	adds r1, #1
	cmp r1, #7
	bls _0800F8F0
	ldrb r0, [r5, #0xc]
	cmp r0, #4
	bne _0800F95C
	ldr r3, _0800F948 @ =gUnknown_03002D40
	movs r1, #0
	ldr r2, _0800F94C @ =gIORegisters
	mov sb, r2
	ldr r6, _0800F950 @ =gScriptContext
	mov ip, r6
	ldr r0, _0800F954 @ =gSaveDataBuffer
	mov r8, r0
	movs r6, #0x80
	lsls r6, r6, #2
	adds r2, r6, #0
_0800F91A:
	ldr r0, _0800F958 @ =0x0000FCFF
	ldrh r6, [r3]
	ands r0, r6
	orrs r0, r2
	strh r0, [r3]
	adds r3, #8
	adds r1, #1
	cmp r1, #3
	bls _0800F91A
	b _0800F9C4
	.align 2, 0
_0800F930: .4byte 0x040000D4
_0800F934: .4byte gOamObjects
_0800F938: .4byte gUnknown_020009D4
_0800F93C: .4byte 0x80000200
_0800F940: .4byte gUnknown_03003AF0
_0800F944: .4byte 0x80000050
_0800F948: .4byte gUnknown_03002D40
_0800F94C: .4byte gIORegisters
_0800F950: .4byte gScriptContext
_0800F954: .4byte gSaveDataBuffer
_0800F958: .4byte 0x0000FCFF
_0800F95C:
	cmp r0, #5
	bne _0800F988
	ldr r3, _0800F978 @ =gUnknown_03002D68
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	ldr r0, _0800F97C @ =gIORegisters
	mov sb, r0
	ldr r1, _0800F980 @ =gScriptContext
	mov ip, r1
	ldr r2, _0800F984 @ =gSaveDataBuffer
	mov r8, r2
	b _0800F9C4
	.align 2, 0
_0800F978: .4byte gUnknown_03002D68
_0800F97C: .4byte gIORegisters
_0800F980: .4byte gScriptContext
_0800F984: .4byte gSaveDataBuffer
_0800F988:
	ldr r3, _0800FA84 @ =gIORegisters
	mov sb, r3
	ldr r6, _0800FA88 @ =gScriptContext
	mov ip, r6
	ldr r1, _0800FA8C @ =gSaveDataBuffer
	mov r8, r1
	cmp r0, #6
	bne _0800F9C4
	ldr r3, _0800FA90 @ =gUnknown_03002D58
	ldr r1, _0800FA94 @ =0x0000FCFF
	adds r0, r1, #0
	ldrh r2, [r3]
	ands r0, r2
	movs r6, #0x80
	lsls r6, r6, #2
	adds r2, r6, #0
	orrs r0, r2
	strh r0, [r3]
	adds r3, #8
	ldrh r0, [r3]
	ands r1, r0
	orrs r1, r2
	strh r1, [r3]
	adds r3, #0x80
	ldrh r0, [r3]
	orrs r0, r2
	strh r0, [r3]
	ldrh r1, [r3, #8]
	orrs r2, r1
	strh r2, [r3, #8]
_0800F9C4:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r2, ip
	ldrh r2, [r2, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _0800F9DA
	ldr r3, _0800FA98 @ =gUnknown_03002D70
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
_0800F9DA:
	ldrb r0, [r5, #0x19]
	mov r1, r8
	adds r1, #0x4d
	movs r2, #0
	strb r0, [r1]
	ldrb r1, [r5, #0x18]
	mov r0, r8
	adds r0, #0x4c
	strb r1, [r0]
	strb r2, [r5, #0x19]
	strb r2, [r5, #0x18]
	mov r2, sb
	adds r2, #0x4a
	ldr r0, _0800FA9C @ =0x0000FDFF
	ldrh r3, [r2]
	ands r0, r3
	ldr r1, _0800FAA0 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xfc
	ldrb r6, [r7]
	ands r0, r6
	strb r0, [r7]
	adds r0, r4, #0
	bl sub_8010704
	movs r0, #0
	bl sub_8010720
	movs r0, #1
	bl sub_80108BC
	ldr r3, _0800FAA4 @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	strh r0, [r3, #8]
	movs r1, #0
	adds r2, r3, #0
_0800FA28:
	strh r0, [r2]
	adds r2, #8
	adds r1, #1
	cmp r1, #0x1f
	bls _0800FA28
	movs r1, #0
	ldr r3, _0800FAA8 @ =gUnknown_03000800
	ldr r0, _0800FAA4 @ =gOamObjects
	movs r2, #0x80
	lsls r2, r2, #2
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r0, r0, r4
_0800FA42:
	strh r2, [r0]
	adds r0, #8
	adds r1, #1
	cmp r1, #0x1f
	bls _0800FA42
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0xb
	beq _0800FA5A
	cmp r0, #0x21
	bne _0800FA7E
_0800FA5A:
	ldr r1, _0800FA88 @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0800FA7E
	movs r1, #0
	ldr r0, _0800FAA4 @ =gOamObjects
	movs r2, #0x80
	lsls r2, r2, #2
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r0, r0, r6
_0800FA74:
	strh r2, [r0]
	adds r0, #8
	adds r1, #1
	cmp r1, #0x1e
	bls _0800FA74
_0800FA7E:
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FA84: .4byte gIORegisters
_0800FA88: .4byte gScriptContext
_0800FA8C: .4byte gSaveDataBuffer
_0800FA90: .4byte gUnknown_03002D58
_0800FA94: .4byte 0x0000FCFF
_0800FA98: .4byte gUnknown_03002D70
_0800FA9C: .4byte 0x0000FDFF
_0800FAA0: .4byte 0x0000FBFF
_0800FAA4: .4byte gOamObjects
_0800FAA8: .4byte gUnknown_03000800
_0800FAAC:
	ldrh r0, [r5, #0x34]
	bl sub_80049A0
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
_0800FAC4:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800FAD0
	b _0800FEBC
_0800FAD0:
	ldr r0, _0800FAF4 @ =gJoypad
	ldrh r1, [r0, #2]
	ldr r6, _0800FAF8 @ =0x00000202
	ands r6, r1
	cmp r6, #0
	beq _0800FAFC
	movs r0, #0x2c
	bl sub_8011150
	movs r0, #2
	movs r1, #1
	movs r2, #1
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FAF4: .4byte gJoypad
_0800FAF8: .4byte 0x00000202
_0800FAFC:
	movs r0, #0x81
	ands r0, r1
	cmp r0, #0
	beq _0800FB44
	ldr r0, [r4, #0x18]
	ldrb r1, [r4, #0xd]
	adds r0, r1, r0
	ldr r1, _0800FB40 @ =gUnknown_08026998
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #4
	beq _0800FB1A
	b _0800FEBC
_0800FB1A:
	movs r0, #0x2b
	bl sub_8011150
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0800FB30
	strb r6, [r4, #0x13]
_0800FB30:
	movs r0, #2
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #6
	b _0800FEBA
	.align 2, 0
_0800FB40: .4byte gUnknown_08026998
_0800FB44:
	movs r0, #0x41
	ands r0, r1
	cmp r0, #0
	bne _0800FB4E
	b _0800FEBC
_0800FB4E:
	ldr r0, [r4, #0x18]
	ldrb r2, [r4, #0xd]
	adds r0, r2, r0
	ldr r1, _0800FB8C @ =gUnknown_08026998
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #4
	beq _0800FB64
	b _0800FEBC
_0800FB64:
	movs r0, #0x2b
	bl sub_8011150
	ldrb r0, [r4, #0x13]
	subs r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0800FB7C
	movs r0, #1
	strb r0, [r4, #0x13]
_0800FB7C:
	movs r0, #2
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #6
	b _0800FEBA
	.align 2, 0
_0800FB8C: .4byte gUnknown_08026998
_0800FB90:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800FB9C
	b _0800FEBC
_0800FB9C:
	ldr r2, _0800FD30 @ =gSaveDataBuffer
	adds r0, r2, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r5, #0x34]
	adds r0, r2, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r5, #0x38]
	adds r0, r2, #0
	adds r0, #0x70
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x71
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x73
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x74
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x76
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x78
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7a
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x7c
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x7e
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x80
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x81
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x82
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x83
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x88
	ldr r0, [r0]
	str r0, [r5, #0x54]
	movs r1, #0
	adds r7, r5, #0
	adds r7, #0x27
	adds r3, r2, #0
	adds r3, #0x8c
	adds r2, r5, #0
	adds r2, #0x58
_0800FC64:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #0xb
	bls _0800FC64
	ldrh r0, [r5, #0x34]
	bl sub_8003D5C
	ldrh r0, [r5, #0x34]
	bl sub_8004FAC
	ldr r3, _0800FD30 @ =gSaveDataBuffer
	adds r0, r3, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	strb r0, [r5, #0x19]
	adds r0, r3, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	strb r0, [r5, #0x18]
	ldr r2, _0800FD34 @ =gIORegisters
	adds r2, #0x4a
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	movs r6, #0
	ldrh r1, [r2]
	orrs r0, r1
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _0800FD38 @ =0x040000D4
	ldr r1, _0800FD3C @ =0x000009D4
	adds r0, r3, r1
	str r0, [r4]
	ldr r0, _0800FD40 @ =gOamObjects
	str r0, [r4, #4]
	ldr r0, _0800FD44 @ =0x80000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _0800FD48 @ =0x00000934
	adds r3, r3, r2
	str r3, [r4]
	ldr r0, _0800FD4C @ =gUnknown_03003AF0
	str r0, [r4, #4]
	ldr r0, _0800FD50 @ =0x80000050
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl sub_8019F8C
	ldrb r3, [r5, #0xc]
	cmp r3, #5
	bne _0800FCD6
	ldr r0, _0800FD54 @ =gTestimony
	strb r6, [r0, #1]
_0800FCD6:
	movs r0, #3
	ldrb r6, [r7]
	orrs r0, r6
	strb r0, [r7]
	ldr r2, _0800FD58 @ =gUnknown_03000844
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _0800FCEA
	cmp r0, #0x21
	bne _0800FD1A
_0800FCEA:
	ldr r1, _0800FD5C @ =gUnknown_0826FE38
	ldr r0, [r1, #4]
	ldr r1, _0800FD60 @ =gUnknown_08252498
	adds r0, r0, r1
	ldr r1, _0800FD64 @ =0x050003A0
	str r0, [r4]
	str r1, [r4, #4]
	ldr r0, _0800FD68 @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0800FD6C @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	ldr r1, _0800FD70 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2]
_0800FD1A:
	ldr r4, _0800FD74 @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FD30: .4byte gSaveDataBuffer
_0800FD34: .4byte gIORegisters
_0800FD38: .4byte 0x040000D4
_0800FD3C: .4byte 0x000009D4
_0800FD40: .4byte gOamObjects
_0800FD44: .4byte 0x80000200
_0800FD48: .4byte 0x00000934
_0800FD4C: .4byte gUnknown_03003AF0
_0800FD50: .4byte 0x80000050
_0800FD54: .4byte gTestimony
_0800FD58: .4byte gUnknown_03000844
_0800FD5C: .4byte gUnknown_0826FE38
_0800FD60: .4byte gUnknown_08252498
_0800FD64: .4byte 0x050003A0
_0800FD68: .4byte 0x80000010
_0800FD6C: .4byte 0xFEFFFFFF
_0800FD70: .4byte 0xFDFFFFFF
_0800FD74: .4byte gCourtRecord
_0800FD78:
	ldrh r0, [r5, #0x34]
	bl sub_8004FAC
	ldr r0, _0800FDA0 @ =gMain
	ldr r2, _0800FDA4 @ =0x000002C6
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800FDDC
	lsrs r0, r1, #4
	cmp r0, #1
	beq _0800FDBE
	cmp r0, #1
	bgt _0800FDA8
	cmp r0, #0
	beq _0800FDAE
	b _0800FDDC
	.align 2, 0
_0800FDA0: .4byte gMain
_0800FDA4: .4byte 0x000002C6
_0800FDA8:
	cmp r0, #2
	beq _0800FDCE
	b _0800FDDC
_0800FDAE:
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _0800FDDC
_0800FDBE:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _0800FDDC
_0800FDCE:
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
_0800FDDC:
	ldr r1, _0800FE04 @ =gMain
	ldr r0, _0800FE08 @ =0x00000A04
	ldrh r3, [r1, #0xc]
	cmp r3, r0
	bne _0800FE10
	ldr r4, _0800FE0C @ =0x00000257
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #2
	beq _0800FDFC
	movs r0, #9
	movs r1, #0
	bl sub_8014B40
	bl sub_8015670
_0800FDFC:
	bl sub_8015B4C
	b _0800FE2A
	.align 2, 0
_0800FE04: .4byte gMain
_0800FE08: .4byte 0x00000A04
_0800FE0C: .4byte 0x00000257
_0800FE10:
	ldr r6, _0800FE3C @ =0x00000257
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800FE2A
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80156F8
_0800FE2A:
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	b _0800FEBA
	.align 2, 0
_0800FE3C: .4byte 0x00000257
_0800FE40:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r4, [r0]
	cmp r4, #0
	bne _0800FE54
	bl sub_8011354
	movs r0, #1
	strb r0, [r5, #9]
	strb r4, [r5, #0xa]
_0800FE54:
	ldr r4, _0800FE64 @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
	b _0800FEBC
	.align 2, 0
_0800FE64: .4byte gCourtRecord
_0800FE68:
	adds r0, r5, #0
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800FEBC
	ldr r0, [r4, #0x18]
	ldrb r3, [r4, #0xd]
	adds r0, r3, r0
	ldr r1, _0800FE94 @ =gUnknown_08026998
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	cmp r0, #4
	bne _0800FEA0
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _0800FE98
	cmp r0, #1
	beq _0800FE9C
	b _0800FEA0
	.align 2, 0
_0800FE94: .4byte gUnknown_08026998
_0800FE98:
	movs r0, #0x32
	b _0800FE9E
_0800FE9C:
	movs r0, #0x33
_0800FE9E:
	strh r0, [r5, #0x34]
_0800FEA0:
	ldrh r0, [r5, #0x34]
	bl sub_8003D5C
	ldrh r0, [r5, #0x34]
	bl sub_80049A0
	movs r0, #1
	movs r1, #1
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #1
_0800FEBA:
	strb r0, [r5, #0xa]
_0800FEBC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800FECC
sub_800FECC: @ 0x0800FECC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1, #0x18]
	ldrb r1, [r1, #0xd]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_8010610
	movs r0, #3
	strb r0, [r4, #9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800FEE8
sub_800FEE8: @ 0x0800FEE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r7, _0800FF08 @ =gUnknown_03002D40
	ldr r3, _0800FF0C @ =gUnknown_03000844
	ldrb r1, [r5, #0xa]
	cmp r1, #2
	bgt _0800FF10
	cmp r1, #1
	blt _0800FF02
	b _08010014
_0800FF02:
	cmp r1, #0
	beq _0800FF18
	b _08010036
	.align 2, 0
_0800FF08: .4byte gUnknown_03002D40
_0800FF0C: .4byte gUnknown_03000844
_0800FF10:
	cmp r1, #3
	bne _0800FF16
	b _0801003C
_0800FF16:
	b _08010036
_0800FF18:
	adds r0, r5, #0
	adds r0, #0xa0
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r7]
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r6, r0, #0
	cmp r1, #0
	beq _0800FF30
	b _080101CE
_0800FF30:
	movs r0, #4
	bl sub_8012824
	ldr r0, _0800FF50 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #1
	bls _0800FF48
	cmp r0, #0xc
	beq _0800FF48
	cmp r0, #0xd
	bne _0800FF58
_0800FF48:
	ldr r0, _0800FF54 @ =0x00000173
	bl sub_8011150
	b _0800FF6C
	.align 2, 0
_0800FF50: .4byte gMain
_0800FF54: .4byte 0x00000173
_0800FF58:
	cmp r0, #0x14
	bne _0800FF66
	movs r0, #0xb8
	lsls r0, r0, #1
	bl sub_8011150
	b _0800FF6C
_0800FF66:
	movs r0, #0x37
	bl sub_8011150
_0800FF6C:
	ldr r1, _0800FFE4 @ =gTestimony
	movs r0, #6
	strb r0, [r1, #1]
	ldr r0, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r0, r4, r0
	ldr r4, _0800FFE8 @ =gUnknown_0200AFC0
	ldr r2, _0800FFEC @ =gUnknown_08026E20
	ldr r1, _0800FFF0 @ =gUnknown_08026998
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0800FFF4 @ =0x040000D4
	str r4, [r0]
	ldr r1, _0800FFF8 @ =0x05000220
	str r1, [r0, #4]
	ldr r1, _0800FFFC @ =0x80000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r4, #0x20
	str r4, [r0]
	ldr r1, _08010000 @ =0x06011000
	str r1, [r0, #4]
	ldr r1, _08010004 @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0
	movs r0, #0x10
	strh r0, [r7]
	ldr r0, _08010008 @ =0x0000C058
	strh r0, [r7, #2]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r7, #4]
	adds r0, r5, #0
	adds r0, #0x9b
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6]
	ldr r1, _0801000C @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08010010 @ =0x0000FDFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	strb r2, [r5, #0x18]
	strb r2, [r5, #0x19]
	ldrb r0, [r5, #0xa]
	adds r0, #1
	strb r0, [r5, #0xa]
	strb r2, [r5, #0xb]
	b _080101CE
	.align 2, 0
_0800FFE4: .4byte gTestimony
_0800FFE8: .4byte gUnknown_0200AFC0
_0800FFEC: .4byte gUnknown_08026E20
_0800FFF0: .4byte gUnknown_08026998
_0800FFF4: .4byte 0x040000D4
_0800FFF8: .4byte 0x05000220
_0800FFFC: .4byte 0x80000010
_08010000: .4byte 0x06011000
_08010004: .4byte 0x80000400
_08010008: .4byte 0x0000C058
_0801000C: .4byte gIORegisters
_08010010: .4byte 0x0000FDFF
_08010014:
	ldrb r0, [r5, #0xb]
	cmp r0, #7
	bls _08010032
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldrb r0, [r5, #0xa]
	adds r0, #1
	movs r1, #0
	strb r0, [r5, #0xa]
	strb r1, [r5, #0xb]
	b _08010036
_08010032:
	adds r0, #1
	strb r0, [r5, #0xb]
_08010036:
	adds r6, r5, #0
	adds r6, #0xa0
	b _080101CE
_0801003C:
	ldrb r0, [r5, #0xb]
	cmp r0, #0x25
	bhi _08010044
	b _080101B4
_08010044:
	ldrb r1, [r4, #0xc]
	movs r6, #8
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08010080
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7]
	movs r0, #0xf7
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	ldrb r1, [r3, #0xe]
	bl sub_8015810
	movs r2, #0x94
	lsls r2, r2, #2
	adds r1, r5, r2
	strb r0, [r1]
	ldr r0, _0801007C @ =0x00000A04
	str r0, [r5, #8]
	b _08010272
	.align 2, 0
_0801007C: .4byte 0x00000A04
_08010080:
	movs r3, #0x10
	mov r8, r3
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _0801012C
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4, #0xc]
	ldr r0, _080100FC @ =gMain
	ldr r1, _08010100 @ =0x00000256
	adds r0, r0, r1
	strb r2, [r0]
	movs r2, #0x94
	lsls r2, r2, #2
	adds r6, r5, r2
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r3, #0xd8
	lsls r3, r3, #1
	adds r0, r0, r3
	adds r0, r5, r0
	ldr r1, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r1, r4, r1
	ldrb r1, [r1]
	bl sub_8015850
	adds r3, r0, #0
	cmp r3, #0
	blt _08010104
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r5, r0
	lsls r1, r3, #1
	adds r1, r1, r0
	movs r3, #0xe8
	lsls r3, r3, #1
	adds r0, r5, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r3, #0x12
	adds r2, r2, r3
	strh r0, [r2]
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r5, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	bl sub_8018778
	b _0801011C
	.align 2, 0
_080100FC: .4byte gMain
_08010100: .4byte 0x00000256
_08010104:
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r5, r1
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_8018778
_0801011C:
	movs r0, #1
	bl sub_80053FC
	ldr r0, _08010128 @ =0x00030A04
	str r0, [r5, #8]
	b _08010272
	.align 2, 0
_08010128: .4byte 0x00030A04
_0801012C:
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7]
	ldr r1, _0801016C @ =gInvestigation
	strb r3, [r1, #0x12]
	strb r6, [r1, #0x13]
	ldr r2, _08010170 @ =gIORegisters
	adds r2, #0x4a
	ldrh r1, [r2]
	orrs r0, r1
	orrs r0, r3
	movs r1, #1
	strb r1, [r5, #0x18]
	strb r1, [r5, #0x19]
	ldr r1, _08010174 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r6, _08010178 @ =gScriptContext
	ldrh r0, [r6, #0xc]
	ldr r1, [r4, #0x18]
	ldrb r4, [r4, #0xd]
	adds r1, r4, r1
	ldrb r1, [r1]
	bl sub_8010A34
	cmp r0, #0
	beq _0801017C
	bl sub_8018778
	b _0801019E
	.align 2, 0
_0801016C: .4byte gInvestigation
_08010170: .4byte gIORegisters
_08010174: .4byte 0x0000FDFF
_08010178: .4byte gScriptContext
_0801017C:
	mov r0, r8
	ldrh r2, [r6, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _08010190
	ldrh r0, [r6, #0xc]
	adds r0, #1
	bl sub_8018778
	b _08010194
_08010190:
	bl sub_800EBE8
_08010194:
	ldr r1, _080101A8 @ =gScriptContext
	ldr r0, _080101AC @ =0x0000FFEF
	ldrh r3, [r1, #0x1c]
	ands r0, r3
	strh r0, [r1, #0x1c]
_0801019E:
	ldr r1, _080101B0 @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	b _08010272
	.align 2, 0
_080101A8: .4byte gScriptContext
_080101AC: .4byte 0x0000FFEF
_080101B0: .4byte gUnknown_030037B8
_080101B4:
	adds r0, #1
	strb r0, [r5, #0xb]
	adds r1, r5, #0
	adds r1, #0x9b
	ldrb r0, [r1]
	adds r0, #0xc
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldrh r1, [r0]
	subs r1, #8
	strh r1, [r0]
	adds r6, r0, #0
_080101CE:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bgt _080101EC
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7]
	bl sub_8016ED8
	cmp r0, #0
	beq _08010264
	movs r0, #8
	bl sub_8016E74
	b _08010264
_080101EC:
	movs r2, #0
	ldrsh r0, [r6, r2]
	bl sub_800653C
	adds r4, r0, #0
	ldr r3, _0801027C @ =gUnknown_08026430
	mov r8, r3
	adds r6, r5, #0
	adds r6, #0x9b
	ldrb r0, [r6]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_800650C
	ldr r5, _08010280 @ =gOamObjects
	strh r0, [r5, #6]
	ldrb r2, [r6]
	lsls r0, r2, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0xe]
	ldrb r1, [r6]
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x16]
	ldrb r0, [r6]
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r4, #0
	bl sub_800650C
	strh r0, [r5, #0x1e]
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r7]
	ldr r0, _08010284 @ =0x0000C058
	strh r0, [r7, #2]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r7, #4]
_08010264:
	ldr r4, _08010288 @ =gCourtRecord
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010554
_08010272:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801027C: .4byte gUnknown_08026430
_08010280: .4byte gOamObjects
_08010284: .4byte 0x0000C058
_08010288: .4byte gCourtRecord

	thumb_func_start sub_801028C
sub_801028C: @ 0x0801028C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r1, _08010304 @ =gUnknown_03000000
	movs r0, #0
	ldr r3, _08010308 @ =0x000003FF
	ldr r2, _0801030C @ =gIORegisters
	mov r8, r2
	movs r2, #0
_080102A0:
	strh r2, [r1]
	adds r0, #1
	adds r1, #2
	cmp r0, r3
	bls _080102A0
	mov r7, r8
	adds r7, #0x4a
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r0, #0
	movs r5, #0
	ldrh r0, [r7]
	orrs r0, r4
	strh r0, [r7]
	bl sub_8010494
	adds r0, r6, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl sub_8010610
	ldrh r1, [r6, #0x2e]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	movs r1, #4
	bl sub_80115D4
	movs r0, #0xf
	bl sub_8011150
	ldrb r0, [r6, #9]
	adds r0, #1
	strb r0, [r6, #9]
	strb r5, [r6, #0xa]
	ldrh r2, [r7]
	orrs r4, r2
	strh r4, [r7]
	movs r0, #0xf8
	lsls r0, r0, #6
	mov r1, r8
	strh r0, [r1, #4]
	movs r0, #4
	ldrb r2, [r6, #0x1a]
	orrs r0, r2
	strb r0, [r6, #0x1a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010304: .4byte gUnknown_03000000
_08010308: .4byte 0x000003FF
_0801030C: .4byte gIORegisters

	thumb_func_start sub_8010310
sub_8010310: @ 0x08010310
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010690
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0801039A
	ldr r4, _080103A0 @ =gScriptContext
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _0801039A
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	bne _0801034C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x1e
	bl sub_80115D4
	movs r0, #1
	strb r0, [r5, #0xa]
_0801034C:
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	bl sub_801A054
	ldr r1, _080103A4 @ =gJoypad
	adds r0, r6, #0
	ldrh r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0801036C
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801039A
_0801036C:
	movs r0, #0x2b
	bl sub_8011150
	movs r0, #3
	movs r1, #0xe
	bl sub_8005CFC
	movs r0, #2
	strb r0, [r5, #9]
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r1, #0
	ldrh r2, [r4, #0x1c]
	orrs r0, r2
	strh r0, [r4, #0x1c]
	ldr r0, _080103A8 @ =gUnknown_03002080
	ldr r2, _080103AC @ =0x000004DC
	adds r1, r0, r2
	movs r2, #9
	strh r2, [r1]
	ldr r1, _080103B0 @ =0x000004DE
	adds r0, r0, r1
	strh r2, [r0]
_0801039A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080103A0: .4byte gScriptContext
_080103A4: .4byte gJoypad
_080103A8: .4byte gUnknown_03002080
_080103AC: .4byte 0x000004DC
_080103B0: .4byte 0x000004DE

	thumb_func_start sub_80103B4
sub_80103B4: @ 0x080103B4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl sub_80060AC
	adds r0, r4, #0
	bl sub_8010690
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08010414
	ldr r1, _080103EC @ =gUnknown_030037B8
	ldr r0, [r5, #0xc]
	str r0, [r1]
	subs r1, #8
	ldrb r0, [r1, #8]
	cmp r0, #4
	bne _08010414
	ldrb r1, [r1, #9]
	cmp r1, #6
	bne _080103F4
	ldr r0, _080103F0 @ =gInvestigation
	movs r1, #1
	bl sub_800BF90
	b _08010414
	.align 2, 0
_080103EC: .4byte gUnknown_030037B8
_080103F0: .4byte gInvestigation
_080103F4:
	ldrb r5, [r5, #9]
	cmp r5, #8
	bne _08010408
	ldr r0, _08010404 @ =gInvestigation
	movs r1, #4
	bl sub_800BF90
	b _08010414
	.align 2, 0
_08010404: .4byte gInvestigation
_08010408:
	cmp r1, #9
	bne _08010414
	ldr r0, _0801041C @ =gInvestigation
	movs r1, #8
	bl sub_800BF90
_08010414:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801041C: .4byte gInvestigation

	thumb_func_start sub_8010420
sub_8010420: @ 0x08010420
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08010472
	movs r0, #0
	strb r0, [r4, #9]
	ldrb r0, [r4, #8]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r4, #8]
	ldr r1, _08010478 @ =0x040000D4
	ldr r0, _0801047C @ =gUnknown_08026F8C
	ldrb r2, [r4, #8]
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08010480 @ =gGfx4bppTestimonyArrows
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _08010484 @ =0x06013400
	str r0, [r1, #4]
	ldr r2, _08010488 @ =0x80000040
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801048C @ =gUnknown_08026F90
	ldrb r4, [r4, #8]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _08010490 @ =0x06013480
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
_08010472:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010478: .4byte 0x040000D4
_0801047C: .4byte gUnknown_08026F8C
_08010480: .4byte gGfx4bppTestimonyArrows
_08010484: .4byte 0x06013400
_08010488: .4byte 0x80000040
_0801048C: .4byte gUnknown_08026F90
_08010490: .4byte 0x06013480

	thumb_func_start sub_8010494
sub_8010494: @ 0x08010494
	push {lr}
	movs r0, #1
	movs r1, #0xc
	bl sub_8005CFC
	ldr r0, _0801050C @ =0x040000D4
	ldr r1, _08010510 @ =gGfx4bppTestimonyArrows
	str r1, [r0]
	ldr r1, _08010514 @ =0x06013400
	str r1, [r0, #4]
	ldr r2, _08010518 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801051C @ =gGfx4bppTestimonyArrows+0x180
	str r1, [r0]
	ldr r1, _08010520 @ =0x06013480
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08010524 @ =gGfx4bppControllerButtons
	str r1, [r0]
	ldr r1, _08010528 @ =0x06013800
	str r1, [r0, #4]
	adds r2, #0xc0
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801052C @ =gGfx4bppPresentBackTextTiles
	str r1, [r0]
	ldr r1, _08010530 @ =0x06013A00
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08010534 @ =gGfx4bppProfileTextTiles
	str r1, [r0]
	ldr r1, _08010538 @ =0x06013500
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801053C @ =gPalCrossExamUI
	str r1, [r0]
	ldr r1, _08010540 @ =0x05000260
	str r1, [r0, #4]
	subs r2, #0xf0
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08010544 @ =gPalCourtRecordActionText
	str r1, [r0]
	ldr r1, _08010548 @ =0x05000280
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801054C @ =gPalEvidenceProfileDesc
	str r1, [r0]
	ldr r1, _08010550 @ =0x05000240
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0801050C: .4byte 0x040000D4
_08010510: .4byte gGfx4bppTestimonyArrows
_08010514: .4byte 0x06013400
_08010518: .4byte 0x80000040
_0801051C: .4byte gGfx4bppTestimonyArrows+0x180
_08010520: .4byte 0x06013480
_08010524: .4byte gGfx4bppControllerButtons
_08010528: .4byte 0x06013800
_0801052C: .4byte gGfx4bppPresentBackTextTiles
_08010530: .4byte 0x06013A00
_08010534: .4byte gGfx4bppProfileTextTiles
_08010538: .4byte 0x06013500
_0801053C: .4byte gPalCrossExamUI
_08010540: .4byte 0x05000260
_08010544: .4byte gPalCourtRecordActionText
_08010548: .4byte 0x05000280
_0801054C: .4byte gPalEvidenceProfileDesc
_08010550: .4byte 0x05000240

	thumb_func_start sub_8010554
sub_8010554: @ 0x08010554
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8010690
	movs r0, #4
	ldrb r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080105D8
	adds r0, r4, #0
	bl sub_8010420
	ldr r1, _08010578 @ =gOamObjects
	ldrb r0, [r4, #0xe]
	cmp r0, #1
	bls _0801057C
	movs r0, #0x30
	b _08010580
	.align 2, 0
_08010578: .4byte gOamObjects
_0801057C:
	movs r0, #0x80
	lsls r0, r0, #2
_08010580:
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r1, #2]
	ldr r0, _08010598 @ =0x000021A0
	strh r0, [r1, #4]
	adds r1, #8
	ldrb r4, [r4, #0xe]
	cmp r4, #1
	bls _0801059C
	movs r0, #0x30
	b _080105A0
	.align 2, 0
_08010598: .4byte 0x000021A0
_0801059C:
	movs r0, #0x80
	lsls r0, r0, #2
_080105A0:
	strh r0, [r1]
	ldr r0, _080105C4 @ =0x000040E0
	strh r0, [r1, #2]
	ldr r0, _080105C8 @ =0x000021A4
	strh r0, [r1, #4]
	ldr r0, _080105CC @ =gMain
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _080105BA
	cmp r0, #4
	beq _080105BA
	cmp r0, #5
	bne _080105D0
_080105BA:
	movs r0, #1
	bl sub_8010720
	b _0801060A
	.align 2, 0
_080105C4: .4byte 0x000040E0
_080105C8: .4byte 0x000021A4
_080105CC: .4byte gMain
_080105D0:
	movs r0, #1
	bl sub_8010780
	b _0801060A
_080105D8:
	ldr r1, _080105FC @ =gOamObjects
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	strh r0, [r1, #8]
	ldr r0, _08010600 @ =gMain
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _080105F2
	cmp r0, #4
	beq _080105F2
	cmp r0, #5
	bne _08010604
_080105F2:
	movs r0, #0
	bl sub_8010720
	b _0801060A
	.align 2, 0
_080105FC: .4byte gOamObjects
_08010600: .4byte gMain
_08010604:
	movs r0, #0
	bl sub_8010780
_0801060A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010610
sub_8010610: @ 0x08010610
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08010668 @ =gUnknown_0200AFC0
	ldr r1, _0801066C @ =gUnknown_08026E20
	ldr r0, _08010670 @ =gUnknown_08026998
	lsls r5, r5, #3
	adds r5, r5, r0
	ldrh r2, [r5, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r4, _08010674 @ =0x040000D4
	str r6, [r4]
	ldr r0, _08010678 @ =0x05000220
	str r0, [r4, #4]
	ldr r0, _0801067C @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r6, #0x20
	str r6, [r4]
	ldr r0, _08010680 @ =0x06015000
	str r0, [r4, #4]
	ldr r0, _08010684 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r6, [r5]
	ldr r5, _08010668 @ =gUnknown_0200AFC0
	adds r0, r6, #0
	adds r1, r5, #0
	bl LZ77UnCompWram
	str r5, [r4]
	ldr r0, _08010688 @ =0x06013C00
	str r0, [r4, #4]
	ldr r0, _0801068C @ =0x80000A00
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010668: .4byte gUnknown_0200AFC0
_0801066C: .4byte gUnknown_08026E20
_08010670: .4byte gUnknown_08026998
_08010674: .4byte 0x040000D4
_08010678: .4byte 0x05000220
_0801067C: .4byte 0x80000010
_08010680: .4byte 0x06015000
_08010684: .4byte 0x80000400
_08010688: .4byte 0x06013C00
_0801068C: .4byte 0x80000A00

	thumb_func_start sub_8010690
sub_8010690: @ 0x08010690
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, _080106F4 @ =gUnknown_03002CB0
	movs r0, #0x18
	strh r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #8
	strh r0, [r1, #2]
	ldrh r2, [r5, #4]
	adds r0, r2, r0
	strh r0, [r1, #2]
	movs r0, #0x94
	lsls r0, r0, #5
	strh r0, [r1, #4]
	adds r1, #8
	movs r3, #0
	movs r6, #0x18
	ldr r4, _080106F8 @ =0x000021E0
	ldr r2, _080106FC @ =0x00008048
_080106B6:
	strh r6, [r1]
	strh r2, [r1, #2]
	ldrh r7, [r5, #4]
	adds r0, r7, r2
	strh r0, [r1, #2]
	strh r4, [r1, #4]
	adds r1, #8
	adds r4, #0x10
	adds r2, #0x20
	adds r3, #1
	cmp r3, #4
	bls _080106B6
	movs r3, #0
	movs r6, #0x38
	ldr r4, _08010700 @ =0x00002230
	ldr r2, _080106FC @ =0x00008048
_080106D6:
	strh r6, [r1]
	strh r2, [r1, #2]
	ldrh r7, [r5, #4]
	adds r0, r7, r2
	strh r0, [r1, #2]
	strh r4, [r1, #4]
	adds r1, #8
	adds r4, #0x10
	adds r2, #0x20
	adds r3, #1
	cmp r3, #4
	bls _080106D6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080106F4: .4byte gUnknown_03002CB0
_080106F8: .4byte 0x000021E0
_080106FC: .4byte 0x00008048
_08010700: .4byte 0x00002230

	thumb_func_start sub_8010704
sub_8010704: @ 0x08010704
	ldr r1, _0801071C @ =gUnknown_03002CB0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r1, #8
	movs r2, #0
_08010710:
	strh r0, [r1]
	adds r1, #8
	adds r2, #1
	cmp r2, #9
	bls _08010710
	bx lr
	.align 2, 0
_0801071C: .4byte gUnknown_03002CB0

	thumb_func_start sub_8010720
sub_8010720: @ 0x08010720
	ldr r2, _08010750 @ =gUnknown_03002D08
	cmp r0, #0
	beq _08010770
	movs r0, #0x60
	strh r0, [r2]
	ldr r0, _08010754 @ =0x000040A0
	strh r0, [r2, #2]
	ldr r0, _08010758 @ =0x000041C8
	strh r0, [r2, #4]
	adds r2, #8
	ldr r1, _0801075C @ =0x00004060
	strh r1, [r2]
	ldr r0, _08010760 @ =0x000080B0
	strh r0, [r2, #2]
	ldr r0, _08010764 @ =0x000041A8
	strh r0, [r2, #4]
	adds r2, #8
	strh r1, [r2]
	ldr r0, _08010768 @ =0x000080D0
	strh r0, [r2, #2]
	ldr r0, _0801076C @ =0x000041B0
	strh r0, [r2, #4]
	b _0801077C
	.align 2, 0
_08010750: .4byte gUnknown_03002D08
_08010754: .4byte 0x000040A0
_08010758: .4byte 0x000041C8
_0801075C: .4byte 0x00004060
_08010760: .4byte 0x000080B0
_08010764: .4byte 0x000041A8
_08010768: .4byte 0x000080D0
_0801076C: .4byte 0x000041B0
_08010770:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	adds r2, #8
	strh r0, [r2]
	strh r0, [r2, #8]
_0801077C:
	bx lr
	.align 2, 0

	thumb_func_start sub_8010780
sub_8010780: @ 0x08010780
	ldr r3, _080107E0 @ =gUnknown_03002D08
	cmp r0, #0
	bne _08010788
	b _0801089C
_08010788:
	ldr r0, _080107E4 @ =gMain
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801080C
	movs r2, #0x60
	strh r2, [r3]
	ldr r0, _080107E8 @ =0x0000403C
	strh r0, [r3, #2]
	ldr r0, _080107EC @ =0x000041C8
	strh r0, [r3, #4]
	adds r3, #8
	ldr r1, _080107F0 @ =0x00004060
	strh r1, [r3]
	ldr r0, _080107F4 @ =0x0000804C
	strh r0, [r3, #2]
	ldr r0, _080107F8 @ =0x000041A8
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _080107FC @ =0x0000806C
	strh r0, [r3, #2]
	ldr r0, _08010800 @ =0x000041B0
	strh r0, [r3, #4]
	adds r3, #0x50
	strh r2, [r3]
	subs r0, #0xe8
	strh r0, [r3, #2]
	adds r0, #0xf8
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010804 @ =0x000080D8
	strh r0, [r3, #2]
	ldr r0, _08010808 @ =0x000041D0
	strh r0, [r3, #4]
	adds r3, #8
	movs r0, #0x80
	lsls r0, r0, #2
	b _080108B4
	.align 2, 0
_080107E0: .4byte gUnknown_03002D08
_080107E4: .4byte gMain
_080107E8: .4byte 0x0000403C
_080107EC: .4byte 0x000041C8
_080107F0: .4byte 0x00004060
_080107F4: .4byte 0x0000804C
_080107F8: .4byte 0x000041A8
_080107FC: .4byte 0x0000806C
_08010800: .4byte 0x000041B0
_08010804: .4byte 0x000080D8
_08010808: .4byte 0x000041D0
_0801080C:
	movs r2, #0x60
	strh r2, [r3]
	ldr r0, _08010864 @ =0x0000403C
	strh r0, [r3, #2]
	ldr r0, _08010868 @ =0x000041C8
	strh r0, [r3, #4]
	adds r3, #8
	ldr r1, _0801086C @ =0x00004060
	strh r1, [r3]
	ldr r0, _08010870 @ =0x0000804C
	strh r0, [r3, #2]
	ldr r0, _08010874 @ =0x000041A8
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010878 @ =0x0000806C
	strh r0, [r3, #2]
	ldr r0, _0801087C @ =0x000041B0
	strh r0, [r3, #4]
	adds r3, #0x50
	strh r2, [r3]
	ldr r0, _08010880 @ =0x0000408C
	strh r0, [r3, #2]
	ldr r0, _08010884 @ =0x000041C0
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010888 @ =0x0000809C
	strh r0, [r3, #2]
	ldr r0, _0801088C @ =0x000041D0
	strh r0, [r3, #4]
	adds r3, #8
	strh r2, [r3]
	ldr r0, _08010890 @ =0x000040C8
	strh r0, [r3, #2]
	adds r0, #0xfc
	strh r0, [r3, #4]
	adds r3, #8
	strh r1, [r3]
	ldr r0, _08010894 @ =0x000080D8
	strh r0, [r3, #2]
	ldr r0, _08010898 @ =0x000041D8
	strh r0, [r3, #4]
	b _080108B8
	.align 2, 0
_08010864: .4byte 0x0000403C
_08010868: .4byte 0x000041C8
_0801086C: .4byte 0x00004060
_08010870: .4byte 0x0000804C
_08010874: .4byte 0x000041A8
_08010878: .4byte 0x0000806C
_0801087C: .4byte 0x000041B0
_08010880: .4byte 0x0000408C
_08010884: .4byte 0x000041C0
_08010888: .4byte 0x0000809C
_0801088C: .4byte 0x000041D0
_08010890: .4byte 0x000040C8
_08010894: .4byte 0x000080D8
_08010898: .4byte 0x000041D8
_0801089C:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3]
	adds r3, #8
	strh r0, [r3]
	adds r3, #8
	strh r0, [r3]
	adds r3, #0x50
	strh r0, [r3]
	adds r3, #8
	strh r0, [r3]
	adds r3, #8
_080108B4:
	strh r0, [r3]
	strh r0, [r3, #8]
_080108B8:
	bx lr
	.align 2, 0

	thumb_func_start sub_80108BC
sub_80108BC: @ 0x080108BC
	ldr r0, _080108F0 @ =gUnknown_03002D08
	movs r2, #0x90
	strh r2, [r0]
	ldr r1, _080108F4 @ =0x000040B8
	strh r1, [r0, #2]
	ldr r1, _080108F8 @ =0x000041C4
	strh r1, [r0, #4]
	adds r0, #8
	strh r2, [r0]
	subs r1, #0xfc
	strh r1, [r0, #2]
	ldr r1, _080108FC @ =0x000041CC
	strh r1, [r0, #4]
	adds r0, #8
	ldr r1, _08010900 @ =0x00004090
	strh r1, [r0]
	ldr r1, _08010904 @ =0x000080D8
	strh r1, [r0, #2]
	ldr r1, _08010908 @ =0x000041D8
	strh r1, [r0, #4]
	adds r0, #0x50
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	strh r1, [r0, #8]
	bx lr
	.align 2, 0
_080108F0: .4byte gUnknown_03002D08
_080108F4: .4byte 0x000040B8
_080108F8: .4byte 0x000041C4
_080108FC: .4byte 0x000041CC
_08010900: .4byte 0x00004090
_08010904: .4byte 0x000080D8
_08010908: .4byte 0x000041D8

	thumb_func_start sub_801090C
sub_801090C: @ 0x0801090C
	push {r4, lr}
	adds r4, r1, #0
	cmp r0, #0
	beq _08010928
	ldr r3, _08010920 @ =gUnknown_030028FC
	adds r0, r3, #0
	subs r0, #0x3c
	ldrb r1, [r0, #0x11]
	b _08010930
	.align 2, 0
_08010920: .4byte gUnknown_030028FC
_08010924:
	adds r0, r2, #0
	b _08010948
_08010928:
	ldr r3, _08010950 @ =gUnknown_030028DC
	adds r0, r3, #0
	subs r0, #0x1c
	ldrb r1, [r0, #0x10]
_08010930:
	movs r2, #0
	cmp r2, r1
	bhs _08010944
_08010936:
	ldrb r0, [r3]
	cmp r0, r4
	beq _08010924
	adds r2, #1
	adds r3, #1
	cmp r2, r1
	blo _08010936
_08010944:
	movs r0, #1
	rsbs r0, r0, #0
_08010948:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010950: .4byte gUnknown_030028DC

	thumb_func_start sub_8010954
sub_8010954: @ 0x08010954
	ldr r2, _08010968 @ =gUnknown_030028DC
	cmp r0, #0
	beq _0801095C
	adds r2, #0x20
_0801095C:
	movs r1, #0
_0801095E:
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0801096C
	adds r0, r1, #0
	b _08010978
	.align 2, 0
_08010968: .4byte gUnknown_030028DC
_0801096C:
	adds r1, #1
	adds r2, #1
	cmp r1, #0x1f
	bls _0801095E
	movs r0, #1
	rsbs r0, r0, #0
_08010978:
	bx lr
	.align 2, 0

	thumb_func_start sub_801097C
sub_801097C: @ 0x0801097C
	push {r4, r5, r6, lr}
	sub sp, #4
	mov ip, r0
	ldr r4, _08010A20 @ =gUnknown_0200AFC0
	ldr r1, _08010A24 @ =0x040000D4
	mov r3, ip
	adds r3, #0x3c
	str r3, [r1]
	str r4, [r1, #4]
	ldr r0, _08010A28 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r2, sp
	ldr r5, _08010A2C @ =0x0000FFFF
	adds r0, r5, #0
	strh r0, [r2]
	str r2, [r1]
	str r3, [r1, #4]
	ldr r0, _08010A30 @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	mov r6, ip
	strb r0, [r6, #0x11]
	movs r2, #0
_080109AE:
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080109C8
	mov r5, ip
	ldrb r5, [r5, #0x11]
	adds r0, r5, r3
	strb r1, [r0]
	mov r6, ip
	ldrb r0, [r6, #0x11]
	adds r0, #1
	strb r0, [r6, #0x11]
_080109C8:
	adds r2, #1
	cmp r2, #0x1f
	bls _080109AE
	ldr r1, _08010A24 @ =0x040000D4
	mov r3, ip
	adds r3, #0x1c
	str r3, [r1]
	str r4, [r1, #4]
	ldr r0, _08010A28 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r2, sp
	ldr r5, _08010A2C @ =0x0000FFFF
	adds r0, r5, #0
	strh r0, [r2]
	str r2, [r1]
	str r3, [r1, #4]
	ldr r0, _08010A30 @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	mov r6, ip
	strb r0, [r6, #0x10]
	movs r2, #0
_080109F8:
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08010A12
	mov r5, ip
	ldrb r5, [r5, #0x10]
	adds r0, r5, r3
	strb r1, [r0]
	mov r6, ip
	ldrb r0, [r6, #0x10]
	adds r0, #1
	strb r0, [r6, #0x10]
_08010A12:
	adds r2, #1
	cmp r2, #0x1f
	bls _080109F8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010A20: .4byte gUnknown_0200AFC0
_08010A24: .4byte 0x040000D4
_08010A28: .4byte 0x80000010
_08010A2C: .4byte 0x0000FFFF
_08010A30: .4byte 0x81000010

	thumb_func_start sub_8010A34
sub_8010A34: @ 0x08010A34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	ldr r0, _08010A8C @ =gUnknown_0814D998
	ldr r1, _08010A90 @ =gMain
	adds r1, #0xc1
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r4, [r1]
	ldr r0, _08010A94 @ =0x0000FFFF
	ldrh r1, [r4]
	cmp r1, r0
	beq _08010AE0
	ldr r6, _08010A98 @ =gUnknown_0300710A
	movs r1, #0xf0
	lsls r1, r1, #8
	adds r5, r1, #0
	mov sb, r0
_08010A60:
	ldrb r0, [r4, #6]
	cmp r0, #0xff
	beq _08010A72
	adds r1, r0, #0
	movs r0, #0
	bl sub_80065E8
	cmp r0, #0
	beq _08010AD8
_08010A72:
	ldr r0, _08010A9C @ =gScriptContext
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _08010AA0
	ldrh r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	adds r2, r0, #0
	cmp r1, #0
	bne _08010AAC
	b _08010AD8
	.align 2, 0
_08010A8C: .4byte gUnknown_0814D998
_08010A90: .4byte gMain
_08010A94: .4byte 0x0000FFFF
_08010A98: .4byte gUnknown_0300710A
_08010A9C: .4byte gScriptContext
_08010AA0:
	ldrh r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	adds r2, r0, #0
	cmp r1, #0
	bne _08010AD8
_08010AAC:
	ldr r1, _08010ACC @ =0x00000FFF
	adds r0, r1, #0
	ands r0, r2
	cmp r0, r8
	bne _08010AD8
	ldrh r0, [r4, #2]
	cmp r0, r7
	beq _08010AC0
	cmp r0, #0xff
	bne _08010AD8
_08010AC0:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _08010AD0
	movs r0, #0
	b _08010AD2
	.align 2, 0
_08010ACC: .4byte 0x00000FFF
_08010AD0:
	movs r0, #1
_08010AD2:
	strb r0, [r6]
	ldrh r0, [r4, #4]
	b _08010AEA
_08010AD8:
	adds r4, #8
	ldrh r0, [r4]
	cmp r0, sb
	bne _08010A60
_08010AE0:
	ldr r0, _08010AF8 @ =gScriptContext
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
_08010AEA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010AF8: .4byte gScriptContext

	thumb_func_start sub_8010AFC
sub_8010AFC: @ 0x08010AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _08010B88 @ =gUnknown_0814D9F4
	adds r0, #0xc1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	ldrb r0, [r3, #4]
	cmp r0, #0xff
	beq _08010B40
	mov r0, ip
	adds r0, #0xc0
	adds r1, r0, #0
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	beq _08010B4E
_08010B30:
	adds r3, #0x10
	ldrb r0, [r3, #4]
	cmp r0, #0xff
	beq _08010B40
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bne _08010B30
_08010B40:
	mov r0, ip
	adds r0, #0xc0
	adds r1, r0, #0
	ldrb r0, [r3]
	ldrb r2, [r1]
	cmp r0, r2
	bne _08010B9A
_08010B4E:
	ldr r0, _08010B8C @ =gUnknown_03000852
	ldrb r7, [r0]
	adds r2, r1, #0
	ldrb r6, [r2]
	movs r5, #0x99
	lsls r5, r5, #2
	add r5, ip
_08010B5C:
	ldrb r0, [r3, #3]
	cmp r7, r0
	bne _08010B92
	ldrb r1, [r3, #4]
	cmp r8, r1
	bne _08010B92
	ldrb r1, [r2]
	adds r0, r1, r5
	ldrb r1, [r3, #1]
	ldrb r0, [r0]
	cmp r0, r1
	beq _08010B78
	cmp r1, #0xff
	bne _08010B92
_08010B78:
	ldrb r0, [r3, #2]
	cmp sb, r0
	beq _08010B82
	cmp r0, #0xff
	bne _08010B90
_08010B82:
	ldrh r0, [r3, #6]
	b _08010B9C
	.align 2, 0
_08010B88: .4byte gUnknown_0814D9F4
_08010B8C: .4byte gUnknown_03000852
_08010B90:
	ldrh r4, [r3, #8]
_08010B92:
	adds r3, #0x10
	ldrb r0, [r3]
	cmp r0, r6
	beq _08010B5C
_08010B9A:
	adds r0, r4, #0
_08010B9C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start UpdateItemPlate
UpdateItemPlate: @ 0x08010BA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _08010BD0 @ =gUnknown_03002DA8
	bl sub_8016ED8
	cmp r0, #1
	bne _08010BB8
	adds r5, #0x38
_08010BB8:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #6
	bls _08010BC6
	b _08010DD2
_08010BC6:
	lsls r0, r1, #2
	ldr r1, _08010BD4 @ =_08010BD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010BD0: .4byte gUnknown_03002DA8
_08010BD4: .4byte _08010BD8
_08010BD8: @ jump table
	.4byte _08010DD2 @ case 0
	.4byte _08010BF4 @ case 1
	.4byte _08010C5A @ case 2
	.4byte _08010C9C @ case 3
	.4byte _08010CDA @ case 4
	.4byte _08010D64 @ case 5
	.4byte _08010DC8 @ case 6
_08010BF4:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5]
	bl sub_8016ED8
	cmp r0, #0
	bne _08010C18
	ldr r1, _08010C0C @ =0x040000D4
	ldr r0, _08010C10 @ =gUnknown_03002DA8
	str r0, [r1]
	ldr r0, _08010C14 @ =0x07000208
	b _08010C20
	.align 2, 0
_08010C0C: .4byte 0x040000D4
_08010C10: .4byte gUnknown_03002DA8
_08010C14: .4byte 0x07000208
_08010C18:
	ldr r1, _08010C3C @ =0x040000D4
	ldr r0, _08010C40 @ =gUnknown_03002DE0
	str r0, [r1]
	ldr r0, _08010C44 @ =0x07000240
_08010C20:
	str r0, [r1, #4]
	ldr r0, _08010C48 @ =0x80000004
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010C4C
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #4
	b _08010C52
	.align 2, 0
_08010C3C: .4byte 0x040000D4
_08010C40: .4byte gUnknown_03002DE0
_08010C44: .4byte 0x07000240
_08010C48: .4byte 0x80000004
_08010C4C:
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #6
_08010C52:
	strb r0, [r1]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08010C5A:
	adds r0, r4, #0
	bl sub_801100C
	adds r0, r4, #0
	adds r0, #0x9e
	ldrb r0, [r0]
	cmp r0, #2
	beq _08010C6C
	b _08010DD2
_08010C6C:
	ldr r3, _08010C98 @ =gUnknown_03002080
	adds r0, r3, #0
	adds r0, #0x42
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x3e
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #0xc
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #0x42
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	strb r2, [r6]
	b _08010DD2
	.align 2, 0
_08010C98: .4byte gUnknown_03002080
_08010C9C:
	adds r0, r4, #0
	bl sub_8010DD8
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010CBC
	ldr r0, _08010CB8 @ =0x0000C010
	strh r0, [r5, #2]
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #3
	b _08010CC6
	.align 2, 0
_08010CB8: .4byte 0x0000C010
_08010CBC:
	ldr r0, _08010CE4 @ =0x0000C0A0
	strh r0, [r5, #2]
	adds r1, r4, #0
	adds r1, #0x9e
	movs r0, #5
_08010CC6:
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r5, #4]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08010CDA:
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	bne _08010CE8
	movs r0, #6
	b _08010DD0
	.align 2, 0
_08010CE4: .4byte 0x0000C0A0
_08010CE8:
	adds r0, r4, #0
	bl sub_801100C
	adds r0, r4, #0
	adds r0, #0x9e
	ldrb r0, [r0]
	cmp r0, #1
	bne _08010CFC
	movs r0, #0x10
	strh r0, [r5]
_08010CFC:
	ldrb r4, [r4, #8]
	cmp r4, #6
	bls _08010DD2
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5]
	bl sub_8016ED8
	cmp r0, #0
	bne _08010D28
	ldr r1, _08010D1C @ =0x040000D4
	ldr r0, _08010D20 @ =gUnknown_03002DA8
	str r0, [r1]
	ldr r0, _08010D24 @ =0x07000208
	b _08010D30
	.align 2, 0
_08010D1C: .4byte 0x040000D4
_08010D20: .4byte gUnknown_03002DA8
_08010D24: .4byte 0x07000208
_08010D28:
	ldr r1, _08010D50 @ =0x040000D4
	ldr r0, _08010D54 @ =gUnknown_03002DE0
	str r0, [r1]
	ldr r0, _08010D58 @ =0x07000240
_08010D30:
	str r0, [r1, #4]
	ldr r0, _08010D5C @ =0x80000004
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _08010D60 @ =gUnknown_03002080
	movs r2, #0
	movs r0, #0xb0
	lsls r0, r0, #1
_08010D40:
	strh r2, [r1]
	subs r0, #1
	adds r1, #2
	cmp r0, #0
	bne _08010D40
	ldrb r0, [r6]
	adds r0, #1
	b _08010DD0
	.align 2, 0
_08010D50: .4byte 0x040000D4
_08010D54: .4byte gUnknown_03002DE0
_08010D58: .4byte 0x07000240
_08010D5C: .4byte 0x80000004
_08010D60: .4byte gUnknown_03002080
_08010D64:
	ldrb r2, [r4, #8]
	cmp r2, #6
	bhi _08010DD2
	adds r0, r4, #0
	bl sub_8010DD8
	movs r1, #0
	movs r0, #0x10
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010D88
	ldr r0, _08010D84 @ =0x0000C010
	b _08010D8A
	.align 2, 0
_08010D84: .4byte 0x0000C010
_08010D88:
	ldr r0, _08010DB8 @ =0x0000C0A0
_08010D8A:
	strh r0, [r5, #2]
	movs r0, #0x84
	lsls r0, r0, #5
	strh r0, [r5, #4]
	ldr r1, _08010DBC @ =gMain
	ldr r0, _08010DC0 @ =0x00000A04
	ldrh r1, [r1, #8]
	cmp r1, r0
	bne _08010DAC
	ldr r1, _08010DC4 @ =gIORegisters
	adds r1, #0x4a
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
_08010DAC:
	adds r0, r4, #0
	bl sub_801100C
	movs r0, #4
	b _08010DD0
	.align 2, 0
_08010DB8: .4byte 0x0000C0A0
_08010DBC: .4byte gMain
_08010DC0: .4byte 0x00000A04
_08010DC4: .4byte gIORegisters
_08010DC8:
	ldrb r4, [r4, #8]
	cmp r4, #0xa
	beq _08010DD2
	movs r0, #5
_08010DD0:
	strb r0, [r6]
_08010DD2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8010DD8
sub_8010DD8: @ 0x08010DD8
	push {r4, lr}
	ldr r4, _08010E18 @ =gUnknown_0200AFC0
	ldr r2, _08010E1C @ =gUnknown_08026E20
	ldr r1, _08010E20 @ =gUnknown_08026998
	adds r0, #0x98
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08010E24 @ =0x040000D4
	str r4, [r0]
	ldr r1, _08010E28 @ =0x05000220
	str r1, [r0, #4]
	ldr r1, _08010E2C @ =0x80000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r4, #0x20
	str r4, [r0]
	ldr r1, _08010E30 @ =0x06011000
	str r1, [r0, #4]
	ldr r1, _08010E34 @ =0x80000400
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010E18: .4byte gUnknown_0200AFC0
_08010E1C: .4byte gUnknown_08026E20
_08010E20: .4byte gUnknown_08026998
_08010E24: .4byte 0x040000D4
_08010E28: .4byte 0x05000220
_08010E2C: .4byte 0x80000010
_08010E30: .4byte 0x06011000
_08010E34: .4byte 0x80000400

	thumb_func_start sub_8010E38
sub_8010E38: @ 0x08010E38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r4, _08010F24 @ =gUnknown_030020C2
	adds r4, #2
	movs r2, #0
	adds r3, r7, #0
	adds r3, #0x9c
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	ldr r1, _08010F24 @ =gUnknown_030020C2
	mov r8, r1
	cmp r2, r0
	bhs _08010E90
	adds r6, r3, #0
	movs r0, #0x20
	mov ip, r0
_08010E5E:
	movs r1, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r5, r2, #1
	cmp r1, r0
	bhs _08010E7A
	movs r2, #0x38
_08010E6C:
	strh r2, [r4]
	adds r4, #2
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	blo _08010E6C
_08010E7A:
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r2, ip
	subs r0, r2, r1
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r2, r5, #0
	adds r3, r6, #0
	adds r1, #1
	cmp r2, r1
	blo _08010E5E
_08010E90:
	mov r4, r8
	movs r0, #0x30
	strh r0, [r4]
	adds r4, #2
	movs r2, #0
	adds r1, r7, #0
	adds r1, #0x9c
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r3, r1, #0
	cmp r2, r0
	bhs _08010EB8
	movs r5, #0x31
_08010EAA:
	strh r5, [r4]
	adds r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010EAA
_08010EB8:
	movs r0, #0x32
	strh r0, [r4]
	adds r5, r3, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	adds r0, #0x40
	mov r1, r8
	adds r4, r0, r1
	movs r0, #0x35
	strh r0, [r4]
	adds r4, #2
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bhs _08010EEA
	movs r1, #0x36
_08010EDC:
	strh r1, [r4]
	adds r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r2, r0
	blo _08010EDC
_08010EEA:
	movs r0, #0x37
	strh r0, [r4]
	mov r4, r8
	adds r4, #0x40
	movs r2, #0
	adds r1, r3, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bhs _08010F1A
	movs r5, #0x33
	movs r3, #0x34
_08010F02:
	strh r5, [r4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0, #2]
	adds r4, #0x40
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010F02
_08010F1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010F24: .4byte gUnknown_030020C2

	thumb_func_start sub_8010F28
sub_8010F28: @ 0x08010F28
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _08011008 @ =gUnknown_030020F8
	subs r4, #2
	movs r2, #0
	adds r3, r7, #0
	adds r3, #0x9c
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	ldr r1, _08011008 @ =gUnknown_030020F8
	mov ip, r1
	cmp r2, r0
	bhs _08010F76
	adds r6, r3, #0
_08010F46:
	movs r1, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r5, r2, #1
	cmp r1, r0
	bhs _08010F62
	movs r2, #0x38
_08010F54:
	strh r2, [r4]
	subs r4, #2
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	blo _08010F54
_08010F62:
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, #0x40
	adds r4, r4, r0
	adds r2, r5, #0
	adds r3, r6, #0
	adds r1, #1
	cmp r2, r1
	blo _08010F46
_08010F76:
	mov r4, ip
	movs r0, #0x32
	strh r0, [r4]
	subs r4, #2
	movs r2, #0
	adds r1, r7, #0
	adds r1, #0x9c
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r3, r1, #0
	cmp r2, r0
	bhs _08010F9E
	movs r5, #0x31
_08010F90:
	strh r5, [r4]
	subs r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010F90
_08010F9E:
	movs r0, #0x30
	strh r0, [r4]
	adds r5, r3, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #6
	adds r0, #0x40
	mov r1, ip
	adds r4, r0, r1
	movs r0, #0x37
	strh r0, [r4]
	subs r4, #2
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bhs _08010FD0
	movs r1, #0x36
_08010FC2:
	strh r1, [r4]
	subs r4, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r2, r0
	blo _08010FC2
_08010FD0:
	movs r0, #0x35
	strh r0, [r4]
	mov r4, ip
	adds r4, #0x40
	movs r2, #0
	adds r1, r3, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bhs _08011002
	movs r5, #0x34
	movs r3, #0x33
_08010FE8:
	strh r5, [r4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	subs r0, r4, r0
	subs r0, #2
	strh r3, [r0]
	adds r4, #0x40
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blo _08010FE8
_08011002:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011008: .4byte gUnknown_030020F8

	thumb_func_start sub_801100C
sub_801100C: @ 0x0801100C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x9e
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801102A
	ldr r1, _08011040 @ =gUnknown_030020C0
	movs r0, #0
	ldr r3, _08011044 @ =0x0000013F
	movs r2, #0
_08011020:
	strh r2, [r1]
	adds r0, #1
	adds r1, #2
	cmp r0, r3
	bls _08011020
_0801102A:
	adds r0, r4, #0
	adds r0, #0x9e
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #6
	bhi _08011088
	lsls r0, r1, #2
	ldr r1, _08011048 @ =_0801104C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08011040: .4byte gUnknown_030020C0
_08011044: .4byte 0x0000013F
_08011048: .4byte _0801104C
_0801104C: @ jump table
	.4byte _08011088 @ case 0
	.4byte _08011068 @ case 1
	.4byte _08011088 @ case 2
	.4byte _0801107A @ case 3
	.4byte _0801107A @ case 4
	.4byte _08011082 @ case 5
	.4byte _08011082 @ case 6
_08011068:
	adds r0, r4, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801107A
	adds r0, r4, #0
	bl sub_8010F28
	b _08011088
_0801107A:
	adds r0, r4, #0
	bl sub_8010E38
	b _08011088
_08011082:
	adds r0, r4, #0
	bl sub_8010F28
_08011088:
	adds r1, r4, #0
	adds r1, #0x9d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080110DA
	movs r0, #0
	strb r0, [r1]
	adds r3, r5, #0
	ldrb r0, [r3]
	cmp r0, #4
	beq _080110A8
	cmp r0, #6
	bne _080110C2
_080110A8:
	adds r1, r4, #0
	adds r1, #0x9c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080110BC
	subs r0, r2, #1
	strb r0, [r1]
	b _080110DA
_080110BC:
	movs r0, #2
	strb r0, [r3]
	b _080110DA
_080110C2:
	adds r1, r4, #0
	adds r1, #0x9c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #7
	bgt _080110D6
	adds r0, r2, #1
	strb r0, [r1]
	b _080110DA
_080110D6:
	movs r0, #1
	strb r0, [r5]
_080110DA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ResetSoundControl
ResetSoundControl: @ 0x080110E0
	ldr r0, _0801110C @ =gMain
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa0
	lsls r1, r1, #4
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x2e]
	strh r3, [r0, #0x2c]
	movs r1, #0xfe
	strh r1, [r0, #0x28]
	movs r2, #0xb0
	lsls r2, r2, #2
	adds r1, r0, r2
	strh r3, [r1]
	ldr r1, _08011110 @ =0x000002C2
	adds r0, r0, r1
	strh r3, [r0]
	bx lr
	.align 2, 0
_0801110C: .4byte gMain
_08011110: .4byte 0x000002C2

	thumb_func_start sub_8011114
sub_8011114: @ 0x08011114
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08011138 @ =gUnknown_0814DC44
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08011148
	adds r4, r1, #0
	adds r1, r2, #0
_0801112A:
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r3, r0
	bne _0801113C
	movs r0, #1
	b _0801114A
	.align 2, 0
_08011138: .4byte gUnknown_0814DC44
_0801113C:
	adds r1, #2
	adds r2, #2
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, r4
	bne _0801112A
_08011148:
	movs r0, #0
_0801114A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8011150
sub_8011150: @ 0x08011150
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801118C @ =gMain
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08011186
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r5, r1
	strh r4, [r0]
	adds r0, r4, #0
	bl sub_8011114
	cmp r0, #0
	beq _08011186
	ldr r1, _08011190 @ =0x000002C2
	adds r0, r5, r1
	strh r4, [r0]
_08011186:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801118C: .4byte gMain
_08011190: .4byte 0x000002C2

	thumb_func_start sub_8011194
sub_8011194: @ 0x08011194
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	ldr r6, _080111C4 @ =gMain
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r5, #0
	strh r5, [r0]
	adds r0, r4, #0
	bl sub_8011114
	cmp r0, #0
	beq _080111BC
	ldr r1, _080111C8 @ =0x000002C2
	adds r0, r6, r1
	strh r5, [r0]
_080111BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080111C4: .4byte gMain
_080111C8: .4byte 0x000002C2

	thumb_func_start sub_80111CC
sub_80111CC: @ 0x080111CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _08011208 @ =gMPlayTable
	ldr r0, _0801120C @ =gSongTable
	lsls r2, r4, #3
	adds r2, r2, r0
	ldrh r5, [r2, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl sub_8011114
	cmp r0, #0
	beq _08011200
	ldr r0, _08011210 @ =gMain
	ldr r1, _08011214 @ =0x000002C2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_08011200:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011208: .4byte gMPlayTable
_0801120C: .4byte gSongTable
_08011210: .4byte gMain
_08011214: .4byte 0x000002C2

	thumb_func_start sub_8011218
sub_8011218: @ 0x08011218
	push {r4, lr}
	adds r2, r1, #0
	ldr r3, _08011240 @ =gMPlayTable
	ldr r1, _08011244 @ =gSongTable
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r4, [r0, #4]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r0, [r1]
	ldr r1, _08011248 @ =0x0000FFFF
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl m4aMPlayVolumeControl
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011240: .4byte gMPlayTable
_08011244: .4byte gSongTable
_08011248: .4byte 0x0000FFFF

	thumb_func_start sub_801124C
sub_801124C: @ 0x0801124C
	ldr r2, _0801126C @ =gMPlayTable
	ldr r1, _08011270 @ =gSongTable
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _08011274
	movs r0, #1
	b _08011276
	.align 2, 0
_0801126C: .4byte gMPlayTable
_08011270: .4byte gSongTable
_08011274:
	movs r0, #0
_08011276:
	bx lr

	thumb_func_start sub_8011278
sub_8011278: @ 0x08011278
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080112A8 @ =gMain
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080112C0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x10
	ldrb r2, [r1]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _080112AC
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _080112B4
	.align 2, 0
_080112A8: .4byte gMain
_080112AC:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStartOrChange
_080112B4:
	strh r5, [r4, #0x28]
	movs r0, #0xa0
	lsls r0, r0, #4
	strh r0, [r4, #0x2e]
	movs r0, #4
	strb r0, [r6]
_080112C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80112C8
sub_80112C8: @ 0x080112C8
	push {r4, r5, lr}
	ldr r0, _0801130C @ =gMain
	adds r4, r0, #0
	adds r4, #0x24
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08011318
	ldr r5, _08011310 @ =gMPlayInfo_BGM
	adds r0, r5, #0
	bl m4aMPlayStop
	movs r1, #0xfb
	ldrb r0, [r4]
	ands r1, r0
	movs r2, #0
	movs r0, #2
	orrs r1, r0
	orrs r1, r2
	strb r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801131E
	movs r0, #1
	orrs r1, r0
	strb r1, [r4]
	ldr r1, _08011314 @ =0x0000FFFF
	adds r0, r5, #0
	movs r2, #4
	bl m4aMPlayVolumeControl
	b _0801131E
	.align 2, 0
_0801130C: .4byte gMain
_08011310: .4byte gMPlayInfo_BGM
_08011314: .4byte 0x0000FFFF
_08011318:
	movs r0, #1
	orrs r0, r1
	strb r0, [r4]
_0801131E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8011324
sub_8011324: @ 0x08011324
	push {r4, r5, r6, lr}
	ldr r6, _0801134C @ =gMain
	adds r5, r6, #0
	adds r5, #0x24
	movs r4, #1
	adds r0, r4, #0
	ldrb r1, [r5]
	ands r0, r1
	cmp r0, #0
	bne _08011344
	ldr r0, _08011350 @ =gMPlayInfo_BGM
	bl m4aMPlayStop
	strb r4, [r5]
	movs r0, #0xff
	strh r0, [r6, #0x28]
_08011344:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801134C: .4byte gMain
_08011350: .4byte gMPlayInfo_BGM

	thumb_func_start sub_8011354
sub_8011354: @ 0x08011354
	push {r4, lr}
	ldr r2, _08011390 @ =gMain
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080113B2
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080113AC
	ldrh r0, [r2, #0x28]
	cmp r0, #0xf0
	bne _08011394
	movs r1, #0x2e
	ldrsh r4, [r2, r1]
	movs r0, #0x1e
	movs r1, #0xf0
	bl sub_80113E8
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0x40
	bl sub_80115D4
	b _080113B2
	.align 2, 0
_08011390: .4byte gMain
_08011394:
	ldr r0, _080113A8 @ =gMPlayInfo_BGM
	bl m4aMPlayContinue
	movs r0, #0xfd
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	b _080113B0
	.align 2, 0
_080113A8: .4byte gMPlayInfo_BGM
_080113AC:
	movs r0, #0xfe
	ands r0, r1
_080113B0:
	strb r0, [r4]
_080113B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80113B8
sub_80113B8: @ 0x080113B8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080113E0 @ =gMain
	adds r4, r0, #0
	adds r4, #0x24
	movs r0, #4
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _080113DA
	ldr r0, _080113E4 @ =gMPlayInfo_BGM
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	bl m4aMPlayFadeOutTemporarily
	movs r0, #0x14
	strb r0, [r4]
_080113DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080113E0: .4byte gMain
_080113E4: .4byte gMPlayInfo_BGM

	thumb_func_start sub_80113E8
sub_80113E8: @ 0x080113E8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08011438 @ =gMain
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r4, r2
	ldr r0, [r0]
	movs r3, #2
	ands r0, r3
	cmp r0, #0
	bne _080114BC
	ldrh r0, [r4, #0x28]
	cmp r0, r1
	bne _08011440
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r2, [r5]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08011440
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _080114BC
	movs r0, #0xee
	ands r0, r2
	strb r0, [r5]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	ldr r4, _0801143C @ =gMPlayInfo_BGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	bl m4aMPlayStop
	b _080114BC
	.align 2, 0
_08011438: .4byte gMain
_0801143C: .4byte gMPlayInfo_BGM
_08011440:
	cmp r1, #0xff
	bne _08011492
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r2, [r5]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0801146E
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080114BC
	movs r1, #0xfe
	ands r1, r2
	strb r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080114BC
	bl sub_8011354
	b _080114BC
_0801146E:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0801148C
	ldr r0, _08011488 @ =gMPlayInfo_BGM
	lsls r1, r6, #0xc
	lsrs r1, r1, #0x10
	bl m4aMPlayFadeIn
	movs r0, #4
	strb r0, [r5]
	b _080114BC
	.align 2, 0
_08011488: .4byte gMPlayInfo_BGM
_0801148C:
	bl sub_8011354
	b _0801149E
_08011492:
	adds r0, r1, #0
	bl sub_8011278
	ldr r0, _080114C4 @ =gMPlayInfo_BGM
	bl m4aMPlayImmInit
_0801149E:
	cmp r6, #0
	beq _080114BC
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r1, r6, #0
	bl __udivsi3
	adds r0, #1
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0xc
	strb r0, [r1]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
_080114BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080114C4: .4byte gMPlayInfo_BGM

	thumb_func_start UpdateBGMFade
UpdateBGMFade: @ 0x080114C8
	push {r4, r5, r6, lr}
	ldr r2, _080114FC @ =gMain
	adds r5, r2, #0
	adds r5, #0x24
	movs r4, #3
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, #0
	bne _08011548
	ldrh r1, [r2, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0801153C
	ldrh r6, [r2, #0x2e]
	adds r1, r1, r6
	strh r1, [r2, #0x2e]
	cmp r0, #0
	ble _08011500
	lsls r1, r1, #0x10
	ldrh r3, [r2, #0x20]
	lsls r0, r3, #0x10
	cmp r1, r0
	ble _08011512
	b _0801150A
	.align 2, 0
_080114FC: .4byte gMain
_08011500:
	lsls r1, r1, #0x10
	ldrh r3, [r2, #0x20]
	lsls r0, r3, #0x10
	cmp r1, r0
	bge _08011512
_0801150A:
	strh r3, [r2, #0x2e]
	strh r4, [r2, #0x2c]
	movs r0, #4
	strb r0, [r5]
_08011512:
	ldr r4, _08011534 @ =gMPlayInfo_BGM
	ldr r5, _08011538 @ =0x0000FFFF
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	movs r1, #0xa
	bl __divsi3
	adds r2, r0, #0
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayVolumeControl
	b _08011548
	.align 2, 0
_08011534: .4byte gMPlayInfo_BGM
_08011538: .4byte 0x0000FFFF
_0801153C:
	ldr r0, _08011550 @ =gMPlayInfo_BGM
	ldr r0, [r0, #4]
	cmp r0, #0
	bge _08011548
	movs r0, #2
	strb r0, [r5]
_08011548:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011550: .4byte gMPlayInfo_BGM

	thumb_func_start sub_8011554
sub_8011554: @ 0x08011554
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #3
	bhi _08011560
	movs r4, #4
_08011560:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08011584
	ldr r0, _080115C0 @ =gMPlayInfo_BGM
	ldr r1, _080115C4 @ =0x0000FFFF
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	bl m4aMPlayVolumeControl
	ldr r1, _080115C8 @ =gMain
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r1, #0x2e]
_08011584:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0801159E
	ldr r0, _080115CC @ =gMPlayInfo_SE1
	ldr r1, _080115C4 @ =0x0000FFFF
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	bl m4aMPlayVolumeControl
_0801159E:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _080115B8
	ldr r0, _080115D0 @ =gMPlayInfo_SE2
	ldr r1, _080115C4 @ =0x0000FFFF
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r2, r3, #0
	ands r4, r2
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
_080115B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080115C0: .4byte gMPlayInfo_BGM
_080115C4: .4byte 0x0000FFFF
_080115C8: .4byte gMain
_080115CC: .4byte gMPlayInfo_SE1
_080115D0: .4byte gMPlayInfo_SE2

	thumb_func_start sub_80115D4
sub_80115D4: @ 0x080115D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r5, _080115F8 @ =gMain
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08011648
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bls _080115FC
	adds r4, r0, #0
	b _08011602
	.align 2, 0
_080115F8: .4byte gMain
_080115FC:
	cmp r4, #3
	bhi _08011602
	movs r4, #4
_08011602:
	cmp r2, #0
	beq _0801162E
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r5, #0x20]
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	movs r3, #0x2e
	ldrsh r1, [r5, r3]
	subs r0, r0, r1
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #8
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _08011648
_0801162E:
	ldr r0, _08011650 @ =gMPlayInfo_BGM
	ldr r1, _08011654 @ =0x0000FFFF
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	bl m4aMPlayVolumeControl
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
_08011648:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011650: .4byte gMPlayInfo_BGM
_08011654: .4byte 0x0000FFFF

	thumb_func_start sub_8011658
sub_8011658: @ 0x08011658
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08011672
	ldr r0, _080116A0 @ =gMPlayInfo_BGM
	ldr r1, _080116A4 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl m4aMPlayPanpotControl
_08011672:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08011686
	ldr r0, _080116A8 @ =gMPlayInfo_SE1
	ldr r1, _080116A4 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl m4aMPlayPanpotControl
_08011686:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801169A
	ldr r0, _080116AC @ =gMPlayInfo_SE2
	ldr r1, _080116A4 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl m4aMPlayPanpotControl
_0801169A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080116A0: .4byte gMPlayInfo_BGM
_080116A4: .4byte 0x0000FFFF
_080116A8: .4byte gMPlayInfo_SE1
_080116AC: .4byte gMPlayInfo_SE2

	thumb_func_start sub_80116B0
sub_80116B0: @ 0x080116B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011700 @ =0x00000C64
	adds r2, r4, r0
	ldr r1, _08011704 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08011708 @ =0x0000F1FF
	ldrh r3, [r1]
	ands r0, r3
	movs r3, #0
	strh r0, [r1]
	strh r3, [r2]
	strh r3, [r2, #2]
	strh r3, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #8]
	strh r0, [r2, #0xa]
	strh r3, [r2, #0xc]
	strh r3, [r2, #0xe]
	bl sub_80112C8
	bl ResetSoundControl
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	ldr r0, _0801170C @ =gUnknown_08026F94
	movs r1, #0xa
	movs r2, #3
	bl nullsub_20
	ldr r0, _08011710 @ =gUnknown_08026FA0
	movs r1, #9
	movs r2, #0x11
	bl nullsub_20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011700: .4byte 0x00000C64
_08011704: .4byte gIORegisters
_08011708: .4byte 0x0000F1FF
_0801170C: .4byte gUnknown_08026F94
_08011710: .4byte gUnknown_08026FA0

	thumb_func_start sub_8011714
sub_8011714: @ 0x08011714
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08011730 @ =0x00000C64
	adds r5, r4, r0
	ldr r1, _08011734 @ =gJoypad
	ldrh r2, [r1, #2]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08011738
	ldrb r0, [r5, #6]
	subs r0, #1
	b _08011744
	.align 2, 0
_08011730: .4byte 0x00000C64
_08011734: .4byte gJoypad
_08011738:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08011746
	ldrb r0, [r5, #6]
	adds r0, #1
_08011744:
	strb r0, [r5, #6]
_08011746:
	movs r0, #6
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08011752
	movs r0, #3
	b _08011758
_08011752:
	cmp r0, #3
	ble _0801175A
	movs r0, #0
_08011758:
	strb r0, [r5, #6]
_0801175A:
	movs r2, #6
	ldrsb r2, [r5, r2]
	cmp r2, #1
	beq _08011818
	cmp r2, #1
	bgt _0801176C
	cmp r2, #0
	beq _0801177A
	b _08011B04
_0801176C:
	cmp r2, #2
	bne _08011772
	b _0801198C
_08011772:
	cmp r2, #3
	bne _08011778
	b _08011A5C
_08011778:
	b _08011B04
_0801177A:
	ldrh r2, [r1, #2]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080117AC
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011794
	ldrh r0, [r5, #4]
	subs r0, #0xa
	b _08011798
_08011794:
	ldrh r0, [r5, #4]
	subs r0, #1
_08011798:
	strh r0, [r5, #4]
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _080117F2
	ldr r0, _080117A8 @ =0x00000141
	strh r0, [r5, #4]
	b _080117F2
	.align 2, 0
_080117A8: .4byte 0x00000141
_080117AC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080117E0
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080117C4
	ldrh r0, [r5, #4]
	adds r0, #0xa
	b _080117C8
_080117C4:
	ldrh r0, [r5, #4]
	adds r0, #1
_080117C8:
	strh r0, [r5, #4]
	movs r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, _080117DC @ =0x00000141
	cmp r1, r0
	ble _080117F2
	movs r0, #0
	strh r0, [r5, #4]
	b _080117F2
	.align 2, 0
_080117DC: .4byte 0x00000141
_080117E0:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080117F2
	movs r1, #4
	ldrsh r0, [r5, r1]
	adds r0, #0x2a
	bl sub_8011150
_080117F2:
	ldr r0, _0801180C @ =gUnknown_08026FB0
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _08011810 @ =gUnknown_08026FBC
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011814 @ =gUnknown_08026FC8
	b _08011A34
	.align 2, 0
_0801180C: .4byte gUnknown_08026FB0
_08011810: .4byte gUnknown_08026FBC
_08011814: .4byte gUnknown_08026FC8
_08011818:
	ldrh r3, [r1, #2]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08011856
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011832
	ldrh r0, [r5, #2]
	subs r0, #0xa
	b _08011836
_08011832:
	ldrh r0, [r5, #2]
	subs r0, #1
_08011836:
	strh r0, [r5, #2]
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08011844
	movs r0, #0xf9
	strh r0, [r5, #2]
_08011844:
	ldrh r0, [r5, #2]
	subs r0, #0x2a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9e
	bhi _08011934
	movs r0, #0xf9
	strh r0, [r5, #2]
	b _08011934
_08011856:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08011892
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801186E
	ldrh r0, [r5, #2]
	adds r0, #0xa
	b _08011872
_0801186E:
	ldrh r0, [r5, #2]
	adds r0, #1
_08011872:
	strh r0, [r5, #2]
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0xf9
	ble _08011880
	movs r0, #0
	strh r0, [r5, #2]
_08011880:
	ldrh r0, [r5, #2]
	subs r0, #0x2a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9e
	bhi _08011934
	movs r0, #0xc9
	strh r0, [r5, #2]
	b _08011934
_08011892:
	ands r2, r3
	lsls r0, r2, #0x10
	cmp r0, #0
	beq _080118FA
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	cmp r0, r1
	beq _080118B0
	movs r0, #0x78
	bl sub_80113B8
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _08011934
_080118B0:
	ldr r4, _080118C8 @ =gMPlayInfo_BGM
	ldr r1, [r4, #4]
	cmp r1, #0
	bge _080118F4
	ldr r0, _080118CC @ =0x0000FFFF
	ands r1, r0
	cmp r1, #0
	beq _080118D0
	bl sub_8011354
	b _08011934
	.align 2, 0
_080118C8: .4byte gMPlayInfo_BGM
_080118CC: .4byte 0x0000FFFF
_080118D0:
	movs r1, #2
	ldrsh r0, [r5, r1]
	bl sub_8011278
	adds r0, r4, #0
	bl m4aMPlayImmInit
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl sub_8011554
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl sub_8011658
	b _08011934
_080118F4:
	bl sub_80112C8
	b _08011934
_080118FA:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0801190C
	movs r0, #0x14
	bl sub_80113B8
	b _08011934
_0801190C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08011934
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801192A
	movs r0, #0x78
	movs r1, #0xff
	bl sub_80113E8
	b _08011934
_0801192A:
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x78
	bl sub_80113E8
_08011934:
	ldr r0, _08011968 @ =gUnknown_08026FB0
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _0801196C @ =gUnknown_08026FBC
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011970 @ =gUnknown_08026FD4
	movs r1, #0xb
	movs r2, #0xf
	bl nullsub_20
	ldr r0, _08011974 @ =gMPlayInfo_BGM
	ldr r0, [r0, #4]
	cmp r0, #0
	blt _0801197C
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	cmp r1, r0
	bne _0801197C
	ldr r0, _08011978 @ =gUnknown_08026FE0
	b _0801197E
	.align 2, 0
_08011968: .4byte gUnknown_08026FB0
_0801196C: .4byte gUnknown_08026FBC
_08011970: .4byte gUnknown_08026FD4
_08011974: .4byte gMPlayInfo_BGM
_08011978: .4byte gUnknown_08026FE0
_0801197C:
	ldr r0, _08011988 @ =gUnknown_08026FC8
_0801197E:
	movs r1, #0xb
	movs r2, #0xe
	bl nullsub_20
	b _08011B04
	.align 2, 0
_08011988: .4byte gUnknown_08026FC8
_0801198C:
	ldr r3, _080119A8 @ =gJoypad
	ldr r1, [r3]
	ldr r0, _080119AC @ =gUnknown_02000020
	ands r0, r1
	cmp r0, #0
	beq _080119CE
	ldrh r3, [r3]
	ands r2, r3
	cmp r2, #0
	beq _080119B0
	ldrh r0, [r5, #8]
	subs r0, #0xa
	b _080119B4
	.align 2, 0
_080119A8: .4byte gJoypad
_080119AC: .4byte gUnknown_02000020
_080119B0:
	ldrh r0, [r5, #8]
	subs r0, #1
_080119B4:
	strh r0, [r5, #8]
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #3
	bgt _080119C2
	movs r0, #4
	strh r0, [r5, #8]
_080119C2:
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl sub_8011554
	b _08011A06
_080119CE:
	ldr r0, _080119E4 @ =0x01000010
	ands r1, r0
	cmp r1, #0
	beq _08011A06
	ldrh r3, [r3]
	ands r2, r3
	cmp r2, #0
	beq _080119E8
	ldrh r0, [r5, #8]
	adds r0, #0xa
	b _080119EC
	.align 2, 0
_080119E4: .4byte 0x01000010
_080119E8:
	ldrh r0, [r5, #8]
	adds r0, #1
_080119EC:
	strh r0, [r5, #8]
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #0xff
	lsls r1, r1, #1
	cmp r0, r1
	ble _080119FC
	strh r1, [r5, #8]
_080119FC:
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl sub_8011554
_08011A06:
	ldr r1, _08011A48 @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08011A1E
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r5, #8]
	movs r0, #1
	bl sub_8011554
_08011A1E:
	ldr r0, _08011A4C @ =gUnknown_08026FEC
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _08011A50 @ =gUnknown_08026FF8
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011A54 @ =gUnknown_08027004
_08011A34:
	movs r1, #0xb
	movs r2, #0xe
	bl nullsub_20
	ldr r0, _08011A58 @ =gUnknown_08026FD4
	movs r1, #0xb
	movs r2, #0xf
	bl nullsub_20
	b _08011B04
	.align 2, 0
_08011A48: .4byte gJoypad
_08011A4C: .4byte gUnknown_08026FEC
_08011A50: .4byte gUnknown_08026FF8
_08011A54: .4byte gUnknown_08027004
_08011A58: .4byte gUnknown_08026FD4
_08011A5C:
	ldrh r2, [r1]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08011A90
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08011A74
	ldrh r0, [r5, #0xc]
	subs r0, #0xa
	b _08011A78
_08011A74:
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08011A78:
	strh r0, [r5, #0xc]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08011ABC
	ldr r0, _08011A8C @ =0x0000FF80
	b _08011ABA
	.align 2, 0
_08011A8C: .4byte 0x0000FF80
_08011A90:
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08011AC8
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08011AAA
	ldrh r0, [r5, #0xc]
	adds r0, #0xa
	b _08011AAE
_08011AAA:
	ldrh r0, [r5, #0xc]
	adds r0, #1
_08011AAE:
	strh r0, [r5, #0xc]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0x7f
	ble _08011ABC
	movs r0, #0x7f
_08011ABA:
	strh r0, [r5, #0xc]
_08011ABC:
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl sub_8011658
	b _08011ADC
_08011AC8:
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08011ADC
	strh r3, [r5, #0xc]
	movs r0, #1
	movs r1, #0
	bl sub_8011658
_08011ADC:
	ldr r0, _08011BA0 @ =gUnknown_08027010
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _08011BA4 @ =gUnknown_0802701C
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011BA8 @ =gUnknown_08027028
	movs r1, #0xb
	movs r2, #0xe
	bl nullsub_20
	ldr r0, _08011BAC @ =gUnknown_08026FD4
	movs r1, #0xb
	movs r2, #0xf
	bl nullsub_20
_08011B04:
	ldr r0, _08011BB0 @ =gUnknown_08027034
	movs r1, #5
	movs r2, #5
	bl nullsub_20
	movs r1, #4
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	movs r2, #5
	movs r3, #2
	bl nullsub_6
	ldr r0, _08011BB4 @ =gUnknown_08027040
	movs r1, #5
	movs r2, #6
	bl nullsub_20
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	movs r2, #6
	bl sub_8006470
	ldr r0, _08011BB8 @ =gUnknown_0802704C
	movs r1, #5
	movs r2, #7
	bl nullsub_20
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #0x32
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08011B5C
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #4
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r0, r1, #0x1f
_08011B5C:
	movs r1, #0xa
	movs r2, #7
	bl sub_8006470
	ldr r0, _08011BBC @ =gUnknown_08027058
	movs r1, #5
	movs r2, #8
	bl nullsub_20
	ldr r4, _08011BC0 @ =gUnknown_08027070
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	movs r1, #0x14
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, #0x11
	adds r0, r4, #0
	movs r2, #8
	bl nullsub_20
	ldr r0, _08011BC4 @ =gMPlayInfo_BGM
	ldr r1, [r0, #4]
	cmp r1, #0
	bge _08011BE0
	ldr r0, _08011BC8 @ =0x0000FFFF
	ands r1, r0
	cmp r1, #0
	beq _08011BD0
	ldr r0, _08011BCC @ =gUnknown_08027074
	b _08011BD2
	.align 2, 0
_08011BA0: .4byte gUnknown_08027010
_08011BA4: .4byte gUnknown_0802701C
_08011BA8: .4byte gUnknown_08027028
_08011BAC: .4byte gUnknown_08026FD4
_08011BB0: .4byte gUnknown_08027034
_08011BB4: .4byte gUnknown_08027040
_08011BB8: .4byte gUnknown_0802704C
_08011BBC: .4byte gUnknown_08027058
_08011BC0: .4byte gUnknown_08027070
_08011BC4: .4byte gMPlayInfo_BGM
_08011BC8: .4byte 0x0000FFFF
_08011BCC: .4byte gUnknown_08027074
_08011BD0:
	ldr r0, _08011BDC @ =gUnknown_0802707C
_08011BD2:
	movs r1, #0xf
	movs r2, #6
	bl nullsub_20
	b _08011BEA
	.align 2, 0
_08011BDC: .4byte gUnknown_0802707C
_08011BE0:
	ldr r0, _08011C00 @ =gUnknown_08027084
	movs r1, #0xf
	movs r2, #6
	bl nullsub_20
_08011BEA:
	ldr r0, _08011C04 @ =gUnknown_0802708C
	movs r2, #6
	ldrsb r2, [r5, r2]
	adds r2, #5
	movs r1, #5
	bl nullsub_20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011C00: .4byte gUnknown_08027084
_08011C04: .4byte gUnknown_0802708C

	thumb_func_start sub_8011C08
sub_8011C08: @ 0x08011C08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08011C54 @ =0x00000C64
	adds r4, r5, r0
	ldr r6, _08011C58 @ =gMPlayInfo_BGM
	ldr r1, [r6, #4]
	cmp r1, #0
	blt _08011C20
	ldr r0, _08011C5C @ =0x0000FFFF
	ands r1, r0
	cmp r1, #0
	bne _08011C4C
_08011C20:
	movs r1, #2
	ldrsh r0, [r4, r1]
	bl sub_8011278
	adds r0, r6, #0
	bl m4aMPlayImmInit
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r0, #1
	bl sub_8011554
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #1
	bl sub_8011658
	ldrh r0, [r4, #2]
	strh r0, [r4]
	ldrb r0, [r5, #1]
	subs r0, #1
	strb r0, [r5, #1]
_08011C4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011C54: .4byte 0x00000C64
_08011C58: .4byte gMPlayInfo_BGM
_08011C5C: .4byte 0x0000FFFF

	thumb_func_start sub_8011C60
sub_8011C60: @ 0x08011C60
	push {lr}
	adds r2, r0, #0
	ldr r1, _08011C8C @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08011C76
	ldr r1, _08011C90 @ =gMain
	movs r0, #3
	strb r0, [r1, #9]
_08011C76:
	ldr r0, _08011C94 @ =gUnknown_0814DC64
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08011C8C: .4byte gJoypad
_08011C90: .4byte gMain
_08011C94: .4byte gUnknown_0814DC64

	thumb_func_start sub_8011C98
sub_8011C98: @ 0x08011C98
	ldr r0, _08011CA8 @ =gUnknown_03000800
	movs r1, #1
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_08011CA8: .4byte gUnknown_03000800

	thumb_func_start ResetAnimationSystem
ResetAnimationSystem: @ 0x08011CAC
	push {r4, lr}
	sub sp, #4
	ldr r2, _08011CE8 @ =gUnknown_03000800
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
	bl sub_8011C98
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011CE8: .4byte gUnknown_03000800
_08011CEC: .4byte 0x040000D4
_08011CF0: .4byte 0x81000440
_08011CF4: .4byte gMain

	thumb_func_start sub_8011CF8
sub_8011CF8: @ 0x08011CF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08011D5C @ =gUnknown_03000844
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
_08011D5C: .4byte gUnknown_03000844
_08011D60: .4byte 0x0000083C
_08011D64: .4byte gOamObjects

	thumb_func_start sub_8011D68
sub_8011D68: @ 0x08011D68
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r1, _08011D8C @ =gUnknown_0300103C
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
_08011D8C: .4byte gUnknown_0300103C
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
	bl sub_8011D68
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
	bl sub_8012F7C
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
	ldr r4, _08011E70 @ =gUnknown_0300103C
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
_08011E70: .4byte gUnknown_0300103C
_08011E74: .4byte 0xFFFFF808
_08011E78: .4byte gUnknown_080280F0

	thumb_func_start sub_8011E7C
sub_8011E7C: @ 0x08011E7C
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
	ldr r2, _08011F38 @ =gUnknown_08026430
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
_08011F38: .4byte gUnknown_08026430
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

	thumb_func_start sub_8011F90
sub_8011F90: @ 0x08011F90
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
	bl sub_800653C
	adds r4, r0, #0
	ldr r5, _0801205C @ =gUnknown_08026430
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
	ldr r6, _08012060 @ =gOamObjects
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r7, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r4, #0
	bl sub_800650C
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r7, #1
	ldrh r5, [r5]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	bl sub_800650C
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r7, #1
	mov r0, r8
	adds r1, r4, #0
	bl sub_800650C
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
_0801205C: .4byte gUnknown_08026430
_08012060: .4byte gOamObjects

	thumb_func_start sub_8012064
sub_8012064: @ 0x08012064
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

	thumb_func_start sub_801208C
sub_801208C: @ 0x0801208C
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

	thumb_func_start sub_8012180
sub_8012180: @ 0x08012180
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
	ldr r0, _08012404 @ =gUnknown_03000800
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
_08012404: .4byte gUnknown_03000800
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

	thumb_func_start sub_8012504
sub_8012504: @ 0x08012504
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
	bl sub_800647C
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
	ldr r3, _080125FC @ =gUnknown_03000800
	movs r4, #0
	movs r0, #0x26
	adds r0, r0, r2
	mov ip, r0
	b _08012602
	.align 2, 0
_080125FC: .4byte gUnknown_03000800
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

	thumb_func_start sub_8012634
sub_8012634: @ 0x08012634
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

	thumb_func_start sub_8012684
sub_8012684: @ 0x08012684
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
	ldr r5, _08012740 @ =gUnknown_03000844
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
	bl sub_8012F7C
_08012736:
	movs r0, #0
	b _08012802
	.align 2, 0
_0801273C: .4byte gMain
_08012740: .4byte gUnknown_03000844
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

	thumb_func_start sub_8012824
sub_8012824: @ 0x08012824
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
	bl sub_8012864
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801285C: .4byte gMain
_08012860: .4byte gUnknown_080272B8

	thumb_func_start sub_8012864
sub_8012864: @ 0x08012864
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
	ldr r6, _08012A80 @ =gUnknown_03000844
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
	bl sub_8012864
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
_08012A80: .4byte gUnknown_03000844
_08012A84: .4byte 0x06015800
_08012A88: .4byte gUnknown_08027090
_08012A8C: .4byte 0x040000D4
_08012A90: .4byte 0x8000000E

	thumb_func_start sub_8012A94
sub_8012A94: @ 0x08012A94
	adds r1, r0, #0
	ldr r2, _08012ACC @ =gUnknown_03000844
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
_08012ACC: .4byte gUnknown_03000844
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
	bl sub_8011150
_08012B88:
	ldr r1, [r4, #0x38]
	movs r0, #4
	ldrb r2, [r1, #3]
	ands r0, r2
	cmp r0, #0
	beq _08012B9A
	ldrb r0, [r1, #5]
	bl sub_8012634
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
	bl sub_8011150
_08012C0A:
	ldr r1, [r4, #0x38]
	movs r0, #4
	ldrb r2, [r1, #3]
	ands r0, r2
	cmp r0, #0
	beq _08012C1C
	ldrb r0, [r1, #5]
	bl sub_8012634
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
	bl sub_8012F7C
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
	ldr r0, _08012D2C @ =gUnknown_03000800
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
_08012D2C: .4byte gUnknown_03000800
_08012D30: .4byte gOamObjects
_08012D34: .4byte 0x000001FF

	thumb_func_start sub_8012D38
sub_8012D38: @ 0x08012D38
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
	bl sub_8011D68
	adds r3, r0, #0
	b _08012D72
	.align 2, 0
_08012D64: .4byte gIORegisters
_08012D68: .4byte gMain
_08012D6C: .4byte gScriptContext
_08012D70:
	ldr r3, _08012DC0 @ =gUnknown_03000844
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
_08012DC0: .4byte gUnknown_03000844
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
	bl sub_801208C
	b _08012F3C
	.align 2, 0
_08012ED8: .4byte gMain
_08012EDC: .4byte gIORegisters
_08012EE0: .4byte 0x00003942
_08012EE4: .4byte 0x0000071F
_08012EE8: .4byte 0xFDFFFFFF
_08012EEC:
	adds r0, r4, #0
	bl sub_8012F7C
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

	thumb_func_start sub_8012F44
sub_8012F44: @ 0x08012F44
	push {r4, r5, lr}
	ldr r2, _08012F78 @ =gUnknown_03000800
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
_08012F78: .4byte gUnknown_03000800

	thumb_func_start sub_8012F7C
sub_8012F7C: @ 0x08012F7C
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
	ldr r5, _080131B4 @ =gUnknown_03002FA0
	ldr r0, _080131B8 @ =gUnknown_03000800
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
_080131B4: .4byte gUnknown_03002FA0
_080131B8: .4byte gUnknown_03000800
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
	ldr r0, _08013418 @ =gUnknown_03000800
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0xb
	beq _0801339C
	cmp r0, #0x21
	beq _0801339C
	b _0801349C
_0801339C:
	ldr r6, _08013418 @ =gUnknown_03000800
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
_08013418: .4byte gUnknown_03000800
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
	ldr r0, _08013478 @ =gUnknown_03003E50
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
_08013478: .4byte gUnknown_03003E50
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
	ldr r0, _0801357C @ =gUnknown_03000800
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
_0801357C: .4byte gUnknown_03000800
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
	ldr r2, _08013838 @ =gUnknown_03000800
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
_08013838: .4byte gUnknown_03000800
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
	bl sub_801208C
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
	bl sub_8012824
	adds r0, r4, #0
	movs r1, #1
	bl sub_801208C
_0801388A:
	ldrh r7, [r5, #0x36]
	cmp r7, #0x80
	bne _080138D6
	adds r0, r4, #0
	movs r1, #0
	bl sub_801208C
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
	bl sub_8012F7C
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
	bl sub_8012F7C
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
	ldr r4, _080139EC @ =gUnknown_03000844
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
	bl sub_8011CF8
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
_080139EC: .4byte gUnknown_03000844

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
	ldr r0, _08013ABC @ =gUnknown_03000800
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
_08013ABC: .4byte gUnknown_03000800
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
	ldr r2, _08013BFC @ =gUnknown_03000800
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
_08013BFC: .4byte gUnknown_03000800
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
	bl sub_801208C
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
	bl sub_8012824
	adds r0, r4, #0
	movs r1, #1
	bl sub_801208C
_08013C4E:
	ldrh r7, [r5, #0x36]
	cmp r7, #0x80
	bne _08013C9A
	adds r0, r4, #0
	movs r1, #0
	bl sub_801208C
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
	bl sub_8012F7C
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
	bl sub_8012F7C
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
	ldr r4, _08013DAC @ =gUnknown_03000844
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
	bl sub_8011CF8
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
_08013DAC: .4byte gUnknown_03000844

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
	ldr r0, _08013E64 @ =gUnknown_03000800
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
	bl sub_800B974
_08013E44:
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0xe
	ble _08013E6C
	ldr r3, _08013E68 @ =0xFFFFFE20
	adds r0, r5, r3
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08013E78
	.align 2, 0
_08013E5C: .4byte gScriptContext
_08013E60: .4byte gUnknown_0802817C
_08013E64: .4byte gUnknown_03000800
_08013E68: .4byte 0xFFFFFE20
_08013E6C:
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
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
	ldr r0, _08013F1C @ =gUnknown_03000800
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
	bl sub_800B974
_08013F00:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xe
	ble _08013F20
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08013F2E
	.align 2, 0
_08013F14: .4byte gScriptContext
_08013F18: .4byte gUnknown_0802817C
_08013F1C: .4byte gUnknown_03000800
_08013F20:
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r5, r2
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
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
	ldr r0, _08013FF0 @ =gUnknown_03000800
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
	bl sub_800B7CC
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
	bl sub_800B898
	b _0801401E
	.align 2, 0
_08013FE8: .4byte gScriptContext
_08013FEC: .4byte gUnknown_0802819B
_08013FF0: .4byte gUnknown_03000800
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
	bl sub_800BB14
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
	ldr r0, _080140EC @ =gUnknown_03000800
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
	bl sub_800B974
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
	bl sub_800B898
	b _08014124
	.align 2, 0
_080140E4: .4byte gScriptContext
_080140E8: .4byte gUnknown_080281BA
_080140EC: .4byte gUnknown_03000800
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
	bl sub_800BB14
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
	ldr r0, _080141E8 @ =gUnknown_03000800
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
	bl sub_800B7CC
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
	bl sub_800B898
	b _08014214
	.align 2, 0
_080141E0: .4byte gScriptContext
_080141E4: .4byte gUnknown_0802819B
_080141E8: .4byte gUnknown_03000800
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
	bl sub_800BA40
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
	ldr r0, _080142E0 @ =gUnknown_03000800
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
	bl sub_800B974
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
	bl sub_800B898
	b _08014316
	.align 2, 0
_080142D8: .4byte gScriptContext
_080142DC: .4byte gUnknown_080281BA
_080142E0: .4byte gUnknown_03000800
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
	bl sub_800BA40
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
	ldr r0, _08014360 @ =gUnknown_03000844
	ldr r2, [r1]
	adds r1, r3, #0
	bl _call_via_r2
_08014356:
	pop {r0}
	bx r0
	.align 2, 0
_0801435C: .4byte gUnknown_0814DC90
_08014360: .4byte gUnknown_03000844

	thumb_func_start sub_8014364
sub_8014364: @ 0x08014364
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

	thumb_func_start sub_80143FC
sub_80143FC: @ 0x080143FC
	bx lr
	.align 2, 0

	thumb_func_start sub_8014400
sub_8014400: @ 0x08014400
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	ldr r0, _0801446C @ =gIORegisters
	mov r8, r0
	ldr r1, _08014470 @ =0x00000C64
	adds r6, r5, r1
	movs r0, #0xff
	bl sub_8011D68
	adds r4, r0, #0
	str r4, [r6, #0x44]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x44
	bl memcpy
	bl sub_8011CF8
	movs r1, #0
	str r1, [r4]
	ldr r2, _08014474 @ =0x00000CAC
	adds r0, r5, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldrb r0, [r5, #1]
	adds r0, #1
	strb r0, [r5, #1]
	movs r0, #0x4a
	add r8, r0
	ldr r0, _08014478 @ =0x0000FDFF
	mov r1, r8
	ldrh r1, [r1]
	ands r0, r1
	mov r2, r8
	strh r0, [r2]
	movs r0, #2
	bl sub_80049A0
	movs r0, #0x11
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8012684
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801446C: .4byte gIORegisters
_08014470: .4byte 0x00000C64
_08014474: .4byte 0x00000CAC
_08014478: .4byte 0x0000FDFF

	thumb_func_start sub_801447C
sub_801447C: @ 0x0801447C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _080144D4 @ =gCourtScroll
	ldr r0, _080144D8 @ =0x00000C64
	adds r7, r5, r0
	movs r1, #0
	mov r8, r1
	movs r0, #0xff
	bl sub_8011D68
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _0801449C
	b _08014668
_0801449C:
	ldr r0, _080144DC @ =gUnknown_080281F0
	movs r1, #0
	movs r2, #2
	bl nullsub_20
	ldr r0, _080144E0 @ =gJoypad
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080144E8
	ldr r2, _080144E4 @ =0x00000CAC
	adds r1, r5, r2
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r3, #1
	mov r8, r3
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _080144CC
	b _080145E2
_080144CC:
	movs r0, #2
	strb r0, [r1]
	b _080145E2
	.align 2, 0
_080144D4: .4byte gCourtScroll
_080144D8: .4byte 0x00000C64
_080144DC: .4byte gUnknown_080281F0
_080144E0: .4byte gJoypad
_080144E4: .4byte 0x00000CAC
_080144E8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08014510
	ldr r0, _0801450C @ =0x00000CAC
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r3, #1
	mov r8, r3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _080145E2
	strb r2, [r1]
	b _080145E2
	.align 2, 0
_0801450C: .4byte 0x00000CAC
_08014510:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080145E2
	movs r6, #0
	ldr r1, _08014534 @ =0x00000CAC
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08014566
	cmp r0, #1
	bgt _08014538
	cmp r0, #0
	beq _0801453E
	b _080145A8
	.align 2, 0
_08014534: .4byte 0x00000CAC
_08014538:
	cmp r0, #2
	beq _0801458C
	b _080145A8
_0801453E:
	ldr r6, _08014554 @ =gPalCourtScroll
	ldr r2, _08014558 @ =0x00000CAD
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801455C
	movs r0, #1
	b _08014578
	.align 2, 0
_08014554: .4byte gPalCourtScroll
_08014558: .4byte 0x00000CAD
_0801455C:
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #1
	movs r2, #3
	b _0801457C
_08014566:
	ldr r6, _08014584 @ =gPalCourtScroll
	ldr r3, _08014588 @ =0x00000CAD
	adds r0, r5, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _080145D0
	movs r0, #2
_08014578:
	movs r1, #1
	movs r2, #0x11
_0801457C:
	movs r3, #0
	bl sub_8014364
	b _080145A8
	.align 2, 0
_08014584: .4byte gPalCourtScroll
_08014588: .4byte 0x00000CAD
_0801458C:
	ldr r6, _080145C8 @ =gPalCourtScroll
	ldr r1, _080145CC @ =0x00000CAD
	adds r0, r5, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _080145D0
	movs r0, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl sub_8014364
_080145A8:
	adds r0, r7, #0
	adds r0, #0x49
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _080145D0
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0x1f
	movs r3, #1
	bl InitCourtScroll
	movs r0, #0
	b _080145E0
	.align 2, 0
_080145C8: .4byte gPalCourtScroll
_080145CC: .4byte 0x00000CAD
_080145D0:
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x1f
	bl InitCourtScroll
	movs r0, #1
_080145E0:
	strb r0, [r4]
_080145E2:
	adds r4, r7, #0
	adds r4, #0x48
	mov r2, r8
	cmp r2, #0
	beq _08014632
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	beq _0801460C
	cmp r0, #1
	bgt _08014606
	cmp r0, #0
	beq _0801460C
	b _08014632
_08014606:
	cmp r0, #2
	beq _08014620
	b _08014632
_0801460C:
	movs r0, #2
	bl sub_80049A0
	movs r0, #0x11
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8012684
	b _08014632
_08014620:
	movs r0, #1
	bl sub_80049A0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8012684
_08014632:
	ldr r0, _08014674 @ =gUnknown_08028208
	movs r1, #0xa
	movs r2, #5
	bl nullsub_20
	ldr r0, _08014678 @ =gUnknown_08028214
	movs r1, #0xa
	movs r2, #6
	bl nullsub_20
	ldr r0, _0801467C @ =gUnknown_08028220
	movs r1, #0xa
	movs r2, #7
	bl nullsub_20
	ldr r0, _08014680 @ =gUnknown_0802822C
	movs r1, #0xa
	movs r2, #8
	bl nullsub_20
	ldr r0, _08014684 @ =gUnknown_08028238
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #6
	movs r1, #0xa
	bl nullsub_20
_08014668:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014674: .4byte gUnknown_08028208
_08014678: .4byte gUnknown_08028214
_0801467C: .4byte gUnknown_08028220
_08014680: .4byte gUnknown_0802822C
_08014684: .4byte gUnknown_08028238

	thumb_func_start sub_8014688
sub_8014688: @ 0x08014688
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080146AC @ =0x00000C64
	adds r4, r4, r0
	ldr r0, _080146B0 @ =gUnknown_03004BBC
	bl sub_8012F7C
	ldr r0, [r4, #0x44]
	adds r1, r4, #0
	movs r2, #0x44
	bl memcpy
	ldr r1, _080146B4 @ =gMain
	movs r0, #3
	strb r0, [r1, #9]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080146AC: .4byte 0x00000C64
_080146B0: .4byte gUnknown_03004BBC
_080146B4: .4byte gMain

	thumb_func_start sub_80146B8
sub_80146B8: @ 0x080146B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080146F0 @ =gJoypad
	movs r0, #8
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _080146CC
	movs r0, #2
	strb r0, [r4, #1]
_080146CC:
	movs r0, #0xa
	movs r1, #0x14
	movs r2, #5
	movs r3, #0xa
	bl sub_8001610
	ldr r0, _080146F4 @ =gUnknown_0814DCA8
	ldrb r2, [r4, #1]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080146F0: .4byte gJoypad
_080146F4: .4byte gUnknown_0814DCA8

	thumb_func_start sub_80146F8
sub_80146F8: @ 0x080146F8
	push {lr}
	strh r1, [r0, #2]
	strh r2, [r0]
	strh r3, [r0, #4]
	bl sub_8014998
	pop {r0}
	bx r0

	thumb_func_start sub_8014708
sub_8014708: @ 0x08014708
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sb, r1
	mov r8, r2
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08014770 @ =0x040000D4
	str r1, [r0]
	str r5, [r0, #4]
	ldr r1, _08014774 @ =0x810000C6
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08014778 @ =gUnknown_0203A500
	cmp r0, #4
	bgt _0801473A
	ldr r4, _0801477C @ =gUnknown_02036500
_0801473A:
	ldr r0, _08014780 @ =gUnknown_0814DD58
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl LZ77UnCompWram
	str r4, [r5, #8]
	adds r4, #8
	movs r2, #0
	ldr r0, [r5, #8]
	ldrh r3, [r0, #6]
	cmp r2, r3
	bge _08014768
	adds r1, r5, #0
	adds r1, #0xc
_0801475C:
	stm r1!, {r4}
	adds r4, #8
	adds r2, #1
	ldrh r7, [r0, #6]
	cmp r2, r7
	blt _0801475C
_08014768:
	movs r2, #0
	ldr r0, [r5, #8]
	adds r6, r0, #0
	b _080147B4
	.align 2, 0
_08014770: .4byte 0x040000D4
_08014774: .4byte 0x810000C6
_08014778: .4byte gUnknown_0203A500
_0801477C: .4byte gUnknown_02036500
_08014780: .4byte gUnknown_0814DD58
_08014784:
	lsls r1, r2, #2
	adds r0, r5, #0
	adds r0, #0xcc
	adds r0, r0, r1
	str r4, [r0]
	ldm r4!, {r0}
	adds r1, r2, #1
	cmp r0, #0
	ble _080147B2
	movs r3, #0xf0
	lsls r3, r3, #8
	adds r2, r0, #0
_0801479C:
	adds r0, r3, #0
	ldrh r7, [r4, #6]
	ands r0, r7
	cmp r0, #0
	bne _080147AA
	adds r4, #0x14
	b _080147AC
_080147AA:
	adds r4, #0x10
_080147AC:
	subs r2, #1
	cmp r2, #0
	bne _0801479C
_080147B2:
	adds r2, r1, #0
_080147B4:
	ldrh r0, [r6, #4]
	cmp r2, r0
	blt _08014784
	adds r0, r5, #0
	mov r1, sb
	mov r2, r8
	movs r3, #0
	bl sub_80146F8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80147D4
sub_80147D4: @ 0x080147D4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #4
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	ldrh r1, [r1, #6]
	subs r1, #1
	cmp r0, r1
	bge _08014800
	ldr r0, _08014808 @ =gMain
	ldr r0, [r0]
	movs r1, #3
	bl __umodsi3
	cmp r0, #0
	bne _08014800
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	adds r0, r4, #0
	bl sub_8014998
_08014800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014808: .4byte gMain

	thumb_func_start sub_801480C
sub_801480C: @ 0x0801480C
	push {r4, lr}
	sub sp, #4
	mov r0, sp
	movs r2, #0
	strh r2, [r0]
	ldr r0, _08014890 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _08014894 @ =gUnknown_03002FA0
	str r1, [r0, #4]
	ldr r3, _08014898 @ =0x81000400
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r2, [r1]
	str r1, [r0]
	ldr r1, _0801489C @ =gUnknown_03001080
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r2, [r1]
	str r1, [r0]
	ldr r3, _080148A0 @ =0x06004000
	str r3, [r0, #4]
	ldr r1, _080148A4 @ =0x81002000
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r2, [r1]
	str r1, [r0]
	ldr r1, _080148A8 @ =0x05000040
	str r1, [r0, #4]
	ldr r1, _080148AC @ =0x810000E0
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	mov r2, sp
	ldr r4, _080148B0 @ =0x00002222
	adds r1, r4, #0
	strh r1, [r2]
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _080148B4 @ =0x81004B00
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _080148B8 @ =gIORegisters
	movs r0, #0xf0
	lsls r0, r0, #6
	strh r0, [r1]
	ldr r0, _080148BC @ =0x00003FC7
	strh r0, [r1, #6]
	ldr r2, _080148C0 @ =gMain
	movs r0, #0xfe
	ldrb r3, [r2, #0x1a]
	ands r0, r3
	strb r0, [r2, #0x1a]
	adds r1, #0x4a
	ldr r0, _080148C4 @ =0x0000FEFF
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014890: .4byte 0x040000D4
_08014894: .4byte gUnknown_03002FA0
_08014898: .4byte 0x81000400
_0801489C: .4byte gUnknown_03001080
_080148A0: .4byte 0x06004000
_080148A4: .4byte 0x81002000
_080148A8: .4byte 0x05000040
_080148AC: .4byte 0x810000E0
_080148B0: .4byte 0x00002222
_080148B4: .4byte 0x81004B00
_080148B8: .4byte gIORegisters
_080148BC: .4byte 0x00003FC7
_080148C0: .4byte gMain
_080148C4: .4byte 0x0000FEFF

	thumb_func_start sub_80148C8
sub_80148C8: @ 0x080148C8
	movs r2, #4
	ldrsh r1, [r0, r2]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #6]
	subs r0, #1
	cmp r1, r0
	bge _080148DA
	movs r0, #0
	b _080148DC
_080148DA:
	movs r0, #1
_080148DC:
	bx lr
	.align 2, 0

	thumb_func_start sub_80148E0
sub_80148E0: @ 0x080148E0
	push {r4, lr}
	sub sp, #4
	ldr r2, _08014960 @ =gMain
	movs r3, #0
	movs r0, #0x80
	strh r0, [r2, #0x36]
	ldr r1, _08014964 @ =gIORegisters
	ldr r0, _08014968 @ =0x00003C47
	strh r0, [r1]
	ldr r0, _0801496C @ =0x00003F46
	strh r0, [r1, #6]
	adds r1, #0x4a
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	ldrh r4, [r1]
	orrs r0, r4
	strh r0, [r1]
	movs r0, #1
	ldrb r1, [r2, #0x1a]
	orrs r0, r1
	strb r0, [r2, #0x1a]
	mov r0, sp
	strh r3, [r0]
	ldr r4, _08014970 @ =0x040000D4
	str r0, [r4]
	ldr r0, _08014974 @ =0x0600E000
	str r0, [r4, #4]
	ldr r1, _08014978 @ =0x81000400
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, sp
	strh r3, [r0]
	str r0, [r4]
	ldr r0, _0801497C @ =0x0600F800
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	bl m4aSoundVSyncOff
	ldr r0, _08014980 @ =gGfxPsycheLockChainsTiles
	ldr r1, _08014984 @ =0x06004000
	bl LZ77UnCompVram
	bl m4aSoundVSyncOn
	ldr r1, _08014988 @ =gUnknown_0814DCB4
	str r1, [r4]
	ldr r0, _0801498C @ =0x050001C0
	str r0, [r4, #4]
	ldr r2, _08014990 @ =0x80000010
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	adds r1, #0x20
	str r1, [r4]
	ldr r0, _08014994 @ =0x050001E0
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014960: .4byte gMain
_08014964: .4byte gIORegisters
_08014968: .4byte 0x00003C47
_0801496C: .4byte 0x00003F46
_08014970: .4byte 0x040000D4
_08014974: .4byte 0x0600E000
_08014978: .4byte 0x81000400
_0801497C: .4byte 0x0600F800
_08014980: .4byte gGfxPsycheLockChainsTiles
_08014984: .4byte 0x06004000
_08014988: .4byte gUnknown_0814DCB4
_0801498C: .4byte 0x050001C0
_08014990: .4byte 0x80000010
_08014994: .4byte 0x050001E0

	thumb_func_start sub_8014998
sub_8014998: @ 0x08014998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r2, r0, #0
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #0xcc
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r3, #0
	str r3, [sp, #8]
	movs r6, #0
	str r6, [sp, #4]
	movs r7, #0xe
	str r7, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _08014A00
	ldr r6, _080149F8 @ =0x0000FFF8
	str r6, [sp, #4]
	ldr r7, _080149FC @ =gUnknown_03002FA0
	str r7, [sp]
	movs r0, #1
	str r0, [sp, #0x10]
	b _08014A0C
	.align 2, 0
_080149F8: .4byte 0x0000FFF8
_080149FC: .4byte gUnknown_03002FA0
_08014A00:
	movs r2, #8
	str r2, [sp, #8]
	ldr r3, _08014A70 @ =gUnknown_03001080
	str r3, [sp]
	movs r6, #0xf
	str r6, [sp, #0xc]
_08014A0C:
	ldr r7, [sp, #0x10]
	rsbs r0, r7, #0
	orrs r0, r7
	asrs r2, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #1
	ands r2, r0
	movs r3, #0
	lsls r1, r1, #0x10
	str r1, [sp, #0x14]
	ldr r4, _08014A74 @ =0x000003FF
_08014A22:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	ldr r3, [sp]
	adds r0, r0, r3
	strh r2, [r0]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r4
	ble _08014A22
	movs r3, #0
	ldr r6, [sp, #0x14]
	cmp r6, #0
	ble _08014B30
_08014A42:
	mov ip, sb
	movs r0, #0xf0
	lsls r0, r0, #8
	mov r7, ip
	ldrh r7, [r7, #6]
	ands r0, r7
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x10
	add r2, ip
	mov sb, r2
	cmp r1, #0
	bne _08014A62
	movs r6, #0x14
	add r6, ip
	mov sb, r6
_08014A62:
	cmp r1, #0
	beq _08014A78
	lsrs r0, r0, #0x19
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	b _08014A84
	.align 2, 0
_08014A70: .4byte gUnknown_03001080
_08014A74: .4byte 0x000003FF
_08014A78:
	mov r7, ip
	ldrh r7, [r7, #8]
	str r7, [sp, #0x18]
	mov r0, ip
	ldrh r0, [r0, #0xa]
	str r0, [sp, #0x1c]
_08014A84:
	movs r5, #0
	lsls r3, r3, #0x10
	mov sl, r3
	b _08014B1A
_08014A8C:
	movs r4, #0
	adds r1, r5, #1
	mov r8, r1
	b _08014B10
_08014A94:
	mov r2, ip
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _08014AA0
	adds r0, #7
_08014AA0:
	asrs r0, r0, #3
	adds r2, r0, r4
	mov r3, ip
	movs r0, #1
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bge _08014AB0
	adds r0, #7
_08014AB0:
	asrs r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r6, [sp, #0x10]
	cmp r6, #0
	beq _08014ACC
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r3, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08014ACC:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0xc
	orrs r3, r0
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r6, ip
	ldrb r6, [r6, #2]
	adds r0, r6, r0
	cmp r0, #0
	bge _08014AE4
	adds r0, #7
_08014AE4:
	asrs r0, r0, #3
	adds r1, r0, r4
	ldr r7, [sp, #8]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r6, ip
	ldrb r6, [r6, #3]
	adds r2, r6, r0
	adds r0, r2, #0
	subs r0, #0x30
	cmp r0, #0
	bge _08014AFE
	adds r0, #7
_08014AFE:
	asrs r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r7, [sp]
	adds r0, r0, r7
	strh r3, [r0]
	adds r4, #1
_08014B10:
	ldr r0, [sp, #0x18]
	asrs r0, r0, #3
	cmp r4, r0
	blt _08014A94
	mov r5, r8
_08014B1A:
	ldr r0, [sp, #0x1c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _08014A8C
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, sl
	lsrs r3, r0, #0x10
	ldr r1, [sp, #0x14]
	cmp r0, r1
	blt _08014A42
_08014B30:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8014B40
sub_8014B40: @ 0x08014B40
	sub sp, #4
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0xb
	bhi _08014BC0
	lsls r0, r2, #2
	ldr r1, _08014B54 @ =_08014B58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014B54: .4byte _08014B58
_08014B58: @ jump table
	.4byte _08014BC0 @ case 0
	.4byte _08014BB0 @ case 1
	.4byte _08014BC0 @ case 2
	.4byte _08014BC0 @ case 3
	.4byte _08014BC0 @ case 4
	.4byte _08014BC0 @ case 5
	.4byte _08014BC0 @ case 6
	.4byte _08014BC0 @ case 7
	.4byte _08014BC0 @ case 8
	.4byte _08014BC0 @ case 9
	.4byte _08014BC0 @ case 10
	.4byte _08014B88 @ case 11
_08014B88:
	movs r0, #0
	str r0, [sp]
	ldr r1, _08014BA4 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r2, _08014BA8 @ =gUnknown_03006D70
	str r2, [r1, #4]
	ldr r0, _08014BAC @ =0x850000CF
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r3, [r2]
	strh r3, [r2, #2]
	b _08014BC8
	.align 2, 0
_08014BA4: .4byte 0x040000D4
_08014BA8: .4byte gUnknown_03006D70
_08014BAC: .4byte 0x850000CF
_08014BB0:
	ldr r0, _08014BBC @ =gUnknown_03006D70
	movs r2, #0
	movs r1, #1
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	b _08014BC8
	.align 2, 0
_08014BBC: .4byte gUnknown_03006D70
_08014BC0:
	ldr r0, _08014BCC @ =gUnknown_03006D70
	movs r1, #0
	strh r2, [r0, #4]
	strh r1, [r0, #6]
_08014BC8:
	add sp, #4
	bx lr
	.align 2, 0
_08014BCC: .4byte gUnknown_03006D70

	thumb_func_start sub_8014BD0
sub_8014BD0: @ 0x08014BD0
	ldr r0, _08014BD8 @ =gUnknown_03006D70
	movs r1, #4
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08014BD8: .4byte gUnknown_03006D70

	thumb_func_start sub_8014BDC
sub_8014BDC: @ 0x08014BDC
	ldr r0, _08014BEC @ =gUnknown_03006D70
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08014BF0
	movs r0, #0
	b _08014BF2
	.align 2, 0
_08014BEC: .4byte gUnknown_03006D70
_08014BF0:
	movs r0, #1
_08014BF2:
	bx lr

	thumb_func_start sub_8014BF4
sub_8014BF4: @ 0x08014BF4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08014C0C @ =gUnknown_03006D70
	movs r1, #6
	ldrsh r2, [r0, r1]
	adds r7, r0, #0
	cmp r2, #1
	beq _08014C76
	cmp r2, #1
	bgt _08014C10
	cmp r2, #0
	beq _08014C16
	b _08014D24
	.align 2, 0
_08014C0C: .4byte gUnknown_03006D70
_08014C10:
	cmp r2, #2
	beq _08014CAC
	b _08014D24
_08014C16:
	movs r0, #0x7a
	bl sub_8011150
	ldr r1, _08014CA4 @ =gMain
	movs r0, #0x80
	strh r0, [r1, #0x36]
	movs r0, #1
	ldrb r2, [r1, #0x1a]
	orrs r0, r2
	strb r0, [r1, #0x1a]
	movs r5, #0x20
	movs r7, #0x1f
	movs r6, #0x1f
_08014C30:
	lsls r3, r5, #1
	movs r4, #0xa0
	lsls r4, r4, #0x13
	adds r3, r3, r4
	ldrh r4, [r3]
	lsls r0, r4, #0x10
	lsrs r1, r0, #0x15
	ands r1, r7
	lsrs r0, r0, #0x1a
	ands r0, r7
	adds r2, r6, #0
	bics r2, r4
	adds r4, r6, #0
	bics r4, r1
	adds r1, r4, #0
	adds r4, r6, #0
	bics r4, r0
	adds r0, r4, #0
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
	adds r5, #1
	cmp r5, #0xff
	ble _08014C30
	ldr r1, _08014CA8 @ =gUnknown_03006D70
	movs r2, #0
	movs r0, #0xff
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
	adds r7, r1, #0
_08014C76:
	ldrh r0, [r7, #0xa]
	adds r1, r0, #1
	strh r1, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x46
	ble _08014D2C
	movs r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #0xc]
	adds r0, #1
	strh r0, [r7, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08014D1C
	movs r0, #3
	movs r1, #1
	movs r2, #4
	movs r3, #0x1f
	bl StartHardwareBlend
	b _08014D2C
	.align 2, 0
_08014CA4: .4byte gMain
_08014CA8: .4byte gUnknown_03006D70
_08014CAC:
	movs r5, #0x20
	movs r0, #0x1f
	mov ip, r0
_08014CB2:
	lsls r0, r5, #1
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r6, r0, r1
	ldrh r3, [r6]
	movs r2, #0x1f
	lsls r1, r3, #0x10
	lsrs r0, r1, #0x15
	lsrs r1, r1, #0x1a
	ands r2, r3
	subs r2, #1
	lsls r2, r2, #0x10
	mov r3, ip
	ands r0, r3
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r4, ip
	ands r1, r4
	subs r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r2, #0
	bge _08014CE6
	movs r1, #0
_08014CE6:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _08014CEE
	movs r3, #0
_08014CEE:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _08014CF6
	movs r4, #0
_08014CF6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0xb
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	orrs r1, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #6
	orrs r1, r0
	strh r1, [r6]
	adds r5, #1
	cmp r5, #0xff
	ble _08014CB2
	ldrh r0, [r7, #0xa]
	adds r1, r0, #1
	strh r1, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _08014D2C
_08014D1C:
	ldrh r0, [r7, #6]
	adds r0, #1
	strh r0, [r7, #6]
	b _08014D2C
_08014D24:
	movs r1, #0
	movs r0, #2
	strh r0, [r7, #4]
	strh r1, [r7, #6]
_08014D2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8014D34
sub_8014D34: @ 0x08014D34
	push {r4, r5, lr}
	ldr r4, _08014D4C @ =gUnknown_03006D70
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08014D90
	cmp r0, #1
	bgt _08014D50
	cmp r0, #0
	beq _08014D5A
	b _08014E0E
	.align 2, 0
_08014D4C: .4byte gUnknown_03006D70
_08014D50:
	cmp r0, #2
	beq _08014DE0
	cmp r0, #3
	beq _08014DF6
	b _08014E0E
_08014D5A:
	bl sub_80148E0
	adds r0, r4, #0
	adds r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #1
	movs r2, #3
	bl sub_8014708
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #4
	movs r2, #0
	bl sub_8014708
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, #0x7f
	bl sub_8011150
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
_08014D90:
	ldr r4, _08014DD8 @ =gUnknown_03006D80
	adds r0, r4, #0
	bl sub_80147D4
	movs r2, #0xc6
	lsls r2, r2, #1
	adds r5, r4, r2
	adds r0, r5, #0
	bl sub_80147D4
	adds r0, r4, #0
	bl sub_80148C8
	cmp r0, #0
	beq _08014DC2
	adds r0, r5, #0
	bl sub_80148C8
	cmp r0, #0
	beq _08014DC2
	adds r1, r4, #0
	subs r1, #0x10
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
_08014DC2:
	ldr r1, _08014DDC @ =gMain
	adds r2, r1, #0
	adds r2, #0xe8
	ldr r0, [r2]
	movs r3, #1
	orrs r0, r3
	str r0, [r2]
	movs r0, #2
	strh r0, [r1, #0x14]
	strb r3, [r1, #0x16]
	b _08014E0E
	.align 2, 0
_08014DD8: .4byte gUnknown_03006D80
_08014DDC: .4byte gMain
_08014DE0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, #0x7f
	movs r1, #0x3c
	bl sub_80111CC
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
_08014DF6:
	ldr r2, _08014E14 @ =gUnknown_03006D70
	ldrh r0, [r2, #0xa]
	adds r1, r0, #1
	strh r1, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _08014E0E
	movs r1, #0
	movs r0, #3
	strh r0, [r2, #4]
	strh r1, [r2, #6]
_08014E0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014E14: .4byte gUnknown_03006D70

	thumb_func_start sub_8014E18
sub_8014E18: @ 0x08014E18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08014E38 @ =gUnknown_03006D70
	movs r2, #6
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r1, #5
	bls _08014E2C
	b _08015012
_08014E2C:
	lsls r0, r1, #2
	ldr r1, _08014E3C @ =_08014E40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014E38: .4byte gUnknown_03006D70
_08014E3C: .4byte _08014E40
_08014E40: @ jump table
	.4byte _08014E58 @ case 0
	.4byte _08014EC8 @ case 1
	.4byte _08014F90 @ case 2
	.4byte _08014FD0 @ case 3
	.4byte _08014FF4 @ case 4
	.4byte _0801500C @ case 5
_08014E58:
	movs r5, #0
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r5, r0
	bge _08014EBA
	adds r4, r7, #0
	ldr r6, _08014F24 @ =gUnknown_0814DCF4
_08014E66:
	movs r0, #0
	ldrsh r1, [r4, r0]
	subs r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r0, #1
	adds r2, r1, #1
	lsls r0, r1, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	adds r1, #0x20
	lsls r0, r2, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	adds r2, #0x10
	adds r0, r5, #0
	adds r0, #0x58
	bl sub_8012864
	lsls r1, r5, #2
	movs r3, #0xca
	lsls r3, r3, #2
	adds r2, r4, r3
	adds r1, r1, r2
	str r0, [r1]
	ldr r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r2, r1
	ldr r1, _08014F28 @ =0xDFFFFFFF
	ands r2, r1
	str r2, [r0]
	adds r5, #1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _08014E66
_08014EBA:
	ldr r0, _08014F2C @ =gUnknown_03006D70
	movs r1, #0
	strh r1, [r0, #0xa]
	ldrh r1, [r0, #6]
	adds r1, #1
	strh r1, [r0, #6]
	adds r7, r0, #0
_08014EC8:
	ldrh r0, [r7, #0xa]
	adds r0, #1
	strh r0, [r7, #0xa]
	movs r5, #0
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r5, r0
	bge _08014F4E
	mov r8, r7
	movs r3, #0xca
	lsls r3, r3, #2
	adds r0, r7, r3
	adds r6, r0, #0
_08014EE2:
	lsls r1, r5, #3
	mov r2, r8
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	subs r4, r0, r1
	cmp r4, #0
	ble _08014F40
	ldr r0, [r6]
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #0x16
	orrs r1, r2
	str r1, [r0]
	cmp r4, #8
	bne _08014F06
	movs r0, #0x73
	bl sub_8011150
_08014F06:
	cmp r4, #7
	bgt _08014F30
	ldr r0, [r6]
	adds r1, r5, #0
	adds r1, #0xa
	movs r2, #8
	subs r2, r2, r4
	lsls r2, r2, #5
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	bl sub_8011F90
	b _08014F40
	.align 2, 0
_08014F24: .4byte gUnknown_0814DCF4
_08014F28: .4byte 0xDFFFFFFF
_08014F2C: .4byte gUnknown_03006D70
_08014F30:
	ldr r0, [r6]
	bl sub_8012064
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, _08014F88 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r2]
_08014F40:
	adds r6, #4
	adds r5, #1
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r5, r0
	blt _08014EE2
_08014F4E:
	movs r3, #0xa
	ldrsh r1, [r7, r3]
	movs r0, #0
	ldrsh r2, [r7, r0]
	lsls r0, r2, #3
	cmp r1, r0
	ble _08015012
	movs r5, #0
	cmp r5, r2
	bge _08014F7A
	adds r4, r7, #0
	movs r1, #0xca
	lsls r1, r1, #2
	adds r6, r4, r1
_08014F6A:
	ldm r6!, {r0}
	bl sub_8012064
	adds r5, #1
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r5, r0
	blt _08014F6A
_08014F7A:
	ldr r0, _08014F8C @ =gUnknown_03006D70
	movs r1, #0
	strh r1, [r0, #0xa]
	ldrh r1, [r0, #6]
	adds r1, #1
	strh r1, [r0, #6]
	b _08015012
	.align 2, 0
_08014F88: .4byte 0xFFFFFEFF
_08014F8C: .4byte gUnknown_03006D70
_08014F90:
	ldr r2, _08014FCC @ =gMain
	adds r3, r2, #0
	adds r3, #0xe8
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	movs r1, #2
	movs r0, #2
	strh r0, [r2, #0x14]
	strb r1, [r2, #0x16]
	ldrh r0, [r7, #0xa]
	adds r1, r0, #1
	strh r1, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08015012
	movs r0, #4
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #6]
	adds r0, #1
	b _08015010
	.align 2, 0
_08014FCC: .4byte gMain
_08014FD0:
	ldrh r0, [r7, #0xa]
	adds r1, r0, #1
	strh r1, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08015012
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #6]
	adds r0, #1
	b _08015010
_08014FF4:
	ldrh r0, [r7, #0xa]
	adds r1, r0, #1
	strh r1, [r7, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08015012
	movs r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #6]
	adds r0, #1
	b _08015010
_0801500C:
	movs r0, #0
	strh r0, [r7, #4]
_08015010:
	strh r0, [r7, #6]
_08015012:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801501C
sub_801501C: @ 0x0801501C
	push {r4, r5, r6, r7, lr}
	ldr r5, _08015034 @ =gUnknown_03006D70
	movs r0, #6
	ldrsh r7, [r5, r0]
	cmp r7, #1
	beq _080150D0
	cmp r7, #1
	bgt _08015038
	cmp r7, #0
	beq _0801503E
	b _08015128
	.align 2, 0
_08015034: .4byte gUnknown_03006D70
_08015038:
	cmp r7, #2
	beq _080150F6
	b _08015128
_0801503E:
	ldrh r0, [r5, #2]
	subs r0, #1
	strh r0, [r5, #2]
	movs r0, #0x74
	bl sub_8011150
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	movs r2, #0xca
	lsls r2, r2, #2
	adds r4, r5, r2
	adds r0, r0, r4
	ldr r0, [r0]
	bl sub_8012F7C
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r0, #1
	lsls r1, r0, #2
	adds r1, r1, r0
	movs r2, #2
	ldrsh r0, [r5, r2]
	adds r1, r0, r1
	lsls r3, r1, #1
	adds r6, r3, #1
	ldr r2, _080150C8 @ =gUnknown_0814DCF4
	lsls r1, r3, #1
	adds r1, r1, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r1, #0
	adds r3, #0x20
	lsls r1, r6, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r6, r1, #0
	adds r6, #0x10
	adds r0, #0x62
	adds r1, r3, #0
	adds r2, r6, #0
	bl sub_8012864
	movs r3, #2
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r4
	str r0, [r1]
	ldr r2, _080150CC @ =gMain
	adds r3, r2, #0
	adds r3, #0xe8
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	movs r1, #2
	movs r0, #2
	strh r0, [r2, #0x14]
	strb r1, [r2, #0x16]
	movs r0, #4
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl StartHardwareBlend
	strh r7, [r5, #0xa]
	b _080150EE
	.align 2, 0
_080150C8: .4byte gUnknown_0814DCF4
_080150CC: .4byte gMain
_080150D0:
	ldrh r0, [r5, #0xa]
	adds r1, r0, #1
	strh r1, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08015128
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0
	strh r0, [r5, #0xa]
_080150EE:
	ldrh r0, [r5, #6]
	adds r0, #1
	strh r0, [r5, #6]
	b _08015128
_080150F6:
	ldrh r0, [r5, #0xa]
	adds r1, r0, #1
	strh r1, [r5, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08015128
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	movs r2, #0xca
	lsls r2, r2, #2
	adds r4, r5, r2
	adds r0, r0, r4
	ldr r0, [r0]
	bl sub_8012F7C
	movs r3, #2
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	strh r1, [r5, #4]
	strh r1, [r5, #6]
_08015128:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015130
sub_8015130: @ 0x08015130
	push {r4, r5, lr}
	ldr r1, _0801514C @ =gUnknown_03006D70
	movs r2, #6
	ldrsh r0, [r1, r2]
	adds r4, r1, #0
	cmp r0, #9
	bls _08015140
	b _08015316
_08015140:
	lsls r0, r0, #2
	ldr r1, _08015150 @ =_08015154
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801514C: .4byte gUnknown_03006D70
_08015150: .4byte _08015154
_08015154: @ jump table
	.4byte _0801517C @ case 0
	.4byte _08015186 @ case 1
	.4byte _0801519C @ case 2
	.4byte _080151B6 @ case 3
	.4byte _080151E0 @ case 4
	.4byte _08015230 @ case 5
	.4byte _0801526C @ case 6
	.4byte _080152CC @ case 7
	.4byte _080152EC @ case 8
	.4byte _08015300 @ case 9
_0801517C:
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
_08015186:
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bgt _08015196
	b _0801531C
_08015196:
	movs r0, #0
	strh r0, [r4, #0xa]
	b _0801530E
_0801519C:
	ldr r1, _080151D8 @ =gIORegisters
	movs r2, #0x40
	movs r3, #0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #6]
	orrs r0, r2
	strh r0, [r1, #6]
	strh r3, [r4, #0xa]
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
_080151B6:
	ldr r0, _080151DC @ =gMain
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _080151C4
	b _0801531C
_080151C4:
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _080151D4
	b _0801531C
_080151D4:
	b _0801530E
	.align 2, 0
_080151D8: .4byte gIORegisters
_080151DC: .4byte gMain
_080151E0:
	ldr r0, _08015224 @ =gMain
	ldr r0, [r0]
	movs r1, #5
	bl __umodsi3
	cmp r0, #0
	bne _080151F0
	b _0801531C
_080151F0:
	ldr r3, _08015228 @ =gIORegisters
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	lsls r0, r1, #4
	orrs r0, r1
	str r0, [r3, #0x44]
	ldrh r0, [r4, #0xa]
	subs r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0801520A
	b _0801531C
_0801520A:
	ldr r1, _0801522C @ =0x0000FFBF
	adds r0, r1, #0
	ldrh r2, [r3]
	ands r0, r2
	movs r2, #0
	strh r0, [r3]
	ldrh r0, [r3, #6]
	ands r1, r0
	strh r1, [r3, #6]
	str r2, [r3, #0x44]
	strh r2, [r4, #0xa]
	b _0801530E
	.align 2, 0
_08015224: .4byte gMain
_08015228: .4byte gIORegisters
_0801522C: .4byte 0x0000FFBF
_08015230:
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0801531C
	adds r0, r4, #0
	adds r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #9
	movs r2, #3
	bl sub_8014708
	movs r1, #0xce
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #0xe
	movs r2, #0
	bl sub_8014708
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, #0x7f
	bl sub_8011150
	b _0801530E
_0801526C:
	ldr r4, _080152C4 @ =gUnknown_03006D80
	adds r0, r4, #0
	bl sub_80147D4
	movs r2, #0xc6
	lsls r2, r2, #1
	adds r5, r4, r2
	adds r0, r5, #0
	bl sub_80147D4
	adds r0, r4, #0
	bl sub_80148C8
	cmp r0, #0
	beq _080152AC
	adds r0, r5, #0
	bl sub_80148C8
	cmp r0, #0
	beq _080152AC
	subs r4, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, #0x7f
	movs r1, #0x3c
	bl sub_80111CC
	ldrh r0, [r4, #6]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #6]
	strh r1, [r4, #0xa]
_080152AC:
	ldr r1, _080152C8 @ =gMain
	adds r2, r1, #0
	adds r2, #0xe8
	ldr r0, [r2]
	movs r3, #1
	orrs r0, r3
	str r0, [r2]
	movs r0, #2
	strh r0, [r1, #0x14]
	strb r3, [r1, #0x16]
	b _0801531C
	.align 2, 0
_080152C4: .4byte gUnknown_03006D80
_080152C8: .4byte gMain
_080152CC:
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _0801531C
	movs r0, #4
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0
	strh r0, [r4, #0xa]
	b _0801530E
_080152EC:
	ldr r0, _080152FC @ =gMain
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _0801531C
	strh r0, [r4, #0xa]
	b _0801530E
	.align 2, 0
_080152FC: .4byte gMain
_08015300:
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	strh r1, [r4, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0801531C
_0801530E:
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
	b _0801531C
_08015316:
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
_0801531C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015324
sub_8015324: @ 0x08015324
	push {r4, r5, lr}
	ldr r0, _08015340 @ =gUnknown_03006D70
	movs r2, #6
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #6
	bls _08015334
	b _08015514
_08015334:
	lsls r0, r1, #2
	ldr r1, _08015344 @ =_08015348
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015340: .4byte gUnknown_03006D70
_08015344: .4byte _08015348
_08015348: @ jump table
	.4byte _08015364 @ case 0
	.4byte _080153AE @ case 1
	.4byte _08015422 @ case 2
	.4byte _08015468 @ case 3
	.4byte _08015480 @ case 4
	.4byte _080154B0 @ case 5
	.4byte _08015504 @ case 6
_08015364:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x68
	bl sub_8012824
	movs r0, #0x69
	bl sub_8012824
	movs r0, #0x68
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x69
	bl sub_8011D68
	adds r5, r0, #0
	ldr r0, _080153F4 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080153A0
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r0, #0xf0
	strh r0, [r5, #0x10]
_080153A0:
	movs r0, #0xa6
	bl sub_8011150
	ldr r1, _080153F8 @ =gUnknown_03006D70
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
_080153AE:
	movs r0, #0x68
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x69
	bl sub_8011D68
	adds r5, r0, #0
	ldr r0, _080153F4 @ =gMain
	adds r0, #0x44
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080153FC
	ldrh r0, [r4, #0x10]
	adds r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x10]
	subs r0, #0xa
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x77
	bgt _080153F0
	b _08015514
_080153F0:
	b _080154F4
	.align 2, 0
_080153F4: .4byte gMain
_080153F8: .4byte gUnknown_03006D70
_080153FC:
	ldrh r0, [r4, #0x10]
	adds r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x10]
	subs r0, #0xa
	strh r0, [r5, #0x10]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0x77
	ble _08015514
	b _080154F4
_08015422:
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x68
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x69
	bl sub_8011D68
	bl sub_8012F7C
	movs r0, #0x67
	bl sub_8012824
	ldr r0, _08015464 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080154F4
	movs r0, #0x67
	bl sub_8011D68
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	adds r0, #0xf0
	strh r0, [r4, #0x10]
	b _080154F4
	.align 2, 0
_08015464: .4byte gMain
_08015468:
	ldr r0, _0801547C @ =gMain
	adds r0, #0x8a
	ldrh r0, [r0]
	cmp r0, #0
	bne _08015514
	ldrh r0, [r2, #6]
	adds r0, #1
	strh r0, [r2, #6]
	b _08015514
	.align 2, 0
_0801547C: .4byte gMain
_08015480:
	movs r0, #0x67
	bl sub_8011D68
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _08015514
	adds r0, r4, #0
	bl sub_8012F7C
	movs r0, #0x68
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	movs r0, #0x69
	movs r1, #0x78
	movs r2, #0x3c
	bl sub_8012864
	movs r0, #0xa7
	bl sub_8011150
	b _080154F4
_080154B0:
	movs r0, #0x68
	bl sub_8011D68
	adds r4, r0, #0
	movs r0, #0x69
	bl sub_8011D68
	adds r5, r0, #0
	ldrh r0, [r4, #0x12]
	subs r0, #7
	strh r0, [r4, #0x12]
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4]
	ldrh r0, [r5, #0x12]
	adds r0, #7
	strh r0, [r5, #0x12]
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	movs r0, #0x3c
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08015514
	adds r0, r4, #0
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_8012F7C
_080154F4:
	ldr r1, _08015500 @ =gUnknown_03006D70
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
	b _08015514
	.align 2, 0
_08015500: .4byte gUnknown_03006D70
_08015504:
	bl sub_8016EBC
	adds r1, r0, #0
	cmp r1, #0
	bne _08015514
	ldr r0, _0801551C @ =gUnknown_03006D70
	strh r1, [r0, #4]
	strh r1, [r0, #6]
_08015514:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801551C: .4byte gUnknown_03006D70

	thumb_func_start sub_8015520
sub_8015520: @ 0x08015520
	push {r4, r5, r6, lr}
	ldr r1, _08015598 @ =gUnknown_03006D70
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08015592
	movs r5, #0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r5, r0
	bge _0801554E
	adds r4, r1, #0
	movs r0, #0xca
	lsls r0, r0, #2
	adds r6, r4, r0
_0801553E:
	ldm r6!, {r0}
	bl sub_8012F7C
	adds r5, #1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _0801553E
_0801554E:
	bl m4aSoundVSyncOff
	bl sub_801480C
	bl UpdateBGTilemaps
	bl SetLCDIORegs
	ldr r2, _0801559C @ =gMain
	adds r1, r2, #0
	adds r1, #0xc0
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	movs r3, #0x96
	lsls r3, r3, #1
	adds r1, r2, r3
	adds r0, r0, r1
	ldrb r5, [r0]
	ldrh r0, [r2, #0x34]
	movs r4, #0
	strh r0, [r2, #0x38]
	strh r5, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	bl sub_800E280
	bl m4aSoundVSyncOn
	ldr r0, _08015598 @ =gUnknown_03006D70
	strh r4, [r0, #4]
	strh r4, [r0, #6]
_08015592:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015598: .4byte gUnknown_03006D70
_0801559C: .4byte gMain

	thumb_func_start sub_80155A0
sub_80155A0: @ 0x080155A0
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	ldr r1, _080155F8 @ =gUnknown_03006D70
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _080155CC
	adds r6, r1, #0
	movs r0, #0xca
	lsls r0, r0, #2
	adds r5, r6, r0
_080155B8:
	ldr r0, [r5]
	bl sub_8012F7C
	movs r0, #0
	stm r5!, {r0}
	adds r4, #1
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r4, r0
	blt _080155B8
_080155CC:
	bl sub_801480C
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080155FC @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _08015600 @ =gUnknown_03002FA0
	str r0, [r1, #4]
	ldr r0, _08015604 @ =0x81000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _080155F8 @ =gUnknown_03006D70
	movs r2, #0
	movs r0, #0xa
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080155F8: .4byte gUnknown_03006D70
_080155FC: .4byte 0x040000D4
_08015600: .4byte gUnknown_03002FA0
_08015604: .4byte 0x81000400

	thumb_func_start sub_8015608
sub_8015608: @ 0x08015608
	push {r4, r5, r6, lr}
	ldr r5, _0801566C @ =gUnknown_03006D70
	movs r0, #2
	ldrsh r4, [r5, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_80156F8
	strh r4, [r5, #2]
	movs r4, #0
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r2, #2
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r4, r0
	bge _0801565E
	movs r0, #0xca
	lsls r0, r0, #2
	adds r6, r5, r0
_08015630:
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r4, #1
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl sub_8012F7C
	movs r2, #0
	ldrsh r0, [r5, r2]
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #0
	str r1, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r4, r0
	blt _08015630
_0801565E:
	ldr r1, _0801566C @ =gUnknown_03006D70
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801566C: .4byte gUnknown_03006D70

	thumb_func_start sub_8015670
sub_8015670: @ 0x08015670
	push {lr}
	ldr r0, _08015688 @ =gUnknown_03006D70
	movs r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0xb
	bhi _080156F4
	lsls r0, r0, #2
	ldr r1, _0801568C @ =_08015690
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015688: .4byte gUnknown_03006D70
_0801568C: .4byte _08015690
_08015690: @ jump table
	.4byte _080156F4 @ case 0
	.4byte _080156C0 @ case 1
	.4byte _080156C6 @ case 2
	.4byte _080156CC @ case 3
	.4byte _080156D2 @ case 4
	.4byte _080156D8 @ case 5
	.4byte _080156DE @ case 6
	.4byte _080156E4 @ case 7
	.4byte _080156EA @ case 8
	.4byte _080156F0 @ case 9
	.4byte _080156F4 @ case 10
	.4byte _080156F4 @ case 11
_080156C0:
	bl sub_8014BF4
	b _080156F4
_080156C6:
	bl sub_8014D34
	b _080156F4
_080156CC:
	bl sub_8014E18
	b _080156F4
_080156D2:
	bl sub_801501C
	b _080156F4
_080156D8:
	bl sub_8015130
	b _080156F4
_080156DE:
	bl sub_8015324
	b _080156F4
_080156E4:
	bl sub_8015520
	b _080156F4
_080156EA:
	bl sub_80155A0
	b _080156F4
_080156F0:
	bl sub_8015608
_080156F4:
	pop {r0}
	bx r0

	thumb_func_start sub_80156F8
sub_80156F8: @ 0x080156F8
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	movs r0, #0xb
	bl sub_8014B40
	bl sub_80148E0
	ldr r4, _080157B8 @ =gUnknown_03006D80
	adds r6, r4, #0
	subs r6, #0x10
	movs r0, #0
	ldrsh r1, [r6, r0]
	subs r1, #1
	adds r0, r4, #0
	movs r2, #3
	bl sub_8014708
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r5, r4, r1
	movs r2, #0
	ldrsh r1, [r6, r2]
	adds r1, #4
	adds r0, r5, #0
	movs r2, #0
	bl sub_8014708
	movs r3, #0
	ldrsh r1, [r6, r3]
	subs r1, #1
	ldr r0, [r6, #0x18]
	ldrh r3, [r0, #6]
	subs r3, #1
	adds r0, r4, #0
	movs r2, #3
	bl sub_80146F8
	movs r0, #0
	ldrsh r1, [r6, r0]
	adds r1, #4
	movs r2, #0xca
	lsls r2, r2, #1
	adds r4, r4, r2
	ldr r0, [r4]
	ldrh r3, [r0, #6]
	subs r3, #1
	adds r0, r5, #0
	movs r2, #0
	bl sub_80146F8
	movs r4, #0
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r4, r0
	bge _080157B0
	adds r5, r6, #0
	ldr r6, _080157BC @ =gUnknown_0814DCF4
_0801576A:
	movs r0, #0
	ldrsh r1, [r5, r0]
	subs r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r4, r0
	lsls r1, r0, #1
	adds r2, r1, #1
	lsls r0, r1, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	adds r1, #0x20
	lsls r0, r2, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	adds r2, #0x10
	adds r0, r4, #0
	adds r0, #0x5d
	bl sub_8012864
	lsls r1, r4, #2
	movs r3, #0xca
	lsls r3, r3, #2
	adds r2, r5, r3
	adds r1, r1, r2
	str r0, [r1]
	adds r4, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _0801576A
_080157B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080157B8: .4byte gUnknown_03006D80
_080157BC: .4byte gUnknown_0814DCF4

	thumb_func_start sub_80157C0
sub_80157C0: @ 0x080157C0
	push {r4, r5, r6, lr}
	movs r0, #7
	movs r1, #0
	bl sub_8014B40
	bl sub_8015670
	movs r4, #0
	ldr r1, _08015808 @ =gUnknown_03006D70
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _080157F2
	adds r5, r1, #0
	movs r0, #0xca
	lsls r0, r0, #2
	adds r6, r5, r0
_080157E2:
	ldm r6!, {r0}
	bl sub_8012F7C
	adds r4, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _080157E2
_080157F2:
	bl sub_800E280
	ldr r1, _0801580C @ =gInvestigation
	movs r0, #0xfe
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015808: .4byte gUnknown_03006D70
_0801580C: .4byte gInvestigation

	thumb_func_start sub_8015810
sub_8015810: @ 0x08015810
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0
	ldr r2, _08015838 @ =gUnknown_03003960
	movs r5, #1
_08015820:
	ldr r0, [r2]
	ands r0, r5
	cmp r0, #0
	beq _0801583C
	ldrh r0, [r2, #4]
	cmp r0, r4
	bne _0801583C
	ldrh r0, [r2, #6]
	cmp r0, r1
	bne _0801583C
	adds r0, r3, #0
	b _08015848
	.align 2, 0
_08015838: .4byte gUnknown_03003960
_0801583C:
	adds r2, #0x28
	adds r3, #1
	cmp r3, #3
	ble _08015820
	movs r0, #1
	rsbs r0, r0, #0
_08015848:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8015850
sub_8015850: @ 0x08015850
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	movs r2, #0
	ldr r3, [r0, #0x18]
	cmp r2, r3
	bhs _08015876
	adds r1, r0, #0
	adds r1, #0x1c
_08015866:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r5
	bne _08015870
	adds r4, r2, #0
_08015870:
	adds r2, #1
	cmp r2, r3
	blo _08015866
_08015876:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8015880
sub_8015880: @ 0x08015880
	ldr r0, _08015890 @ =gMain
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08015890: .4byte gMain

	thumb_func_start sub_8015894
sub_8015894: @ 0x08015894
	ldr r1, _080158A8 @ =gMain
	movs r3, #0x95
	lsls r3, r3, #2
	adds r2, r1, r3
	movs r3, #0
	strb r0, [r2]
	ldr r0, _080158AC @ =0x00000255
	adds r1, r1, r0
	strb r3, [r1]
	bx lr
	.align 2, 0
_080158A8: .4byte gMain
_080158AC: .4byte 0x00000255

	thumb_func_start sub_80158B0
sub_80158B0: @ 0x080158B0
	ldr r1, _080158DC @ =0x040000D4
	ldr r0, _080158E0 @ =gGfxInvestigationStopButton
	str r0, [r1]
	ldr r0, _080158E4 @ =0x06013000
	str r0, [r1, #4]
	ldr r2, _080158E8 @ =0x80000100
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080158EC @ =gGfxPressPresentButtons+0x200
	str r0, [r1]
	ldr r0, _080158F0 @ =0x06013200
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080158F4 @ =gPalPressPresentButtons
	str r0, [r1]
	ldr r0, _080158F8 @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _080158FC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_080158DC: .4byte 0x040000D4
_080158E0: .4byte gGfxInvestigationStopButton
_080158E4: .4byte 0x06013000
_080158E8: .4byte 0x80000100
_080158EC: .4byte gGfxPressPresentButtons+0x200
_080158F0: .4byte 0x06013200
_080158F4: .4byte gPalPressPresentButtons
_080158F8: .4byte 0x050002A0
_080158FC: .4byte 0x80000010

	thumb_func_start sub_8015900
sub_8015900: @ 0x08015900
	push {r4, lr}
	ldr r1, _08015920 @ =gMain
	movs r2, #0x95
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #4
	bls _08015914
	b _08015A02
_08015914:
	lsls r0, r0, #2
	ldr r1, _08015924 @ =_08015928
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015920: .4byte gMain
_08015924: .4byte _08015928
_08015928: @ jump table
	.4byte _08015A02 @ case 0
	.4byte _0801593C @ case 1
	.4byte _08015988 @ case 2
	.4byte _080159E0 @ case 3
	.4byte _080159F4 @ case 4
_0801593C:
	ldr r0, _08015950 @ =0x00000255
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #1
	beq _08015968
	cmp r0, #1
	bgt _08015954
	cmp r0, #0
	beq _0801595A
	b _08015A02
	.align 2, 0
_08015950: .4byte 0x00000255
_08015954:
	cmp r0, #2
	beq _080159D8
	b _08015A02
_0801595A:
	ldr r1, _08015964 @ =0x00000252
	adds r0, r3, r1
	movs r1, #0x10
	strh r1, [r0]
	b _0801597C
	.align 2, 0
_08015964: .4byte 0x00000252
_08015968:
	ldr r0, _08015984 @ =0x00000252
	adds r1, r3, r0
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08015A02
	strh r0, [r1]
_0801597C:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _08015A02
	.align 2, 0
_08015984: .4byte 0x00000252
_08015988:
	ldr r1, _0801599C @ =0x00000255
	adds r4, r3, r1
	ldrb r2, [r4]
	cmp r2, #1
	beq _080159B4
	cmp r2, #1
	bgt _080159A0
	cmp r2, #0
	beq _080159A6
	b _08015A02
	.align 2, 0
_0801599C: .4byte 0x00000255
_080159A0:
	cmp r2, #2
	beq _080159D8
	b _08015A02
_080159A6:
	ldr r1, _080159B0 @ =0x00000252
	adds r0, r3, r1
	strh r2, [r0]
	b _080159CA
	.align 2, 0
_080159B0: .4byte 0x00000252
_080159B4:
	ldr r2, _080159D4 @ =0x00000252
	adds r1, r3, r2
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bls _08015A02
	movs r0, #0x10
	strh r0, [r1]
_080159CA:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _08015A02
	.align 2, 0
_080159D4: .4byte 0x00000252
_080159D8:
	movs r0, #0
	bl sub_8015894
	b _08015A02
_080159E0:
	ldr r0, _080159F0 @ =0x00000252
	adds r1, r3, r0
	movs r0, #0
	strh r0, [r1]
	bl sub_8015894
	b _08015A02
	.align 2, 0
_080159F0: .4byte 0x00000252
_080159F4:
	ldr r2, _08015A7C @ =0x00000252
	adds r1, r3, r2
	movs r0, #0x40
	strh r0, [r1]
	movs r0, #0
	bl sub_8015894
_08015A02:
	bl sub_80158B0
	ldr r2, _08015A80 @ =gMain
	ldr r3, _08015A84 @ =0x00000256
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08015A24
	ldrh r0, [r2, #0x34]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08015A24
	b _08015B46
_08015A24:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08015AA0
	ldr r3, _08015A88 @ =gOamObjects
	ldr r1, _08015A7C @ =0x00000252
	adds r0, r2, r1
	ldrh r0, [r0]
	rsbs r1, r0, #0
	ldr r2, _08015A8C @ =0x000001FF
	adds r0, r2, #0
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r2, #0
	adds r1, r1, r0
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, #0xc9
	lsls r0, r0, #1
	adds r2, r3, r0
	ldr r0, _08015A90 @ =0x000080B0
	strh r0, [r2]
	movs r0, #0xca
	lsls r0, r0, #1
	adds r2, r3, r0
	ldr r0, _08015A94 @ =0x00005590
	strh r0, [r2]
	movs r2, #0xcc
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, #0xcd
	lsls r0, r0, #1
	adds r1, r3, r0
	ldr r0, _08015A98 @ =0x000080D0
	strh r0, [r1]
	adds r2, #4
	adds r1, r3, r2
	ldr r0, _08015A9C @ =0x00005598
	strh r0, [r1]
	b _08015AB6
	.align 2, 0
_08015A7C: .4byte 0x00000252
_08015A80: .4byte gMain
_08015A84: .4byte 0x00000256
_08015A88: .4byte gOamObjects
_08015A8C: .4byte 0x000001FF
_08015A90: .4byte 0x000080B0
_08015A94: .4byte 0x00005590
_08015A98: .4byte 0x000080D0
_08015A9C: .4byte 0x00005598
_08015AA0:
	ldr r2, _08015B18 @ =gOamObjects
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r0, r2, r3
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	adds r3, #8
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, r2, #0
_08015AB6:
	ldr r2, _08015B1C @ =gMain
	ldr r0, _08015B20 @ =0x00000256
	adds r1, r2, r0
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08015B34
	ldr r1, _08015B24 @ =0x00000252
	adds r0, r2, r1
	ldrh r0, [r0]
	rsbs r1, r0, #0
	ldr r2, _08015B28 @ =0x000001FF
	adds r0, r2, #0
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r2, #0
	adds r1, r1, r0
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, #0xc1
	lsls r0, r0, #1
	adds r2, r3, r0
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r2]
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r2, r3, r0
	movs r0, #0xab
	lsls r0, r0, #7
	strh r0, [r2]
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, #0xc5
	lsls r0, r0, #1
	adds r1, r3, r0
	ldr r0, _08015B2C @ =0x00008020
	strh r0, [r1]
	adds r2, #4
	adds r1, r3, r2
	ldr r0, _08015B30 @ =0x00005588
	strh r0, [r1]
	b _08015B46
	.align 2, 0
_08015B18: .4byte gOamObjects
_08015B1C: .4byte gMain
_08015B20: .4byte 0x00000256
_08015B24: .4byte 0x00000252
_08015B28: .4byte 0x000001FF
_08015B2C: .4byte 0x00008020
_08015B30: .4byte 0x00005588
_08015B34:
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #0x80
	strh r1, [r0]
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
_08015B46:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8015B4C
sub_8015B4C: @ 0x08015B4C
	push {lr}
	bl sub_80158B0
	ldr r3, _08015BB8 @ =gMain
	ldr r0, _08015BBC @ =0x00000256
	adds r1, r3, r0
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08015B9E
	ldr r2, _08015BC0 @ =gOamObjects
	ldr r1, _08015BC4 @ =0x00000252
	adds r0, r3, r1
	ldrh r0, [r0]
	rsbs r1, r0, #0
	ldr r3, _08015BC8 @ =0x000001FF
	adds r0, r3, #0
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #7
	adds r0, r3, #0
	adds r1, r1, r0
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #0xc9
	lsls r0, r0, #1
	adds r3, r2, r0
	ldr r0, _08015BCC @ =0x000080BA
	strh r0, [r3]
	movs r3, #0xcc
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #0xcd
	lsls r0, r0, #1
	adds r1, r2, r0
	ldr r0, _08015BD0 @ =0x000080DA
	strh r0, [r1]
_08015B9E:
	ldr r2, _08015BC0 @ =gOamObjects
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r2, r1
	adds r1, #0x80
	strh r1, [r0]
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08015BB8: .4byte gMain
_08015BBC: .4byte 0x00000256
_08015BC0: .4byte gOamObjects
_08015BC4: .4byte 0x00000252
_08015BC8: .4byte 0x000001FF
_08015BCC: .4byte 0x000080BA
_08015BD0: .4byte 0x000080DA

	thumb_func_start sub_8015BD4
sub_8015BD4: @ 0x08015BD4
	ldr r2, _08015BF8 @ =gOamObjects
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r2, r1
	adds r1, #0x70
	strh r1, [r0]
	movs r3, #0xcc
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	subs r3, #0x18
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #8
	adds r0, r2, r3
	strh r1, [r0]
	bx lr
	.align 2, 0
_08015BF8: .4byte gOamObjects

	thumb_func_start sub_8015BFC
sub_8015BFC: @ 0x08015BFC
	ldr r0, _08015C10 @ =gMain
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08015C14
	movs r0, #1
	b _08015C16
	.align 2, 0
_08015C10: .4byte gMain
_08015C14:
	movs r0, #0
_08015C16:
	bx lr

	thumb_func_start sub_8015C18
sub_8015C18: @ 0x08015C18
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _08015C44 @ =gUnknown_03006D70
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bhs _08015C3E
	adds r5, r1, #0
	movs r0, #0xca
	lsls r0, r0, #2
	adds r6, r5, r0
_08015C2E:
	ldm r6!, {r0}
	bl sub_8012F7C
	adds r4, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blo _08015C2E
_08015C3E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015C44: .4byte gUnknown_03006D70

	thumb_func_start sub_8015C48
sub_8015C48: @ 0x08015C48
	push {r4, r5, lr}
	ldr r3, _08015C70 @ =gScriptContext
	adds r0, r3, #0
	adds r0, #0x46
	ldrh r2, [r0]
	cmp r2, #0
	bne _08015C80
	movs r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _08015C74 @ =gMain
	strh r2, [r0, #0x34]
	ldr r1, _08015C78 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08015C7C @ =0x0000FEFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	b _08015DD8
	.align 2, 0
_08015C70: .4byte gScriptContext
_08015C74: .4byte gMain
_08015C78: .4byte gIORegisters
_08015C7C: .4byte 0x0000FEFF
_08015C80:
	ldr r1, _08015D0C @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08015CB8
	adds r4, r3, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl sub_8011D68
	bl sub_8012F7C
	bl HideAllSprites
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb6
	bne _08015CB2
	movs r0, #1
	strh r0, [r4]
_08015CB2:
	ldrh r0, [r4]
	bl sub_8012824
_08015CB8:
	ldr r1, _08015D0C @ =gJoypad
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08015CF0
	ldr r0, _08015D10 @ =gScriptContext
	adds r4, r0, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl sub_8011D68
	bl sub_8012F7C
	bl HideAllSprites
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08015CEA
	movs r0, #0xb5
	strh r0, [r4]
_08015CEA:
	ldrh r0, [r4]
	bl sub_8012824
_08015CF0:
	ldr r1, _08015D0C @ =gJoypad
	movs r0, #0x20
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08015D42
	ldr r0, _08015D14 @ =gMain
	ldrh r1, [r0, #0x34]
	adds r4, r0, #0
	cmp r1, #0
	beq _08015D18
	subs r0, r1, #1
	b _08015D1A
	.align 2, 0
_08015D0C: .4byte gJoypad
_08015D10: .4byte gScriptContext
_08015D14: .4byte gMain
_08015D18:
	movs r0, #0x67
_08015D1A:
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x34]
	cmp r0, #0xd
	bne _08015D26
	movs r0, #7
	strh r0, [r4, #0x34]
_08015D26:
	ldrh r0, [r4, #0x34]
	bl sub_8003D5C
	ldrh r0, [r4, #0x34]
	bl sub_80049A0
	ldr r1, _08015D5C @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08015D60 @ =0x0000FEFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x38]
_08015D42:
	ldr r1, _08015D64 @ =gJoypad
	movs r0, #0x10
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08015D98
	ldr r0, _08015D68 @ =gMain
	ldrh r1, [r0, #0x34]
	adds r4, r0, #0
	cmp r1, #0x67
	beq _08015D6C
	adds r0, r1, #1
	b _08015D6E
	.align 2, 0
_08015D5C: .4byte gIORegisters
_08015D60: .4byte 0x0000FEFF
_08015D64: .4byte gJoypad
_08015D68: .4byte gMain
_08015D6C:
	movs r0, #0
_08015D6E:
	strh r0, [r4, #0x34]
	adds r1, r4, #0
	ldrh r0, [r1, #0x34]
	cmp r0, #8
	bne _08015D7C
	movs r0, #0xe
	strh r0, [r1, #0x34]
_08015D7C:
	ldrh r0, [r4, #0x34]
	bl sub_8003D5C
	ldrh r0, [r4, #0x34]
	bl sub_80049A0
	ldr r1, _08015DE0 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08015DE4 @ =0x0000FEFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x38]
_08015D98:
	ldr r5, _08015DE8 @ =gJoypad
	movs r0, #1
	ldrh r1, [r5, #2]
	ands r0, r1
	cmp r0, #0
	beq _08015DBC
	ldr r4, _08015DEC @ =gScriptContext
	adds r4, #0x48
	ldrh r0, [r4]
	bl sub_8011D68
	bl sub_8012F7C
	bl HideAllSprites
	ldrh r0, [r4]
	bl sub_8012824
_08015DBC:
	movs r0, #2
	ldrh r5, [r5, #2]
	ands r0, r5
	cmp r0, #0
	beq _08015DD8
	ldr r0, _08015DEC @ =gScriptContext
	adds r0, #0x48
	ldrh r0, [r0]
	bl sub_8011D68
	bl sub_8012F7C
	bl HideAllSprites
_08015DD8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015DE0: .4byte gIORegisters
_08015DE4: .4byte 0x0000FEFF
_08015DE8: .4byte gJoypad
_08015DEC: .4byte gScriptContext

	thumb_func_start sub_8015DF0
sub_8015DF0: @ 0x08015DF0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0x3e
	bl sub_8011D68
	cmp r0, #0
	beq _08015E16
	ldr r1, _08015E1C @ =gOamObjects
	lsls r2, r4, #3
	adds r2, r2, r1
	adds r0, #0x3e
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
_08015E16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015E1C: .4byte gOamObjects

	thumb_func_start sub_8015E20
sub_8015E20: @ 0x08015E20
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	movs r0, #0x3e
	bl sub_8011D68
	cmp r0, #0
	bne _08015E42
	b _08015F52
_08015E42:
	ldr r6, _08015ED8 @ =gOamObjects
	lsls r4, r4, #3
	mov r8, r4
	adds r5, r4, r6
	lsls r0, r7, #9
	ldrh r1, [r5, #2]
	orrs r0, r1
	strh r0, [r5, #2]
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r4, [r5]
	orrs r0, r4
	strh r0, [r5]
	mov r1, sb
	lsls r0, r1, #0xa
	movs r1, #0x5a
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r7, r7, #2
	mov sb, r7
	adds r0, r4, #0
	bl sub_8006364
	mov r2, sb
	lsls r1, r2, #3
	adds r7, r1, r6
	strh r0, [r7, #6]
	adds r0, r4, #0
	bl sub_80063E4
	mov r1, sb
	adds r1, #1
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	adds r0, r4, #0
	bl sub_80063E4
	mov r1, sb
	adds r1, #2
	lsls r1, r1, #3
	adds r1, r1, r6
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strh r0, [r1, #6]
	adds r0, r4, #0
	bl sub_8006364
	mov r1, sb
	adds r1, #3
	lsls r1, r1, #3
	adds r1, r1, r6
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldr r3, _08015EDC @ =0x000001FF
	ldrh r4, [r5, #2]
	ands r3, r4
	ldrb r5, [r5]
	mov ip, r5
	ldrh r1, [r7, #6]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08015EE0
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	lsrs r4, r0, #4
	b _08015EEC
	.align 2, 0
_08015ED8: .4byte gOamObjects
_08015EDC: .4byte 0x000001FF
_08015EE0:
	ldrh r4, [r7, #6]
	adds r0, r4, #0
	asrs r0, r0, #4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08015EEC:
	ldr r0, _08015F10 @ =gOamObjects
	mov r1, sb
	adds r1, #2
	lsls r1, r1, #3
	adds r6, r1, r0
	ldrh r5, [r6, #6]
	movs r1, #0xf0
	lsls r1, r1, #8
	ands r1, r5
	adds r2, r0, #0
	cmp r1, #0
	beq _08015F14
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	lsrs r0, r1, #5
	b _08015F20
	.align 2, 0
_08015F10: .4byte gOamObjects
_08015F14:
	ldrh r0, [r6, #6]
	adds r1, r0, #0
	asrs r0, r1, #5
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08015F20:
	adds r3, r3, r0
	mov r1, ip
	adds r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	add r2, r8
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r4, [r2]
	ands r0, r4
	movs r1, #0xff
	mov r4, ip
	ands r4, r1
	mov ip, r4
	add r0, ip
	strh r0, [r2]
	movs r0, #0xfe
	lsls r0, r0, #8
	ldrh r1, [r2, #2]
	ands r0, r1
	lsls r3, r3, #0x17
	lsrs r3, r3, #0x17
	adds r0, r0, r3
	strh r0, [r2, #2]
_08015F52:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015F60
sub_8015F60: @ 0x08015F60
	movs r1, #0
	ldr r3, _08015F80 @ =gOamObjects
	movs r2, #0x80
	lsls r2, r2, #2
_08015F68:
	adds r0, r1, #0
	adds r0, #0x60
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x11
	bls _08015F68
	bx lr
	.align 2, 0
_08015F80: .4byte gOamObjects

	thumb_func_start sub_8015F84
sub_8015F84: @ 0x08015F84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x17
	ldr r2, _08016000 @ =0xFFE00000
	adds r1, r1, r2
	movs r2, #0xfc
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x17
	mov r8, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r7, r0, #0x10
	movs r6, #0
_08015FA6:
	adds r4, r6, #0
	adds r4, #0x60
	lsls r5, r4, #0x18
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_8015DF0
	ldr r0, _08016004 @ =gOamObjects
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ldrh r2, [r4]
	ands r0, r2
	adds r0, r7, r0
	strh r0, [r4]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ldrh r2, [r4, #2]
	ands r0, r2
	add r0, r8
	strh r0, [r4, #2]
	adds r1, r6, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	bl sub_8015E20
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x11
	bls _08015FA6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016000: .4byte 0xFFE00000
_08016004: .4byte gOamObjects

	thumb_func_start sub_8016008
sub_8016008: @ 0x08016008
	push {lr}
	bl sub_8015C48
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8016014
sub_8016014: @ 0x08016014
	ldr r1, _0801609C @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	ldr r3, _080160A0 @ =0x06015000
	cmp r0, #0
	bne _08016024
	ldr r3, _080160A4 @ =0x06011880
_08016024:
	movs r1, #0
	ldr r2, _080160A8 @ =gUnknown_03003AF0
_08016028:
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08016038
	ldr r3, _080160AC @ =0x06011080
_08016038:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #7
	bls _08016028
	ldr r0, _080160B0 @ =0x040000D4
	ldr r1, _080160B4 @ =gGfxHPBarProgress
	str r1, [r0]
	str r3, [r0, #4]
	ldr r1, _080160B8 @ =0x800000C0
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r3, r3, r1
	ldr r1, _080160BC @ =gGfxHPBarFrame3
	str r1, [r0]
	str r3, [r0, #4]
	ldr r2, _080160C0 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	adds r3, #0x80
	ldr r1, _080160C4 @ =gGfxHPBarFrame2
	str r1, [r0]
	str r3, [r0, #4]
	ldr r1, _080160C8 @ =0x80000080
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r3, r1
	ldr r1, _080160CC @ =gGfxHPBarFrame1
	str r1, [r0]
	str r3, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080160D0 @ =gPalHPBarFrame
	str r1, [r0]
	ldr r1, _080160D4 @ =0x05000380
	str r1, [r0, #4]
	subs r2, #0x30
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080160D8 @ =gPalHPBarProgress
	str r1, [r0]
	ldr r1, _080160DC @ =0x05000300
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_0801609C: .4byte gScriptContext
_080160A0: .4byte 0x06015000
_080160A4: .4byte 0x06011880
_080160A8: .4byte gUnknown_03003AF0
_080160AC: .4byte 0x06011080
_080160B0: .4byte 0x040000D4
_080160B4: .4byte gGfxHPBarProgress
_080160B8: .4byte 0x800000C0
_080160BC: .4byte gGfxHPBarFrame3
_080160C0: .4byte 0x80000040
_080160C4: .4byte gGfxHPBarFrame2
_080160C8: .4byte 0x80000080
_080160CC: .4byte gGfxHPBarFrame1
_080160D0: .4byte gPalHPBarFrame
_080160D4: .4byte 0x05000380
_080160D8: .4byte gPalHPBarProgress
_080160DC: .4byte 0x05000300

	thumb_func_start sub_80160E0
sub_80160E0: @ 0x080160E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r1, _08016104 @ =gScriptContext
	movs r0, #4
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _08016110
	ldr r6, _08016108 @ =0x06011880
	ldr r0, _0801610C @ =gUnknown_03002DB8
	str r0, [sp]
	b _08016116
	.align 2, 0
_08016104: .4byte gScriptContext
_08016108: .4byte 0x06011880
_0801610C: .4byte gUnknown_03002DB8
_08016110:
	ldr r6, _08016200 @ =0x06015000
	ldr r1, _08016204 @ =gUnknown_03002CF8
	str r1, [sp]
_08016116:
	movs r3, #0
	adds r1, r7, #0
	subs r1, #8
	lsls r5, r5, #0x10
	ldr r2, [sp]
	adds r2, #8
	mov ip, r2
	ldr r4, _08016208 @ =gUnknown_03003AF0
_08016126:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08016136
	ldr r6, _0801620C @ =0x06011080
_08016136:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08016126
	ldr r3, _08016210 @ =0xF9FF0000
	adds r6, r6, r3
	lsrs r6, r6, #5
	adds r7, r1, #0
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	lsrs r5, r5, #0x10
	adds r1, r6, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [sp]
	movs r0, #0xff
	ands r5, r0
	strh r5, [r3]
	ldr r0, _08016214 @ =0x000001FF
	mov sl, r0
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r2, r0
	strh r2, [r3, #2]
	ldr r2, _08016218 @ =0x000003FF
	mov sb, r2
	ands r1, r2
	movs r0, #0xc0
	lsls r0, r0, #8
	mov r8, r0
	orrs r1, r0
	strh r1, [r3, #4]
	adds r7, #0x10
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, ip
	adds r2, #8
	str r2, [sp]
	adds r3, r5, #0
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r3, r2
	mov r2, ip
	strh r3, [r2]
	mov r2, sl
	ands r0, r2
	movs r4, #0x80
	lsls r4, r4, #8
	orrs r0, r4
	mov r2, ip
	strh r0, [r2, #2]
	mov r0, sb
	ands r1, r0
	mov r2, r8
	orrs r1, r2
	mov r0, ip
	strh r1, [r0, #4]
	adds r7, #0x20
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	strh r3, [r2]
	mov r3, sl
	ands r0, r3
	orrs r0, r4
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	adds r7, #0x20
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, #8
	strh r5, [r2]
	ands r1, r3
	movs r3, #0x80
	lsls r3, r3, #7
	orrs r1, r3
	strh r1, [r2, #2]
	mov r1, sb
	ands r0, r1
	mov r3, r8
	orrs r0, r3
	strh r0, [r2, #4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016200: .4byte 0x06015000
_08016204: .4byte gUnknown_03002CF8
_08016208: .4byte gUnknown_03003AF0
_0801620C: .4byte 0x06011080
_08016210: .4byte 0xF9FF0000
_08016214: .4byte 0x000001FF
_08016218: .4byte 0x000003FF

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
	ldr r4, _080162DC @ =gUnknown_08026430
	movs r2, #0x80
	adds r2, r2, r4
	mov sl, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r1, r5, #0
	bl sub_800650C
	movs r1, #0xb0
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r1, r5, #0
	bl sub_800650C
	movs r1, #0xb2
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	ldrh r4, [r4]
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	bl sub_800650C
	movs r1, #0xb4
	lsls r1, r1, #2
	add r1, r8
	strh r0, [r1, #6]
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r5, #0
	bl sub_800650C
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
_080162DC: .4byte gUnknown_08026430
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
	bl sub_800653C
	adds r5, r0, #0
	ldr r1, _08016414 @ =gUnknown_08026430
	mov r8, r1
	ldr r2, _08016418 @ =gUnknown_080264B0
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r1, r5, #0
	bl sub_800650C
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
	bl sub_800650C
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
	bl sub_800650C
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
	bl sub_800650C
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
_08016414: .4byte gUnknown_08026430
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
	bl sub_8011D68
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
	bl sub_8012864
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
	bl sub_8011F90
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

	thumb_func_start sub_8016540
sub_8016540: @ 0x08016540
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
	ldr r2, _08016634 @ =gUnknown_03003AF0
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
_08016634: .4byte gUnknown_03003AF0
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
	bl sub_8018778
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
	bl sub_8011150
	b _08016A02
_080169F8:
	cmp r0, #0
	ble _08016A02
	movs r0, #0x4c
	bl sub_8011150
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
	bl sub_8011194
	movs r0, #0x9c
	bl sub_8011194
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
	ldr r1, _08016CC4 @ =gUnknown_03002DE0
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
_08016CC4: .4byte gUnknown_03002DE0
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
	bl sub_8011D68
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
	bl sub_8016014
	bl sub_8016540
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

	thumb_func_start sub_8016EBC
sub_8016EBC: @ 0x08016EBC
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

	thumb_func_start sub_8016F18
sub_8016F18: @ 0x08016F18
	ldr r2, _08016F40 @ =gUnknown_03002D60
	movs r3, #0
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r2]
	cmp r0, #0
	beq _08016F6C
	ldr r0, _08016F44 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08016F54
	ldr r0, _08016F48 @ =0x00004020
	strh r0, [r2]
	ldr r0, _08016F4C @ =0x000080D0
	strh r0, [r2, #2]
	ldr r0, _08016F50 @ =0x00007188
	b _08016F6A
	.align 2, 0
_08016F40: .4byte gUnknown_03002D60
_08016F44: .4byte gMain
_08016F48: .4byte 0x00004020
_08016F4C: .4byte 0x000080D0
_08016F50: .4byte 0x00007188
_08016F54:
	cmp r0, #0xf0
	beq _08016F5C
	cmp r0, #0x78
	bne _08016F6C
_08016F5C:
	ldr r0, _08016F70 @ =0x00004020
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r2, #2]
	movs r0, #0xe3
	lsls r0, r0, #7
_08016F6A:
	strh r0, [r2, #4]
_08016F6C:
	bx lr
	.align 2, 0
_08016F70: .4byte 0x00004020

	thumb_func_start sub_8016F74
sub_8016F74: @ 0x08016F74
	push {lr}
	ldr r0, _08016F90 @ =gScriptContext
	ldr r2, _08016F94 @ =gScriptCmdFuncs+0x1D0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08016F90: .4byte gScriptContext
_08016F94: .4byte gScriptCmdFuncs+0x1D0

	thumb_func_start sub_8016F98
sub_8016F98: @ 0x08016F98
	movs r1, #0
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x3c]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x36]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x30]
	adds r0, #0x2d
	movs r1, #0x63
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_8016FB4
sub_8016FB4: @ 0x08016FB4
	push {r4, lr}
	sub sp, #0x40
	ldr r1, _08016FE8 @ =gUnknown_080285E4
	mov r0, sp
	movs r2, #0x40
	bl memcpy
	ldr r0, [sp]
	cmp r0, #0xff
	beq _08016FDC
	mov r4, sp
_08016FCA:
	ldr r0, [r4]
	bl sub_8011D68
	cmp r0, #0
	bne _08016FDE
	adds r4, #4
	ldr r0, [r4]
	cmp r0, #0xff
	bne _08016FCA
_08016FDC:
	movs r0, #0
_08016FDE:
	add sp, #0x40
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016FE8: .4byte gUnknown_080285E4

	thumb_func_start sub_8016FEC
sub_8016FEC: @ 0x08016FEC
	push {r4, r5, r6, lr}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0xff
	ldr r6, _08017050 @ =gScriptContext
	ldr r1, _08017054 @ =gUnknown_08028624
	mov r0, sp
	movs r2, #0x40
	bl memcpy
	ldr r2, _08017058 @ =gUnknown_03000844
	cmp r4, #0
	beq _08017022
	cmp r2, #0
	beq _08017048
	ldrb r0, [r2, #0xe]
	cmp r0, #0xb
	beq _08017016
	cmp r0, #0x21
	bne _08017048
_08017016:
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	beq _08017048
_08017022:
	movs r1, #0
	ldr r0, [r2, #0x14]
	ldr r3, _0801705C @ =0xF7DB61F0
	adds r2, r0, r3
_0801702A:
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	cmp r2, r0
	bne _08017036
	adds r5, r1, #0
_08017036:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0801702A
	cmp r4, #0
	beq _08017060
	cmp r5, #0xff
	bne _08017060
_08017048:
	movs r0, #0
	bl sub_8016FEC
	b _08017148
	.align 2, 0
_08017050: .4byte gScriptContext
_08017054: .4byte gUnknown_08028624
_08017058: .4byte gUnknown_03000844
_0801705C: .4byte 0xF7DB61F0
_08017060:
	bl sub_8016FB4
	adds r2, r0, #0
	cmp r4, #0
	bne _08017070
	bl sub_8012F7C
	b _08017148
_08017070:
	cmp r4, #1
	bne _08017120
	movs r0, #0
	bl sub_8016FEC
	cmp r5, #0xe
	bne _08017080
	movs r5, #7
_08017080:
	cmp r5, #0xf
	bne _08017086
	movs r5, #0xe
_08017086:
	adds r0, r5, #0
	adds r0, #0x74
	bl sub_8012824
	ldr r0, _08017100 @ =gMain
	ldrb r0, [r0, #8]
	cmp r0, #4
	bne _080170A2
	ldr r2, _08017104 @ =gUnknown_03000844
	ldrh r4, [r2, #0x10]
	bl sub_8016FB4
	adds r2, r0, #0
	strh r4, [r2, #0x10]
_080170A2:
	ldr r1, _08017108 @ =gScriptContext
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r1, [r1, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _080170CE
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0xf0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080170CE
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2]
_080170CE:
	ldr r2, _08017104 @ =gUnknown_03000844
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080170EA
	bl sub_8016FB4
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0801710C @ =0x01000400
	orrs r0, r1
	str r0, [r2]
_080170EA:
	cmp r5, #0xc
	bne _08017110
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r2, [r1]
	ands r0, r2
	adds r0, #0xb
	strh r0, [r1]
	b _08017148
	.align 2, 0
_08017100: .4byte gMain
_08017104: .4byte gUnknown_03000844
_08017108: .4byte gScriptContext
_0801710C: .4byte 0x01000400
_08017110:
	adds r1, r6, #0
	adds r1, #0x4e
	ldrh r3, [r1]
	cmp r3, #6
	bne _08017148
	movs r0, #9
	strh r0, [r1]
	b _08017148
_08017120:
	cmp r4, #2
	bne _08017130
	ldr r0, [r2]
	ldr r1, _0801712C @ =0xDFFFFFFF
	ands r0, r1
	b _08017146
	.align 2, 0
_0801712C: .4byte 0xDFFFFFFF
_08017130:
	cmp r4, #3
	bne _0801713C
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x16
	b _08017144
_0801713C:
	cmp r4, #4
	bne _08017148
	ldr r0, [r2]
	ldr r1, _08017150 @ =0x01000400
_08017144:
	orrs r0, r1
_08017146:
	str r0, [r2]
_08017148:
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017150: .4byte 0x01000400

	thumb_func_start sub_8017154
sub_8017154: @ 0x08017154
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _0801718C @ =gUnknown_03000844
	cmp r3, #0
	bne _08017162
	b _080174F2
_08017162:
	ldrb r0, [r3, #0xe]
	cmp r0, #0xb
	beq _0801716E
	cmp r0, #0x21
	beq _0801716E
	b _080174F2
_0801716E:
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _0801717C
	b _080174F2
_0801717C:
	cmp r2, #0xd
	bls _08017182
	b _080174F2
_08017182:
	lsls r0, r2, #2
	ldr r1, _08017190 @ =_08017194
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801718C: .4byte gUnknown_03000844
_08017190: .4byte _08017194
_08017194: @ jump table
	.4byte _080171CC @ case 0
	.4byte _08017260 @ case 1
	.4byte _080172CC @ case 2
	.4byte _08017338 @ case 3
	.4byte _080173F0 @ case 4
	.4byte _080174F2 @ case 5
	.4byte _080174F2 @ case 6
	.4byte _080174F2 @ case 7
	.4byte _080174F2 @ case 8
	.4byte _080174F2 @ case 9
	.4byte _080174F2 @ case 10
	.4byte _080174F2 @ case 11
	.4byte _08017470 @ case 12
	.4byte _080174B0 @ case 13
_080171CC:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080171EA
	ldr r0, _08017240 @ =0x06011C00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xe0
	strh r0, [r3, #0x3c]
_080171EA:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017208
	ldr r0, _08017244 @ =0x06011E00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xf0
	strh r0, [r3, #0x3c]
_08017208:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	bne _08017216
	b _080174F2
_08017216:
	ldr r2, _08017248 @ =0x06012D00
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _0801724C @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
	ldr r1, _08017250 @ =0x040000D4
	ldr r0, _08017254 @ =gGfxPressPresentButtons
	str r0, [r1]
	ldr r0, _08017258 @ =0x06013000
	str r0, [r1, #4]
	ldr r0, _0801725C @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080174F2
	.align 2, 0
_08017240: .4byte 0x06011C00
_08017244: .4byte 0x06011E00
_08017248: .4byte 0x06012D00
_0801724C: .4byte 0x000003FF
_08017250: .4byte 0x040000D4
_08017254: .4byte gGfxPressPresentButtons
_08017258: .4byte 0x06013000
_0801725C: .4byte 0x80000200
_08017260:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017284
	ldr r2, _080172BC @ =0x06013200
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _080172C0 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_08017284:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080172A8
	ldr r2, _080172C4 @ =0x06013000
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _080172C0 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_080172A8:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	bne _080172B6
	b _080174F2
_080172B6:
	ldr r2, _080172C8 @ =0x06012E00
	b _08017446
	.align 2, 0
_080172BC: .4byte 0x06013200
_080172C0: .4byte 0x000003FF
_080172C4: .4byte 0x06013000
_080172C8: .4byte 0x06012E00
_080172CC:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080172EA
	ldr r0, _0801732C @ =0x06011800
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xc0
	strh r0, [r3, #0x3c]
_080172EA:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017308
	ldr r0, _08017330 @ =0x06011A00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xd0
	strh r0, [r3, #0x3c]
_08017308:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	bne _08017316
	b _080174F2
_08017316:
	ldr r0, _08017334 @ =0x06011C00
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0xe0
	strh r0, [r3, #0x3c]
	b _080174F2
	.align 2, 0
_0801732C: .4byte 0x06011800
_08017330: .4byte 0x06011A00
_08017334: .4byte 0x06011C00
_08017338:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017356
	ldr r0, _080173C0 @ =0x06010000
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0
	strh r0, [r3, #0x3c]
_08017356:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017374
	ldr r0, _080173C4 @ =0x06010200
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x10
	strh r0, [r3, #0x3c]
_08017374:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	bne _08017382
	b _080174F2
_08017382:
	ldr r0, _080173C8 @ =0x06010400
	str r0, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x20
	strh r0, [r3, #0x3c]
	ldr r1, _080173CC @ =0x040000D4
	ldr r0, _080173D0 @ =gGfx4bppInvestigationActions
	str r0, [r1]
	ldr r0, _080173D4 @ =0x06012000
	str r0, [r1, #4]
	ldr r0, _080173D8 @ =0x80000800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080173DC @ =gGfx4bppInvestigationScrollButton
	str r0, [r1]
	ldr r0, _080173E0 @ =0x06013000
	str r0, [r1, #4]
	ldr r2, _080173E4 @ =0x80000100
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080173E8 @ =gGfxExamineCursor
	str r0, [r1]
	ldr r0, _080173EC @ =0x06013200
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	b _080174F2
	.align 2, 0
_080173C0: .4byte 0x06010000
_080173C4: .4byte 0x06010200
_080173C8: .4byte 0x06010400
_080173CC: .4byte 0x040000D4
_080173D0: .4byte gGfx4bppInvestigationActions
_080173D4: .4byte 0x06012000
_080173D8: .4byte 0x80000800
_080173DC: .4byte gGfx4bppInvestigationScrollButton
_080173E0: .4byte 0x06013000
_080173E4: .4byte 0x80000100
_080173E8: .4byte gGfxExamineCursor
_080173EC: .4byte 0x06013200
_080173F0:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017414
	ldr r2, _08017460 @ =0x06012800
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _08017464 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_08017414:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017438
	ldr r2, _08017468 @ =0x06012880
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _08017464 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
_08017438:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080174F2
	ldr r2, _0801746C @ =0x06012900
_08017446:
	str r2, [r3, #0x1c]
	ldr r0, [r3]
	movs r1, #0xc0
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3]
	lsrs r2, r2, #5
	ldr r1, _08017464 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #0x3c]
	b _080174F2
	.align 2, 0
_08017460: .4byte 0x06012800
_08017464: .4byte 0x000003FF
_08017468: .4byte 0x06012880
_0801746C: .4byte 0x06012900
_08017470:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017484
	ldr r0, [r3]
	ldr r1, _080174AC @ =0xDFFFFFFF
	ands r0, r1
	str r0, [r3]
_08017484:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _08017498
	ldr r0, [r3]
	ldr r1, _080174AC @ =0xDFFFFFFF
	ands r0, r1
	str r0, [r3]
_08017498:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080174F2
	ldr r0, [r3]
	ldr r1, _080174AC @ =0xDFFFFFFF
	ands r0, r1
	b _080174F0
	.align 2, 0
_080174AC: .4byte 0xDFFFFFFF
_080174B0:
	movs r0, #0x83
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080174C6
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
_080174C6:
	movs r0, #0x84
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080174DC
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
_080174DC:
	movs r0, #0x85
	bl sub_8011D68
	adds r3, r0, #0
	cmp r3, #0
	beq _080174F2
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
_080174F0:
	str r0, [r3]
_080174F2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80174F8
sub_80174F8: @ 0x080174F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	str r0, [sp, #0x80]
	adds r6, r3, #0
	ldr r0, [sp, #0xa4]
	ldr r3, [sp, #0xa8]
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r0, _0801757C @ =0x00000FFF
	ands r0, r1
	lsls r3, r0, #7
	ldr r0, _08017580 @ =gUnknown_0819F694
	adds r3, r3, r0
	cmp r4, #0
	beq _0801758C
	ldr r0, _08017584 @ =0x040000D4
	str r3, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08017588 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	mov r2, sp
	lsls r0, r4, #1
	adds r3, r0, r4
	movs r4, #0
	movs r7, #0xf
	mov r8, r7
	movs r0, #0xf0
	mov ip, r0
	lsls r5, r3, #4
_0801754A:
	ldrb r1, [r2]
	adds r0, r1, #0
	mov r7, r8
	ands r0, r7
	mov r7, ip
	ands r1, r7
	cmp r0, #0
	beq _0801755C
	adds r0, r0, r3
_0801755C:
	cmp r1, #0
	beq _08017562
	adds r1, r1, r5
_08017562:
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	adds r4, #1
	cmp r4, #0x7f
	bls _0801754A
	ldr r0, _08017584 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r2, [sp, #0x80]
	str r2, [r0, #4]
	b _08017594
	.align 2, 0
_0801757C: .4byte 0x00000FFF
_08017580: .4byte gUnknown_0819F694
_08017584: .4byte 0x040000D4
_08017588: .4byte 0x80000040
_0801758C:
	ldr r0, _080175D0 @ =0x040000D4
	str r3, [r0]
	ldr r7, [sp, #0x80]
	str r7, [r0, #4]
_08017594:
	ldr r1, _080175D4 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	cmp r6, #0
	beq _080175BE
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sb
	strh r0, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	add r0, sl
	strh r0, [r6, #2]
	ldr r1, [sp, #0x80]
	lsls r0, r1, #0x11
	lsrs r0, r0, #0x16
	movs r2, #0xd4
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r6, #4]
_080175BE:
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080175D0: .4byte 0x040000D4
_080175D4: .4byte 0x80000040

	thumb_func_start sub_80175D8
sub_80175D8: @ 0x080175D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xa0
	str r0, [sp, #0x80]
	str r3, [sp, #0x84]
	ldr r0, [sp, #0xc0]
	ldr r3, [sp, #0xc4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x88]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x8c]
	ldr r0, _08017654 @ =0x00000FFF
	ands r0, r1
	lsls r3, r0, #7
	ldr r0, _08017658 @ =gUnknown_0819F694
	adds r3, r3, r0
	cmp r2, #0
	bne _0801760E
	b _0801792C
_0801760E:
	ldr r0, _0801765C @ =0x040000D4
	str r3, [r0]
	mov r1, sp
	str r1, [r0, #4]
	ldr r1, _08017660 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	mov sl, sp
	movs r2, #0xf
	mov sb, r2
	movs r4, #1
	add r4, ip
	mov r8, r4
	mov r7, sp
	str r7, [sp, #0x9c]
_0801762C:
	movs r5, #0
	ldr r0, [sp, #0x9c]
	ldr r3, [r0]
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r1, [sp, #0x9c]
	ldr r0, [r1, #4]
	lsrs r4, r0, #4
	movs r6, #0
	movs r2, #0
_08017640:
	adds r1, r3, #0
	mov r7, sb
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08017664
	mov r0, r8
	b _0801766A
	.align 2, 0
_08017654: .4byte 0x00000FFF
_08017658: .4byte gUnknown_0819F694
_0801765C: .4byte 0x040000D4
_08017660: .4byte 0x80000040
_08017664:
	cmp r1, #0
	beq _0801766E
	mov r0, ip
_0801766A:
	lsls r0, r2
	orrs r5, r0
_0801766E:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _08017640
	ldr r0, [sp, #0x9c]
	stm r0!, {r5}
	str r0, [sp, #0x9c]
	mov r0, sl
	adds r0, #0x18
	ldr r1, [sp, #0x9c]
	cmp r1, r0
	bls _0801762C
	movs r7, #8
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x1c
	str r0, [sp, #0x90]
_08017694:
	lsls r1, r7, #2
	mov r4, sl
	adds r2, r1, r4
	ldr r3, [r2]
	adds r0, r3, #0
	movs r4, #0xf
	ands r0, r4
	str r1, [sp, #0x98]
	cmp r0, #0
	beq _080176BA
	adds r4, r2, #0
	subs r4, #0x20
	ldr r5, [r4]
	ldr r0, _08017700 @ =0x0FFFFFFF
	ands r5, r0
	mov r1, ip
	lsls r0, r1, #0x1c
	orrs r5, r0
	str r5, [r4]
_080176BA:
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r4, [r2, #4]
	adds r0, r4, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080176DA
	adds r0, r2, #0
	subs r0, #0x20
	ldr r5, [r0]
	ldr r2, _08017700 @ =0x0FFFFFFF
	ands r5, r2
	ldr r1, [sp, #0x90]
	orrs r5, r1
	str r5, [r0]
_080176DA:
	lsrs r4, r4, #4
	movs r5, #0
	movs r6, #0
	adds r7, #1
	mov r8, r7
	movs r7, #0xf
	movs r2, #1
	add r2, ip
	mov sb, r2
	movs r2, #0
_080176EE:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08017704
	mov r0, sb
	b _0801770A
	.align 2, 0
_08017700: .4byte 0x0FFFFFFF
_08017704:
	cmp r1, #0
	beq _0801770E
	mov r0, ip
_0801770A:
	lsls r0, r2
	orrs r5, r0
_0801770E:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _080176EE
	ldr r0, [sp, #0x98]
	add r0, sl
	str r5, [r0]
	mov r7, r8
	cmp r7, #0xe
	bls _08017694
	movs r5, #0
	mov r4, sl
	ldr r3, [r4, #0x1c]
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r0, [r4, #0x40]
	lsrs r4, r0, #4
	movs r6, #0
	movs r7, #0xf
	movs r0, #1
	add r0, ip
	mov r8, r0
	movs r2, #0
_08017740:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _08017750
	mov r0, r8
	b _08017756
_08017750:
	cmp r1, #0
	beq _0801775A
	mov r0, ip
_08017756:
	lsls r0, r2
	orrs r5, r0
_0801775A:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _08017740
	mov r1, sl
	str r5, [r1, #0x1c]
	movs r7, #0x10
	movs r2, #1
	add r2, ip
	mov sb, r2
_08017772:
	movs r5, #0
	lsls r2, r7, #2
	mov r4, sl
	adds r1, r2, r4
	ldr r3, [r1]
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r0, [r1, #4]
	lsrs r4, r0, #4
	movs r6, #0
	str r2, [sp, #0x98]
	adds r7, #1
	mov r8, r7
	movs r2, #0
_0801778E:
	adds r1, r3, #0
	movs r7, #0xf
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _080177A0
	mov r0, sb
	b _080177A6
_080177A0:
	cmp r1, #0
	beq _080177AA
	mov r0, ip
_080177A6:
	lsls r0, r2
	orrs r5, r0
_080177AA:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _0801778E
	ldr r0, [sp, #0x98]
	add r0, sl
	str r5, [r0]
	mov r7, r8
	cmp r7, #0x16
	bls _08017772
	mov r0, sl
	ldr r3, [r0, #0x5c]
	lsrs r0, r3, #4
	orrs r3, r0
	movs r5, #0
	movs r6, #0
	mov r1, sl
	ldr r4, [r1, #0x1c]
	ldr r7, [r1, #0x60]
	ldr r2, [r1, #0x3c]
	mov r8, r2
	movs r2, #0xf
_080177DA:
	adds r1, r3, #0
	ands r1, r2
	cmp r1, #0
	beq _080177EA
	lsls r1, r6, #2
	mov r0, ip
	lsls r0, r1
	orrs r5, r0
_080177EA:
	lsrs r3, r3, #4
	adds r6, #1
	cmp r6, #7
	bls _080177DA
	mov r0, sl
	str r5, [r0, #0x5c]
	adds r3, r4, #0
	adds r4, r7, #0
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	beq _08017812
	ldr r5, _08017838 @ =0x0FFFFFFF
	ands r5, r3
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x1c
	orrs r5, r0
	mov r1, sl
	str r5, [r1, #0x1c]
_08017812:
	lsrs r4, r4, #4
	movs r5, #0
	mov r2, r8
	lsrs r3, r2, #4
	orrs r3, r2
	movs r6, #0
	movs r7, #0xf
	movs r0, #1
	add r0, ip
	mov r8, r0
	movs r2, #0
_08017828:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _0801783C
	mov r0, r8
	b _08017842
	.align 2, 0
_08017838: .4byte 0x0FFFFFFF
_0801783C:
	cmp r1, #0
	beq _08017846
	mov r0, ip
_08017842:
	lsls r0, r2
	orrs r5, r0
_08017846:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _08017828
	mov r1, sl
	str r5, [r1, #0x3c]
	movs r7, #0x18
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x1c
	str r0, [sp, #0x94]
_08017860:
	lsls r1, r7, #2
	mov r4, sl
	adds r2, r1, r4
	ldr r3, [r2]
	adds r0, r3, #0
	movs r4, #0xf
	ands r0, r4
	str r1, [sp, #0x98]
	cmp r0, #0
	beq _08017886
	adds r4, r2, #0
	subs r4, #0x20
	ldr r5, [r4]
	ldr r0, _080178CC @ =0x0FFFFFFF
	ands r5, r0
	mov r1, ip
	lsls r0, r1, #0x1c
	orrs r5, r0
	str r5, [r4]
_08017886:
	lsrs r0, r3, #4
	orrs r3, r0
	ldr r4, [r2, #4]
	adds r0, r4, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080178A6
	adds r0, r2, #0
	subs r0, #0x20
	ldr r5, [r0]
	ldr r2, _080178CC @ =0x0FFFFFFF
	ands r5, r2
	ldr r1, [sp, #0x94]
	orrs r5, r1
	str r5, [r0]
_080178A6:
	lsrs r4, r4, #4
	movs r5, #0
	movs r6, #0
	adds r7, #1
	mov r8, r7
	movs r7, #0xf
	movs r2, #1
	add r2, ip
	mov sb, r2
	movs r2, #0
_080178BA:
	adds r1, r3, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	cmp r0, #0
	beq _080178D0
	mov r0, sb
	b _080178D6
	.align 2, 0
_080178CC: .4byte 0x0FFFFFFF
_080178D0:
	cmp r1, #0
	beq _080178DA
	mov r0, ip
_080178D6:
	lsls r0, r2
	orrs r5, r0
_080178DA:
	lsrs r3, r3, #4
	lsrs r4, r4, #4
	adds r2, #4
	adds r6, #1
	cmp r6, #7
	bls _080178BA
	ldr r0, [sp, #0x98]
	add r0, sl
	str r5, [r0]
	mov r7, r8
	cmp r7, #0x1e
	bls _08017860
	mov r4, sl
	ldr r3, [r4, #0x7c]
	lsrs r0, r3, #4
	orrs r3, r0
	movs r5, #0
	movs r6, #0
	movs r2, #0xf
_08017900:
	adds r1, r3, #0
	ands r1, r2
	cmp r1, #0
	beq _08017910
	lsls r1, r6, #2
	mov r0, ip
	lsls r0, r1
	orrs r5, r0
_08017910:
	lsrs r3, r3, #4
	adds r6, #1
	cmp r6, #7
	bls _08017900
	mov r7, sl
	str r5, [r7, #0x7c]
	ldr r0, _08017928 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r2, [sp, #0x80]
	str r2, [r0, #4]
	b _08017934
	.align 2, 0
_08017928: .4byte 0x040000D4
_0801792C:
	ldr r0, _08017978 @ =0x040000D4
	str r3, [r0]
	ldr r4, [sp, #0x80]
	str r4, [r0, #4]
_08017934:
	ldr r1, _0801797C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r7, [sp, #0x84]
	cmp r7, #0
	beq _08017968
	ldr r1, [sp, #0x8c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	strh r0, [r7]
	ldr r4, [sp, #0x88]
	movs r7, #0x80
	lsls r7, r7, #7
	adds r0, r4, r7
	ldr r1, [sp, #0x84]
	strh r0, [r1, #2]
	ldr r2, [sp, #0x80]
	lsls r0, r2, #0x11
	lsrs r0, r0, #0x16
	movs r4, #0xd4
	lsls r4, r4, #8
	adds r1, r4, #0
	adds r0, r0, r1
	ldr r7, [sp, #0x84]
	strh r0, [r7, #4]
_08017968:
	add sp, #0xa0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017978: .4byte 0x040000D4
_0801797C: .4byte 0x80000040

	thumb_func_start sub_8017980
sub_8017980: @ 0x08017980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r1, [sp, #8]
	adds r5, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x40]
	mov sl, r1
	str r5, [sp, #0x10]
	movs r2, #0
	mov sb, r2
	movs r6, #0
	movs r3, #8
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x3c]
	lsls r0, r0, #2
	ldr r1, _08017A0C @ =gUnknown_08270938
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, _08017A10 @ =gUnknown_08270934
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, #0x45
	beq _08017A68
	ldr r3, [sp, #0x38]
	lsls r3, r3, #0x10
	str r3, [sp, #0x14]
_080179BC:
	cmp r0, #0x80
	bls _08017A14
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldrh r1, [r4]
	subs r1, #0x80
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	mov r3, r8
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	ldr r3, [sp, #0x14]
	lsrs r2, r3, #0x10
	adds r3, r7, #0
	bl sub_80175D8
	adds r5, #0xe
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #1
	add r1, sl
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	cmp r7, #0
	beq _08017A60
	adds r7, #8
	b _08017A60
	.align 2, 0
_08017A0C: .4byte gUnknown_08270938
_08017A10: .4byte gUnknown_08270934
_08017A14:
	cmp r0, #0x2e
	bne _08017A1E
	ldr r5, [sp, #0x10]
	movs r1, #0x12
	add r8, r1
_08017A1E:
	cmp r0, #0xc
	bne _08017A38
	adds r4, #2
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r4]
	movs r3, #0x80
	lsls r3, r3, #8
	b _08017A5C
_08017A38:
	cmp r0, #0xb
	bne _08017A44
	adds r4, #2
	ldrh r0, [r4]
	str r0, [sp, #0xc]
	b _08017A60
_08017A44:
	cmp r0, #0x20
	bne _08017A60
	adds r4, #2
	adds r0, r6, #0
	adds r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r4]
	movs r3, #0x80
	lsls r3, r3, #7
_08017A5C:
	adds r1, r2, r3
	strh r1, [r0]
_08017A60:
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, #0x45
	bne _080179BC
_08017A68:
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldr r3, [sp, #0x38]
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	mov r3, r8
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0xff
	adds r3, r7, #0
	bl sub_80174F8
	adds r1, r6, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #1
	add r1, sl
	ldr r2, _08017AB0 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	adds r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017AB0: .4byte 0x0000FFFF

	thumb_func_start sub_8017AB4
sub_8017AB4: @ 0x08017AB4
	push {lr}
	ldr r1, _08017ACC @ =gScriptContext
	adds r1, #0x44
	strh r0, [r1]
	subs r0, #1
	cmp r0, #0x10
	bhi _08017B9C
	lsls r0, r0, #2
	ldr r1, _08017AD0 @ =_08017AD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017ACC: .4byte gScriptContext
_08017AD0: .4byte _08017AD4
_08017AD4: @ jump table
	.4byte _08017B44 @ case 0
	.4byte _08017B9C @ case 1
	.4byte _08017B18 @ case 2
	.4byte _08017B34 @ case 3
	.4byte _08017B34 @ case 4
	.4byte _08017B34 @ case 5
	.4byte _08017B34 @ case 6
	.4byte _08017B34 @ case 7
	.4byte _08017B18 @ case 8
	.4byte _08017B34 @ case 9
	.4byte _08017B34 @ case 10
	.4byte _08017B34 @ case 11
	.4byte _08017B34 @ case 12
	.4byte _08017B34 @ case 13
	.4byte _08017B44 @ case 14
	.4byte _08017B60 @ case 15
	.4byte _08017B7C @ case 16
_08017B18:
	ldr r1, _08017B2C @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017B30 @ =gMain
	movs r1, #0xa0
	bl sub_8018CA8
	b _08017B8C
	.align 2, 0
_08017B2C: .4byte gUnknown_02011FC0
_08017B30: .4byte gMain
_08017B34:
	ldr r1, _08017B40 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	b _08017B9C
	.align 2, 0
_08017B40: .4byte gUnknown_02011FC0
_08017B44:
	ldr r1, _08017B58 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017B5C @ =gMain
	movs r1, #0x90
	bl sub_8018CA8
	b _08017B8C
	.align 2, 0
_08017B58: .4byte gUnknown_02011FC0
_08017B5C: .4byte gMain
_08017B60:
	ldr r1, _08017B74 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017B78 @ =gMain
	movs r1, #0xb0
	bl sub_8018CA8
	b _08017B8C
	.align 2, 0
_08017B74: .4byte gUnknown_02011FC0
_08017B78: .4byte gMain
_08017B7C:
	ldr r1, _08017BA0 @ =gUnknown_02011FC0
	movs r0, #0
	bl LZ77UnCompWram
	ldr r0, _08017BA4 @ =gMain
	movs r1, #0xa0
	bl sub_8018CA8
_08017B8C:
	ldr r0, _08017BA4 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	bl sub_8007610
	movs r0, #0x80
	bl sub_8018778
_08017B9C:
	pop {r0}
	bx r0
	.align 2, 0
_08017BA0: .4byte gUnknown_02011FC0
_08017BA4: .4byte gMain

	thumb_func_start sub_8017BA8
sub_8017BA8: @ 0x08017BA8
	movs r1, #0
	ldr r0, _08017BBC @ =gScriptContext
	movs r2, #0
	adds r0, #0x18
_08017BB0:
	strh r2, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #1
	bls _08017BB0
	bx lr
	.align 2, 0
_08017BBC: .4byte gScriptContext

	thumb_func_start sub_8017BC0
sub_8017BC0: @ 0x08017BC0
	push {r4, r5, lr}
	movs r4, #0x10
	ldr r0, _08017C2C @ =gScriptContext
	ldr r2, [r0]
	adds r1, r0, #0
	adds r1, #0x29
	mov ip, r0
	ldrb r1, [r1]
	cmp r1, #2
	bhi _08017C68
	ldr r5, _08017C30 @ =gUnknown_0802845E
_08017BD6:
	ldrh r0, [r2]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #0x7f
	bhi _08017C34
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08017C3E
	cmp r1, #7
	beq _08017C3E
	cmp r1, #8
	beq _08017C3E
	cmp r1, #9
	beq _08017C3E
	cmp r1, #0xa
	beq _08017C3E
	cmp r1, #0xd
	beq _08017C3E
	cmp r1, #0x15
	beq _08017C3E
	cmp r1, #0x2a
	beq _08017C3E
	cmp r1, #0x2d
	beq _08017C3E
	cmp r1, #0x2e
	beq _08017C3E
	cmp r1, #0x45
	beq _08017C3E
	adds r1, r3, #0
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0
	cmp r0, r1
	bhs _08017C3A
_08017C20:
	adds r2, #2
	adds r0, #1
	cmp r0, r1
	blo _08017C20
	b _08017C3A
	.align 2, 0
_08017C2C: .4byte gScriptContext
_08017C30: .4byte gUnknown_0802845E
_08017C34:
	subs r4, #1
	cmp r4, #0
	beq _08017C3E
_08017C3A:
	adds r2, #2
	b _08017BD6
_08017C3E:
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017C58
	adds r0, r3, #0
	cmp r0, #1
	beq _08017C52
	cmp r0, #0x2e
	bne _08017C58
_08017C52:
	movs r0, #1
	mov r1, ip
	strh r0, [r1, #0x1a]
_08017C58:
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x18
	adds r0, r0, r1
	strh r4, [r0]
_08017C68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8017C70
sub_8017C70: @ 0x08017C70
	ldr r1, _08017CA0 @ =gUnknown_0802845E
	ldr r3, _08017CA4 @ =gScriptContext
	ldrh r2, [r3, #0xa]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #0
	bne _08017C86
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
_08017C86:
	movs r0, #0
	cmp r0, r2
	bhs _08017C9C
	ldr r1, [r3]
_08017C8E:
	adds r1, #2
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r2
	blo _08017C8E
	str r1, [r3]
_08017C9C:
	movs r0, #0
	bx lr
	.align 2, 0
_08017CA0: .4byte gUnknown_0802845E
_08017CA4: .4byte gScriptContext

	thumb_func_start sub_8017CA8
sub_8017CA8: @ 0x08017CA8
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r5, [r0]
	adds r4, r1, #0
	ands r4, r5
	ands r2, r5
	adds r4, r4, r3
	ands r4, r1
	adds r2, r2, r4
	strh r2, [r0]
	strh r2, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8017CD0
sub_8017CD0: @ 0x08017CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08017D74 @ =gScriptContext
	movs r0, #4
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	cmp r0, #0
	beq _08017CEA
	b _08017EE2
_08017CEA:
	ldr r0, _08017D78 @ =gMain
	ldrb r0, [r0, #8]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08017CFA
	b _08017EE2
_08017CFA:
	ldr r6, _08017D7C @ =gUnknown_03002D68
	movs r5, #0
	mov sl, r5
	ldr r5, _08017D80 @ =gUnknown_03003AF0
	mov r8, r1
	movs r7, #0
	ldr r0, _08017D84 @ =0x000001FF
	mov sb, r0
_08017D0A:
	adds r2, r7, r5
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08017D14
	b _08017ECC
_08017D14:
	ldrh r4, [r6, #2]
	mov r1, sb
	ands r4, r1
	ldrb r3, [r6]
	ldrh r0, [r2, #8]
	strh r0, [r6]
	ldrh r0, [r2, #0xa]
	strh r0, [r6, #2]
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _08017D3E
	ldrb r1, [r2, #2]
	adds r1, #1
	movs r0, #0x1f
	ands r1, r0
	strb r1, [r2, #2]
	cmp r1, #0xf
	bhi _08017D3E
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
_08017D3E:
	adds r2, r7, r5
	ldrb r5, [r2, #5]
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _08017D4C
	b _08017E7C
_08017D4C:
	ldrb r0, [r2, #4]
	cmp r0, #4
	beq _08017D88
	ldrb r4, [r2, #3]
	ldrb r0, [r2, #7]
	adds r1, r4, r0
	strb r1, [r2, #7]
	ldrb r3, [r2, #6]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	blo _08017E00
	subs r0, r1, r3
	subs r0, r4, r0
	strb r0, [r2, #3]
	movs r0, #0xfd
	ands r0, r5
	strb r0, [r2, #5]
	b _08017E00
	.align 2, 0
_08017D74: .4byte gScriptContext
_08017D78: .4byte gMain
_08017D7C: .4byte gUnknown_03002D68
_08017D80: .4byte gUnknown_03003AF0
_08017D84: .4byte 0x000001FF
_08017D88:
	mov r0, r8
	adds r0, #0x46
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, r8
	adds r0, #0x48
	ldrh r0, [r0]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _08017E14 @ =gUnknown_0300712A
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08017DDC
	movs r0, #0xfd
	ldrb r5, [r2, #5]
	ands r0, r5
	strb r0, [r2, #5]
	movs r0, #0xff
	lsls r0, r0, #8
	adds r1, r0, #0
	ldrh r5, [r2, #8]
	ands r1, r5
	movs r0, #0xff
	ands r0, r3
	orrs r1, r0
	strh r1, [r2, #8]
	movs r0, #0xfe
	lsls r0, r0, #8
	adds r1, r0, #0
	ldrh r5, [r2, #0xa]
	ands r1, r5
	adds r0, r4, #0
	mov r5, sb
	ands r0, r5
	orrs r1, r0
	strh r1, [r2, #0xa]
_08017DDC:
	movs r0, #0xff
	lsls r0, r0, #8
	adds r1, r0, #0
	ldrh r2, [r6]
	ands r1, r2
	movs r0, #0xff
	ands r3, r0
	orrs r1, r3
	strh r1, [r6]
	movs r5, #0xfe
	lsls r5, r5, #8
	adds r0, r5, #0
	ldrh r1, [r6, #2]
	ands r0, r1
	mov r2, sb
	ands r4, r2
	orrs r0, r4
	strh r0, [r6, #2]
_08017E00:
	ldr r0, _08017E18 @ =gUnknown_03003AF0
	adds r2, r7, r0
	ldrb r1, [r2, #4]
	cmp r1, #1
	beq _08017E34
	cmp r1, #1
	bgt _08017E1C
	cmp r1, #0
	beq _08017E26
	b _08017E7C
	.align 2, 0
_08017E14: .4byte gUnknown_0300712A
_08017E18: .4byte gUnknown_03003AF0
_08017E1C:
	cmp r1, #2
	beq _08017E48
	cmp r1, #3
	beq _08017E68
	b _08017E7C
_08017E26:
	adds r0, #8
	adds r0, r7, r0
	ldrb r2, [r2, #3]
	rsbs r3, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	b _08017E3A
_08017E34:
	adds r0, #8
	adds r0, r7, r0
	ldrb r3, [r2, #3]
_08017E3A:
	str r6, [sp]
	movs r1, #0xff
	movs r2, #0xff
	lsls r2, r2, #8
	bl sub_8017CA8
	b _08017E7C
_08017E48:
	adds r0, #0xa
	adds r0, r7, r0
	ldrb r2, [r2, #3]
	rsbs r3, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r1, r6, #2
	str r1, [sp]
	ldr r1, _08017E64 @ =0x000001FF
	movs r2, #0xfe
	lsls r2, r2, #8
	bl sub_8017CA8
	b _08017E7C
	.align 2, 0
_08017E64: .4byte 0x000001FF
_08017E68:
	adds r0, #0xa
	adds r0, r7, r0
	ldrb r3, [r2, #3]
	adds r1, r6, #2
	str r1, [sp]
	ldr r1, _08017EC0 @ =0x000001FF
	movs r2, #0xfe
	lsls r2, r2, #8
	bl sub_8017CA8
_08017E7C:
	ldr r1, _08017EC4 @ =gUnknown_03003AF0
	adds r3, r7, r1
	movs r0, #4
	ldrb r5, [r3, #5]
	ands r0, r5
	adds r5, r1, #0
	cmp r0, #0
	beq _08017E92
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
_08017E92:
	ldrh r0, [r3, #0xe]
	subs r0, #0x39
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _08017ED2
	ldr r2, _08017EC8 @ =gOamObjects
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r1, [r3, #8]
	strh r1, [r0]
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r1, [r3, #0xa]
	strh r1, [r0, #2]
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r1, [r3, #0xc]
	strh r1, [r0, #4]
	b _08017ED2
	.align 2, 0
_08017EC0: .4byte 0x000001FF
_08017EC4: .4byte gUnknown_03003AF0
_08017EC8: .4byte gOamObjects
_08017ECC:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6]
_08017ED2:
	adds r6, #8
	adds r7, #0x14
	movs r2, #1
	add sl, r2
	mov r0, sl
	cmp r0, #7
	bhi _08017EE2
	b _08017D0A
_08017EE2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8017EF4
sub_8017EF4: @ 0x08017EF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _08017F30 @ =gScriptContext
	ldrh r0, [r3, #0xa]
	cmp r0, r4
	beq _08017F2A
	cmp r4, #0xc
	beq _08017F0C
	ldr r0, _08017F34 @ =0x00007FFF
	ldrh r1, [r3, #0x1c]
	ands r0, r1
	strh r0, [r3, #0x1c]
_08017F0C:
	ldrh r0, [r3, #0x12]
	movs r1, #0
	strh r0, [r3, #0x14]
	strh r1, [r3, #0x12]
	ldr r0, _08017F38 @ =gUnknown_08028288
	lsls r1, r4, #1
	adds r0, r1, r0
	ldrh r2, [r0]
	strh r2, [r3, #0x12]
	ldr r0, _08017F3C @ =gUnknown_08028370
	adds r1, r1, r0
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r3, #0x12]
	strh r4, [r3, #0xa]
_08017F2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017F30: .4byte gScriptContext
_08017F34: .4byte 0x00007FFF
_08017F38: .4byte gUnknown_08028288
_08017F3C: .4byte gUnknown_08028370

	thumb_func_start sub_8017F40
sub_8017F40: @ 0x08017F40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xac
	str r0, [sp, #0x94]
	adds r7, r1, #0
	mov sb, r2
	add r2, sp, #0x80
	adds r1, r2, #0
	ldr r0, _08017F90 @ =gUnknown_08028664
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	str r7, [sp, #0x98]
	ldr r1, _08017F94 @ =gScriptContext
	movs r0, #4
	ldrh r5, [r1, #0x1c]
	ands r0, r5
	adds r3, r2, #0
	mov r8, r1
	cmp r0, #0
	beq _08017FBC
	movs r5, #0x20
	ldr r2, _08017F98 @ =gUnknown_03003E50
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08017F9C
	movs r1, #0
	str r1, [sp, #0x98]
	b _08017FBC
	.align 2, 0
_08017F90: .4byte gUnknown_08028664
_08017F94: .4byte gScriptContext
_08017F98: .4byte gUnknown_03003E50
_08017F9C:
	adds r5, #1
	cmp r5, #0x3f
	bhi _08017FBC
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r2, _08017FDC @ =gUnknown_03003E50
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08017F9C
	subs r5, #0x20
	str r5, [sp, #0x98]
_08017FBC:
	ldr r4, [sp, #0x98]
	lsls r0, r4, #7
	ldr r5, _08017FE0 @ =0x06010000
	adds r5, r5, r0
	mov sl, r5
	movs r0, #4
	mov r1, r8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _08017FE4
	movs r2, #0x80
	lsls r2, r2, #5
	add sl, r2
	b _08017FEA
	.align 2, 0
_08017FDC: .4byte gUnknown_03003E50
_08017FE0: .4byte 0x06010000
_08017FE4:
	mov r4, sb
	lsls r0, r4, #0xb
	add sl, r0
_08017FEA:
	ldr r5, [sp, #0x94]
	lsls r6, r5, #7
	ldr r0, _08018090 @ =gUnknown_0819F694
	adds r6, r6, r0
	mov r1, r8
	adds r1, #0x22
	movs r0, #0x20
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08018038
	movs r5, #0
	ldr r0, [r3]
	cmp r0, r7
	bhi _08018018
	adds r2, r3, #0
_0801800A:
	adds r2, #4
	adds r5, #1
	cmp r5, #4
	bhi _08018018
	ldr r0, [r2]
	cmp r0, r7
	bls _0801800A
_08018018:
	cmp r5, #5
	bne _0801801E
	b _0801829E
_0801801E:
	cmp r5, #0
	bne _08018024
	movs r5, #5
_08018024:
	movs r1, #5
	subs r1, r1, r5
	lsls r1, r1, #4
	mov r2, r8
	adds r2, #0x25
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	orrs r1, r0
	strb r1, [r2]
_08018038:
	mov r3, r8
	adds r3, #0x25
	ldrb r1, [r3]
	cmp r1, #0
	bne _08018044
	b _08018140
_08018044:
	movs r0, #0xf0
	ands r0, r1
	lsls r2, r0, #0x18
	cmp r2, #0
	beq _080180D2
	ldr r0, _08018094 @ =0x040000D4
	str r6, [r0]
	mov r4, sp
	str r4, [r0, #4]
	ldr r1, _08018098 @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	lsrs r6, r2, #0x1c
	movs r5, #0
	lsls r0, r7, #3
	str r0, [sp, #0xa0]
	mov r1, sb
	lsls r1, r1, #3
	str r1, [sp, #0xa4]
	lsls r2, r7, #2
	str r2, [sp, #0x9c]
	mov r3, sb
	lsls r3, r3, #6
	str r3, [sp, #0xa8]
	adds r0, r6, #0
	movs r1, #5
	bl __umodsi3
	adds r3, r0, #0
_0801807E:
	ldrb r1, [r4]
	movs r2, #0xf
	ands r2, r1
	movs r0, #0xf0
	ands r1, r0
	cmp r2, #3
	bne _0801809C
	adds r2, r6, #0
	b _080180AC
	.align 2, 0
_08018090: .4byte gUnknown_0819F694
_08018094: .4byte 0x040000D4
_08018098: .4byte 0x80000040
_0801809C:
	cmp r2, #2
	bne _080180AA
	movs r2, #0
	cmp r3, #1
	beq _080180AC
	subs r2, r6, #1
	b _080180AC
_080180AA:
	movs r2, #0
_080180AC:
	cmp r1, #0x30
	bne _080180B4
	lsls r1, r6, #4
	b _080180C4
_080180B4:
	cmp r1, #0x20
	bne _080180C2
	cmp r3, #1
	beq _080180C2
	subs r0, r6, #1
	lsls r1, r0, #4
	b _080180C4
_080180C2:
	movs r1, #0
_080180C4:
	orrs r2, r1
	strb r2, [r4]
	adds r4, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _0801807E
	b _08018126
_080180D2:
	ldr r0, _08018138 @ =0x040000D4
	str r6, [r0]
	mov r4, sp
	str r4, [r0, #4]
	ldr r1, _0801813C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldrb r5, [r3]
	lsls r0, r5, #1
	adds r6, r0, r5
	movs r5, #0
	lsls r0, r7, #3
	str r0, [sp, #0xa0]
	mov r1, sb
	lsls r1, r1, #3
	str r1, [sp, #0xa4]
	lsls r2, r7, #2
	str r2, [sp, #0x9c]
	mov r3, sb
	lsls r3, r3, #6
	str r3, [sp, #0xa8]
	movs r0, #0xf
	mov ip, r0
	lsls r0, r6, #4
_08018102:
	ldrb r1, [r4]
	adds r2, r1, #0
	mov r3, ip
	ands r2, r3
	movs r3, #0xf0
	ands r1, r3
	cmp r2, #0
	beq _08018114
	adds r2, r2, r6
_08018114:
	cmp r1, #0
	beq _0801811A
	adds r1, r1, r0
_0801811A:
	orrs r2, r1
	strb r2, [r4]
	adds r4, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _08018102
_08018126:
	ldr r0, _08018138 @ =0x040000D4
	mov r4, sp
	str r4, [r0]
	mov r5, sl
	str r5, [r0, #4]
	ldr r1, _0801813C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _08018162
	.align 2, 0
_08018138: .4byte 0x040000D4
_0801813C: .4byte 0x80000040
_08018140:
	ldr r0, _08018188 @ =0x040000D4
	str r6, [r0]
	mov r1, sl
	str r1, [r0, #4]
	ldr r1, _0801818C @ =0x80000040
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	lsls r2, r7, #3
	str r2, [sp, #0xa0]
	mov r3, sb
	lsls r3, r3, #3
	str r3, [sp, #0xa4]
	lsls r4, r7, #2
	str r4, [sp, #0x9c]
	mov r5, sb
	lsls r5, r5, #6
	str r5, [sp, #0xa8]
_08018162:
	movs r0, #4
	mov r1, r8
	ldrh r1, [r1, #0x1c]
	ands r0, r1
	cmp r0, #0
	beq _080181B8
	movs r5, #0x20
	ldr r2, _08018190 @ =gUnknown_03003E50
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08018194
	movs r6, #0x20
	b _080181BE
	.align 2, 0
_08018188: .4byte 0x040000D4
_0801818C: .4byte 0x80000040
_08018190: .4byte gUnknown_03003E50
_08018194:
	adds r5, #1
	cmp r5, #0x3f
	bhi _080181BE
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r4, _080181B4 @ =gUnknown_03003E50
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08018194
	adds r6, r5, #0
	b _080181BE
	.align 2, 0
_080181B4: .4byte gUnknown_03003E50
_080181B8:
	mov r5, sb
	lsls r0, r5, #4
	adds r6, r7, r0
_080181BE:
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r2, _08018208 @ =gUnknown_03003E50
	adds r4, r0, r2
	ldr r3, [sp, #0xa0]
	subs r5, r3, r7
	lsls r0, r5, #1
	movs r7, #0
	strh r0, [r4, #4]
	ldr r0, [sp, #0xa4]
	add r0, sb
	lsls r0, r0, #1
	strh r0, [r4, #6]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ldr r2, [sp, #0x94]
	orrs r2, r0
	orrs r2, r7
	strh r2, [r4]
	mov r3, r8
	adds r3, #0x22
	movs r0, #0xf0
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0x10
	bne _0801820C
	movs r3, #0x80
	lsls r3, r3, #7
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r4]
	lsls r0, r5, #2
	strh r0, [r4, #4]
	b _08018212
	.align 2, 0
_08018208: .4byte gUnknown_03003E50
_0801820C:
	ldr r0, _080182B0 @ =0x0000BFFF
	ands r2, r0
	strh r2, [r4]
_08018212:
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r4, _080182B4 @ =gUnknown_03003E50
	adds r2, r0, r4
	ldr r5, [sp, #0x9c]
	ldr r7, [sp, #0xa8]
	adds r0, r5, r7
	strh r0, [r2, #2]
	mov r3, r8
	adds r3, #0x25
	movs r0, #0xf0
	ldrb r4, [r3]
	ands r0, r4
	cmp r0, #0
	beq _08018238
	movs r5, #0x80
	lsls r5, r5, #8
	adds r0, r5, #0
	orrs r0, r4
_08018238:
	strh r0, [r2, #8]
	movs r5, #4
	adds r0, r5, #0
	mov r7, r8
	ldrh r7, [r7, #0x1c]
	ands r0, r7
	cmp r0, #0
	beq _08018284
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r3, _080182B4 @ =gUnknown_03003E50
	adds r2, r0, r3
	ldrh r3, [r2, #4]
	adds r3, #0xe
	strh r3, [r2, #4]
	ldrh r4, [r2, #6]
	adds r4, #0x24
	strh r4, [r2, #6]
	ldr r7, [sp, #0x98]
	lsls r0, r7, #2
	adds r0, #0x80
	strh r0, [r2, #2]
	adds r0, r5, #0
	mov r5, r8
	ldrh r5, [r5, #0x1c]
	ands r0, r5
	cmp r0, #0
	beq _08018284
	mov r0, r8
	adds r0, #0x4c
	ldrb r0, [r0]
	adds r0, r0, r3
	strh r0, [r2, #4]
	mov r0, r8
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r0, r4
	strh r0, [r2, #6]
_08018284:
	adds r0, r1, r6
	lsls r0, r0, #2
	ldr r7, _080182B4 @ =gUnknown_03003E50
	adds r0, r0, r7
	ldrh r2, [r0, #2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r2, r3
	strh r1, [r0, #2]
	mov r1, r8
	adds r1, #0x25
	ldrb r1, [r1]
	strb r1, [r0, #0xa]
_0801829E:
	add sp, #0xac
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080182B0: .4byte 0x0000BFFF
_080182B4: .4byte gUnknown_03003E50

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
	ldr r1, _08018380 @ =gScriptCmdFuncs+0x1D0
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
	bl sub_8016EBC
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
_08018380: .4byte gScriptCmdFuncs+0x1D0
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
	bl sub_8017F40
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
	bl sub_8011150
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
	bl sub_8011150
_080184DE:
	ldrb r4, [r4]
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080184EA
	b _08018312
_080184EA:
	movs r0, #0x2d
	bl sub_8011150
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
	ldr r0, _080185EC @ =gUnknown_0819F674
	str r0, [r1]
	ldr r0, _080185F0 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _080185F4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0
	ldr r3, _080185F8 @ =0x00003FFF
	ldr r1, _080185FC @ =gUnknown_03003E50
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
	ldr r1, _08018604 @ =gUnknown_03003AF0
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
_080185EC: .4byte gUnknown_0819F674
_080185F0: .4byte 0x05000200
_080185F4: .4byte 0x80000010
_080185F8: .4byte 0x00003FFF
_080185FC: .4byte gUnknown_03003E50
_08018600: .4byte gUnknown_02011FC0
_08018604: .4byte gUnknown_03003AF0

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
	ldr r1, _080186EC @ =gUnknown_03003AF0
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
	ldr r1, _080186F4 @ =gUnknown_03003E50
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
_080186EC: .4byte gUnknown_03003AF0
_080186F0: .4byte 0x00003FFF
_080186F4: .4byte gUnknown_03003E50
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

	thumb_func_start sub_8018778
sub_8018778: @ 0x08018778
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
	ldr r4, _08018854 @ =gUnknown_03002BB0
	mov sb, r3
	ldr r5, _08018858 @ =gScriptContext
	ldr r6, _0801885C @ =gUnknown_03003E50
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
_08018854: .4byte gUnknown_03002BB0
_08018858: .4byte gScriptContext
_0801885C: .4byte gUnknown_03003E50
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
	ldr r1, _08018A28 @ =gUnknown_03002BB0
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
	ldr r0, _08018A2C @ =gUnknown_03003E50
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
_08018A28: .4byte gUnknown_03002BB0
_08018A2C: .4byte gUnknown_03003E50
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
	ldr r4, _08018A7C @ =gUnknown_03002BB0
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
_08018A7C: .4byte gUnknown_03002BB0

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
	bl sub_8017CD0
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
	ldr r4, _08018B54 @ =gUnknown_03003E50
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
	ldr r0, _08018B5C @ =gUnknown_0819F694
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
_08018B54: .4byte gUnknown_03003E50
_08018B58: .4byte 0x00003FFF
_08018B5C: .4byte gUnknown_0819F694
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

	thumb_func_start sub_8018D04
sub_8018D04: @ 0x08018D04
	push {r4, lr}
	sub sp, #4
	ldr r4, _08018D3C @ =gScriptContext
	movs r3, #0
_08018D0C:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08018D0C
	mov r0, sp
	ldrh r0, [r0, #2]
	mov r1, sp
	ldrh r1, [r1]
	bl sub_80113E8
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018D3C: .4byte gScriptContext

	thumb_func_start sub_8018D40
sub_8018D40: @ 0x08018D40
	push {r4, lr}
	sub sp, #4
	ldr r4, _08018D78 @ =gScriptContext
	movs r3, #0
_08018D48:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08018D48
	mov r0, sp
	ldrh r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08018D7C
	mov r0, sp
	ldrh r0, [r0]
	bl sub_8011150
	b _08018D84
	.align 2, 0
_08018D78: .4byte gScriptContext
_08018D7C:
	mov r0, sp
	ldrh r0, [r0]
	bl sub_8011194
_08018D84:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8018D90
sub_8018D90: @ 0x08018D90
	push {r4, lr}
	sub sp, #8
	ldr r4, _08018DD4 @ =gScriptContext
	movs r3, #0
_08018D98:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #2
	bls _08018D98
	mov r0, sp
	ldrh r2, [r0]
	lsrs r0, r2, #8
	movs r1, #0xff
	ands r1, r2
	mov r2, sp
	ldrh r2, [r2, #2]
	mov r3, sp
	ldrh r3, [r3, #4]
	bl StartHardwareBlend
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018DD4: .4byte gScriptContext

	thumb_func_start sub_8018DD8
sub_8018DD8: @ 0x08018DD8
	push {r4, lr}
	ldr r2, _08018E2C @ =gMain
	movs r0, #0
	strb r0, [r2, #0x18]
	strb r0, [r2, #0x19]
	adds r1, r2, #0
	adds r1, #0xa6
	ldrh r0, [r1]
	adds r0, #0x28
	movs r4, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _08018DFA
	movs r0, #0x50
	strh r0, [r1]
_08018DFA:
	ldrh r1, [r1]
	adds r3, r2, #0
	adds r3, #0xb6
	adds r0, r2, #0
	adds r0, #0xa8
	strh r1, [r0]
	strh r1, [r3]
	ldr r0, _08018E30 @ =0x00000203
	str r0, [r2, #8]
	ldr r0, _08018E34 @ =gInvestigation
	strb r4, [r0, #0xc]
	strb r4, [r0, #0xd]
	adds r1, r2, #0
	adds r1, #0xc1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xe6
	bl sub_8011278
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018E2C: .4byte gMain
_08018E30: .4byte 0x00000203
_08018E34: .4byte gInvestigation

	thumb_func_start sub_8018E38
sub_8018E38: @ 0x08018E38
	push {r4, r5, r6, lr}
	ldr r1, _08018E84 @ =gScriptContext
	ldr r0, [r1]
	ldrh r4, [r0]
	adds r0, #2
	str r0, [r1]
	ldr r6, _08018E88 @ =0x00003FFF
	ands r6, r4
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_801090C
	adds r2, r0, #0
	cmp r2, #0
	bge _08018EBE
	adds r0, r5, #0
	bl sub_8010954
	adds r2, r0, #0
	cmp r2, #0
	blt _08018EBE
	cmp r5, #0
	beq _08018E90
	ldr r0, _08018E8C @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x3c
	adds r1, r2, r1
	strb r6, [r1]
	ldrb r1, [r0, #0x11]
	adds r1, #1
	strb r1, [r0, #0x11]
	b _08018EA0
	.align 2, 0
_08018E84: .4byte gScriptContext
_08018E88: .4byte 0x00003FFF
_08018E8C: .4byte gCourtRecord
_08018E90:
	ldr r0, _08018EC8 @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x1c
	adds r1, r2, r1
	strb r6, [r1]
	ldrb r1, [r0, #0x10]
	adds r1, #1
	strb r1, [r0, #0x10]
_08018EA0:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r4, r0
	cmp r4, #0
	beq _08018EBE
	ldr r1, _08018ECC @ =gMain
	adds r0, r1, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	movs r0, #8
	str r0, [r1, #8]
_08018EBE:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018EC8: .4byte gCourtRecord
_08018ECC: .4byte gMain

	thumb_func_start sub_8018ED0
sub_8018ED0: @ 0x08018ED0
	push {r4, lr}
	ldr r1, _08018F04 @ =gScriptContext
	ldr r0, [r1]
	ldrh r2, [r0]
	adds r0, #2
	str r0, [r1]
	ldr r1, _08018F08 @ =0x00003FFF
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r0, r4, #0
	bl sub_801090C
	adds r2, r0, #0
	cmp r2, #0
	blt _08018F20
	cmp r4, #0
	beq _08018F10
	ldr r0, _08018F0C @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x3c
	b _08018F16
	.align 2, 0
_08018F04: .4byte gScriptContext
_08018F08: .4byte 0x00003FFF
_08018F0C: .4byte gCourtRecord
_08018F10:
	ldr r0, _08018F28 @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x1c
_08018F16:
	adds r1, r2, r1
	movs r2, #0xff
	strb r2, [r1]
	bl sub_801097C
_08018F20:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018F28: .4byte gCourtRecord

	thumb_func_start sub_8018F2C
sub_8018F2C: @ 0x08018F2C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08018F88 @ =gScriptContext
	movs r3, #0
_08018F34:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08018F34
	mov r0, sp
	ldrh r1, [r0]
	ldr r6, _08018F8C @ =0x00003FFF
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sp
	ldrh r4, [r0]
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_801090C
	adds r1, r0, #0
	cmp r1, #0
	blt _08018FBA
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r2, r6, #0
	ands r2, r0
	cmp r5, #0
	beq _08018F94
	ldr r0, _08018F90 @ =gCourtRecord
	adds r0, #0x3c
	b _08018F98
	.align 2, 0
_08018F88: .4byte gScriptContext
_08018F8C: .4byte 0x00003FFF
_08018F90: .4byte gCourtRecord
_08018F94:
	ldr r0, _08018FC4 @ =gCourtRecord
	adds r0, #0x1c
_08018F98:
	adds r0, r1, r0
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r4, r0
	cmp r4, #0
	beq _08018FBA
	ldr r1, _08018FC8 @ =gMain
	adds r0, r1, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	movs r0, #8
	str r0, [r1, #8]
_08018FBA:
	movs r0, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018FC4: .4byte gCourtRecord
_08018FC8: .4byte gMain

	thumb_func_start sub_8018FCC
sub_8018FCC: @ 0x08018FCC
	push {r4, lr}
	sub sp, #8
	ldr r4, _08019018 @ =gScriptContext
	movs r3, #0
_08018FD4:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #3
	bls _08018FD4
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	mov r2, sp
	ldrh r2, [r2, #4]
	mov r3, sp
	ldrh r3, [r3, #6]
	bl sub_8014364
	mov r0, sp
	ldrh r0, [r0, #2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0801901C
	mov r1, sp
	movs r0, #0x1e
	strh r0, [r1, #4]
	b _08019020
	.align 2, 0
_08019018: .4byte gScriptContext
_0801901C:
	mov r0, sp
	strh r1, [r0, #4]
_08019020:
	ldr r0, _0801903C @ =gPalCourtScroll
	mov r1, sp
	ldrh r1, [r1, #4]
	mov r2, sp
	ldrh r3, [r2, #2]
	movs r2, #0x1f
	bl InitCourtScroll
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801903C: .4byte gPalCourtScroll

	thumb_func_start sub_8019040
sub_8019040: @ 0x08019040
	push {r4, r5, lr}
	ldr r4, _0801907C @ =gScriptContext
	ldr r3, _08019080 @ =gMain
	ldrh r5, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _08019084
	ldr r0, [r4]
	ldrh r1, [r0]
	ldrh r0, [r3, #0x34]
	movs r2, #0
	strh r0, [r3, #0x38]
	strh r1, [r3, #0x34]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r3, r1
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x80
	strh r0, [r1]
	movs r0, #1
	orrs r0, r5
	strh r0, [r4, #0x12]
	movs r0, #1
	b _080190A6
	.align 2, 0
_0801907C: .4byte gScriptContext
_08019080: .4byte gMain
_08019084:
	adds r0, r3, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08019096
	movs r0, #1
	b _080190A6
_08019096:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r5
	strh r0, [r4, #0x12]
	movs r0, #0
_080190A6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80190AC
sub_80190AC: @ 0x080190AC
	push {r4, r5, lr}
	ldr r5, _080190D0 @ =gScriptContext
	ldr r4, _080190D4 @ =gMain
	ldrh r0, [r4, #0x34]
	bl sub_80051AC
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080190D8
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	b _080190DE
	.align 2, 0
_080190D0: .4byte gScriptContext
_080190D4: .4byte gMain
_080190D8:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r1, [r0]
_080190DE:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5]
	ldrh r1, [r0]
	lsrs r0, r1, #8
	cmp r0, #1
	beq _0801910C
	cmp r0, #1
	bgt _080190FA
	cmp r0, #0
	beq _08019104
	b _0801911A
_080190FA:
	cmp r0, #2
	beq _08019112
	cmp r0, #3
	beq _08019114
	b _0801911A
_08019104:
	rsbs r1, r1, #0
	adds r0, r4, #0
	adds r0, #0x4c
	b _08019118
_0801910C:
	adds r0, r4, #0
	adds r0, #0x4c
	b _08019118
_08019112:
	rsbs r1, r1, #0
_08019114:
	adds r0, r4, #0
	adds r0, #0x4d
_08019118:
	strb r1, [r0]
_0801911A:
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8019128
sub_8019128: @ 0x08019128
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _08019188 @ =gScriptContext
	ldr r5, _0801918C @ =gMain
	movs r3, #0
_08019132:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #2
	bls _08019132
	mov r0, sp
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xc4
	strh r1, [r0]
	mov r0, sp
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0xc6
	strh r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #0
	beq _08019194
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r2, [r1, #2]
	movs r1, #0
	movs r3, #0
	bl sub_8012684
	ldr r0, _08019190 @ =gInvestigation
	movs r1, #1
	strb r1, [r0, #6]
	movs r1, #0xf
	bl sub_800BF90
	b _080191AC
	.align 2, 0
_08019188: .4byte gScriptContext
_0801918C: .4byte gMain
_08019190: .4byte gInvestigation
_08019194:
	movs r0, #0
	bl sub_8016FEC
	ldr r0, _080191B8 @ =gUnknown_03000844
	bl sub_8012F7C
	ldr r0, _080191BC @ =gInvestigation
	movs r1, #0
	strb r1, [r0, #6]
	movs r1, #0xf
	bl sub_800BF90
_080191AC:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080191B8: .4byte gUnknown_03000844
_080191BC: .4byte gInvestigation

	thumb_func_start sub_80191C0
sub_80191C0: @ 0x080191C0
	push {r4, r5, lr}
	ldr r5, _08019218 @ =gMain
	ldr r0, _0801921C @ =gIORegisters
	adds r3, r0, #0
	adds r3, #0x4a
	ldr r1, _08019220 @ =0x0000FBFF
	ldrh r2, [r3]
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	ldr r1, _08019224 @ =gUnknown_03000000
	adds r3, r0, #0
	ldr r4, _08019228 @ =gUnknown_03000844
	movs r2, #0
	movs r0, #0xa8
	lsls r0, r0, #2
_080191E6:
	strh r2, [r1]
	subs r0, #1
	adds r1, #2
	cmp r0, #0
	bne _080191E6
	movs r0, #0xf8
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #8
	strh r0, [r3, #0x10]
	adds r0, r4, #0
	bl sub_8012F7C
	adds r1, r5, #0
	adds r1, #0x3d
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08019218: .4byte gMain
_0801921C: .4byte gIORegisters
_08019220: .4byte 0x0000FBFF
_08019224: .4byte gUnknown_03000000
_08019228: .4byte gUnknown_03000844

	thumb_func_start sub_801922C
sub_801922C: @ 0x0801922C
	push {r4, lr}
	sub sp, #4
	ldr r4, _08019260 @ =gScriptContext
	movs r3, #0
_08019234:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08019234
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _08019264
	mov r0, sp
	ldrh r0, [r0, #2]
	bl sub_80113B8
	b _08019268
	.align 2, 0
_08019260: .4byte gScriptContext
_08019264:
	bl sub_8011324
_08019268:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8019274
sub_8019274: @ 0x08019274
	push {r4, lr}
	sub sp, #4
	ldr r4, _080192A4 @ =gScriptContext
	movs r3, #0
_0801927C:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _0801927C
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _080192A8
	bl sub_8011354
	b _080192AC
	.align 2, 0
_080192A4: .4byte gScriptContext
_080192A8:
	bl sub_80112C8
_080192AC:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80192B8
sub_80192B8: @ 0x080192B8
	ldr r0, _080192C8 @ =gMain
	movs r1, #0
	strb r1, [r0, #0x18]
	strb r1, [r0, #0x19]
	movs r1, #2
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
_080192C8: .4byte gMain

	thumb_func_start sub_80192CC
sub_80192CC: @ 0x080192CC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08019314 @ =gScriptContext
	ldr r5, _08019318 @ =gMain
	movs r3, #0
_080192D6:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080192D6
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r2, r5, #0
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	mov r0, sp
	ldrh r0, [r0, #2]
	strb r0, [r5, #0x16]
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08019314: .4byte gScriptContext
_08019318: .4byte gMain

	thumb_func_start sub_801931C
sub_801931C: @ 0x0801931C
	ldr r0, _08019338 @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _08019340
	ldr r1, _0801933C @ =gUnknown_030037BC
	subs r2, r1, #4
	ldr r0, [r2]
	str r0, [r1]
	movs r0, #5
	str r0, [r2]
	b _08019348
	.align 2, 0
_08019338: .4byte gScriptContext
_0801933C: .4byte gUnknown_030037BC
_08019340:
	ldr r1, _0801934C @ =gMain
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_08019348:
	movs r0, #0
	bx lr
	.align 2, 0
_0801934C: .4byte gMain

	thumb_func_start sub_8019350
sub_8019350: @ 0x08019350
	push {r4, lr}
	sub sp, #4
	ldr r4, _08019384 @ =gScriptContext
	movs r3, #0
_08019358:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08019358
	mov r0, sp
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _08019388
	mov r0, sp
	ldrh r0, [r0]
	bl sub_8012824
	b _08019394
	.align 2, 0
_08019384: .4byte gScriptContext
_08019388:
	mov r0, sp
	ldrh r0, [r0]
	bl sub_8011D68
	bl sub_8012F7C
_08019394:
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80193A0
sub_80193A0: @ 0x080193A0
	push {r4, lr}
	sub sp, #4
	ldr r4, _080193D8 @ =gScriptContext
	movs r3, #0
_080193A8:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080193A8
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	bl sub_8012D38
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080193D8: .4byte gScriptContext

	thumb_func_start sub_80193DC
sub_80193DC: @ 0x080193DC
	push {lr}
	ldr r0, _080193F8 @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _08019400
	ldr r0, _080193FC @ =gUnknown_03000844
	movs r1, #1
	bl sub_801208C
	b _08019408
	.align 2, 0
_080193F8: .4byte gScriptContext
_080193FC: .4byte gUnknown_03000844
_08019400:
	ldr r0, _08019410 @ =gUnknown_03000844
	movs r1, #0
	bl sub_801208C
_08019408:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08019410: .4byte gUnknown_03000844

	thumb_func_start sub_8019414
sub_8019414: @ 0x08019414
	push {lr}
	ldr r0, _0801942C @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	cmp r2, #0
	beq _08019430
	movs r0, #1
	bl sub_8016E74
	b _08019436
	.align 2, 0
_0801942C: .4byte gScriptContext
_08019430:
	movs r0, #2
	bl sub_8016E74
_08019436:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_801943C
sub_801943C: @ 0x0801943C
	push {r4, lr}
	ldr r1, _08019480 @ =gScriptContext
	ldr r3, _08019484 @ =gMain
	ldr r4, _08019488 @ =gUnknown_03002D28
	ldr r0, [r1]
	ldrh r2, [r0]
	adds r0, #2
	str r0, [r1]
	adds r1, r3, #0
	adds r1, #0xa0
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1]
	ldr r0, [r3, #8]
	str r0, [r3, #0xc]
	cmp r2, #0
	beq _080194A8
	ldr r1, _0801948C @ =0x040000D4
	ldr r0, _08019490 @ =gGfxGuilty1
	str r0, [r1]
	ldr r0, _08019494 @ =0x06013400
	str r0, [r1, #4]
	ldr r0, _08019498 @ =0x80000800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801949C @ =gPalGuilty
	str r0, [r1]
	ldr r0, _080194A0 @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _080194A4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #9
	b _080194D4
	.align 2, 0
_08019480: .4byte gScriptContext
_08019484: .4byte gMain
_08019488: .4byte gUnknown_03002D28
_0801948C: .4byte 0x040000D4
_08019490: .4byte gGfxGuilty1
_08019494: .4byte 0x06013400
_08019498: .4byte 0x80000800
_0801949C: .4byte gPalGuilty
_080194A0: .4byte 0x050002A0
_080194A4: .4byte 0x80000010
_080194A8:
	ldr r1, _080194F0 @ =0x040000D4
	ldr r0, _080194F4 @ =gGfxNotGuilty1
	str r0, [r1]
	ldr r0, _080194F8 @ =0x06013400
	str r0, [r1, #4]
	ldr r2, _080194FC @ =0x80000400
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08019500 @ =gGfxGuiltyNotGuilty2
	str r0, [r1]
	ldr r0, _08019504 @ =0x06013C00
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08019508 @ =gPalNotGuilty
	str r0, [r1]
	ldr r0, _0801950C @ =0x050002A0
	str r0, [r1, #4]
	ldr r0, _08019510 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08019514 @ =0x01000009
_080194D4:
	str r0, [r3, #8]
	ldr r0, _08019518 @ =0x000003EF
	strh r0, [r4]
	ldr r0, _0801951C @ =0x0000C1EF
	strh r0, [r4, #2]
	ldr r0, _08019520 @ =0x000051A0
	strh r0, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #8]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080194F0: .4byte 0x040000D4
_080194F4: .4byte gGfxNotGuilty1
_080194F8: .4byte 0x06013400
_080194FC: .4byte 0x80000400
_08019500: .4byte gGfxGuiltyNotGuilty2
_08019504: .4byte 0x06013C00
_08019508: .4byte gPalNotGuilty
_0801950C: .4byte 0x050002A0
_08019510: .4byte 0x80000010
_08019514: .4byte 0x01000009
_08019518: .4byte 0x000003EF
_0801951C: .4byte 0x0000C1EF
_08019520: .4byte 0x000051A0

	thumb_func_start sub_8019524
sub_8019524: @ 0x08019524
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08019554 @ =gScriptContext
	ldr r2, _08019558 @ =gMain
	ldr r0, [r1]
	ldrh r3, [r0]
	mov r8, r3
	adds r0, #2
	str r0, [r1]
	movs r3, #0xf
	mov r4, r8
	ands r3, r4
	cmp r3, #4
	bhi _08019574
	lsls r0, r3, #2
	ldr r1, _0801955C @ =_08019560
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019554: .4byte gScriptContext
_08019558: .4byte gMain
_0801955C: .4byte _08019560
_08019560: @ jump table
	.4byte _08019574 @ case 0
	.4byte _080195B4 @ case 1
	.4byte _08019586 @ case 2
	.4byte _08019598 @ case 3
	.4byte _080195B4 @ case 4
_08019574:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xe
	strb r0, [r1]
	movs r7, #0
	mov sl, r7
	movs r0, #0x20
	mov sb, r0
	b _080195C4
_08019586:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xf2
	strb r0, [r1]
	movs r0, #0
	mov sl, r0
	movs r4, #0x20
	mov sb, r4
	b _080195C4
_08019598:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xe
	strb r0, [r1]
	ldr r7, _080195AC @ =gUnknown_08206BF0
	mov sl, r7
	ldr r0, _080195B0 @ =gUnknown_08206C10
	mov sb, r0
	b _080195C4
	.align 2, 0
_080195AC: .4byte gUnknown_08206BF0
_080195B0: .4byte gUnknown_08206C10
_080195B4:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0xf2
	strb r0, [r1]
	movs r4, #0
	mov sl, r4
	movs r7, #0x20
	mov sb, r7
_080195C4:
	movs r0, #0x10
	mov r4, r8
	ands r0, r4
	cmp r0, #0
	bne _080195E0
	movs r5, #0
	adds r0, r2, #0
	adds r0, #0x3d
	movs r1, #2
	ldrb r7, [r0]
	orrs r1, r7
	strb r1, [r0]
	str r0, [sp]
	b _08019634
_080195E0:
	movs r0, #0
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x3d
	subs r0, #3
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	str r1, [sp]
	cmp r3, #4
	bhi _08019622
	lsls r0, r3, #2
	ldr r1, _08019600 @ =_08019604
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019600: .4byte _08019604
_08019604: @ jump table
	.4byte _0801961E @ case 0
	.4byte _08019618 @ case 1
	.4byte _08019618 @ case 2
	.4byte _0801961E @ case 3
	.4byte _08019618 @ case 4
_08019618:
	movs r5, #0x28
	rsbs r5, r5, #0
	b _08019624
_0801961E:
	movs r5, #0x30
	b _08019624
_08019622:
	movs r5, #0
_08019624:
	ldr r0, _080196E0 @ =gUnknown_03000844
	movs r3, #0x10
	ldrsh r1, [r0, r3]
	subs r1, r1, r5
	movs r4, #0x12
	ldrsh r2, [r0, r4]
	bl sub_8011E7C
_08019634:
	ldr r7, _080196E4 @ =gIORegisters
	mov ip, r7
	ldr r2, _080196E8 @ =0x0000E080
	ldr r1, _080196EC @ =gUnknown_03000000
	movs r0, #0x80
	lsls r0, r0, #3
_08019640:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bne _08019640
	movs r0, #0
	ldr r6, _080196EC @ =gUnknown_03000000
_0801964E:
	movs r2, #0
	adds r4, r0, #1
	lsls r3, r0, #5
_08019654:
	adds r0, r5, #0
	cmp r0, #0
	bge _0801965C
	adds r0, #7
_0801965C:
	asrs r0, r0, #3
	subs r0, r2, r0
	cmp r0, #0x1e
	bhi _08019674
	adds r0, #1
	adds r0, r3, r0
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r7, sb
	ldrh r1, [r7]
	adds r1, #0x80
	strh r1, [r0]
_08019674:
	adds r2, #1
	movs r0, #2
	add sb, r0
	cmp r2, #0x1d
	ble _08019654
	adds r0, r4, #0
	cmp r0, #0x13
	ble _0801964E
	movs r1, #0x9a
	lsls r1, r1, #3
	add sl, r1
	ldr r1, _080196F0 @ =0x040000D4
	mov r2, sl
	str r2, [r1]
	ldr r0, _080196F4 @ =gUnknown_0203B500
	str r0, [r1, #4]
	ldr r0, _080196F8 @ =0x80002580
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, ip
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r4, [r1]
	orrs r0, r4
	strh r0, [r1]
	ldr r0, _080196FC @ =0x00001E0A
	mov r7, ip
	strh r0, [r7, #4]
	movs r0, #0x20
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	beq _080196C2
	ldr r0, _08019700 @ =0x0000F7FF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
_080196C2:
	movs r0, #4
	ldr r4, [sp]
	ldrb r4, [r4]
	orrs r0, r4
	ldr r7, [sp]
	strb r0, [r7]
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080196E0: .4byte gUnknown_03000844
_080196E4: .4byte gIORegisters
_080196E8: .4byte 0x0000E080
_080196EC: .4byte gUnknown_03000000
_080196F0: .4byte 0x040000D4
_080196F4: .4byte gUnknown_0203B500
_080196F8: .4byte 0x80002580
_080196FC: .4byte 0x00001E0A
_08019700: .4byte 0x0000F7FF

	thumb_func_start sub_8019704
sub_8019704: @ 0x08019704
	push {r4, lr}
	sub sp, #4
	ldr r4, _0801973C @ =gScriptContext
	movs r3, #0
_0801970C:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _0801970C
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	bl sub_80115D4
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801973C: .4byte gScriptContext

	thumb_func_start sub_8019740
sub_8019740: @ 0x08019740
	ldr r0, _08019750 @ =gMain
	movs r1, #0
	strb r1, [r0, #0x18]
	strb r1, [r0, #0x19]
	movs r1, #1
	str r1, [r0, #8]
	movs r0, #0
	bx lr
	.align 2, 0
_08019750: .4byte gMain

	thumb_func_start sub_8019754
sub_8019754: @ 0x08019754
	ldr r1, _08019764 @ =gMain
	adds r1, #0x3e
	ldrb r2, [r1]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_08019764: .4byte gMain

	thumb_func_start sub_8019768
sub_8019768: @ 0x08019768
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _080197A0 @ =gScriptContext
	ldr r5, _080197A4 @ =gMain
	movs r3, #0
_08019772:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _08019772
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #1
	beq _080197BC
	cmp r0, #1
	bgt _080197A8
	cmp r0, #0
	beq _080197B2
	b _080197E8
	.align 2, 0
_080197A0: .4byte gScriptContext
_080197A4: .4byte gMain
_080197A8:
	cmp r0, #2
	beq _080197C8
	cmp r0, #3
	beq _080197D4
	b _080197E8
_080197B2:
	mov r0, sp
	ldrh r0, [r0, #2]
	bl sub_8016E74
	b _080197E8
_080197BC:
	mov r0, sp
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xb4
	strh r1, [r0]
	b _080197E8
_080197C8:
	mov r0, sp
	ldrh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xaa
	strh r1, [r0]
	b _080197E8
_080197D4:
	adds r1, r5, #0
	adds r1, #0xb4
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa4
	strb r2, [r0]
	bl ResetHPBarHealthToMax
_080197E8:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80197F4
sub_80197F4: @ 0x080197F4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _08019848 @ =gScriptContext
	ldr r2, _0801984C @ =gMain
	mov r1, sp
	ldr r5, [r3]
	ldrh r0, [r5]
	strh r0, [r1]
	mov r0, sp
	ldrh r4, [r5, #2]
	strh r4, [r0, #2]
	ldrh r6, [r3, #0x12]
	ldrb r0, [r3, #0x12]
	cmp r0, #0
	bne _08019850
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r4, [r0]
	mov r0, sp
	ldrh r1, [r0]
	ldrh r0, [r2, #0x34]
	strh r0, [r2, #0x38]
	strh r1, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #1
	movs r4, #0x96
	lsls r4, r4, #2
	adds r0, r2, r4
	strb r1, [r0]
	movs r0, #1
	orrs r0, r6
	strh r0, [r3, #0x12]
	movs r0, #1
	b _08019874
	.align 2, 0
_08019848: .4byte gScriptContext
_0801984C: .4byte gMain
_08019850:
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08019862
	movs r0, #1
	b _08019874
_08019862:
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r6
	strh r0, [r3, #0x12]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x34]
	adds r0, r5, #4
	str r0, [r3]
	movs r0, #0
_08019874:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_801987C
sub_801987C: @ 0x0801987C
	push {r4, r5, lr}
	ldr r5, _080198A0 @ =gScriptContext
	ldr r4, _080198A4 @ =gMain
	ldrh r0, [r4, #0x34]
	bl sub_80051AC
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080198A8
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #1
	strb r0, [r1]
	b _080198AE
	.align 2, 0
_080198A0: .4byte gScriptContext
_080198A4: .4byte gMain
_080198A8:
	adds r0, r4, #0
	adds r0, #0x3e
	strb r1, [r0]
_080198AE:
	ldr r0, [r5]
	ldrh r1, [r0]
	adds r0, #2
	str r0, [r5]
	lsrs r0, r1, #8
	cmp r0, #1
	beq _080198D8
	cmp r0, #1
	bgt _080198C6
	cmp r0, #0
	beq _080198D0
	b _080198EE
_080198C6:
	cmp r0, #2
	beq _080198DE
	cmp r0, #3
	beq _080198E8
	b _080198EE
_080198D0:
	rsbs r1, r1, #0
	adds r0, r4, #0
	adds r0, #0x4c
	b _080198EC
_080198D8:
	adds r0, r4, #0
	adds r0, #0x4c
	b _080198EC
_080198DE:
	rsbs r0, r1, #0
	adds r2, r4, #0
	adds r2, #0x4d
	strb r0, [r2]
	b _080198EE
_080198E8:
	adds r0, r4, #0
	adds r0, #0x4d
_080198EC:
	strb r1, [r0]
_080198EE:
	ldr r1, [r5]
	adds r2, r4, #0
	adds r2, #0x50
	movs r0, #0xf0
	ldrh r1, [r1]
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801990C
sub_801990C: @ 0x0801990C
	push {r4, lr}
	sub sp, #8
	ldr r4, _08019944 @ =gScriptContext
	ldr r1, _08019948 @ =gMain
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _0801994C
	mov r2, sp
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #4]
	bl InitSpecialEffectsWithMosaic
	movs r0, #1
	ldrh r1, [r4, #0x12]
	orrs r0, r1
	strh r0, [r4, #0x12]
	movs r0, #1
	b _08019976
	.align 2, 0
_08019944: .4byte gScriptContext
_08019948: .4byte gMain
_0801994C:
	adds r0, r1, #0
	adds r0, #0x90
	ldrh r1, [r0]
	ldr r0, _08019960 @ =0x0000FFFF
	cmp r1, r0
	beq _08019964
	cmp r1, #0
	beq _08019964
	movs r0, #1
	b _08019976
	.align 2, 0
_08019960: .4byte 0x0000FFFF
_08019964:
	ldr r0, [r4]
	adds r0, #6
	str r0, [r4]
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r1, [r4, #0x12]
	ands r0, r1
	strh r0, [r4, #0x12]
	movs r0, #0
_08019976:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8019980
sub_8019980: @ 0x08019980
	push {r4, lr}
	sub sp, #8
	ldr r4, _080199B4 @ =gScriptContext
	mov r2, sp
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #4]
	bl InitSpecialEffects
	ldr r0, [r4]
	adds r0, #6
	str r0, [r4]
	movs r0, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080199B4: .4byte gScriptContext

	thumb_func_start sub_80199B8
sub_80199B8: @ 0x080199B8
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08019A04 @ =gScriptContext
	movs r3, #0
	ldr r5, _08019A08 @ =gMain
_080199C2:
	lsls r0, r3, #1
	mov r1, sp
	adds r2, r1, r0
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r4]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #1
	bls _080199C2
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, #4
	mov r0, sp
	ldrh r2, [r0, #2]
	movs r0, #0xf
	ands r0, r2
	orrs r1, r0
	ldr r3, _08019A0C @ =0x000002C6
	adds r0, r5, r3
	strb r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, #1
	beq _08019A3A
	cmp r0, #1
	bgt _08019A10
	cmp r0, #0
	beq _08019A16
	b _08019A80
	.align 2, 0
_08019A04: .4byte gScriptContext
_08019A08: .4byte gMain
_08019A0C: .4byte 0x000002C6
_08019A10:
	cmp r0, #2
	beq _08019A5E
	b _08019A80
_08019A16:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08019A2E
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _08019A80
_08019A2E:
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #0
	bl sub_800B898
	b _08019A80
_08019A3A:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08019A52
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08019A80
_08019A52:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800BA40
	b _08019A80
_08019A5E:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08019A76
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
	b _08019A80
_08019A76:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800BA40
_08019A80:
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8019A8C
sub_8019A8C: @ 0x08019A8C
	ldr r0, _08019AA4 @ =gMain
	adds r0, #0x90
	ldrh r1, [r0]
	cmp r1, #0
	beq _08019AA0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08019AA8
_08019AA0:
	movs r0, #0
	b _08019AAA
	.align 2, 0
_08019AA4: .4byte gMain
_08019AA8:
	movs r0, #1
_08019AAA:
	bx lr

	thumb_func_start sub_8019AAC
sub_8019AAC: @ 0x08019AAC
	push {r4, lr}
	ldr r4, _08019AC8 @ =gMain
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #5
	bls _08019ABE
	b _08019BDE
_08019ABE:
	lsls r0, r0, #2
	ldr r1, _08019ACC @ =_08019AD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019AC8: .4byte gMain
_08019ACC: .4byte _08019AD0
_08019AD0: @ jump table
	.4byte _08019AE8 @ case 0
	.4byte _08019AFE @ case 1
	.4byte _08019B44 @ case 2
	.4byte _08019B6C @ case 3
	.4byte _08019BA0 @ case 4
	.4byte _08019BB0 @ case 5
_08019AE8:
	movs r0, #0x55
	bl sub_8012824
	movs r0, #0x53
	bl sub_8011150
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #1
	b _08019BDC
_08019AFE:
	movs r0, #0x55
	bl sub_8011D68
	adds r3, r0, #0
	ldrh r0, [r3, #0x10]
	subs r0, #0xa
	strh r0, [r3, #0x10]
	ldr r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #0x16
	orrs r1, r2
	str r1, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x58
	bgt _08019BDE
	movs r0, #0x58
	strh r0, [r3, #0x10]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #2
	strb r0, [r1]
	ldr r2, _08019B40 @ =0x00000259
	adds r1, r4, r2
	movs r0, #0
	b _08019BDC
	.align 2, 0
_08019B40: .4byte 0x00000259
_08019B44:
	ldr r0, _08019B68 @ =0x00000259
	adds r3, r4, r0
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _08019BDE
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	strb r2, [r3]
	b _08019BDE
	.align 2, 0
_08019B68: .4byte 0x00000259
_08019B6C:
	movs r0, #0x55
	bl sub_8011D68
	adds r3, r0, #0
	ldrh r2, [r3, #0x10]
	subs r2, #0xa
	strh r2, [r3, #0x10]
	ldr r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _08019BDE
	adds r0, r3, #0
	bl sub_8012F7C
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #4
	b _08019BDC
_08019BA0:
	movs r0, #1
	bl sub_8016E74
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #5
	b _08019BDC
_08019BB0:
	bl sub_8016EBC
	cmp r0, #1
	beq _08019BDE
	ldr r1, _08019BE4 @ =gMain
	movs r0, #1
	strb r0, [r1, #0x19]
	ldr r0, _08019BE8 @ =gIORegisters
	adds r0, #0x4a
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0x57
	bl sub_8011150
	movs r0, #0x96
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x63
_08019BDC:
	strb r0, [r1]
_08019BDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019BE4: .4byte gMain
_08019BE8: .4byte gIORegisters

	thumb_func_start sub_8019BEC
sub_8019BEC: @ 0x08019BEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08019C14 @ =gMain
	mov sl, r0
	movs r0, #0x96
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #4
	bls _08019C08
	b _08019E8A
_08019C08:
	lsls r0, r0, #2
	ldr r1, _08019C18 @ =_08019C1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019C14: .4byte gMain
_08019C18: .4byte _08019C1C
_08019C1C: @ jump table
	.4byte _08019C30 @ case 0
	.4byte _08019C40 @ case 1
	.4byte _08019CF4 @ case 2
	.4byte _08019E3C @ case 3
	.4byte _08019E60 @ case 4
_08019C30:
	movs r0, #0x6a
	bl sub_8012824
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #1
	b _08019E88
_08019C40:
	movs r0, #0x6a
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x38
	strh r0, [r2, #0x10]
	movs r0, #0x30
	strh r0, [r2, #0x12]
	movs r1, #0xa0
	add r1, sl
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	ldr r4, _08019CEC @ =gUnknown_08026430
	adds r1, r4, #0
	adds r1, #0x80
	movs r3, #0
	ldrsh r2, [r1, r3]
	mov sb, r2
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl sub_800650C
	ldr r6, _08019CF0 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_800650C
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r3, r8
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_800650C
	strh r0, [r6, #0x16]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl sub_800650C
	strh r0, [r6, #0x1e]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #2
	b _08019E88
	.align 2, 0
_08019CEC: .4byte gUnknown_08026430
_08019CF0: .4byte gOamObjects
_08019CF4:
	mov r7, sl
	adds r7, #0xa0
	ldrh r0, [r7]
	subs r0, #0x10
	strh r0, [r7]
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x11
	cmp r0, r1
	bgt _08019DC0
	ldr r4, _08019DB0 @ =gUnknown_08026430
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl sub_800650C
	ldr r6, _08019DB4 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	movs r1, #0
	ldrsh r0, [r7, r1]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_800650C
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r7, r2]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_800650C
	strh r0, [r6, #0x16]
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl sub_800650C
	strh r0, [r6, #0x1e]
	movs r0, #0x6a
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _08019DB8 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x58
	strh r0, [r2, #0x10]
	movs r0, #0x40
	strh r0, [r2, #0x12]
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	ldr r1, _08019DBC @ =0x00000259
	add r1, sl
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #3
	b _08019E88
	.align 2, 0
_08019DB0: .4byte gUnknown_08026430
_08019DB4: .4byte gOamObjects
_08019DB8: .4byte 0xFFDFFFFF
_08019DBC: .4byte 0x00000259
_08019DC0:
	ldr r4, _08019E34 @ =gUnknown_08026430
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl sub_800650C
	ldr r6, _08019E38 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	movs r1, #0
	ldrsh r0, [r7, r1]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_800650C
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r7, r2]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_800650C
	strh r0, [r6, #0x16]
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl sub_800653C
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl sub_800650C
	strh r0, [r6, #0x1e]
	b _08019E8A
	.align 2, 0
_08019E34: .4byte gUnknown_08026430
_08019E38: .4byte gOamObjects
_08019E3C:
	ldr r2, _08019E5C @ =0x00000259
	add r2, sl
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bls _08019E8A
	movs r0, #0
	strb r0, [r2]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #4
	b _08019E88
	.align 2, 0
_08019E5C: .4byte 0x00000259
_08019E60:
	movs r0, #0x6a
	bl sub_8011D68
	adds r2, r0, #0
	ldrh r0, [r2, #0x12]
	subs r0, #0xa
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08019E8A
	adds r0, r2, #0
	bl sub_8012F7C
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0x63
_08019E88:
	strb r0, [r1]
_08019E8A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8019E98
sub_8019E98: @ 0x08019E98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x88
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x80]
	movs r7, #0
	ldr r6, _08019F3C @ =0x040000D4
_08019EAE:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	ldr r2, _08019F40 @ =gUnknown_03003E50
	adds r1, r0, r2
	ldr r0, _08019F44 @ =0x00000FFF
	ldrh r2, [r1]
	ands r0, r2
	adds r3, r7, #0
	movs r2, #0xf
	ands r3, r2
	lsrs r4, r7, #4
	ands r4, r2
	lsls r0, r0, #7
	ldr r2, _08019F48 @ =gUnknown_0819F694
	adds r0, r0, r2
	ldr r2, [sp, #0x80]
	cmp r2, #0
	bne _08019EDA
	ldrb r2, [r1, #0xa]
	cmp r2, #0
	beq _08019F54
_08019EDA:
	str r0, [r6]
	mov r0, sp
	str r0, [r6, #4]
	ldr r0, _08019F4C @ =0x80000040
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r1, sp
	lsls r0, r2, #1
	adds r0, r0, r2
	movs r5, #0
	lsls r3, r3, #7
	mov r8, r3
	lsls r4, r4, #0xb
	mov ip, r4
	adds r2, r7, #1
	str r2, [sp, #0x84]
	movs r7, #0xf
	mov sl, r7
	movs r2, #0xf0
	mov sb, r2
	lsls r4, r0, #4
_08019F04:
	ldrb r3, [r1]
	adds r2, r3, #0
	mov r7, sl
	ands r2, r7
	mov r7, sb
	ands r3, r7
	cmp r2, #0
	beq _08019F16
	adds r2, r2, r0
_08019F16:
	cmp r3, #0
	beq _08019F1C
	adds r3, r3, r4
_08019F1C:
	orrs r2, r3
	strb r2, [r1]
	adds r1, #1
	adds r5, #1
	cmp r5, #0x7f
	bls _08019F04
	mov r0, sp
	str r0, [r6]
	ldr r0, _08019F50 @ =0x06010000
	add r0, ip
	add r0, r8
	str r0, [r6, #4]
	ldr r2, _08019F4C @ =0x80000040
	str r2, [r6, #8]
	ldr r0, [r6, #8]
	b _08019F6C
	.align 2, 0
_08019F3C: .4byte 0x040000D4
_08019F40: .4byte gUnknown_03003E50
_08019F44: .4byte 0x00000FFF
_08019F48: .4byte gUnknown_0819F694
_08019F4C: .4byte 0x80000040
_08019F50: .4byte 0x06010000
_08019F54:
	str r0, [r6]
	lsls r0, r3, #7
	lsls r1, r4, #0xb
	ldr r2, _08019F84 @ =0x06010000
	adds r1, r1, r2
	adds r0, r0, r1
	str r0, [r6, #4]
	ldr r0, _08019F88 @ =0x80000040
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	adds r2, r7, #1
	str r2, [sp, #0x84]
_08019F6C:
	ldr r7, [sp, #0x84]
	cmp r7, #0x1f
	bls _08019EAE
	add sp, #0x88
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019F84: .4byte 0x06010000
_08019F88: .4byte 0x80000040

	thumb_func_start sub_8019F8C
sub_8019F8C: @ 0x08019F8C
	push {r4, r5, lr}
	movs r4, #0
	ldr r3, _08019FE8 @ =0x040000D4
	ldr r5, _08019FEC @ =gUnknown_08028698
	ldr r2, _08019FF0 @ =gUnknown_03003AF0
_08019F96:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08019FDA
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	str r1, [r3]
	ldr r1, [r2, #0x10]
	str r1, [r3, #4]
	ldrh r0, [r0, #4]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r0, #4
	ldrb r1, [r2, #5]
	ands r0, r1
	cmp r0, #0
	bne _08019FDA
	ldrh r0, [r2, #0xe]
	lsls r1, r0, #3
	ldr r0, _08019FF4 @ =gOamObjects
	adds r1, r1, r0
	ldrh r0, [r2, #8]
	strh r0, [r1]
	ldrh r0, [r2, #0xa]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0xc]
	strh r0, [r1, #4]
_08019FDA:
	adds r2, #0x14
	adds r4, #1
	cmp r4, #7
	bls _08019F96
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019FE8: .4byte 0x040000D4
_08019FEC: .4byte gUnknown_08028698
_08019FF0: .4byte gUnknown_03003AF0
_08019FF4: .4byte gOamObjects

	thumb_func_start sub_8019FF8
sub_8019FF8: @ 0x08019FF8
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _0801A010 @ =gUnknown_03003AF0
_08019FFE:
	ldrb r0, [r2]
	cmp r0, r3
	beq _0801A014
	adds r2, #0x14
	adds r1, #1
	cmp r1, #7
	bls _08019FFE
	movs r0, #0xff
	b _0801A016
	.align 2, 0
_0801A010: .4byte gUnknown_03003AF0
_0801A014:
	adds r0, r1, #0
_0801A016:
	bx lr

	thumb_func_start sub_801A018
sub_801A018: @ 0x0801A018
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0801A048 @ =0x06011800
	ldr r4, _0801A04C @ =gUnknown_08028698
	ldr r1, _0801A050 @ =gUnknown_03003AF0
_0801A022:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801A036
	ldrb r5, [r1]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	adds r3, r0, r3
_0801A036:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #7
	bls _0801A022
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A048: .4byte 0x06011800
_0801A04C: .4byte gUnknown_08028698
_0801A050: .4byte gUnknown_03003AF0

	thumb_func_start sub_801A054
sub_801A054: @ 0x0801A054
	push {r4, lr}
	ldr r3, _0801A0A4 @ =gScriptContext
	ldrh r1, [r3, #0x12]
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0x28
	bne _0801A06E
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	adds r0, #1
	strh r0, [r3, #0x12]
_0801A06E:
	ldr r0, _0801A0A8 @ =gMain
	ldrb r0, [r0, #0x19]
	cmp r0, #1
	bne _0801A09E
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A09E
	ldr r2, _0801A0AC @ =gUnknown_03002080
	ldr r1, _0801A0B0 @ =gUnknown_08028736
	adds r0, r4, #0
	ldrh r3, [r3, #0x12]
	ands r0, r3
	lsrs r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, _0801A0B4 @ =0x000004DC
	adds r1, r2, r3
	strh r0, [r1]
	adds r0, #1
	ldr r1, _0801A0B8 @ =0x000004DE
	adds r2, r2, r1
	strh r0, [r2]
_0801A09E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A0A4: .4byte gScriptContext
_0801A0A8: .4byte gMain
_0801A0AC: .4byte gUnknown_03002080
_0801A0B0: .4byte gUnknown_08028736
_0801A0B4: .4byte 0x000004DC
_0801A0B8: .4byte 0x000004DE
