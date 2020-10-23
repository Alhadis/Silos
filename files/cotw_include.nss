/*
Curse of the Wolf - a Player/DM controlled lycanthropy script
by OldManWhistler

Check out my portfolio for other things I have created:
http://nwvault.ign.com/portfolios/data/1054937958.shtml

This is a script and three items for adding DM and/or player controlled lycanthropy. This script creates a werewolf effect that is much stronger than the regular polymorph into a werewolf. You should test the script and rebalance it before putting it in your module.

FEATURES
- 1 script, 3 items. Does not override any NWN content.
- Lycanthropy becomes more powerful as player levels.
- Becoming a werewolf gives:
   - instant health increase
   - increased attack bonus
   - increased number of attacks
   - increased unarmed damage
   - increased AC
   - increased constitution
   - increased strength
   - regeneration
   - increased movement speed
   - increased Spot/Listen skills.
   - chance that the player will become confused during combat
   - random negative status effects while in wolf state
- Items to allow player to control lycanthropy.
- Player remains in wolf form during rest.
- Resets to the non-werewolf state on death.
- DM widget for toggling lycanthropy on/off on any PC/NPC.

The effects given by this script might be unbalanced for your module, feel free to tweak them until you find the appropriate balance. By default I have the script set up so that turning into a werewolf would make the player more powerful than any of the base classes, but with the price of sometimes losing control. Keep in mind that while in wolf form a player loses the ability to use any of their items or to cast spells.

Items can be found in the Chooser under custom 5.
*/

// ****************************************************************************
// INSTALLATION
// ****************************************************************************

/*
// cotw_base_X_XX.erf contains the base script and the items.
// cotw_acttag_X_XX.erf is only needed if you use an activate item system where you execute the item's
// tag as a script.

// #1: Modify OnClientEnter module event script.
// Add the following line to somewhere at the top of the script
#include "cotw_include"
// Add the following line to somewhere in the void main function.
   DelayCommand (6.0, COTWOnClientEnter (GetEnteringObject()));

// #2: Modify OnPlayerDeath module event script.
// Add the following line to somewhere at the top of the script
#include "cotw_include"
// Add the following line to somewhere in the void main function.
   COTWOnPlayerDeath (GetLastPlayerDied());

// #3: Modify OnUnAcquiredItem module event script.
// Add the following line to somewhere at the top of the script
#include "cotw_include"
// Add the following line to somewhere in the void main function.
   if (COTWOnUnAcquiredItem(GetModuleItemLostBy(), GetModuleItemLost())) return;

// #4: Modify OnActivateItem module event script. You can skip this step if you use an activate item script
// that executes a script with the same name as the item tag and you have imported cotw_acttag_X_XX.erf
// Add the following line to somewhere at the top of the script
#include "cotw_include"
// Add the following line to somewhere in the void main function.
    if (COTWOnActivateItem (GetItemActivator(), GetItemActivatedTarget(), GetItemActivated())) return;
*/

// ****************************************************************************
// CONFIGURATION
// ****************************************************************************

// The COTW_INCREASE_* constants specify the rate of player levels per increase.
// A value of 4.0 would specify the effect will increase every 4 player levels.
// A value of 0.0 would specify the effect will never increase.
const float COTW_INCREASE_HEAL_TYPE = 4.0;
const float COTW_INCREASE_ATTACK_BONUS = 4.0;
const float COTW_INCREASE_ARMOR_CLASS = 1.5;
const float COTW_INCREASE_REGEN = 4.0;
const float COTW_INCREASE_NUM_ATTACK = 6.0;
const float COTW_INCREASE_DAMAGE = 3.0;
const float COTW_INCREASE_CON = 3.0;
const float COTW_INCREASE_STR = 3.0;
const float COTW_INCREASE_LISTEN_SPOT = 1.5;
// How much should the movement speed increase per level? (Maximum movement speed is 150)
const float COTW_MOVEMENT_SPEED = 2.5;
// How many seconds should pass between regenerating HP?
const float COTW_REGEN_TIMER = 6.0;

// While in wolf state the player can have random bad effects.
const int COTW_USE_BAD_EFFECTS = TRUE;
// Chance that the player will become confused while in the werewolf state and
// they are in combat.
const int COTW_USE_BLOODLUST = TRUE;
// Set how often to time the bloodlust/bad effect checks (increase time to
// reduce CPU usage)
const float COTW_TIMER = 120.0f;

// ****************************************************************************
// CONSTANTS
// ****************************************************************************

