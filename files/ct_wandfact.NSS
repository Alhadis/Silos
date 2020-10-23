void main()
{
object oPC = GetItemActivator();
object oTar = GetItemActivatedTarget();
object oIt = GetItemActivated();

SetLocalObject(oIt, "target", oTar);
AssignCommand(oPC, ActionStartConversation(oPC, "ct_wandfact", TRUE, FALSE));
}