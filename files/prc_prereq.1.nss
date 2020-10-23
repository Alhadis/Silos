//::///////////////////////////////////////////////
//:: PRC Prerequisites
//:: prc_prereq.nss
//:://////////////////////////////////////////////
//:: Check to see what classes a PC is capable of taking.
//:://////////////////////////////////////////////
//:: Created By: Stratovarius.
//:: Created On: July 3rd, 2004
//:://////////////////////////////////////////////
#include "prc_alterations"
#include "prc_inc_sneak"
#include "psi_inc_psifunc"
#include "tob_inc_tobfunc"
#include "inc_newspellbook"
#include "prc_allow_const"
#include "inv_inc_invfunc"

void SneakRequirement(object oPC)
{
   int iSneak = GetTotalSneakAttackDice(oPC);
   int iCount;
   string sVariable;

   for (iCount = 1; iCount <= 30; iCount++)
   {
      sVariable = "PRC_SneakLevel" + IntToString(iCount);
      if (iSneak >= iCount)
         SetLocalInt(oPC, sVariable, 0);
   }
}

void SkirmishRequirement(object oPC)
{
   int nLevel = GetLevelByClass(CLASS_TYPE_SCOUT, oPC);
   int iCount;
   string sVariable;

   int nDice = (nLevel + 3) / 4;
   for (iCount = 1; iCount <= 30; iCount++)
   {
      sVariable = "PRC_SkirmishLevel" + IntToString(iCount);
      if (nDice >= iCount)
         SetLocalInt(oPC, sVariable, 0);
   }

}

//for requirements that Skirmish and Sneak both apply to
void SpecialAttackRequirement(object oPC)
{
   int nLevel = GetLevelByClass(CLASS_TYPE_SCOUT, oPC);
   string sVariable;
   int iSneak = GetTotalSneakAttackDice(oPC);
   int iCount;
   //Skirmish
   int nDice = (nLevel + 3) / 4;
   for (iCount = 1; iCount <= 30; iCount++)
   {
      sVariable = "PRC_SplAtkLevel" + IntToString(iCount);
      if (nDice >= iCount)
         SetLocalInt(oPC, sVariable, 0);
   }
   //Sneak
   for (iCount = 1; iCount <= 30; iCount++)
   {
      sVariable = "PRC_SplAtkLevel" + IntToString(iCount);
      if (iSneak >= iCount)
         SetLocalInt(oPC, sVariable, 0);
   }
}

void Hathran(object oPC)
{

    SetLocalInt(oPC, "PRC_Female", 1);

    if (GetGender(oPC) == GENDER_FEMALE)
    {
    SetLocalInt(oPC, "PRC_Female", 0);
    }
}

void Kord(object oPC)
{
     SetLocalInt(oPC, "PRC_PrereqKord", 1);

     if (GetFortitudeSavingThrow(oPC) >= 6)
     {
        SetLocalInt(oPC, "PRC_PrereqKord", 0);
     }
}

void Shifter(object oPC, int iArcSpell, int iDivSpell)
{
     SetLocalInt(oPC, "PRC_PrereqShift", 1);

     if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) && GetHasFeat(FEAT_ANIMAL_DOMAIN_POWER, oPC) && iDivSpell >= 5)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if ((GetLevelByClass(CLASS_TYPE_SORCERER) && !UseNewSpellBook(oPC)) || GetLevelByClass(CLASS_TYPE_WIZARD))
     {
        if(GetHasSpell(SPELL_POLYMORPH_SELF, oPC))
        {
            // done this way as it's the only way to see if a bioware spellcaster knows the spell
            // actually checks if they have at least one use left
            SetLocalInt(oPC, "PRC_PrereqShift", 0);
            return;
        }
     }
     if (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 5)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) && iDivSpell >= 4)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_INITIATE_DRACONIC, oPC) >= 10)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_NINJA_SPY, oPC) >= 7)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_WEREWOLF, oPC) >= 1)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_BONDED_SUMMONNER, oPC) >= 10)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (PRCGetIsRealSpellKnown(SPELL_POLYMORPH_SELF, oPC))
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if(GetHasInvocation(INVOKE_MASK_OF_FLESH, oPC))
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }

     // these races have an alternate form
     if(GetRacialType(oPC) == RACIAL_TYPE_PURE_YUAN) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_ABOM_YUAN) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_PIXIE) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_RAKSHASA) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_FEYRI) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_HOUND_ARCHON) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_IRDA) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_ZAKYA_RAKSHASA) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_CHANGELING) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_SHIFTER) SetLocalInt(oPC, "PRC_PrereqShift", 0);
     if(GetRacialType(oPC) == RACIAL_TYPE_NAZTHARUNE_RAKSHASA) SetLocalInt(oPC, "PRC_PrereqShift", 0);

     /* Deprecated @DUG
     int nRacialType = MyPRCGetRacialType(oPC);
     if (GetRacialType(oPC) == RACIAL_TYPE_DOPPELGANGER ||
         nRacialType ==  RACIAL_TYPE_DOPPELGANGER ||
         nRacialType == RACIAL_TYPE_SHAPECHANGER)
     {
        SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
	  // @DUG */

     // not counted since it is just "disguise self" and not alter self or shape change
     //if(MyPRCGetRacialType(oPC) == RACIAL_TYPE_DEEP_GNOME) SetLocalInt(oPC, "PRC_PrereqShift", 0);
}

void Tempest(object oPC)
{
     SetLocalInt(oPC, "PRC_PrereqTemp", 1);

     if ((GetHasFeat(FEAT_AMBIDEXTERITY, oPC) && GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, oPC)) || GetHasFeat(FEAT_RANGER_DUAL, oPC))
     {
     SetLocalInt(oPC, "PRC_PrereqTemp", 0);
     }
}

