void main()
{
    object oTarget = GetEnteringObject();

    object oTrap1 = GetNearestObjectByTag("dj_trap72a");
    object oTrap2 = GetNearestObjectByTag("dj_trap72b");
    AssignCommand(oTrap1, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    AssignCommand(oTrap2, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));


    DelayCommand(3.0,AssignCommand(oTrap1, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
    DelayCommand(3.0,AssignCommand(oTrap2, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));

    effect eDam = EffectDamage(d20(6), DAMAGE_TYPE_SLASHING, DAMAGE_POWER_PLUS_TWENTY);
    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));

}
