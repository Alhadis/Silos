void spawnAisa(object pc)
{
    object spawnpoint = GetNearestObjectByTag("e1_teis_aisa_spawn", pc);
    effect spawnVfx = EffectVisualEffect(VFX_FNF_SUMMONDRAGON);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, spawnVfx, GetLocation(spawnpoint));
    object aisa = CreateObject(OBJECT_TYPE_CREATURE, "oldlady002", GetLocation(spawnpoint));
    DelayCommand(2.0, AssignCommand(aisa, ActionStartConversation(pc, "e1_aisa_teis_tk")));
    DelayCommand(2.0, DestroyObject(OBJECT_SELF));
}

void main()
{
    object pc = GetFirstPC();
    if (GetEnteringObject() != pc)
    {
        return;
    }

    SetCutsceneMode(pc, TRUE);
    DelayCommand(0.25f, AssignCommand(pc, ClearAllActions()));
    DelayCommand(2.0f, spawnAisa(pc));
}
