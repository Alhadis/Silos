#include "inc_debug_dac"
#include "inc_race"
#include "zep_inc_main"
#include "aps_include"
#include "inc_nbde"

// how expensive is the loot generated?
const float MONTY_HAUL_FACTOR = 0.25;

// name of the variable to query for item spawns; it...
const string VAR_SPAWN_CODE = "DAC_SPAWN";
// ...may contain one or more of the following to enable spawning
const string SPAWN_AMULET = "M";
const string SPAWN_ARMOR = "A";
const string SPAWN_BELT = "B";
const string SPAWN_FOOTWEAR = "F";
const string SPAWN_CLOAK = "C";
const string SPAWN_GLOVES = "G";
const string SPAWN_HELM = "H";
const string SPAWN_RINGS = "R";
const string SPAWN_SHIELD = "S";
const string SPAWN_POTIONS = "P";
const string SPAWN_WEAPON = "W";
const string SPAWN_WIZARD_ITEMS = "Z";

// force melee ("M") or ranged ("R") or two-weapon style ("2")
const string VAR_BATTLE_STYLE = "DAC_BATTLE_STYLE";
const string BATTLE_STYLE_MELEE = "M";
const string BATTLE_STYLE_RANGED = "R";
const string BATTLE_STYLE_2WEAPON = "2";
// Preferred and available weapons
const string VAR_PREFERRED_WEAPONS = "DAC_PREFERRED_WEAPONS";
const string VAR_PREFERRED_SCORE = "DAC_PREFERRED_WEAPONS_SCORE";
const string VAR_ALLOWED_WEAPONS = "DAC_ALLOWED_WEAPONS";

void spawnItemsFor(object oCreature);
int isSpawnable(object oCreature, string sItemCode);
string chooseItem(object oCreature, string sSQL);
object spawnItem(object oCreature, string sResRef, int nStackSize = 1);

object spawnAmulet(object oCreature);
object spawnArmor(object oCreature);
object spawnBelt(object oCreature);
object spawnBoots(object oCreature);
object spawnCloak(object oCreature);
object spawnGauntlets(object oCreature);
object spawnHelm(object oCreature);
object spawnRing(object oCreature, int nSlot = INVENTORY_SLOT_RIGHTRING);
object spawnShield(object oCreature);
object spawnTreasure(object oCreature);
object spawnWeapons(object oCreature);

object getMeleeWeapon(object oCreature, int bOffhand = FALSE);
object getRangedWeapon(object oCreature);
object getRangedAmmo(object oCreature, int nWeaponBaseType);
int getMaxGPValue(object oCreature);
int getMinGPValue(object oCreature);
void setPreferredWeapon(object oCreature, int nWeaponType, int nScore);

const string AMMO = "AMMO";
const string AMULET = "AMULET";
const string ARMOR = "ARMOR";
const string BELT = "BELT";
const string BOOTS = "BOOTS";
const string CLOAK = "CLOAK";
const string GLOVES = "GLOVES";
const string HELMET = "HELMET";
const string RING = "RING";
const string SHIELD = "SHIELD";
const string POTION = "POTION";
const string TREASURE = "TREASURE";
const string WEAPON = "WEAPON";
const string WIZARD_ITEMS = "WIZARD";
const string _COUNT_SUFFIX = "_COUNT";

void spawnItemsFor(object oCreature)
{
   //debugVarObject("SpawnItemsFor()", oCreature);
   if (GetIsPC(oCreature)) return;

   string sSpawnCode = GetLocalString(oCreature, VAR_SPAWN_CODE);
   //debugVarObject("Spawn code is " + sSpawnCode);

   if (sSpawnCode == "")
   {
      // Try to guess what gear they should get
      switch (GetRacialType(oCreature)) // NPCs only, for PCs use MyPRCGetRacialType()
      {
         case RACIAL_TYPE_ANIMAL:
         case RACIAL_TYPE_BEAST:
         case RACIAL_TYPE_MAGICAL_BEAST:
         case RACIAL_TYPE_VERMIN:
            // nothing
            return;
            break;
         case RACIAL_TYPE_DWARF:
         case RACIAL_TYPE_ELF:
         case RACIAL_TYPE_FEY:
         case RACIAL_TYPE_GIANT:
         case RACIAL_TYPE_GNOME:
         case RACIAL_TYPE_HALFELF:
         case RACIAL_TYPE_HALFLING:
         case RACIAL_TYPE_HALFORC:
         case RACIAL_TYPE_HUMAN:
         case RACIAL_TYPE_HUMANOID_GOBLINOID:
         case RACIAL_TYPE_HUMANOID_MONSTROUS:
         case RACIAL_TYPE_HUMANOID_ORC:
         case RACIAL_TYPE_HUMANOID_REPTILIAN:
         case RACIAL_TYPE_OUTSIDER:
         case RACIAL_TYPE_SHAPECHANGER:
         case RACIAL_TYPE_UNDEAD:
         case 53: // Brownie
         case 163: // Drow female
         case 164: // Drow male
            // everything except wizard items
            sSpawnCode = "MFBCASHRGWT";
            break;
         case RACIAL_TYPE_ABERRATION:
            // This includes illithids (everything), beholders (treasure), and
            // driders (everything except boots), so nothing really works.
            // Default to treasure only here, but be sure to set the variable
            // manually for any creature templates created.
            switch(GetAppearanceType(oCreature))
            {
               case APPEARANCE_TYPE_BEHOLDER:
               case APPEARANCE_TYPE_BEHOLDER_EYEBALL:
               case APPEARANCE_TYPE_BEHOLDER_MAGE:
               case APPEARANCE_TYPE_BEHOLDER_MOTHER:
                  sSpawnCode = "T";
                  break;
               case APPEARANCE_TYPE_DRIDER:
               case APPEARANCE_TYPE_DRIDER_CHIEF:
               case APPEARANCE_TYPE_DRIDER_FEMALE:
                  sSpawnCode = "WAMBCSHRGT";
                  break;
               case APPEARANCE_TYPE_MINDFLAYER:
               case APPEARANCE_TYPE_MINDFLAYER_2:
               case APPEARANCE_TYPE_MINDFLAYER_ALHOON:
                  sSpawnCode = "WAMFBCSRGT";
                  break;
               case APPEARANCE_TYPE_INTELLECT_DEVOURER:
               case APPEARANCE_TYPE_WAR_DEVOURER:
                  sSpawnCode = "T";
                  break;
               case APPEARANCE_TYPE_ETTIN:
                  sSpawnCode = "WAMFBCSHRGT";
                  break;
               case APPEARANCE_TYPE_HOOK_HORROR:
                  sSpawnCode = "MFBCHT";
                  break;
               case APPEARANCE_TYPE_UMBERHULK:
                  sSpawnCode = "T";
                  break;
               case APPEARANCE_TYPE_WILL_O_WISP:
                  sSpawnCode = "T";
                  break;
               default:
                  sSpawnCode = "";
                  break;
            }
            break;
         case RACIAL_TYPE_DRAGON:
            // rings, amulets, and treasure
            sSpawnCode = "RMT";
            break;
         case RACIAL_TYPE_CONSTRUCT:
         case RACIAL_TYPE_ELEMENTAL:
            // nothing
            return;
            break;
         case RACIAL_TYPE_OOZE:
            // treasure left over from past victims
            sSpawnCode = "T";
            break;
         default:
            // default to nothing
            logError("ERROR in inc_equip:  racial type " +
               IntToString(GetRacialType(oCreature)) + " not recognized.");
            break;
      }
      SetLocalString(oCreature, VAR_SPAWN_CODE, sSpawnCode);
      //debugMsg("Guesstimate spawn code is " + sSpawnCode);
   }

   //debugMsg(GetName(oCreature) + ": min/max GP Value = " + IntToString(getMinGPValue(oCreature)) + "/" + IntToString(getMaxGPValue(oCreature)));

   float fDelay = 0.0f;
   object obj;
   obj = spawnAmulet(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_NECK));
   }
   obj = spawnArmor(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipMostEffectiveArmor());
   }
   obj = spawnBelt(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_BELT));
   }
   obj = spawnBoots(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_BOOTS));
   }
   obj = spawnCloak(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_CLOAK));
   }
   obj = spawnGauntlets(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_ARMS));
   }
   obj = spawnHelm(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_HEAD));
   }
   obj = spawnRing(oCreature, INVENTORY_SLOT_RIGHTRING);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_RIGHTRING));
   }
   obj = spawnRing(oCreature, INVENTORY_SLOT_LEFTRING);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_LEFTRING));
   }
   obj = spawnShield(oCreature);
   if (obj != OBJECT_INVALID && oCreature == OBJECT_SELF)
   {
      fDelay += 0.1f;
//      DelayCommand(fDelay, ActionEquipItem(obj, INVENTORY_SLOT_LEFTHAND));
   }
   obj = spawnTreasure(oCreature);
   obj = spawnWeapons(oCreature);
   // DetermineCombatRound should make them equip the best weapon
}

