//cr_lt0011_bcs: built on Domi's br_lt014_bcs template
//Script prompts Casavir to start LT11 with the PC, if Casavir heard PC speak to Daeghun about PC's mother

#include "ginc_companion"
void main()
{
object oCasavir = GetObjectByTag("casavir");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
{
DelayCommand(1.0, AssignCommand(oCasavir, ActionStartConversation(oPC,"cr_lt0011", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}