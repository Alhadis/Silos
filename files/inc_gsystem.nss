//::///////////////////////////////////////////////
//:: Name: inc_gsystem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include script to handle all PGS-related
    functions.

    NOTE: Do not modify this script in any way!
        The only customizeable script is:
        "inc_gsystem_cnfg".
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem_terr"
#include "inc_gsystem_cnfg"
#include "nw_i0_spells"

//****************************** PGS PLAYER INFO *****************************\\
//------------------------------------------------
//GET & SET functions for player guild number.
//------------------------------------------------
int GetPlayerGuildNumber (object oPlayer);
void SetPlayerGuildNumber (object oPlayer, int iNumber);

//------------------------------------------------
//GET & SET functions for player guild name.
//------------------------------------------------
string GetPlayerGuildName (object oPlayer);
void SetPlayerGuildName (object oPlayer, string sName);

//------------------------------------------------
//GET & SET functions for player guild rank.
//------------------------------------------------
int GetPlayerGuildRank (object oPlayer);
void SetPlayerGuildRank (object oPlayer, int iRank);

//------------------------------------------------
//GET & SET functions for player settings.
//------------------------------------------------
int GetPlayerSettingValue (object oPlayer, string sSetting);
void SetPlayerSettingValue (object oPlayer, string sSetting, int iValue);


//************************** PGS MODULE INFORMATION **************************\\
//------------------------------------------------
//GET & SET functions for module guild member count.
//------------------------------------------------
int GetModuleGuildMemberCount (int iGuild);
void SetModuleGuildMemberCount (int iGuild, int iCount);

//------------------------------------------------
//GET & SET functions for module guild privacy status.
//------------------------------------------------
string GetModuleGuildPrivacyStatus (int iGuild);
void SetModuleGuildPrivacyStatus (int iGuild, string sStatus);

//------------------------------------------------
//GET & SET functions for module guild account value.
//------------------------------------------------
int GetModuleGuildAccountValue (int iGuild);
void SetModuleGuildAccountValue (int iGuild, int iValue);

//------------------------------------------------
//GET & SET functions for module guild name.
//------------------------------------------------
string GetModuleGuildName (int iGuild);
void SetModuleGuildName (int iGuild, string sName);

//------------------------------------------------
//GET & SET functions for module guild description.
//------------------------------------------------
string GetModuleGuildDescription (int iGuild);
void SetModuleGuildDescription (int iGuild, string sDescription);

//------------------------------------------------
//GET & SET functions for module guild leader name.
//------------------------------------------------
string GetModuleGuildLeader (int iGuild);
void SetModuleGuildLeader (int iGuild, string sLeader);

//------------------------------------------------
//GET & SET functions for guild-specific messages.
//------------------------------------------------
string GetModuleGuildTitle (int iGuild, int iPosition);
void SetModuleGuildTitle (int iGuild, int iPosition, string sTitle);
string GetModuleGuildPost (int iGuild, int iPosition);
void SetModuleGuildPost (int iGuild, int iPosition, string sPost);
string GetModuleGuildAuthor (int iGuild, int iPosition);
void SetModuleGuildAuthor (int iGuild, int iPosition, string sName);
string GetModuleGuildReplyTitle (int iGuild, int iPosition, int iReply);
void SetModuleGuildReplyTitle (int iGuild, int iPosition, int iReply, string sTitle);
string GetModuleGuildReplyPost (int iGuild, int iPosition, int iReply);
void SetModuleGuildReplyPost (int iGuild, int iPosition, int iReply, string sPost);
string GetModuleGuildReplyAuthor (int iGuild, int iPosition, int iReply);
void SetModuleGuildReplyAuthor (int iGuild, int iPosition, int iReply, string sAuthor);

//------------------------------------------------
//GET & SET functions for current guild count.
//------------------------------------------------
int GetModuleGuildCount();
void SetModuleGuildCount (int iGuildCount);

//------------------------------------------------
//GET & SET functions for recent guild activity.
//------------------------------------------------
string GetModuleRecentPGSActivity (int iPosition);
void SetModuleRecentPGSActivity (string sEvent);

//------------------------------------------------
//GET & SET functions for individual guild rank names.
//------------------------------------------------
string GetModuleGuildRankName (int iGuild, int iRank);
void SetModuleGuildRankName (int iGuild, int iRank, string sRank);
string GetModuleRankOptions (int iRank);
void ChangeTargetPlayerRank (object oPlayer, object oTarget, int iNewRank);

//------------------------------------------------
//GET & SET functions for awardable experience.
//------------------------------------------------
int GetModuleGuildAwardableXP (int iGuild);
void SetModuleGuildAwardableXP (int iGuild, int iXP);

//------------------------------------------------
//GET & SET functions for guild joining fees.
//------------------------------------------------
int GetModuleGuildJoiningFee (int iGuild);
void SetModuleGuildJoiningFee (int iGuild, int iAmount);

//------------------------------------------------
//GET & SET functions for guild effect colors.
//------------------------------------------------
int GetModuleGuildColor (int iGuild);
void SetModuleGuildColor (int iGuild, int iColor);


//**************************** PGS MAIN FUNCTIONS ****************************\\
//------------------------------------------------
//GET & SET functions for PGS build number.
//------------------------------------------------
string GetModulePGSBuildNumber();
void SetModulePGSBuildNumber (string sBuild);

