//::///////////////////////////////////////////////
//:: Name       Special script for totem effects (OnEnter)
//:: FileName   dep_totem_en
//:: Copyright  (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    doxics expansion pack: AOE totem effect (OnEnter)
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: 14.10.2009
//:://////////////////////////////////////////////

#include "dep_inc_spell"
void ApplyTotemEffects()
{
    object oTotem = OBJECT_SELF;
    object oPlayer = GetEnteringObject();
    object oCreator = GetAreaOfEffectCreator();
    int iLevel = GetAuraLevel(oCreator);
    int iAOE = iLevel < 24 ? AOE_PER_AURA_TOTEM_I : AOE_PER_AURA_TOTEM_II;
    float fRadius = IntToFloat(GetCached2daInt("vfx_persistent", "radius", iAOE));

    SendMessageToPC(oPlayer, "Entering Totem aura: "+FloatToString(fRadius)+", iAOE: "+IntToString(iAOE)+", player creator: "+IntToString(oPlayer == oCreator)+", distance: "+FloatToString(GetDistanceBetween(oPlayer, oTotem))+", radius: "+FloatToString(fRadius));

    if(GetDistanceBetween(oPlayer, oTotem) > fRadius)
    return;

    if(oPlayer == oCreator) {
    SendMessageToPC(oPlayer, "aura totem effect");
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(7179), GetLocalObject(oPlayer, DEP_VAR_TOTEM_OBJECT));
    }
    // Creator is in the totem radius himself, otherwise the totem does not react
    if(GetDistanceBetween(oCreator, oTotem) > fRadius)
    {
        SendMessageToPC(oPlayer, "Creator not available");
        DelayCommand(6.0, ApplyTotemEffects());
    }
    // Entering object is friendly towards creator
    else if(GetFactionEqual(oPlayer, oCreator))
    {
        SendMessageToPC(oPlayer, "Get Totem aura bonus");
        int iBonus = iLevel < 24 ? 1 : 2;
        effect eReg = EffectRegenerate(iBonus, 6.0);
        effect eRW = EffectSavingThrowIncrease(SAVING_THROW_ALL, iBonus, SAVING_THROW_TYPE_ALL);
        effect eSPResist = EffectSpellResistanceIncrease(15 + iBonus * 15);
        effect eLink = EffectLinkEffects(eReg, eRW);

        if(iLevel > 16)
        eLink = EffectLinkEffects(eLink, eSPResist);
        eLink = EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

        SignalEvent(oPlayer, EventSpellCastAt(oCreator, SPELL_SHAMAN_AURA_WILD_SPIRIT, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_ODD), oPlayer);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
    }
}
void main()
{
    ApplyTotemEffects();
}
