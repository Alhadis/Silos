#include "pwfse_inc"

void main()
{
  object oEnter = GetEnteringObject();

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
  }


 {
     object oArea = GetArea(OBJECT_SELF);
     object oPCs = GetFirstPC();
     int iPCCount = 0;
     while(GetIsObjectValid(oPCs))
     {
         if(GetArea(oPCs) == oArea)
         {

             if(GetTag(GetItemInSlot(INVENTORY_SLOT_HEAD,oPCs)) == "MP_HELMOHNEAUA")
             {
                 // SendMessageToPC(oPCs,"Helm An. Vis. Effekt");
                 effect eVis = EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY);
                 ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oPCs,6.5f);
             }
             else
             {

                effect eAua = EffectDamage(30,DAMAGE_TYPE_DIVINE,DAMAGE_POWER_ENERGY);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eAua,oPCs);
             }
             // SendMessageToPC(oPCs,"PCCount: " + IntToString(iPCCount));
             iPCCount++;

             effect eLangsam = EffectSlow();
             ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLangsam,oPCs,7.0f);
         }

         oPCs = GetNextPC();
     }
     if(iPCCount == 0) DestroyObject(OBJECT_SELF);
 }
}
