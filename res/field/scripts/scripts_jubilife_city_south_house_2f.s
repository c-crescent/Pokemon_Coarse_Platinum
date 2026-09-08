#include "macros/scrcmd.inc"
#include "res/text/bank/jubilife_city_south_house_2f.h"


    ScriptEntry JubilifeCitySouthHouse2F_Youngster
    ScriptEntry JubilifeCitySouthHouse2F_PokefanF
    ScriptEntry JubilifeCitySouthHouse2F_PokemonBreederF
    ScriptEntryEnd

JubilifeCitySouthHouse2F_Youngster:
    NPCMessage JubilifeCitySouthHouse2F_EvolveWhenStrongerFromBattling
    End

JubilifeCitySouthHouse2F_PokefanF:
    NPCMessage JubilifeCitySouthHouse2F_EvolutionMakesMoreFascinating
    End

JubilifeCitySouthHouse2F_PokemonBreederF:
    PlaySE SE_CONFIRM_sseq_3
    LockAll
    FacePlayer
    Message JubilifeCitySouthHouse2F_Breeder_TutorWhichPokemon
    CloseMessage
    FadeScreenOut
    WaitFadeScreen
    SelectMoveTutorPokemon
    GetSelectedPartySlot VAR_0x8005
    ReturnToField
    FadeScreenIn
    WaitFadeScreen
    GoToIfEq VAR_0x8005, PARTY_SLOT_NONE, JubilifeCitySouthHouse2F_Breeder_ComeBack
    GetPartyMonSpecies VAR_0x8005, VAR_RESULT
    GoToIfEq VAR_RESULT, 0, JubilifeCitySouthHouse2F_Breeder_EggsCantLearnMoves
    CheckHasLearnableReminderMoves VAR_RESULT, VAR_0x8005
    GoToIfEq VAR_RESULT, FALSE, JubilifeCitySouthHouse2F_Breeder_NoMovesToTeach
    Message JubilifeCitySouthHouse2F_Breeder_TeachWhichMove
    CloseMessage
    FadeScreenOut
    WaitFadeScreen
    OpenMoveReminderMenu VAR_0x8005
    CheckLearnedReminderMove VAR_RESULT
    ReturnToField
    FadeScreenIn
    WaitFadeScreen
    GoToIfEq VAR_RESULT, 0xFF, JubilifeCitySouthHouse2F_Breeder_ComeBack
    ReleaseAll
    End

JubilifeCitySouthHouse2F_Breeder_ComeBack:
    Message JubilifeCitySouthHouse2F_Breeder_ComeBack
    WaitButton
    CloseMessage
    ReleaseAll
    End