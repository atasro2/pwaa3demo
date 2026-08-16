    .section gfx_data, "aw", %progbits
    .include "asm/macros.inc"
    .align 2, 0

    .global gUnknown_08180000
gUnknown_08180000:
	.incbin "graphics/unk_180000.4bpp"

    .global gPalEvidenceProfileDesc
gPalEvidenceProfileDesc:
    .incbin "graphics/evidence_profile_descriptions/evidence_profile_descriptions.gbapal"

    .global gGfxSaveGameTiles
gGfxSaveGameTiles:
    .incbin "graphics/ui/message_box/save_game_tiles.4bpp"

    .global gGfx4bppNametags
gGfx4bppNametags:
	.incbin "graphics/ui/message_box/nametags.4bpp"

    .global gGfxDetentionCenterBottomTiles
gGfxDetentionCenterBottomTiles:
    .incbin "graphics/detention_center_bottom_tiles.4bpp"

    .global gGfx4bppTestimonyArrows
gGfx4bppTestimonyArrows:
    .incbin "graphics/ui/left_right_arrows.4bpp"

    .global gGfxUnusedTestimonyCharacters
gGfxUnusedTestimonyCharacters:
    .incbin "graphics/ui/trial/unused_testimony_characters.4bpp"

    .global gGfx4bppInvestigationActions
gGfx4bppInvestigationActions:
    .incbin "graphics/ui/investigation/action_buttons.4bpp"

    .global gGfx4bppControllerButtons
gGfx4bppControllerButtons:
    .incbin "graphics/ui/court_record/controller_buttons.4bpp"

    .global gGfx4bppInvestigationScrollButton
gGfx4bppInvestigationScrollButton:
    .incbin "graphics/ui/investigation/scroll_prompt.4bpp"

    .global gGfx4bppTestimonyTextTiles
gGfx4bppTestimonyTextTiles:
    .incbin "graphics/ui/trial/testimony_text_tiles.4bpp"

    .global gGfxPressPresentButtons
gGfxPressPresentButtons:
    .incbin "graphics/ui/trial/press_present_buttons.4bpp"

    .global gGfx4bppPresentBackTextTiles
gGfx4bppPresentBackTextTiles:
    .incbin "graphics/ui/court_record/present_back_text.4bpp"

    .global gGfx4bppProfileTextTiles
gGfx4bppProfileTextTiles:
    .incbin "graphics/ui/court_record/profiles_text.4bpp"

    .global gGfxEvidenceText
gGfxEvidenceText:
    .incbin "graphics/ui/court_record/evidence_text.4bpp"

    .global gGfxExamineCursor
gGfxExamineCursor:
    .incbin "graphics/ui/investigation/examine_cursor.4bpp"

    .global gGfxCheckmark
gGfxCheckmark:
    .incbin "graphics/ui/investigation/checkmark.4bpp"

    .global gGfxGameOverDoors
gGfxGameOverDoors:
    .incbin "graphics/ui/trial/game_over_doors.4bpp"

    .global gGfxNotGuilty1
gGfxNotGuilty1:
    .incbin "graphics/ui/trial/not_guilty1.4bpp"

    .global gGfxGuilty1
gGfxGuilty1:
    .incbin "graphics/ui/trial/guilty1.4bpp"

    .global gGfxGuiltyNotGuilty2
gGfxGuiltyNotGuilty2:
    .incbin "graphics/ui/trial/guilty_not_guilty2.4bpp"

    .global gUnknown_0818D360
gUnknown_0818D360:
	.incbin "graphics/unk_18D360.4bpp"

    .global gGfxNewGameContinue
gGfxNewGameContinue:
    .incbin "graphics/ui/new_game_continue.4bpp"

    .global gGfxConfetti
gGfxConfetti:
    .incbin "graphics/ui/trial/confetti.4bpp"

    .global gUnknown_0818E780