const string COTW_ITEM_STOP_WOLF        = "cotw_on_activate_stop";
const string COTW_ITEM_STOP_WOLF_ALT    = "cotw_on_activate_stop_form2";
const string COTW_ITEM_STOP_TIGER       = "cotw_on_activate_stop_tiger";
const string COTW_ITEM_STOP_CAT         = "cotw_on_activate_stop_cat";
const string COTW_ITEM_STOP_NM          = "cotw_on_activate_stop_nm";
const string COTW_ITEM_STOP_UC          = "cotw_on_activate_stop_uc";
const string COTW_ITEM_STOP_WBR         = "cotw_on_activate_stop_wb";
const string COTW_ITEM_STOP_WLI         = "cotw_on_activate_stop_wl";
const string COTW_ITEM_STOP_ARF         = "cotw_on_activate_stop_arfo";

const string COTW_ITEM_START_WOLF       = "cotw_on_activate_start";
const string COTW_ITEM_START_WOLF_ALT   = "cotw_on_activate_start_form2";
const string COTW_ITEM_START_TIGER      = "cotw_on_activate_start_tiger";
const string COTW_ITEM_START_CAT        = "cotw_on_activate_start_cat";
const string COTW_ITEM_START_NM         = "cotw_on_activate_start_nm";
const string COTW_ITEM_START_UC         = "cotw_on_activate_start_uc";
const string COTW_ITEM_START_WBR        = "cotw_on_activate_start_wb";
const string COTW_ITEM_START_WLI        = "cotw_on_activate_start_wl";
const string COTW_ITEM_START_ARF        = "cotw_on_activate_start_arfo";

const string COTW_ITEM_STOP_RESREF      = "cotw_on_act_stop";
const string COTW_ITEM_STOP_ALT_RESREF  = "cotw_on_act_sf2";
const string COTW_ITEM_STOP_T_RESREF    = "cotw_on_act_tst";
const string COTW_ITEM_STOP_CAT_RESREF  = "cotw_on_act_stc";
const string COTW_ITEM_STOP_NM_RESREF   = "cotw_on_act_stnm";
const string COTW_ITEM_STOP_UC_RESREF   = "cotw_on_act_stuc";
const string COTW_ITEM_STOP_WBR_RESREF  = "cotw_on_act_stwb";
const string COTW_ITEM_STOP_WLI_RESREF  = "cotw_on_act_stwl";
const string COTW_ITEM_STOP_ARF_RESREF  = "cotw_on_act_staf";

const string COTW_ITEM_START_RESREF     = "cotw_on_act_star";
const string COTW_ITEM_START_ALT_RESREF = "cotw_on_act_f2";
const string COTW_ITEM_START_T_RESREF   = "cotw_on_act_ts";
const string COTW_ITEM_START_CAT_RESREF = "cotw_on_act_sc";
const string COTW_ITEM_START_NM_RESREF  = "cotw_on_act_snm";
const string COTW_ITEM_START_UC_RESREF  = "cotw_on_act_suc";
const string COTW_ITEM_START_WBR_RESREF = "cotw_on_act_swb";
const string COTW_ITEM_START_WLI_RESREF = "cotw_on_act_swl";
const string COTW_ITEM_START_ARF_RESREF = "cotw_on_act_saf";


const string COTW_ITEM_DM_WIDGET        = "cotw_on_activate_dm";

const string COTW_CACHED_ITEM           = "cotw_cached_item";
const string COTW_STATE_MACHINE         = "cotw_state_machine";
const string COTW_HEALED                = "cotw_healed";
const int COTW_STATE_INACTIVE           = 0;
const int COTW_STATE_WOLF               = 1;
const int COTW_STATE_NORMAL             = 2;

// ****************************************************************************
// FUNCTION DECLARATIONS/PROTOTYPES
// ****************************************************************************

// COTWGetBAB
// Calculates the basic attack bonus based on the classes that oTarget possesses.
// object oTarget - the target to get the basic attack bonus of.
// Returns the basic attack bonus.
int COTWGetBAB (object oTarget);

// COTWRemoveWolfEffects
// Removes the werewolf effect from OBJECT_SELF.
void COTWRemoveWolfEffect(object oActivatedItem);

// COTWDebug
// Modify this function if you want to enable debugging messages for this script.
void COTWDebug(string sMsg);

// COTWWolfGetDmgBonus
// int iDmg - a value between 1 to 7.
// Returns a DAMAGE_BONUS_* constant based on the value supplied.
int COTWWolfGetDmgBonus (int iDmg);

int COTWCreateWolfDmg24to40 (int iDmg);
// COTWWolfGetHealType
// int iHeal - a value between 1 to 6.
// Returns a cure wounds SPELL_* constant based on the value supplied.
int COTWWolfGetHealType (int iHeal);

// COTWCreateWolfEffect
// Creates the werewolf effect from OBJECT_SELF.
// int bInstant - setting this to true will skip the healing and transformation
// visuals.
void COTWCreateWolfEffect(object oActivatedItem, int bInstant = FALSE);

// COTWStartWolf
// Creates the werewolf effect and changes the activated item.
// object oPC - player to make into a werewolf.
// object oActivatedItem - item
void COTWStartWolf (object oPC, object oActivatedItem);

