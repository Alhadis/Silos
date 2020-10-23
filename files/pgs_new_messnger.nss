//::///////////////////////////////////////////////
//:: Name: pgs_new_messnger
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will create a random messenger
    for the player to use and command.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem_cnfg"

void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //Check if messenger already created.
    //--------------------------------------------
    if (GetIsObjectValid (GetLocalObject (oPlayer, "Temp_Messenger_Creature")))
    {
        SendMessageToPC (oPlayer, "You already have a messenger creature in " +
            "your posession, so you cannot have another.");
        return;
    }

    //--------------------------------------------
    //Choose random messenger to create.
    //--------------------------------------------
    string sMessenger;

    switch (d4())
    {
        case 1:  sMessenger = "fairymessenger";  break;
        case 2:  sMessenger = "falconmessenger";  break;
        case 3:  sMessenger = "ravenmessenger";  break;
        case 4:  sMessenger = "willomessenger";  break;
    }

    //--------------------------------------------
    //Now we create the messenger creature.
    //--------------------------------------------
    object oMessenger = CreateObject (OBJECT_TYPE_CREATURE, sMessenger,
        GetLocation (oPlayer), TRUE);

    //--------------------------------------------
    //Set friendly faction between PC and messenger.
    //--------------------------------------------
    AssignCommand (oPlayer, SetStandardFactionReputation
        (STANDARD_FACTION_COMMONER, 100, oMessenger));

    //--------------------------------------------
    //Set necessary messenger-related variables.
    //--------------------------------------------
    SetLocalInt (oMessenger, "Messenger_Following", TRUE);
    SetLocalObject (oPlayer, "Temp_Messenger_Creature", oMessenger);
    SetLocalObject (oMessenger, "Temp_Player", oPlayer);

    SetListening (oMessenger, TRUE);
    SetListenPattern (oMessenger, "**", 2001);

    //--------------------------------------------
    //Have messenger follow the player.
    //--------------------------------------------
    AssignCommand (oMessenger, ActionForceFollowObject (oPlayer, 3.0f));
    SetLocalFloat (oMessenger, "Max_Distance", PGS_MAX_MESSENGER_FOLLOW_DISTANCE);
}
