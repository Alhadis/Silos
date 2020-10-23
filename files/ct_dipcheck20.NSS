int StartingConditional()
{
object oPC = GetPCSpeaker();
int iRanks = GetSkillRank(SKILL_DIPLOMACY, oPC);
int iMod = GetAbilityModifier(ABILITY_CHARISMA, oPC);
int iRand = d20();

if(iRanks + iMod + iRand >= 20)
	return TRUE;
else
	return FALSE;
}