int isSpawnable(object oCreature, string sItemCode)
{
   string spawnCode = GetLocalString(oCreature, VAR_SPAWN_CODE);
   //debugMsg("Looking for " + sItemCode + " in >" + spawnCode + "<");
   int nIndex = FindSubString(spawnCode, sItemCode);
   //debugMsg("nIndex = " + IntToString(nIndex));
   return (nIndex != -1);
}

string chooseItem(object oCreature, string sSQL)
{
   //debugVarObject("ChooseItem()", OBJECT_SELF);
   //debugVarObject("oCreature", oCreature);
   //debugVarString("sSQL", sSQL);

   int nMinGP = getMinGPValue(oCreature);
   int nMaxGP = getMaxGPValue(oCreature);

   string sReturn = "";
   if (testODBC())
   {
      //debugVarString("sSQL", sSQL);
      // Stackable missiles like arrows cost much less for a single item,
      // so we divide the GP value for them.
      // Avoid giving out Special[1-5] items and OC Henchmen equipment.
      SQLExecDirect(sSQL +
         " AND i.palette_id NOT IN (0,1,2,3,4,118,59) " + // Special palettes
         " AND i.cost BETWEEN " +
//      " IF(i.base_item_id IN (20,25,27,31,59), " + // stackable missiles
//      IntToString(nMinGP / 100) + ", " +
         IntToString(nMinGP) +
//      ") " +
         " AND " +
//      " IF(i.base_item_id IN (20,25,27,31,59), " + // stackable missiles
//      IntToString(nMaxGP / 100) + ", " +
         IntToString(nMaxGP) +
//      ") " +
         " ORDER BY rand() LIMIT 1");
      if (SQLFetch())
      {
         sReturn = SQLGetData(1);
      }
//   else
//   {
//      logError("ERROR: no data found for " + sSQL + " in chooseItem()");
//   }
   } // if (testODBC())

   //debugVarString("sReturn", sReturn);
   return sReturn;
}

object spawnItem(object oCreature, string sResRef, int nStackSize = 1)
{
   //debugVarObject("SpawnItem(" + sResRef + "," + IntToString(nStackSize) + ")");
   if (sResRef == "") return OBJECT_INVALID;
   object oItem = CreateItemOnObject(sResRef, oCreature, nStackSize);
   if (oItem != OBJECT_INVALID)
   {
      //debugVarObject(GetName(oCreature) + " got", oItem);
      SetDroppableFlag(oItem, TRUE);
//      SetPickpocketableFlag(oItem, TRUE);
      SetItemCursedFlag(oItem, FALSE);
      SetPlotFlag(oItem, FALSE);
      SetStolenFlag(oItem, TRUE);
   }
   else
   {
      logError("ERROR in inc_equip: item resref " + sResRef + " is invalid");
   }

   return oItem;
}

object spawnAmulet(object oCreature)
{
   //debugVarObject("SpawnAmulet()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_AMULET)) return OBJECT_INVALID;

   int nChanceForAmulet = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugVarInt("nChanceForAmulet", nChanceForAmulet);
   if (d100() > nChanceForAmulet) return OBJECT_INVALID;
   //debugMsg("Spawning an amulet");

   string sSQL =
      "SELECT i.resref AS amulet " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 19 ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oAmulet = spawnItem(oCreature, sResRef);
   if (oAmulet != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oAmulet, TRUE);
   }
   //debugVarObject("oAmulet", oAmulet);
   return oAmulet;
}

object spawnArmor(object oCreature)
{
   //debugVarObject("SpawnArmor()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_ARMOR)) return OBJECT_INVALID;

   // If they already have pretty good equipment, don't pile on more.
   if (GetGoldPieceValue(GetItemInSlot(INVENTORY_SLOT_CHEST, oCreature)) > getMinGPValue(oCreature))
   {
      return OBJECT_INVALID;
   }

   //debugVarObject("Spawning armor", OBJECT_SELF);

   int nHD = (GetHitDice(oCreature) > 0 ? GetHitDice(oCreature) : 1);

   // weighted chance to have this type of equipment
   int nHvyArmor = 0;
   int nMedArmor = 0;
   int nLgtArmor = 0;

   if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_HEAVY, oCreature))
   {
      nHvyArmor = 10;
      // heavy armor negates dexterity
      nHvyArmor -= GetAbilityModifier(ABILITY_DEXTERITY, oCreature);
      // @TODO Adjust for arcane spellcasting
      // it takes strength just to wear heavy armor
      nHvyArmor += GetAbilityModifier(ABILITY_STRENGTH, oCreature);
      // adjust for stealth
      nHvyArmor -= (GetSkillRank(SKILL_HIDE, oCreature) +
                     GetSkillRank(SKILL_MOVE_SILENTLY, oCreature) * 2) / nHD;
   }
   if (nHvyArmor < 0) nHvyArmor = 0;

   //debugMsg("nHvyArmor = " + IntToString(nHvyArmor));

   if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_MEDIUM, oCreature))
   {
      nMedArmor = 10;
      // armor negates dexterity
      nMedArmor -= GetAbilityModifier(ABILITY_DEXTERITY, oCreature);
      // @TODO Adjust for arcane spellcasting
      // it takes strength just to wear heavy armor
      nMedArmor += GetAbilityModifier(ABILITY_STRENGTH, oCreature);
      // adjust for stealth
      nMedArmor -= (GetSkillRank(SKILL_HIDE, oCreature) +
                    GetSkillRank(SKILL_MOVE_SILENTLY, oCreature) * 2) / nHD;
   }
   if (nMedArmor < 0) nMedArmor = 0;

   //debugMsg("nMedArmor = " + IntToString(nMedArmor));

   if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_LIGHT, oCreature))
   {
      nLgtArmor = 10;
   }

   //debugMsg("nLgtArmor = " + IntToString(nLgtArmor));

   string sSQL =
      "SELECT i.resref AS armor " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 16 ";

   int nTotalArmorChances = nHvyArmor + nMedArmor + nLgtArmor;

   if (Random(nTotalArmorChances) < nHvyArmor)
   {
      if (isDrow(oCreature))
      {
         sSQL += " AND INSTR(name, 'Drow') = 1 ";
      }
      else if (isDuergar(oCreature))
      {
         sSQL += " AND INSTR(name, 'Duergar') = 1 ";
      }

      sSQL += " AND palette_id = 8 ";
   }
   else if (Random(nTotalArmorChances) < nMedArmor)
   {
      if (isDrow(oCreature))
      {
         sSQL += " AND INSTR(name, 'Drow') = 1 ";
      }
      else if (isDuergar(oCreature))
      {
         sSQL += " AND INSTR(name, 'Duergar') = 1 ";
      }

      sSQL += " AND palette_id = 7 ";
   }
   else if (Random(nTotalArmorChances) < nLgtArmor)
   {
      if (isDrow(oCreature))
      {
         sSQL += " AND INSTR(name, 'Drow') = 1 ";
      }
      else if (isDuergar(oCreature))
      {
         sSQL += " AND INSTR(name, 'Duergar') = 1 ";
      }

      sSQL += " AND palette_id = 6 ";
   }
   else
   {
      sSQL += " AND palette_id = 5 ";
      string sSubSQL = "";

      // Everyone can wear clothes
      if (GetLevelByClass(CLASS_TYPE_MONK, oCreature) == 0)
      {
         sSQL += " AND (INSTR(name, 'Old Order') = 0 AND " +
            "INSTR(name, 'Shining Hand') = 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_SORCERER, oCreature) == 0 &&
         GetLevelByClass(CLASS_TYPE_BARD, oCreature) == 0 &&
         GetLevelByClass(CLASS_TYPE_WIZARD, oCreature) == 0)
      {
         sSQL += " AND (INSTR(name, 'Sequencer') = 0) ";
      }

/**** this section not working out well
      if (GetLevelByClass(CLASS_TYPE_WIZARD, oCreature) +
          GetLevelByClass(CLASS_TYPE_SORCERER, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " ((INSTR(name, 'Robe') > 0 AND " +
            "INSTR(name, 'Robes of the') = 0) OR " +
            "(INSTR(name, 'Conjuror') > 0 OR " +
            "INSTR(name, 'Illusionist') > 0 OR " +
            "INSTR(name, 'Sorceror') > 0 OR INSTR(name, 'Wizard') > 0 OR " +
            "INSTR(name, 'Necromancer') > 0 OR " +
            "INSTR(name, 'Palemaster') > 0 OR INSTR(name, 'Mage') > 0)) ";
      }

      if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Assassin') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_ROGUE, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Rogue') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_MONK, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Monk') > 0 OR " +
            "INSTR(name, 'Robes of the') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_FIGHTER, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Warrior') > 0 OR " +
            "INSTR(name, 'Gladiator') > 0 OR INSTR(name, 'Soldier') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_CLERIC, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Adept') > 0 OR " +
            "INSTR(name, 'Priest') > 0 OR INSTR(name, 'Cleric') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_BARBARIAN, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Barbarian') > 0 OR " +
            "INSTR(name, 'Gladiator') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_BARD, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Bard') > 0 OR " +
            "INSTR(name, 'Performer') > 0 OR " +
            "INSTR(name, 'Minstrel') > 0 OR " +
            "INSTR(name, 'Artist') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_PALADIN, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Paladin') > 0 OR " +
            "INSTR(name, 'Holy') > 0 OR INSTR(name, 'Warrior') > 0) ";
      }

      if (GetLevelByClass(CLASS_TYPE_SHIFTER, oCreature) > 0)
      {
         if (sSubSQL != "") sSubSQL += " OR ";
         sSubSQL += " (INSTR(name, 'Shifter') > 0) ";
      }
this section not working out well ****/

      if (sSubSQL != "") sSQL += " AND (" + sSubSQL + ") ";
   }

   string sResRef = chooseItem(oCreature, sSQL);
   object oArmor = spawnItem(oCreature, sResRef);
   //debugVarObject("Spawned armor: ", oArmor);
   if (oArmor != OBJECT_INVALID) SetPickpocketableFlag(oArmor, FALSE);
