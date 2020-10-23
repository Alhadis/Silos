// Checks for Animal Companion Search skill ranking
// Show if PC has average Intelligence
// Formerly nw_ch_fm_st_07
// Edited by Shawn "U'lias" Marcil for ALFA Animal Companions

int StartingConditional()
{
    int nSearch = GetSkillRank(SKILL_SEARCH, OBJECT_SELF);
    if (nSearch > 0)
    {
        if (GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE) >= 9)
        return TRUE;
    }
    return FALSE;
}
