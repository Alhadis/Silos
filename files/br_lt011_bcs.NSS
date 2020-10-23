//br_lt0011_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 11 with the PC, after she talked to SilkenSisters.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt011", FALSE, FALSE, TRUE, FALSE))); //wait 3 seconds and have Bishop speak to the PC
}
}