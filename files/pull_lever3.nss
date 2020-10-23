//::///////////////////////////////////////////////
//:: Name Pulling a lever to unlock a door
//:: FileName pull_lever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/* Pulling the lever unlocks the door and opens it.
   Pulling it again closes it and locks it.

*/
//:://////////////////////////////////////////////
//:: Created By: Rich Dersheimer
//:: Created On: July 5, 2002
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
object oDoor = GetObjectByTag("STUCKDOOR3"); // assign oDoor the stuck door
object oPC = GetLastUsedBy(); // oPC the player who used the lever
int nLeverState = GetLocalInt(OBJECT_SELF, "Activated"); // get the activated status of the lever

{
    if (nLeverState == 0)
        {
        PlaySound("as_sw_lever1"); // play the lever sound
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        SetLocked(oDoor, FALSE); // unlock the door
        SetLocalInt(OBJECT_SELF, "Activated", 1); // change activated status
        }
        else
        {
        PlaySound("as_sw_lever1"); // play the lever sound
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE); // move the lever
        ActionCloseDoor(oDoor); // close the door
        SetLocked(oDoor, TRUE); // lock the door
        SetLocalInt(OBJECT_SELF, "Activated", 0); // change activated status
        }
}
}
