void main()
{
object oPC = GetItemActivator();
object oPlay = GetItemActivatedTarget();

SetLocalObject(oPC, "player", oPlay);
AssignCommand(oPC, ActionStartConversation(oPC, "ct_dooradd"));
}