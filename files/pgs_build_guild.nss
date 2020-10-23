//::///////////////////////////////////////////////
//:: Name: pgs_build_guild
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will list the next 8 guilds based
    on the current list position.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void SaveCurrentListGuild (object oPlayer, int iCount, int iPosition)
{
    if (iCount == 9)  /*If 9th valid guild, save position.*/
        SetLocalInt (oPlayer, "Next_Set_Is_Available", TRUE);

    else  /*Save guild to display in list.*/
        SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount),
            iPosition);
}

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iPosition = GetLocalInt (oPlayer, "List_Position");
    int iCount = 1;
    int iDMList = GetIsDM (oPlayer);
    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iGuildFilter = GetPlayerSettingValue (oPlayer, "List_Filtering");
    int iMaxGuild = GetModuleMaxGuildNumber();
    int iFaction;

    if (iDMList)
        iFaction = 2;
    else
        iFaction = GetLocalInt (oPlayer, "List_Guild_Faction");


    //--------------------------------------------
    //Set some variables for future use.
    //--------------------------------------------
    SetLocalInt (oPlayer, "Next_Set_Is_Available", FALSE);
    SetLocalInt (oPlayer, "Previous_Set_Is_Available", FALSE);
    SetLocalInt (oPlayer, "Token_Position", 1);
    SetLocalInt (oPlayer, "List_Built", 1);  /*Guild list is being built.*/

    //--------------------------------------------
    //Display player's current filtering option.
    //--------------------------------------------
    if (GetPlayerSettingValue (oPlayer, "List_Filtering"))
        SetCustomToken (3028, "Enabled");
    else
        SetCustomToken (3028, "Disabled");

    //--------------------------------------------
    //Set text based on list to build for the PC.
    //--------------------------------------------
    if (GetIsDM (oPlayer))
        SetCustomToken (3040, "Click on a guild to edit/remove information:");
    else
        SetCustomToken (3040, "Click on a guild to view additional information:");

    //--------------------------------------------
    //Loop through guild list, and display first
    //eight (8) available guilds.
    //
    //Note: Loop will run a 9th time, which will
    //check for additional guilds (Next set).
    //--------------------------------------------
    while (iCount != 10)
    {
        //--------------------------------------------
        //Check for a valid guild at current position.
        //--------------------------------------------
        if (iPosition > iMaxGuild)
        {
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);
            iCount++;
        }
        else if (GetModuleGuildName (iPosition) != "")
        {
            if (iDMList)  /*Display all guilds for the DM.*/
            {
                SaveCurrentListGuild (oPlayer, iCount, iPosition);
                iCount++;
            }
            else if (GetModuleGuildPrivacyStatus (iPosition) == "public")
                if ((iFaction == 2) || (GetFactionStatusBetweenGuilds (iGuild, iPosition) == iFaction))
                    if (iGuildFilter)  /*Check for enabled guild filtering.*/
                    {
                        if (GetModuleGuildMemberCount (iPosition) > PGS_GUILD_LIST_FILTERING_AMOUNT)
                        {
                            SaveCurrentListGuild (oPlayer, iCount, iPosition);
                            iCount++;
                        }
                    }
                    else
                    {
                        SaveCurrentListGuild (oPlayer, iCount, iPosition);
                        iCount++;
                    }
        }
        else
            SetLocalInt (oPlayer, "Temp_List_Position" + IntToString (iCount), 0);

        iPosition++;  /*Increment guild position.*/
    }

    //--------------------------------------------
    //Save current position for "Next set" action.
    //--------------------------------------------
    iPosition--;
    SetLocalInt (oPlayer, "Next_List_Position", iPosition);
    iCount = 1;

    //--------------------------------------------
    //Loop in reverse to find and store the
    //position for the "Previous" function.
    //--------------------------------------------
    while (iCount != 17)
    {
        if (iPosition < 1)  /*Check if list has returned to the beginning.*/
            iCount++;

        else if (GetModuleGuildName (iPosition) != "")  /*Valid guild here.*/
            if (iDMList)  /*Check for a DM list.*/
                iCount++;

            else if (GetModuleGuildPrivacyStatus (iPosition) == "public")
                if ((iFaction == 2) || (GetFactionStatusBetweenGuilds (iGuild, iPosition) == iFaction))
                    if (iGuildFilter)  /*Check for enabled guild filtering.*/
                    {
                        if (GetModuleGuildMemberCount (iPosition) > PGS_GUILD_LIST_FILTERING_AMOUNT)
                            iCount++;
                    }
                    else
                        iCount++;

        iPosition--;  /*Decrement.*/
    }

    SetLocalInt (oPlayer, "Previous_List_Position", iPosition);  /*Update var.*/

    //--------------------------------------------
    //Check if the "Previous" function is available.
    //--------------------------------------------
    if (iPosition > 0)
        SetLocalInt (oPlayer, "Previous_Set_Is_Available", TRUE);




    return TRUE;  /*Conditional.*/
}