//   AssignCommand(oCreature, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));
   AssignCommand(oCreature, ActionEquipMostEffectiveArmor());

   return oArmor;
}

object spawnBelt(object oCreature)
{
   //debugVarObject("SpawnBelt()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_BELT)) return OBJECT_INVALID;

   int nChanceForBelt = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for belt = " + IntToString(nChanceForBelt));
   if (d100() > nChanceForBelt) return OBJECT_INVALID;
   //debugVarObject("Spawning a belt");

   string sSQL =
      "SELECT i.resref AS belt " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 21 ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oBelt = spawnItem(oCreature, sResRef);
   //debugVarObject("oBelt", oBelt);
   if (oBelt != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oBelt, FALSE);
//      AssignCommand(oCreature, ActionEquipItem(oBelt, INVENTORY_SLOT_BELT));
   }

   return oBelt;
}

object spawnBoots(object oCreature)
{
   //debugVarObject("SpawnBoots()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_FOOTWEAR)) return OBJECT_INVALID;

   int nChanceForBoots = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for boots = " + IntToString(nChanceForBoots));
   if (d100() > nChanceForBoots) return OBJECT_INVALID;
   //debugVarObject("Spawning boots");

   string sSQL =
      "SELECT i.resref AS boots " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 26 ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oBoots = spawnItem(oCreature, sResRef);
   //debugVarObject("oBoots", oBoots);
   if (oBoots != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oBoots, FALSE);
//      AssignCommand(oCreature, ActionEquipItem(oBoots, INVENTORY_SLOT_BOOTS));
   }

   return oBoots;
}

object spawnCloak(object oCreature)
{
   //debugVarObject("SpawnCloak()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_CLOAK)) return OBJECT_INVALID;

   int nChanceForCloak = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for cloak = " + IntToString(nChanceForCloak));
   if (d100() > nChanceForCloak) return OBJECT_INVALID;
   //debugVarObject("Spawning a cloak");

   string sSQL =
      "SELECT i.resref AS cloak " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id IN (80, 349) ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oCloak = spawnItem(oCreature, sResRef);
   //debugVarObject("oCloak", oCloak);
   if (oCloak != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oCloak, FALSE);
//      AssignCommand(oCreature, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK));
   }

   return oCloak;
}

object spawnGauntlets(object oCreature)
{
   //debugVarObject("SpawnGauntlets()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_GLOVES)) return OBJECT_INVALID;

   int nChanceForGauntlets = FloatToInt(GetHitDice(oCreature) *
      MONTY_HAUL_FACTOR);
   if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE, oCreature))
   {
      nChanceForGauntlets += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_UNARMED_STRIKE, oCreature))
      {
         nChanceForGauntlets += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_UNARMED, oCreature))
         {
            nChanceForGauntlets += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_UNARMED, oCreature))
      {
         nChanceForGauntlets += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_UNARMED, oCreature))
         {
            nChanceForGauntlets += 10;
         }
      }
   }
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_UNARMED_STRIKE, oCreature))
   {
      nChanceForGauntlets += 10;
   }
   //debugMsg("chance for gauntlets = " + IntToString(nChanceForGauntlets));
   if (d100() > nChanceForGauntlets) return OBJECT_INVALID;
   //debugVarObject("Spawning gauntlets");

   string sSQL =
      "SELECT i.resref AS gloves " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 36 ";

   if (GetLevelByClass(CLASS_TYPE_MONK, oCreature) == 0)
   {
      sSQL += " AND (INSTR(i.name, 'Hin Fist') = 0 AND " +
         "INSTR(i.name, 'Long Death') = 0 AND " +
         "INSTR(i.name, 'Yellow Rose') = 0) ";
   }

   if (GetSkillRank(SKILL_PERFORM, oCreature) == 0)
   {
      sSQL += " AND (INSTR(i.name, 'Minstrel') = 0) ";
   }

   string sResRef = chooseItem(oCreature, sSQL);
   object oGauntlets = spawnItem(oCreature, sResRef);
   //debugVarObject("oGauntlets", oGauntlets);
   if (oGauntlets != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oGauntlets, TRUE);
//      AssignCommand(oCreature, ActionEquipItem(oGauntlets, INVENTORY_SLOT_ARMS));
   }

   return oGauntlets;
}

object spawnHelm(object oCreature)
{
   //debugVarObject("SpawnHelm()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_HELM)) return OBJECT_INVALID;

   int nChanceForHelm = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for helm = " + IntToString(nChanceForHelm));
   if (d100() > nChanceForHelm) return OBJECT_INVALID;
   //debugVarObject("Spawning a helm");

   string sSQL =
      "SELECT i.resref AS helm " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 17 ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oHelm = spawnItem(oCreature, sResRef);
   //debugVarObject("oHelm", oHelm);
   if (oHelm != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oHelm, FALSE);
//      AssignCommand(oCreature, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));
   }

   return oHelm;
}

object spawnRing(object oCreature, int nSlot = INVENTORY_SLOT_RIGHTRING)
{
   //debugVarObject("SpawnRing()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_RINGS)) return OBJECT_INVALID;

   int nChanceForRing = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for ring = " + IntToString(nChanceForRing));
   if (d100() > nChanceForRing) return OBJECT_INVALID;
   //debugVarObject("Spawning a ring");

   string sSQL =
      "SELECT i.resref AS ring " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id = 52 ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oRing = spawnItem(oCreature, sResRef);
   //debugVarObject("oRing", oRing);
   if (oRing != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oRing, TRUE);
//      AssignCommand(oCreature, ActionEquipItem(oRing, nSlot));
   }

   return oRing;
}

object spawnShield(object oCreature)
{
   //debugVarObject("SpawnShield()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_SHIELD)) return OBJECT_INVALID;

   if (! GetHasFeat(FEAT_SHIELD_PROFICIENCY, oCreature)) return OBJECT_INVALID;

   int nChanceForShield = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for shield = " + IntToString(nChanceForShield));
   if (d100() > nChanceForShield) return OBJECT_INVALID;
   //debugVarObject("Spawning a shield");

   // @TODO adjust for stealthiness
   // @TODO adjust for arcane spellcasters
   string sSQL =
      "SELECT i.resref AS shield " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id IN (14, 56, 57) ";

   if (isDrow(oCreature)) sSQL += " AND INSTR(i.name, 'Drow') > 0 ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oShield = spawnItem(oCreature, sResRef);
   //debugVarObject("oShield", oShield);
   if (oShield != OBJECT_INVALID)
   {
      SetPickpocketableFlag(oShield, FALSE);
//      AssignCommand(oCreature, ActionEquipItem(oShield, INVENTORY_SLOT_LEFTHAND));
   }

   return oShield;
}

object spawnTreasure(object oCreature)
{
   //debugVarObject("SpawnTreasure()", oCreature);
   // check flag to see if this creature can use this type of item
//   if (! isSpawnable(oCreature, SPAWN_TREASURE)) return OBJECT_INVALID;

   int nChanceForTreasure = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for treasure = " + IntToString(nChanceForTreasure));
   if (d100() > nChanceForTreasure) return OBJECT_INVALID;
   //debugVarObject("Spawning treasure");

