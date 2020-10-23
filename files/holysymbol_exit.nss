// On Exit event for Holy Symbol aura (see items dac_holysymbol*)
#include "inc_debug_dac"
void main()
{
   //debugVarObject("holysymbol_exit", OBJECT_SELF);

   object oMonster = GetEnteringObject();
   //debugVarObject("oMonster", oMonster);

   effect eEffect = GetFirstEffect(oMonster);
   while (GetIsEffectValid(eEffect))
   {
      if (GetEffectType(eEffect) == EFFECT_TYPE_TURN_RESISTANCE_DECREASE &&
         GetEffectSubType(eEffect) == SUBTYPE_SUPERNATURAL &&
         GetEffectDurationType(eEffect) == DURATION_TYPE_TEMPORARY)
      {
         RemoveEffect(oMonster, eEffect);
         FloatingTextStringOnCreature("No longer affected by holy symbol",
            oMonster, FALSE);
         return;
      }
      eEffect = GetNextEffect(oMonster);
   }
}
