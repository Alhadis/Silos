void main()
{
    object oItem = OBJECT_SELF;
    object oPC = GetItemPossessor(oItem);

    int nBonus = GetLocalInt(oItem, "SkillBonus");

    int nSkill = GetLocalInt(oItem, "Skill");
    if (GetLocalInt(oPC, "nMdrnEquip"+GetTag(oItem))==0)
    {
        SetLocalInt(oPC, "nMdrnEquip"+GetTag(oItem), 1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(nSkill, nBonus), oPC);
    }
}
