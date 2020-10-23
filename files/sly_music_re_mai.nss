void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    object oModule = GetModule();

    int nDayTrack = GetLocalInt(oArea, "sly_music_back_day");
    string sDayName = GetLocalString(oModule, "sly_music_name_"+IntToString(nDayTrack));
    SetCustomToken(6010, "Restore Only The Day Track: "+sDayName);

    int nNightTrack = GetLocalInt(oArea, "sly_music_back_night");
    string sNightName = GetLocalString(oModule, "sly_music_name_"+IntToString(nNightTrack));
    SetCustomToken(6011, "Restore Only The Night Track: "+sNightName);

    int nBattleTrack = GetLocalInt(oArea, "sly_music_back_battle");
    string sBattleName = GetLocalString(oModule, "sly_music_name_"+IntToString(nBattleTrack));
    SetCustomToken(6012, "Restore Only The Battle Track: "+sBattleName);
}
