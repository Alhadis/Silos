#include "prc_alterations"
void main()
{
    if (GetIsPC(GetEnteringObject()))
    {

    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
    object oWP = GetWaypointByTag("prc_temptation");
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    object oCreature = CreateObject(OBJECT_TYPE_CREATURE, "PRC_Temptation", GetLocation(oWP));

    AssignCommand(GetEnteringObject(), SpeakString("Here stands all the temptations of my life, that which has brought me low."));
    }
}

