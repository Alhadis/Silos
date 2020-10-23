void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    MusicBackgroundStop(oArea);
}