//------------------------------------------------
//GET & SET functions for PGS build date.
//------------------------------------------------
string GetModulePGSBuildDate();
void SetModulePGSBuildDate (string sDate);

//------------------------------------------------
//Guild information display functions.
//------------------------------------------------
void DisplayGuildInformation (int iGuild);
void DisplayCurrentGuildMessage (int iGuild, int iMessage);
void DisplayCurrentGuildMessageReply (int iGuild, int iMessage, int iReply);

//------------------------------------------------
//Guild string functions for sending messages.
//------------------------------------------------
void SendPGSGuildNotice (int iGuild, string sNotice);
void SendPGSGuildMessage (int iGuild, object oSender, string sMessage);

//------------------------------------------------
//PGS data deletions functions.
//------------------------------------------------
void RemoveGuildDataFromPlayer (object oPlayer);
void PermanentlyRemoveGuild (int iGuild);

//------------------------------------------------
//GET & SET functions for max guild number.
//------------------------------------------------
int GetModuleMaxGuildNumber();
void SetModuleMaxGuildNumber (int iMaxGuild);

//------------------------------------------------
//GET & SET functions for guild factions.
//------------------------------------------------
int GetFactionStatusBetweenGuilds (int iGuild1, int iGuild2);
void SetFactionStatusBetweenGuilds (int iGuild1, int iGuild2, int iFaction);

//------------------------------------------------
//Player faction-related functions.
//------------------------------------------------
void SetPlayerGuildFactionToAll (object oPlayer);
void ComputeGuildPlayerFactions (int iGuild);

//------------------------------------------------
//Get guild leader object based on name.
//------------------------------------------------
object GetPlayerObjectGuildLeader (int iGuild);

//------------------------------------------------
//Change faction functions for guilds.
//------------------------------------------------
void SetGuildFactionToEnemy (int iGuild1, int iGuild2);
void SetGuildFactionToNeutral (int iGuild1, int iGuild2);
void SetGuildFactionToAlly (object oPlayer, object oLeader);

//------------------------------------------------
//DelayCommand function work-around for hostility.
//------------------------------------------------
void SetDelayedHostilityFaction (int iGuild1, int iGuild2);

//------------------------------------------------
//Guild awardable experience (XP) function(s).
//------------------------------------------------
void AwardTargetPlayerWithGuildXP (object oPlayer, object oTarget, int iXP);


//  //********************************************************************\\  \\
//  ||************************ BEGIN PGS FUNCTIONS ***********************||  \\
//  \\********************************************************************//  \\
int GetPlayerGuildNumber (object oPlayer)
{
    return GetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Guild_Number",
        oPlayer);
}
void SetPlayerGuildNumber (object oPlayer, int iNumber)
{
    SetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Guild_Number",
        iNumber, oPlayer);
}

string GetPlayerGuildName (object oPlayer)
{
    return GetCampaignString (PGS_PLAYER_DATABASE_FILENAME, "Player_Guild_Name",
        oPlayer);
}
void SetPlayerGuildName (object oPlayer, string sName)
{
    SetCampaignString (PGS_PLAYER_DATABASE_FILENAME, "Player_Guild_Name",
        sName, oPlayer);
}

int GetPlayerGuildRank (object oPlayer)
{
    return GetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Guild_Rank",
        oPlayer);
}
void SetPlayerGuildRank (object oPlayer, int iRank)
{
    SetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Guild_Rank", iRank,
        oPlayer);
}

int GetPlayerSettingValue (object oPlayer, string sSetting)
{
    //--------------------------------------------
    //Player settings value KEY:
    //    TRUE = Enabled.
    //    FALSE = Disabled.
    //--------------------------------------------
    return GetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Setting_" +
        sSetting, oPlayer);
}
void SetPlayerSettingValue (object oPlayer, string sSetting, int iValue)
{
    //--------------------------------------------
    //Player settings value KEY:
    //    TRUE = Enabled.
    //    FALSE = Disabled.
    //--------------------------------------------
    SetCampaignInt (PGS_PLAYER_DATABASE_FILENAME, "Player_Setting_" + sSetting,
        iValue, oPlayer);
}

//----------------------------------------------------------------------------\\

int GetModuleGuildMemberCount (int iGuild)
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Member_Count");
}
void SetModuleGuildMemberCount (int iGuild, int iCount)
{
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" + IntToString
        (iGuild) + "_Member_Count", iCount);
}

string GetModuleGuildPrivacyStatus (int iGuild)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Privacy_Status");
}
void SetModuleGuildPrivacyStatus (int iGuild, string sStatus)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Privacy_Status", sStatus);
}

int GetModuleGuildAccountValue (int iGuild)
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Account_Value");
}
void SetModuleGuildAccountValue (int iGuild, int iValue)
{
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" + IntToString
        (iGuild) + "_Account_Value", iValue);
}

string GetModuleGuildName (int iGuild)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Name");
}
void SetModuleGuildName (int iGuild, string sName)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Name", sName);
}

string GetModuleGuildDescription (int iGuild)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Description");
}
void SetModuleGuildDescription (int iGuild, string sDescription)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Description", sDescription);
}

