#include "inc_debug_dac"
void main()
{
   //debugVarObject("on_enter_ruins", OBJECT_SELF);

   object oPC = GetEnteringObject();

   if (GetIsPC(oPC) && ! GetLocalInt(oPC, "IS_JUMPING"))
   {
      SendMessageToPC(oPC, "The stone walls seem to echo every tiny sound.");
   }

   ExecuteScript("on_enter_area", OBJECT_SELF);
}

