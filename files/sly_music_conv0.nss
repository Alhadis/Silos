void main()
{
    int nMod = 0;
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();
    int    nCurrent = GetLocalInt(oPC, "sly_music_current");
    int    nTrack = GetLocalInt(oModule, "sly_music_track_"+IntToString(nCurrent+nMod));
    string sName = GetLocalString(oModule, "sly_music_name_"+IntToString(nCurrent+nMod));
    int    nMusicType = GetLocalInt(oPC, "sly_music_type");

    if (sName == "" || sName == "****")
        sName = "Unknown Track";

    string sType = " ";
    if (nMusicType == 1)     sType = " Day ";
    else if(nMusicType == 2) sType = " Night ";
    else if(nMusicType == 3) sType = " Battle ";
    SendMessageToPC(oPC, "Now Playing"+sType+"Track "+IntToString(nTrack)+": "+sName);

    if (nMusicType <= 2)
    {
        MusicBackgroundStop(oArea);
        if (nMusicType == 0 || nMusicType == 1)
            MusicBackgroundChangeDay(oArea, nTrack);
        if (nMusicType == 0 || nMusicType == 2)
            MusicBackgroundChangeNight(oArea, nTrack);
        MusicBackgroundPlay(oArea);
    }
    else if (nMusicType == 3)
    {
        MusicBattleStop(oArea);
        MusicBattleChange(oArea, nTrack);
        MusicBattlePlay(oArea);
    }
}
