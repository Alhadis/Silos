void main()
{
object oPC = GetEnteringObject();
ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_CRAFT_ARMOR, 100), oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_CRAFT_WEAPON, 100), oPC);
}
