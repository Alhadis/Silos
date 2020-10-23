//::///////////////////////////////////////////////
//:: Guest Request to leave Suite
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

If a guest requests that the Butler lets them out of the
Suite, the butler checks to see if the door to the Suite
is opened. If it is, he tells the players they are free to
go.

If it is not opened, butler checks for the renter of room. If
renter of room is not found, butler opens door for the guests to
leave.

If renter of room is found, butler sends him a message that he is
unlocking the door for the guest (gives name) and shows the guest
out.

Orignal plan was to have butler walk up to renter and tell him but
that resulted in an error saying the butler had too many commands.
Brainstorm that up and fix later. Neat feature.

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
string sLetOut = GetLocalString(oPC, "RSA_ButLetOut");
string sLetOut2 = GetLocalString(oPC, "RSA_ButLetOut2");
string sDoorOpen = GetLocalString(oPC, "RSA_ButDoorOpen");

string sGuest = GetName(oPC);
object oButler = GetObjectByTag(sButler);
object oWayPoint = GetObjectByTag("POST_"+sButler);
int iDoorOpen = GetLocalInt(oButler, "RSA_Guests");
object oOwner = OBJECT_INVALID;
string sOwner = GetLocalString(oButler, "RSA_Owner");
if (iDoorOpen == 1 || iDoorOpen == 3)
 {
  AssignCommand(oButler, ActionSpeakString(sDoorOpen));
  return;
 }
object oPCsearch = GetFirstPC();
string sPCsearch = "";

//Checks to see if Renter of Suite is still Logged In

while (GetIsObjectValid(oPC))
 {
  sPCsearch = GetName(oPC);
  if (sPCsearch == sOwner)
   {
    oOwner = oPCsearch;
    break;
   }
  oPCsearch = GetNextPC();
 }

//If not, changes message that is said by butler

if (!(GetIsObjectValid(oOwner))) sLetOut = sLetOut2;

AssignCommand(oButler, ClearAllActions());
AssignCommand(oButler, ActionSpeakString(sLetOut));

//Let Renter know that room is being unlocked

SendMessageToPC(oOwner, sGuest+" has requested to leave. The door has been unlocked and opened.");
SetLocked(oDoor, FALSE);
AssignCommand(oButler, ActionOpenDoor(oDoor));

//Sets LocalInt of Butler back to before the Door was locked

SetLocalInt(oButler, "RSA_Guests", 1);
AssignCommand(oButler, ActionMoveToObject(oWayPoint));
AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
}
