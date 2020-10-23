//::///////////////////////////////////////////////
//:: FileName druidquest4
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/5/2009 4:00:16 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
	// Give the speaker some gold
	RewardPartyGP(5000, GetPCSpeaker());

	// Give the speaker some XP
	RewardPartyXP(2500, GetPCSpeaker());


	// Remove items from the player's inventory
	object oItemToTake;
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "nuquqilring");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	// Set the variables
	SetLocalInt(GetPCSpeaker(), "druidquest", 300);

}
