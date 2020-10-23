//::///////////////////////////////////////////////
//:: Name: inc_gsystem_evnt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include script to handle all module event-
    related functions for the Player Guild System.

    This was created to simplify the installation
    process.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void PGSModuleLoadEvent()
{
    object oMod = GetModule();

    //--------------------------------------------
    //Set PGS version number and date.
    //--------------------------------------------
    SetModulePGSBuildNumber ("3.4a");
    SetModulePGSBuildDate ("3/10/04");

    if (!PGS_ENABLE_PERSISTENT_TIME)  /*Check to load/create persistent time.*/
        return;

    //--------------------------------------------
    //Save variables for future use with the PGS.
    //--------------------------------------------
    SetLocalInt (oMod, "PGS_Current_Day", GetCalendarDay());
    SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Current_Month", GetCalendarMonth(), oMod);

    //--------------------------------------------
    //Load persistent time - create DB if needed.
    //--------------------------------------------
    if (GetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Has_Time_Been_Configured", oMod))
    {
        //--------------------------------------------
        //Set persistent calendar day, and time.
        //--------------------------------------------
        SetCalendar (GetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME,
            "Module_Year", oMod), GetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME,
            "Module_Month", oMod), GetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME,
            "Module_Day", oMod));
        SetTime (GetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME,
            "Module_Hour", oMod), 0, 0, 0);
    }
    else  /*Create a new database for persistent time.*/
    {
        SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Year",
            GetCalendarYear(), oMod);
        SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Month",
            GetCalendarMonth(), oMod);
        SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Day",
            GetCalendarDay(), oMod);
        SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Hour",
            GetTimeHour(), oMod);
        SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME,
            "Has_Time_Been_Configured", TRUE, oMod);
    }
}

void PGSModuleClientEnterEvent()
{
    object oPlayer = GetEnteringObject();
    int iGuild = GetPlayerGuildNumber (oPlayer);

    if (GetIsDM (oPlayer))
    {
        if (!GetIsObjectValid (GetItemPossessedBy (oPlayer, "GuildJournal")))
            CreateItemOnObject ("guildjournal", oPlayer);

        return;
    }

    //------------------------------------------------
    //Check if player is to recieve a "Guild Journal".
    //------------------------------------------------
    if ((PGS_GIVE_GUILD_JOURNAL_ON_ENTER) && (!GetIsObjectValid (GetItemPossessedBy (oPlayer, "GuildJournal"))))
        CreateItemOnObject ("guildjournal", oPlayer);

    //------------------------------------------------
    //Initialize player settings if has not been done.
    //------------------------------------------------
    if (!GetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Initialized", oPlayer))
    {
        //------------------------------------------------
        //Inform player of current PGS status.
        //------------------------------------------------
        SendMessageToPC (oPlayer, "Initializing 'Player Guild System' settings " +
            "for your character.  These can be changed by using the 'Guild " +
            "Journal' on yourself.");

        //------------------------------------------------
        //Initialize player PGS settings...
        //------------------------------------------------
        SetPlayerSettingValue (oPlayer, "Ally_Chat", TRUE);
        SetPlayerSettingValue (oPlayer, "Guild_Chat", TRUE);
        SetPlayerSettingValue (oPlayer, "Invitations", TRUE);
        SetPlayerSettingValue (oPlayer, "List_Filtering", TRUE);
        SetPlayerSettingValue (oPlayer, "Faction_Offers", TRUE);

        //------------------------------------------------
        //Player has been initialized - only done once.
        //------------------------------------------------
        SetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Initialized",
            TRUE, oPlayer);
    }

    if (iGuild != 0)  /*Check if player is in a guild.*/
    {
        if (GetModuleGuildName (iGuild) != GetPlayerGuildName (oPlayer))
        {
            //------------------------------------------------
            //Remove player from guild, and explain why.
            //------------------------------------------------
            RemoveGuildDataFromPlayer (oPlayer);
            SendMessageToPC (oPlayer, "You've been removed from your guild, " +
                "as it no longer exists.");
            return;
        }

        string sMessage = GetModuleGuildTitle (iGuild, 1);
        int iGuildColor = GetModuleGuildColor (iGuild);

        //----------------------------------------------------
        //Check if to display newest message - and if valid.
        //----------------------------------------------------
        if ((PGS_DISPLAY_GUILD_MESSAGE_ON_ENTER) && (sMessage != ""))
            SendMessageToPC (oPlayer, "Newest guild message: " + sMessage);

        //------------------------------------------------
        //Apply guild color effect to the member.
        //------------------------------------------------
        if (iGuildColor != 0)
            ApplyEffectToObject (DURATION_TYPE_PERMANENT, EffectVisualEffect
                (iGuildColor), oPlayer);

        //------------------------------------------------
        //Store player guild info via local variables.
        //  This will minimize the # of DB calls.
        //------------------------------------------------
        SetLocalInt (oPlayer, "Player_Guild_Number", iGuild);
        SetLocalInt (oPlayer, "Player_Guild_Rank", GetPlayerGuildRank (oPlayer));

        SetPlayerGuildFactionToAll (oPlayer);  /*Set player guild factions.*/
    }
}