   string sSQL =
      "SELECT i.resref AS treasure " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id IN (15, 24, 29, 34, 39, 49, 62, 64, 65, 66, 74, " +
                 "77, 79, 81, 109, 110, 306, 311, 314, 325, 327, 349) ";

   string sResRef = chooseItem(oCreature, sSQL);
   object oTreasure = spawnItem(oCreature, sResRef);
   //debugVarObject("oTreasure", oTreasure);
   SetPickpocketableFlag(oTreasure, TRUE);

   return oTreasure;
}

//
// This one works a little differently, because it has to figure out
// whether the creature would rather have a melee or missile weapon
// as their primary.  If missile, do they want a backup melee weapon?
// If melee, do they prefer light or heavy weapons?  Two weapon style,
// two hand style, weapon and shield, or just a one-handed weapon?
// This method may spawn (and equip) more than one weapon, but returns
// only the primary.
object spawnWeapons(object oCreature)
{
   //debugVarObject("SpawnWeapons()", oCreature);
   // check flag to see if this creature can use this type of item
   if (! isSpawnable(oCreature, SPAWN_WEAPON)) return OBJECT_INVALID;

   // If they already have pretty good equipment, don't pile on more.
   if (GetGoldPieceValue(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCreature)) > getMinGPValue(oCreature))
   {
      return OBJECT_INVALID;
   }

//   int nChanceForWeapon = FloatToInt(GetHitDice(oCreature) * MONTY_HAUL_FACTOR);
   //debugMsg("chance for weapon = " + IntToString(nChanceForWeapon));
//   if (d100() > nChanceForWeapon) return OBJECT_INVALID;
   //debugVarObject("Spawning weapons");

   object oPrimary = OBJECT_INVALID;

   int nChanceOfWeapon = 100;
   SetLocalString(oCreature, VAR_PREFERRED_WEAPONS, "-1");
   SetLocalString(oCreature, VAR_ALLOWED_WEAPONS, "-1");
   SetLocalInt(oCreature, VAR_PREFERRED_SCORE, 0);

   // if DX is higher than ST, probably want a ranged weapon
   int nChanceOfRangedWeapon = 50 + (10 *
      (GetAbilityScore(oCreature, ABILITY_DEXTERITY) -
       GetAbilityScore(oCreature, ABILITY_STRENGTH)
      )
     );

