void main()
{
    location lPC = GetLocation(GetEnteringObject());
    effect eShake = EffectVisualEffect(356);
    DelayCommand(0.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, lPC));
}
