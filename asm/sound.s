	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start sub_8011714
sub_8011714: @ 0x08011714
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08011730 @ =0x00000C64
	adds r5, r4, r0
	ldr r1, _08011734 @ =gJoypad
	ldrh r2, [r1, #2]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08011738
	ldrb r0, [r5, #6]
	subs r0, #1
	b _08011744
	.align 2, 0
_08011730: .4byte 0x00000C64
_08011734: .4byte gJoypad
_08011738:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08011746
	ldrb r0, [r5, #6]
	adds r0, #1
_08011744:
	strb r0, [r5, #6]
_08011746:
	movs r0, #6
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08011752
	movs r0, #3
	b _08011758
_08011752:
	cmp r0, #3
	ble _0801175A
	movs r0, #0
_08011758:
	strb r0, [r5, #6]
_0801175A:
	movs r2, #6
	ldrsb r2, [r5, r2]
	cmp r2, #1
	beq _08011818
	cmp r2, #1
	bgt _0801176C
	cmp r2, #0
	beq _0801177A
	b _08011B04
_0801176C:
	cmp r2, #2
	bne _08011772
	b _0801198C
_08011772:
	cmp r2, #3
	bne _08011778
	b _08011A5C
_08011778:
	b _08011B04
_0801177A:
	ldrh r2, [r1, #2]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080117AC
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011794
	ldrh r0, [r5, #4]
	subs r0, #0xa
	b _08011798
_08011794:
	ldrh r0, [r5, #4]
	subs r0, #1
_08011798:
	strh r0, [r5, #4]
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _080117F2
	ldr r0, _080117A8 @ =0x00000141
	strh r0, [r5, #4]
	b _080117F2
	.align 2, 0
_080117A8: .4byte 0x00000141
_080117AC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080117E0
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080117C4
	ldrh r0, [r5, #4]
	adds r0, #0xa
	b _080117C8
_080117C4:
	ldrh r0, [r5, #4]
	adds r0, #1
_080117C8:
	strh r0, [r5, #4]
	movs r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, _080117DC @ =0x00000141
	cmp r1, r0
	ble _080117F2
	movs r0, #0
	strh r0, [r5, #4]
	b _080117F2
	.align 2, 0
_080117DC: .4byte 0x00000141
_080117E0:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080117F2
	movs r1, #4
	ldrsh r0, [r5, r1]
	adds r0, #0x2a
	bl PlaySE
_080117F2:
	ldr r0, _0801180C @ =gUnknown_08026FB0
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _08011810 @ =gUnknown_08026FBC
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011814 @ =gUnknown_08026FC8
	b _08011A34
	.align 2, 0
_0801180C: .4byte gUnknown_08026FB0
_08011810: .4byte gUnknown_08026FBC
_08011814: .4byte gUnknown_08026FC8
_08011818:
	ldrh r3, [r1, #2]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08011856
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011832
	ldrh r0, [r5, #2]
	subs r0, #0xa
	b _08011836
_08011832:
	ldrh r0, [r5, #2]
	subs r0, #1
_08011836:
	strh r0, [r5, #2]
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08011844
	movs r0, #0xf9
	strh r0, [r5, #2]
_08011844:
	ldrh r0, [r5, #2]
	subs r0, #0x2a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9e
	bhi _08011934
	movs r0, #0xf9
	strh r0, [r5, #2]
	b _08011934
_08011856:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08011892
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801186E
	ldrh r0, [r5, #2]
	adds r0, #0xa
	b _08011872
_0801186E:
	ldrh r0, [r5, #2]
	adds r0, #1
_08011872:
	strh r0, [r5, #2]
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #0xf9
	ble _08011880
	movs r0, #0
	strh r0, [r5, #2]
_08011880:
	ldrh r0, [r5, #2]
	subs r0, #0x2a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9e
	bhi _08011934
	movs r0, #0xc9
	strh r0, [r5, #2]
	b _08011934
_08011892:
	ands r2, r3
	lsls r0, r2, #0x10
	cmp r0, #0
	beq _080118FA
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	cmp r0, r1
	beq _080118B0
	movs r0, #0x78
	bl FadeOutBGM
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _08011934
_080118B0:
	ldr r4, _080118C8 @ =gMPlayInfo_BGM
	ldr r1, [r4, #4]
	cmp r1, #0
	bge _080118F4
	ldr r0, _080118CC @ =0x0000FFFF
	ands r1, r0
	cmp r1, #0
	beq _080118D0
	bl UnpauseBGM
	b _08011934
	.align 2, 0
_080118C8: .4byte gMPlayInfo_BGM
_080118CC: .4byte 0x0000FFFF
_080118D0:
	movs r1, #2
	ldrsh r0, [r5, r1]
	bl PlayBGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl ChangeTrackVolume
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl ChangeTrackPanning
	b _08011934
_080118F4:
	bl PauseBGM
	b _08011934
_080118FA:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0801190C
	movs r0, #0x14
	bl FadeOutBGM
	b _08011934
_0801190C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08011934
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801192A
	movs r0, #0x78
	movs r1, #0xff
	bl FadeInBGM
	b _08011934
_0801192A:
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x78
	bl FadeInBGM
_08011934:
	ldr r0, _08011968 @ =gUnknown_08026FB0
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _0801196C @ =gUnknown_08026FBC
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011970 @ =gUnknown_08026FD4
	movs r1, #0xb
	movs r2, #0xf
	bl nullsub_20
	ldr r0, _08011974 @ =gMPlayInfo_BGM
	ldr r0, [r0, #4]
	cmp r0, #0
	blt _0801197C
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	cmp r1, r0
	bne _0801197C
	ldr r0, _08011978 @ =gUnknown_08026FE0
	b _0801197E
	.align 2, 0
_08011968: .4byte gUnknown_08026FB0
_0801196C: .4byte gUnknown_08026FBC
_08011970: .4byte gUnknown_08026FD4
_08011974: .4byte gMPlayInfo_BGM
_08011978: .4byte gUnknown_08026FE0
_0801197C:
	ldr r0, _08011988 @ =gUnknown_08026FC8
_0801197E:
	movs r1, #0xb
	movs r2, #0xe
	bl nullsub_20
	b _08011B04
	.align 2, 0
_08011988: .4byte gUnknown_08026FC8
_0801198C:
	ldr r3, _080119A8 @ =gJoypad
	ldr r1, [r3]
	ldr r0, _080119AC @ =gUnknown_02000020
	ands r0, r1
	cmp r0, #0
	beq _080119CE
	ldrh r3, [r3]
	ands r2, r3
	cmp r2, #0
	beq _080119B0
	ldrh r0, [r5, #8]
	subs r0, #0xa
	b _080119B4
	.align 2, 0
_080119A8: .4byte gJoypad
_080119AC: .4byte gUnknown_02000020
_080119B0:
	ldrh r0, [r5, #8]
	subs r0, #1
_080119B4:
	strh r0, [r5, #8]
	movs r1, #8
	ldrsh r0, [r5, r1]
	cmp r0, #3
	bgt _080119C2
	movs r0, #4
	strh r0, [r5, #8]
_080119C2:
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl ChangeTrackVolume
	b _08011A06
_080119CE:
	ldr r0, _080119E4 @ =0x01000010
	ands r1, r0
	cmp r1, #0
	beq _08011A06
	ldrh r3, [r3]
	ands r2, r3
	cmp r2, #0
	beq _080119E8
	ldrh r0, [r5, #8]
	adds r0, #0xa
	b _080119EC
	.align 2, 0
_080119E4: .4byte 0x01000010
_080119E8:
	ldrh r0, [r5, #8]
	adds r0, #1
_080119EC:
	strh r0, [r5, #8]
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #0xff
	lsls r1, r1, #1
	cmp r0, r1
	ble _080119FC
	strh r1, [r5, #8]
_080119FC:
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl ChangeTrackVolume
_08011A06:
	ldr r1, _08011A48 @ =gJoypad
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08011A1E
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r5, #8]
	movs r0, #1
	bl ChangeTrackVolume
_08011A1E:
	ldr r0, _08011A4C @ =gUnknown_08026FEC
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _08011A50 @ =gUnknown_08026FF8
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011A54 @ =gUnknown_08027004
_08011A34:
	movs r1, #0xb
	movs r2, #0xe
	bl nullsub_20
	ldr r0, _08011A58 @ =gUnknown_08026FD4
	movs r1, #0xb
	movs r2, #0xf
	bl nullsub_20
	b _08011B04
	.align 2, 0
_08011A48: .4byte gJoypad
_08011A4C: .4byte gUnknown_08026FEC
_08011A50: .4byte gUnknown_08026FF8
_08011A54: .4byte gUnknown_08027004
_08011A58: .4byte gUnknown_08026FD4
_08011A5C:
	ldrh r2, [r1]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08011A90
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08011A74
	ldrh r0, [r5, #0xc]
	subs r0, #0xa
	b _08011A78
_08011A74:
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08011A78:
	strh r0, [r5, #0xc]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08011ABC
	ldr r0, _08011A8C @ =0x0000FF80
	b _08011ABA
	.align 2, 0
_08011A8C: .4byte 0x0000FF80
_08011A90:
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08011AC8
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08011AAA
	ldrh r0, [r5, #0xc]
	adds r0, #0xa
	b _08011AAE
_08011AAA:
	ldrh r0, [r5, #0xc]
	adds r0, #1
_08011AAE:
	strh r0, [r5, #0xc]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0x7f
	ble _08011ABC
	movs r0, #0x7f
_08011ABA:
	strh r0, [r5, #0xc]
_08011ABC:
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl ChangeTrackPanning
	b _08011ADC
_08011AC8:
	movs r0, #1
	ldrh r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _08011ADC
	strh r3, [r5, #0xc]
	movs r0, #1
	movs r1, #0
	bl ChangeTrackPanning
_08011ADC:
	ldr r0, _08011BA0 @ =gUnknown_08027010
	movs r1, #0xb
	movs r2, #0xc
	bl nullsub_20
	ldr r0, _08011BA4 @ =gUnknown_0802701C
	movs r1, #0xb
	movs r2, #0xd
	bl nullsub_20
	ldr r0, _08011BA8 @ =gUnknown_08027028
	movs r1, #0xb
	movs r2, #0xe
	bl nullsub_20
	ldr r0, _08011BAC @ =gUnknown_08026FD4
	movs r1, #0xb
	movs r2, #0xf
	bl nullsub_20
_08011B04:
	ldr r0, _08011BB0 @ =gUnknown_08027034
	movs r1, #5
	movs r2, #5
	bl nullsub_20
	movs r1, #4
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	movs r2, #5
	movs r3, #2
	bl nullsub_6
	ldr r0, _08011BB4 @ =gUnknown_08027040
	movs r1, #5
	movs r2, #6
	bl nullsub_20
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	movs r2, #6
	bl sub_8006470
	ldr r0, _08011BB8 @ =gUnknown_0802704C
	movs r1, #5
	movs r2, #7
	bl nullsub_20
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #0x32
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08011B5C
	movs r1, #8
	ldrsh r0, [r5, r1]
	movs r1, #4
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r0, r1, #0x1f
_08011B5C:
	movs r1, #0xa
	movs r2, #7
	bl sub_8006470
	ldr r0, _08011BBC @ =gUnknown_08027058
	movs r1, #5
	movs r2, #8
	bl nullsub_20
	ldr r4, _08011BC0 @ =gUnknown_08027070
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	movs r1, #0x14
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, #0x11
	adds r0, r4, #0
	movs r2, #8
	bl nullsub_20
	ldr r0, _08011BC4 @ =gMPlayInfo_BGM
	ldr r1, [r0, #4]
	cmp r1, #0
	bge _08011BE0
	ldr r0, _08011BC8 @ =0x0000FFFF
	ands r1, r0
	cmp r1, #0
	beq _08011BD0
	ldr r0, _08011BCC @ =gUnknown_08027074
	b _08011BD2
	.align 2, 0
_08011BA0: .4byte gUnknown_08027010
_08011BA4: .4byte gUnknown_0802701C
_08011BA8: .4byte gUnknown_08027028
_08011BAC: .4byte gUnknown_08026FD4
_08011BB0: .4byte gUnknown_08027034
_08011BB4: .4byte gUnknown_08027040
_08011BB8: .4byte gUnknown_0802704C
_08011BBC: .4byte gUnknown_08027058
_08011BC0: .4byte gUnknown_08027070
_08011BC4: .4byte gMPlayInfo_BGM
_08011BC8: .4byte 0x0000FFFF
_08011BCC: .4byte gUnknown_08027074
_08011BD0:
	ldr r0, _08011BDC @ =gUnknown_0802707C
_08011BD2:
	movs r1, #0xf
	movs r2, #6
	bl nullsub_20
	b _08011BEA
	.align 2, 0
_08011BDC: .4byte gUnknown_0802707C
_08011BE0:
	ldr r0, _08011C00 @ =gUnknown_08027084
	movs r1, #0xf
	movs r2, #6
	bl nullsub_20
_08011BEA:
	ldr r0, _08011C04 @ =gUnknown_0802708C
	movs r2, #6
	ldrsb r2, [r5, r2]
	adds r2, #5
	movs r1, #5
	bl nullsub_20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011C00: .4byte gUnknown_08027084
_08011C04: .4byte gUnknown_0802708C

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
