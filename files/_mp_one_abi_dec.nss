void main()
{
    object oPC = GetEnteringObject();

    effect eSkills = EffectSkillDecrease(SKILL_ALL_SKILLS,10);

    //effect eAbiCha = EffectAbilityDecrease(ABILITY_CHARISMA,4);
    effect eAbiCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,4);
    effect eAbiDex = EffectAbilityDecrease(ABILITY_DEXTERITY,4);
    //effect eAbiInt = EffectAbilityDecrease(ABILITY_INTELLIGENCE,4);
    effect eAbiStr = EffectAbilityDecrease(ABILITY_STRENGTH,4);
    //effect eAbiWis = EffectAbilityDecrease(ABILITY_WISDOM,4);

    effect eSpellF = EffectSpellFailure(100);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSkills,oPC);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiCha,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiCon,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiDex,oPC);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiInt,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiStr,oPC);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiWis,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSpellF,oPC);

}
