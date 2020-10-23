//::///////////////////////////////////////////////
//:: Name: pgs_flag_init
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Initial script run for the PGS Territory Flag
    conversation.  Determine if the selected
    territory is currently claimed or not.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem_terr"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iTerritory;

    //--------------------------------------------
    //Determine territory number based on object.
    //--------------------------------------------
    if (GetLocalInt (oPlayer, "Territory_Marker_Used"))
        iTerritory = GetPGSMarkerTerritory (OBJECT_SELF);
    else
        iTerritory = GetPGSFlagTerritory (OBJECT_SELF);

    if (GetTerritoryGuildNumber (iTerritory) > 0)
        SetCustomToken (4001, "claimed");
    else
        SetCustomToken (4001, "unclaimed");

    //--------------------------------------------
    //Save territory number for future use.
    //--------------------------------------------
    SetLocalInt (GetPCSpeaker(), "Territory_Number", iTerritory);

    return TRUE;  /*Conditional.*/
}
