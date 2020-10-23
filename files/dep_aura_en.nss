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
    int    iLevel   = GetLocalInt(oCreator, DEP_VAR_AURA_CASTLEVEL);
    effect eLink, eVis;

    //SendMessageToPC(oCreator, "Spelllevel: "+IntToString(iLevel)+", AOE Tag: "+GetTag(OBJECT_SELF));
    if(GetFactionEqual(oCreator, oPlayer))
    {
        // +1 regeneration for all 6 levels that oCreator has in the 'healer' class
        if(GetHasSpellEffect(SPELL_HEALER_AURA_REGENERATION, oCreator))
        {
            eVis  = EffectVisualEffect(VFX_IMP_HEAD_NATURE);
            eLink = EffectLinkEffects(EffectRegenerate(FloatToInt(iLevel / AURA_REGENERATION_PER_LEVEL), AURA_REGENERATION_TICK), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

            SignalEvent(oPlayer, EventSpellCastAt(oCreator, SPELL_HEALER_AURA_REGENERATION, FALSE));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPlayer);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
            return;
        }

        // +1 regeneration for all 6 levels that oCreator has in the 'healer' class
        if(GetHasSpellEffect(SPELL_AURA_REGENERATION, oCreator))
        {
            eVis  = EffectVisualEffect(VFX_IMP_HEAD_NATURE);
            eLink = EffectLinkEffects(EffectRegenerate(FloatToInt(iLevel / AURA_REGENERATION_PER_LEVEL), AURA_REGENERATION_TICK), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

            SignalEvent(oPlayer, EventSpellCastAt(oCreator, SPELL_AURA_REGENERATION, FALSE));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPlayer);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
            return;
        }
    }
}
