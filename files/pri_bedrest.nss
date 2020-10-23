//::///////////////////////////////////////////////
//:: Using Beds allow players to rest
//:: pri_richbedrest.nss
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script is called when a player chooses yes
on the ask to rest converstion that beds have. It checks
to see what room the player is in and if they are in the Suite,
it modifies some variables in order for this script to work
properly since the Suite Bed is activited by clicking on not
on using an item.

A Local Variable "RSA_BedUse" is set to 1 so that players rest
is not cancelled. If they object they used to activate the script
was a "BedCot" this variable is set to 2. In the resting scritp,
this will be used for checking if their sleep should be interrupted
by rats, etc. "RSA_BedUse" could be set to 3 as well for resting
in the Suite for other purposes.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void main()
{
object oRoom = OBJECT_SELF;
string sName = GetTag(oRoom);
string sDoor = "RoomDoor";

//If more rooms added with different roomdoor tags, add here

if (sName == "KingSizeBed") sDoor = "SuiteRoomDoor";

//End of different roomdoor tags

object oDoor = GetNearestObjectByTag(sDoor);
object oSleeper = GetLastUsedBy();

//If other beds use a trigger add them to this list as well

if (sName == "KingSizeBed") oSleeper = GetClickingObject();

//End of Trigger list

if (GetIsPC(oSleeper))
 {
  ActionCloseDoor(oDoor);
  SetLocked(oDoor, TRUE);
  SetLocalInt (oSleeper, "RSA_BedUse", 1);

  //Add Different Types of Beds here

  if (sName == "BedCot") SetLocalInt (oSleeper, "RSA_BedUse", iRSA_POORBED);
  if (sName == "KingSizeBed") SetLocalInt (oSleeper, "RSA_BedUse", iRSA_RICHBED);
  if (sName == "Bed") SetLocalInt (oSleeper, "RSA_BedUse", iRSA_NORMBED);
  if (sName == "suitebed")
  {
   object oGuestBed = GetNearestObjectByTag("suitebed", oSleeper);
   DestroyObject(oGuestBed);
   SetLocalInt (oSleeper, "RSA_BedUse", iRSA_NORMBED);
  }

  //End add different types of beds

  AssignCommand(oSleeper, ActionRest());
 }
}
