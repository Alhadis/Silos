void main () {
object oPC = GetPCItemLastEquippedBy();
object oItem = GetPCItemLastEquipped();
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELL_LESSER_VISAGE), oPC));
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PARALYZED), oPC));
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_BLUE_10), oPC));
SendMessageToPC(oPC, "You thinly apply some of "+GetName(oItem)+" to your skin.");
}