void main () {
object oPC = GetPCItemLastEquippedBy();
object oItem = GetPCItemLastEquipped();
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELL_VISAGE_NEUTRAL), oPC));
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_YELLOW_10), oPC));
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BLUR), oPC));
SendMessageToPC(oPC, "You thinly apply some of "+GetName(oItem)+" to your skin.");
}