void KOTC(object oPC)
{
     SetLocalInt(oPC, "PRC_PrereqKOTC", 1);

     // to check if PC can cast protection from evil
     if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1)
     {
     SetLocalInt(oPC, "PRC_PrereqKOTC", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_PALADIN))
     {
        if(GetAbilityScore(oPC, ABILITY_WISDOM) > 11 && GetLevelByClass(CLASS_TYPE_PALADIN) >= 4)
        {
            SetLocalInt(oPC, "PRC_PrereqKOTC", 0);
            return;
        }
        else if (GetLevelByClass(CLASS_TYPE_PALADIN) >= 6)
        {
            SetLocalInt(oPC, "PRC_PrereqKOTC", 0);
            return;
        }
     }
     if (PRCGetIsRealSpellKnown(SPELL_PROTECTION_FROM_EVIL, oPC))
     {
         SetLocalInt(oPC, "PRC_PrereqKOTC", 0);
     }
}

void Shadowlord(object oPC, int iArcSpell)
{
     int iShadLevel = GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oPC);

     int iShadItem;
     if(GetHasItem(oPC,"shadowwalkerstok"))
     {
     iShadItem = 1;
     }

     // shadowwalker 'token' int on hide
     if(GetPersistantLocalInt(oPC, "shadowwalkerstok"))
     {
         iShadItem = 1;
     }

     SetLocalInt(oPC, "PRC_PrereqTelflam", 1);

     if ( iArcSpell >= 4 || iShadLevel  || iShadItem)
     {
        SetLocalInt(oPC, "PRC_PrereqTelflam", 0);
     }
}

void SOL(object oPC)
{
     int iCleric = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);

     SetLocalInt(oPC, "PRC_PrereqSOL", 0);
     if (GetAlignmentGoodEvil(oPC) != ALIGNMENT_GOOD)
     {
         SetLocalInt(oPC, "PRC_PrereqSOL", 1);
     }
     else if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD && iCleric)
     {
          SetLocalInt(oPC, "PRC_PrereqSOL", 1);
          int iElishar = GetHasFeat(FEAT_GOOD_DOMAIN_POWER,oPC) +
                         GetHasFeat(FEAT_HEALING_DOMAIN_POWER,oPC) +
                         GetHasFeat(FEAT_KNOWLEDGE_DOMAIN_POWER,oPC) +
                         GetHasFeat(FEAT_LUCK_DOMAIN_POWER,oPC) +
                         GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER,oPC) +
                         GetHasFeat(FEAT_SUN_DOMAIN_POWER,oPC);
          if (iElishar >= 2)
          {
               SetLocalInt(oPC, "PRC_PrereqSOL", 0);
          }
     }
}

void ManAtArms(object oPC)
{
    int iWF;

    // Calculate the total number of Weapon Focus feats the character has
    iWF = GetHasFeat(FEAT_WEAPON_FOCUS_BASTARD_SWORD,oPC)   +GetHasFeat(FEAT_WEAPON_FOCUS_BATTLE_AXE,oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_CLUB,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_DAGGER,oPC)          +GetHasFeat(FEAT_WEAPON_FOCUS_DART,oPC)        +GetHasFeat(FEAT_WEAPON_FOCUS_DIRE_MACE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_DOUBLE_AXE,oPC)      +GetHasFeat(FEAT_WEAPON_FOCUS_DWAXE,oPC)       +GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_SWORD,oPC)     +GetHasFeat(FEAT_WEAPON_FOCUS_HALBERD,oPC)     +GetHasFeat(FEAT_WEAPON_FOCUS_HAND_AXE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW,oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_FLAIL,oPC) +GetHasFeat(FEAT_WEAPON_FOCUS_KAMA,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_TWO_BLADED_SWORD,oPC)+GetHasFeat(FEAT_WEAPON_FOCUS_LONG_SWORD,oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_RAPIER,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_KATANA,oPC)          +GetHasFeat(FEAT_WEAPON_FOCUS_KUKRI,oPC)       +GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_FLAIL,oPC)     +GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_HAMMER,oPC)+GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_MACE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_LONGBOW,oPC)         +GetHasFeat(FEAT_WEAPON_FOCUS_MORNING_STAR,oPC)+GetHasFeat(FEAT_WEAPON_FOCUS_SCIMITAR,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_SCYTHE,oPC)          +GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD,oPC) +GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_SHURIKEN,oPC)        +GetHasFeat(FEAT_WEAPON_FOCUS_SICKLE,oPC)      +GetHasFeat(FEAT_WEAPON_FOCUS_SLING,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_SPEAR,oPC)           +GetHasFeat(FEAT_WEAPON_FOCUS_STAFF,oPC)       +GetHasFeat(FEAT_WEAPON_FOCUS_THROWING_AXE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_WAR_HAMMER,oPC)      +GetHasFeat(FEAT_WEAPON_FOCUS_MINDBLADE, oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_WHIP,oPC); //why was whip commented out?

    // If they are a soulknife, their WF Mindblade might be counting twice due to how it is implemented, so account for it if necessary
    if(GetStringLeft(GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)), 14) == "prc_sk_mblade_" ||
       GetStringLeft(GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC)), 14) == "prc_sk_mblade_")
        iWF--;

    SetLocalInt(oPC, "PRC_PrereqMAA", 1);

    if (iWF > 3)
    {
        SetLocalInt(oPC, "PRC_PrereqMAA", 0);
    }

    // Foe Hunters also require at least one weapon focus feat
    if (iWF > 0)
        SetLocalInt(oPC, "PRC_PrereqFH", 1);
    else
        SetLocalInt(oPC, "PRC_PrereqFH", 2);
}

void BFZ(object oPC)
{
     if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) > 0)
     {
          SetLocalInt(oPC, "PRC_PrereqBFZ", 1);
          int nBFZ = GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC) +
                     GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER, oPC) +
                     GetHasFeat(FEAT_DOMAIN_POWER_RENEWAL, oPC);
          if (nBFZ >= 2)
          {
            SetLocalInt(oPC, "PRC_PrereqBFZ", 0);
          }
     }
}

