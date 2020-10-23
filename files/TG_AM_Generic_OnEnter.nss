/*
This is a basic trigger
*/
#include "_CSLCore_Environment"

void main()
{
	object oPC;
	object oSelf; // this is the trigger object
	if ( GetObjectType( OBJECT_SELF ) == OBJECT_TYPE_CREATURE ) // script is being manually run on the target, generally done via areas
	{
		oPC = OBJECT_SELF;
		oSelf = GetArea( oPC );
	}
	if ( GetObjectType( OBJECT_SELF ) == OBJECT_TYPE_TRIGGER || GetObjectType( OBJECT_SELF ) == OBJECT_TYPE_AREA_OF_EFFECT )
	{
		oSelf = OBJECT_SELF;
		oPC = GetEnteringObject();
	}
	else // 
	{
		oSelf = OBJECT_SELF; // just guessing here
		oPC = GetEnteringObject();
	}
	
	int iAreaState = GetLocalInt( oSelf, "CSL_ENVIRO" );
	
	CSLEnviroEntryScriptByAreaState( oPC, iAreaState );
	
}