gUnknown_0818E780:
	.incbin "graphics/unk_18E780.4bpp"

    .global gGfxWitnessBench1
gGfxWitnessBench1:
    .incbin "graphics/witness_bench_1.4bpp"

    .global gUnknown_0818F580
gUnknown_0818F580:
	.incbin "graphics/unk_18F580.4bpp"

    .global gGfxCounselBench1
gGfxCounselBench1:
    .incbin "graphics/counsel_bench_1.4bpp"

    .global gUnknown_0818FB80
gUnknown_0818FB80:
	.incbin "graphics/unk_18FB80.4bpp"

    .global gGfxInvestigationStopButton
gGfxInvestigationStopButton:
    .incbin "graphics/ui/investigation/stop_button.4bpp"

    .global gGfxInvestigationPsycheLock
gGfxInvestigationPsycheLock:
    .incbin "graphics/ui/investigation/psyche_lock.4bpp"

    .global gGfxHPBarFrame1
gGfxHPBarFrame1:
    .incbin "graphics/ui/healthbar_frame_1.4bpp"

    .global gGfxHPBarFrame2
gGfxHPBarFrame2:
    .incbin "graphics/ui/healthbar_frame_2.4bpp"

    .global gGfxHPBarFrame3
gGfxHPBarFrame3:
    .incbin "graphics/ui/healthbar_frame_3.4bpp"

    .global gGfxHPBarProgress
gGfxHPBarProgress:
    .incbin "graphics/ui/healthbar_progress.4bpp"

    .global gGfxPsycheLockChainsTiles
gGfxPsycheLockChainsTiles:
    .incbin "graphics/psyche_lock_chain_tileset.4bpp.lz"

@ psychelock chain animations
	.global gUnknown_08191E6C
gUnknown_08191E6C:
	.incbin "graphics/psyche_lock_chain_animation_01.bin.lz"

	.global gUnknown_081920A4
gUnknown_081920A4:
	.incbin "graphics/psyche_lock_chain_animation_02.bin.lz"

	.global gUnknown_08192494
gUnknown_08192494:
	.incbin "graphics/psyche_lock_chain_animation_03.bin.lz"

	.global gUnknown_081928C8
gUnknown_081928C8:
	.incbin "graphics/psyche_lock_chain_animation_04.bin.lz"

	.global gUnknown_08192F34
gUnknown_08192F34:
	.incbin "graphics/psyche_lock_chain_animation_05.bin.lz"

	.global gUnknown_081936A8
gUnknown_081936A8:
	.incbin "graphics/psyche_lock_chain_animation_06.bin.lz"

	.global gUnknown_0819382C
gUnknown_0819382C:
	.incbin "graphics/psyche_lock_chain_animation_07.bin.lz"

	.global gUnknown_08193A94
gUnknown_08193A94:
	.incbin "graphics/psyche_lock_chain_animation_08.bin.lz"

	.global gUnknown_08193EF4
gUnknown_08193EF4:
	.incbin "graphics/psyche_lock_chain_animation_09.bin.lz"

	.global gUnknown_08194354
gUnknown_08194354:
	.incbin "graphics/psyche_lock_chain_animation_10.bin.lz"

	.global gUnknown_08194B68
gUnknown_08194B68:
	.incbin "graphics/psyche_lock_chain_animation_11.bin.lz"

	.global gUnknown_08194DC8
gUnknown_08194DC8:
	.incbin "graphics/psyche_lock_chain_animation_12.bin.lz"

	.global gUnknown_08195168
gUnknown_08195168:
	.incbin "graphics/psyche_lock_chain_animation_13.bin.lz"

	.global gUnknown_08195518
gUnknown_08195518:
	.incbin "graphics/psyche_lock_chain_animation_14.bin.lz"

	.global gUnknown_08195A10
gUnknown_08195A10:
	.incbin "graphics/psyche_lock_chain_animation_15.bin.lz"

	.global gUnknown_08195F24