// COTWStopWolf
// Removes the werewolf effect and changes the activated item.
// object oPC - player to make normal.
// object oActivatedItem - item
void COTWStopWolf (object oPC, object oActivatedItem);

// COTWTimer
// Timer that runs on the player while they are in the werewolf state.
void COTWTimer ();

// COTWOnActivateItem
// OnActivateItem event handler. Returns TRUE if it could handle activating
// the item.
// object oUser - person activating the item
// object oTarget - target of the item
// object oItem - the activated item
int COTWOnActivateItem (object oUser, object oTarget, object oItem);

// COTWOnUnAcquiredItem
// OnUnAcquiredItem event handler. Returns TRUE if it could handle activating
// the item.
// object oPC - person dropping the item
// object oItem - the lost item
int COTWOnUnAcquiredItem (object oPC, object oItem);

// COTWOnPlayerDeath
// OnPlayerDeath event handler. Returns TRUE if the player lost the werewolf
// effect from death.
// object oPC - person who died
int COTWOnPlayerDeath (object oPC);

// COTWOnClientEnter
// OnClientEnter event handler. Applies the werewolf effect if the player
// has the item that signifies being a werewolf.
// object oPC - person who entered the module
void COTWOnClientEnter (object oPC);

// ****************************************************************************
// FUNCTIONS
// ****************************************************************************

int COTWGetBAB (object oTarget)
{
    // Original function by Jasperre posted on the bioboards at 19 May 2003
    // oTarget - the creature to find the BAB for.
    // Returns: Base Attack Bonus (strictly by class, no ability/item modifiers)

    if (!GetIsObjectValid(oTarget)) return 0;
    int nBAB1 = GetLevelByClass(CLASS_TYPE_RANGER, oTarget)
        + GetLevelByClass(CLASS_TYPE_FIGHTER, oTarget)
        + GetLevelByClass(CLASS_TYPE_PALADIN, oTarget)
        + GetLevelByClass(CLASS_TYPE_BARBARIAN, oTarget)
        + GetLevelByClass(CLASS_TYPE_DRAGON, oTarget)
        + GetLevelByClass(CLASS_TYPE_OUTSIDER, oTarget)
        + GetLevelByClass(CLASS_TYPE_MONSTROUS, oTarget)
        + GetLevelByClass(CLASS_TYPE_ARCANE_ARCHER, oTarget)
        + GetLevelByClass(CLASS_TYPE_BLACKGUARD, oTarget);
    int nBAB2 = GetLevelByClass(CLASS_TYPE_ABERRATION, oTarget)
        + GetLevelByClass(CLASS_TYPE_ANIMAL, oTarget)
        + GetLevelByClass(CLASS_TYPE_BARD, oTarget)
        + GetLevelByClass(CLASS_TYPE_BEAST, oTarget)
        + GetLevelByClass(CLASS_TYPE_CLERIC, oTarget)
        + GetLevelByClass(CLASS_TYPE_CONSTRUCT, oTarget)
        + GetLevelByClass(CLASS_TYPE_DRUID, oTarget)
        + GetLevelByClass(CLASS_TYPE_ELEMENTAL, oTarget)
        + GetLevelByClass(CLASS_TYPE_GIANT, oTarget)
        + GetLevelByClass(CLASS_TYPE_HUMANOID, oTarget)
        + GetLevelByClass(CLASS_TYPE_MAGICAL_BEAST, oTarget)
        + GetLevelByClass(CLASS_TYPE_MONK, oTarget)
        + GetLevelByClass(CLASS_TYPE_ROGUE, oTarget)
        + GetLevelByClass(CLASS_TYPE_SHAPECHANGER, oTarget)
        + GetLevelByClass(CLASS_TYPE_VERMIN, oTarget)
        + GetLevelByClass(CLASS_TYPE_ASSASSIN, oTarget)
        + GetLevelByClass(CLASS_TYPE_HARPER, oTarget)
        + GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oTarget);
    int nBAB3 = GetLevelByClass(CLASS_TYPE_COMMONER, oTarget)
        + GetLevelByClass(CLASS_TYPE_FEY, oTarget)
        + GetLevelByClass(CLASS_TYPE_UNDEAD, oTarget)
        + GetLevelByClass(CLASS_TYPE_SORCERER, oTarget)
        + GetLevelByClass(CLASS_TYPE_WIZARD, oTarget);
    int nBaseBAB = nBAB1 + (nBAB2 * 3 / 4) + (nBAB3 / 2);
    return nBaseBAB;
}

// ****************************************************************************

