void main () {
object oPC = GetPCItemLastEquippedBy();
object oItem = GetPCItemLastEquipped();
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_WHITE_5), oPC));
SendMessageToPC(oPC, "You put on the "+GetName(oItem)+".");
}