// Stun grenade
// Creates cloud of bewilderment (stunned and blinded 1d6 rounds) effect at the target location for 5 rounds (30 seconds).

void main()
{
    location lTarget = GetItemActivatedTargetLocation();
    object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE,"x3_plc_mist",lTarget);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DUST_EXPLOSION), lTarget);
    DelayCommand(0.1f,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectAreaOfEffect(39),lTarget,30.0f));
    DelayCommand(35.0f,DestroyObject(oTarget));
}