string GetModuleGuildLeader (int iGuild)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Leader");
}
void SetModuleGuildLeader (int iGuild, string sLeader)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Leader", sLeader);
}

string GetModuleGuildTitle (int iGuild, int iPosition)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Title" + IntToString (iPosition));
}
void SetModuleGuildTitle (int iGuild, int iPosition, string sTitle)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Title" + IntToString (iPosition), sTitle);
}
string GetModuleGuildPost (int iGuild, int iPosition)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Post" + IntToString (iPosition));
}
void SetModuleGuildPost (int iGuild, int iPosition, string sPost)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Post" + IntToString (iPosition), sPost);
}
string GetModuleGuildAuthor (int iGuild, int iPosition)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Author" + IntToString (iPosition));
}
void SetModuleGuildAuthor (int iGuild, int iPosition, string sName)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Author" + IntToString (iPosition), sName);
}
string GetModuleGuildReplyTitle (int iGuild, int iPosition, int iReply)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Message" + IntToString (iPosition) +
        "_Reply" + IntToString (iReply));
}
void SetModuleGuildReplyTitle (int iGuild, int iPosition, int iReply, string sTitle)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Message" + IntToString (iPosition) +
        "_Reply" + IntToString (iReply), sTitle);
}
string GetModuleGuildReplyPost (int iGuild, int iPosition, int iReply)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Post" + IntToString (iPosition) +
        "_Reply" + IntToString (iReply));
}
void SetModuleGuildReplyPost (int iGuild, int iPosition, int iReply, string sPost)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Post" + IntToString (iPosition) +
        "_Reply" + IntToString (iReply), sPost);
}
string GetModuleGuildReplyAuthor (int iGuild, int iPosition, int iReply)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Author" + IntToString (iPosition) +
        "_Reply" + IntToString (iReply));
}
void SetModuleGuildReplyAuthor (int iGuild, int iPosition, int iReply, string sAuthor)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Author" + IntToString (iPosition) +
        "_Reply" + IntToString (iReply), sAuthor);
}

int GetModuleGuildCount()
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild_Count");
}
void SetModuleGuildCount (int iGuildCount)
{
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild_Count", iGuildCount);
}

string GetModuleRecentPGSActivity (int iPosition)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Recent_" +
        "Activity" + IntToString (iPosition));
}
void SetModuleRecentPGSActivity (string sEvent)
{
    int iCount = 8;

    //------------------------------------------------
    //Shift all events down one position.
    //------------------------------------------------
    for (; iCount >= 2; iCount--)
        SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Recent_Activity" +
            IntToString (iCount), GetModuleRecentPGSActivity (iCount - 1));

    //------------------------------------------------
    //Now place the newest event in the 1st position.
    //------------------------------------------------
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Recent_Activity1",
        sEvent);
}

string GetModuleGuildRankName (int iGuild, int iRank)
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Rank" + IntToString (iRank));
}
void SetModuleGuildRankName (int iGuild, int iRank, string sRank)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" + IntToString
        (iGuild) + "_Rank" + IntToString (iRank), sRank);
}
string GetModuleRankOptions (int iRank)
{
    //-------------------------------------------------
    //Return the options available to the player.
    //-------------------------------------------------
    switch (iRank)
    {
        case 1:  return "* Donate to guild account.\n* Reply to guild messages.";
        case 2:  return "* Donate to guild account.\n* Reply to guild messages.\n* Send guild invitations.";
        case 3:  return "* Donate to guild account.\n* Reply to guild messages.\n* Send guild invitations.\n* Remove guild members.";
        case 4:  return "* Donate to guild account.\n* Withdraw from guild account.\n* Reply to guild messages.\n* Send guild invitations.\n* Remove guild members.\n* Update guild information.\n* Change guild faction.";
    }

    return "Unknown";  /*Only used to compile.*/
}
void ChangeTargetPlayerRank (object oPlayer, object oTarget, int iNewRank)
{
    int iPlayerGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    //-------------------------------------------------
    //Ensure player and target are both in same guild.
    //-------------------------------------------------
    if ((GetLocalInt (oTarget, "Player_Guild_Number") != iPlayerGuild) && (!GetIsDM (oPlayer)))
    {
        SendMessageToPC (oPlayer, "You cannot promote/demote players from " +
            "another guild.");
        return;
    }

    int iCurrentTargetRank = GetLocalInt (oTarget, "Player_Guild_Rank");
    //-------------------------------------------------
    //Ensure target player is not the leader.
    //-------------------------------------------------
    if (iCurrentTargetRank == 4)
    {
        SendMessageToPC (oPlayer, "You cannot promote/demote the guild leader.");
        return;
    }
    //-------------------------------------------------
    //Same guild - check for valid new rank.
    //-------------------------------------------------
    if (iCurrentTargetRank == iNewRank)
    {
        SendMessageToPC (oPlayer, GetName (oTarget) + " is already ranked as " +
            " a " + GetModuleGuildRankName (iPlayerGuild, iNewRank) + ".");
        return;
    }

    //-------------------------------------------------
    //Inform members of new leadership change.
    //-------------------------------------------------
    if (iNewRank == 4)
    {
        object oLeader = GetPlayerObjectGuildLeader (iPlayerGuild);

        if (!GetIsObjectValid (oLeader))  /*Current leader online?*/
        {
            SendMessageToPC (oPlayer, "You cannot promote the targeted player " +
                "to guild leader, as the current guild leader is offline.");
            return;
        }

        SendPGSGuildNotice (iPlayerGuild, "Guild leadership has changed." +
            "  " + GetName (oTarget) + " has been promoted to be the " +
            "new guild " + GetModuleGuildRankName (iPlayerGuild, 4) + "!");
        SetModuleGuildLeader (iPlayerGuild, GetName (oTarget));
        SetPlayerGuildRank (oTarget, 4);  /*Save new player rank.*/

        //-------------------------------------------------
        //Determine which object is the leader.
        //DMs (oPlayer) can change rank, but are not leaders
        //so we need to ensure we have the correct leader
        //to change rank.
        //-------------------------------------------------
        if (oPlayer == oLeader)  /*Use oPlayer for leader.*/
            SetPlayerGuildRank (oPlayer, 3);

        else  /*Use oLeader for leader.*/
            SetPlayerGuildRank (oLeader, 3);
    }
    else
    {
        SetPlayerGuildRank (oTarget, iNewRank);  /*Save new player rank.*/

        //-------------------------------------------------
        //Check if to display guild notice to guild.
        //-------------------------------------------------
        if (iCurrentTargetRank > iNewRank)  /*Demotion.*/
        {
            if (PGS_SEND_NOTICE_ON_DEMOTION)
                SendPGSGuildNotice (iPlayerGuild, GetName (oTarget) + " has " +
                    "been demoted to a(n) " + GetModuleGuildRankName
                    (iPlayerGuild, iNewRank) + ".");
        }
        else if (PGS_SEND_NOTICE_ON_PROMOTION)  /*Promotion.*/
            SendPGSGuildNotice (iPlayerGuild, GetName (oTarget) + " has been " +
                "promoted to a(n) " + GetModuleGuildRankName (iPlayerGuild,
                iNewRank) + "!");
    }

    SetLocalInt (oTarget, "Player_Guild_Rank", iNewRank);
}

