void main()
{
	object oSpellTarget = GetSpellTargetObject();
    if (GetObjectType(oSpellTarget) == OBJECT_TYPE_CREATURE)
    {		
	   	if(FortitudeSave(oSpellTarget, 13, SAVING_THROW_TYPE_POISON) == FALSE)
	   	{
	     	float nDuration = RoundsToSeconds(10);
		 	effect eKnockout = EffectParalyze(13, SAVING_THROW_FORT, FALSE);
		 	effect eVis = EffectVisualEffect(VFX_DUR_STUN);
		 	effect eImp = EffectVisualEffect(VFX_IMP_STUN);
		 	effect eLink = EffectLinkEffects(eVis, eKnockout);
		 	ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oSpellTarget, 0.0);
		 	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oSpellTarget, nDuration);
	   	} 

    }
}