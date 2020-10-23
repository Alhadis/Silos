//::///////////////////////////////////////////////
//:: FileName dlg_plott_08
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/23/2009 2:06:14 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
	// Give the speaker some XP
	RewardPartyXP(10000, GetPCSpeaker());

	// Give the speaker the items
	CreateItemOnObject("item115", GetPCSpeaker(), 1);

	// Set the variables
	SetLocalInt(GetPCSpeaker(), "iplottkingsquest", 200);

}
