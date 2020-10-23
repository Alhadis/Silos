//::///////////////////////////////////////////////
//:: Acid Fog: On Enter
//:: NW_S0_AcidFogA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All creatures within the AoE take 2d6 acid damage
    per round and upon entering if they fail a Fort Save
    their movement is halved.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 17, 2001
//:://////////////////////////////////////////////
//:: Updated: October 10, 2009 by doxic
//:://////////////////////////////////////////////

#include "x2_i0_spells"

void main()
{
    // Starting quick metamagic for aoe effects
    QuickMetaMagicStartAOE();

    //Declare major variables
    int nMetaMagic = GetMetaMagic();
    int nDamage;
    effect eDam;
    effect eVis    = EffectVisualEffect(VFX_IMP_ACID_S);
    effect eSlow   = EffectMovementSpeedDecrease(50);
    object oTarget = GetEnteringObject();
    float fDelay   = GetRandomDelay(1.0, 2.2);
    if (spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, GetAreaOfEffectCreator()))
    {
        //Fire cast spell at event for the target
        SignalEvent(oTarget, EventSpellCastAt(GetAreaOfEffectCreator(), SPELL_ACID_FOG));
        //Spell resistance check
        if(!MyResistSpell(GetAreaOfEffectCreator(), oTarget, fDelay))
        {
            //Roll Damage
            //Enter Metamagic conditions
            nDamage = d6(4);
            if (QuickMetaMagicMaximize(nMetaMagic))
            {
                nDamage = 24;//Damage is at max
            }
            else if (QuickMetaMagicEmpower(nMetaMagic))
            {
                nDamage = nDamage + (nDamage/2); //Damage/Healing is +50%
            }
            //Make a Fortitude Save to avoid the effects of the movement hit.
            if(!MySavingThrow(SAVING_THROW_FORT, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_ACID, GetAreaOfEffectCreator(), fDelay))
            {
                //slowing effect
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSlow, oTarget);
                // * BK: Removed this because it reduced damage, didn't make sense nDamage = d6();
            }

            //Set Damage Effect with the modified damage
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
            //Apply damage and visuals
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        }
    }

    // Added by doxic: applying quick metamagic for aoe effects
    QuickMetaMagicApplyAOE();
}
