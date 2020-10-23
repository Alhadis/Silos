// Light on use creates a spell that when an object is touched, it changes its state from lit to unlit.
void main()
{
	// if state = lit, 
	if(GetLocalInt(OBJECT_SELF, "is_lit"))
	{
		// then turn off light
		SetLocalInt(OBJECT_SELF, "is_lit", 0);
		effect e = GetFirstEffect(OBJECT_SELF);
		while (GetIsEffectValid(e))
		{
			if (GetEffectType(e) == EFFECT_TYPE_VISUALEFFECT) RemoveEffect(OBJECT_SELF, e);			
			e = GetNextEffect(OBJECT_SELF);
		}
	}
	// else state is unlit, turn it on
	else
	{
		SetLocalInt(OBJECT_SELF, "is_lit", 1);
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_WHITE_15), OBJECT_SELF);
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_YELLOW), OBJECT_SELF);
	}
}