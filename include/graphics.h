#ifndef GUARD_GRAPHICS_H
#define GUARD_GRAPHICS_H

#ifndef ROM_START
#define ROM_START 0x08000000 // why is this not already a fucking define 
#endif

#define GFX_BASE_ADDR (ROM_START + 0x180000)

#define gPalEvidenceProfileDesc ((void*)(0x08180800))
#define gGfxSaveGameTiles ((void*)(0x08180820))
#define gGfx4bppInvestigationActions ((void*)(GFX_BASE_ADDR + 0x8B80))
#define gGfx4bppInvestigationScrollButton ((void*)(GFX_BASE_ADDR + 0x9D80))
#define gGfxPressPresentButtons ((void*)(GFX_BASE_ADDR + 0xA780))
#define gGfxExamineCursor ((void*)(GFX_BASE_ADDR + 0xB180))
#define gGfxNewGameContinue ((void*)(GFX_BASE_ADDR + 0xE360))
#define gGfxInvestigationStopButton ((void*)(GFX_BASE_ADDR + 0x10480))
#define gGfxPsycheLockChainsTiles ((void*)(GFX_BASE_ADDR + 0x10C00))
#define gPalPressPresentButtons ((void*)(GFX_BASE_ADDR + 0x17004))
#define gPalNewGameContinue ((void*)(GFX_BASE_ADDR + 0x172C4))
#define gGfxSaveYesNo ((void*)(0x081987e4))
#define gPalChoiceSelected ((void*)(0x081977a4))
#define gTextPal ((void*)(0x0819F674))
#define gCharSet ((void*)(GFX_BASE_ADDR + 0x1F694))
#define gUnknown_0820E31C ((void*)(GFX_BASE_ADDR + 0x8E31C))
#define gUnknown_0820E33C ((void*)(GFX_BASE_ADDR + 0x8E33C))
#define gPalCourtScroll ((void*)(0x0820E74C))
#define gUnknown_0826F888 ((void*)(0x0826F888))
#define gUnknown_08252498 ((void*)(0x08252498))


#define gGfxHPBarFrame1 ((void*)(0x08190880))
#define gGfxHPBarFrame2 ((void*)(0x08190900))
#define gGfxHPBarFrame3 ((void*)(0x08190A00))
#define gGfxHPBarProgress ((void*)(0x08190A80))
#define gPalHPBarFrame ((void*)(0x08197684))
#define gPalHPBarProgress ((void*)(0x081976A4))


// script
#define std_scripts ((void*)(0x8270934))

#endif