void COTWRemoveWolfEffect(object oActivatedItem)
{
    string sTag = GetTag(oActivatedItem);

    // We can't just add more spell effects because they will stack.
    // We have to remove any existing spell effects first.
    effect eEffect = GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eEffect))
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
        {
            // Is the effect extraordinary?
            if (GetEffectSubType(eEffect) == SUBTYPE_SUPERNATURAL)
            {
                RemoveEffect(OBJECT_SELF, eEffect);
            }
        }
        eEffect = GetNextEffect(OBJECT_SELF);
    }

  SetLocalInt(OBJECT_SELF, COTW_STATE_MACHINE, COTW_STATE_NORMAL);
}


// ****************************************************************************

void COTWDebug(string sMsg)
{
    //SendMessageToPC(OBJECT_SELF, sMsg);
    //SendMessageToAllDMs(sMsg);
}

// ****************************************************************************

int COTWCreateWolfDmg24to40 (int iDmg)
{

    switch (iDmg)
    {
        case 8:  return DAMAGE_BONUS_2;
        case 9:  return DAMAGE_BONUS_1d4;
        case 10: return DAMAGE_BONUS_1d6;
        case 11: return DAMAGE_BONUS_1d8;
        case 12: return DAMAGE_BONUS_1d10;
        case 13: return DAMAGE_BONUS_2d6;
    }
    return DAMAGE_BONUS_2d6;
}

// ****************************************************************************
int COTWWolfGetDmgBonus (int iDmg)
{
    // Return a damage bonus constant.
    switch (iDmg)
    {
        case 1: return DAMAGE_BONUS_2;
        case 2: return DAMAGE_BONUS_1d4;
        case 3: return DAMAGE_BONUS_1d6;
        case 4: return DAMAGE_BONUS_1d8;
        case 5: return DAMAGE_BONUS_1d10;
        case 6: return DAMAGE_BONUS_2d6;
        case 7: return DAMAGE_BONUS_2d6;
    }
    return DAMAGE_BONUS_1;
}

// ****************************************************************************

int COTWWolfGetHealType (int iHeal)
{
    // Return a cure wounds spell.
    switch (iHeal)
    {
        case 1: return SPELL_CURE_MINOR_WOUNDS;
        case 2: return SPELL_CURE_LIGHT_WOUNDS;
        case 3: return SPELL_CURE_MODERATE_WOUNDS;
        case 4: return SPELL_CURE_SERIOUS_WOUNDS;
        case 5: return SPELL_CURE_CRITICAL_WOUNDS;
        case 6: return SPELL_HEAL;
    }
    return SPELL_HEAL;
}

// ****************************************************************************

