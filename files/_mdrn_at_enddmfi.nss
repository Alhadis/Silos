void main()
{
object oPC = GetPCSpeaker();

AssignCommand(oPC, ActionStartConversation(oPC, "dmfi_universal", TRUE));
}
