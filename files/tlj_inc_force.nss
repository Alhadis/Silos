///////////////////////////////////////////////////////////////////////////////
// These are functions & constants for the force powers.
///////////////////////////////////////////////////////////////////////////////

#include "tlj_inc_generic"

// CONSTANTS ///////////////////////////////////////////////////////////////////

// Weapon wield hex values
const int WEAPON_WIELD_NONE =                       0;
const int WEAPON_WIELD_LIGHTSABER_SIMPLE = 0x00000001;
const int WEAPON_WIELD_LIGHTSABER_GREAT =  0x00000002;
const int WEAPON_WIELD_LIGHTSABER_DUAL =   0x00000004; // This counts for double bladed and dual wielding
const int WEAPON_WIELD_MIX =               0x00000008;
const int WEAPON_WIELD_RANGED =            0x00000010;

// These are the set difficulties
const int FORCE_DC_LIGHTSABER_FORM_1_CONTROL =     8; // Lightsaber Forms
const int FORCE_DC_LIGHTSABER_FORM_1_SENSE =       8;
const int FORCE_DC_LIGHTSABER_FORM_2_CONTROL =    10;
const int FORCE_DC_LIGHTSABER_FORM_2_SENSE =      10;
const int FORCE_DC_LIGHTSABER_FORM_3_CONTROL =    15;
const int FORCE_DC_LIGHTSABER_FORM_3_SENSE =      15;
const int FORCE_DC_LIGHTSABER_FORM_4_CONTROL =    20;
const int FORCE_DC_LIGHTSABER_FORM_4_SENSE =      15;
const int FORCE_DC_LIGHTSABER_FORM_5_CONTROL =    20;
const int FORCE_DC_LIGHTSABER_FORM_5_SENSE =      15;
const int FORCE_DC_LIGHTSABER_FORM_6_CONTROL =    15;
const int FORCE_DC_LIGHTSABER_FORM_6_SENSE =      20;
const int FORCE_DC_LIGHTSABER_FORM_7_CONTROL =    30;
const int FORCE_DC_LIGHTSABER_FORM_7_SENSE =      30;
const int FORCE_DC_LIGHTSABER_FORM_8_CONTROL =    20;
const int FORCE_DC_LIGHTSABER_FORM_8_SENSE =      15;
const int FORCE_DC_LIGHTSABER_FORM_9_CONTROL =    20;
const int FORCE_DC_LIGHTSABER_FORM_9_SENSE =      15;
const int FORCE_DC_LIGHTSABER_FORM_10_CONTROL =   20;
const int FORCE_DC_LIGHTSABER_FORM_10_SENSE =     15;
const int FORCE_DC_LIGHTSABER_FORM_11_CONTROL =   25;
const int FORCE_DC_LIGHTSABER_FORM_11_SENSE =     25;
const int FORCE_DC_REGENERATION_1_CONTROL =   10; // Force Regeneration
const int FORCE_DC_REGENERATION_2_CONTROL =   15;
const int FORCE_DC_REGENERATION_3_CONTROL =   20;
const int FORCE_DC_REGENERATION_4_CONTROL =   25;
const int FORCE_DC_HEAL_1_ALTERATION =        10; // Force Heal
const int FORCE_DC_HEAL_2_ALTERATION =        15;
const int FORCE_DC_HEAL_3_ALTERATION =        20;
const int FORCE_DC_HEAL_4_ALTERATION =        25;
const int FORCE_DC_CLOAK_CONTROL =            25; // Force Cloak
const int FORCE_DC_CLOAK_ALTERATION =         20;
const int FORCE_DC_LIGHTNING_1_ALTERATION =    8; // Force Lightning
const int FORCE_DC_LIGHTNING_2_ALTERATION =   16;
const int FORCE_DC_LIGHTNING_3_ALTERATION =   24;
const int FORCE_DC_STORM_CONTROL =            30; // Force Storm
const int FORCE_DC_STORM_ALTERATION =         30;
const int FORCE_DC_PROTECTION_1_CONTROL =     8; // Force Protection
const int FORCE_DC_PROTECTION_2_CONTROL =     16;
const int FORCE_DC_PROTECTION_3_CONTROL =     24;
const int FORCE_DC_PROTECTION_4_CONTROL =     32;
const int FORCE_DC_VIGOR_1_CONTROL =          16; // Force Vigor
const int FORCE_DC_VIGOR_2_CONTROL =          24;
const int FORCE_DC_SIGHT_1_SENSE =             8; // Force Sight
const int FORCE_DC_SIGHT_2_SENSE =            12;
const int FORCE_DC_SIGHT_3_SENSE =            16;
const int FORCE_DC_FAR_SIGHT_SENSE =          24;
const int FORCE_DC_CORRUPT_1_ALTERATION =     12; // Force Corruption
const int FORCE_DC_CORRUPT_1_SENSE =          10;
const int FORCE_DC_CORRUPT_2_ALTERATION =     15;
const int FORCE_DC_CORRUPT_2_SENSE =          12;
const int FORCE_DC_CORRUPT_3_ALTERATION =     20;
const int FORCE_DC_CORRUPT_3_SENSE =          15;
const int FORCE_DC_TELEKINESIS_1_ALTERATION =  7; // Force Telekinesis
const int FORCE_DC_TELEKINESIS_2_ALTERATION = 10;
const int FORCE_DC_TELEKINESIS_3_ALTERATION = 14;
const int FORCE_DC_TELEKINESIS_4_ALTERATION = 20;
const int FORCE_DC_FURY_CONTROL =             25; // Marauder Fury Ability
const int FORCE_DC_JUMP_CONTROL =             15; // Force Jump
const int FORCE_DC_PERSUASION_SENSE =         25; // Force Persuasion
const int FORCE_DC_PERSUASION_ALTERATION =    25;
const int FORCE_DC_PSYCHOMANCY_1_CONTROL =    10; // Force Psychomancy
const int FORCE_DC_PSYCHOMANCY_1_SENSE =      10;
const int FORCE_DC_PSYCHOMANCY_2_CONTROL =    12;
const int FORCE_DC_PSYCHOMANCY_2_SENSE =      12;
const int FORCE_DC_PSYCHOMANCY_3_CONTROL =    15;
const int FORCE_DC_PSYCHOMANCY_3_SENSE =      15;
const int FORCE_DC_NARCOLEPSY_1_SENSE =       15;
const int FORCE_DC_NARCOLEPSY_1_ALTERATION =  15; // Force Narcolepsy
const int FORCE_DC_NARCOLEPSY_2_SENSE =       20;
const int FORCE_DC_NARCOLEPSY_2_ALTERATION =  20;
const int FORCE_DC_NARCOLEPSY_3_SENSE =       30;
const int FORCE_DC_NARCOLEPSY_3_ALTERATION =  30;
const int FORCE_DC_DISEASE_1_ALTERATION =     20; // Force Disease
const int FORCE_DC_DISEASE_2_ALTERATION =     30;
const int FORCE_DC_DISEASE_3_ALTERATION =     35;
const int FORCE_DC_POISON_ALTERATION =        15; // Force Poison
const int FORCE_DC_RESONANCE_1_CONTROL =       7; // Force Resonance
const int FORCE_DC_RESONANCE_2_CONTROL =      15;
const int FORCE_DC_RESONANCE_3_CONTROL =      30;
const int FORCE_DC_DRAIN_1_ALTERATION =       20; // Force Drain
const int FORCE_DC_DRAIN_1_CONTROL =          10;
const int FORCE_DC_DRAIN_2_ALTERATION =       25;
const int FORCE_DC_DRAIN_2_CONTROL =          12;
const int FORCE_DC_DRAIN_3_ALTERATION =       30;
const int FORCE_DC_DRAIN_3_CONTROL =          15;
const int FORCE_DC_TRANCE_CONTROL =         10; // Force Trance
const int FORCE_DC_SAFEGUARD_CONTROL =        20; // Guardian Safeguard Ability
const int FORCE_DC_SAFEGUARD_SENSE =          15;
const int FORCE_DC_SUPPRESSION_ALTERATION =   20; // Force Suppression
const int FORCE_DC_HORROR_1_ALTERATION =      20; // Force Horror
const int FORCE_DC_HORROR_1_SENSE =           10;
const int FORCE_DC_HORROR_2_ALTERATION =      30;
const int FORCE_DC_HORROR_2_SENSE =           15;
const int FORCE_DC_STUN_1_ALTERATION =        10; // Force Stun
const int FORCE_DC_STUN_2_ALTERATION =        15;
const int FORCE_DC_STUN_3_ALTERATION =        20;
const int FORCE_DC_LIGHT_ALTERATION =         25; // Force Light
const int FORCE_DC_BLINDNESS_ALTERATION =     20; // Force Light


// These are the set force penalties
const int FORCE_COST_LIGHTSABER_FORM_1 =   -2; // Lightsaber Forms
const int FORCE_COST_LIGHTSABER_FORM_2 =   -3;
const int FORCE_COST_LIGHTSABER_FORM_3 =   -5;
const int FORCE_COST_LIGHTSABER_FORM_4 =  -10;
const int FORCE_COST_LIGHTSABER_FORM_5 =  -10;
const int FORCE_COST_LIGHTSABER_FORM_6 =   -5;
const int FORCE_COST_LIGHTSABER_FORM_7 =  -30;
const int FORCE_COST_LIGHTSABER_FORM_8 =  -12;
const int FORCE_COST_LIGHTSABER_FORM_9 =   -8;
const int FORCE_COST_LIGHTSABER_FORM_10 = -10;
const int FORCE_COST_LIGHTSABER_FORM_11 = -30;
const int FORCE_COST_REGENERATION_1 =  -2; // Force Regeneration
const int FORCE_COST_REGENERATION_2 =  -4;
const int FORCE_COST_REGENERATION_3 =  -6;
const int FORCE_COST_REGENERATION_4 =  -8;
const int FORCE_COST_HEAL_1 =          -4; // Force Heal
const int FORCE_COST_HEAL_2 =          -6;
const int FORCE_COST_HEAL_3 =         -10;
const int FORCE_COST_HEAL_4 =         -16;
const int FORCE_COST_CLOAK =          -16; // Force Cloak
const int FORCE_COST_LIGHTNING_1 =    -12; // Force Lightning
const int FORCE_COST_LIGHTNING_2 =    -20;
const int FORCE_COST_LIGHTNING_3 =    -28;
const int FORCE_COST_STORM =          -50; // Force Storm
const int FORCE_COST_PROTECTION_1 =   -20; // Force Protection
const int FORCE_COST_PROTECTION_2 =   -25;
const int FORCE_COST_PROTECTION_3 =   -30;
const int FORCE_COST_PROTECTION_4 =   -35;
const int FORCE_COST_VIGOR_1 =         -8; // Force Vigor
const int FORCE_COST_VIGOR_2 =        -10;
const int FORCE_COST_SIGHT_1 =         -1; // Force Sight
const int FORCE_COST_SIGHT_2 =         -5;
const int FORCE_COST_SIGHT_3 =        -10;
const int FORCE_COST_FAR_SIGHT =      -15;
const int FORCE_COST_CORRUPT_1 =       -2; // Force Corruption
const int FORCE_COST_CORRUPT_2 =       -3;
const int FORCE_COST_CORRUPT_3 =       -5;
const int FORCE_COST_TELEKINESIS_1 =   -1; // Force Telekinesis
const int FORCE_COST_TELEKINESIS_2 =   -4;
const int FORCE_COST_TELEKINESIS_3 =   -7;
const int FORCE_COST_TELEKINESIS_4 =  -10;
const int FORCE_COST_FURY =           -20; // Marauder Fury Ability
const int FORCE_COST_JUMP =            -6; // Force Jump
const int FORCE_COST_PERSUASION =      -5; // Force Persuasion
const int FORCE_COST_PSYCHOMANCY_1 =   -2; // Force Psychomancy
const int FORCE_COST_PSYCHOMANCY_2 =   -3;
const int FORCE_COST_PSYCHOMANCY_3 =   -5;
const int FORCE_COST_NARCOLEPSY_1 =    -6; // Force Narcolepsy
const int FORCE_COST_NARCOLEPSY_2 =   -10;
const int FORCE_COST_NARCOLEPSY_3 =   -18;
const int FORCE_COST_DISEASE_1 =       -8; // Force Disease
const int FORCE_COST_DISEASE_2 =      -25;
const int FORCE_COST_DISEASE_3 =      -50;
const int FORCE_COST_POISON =          -5; // Force Poison
const int FORCE_COST_RESONANCE_1 =     -5; // Force Resonance
const int FORCE_COST_RESONANCE_2 =    -10;
const int FORCE_COST_RESONANCE_3 =    -15;
const int FORCE_COST_DRAIN_1 =         -3; // Force Drain
const int FORCE_COST_DRAIN_2 =         -6;
const int FORCE_COST_DRAIN_3 =         -9;
const int FORCE_COST_TRANCE =          -1; // Force Trance
const int FORCE_COST_SAFEGUARD =      -20; // Guardian Safeguard ability
const int FORCE_COST_SUPPRESSION =     -5; // Force Suppression
const int FORCE_COST_HORROR_1 =        -7; // Force Horror
const int FORCE_COST_HORROR_2 =       -14;
const int FORCE_COST_STUN_1 =          -7; // Force Stun
const int FORCE_COST_STUN_2 =         -14;
const int FORCE_COST_STUN_3 =         -21;
const int FORCE_COST_LIGHT =          -25; // Force Light
const int FORCE_COST_BLINDNESS =       -7; // Force Blindness

// FUNCTION DECLARATIONS////////////////////////////////////////////////////////

// Get the amount of force that oPC currently has
int GetForce(object oPC=OBJECT_SELF);

// Set oPC's force reserve to nAmount.
void SetForce(int nAmount, object oPC=OBJECT_SELF);

// Restore the force to the caller.
void RestoreForce();

// This returns the maximum possible amount of force from oPC
int GetMaxForce(object oPC=OBJECT_SELF);

// Use this function to recalculate the maximum force reserve for oPC
// in the event of a level up or level drain.
void RecalculateMaxForce(object oPC=OBJECT_SELF);

// This function returns TRUE if nForceCost exceeds oPC's force reserve.
int ForceCostExceedsForceReserve(int nForceCost, object oPC=OBJECT_SELF);

// Returns the save DC which is equal to 20 + Power Tier +
// Wisdom Modifier + any Force Focus feats.
int GetForceSaveDC(int nPowerTier);

// This adjusts nDamage done to oTarget by taking the Jedi Consular's
// Force Absorption ability into account.
int GetAbsorptionAdjustedDamage(int nDamage, object oTarget);

// Returns TRUE if oPC is a jedi
int GetIsLightSide(object oPC);

// Returns TRUE if oPC is a Sith
int GetIsDarkSide(object oPC);

// Returns TRUE if oObject is immune to a force power of nPowerTier and nSaveAgainst.
// - nSaveAgainst:
//   -> 1: Paralysis
//   -> 2: Stun
//   -> 3: Fear
//   -> 4: Mind Affecting
int IsImmuneToForcePower(int nPowerTier, int nSaveAgainst, object oTarget, object oSource=OBJECT_SELF);

// This function calculates an adjustment in the caller's force reserve
// - nAdjust: +- the amount that is to be adjusted
// - nDarkLight: the type of force power that was just used
// 0 = Neutral
// 1 = Light
// 2 = Dark
void ForceReserveAdjustment(int nAdjust, int nDarkLight=0);

void LightsaberFormForceAdjustment(int nAdjust);

// This is only used inside ForceRecovery() and InnitiateForceRecovery()
// It returns the interval duration at which ForceRecovery() activates.
float GetForceRecoverySpeed(object oPC);

// Innitiate the recovery of force
void InnitiateForceRecovery();

// The caller performs Force Push
// - nPowerTier:
//   -> 2: Single target
//   -> 3: Multiple targets in 60 degree cone shape infront of caller
//   -> 4: All targets within a sphere shape of the caller
void ForcePush(int nPowerTier);

// This returns one of the WEAPON_WIELD_* constants.
int GetWeaponWieldType(object oPC=OBJECT_SELF);

// Check if the caller has changed to an invalid weapon for the
// currently active lightsaber form. Deactivate if it is.
void LightsaberFormWeaponChange();

// Deactivate the currently active Lightsaber Form
void DeactivateLightsaberForm();

// Deactivate a Force Power with nSpellId
void DeactivatePower(int nSpellId);

// Returns TRUE if the force power of nSpellId is active on oPC
int IsPowerActive(int nSpellId, object oPC=OBJECT_SELF);

