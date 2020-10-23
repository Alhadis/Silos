// First Aid Kit rules

void main()
{
    object oPC = GetItemActivator();
    object oTarg = GetItemActivatedTarget();
    int nDC = 15;
    int nHP = GetCurrentHitPoints(oTarg);
    int nRoll = d20();
    int nSkill = GetSkillRank(SKILL_HEAL, oPC);

    if (GetIsObjectValid(oTarg)==FALSE)
    {
        SendMessageToPC(oPC, "Valid target required.");
        return;

    }
    FloatingTextStringOnCreature(GetName(oPC)+" uses a first aid kit on "+GetName(oTarg), oPC, FALSE);
    SendMessageToPC(oPC, "Skill roll: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" vs. DC 15.");
    if (nRoll+nSkill < nDC)
    {
        SendMessageToPC(oPC, "Skill attempt failed.");
        return;

    }
    if (nHP > 0)
    {
        // Fix dazed or stunned victim
        SendMessageToPC(oPC, "Skill attempt successful; attempting to fix stunned or dazed condition.");

        effect eRem = GetFirstEffect(oTarg);
        int nType = GetEffectType(eRem);
        while (GetIsEffectValid(eRem))
        {
            if (nType==EFFECT_TYPE_DAZED || nType == EFFECT_TYPE_STUNNED)
            {
                RemoveEffect(oPC, eRem);
                SendMessageToPC(oPC, "Fixed target's condition.");

            }
            eRem = GetNextEffect(oTarg);
            nType = GetEffectType(eRem);
        }
    }
    else
    {
        if (nHP == 0)
        {
            SendMessageToPC(oPC, "Reviving unconscious target.");

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(1), oTarg);
        }
        else
        {
            if (nHP > -10)
            {
                if (nRoll+nSkill-4 < nDC)
                {
                     SendMessageToPC(oPC, "Skill penalty of 4 applied due to using first aid kit instead of medical kit; revival attempt failed.");
                     return;

                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(0 - nHP), oTarg);
                    SendMessageToPC(oPC, "Saving dying target.");
                }
            }
            else if (GetLocalInt(oTarg, "nMdrnNPCDeath")==1)
            {
                if (nRoll+nSkill-4 < nDC)
                {
                     SendMessageToPC(oPC, "Skill penalty of 4 due to using first aid kit instead of medical kit; revival attempt failed.");
                     return;

                }
                else
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
            }

            else

            SendMessageToPC(oPC, "You cannot revive a dead character with a first aid kit.");
        }
    }

}