gUnknown_08195F24:
	.incbin "graphics/psyche_lock_chain_animation_16.bin.lz"

	.global gUnknown_081960BC
gUnknown_081960BC:
	.incbin "graphics/psyche_lock_chain_animation_17.bin.lz"

	.global gUnknown_08196368
gUnknown_08196368:
	.incbin "graphics/psyche_lock_chain_animation_18.bin.lz"

	.global gUnknown_0819669C
gUnknown_0819669C:
	.incbin "graphics/psyche_lock_chain_animation_19.bin.lz"

	.global gUnknown_08196A28
gUnknown_08196A28:
	.incbin "graphics/psyche_lock_chain_animation_20.bin.lz"

	.global gUnknown_08196EE4
gUnknown_08196EE4:
	.incbin "graphics/unk_196EE4.gbapal"

    .global gPalCrossExaminationUI
gPalCrossExaminationUI:
    .incbin "graphics/unk_14DA80.gbapal"

	.global gUnknown_08196F24
gUnknown_08196F24:
	.incbin "graphics/gUnknown_08196F24.gbapal"

	.global gUnknown_08196F44
gUnknown_08196F44:
	.incbin "graphics/gUnknown_08196F44.gbapal"

    .global gPalActionButtons
gPalActionButtons:
    .incbin "graphics/ui/investigation/action_buttons_0.gbapal"
    .incbin "graphics/ui/investigation/action_buttons_1.gbapal"

    .global gPalCourtRecordActionText
gPalCourtRecordActionText:
    .incbin "graphics/ui/court_record/controls_blurb.gbapal"

    .global gPalInvestigationScrollPrompt
gPalInvestigationScrollPrompt:
    .incbin "graphics/ui/investigation/scroll_prompt.gbapal"

    .global gPalTestimonyTextTiles
gPalTestimonyTextTiles:
    .incbin "graphics/ui/trial/testimony_text_tiles.gbapal"

    .global gPalPressPresentButtons
gPalPressPresentButtons:
    .incbin "graphics/ui/trial/press_present_buttons.gbapal"

    .global gPalExamineCursors
gPalExamineCursors:
    .incbin "graphics/ui/investigation/examine_cursor_00.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_01.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_02.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_03.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_04.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_05.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_06.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_07.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_08.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_09.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_10.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_11.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_12.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_13.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_14.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_15.gbapal"
    .incbin "graphics/ui/investigation/examine_cursor_16.gbapal"

    .global gPalCheckmark
gPalCheckmark:
    .incbin "graphics/ui/investigation/checkmark.gbapal"

    .global gPalGameOverDoors
gPalGameOverDoors:
    .incbin "graphics/ui/trial/game_over_doors.gbapal"

    .global gPalGuilty
gPalGuilty:
    .incbin "graphics/ui/trial/guilty.gbapal"

    .global gPalNotGuilty
gPalNotGuilty:
    .incbin "graphics/ui/trial/not_guilty.gbapal"

    .global gPalNewGameContinue
gPalNewGameContinue:
    .incbin "graphics/ui/new_game_continue_0.gbapal"
    .incbin "graphics/ui/new_game_continue_1.gbapal"
    .incbin "graphics/ui/new_game_continue_2.gbapal"
    .incbin "graphics/ui/new_game_continue_3.gbapal"
    .incbin "graphics/ui/new_game_continue_4.gbapal"
    .incbin "graphics/ui/new_game_continue_5.gbapal"

    .global gPalConfetti
gPalConfetti:
    .incbin "graphics/ui/trial/confetti_0.gbapal"
    .incbin "graphics/ui/trial/confetti_1.gbapal"
    .incbin "graphics/ui/trial/confetti_2.gbapal"
    .incbin "graphics/ui/trial/confetti_3.gbapal"

    .global gUnknown_08197404
