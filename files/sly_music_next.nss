int CalculateMaxTracks()
{
    object oPC = GetPCSpeaker();
    int nMax = GetLocalInt(GetModule(), "sly_music_count");
    int nPages = nMax/10;
    float fMax = IntToFloat(nMax);
    float fPages = fMax/10.0;

    if (IntToFloat(nPages) < fPages)
    {
        return (nPages + 1) * 10;
    }

    return nPages * 10;
}

void main()
{
    object oPC = GetPCSpeaker();
    int    nCurrent = GetLocalInt(oPC, "sly_music_current");
    int    nTracks = GetLocalInt(GetModule(), "sly_music_count");
    int    nMax = CalculateMaxTracks();

    nCurrent += 10;
    if (nCurrent >= nMax) nCurrent = 0;

    SetLocalInt(oPC, "sly_music_current", nCurrent);

    ExecuteScript("sly_music_tokens", oPC);
}
