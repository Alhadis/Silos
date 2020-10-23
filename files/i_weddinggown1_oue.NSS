void main () {
object oPC = GetPCItemLastUnequippedBy();
object oItem = GetPCItemLastUnequipped();
effect eLoop=GetFirstEffect(oPC);
while (GetIsEffectValid(eLoop))
   {
   if (GetEffectCreator(eLoop)==oItem)
         RemoveEffect(oPC, eLoop);
   eLoop=GetNextEffect(oPC);
   }
SendMessageToPC(oPC, "You remove the "+GetName(oItem)+".");
}