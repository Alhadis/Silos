// This is a library that holds functions dealing with item activation
// specific to TLJ

#include "tlj_inc_generic"
#include "x2_inc_itemprop"

// CONSTANTS ///////////////////////////////////////////////////////////////////

const int BASE_DC_GRENADE = 50;
const int BASE_DC_ROCKET = 54;
const float STEALTH_FIELD_DURATION = 60.0;
const float STEALTH_FIELD_OVERHEAT_DURATION = 30.0;

// FUNCTION DECLARATIONS ///////////////////////////////////////////////////////

// Sub function for the ThrowGrenade() and FireRocket() functions. This
// retrieves the damage bonus gained from the Explosives Expertise Feat.
int GetDemolitionsDamageBonus(object oPC);

// Subfunction for the ThrowGrenade() and FireRocket() functions. This
// retrieves the DC bonus gained from ranks in the demolitions skill.
int GetDemolitionsDCBonus(object oPC);

// Does a grenade type (direct or splash on miss)
// - oPC: The creature throwing the grenade
// - nGrenadeType: SPELL_GRENADE_*
void ThrowGrenade(object oPC, int nGrenadeType, location lImpact);

// Heals a creature with bacta
// - oPC: The creature using the bacta
// - nBactaType: SPELL_BACTA_*
void UseBacta(object oPC, int nBactaType, object oTarget);

// This function returns TRUE if oLauncher is already loaded with a rocket.
int IsRocketLauncherLoaded(object oLauncher);

// Used to load the proper rocket type on oLauncher. We save nRocketType as a
// variable then add a rocket "spell" to oLauncher.
// - nRocketType: ROCKET_TYPE_*
//
// Note that this function will not run if oLauncher is not an item.
void LoadRocket(object oLauncher, object oRocket, int nRocketType);

// Subfunction for FireRocket() function.
// Reset the launcher by removing the "spell" for the rocket from it. This also
// removes the rocket type variable stored away.
int UnloadRocket(object oLauncher);

// Does a rocket type (direct or splash on miss)
// - oPC: The creature shooting the rocket
// - oLauncher: The item that launches the rocket.
// - nRocketType: ROCKET_TYPE_*
void FireRocket(object oPC, object oLauncher, location lImpact);

// Activate stealth field for oPC
void ActivateStealthField(object oPC);

// Activate heat vision for oPC
void ActivateThermalVision(object oPC);

// FUNCTION DEFINITIONS ////////////////////////////////////////////////////////

int GetDemolitionsDamageBonus(object oPC) {
    int nBonus;
    if (GetHasFeat(FEAT_EXPLOSIVES_EXPERTISE, oPC)) {
        nBonus = (GetLevelByClass(CLASS_TYPE_DEMOLITIONS_EXPERT, oPC) + 1) / 2;
    }
    return nBonus;
}

int GetDemolitionsDCBonus(object oPC) {
    int nBonus = GetSkillRank(SKILL_DEMOLITIONS, oPC) / 4;
    return nBonus;
}