   int nChanceOfTwoWeaponStyle = 0;
   if (GetHasFeat(FEAT_TWO_WEAPON_FIGHTING, oCreature))
   {
      nChanceOfTwoWeaponStyle += 50;
      nChanceOfRangedWeapon -= 25;
      if (GetHasFeat(FEAT_IMPROVED_TWO_WEAPON_FIGHTING, oCreature))
      {
         nChanceOfTwoWeaponStyle += 50;
         nChanceOfRangedWeapon -= 40;
      }
   }
   if (GetHasFeat(FEAT_AMBIDEXTERITY, oCreature))
   {
      nChanceOfTwoWeaponStyle += 25;
      nChanceOfRangedWeapon -= 20;
   }
   if (GetHasFeat(FEAT_CLEAVE, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
      if (GetHasFeat(FEAT_GREAT_CLEAVE, oCreature))
      {
         nChanceOfRangedWeapon -= 5;
      }
   }
   if (GetHasFeat(FEAT_DIRTY_FIGHTING, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_DISARM, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
      if (GetHasFeat(FEAT_IMPROVED_DISARM, oCreature))
      {
         nChanceOfRangedWeapon -= 5;
      }
   }
   if (GetHasFeat(FEAT_EPIC_MONK, oCreature))
   {
      nChanceOfWeapon -= 50;
   }
   if (GetHasFeat(FEAT_IMPROVED_UNARMED_STRIKE, oCreature))
   {
      nChanceOfWeapon -= 10;
   }
   if (GetHasFeat(FEAT_INCREASE_MULTIPLIER, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_KI_CRITICAL, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_KI_DAMAGE, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_KI_STRIKE, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_KNOCKDOWN, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
      if (GetHasFeat(FEAT_IMPROVED_KNOCKDOWN, oCreature))
      {
         nChanceOfRangedWeapon -= 5;
      }
   }
   if (GetHasFeat(FEAT_POWER_ATTACK, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
      if (GetHasFeat(FEAT_IMPROVED_POWER_ATTACK, oCreature))
      {
         nChanceOfRangedWeapon -= 5;
      }
   }
   if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_1, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
      if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_2, oCreature))
      {
         nChanceOfRangedWeapon -= 5;
         if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_3, oCreature))
         {
            nChanceOfRangedWeapon -= 5;
            if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_4, oCreature))
            {
               nChanceOfRangedWeapon -= 5;
               if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_5, oCreature))
               {
                  nChanceOfRangedWeapon -= 5;
                  if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_6, oCreature))
                  {
                     nChanceOfRangedWeapon -= 5;
                     if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_7, oCreature))
                     {
                        nChanceOfRangedWeapon -= 5;
                        if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_8, oCreature))
                        {
                           nChanceOfRangedWeapon -= 5;
                           if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_9, oCreature))
                           {
                              nChanceOfRangedWeapon -= 5;
                              if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_10, oCreature))
                              {
                                 nChanceOfRangedWeapon -= 5;
                                 if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_11, oCreature))
                                 {
                                    nChanceOfRangedWeapon -= 5;
                                    if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_12, oCreature))
                                    {
                                       nChanceOfRangedWeapon -= 5;
                                       if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_13, oCreature))
                                       {
                                          nChanceOfRangedWeapon -= 5;
                                          if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_14, oCreature))
                                          {
                                             nChanceOfRangedWeapon -= 5;
                                             if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_15, oCreature))
                                             {
                                                nChanceOfRangedWeapon -= 5;
                                                if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_16, oCreature))
                                                {
                                                   nChanceOfRangedWeapon -= 5;
                                                   if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_17, oCreature))
                                                   {
                                                      nChanceOfRangedWeapon -= 5;
                                                      if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_18, oCreature))
                                                      {
                                                         nChanceOfRangedWeapon -= 5;
                                                         if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_19, oCreature))
                                                         {
                                                            nChanceOfRangedWeapon -= 5;
                                                            if (GetHasFeat(FEAT_PRESTIGE_DEATH_ATTACK_20, oCreature))
                                                            {
                                                               nChanceOfRangedWeapon -= 5;
                                                            }
                                                         }
                                                      }
                                                   }
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
   if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_1, oCreature))
   {
      nChanceOfRangedWeapon += 5;
      if (GetHasFeat(FEAT_PRESTIGE_IMBUE_ARROW, oCreature))
      {
         nChanceOfRangedWeapon += 5;
      }
      if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_2, oCreature))
      {
         nChanceOfRangedWeapon += 5;
         if (GetHasFeat(FEAT_PRESTIGE_SEEKER_ARROW_1, oCreature))
         {
            nChanceOfRangedWeapon += 5;
         }
         if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_3, oCreature))
         {
            nChanceOfRangedWeapon += 5;
            if (GetHasFeat(FEAT_PRESTIGE_SEEKER_ARROW_2, oCreature))
            {
               nChanceOfRangedWeapon += 5;
            }
            if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_4, oCreature))
            {
               nChanceOfRangedWeapon += 5;
               if (GetHasFeat(FEAT_PRESTIGE_HAIL_OF_ARROWS, oCreature))
               {
                  nChanceOfRangedWeapon += 5;
               }
               if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_5, oCreature))
               {
                  nChanceOfRangedWeapon += 5;
                  if (GetHasFeat(FEAT_PRESTIGE_ARROW_OF_DEATH, oCreature))
                  {
                     nChanceOfRangedWeapon += 10;
                  }
                  if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_6, oCreature))
                  {
                     nChanceOfRangedWeapon += 5;
                     if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_7, oCreature))
                     {
                        nChanceOfRangedWeapon += 5;
                        if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_8, oCreature))
                        {
                           nChanceOfRangedWeapon += 5;
                           if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_9, oCreature))
                           {
                              nChanceOfRangedWeapon += 5;
                              if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_10, oCreature))
                              {
                                 nChanceOfRangedWeapon += 5;
                                 if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_11, oCreature))
                                 {
                                    nChanceOfRangedWeapon += 5;
                                    if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_12, oCreature))
                                    {
                                       nChanceOfRangedWeapon += 5;
                                       if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_13, oCreature))
                                       {
                                          nChanceOfRangedWeapon += 5;
                                          if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_14, oCreature))
                                          {
                                             nChanceOfRangedWeapon += 5;
                                             if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_15, oCreature))
                                             {
                                                nChanceOfRangedWeapon += 5;
                                                if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_16, oCreature))
                                                {
                                                   nChanceOfRangedWeapon += 5;
                                                   if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_17, oCreature))
                                                   {
                                                      nChanceOfRangedWeapon += 5;
                                                      if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_18, oCreature))
                                                      {
                                                         nChanceOfRangedWeapon += 5;
                                                         if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_19, oCreature))
                                                         {
                                                            nChanceOfRangedWeapon += 5;
                                                            if (GetHasFeat(FEAT_PRESTIGE_ENCHANT_ARROW_20, oCreature))
                                                            {
                                                               nChanceOfRangedWeapon += 5;
                                                               if (GetHasFeat(FEAT_EPIC_ARCANE_ARCHER, oCreature))
                                                               {
                                                                  nChanceOfRangedWeapon += 25;
                                                               }
                                                            }
                                                         }
                                                      }
                                                   }
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
   if (GetHasFeat(FEAT_QUIVERING_PALM, oCreature))
   {
      nChanceOfWeapon -= 10;
   }
   if (GetHasFeat(FEAT_RAPID_RELOAD, oCreature))
   {
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_RAPID_SHOT, oCreature))
   {
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_SMITE_EVIL, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_SMITE_GOOD, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_SNEAK_ATTACK, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
   }
   if (GetHasFeat(FEAT_STUNNING_FIST, oCreature))
   {
      nChanceOfWeapon -= 10;
   }
   nChanceOfRangedWeapon -= GetLevelByClass(CLASS_TYPE_WEAPON_MASTER,
      oCreature);
   // start of weapon specific feats
   int nWeaponType;
   int nScore;
   // Bastard Sword
   nWeaponType = 3;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_BASTARD_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_BASTARD_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_BASTARD_SWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_BASTARDSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_BASTARDSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_BASTARDSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_BASTARDSWORD, oCreature))
      {
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Battle Axe
   nWeaponType = 2;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_BATTLE_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_BATTLE_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_BATTLE_AXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_BATTLEAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_BATTLEAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_BATTLEAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_BATTLEAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Club
   nWeaponType = 28;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_CLUB, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_CLUB, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_CLUB, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_CLUB, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_CLUB, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_CLUB, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_CLUB, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Dagger
   nWeaponType = 22;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_DAGGER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_DAGGER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_DAGGER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_DAGGER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_DAGGER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_DAGGER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_DAGGER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Dire Mace
   nWeaponType = 32;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_DIRE_MACE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_DIRE_MACE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_DIRE_MACE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_DIREMACE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_DIREMACE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_DIREMACE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_DIREMACE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Double Axe
   nWeaponType = 33;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_DOUBLE_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_DOUBLE_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_DOUBLE_AXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_DOUBLEAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_DOUBLEAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_DOUBLEAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_DOUBLEAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Dwarven WarAxe
   nWeaponType = 108;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_DWAXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_DWAXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_DWAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_DWAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_DWAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_DWAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_DWAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Great Axe
   nWeaponType = 18;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_GREAT_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_GREAT_AXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_GREATAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_GREATAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_GREATAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_GREATAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Great Sword
   nWeaponType = 13;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_GREAT_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_GREAT_SWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_GREATSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_GREATSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_GREATSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_GREATSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Halberd
   nWeaponType = 10;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_HALBERD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_HALBERD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_HALBERD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_HALBERD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_HALBERD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_HALBERD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_HALBERD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Hand Axe
   nWeaponType = 38;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_HAND_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_HAND_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_HAND_AXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_HANDAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_HANDAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_HANDAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_HANDAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Heavy Flail
   nWeaponType = 35;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_HEAVY_FLAIL, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_FLAIL, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_HEAVY_FLAIL, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_HEAVYFLAIL, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_HEAVYFLAIL, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_HEAVYFLAIL, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_HEAVYFLAIL, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Kama
   nWeaponType = 40;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_KAMA, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_KAMA, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_KAMA, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_KAMA, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_KAMA, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_KAMA, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_KAMA, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Katana
   nWeaponType = 41;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_KATANA, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_KATANA, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_KATANA, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_KATANA, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_KATANA, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_KATANA, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_KATANA, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Kukri
   nWeaponType = 42;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_KUKRI, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_KUKRI, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      setPreferredWeapon(oCreature, 313, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_KUKRI, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_KUKRI, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_KUKRI, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_KUKRI, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_KUKRI, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Light Flail
   nWeaponType = 4;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_LIGHT_FLAIL, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_FLAIL, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LIGHT_FLAIL, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LIGHTFLAIL, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTFLAIL, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTFLAIL, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_LIGHTFLAIL, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Light Hammer
   nWeaponType = 37;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_LIGHT_HAMMER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_HAMMER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LIGHT_HAMMER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LIGHTHAMMER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTHAMMER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTHAMMER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_LIGHTHAMMER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Light Mace
   nWeaponType = 9;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_LIGHT_MACE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_MACE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LIGHT_MACE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LIGHTMACE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTMACE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTMACE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_LIGHTMACE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Long Sword
   nWeaponType = 1;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_LONG_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_LONG_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LONG_SWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LONGSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_LONGSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_LONGSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_LONGSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Morning Star
   nWeaponType = 47;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_MORNING_STAR, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_MORNING_STAR, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_MORNING_STAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_MORNINGSTAR, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_MORNINGSTAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_MORNINGSTAR, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_MORNINGSTAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // (Quarter)Staff
   nWeaponType = 50;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_STAFF, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_STAFF, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_STAFF, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_QUARTERSTAFF, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_QUARTERSTAFF, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_QUARTERSTAFF, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_QUARTERSTAFF, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Rapier
   nWeaponType = 51;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_RAPIER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_RAPIER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_RAPIER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_RAPIER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_RAPIER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_RAPIER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_RAPIER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Scimitar
   nWeaponType = 53;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SCIMITAR, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SCIMITAR, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SCIMITAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SCIMITAR, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SCIMITAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SCIMITAR, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SCIMITAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Scythe
   nWeaponType = 55;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SCYTHE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SCYTHE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SCYTHE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SCYTHE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SCYTHE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SCYTHE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SCYTHE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Spear
   nWeaponType = 58;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SPEAR, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SPEAR, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SPEAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SHORTSPEAR, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SHORTSPEAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SHORTSPEAR, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SHORTSPEAR, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Short Sword
   nWeaponType = 0;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SHORT_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SHORT_SWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SHORTSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SHORTSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SHORTSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SHORTSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Sickle
   nWeaponType = 60;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SICKLE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SICKLE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SICKLE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SICKLE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SICKLE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SICKLE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SICKLE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Two Bladed Sword
   nWeaponType = 12;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_TWO_BLADED_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_TWO_BLADED_SWORD, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_TWO_BLADED_SWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_TWOBLADEDSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_TWOBLADEDSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_TWOBLADEDSWORD, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_TWOBLADEDSWORD, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // War Hammer
   nWeaponType = 5;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_WAR_HAMMER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_WAR_HAMMER, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_WAR_HAMMER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_WARHAMMER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_WARHAMMER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_WARHAMMER, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_WARHAMMER, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Whip
   nWeaponType = 111;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_WHIP, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_WHIP, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_WHIP, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_WHIP, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_WHIP, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_WHIP, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_WHIP, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon -= 10;
      }
   }
   // Dart
   nWeaponType = 31;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_DART, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_DART, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_DART, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_DART, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_DART, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_DART, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_DART, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Heavy Crossbow
   nWeaponType = 6;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_HEAVY_CROSSBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_HEAVY_CROSSBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_HEAVYCROSSBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_HEAVYCROSSBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_HEAVYCROSSBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_HEAVYCROSSBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Light Crossbow
   nWeaponType = 7;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_LIGHT_CROSSBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LIGHT_CROSSBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LIGHTCROSSBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTCROSSBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTCROSSBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_LIGHTCROSSBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Longbow
   nWeaponType = 8;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_LONGBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_LONGBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_LONGBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_LONGBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_LONGBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_LONGBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_LONGBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Shortbow
   nWeaponType = 11;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SHORTBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SHORTBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SHORTBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SHORTBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SHORTBOW, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SHORTBOW, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Shuriken
   nWeaponType = 59;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SHURIKEN, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SHURIKEN, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SHURIKEN, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SHURIKEN, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SHURIKEN, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SHURIKEN, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SHURIKEN, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Sling
   nWeaponType = 61;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_SLING, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_SLING, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_SLING, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_SLING, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_SLING, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_SLING, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_SLING, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Throwing Axe
   nWeaponType = 63;
   nScore = 0;
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_THROWING_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_THROWING_AXE, oCreature))
   {
      nScore += 10;
      setPreferredWeapon(oCreature, nWeaponType, nScore);
      nChanceOfRangedWeapon += 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_THROWING_AXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_THROWINGAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_THROWINGAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_THROWINGAXE, oCreature))
         {
            nScore += 10;
            setPreferredWeapon(oCreature, nWeaponType, nScore);
            nChanceOfRangedWeapon += 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_THROWINGAXE, oCreature))
      {
         nScore += 10;
         setPreferredWeapon(oCreature, nWeaponType, nScore);
         nChanceOfRangedWeapon += 10;
      }
   }
   // Unarmed Strike
   if (GetHasFeat(FEAT_IMPROVED_CRITICAL_UNARMED_STRIKE, oCreature))
   {
      nChanceOfWeapon -= 10;
      nChanceOfRangedWeapon -= 10;
   }
   if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE, oCreature))
   {
      nChanceOfWeapon -= 10;
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_WEAPON_SPECIALIZATION_UNARMED_STRIKE, oCreature))
      {
         nChanceOfWeapon -= 10;
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_WEAPON_SPECIALIZATION_UNARMED, oCreature))
         {
            nChanceOfWeapon -= 10;
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_OVERWHELMING_CRITICAL_UNARMED, oCreature))
      {
         nChanceOfWeapon -= 10;
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_DEVASTATING_CRITICAL_UNARMED, oCreature))
         {
            nChanceOfWeapon -= 10;
            nChanceOfRangedWeapon -= 10;
         }
      }
      if (GetHasFeat(FEAT_EPIC_WEAPON_FOCUS_UNARMED, oCreature))
      {
         nChanceOfWeapon -= 10;
         nChanceOfRangedWeapon -= 10;
      }
   }
   if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_1, oCreature))
   {
      nChanceOfWeapon -= 10;
      nChanceOfRangedWeapon -= 10;
      if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_2, oCreature))
      {
         nChanceOfWeapon -= 10;
         nChanceOfRangedWeapon -= 10;
         if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_3, oCreature))
         {
            nChanceOfWeapon -= 10;
            nChanceOfRangedWeapon -= 10;
            if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_4, oCreature))
            {
               nChanceOfWeapon -= 10;
               nChanceOfRangedWeapon -= 10;
               if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_5, oCreature))
               {
                  nChanceOfWeapon -= 10;
                  nChanceOfRangedWeapon -= 10;
                  if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_6, oCreature))
                  {
                     nChanceOfWeapon -= 10;
                     nChanceOfRangedWeapon -= 10;
                     if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_7, oCreature))
                     {
                        nChanceOfWeapon -= 10;
                        nChanceOfRangedWeapon -= 10;
                        if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_8, oCreature))
                        {
                           nChanceOfWeapon -= 10;
                           nChanceOfRangedWeapon -= 10;
                           if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_9, oCreature))
                           {
                              nChanceOfWeapon -= 10;
                              nChanceOfRangedWeapon -= 10;
                              if (GetHasFeat(FEAT_EPIC_IMPROVED_STUNNING_FIST_10, oCreature))
                              {
                                 nChanceOfWeapon -= 10;
                                 nChanceOfRangedWeapon -= 10;
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
   if (GetHasFeat(FEAT_WHIRLWIND_ATTACK, oCreature))
   {
      nChanceOfRangedWeapon -= 5;
      if (GetHasFeat(FEAT_IMPROVED_WHIRLWIND, oCreature))
      {
         nChanceOfRangedWeapon -= 5;
      }
   }
   if (GetHasFeat(FEAT_ZEN_ARCHERY, oCreature))
   {
      nChanceOfRangedWeapon += 10;
   }

   //debugMsg("chance of weapon = " + IntToString(nChanceOfWeapon));
   if (d100() > nChanceOfWeapon) return OBJECT_INVALID;

   int bTwoWeaponStyle = FALSE;
   if (GetLocalString(oCreature, VAR_BATTLE_STYLE) == BATTLE_STYLE_2WEAPON)
   {
      bTwoWeaponStyle = TRUE;
   }
   else
   {
      bTwoWeaponStyle = ((d100() < nChanceOfTwoWeaponStyle));
   }

   //debugMsg("Chance of ranged weapon = " + IntToString(nChanceOfRangedWeapon));
   int bRangedStyle = FALSE;
   if (GetLocalString(oCreature, VAR_BATTLE_STYLE) == BATTLE_STYLE_RANGED ||
      GetLocalInt(oCreature, "X0_COMBAT_FLAG_RANGED"))
   {
      bRangedStyle = TRUE;
   }
   else if (GetLocalString(oCreature, VAR_BATTLE_STYLE) == BATTLE_STYLE_MELEE ||
      GetLocalString(oCreature, VAR_BATTLE_STYLE) == BATTLE_STYLE_2WEAPON)
   {
      bRangedStyle = FALSE;
   }
   else
   {
      bRangedStyle = (d100() <= nChanceOfRangedWeapon);
   }

   if (bRangedStyle)
   {
      //debugMsg(GetName(oCreature) + " is a ranged attacker.");
      SetLocalString(oCreature, VAR_BATTLE_STYLE, BATTLE_STYLE_RANGED);
      // primarily a ranged attacker
      oPrimary = getRangedWeapon(oCreature);
      if (oPrimary != OBJECT_INVALID)
      {
         AssignCommand(oCreature, ActionEquipItem(oPrimary,
            INVENTORY_SLOT_RIGHTHAND));

         int ii;
         for (ii = 0; ii <= GetHitDice(oCreature); ii += 10)
         {
            getRangedAmmo(oCreature, GetBaseItemType(oPrimary));
         }
      }

      // intelligence/wisdom check for backup melee weapon
      if (d20(2) <= GetAbilityScore(oCreature, ABILITY_INTELLIGENCE) +
         GetAbilityScore(oCreature, ABILITY_WISDOM))
      {
         //debugMsg(GetName(oCreature) + " is smart enough to have a backup weapon");
         // limit to offhand weapons, since it's not our primary offense
         object oBackup = getMeleeWeapon(oCreature, TRUE);
         SetPickpocketableFlag(oBackup, TRUE);
      }
   }
   else
   {
      //debugMsg(GetName(oCreature) + " is a melee attacker.");
      SetLocalString(oCreature, VAR_BATTLE_STYLE, BATTLE_STYLE_MELEE);
      // primarily a melee attacker
      oPrimary = getMeleeWeapon(oCreature, FALSE);
      AssignCommand(oCreature, ActionEquipItem(oPrimary,
         INVENTORY_SLOT_RIGHTHAND));

      if ((GetBaseItemType(oPrimary) == BASE_ITEM_DOUBLEAXE) ||
          (GetBaseItemType(oPrimary) == BASE_ITEM_TWOBLADEDSWORD) ||
          (GetBaseItemType(oPrimary) == BASE_ITEM_DIREMACE) ||
          (GetBaseItemType(oPrimary) == BASE_ITEM_QUARTERSTAFF)
         )
      {
         bTwoWeaponStyle = FALSE; // primary weapon works as offhand as well
         // ...but for AI purposes they are 2 weapon style
         SetLocalString(oCreature, VAR_BATTLE_STYLE, BATTLE_STYLE_2WEAPON);
      }

      if (bTwoWeaponStyle)
      {
         //debugMsg(GetName(oCreature) + " is a two weapon style attacker.");
         SetLocalString(oCreature, VAR_BATTLE_STYLE, BATTLE_STYLE_2WEAPON);
         object oOffhand = getMeleeWeapon(oCreature, TRUE);
         AssignCommand(oCreature, ActionEquipItem(oPrimary,
            INVENTORY_SLOT_LEFTHAND));
      }

      // intelligence/wisdom check for backup melee weapon
      if (d20(2) <= GetAbilityScore(oCreature, ABILITY_INTELLIGENCE) +
         GetAbilityScore(oCreature, ABILITY_WISDOM))
      {
         //debugMsg("Spawning backup weapon");
         // limit to offhand weapons, since it's not our primary offense
         object oBackup = getMeleeWeapon(oCreature, TRUE);
         SetPickpocketableFlag(oBackup, TRUE);
      }
   }

   return oPrimary;
}

object getMeleeWeapon(object oCreature, int bOffhand = FALSE)
{
   //debugVarObject("GetMeleeWeapon()", oCreature);
   //debugVarBoolean("bOffhand", bOffhand);

   string sSQL =
      "SELECT i.resref AS melee_weapon " +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id IN (";

   // consider using these types of weapon?
   int bGreatAxe = FALSE;
   int bBattleAxe = FALSE;
   int bHandAxe = FALSE;
   int bBastardSword = FALSE;
   int bDagger = FALSE;
   int bGreatSword = FALSE;
   int bLongSword = FALSE;
   int bRapier = FALSE;
   int bScimitar = FALSE;
   int bKatana = FALSE;
   int bShortSword = FALSE;
   int bClub = FALSE;
   int bLightFlail = FALSE;
   int bHeavyFlail = FALSE;
   int bLightHammer = FALSE;
   int bWarHammer = FALSE;
   int bLightMace = FALSE;
   int bMorningStar = FALSE;
   int b2BladeSword = FALSE;
   int bDoubleAxe = FALSE;
   int bQuarterstaff = FALSE;
   int bDireMace = FALSE;
   int bWhip = FALSE;
   int bKama = FALSE;
   int bKukri = FALSE;
   int bSickle = FALSE;
   int bScythe = FALSE;
   int bSpear = FALSE;
   int bHalberd = FALSE;
   int bDwarvenWaraxe = FALSE;
   int bTrident = FALSE;
   // CEP weapons
   int bHeavyPick = FALSE;
   int bLightPick = FALSE;
   int bSai = FALSE;
   int bNunchaku = FALSE;
   int bFalchion = FALSE;
   int bSap = FALSE;
   int bDaggerAssn = FALSE;
   int bKatar = FALSE;
   int bHeavyMace = FALSE;
   int bMaul = FALSE;
   int bMercurialLongsword = FALSE;
   int bMercurialGreatsword = FALSE;
   int bDoubleScimitar = FALSE;
   int bGoad = FALSE;
   int bMaugrimDoubleSword = FALSE;
   int bWindFireWheel = FALSE;

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC, oCreature))
   {
      bKatana = TRUE;
      bBastardSword = TRUE;
      b2BladeSword = TRUE;
      bDoubleAxe = TRUE;
      bDireMace = TRUE;
      bWhip = TRUE;
      bKama = TRUE;
      bKukri = TRUE;
      bSickle = TRUE;
      bScythe = TRUE;
      bDwarvenWaraxe = TRUE;
      bSai = TRUE;
      bNunchaku = TRUE;
      bMercurialLongsword = TRUE;
      bMercurialGreatsword = TRUE;
      bDoubleScimitar = TRUE;
      bWindFireWheel = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL, oCreature))
   {
      bGreatAxe = TRUE;
      bBattleAxe = TRUE;
      bHandAxe = TRUE;
      bBastardSword = TRUE;
      bGreatSword = TRUE;
      bLongSword = TRUE;
      bRapier = TRUE;
      bScimitar = TRUE;
      bShortSword = TRUE;
      bLightFlail = TRUE;
      bHeavyFlail = TRUE;
      bLightHammer = TRUE;
      bWarHammer = TRUE;
      bHalberd = TRUE;
      bHeavyPick = TRUE;
      bLightPick = TRUE;
      bFalchion = TRUE;
      bSap = TRUE;
      bMaul = TRUE;
      bGoad = TRUE;
      bMaugrimDoubleSword = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE, oCreature))
   {
      bClub = TRUE;
      bDagger = TRUE;
      bLightMace = TRUE;
      bMorningStar = TRUE;
      bQuarterstaff = TRUE;
      bSickle = TRUE;
      bSpear = TRUE;
      bTrident = TRUE;
      bDaggerAssn = TRUE;
      bKatar = TRUE;
      bLightMace = TRUE;
      bHeavyMace = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE, oCreature))
   {
      bClub = TRUE;
      bDagger = TRUE;
      bLightMace = TRUE;
      bMorningStar = TRUE;
      bQuarterstaff = TRUE;
      bRapier = TRUE;
      bShortSword = TRUE;
      bSap = TRUE;
      bDaggerAssn = TRUE;
      bKatar = TRUE;
      bLightMace = TRUE;
      bHeavyMace = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID, oCreature))
   {
      bClub = TRUE;
      bDagger = TRUE;
      bSickle = TRUE;
      bScimitar = TRUE;
      bSpear = TRUE;
      bQuarterstaff = TRUE;
      bTrident = TRUE; // Druids with tridents?  I think BioWare fucked this up
      bDaggerAssn = TRUE;
      bKatar = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK, oCreature))
   {
      bClub = TRUE;
      bDagger = TRUE;
      bHandAxe = TRUE;
      bKama = TRUE;
      bQuarterstaff = TRUE;
      bSai = TRUE;
      bNunchaku = TRUE;
      bDaggerAssn = TRUE;
      bKatar = TRUE;
      bWindFireWheel = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF, oCreature))
   {
      bLongSword = TRUE;
      bRapier = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD, oCreature))
   {
      bDagger = TRUE;
      bClub = TRUE;
      bQuarterstaff = TRUE;
      bDaggerAssn = TRUE;
      bKatar = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_FINESSE, oCreature) &&
       (GetAbilityScore(oCreature, ABILITY_DEXTERITY) >
        GetAbilityScore(oCreature, ABILITY_STRENGTH)
       )
      )
   {
      bGreatAxe = FALSE;
      bBattleAxe = FALSE;
      bBastardSword = FALSE;
      bGreatSword = FALSE;
      bLongSword = FALSE;
      bScimitar = FALSE;
      bKatana = FALSE;
      bClub = FALSE;
      bLightFlail = FALSE;
      bHeavyFlail = FALSE;
      bWarHammer = FALSE;
      bMorningStar = FALSE;
      b2BladeSword = FALSE;
      bDoubleAxe = FALSE;
      bQuarterstaff = FALSE;
      bDireMace = FALSE;
      bScythe = FALSE;
      bSpear = FALSE;
      bHalberd = FALSE;
      bDwarvenWaraxe = FALSE;
      bHeavyPick = FALSE;
      bFalchion = FALSE;
      bHeavyMace = FALSE;
      bMaul = FALSE;
      bMercurialLongsword = FALSE;
      bMercurialGreatsword = FALSE;
      bDoubleScimitar = FALSE;
      bMaugrimDoubleSword = FALSE;
   }

   if (GetCreatureSize(oCreature) < CREATURE_SIZE_MEDIUM)
   {
      bBastardSword = FALSE;
      b2BladeSword = FALSE;
      bDoubleAxe = FALSE;
      bDireMace = FALSE;
      bGreatAxe = FALSE;
      bGreatSword = FALSE;
      bHeavyFlail = FALSE;
      bHalberd = FALSE;
      bScythe = FALSE;
      bFalchion = FALSE;
      bMaul = FALSE;
      bMercurialGreatsword = FALSE;
      bDoubleScimitar = FALSE;
   }

   if (GetCreatureSize(oCreature) < CREATURE_SIZE_SMALL)
   {
      bBattleAxe = FALSE;
      bLongSword = FALSE;
      bScimitar = FALSE;
      bKatana = FALSE;
      bClub = FALSE;
      bLightFlail = FALSE;
      bHeavyFlail = FALSE;
      bWarHammer = FALSE;
      bMorningStar = FALSE;
      bQuarterstaff = FALSE;
      bSpear = FALSE;
      bDwarvenWaraxe = FALSE;
      bTrident = FALSE;
      bHeavyPick = FALSE;
      bHeavyMace = FALSE;
      bMercurialLongsword = FALSE;
      bMaugrimDoubleSword = FALSE;
   }

   if (GetCreatureSize(oCreature) < CREATURE_SIZE_TINY)
   {
      bHandAxe = FALSE;
      bRapier = FALSE;
      bShortSword = FALSE;
      bLightHammer = FALSE;
      bLightMace = FALSE;
      bSickle = FALSE;
      bLightPick = FALSE;
      bNunchaku = FALSE;
      bSap = FALSE;
      bGoad = FALSE;
   }

   if (bOffhand)
   {
      if (GetCreatureSize(oCreature) < CREATURE_SIZE_LARGE)
      {
         bBastardSword = FALSE;
         bGreatAxe = FALSE;
         bGreatSword = FALSE;
         bHeavyFlail = FALSE;
         bHalberd = FALSE;
         bScythe = FALSE;
         bFalchion = FALSE;
         bMaul = FALSE;
         bMercurialGreatsword = FALSE;
         bDoubleScimitar = FALSE;
      }
      if (GetCreatureSize(oCreature) < CREATURE_SIZE_MEDIUM)
      {
         bBattleAxe = FALSE;
         bLongSword = FALSE;
         bScimitar = FALSE;
         bKatana = FALSE;
         bClub = FALSE;
         bLightFlail = FALSE;
         bHeavyFlail = FALSE;
         bWarHammer = FALSE;
         bMorningStar = FALSE;
         bSpear = FALSE;
         bDwarvenWaraxe = FALSE;
         bTrident = FALSE;
         bHeavyPick = FALSE;
         bHeavyMace = FALSE;
         bMercurialLongsword = FALSE;
         bMaugrimDoubleSword = FALSE;
      }
      if (GetCreatureSize(oCreature) < CREATURE_SIZE_SMALL)
      {
         bHandAxe = FALSE;
         bRapier = FALSE;
         bShortSword = FALSE;
         bLightHammer = FALSE;
         bLightMace = FALSE;
         bSickle = FALSE;
         bLightPick = FALSE;
         bNunchaku = FALSE;
         bSap = FALSE;
         bGoad = FALSE;
      }
   }

   if (bBastardSword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",3");
   }

   if (bGreatAxe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",18");
   }

   if (bBattleAxe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",2");
   }

   if (bHandAxe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",38");
   }

   if (bDagger)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",22");
   }

   if (bGreatSword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",13");
   }

   if (bLongSword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",1");
   }

   if (bRapier)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",51");
   }

   if (bScimitar)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",53");
   }

   if (bKatana)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",41");
   }

   if (bShortSword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",0");
   }

   if (bClub)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",28");
   }

   if (bLightFlail)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",4");
   }

   if (bHeavyFlail)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",35");
   }

   if (bLightHammer)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",37");
   }

   if (bWarHammer)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",5");
   }

   if (bLightMace)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",9,312");
   }

   if (bMorningStar)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",47");
   }

   if (b2BladeSword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",12");
   }

   if (bDoubleAxe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",33");
   }

   if (bQuarterstaff)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",50");
   }

   if (bDireMace)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",32");
   }

   if (bWhip)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",111");
   }

   if (bKama)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",40");
   }

   if (bKukri)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",42,313");
   }

   if (bSickle)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",60");
   }

   if (bScythe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",55");
   }

   if (bSpear)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",58");
   }

   if (bHalberd)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",10");
   }

   if (bDwarvenWaraxe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",108");
   }

   if (bTrident)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",95,300");
   }

   if (bHeavyPick)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",301");
   }

   if (bLightPick)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",302");
   }

   if (bSai)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",303");
   }

   if (bNunchaku)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",304");
   }

   if (bFalchion)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",305,316");
   }

   if (bSap)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",308");
   }

   if (bDaggerAssn)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",309");
   }

   if (bKatar)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",310");
   }

   if (bHeavyMace)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",317");
   }

   if (bMaul)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",318");
   }

   if (bMercurialLongsword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",319");
   }

   if (bMercurialGreatsword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",320");
   }

   if (bDoubleScimitar)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",321");
   }

   if (bGoad)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",322");
   }

   if (bMaugrimDoubleSword)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",324");
   }

   if (bWindFireWheel)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",323");
   }

   // Try for preferred weapon(s) first
   string sResRef = chooseItem(oCreature, sSQL +
      GetLocalString(oCreature, VAR_PREFERRED_WEAPONS) + ") ");
   if (sResRef == "")
   {
      // No preferred found, go for allowed weapon(s)
      sResRef = chooseItem(oCreature, sSQL +
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) +
         ") AND i.base_item_id NOT IN (6,7,8,11,31,59,61,63) ");
   }

   object oWeapon = spawnItem(oCreature, sResRef);
   //debugVarObject("oWeapon", oWeapon);

   return oWeapon;
}