int GetModuleGuildAwardableXP (int iGuild)
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_XPAward");
}
void SetModuleGuildAwardableXP (int iGuild, int iXP)
{
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_XPAward", iXP);
}

int GetModuleGuildJoiningFee (int iGuild)
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Joining_Fee");
}
void SetModuleGuildJoiningFee (int iGuild, int iAmount)
{
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Joining_Fee", iAmount);
}

int GetModuleGuildColor (int iGuild)
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" +
        IntToString (iGuild) + "_Color");
}
void SetModuleGuildColor (int iGuild, int iColor)
{
    int iMemberCount = GetModuleGuildMemberCount (iGuild);
    int iEffect;

    //-------------------------------------------------
    //Determine size of light effect to store.
    //-------------------------------------------------
    if (iMemberCount >= PGS_COLOR_LIGHTING_SIZE1)
        iEffect = 0;
    if (iMemberCount >= PGS_COLOR_LIGHTING_SIZE2)
        iEffect = 1;
    if (iMemberCount >= PGS_COLOR_LIGHTING_SIZE3)
        iEffect = 2;
    if (iMemberCount >= PGS_COLOR_LIGHTING_SIZE4)
        iEffect = 3;

    //-------------------------------------------------
    //Calculate effect to store based on size & color.
    //-------------------------------------------------
    switch (iColor)
    {
        case 0:  iEffect = 0;  break;  /*No color to assign.*/
        case 1:  iEffect = iEffect + 153;  break;  /*Assign blue.*/
        case 2:  iEffect = iEffect + 157;  break;  /*Assign yellow.*/
        case 3:  iEffect = iEffect + 161;  break;  /*Assign purple.*/
        case 4:  iEffect = iEffect + 165;  break;  /*Assign red.*/
        case 5:  iEffect = iEffect + 169;  break;  /*Assign orange.*/
        //There's a gap between 169 - 177 because white does not function.
        case 6:  iEffect = iEffect + 177;  break;  /*Assign green.*/
    }

    //-------------------------------------------------
    //Not store the guild color effect.
    //-------------------------------------------------
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Module_Guild" + IntToString
        (iGuild) + "_Color", iEffect);
}

//----------------------------------------------------------------------------\\

string GetModulePGSBuildNumber()
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME,
        "PGS_Module_Build_Number");
}
void SetModulePGSBuildNumber (string sBuild)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "PGS_Module_Build_Number", sBuild);
}

string GetModulePGSBuildDate()
{
    return GetCampaignString (PGS_MODULE_DATABASE_FILENAME,
        "PGS_Module_Build_Date");
}
void SetModulePGSBuildDate (string sDate)
{
    SetCampaignString (PGS_MODULE_DATABASE_FILENAME, "PGS_Module_Build_Date",
        sDate);
}

