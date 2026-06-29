#ifndef GUARD_GRAPHICS_H
#define GUARD_GRAPHICS_H

#ifndef ROM_START
#define ROM_START 0x08000000 // why is this not already a fucking define 
#endif

#define GFX_BASE_ADDR (ROM_START + 0x180000)

#define gPalEvidenceProfileDesc ((void*)(0x08180800))
#define gGfxSaveGameTiles ((void*)(0x08180820))
#define gGfx4bppNametags ((void*)(GFX_BASE_ADDR + 0x1820))
#define gGfxDetentionCenterBottomTiles ((void*)(GFX_BASE_ADDR + 0x6820))
#define gGfx4bppTestimonyArrows ((void*)(GFX_BASE_ADDR + 0x6880))
#define gGfx4bppInvestigationActions ((void*)(GFX_BASE_ADDR + 0x8B80))
#define gGfx4bppControllerButtons ((void*)(GFX_BASE_ADDR + 0x9B80))
#define gGfx4bppInvestigationScrollButton ((void*)(GFX_BASE_ADDR + 0x9D80))
#define gGfx4bppTestimonyTextTiles ((void*)(GFX_BASE_ADDR + 0x9F80))
#define gGfxPressPresentButtons ((void*)(GFX_BASE_ADDR + 0xA780))
#define gGfx4bppPresentBackTextTiles ((void*)(GFX_BASE_ADDR + 0xAB80))
#define gGfx4bppProfileTextTiles ((void*)(GFX_BASE_ADDR + 0xAD80))
#define gGfxEvidenceText ((void*)(GFX_BASE_ADDR + 0xAF80))
#define gGfxExamineCursor ((void*)(GFX_BASE_ADDR + 0xB180))
#define gGfxCheckmark ((void*)(GFX_BASE_ADDR + 0xB680))
#define gGfxNotGuilty1 ((void*)(GFX_BASE_ADDR + 0xBB60))
#define gGfxGuilty1 ((void*)(GFX_BASE_ADDR + 0xC360))
#define gGfxGuiltyNotGuilty2 ((void*)(GFX_BASE_ADDR + 0xCB60))


#define gGfxNewGameContinue ((void*)(GFX_BASE_ADDR + 0xE360))
#define gGfxConfetti ((void*)(GFX_BASE_ADDR + 0xE760))
#define gUnknown_0818E780 ((void*)(GFX_BASE_ADDR + 0xE780))
#define gGfxWitnessBench1 ((void*)(GFX_BASE_ADDR + 0xF180))
#define gGfxCounselBench1 ((void*)(GFX_BASE_ADDR + 0xF780))
#define gGfxInvestigationStopButton ((void*)(GFX_BASE_ADDR + 0x10480))
#define gGfxInvestigationPsycheLock ((void*)(GFX_BASE_ADDR + 0x10680))
#define gGfxPsycheLockChainsTiles ((void*)(GFX_BASE_ADDR + 0x10C00))
#define gPalCrossExaminationUI ((void*)(GFX_BASE_ADDR + 0x16F04))
#define gPalActionButtons ((void*)(GFX_BASE_ADDR + 0x16F64))
#define gPalCourtRecordActionText ((void*)(GFX_BASE_ADDR + 0x16FA4))
#define gPalPressPresentButtons ((void*)(GFX_BASE_ADDR + 0x17004))
#define gPalCheckmark ((void*)(GFX_BASE_ADDR + 0x17244))
#define gPalNewGameContinue ((void*)(GFX_BASE_ADDR + 0x172C4))
#define gUnknown_08197404 ((void*)(GFX_BASE_ADDR + 0x17404))
#define gPalInvestigationPsycheLock ((void*)(GFX_BASE_ADDR + 0x17664))
#define gGfxFromSaveOrBeginningOptions ((void*)(0x081977e4))
#define gGfxSaveYesNo ((void*)(0x081987e4))
#define gGfxGameOverDoors ((void*)0x0818b880)
#define gPalInvestigationScrollPrompt ((void*)(GFX_BASE_ADDR + 0x16FC4))
#define gPalTestimonyTextTiles ((void*)(GFX_BASE_ADDR + 0x16FE4))
#define gPalGameOverDoors ((void*)0x08197264)
#define gPalConfetti0 ((void*)(GFX_BASE_ADDR + 0x17384))
#define gPalChoiceSelected ((void*)(0x081977a4))

