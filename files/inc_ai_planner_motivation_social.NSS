// inc_ai_planner_motivation_social
/*
	Description:
	
*/
// Name_Date

// TODO : DESTRUCTION OF CONTROLLER AND WPs

// TODO : THE WHOLE "SUBSCRIPTION TO CONTROLLER" METHOD FOR PC AND NPC IS LOUSY

#include "inc_ai_planner_const"
#include "inc_ai_planner_datacontroller"
#include "inc_ai_planner_worldstate"


// These are the main settings, free to edit
const float S_STATE_DECAY					= 0.95;
const int S_MAX_LOC_SEARCH_DEPTH			= 10;
const float S_DISTANCE_DOORS				= 4.0;
const float S_DELAY_DOORS					= 300.0;
const float S_CRISIS_WP_DISTANCE			= 30.0;
const float S_STATE_DEFAULT					= 0.0;
const float S_WP_NETWORK_DISTANCE			= 20.0; // defines the space between waypoints
	
	
	
const string GOAL_ESCAPE					= "GOAL_ESCAPE";
const string GOAL_STEP_AWAY					= "GOAL_STEP_AWAY";
const string GOAL_STAND						= "GOAL_STAND";
const string GOAL_FLEE						= "GOAL_FLEE";
const float E_PC_ATTACK_SCORE				= 5.0;
const float E_PC_DEATH_SCORE				= 10.0;
const float E_PC_PICKPOCKET_SCORE			= 0.95;
const float E_PC_HARM_SCORE					= 5.0;
const float E_PC_UNKNOW_SCORE				= 1.0;
const int E_PC_ATTACK						= 1;
const int E_PC_DEATH						= 2;
const int E_PC_PICKPOCKET					= 3;
const int E_PC_HARM							= 4;
const int E_PC_UNKNOW						= 5;
const string PC_CONTROLLER_WAYPOINT_RESREF	= "ai_planner_controller_waypoint";
const string PC_CONTROLLER_WAYPOINT_TAG		= "ai_planner_controller_waypoint";
const string PC_INTERACTION_REFERER_RESREF	= "ai_planner_controller";
const string PC_CONTROLLER_STORAGE_PASSIVE	= "PC_CONTROLLER_STORAGE_PASSIVE";
const string PC_CONTROLLER_STORAGE_ACTIVE_NEGATIVE	= "PC_CONTROLLER_STORAGE_ACTIVE_NEGATIVE";
const string PC_CONTROLLER_STORAGE_ACTIVE_POSITIVE	= "PC_CONTROLLER_STORAGE_ACTIVE_POSITIVE";
const string PC_CONTROLLER_WP_COUNT			= "PC_CONTROLLER_WP_COUNT";
const string PC_CONTROLLER_STATE			= "PC_CONTROLLER_STATE";
const string PC_CONTROLLER_WAYPOINT_ID		= "PC_CONTROLLER_WAYPOINT_ID";
const string PC_INTERACTION_REFERER			= "PC_INTERACTION_REFERER";
const string PC_INTERRACTION				= "PC_INTERRACTION";
const string V_LOCAL_STANCE					= "LOCAL_STANCE";
const string V_LOCAL_NEGATIVE_STAND			= "V_LOCAL_NEGATIVE_STAND";
const string PC_NPC_SCRIPT_HB				= "e_npc_script_hb";

const int  R_ESCAPE							= 0x10000000; // 268435456
const int  R_FLEE							= 0x01000000; // 16777216
const int  R_AVOID							= 0x00100000; // 1048576
const int  R_TALKSTRONG						= 0x00010000; // 65536
const int  R_NONE							= 0x00001000; // 4096
const int  R_WATCH							= 0x00000100; // 256
const int  R_CLAP							= 0x00000010; // 16
const int  R_ADORE							= 0x00000001; // 1



// **************************************************************
// Positions
// **************************************************************

