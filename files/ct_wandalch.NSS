void main()
{
object oTarget = GetItemActivatedTarget();
object oItem = GetItemActivated();

SetLocalObject(oItem, "target", oTarget);
AssignCommand(OBJECT_SELF, ActionStartConversation(OBJECT_SELF, "ct_wandalchconv", TRUE, FALSE, TRUE, TRUE));
}