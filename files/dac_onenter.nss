#include "inc_bindstone"
#include "inc_nbde"
#include "inc_travel"
#include "inc_persistworld"
#include "x3_inc_horse"
#include "inc_debug_dac"

void main()
{
   //debugVarObject("_mod_on_enter", OBJECT_SELF);

   ExecuteScript("prc_onenter", OBJECT_SELF);
   // x3_mod_def_enter contents
   ExecuteScript("x3_mod_pre_enter", OBJECT_SELF); // Override for other skin systems

   object oPC = GetEnteringObject();
   //debugVarObject("oPC", oPC);

   if (! GetIsPC(oPC)) return;

//   if (GetXP(oPC) == 0)
//   {
//      GiveXPToCreature(oPC, 1);
//      GiveGoldToCreature(oPC, 500);
//      CreateItemOnObject("dac_recallrune", oPC, 10);
//   }

   // Holy Symbols for those who need them.
   if (GetHasFeat(FEAT_TURN_UNDEAD, oPC) && GetDeity(oPC) != "")
   {
      if (GetItemPossessedBy(oPC, "dac_holysymbol") == OBJECT_INVALID)
      {
         object oHolySymbol = CreateItemOnObject("dac_holysymbol", oPC);
         SetName(oHolySymbol, "Holy Symbol of " + GetDeity(oPC));
      }
   }

   // Psionic Status for psionic characters.
   if (GetLocalInt(oPC, "PRC_PowerPoints") > 0)
   {
      if (GetItemPossessedBy(oPC, "dac_psi_status") == OBJECT_INVALID)
      {
         SendMessageToPC(oPC, "Use this to show your psionic status.");
         CreateItemOnObject("dac_psi_status", oPC);
      }
   }

   // OHS Henchman system
   if (GetItemPossessedBy(oPC, "dac_ohs_lbsummon") == OBJECT_INVALID)
   {
      CreateItemOnObject("dac_ohs_lbsummon", oPC);
   }
}
