int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    int nDidBackUp = GetLocalInt(oArea, "sly_music_backup");
    if (nDidBackUp)
    {
        int nDayTrack = MusicBackgroundGetDayTrack(oArea);
        int nBackDayTrack = GetLocalInt(oArea, "sly_music_back_day");
        if (nDayTrack != nBackDayTrack) return TRUE;

        int nNightTrack = MusicBackgroundGetNightTrack(oArea);
        int nBackNightTrack = GetLocalInt(oArea, "sly_music_back_night");
        if (nNightTrack != nBackNightTrack) return TRUE;

        int nBattleTrack = MusicBackgroundGetBattleTrack(oArea);
        int nBackBattleTrack = GetLocalInt(oArea, "sly_music_back_battle");
        if (nBattleTrack != nBackBattleTrack) return TRUE;
    }
    return FALSE;
}