gUnknown_08197404:
	.incbin "graphics/ui/gUnknown_08197404.gbapal"

    .global gPalWitnessBench
gPalWitnessBench:
    .incbin "graphics/witness_bench.gbapal"

    .global gPalCounselBench
gPalCounselBench:
    .incbin "graphics/counsel_bench.gbapal"
    
	.global gUnknown_08197464
gUnknown_08197464:
	.incbin "graphics/gUnknown_08197464.gbapal"


	.global gUnknown_08197484
gUnknown_08197484:
	.incbin "graphics/gUnknown_08197484.gbapal"


	.global gUnknown_081974A4
gUnknown_081974A4:
	.incbin "graphics/gUnknown_081974A4.gbapal"


	.global gUnknown_081974C4
gUnknown_081974C4:
	.incbin "graphics/gUnknown_081974C4.gbapal"


	.global gUnknown_081974E4
gUnknown_081974E4:
	.incbin "graphics/gUnknown_081974E4.gbapal"


	.global gUnknown_08197504
gUnknown_08197504:
	.incbin "graphics/gUnknown_08197504.gbapal"


	.global gUnknown_08197524
gUnknown_08197524:
	.incbin "graphics/gUnknown_08197524.gbapal"


	.global gUnknown_08197544
gUnknown_08197544:
	.incbin "graphics/gUnknown_08197544.gbapal"


	.global gUnknown_08197564
gUnknown_08197564:
	.incbin "graphics/gUnknown_08197564.gbapal"


	.global gUnknown_08197584
gUnknown_08197584:
	.incbin "graphics/gUnknown_08197584.gbapal"


	.global gUnknown_081975A4
gUnknown_081975A4:
	.incbin "graphics/gUnknown_081975A4.gbapal"


	.global gUnknown_081975C4
gUnknown_081975C4:
	.incbin "graphics/gUnknown_081975C4.gbapal"


	.global gUnknown_081975E4
gUnknown_081975E4:
	.incbin "graphics/gUnknown_081975E4.gbapal"


	.global gUnknown_08197604
gUnknown_08197604:
	.incbin "graphics/gUnknown_08197604.gbapal"


	.global gUnknown_08197624
gUnknown_08197624:
	.incbin "graphics/gUnknown_08197624.gbapal"


	.global gUnknown_08197644
gUnknown_08197644:
	.incbin "graphics/gUnknown_08197644.gbapal"


    .global gPalInvestigationPsycheLock
gPalInvestigationPsycheLock:
    .incbin "graphics/ui/investigation/psyche_lock.gbapal"

    .global gPalHPBarFrame
gPalHPBarFrame:
    .incbin "graphics/ui/healthbar_frame.gbapal"

    .global gPalHPBarProgress
gPalHPBarProgress:
    .incbin "graphics/ui/healthbar_progress_1.gbapal"
    .incbin "graphics/ui/healthbar_progress_2.gbapal"
    .incbin "graphics/ui/healthbar_progress_3.gbapal"
    .incbin "graphics/ui/healthbar_progress_4.gbapal"
    .incbin "graphics/ui/healthbar_progress_5.gbapal"
    .incbin "graphics/ui/healthbar_progress_6.gbapal"
    .incbin "graphics/ui/healthbar_progress_7.gbapal"
    .incbin "graphics/ui/healthbar_progress_8.gbapal"

    .global gPalChoiceSelected
gPalChoiceSelected:
    .incbin "graphics/talk_location_choices/choice_selected.gbapal"

    .global gUnknown_081977C4
gUnknown_081977C4:
	.incbin "graphics/gUnknown_081977C4.gbapal"

    .global gGfxFromSaveOrBeginningOptions
gGfxFromSaveOrBeginningOptions:
    .incbin "graphics/from_save_or_beginning_options.4bpp"

    .global gGfxSaveYesNo
