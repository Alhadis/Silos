// inc_ai_planner_motivation_combat
/*
	Description:
	
*/
// Name_Date



#include "inc_ai_planner_const"
#include "inc_ai_planner_datacontroller"
#include "inc_ai_planner_locomotion"
#include "inc_ai_planner_worldstate"
#include "inc_ai_planner_motivations_limit"
#include "NW_I0_GENERIC"
#include "km_get_faction"


int QualifyLocationDigPositionSurroundWP(object oWP, object oCombatController );
int AddToCombatControllerEnemy( object oNPC, object oEnemy );
object GetCombatControllerProxy( object oNPC );
int	GetCombatControllerFlagHarmed( object oCombatController );
int	GetCombatControllerFlagPerceived( object oCombatController );
int DestroyCombatController( object oCombatController );

// **************************************************************
// Utilities
// **************************************************************

// Helps avoiding divide by Zero errors
float _safeDivide( float fDivident, float fDivisor ){

	if( fDivisor == 0.0 ) {
		fDivisor = 0.01;
	}
	//PrettyDebug( "_safeDivide : " + FloatToString( fDivident ) +":"+FloatToString( fDivisor) );
	return fDivident / fDivisor;
	
}


// Throttles the result of f1:f2 to make it under fLimit	
float CapDivide( float f1, float f2, float fLimit ){
	float fRes 					= _safeDivide( f1, f2 );
	if( fRes > fLimit )
		return fLimit;
	return fRes;
}


// Retrieves the faction of an npc
// You might want to adapt that
int GetFaction( object oNPC ){

	// Uses Knightmare's function, kudos to him
	int nFaction	= KnightmareGetFaction( oNPC );
	//PrettyDebug("GetFaction::"+GetName(oNPC)+" has faction "+IntToString(nFaction));
	return KnightmareGetFaction( oNPC );
	
}


int PrettyDebugWPStorage( object oCombatController, string sArrayName ){

	object oStorage	= GetStorage( oCombatController, sArrayName );
	int nCount 		= GetStorageCount( oCombatController, sArrayName );
	int nI;
	object oWP;
	for( nI = 0; nI < nCount; nI++){
	
		oWP = GetVariableValueObject( oStorage, nI );
		//PrettyDebugObjectLocation( oWP );
		
	}

	return FALSE;

}




// **************************************************************
// General exploration variables
// **************************************************************



