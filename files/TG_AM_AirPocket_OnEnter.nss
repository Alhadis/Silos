/*
This is a basic trigger
*/
#include "_CSLCore_Environment"

void main()
{
	object oPC;
	if ( GetObjectType( OBJECT_SELF ) == OBJECT_TYPE_CREATURE ) // script is being manually run on the target, generally done via areas
	{
		oPC = OBJECT_SELF;
	}
	else // if ( GetObjectType( OBJECT_SELF ) == OBJECT_TYPE_TRIGGER || GetObjectType( OBJECT_SELF ) == OBJECT_TYPE_AREA_OF_EFFECT )
	{
		oPC = GetEnteringObject();
	}
	
	CSLEnviroEntry( oPC, CSL_ENVIRO_AIRPOCKET );
	CSLEnviroCheckWaterState( oPC );
}
/*

void main()
{
	object oPC =  GetEnteringObject();
	
	if (  GetIsPC( oPC ) || GetIsOwnedByPlayer( oPC )  )
	{
		SetLocalInt( oPC, "AIRPOCKET", TRUE );
		CSLEnviroSlowingWater( oPC, 0 );
	}
	
	CSLEnviroEntry( oPC, CSL_ENVIRO_AIRPOCKET );
}
*/