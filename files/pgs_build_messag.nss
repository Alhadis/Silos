//::///////////////////////////////////////////////
//:: Name: pgs_build_messag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Build the guild-specific message list.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iCount = 1;

    SetLocalInt (oPlayer, "Token_Position", 1);
    SetLocalInt (oPlayer, "List_Built", 2);  /*List being built.*/

    //--------------------------------------------
    //Loop through and save valid guild messages.
    //--------------------------------------------
    for (; iCount <= 8; iCount++)
    {
        if (GetModuleGuildTitle (iGuild, iCount) != "")
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount),
                iCount);
        else
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);
    }

    return TRUE;  /*Conditional.*/
}