// Returns size of WP storage
int GetExploreWPCount( object oCombatController ){

	int nExploreWPCount 			= GetStorageCount( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
	//PrettyDebug( "GetExploreWPCount::nExploreWPCount "+IntToString( nExploreWPCount ) );
	return nExploreWPCount;
	
}


// Increments a counter on combat controller to throttle the total amount of explorations
int GetMaxExplorationReached( object oCombatController ){

	int nNth	= GetLocalInt( oCombatController, VAR_NTH_EXPLORATION );
	SetLocalInt( oCombatController, VAR_NTH_EXPLORATION, ++nNth);
	//PrettyDebug( "GetMaxExplorationReached::Nth search:"+IntToString( nNth ));
	if( nNth >= PARAM_MAX_EXPLORATION ){
		return TRUE;
	}else{
		return FALSE;
	}

}
// **************************************************************
// Controller Data : variables
// **************************************************************

// ##############################
// 
// ##############################




// Reads team count stored on controller
int GetTeamCount( object oCombatController ){

	int nTeamCount 	= GetStorageCount( oCombatController, STORAGE_TEAM_MEMBERS );
	//PrettyDebug("GetTeamCount::nTeamCount="+IntToString(nTeamCount));
	return nTeamCount;
}

// Reads the storage to retrieve the quantity of team members
int SetTeamCount( object oCombatController ){

	int nTeamCount 		= GetStorageCount( oCombatController, STORAGE_TEAM_MEMBERS );
	SetLocalInt( oCombatController, VAR_TEAM_COUNT, nTeamCount );
	//PrettyDebug("GetTeamData:: TeamCount : "+IntToString( nTeamCount ) );
	return nTeamCount;
}



// Reads enemy count stored on controller
int GetEnemyCount( object oCombatController){

	return GetLocalInt( oCombatController, VAR_ENEMY_COUNT );
	
}
// Reads the storage to retrieve the quantity of enemy members
int SetEnemyCount( object oCombatController){
	
	int nEnemyCount 		= GetStorageCount( oCombatController, STORAGE_ENEMY_MEMBERS );
	SetLocalInt( oCombatController, VAR_ENEMY_COUNT, nEnemyCount );
	return nEnemyCount;
	
}

// Returns an arbitrary factor depending on the BAB
float GetAttackFactor( int nBAB ){

	if( nBAB == 0 ){
	
		return		0.5;
		
	}
	if( nBAB >= 26 ){
	
		return		4.0 + nBAB/20;
		
	}
	switch( nBAB / 5 ){
	
	 	case 0: return 0.5;
	 	case 1: return 1.0;
	 	case 2: return 1.5;
	 	case 3: return 2.25;
	 	case 4: return 3.0;
	 	case 5: return 4.0;
	
	}
	return 0.1;
}

// Calculates the average amount of damage for a given creature
// This could be a real challenge to do right... so 10% should be enough ;D
int GetAverageDamage( object oNPC ){

	if( !GetIsObjectValid( oNPC ) ) return 0;
	
	// Use cache when available
	int nAverageDamage		= GetLocalInt( oNPC, VAR_AVERAGE_DAMAGE );
	if( nAverageDamage ){
		return nAverageDamage;
	}
	
	int nBAB				= GetBaseAttackBonus( oNPC );
	float fAttackFactor		= GetAttackFactor( nBAB );
	int nLevel				= GetHitDice( oNPC );
	
	// This will be 1.0 for warriors, and close to 0.5 for casters
	// 0.1 added to avoid 0 multiplier
	// @see http://nwn2.wikia.com/wiki/Base_attack_bonus
	//
	float fDangerous		= ( nBAB == 0 ? 0.1 : IntToFloat(nLevel) / nBAB );
	
	// Let's say we deal a minimum damage of 2*level per round
	nAverageDamage			= FloatToInt( fAttackFactor*fDangerous*nLevel*2 );
	SetLocalInt( oNPC, VAR_AVERAGE_DAMAGE, nAverageDamage );
	//PrettyDebug("GetAverageDamage::"+GetName(oNPC)+" deals "+IntToString( nAverageDamage )+" damage");
	return nAverageDamage;
	
}

// Defines team's Hitpoints and Damages per round
int SetTeamCombatInfo( object oCombatController ){

	int nCount 			= GetTeamCount( oCombatController );
	object oS			= GetStorage( oCombatController, STORAGE_TEAM_MEMBERS );
	object oNPC;
	int nIterator, nTotalHP, nTotalDamage;
	for( nIterator=nCount-1; nIterator>=0; nIterator--){
		oNPC			=  GetVariableValueObject( oS, nIterator );
		nTotalHP		+= GetCurrentHitPoints(oNPC);
		nTotalDamage	+= GetAverageDamage( oNPC );
	}
	//PrettyDebug("SetTeamCombatInfo::nTotalDamage="+IntToString(nTotalDamage)+" nTotalHP"+IntToString(nTotalHP));
	SetLocalInt( oCombatController, VAR_COMB_CONT_DAM_TEAM, nTotalDamage );
	SetLocalInt( oCombatController, VAR_COMB_CONT_HP_TEAM, nTotalHP );
	return FALSE;	
}


// Defines enemy team's Hitpoints and Damages per round
int SetEnemyCombatInfo( object oCombatController ){

	int nCount 			= GetEnemyCount( oCombatController );
	object oS			= GetStorage( oCombatController, STORAGE_ENEMY_MEMBERS );
	//PrettyDump(oS);
	object oNPC;
	int nIterator, nTotalHP, nTotalDamage;
	for( nIterator=nCount-1; nIterator>=0; nIterator--){
		oNPC			=  GetVariableValueObject( oS, nIterator );
		//PrettyDebug("SetEnemyCombatInfo::nIterator="+IntToString(nIterator)+" Enemy="+GetTag(oNPC));
		nTotalHP		+= GetCurrentHitPoints(oNPC);
		nTotalDamage	+= GetAverageDamage( oNPC );
	}
	//PrettyDebug("SetEnemyCombatInfo::nTotalDamage="+IntToString(nTotalDamage)+" nTotalHP"+IntToString(nTotalHP));
	SetLocalInt( oCombatController, VAR_COMB_CONT_DAM_ENEMY, nTotalDamage );
	SetLocalInt( oCombatController, VAR_COMB_CONT_HP_ENEMY, nTotalHP );
	return FALSE;	
}



// Assigns faction to controller
int SetCombatControllerFaction( object oCombatController, int nFaction ){

	SetLocalInt( oCombatController, VAR_CONTROLLER_FACTION, nFaction );
	return FALSE;

}

// Retrieves faction for controller
int GetCombatControllerFaction( object oController ){

	return GetLocalInt( oController, VAR_CONTROLLER_FACTION );

}

// Performs calculations regarding the NPC team :
// . Team count
// . Team combat info
int GetTeamData( object oCombatController ){

	// if empty team, destroy controller
	if( !SetTeamCount( oCombatController ) ){
		DestroyCombatController( oCombatController );
	}
	SetTeamCombatInfo( oCombatController );
	return FALSE;

}

// Returns TRUE if oNPC has any sort of invisibilty
// Code by LaGazelle, Sunday, 16 July 2006, on Bioboards
int GetIsInvisible( object oNPC )
{
    if(GetHasEffect(EFFECT_TYPE_INVISIBILITY, oNPC)
    || GetHasEffect(EFFECT_TYPE_ETHEREAL, oNPC)
    || GetActionMode(oNPC, ACTION_MODE_STEALTH))
        return TRUE;
    if(GetHasSpellEffect(SPELL_DARKNESS, oNPC))
    {
        if(GetHasSpellEffect(SPELL_DARKVISION, oNPC)
        || GetHasSpellEffect(SPELL_TRUE_SEEING, oNPC)
        || GetHasFeat(FEAT_BLIND_FIGHT, oNPC))
            return TRUE;
    }
    return FALSE;
}


// Returns TRUE if oNPC detects a hidden oEnemy 
// provided both are within range
int GetIsDetected( object oNPC, object oEnemy )
{
	if( GetHasSpellEffect(SPELL_TRUE_SEEING, oNPC)){
		return TRUE;}
	if(GetHasEffect(EFFECT_TYPE_ETHEREAL, oEnemy)){
		return FALSE;}
	if( GetHasSpellEffect(SPELL_DARKNESS, oEnemy)){
		if( !GetHasSpellEffect(SPELL_DARKVISION, oNPC)
	        && !GetHasFeat(FEAT_BLIND_FIGHT, oNPC)){
			return FALSE;}
	}
	if(GetHasEffect(EFFECT_TYPE_SEEINVISIBLE, oNPC)
	|| GetHasFeat(FEAT_SCENT, oNPC)){
		return TRUE;}
 	if( GetIsSkillSuccessful( oNPC, SKILL_LISTEN, GetSkillRank( SKILL_MOVE_SILENTLY, oEnemy ) ) ){
		return TRUE;}
		
	return FALSE;

}

// Returns TRUE if oNPC can detect oEnemy
int GetIsCreaturePerceived( object oNPC, object oEnemy ){

	//PrettyDebug("GetIsCreaturePerceived::oNPC="+GetName( oNPC)+" oEnemy:"+GetName(oEnemy));
	// Are both creature within perception distance
	if( GetDistanceBetween( oNPC, oEnemy ) > PARAM_PERCEPTION_DISTANCE ){
		return FALSE;}
	// Get if oEnemy is hiding
	if( !GetIsInvisible( oEnemy )){
		return TRUE;}
	// Get if oEnemy is detected
	if( GetIsDetected( oNPC, oEnemy )){
		return TRUE;}
	return FALSE;
	
}

// Watches on the map for enemies
// Executed once for each RunControllerLoop
int LookForEnemies( object oCombatController ){

	// Use our first member as "faction pig"
	object oTeamStorage		= GetStorage( oCombatController, STORAGE_TEAM_MEMBERS );
	object oEnemyStorage	= GetStorage( oCombatController, STORAGE_ENEMY_MEMBERS );
	object oNPC				= GetVariableValueObject( oTeamStorage, 0 );
	object oSameFaction; // Stores creatures of our faction which might not be part of our team
	int nIterator; // Iterator used for 2nd loop
	int bSolved; // Stores the search result
	
	// Look for the first hostile creature on the map
	int nNth 				= 1;
	object oEnemy 			= GetNearestCreature( CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oNPC, nNth, CREATURE_TYPE_IS_ALIVE, CREATURE_ALIVE_TRUE );
	while( GetIsObjectValid( oEnemy ) ) {
	
		//PrettyDebug("LookForEnemies::Loop nNth="+IntToString( nNth)+" Creature:"+GetName(oEnemy));
		// If hostile creature already belongs to our list, skip to next hostile
		if( !GetIsObjectValid( GetLocalObject( oEnemyStorage, GetObjectUniqueId( oEnemy ) ) ) ){
		
			//PrettyDebug("LookForEnemies: :"+GetName( oNPC )+" NOT IN MY ENEMY LIST "+GetName( oEnemy)+"");
			// Get the nearest same faction creature on the map starting from our hostile
			nIterator		= 1;
			bSolved			= FALSE;
			oSameFaction	= GetNearestCreature( CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oEnemy, nIterator, CREATURE_TYPE_IS_ALIVE, CREATURE_ALIVE_TRUE );
			while( GetIsObjectValid( oSameFaction ) && !bSolved ) {
					
				//PrettyDebug("LookForEnemies::Loop Iterator="+IntToString( nIterator)+" Creature:"+GetName(oSameFaction));
				// If the creature is not in our team, move on
				if( GetIsObjectValid( GetLocalObject( oTeamStorage, GetObjectUniqueId( oSameFaction ) ) ) ){
				//PrettyDebug("LookForEnemies:: "+GetName( oNPC )+" IN MY TEAM "+GetName( oSameFaction)+"");
				
					// If the creature can be perceived, add it to our enemy's list
					if( GetIsCreaturePerceived( oSameFaction, oEnemy )  ){
						PrettyDebug("LookForEnemies::ADDED "+GetName(oEnemy));
						AddToCombatControllerEnemy( oSameFaction, oEnemy );
						bSolved	= TRUE;
					} 
				
				}
			
				oSameFaction	= GetNearestCreature( CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oEnemy, ++nIterator, CREATURE_TYPE_IS_ALIVE, CREATURE_ALIVE_TRUE );
			}
		}
	
		oEnemy 			= GetNearestCreature( CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oNPC, ++nNth, CREATURE_TYPE_IS_ALIVE, CREATURE_ALIVE_TRUE );
	}	
	return FALSE;
}

// Performs a high level "search and sort" of enemies data
// Updates the enemy storage
int UpdateEnemyScope( object oCombatController ){

	return FALSE;
	
}


// Performs calculations regarding the enemy team 
// . Enemy Count
int GetEnemyData( object oCombatController ){
	
	LookForEnemies( oCombatController );
	if(!SetEnemyCount( oCombatController )){
		return FALSE;
	}
	UpdateEnemyScope( oCombatController );
	SetEnemyCombatInfo( oCombatController );
	return TRUE;

}


// **************************************************************
// Controller basics : instancing, deleting, adding, removing
// **************************************************************


// Attemps to retrieve the locally stored combat controller
object GetCombatControllerProxyCache( object oNPC ){

	return GetLocalObject( oNPC, VAR_OBJ_COMB_CONT );
	
}


// Adds PC to oNPC controller
int AddToCombatControllerEnemy( object oNPC, object oEnemy ){

	object oCombatController 	= GetCombatControllerProxy( oNPC );
	string sVar					= GetObjectUniqueId( oEnemy );
	if( !GetIsObjectValid( GetStorageObject( oCombatController, STORAGE_ENEMY_MEMBERS, sVar ) ) ){
		return AddToStorageObject( oCombatController, STORAGE_ENEMY_MEMBERS, sVar, oEnemy );
	}
	PrettyDump( GetStorage( oCombatController, STORAGE_ENEMY_MEMBERS ) );
	return FALSE;
}


// Removes PC from controller
int RemoveFromCombatControllerEnemy( object oNPC, object oCreature ){

	object oCombatController 	= GetCombatControllerProxy( oNPC );
	string sVar					= GetObjectUniqueId( oCreature );
	return DeleteStorageLocalObject( oCombatController, STORAGE_ENEMY_MEMBERS, sVar );

}


// Adds NPC to controller
int AddToCombatController( object oCombatController, object oNPC ){

	string sId 			= GetCreatureUniqueId( oNPC );
	
	// Quit if already added
	if( oNPC 		== GetStorageObject( oCombatController, STORAGE_TEAM_MEMBERS, sId )  ){
	 	//PrettyDebug("AddToCombatController::EXIT WITH EXISTING NPC");
	 	return FALSE;
	}
			
	// Adds oNPC to Controller's Team Storage 
	AddToStorageObject( oCombatController, STORAGE_TEAM_MEMBERS, sId, oNPC );
	
	// Binds controller to NPC
	SetLocalObject( oNPC, VAR_OBJ_COMB_CONT, oCombatController );
	
	// Increment static count of all team members 
	SetLocalInt( oCombatController, VAR_COUNT_ALL, 1 + GetLocalInt( oCombatController, VAR_COUNT_ALL ) );
	//PrettyDebug("AddToCombatController::Adding "+GetName( oNPC)+" => All="+IntToString(GetLocalInt( oCombatController, VAR_COUNT_ALL )) );

	//PrettyDump( GetStorage( oCombatController, STORAGE_TEAM_MEMBERS ) );
	//PrettyDebug("AddToCombatController::ADDED NPC WITH UID="+sId);
	return TRUE;

}


// Removes NPC from controller
int RemoveFromCombatController( object oNPC ){

	object oCombatController 	= GetCombatControllerProxyCache( oNPC );
	string sGUID				= GetObjectUniqueId( oNPC );
	SetLocalInt( oCombatController, VAR_COUNT_DEAD, 1 + GetLocalInt( oCombatController, VAR_COUNT_DEAD ) );
	//PrettyDebug("RemoveFromCombatController::Removing "+sGUID+":"+GetName( oNPC)+" => Deaths="+IntToString(GetLocalInt( oCombatController, VAR_COUNT_DEAD )) );
	return DeleteStorageLocalObject( oCombatController, STORAGE_TEAM_MEMBERS, sGUID );

}


// Destroys object and all its storages
int DestroyCombatController( object oCombatController ){
	
	DestroyStorage( oCombatController, STORAGE_COMBAT_STRATEGIES );
	DestroyStorage( oCombatController, STORAGE_TEAM_MEMBERS );
	DestroyStorage( oCombatController, STORAGE_ENEMY_MEMBERS );
	DestroyStorage( oCombatController, STORAGE_COMB_CONT_GROUPS );
	DestroyStorage( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
	DestroyObject( oCombatController, 0.1f );
	return FALSE;
}


// Creates a combat controller at NPC location
object CreateCombatController( object oNPC ){
	
	// New object
	object oCombatController	= CreateObject( OBJECT_TYPE_PLACEABLE, TAG_COMBAT_CONTROLLER, GetLocation( oNPC ) );
	//PrettyDebug( "CreateCombatController::"+GetName(oNPC)+" creates new "+GetObjectUniqueId( oCombatController ) );
	
	int nFaction 				= GetFaction( oNPC );
	SetCombatControllerFaction( oCombatController, nFaction );
	
	// Instanciate storage(s) on Controller
	GetStorage( oCombatController, STORAGE_COMBAT_STRATEGIES );
	GetStorage( oCombatController, STORAGE_TEAM_MEMBERS );
	GetStorage( oCombatController, STORAGE_ENEMY_MEMBERS );
	
	// Construct the default max and min height
	SetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MAX, -9999 );
	SetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MIN, 9999 );
	
	return oCombatController;
	
}

