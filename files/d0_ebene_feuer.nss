#include "pwfse_inc"
void ApplyDamage(object oPC, string sArea, int iDamage, int iDamageType, int iVis=-1)
{
int iAussehen = GetAppearanceType(oPC); // Aktuelles Spieleraussehen

if(GetResRef(GetArea(oPC)) == sArea)
{
// Hier statt 123 und 234 die Nummern des Feuerelementars und Älteren Feuerelementars einsetzen
   if ( GetItemPossessedBy(oPC, "sm_rpzPlanTol") != OBJECT_INVALID )
   {effect eVis= EffectVisualEffect(VFX_DUR_AURA_RED );
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oPC, 8.0);
       }
  else

if(iAussehen != 60 && iAussehen != 61)
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectLinkEffects(EffectDamage(iDamage, iDamageType), EffectVisualEffect(iVis)), oPC);

DelayCommand(7.5, ApplyDamage(oPC, sArea, iDamage, iDamageType));
}
}

void main()
{
object oPC = GetEnteringObject();
if(GetIsPC(oPC))
{
ApplyDamage(oPC, GetResRef(GetArea(oPC)), 10, DAMAGE_TYPE_FIRE, VFX_IMP_FLAME_S);

if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, GetFirstObjectInArea(OBJECT_SELF),2) == OBJECT_INVALID)
PWFSE_ActivateAllSpawnsInArea(OBJECT_SELF);
}
}
