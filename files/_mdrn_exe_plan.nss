// Plan

void main()
{
    object oPC = OBJECT_SELF;
    SetLocalInt(oPC, "nPlan", 0);
    if (GetIsInCombat(oPC))
    {
        FloatingTextStringOnCreature("The plan wasn't ready before the fight began, so it's ruined.", oPC);
        return;
    }
    else
    {
        int nCheck = d20()+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
        int nBonus = 0;
        if (nCheck > 9)
            nBonus ++;
        if (nCheck > 14)
            nBonus ++;
        if (nCheck > 24)
            nBonus ++;
        FloatingTextStringOnCreature("Intelligence check: "+IntToString(nCheck)+", resulting in a circumstance bonus of:" +IntToString(nBonus), oPC);
        if (nBonus > 0)
        {
            object oPartyMem = GetFirstFactionMember(oPC, TRUE);
            while (GetIsObjectValid(oPartyMem))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_ALL_SKILLS, nBonus), oPartyMem, 36.0);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(nBonus), oPartyMem, 36.0);

                oPartyMem = GetNextFactionMember(oPC, TRUE);
            }
        }
        else
            FloatingTextStringOnCreature("The plan is a failure.", oPC);
    }
}
