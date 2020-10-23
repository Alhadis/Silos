//::///////////////////////////////////////////////
//:: FileName druidquest8
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/5/2009 9:46:05 PM
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
	// Set the variables
	SetLocalInt(GetPCSpeaker(), "druidquest", 200);


	// Set the faction to hate the player, then attack the player
	AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
	DetermineCombatRound(GetPCSpeaker());
}
