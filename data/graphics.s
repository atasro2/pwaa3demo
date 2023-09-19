    .section gfx_data, "aw", %progbits
    .include "asm/macros.inc"

    .global gUnknown_08180000
gUnknown_08180000:
    .incbin "baserom.gba", 0x00180000, 0x800

    .global gPalEvidenceProfileDesc
gPalEvidenceProfileDesc:
    .incbin "graphics/evidence_profile_descriptions/evidence_profile_descriptions.gbapal"

    .global gGfxSaveGameTiles
gGfxSaveGameTiles:
    .incbin "graphics/ui/message_box/save_game_tiles.4bpp"

    .global gUnknown_08181820
gUnknown_08181820:
    .incbin "baserom.gba", 0x00181820, 0x5000

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
    .incbin "baserom.gba", 0x0018D360, 0x1000

    .global gGfxNewGameContinue
gGfxNewGameContinue:
    .incbin "graphics/ui/new_game_continue.4bpp"

    .global gGfxConfetti
gGfxConfetti:
    .incbin "graphics/ui/trial/confetti.4bpp"

    .global gUnknown_0818E780
gUnknown_0818E780:
    .incbin "baserom.gba", 0x0018E780, 0xA00

    .global gGfxWitnessBench1
gGfxWitnessBench1:
    .incbin "graphics/witness_bench_1.4bpp"

    .global gUnknown_0818F580
gUnknown_0818F580:
    .incbin "baserom.gba", 0x0018F580, 0x200

    .global gGfxCounselBench1
gGfxCounselBench1:
    .incbin "graphics/counsel_bench_1.4bpp"

    .global gUnknown_0818FB80
gUnknown_0818FB80:
    .incbin "baserom.gba", 0x0018FB80, 0x900

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

    .global gUnknown_08191E6C
gUnknown_08191E6C:
    .incbin "baserom.gba", 0x00191E6C, 0x5098

    .global gPalCrossExamUI
gPalCrossExamUI:
    .incbin "graphics/unk_14DA80.gbapal"

    .global gUnknown_08196F24
gUnknown_08196F24:
    .incbin "baserom.gba", 0x00196F24, 0x40

    .global gPalActionButtons1
gPalActionButtons1:
    .incbin "graphics/ui/investigation/action_buttons_0.gbapal"

    .global gUnknown_08196F84
gUnknown_08196F84:
    .incbin "baserom.gba", 0x00196F84, 0x20

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

    .global gUnknown_08197044
gUnknown_08197044:
    .incbin "baserom.gba", 0x00197044, 0x200

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

    .global gUnknown_081972E4
gUnknown_081972E4:
    .incbin "baserom.gba", 0x001972E4, 0xA0

    .global gPalConfetti0
gPalConfetti0:
    .incbin "graphics/ui/trial/confetti_0.gbapal"

    .global gUnknown_081973A4
gUnknown_081973A4:
    .incbin "baserom.gba", 0x001973A4, 0x60

    .global gUnknown_08197404
gUnknown_08197404:
    .incbin "baserom.gba", 0x00197404, 0x20

    .global gPalWitnessBench
gPalWitnessBench:
    .incbin "graphics/witness_bench.gbapal"

    .global gPalCounselBench
gPalCounselBench:
    .incbin "graphics/counsel_bench.gbapal"

    .global gUnknown_08197464
gUnknown_08197464:
    .incbin "baserom.gba", 0x00197464, 0x200

    .global gPalInvestigationPsycheLock
gPalInvestigationPsycheLock:
    .incbin "graphics/ui/investigation/psyche_lock.gbapal"

    .global gPalHPBarFrame
gPalHPBarFrame:
    .incbin "graphics/ui/healthbar_frame.gbapal"

    .global gPalHPBarProgress
gPalHPBarProgress:
    .incbin "graphics/ui/healthbar_progress_1.gbapal"

    .global gUnknown_081976C4
gUnknown_081976C4:
    .incbin "baserom.gba", 0x001976C4, 0xE0

    .global gPalChoiceSelected
gPalChoiceSelected:
    .incbin "graphics/talk_location_choices/choice_selected.gbapal"

    .global gUnknown_081977C4
gUnknown_081977C4:
    .incbin "baserom.gba", 0x001977C4, 0x20

    .global gGfxFromSaveOrBeginningOptions
gGfxFromSaveOrBeginningOptions:
    .incbin "graphics/from_save_or_beginning_options.4bpp"

    .global gGfxSaveYesNo
gGfxSaveYesNo:
    .incbin "graphics/save_yes_no.4bpp"

    .global gUnknown_08198FE4
gUnknown_08198FE4:
    .incbin "baserom.gba", 0x00198FE4, 0x6690

    .global gUnknown_0819F674
gUnknown_0819F674:
    .incbin "baserom.gba", 0x0019F674, 0x20

    .global gUnknown_0819F694
gUnknown_0819F694:
    .incbin "baserom.gba", 0x0019F694, 0x7100

    .global gUnknown_081A6794
gUnknown_081A6794:
    .incbin "baserom.gba", 0x001A6794, 0x24F00

    .global gUnknown_081CB694
gUnknown_081CB694:
    .incbin "baserom.gba", 0x001CB694, 0x34694

    .global gUnknown_081FFD28
gUnknown_081FFD28:
    .incbin "baserom.gba", 0x001FFD28, 0x20

    .global gUnknown_081FFD48
gUnknown_081FFD48:
    .incbin "baserom.gba", 0x001FFD48, 0x5C0

    .global gUnknown_08200308
gUnknown_08200308:
    .incbin "baserom.gba", 0x00200308, 0x68E8

    .global gUnknown_08206BF0
gUnknown_08206BF0:
    .incbin "baserom.gba", 0x00206BF0, 0x20

    .global gUnknown_08206C10
gUnknown_08206C10:
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

    .global gUnknown_08270934
gUnknown_08270934:
    .incbin "baserom.gba", 0x00270934, 0x4

    .global gUnknown_08270938
gUnknown_08270938:
    .incbin "baserom.gba", 0x00270938, 0x58F6C8


