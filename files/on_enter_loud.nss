#include "inc_debug_dac"
void main()
{
   //debugVarObject("on_enter_loud", OBJECT_SELF);

   object oPC = GetEnteringObject();

   if (GetIsPC(oPC) && ! GetLocalInt(oPC, "IS_JUMPING"))
   {
      SendMessageToPC(oPC, "The sound of running water makes it harder to hear.");
   }

   ExecuteScript("on_enter_area", OBJECT_SELF);
}

