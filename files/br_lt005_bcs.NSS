//br_lt005_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 5 with the PC, if Bishop is in the party during the Trial of Words; Bishop starts convo after the party is out of the Castle.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(15.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt005", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}