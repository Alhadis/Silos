#include "inc_enhanceitems"
void main()
{
   object oPC = GetPCSpeaker();
   SetLocalInt(oPC, VAR_ENHANCE_PROPERTY, ITEM_PROPERTY_LIGHT);
   SetLocalInt(oPC, VAR_ENHANCE_PARAM1, IP_CONST_LIGHTBRIGHTNESS_NORMAL);
   SetLocalInt(oPC, VAR_ENHANCE_PARAM2, IP_CONST_LIGHTCOLOR_WHITE);
}
