void main()
{
    object oPC = GetEnteringObject();
    object oDoor = GetNearestObjectByTag("bauerquestdoor",oPC,1);

    ActionUnlockObject(oDoor);

    DelayCommand(60.0f,ActionLockObject(oDoor));
}
