// ftpath_library
/*
	Description: FTP - Fast Transarea Pathfinding System Library
	
	This is the file you need to include whenever you want to use FTP
	
	This system uses the autonomous executable binary tool outputs
	providing a fast way to navigate npcs through your areas.
	
	Each area is identified by an integer.
	
	
	1. Using 2DA, a caching method must be added to your module onload event
	   in order to provide a static storage of areas ID
	
	ftp_BuildCache(); performs this cache building
	
	
	2. NPC navigation will use that cache to query your roadmap   
	
	ftp_ActionForceMoveToObject(); performs the query and the locomotion action 
	
	The roadmap storage is actually 2DA though using SQL should be easy.
	
*/
// 110219_Alban

// Basic debugging/logging library
#include "ginc_debug"

// Contains the system's settings
#include "ftpath_conf"

// This is the tokenizer I'm using, cf. BrianMeyerDesign/Pain credit
// If you don't know what it is, nevermind
// If you're using one already, see the tokenizer functions of this file
// in order to replace with your own system as you please
#include "ftpath_csl_tokenizer"



 
//	Adds to current's creature's action queue a move to the best transition 
//  in area if oObject is not in area and a road is available
//	Moves to object within area once the creature reaches final area.
//	@return boolean false if no move was possible 
int ftp_ActionForceMoveToObject( object oTarget, int bRun=TRUE, object oCreature = OBJECT_SELF );


//  Does the Areas ID caching job. Place on module load. 
void ftp_BuildCache();


void ftp_BuildCache() 
{

	string sTag;
	
	int nIterator;
	
	int nAreasCount			= GetNum2DARows( FTP_LIST_V_2DA );
	
	if( -1 == nAreasCount ){
		
		PrettyDebug( "!!!FTP System Error !!! Couldn't load the Areas List Storage");
	
		return;
		
	}
	else{		PrettyDebug( "FTP System loads the Areas List Storage");
}
	
	for( nIterator = 0; nIterator < nAreasCount; nIterator++ )
	{
		
		sTag 				= Get2DAString( FTP_LIST_V_2DA, "TAG", nIterator );
		
		PrettyDebug( "FTP System adds " +sTag+ " #" + IntToString(nIterator) );
		
		
		SetLocalInt( GetObjectByTag( sTag ), AREA_ID, nIterator );

	}

}

/*
int ftp_GetRoundsStuck ( object oNPC )
{
	return GetLocalInt( oNPC, VAR_ROUNDS );
}

void ftp_SetRoundsStuck ( object oNPC, int nRounds )
{
	SetLocalInt( oNPC, VAR_ROUNDS, nRounds );
}
*/


// Checks if PC moved as he's supposed to
int ftp_GetIsStucked( object oNPC )
{

	location lPreviousLocation = GetLocalLocation( oNPC, PREVIOUS_LOCATION );
	//
	location lCurrentLocation =	GetLocation( oNPC ) ;
	//
	SetLocalLocation( oNPC, PREVIOUS_LOCATION, lCurrentLocation);
	//
	if( GetDistanceBetweenLocations( lPreviousLocation, lCurrentLocation ) < 0.01 ) 
		//
		return TRUE;
	
//	ftp_SetRoundsStuck( oNPC, 0 );
	//
	return FALSE;
}

// Open 
void ftp_SetDoorOpen( object oDoor )
{
	if( GetIsOpen( oDoor ) ) return;
	
	AssignCommand( oDoor, ClearAllActions() );

	AssignCommand( oDoor, ActionOpenDoor( oDoor ) );

}


