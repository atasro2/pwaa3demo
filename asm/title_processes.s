	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start CapcomLogoProcess
CapcomLogoProcess: @ 0x08006918
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
	ldr r0, _08006A3C @ =gBG3MapBuffer
_0800697E:
	strh r1, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, r3
	bls _0800697E
	movs r2, #0
	ldr r5, _08006A40 @ =gIORegisters
	ldr r4, _08006A3C @ =gBG3MapBuffer
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
_08006A3C: .4byte gBG3MapBuffer
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

	thumb_func_start TitleScreenProcess
TitleScreenProcess: @ 0x08006AA4
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
	bl LoadSaveData
	ldr r0, _08006AD0 @ =0x00000101
	str r0, [r4, #8]
	b _08006CD6
	.align 2, 0
_08006AD0: .4byte 0x00000101
_08006AD4:
	movs r0, #0x14
	bl DecompressBackgroundIntoBuffer
	movs r0, #0x14
	bl CopyBGDataToVram
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
	bl PlaySE
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
	bl PlaySE
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
