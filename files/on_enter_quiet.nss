#include "inc_debug_dac"
void main()
{
   //debugVarObject("on_enter_quiet", OBJECT_SELF);

   object oPC = GetEnteringObject();

   if (GetIsPC(oPC) && ! GetLocalInt(oPC, "IS_JUMPING"))
   {
      SendMessageToPC(oPC, "A thin layer of moss tends to muffle sound here.");
   }

   ExecuteScript("on_enter_area", OBJECT_SELF);
}