void Brimstone(object oPC)
{
     if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) > 0)
     {
          SetLocalInt(oPC, "PRC_PrereqBrimstone", 1);
          int nBrim = GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC) +
                      GetHasFeat(FEAT_GOOD_DOMAIN_POWER, oPC);
          if (nBrim >= 1)
          {
            SetLocalInt(oPC, "PRC_PrereqBrimstone", 0);
          }
     }
}

void ShiningBlade(object oPC)
{
     int iCleric = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);


     if (iCleric > 0)
     {
          SetLocalInt(oPC, "PRC_PrereqSBHeir", 1);
          if (GetHasFeat(FEAT_WAR_DOMAIN_POWER,oPC) && GetHasFeat(FEAT_GOOD_DOMAIN_POWER,oPC))
          {
          SetLocalInt(oPC, "PRC_PrereqSBHeir", 0);
          }
     }
}

void DemiLich(object oPC)
{
    SetLocalInt(oPC, "PRC_DemiLich", 0);

    if (GetPRCSwitch(PRC_DISABLE_DEMILICH) > 0 && GetLevelByClass(CLASS_TYPE_LICH) >= 4)
    {
       SetLocalInt(oPC, "PRC_DemiLich", 1); //reverse logic.  1 means don't allow.
    }
}

void EOG(object oPC)
{
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqEOG", 1);
        if(GetHasFeat(FEAT_WAR_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_EVIL_DOMAIN_POWER, oPC) >= 2)
                SetLocalInt(oPC, "PRC_PrereqEOG", 0);
    }
}

void Stormlord(object oPC)
{
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqStormL", 1);
        if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_EVIL_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_DOMAIN_POWER_STORM, oPC) >= 2)
                SetLocalInt(oPC, "PRC_PrereqStormL", 0);
    }
}

void Tempus(object oPC)
{
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqTempus", 1);
        if(GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER, oPC) >= 1 &&
            GetHasFeat(FEAT_WAR_DOMAIN_POWER, oPC))
                SetLocalInt(oPC, "PRC_PrereqTempus", 0);
    }
}

void Heartwarder(object oPC)
{
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqHeartW", 1);
        if(GetHasFeat(FEAT_GOOD_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_DOMAIN_POWER_CHARM, oPC) >= 2)
                SetLocalInt(oPC, "PRC_PrereqHeartW", 0);
    }
}

void Blightlord(object oPC)
{
    if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqBlightL", 1);
        if (GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER,oPC)+GetHasFeat(FEAT_EVIL_DOMAIN_POWER,oPC)>1)
            SetLocalInt(oPC, "PRC_PrereqBlightL", 0);
    }
}

void ShadowAdept(object oPC)
{
    if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqShadAd", 1);
        if (GetHasFeat(FEAT_EVIL_DOMAIN_POWER,oPC)+GetHasFeat(FEAT_KNOWLEDGE_DOMAIN_POWER,oPC)+GetHasFeat(FEAT_DARKNESS_DOMAIN,oPC)>1)
            SetLocalInt(oPC, "PRC_PrereqShadAd", 0);
    }
}

void ThrallOfGrazzt(object oPC)
{
    if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqTOG", 1);
        if (GetHasFeat(FEAT_EVIL_DOMAIN_POWER,oPC)+GetHasFeat(FEAT_DARKNESS_DOMAIN,oPC)>1)
            SetLocalInt(oPC, "PRC_PrereqTOG", 0);
    }
}

void Asmodeus(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqAsmodeus", 1);

    if(GetAlignmentLawChaos(oPC) == ALIGNMENT_LAWFUL && GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        SetLocalInt(oPC, "PRC_PrereqAsmodeus", 0);
    }

    if(GetAlignmentLawChaos(oPC) == ALIGNMENT_NEUTRAL && GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        SetLocalInt(oPC, "PRC_PrereqAsmodeus", 0);
    }
}

void Rava(object oPC)
{
    SetLocalInt(oPC, "PRC_PreReq_Rava", 1);

    if(GetAlignmentLawChaos(oPC) == ALIGNMENT_CHAOTIC && GetAlignmentGoodEvil(oPC) == ALIGNMENT_NEUTRAL)
    {
        SetLocalInt(oPC, "PRC_PreReq_Rava", 0);
    }

    if(GetAlignmentLawChaos(oPC) == ALIGNMENT_CHAOTIC && GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        SetLocalInt(oPC, "PRC_PreReq_Rava", 0);
    }

    if(GetAlignmentLawChaos(oPC) == ALIGNMENT_NEUTRAL && GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
    {
        SetLocalInt(oPC, "PRC_PreReq_Rava", 0);
    }
}

void WWolf(object oPC)
{
    //If not a natural lycanthrope or not already leveled in werewolf, prevent the player from taking the werewolf class
    if (!GetHasFeat(FEAT_TRUE_LYCANTHROPE, oPC) || GetLevelByClass(CLASS_TYPE_WEREWOLF, oPC) < 1)
    {
        SetLocalInt(oPC, "PRC_PrereqWWolf", 1);
    }

    //If not a natural lycanthrope or not already leveled in werewolf, prevent the player from taking the werewolf class
    if (GetHasFeat(FEAT_TRUE_LYCANTHROPE, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqWWolf", 0);
    }
}

void Maester(object oPC)
{

    SetLocalInt(oPC, "PRC_PrereqMaester", 1);

    int nSkill = FALSE;

    // No Int bonus to skills, just want the base ranks (and yes I know this allows items at the moment)
    if ((GetSkillRank(SKILL_CRAFT_ARMOR, oPC) - GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)) >= 8) nSkill = TRUE;
    if ((GetSkillRank(SKILL_CRAFT_TRAP, oPC) - GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)) >= 8) nSkill = TRUE;
    if ((GetSkillRank(SKILL_CRAFT_WEAPON, oPC) - GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)) >= 8) nSkill = TRUE;

    // At least two crafting feats
    if (GetItemCreationFeatCount(oPC) >= 2 && nSkill)
    {
        SetLocalInt(oPC, "PRC_PrereqMaester", 0);
    }
}

