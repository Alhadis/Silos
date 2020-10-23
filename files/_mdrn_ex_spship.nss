/*
    Use as on_exit for space area to have PCs of ship appearance enlarged
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
        //Store current appearance, get large appearance, and change to large version
        SetCreatureAppearanceType(oPC,GetLocalInt(oPC,"LargeShip"));

        // Give footsteps back
        SetFootstepType(FOOTSTEP_TYPE_DEFAULT, oPC);
    }
}
