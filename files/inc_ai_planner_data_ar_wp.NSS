// inc_ai_planner_data_ar_wp
/*
	Description:
	
*/
// Alban 1008

#include "ginc_debug"
#include "inc_ai_planner_const" 


const string DEFAULT_LOCATION 		= "DEFAULT_LOCATION";
const string ARRAY_OBJECT 			= "dataobject";
const string UNIQUE_ID 				= "STORAGE_";
const string MODULE_NPCID_COUNT 	= "MODULE_NPCID_COUNT";


// TODO : Maybe it would be wise to immediately extend the amount of functions to cover every need
// ie include storage of all data types. Or Overkill?




// **************************************************************
// Unique identifiers
// **************************************************************


string GetObjectUniqueId( object oObject ) {

	string sUniqueId 		= GetLocalString( oObject, UNIQUE_ID );
	//
	if( "" != sUniqueId ) 	return sUniqueId;
	//
	object oModule			= GetModule();
	//
	int nModuleCount		= GetLocalInt( oModule, MODULE_NPCID_COUNT ) + 1;
	//
	sUniqueId				= UNIQUE_ID + IntToString( nModuleCount ) + "_";
	//
	SetLocalString( oObject, UNIQUE_ID, sUniqueId );
	//
	SetLocalInt( oModule, MODULE_NPCID_COUNT, nModuleCount );
	//
//PrettyDebug( "Assigned Unique Id : " + sUniqueId + " to " + GetTag( oObject ) );

	return sUniqueId;

}

// PWs might want to modify this for local ID recognition 
// for now it uses a function from inc_ai_planner_data_ar_wp
string GetCreatureUniqueId( object oCreature, int nType = PLAYER_CHAR_IS_PC ) {

	return GetObjectUniqueId( oCreature );

}



// Canon Functions

object InstanciateStorage( object oObject, string sArrayId, string sLoc = DEFAULT_LOCATION ) {

	string sUniqueId 	= GetObjectUniqueId( oObject );
	//
	location lLoc = GetLocation( GetObjectByTag( sLoc ) );
	//
	return CreateObject( OBJECT_TYPE_WAYPOINT, ARRAY_OBJECT, lLoc, FALSE, sUniqueId + sArrayId );

}
	
object GetStorage(  object oObject, string sArrayId )
{

	string sUniqueId 	= GetObjectUniqueId( oObject );
	object oA 			= GetObjectByTag( sUniqueId + sArrayId );
	//
	if( !GetIsObjectValid( oA ) )
		
		oA = InstanciateStorage( oObject, sArrayId );
		
	return oA;
	
}

int DestroyStorage( object oObject, string sArrayId ){

	string sUniqueId 	= GetObjectUniqueId( oObject );
	DestroyObject( GetObjectByTag( sUniqueId + sArrayId ) );  	
	return FALSE;
}

// Used when you want to initiate an empty storage that was eventually previously instanced
object CreateStorage( object oObject, string sArrayId ){
	
	object oOldArray = GetStorage( oObject, sArrayId );
	//
	if( GetIsObjectValid( oOldArray ) ) DestroyObject( oOldArray );	
	//
	object oA = InstanciateStorage( oObject, sArrayId );
	//	
	return oA;

}

int AddToStorageFloat( object oObject, string sArrayId, string sVar, float fValue ){

	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( ! GetIsObjectValid( oA ) ) {
		//PrettyDebug( "AddToStorageFloat::Invalid object" );
		return FALSE;
	}
	SetLocalFloat( oA, sVar, fValue );
	//PrettyDebug( "AddToStorageFloat::sVar on "+GetTag(oObject)+"-"+sArrayId+":"+sVar+" = "+FloatToString( fValue)   );
	//PrettyDebug( "AddToStorageFloat::sVar is actually "+FloatToString( GetLocalFloat( oA, sVar ) ) +" on " + GetTag( oA )  );
	//	
	return TRUE;

}

