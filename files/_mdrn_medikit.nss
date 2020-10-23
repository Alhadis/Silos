// Medical Kit rules
#include "inc_d20"
void main()
{
    object oPC = GetItemActivator();
    object oTarg = GetItemActivatedTarget();
    int nDC = 15;
    int nHP = GetCurrentHitPoints(oTarg);
    int nRoll = d20();
    int nSkill = GetSkillRank(SKILL_HEAL, oPC);
    SendMessageToPC(oPC, "Skill roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" vs. DC 15.");
    if (GetIsObjectValid(oTarg)==FALSE)
    {
        SendMessageToPC(oPC, "Valid target required.");
        return;

    }
    FloatingTextStringOnCreature(GetName(oPC)+" uses a medical kit on "+GetName(oTarg), oPC, FALSE);
    if (nRoll+nSkill < nDC)
    {
        SendMessageToPC(oPC, "Skill attempt failed.");
        return;

    }


    if (nHP > 0)
    {
        // Fix dazed or stunned victim
        int nTestStun = 0;
        effect eRem = GetFirstEffect(oTarg);
        int nType = GetEffectType(eRem);
        while (GetIsEffectValid(eRem) && nTestStun == 0)
        {
            if (nType==EFFECT_TYPE_DAZED || nType == EFFECT_TYPE_STUNNED)
            {
                RemoveEffect(oPC, eRem);
                nTestStun = 1;
                SendMessageToPC(oPC, "Fixed target's condition.");
            }
            if (nType==EFFECT_TYPE_POISON)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSavingThrowIncrease(SAVING_THROW_FORT, nSkill, SAVING_THROW_TYPE_POISON), oTarg, 60.0);
                nTestStun = 1;
                SendMessageToPC(oPC, "Helped target with poisoning.");
            }
            if (nType==EFFECT_TYPE_DISEASE)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSavingThrowIncrease(SAVING_THROW_FORT, nSkill, SAVING_THROW_TYPE_DISEASE), oTarg, 300.0);
                nTestStun = 1;
                SendMessageToPC(oPC, "Helped target with a disease.");
            }
            eRem = GetNextEffect(oTarg);
            nType = GetEffectType(eRem);
        }

        if (nTestStun == 0)
        {
            // Trying to heal
            if (GetLocalInt(oTarg, "nMdrnHealHP")==0)
            {
                 ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(d4()+GetHasFeat(FEAT_EXPERTHEALER, oPC)*GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC)), oTarg);
                 SetLocalInt(oTarg, "nMdrnHealHP", 1);
                 SendMessageToPC(oPC, "Healing target.");

            }
            else
            {
                SendMessageToPC(oPC, "Target has already received healing today.");

                return;

            }


        }
    }
    else
    {
        if (nHP == 0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(1), oTarg);
            SendMessageToPC(oPC, "Reviving unconscious target.");

        }
        else
        {
            if (nHP > -10)
            {
                SendMessageToPC(oPC, "Saving dying target.");
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(0 - nHP), oTarg);
            }
            else if (GetLocalInt(oTarg, "nMdrnNPCDeath")==1)
            {
                SendMessageToPC(oPC, "Saving dying target.");
                int nHealed = 1-GetCurrentHitPoints(oTarg);
                if (nHealed < 0)
                nHealed = 0;
                effect eHeal = EffectHeal(nHealed);
                effect eRaise = EffectResurrection();
                 ApplyEffectToObject(DURATION_TYPE_INSTANT, eRaise, oTarg);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarg);
            }
            else

            SendMessageToPC(oPC, "You cannot revive a dead character with a first aid kit.");
        }
    }

}
