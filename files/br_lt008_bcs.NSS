//br_lt008_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 8 with the PC, after Zheave has into to the keep speech.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt008", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}