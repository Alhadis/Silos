/*

	This file defines class based modifiers to spells and is run prior to each spell being cast.
	
*/
#include "_HkSpell"
// includes function to stop the spell script from firing
#include "x2_inc_switches"

//#include "_SCUtility"


//Note that this follows the reasoning that things should be permitted
void main()
{
	object oTarget = HkGetSpellTarget();
	object oCaster = OBJECT_SELF;
	
	int iSpellId = GetLocalInt( oCaster, "HKTEMP_SpellId" );
	int iDescriptor = GetLocalInt( oCaster, "HKTEMP_Descriptor" );
	//int iSpellLevel = GetLocalInt( oCaster, "HKTEMP_SpellLevel" );
	//int iClass = GetLocalInt( oCaster, "HKTEMP_Class" );
	//int iSpellSchool = GetLocalInt( oCaster, "HKTEMP_School" );
	//int iSpellSubSchool = GetLocalInt( oCaster, "HKTEMP_SubSchool" );

	if ( iDescriptor & SCMETA_DESCRIPTOR_COLD )
	{
		if (GetHasFeat(FEAT_FROSTMAGE_PIERCING_COLD, oCaster )  ) // && iDamageModType == DAMAGE_TYPE_COLD
		{
			SetLocalInt( oCaster, "HKTEMP_damagepiercing", TRUE );
			SetLocalInt( oCaster, "HKTEMP_savetype", DAMAGE_TYPE_MAGICAL );
		}
	}
	
	
	if ( iDescriptor & SCMETA_DESCRIPTOR_SONIC )
	{
		if (GetHasFeat(FEAT_LYRIC_THAUM_SONIC_MIGHT, oCaster )  ) // && iDamageModType == DAMAGE_TYPE_COLD
		{
			SetLocalInt( oCaster, "HKTEMP_damagebonustype", DAMAGE_TYPE_SONIC );
			SetLocalInt( oCaster, "HKTEMP_damagebonusdiesize", 6 );
			SetLocalInt( oCaster, "HKTEMP_damagebonusnumdie", 4 );
			
		}
	}

}