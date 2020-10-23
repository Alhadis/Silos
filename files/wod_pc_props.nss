///////////////////////////////////////////////////////////////////////////////
// This script takes care of all the special properties for PCs that are given
// out through race & class.
///////////////////////////////////////////////////////////////////////////////

//#include "tlj_inc_force"
#include "x2_inc_itemprop"
#include "_mdrn_const"
#include "wod_inc"

void main() {
    object oPC = OBJECT_SELF;
    //int bHasBlasterActions;

    // Retrieve the PC's props hide, if any.
    object oItem = GetItemPossessedBy(oPC, "WOD_PC_PROPS");

    // Does the hide exist?
    if (oItem == OBJECT_INVALID) {
        // If it doesn't, destroy any invalid hide that's equipped
        oItem = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
        if (oItem != OBJECT_INVALID) DestroyObject(oItem);
        // Create a new hide
        oItem = CreateItemOnObject("WOD_PC_PROPS", oPC);
    }
    else { // If it does exist, then remove all item properties on the hide
        itemproperty ip = GetFirstItemProperty(oItem);
        int bRemoveip;
        while (GetIsItemPropertyValid(ip)) {
            bRemoveip = TRUE;

            // Go through feats
            if (GetItemPropertyType(ip) == ITEM_PROPERTY_BONUS_FEAT) {

            }

            // Unless other specified, remove the item property
            if (bRemoveip) RemoveItemProperty(oItem, ip);

            ip = GetNextItemProperty(oItem);
        }
    }

// Universal Properties ////////////////////////////////////////////////////////

    // Make it so the PC can't "bump" others around
    effect eGhost = EffectCutsceneGhost();
    eGhost = SupernaturalEffect(eGhost);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oPC);


    // Add Blaster Actions if the PC doesn't already have it
    //if (!bHasBlasterActions) IPSafeAddItemProperty(oItem, ItemPropertyBonusFeat(IP_CONST_FEAT_BLASTER_ACTIONS));

// Racial Properties ///////////////////////////////////////////////////////////

    int nRace = GetRacialType(oPC);

    // Basic Droids
    // Commented out immunity to mind spells so the stun effect from ion grenades works
    //if (nRace == RACIAL_TYPE_DROID) {
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_PARALYSIS));
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_FEAR));
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_MINDSPELLS));
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DEATH_MAGIC));
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DISEASE));
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN));
        //IPSafeAddItemProperty(oItem, ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_POISON));
       // IPSafeAddItemProperty(oItem, ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_20, IP_CONST_DAMAGESOAK_10_HP));
        //IPSafeAddItemProperty(oItem, ItemPropertyDamageVulnerability(IP_CONST_DAMAGETYPE_ION, IP_CONST_DAMAGEVULNERABILITY_100_PERCENT));
        //IPSafeAddItemProperty(oItem, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 4));
    //}

    // Kindred
    //if (nRace == RACIAL_TYPE_KINDRED){


    //}


// Class Properties ////////////////////////////////////////////////////////////

    // Dracling properties
    //if (GetLevelByClass(CLASS_TYPE_DRAGON_DISCIPLE, oPC) > 0) {
        //IPSafeAddItemProperty(oItem, ItemPropertyDamageVulnerability(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGEVULNERABILITY_50_PERCENT));
    //}

   //RecalculateMaxForce(oPC);

// Feat Properties /////////////////////////////////////////////////////////////

    // Damage Reduction granted through Dreadnought Class
    //if (GetHasFeat(FEAT_DAMAGE_REDUCTION_20_10, oPC)) {
        //IPSafeAddItemProperty(oItem, ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_20, IP_CONST_DAMAGESOAK_10_HP));
    //}
    //else if (GetHasFeat(FEAT_DAMAGE_REDUCTION_20_5, oPC)) {
        //IPSafeAddItemProperty(oItem, ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_20, IP_CONST_DAMAGESOAK_5_HP));
    //}

     // Set variables.
     SetLocalInt(oItem, "bloodcount", 10);
     SetLocalInt(oItem, "frenzy", 0);

    // Equip the hide
    if (GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC) != oItem) {
        AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_CARMOUR));
    }

displayBlood(oPC);
    //SendMessageToPC(oPC, "PC Properties loading complete.");
}
