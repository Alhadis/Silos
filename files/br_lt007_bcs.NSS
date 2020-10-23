//br_lt006_bcs: built on the br_lt001_bcs template
//Script prompts Bishop to start LT 7 with the PC, after convo with Aldalon.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt007", FALSE, FALSE, TRUE, FALSE))); //wait 3 seconds and have Bishop speak to the PC
}
}