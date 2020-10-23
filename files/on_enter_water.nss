#include "inc_pheno"
#include "inc_underwater"
void main()
{
   object oCreature = GetEnteringObject();
   if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
   {
      // take a deep breath before plunging in
      takeDeepBreath(oCreature);
      setPhenoFly(oCreature, PHENO_SWITCH_FLY);
   }
   ExecuteScript("on_enter_area", OBJECT_SELF);
}
