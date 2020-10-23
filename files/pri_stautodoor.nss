//::///////////////////////////////////////////////
//:: Counts guests and Open and Closes doors in Suite Room
//:: pri_stautodoor.nss
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script is placed on the Trigger just inside the
Suite door. It has two functions. First it counts how
many guests are in the room. This is done by adding one
to the counter everytime someone comes into the room and
subtracting one for everytime somebody goes to leave the room.

Also this controls the open/close stat of the Suite Doors
so that if guests aren't being allowed the door will be locked
and closed until renter of room goes to leave.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void main()
{
object oPC = GetEnteringObject();
object oTrigger = OBJECT_SELF;

int iNGuests = GetLocalInt(oTrigger, "RSA_NGuests");
int iGuests = GetLocalInt(oTrigger, "RSA_Guests");
int iRenter = GetLocalInt(oPC, "RSA_BoughtSuite");

GetInnArea(oPC);

//This Script only runs if the Butler is allowing Guests

if (GetIsPC(oPC))
{
if (iGuests == 1)
{

 //if Renter exit script so not to add to guest counter

 if (iRenter == 1) return;
 int iEnter = GetLocalInt(oPC, "RSA_Guest");

 //if player not a guest, flag him as guest and add one as counter

 if (iEnter == 0)
 {
  SetLocalInt(oPC, "RSA_Guest", 1);
  iNGuests++;
  SetLocalInt(oTrigger, "RSA_NGuests", iNGuests);
 }

 //if player is a guest, flag him as not a guest and minus one from counter.
 //This is done because player will be crossing trigger again when leaving
 //the room.

 if (iEnter == 1)
 {
  SetLocalInt(oPC, "RSA_Guest", 0);
  iNGuests--;
  SetLocalInt(oTrigger, "RSA_NGuests", iNGuests);
 }
 return;
}
}
//End of Guest Script

//Door Automation

if (GetIsPC(oPC))
{
object oDoor = GetNearestObjectByTag("SuiteRoomDoor");
if (GetLocked(oDoor) == 1)
  {
  SetLocked(oDoor, FALSE);
  ActionOpenDoor(oDoor);
  int nIdx = 0;
  object oDoor = GetNearestObjectByTag("SuiteDoor", OBJECT_SELF, nIdx);
  while (GetIsObjectValid(oDoor))
   {
    ActionCloseDoor(oDoor);
    nIdx++;
    oDoor = GetNearestObjectByTag("SuiteDoor", OBJECT_SELF, nIdx);
   }
  nIdx = 0;
  object oDoor2 = GetNearestObjectByTag("SuiteBedDoor", OBJECT_SELF, nIdx);
  while (GetIsObjectValid(oDoor2))
   {
    ActionCloseDoor(oDoor2);
    SetLocked(oDoor2, FALSE);
    nIdx++;
    oDoor2 = GetNearestObjectByTag("SuiteBedDoor", OBJECT_SELF, nIdx);
   }
  return;
  }
if (GetLocked(oDoor)== 0)
 {
  ActionCloseDoor(oDoor);
  SetLocked(oDoor, TRUE);
 }
}
}
