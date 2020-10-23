//:://////////////////////////////////////////////
//:: Created By: Joseph
//:: Created On: Apr 11, 2003
//:://////////////////////////////////////////////
/* Notes:
 Description: Allows an area to damage any players in it.  A timer using a
              local variable (int_dmgTimer) is used to count to a specific
              time (intTimerUp); at this time the player will be damaged.
 This script: dam_area_onenter
 Additional Script(s): dam_arxx_onenter
 Place This Script: OnEnter Event for Area
 Comments: This script can be reused for all areas using the area wide damage
           system.
*/
void main() {
 object oPC = GetEnteringObject();
 if (GetIsPC(oPC))
  SetLocalInt(oPC,"int_dmgTimer", 0);
}

