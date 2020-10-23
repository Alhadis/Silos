#include "inc_d20"
void main()
{
    object oPC = GetPCSpeaker();
    int nSkill = GetSkillRank(SKILL_ESCAPE_ARTIST, oPC);
    int nDC = 30;
    int nRoll = d20();
    SendMessageToPC(oPC, "Escape Artist roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nSkill+nRoll)+" vs. DC: "+IntToString(nDC));
        if (nRoll+nSkill>nDC-1)
        {

             effect eEff = GetFirstEffect(oPC);
             int nEff = GetEffectType(eEff);
             while (GetIsEffectValid(eEff))
             {
                if (nEff==EFFECT_TYPE_ENTANGLE || nEff==EFFECT_TYPE_PARALYZE || nEff == EFFECT_TYPE_SLOW)
                    if (GetEffectDurationType(eEff)==DURATION_TYPE_TEMPORARY)
                        RemoveEffect(oPC, eEff);

                eEff = GetNextEffect(oPC);
             }

        }
}
