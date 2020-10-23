//::///////////////////////////////////////////////
//:: Name: pgs_disp_lguild
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Display the guild information for the selected
    guild in the list.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iListGuild = GetLocalInt (oPlayer, "Temp_Guild_List_Number");

    //--------------------------------------------
    //Display the specified guild information.
    //--------------------------------------------
    DisplayGuildInformation (iListGuild);

    //--------------------------------------------
    //Check if list guild is same as players.
    //--------------------------------------------
    if (GetLocalInt (oPlayer, "Player_Guild_Number") == iListGuild)
        SetLocalInt (oPlayer, "Same_Guild", TRUE);
    else
        SetLocalInt (oPlayer, "Same_Guild", FALSE);

    return TRUE;  /*Conditional.*/
}