object getRangedWeapon(object oCreature)
{
   //debugVarObject("GetRangedWeapon()", oCreature);

   string sSQL =
      "SELECT i.resref AS ranged_weapon" +
      "  FROM nwn_items i " +
      " WHERE i.base_item_id IN (";

   // consider using these types of weapon?
   int bDart = FALSE;
   int bLightCrossbow = FALSE;
   int bHeavyCrossbow = FALSE;
   int bShortBow = FALSE;
   int bLongBow = FALSE;
   int bShuriken = FALSE;
   int bThrowingAxe = FALSE;
   int bSling = FALSE;

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC, oCreature))
   {
      bShuriken = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL, oCreature))
   {
      bShortBow = TRUE;
      bLongBow = TRUE;
      bThrowingAxe = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE, oCreature))
   {
      bDart = TRUE;
      bLightCrossbow = TRUE;
      bHeavyCrossbow = TRUE;
      bSling = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE, oCreature))
   {
      bDart = TRUE;
      bLightCrossbow = TRUE;
      bHeavyCrossbow = TRUE;
      bShortBow = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID, oCreature))
   {
      bDart = TRUE;
      bSling = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK, oCreature))
   {
      bShuriken = TRUE;
      bLightCrossbow = TRUE;
      bHeavyCrossbow = TRUE;
      bSling = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF, oCreature))
   {
      bShortBow = TRUE;
      bLongBow = TRUE;
   }

   if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD, oCreature))
   {
      bLightCrossbow = TRUE;
      bHeavyCrossbow = TRUE;
   }

   if (bDart)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",31");
   }

   if (bLightCrossbow)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",7");
   }

   if (bHeavyCrossbow)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",6");
   }

   if (bShortBow)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",11");
   }

   if (bLongBow)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",8");
   }

   if (bShuriken)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",59");
   }

   if (bThrowingAxe)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",63");
   }

   if (bSling)
   {
      SetLocalString(oCreature, VAR_ALLOWED_WEAPONS,
         GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ",61");
   }

   // Try for preferred weapon(s) first
   string sResRef = chooseItem(oCreature, sSQL +
      GetLocalString(oCreature, VAR_PREFERRED_WEAPONS) +
      ") AND i.base_item_id IN (6,7,8,11,31,59,61,63) ");
   if (sResRef == "")
   {
      // No preferred found, go for allowed weapon(s)
      sResRef = chooseItem(oCreature, sSQL + GetLocalString(oCreature, VAR_ALLOWED_WEAPONS) + ") ");
   }

   object oWeapon = spawnItem(oCreature, sResRef);
   //debugVarObject("oWeapon", oWeapon);

   return oWeapon;
}

