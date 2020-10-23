void ClearPlayList()
{
    int nNth = 0;
    int nCount = GetLocalInt(GetModule(), "sly_music_count");
    if (nCount < 0) nCount = 0;

    while(nCount > 0 && nNth < nCount)
    {
        DeleteLocalString(GetModule(), "sly_music_name_" + IntToString(nNth));
        DeleteLocalInt(GetModule(), "sly_music_track_" + IntToString(nNth));
        nNth++;
    }

    SetLocalInt(GetModule(), "sly_music_count", 0);
    SetLocalInt(GetModule(), "sly_music_onload", FALSE);
}

void AddMusicToList(string sName, int nTrack)
{
    int nCount = GetLocalInt(GetModule(), "sly_music_count");
    if (nCount < 0) nCount = 0;

    SetLocalString(GetModule(), "sly_music_name_" + IntToString(nCount), sName);
    SetLocalInt(GetModule(), "sly_music_track_" + IntToString(nCount), nTrack);

    SetLocalInt(GetModule(), "sly_music_count", nCount+1);
}

void main()
{
    int nTrack = 1;
    object oModule = GetModule();
    string sRes, sName, sStrRef;

    ClearPlayList();
    AddMusicToList("No Music", 0);

    sRes = Get2DAString("ambientmusic", "Resource", nTrack);
    //while (sRes != "")
    while (nTrack < 338)
    {
        if (sRes == "" || sRes == "****") // continue;
        {
            // Do nothing
        }
            else
            {
            sStrRef = Get2DAString("ambientmusic", "Description", nTrack);
            if (sStrRef=="")
            {
                sName = Get2DAString("ambientmusic", "DisplayName", nTrack);
            }
            else
            {
                sName = GetStringByStrRef(StringToInt(sStrRef));
            }

            AddMusicToList(sName, nTrack);
        }
        nTrack++;
        sRes = Get2DAString("ambientmusic", "Resource", nTrack);
    }

    SetLocalInt(oModule, "sly_music_onload", TRUE);
}
