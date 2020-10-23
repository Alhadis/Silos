// On Enter event for Holy Symbol aura (see items dac_holysymbol*)
#include "inc_debug_dac"
void main()
{
   //debugVarObject("holysymbol_enter", OBJECT_SELF);

   object oMonster = GetEnteringObject();
   //debugVarObject("oMonster", oMonster);

   effect eTurnMe = SupernaturalEffect(EffectTurnResistanceDecrease(2));
   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTurnMe, OBJECT_SELF, 3600.0f);
   FloatingTextStringOnCreature("Affected by holy symbol", oMonster, FALSE);
}