// Checks for oNPC compatibility with oCombatController as a team controller
// we don't want anyone to team up with anyone in most cases
// Controllers at initiation could receive a set of constraints : subraces, faction etc. 
int GetIsCombatControllerValid( object oCombatController, object oNPC ){

	int nOK			= GetCombatControllerFaction( oCombatController ) == GetFaction( oNPC ) ;
	//PrettyDebug( "GetIsCombatControllerValid::"+GetName(oNPC)+"::IS OK::"+IntToString(nOK));
	return nOK;
	
}

// returns or create the combat controller
object GetCombatControllerProxy( object oNPC ){

	object oCombatController;

	// Check if bind exists on NPC for a combat controller
	// AND if they're (still) in the same area
	oCombatController 	= GetCombatControllerProxyCache( oNPC );
	
	if( GetIsObjectValid( oCombatController ) && GetArea( oNPC ) == GetArea( oCombatController ) ){
		//PrettyDebug( ObjectToString(oNPC)+"::GetCombatControllerProxy::Returned binded controller");
		//  AddToCombatController( oCombatController, oNPC );  // Why do I add that if it exists already ?
		return oCombatController;
	}


	// Use existing controller if 1. one is near 2. this one is valid
	int nNth 			= 1;
	int bSolved			= FALSE;
	oCombatController	= GetNearestObjectByTag( TAG_COMBAT_CONTROLLER, oNPC, nNth );
	while( GetIsObjectValid( oCombatController ) && !bSolved ){
		//PrettyDebug( "GetCombatControllerProxy::"+GetName(oNPC)+" LOOKING FOR CONTROLLER");
		if( GetIsCombatControllerValid( oCombatController, oNPC ) ){
			bSolved		= TRUE;
		}else{
			oCombatController	= GetNearestObjectByTag( TAG_COMBAT_CONTROLLER, oNPC, ++nNth );
		}
	}
	
	
	//PrettyDebugObjectLocation( oCombatController, "blue" );	
	if( GetIsObjectValid( oCombatController ) ){
		//PrettyDebug( "GetCombatControllerProxy:: found valid controller");
		AddToCombatController( oCombatController, oNPC ); 
	 	return oCombatController;
	}
	 
	// Create new controller
	oCombatController 		= CreateCombatController( oNPC );
	AddToCombatController( oCombatController, oNPC ); 
	//PrettyDebugObjectLocation( oCombatController, "green" );		
	
	return oCombatController;

}


// **************************************************************
// Controller WorldState
// **************************************************************

// Immediate Danger depends on the presence of actual enemies
// High value ( 1.0 ) = no Danger
// Low value ( 0.01 ) = Danger
float SetNoImmediateDanger( object oCombatController){


	float fNoImmediateDanger;

/*	if( GetEnemyCount( oCombatController ) ){ 
		fNoImmediateDanger		= 0.01 ;
	}
	else fNoImmediateDanger		= 0.99;
	*/
		
	if( GetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_HARM ) ){
		fNoImmediateDanger		= 0.01 ;
	}
	else if( GetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_PERC ) ){
		fNoImmediateDanger		= 0.49 ;
	}
	else fNoImmediateDanger		= 0.99;
	
	
	SetLocalFloat( oCombatController, VAR_CDATA_DANGER, fNoImmediateDanger );
	//PrettyDebug( "func::SetNoImmediateDanger:"+FloatToString(fNoImmediateDanger) );
	return fNoImmediateDanger;

}

int GetTeamMaxExploreWPCount( object oCombatController ){

	// Calculates the max WP depending on team count and store it for caching purpose
	int nTeamCount			= GetTeamCount( oCombatController );
	//PrettyDebug("SetAreaKnowledge nTeamCount:"+IntToString( nTeamCount ) );
	float nBigDistance 		= ( log( IntToFloat(nTeamCount) ) + 1 ) * PARAM_COMBAT_ZONE_CHUNK ;
	int nMaxPoints 			= FloatToInt( 3.14*pow( nBigDistance, 2.0) / pow( PARAM_COMBAT_ZONE_CHUNK, 2.2 ) );
	if( nMaxPoints < 2 ) {
		nMaxPoints = 2;
	}
	//PrettyDebug("GetTeamMaxExploreWPCount nMaxPoints:"+IntToString( nMaxPoints ) );
	return nMaxPoints;
}

// The inner mechanic could be changed to a precalculated list
// Area Knowledge is determined by nActualRecoWP / nMaxRecoWP
float SetAreaKnowledge( object oCombatController){

	// Check if limit of total exploration cycles  reached
	if( GetMaxExplorationReached( oCombatController ) ){
		//PrettyDebug( "SetAreaKnowledge::LIMIT OF EXPLORATION CYCLES REACHED ");
		return 1.0;
	}
	

	int nMaxPoints			= GetTeamMaxExploreWPCount( oCombatController );

	SetLocalInt( oCombatController, VAR_EXPLORE_MAX_WP, nMaxPoints ); 
	
	// Gets the current amount of WP layed by team on map
	int nCurrentPoint 		= GetExploreWPCount( oCombatController );
	
	//PrettyDebug( "SetAreaKnowledge::nCurrentPoint="+IntToString(nCurrentPoint)+" nMaxPoints="+IntToString(nMaxPoints) );
	
	// Calculates the indice and stores it
	float fAreaKnowledge    = _safeDivide( IntToFloat( nCurrentPoint ), IntToFloat( nMaxPoints ) );
	SetLocalFloat( oCombatController, VAR_CDATA_AREA_KNOW, fAreaKnowledge);
	//PrettyDebug( "func::SetAreaKnowledge:"+FloatToString(fAreaKnowledge) );
	return fAreaKnowledge;
	
}


// Team Morale is determined by nDead / nMax team members
// If 2 dead on 8 members, TM is 1-0.25 = 0.75
// High is good for me, Low is bad for me
float SetTeamMorale( object oCombatController){

	int nDead 			= GetLocalInt( oCombatController, VAR_COUNT_DEAD );
	int nAll 			= GetLocalInt( oCombatController, VAR_COUNT_ALL );
	float fTeamMorale 	= 1.0 - _safeDivide( IntToFloat( nDead ), IntToFloat( nAll ) );
	SetLocalFloat( oCombatController, VAR_CDATA_MORALE, fTeamMorale);
	//PrettyDebug( "func::SetTeamMorale 1-("+IntToString(nDead)+"/"+IntToString(nAll)+")="+FloatToString(fTeamMorale) );
	return fTeamMorale;
	 
}