void COTWCreateWolfEffect(object oActivatedItem, int bInstant = FALSE)
{
    // Create the werewolf effect.
    string sTag = GetTag(oActivatedItem);
    string sPlaySound;
    int    nPolymorphType, nNoMindAffect;
    int    nDamageType1 = DAMAGE_TYPE_MAGICAL;
    int    nDamageType2 = DAMAGE_TYPE_ACID;

    // Choose the Polymorph type by checking the activated item's tag
    if(sTag == COTW_ITEM_START_WOLF ||sTag == COTW_ITEM_STOP_WOLF)
    {
        sPlaySound     = "as_an_wolveshwl1";
        nPolymorphType = POLYMORPH_TYPE_WEREWOLF;
    }
    else if(sTag == COTW_ITEM_START_WOLF_ALT || sTag == COTW_ITEM_STOP_WOLF_ALT)
    {
        sPlaySound     = "as_an_wolveshwl1";
        nPolymorphType = 111;
    }
    else if(sTag == COTW_ITEM_START_TIGER || sTag == COTW_ITEM_STOP_TIGER)
    {
        sPlaySound     = "c_cat_bat2";
        nPolymorphType = 110;
    }
    else if(sTag == COTW_ITEM_START_CAT || sTag == COTW_ITEM_STOP_CAT)
    {
        sPlaySound     = "c_werecat_bat2";
        nPolymorphType = 112;
    }
    else if(sTag == COTW_ITEM_START_NM || sTag == COTW_ITEM_STOP_NM)
    {
        sPlaySound     = "c_werecat_bat2";
        nPolymorphType = 115;
        nDamageType2   = DAMAGE_TYPE_FIRE;
        nNoMindAffect  = TRUE;
    }
    else if(sTag == COTW_ITEM_START_UC || sTag == COTW_ITEM_STOP_UC)
    {
        sPlaySound     = "c_werecat_bat2";
        nPolymorphType = 116;
        nDamageType2   = DAMAGE_TYPE_POSITIVE;
        nNoMindAffect  = TRUE;
    }
    else if(sTag == COTW_ITEM_START_WBR || sTag == COTW_ITEM_STOP_WBR)
    {
        sPlaySound     = "c_boardire_bat1";
        nPolymorphType = 117;
    }
    else if(sTag == COTW_ITEM_START_WLI || sTag == COTW_ITEM_STOP_WLI)
    {
        sPlaySound     = "as_an_wolveshwl1";
        nPolymorphType = 118;
    }
    else if(sTag == COTW_ITEM_START_ARF || sTag == COTW_ITEM_STOP_ARF)
    {
        sPlaySound     = "as_an_wolveshwl1";
        nPolymorphType = 119;
    }

    //DeleteLocalInt(OBJECT_SELF, "Dont_Change_Tiger_App");
    // Check if they are already under the effect of the timer.
    if (GetLocalInt(OBJECT_SELF, COTW_STATE_MACHINE) == COTW_STATE_WOLF)
        COTWRemoveWolfEffect(oActivatedItem);
    else
        if((!nNoMindAffect && COTW_USE_BAD_EFFECTS || COTW_USE_BLOODLUST) && COTW_TIMER > 0.0)DelayCommand(COTW_TIMER, COTWTimer());

    // Find the character level
    int iCharLevel = GetHitDice(OBJECT_SELF);
    // If the effect isn't being instantly created, then creating the wolf effect
    // heals the character.
    if (COTW_INCREASE_HEAL_TYPE > 0.0)
    {
        if ((!bInstant) && (GetLocalInt(OBJECT_SELF, COTW_HEALED) == 0))
        {
            // Prevent the player from repeatedly changing shape for the free heals.
            DelayCommand(480.0, DeleteLocalInt(OBJECT_SELF, COTW_HEALED));
            SetLocalInt(OBJECT_SELF, COTW_HEALED, 1);
            int iSpellID = COTWWolfGetHealType(FloatToInt(iCharLevel / COTW_INCREASE_HEAL_TYPE)+1);
            ActionCastSpellAtObject(iSpellID, OBJECT_SELF, METAMAGIC_EMPOWER, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        }
    }
    // Start building up the wolf effect.
    effect eWolf = EffectPolymorph(nPolymorphType);
    if (COTW_INCREASE_ATTACK_BONUS > 0.0)
    {
        // Increase attack bonus.
        int iABInc = iCharLevel - COTWGetBAB(OBJECT_SELF) + FloatToInt(iCharLevel / COTW_INCREASE_ATTACK_BONUS);
        eWolf = EffectLinkEffects (EffectAttackIncrease(iABInc, ATTACK_BONUS_MISC), eWolf);
        COTWDebug("Wolf: Increasing AB by: "+IntToString(iABInc));
    }
    if (COTW_INCREASE_ARMOR_CLASS > 0.0)
    {
        // Increase armor class.
        int iACInc = FloatToInt(iCharLevel / COTW_INCREASE_ARMOR_CLASS);
        eWolf = EffectLinkEffects (EffectACIncrease(iACInc), eWolf);
        COTWDebug("Wolf: Increasing AC by: "+IntToString(iACInc));
    }
    if (COTW_INCREASE_REGEN > 0.0)
    {
        // Increase regeneration.
        int iRegen = FloatToInt(iCharLevel / COTW_INCREASE_REGEN);
        eWolf = EffectLinkEffects (EffectRegenerate(iRegen, COTW_REGEN_TIMER), eWolf);
        COTWDebug("Wolf: Increasing Regen by: "+IntToString(iRegen));
    }
    if (COTW_INCREASE_NUM_ATTACK > 0.0)
    {
        // Increase number of attacks.
        int iAttacks = FloatToInt(iCharLevel / COTW_INCREASE_NUM_ATTACK);

        if(iAttacks > 5)
        {
         iAttacks = 5;
        }
        eWolf = EffectLinkEffects (EffectModifyAttacks(iAttacks), eWolf);
        COTWDebug("Wolf: Increasing number of attacks by: "+IntToString(iAttacks));
    }
    if (COTW_MOVEMENT_SPEED > 0.0)
    {
        // Increase movement speed.
        int iSpeed = FloatToInt((iCharLevel * COTW_MOVEMENT_SPEED)-1);
        eWolf = EffectLinkEffects (EffectMovementSpeedIncrease(iSpeed), eWolf);
        COTWDebug("Wolf: movement speed by: "+IntToString(iSpeed));
    }
    if (COTW_INCREASE_DAMAGE > 0.0 && iCharLevel < 24)
    {
        // Increase unarmed damage.
        int iDmg = COTWWolfGetDmgBonus (FloatToInt(iCharLevel / COTW_INCREASE_DAMAGE));
        eWolf = EffectLinkEffects (EffectDamageIncrease(iDmg), eWolf);
        COTWDebug("Wolf: Damage by: "+IntToString(iDmg));
    }
    if (COTW_INCREASE_DAMAGE > 0.0 && iCharLevel >= 24)
    {
        //Increase unarmed damage by 2d6 Magical and iDmg Acid.
        int iDmg = COTWCreateWolfDmg24to40 (FloatToInt(iCharLevel / COTW_INCREASE_DAMAGE));
        eWolf = EffectLinkEffects(EffectDamageIncrease(DAMAGE_BONUS_2d6, nDamageType1), eWolf);
        eWolf = EffectLinkEffects(EffectDamageIncrease(iDmg, nDamageType2), eWolf);
        COTWDebug("Wolf: Damage by: "+IntToString(iDmg));
    }
    if (COTW_INCREASE_CON > 0.0)
    {
        // Increase constitution.
        int iCon = FloatToInt(iCharLevel / COTW_INCREASE_CON);
        eWolf = EffectLinkEffects (EffectAbilityIncrease(ABILITY_CONSTITUTION, iCon), eWolf);
        COTWDebug("Wolf: Increase constitution by: "+IntToString(iCon));
    }
    if (COTW_INCREASE_STR > 0.0)
    {
        // Increase strength.
        int iStr = FloatToInt(iCharLevel / COTW_INCREASE_STR);
        eWolf = EffectLinkEffects (EffectAbilityIncrease(ABILITY_STRENGTH, iStr), eWolf);
        COTWDebug("Wolf: Increase constitution by: "+IntToString(iStr));
    }
    if (COTW_INCREASE_LISTEN_SPOT > 0.0)
    {
        // Increase Spot and Listen skills
        int iSkill = FloatToInt(iCharLevel / COTW_INCREASE_LISTEN_SPOT);
        eWolf = EffectLinkEffects (EffectSkillIncrease(SKILL_LISTEN, iSkill), eWolf);
        eWolf = EffectLinkEffects (EffectSkillIncrease(SKILL_SPOT, iSkill), eWolf);
        COTWDebug("Wolf: Increased listen/spot by: "+IntToString(iSkill));
    }
    if (!bInstant)
    {
        FloatingTextStringOnCreature("Ihr fühlt, dass eure Knochen in eurem Körper sich verwandeln.", OBJECT_SELF, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR), OBJECT_SELF, 7.0);
        DelayCommand(3.0f, PlaySound (sPlaySound));
        DelayCommand(6.0f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_POLYMORPH), OBJECT_SELF, 9.0));
        DelayCommand(6.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eWolf), OBJECT_SELF));
    }
    else
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eWolf), OBJECT_SELF);

    SetLocalInt(OBJECT_SELF, COTW_STATE_MACHINE, COTW_STATE_WOLF);
}

