	.include "asm/macros.inc"
	.syntax unified

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

	thumb_func_start SaveGameProcess
SaveGameProcess: @ 0x080076F8
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
	ldr r1, _08007818 @ =gBG1MapBuffer
	str r1, [r0]
	ldr r2, _0800781C @ =gUnknown_020018D4
	str r2, [r0, #4]
	ldr r3, _08007820 @ =0x80000400
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08007824 @ =gBG2MapBuffer
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
	bl StopSE
	strh r5, [r4]
	ldr r2, _08007868 @ =gAnimation+0x44
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
_08007818: .4byte gBG1MapBuffer
_0800781C: .4byte gUnknown_020018D4
_08007820: .4byte 0x80000400
_08007824: .4byte gBG2MapBuffer
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
_08007868: .4byte gAnimation+0x44
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
	ldr r1, _08007A00 @ =gBG0MapBuffer
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
	ldr r1, _08007A88 @ =gBG2MapBuffer
_0800797A:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, r3
	bls _0800797A
	movs r0, #6
	movs r1, #8
	bl SlideInBG2Window
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
	bl DecompressBackgroundIntoBuffer
	movs r0, #6
	bl CopyBGDataToVram
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
_08007A00: .4byte gBG0MapBuffer
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
_08007A88: .4byte gBG2MapBuffer
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
	bl UpdateBG2Window
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
	bl ChangeScriptSection
	b _08007B02
	.align 2, 0
_08007AE8: .4byte gScriptContext
_08007AEC: .4byte gCourtRecord
_08007AF0: .4byte gIORegisters
_08007AF4: .4byte 0x0000FDFF
_08007AF8: .4byte 0x0000FFFF
_08007AFC:
	movs r0, #1
	bl ChangeScriptSection
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
	bl PlaySE
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
	bl PlaySE
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
	bl SaveGameData
	cmp r0, #0
	beq _08007C80
	ldr r0, _08007C78 @ =gScriptContext
	ldr r1, _08007C7C @ =0x0000FFFF
	strh r1, [r0, #0xc]
	movs r0, #3
	bl ChangeScriptSection
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
	bl ChangeScriptSection
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
	bl PlaySE
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
	ldr r3, _08008134 @ =gBG2MapBuffer
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
	bl DecompressBackgroundIntoBuffer
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
	bl DecompressBackgroundIntoBuffer
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
_08008134: .4byte gBG2MapBuffer
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
	bl LoadCounselBenchGraphics
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _08008244
_08008236:
	bl LoadCounselBenchGraphics
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
	bl PlaySE
_08008254:
	ldr r2, _080082BC @ =gAnimation+0x44
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
	bl FadeInBGM
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
_080082BC: .4byte gAnimation+0x44
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
	bl ChangeScriptSection
	b _0800837E
	.align 2, 0
_0800836C: .4byte gScriptContext
_08008370: .4byte gJoypad
_08008374: .4byte 0x0000FFFF
_08008378:
	movs r0, #1
	bl ChangeScriptSection
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