// Checks each member of the team for its neighborhood to other team members.
// Returns the math product of each fraction of team as a fraction is nSubTeam:nTotalTeam
// In worst case scenario, it's a O((n-1)+(n-2)+...+ 1) algorithm
// ie for a perfectly fractioned team of 10 => 45 loops
// NOTE : It performs at the end a location variable save on Controller. 
// That's kinda messy, but it's more efficient to do it there
float GetSubteamsFractions( object oCombatController ){

	int N 		= GetTeamCount( oCombatController );
	// Single creature, no subteam
	if( 1 == N ){
		return 1.0;
	}
	//PrettyDebug( "func::GetSubteamsFractions:STARTED" );	 
	int i				= 0; // Iterator index, incremented once per loop
	int j				= 1; // Iterator index, incremented many per loop
	int bPivInGroup		= 0; // group state for pivot
	int bSatInGroup		= 0; // group state for satellite
	int bPtsInGroup		= 0; // group state for pivot and satellite
	int nGroupsId		= 1; // # of groups, at least one
	int nPrevGroupsId	= 1; // # of group previously set in search 
	// Make sure we get a clean new Storage for NPC index => GroupId
	object oCi, oCj; // The creatures variables used throughout the search
	object oT			= GetStorage( oCombatController, STORAGE_TEAM_MEMBERS ); // Team members
	// Takes care of previous instance destruction
	object oS   		= CreateStorage( oCombatController, STORAGE_COMB_CONT_TMP );
	
	while( i < N ){
		// If all the points have been checked, the search is over
		if( N == GetStorageCount( oCombatController, STORAGE_COMB_CONT_TMP ) ){
			//PrettyDebug( "func::GetSubteamsFractions:1st LOOP BREAK @"+IntToString(i) );	 
			break;
		}
		// Get the pivot object
		oCi					= GetVariableValueObject( oT, i );
		bPivInGroup			= GetLocalInt( oS, IntToString( i ) );
		// Run search
		for( j = i+1; j < N; j++ ){
			//PrettyDebug( "func::GetSubteamsFractions:2nd LOOP j="+IntToString(j) );	 
		
			// Is satellite in a group
			bSatInGroup 	= GetLocalInt( oS, IntToString( j ) );
			// If both pivot and satellite are in a previous group, continue
			if( bPivInGroup && bSatInGroup ){
				j++;
				continue;
			}
			// Get the satellite 
			oCj				= GetVariableValueObject( oT, j );
			// Are pivot and satellite in same group
			bPtsInGroup 	= GetDistanceBetween( oCi, oCj ) < PARAM_COMBAT_ZONE_CHUNK;
			// If pivot and satellite are not in same group, continue
			if( !bPtsInGroup ){
				j++;
				continue;
			}
			// If pivot and satellite aren't grouped, set group and record for each
			if( !bPivInGroup && !bSatInGroup){
				SetLocalInt( oS, IntToString(i), nGroupsId);
				SetLocalInt( oS, IntToString(j), nGroupsId);
				bPivInGroup	= TRUE;
				nGroupsId++;
				j++;
				continue;
			}
			// If pivot point in group, add satellite to group
			if( bPivInGroup && !bSatInGroup ){
				nPrevGroupsId	= GetLocalInt( oS, IntToString(i) );
				SetLocalInt( oS, IntToString(j), nPrevGroupsId);
				j++;
				continue;
			}
			// 	If satellite point in group, add pivot to group
			if( !bPivInGroup && bSatInGroup ){
				nPrevGroupsId	= GetLocalInt( oS, IntToString(j) );
				SetLocalInt( oS, IntToString(i), nPrevGroupsId);
				j++;
				continue;
			}
		}
		// If pivot has not been added to a group, create its own
		if( !bPivInGroup ){
			SetLocalInt( oS, IntToString(i), nGroupsId);
			nGroupsId++;
		}
		i++;
	}
	// One group only ? no subteam
	int nGroups 				= nGroupsId-1; 
	// We use this to store on the side the 
	int nMemberCount,nMaxMemberCount; 
	if( nGroups == 1 ){
		return 1.0;
	}
	
	// get a new temp storage to keep track of the creature per group decount
	// Takes care of previous instance destruction
	object oD					= CreateStorage( oCombatController, STORAGE_COMB_CONT_GROUPS );
	for( i=0; i<N; i++){
		nGroupsId				= GetLocalInt( oS, IntToString(i));
		nMemberCount			= 1 + GetLocalInt( oD, IntToString(nGroupsId) );
		if( nMemberCount>nMaxMemberCount ){
			nMaxMemberCount 	= nMemberCount;
			oCi					= GetVariableValueObject( oT, i );
			SetLocalLocation( oCombatController, VAR_MAIN_GROUP_LOCATION, GetLocation(oCi) );
		}
		nGroupsId				= GetLocalInt( oS, IntToString(i));
		SetLocalInt( oD, IntToString(nGroupsId), nMemberCount );
	}
	float fDivider,fResult		= 1.0;
	for( i=1; i<=nGroups; i++){
		fDivider				= IntToFloat(GetLocalInt( oD, IntToString(i) )) / N;
		fResult 				*= fDivider;
	}
	return fResult;

}

// Position Quality is determined by multiplying the fractions of subteams nCurrent/nTotal
// ie. S = (4:7)*(2:7)*(1:7) = 14:343 and then sqrt the result ie. sqrt(S) = 0.202030509
// NOTE : eventually, this could be a static table for better perfs
float SetPositionQuality( object oCombatController){
	float fSubteamsFractions	= GetSubteamsFractions( oCombatController );

	float fPositionQuality 		= sqrt( sqrt( fSubteamsFractions ) );
	if( fPositionQuality < 0.01 ) {
		fPositionQuality		= 0.01;
	}
	SetLocalFloat( oCombatController, VAR_CDATA_POSITION, fPositionQuality);
	//PrettyDebug( "func::SetPositionQuality:"+FloatToString(fPositionQuality) );
	return fPositionQuality;
}

// Enemy Threat is determined by divising enemy team "Round To Live" 
// by the sum of the enemy and the current team "Rounds To Live" 
// Rounds To Live is equal to sum of "Hit Points" divided by the opposite sum of "Damages per round"
// Ex: I have 4 rounds to live, enemy has 10 / Enemy Threat equals 10/14 => 0.714
// High is bad for me, low is good for me
float SetEnemyThreat( object oCombatController){

	int nTeamHitPoints			= GetLocalInt( oCombatController, VAR_COMB_CONT_HP_TEAM);
	int nTeamDamagePerRound		= GetLocalInt( oCombatController, VAR_COMB_CONT_DAM_TEAM);
	int nEnemyHitPoints			= GetLocalInt( oCombatController, VAR_COMB_CONT_HP_ENEMY);
	int nEnemyDamagePerRound	= GetLocalInt( oCombatController, VAR_COMB_CONT_DAM_ENEMY);
	int nTeamRTL				= ( nEnemyDamagePerRound == 0 ? 1 : 1 + nTeamHitPoints / nEnemyDamagePerRound );
	int nEnemyRTL				= ( nTeamDamagePerRound == 0 ? 1 : 1 + nEnemyHitPoints / nTeamDamagePerRound );
	int nTotalRTL				= nTeamRTL + nEnemyRTL;
	float fResult 				= IntToFloat(nEnemyRTL) / nTotalRTL;
	
	//PrettyDebug( "func::SetEnemyThreat:"+IntToString(nEnemyRTL)+"/"+IntToString(nTotalRTL) );
		// float fResult 				= 0.5;
	//PrettyDebug( "func::SetEnemyThreat:"+FloatToString(0.01) );
	return fResult;
	
}


// **************************************************************
// Controller strategies
// **************************************************************

// fNoImmediateDanger : fAreaKnowledge
float GetStrategyExplore( object oCombatController, float f1, float f2 ){

	if( GetCombatControllerFlagHarmed(oCombatController) ){
		return 0.0;}
	float fRes = CapDivide( f1, f2, 3.0 );
	//PrettyDebug( "func::GetStrategyExplore:"+FloatToString(f1)+"/"+FloatToString(f2)+"="+FloatToString(fRes) );
	return fRes;
	
}
// fAreaKnowledge, fNoImmediateDanger
float GetStrategyAmbush( object oCombatController, float f1, float f2 ){

	if( GetCombatControllerFlagHarmed(oCombatController) ){
		return 0.0;}
	float fRes = CapDivide( f1, f2, 3.0 );
	//PrettyDebug( "func::GetStrategyAmbush:"+FloatToString(f1)+"/"+FloatToString(f2)+"="+FloatToString(fRes) );
	return fRes;
}

// fTeamMorale, fEnemyThreat 
float GetStrategyTaunt( object oCombatController, float f1, float f2 ){

	if( GetCombatControllerFlagHarmed(oCombatController) ){
		return 0.0;}
	float fRes = CapDivide( f1, f2, 6.0 );
	//PrettyDebug( "func::GetStrategyTaunt:"+FloatToString(f1)+"/"+FloatToString(f2)+"="+FloatToString(fRes) );
	return fRes;
	
}

// fEnemyThreat, fPositionQuality
float GetStrategyReposition( object oCombatController, float f1, float f2 ){

	if( !GetCombatControllerFlagHarmed(oCombatController) ){
		return 0.0;}
	float fRes = CapDivide( f1, f2, 9.0 );
	//PrettyDebug( "func::GetStrategyReposition:"+FloatToString(f1)+"/"+FloatToString(f2)+"="+FloatToString(fRes) );
	return fRes;
	
}

// fEnemyThreat, fTeamMorale
float GetStrategyFlee( object oCombatController, float f1, float f2 ){

	if( !GetCombatControllerFlagHarmed(oCombatController) ){
		return 0.0;}
	float fRes = CapDivide( f1, f2, 6.0 );
	//PrettyDebug( "func::GetStrategyFlee:"+FloatToString(f1)+"/"+FloatToString(f2)+"="+FloatToString(fRes) );
	return fRes;
	
}

// fPositionQuality, fEnemyThreat
float GetStrategyAttack( object oCombatController, float f1, float f2 ){

	if( !GetEnemyCount(oCombatController) ){
		//PrettyDebug( "func::GetStrategyAttack: NO ENEMY" );
		return 0.0;}
	float fRes = CapDivide( f1 * 2, f2, 9.0 );
	//PrettyDebug( "func::GetStrategyAttack:"+FloatToString(f1)+"/"+FloatToString(f2)+"="+FloatToString(fRes) );
//	float fRes =  f1 * f2 * 9.0 ;
	//PrettyDebug( "func::GetStrategyAttack:"+FloatToString(f1)+"*"+FloatToString(f2)+"="+FloatToString(fRes) );
	return fRes;
	
}

// **************************************************************
// Controller tactics
// **************************************************************

// **************************************************************
// Controller Goals assignments
// **************************************************************