void DisplayGuildInformation (int iGuild)
{
    //------------------------------------------------
    //Using custom tokens, display guild data.
    //------------------------------------------------
    SetCustomToken (3008, GetModuleGuildName (iGuild));
    SetCustomToken (3009, GetModuleGuildPrivacyStatus (iGuild));
    SetCustomToken (3010, IntToString (GetModuleGuildMemberCount (iGuild)));
    SetCustomToken (3011, GetModuleGuildLeader (iGuild));
    SetCustomToken (3012, GetModuleGuildDescription (iGuild));
}
void DisplayCurrentGuildMessage (int iGuild, int iMessage)
{
    SetCustomToken (3050, GetModuleGuildTitle (iGuild, iMessage));
    SetCustomToken (3051, GetModuleGuildAuthor (iGuild, iMessage));
    SetCustomToken (3052, GetModuleGuildPost (iGuild, iMessage));
}
void DisplayCurrentGuildMessageReply (int iGuild, int iMessage, int iReply)
{
    SetCustomToken (3050, GetModuleGuildReplyTitle (iGuild, iMessage, iReply));
    SetCustomToken (3051, GetModuleGuildReplyAuthor (iGuild, iMessage, iReply));
    SetCustomToken (3052, GetModuleGuildReplyPost (iGuild, iMessage, iReply));
}

void SendPGSGuildNotice (int iGuild, string sNotice)
{
    object oLoop = GetFirstPC();

    //-------------------------------------------------
    //Loop through all players, sending the notice to
    //players of the same guild.
    //-------------------------------------------------
    while (GetIsObjectValid (oLoop))
    {
        //-------------------------------------------------
        //Check for matching guild number.
        //-------------------------------------------------
        if (GetLocalInt (oLoop, "Player_Guild_Number") == iGuild)
            SendMessageToPC (oLoop, "Guild Notice: " + sNotice);

        oLoop = GetNextPC();  /*Increment for loop.*/
    }
}
void SendPGSGuildMessage (int iGuild, object oSender, string sMessage)
{
    object oLoop = GetFirstPC();
    int iLoopGuild;

    //-------------------------------------------------
    //Loop through players and send message.
    //-------------------------------------------------
    while (GetIsObjectValid (oLoop))
    {
        iLoopGuild = GetLocalInt (oLoop, "Player_Guild_Number");

        //-------------------------------------------------
        //First check for matching guild number.
        //-------------------------------------------------
        if ((iLoopGuild == iGuild) || (GetFactionStatusBetweenGuilds (iGuild, iLoopGuild) == 1))
            //-------------------------------------------------
            //Now check to ensure oLoop is accepting messages.
            //-------------------------------------------------
            if (GetPlayerSettingValue (oLoop, "Guild_Chat") == TRUE)
                SendMessageToPC (oLoop, GetName (oSender) + ": " + sMessage);

        oLoop = GetNextPC();  /*Increment for loop.*/
    }
}

