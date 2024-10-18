	.include "asm/macros.inc"
	.syntax unified

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
	bl FadeInBGM
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
	bl PlaySE
	b _08018D84
	.align 2, 0
_08018D78: .4byte gScriptContext
_08018D7C:
	mov r0, sp
	ldrh r0, [r0]
	bl StopSE
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
	bl PlayBGM
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
	bl SetCourtScrollPersonAnim
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
	bl PlayPersonAnimation
	ldr r0, _08019190 @ =gInvestigation
	movs r1, #1
	strb r1, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
	b _080191AC
	.align 2, 0
_08019188: .4byte gScriptContext
_0801918C: .4byte gMain
_08019190: .4byte gInvestigation
_08019194:
	movs r0, #0
	bl sub_8016FEC
	ldr r0, _080191B8 @ =gAnimation+0x44
	bl DestroyAnimation
	ldr r0, _080191BC @ =gInvestigation
	movs r1, #0
	strb r1, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
_080191AC:
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080191B8: .4byte gAnimation+0x44
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
	ldr r1, _08019224 @ =gBG2MapBuffer
	adds r3, r0, #0
	ldr r4, _08019228 @ =gAnimation+0x44
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
	bl DestroyAnimation
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
_08019224: .4byte gBG2MapBuffer
_08019228: .4byte gAnimation+0x44

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
	bl FadeOutBGM
	b _08019268
	.align 2, 0
_08019260: .4byte gScriptContext
_08019264:
	bl StopBGM
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
	bl UnpauseBGM
	b _080192AC
	.align 2, 0
_080192A4: .4byte gScriptContext
_080192A8:
	bl PauseBGM
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
	bl PlayAnimation
	b _08019394
	.align 2, 0
_08019384: .4byte gScriptContext
_08019388:
	mov r0, sp
	ldrh r0, [r0]
	bl FindAnimationFromAnimId
	bl DestroyAnimation
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
	ldr r0, _080193FC @ =gAnimation+0x44
	movs r1, #1
	bl sub_801208C
	b _08019408
	.align 2, 0
_080193F8: .4byte gScriptContext
_080193FC: .4byte gAnimation+0x44
_08019400:
	ldr r0, _08019410 @ =gAnimation+0x44
	movs r1, #0
	bl sub_801208C
_08019408:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08019410: .4byte gAnimation+0x44

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
	ldr r4, _08019488 @ =gOamObjects+0x188
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
_08019488: .4byte gOamObjects+0x188
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
	ldr r0, _080196E0 @ =gAnimation+0x44
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
	ldr r1, _080196EC @ =gBG2MapBuffer
	movs r0, #0x80
	lsls r0, r0, #3
_08019640:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bne _08019640
	movs r0, #0
	ldr r6, _080196EC @ =gBG2MapBuffer
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
_080196E0: .4byte gAnimation+0x44
_080196E4: .4byte gIORegisters
_080196E8: .4byte 0x0000E080
_080196EC: .4byte gBG2MapBuffer
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
	bl SetBGMVolume
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
	bl LoadCounselBenchGraphics
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
	bl LoadCounselBenchGraphics
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
	bl PlayAnimation
	movs r0, #0x53
	bl PlaySE
	movs r2, #0x96
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #1
	b _08019BDC
_08019AFE:
	movs r0, #0x55
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl DestroyAnimation
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
	bl IsHPBarAnimating
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
	bl PlaySE
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
	bl PlayAnimation
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #1
	b _08019E88
