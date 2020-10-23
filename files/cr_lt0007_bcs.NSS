//cr_lt0007_bcs: built on Domi's br_lt001_bcs template
//Script prompts Casavir to start LT 7 with the PC.

#include "ginc_companion"
void main()
{
object oCasavir = GetObjectByTag("casavir");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("casavir"))
{
AssignCommand(oCasavir,ActionStartConversation(oPC,"cr_lt0007", FALSE, FALSE, TRUE, FALSE)); //Speak!
}
}