location GetMiddleLocation( object oA, object oB ) {

	vector vA		= GetPosition( oA );
	//
	vector vB		= GetPosition( oB );

	vector v		= Vector( ( vA.x + vB.x ) / 2, ( vA.y + vB.y ) / 2, ( vA.z + vB.z ) / 2 );
	//
	float f			= ( GetFacing( oA ) + GetFacing( oB ) ) /2 ;
	//
	return Location( GetArea( oA ), v, f );
	
}
	


int GetIsCrisisWPClose( object oA, object oB ) {

	if( GetDistanceBetween( oA, oB ) > S_CRISIS_WP_DISTANCE ) return FALSE;
	
	return TRUE;
	
}

// **************************************************************
// Controller state
// **************************************************************


int InitiateInteractionControllerState( object oController ){

	SetLocalFloat( oController, PC_CONTROLLER_STATE, S_STATE_DEFAULT );
	//
	return TRUE;
	
}


float GetEventTypeScore( int nEvent ){

	float fResult;

	switch( nEvent ){
	
		case E_PC_ATTACK : fResult = E_PC_ATTACK_SCORE;
		break;
		
		case E_PC_DEATH : fResult = E_PC_DEATH_SCORE;
		break;
		
		case E_PC_HARM : fResult = E_PC_HARM_SCORE;
		break;
	
		case E_PC_PICKPOCKET : fResult = E_PC_PICKPOCKET_SCORE;
		break;
		
		default : fResult = E_PC_UNKNOW_SCORE;
		break;
		
	}
	
	return fResult;
	
}


float GetInteractionControllerState( object oController ){

	return GetLocalFloat( oController, PC_CONTROLLER_STATE );
	
}


int SetInteractionControllerState( object oController, float fState ){

	SetLocalFloat( oController, PC_CONTROLLER_STATE, fState );
	//
	return TRUE;
	
}


float UpdateInteractionControllerState( object oController, int nEvent ) {

	float fResult			= GetEventTypeScore( nEvent );
	//
	float fState			= GetInteractionControllerState( oController );

// PrettyDebug("Add:"+FloatToString( fResult )+" To:"+FloatToString( fState )	);

	if( fState == 0.0 ) 	SetInteractionControllerState( oController, fResult );
	
	else if( fState < 0.01 && fResult  < 0.01  )
		//
		fResult					+= fState;
		
	else if( fState > -0.01 && fResult > -0.01 )
		//
		fResult					+= fState;
		
	else if ( fState < 0.01 && fResult  > -0.01 ) // Aggressive act during positive interaction
		//
		fResult					= fResult;
		
	else return fState;
	
	SetInteractionControllerState( oController, fResult );
	//
	return fResult;

}



// **************************************************************
// Local Controller variable
// **************************************************************



void SetInteractionReferer( object oObject, object oReferer ) {

	SetLocalObject( oObject, PC_INTERACTION_REFERER, oReferer );

}


object GetInteractionReferer( object oObject ) {

	return GetLocalObject( oObject, PC_INTERACTION_REFERER );

}


object GetLocalController( object oNPC ){

	return GetLocalObject( oNPC, PC_INTERACTION_REFERER );
	
}



int UpdateControllerCounter( object oObject, int nCount ) {

	SetLocalInt( oObject, PC_CONTROLLER_WP_COUNT, nCount );
	//
	return nCount;
	
}


// **************************************************************
// Controller Waypoints
// **************************************************************


object CreateControllerWaypoint( object oObject, object oController ) {


	object oWP 			= CreateObject( OBJECT_TYPE_WAYPOINT, PC_CONTROLLER_WAYPOINT_RESREF, GetLocation( oObject )  );
	//
	int nCount		= GetLocalInt( oObject, PC_CONTROLLER_WP_COUNT );
	//
	UpdateControllerCounter( oController, ++nCount );
	//
	SetInteractionReferer( oWP, oController );
	//
	SetInteractionReferer( oObject, oController );
	//
// PrettyDebugObjectLocation( oWP );
	return oWP;

}

// Creates waypoints when required : for fleeing
// TODO : naming is unclear
object GetControllerWaypointProxy( object oObject ) {


	object oWP		 		= GetNearestObjectByTag( PC_CONTROLLER_WAYPOINT_TAG, oObject );
	//
	if( !GetIsObjectValid( oWP ) ) return OBJECT_INVALID;
	