gGfxSaveYesNo:
    .incbin "graphics/save_yes_no.4bpp"

    .global gEvidenceProfileDescriptions
gEvidenceProfileDescriptions:
	.incbin "graphics/evidence_profile_descriptions/gUnknown_08198FE4.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_08199444.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_0819984C.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_08199CA0.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_0819A0FC.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_0819A55C.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_0819A970.4bpp.lz"
	.incbin "graphics/evidence_profile_descriptions/gUnknown_0819AE04.4bpp.lz"

    .global gEvidenceProfilePictures
gEvidenceProfilePictures:
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819B260.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819B500.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819B8A4.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819BDA0.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819C094.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819C590.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819C9F8.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819CE48.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819D384.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819D9F8.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819DF94.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819E560.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819EB70.epicon.lz"
	.incbin "graphics/evidence_profile_pictures/gUnknown_0819EFE8.epicon.lz"

@ BEGIN CHARSETS

    .global gTextPal
gTextPal:
    .incbin "graphics/charset.gbapal"

    .global gCharSet
gCharSet:
    .incbin "graphics/charset.4bpp"

@ END CHARSETS

    .global gPalMapMarkers
gPalMapMarkers:
    .incbin "graphics/map_markers/palette.gbapal"

    .global gBackgrounds
gBackgrounds:
	.incbin "graphics/striped_images/backgrounds/gUnknown_081CB6B4.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081D0458.4bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081D2000.4bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081D3A04.4bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081D569C.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081DBB9C.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081E1A08.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081E911C.4bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081ECBB4.4bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081EEB48.4bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081EF7D0.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081F2D90.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081F7D50.8bpp.striped"
	.incbin "graphics/striped_images/backgrounds/gUnknown_081FC188.4bpp.striped"

    .global gUnknown_081FFD28
gUnknown_081FFD28:
	.incbin "graphics/case1_opening_phoenix_legs.gbapal"

    .global gUnknown_081FFD48
gUnknown_081FFD48:
	.incbin "graphics/case1_opening_phoenix_legs.4bpp.lz"

	.global gUnknown_08200308
gUnknown_08200308:
	.incbin "graphics/case1_opening_phoenix_and_doug.gbapal"

	.global gUnknown_08200508
gUnknown_08200508:
	.incbin "graphics/case1_opening_phoenix_and_doug.8bpp.lz"

	.global gUnknown_082012F8
gUnknown_082012F8:
	.incbin "graphics/striped_images/gUnknown_002012F8.4bpp.striped"

	.global gUnknown_08204424
gUnknown_08204424:
	.incbin "graphics/striped_images/gUnknown_00204424.4bpp.striped"

    .global gPal_BustupMia
gPal_BustupMia:
	.incbin "graphics/bustup_mia.gbapal"

    .global gMap_BustupMia
gMap_BustupMia:
	.incbin "graphics/bustup_mia.bin"

    .global gUnknown_08208AA0
gUnknown_08208AA0:
	.incbin "graphics/unk_208AA0.gbapal"

	.global gUnknown_08208AC0
gUnknown_08208AC0:
	.incbin "graphics/unk_208AC0.bin"

	.global gUnknown_08208F70
gUnknown_08208F70:
	.incbin "graphics/208F70.4bpp"

	.global gUnknown_0820CCF0
gUnknown_0820CCF0:
	.incbin "graphics/speedlines.4bpp.striped"

    .global gGfxSpeedlinesFirstAndLastColumns
gGfxSpeedlinesFirstAndLastColumns:
    .incbin "graphics/speedlines_first_and_last_columns.4bpp"

	.global gUnknown_0820E31C
gUnknown_0820E31C:
	.incbin "graphics/capcom_logo.gbapal"

	.global gUnknown_0820E33C
gUnknown_0820E33C:
	.incbin "graphics/capcom_logo.4bpp.lz"

    .global gPalCourtScroll