// ****************************************************************************

void COTWStartWolf (object oPC, object oActivatedItem)
{
    string sItem = COTW_ITEM_STOP_RESREF;

    // Turn them into a wolf.
    FloatingTextStringOnCreature("* "+GetName(oPC)+" beginnt sich zu verwandeln! *", oPC);

         if(GetTag(oActivatedItem) == COTW_ITEM_START_TIGER)    {sItem=COTW_ITEM_STOP_T_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_WOLF_ALT) {sItem=COTW_ITEM_STOP_ALT_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_CAT)      {sItem=COTW_ITEM_STOP_CAT_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_NM)       {sItem=COTW_ITEM_STOP_NM_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_UC)       {sItem=COTW_ITEM_STOP_UC_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_WBR)      {sItem=COTW_ITEM_STOP_WBR_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_WLI)      {sItem=COTW_ITEM_STOP_WLI_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_ARF)      {sItem=COTW_ITEM_STOP_ARF_RESREF;}

    //Werewolf
    if(GetTag(oActivatedItem) == COTW_ITEM_START_WOLF)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Werwolf)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Werewolf Alternative Form
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_WOLF_ALT)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Werwolf 2)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Tiger
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_TIGER)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Tiger)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Werecat
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_CAT)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Werkatze)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Nightmare
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_NM)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Nachtmahr)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Unicorn
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_UC)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Einhorn)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Wereboar
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_WBR)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Wereber)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Werelion
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_WLI)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Werlöwe)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));
    //Arctic Fox
    else if(GetTag(oActivatedItem) == COTW_ITEM_START_ARF)
        DelayCommand(1.5, FloatingTextStringOnCreature("OOC: Lege den Gegenstand 'Verwandlung beenden (Winterwolf)' ab, um deine ursprüngliche Form zurück zu bekommen!", oPC, FALSE));

    AssignCommand(oPC, COTWCreateWolfEffect(oActivatedItem));
    // Destroy the activating item.
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    // Check where the player's last item went.
    oActivatedItem = GetLocalObject(oPC, COTW_CACHED_ITEM);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }

    // Check that the player doesn't have additional items through a bug.
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_WOLF);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_WOLF_ALT);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_TIGER);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_CAT);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_NM);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_UC);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_WBR);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oPC, COTW_ITEM_START_WLI);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }

    // Create a new item.
    oActivatedItem = CreateItemOnObject(sItem, oPC);
    // Cache the item to prevent duplication.
    SetLocalObject(oPC, COTW_CACHED_ITEM, oActivatedItem);
}

// ****************************************************************************