void CombatMedic(object oPC)
{
    /* The combat medic can only be taken if the player is able to cast Cure Light Wounds.
     * Base classes:
     * With druids and clerics, that's no problem - they get it at first level. Paladins and
     * rangers are a bit more complicated, due to their bonus spells and later spell gains.
     * Prestige classes:
     * Currently, BioWare Blackguard, Knight of the Middle Circle, Ocular Adept and Soldier
     * of Light can cast CLW.
     */

    SetLocalInt(oPC, "PRC_PrereqCbtMed", 1);
    object oSkin = GetPCSkin(oPC);
    int iWis = GetLocalInt(oSkin, "PRC_trueWIS");

    if (GetLevelByClass(CLASS_TYPE_CLERIC) || GetLevelByClass(CLASS_TYPE_DRUID))
    {
        SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
        return;
    }

    if (GetLevelByClass(CLASS_TYPE_FAVOURED_SOUL) && PRCGetHasSpell(SPELL_CURE_LIGHT_WOUNDS, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
        return;
    }

    if (GetLevelByClass(CLASS_TYPE_PALADIN))
    {
        if(iWis > 11 && GetLevelByClass(CLASS_TYPE_PALADIN) >= 4)
        {
            SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
            return;
        }
        else if (GetLevelByClass(CLASS_TYPE_PALADIN) >= 6)
        {
            SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
            return;
        }
    }

    if (GetLevelByClass(CLASS_TYPE_RANGER))
    {
            if(iWis > 11 && GetLevelByClass(CLASS_TYPE_RANGER) >= 4)
            {
                SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
                return;
            }
            else if (GetLevelByClass(CLASS_TYPE_RANGER) >= 6)
            {
                SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
                return;
            }
    }
    if (GetLevelByClass(CLASS_TYPE_BARD) && !UseNewSpellBook(oPC))
    {
        if(GetHasSpell(SPELL_CURE_LIGHT_WOUNDS, oPC))
        {
            // done this way as it's the only way to see if a bioware spellcaster knows the spell
            // actually checks if they have at least one use left
            SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
            return;
        }
    }

    if (GetLevelByClass(CLASS_TYPE_OCULAR))
    {
        SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
        return;
    }

    if (GetLevelByClass(CLASS_TYPE_BLACKGUARD) || GetLevelByClass(CLASS_TYPE_KNIGHT_MIDDLECIRCLE)
     || GetLevelByClass(CLASS_TYPE_SOLDIER_OF_LIGHT))
    {
        if (iWis > 11 && (GetLevelByClass(CLASS_TYPE_BLACKGUARD) || GetLevelByClass(CLASS_TYPE_SOLDIER_OF_LIGHT)
          || GetLevelByClass(CLASS_TYPE_KNIGHT_MIDDLECIRCLE)))
        {
            SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
            return;
        }
        else if (GetLevelByClass(CLASS_TYPE_BLACKGUARD) >= 2 || GetLevelByClass(CLASS_TYPE_SOLDIER_OF_LIGHT >= 2)
               || GetLevelByClass(CLASS_TYPE_KNIGHT_MIDDLECIRCLE) >= 3)
        {
            SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
        }
    }
    if (PRCGetIsRealSpellKnown(SPELL_CURE_LIGHT_WOUNDS, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
        return;
    }
}

void RedWizard(object oPC)
{

    SetLocalInt(oPC, "PRC_PrereqRedWiz", 1);

    int iFeat;
    int iFocus;

    iFocus = GetHasFeat(FEAT_RW_TF_ABJ, oPC)+GetHasFeat(FEAT_RW_TF_CON, oPC)+GetHasFeat(FEAT_RW_TF_DIV, oPC)+
             GetHasFeat(FEAT_RW_TF_ENC, oPC)+GetHasFeat(FEAT_RW_TF_EVO, oPC)+GetHasFeat(FEAT_RW_TF_ILL, oPC)+
             GetHasFeat(FEAT_RW_TF_NEC, oPC)+GetHasFeat(FEAT_RW_TF_TRS, oPC);
    // Metamagic or Item Creation feats
    iFeat = GetItemCreationFeatCount(oPC) +
            GetHasFeat(FEAT_EMPOWER_SPELL, oPC)    + GetHasFeat(FEAT_EXTEND_SPELL, oPC) +
            GetHasFeat(FEAT_MAXIMIZE_SPELL, oPC)   + GetHasFeat(FEAT_QUICKEN_SPELL, oPC) +
            GetHasFeat(FEAT_SILENCE_SPELL, oPC)    + GetHasFeat(FEAT_STILL_SPELL, oPC) +
            GetHasFeat(FEAT_SUDDEN_EMPOWER, oPC) + GetHasFeat(FEAT_SUDDEN_MAXIMIZE, oPC) +
            GetHasFeat(FEAT_SUDDEN_EXTEND, oPC) + GetHasFeat(FEAT_SUDDEN_WIDEN, oPC);


    // At least two arcane feats, one tattoo focus
    if (iFeat > 2 && iFocus == 1)
    {
        SetLocalInt(oPC, "PRC_PrereqRedWiz", 0);
    }
}

void DalQuor(object oPC)
{

    SetLocalInt(oPC, "PRC_PrereqDalQuor", 1);

    // Psionic feats
    int iFeat = GetHasFeat(FEAT_COMBAT_MANIFESTATION        , oPC) +
            GetHasFeat(FEAT_MENTAL_LEAP                 , oPC) +
                GetHasFeat(FEAT_NARROW_MIND                 , oPC) +
                GetHasFeat(FEAT_POWER_PENETRATION           , oPC) +
                GetHasFeat(FEAT_GREATER_POWER_PENETRATION   , oPC) +
                GetHasFeat(FEAT_POWER_SPECIALIZATION        , oPC) +
                GetHasFeat(FEAT_GREATER_POWER_SPECIALIZATION, oPC) +
                GetHasFeat(FEAT_PSIONIC_DODGE               , oPC) +
                GetHasFeat(FEAT_PSIONIC_ENDOWMENT           , oPC) +
                GetHasFeat(FEAT_GREATER_PSIONIC_ENDOWMENT   , oPC) +
                GetHasFeat(FEAT_PSIONIC_FIST                , oPC) +
                GetHasFeat(FEAT_GREATER_PSIONIC_FIST        , oPC) +
                GetHasFeat(FEAT_PSIONIC_WEAPON              , oPC) +
                GetHasFeat(FEAT_GREATER_PSIONIC_WEAPON      , oPC) +
                GetHasFeat(FEAT_PSIONIC_SHOT                , oPC) +
                GetHasFeat(FEAT_GREATER_PSIONIC_SHOT        , oPC) +
                GetHasFeat(FEAT_OVERCHANNEL                 , oPC) +
                GetHasFeat(FEAT_PSIONIC_MEDITATION          , oPC) +
                GetHasFeat(FEAT_RAPID_METABOLISM            , oPC) +
                GetHasFeat(FEAT_TALENTED                    , oPC) +
            GetHasFeat(FEAT_UNAVOIDABLE_STRIKE          , oPC) +
                GetHasFeat(FEAT_WILD_TALENT                 , oPC) +
                GetHasFeat(FEAT_WOUNDING_ATTACK             , oPC) +
                GetHasFeat(FEAT_BOOST_CONSTRUCT             , oPC) +
                GetHasFeat(FEAT_SPEED_OF_THOUGHT            , oPC) +
                GetHasFeat(FEAT_PSIONIC_TALENT_1            , oPC) +
                GetHasFeat(FEAT_METAMORPHIC_TRANSFER_1      , oPC) +
                GetHasFeat(FEAT_DEEP_IMPACT                 , oPC) +
                GetHasFeat(FEAT_FELL_SHOT                   , oPC) +
                GetHasFeat(FEAT_EXPANDED_KNOWLEDGE_1        , oPC) +
                GetHasFeat(FEAT_INVEST_ARMOUR               , oPC);


    // At least one psionic feat
    if (iFeat >= 1)
    {
        SetLocalInt(oPC, "PRC_PrereqDalQuor", 0);
    }
}

void FH(object oPC)
{
    int iRanger  = GetLevelByClass(CLASS_TYPE_RANGER, oPC);
    int iURanger = GetLevelByClass(CLASS_TYPE_ULTIMATE_RANGER, oPC);

    // Required that ManAtArms evaluation has happened already. Part of
    // the Foe Hunter prereqs are determined there
    int iPrereq = GetLocalInt(oPC, "PRC_PrereqFH");

    if ( iRanger > 0 || iURanger > 1 )
    {
        SetLocalInt(oPC, "PRC_PrereqFH", iPrereq - 1);
    }
}

void BloodArcher(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqBlArch", 0);

    if (MyPRCGetRacialType(oPC) == RACIAL_TYPE_ELF)
        SetLocalInt(oPC, "PRC_PrereqBlArch", 1);
}

void Alaghar(object oPC)
{
    int iProperDomains = 0;

    SetLocalInt(oPC, "PRC_PrereqAlag", 1);

    iProperDomains = GetHasFeat(FEAT_GOOD_DOMAIN_POWER, oPC) +
                     GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER, oPC) +
                     GetHasFeat(FEAT_WAR_DOMAIN_POWER, oPC) +
                     GetHasFeat(FEAT_DOMAIN_POWER_DWARF);

    if (iProperDomains >= 2)
    {
        SetLocalInt(oPC, "PRC_PrereqAlag", 0);
    }
}

void Thrallherd(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqThrallherd", 1);

    // @todo Replace with some mechanism that is not dependent on power enumeration. Maybe a set of variables that tell how many powers of each discipline a character knows <- requires hooking to power gain / loss
    if (GetHasPower(POWER_CHARMPERSON, oPC) || GetHasPower(POWER_AVERSION, oPC) || GetHasPower(POWER_BRAINLOCK, oPC) ||
        GetHasPower(POWER_CRISISBREATH, oPC) || GetHasPower(POWER_EMPATHICTRANSFERHOSTILE, oPC) || GetHasPower(POWER_DOMINATE, oPC) ||
        GetHasPower(POWER_CRISISLIFE, oPC) || GetHasPower(POWER_PSYCHICCHIR_REPAIR, oPC))
    {
        // Technically, you must be able to manifest mindlink, and the only class that can do so is a Telepath Psion
        // Thus, this restriction.
        if (GetHasFeat(FEAT_PSION_DIS_TELEPATH, oPC))
        {
            SetLocalInt(oPC, "PRC_PrereqThrallherd", 0);
        }
    }
}

void Shadowmind(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqShadowmind", 1);

    // @todo Replace with some mechanism that is not dependent on power enumeration. Maybe a set of variables that tell how many powers of each discipline a character knows <- requires hooking to power gain / loss
    if (GetHasPower(POWER_CONCEALAMORPHA, oPC))
    {
    SetLocalInt(oPC, "PRC_PrereqShadowmind", 0);
    }
}

void RangerURangerMutex(object oPC)
{// Ranger and Ultimate Ranger are mutually exclusive. One can only take levels in one of them

    // Delete the old values. The character may have lost the offending levels
    DeleteLocalInt(oPC, ALLOW_CLASS_RANGER);
    DeleteLocalInt(oPC, ALLOW_CLASS_ULTIMATE_RANGER);

    if(GetLevelByClass(CLASS_TYPE_RANGER) > 0)
    {
        SetLocalInt(oPC, ALLOW_CLASS_ULTIMATE_RANGER, 1);
    }

    if(GetLevelByClass(CLASS_TYPE_ULTIMATE_RANGER) > 0)
    {
        SetLocalInt(oPC, ALLOW_CLASS_RANGER, 1);
    }
}

void SoulEater(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqSoulEater", 1);

    if(MyPRCGetRacialType(oPC) == RACIAL_TYPE_ABERRATION ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_ANIMAL ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_BEAST ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_DRAGON ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_HUMANOID_MONSTROUS ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_MAGICAL_BEAST ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_OUTSIDER ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_FEY ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_GIANT ||
       MyPRCGetRacialType(oPC) == RACIAL_TYPE_ELEMENTAL)
    {
        SetLocalInt(oPC, "PRC_PrereqSoulEater", 0);
    }
}

void RacialHD(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqAberration", 1);
    SetLocalInt(oPC, "PRC_PrereqAnimal", 1);
    SetLocalInt(oPC, "PRC_PrereqConstruct", 1);
    SetLocalInt(oPC, "PRC_PrereqHumanoid", 1);
    SetLocalInt(oPC, "PRC_PrereqMonstrous", 1);
    SetLocalInt(oPC, "PRC_PrereqEle", 1);
    SetLocalInt(oPC, "PRC_PrereqFey", 1);
    SetLocalInt(oPC, "PRC_PrereqDragon", 1);
    SetLocalInt(oPC, "PRC_PrereqUndead", 1);
    SetLocalInt(oPC, "PRC_PrereqBeast", 1);
    SetLocalInt(oPC, "PRC_PrereqGiant", 1);
    SetLocalInt(oPC, "PRC_PrereqMagicalBeast", 1);
    SetLocalInt(oPC, "PRC_PrereqOutsider", 1);
    SetLocalInt(oPC, "PRC_PrereqShapechanger", 1);
    SetLocalInt(oPC, "PRC_PrereqVermin", 1);
    SetLocalInt(oPC, "PRC_PrereqPlant", 1);
    if(GetPRCSwitch(PRC_XP_USE_SIMPLE_RACIAL_HD))
    {
        int nRealRace = GetRacialType(oPC);
        int nRacialHD = StringToInt(Get2DACache("ECL", "RaceHD", nRealRace));
        int nRacialClass = StringToInt(Get2DACache("ECL", "RaceClass", nRealRace));
        if(nRacialHD && GetLevelByClass(nRacialClass, oPC) < nRacialHD)
        {
            switch(nRacialClass)
            {
                case CLASS_TYPE_ABERRATION: SetLocalInt(oPC, "PRC_PrereqAberration", 0); break;
                case CLASS_TYPE_ANIMAL: SetLocalInt(oPC, "PRC_PrereqAnmal", 0); break;
                case CLASS_TYPE_CONSTRUCT: SetLocalInt(oPC, "PRC_PrereqConstruct", 0); break;
                case CLASS_TYPE_HUMANOID: SetLocalInt(oPC, "PRC_PrereqHumanoid", 0); break;
                case CLASS_TYPE_MONSTROUS: SetLocalInt(oPC, "PRC_PrereqMonstrous", 0); break;
                case CLASS_TYPE_ELEMENTAL: SetLocalInt(oPC, "PRC_PrereqEle", 0); break;
                case CLASS_TYPE_FEY: SetLocalInt(oPC, "PRC_PrereqFey", 0); break;
                case CLASS_TYPE_DRAGON: SetLocalInt(oPC, "PRC_PrereqDragon", 0); break;
                case CLASS_TYPE_UNDEAD: SetLocalInt(oPC, "PRC_PrereqUndead", 0); break;
                case CLASS_TYPE_BEAST: SetLocalInt(oPC, "PRC_PrereqBeast", 0); break;
                case CLASS_TYPE_GIANT: SetLocalInt(oPC, "PRC_PrereqGiant", 0); break;
                case CLASS_TYPE_MAGICAL_BEAST: SetLocalInt(oPC, "PRC_PrereqMagicalBeast", 0); break;
                case CLASS_TYPE_OUTSIDER: SetLocalInt(oPC, "PRC_PrereqOutsider", 0); break;
                case CLASS_TYPE_SHAPECHANGER: SetLocalInt(oPC, "PRC_PrereqShapechanger", 0); break;
                case CLASS_TYPE_VERMIN: SetLocalInt(oPC, "PRC_PrereqVermin", 0); break;
                case CLASS_TYPE_PLANT: SetLocalInt(oPC, "PRC_PrereqPlant", 0); break;
                default: SetLocalInt(oPC, "NoRace", 0);
            }
        }

    }
}

void Virtuoso(object oPC)
{   //Needs 6 ranks of Persuade OR 6 ranks of Intimidate
    SetLocalInt(oPC, "PRC_PrereqVirtuoso", 1);
    if((GetSkillRank(SKILL_PERSUADE, oPC) >= 6) || (GetSkillRank(SKILL_INTIMIDATE, oPC) >= 6))
        SetLocalInt(oPC, "PRC_PrereqVirtuoso", 0);
}

void FistRaziel(object oPC)
{
    /* The fist of Raziel can only be taken if the player is able to cast Divine Favor.
     * Base classes:
     * Cleric gets it at level 1. Paladin at level 4 (with wis > 11) to 6 (wis == 11)
     */

    SetLocalInt(oPC, "PRC_PrereqFistRaz", 1);
    object oSkin = GetPCSkin(oPC);
    int iWis = GetLocalInt(oSkin, "PRC_trueWIS");
    // hard code it to work for Bioware classes
    if (GetLevelByClass(CLASS_TYPE_CLERIC))
    {
        SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
        return;
    }

    if (GetLevelByClass(CLASS_TYPE_PALADIN))
    {
        if(iWis > 11 && GetLevelByClass(CLASS_TYPE_PALADIN) >= 4)
        {
            SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
            return;
        }
        else if (GetLevelByClass(CLASS_TYPE_PALADIN) >= 6)
        {
            SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
            return;
        }
    }

    if (PRCGetIsRealSpellKnown(SPELL_DIVINE_FAVOR, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
        return;
    }

}

void CoC(object oPC)
{
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqCoC", 1);
        if(GetHasFeat(FEAT_DOMAIN_POWER_ELF, oPC) +
            //GetHasFeat(FEAT_DOMAIN_POWER_CHAOS, oPC) +    //chaos domain not yet implemented
            GetHasFeat(FEAT_GOOD_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_MAGIC_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER, oPC) +
            GetHasFeat(FEAT_WAR_DOMAIN_POWER, oPC) >= 2)
                SetLocalInt(oPC, "PRC_PrereqCoC", 0);
    }
}

void Pyro(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqPyro", 1);
    if(GetIsPsionicCharacter(oPC))
        SetLocalInt(oPC, "PRC_PrereqPyro", 0);
}

void Suel(object oPC)
{
    int nMar = 0;
    int nExot = 0;
    SetLocalInt(oPC, "PRC_PrereqSuelWeap", 1);

    nMar += GetHasFeat(FEAT_WEAPON_PROFICIENCY_SHORTSWORD, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_LONGSWORD, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_BATTLEAXE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_WARHAMMER, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_LONGBOW, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_LIGHT_FLAIL, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_HALBERD, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_SHORTBOW, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_GREATSWORD, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_GREATAXE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_HEAVY_FLAIL, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_LIGHT_HAMMER, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_HANDAXE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_RAPIER, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_SCIMITAR, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_THROWING_AXE, oPC);

    nExot += GetHasFeat(FEAT_WEAPON_PROFICIENCY_BASTARD_SWORD, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_TWO_BLADED_SWORD, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_BATTLEAXE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_DIRE_MACE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_DOUBLE_AXE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_KAMA, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_KUKRI, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_KATANA, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_SCYTHE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_SHURIKEN, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_DWARVEN_WARAXE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_WHIP, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELVEN_THINBLADE, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_RAPIER, oPC) +
            GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELVEN_COURTBLADE, oPC);

     if((nExot + nMar) > 3) SetLocalInt(oPC, "PRC_PrereqSuelWeap", 0);
}

