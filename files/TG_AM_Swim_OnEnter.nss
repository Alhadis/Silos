/*
This is a basic trigger or area script, to allow underwater events to work properly
*/
#include "_CSLCore_Environment"
//#include "_CSLCore_Appearance"


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
	
	
	CSLStoreTrueAppearance(oPC);
	CSLAnimationOverride(oPC, CSL_ANIMATEOVERRIDE_SWIMMING );
	
	if ( CSLGetAnimateOverride( oPC ) == CSL_ANIMATEOVERRIDE_SWIMMING )
	{
		effect eEffect = EffectCutsceneGhost();
		eEffect = EffectLinkEffects(eEffect, EffectConcealment( 75, MISS_CHANCE_TYPE_VS_RANGED) );
		eEffect = SupernaturalEffect( eEffect );
		eEffect = SetEffectSpellId(eEffect, -155 );
		SetCollision(oPC, FALSE);
		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oPC );
	}
	
	//CSLEnviroEntry( oPC, CSL_ENVIRO_WATER );
}