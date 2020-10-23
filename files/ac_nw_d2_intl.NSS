//::///////////////////////////////////////////////
//:: Check Intelligence Low and PC or Animal
//:: Companion is not in combat
//:: NW_D2_INTL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a low intelligence
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
    int nIsLowInt = CheckIntelligenceLow();

    if (nPCInCombat || nACInCombat || !nIsLowInt)
        return FALSE;

    return TRUE;
}
