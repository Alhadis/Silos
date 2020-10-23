#include "inc_d20"
// Harm's Way

void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    if (GetIsPC(oTarget) || (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE))
    {
        FloatingTextStringOnCreature(GetName(oPC)+" gets in harms way for "+GetName(oTarget)+".",oPC);
    }
    else
    {
        SendMessageToPC(oPC, "Target must be a creature.");
        return;
    }
    if (GetIsPC(oTarget))
    {
        SendMessageToPC(oTarget, "Harms Way activated on you by "+GetName(oPC)+".");
    }
    int nRoll = GetLocalInt(oTarget, "nd20_Hurt");
    int nLoss = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
    if (nLoss < nRoll)
        nRoll = nLoss;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nRoll), oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nRoll), oPC);
}
