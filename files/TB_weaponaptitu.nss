//////////////////////////////////////////////////////
//	Author: Drammel									//
//	Date: 5/4/2009									//
//	Name: TB_weaponaptitu							//
//	Description: Allows the PC to change their		//
//	weapon focus and related feats.					//
//////////////////////////////////////////////////////
//#include "bot9s_include"
//#include "bot9s_inc_2da"
//#include "bot9s_inc_constants"
#include "_HkSpell"
#include "_SCInclude_TomeBattle"

void CheckItems(int i, object oItem)
{
	object oPC = OBJECT_SELF;
	object oToB = CSLGetDataStore(oPC);
	object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
	int nWeapon = GetBaseItemType(oWeapon);
	int nWpnFocus = CSLGetItemDataPrefFeatWeaponFocus( nWeapon);
	int nWpnSpec = CSLGetItemDataPrefFeatWeaponSpecialization(nWeapon);
	int nEpicDevCrit = CSLGetItemDataPrefFeatEpicDevestatingCritical(nWeapon);
	int nEpicWpnFocus = CSLGetItemDataPrefFeatEpicWeaponFocus( nWeapon);
	int nEpicWpnSpec = CSLGetItemDataPrefFeatEpicWeaponSpecialization(nWeapon);
	int nOverWhCrit = CSLGetItemDataPrefFeatOverwhelmingCritical(nWeapon);
	int nGrtrWpnFocus = CSLGetItemDataPrefFeatGreaterWeaponFocus(nWeapon);
	int nGrtrWpnSpec = CSLGetItemDataPrefFeatGreaterWeaponSpecialization(nWeapon);
	int nPowerCrit = CSLGetItemDataPrefFeatPowerCritical(nWeapon);
	int nImprCrit = CSLGetItemDataPrefFeatImprovedCritical(nWeapon);

	itemproperty ipFeat = GetFirstItemProperty(oItem);
	int i;
	int nFeat;
	int nFeatIndex;

	while (GetIsItemPropertyValid(ipFeat))
	{
		if (GetItemPropertyType(ipFeat) == ITEM_PROPERTY_BONUS_FEAT)
		{
			nFeat = GetItemPropertySubType(ipFeat);
			nFeatIndex = StringToInt(Get2DAString("iprp_feats", "FeatIndex", nFeat));

			if (nFeatIndex == nWpnFocus)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nWpnFocus);
				i++;
			}
			else if (nFeatIndex == nWpnSpec)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nWpnSpec);
				i++;
			}
			else if (nFeatIndex == nEpicDevCrit)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nEpicDevCrit);
				i++;
			}
			else if (nFeatIndex == nEpicWpnFocus)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nEpicWpnFocus);
				i++;
			}
			else if (nFeatIndex == nEpicWpnSpec)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nEpicWpnSpec);
				i++;
			}
			else if (nFeatIndex == nOverWhCrit)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nOverWhCrit);
				i++;
			}
			else if (nFeatIndex == nPowerCrit)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nPowerCrit);
				i++;
			}
			else if (nFeatIndex == nImprCrit)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nImprCrit);
				i++;
			}
			else if (nFeatIndex == nGrtrWpnFocus)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nGrtrWpnFocus);
				i++;
			}
			else if (nFeatIndex == nGrtrWpnSpec)
			{
				SetLocalInt(oToB, "WeaponAptitudeCheck" + IntToString(i), nGrtrWpnSpec);
				i++;
			}
			SetLocalInt(oToB, "WpnAptIntCheck", i);
		}
		ipFeat = GetNextItemProperty(oItem);
		SetLocalInt(oToB, "WpnAptIntCheck", i);
	}
}