// Opens or try to destroy any door that would block path
void ftp_CheckNearbyDoors( object oNPC ) 
{
PrettyMessage("ftp_CheckNearbyDoors opens nearby doors running for "+ GetName( oNPC ) );

	int nNth = 1;

	object oDoor = GetNearestObject( OBJECT_TYPE_DOOR, oNPC, nNth );
	
	while( GetIsObjectValid( oDoor ) &&  GetDistanceBetween( oDoor, oNPC ) < DISTANCE_DOORS )
	{
		if( GetLocked( oDoor ) )
		{

			string sKey = GetLockKeyTag( oDoor );
			
	        object oKey = GetItemPossessedBy(oNPC, sKey);
			
			if (sKey != "" && GetIsObjectValid(oKey)) 
			{
				SetLocked(oDoor, FALSE);
				
				DelayCommand( 2.0, SetLocked( oDoor, TRUE ) );
			}
			else if ( !GetPlotFlag( oDoor ) && !GetImmortal( oDoor ) )
			{
			
//				AssignCommand( oNPC, ClearAllActions( ) );
			
//				AssignCommand( oNPC, ActionAttack( oDoor ) );	
			
			}
		
		}			
		
		if(  !GetIsOpen( oDoor ) ){
PrettyMessage( GetName( oNPC ) + " opens nearby doors ");
			//
			ftp_SetDoorOpen( oDoor );
			//
			AssignCommand( oDoor, DelayCommand( DELAY_DOORS, ActionCloseDoor( oDoor ) ) );
		
		}
		oDoor = GetNearestObject( OBJECT_TYPE_DOOR, oNPC, ++nNth );
	}

}


// @return Area 2DA Id
int ftp_GetAreaId( object oArea )
{
	return GetLocalInt( oArea, AREA_ID );
}


// Uses stored target object of creature to port the creature
void ftp_JumpCreatureToDestination( object oNPC )
{
	
	AssignCommand( oNPC, ActionJumpToObject( GetTransitionTarget(  GetLocalObject( oNPC,FTP_TARGET ) ) ) );

}


// Returns the best transition for oCreature to reach target
// @params : AreaTo, AreaFrom
// @return : Transition object
object ftp_GetTransitionObject( object oCreature, object oAreaFrom, object oAreaTo )
{
	PrettyDebug("ftp_GetTransitionObject starts with " + GetTag( oCreature ) +":"+ GetTag( oAreaFrom ) +"->"+ GetTag( oAreaTo ) );

	float 	fDistance, fBestDistance = 99999.0;
	int 	i;
	int 	nAreaFrom; 
	int		nAreaTo;
	int		nWeight;
	int		nCountTransitions;
	object 	oSolution;
	object 	oTheTransition;
	string 	sTransitions;
	string	s2DAString;
	string	sBestTransition;
	struct 	sCSLStringTokenizer stTok;
		
	nAreaFrom 				= ftp_GetAreaId( oAreaFrom );
	nAreaTo 				= ftp_GetAreaId( oAreaTo );
	s2DAString				= Get2DAString( FTP_PATH_2DA, IntToString(nAreaTo), nAreaFrom );
	
	// Parse the roadmap result "weight:trans_1,trans_2,more"
	nWeight 				= StringToInt( CSLGetTokenByPosition( s2DAString, ":", 0 ) );
	sTransitions			= CSLGetTokenByPosition( s2DAString, ":", 1 );
	
	PrettyDebug("ftp_GetTransitionObject : s2DAString " + s2DAString +"=" + IntToString(nWeight)+":"+sTransitions);
	
	// Safety drop : no transition 
	if( "" == sTransitions ){
		// No result
		PrettyDebug("ftp_GetTransitionObject : no Transition "   );
		return OBJECT_INVALID;
	}
	
	// Safety drop : single transition 
	nCountTransitions = CSLGetNumberTokens( sTransitions, "," );
	if(nCountTransitions == 1 ){
		// 1 result
		PrettyDebug("ftp_GetTransitionObject : one Transition " + sTransitions );
		return GetNearestObjectByTag( sTransitions, oCreature );
	}
	
		PrettyDebug("ftp_GetTransitionObject : found " + IntToString( nCountTransitions ) +" transitions" );
	// Parse the transitions list	
	for( i = 0; i < nCountTransitions; i++  ){
	
		oTheTransition 		= GetObjectByTag( CSLGetTokenByPosition( sTransitions, ",", i ) );
		PrettyDebug("ftp_GetTransitionObject : parsing " + CSLGetTokenByPosition( sTransitions, ",", i ) +"#"+IntToString(i) );
		if( !GetIsObjectValid( oTheTransition ) ){
			continue;
		}
		fDistance			= GetDistanceBetween( oTheTransition, oCreature );
		if( fDistance < fBestDistance ) {
			fDistance 		= fBestDistance;
			oSolution		= oTheTransition;
		}
		
	}
	
