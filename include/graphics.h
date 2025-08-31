#ifndef GUARD_GRAPHICS_H
#define GUARD_GRAPHICS_H

#ifndef ROM_START
#define ROM_START 0x08000000 // why is this not already a fucking define 
#endif

#define GFX_BASE_ADDR (ROM_START + 0x180000)

#define gPalEvidenceProfileDesc ((void*)(0x08180800))
#define gGfxSaveGameTiles ((void*)(0x08180820))
#define gGfx4bppTestimonyArrows ((void*)(GFX_BASE_ADDR + 0x6880))
#define gGfx4bppInvestigationActions ((void*)(GFX_BASE_ADDR + 0x8B80))
#define gGfx4bppInvestigationScrollButton ((void*)(GFX_BASE_ADDR + 0x9D80))
#define gGfxPressPresentButtons ((void*)(GFX_BASE_ADDR + 0xA780))
#define gGfxExamineCursor ((void*)(GFX_BASE_ADDR + 0xB180))

#define gGfxNotGuilty1 ((void*)(GFX_BASE_ADDR + 0xBB60))
#define gGfxGuilty1 ((void*)(GFX_BASE_ADDR + 0xC360))
#define gGfxGuiltyNotGuilty2 ((void*)(GFX_BASE_ADDR + 0xCB60))

#define gGfxNewGameContinue ((void*)(GFX_BASE_ADDR + 0xE360))
#define gGfxInvestigationStopButton ((void*)(GFX_BASE_ADDR + 0x10480))
#define gGfxPsycheLockChainsTiles ((void*)(GFX_BASE_ADDR + 0x10C00))
#define gPalPressPresentButtons ((void*)(GFX_BASE_ADDR + 0x17004))
#define gPalNewGameContinue ((void*)(GFX_BASE_ADDR + 0x172C4))
#define gGfxSaveYesNo ((void*)(0x081987e4))
#define gPalChoiceSelected ((void*)(0x081977a4))
#define gTextPal ((void*)(0x0819F674))
#define gCharSet ((void*)(GFX_BASE_ADDR + 0x1F694))
#define gPalMapMarkers ((void*)(GFX_BASE_ADDR + 0x4B694))
#define gUnknown_0820E31C ((void*)(GFX_BASE_ADDR + 0x8E31C))
#define gUnknown_0820E33C ((void*)(GFX_BASE_ADDR + 0x8E33C))
#define gPalCourtScroll ((void*)(0x0820E74C))
#define gUnknown_0826F888 ((void*)(0x0826F888))
#define gUnknown_08252498 ((void*)(0x08252498))
#define gUnknown_0826FE38 ((void*)(0x0826FE38))


#define gGfxHPBarFrame1 ((void*)(0x08190880))
#define gGfxHPBarFrame2 ((void*)(0x08190900))
#define gGfxHPBarFrame3 ((void*)(0x08190A00))
#define gGfxHPBarProgress ((void*)(0x08190A80))

#define gPalGuilty ((void*)(0x08197284))
#define gPalNotGuilty ((void*)(0x081972A4))

#define gPalExamineCursors ((u8*)(GFX_BASE_ADDR + 0x17024))

#define gPalHPBarFrame ((void*)(0x08197684))
#define gPalHPBarProgress ((void*)(0x081976A4))

#define gPal_BustupMia ((void*)(GFX_BASE_ADDR + 0x86BF0))
#define gMap_BustupMia ((void*)(GFX_BASE_ADDR + 0x86C10))

// script
#define std_scripts ((void*)(0x8270934))

#endif
