void main()
{
	object oGarius = GetObjectByTag("34_b_garius");
	object oBishop = GetObjectByTag("bishop");
	
	ActionPauseCutscene( 6000, FALSE );	
	AssignCutsceneActionToObject(oGarius, ActionCastFakeSpellAtObject(SPELL_DESTRUCTION, oBishop) );
	AssignCutsceneActionToObject(oGarius, ActionWait(6.0));
	
	{
		DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectNWN2SpecialEffectFile("sp_destruction"),oBishop));
		
	}
}