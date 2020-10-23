int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    int nDidBackUp = GetLocalInt(oArea, "sly_music_backup");
    if (nDidBackUp)
    {
        int nNightTrack = MusicBackgroundGetNightTrack(oArea);
        int nBackNightTrack = GetLocalInt(oArea, "sly_music_back_night");
        if (nNightTrack != nBackNightTrack) return TRUE;
    }
    return FALSE;
}
