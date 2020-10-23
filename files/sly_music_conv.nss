void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    int nInitilized = GetLocalInt(oModule, "sly_music_onload");
    if (!nInitilized)
        ExecuteScript("sly_music_onload", oPC);

    int nDidBackUp = GetLocalInt(oArea, "sly_music_backup");
    if (!nDidBackUp)
    {
        int nDayTrack = MusicBackgroundGetDayTrack(oArea);
        SetLocalInt(oArea, "sly_music_back_day", nDayTrack);

        int nNightTrack = MusicBackgroundGetNightTrack(oArea);
        SetLocalInt(oArea, "sly_music_back_night", nNightTrack);

        int nBattleTrack = MusicBackgroundGetBattleTrack(oArea);
        SetLocalInt(oArea, "sly_music_back_battle", nBattleTrack);

        SetLocalInt(oArea, "sly_music_backup", TRUE);
    }

    SetLocalInt(oPC, "sly_music_current", 0);
    ExecuteScript("sly_music_tokens", oPC);
}
