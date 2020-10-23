// React First

void main()
{
    object oPC = OBJECT_SELF;
    if (GetIsInCombat(oPC))
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectHaste(), oPC, 6.0);
}