	if( GetDistanceBetween( oWP, oObject ) < S_WP_NETWORK_DISTANCE )
	
		return oWP;
		
	object oController		= GetInteractionReferer( oObject );
	//
	if( !GetIsObjectValid( oController ) ) return OBJECT_INVALID;
	
	//
	oWP 					= CreateControllerWaypoint( oObject, oController );
	//
	SetInteractionReferer( oObject, oController );
	//
	return oWP;

}

// Creates waypoints when required : for fleeing
object GetInteractionWaypointNearest( object oObject ) {


	object oWP		 		= GetNearestObjectByTag( PC_CONTROLLER_WAYPOINT_TAG );
	
	if( !GetIsObjectValid( oWP ) ) return OBJECT_INVALID;
	
	return oWP;

}



// **************************************************************
// Controller Object
// **************************************************************


object CreateController( object oNPC, object oC ) {

	object oController 	= CreateObject( OBJECT_TYPE_PLACEABLE, PC_INTERACTION_REFERER_RESREF, GetLocation( oNPC ) );
	//
	object oWP 			= CreateObject( OBJECT_TYPE_WAYPOINT, PC_CONTROLLER_WAYPOINT_RESREF, GetMiddleLocation( oNPC, oC ) );
	//
	int nId				= UpdateControllerCounter( oController, 1 );
	//
	SetInteractionReferer( oWP, oController );
	//
	SetInteractionReferer( oNPC, oController );
	//
	InitiateInteractionControllerState( oController );
	//
	return oController;

}



// **************************************************************
// Controller's Lists
// **************************************************************


int AddToControllerList( object oController, string sStorageName, object oObject ) {
	
	string sId 			= GetCreatureUniqueId( oObject );
	//
	if( oObject 		== GetStorageObject( oController, sStorageName, sId )  ) return FALSE;
	
	AddToStorageObject( oController, sStorageName, sId, oObject );
	//
	return TRUE;

}


int GetIsInControllerList( object oController, string sStorageName, object oObject ) {
	
	string sId 			= GetCreatureUniqueId( oObject );
	//
	if( oObject 		== GetStorageObject( oController, sStorageName, sId )  ) return TRUE;
	
	else return FALSE;

}

int RemoveFromControllerList( object oController, string sStorageName, object oObject ) {
	
	string sId 			= GetCreatureUniqueId( oObject );
	//
	if( DeleteStorageLocalObject( oController, sStorageName, sId )  ) return TRUE;
	
	else return FALSE;

}

// Removes from Positive list if was in 
int AddToControllerListActiveNegative( object oController, object oObject ) {
	
	if( GetIsInControllerList( oController, PC_CONTROLLER_STORAGE_ACTIVE_POSITIVE, oObject ) )
	
		RemoveFromControllerList( oController, PC_CONTROLLER_STORAGE_ACTIVE_POSITIVE, oObject );
	
	
	return AddToControllerList( oController, PC_CONTROLLER_STORAGE_ACTIVE_NEGATIVE, oObject );
	
}



// **************************************************************
// Controller Requests
// **************************************************************



object GetControllerProxy( object oNPC ) {

	object oWP				= GetNearestObjectByTag( PC_CONTROLLER_WAYPOINT_TAG, oNPC );
//PrettyDebugLocation( GetLocation( oWP ), "green" );
	//
	if( !GetIsObjectValid( oWP ) || !GetIsCrisisWPClose( oWP, oNPC ) )

		return OBJECT_INVALID;
		
	return GetInteractionReferer( oWP );
	
}


object GetController( object oNPC, object oC ) {

	object oController		= GetLocalController( oNPC );
	//
	if( GetIsObjectValid( oController ) ) return oController;
		
	oController 		= GetControllerProxy( oNPC );

	if( GetIsObjectValid( oController ) ) return oController;
		
	oController 		= CreateController( oNPC, oC );
	
	return oController;
	
}