_08019C40:
	movs r0, #0x6a
	bl FindAnimationFromAnimId
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
	ldr r4, _08019CEC @ =gSineTable
	adds r1, r4, #0
	adds r1, #0x80
	movs r3, #0
	ldrsh r2, [r1, r3]
	mov sb, r2
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl fix_mul
	ldr r6, _08019CF0 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r3, r8
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
	strh r0, [r6, #0x16]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, sb
	bl fix_mul
	strh r0, [r6, #0x1e]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, sl
	movs r0, #2
	b _08019E88
	.align 2, 0
_08019CEC: .4byte gSineTable
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
	ldr r4, _08019DB0 @ =gSineTable
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	ldr r6, _08019DB4 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	movs r1, #0
	ldrsh r0, [r7, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r7, r2]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
	strh r0, [r6, #0x16]
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	strh r0, [r6, #0x1e]
	movs r0, #0x6a
	bl FindAnimationFromAnimId
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
_08019DB0: .4byte gSineTable
_08019DB4: .4byte gOamObjects
_08019DB8: .4byte 0xFFDFFFFF
_08019DBC: .4byte 0x00000259
_08019DC0:
	ldr r4, _08019E34 @ =gSineTable
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	ldr r6, _08019E38 @ =gOamObjects
	strh r0, [r6, #6]
	movs r0, #0
	ldrsh r5, [r4, r0]
	movs r1, #0
	ldrsh r0, [r7, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r6, #0xe]
	ldrh r4, [r4]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r7, r2]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
	strh r0, [r6, #0x16]
	movs r3, #0
	ldrsh r0, [r7, r3]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl fix_mul
	strh r0, [r6, #0x1e]
	b _08019E8A
	.align 2, 0
_08019E34: .4byte gSineTable
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
	bl FindAnimationFromAnimId
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
	bl DestroyAnimation
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
	ldr r2, _08019F40 @ =gTextBoxCharacters
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
	ldr r2, _08019F48 @ =gCharSet
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
_08019F40: .4byte gTextBoxCharacters
_08019F44: .4byte 0x00000FFF
_08019F48: .4byte gCharSet
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

	thumb_func_start MakeMapMarkerSprites
MakeMapMarkerSprites: @ 0x08019F8C
	push {r4, r5, lr}
	movs r4, #0
	ldr r3, _08019FE8 @ =0x040000D4
	ldr r5, _08019FEC @ =gMapMarkerSprites
	ldr r2, _08019FF0 @ =gMapMarker
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
_08019FEC: .4byte gMapMarkerSprites
_08019FF0: .4byte gMapMarker
_08019FF4: .4byte gOamObjects

	thumb_func_start sub_8019FF8
sub_8019FF8: @ 0x08019FF8
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _0801A010 @ =gMapMarker
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
_0801A010: .4byte gMapMarker
_0801A014:
	adds r0, r1, #0
_0801A016:
	bx lr

	thumb_func_start sub_801A018
sub_801A018: @ 0x0801A018
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0801A048 @ =0x06011800
	ldr r4, _0801A04C @ =gMapMarkerSprites
	ldr r1, _0801A050 @ =gMapMarker
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
_0801A04C: .4byte gMapMarkerSprites
_0801A050: .4byte gMapMarker

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
	ldr r2, _0801A0AC @ =gBG1MapBuffer
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
_0801A0AC: .4byte gBG1MapBuffer
_0801A0B0: .4byte gUnknown_08028736
_0801A0B4: .4byte 0x000004DC
_0801A0B8: .4byte 0x000004DE

	thumb_func_start sub_801A0BC
sub_801A0BC: @ 0x0801A0BC
	push {r4, r5, lr}
	ldr r0, _0801A0F0 @ =gScriptContext
	adds r0, #0x25
	movs r1, #0
	strb r1, [r0]
	movs r2, #0
	ldr r3, _0801A0F4 @ =gTextBoxCharacters
	ldr r4, _0801A0F8 @ =0x00003FFF
_0801A0CC:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r4, #0
	ldrh r5, [r0]
	ands r1, r5
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _0801A0CC
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A0F0: .4byte gScriptContext
_0801A0F4: .4byte gTextBoxCharacters
_0801A0F8: .4byte 0x00003FFF

	thumb_func_start sub_801A0FC
sub_801A0FC: @ 0x0801A0FC
	push {r4, lr}
	ldr r1, _0801A144 @ =gScriptContext
	adds r0, r1, #0
	adds r0, #0x28
	movs r4, #0
	strb r4, [r0]
	adds r2, r1, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r3, r1, #0
	adds r3, #0x22
	ldrb r2, [r3]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801A12C
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r3]
	adds r0, r1, #0
	adds r0, #0x25
	strb r4, [r0]
_0801A12C:
	movs r0, #0xf
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0
	beq _0801A13A
	bl sub_8017BC0
_0801A13A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801A144: .4byte gScriptContext

	thumb_func_start sub_801A148 @ this looks like its Command17 ???
sub_801A148: @ 0x0801A148
	push {r4, r5, lr}
	ldr r5, _0801A184 @ =0x00003FFF
	ands r5, r0
	movs r4, #0x80
	lsls r4, r4, #8
	ands r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_801090C
	adds r2, r0, #0
	cmp r2, #0
	bge _0801A19C
	adds r0, r4, #0
	bl sub_8010954
	adds r2, r0, #0
	cmp r2, #0
	blt _0801A19C
	cmp r4, #0
	beq _0801A18C
	ldr r0, _0801A188 @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x3c
	adds r1, r2, r1
	strb r5, [r1]
	ldrb r1, [r0, #0x11]
	adds r1, #1
	strb r1, [r0, #0x11]
	b _0801A19C
	.align 2, 0
_0801A184: .4byte 0x00003FFF
_0801A188: .4byte gCourtRecord
_0801A18C:
	ldr r0, _0801A1A4 @ =gCourtRecord
	adds r1, r0, #0
	adds r1, #0x1c
	adds r1, r2, r1
	strb r5, [r1]
	ldrb r1, [r0, #0x10]
	adds r1, #1
	strb r1, [r0, #0x10]
_0801A19C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A1A4: .4byte gCourtRecord

	thumb_func_start sub_801A1A8
sub_801A1A8: @ 0x0801A1A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0801A1F8 @ =gScriptContext
	movs r0, #1
	ldrh r1, [r5, #0x1c]
	orrs r0, r1
	strh r0, [r5, #0x1c]
	ldr r0, _0801A1FC @ =gMain
	adds r1, r0, #0
	ldrb r2, [r1, #9]
	cmp r2, #1
	beq _0801A1D0
	ldrb r0, [r1, #8]
	cmp r0, #5
	bne _0801A1CA
	b _0801A48C
_0801A1CA:
	cmp r0, #6
	bne _0801A1D0
	b _0801A48C
_0801A1D0:
	ldrb r0, [r1, #8]
	cmp r0, #7
	bne _0801A1D8
	b _0801A48C
_0801A1D8:
	cmp r0, #8
	bne _0801A1DE
	b _0801A48C
_0801A1DE:
	ldrh r2, [r5, #0x12]
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	bne _0801A204
	ldr r0, _0801A200 @ =gAnimation+0x44
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
	ldrh r0, [r5, #0x12]
	adds r0, #1
	strh r0, [r5, #0x12]
	b _0801A48C
	.align 2, 0
_0801A1F8: .4byte gScriptContext
_0801A1FC: .4byte gMain
_0801A200: .4byte gAnimation+0x44
_0801A204:
	adds r0, r2, #1
	strh r0, [r5, #0x12]
	bl sub_801A054
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r7, [r5, #0x12]
	ands r0, r7
	cmp r0, #0
	beq _0801A260
	ldr r1, _0801A248 @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _0801A226
	b _0801A48C
_0801A226:
	ldr r1, _0801A24C @ =0x040000D4
	ldr r0, _0801A250 @ =gUnknown_02000DD4
	str r0, [r1]
	ldr r0, _0801A254 @ =gTextBoxCharacters
	str r0, [r1, #4]
	ldr r0, _0801A258 @ =0x80000180
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	bl sub_8019E98
	ldr r0, _0801A25C @ =0x00007FFF
	ldrh r1, [r5, #0x12]
	ands r0, r1
	strh r0, [r5, #0x12]
	b _0801A48C
	.align 2, 0
_0801A248: .4byte gJoypad
_0801A24C: .4byte 0x040000D4
_0801A250: .4byte gUnknown_02000DD4
_0801A254: .4byte gTextBoxCharacters
_0801A258: .4byte 0x80000180
_0801A25C: .4byte 0x00007FFF
_0801A260:
	ldr r2, _0801A324 @ =0x0000DFFF
	ldrh r7, [r5, #0x1c]
	ands r2, r7
	strh r2, [r5, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0801A288
	ldr r1, _0801A328 @ =gJoypad
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A288
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r2, r0
	strh r2, [r5, #0x1c]
_0801A288:
	ldrh r1, [r5, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _0801A29E
	ldrb r7, [r5, #0x12]
	cmp r7, #7
	bhi _0801A29E
	b _0801A48C
_0801A29E:
	ldr r1, _0801A328 @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _0801A2B6
	movs r0, #0xc0
	lsls r0, r0, #7
	ands r0, r2
	cmp r0, #0
	bne _0801A2B6
	b _0801A48C
_0801A2B6:
	ldr r1, _0801A32C @ =0x040000D4
	ldr r0, _0801A330 @ =gTextBoxCharacters
	str r0, [r1]
	ldr r0, _0801A334 @ =gUnknown_03007180
	str r0, [r1, #4]
	ldr r0, _0801A338 @ =0x80000180
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	movs r0, #2
	strh r0, [r5, #0x16]
	ldr r0, _0801A324 @ =0x0000DFFF
	ldrh r1, [r5, #0x1c]
	ands r0, r1
	ldr r1, _0801A33C @ =0x0000BFFF
	ands r0, r1
	strh r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x22
	ldrb r2, [r1]
	movs r0, #0x20
	ands r0, r2
	mov r8, r1
	cmp r0, #0
	beq _0801A2F4
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1]
	adds r1, #3
	movs r0, #0
	strb r0, [r1]
_0801A2F4:
	ldr r0, _0801A340 @ =0x0000FFFE
	ldrh r2, [r5, #0x1c]
	ands r0, r2
	ldr r1, _0801A344 @ =0x0000FFF7
	ands r0, r1
	strh r0, [r5, #0x1c]
	movs r0, #0x2f
	bl PlaySE
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A354
	ldr r0, _0801A348 @ =gBG1MapBuffer
	ldr r7, _0801A34C @ =0x000004DC
	adds r1, r0, r7
	movs r2, #9
	strh r2, [r1]
	ldr r1, _0801A350 @ =0x000004DE
	adds r0, r0, r1
	strh r2, [r0]
	b _0801A362
	.align 2, 0
_0801A324: .4byte 0x0000DFFF
_0801A328: .4byte gJoypad
_0801A32C: .4byte 0x040000D4
_0801A330: .4byte gTextBoxCharacters
_0801A334: .4byte gUnknown_03007180
_0801A338: .4byte 0x80000180
_0801A33C: .4byte 0x0000BFFF
_0801A340: .4byte 0x0000FFFE
_0801A344: .4byte 0x0000FFF7
_0801A348: .4byte gBG1MapBuffer
_0801A34C: .4byte 0x000004DC
_0801A350: .4byte 0x000004DE
_0801A354:
	ldr r0, _0801A374 @ =gBG1MapBuffer
	ldr r2, _0801A378 @ =0x000004DC
	adds r1, r0, r2
	strh r4, [r1]
	ldr r7, _0801A37C @ =0x000004DE
	adds r0, r0, r7
	strh r4, [r0]
_0801A362:
	ldrh r0, [r5, #8]
	cmp r0, #0xa
	bne _0801A380
	ldr r0, [r5]
	ldrh r0, [r0]
	bl ChangeScriptSection
	b _0801A438
	.align 2, 0
_0801A374: .4byte gBG1MapBuffer
_0801A378: .4byte 0x000004DC
_0801A37C: .4byte 0x000004DE
_0801A380:
	cmp r0, #2
	bne _0801A39C
	ldr r0, _0801A394 @ =gAnimation+0x44
	ldr r1, _0801A398 @ =gMain
	adds r1, #0xc4
	ldrh r1, [r1]
	bl sub_8012180
	b _0801A438
	.align 2, 0
_0801A394: .4byte gAnimation+0x44
_0801A398: .4byte gMain
_0801A39C:
	cmp r0, #7
	bne _0801A438
	ldr r4, _0801A3D4 @ =gMain
	movs r0, #0
	strb r0, [r4, #0x19]
	bl sub_8016D6C
	movs r0, #4
	movs r1, #0
	ldrh r2, [r5, #0x1c]
	orrs r0, r2
	strh r0, [r5, #0x1c]
	adds r0, r5, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r4, #8]
	cmp r4, #4
	beq _0801A3D8
	movs r0, #1
	bl sub_8017154
	b _0801A3DE
	.align 2, 0
_0801A3D4: .4byte gMain
_0801A3D8:
	movs r0, #4
	bl sub_8017154
_0801A3DE:
	ldr r1, _0801A424 @ =0x040000D4
	ldr r0, _0801A428 @ =gUnknown_081A6794
	str r0, [r1]
	ldr r0, _0801A42C @ =0x06011F80
	str r0, [r1, #4]
	ldr r0, _0801A430 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xf
	mov r7, r8
	ldrb r7, [r7]
	ands r0, r7
	cmp r0, #0
	beq _0801A3FE
	bl sub_8017BC0
_0801A3FE:
	movs r2, #0
	ldr r3, _0801A434 @ =gTextBoxCharacters
_0801A402:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0, #6]
	adds r1, #0x12
	strh r1, [r0, #6]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x3f
	bls _0801A402
	movs r0, #1
	bl sub_80051CC
	b _0801A486
	.align 2, 0
_0801A424: .4byte 0x040000D4
_0801A428: .4byte gUnknown_081A6794
_0801A42C: .4byte 0x06011F80
_0801A430: .4byte 0x80000040
_0801A434: .4byte gTextBoxCharacters
_0801A438:
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r1, [r5, #0x12]
	ands r0, r1
	strh r0, [r5, #0x12]
	movs r2, #0
	adds r3, r5, #0
	adds r3, #0x28
	adds r4, r5, #0
	adds r4, #0x29
	ldr r6, _0801A498 @ =gTextBoxCharacters
	ldr r7, _0801A49C @ =0x00003FFF
	mov ip, r7
_0801A452:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r1, ip
	ldrh r7, [r0]
	ands r1, r7
	strh r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x3f
	bls _0801A452
	movs r0, #0
	strb r0, [r3]
	strb r0, [r4]
	movs r0, #0xf
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A486
	bl sub_8017BA8
	bl sub_8017BC0
_0801A486:
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
_0801A48C:
	movs r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801A498: .4byte gTextBoxCharacters
_0801A49C: .4byte 0x00003FFF

	thumb_func_start sub_801A4A0
sub_801A4A0: @ 0x0801A4A0
	ldr r0, _0801A4B4 @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r3, r0, #0
	adds r3, #0x25
	strb r2, [r3]
	adds r1, #2
	str r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0801A4B4: .4byte gScriptContext

	thumb_func_start sub_801A4B8
sub_801A4B8: @ 0x0801A4B8
	ldr r0, _0801A4D0 @ =gScriptContext
	ldr r1, _0801A4D4 @ =gJoypad
	ldr r0, [r0]
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	cmp r0, #0
	bne _0801A4D8
	movs r0, #1
	b _0801A4DA
	.align 2, 0
_0801A4D0: .4byte gScriptContext
_0801A4D4: .4byte gJoypad
_0801A4D8:
	movs r0, #0
_0801A4DA:
	bx lr

	thumb_func_start sub_801A4DC
sub_801A4DC: @ 0x0801A4DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0801A530 @ =gScriptContext
	movs r0, #4
	ldrh r1, [r4, #0x1c]
	orrs r0, r1
	movs r3, #1
	movs r2, #0
	orrs r0, r3
	strh r0, [r4, #0x1c]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A502
	b _0801A796
_0801A502:
	ldr r0, _0801A534 @ =gMain
	ldrb r0, [r0, #8]
	cmp r0, #7
	bne _0801A50C
	b _0801A796
_0801A50C:
	ldrh r1, [r4, #0x12]
	movs r5, #0xff
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0801A538
	adds r0, r1, #0
	orrs r0, r3
	strh r0, [r4, #0x12]
	bl sub_8016ED8
	cmp r0, #0
	bne _0801A528
	b _0801A796
_0801A528:
	movs r0, #7
	bl sub_8016E74
	b _0801A796
	.align 2, 0
_0801A530: .4byte gScriptContext
_0801A534: .4byte gMain
_0801A538:
	ldr r1, _0801A56C @ =gJoypad
	movs r0, #0x40
	ldrh r2, [r1, #2]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _0801A58A
	movs r0, #0x2a
	bl PlaySE
	ldrh r1, [r4, #0x12]
	subs r1, #1
	strh r1, [r4, #0x12]
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _0801A57A
	ldrh r7, [r4, #8]
	cmp r7, #8
	bne _0801A570
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	adds r0, r1, #2
	b _0801A578
	.align 2, 0
_0801A56C: .4byte gJoypad
_0801A570:
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	adds r0, r1, #3
_0801A578:
	strh r0, [r4, #0x12]
_0801A57A:
	ldr r0, _0801A5B0 @ =gOamObjects
	movs r1, #0xe6
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	ldr r6, _0801A5B4 @ =gJoypad
_0801A58A:
	movs r0, #0x80
	ldrh r2, [r6, #2]
	ands r0, r2
	cmp r0, #0
	beq _0801A5CA
	movs r0, #0x2a
	bl PlaySE
	ldrh r1, [r4, #0x12]
	adds r1, #1
	strh r1, [r4, #0x12]
	ldrh r7, [r4, #8]
	cmp r7, #8
	bne _0801A5B8
	movs r0, #0xff
	ands r0, r1
	cmp r0, #3
	bne _0801A5CA
	b _0801A5C0
	.align 2, 0
_0801A5B0: .4byte gOamObjects
_0801A5B4: .4byte gJoypad
_0801A5B8:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #4
	bne _0801A5CA
_0801A5C0:
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	adds r0, r1, #1
	strh r0, [r4, #0x12]
_0801A5CA:
	movs r0, #1
	ldrh r6, [r6, #2]
	ands r0, r6
	cmp r0, #0
	bne _0801A5D6
	b _0801A754
_0801A5D6:
	movs r0, #0x2b
	bl PlaySE
	bl sub_8016D6C
	ldr r0, _0801A6F4 @ =0x0000FFFB
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	ldr r1, _0801A6F8 @ =0x0000FFFE
	ands r0, r1
	ldr r1, _0801A6FC @ =0x0000DFFF
	ands r0, r1
	strh r0, [r4, #0x1c]
	ldr r5, _0801A700 @ =gMain
	ldrb r2, [r5, #8]
	cmp r2, #4
	bne _0801A5FE
	movs r0, #0
	bl sub_8017154
_0801A5FE:
	ldr r0, _0801A704 @ =gAnimation
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0xb
	beq _0801A626
	ldr r7, _0801A708 @ =gOamObjects
	mov ip, r7
	mov r6, ip
	adds r6, #0x10
	movs r1, #0x28
	adds r1, r1, r4
	mov sl, r1
	movs r2, #0x29
	adds r2, r2, r4
	mov sb, r2
	movs r7, #0x22
	adds r7, r7, r4
	mov r8, r7
	cmp r0, #0x21
	bne _0801A660
_0801A626:
	ldr r0, _0801A708 @ =gOamObjects
	mov ip, r0
	mov r6, ip
	adds r6, #0x10
	movs r1, #0x28
	adds r1, r1, r4
	mov sl, r1
	movs r2, #0x29
	adds r2, r2, r4
	mov sb, r2
	movs r7, #0x22
	adds r7, r7, r4
	mov r8, r7
	ldrb r5, [r5, #8]
	cmp r5, #4
	bne _0801A660
	movs r3, #0xc0
	lsls r3, r3, #1
	add r3, ip
	movs r2, #0x20
	movs r1, #0x80
	lsls r1, r1, #2
_0801A652:
	strh r1, [r3]
	adds r3, #8
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x3f
	bls _0801A652
_0801A660:
	movs r2, #0
	adds r3, r6, #0
	ldr r6, _0801A70C @ =gTextBoxCharacters
	movs r5, #0x80
	lsls r5, r5, #2
_0801A66A:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, _0801A710 @ =0x00003FFF
	ldrh r7, [r0]
	ands r1, r7
	strh r1, [r0]
	strh r5, [r3]
	adds r3, #8
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _0801A66A
	movs r2, #0x20
	ldr r3, _0801A714 @ =gOamObjects+0x1D0
	ldr r6, _0801A70C @ =gTextBoxCharacters
	movs r5, #0x80
	lsls r5, r5, #2
_0801A692:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, _0801A710 @ =0x00003FFF
	ldrh r7, [r0]
	ands r1, r7
	strh r1, [r0]
	strh r5, [r3]
	adds r3, #8
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x3f
	bls _0801A692
	movs r2, #0xe4
	lsls r2, r2, #1
	add r2, ip
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	mov r0, sl
	strb r1, [r0]
	mov r2, sb
	strb r1, [r2]
	movs r0, #0xf
	mov r7, r8
	ldrb r7, [r7]
	ands r0, r7
	cmp r0, #0
	beq _0801A6DA
	bl sub_8017BA8
	bl sub_8017BC0
_0801A6DA:
	movs r0, #0
	bl sub_80051CC
	ldr r1, _0801A718 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0801A71C @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	bl MoveSpritesToOAM
	movs r2, #1
	b _0801A72C
	.align 2, 0
_0801A6F4: .4byte 0x0000FFFB
_0801A6F8: .4byte 0x0000FFFE
_0801A6FC: .4byte 0x0000DFFF
_0801A700: .4byte gMain
_0801A704: .4byte gAnimation
_0801A708: .4byte gOamObjects
_0801A70C: .4byte gTextBoxCharacters
_0801A710: .4byte 0x00003FFF
_0801A714: .4byte gOamObjects+0x1D0
_0801A718: .4byte gIORegisters
_0801A71C: .4byte 0x0000FDFF
_0801A720:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0801A72C:
	cmp r2, #9
	bhi _0801A73E
	ldrb r0, [r4, #0x12]
	cmp r0, r2
	bne _0801A720
	ldr r0, [r4]
	ldrh r0, [r0]
	bl ChangeScriptSection
_0801A73E:
	bl sub_8016ED8
	cmp r0, #0
	beq _0801A74C
	movs r0, #8
	bl sub_8016E74
_0801A74C:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	b _0801A796
_0801A754:
	ldrh r7, [r4, #8]
	cmp r7, #8
	bne _0801A762
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	b _0801A76E
_0801A762:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0801A76E:
	ldr r3, _0801A7A8 @ =gOamObjects
	ldrb r4, [r4, #0x12]
	adds r1, r4, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r2, #0xe4
	lsls r2, r2, #1
	adds r1, r3, r2
	strh r0, [r1]
	movs r7, #0xe5
	lsls r7, r7, #1
	adds r1, r3, r7
	ldr r0, _0801A7AC @ =0x00004009
	strh r0, [r1]
	movs r0, #0xe6
	lsls r0, r0, #1
	adds r1, r3, r0
	ldr r0, _0801A7B0 @ =0x000004FC
	strh r0, [r1]
_0801A796:
	movs r0, #1
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801A7A8: .4byte gOamObjects
_0801A7AC: .4byte 0x00004009
_0801A7B0: .4byte 0x000004FC

	thumb_func_start sub_801A7B4
sub_801A7B4: @ 0x0801A7B4
	ldr r1, _0801A7D8 @ =gScriptContext
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0801A7CC
	movs r0, #3
	strb r0, [r2]
_0801A7CC:
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0801A7D8: .4byte gScriptContext

	thumb_func_start sub_801A7DC
sub_801A7DC: @ 0x0801A7DC
	ldr r2, _0801A7F0 @ =gScriptContext
	ldrh r1, [r2, #0x12]
	ldrb r0, [r2, #0x12]
	cmp r0, #0
	bne _0801A7F4
	ldr r0, [r2]
	ldrh r0, [r0]
	orrs r0, r1
	b _0801A7F6
	.align 2, 0
_0801A7F0: .4byte gScriptContext
_0801A7F4:
	subs r0, r1, #1
_0801A7F6:
	strh r0, [r2, #0x12]
	ldrh r3, [r2, #0x1c]
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r0, r1, #0
	ands r0, r3
	cmp r0, r1
	bne _0801A822
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0801A822
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r0, #0x80
	bls _0801A822
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r1, [r2, #0x12]
	ands r0, r1
	strh r0, [r2, #0x12]
_0801A822:
	ldrb r1, [r2, #0x12]
	cmp r1, #0
	bne _0801A834
	ldr r0, [r2]
	adds r0, #2
	str r0, [r2]
	strh r1, [r2, #0xa]
	movs r0, #0
	b _0801A836
_0801A834:
	movs r0, #1
_0801A836:
	bx lr

	thumb_func_start sub_801A838
sub_801A838: @ 0x0801A838
	push {lr}
	ldr r0, _0801A848 @ =gScriptContext
	ldrh r0, [r0, #0xe]
	bl ChangeScriptSection
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801A848: .4byte gScriptContext

	thumb_func_start sub_801A84C
sub_801A84C: @ 0x0801A84C
	push {r4, r5, lr}
	ldr r4, _0801A8B0 @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	adds r5, r4, #0
	adds r5, #0x24
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5]
	cmp r0, #0x15
	bne _0801A87E
	ldr r0, _0801A8B4 @ =gMain
	adds r0, #0xc1
	ldrb r0, [r0]
	cmp r0, #9
	bhi _0801A87E
	movs r0, #0
	movs r1, #0x8d
	bl GetFlag
	cmp r0, #0
	bne _0801A87E
	movs r0, #2
	strb r0, [r5]
_0801A87E:
	ldr r0, _0801A8B4 @ =gMain
	ldrb r0, [r0, #0x19]
	cmp r0, #1
	bne _0801A89C
	bl sub_80053C8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x7f
	ldrb r1, [r1]
	ands r0, r1
	ldr r1, [r4]
	ldrb r1, [r1]
	bl sub_8006130
_0801A89C:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #2
	strh r0, [r4, #0x16]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A8B0: .4byte gScriptContext
_0801A8B4: .4byte gMain

	thumb_func_start sub_801A8B8
sub_801A8B8: @ 0x0801A8B8
	ldr r2, _0801A8DC @ =gScriptContext
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r2, #0x10]
	adds r0, #2
	str r0, [r2]
	cmp r0, #0
	beq _0801A8D0
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_0801A8D0:
	ldr r0, [r2]
	adds r0, #2
	str r0, [r2]
	movs r0, #0
	bx lr
	.align 2, 0
_0801A8DC: .4byte gScriptContext

	thumb_func_start sub_801A8E0
sub_801A8E0: @ 0x0801A8E0
	push {lr}
	ldr r1, _0801A904 @ =gScriptContext
	ldr r0, [r1]
	ldrh r2, [r0]
	adds r0, #2
	str r0, [r1]
	movs r0, #0xfe
	lsls r0, r0, #7
	ands r0, r2
	lsrs r0, r0, #8
	movs r1, #0xff
	ands r1, r2
	lsrs r2, r2, #0xf
	bl ChangeFlag
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801A904: .4byte gScriptContext

	thumb_func_start sub_801A908
sub_801A908: @ 0x0801A908
	push {lr}
	movs r0, #0x31
	bl PlaySE
	ldr r1, _0801A944 @ =gScriptContext
	movs r0, #0x10
	ldrh r2, [r1, #0x1c]
	orrs r0, r2
	strh r0, [r1, #0x1c]
	ldr r1, _0801A948 @ =gMain
	adds r3, r1, #0
	adds r3, #0xe8
	ldr r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r0, r2
	str r0, [r3]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, _0801A94C @ =0x01000007
	str r0, [r1, #8]
	ldr r0, _0801A950 @ =gAnimation+0x44
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801A944: .4byte gScriptContext
_0801A948: .4byte gMain
_0801A94C: .4byte 0x01000007
_0801A950: .4byte gAnimation+0x44

	thumb_func_start sub_801A954
sub_801A954: @ 0x0801A954
	push {r4, lr}
	ldr r4, _0801A9A8 @ =gScriptContext
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _0801A992
	ldr r3, _0801A9AC @ =gMain
	adds r1, r3, #0
	adds r1, #0x99
	movs r0, #3
	strb r0, [r1]
	ldr r2, [r4]
	ldrh r1, [r2]
	adds r0, r3, #0
	adds r0, #0x98
	strb r1, [r0]
	ldrh r1, [r2]
	lsrs r0, r1, #8
	movs r1, #0xf
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x9a
	strb r0, [r1]
	ldrh r2, [r2]
	lsrs r0, r2, #8
	movs r1, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0801A992
	movs r0, #0x33
	bl PlaySE
_0801A992:
	ldrh r1, [r4, #0x12]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0801A9B0
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	b _0801A9B6
	.align 2, 0
_0801A9A8: .4byte gScriptContext
_0801A9AC: .4byte gMain
_0801A9B0:
	adds r0, r1, #1
	strh r0, [r4, #0x12]
	movs r0, #1
_0801A9B6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_801A9BC
sub_801A9BC: @ 0x0801A9BC
	push {r4, lr}
	ldr r4, _0801A9F8 @ =gScriptContext
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _0801A9E8
	ldr r0, _0801A9FC @ =gMain
	adds r0, #0x99
	movs r1, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	ldr r0, _0801AA00 @ =0x00007530
	ldrh r1, [r1]
	cmp r1, r0
	bne _0801A9E2
	ldr r1, [r4, #0x48]
	ldr r0, _0801AA04 @ =0x75307530
	cmp r1, r0
	beq _0801A9E8
_0801A9E2:
	movs r0, #0x33
	bl PlaySE
_0801A9E8:
	ldrh r1, [r4, #0x12]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0801AA08
	movs r0, #0
	b _0801AA0E
	.align 2, 0
_0801A9F8: .4byte gScriptContext
_0801A9FC: .4byte gMain
_0801AA00: .4byte 0x00007530
_0801AA04: .4byte 0x75307530
_0801AA08:
	adds r0, r1, #1
	strh r0, [r4, #0x12]
	movs r0, #1
_0801AA0E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_801AA14
sub_801AA14: @ 0x0801AA14
	push {r4, lr}
	ldr r4, _0801AA58 @ =gScriptContext
	ldrh r1, [r4, #0x12]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0801AA26
	adds r0, r1, #1
	strh r0, [r4, #0x12]
_0801AA26:
	movs r0, #8
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	cmp r0, #0
	bne _0801AA4E
	ldrh r0, [r4, #8]
	cmp r0, #0x15
	bne _0801AA42
	ldr r0, _0801AA5C @ =gAnimation+0x44
	ldr r1, _0801AA60 @ =gMain
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
_0801AA42:
	ldr r0, _0801AA64 @ =0x0000DFFF
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r4, #0x1c]
_0801AA4E:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801AA58: .4byte gScriptContext
_0801AA5C: .4byte gAnimation+0x44
_0801AA60: .4byte gMain
_0801AA64: .4byte 0x0000DFFF

	thumb_func_start sub_801AA68
sub_801AA68: @ 0x0801AA68
	push {r4, r5, r6, r7, lr}
	ldr r7, _0801AA80 @ =gScriptContext
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r0, #6
	bls _0801AA76
	b _0801AC9C
_0801AA76:
	lsls r0, r0, #2
	ldr r1, _0801AA84 @ =_0801AA88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801AA80: .4byte gScriptContext
_0801AA84: .4byte _0801AA88
_0801AA88: @ jump table
	.4byte _0801AAA4 @ case 0
	.4byte _0801AB18 @ case 1
	.4byte _0801AB4C @ case 2
	.4byte _0801AB7C @ case 3
	.4byte _0801AC62 @ case 4
	.4byte _0801AC84 @ case 5
	.4byte _0801AC08 @ case 6
_0801AAA4:
	ldr r4, _0801AAFC @ =gMain
	movs r3, #0
	movs r0, #1
	strb r0, [r4, #0x19]
	ldr r1, _0801AB00 @ =gIORegisters
	movs r0, #0x4a
	adds r0, r0, r1
	mov ip, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	movs r2, #0
	mov r5, ip
	ldrh r5, [r5]
	orrs r0, r5
	mov r6, ip
	strh r0, [r6]
	strh r3, [r1, #0xe]
	adds r0, r7, #0
	adds r0, #0x23
	strb r2, [r0]
	bl sub_80053C8
	ldr r1, _0801AB04 @ =gScriptContext
	adds r1, #0x24
	movs r0, #0x7f
	ldrb r1, [r1]
	ands r0, r1
	ldr r1, _0801AB08 @ =0x000002C5
	adds r4, r4, r1
	ldrb r1, [r4]
	bl sub_8006130
	ldr r1, _0801AB0C @ =0x040000D4
	ldr r0, _0801AB10 @ =gPalEvidenceProfileDesc
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0801AB14 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0801AC9C
	.align 2, 0
_0801AAFC: .4byte gMain
_0801AB00: .4byte gIORegisters
_0801AB04: .4byte gScriptContext
_0801AB08: .4byte 0x000002C5
_0801AB0C: .4byte 0x040000D4
_0801AB10: .4byte gPalEvidenceProfileDesc
_0801AB14: .4byte 0x80000010
_0801AB18:
	ldr r1, _0801AB44 @ =gMain
	movs r0, #0
	strb r0, [r1, #0x19]
	movs r1, #0
	adds r4, r7, #0
	adds r4, #0x23
	ldr r5, _0801AB48 @ =gBG1MapBuffer
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r2, #0
_0801AB2C:
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xff
	bls _0801AB2C
	movs r0, #1
	strb r0, [r4]
	b _0801AC9C
	.align 2, 0
_0801AB44: .4byte gMain
_0801AB48: .4byte gBG1MapBuffer
_0801AB4C:
	ldr r0, _0801AB70 @ =gMain
	ldrb r0, [r0, #8]
	cmp r0, #3
	bne _0801AB66
	ldr r0, _0801AB74 @ =gAnimation+0x44
	bl DestroyAnimation
	ldr r0, _0801AB78 @ =gInvestigation
	movs r1, #0
	strb r1, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
_0801AB66:
	movs r0, #1
	bl SlideTextbox
	b _0801AC9C
	.align 2, 0
_0801AB70: .4byte gMain
_0801AB74: .4byte gAnimation+0x44
_0801AB78: .4byte gInvestigation
_0801AB7C:
	ldr r4, _0801ABA8 @ =gMain
	ldrb r2, [r4, #8]
	cmp r2, #3
	bne _0801AB96
	ldr r0, _0801ABAC @ =gAnimation+0x44
	bl DestroyAnimation
	ldr r0, _0801ABB0 @ =gInvestigation
	movs r1, #0
	strb r1, [r0, #6]
	movs r1, #0xf
	bl SetInactiveActionButtons
_0801AB96:
	adds r0, r7, #0
	adds r0, #0x23
	ldrb r1, [r0]
	cmp r1, #1
	beq _0801ABB4
	movs r0, #0
	bl SlideTextbox
	b _0801ABBE
	.align 2, 0
_0801ABA8: .4byte gMain
_0801ABAC: .4byte gAnimation+0x44
_0801ABB0: .4byte gInvestigation
_0801ABB4:
	movs r0, #0
	strb r0, [r4, #0x18]
	strb r0, [r4, #0x19]
	ldr r0, _0801AC00 @ =gInvestigation
	strb r1, [r0, #0x10]
_0801ABBE:
	ldr r5, _0801AC04 @ =gMain
	ldrb r6, [r5, #8]
	cmp r6, #4
	bne _0801ABF8
	ldr r4, _0801AC00 @ =gInvestigation
	movs r0, #0
	strb r0, [r4, #0x12]
	ldrb r3, [r5, #9]
	cmp r3, #6
	bne _0801ABDA
	adds r0, r4, #0
	movs r1, #1
	bl SetInactiveActionButtons
_0801ABDA:
	ldrb r0, [r5, #9]
	cmp r0, #8
	bne _0801ABEA
	adds r0, r4, #0
	movs r1, #4
	bl SetInactiveActionButtons
	strb r6, [r4, #0x10]
_0801ABEA:
	ldrb r5, [r5, #9]
	cmp r5, #9
	bne _0801ABF8
	adds r0, r4, #0
	movs r1, #8
	bl SetInactiveActionButtons
_0801ABF8:
	adds r1, r7, #0
	adds r1, #0x26
	movs r0, #3
	b _0801AC9A
	.align 2, 0
_0801AC00: .4byte gInvestigation
_0801AC04: .4byte gMain
_0801AC08:
	ldr r5, _0801AC3C @ =gInvestigation
	movs r6, #0
	strb r6, [r5, #0x12]
	ldr r4, _0801AC40 @ =gMain
	ldrb r1, [r4, #9]
	cmp r1, #6
	bne _0801AC1E
	adds r0, r5, #0
	movs r1, #1
	bl SetInactiveActionButtons
_0801AC1E:
	ldrb r0, [r4, #9]
	cmp r0, #8
	bne _0801AC44
	adds r0, r5, #0
	movs r1, #4
	bl SetInactiveActionButtons
	movs r0, #4
	strb r0, [r5, #0x10]
	strb r6, [r4, #0x18]
	strb r6, [r4, #0x19]
	adds r1, r7, #0
	adds r1, #0x23
	b _0801AC9A
	.align 2, 0
_0801AC3C: .4byte gInvestigation
_0801AC40: .4byte gMain
_0801AC44:
	cmp r0, #9
	bne _0801AC50
	adds r0, r5, #0
	movs r1, #8
	bl SetInactiveActionButtons
_0801AC50:
	strb r6, [r4, #0x18]
	strb r6, [r4, #0x19]
	adds r1, r7, #0
	adds r1, #0x23
	movs r0, #4
	strb r0, [r1]
	movs r0, #1
	strb r0, [r5, #0x10]
	b _0801AC9C
_0801AC62:
	ldr r1, _0801AC80 @ =gIORegisters
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #0xe]
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r5, [r1]
	orrs r0, r5
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x23
	strb r2, [r0]
	b _0801AC9C
	.align 2, 0
_0801AC80: .4byte gIORegisters
_0801AC84:
	ldr r1, _0801ACB0 @ =gIORegisters
	ldr r0, _0801ACB4 @ =0x0000FFAF
	strh r0, [r1, #0xe]
	adds r1, #0x4a
	ldr r0, _0801ACB8 @ =0x0000FDFF
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	adds r1, r7, #0
	adds r1, #0x23
	movs r0, #1
_0801AC9A:
	strb r0, [r1]
_0801AC9C:
	ldr r0, [r7]
	adds r0, #2
	str r0, [r7]
	ldr r1, _0801ACBC @ =gInvestigation
	movs r0, #0
	strb r0, [r1, #7]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801ACB0: .4byte gIORegisters
_0801ACB4: .4byte 0x0000FFAF
_0801ACB8: .4byte 0x0000FDFF
_0801ACBC: .4byte gInvestigation

	thumb_func_start sub_801ACC0
sub_801ACC0: @ 0x0801ACC0
	ldr r0, _0801ACD0 @ =gScriptContext
	ldr r1, [r0]
	ldrh r2, [r1]
	strh r2, [r0, #0xe]
	adds r1, #2
	str r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0801ACD0: .4byte gScriptContext

	thumb_func_start sub_801ACD4
sub_801ACD4: @ 0x0801ACD4
	push {r4, lr}
	ldr r4, _0801AD14 @ =gScriptContext
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _0801AD24
	movs r0, #0x31
	bl PlaySE
	movs r0, #0x10
	ldrh r1, [r4, #0x1c]
	orrs r0, r1
	strh r0, [r4, #0x1c]
	ldr r1, _0801AD18 @ =gMain
	adds r3, r1, #0
	adds r3, #0xe8
	ldr r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #2
	orrs r0, r2
	str r0, [r3]
	ldr r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, _0801AD1C @ =0x01000007
	str r0, [r1, #8]
	ldr r0, _0801AD20 @ =gAnimation+0x44
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
	movs r0, #0
	b _0801AD3A
	.align 2, 0
_0801AD14: .4byte gScriptContext
_0801AD18: .4byte gMain
_0801AD1C: .4byte 0x01000007
_0801AD20: .4byte gAnimation+0x44
_0801AD24:
	movs r0, #6
	bl sub_8016E74
	ldr r0, _0801AD40 @ =0x0000DFFF
	ldrh r1, [r4, #0x1c]
	ands r0, r1
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x12]
	adds r0, #1
	strh r0, [r4, #0x12]
	movs r0, #1
_0801AD3A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801AD40: .4byte 0x0000DFFF

	thumb_func_start sub_801AD44
sub_801AD44: @ 0x0801AD44
	ldr r1, _0801AD50 @ =gScriptContext
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0801AD50: .4byte gScriptContext

	thumb_func_start sub_801AD54
sub_801AD54: @ 0x0801AD54
	ldr r3, _0801AD6C @ =gScriptContext
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801AD74
	ldr r0, _0801AD70 @ =gMain
	adds r0, #0xe8
	ldr r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	b _0801AD80
	.align 2, 0
_0801AD6C: .4byte gScriptContext
_0801AD70: .4byte gMain
_0801AD74:
	ldr r0, _0801AD8C @ =gMain
	adds r0, #0xe8
	ldr r1, [r0]
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
_0801AD80:
	str r1, [r0]
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	bx lr
	.align 2, 0
_0801AD8C: .4byte gMain

	thumb_func_start sub_801AD90
sub_801AD90: @ 0x0801AD90
	push {r4, lr}
	ldr r4, _0801ADA8 @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r0, #2
	beq _0801ADD8
	cmp r0, #2
	bgt _0801ADAC
	cmp r0, #1
	beq _0801ADC4
	b _0801ADB4
	.align 2, 0
_0801ADA8: .4byte gScriptContext
_0801ADAC:
	cmp r0, #3
	beq _0801AE0C
	cmp r0, #4
	beq _0801AE34
_0801ADB4:
	ldr r1, _0801ADBC @ =gUnknown_030037B8
	ldr r0, _0801ADC0 @ =0x00000103
	b _0801AE92
	.align 2, 0
_0801ADBC: .4byte gUnknown_030037B8
_0801ADC0: .4byte 0x00000103
_0801ADC4:
	ldr r1, _0801ADD4 @ =gUnknown_030037BC
	subs r2, r1, #4
	ldr r0, [r2]
	str r0, [r1]
	movs r0, #6
	str r0, [r2]
	b _0801AE94
	.align 2, 0
_0801ADD4: .4byte gUnknown_030037BC
_0801ADD8:
	ldr r0, _0801AE04 @ =gTestimony
	movs r2, #0
	movs r1, #0xe0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r2, [r0]
	ldr r0, _0801AE08 @ =gIORegisters
	adds r0, #0x4a
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	ldrh r0, [r4, #0xc]
	cmp r0, #0x7f
	bhi _0801AE94
	ldrh r0, [r4, #0xe]
	bl ChangeScriptSection
	b _0801AE94
	.align 2, 0
_0801AE04: .4byte gTestimony
_0801AE08: .4byte gIORegisters
_0801AE0C:
	ldr r1, _0801AE28 @ =gTestimony
	movs r0, #0xe0
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0801AE2C @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0801AE30 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	b _0801AE94
	.align 2, 0
_0801AE28: .4byte gTestimony
_0801AE2C: .4byte gIORegisters
_0801AE30: .4byte 0x0000FDFF
_0801AE34:
	ldr r0, _0801AEA4 @ =0x040000D4
	ldr r1, _0801AEA8 @ =gGfxPressPresentButtons
	str r1, [r0]
	ldr r1, _0801AEAC @ =0x06013000
	str r1, [r0, #4]
	ldr r1, _0801AEB0 @ =0x80000200
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801AEB4 @ =gPalPressPresentButtons
	str r1, [r0]
	ldr r1, _0801AEB8 @ =0x050002A0
	str r1, [r0, #4]
	ldr r1, _0801AEBC @ =0x80000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801AEC0 @ =gGfx4bppTestimonyArrows
	str r1, [r0]
	movs r1, #0xd0
	lsls r1, r1, #1
	str r1, [r0, #4]
	ldr r2, _0801AEC4 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0801AEC8 @ =gGfx4bppTestimonyArrows+0x180
	str r1, [r0]
	movs r1, #0x88
	lsls r1, r1, #2
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0801AECC @ =gTestimony
	movs r2, #0
	movs r1, #0xe0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r2, [r0]
	ldr r0, _0801AED0 @ =gIORegisters
	adds r0, #0x4a
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	ldr r1, _0801AED4 @ =gUnknown_030037B8
	movs r0, #0x83
	lsls r0, r0, #1
_0801AE92:
	str r0, [r1]
_0801AE94:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801AEA4: .4byte 0x040000D4
_0801AEA8: .4byte gGfxPressPresentButtons
_0801AEAC: .4byte 0x06013000
_0801AEB0: .4byte 0x80000200
_0801AEB4: .4byte gPalPressPresentButtons
_0801AEB8: .4byte 0x050002A0
_0801AEBC: .4byte 0x80000010
_0801AEC0: .4byte gGfx4bppTestimonyArrows
_0801AEC4: .4byte 0x80000040
_0801AEC8: .4byte gGfx4bppTestimonyArrows+0x180
_0801AECC: .4byte gTestimony
_0801AED0: .4byte gIORegisters
_0801AED4: .4byte gUnknown_030037B8

	thumb_func_start sub_801AED8
sub_801AED8: @ 0x0801AED8
	push {r4, lr}
	ldr r4, _0801AEF0 @ =gScriptContext
	ldr r0, [r4]
	ldrh r1, [r0]
	movs r0, #0
	bl GetFlag
	cmp r0, #0
	beq _0801AEF4
	ldr r0, [r4]
	ldrh r1, [r0, #2]
	b _0801AEF8
	.align 2, 0
_0801AEF0: .4byte gScriptContext
_0801AEF4:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
_0801AEF8:
	strh r1, [r4, #0xe]
	adds r0, #6
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801AF08
sub_801AF08: @ 0x0801AF08
	movs r0, #0
	bx lr

	thumb_func_start sub_801AF0C
sub_801AF0C: @ 0x0801AF0C
	push {lr}
	ldr r2, _0801AF3C @ =gScriptContext
	adds r3, r2, #0
	adds r3, #0x22
	ldrb r1, [r3]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801AF2C
	movs r0, #0xdf
	ands r0, r1
	movs r1, #0
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
_0801AF2C:
	ldr r0, [r2]
	ldrh r0, [r0]
	bl ChangeScriptSection
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801AF3C: .4byte gScriptContext

	thumb_func_start sub_801AF40
sub_801AF40: @ 0x0801AF40
	push {r4, r5, r6, lr}
	ldr r3, _0801AF8C @ =gScriptContext
	ldr r0, _0801AF90 @ =0x0000DFFF
	ldrh r1, [r3, #0x1c]
	ands r0, r1
	movs r4, #0
	ldr r1, _0801AF94 @ =0x0000BFFF
	ands r0, r1
	strh r0, [r3, #0x1c]
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801AF6E
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
_0801AF6E:
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFA4
	ldr r0, _0801AF98 @ =gBG1MapBuffer
	ldr r2, _0801AF9C @ =0x000004DC
	adds r1, r0, r2
	movs r2, #9
	strh r2, [r1]
	ldr r6, _0801AFA0 @ =0x000004DE
	adds r0, r0, r6
	strh r2, [r0]
	b _0801AFB2
	.align 2, 0
_0801AF8C: .4byte gScriptContext
_0801AF90: .4byte 0x0000DFFF
_0801AF94: .4byte 0x0000BFFF
_0801AF98: .4byte gBG1MapBuffer
_0801AF9C: .4byte 0x000004DC
_0801AFA0: .4byte 0x000004DE
_0801AFA4:
	ldr r0, _0801AFF8 @ =gBG1MapBuffer
	ldr r2, _0801AFFC @ =0x000004DC
	adds r1, r0, r2
	strh r4, [r1]
	ldr r6, _0801B000 @ =0x000004DE
	adds r0, r0, r6
	strh r4, [r0]
_0801AFB2:
	movs r2, #0
	movs r0, #0x22
	adds r0, r0, r3
	mov ip, r0
	adds r4, r3, #0
	adds r4, #0x28
	adds r5, r3, #0
	adds r5, #0x29
	ldr r3, _0801B004 @ =0x00003FFF
	ldr r1, _0801B008 @ =gTextBoxCharacters
_0801AFC6:
	adds r0, r3, #0
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	adds r1, #0xc
	adds r2, #1
	cmp r2, #0x3f
	bls _0801AFC6
	movs r0, #0
	strb r0, [r4]
	strb r0, [r5]
	movs r0, #0xf
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801AFF0
	bl sub_8017BA8
	bl sub_8017BC0
_0801AFF0:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801AFF8: .4byte gBG1MapBuffer
_0801AFFC: .4byte 0x000004DC
_0801B000: .4byte 0x000004DE
_0801B004: .4byte 0x00003FFF
_0801B008: .4byte gTextBoxCharacters

	thumb_func_start sub_801B00C
sub_801B00C: @ 0x0801B00C
	ldr r1, _0801B024 @ =gScriptContext
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r0, #2
	bne _0801B01A
	movs r0, #0
	strh r0, [r1, #0x16]
_0801B01A:
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0801B024: .4byte gScriptContext

	thumb_func_start sub_801B028
sub_801B028: @ 0x0801B028
	ldr r1, _0801B048 @ =gScriptContext
	ldr r0, [r1]
	ldrh r2, [r0]
	ldrh r3, [r0, #2]
	adds r0, #4
	str r0, [r1]
	ldr r1, _0801B04C @ =gMain
	lsls r0, r2, #2
	adds r0, r0, r2
	movs r2, #0x96
	lsls r2, r2, #1
	adds r1, r1, r2
	adds r0, r0, r1
	strb r3, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0801B048: .4byte gScriptContext
_0801B04C: .4byte gMain

	thumb_func_start sub_801B050
sub_801B050: @ 0x0801B050
	push {r4, r5, lr}
	ldr r3, _0801B088 @ =gScriptContext
	ldr r0, [r3]
	ldrh r1, [r0]
	adds r0, #2
	str r0, [r3]
	movs r2, #1
	lsls r0, r1, #2
	adds r4, r0, r1
	ldr r5, _0801B08C @ =gUnknown_030038DC
_0801B064:
	adds r1, r2, r4
	adds r1, r1, r5
	ldr r0, [r3]
	ldrh r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	cmp r2, #4
	bls _0801B064
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B088: .4byte gScriptContext
_0801B08C: .4byte gUnknown_030038DC

	thumb_func_start sub_801B090
sub_801B090: @ 0x0801B090
	push {r4, r5, lr}
	ldr r4, _0801B0CC @ =gScriptContext
	ldr r5, _0801B0D0 @ =gMain
	ldr r2, [r4]
	ldrh r1, [r2]
	adds r0, r5, #0
	adds r0, #0xc0
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0801B0B8
	movs r0, #2
	movs r1, #0
	movs r2, #2
	movs r3, #0x1f
	bl StartHardwareBlend
_0801B0B8:
	ldr r0, _0801B0D4 @ =0x00000504
	str r0, [r5, #8]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B0CC: .4byte gScriptContext
_0801B0D0: .4byte gMain
_0801B0D4: .4byte 0x00000504

	thumb_func_start sub_801B0D8
sub_801B0D8: @ 0x0801B0D8
	push {r4, lr}
	ldr r4, _0801B0FC @ =gScriptContext
	ldr r0, [r4]
	ldrh r1, [r0]
	lsrs r2, r1, #8
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801B100
	movs r0, #0
	adds r1, r2, #0
	bl GetFlag
	cmp r0, #0
	bne _0801B112
	ldr r0, [r4]
	adds r0, #4
	b _0801B134
	.align 2, 0
_0801B0FC: .4byte gScriptContext
_0801B100:
	movs r0, #0
	adds r1, r2, #0
	bl GetFlag
	cmp r0, #0
	beq _0801B112
	ldr r0, [r4]
	adds r0, #4
	b _0801B134
_0801B112:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r2, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0801B12A
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	bl sub_801873C
	b _0801B136
_0801B12A:
	ldrh r1, [r1, #2]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	ldr r0, [r4, #4]
	adds r0, r0, r1
_0801B134:
	str r0, [r4]
_0801B136:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B140
sub_801B140: @ 0x0801B140
	push {lr}
	ldr r0, _0801B154 @ =gScriptContext
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_801873C
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801B154: .4byte gScriptContext

	thumb_func_start sub_801B158
sub_801B158: @ 0x0801B158
	push {r4, lr}
	ldr r2, _0801B180 @ =gScriptContext
	ldr r1, [r2]
	ldrh r3, [r1]
	adds r0, r1, #2
	str r0, [r2]
	ldr r4, _0801B184 @ =gUnknown_03002920
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r1, #2]
	strb r1, [r0, #3]
	ldr r0, [r2]
	adds r0, #2
	str r0, [r2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B180: .4byte gScriptContext
_0801B184: .4byte gUnknown_03002920

	thumb_func_start sub_801B188
sub_801B188: @ 0x0801B188
	push {r4, r5, r6, r7, lr}
	ldr r7, _0801B21C @ =gScriptContext
	ldr r0, [r7]
	ldrh r0, [r0]
	lsrs r6, r0, #8
	adds r0, r6, #0
	bl sub_8019FF8
	adds r4, r0, #0
	ldr r1, [r7]
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801B274
	cmp r4, #0xff
	bne _0801B244
	movs r0, #0xff
	bl sub_8019FF8
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0801B220 @ =gMapMarker
	adds r5, r0, r1
	adds r4, #0x39
	bl sub_801A018
	str r0, [r5, #0x10]
	strb r6, [r5]
	ldr r2, _0801B224 @ =0x040000D4
	ldr r0, _0801B228 @ =gMapMarkerSprites
	lsls r3, r6, #1
	adds r3, r3, r6
	lsls r3, r3, #2
	adds r3, r3, r0
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x10]
	str r0, [r2, #4]
	ldrh r1, [r3, #4]
	lsrs r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _0801B22C @ =gUnknown_081CB694
	str r0, [r2]
	ldr r0, _0801B230 @ =0x050002C0
	str r0, [r2, #4]
	ldr r0, _0801B234 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	strh r4, [r5, #0xe]
	lsls r1, r4, #3
	ldr r0, _0801B238 @ =gOamObjects
	adds r1, r1, r0
	ldrh r0, [r3, #6]
	strh r0, [r1]
	strh r0, [r5, #8]
	ldrh r0, [r3, #8]
	strh r0, [r1, #2]
	strh r0, [r5, #0xa]
	ldr r0, [r5, #0x10]
	ldr r2, _0801B23C @ =0xF9FEE800
	adds r4, r0, r2
	lsrs r4, r4, #5
	ldr r2, _0801B240 @ =0x000068C0
	adds r0, r4, r2
	strh r0, [r1, #4]
	strh r0, [r5, #0xc]
	b _0801B262
	.align 2, 0
_0801B21C: .4byte gScriptContext
_0801B220: .4byte gMapMarker
_0801B224: .4byte 0x040000D4
_0801B228: .4byte gMapMarkerSprites
_0801B22C: .4byte gUnknown_081CB694
_0801B230: .4byte 0x050002C0
_0801B234: .4byte 0x80000010
_0801B238: .4byte gOamObjects
_0801B23C: .4byte 0xF9FEE800
_0801B240: .4byte 0x000068C0
_0801B244:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0801B26C @ =gMapMarker
	adds r5, r0, r1
	ldrh r2, [r5, #0xe]
	lsls r1, r2, #3
	ldr r0, _0801B270 @ =gOamObjects
	adds r1, r1, r0
	ldrh r0, [r5, #8]
	strh r0, [r1]
	ldrh r0, [r5, #0xa]
	strh r0, [r1, #2]
	ldrh r0, [r5, #0xc]
	strh r0, [r1, #4]
_0801B262:
	movs r0, #0xfb
	ldrb r1, [r5, #5]
	ands r0, r1
	strb r0, [r5, #5]
	b _0801B286
	.align 2, 0
_0801B26C: .4byte gMapMarker
_0801B270: .4byte gOamObjects
_0801B274:
	ldr r1, _0801B294 @ =gMapMarker
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #4
	ldrb r2, [r0, #5]
	orrs r1, r2
	strb r1, [r0, #5]
_0801B286:
	ldr r0, [r7]
	adds r0, #2
	str r0, [r7]
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B294: .4byte gMapMarker

	thumb_func_start sub_801B298
sub_801B298: @ 0x0801B298
	push {r4, lr}
	ldr r4, _0801B2F0 @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	bl sub_8019FF8
	adds r2, r0, #0
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	cmp r2, #0xff
	beq _0801B2E2
	ldr r0, _0801B2F4 @ =gMapMarker
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0xff
	lsls r0, r0, #8
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r2, [r4]
	ldrb r2, [r2]
	orrs r0, r2
	strh r0, [r1, #8]
	movs r0, #0xfe
	lsls r0, r0, #8
	ldrh r2, [r1, #0xa]
	ands r0, r2
	strh r0, [r1, #0xa]
	ldr r2, [r4]
	ldrh r2, [r2]
	lsrs r2, r2, #8
	orrs r0, r2
	strh r0, [r1, #0xa]
_0801B2E2:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B2F0: .4byte gScriptContext
_0801B2F4: .4byte gMapMarker

	thumb_func_start sub_801B2F8
sub_801B2F8: @ 0x0801B2F8
	push {r4, lr}
	ldr r4, _0801B344 @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	bl sub_8019FF8
	adds r2, r0, #0
	cmp r2, #0xff
	beq _0801B34C
	ldr r0, _0801B348 @ =gMapMarker
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r3, #0
	strb r0, [r1, #4]
	ldr r2, [r4]
	adds r0, r2, #2
	str r0, [r4]
	ldrh r2, [r2, #2]
	lsrs r0, r2, #8
	strb r0, [r1, #3]
	ldr r0, [r4]
	ldrh r0, [r0]
	strb r0, [r1, #6]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #2
	ldrb r2, [r1, #5]
	orrs r0, r2
	strb r0, [r1, #5]
	strb r3, [r1, #7]
	b _0801B352
	.align 2, 0
_0801B344: .4byte gScriptContext
_0801B348: .4byte gMapMarker
_0801B34C:
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
_0801B352:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B35C
sub_801B35C: @ 0x0801B35C
	push {r4, lr}
	ldr r4, _0801B3AC @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	bl sub_8019FF8
	adds r2, r0, #0
	cmp r2, #0xff
	beq _0801B39E
	ldr r1, _0801B3B0 @ =gMapMarker
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldr r0, [r4]
	ldrh r0, [r0]
	strb r0, [r3, #1]
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801B39A
	ldr r0, _0801B3B4 @ =gOamObjects
	adds r1, r2, #0
	adds r1, #0x39
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
_0801B39A:
	movs r0, #0
	strb r0, [r3, #2]
_0801B39E:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B3AC: .4byte gScriptContext
_0801B3B0: .4byte gMapMarker
_0801B3B4: .4byte gOamObjects

	thumb_func_start sub_801B3B8
sub_801B3B8: @ 0x0801B3B8
	push {r4, lr}
	ldr r4, _0801B3E4 @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	bl sub_8019FF8
	adds r2, r0, #0
	cmp r2, #0xff
	beq _0801B3EC
	ldr r0, _0801B3E8 @ =gMapMarker
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #2
	ldrb r1, [r1, #5]
	ands r0, r1
	cmp r0, #0
	beq _0801B3EC
	movs r0, #1
	b _0801B3F4
	.align 2, 0
_0801B3E4: .4byte gScriptContext
_0801B3E8: .4byte gMapMarker
_0801B3EC:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
_0801B3F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801B3FC
sub_801B3FC: @ 0x0801B3FC
	push {r4, lr}
	ldr r4, _0801B458 @ =gScriptContext
	movs r0, #1
	bl sub_8017154
	ldr r1, _0801B45C @ =0x040000D4
	ldr r0, _0801B460 @ =gGfxExamineCursor
	str r0, [r1]
	ldr r0, _0801B464 @ =0x06011F80
	str r0, [r1, #4]
	ldr r0, _0801B468 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801B46C @ =gPalExamineCursors
	str r0, [r1]
	ldr r0, _0801B470 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0801B474 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0801B478 @ =gInvestigation
	movs r1, #0
	movs r0, #0xf0
	strh r0, [r2]
	movs r0, #0x30
	strh r0, [r2, #2]
	strb r1, [r2, #0x1b]
	movs r0, #0xa
	strb r0, [r2, #0x1a]
	movs r0, #0xf
	strb r0, [r2, #9]
	ldr r1, [r4]
	ldrh r0, [r1]
	strb r0, [r2, #0xa]
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r2, [r4, #0x1c]
	orrs r0, r2
	strh r0, [r4, #0x1c]
	adds r1, #2
	str r1, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B458: .4byte gScriptContext
_0801B45C: .4byte 0x040000D4
_0801B460: .4byte gGfxExamineCursor
_0801B464: .4byte 0x06011F80
_0801B468: .4byte 0x80000040
_0801B46C: .4byte gPalExamineCursors
_0801B470: .4byte 0x05000340
_0801B474: .4byte 0x80000010
_0801B478: .4byte gInvestigation

	thumb_func_start sub_801B47C
sub_801B47C: @ 0x0801B47C
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r5, r1, #2
	lsls r2, r7, #0xc
	movs r3, #0x80
	lsls r3, r3, #9
	adds r7, r2, r3
	ldr r6, _0801B508 @ =gOamObjects
	lsrs r0, r0, #0x15
	adds r0, r0, r6
	lsls r1, r1, #9
	ldrh r2, [r0, #2]
	orrs r1, r2
	strh r1, [r0, #2]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r3, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bl sub_8006364
	lsls r4, r5, #3
	adds r4, r4, r6
	lsls r0, r0, #0x10
	adds r1, r7, #0
	bl __udivsi3
	strh r0, [r4, #6]
	movs r0, #0
	bl sub_80063E4
	adds r4, r5, #1
	lsls r4, r4, #3
	adds r4, r4, r6
	lsls r0, r0, #0x10
	adds r1, r7, #0
	bl __udivsi3
	strh r0, [r4, #6]
	movs r0, #0
	bl sub_80063E4
	adds r4, r5, #2
	lsls r4, r4, #3
	adds r4, r4, r6
	lsls r0, r0, #0x10
	adds r1, r7, #0
	bl __udivsi3
	rsbs r0, r0, #0
	strh r0, [r4, #6]
	movs r0, #0
	bl sub_8006364
	adds r5, #3
	lsls r5, r5, #3
	adds r5, r5, r6
	lsls r0, r0, #0x10
	adds r1, r7, #0
	bl __udivsi3
	strh r0, [r5, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B508: .4byte gOamObjects

	thumb_func_start sub_801B50C
sub_801B50C: @ 0x0801B50C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r5, _0801B710 @ =gInvestigation
	ldr r6, _0801B714 @ =gScriptContext
	movs r0, #0x2c
	ldrb r2, [r5, #0xa]
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, _0801B718 @ =gUnknown_0802873C
	adds r1, r1, r0
	mov r8, r1
	ldrh r1, [r6, #0x12]
	movs r7, #0xff
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0801B538
	b _0801B790
_0801B538:
	adds r0, r1, #3
	strh r0, [r6, #0x12]
	ands r0, r7
	cmp r0, #4
	bne _0801B592
	ldr r4, _0801B71C @ =gOamObjects
	movs r3, #0xae
	lsls r3, r3, #2
	adds r2, r4, r3
	movs r0, #0xb0
	lsls r0, r0, #2
	adds r3, r4, r0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [r2]
	str r1, [r2, #4]
	ldrh r1, [r3]
	movs r2, #0xff
	lsls r2, r2, #8
	ands r2, r1
	adds r0, r7, #0
	ands r0, r1
	subs r0, #8
	movs r1, #0xff
	ands r0, r1
	orrs r2, r0
	strh r2, [r3]
	ldr r1, _0801B720 @ =0x000002C2
	adds r4, r4, r1
	ldrh r3, [r4]
	movs r1, #0xfe
	lsls r1, r1, #8
	ands r1, r3
	ldr r2, _0801B724 @ =0x000001FF
	adds r0, r2, #0
	ands r0, r3
	subs r0, #8
	ands r0, r2
	orrs r1, r0
	strh r1, [r4]
	ldr r0, _0801B728 @ =gIORegisters
	adds r0, #0x48
	movs r1, #0x94
	lsls r1, r1, #4
	strh r1, [r0]
_0801B592:
	movs r7, #0xf0
	adds r0, r7, #0
	ldrh r2, [r6, #0x12]
	ands r0, r2
	cmp r0, #0
	bne _0801B5D0
	movs r0, #0x58
	movs r1, #4
	movs r2, #0x10
	bl sub_801B47C
	ldr r1, _0801B71C @ =gOamObjects
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r2, _0801B728 @ =gIORegisters
	movs r1, #0xf
	ldrh r0, [r6, #0x12]
	ands r1, r0
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r0, r1
	adds r2, #0x4c
	strh r0, [r2]
_0801B5D0:
	ldrh r4, [r6, #0x12]
	adds r3, r7, #0
	ands r3, r4
	cmp r3, #0x10
	bne _0801B5FC
	ldr r0, _0801B71C @ =gOamObjects
	movs r1, #0xae
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r2, #0xf
	ands r2, r4
	subs r2, r3, r2
	movs r0, #0x58
	movs r1, #4
	bl sub_801B47C
_0801B5FC:
	ldrh r4, [r6, #0x12]
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0x20
	bne _0801B648
	ldr r3, _0801B71C @ =gOamObjects
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r2, r3, r0
	movs r0, #0xfb
	lsls r0, r0, #8
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strh r0, [r2]
	movs r2, #0xae
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0801B72C @ =0x0000FDFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r4
	movs r2, #0x10
	subs r2, r2, r0
	movs r0, #0x58
	movs r1, #4
	bl sub_801B47C
	ldr r0, _0801B728 @ =gIORegisters
	adds r0, #0x4c
	ldr r1, _0801B730 @ =0x0000040C
	strh r1, [r0]
_0801B648:
	adds r0, r7, #0
	ldrh r1, [r6, #0x12]
	ands r0, r1
	cmp r0, #0x30
	beq _0801B654
	b _0801BA5E
_0801B654:
	ldr r0, _0801B71C @ =gOamObjects
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r2, r0, r3
	movs r1, #0xae
	lsls r1, r1, #2
	adds r3, r0, r1
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [r2]
	str r1, [r2, #4]
	movs r2, #0x80
	lsls r2, r2, #2
	strh r2, [r3]
	ldr r3, _0801B728 @ =gIORegisters
	adds r1, r3, #0
	adds r1, #0x48
	ldr r0, _0801B734 @ =0x00003942
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801B738 @ =0x0000071F
	strh r0, [r1]
	ldr r4, _0801B73C @ =gMain
	movs r0, #1
	strb r0, [r4, #0x19]
	adds r0, r3, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	orrs r2, r1
	strh r2, [r0]
	movs r0, #0
	strh r0, [r3, #0xe]
	adds r1, r6, #0
	adds r1, #0x23
	strb r0, [r1]
	bl sub_80053C8
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x7f
	ldrb r1, [r1]
	ands r0, r1
	ldr r2, _0801B740 @ =0x000002C5
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_8006130
	ldr r1, _0801B744 @ =0x040000D4
	ldr r0, _0801B748 @ =gPalEvidenceProfileDesc
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0801B74C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	ldrh r3, [r5]
	adds r0, r0, r3
	adds r0, #0xc
	lsls r0, r0, #0x10
	ldr r3, _0801B750 @ =0xFFFF0000
	adds r4, #0x46
	ldrh r4, [r4]
	ldrh r5, [r5, #2]
	adds r1, r4, r5
	lsls r1, r1, #0x10
	ldr r2, _0801B754 @ =0x0000FFFF
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp]
	ldr r0, [sp, #4]
	ands r0, r3
	movs r1, #4
	orrs r0, r1
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [sp, #4]
	mov r0, sp
	mov r1, r8
	bl sub_8012504
	cmp r0, #0
	beq _0801B758
	mov r1, r8
	ldrh r0, [r1, #0x20]
	bl ChangeScriptSection
	b _0801B778
	.align 2, 0
_0801B710: .4byte gInvestigation
_0801B714: .4byte gScriptContext
_0801B718: .4byte gUnknown_0802873C
_0801B71C: .4byte gOamObjects
_0801B720: .4byte 0x000002C2
_0801B724: .4byte 0x000001FF
_0801B728: .4byte gIORegisters
_0801B72C: .4byte 0x0000FDFF
_0801B730: .4byte 0x0000040C
_0801B734: .4byte 0x00003942
_0801B738: .4byte 0x0000071F
_0801B73C: .4byte gMain
_0801B740: .4byte 0x000002C5
_0801B744: .4byte 0x040000D4
_0801B748: .4byte gPalEvidenceProfileDesc
_0801B74C: .4byte 0x80000010
_0801B750: .4byte 0xFFFF0000
_0801B754: .4byte 0x0000FFFF
_0801B758:
	mov r1, r8
	adds r1, #0x10
	mov r0, sp
	bl sub_8012504
	cmp r0, #0
	beq _0801B770
	mov r2, r8
	ldrh r0, [r2, #0x22]
	bl ChangeScriptSection
	b _0801B778
_0801B770:
	mov r3, r8
	ldrh r0, [r3, #0x24]
	bl ChangeScriptSection
_0801B778:
	ldr r0, _0801B78C @ =0x0000FEF7
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	strh r0, [r6, #0x1c]
	movs r0, #0
	bl sub_8017154
	movs r0, #0
	b _0801BA60
	.align 2, 0
_0801B78C: .4byte 0x0000FEF7
_0801B790:
	ldrh r1, [r6, #0x1c]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0801B7E8
	ldrh r2, [r5]
	ldrb r3, [r5, #9]
	adds r0, r2, r3
	ands r0, r7
	strh r0, [r5]
	adds r0, r3, #0
	subs r0, #1
	strb r0, [r5, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B7C2
	ldr r0, _0801B7E0 @ =0x0000FF7F
	ands r0, r1
	movs r2, #0x84
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x1c]
_0801B7C2:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r3, [r6, #0x1c]
	ands r0, r3
	cmp r0, #0
	bne _0801B7D0
	b _0801BA2E
_0801B7D0:
	movs r0, #0x31
	bl PlaySE
	ldr r0, _0801B7E4 @ =0x0000FDFF
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	strh r0, [r6, #0x1c]
	b _0801BA2E
	.align 2, 0
_0801B7E0: .4byte 0x0000FF7F
_0801B7E4: .4byte 0x0000FDFF
_0801B7E8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801B7F4
	b _0801BA2E
_0801B7F4:
	ldr r1, _0801B9C0 @ =gJoypad
	movs r0, #0x20
	ldrh r3, [r1]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0801B820
	ldrh r0, [r5]
	subs r0, #3
	strh r0, [r5]
	mov r1, r8
	adds r1, #0x28
	ldrb r1, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bhs _0801B818
	strh r1, [r5]
_0801B818:
	ldrh r0, [r5]
	cmp r0, #0xe0
	bls _0801B820
	strh r2, [r5]
_0801B820:
	movs r0, #0x10
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0801B84A
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	mov r1, r8
	adds r1, #0x2a
	ldrb r1, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _0801B840
	strh r1, [r5]
_0801B840:
	ldrh r2, [r5]
	cmp r2, #0xe0
	bls _0801B84A
	movs r0, #0xe0
	strh r0, [r5]
_0801B84A:
	movs r0, #0x40
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0801B874
	ldrh r0, [r5, #2]
	subs r0, #3
	strh r0, [r5, #2]
	mov r1, r8
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bhs _0801B86A
	strh r1, [r5, #2]
_0801B86A:
	ldrh r2, [r5, #2]
	cmp r2, #0x90
	bls _0801B874
	movs r0, #0
	strh r0, [r5, #2]
_0801B874:
	movs r0, #0x80
	ldrh r1, [r3]
	ands r0, r1
	cmp r0, #0
	beq _0801B89E
	ldrh r0, [r5, #2]
	adds r0, #3
	strh r0, [r5, #2]
	mov r1, r8
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _0801B894
	strh r1, [r5, #2]
_0801B894:
	ldrh r2, [r5, #2]
	cmp r2, #0x90
	bls _0801B89E
	movs r0, #0x90
	strh r0, [r5, #2]
_0801B89E:
	movs r1, #1
	ldrh r3, [r3, #2]
	ands r1, r3
	cmp r1, #0
	bne _0801B8AA
	b _0801BA00
_0801B8AA:
	mov r0, sp
	mov r1, r8
	bl sub_8012504
	cmp r0, #0
	beq _0801B8CC
	movs r0, #3
	movs r1, #1
	movs r2, #8
	movs r3, #0x1f
	bl StartHardwareBlend
	bl StopBGM
	movs r0, #0x48
	bl PlaySE
_0801B8CC:
	ldr r1, _0801B9C4 @ =0x040000D4
	ldr r0, _0801B9C8 @ =gGfxExamineCursor
	str r0, [r1]
	ldr r2, _0801B9CC @ =0x06010000
	str r2, [r1, #4]
	ldr r0, _0801B9D0 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	movs r0, #0xf0
	lsls r0, r0, #8
	mov sl, r0
	movs r1, #0x90
	lsls r1, r1, #8
	mov sb, r1
	movs r0, #0x90
	lsls r0, r0, #4
	mov ip, r0
	ldr r1, _0801B9D4 @ =0x00000FFF
	mov r8, r1
	movs r7, #0xf0
	lsls r7, r7, #4
	ldr r4, _0801B9D8 @ =0x0000F0FF
_0801B8FA:
	ldrh r1, [r2]
	mov r0, sl
	ands r0, r1
	cmp r0, sb
	bne _0801B90A
	mov r0, r8
	ands r0, r1
	strh r0, [r2]
_0801B90A:
	ldrh r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, ip
	bne _0801B91A
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2]
_0801B91A:
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x90
	bne _0801B92A
	ldr r0, _0801B9DC @ =0x0000FF0F
	ands r0, r1
	strh r0, [r2]
_0801B92A:
	ldrh r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #9
	bne _0801B93A
	ldr r0, _0801B9E0 @ =0x0000FFF0
	ands r0, r1
	strh r0, [r2]
_0801B93A:
	adds r2, #2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xff
	bls _0801B8FA
	ldrh r0, [r5, #2]
	adds r0, #1
	strh r0, [r5, #2]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r3, [r6, #0x1c]
	orrs r0, r3
	strh r0, [r6, #0x1c]
	ldr r1, _0801B9C4 @ =0x040000D4
	ldr r0, _0801B9E4 @ =gPalExamineCursors
	str r0, [r1]
	ldr r0, _0801B9E8 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0801B9EC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x2b
	bl PlaySE
	ldr r1, _0801B9F0 @ =gOamObjects
	ldrh r2, [r5, #2]
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r5, [r5]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r2, r5, r0
	adds r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _0801B9F4 @ =0x0000A4FC
	strh r0, [r1]
	ldrh r0, [r6, #0x12]
	adds r0, #1
	strh r0, [r6, #0x12]
	movs r3, #0
	ldr r4, _0801B9F8 @ =gBG1MapBuffer
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r1, #0
_0801B9A2:
	adds r0, r3, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xff
	bls _0801B9A2
	ldr r0, _0801B9FC @ =gScriptContext
	adds r0, #0x23
	movs r1, #1
	strb r1, [r0]
	b _0801BA5E
	.align 2, 0
_0801B9C0: .4byte gJoypad
_0801B9C4: .4byte 0x040000D4
_0801B9C8: .4byte gGfxExamineCursor
_0801B9CC: .4byte 0x06010000
_0801B9D0: .4byte 0x80000040
_0801B9D4: .4byte 0x00000FFF
_0801B9D8: .4byte 0x0000F0FF
_0801B9DC: .4byte 0x0000FF0F
_0801B9E0: .4byte 0x0000FFF0
_0801B9E4: .4byte gPalExamineCursors
_0801B9E8: .4byte 0x05000340
_0801B9EC: .4byte 0x80000010
_0801B9F0: .4byte gOamObjects
_0801B9F4: .4byte 0x0000A4FC
_0801B9F8: .4byte gBG1MapBuffer
_0801B9FC: .4byte gScriptContext
_0801BA00:
	ldrb r0, [r5, #0x1b]
	adds r0, #1
	strb r0, [r5, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801BA2E
	strb r1, [r5, #0x1b]
	ldrb r0, [r5, #0x1a]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r5, #0x1a]
	ldr r1, _0801BA70 @ =0x040000D4
	lsls r0, r0, #5
	ldr r2, _0801BA74 @ =gPalExamineCursors
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _0801BA78 @ =0x05000340
	str r0, [r1, #4]
	ldr r0, _0801BA7C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0801BA2E:
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r1, [r6, #0x1c]
	orrs r0, r1
	strh r0, [r6, #0x1c]
	ldr r1, _0801BA80 @ =gOamObjects
	ldrh r2, [r5, #2]
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r5, [r5]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r2, r5, r0
	adds r3, #2
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _0801BA84 @ =0x0000A4FC
	strh r0, [r1]
_0801BA5E:
	movs r0, #1
_0801BA60:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BA70: .4byte 0x040000D4
_0801BA74: .4byte gPalExamineCursors
_0801BA78: .4byte 0x05000340
_0801BA7C: .4byte 0x80000010
_0801BA80: .4byte gOamObjects
_0801BA84: .4byte 0x0000A4FC

	thumb_func_start sub_801BA88
sub_801BA88: @ 0x0801BA88
	ldr r1, _0801BAA4 @ =gScriptContext
	ldr r0, _0801BAA8 @ =0x0000FBFF
	ldrh r2, [r1, #0x1c]
	ands r0, r2
	strh r0, [r1, #0x1c]
	ldr r0, _0801BAAC @ =gOamObjects
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #0xc0
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0801BAA4: .4byte gScriptContext
_0801BAA8: .4byte 0x0000FBFF
_0801BAAC: .4byte gOamObjects

	thumb_func_start sub_801BAB0
sub_801BAB0: @ 0x0801BAB0
	push {r4, r5, r6, r7, lr}
	ldr r1, _0801BB08 @ =gOamObjects+0x1A0
	movs r4, #0
	ldr r5, _0801BB0C @ =gInvestigation
	ldr r7, _0801BB10 @ =0x000040E0
	movs r3, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	adds r6, r0, #0
	movs r2, #0xa2
	lsls r2, r2, #7
_0801BAC6:
	strh r7, [r1]
	adds r0, r3, r6
	strh r0, [r1, #2]
	strh r2, [r1, #4]
	adds r1, #8
	adds r3, #0x3c
	adds r2, #0x20
	adds r4, #1
	cmp r4, #3
	bls _0801BAC6
	movs r4, #0
	adds r0, r5, #0
	movs r1, #0xf
	bl SetInactiveActionButtons
	movs r0, #0xe0
	strb r0, [r5, #0x11]
	strb r4, [r5, #0x12]
	movs r0, #8
	strb r0, [r5, #0x13]
	strb r4, [r5, #0xc]
	strb r4, [r5, #0xd]
	ldr r1, _0801BB14 @ =gIORegisters
	ldr r0, _0801BB18 @ =0x0000FFAC
	strh r0, [r1, #0xe]
	ldr r1, _0801BB1C @ =gUnknown_030037B8
	movs r0, #0x82
	lsls r0, r0, #1
	str r0, [r1]
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BB08: .4byte gOamObjects+0x1A0
_0801BB0C: .4byte gInvestigation
_0801BB10: .4byte 0x000040E0
_0801BB14: .4byte gIORegisters
_0801BB18: .4byte 0x0000FFAC
_0801BB1C: .4byte gUnknown_030037B8

	thumb_func_start sub_801BB20
sub_801BB20: @ 0x0801BB20
	ldr r3, _0801BB3C @ =gScriptContext
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801BB44
	ldr r0, _0801BB40 @ =gMain
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	b _0801BB52
	.align 2, 0
_0801BB3C: .4byte gScriptContext
_0801BB40: .4byte gMain
_0801BB44:
	ldr r0, _0801BB60 @ =gMain
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #4
	orrs r1, r2
_0801BB52:
	str r1, [r0]
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	bx lr
	.align 2, 0
_0801BB60: .4byte gMain

	thumb_func_start sub_801BB64
sub_801BB64: @ 0x0801BB64
	push {r4, r5, lr}
	ldr r3, _0801BB90 @ =gScriptContext
	ldr r4, [r3]
	ldr r0, _0801BB94 @ =0x0000FFFF
	ldrh r1, [r4]
	cmp r1, r0
	bne _0801BB9C
	ldr r0, _0801BB98 @ =gIORegisters
	adds r0, #0x4a
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	movs r2, #0
	ldrh r5, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	b _0801BBB8
	.align 2, 0
_0801BB90: .4byte gScriptContext
_0801BB94: .4byte 0x0000FFFF
_0801BB98: .4byte gIORegisters
_0801BB9C:
	ldr r1, _0801BBC4 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _0801BBC8 @ =0x0000FDFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldrh r1, [r4]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrh r0, [r4, #2]
	adds r1, r3, #0
	adds r1, #0x4d
	strb r0, [r1]
_0801BBB8:
	adds r0, r4, #4
	str r0, [r3]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BBC4: .4byte gIORegisters
_0801BBC8: .4byte 0x0000FDFF

	thumb_func_start sub_801BBCC
sub_801BBCC: @ 0x0801BBCC
	ldr r2, _0801BBE0 @ =gScriptContext
	ldr r1, [r2]
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801BBE8
	ldr r0, _0801BBE4 @ =gMain
	ldrb r0, [r0, #9]
	cmp r0, #8
	bne _0801BBFC
	b _0801BBF0
	.align 2, 0
_0801BBE0: .4byte gScriptContext
_0801BBE4: .4byte gMain
_0801BBE8:
	ldr r0, _0801BBF8 @ =gMain
	ldrb r0, [r0, #9]
	cmp r0, #6
	bne _0801BBFC
_0801BBF0:
	adds r0, r1, #2
	str r0, [r2]
	movs r0, #0
	b _0801BBFE
	.align 2, 0
_0801BBF8: .4byte gMain
_0801BBFC:
	movs r0, #1
_0801BBFE:
	bx lr

	thumb_func_start sub_801BC00
sub_801BC00: @ 0x0801BC00
	push {r4, r5, lr}
	ldr r4, _0801BC50 @ =gScriptContext
	ldr r0, [r4]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	bl sub_8019FF8
	adds r3, r0, #0
	cmp r3, #0xff
	beq _0801BC32
	ldr r0, [r4]
	movs r2, #3
	ldrh r0, [r0]
	ands r2, r0
	lsls r2, r2, #0xc
	ldr r0, _0801BC54 @ =gMapMarker
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _0801BC58 @ =0x0000CFFF
	ldrh r5, [r1, #0xa]
	ands r0, r5
	adds r0, r0, r2
	strh r0, [r1, #0xa]
_0801BC32:
	ldr r1, _0801BC54 @ =gMapMarker
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0, #2]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BC50: .4byte gScriptContext
_0801BC54: .4byte gMapMarker
_0801BC58: .4byte 0x0000CFFF

	thumb_func_start sub_801BC5C
sub_801BC5C: @ 0x0801BC5C
	push {r4, lr}
	ldr r4, _0801BC8C @ =gScriptContext
	ldr r3, _0801BC90 @ =gMain
	ldrh r0, [r3, #0x34]
	strh r0, [r3, #0x38]
	ldr r1, [r4]
	ldrh r0, [r1]
	strh r0, [r3, #0x34]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0801BC94
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	b _0801BCA0
	.align 2, 0
_0801BC8C: .4byte gScriptContext
_0801BC90: .4byte gMain
_0801BC94:
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
_0801BCA0:
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_801BCB0
sub_801BCB0: @ 0x0801BCB0
	push {r4, lr}
	ldr r4, _0801BCD4 @ =gScriptContext
	ldrh r1, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _0801BCE0
	ldr r0, _0801BCD8 @ =gAnimation+0x44
	ldr r1, _0801BCDC @ =gMain
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
	ldr r0, [r4]
	ldrh r1, [r4, #0x12]
	ldrh r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	b _0801BCE2
	.align 2, 0
_0801BCD4: .4byte gScriptContext
_0801BCD8: .4byte gAnimation+0x44
_0801BCDC: .4byte gMain
_0801BCE0:
	subs r0, r1, #1
_0801BCE2:
	strh r0, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _0801BD08
	ldr r0, _0801BD00 @ =gAnimation+0x44
	ldr r1, _0801BD04 @ =gMain
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	b _0801BD0A
	.align 2, 0
_0801BD00: .4byte gAnimation+0x44
_0801BD04: .4byte gMain
_0801BD08:
	movs r0, #1
_0801BD0A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_801BD10
sub_801BD10: @ 0x0801BD10
	push {r4, r5, lr}
	ldr r4, _0801BDA0 @ =gScriptContext
	ldr r3, _0801BDA4 @ =gMain
	ldr r2, [r4]
	ldrh r1, [r2]
	movs r5, #0x94
	lsls r5, r5, #2
	adds r0, r3, r5
	strb r1, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r5, #0xa0
	adds r1, r3, r5
	adds r3, r0, r1
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	adds r0, r2, #2
	str r0, [r4]
	ldrh r0, [r2, #2]
	ldr r2, _0801BDA8 @ =0x0000FFFF
	cmp r0, r2
	beq _0801BD4A
	strb r0, [r3, #9]
	strb r0, [r3, #8]
_0801BD4A:
	ldr r1, [r4]
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	cmp r0, r2
	beq _0801BD58
	strh r0, [r3, #6]
_0801BD58:
	ldr r1, [r4]
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	cmp r0, r2
	beq _0801BD66
	strh r0, [r3, #4]
_0801BD66:
	ldr r1, [r4]
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	cmp r0, r2
	beq _0801BD74
	strh r0, [r3, #0xa]
_0801BD74:
	ldr r1, [r4]
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	cmp r0, r2
	beq _0801BD82
	strh r0, [r3, #0xc]
_0801BD82:
	ldr r1, [r4]
	adds r0, r1, #2
	str r0, [r4]
	ldrh r0, [r1, #2]
	cmp r0, r2
	beq _0801BD90
	strh r0, [r3, #0x12]
_0801BD90:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BDA0: .4byte gScriptContext
_0801BDA4: .4byte gMain
_0801BDA8: .4byte 0x0000FFFF

	thumb_func_start sub_801BDAC
sub_801BDAC: @ 0x0801BDAC
	push {r4, lr}
	sub sp, #4
	ldr r4, _0801BDE0 @ =gScriptContext
	ldr r3, [r4]
	ldrh r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0801BDE4 @ =gUnknown_03003960
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0
	strh r1, [r2]
	ldr r1, _0801BDE8 @ =0x040000D4
	str r2, [r1]
	str r0, [r1, #4]
	ldr r0, _0801BDEC @ =0x81000014
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, #2
	str r3, [r4]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BDE0: .4byte gScriptContext
_0801BDE4: .4byte gUnknown_03003960
_0801BDE8: .4byte 0x040000D4
_0801BDEC: .4byte 0x81000014

	thumb_func_start sub_801BDF0
sub_801BDF0: @ 0x0801BDF0
	push {r4, lr}
	ldr r4, _0801BE10 @ =gScriptContext
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r2, r1, #2
	str r2, [r4]
	ldrh r1, [r1, #2]
	bl sub_800E364
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE10: .4byte gScriptContext

	thumb_func_start sub_801BE14
sub_801BE14: @ 0x0801BE14
	push {r4, lr}
	ldr r4, _0801BE34 @ =gScriptContext
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r2, r1, #2
	str r2, [r4]
	ldrh r1, [r1, #2]
	bl SetRoomSeq
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE34: .4byte gScriptContext

	thumb_func_start sub_801BE38
sub_801BE38: @ 0x0801BE38
	push {r4, lr}
	ldr r4, _0801BE68 @ =gScriptContext
	ldr r0, _0801BE6C @ =gMain
	ldr r1, _0801BE70 @ =0x00000256
	adds r0, r0, r1
	ldr r1, [r4]
	ldrb r2, [r0]
	ldrb r1, [r1]
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #1
	bl SetPsycheLockStopPresentButtonsState
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #4
	bl sub_8017154
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE68: .4byte gScriptContext
_0801BE6C: .4byte gMain
_0801BE70: .4byte 0x00000256

	thumb_func_start sub_801BE74
sub_801BE74: @ 0x0801BE74
	push {lr}
	ldr r0, _0801BE8C @ =gMain
	ldr r1, _0801BE90 @ =0x00000256
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #2
	bl SetPsycheLockStopPresentButtonsState
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801BE8C: .4byte gMain
_0801BE90: .4byte 0x00000256

	thumb_func_start sub_801BE94
sub_801BE94: @ 0x0801BE94
	push {r4, r5, lr}
	ldr r4, _0801BEC4 @ =gScriptContext
	ldr r0, _0801BEC8 @ =gMain
	ldr r3, [r4]
	ldrh r2, [r3]
	movs r5, #0x94
	lsls r5, r5, #2
	adds r1, r0, r5
	strb r2, [r1]
	ldr r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r1, _0801BECC @ =0x00090A04
	str r1, [r0, #8]
	ldr r1, _0801BED0 @ =0x00000257
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	adds r3, #2
	str r3, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BEC4: .4byte gScriptContext
_0801BEC8: .4byte gMain
_0801BECC: .4byte 0x00090A04
_0801BED0: .4byte 0x00000257

	thumb_func_start sub_801BED4
sub_801BED4: @ 0x0801BED4
	push {lr}
	bl ClearPsycheLockLocksAndChainsWithoutAnimating
	ldr r0, _0801BEEC @ =gMain
	ldr r1, _0801BEF0 @ =0x00000257
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801BEEC: .4byte gMain
_0801BEF0: .4byte 0x00000257

	thumb_func_start sub_801BEF4
sub_801BEF4: @ 0x0801BEF4
	push {r4, lr}
	ldr r4, _0801BF30 @ =gScriptContext
	ldr r0, _0801BF34 @ =gMain
	movs r1, #0xa4
	lsls r1, r1, #2
	adds r2, r0, r1
	ldrh r3, [r2]
	lsls r1, r3, #1
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r3, _0801BF38 @ =gUnknown_03003B90
	ldr r0, [r4]
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF30: .4byte gScriptContext
_0801BF34: .4byte gMain
_0801BF38: .4byte gUnknown_03003B90

	thumb_func_start sub_801BF3C
sub_801BF3C: @ 0x0801BF3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0801C010 @ =gScriptContext
	mov sb, r0
	movs r1, #0
	ldr r0, _0801C014 @ =gMain
	movs r3, #0xa4
	lsls r3, r3, #2
	adds r2, r0, r3
	mov ip, r0
	ldrh r7, [r2]
	cmp r1, r7
	bhs _0801BF8C
	movs r6, #0xa0
	lsls r6, r6, #2
	add r6, ip
	ldr r5, _0801C018 @ =gUnknown_03003B90
	adds r4, r2, #0
	movs r3, #0
_0801BF68:
	lsls r0, r1, #1
	adds r2, r0, r6
	mov r7, sb
	ldr r0, [r7]
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r7, [r2]
	ldrh r0, [r0]
	cmp r7, r0
	bne _0801BF80
	strh r3, [r2]
_0801BF80:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4]
	cmp r1, r0
	blo _0801BF68
_0801BF8C:
	movs r1, #0
	movs r0, #0xa4
	lsls r0, r0, #2
	add r0, ip
	ldrh r2, [r0]
	cmp r1, r2
	bhs _0801BFEA
	movs r3, #0xa0
	lsls r3, r3, #2
	add r3, ip
	mov r8, r3
	adds r7, r0, #0
	mov sl, r7
_0801BFA6:
	lsls r0, r1, #1
	add r0, r8
	ldrh r0, [r0]
	adds r5, r1, #1
	cmp r0, #0
	bne _0801BFE0
	lsls r0, r5, #0x10
	lsrs r2, r0, #0x10
	adds r3, r1, #0
	ldrh r0, [r7]
	cmp r2, r0
	bhs _0801BFE0
	ldr r4, _0801C01C @ =gUnknown_03003A30
	mov r6, sl
_0801BFC2:
	lsls r1, r3, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r6]
	cmp r2, r1
	blo _0801BFC2
_0801BFE0:
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	ldrh r2, [r7]
	cmp r1, r2
	blo _0801BFA6
_0801BFEA:
	movs r1, #0xa4
	lsls r1, r1, #2
	add r1, ip
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	mov r3, sb
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C010: .4byte gScriptContext
_0801C014: .4byte gMain
_0801C018: .4byte gUnknown_03003B90
_0801C01C: .4byte gUnknown_03003A30

	thumb_func_start sub_801C020
sub_801C020: @ 0x0801C020
	push {lr}
	ldr r2, _0801C038 @ =gScriptContext
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r0, #5
	bhi _0801C0A4
	lsls r0, r0, #2
	ldr r1, _0801C03C @ =_0801C040
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C038: .4byte gScriptContext
_0801C03C: .4byte _0801C040
_0801C040: @ jump table
	.4byte _0801C058 @ case 0
	.4byte _0801C064 @ case 1
	.4byte _0801C072 @ case 2
	.4byte _0801C084 @ case 3
	.4byte _0801C08C @ case 4
	.4byte _0801C098 @ case 5
_0801C058:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xf0
	ldrb r3, [r1]
	ands r0, r3
	b _0801C0A2
_0801C064:
	adds r3, r2, #0
	adds r3, #0x22
	movs r0, #0xf0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #1
	b _0801C07E
_0801C072:
	adds r3, r2, #0
	adds r3, #0x22
	movs r0, #0xf0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #2
_0801C07E:
	orrs r0, r1
	strb r0, [r3]
	b _0801C0A4
_0801C084:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0x10
	b _0801C09E
_0801C08C:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xf
	ldrb r3, [r1]
	ands r0, r3
	b _0801C0A2
_0801C098:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0x20
_0801C09E:
	ldrb r3, [r1]
	orrs r0, r3
_0801C0A2:
	strb r0, [r1]
_0801C0A4:
	ldr r0, [r2]
	adds r0, #2
	str r0, [r2]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801C0C0
	bl sub_8017BA8
	bl sub_8017BC0
_0801C0C0:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801C0C8
sub_801C0C8: @ 0x0801C0C8
	push {r4, lr}
	ldr r3, _0801C0F4 @ =gScriptContext
	movs r0, #0x25
	adds r0, r0, r3
	mov ip, r0
	movs r0, #0xf
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	ldr r1, [r3]
	ldrb r4, [r1]
	lsls r2, r4, #4
	adds r0, r0, r2
	mov r2, ip
	strb r0, [r2]
	adds r1, #2
	str r1, [r3]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801C0F4: .4byte gScriptContext

	thumb_func_start sub_801C0F8
sub_801C0F8: @ 0x0801C0F8
	ldr r3, _0801C134 @ =gScriptContext
	ldr r2, [r3]
	ldrh r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _0801C138 @ =gUnknown_03003960
	adds r1, r1, r0
	adds r0, r2, #2
	str r0, [r3]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x1c]
	ldr r2, [r3]
	adds r0, r2, #2
	str r0, [r3]
	ldrh r0, [r2, #2]
	strh r0, [r1, #0x20]
	ldr r2, [r3]
	adds r0, r2, #2
	str r0, [r3]
	ldrh r0, [r2, #2]
	strh r0, [r1, #0x10]
	movs r0, #1
	str r0, [r1, #0x18]
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	bx lr
	.align 2, 0
_0801C134: .4byte gScriptContext
_0801C138: .4byte gUnknown_03003960

	thumb_func_start sub_801C13C
sub_801C13C: @ 0x0801C13C
	push {r4, lr}
	ldr r3, _0801C18C @ =gScriptContext
	ldr r2, [r3]
	ldrh r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0801C190 @ =gUnknown_03003960
	adds r0, r0, r1
	mov ip, r0
	adds r0, r2, #2
	str r0, [r3]
	mov r0, ip
	adds r0, #0x1c
	mov r4, ip
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #2]
	strb r1, [r0]
	ldr r2, [r3]
	adds r0, r2, #2
	str r0, [r3]
	ldr r0, [r4, #0x18]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x20
	adds r1, r1, r0
	ldrh r0, [r2, #2]
	strh r0, [r1]
	ldr r0, [r4, #0x18]
	adds r0, #1
	str r0, [r4, #0x18]
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801C18C: .4byte gScriptContext
_0801C190: .4byte gUnknown_03003960

	thumb_func_start sub_801C194
sub_801C194: @ 0x0801C194
	push {lr}
	movs r0, #8
	movs r1, #0
	bl SetPsycheLockState
	bl UpdatePsycheLockAnimation
	ldr r0, _0801C1B8 @ =gMain
	movs r1, #0
	strh r1, [r0, #0x34]
	ldr r1, _0801C1BC @ =0x00000257
	adds r0, r0, r1
	movs r1, #2
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801C1B8: .4byte gMain
_0801C1BC: .4byte 0x00000257

	thumb_func_start sub_801C1C0
sub_801C1C0: @ 0x0801C1C0
	push {lr}
	movs r0, #9
	movs r1, #0
	bl SetPsycheLockState
	bl UpdatePsycheLockAnimation
	ldr r0, _0801C1E0 @ =gMain
	ldr r1, _0801C1E4 @ =0x00000257
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801C1E0: .4byte gMain
_0801C1E4: .4byte 0x00000257

	thumb_func_start sub_801C1E8
sub_801C1E8: @ 0x0801C1E8
	push {r4, lr}
	ldr r2, _0801C204 @ =gScriptContext
	ldr r1, [r2]
	ldr r0, _0801C208 @ =gUnknown_03003960
	ldr r4, _0801C20C @ =0xFFFFFE58
	adds r3, r0, r4
	ldr r0, _0801C210 @ =0x00040A04
	str r0, [r3]
	adds r1, #2
	str r1, [r2]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801C204: .4byte gScriptContext
_0801C208: .4byte gUnknown_03003960
_0801C20C: .4byte 0xFFFFFE58
_0801C210: .4byte 0x00040A04

	thumb_func_start sub_801C214
sub_801C214: @ 0x0801C214
	ldr r3, _0801C254 @ =gScriptContext
	ldr r0, _0801C258 @ =gMain
	mov ip, r0
	ldr r2, [r3]
	ldrh r1, [r2]
	movs r0, #0x94
	lsls r0, r0, #2
	add r0, ip
	strb r1, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0xd8
	lsls r1, r1, #1
	add r1, ip
	adds r0, r0, r1
	adds r1, r2, #2
	str r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x14]
	ldr r2, [r3]
	adds r1, r2, #2
	str r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x16]
	ldr r0, [r3]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	bx lr
	.align 2, 0
_0801C254: .4byte gScriptContext
_0801C258: .4byte gMain

	thumb_func_start sub_801C25C
sub_801C25C: @ 0x0801C25C
	push {lr}
	bl LoadCurrentScriptIntoRam
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_801C268
sub_801C268: @ 0x0801C268
	push {lr}
	ldr r0, _0801C284 @ =gAnimation
	ldr r1, [r0, #0x44]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0, #0x44]
	movs r0, #4
	bl sub_8016FEC
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801C284: .4byte gAnimation

	thumb_func_start sub_801C288
sub_801C288: @ 0x0801C288
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0801C2D4 @ =gScriptContext
	mov r1, sp
	ldr r5, [r4]
	ldrh r2, [r5]
	lsrs r0, r2, #8
	strh r0, [r1]
	movs r2, #0xff
	adds r0, r2, #0
	ldrh r3, [r5]
	ands r0, r3
	strh r0, [r1, #2]
	adds r6, r5, #2
	str r6, [r4]
	ldrh r3, [r5, #2]
	lsrs r0, r3, #8
	strh r0, [r1, #4]
	mov r0, sp
	ldrh r1, [r5, #2]
	ands r2, r1
	strh r2, [r0, #6]
	ldrh r3, [r0, #4]
	lsrs r0, r3, #3
	cmp r0, #0
	beq _0801C2D8
	movs r0, #0xf0
	ands r0, r3
	lsrs r0, r0, #1
	adds r2, r4, #0
	adds r2, #0x2e
	movs r1, #0xf
	ldrb r3, [r2]
	ands r1, r3
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #2
	b _0801C31C
	.align 2, 0
_0801C2D4: .4byte gScriptContext
_0801C2D8:
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r1, r4, #0
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xf0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r3
	strb r0, [r1]
	adds r1, #1
	strb r2, [r1]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #1
	bne _0801C310
	subs r0, r5, #2
	str r0, [r4]
	bl sub_8016F74
	movs r0, #1
	b _0801C320
_0801C310:
	cmp r1, #2
	bne _0801C318
	bl sub_8016F74
_0801C318:
	ldr r0, [r4]
	adds r0, #2
_0801C31C:
	str r0, [r4]
	movs r0, #0
_0801C320:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_801C328
sub_801C328: @ 0x0801C328
	push {lr}
	ldr r0, _0801C33C @ =gScriptContext
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8017AB4
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801C33C: .4byte gScriptContext

	thumb_func_start sub_801C340
sub_801C340: @ 0x0801C340
	ldr r3, _0801C368 @ =gScriptContext
	ldr r0, [r3]
	ldrh r1, [r0]
	adds r2, r3, #0
	adds r2, #0x46
	strh r1, [r2]
	adds r1, r0, #2
	ldrh r2, [r0, #2]
	adds r0, r3, #0
	adds r0, #0x48
	strh r2, [r0]
	ldrh r0, [r1, #2]
	adds r2, r3, #0
	adds r2, #0x4a
	strh r0, [r2]
	adds r1, #4
	str r1, [r3]
	movs r0, #0
	bx lr
	.align 2, 0
_0801C368: .4byte gScriptContext

	thumb_func_start sub_801C36C
sub_801C36C: @ 0x0801C36C
	push {r4, r5, lr}
	ldr r5, _0801C394 @ =gScriptContext
	ldr r3, [r5]
	ldrh r0, [r3]
	cmp r0, #0
	bne _0801C44A
	ldr r0, _0801C398 @ =gUnknown_03002920
	ldr r1, _0801C39C @ =0x0000024E
	adds r4, r0, r1
	ldrb r1, [r4]
	adds r2, r0, #0
	cmp r1, #0xff
	bne _0801C3D4
	ldrh r0, [r5, #0xc]
	cmp r0, #0xd9
	beq _0801C3A0
	cmp r0, #0xe4
	beq _0801C3BC
	b _0801C44A
	.align 2, 0
_0801C394: .4byte gScriptContext
_0801C398: .4byte gUnknown_03002920
_0801C39C: .4byte 0x0000024E
_0801C3A0:
	ldr r0, _0801C3B8 @ =0x0000024A
	adds r1, r2, r0
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #0x25
	strb r0, [r4]
	movs r0, #0x95
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0xda
	b _0801C448
	.align 2, 0
_0801C3B8: .4byte 0x0000024A
_0801C3BC:
	ldr r0, _0801C3D0 @ =0x0000024A
	adds r1, r2, r0
	movs r0, #0x1f
	strb r0, [r1]
	movs r0, #0x26
	strb r0, [r4]
	movs r0, #0x95
	lsls r0, r0, #2
	b _0801C444
	.align 2, 0
_0801C3D0: .4byte 0x0000024A
_0801C3D4:
	ldr r1, _0801C3EC @ =0x0000024F
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0801C44A
	ldrh r0, [r5, #0xc]
	cmp r0, #0xd9
	beq _0801C3F0
	cmp r0, #0xe4
	beq _0801C404
	b _0801C418
	.align 2, 0
_0801C3EC: .4byte 0x0000024F
_0801C3F0:
	ldr r1, _0801C400 @ =0x0000024A
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0801C418
	adds r0, r3, #2
	b _0801C44E
	.align 2, 0
_0801C400: .4byte 0x0000024A
_0801C404:
	ldr r1, _0801C414 @ =0x0000024A
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne _0801C418
	adds r0, r3, #2
	b _0801C44E
	.align 2, 0
_0801C414: .4byte 0x0000024A
_0801C418:
	ldr r0, _0801C458 @ =0x0000024A
	adds r1, r2, r0
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _0801C45C @ =0x0000024E
	adds r1, r2, r0
	movs r0, #0x25
	strb r0, [r1]
	movs r0, #0x95
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0xda
	strh r0, [r1]
	ldr r0, _0801C460 @ =0x0000024B
	adds r1, r2, r0
	movs r0, #0x1f
	strb r0, [r1]
	ldr r0, _0801C464 @ =0x0000024F
	adds r1, r2, r0
	movs r0, #0x26
	strb r0, [r1]
	ldr r0, _0801C468 @ =0x00000256
_0801C444:
	adds r1, r2, r0
	movs r0, #0xdb
_0801C448:
	strh r0, [r1]
_0801C44A:
	ldr r0, [r5]
	adds r0, #2
_0801C44E:
	str r0, [r5]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C458: .4byte 0x0000024A
_0801C45C: .4byte 0x0000024E
_0801C460: .4byte 0x0000024B
_0801C464: .4byte 0x0000024F
_0801C468: .4byte 0x00000256

	thumb_func_start sub_801C46C
sub_801C46C: @ 0x0801C46C
	ldr r3, _0801C480 @ =gScriptContext
	ldr r2, _0801C484 @ =gMain
	ldr r0, [r3]
	ldrh r1, [r0]
	strh r1, [r2, #0x1e]
	adds r0, #2
	str r0, [r3]
	movs r0, #0
	bx lr
	.align 2, 0
_0801C480: .4byte gScriptContext
_0801C484: .4byte gMain

	thumb_func_start sub_801C488
sub_801C488: @ 0x0801C488
	push {lr}
	ldr r2, _0801C4A0 @ =gScriptContext
	ldr r0, [r2]
	ldrh r1, [r0]
	cmp r1, #1
	beq _0801C4B0
	cmp r1, #1
	bgt _0801C4A4
	cmp r1, #0
	beq _0801C4AA
	b _0801C4D8
	.align 2, 0
_0801C4A0: .4byte gScriptContext
_0801C4A4:
	cmp r1, #2
	beq _0801C4B6
	b _0801C4D8
_0801C4AA:
	bl sub_801C4E4
	b _0801C4DA
_0801C4B0:
	bl sub_801C66C
	b _0801C4DA
_0801C4B6:
	adds r0, #2
	str r0, [r2]
	ldr r2, _0801C4E0 @ =gUnknown_030070B0
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	movs r3, #0
_0801C4C8:
	lsls r0, r1, #1
	adds r0, r0, r2
	strh r3, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0801C4C8
_0801C4D8:
	movs r0, #0
_0801C4DA:
	pop {r1}
	bx r1
	.align 2, 0
_0801C4E0: .4byte gUnknown_030070B0

	thumb_func_start sub_801C4E4
sub_801C4E4: @ 0x0801C4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r6, _0801C530 @ =gScriptContext
	ldrh r4, [r6, #0x12]
	ldrb r0, [r6, #0x12]
	cmp r0, #0
	bne _0801C58C
	movs r5, #0
	ldr r0, _0801C534 @ =gUnknown_0802872E
	ldr r2, _0801C538 @ =gUnknown_030070B0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r7, r0, #0
	adds r3, r2, #0
	ldrb r1, [r1]
	cmp r5, r1
	blo _0801C510
	b _0801C658
_0801C510:
	lsls r0, r5, #1
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, #0
	bne _0801C568
	bl Random
	movs r1, #3
	ands r1, r0
	cmp r1, #1
	beq _0801C550
	cmp r1, #1
	bgt _0801C53C
	cmp r1, #0
	beq _0801C546
	b _0801C564
	.align 2, 0
_0801C530: .4byte gScriptContext
_0801C534: .4byte gUnknown_0802872E
_0801C538: .4byte gUnknown_030070B0
_0801C53C:
	cmp r1, #2
	beq _0801C558
	cmp r1, #3
	beq _0801C560
	b _0801C564
_0801C546:
	ldr r0, _0801C54C @ =0x000001CF
	b _0801C562
	.align 2, 0
_0801C54C: .4byte 0x000001CF
_0801C550:
	ldr r0, _0801C554 @ =0x0000110A
	b _0801C562
	.align 2, 0
_0801C554: .4byte 0x0000110A
_0801C558:
	ldr r0, _0801C55C @ =0x00002255
	b _0801C562
	.align 2, 0
_0801C55C: .4byte 0x00002255
_0801C560:
	ldr r0, _0801C580 @ =0x00003245
_0801C562:
	strh r0, [r4]
_0801C564:
	ldr r7, _0801C584 @ =gUnknown_0802872E
	ldr r3, _0801C588 @ =gUnknown_030070B0
_0801C568:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r3, #0
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r5, r0
	blo _0801C510
	b _0801C658
	.align 2, 0
_0801C580: .4byte 0x00003245
_0801C584: .4byte gUnknown_0802872E
_0801C588: .4byte gUnknown_030070B0
_0801C58C:
	ldr r2, _0801C5E8 @ =gUnknown_030070B0
	movs r0, #0xf0
	ands r0, r4
	lsrs r1, r0, #4
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r3, [r0]
	cmp r3, #0
	beq _0801C62C
	movs r0, #0xf
	ands r0, r4
	cmp r0, #8
	bne _0801C658
	adds r5, r1, #0
	adds r0, r6, #0
	adds r0, #0x25
	ldrb r1, [r0]
	mov sb, r1
	lsls r4, r5, #1
	adds r2, r4, r2
	ldrh r3, [r2]
	lsrs r1, r3, #0xc
	movs r3, #0
	mov r8, r3
	strb r1, [r0]
	adds r7, r0, #0
	cmp r5, #5
	bhi _0801C5F0
	ldr r0, _0801C5EC @ =0x00000FFF
	ldrh r2, [r2]
	ands r0, r2
	adds r1, r4, #2
	movs r2, #0
	bl PutCharInTextbox
	mov r0, r8
	strb r0, [r7]
	cmp r5, #0
	beq _0801C614
	adds r1, r4, #1
	movs r0, #0xf5
	movs r2, #0
	bl PutCharInTextbox
	b _0801C614
	.align 2, 0
_0801C5E8: .4byte gUnknown_030070B0
_0801C5EC: .4byte 0x00000FFF
_0801C5F0:
	ldr r0, _0801C628 @ =0x00000FFF
	ldrh r2, [r2]
	ands r0, r2
	subs r1, r5, #6
	lsls r4, r1, #1
	adds r1, r4, #2
	movs r2, #1
	bl PutCharInTextbox
	mov r1, r8
	strb r1, [r7]
	cmp r5, #6
	beq _0801C614
	adds r1, r4, #1
	movs r0, #0xf5
	movs r2, #1
	bl PutCharInTextbox
_0801C614:
	ldrh r0, [r6, #0x12]
	adds r0, #8
	strh r0, [r6, #0x12]
	mov r3, sb
	strb r3, [r7]
	movs r0, #0x2e
	bl PlaySE
	b _0801C658
	.align 2, 0
_0801C628: .4byte 0x00000FFF
_0801C62C:
	adds r0, r2, #0
	adds r0, #0x20
	strb r3, [r0]
	ldr r0, [r6]
	adds r0, #2
	str r0, [r6]
	ldr r2, _0801C654 @ =gMain
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r2, #0
	adds r0, #0xa6
	movs r1, #0x50
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r0, #0
	b _0801C660
	.align 2, 0
_0801C654: .4byte gMain
_0801C658:
	ldrh r0, [r6, #0x12]
	adds r0, #1
	strh r0, [r6, #0x12]
	movs r0, #1
_0801C660:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801C66C
sub_801C66C: @ 0x0801C66C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r6, _0801C698 @ =gScriptContext
	ldrh r1, [r6, #0x12]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0801C682
	b _0801C810
_0801C682:
	ldr r2, _0801C69C @ =gMain
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x63
	beq _0801C6A0
	bl sub_8019AAC
	movs r0, #1
	b _0801C8A0
	.align 2, 0
_0801C698: .4byte gScriptContext
_0801C69C: .4byte gMain
_0801C6A0:
	adds r1, #1
	movs r0, #0
	mov sb, r0
	strh r1, [r6, #0x12]
	movs r0, #4
	ands r1, r0
	adds r3, r2, #0
	adds r3, #0xa6
	cmp r1, #0
	beq _0801C6C8
	ldrh r1, [r3]
	subs r1, #1
	strh r1, [r3]
	adds r0, r2, #0
	adds r0, #0xa8
	strh r1, [r0]
	ldr r0, _0801C6DC @ =0x0000FFF0
	ldrh r1, [r6, #0x12]
	ands r0, r1
	strh r0, [r6, #0x12]
_0801C6C8:
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #1
	bgt _0801C6E4
	movs r0, #2
	bl sub_8016E74
	ldr r0, _0801C6E0 @ =gUnknown_030070B0
	ldrh r0, [r0, #0x16]
	b _0801C89E
	.align 2, 0
_0801C6DC: .4byte 0x0000FFF0
_0801C6E0: .4byte gUnknown_030070B0
_0801C6E4:
	ldr r5, _0801C72C @ =gUnknown_030070B0
	adds r4, r5, #0
	adds r4, #0x20
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801C6FA
	ldr r1, _0801C730 @ =gTextBoxCharacters
	ldr r0, _0801C734 @ =0x00003FFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
_0801C6FA:
	ldr r0, _0801C738 @ =gAnimation+0x44
	adds r1, r2, #0
	adds r1, #0xc6
	ldrh r1, [r1]
	bl sub_8012180
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r0]
	ldr r3, _0801C73C @ =0x00000FFF
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _0801C744
	movs r0, #2
	bl sub_8016E74
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _0801C726
	b _0801C89E
_0801C726:
	ldr r0, _0801C740 @ =gUnknown_0802871C
	b _0801C898
	.align 2, 0
_0801C72C: .4byte gUnknown_030070B0
_0801C730: .4byte gTextBoxCharacters
_0801C734: .4byte 0x00003FFF
_0801C738: .4byte gAnimation+0x44
_0801C73C: .4byte 0x00000FFF
_0801C740: .4byte gUnknown_0802871C
_0801C744:
	adds r1, r6, #0
	adds r1, #0x25
	ldrb r0, [r1]
	mov r8, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x1c
	strb r0, [r1]
	adds r7, r1, #0
	ldrb r1, [r4]
	cmp r1, #5
	bhi _0801C786
	lsls r1, r1, #1
	adds r2, r1, r5
	adds r0, r3, #0
	ldrh r2, [r2]
	ands r0, r2
	adds r1, #2
	movs r2, #0
	bl PutCharInTextbox
	mov r2, sb
	strb r2, [r7]
	ldrb r0, [r4]
	cmp r0, #0
	beq _0801C7B6
	ldrb r4, [r4]
	lsls r1, r4, #1
	adds r1, #1
	movs r0, #0xf5
	movs r2, #0
	bl PutCharInTextbox
	b _0801C7B6
_0801C786:
	ldrb r1, [r4]
	lsls r2, r1, #1
	adds r2, r2, r5
	adds r0, r3, #0
	ldrh r2, [r2]
	ands r0, r2
	lsls r1, r1, #1
	subs r1, #0xa
	movs r2, #1
	bl PutCharInTextbox
	mov r3, sb
	strb r3, [r7]
	ldrb r0, [r4]
	cmp r0, #6
	beq _0801C7B6
	adds r1, r0, #0
	subs r1, #6
	lsls r1, r1, #1
	adds r1, #1
	movs r0, #0xf5
	movs r2, #1
	bl PutCharInTextbox
_0801C7B6:
	mov r1, r8
	strb r1, [r7]
	movs r3, #0
	ldr r2, _0801C804 @ =gUnknown_030070B0
	mov ip, r2
	mov r4, ip
	ldr r7, _0801C808 @ =0x00000FFF
	ldr r5, _0801C80C @ =gUnknown_0802872E
_0801C7C6:
	adds r1, r3, r5
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0801C7EA
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r4
	adds r0, r7, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801C7EA
	subs r0, r2, #1
	mov r1, ip
	adds r1, #0x20
	ldrb r2, [r1]
	cmp r0, r2
	beq _0801C844
_0801C7EA:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0801C7C6
	mov r1, ip
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x44
	b _0801C85C
	.align 2, 0
_0801C804: .4byte gUnknown_030070B0
_0801C808: .4byte 0x00000FFF
_0801C80C: .4byte gUnknown_0802872E
_0801C810:
	movs r0, #0xff
	ands r0, r1
	subs r0, #0x10
	cmp r0, #0xf
	bgt _0801C822
	adds r0, r1, #1
	strh r0, [r6, #0x12]
	movs r0, #1
	b _0801C8A0
_0801C822:
	movs r0, #2
	bl sub_8016E74
	ldr r0, _0801C840 @ =gMain
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x63
	beq _0801C868
	bl sub_8019BEC
	movs r0, #1
	b _0801C8A0
	.align 2, 0
_0801C840: .4byte gMain
_0801C844:
	adds r0, r3, #1
	strb r0, [r1]
	ldrh r0, [r6, #0x12]
	adds r0, #0x10
	movs r1, #0
	strh r0, [r6, #0x12]
	ldr r0, _0801C864 @ =gMain
	movs r6, #0x96
	lsls r6, r6, #2
	adds r0, r0, r6
	strb r1, [r0]
	movs r0, #0x48
_0801C85C:
	bl PlaySE
	movs r0, #1
	b _0801C8A0
	.align 2, 0
_0801C864: .4byte gMain
_0801C868:
	movs r3, #0
	ldr r0, _0801C8AC @ =gUnknown_030070B0
	mov ip, r0
	ldr r5, _0801C8B0 @ =gUnknown_0802871C
	ldr r2, _0801C8B4 @ =gTextBoxCharacters
	ldr r4, _0801C8B8 @ =0x00003FFF
_0801C874:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r1, r4, #0
	ldrh r6, [r0]
	ands r1, r6
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0801C874
	mov r0, ip
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r5
_0801C898:
	ldrh r0, [r0]
	bl ChangeScriptSection
_0801C89E:
	movs r0, #0
_0801C8A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C8AC: .4byte gUnknown_030070B0
_0801C8B0: .4byte gUnknown_0802871C
_0801C8B4: .4byte gTextBoxCharacters
_0801C8B8: .4byte 0x00003FFF
