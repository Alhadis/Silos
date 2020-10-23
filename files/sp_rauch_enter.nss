#include "pwfse_inc"

void UnterwasserSchaden(object oTarget, string sAreaResRef)
{
   string sResRef = GetResRef(GetArea(oTarget));

  if(GetTag(GetItemInSlot(INVENTORY_SLOT_HEAD,oTarget)) == "wz_atemmaske")
   {
       effect eVis = EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY);
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
   }
   else
   if ( GetItemPossessedBy(oTarget, "sm_rpzPlanTol") != OBJECT_INVALID )
   {effect eVis= EffectVisualEffect(VFX_DUR_AURA_WHITE );
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
       }
    else
     if ( GetItemPossessedBy(oTarget, "ky_luftflasche") != OBJECT_INVALID )
   {effect eVis= EffectVisualEffect(VFX_DUR_BUBBLES);
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
       }
   else

   if     (GetAppearanceType(oTarget)==(APPEARANCE_TYPE_ELEMENTAL_FIRE_ELDER))
    {   effect eVis = EffectVisualEffect(VFX_DUR_AURA_PULSE_YELLOW_ORANGE);
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
       }
   else
   if     (GetAppearanceType(oTarget)==(APPEARANCE_TYPE_ELEMENTAL_FIRE))
    {   effect eVis = EffectVisualEffect(VFX_DUR_AURA_PULSE_YELLOW_ORANGE);
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);}
       else
  if     (GetAppearanceType(oTarget)==(APPEARANCE_TYPE_ELEMENTAL_AIR_ELDER))
    {   effect eVis = EffectVisualEffect(VFX_DUR_AURA_WHITE );
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
       }
   else
   if     (GetAppearanceType(oTarget)==(APPEARANCE_TYPE_ELEMENTAL_AIR))
    {   effect eVis = EffectVisualEffect(VFX_DUR_AURA_WHITE );
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
       }

   else
   {
       effect eDam  = EffectDamage(30, DAMAGE_TYPE_DIVINE, DAMAGE_POWER_ENERGY);
       ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oTarget);
   }

   if(sResRef == sAreaResRef)
   DelayCommand(6.0, UnterwasserSchaden(oTarget, sAreaResRef));
}

void main()
{
  object oEnter = GetEnteringObject();
  object oArea  = GetArea(oEnter);
  if(GetIsPC(oEnter))
  {
//    ExecuteScript("lts_emitter_oae", OBJECT_SELF);

    // only PC in the area ?
    if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,GetFirstObjectInArea(OBJECT_SELF),2) == OBJECT_INVALID)
    {
      // yes , thus, area was empty before
      // activate spawns
      // SendMessageToPC(GetFirstPC(),"Reactivate all spawns");
      PWFSE_ActivateAllSpawnsInArea(OBJECT_SELF);
    }

    UnterwasserSchaden(oEnter, GetResRef(oArea));
  }
}


