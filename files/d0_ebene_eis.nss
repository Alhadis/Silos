#include "pwfse_inc"
void ApplyDamage(object oPC, string sArea, int iDamage, int iDamageType, int iVis=-1)
{
    if(GetResRef(GetArea(oPC)) == sArea)
    {
    if ( GetItemPossessedBy(oPC, "sm_rpzPlanTol") != OBJECT_INVALID )
   {effect eVis= EffectVisualEffect(VFX_DUR_AURA_BLUE );
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oPC, 8.0);
       }
  else

       { ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectLinkEffects(EffectDamage(iDamage, iDamageType), EffectVisualEffect(iVis)), oPC);
        DelayCommand(7.5, ApplyDamage(oPC, sArea, iDamage, iDamageType));
    } }
}
void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC))
    {
        ApplyDamage(oPC, GetResRef(GetArea(oPC)), 10, DAMAGE_TYPE_COLD, VFX_COM_HIT_FROST);

        if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,GetFirstObjectInArea(OBJECT_SELF),2) == OBJECT_INVALID)
        PWFSE_ActivateAllSpawnsInArea(OBJECT_SELF);
    }
}
