void main()
{
    object pc = GetFirstPC();
    if (GetEnteringObject() != pc)
    {
        return;
    }

    SetCutsceneMode(pc, FALSE);
    DestroyObject(GetNearestObjectByTag("e1_khratul_plot", pc));
    AssignCommand(pc, ActionJumpToLocation(GetLocation(GetObjectByTag("e1_rte_from_esf"))));
    DestroyObject(GetNearestObjectByTag("e1_luther_old", pc));
}
