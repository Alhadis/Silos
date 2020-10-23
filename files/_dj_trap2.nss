void main()
{

    object oTarget = GetObjectByTag("dj_trap2");
    object oPC = GetEnteringObject();
    AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    effect eDamage = EffectDamage(d10(12), DAMAGE_TYPE_BLUDGEONING); // Schadenswurf
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);

    DelayCommand(2.0, AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));

}
