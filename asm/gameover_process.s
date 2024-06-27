	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start GameOverScreenProcess
GameOverScreenProcess: @ 0x08006CE8
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