void GenerateCurrentRootWeaponFeats()
{
	object oPC = OBJECT_SELF;
	object oToB = CSLGetDataStore(oPC);

	int nGod;

	nGod = 0;

	// Favored Soul Weapon Proficeny is granted as a bonus feat and if it is
	// removed is granted again on each levelup it isn't present. A check must
	// be used to prevent the class from granting free feats.
	if (GetLevelByClass(CLASS_TYPE_FAVORED_SOUL, oPC) > 0)
	{
		nGod = CSLGetDeityDataFavoredWeapon( GetDeity(oPC) );
	}

	int i;

	i = 1;

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_BASTARD_SWORD, oPC)) && (FEAT_WEAPON_FOCUS_BASTARD_SWORD != nGod))
	{
		int nRootFeat = 123;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 3);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_BATTLE_AXE, oPC)) && (FEAT_WEAPON_FOCUS_BATTLE_AXE != nGod))
	{
		int nRootFeat = 110;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 2);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_CLUB, oPC)) && (FEAT_WEAPON_FOCUS_CLUB != nGod))
	{
		int nRootFeat = 43;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 28);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_CREATURE, oPC)) && (FEAT_WEAPON_FOCUS_CREATURE != nGod))
	{
		int nRootFeat = 291;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 72);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_DAGGER, oPC)) && (FEAT_WEAPON_FOCUS_DAGGER != nGod))
	{
		int nRootFeat = 90;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 22);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_DART, oPC)) && (FEAT_WEAPON_FOCUS_DART != nGod))
	{
		int nRootFeat = 91;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 31);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_DWAXE, oPC)) && (FEAT_WEAPON_FOCUS_DWAXE != nGod))
	{
		int nRootFeat = 952;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 108);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_FALCHION, oPC)) && (FEAT_WEAPON_FOCUS_FALCHION != nGod))
	{
		int nRootFeat = 1590;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 114);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE, oPC)) && (FEAT_WEAPON_FOCUS_GREAT_AXE != nGod))
	{
		int nRootFeat = 111;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 18);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_SWORD, oPC)) && (FEAT_WEAPON_FOCUS_GREAT_SWORD != nGod))
	{
		int nRootFeat = 107;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 13);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_HALBERD, oPC)) && (FEAT_WEAPON_FOCUS_HALBERD != nGod))
	{
		int nRootFeat = 112;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 10);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_HAND_AXE, oPC)) && (FEAT_WEAPON_FOCUS_HAND_AXE != nGod))
	{
		int nRootFeat = 108;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 38);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW, oPC)) && (FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW != nGod))
	{
		int nRootFeat = 92;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 6);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_KAMA, oPC)) && (FEAT_WEAPON_FOCUS_KAMA != nGod))
	{
		int nRootFeat = 117;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 40);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_KATANA, oPC)) && (FEAT_WEAPON_FOCUS_KATANA != nGod))
	{
		int nRootFeat = 122;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 41);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_KUKRI, oPC)) && (FEAT_WEAPON_FOCUS_KUKRI != nGod))
	{
		int nRootFeat = 118;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 42);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW, oPC)) && (FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW != nGod))
	{
		int nRootFeat = 93;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 7);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_FLAIL, oPC)) && (FEAT_WEAPON_FOCUS_LIGHT_FLAIL != nGod))
	{
		int nRootFeat = 114;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 4);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_HAMMER, oPC)) && (FEAT_WEAPON_FOCUS_LIGHT_HAMMER != nGod))
	{
		int nRootFeat = 113;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 37);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_MACE, oPC)) && (FEAT_WEAPON_FOCUS_LIGHT_MACE != nGod))
	{
		int nRootFeat = 94;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 9);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_LONG_SWORD, oPC)) && (FEAT_WEAPON_FOCUS_LONG_SWORD != nGod))
	{
		int nRootFeat = 106;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 1);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_LONGBOW, oPC)) && (FEAT_WEAPON_FOCUS_LONGBOW != nGod))
	{
		int nRootFeat = 101;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 8);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_MORNING_STAR, oPC)) && (FEAT_WEAPON_FOCUS_MORNING_STAR != nGod))
	{
		int nRootFeat = 95;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 47);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_RAPIER, oPC)) && (FEAT_WEAPON_FOCUS_RAPIER != nGod))
	{
		int nRootFeat = 104;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 51);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SCIMITAR, oPC)) && (FEAT_WEAPON_FOCUS_SCIMITAR != nGod))
	{
		int nRootFeat = 105;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 53);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SCYTHE, oPC)) && (FEAT_WEAPON_FOCUS_SCYTHE != nGod))
	{
		int nRootFeat = 121;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 55);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD, oPC)) && (FEAT_WEAPON_FOCUS_SHORT_SWORD != nGod))
	{
		int nRootFeat = 103;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 0);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW, oPC)) && (FEAT_WEAPON_FOCUS_SHORTBOW != nGod))
	{
		int nRootFeat = 102;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 11);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SHURIKEN, oPC)) && (FEAT_WEAPON_FOCUS_SHURIKEN != nGod))
	{
		int nRootFeat = 120;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 59);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SICKLE, oPC)) && (FEAT_WEAPON_FOCUS_SICKLE != nGod))
	{
		int nRootFeat = 98;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 60);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SLING, oPC)) && (FEAT_WEAPON_FOCUS_SLING != nGod))
	{
		int nRootFeat = 99;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 61);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_SPEAR, oPC)) && (FEAT_WEAPON_FOCUS_SPEAR != nGod))
	{
		int nRootFeat = 97;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 119);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_STAFF, oPC)) && (FEAT_WEAPON_FOCUS_STAFF != nGod)) //Quarterstaff
	{
		int nRootFeat = 96;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 50);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_THROWING_AXE, oPC)) && (FEAT_WEAPON_FOCUS_THROWING_AXE != nGod))
	{
		int nRootFeat = 109;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 63);
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_UNARMED_STRIKE, oPC)) && (FEAT_WEAPON_FOCUS_UNARMED_STRIKE != nGod))
	{
		int nRootFeat = 100;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 100); //Invalid in baseitems, but I need a number.
		i++;
	}

	if ((GetHasFeat(FEAT_WEAPON_FOCUS_WAR_HAMMER, oPC)) && (FEAT_WEAPON_FOCUS_WAR_HAMMER != nGod))
	{
		int nRootFeat = 115;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 5);
		i++;
	}

	if ((GetHasFeat(1826, oPC)) && (1826 != nGod)) //FEAT_WEAPON_FOCUS_WARMACE
	{
		int nRootFeat = 1826;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 126);
		i++;
	}

	if ((GetHasFeat(2107, oPC)) && (2107 != nGod)) //FEAT_WEAPON_FOCUS_MELEE_TOUCH_ATTACK
	{
		int nRootFeat = 2107;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 2108);
		i++;
	}

	if ((GetHasFeat(2108, oPC)) && (2108 != nGod)) //FEAT_WEAPON_FOCUS_RANGED_TOUCH_ATTACK
	{
		int nRootFeat = 2108;
		SetLocalInt(oToB, "RootFeat" + IntToString(i), nRootFeat);
		SetLocalInt(oToB, "RootBase" + IntToString(i), 2108);
		i++;
	}
	SetLocalInt(oToB, "RootFeatNumber", i);
}