void COTWStopWolf (object oTarget, object oActivatedItem)
{
    string sItem = COTW_ITEM_START_RESREF;

    // Remove the wolf effects.
    FloatingTextStringOnCreature(GetName(oTarget)+" beginnt sich zurück zu verwandeln.", oTarget);

         if(GetTag(oActivatedItem) == COTW_ITEM_STOP_TIGER)    {sItem=COTW_ITEM_START_T_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_WOLF_ALT) {sItem=COTW_ITEM_START_ALT_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_CAT)      {sItem=COTW_ITEM_START_CAT_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_NM)       {sItem=COTW_ITEM_START_NM_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_UC)       {sItem=COTW_ITEM_START_UC_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_WBR)      {sItem=COTW_ITEM_START_WBR_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_WLI)      {sItem=COTW_ITEM_START_WLI_RESREF;}
    else if(GetTag(oActivatedItem) == COTW_ITEM_STOP_ARF)      {sItem=COTW_ITEM_START_ARF_RESREF;}

    AssignCommand(oTarget, COTWRemoveWolfEffect(oActivatedItem));

    // Destroy the activating item.
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    // Check where the player's last item went.
    oActivatedItem = GetLocalObject(oTarget, COTW_CACHED_ITEM);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }

    // Check that the player doesn't have additional items through a bug.
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_WOLF);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_WOLF_ALT);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_TIGER);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_CAT);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_NM);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_UC);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_WBR);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_WLI);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }
    oActivatedItem = GetItemPossessedBy(oTarget, COTW_ITEM_STOP_ARF);
    if (GetIsObjectValid(oActivatedItem)) { SetPlotFlag(oActivatedItem, FALSE);  DestroyObject(oActivatedItem); }

    // Create a new item.
    oActivatedItem = CreateItemOnObject(sItem, oTarget);
    // Cache the item to prevent duplication.
    SetLocalObject(oTarget, COTW_CACHED_ITEM, oActivatedItem);
}

// ****************************************************************************

