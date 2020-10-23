/*
This is a basic trigger
*/
#include "_CSLCore_Environment"

void main()
{
	object oPC =  GetEnteringObject();
	object oTrigger = OBJECT_SELF;
	
	if (  GetIsPC( oPC ) || GetIsOwnedByPlayer( oPC )  )
	{
		SetLocalInt( oPC, "HKPERM_metamagicmod", GetLocalInt(oTrigger, "TG_METAMAGICMOD") );
		SetLocalInt( oPC, "HKPERM_Spell_Power", GetLocalInt(oTrigger, "TG_SPELLPOWER") );
		SetLocalInt( oPC, "HKPERM_Spell_PowerAdj", GetLocalInt(oTrigger, "TG_SPELLPOWERADJ") );
		SetLocalInt( oPC, "HKPERM_Spell_Duration", GetLocalInt(oTrigger, "TG_DURATION") );
		SetLocalInt( oPC, "HKPERM_Spell_DurationAdj", GetLocalInt(oTrigger, "TG_DURATIONADJ") );
		SetLocalInt( oPC, "HKPERM_Spell_DurationCatAdj", GetLocalInt(oTrigger, "TG_DURATIOINCATADJ") );
		SetLocalInt( oPC, "HKPERM_Spell_CapAdj", GetLocalInt(oTrigger, "TG_SPELLCAPADJ") );
	}
}