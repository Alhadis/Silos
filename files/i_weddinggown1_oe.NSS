void main () {
object oPC = GetPCItemLastEquippedBy();
object oItem = GetPCItemLastEquipped();
AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_AURORA_CHAIN), oPC));
SendMessageToPC(oPC, "You put on the "+GetName(oItem)+".");
}