gPalCourtScroll:
    .incbin "graphics/court_scrolls/court_scroll.gbapal"

    .global gGfxCourtScroll
gGfxCourtScroll:
    .incbin "graphics/court_scrolls/court_scroll.4bpp"

@ BEGIN ANIMATIONS?
	.global gUnknown_0821AF6C
gUnknown_0821AF6C:
	.incbin "graphics/animations/characters/animation01.pix"


	.global gUnknown_0821EE08
gUnknown_0821EE08:
	.incbin "graphics/animations/characters/animation01.seq"


	.global gUnknown_0821FB58
gUnknown_0821FB58:
	.incbin "graphics/animations/characters/animation02.pix"


	.global gUnknown_0822E224
gUnknown_0822E224:
	.incbin "graphics/animations/characters/animation02.seq"


	.global gUnknown_082309EC
gUnknown_082309EC:
	.incbin "graphics/animations/characters/animation03.pix"


	.global gUnknown_08237878
gUnknown_08237878:
	.incbin "graphics/animations/characters/animation03.seq"


	.global gUnknown_0823A31C
gUnknown_0823A31C:
	.incbin "graphics/animations/characters/animation04.pix"


	.global gUnknown_08245AC4
gUnknown_08245AC4:
	.incbin "graphics/animations/characters/animation04.seq"


	.global gUnknown_08247920
gUnknown_08247920:
	.incbin "graphics/animations/characters/animation05.pix"


	.global gUnknown_08249E10
gUnknown_08249E10:
	.incbin "graphics/animations/characters/animation05.seq"


	.global gUnknown_0824A630
gUnknown_0824A630:
	.incbin "graphics/animations/characters/animation06.pix"


	.global gUnknown_0824B554
gUnknown_0824B554:
	.incbin "graphics/animations/characters/animation06.seq"


	.global gUnknown_0824B8EC
gUnknown_0824B8EC:
	.incbin "graphics/animations/characters/animation07.pix"


	.global gUnknown_0825153C
gUnknown_0825153C:
	.incbin "graphics/animations/characters/animation07.seq"


	.global gUnknown_08252494
gUnknown_08252494:
	.incbin "graphics/animations/tileset01.pix"


	.global gUnknown_0826E5B0
gUnknown_0826E5B0:
	.incbin "graphics/animations/animation01.seq"


	.global gUnknown_0826E6A8
gUnknown_0826E6A8:
	.incbin "graphics/animations/animation02.seq"


	.global gUnknown_0826E7D0
gUnknown_0826E7D0:
	.incbin "graphics/animations/animation03.seq"


	.global gUnknown_0826E7F0
gUnknown_0826E7F0:
	.incbin "graphics/animations/animation04.seq"


	.global gUnknown_0826E810
gUnknown_0826E810:
	.incbin "graphics/animations/animation05.seq"


	.global gUnknown_0826E830
gUnknown_0826E830:
	.incbin "graphics/animations/animation06.seq"


	.global gUnknown_0826E850
gUnknown_0826E850:
	.incbin "graphics/animations/animation07.seq"


	.global gUnknown_0826E888
gUnknown_0826E888:
	.incbin "graphics/animations/animation08.seq"


	.global gUnknown_0826E8C0
gUnknown_0826E8C0:
	.incbin "graphics/animations/animation09.seq"


	.global gUnknown_0826E8F8
gUnknown_0826E8F8:
	.incbin "graphics/animations/animation10.seq"


	.global gUnknown_0826E918
gUnknown_0826E918:
	.incbin "graphics/animations/animation11.seq"


	.global gUnknown_0826E988
gUnknown_0826E988:
	.incbin "graphics/animations/animation12.seq"


	.global gUnknown_0826EB78
gUnknown_0826EB78:
	.incbin "graphics/animations/animation13.seq"


	.global gUnknown_0826EC08
gUnknown_0826EC08:
	.incbin "graphics/animations/animation14.seq"


	.global gUnknown_0826EC88
