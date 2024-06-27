	.include "asm/macros.inc"
	.syntax unified

	thumb_func_start ResetSoundControl
ResetSoundControl: @ 0x080110E0
	ldr r0, _0801110C @ =gMain
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa0
	lsls r1, r1, #4
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x2e]
	strh r3, [r0, #0x2c]
	movs r1, #0xfe
	strh r1, [r0, #0x28]
	movs r2, #0xb0
	lsls r2, r2, #2
	adds r1, r0, r2
	strh r3, [r1]
	ldr r1, _08011110 @ =0x000002C2
	adds r0, r0, r1
	strh r3, [r0]
	bx lr
	.align 2, 0
_0801110C: .4byte gMain
_08011110: .4byte 0x000002C2

	thumb_func_start sub_8011114
sub_8011114: @ 0x08011114
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08011138 @ =gUnknown_0814DC44
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08011148
	adds r4, r1, #0
	adds r1, r2, #0
_0801112A:
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r3, r0
	bne _0801113C
	movs r0, #1
	b _0801114A
	.align 2, 0
_08011138: .4byte gUnknown_0814DC44
_0801113C:
	adds r1, #2
	adds r2, #2
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, r4
	bne _0801112A
_08011148:
	movs r0, #0
_0801114A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8011150
sub_8011150: @ 0x08011150
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801118C @ =gMain
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08011186
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r5, r1
	strh r4, [r0]
	adds r0, r4, #0
	bl sub_8011114
	cmp r0, #0
	beq _08011186
	ldr r1, _08011190 @ =0x000002C2
	adds r0, r5, r1
	strh r4, [r0]
_08011186:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801118C: .4byte gMain
_08011190: .4byte 0x000002C2

	thumb_func_start sub_8011194
sub_8011194: @ 0x08011194
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	ldr r6, _080111C4 @ =gMain
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r5, #0
	strh r5, [r0]
	adds r0, r4, #0
	bl sub_8011114
	cmp r0, #0
	beq _080111BC
	ldr r1, _080111C8 @ =0x000002C2
	adds r0, r6, r1
	strh r5, [r0]
_080111BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080111C4: .4byte gMain
_080111C8: .4byte 0x000002C2

	thumb_func_start sub_80111CC
sub_80111CC: @ 0x080111CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _08011208 @ =gMPlayTable
	ldr r0, _0801120C @ =gSongTable
	lsls r2, r4, #3
	adds r2, r2, r0
	ldrh r5, [r2, #4]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl sub_8011114
	cmp r0, #0
	beq _08011200
	ldr r0, _08011210 @ =gMain
	ldr r1, _08011214 @ =0x000002C2
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_08011200:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011208: .4byte gMPlayTable
_0801120C: .4byte gSongTable
_08011210: .4byte gMain
_08011214: .4byte 0x000002C2

	thumb_func_start sub_8011218
sub_8011218: @ 0x08011218
	push {r4, lr}
	adds r2, r1, #0
	ldr r3, _08011240 @ =gMPlayTable
	ldr r1, _08011244 @ =gSongTable
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r4, [r0, #4]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r0, [r1]
	ldr r1, _08011248 @ =0x0000FFFF
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl m4aMPlayVolumeControl
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011240: .4byte gMPlayTable
_08011244: .4byte gSongTable
_08011248: .4byte 0x0000FFFF

	thumb_func_start sub_801124C
sub_801124C: @ 0x0801124C
	ldr r2, _0801126C @ =gMPlayTable
	ldr r1, _08011270 @ =gSongTable
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _08011274
	movs r0, #1
	b _08011276
	.align 2, 0
_0801126C: .4byte gMPlayTable
_08011270: .4byte gSongTable
_08011274:
	movs r0, #0
_08011276:
	bx lr

	thumb_func_start sub_8011278
sub_8011278: @ 0x08011278
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080112A8 @ =gMain
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080112C0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x10
	ldrb r2, [r1]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _080112AC
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _080112B4
	.align 2, 0
_080112A8: .4byte gMain
_080112AC:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStartOrChange
_080112B4:
	strh r5, [r4, #0x28]
	movs r0, #0xa0
	lsls r0, r0, #4
	strh r0, [r4, #0x2e]
	movs r0, #4
	strb r0, [r6]
_080112C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80112C8
sub_80112C8: @ 0x080112C8
	push {r4, r5, lr}
	ldr r0, _0801130C @ =gMain
	adds r4, r0, #0
	adds r4, #0x24
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08011318
	ldr r5, _08011310 @ =gMPlayInfo_BGM
	adds r0, r5, #0
	bl m4aMPlayStop
	movs r1, #0xfb
	ldrb r0, [r4]
	ands r1, r0
	movs r2, #0
	movs r0, #2
	orrs r1, r0
	orrs r1, r2
	strb r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801131E
	movs r0, #1
	orrs r1, r0
	strb r1, [r4]
	ldr r1, _08011314 @ =0x0000FFFF
	adds r0, r5, #0
	movs r2, #4
	bl m4aMPlayVolumeControl
	b _0801131E
	.align 2, 0
_0801130C: .4byte gMain
_08011310: .4byte gMPlayInfo_BGM
_08011314: .4byte 0x0000FFFF
_08011318:
	movs r0, #1
	orrs r0, r1
	strb r0, [r4]
_0801131E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8011324
sub_8011324: @ 0x08011324
	push {r4, r5, r6, lr}
	ldr r6, _0801134C @ =gMain
	adds r5, r6, #0
	adds r5, #0x24
	movs r4, #1
	adds r0, r4, #0
	ldrb r1, [r5]
	ands r0, r1
	cmp r0, #0
	bne _08011344
	ldr r0, _08011350 @ =gMPlayInfo_BGM
	bl m4aMPlayStop
	strb r4, [r5]
	movs r0, #0xff
	strh r0, [r6, #0x28]
_08011344:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801134C: .4byte gMain
_08011350: .4byte gMPlayInfo_BGM

	thumb_func_start sub_8011354
sub_8011354: @ 0x08011354
	push {r4, lr}
	ldr r2, _08011390 @ =gMain
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080113B2
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080113AC
	ldrh r0, [r2, #0x28]
	cmp r0, #0xf0
	bne _08011394
	movs r1, #0x2e
	ldrsh r4, [r2, r1]
	movs r0, #0x1e
	movs r1, #0xf0
	bl sub_80113E8
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0x40
	bl sub_80115D4
	b _080113B2
	.align 2, 0
_08011390: .4byte gMain
_08011394:
	ldr r0, _080113A8 @ =gMPlayInfo_BGM
	bl m4aMPlayContinue
	movs r0, #0xfd
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	b _080113B0
	.align 2, 0
_080113A8: .4byte gMPlayInfo_BGM
_080113AC:
	movs r0, #0xfe
	ands r0, r1
_080113B0:
	strb r0, [r4]
_080113B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80113B8
sub_80113B8: @ 0x080113B8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080113E0 @ =gMain
	adds r4, r0, #0
	adds r4, #0x24
	movs r0, #4
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _080113DA
	ldr r0, _080113E4 @ =gMPlayInfo_BGM
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	bl m4aMPlayFadeOutTemporarily
	movs r0, #0x14
	strb r0, [r4]
_080113DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080113E0: .4byte gMain
_080113E4: .4byte gMPlayInfo_BGM

	thumb_func_start sub_80113E8
sub_80113E8: @ 0x080113E8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08011438 @ =gMain
	movs r2, #0x97
	lsls r2, r2, #2
	adds r0, r4, r2
	ldr r0, [r0]
	movs r3, #2
	ands r0, r3
	cmp r0, #0
	bne _080114BC
	ldrh r0, [r4, #0x28]
	cmp r0, r1
	bne _08011440
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r2, [r5]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08011440
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _080114BC
	movs r0, #0xee
	ands r0, r2
	strb r0, [r5]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	ldr r4, _0801143C @ =gMPlayInfo_BGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	bl m4aMPlayStop
	b _080114BC
	.align 2, 0
_08011438: .4byte gMain
_0801143C: .4byte gMPlayInfo_BGM
_08011440:
	cmp r1, #0xff
	bne _08011492
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r2, [r5]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0801146E
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080114BC
	movs r1, #0xfe
	ands r1, r2
	strb r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080114BC
	bl sub_8011354
	b _080114BC
_0801146E:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0801148C
	ldr r0, _08011488 @ =gMPlayInfo_BGM
	lsls r1, r6, #0xc
	lsrs r1, r1, #0x10
	bl m4aMPlayFadeIn
	movs r0, #4
	strb r0, [r5]
	b _080114BC
	.align 2, 0
_08011488: .4byte gMPlayInfo_BGM
_0801148C:
	bl sub_8011354
	b _0801149E
_08011492:
	adds r0, r1, #0
	bl sub_8011278
	ldr r0, _080114C4 @ =gMPlayInfo_BGM
	bl m4aMPlayImmInit
_0801149E:
	cmp r6, #0
	beq _080114BC
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r1, r6, #0
	bl __udivsi3
	adds r0, #1
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0xc
	strb r0, [r1]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
_080114BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080114C4: .4byte gMPlayInfo_BGM

	thumb_func_start UpdateBGMFade
UpdateBGMFade: @ 0x080114C8
	push {r4, r5, r6, lr}
	ldr r2, _080114FC @ =gMain
	adds r5, r2, #0
	adds r5, #0x24
	movs r4, #3
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, #0
	bne _08011548
	ldrh r1, [r2, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0801153C
	ldrh r6, [r2, #0x2e]
	adds r1, r1, r6
	strh r1, [r2, #0x2e]
	cmp r0, #0
	ble _08011500
	lsls r1, r1, #0x10
	ldrh r3, [r2, #0x20]
	lsls r0, r3, #0x10
	cmp r1, r0
	ble _08011512
	b _0801150A
	.align 2, 0
_080114FC: .4byte gMain
_08011500:
	lsls r1, r1, #0x10
	ldrh r3, [r2, #0x20]
	lsls r0, r3, #0x10
	cmp r1, r0
	bge _08011512
_0801150A:
	strh r3, [r2, #0x2e]
	strh r4, [r2, #0x2c]
	movs r0, #4
	strb r0, [r5]
_08011512:
	ldr r4, _08011534 @ =gMPlayInfo_BGM
	ldr r5, _08011538 @ =0x0000FFFF
	movs r1, #0x2e
	ldrsh r0, [r2, r1]
	movs r1, #0xa
	bl __divsi3
	adds r2, r0, #0
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayVolumeControl
	b _08011548
	.align 2, 0
_08011534: .4byte gMPlayInfo_BGM
_08011538: .4byte 0x0000FFFF
_0801153C:
	ldr r0, _08011550 @ =gMPlayInfo_BGM
	ldr r0, [r0, #4]
	cmp r0, #0
	bge _08011548
	movs r0, #2
	strb r0, [r5]
_08011548:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011550: .4byte gMPlayInfo_BGM

	thumb_func_start sub_8011554
sub_8011554: @ 0x08011554
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #3
	bhi _08011560
	movs r4, #4
_08011560:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08011584
	ldr r0, _080115C0 @ =gMPlayInfo_BGM
	ldr r1, _080115C4 @ =0x0000FFFF
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	bl m4aMPlayVolumeControl
	ldr r1, _080115C8 @ =gMain
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r1, #0x2e]
_08011584:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0801159E
	ldr r0, _080115CC @ =gMPlayInfo_SE1
	ldr r1, _080115C4 @ =0x0000FFFF
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	bl m4aMPlayVolumeControl
_0801159E:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _080115B8
	ldr r0, _080115D0 @ =gMPlayInfo_SE2
	ldr r1, _080115C4 @ =0x0000FFFF
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r2, r3, #0
	ands r4, r2
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
_080115B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080115C0: .4byte gMPlayInfo_BGM
_080115C4: .4byte 0x0000FFFF
_080115C8: .4byte gMain
_080115CC: .4byte gMPlayInfo_SE1
_080115D0: .4byte gMPlayInfo_SE2

	thumb_func_start sub_80115D4
sub_80115D4: @ 0x080115D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r5, _080115F8 @ =gMain
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08011648
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bls _080115FC
	adds r4, r0, #0
	b _08011602
	.align 2, 0
_080115F8: .4byte gMain
_080115FC:
	cmp r4, #3
	bhi _08011602
	movs r4, #4
_08011602:
	cmp r2, #0
	beq _0801162E
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r5, #0x20]
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	movs r3, #0x2e
	ldrsh r1, [r5, r3]
	subs r0, r0, r1
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #8
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _08011648
_0801162E:
	ldr r0, _08011650 @ =gMPlayInfo_BGM
	ldr r1, _08011654 @ =0x0000FFFF
	movs r2, #0xfe
	lsls r2, r2, #1
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	bl m4aMPlayVolumeControl
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
_08011648:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011650: .4byte gMPlayInfo_BGM
_08011654: .4byte 0x0000FFFF

	thumb_func_start ChangeTrackPanning
ChangeTrackPanning: @ 0x08011658
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08011672
	ldr r0, _080116A0 @ =gMPlayInfo_BGM
	ldr r1, _080116A4 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl m4aMPlayPanpotControl
_08011672:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08011686
	ldr r0, _080116A8 @ =gMPlayInfo_SE1
	ldr r1, _080116A4 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl m4aMPlayPanpotControl
_08011686:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801169A
	ldr r0, _080116AC @ =gMPlayInfo_SE2
	ldr r1, _080116A4 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	bl m4aMPlayPanpotControl
_0801169A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080116A0: .4byte gMPlayInfo_BGM
_080116A4: .4byte 0x0000FFFF
_080116A8: .4byte gMPlayInfo_SE1
_080116AC: .4byte gMPlayInfo_SE2

	thumb_func_start sub_80116B0
sub_80116B0: @ 0x080116B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011700 @ =0x00000C64
	adds r2, r4, r0
	ldr r1, _08011704 @ =gIORegisters
	adds r1, #0x4a
	ldr r0, _08011708 @ =0x0000F1FF
	ldrh r3, [r1]
	ands r0, r3
	movs r3, #0
	strh r0, [r1]
	strh r3, [r2]
	strh r3, [r2, #2]
	strh r3, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #8]
	strh r0, [r2, #0xa]
	strh r3, [r2, #0xc]
	strh r3, [r2, #0xe]
	bl sub_80112C8
	bl ResetSoundControl
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	ldr r0, _0801170C @ =gUnknown_08026F94
	movs r1, #0xa
	movs r2, #3
	bl nullsub_20
	ldr r0, _08011710 @ =gUnknown_08026FA0
	movs r1, #9
	movs r2, #0x11
	bl nullsub_20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011700: .4byte 0x00000C64
_08011704: .4byte gIORegisters
_08011708: .4byte 0x0000F1FF
_0801170C: .4byte gUnknown_08026F94
_08011710: .4byte gUnknown_08026FA0

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
	bl sub_8011150
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
	bl sub_80113B8
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
	bl sub_8011354
	b _08011934
	.align 2, 0
_080118C8: .4byte gMPlayInfo_BGM
_080118CC: .4byte 0x0000FFFF
_080118D0:
	movs r1, #2
	ldrsh r0, [r5, r1]
	bl sub_8011278
	adds r0, r4, #0
	bl m4aMPlayImmInit
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl sub_8011554
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #1
	bl ChangeTrackPanning
	b _08011934
_080118F4:
	bl sub_80112C8
	b _08011934
_080118FA:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0801190C
	movs r0, #0x14
	bl sub_80113B8
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
	bl sub_80113E8
	b _08011934
_0801192A:
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x78
	bl sub_80113E8
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
	bl sub_8011554
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
	bl sub_8011554
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
	bl sub_8011554
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
	bl sub_8011278
	adds r0, r6, #0
	bl m4aMPlayImmInit
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r0, #1
	bl sub_8011554
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
