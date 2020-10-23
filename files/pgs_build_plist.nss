//::///////////////////////////////////////////////
//:: Name: pgs_build_plist
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Build the player list for the current PC.
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
    int iGuild;
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
            if (GetLocalInt (oLoop, "Player_Guild_Number") != 0)  /*Valid guild member?*/
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
        iGuild = GetLocalInt (oLoop, "Player_Guild_Number");

        if (!GetIsObjectValid (oLoop))
        {
            SetLocalString (oPlayer, "Temp_List_Member" + IntToString (iCount), "");
            iCount++;
        }
        else if (iGuild != 0)
        {
            SetLocalString (oPlayer, "Temp_List_Member" + IntToString (iCount),
                GetName (oLoop) + "  [" + GetModuleGuildName (iGuild) + "]");

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
