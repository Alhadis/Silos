//::///////////////////////////////////////////////
//:: Name: pgs_inv_accept
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Perform the necessary functions to join the
    player into the new guild.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oSender = GetLocalObject (oPlayer, "Object_Activator");
    int iPlayerGuild = GetLocalInt (oPlayer, "Player_Guild_Number");
    int iJoiningGuild = GetLocalInt (oSender, "Player_Guild_Number");
    int iJoiningFee = GetModuleGuildJoiningFee (iJoiningGuild);

    if (GetGold (oPlayer) < iJoiningFee)
    {
        SendMessageToPC (oPlayer, "You currently do not have enough gold to " +
            "cover the joining fee.");
        SendMessageToPC (oSender, GetName (oPlayer) + " currently does not " +
            "have enough gold to cover the joining fee.");
        return;
    }

    if (iPlayerGuild > 0)  /*Check if player is in a guild.*/
    {
        if (GetLocalInt (oPlayer, "Player_Guild_Rank") == 4)
            PermanentlyRemoveGuild (iPlayerGuild);

        else
        {
            RemoveGuildDataFromPlayer (oPlayer);
            SendPGSGuildNotice (iPlayerGuild, GetName (oPlayer) + " has " +
                "disbanded this guild, and joined another.");
        }
    }

    //--------------------------------------------
    //Save new guild information on the player.
    //--------------------------------------------
    SetPlayerGuildNumber (oPlayer, iJoiningGuild);
    SetPlayerGuildName (oPlayer, GetModuleGuildName (iJoiningGuild));
    SetPlayerGuildRank (oPlayer, 1);
    SetLocalInt (oPlayer, "Player_Guild_Rank", 1);
    SetLocalInt (oPlayer, "Player_Guild_Number", iJoiningGuild);

    //--------------------------------------------
    //Add joining fee to guild account.
    //--------------------------------------------
    TakeGoldFromCreature (iJoiningFee, oPlayer, TRUE);
    SetModuleGuildAccountValue (iJoiningGuild, GetModuleGuildAccountValue
        (iJoiningGuild) + iJoiningFee);

    int iGuildColor = GetModuleGuildColor (iJoiningGuild);
    //--------------------------------------------
    //Apply guild cover effect to the new member.
    //--------------------------------------------
    if (iGuildColor != 0)
        ApplyEffectToObject (DURATION_TYPE_PERMANENT, EffectVisualEffect
            (iGuildColor), oPlayer);

    //--------------------------------------------
    //Check to give new member a Guild Journal.
    //--------------------------------------------
    if (!GetIsObjectValid (GetItemPossessedBy (oPlayer, "GuildJournal")))
        CreateItemOnObject ("guildjournal", oPlayer);

    //--------------------------------------------
    //Update member count, and send guild notice.
    //--------------------------------------------
    SetModuleGuildMemberCount (iJoiningGuild, GetModuleGuildMemberCount
        (iJoiningGuild) + 1);
    SendPGSGuildNotice (iJoiningGuild, "Welcome " + GetName (oPlayer) + ", " +
        "who has just joined the guild.");

    //--------------------------------------------
    //Set player factions based on guild faction.
    //--------------------------------------------
    SetPlayerGuildFactionToAll (oPlayer);
    DeleteLocalInt (oPlayer, "In_Invite_Convo");  /*Can recieve invites again.*/
}
