#include "inc_atlas"
#include "inc_lock"
#include "inc_trap"
#include "inc_persistworld"
#include "inc_horse"
#include "inc_debug_dac"
void main()
{
   //debugVarObject("on_enter_area", OBJECT_SELF);

   object oPC = GetEnteringObject();
   if (! GetIsPC(oPC)) return;

   // Some areas are just known to the PC
   if (GetLocalInt(OBJECT_SELF, VAR_AREA_SHOWMAP) == 1)
   {
      ExploreAreaForPlayer(GetArea(oPC), oPC, TRUE);
   }
   if (GetLocalInt(OBJECT_SELF, VAR_AREA_SHOWMAP) == -1)
   {
      ExploreAreaForPlayer(GetArea(oPC), oPC, FALSE);
   }
   else
   {
      // Use your atlas to explore the area, if you have the map
      useAtlas(oPC);
   }

   // PrC's implementation of the Jump skill causes an exit/entry of area,
   // which causes everything to be retrapped and relocked.  Avoid this.
   // See prc_inc_skills.nss and anything that calls PerformJump().
   // @FIX: for multi-player parties, this will overlock and overtrap the area.
   int bIsJumping = GetLocalInt(oPC, "IS_JUMPING");
   DeleteLocalInt(oPC, "IS_JUMPING");

   if (! bIsJumping)
   {
      // Randomly lock doors and placeables
      randomLockArea();

      // Randomly trap doors and placeables
      randomTrapArea();
   }

   if (GetIsAreaAboveGround(GetArea(oPC)) == AREA_UNDERGROUND)
   {
      horseDismount(oPC);
   }

   setLastKnownLocation(oPC);
   SendMessageToPC(oPC, "Entering " + GetName(GetArea(oPC)) + ".");
}
