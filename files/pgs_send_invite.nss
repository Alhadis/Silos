//::///////////////////////////////////////////////
//:: Name: pgs_send_invite
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Send a guild invitation offer to the targeted
    player.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oTarget = GetLocalObject (oPlayer, "Object_Target");

    //--------------------------------------------
    //Make sure leader is accepting invite offers.
    //--------------------------------------------
    if (GetPlayerSettingValue (oTarget, "Invitations") == FALSE)
    {
        SendMessageToPC (oPlayer, GetName (oTarget) + " is currently not " +
            "accepting guild invitation offers.");
        SendMessageToPC (oTarget, GetName (oPlayer) + " tried to send you " +
            "a guild invitation offer, but you are currently rejecting them.");
    }
    else if (GetIsInCombat (oTarget))  /*Check if the target is in combat.*/
        SendMessageToPC (oPlayer, GetName (oTarget) + " is currently in combat.");

    else if (GetLocalInt (oTarget, "In_Invite_Convo"))
        SendMessageToPC (oPlayer, GetName (oTarget) + " is already considering " +
            "a guild invitation offer.");

    else  /*Invitation can be sent - start coversation for target.*/
    {
        SetLocalInt (oTarget, "In_Invite_Convo", TRUE);
        SendMessageToPC (oPlayer, "You're guild invite was succesfully sent to " +
            GetName (oTarget) + ".");
        AssignCommand (oTarget, ActionStartConversation (oTarget, "pgs_invitation",
            TRUE, FALSE));
    }
}
