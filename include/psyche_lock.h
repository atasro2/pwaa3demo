#ifndef GUARD_PSYCHE_LOCK_H
#define GUARD_PSYCHE_LOCK_H

struct PsycheLockData
{
    u32 enabled; // unity: status
    u16 roomId; // unity: room
    u16 personId; // unity: pl_id 
    u8 numLocksRemaining; // unity: level
    u8 numLocksTotal; // unity: size
    u16 startScriptSection; // unity: start_message
    u16 cancelScriptSection; // unity: cancel_message
    u16 validEvidencePresentedSection; // unity: correct_message
    u16 invalidEvidencePresentedSection; // unity: wrong_message
    u16 noHPLeftScriptSection; // unity: die_message
    u16 bgmToPlayAfterStop; // unity: cancel_bgm
    u16 bgmToPlayAfterUnlock; // unity: unlock_bgm
    u32 numValidEvidence; // unity: item_size
    u8 validEvidenceIds[4]; // unity: item_no
    u16 validEvidenceScriptSections[4]; //  unity: item_correct_message
};

struct PsycheLockChainsTilemapHeader {
    u8 fill0[0x4];
    u16 numBlocks;   
    u16 numFrames;
};

struct PsycheLockChainsFrameDescription {
    u16 blockId;
    u8 fill02[0x6];
};

struct PsycheLock_Block {
    s8 tileXstart;
    s8 tileYstart;
    u8 mapXstart;
    u8 mapYstart;
    u8 fill04[0x2];
    u16 sizeTypeFlag;
    union {
        struct {
            u8 fill08[0x8];
        } square;
        struct {
            u16 width;
            u16 height;
            u8 fillC[0x8];
        } rect;
    } blockData;
};

struct PsycheLockChains {
    s16 targetBGMapBuffer;
    s16 setButNeverUsed; // set in InitPsycheLockChain, never used after
    s16 currentChainFrame;
    s16 loadCounter; // only ever used in LoadNextPsycheLockChainFrame
    struct PsycheLockChainsTilemapHeader * mapHeader;
    struct PsycheLockChainsFrameDescription * frames[48];
    void * chainBlocks[48]; // Pointer to u32 followed by struct PsycheLock_Block
};

struct PsycheLock {
    s16 numLocksTotal;
    s16 numLocksRemaining;
    s16 state;
    s16 subState;
    s16 unk8; // unused?
    s16 animationCounter;
    s16 animationIntroCounter;
    s16 unkE; // padding?
    struct PsycheLockChains chains[2];
    struct AnimationListEntry * lockAnims[5];
};

extern struct PsycheLock gPsycheLock;

void SetPsycheLockAnimationStateUnlock(void);
void SetPsycheLockAnimationStateRemoveChains(void);
void SetPsycheLockAnimationStateDisplayUnlockMessage(void);
void SetPsycheLockAnimationStateClearLocksAndChains(void);
void SetPsycheLockAnimationStateReturnToNormalBackground(void);
void SetPsycheLockAnimationStateRedrawRemainingLocks(void);
bool32 IsPsycheLockAnimationInWaitState(void);
void UpdatePsycheLockAnimation(void);
void ShowPsycheLockLocksAndChainsWithoutAnimating(u32);
void ClearPsycheLockLocksAndChainsWithoutAnimating(void);
s32 GetPsycheLockDataIndexByRoomAndPerson(u16 arg0, u16 arg1);
s32 IsPresentedEvidenceValidForPsycheLock(struct PsycheLockData * data, u16 arg1);
void ResetPsycheLockStopPresentButtonsState(void);
void SetPsycheLockStopPresentButtonsState(u32);
void AnimatePsycheLockStopBresentButtons(void);
void SetPsycheLockPresentButtonOAMInCourtRecord(void);
void ClearPsycheLockStopPresentButtonsOAM(void);
bool32 IsPsycheLockStopPresentButtonsAnimating(void);

void sub_8015C18(void);
void SetPsycheLockState(u32, u32);
void UpdatePsycheLockAnimation(void);

#define PSYLOCK_ENABLE_PRESENT 0x1
#define PSYLOCK_ENABLE_STOP 0x2

#endif//GUARD_PSYCHE_LOCK_H
