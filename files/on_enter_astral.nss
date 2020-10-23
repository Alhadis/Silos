#include "zep_inc_phenos"
#include "inc_debug_dac"
void main()
{
   //debugVarObject("on_enter_astral", OBJECT_SELF);
   object oCreature = GetEnteringObject();
   int nIntScore = GetAbilityScore(oCreature, ABILITY_INTELLIGENCE, FALSE);
   float fMoveRate = nIntScore * 1.6 / 3;

   zep_Fly(oCreature, nCEP_WG_NONE, fMoveRate);
}