void ThrowGrenade(object oPC, int nGrenadeType, location lImpact) {

    // Variable declarations
    object oTarget;
    location lTarget;
    location lPC = GetLocation(oPC);
    int nDistance = FloatToInt(GetDistanceBetweenLocations(lPC, lImpact) / 3);
    int nDamageType, nDamageDice, nDamage, nSaveType, bHarmful, bDeathChance,
    bDeafChance, bConfuseChance, bFreezeChance, bDroidStunChance;
    int nDamBonus = GetDemolitionsDamageBonus(oPC);
    int nDCBonus = GetDemolitionsDCBonus(oPC);
    int nDC = BASE_DC_GRENADE + nDCBonus - nDistance;
    effect eDamage, eSplashVisual;
    effect eScreenShake = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
    effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);

    // Look up the grenade type that was used and configure the
    // actions to take accordingly. We also take care of all the
    // unique impact visual effects here and start up AOEs.
    switch (nGrenadeType) {
        case SPELL_GRENADE_ADHESIVE: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
        // Start AOE
            effect eAOE = EffectAreaOfEffect(AOE_PER_EVARDS_BLACK_TENTACLES, "tlj_gren_adh_ent", "tlj_gren_adh_hb", "****");
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lImpact, TurnsToSeconds(d6()));
            break;
        }
        case SPELL_GRENADE_CRYOBAN: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_IMP_PULSE_COLD);
            effect eImpactVisual2 = EffectVisualEffect(VFX_IMP_FROST_L);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual2, lImpact);
            eSplashVisual = EffectVisualEffect(VFX_IMP_FROST_S);
        // Configurations
            bHarmful = TRUE;
            bFreezeChance = TRUE;
            nSaveType = SAVING_THROW_TYPE_COLD;
            nDamageType = DAMAGE_TYPE_COLD;
            nDamageDice = 9;
            break;
        }
        case SPELL_GRENADE_FRAGMENTATION: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_FNF_FIREBALL);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
            eSplashVisual = EffectVisualEffect(VFX_IMP_FLAME_M);
        // Configurations
            bHarmful = TRUE;
            nSaveType = SAVING_THROW_TYPE_NONE;
            nDamageType = DAMAGE_TYPE_BLUDGEONING;
            nDamageDice = 15;
            break;
        }
        case SPELL_GRENADE_GAS: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
        // Start AOE
            effect eAOE = EffectAreaOfEffect(AOE_PER_FOG_OF_BEWILDERMENT, "tlj_gren_gas_ent", "****", "tlj_gren_gas_ext");
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lImpact, TurnsToSeconds(d6()));
            break;
        }
        case SPELL_GRENADE_ION: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
            eSplashVisual = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
        // Configurations
            bHarmful = TRUE;
            bDroidStunChance = TRUE;
            nSaveType = SAVING_THROW_TYPE_NONE;
            nDamageType = DAMAGE_TYPE_ION;
            nDamageDice = 6;
            break;
        }
        case SPELL_GRENADE_PLASMA: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_FNF_FIREBALL);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
            eSplashVisual = EffectVisualEffect(VFX_IMP_FLAME_M);
        // Configurations
            bHarmful = TRUE;
            nSaveType = SAVING_THROW_TYPE_FIRE;
            nDamageType = DAMAGE_TYPE_FIRE;
            nDamageDice = 21;
            break;
        }
        case SPELL_GRENADE_SONIC: {
        // Visuals
            effect eSonicWave = EffectVisualEffect(VFX_FNF_HOWL_MIND);
            effect eImpactVisual = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_HOLY);
            vector vImpact = GetPositionFromLocation(lImpact);
            vImpact.z += 1.0;
            location lSonicBlast = Location(GetArea(oPC), vImpact, 0.0);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSonicWave, lSonicBlast);
            eSplashVisual = EffectVisualEffect(VFX_COM_HIT_SONIC);
        // Configurations
            bHarmful = TRUE;
            bDeafChance = TRUE;
            bConfuseChance = TRUE;
            nSaveType = SAVING_THROW_TYPE_SONIC;
            nDamageType = DAMAGE_TYPE_SONIC;
            nDamageDice = 3;
            break;
        }
        case SPELL_GRENADE_THERMAL: {
        // Visuals
            effect eImpactVisual = EffectVisualEffect(VFX_FNF_HELLBALL);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);
            eSplashVisual = EffectVisualEffect(VFX_IMP_FLAME_M);
        // Configurations
            bHarmful = TRUE;
            bDeathChance = TRUE;
            nSaveType = SAVING_THROW_TYPE_NONE;
            nDamageType = DAMAGE_TYPE_ENERGY;
            nDamageDice = 27;
            break;
        }
        default: return;
    }

    // This next section only applies to harmful grenades
    if (bHarmful) {

        // Cycle through all the targets caught within the blast radius
        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
        while (GetIsObjectValid(oTarget)) {

            // We only run stuff if the target is alive
            if (!GetIsDead(oTarget)) {

                SignalEvent(oTarget, EventSpellCastAt(oPC, nGrenadeType));

                // Perform visuals on the target
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eScreenShake, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eSplashVisual, oTarget);

                // If the grenade has a chance to instantly kill then
                // make the target roll to save against it
                if (bDeathChance) {
                    if (!FortitudeSave(oTarget, nDC, nSaveType)) {
                        effect eDeath = EffectDeath();
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
                    }
                }

                // If the grenade has a chance to freeze then
                // make the target roll to save against it
                if (bFreezeChance) {
                    // Lower Dexterity by 6 but make sure it doesn't go below 1
                    int nDexterity = GetAbilityScore(oTarget, ABILITY_DEXTERITY, TRUE);
                    int nDecrease = 6;
                    if (nDexterity <= 6) nDecrease = nDexterity - 1;
                    effect eFreezeDex = EffectAbilityDecrease(ABILITY_DEXTERITY, nDecrease);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreezeDex, oTarget, RoundsToSeconds(d6()));

                    if (!GetLocalInt(oTarget, "GRENADE_FREEZE")) {
                        if (!FortitudeSave(oTarget, nDC)) {
                            effect eFreeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
                            effect eFreezeSkin = EffectVisualEffect(VFX_DUR_ICESKIN);

                            SetLocalInt(oTarget, "GRENADE_FREEZE", TRUE);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, oTarget, 60.0);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreezeSkin, oTarget, 60.0);
                            SetCommandable(FALSE, oTarget);

                            DelayCommand(60.0, SetCommandable(TRUE, oTarget));
                            DelayCommand(60.0, DeleteLocalInt(oTarget, "GRENADE_FREEZE"));
                        }
                    }
                }

                // If the grenade has a chance to stun droids and the target
                // is a droid then make the target roll a save against it
                if (bDroidStunChance && GetRacialType(oTarget) == RACIAL_TYPE_DROID) {
                    if (!WillSave(oTarget, nDC)) {
                        effect eStunVisual = EffectVisualEffect(VFX_IMP_STUN);
                        effect eStun = EffectStunned();
                        eStun = EffectLinkEffects(eCessate, eStun);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eStunVisual, oTarget);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, RoundsToSeconds(d6()));
                    }
                }

                // If the grenade has a chance to cause deafness then
                // make the target roll a save against it
                if (bDeafChance) {
                    if (!FortitudeSave(oTarget, nDC)) {
                        effect eDeafVisual = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
                        effect eDeaf = EffectDeaf();
                        eDeaf = EffectLinkEffects(eCessate, eDeaf);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeafVisual, oTarget);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDeaf, oTarget, TurnsToSeconds(d6()));
                    }
                }

                // If the grenade has a chance to confuse then
                // make the target roll a save against it
                if (bConfuseChance && (GetIsEnemy(oTarget, oPC) || GetIsPC(oTarget))) {
                    if (!WillSave(oTarget, nDC)) {
                        effect eConfuseVisual = EffectVisualEffect(VFX_IMP_CONFUSION_S);
                        effect eConfuse = EffectConfused();
                        effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
                        eConfuse = EffectLinkEffects(eCessate, eConfuse);
                        eConfuse = EffectLinkEffects(eMind, eConfuse);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eConfuseVisual, oTarget);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eConfuse, oTarget, RoundsToSeconds(d6()));
                    }
                }

                // Grab the location of the current target and find the distance
                // between it and the location of the innitial impact of the grenade
                // then use it to adjust splash damage dealt to the target.
                lTarget = GetLocation(oTarget);
                nDamageDice += nDamBonus - FloatToInt(GetDistanceBetweenLocations(lTarget, lImpact) / 3);
                if (nDamageDice < 1) nDamageDice = 1; // Make sure we roll at least 1 die
                nDamage = d20(nDamageDice);

                // Adjust the splash damage by the target's reflex and evasion
                nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nDC, nSaveType);

                // Apply the splash damage to the target
                eDamage = EffectDamage(nDamage, nDamageType, DAMAGE_POWER_PLUS_TWENTY);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
        }
    }
}

