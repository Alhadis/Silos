//br_lt009_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 9 with the PC, if Bishop is in the party and Bishop and Casavir quarelled
#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt009", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}