	.include "asm/macros.inc"
	.syntax unified

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
	ldr r1, _080030BC @ =eBGDecompBuffer
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
	ldr r0, _080030C4 @ =gTilemapBuffer
	adds r3, r1, r0
	str r2, [r4]
	str r3, [r4, #4]
	ldr r2, _080030C8 @ =0x8000001F
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080030CC @ =gBG3MapBuffer
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
	ldr r1, _080030BC @ =eBGDecompBuffer
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
	ldr r0, _080030CC @ =gBG3MapBuffer
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
_080030BC: .4byte eBGDecompBuffer
_080030C0: .4byte gUnknown_03001082
_080030C4: .4byte gTilemapBuffer
_080030C8: .4byte 0x8000001F
_080030CC: .4byte gBG3MapBuffer
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
	ldr r0, _08003308 @ =gBG3MapBuffer
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
	ldr r7, _08003310 @ =eBGDecompBuffer
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
	ldr r7, _08003314 @ =gTilemapBuffer
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
	ldr r7, _08003310 @ =eBGDecompBuffer
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
	ldr r0, _08003308 @ =gBG3MapBuffer
	adds r0, #0x7e
	mov r8, r0
_080032A2:
	lsls r0, r6, #6
	ldr r1, _08003308 @ =gBG3MapBuffer
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
_08003308: .4byte gBG3MapBuffer
_0800330C: .4byte 0x040000D4
_08003310: .4byte eBGDecompBuffer
_08003314: .4byte gTilemapBuffer
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
	ldr r2, _080035AC @ =gBG3MapBuffer
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
_080035AC: .4byte gBG3MapBuffer
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
	ldr r1, _0800370C @ =gBG3MapBuffer
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
	ldr r1, _0800370C @ =gBG3MapBuffer
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
_0800370C: .4byte gBG3MapBuffer
_08003710:
	movs r2, #0
	ldr r0, _08003778 @ =gBG3MapBuffer
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
_08003778: .4byte gBG3MapBuffer
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
	bl bg256_right_scroll
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
	bl bg256_right_scroll_end
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
	bl bg256_left_scroll
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
	bl bg256_left_scroll_end
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
	bl bg256_down_scroll
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
	bl bg256_down_scroll_end
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
	bl bg256_up_scroll
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
	bl bg256_up_scroll_end
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
	ldr r0, _08003C84 @ =eBGDecompBuffer
	b _08003CC0
	.align 2, 0
_08003C84: .4byte eBGDecompBuffer
_08003C88:
	lsrs r0, r6, #2
	ldr r1, _08003C90 @ =eBGDecompBuffer
	adds r0, r0, r1
	b _08003CC0
	.align 2, 0
_08003C90: .4byte eBGDecompBuffer
_08003C94:
	ldr r0, _08003C98 @ =eBGDecompBuffer
	b _08003CC0
	.align 2, 0
_08003C98: .4byte eBGDecompBuffer
_08003C9C:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08003CA8 @ =eBGDecompBuffer
	adds r0, r0, r1
	b _08003CC0
	.align 2, 0
_08003CA8: .4byte eBGDecompBuffer
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
	ldr r0, _08003E88 @ =eBGDecompBuffer
	str r0, [r1, #0x54]
	b _08003EB8
	.align 2, 0
_08003E84: .4byte gMain
_08003E88: .4byte eBGDecompBuffer
_08003E8C:
	ldr r1, _08003E9C @ =gMain
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #1
_08003E94:
	ldr r2, _08003EA0 @ =eBGDecompBuffer
	adds r0, r0, r2
	str r0, [r1, #0x54]
	b _08003EB8
	.align 2, 0
_08003E9C: .4byte gMain
_08003EA0: .4byte eBGDecompBuffer
_08003EA4:
	ldr r1, _08003EAC @ =gMain
	ldr r0, _08003EB0 @ =gUnknown_020365C0
	str r0, [r1, #0x54]
	b _08003EB8
	.align 2, 0
_08003EAC: .4byte gMain
_08003EB0: .4byte gUnknown_020365C0
_08003EB4:
	ldr r0, _08003EF4 @ =eBGDecompBuffer
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
_08003EF4: .4byte eBGDecompBuffer
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
	ldr r0, _08003FD0 @ =gBG0MapBuffer
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
_08003FD0: .4byte gBG0MapBuffer
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
	ldr r0, _080040A4 @ =gAnimation
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
_080040A4: .4byte gAnimation
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
	ldr r4, _080041A4 @ =gBG2MapBuffer
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
_080041A4: .4byte gBG2MapBuffer
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
	bl LoadCounselBenchGraphics
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
	ldr r2, _08004264 @ =gAnimation
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
_08004264: .4byte gAnimation
_08004268:
	cmp r0, #0x11
	beq _0800427E
	b _0800428E
_0800426E:
	bl LoadCounselBenchGraphics
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08004312
_0800427E:
	bl LoadCounselBenchGraphics
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
	bl LoadCounselBenchGraphics
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _080042E0
_080042D2:
	bl LoadCounselBenchGraphics
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
	ldr r2, _08004344 @ =gBG3MapBuffer
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
_08004344: .4byte gBG3MapBuffer
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
	ldr r5, _0800442C @ =gBG3MapBuffer
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
	ldr r0, _0800442C @ =gBG3MapBuffer
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
_0800442C: .4byte gBG3MapBuffer
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
	ldr r1, _08004588 @ =eBGDecompBuffer
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
	ldr r2, _0800458C @ =gBG3MapBuffer
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
_08004588: .4byte eBGDecompBuffer
_0800458C: .4byte gBG3MapBuffer
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
	ldr r2, _08004660 @ =gBG3MapBuffer
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
	ldr r7, _08004660 @ =gBG3MapBuffer
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
_08004660: .4byte gBG3MapBuffer
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
	ldr r2, _08004704 @ =gBG3MapBuffer
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
_08004704: .4byte gBG3MapBuffer
_08004708:
	movs r0, #0x20
	ands r0, r4
	ldr r1, _0800473C @ =gBG3MapBuffer
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
_0800473C: .4byte gBG3MapBuffer
_08004740:
	mov r1, ip
	adds r1, #0x3f
	movs r0, #0x2e
	strb r0, [r1]
_08004748:
	movs r3, #0
	ldr r2, _0800480C @ =gBG3MapBuffer
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
	ldr r5, _0800480C @ =gBG3MapBuffer
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
_0800480C: .4byte gBG3MapBuffer
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
	ldr r0, _0800486C @ =gBG2MapBuffer
	b _080048BE
	.align 2, 0
_08004860: .4byte gMain
_08004864: .4byte gScriptContext
_08004868: .4byte 0x040000D4
_0800486C: .4byte gBG2MapBuffer
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
	ldr r0, _08004894 @ =gBG2MapBuffer
	b _080048F2
	.align 2, 0
_0800488C: .4byte gUnknown_08023B98
_08004890: .4byte 0x040000D4
_08004894: .4byte gBG2MapBuffer
_08004898:
	ldr r1, _080048A0 @ =0x040000D4
	str r0, [r1]
	ldr r0, _080048A4 @ =gBG2MapBuffer
	b _08004916
	.align 2, 0
_080048A0: .4byte 0x040000D4
_080048A4: .4byte gBG2MapBuffer
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
	ldr r0, _080048D0 @ =gBG0MapBuffer
_080048BE:
	str r0, [r1, #4]
	ldr r0, _080048D4 @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r4, [r5, #0x38]
	b _0800492A
	.align 2, 0
_080048CC: .4byte 0x040000D4
_080048D0: .4byte gBG0MapBuffer
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
	ldr r0, _08004908 @ =gBG0MapBuffer
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
_08004908: .4byte gBG0MapBuffer
_0800490C: .4byte 0x80000010
_08004910:
	ldr r1, _08004934 @ =0x040000D4
	str r0, [r1]
	ldr r0, _08004938 @ =gBG0MapBuffer
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
_08004938: .4byte gBG0MapBuffer
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
	ldr r4, _08004B18 @ =gBG3MapBuffer
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
_08004B18: .4byte gBG3MapBuffer
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
	ldr r3, _08004EEC @ =eBGDecompBuffer
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
	ldr r0, _08004EF4 @ =gBG3MapBuffer
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
	ldr r7, _08004EF4 @ =gBG3MapBuffer
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
	ldr r0, _08004EF4 @ =gBG3MapBuffer
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
	ldr r7, _08004EF4 @ =gBG3MapBuffer
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
	bl LoadAndAdjustBGPaletteByMode
	b _08004F14
	.align 2, 0
_08004EDC: .4byte 0x040000D4
_08004EE0: .4byte 0x05000040
_08004EE4: .4byte 0x800000E0
_08004EE8: .4byte gMain
_08004EEC: .4byte eBGDecompBuffer
_08004EF0: .4byte 0x000003FF
_08004EF4: .4byte gBG3MapBuffer
_08004EF8: .4byte 0x0600F800
_08004EFC: .4byte 0x80000400
_08004F00: .4byte 0x00000507
_08004F04: .4byte 0x0000FFFE
_08004F08:
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl LoadAndAdjustBGPaletteByMode
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
	bl LoadAndAdjustCounselWitnessBenchPaletteByMode
	b _08004F48
	.align 2, 0
_08004F38: .4byte 0x0000FFFE
_08004F3C:
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl LoadAndAdjustCounselWitnessBenchPaletteByMode
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
	bl bg256_down_scroll
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
	bl bg256_up_scroll
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
	ldr r3, _0800521C @ =gBG1MapBuffer
	movs r2, #0
	ldr r4, _08005220 @ =0x000002BF
	adds r7, r1, #0
	adds r7, #0x23
	ldr r1, _08005224 @ =gTextboxTiles
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
_0800521C: .4byte gBG1MapBuffer
_08005220: .4byte 0x000002BF
_08005224: .4byte gTextboxTiles
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
	ldr r3, _0800529C @ =gBG1MapBuffer
	movs r2, #0
	ldr r4, _080052A0 @ =0x000001BF
	adds r7, r1, #0
	adds r7, #0x23
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r5, r3, r0
	adds r0, #0x80
	adds r6, r3, r0
	ldr r1, _080052A4 @ =gTextboxTiles
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
	ldr r1, _080052A4 @ =gTextboxTiles
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
_0800529C: .4byte gBG1MapBuffer
_080052A0: .4byte 0x000001BF
_080052A4: .4byte gTextboxTiles
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
	ldr r1, _08005358 @ =gBG1MapBuffer
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
	ldr r0, _08005358 @ =gBG1MapBuffer
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
_08005358: .4byte gBG1MapBuffer
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
	ldr r0, _080053F4 @ =gBG1MapBuffer
	ldr r3, _080053F8 @ =gTextboxTiles
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
_080053F4: .4byte gBG1MapBuffer
_080053F8: .4byte gTextboxTiles

	thumb_func_start SlideTextbox
SlideTextbox: @ 0x080053FC
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
	ldr r0, _08005458 @ =gBG1MapBuffer
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
_08005458: .4byte gBG1MapBuffer
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

	thumb_func_start LoadAndAdjustBGPaletteByMode
LoadAndAdjustBGPaletteByMode: @ 0x080057F4
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

	thumb_func_start LoadAndAdjustCurrentAnimation01PaletteByMode
LoadAndAdjustCurrentAnimation01PaletteByMode: @ 0x080058E8
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
	ldr r0, _0800594C @ =gAnimation
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
_0800594C: .4byte gAnimation
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

	thumb_func_start LoadAndAdjustCounselWitnessBenchPaletteByMode
LoadAndAdjustCounselWitnessBenchPaletteByMode: @ 0x0800598C
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

	thumb_func_start LoadAndAdjustAnimation10PaletteByMode
LoadAndAdjustAnimation10PaletteByMode: @ 0x080059FC
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
	ldr r0, _08005C48 @ =gAnimation
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
_08005C48: .4byte gAnimation
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
	ldr r2, _08005E38 @ =gBG2MapBuffer
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
	ldr r0, _08005E44 @ =gTilemapBuffer
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
_08005E38: .4byte gBG2MapBuffer
_08005E3C: .4byte 0x0000017F
_08005E40: .4byte 0x040000D4
_08005E44: .4byte gTilemapBuffer
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
	ldr r3, _08005F14 @ =gBG2MapBuffer
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
	ldr r6, _08005F1C @ =gTilemapBuffer
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
_08005F14: .4byte gBG2MapBuffer
_08005F18: .4byte 0x040000D4
_08005F1C: .4byte gTilemapBuffer
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
	ldr r1, _08006090 @ =gTilemapBuffer
	mov sl, r1
	ldr r2, _08006094 @ =gBG2MapBuffer
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
	ldr r2, _08006090 @ =gTilemapBuffer
	mov sb, r2
	ldr r0, _08006094 @ =gBG2MapBuffer
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
_08006090: .4byte gTilemapBuffer
_08006094: .4byte gBG2MapBuffer
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
	ldr r2, _08006100 @ =gBG3MapBuffer
	ldr r0, _08006104 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _08006108 @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_080060FC: .4byte gUnknown_080248F8
_08006100: .4byte gBG3MapBuffer
_08006104: .4byte 0x040000D4
_08006108: .4byte 0x800002C0

	thumb_func_start sub_800610C
sub_800610C: @ 0x0800610C
	ldr r1, _08006120 @ =gUnknown_08024E78
	ldr r2, _08006124 @ =gBG3MapBuffer
	ldr r0, _08006128 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0800612C @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_08006120: .4byte gUnknown_08024E78
_08006124: .4byte gBG3MapBuffer
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
	ldr r0, _0800617C @ =gBG1MapBuffer
	ldr r2, _08006180 @ =gTextboxTiles
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
_0800617C: .4byte gBG1MapBuffer
_08006180: .4byte gTextboxTiles
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
	ldr r0, _0800631C @ =gBG0MapBuffer
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
	ldr r0, _08006328 @ =gBG1MapBuffer
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
	ldr r0, _08006330 @ =gBG2MapBuffer
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
	ldr r0, _08006338 @ =gBG3MapBuffer
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
_0800631C: .4byte gBG0MapBuffer
_08006320: .4byte 0x0600E000
_08006324: .4byte 0x80000400
_08006328: .4byte gBG1MapBuffer
_0800632C: .4byte 0x0600E800
_08006330: .4byte gBG2MapBuffer
_08006334: .4byte 0x0600F000
_08006338: .4byte gBG3MapBuffer
_0800633C: .4byte 0x0600F800
_08006340: .4byte 0x04000008
