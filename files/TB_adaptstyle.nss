///////////////////////////////////////////////////////////
//	Author: Drammel										//
//	Date: 5/22/2009										//
//	Name: TB_adaptstyle									//
//	Description: Allows the PC to open the martial adept //
//	menu and change maneuvers during combat as a full 	//
//	round action.										//
///////////////////////////////////////////////////////////
//#include "bot9s_TB_crusaderecov"
//#include "bot9s_include"

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

	SetLocalInt(oToB, "AdaptiveStyle", 1);
	SetLocalInt(oToB, "DisableQuickstrike", 1);

	string sClass = GetLocalString(oToB, "AS_Class");
	string sScreen;

	if (sClass != "___")
	{
		sScreen = "SCREEN_QUICK_STRIKE" + sClass;
	}
	else sScreen = "SCREEN_QUICK_STRIKE";

	string sKnown = GetLocalString(oToB, "AS_Known");
	string sReadied = GetLocalString(oToB, "AS_Readied");
	string sScreenKnown = GetLocalString(oToB, "AS_ScreenKnown");
	string sScreenReadied = GetLocalString(oToB, "AS_ScreenReadied");

	if (sClass == "_CR")
	{
		TOBClearRecoveryFlags();
	}

	// Close Quickstrike
	SetLocalInt(oToB, "IsQStrikeActive" + sClass, 0);
	CloseGUIScreen(oPC, sScreen);

	if (GetLocalInt(oToB, "Is9SMenuActive" + sClass) == 1)
	{
		SetLocalInt(oToB, "Is9SMenuActive" + sClass, 0);
		CloseGUIScreen(oPC, sScreenKnown);
		CloseGUIScreen(oPC, sScreenReadied);
	}

	// Open the martial Adept menus.
	SetLocalInt(oToB, "Is9SMenuActive" + sClass, 1);
	DisplayGuiScreen(oPC, sScreenKnown, FALSE, sKnown);
	DisplayGuiScreen(oPC, sScreenReadied, FALSE, sReadied);
	CSLPlayCustomAnimation_Void(oPC, "mspirit", 0);
}
