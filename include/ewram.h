#ifndef GUARD_EWRAM_H
#define GUARD_EWRAM_H


extern u8 eUnknown_02002BBC;
extern u8 eUnknown_02002BBD;
extern u8 eUnknown_02002BBE;
extern u8 eUnknown_02002BBF;
extern u8 eUnknown_02002BC0;
extern u8 eUnknown_02002BC1;

#define eGeneralScratchpadBuffer ((void *)EWRAM_START+0xAFC0)
#define eScriptHeap ((void*) (EWRAM_START + 0x11FC0))
#define eBGDecompBuffer ((void*) (EWRAM_START + 0x2CFC0))
#define eBGDecompBuffer2 ((void*) (EWRAM_START + 0x36500))
#define eSpeedlineDecompBuffer ((void*) (EWRAM_START + 0x3B000))
#define eVRAMScratchpadBuffer ((void*) (EWRAM_START + 0x3B500))

#endif//GUARD_EWRAM_H