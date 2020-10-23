#include "inc_d20"
// Harm's Way

void main()
{
    object oPC = OBJECT_SELF;
    object oTarg = GetSpellTargetObject();
    int nRoll = GetLocalInt(oTarg, "nd20_Hurt");
    if (GetIsPC(oTarg))
    {
        SendMessageToPC(oPC, "Target cannot be a PC.");
        return;
    }


    int nHP = GetCurrentHitPoints(oTarg);
    int nHPMax = GetMaxHitPoints(oTarg);
    int nLoss = nHPMax - nHP;
    if (nLoss < nRoll)
        nRoll = nLoss;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nRoll), oTarg);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nRoll), oPC);


}
