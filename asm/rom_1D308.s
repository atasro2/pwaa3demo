	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_801D308
sub_801D308: @ 0x0801D308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, _0801D424 @ =gMain
	mov r8, r0
	ldr r7, _0801D428 @ =gUnknown_03000000
	movs r0, #0xfe
	mov r1, r8
	ldrb r1, [r1, #0x1a]
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #0x1a]
	ldr r2, _0801D42C @ =gIORegisters
	adds r2, #0x4a
	ldr r0, _0801D430 @ =0x0000FEFF
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _0801D434 @ =0x0000FBFF
	ands r0, r1
	ldr r1, _0801D438 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #0x13
	strh r0, [r1]
	movs r3, #0
	adds r6, r7, #0
	movs r2, #0
	ldr r1, _0801D43C @ =0x000003FF
_0801D344:
	adds r0, r7, r3
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _0801D344
	ldr r4, _0801D440 @ =0x040000D4
	str r6, [r4]
	ldr r0, _0801D444 @ =0x0600F000
	str r0, [r4, #4]
	ldr r0, _0801D448 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0
	movs r0, #1
	strh r0, [r5, #0x30]
	strh r1, [r5, #0x32]
	strh r1, [r5, #0x34]
	strh r1, [r5, #0x36]
	ldr r5, _0801D44C @ =gUnknown_08200308
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, r2
	ldr r6, _0801D450 @ =gUnknown_0202CFC0
	adds r1, r6, #0
	bl LZ77UnCompWram
	str r6, [r4]
	ldr r0, _0801D454 @ =0x06004000
	str r0, [r4, #4]
	ldr r0, _0801D458 @ =0x80002000
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, #0x40
	str r5, [r4]
	ldr r0, _0801D45C @ =0x05000040
	str r0, [r4, #4]
	ldr r0, _0801D460 @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r3, #0
	movs r2, #2
	ldr r5, _0801D42C @ =gIORegisters
_0801D39C:
	movs r1, #7
	lsls r0, r2, #5
	adds r4, r0, r7
_0801D3A2:
	adds r0, r4, r1
	strb r3, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xe
	bls _0801D3A2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x11
	bls _0801D39C
	movs r3, #0x80
	movs r2, #2
_0801D3C4:
	movs r1, #0xf
	lsls r0, r2, #5
	adds r4, r2, #1
	adds r2, r0, r7
_0801D3CC:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x16
	bls _0801D3CC
	lsls r0, r4, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x11
	bls _0801D3C4
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldr r0, _0801D464 @ =0x00001741
	strh r0, [r1]
	ldr r0, _0801D468 @ =0x00005E86
	strh r0, [r5, #4]
	subs r1, #2
	ldr r0, _0801D46C @ =0x00001542
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801D470 @ =0x0000071F
	strh r0, [r1]
	str r2, [r5, #0x20]
	str r2, [r5, #0x24]
	strh r2, [r5, #0x18]
	strh r2, [r5, #0x1a]
	strh r2, [r5, #0x1c]
	strh r2, [r5, #0x1e]
	movs r0, #4
	mov r1, r8
	ldrb r1, [r1, #0x1a]
	orrs r0, r1
	mov r2, r8
	strb r0, [r2, #0x1a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D424: .4byte gMain
_0801D428: .4byte gUnknown_03000000
_0801D42C: .4byte gIORegisters
_0801D430: .4byte 0x0000FEFF
_0801D434: .4byte 0x0000FBFF
_0801D438: .4byte 0x0000F7FF
_0801D43C: .4byte 0x000003FF
_0801D440: .4byte 0x040000D4
_0801D444: .4byte 0x0600F000
_0801D448: .4byte 0x80000400
_0801D44C: .4byte gUnknown_08200308
_0801D450: .4byte gUnknown_0202CFC0
_0801D454: .4byte 0x06004000
_0801D458: .4byte 0x80002000
_0801D45C: .4byte 0x05000040
_0801D460: .4byte 0x80000010
_0801D464: .4byte 0x00001741
_0801D468: .4byte 0x00005E86
_0801D46C: .4byte 0x00001542
_0801D470: .4byte 0x0000071F

	thumb_func_start sub_801D474
sub_801D474: @ 0x0801D474
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	ldrh r3, [r1, #0x32]
	ldr r7, _0801D540 @ =0x00000FFF
	ands r7, r3
	ldrh r0, [r1, #0x34]
	adds r0, #1
	strh r0, [r1, #0x34]
	adds r2, r1, #0
	adds r2, #0x46
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r2]
	cmp r0, r2
	bls _0801D4B0
	adds r0, r1, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r1, #0x32]
	movs r0, #0
	strh r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x48
	ldrh r2, [r1, #0x36]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1, #0x36]
_0801D4B0:
	movs r4, #0x80
	lsls r4, r4, #9
	ldrh r1, [r1, #0x36]
	orrs r4, r1
	adds r0, r7, #0
	bl sub_8006364
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	mov r8, r0
	adds r0, r7, #0
	bl sub_80063E4
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r7, #0
	bl sub_80063E4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	adds r0, r7, #0
	bl sub_8006364
	lsls r0, r0, #0x10
	adds r1, r4, #0
	bl __divsi3
	mov r4, r8
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #3
	rsbs r3, r3, #0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #4
	subs r3, r3, r1
	movs r1, #0xf0
	lsls r1, r1, #7
	adds r3, r3, r1
	lsls r2, r5, #4
	subs r2, r2, r5
	lsls r2, r2, #3
	rsbs r2, r2, #0
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	subs r2, r2, r1
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r2, r2, r4
	ldr r1, _0801D544 @ =gIORegisters
	mov r4, r8
	strh r4, [r1, #0x18]
	strh r6, [r1, #0x1a]
	strh r5, [r1, #0x1c]
	strh r0, [r1, #0x1e]
	str r3, [r1, #0x20]
	str r2, [r1, #0x24]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D540: .4byte 0x00000FFF
_0801D544: .4byte gIORegisters

	thumb_func_start sub_801D548
sub_801D548: @ 0x0801D548
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0801D564 @ =gIORegisters
	ldr r6, _0801D568 @ =gScriptContext
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _0801D55A
	b _0801D74C
_0801D55A:
	lsls r0, r0, #2
	ldr r1, _0801D56C @ =_0801D570
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D564: .4byte gIORegisters
_0801D568: .4byte gScriptContext
_0801D56C: .4byte _0801D570
_0801D570: @ jump table
	.4byte _0801D5A8 @ case 0
	.4byte _0801D5AC @ case 1
	.4byte _0801D5B4 @ case 2
	.4byte _0801D5B8 @ case 3
	.4byte _0801D5C0 @ case 4
	.4byte _0801D5C4 @ case 5
	.4byte _0801D5CC @ case 6
	.4byte _0801D600 @ case 7
	.4byte _0801D63C @ case 8
	.4byte _0801D670 @ case 9
	.4byte _0801D6A4 @ case 10
	.4byte _0801D6E2 @ case 11
	.4byte _0801D6F0 @ case 12
	.4byte _0801D72C @ case 13
_0801D5A8:
	movs r0, #0x6e
	b _0801D6E4
_0801D5AC:
	movs r0, #0x6e
	bl sub_801D7A0
	b _0801D6E8
_0801D5B4:
	movs r0, #0x6f
	b _0801D6E4
_0801D5B8:
	movs r0, #0x6f
	bl sub_801D7A0
	b _0801D6E8
_0801D5C0:
	movs r0, #0x70
	b _0801D6E4
_0801D5C4:
	movs r0, #0x70
	bl sub_801D7A0
	b _0801D6E8
_0801D5CC:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D5D8
	cmp r4, #1
	beq _0801D5F6
	b _0801D74C
_0801D5D8:
	movs r0, #0x6f
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D5F6:
	adds r0, r5, #0
	movs r1, #0x6f
	bl sub_801D7B8
	b _0801D74C
_0801D600:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D60C
	cmp r4, #1
	beq _0801D632
	b _0801D74C
_0801D60C:
	movs r0, #0x70
	bl sub_801D784
	movs r0, #0x70
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D632:
	adds r0, r5, #0
	movs r1, #0x70
	bl sub_801D818
	b _0801D74C
_0801D63C:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D648
	cmp r4, #1
	beq _0801D666
	b _0801D74C
_0801D648:
	movs r0, #0x70
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D666:
	adds r0, r5, #0
	movs r1, #0x70
	bl sub_801D7B8
	b _0801D74C
_0801D670:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D67C
	cmp r4, #1
	beq _0801D69A
	b _0801D74C
_0801D67C:
	movs r0, #0x6e
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D69A:
	adds r0, r5, #0
	movs r1, #0x6e
	bl sub_801D7B8
	b _0801D74C
_0801D6A4:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D6B0
	cmp r4, #1
	beq _0801D6D8
	b _0801D74C
_0801D6B0:
	movs r0, #0x71
	bl sub_801D784
	movs r0, #0x71
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
	b _0801D74C
_0801D6D8:
	adds r0, r5, #0
	movs r1, #0x71
	bl sub_801D818
	b _0801D74C
_0801D6E2:
	movs r0, #0x72
_0801D6E4:
	bl sub_801D784
_0801D6E8:
	adds r0, r5, #0
	bl sub_8016F98
	b _0801D74C
_0801D6F0:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801D6FC
	cmp r4, #1
	beq _0801D722
	b _0801D74C
_0801D6FC:
	movs r0, #0x72
	bl sub_801D784
	movs r0, #0x72
	bl sub_8011D68
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	strh r4, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801D722:
	adds r0, r5, #0
	movs r1, #0x72
	bl sub_801D818
	b _0801D74C
_0801D72C:
	movs r4, #0
_0801D72E:
	adds r0, r4, #0
	adds r0, #0x6e
	bl sub_8011D68
	adds r2, r0, #0
	cmp r2, #0
	beq _0801D740
	bl sub_8012F7C
_0801D740:
	adds r4, #1
	cmp r4, #5
	bls _0801D72E
	adds r0, r5, #0
	bl sub_8016F98
_0801D74C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_8
nullsub_8: @ 0x0801D754
	bx lr
	.align 2, 0

	thumb_func_start sub_801D758
sub_801D758: @ 0x0801D758
	push {r4, lr}
	ldr r4, _0801D780 @ =gScriptContext
	movs r1, #0
	strh r1, [r4, #0x30]
	strh r1, [r4, #0x32]
	bl sub_8016F98
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xf0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #8
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D780: .4byte gScriptContext

	thumb_func_start sub_801D784
sub_801D784: @ 0x0801D784
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_8011D68
	cmp r0, #0
	bne _0801D79A
	adds r0, r4, #0
	bl sub_8012824
_0801D79A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_801D7A0
sub_801D7A0: @ 0x0801D7A0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8011D68
	cmp r0, #0
	beq _0801D7B2
	bl sub_8012F7C
_0801D7B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801D7B8
sub_801D7B8: @ 0x0801D7B8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r5, _0801D7F0 @ =gIORegisters
	ldr r2, _0801D7F4 @ =gScriptContext
	ldrh r0, [r2, #0x32]
	adds r0, #1
	strh r0, [r2, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _0801D7FC
	adds r0, r1, #0
	bl sub_8011D68
	cmp r0, #0
	beq _0801D7E0
	bl sub_8012F7C
_0801D7E0:
	adds r1, r5, #0
	adds r1, #0x4c
	ldr r0, _0801D7F8 @ =0x0000071F
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_801D758
	b _0801D812
	.align 2, 0
_0801D7F0: .4byte gIORegisters
_0801D7F4: .4byte gScriptContext
_0801D7F8: .4byte 0x0000071F
_0801D7FC:
	ldrh r2, [r2, #0x32]
	lsrs r1, r2, #1
	cmp r1, #0xf
	bls _0801D806
	movs r1, #0xf
_0801D806:
	lsls r0, r1, #8
	adds r0, #0xf
	subs r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4c
	strh r0, [r1]
_0801D812:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801D818
sub_801D818: @ 0x0801D818
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, _0801D870 @ =gIORegisters
	ldr r3, _0801D874 @ =gScriptContext
	ldrh r0, [r3, #0x32]
	adds r0, #1
	movs r7, #0
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _0801D880
	adds r0, r5, #0
	bl sub_8011D68
	ldr r1, [r0]
	movs r2, #0x81
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bl sub_8012F7C
	adds r0, r5, #0
	bl sub_801D784
	adds r2, r4, #0
	adds r2, #0x48
	ldr r0, _0801D878 @ =0x0000FDFD
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _0801D87C @ =0x0000071F
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_801D758
	b _0801D8AC
	.align 2, 0
_0801D870: .4byte gIORegisters
_0801D874: .4byte gScriptContext
_0801D878: .4byte 0x0000FDFD
_0801D87C: .4byte 0x0000071F
_0801D880:
	adds r0, r4, #0
	adds r0, #0x48
	ldr r1, _0801D8B4 @ =0x0000FFFD
	ldrh r2, [r0]
	ands r1, r2
	movs r5, #0x80
	lsls r5, r5, #2
	adds r2, r5, #0
	orrs r1, r2
	strh r1, [r0]
	ldrh r3, [r3, #0x32]
	lsrs r1, r3, #1
	cmp r1, #0xf
	bls _0801D89E
	movs r1, #0xf
_0801D89E:
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
_0801D8AC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D8B4: .4byte 0x0000FFFD

	thumb_func_start sub_801D8B8
sub_801D8B8: @ 0x0801D8B8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801D8EC @ =gScriptContext
	ldr r5, _0801D8F0 @ =gUnknown_03000844
	cmp r5, #0
	bne _0801D8C8
	bl sub_801D758
_0801D8C8:
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r3, [r0]
	adds r0, #2
	ldrh r1, [r0]
	adds r0, #2
	ldrh r2, [r0]
	cmp r1, #0
	beq _0801D8F4
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	adds r0, r0, r2
	cmp r0, r3
	bgt _0801D8FE
	ldrh r1, [r5, #0x10]
	adds r0, r1, r2
	b _0801D90C
	.align 2, 0
_0801D8EC: .4byte gScriptContext
_0801D8F0: .4byte gUnknown_03000844
_0801D8F4:
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	subs r0, r0, r2
	cmp r0, r3
	bge _0801D908
_0801D8FE:
	strh r3, [r5, #0x10]
	adds r0, r6, #0
	bl sub_801D758
	b _0801D90E
_0801D908:
	ldrh r1, [r5, #0x10]
	subs r0, r1, r2
_0801D90C:
	strh r0, [r5, #0x10]
_0801D90E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801D914
sub_801D914: @ 0x0801D914
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801D954 @ =gScriptContext
	ldr r5, _0801D958 @ =gUnknown_03000844
	cmp r5, #0
	bne _0801D924
	bl sub_801D758
_0801D924:
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r3, [r0]
	adds r0, #2
	adds r1, r4, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0801D95C
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r1, r2
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _0801D96E
	ldrh r1, [r5, #0x12]
	adds r0, r1, r2
	b _0801D97C
	.align 2, 0
_0801D954: .4byte gScriptContext
_0801D958: .4byte gUnknown_03000844
_0801D95C:
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	subs r1, r1, r2
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0801D978
_0801D96E:
	strh r3, [r5, #0x12]
	adds r0, r6, #0
	bl sub_801D758
	b _0801D97E
_0801D978:
	ldrh r1, [r5, #0x12]
	subs r0, r1, r2
_0801D97C:
	strh r0, [r5, #0x12]
_0801D97E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801D984
sub_801D984: @ 0x0801D984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _0801DA98 @ =gIORegisters
	mov r8, r0
	ldr r1, _0801DA9C @ =gUnknown_08208AA0
	mov ip, r1
	ldr r6, _0801DAA0 @ =gUnknown_08208AC0
	movs r4, #0
	mov r2, r8
	adds r2, #0x4a
	ldr r1, _0801DAA4 @ =0x0000FBFF
	adds r0, r1, #0
	ldrh r3, [r2]
	ands r0, r3
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r2, [r0]
	ands r1, r2
	strh r1, [r0]
	mov r3, r8
	strh r4, [r3, #0x12]
	movs r1, #8
	strh r1, [r3, #0x10]
	adds r0, #0x18
	strh r1, [r0]
	ldr r1, _0801DAA8 @ =0x0400001A
	movs r0, #0
	strh r0, [r1]
	movs r5, #0
	ldr r0, _0801DAAC @ =gUnknown_03000000
	mov sb, r0
	add r1, sp, #0x20
	mov sl, r1
	mov r3, sb
	movs r2, #0xe0
	lsls r2, r2, #8
	ldr r1, _0801DAB0 @ =0x000003FF
_0801D9D8:
	lsls r0, r5, #1
	adds r0, r0, r3
	strh r2, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r1
	bls _0801D9D8
	movs r5, #0
	movs r4, #0
	ldr r7, _0801DAAC @ =gUnknown_03000000
_0801D9EE:
	movs r2, #0
	lsls r3, r5, #5
_0801D9F2:
	subs r0, r2, r4
	cmp r0, #0x1e
	bhi _0801DA06
	adds r0, #1
	adds r0, r3, r0
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r1, [r6]
	adds r1, #0x81
	strh r1, [r0]
_0801DA06:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r6, #2
	cmp r2, #0x1d
	bls _0801D9F2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x13
	bls _0801D9EE
	movs r2, #0x9a
	lsls r2, r2, #3
	add ip, r2
	ldr r2, _0801DAB4 @ =0x040000D4
	mov r3, ip
	str r3, [r2]
	ldr r0, _0801DAB8 @ =gUnknown_0203B500
	str r0, [r2, #4]
	ldr r0, _0801DABC @ =0x80002580
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0801DAC0 @ =gUnknown_0203B000
	ldr r6, _0801DAC4 @ =0x06008B20
	str r3, [r2]
	str r6, [r2, #4]
	ldr r0, _0801DAC8 @ =0x80002800
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0801DA9C @ =gUnknown_08208AA0
	ldr r6, _0801DACC @ =0x050001C0
	str r3, [r2]
	str r6, [r2, #4]
	ldr r4, _0801DAD0 @ =0x80000010
	str r4, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0801DAD4 @ =gMain
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801DAD8
	str r3, [r2]
	mov r0, sp
	str r0, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [r2, #8]
	movs r5, #0
_0801DA68:
	lsls r0, r5, #1
	mov r1, sp
	adds r4, r1, r0
	ldrh r0, [r4]
	movs r1, #0x20
	movs r2, #0
	bl sub_800549C
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0801DA68
	ldr r0, _0801DAB4 @ =0x040000D4
	mov r2, sp
	str r2, [r0]
	str r6, [r0, #4]
	ldr r1, _0801DAD0 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r3, _0801DAAC @ =gUnknown_03000000
	mov sb, r3
	b _0801DAE0
	.align 2, 0
_0801DA98: .4byte gIORegisters
_0801DA9C: .4byte gUnknown_08208AA0
_0801DAA0: .4byte gUnknown_08208AC0
_0801DAA4: .4byte 0x0000FBFF
_0801DAA8: .4byte 0x0400001A
_0801DAAC: .4byte gUnknown_03000000
_0801DAB0: .4byte 0x000003FF
_0801DAB4: .4byte 0x040000D4
_0801DAB8: .4byte gUnknown_0203B500
_0801DABC: .4byte 0x80002580
_0801DAC0: .4byte gUnknown_0203B000
_0801DAC4: .4byte 0x06008B20
_0801DAC8: .4byte 0x80002800
_0801DACC: .4byte 0x050001C0
_0801DAD0: .4byte 0x80000010
_0801DAD4: .4byte gMain
_0801DAD8:
	str r3, [r2]
	str r6, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [r2, #8]
_0801DAE0:
	mov r3, sb
	ldr r6, _0801DB40 @ =0x0600F000
	ldr r0, _0801DB44 @ =0x040000D4
	str r3, [r0]
	str r6, [r0, #4]
	ldr r1, _0801DB48 @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _0801DB4C @ =0x0400000C
	mov r2, r8
	ldrh r0, [r2, #4]
	strh r0, [r1]
	movs r5, #0
	ldr r2, _0801DB50 @ =gUnknown_03001080
	ldr r1, _0801DB54 @ =0x00002258
	movs r3, #0xf0
	lsls r3, r3, #2
_0801DB02:
	lsls r0, r5, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r0, r5, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1f
	bls _0801DB02
	movs r0, #0
	mov r3, sl
	strh r0, [r3]
	ldr r1, _0801DB44 @ =0x040000D4
	str r3, [r1]
	ldr r0, _0801DB58 @ =0x06008B00
	str r0, [r1, #4]
	ldr r0, _0801DB5C @ =0x81000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DB40: .4byte 0x0600F000
_0801DB44: .4byte 0x040000D4
_0801DB48: .4byte 0x800002C0
_0801DB4C: .4byte 0x0400000C
_0801DB50: .4byte gUnknown_03001080
_0801DB54: .4byte 0x00002258
_0801DB58: .4byte 0x06008B00
_0801DB5C: .4byte 0x81000010

	thumb_func_start sub_801DB60
sub_801DB60: @ 0x0801DB60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0801DB88 @ =gIORegisters
	mov sb, r0
	ldr r4, _0801DB8C @ =gScriptContext
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	lsrs r0, r0, #0xc
	cmp r0, #4
	bls _0801DB7C
	b _0801DCEC
_0801DB7C:
	lsls r0, r0, #2
	ldr r1, _0801DB90 @ =_0801DB94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801DB88: .4byte gIORegisters
_0801DB8C: .4byte gScriptContext
_0801DB90: .4byte _0801DB94
_0801DB94: @ jump table
	.4byte _0801DCEC @ case 0
	.4byte _0801DBA8 @ case 1
	.4byte _0801DC30 @ case 2
	.4byte _0801DCBC @ case 3
	.4byte _0801DCD4 @ case 4
_0801DBA8:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0801DBF0
	ldr r6, _0801DBE0 @ =gUnknown_0202CFC0
	movs r5, #0
	movs r1, #0x4a
	adds r1, r1, r4
	mov r8, r1
	ldr r1, _0801DBE4 @ =0x040000D4
	ldr r2, _0801DBE8 @ =0x800003C0
	mov ip, r2
	movs r7, #0xf0
	lsls r7, r7, #4
	ldr r2, _0801DBEC @ =0x06004000
	movs r3, #0xf0
	lsls r3, r3, #3
_0801DBC8:
	str r6, [r1]
	str r2, [r1, #4]
	mov r0, ip
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r6, r6, r7
	adds r2, r2, r3
	adds r5, #1
	cmp r5, #0x13
	bls _0801DBC8
	b _0801DCA6
	.align 2, 0
_0801DBE0: .4byte gUnknown_0202CFC0
_0801DBE4: .4byte 0x040000D4
_0801DBE8: .4byte 0x800003C0
_0801DBEC: .4byte 0x06004000
_0801DBF0:
	ldr r6, _0801DC20 @ =gUnknown_0202CFC0
	movs r5, #0
	movs r1, #0x4a
	adds r1, r1, r4
	mov r8, r1
	ldr r1, _0801DC24 @ =0x040000D4
	ldr r2, _0801DC28 @ =0x800001E0
	mov ip, r2
	movs r7, #0xf0
	lsls r7, r7, #3
	ldr r2, _0801DC2C @ =0x06004000
	movs r3, #0xf0
	lsls r3, r3, #2
_0801DC0A:
	str r6, [r1]
	str r2, [r1, #4]
	mov r0, ip
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r6, r6, r7
	adds r2, r2, r3
	adds r5, #1
	cmp r5, #0x13
	bls _0801DC0A
	b _0801DCA6
	.align 2, 0
_0801DC20: .4byte gUnknown_0202CFC0
_0801DC24: .4byte 0x040000D4
_0801DC28: .4byte 0x800001E0
_0801DC2C: .4byte 0x06004000
_0801DC30:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0801DC78
	ldr r6, _0801DC68 @ =gUnknown_0202D740
	movs r5, #0
	movs r1, #0x4a
	adds r1, r1, r4
	mov r8, r1
	ldr r1, _0801DC6C @ =0x040000D4
	ldr r2, _0801DC70 @ =0x800003C0
	mov ip, r2
	movs r7, #0xf0
	lsls r7, r7, #4
	ldr r2, _0801DC74 @ =0x06004000
	movs r3, #0xf0
	lsls r3, r3, #3
_0801DC50:
	str r6, [r1]
	str r2, [r1, #4]
	mov r0, ip
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r6, r6, r7
	adds r2, r2, r3
	adds r5, #1
	cmp r5, #0x13
	bls _0801DC50
	b _0801DCA6
	.align 2, 0
_0801DC68: .4byte gUnknown_0202D740
_0801DC6C: .4byte 0x040000D4
_0801DC70: .4byte 0x800003C0
_0801DC74: .4byte 0x06004000
_0801DC78:
	ldr r6, _0801DCAC @ =gUnknown_0202D740
	movs r5, #0
	movs r1, #0x4a
	adds r1, r1, r4
	mov r8, r1
	ldr r1, _0801DCB0 @ =0x040000D4
	ldr r2, _0801DCB4 @ =0x800001E0
	mov ip, r2
	movs r7, #0xf0
	lsls r7, r7, #3
	ldr r2, _0801DCB8 @ =0x06004000
	movs r3, #0xf0
	lsls r3, r3, #2
_0801DC92:
	str r6, [r1]
	str r2, [r1, #4]
	mov r0, ip
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r6, r6, r7
	adds r2, r2, r3
	adds r5, #1
	cmp r5, #0x13
	bls _0801DC92
_0801DCA6:
	bl sub_80060E8
	b _0801DD02
	.align 2, 0
_0801DCAC: .4byte gUnknown_0202D740
_0801DCB0: .4byte 0x040000D4
_0801DCB4: .4byte 0x800001E0
_0801DCB8: .4byte 0x06004000
_0801DCBC:
	ldr r0, _0801DCD0 @ =gSaveDataBuffer
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0x20
	bl sub_8004940
	movs r1, #0x4a
	adds r1, r1, r4
	mov r8, r1
	b _0801DD02
	.align 2, 0
_0801DCD0: .4byte gSaveDataBuffer
_0801DCD4:
	ldr r0, _0801DCE8 @ =gSaveDataBuffer
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0x10
	bl sub_8004940
	movs r2, #0x4a
	adds r2, r2, r4
	mov r8, r2
	b _0801DD02
	.align 2, 0
_0801DCE8: .4byte gSaveDataBuffer
_0801DCEC:
	ldr r1, _0801DD5C @ =0x040000D4
	ldr r0, _0801DD60 @ =gUnknown_020365C0
	str r0, [r1]
	ldr r0, _0801DD64 @ =0x06004000
	str r0, [r1, #4]
	ldr r0, _0801DD68 @ =0x80004B00
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x4a
	adds r0, r0, r4
	mov r8, r0
_0801DD02:
	movs r0, #2
	ldrh r1, [r4, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _0801DD46
	ldr r5, _0801DD6C @ =gMain
	ldr r0, _0801DD70 @ =0x00000A04
	ldrh r2, [r5, #8]
	cmp r2, r0
	bne _0801DD3A
	bl sub_8015C18
	ldr r0, _0801DD74 @ =0x00000257
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	mov r1, sb
	ldrh r1, [r1, #6]
	orrs r0, r1
	mov r2, sb
	strh r0, [r2, #6]
	mov r1, sb
	adds r1, #0x4a
	ldr r0, _0801DD78 @ =0x0000FEFF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
_0801DD3A:
	bl sub_80060E8
	ldr r0, _0801DD7C @ =0x0000FFFD
	ldrh r1, [r4, #0x1e]
	ands r0, r1
	strh r0, [r4, #0x1e]
_0801DD46:
	ldrh r1, [r4, #0x1e]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801DD88
	ldr r0, _0801DD80 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4, #0x1e]
	ldr r6, _0801DD84 @ =gUnknown_03000000
	b _0801DD8A
	.align 2, 0
_0801DD5C: .4byte 0x040000D4
_0801DD60: .4byte gUnknown_020365C0
_0801DD64: .4byte 0x06004000
_0801DD68: .4byte 0x80004B00
_0801DD6C: .4byte gMain
_0801DD70: .4byte 0x00000A04
_0801DD74: .4byte 0x00000257
_0801DD78: .4byte 0x0000FEFF
_0801DD7C: .4byte 0x0000FFFD
_0801DD80: .4byte 0x0000FFFB
_0801DD84: .4byte gUnknown_03000000
_0801DD88:
	ldr r6, _0801DDD4 @ =gUnknown_03002FA0
_0801DD8A:
	movs r0, #0xf
	mov r2, r8
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _0801DE0C
	cmp r0, #1
	bne _0801DE4E
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0801DDE0
	movs r0, #0x80
	mov r1, sb
	ldrh r1, [r1, #6]
	orrs r0, r1
	mov r2, sb
	strh r0, [r2, #6]
	movs r5, #0x20
	adds r4, r6, #0
	adds r4, #0x40
_0801DDB2:
	ldrh r0, [r4]
	movs r1, #0x1f
	movs r2, #0
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xff
	bls _0801DDB2
	ldr r1, _0801DDD8 @ =0x040000D4
	str r6, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0801DDDC @ =0x80000100
	b _0801DE4A
	.align 2, 0
_0801DDD4: .4byte gUnknown_03002FA0
_0801DDD8: .4byte 0x040000D4
_0801DDDC: .4byte 0x80000100
_0801DDE0:
	ldr r0, _0801DE08 @ =0x0000FF7F
	mov r1, sb
	ldrh r1, [r1, #6]
	ands r0, r1
	mov r2, sb
	strh r0, [r2, #6]
	movs r5, #0
	adds r4, r6, #0
_0801DDF0:
	ldrh r0, [r4]
	movs r1, #0x1f
	movs r2, #0
	bl sub_8005574
	strh r0, [r4]
	adds r4, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801DDF0
	b _0801DE40
	.align 2, 0
_0801DE08: .4byte 0x0000FF7F
_0801DE0C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0801DE34
	movs r0, #0x80
	mov r1, sb
	ldrh r1, [r1, #6]
	orrs r0, r1
	mov r2, sb
	strh r0, [r2, #6]
	ldr r1, _0801DE2C @ =0x040000D4
	str r6, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0801DE30 @ =0x80000100
	b _0801DE4A
	.align 2, 0
_0801DE2C: .4byte 0x040000D4
_0801DE30: .4byte 0x80000100
_0801DE34:
	ldr r0, _0801DE84 @ =0x0000FF7F
	mov r1, sb
	ldrh r1, [r1, #6]
	ands r0, r1
	mov r2, sb
	strh r0, [r2, #6]
_0801DE40:
	ldr r1, _0801DE88 @ =0x040000D4
	str r6, [r1]
	ldr r0, _0801DE8C @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _0801DE90 @ =0x80000010
_0801DE4A:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0801DE4E:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_800B898
	movs r0, #0
	bl sub_8003F7C
	mov r0, r8
	ldrh r1, [r0]
	movs r0, #0xf0
	lsls r0, r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0801DF04
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0801DEA4
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _0801DE9C
	ldr r0, _0801DE94 @ =gMain
	adds r0, #0x90
	ldr r1, _0801DE98 @ =0x0000FFFD
	b _0801DEA2
	.align 2, 0
_0801DE84: .4byte 0x0000FF7F
_0801DE88: .4byte 0x040000D4
_0801DE8C: .4byte 0x05000040
_0801DE90: .4byte 0x80000010
_0801DE94: .4byte gMain
_0801DE98: .4byte 0x0000FFFD
_0801DE9C:
	ldr r0, _0801DEB4 @ =gMain
	adds r0, #0x90
	movs r1, #0
_0801DEA2:
	strh r1, [r0]
_0801DEA4:
	cmp r2, #2
	beq _0801DED2
	cmp r2, #2
	bgt _0801DEB8
	cmp r2, #1
	beq _0801DEC2
	b _0801DF04
	.align 2, 0
_0801DEB4: .4byte gMain
_0801DEB8:
	cmp r2, #3
	beq _0801DEE2
	cmp r2, #4
	beq _0801DEF2
	b _0801DF04
_0801DEC2:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _0801DF04
_0801DED2:
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _0801DF04
_0801DEE2:
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
	b _0801DF04
_0801DEF2:
	movs r0, #1
	bl sub_8003F7C
	movs r0, #0x40
	mov r1, sb
	ldrh r1, [r1]
	orrs r0, r1
	mov r2, sb
	strh r0, [r2]
_0801DF04:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801DF10
sub_801DF10: @ 0x0801DF10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	ldr r0, _0801DF44 @ =gIORegisters
	str r0, [sp, #0x14]
	ldr r6, _0801DF48 @ =gScriptContext
	ldr r1, _0801DF4C @ =gMain
	mov r8, r1
	ldr r0, [sp, #0x10]
	adds r0, #0x2f
	ldrb r0, [r0]
	ldr r2, [sp, #0x14]
	mov r3, r8
	cmp r0, #0x3a
	bls _0801DF3A
	bl _0801F9D2
_0801DF3A:
	lsls r0, r0, #2
	ldr r1, _0801DF50 @ =_0801DF54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801DF44: .4byte gIORegisters
_0801DF48: .4byte gScriptContext
_0801DF4C: .4byte gMain
_0801DF50: .4byte _0801DF54
_0801DF54: @ jump table
	.4byte _0801E040 @ case 0
	.4byte _0801E054 @ case 1
	.4byte _0801E078 @ case 2
	.4byte _0801E086 @ case 3
	.4byte _0801E0A0 @ case 4
	.4byte _0801E0AA @ case 5
	.4byte _0801E0B4 @ case 6
	.4byte _0801E10C @ case 7
	.4byte _0801E118 @ case 8
	.4byte _0801E124 @ case 9
	.4byte _0801E134 @ case 10
	.4byte _0801E144 @ case 11
	.4byte _0801E154 @ case 12
	.4byte _0801E1C4 @ case 13
	.4byte _0801E204 @ case 14
	.4byte _0801E25A @ case 15
	.4byte _0801E3E0 @ case 16
	.4byte _0801E5AC @ case 17
	.4byte _0801E660 @ case 18
	.4byte _0801E730 @ case 19
	.4byte _0801F9D2 @ case 20
	.4byte _0801E908 @ case 21
	.4byte _0801EA1E @ case 22
	.4byte _0801EBEC @ case 23
	.4byte _0801ED30 @ case 24
	.4byte _0801EF2C @ case 25
	.4byte _0801F070 @ case 26
	.4byte _0801F286 @ case 27
	.4byte _0801F290 @ case 28
	.4byte _0801F29A @ case 29
	.4byte _0801F2A4 @ case 30
	.4byte _0801F2AE @ case 31
	.4byte _0801F390 @ case 32
	.4byte _0801F3BC @ case 33
	.4byte _0801F408 @ case 34
	.4byte _0801F490 @ case 35
	.4byte _0801F4F4 @ case 36
	.4byte _0801F530 @ case 37
	.4byte _0801F5A4 @ case 38
	.4byte _0801F5AE @ case 39
	.4byte _0801F5B8 @ case 40
	.4byte _0801F5C2 @ case 41
	.4byte _0801F5CC @ case 42
	.4byte _0801F5DA @ case 43
	.4byte _0801F5F0 @ case 44
	.4byte _0801F5F4 @ case 45
	.4byte _0801F5F8 @ case 46
	.4byte _0801F5FE @ case 47
	.4byte _0801F61E @ case 48
	.4byte _0801F6B0 @ case 49
	.4byte _0801F6BA @ case 50
	.4byte _0801F6D8 @ case 51
	.4byte _0801F712 @ case 52
	.4byte _0801F72C @ case 53
	.4byte _0801F734 @ case 54
	.4byte _0801F742 @ case 55
	.4byte _0801F93C @ case 56
	.4byte _0801F95E @ case 57
	.4byte _0801F9A8 @ case 58
_0801E040:
	ldr r2, _0801E050 @ =gUnknown_03000844
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	bl _0801F99A
	.align 2, 0
_0801E050: .4byte gUnknown_03000844
_0801E054:
	ldr r3, _0801E070 @ =gUnknown_03000844
	cmp r3, #0
	bne _0801E05E
	bl _0801F99A
_0801E05E:
	ldr r0, [r3]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0801E074 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r3]
	bl _0801F99A
	.align 2, 0
_0801E070: .4byte gUnknown_03000844
_0801E074: .4byte 0xFDFFFFFF
_0801E078:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0xf0
	lsls r0, r0, #4
	strh r0, [r1]
	bl _0801F99A
_0801E086:
	ldr r4, _0801E09C @ =gUnknown_03000844
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	bl _0801F99A
	.align 2, 0
_0801E09C: .4byte gUnknown_03000844
_0801E0A0:
	ldr r0, [sp, #0x10]
	bl sub_801D8B8
	bl _0801F9D2
_0801E0AA:
	ldr r0, [sp, #0x10]
	bl sub_801D914
	bl _0801F9D2
_0801E0B4:
	ldrh r2, [r6, #0x30]
	cmp r2, #0
	beq _0801E0C2
	cmp r2, #1
	beq _0801E0D0
	bl _0801F9D2
_0801E0C2:
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	movs r1, #0xf0
	lsls r1, r1, #4
	strh r1, [r0]
	strh r2, [r6, #0x32]
	b _0801E50E
_0801E0D0:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	cmp r1, r0
	bgt _0801E0EC
	bl _0801EB34
_0801E0EC:
	ldr r5, _0801E104 @ =gUnknown_03000844
	ldr r0, [r5]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0801E108 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r5]
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	bl _0801F902
	.align 2, 0
_0801E104: .4byte gUnknown_03000844
_0801E108: .4byte 0xFDFFFFFF
_0801E10C:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	bl _0801F99A
_0801E118:
	movs r0, #4
	ldrh r7, [r6, #0x1c]
	orrs r0, r7
	strh r0, [r6, #0x1c]
	bl _0801F99A
_0801E124:
	ldr r0, _0801E130 @ =0x0000FFFB
	ldrh r1, [r6, #0x1c]
	ands r0, r1
	strh r0, [r6, #0x1c]
	bl _0801F99A
	.align 2, 0
_0801E130: .4byte 0x0000FFFB
_0801E134:
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	ldrh r3, [r6, #0x1c]
	orrs r0, r3
	strh r0, [r6, #0x1c]
	bl _0801F99A
_0801E144:
	ldr r0, _0801E150 @ =0x0000EFFF
	ldrh r4, [r6, #0x1c]
	ands r0, r4
	strh r0, [r6, #0x1c]
	bl _0801F99A
	.align 2, 0
_0801E150: .4byte 0x0000EFFF
_0801E154:
	ldrh r2, [r6, #0x30]
	cmp r2, #0
	beq _0801E162
	cmp r2, #1
	beq _0801E16E
	bl _0801F9D2
_0801E162:
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	movs r1, #0xf
	strh r1, [r0]
	strh r2, [r6, #0x32]
	b _0801E50E
_0801E16E:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	cmp r1, r0
	ble _0801E1A8
	ldr r5, _0801E1A0 @ =gUnknown_03000844
	ldr r0, [r5]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0801E1A4 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r5]
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	bl _0801F902
	.align 2, 0
_0801E1A0: .4byte gUnknown_03000844
_0801E1A4: .4byte 0xFDFFFFFF
_0801E1A8:
	ldrh r0, [r6, #0x32]
	adds r1, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0801E1BA
	movs r5, #0xf
_0801E1BA:
	lsls r0, r5, #8
	adds r0, #0xf
	subs r0, r0, r5
	bl _0801EB4E
_0801E1C4:
	ldrh r2, [r6, #0x30]
	cmp r2, #0
	beq _0801E1D2
	cmp r2, #1
	beq _0801E1E0
	bl _0801F9D2
_0801E1D2:
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	movs r1, #0xf0
	lsls r1, r1, #4
	strh r1, [r0]
	strh r2, [r6, #0x32]
	b _0801E50E
_0801E1E0:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	cmp r1, r0
	bgt _0801E1FC
	bl _0801EB34
_0801E1FC:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	bl _0801F902
_0801E204:
	ldrh r2, [r6, #0x30]
	cmp r2, #0
	beq _0801E212
	cmp r2, #1
	beq _0801E21E
	bl _0801F9D2
_0801E212:
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	movs r1, #0xf
	strh r1, [r0]
	strh r2, [r6, #0x32]
	b _0801E50E
_0801E21E:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	cmp r1, r0
	ble _0801E23E
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	bl _0801F902
_0801E23E:
	ldrh r0, [r6, #0x32]
	adds r1, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0801E250
	movs r5, #0xf
_0801E250:
	lsls r0, r5, #8
	adds r0, #0xf
	subs r0, r0, r5
	bl _0801EB4E
_0801E25A:
	ldrh r2, [r6, #0x30]
	cmp r2, #1
	beq _0801E2A4
	cmp r2, #1
	bgt _0801E26C
	cmp r2, #0
	beq _0801E274
	bl _0801F9D2
_0801E26C:
	cmp r2, #2
	beq _0801E358
	bl _0801F9D2
_0801E274:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	ldr r0, _0801E2A0 @ =0x00000F18
	strh r0, [r1]
	strh r2, [r6, #0x32]
	movs r2, #1
	strh r2, [r6, #0x30]
	adds r3, r6, #0
	adds r3, #0x46
	ldrh r0, [r3]
	mov r1, r8
	adds r1, #0x8e
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r1, [r0]
	mov r0, r8
	adds r0, #0x8f
	strb r1, [r0]
	strh r2, [r3]
	bl _0801F9D2
	.align 2, 0
_0801E2A0: .4byte 0x00000F18
_0801E2A4:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	cmp r1, r0
	ble _0801E33C
	ldr r1, [sp, #0x14]
	adds r1, #0x4a
	ldr r0, _0801E314 @ =0x0000FBFF
	ldrh r7, [r1]
	ands r0, r7
	strh r0, [r1]
	movs r5, #0
	ldr r3, _0801E318 @ =0x000003FF
	ldr r4, [sp, #0x14]
	adds r4, #0x4c
	ldr r7, _0801E31C @ =gUnknown_03000000
	ldr r2, [sp, #0x14]
	adds r2, #0x48
	ldr r1, _0801E320 @ =0x0000E0A0
	adds r0, r7, #0
_0801E2DC:
	strh r1, [r0]
	adds r0, #2
	adds r5, #1
	cmp r5, r3
	bls _0801E2DC
	ldr r0, _0801E324 @ =0x0000071F
	strh r0, [r4]
	ldr r0, _0801E328 @ =0x0000FFFB
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801E32C @ =0x00001E02
	ldr r4, [sp, #0x14]
	strh r0, [r4, #4]
	adds r3, r7, #0
	ldr r7, _0801E330 @ =0x0600F000
	ldr r0, _0801E334 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801E338 @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl _0801F822
	.align 2, 0
_0801E314: .4byte 0x0000FBFF
_0801E318: .4byte 0x000003FF
_0801E31C: .4byte gUnknown_03000000
_0801E320: .4byte 0x0000E0A0
_0801E324: .4byte 0x0000071F
_0801E328: .4byte 0x0000FFFB
_0801E32C: .4byte 0x00001E02
_0801E330: .4byte 0x0600F000
_0801E334: .4byte 0x040000D4
_0801E338: .4byte 0x800002C0
_0801E33C:
	ldrh r0, [r6, #0x32]
	adds r1, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _0801E354 @ =0x00000F18
	adds r0, r7, #0
	subs r0, r0, r5
	bl _0801EB4E
	.align 2, 0
_0801E354: .4byte 0x00000F18
_0801E358:
	ldr r0, [sp, #0x14]
	adds r0, #0x48
	movs r1, #0xdf
	strh r1, [r0]
	mov r2, r8
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r1, _0801E3DC @ =0x0000FFFF
	adds r4, r1, #0
	mov r1, r8
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, [sp, #0x14]
	adds r3, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _0801E390
	movs r0, #0
	strh r0, [r2]
	mov r0, r8
	adds r0, #0x8f
	ldrh r5, [r3]
	ldrb r0, [r0]
	adds r0, r5, r0
	strh r0, [r3]
_0801E390:
	movs r0, #0x1f
	ldrh r7, [r3]
	ands r0, r7
	strh r0, [r3]
	cmp r0, #0x10
	beq _0801E3AA
	mov r0, r8
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801E3AA
	bl _0801F9D2
_0801E3AA:
	movs r0, #0x10
	strh r0, [r3]
	ldrh r0, [r2]
	orrs r0, r4
	strh r0, [r2]
	movs r0, #0xb1
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	beq _0801E3C4
	bl sub_8012F7C
_0801E3C4:
	movs r0, #0xb2
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	bne _0801E3D4
	bl _0801F906
_0801E3D4:
	bl sub_8012F7C
	bl _0801F906
	.align 2, 0
_0801E3DC: .4byte 0x0000FFFF
_0801E3E0:
	ldrh r0, [r6, #0x30]
	cmp r0, #1
	bne _0801E3E8
	b _0801E51C
_0801E3E8:
	cmp r0, #1
	bgt _0801E3F4
	cmp r0, #0
	beq _0801E3FE
	bl _0801F9D2
_0801E3F4:
	cmp r0, #2
	bne _0801E3FA
	b _0801E576
_0801E3FA:
	bl _0801F9D2
_0801E3FE:
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	movs r4, #0
	ldrh r3, [r6, #0x1e]
	orrs r3, r0
	strh r3, [r6, #0x1e]
	ldrh r2, [r6, #0x3a]
	lsrs r1, r2, #1
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xff
	bls _0801E41E
	movs r2, #0xff
_0801E41E:
	movs r0, #0x40
	ldrh r1, [r6, #0x1c]
	orrs r1, r0
	strh r1, [r6, #0x1c]
	ldr r5, [sp, #0x14]
	ldrh r5, [r5]
	orrs r0, r5
	ldr r7, [sp, #0x14]
	strh r0, [r7]
	lsls r0, r2, #8
	adds r0, r0, r2
	str r0, [r7, #0x44]
	ldrh r0, [r6, #0x3a]
	adds r0, #1
	strh r0, [r6, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bhi _0801E448
	bl _0801F9D2
_0801E448:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0801E4B8
	ldr r0, _0801E494 @ =0x0000FFF7
	ands r3, r0
	strh r3, [r6, #0x1e]
	movs r0, #9
	movs r1, #0
	bl sub_8014B40
	bl sub_8015670
	ldr r0, _0801E498 @ =gMain
	ldr r1, _0801E49C @ =0x00000257
	adds r0, r0, r1
	strb r4, [r0]
	ldr r0, _0801E4A0 @ =0x040000D4
	ldr r2, _0801E4A4 @ =gUnknown_0814DCB4
	str r2, [r0]
	ldr r1, _0801E4A8 @ =0x050001C0
	str r1, [r0, #4]
	ldr r3, _0801E4AC @ =0x80000010
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	adds r2, #0x20
	str r2, [r0]
	ldr r1, _0801E4B0 @ =0x050001E0
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0801E4B4 @ =0x0000FFFC
	ldrh r2, [r7, #6]
	ands r0, r2
	adds r0, #2
	strh r0, [r7, #6]
	b _0801E4E8
	.align 2, 0
_0801E494: .4byte 0x0000FFF7
_0801E498: .4byte gMain
_0801E49C: .4byte 0x00000257
_0801E4A0: .4byte 0x040000D4
_0801E4A4: .4byte gUnknown_0814DCB4
_0801E4A8: .4byte 0x050001C0
_0801E4AC: .4byte 0x80000010
_0801E4B0: .4byte 0x050001E0
_0801E4B4: .4byte 0x0000FFFC
_0801E4B8:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	lsrs r2, r0, #0xc
	cmp r2, #2
	bne _0801E4D8
	ldr r0, _0801E4D4 @ =gSaveDataBuffer
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #1
	bl nullsub_8
	b _0801E4E4
	.align 2, 0
_0801E4D4: .4byte gSaveDataBuffer
_0801E4D8:
	ldr r0, _0801E518 @ =gSaveDataBuffer
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0
	bl nullsub_8
_0801E4E4:
	bl sub_801DB60
_0801E4E8:
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r2, [r4]
	movs r1, #0
	movs r3, #0
	bl sub_8012684
	ldrh r1, [r4]
	mov r0, r8
	adds r0, #0xc4
	strh r1, [r0]
	ldrh r1, [r4]
	adds r0, #2
	strh r1, [r0]
	movs r0, #0x1d
	strh r0, [r6, #0x3a]
_0801E50E:
	movs r0, #1
	strh r0, [r6, #0x30]
	bl _0801F9D2
	.align 2, 0
_0801E518: .4byte gSaveDataBuffer
_0801E51C:
	ldrh r3, [r6, #0x3a]
	cmp r3, #0x1d
	bne _0801E54A
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801E54A
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0xf0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0801E54A
	lsrs r2, r0, #0x14
	cmp r2, #1
	bne _0801E54A
	movs r0, #0x1f
	movs r1, #0
	bl sub_80058E8
_0801E54A:
	ldrh r4, [r6, #0x3a]
	lsrs r1, r4, #1
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xff
	bls _0801E55C
	movs r2, #0xff
_0801E55C:
	lsls r0, r2, #8
	adds r0, r0, r2
	ldr r5, [sp, #0x14]
	str r0, [r5, #0x44]
	ldrh r0, [r6, #0x3a]
	cmp r0, #0
	bne _0801E56E
	bl _0801F822
_0801E56E:
	subs r0, #1
	strh r0, [r6, #0x3a]
	bl _0801F9D2
_0801E576:
	ldr r0, _0801E5A4 @ =0x0000FFBF
	ldrh r7, [r6, #0x1c]
	ands r0, r7
	strh r0, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	ldr r0, _0801E5A8 @ =0x00007FFF
	ldrh r1, [r6, #0x1e]
	ands r0, r1
	movs r1, #0
	strh r0, [r6, #0x1e]
	adds r0, r6, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #8
	str r0, [r6]
	bl _0801F99A
	.align 2, 0
_0801E5A4: .4byte 0x0000FFBF
_0801E5A8: .4byte 0x00007FFF
_0801E5AC:
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801E5BA
	cmp r4, #1
	beq _0801E5C8
	bl _0801F9D2
_0801E5BA:
	bl sub_801D984
	movs r0, #1
	strh r0, [r6, #0x30]
	strh r4, [r6, #0x32]
	bl _0801F9D2
_0801E5C8:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x15
	bhi _0801E5DA
	bl _0801F9D2
_0801E5DA:
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801E5EC
	movs r0, #0x6f
	bl sub_8011150
	b _0801E5F2
_0801E5EC:
	movs r0, #0x3a
	bl sub_8011150
_0801E5F2:
	movs r4, #0
	movs r2, #0
	movs r0, #0xa
	mov r3, r8
	strh r0, [r3, #0x14]
	adds r3, #0xe8
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	mov r5, r8
	strb r1, [r5, #0x16]
	ldr r1, [sp, #0x14]
	adds r1, #0x4a
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _0801E650 @ =0x00001E09
	ldr r5, [sp, #0x14]
	strh r0, [r5, #4]
	adds r1, r5, #0
	adds r1, #0x48
	ldr r0, _0801E654 @ =0x00001946
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801E658 @ =0x00000F18
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2e
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, #8
	str r0, [r6]
	strh r2, [r6, #0x3c]
	strh r2, [r6, #0x3a]
	strh r2, [r6, #0x38]
	strh r2, [r6, #0x36]
	strh r2, [r6, #0x34]
	strh r2, [r6, #0x32]
	strh r2, [r6, #0x30]
	ldr r0, _0801E65C @ =0x0000FFFE
	strh r0, [r6, #0x3e]
	bl _0801F3AC
	.align 2, 0
_0801E650: .4byte 0x00001E09
_0801E654: .4byte 0x00001946
_0801E658: .4byte 0x00000F18
_0801E65C: .4byte 0x0000FFFE
_0801E660:
	movs r5, #0
	ldr r3, _0801E700 @ =0x000003FF
	ldr r4, [sp, #0x14]
	adds r4, #0x4c
	ldr r6, [sp, #0x14]
	adds r6, #0x4a
	ldr r7, _0801E704 @ =gUnknown_03000000
	ldr r2, [sp, #0x14]
	adds r2, #0x48
	ldr r1, _0801E708 @ =0x0000E0B0
	adds r0, r7, #0
_0801E676:
	strh r1, [r0]
	adds r0, #2
	adds r5, #1
	cmp r5, r3
	bls _0801E676
	add r1, sp, #4
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0801E70C @ =0x040000D4
	str r1, [r0]
	ldr r1, _0801E710 @ =0x06009600
	str r1, [r0, #4]
	ldr r1, _0801E714 @ =0x81000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r3, r7, #0
	ldr r7, _0801E718 @ =0x0600F000
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801E71C @ =0x800002C0
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0801E720 @ =0x0000071F
	strh r0, [r4]
	ldr r0, _0801E724 @ =0x0000FFFB
	ldrh r7, [r2]
	ands r0, r7
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801E728 @ =0x00001E02
	ldr r4, [sp, #0x14]
	strh r0, [r4, #4]
	ldr r0, _0801E72C @ =0x0000FBFF
	ldrh r5, [r6]
	ands r0, r5
	strh r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r0, [r6]
	str r0, [r1]
	adds r1, #0x50
	ldrh r0, [r2]
	str r0, [r1]
	subs r1, #0x44
	ldrh r0, [r4, #4]
	str r0, [r1]
	movs r0, #0xb1
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	beq _0801E6E8
	bl sub_8012F7C
_0801E6E8:
	movs r0, #0xb2
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	bne _0801E6F8
	bl _0801F99A
_0801E6F8:
	bl sub_8012F7C
	bl _0801F99A
	.align 2, 0
_0801E700: .4byte 0x000003FF
_0801E704: .4byte gUnknown_03000000
_0801E708: .4byte 0x0000E0B0
_0801E70C: .4byte 0x040000D4
_0801E710: .4byte 0x06009600
_0801E714: .4byte 0x81000010
_0801E718: .4byte 0x0600F000
_0801E71C: .4byte 0x800002C0
_0801E720: .4byte 0x0000071F
_0801E724: .4byte 0x0000FFFB
_0801E728: .4byte 0x00001E02
_0801E72C: .4byte 0x0000FBFF
_0801E730:
	ldrh r0, [r6, #0x30]
	cmp r0, #5
	bls _0801E73A
	bl _0801F9D2
_0801E73A:
	lsls r0, r0, #2
	ldr r1, _0801E744 @ =_0801E748
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801E744: .4byte _0801E748
_0801E748: @ jump table
	.4byte _0801E760 @ case 0
	.4byte _0801E770 @ case 1
	.4byte _0801E7E4 @ case 2
	.4byte _0801E80C @ case 3
	.4byte _0801E862 @ case 4
	.4byte _0801E88C @ case 5
_0801E760:
	bl sub_801D984
	movs r1, #0
	movs r0, #1
	strh r0, [r6, #0x30]
	strh r1, [r6, #0x32]
	bl _0801F9D2
_0801E770:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x15
	bhi _0801E782
	bl _0801F9D2
_0801E782:
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801E794
	movs r0, #0x6f
	bl sub_8011150
	b _0801E79A
_0801E794:
	movs r0, #0x3a
	bl sub_8011150
_0801E79A:
	movs r0, #0xa
	mov r7, r8
	strh r0, [r7, #0x14]
	mov r2, r8
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	strb r1, [r7, #0x16]
	ldr r1, [sp, #0x14]
	adds r1, #0x4a
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _0801E7D8 @ =0x00001E09
	ldr r4, [sp, #0x14]
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, _0801E7DC @ =0x00001946
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801E7E0 @ =0x00000F18
	strh r0, [r1]
	bl _0801F822
	.align 2, 0
_0801E7D8: .4byte 0x00001E09
_0801E7DC: .4byte 0x00001946
_0801E7E0: .4byte 0x00000F18
_0801E7E4:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bhi _0801E7F6
	bl _0801F9D2
_0801E7F6:
	ldr r0, [sp, #0x14]
	adds r0, #0x4a
	ldr r1, _0801E808 @ =0x0000FBFF
	ldrh r5, [r0]
	ands r1, r5
	strh r1, [r0]
	bl _0801F898
	.align 2, 0
_0801E808: .4byte 0x0000FBFF
_0801E80C:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2b
	bhi _0801E81E
	bl _0801F9D2
_0801E81E:
	ldr r0, [sp, #0x14]
	adds r0, #0x4a
	movs r7, #0x80
	lsls r7, r7, #3
	adds r1, r7, #0
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801E840
	movs r0, #0x6f
	bl sub_8011150
	b _0801E846
_0801E840:
	movs r0, #0x3a
	bl sub_8011150
_0801E846:
	movs r0, #0xa
	mov r3, r8
	strh r0, [r3, #0x14]
	mov r2, r8
	adds r2, #0xe8
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	strb r1, [r3, #0x16]
	movs r0, #4
	strh r0, [r6, #0x30]
	bl _0801F9D2
_0801E862:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x35
	bhi _0801E874
	bl _0801F9D2
_0801E874:
	ldr r0, [sp, #0x14]
	adds r0, #0x4a
	ldr r1, _0801E888 @ =0x0000FBFF
	ldrh r4, [r0]
	ands r1, r4
	strh r1, [r0]
	movs r0, #5
	strh r0, [r6, #0x30]
	bl _0801F9D2
	.align 2, 0
_0801E888: .4byte 0x0000FBFF
_0801E88C:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x42
	bhi _0801E89E
	bl _0801F9D2
_0801E89E:
	ldr r0, [sp, #0x14]
	adds r0, #0x4a
	movs r5, #0x80
	lsls r5, r5, #3
	adds r1, r5, #0
	ldrh r7, [r0]
	orrs r1, r7
	strh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801E8C0
	movs r0, #0x6f
	bl sub_8011150
	b _0801E8C6
_0801E8C0:
	movs r0, #0x3a
	bl sub_8011150
_0801E8C6:
	movs r4, #0
	movs r1, #0
	movs r0, #0xa
	mov r2, r8
	strh r0, [r2, #0x14]
	mov r3, r8
	adds r3, #0xe8
	ldr r0, [r3]
	movs r2, #1
	orrs r0, r2
	str r0, [r3]
	mov r3, r8
	strb r2, [r3, #0x16]
	adds r0, r6, #0
	adds r0, #0x2e
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, #8
	str r0, [r6]
	strh r1, [r6, #0x3c]
	strh r1, [r6, #0x3a]
	strh r1, [r6, #0x38]
	strh r1, [r6, #0x36]
	strh r1, [r6, #0x34]
	strh r1, [r6, #0x32]
	strh r1, [r6, #0x30]
	ldr r0, _0801E904 @ =0x0000FFFE
	strh r0, [r6, #0x3e]
	bl _0801F3AC
	.align 2, 0
_0801E904: .4byte 0x0000FFFE
_0801E908:
	ldrh r0, [r6, #0x30]
	cmp r0, #0
	beq _0801E916
	cmp r0, #1
	beq _0801E9A8
	bl _0801F9D2
_0801E916:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	movs r0, #2
	strh r0, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
	ldr r7, _0801E964 @ =gUnknown_0826FE38
	ldr r0, [r7, #4]
	ldr r4, _0801E968 @ =gUnknown_08252498
	adds r3, r0, r4
	ldr r7, _0801E96C @ =0x050003A0
	ldr r5, _0801E970 @ =gUnknown_03000844
	mov sb, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	mov r2, sb
	cmp r0, #0
	beq _0801E974
	movs r5, #0
_0801E944:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801E944
	ldr r2, _0801E970 @ =gUnknown_03000844
	b _0801E980
	.align 2, 0
_0801E964: .4byte gUnknown_0826FE38
_0801E968: .4byte gUnknown_08252498
_0801E96C: .4byte 0x050003A0
_0801E970: .4byte gUnknown_03000844
_0801E974:
	ldr r0, _0801E9F4 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801E9F8 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
_0801E980:
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	movs r5, #0
	movs r4, #0x80
_0801E98C:
	adds r0, r5, #0
	adds r0, #0x83
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	beq _0801E9A2
	ldr r0, [r0]
	orrs r0, r4
	mov r7, sb
	str r0, [r7]
_0801E9A2:
	adds r5, #1
	cmp r5, #2
	bls _0801E98C
_0801E9A8:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	cmp r1, r0
	ble _0801EA04
	movs r0, #0
	bl sub_8016FEC
	ldr r0, _0801E9FC @ =gUnknown_03000844
	bl sub_8012F7C
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	ldr r0, _0801EA00 @ =0x0000071F
	strh r0, [r1]
	adds r2, r6, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	subs r0, r1, #5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0801E9E8
	bl _0801F906
_0801E9E8:
	strh r1, [r6, #0x20]
	movs r0, #6
	strh r0, [r2]
	bl _0801F906
	.align 2, 0
_0801E9F4: .4byte 0x040000D4
_0801E9F8: .4byte 0x80000010
_0801E9FC: .4byte gUnknown_03000844
_0801EA00: .4byte 0x0000071F
_0801EA04:
	ldrh r0, [r6, #0x32]
	adds r1, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0801EA16
	movs r5, #0xf
_0801EA16:
	lsls r0, r5, #8
	adds r0, #0xf
	subs r0, r0, r5
	b _0801EB4E
_0801EA1E:
	ldrh r0, [r6, #0x30]
	cmp r0, #1
	beq _0801EAD0
	cmp r0, #1
	bgt _0801EA30
	cmp r0, #0
	beq _0801EA3A
	bl _0801F9D2
_0801EA30:
	cmp r0, #2
	bne _0801EA36
	b _0801EB58
_0801EA36:
	bl _0801F9D2
_0801EA3A:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	movs r0, #2
	strh r0, [r6, #0x32]
	movs r0, #1
	strh r0, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r5, r6, #0
	adds r5, #0x4a
	ldrh r1, [r5]
	movs r4, #0x80
	str r4, [sp]
	movs r2, #0x78
	movs r3, #0x50
	bl sub_8012700
	ldrh r1, [r5]
	mov r0, r8
	adds r0, #0xc4
	strh r1, [r0]
	ldrh r1, [r5]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _0801EB14 @ =gUnknown_03000844
	mov sb, r0
	ldr r0, [r0]
	orrs r0, r4
	mov r1, sb
	str r0, [r1]
	ldr r7, _0801EB18 @ =gUnknown_0826FE38
	ldr r0, [r7, #4]
	ldr r2, _0801EB1C @ =gUnknown_08252498
	adds r3, r0, r2
	ldr r7, _0801EB20 @ =0x050003A0
	ldr r0, _0801EB24 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801EB28 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0801EB2C @ =0xFEFFFFFF
	ands r0, r1
	mov r3, sb
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0x4e
	ldrh r4, [r1]
	cmp r4, #6
	bne _0801EAD0
	ldrh r0, [r6, #0x20]
	strh r0, [r1]
	movs r5, #0
	movs r4, #0x80
_0801EAB4:
	adds r0, r5, #0
	adds r0, #0x83
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	beq _0801EACA
	ldr r0, [r0]
	orrs r0, r4
	mov r7, sb
	str r0, [r7]
_0801EACA:
	adds r5, #1
	cmp r5, #2
	bls _0801EAB4
_0801EAD0:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r3, r6, #0
	adds r3, #0x46
	ldrh r2, [r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	cmp r1, r0
	ble _0801EB34
	ldr r0, _0801EB14 @ =gUnknown_03000844
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x40
	ands r0, r1
	ldr r1, _0801EB2C @ =0xFEFFFFFF
	ands r0, r1
	ldr r1, _0801EB30 @ =0xFDFFFFFF
	ands r0, r1
	mov r1, sb
	str r0, [r1]
	movs r0, #2
	strh r0, [r6, #0x30]
	movs r0, #0
	strh r0, [r6, #0x32]
	movs r0, #1
	strh r0, [r3]
	bl _0801F9D2
	.align 2, 0
_0801EB14: .4byte gUnknown_03000844
_0801EB18: .4byte gUnknown_0826FE38
_0801EB1C: .4byte gUnknown_08252498
_0801EB20: .4byte 0x050003A0
_0801EB24: .4byte 0x040000D4
_0801EB28: .4byte 0x80000010
_0801EB2C: .4byte 0xFEFFFFFF
_0801EB30: .4byte 0xFDFFFFFF
_0801EB34:
	ldrh r0, [r6, #0x32]
	adds r1, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xf
	bls _0801EB46
	movs r5, #0xf
_0801EB46:
	movs r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #8
	adds r0, r0, r5
_0801EB4E:
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	strh r0, [r1]
	bl _0801F9D2
_0801EB58:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	cmp r1, r0
	bge _0801EB72
	b _0801F26C
_0801EB72:
	ldr r7, _0801EBC8 @ =gUnknown_0826F888
	ldr r0, [r7, #4]
	ldr r2, _0801EBCC @ =gUnknown_08252498
	adds r3, r0, r2
	ldr r7, _0801EBD0 @ =0x050003A0
	ldr r0, _0801EBD4 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801EBD8 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	ldr r1, _0801EBDC @ =0x0000071F
	strh r1, [r0]
	ldr r0, _0801EBE0 @ =0x04000052
	strh r1, [r0]
	movs r5, #0
_0801EB96:
	adds r0, r5, #0
	adds r0, #0x83
	bl sub_8011D68
	mov sb, r0
	cmp r0, #0
	beq _0801EBBC
	ldr r0, [r0]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x40
	ands r0, r1
	ldr r1, _0801EBE4 @ =0xFEFFFFFF
	ands r0, r1
	ldr r1, _0801EBE8 @ =0xFDFFFFFF
	ands r0, r1
	mov r3, sb
	str r0, [r3]
_0801EBBC:
	adds r5, #1
	cmp r5, #2
	bls _0801EB96
	bl _0801F906
	.align 2, 0
_0801EBC8: .4byte gUnknown_0826F888
_0801EBCC: .4byte gUnknown_08252498
_0801EBD0: .4byte 0x050003A0
_0801EBD4: .4byte 0x040000D4
_0801EBD8: .4byte 0x80000010
_0801EBDC: .4byte 0x0000071F
_0801EBE0: .4byte 0x04000052
_0801EBE4: .4byte 0xFEFFFFFF
_0801EBE8: .4byte 0xFDFFFFFF
_0801EBEC:
	ldrh r0, [r6, #0x30]
	cmp r0, #0
	beq _0801EBFA
	cmp r0, #1
	beq _0801EC9A
	bl _0801F9D2
_0801EBFA:
	ldr r7, _0801EC40 @ =gUnknown_0826FE38
	ldr r0, [r7, #4]
	ldr r4, _0801EC44 @ =gUnknown_08252498
	adds r3, r0, r4
	ldr r7, _0801EC48 @ =0x050003A0
	ldr r5, _0801EC4C @ =gUnknown_03000844
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801EC50
	movs r5, #0
	movs r0, #0x46
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x48
	adds r1, r1, r6
	mov sb, r1
	mov r4, r8
	adds r4, #0x8f
_0801EC24:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801EC24
	b _0801EC6C
	.align 2, 0
_0801EC40: .4byte gUnknown_0826FE38
_0801EC44: .4byte gUnknown_08252498
_0801EC48: .4byte 0x050003A0
_0801EC4C: .4byte gUnknown_03000844
_0801EC50:
	ldr r0, _0801ED1C @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801ED20 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x46
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0x48
	adds r3, r3, r6
	mov sb, r3
	mov r4, r8
	adds r4, #0x8f
_0801EC6C:
	mov r5, sl
	ldrh r0, [r5]
	mov r1, r8
	adds r1, #0x8e
	strb r0, [r1]
	mov r7, sb
	ldrh r0, [r7]
	strb r0, [r4]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0801ED24 @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	mov r1, sb
	str r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801EC9A:
	adds r4, r6, #0
	adds r4, #0x4a
	movs r0, #0xc0
	ldr r1, [sp, #0x14]
	adds r1, #0x48
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r1]
	mov r5, r8
	adds r5, #0x8c
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r3, _0801ED28 @ =0x0000FFFF
	adds r1, r3, #0
	mov r2, r8
	adds r2, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, [sp, #0x14]
	adds r3, #0x4e
	ldrb r2, [r2]
	cmp r0, r2
	blo _0801ECDA
	movs r0, #0
	strh r0, [r5]
	mov r0, r8
	adds r0, #0x8f
	ldrh r7, [r3]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r3]
_0801ECDA:
	movs r0, #0x1f
	ldrh r2, [r3]
	ands r0, r2
	strh r0, [r3]
	cmp r0, #0x10
	beq _0801ECF4
	mov r0, r8
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801ECF4
	bl _0801F9D2
_0801ECF4:
	movs r0, #0x10
	strh r0, [r3]
	ldrh r3, [r5]
	orrs r1, r3
	strh r1, [r5]
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0801ED0A
	bl _0801F906
_0801ED0A:
	movs r0, #0
	bl sub_8016FEC
	ldr r0, _0801ED2C @ =gUnknown_03000844
	bl sub_8012F7C
	bl _0801F906
	.align 2, 0
_0801ED1C: .4byte 0x040000D4
_0801ED20: .4byte 0x80000010
_0801ED24: .4byte 0xFEFFFFFF
_0801ED28: .4byte 0x0000FFFF
_0801ED2C: .4byte gUnknown_03000844
_0801ED30:
	ldrh r0, [r6, #0x30]
	cmp r0, #1
	beq _0801EDF2
	cmp r0, #1
	bgt _0801ED42
	cmp r0, #0
	beq _0801ED4C
	bl _0801F9D2
_0801ED42:
	cmp r0, #2
	bne _0801ED48
	b _0801EE9C
_0801ED48:
	bl _0801F9D2
_0801ED4C:
	ldr r7, _0801ED94 @ =gUnknown_0826FE38
	ldr r0, [r7, #4]
	ldr r4, _0801ED98 @ =gUnknown_08252498
	adds r3, r0, r4
	ldr r5, _0801ED9C @ =gUnknown_03000844
	ldr r7, _0801EDA0 @ =0x050003A0
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801EDA4
	movs r5, #0
	movs r0, #0x46
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x48
	adds r1, r1, r6
	mov sb, r1
	mov r4, r8
	adds r4, #0x8f
_0801ED76:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801ED76
	b _0801EDC0
	.align 2, 0
_0801ED94: .4byte gUnknown_0826FE38
_0801ED98: .4byte gUnknown_08252498
_0801ED9C: .4byte gUnknown_03000844
_0801EDA0: .4byte 0x050003A0
_0801EDA4:
	ldr r0, _0801EE84 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801EE88 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x46
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0x48
	adds r3, r3, r6
	mov sb, r3
	mov r4, r8
	adds r4, #0x8f
_0801EDC0:
	mov r5, sl
	ldrh r0, [r5]
	mov r1, r8
	adds r1, #0x8e
	strb r0, [r1]
	mov r7, sb
	ldrh r0, [r7]
	strb r0, [r4]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0801EE8C @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	ldr r1, _0801EE90 @ =0xFDFFFFFF
	ands r0, r1
	mov r1, sb
	str r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801EDF2:
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0xc0
	ldr r5, [sp, #0x14]
	adds r5, #0x48
	movs r2, #0
	mov sb, r2
	movs r4, #0
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r5]
	mov r2, r8
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r3, _0801EE94 @ =0x0000FFFF
	adds r7, r3, #0
	mov r1, r8
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, [sp, #0x14]
	adds r3, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _0801EE36
	strh r4, [r2]
	mov r0, r8
	adds r0, #0x8f
	ldrh r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strh r0, [r3]
_0801EE36:
	movs r0, #0x1f
	ldrh r1, [r3]
	ands r0, r1
	strh r0, [r3]
	cmp r0, #0
	beq _0801EE50
	mov r0, r8
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801EE50
	bl _0801F9D2
_0801EE50:
	strh r4, [r3]
	ldrh r0, [r2]
	orrs r0, r7
	strh r0, [r2]
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0801EE98 @ =0x00001D42
	strh r0, [r5]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0x80
	orrs r0, r1
	mov r2, sb
	str r0, [r2]
	strh r4, [r6, #0x32]
	adds r1, r6, #0
	adds r1, #0x48
	movs r0, #1
	strh r0, [r1]
	bl _0801F822
	.align 2, 0
_0801EE84: .4byte 0x040000D4
_0801EE88: .4byte 0x80000010
_0801EE8C: .4byte 0xFEFFFFFF
_0801EE90: .4byte 0xFDFFFFFF
_0801EE94: .4byte 0x0000FFFF
_0801EE98: .4byte 0x00001D42
_0801EE9C:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	cmp r1, r0
	bge _0801EEB6
	b _0801F26C
_0801EEB6:
	ldr r7, _0801EEF0 @ =gUnknown_0826F888
	ldr r0, [r7, #4]
	ldr r4, _0801EEF4 @ =gUnknown_08252498
	adds r3, r0, r4
	ldr r7, _0801EEF8 @ =0x050003A0
	ldr r5, _0801EEFC @ =gUnknown_03000844
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801EF00
	movs r5, #0
	ldr r4, [sp, #0x14]
	adds r4, #0x4c
_0801EED4:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801EED4
	b _0801EF10
	.align 2, 0
_0801EEF0: .4byte gUnknown_0826F888
_0801EEF4: .4byte gUnknown_08252498
_0801EEF8: .4byte 0x050003A0
_0801EEFC: .4byte gUnknown_03000844
_0801EF00:
	ldr r0, _0801EF1C @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801EF20 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r4, [sp, #0x14]
	adds r4, #0x4c
_0801EF10:
	ldr r1, _0801EF24 @ =0x0000071F
	strh r1, [r4]
	ldr r0, _0801EF28 @ =0x04000052
	strh r1, [r0]
	bl _0801F906
	.align 2, 0
_0801EF1C: .4byte 0x040000D4
_0801EF20: .4byte 0x80000010
_0801EF24: .4byte 0x0000071F
_0801EF28: .4byte 0x04000052
_0801EF2C:
	ldrh r0, [r6, #0x30]
	cmp r0, #0
	beq _0801EF3A
	cmp r0, #1
	beq _0801EFDE
	bl _0801F9D2
_0801EF3A:
	ldr r7, _0801EF80 @ =gUnknown_0826FE38
	ldr r0, [r7, #4]
	ldr r7, _0801EF84 @ =gUnknown_08252498
	adds r3, r0, r7
	ldr r7, _0801EF88 @ =0x050003A0
	ldr r0, _0801EF8C @ =gUnknown_03000844
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801EF90
	movs r5, #0
	movs r1, #0x46
	adds r1, r1, r6
	mov sl, r1
	movs r2, #0x48
	adds r2, r2, r6
	mov sb, r2
	mov r4, r8
	adds r4, #0x8f
_0801EF64:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801EF64
	b _0801EFAC
	.align 2, 0
_0801EF80: .4byte gUnknown_0826FE38
_0801EF84: .4byte gUnknown_08252498
_0801EF88: .4byte 0x050003A0
_0801EF8C: .4byte gUnknown_03000844
_0801EF90:
	ldr r0, _0801F058 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801F05C @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r3, #0x46
	adds r3, r3, r6
	mov sl, r3
	movs r4, #0x48
	adds r4, r4, r6
	mov sb, r4
	mov r4, r8
	adds r4, #0x8f
_0801EFAC:
	mov r5, sb
	ldrh r0, [r5]
	mov r1, r8
	adds r1, #0x8e
	strb r0, [r1]
	mov r7, sl
	ldrh r0, [r7]
	strb r0, [r4]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0801F060 @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	ldr r1, _0801F064 @ =0xFDFFFFFF
	ands r0, r1
	mov r1, sb
	str r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801EFDE:
	mov r2, r8
	adds r2, #0x88
	movs r0, #0x80
	ldr r1, [sp, #0x14]
	adds r1, #0x48
	movs r5, #0
	ldrh r2, [r2]
	orrs r0, r2
	strh r0, [r1]
	mov r2, r8
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r3, _0801F068 @ =0x0000FFFF
	adds r4, r3, #0
	mov r1, r8
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, [sp, #0x14]
	adds r3, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _0801F01E
	strh r5, [r2]
	mov r0, r8
	adds r0, #0x8f
	ldrh r7, [r3]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r3]
_0801F01E:
	movs r0, #0x1f
	ldrh r1, [r3]
	ands r0, r1
	strh r0, [r3]
	cmp r0, #0x10
	beq _0801F038
	mov r0, r8
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801F038
	bl _0801F9D2
_0801F038:
	movs r0, #0x10
	strh r0, [r3]
	mov r0, r8
	adds r0, #0x8a
	strh r5, [r0]
	ldrh r0, [r2]
	orrs r0, r4
	strh r0, [r2]
	movs r0, #0
	bl sub_8016FEC
	ldr r0, _0801F06C @ =gUnknown_03000844
	bl sub_8012F7C
	bl _0801F906
	.align 2, 0
_0801F058: .4byte 0x040000D4
_0801F05C: .4byte 0x80000010
_0801F060: .4byte 0xFEFFFFFF
_0801F064: .4byte 0xFDFFFFFF
_0801F068: .4byte 0x0000FFFF
_0801F06C: .4byte gUnknown_03000844
_0801F070:
	ldrh r0, [r6, #0x30]
	cmp r0, #1
	beq _0801F132
	cmp r0, #1
	bgt _0801F082
	cmp r0, #0
	beq _0801F08C
	bl _0801F9D2
_0801F082:
	cmp r0, #2
	bne _0801F088
	b _0801F1DC
_0801F088:
	bl _0801F9D2
_0801F08C:
	ldr r7, _0801F0D4 @ =gUnknown_0826FE38
	ldr r0, [r7, #4]
	ldr r2, _0801F0D8 @ =gUnknown_08252498
	adds r3, r0, r2
	ldr r7, _0801F0DC @ =0x050003A0
	ldr r4, _0801F0E0 @ =gUnknown_03000844
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801F0E4
	movs r5, #0
	movs r0, #0x46
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x48
	adds r1, r1, r6
	mov sb, r1
	mov r4, r8
	adds r4, #0x8f
_0801F0B6:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801F0B6
	b _0801F100
	.align 2, 0
_0801F0D4: .4byte gUnknown_0826FE38
_0801F0D8: .4byte gUnknown_08252498
_0801F0DC: .4byte 0x050003A0
_0801F0E0: .4byte gUnknown_03000844
_0801F0E4:
	ldr r0, _0801F1C4 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801F1C8 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x46
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0x48
	adds r3, r3, r6
	mov sb, r3
	mov r4, r8
	adds r4, #0x8f
_0801F100:
	mov r5, sl
	ldrh r0, [r5]
	mov r1, r8
	adds r1, #0x8e
	strb r0, [r1]
	mov r7, sb
	ldrh r0, [r7]
	strb r0, [r4]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _0801F1CC @ =0xFEFFFFFF
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x40
	ands r0, r1
	ldr r1, _0801F1D0 @ =0xFDFFFFFF
	ands r0, r1
	mov r1, sb
	str r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x30]
_0801F132:
	mov r1, r8
	adds r1, #0x88
	movs r0, #0x80
	ldr r5, [sp, #0x14]
	adds r5, #0x48
	movs r2, #0
	mov sb, r2
	movs r4, #0
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r5]
	mov r2, r8
	adds r2, #0x8c
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r3, _0801F1D4 @ =0x0000FFFF
	mov sl, r3
	mov r1, r8
	adds r1, #0x8e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, [sp, #0x14]
	adds r3, #0x4e
	ldrb r1, [r1]
	cmp r0, r1
	blo _0801F176
	strh r4, [r2]
	mov r0, r8
	adds r0, #0x8f
	ldrh r7, [r3]
	ldrb r0, [r0]
	subs r0, r7, r0
	strh r0, [r3]
_0801F176:
	adds r1, r3, #0
	movs r0, #0x1f
	ldrh r7, [r1]
	ands r0, r7
	strh r0, [r1]
	cmp r0, #0
	beq _0801F192
	mov r0, r8
	adds r0, #0x8f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801F192
	bl _0801F9D2
_0801F192:
	strh r4, [r3]
	mov r0, r8
	adds r0, #0x8a
	strh r4, [r0]
	ldrh r0, [r2]
	mov r1, sl
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801F1D8 @ =0x00001D42
	strh r0, [r5]
	bl sub_8016FB4
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0x80
	orrs r0, r1
	mov r2, sb
	str r0, [r2]
	strh r4, [r6, #0x32]
	adds r1, r6, #0
	adds r1, #0x48
	movs r0, #1
	strh r0, [r1]
	b _0801F822
	.align 2, 0
_0801F1C4: .4byte 0x040000D4
_0801F1C8: .4byte 0x80000010
_0801F1CC: .4byte 0xFEFFFFFF
_0801F1D0: .4byte 0xFDFFFFFF
_0801F1D4: .4byte 0x0000FFFF
_0801F1D8: .4byte 0x00001D42
_0801F1DC:
	ldrh r1, [r6, #0x32]
	adds r1, #1
	strh r1, [r6, #0x32]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r2, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	cmp r1, r0
	blt _0801F26C
	ldr r7, _0801F230 @ =gUnknown_0826F888
	ldr r0, [r7, #4]
	ldr r4, _0801F234 @ =gUnknown_08252498
	adds r3, r0, r4
	ldr r7, _0801F238 @ =0x050003A0
	ldr r5, _0801F23C @ =gUnknown_03000844
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801F240
	movs r5, #0
	ldr r4, [sp, #0x14]
	adds r4, #0x4c
_0801F212:
	ldrh r0, [r3]
	movs r1, #0x20
	movs r2, #0
	str r3, [sp, #0x18]
	bl sub_8005574
	strh r0, [r7]
	ldr r3, [sp, #0x18]
	adds r3, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0801F212
	b _0801F250
	.align 2, 0
_0801F230: .4byte gUnknown_0826F888
_0801F234: .4byte gUnknown_08252498
_0801F238: .4byte 0x050003A0
_0801F23C: .4byte gUnknown_03000844
_0801F240:
	ldr r0, _0801F25C @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801F260 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r4, [sp, #0x14]
	adds r4, #0x4c
_0801F250:
	ldr r1, _0801F264 @ =0x0000071F
	strh r1, [r4]
	ldr r0, _0801F268 @ =0x04000052
	strh r1, [r0]
	b _0801F906
	.align 2, 0
_0801F25C: .4byte 0x040000D4
_0801F260: .4byte 0x80000010
_0801F264: .4byte 0x0000071F
_0801F268: .4byte 0x04000052
_0801F26C:
	ldrh r0, [r6, #0x32]
	adds r1, r2, #0
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #8
	adds r1, #0x10
	lsrs r0, r0, #0x11
	subs r1, r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	strh r1, [r0]
	b _0801F9D2
_0801F286:
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #1
	strh r0, [r1]
	b _0801F99A
_0801F290:
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #3
	strh r0, [r1]
	b _0801F99A
_0801F29A:
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #8
	strh r0, [r1]
	b _0801F99A
_0801F2A4:
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #4
	strh r0, [r1]
	b _0801F99A
_0801F2AE:
	ldrh r0, [r6, #0x30]
	cmp r0, #1
	bne _0801F2B6
	b _0801F9D2
_0801F2B6:
	cmp r0, #1
	bgt _0801F2C0
	cmp r0, #0
	beq _0801F2C6
	b _0801F9D2
_0801F2C0:
	cmp r0, #2
	beq _0801F2FA
	b _0801F9D2
_0801F2C6:
	mov r7, r8
	ldrh r0, [r7, #0x34]
	movs r1, #0
	strh r0, [r7, #0x38]
	movs r0, #0xe
	strh r0, [r7, #0x34]
	mov r0, r8
	adds r0, #0x3c
	movs r2, #1
	strb r2, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	add r0, r8
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0x80
	strh r0, [r1]
	mov r1, r8
	adds r1, #0x3d
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	strh r2, [r6, #0x32]
	b _0801F9D2
_0801F2FA:
	movs r0, #0xe
	bl sub_8002278
	adds r3, r0, #0
	ldr r1, _0801F330 @ =0x040000D4
	str r3, [r1]
	ldr r0, _0801F334 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _0801F338 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F370
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #1
	beq _0801F352
	cmp r0, #1
	bgt _0801F33C
	cmp r0, #0
	beq _0801F342
	b _0801F370
	.align 2, 0
_0801F330: .4byte 0x040000D4
_0801F334: .4byte 0x05000040
_0801F338: .4byte 0x80000010
_0801F33C:
	cmp r0, #2
	beq _0801F362
	b _0801F370
_0801F342:
	bl sub_800B7CC
	movs r0, #0x18
	movs r1, #0x80
	movs r2, #1
	bl sub_800B898
	b _0801F370
_0801F352:
	bl sub_800B974
	movs r0, #0
	movs r1, #0x80
	movs r2, #1
	bl sub_800BA40
	b _0801F370
_0801F362:
	bl sub_800B974
	movs r0, #0x20
	movs r1, #0x80
	movs r2, #1
	bl sub_800BB14
_0801F370:
	ldr r2, _0801F38C @ =gMain
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	movs r4, #0xe
	rsbs r4, r4, #0
	adds r1, r4, #0
	cmp r0, #0
	beq _0801F384
	movs r1, #0xe
_0801F384:
	adds r0, r2, #0
	adds r0, #0x4c
	strb r1, [r0]
	b _0801F906
	.align 2, 0
_0801F38C: .4byte gMain
_0801F390:
	movs r0, #0
	ldr r5, [sp, #0x10]
	strh r0, [r5, #0x3a]
	strh r0, [r5, #0x38]
	strh r0, [r5, #0x36]
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
	strh r0, [r5, #0x30]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	strh r0, [r5, #0x3c]
	ldr r0, _0801F3B8 @ =0x0000FFFF
	strh r0, [r5, #0x3e]
_0801F3AC:
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x63
	strb r0, [r1]
	b _0801F9D2
	.align 2, 0
_0801F3B8: .4byte 0x0000FFFF
_0801F3BC:
	ldr r0, _0801F3D8 @ =gUnknown_03000800
	ldr r0, [r0, #0x64]
	ldr r5, [r0]
	cmp r5, #3
	bne _0801F3E8
	ldr r1, _0801F3DC @ =0x040000D4
	movs r0, #0
	str r0, [r1]
	ldr r0, _0801F3E0 @ =0x050003A0
	str r0, [r1, #4]
	ldr r0, _0801F3E4 @ =0x80000030
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0801F99A
	.align 2, 0
_0801F3D8: .4byte gUnknown_03000800
_0801F3DC: .4byte 0x040000D4
_0801F3E0: .4byte 0x050003A0
_0801F3E4: .4byte 0x80000030
_0801F3E8:
	ldr r2, _0801F400 @ =0x040000D4
	movs r0, #0
	str r0, [r2]
	ldr r0, _0801F404 @ =0x050003C0
	str r0, [r2, #4]
	lsls r0, r5, #4
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0801F99A
	.align 2, 0
_0801F400: .4byte 0x040000D4
_0801F404: .4byte 0x050003C0
_0801F408:
	ldr r7, _0801F480 @ =gUnknown_03000844
	mov sb, r7
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	mov r3, sb
	str r0, [r3]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r1, r0, #8
	lsls r0, r0, #0xc
	orrs r1, r0
	str r1, [r2, #0x44]
	ldr r1, _0801F484 @ =0x0000FFBF
	adds r0, r1, #0
	ldr r4, [sp, #0x14]
	ldrh r4, [r4, #6]
	ands r0, r4
	movs r2, #0
	ldr r5, [sp, #0x14]
	strh r0, [r5, #6]
	ldrh r7, [r5, #4]
	ands r1, r7
	strh r1, [r5, #4]
	mov r1, r8
	adds r1, #0x90
	movs r0, #0x13
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r1, #7
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	mov r3, r8
	adds r3, #0x96
	strb r0, [r3]
	mov r0, r8
	adds r0, #0x94
	strh r2, [r0]
	movs r5, #0
	ldr r0, _0801F488 @ =gOamObjects
	ldr r2, _0801F48C @ =0x0000EFFF
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r0, r3
_0801F46E:
	adds r0, r2, #0
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	adds r1, #8
	adds r5, #1
	cmp r5, #3
	bls _0801F46E
	b _0801F99A
	.align 2, 0
_0801F480: .4byte gUnknown_03000844
_0801F484: .4byte 0x0000FFBF
_0801F488: .4byte gOamObjects
_0801F48C: .4byte 0x0000EFFF
_0801F490:
	ldr r1, [sp, #0x14]
	adds r1, #0x48
	movs r2, #0
	movs r0, #0x8d
	lsls r0, r0, #4
	strh r0, [r1]
	ldr r1, [sp, #0x14]
	adds r1, #0x4e
	movs r0, #0x10
	strh r0, [r1]
	mov r1, r8
	adds r1, #0x90
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, #7
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	mov r3, r8
	adds r3, #0x96
	strb r0, [r3]
	mov r0, r8
	adds r0, #0x94
	strh r2, [r0]
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	movs r5, #0
	ldr r0, _0801F4F0 @ =gOamObjects
	movs r7, #0x80
	lsls r7, r7, #3
	adds r2, r7, #0
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r1, r0, r4
_0801F4E0:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, #8
	adds r5, #1
	cmp r5, #3
	bls _0801F4E0
	b _0801F99A
	.align 2, 0
_0801F4F0: .4byte gOamObjects
_0801F4F4:
	ldr r5, _0801F528 @ =gUnknown_03000844
	ldr r0, [r5]
	ldr r1, _0801F52C @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5]
	movs r2, #0
	ldr r7, [sp, #0x14]
	str r2, [r7, #0x44]
	movs r0, #0x40
	movs r3, #0
	ldrh r1, [r7, #6]
	orrs r1, r0
	strh r1, [r7, #6]
	ldrh r1, [r7, #4]
	orrs r0, r1
	strh r0, [r7, #4]
	mov r0, r8
	adds r0, #0x90
	strh r2, [r0]
	adds r0, #7
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	subs r0, #2
	strh r2, [r0]
	b _0801F99A
	.align 2, 0
_0801F528: .4byte gUnknown_03000844
_0801F52C: .4byte 0xFFFFF7FF
_0801F530:
	mov r5, r8
	adds r5, #0x90
	ldrh r3, [r5]
	cmp r3, #0
	beq _0801F53C
	b _0801F9D2
_0801F53C:
	ldr r4, [sp, #0x14]
	adds r4, #0x4e
	ldrh r2, [r4]
	cmp r2, #0x10
	bne _0801F548
	b _0801F9D2
_0801F548:
	ldr r1, [sp, #0x14]
	adds r1, #0x48
	movs r2, #0
	movs r0, #0xdf
	strh r0, [r1]
	strh r3, [r4]
	strh r3, [r5]
	mov r0, r8
	adds r0, #0x97
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	subs r0, #2
	strh r3, [r0]
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	movs r5, #0
	adds r1, r6, #0
	adds r1, #0x2e
	ldr r0, _0801F59C @ =gOamObjects
	ldr r3, _0801F5A0 @ =0x0000FBFF
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r2, r0, r4
_0801F57C:
	adds r0, r3, #0
	ldrh r7, [r2]
	ands r0, r7
	strh r0, [r2]
	adds r2, #8
	adds r5, #1
	cmp r5, #3
	bls _0801F57C
	movs r0, #0xf0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	bl sub_801D758
	b _0801F99A
	.align 2, 0
_0801F59C: .4byte gOamObjects
_0801F5A0: .4byte 0x0000FBFF
_0801F5A4:
	movs r0, #1
_0801F5A6:
	ldrh r3, [r6, #0x1e]
	orrs r0, r3
	strh r0, [r6, #0x1e]
	b _0801F99A
_0801F5AE:
	movs r0, #2
_0801F5B0:
	ldrh r4, [r6, #0x1e]
	orrs r0, r4
	strh r0, [r6, #0x1e]
	b _0801F99A
_0801F5B8:
	movs r0, #4
	ldrh r5, [r6, #0x1e]
	orrs r0, r5
	strh r0, [r6, #0x1e]
	b _0801F99A
_0801F5C2:
	movs r0, #8
_0801F5C4:
	ldrh r7, [r6, #0x1e]
	orrs r0, r7
	strh r0, [r6, #0x1e]
	b _0801F99A
_0801F5CC:
	movs r0, #0x10
	ldrh r1, [r6, #0x1e]
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r6, #0x1e]
	b _0801F99A
_0801F5DA:
	ldr r0, _0801F5E8 @ =0x0000FFEF
	ldrh r2, [r6, #0x1e]
	ands r0, r2
	ldr r1, _0801F5EC @ =0x0000FFDF
	ands r0, r1
	strh r0, [r6, #0x1e]
	b _0801F99A
	.align 2, 0
_0801F5E8: .4byte 0x0000FFEF
_0801F5EC: .4byte 0x0000FFDF
_0801F5F0:
	movs r0, #0x10
	b _0801F5A6
_0801F5F4:
	movs r0, #0x20
	b _0801F5B0
_0801F5F8:
	bl sub_8015C18
	b _0801F99A
_0801F5FE:
	adds r0, r3, #0
	bl sub_8006EAC
	ldr r0, [sp, #0x10]
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0x63
	beq _0801F610
	b _0801F9D2
_0801F610:
	ldr r1, [sp, #0x10]
	adds r1, #0x2e
	movs r0, #0xf0
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	b _0801F906
_0801F61E:
	add r5, sp, #8
	ldr r1, _0801F638 @ =gUnknown_0802873C
	adds r0, r5, #0
	movs r2, #5
	bl memcpy
	ldrh r4, [r6, #0x30]
	cmp r4, #0
	beq _0801F63C
	cmp r4, #1
	beq _0801F670
	b _0801F9D2
	.align 2, 0
_0801F638: .4byte gUnknown_0802873C
_0801F63C:
	ldr r7, _0801F66C @ =gUnknown_03000844
	mov sb, r7
	mov r0, sb
	bl sub_8012F7C
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F65E
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	mov r2, sb
	str r0, [r2]
_0801F65E:
	strh r4, [r6, #0x34]
	strh r4, [r6, #0x32]
	ldrh r0, [r6, #0x30]
	adds r0, #1
	strh r0, [r6, #0x30]
	b _0801F9D2
	.align 2, 0
_0801F66C: .4byte gUnknown_03000844
_0801F670:
	ldrh r0, [r6, #0x32]
	adds r0, #1
	strh r0, [r6, #0x32]
	ldr r3, _0801F6A8 @ =0x0000FFFF
	adds r2, r3, #0
	ldrh r4, [r6, #0x34]
	adds r1, r4, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0801F68A
	b _0801F9D2
_0801F68A:
	movs r0, #0
	strh r0, [r6, #0x32]
	ldr r5, _0801F6AC @ =gUnknown_03000844
	ldrh r0, [r5, #0x12]
	subs r0, #0xc
	strh r0, [r5, #0x12]
	ldrh r0, [r6, #0x34]
	adds r0, #1
	strh r0, [r6, #0x34]
	ands r0, r2
	cmp r0, #4
	bhi _0801F6A4
	b _0801F9D2
_0801F6A4:
	b _0801F906
	.align 2, 0
_0801F6A8: .4byte 0x0000FFFF
_0801F6AC: .4byte gUnknown_03000844
_0801F6B0:
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #7
	strh r0, [r1]
	b _0801F99A
_0801F6BA:
	ldr r0, [sp, #0x10]
	adds r0, #0x46
	movs r1, #3
	ldrh r7, [r0]
	ands r1, r7
	strh r1, [r0]
	ldr r0, _0801F6D4 @ =0x0000FFFC
	ldrh r3, [r2, #6]
	ands r0, r3
	adds r1, r1, r0
	strh r1, [r2, #6]
	b _0801F99A
	.align 2, 0
_0801F6D4: .4byte 0x0000FFFC
_0801F6D8:
	ldr r0, [sp, #0x10]
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F700
	ldr r0, _0801F6FC @ =0x0000FEFF
	ldr r4, [sp, #0x10]
	ldrh r4, [r4, #0x1e]
	ands r0, r4
	movs r1, #0
	ldr r5, [sp, #0x10]
	strh r0, [r5, #0x1e]
	movs r0, #7
	mov r7, r8
	strb r0, [r7, #0xa]
	strb r1, [r7, #0xb]
	b _0801F99A
	.align 2, 0
_0801F6FC: .4byte 0x0000FEFF
_0801F700:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldr r2, [sp, #0x10]
	ldrh r2, [r2, #0x1e]
	orrs r0, r2
	ldr r3, [sp, #0x10]
	strh r0, [r3, #0x1e]
	b _0801F99A
_0801F712:
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	bl sub_8011D68
	mov sb, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	mov r4, sb
	str r0, [r4]
	b _0801F99A
_0801F72C:
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	b _0801F5C4
_0801F734:
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r2, [r6, #0x1e]
	orrs r0, r2
	strh r0, [r6, #0x1e]
	b _0801F99A
_0801F742:
	ldrh r0, [r6, #0x30]
	cmp r0, #1
	beq _0801F78C
	cmp r0, #1
	bgt _0801F752
	cmp r0, #0
	beq _0801F760
	b _0801F9D2
_0801F752:
	cmp r0, #2
	bne _0801F758
	b _0801F85C
_0801F758:
	cmp r0, #3
	bne _0801F75E
	b _0801F89E
_0801F75E:
	b _0801F9D2
_0801F760:
	mov r3, r8
	ldrh r0, [r3, #0x34]
	strh r0, [r3, #0x38]
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	strh r0, [r3, #0x34]
	mov r0, r8
	adds r0, #0x3c
	movs r2, #1
	strb r2, [r0]
	movs r1, #0x96
	lsls r1, r1, #2
	add r1, r8
	movs r0, #4
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0x80
	strh r0, [r1]
	strh r2, [r6, #0x30]
	b _0801F9D2
_0801F78C:
	ldr r4, _0801F828 @ =0x040000D4
	ldr r0, _0801F82C @ =gUnknown_03001080
	str r0, [r4]
	ldr r0, _0801F830 @ =gUnknown_03000000
	str r0, [r4, #4]
	ldr r0, _0801F834 @ =0x80000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r5, #0
	movs r0, #8
	ldr r7, [sp, #0x14]
	strh r0, [r7, #0x12]
	strh r0, [r7, #0x10]
	ldr r1, _0801F838 @ =0x04000018
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	movs r0, #4
	mov r1, r8
	ldrb r1, [r1, #0x1a]
	orrs r0, r1
	mov r2, r8
	strb r0, [r2, #0x1a]
	adds r1, r7, #0
	adds r1, #0x4a
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r7, [r1]
	orrs r0, r7
	strh r0, [r1]
	ldr r0, _0801F83C @ =0x00003E07
	ldr r1, [sp, #0x14]
	strh r0, [r1, #4]
	ldr r0, _0801F840 @ =0x00003F4A
	strh r0, [r1, #6]
	ldr r3, _0801F844 @ =gUnknown_02031AC0
	ldr r7, _0801F848 @ =0x06009000
	str r3, [r4]
	str r7, [r4, #4]
	ldr r0, _0801F84C @ =0x80002580
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r2, #0x46
	adds r2, r2, r6
	mov r8, r2
	ldrh r0, [r2]
	bl sub_8002278
	adds r3, r0, #0
	ldr r7, _0801F850 @ =0x05000060
	str r3, [r4]
	str r7, [r4, #4]
	ldr r0, _0801F854 @ =0x80000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl sub_800610C
	ldr r0, [sp, #0x14]
	adds r0, #0x4e
	strh r5, [r0]
	ldr r1, [sp, #0x14]
	adds r1, #0x48
	ldr r0, _0801F858 @ =0x00001748
	strh r0, [r1]
	ldr r1, [sp, #0x14]
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1]
	mov r3, r8
	strh r5, [r3]
	adds r0, r6, #0
	adds r0, #0x4a
	strh r5, [r0]
_0801F822:
	movs r0, #2
	strh r0, [r6, #0x30]
	b _0801F9D2
	.align 2, 0
_0801F828: .4byte 0x040000D4
_0801F82C: .4byte gUnknown_03001080
_0801F830: .4byte gUnknown_03000000
_0801F834: .4byte 0x80000400
_0801F838: .4byte 0x04000018
_0801F83C: .4byte 0x00003E07
_0801F840: .4byte 0x00003F4A
_0801F844: .4byte gUnknown_02031AC0
_0801F848: .4byte 0x06009000
_0801F84C: .4byte 0x80002580
_0801F850: .4byte 0x05000060
_0801F854: .4byte 0x80000010
_0801F858: .4byte 0x00001748
_0801F85C:
	adds r3, r6, #0
	adds r3, #0x46
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, r6, #0
	adds r1, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r6, #0
	adds r2, #0x4a
	ldrh r1, [r1]
	cmp r0, r1
	bls _0801F890
	movs r0, #0
	strh r0, [r3]
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r2]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #0x4c
	strh r1, [r0]
_0801F890:
	ldrh r2, [r2]
	cmp r2, #0x10
	beq _0801F898
	b _0801F9D2
_0801F898:
	movs r0, #3
	strh r0, [r6, #0x30]
	b _0801F9D2
_0801F89E:
	ldr r3, _0801F910 @ =0x06009000
	ldr r7, _0801F914 @ =0x06004000
	ldr r0, _0801F918 @ =0x040000D4
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801F91C @ =0x80002580
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r3, _0801F920 @ =0x05000060
	ldr r7, _0801F924 @ =0x05000040
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _0801F928 @ =0x80000010
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl sub_80060E8
	movs r2, #0
	ldr r0, _0801F92C @ =0x00003F47
	ldr r4, [sp, #0x14]
	strh r0, [r4, #6]
	movs r0, #0xf8
	lsls r0, r0, #6
	strh r0, [r4, #4]
	movs r0, #8
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x16]
	strh r0, [r4, #0x10]
	strh r2, [r4, #0x12]
	movs r0, #0xfb
	mov r5, r8
	ldrb r5, [r5, #0x1a]
	ands r0, r5
	movs r1, #8
	orrs r0, r1
	mov r7, r8
	strb r0, [r7, #0x1a]
	adds r1, r4, #0
	adds r1, #0x4a
	ldr r0, _0801F930 @ =0x0000FBFF
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	subs r1, #2
	ldr r0, _0801F934 @ =0x00001D42
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r2, [r0]
	adds r1, #4
_0801F902:
	ldr r0, _0801F938 @ =0x0000071F
	strh r0, [r1]
_0801F906:
	ldr r0, [sp, #0x10]
	bl sub_801D758
	b _0801F9D2
	.align 2, 0
_0801F910: .4byte 0x06009000
_0801F914: .4byte 0x06004000
_0801F918: .4byte 0x040000D4
_0801F91C: .4byte 0x80002580
_0801F920: .4byte 0x05000060
_0801F924: .4byte 0x05000040
_0801F928: .4byte 0x80000010
_0801F92C: .4byte 0x00003F47
_0801F930: .4byte 0x0000FBFF
_0801F934: .4byte 0x00001D42
_0801F938: .4byte 0x0000071F
_0801F93C:
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F952
	movs r0, #0x5f
	mov r4, r8
	strh r0, [r4, #0x34]
	bl sub_80049A0
	b _0801F99A
_0801F952:
	movs r0, #0x5e
	mov r5, r8
	strh r0, [r5, #0x34]
	bl sub_80049A0
	b _0801F99A
_0801F95E:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	cmp r0, #1
	beq _0801F980
	ldr r1, _0801F97C @ =gOamObjects
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	b _0801F99A
	.align 2, 0
_0801F97C: .4byte gOamObjects
_0801F980:
	ldr r1, _0801F9A4 @ =gUnknown_03003AF0
	adds r2, r6, #0
	adds r2, #0x46
	ldrh r7, [r2]
	lsls r0, r7, #2
	adds r2, r7, #0
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x48
	ldrh r1, [r1]
	strh r1, [r0, #0xe]
_0801F99A:
	ldr r0, [sp, #0x10]
	bl sub_8016F98
	b _0801F9D2
	.align 2, 0
_0801F9A4: .4byte gUnknown_03003AF0
_0801F9A8:
	adds r0, r6, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #1
	beq _0801F9C0
	ldr r0, _0801F9BC @ =0x0000DFFF
	ldrh r1, [r6, #0x1e]
	ands r0, r1
	b _0801F9CA
	.align 2, 0
_0801F9BC: .4byte 0x0000DFFF
_0801F9C0:
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	ldrh r3, [r6, #0x1e]
	orrs r0, r3
_0801F9CA:
	strh r0, [r6, #0x1e]
	ldr r0, [sp, #0x10]
	bl sub_8016F98
_0801F9D2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F9E4
sub_801F9E4: @ 0x0801F9E4
	push {r4, r5, r6, r7, lr}
	ldr r2, _0801FA18 @ =gScriptContext
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x54
	adds r2, r1, r2
	ldrh r6, [r2, #2]
	ldr r1, _0801FA1C @ =gUnknown_08028764
	ldrb r3, [r2, #0x17]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrh r4, [r0, #2]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r3, _0801FA20 @ =0x0000FFFF
	cmp r1, r0
	ble _0801FA0E
	movs r3, #1
_0801FA0E:
	adds r7, r3, #0
	cmp r1, r0
	ble _0801FA24
	subs r0, r1, r0
	b _0801FA26
	.align 2, 0
_0801FA18: .4byte gScriptContext
_0801FA1C: .4byte gUnknown_08028764
_0801FA20: .4byte 0x0000FFFF
_0801FA24:
	subs r0, r0, r1
_0801FA26:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0801FA48 @ =0x0000FFFF
	cmp r1, r0
	ble _0801FA3C
	movs r3, #1
_0801FA3C:
	adds r4, r3, #0
	cmp r1, r0
	ble _0801FA4C
	subs r0, r1, r0
	b _0801FA4E
	.align 2, 0
_0801FA48: .4byte 0x0000FFFF
_0801FA4C:
	subs r0, r0, r1
_0801FA4E:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	blt _0801FA64
	rsbs r0, r1, #0
	b _0801FA66
_0801FA64:
	rsbs r0, r0, #0
_0801FA66:
	strh r0, [r2, #0xa]
	movs r0, #0
	strh r5, [r2, #0x10]
	strh r3, [r2, #0x12]
	strh r7, [r2, #0xc]
	strh r4, [r2, #0xe]
	strh r0, [r2, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801FA7C
sub_801FA7C: @ 0x0801FA7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801FAC0 @ =gScriptContext
	mov sl, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, #0x54
	mov r2, sl
	adds r5, r1, r2
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	ldr r3, _0801FAC4 @ =gUnknown_03000844
	mov sb, r3
	ldr r1, _0801FAC8 @ =gUnknown_08028764
	ldrb r4, [r5, #0x17]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldrh r2, [r0]
	ldrh r3, [r0, #2]
	movs r6, #0xc
	ldrsh r0, [r5, r6]
	cmp r0, #0
	ble _0801FACC
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0801FAD2
	.align 2, 0
_0801FAC0: .4byte gScriptContext
_0801FAC4: .4byte gUnknown_03000844
_0801FAC8: .4byte gUnknown_08028764
_0801FACC:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_0801FAD2:
	str r0, [r7]
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	cmp r1, r0
	blt _0801FB1E
	ldrh r6, [r5]
	ldrh r1, [r5, #0xc]
	adds r0, r6, r1
	strh r0, [r5]
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	lsls r0, r0, #1
	ldrh r6, [r5, #0xa]
	adds r1, r6, r0
	strh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _0801FB0C
	ldrh r4, [r5, #2]
	ldrh r6, [r5, #0xe]
	adds r0, r4, r6
	strh r0, [r5, #2]
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	lsls r0, r0, #1
	subs r0, r1, r0
	strh r0, [r5, #0xa]
_0801FB0C:
	ldrh r0, [r5, #6]
	adds r0, #1
	strh r0, [r5, #6]
	movs r6, #0x10
	ldrsh r0, [r5, r6]
	ldrh r1, [r5, #6]
	cmp r1, r0
	blt _0801FB5E
	b _0801FB5A
_0801FB1E:
	ldrh r4, [r5, #2]
	ldrh r6, [r5, #0xe]
	adds r0, r4, r6
	strh r0, [r5, #2]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	ldrh r4, [r5, #0xa]
	adds r1, r4, r0
	strh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _0801FB4A
	ldrh r6, [r5]
	ldrh r4, [r5, #0xc]
	adds r0, r6, r4
	strh r0, [r5]
	movs r6, #0x12
	ldrsh r0, [r5, r6]
	lsls r0, r0, #1
	subs r0, r1, r0
	strh r0, [r5, #0xa]
_0801FB4A:
	ldrh r0, [r5, #6]
	adds r0, #1
	strh r0, [r5, #6]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	ldrh r4, [r5, #6]
	cmp r4, r0
	blt _0801FB5E
_0801FB5A:
	strh r2, [r5]
	strh r3, [r5, #2]
_0801FB5E:
	ldrh r6, [r5]
	mov r8, r6
	cmp r6, r2
	bne _0801FC3C
	ldrh r0, [r5, #2]
	cmp r0, r3
	bne _0801FC3C
	ldrb r0, [r5, #0x17]
	strb r0, [r5, #0x14]
	ldrb r1, [r5, #0x15]
	lsrs r6, r1, #1
	movs r2, #0xf
	mov r8, r2
	mov r3, r8
	ands r6, r3
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	ldr r3, _0801FBE4 @ =gUnknown_08028764
	ldrb r4, [r5, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r5]
	adds r1, r4, #0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	strh r1, [r5, #2]
	mov r4, sb
	ldrh r4, [r4, #0x10]
	adds r2, r2, r4
	ldr r1, _0801FBE8 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r6, sb
	ldrh r1, [r6, #0x12]
	ldrh r6, [r5, #2]
	adds r1, r1, r6
	mov sb, r1
	ldr r1, _0801FBEC @ =gUnknown_08028741
	mov r2, r8
	ands r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	strh r0, [r7, #0x12]
	ldrb r4, [r5, #0x14]
	lsls r0, r4, #2
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	bge _0801FBF0
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0801FBF6
	.align 2, 0
_0801FBE4: .4byte gUnknown_08028764
_0801FBE8: .4byte gUnknown_08028751
_0801FBEC: .4byte gUnknown_08028741
_0801FBF0:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_0801FBF6:
	str r0, [r7]
	mov r0, sl
	adds r0, #0x4e
	ldrh r0, [r0]
	cmp r0, #0xa
	bne _0801FC08
	movs r0, #0
	strh r0, [r5, #4]
	b _0801FC34
_0801FC08:
	movs r0, #7
	strh r0, [r5, #4]
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x52
	strh r0, [r1]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0801FC34
	movs r0, #0
	strb r0, [r1]
_0801FC34:
	movs r0, #0
	strb r0, [r5, #0x17]
	strh r0, [r5, #8]
	b _0801FC78
_0801FC3C:
	ldrb r0, [r5, #0x15]
	lsrs r6, r0, #1
	movs r4, #0xf
	ands r6, r4
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	mov r1, sb
	ldrh r2, [r1, #0x10]
	add r2, r8
	ldr r1, _0801FC94 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r3, sb
	ldrh r3, [r3, #0x12]
	ldrh r6, [r5, #2]
	adds r2, r3, r6
	ldr r1, _0801FC98 @ =gUnknown_08028741
	ands r0, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r7, #0x12]
_0801FC78:
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x16]
	adds r0, #1
	strb r0, [r5, #0x16]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC94: .4byte gUnknown_08028751
_0801FC98: .4byte gUnknown_08028741

	thumb_func_start sub_801FC9C
sub_801FC9C: @ 0x0801FC9C
	adds r3, r0, #0
	ldr r0, _0801FCB4 @ =gScriptContext
	movs r1, #0
	adds r2, r0, #0
	adds r2, #0x54
_0801FCA6:
	ldrb r0, [r2, #0x14]
	cmp r0, r3
	bne _0801FCB8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	b _0801FCC4
	.align 2, 0
_0801FCB4: .4byte gScriptContext
_0801FCB8:
	adds r2, #0x18
	adds r1, #1
	cmp r1, #2
	bls _0801FCA6
	movs r0, #1
	rsbs r0, r0, #0
_0801FCC4:
	bx lr
	.align 2, 0

	thumb_func_start sub_801FCC8
sub_801FCC8: @ 0x0801FCC8
	ldr r0, _0801FCDC @ =gScriptContext
	movs r1, #0
	adds r0, #0x54
_0801FCCE:
	ldrh r2, [r0, #4]
	cmp r2, #6
	bne _0801FCE0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	b _0801FCEC
	.align 2, 0
_0801FCDC: .4byte gScriptContext
_0801FCE0:
	adds r0, #0x18
	adds r1, #1
	cmp r1, #2
	bls _0801FCCE
	movs r0, #1
	rsbs r0, r0, #0
_0801FCEC:
	bx lr
	.align 2, 0

	thumb_func_start sub_801FCF0
sub_801FCF0: @ 0x0801FCF0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0801FD0C @ =gScriptContext
	movs r1, #0
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x68
_0801FD00:
	cmp r4, #0
	bne _0801FD10
	ldrb r0, [r2]
	cmp r0, #2
	bhi _0801FD20
	b _0801FD16
	.align 2, 0
_0801FD0C: .4byte gScriptContext
_0801FD10:
	ldrb r0, [r2]
	cmp r0, #2
	bls _0801FD20
_0801FD16:
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
_0801FD20:
	adds r2, #0x18
	adds r3, #1
	cmp r3, #2
	bls _0801FD00
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801FD34
sub_801FD34: @ 0x0801FD34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r7, _0801FD5C @ =gScriptContext
	lsls r0, r0, #1
	add r0, r8
	lsls r0, r0, #3
	adds r0, #0x54
	adds r5, r0, r7
	movs r6, #0
	ldrb r0, [r5, #0x14]
	cmp r0, #5
	bls _0801FD52
	b _0801FFB2
_0801FD52:
	lsls r0, r0, #2
	ldr r1, _0801FD60 @ =_0801FD64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801FD5C: .4byte gScriptContext
_0801FD60: .4byte _0801FD64
_0801FD64: @ jump table
	.4byte _0801FD7C @ case 0
	.4byte _0801FDA8 @ case 1
	.4byte _0801FE12 @ case 2
	.4byte _0801FE4C @ case 3
	.4byte _0801FEEC @ case 4
	.4byte _0801FF1E @ case 5
_0801FD7C:
	movs r0, #1
	bl sub_801FC9C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _0801FDA2
	movs r0, #2
	bl sub_801FC9C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	beq _0801FD9E
	b _0801FF76
_0801FD9E:
	movs r0, #2
	b _0801FDA4
_0801FDA2:
	movs r0, #1
_0801FDA4:
	strb r0, [r5, #0x17]
	b _0801FFA8
_0801FDA8:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FE04
	cmp r0, #1
	bgt _0801FDD0
_0801FDCA:
	cmp r0, #0
	beq _0801FDF6
	b _0801FF6A
_0801FDD0:
	cmp r0, #3
	ble _0801FDD6
	b _0801FF6A
_0801FDD6:
	movs r0, #1
	bl sub_801FCF0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0801FDE8
	b _0801FF6A
_0801FDE8:
	movs r0, #5
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #5
	b _0801FF6A
_0801FDF6:
	movs r0, #0
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #0
	b _0801FF6A
_0801FE04:
	movs r0, #2
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #2
	b _0801FF6A
_0801FE12:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FE3E
	cmp r0, #1
	ble _0801FDCA
	cmp r0, #2
	beq _0801FDF6
	cmp r0, #3
	beq _0801FE3E
	b _0801FF6A
_0801FE3E:
	movs r0, #1
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #1
	b _0801FF6A
_0801FE4C:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FEA4
	cmp r0, #1
	bgt _0801FE74
	cmp r0, #0
	beq _0801FE96
	b _0801FEB0
_0801FE74:
	cmp r0, #3
	bgt _0801FEB0
	movs r0, #0
	bl sub_801FCF0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _0801FEB0
	movs r0, #2
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #2
	b _0801FEB0
_0801FE96:
	movs r0, #5
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #5
	b _0801FEB0
_0801FEA4:
	movs r0, #4
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #4
_0801FEB0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801FFA6
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x52
	movs r2, #0
	strh r0, [r1]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0801FEE4
	strb r2, [r1]
_0801FEE4:
	movs r0, #0
	strh r0, [r5, #8]
	strb r2, [r5, #0x17]
	b _0801FFB2
_0801FEEC:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	bne _0801FF0C
	b _0801FDE8
_0801FF0C:
	cmp r0, #1
	ble _0801FF40
	cmp r0, #2
	bne _0801FF16
	b _0801FDE8
_0801FF16:
	cmp r0, #3
	bne _0801FF6A
	movs r2, #1
	b _0801FF6A
_0801FF1E:
	bl Random
	adds r4, r0, #0
	bl Random
	movs r1, #0xf
	adds r2, r1, #0
	ands r2, r4
	ands r1, r0
	muls r2, r1, r2
	movs r0, #3
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #1
	beq _0801FF5E
	cmp r0, #1
	bgt _0801FF46
_0801FF40:
	cmp r0, #0
	beq _0801FF50
	b _0801FF6A
_0801FF46:
	cmp r0, #2
	beq _0801FF50
	cmp r0, #4
	beq _0801FF5E
	b _0801FF6A
_0801FF50:
	movs r0, #3
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #3
	b _0801FF6A
_0801FF5E:
	movs r0, #4
	bl sub_801FC9C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #4
_0801FF6A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801FFA6
_0801FF76:
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x52
	movs r2, #0
	strh r0, [r1]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _0801FF9E
	strb r2, [r1]
_0801FF9E:
	strb r2, [r5, #0x17]
	movs r0, #0
	strh r0, [r5, #8]
	b _0801FFB2
_0801FFA6:
	strb r6, [r5, #0x17]
_0801FFA8:
	mov r0, r8
	bl sub_801F9E4
	movs r0, #6
	strh r0, [r5, #4]
_0801FFB2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801FFBC
sub_801FFBC: @ 0x0801FFBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0802001C @ =gScriptContext
	mov sl, r0
	adds r0, #0x4e
	ldrh r0, [r0]
	cmp r0, #0
	beq _08020004
	ldr r7, _08020020 @ =gUnknown_03000844
	ldrb r0, [r7, #0xe]
	cmp r0, #0xb
	beq _0801FFE0
	cmp r0, #0x21
	bne _0801FFEC
_0801FFE0:
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08020004
_0801FFEC:
	mov r2, sl
	adds r2, #0x4e
	ldrh r1, [r2]
	subs r0, r1, #5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08020004
	mov r3, sl
	strh r1, [r3, #0x20]
	movs r0, #5
	strh r0, [r2]
_08020004:
	mov r0, sl
	adds r0, #0x4e
	ldrb r1, [r0]
	str r0, [sp, #4]
	cmp r1, #0xc
	bls _08020012
	b _080206DC
_08020012:
	lsls r0, r1, #2
	ldr r1, _08020024 @ =_08020028
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802001C: .4byte gScriptContext
_08020020: .4byte gUnknown_03000844
_08020024: .4byte _08020028
_08020028: @ jump table
	.4byte _080206DC @ case 0
	.4byte _08020106 @ case 1
	.4byte _08020398 @ case 2
	.4byte _080201B4 @ case 3
	.4byte _08020314 @ case 4
	.4byte _08020084 @ case 5
	.4byte _080206DC @ case 6
	.4byte _0802005C @ case 7
	.4byte _08020270 @ case 8
	.4byte _080200D0 @ case 9
	.4byte _08020398 @ case 10
	.4byte _08020360 @ case 11
	.4byte _08020398 @ case 12
_0802005C:
	movs r4, #0
	mov r8, r4
_08020060:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	beq _08020072
	bl sub_8012F7C
_08020072:
	movs r6, #1
	add r8, r6
	mov r0, r8
	cmp r0, #5
	bls _08020060
	bl sub_8013050
	movs r0, #0
	b _08020394
_08020084:
	movs r2, #0
	mov r8, r2
_08020088:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	beq _080200A4
	ldr r0, [r7]
	ldr r1, _080200C4 @ =0xDFFFFFFF
	ands r0, r1
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7]
_080200A4:
	movs r3, #1
	add r8, r3
	mov r4, r8
	cmp r4, #5
	bls _08020088
	bl sub_8013050
	ldr r6, [sp, #4]
	ldrh r6, [r6]
	cmp r6, #5
	bne _080200C8
	movs r0, #6
	ldr r1, [sp, #4]
	strh r0, [r1]
	b _080206DC
	.align 2, 0
_080200C4: .4byte 0xDFFFFFFF
_080200C8:
	movs r0, #0
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _080206DC
_080200D0:
	movs r3, #0
	mov r8, r3
	movs r4, #0x80
	lsls r4, r4, #0x16
_080200D8:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	beq _080200EC
	ldr r0, [r7]
	orrs r0, r4
	str r0, [r7]
_080200EC:
	movs r6, #1
	add r8, r6
	mov r0, r8
	cmp r0, #5
	bls _080200D8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	cmp r0, #0
	bne _08020100
	b _08020398
_08020100:
	mov r2, sl
	ldrh r0, [r2, #0x20]
	b _08020396
_08020106:
	movs r3, #0
	mov r8, r3
	mov r6, sl
	adds r6, #0x50
	movs r4, #0x51
	add r4, sl
	mov sb, r4
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	ldr r7, _080201A8 @ =gUnknown_03000844
	mov r4, sl
	adds r4, #0x54
	movs r5, #0
_08020122:
	mov r1, r8
	lsls r2, r1, #1
	movs r0, #1
	strh r0, [r4, #4]
	ldr r0, _080201AC @ =gUnknown_08028794
	add r0, r8
	ldrb r1, [r0]
	adds r0, r1, #6
	strb r0, [r4, #0x14]
	strb r2, [r4, #0x15]
	strb r5, [r4, #0x16]
	strb r1, [r4, #0x17]
	movs r2, #0
	strh r2, [r4, #8]
	mov r0, r8
	adds r0, #0x83
	movs r1, #0x10
	ldrsh r3, [r7, r1]
	str r3, [sp, #0x10]
	ldrb r2, [r4, #0x14]
	lsls r3, r2, #2
	ldr r1, _080201B0 @ =gUnknown_08028764
	adds r3, r3, r1
	movs r1, #0
	ldrsh r2, [r3, r1]
	mov ip, r2
	ldr r2, [sp, #0x10]
	add r2, ip
	str r2, [sp, #0x10]
	movs r2, #0x12
	ldrsh r1, [r7, r2]
	mov ip, r1
	movs r2, #2
	ldrsh r1, [r3, r2]
	adds r2, r1, #0
	add r2, ip
	ldr r1, [sp, #0x10]
	bl sub_8012864
	ldrb r3, [r4, #0x14]
	lsls r0, r3, #2
	ldr r1, _080201B0 @ =gUnknown_08028764
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r2, r3, #0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	strh r0, [r4, #2]
	adds r4, #0x18
	adds r5, #3
	movs r3, #1
	add r8, r3
	mov r0, r8
	cmp r0, #2
	bls _08020122
	movs r1, #2
	movs r0, #0
	strb r0, [r6]
	mov r2, sb
	strb r0, [r2]
	ldr r3, [sp, #8]
	strh r0, [r3]
	ldr r4, [sp, #4]
	strh r1, [r4]
	b _08020398
	.align 2, 0
_080201A8: .4byte gUnknown_03000844
_080201AC: .4byte gUnknown_08028794
_080201B0: .4byte gUnknown_08028764
_080201B4:
	movs r6, #0
	mov r8, r6
	mov r6, sl
	adds r6, #0x4a
	mov r5, sl
	adds r5, #0x58
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
_080201C6:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	beq _08020230
	mov r1, r8
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	movs r2, #0
	mov r0, sl
	adds r0, #0x46
	ldr r3, [sp, #0xc]
	adds r0, r0, r3
	ldrh r4, [r6]
	ldrh r0, [r0]
	cmp r4, r0
	bls _080201F0
	movs r2, #1
_080201F0:
	ands r1, r2
	cmp r1, #0
	bne _080201FC
	mov r0, r8
	cmp r0, #0
	bne _08020230
_080201FC:
	mov r4, r8
	adds r4, #0x86
	movs r2, #0x10
	ldrsh r1, [r7, r2]
	movs r3, #0x12
	ldrsh r2, [r7, r3]
	adds r0, r4, #0
	bl sub_8012864
	adds r0, r4, #0
	bl sub_8011D68
	mov sb, r0
	ldr r0, [r7, #0x1c]
	mov r4, sb
	str r0, [r4, #0x1c]
	adds r0, r7, #0
	bl sub_8012F7C
	movs r0, #5
	strh r0, [r5]
	mov r0, r8
	cmp r0, #2
	bne _08020230
	ldr r1, [sp, #4]
	strh r0, [r1]
_08020230:
	adds r5, #0x18
	ldr r2, [sp, #0xc]
	adds r2, #2
	str r2, [sp, #0xc]
	movs r3, #1
	add r8, r3
	mov r4, r8
	cmp r4, #2
	bls _080201C6
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r6, #0x4e
	mov r8, r6
	ldr r0, _0802026C @ =gOamObjects
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x9c
	lsls r2, r2, #2
	adds r0, r0, r2
_08020258:
	strh r1, [r0]
	adds r0, #8
	movs r3, #1
	add r8, r3
	mov r4, r8
	cmp r4, #0x7f
	bls _08020258
	bl sub_8013050
	b _080206DC
	.align 2, 0
_0802026C: .4byte gOamObjects
_08020270:
	movs r6, #0
	mov r8, r6
	mov r6, sl
	adds r6, #0x50
	movs r0, #0x51
	add r0, sl
	mov sb, r0
	mov r1, sl
	adds r1, #0x52
	str r1, [sp, #8]
	ldr r7, _08020308 @ =gUnknown_03000844
	mov r4, sl
	adds r4, #0x58
	movs r5, #0
_0802028C:
	mov r2, r8
	lsls r1, r2, #1
	movs r0, #7
	strh r0, [r4]
	ldr r0, _0802030C @ =gUnknown_08028794
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	strb r1, [r4, #0x11]
	strb r5, [r4, #0x12]
	movs r3, #0
	strb r3, [r4, #0x13]
	movs r0, #0
	strh r0, [r4, #4]
	mov r0, r8
	adds r0, #0x83
	movs r2, #0x10
	ldrsh r1, [r7, r2]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #0x10]
	lsls r3, r1, #2
	ldr r2, _08020310 @ =gUnknown_08028764
	adds r3, r3, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	mov ip, r1
	ldr r1, [sp, #0x10]
	add r1, ip
	str r1, [sp, #0x10]
	movs r1, #0x12
	ldrsh r2, [r7, r1]
	mov ip, r2
	movs r1, #2
	ldrsh r2, [r3, r1]
	add r2, ip
	ldr r1, [sp, #0x10]
	bl sub_8012864
	adds r4, #0x18
	adds r5, #3
	movs r2, #1
	add r8, r2
	mov r3, r8
	cmp r3, #2
	bls _0802028C
	movs r4, #2
	movs r0, #0
	strb r0, [r6]
	mov r6, sb
	strb r0, [r6]
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [sp, #8]
	strh r0, [r1]
	ldr r2, [sp, #4]
	strh r4, [r2]
	b _08020398
	.align 2, 0
_08020308: .4byte gUnknown_03000844
_0802030C: .4byte gUnknown_08028794
_08020310: .4byte gUnknown_08028764
_08020314:
	movs r3, #0
	mov r8, r3
	mov r6, sl
	adds r6, #0x50
	movs r4, #0x51
	add r4, sl
	mov sb, r4
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	movs r3, #0xf
	movs r2, #4
	mov r1, sl
	adds r1, #0x58
_08020330:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #1
	bne _0802033E
	ldrb r0, [r1, #0x13]
	strb r0, [r1, #0x10]
_0802033E:
	strh r2, [r1]
	adds r1, #0x18
	movs r0, #1
	add r8, r0
	mov r4, r8
	cmp r4, #2
	bls _08020330
	movs r0, #0
	strb r0, [r6]
	mov r6, sb
	strb r0, [r6]
	ldr r1, [sp, #8]
	strh r0, [r1]
	movs r0, #0xa
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _08020398
_08020360:
	movs r3, #0
	mov r8, r3
	mov r6, sl
	adds r6, #0x50
	movs r4, #0x51
	add r4, sl
	mov sb, r4
	mov r0, sl
	adds r0, #0x52
	str r0, [sp, #8]
	movs r1, #9
	adds r0, #2
_08020378:
	strh r1, [r0, #4]
	adds r0, #0x18
	movs r2, #1
	add r8, r2
	mov r3, r8
	cmp r3, #2
	bls _08020378
	movs r0, #0
	strb r0, [r6]
	mov r4, sb
	strb r0, [r4]
	ldr r6, [sp, #8]
	strh r0, [r6]
	movs r0, #0xc
_08020394:
	ldr r1, [sp, #4]
_08020396:
	strh r0, [r1]
_08020398:
	movs r2, #0
	str r2, [sp]
	mov r8, r2
_0802039E:
	mov r3, r8
	lsls r0, r3, #1
	add r0, r8
	lsls r0, r0, #3
	adds r0, #0x54
	mov r4, sl
	adds r5, r4, r0
	movs r0, #0xf
	ldrh r6, [r5, #4]
	ands r0, r6
	mov r6, r8
	adds r6, #1
	cmp r0, #9
	bls _080203BC
	b _080206AC
_080203BC:
	lsls r0, r0, #2
	ldr r1, _080203C8 @ =_080203CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080203C8: .4byte _080203CC
_080203CC: @ jump table
	.4byte _080203F4 @ case 0
	.4byte _0802043E @ case 1
	.4byte _080206AC @ case 2
	.4byte _080206AC @ case 3
	.4byte _0802063A @ case 4
	.4byte _080204F0 @ case 5
	.4byte _08020668 @ case 6
	.4byte _08020528 @ case 7
	.4byte _080206AC @ case 8
	.4byte _08020670 @ case 9
_080203F4:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	beq _0802040A
	bl sub_8012F7C
	movs r0, #1
	str r0, [sp]
_0802040A:
	mov r6, r8
	adds r6, #1
	mov r1, r8
	cmp r1, #2
	beq _08020416
	b _080206AC
_08020416:
	movs r4, #0
	movs r5, #0
_0802041A:
	adds r0, r4, #0
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	bne _0802042A
	adds r5, #1
_0802042A:
	adds r4, #1
	cmp r4, #2
	bls _0802041A
	cmp r5, #3
	beq _08020436
	b _080206AC
_08020436:
	movs r0, #0
	ldr r2, [sp, #4]
	strh r0, [r2]
	b _080206AC
_0802043E:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	bne _08020452
	b _080206AC
_08020452:
	ldr r3, _080204C0 @ =gUnknown_03000844
	mov sb, r3
	ldrb r4, [r5, #0x15]
	lsrs r6, r4, #1
	movs r4, #0xf
	ands r6, r4
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	ands r0, r4
	ldr r3, _080204C4 @ =gUnknown_08028764
	ldrb r2, [r5, #0x14]
	lsls r1, r2, #2
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r5]
	ldrb r4, [r5, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	strh r1, [r5, #2]
	mov r1, sb
	ldrh r1, [r1, #0x10]
	adds r2, r2, r1
	ldr r1, _080204C8 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r4, sb
	ldrh r4, [r4, #0x12]
	ldrh r6, [r5, #2]
	adds r2, r4, r6
	ldr r1, _080204CC @ =gUnknown_08028741
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r7, #0x12]
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _080204D0
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _080204D6
	.align 2, 0
_080204C0: .4byte gUnknown_03000844
_080204C4: .4byte gUnknown_08028764
_080204C8: .4byte gUnknown_08028751
_080204CC: .4byte gUnknown_08028741
_080204D0:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_080204D6:
	str r0, [r7]
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x16]
	adds r0, #1
	strb r0, [r5, #0x16]
	mov r0, r8
	bl sub_801F9E4
	movs r0, #6
	strh r0, [r5, #4]
	b _0802067E
_080204F0:
	movs r0, #2
	strh r0, [r5, #4]
	mov r6, r8
	adds r6, #1
	mov r3, r8
	cmp r3, #2
	beq _08020500
	b _080206AC
_08020500:
	movs r4, #0
	movs r5, #0
_08020504:
	adds r0, r4, #0
	adds r0, #0x86
	bl sub_8011D68
	adds r7, r0, #0
	cmp r7, #0
	bne _08020514
	adds r5, #1
_08020514:
	adds r4, #1
	cmp r4, #2
	bls _08020504
	cmp r5, #3
	beq _08020520
	b _080206AC
_08020520:
	movs r0, #0
	ldr r4, [sp, #4]
	strh r0, [r4]
	b _080206AC
_08020528:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	bne _0802053C
	b _080206AC
_0802053C:
	ldr r6, _080205AC @ =gUnknown_03000844
	mov sb, r6
	ldrb r0, [r5, #0x15]
	lsrs r6, r0, #1
	movs r4, #0xf
	ands r6, r4
	ldrb r0, [r5, #0x16]
	movs r1, #3
	bl __udivsi3
	ands r0, r4
	ldr r3, _080205B0 @ =gUnknown_08028764
	ldrb r2, [r5, #0x14]
	lsls r1, r2, #2
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r5]
	ldrb r4, [r5, #0x14]
	lsls r1, r4, #2
	adds r1, r1, r3
	ldrh r1, [r1, #2]
	strh r1, [r5, #2]
	mov r1, sb
	ldrh r1, [r1, #0x10]
	adds r2, r2, r1
	ldr r1, _080205B4 @ =gUnknown_08028751
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	strh r1, [r7, #0x10]
	mov r4, sb
	ldrh r4, [r4, #0x12]
	ldrh r6, [r5, #2]
	adds r2, r4, r6
	ldr r1, _080205B8 @ =gUnknown_08028741
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r2
	strh r0, [r7, #0x12]
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _080205BC
	ldr r0, [r7]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _080205C2
	.align 2, 0
_080205AC: .4byte gUnknown_03000844
_080205B0: .4byte gUnknown_08028764
_080205B4: .4byte gUnknown_08028751
_080205B8: .4byte gUnknown_08028741
_080205BC:
	ldr r0, [r7]
	movs r1, #1
	orrs r0, r1
_080205C2:
	str r0, [r7]
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x16]
	adds r0, #1
	strb r0, [r5, #0x16]
	mov r4, sl
	adds r4, #0x50
	mov r6, r8
	adds r6, #1
	ldrb r3, [r4]
	cmp r8, r3
	bne _080206AC
	ldrh r0, [r5, #8]
	adds r0, #1
	movs r1, #0
	mov sb, r1
	strh r0, [r5, #8]
	mov r7, sl
	adds r7, #0x52
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r7]
	cmp r0, r2
	bls _080206AC
	bl sub_801FCC8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08020632
	bl Random
	movs r1, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r7]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08020628
	mov r3, sb
	strb r3, [r4]
_08020628:
	mov r4, sb
	strb r4, [r5, #0x17]
	movs r0, #0
	strh r0, [r5, #8]
	b _080206AC
_08020632:
	mov r0, r8
	bl sub_801FD34
	b _080206AC
_0802063A:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	beq _080206AC
	ldr r0, _08020664 @ =gUnknown_08028794
	add r0, r8
	ldrb r0, [r0]
	adds r0, #6
	strb r0, [r5, #0x17]
	mov r0, r8
	bl sub_801F9E4
	movs r0, #6
	strh r0, [r5, #4]
	b _080206AC
	.align 2, 0
_08020664: .4byte gUnknown_08028794
_08020668:
	mov r0, r8
	bl sub_801FA7C
	b _0802067E
_08020670:
	mov r1, sl
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0xe
	bhi _08020684
	adds r0, #1
	strh r0, [r1]
_0802067E:
	mov r6, r8
	adds r6, #1
	b _080206AC
_08020684:
	mov r0, r8
	adds r0, #0x83
	bl sub_8011D68
	adds r7, r0, #0
	mov r6, r8
	adds r6, #1
	cmp r7, #0
	beq _080206AC
	ldrh r0, [r7, #0x10]
	adds r0, #6
	movs r1, #0
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #0x12]
	subs r0, #2
	strh r0, [r7, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080206AC
	strh r1, [r5, #4]
_080206AC:
	mov r8, r6
	cmp r6, #2
	bhi _080206B4
	b _0802039E
_080206B4:
	ldr r1, [sp]
	cmp r1, #0
	beq _080206D8
	movs r2, #0x4e
	mov r8, r2
	ldr r0, _080206EC @ =gOamObjects
	movs r1, #0x80
	lsls r1, r1, #2
	movs r3, #0x9c
	lsls r3, r3, #2
	adds r0, r0, r3
_080206CA:
	strh r1, [r0]
	adds r0, #8
	movs r4, #1
	add r8, r4
	mov r6, r8
	cmp r6, #0x7f
	bls _080206CA
_080206D8:
	bl sub_8013050
_080206DC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080206EC: .4byte gOamObjects

