void main()
{
object oPC = GetItemActivator();
object oIt = GetItemActivated();
effect eSmoke = EffectVisualEffect(VFX_FNF_FIREBALL);
effect eSmoke2 = EffectVisualEffect(VFX_FNF_LOS_NORMAL_10);
location lLoc = GetLocation(oPC);

//ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSmoke, lLoc);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke, oPC);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke2, oPC);

if(GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, oPC) == TRUE)
	{}
else
	{
		FeatAdd(oPC, FEAT_HIDE_IN_PLAIN_SIGHT, FALSE);
		DelayCommand(5.0, FeatRemove(oPC, FEAT_HIDE_IN_PLAIN_SIGHT));
	}
AssignCommand(oPC, ActionSpeakString("*Tosses down a glass orb, filled with a grey substance, and is enveloped in a flash and a cloud of bright smoke that momentarily blinds onlookers.*"));
DestroyObject(oIt);
}