gUnknown_0826EC88:
	.incbin "graphics/animations/animation15.seq"


	.global gUnknown_0826ED0C
gUnknown_0826ED0C:
	.incbin "graphics/animations/animation16.seq"


	.global gUnknown_0826ED8C
gUnknown_0826ED8C:
	.incbin "graphics/animations/animation17.seq"


	.global gUnknown_0826EE10
gUnknown_0826EE10:
	.incbin "graphics/animations/animation18.seq"


	.global gUnknown_0826EE94
gUnknown_0826EE94:
	.incbin "graphics/animations/animation19.seq"


	.global gUnknown_0826EF14
gUnknown_0826EF14:
	.incbin "graphics/animations/animation20.seq"


	.global gUnknown_0826EF98
gUnknown_0826EF98:
	.incbin "graphics/animations/animation21.seq"


	.global gUnknown_0826F018
gUnknown_0826F018:
	.incbin "graphics/animations/animation22.seq"


	.global gUnknown_0826F09C
gUnknown_0826F09C:
	.incbin "graphics/animations/animation23.seq"


	.global gUnknown_0826F120
gUnknown_0826F120:
	.incbin "graphics/animations/animation24.seq"


	.global gUnknown_0826F1A0
gUnknown_0826F1A0:
	.incbin "graphics/animations/animation25.seq"


	.global gUnknown_0826F1C8
gUnknown_0826F1C8:
	.incbin "graphics/animations/animation26.seq"


	.global gUnknown_0826F1F0
gUnknown_0826F1F0:
	.incbin "graphics/animations/animation27.seq"


	.global gUnknown_0826F218
gUnknown_0826F218:
	.incbin "graphics/animations/animation28.seq"


	.global gUnknown_0826F240
gUnknown_0826F240:
	.incbin "graphics/animations/animation29.seq"


	.global gUnknown_0826F268
gUnknown_0826F268:
	.incbin "graphics/animations/animation30.seq"


	.global gUnknown_0826F2C8
gUnknown_0826F2C8:
	.incbin "graphics/animations/animation31.seq"


	.global gUnknown_0826F328
gUnknown_0826F328:
	.incbin "graphics/animations/animation32.seq"


	.global gUnknown_0826F460
gUnknown_0826F460:
	.incbin "graphics/animations/animation33.seq"


	.global gUnknown_0826F480
gUnknown_0826F480:
	.incbin "graphics/animations/animation34.seq"


	.global gUnknown_0826F4A0
gUnknown_0826F4A0:
	.incbin "graphics/animations/animation35.seq"


	.global gUnknown_0826F65C
gUnknown_0826F65C:
	.incbin "graphics/animations/animation36.seq"


	.global gUnknown_0826F888
gUnknown_0826F888:
	.incbin "graphics/animations/animation37.seq"


	.global gUnknown_0826F8C0
gUnknown_0826F8C0:
	.incbin "graphics/animations/animation38.seq"


	.global gUnknown_0826F8F8
gUnknown_0826F8F8:
	.incbin "graphics/animations/animation39.seq"


	.global gUnknown_0826F930
gUnknown_0826F930:
	.incbin "graphics/animations/animation40.seq"


	.global gUnknown_0826F968
gUnknown_0826F968:
	.incbin "graphics/animations/animation41.seq"


	.global gUnknown_0826F9AC
gUnknown_0826F9AC:
	.incbin "graphics/animations/animation42.seq"


	.global gUnknown_0826F9F0
gUnknown_0826F9F0:
	.incbin "graphics/animations/animation43.seq"


	.global gUnknown_0826FA2C
gUnknown_0826FA2C:
	.incbin "graphics/animations/animation44.seq"


	.global gUnknown_0826FA68
gUnknown_0826FA68:
	.incbin "graphics/animations/animation45.seq"


	.global gUnknown_0826FAA0