int RunControllerLoop( object oCombatController ){

	// Team info
	GetTeamData(oCombatController );
	
	// Enemy info. 
	GetEnemyData(oCombatController );
	
	// These methods are used to compute the team strategy
	float fNoImmediateDanger 	= SetNoImmediateDanger(oCombatController); 
	float fEnemyThreat 			= SetEnemyThreat(oCombatController);
	float fPositionQuality 		= SetPositionQuality(oCombatController);
	float fTeamMorale			= SetTeamMorale(oCombatController);
	float fAreaKnowledge 		= SetAreaKnowledge(oCombatController);

	// The highest of these indices determines the Strategy
	float fIsStrategyExplore	= GetStrategyExplore( oCombatController, fNoImmediateDanger, fAreaKnowledge );
	float fIsStrategyAmbush		= GetStrategyAmbush( oCombatController, fAreaKnowledge, fNoImmediateDanger);
	float fIsStrategyTaunt		= GetStrategyTaunt( oCombatController, fTeamMorale, fEnemyThreat);
	float fIsStrategyFlee		= GetStrategyFlee( oCombatController, fEnemyThreat, fTeamMorale);
	float fIsStrategyReposition	= GetStrategyReposition( oCombatController, fEnemyThreat, fPositionQuality);
	float fIsStrategyAttack		= GetStrategyAttack( oCombatController, fPositionQuality, fEnemyThreat);
	//PrettyDebug( "RunControllerLoop::A"+FloatToString( fIsStrategyAmbush )+"E"+FloatToString( fIsStrategyExplore )+"T"+FloatToString( fIsStrategyTaunt )+"F"+FloatToString( fIsStrategyFlee )+"R"+FloatToString( fIsStrategyReposition )+"A"+FloatToString( fIsStrategyAttack ));
	
	// Update and sort array to get the strategy
	AddToStorageFloat( oCombatController, STORAGE_COMBAT_STRATEGIES, VAR_STRATEGY_AMBUSH, fIsStrategyAmbush );	
	AddToStorageFloat( oCombatController, STORAGE_COMBAT_STRATEGIES, VAR_STRATEGY_EXPLORE, fIsStrategyExplore );	
	AddToStorageFloat( oCombatController, STORAGE_COMBAT_STRATEGIES, VAR_STRATEGY_TAUNT, fIsStrategyTaunt );	
	AddToStorageFloat( oCombatController, STORAGE_COMBAT_STRATEGIES, VAR_STRATEGY_FLEE, fIsStrategyFlee );	
	AddToStorageFloat( oCombatController, STORAGE_COMBAT_STRATEGIES, VAR_STRATEGY_REPOSITION, fIsStrategyReposition );	
	AddToStorageFloat( oCombatController, STORAGE_COMBAT_STRATEGIES, VAR_STRATEGY_ATTACK, fIsStrategyAttack );	
	SortStorageFloat(oCombatController, STORAGE_COMBAT_STRATEGIES);
	//PrettyDump( GetStorage( oCombatController, STORAGE_COMBAT_STRATEGIES) );
	string sStrategy 			= GetStorageLastVarName( oCombatController, STORAGE_COMBAT_STRATEGIES );
	//PrettyDebug( "Current Strategy is : "+sStrategy );

	//PrettyDebugWPStorage( oCombatController, STORAGE_EXPLORE_WAYPOINTS);
	return FALSE;
	
}



// Defines the best tactical goal option for the NPC
int AssignTacticalGoal( string sStrategy, object oNPC ){

	//PrettyDebug("AssignTacticalGoal::sStrategy = "+sStrategy );
	if( VAR_STRATEGY_EXPLORE == sStrategy ){
	
		// Single tactic : look around and try to qualify 
		UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT_EXPLORE, 20.0 );
	
	}else if( VAR_STRATEGY_AMBUSH == sStrategy ){
	
		// Tactic 1 : become hidden and position at low / hidden point
		// Tactic 2 : position at high point 
		UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT_AMBUSH, 20.0 );
	
	}else if( VAR_STRATEGY_TAUNT == sStrategy ){

		// Single tactic : Shout at the enemy
		UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT_TAUNT, 20.0 );
		
	}else if( VAR_STRATEGY_FLEE == sStrategy ){
	
		UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT_FLEE, 20.0 );

	}else if( VAR_STRATEGY_REPOSITION == sStrategy ){
	
		UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT_REPOSITION, 20.0 );

	}else if( VAR_STRATEGY_ATTACK == sStrategy ){
	
		UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT_ATTACK, 20.0 );

	}else if( INVALID == sStrategy ){
	
		//PrettyDebug( "AssignTacticalGoal::ERROR Invalid strategy" );
		return FALSE;
	}
	
	// With default motivation limit, this causes the NPC to stop looking for Goals
	UpdateMotivationsLimit( oNPC, 10.0 );
	
	return TRUE;
		 
}

// Defines a low but easy goal for the NPC
int AssignDefaultGoal( string sStrategy, object oNPC ){

	UpdateStorageFloat( oNPC, GOALS_ARRAY, GOAL_COMBAT, 10.0 );

	return FALSE;
}


// Assigns one or many goals to NPC through controller
int AssignCombatGoals( object oNPC, object oCombatController ){

	// Retrieve the team's strategy
	string sStrategy 			= GetStorageLastVarName( oCombatController, STORAGE_COMBAT_STRATEGIES );

	// "Buy" a goal according to strategy and capacities
	AssignTacticalGoal( sStrategy, oNPC ); 
	
	// A downgrading goal is provided to avoid null behaviours
	AssignDefaultGoal( sStrategy, oNPC ); 
	
	return FALSE;
	
}



// **************************************************************
// Exploration
// **************************************************************



// Removes the destination from oNPC
int DeleteDestination( object oNPC){
	DeleteLocalLocation(oNPC, VAR_MOVEMENT_DESTINATION );
	return FALSE;
	
}


// Writes the default Location if none set yet 
location GetCombatControllerDefaultLocation( object oCombatController, object oNPC ){

	location lDefaultLoc	= GetLocalLocation( oCombatController, VAR_COMB_CONT_DFLT_LOC );
	if( GetIsLocationValid( lDefaultLoc ) ) {
		return lDefaultLoc;
	}
	float fNewFace			= IntToFloat( Random( 180 ) ) + GetFacing( oNPC );
	lDefaultLoc				= GenerateNewLocation( oNPC, 0.0, fNewFace, fNewFace );
	SetLocalLocation( oCombatController, VAR_COMB_CONT_DFLT_LOC, lDefaultLoc );
	return lDefaultLoc;
	
}


// Instead of calculating a distance without taking the Z axis into account
// I prefer comparing x and y for PARAM_CLOSE_ENOUGH
int GetIsLocationNearEnough( location l1, location l2, float fDist = PARAM_CLOSE_ENOUGH ){

	vector v = GetPositionFromLocation(l1) - GetPositionFromLocation(l2);
 	//PrettyDebug( "GetIsLocationNearEnough::"+VectorToString( v ) );
	if( v.x <= PARAM_CLOSE_ENOUGH && v.y <= PARAM_CLOSE_ENOUGH )
 		return TRUE;
		
	return FALSE;
}


//Encapsulates @see GetIsLocationNearEnough( location l1, location l2 )
int GetIsObjectNearEnough( object oObj1, object oObj2, float fDist = PARAM_CLOSE_ENOUGH ){

	location l1		= GetLocation( oObj1 );
	location l2		= GetLocation( oObj2 );
	return GetIsLocationNearEnough( l1, l2, fDist );
	
}

// Checks if oNPC is close enough from Destination
int GetIsDestinationReached( object oNPC ){

	location lDestination 		= GetLocalLocation( oNPC, VAR_MOVEMENT_DESTINATION );
	//PrettyDebugLocation( lDestination, "orange");
	if( GetIsLocationNearEnough( lDestination, GetLocation( oNPC ) ) ){
		//PrettyDebug( "GetIsDestinationReached::TRUE " );
		return TRUE;
	}
	//PrettyDebug( "GetIsDestinationReached::FALSE " );
	return FALSE;
	
}


// Checks if oNPC is being assigned to qualification
int GetIsQualifyingLocation( object oNPC ){

	int nQualifyRounds = GetLocalInt( oNPC, VAR_EXPLORE_QUAL_ROUNDS );
	if( nQualifyRounds > 0 ){
		nQualifyRounds--;
		//PrettyDebug( "GetIsQualifyingLocation::TRUE rounds left: "+IntToString( nQualifyRounds ) );
		SetLocalInt( oNPC, VAR_EXPLORE_QUAL_ROUNDS, nQualifyRounds );
		return TRUE;
	}
	//PrettyDebug( "GetIsQualifyingLocation::FALSE " );
	return FALSE;
	
}


// Checks if oNPC is currently moving to Destination
int GetIsHeadingToDestination( object oNPC ){

	location lDestination 		= GetLocalLocation( oNPC, VAR_MOVEMENT_DESTINATION );
	if( !GetIsLocationValid( lDestination ) ){
		//PrettyDebug( "GetIsHeadingToDestination::INVALID LOCATION " );
		return FALSE;
	}
	//PrettyDebug( "GetIsHeadingToDestination::VALID LOCATION " );
	return TRUE;
	
}


// Checks in front of NPC to see if he can walk straight
// Also performs a check to see if oNPC is static for too long
int GetIsWalklineValid( object oNPC ){
	
	// Check positions in front of me
	int nI;
	location lLoc;
	float fDist;
	float fChunk 		= PARAM_WALKLINE_DIST;
	for( nI = 1; nI < PARAM_WALKLINE_DEPTH; nI++){
		fDist			+= fChunk;
		lLoc 			= GetAheadLocation( oNPC,fDist );
		if( !GetIsLocationValid( lLoc) ){
			return FALSE;
		}
	}
	
	// Check my own location
	location lSelf 		= GetLocation( oNPC );
	location lPrevious	= GetLocalLocation( oNPC, VAR_PREVIOUS_LOCATION );
	SetLocalLocation( oNPC, VAR_PREVIOUS_LOCATION, lSelf );
	if( lSelf != lPrevious ){
		SetLocalInt( oNPC, VAR_ROUNDS_BLOCKED, 0);
		return TRUE;
	}
	int nRoundsBlocked	= GetLocalInt( oNPC, VAR_ROUNDS_BLOCKED ) + 1;
	SetLocalInt( oNPC, VAR_ROUNDS_BLOCKED, nRoundsBlocked );
	if( nRoundsBlocked >= PARAM_MAX_ROUNDS_BLOCKED ){
		//PrettyDebug("GetIsWalklineValid::BLOCKED FOR TOO LONG");
		return FALSE;
	}
	
	return TRUE;
	
}


