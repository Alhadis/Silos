#include "seed_enc_inc"

void main() {
   if (!GetEncounterActive(OBJECT_SELF)) return;
   if (GetLocalInt(OBJECT_SELF, "SpawnOK")!=0) return; // WAITING FOR ENCOUNTER RESET TIMER
   object oMinion;
   object oPC=GetEnteringObject();
   object oLocator;
   object oItem;
   object oTarget;
   itemproperty ipAdd;
   location lSpawn;
   effect eEffect;
   int i;
   int j;
   int k;
   float l;
   string sRef;
   int PartyCnt;
   int nChance;

   string sWhich=GetTag(OBJECT_SELF);
   if (sWhich=="ENC_DUERGAR_BOSS") {
      if (!OkToSpawn(250, oPC, 25)) return;
      oLocator = GetObjectByTag("WP_DUERGAR_THRONE");
   } else {
      if (!OkToSpawn(500, oPC, 25)) return;
      oLocator = OBJECT_SELF;
   }
   oMinion = SpawnBoss("duergarking", oLocator);
   oItem = DropEquippedItem(oMinion, 100, INVENTORY_SLOT_RIGHTHAND);
   AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyVisualEffect(ITEM_VISUAL_COLD), oItem);
   AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyKeen(), oItem);
   AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGEBONUS_2d8), oItem);
   AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(PickOneInt(IP_CONST_DAMAGETYPE_MAGICAL, IP_CONST_DAMAGETYPE_DIVINE), IP_CONST_DAMAGEBONUS_2d8), oItem);
   AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyOnHitProps(IP_CONST_ONHIT_DAZE, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_ONHIT_DURATION_50_PERCENT_2_ROUNDS), oItem);
   SetName(oItem, "Hammer of Sveinn the Duergar King");
   CreateItemOnObject("starsapphire", oMinion, 3);
   if (sWhich=="ENC_DUERGAR_BOSS") {
      AssignCommand(oMinion, ActionMoveToObject(oLocator));
      AssignCommand(oMinion, ActionSit(oLocator));
      SRM_RandomTreasure(TREASURE_LOW, oPC, oLocator);
      if (d2()==1) CreateItemOnObject("starsapphire", oLocator, 3);
      if (d2()==1) CreateItemOnObject("perfectruby", oLocator, 3);
      SRM_RandomTreasure(TREASURE_LOW, oPC, oLocator);

      oMinion = SpawnBoss("deathstone", oLocator);
      CreateItemOnObject("perfectruby", oMinion, 3);
      SRM_RandomTreasure(TREASURE_LOW, oPC, oMinion);
   }

   // FLAG THE ENCOUNTER AS SPAWNED
   SetLocalInt(OBJECT_SELF, "SpawnOK", 1); // FLAG AS ACTIVE, RESET BY TIMER IN EXHAUSTED TRIGGER

}