// Return a penalty effect on the force related skills.
// - nAll: A penalty to all three skills
// - fDuration: If left at 0.0 then the effect will be permanent.
effect ForceSkillPenalty(int nAll, int nAlteration=0, int nControl=0, int nSense=0);

// This is a wrapper around GetIsSkillSuccessful() function but takes into
// consideration the caller's force reserve for the DC.
int ForceSkillCheck(int nSkill, int nForceDC, object oPC=OBJECT_SELF);

// Make the caller do a lightsaber form (1-11)
void LightsaberForm(int nFormType);

// The caller performs Force Regeneration
void ForceRegeneration(int nPowerTier);

// The caller performs Force Heal
void ForceHeal(int nPowerTier);

// The caller performs Force Cloak
void ForceCloak();

// Retrieve the vector needed to create the lightning emitter for the ForceStorm() function.
// This looks up the gender and appearance type of caller and calculates the position.
vector GetForceStormEmitterVector();

// This is used in the ForceStorm() function. It creates a random
// vector near the caller and makes oEmitter shoot an electric bolt at it.
void ForceStormLightning(object oEmitter);

// This is used in the ForceStorm() function. It creates a random
// vector near the caller and zaps it.
void ForceStormLightningBlast();

// This is used in the ForceStorm() function. It loops through all PCs and
// enemies near the caller and performs electrical damage on them.
void ForceStormLightningDamage();

// The caller performs Force Storm.
// Be warned, this function puts a heavy use on electric effects
void ForceStorm();

// Make the caller perform Force Lightning
void ForceLightning(int nPowerTier);

// Make the caller perform Force Protection
void ForceProtection(int nPowerTier);

// Make the caller perform Force Vigor
void ForceVigor(int nPowerTier);

// Make the caller perform Force Sight
void ForceSight(int nPowerTier);

// Make the caller perform Force corruption
void ForceCorruption(int nPowerTier);

// Make the caller disarm a target with Force Telekinesis
void ForceTelekinesisDisarm();

// Move oItem to lLocation
void MoveItemToLocation(object oItem, location lLocation);

// Move oPlaceable to lLocation
void MovePlaceableToLocation(object oPlaceable, location lLocation);

// Make the caller move an object with Force Telekinesis
void ForceTelekinesisMoveObject();

// Make the caller perform the Sith Marauder Fury ability
void MarauderFury();

// Make the caller perform force jump
void ForceJump();

// Make the caller perform force persuasion
void ForcePersuasion();

// Make the caller perform force psychomancy
void ForcePsychomancy(int nPowerTier);

// Make the caller perform Force Divination
void ForceDivination(int nPowerTier);

// This is used inside of ForceDivination() function
void Divination(int nPowerTier);

// This shuts off the meditative state for Force Divination
void DeactivateDivination();

// Make the caller perform Force Narcolepsy
void ForceNarcolepsy(int nPowerTier);

// Make the caller perform Force Disease
void ForceDisease(int nPowerTier);

// Make the caller perform Force Choke
void ForceChoke();

// This stops the loop in Force Choke
void StopForceChoke();

// Make the caller perform Force Resonance
void ForceResonance(int nPowerTier);

// Make the caller perform Force Drain
void ForceDrain(int nPowerTier);

// Make the caller perform Force Trance
void ForceTrance();

// This stops the delayed command for ForceTrance() function
void StopForceTrance();

// Make the caller perform the Guardian Safeguard ability
void GuardianSafeguard();

// Make the caller perform Force Suppression
void ForceSuppression();

// Make the caller perform Force Horror
void ForceHorror(int nPowerTier);

// Make the caller perform Force Stun
void ForceStun(int nPowerTier);

// Make the caller perform Force Light
void ForceLight();

// Make the caller perform Lightsaber Levitation
void ForceTelekinesisLevitateLightsaber();

// Make the caller perform Force Body
void ForceBody(int nPowerTier);

// Make the caller perform Force Blindness
void ForceBlindness();

// Make the caller perform Force Far Sight
void ForceFarSight();

// Function Definitions/////////////////////////////////////////////////////////

int GetForce(object oPC=OBJECT_SELF) {
    int nForce = GetLocalInt(oPC, "FORCE_RESERVE");
    if (nForce == 0) nForce = GetMaxForce(oPC);
    return nForce;
}

void SetForce(int nAmount, object oPC=OBJECT_SELF) {
    int nMax = GetMaxForce(oPC);
    if (nAmount == nMax) FloatingTextStringOnCreature("Your connection to the force has been restored.", oPC, FALSE);
    else if (nAmount > nMax) nAmount = nMax;
    else if (nAmount <= 0) nAmount = 1;
    SetLocalInt(oPC, "FORCE_RESERVE", nAmount);
}

int GetMaxForce(object oPC=OBJECT_SELF) {
    int nForce = GetLocalInt(oPC, "MAX_FORCE_RESERVE");
    if (nForce == 0) {
        int i, nClass;
        for(i = 1; i <= 3; i++) {
            nClass = GetClassByPosition(i, oPC);
            switch(nClass) {
                case CLASS_TYPE_JEDI_GUARDIAN:
                case CLASS_TYPE_SITH_MARAUDER: nForce += GetLevelByClass(nClass, oPC) * 6; break;
                case CLASS_TYPE_JEDI_SENTINEL:
                case CLASS_TYPE_SITH_ASSASSIN: nForce += GetLevelByClass(nClass, oPC) * 10; break;
                case CLASS_TYPE_JEDI_CONSULAR:
                case CLASS_TYPE_SITH_CONSULAR: nForce += GetLevelByClass(nClass, oPC) * 12; break;
            }
        }
        // Calculate the force feat bonuses
        if (GetHasFeat(FEAT_FORCE_SYMBIOSIS)) nForce += nForce / 2; // 50% increase
        else if (GetHasFeat(FEAT_FORCE_AFFINITY)) nForce += nForce / 4; // 25% increase
        SetLocalInt(oPC, "MAX_FORCE_RESERVE", nForce);
    }
    return nForce;
}

void RecalculateMaxForce(object oPC=OBJECT_SELF) {
    DeleteLocalInt(oPC, "MAX_FORCE_RESERVE");
}

void RestoreForce() {
    SetForce(GetMaxForce());
}

int ForceStrengthCheck(object oPC, object oTarget) {
    int nFocus;
    // Get the bonus from the force focus feats
    if (GetHasFeat(FEAT_FORCE_FOCUS_4, oPC)) nFocus = 8;
    else if (GetHasFeat(FEAT_FORCE_FOCUS_3, oPC)) nFocus = 6;
    else if (GetHasFeat(FEAT_FORCE_FOCUS_2, oPC)) nFocus = 4;
    else if (GetHasFeat(FEAT_FORCE_FOCUS_1, oPC)) nFocus = 2;
    if (StrengthCheck(oTarget, 12 + nFocus)) {
        SendMessageToPC(oTarget, "Resisted.");
        SendMessageToPC(oPC, GetName(oTarget) + " resisted.");
        return TRUE;
    }
    return FALSE;
}

int ForceCostExceedsForceReserve(int nForceCost, object oPC=OBJECT_SELF) {
    if (GetForce(oPC) + nForceCost <= 0) {
        FloatingTextStringOnCreature("Force reserve too low.", oPC, FALSE);
        return TRUE;
    }
    return FALSE;
}

// Adjust the DCs for force powers once again to
// 20 base + power tier*4 + wisdom modifier + force focus feats
int GetForceSaveDC(int nPowerTier) {
    int nFocus;
    // Get the bonus from the force focus feats
    if (GetHasFeat(FEAT_FORCE_FOCUS_4, OBJECT_SELF)) nFocus = 8;
    else if (GetHasFeat(FEAT_FORCE_FOCUS_3, OBJECT_SELF)) nFocus = 6;
    else if (GetHasFeat(FEAT_FORCE_FOCUS_2, OBJECT_SELF)) nFocus = 4;
    else if (GetHasFeat(FEAT_FORCE_FOCUS_1, OBJECT_SELF)) nFocus = 2;
    // Add the DC together
    int nDC = 20 + nPowerTier * 5 + GetAbilityModifier(ABILITY_WISDOM, OBJECT_SELF) + nFocus;
    return nDC;
}

int GetAbsorptionAdjustedDamage(int nDamage, object oTarget) {
    int nAdjusted = nDamage;
    int nRestore;

    if (GetHasFeat(FEAT_FORCE_ABSORPTION_3, oTarget)) {
        nRestore = nDamage / 2;
    }
    else if (GetHasFeat(FEAT_FORCE_ABSORPTION_2, oTarget)) {
        nRestore = nDamage / 4;
    }
    else if (GetHasFeat(FEAT_FORCE_ABSORPTION_1, oTarget)) {
        nRestore = nDamage / 10;
    }
    else return nAdjusted;

    int nForce = GetForce(oTarget);
    if (ForceSkillCheck(SKILL_CONTROL, nDamage, oTarget)) {
        nAdjusted = 0;
        if (nForce < nRestore) nRestore = nForce;
        SetForce(nForce + nRestore, oTarget);
    }
    return nAdjusted;
}

int GetIsLightSide(object oPC) {
    if ((GetLevelByClass(CLASS_TYPE_JEDI_GUARDIAN, oPC) > 0) ||
        (GetLevelByClass(CLASS_TYPE_JEDI_SENTINEL, oPC) > 0) ||
        (GetLevelByClass(CLASS_TYPE_JEDI_CONSULAR, oPC) > 0)) {
        return TRUE;
    }
    return FALSE;
}

int GetIsDarkSide(object oPC) {
    if (GetLevelByClass(CLASS_TYPE_SITH_MARAUDER, oPC) > 0 ||
        GetLevelByClass(CLASS_TYPE_SITH_ASSASSIN, oPC) > 0 ||
        GetLevelByClass(CLASS_TYPE_SITH_CONSULAR, oPC) > 0) {
        return TRUE;
    }
    return FALSE;
}

int IsImmuneToForcePower(int nPowerTier, int nSaveAgainst, object oTarget, object oSource=OBJECT_SELF) {
    int bImmune;

    // Paralysis
    if (nSaveAgainst == 1) {
        if (GetHasFeat(FEAT_FORCE_CONDITIONING_3, oTarget)) {
            SendMessageToPC(oSource, "Target is immune to paralysis.");
            SendMessageToPC(oTarget, "Immune to paralysis.");
            bImmune = TRUE;
        }
    }
    else {
        int nResonance;
        switch (nPowerTier) {
            case 1: nResonance = SPELL_FORCE_RESONANCE_1; break;
            case 2: nResonance = SPELL_FORCE_RESONANCE_2; break;
            case 3: nResonance = SPELL_FORCE_RESONANCE_3; break;
        }
        // Stun
        if (nSaveAgainst == 2) {
            if (IsPowerActive(nResonance, oTarget) || GetHasFeat(FEAT_FORCE_CONDITIONING_2, oTarget) || GetRacialType(oTarget) == RACIAL_TYPE_DROID) {
                SendMessageToPC(oSource, "Target is immune to stun.");
                SendMessageToPC(oTarget, "Immune to stun.");
                bImmune = TRUE;
            }
        }
        // Fear
        else if (nSaveAgainst == 3) {
            if (IsPowerActive(nResonance, oTarget) || GetHasFeat(FEAT_FORCE_CONDITIONING_1, oTarget)) {
                SendMessageToPC(oSource, "Target is immune to fear.");
                SendMessageToPC(oTarget, "Immune to fear.");
                bImmune = TRUE;
            }
        }
        // Mind Affecting
        if (nSaveAgainst == 4) {
            if (IsPowerActive(nResonance, oTarget) || GetHasFeat(FEAT_FORCE_CONDITIONING_4, oTarget) || GetRacialType(oTarget) == RACIAL_TYPE_DROID) {
                SendMessageToPC(oSource, "Target is immune to mind affecting.");
                SendMessageToPC(oTarget, "Immune to mind affecting.");
                bImmune = TRUE;
            }
        }
    }
    return bImmune;
}

// This is a loop that is activated inside of InnitiateForceRecovery().
void ForceRecovery() {
    int nForce = GetForce();
    if (nForce < GetMaxForce()) {
        nForce++;
        //SpeakString("Recovering fatigue... " + IntToString(nFatigue));
        SetForce(nForce);
        DelayCommand(GetForceRecoverySpeed(OBJECT_SELF), ForceRecovery());
    }
    else {
        DeleteLocalInt(OBJECT_SELF, "FORCE_RECOVERY_ACTIVE");
    }
}

void InnitiateForceRecovery() {
    if (!GetLocalInt(OBJECT_SELF, "FORCE_RECOVERY_ACTIVE")) {
        if (GetForce() < GetMaxForce()) {
            SetLocalInt(OBJECT_SELF, "FORCE_RECOVERY_ACTIVE", TRUE);
            DelayCommand(GetForceRecoverySpeed(OBJECT_SELF), ForceRecovery());
        }
    }
}

void ForceReserveAdjustment(int nAdjust, int nDarkLight=0) {
    if (nAdjust == 0) return;

    int bPenalty;
    int nForce = GetForce();
    if (nAdjust < 0) bPenalty = TRUE;

    // Calculate the lightside/darkside penalty
    // 1 point penalty per 5 points towards the opposite alignment
    int nAlignmentPenalty;
    if (nDarkLight == 1) { // Light side
        nAlignmentPenalty = (100 - GetGoodEvilValue(OBJECT_SELF)) / 5;
    }
    else if (nDarkLight == 2) { // Dark side
         nAlignmentPenalty = GetGoodEvilValue(OBJECT_SELF) / 5;
    }
    if (bPenalty) nAlignmentPenalty *= -1;
    nAdjust += nAlignmentPenalty;

    // If we are recovering the we should apply the adjustment and exit out now.
    if (!bPenalty) {
        SetForce(nForce + nAdjust);
    }
    else {
        // Force body adjustment
        int nForceBody = GetLocalInt(OBJECT_SELF, "FORCE_BODY");
        if (nForceBody > 0) {
            effect eDamage = EffectDamage(abs(nAdjust) * 2, DAMAGE_TYPE_DARKSIDE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF);
            switch (nForceBody) {
                case 3: nAdjust /= 4; break;
                case 2: nAdjust /= 3; break;
                case 1: nAdjust /= 2; break;
            }
        }
        if (nAdjust >= 0) nAdjust = -1;
        SetForce(nForce + nAdjust);
    }

    // Start recovering fatigue
    InnitiateForceRecovery();
}

void LightsaberFormForceAdjustment(int nAdjust) {
    // Reduce the penalty based on weapon master feats
    if (GetHasFeat(FEAT_LIGHTSABER_FORM_MASTERY))
        nAdjust *= 3 / 4;
    if (nAdjust == 0) nAdjust = -1;
    ForceReserveAdjustment(nAdjust);
}

float GetForceRecoverySpeed(object oPC) {
    float fSpeed;
    if (GetHasFeat(FEAT_JEDI_HARMONIE_FLUX_2, oPC)) fSpeed = 4.0;
    else if (GetHasFeat(FEAT_JEDI_HARMONIE_FLUX_1, oPC)) fSpeed = 5.0;
    else fSpeed = 6.0;
    if (GetIsInCombat(oPC)) fSpeed *= 3.0;
    return fSpeed;
}

