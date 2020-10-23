//cr_lt0015_bcs: built on Domi's br_lt011_bcs template
//Script prompts Casavir to start LT 15 with the PC, after she talked to Issym.

#include "ginc_companion"
void main()
{
object oCasavir = GetObjectByTag("casavir");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("casavir"))
{
DelayCommand(1.0, AssignCommand(oCasavir, ActionStartConversation(oPC,"cr_lt0015", FALSE, FALSE, TRUE, FALSE))); //wait 3 seconds and have Bishop speak to the PC
}
}