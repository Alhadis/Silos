//::///////////////////////////////////////////////
//:: Name     Create Trap: Deadly
//:: FileName dep_trap_dead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a deadly trap with random, special effects
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
    int    nRounds;
    effect eDamage;

    switch(Random(5)+1)
    {
        case 1:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_FIRE), EffectDamage(d6(16) + 15, DAMAGE_TYPE_FIRE));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_IMPLOSION));
            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_FIREBALL));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_HUGE, eDamage, 34, SAVING_THROW_TYPE_FIRE);
        break;

        case 2:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_ELECTRICAL), EffectDamage(d6(16) + 20, DAMAGE_TYPE_ELECTRICAL));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_COLOSSAL, eDamage, 36, SAVING_THROW_TYPE_ELECTRICITY);
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_COLOSSAL, EffectKnockdown(), 38, SAVING_THROW_TYPE_TRAP, 0.0, GetRandomDelay(10.0, 13.0));
        break;

        case 3:
            eDamage = EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_DIVINE), EffectDamage(d6(13) + 15, DAMAGE_TYPE_DIVINE));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_STRIKE_HOLY));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_MEDIUM, eDamage);
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_MEDIUM, EffectParalyzeVisual(), 35, SAVING_THROW_TYPE_TRAP, 0.0, GetRandomDelay(5.0, 7.0));
        break;

        case 4:
            if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, 42, SAVING_THROW_TYPE_TRAP))
            {
                nRounds = RandomInt(3, 6);

                ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_MULTIBEAM), GetLocation(oTrap), RoundsToSeconds(nRounds));

                oTarget = GetAreaOfEffectObject(GetAreaOfEffectLabel(AOE_PER_MULTIBEAM));
                SetLocalInt(oTarget, DEP_TRAP_TYPE, TRAP_TYPE_DEADLY);
                SetLocalInt(oTarget, DEP_TRAP_ROUNDS, nRounds);
                SetLocalObject(oTarget, DEP_TRAP_OBJECT, oTrap);
                SetLocalObject(oTarget, DEP_TRAP_CREATOR, oCreator);
            }
        break;

        case 5:
            eDamage = EffectLinkEffects(EffectDispelMagicAll(55), EffectVisualEffect(VFX_IMP_BREACH));

            DEP_TrapLocationEffect(GetLocation(oTrap), EffectVisualEffect(VFX_FNF_DISPEL_GREATER));
            DEP_TrapEffect(oTrap, oTarget, RADIUS_SIZE_LARGE, eDamage, 39, SAVING_THROW_TYPE_TRAP);
        break;
    }
}
