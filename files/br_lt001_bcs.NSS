//br_lt001_bcs: Script written by Kunou126 at Bioware forums 
//with some additions from Wyrin_D'njargo, Segal, Jitur 
//Yep, it truly took a village to make this one work
//Script prompts Bishop to start LT 1 with the PC if she paid Bishop 20 gold for his thoughts.

#include "ginc_companion"
void main()
{
object oBishop = GetObjectByTag("bishop");
object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
if(IsInParty("bishop"))
{
DelayCommand(1.0, AssignCommand(oBishop, ActionStartConversation(oPC,"br_lt001", FALSE, FALSE, TRUE, FALSE))); //wait 10 seconds and have Bishop speak to the PC
}
}