void GenerateFeatGroups(int nRoots)
{
	object oPC = OBJECT_SELF;
	object oToB = CSLGetDataStore(oPC);
	int i;
	int nRootFeat;
	int nRootBase;

	i = 1;

	while (i <= nRoots)
	{
		nRootFeat = GetLocalInt(oToB, "RootFeat" + IntToString(i));
		nRootBase = GetLocalInt(oToB, "RootBase" + IntToString(i));

		if (nRootFeat == 100) //Unarmed
		{
			SetLocalInt(oToB, "FG" + IntToString(i) + "WpnFocus", 100);
			SetLocalInt(oToB, "FG" + IntToString(i) + "WpnSpec", 138);
			SetLocalInt(oToB, "FG" + IntToString(i) + "EpicDevCrit", 506);
			SetLocalInt(oToB, "FG" + IntToString(i) + "EpicWpnFocus", 630);
			SetLocalInt(oToB, "FG" + IntToString(i) + "EpicWpnSpec", 668);
			SetLocalInt(oToB, "FG" + IntToString(i) + "OverWhCrit", 720);
			SetLocalInt(oToB, "FG" + IntToString(i) + "GrtrWpnFocus", 1129);
			SetLocalInt(oToB, "FG" + IntToString(i) + "GrtrWpnSpec", 1169);
			SetLocalInt(oToB, "FG" + IntToString(i) + "PowerCrit", 1355);
			SetLocalInt(oToB, "FG" + IntToString(i) + "ImprCrit", 62);
		}
		else if (nRootFeat == 2107) //Melee Touch
		{
			SetLocalInt(oToB, "FG" + IntToString(i) + "WpnFocus", 2107);
			SetLocalInt(oToB, "FG" + IntToString(i) + "ImprCrit", 2109);
		}
		else if (nRootFeat == 2108) //Ranged Touch
		{
			SetLocalInt(oToB, "FG" + IntToString(i) + "WpnFocus", 2108);
			SetLocalInt(oToB, "FG" + IntToString(i) + "ImprCrit", 2110);
		}
		else
		{
			int nWpnFocus = CSLGetItemDataPrefFeatWeaponFocus(nRootBase);
			int nWpnSpec = CSLGetItemDataPrefFeatWeaponSpecialization(nRootBase);
			int nEpicDevCrit = CSLGetItemDataPrefFeatEpicDevestatingCritical(nRootBase);
			int nEpicWpnFocus = CSLGetItemDataPrefFeatEpicWeaponFocus( nRootBase);
			int nEpicWpnSpec = CSLGetItemDataPrefFeatEpicWeaponSpecialization(nRootBase);
			int nOverWhCrit = CSLGetItemDataPrefFeatOverwhelmingCritical(nRootBase);
			int nGrtrWpnFocus = CSLGetItemDataPrefFeatGreaterWeaponFocus(nRootBase);
			int nGrtrWpnSpec = CSLGetItemDataPrefFeatGreaterWeaponSpecialization(nRootBase);
			int nPowerCrit = CSLGetItemDataPrefFeatPowerCritical(nRootBase);
			int nImprCrit = CSLGetItemDataPrefFeatImprovedCritical(nRootBase);

			SetLocalInt(oToB, "FG" + IntToString(i) + "WpnFocus", nWpnFocus);
			SetLocalInt(oToB, "FG" + IntToString(i) + "WpnSpec", nWpnSpec);
			SetLocalInt(oToB, "FG" + IntToString(i) + "EpicDevCrit", nEpicDevCrit);
			SetLocalInt(oToB, "FG" + IntToString(i) + "EpicWpnFocus", nEpicWpnFocus);
			SetLocalInt(oToB, "FG" + IntToString(i) + "EpicWpnSpec", nEpicWpnSpec);
			SetLocalInt(oToB, "FG" + IntToString(i) + "OverWhCrit", nOverWhCrit);
			SetLocalInt(oToB, "FG" + IntToString(i) + "GrtrWpnFocus", nGrtrWpnFocus);
			SetLocalInt(oToB, "FG" + IntToString(i) + "GrtrWpnSpec", nGrtrWpnSpec);
			SetLocalInt(oToB, "FG" + IntToString(i) + "PowerCrit", nPowerCrit);
			SetLocalInt(oToB, "FG" + IntToString(i) + "ImprCrit", nImprCrit);
		}
		i++;
		SetLocalInt(oToB, "FeatGroupTotal", i);
	}
}

