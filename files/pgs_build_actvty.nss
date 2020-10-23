//::///////////////////////////////////////////////
//:: Name: pgs_build_actvty
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will build a list of all the
    recent events that have occured between guilds.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iCount = 1;

    SetLocalInt (oPlayer, "List_Built", 4);  /*List being built.*/

    //--------------------------------------------
    //Build recent guild activity list for DMs.
    //--------------------------------------------
    for (; iCount <= 8; iCount++)
    {
        if (GetModuleRecentPGSActivity (iCount) != "")
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount),
                iCount);
        else
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);
    }

    return TRUE;  /*Conditional.*/
}
