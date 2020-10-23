#include "pwfse_inc"

void Schlammkrankheit(object oTarget, string sAreaResRef)
{
   string sResRef = GetResRef(GetArea(oTarget));

   if ( GetItemPossessedBy(oTarget, "sm_rpzPlanTol") != OBJECT_INVALID )
   {effect eVis= EffectVisualEffect(VFX_DUR_AURA_GREEN );
       ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarget, 8.0);
       }
   else

{
int krankheit=Random(16);
string zahl=IntToString(krankheit);
//SendMessageToPC(oTarget, zahl);
effect eDis=EffectDisease(krankheit);
//eDis=SupernaturalEffect(eDis);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eDis,oTarget);



//int zufall=Random(2);
//string zahl=IntToString(zufall);
//effect eDis0  = EffectDisease(DISEASE_BLINDING_SICKNESS);
//eDis0 = SupernaturalEffect(eDis0);
//effect eDis1  = EffectDisease(DISEASE_MUMMY_ROT);
//eDis1 = SupernaturalEffect(eDis1);
//effect eDis2  = EffectDisease(DISEASE_SOLDIER_SHAKES);
//eDis2 = SupernaturalEffect(eDis2);

//switch(zufall)
//{case 0:
//   ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eDis0,oTarget);

//   SendMessageToPC(oTarget, zahl);
//    break;
//    case 1:
//  ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDis1,oTarget);
//  SendMessageToPC(oTarget, zahl);
//    break;
//   case 2:
//   ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDis2,oTarget);
//   SendMessageToPC(oTarget, zahl);
//    break;
//}
    }




   if(sResRef == sAreaResRef)
   DelayCommand(10.0, Schlammkrankheit(oTarget, sAreaResRef));
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

    Schlammkrankheit(oEnter, GetResRef(oArea));
  }
}