void RemoveGuildDataFromPlayer (object oPlayer)
{
    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iMemberCount = GetModuleGuildMemberCount (iGuild);
    object oLoop = GetFirstPC();
    object oGnome = GetLocalObject (oPlayer, "Temp_Vault_Gnome");

    //-------------------------------------------------
    //Remove any NPC's that may have been created by PC.
    //-------------------------------------------------
    ApplyEffectAtLocation (DURATION_TYPE_INSTANT, EffectVisualEffect
        (VFX_FNF_SUMMON_MONSTER_2), GetLocation (oGnome));
    DestroyObject (oGnome);
    ApplyEffectToObject (DURATION_TYPE_INSTANT, EffectDisappear(),
        GetLocalObject (oPlayer, "Temp_Messenger_Creature"));

    //-------------------------------------------------
    //Update player & module variables.
    //-------------------------------------------------
    SetModuleGuildMemberCount (iGuild, GetModuleGuildMemberCount (iGuild) - 1);
    SetPlayerGuildNumber (oPlayer, 0);
    SetPlayerGuildRank (oPlayer, 0);
    SetPlayerGuildName (oPlayer, "");

    DeleteLocalInt (oPlayer, "Player_Guild_Number");
    DeleteLocalInt (oPlayer, "Player_Guild_Rank");
    DeleteLocalObject (oPlayer, "Temp_Vault_Gnome");
    DeleteLocalObject (oPlayer, "Temp_Messenger_Creature");

    RemoveSpecificEffect (EFFECT_TYPE_VISUALEFFECT, oPlayer);

    //--------------------------------------------
    //Reset player factions to neutral.
    //--------------------------------------------
    while (GetIsObjectValid (oLoop))
    {
        //--------------------------------------------
        //Set oPlayer and oLoop to be neutral.
        //--------------------------------------------
        SetIsTemporaryNeutral (oLoop, oPlayer);
        SetIsTemporaryNeutral (oPlayer, oLoop);

        oLoop = GetNextPC();
    }

    //--------------------------------------------
    //If using the "pgs_main" convo, freeze it.
    //--------------------------------------------
    if (GetLocalInt (oPlayer, "Is_In_Conversation"))
    {
        AssignCommand (oPlayer, ActionPauseConversation());
        SendMessageToPC (oPlayer, "PGS conversation has been paused - please " +
            "restart.");
    }
}
void PermanentlyRemoveGuild (int iGuild)
{
    object oLoop = GetFirstPC();
    int iMaxGuild = GetModuleMaxGuildNumber();

    //--------------------------------------------
    //Update recent guild activity list.
    //--------------------------------------------
    SetModuleRecentPGSActivity ("Guild removed: " + GetModuleGuildName (iGuild));

    //--------------------------------------------
    //Loop through players and remove from guild.
    //--------------------------------------------
    while (GetIsObjectValid (oLoop))
    {
        if (GetLocalInt (oLoop, "Player_Guild_Number") == iGuild)
        {
            RemoveGuildDataFromPlayer (oLoop);
            SendMessageToPC (oLoop, "You have been removed from the guild as " +
                "it no longer exists.");

            //--------------------------------------------
            //Determine if to take GJ from player inventory.
            //--------------------------------------------
            if ((PGS_GIVE_GUILD_JOURNAL_ON_ENTER == FALSE) && (PGS_KEEP_GUILD_JOURNAL_AFTER_REMOVAL == FALSE))
                DestroyObject (GetItemPossessedBy (oLoop, "GuildJournal"));
        }

        oLoop = GetNextPC();  /*Object loop increment.*/
    }

    //--------------------------------------------
    //Remove module guild information from the DB.
    //--------------------------------------------
    SetModuleGuildMemberCount (iGuild, 0);
    SetModuleGuildPrivacyStatus (iGuild, "");
    SetModuleGuildAccountValue (iGuild, 0);
    SetModuleGuildName (iGuild, "");
    SetModuleGuildDescription (iGuild, "");
    SetModuleGuildLeader (iGuild, "");
    SetModuleGuildJoiningFee (iGuild, 0);
    SetModuleGuildColor (iGuild, 0);

    SetModuleGuildCount (GetModuleGuildCount() - 1);

    //--------------------------------------------
    //Reset all messages and replies made from guild.
    //--------------------------------------------
    int iCount;
    int iMessage = 1;

    for (; iMessage <= 8; iMessage++)
    {
        //--------------------------------------------
        //Remove message.
        //--------------------------------------------
        SetModuleGuildTitle (iGuild, iMessage, "");
        SetModuleGuildPost (iGuild, iMessage, "");
        SetModuleGuildAuthor (iGuild, iMessage, "");

        //--------------------------------------------
        //Remove replies associated with message.
        //--------------------------------------------
        for (iCount = 1; iCount <= 8; iCount++)
        {
            SetModuleGuildReplyTitle (iGuild, iMessage, iCount, "");
            SetModuleGuildReplyPost (iGuild, iMessage, iCount, "");
            SetModuleGuildReplyAuthor (iGuild, iMessage, iCount, "");
        }
    }

    //--------------------------------------------
    //Update max guild number if necessary.
    //--------------------------------------------
    if (iGuild == iMaxGuild)
    {
        int iFound = FALSE;
        int iGuildPosition = iGuild;
        int iMaxTerritory = GetMaxTerritoryNumber();

        //--------------------------------------------
        //Check for max. territory number.
        //--------------------------------------------
        if (iMaxTerritory > iGuild)
            iGuild = iMaxTerritory;

        //--------------------------------------------
        //Loop through guilds and territories.
        //  - Set new max guild number.
        //  - Abandon all guild territories.
        //--------------------------------------------
        while (iGuild != 0)
        {
            //--------------------------------------------
            //Check for new maximum guild number.
            //--------------------------------------------
            if ((iFound == FALSE) && (GetModuleGuildName (iGuild) != ""))
            {
                SetModuleMaxGuildNumber (iGuild);
                iFound = TRUE;
            }
            //--------------------------------------------
            //Check for any guild territories to abandon.
            //--------------------------------------------
            if (GetTerritoryGuildNumber (iGuild) == iGuildPosition)
            {
                SetTerritoryGuildNumber (iGuild, 0);
                SetTerritoryName (iGuild, "");
            }

            //--------------------------------------------
            //Reset guild faction with current guild in list.
            //--------------------------------------------
            SetFactionStatusBetweenGuilds (iGuildPosition, iGuild, 0);

            iGuild--;  /*Decrement variable.*/
        }

        if (!iFound)  /*Check if new max guild was found.*/
            SetModuleMaxGuildNumber (0);
    }
}

int GetModuleMaxGuildNumber()
{
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Max_Guild_Number");
}
void SetModuleMaxGuildNumber (int iMaxGuild)
{
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Max_Guild_Number", iMaxGuild);
}

int GetFactionStatusBetweenGuilds (int iGuild1, int iGuild2)
{
    //-------------------------------------------------
    //Faction status key:
    //   -1 = Enemies (hostile towards one another).
    //    0 = Neutral.
    //    1 - Allies (can share guild chat messages,
    //        transfer gold, etc...).
    //
    //Note: New guilds begin neutral to everyone.
    //-------------------------------------------------
    return GetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Guild" + IntToString
        (iGuild1) + "_Guild" + IntToString (iGuild2) + "_Faction");
}
void SetFactionStatusBetweenGuilds (int iGuild1, int iGuild2, int iFaction)
{
    //-------------------------------------------------
    //Faction status key:
    //   -1 = Enemies (hostile towards one another).
    //    0 = Neutral.
    //    1 - Allies (can share guild chat messages,
    //        transfer gold, etc...).
    //
    //Note: New guilds begin neutral to everyone.
    //-------------------------------------------------
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Guild" + IntToString
        (iGuild1) + "_Guild" + IntToString (iGuild2) + "_Faction", iFaction);
    SetCampaignInt (PGS_MODULE_DATABASE_FILENAME, "Guild" + IntToString
        (iGuild2) + "_Guild" + IntToString (iGuild1) + "_Faction", iFaction);
}

