void main()
{
    object pc = GetFirstPC();
    if (GetEnteringObject() != pc)
    {
        return;
    }

    if (GetTag(GetArea(pc)) == "e1_luthers_cottage")
    {
        if (GetLocalInt(GetModule(), "e1TeleportedFromArcanys") && !GetLocalInt(GetModule(), "e1TeleportedToLuther"))
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3), GetLocation(pc), 10.0f);
            SetCutsceneMode(pc);
            DelayCommand(3.0f, SetCutsceneMode(pc, FALSE));
            SetLocalInt(GetModule(), "e1TeleportedToLuther", 1);
        }
    }

    int cameraMode = CAMERA_MODE_STIFF_CHASE_CAMERA;
    float facing = GetFacing(pc);
    float pitch = 80.0f;
    float distance = 5.0f;

    DelayCommand(0.5f, AssignCommand(pc, SetCameraFacing(facing, distance, pitch)));

    DelayCommand(0.7f, LockCameraDistance(pc, TRUE));
    DelayCommand(0.8f, LockCameraPitch(pc, TRUE));
    DelayCommand(0.9f, SetCameraMode(pc, cameraMode));
}
