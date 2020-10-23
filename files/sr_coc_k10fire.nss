void main()
{
    effect eFire = EffectDamage(d6(2), DAMAGE_TYPE_FIRE, DAMAGE_POWER_ENERGY);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFire, GetEnteringObject());
    SetLocalInt(GetEnteringObject(), "K10Fire", TRUE);
}
