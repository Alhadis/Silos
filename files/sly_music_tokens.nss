void main()
{
    object      oPC = OBJECT_SELF;
    int         nCurrent = GetLocalInt(oPC, "sly_music_current");
    string      sName, sDisplay;
    int         nNth, nTrack;


    for (nNth=nCurrent; nNth<nCurrent+10; nNth++)
    {
        sName = GetLocalString(GetModule(),"sly_music_name_" + IntToString(nNth));
        nTrack = GetLocalInt(GetModule(),"sly_music_track_" + IntToString(nNth));

        if (sName == "" && nTrack == 0)
        {
            sDisplay = "No Music";
        }
        else if (sName == "" || sName == "****")
        {
            sDisplay = "Track "+IntToString(nTrack)+": "+"Unknown Track";
        }
        else
        {
            sDisplay = "Track "+IntToString(nTrack)+": "+sName;
        }

        SetCustomToken(6000+(nNth-nCurrent), sDisplay);
    }
}
