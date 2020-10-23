/*
    Use as on_entered for space area to have PCs of ship appearance miniaturised
    Applied in conjunction with placeable scripts _mdrn_ship_start & _mdrn_ship_end
    to convert PC appearance to a space vehicle.
*/

#include "inc_d20"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsDM(oPC))
        return;

    if (GetIsDMPossessed(oPC))
        return;

    if (GetIsPC(oPC))
    {
        // Make silent
        SetFootstepType(FOOTSTEP_TYPE_NONE, oPC);

        // Get small appearance, and change to small version
        SetCreatureAppearanceType(oPC,GetLocalInt(oPC,"SmallShip"));
    }
}
