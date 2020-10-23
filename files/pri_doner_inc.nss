//::///////////////////////////////////////////////
//:: Include file for DoneRoom Triggers
//:: pri_doner_inc
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This is the main code of the DoneRoom Triggers
When a PC steps on the trigger, it checks to see
if the door is unlocked. If it is, it checks to see if
the door should be closed. If it should be, it closes
and locks the door and resets the Variables so that the
room can be rented out again and the right number of
roommates be assigned to that room.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void ClearRoom(string sRoom, string sTrigger)
{
object oPC = GetEnteringObject();
object oTrigger = GetNearestObjectByTag(sTrigger);
int iRoomMates = GetLocalInt(oTrigger, "RSA_RoomMates");

GetInnArea(oPC);

object oInnKeeper = GetObjectByTag(GetLocalString(oPC, "RSA_InnKeeper"));
object oDoor = GetNearestObjectByTag("RoomDoor");
int iFull = GetLocalInt(oInnKeeper, sRoom);

//Check to make sure we don't close the door as soon as we unlock it and other
//people can't trigger closing and locking door unless they own the room or the
//door should have been closed anyways.

if (GetIsPC(oPC) && GetLocked(oDoor) == 0 && iRoomMates == 0)
 {
  iFull--;
  SetLocalInt(oPC, "RSA_BedUse", 0);
  SetLocalInt(oPC, "RSA_HasRoom", 0);
  SetLocalInt(oTrigger, "RSA_RoomMates", 0);
  SetLocalInt(oInnKeeper, sRoom, iFull);
  ActionCloseDoor(oDoor);
  SetLocked(oDoor, TRUE);
 }
}