void SetPlayerGuildFactionToAll (object oPlayer)
{
    object oLoop = GetFirstPC();
    int iPlayerGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iTargetGuild;

    //--------------------------------------------
    //Loop through all players online.
    //
    //Based on guild faction, set to hostile,
    //neutral, or ally.
    //--------------------------------------------
    while (GetIsObjectValid (oLoop))
    {
        if (oLoop != oPlayer)  /*No need to change player faction with self.*/
        {
            iTargetGuild = GetLocalInt (oLoop, "Player_Guild_Number");

            if (iPlayerGuild == iTargetGuild)
                SetPCLike (oPlayer, oLoop);

            else
            {
                //----------------------------------------
                //Set player faction based on guild faction.
                //----------------------------------------
                switch (GetFactionStatusBetweenGuilds (iPlayerGuild, iTargetGuild))
                {
                    case -1:  SetPCDislike (oPlayer, oLoop);  break;  /*Enemies.*/
                    case  0:  /*Neutral.*/
                        SetIsTemporaryNeutral (oLoop, oPlayer);
                        SetIsTemporaryNeutral (oPlayer, oLoop);
                        break;
                    case  1:  SetPCLike (oPlayer, oLoop);  break;  /*Allies.*/
                }
            }
        }

        oLoop = GetNextPC();
    }
}
void ComputeGuildPlayerFactions (int iGuild)
{
    object oLoop = GetFirstPC();

    while (GetIsObjectValid (oLoop))
    {
        if (GetLocalInt (oLoop, "Player_Guild_Number") == iGuild)
            SetPlayerGuildFactionToAll (oLoop);

        oLoop = GetNextPC();
    }
}

object GetPlayerObjectGuildLeader (int iGuild)
{
    object oLoop = GetFirstPC();

    //--------------------------------------------
    //Loop through players looking for a match.
    //--------------------------------------------
    while (GetIsObjectValid (oLoop))
    {
        if (GetLocalInt (oLoop, "Player_Guild_Number") == iGuild)  /*Match guild number.*/
            if (GetName (oLoop) == GetModuleGuildLeader (iGuild))  /*Match name.*/
                return oLoop;

        oLoop = GetNextPC();
    }

    return OBJECT_INVALID;  /*Leader not found.*/
}

