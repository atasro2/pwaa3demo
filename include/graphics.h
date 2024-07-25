#ifndef GUARD_GRAPHICS_H
#define GUARD_GRAPHICS_H

#ifndef ROM_START
#define ROM_START 0x08000000 // why is this not already a fucking define 
#endif

#define GFX_BASE_ADDR (ROM_START + 0x180000)

#define gGfxSaveGameTiles ((void*)(0x08180820))
#define gGfx4bppInvestigationActions ((void*)(GFX_BASE_ADDR + 0x8B80))
#define gGfx4bppInvestigationScrollButton ((void*)(GFX_BASE_ADDR + 0x9D80))
#define gGfxPressPresentButtons ((void*)(GFX_BASE_ADDR + 0xA780))
#define gGfxExamineCursor ((void*)(GFX_BASE_ADDR + 0xB180))
#define gGfxSaveYesNo ((void*)(0x081987e4))
#define gPalChoiceSelected ((void*)(0x081977a4))
#define gTextPal ((void*)(0x0819F674))
#define gCharSet ((void*)(GFX_BASE_ADDR + 0x1F694))
#define gPalEvidenceProfileDesc ((void*)(0x08180800))
#define gUnknown_0826F888 ((void*)(0x0826F888))
#define gUnknown_08252498 ((void*)(0x08252498))

#endif
