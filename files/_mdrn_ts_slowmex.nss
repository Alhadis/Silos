//script to remove a slow effect on exiting a "slow" trigger
#include "nw_i0_spells"

void main()
{
    object oPC = GetExitingObject();

    // Remove the effect
    RemoveSpecificEffect(EFFECT_TYPE_SLOW,oPC);
    if (GetLocalString(OBJECT_SELF,"Message2")!="")
        FloatingTextStringOnCreature(GetLocalString(OBJECT_SELF,"Message2"),oPC,FALSE);
}