int GetNotifyPCInterractionRequestValid( object oNPC, object oC ) {
	
	if( 	( GetIsPC( oC )  || GetIsOwnedByPlayer( oC ) )
		&&  ( !GetIsDM( oC ) || !GetIsDMPossessed( oC ) )
	)
	
		return TRUE;
		
	return FALSE;
	
}


int AlertNPCs( object oNPC ) {

	int nNth			= 1;
	//
	object oC			= GetNearestCreature( CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oNPC, nNth,  CREATURE_TYPE_IS_ALIVE, CREATURE_ALIVE_TRUE );
	//
	while( GetIsObjectValid( oC ) && GetDistanceBetween( oC, oNPC ) < S_CRISIS_WP_DISTANCE ) {
		
		ExecuteScript( PC_NPC_SCRIPT_HB, oC );
		//
		oC			= GetNearestCreature( CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oNPC, nNth++ );
		
	}
	return TRUE;

} 


// TODO : this is to limit the amount of report per NPC per PC per type
// Current implementation is wrong
int GetHasReportedEventToController( object oController, object oNPC, int nEvent ) {

/*
	if( nEvent == GetLocalInt( oNPC, GetCreatureUniqueId( oController ) + "_EVENT_" + IntToString( nEvent ) ) )
	
		return FALSE;
		
	SetLocalInt( oNPC, GetCreatureUniqueId( oController ) + "_EVENT" + IntToString( nEvent ), 1 );
	//
*/
	return TRUE;

}


// Works only with active negative PCs interaction
int NotifyPCInterractionController( object oController, object oNPC, object oPC, int nEvent ){

	if( AddToControllerList( oController, PC_CONTROLLER_STORAGE_PASSIVE, oNPC ) )
	
		SetInteractionReferer( oNPC, oController );
		
	if( GetHasReportedEventToController( oController, oNPC, nEvent ) ) 
		
		UpdateInteractionControllerState( oController, nEvent );
	
	
	AddToControllerListActiveNegative( oController, oPC );
	//
	AlertNPCs( oNPC );
	//
	return TRUE;

}


/*
int	 NotifyPCInterraction( object oNPC, object oC, int nEvent ) {

	object oController		= GetControllerProxy( oNPC, oC );
PrettyDebug( "Object Controller : " + GetTag( oController ) );
	//	
	NotifyPCInterractionController( oController, oNPC, oC, nEvent );
	//
	return TRUE;	
}
*/

// TODO : check Reactions depending on Score and personal GOALS

int GetReactionTo( object oController, object oNPC ) {

	float fState 			= GetInteractionControllerState( oController );
	
	if( GetDistanceBetween( oNPC, GetFirstPC()) < 15.0 ){
		PrettyDebug( "fState:"	+ FloatToString( fState ) ); }
		
	if( fState > 25.0 ) 	return R_ESCAPE;
	if( fState > 5.0 ) 		return R_FLEE;
	
	object oWP 				= GetInteractionWaypointNearest( oNPC );
	if( GetDistanceBetween( oWP, oNPC ) > (fState<0.0?-fState:fState) * 5.0 ){
							return R_NONE;
	}
	if( fState > 1.0 ) 		return R_AVOID;
	if( fState > 0.1 ) 		return R_TALKSTRONG;
	if( fState > 0.0 ) 		return R_NONE;
	
	
	if( fState > -0.5 )		return R_WATCH;
	if( fState > -1.0 )		return R_CLAP;
	if( fState > -50.0 ) 	return R_ADORE;
	
	
	return TRUE;

}



// **************************************************************
// Animations
// **************************************************************

void SetCreatureStance( object oCreature, string sStance ) {

	SetLocalString( oCreature, V_LOCAL_STANCE, sStance );
	
}


string GetCreatureStance( object oCreature ) {

	return GetLocalString( oCreature, V_LOCAL_STANCE );
	
}


void SetNegativeStanding( object oCreature, int nStatus ) {

	SetLocalInt( oCreature, V_LOCAL_NEGATIVE_STAND, nStatus );
	
}	



int GetNegativeStanding( object oCreature ) {

	return GetLocalInt( oCreature, V_LOCAL_NEGATIVE_STAND );
	
}	