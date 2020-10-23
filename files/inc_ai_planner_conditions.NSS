// script_name
/*
	Description:
	
*/
// Alban 1008

#include "inc_ai_planner_datacontroller"
#include "ginc_debug"
// #include "inc_ai_planner_motivations"

/*
int TestProximity( object  oNPC, string sC ){
	//
	 if	( TestStringAgainstPattern( "bed", sC ) ) {
		//
		return GetIsNear( oNPC, "bed" );	
	
	}
	//
	else if	( TestStringAgainstPattern( "food", sC ) ) {
		//
		return GetIsNear( oNPC, "food" );	

	}
	//
	return FALSE;
	

}
*/


// TODO : Replace with library dependant ExecuteScript Condition functions
// Reads the Condition string, stores param, executes condition script
// which sets its result on the object
int GetConditionsValid( object  oNPC, string sC ){

	string sParam		= GetParamFromTuple( sC );
	sC 					= GetEffectFromTuple( sC );
// PrettyDebug( "() GetConditionsValid : with Condition : "+sC+" and param " + sParam);
	// SOME TOKENIZATION WILL HAPPEN HERE IN THE FUTURE
	// IF MORE THAN ONE CONDITION PER GOAL / TASK WAS TO BE USED
	//
	int bResult 		= FALSE;
	//
	SetLocalString( oNPC, CONDITION_PARAM, sParam );
	//
	ExecuteScript( CONDITION_SCRIPT_PREFIX + sC, oNPC );
	//
	return GetLocalInt( oNPC, CONDITION_RESULT );	
	
	// IF TOKENIZATION, FOLLOWING CODE IN WHILE :
	/*
	if		( "HasFood" 	== sC ) {
		
		if( GetIsObjectValid( GetNearestObjectByTag( "food", oNPC ) ) ) {
		
			bResult = TRUE;
			//
			SetLocalObject( oNPC, TARGET, GetNearestObjectByTag( "food", oNPC ) );
		
		}
		else bResult 		= FALSE;
		
	}
	else if	( "HasBed" 		== sC ) {
	
		if( GetIsObjectValid( GetNearestObjectByTag( "bed", oNPC ) ) ){
		
			bResult = TRUE;
			//
			SetLocalObject( oNPC,  TARGET, GetNearestObjectByTag( "bed", oNPC ) );
		
		}
		//
		else bResult 		=  FALSE;

	}
	else if	( "CanMove" 	== sC ) {
		//
		bResult 			=  TRUE;

	}
	else if	( "NoDanger" 	== sC ) {
		//
		bResult 			=  TRUE;

	}
	else if	( "None" 		== sC ) {
		//
		bResult 			=  TRUE;

	}
	else if	( "NearObject" == sC ) {
		//
// PrettyDebug( "() GetConditionsValid : NearObject with Condition : "+sC );
		bResult 		= GetIsNear( oNPC, sParam );
	
	}
	
// PrettyDebug( "() GetConditionsValid returns " + IntToString( bResult ) );
*/
	return TRUE;
	
	// END WHILE
	
}