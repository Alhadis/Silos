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
        effect eProt = CreateProtectionFromAlignmentLink(ALIGNMENT_EVIL);
        effect eGlobe = EffectSpellLevelAbsorption(3, 0);
        effect eDur = EffectVisualEffect(VFX_DUR_GLOBE_MINOR);
        effect eLink = EffectLinkEffects(eProt, eGlobe);
        eLink = EffectLinkEffects(eLink, eDur);
        eLink = EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

        SignalEvent(oPlayer, EventSpellCastAt(oCreator, SPELL_ANKNIGHT_SALBUNG_DEFENSE, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_HOLY), oPlayer);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
    }
}
