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
    .incbin "baserom.gba", 0x0019B260, 0x4414

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

    .global gUnknown_081CB6B4
gUnknown_081CB6B4:
    .incbin "baserom.gba", 0x001CB6B4, 0x34674

    .global gUnknown_081FFD28
gUnknown_081FFD28:
    .incbin "baserom.gba", 0x001FFD28, 0x20

    .global gUnknown_081FFD48
gUnknown_081FFD48:
    .incbin "baserom.gba", 0x001FFD48, 0x5C0

    .global gUnknown_08200308
gUnknown_08200308:
    .incbin "baserom.gba", 0x00200308, 0x68E8

    .global gPal_BustupMia
gPal_BustupMia:
    .incbin "baserom.gba", 0x00206BF0, 0x20

    .global gMap_BustupMia
gMap_BustupMia:
    .incbin "baserom.gba", 0x00206C10, 0x1E90

    .global gUnknown_08208AA0
gUnknown_08208AA0:
    .incbin "baserom.gba", 0x00208AA0, 0x20

    .global gUnknown_08208AC0
gUnknown_08208AC0:
    .incbin "baserom.gba", 0x00208AC0, 0x50DC

    .global gGfxSpeedlinesFirstAndLastColumns
gGfxSpeedlinesFirstAndLastColumns:
    .incbin "graphics/speedlines_first_and_last_columns.4bpp"

    .global gUnknown_0820E31C
gUnknown_0820E31C:
    .incbin "baserom.gba", 0x0020E31C, 0x20

    .global gUnknown_0820E33C
gUnknown_0820E33C:
    .incbin "baserom.gba", 0x0020E33C, 0x410

    .global gPalCourtScroll
gPalCourtScroll:
    .incbin "graphics/court_scrolls/court_scroll.gbapal"

    .global gUnknown_0820E76C
gUnknown_0820E76C:
    .incbin "baserom.gba", 0x0020E76C, 0x43D28

    .global gUnknown_08252494
gUnknown_08252494:
    .incbin "baserom.gba", 0x00252494, 0x4

    .global gUnknown_08252498
gUnknown_08252498:
    .incbin "baserom.gba", 0x00252498, 0x1C118

    .global gGfxSeqAnimation35
gGfxSeqAnimation35:
    .incbin "graphics/animations/animation35.seq"

    .global gUnknown_0826E6A8
gUnknown_0826E6A8:
    .incbin "baserom.gba", 0x0026E6A8, 0x11E0

    .global gUnknown_0826F888
gUnknown_0826F888:
    .incbin "baserom.gba", 0x0026F888, 0x5B0

    .global gUnknown_0826FE38
gUnknown_0826FE38:
    .incbin "baserom.gba", 0x0026FE38, 0xAFC

    .global std_scripts
std_scripts:
    .incbin "baserom.gba", 0x00270934, 0x4

    .global gUnknown_08270938
gUnknown_08270938:
    .incbin "baserom.gba", 0x00270938, 0x58F6C8


