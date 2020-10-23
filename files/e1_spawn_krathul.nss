void spawnKhratul(object pc)
{
    object spawnpoint = GetNearestObjectToLocation(OBJECT_TYPE_WAYPOINT, GetLocation(pc));
    effect spawnVfx = EffectVisualEffect(VFX_FNF_SUMMON_EPIC_UNDEAD);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, spawnVfx, GetLocation(spawnpoint));
    object khratul = CreateObject(OBJECT_TYPE_CREATURE, "creature002", GetLocation(spawnpoint));
    SetName(khratul, "Khrat'ul");
    DelayCommand(2.0, AssignCommand(khratul, ActionStartConversation(GetFirstPC(), "e1_khrat_esf_tk")));
    DelayCommand(2.0, DestroyObject(OBJECT_SELF));
}

void main()
{
    object pc = GetFirstPC();
    if (GetEnteringObject() != pc)
    {
        return;
    }

    int leftForTemple = GetLocalInt(GetModule(), "e1LeftForTemple");
    int ranAwayFromKhratul = GetLocalInt(GetModule(), "e1RanAwayFromKhratul");

    if (leftForTemple == 1)
    {
        if (ranAwayFromKhratul == 0)
        {
            SetCutsceneMode(pc, TRUE);
            DelayCommand(1.0, AssignCommand(pc, ClearAllActions()));
            DelayCommand(2.0, spawnKhratul(pc));
        }
    }
}
