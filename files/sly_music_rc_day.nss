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
    }
    return FALSE;
}
