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
	ACR_AwardStaticQuestXP( oTarget, "Collected: Component" + sItem, FloatToInt( fXP * nCount ), fCR ); 

	// Pass back GP to be awarded at the end.
	return nGold * nCount;
}


void main( string sItemTag ) {
	// Get the player speaking.
	object oPC = GetPCSpeaker();

	// Total GP rewarded.
	int nGP = 0;

	//TSM additions
	// Blue Moss: 5gp, 2.5xp, CR 5
	nGP += ConsumeReward( oPC, "pmoss", 5, 2.5f, 2.0f );

	// Mephit Claw: 5gp, 2.5xp, CR 2
	nGP += ConsumeReward( oPC, "003_it_harvest_mephit_claw", 5, 2.5f, 2.0f );

	// Wasp Stinger: 5gp, 2.5xp, CR 2
	nGP += ConsumeReward( oPC, "it_misc_wasp_stinger", 5, 2.5f, 2.0f );

	 // Spider Venom Sac: 5gp, 2.5xp, CR 2
	nGP += ConsumeReward( oPC, "003_it_harvest_spider_poison", 5, 2.5f, 2.0f );

	//End TSM additions
	
	// Fire Rat Tail: 5gp, 2.5xp, CR 2
	nGP += ConsumeReward( oPC, "firerattail", 5, 2.5f, 2.0f );

	// Vampire Bat Fang: 8gp, 4p, CR 2
	nGP += ConsumeReward( oPC, "vampirebatfang", 8, 4.0f, 2.0f );

	// Bat Guano: 3gp, 1.5xp, CR 5
	nGP += ConsumeReward( oPC, "batguano", 3, 1.5f, 5.0f );

	// Phosphorescent Moss: 20gp, 10xp, CR 5
	nGP += ConsumeReward( oPC, "pmoss", 20, 10.0f, 5.0f );

	// Sulphur: 30gp, 15xp, CR 8
	nGP += ConsumeReward( oPC, "it_sulfur", 30, 15.0f, 8.0f );

	// Flashwort Spores: 20gp, 10xp, CR 2
	nGP += ConsumeReward( oPC, "it_flashwort", 20, 10.0f, 2.0f );

	// Gloomshroom: 15gp, 7.5xp, CR 5
	nGP += ConsumeReward( oPC, "it_gloomshroom", 15, 7.5f, 5.0f );

	// Troll Blood: 20gp, 10xp, CR 8
	nGP += ConsumeReward( oPC, "N2_CRFT_DIST033", 20, 10.0f, 8.0f );

	// Troll Blood (from other servers?): 20gp, 10xp, CR 8
	nGP += ConsumeReward( oPC, "it_plot_hide_troll", 20, 10.0f, 8.0f );

	// Fire Beetle Gland: 3gp, 1.5xp, CR 2
	nGP += ConsumeReward( oPC, "it_plot_beetle_fire", 3, 1.5f, 2.0f );
	
	// Redcap Tooth: 100gp, 50xp, CR 10
	nGP += ConsumeReward( oPC, "010_it_misc_rtooth", 100, 50.0f, 10.0f );
	
	// Redcap Tooth (from other server?): 100gp, 50xp, CR 10
	nGP += ConsumeReward( oPC, "abr_it_misc_redcap_tooth", 100, 50.0f, 10.0f );
	
	// Ankheg Acid Gland: 20gp, 10xp, CR 5
	nGP += ConsumeReward( oPC, "it_misc_ankheg_acid_gland", 20, 10.0f, 5.0f );
	
	// Wyvern Stinger: 40gp, 20xp, CR 6
	nGP += ConsumeReward( oPC, "it_misc_wyvern_stinger", 40, 20f, 6.0f );
	
	// Electrum Gear: 5gp, 2.5xp, CR 3
	nGP += ConsumeReward( oPC, "it_plot_gear_electrum", 5, 2.5f, 3.0f );
	
	// Gold Gear: 50gp, 25xp, CR 7
	nGP += ConsumeReward( oPC, "it_plot_gear_gold", 50, 25.0f, 7.0f );
	
	// Platinum Gear: 100gp, 50xp, CR 11
	nGP += ConsumeReward( oPC, "it_plot_gear_platinum", 100, 50.0f, 11.0f );

	// Adamantine Gear: 350gp, 175xp, CR 15
	nGP += ConsumeReward( oPC, "it_plot_gear_adamantine", 350, 175.0f, 15.0f );			
	
	// Reward GP.
	GiveGoldToCreature( oPC, nGP );
}