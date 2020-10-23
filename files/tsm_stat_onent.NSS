
#include "x0_i0_anims"

#include "x2_inc_switches"

void main()
{
    string sTag = GetLocalString(OBJECT_SELF, "sTag");	
    
    object nPC = GetEnteringObject();
    if(GetTag(GetEnteringObject()) == sTag)
  {
    //object oTarget;
    //oTarget = OBJECT_SELF;
    effect eEffect;
   
    //AssignCommand(nPC, ActionAttack(GetNearestObjectByTag(sTagAttack)));

    
    eEffect = EffectPetrify();

    eEffect = SupernaturalEffect(eEffect);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, nPC);
    
    eEffect = EffectVisualEffect(600, FALSE);

    eEffect = SupernaturalEffect(eEffect);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, nPC);
    
   
    int nInt;
    nInt = GetObjectType(nPC);

    if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELL_STONESKIN), nPC);
    else ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELL_STONESKIN), GetLocation(nPC));

    
    

   

    
    SetPlotFlag(nPC, TRUE);
    // Make the caller plot. (Immortal)
}
}