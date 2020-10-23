void main() {
	object oPC = GetPCItemLastUnequippedBy();
	effect eVFX = EffectVisualEffect(VFX_DUR_AURORA_CHAIN);
	RemoveEffect(oPC, eVFX);
}