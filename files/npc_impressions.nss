//::///////////////////////////////////////////////
//:: npc_impressions.nss
//:://////////////////////////////////////////////
/*
    Include file with constants and helper functions
    for dealing with NPC attitudes, reactions and
    interactions. Intended for expanded roleplaying
    and social interactions. Includes NPC gender
    preferences, personality, clothing and reactions.
*/
//:://////////////////////////////////////////////
//:: Created By:  Eric Sisco
//:: Created On:  May 2018
//:://////////////////////////////////////////////

// Personality Constants
const int NPC_PERSONALITY_STOIC = 0;
const int NPC_PERSONAILTY_EVERYPERSON = 1;
const int NPC_PERSONAILTY_HERO = 2;
const int NPC_PERSONAILTY_CAREGIVER = 3;
const int NPC_PERSONAILTY_EXPLORER = 4;
const int NPC_PERSONAILTY_LOVER = 5;
const int NPC_PERSONAILTY_OUTLAW = 6;
const int NPC_PERSONAILTY_INNOVATOR = 7;
const int NPC_PERSONAILTY_DOMINANT = 8;
const int NPC_PERSONAILTY_DREAMER = 9;
const int NPC_PERSONAILTY_SAGE = 10;
const int NPC_PERSONAILTY_JESTER = 11;
const int NPC_PERSONAILTY_ABRASIVE = 12;
const int NPC_PERSONAILTY_INNOCENT = 13;
const int NPC_PERSONAILTY_OPPORTUNIST = 14;
const int NPC_PERSONAILTY_HEDONIST = 15;
const int NPC_PERSONAILTY_SUBMISSIVE = 16;
const int NPC_PERSONAILTY_COWARD = 17;

// Gender constants already defined in NWScript
// GENDER_MALE
// GENDER_FEMALE
// GENDER_BOTH
// GENDER_NONE
// GENDER_OTHER

// Clothing Constants
const int CLOTHES_AVERAGE = 0;
const int CLOTHES_UNDERWEAR = 1;
const int CLOTHES_REVEALING = 2;
const int CLOTHES_NAKED = 3;
const int CLOTHES_MODEST = 4;
const int CLOTHES_CONCEALING = 5;

// Personality Functions

// Get the personality of this creature
// Return value is the NPC_PERSONALITY constant of the creature
int GetPersonality(object oCreature) {
    return GetLocalInt(oCreature, "NPC_PERSONALITY");
}

// Set the personality of this creature
// Return value is the NPC_PERSONALITY constant of the creature
void SetPersonality(object oCreature, int iPersonality) {
    SetLocalInt(oCreature, "NPC_PERSONALITY", iPersonality);
}

// Gender preference functions

// Get the sexual orientation of this creature
// Return value is the GENDER_* constant of the creatures preferred partner
int GetOrientation(object oCreature) {
    return GetLocalInt(oCreature, "NPC_ORIENTATION");
}

// Set the sexual orientation of this creature
// iOrientation is the GENDER_* constant of the creatures preferred partner
void SetOrientation(object oCreature, int iOrientation) {
    SetLocalInt(oCreature, "NPC_ORIENTATION", iOrientation);
}

// Determine if a creature is attracted to the taget's gender
int IsAttractedToGender(object oCreature, object oTarget) {
    int iOrientation = GetOrientation(oCreature);

    if ((iOrientation == GENDER_BOTH) || (iOrientation == GetGender(oTarget))) {
        return TRUE;
    } else {
        return FALSE;
    }
}

// Clothing and modesty functions

// Get the modesty level of a suit of clothes or armor
// Return value is the CLOTHES_* constant of the item
int GetItemModesty(object oItem) {
    return GetLocalInt(oItem, "CLOTHES_MODESTY");
}

// Set the modesty level of a suit of clothes or armor
// iModesty is the CLOTHES_* constant of the itemr
void SetItemModesty(object oItem, int iModesty) {
    SetLocalInt(oItem, "CLOTHES_MODESTY", iModesty);
}

// Get the modesty level of the item in the creatures chest slot
// Return value is the CLOTHES_* constant of the item
int GetCreatureModesty(object oCreature) {
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oCreature);

    if (oItem != OBJECT_INVALID) {
        return GetLocalInt(oItem, "CLOTHES_MODESTY");
    } else {
        return CLOTHES_NAKED;
    }
}
