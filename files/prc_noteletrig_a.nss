//::///////////////////////////////////////////////
//:: No Teleport Trigger OnEnter eventscript
//:: prc_noteletrig_a
//::///////////////////////////////////////////////
/** @file
    This file increases the value of the
    PRC_DISABLE_CREATURE_TELEPORT local integer by
    one on the entering creature.
*/
//:://////////////////////////////////////////////
//:: Created By: Ornedan
//:: Created On: 02.07.2005
//:://////////////////////////////////////////////

#include "prc_inc_teleport"


void main()
{
    object oCreature = GetEnteringObject();
    DisallowTeleport(oCreature);
}