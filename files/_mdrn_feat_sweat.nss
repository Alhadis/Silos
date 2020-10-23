// Action Point

void main()
{
    object oPC = OBJECT_SELF;
    int nLevel = GetHitDice(oPC);
    object oAP = GetItemPossessedBy(oPC, "ActionPoint");
    if (GetLocalInt(oPC, "nAPUse")==1)
    {
        SendMessageToPC(oPC, "Only 1 AP can be used per round.");
        return;

    }
    SetLocalInt(oPC, "nAPUse", 1);
    DelayCommand(6.0, SetLocalInt(oPC, "nAPUse", 0));
    if (GetIsObjectValid(oAP)==FALSE)
    {
        SendMessageToPC(oPC, "No Action Points remaining.");
        return;

    }
    SetPlotFlag(oAP, FALSE);
    int nStack = GetItemStackSize(oAP);
    if (nStack > 1)
        SetItemStackSize(oAP, nStack - 1);
    else
        DestroyObject(oAP);
    DelayCommand(0.5, SetPlotFlag(oAP, TRUE));
    int nRoll = d6();
    int nRoll2 = d6();
    if (nRoll2 > nRoll)
        nRoll = nRoll2;
    if (nLevel > 7)
        nRoll = nRoll + d6();
    if (nLevel > 14)
        nRoll = nRoll + d6();
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_ALL_SKILLS, nRoll), oPC, 6.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(nRoll), oPC, 6.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSavingThrowIncrease(SAVING_THROW_ALL, nRoll), oPC, 6.0);

}
