//::///////////////////////////////////////////////
//:: Controls Guest access and Resets Suite
//:: pri_sindoneroom.nss
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script performs the same basic functions as
the "pri_reset_inc" scripts does but is specially
designed to work with the Suite since the Suite
has more doors and allows guests.

This script is also used by the oServant to reset
the room properly.

See Comments below for more details.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void main()
{
object oPC = GetEnteringObject();
object oTrigger = GetNearestObjectByTag("SuiteAutoDoor");

int iRenter = GetLocalInt(oPC, "RSA_BoughtSuite");
int iIndx = 0;

GetInnArea(oPC);

string sInnKeeper = GetLocalString(oPC, "RSA_InnKeeper");
string sButler = GetLocalString(oPC, "RSA_Butler");
string sServant = GetLocalString(oPC, "RSA_Servant");
string sButNoLeave = GetLocalString(oPC, "RSA_ButNoLeave");

object oDoor = GetNearestObjectByTag("SuiteRoomDoor");
object oInnKeeper = GetObjectByTag(sInnKeeper);
object oButler = GetObjectByTag(sButler);
object oServant = GetObjectByTag(sServant);
object oWayPoint = GetObjectByTag("POST_"+sButler);
int iGuests = GetLocalInt(oButler, "RSA_Guests");

//If the object is the oServant of the Inn, then tell the Butler inside the Suite
//to close and unlock all the inside doors and then return to Post.

if (GetTag(oPC) == sServant)
 {
  AssignCommand(oServant, ActionWait(1.0));
  AssignCommand(oButler, ClearAllActions());
  object oDoor = GetNearestObjectByTag("SuiteDoor", oButler, iIndx);
  while (GetIsObjectValid(oDoor))
  {
  AssignCommand(oTrigger, ActionCloseDoor(oDoor));
  iIndx++;
  oDoor = GetNearestObjectByTag("SuiteDoor", oButler, iIndx);
  }
  iIndx = 0;
  oDoor = GetNearestObjectByTag("SuiteBedDoor", oButler, iIndx);
  while (GetIsObjectValid(oDoor))
  {
  AssignCommand(oTrigger, ActionCloseDoor(oDoor));
  SetLocked(oDoor, FALSE);
  iIndx++;
  oDoor = GetNearestObjectByTag("SuiteBedDoor", oButler, iIndx);
  }
  int iBedDestroy = 1;
  object oBed = GetNearestObjectByTag("suitebed", oPC, iBedDestroy);
  while (GetIsObjectValid(oBed))
  {
   DestroyObject(oBed);
   iBedDestroy++;
   oBed = GetNearestObjectByTag("suitebed", oPC, iBedDestroy);
  }
  AssignCommand(oButler, ActionMoveToObject(oWayPoint));
  AssignCommand(oButler, ActionDoCommand(SetFacing(GetFacing(oWayPoint))));
  SetLocalInt(oButler, "RSA_HadSleepOver", 0);
  return;
 }

//Checks to See if Guests are allowed and if leaving object is the Renter of the Suite
//If leaving object is, sends the renter back into the room and explains why

if (iGuests > 0 && iRenter > 0)
 {
  AssignCommand(oPC, ClearAllActions());
  AssignCommand(oPC, ActionForceMoveToObject(oButler, TRUE));
  DelayCommand(2.0, AssignCommand(oButler, ActionSpeakString(sButNoLeave)));
  return;
 }

//If room is accepting guests and they are not the owner, exit script so door
//does not get closed and locked.

if (iGuests > 0) return;

//If all other statements are false, the door is open, and this is the
//owners second time on trigger, the door to the suite is closed and locked
//Suite is then reset so that it can be rented out again.

if (GetIsPC(oPC) && GetLocked(oDoor) == 0 || iRenter > 0)
 {
    iRenter--;
    SetLocalInt(oPC, "RSA_BoughtSuite", iRenter);
    if (iRenter <= 0)
    {
     SetLocalInt(oPC, "RSA_BedUse", 0);
     SetLocalInt(oPC, "RSA_HasRoom", 0);
     SetLocalInt(oInnKeeper, "RSA_FullSuite", 0);
     SetLocalInt(oButler, "RSA_HadSleepOver", 0);
     ActionCloseDoor(oDoor);
     SetLocked(oDoor, TRUE);
     int iBedDestroy = 1;
     object oBed = GetNearestObjectByTag("suitebed", oPC, iBedDestroy);
     while (GetIsObjectValid(oBed))
     {
      DestroyObject(oBed);
      iBedDestroy++;
      oBed = GetNearestObjectByTag("suitebed", oPC, iBedDestroy);
     }
    }
 }
}
