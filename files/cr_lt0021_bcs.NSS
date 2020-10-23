//cr_lt0021_bcs: built on Domi's br_lt011_bcs template
//Script prompts Casavir to start LT 21 with a non-evil PC, after she beats Light of Heavens the first time.

#include "ginc_companion"
void main()
{
object oCasavir = GetObjectByTag("casavir");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("casavir"))
{
DelayCommand(1.0, AssignCommand(oCasavir, ActionStartConversation(oPC,"cr_lt0021", FALSE, FALSE, TRUE, FALSE))); //wait 3 seconds and have Bishop speak to the PC
}
}