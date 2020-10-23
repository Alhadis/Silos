int StartingConditional()
{
object oPC = GetPCSpeaker();
int iRanks = GetSkillRank(SKILL_APPRAISE, oPC);
int iMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
int iRand = d20();

if(iRanks + iMod + iRand >= 25)
	return TRUE;
else
	return FALSE;
}