//br_lt014_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT14 with the PC, if Bishop heard PC speak to Daeghun about PC's mother

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt014", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}