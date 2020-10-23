// Template for On Module Load event
#include "inc_persistworld"
#include "inc_lock"
#include "inc_trap"
#include "inc_doppelganger"
#include "inc_debug_dac"
#include "x2_inc_switches"
void main()
{
   //debugVarObject("_mod_on_load", OBJECT_SELF);

   ExecuteScript("prc_onmodload", OBJECT_SELF);

   /////////////////////////////////////////////////////////////////////////////
   // Persistent World settings
   // Item/Placeable setting overrides Area setting, which overrides Module setting

   // Respawn placeables, relock & retrap doors after this many rounds
   SetLocalInt(GetModule(), VAR_RESPAWN_TIME, 10);
   // Spawn placeable guardians this percent of the time
   SetLocalInt(GetModule(), VAR_GUARD_CHANCE, 10);
   // Lock and/or trap doors and containers this percent of the time
   SetLocalInt(GetModule(), VAR_LOCK_CHANCE, 50);
   SetLocalInt(GetModule(), VAR_TRAP_CHANCE, 25);
   // How often to save PC data?
   SetLocalInt(GetModule(), VAR_PC_SAVE_DELAY, 300); // seconds
   // What percent of "helpless captives" are actually doppelgangers?
   SetLocalInt(GetModule(), VAR_DOPPELGANGER_CHANCE, 5);
   /////////////////////////////////////////////////////////////////////////////

   // Use custom Soulknife "Shape Mindblade" feat -- see psi_sk_shmbld.nss
   SetLocalInt(GetModule(), "SOULKNIFE_CUSTOM_MINDBLADE_SHAPES", 1);

   // Standard On Module Load event
   ExecuteScript("x2_mod_def_load", OBJECT_SELF);
   // Respawnable traps
   ExecuteScript("trap_on_load", OBJECT_SELF);
}
