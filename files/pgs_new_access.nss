//::///////////////////////////////////////////////
//:: Name: pgs_new_access
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Grant new guild creation access to the targeted
    player.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();
    object oTarget = GetLocalObject (oPlayer, "Object_Target");

    //--------------------------------------------
    //Grant target player guild access.
    //--------------------------------------------
    SetLocalInt (oTarget, "Guild_Creation_Access", TRUE);

    //--------------------------------------------
    //Inform player and DMs of change.
    //--------------------------------------------
    SendMessageToAllDMs (GetName (oTarget) + " has been given access to " +
        "create a guild.");
    SendMessageToPC (oPlayer, "You have been granted access to create a guild.");
}
