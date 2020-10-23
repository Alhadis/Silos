//::///////////////////////////////////////////////
//:: Opens the Suite for Guests of Renter
//:: pri_guests
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

Script is actived by player through a conversation with
the Suite Butler. The Butler flips a variable on the
"SuiteAutoDoor" trigger that tells it to count guests that
enter the room instead of opening and closing doors.

The Butler unlocks the SuiteRoomDoor and Opens it. The
Trigger closes and locks the doors to the room so that
the guests can not use the bedroom and have a free night's
sleep.

The "SuiteDownRoom" trigger is toggeled off so that the
door does not close on the guests. However, if the renter
of the room tries to leave, it forces him to reenter the
room and gives him a message that he cannot leave until
all of his guests are gone.

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
string sButGuests = GetLocalString(oPC, "RSA_ButGuests");

string sName = GetName(oPC);

object oButler = GetObjectByTag(sButler);
object oWayPoint = GetWaypointByTag("POST_"+sButler);

SetLocalInt(oButler, "RSA_Guests", 1);
SetLocalInt(oTrigger, "RSA_Guests", 1);
SetLocalString(oButler, "RSA_Owner", sName);
AssignCommand(oButler, ClearAllActions());


AssignCommand(oButler, ActionSpeakString(sButGuests));
SetLocked(oDoor, FALSE);
AssignCommand(oButler, ActionOpenDoor(oDoor));
int nIdx = 0;
object oDoor2 = GetNearestObjectByTag("SuiteBedDoor", OBJECT_SELF, nIdx);
while (GetIsObjectValid(oDoor2))
 {
  AssignCommand(oTrigger, ActionCloseDoor(oDoor2));
  SetLocked(oDoor2, TRUE);
  nIdx++;
  oDoor2 = GetNearestObjectByTag("SuiteBedDoor", OBJECT_SELF, nIdx);
 }
AssignCommand(oButler, ActionMoveToObject(oWayPoint));
AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
}
