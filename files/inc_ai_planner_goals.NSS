// script_name
/*
	Description:
	
*/
// Alban 1008*

#include "inc_ai_planner_const"
#include "inc_ai_planner_constraints"
#include "inc_ai_planner_data_ar_wp"
#include "ginc_debug"

string GetGoalEffects( string sGoal ){

	return GetStorageString( GetCacheObject(), GOALS_STORAGE, sGoal + GOALS_2DA_EFFECT );

} 


string GetGoalConditions( string sGoal ){

	return GetStorageString( GetCacheObject(), GOALS_STORAGE, sGoal + GOALS_2DA_COND );

} 

string GetHighestGoal( object oNPC ){

	string sVar			= GetStorageLastVarName( oNPC, GOALS_ARRAY );
	//
	DeleteStorageLocalFloat(  oNPC, GOALS_ARRAY, sVar );
	//
	return sVar;
	
}

float GetHighestGoalValue( object oNPC ){

	return GetStorageLastValueFloat( oNPC, GOALS_ARRAY );
	
}

string GetLastGoal( object oNPC ) {

	return GetLocalString( oNPC, GOALS_LAST );

}

int SetLastGoal( object oNPC, string sGoal ) {

	SetLocalString( oNPC, GOALS_LAST, sGoal );
	//
	return TRUE;
}

float GetLastGoalValue( object oNPC ) {

	return GetLocalFloat( oNPC, GOALS_LAST_VALUE );

}

int SetLastGoalValue( object oNPC, float fValue ) {

	SetLocalFloat( oNPC, GOALS_LAST_VALUE, fValue );
	//
	return TRUE;
}