int AddToStorageString( object oObject, string sArrayId, string sVar, string sValue ){

	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( ! GetIsObjectValid( oA ) ) return FALSE;
	
	SetLocalString( oA, sVar, sValue );
	//	
	return TRUE;

}

int AddToStorageObject( object oObject, string sArrayId, string sVar, object oStored ){

	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( ! GetIsObjectValid( oA ) ) return FALSE;
	
	SetLocalObject ( oA, sVar, oStored );
	//	
	return TRUE;

}


int DeleteStorageLocalFloat( object oObject, string sArrayId, string sVar ) {

	object oA 			= GetStorage( oObject, sArrayId );
	//
	DeleteLocalFloat( oA, sVar );
	//
	return TRUE;

}


int DeleteStorageLocalObject( object oObject, string sArrayId, string sVar ) {

	object oA 			= GetStorage( oObject, sArrayId );
	//
	DeleteLocalObject( oA, sVar );
	//
	return TRUE;

}



int GetStorageCount( object oObject, string sArrayId ) {

	object oA 			= GetStorage( oObject, sArrayId );
	//
	return GetVariableCount( oA );

}


float GetStorageFloat( object oObject, string sArrayId, string sVar ) {

	object oA 			= GetStorage( oObject, sArrayId );
	//
	return GetLocalFloat( oA, sVar );

}



float GetStorageFloatAtIndex( object oObject, string sArrayId, int nIndex ) {

	object oA 			= GetStorage( oObject, sArrayId );
	//
	return GetVariableValueFloat( oA, nIndex );

}





float GetStorageLastValueFloat( object oObject, string sArrayId ){

	object oA 			= GetStorage( oObject, sArrayId );
	//	
	int nLast 			= GetVariableCount( oA ) - 1 ;
	//
	return GetVariableValueFloat( oA, nLast );

}



string GetStorageLastValueString( object oObject, string sArrayId ){

	object oA 			= GetStorage( oObject, sArrayId );
	if( !GetIsObjectValid( oA ) ) {
		//PrettyDebug( "GetStorageLastValueString:: Invalid storage "+GetTag(oObject)+"-"+sArrayId  );
		return INVALID;
	}
	int nCount			= GetVariableCount( oA );
	if( nCount == 0 ) {
		//PrettyDebug( "GetStorageLastValueString:: empty storage "+GetTag(oObject)+"-"+sArrayId  );
		return INVALID;
	}
	int nLast 			=  nCount - 1 ;
	string sVar 		= GetVariableValueString( oA, nLast );
	if( "@" == sVar ) {
		//PrettyDebug( "GetStorageLastValueString:: empty value "+GetTag(oObject)+"-"+sArrayId  );
		return INVALID;
	}
		//PrettyDebug( "GetStorageLastValueString:: returns "+sVar  );
	return sVar;

}


string GetStorageLastVarName( object oObject, string sArrayId ) {

	object oA 			= GetStorage( oObject, sArrayId );
	if( !GetIsObjectValid( oA ) ) {
		//PrettyDebug( "GetStorageLastVarName:: Invalid storage "+GetTag(oObject)+"-"+sArrayId  );
		return INVALID;
	}
	int nCount			= GetVariableCount( oA );
	if( nCount == 0 ) {
		//PrettyDebug( "GetStorageLastVarName:: empty storage "+GetTag(oObject)+"-"+sArrayId  );
		return INVALID;
	}
	int nLast 			=  nCount - 1 ;
	string sVar 		= GetVariableName( oA, nLast );
	if( "@" == sVar ) {
		//PrettyDebug( "GetStorageLastVarName:: empty value "+GetTag(oObject)+"-"+sArrayId  );
		return INVALID;
	}
	//PrettyDebug( "GetStorageLastVarName:: returns "+sVar  );
	return sVar;

}


object GetStorageObject( object oObject, string sArrayId, string sVar ) {


