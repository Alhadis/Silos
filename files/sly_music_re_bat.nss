void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    int nBattleTrack = GetLocalInt(oArea, "sly_music_back_battle");

    MusicBattleStop(oArea);
    MusicBackgroundStop(oArea);
    MusicBattleChange(oArea, nBattleTrack);
    MusicBackgroundPlay(oArea);
}
