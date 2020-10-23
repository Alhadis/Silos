//::///////////////////////////////////////////////
//:: Septose's Convo Script
//:: NPC Seek and Initiate convo
//:://////////////////////////////////////////////
/*
    This script will make the NPC search for a player and
    initiate the conversation with a PC if present.
    change the BeginConversation("ANYTHING" to
    whatever is needed.
*/
//:://////////////////////////////////////////////
//:: Created By: SeptoseZero
//:: Created On: 3.16.18
//:://////////////////////////////////////////////

void main ()
{
object oPC = GetLastPerceived();
if(GetIsPC(oPC) == TRUE)
	{
	BeginConversation("startconvo001",oPC);
	}
}	
