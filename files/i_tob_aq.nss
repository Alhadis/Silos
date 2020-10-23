//////////////////////////////////////////////////
//	Author: Drammel								//
//	Date: 2/28/2010								//
//	Name: i_tob_aq								//
//	Description: Acts as a pseudo Module load 	//
// event for the Tome of Battle. Anything that//
// would normally go into a module load event //
// goes here and thus circumvents a lot of 	//
// pesky compatibility issues. 				//
//////////////////////////////////////////////////
//#include "bot9s_inc_2da"
//#include "bot9s_inc_constants"
//#include "bot9s_inc_feats"
//#include "bot9s_include"
#include "_SCInclude_TomeBattle"

void Reaper(object oPC)
{
	object oToB = CSLGetDataStore(oPC); //The validity check is made in the event that the object is destroyed.

	if ((GetCurrentHitPoints(oPC) < 1) && GetIsObjectValid(oToB))
	{
		DeleteLocalInt(oToB, "Strike1");
		DeleteLocalInt(oToB, "Strike2");
		DeleteLocalInt(oToB, "Strike3");
		DeleteLocalInt(oToB, "Strike4");
		DeleteLocalInt(oToB, "Strike5");
		DeleteLocalInt(oToB, "Strike6");
		DeleteLocalInt(oToB, "Strike7");
		DeleteLocalInt(oToB, "Strike8");
		DeleteLocalInt(oToB, "Strike9");
		DeleteLocalInt(oToB, "Strike10");
		DeleteLocalInt(oToB, "Strike11");
		DeleteLocalInt(oToB, "Strike12");
		DeleteLocalInt(oToB, "Strike13");
		DeleteLocalInt(oToB, "Strike14");
	}

	DelayCommand(0.1f, Reaper(oPC));
}

void RunIsEncounterActive(object oPC)
{
	object oToB = CSLGetDataStore(oPC);

	effect eLoop = EffectVisualEffect(VFX_TOB_BLANK); // Paceholder effect to detect the recursive loop.
	eLoop = SupernaturalEffect(eLoop);
	eLoop = SetEffectSpellId(eLoop, 6501);

	if (!GetIsObjectValid(oToB)) //Error Prevention
	{
		HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLoop, oPC, 0.1f);
		DelayCommand(0.1f, RunIsEncounterActive(oPC));
		return;
	}

	if ((GetIsInCombat(oPC)) && (GetLocalInt(oToB, "Encounter") == 0))
	{
		SetLocalInt(oToB, "Encounter", 1);
		DelayCommand(6.0f, SetLocalInt(oToB, "Encounter", 2));

		if (GetHasFeat(FEAT_VITAL_RECOVERY, oPC))
		{
			SetLocalInt(oToB, "VitalRecovery", 0);
		}

		if (GetHasFeat(FEAT_DW_ADEPT, oPC))
		{
			string sPhoenix = GetFirstName(oPC) + "TB_sa_phoenix";
			object oPhoenix = GetObjectByTag(sPhoenix);

			if (GetIsObjectValid(oPhoenix))
			{
				SetLocalInt(oToB, "RisingPhoenix", 0);
			}
		}

		DelayCommand(6.0f, RunIsEncounterActive(oPC));
		HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLoop, oPC, 6.0f);
	}
	else if ((GetIsInCombat(oPC)) && (GetLocalInt(oToB, "Encounter") == 3))
	{
		SetLocalInt(oToB, "Encounter", 1);
		DelayCommand(6.0f, SetLocalInt(oToB, "Encounter", 2));
		DelayCommand(6.0f, RunIsEncounterActive(oPC));
		HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLoop, oPC, 6.0f);
	}
	else if ((!GetIsInCombat(oPC)) && (GetLocalInt(oToB, "Encounter") == 2) && (GetCurrentHitPoints(oPC) < 1))
	{
		DelayCommand(6.0f, RunIsEncounterActive(oPC));
		HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLoop, oPC, 6.0f);
	}
	else if ((!GetIsInCombat(oPC)) && (GetLocalInt(oToB, "Encounter") == 2))
	{ 	// Prevents Hide in Plain Sight style cheese.
		SetLocalInt(oToB, "Encounter", 3);
		DelayCommand(RoundsToSeconds(3), SetLocalInt(oToB, "Encounter", 0));
		DelayCommand(6.0f, RunIsEncounterActive(oPC));
		HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLoop, oPC, 6.0f);
		SetLocalInt(oPC, "bot9s_StrikeTotal", 0);
	}
	else
	{
		HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLoop, oPC, 0.1f);
		DelayCommand(0.1f, RunIsEncounterActive(oPC));
	}
}


#include "_HkSpell"

void main()
{	
	
	object oPC = GetModuleItemAcquiredBy();
	
	// need to look at the setup functions, does it matter, being done by module load event
	//SetLocalInt(oPC, "bot9s_domino", 1);
	//Domino(oPC, 1);

	if (!TOBCheckRecursive(6501, oPC))
	{
		RunIsEncounterActive(oPC);
		Reaper(oPC); // Checks to see if the player is at lower than 1 hp and does things if they are.
	}
}
