	.include "asm/macros.inc"
	.syntax unified

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
	bl PlayBGM
	adds r0, r6, #0
	bl m4aMPlayImmInit
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r0, #1
	bl ChangeTrackVolume
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #1
	bl ChangeTrackPanning
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
