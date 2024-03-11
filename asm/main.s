	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start InitSpecialEffectsWithMosaic
InitSpecialEffectsWithMosaic: @ 0x080014EC
	push {r4, r5, lr}
	ldr r3, _08001520 @ =gMain
	mov ip, r3
	ldr r4, _08001524 @ =gIORegisters
	adds r3, #0x90
	movs r5, #0
	strh r0, [r3]
	mov r0, ip
	adds r0, #0x96
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #0x40
	ldrh r0, [r4, #6]
	orrs r0, r1
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	orrs r0, r1
	strh r0, [r4, #4]
	mov r0, ip
	adds r0, #0x94
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001520: .4byte gMain
_08001524: .4byte gIORegisters

	thumb_func_start InitSpecialEffects
InitSpecialEffects: @ 0x08001528
	push {r4, lr}
	ldr r3, _08001548 @ =gMain
	mov ip, r3
	adds r3, #0x90
	movs r4, #0
	strh r0, [r3]
	mov r0, ip
	adds r0, #0x96
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	subs r0, #3
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001548: .4byte gMain

	thumb_func_start VBlankIntr
VBlankIntr: @ 0x0800154C
	push {lr}
	bl m4aSoundVSync
	ldr r1, _08001560 @ =gMain
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08001560: .4byte gMain

	thumb_func_start HBlankIntr
HBlankIntr: @ 0x08001564
	bx lr
	.align 2, 0

	thumb_func_start IntrDummy
IntrDummy: @ 0x08001568
	bx lr
	.align 2, 0
