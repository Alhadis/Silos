// Action Boost

void main()
{
    object oPC = OBJECT_SELF;
    int nLevel = GetHitDice(oPC);
    object oAP = GetItemPossessedBy(oPC, "ActionPoint");
    int nSize = GetItemStackSize(oAP);
    if (GetLocalInt(oPC, "nAPUse")==1)
    {
        SendMessageToPC(oPC, "Action Boost or Action Points can be used only once per round.");
        return;

    }
    SetLocalInt(oPC, "nAPUse", 1);
    DelayCommand(6.0, SetLocalInt(oPC, "nAPUse", 0));

    if (GetIsObjectValid(oAP)==FALSE || nSize < 2)
    {
        SendMessageToPC(oPC, "You must have 2 Action Points in a stack to use this feat.");
        return;

    }
    SetPlotFlag(oAP, FALSE);
    if (nSize > 2)
        SetItemStackSize(oAP, nSize - 2);
    else
        DestroyObject(oAP);
    DelayCommand(0.5, SetPlotFlag(oAP, TRUE));
    int nRoll = d6(2);
    if (nLevel > 7)
        nRoll = nRoll + d6(2);
    if (nLevel > 14)
        nRoll = nRoll + d6(2);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_ALL_SKILLS, nRoll), oPC, 6.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(nRoll), oPC, 6.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSavingThrowIncrease(SAVING_THROW_ALL, nRoll), oPC, 6.0);

}
