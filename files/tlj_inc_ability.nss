// This is an include that contains the functions used for activated abilities.

#include "tlj_inc_generic"

// FUNCTION DECLARATIONS ///////////////////////////////////////////////////////

// Do the Elite Inspiring Aura ability.
// - nSpellId: SPELL_ELITE_INSPIRING_AURA_*
void DoEliteInspiringAura(object oPC, int nSpellId);

// Do the Dreadnought's Unstoppable ability.
void DoDreadnoughtUnstoppable(object oPC);

// Do the Sharpshooter's Trigger Happy ability.
void DoSharpShooterTriggerHappy(object oPC);

// FUNCTION DEFINITIONS ////////////////////////////////////////////////////////

// Subfunction for DoEliteInspiringAura() function
// DC is equal to 10 + combined charisma and constitution modifiers +
// total number of elite class levels, either Dreadnought or Sharpshooter,
// whichever is highest.
int GetEliteInspiringAuraDC(object oPC) {
    int nCha = GetAbilityModifier(ABILITY_CHARISMA, oPC);
    int nCon = GetAbilityModifier(ABILITY_CONSTITUTION, oPC);

    int nDNLevel = GetLevelByClass(CLASS_TYPE_DREADNOUGHT, oPC);
    int nSSLevel = GetLevelByClass(CLASS_TYPE_SHARPSHOOTER, oPC);
    int nLevel = (nDNLevel > nSSLevel) ? nDNLevel : nSSLevel;

    int nDC = 10 + nCha + nCon + nLevel;
    return nDC;
}

// Subfunction for DoEliteInspiringAura() function
// Duration is equal to combined charisma and constitution modifiers of oPC.
float GetEliteInspiringAuraDuration(object oPC) {
    int nCha = GetAbilityModifier(ABILITY_CHARISMA, oPC);
    int nCon = GetAbilityModifier(ABILITY_CONSTITUTION, oPC);
    float fDuration = RoundsToSeconds(nCha + nCon);
    return fDuration;
}

void DoEliteInspiringAura(object oPC, int nSpellId) {
    string sEnterScript = "tlj_elitaur_ent1";

    switch (nSpellId) {
        case SPELL_ELITE_INSPIRING_AURA_I: sEnterScript = "tlj_elitaur_ent1"; break;
        case SPELL_ELITE_INSPIRING_AURA_II: sEnterScript = "tlj_elitaur_ent2"; break;
        case SPELL_ELITE_INSPIRING_AURA_III: sEnterScript = "tlj_elitaur_ent3"; break;
        default: break;
    }

    effect eAura = EffectAreaOfEffect(AOE_MOB_FEAR, sEnterScript, "****", "tlj_elitaur_ext");
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAura, oPC, GetEliteInspiringAuraDuration(oPC));
}

void DoDreadnoughtUnstoppable(object oPC) {
    int nLevel = GetLevelByClass(CLASS_TYPE_DREADNOUGHT, oPC) / 5;
    int nSaves = 1;
    int nHP = 100;

    nSaves += nLevel * 2;
    nHP += nLevel * 200;

    effect eSaves = EffectSavingThrowIncrease(SAVING_THROW_ALL, nSaves);
    effect eHP = EffectTemporaryHitpoints(nHP);
    effect eLink = EffectLinkEffects(eSaves, eHP);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(3));
}

void DoSharpShooterTriggerHappy(object oPC) {
    effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eExtraAtk = EffectModifyAttacks(2);
    effect eLink = EffectLinkEffects(eCessate, eExtraAtk);
    int nDex = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDex));
}

//void main() {}
