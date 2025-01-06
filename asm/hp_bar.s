	.include "asm/macros.inc"
	.syntax unified

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
	bl ChangeScriptSection
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
	bl PlaySE
	b _08016A02
_080169F8:
	cmp r0, #0
	ble _08016A02
	movs r0, #0x4c
	bl PlaySE
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
	bl FindPlayingHPBarSmokeAnimations
	adds r4, r0, #0
	cmp r4, #0
	bne _08016B62
	movs r0, #0x4c
	bl StopSE
	movs r0, #0x9c
	bl StopSE
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
	ldr r1, _08016CC4 @ =gOamObjects+0x240
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
_08016CC4: .4byte gOamObjects+0x240
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

	thumb_func_start FindPlayingHPBarSmokeAnimations
FindPlayingHPBarSmokeAnimations: @ 0x08016D48
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_08016D4E:
	adds r0, r4, #0
	adds r0, #0x6b
	bl FindAnimationFromAnimId
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
	bl LoadHPBarGraphics
	bl AnimateHPBar
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

	thumb_func_start IsHPBarAnimating
IsHPBarAnimating: @ 0x08016EBC
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