void COTWTimer()
{
    int iCharLevel = GetHitDice(OBJECT_SELF);
    if (GetLocalInt(OBJECT_SELF, COTW_STATE_MACHINE) != COTW_STATE_WOLF)
    {
        return;
    }
    // Reassign the timer as the first action so that the timer isn't lost in
    // a lag situation.
    AssignCommand(OBJECT_SELF, DelayCommand(COTW_TIMER, COTWTimer()));
    if (COTW_USE_BLOODLUST && GetIsInCombat())
    {
        // The creature is in combat, check if they go into bloodlust.
        if (Random(10) == 9)
        {
            FloatingTextStringOnCreature("Der geruch von Blut überwältigt euch...", OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectConfused(), OBJECT_SELF, d6()*6.0);
        }
    }
    else if (COTW_USE_BAD_EFFECTS)
    {
        switch (Random(45)+1)
        {
            case 3:
                FloatingTextStringOnCreature("Ihr fühlt euch hungrig.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(Random(GetMaxHitPoints() / 11) + GetMaxHitPoints() / 11), OBJECT_SELF);
                break;
            case 6:
                FloatingTextStringOnCreature("Eure geschärften Sinne überwältigen eure Ohren.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDeaf(), OBJECT_SELF, d4() * 6.0);
                break;
            case 11:
                FloatingTextStringOnCreature("Euer drang zu Töten verstärkt sich.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMissChance(3 * d20()), OBJECT_SELF, d6() * 6.0);
                break;
            case 13:
                FloatingTextStringOnCreature(GetName(GetNearestObject(OBJECT_TYPE_CREATURE))+" sieht schmackhaft aus.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(Random(GetMaxHitPoints() / 9) + GetMaxHitPoints() / 9), OBJECT_SELF);
                break;
            case 14:
                FloatingTextStringOnCreature("Durch euren veränderten Stoffwechsel benötigt ihr mehr Nahrung.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSlow(), OBJECT_SELF, d3() * 6.0);
                break;
            case 16:
                FloatingTextStringOnCreature("Der Hunger macht euch wahnsinnig.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), OBJECT_SELF, d3() * 6.0);
                break;
            case 17:
                FloatingTextStringOnCreature("Die veränderungen in eurem Körper überwältigen euch.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectStunned(), OBJECT_SELF, d2() * 6.0);
                break;
            case 18:
                FloatingTextStringOnCreature("Ihr fühlt, dass ihr die Kontrolle über euren Körper an das Tier in euch verliert.", OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectFrightened(), OBJECT_SELF, d2() * 6.0);
                break;
            default:
                // do nothing
                break;
        }
    }
}

// ****************************************************************************

int COTWOnActivateItem (object oUser, object oTarget, object oItem)
{
    // OnActivateItem event handler.
    string sTag = GetTag(oItem);
    if (sTag == COTW_ITEM_STOP_WOLF ||
        sTag == COTW_ITEM_STOP_WOLF_ALT ||
        sTag == COTW_ITEM_STOP_CAT ||
        sTag == COTW_ITEM_STOP_NM ||
        sTag == COTW_ITEM_STOP_UC ||
        sTag == COTW_ITEM_STOP_WBR ||
        sTag == COTW_ITEM_STOP_TIGER ||
        sTag == COTW_ITEM_STOP_WLI ||
        sTag == COTW_ITEM_STOP_ARF)
    {
        COTWStopWolf(oTarget, oItem);
        return TRUE;
    }
    if (sTag == COTW_ITEM_START_WOLF ||
        sTag == COTW_ITEM_START_WOLF_ALT ||
        sTag == COTW_ITEM_START_CAT ||
        sTag == COTW_ITEM_START_NM ||
        sTag == COTW_ITEM_START_UC ||
        sTag == COTW_ITEM_START_WBR ||
        sTag == COTW_ITEM_START_TIGER ||
        sTag == COTW_ITEM_START_WLI ||
        sTag == COTW_ITEM_START_ARF)
    {
        COTWStartWolf(oTarget, oItem);
        return TRUE;
    }
    if (sTag == COTW_ITEM_DM_WIDGET)
    {
        if (!GetIsDM(oUser) && !GetIsDM(GetMaster(oUser)))
        {
            FloatingTextStringOnCreature("You cannot use a DM item.", oUser, FALSE);
            SetPlotFlag(oItem, FALSE);
            DestroyObject(oItem);
            return TRUE;
        }
        if (GetLocalInt(oTarget, COTW_STATE_MACHINE) == COTW_STATE_WOLF)
        {
            AssignCommand(oTarget, COTWRemoveWolfEffect(oItem));
            return TRUE;
        }
        else
        {
            AssignCommand(oTarget, COTWCreateWolfEffect(oItem));
            return TRUE;
        }
    }
    return FALSE;
}

// ****************************************************************************

int COTWOnUnAcquiredItem(object oPC, object oItem)
{
    // OnUnAcquiredItem event handler.
    string sTag = GetTag(oItem);
    // Dropping actives the item. This is because polymorphed
    // creatures can't use items.
    if (sTag == COTW_ITEM_STOP_WOLF ||
        sTag == COTW_ITEM_STOP_TIGER ||
        sTag == COTW_ITEM_STOP_WOLF_ALT ||
        sTag == COTW_ITEM_STOP_NM ||
        sTag == COTW_ITEM_STOP_UC ||
        sTag == COTW_ITEM_STOP_WBR ||
        sTag == COTW_ITEM_STOP_WLI ||
        sTag == COTW_ITEM_STOP_ARF ||
        sTag == COTW_ITEM_STOP_CAT)
    {
        COTWStopWolf(oPC, oItem);
        return TRUE;
    }
    if (sTag == COTW_ITEM_START_WOLF ||
        sTag == COTW_ITEM_START_TIGER ||
        sTag == COTW_ITEM_START_WOLF_ALT ||
        sTag == COTW_ITEM_START_NM ||
        sTag == COTW_ITEM_START_UC ||
        sTag == COTW_ITEM_START_WBR ||
        sTag == COTW_ITEM_START_WLI ||
        sTag == COTW_ITEM_START_ARF ||
        sTag == COTW_ITEM_START_CAT)
    {
        COTWStartWolf(oPC, oItem);
        return TRUE;
    }
    return FALSE;
}

// ****************************************************************************

int COTWOnPlayerDeath (object oPC)
{
    // OnPlayerDeath event handler.
    if (GetLocalInt(oPC, COTW_STATE_MACHINE) == COTW_STATE_WOLF)
    {
        object oItem;

        if (GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_TIGER)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_TIGER);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF_ALT)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF_ALT);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_CAT)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_CAT);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_NM)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_NM);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_UC)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_UC);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WBR)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WBR);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WLI)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WLI);
           COTWStopWolf(oPC, oItem);
        }
        else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_ARF)))
        {
           oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_ARF);
           COTWStopWolf(oPC, oItem);
        }
        else AssignCommand(oPC, COTWRemoveWolfEffect(oItem));

        return TRUE;
    }
    return FALSE;
}

// ****************************************************************************

void COTWOnClientEnter (object oPC)
{
    // OnClientEneter event handler.
    object oItem;
    if (GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_TIGER)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_TIGER);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_CAT)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_CAT);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF_ALT)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WOLF_ALT);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_NM)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_NM);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_UC)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_UC);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WBR)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WBR);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_WLI)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_WLI);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, COTW_ITEM_STOP_ARF)))
    {
        oItem = GetItemPossessedBy(oPC, COTW_ITEM_STOP_ARF);
        FloatingTextStringOnCreature("OOC: Lykanthropie-effekt wird erneut angewendet.", oPC, FALSE);
        AssignCommand(oPC, COTWCreateWolfEffect(oItem, TRUE));
        return;
    }
}

//void main(){}
