//::///////////////////////////////////////////////////////////////////////////
//::
//::	20a_cs_vigbr1.nss
//::
//::	This file contains the cutscene actions for Conversation 20_s_vigil1.
//::
//::///////////////////////////////////////////////////////////////////////////
//::
//::	Created by: Brian Fox
//::	Created on: 9/25/05
//::
//::///////////////////////////////////////////////////////////////////////////
// EPF -- subsequent work
//DS -- changed Shandra to Bishop

#include "ginc_group"
#include "20_inc"
//::///////////////////////////////////////////////////////////////////////////

const int PAUSE_TIME = 5000;


const string GRAYSON_HOME_WP = "sp_2016_grayson";

const string EDMUND_HOME_WP = "sp_2017_edmund";

const string SPONSOR_EXIT_TAG = "wp_exit_knight";

const string BISHOP_TAG = "bishop"; //replaces shandra with Bishop
const string SHANDRA_SP_TAG = "sp_2091_shandra"; //what's this? possibly a spawn point leave without changes for now
const string BISHOP_RESREF = "co_bishop"; //same as the first one
const string SHANDRA_WP_1_TAG = "wp_shandra_vigil";//way point. No changes.

const string LUSKAN_GROUP 		= "Luskvig";

const string LUSKAN_LEADER_TAG = "20_luskviglead";
const string RR_LUSKAN_LEADER 	= "20_luskviglead"; // tag same
const string RR_LUSKAN 			= "20_luskvig";		// tag same

const string WP_SPAWN_LUSKANS 	= "wp_spawn_luskans";
const string WP_LUSKANS 		= "wp_luskans";
		
//::///////////////////////////////////////////////////////////////////////////
void SponsorLeavesScene()
{
	object oSponsor;
	
	if ( GetGlobalInt("gbWatch") == TRUE )
	{
		oSponsor = GetTarget( GRAYSON_TAG );
	}
	else
	{
		oSponsor = GetTarget( EDMUND_TAG );
	}

	AssignCutsceneActionToObject( oSponsor, ActionForceMoveToTag(SPONSOR_EXIT_TAG) );
}
	
void SponsorJumpsToHQ()
{
	object oSponsor;
	object oHomeWP;
	
	if ( GetGlobalInt("gbWatch") == TRUE )
	{
		oSponsor = GetTarget( GRAYSON_TAG );
		oHomeWP = GetTarget( GRAYSON_HOME_WP );
	}
	else
	{
		oSponsor = GetTarget( EDMUND_TAG );
		oHomeWP = GetTarget( EDMUND_HOME_WP );
	}

	AssignCommand( oSponsor, ClearAllActions() );
	AssignCommand( oSponsor, JumpToObject(oHomeWP) );
}
	
void BishopApproachesPC()
{
	object oBishop = GetTarget( BISHOP_TAG );
	SetPlotFlag(oBishop,FALSE);
	AssignCutsceneActionToObject( oBishop, ActionMoveToObject(GetNearestObjectByTag(SHANDRA_WP_1_TAG)) );
}

void SetupLuskvig()
{
	ResetGroup(LUSKAN_GROUP);
	GroupSetNoise(LUSKAN_GROUP);
	SpawnCreaturesInGroupAtWP(1, RR_LUSKAN_LEADER, LUSKAN_GROUP, WP_SPAWN_LUSKANS);	// spawns in creatures and adds them to a group
	SpawnCreaturesInGroupAtWP(2, RR_LUSKAN, LUSKAN_GROUP, WP_SPAWN_LUSKANS);	// spawns in creatures and adds them to a group

	GroupOnDeathExecuteCustomScript(LUSKAN_GROUP, "20a_start_vigil2");
}

void LuskvigApproachesPC()
{
	GroupMoveToWP( LUSKAN_GROUP, WP_LUSKANS, MOVE_FORCE_WALK );
}


//::///////////////////////////////////////////////////////////////////////////

void main( int nChoice )
{
	object oPC = GetPCSpeaker();

	switch( nChoice )
	{
		case 10:
			ActionPauseCutscene(PAUSE_TIME, TRUE);
			AssignCutsceneActionToObject(oPC, SponsorLeavesScene());
			break;

		case 20:
			HideSponsor(oPC);
			break;

		case 30:
			PopulateRosterNPC("bishop", SHANDRA_SP_TAG);
			break;

		case 40:
			ActionPauseCutscene( 8000, FALSE );
			AssignCutsceneActionToObject(oPC, BishopApproachesPC());
			break;

		case 50:
			SetupLuskvig();
			break;

		case 60:
			ActionPauseCutscene( PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, LuskvigApproachesPC() );
			break;

		case 70:
			AddRosterMemberToParty("bishop",oPC);
			//LuskvigleadGoesHostile();
			GroupGoHostile(LUSKAN_GROUP);
			GroupDetermineCombatRound(LUSKAN_GROUP);
			break;
	}
}