void ForcePush(int nPowerTier) {

    // Variable declaration
    object oTarget = GetSpellTargetObject();
    location lTarget = GetSpellTargetLocation();
    int nForceDC, nDice, nForceCost, nTargetStr, nShape;
    float fSize, fAngle;
    float fMaxDistance = IntToFloat(GetAbilityModifier(ABILITY_WISDOM) * 3);
    float fTargetDistance;
    effect eVisual = EffectVisualEffect(VFX_IMP_MAGBLUE);
    effect eKnock = EffectKnockdown();
    effect eDamage;
    vector vSelf = GetPosition(OBJECT_SELF);
    vector vPushed;

    // Look up the type of Push used (I-IV)
    // Each type does something different
    switch (nPowerTier) {
        case 2: nForceDC = FORCE_DC_TELEKINESIS_2_ALTERATION; nDice = 1; nForceCost = FORCE_COST_TELEKINESIS_2; break;
        case 3: nForceDC = FORCE_DC_TELEKINESIS_3_ALTERATION; nDice = 2; nForceCost = FORCE_COST_TELEKINESIS_3; fSize = fMaxDistance; nShape = SHAPE_SPELLCONE; break;
        case 4: nForceDC = FORCE_DC_TELEKINESIS_4_ALTERATION; nDice = 4; nForceCost = FORCE_COST_TELEKINESIS_4; fSize = fMaxDistance; nShape = SHAPE_SPHERE; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDC)) {

        // For single targets
        if (nPowerTier == 2) {

            // Can only effect targets within a certain distance
            fTargetDistance = GetDistanceBetween(OBJECT_SELF, oTarget);
            if (fTargetDistance < fMaxDistance) {

                // Signal that we're doing a hostile action
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));

                // Do the strength check on the target against a push mod of 12.
                if (!ForceStrengthCheck(OBJECT_SELF, oTarget)) {
                    // Do the visual on the target
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);

                    // Throw the target away from the PC
                    fAngle = VectorToAngle(GetPosition(oTarget) - vSelf);
                    vPushed = vSelf + ((5.0 + fTargetDistance) * AngleToVector(fAngle));
                    location lPushed = Location(GetArea(OBJECT_SELF), vPushed, fAngle - 180);
                    AssignCommand(oTarget, ClearAllActions(TRUE));
                    DelayCommand(0.2, AssignCommand(oTarget, ActionJumpToLocation(lPushed)));

                    // Do the knockdown & damage
                    eDamage = EffectDamage(d20(nDice), DAMAGE_TYPE_BLUDGEONING);
                    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oTarget, 9.0));
                    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                    if (IsConcentrating(oTarget)) {
                        DelayCommand(0.4, AssignCommand(oTarget, BreakConcentration(0, TRUE)));
                    }
                }
            }
        }

        // For area effect targeting
        else {
            // More Variable declaration
            location lSelf = GetLocation(OBJECT_SELF);
            float fDelay;
            effect eWind = EffectVisualEffect(VFX_IMP_PULSE_WIND);
            effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);

            // Do a wind & shake visual on the force user
            if (nPowerTier == 4) ApplyEffectToObject(DURATION_TYPE_INSTANT, eWind, OBJECT_SELF);
            DelayCommand(0.05, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, OBJECT_SELF, 0.5));

            // Cycle through targets within the area of effect
            oTarget = GetFirstObjectInShape(nShape, fSize, lSelf, TRUE, OBJECT_TYPE_CREATURE);
            while (GetIsObjectValid(oTarget)) {

                // Only PCs or hostile NPCs may be effected
                if (oTarget != OBJECT_SELF && !GetIsDead(oTarget) && (GetIsReactionTypeHostile(oTarget, OBJECT_SELF) || GetIsPC(oTarget))) {

                    // If a PC, Do a shake on the target
                    if (GetIsPC(oTarget)) ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oTarget, 0.5);

                    // Signal that we're doing a hostile action
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));

                    // Do the strength check on the target against a push mod of 12
                    if(!ForceStrengthCheck(OBJECT_SELF, oTarget)) {

                        // Calculate the duration by the distance of the target from the force user
                        fDelay = fTargetDistance/20.0;

                        // Do the visual on the target
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget));

                        // Throw the target away from the PC
                        fAngle = VectorToAngle(GetPosition(oTarget) - vSelf);
                        vPushed = vSelf + ((5.0 + fTargetDistance) * AngleToVector(fAngle));
                        location lPushed = Location(GetArea(OBJECT_SELF), vPushed, fAngle - 180);
                        DelayCommand(fDelay, AssignCommand(oTarget, ClearAllActions(TRUE)));
                        DelayCommand(fDelay + 0.2, AssignCommand(oTarget, ActionJumpToLocation(lPushed)));

                        // Do the damage & knockdown
                        eDamage = EffectDamage(d20(nDice),DAMAGE_TYPE_BLUDGEONING);
                        DelayCommand(fDelay + 0.4, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oTarget, 9.0));
                        DelayCommand(fDelay + 0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                        if (IsConcentrating(oTarget)) {
                            DelayCommand(fDelay + 0.4, AssignCommand(oTarget, BreakConcentration(0, TRUE)));
                        }
                    }
                }
                oTarget = GetNextObjectInShape(nShape, fSize, lSelf, TRUE, OBJECT_TYPE_CREATURE);
            }
        }
        // Handle the force cost
        ForceReserveAdjustment(nForceCost);
    }
}

int GetWeaponWieldType(object oPC=OBJECT_SELF) {

    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    int nRightType = GetBaseItemType(oRight);
    int nLeftType = GetBaseItemType(oLeft);
    int nWield;

    if (GetIsObjectValid(oRight)) {
        if (GetWeaponRanged(oRight)) {
            nWield = WEAPON_WIELD_RANGED;
        }
        else {
            switch (nRightType) {
                case BASE_ITEM_LIGHTSABER: nWield = WEAPON_WIELD_LIGHTSABER_SIMPLE; break;
                case BASE_ITEM_GREAT_LIGHTSABER: nWield = nWield | WEAPON_WIELD_LIGHTSABER_GREAT; break;
                case BASE_ITEM_DOUBLE_LIGHTSABER: nWield = nWield | WEAPON_WIELD_LIGHTSABER_DUAL; break;
            }
            if (GetIsObjectValid(oLeft)) {
                nWield = nWield | WEAPON_WIELD_LIGHTSABER_DUAL;
                if (nLeftType != nRightType) nWield = nWield | WEAPON_WIELD_MIX;
            }
        }
    }
    return nWield;
}

void LightsaberFormWeaponChange() {
    int nRequiredWeaponWield = GetLocalInt(OBJECT_SELF, "LIGHTSABER_FORM_WEAPON_WIELD");
    int nCurrentWeaponWield = GetWeaponWieldType();

    // If we're wielding a ranged weapon OR if we're not using fists AND we're
    // wielding a weapon that's not compatible with the lightsaber form, then...
    if ((nCurrentWeaponWield & WEAPON_WIELD_RANGED) ||
        (nRequiredWeaponWield != WEAPON_WIELD_NONE && !(nRequiredWeaponWield & nCurrentWeaponWield))) {

        // ...deactivate the lightsaber form.
        DeactivateLightsaberForm();
    }
}

void DeactivateLightsaberForm() {
    effect eEffect = GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eEffect)) {
        switch (GetEffectSpellId(eEffect)) {
            case SPELL_LIGHTSABER_FORM_1:
            case SPELL_LIGHTSABER_FORM_2:
            case SPELL_LIGHTSABER_FORM_3:
            case SPELL_LIGHTSABER_FORM_4:
            case SPELL_LIGHTSABER_FORM_5:
            case SPELL_LIGHTSABER_FORM_6:
            case SPELL_LIGHTSABER_FORM_7:
            case SPELL_LIGHTSABER_FORM_8:
            case SPELL_LIGHTSABER_FORM_9:
            case SPELL_LIGHTSABER_FORM_10:
            case SPELL_LIGHTSABER_FORM_11: RemoveEffect(OBJECT_SELF, eEffect); break;
        }
        eEffect = GetNextEffect(OBJECT_SELF);
    }
    DeleteLocalInt(OBJECT_SELF, "LIGHTSABER_FORM_WEAPON_WIELD");

    // Update blaster bolt deflection properties
    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
    SetBlasterBoltDeflectRange(OBJECT_SELF, 0.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);

    //reset phenotype to normal
    SetPhenoType(PHENOTYPE_NORMAL);
}

void DeactivatePower(int nSpellId) {
    if(nSpellId != 0) {
        effect ePower = GetFirstEffect(OBJECT_SELF);
        while (GetIsEffectValid(ePower)) {
            if (GetEffectSpellId(ePower) == nSpellId) {
                RemoveEffect(OBJECT_SELF, ePower);
                FloatingTextStringOnCreature("Power deactivated", OBJECT_SELF, FALSE);
                break;
            }
            ePower = GetNextEffect(OBJECT_SELF);
        }
    }
}

int IsPowerActive(int nSpellId, object oPC=OBJECT_SELF) {
    effect ePower = GetFirstEffect(oPC);
    while (GetIsEffectValid(ePower)) {
        if(GetEffectSpellId(ePower) == nSpellId) {
            return TRUE;
        }
        ePower = GetNextEffect(oPC);
    }
    return FALSE;
}

effect ForceSkillPenalty(int nAll, int nAlteration=0, int nControl=0, int nSense=0) {
    effect ePenalty;
    if (nAll != 0) {
        nAlteration = nAll;
        nControl = nAll;
        nSense = nAll;
    }
    if (nAlteration != 0) {
        effect eAlteration = EffectSkillDecrease(SKILL_ALTERATION, nAlteration);
        ePenalty = EffectLinkEffects(ePenalty, eAlteration);
    }
    if (nControl != 0) {
        effect eControl = EffectSkillDecrease(SKILL_CONTROL, nAlteration);
        ePenalty = EffectLinkEffects(ePenalty, eControl);
    }
    if (nSense != 0) {
        effect eSense = EffectSkillDecrease(SKILL_SENSE, nAlteration);
        ePenalty = EffectLinkEffects(ePenalty, eSense);
    }
    return ePenalty;
}

int ForceSkillCheck(int nSkill, int nForceDC, object oPC=OBJECT_SELF) {
    return GetIsSkillSuccessful(oPC, nSkill, nForceDC + 50 - FloatToInt(IntToFloat(GetForce()) / IntToFloat(GetMaxForce()) * 50.0));
}

