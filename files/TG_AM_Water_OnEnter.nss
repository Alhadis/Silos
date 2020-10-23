/*
This is a basic trigger or area script, to allow underwater events to work properly
*/
#include "_CSLCore_Environment"
//#include "_SCInclude_Invisibility"


void main()
{
//	DEBUGGING = GetLocalInt( GetModule(), "DEBUGLEVEL" );
	
	object oPC;
	
	int iSelfType = GetObjectType( OBJECT_SELF );
	if ( iSelfType == OBJECT_TYPE_CREATURE )
	{
		oPC = OBJECT_SELF;
	}
	else if ( iSelfType == OBJECT_TYPE_TRIGGER )
	{
		oPC =  GetEnteringObject();
		
	}
	else
	{
		oPC = GetEnteringObject();
	}
	
	
	CSLEnviroEntry( oPC, CSL_ENVIRO_WATER );
}