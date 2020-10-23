//::///////////////////////////////////////////////
//:: Name     Create Trap: Strong
//:: FileName dep_trap_str
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a strong trap with random, special effects
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: 18.09.2009
//:://////////////////////////////////////////////

#include "dep_inc_trap"
void main()
{
    object oTrap   = OBJECT_SELF;
    object oTarget = GetEnteringObject();

    effect eDamage;
    switch(d3())
    {
        case 1:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_FIRE), EffectDamage(d6(13) + 15, DAMAGE_TYPE_FIRE));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_IMPLOSION));
            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_FIREBALL));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_HUGE, eDamage, 29, SAVING_THROW_TYPE_FIRE);
        break;

        case 2:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_ELECTRICAL), EffectDamage(d6(13) + 15, DAMAGE_TYPE_ELECTRICAL));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_COLOSSAL, eDamage, 31, SAVING_THROW_TYPE_ELECTRICITY);
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_COLOSSAL, EffectKnockdown(), 33, SAVING_THROW_TYPE_TRAP, 0.0 , GetRandomDelay(TRAP_DURATION_MEDIUM, TRAP_DURATION_LONG));
        break;

        case 3:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_DIVINE), EffectDamage(d6(11) + 15, DAMAGE_TYPE_DIVINE));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_STRIKE_HOLY));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_MEDIUM, eDamage);
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_MEDIUM, EffectParalyzeVisual(), 32, SAVING_THROW_TYPE_TRAP, 0.0, GetRandomDelay(3.0, 6.0));
        break;
    }
}
