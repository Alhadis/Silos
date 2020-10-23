/*
    Blood of the Warlord - on enter
*/
void main()
{
    object oCreator = GetAreaOfEffectCreator(OBJECT_SELF);
    object oEnter = GetEnteringObject();

    effect eBonus = EffectAttackIncrease(1);
    eBonus = EffectLinkEffects(eBonus, EffectSavingThrowIncrease(SAVING_THROW_WILL, 1));
    eBonus = EffectLinkEffects(eBonus, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    
    eBonus = ExtraordinaryEffect(eBonus);

    if(GetIsFriend(oEnter, oCreator))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBonus, oEnter);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_HOLY), oEnter);
    }
}