void TomeOfBattle(object oPC = OBJECT_SELF)
{
    int nClass = GetLevelByClass(CLASS_TYPE_DEEPSTONE_SENTINEL, oPC);
    SetLocalInt(oPC, "PRC_PrereqDeepSt", 1);

    if (nClass > 0)
    {
        // Needs two Stone Dragon maneuvers
        int nMove = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_STONE_DRAGON, 2, GetFirstBladeMagicClass(oPC));
        // Needs one Stone Dragon Stance
        int nStance = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_STONE_DRAGON, 1, GetFirstBladeMagicClass(oPC), MANEUVER_TYPE_STANCE);

        if (nMove >=2 && nStance >= 1)
        {
            SetLocalInt(oPC, "PRC_PrereqDeepSt", 0);
        }
    }
    
    nClass = GetLevelByClass(CLASS_TYPE_BLOODCLAW_MASTER, oPC);
    SetLocalInt(oPC, "PRC_PrereqBloodclaw", 1);

    if (nClass > 0)
    {
        // Needs three Tiger Claw maneuvers
        int nMove = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_TIGER_CLAW, 3, GetFirstBladeMagicClass(oPC));

        if (nMove >= 3)
        {
            SetLocalInt(oPC, "PRC_PrereqBloodclaw", 0);
}
    }

    nClass = GetLevelByClass(CLASS_TYPE_RUBY_VINDICATOR, oPC);
    SetLocalInt(oPC, "PRC_PrereqRubyKnight", 1);

    if (nClass > 0)
    {
        // Needs one Devoted Spirit maneuver
        int nMove = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_DEVOTED_SPIRIT, 1, GetFirstBladeMagicClass(oPC));
        // Needs one Devoted Spirit stance
        int nStance = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_DEVOTED_SPIRIT, 1, GetFirstBladeMagicClass(oPC), MANEUVER_TYPE_STANCE);
        
        // If it's a cleric, needs to have Death, Law and Magic as domains.
        int nDomains = GetHasFeat(FEAT_DEATH_DOMAIN_POWER,oPC) +
                       GetHasFeat(FEAT_MAGIC_DOMAIN_POWER,oPC);
        int nCleric  = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);
                       
        if (nMove >= 1 && nStance >= 1 && (nDomains == 2 || nCleric == 0))
        {
            SetLocalInt(oPC, "PRC_PrereqRubyKnight", 0);
        }
    }     
}

