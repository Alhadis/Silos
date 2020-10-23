/*
    Stun Gun
*/

void main()
{
    //Declare major variables
    object oTarget = GetItemActivatedTarget();
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
    effect eDam = EffectDamage(Random(3)+1,DAMAGE_TYPE_ELECTRICAL);

    // Apply effects to the currently selected target.
    DelayCommand(0.1,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget));
    DelayCommand(0.2,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oTarget));
    //Fortitude save to avoid paralysis
    if (FortitudeSave(oTarget,15,SAVING_THROW_TYPE_ELECTRICITY)>0)
    {
        DelayCommand(0.3,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectStunned(),oTarget,RoundsToSeconds(d6(1))));
    }
}