void SetGuildFactionToEnemy (int iGuild1, int iGuild2)
{
    float fDelay = PGS_FLOAT_HOSTILITY_DELAY;
    string sDelay = "";

    SetModuleRecentPGSActivity ("Enemies: " + GetModuleGuildName (iGuild1) +
        " - " + GetModuleGuildName (iGuild2));

    if (fDelay > 0.0f)
        sDelay = "  Faction changes will occur in " + FloatToString
            (fDelay, 4, 1) + " seconds.";

    //--------------------------------------------
    //Inform both guilds of the new faction change.
    //--------------------------------------------
    SendPGSGuildNotice (iGuild1, "Guild faction with the guild '" +
        GetModuleGuildName (iGuild2) + "' has changed; they are now " +
        "considered enemies." + sDelay);
    SendPGSGuildNotice (iGuild2, "Guild faction with the guild '" +
        GetModuleGuildName (iGuild1) + "' has changed; they are now " +
        "considered enemies." + sDelay);

    //--------------------------------------------
    //In order to properly perform the necessary
    //delay's needed for setting hostility, they
    //are done in a seperate function, which is
    //then called via the DelayCommand function.
    //
    //Problems can arise if each process is
    //individually given a delay.
    //--------------------------------------------
    DelayCommand (fDelay, SetDelayedHostilityFaction (iGuild1, iGuild2));
}
void SetGuildFactionToNeutral (int iGuild1, int iGuild2)
{
    if (GetFactionStatusBetweenGuilds (iGuild1, iGuild2) == 1)
    {
        //--------------------------------------------
        //Inform both guilds of new faction change.
        //--------------------------------------------
        SendPGSGuildNotice (iGuild1, "Guild faction with the guild '" +
            GetModuleGuildName (iGuild2) + "' has changed; they are now " +
            "considered neutral.");
        SendPGSGuildNotice (iGuild2, "Guild faction with the guild '" +
            GetModuleGuildName (iGuild1) + "' has changed; they are now " +
            "considered neutral.");

        //--------------------------------------------
        //Set new factions, and recompute player faction.
        //--------------------------------------------
        SetFactionStatusBetweenGuilds (iGuild1, iGuild2, 0);
        ComputeGuildPlayerFactions (iGuild1);

        SetModuleRecentPGSActivity ("Neutral: " + GetModuleGuildName (iGuild1) +
            " - " + GetModuleGuildName (iGuild2));
    }
    else  /*Send faction request (going from neutral to ally).*/
    {
        object oPlayer = GetPCSpeaker();
        object oLeader = GetLocalObject (oPlayer, "Object_Target");

        //--------------------------------------------
        //Check for errors before sending faction req.
        //--------------------------------------------
        if (!GetIsObjectValid (oLeader))
            SendMessageToPC (oPlayer, "You were unable to locate the guild " +
                "leader for the selected guild at this time.");

        else if (GetPlayerSettingValue (oLeader, "Faction_Offers") == FALSE)
        {
            SendMessageToPC (oPlayer, GetName (oLeader) + " is currently not " +
                "accepting faction offers.");
            SendMessageToPC (oLeader, GetName (oPlayer) + " tried to send you " +
                "a faction offer, but you are currently rejecting them.");
        }
        else if (GetIsInCombat (oLeader))
            SendMessageToPC (oPlayer, GetName (oLeader) + " is currently in " +
                "combat.");

        else
        {
            //--------------------------------------------
            //Inform sender message was successfully sent.
            //--------------------------------------------
            SendMessageToPC (oPlayer, "Your neutrality offer has been " +
                "succesfully sent to the guild leader, " + GetName (oLeader) + ".");

            SetModuleRecentPGSActivity ("Neutral: " + GetModuleGuildName
                (iGuild1) + " - " + GetModuleGuildName (iGuild2));

            //--------------------------------------------
            //Save variables, then begin faction convo.
            //--------------------------------------------
            SetLocalObject (oLeader, "Object_Activator", oPlayer);
            SetLocalInt (oLeader, "New_Guild_Faction", 0);
            AssignCommand (oLeader, ActionStartConversation (oLeader,
                "pgs_faction", TRUE, FALSE));
        }
    }
}
void SetGuildFactionToAlly (object oPlayer, object oLeader)
{
    //--------------------------------------------
    //Check for errors before sending faction req.
    //--------------------------------------------
    if (!GetIsObjectValid (oLeader))
        SendMessageToPC (oPlayer, "You were unable to locate the guild " +
            "leader.  Your faction request could not be sent.");

    else if (GetPlayerSettingValue (oLeader, "Faction_Offers") == FALSE)
    {
        SendMessageToPC (oPlayer, GetName (oLeader) + " is currently not " +
            "accepting faction offers.");
        SendMessageToPC (oLeader, GetName (oPlayer) + " tried to send you " +
            "a faction offer, but you are currently rejecting them.");
    }
    else if (GetIsInCombat (oLeader))
        SendMessageToPC (oPlayer, GetName (oLeader) + " is currently in combat.");

    else
    {
        //--------------------------------------------
        //Inform sender message was successfully sent.
        //--------------------------------------------
        SendMessageToPC (oPlayer, "Your alliance offer has been successfully " +
            " sent to the guild leader, " + GetName (oLeader) + ".");

        SetModuleRecentPGSActivity ("Allies: " + GetModuleGuildName
            (GetLocalInt (oPlayer, "Player_Guild_Number")) + " - " +
            GetModuleGuildName (GetLocalInt (oLeader, "Player_Guild_Number")));

        //--------------------------------------------
        //Begin the faction conversation with the leader.
        //--------------------------------------------
        SetLocalObject (oLeader, "Object_Activator", oPlayer);
        SetLocalInt (oLeader, "New_Guild_Faction", 1);
        AssignCommand (oLeader, ActionStartConversation (oLeader, "pgs_faction",
            TRUE, FALSE));
    }
}

void SetDelayedHostilityFaction (int iGuild1, int iGuild2)
{
    SetFactionStatusBetweenGuilds (iGuild1, iGuild2, -1);
    SendPGSGuildNotice (iGuild1, "Hostility settings towards " +
        GetModuleGuildName (iGuild2) + " have been set.");
    SendPGSGuildNotice (iGuild2, "Hostility settings towards " +
        GetModuleGuildName (iGuild1) + " have been set.");
    ComputeGuildPlayerFactions (iGuild1);

    //--------------------------------------------
    //Private guilds become public when at war.
    //--------------------------------------------
    SetModuleGuildPrivacyStatus (iGuild1, "public");
    SetModuleGuildPrivacyStatus (iGuild2, "public");
}

void AwardTargetPlayerWithGuildXP (object oPlayer, object oTarget, int iXP)
{
    int iPlayerGuild = GetLocalInt (oPlayer, "Player_Guild_Number");

    //--------------------------------------------
    //Make sure player and target are in same guild.
    //--------------------------------------------
    if (GetLocalInt (oTarget, "Player_Guild_Number") != iPlayerGuild)
        SendMessageToPC (oPlayer, "You cannot award experience to non-guild " +
            "members.");

    else if (GetModuleGuildAwardableXP (iPlayerGuild) < iXP)
        SendMessageToPC (oPlayer, "You're requesting to award more experience " +
            "points than there are in your guild pool.");

    else if (PGS_XP_AWARD_PER_GUILD_MEMBER == 0)
        SendMessageToPC (oPlayer, "This feature is currently disabled by " +
            "the module builder.");

    else  /*Update and award targeted player with guild experience.*/
    {
        SendMessageToPC (oTarget, "You've been awarded with guild experience.");
        GiveXPToCreature (oTarget, iXP);
        SetModuleGuildAwardableXP (iPlayerGuild, GetModuleGuildAwardableXP
            (iPlayerGuild) - iXP);
    }
}
//  //********************************************************************\\  \\
//  ||************************* END PGS FUNCTIONS ************************||  \\
//  \\********************************************************************//  \\