void main()
{
     //Declare Major Variables
     object oPC = OBJECT_SELF;
     int iArcSpell;
     int iDivSpell;
     int iArcSpell1;
     int iDivSpell1;
     int iSnkLevel;

     // Initialize all the variables.
     string sVariable;
     int iCount;
     for (iCount = 0; iCount <= 9; iCount++)
     {
        sVariable = "PRC_AllSpell" + IntToString(iCount);
        SetLocalInt(oPC, sVariable, 1);

        sVariable = "PRC_ArcSpell" + IntToString(iCount);
        SetLocalInt(oPC, sVariable, 1);

        sVariable = "PRC_DivSpell" + IntToString(iCount);
        SetLocalInt(oPC, sVariable, 1);

        sVariable = "PRC_PsiPower" + IntToString(iCount);
        SetLocalInt(oPC, sVariable, 1);
     }
     for (iCount = 1; iCount <= 30; iCount++)
     {
        sVariable = "PRC_SneakLevel" + IntToString(iCount);
        SetLocalInt(oPC, sVariable, 1);
     }

     // Find the spell levels.
    int iCha = GetLocalInt(GetPCSkin(oPC), "PRC_trueCHA") - 10;
    int iWis = GetLocalInt(GetPCSkin(oPC), "PRC_trueWIS") - 10;
    int iInt = GetLocalInt(GetPCSkin(oPC), "PRC_trueINT") - 10;
    int nArcHighest;
    int nDivHighest;
    int nPsiHighest;
    int bFirstArcClassFound, bFirstDivClassFound, bFirstPsiClassFound;
    //for(i=1;i<3;i++)
    int nSpellLevel;
    int nClassSlot = 1;
    while(nClassSlot <= 3)
    {
        int nClass = GetClassByPosition(nClassSlot, oPC);
        nClassSlot += 1;
        if(GetIsDivineClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstDivClassFound &&
                GetFirstDivineClass(oPC) == nClass)
            {
                nLevel += GetDivinePRCLevels(oPC);
                bFirstDivClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);

            for(nSpellLevel = 0; nSpellLevel <= 9; nSpellLevel++)
            {
                int nSlots = GetSlotCount(nLevel, nSpellLevel, nAbility, nClass);
                if(nSlots > 0)
                {
                    SetLocalInt(oPC, "PRC_AllSpell"+IntToString(nSpellLevel), 0);
                    SetLocalInt(oPC, "PRC_DivSpell"+IntToString(nSpellLevel), 0);
                    if(nSpellLevel > nDivHighest)
                        nDivHighest = nSpellLevel;
                }
            }
        }
        else if(GetIsArcaneClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstArcClassFound &&
                GetFirstArcaneClass(oPC) == nClass)
            {
                nLevel += GetArcanePRCLevels(oPC);
                bFirstArcClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);

            for(nSpellLevel = 0; nSpellLevel <= 9; nSpellLevel++)
            {
                int nSlots = GetSlotCount(nLevel, nSpellLevel, nAbility, nClass);
                if(nSlots > 0)
                {
                    SetLocalInt(oPC, "PRC_AllSpell"+IntToString(nSpellLevel), 0);
                    SetLocalInt(oPC, "PRC_ArcSpell"+IntToString(nSpellLevel), 0);
                    if(nSpellLevel > nArcHighest)
                        nArcHighest = nSpellLevel;
                }
            }
        }
        else if(GetIsPsionicClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstPsiClassFound &&
                GetFirstPsionicClass(oPC) == nClass)
            {
                nLevel += GetPsionicPRCLevels(oPC);
                bFirstPsiClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);
            string sPsiFile = GetAMSKnownFileName(nClass);
            int nMaxLevel = StringToInt(Get2DACache(sPsiFile, "MaxPowerLevel", nLevel));

            int nPsiHighest = min(nMaxLevel, nAbility - 10);

            for(nSpellLevel = 1; nSpellLevel <= nPsiHighest; nSpellLevel++)
            {
                SetLocalInt(oPC, "PRC_PsiPower"+IntToString(nSpellLevel), 0);
                if(DEBUG) DoDebug("Psionics power level Prereq Variable " + IntToString(nSpellLevel) +": " + IntToString(GetLocalInt(oPC, "PRC_PsiPower"+IntToString(nSpellLevel))), oPC);
            }
        }
    }// end while - loop over all 3 class slots

     // Find the sneak attack capacity.
     SneakRequirement(oPC);

     // Special requirements for several classes.
     Hathran(oPC);
     Tempest(oPC);
     KOTC(oPC);
     BFZ(oPC);
     ManAtArms(oPC);
     SOL(oPC);
     Stormlord(oPC);
     Blightlord(oPC);
     EOG(oPC);
     RedWizard(oPC);
     ShadowAdept(oPC);
     ThrallOfGrazzt(oPC);
     ShiningBlade(oPC);
     Shadowlord(oPC, nArcHighest);
     Shifter(oPC, nArcHighest, nDivHighest);
     DemiLich(oPC);
     Rava(oPC);
     WWolf(oPC);
     FH(oPC);
     Kord(oPC);
     BloodArcher(oPC);
     Maester(oPC);
     CombatMedic(oPC);
     Alaghar(oPC);
     RangerURangerMutex(oPC);
     Thrallherd(oPC);
     Shadowmind(oPC);
     Heartwarder(oPC);
     SoulEater(oPC);
     Tempus(oPC);
     Asmodeus(oPC);
     RacialHD(oPC);
     Virtuoso(oPC);
     Brimstone(oPC);
     CoC(oPC);
     DalQuor(oPC);
     Pyro(oPC);
     Suel(oPC);
     SkirmishRequirement(oPC);
     SpecialAttackRequirement(oPC);
     TomeOfBattle(oPC);
     // Truly massive message flood if activated.
     /*

     string sPRC_AllSpell;
     string sPRC_ArcSpell;
     string sPRC_DivSpell;
     for (iCount = 1; iCount <= 9; iCount++)
     {
        sPRC_AllSpell = "PRC_AllSpell" + IntToString(iCount);
        sPRC_ArcSpell = "PRC_ArcSpell" + IntToString(iCount);
        sPRC_DivSpell = "PRC_DivSpell" + IntToString(iCount);
        SendMessageToPC(oPC, sPRC_AllSpell + " is " + IntToString(GetLocalInt(oPC, sPRC_AllSpell)) + ". " +
                             sPRC_ArcSpell + " is " + IntToString(GetLocalInt(oPC, sPRC_ArcSpell)) + ". " +
                             sPRC_DivSpell + " is " + IntToString(GetLocalInt(oPC, sPRC_DivSpell)) + ".");
     }
     for (iCount = 1; iCount <= 30; iCount++)
     {
        sVariable = "PRC_SneakLevel" + IntToString(iCount);
        SendMessageToPC(oPC, sVariable + " is " + IntToString(GetLocalInt(oPC, sVariable)) + ".");
     }
     */

}