object getRangedAmmo(object oCreature, int nWeaponBaseType)
{
   //debugMsg("GetRangedAmmo(" + IntToString(nWeaponBaseType) + ")");

   string sSQL =
      "SELECT i.resref AS ranged_ammo " +
      "  FROM nwn_items i " +
      " WHERE base_item_id = ";

   // all values must be multiplied by 100 to account for stacking
   switch (nWeaponBaseType)
   {
      case BASE_ITEM_DART:
         sSQL += "31";
         break;
      case BASE_ITEM_LIGHTCROSSBOW:
      case BASE_ITEM_HEAVYCROSSBOW:
         sSQL += "25";
         break;
      case BASE_ITEM_SHORTBOW:
      case BASE_ITEM_LONGBOW:
         sSQL += "20";
         break;
      case BASE_ITEM_SHURIKEN:
         sSQL += "59";
         break;
      case BASE_ITEM_THROWINGAXE:
         sSQL += "63";
         break;
      case BASE_ITEM_SLING:
         sSQL += "27";
         break;
      default:
         logError("ERROR: base weapon type " + IntToString(nWeaponBaseType) +
            " not recognized.");
         break;
   }

   string sResRef = chooseItem(oCreature, sSQL);
   int nStackSize = (nWeaponBaseType == BASE_ITEM_THROWINGAXE ? 40 : 90);
   object oAmmo = spawnItem(oCreature, sResRef, Random(nStackSize) + 10);
   //debugVarObject("oAmmo", oAmmo);

