//::///////////////////////////////////////////////
//:: Lliira' Aura: On Enter
//:: NW_S1_lliira_ent.nss
//:://////////////////////////////////////////////
/*
    gere l'entr dans la zone d'effet.
*/
//:://////////////////////////////////////////////
//:: Created By: Age
//:: Created On:January 2004
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"

void main()
{
//SpawnScriptDebugger();
    //Declare major variables
    effect eProt = EffectSavingThrowIncrease(SAVING_THROW_ALL,4,SAVING_THROW_TYPE_FEAR);
    effect eDur = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
    effect eLink = EffectLinkEffects(eProt, eDur);

    object oTarget = GetEnteringObject();
    //Faction Check
    if(GetIsFriend(oTarget, GetAreaOfEffectCreator()))
    {
        //SetLocalInt(oTarget, "Lliira" , 1);
        //Apply the VFX impact and effects
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget );
    }
}
