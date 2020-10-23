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

void NegativeDamagePerRound(object oTarget)
{
    if(!GetHasSpellEffect(SPELL_SHAMAN_AURA_WILD_SPIRIT, oTarget))
    return;

    effect eDamage = EffectDamage(d10(2), DAMAGE_TYPE_NEGATIVE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);

    DelayCommand(RoundsToSeconds(1), NegativeDamagePerRound(oTarget));
}

void main()
{
    object oPlayer  = GetEnteringObject();
    object oCreator = GetAreaOfEffectCreator();
    int iLevel = GetLevelByClass(CLASS_TYPE_SHAMAN, oCreator);
    effect eLink;

    SendMessageToPC(oPlayer, "Entering "+GetName(oCreator)+"'s wild spirit aura");
    if(GetFactionEqual(oPlayer, oCreator))
    {
        SendMessageToPC(oPlayer, "Getting wild spirit aura pos effect");

        eLink = EffectLinkEffects(eLink, EffectRegenerate(1, 6.0));
        if(iLevel >= 5) eLink = EffectLinkEffects(eLink, EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_ALL));
        if(iLevel >= 20) eLink = EffectLinkEffects(eLink, EffectACIncrease(1, AC_DODGE_BONUS));
        if(iLevel >= 25) eLink = EffectLinkEffects(eLink, EffectAttackIncrease(1));
        if(iLevel >= 30) eLink = EffectLinkEffects(eLink, EffectDamageIncrease(DAMAGE_BONUS_1, DAMAGE_TYPE_DIVINE));

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);
    }
    else if(GetIsReactionTypeHostile(oPlayer, oCreator))
    {
        SendMessageToPC(oPlayer, "Getting wild spirit aura neg effect");

        if(iLevel >= 10) eLink = EffectLinkEffects(eLink, EffectACDecrease(1, AC_DODGE_BONUS));
        if(iLevel >= 15) eLink = EffectLinkEffects(eLink, EffectAttackDecrease(1));

        if(GetIsEffectValid(eLink))
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);

        if(iLevel == 30)
        NegativeDamagePerRound(oPlayer);
    }
}