void PGSModuleHeartbeatEvent()
{
    if (PGS_ENABLE_PERSISTENT_TIME == FALSE)  /*Persistent time enabled?*/
        return;

    object oMod = GetModule();
    int iCurrentDay = GetCalendarDay();

    if (GetLocalInt (oMod, "PGS_Current_Day") == iCurrentDay)
        return;  /*Same day, do nothing.*/

    int iCurrentMonth = GetCalendarMonth();
    SetLocalInt (oMod, "PGS_Current_Day", iCurrentDay);  /*Update variable.*/

    //--------------------------------------------
    //New day - save persistent time variables.
    //--------------------------------------------
    SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Year", GetCalendarYear(), oMod);
    SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Month", iCurrentMonth, oMod);
    SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Day", iCurrentDay, oMod);
    SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Module_Hour", GetTimeHour(), oMod);

    //--------------------------------------------
    //Check if time to apply guild account interest.
    //--------------------------------------------
    if (GetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Current_Month", oMod) == iCurrentMonth)
        return;

    //--------------------------------------------
    //Update month guild interest was applied.
    //--------------------------------------------
    SetCampaignInt (PGS_PERSISTENT_TIME_DATABASE_FILENAME, "Current_Month",
        iCurrentMonth, oMod);

    int iCount = 1;
    int iAccount = 0;
    int iExperience = 0;
    int iMaxGuild = GetModuleMaxGuildNumber();

    //--------------------------------------------
    //Loop through accounts - apply gold.
    //--------------------------------------------
    for (; iCount <= iMaxGuild; iCount++)
        if (GetModuleGuildName (iCount) != "")  /*Check if guild is valid.*/
        {
            iExperience = GetModuleGuildMemberCount (iCount) * PGS_XP_AWARD_PER_GUILD_MEMBER;

            //--------------------------------------------
            //Add territory, and interest bonus to account.
            //--------------------------------------------
            iAccount = GetModuleGuildAccountValue (iCount);
            iAccount = FloatToInt (iAccount * PGS_FLOAT_INTEREST_RATE);
            iAccount = iAccount + (GetGuildTerritoryCount (iCount) * PGS_TERRITORY_GOLD_VALUE);

            //--------------------------------------------
            //Save updated guild information.
            //--------------------------------------------
            SetModuleGuildAccountValue (iCount, iAccount);

            if (PGS_XP_AWARD_ROLLOVER)  /*Check if XP rolls over.*/
                SetModuleGuildAwardableXP (iCount, GetModuleGuildAwardableXP
                    (iCount) + iExperience);
            else
                SetModuleGuildAwardableXP (iCount, iExperience);
        }
}
