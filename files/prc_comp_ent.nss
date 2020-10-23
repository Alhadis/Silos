#include "prc_alterations"
void main()
{
    if (GetIsPC(GetEnteringObject()))
    {
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
    object oWP = GetWaypointByTag("prc_compassion");
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    object oCreature = CreateObject(OBJECT_TYPE_CREATURE, "PRC_Compassion", GetLocation(oWP));

    AssignCommand(GetEnteringObject(), SpeakString("Here stands a manifestion of my compassion, wise and good."));
    }
}