// Returns the max amount of wp stored on the controller
int GetMaxExploreWP( object oCombatController ){

	int nMaxExploreWP = GetLocalInt( oCombatController, VAR_EXPLORE_MAX_WP );
	//PrettyDebug("GetMaxExploreWP::nMaxExploreWP="+IntToString(nMaxExploreWP)); 
	return nMaxExploreWP;
}



// Compares Current size of exploration waypoint storage with max amount
int GetIsMaxExplorationWPLimitReached( object oCombatController ){

	int nCurrentStoredWPCount		= GetStorageCount( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
	int nMaxExploreWPCount			= GetMaxExploreWP( oCombatController );
	if( nCurrentStoredWPCount < nMaxExploreWPCount  ){
		return FALSE;
	}
	
	return TRUE;
}

// Compares the current search index to the max value 
int GetIsIndexExplorationWPLimitReached(object oCombatController){

	int nSearchIndex				= GetLocalInt( oCombatController, VAR_EXPLORE_CONT_INDEX );
	if( nSearchIndex < PARAM_EXPLORE_MAX_DEPTH ){
//		//PrettyDebug( "GetIsIndexExplorationWPLimitReached::FALSE");
		return FALSE;
	}
	// resets the index and the default location, so we're searching at a different angle
	int nCurrentResetCount			= GetLocalInt( oCombatController, VAR_EXPLORE_RESET_COUNT );
	if(  nCurrentResetCount < PARAM_EXPLORE_MAX_RESET ){
	
		//PrettyDebug( "GetIsIndexExplorationWPLimitReached::LIMIT REACHED nCurrentResetCount:"+IntToString( nCurrentResetCount )+"/"+IntToString( PARAM_EXPLORE_MAX_RESET ));
		SetLocalInt( oCombatController, VAR_EXPLORE_RESET_COUNT, ++nCurrentResetCount );
		SetLocalInt( oCombatController, VAR_EXPLORE_CONT_INDEX, 1);
		location lOldLoc			= GetLocalLocation( oCombatController, VAR_COMB_CONT_DFLT_LOC );
		float fNewFace				= PARAM_EXPLORE_ITER_ANG + GetFacingFromLocation( lOldLoc );
		object oArea				= GetArea( oCombatController );
	    vector vNewPos 				= GetChangedPosition(GetPositionFromLocation(lOldLoc),
                                    	0.0,
                                    	fNewFace);
     	location lDefaultLoc		= Location(oArea, vNewPos, fNewFace);
		SetLocalLocation( oCombatController, VAR_COMB_CONT_DFLT_LOC, lDefaultLoc );
		return FALSE;
	}
//	//PrettyDebug( "GetIsIndexExplorationWPLimitReached::TRUE");
	return TRUE;
}



// Retrieves a new Destination from the controller
int GetNewDestinationExploration( object oNPC ){

	location lDestination;
	object oCombatController 	= GetCombatControllerProxy( oNPC );
	if( !GetIsObjectValid( oCombatController) ){
		//PrettyDebug( "QualifyLocation::ERROR Invalid controller ");
		return FALSE;
	}
	// Checks if search area is expanding by comparing current / max wp for controller
	int nCurrentStoredWPCount		= GetStorageCount( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
	int nMaxExploreWPCount			= GetMaxExploreWP( oCombatController );
	int nSearchIndex				= GetLocalInt( oCombatController, VAR_EXPLORE_CONT_INDEX );
	//PrettyDebug( "GetNewDestinationExploration::nCurrentStoredWPCount #"+IntToString(nCurrentStoredWPCount)+" nMaxExploreWPCount:"+IntToString(nMaxExploreWPCount));
	if( !GetIsMaxExplorationWPLimitReached(oCombatController) && !GetIsIndexExplorationWPLimitReached( oCombatController ) ){
	
		// If so provides a new valid location to visit 
		int bSolved					= FALSE;
		location lDefaultLocation	= GetCombatControllerDefaultLocation( oCombatController, oNPC );
		// Run a problem solution loop : has to be a valid location inside search depth limit to be solved
		while( !bSolved && nSearchIndex < PARAM_EXPLORE_MAX_DEPTH ){
		
			string sAngle				= Get2DAString( _2DA_EXPLORE, "angle", nSearchIndex );
			float fAngle				= StringToFloat( sAngle ) + GetFacingFromLocation(lDefaultLocation) ;
			string sDist				= Get2DAString( _2DA_EXPLORE, "distance", nSearchIndex );
			float fDist					= StringToFloat( sDist ) * PARAM_COMBAT_ZONE_CHUNK;
			//PrettyDebug( "GetNewDestinationExploration::nSearchIndex #"+IntToString(nSearchIndex)+" sAngle:"+FloatToString(fAngle)+" sDist:"+FloatToString(fDist));
			lDestination 				= GenerateNewLocation( oCombatController, fDist, fAngle, fAngle );
			if( GetIsLocationValid( lDestination ) ){
				//PrettyDebug( "GetNewDestinationExploration::VALID "+LocationToString(lDestination) );
				bSolved 				= TRUE;
			}
			nSearchIndex++;
			SetLocalInt( oCombatController, VAR_EXPLORE_CONT_INDEX, nSearchIndex );
			
		}

	}	
	
	// Else provides Stored waypoint by getting a random WP in the list
	else{	
		//PrettyDebug( "GetNewDestinationExploration::USE STORED " );
		object oWPStorage				= GetStorage( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
		int nRand 						= Random( nCurrentStoredWPCount );
		object oWP						= GetVariableValueObject( oWPStorage, nRand );
		lDestination					= GetLocation( oWP );

	}
	
	if( GetIsLocationValid( lDestination ) ){
		//PrettyDebug( "GetNewDestinationExploration::new Location "+LocationToString(lDestination));
		SetLocalLocation( oNPC, VAR_MOVEMENT_DESTINATION, lDestination );
		//PrettyDebugLocation( lDestination, "blue");
		return TRUE;
	}	
	//PrettyDebug( "GetNewDestinationExploration::NO LOCATION FOUND ");
	return FALSE;
	
}


// Attemps to create a new exploration Waypoing for oCombatController
// at oNPC location if the nearest waypoint  is invalid
int CreateNewExploreWaypoint( object oCombatController, object oNPC ){
	
	//PrettyDebug( "##()CreateNewExploreWaypoint::CALL");
	
	// Checks if creation is allowed
	if( GetIsMaxExplorationWPLimitReached( oCombatController ) ){
		return FALSE;}
	
	object oWP =  GetNearestObjectByTag( TAG_EXPLORE_WAYPOINT );
	if( GetIsObjectValid(oWP) && GetDistanceBetween(oNPC,oWP)<( PARAM_COMBAT_ZONE_CHUNK - 1.0 ) ){
		return FALSE;}
	
	// Creates exploration waypoint
	location lDefaultLoc	= GetCombatControllerDefaultLocation( oCombatController, oNPC );
	float fNewFace			= IntToFloat( Random( 180 ) ) + GetFacing( oNPC );
	location lNewLoc		= GenerateNewLocation( oNPC, 0.0, fNewFace, fNewFace );
	oWP						= CreateObject(OBJECT_TYPE_WAYPOINT, TAG_EXPLORE_WAYPOINT, lNewLoc, FALSE, TAG_EXPLORE_WAYPOINT);
	string sWPUID			= GetObjectUniqueId( oWP );
	//PrettyDebug( "##CreateNewExploreWaypoint::NewFacing ="+FloatToString(fNewFace) );
	//PrettyDebug( "##CreateNewExploreWaypoint::new WP "+sWPUID+" @"+LocationToString( lNewLoc ) +"#######");
	//PrettyDebugObjectLocation( oWP, "blue" );
	
	// We're setting an arbitrary really low value for the var used in QualifyLocationDig
	SetLocalFloat( oWP, VAR_COMB_WP_HEIGHT_RATIO, -1.0);
	AddToStorageObject( oCombatController, STORAGE_EXPLORE_WAYPOINTS, sWPUID, oWP );	
	return TRUE;
}


// Performs the actual locomotion
int MoveToExplorationDestination( object oNPC ){
	
	location lDestination 		= GetLocalLocation( oNPC, VAR_MOVEMENT_DESTINATION ); 
	//PrettyDebugLocation( lDestination, "orange");
	AssignCommand( oNPC, ClearAllActions( ) );
	AssignCommand( oNPC, ActionForceMoveToLocation( lDestination, PARAM_EXPLORE_RUN, 60.0 ) );
	
	// Attempt to create Waypoint at current location
	object oCombatController = GetCombatControllerProxy( oNPC );
	if( GetIsIndexExplorationWPLimitReached(oCombatController) && !GetIsMaxExplorationWPLimitReached( oCombatController ) ){
		//PrettyDebug( "MoveToExplorationDestination::TRYING TO LAY NEW WAYPOINT"+IntToString(GetStorageCount( oCombatController, STORAGE_EXPLORE_WAYPOINTS ))+"/"+IntToString(GetMaxExploreWP( oCombatController ) ));
		CreateNewExploreWaypoint( GetCombatControllerProxy( oNPC ), oNPC );
	}
	else {
		// //PrettyDebug( "MaxExplorationWPLimitReached::"+IntToString(GetStorageCount( oCombatController, STORAGE_EXPLORE_WAYPOINTS ))+"/"+IntToString(GetMaxExploreWP( oCombatController ) ));
	}
	// Attemps to open surrounding doors
	CheckNearbyDoors( oNPC );
	
	return FALSE;
	
}

// Returns the nearest exploration waypoint from oNPC
object GetNearestExplorationWaypoint( object oNPC){

	return GetNearestObjectByTag( TAG_EXPLORE_WAYPOINT );

}


// Applies a new quality ratio to the combat controller waypoints
// Ratio = -( (nMin - nCur) / (nMax - nMin ) )
// Ex : nMax:100, nMin:-100, nCur:50 => ratio of -(-150/200) ie. 0.75
// 1.0 is the max
// 0.0 is the min
// -1.0 is default <=> not computed
int QualifyLocationRefactorWP( object oCombatController ){

	//PrettyDebug( "QualifyLocationRefactorWP::Running ");
	object oWP;
	object oStorage	= GetStorage( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
	int nCount 		= GetStorageCount( oCombatController, STORAGE_EXPLORE_WAYPOINTS );
	int nI;
	float fHeightRatio; // Current heigtht ratio 
	int nCur; // Current height 
	int nDiff; // - ( nMin - nCur )
	
	// Retrieve height span at controller level
	int nMax			= GetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MAX );
	int nMin			= GetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MIN );
	int nTotalDiff		= nMax - nMin;
	for( nI = 0; nI < nCount; nI++){
	
		oWP 			= GetVariableValueObject( oStorage, nI );
		nCur 			= GetLocalInt( oWP, VAR_COMB_WP_HEIGHT );
		nDiff			= 0 - ( nMin - nCur );
		fHeightRatio	= _safeDivide( IntToFloat( nDiff ),IntToFloat( nTotalDiff )) ;
		SetLocalFloat( oWP, VAR_COMB_WP_HEIGHT_RATIO, fHeightRatio );
		//PrettyDebug( "QualifyLocationRefactorWP::height="+IntToString(nCur)+">Ratio="+FloatToString(fHeightRatio)+"("+IntToString(nDiff)+"/"+IntToString(nTotalDiff)+")" );
	}

	return FALSE;



}

// Qualifies a waypoint's height and refactors all the waypoints
int QualifyLocationDigHeight( object oWP, object oCombatController ){

	//PrettyDebug( "QualifyLocationDigHeight::Running ");
	// Retrieve and store on WP its height
	vector pWP 			= GetPosition( oWP );
	int nZ				= FloatToInt( pWP.z );
	SetLocalInt( oWP, VAR_COMB_WP_HEIGHT, nZ );
	'
	// Compare and store on controller
	int nMax			= GetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MAX );
	int nMin			= GetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MIN );
	if( nZ >= nMax ) {
		//PrettyDebug( "QualifyLocationDigHeight::SetMax at "+IntToString(nZ) );
		SetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MAX, nZ );
	}
	if( nZ < nMin ) { 
		//PrettyDebug( "QualifyLocationDigHeight::SetMin at "+IntToString(nZ) );
		SetLocalInt( oCombatController, VAR_COMB_CONT_HEIGHT_MIN, nZ );
	}
	
	// Refactor all waypoints
	QualifyLocationRefactorWP( oCombatController );

	return FALSE;
}