void LightsaberForm(int nFormType) {

    // Turn off any previously active lightsaber forms
    if (IsPowerActive(GetSpellId())) DeactivateLightsaberForm();

    // Activate the selected lightsaber form if none is active
    else {
        int nForceDCControl, nForceDCSense, nForceCost, nForceSkillPenalty, nWeaponRequired;

        switch (nFormType) {
            case 1: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_1_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_1_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_1; nForceSkillPenalty = 1; break;
            case 2: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_2_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_2_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_2; nForceSkillPenalty = 2; break;
            case 3: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_3_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_3_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_3; nForceSkillPenalty = 4; break;
            case 4: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_4_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_4_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_4; nForceSkillPenalty = 7; break;
            case 5: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_5_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_5_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_5; nForceSkillPenalty = 7; break;
            case 6: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_6_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_6_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_6; nForceSkillPenalty = 0; break;
            case 7: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_7_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_7_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_7; nForceSkillPenalty = 15; break;
            case 8: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_8_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_8_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_8; nForceSkillPenalty = 5; break;
            case 9: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_9_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_9_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_9; nForceSkillPenalty = 7; break;
            case 10: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_10_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_10_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_10; nForceSkillPenalty = 7; nWeaponRequired = WEAPON_WIELD_LIGHTSABER_DUAL; break;
            case 11: nForceDCControl = FORCE_DC_LIGHTSABER_FORM_11_CONTROL; nForceDCSense = FORCE_DC_LIGHTSABER_FORM_11_SENSE; nForceCost = FORCE_COST_LIGHTSABER_FORM_11; nForceSkillPenalty = 20; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Make sure we're wielding the correct weapon type for the lightsaber form.
        int bInvalidWeapon;
        int nCurrentWield = GetWeaponWieldType();
        if (nCurrentWield & WEAPON_WIELD_RANGED) {
            bInvalidWeapon = TRUE;
        }
        else if (nWeaponRequired != WEAPON_WIELD_NONE) {
            if (!(nCurrentWield & nWeaponRequired)) {
                bInvalidWeapon = TRUE;
            }
        }
        if (bInvalidWeapon) {
            FloatingTextStringOnCreature("Invalid weapon wield type for this lightsaber form.", OBJECT_SELF, FALSE);
            return;
        }
        SetLocalInt(OBJECT_SELF, "LIGHTSABER_FORM_WEAPON_WIELD", nWeaponRequired);

        // Do our difficulty checks which are sense & control.
        // The amount for each depends on the Lightsaber Form Type.
        if (ForceSkillCheck(SKILL_CONTROL, nForceDCControl) &&
            ForceSkillCheck(SKILL_SENSE, nForceDCSense)) {

            // Determine the duration
            float fDuration = 10.0 + IntToFloat(GetAbilityModifier(ABILITY_CONSTITUTION));
            if (GetHasFeat(FEAT_LIGHTSABER_FORM_MASTERY)) fDuration += 10.0;
            fDuration *= 6.0; // Convert to rounds

            // Variable declaration
            int nACDeflectMod, nACDodgeMod, nACShieldMod, nACNaturalMod, nDamageMod, nReflexMod,
                nAttackMod, nExtraAttackMod, nDiscMod, nConcenMod, nTumbleMod, nParryMod, nConcealment,
                nSpeed, nVisualEffect, bLightBonusAB, bLightBonusAC, bDarkBonusAB, bDarkBonusAC;
            int nAttack = GetBaseAttackBonus(OBJECT_SELF);
            int nDiscipline = GetSkillRank(SKILL_DISCIPLINE);
            int nConcentration = GetSkillRank(SKILL_CONCENTRATION);
            int nTumble = GetSkillRank(SKILL_TUMBLE);
            int nParry = GetSkillRank(SKILL_PARRY);
            int nSense = GetSkillRank(SKILL_SENSE);
            int nControl = GetSkillRank(SKILL_CONTROL);
            int nAlteration = GetSkillRank(SKILL_ALTERATION);
            int nDexterity = GetAbilityModifier(ABILITY_DEXTERITY);
            int nPheno = GetPhenoType(OBJECT_SELF);
            effect eAttack, eParry, eTumble, eConceal, eAC;

            switch(nFormType) {
                case 1: // Shii-Cho
                    nPheno = PHENOTYPE_NORMAL;
                    nAttackMod = nAttack / 10;
                    nDiscMod = nDiscipline / 10;
                    nParryMod = nParry / 10;
                    nVisualEffect = VFX_DUR_GLOW_LIGHT_YELLOW;
                    break;
                case 2: // Makashi
                    nPheno = PHENO_FENCING;
                    nAttackMod = nControl / 10;
                    nExtraAttackMod = 1;
                    nDiscMod = nControl / 10;
                    nParryMod = (nControl + nSense) / 2;
                    nReflexMod = nSense / 10;
                    nVisualEffect = VFX_DUR_GLOW_LIGHT_BLUE;
                    bLightBonusAB = TRUE;
                    bLightBonusAC = TRUE;
                    bDarkBonusAB = TRUE;
                    bDarkBonusAC = TRUE;
                    break;
                case 3: // Soresu
                    nPheno = PHENO_WARRIOR;
                    nAttackMod = 0 - nSense / 2;
                    nACShieldMod = nSense / 2;
                    nDiscMod = (nControl + nSense) / 10;
                    nParryMod = nSense / 2;
                    nReflexMod = nSense / 10;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.4, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, 90.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    nVisualEffect = VFX_DUR_GLOW_LIGHT_GREEN;
                    break;
                case 4: // Ataru
                    nPheno = PHENO_KENSAI;
                    nAttackMod = (nSense + nTumble) / 5;
                    nExtraAttackMod = 1;
                    nACDodgeMod = (nSense + nTumble) / 10;
                    nParryMod = nTumble / 5;
                    nTumbleMod = nControl / 5;
                    nConcenMod = 0 - nTumble / 2;
                    nReflexMod = (nSense + nTumble) / 5;
                    nConcealment = (nTumble + nSense) / 5;
                    nVisualEffect = VFX_DUR_GLOW_LIGHT_ORANGE;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, -0.2, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    bLightBonusAB = TRUE;
                    bLightBonusAC = TRUE;
                    break;
                case 5: // Djem So
                    nPheno = PHENO_HEAVY;
                    nAttackMod = nControl / 5;
                    nConcenMod = 0 - nControl / 5;
                    nDamageMod = nControl / 5;
                    nVisualEffect = VFX_DUR_GLOW_LIGHT_ORANGE;
                    nSpeed = 0 - (nSense + nControl) / 2;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.1, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, 30.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    bDarkBonusAB = TRUE;
                    bDarkBonusAC = TRUE;
                    break;
                case 6: // Niman
                    nPheno = PHENO_WARRIOR;
                    nACDodgeMod = (nSense) / 10;
                    nParryMod = nControl / 10;
                    nReflexMod = (nSense + nTumble) / 10;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.1, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, 30.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    nVisualEffect = VFX_DUR_GLOW_LIGHT_GREEN;
                    break;
                case 7: // Vaapad
                    nPheno = PHENO_DRAGONPALM;
                    nAttackMod = (nControl + nConcentration) / 3;
                    nExtraAttackMod = 3;
                    nConcenMod = 0 - (nControl + nConcentration) / 5;
                    nReflexMod = (nSense + nControl) / 5;
                    nConcealment = (nSense + nControl + nConcentration + nAlteration) / 5;
                    nVisualEffect = VFX_DUR_GLOW_PURPLE;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.1, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, 30.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    bLightBonusAB = TRUE;
                    bLightBonusAC = TRUE;
                    break;
                case 8: // Sokan
                    nPheno = PHENO_WARRIOR;
                    nAttackMod = (nControl + nTumble) / 10;
                    nExtraAttackMod = 1;
                    nACDodgeMod = (nSense + nTumble) / 4;
                    nTumbleMod = nControl / 5;
                    nReflexMod = (nSense + nTumble) / 4;
                    nConcealment = nSense / 2;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, -0.2, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    nVisualEffect = VFX_DUR_GLOW_YELLOW;
                    break;
                case 9: // Shien
                    nPheno = PHENO_KENSAI;
                    nAttackMod = (nSense + nControl) / 5;
                    nParryMod = nSense / 10;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.2, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, 60.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    nVisualEffect = VFX_DUR_GLOW_BLUE;
                    break;
                case 10: // Jar'Kai
                    nPheno = PHENO_KENSAI;
                    nAttackMod = nControl / 10 + nDexterity;
                    nACDeflectMod = nControl / 10 + nDexterity;
                    nParryMod = nControl / 2 + nDexterity;
                    nDiscMod = nControl / 10 + nDexterity;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, -0.2, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, -30.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    nVisualEffect = VFX_DUR_GLOW_BLUE;
                    bDarkBonusAB = TRUE;
                    bDarkBonusAC = TRUE;
                    bLightBonusAB = TRUE;
                    bLightBonusAC = TRUE;
                    break;
                case 11: // Juyo
                    nPheno = PHENO_DRAGONPALM;
                    nAttackMod = (nControl + nConcentration) / 3;
                    nExtraAttackMod = 2;
                    nDamageMod = (nConcentration + nControl) / 5;
                    nParryMod = 0 - (nConcentration + nControl) / 10;
                    nConcenMod = 0 - nControl / 5;
                    nReflexMod = (nSense + nControl) / 5;
                    nConcealment = (nSense + nControl + nConcentration + nAlteration) / 5;
                    nVisualEffect = VFX_DUR_GLOW_RED;
                    SetBlasterBoltDeflectPercentile(OBJECT_SELF, 0.1, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    SetBlasterBoltDeflectRange(OBJECT_SELF, 30.0, BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
                    bDarkBonusAB = TRUE;
                    bDarkBonusAC = TRUE;
                    break;
            }
            if (GetHasFeat(FEAT_LIGHTSABER_FORM_MASTERY)) {
                if (GetIsLightSide(OBJECT_SELF)) {
                    int nBonusAlign = (GetGoodEvilValue(OBJECT_SELF) - 50) / 10;
                    if (bLightBonusAB) {
                        nAttackMod += nBonusAlign;
                    }
                    if (bLightBonusAC) {
                        nACNaturalMod += nBonusAlign;
                    }
                }
                else {
                    int nBonusAlign = (50 - GetGoodEvilValue(OBJECT_SELF)) / 10;
                    if (bDarkBonusAB) {
                        nAttackMod += nBonusAlign;
                    }
                    if (bDarkBonusAC) {
                        nACNaturalMod += nBonusAlign;
                    }
                }
            }
            effect eGlow = EffectVisualEffect(nVisualEffect);
            effect eLink = eGlow;
            if (nAttackMod > 0) {
                effect eAttack = EffectAttackIncrease(nAttackMod);
                eLink = EffectLinkEffects(eLink, eAttack);
            }
            if (nAttackMod < 0) {
                effect eAttack = EffectAttackDecrease(0-nAttackMod);
                eLink = EffectLinkEffects(eLink, eAttack);
            }
            if (nExtraAttackMod > 0) {
                effect eAttack = EffectModifyAttacks(nExtraAttackMod);
                eLink = EffectLinkEffects(eLink, eAttack);
            }
            if (nDamageMod > 0) {
                effect eDamage = EffectDamageIncrease(nDamageMod, DAMAGE_TYPE_DARKSIDE);
                eLink = EffectLinkEffects(eLink, eDamage);
            }
            if (nConcenMod > 0) {
                effect eConcentration = EffectSkillIncrease(SKILL_CONCENTRATION,nConcenMod);
                eLink = EffectLinkEffects(eLink,eConcentration);
            }
            if (nDiscMod > 0) {
                effect eDiscipline = EffectSkillIncrease(SKILL_DISCIPLINE,nDiscMod);
                eLink = EffectLinkEffects(eLink,eDiscipline);
            }
            if (nParryMod > 0) {
                effect eParry = EffectSkillIncrease(SKILL_PARRY,nParryMod);
                eLink = EffectLinkEffects(eLink,eParry);
            }
            if (nParryMod < 0) {
                effect eParry = EffectSkillDecrease(SKILL_PARRY,0-nParryMod);
                eLink = EffectLinkEffects(eLink,eParry);
            }
            if (nTumbleMod > 0) {
                effect eTumble = EffectSkillIncrease(SKILL_TUMBLE,nTumbleMod);
                eLink = EffectLinkEffects(eLink,eTumble);
            }
            if (nACDeflectMod > 0) {
                effect eAC = EffectACIncrease(nACDeflectMod,AC_DEFLECTION_BONUS);
                eLink = EffectLinkEffects(eLink,eAC);
            }
            if (nACDeflectMod < 0) {
                effect eAC = EffectACDecrease(0-nACDeflectMod,AC_DEFLECTION_BONUS);
                eLink = EffectLinkEffects(eLink,eAC);
            }
            if (nACShieldMod > 0) {
                effect eAC = EffectACIncrease(nACShieldMod,AC_SHIELD_ENCHANTMENT_BONUS);
                eLink = EffectLinkEffects(eLink,eAC);
            }
            if (nACDodgeMod > 0) {
                effect eAC = EffectACIncrease(nACDodgeMod,AC_DODGE_BONUS);
                eLink = EffectLinkEffects(eLink,eAC);
            }
            if (nACNaturalMod > 0) {
                effect eAC = EffectACIncrease(nACNaturalMod,AC_NATURAL_BONUS);
                eLink = EffectLinkEffects(eLink,eAC);
            }
            if (nACNaturalMod < 0) {
                effect eAC = EffectACDecrease(0-nACNaturalMod,AC_NATURAL_BONUS);
                eLink = EffectLinkEffects(eLink,eAC);
            }
            if (nReflexMod > 0) {
                effect eSavingReflex = EffectSavingThrowIncrease(SAVING_THROW_REFLEX,nReflexMod);
                eLink = EffectLinkEffects(eLink,eSavingReflex);
            }
            if (nConcealment > 0) {
                effect eConcealment = EffectConcealment(nConcealment);
                eLink = EffectLinkEffects(eLink,eConcealment);
            }
            if (nSpeed > 0) {
                effect eSpeed = EffectMovementSpeedIncrease(nSpeed);
                eLink = EffectLinkEffects(eLink,eSpeed);
            }
            if (nSpeed < 0) {
                effect eSpeed = EffectMovementSpeedDecrease(0-nSpeed);
                eLink = EffectLinkEffects(eLink,eSpeed);
            }
            // Apply the changes
            SetPhenoType(nPheno);
            effect eSkillPenalty = ForceSkillPenalty(nForceSkillPenalty);
            eLink = EffectLinkEffects(eLink, eSkillPenalty);
            eLink = ExtraordinaryEffect(eLink);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, fDuration));

            // Handle the fatigue
            LightsaberFormForceAdjustment(nForceCost);
        }
    }
}

void ForceRegeneration(int nPowerTier) {

    // Deactivate any Force Regeneration power that may hsve been previously active
    if(IsPowerActive(SPELL_FORCE_REGENERATION_1)) {
        DeactivatePower(SPELL_FORCE_REGENERATION_1);
    }
    else if(IsPowerActive(SPELL_FORCE_REGENERATION_2)) {
        DeactivatePower(SPELL_FORCE_REGENERATION_2);
    }
    else if(IsPowerActive(SPELL_FORCE_REGENERATION_3)) {
        DeactivatePower(SPELL_FORCE_REGENERATION_3);
    }
    else if(IsPowerActive(SPELL_FORCE_REGENERATION_4)) {
        DeactivatePower(SPELL_FORCE_REGENERATION_4);
    }
    else {
        // Variable Declaration
        int nForceDC, nAmount, nForceCost, bHealAilment, bImmunity;
        // Check to see which type of Force Regeneration we're using.
        // Different stuff happens depending on the power type.
        switch(nPowerTier) {
            case 1: nForceDC = FORCE_DC_REGENERATION_1_CONTROL; nAmount = 3; nForceCost = FORCE_COST_REGENERATION_1; break;
            case 2: nForceDC = FORCE_DC_REGENERATION_2_CONTROL; nAmount = 6; nForceCost = FORCE_COST_REGENERATION_2; break;
            case 3: nForceDC = FORCE_DC_REGENERATION_3_CONTROL; nAmount = 9; nForceCost = FORCE_COST_REGENERATION_3; bHealAilment = TRUE; break;
            case 4: nForceDC = FORCE_DC_REGENERATION_4_CONTROL; nAmount = 12; nForceCost = FORCE_COST_REGENERATION_4; bHealAilment = TRUE; bImmunity = TRUE; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, nForceDC)) {

            // Declare the effects being used
            effect eRegenerate = EffectRegenerate(nAmount, 6.0);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eRegenerate, eVisual);
            if(bHealAilment) {
                RemoveAilments(OBJECT_SELF);
                effect eImmunityPoison = EffectImmunity(IMMUNITY_TYPE_POISON);
                effect eImmunityMaladie = EffectImmunity(IMMUNITY_TYPE_DISEASE);
                eLink = EffectLinkEffects(eLink, eImmunityPoison);
                eLink = EffectLinkEffects(eLink, eImmunityMaladie);
            }
            if(bImmunity) {
                effect eImmunity = EffectImmunity(IMMUNITY_TYPE_DEATH);
                eLink = EffectLinkEffects(eLink, eImmunity);
            }
            effect eEffect = ExtraordinaryEffect(eLink);
            // Apply the effects to the PC
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
            // Handle the fatigue
            ForceReserveAdjustment(nForceCost, 1);
        }
    }
}

void ForceHeal(int nPowerTier) {

    // Variable declaration
    object oTarget = GetSpellTargetObject();
    int nForceDC, nHeal, nNumDice, nForceCost, bHealAilments, bHealNegatives;

    // Check to see which type of Heal we're using.
    // Different stuff happens depending on the type.
    switch(nPowerTier) {
        case 1: nForceDC = FORCE_DC_HEAL_1_ALTERATION; nNumDice = 2; nForceCost = FORCE_COST_HEAL_1; break;
        case 2: nForceDC = FORCE_DC_HEAL_2_ALTERATION; nNumDice = 4; nForceCost = FORCE_COST_HEAL_2; break;
        case 3: nForceDC = FORCE_DC_HEAL_3_ALTERATION; nNumDice = 6; nForceCost = FORCE_COST_HEAL_3; bHealAilments = TRUE; break;
        case 4: nForceDC = FORCE_DC_HEAL_4_ALTERATION; nNumDice = 8; nForceCost = FORCE_COST_HEAL_4; bHealAilments = TRUE; bHealNegatives = TRUE; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDC)) {

        // Declare the heal effects that we're using
        effect eHeal = EffectHeal(d100(nNumDice));
        effect eVisual = EffectVisualEffect(VFX_IMP_HEALING_G);
        effect eLink = EffectLinkEffects(eVisual, eHeal);
        effect eEffect = ExtraordinaryEffect(eLink);

        // Heal the target and apply the visual
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oTarget);
        if (bHealAilments) RemoveAilments(oTarget); // Types III & IV heal ailments
        if (bHealNegatives) RemoveNegativeEffects(oTarget); // Type IV heals negative effects

        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 1);
    }
}

void ForceCloak() {

    // Deactivate any previously active version of the power
    if (IsPowerActive(SPELL_FORCE_CLOAK)) {
        DeactivatePower(SPELL_FORCE_CLOAK);
    }
    else {

        if (ForceCostExceedsForceReserve(FORCE_COST_CLOAK)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, FORCE_DC_CLOAK_CONTROL) &&
            ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_CLOAK_ALTERATION)) {

            // Apply a visual effect to the location
            effect eVisual = EffectVisualEffect(VFX_DUR_SANCTUARY);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVisual, GetLocation(OBJECT_SELF), 0.5);

            // Declare the invisiblity effect and apply them to the caller
            effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eInvis = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
            effect eLink = EffectLinkEffects(eCessate, eInvis);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));

            // Handle the fatigue
            ForceReserveAdjustment(FORCE_COST_CLOAK);
        }
    }
}

vector GetForceStormEmitterVector() {
    // The exact location depends on gender and appearance type of the PC.
    int nAppearance = GetAppearanceType(OBJECT_SELF);
    int nGender = GetGender(OBJECT_SELF);
    float fDistance; // The distance away from the PC
    float fAngle; // The angle degree from where the PC is facing
    float fzDistance; // The z distance above the ground
    if (nGender == GENDER_FEMALE) {
        switch (nAppearance) {
            case APPEARANCE_TYPE_HUMAN:
            case APPEARANCE_TYPE_HALF_ELF: fDistance = 0.5; fAngle = 43.0; fzDistance = 1.8; break;
            case APPEARANCE_TYPE_ELF: fDistance = 0.5; fAngle = 41.0; fzDistance = 1.6; break;
            case APPEARANCE_TYPE_HALFLING: fDistance = 0.3; fAngle = 43.0; fzDistance = 1.1; break;
            case APPEARANCE_TYPE_GNOME: fDistance = 0.4; fAngle = 43.0; fzDistance = 1.3; break;
            case APPEARANCE_TYPE_DWARF: fDistance = 0.5; fAngle = 50.0; fzDistance = 1.4; break;
            case APPEARANCE_TYPE_HALF_ORC: fDistance = 0.6; fAngle = 54.0; fzDistance = 2.0; break;
            default: fDistance = 0.5; fAngle = 43.0; fzDistance = 1.8; break;
        }
    }
    else {
        switch (nAppearance) {
            case APPEARANCE_TYPE_HUMAN:
            case APPEARANCE_TYPE_HALF_ELF: fDistance = 0.5; fAngle = 44.0; fzDistance = 1.8; break;
            case APPEARANCE_TYPE_ELF: fDistance = 0.5; fAngle = 42.0; fzDistance = 1.6; break;
            case APPEARANCE_TYPE_HALFLING: fDistance = 0.4; fAngle = 46.0; fzDistance = 1.2; break;
            case APPEARANCE_TYPE_GNOME: fDistance = 0.4; fAngle = 45.0; fzDistance = 1.3; break;
            case APPEARANCE_TYPE_DWARF: fDistance = 0.5; fAngle = 51.0; fzDistance = 1.5; break;
            case APPEARANCE_TYPE_HALF_ORC: fDistance = 0.7; fAngle = 54.0; fzDistance = 2.3; break;
            default: fDistance = 0.5; fAngle = 43.0; fzDistance = 1.8; break;
        }
    }
    // Generate the vector
    vector vVector = GetPosition(OBJECT_SELF) + (fDistance * AngleToVector(GetFacing(OBJECT_SELF) - fAngle));
    vVector.z += fzDistance;
    return vVector;
}

void ForceStormLightning(object oEmitter) {
    // Create a random vector near the PC
    vector vLightning = GetPosition(OBJECT_SELF);
    vLightning.x = vLightning.x + IntToFloat(Random(20)-10);
    vLightning.y = vLightning.y + IntToFloat(Random(20)-10);
    //vLightning.z = vLightning.z + IntToFloat(Random(4));

    // Create the location using our random vector and
    // make an invisible object there for our lightning effect
    location lLightning = Location(GetArea(OBJECT_SELF), vLightning, 0.0);
    object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lLightning);

    // Zap it
    effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, oEmitter, BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oTarget, 0.3);

    // Destroy the invisible object
    DelayCommand(0.3, DestroyObject(oTarget));
}

void ForceStormLightningBlast() {
    // Create a random vector near the PC
    vector vLightning = GetPosition(OBJECT_SELF);
    vLightning.x = vLightning.x + IntToFloat(Random(10)-5);
    vLightning.y = vLightning.y + IntToFloat(Random(10)-5);
    vLightning.z = vLightning.z + IntToFloat(Random(4));

    // Create a location using our random vector
    location lLightning = Location(GetArea(OBJECT_SELF), vLightning, 0.0);

    // Zap the location with the effect
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_ELECTRICAL), lLightning);
}