#define gUnknown_08198FE4 ((void*)(GFX_BASE_ADDR + 0x18FE4))
#define gUnknown_08199444 ((void*)(GFX_BASE_ADDR + 0x19444))
#define gUnknown_0819984C ((void*)(GFX_BASE_ADDR + 0x1984C))
#define gUnknown_08199CA0 ((void*)(GFX_BASE_ADDR + 0x19CA0))
#define gUnknown_0819A0FC ((void*)(GFX_BASE_ADDR + 0x1A0FC))
#define gUnknown_0819A55C ((void*)(GFX_BASE_ADDR + 0x1A55C))
#define gUnknown_0819A970 ((void*)(GFX_BASE_ADDR + 0x1A970))
#define gUnknown_0819AE04 ((void*)(GFX_BASE_ADDR + 0x1AE04))

#define gUnknown_0819B260 ((void*)(GFX_BASE_ADDR + 0x1B260)) 
#define gUnknown_0819B500 ((void*)(GFX_BASE_ADDR + 0x1B500)) 
#define gUnknown_0819B8A4 ((void*)(GFX_BASE_ADDR + 0x1B8A4)) 
#define gUnknown_0819BDA0 ((void*)(GFX_BASE_ADDR + 0x1BDA0)) 
#define gUnknown_0819C094 ((void*)(GFX_BASE_ADDR + 0x1C094)) 
#define gUnknown_0819C590 ((void*)(GFX_BASE_ADDR + 0x1C590)) 
#define gUnknown_0819C9F8 ((void*)(GFX_BASE_ADDR + 0x1C9F8)) 
#define gUnknown_0819CE48 ((void*)(GFX_BASE_ADDR + 0x1CE48)) 
#define gUnknown_0819D384 ((void*)(GFX_BASE_ADDR + 0x1D384)) 
#define gUnknown_0819D9F8 ((void*)(GFX_BASE_ADDR + 0x1D9F8)) 
#define gUnknown_0819DF94 ((void*)(GFX_BASE_ADDR + 0x1DF94)) 
#define gUnknown_0819E560 ((void*)(GFX_BASE_ADDR + 0x1E560)) 
#define gUnknown_0819EB70 ((void*)(GFX_BASE_ADDR + 0x1EB70)) 
#define gUnknown_0819EFE8 ((void*)(GFX_BASE_ADDR + 0x1EFE8)) 

#define gTextPal ((void*)(0x0819F674))
#define gCharSet ((void*)(GFX_BASE_ADDR + 0x1F694))
#define gPalMapMarkers ((void*)(GFX_BASE_ADDR + 0x4B694))
#define gUnknown_0820E31C ((void*)(GFX_BASE_ADDR + 0x8E31C))
#define gUnknown_0820E33C ((void*)(GFX_BASE_ADDR + 0x8E33C))
#define gPalCourtScroll ((void*)(0x0820E74C))
#define gUnknown_0826F888 ((void*)(0x0826F888))
#define gUnknown_0826FE38 ((void*)(0x0826FE38))
#define gUnknown_08252498 ((void*)(0x08252498))
#define gUnknown_0826FE38 ((void*)(0x0826FE38))


#define gGfxHPBarFrame1 ((void*)(0x08190880))
#define gGfxHPBarFrame2 ((void*)(0x08190900))
#define gGfxHPBarFrame3 ((void*)(0x08190A00))
#define gGfxHPBarProgress ((void*)(0x08190A80))

#define gPalWitnessBench ((void*)(0x08197424))
#define gPalCounselBench ((void*)(0x08197444))
#define gPalGuilty ((void*)(0x08197284))
#define gPalNotGuilty ((void*)(0x081972A4))

#define gPalExamineCursors ((u8*)(GFX_BASE_ADDR + 0x17024))

#define gPalHPBarFrame ((void*)(0x08197684))
#define gPalHPBarProgress ((void*)(0x081976A4))

#define gUnknown_081FFD28 ((void*)(GFX_BASE_ADDR + 0x7FD28))
#define gUnknown_081FFD48 ((void*)(GFX_BASE_ADDR + 0x7FD48))

#define gPal_BustupMia ((void*)(GFX_BASE_ADDR + 0x86BF0))
#define gMap_BustupMia ((void*)(GFX_BASE_ADDR + 0x86C10))

#define gGfxSeqAnimation35 ((void*)(0x0826e5b0))
#define gUnknown_08252494 ((void*)(0x08252494))
#define gUnknown_08200308 ((void*)(GFX_BASE_ADDR + 0x80308))
#define gUnknown_08208AA0 ((void*)(GFX_BASE_ADDR + 0x88AA0))
#define gUnknown_08208AC0 ((void*)(GFX_BASE_ADDR + 0x88AC0))
#define gGfxSpeedlinesFirstAndLastColumns ((void*)(GFX_BASE_ADDR + 0x8DB9C))

// script
#define std_scripts ((void*)(0x8270934))

#endif
