//::///////////////////////////////////////////////
//:: Check Intelligence Normal and PC or Animal
//:: Companion is not in combat
//:: NW_D2_INTN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has normal intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oCompanion = OBJECT_SELF;
    int nPCInCombat = GetIsInCombat(oPC);
    int nACInCombat = GetIsInCombat(oCompanion);
    int nIsNormInt = CheckIntelligenceNormal();

    if (nPCInCombat || nACInCombat || !nIsNormInt)
        return FALSE;

    return TRUE;
}
