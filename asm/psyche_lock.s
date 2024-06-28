	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start InitPsycheLockChain
InitPsycheLockChain: @ 0x080146F8
	push {lr}
	strh r1, [r0, #2]
	strh r2, [r0]
	strh r3, [r0, #4]
	bl CopyPsycheLockChainBlocksToBGMapBuffer
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
	bl InitPsycheLockChain
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
	bl CopyPsycheLockChainBlocksToBGMapBuffer
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
	ldr r1, _08014894 @ =gBG0MapBuffer
	str r1, [r0, #4]
	ldr r3, _08014898 @ =0x81000400
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r2, [r1]
	str r1, [r0]
	ldr r1, _0801489C @ =gBG3MapBuffer
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
_08014894: .4byte gBG0MapBuffer
_08014898: .4byte 0x81000400
_0801489C: .4byte gBG3MapBuffer
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

	thumb_func_start CopyPsycheLockChainBlocksToBGMapBuffer
CopyPsycheLockChainBlocksToBGMapBuffer: @ 0x08014998
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
	ldr r7, _080149FC @ =gBG0MapBuffer
	str r7, [sp]
	movs r0, #1
	str r0, [sp, #0x10]
	b _08014A0C
	.align 2, 0
_080149F8: .4byte 0x0000FFF8
_080149FC: .4byte gBG0MapBuffer
_08014A00:
	movs r2, #8
	str r2, [sp, #8]
	ldr r3, _08014A70 @ =gBG3MapBuffer
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
_08014A70: .4byte gBG3MapBuffer
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
	bl PlaySE
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
	bl PlaySE
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
	bl PlaySE
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
	bl PlaySE
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
	bl PlaySE
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
	bl PlaySE
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
	bl PlaySE
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
	bl IsHPBarAnimating
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
	ldr r0, _08015600 @ =gBG0MapBuffer
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
_08015600: .4byte gBG0MapBuffer
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
	bl InitPsycheLockChain
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
	bl InitPsycheLockChain
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

	thumb_func_start LoadPsycheLockButtonGraphics
LoadPsycheLockButtonGraphics: @ 0x080158B0
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
	bl LoadPsycheLockButtonGraphics
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
	bl LoadPsycheLockButtonGraphics
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
