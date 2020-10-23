void main()
{
    object pc = GetFirstPC();
    if (GetEnteringObject() != pc)
        return;

    if (GetLocalInt(GetModule(), "e1LeftForTemple") != 1)
        return;

    object luther = GetNearestObjectByTag("e1_luther_old", pc);
    AssignCommand(luther, ActionForceFollowObject(pc, 1.5f));

    if (GetLocalInt(GetModule(), "e1RanAwayFromKhratul") == 1)
    {
        AssignCommand(luther, ActionSpeakString("Temple Eldur is right ahead. Let's go!"));
    }

    DestroyObject(OBJECT_SELF);
}
