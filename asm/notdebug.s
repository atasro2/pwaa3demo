	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_8002278
sub_8002278: @ 0x08002278
	lsls r0, r0, #0x10
	ldr r1, _08002288 @ =gBackgroundTable
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x28
	bx lr
	.align 2, 0
_08002288: .4byte gBackgroundTable

	thumb_func_start sub_800228C
sub_800228C: @ 0x0800228C
	lsls r0, r0, #0x10
	ldr r1, _0800229C @ =gBackgroundTable
	lsrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800229C: .4byte gBackgroundTable

	thumb_func_start sub_80022A0
sub_80022A0: @ 0x080022A0
	push {r4, r5, lr}
	ldr r2, _080022C8 @ =gBG1MapBuffer
	movs r1, #0
	ldr r4, _080022CC @ =0x000003FF
	ldr r5, _080022D0 @ =gMain
	ldr r3, _080022D4 @ =gTextboxTiles
_080022AC:
	adds r0, r1, r3
	ldrb r0, [r0]
	strh r0, [r2]
	adds r1, #1
	adds r2, #2
	cmp r1, r4
	bls _080022AC
	movs r0, #2
	ldrb r1, [r5, #0x1a]
	orrs r0, r1
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080022C8: .4byte gBG1MapBuffer
_080022CC: .4byte 0x000003FF
_080022D0: .4byte gMain
_080022D4: .4byte gTextboxTiles
