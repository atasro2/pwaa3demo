	.include "asm/macros.inc"
	.syntax unified

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
	bl DecompressBackgroundIntoBuffer
	movs r0, #6
	bl CopyBGDataToVram
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
	ldr r0, _080085B8 @ =eBGDecompBuffer
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
	bl PlaySE
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
_080085B8: .4byte eBGDecompBuffer
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

	thumb_func_start EpisodeClearedProcess
EpisodeClearedProcess: @ 0x08008708
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
	bl SaveGameData
	b _08008854
	.align 2, 0
_080087E4: .4byte 0x00002C54
_080087E8: .4byte gSaveDataBuffer
_080087EC: .4byte gUnknown_020000F6
_080087F0:
	ldr r1, _08008824 @ =0x040000D4
	ldr r0, _08008828 @ =gSaveVersion
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
_08008828: .4byte gSaveVersion
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	str r0, [sp, #8]
	ldrb r0, [r7, #0x17]
	adds r0, #0xd
	bl FindAnimationFromAnimId
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
	bl DestroyAnimation
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	str r0, [sp]
	bl DestroyAnimation
	movs r0, #9
	bl FindAnimationFromAnimId
	str r0, [sp]
	ldr r6, _08008B0C @ =gOamObjects+0x1D0
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
	bl DestroyAnimation
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	mov r0, sb
	strb r0, [r7, #0xa]
	b _08008D58
	.align 2, 0
_08008B0C: .4byte gOamObjects+0x1D0
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
	ldr r6, _08008BCC @ =gSineTable
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x10]
	mov r0, sl
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	bl fix_mul
	ldr r2, _08008BD0 @ =gOamObjects
	mov r8, r2
	strh r0, [r2, #6]
	movs r3, #0
	ldrsh r4, [r6, r3]
	mov r0, sl
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl fix_mul
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
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl fix_mul
	strh r0, [r4, #0x16]
	mov r3, sb
	movs r4, #0
	ldrsh r0, [r3, r4]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #0x10]
	bl fix_mul
	mov r1, r8
	strh r0, [r1, #0x1e]
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r2, #0
	strb r2, [r7, #0xa]
	b _08008D58
	.align 2, 0
_08008BCC: .4byte gSineTable
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
	ldr r7, _08008C24 @ =gSineTable
	ldrh r4, [r7]
	rsbs r4, r4, #0
	str r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	movs r1, #0
	ldrsh r0, [r3, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl fix_mul
	ldr r6, _08008C28 @ =gOamObjects
	strh r0, [r6, #0x16]
	ldr r2, _08008C2C @ =gUnknown_080264B0
	movs r3, #0
	ldrsh r5, [r2, r3]
	mov r4, r8
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	b _08008CFE
	.align 2, 0
_08008C24: .4byte gSineTable
_08008C28: .4byte gOamObjects
_08008C2C: .4byte gUnknown_080264B0
_08008C30:
	ldr r6, _08008C64 @ =gOamObjects+0x1D0
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
_08008C64: .4byte gOamObjects+0x1D0
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
	bl ChangeScriptSection
	ldr r6, _08008CBC @ =gOamObjects+0x1D0
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
_08008CBC: .4byte gOamObjects+0x1D0
_08008CC0: .4byte 0x0000FEFF
_08008CC4:
	ldr r7, _08008D08 @ =gSineTable
	ldrh r4, [r7]
	rsbs r4, r4, #0
	str r4, [sp, #0x24]
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl fix_mul
	ldr r6, _08008D0C @ =gOamObjects
	strh r0, [r6, #0x16]
	ldr r2, _08008D10 @ =gUnknown_080264B0
	movs r3, #0
	ldrsh r7, [r2, r3]
	movs r4, #0
	ldrsh r0, [r5, r4]
	bl fix_inverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r7, #0
_08008CFE:
	bl fix_mul
	strh r0, [r6, #0x1e]
	b _08008D58
	.align 2, 0
_08008D08: .4byte gSineTable
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
	bl PauseBGM
	movs r0, #0x2b
	bl PlaySE
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

	thumb_func_start SelectEpisodeProcess
SelectEpisodeProcess: @ 0x08008D7C
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
	bl FindAnimationFromAnimId
	str r0, [sp]
	movs r0, #0x10
	bl FindAnimationFromAnimId
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
	bl ChangeScriptSection
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldrb r0, [r6, #0x17]
	adds r0, #0x13
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x19
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x1a
	bl FindAnimationFromAnimId
	bl DestroyAnimation
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
	bl PlaySE
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	ldrb r0, [r6, #0x17]
	adds r0, #0x13
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x19
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x1a
	bl FindAnimationFromAnimId
	bl DestroyAnimation
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
	bl PlaySE
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
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x1a
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x2b
	bl PlaySE
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
	bl PlaySE
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
	bl FindAnimationFromAnimId
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #0xa
	bl FindAnimationFromAnimId
	str r0, [sp, #4]
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl FindAnimationFromAnimId
	str r0, [sp, #8]
	ldrb r0, [r6, #0x17]
	adds r0, #0x10
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #8
	bl FindAnimationFromAnimId
	str r0, [sp, #4]
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	bl FindAnimationFromAnimId
	str r0, [sp, #8]
	ldrb r0, [r6, #0x17]
	adds r0, #0xc
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #0xf
	bl FindAnimationFromAnimId
	str r0, [sp, #4]
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl FindAnimationFromAnimId
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
	bl DestroyAnimation
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
	bl DestroyAnimation
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
	bl FindAnimationFromAnimId
	str r0, [sp]
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	bl FindAnimationFromAnimId
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
	bl DestroyAnimation
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	movs r1, #0x78
	movs r2, #0x48
	bl sub_8012864
	b _08009506
_080094F4:
	adds r0, r2, #0
	bl DestroyAnimation
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
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xa
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xb
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xc
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xd
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xe
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xf
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x10
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x11
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x12
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x19
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x1a
_0800967A:
	bl FindAnimationFromAnimId
	bl DestroyAnimation
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
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xa
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xb
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xc
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xd
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xe
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0xf
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x10
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x11
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x12
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x19
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #0x1a
	bl FindAnimationFromAnimId
	bl DestroyAnimation
	movs r0, #1
	str r0, [r6, #8]
	b _08009850
_08009716:
	ldrb r0, [r6, #0x17]
	adds r0, #0xe
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
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
	bl FindAnimationFromAnimId
	str r0, [sp, #8]
	ldrb r0, [r6, #0x17]
	adds r0, #0xd
	bl FindAnimationFromAnimId
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
	bl ChangeScriptSection
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
	bl DestroyAnimation
_08009850:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009858: .4byte 0xFFFFFED0

	thumb_func_start ContinueSaveProcess
ContinueSaveProcess: @ 0x0800985C
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
	bl LoadSaveData
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
	bl DecompressBackgroundIntoBuffer
	movs r0, #6
	bl CopyBGDataToVram
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
	ldr r0, _080099E0 @ =gBG2MapBuffer
_08009964:
	strh r1, [r0]
	adds r0, #2
	adds r7, #1
	cmp r7, r2
	bls _08009964
	movs r0, #5
	movs r1, #8
	bl SlideInBG2Window
	movs r0, #0x31
	bl PlaySE
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
_080099E0: .4byte gBG2MapBuffer
_080099E4: .4byte gIORegisters
_080099E8: .4byte 0x00003E01
_080099EC:
	ldr r4, _08009A48 @ =gCourtRecord
	adds r0, r4, #0
	bl UpdateBG2Window
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
	bl ChangeScriptSection
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
	bl PlaySE
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
	bl PlaySE
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
	bl PlaySE
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
	ldr r2, _08009B54 @ =gOamObjects+0x130
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
_08009B54: .4byte gOamObjects+0x130
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
	ldr r2, _08009BD8 @ =gOamObjects+0x130
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
_08009BD8: .4byte gOamObjects+0x130
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
	bl GetBGPalettePtr
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
	ldr r0, _08009FE4 @ =gMapMarker
	str r0, [r5, #4]
	ldr r0, _08009FE8 @ =0x80000050
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	bl MakeMapMarkerSprites
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
	ldr r0, _08009FF0 @ =gBG1MapBuffer
	str r0, [r5, #4]
	ldr r1, _08009FF4 @ =0x80000400
	str r1, [r5, #8]
	ldr r0, [r5, #8]
	ldr r2, _08009FF8 @ =0x00000D78
	adds r0, r6, r2
	str r0, [r5]
	ldr r0, _08009FFC @ =gBG0MapBuffer
	str r0, [r5, #4]
	str r1, [r5, #8]
	ldr r0, [r5, #8]
	ldr r3, _0800A000 @ =gAnimation+0x44
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
_08009FE4: .4byte gMapMarker
_08009FE8: .4byte 0x80000050
_08009FEC: .4byte 0x00001578
_08009FF0: .4byte gBG1MapBuffer
_08009FF4: .4byte 0x80000400
_08009FF8: .4byte 0x00000D78
_08009FFC: .4byte gBG0MapBuffer
_0800A000: .4byte gAnimation+0x44
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
	bl DecompressBackgroundIntoBuffer
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
	bl DecompressBackgroundIntoBuffer
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
	bl FadeInBGM
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
	bl LoadCounselBenchGraphics
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _0800A1B0
_0800A1A2:
	bl LoadCounselBenchGraphics
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
	bl PlaySE
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
	ldr r2, _0800A284 @ =gOamObjects+0x130
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
_0800A284: .4byte gOamObjects+0x130
_0800A288:
	movs r0, #1
	mov r1, r8
	ldrb r1, [r1, #0x1b]
	ands r0, r1
	cmp r0, #0
	beq _0800A308
	ldr r2, _0800A2D0 @ =gOamObjects+0x130
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
_0800A2D0: .4byte gOamObjects+0x130
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
	ldr r2, _0800A378 @ =gOamObjects+0x130
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
_0800A378: .4byte gOamObjects+0x130
_0800A37C: .4byte 0x00004062
_0800A380: .4byte 0x0000C038
_0800A384: .4byte 0x000091E0
_0800A388: .4byte gIORegisters