	object oA 			= GetStorage( oObject, sArrayId );
	if( !GetIsObjectValid( oA ) ) 
		return OBJECT_INVALID;
	return GetLocalObject( oA, sVar );

}


object GetStorageObjectAtIndex( object oObject, string sArrayId, int nIndex ) {


	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( !GetIsObjectValid( oA ) ) return OBJECT_INVALID;
	//
	return GetVariableValueObject( oA, nIndex );

}


string GetStorageString( object oObject, string sArrayId, string sVar ) {


	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( !GetIsObjectValid( oA ) ) return INVALID;
	//
	return GetLocalString( oA, sVar );

}

string GetStorageStringAtIndex( object oObject, string sArrayId, int nIndex ) {


	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( !GetIsObjectValid( oA ) ) return INVALID;
	//
	return GetVariableValueString( oA, nIndex );

}

string GetStorageVarNameAtIndex( object oObject, string sArrayId, int nIndex ) {

	object oA 			= GetStorage( oObject, sArrayId );
	//
	if( !GetIsObjectValid( oA ) ) return INVALID;
	//
	return GetVariableName( oA, nIndex );

}


// Performs an ASC sort on object variables with tag sArray
// works directly on storage, much like with a pointer 
int SortStorageFloat( object oObject, string sArrayId ){

	int nSorted = FALSE;
	//
	object oA 			= GetStorage( oObject, sArrayId );
	//
//PrettyDebug( "///// Array before sort ///// " );
// PrettyDump( oA);
	//
	if( !GetIsObjectValid( oA ) ) return FALSE;
	
	int nCount = GetVariableCount( oA );
	//
	int i;
	//
	float fT;
	//
	string sT;
	//
	while( FALSE == nSorted ){
		
		nSorted = TRUE;
		//
		for( i = 0; i < nCount - 1 ; i++){
			
			if( GetVariableValueFloat( oA, i ) > GetVariableValueFloat( oA, i + 1 ) ) {
				
				fT = GetVariableValueFloat( oA, i );
				//
				sT = GetVariableName( oA, i );
				//
				DeleteLocalFloat( oA, sT );
				//
				SetLocalFloat( oA, sT, fT );
				//
				nSorted = FALSE;
			
			}
		
		}
	//
	}
//PrettyDebug( "///// Array after sort ///// " );
// PrettyDump( oA);	//
	return TRUE;

}

// Sort an integer list / array / storage
// Certainly not the most efficient algo around but it works
int SortStorageInt(  object oObject, string sArrayId ){

	int nSorted = FALSE;
	object oA 			= GetStorage( oObject, sArrayId );
	if( !GetIsObjectValid( oA ) ) return FALSE;
	
	int nCount = GetVariableCount( oA );
	int i;
	int nT;
	string sT;
	while( FALSE == nSorted ){
		
		nSorted = TRUE;
		for( i = 0; i < nCount - 1 ; i++){
			
			if( GetVariableValueInt( oA, i ) > GetVariableValueInt( oA, i + 1 ) ) {
				
				nT = GetVariableValueInt( oA, i );
				sT = GetVariableName( oA, i );
				DeleteLocalInt( oA, sT );
				SetLocalInt( oA, sT, nT );
				nSorted = FALSE;
			
			}
		}
	}
//PrettyDebug( "///// Array after sort ///// " );
//PrettyDump( oA);	
	return TRUE;

}

int UpdateStorageFloat( object oObject, string sArrayId, string sVar, float fValue ){

	object oA 			= GetStorage( oObject, sArrayId );
	//	
	if( ! GetIsObjectValid( oA ) ) {
		//PrettyDebug( "UpdateStorageFloat::Invalid object"); 
		return FALSE;
	}
	fValue				= GetLocalFloat( oA, sVar ) + fValue;
	//
	SetLocalFloat( oA, sVar, fValue );
	//	
	return TRUE;
	
}