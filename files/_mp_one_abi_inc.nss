void main()
{
    object oPC = GetEnteringObject();

/*    effect eSkills = EffectSkillIncrease(SKILL_ALL_SKILLS,10);

    effect eAbiCha = EffectAbilityIncrease(ABILITY_CHARISMA,4);
    effect eAbiCon = EffectAbilityIncrease(ABILITY_CONSTITUTION,4);
    effect eAbiDex = EffectAbilityIncrease(ABILITY_DEXTERITY,4);
    effect eAbiInt = EffectAbilityIncrease(ABILITY_INTELLIGENCE,4);
    effect eAbiStr = EffectAbilityIncrease(ABILITY_STRENGTH,4);
    effect eAbiWis = EffectAbilityIncrease(ABILITY_WISDOM,4);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSkills,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiCha,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiCon,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiDex,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiInt,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiStr,oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAbiWis,oPC);*/

    effect eSpellF = GetFirstEffect(oPC);
    while(GetIsEffectValid(eSpellF))
    {
        if(GetEffectType(eSpellF) == EFFECT_TYPE_SPELL_FAILURE      ||
           GetEffectType(eSpellF) == EFFECT_TYPE_ABILITY_DECREASE   ||
           GetEffectType(eSpellF) == EFFECT_TYPE_SKILL_DECREASE)
        {
            RemoveEffect(oPC, eSpellF);
        }
        eSpellF = GetNextEffect(oPC);
    }
}