void ForceStormLightningDamage() {
    int nDamage;
    float fDelay;

    // Loop through all targets in the area of effect
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE);
    while (GetIsObjectValid(oTarget)){
        if (oTarget != OBJECT_SELF && (GetIsPC(oTarget) || (!GetIsPC(oTarget) && GetIsEnemy(OBJECT_SELF, oTarget)))) {
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_LIGHTNING_BOLT));
            fDelay = GetDistanceBetween(OBJECT_SELF, oTarget) / 20; // Get the distance delay

            // Calculate the damage... take force absorption and evasion into account
            nDamage = d100(8);
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetForceSaveDC(4), SAVING_THROW_TYPE_ELECTRICITY);
            nDamage = GetAbsorptionAdjustedDamage(nDamage, oTarget);

            if (nDamage > 0) {
                // Apply the damage and visual to the target
                effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
                effect eVisual = EffectVisualEffect(VFX_COM_HIT_ELECTRICAL);
                eDamage = EffectLinkEffects(eDamage, eVisual);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                if (IsConcentrating(oTarget)) {
                    DelayCommand(fDelay, AssignCommand(oTarget, BreakConcentration(nDamage, TRUE)));
                }

                // Do a fortitude save for paralysis
                if (!IsImmuneToForcePower(0, 1, oTarget)) {
                    if (FortitudeSave(oTarget, nDamage / 2, SAVING_THROW_TYPE_ELECTRICITY, OBJECT_SELF)) {
                        effect eParalyze = EffectParalyze();
                        eVisual = EffectVisualEffect(VFX_DUR_PARALYZED);
                        eParalyze = EffectLinkEffects(eParalyze, eVisual);
                        eParalyze = ExtraordinaryEffect(eParalyze);
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oTarget, 6.0));
                    }
                }
            }
        }
        // Get the next target in the area of effect
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE);
    }
}

void ForceStorm() {

    if (ForceCostExceedsForceReserve(FORCE_COST_STORM)) return;

    // Do the difficulty checks
    if (ForceSkillCheck(SKILL_CONTROL, FORCE_DC_STORM_CONTROL) &&
        ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_STORM_ALTERATION)) {

        // Variable declaration
        int nAlteration = GetSkillRank(SKILL_ALTERATION, OBJECT_SELF);

        // Generate a vector and create our lightning emitter on it
        vector vEmitter = GetForceStormEmitterVector();
        location lEmitter = Location(GetArea(OBJECT_SELF), vEmitter, 0.0);
        object oEmitter = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lEmitter);

        // Freeze the PC to make sure he/she doesn't walk around
        effect eFreeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 30.0);
        DelayCommand(0.5, SetCommandable(FALSE));

////////////////////////////////////////////////////////////////////////////////
// This section generates a huge amount of lightning in random areas around the PC
// A few things to keep note here:
// - nStartDelay: the delay in which the run starts up (nStartDelay/fIntervalSpeed)
// - nRunTotal: how many times the effect will activate
// - fIntervalSpeed: the speed between the effects (seconds)
// The total time for the run to finish is equal to nRunTotal * fIntervalSpeed
        int nlStartDelay = 0;
        int nlRunTotal = 300;
        float flIntervalSpeed = 0.1; // tenth of a second

        int ndStartDelay = 0;
        int ndRunTotal = 5;
        float fdIntervalSpeed = 6.0; // 6 seconds

        int nbStartDelay = 0;
        int nbRunTotal = 300;
        float fbIntervalSpeed = 0.1; // tenth of a second

        int l; // Lightning
        for (l = nlStartDelay; l <= nlRunTotal; l++) {
             DelayCommand(IntToFloat(l)*flIntervalSpeed, ForceStormLightning(oEmitter));
        }
        int d; // Damage
        for (d = ndStartDelay; d <= ndRunTotal; d++) {
             DelayCommand(IntToFloat(d)*fdIntervalSpeed, ForceStormLightningDamage());
        }
        int b; // Blast: Zap the area constantly
        for (b = nbStartDelay; b <= nbRunTotal; b++) {
             DelayCommand(IntToFloat(b)*fbIntervalSpeed, ForceStormLightningBlast());
        }
////////////////////////////////////////////////////////////////////////////////

        // Destroy the lightning emitter and unfreeze the PC
        DelayCommand(30.0, DestroyObject(oEmitter));
        DelayCommand(30.0, SetCommandable(TRUE));

        // Handle the fatigue
        ForceReserveAdjustment(FORCE_COST_STORM, 2);
    }
}

void ForceLightning(int nPowerTier) {

    // Variable Declaration
    object oTarget = GetSpellTargetObject();
    location lTarget = GetSpellTargetLocation();
    int nForceDC, nDamage, nNumDice, nForceCost, bParalyze;

    // Check to see what power type we're using.
    // Different stuff happens depending on the type.
    switch(nPowerTier) {
        case 1: nForceDC = FORCE_DC_LIGHTNING_1_ALTERATION; nForceCost = FORCE_COST_LIGHTNING_1; nNumDice = 2; break;
        case 2: nForceDC = FORCE_DC_LIGHTNING_2_ALTERATION; nForceCost = FORCE_COST_LIGHTNING_2; nNumDice = 4; break;
        case 3: nForceDC = FORCE_DC_LIGHTNING_3_ALTERATION; nForceCost = FORCE_COST_LIGHTNING_3; nNumDice = 6; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDC)) {

        // Declare the effects being used
        effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_HAND);
        effect eParalyze = EffectParalyze();
        effect eParalyzeVisual = EffectVisualEffect(VFX_DUR_PARALYZED);
        eParalyze = EffectLinkEffects(eParalyze, eParalyzeVisual);
        eParalyze = ExtraordinaryEffect(eParalyze);

// For multiple targets
        if (nPowerTier != 1) {
            // Loop through all the targets in the area of effect
            oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 10.0, lTarget, TRUE);
            while (GetIsObjectValid(oTarget)) {
                if (oTarget != OBJECT_SELF && (GetIsPC(oTarget) || (!GetIsPC(oTarget) && GetIsEnemy(OBJECT_SELF, oTarget)))) {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_LIGHTNING_BOLT));

                    // Calculate the damage and take force absorption and evasion into effect
                    int nDamage = d100(nNumDice);
                    nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_ELECTRICITY);
                    nDamage = GetAbsorptionAdjustedDamage(nDamage, oTarget);

                    if (nDamage > 0) {
                        float fDelay = GetDistanceBetween(OBJECT_SELF, oTarget) / 20; // Get the distance delay

                        // Apply the damage and visual to the target
                        effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL, DAMAGE_POWER_ENERGY);
                        eDamage = ExtraordinaryEffect(eDamage);
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                        if (IsConcentrating(oTarget)) {
                            DelayCommand(fDelay, AssignCommand(oTarget, BreakConcentration(nDamage, TRUE)));
                        }
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.0);

                        // Make a fortitude save for paralysis
                        if (!IsImmuneToForcePower(0, 1, oTarget)) {
                            if (FortitudeSave(oTarget, nDamage / 2, SAVING_THROW_TYPE_ELECTRICITY)) {
                                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oTarget, RoundsToSeconds(d4())));
                            }
                        }
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 10.0, lTarget, TRUE);
            }
        }
// For single targets
        else {
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_LIGHTNING_BOLT));

            // Calculate the damage and take force absorption and evasion into effect
            nDamage = d100(nNumDice);
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_ELECTRICITY);
            nDamage = GetAbsorptionAdjustedDamage(nDamage, oTarget);

            if (nDamage > 0) {
                // Apply the damage and visual to the target
                effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL, DAMAGE_POWER_ENERGY);
                eDamage = ExtraordinaryEffect(eDamage);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                if (IsConcentrating(oTarget)) {
                    AssignCommand(oTarget, BreakConcentration(nDamage, TRUE));
                }
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.0);

                if (bParalyze) {// Make a fortitude save for paralysis
                    if (!IsImmuneToForcePower(0, 1, oTarget)) {
                        if (FortitudeSave(oTarget, nDamage / 2, SAVING_THROW_TYPE_ELECTRICITY)) {
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oTarget, RoundsToSeconds(d4()));
                        }
                    }
                }
            }
        }

        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 2);
    }
}

void ForceProtection(int nPowerTier) {
    // If already activated, then deactivate
    if (IsPowerActive(SPELL_FORCE_PROTECTION_1)) {
        DeactivatePower(SPELL_FORCE_PROTECTION_1);
    }
    else if (IsPowerActive(SPELL_FORCE_PROTECTION_2)) {
        DeactivatePower(SPELL_FORCE_PROTECTION_2);
    }
    else if (IsPowerActive(SPELL_FORCE_PROTECTION_3)) {
        DeactivatePower(SPELL_FORCE_PROTECTION_3);
    }
    else if (IsPowerActive(SPELL_FORCE_PROTECTION_4)) {
        DeactivatePower(SPELL_FORCE_PROTECTION_4);
    }
    else {
        // Variable Declaration
        int nForceDC, nResist, nForceCost;
        int nLimit = 1; // = TRUE
        // Look up which power type we're using.
        // Different stuff happens depending on the type.
        switch(nPowerTier) {
            case 1: nForceDC = FORCE_DC_PROTECTION_1_CONTROL; nResist = 20; nForceCost = FORCE_COST_PROTECTION_1; break;
            case 2: nForceDC = FORCE_DC_PROTECTION_2_CONTROL; nResist = 30; nForceCost = FORCE_COST_PROTECTION_2; break;
            case 3: nForceDC = FORCE_DC_PROTECTION_3_CONTROL; nResist = 40; nForceCost = FORCE_COST_PROTECTION_3; nLimit = 0; break;
            case 4: nForceDC = FORCE_DC_PROTECTION_4_CONTROL; nResist = 50; nForceCost = FORCE_COST_PROTECTION_4; nLimit = 0; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, nForceDC)) {
            // Define the effects used
            effect eCold = EffectDamageResistance(DAMAGE_TYPE_COLD, nResist, nLimit * nResist * 5);
            effect eElectric = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, nResist, nLimit * nResist * 5);
            effect eFire = EffectDamageResistance(DAMAGE_TYPE_FIRE, nResist, nLimit * nResist * 5);
            effect eSonic = EffectDamageResistance(DAMAGE_TYPE_SONIC, nResist, nLimit * nResist * 5);
            effect eVisual = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
            effect eLink = EffectLinkEffects(eCold, eElectric);
            eLink = EffectLinkEffects(eLink, eFire);
            eLink = EffectLinkEffects(eLink, eSonic);
            eLink = EffectLinkEffects(eLink, eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
        }
        ForceReserveAdjustment(nForceCost, 1);
    }
}

void ForceVigor(int nPowerTier) {
    // If already activated, deactivate
    if (IsPowerActive(SPELL_FORCE_VIGOR_1)) {
        DeactivatePower(SPELL_FORCE_VIGOR_1);
    }
    else if (IsPowerActive(SPELL_FORCE_VIGOR_2)) {
        DeactivatePower(SPELL_FORCE_VIGOR_2);
    }
    else {
        // Variable declaration
        int nForceDC, nForceCost, bReflex;
        int nControl = GetSkillRank(SKILL_CONTROL);
        // Look up the power type. Different stuff happens depending on the type.
        switch (nPowerTier) {
            case 1: nForceDC = FORCE_DC_VIGOR_1_CONTROL; nForceCost = FORCE_COST_VIGOR_1; break;
            case 2: nForceDC = FORCE_DC_VIGOR_2_CONTROL; nForceCost = FORCE_COST_VIGOR_2; bReflex = TRUE; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, nForceDC)) {
            // Declare the effects we're using
            effect eReflex = EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 10);
            effect eParalysis = EffectImmunity(IMMUNITY_TYPE_PARALYSIS);
            effect eEntangle = EffectImmunity(IMMUNITY_TYPE_ENTANGLE);
            effect eSlow = EffectImmunity(IMMUNITY_TYPE_SLOW);
            effect eMove = EffectImmunity(IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE);
            effect eVisual = EffectVisualEffect(VFX_DUR_FREEDOM_OF_MOVEMENT);
            effect eLink = EffectLinkEffects(eReflex, eParalysis);
            eLink = EffectLinkEffects(eLink, eEntangle);
            eLink = EffectLinkEffects(eLink, eSlow);
            eLink = EffectLinkEffects(eLink, eMove);
            eLink = EffectLinkEffects(eLink, eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            // Apply the effects and the visual
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
            eVisual = EffectVisualEffect(VFX_IMP_HASTE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, OBJECT_SELF);
        }
        // Handle the fatigue
        ForceReserveAdjustment(nForceCost);
    }
}

void ForceSight(int nPowerTier) {
    // If already activated, deactivate
    if (IsPowerActive(SPELL_FORCE_SIGHT_1)) {
        DeactivatePower(SPELL_FORCE_SIGHT_1);
    }
    else if (IsPowerActive(SPELL_FORCE_SIGHT_2)) {
        DeactivatePower(SPELL_FORCE_SIGHT_2);
    }
    else if (IsPowerActive(SPELL_FORCE_SIGHT_3)) {
        DeactivatePower(SPELL_FORCE_SIGHT_3);
    }
    else {
        // Variable declaration
        int nForceDC, nBonus, nForceCost, bSeeInvis, bTrueSeeing;
        // Look up the power type that's being used. Different stuff happens depending on the type.
        switch(nPowerTier) {
            case 1: nForceDC = FORCE_DC_SIGHT_1_SENSE; nBonus = 10; nForceCost = FORCE_COST_SIGHT_1; break;
            case 2: nForceDC = FORCE_DC_SIGHT_2_SENSE; nBonus = 20; nForceCost = FORCE_COST_SIGHT_2; bSeeInvis = TRUE; break;
            case 3: nForceDC = FORCE_DC_SIGHT_3_SENSE; nBonus = 30; nForceCost = FORCE_COST_SIGHT_3; bTrueSeeing = TRUE; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_SENSE, nForceDC)) {
            // Define the effects we're using
            effect eListen = EffectSkillIncrease(SKILL_LISTEN, nBonus);
            effect eSpot = EffectSkillIncrease(SKILL_SPOT, nBonus);
            effect eVisual = EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
            effect eLink = EffectLinkEffects(eListen, eSpot);
            eLink = EffectLinkEffects(eLink, eVisual);
            if (bSeeInvis) {
                effect eSeeInvis = EffectSeeInvisible();
                eLink = EffectLinkEffects(eLink, eSeeInvis);
            }
            if (bTrueSeeing) {
                effect eTrueSeeing = EffectTrueSeeing();
                eLink = EffectLinkEffects(eLink, eTrueSeeing);
            }
            // Apply the effects
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
        }
        // Handle the fatigue
        ForceReserveAdjustment(nForceCost);
    }
}

void ForceCorruption(int nPowerTier) {
    // If already activated, deactivate
    if (IsPowerActive(SPELL_FORCE_CORRUPTION_1)) {
        DeactivatePower(SPELL_FORCE_CORRUPTION_1);
    }
    else if(IsPowerActive(SPELL_FORCE_CORRUPTION_2)) {
        DeactivatePower(SPELL_FORCE_CORRUPTION_2);
    }
    else if(IsPowerActive(SPELL_FORCE_CORRUPTION_3)) {
        DeactivatePower(SPELL_FORCE_CORRUPTION_3);
    }
    else {
        // Variable Declaration
        int nForceDCSen, nForceDCAlt, nAmount, nForceCost;
        float fDuration = TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM));
        // Look up the power type that's being used
        switch(nPowerTier) {
            case 1: nForceDCSen = FORCE_DC_CORRUPT_1_SENSE; nForceDCAlt = FORCE_DC_CORRUPT_1_ALTERATION; nAmount = 5; nForceCost = FORCE_COST_CORRUPT_1; break;
            case 2: nForceDCSen = FORCE_DC_CORRUPT_2_SENSE; nForceDCAlt = FORCE_DC_CORRUPT_2_ALTERATION; nAmount = 10; nForceCost = FORCE_COST_CORRUPT_2; break;
            case 3: nForceDCSen = FORCE_DC_CORRUPT_3_SENSE; nForceDCAlt = FORCE_DC_CORRUPT_3_ALTERATION; nAmount = 20; nForceCost = FORCE_COST_CORRUPT_3; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_ALTERATION, nForceDCAlt) &&
            ForceSkillCheck(SKILL_SENSE, nForceDCSen)) {
            // Declare all the bonus effects we're using on oPC
            effect eBluff = EffectSkillIncrease(SKILL_BLUFF, nAmount);
            effect eIntimidate = EffectSkillIncrease(SKILL_INTIMIDATE, nAmount);
            effect ePersuade = EffectSkillIncrease(SKILL_PERSUADE, nAmount);
            effect eTaunt = EffectSkillIncrease(SKILL_TAUNT, nAmount);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eBluff, eIntimidate);
            eLink = EffectLinkEffects(eLink, eTaunt);
            eLink = EffectLinkEffects(eLink, ePersuade);
            eLink = EffectLinkEffects(eLink, eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, fDuration);

            // Declare all the penalty effects we're using on the targets
            effect oWill = EffectSavingThrowDecrease(SAVING_THROW_WILL, nAmount);
            effect oConcentrate = EffectSkillDecrease(SKILL_CONCENTRATION, nAmount);
            effect eVisual2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
            effect eLink2 = EffectLinkEffects(oWill, oConcentrate);
            eLink2 = EffectLinkEffects(eLink2, eVisual2);
            effect eEffect2 = ExtraordinaryEffect(eLink2);
            // Cycle through the nearby targets
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            while (GetIsObjectValid(oTarget)) {
                // Do a will save on the selected target
                if (oTarget != OBJECT_SELF && (GetIsPC(oTarget) || (!GetIsPC(oTarget) && GetIsEnemy(OBJECT_SELF, oTarget)))) {
                    // Check to see if the target doesn't have Force Resonance active
                    if (!IsImmuneToForcePower(nPowerTier, 4, oTarget)) {
                        if (!WillSave(oTarget, GetForceSaveDC(SAVING_THROW_TYPE_MIND_SPELLS))) {
                            DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect2, oTarget, fDuration));
                        }
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            }
        }
        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 2);
    }
}

