#include "inc_d20"
// Delay Damage

void main()
{
    object oPC = OBJECT_SELF;
    int nRoll = 20;
    float fDur = 6.0*GetLevelByClass(CLASS_TYPE_DAREDEVIL, oPC);
    int nHP = GetCurrentHitPoints(oPC);
    int nHPMax = GetMaxHitPoints(oPC);
    int nLoss = nHPMax - nHP;
    if (nLoss < nRoll)
        nRoll = nLoss;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nRoll), oPC);
    DelayCommand(fDur, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nRoll), oPC));


}
