//cr_lt0013_bcs: built on cr_lt0015_bcs template
//Script prompts Casavir to start LT 13 with the PC, if Torio is spared and brought to Crossroad Keep. Note that it doesn't play if she told Kana to decide for her.

#include "ginc_companion"
void main()
{
object oCasavir = GetObjectByTag("casavir");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("casavir"))
{
DelayCommand(1.0, AssignCommand(oCasavir, ActionStartConversation(oPC,"cr_lt0013", FALSE, FALSE, TRUE, FALSE))); //wait 3 seconds and have Bishop speak to the PC
}
}