void MoveItemToInventory(object oItem, object oCreature, int bEquipItem=TRUE) {
    object oNewItem = CopyItem(oItem, oCreature, TRUE);
    if (bEquipItem) {
        AssignCommand(oCreature, ClearAllActions());
        DelayCommand(0.2, AssignCommand(oCreature, ActionEquipItem(oNewItem, INVENTORY_SLOT_RIGHTHAND)));
    }
    DestroyObject(oItem);
}

void ForceTelekinesisDisarm() {
    // Variable declaration
    object oTarget = GetSpellTargetObject();
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);

    // Exit out if the target isn't holding anything
    if(!GetIsObjectValid(oItem)) {
        SendMessageToPC(OBJECT_SELF, "Target isn't holding anything.");
        return;
    }
    // Exit out if the target can't be disarmed
    if (!GetIsCreatureDisarmable(oTarget)) {
        SendMessageToPC(OBJECT_SELF, "Target cannot be disarmed.");
        return;
    }

    if (ForceCostExceedsForceReserve(FORCE_COST_TELEKINESIS_2)) return;

    // Do our difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_TELEKINESIS_2_ALTERATION)) {
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
        // Calculate the save DC
        int nDC = GetForceSaveDC(2);
        // Do the save DC for the target
        if (d20() + GetSkillRank(SKILL_DISCIPLINE, oTarget) < nDC) {
            // Generate a vector near the target to determine where we will drop the item
            vector vTarget = GetPosition(oTarget);
            float fOrientation = GetFacing(oTarget);
            fOrientation -= 3.1415/4;
            vector vWeapon = AngleToVector(fOrientation);
            float vX = vTarget.x - vWeapon.x;
            float vY = vTarget.y - vWeapon.y;
            float vZ = vTarget.z;
            vWeapon = Vector(vX, vY, vZ);
            // Create a location using the generated vector
            location lWeapon = Location(GetArea(oTarget), vWeapon, fOrientation);
            MoveItemToLocation(oItem, lWeapon); // Drop the weapon at the new location
        }
        else {
            SendMessageToPC(OBJECT_SELF, "Target resisted.");
            SendMessageToPC(oTarget, "Resisted");
        }

        // Handle the fatigue
        ForceReserveAdjustment(FORCE_COST_TELEKINESIS_2);
    }
}

void MoveItemToLocation(object oItem, location lLocation) {
    object oNewItem = CopyObject(oItem, lLocation);
    if (GetIsObjectValid(oNewItem)) {
        DestroyObject(oItem);
    }
}

void MovePlaceableToLocation(object oPlaceable, location lLocation) {

    object oCopy = CreateObject(OBJECT_TYPE_PLACEABLE, GetResRef(oPlaceable), lLocation, FALSE, GetTag(oPlaceable));
    if (GetHasInventory(oPlaceable)) {
        object oItem = GetFirstItemInInventory(oPlaceable);
        while(GetIsObjectValid(oItem)) {
            object oItemCopy = CopyItem(oItem, oCopy, TRUE);
            if(GetIsObjectValid(oItemCopy)) {
                DestroyObject(oItem);
            }
            oItem = GetNextItemInInventory(oPlaceable);
        }
    }
    if (GetIsObjectValid(oCopy)) {
        SetPlotFlag(oCopy, GetPlotFlag(oPlaceable));
        SetPlotFlag(oPlaceable, FALSE);
        DestroyObject(oPlaceable);
    }
}

void ForceTelekinesisMoveObject() {
    if (!GetCommandable()) return;

    // Variable declaration
    object oTarget = GetLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
    object oCurrTarget = GetSpellTargetObject();
    location lMoveToLocation = GetSpellTargetLocation();

    if (GetObjectType(oCurrTarget) == OBJECT_TYPE_DOOR) {
        oTarget = oCurrTarget;
    }

    // Do we have an invalid previously saved target? If we do, save our
    // current target for the next time we come by here then exit out.
    if (oTarget == OBJECT_INVALID) {

        // If there is no current target then look for
        // one within 5m of the target location.
        if (oCurrTarget == OBJECT_INVALID) {
            object oSearch = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, lMoveToLocation, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_ITEM);
            while (GetIsObjectValid(oCurrTarget)) {
                if (!GetPlotFlag(oSearch) && !GetUseableFlag(oSearch)) {
                    oCurrTarget = oSearch;
                }
                else {
                    oSearch = GetNextObjectInShape(SHAPE_SPHERE, 5.0, lMoveToLocation, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_ITEM);
                }
            }
            // If none found in the search then exit out.
            if (oSearch == OBJECT_INVALID) {
                SendMessageToPC(OBJECT_SELF, "No valid objects in target location.");
                return;
            }
        }
        // We can't save ourselves.
        if (oCurrTarget == OBJECT_SELF) {
            SendMessageToPC(OBJECT_SELF, "You cannot target yourself with this power.");
        }
        // We can't save a DM.
        else if (GetIsDM(oCurrTarget) || GetIsDMPossessed(oCurrTarget)) {
            SendMessageToPC(OBJECT_SELF, "You cannot target a DM with this power.");
        }
        else if (GetObjectType(oCurrTarget) == OBJECT_TYPE_PLACEABLE && GetUseableFlag(oCurrTarget)) {
            SendMessageToPC(OBJECT_SELF, "To prevent game breaking bugs, you cannot target useable placeables with this.");
        }
        else {
            SendMessageToPC(OBJECT_SELF, "Selected: " + GetName(oCurrTarget) + ". Target a location to move the object to.");
            SetLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT", oCurrTarget);
        }
    }

    // Our saved target is valid, attempt to move it to the target location.
    else {

        // Determine the maximum range away from ourselves.
        float fMaxRange = IntToFloat(GetAbilityModifier(ABILITY_WISDOM) * 3);

        // If the target is not in the same area OR out of range, then exit out.
        if (GetArea(OBJECT_SELF) != GetArea(oTarget) || GetDistanceBetween(OBJECT_SELF, oTarget) > fMaxRange) {
            DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
            SendMessageToPC(OBJECT_SELF, "The target is too far away for you to focus on.");
            return;
        }
        else if (GetDistanceBetweenLocations(GetLocation(OBJECT_SELF), lMoveToLocation) > fMaxRange) {
            DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
            SendMessageToPC(OBJECT_SELF, "The selected location is too far away for you to focus on.");
            return;
        }

        // Grab the weight of the object.
        // - Placeables are assumed to weigh 30 lbs
        // - Creatures use their carried weight plus 150 lbs
        // - Items use their own designated weight
        int nWeight;
        int nObjectType = GetObjectType(oTarget);
        switch (nObjectType) {
            case OBJECT_TYPE_DOOR: nWeight = 31; break;
            case OBJECT_TYPE_PLACEABLE: nWeight = 30; break;
            case OBJECT_TYPE_CREATURE: nWeight = 150 + GetWeight(oTarget) * 10; break;
            case OBJECT_TYPE_ITEM: nWeight = GetWeight(oTarget) * 10; break;
        }

        // Now determine the Force DC and cost by the weight of the object.
        int nForceDC, nForceCost;
        if (nWeight <= 10) {
            nForceDC = FORCE_DC_TELEKINESIS_1_ALTERATION;
            nForceCost = FORCE_COST_TELEKINESIS_1;
        }
        else if (nWeight > 10 && nWeight <= 30) {
            if (!GetHasFeat(FEAT_FORCE_TELEKINESIS_2)) {
                SendMessageToPC(OBJECT_SELF, "The object is too heavy for you to move.");
                DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
                return;
            }
            nForceDC = FORCE_DC_TELEKINESIS_2_ALTERATION;
            nForceCost = FORCE_COST_TELEKINESIS_2;
        }
        else if (nWeight > 30 && nWeight <= 150) {
            if (!GetHasFeat(FEAT_FORCE_TELEKINESIS_3)) {
                SendMessageToPC(OBJECT_SELF, "The object is too heavy for you to move.");
                DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
                return;
            }
            nForceDC = FORCE_DC_TELEKINESIS_3_ALTERATION;
            nForceCost = FORCE_COST_TELEKINESIS_3;
        }
        else {
            if (!GetHasFeat(FEAT_FORCE_TELEKINESIS_4)) {
                SendMessageToPC(OBJECT_SELF, "The object is too heavy for you to move.");
                DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
                return;
            }
            nForceDC = FORCE_DC_TELEKINESIS_4_ALTERATION;
            nForceCost = FORCE_COST_TELEKINESIS_4;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) {
            DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");
            return;
        }

        // Do our force skill check with the DC we chose
        if (ForceSkillCheck(SKILL_ALTERATION, nForceDC)) {

            // Set up variables and other minor things
            int bPlotFlag = GetPlotFlag(oTarget);
            SetPlotFlag(oTarget, FALSE);
            location lPrevLocation = GetLocation(oTarget);
            float fDuration = GetDistanceBetweenLocations(lPrevLocation, lMoveToLocation) / 3.0;

            // Start animations
            SetFacingPoint(GetPositionFromLocation(lPrevLocation));
            DelayCommand(0.2, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, fDuration));
            DelayCommand(0.3, SetCommandable(FALSE, OBJECT_SELF));

            // Move the object to the location
            effect eFly;
            switch(nObjectType) {
                case OBJECT_TYPE_CREATURE: {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
                    eFly = EffectDisappearAppear(lMoveToLocation);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFly, oTarget, fDuration);
                    break;
                }
                case OBJECT_TYPE_ITEM: {
                    if (oCurrTarget == OBJECT_SELF) {
                        DelayCommand(fDuration, MoveItemToInventory(oTarget, oCurrTarget));
                    }
                    else DelayCommand(fDuration / 2.0, MoveItemToLocation(oTarget, lMoveToLocation));
                    break;
                }
                case OBJECT_TYPE_PLACEABLE: DelayCommand(fDuration / 2.0, MovePlaceableToLocation(oTarget, lMoveToLocation)); break;
                case OBJECT_TYPE_DOOR : {
                    int bLocked = GetLocked(oTarget);
                    if (!bLocked || GetLocalInt(oTarget, "DOOR_FORCE_ACTIVATED")) {
                        if (GetIsOpen(oTarget)) {
                            DelayCommand(0.1, DelayCommand(fDuration + 0.1, SetLocked(oTarget, TRUE)));
                            DelayCommand(0.1, AssignCommand(oTarget, ActionCloseDoor(oTarget)));
                        }
                        else if (bLocked) {
                            SetLocked(oTarget, FALSE);
                            DelayCommand(0.1, AssignCommand(oTarget, ActionOpenDoor(oTarget)));
                        }
                        else {
                            DelayCommand(0.1, AssignCommand(oTarget, ActionOpenDoor(oTarget)));
                        }
                    }
                    else {
                        DelayCommand(0.1, SendMessageToPC(OBJECT_SELF, "The door won't budge!"));
                    }
                }
            }

            DelayCommand(fDuration + 0.1, SetCommandable(TRUE, OBJECT_SELF));
            DelayCommand(fDuration + 0.1, ClearAllActions());
            DelayCommand(fDuration + 0.1, SetPlotFlag(oTarget, bPlotFlag));
            DeleteLocalObject(OBJECT_SELF, "TELEKINESIS_MOVE_OBJECT");

            // Handle the fatigue
            ForceReserveAdjustment(nForceCost);
        }
    }
}

void MarauderFury() {
    // You can't deactivate this ability
    if (IsPowerActive(SPELL_JEDI_FURY)) {
       FloatingTextStringOnCreature("You cannot deactivate this power.", OBJECT_SELF, FALSE);
       return;
    }

    if (ForceCostExceedsForceReserve(FORCE_COST_FURY)) return;

    // Do the difficulty checks
    if (ForceSkillCheck(SKILL_CONTROL, FORCE_DC_FURY_CONTROL)) {
        // Establish the duration according to the Marauder's wisdom modifier
        float fDuration = TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM)) * 2;
        // Calculate the bonuses for the ability
        int nLevel = 1 + GetLevelByClass(CLASS_TYPE_SITH_MARAUDER) / 5;
        int nDamage = DAMAGE_BONUS_3;
        int nDmgRedP = DAMAGE_POWER_PLUS_THREE;
        int nDmgRedA = nLevel * 5;
        int nAttack = 3;
        int nHP = nLevel * 50;
        if (nLevel > 1) {
            nAttack += nLevel * 2; // +2 to attack every 5 levels
        }
        if (nLevel > 7) { // Level 35+
            nDmgRedP = DAMAGE_POWER_PLUS_SEVENTEEN;
            nDamage = DAMAGE_BONUS_17;
        }
        else if (nLevel > 6) { // Level 30+
            nDmgRedP = DAMAGE_POWER_PLUS_FIFTEEN;
            nDamage = DAMAGE_BONUS_15;
        }
        else if (nLevel > 5) { // Level 25+
            nDmgRedP = DAMAGE_POWER_PLUS_THIRTEEN;
            nDamage = DAMAGE_BONUS_13;
        }
        else if (nLevel > 4) { // Level 20+
            nDmgRedP = DAMAGE_POWER_PLUS_ELEVEN;
            nDamage = DAMAGE_BONUS_11;
        }
        else if (nLevel > 3) { // Level 15+
            nDmgRedP = DAMAGE_POWER_PLUS_NINE;
            nDamage = DAMAGE_BONUS_9;
        }
        else if (nLevel > 2) { // Level 10+
            nDmgRedP = DAMAGE_POWER_PLUS_SEVEN;
            nDamage = DAMAGE_BONUS_7;
        }
        else if (nLevel > 1) { // Level 5+
            nDmgRedP = DAMAGE_POWER_PLUS_FIVE;
            nDamage = DAMAGE_BONUS_5;
        }
        // Declare the effects with all the bonuses
        effect eHP = EffectTemporaryHitpoints(nHP);
        effect eDmgRed = EffectDamageReduction(nDmgRedA, nDmgRedP);
        effect eAttack = EffectAttackIncrease(nAttack);
        effect eDamage = EffectDamageIncrease(nDamage, DAMAGE_TYPE_DARKSIDE);
        effect eAC = EffectACDecrease(4, AC_DODGE_BONUS);
        effect eVisual = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR);
        effect eVisual2 = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        effect eLink = EffectLinkEffects(eHP, eAttack);
        eLink = EffectLinkEffects(eLink, eDmgRed);
        eLink = EffectLinkEffects(eLink, eAC);
        eLink = EffectLinkEffects(eLink, eDamage);
        eLink = EffectLinkEffects(eLink, eVisual);
        effect eEffect = ExtraordinaryEffect(eLink);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual2, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, fDuration);

        // Handle the force cost
        ForceReserveAdjustment(FORCE_COST_FURY, 2);
    }
}

