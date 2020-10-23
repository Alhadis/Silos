//::///////////////////////////////////////////////////////////////////////////
//::
//::	20a_cs_trial.nss
//::
//::	This file contains the cutscene actions for Conversation file 20_cs_trial.
//::
//::///////////////////////////////////////////////////////////////////////////
//::
//::	Created by: Brian Fox	
//::	Created on: 9/19/05
//::
//::///////////////////////////////////////////////////////////////////////////
#include "ginc_param_const"
#include "ginc_actions"




const int CUTSCENE_PAUSE_TIME = 5000;

const string NASHER_TAG = "Nasher";
const string OLEFF_TAG = "10_oleff";
const string NEVALLE_TAG = "Nevalle";
const string AMBAR_TAG = "ambar";
const string DEIRDRE_TAG = "deirdre";
const string NYA_TAG = "nya";
const string ALAINE_TAG = "alaine";
const string REYLENE_TAG = "reylene";
const string SHANDRA_TAG = "shandra";
const string CALLUM_TAG = "callum";
const string SIXER_TAG = "sixer";
const string LORNE_TAG = "lorne";
const string TORIO_TAG = "Torio";
const string CASAVIR_TAG = "cr_cas";

const string NASHER_WP_1_TAG = "wp_2023f_nasher_1";
const string OLEFF_WP_1_TAG = "wp_2023f_oleff_1";
const string PC_WP_1_TAG = "wp_2023f_pc_1";
const string SAND_WP_1_TAG = "wp_2023f_sand_1";
const string COURT_ENTRY_PREP_WP_TAG = "wp_2023f_entry_prep";
const string COURT_ENTRY_WP_TAG = "wp_2023f_entry";
const string THE_STAND_WP_TAG = "wp_2023f_witness";
const string EXIT_WP_TAG = "wp_2023f_exit";
const string CASAVIR_WP_1_TAG = "wp_2023f_cr_cas_wp_1";


void PCEntersCourtroomWithSand(object oPC)
{
	AssignCutsceneActionToObject( oPC, ActionMoveToObject(GetNearestObjectByTag(PC_WP_1_TAG),FALSE,1.5f));
	AssignCutsceneActionToObject( oPC, ActionOrientToTag(PC_WP_1_TAG, ORIENT_FACE_SAME_AS_TARGET ));
}	
	
void EmergencyJumpPC(object oPC)	//in case pathing failed.
{
	AssignCommand( oPC, JumpToObject(GetNearestObjectByTag(PC_WP_1_TAG)));
	AssignCommand( oPC, ActionOrientToTag(PC_WP_1_TAG, ORIENT_FACE_SAME_AS_TARGET ));
}


void WitnessEntersCourtroom( string sTag )
{
	object oWitness = GetTarget( sTag );
	if(GetScriptHidden(oWitness))
	{
		SetScriptHidden(oWitness,FALSE);
	}
	AssignCutsceneActionToObject( oWitness, ActionForceMoveToObject(GetNearestObjectByTag(COURT_ENTRY_WP_TAG),FALSE,0.f,15.f ));
}

void WitnessJumpsToStand( string sTag )
{
	object oWitness = GetTarget( sTag );
	object oTheStand = GetTarget( THE_STAND_WP_TAG );
	
	
	if(GetScriptHidden(oWitness))
	{
		SetScriptHidden(oWitness,FALSE);
	}
	AssignCutsceneActionToObject( oWitness, ActionJumpToObject(oTheStand) );	// We chose to jump the witness during a fade out/in for pace's sake.
}

void WitnessWalksToStand( string sTag )
{
	object oWitness = GetTarget( sTag );
	if(GetScriptHidden(oWitness))
	{
		SetScriptHidden(oWitness,FALSE);
	}
	AssignCutsceneActionToObject( oWitness, ActionForceMoveToObject(GetNearestObjectByTag(THE_STAND_WP_TAG),FALSE,0.f,10.f ));
}

