//br_lt002_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 2 with the PC, if Bishop gave Marcus his skinning knife.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt002", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}