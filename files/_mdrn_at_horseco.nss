#include "inc_d20"
void main()
{
    object oPC = GetPCSpeaker();
    int nMode = GetLocalInt(oPC, "nMdrnRideCover");
    if (nMode == 0)
    {
        int nSkill = GetSkillRank(SKILL_RIDE, oPC);
        int nDC = 15;
        int nRoll = d20();

        SendMessageToPC(oPC, "Ride check: "+IntToString(nRoll+nSkill)+" vs. DC: "+IntToString(nDC));
            if (nSkill+nRoll+1 > nDC)
            {
                SetLocalInt(oPC, "nMdrnRideCover", 1);
                AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectACIncrease(4, AC_SHIELD_ENCHANTMENT_BONUS), oPC));
                AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 2), oPC));
                AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(20), oPC));

                FloatingTextStringOnCreature("Taking cover in saddle.", oPC, TRUE);

            }

            else
            {
                SendMessageToPC(oPC, "Cover check failed.");
            }

     }
     else
     {
        FloatingTextStringOnCreature("No longer taking cover in saddle.", oPC, TRUE);
        effect eEff = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEff))
        {
            if (GetEffectType(eEff)==EFFECT_TYPE_ATTACK_DECREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            if (GetEffectType(eEff)==EFFECT_TYPE_AC_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            if (GetEffectType(eEff)==EFFECT_TYPE_SAVING_THROW_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            eEff = GetNextEffect(oPC);
        }
        SetLocalInt(oPC, "nMdrnRideCover", 0);
     }

}
