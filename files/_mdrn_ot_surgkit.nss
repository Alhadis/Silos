// Surgery Kit rules
#include "inc_d20"
void main()
{
    object oPC = GetItemActivator();
    object oTarg = GetItemActivatedTarget();
    int nDC = 20;
    if (GetHasFeat(FEAT_SURGERY, oPC)==FALSE)
        nDC = 24;
    int nHP = GetCurrentHitPoints(oTarg);
    int nRoll = d20();
    int nSkill = GetSkillRank(SKILL_HEAL, oPC);
    SendMessageToPC(oPC, "Skill roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" vs. DC: "+IntToString(nDC));

    if (GetIsObjectValid(oTarg)==FALSE)
    {
        SendMessageToPC(oPC, "Valid target required.");
        return;

    }
    FloatingTextStringOnCreature(GetName(oPC)+" attempts Surgery on "+GetName(oTarg), oPC, FALSE);

   if (nRoll+nSkill < nDC)
    {
        SendMessageToPC(oPC, "Skill attempt failed.");
        return;

    }


            // Trying to do surgery
            if (GetLocalInt(oTarg, "nMdrnSurgery")==0)
            {
                 if (nRoll+nSkill+1 > nDC)
                 {
                    SendMessageToPC(oPC, "Attempt successful.");
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(d6(GetHitDice(oTarg))+GetHasFeat(FEAT_EXPERTHEALER, oPC)*GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC)), oTarg);
                    SetLocalInt(oTarg, "nMdrnSurgery", 1);
                    float fDur = 3600.0*(24.0 -(nRoll + nSkill - nDC)*2.0);
                    // Negative effects of surgery; based on how much is healed
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityDecrease(ABILITY_STRENGTH, 2), oTarg, fDur);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityDecrease(ABILITY_DEXTERITY, 2), oTarg, fDur);
                 }
                 else
                 {
                    SendMessageToPC(oPC, "Attempt failed.");
                    return;

                 }

            }
            else
            {
                SendMessageToPC(oPC, "Target has already undergone surgery today.");

                return;

            }





}
