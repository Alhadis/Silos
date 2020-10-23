void main () {
object oPC = GetPCItemLastEquippedBy();
object oItem = GetPCItemLastEquipped();
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELL_LESSER_VISAGE), oPC));
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_ORANGE_10), oPC));
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_AURORA_CHAIN), oPC));
SendMessageToPC(oPC, "You thinly apply some of "+GetName(oItem)+" to your skin.");
}