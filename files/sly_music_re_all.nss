void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    int nDayTrack = GetLocalInt(oArea, "sly_music_back_day");
    int nNightTrack = GetLocalInt(oArea, "sly_music_back_night");
    int nBattleTrack = GetLocalInt(oArea, "sly_music_back_battle");

    MusicBattleStop(oArea);
    MusicBackgroundStop(oArea);
    MusicBackgroundChangeDay(oArea, nDayTrack);
    MusicBackgroundChangeNight(oArea, nNightTrack);
    MusicBattleChange(oArea, nBattleTrack);
    MusicBackgroundPlay(oArea);
}
