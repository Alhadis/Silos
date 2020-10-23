//script to remove a concealment effect on exiting a "cover" trigger
#include "nw_i0_spells"

void main()
{
    object oPC = GetExitingObject();

    // Apply the effect
    RemoveSpecificEffect(EFFECT_TYPE_CONCEALMENT,oPC);
    FloatingTextStringOnCreature("Leaving cover",oPC,FALSE);
}
