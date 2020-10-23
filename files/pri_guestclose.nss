//::///////////////////////////////////////////////
//:: Close and locks main door after all guests in room.
//:: pri_guestclose
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

Player calls this script from a Butler conversation.
The butler closes and locks the door so that no more
guests can enter the suite.

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
string sLockDoor = GetLocalString(oPC, "RSA_ButDoorLock");

object oButler = GetObjectByTag(sButler);
object oWayPoint = GetObjectByTag("POST_"+sButler);

AssignCommand(oButler, ClearAllActions());
AssignCommand(oButler, ActionSpeakString(sLockDoor));
AssignCommand(oButler, ActionCloseDoor(oDoor));
SetLocked(oDoor, TRUE);
SetLocalInt(oButler, "RSA_Guests", 2);
AssignCommand(oButler, ActionMoveToObject(oWayPoint));
AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
}
