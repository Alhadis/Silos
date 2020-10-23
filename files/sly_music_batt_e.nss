void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    MusicBattleStop(oArea);
    MusicBackgroundPlay(oArea);
}