void ForceJump() {
    if (!GetCommandable()) return;

    // Are we not allowed to use force jump in this area?
    if (GetLocalInt(GetArea(OBJECT_SELF), "NO_JUMPING")){
        FloatingTextStringOnCreature("You cannot jump in this area.", OBJECT_SELF, FALSE);
        return;
    }

    if (ForceCostExceedsForceReserve(FORCE_COST_JUMP)) return;

    location lTarget = GetSpellTargetLocation();
    float fDistance = GetDistanceBetweenLocations(GetLocation(OBJECT_SELF), lTarget);
    float fMaxDistance = IntToFloat(GetAbilityModifier(ABILITY_WISDOM) * 3);

    // Is the distance too far away?
    if (fDistance > fMaxDistance) {
        FloatingTextStringOnCreature("Distance too far away.", OBJECT_SELF, FALSE);
    }
    else {
        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, FORCE_DC_JUMP_CONTROL)) {
            effect eFly = EffectDisappearAppear(lTarget);

            SetFacingPoint(GetPositionFromLocation(lTarget));
            DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFly, OBJECT_SELF, 3.0));

            // Handle the force cost
            ForceReserveAdjustment(FORCE_COST_JUMP);
        }
    }
}

void ForcePersuasion() {
    object oTarget = GetSpellTargetObject();

    if (ForceCostExceedsForceReserve(FORCE_COST_PERSUASION)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_SENSE, FORCE_DC_PERSUASION_SENSE) &&
        ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_PERSUASION_ALTERATION)) {
        // Do the DC save for the target
        if (!IsImmuneToForcePower(3, 4, oTarget)) {
            if (!WillSave(oTarget, GetForceSaveDC(4), SAVING_THROW_TYPE_MIND_SPELLS)) {
                float fDuration = RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM));
                effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMind, oTarget, fDuration);
                AssignCommand(oTarget, ClearAllActions(TRUE));
                if (GetIsPC(oTarget)) {
                    SetPCLike(oTarget, OBJECT_SELF);
                    FloatingTextStringOnCreature("You are under the influence of " + GetName(OBJECT_SELF) + "'s mind powers.", oTarget, FALSE);
                }
                else SetIsTemporaryFriend(OBJECT_SELF, oTarget, TRUE, fDuration);
            }
        }
    }
    // Handle the fatigue
    ForceReserveAdjustment(FORCE_COST_PERSUASION);
}

void ForcePsychomancy(int nPowerTier) {
    // Deactivate if already active
    if (IsPowerActive(SPELL_JEDI_PSYCHOMANCIE_1)) {
        DeactivatePower(SPELL_JEDI_PSYCHOMANCIE_1);
    }
    else if (IsPowerActive(SPELL_JEDI_PSYCHOMANCIE_2)) {
        DeactivatePower(SPELL_JEDI_PSYCHOMANCIE_2);
    }
    else if (IsPowerActive(SPELL_JEDI_PSYCHOMANCIE_3)) {
        DeactivatePower(SPELL_JEDI_PSYCHOMANCIE_3);
    }
    else {
        // Variable declaration
        int nForceDCControl, nForceDCSense, nLore, nAppraise, nRepair, nForceCost;
        // Look up the power type. Different stuff happens depending on the type.
        switch(nPowerTier) {
            case 1: nForceDCControl = FORCE_DC_PSYCHOMANCY_1_CONTROL; nForceDCSense = FORCE_DC_PSYCHOMANCY_1_SENSE; nLore = 5; nAppraise = 3; nRepair = 5; nForceCost = FORCE_COST_PSYCHOMANCY_1; break;
            case 2: nForceDCControl = FORCE_DC_PSYCHOMANCY_2_CONTROL; nForceDCSense = FORCE_DC_PSYCHOMANCY_2_SENSE; nLore = 10; nAppraise = 6; nRepair = 10; nForceCost = FORCE_COST_PSYCHOMANCY_2; break;
            case 3: nForceDCControl = FORCE_DC_PSYCHOMANCY_3_CONTROL; nForceDCSense = FORCE_DC_PSYCHOMANCY_3_SENSE; nLore = 20; nAppraise = 10; nRepair = 20; nForceCost = FORCE_COST_PSYCHOMANCY_3; break;
        }

        if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, nForceDCControl) &&
           ForceSkillCheck(SKILL_SENSE, nForceDCSense)) {
            // Declare the skill increase effects
            effect eAppraise = EffectSkillIncrease(SKILL_APPRAISE, nAppraise);
            effect eLore = EffectSkillIncrease(SKILL_LORE, nLore);
            effect eRepair = EffectSkillIncrease(SKILL_REPAIR, nRepair);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eAppraise, eLore);
            eLink = EffectLinkEffects(eLink, eRepair);
            eLink = EffectLinkEffects(eLink, eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            // apply the effects to the PC
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
        }
        // Handle the fatigue
        ForceReserveAdjustment(nForceCost);
    }
}

void ForceNarcolepsy(int nPowerTier) {

    // Variable declaration
    int nForceDCAlt, nForceDCSense, nAmount, nForceCost, bMultipleTarget;
    float fDuration;
    object oTarget = GetSpellTargetObject();
    location lTarget = GetSpellTargetLocation();

    // Look up the power type. Different stuff happens depending on the type.
    switch(nPowerTier) {
        case 1: nForceDCSense = FORCE_DC_NARCOLEPSY_1_SENSE; nForceDCAlt = FORCE_DC_NARCOLEPSY_1_ALTERATION; fDuration = 30.0; ;nForceCost = FORCE_COST_NARCOLEPSY_1; break;
        case 2: nForceDCSense = FORCE_DC_NARCOLEPSY_2_SENSE; nForceDCAlt = FORCE_DC_NARCOLEPSY_2_ALTERATION; fDuration = 60.0; nForceCost = FORCE_COST_NARCOLEPSY_2; break;
        case 3: nForceDCSense = FORCE_DC_NARCOLEPSY_3_SENSE; nForceDCAlt = FORCE_DC_NARCOLEPSY_3_ALTERATION; fDuration = 60.0; nForceCost = FORCE_COST_NARCOLEPSY_3; bMultipleTarget = TRUE; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty checks
    if (ForceSkillCheck(SKILL_SENSE, nForceDCSense) &&
        ForceSkillCheck(SKILL_ALTERATION, nForceDCAlt)) {

        // Declare the sleep effects that we'll be using
        effect eSleep = EffectSleep();
        effect eEffect = ExtraordinaryEffect(eSleep);
        effect eVisual = EffectVisualEffect(VFX_IMP_SLEEP);

        // For single targets
        if(!bMultipleTarget) {
            // Does the target have the counter power active?
            if (!IsImmuneToForcePower(nPowerTier, 4, oTarget)) {
                if (!WillSave(oTarget, GetForceSaveDC(nPowerTier))) {
                    float fDelay = GetDistanceBetween(OBJECT_SELF, oTarget) / 20;
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, fDuration));
                }
            }
        }

        // For multiple targets
        else {
            // Cycle through all nearby objects at the target location
            oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_HUGE, lTarget, TRUE);
            while(GetIsObjectValid(oTarget)) {
                // We we only want to target other PCs and enemies
                if (oTarget != OBJECT_SELF && (GetIsPC(oTarget) || GetIsReactionTypeHostile(oTarget, OBJECT_SELF))) {
                    if (!IsImmuneToForcePower(nPowerTier, 4, oTarget)) {
                        if (!WillSave(oTarget, GetForceSaveDC(nPowerTier))) {
                            float fDelay = GetDistanceBetween(OBJECT_SELF, oTarget) / 20;
                            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget));
                            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, fDuration));
                        }
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, RADIUS_SIZE_HUGE, lTarget, TRUE);
            }
        }
        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 2);
    }
}

void ForceDisease(int nPowerTier) {
    // Variable declaration
    object oTarget = GetSpellTargetObject();
    int nDisease, nForceCost, nForceDC, bDeath, bMultiTarget;

    // Check what kind of disease we're using
    switch (nPowerTier) {
        case 1: nDisease = DISEASE_SITH_DISEASE_1; nForceCost = FORCE_COST_DISEASE_1; nForceDC = FORCE_DC_DISEASE_1_ALTERATION; break;
        case 2: nDisease = DISEASE_SITH_DISEASE_2; nForceCost = FORCE_COST_DISEASE_2; nForceDC = FORCE_DC_DISEASE_2_ALTERATION; bDeath = TRUE; break;
        case 3: nDisease = DISEASE_SITH_DISEASE_3; nForceCost = FORCE_COST_DISEASE_3; nForceDC = FORCE_DC_DISEASE_3_ALTERATION; bDeath = TRUE; bMultiTarget = TRUE; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty checks
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDC)) {

        // Declare the effects we'll be using
        effect eDisease = EffectDisease(nDisease);
        effect eEffect = SupernaturalEffect(eDisease);
        effect eDeath = EffectDeath();
        effect eVisual = EffectVisualEffect(VFX_IMP_DISEASE_S);

        // For single targets
        if (!bMultiTarget) {
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
            // Perform the fortitude check on the target
            if (!FortitudeSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_DISEASE)) {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
                // Do a second fortitude check against death
                if (!FortitudeSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_DEATH)) {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
                }
                else {
                    // Apply the disease to the target if the second check succeeds
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
                }
            }
        }

        // For multiple targets
        else {
            effect ePulse = EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE);
            location lPC = GetLocation(OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, ePulse, OBJECT_SELF);

            // Cycle through the nearby objects
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lPC, TRUE, OBJECT_TYPE_CREATURE);
            while (GetIsObjectValid(oTarget)) {

                // Only PCs or hostile NPCs may be effected
                if (oTarget != OBJECT_SELF && !GetIsDead(oTarget) && (GetIsReactionTypeHostile(OBJECT_SELF, oTarget) || GetIsPC(oTarget))) {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));

                    // Perform the fortitude check on the target
                    if (!FortitudeSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_DISEASE)) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
                        // Do a second fortitude check against death
                        if (!FortitudeSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_DEATH)) {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
                        }
                        else {
                            // Apply the disease to the target if the second check succeeds
                            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
                        }
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lPC, TRUE, OBJECT_TYPE_CREATURE);
            }
        }

        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 2);
    }
}

// The caller chokes his victom. This is a loop
// that's used inside of ForceChoke() function
void ForceChokeLoop(object oTarget) {
    //AssignCommand(oPC, SpeakString("Round " + IntToString(nRound) + " & Force " + IntToString(nDuration)));

    // Stop the loop if told to do so.
    if (GetLocalInt(OBJECT_SELF, "FORCE_CHOKE_STOP")) {
        DeleteLocalInt(OBJECT_SELF, "FORCE_CHOKE_STOP");
        SendMessageToPC(OBJECT_SELF, "Stopping Force Choke...");
        return;
    }

    // If either one is dead then exit out
    if (GetIsDead(oTarget) || GetIsDead(OBJECT_SELF)) {
        StopForceChoke();
    }
    // We need to be within a certain range to use this power
    else if (GetDistanceBetween(OBJECT_SELF, oTarget) > IntToFloat(GetAbilityModifier(ABILITY_WISDOM) * 3)) {
        SendMessageToPC(OBJECT_SELF, "You are too far away from the target.");
        StopForceChoke();
    }
    // Has our concentration broken?
    else if (!IsConcentrating() || GetCurrentAction() != ACTION_INVALID) {
        SendMessageToPC(OBJECT_SELF, "Concentration broken.");
        StopForceChoke();
    }
    else {
        // Check if the target is immune to stun. If not, then attempt to stun.
        if (!IsImmuneToForcePower(2, 2, oTarget)) {
            if (!WillSave(oTarget, GetForceSaveDC(2))) {
                effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
                effect eStun = EffectStunned();
                       eStun = EffectLinkEffects(eStun, eVis);
                       eStun = ExtraordinaryEffect(eStun);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, 6.0);
            }
        }
        // Calculate and apply the damage
        int nDamage = d20(10);
        effect eDamage = ExtraordinaryEffect(EffectDamage(nDamage, DAMAGE_TYPE_DARKSIDE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
        if (IsConcentrating(oTarget)) {
            AssignCommand(oTarget, BreakConcentration(nDamage, TRUE));
        }
    }

    // Continue the loop
    DelayCommand(6.0, ForceChokeLoop(oTarget));
}

void ForceChoke() {
    object oTarget = GetSpellTargetObject();
    object oPrevTarget = GetLocalObject(OBJECT_SELF, "FORCE_CHOKE_TARGET");

    // If we already have this power activated then stop it
    if (GetIsObjectValid(oTarget) && GetIsObjectValid(oPrevTarget)) {
        StopForceChoke();
    }
    // We need to be within a certain range to use this power
    else if (GetDistanceBetween(OBJECT_SELF, oTarget) > IntToFloat(GetAbilityModifier(ABILITY_WISDOM) * 3)) {
        SendMessageToPC(OBJECT_SELF, "You are too far away from the target.");
    }
    else if (ForceCostExceedsForceReserve(FORCE_COST_TELEKINESIS_3)) return;

    // Do the difficulty checks
    else if (ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_TELEKINESIS_3_ALTERATION)) {

        //AssignCommand(oPC, SpeakString("Choke loop innitiated."));
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FORCE_CHOKE));

        // Innitiate animations and local variables
        AssignCommand(oTarget, ClearAllActions(TRUE));
        SetFacingPoint(GetPosition(oTarget));
        PlayAnimation(ANIMATION_LOOPING_REACH, 1.0, 99999.0);
        SetLocalObject(OBJECT_SELF, "FORCE_CHOKE_TARGET", oTarget);
        SetIsConcentrating();

        // Do the Choke loop
        DelayCommand(6.0, ForceChokeLoop(oTarget));

        // Handle the force cost
        ForceReserveAdjustment(FORCE_COST_TELEKINESIS_3, 2);
    }
}

void StopForceChoke() {
    ClearAllActions();
    BreakConcentration();
    DeleteLocalObject(OBJECT_SELF, "FORCE_CHOKE_TARGET");
    SetLocalInt(OBJECT_SELF, "FORCE_CHOKE_STOP", TRUE);
}

void ForceResonance(int nPowerTier) {
    // If the power is already activated then deactivate
    if (IsPowerActive(SPELL_FORCE_RESONANCE_1)) {
        DeactivatePower(SPELL_FORCE_RESONANCE_1);
    }
    else if (IsPowerActive(SPELL_FORCE_RESONANCE_2)) {
        DeactivatePower(SPELL_FORCE_RESONANCE_2);
    }
    else if (IsPowerActive(SPELL_FORCE_RESONANCE_3)) {
        DeactivatePower(SPELL_FORCE_RESONANCE_3);
    }
    else {
        // Variable declaration
        int nForceDC, nWill, nForceCost, nCounterPower, bMentalImmunity;
        // Look up the power type being used
        switch(nPowerTier) {
            case 1: nForceDC = FORCE_DC_RESONANCE_1_CONTROL; nWill = 5; nForceCost = FORCE_COST_RESONANCE_1; nCounterPower = SPELL_FORCE_CORRUPTION_1; break;
            case 2: nForceDC = FORCE_DC_RESONANCE_2_CONTROL; nWill = 10; nForceCost = FORCE_COST_RESONANCE_2; nCounterPower = SPELL_FORCE_CORRUPTION_2; break;
            case 3: nForceDC = FORCE_DC_RESONANCE_3_CONTROL; nWill = 15; nForceCost = FORCE_COST_RESONANCE_3; nCounterPower = SPELL_FORCE_CORRUPTION_3; bMentalImmunity = TRUE; break;
        }
        // Is the PC under the effects of the counter power? If so, exit out.
        if (IsPowerActive(nCounterPower)) {
            SendMessageToPC(OBJECT_SELF, "You cannot use this power while under the effects of Force Corruption.");
        }

        else if (ForceCostExceedsForceReserve(nForceCost)) return;

        // Do the difficulty check
        else if (ForceSkillCheck(SKILL_CONTROL, nForceDC)) {
            // Define the effects
            effect eWill = EffectSavingThrowIncrease(SAVING_THROW_WILL, nWill);
            effect eVisual = EffectVisualEffect(VFX_DUR_PROT_PREMONITION);
            effect eLink = EffectLinkEffects(eWill, eVisual);
            if(bMentalImmunity) {
                effect eMentalImmunity = EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS);
                eLink = EffectLinkEffects(eLink, eMentalImmunity);
            }
            effect eEffect = ExtraordinaryEffect(eLink);
            // Apply the effects to the PC
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
            // Handle the fatigue
            ForceReserveAdjustment(nForceCost);
        }
    }
}

