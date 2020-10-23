#include "pwfse_inc"


void main()
{
object oTarget = GetEnteringObject();

  if(GetIsPC(oTarget))
  {
//    ExecuteScript("lts_emitter_oae", OBJECT_SELF);

    // only PC in the area ?
       if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,GetFirstObjectInArea(OBJECT_SELF),2) == OBJECT_INVALID)
      // yes , thus, area was empty before
      // activate spawns
      // SendMessageToPC(GetFirstPC(),"Reactivate all spawns");
      PWFSE_ActivateAllSpawnsInArea(OBJECT_SELF);

  }



     // visuelle effekte, leuchten und so:
     effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
     effect eDur = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
     effect eAntiMag = EffectSpellFailure(16);
     effect eSup = SupernaturalEffect(eAntiMag);

     ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSup, oTarget);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oTarget);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDur, oTarget);

 }