int CheckFeats(int nFeat)
{
	object oPC = OBJECT_SELF;
	object oToB = CSLGetDataStore(oPC);

	int nFeatCheck1 = GetLocalInt(oToB, "WeaponAptitudeCheck1");
	int nFeatCheck2 = GetLocalInt(oToB, "WeaponAptitudeCheck2");
	int nFeatCheck3 = GetLocalInt(oToB, "WeaponAptitudeCheck3");
	int nFeatCheck4 = GetLocalInt(oToB, "WeaponAptitudeCheck4");
	int nFeatCheck5 = GetLocalInt(oToB, "WeaponAptitudeCheck5");
	int nFeatCheck6 = GetLocalInt(oToB, "WeaponAptitudeCheck6");
	int nFeatCheck7 = GetLocalInt(oToB, "WeaponAptitudeCheck7");
	int nFeatCheck8 = GetLocalInt(oToB, "WeaponAptitudeCheck8");
	int nFeatCheck9 = GetLocalInt(oToB, "WeaponAptitudeCheck9");
	int nFeatCheck10 = GetLocalInt(oToB, "WeaponAptitudeCheck10");
	int nFeatCheck11 = GetLocalInt(oToB, "WeaponAptitudeCheck11");
	int nFeatCheck12 = GetLocalInt(oToB, "WeaponAptitudeCheck12");
	int nFeatCheck13 = GetLocalInt(oToB, "WeaponAptitudeCheck13");
	int nFeatCheck14 = GetLocalInt(oToB, "WeaponAptitudeCheck14");
	int nFeatCheck15 = GetLocalInt(oToB, "WeaponAptitudeCheck15");

	int nReturn;

	if ((nFeat == nFeatCheck1) && (nFeatCheck1 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck2) && (nFeatCheck2 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck3) && (nFeatCheck3 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck4) && (nFeatCheck4 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck5) && (nFeatCheck5 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck6) && (nFeatCheck6 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck7) && (nFeatCheck7 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck8) && (nFeatCheck8 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck9) && (nFeatCheck9 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck10) && (nFeatCheck10 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck11) && (nFeatCheck11 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck12) && (nFeatCheck12 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck13) && (nFeatCheck13 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck14) && (nFeatCheck14 > 0))
	{
			nReturn = FALSE;
	}
	else if ((nFeat == nFeatCheck15) && (nFeatCheck15 > 0))
	{
			nReturn = FALSE;
	}
	else nReturn = TRUE;

	return nReturn;
}