// Returns N chunks separating oWP1 from oWP2
int GetStepsBetweenExlorationWaypoints( object oWP1, object oWP2 ){

	if( !GetIsObjectValid( oWP1 )||!GetIsObjectValid( oWP2 )){
		return FALSE;
	}
	float fDist = GetDistanceBetween( oWP1, oWP2 );
	int nChunks	= FloatToInt( fDist / PARAM_COMBAT_ZONE_CHUNK );
	return nChunks;

}

// Qualifies WP for ambush position
// A good ambush position has freedom of movement and is relatively low
// so it is qualified by fSurroundingQuality / fHeightQuality
// Plus, it should be close to the ranged combat position
// So it shall be divided by the amount of "steps" separating both
// Ex: 8 surrounding, and low give ( 8/8 ) / 0.1 => 10 score
// Ex: 2 surrounding and middle high give ( 2/8 ) / 0.5 => 0.5 score 
int QualifyLocationDigPositionAmbush(object oWP, object oCombatController ){

	// Get the quality score for current WP and store it on WP
	float nSurroundingWPQuality	= GetLocalFloat( oWP, VAR_QUALIFY_SURROUND_WP );
	float fHeightQuality		= GetLocalFloat( oWP, VAR_COMB_WP_HEIGHT_RATIO );
	float fQuality 				= _safeDivide( nSurroundingWPQuality, fHeightQuality );
	object oRangedWP			= GetLocalObject( oCombatController, VAR_QUALIFY_RANGED_WP );
	int nChunks					= GetStepsBetweenExlorationWaypoints( oWP, oRangedWP );
	if( nChunks ){
		fQuality				= fQuality / nChunks;						
	}
	SetLocalFloat( oWP, VAR_QUALIFY_AMBUSH, fQuality );
	
	// Compare this score with the one of the object currently stored on controller
	object oAmbushWP			= GetLocalObject( oCombatController, VAR_QUALIFY_AMBUSH_WP );
	if( !GetIsObjectValid( oAmbushWP ) ){
		//PrettyDebug( "QualifyLocationDigPositionAmbush::Invalid ref :"+FloatToString( fQuality )); 
		SetLocalObject( oCombatController, VAR_QUALIFY_AMBUSH_WP, oWP  );
		return TRUE;
	}
	else if( GetLocalFloat( oAmbushWP, VAR_QUALIFY_AMBUSH ) <= fQuality ){
		//PrettyDebug( "QualifyLocationDigPositionAmbush::Better Quality :"+FloatToString( fQuality )); 
		SetLocalObject( oCombatController, VAR_QUALIFY_AMBUSH_WP, oWP  );
		return TRUE;
	}
	//else //PrettyDebug( "QualifyLocationDigPositionAmbush::Inferior Quality :"+FloatToString( fQuality ));
	
	// At this point, no changes, but we want to update current WP neighbours info accurate
	//PrettyDebug("QualifyLocationDigPositionAmbush::"+GetObjectUniqueId(oAmbushWP)+" Updating the WP");
	QualifyLocationDigPositionSurroundWP( oAmbushWP, oCombatController );
	
	return FALSE;
	
}

// Qualifies WP for ranged position
// A good ranged position has low freedom of movement and is relatively high
// so it is qualified by fHeightQuality / fSurroundingQuality 
// Ex: 8 surrounding, and low give   0.1 / ( 1 + 8/8 ) => 0.05 score
// Ex: 2 surrounding and middle high give  0.5 / ( 1 + 2/8 )=> 0.4 score 
int QualifyLocationDigPositionRanged(object oWP, object oCombatController ){

	// Get the quality score for current WP and store it on WP
	float nSurroundingWPQuality	= GetLocalFloat( oWP, VAR_QUALIFY_SURROUND_WP );
	float fHeightQuality		= GetLocalFloat( oWP, VAR_COMB_WP_HEIGHT_RATIO );
	float fQuality 				= _safeDivide( fHeightQuality, 1.0 + nSurroundingWPQuality );
	SetLocalFloat( oWP, VAR_QUALIFY_RANGED, fQuality );
	
	// Compare this score with the one of the object currently stored on controller
	object oRangedWP			= GetLocalObject( oCombatController, VAR_QUALIFY_RANGED_WP );
	if( !GetIsObjectValid( oRangedWP ) ){
		//PrettyDebug( "QualifyLocationDigPositionRanged::Invalid ref :"+FloatToString( fQuality )); 
		SetLocalObject( oCombatController, VAR_QUALIFY_RANGED_WP, oWP  );
	}
	else if( GetLocalFloat( oRangedWP, VAR_QUALIFY_RANGED ) <= fQuality ){
		//PrettyDebug( "QualifyLocationDigPositionRanged::Better Quality :"+FloatToString( fQuality )); 
		SetLocalObject( oCombatController, VAR_QUALIFY_RANGED_WP, oWP  );
	}
	//else //PrettyDebug( "QualifyLocationDigPositionRanged::Inferior Quality :"+FloatToString( fQuality ));
	return FALSE;
}

// Counts surrounding exploration waypoints
int QualifyLocationDigPositionSurroundWP(object oWP, object oCombatController ){

	float fDist;
	int nNth 			= 1;
	int nCount 			= 0;
	object oSearchWP 	= GetNearestObjectByTag( TAG_EXPLORE_WAYPOINT, oWP, nNth );
	while( GetIsObjectValid( oSearchWP ) ){
		//PrettyDebug( "QualifyLocationDigPositionSurroundWP::nNth = "+IntToString(nNth)); 
		fDist = GetDistanceBetween( oSearchWP, oWP );
		if( fDist <= ( PARAM_COMBAT_ZONE_CHUNK * 1.43 ) ){
		 	nCount++;
			oSearchWP 	= GetNearestObjectByTag( TAG_EXPLORE_WAYPOINT, oWP, ++nNth );
		}else{
			oSearchWP 	= OBJECT_INVALID;
		}
	}
	
	
	float fQuality		= IntToFloat( nCount ) / 8;
	//PrettyDebug( "QualifyLocationDigPositionSurroundWP::WP Quality :"+FloatToString( fQuality )); 
	//PrettyDebug( "QualifyLocationDigPositionSurroundWP::"+GetObjectUniqueId(oWP)+" Count :"+IntToString( nCount )); 
	SetLocalInt( oWP, VAR_COUNT_SURROUND_WP, nCount );
	SetLocalFloat( oWP, VAR_QUALIFY_SURROUND_WP, fQuality );
	return nCount;

}