void ForceDrain(int nPowerTier) {

    // Variable Declaration
    object oTarget = GetSpellTargetObject();
    int nForceDCAlt, nForceDCCon, nForceCost, nNumDice, nDrain,
    bStrengthDec, bConstitutionDec, bDexterityDec, bHealNegatives, bLevelDec;

    // Look up the power type
    switch(nPowerTier) {
        case 1: nForceDCAlt = FORCE_DC_DRAIN_1_ALTERATION; nForceDCCon = FORCE_DC_DRAIN_1_CONTROL; nForceCost = FORCE_COST_DRAIN_1; nNumDice = 1; break;
        case 2: nForceDCAlt = FORCE_DC_DRAIN_2_ALTERATION; nForceDCCon = FORCE_DC_DRAIN_2_CONTROL; nForceCost = FORCE_COST_DRAIN_2; nNumDice = 2; bStrengthDec = TRUE; bConstitutionDec = TRUE; break;
        case 3: nForceDCAlt = FORCE_DC_DRAIN_3_ALTERATION; nForceDCCon = FORCE_DC_DRAIN_3_CONTROL; nForceCost = FORCE_COST_DRAIN_3; nNumDice = 6; bStrengthDec = TRUE; bConstitutionDec = TRUE; bHealNegatives = TRUE; bLevelDec = TRUE; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDCAlt) &&
        ForceSkillCheck(SKILL_CONTROL, nForceDCCon)) {
        // Do the fortitude save on the target
        if (!FortitudeSave(oTarget, GetForceSaveDC(nPowerTier))) {

            // Do the visual effect and signal the event
            effect eVisual = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FORCE_DRAIN_1));

            int nDamage = d100(nNumDice);

            // Damage the target and heal the PC with half of that damage dealt
            effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_DARKSIDE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            if (IsConcentrating(oTarget)) {
                AssignCommand(oTarget, BreakConcentration(nDamage, TRUE));
            }
            effect eHeal = EffectHeal(nDamage / 2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);

            // This section decreases the target's ability scores each by d4
            // and temporarily increases the PC's own with that amount
            if (!GetIsImmune(oTarget, IMMUNITY_TYPE_ABILITY_DECREASE)) {
                effect eMalusLink;
                effect eBonusLink;
                if (bStrengthDec) {
                    nDrain = d4();
                    effect eStrengthDecrease = EffectAbilityDecrease(ABILITY_STRENGTH, nDrain);
                    eMalusLink = eStrengthDecrease;
                    effect eStrengthIncrease = EffectAbilityIncrease(ABILITY_STRENGTH, nDrain);
                    eBonusLink = eStrengthIncrease;
                }
                if (bConstitutionDec) {
                    nDrain = d4();
                    effect eConstitutionDecrease = EffectAbilityDecrease(ABILITY_CONSTITUTION, nDrain);
                    eMalusLink = EffectLinkEffects(eMalusLink,eConstitutionDecrease);
                    effect eConstitutionIncrease = EffectAbilityIncrease(ABILITY_CONSTITUTION, nDrain);
                    eBonusLink = EffectLinkEffects(eBonusLink,eConstitutionIncrease);
                }
                effect eEffect = SupernaturalEffect(eMalusLink);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);

                if (!IsPowerActive(GetSpellId())) ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBonusLink, OBJECT_SELF, RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));

            }

            // Restore any negative effects on oPC
            if (bHealNegatives) RemoveNegativeEffects(OBJECT_SELF);

            // This section decreases the target's levels by d4
            if (bLevelDec && !GetIsImmune(oTarget,IMMUNITY_TYPE_NEGATIVE_LEVEL)) {
                effect eLevelDrain = EffectNegativeLevel(d4());
                effect eEffect = SupernaturalEffect(eLevelDrain);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
            }
        }
    }
    ForceReserveAdjustment(nForceCost, 2);
}

// This is the delayed command for ForceTrance() function
void DelayedForceTrance() {

    if (GetLocalInt(OBJECT_SELF, "FORCE_TRANCE_INITIATION")) {
        DeleteLocalInt(OBJECT_SELF, "FORCE_TRANCE_INITIATION");

        // Do the difficulty check
        if (ForceSkillCheck(SKILL_CONTROL, FORCE_DC_TRANCE_CONTROL)) {
            // Declare the effects to be used
            effect eAttack = EffectAttackIncrease(1);
            effect eAC = EffectACIncrease(1, AC_DODGE_BONUS);
            effect eParry = EffectSkillIncrease(SKILL_PARRY, 5);
            effect eVisual = EffectVisualEffect(VFX_DUR_SANCTUARY);
            effect eLink = EffectLinkEffects(eAttack, eAC);
                   eLink = EffectLinkEffects(eLink, eParry);
                   eLink = EffectLinkEffects(eLink, eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            // Apply the effects
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, 99999.0);
        }
        // Handle the fatigue
        ForceReserveAdjustment(FORCE_COST_TRANCE);
    }
}

void ForceTrance() {
    // If already activated, then deactivate
    if (IsPowerActive(SPELL_FORCE_TRANCE)) {
        DeactivatePower(SPELL_FORCE_TRANCE);
    }
    else if (GetLocalInt(OBJECT_SELF, "FORCE_TRANCE_INITIATION")) {
        StopForceTrance();
        FloatingTextStringOnCreature("Force Trance meditation stopped.", OBJECT_SELF, FALSE);
    }
    else if (ForceCostExceedsForceReserve(FORCE_COST_TRANCE)) return;

    else {
        SetLocalInt(OBJECT_SELF, "FORCE_TRANCE_INITIATION", TRUE);
        AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 60.0));
        DelayCommand(60.0, DelayedForceTrance());
    }
}

void StopForceTrance() {
    if (GetLocalInt(OBJECT_SELF, "FORCE_TRANCE_INITIATION")) {
        DeleteLocalInt(OBJECT_SELF, "FORCE_TRANCE_INITIATION");
        ClearAllActions();
    }
}

void GuardianSafeguard() {
    // You can't deactivate this ability
    if (IsPowerActive(SPELL_FORCE_SAFEGUARD)) {
       FloatingTextStringOnCreature("You cannot deactivate this power.", OBJECT_SELF, FALSE);
       return;
    }

    if (ForceCostExceedsForceReserve(FORCE_COST_SAFEGUARD)) return;

    // Do the difficulty checks
    if (ForceSkillCheck(SKILL_CONTROL, FORCE_DC_SAFEGUARD_CONTROL)) {
        // Establish the duration according to the Guardian's wisdom modifier
        float fDuration = TurnsToSeconds(GetAbilityModifier(ABILITY_WISDOM));
        // Calculate the bonuses for the ability
        int nLevel = 1 + GetLevelByClass(CLASS_TYPE_JEDI_GUARDIAN, OBJECT_SELF) / 5;
        int nSaves = 3;
        int nAC = 3;
        if (nLevel > 1) {
            nSaves += nLevel * 2; // +2 to saving throws every 5 levels
            nAC += nLevel * 2; // +2 to AC every 5 levels
        }
        // Declare the effects with all the bonuses
        effect eSaves = EffectSavingThrowIncrease(SAVING_THROW_ALL, nSaves);
        effect eAC = EffectACIncrease(nAC);
        effect eVisual = EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MAJOR);
        effect eVisual2 = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
        effect eLink = EffectLinkEffects(eSaves, eAC);
        eLink = EffectLinkEffects(eLink, eVisual);
        effect eEffect = ExtraordinaryEffect(eLink);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual2, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, OBJECT_SELF, fDuration);

        // Handle the fatigue
        ForceReserveAdjustment(FORCE_COST_SAFEGUARD, 1);
    }
}

void ForceSuppression() {

    if (ForceCostExceedsForceReserve(FORCE_COST_SUPPRESSION)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_SUPPRESSION_ALTERATION)) {
        // Variable declaration
        int nMax = d4();
        int nRemoved, nPowerId;
        object oTarget = GetSpellTargetObject();

        effect ePower = GetFirstEffect(oTarget);
        while (GetIsEffectValid(ePower)) {
            nPowerId = GetEffectSpellId(ePower);
            switch (nPowerId) {
                case SPELL_FORCE_RESONANCE_3: // Resonance
                case SPELL_FORCE_RESONANCE_2:
                case SPELL_FORCE_RESONANCE_1:
                case SPELL_FORCE_SIGHT_3: // Sense
                case SPELL_FORCE_SIGHT_2:
                case SPELL_FORCE_SIGHT_1:
                case SPELL_FORCE_CLOAK: // Cloak
                case SPELL_FORCE_VIGOR_2: // Vigor
                case SPELL_FORCE_VIGOR_1:
                case SPELL_FORCE_PROTECTION_4: // Protection
                case SPELL_FORCE_PROTECTION_3:
                case SPELL_FORCE_PROTECTION_2:
                case SPELL_FORCE_PROTECTION_1:
                case SPELL_FORCE_REGENERATION_4: // Regeneration
                case SPELL_FORCE_REGENERATION_3:
                case SPELL_FORCE_REGENERATION_2:
                case SPELL_FORCE_REGENERATION_1:
                case SPELL_FORCE_TRANCE: // Trance
                case SPELL_JEDI_PSYCHOMANCIE_3: // Psychomancy
                case SPELL_JEDI_PSYCHOMANCIE_2:
                case SPELL_JEDI_PSYCHOMANCIE_1: RemoveEffect(oTarget, ePower); nRemoved++; break;
            }
            if (nRemoved >= nMax) break;
            else ePower = GetNextEffect(oTarget);
        }

        // Handle the fatigue
        ForceReserveAdjustment(FORCE_COST_SUPPRESSION);
    }
}

void ForceHorror(int nPowerTier) {
    // Variable declaration
    int nForceDCAlt, nForceDCSen, nForceCost;
    object oTarget = GetSpellTargetObject();

    // Look up the power type
    switch (nPowerTier) {
        case 1: nForceDCAlt = FORCE_DC_HORROR_1_ALTERATION; nForceDCSen = FORCE_DC_HORROR_1_SENSE; nForceCost = FORCE_COST_HORROR_1; break;
        case 2: nForceDCAlt = FORCE_DC_HORROR_2_ALTERATION; nForceDCSen = FORCE_DC_HORROR_2_SENSE; nForceCost = FORCE_COST_HORROR_2; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDCAlt) &&
        ForceSkillCheck(SKILL_SENSE, nForceDCSen)) {

        // Declare the fear effects being used
        effect eFear = EffectFrightened();
        effect eVisual = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
        effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
        effect eLink = EffectLinkEffects(eFear, eVisual);
        eLink = EffectLinkEffects(eLink, eCessate);
        effect eEffect = ExtraordinaryEffect(eLink);
        float fDuration = RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM));

        // For single targets
        if (oTarget != OBJECT_INVALID) {
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FORCE_HORROR_1)); // Signal EventSpellCastAt

            // Check if the target is immune. Force Resonance II and Force Conditioning I give immunity.
            if (!IsImmuneToForcePower(1, 3, oTarget)) {
                if (!WillSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_FEAR, OBJECT_SELF)) {
                    // Apply the fear effects
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, fDuration);
                }
            }
        }

        // For multiple targets
        else {
            location lPC = GetLocation(OBJECT_SELF);

            // Cycle through all targets in the area of effect
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lPC, TRUE);
            while (GetIsObjectValid(oTarget)) {
                // Make sure the target not the caster and is either a PC or an enemy
                if (oTarget != OBJECT_SELF && (GetIsPC(oTarget) || GetIsEnemy(oTarget, OBJECT_SELF))) {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FORCE_HORROR_1)); // Signal EventSpellCastAt

                    // Check if the target is immune. Force Resonance III and Force Conditioning I give immunity.
                    if (!IsImmuneToForcePower(2, 3, oTarget)) {
                        if (!WillSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_FEAR, OBJECT_SELF)) {
                            // Apply the fear effects
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, fDuration);
                        }
                    }
                }
                // Get the next target in the area of effect
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lPC, TRUE);
            }
        }

        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 2);
    }
}

void ForceStun(int nPowerTier) {
    // Variable declaration
    int nForceDC, nForceCost, bStasis;
    int nWisMod = GetAbilityModifier(ABILITY_WISDOM);
    object oTarget = GetSpellTargetObject();

    // Look up the power type
    switch (nPowerTier) {
        case 1: nForceDC = FORCE_DC_STUN_1_ALTERATION; nForceCost = FORCE_COST_STUN_1; break;
        case 2: nForceDC = FORCE_DC_STUN_2_ALTERATION; nForceCost = FORCE_COST_STUN_2; bStasis = TRUE; break;
        case 3: nForceDC = FORCE_DC_STUN_3_ALTERATION; nForceCost = FORCE_COST_STUN_3; break;
    }

    if (ForceCostExceedsForceReserve(nForceCost)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, nForceDC)) {

        // Declare the stun effects
        effect eVisual = EffectVisualEffect(VFX_IMP_STUN); // Impact visual
        effect eStun = EffectStunned();
        effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
        effect eLink = EffectLinkEffects(eMind, eStun);
        effect eEffect = ExtraordinaryEffect(eLink);
        // Declare the stasis effects
        effect eDecStr = EffectAbilityDecrease(ABILITY_STRENGTH, 6);
        effect ePulse = EffectVisualEffect(VFX_DUR_BLUR);
        effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
        effect eLink2 = EffectLinkEffects(eDecStr, ePulse);
        eLink2 = EffectLinkEffects(eLink2, eCessate);
        effect eEffect2 = ExtraordinaryEffect(eLink2);

        // For single targets
        if (oTarget != OBJECT_INVALID) {
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FORCE_STUN_1)); // Signal EventSpellCastAt

            // Check if the target is immune.
            if (!IsImmuneToForcePower(nPowerTier, 2, oTarget)) {
                if (!WillSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF)) {
                    // Apply the stun effects
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, RoundsToSeconds(nWisMod));
                    if (bStasis) ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect2, oTarget, RoundsToSeconds(nWisMod*2));
                }
            }
        }

        // For multiple targets
        else {
            location lPC = GetLocation(OBJECT_SELF);

            // Cycle through all targets in the area of effect
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lPC, TRUE);
            while (GetIsObjectValid(oTarget)) {
                // Make sure the target not the caster and is either a PC or an enemy
                if (oTarget != OBJECT_SELF && (GetIsPC(oTarget) || GetIsEnemy(oTarget, OBJECT_SELF))) {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FORCE_STUN_3)); // Signal EventSpellCastAt

                    // Check if the target is immune.
                    if (!IsImmuneToForcePower(nPowerTier, 2, oTarget)) {
                        if (!WillSave(oTarget, GetForceSaveDC(nPowerTier), SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF)) {
                            // Apply the fear effects
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, RoundsToSeconds(nWisMod));
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect2, oTarget, RoundsToSeconds(nWisMod*2));
                        }
                    }
                }
                // Get the next target in the area of effect
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lPC, TRUE);
            }
        }

        // Handle the fatigue
        ForceReserveAdjustment(nForceCost, 1);
    }
}

void ForceLight() {
    object oTarget = GetSpellTargetObject();

    if (ForceCostExceedsForceReserve(FORCE_COST_LIGHT)) return;

    // Do the difficulty check
    if (ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_LIGHT_ALTERATION)) {
        // Check if the target is on the dark side
        if (GetIsDarkSide(oTarget)) {
            // Do the will save for the target
            if (!WillSave(oTarget, GetForceSaveDC(4))) {
                effect eVisual = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
                FloatingTextStringOnCreature("You feel the power of the dark side leaving you.", oTarget, FALSE);
                // Deal out fatigue to the target equal to the PC's Force Level
                SetForce(GetForce(oTarget) / 2, oTarget);
            }
        }
        else FloatingTextStringOnCreature("No dark side energy to purge.", OBJECT_SELF, FALSE);

        // Handle the fatigue
        ForceReserveAdjustment(FORCE_COST_LIGHT, 1);
    }
}

void ForceTelekinesisLevitateLightsaber() {

}

void ForceBlindness() {
    if (ForceCostExceedsForceReserve(FORCE_COST_BLINDNESS)) return;

    if (ForceSkillCheck(SKILL_ALTERATION, FORCE_DC_BLINDNESS_ALTERATION)) {

        object oTarget = GetSpellTargetObject();

        if (!FortitudeSave(oTarget, GetForceSaveDC(2))) {
            effect eBlind = EffectBlindness();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oTarget, RoundsToSeconds(GetAbilityModifier(ABILITY_WISDOM)));
        }

        ForceReserveAdjustment(FORCE_COST_BLINDNESS, 2);
    }
}

void ForceBody(int nPowerTier) {
    if (GetLocalInt(OBJECT_SELF, "FORCE_BODY") != 0) {
        FloatingTextStringOnCreature("Force Body deactivated.", OBJECT_SELF, FALSE);
        DeleteLocalInt(OBJECT_SELF, "FORCE_BODY");
    }
    else {
        FloatingTextStringOnCreature("Force Body activated.", OBJECT_SELF, FALSE);
        SetLocalInt(OBJECT_SELF, "FORCE_BODY", nPowerTier);
    }
}

void ForceFarSight() {

}

//void main() {}
