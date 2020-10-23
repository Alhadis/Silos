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
		oPC = GetExitingObject();
	}
	
	if (  GetIsPC( oPC ) || GetIsOwnedByPlayer( oPC )  )
	{
		SetLocalInt( oPC, "HKPERM_metamagicmod", 0 );
		SetLocalInt( oPC, "HKPERM_Spell_Power", 0 );
		SetLocalInt( oPC, "HKPERM_Spell_PowerAdj", 0 );
		SetLocalInt( oPC, "HKPERM_Spell_Duration", 0 );
		SetLocalInt( oPC, "HKPERM_Spell_DurationAdj", 0 );
		SetLocalInt( oPC, "HKPERM_Spell_DurationCatAdj", 0 );
		SetLocalInt( oPC, "HKPERM_Spell_CapAdj", 0 );
	}
	//CSLEnviroExit( oPC, CSL_ENVIRO_POISON );
	//CSLEnviroCheckDeadMagicState( oPC );
}