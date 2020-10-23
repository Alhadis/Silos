// Checks for Animal Companion Hide or Move Silently skill ranking
// Show if PC has average Intelligence
// Formerly nw_ch_fm_st_05
// Edited by Shawn "U'lias" Marcil for ALFA Animal Companions

int StartingConditional()
{
    int nHide = GetSkillRank(SKILL_HIDE, OBJECT_SELF);
    int nMoveSilently = GetSkillRank(SKILL_MOVE_SILENTLY, OBJECT_SELF);
    if (    (nHide > 0) || (nMoveSilently > 0)    )
    {
        if (GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE) >= 9)
        return TRUE;
    }
    return FALSE;
}
