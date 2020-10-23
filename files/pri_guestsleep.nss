//::///////////////////////////////////////////////
//:: Checks for guests then opens bedroom for use
//:: pri_guestsleep
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script is called by the player from the butler
conversation. The butler will check for guests that are
still in the room. If there are still guests, the Butler
will tell the PC how many there still are in the room.

If there aren't any guests left, the butler will close and
lock the room door, turn the "SuiteAutoDoor" and "SuiteDoneRoom"
triggers back on, clean up the guest variables so guests, can
be invited over again, and unlocks and opens the doors to the
bedroom.

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
string sButGuestPa = GetLocalString(oPC, "RSA_ButGuestPa");
string sButGuestWala = GetLocalString(oPC, "RSA_ButGuestWala");

object oButler = GetObjectByTag(sButler);
object oWayPoint = GetObjectByTag("POST_"+sButler);
int iNGuests = GetLocalInt(oTrigger, "RSA_NGuests");

//Checks to see if Guests in Room
if (iNGuests > 0)
 {
 string sGuest = "guests";
 string sVerb = "are";
 if (iNGuests == 1)
 {
  sGuest = "guest";
  sVerb = "is";
 }
 AssignCommand(oButler, ActionSpeakString(sButGuestPa + " There "+sVerb+" still "+IntToString(iNGuests)+" "+sGuest+" in the room."));
 return;
 }
//End Check

int nIdx = 0;
object oDoor2 = GetNearestObjectByTag("SuiteBedDoor", OBJECT_SELF, nIdx);
AssignCommand(oButler, ClearAllActions());
AssignCommand(oButler, ActionSpeakString(sButGuestWala));
AssignCommand(oButler, ActionCloseDoor(oDoor));
SetLocked(oDoor, TRUE);
while (nIdx < 3)
 {
  AssignCommand(oButler, ActionMoveToObject(oDoor2));
  SetLocked(oDoor2, FALSE);
  nIdx++;
  oDoor2 = GetNearestObjectByTag("SuiteBedDoor", OBJECT_SELF, nIdx);
  AssignCommand(oButler, ActionWait(1.0));
 }
SetLocalInt(oButler, "RSA_Guests", 0);
SetLocalInt(oTrigger, "RSA_Guests", 0);
AssignCommand(oButler, ActionMoveToObject(oWayPoint));
AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
}
