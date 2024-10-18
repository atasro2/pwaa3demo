	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_8016F18
sub_8016F18: @ 0x08016F18
	ldr r2, _08016F40 @ =gOamObjects+0x1C0
	movs r3, #0
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r2]
	cmp r0, #0
	beq _08016F6C
	ldr r0, _08016F44 @ =gMain
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08016F54
	ldr r0, _08016F48 @ =0x00004020
	strh r0, [r2]
	ldr r0, _08016F4C @ =0x000080D0
	strh r0, [r2, #2]
	ldr r0, _08016F50 @ =0x00007188
	b _08016F6A
	.align 2, 0
_08016F40: .4byte gOamObjects+0x1C0
_08016F44: .4byte gMain
_08016F48: .4byte 0x00004020
_08016F4C: .4byte 0x000080D0
_08016F50: .4byte 0x00007188
_08016F54:
	cmp r0, #0xf0
	beq _08016F5C
	cmp r0, #0x78
	bne _08016F6C
_08016F5C:
	ldr r0, _08016F70 @ =0x00004020
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r2, #2]
	movs r0, #0xe3
	lsls r0, r0, #7
_08016F6A:
	strh r0, [r2, #4]
_08016F6C:
	bx lr
	.align 2, 0
_08016F70: .4byte 0x00004020
