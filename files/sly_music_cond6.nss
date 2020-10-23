int StartingConditional()
{
    int nMod = 6;
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();
    int    nCurrent = GetLocalInt(oPC, "sly_music_current");
    int    nTrack = GetLocalInt(oModule, "sly_music_track_"+IntToString(nCurrent+nMod));
    string sName = GetLocalString(oModule, "sly_music_name_"+IntToString(nCurrent+nMod));

    if ((sName == "" || sName == "****") && nTrack == 0)
        return FALSE;

    return TRUE;
}

