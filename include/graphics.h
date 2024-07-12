#ifndef GUARD_GRAPHICS_H
#define GUARD_GRAPHICS_H

#ifndef ROM_START
#define ROM_START 0x08000000 // why is this not already a fucking define 
#endif

#define GFX_BASE_ADDR (ROM_START + 0x130000)

#define gGfxSaveGameTiles ((void*)(0x08180820))
#define gGfxSaveYesNo ((void*)(0x081987e4))
#define gPalChoiceSelected ((void*)(0x081977a4))
#define gTextPal ((void*)(0x0819F674))
#define gPalEvidenceProfileDesc ((void*)(0x08180800))
#define gUnknown_0826F888 ((void*)(0x0826F888))
#define gUnknown_08252498 ((void*)(0x08252498))

#endif
