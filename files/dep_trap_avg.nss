//::///////////////////////////////////////////////
//:: Name     Create Trap: Average
//:: FileName dep_trap_avg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates an average trap with random, special effects
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: 18.09.2009
//:://////////////////////////////////////////////

#include "dep_inc_trap"
void main()
{
    object oTrap    = OBJECT_SELF;
    object oCreator = GetTrapCreator(OBJECT_SELF);
    object oTarget  = GetEnteringObject();
    effect eDamage;

    switch(d2())
    {
        case 1:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_FIRE), EffectDamage(d6(5) + 15, DAMAGE_TYPE_FIRE));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_FIREBALL));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_HUGE, eDamage, 23, SAVING_THROW_TYPE_FIRE);
        break;

        case 2:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_ELECTRICAL), EffectDamage(d6(5) + 15, DAMAGE_TYPE_ELECTRICAL));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_COLOSSAL, eDamage, 25, SAVING_THROW_TYPE_ELECTRICITY);
        break;
    }
}
