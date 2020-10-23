//::///////////////////////////////////////////////
//:: Name: pgs_create_guild
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will create a new guild using the
    data entered by the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"
#include "inc_gsystem_cnfg"

void main()
{
    object oPlayer = GetPCSpeaker();
    string sGuildName = GetLocalString (oPlayer, "Temp_Guild_Name");
    int iGuild = 1;

    //--------------------------------------------
    //Enter a loop to find the first available
    //spot to store the guild data.
    //--------------------------------------------
    while (GetModuleGuildName (iGuild) != "")
        iGuild++;

    //--------------------------------------------
    //Update max guild number - if necessary.
    //--------------------------------------------
    if (iGuild > GetModuleMaxGuildNumber())
        SetModuleMaxGuildNumber (iGuild);

    //--------------------------------------------
    //Set module guild variables.
    //--------------------------------------------
    SetModuleGuildMemberCount (iGuild, 1);  /*Leader is first member.*/
    SetModuleGuildPrivacyStatus (iGuild, GetLocalString (oPlayer, "Temp_Guild_Privacy"));
    SetModuleGuildName (iGuild, sGuildName);
    SetModuleGuildDescription (iGuild, GetLocalString (oPlayer, "Temp_Guild_Description"));
    SetModuleGuildLeader (iGuild, GetName (oPlayer));
    SetModuleGuildRankName (iGuild, 4, PGS_STRING_GUILD_RANK4);
    SetModuleGuildRankName (iGuild, 3, PGS_STRING_GUILD_RANK3);
    SetModuleGuildRankName (iGuild, 2, PGS_STRING_GUILD_RANK2);
    SetModuleGuildRankName (iGuild, 1, PGS_STRING_GUILD_RANK1);

    //--------------------------------------------
    //Set player guild variables.
    //--------------------------------------------
    SetPlayerGuildNumber (oPlayer, iGuild);
    SetPlayerGuildName (oPlayer, sGuildName);
    SetPlayerGuildRank (oPlayer, 4);

    SetLocalInt (oPlayer, "Player_Guild_Number", iGuild);
    SetLocalInt (oPlayer, "Player_Guild_Rank", 4);

    //--------------------------------------------
    //Update PGS module information.
    //--------------------------------------------
    SetModuleRecentPGSActivity ("New guild: " + GetModuleGuildName (iGuild));
    SetModuleGuildCount (GetModuleGuildCount() + 1);

    DeleteLocalInt (oPlayer, "Guild_Creation_Access");
}
