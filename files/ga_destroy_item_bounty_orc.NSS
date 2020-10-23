// ga_destroy_item
// FoamBats4All 2014-04-30

#include "nw_i0_plot"
#include "acr_xp_i"

// Rewards XP for each item of tag sItem, returns nGold times the count of items found.
int ConsumeReward( object oTarget, string sItem, int nGold, float fXP, float fCR ) {
	// Number of items consumed.
	int nCount = 0;

	// Destroy all items.
	object oItem = GetFirstItemInInventory( oTarget );
	while ( GetIsObjectValid( oItem ) == TRUE ) {
		if ( GetTag( oItem ) == sItem ) {
			nCount += GetItemStackSize( oItem );
			DestroyObject( oItem, 0.0f );
		}
		oItem = GetNextItemInInventory( oTarget );
	}

	// Abort if no items are found.
	if ( nCount == 0 ) {
		return 0;
	}

	// Award XP.
	ACR_AwardStaticQuestXP( oTarget, "Collected: Orc Bounty" + sItem, FloatToInt( fXP * nCount ), fCR ); 

	// Pass back GP to be awarded at the end.
	return nGold * nCount;
}


void main( string sItemTag ) {
	// Get the player speaking.
	object oPC = GetPCSpeaker();

	// Total GP rewarded.
	int nGP = 0;

	//Orc Ear: 5gp, 1xp, CR 1
	nGP += ConsumeReward( oPC, "003_it_harvest_orc_ear", 5, 1.0f, 1.0f );


	// Reward GP.
	GiveGoldToCreature( oPC, nGP );
}