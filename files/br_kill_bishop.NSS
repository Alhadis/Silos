void main()
{
	object oBishop = GetObjectByTag("bishop");
	
//	AssignCutsceneActionToObject( oBishop, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0f, 60.0f) );
	SetPlotFlag(oBishop, FALSE);
	SetImmortal(oBishop, FALSE);
	SetLocalInt(oBishop,"bProne",TRUE);
	AssignCommand(oBishop, SetIsDestroyable(FALSE,FALSE,FALSE));
	AssignCommand(GetArea(oBishop), ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(),oBishop));
	AssignCommand(oBishop, ActionWait(5.0) );
}