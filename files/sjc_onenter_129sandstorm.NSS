void main()
{
object oAffected = GetEnteringObject();
effect eListenMinus = EffectSkillDecrease(SKILL_LISTEN, 8);
effect eSpotMinus = EffectSkillDecrease(SKILL_SPOT, 4);
effect eSearchMinus = EffectSkillDecrease(SKILL_SEARCH, 4);
effect eHideMinus = EffectSkillDecrease(SKILL_HIDE, 4);
effect eSilenceMinus = EffectSkillDecrease(SKILL_MOVE_SILENTLY, 4);
effect eTumbleMinus = EffectSkillDecrease(SKILL_TUMBLE, 4);
object oEntering = GetEnteringObject();

if (GetIsPC(oEntering) == TRUE)
{
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eListenMinus, oAffected);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpotMinus, oAffected);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSearchMinus, oAffected);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHideMinus, oAffected);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSilenceMinus, oAffected);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTumbleMinus, oAffected);
}
}