	/*	object oTrans = GetObjectByTag( Get2DAString( FTP_LIST_V_2DA, sAreaTo, nAreaFrom ) );
	
	if( !GetIsObjectValid( oTrans ) )
	
		PrettyMessage("Transition : " + IntToString(nAreaFrom) + " / " + sAreaTo + " not valid.");
*/
	PrettyDebug("ftp_GetTransitionObject returns transition with tag " + GetTag( oSolution ) );

	return oSolution;

}


// Encapsulates ftp_ActionForceMoveToObject
void ftp_EncAFMTO( object oTarget, int bRun=TRUE, object oCreature = OBJECT_SELF  )
{
 	ftp_ActionForceMoveToObject( oTarget, bRun,oCreature );
}


string ftp_GetTarget( object oCreature ){

	return	GetLocalString( oCreature, FTP_TARGET );
	
}

void ftp_SetTarget( object oCreature, string sTarget ){

	SetLocalString( oCreature, FTP_TARGET, sTarget );
	
}
 
int ftp_ActionForceMoveToObject( object oTarget, int bRun=TRUE, object oCreature = OBJECT_SELF  ){


	if( IsInConversation( oCreature ) ) {
	
	}
	if( !GetIsObjectValid( oTarget ) ) {
		PrettyDebug("ftp_ActionForceMoveToObject invalid target for caller " + GetName(oCreature) );
		return FALSE;
	}
	if( !GetIsObjectValid( oCreature ) ) {
		PrettyDebug("ftp_ActionForceMoveToObject invalid caller for target " + GetName(oTarget) );
		return FALSE;
	}
	PrettyDebug("ftp_ActionForceMoveToObject starting" );

	int		nTargetType;
	object	oCreature 			= OBJECT_SELF;
	object	oAreaTo 			= GetArea( oTarget );
	object 	oAreaFrom 			= GetArea( oCreature );
	object 	oTransition;
	
	AssignCommand( oCreature, ClearAllActions() );
	ftp_CheckNearbyDoors( oCreature );
	
	// Am I stuck ?
	if( ftp_GetIsStucked( oCreature ) ){
	
		PrettyDebug("ftp_ActionForceMoveToObject Creature stucked : " + GetTag( oCreature ) );
	
		// Shall I teleport to destination ?
		ftp_JumpCreatureToDestination( oCreature );
		
		// Shall I seek for another transition ?
	}
		
	// Am I in the destination area ?
	if( oAreaFrom == oAreaTo ){
		PrettyDebug("ftp_ActionForceMoveToObject Creature in final area : " + GetTag( oAreaTo ) );
		AssignCommand( oCreature, ActionForceMoveToObject( oTarget, bRun ) );
		return TRUE;
	}
	
	// Is a road available ?
	oTransition 				= ftp_GetTransitionObject( oCreature, oAreaFrom, oAreaTo );
	if( GetIsObjectValid( oTransition ) ){
		PrettyDebug("ftp_ActionForceMoveToObject road available : " + GetTag(oTransition));
		if ( OBJECT_TYPE_TRIGGER == GetObjectType( oTransition ) )
		{
			PrettyDebug("ftp_ActionForceMoveToObject heading to trigger ");
			if( GetDistanceBetween( oCreature, oTransition ) < DISTANCE_DOORS ){
				AssignCommand( oCreature, ActionJumpToObject( GetTransitionTarget( oTransition ) ,TRUE ) );
			}
			AssignCommand( oCreature, ActionForceMoveToObject( oTransition, bRun, 0.1 ) );
		}
		AssignCommand( oCreature, ActionForceMoveToObject( oTransition, bRun ) );
		AssignCommand( oCreature,ActionInteractObject( oTransition ) );
	}
	
	// Shall I teleport to destination ?

	PrettyDebug("ftp_ActionForceMoveToObject returns " );
	ftp_SetTarget(oCreature, GetTag( oTarget ) );
	DelayCommand( FTP_CREATURE_DELAY, ftp_EncAFMTO( GetObjectByTag( ftp_GetTarget(oCreature)), bRun,oCreature ) );
	
	return TRUE;
}




void TestAreasId()
{

	object oArea = GetFirstArea();
	
	while( GetIsObjectValid( oArea ) )
	{
		
		PrettyMessage("Area : " + GetTag( oArea ) + " has id : " + IntToString( GetLocalInt(oArea , AREA_ID ) ) );
		
		oArea = GetNextArea();
	
	}

}