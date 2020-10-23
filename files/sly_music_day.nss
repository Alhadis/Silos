void main()
{
    int nMusicType = 1;
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    SetLocalInt(oPC, "sly_music_current", 0);
    SetLocalInt(oPC, "sly_music_type", nMusicType);
}
