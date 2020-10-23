void main()
{

    object oTarget = GetObjectByTag("dj_trap1");
    object oPC = GetEnteringObject();
    AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    effect eDamage = EffectDamage(d20(5), DAMAGE_TYPE_BLUDGEONING); // Schadenswurf
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);

    DelayCommand(2.0, AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));

}
