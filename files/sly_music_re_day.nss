void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    int nDayTrack = GetLocalInt(oArea, "sly_music_back_day");

    MusicBattleStop(oArea);
    MusicBackgroundStop(oArea);
    MusicBackgroundChangeDay(oArea, nDayTrack);
    MusicBackgroundPlay(oArea);
}
