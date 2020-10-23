//::///////////////////////////////////////////////
//:: No Teleport Trigger OnExit eventscript
//:: prc_noteletrig_b
//::///////////////////////////////////////////////
/** @file
    This file decreases the value of the
    PRC_DISABLE_CREATURE_TELEPORT local integer by
    one on the entering creature.

    @author Ornedan
*/
//:://////////////////////////////////////////////
//:: Created By: Ornedan
//:: Created On: 02.07.2005
//:://////////////////////////////////////////////

#include "prc_inc_teleport"


void main()
{
    object oCreature = GetEnteringObject();
    AllowTeleport(oCreature);
}