void UseBacta(object oPC, int nBactaType, object oTarget) {

    // If the user is in combat then exit out
    if (GetIsInCombat(oPC)) {
        FloatingTextStringOnCreature("You cannot use bacta while in combat.", oPC, FALSE);
        return;
    }

    // Get the heal skill bonus from the bacta user
    int nHealSkill = GetSkillRank(SKILL_HEAL, oPC) / 5;

    // Make sure the heal skill bonus doesn't go below 1
    if (nHealSkill < 1) nHealSkill = 1;

    // Variable declarations
    int nDamageToHeal, nMultiplier;

    // Determine the heal multiplier by the bacta type
    switch (nBactaType) {
        case SPELL_BACTA_I: nMultiplier = 1; break;
        case SPELL_BACTA_II: nMultiplier = 2; break;
        case SPELL_BACTA_III: nMultiplier = 3; break;
        case SPELL_BACTA_IV: nMultiplier = 4; break;
        default: nMultiplier = 1; break;
    }

    // Calculate the damage to be healed
    nDamageToHeal = d20(nHealSkill) * nMultiplier;

    // If the target has been restored to full HP, then remove any drain effects
    if (GetMaxHitPoints(oTarget) <= GetCurrentHitPoints(oTarget) + nDamageToHeal) {
        effect eEffect = GetFirstEffect(oTarget);
        int nEffectType;
        while (GetIsEffectValid(eEffect)) {
            nEffectType = GetEffectType(eEffect);
            if (nEffectType == EFFECT_TYPE_ABILITY_DECREASE ||
                nEffectType == EFFECT_TYPE_NEGATIVELEVEL) {
                RemoveEffect(oTarget, eEffect);
            }
            eEffect = GetNextEffect(oTarget);
        }
    }

    // Heal the target
    effect eHeal = EffectHeal(nDamageToHeal);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
}

