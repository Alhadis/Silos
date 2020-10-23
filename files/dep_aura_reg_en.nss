//::///////////////////////////////////////////////
//:: Name       General script for aura effects (OnEnter)
//:: FileName   dep_aura_en
//:: Copyright  (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    doxics expansion pack: AOE aura effect (OnEnter)
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: 14.10.2009
//:://////////////////////////////////////////////

#include "dep_inc_spell"

void main()
{
    object oPlayer  = GetEnteringObject();
    object oCreator = GetAreaOfEffectCreator();
    int    iLevel   = GetAuraLevel(oCreator);

    if(GetFactionEqual(oPlayer, oCreator))
    {
        // +1 regeneration for all 6 levels that oCreator has in the 'healer' class
        if(GetHasSpellEffect(SPELL_HEALER_AURA_REGENERATION, oCreator))
        {
            effect eLink = EffectLinkEffects(EffectRegenerate(FloatToInt(iLevel / AURA_REGENERATION_PER_LEVEL), AURA_REGENERATION_TICK), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

            SignalEvent(oPlayer, EventSpellCastAt(oCreator, SPELL_HEALER_AURA_REGENERATION, FALSE));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_NATURE), oPlayer);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
        }

        // default spell aura (similar to healer aura)
        if(GetHasSpellEffect(SPELL_AURA_REGENERATION, oCreator))
        {
            effect eLink = EffectLinkEffects(EffectRegenerate(FloatToInt(iLevel / AURA_REGENERATION_PER_LEVEL), AURA_REGENERATION_TICK), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

            SignalEvent(oPlayer, EventSpellCastAt(oCreator, SPELL_AURA_REGENERATION, FALSE));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_NATURE), oPlayer);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
        }
    }
}
