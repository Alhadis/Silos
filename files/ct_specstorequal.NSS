int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk1 = GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE);
int iChk2 = GetSkillRank(SKILL_DIPLOMACY, oPC, TRUE);

if(iChk1 >= 16 || iChk2 >= 8 || GetHasFeat(FEAT_EPITHET_SHADOWTHIEFAMN, oPC) == TRUE)
	return TRUE;
else
	return FALSE;
}