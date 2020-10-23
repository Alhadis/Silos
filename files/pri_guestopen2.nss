//::///////////////////////////////////////////////
//:: Unlock and Open Door to Suite to allow more guests in
//:: pri_guestopen2
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

Script is similar to "_rsa_guestopen" but instead of
opening the door to let the guests leave, it opens the
Suite door to allow more guests in.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void main()
{
object oPC = GetPCSpeaker();
object oTrigger = GetNearestObjectByTag("SuiteAutoDoor");
object oDoor = GetNearestObjectByTag("SuiteRoomDoor");

GetInnArea(oPC);

string sButler = GetLocalString(oPC, "RSA_Butler");
string sButGuests2 = GetLocalString(oPC, "RSA_ButGuests2");

object oButler = GetObjectByTag(sButler);
object oWayPoint = GetObjectByTag("POST_"+sButler);

AssignCommand(oButler, ClearAllActions());
AssignCommand (oButler, ActionSpeakString(sButGuests2));
SetLocked(oDoor, FALSE);
AssignCommand(oButler, ActionOpenDoor(oDoor));
SetLocalInt(oButler, "RSA_Guests", 1);
AssignCommand(oButler, ActionMoveToObject(oWayPoint));
AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
}
