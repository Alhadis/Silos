//////////////////////////////////////////////////////////////////////
//	Author: Drammel													//
//	Date: 4/28/2009													//
//	Name: TB_ssweaponfocu											//
//	Description: Based on a variable set into the levelup 			//
//	menu grants the Swordsage the Weapon Focus Feats for his		//
// chosen discipline. Needs to be written in such as way to 		//
//	prevent the Warblade's Weapon Aptitude from exchanging for other//
// feats as per the ruling at										//
//	http://boards1.wizards.com/showpost.php?p=13144668&postcount=3	//
// Since this class feature grants weapon focus to a group of 	//
//	weapons rather than a single weapon.							//
//////////////////////////////////////////////////////////////////////
//#include "bot9s_include"
//#include "bot9s_inc_constants"
#include "_HkSpell"
#include "_SCInclude_TomeBattle"

void main()
{	
	
	//--------------------------------------------------------------------------
	//Prep the Maneuver
	//--------------------------------------------------------------------------
	int iSpellId = -1;
	object oPC = OBJECT_SELF;
	object oToB = CSLGetDataStore(oPC);
	//--------------------------------------------------------------------------

	if (GetHasFeat(FEAT_WEAPON_FOCUS_SCIMITAR) && GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_MACE)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_SPEAR) && GetHasFeat(FEAT_WEAPON_FOCUS_FALCHION))
	{
		SetLocalInt(oToB, "SSWeaponFocus", 1);
	}
	else if (GetHasFeat(FEAT_WEAPON_FOCUS_RAPIER) && GetHasFeat(FEAT_WEAPON_FOCUS_BASTARD_SWORD)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_KATANA) && GetHasFeat(FEAT_WEAPON_FOCUS_SICKLE))
	{
		SetLocalInt(oToB, "SSWeaponFocus", 3);
	}
	else if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE) && GetHasFeat(FEAT_WEAPON_FOCUS_SLING)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_STAFF) && GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD))
	{
		SetLocalInt(oToB, "SSWeaponFocus", 5);
	}
	else if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE) && GetHasFeat(FEAT_WEAPON_FOCUS_SHURIKEN)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW) && GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_SCYTHE) && GetHasFeat(FEAT_WEAPON_FOCUS_DAGGER))
	{
		SetLocalInt(oToB, "SSWeaponFocus", 6);
	}
	else if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE) && GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_WARMACE) && GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_SWORD))
	{
		SetLocalInt(oToB, "SSWeaponFocus", 7);
	}
	else if (GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE) && GetHasFeat(FEAT_WEAPON_FOCUS_CREATURE)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW) && GetHasFeat(FEAT_WEAPON_FOCUS_HAND_AXE)
	&& GetHasFeat(FEAT_WEAPON_FOCUS_KAMA) && GetHasFeat(FEAT_WEAPON_FOCUS_KUKRI) && GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE))
	{
		SetLocalInt(oToB, "SSWeaponFocus", 8);
	}

	if (GetLocalInt(oToB, "SSWeaponFocus") == 1) //Desert Wind
	{
		int nScimitar = FEAT_WEAPON_FOCUS_SCIMITAR;
		int nLightMace = FEAT_WEAPON_FOCUS_LIGHT_MACE;
		int nSpear = FEAT_WEAPON_FOCUS_SPEAR;
		int nFalchion = FEAT_WEAPON_FOCUS_FALCHION;

		SetLocalInt(oToB, "WeaponAptitudeCheck1", nScimitar);
		SetLocalInt(oToB, "WeaponAptitudeCheck2", nLightMace);
		SetLocalInt(oToB, "WeaponAptitudeCheck3", nSpear);
		SetLocalInt(oToB, "WeaponAptitudeCheck4", nFalchion);

		if (!GetHasFeat(nScimitar))
		{
			CSLWrapperFeatAdd(oPC, nScimitar, FALSE);
		}

		if (!GetHasFeat(nLightMace))
		{
			CSLWrapperFeatAdd(oPC, nLightMace, FALSE);
		}

		if (!GetHasFeat(nSpear))
		{
			CSLWrapperFeatAdd(oPC, nSpear, FALSE);
		}

		if (!GetHasFeat(nFalchion))
		{
			CSLWrapperFeatAdd(oPC, nFalchion, FALSE);
		}
	}
	else if (GetLocalInt(oToB, "SSWeaponFocus") == 3) //Diamond Mind
	{
		int nRapier = FEAT_WEAPON_FOCUS_RAPIER;
		int nSickle = FEAT_WEAPON_FOCUS_SICKLE;
		int nBastardSword = FEAT_WEAPON_FOCUS_BASTARD_SWORD;
		int nKatana = FEAT_WEAPON_FOCUS_KATANA;

		SetLocalInt(oToB, "WeaponAptitudeCheck1", nRapier);
		SetLocalInt(oToB, "WeaponAptitudeCheck2", nSickle);
		SetLocalInt(oToB, "WeaponAptitudeCheck3", nBastardSword);
		SetLocalInt(oToB, "WeaponAptitudeCheck4", nKatana);

		if (!GetHasFeat(nRapier))
		{
			CSLWrapperFeatAdd(oPC, nRapier, FALSE);
		}

		if (!GetHasFeat(nSickle))
		{
			CSLWrapperFeatAdd(oPC, nSickle, FALSE);
		}

		if (!GetHasFeat(nBastardSword))
		{
			CSLWrapperFeatAdd(oPC, nBastardSword, FALSE);
		}

		if (!GetHasFeat(nKatana))
		{
			CSLWrapperFeatAdd(oPC, nKatana, FALSE);
		}
	}
	else if (GetLocalInt(oToB, "SSWeaponFocus") == 5) //Setting Sun
	{
		int nUnarmed = 100;
		int nShortSword = FEAT_WEAPON_FOCUS_SHORT_SWORD;
		int nSling = FEAT_WEAPON_FOCUS_SLING;
		int nQuarterstaff = FEAT_WEAPON_FOCUS_STAFF;

		SetLocalInt(oToB, "WeaponAptitudeCheck1", nUnarmed);
		SetLocalInt(oToB, "WeaponAptitudeCheck2", nSling);
		SetLocalInt(oToB, "WeaponAptitudeCheck3", nShortSword);
		SetLocalInt(oToB, "WeaponAptitudeCheck4", nQuarterstaff);

		if (!GetHasFeat(nUnarmed))
		{
			CSLWrapperFeatAdd(oPC, nUnarmed, FALSE);
		}

		if (!GetHasFeat(nShortSword))
		{
			CSLWrapperFeatAdd(oPC, nShortSword, FALSE);
		}

		if (!GetHasFeat(nSling))
		{
			CSLWrapperFeatAdd(oPC, nSling, FALSE);
		}

		if (!GetHasFeat(nQuarterstaff))
		{
			CSLWrapperFeatAdd(oPC, nQuarterstaff, FALSE);
		}
	}
	else if (GetLocalInt(oToB, "SSWeaponFocus") == 6) // Shadow Hand
	{
		int nUnarmed = 100;
		int nShortSword = FEAT_WEAPON_FOCUS_SHORT_SWORD;
		int nDagger = FEAT_WEAPON_FOCUS_DAGGER;
		int nShortBow = FEAT_WEAPON_FOCUS_SHORTBOW;
		int nScythe = FEAT_WEAPON_FOCUS_SCYTHE;
		int nShuriken = FEAT_WEAPON_FOCUS_SHURIKEN;

		SetLocalInt(oToB, "WeaponAptitudeCheck1", nUnarmed);
		SetLocalInt(oToB, "WeaponAptitudeCheck2", nShortSword);
		SetLocalInt(oToB, "WeaponAptitudeCheck3", nDagger);
		SetLocalInt(oToB, "WeaponAptitudeCheck4", nShortBow);
		SetLocalInt(oToB, "WeaponAptitudeCheck5", nScythe);
		SetLocalInt(oToB, "WeaponAptitudeCheck6", nShuriken);

		if (!GetHasFeat(nUnarmed))
		{
			CSLWrapperFeatAdd(oPC, nUnarmed, FALSE);
		}

		if (!GetHasFeat(nShortSword))
		{
			CSLWrapperFeatAdd(oPC, nShortSword, FALSE);
		}

		if (!GetHasFeat(nDagger))
		{
			CSLWrapperFeatAdd(oPC, nDagger, FALSE);
		}

		if (!GetHasFeat(nShortBow))
		{
			CSLWrapperFeatAdd(oPC, nShortBow, FALSE);
		}

		if (!GetHasFeat(nScythe))
		{
			CSLWrapperFeatAdd(oPC, nScythe, FALSE);
		}

		if (!GetHasFeat(nShuriken))
		{
			CSLWrapperFeatAdd(oPC, nShuriken, FALSE);
		}
	}
	else if (GetLocalInt(oToB, "SSWeaponFocus") == 7) // Stone Dragon
	{
		int nUnarmed = 100;
		int nGreatSword = FEAT_WEAPON_FOCUS_GREAT_SWORD;
		int nGreatAxe = FEAT_WEAPON_FOCUS_GREAT_AXE;
		int nWarMace = FEAT_WEAPON_FOCUS_WARMACE;

		SetLocalInt(oToB, "WeaponAptitudeCheck1", nUnarmed);
		SetLocalInt(oToB, "WeaponAptitudeCheck2", nGreatSword);
		SetLocalInt(oToB, "WeaponAptitudeCheck3", nGreatAxe);
		SetLocalInt(oToB, "WeaponAptitudeCheck4", nWarMace);

		if (!GetHasFeat(nUnarmed))
		{
			CSLWrapperFeatAdd(oPC, nUnarmed, FALSE);
		}

		if (!GetHasFeat(nGreatSword))
		{
			CSLWrapperFeatAdd(oPC, nGreatSword, FALSE);
		}

		if (!GetHasFeat(nGreatAxe))
		{
			CSLWrapperFeatAdd(oPC, nGreatAxe, FALSE);
		}

		if (!GetHasFeat(nWarMace))
		{
			CSLWrapperFeatAdd(oPC, nWarMace, FALSE);
		}
	}
	else if (GetLocalInt(oToB, "SSWeaponFocus") == 8) // Tiger Claw
	{
		int nUnarmed = 100;
		int nClaw = 291;
		int nGreatAxe = FEAT_WEAPON_FOCUS_GREAT_AXE;
		int nShortBow = FEAT_WEAPON_FOCUS_SHORTBOW;
		int nKukri = FEAT_WEAPON_FOCUS_KUKRI;
		int nHandAxe = FEAT_WEAPON_FOCUS_HAND_AXE;

		SetLocalInt(oToB, "WeaponAptitudeCheck1", nUnarmed);
		SetLocalInt(oToB, "WeaponAptitudeCheck2", nClaw);
		SetLocalInt(oToB, "WeaponAptitudeCheck3", nGreatAxe);
		SetLocalInt(oToB, "WeaponAptitudeCheck4", nShortBow);
		SetLocalInt(oToB, "WeaponAptitudeCheck5", nKukri);
		SetLocalInt(oToB, "WeaponAptitudeCheck6", nHandAxe);

		if (!GetHasFeat(nUnarmed))
		{
			CSLWrapperFeatAdd(oPC, nUnarmed, FALSE);
		}

		if (!GetHasFeat(nClaw))
		{
			CSLWrapperFeatAdd(oPC, nClaw, FALSE);
		}

		if (!GetHasFeat(nShortBow))
		{
			CSLWrapperFeatAdd(oPC, nShortBow, FALSE);
		}

		if (!GetHasFeat(nGreatAxe))
		{
			CSLWrapperFeatAdd(oPC, nGreatAxe, FALSE);
		}

		if (!GetHasFeat(nKukri))
		{
			CSLWrapperFeatAdd(oPC, nKukri, FALSE);
		}

		if (!GetHasFeat(nHandAxe))
		{
			CSLWrapperFeatAdd(oPC, nHandAxe, FALSE);
		}
	}
}
