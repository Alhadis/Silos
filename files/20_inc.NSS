// 20_inc
/*
	general include file for 2000 NWCity
*/
// ChazM 9/21/05
// EPF -- script hidden functions
// EPF 3/22/06 -- added Act1()
	
#include "ginc_journal"
#include "ginc_param_const"
	
// Quests
const string QUEST_DUTIES			= "20_cyran";
	
// Tag and Templates
const string TAG_WATCH_CAPTAIN		= "watch_captain";
const string RR_WATCH_CAPTAIN		= "20_watchcyr";
const string TAG_WATCH				= "10NW_CITYWATCH";
const string RR_WATCH				= "10nwcitywatch";

const string TAG_CYRAN 				= "cyran";
const string RR_CYRAN 				= "20_cyran";

const string TAG_MELIA 				= "Melia";
const string RR_MELIA 				= "20_melia";

const string TAG_ASSASSIN 			= "assassin_cyran";


const string EDMUND_TAG = "edmund";
const string GRAYSON_TAG = "grayson";

// waypoints
const string WP_CASTLE_ENTER 		= "wp_castle_enter";
const string WP_APPROACH_THRONE 	= "wp_near_throne";
const string WP_CASTLE_WATCH_CAPTAIN= "wp_castle_watch_captain";

const string WP_MASK_FRONT_DOOR		= "10_wp_merchant_to_moonstone";
const string WP_MOONSTONE_ENTER 	= "wp_from1023_to1015";
const string WP_MOONSTONE1_STAIRS	= "wp_from1025_to1015";
const string WP_MASK_WATCH_CAPTAIN	= "wp_1015_watch_captain";

const string WP_MOONSTONE2_STAIRS 	= "wp_from1015_to1025";
const string WP_CYRAN_AMBUSH		= "wp_cyran_ambush";
const string WP_CYRAN_AMBUSH_RUN	= "wp_m2_ambush_door";

const string WP_SSI_MELIA			= "wp_ssi_melia";

void PopulateRosterNPC(string sRosterName, string sWP)
{
	object oNPC = GetObjectFromRosterName(sRosterName);
	location lWP = GetLocation(GetTarget(sWP));

	if(!GetIsObjectValid(oNPC))
	{
		SpawnRosterMember(sRosterName, lWP);
	}
	else
	{
		AssignCommand(oNPC, JumpToLocation(lWP));
	}
}

void ShowSponsor(object oPC)
{
	if ( GetGlobalInt("gbWatch") == TRUE )
	{
		SetScriptHidden(GetNearestObjectByTag(GRAYSON_TAG, oPC),FALSE);
	}
	else SetScriptHidden(GetNearestObjectByTag(EDMUND_TAG, oPC),FALSE);
}

void HideSponsor(object oPC)
{
	if ( GetGlobalInt("gbWatch") == TRUE )
	{
		SetScriptHidden(GetNearestObjectByTag(GRAYSON_TAG, oPC),TRUE);
	}
	else SetScriptHidden(GetNearestObjectByTag(EDMUND_TAG, oPC),TRUE);
}

void ShowNPC(string sNPC, object oNearest, string sWP = "", int bShow = TRUE)
{
	object oNPC;
	object oWP;

	if(GetIsObjectValid(oNearest))
	{
		oNPC = GetNearestObjectByTag(sNPC, oNearest);
		oWP = GetNearestObjectByTag(sWP, oNearest);
	}
	else
	{
		oNPC = GetObjectByTag(sNPC);
		oWP = GetObjectByTag(sWP);
	}

	if(sWP == "")
	{
		SetScriptHidden(oNPC, !bShow);
		return;
	}

	if(!GetIsObjectValid(oWP))
	{
		oWP = GetObjectByTag(sWP);
	}

	SetScriptHidden(oNPC, !bShow);
	
	if(GetIsObjectValid(oWP))
	{
		AssignCommand(oNPC, JumpToObject(oWP));
	}
}

void HideNPC(string sNPC, object oNearest = OBJECT_INVALID)
{
	object oNPC;

	if(GetIsObjectValid(oNearest))
	{
		oNPC = GetNearestObjectByTag(sNPC, oNearest);
	}
	else
	{
		oNPC = GetObjectByTag(sNPC);
	}
	SetScriptHidden(oNPC, TRUE);
}

int IsReadyForSydney(object oPC)
{
	return (GetJournalQuestEntry("20_tavorick", oPC) >= 60 && !GetLocalInt(GetModule(), "bDoneSydneyScene"));
}
	
int Act1()
{
	return (GetGlobalInt("00_nAct") <= 1);	
}