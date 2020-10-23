//::///////////////////////////////////////////////
//:: Name: pgs_check_data
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will check and ensure that the
    information the player entered was valid.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetPCSpeaker();
    string sGuildName = GetLocalString (oPlayer, "Temp_Guild_Name");

    //--------------------------------------------
    //No errors have occured yet, begin checks.
    //--------------------------------------------
    SetLocalInt (oPlayer, "Guild_Data_Error", FALSE);

    if ((sGuildName == "") || (GetLocalString (oPlayer, "Temp_Guild_Description") == ""))
    {
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
        SendMessageToPC (oPlayer, "Invalid guild name and/or description was entered.");
    }
    else  /*Check for duplicate guild names.*/
    {
        int iGuild = 1;
        int iMaxGuild = GetModuleMaxGuildNumber();

        for (; iGuild <= iMaxGuild; iGuild++)
            if (GetModuleGuildName (iGuild) == sGuildName)
            {
                SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
                SendMessageToPC (oPlayer, "A guild is already in existence " +
                    "with the name you requested.");
                break;
            }
    }
}