   return oAmmo;
}

// Returns the maximum value of an item that the creature can use
int getMaxGPValue(object obj)
{
   // @FIX there's probably a real formula for this
   int nMax = 999999999;
   switch(GetHitDice(obj))
   {
      case 0: nMax =      500; break;
      case 1: nMax =     1000; break;
      case 2: nMax =     1500; break;
      case 3: nMax =     2000; break;
      case 4: nMax =     2500; break;
      case 5: nMax =     3000; break;
      case 6: nMax =     4000; break;
      case 7: nMax =     5000; break;
      case 8: nMax =     6000; break;
      case 9: nMax =     8000; break;
      case 10: nMax =   10000; break;
      case 11: nMax =   13000; break;
      case 12: nMax =   16000; break;
      case 13: nMax =   20000; break;
      case 14: nMax =   26000; break;
      case 15: nMax =   32000; break;
      case 16: nMax =   40000; break;
      case 17: nMax =   52000; break;
      case 18: nMax =   64000; break;
      case 19: nMax =   80000; break;
      case 20: nMax =  104000; break;
      case 21: nMax =  128000; break;
      case 22: nMax =  150000; break;
      case 23: nMax =  200000; break;
      case 24: nMax =  256000; break;
      case 25: nMax =  300000; break;
      case 26: nMax =  375000; break;
      case 27: nMax =  450000; break;
      case 28: nMax =  512000; break;
      case 29: nMax =  650000; break;
      case 30: nMax =  850000; break;
      case 31: nMax = 1024000; break;
      case 32: nMax = 1300000; break;
      case 33: nMax = 1750000; break;
      case 34: nMax = 2048000; break;
      case 35: nMax = 2750000; break;
      case 36: nMax = 3250000; break;
      case 37: nMax = 4092000; break;
      case 38: nMax = 5000000; break;
      case 39: nMax = 6000000; break;
      case 40: nMax = 8184000; break;
      default: nMax = 9999999; break;
   }
   nMax = FloatToInt(MONTY_HAUL_FACTOR * nMax);
   //debugVarInt("Max GP Value", nMax);
   return nMax;
}

// Returns the minimum value of an item that the creature can use
int getMinGPValue(object obj)
{
   int nMin = (GetHitDice(obj) < 6 ? 0 : GetHitDice(obj) * 100);
   nMin = FloatToInt(MONTY_HAUL_FACTOR * nMin);
   //debugVarInt("Min GP Value", nMin);
   return nMin;
}

void setPreferredWeapon(object oCreature, int nWeaponType, int nScore)
{
   int nOldScore = GetLocalInt(oCreature, VAR_PREFERRED_SCORE);
   if (nScore == nOldScore)
   {
      SetLocalString(oCreature, VAR_PREFERRED_WEAPONS,
         GetLocalString(oCreature, VAR_PREFERRED_WEAPONS) + "," + IntToString(nWeaponType));
   }
   else if (nScore > nOldScore)
   {
      SetLocalString(oCreature, VAR_PREFERRED_WEAPONS,
         IntToString(nWeaponType));
      SetLocalInt(oCreature, VAR_PREFERRED_SCORE, nScore);
   }
}

//void main() { spawnItemsFor(OBJECT_SELF); } // compiling purposes