// Qualifies a waypoint's quality for various positional advantage
int QualifyLocationDigPosition( object oWP, object oCombatController ){
	
	
	// Count immediately surrounding exploration wp, max of 8 as in :
	// . . . 
	// . x .
	// . . .
	QualifyLocationDigPositionSurroundWP( oWP, oCombatController );
	
	// Run utility function for each position type and compare the result with the current
	// controller's WP of preference for the given type
	QualifyLocationDigPositionAmbush( oWP, oCombatController );
	QualifyLocationDigPositionRanged( oWP, oCombatController );
	
	
	return TRUE;
}


// Check around and see what we got
int QualifyLocationDig( object oNPC, object oWP, object oCombatController ){
	

	// Qualify height
	if( -1.0 == GetLocalFloat( oWP, VAR_COMB_WP_HEIGHT_RATIO ) ){
	
		QualifyLocationDigHeight( oWP, oCombatController);
		return TRUE;
	}
	
	// Qualify potential position interest
		QualifyLocationDigPosition( oWP, oCombatController);
		return TRUE;
	
}

// Performs the qualification 
int QualifyLocation( object oNPC, int bInitQualify = FALSE ){

	object oCombatController 		= GetCombatControllerProxy( oNPC );
	if( !GetIsObjectValid( oCombatController) ){
		//PrettyDebug( "QualifyLocation::ERROR Invalid controller ");
		return FALSE;
	}
	

	// Create waypoint if not around
	if( bInitQualify){
		//PrettyDebug( "QualifyLocation::bInitQualify TRUE ");
		SetLocalInt( oNPC, VAR_EXPLORE_QUAL_ROUNDS, PARAM_EXPLORE_QUAL_ROUNDS );
		CreateNewExploreWaypoint( oCombatController, oNPC );
	}
	
	// If no Waypoint around, nothing to qualify
	object oWP 						= GetNearestExplorationWaypoint( oNPC );
	if( !GetIsObjectValid( oWP ) ){
		//PrettyDebug( "QualifyLocation::ERROR Invalid WP ");
		return FALSE;
	}
	
	// Dig it
	QualifyLocationDig( oNPC, oWP, oCombatController );
	
	
	return FALSE;
	
}

// ##############################
// 
// ##############################

// Determines if a creature is already in combat
int GetIsEnteredInCombat( object oNPC ){
	
	if( GetIsObjectValid(GetLocalObject( oNPC, VAR_OBJ_COMB_CONT ) ) ) {
		return TRUE;	
	}
	return FALSE;
	
}

// Determines if a creature is going to enter combat
int GetIsEnteringCombat( object oNPC ){

	return TRUE;

}



// ##############################
// 
// ##############################

// Gets a flag on the controller : team attacked
int	GetCombatControllerFlagHarmed( object oCombatController ){

	return GetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_HARM );
}

// Gets a flag on the controller : enemy spoted
int	GetCombatControllerFlagPerceived( object oCombatController ){

	return GetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_PERC );

}


// Sets a flag on the controller : team attacked
int	SetCombatControllerFlagHarmed( object oNPC ){

	object oCombatController 		= GetCombatControllerProxy( oNPC );
	if( !GetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_HARM ) ){
		SetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_HARM, TRUE );
		return TRUE;
	}
	return FALSE;
}

// Sets a flag on the controller : enemy spoted
int	SetCombatControllerFlagPerceived( object oNPC ){

	object oCombatController 		= GetCombatControllerProxy( oNPC );
	if( !GetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_PERC ) ){
		SetLocalInt( oCombatController, VAR_COMB_CONT_FLAG_PERC, TRUE );
		return TRUE;
	}
	return FALSE;
}






// returns FALSE if the combat controller has no ambush role member
int GetCombatControllerHasRoleAmbush( object oNPC ){

	object oCombatController 	= GetCombatControllerProxy( oNPC );
	return GetLocalInt( oCombatController, VAR_HAS_ROLE_AMBUSH );

}


// 
// returns FALSE if oNPC has no ambushing skills
// Cached data : -1 => No ability / >1 => Has Ability
int GetHasRoleAmbush( object oNPC ){

	// Check cached value first
	int nHasRole 		= GetLocalInt( oNPC, VAR_HAS_ROLE_AMBUSH );
	if( -1 == nHasRole ){return FALSE;}
	if( 0 < nHasRole ) {return TRUE;}
	
	
	// Perform checks and cache the result
	nHasRole 			+= GetHasFeat( FEAT_SNEAK_ATTACK, oNPC, TRUE );
	nHasRole 			+= GetSkillRank( SKILL_HIDE, oNPC ) > 10 ;
	
	// Has Role
	if( 0 < nHasRole ){
	//PrettyDebug( "GetHasRoleAmbush::Is ambusher "+GetName( oNPC ) );
		object oCombatController 	= GetCombatControllerProxy( oNPC );
		SetLocalInt( oCombatController, VAR_HAS_ROLE_AMBUSH, TRUE );
		SetLocalInt( oNPC, VAR_HAS_ROLE_AMBUSH, TRUE );
	 	return TRUE;
	}
	
	// Has not
	SetLocalInt( oNPC, VAR_HAS_ROLE_AMBUSH, -1 );
	return FALSE;

}



// returns FALSE if oNPC has no casting skills
// Cached data : -1 => No ability / >1 => Has Ability
int GetHasRoleCaster( object oNPC ){

	// Check cached value first
	int nHasRole 		= GetLocalInt( oNPC, VAR_HAS_ROLE_CASTER );
	if( -1 == nHasRole ){return FALSE;}
	if( 0 < nHasRole ) {return TRUE;}
	
	// Perform checks and cache the result
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_WIZARD, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_SORCERER, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_ARCANE_SCHOLAR, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_ELDRITCH_KNIGHT, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_HELLFIRE_WARLOCK, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_PALEMASTER, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_RED_WIZARD, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_WARLOCK, oNPC );
	
	// Has Role
	if( 0 < nHasRole ){
	//PrettyDebug( "GetHasRoleCaster::Is caster "+GetName( oNPC ) );
		object oCombatController 	= GetCombatControllerProxy( oNPC );
		SetLocalInt( oCombatController, VAR_HAS_ROLE_CASTER, TRUE );
		SetLocalInt( oNPC, VAR_HAS_ROLE_CASTER, TRUE );
	 	return TRUE;
	}
	
	// Has not
	SetLocalInt( oNPC, VAR_HAS_ROLE_CASTER, -1 );
	return FALSE;
}
// returns FALSE if oNPC has no buffing skills
// Cached data : -1 => No ability / >1 => Has Ability
int GetHasRoleBuffer( object oNPC ){
	
	// Check cached value first
	int nHasRole 		= GetLocalInt( oNPC, VAR_HAS_ROLE_BUFFER );
	if( -1 == nHasRole ){return FALSE;}
	if( 0 < nHasRole ) {return TRUE;}
	
	// Perform checks and cache the result
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_BARD, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_CLERIC, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_DRUID, oNPC );
	nHasRole 			+= GetLevelByClass( CLASS_TYPE_ELEMENTAL, oNPC );

	
	// Has Role
	if( 0 < nHasRole ){
	//PrettyDebug( "GetHasRoleBuffer::Is buffer "+GetName( oNPC ) );
		object oCombatController 	= GetCombatControllerProxy( oNPC );
		SetLocalInt( oCombatController, VAR_HAS_ROLE_BUFFER, TRUE );
		SetLocalInt( oNPC, VAR_HAS_ROLE_BUFFER, TRUE );
	 	return TRUE;
	}
	
	// Has not
	SetLocalInt( oNPC, VAR_HAS_ROLE_BUFFER, -1 );
	return FALSE;

}


// returns FALSE if oNPC has no ranged skills
// Cached data : -1 => No ability / >1 => Has Ability
int GetHasRoleRanged( object oNPC ){

	// Check cached value first
	int nHasRole 		= GetLocalInt( oNPC, VAR_HAS_ROLE_RANGED );
	if( -1 == nHasRole ){return FALSE;}
	if( 0 < nHasRole ) {return TRUE;}
	
	// Perform checks and cache the result
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_DART, oNPC );
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW, oNPC );
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_LONGBOW, oNPC );
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_SHORTBOW, oNPC );
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_SHURIKEN, oNPC );
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_SLING, oNPC );
		nHasRole 			+= GetHasFeat( FEAT_WEAPON_FOCUS_THROWING_AXE, oNPC );
		nHasRole 			+= GetHasFeat( CLASS_TYPE_WARLOCK, oNPC );
	// Has Role
	if( 0 < nHasRole ){
	//PrettyDebug( "GetHasRoleRanged::Is ranged "+GetName( oNPC ) );
		object oCombatController 	= GetCombatControllerProxy( oNPC );
		SetLocalInt( oCombatController, VAR_HAS_ROLE_RANGED, TRUE );
		SetLocalInt( oNPC, VAR_HAS_ROLE_RANGED, TRUE );
	 	return TRUE;
	}
	
	// Has not
	SetLocalInt( oNPC, VAR_HAS_ROLE_RANGED, -1 );
	return FALSE;
}


// void main(){}