void WitnessIsDismissed( string sTag, int bDestroy = TRUE )
{

	object oWitness = GetTarget( sTag );
	PrettyDebug("Dismissing witness " + sTag);
	/*if ( GetIsObjectValid(oWitness) == FALSE )
	{
		DebugPostString( GetPCSpeaker(), "ERROR: bad oWitness in WitnessIsDismissed!", 10, 10, 10.0f );
		return;
	}*/
	string sWPTag = "wp_2023f_" + sTag + "_1";
	//object oWP = GetTarget( sWPTag );
	
	AssignCutsceneActionToObject( oWitness, ActionForceMoveToObject(GetNearestObjectByTag(sWPTag),FALSE,0.f,10.f) );
	
	if(bDestroy)
	{
		PrettyDebug("Destroying witness.");
		AssignCutsceneActionToObject( oWitness, DestroyObject(OBJECT_SELF,0.1f));
	}
	else
	{
		PrettyDebug("Hiding witness.");
		AssignCutsceneActionToObject(oWitness, SetScriptHidden(oWitness,TRUE,FALSE));
	}
}

void SandBowsToNasher()
{
	object oSand = GetTarget( "sand" );

	AssignCutsceneActionToObject( oSand, ActionOrientToTag(NASHER_TAG) );
	AssignCutsceneActionToObject( oSand, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW) );
}

void NPCExitsCourtroom( string sTag )
{
	object oNPC = GetTarget( sTag );
	AssignCutsceneActionToObject( oNPC, ActionForceMoveToTag(EXIT_WP_TAG) );
}


void FixShandraLocation()
{
	object oShandra = GetTarget("shandra");
	object oWP = GetNearestObjectByTag("wp_2023f_shandra_1", oShandra);
	
	AssignCommand(oShandra, JumpToObject(oWP));
	AssignCommand(oShandra, SetFacing(GetFacing(oWP)));	
}

void FixCasavirLocation()
{
    object oCasavir = GetTarget("cr_cas");
	object oWP = GetNearestObjectByTag("wp_2023f_cr_cas_wp_1", oCasavir);
	
	AssignCommand(oCasavir, JumpToObject(oWP));
	AssignCommand(oCasavir, SetFacing(GetFacing(oWP)));
}

void UnhideParty(object oPC)
{
	object oFM = GetFirstFactionMember(oPC,FALSE);
	
	while(GetIsObjectValid(oFM))
	{
		SetScriptHidden(oFM,FALSE);
		oFM = GetNextFactionMember(oPC,FALSE);
	}
}

void main( int nChoice, string sTag = "" )
{
	object oPC = GetPCSpeaker();
	object oTarget;

	switch( nChoice )
	{
		if ( sTag != "" )	// some error checking for non "" parameter
		{
			oTarget = GetTarget( sTag );
			if ( GetIsObjectValid(oTarget) == FALSE )
			{	
				DebugPostString( oPC, "ERROR: bad tag passed to main", 10, 10, 10.0f );
				return;
			}
		}

		case 1:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
				// sit, Nasher.  Good boy.
			oTarget = GetNearestObjectByTag(NASHER_TAG,oPC);
			AssignCommand(oTarget,SetFacing(90.f,TRUE));	//lock orientation
			break;

		case 10:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, PCEntersCourtroomWithSand(oPC) );
			break;
		case 11:
			EmergencyJumpPC(oPC);
			break;

		case 20:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, WitnessEntersCourtroom(sTag) );
			break;

		case 30:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, WitnessJumpsToStand(sTag) );
			break;

		case 40:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, WitnessWalksToStand(sTag) );
			break;

		case 50:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, WitnessIsDismissed(sTag) );
			break;

		case 51: 
			FixShandraLocation(); //put her back on her waypoint after testifying
			break;
			
		case 52:
		    FixCasavirLocation(); //put him back on his waypoint after testifying
			break;

		case 60:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, SandBowsToNasher() );
			break;

		case 70:
			ActionPauseCutscene( CUTSCENE_PAUSE_TIME, FALSE );
			AssignCutsceneActionToObject( oPC, NPCExitsCourtroom(sTag) );
			break;
			
		case 80:
			UnhideParty(oPC);
			break;
		case 90:
			ActionPauseCutscene(CUTSCENE_PAUSE_TIME,FALSE);
			AssignCutsceneActionToObject(oPC, WitnessIsDismissed(sTag,FALSE));
			break;
	}
}