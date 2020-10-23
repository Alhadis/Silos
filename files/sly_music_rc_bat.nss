int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    int nDidBackUp = GetLocalInt(oArea, "sly_music_backup");
    if (nDidBackUp)
    {
        int nBattleTrack = MusicBackgroundGetBattleTrack(oArea);
        int nBackBattleTrack = GetLocalInt(oArea, "sly_music_back_battle");
        if (nBattleTrack != nBackBattleTrack) return TRUE;
    }
    return FALSE;
}
