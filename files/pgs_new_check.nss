//::///////////////////////////////////////////////
//:: Name: pgs_new_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will check to ensure that the
    player wishing to create a new guild meets
    all requirements set by the module builder
    (if any).
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

    SetLocalInt (oPlayer, "Guild_Data_Error", FALSE);

    //--------------------------------------------
    //Check player level against minimum required.
    //--------------------------------------------
    if (GetHitDice (oPlayer) < PGS_GUILD_CREATION_LEVEL_REQUIREMENT)
    {
        SendMessageToPC (oPlayer, "A minimum season of " + IntToString
            (PGS_GUILD_CREATION_LEVEL_REQUIREMENT) + " is required to create " +
            "a new guild.");
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
    }
    //--------------------------------------------
    //Check player charisma against minimum required.
    //--------------------------------------------
    if (GetAbilityScore (oPlayer, ABILITY_CHARISMA) < PGS_GUILD_CREATION_CHARISMA_REQUIREMENT)
    {
        SendMessageToPC (oPlayer, "A minimum charisma score of " + IntToString
            (PGS_GUILD_CREATION_CHARISMA_REQUIREMENT) + " is required to " +
            "create a new guild.");
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
    }
    //--------------------------------------------
    //Check for maximum guild count limit.
    //--------------------------------------------
    if ((GetModuleGuildCount() >= PGS_MAX_GUILD_COUNT) && (PGS_MAX_GUILD_COUNT > 0))
    {
        SendMessageToPC (oPlayer, "The maximum number of guilds (" +
            IntToString (PGS_MAX_GUILD_COUNT) + ") has been reached.  A guild " +
            "must be removed before another can be created to take it's position.");
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
    }
}
