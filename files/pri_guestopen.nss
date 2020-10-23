//::///////////////////////////////////////////////
//:: Unlock and Open door so Guests can leave
//:: pri_guestopen
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script is called by the Suite Butler when Guests
are over. It tells the Butler to unlock the door to the
suite, and open the door to let the guests out of the
room.

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
string sButGuestOut = GetLocalString(oPC, "RSA_ButGuestOut");

object oButler = GetObjectByTag(sButler);
object oWayPoint = GetObjectByTag("POST_"+sButler);

AssignCommand(oButler, ClearAllActions());
AssignCommand (oButler, ActionSpeakString(sButGuestOut));
SetLocked(oDoor, FALSE);
AssignCommand(oButler, ActionOpenDoor(oDoor));
SetLocalInt(oButler, "RSA_Guests", 3);
AssignCommand(oButler, ActionMoveToObject(oWayPoint));
AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
}
