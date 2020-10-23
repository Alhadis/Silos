// For an encounter of a unique individual, this prevents multiple
// instances of that individual in the same area.
// Not recommended for Areas, only Encounters.
#include "inc_debug_dac"
void main()
{
   //debugVarObject("on_enter_unique", OBJECT_SELF);
   object oNew = GetEnteringObject();
   if (GetIsPC(oNew) || GetIsDM(oNew)) return;
   if (! GetIsEncounterCreature(oNew)) return;

   object oExisting = GetNearestObjectByTag(GetTag(oNew));
   if (oExisting != OBJECT_INVALID)
   {
      //debug(GetName(oExisting) + " already exists");
      if (! GetIsDMPossessed(oNew))
      {
         //debug("Destroying new duplicate of " + GetName(oNew));
         DestroyObject(oNew);
      }
      else if (! GetIsDMPossessed(oExisting))
      {
         //debug("Destroying existing duplicate of " + GetName(oExisting));
         DestroyObject(oExisting);
      }
      else
      {
         //debug("All unique individuals are DM possessed.  Keeping all.");
      }
   }
}
