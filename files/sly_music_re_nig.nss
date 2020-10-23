void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    int nNightTrack = GetLocalInt(oArea, "sly_music_back_night");

    MusicBattleStop(oArea);
    MusicBackgroundStop(oArea);
    MusicBackgroundChangeNight(oArea, nNightTrack);
    MusicBackgroundPlay(oArea);
}