int IsRocketLauncherLoaded(object oLauncher) {
    if (!GetLocalInt(oLauncher, "ROCKET_TYPE")) return FALSE;
    else return TRUE;
}

void LoadRocket(object oLauncher, object oRocket, int nRocketType) {
    // Make sure the object is an item. If not, then exit out.
    if (GetObjectType(oLauncher) != OBJECT_TYPE_ITEM) return;

    // Destroy the rocket item that was loaded
    int nStack = GetItemStackSize(oRocket);
    if (nStack == 1) DestroyObject(oRocket);
    else if (nStack > 1) {
        SetItemStackSize(oRocket, nStack - 1);
        //DestroyObject(oRocket);
    }

    IPSafeAddItemProperty(oLauncher, ItemPropertyCastSpell(IP_CONST_CASTSPELL_ROCKET, IP_CONST_CASTSPELL_NUMUSES_UNLIMITED_USE));
    SetLocalInt(oLauncher, "ROCKET_TYPE", nRocketType);
}

void UnloadRocket(object oLauncher) {
    itemproperty ip = GetFirstItemProperty(oLauncher);
    while (GetIsItemPropertyValid(ip)) {
        if (GetItemPropertyType(ip) == ITEM_PROPERTY_CAST_SPELL) {
            if (GetItemPropertySubType(ip) == IP_CONST_CASTSPELL_ROCKET) {
                RemoveItemProperty(oLauncher, ip);
                DeleteLocalInt(oLauncher, "ROCKET_TYPE");
                break;
            }
            else ip = GetNextItemProperty(oLauncher);
        }
        else ip = GetNextItemProperty(oLauncher);
    }
}

void FireRocket(object oPC, object oLauncher, location lImpact) {

    int nRocketType = GetLocalInt(oLauncher, "ROCKET_TYPE");
    if (nRocketType < 1) nRocketType = ROCKET_TYPE_CONCUSSION;

    // Variable declarations
    object oTarget;
    location lTarget;
    location lPC = GetLocation(oPC);
    int nDistance = FloatToInt(GetDistanceBetweenLocations(lPC, lImpact) / 5);
    int nDamage;
    int nDamageDice = GetDemolitionsDamageBonus(oPC);
    int nDCBonus = GetDemolitionsDCBonus(oPC);
    int nDC = BASE_DC_ROCKET + nDCBonus - nDistance;
    effect eDamage;
    effect eImpactVisual = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eSplashVisual = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eScreenShake = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);

    //FloatingTextStringOnCreature("Distance:" + IntToString(nDistance), oPC, FALSE);

    // Look up the rocket type that was used and
    // configure the amount of dice accordingly
    switch (nRocketType) {
        case ROCKET_TYPE_MINI_CONCUSSION: nDamageDice += 12; break;
        case ROCKET_TYPE_CONCUSSION: nDamageDice += 18; break;
        default: return;
    }

    // Unload the rocket from the launcher
    UnloadRocket(oLauncher);

    // Do the impact visual
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVisual, lImpact);

    // Cycle through all the targets caught within the blast radius
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_GARGANTUAN, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    while (GetIsObjectValid(oTarget)) {

        // We only run stuff if the target is alive
        if (!GetIsDead(oTarget)) {

            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_ROCKET));

            // Perform visuals on the target
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eScreenShake, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eSplashVisual, oTarget);

            // Grab the location of the current target and find the distance
            // between it and the location of the innitial impact of the rocket
            // then use it to adjust splash damage dealt to the target.
            lTarget = GetLocation(oTarget);
            nDamageDice -= - FloatToInt(GetDistanceBetweenLocations(lTarget, lImpact) / 3);
            if (nDamageDice < 1) nDamageDice = 1; // Make sure we roll at least 1 die
            nDamage = d20(nDamageDice) / 2;

            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nDC);

            // Apply the fire splash damage to the target
            eDamage = EffectDamage(nDamage, DAMAGE_TYPE_FIRE, DAMAGE_POWER_PLUS_TWENTY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);

            // Apply the physical splash damage to the target
            eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_PLUS_TWENTY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_GARGANTUAN, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    }
}