gUnknown_0826FAA0:
	.incbin "graphics/animations/animation46.seq"


	.global gUnknown_0826FAD8
gUnknown_0826FAD8:
	.incbin "graphics/animations/animation47.seq"


	.global gUnknown_0826FB18
gUnknown_0826FB18:
	.incbin "graphics/animations/animation48.seq"


	.global gUnknown_0826FB58
gUnknown_0826FB58:
	.incbin "graphics/animations/animation49.seq"


	.global gUnknown_0826FC70
gUnknown_0826FC70:
	.incbin "graphics/animations/animation50.seq"


	.global gUnknown_0826FDD4
gUnknown_0826FDD4:
	.incbin "graphics/animations/animation51.seq"


	.global gUnknown_0826FE38
gUnknown_0826FE38:
	.incbin "graphics/animations/animation52.seq"


	.global gUnknown_0826FE78
gUnknown_0826FE78:
	.incbin "graphics/animations/animation53.seq"


	.global gUnknown_0826FEB8
gUnknown_0826FEB8:
	.incbin "graphics/animations/animation54.seq"


	.global gUnknown_0826FEF8
gUnknown_0826FEF8:
	.incbin "graphics/animations/animation55.seq"


	.global gUnknown_0827001C
gUnknown_0827001C:
	.incbin "graphics/animations/animation56.seq"


	.global gUnknown_08270070
gUnknown_08270070:
	.incbin "graphics/animations/animation57.seq"


	.global gUnknown_082700AC
gUnknown_082700AC:
	.incbin "graphics/animations/animation58.seq"


	.global gUnknown_082700E8
gUnknown_082700E8:
	.incbin "graphics/animations/animation59.seq"


	.global gUnknown_08270120
gUnknown_08270120:
	.incbin "graphics/animations/animation60.seq"


	.global gUnknown_0827015C
gUnknown_0827015C:
	.incbin "graphics/animations/animation61.seq"


	.global gUnknown_08270198
gUnknown_08270198:
	.incbin "graphics/animations/animation62.seq"


	.global gUnknown_082703D4
gUnknown_082703D4:
	.incbin "graphics/animations/animation63.seq"


	.global gUnknown_08270620
gUnknown_08270620:
	.incbin "graphics/animations/animation64.seq"


	.global gUnknown_0827064C
gUnknown_0827064C:
	.incbin "graphics/animations/animation65.seq"


	.global gUnknown_082706FC
gUnknown_082706FC:
	.incbin "graphics/animations/animation66.seq"


	.global gUnknown_08270748
gUnknown_08270748:
	.incbin "graphics/animations/animation67.seq"


	.global gUnknown_08270768
gUnknown_08270768:
	.incbin "graphics/animations/animation68.seq"


	.global gUnknown_082707A0
gUnknown_082707A0:
	.incbin "graphics/animations/animation69.seq"


	.global gUnknown_082707C8
gUnknown_082707C8:
	.incbin "graphics/animations/animation70.seq"


	.global gUnknown_082707EC
gUnknown_082707EC:
	.incbin "graphics/animations/animation71.seq"


	.global gUnknown_08270824
gUnknown_08270824:
	.incbin "graphics/animations/animation72.seq"


	.global gUnknown_0827085C
gUnknown_0827085C:
	.incbin "graphics/animations/animation73.seq"


	.global gUnknown_082708C8
gUnknown_082708C8:
	.incbin "graphics/animations/animation74.seq"

    .global std_scripts
std_scripts:
	.incbin "script/std_scripts.phscr"

    .global scenario_0_0_script
scenario_0_0_script:
	.incbin "script/scenario_0_0_script.phscr.lz"

    .global gUnknown_08275338
gUnknown_08275338:
	.incbin "script/gUnknown_08275338.phscr"

@ needed to fill out the rom
gPadding:
    .rept 0x400000
    .byte 0xFF
    .endr

