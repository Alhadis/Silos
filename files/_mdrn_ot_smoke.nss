// Smoke grenade
// Creates Darkness effect at the target location for 10 rounds (60 seconds).

void main()
{
    location lTarget = GetItemActivatedTargetLocation();
    object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE,"x3_plc_mist",lTarget);

    DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectAreaOfEffect(AOE_PER_DARKNESS),lTarget,60.0f));
    DelayCommand(70.5f,DestroyObject(oTarget));
}
