void main() {
	object oPC = GetPCItemLastEquippedBy();
	effect eVFX = EffectVisualEffect(VFX_DUR_AURORA_CHAIN);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oPC, 999.0);
}