//::///////////////////////////////////////////////
//:: Name: pgs_disp_member
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will display 8 guild members to
    the player, along with their guild rank name.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

int StartingConditional()
{
    object oLoop = GetFirstPC();
    object oPlayer = GetPCSpeaker();
    int iCount = 0;
    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iPosition = GetLocalInt (oPlayer, "List_Position");

    SetLocalInt (oPlayer, "Next_Set_Is_Available", FALSE);
    SetLocalInt (oPlayer, "Token_Position", 1);

    //--------------------------------------------
    //Locate current player for member position.
    //--------------------------------------------
    while (iCount != iPosition)
    {
        if (!GetIsObjectValid (oLoop))
            break;
        else
        {
            if (GetLocalInt (oLoop, "Player_Guild_Number") == iGuild)  /*Valid guild member?*/
                iCount++;

            if (iCount != iPosition)  /*Check object position.*/
                oLoop = GetNextPC();
        }
    }

    iCount = 1;  /*Reset the counter.*/
    //--------------------------------------------
    //First valid member found - begin member list.
    //--------------------------------------------
    while (iCount != 10)
    {
        if (!GetIsObjectValid (oLoop))
        {
            SetLocalString (oPlayer, "Temp_List_Member" + IntToString (iCount), "");
            iCount++;
        }
        else if (GetLocalInt (oLoop, "Player_Guild_Number") == iGuild)
        {
            SetLocalString (oPlayer, "Temp_List_Member" + IntToString (iCount),
                GetName (oLoop) + "  [" + GetModuleGuildRankName (iGuild,
                GetLocalInt (oLoop, "Player_Guild_Rank")) + "]");

            iCount++;
            iPosition++;
        }

        oLoop = GetNextPC();
    }

    SetLocalInt (oPlayer, "Next_List_Position", iPosition - 1);

    //--------------------------------------------
    //Check if the next member set is available.
    //--------------------------------------------
    if (GetIsObjectValid (oLoop))
        SetLocalInt (oPlayer, "Next_Set_Is_Available", TRUE);

    return TRUE;
}
