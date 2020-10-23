//br_lt0012_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 12 with the PC, after the last statue was destroyed and Zheave had a chat with Shandra.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt012", FALSE, FALSE, TRUE, FALSE))); //wait 1 seconds and have Bishop speak to the PC
}
}