void StealthFieldDeactivate(object oPC) {
    if (GetLocalInt(oPC, "STEALTH_FIELD_OVERHEATING")) return;

    // Remove the stealth field bonuses
    effect eStealth = GetFirstEffect(oPC);
    while (GetIsEffectValid(eStealth)) {
        if (GetEffectSpellId(eStealth) == SPELL_STEALTH_FIELD) RemoveEffect(oPC, eStealth);
        eStealth = GetNextEffect(oPC);
    }

    DeleteLocalInt(oPC, "STEALTH_FIELD_ACTIVATED");
    SetLocalInt(oPC, "STEALTH_FIELD_OVERHEATING", TRUE);
    DelayCommand(STEALTH_FIELD_OVERHEAT_DURATION, DeleteLocalInt(oPC, "STEALTH_FIELD_OVERHEATING"));
}

// Internal function for ActivateStealthField()
void StealthFieldLoop(object oPC) {
    if (!GetLocalInt(oPC, "STEALTH_FIELD_ACTIVATED")) return; // Exit if stealth field is off

    // If we exited stealth mode then turn off the stealth field and force
    // it into an overheating session
    if (GetStealthMode(oPC) != STEALTH_MODE_ACTIVATED) {
        StealthFieldDeactivate(oPC);
    }

    DelayCommand(6.0, StealthFieldLoop(oPC));
}

void ActivateStealthField(object oPC) {
    if (GetLocalInt(oPC, "STEALTH_FIELD_OVERHEATING")) {
        FloatingTextStringOnCreature("Stealth field generator has overheated.", oPC, FALSE);
        return;
    }
    if (GetLocalInt(oPC, "STEALTH_FIELD_ACTIVATED")) {
        FloatingTextStringOnCreature("Stealth field generator is already active.", oPC, FALSE);
        return;
    }

    // Add our 25% hide bonus
    int nHideBonus = GetSkillRank(SKILL_HIDE, oPC) * 5 / 4;
    effect eHide = EffectLinkEffects(EffectSkillIncrease(SKILL_HIDE, nHideBonus), EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHide, oPC, STEALTH_FIELD_DURATION);

    // Temporarily add HIPS and enter into stealth mode
    IPSafeAddItemProperty(GetItemPossessedBy(oPC, "TLJ_PC_PROPS"), ItemPropertyBonusFeat(IP_CONST_FEAT_HIDE_IN_PLAIN_SIGHT), 0.5);
    SetActionMode(oPC, ACTION_MODE_STEALTH, TRUE);

    // Start a loop to continuously check if we exited stealth mode
    StealthFieldLoop(oPC);
    DelayCommand(STEALTH_FIELD_DURATION, StealthFieldDeactivate(oPC));
}

void ActivateThermalVision(object oPC) {
    effect eEyes = EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
    effect eSpot = EffectSkillIncrease(SKILL_SPOT, 50);
    effect eLink = EffectLinkEffects(eEyes, eSpot);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, 60.0);
}

//void main() {}