#include "_HkSpell"

void main()
{	
	
	//--------------------------------------------------------------------------
	//Prep the Maneuver
	//--------------------------------------------------------------------------
	int iSpellId = -1;
	object oPC = OBJECT_SELF;
	object oToB = CSLGetDataStore(oPC);
	//--------------------------------------------------------------------------
	
	object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
	int nWeapon;

	if (!GetIsObjectValid(oWeapon))
	{
		nWeapon = 100;
	}
	else nWeapon = GetBaseItemType(oWeapon);

	if ((GetIsInCombat(oPC) == FALSE) && (GetIsObjectValid(oToB)))
	{
		int i;
		int nBase;

		i = 7;

		object oItem = GetFirstItemInInventory(oPC);

		while (GetIsObjectValid(oItem))
		{
			nBase = GetBaseItemType(oItem);

			if (nBase == BASE_ITEM_MISCLARGE || nBase == BASE_ITEM_MISCWIDE || nBase == BASE_ITEM_MISCTHIN
			|| nBase == BASE_ITEM_MISCTALL || nBase == BASE_ITEM_MISCSMALL || nBase == BASE_ITEM_MISCMEDIUM)
			{
				CheckItems(i, oItem);
				i = GetLocalInt(oToB, "WpnAptIntCheck");
			}
			oItem = GetNextItemInInventory(oPC);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		CheckItems(i, oWeapon);

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oOffHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

		if (GetIsObjectValid(oOffHand))
		{
			CheckItems(i, oOffHand);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oArms = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);

		if (GetIsObjectValid(oArms))
		{
			CheckItems(i, oArms);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);

		if (GetIsObjectValid(oArmor))
		{
			CheckItems(i, oArmor);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oHead = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);

		if (GetIsObjectValid(oHead))
		{
			CheckItems(i, oHead);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);

		if (GetIsObjectValid(oHide))
		{
			CheckItems(i, oHide);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oBelt = GetItemInSlot(INVENTORY_SLOT_BELT, oPC);

		if (GetIsObjectValid(oBelt))
		{
			CheckItems(i, oBelt);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oBoots = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC);

		if (GetIsObjectValid(oBoots))
		{
			CheckItems(i, oBoots);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);

		if (GetIsObjectValid(oCloak))
		{
			CheckItems(i, oCloak);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);

		if (GetIsObjectValid(oRing1))
		{
			CheckItems(i, oRing1);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

		if (GetIsObjectValid(oRing2))
		{
			CheckItems(i, oRing2);
		}

		i = GetLocalInt(oToB, "WpnAptIntCheck");

		object oNeck = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);

		if (GetIsObjectValid(oNeck))
		{
			CheckItems(i, oNeck);
		}

		GenerateCurrentRootWeaponFeats(); // Find our Weapon Focus Feats

		int nRoots = GetLocalInt(oToB, "RootFeatNumber"); // The number of different weapon focus feats we have.

		GenerateFeatGroups(nRoots); // Find the Feats related to the Weapon Focus feats that were found.

		int n;
		int nFeatPrime;
		int nFGTotal = GetLocalInt(oToB, "FeatGroupTotal"); // The number of different groups of feats we found.

		n = 1;

		while (n <= nFGTotal) // Checks which groups of feats are valid for a switch.
		{
			int nRootFeatGroup = GetLocalInt(oToB, "RootFeat" + IntToString(n));

			if (CheckFeats(nRootFeatGroup) == TRUE)
			{
				nFeatPrime = n;
				break;
			}
			else n++;
		}

		int nCkWpnFocus = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "WpnFocus");
		int nCkWpnSpec = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "WpnSpec");
		int nCkEpicDevCrit = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "EpicDevCrit");
		int nCkEpicWpnFocus = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "EpicWpnFocus");
		int nCkEpicWpnSpec = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "EpicWpnSpec");
		int nCkOverWhCrit = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "OverWhCrit");
		int nCkGrtrWpnFocus = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "GrtrWpnFocus");
		int nCkGrtrWpnSpec = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "GrtrWpnSpec");
		int nCkPowerCrit = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "PowerCrit");
		int nCkImprCrit = GetLocalInt(oToB, "FG" + IntToString(nFeatPrime) + "ImprCrit");

		if (nFeatPrime > 0) // Checks which type of feats we already have and therefore should actually switch.
		{ // Also checks if a particular feat shouldn't be removed, such as those granted by items.
			if ((CheckFeats(nCkWpnFocus) == TRUE) && (GetHasFeat(nCkWpnFocus, oPC)))
			{
				FeatRemove(oPC, nCkWpnFocus);
				SetLocalInt(oToB, "BoolWpnFocus", 1);
			}
			else SetLocalInt(oToB, "BoolWpnFocus", 0);

			if ((CheckFeats(nCkWpnSpec) == TRUE) && (GetHasFeat(nCkWpnSpec, oPC)))
			{
				FeatRemove(oPC, nCkWpnSpec);
				SetLocalInt(oToB, "BoolWpnSpec", 1);
			}
			else SetLocalInt(oToB, "BoolWpnSpec", 0);

			if ((CheckFeats(nCkEpicDevCrit) == TRUE) && (GetHasFeat(nCkEpicDevCrit, oPC)))
			{
				FeatRemove(oPC, nCkEpicDevCrit);
				SetLocalInt(oToB, "BoolEpicDevCrit", 1);
			}
			else SetLocalInt(oToB, "BoolEpicDevCrit", 0);

			if ((CheckFeats(nCkEpicWpnFocus) == TRUE) && (GetHasFeat(nCkEpicWpnFocus, oPC)))
			{
				FeatRemove(oPC, nCkEpicWpnFocus);
				SetLocalInt(oToB, "BoolEpicWpnFocus", 1);
			}
			else SetLocalInt(oToB, "BoolEpicWpnFocus", 0);

			if ((CheckFeats(nCkEpicWpnSpec) == TRUE) && (GetHasFeat(nCkEpicWpnSpec, oPC)))
			{
				FeatRemove(oPC, nCkEpicWpnSpec);
				SetLocalInt(oToB, "BoolEpicWpnSpec", 1);
			}
			else SetLocalInt(oToB, "BoolEpicWpnSpec", 0);

			if ((CheckFeats(nCkOverWhCrit) == TRUE) && (GetHasFeat(nCkOverWhCrit, oPC)))
			{
				FeatRemove(oPC, nCkOverWhCrit);
				SetLocalInt(oToB, "BoolOverWhCrit", 1);
			}
			else SetLocalInt(oToB, "BoolOverWhCrit", 0);

			if ((CheckFeats(nCkGrtrWpnFocus) == TRUE) && (GetHasFeat(nCkGrtrWpnFocus, oPC)))
			{
				FeatRemove(oPC, nCkGrtrWpnFocus);
				SetLocalInt(oToB, "BoolGrtrWpnFocus", 1);
			}
			else SetLocalInt(oToB, "BoolGrtrWpnFocus", 0);

			if ((CheckFeats(nCkGrtrWpnSpec) == TRUE) && (GetHasFeat(nCkGrtrWpnSpec, oPC)))
			{
				FeatRemove(oPC, nCkGrtrWpnSpec);
				SetLocalInt(oToB, "BoolGrtrWpnSpec", 1);
			}
			else SetLocalInt(oToB, "BoolGrtrWpnSpec", 0);

			if ((CheckFeats(nCkPowerCrit) == TRUE) && (GetHasFeat(nCkPowerCrit, oPC)))
			{
				FeatRemove(oPC, nCkPowerCrit);
				SetLocalInt(oToB, "BoolPowerCrit", 1);
			}
			else SetLocalInt(oToB, "BoolPowerCrit", 0);

			if ((CheckFeats(nCkImprCrit) == TRUE) && (GetHasFeat(nCkImprCrit, oPC)))
			{
				FeatRemove(oPC, nCkImprCrit);
				SetLocalInt(oToB, "BoolImprCrit", 1);
			}
			else SetLocalInt(oToB, "BoolImprCrit", 0);
		}

		int nWpnFocus = CSLGetItemDataPrefFeatWeaponFocus(nWeapon);
		int nWpnSpec = CSLGetItemDataPrefFeatWeaponSpecialization(nWeapon);
		int nEpicDevCrit = CSLGetItemDataPrefFeatEpicDevestatingCritical(nWeapon);
		int nEpicWpnFocus = CSLGetItemDataPrefFeatEpicWeaponFocus(nWeapon);
		int nEpicWpnSpec = CSLGetItemDataPrefFeatEpicWeaponSpecialization(nWeapon);
		int nOverWhCrit = CSLGetItemDataPrefFeatOverwhelmingCritical(nWeapon);
		int nGrtrWpnFocus = CSLGetItemDataPrefFeatGreaterWeaponFocus(nWeapon);
		int nGrtrWpnSpec = CSLGetItemDataPrefFeatGreaterWeaponSpecialization(nWeapon);
		int nPowerCrit = CSLGetItemDataPrefFeatPowerCritical(nWeapon);
		int nImprCrit = CSLGetItemDataPrefFeatImprovedCritical(nWeapon);

		if ((GetLocalInt(oToB, "BoolWpnFocus") == 1) && (nWpnFocus > 0)) // Make the valid switches.
		{
			CSLWrapperFeatAdd(oPC, nWpnFocus, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolWpnSpec") == 1)
		{
			DelayCommand(0.1f, CSLWrapperFeatAdd(oPC, nWpnSpec, FALSE, TRUE));
		}

		if (GetLocalInt(oToB, "BoolEpicDevCrit") == 1)
		{
			CSLWrapperFeatAdd(oPC, nEpicDevCrit, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolEpicWpnFocus") == 1)
		{
			CSLWrapperFeatAdd(oPC, nEpicWpnFocus, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolEpicWpnSpec") == 1)
		{
			CSLWrapperFeatAdd(oPC, nEpicWpnSpec, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolOverWhCrit") == 1)
		{
			CSLWrapperFeatAdd(oPC, nOverWhCrit, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolGrtrWpnFocus") == 1)
		{
			CSLWrapperFeatAdd(oPC, nGrtrWpnFocus, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolGrtrWpnSpec") == 1)
		{
			CSLWrapperFeatAdd(oPC, nGrtrWpnSpec, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolPowerCrit") == 1)
		{
			CSLWrapperFeatAdd(oPC, nPowerCrit, FALSE, TRUE);
		}

		if (GetLocalInt(oToB, "BoolImprCrit") == 1)
		{
			CSLWrapperFeatAdd(oPC, nImprCrit, FALSE, TRUE);
		}
	}
}
