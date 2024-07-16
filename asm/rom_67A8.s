	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_80067A8
sub_80067A8: @ 0x080067A8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	bne _080067F4
	ldr r3, _080067E8 @ =gOamObjects+0x1A0
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
_080067E8: .4byte gOamObjects+0x1A0
_080067EC: .4byte gInvestigation
_080067F0: .4byte 0x00005030
_080067F4:
	ldr r3, _08006824 @ =gOamObjects+0x1A0
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
_08006824: .4byte gOamObjects+0x1A0
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
	ldr r2, _080068F4 @ =gOamObjects+0x1A0
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
_080068F4: .4byte gOamObjects+0x1A0
_080068F8: .4byte 0x00004070
_080068FC: .4byte 0x00008058
_08006900: .4byte 0x00002420
_08006904: .4byte 0x00008078
_08006908: .4byte 0x00004084
_0800690C: .4byte 0x00002030
_08006910: .4byte 0x00002038
_08006914: .4byte gInvestigation
