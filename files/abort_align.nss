void main()
{
object oPC = GetPCSpeaker();

AssignCommand(oPC, ActionStartConversation(oPC, "_mdrn_conv_align", TRUE));
}
