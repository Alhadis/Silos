//cr_lt0008_bcs: built on Domi's br_lt001_bcs template
//Script prompts Casavir to start LT 8 with the PC, once PC gets the Keep.

#include "ginc_companion"
void main()
{
object oCasavir = GetObjectByTag("casavir");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("casavir"))
{
AssignCommand(oCasavir, ActionStartConversation(oPC,"cr_lt0008", FALSE, FALSE, TRUE, FALSE));
}
}