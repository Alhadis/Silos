////////////////////////////////////////////////////////////////////////////////
// gui_csl_tomebattle - Tome of Battle - GUI script for Tome of Battle
// Original Scripter:  Drammel      Design: Tome of Battle
//------------------------------------------------------------------------------
// Last Modified By:   Pain           12/12/6 Routed all UIs to use a single gui script
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
#include "_HkSpell"
#include "_SCInclude_TomeBattle"


//#include "_SCInclude_DMFI"
//#include "_SCInclude_DMFIComm"

/*
UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","sInput",local:999)
	UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","sInput",local:999,"sData")
	UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","sInput",local:999,"","","","nTarget","fPosX","fPosY","fPosZ")
	UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","sInput",local:999,"sData","sData2","sData3","nTarget","fPosX","fPosY","fPosZ")
	
	void main( string sInput, string sPlayerID = "", string sData = "", string sData2 = "", string sData3 = "", int nTarget = -1, float fPosX, float fPosY, float fPosZ )

	
	UIObject_Misc_ExecuteServerScript(gui_tob_clear_actions)>
	UIObject_Misc_ExecuteServerScript(gui_tob_display_infopane,local:7) 
*/


// * sInput is the relevant command or button hit
// * sCommand is the stored variable               sCommand
void main( string sInput, string sPlayerID = "", string sData = "", string sData2 = "", string sData3 = "", int nTarget = -1, float fPosX = 0.0f, float fPosY = 0.0f, float fPosZ = 0.0f )
{
	
	//if ( !CSLCheckPermissions( OBJECT_SELF, CSL_PERM_DMONLY ) )
	//{
	//	CloseGUIScreen(OBJECT_SELF, SCREEN_DM_CSLTABLELIST);
	//	return;
	//}
	
	object oPC = GetControlledCharacter(OBJECT_SELF);
	//object oPC = GetControlledCharacter(OBJECT_SELF);
	object oToB = CSLGetDataStore(oPC);
		
	//SendMessageToPC(oPC,"dmappear sInput="+sInput+" sPlayerID="+sPlayerID+" sCommand="+sCommand+" sParameter="+sParameter );
	
	sInput = GetStringLowerCase( sInput );
	/*
	object oTarget;
	if ( sPlayerID == "targeted" )
	{
		oTarget = GetPlayerCurrentTarget( OBJECT_SELF );
	}
	else
	{
		oTarget = IntToObject(StringToInt(sPlayerID));
	}
	*/
	

	//string sNum, sPage, sValue, sTest, sScreen;
	//int nPage, nCurrent, n;
	
	//string sCategory = GetLocalString( oPC, "CSL_TABLE_CURRENTCATEGORY" );

	//SendMessageToPC(oPC,"dmappear"+sPageTitle);
	
	if (sInput=="add_level") // gui_tob_add_level.nss  void main(string sData) - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","add_level",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		
	
		if ((GetLocalInt(oToB, "Encounter") == 0) || (GetLocalInt(oToB, "AdaptiveStyle") == 1))
		{
			//Used to prevent an issue with saved games clearing out the lisboxes when loaded.
		//	SetLocalInt(oToB, "CheckListboxStatus", 0);
			TOBClearManeuversKnown(sData);
			TOBClearManeuversReadied(sData);
			DelayCommand(0.03, TOBAddLevel(oPC, oToB, sData));
			DelayCommand(0.03, TOBAddReadied(oPC, oToB, sData));
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="addqs_texture") // gui_tob_addqs_texture.nss  void main(string sData) -fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","addqs_texture",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		TOBAddQuickstrike("STANCE_ONE", "STANCE_1", "STA", 1, sData);
		TOBAddQuickstrike("STANCE_TWO", "STANCE_2", "STA", 2, sData);
		TOBAddQuickstrike("STANCE_THREE", "STANCE_3", "STA", 3, sData);
		TOBAddQuickstrike("STANCE_FOUR", "STANCE_4", "STA", 4, sData);
		TOBAddQuickstrike("STANCE_FIVE", "STANCE_5", "STA", 5, sData);
		TOBAddQuickstrike("STANCE_SIX", "STANCE_6", "STA", 6, sData);
		TOBAddQuickstrike("STANCE_SEVEN", "STANCE_7", "STA", 7, sData);
		TOBAddQuickstrike("STANCE_EIGHT", "STANCE_8", "STA", 8, sData);
		TOBAddQuickstrike("STANCE_NINE", "STANCE_9", "STA", 9, sData);
		TOBAddQuickstrike("STANCE_TEN", "STANCE_10", "STA", 10, sData);
	
		TOBAddQuickstrike("STRIKE_ONE", "STRIKE_1", "STR", 1, sData);
		TOBAddQuickstrike("STRIKE_TWO", "STRIKE_2", "STR", 2, sData);
		TOBAddQuickstrike("STRIKE_THREE", "STRIKE_3", "STR", 3, sData);
		TOBAddQuickstrike("STRIKE_FOUR", "STRIKE_4", "STR", 4, sData);
		TOBAddQuickstrike("STRIKE_FIVE", "STRIKE_5", "STR", 5, sData);
		TOBAddQuickstrike("STRIKE_SIX", "STRIKE_6", "STR", 6, sData);
		TOBAddQuickstrike("STRIKE_SEVEN", "STRIKE_7", "STR", 7, sData);
		TOBAddQuickstrike("STRIKE_EIGHT", "STRIKE_8", "STR", 8, sData);
		TOBAddQuickstrike("STRIKE_NINE", "STRIKE_9", "STR", 9, sData);
		TOBAddQuickstrike("STRIKE_TEN", "STRIKE_10", "STR", 10, sData);
		TOBAddQuickstrike("STRIKE_ELEVEN", "STRIKE_11", "STR", 11, sData);
		TOBAddQuickstrike("STRIKE_TWELVE", "STRIKE_12", "STR", 12, sData);
		TOBAddQuickstrike("STRIKE_THRITEEN", "STRIKE_13", "STR", 13, sData);
		TOBAddQuickstrike("STRIKE_FOURTEEN", "STRIKE_14", "STR", 14, sData);
		TOBAddQuickstrike("STRIKE_FIFTEEN", "STRIKE_15", "STR", 15, sData);
		TOBAddQuickstrike("STRIKE_SIXTEEN", "STRIKE_16", "STR", 16, sData);
		TOBAddQuickstrike("STRIKE_SEVENTEEN", "STRIKE_17", "STR", 17, sData);
		TOBAddQuickstrike("STRIKE_EIGHTEEN", "STRIKE_18", "STR", 18, sData);
		TOBAddQuickstrike("STRIKE_NINETEEN", "STRIKE_19", "STR", 19, sData);
		TOBAddQuickstrike("STRIKE_TWENTY", "STRIKE_20", "STR", 20, sData);
	
		TOBAddQuickstrike("BOOST_ONE", "BOOST_1", "B", 1, sData);
		TOBAddQuickstrike("BOOST_TWO", "BOOST_2", "B", 2, sData);
		TOBAddQuickstrike("BOOST_THREE", "BOOST_3", "B", 3, sData);
		TOBAddQuickstrike("BOOST_FOUR", "BOOST_4", "B", 4, sData);
		TOBAddQuickstrike("BOOST_FIVE", "BOOST_5", "B", 5, sData);
		TOBAddQuickstrike("BOOST_SIX", "BOOST_6", "B", 6, sData);
		TOBAddQuickstrike("BOOST_SEVEN", "BOOST_7", "B", 7, sData);
		TOBAddQuickstrike("BOOST_EIGHT", "BOOST_8", "B", 8, sData);
		TOBAddQuickstrike("BOOST_NINE", "BOOST_9", "B", 9, sData);
		TOBAddQuickstrike("BOOST_TEN", "BOOST_10", "B", 10, sData);
	
		TOBAddQuickstrike("COUNTER_ONE", "COUNTER_1", "C", 1, sData);
		TOBAddQuickstrike("COUNTER_TWO", "COUNTER_2", "C", 2, sData);
		TOBAddQuickstrike("COUNTER_THREE", "COUNTER_3", "C", 3, sData);
		TOBAddQuickstrike("COUNTER_FOUR", "COUNTER_4", "C", 4, sData);
		TOBAddQuickstrike("COUNTER_FIVE", "COUNTER_5", "C", 5, sData);
		TOBAddQuickstrike("COUNTER_SIX", "COUNTER_6", "C", 6, sData);
		TOBAddQuickstrike("COUNTER_SEVEN", "COUNTER_7", "C", 7, sData);
		TOBAddQuickstrike("COUNTER_EIGHT", "COUNTER_8", "C", 8, sData);
		TOBAddQuickstrike("COUNTER_NINE", "COUNTER_9", "C", 9, sData);
		TOBAddQuickstrike("COUNTER_TEN", "COUNTER_10", "C", 10, sData);
	
		TOBAddQuickstrike("MARTIAL_FEAT_ONE", "MARTIAL_FEAT_1", "F", 1, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_TWO", "MARTIAL_FEAT_2", "F", 2, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_THREE", "MARTIAL_FEAT_3", "F", 3, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_FOUR", "MARTIAL_FEAT_4", "F", 4, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_FIVE", "MARTIAL_FEAT_5", "F", 5, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_SIX", "MARTIAL_FEAT_6", "F", 6, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_SEVEN", "MARTIAL_FEAT_7", "F", 7, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_EIGHT", "MARTIAL_FEAT_8", "F", 8, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_NINE", "MARTIAL_FEAT_9", "F", 9, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_TEN", "MARTIAL_FEAT_10", "F", 10, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_ELEVEN", "MARTIAL_FEAT_11", "F", 11, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_TWELVE", "MARTIAL_FEAT_12", "F", 12, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_THRITEEN", "MARTIAL_FEAT_13", "F", 13, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_FOURTEEN", "MARTIAL_FEAT_14", "F", 14, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_FIFTEEN", "MARTIAL_FEAT_15", "F", 15, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_SIXTEEN", "MARTIAL_FEAT_16", "F", 16, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_SEVENTEEN", "MARTIAL_FEAT_17", "F", 17, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_EIGHTEEN", "MARTIAL_FEAT_18", "F", 18, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_NINETEEN", "MARTIAL_FEAT_19", "F", 19, sData);
		TOBAddQuickstrike("MARTIAL_FEAT_TWENTY", "MARTIAL_FEAT_20", "F", 20, sData);
	
		if (GetHasFeat(FEAT_STANCE_MASTERY))
		{
			TOBAddQuickstrike("DSTANCE_ONE", "DSTANCE_1", "DSTA", 1, sData);
			TOBAddQuickstrike("DSTANCE_TWO", "DSTANCE_2", "DSTA", 2, sData);
			TOBAddQuickstrike("DSTANCE_THREE", "DSTANCE_3", "DSTA", 3, sData);
			TOBAddQuickstrike("DSTANCE_FOUR", "DSTANCE_4", "DSTA", 4, sData);
			TOBAddQuickstrike("DSTANCE_FIVE", "DSTANCE_5", "DSTA", 5, sData);
			TOBAddQuickstrike("DSTANCE_SIX", "DSTANCE_6", "DSTA", 6, sData);
			TOBAddQuickstrike("DSTANCE_SEVEN", "DSTANCE_7", "DSTA", 7, sData);
			TOBAddQuickstrike("DSTANCE_EIGHT", "DSTANCE_8", "DSTA", 8, sData);
			TOBAddQuickstrike("DSTANCE_NINE", "DSTANCE_9", "DSTA", 9, sData);
			TOBAddQuickstrike("DSTANCE_TEN", "DSTANCE_10", "DSTA", 10, sData);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="black_box") // gui_tob_black_box.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","black_box",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		SetLocalString(oToB, "BlackBox", sData);
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="cancel_levelup") // gui_tob_cancel_levelup.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","cancel_levelup",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		SetPause(FALSE);
	
		AssignCommand(oPC, TOBPhase1(oToB));
		AssignCommand(oPC, TOBPhase2(oToB));
	
		SetGUITexture(oPC, "SCREEN_LEVELUP_MANEUVERS", "INFOPANE_IMAGE", "b_empty.tga");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "INFOPANE_TITLE", -1, "");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "INFOPANE_TEXT", -1, "");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "RETRAIN_POOL_TEXT", -1, "0");
		SetGUITexture(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_IMAGE", "b_empty.tga");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TITLE", -1, "");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TEXT", -1, "");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "RETRAIN_POOL_TEXT", -1, "0");
		SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_NEXT", FALSE);
		SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_FINISH", FALSE);
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "ADDED_MANEUVER_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "AVAILABLE_MANEUVER_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "RETRAIN_MANEUVER_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "RETRAIN_FEATS_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "ADDED_RETRAIN_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "AVAILABLE_RETRAIN_LIST");
		CloseGUIScreen(oPC, "SCREEN_LEVELUP_MANEUVERS");
		CloseGUIScreen(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS");
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="cancel_var") // gui_tob_cancel_var.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","cancel_var",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		SetLocalInt(oToB, "ManeuversCreated", 1);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="charge") // gui_tob_charge.nss  void main()
	// not found ???
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","charge",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		object oTarget = TOBGetManeuverObject(oToB, 211);
	
		if (TOBNotMyFoe(oPC, oTarget))
		{
			return;
		}
	
		//ActionAttack is not used because we can only make a single attack on a charge.
		object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
		int nRoll = TOBStrikeAttackRoll(oWeapon, oTarget, 2);
	
		CSLStrikeAttackSound(oWeapon, oTarget, nRoll, 0.3f);
		DelayCommand(0.1f, TOBBasicAttackAnimation(oWeapon, nRoll));
		DelayCommand(0.4f, TOBStrikeWeaponDamage(oWeapon, nRoll, oTarget));
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="clear_actions") // gui_tob_clear_actions.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","clear_actions",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
	
		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oPC, TOBClearStrikes());
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="display_infopane") // gui_tob_display_infopane.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","display_infopane",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		string sTexture = TOBGetManeuversDataIcon(StringToInt(sData));
		string sName = TOBGetManeuversDataName(StringToInt(sData));
		int nText = TOBGetManeuversDataDescription(StringToInt(sData));
	
		SetGUITexture(oPC, "SCREEN_LEVELUP_MANEUVERS", "INFOPANE_IMAGE", sTexture + ".tga");
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "INFOPANE_TITLE", -1, sName);
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "INFOPANE_TEXT", nText, "");
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="display_infopane2") // gui_tob_display_infopane2.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","display_infopane2",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sTexture = CSLGetFeatDataIcon(StringToInt(sData))+".tga";
		string sTitle = CSLGetFeatDataName(StringToInt(sData));
		int nText = StringToInt(Get2DAString("feat", "DESCRIPTION", StringToInt(sData)));
	
		if (GetLocalInt(oToB, "FeatRetrainPhase") == 0)
		{
			SetGUITexture(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_IMAGE", "b_empty.tga");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TITLE", -1, "Discipline Focus: Weapon Focus");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TEXT", 280688, "");
		}
		else
		{
			SetGUITexture(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_IMAGE", sTexture);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TITLE", -1, sTitle);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TEXT", nText, "");
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="display_infopane3") // gui_tob_display_infopane3.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","display_infopane3",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		string sTexture = TOBGetManeuversDataIcon(StringToInt(sData));
		string sName = TOBGetManeuversDataName(StringToInt(sData));
		int nText = TOBGetManeuversDataDescription(StringToInt(sData));
	
		SetGUITexture(oPC, "SCREEN_TOB_PRIMER", "INFOPANE_IMAGE", sTexture + ".tga");
		SetGUIObjectText(oPC, "SCREEN_TOB_PRIMER", "INFOPANE_TITLE", -1, sName);
		SetGUIObjectText(oPC, "SCREEN_TOB_PRIMER", "INFOPANE_TEXT", nText, "");
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="display_known") // gui_tob_display_known.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","display_known",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nLevel = StringToInt(sData);
		int nClass = GetLocalInt(oToB, "LevelupClass");
		int nLevelCap = GetLocalInt(oToB, "LevelupCap");
		int nInitLevel = TOBGetInitiatorLevelup(oPC, nClass, nLevelCap);
	
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "AVAILABLE_MANEUVER_LIST");
		TOBDisplayManeuversByClass(oPC, oToB, 1, 50, nLevel, nClass, nInitLevel);
		SetLocalInt(oToB, "CurrentLevelupLevel", nLevel);
	
		if (GetLocalInt(oToB, "CurrentLevelupLevel") == 0)
		{
			int nStance = GetLocalInt(oToB, "LevelupStance");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "POINT_POOL_TEXT", -1, IntToString(nStance));
		}
		else
		{
			int nTotal = GetLocalInt(oToB, "LevelupTotal");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "POINT_POOL_TEXT", -1, IntToString(nTotal));
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="enable_box") // gui_tob_enable_box.nss  void main(string sClass, string sBox)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","enable_box",local:999,"sData","sData2" )
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		string sClass = sData;
		string sBox = sData2;
		///
		
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sIdent = GetLocalString(oToB, "Readied" + sBox + sClass);
		int nOffset; //Finds the number of digits
	
	/*	if (GetSubString(sIdent, 2, 1) == "_")
		{
			nOffset = 0;
		}
		else nOffset = 1;*/
	
		string sLevel = GetStringLeft(sIdent, 1);
		string sRow = GetStringRight(sIdent, 1);
	//	string sClass = GetSubString(sIdent, 2 + nOffset, 3);
		string sScreen;
	
		if (sClass == "___")
		{
			sScreen = "SCREEN_MANEUVERS_KNOWN";
		}
		else sScreen = "SCREEN_MANEUVERS_KNOWN" + sClass;
	
		SetGUIObjectDisabled(oPC, sScreen, "LEVEL" + sLevel + "_LISTBOX_ITEM" + sRow, FALSE);
		DeleteLocalInt(oToB, "Known" + sClass + sLevel + "Row" + sRow + "Disabled");
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="ex_maneuver") // gui_tob_ex_maneuver.nss  void main( string sData, string sScreen, string sClass) - done
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","ex_maneuver",local:999,"sData","sData2","sData3" )
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		string sClass = sData;
		string sScreen = sData2;
		///
	
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sNumber = IntToString(StringToInt(sData) + 1); // The adjusted number that we're actually after.
	
		if (GetStringLeft(sScreen, 2) == "MK") // Maneuvers Known
		{
			string sRow;
	
			if (GetSubString(sScreen, 2, 1) == "0")
			{
				string sBlue = "BlueBoxSTA" + sNumber + GetStringRight(sScreen, 3);
				sRow = IntToString(GetLocalInt(oToB, sBlue));
			}
			else
			{
				string sFind = "Level" + GetSubString(sScreen, 2, 1) + "Row" + sNumber + GetStringRight(sScreen, 3);
				sRow = IntToString(GetLocalInt(oToB, sFind));
			}
	
			string sName = TOBGetManeuversDataName(StringToInt(sRow));
			int nText = TOBGetManeuversDataDescription(StringToInt(sRow));
	
			DisplayGuiScreen(oPC, "SCREEN_TOB_EXAMINE", FALSE, "tob_examine.xml");
			SetGUIObjectText(oPC, "SCREEN_TOB_EXAMINE", "txtSpellName", -1, sName);
			SetGUIObjectText(oPC, "SCREEN_TOB_EXAMINE", "txtSpellDescription", nText, "");
		}
		else if (GetStringLeft(sScreen, 2) == "MR") // Maneuvers Readied
		{
			int nOffset; // Determines how many places the nRed substring offsets the other substrings.
	
			string sInfo = GetLocalString(oToB, "Readied" + sData + sClass);
	
			if (GetSubString(sInfo, 2, 1) == "_")
			{
				nOffset = 0;
			}
			else nOffset = 1;
	
			int nDigits; // Number of Digits in the 2da index substring.
	
			if (GetSubString(sInfo, 6 + nOffset, 1) == "_")
			{
				nDigits = 1;
			}
			else if (GetSubString(sInfo, 7 + nOffset, 1) == "_")
			{
				nDigits = 2;
			}
			else nDigits = 3;
	
			string sRow = GetSubString(sInfo, 5 + nOffset, nDigits);
	
			string sName = TOBGetManeuversDataName(StringToInt(sRow));
			int nText = TOBGetManeuversDataDescription(StringToInt(sRow));
	
			DisplayGuiScreen(oPC, "SCREEN_TOB_EXAMINE", FALSE, "tob_examine.xml");
			SetGUIObjectText(oPC, "SCREEN_TOB_EXAMINE", "txtSpellName", -1, sName);
			SetGUIObjectText(oPC, "SCREEN_TOB_EXAMINE", "txtSpellDescription", nText, "");
		}
		else
		{
			string sBlue = "BlueBox" + sData; //sData should be a standard type string, and a number-class pairing.
			string sRow = IntToString(GetLocalInt(oToB, sBlue));
			string sName = TOBGetManeuversDataName(StringToInt(sRow));
			int nText = TOBGetManeuversDataDescription(StringToInt(sRow));
	
			DisplayGuiScreen(oPC, "SCREEN_TOB_EXAMINE", FALSE, "tob_examine.xml");
			SetGUIObjectText(oPC, "SCREEN_TOB_EXAMINE", "txtSpellName", -1, sName);
			SetGUIObjectText(oPC, "SCREEN_TOB_EXAMINE", "txtSpellDescription", nText, "");
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="execute_boost") // gui_tob_execute_boost.nss void main(int nTarget, float fPosX, float fPosY, float fPosZ) - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","execute_boost",local:999,"","","","nTarget","fPosX","fPosY","fPosZ")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		//int nTarget;
		//float fPosX;
		//float fPosY;
		//float fPosZ;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sData = GetLocalString(oToB, "BlackBox");
		string sClass = GetStringRight(sData, 3);
		string sNumber;
	
		if ((GetCurrentHitPoints(oPC) < 1) || (GetLocalInt(oToB, "RedCrusader") == 1))
		{
			return;
		}
	
		AssignCommand(oPC, TOBCheckStatus(oPC));
	
		int nStatus = GetLocalInt(oPC, "bot9s_status_check");
	
		if (nStatus == 1)
		{
			SendMessageToPC(oPC, "<color=red>You cannot take this action in your current state.</color>");
			return;
		}
	
		if (GetSubString(sData, 1, 1) == "_") // Number of Digits
		{
			sNumber = GetStringLeft(sData, 1);
		}
		else sNumber = GetStringLeft(sData, 2);
	
		int nRow = GetLocalInt(oToB, "BlueBoxB" + sNumber + sClass);
	
		string sScript = TOBGetManeuversDataScript(nRow);
		string sManeuver = GetFirstName(oPC) + sScript;
		object oManeuver = GetObjectByTag(sManeuver); //Object and script names are intended to be identical.
		int nLocation = GetLocalInt(oManeuver, "Location");
	
		if (nLocation == 1) // Object or Location as the target?
		{
			TOBIndexManeuverPosition(oPC, nRow, fPosX, fPosY, fPosZ);
		}
		else if (IntToObject(nTarget) == OBJECT_INVALID)
		{
			return;
		}
		else SetLocalInt(oToB, "Target", nTarget);
	
		SetLocalInt(oPC, "bot9s_status_check", 0);
		ExecuteScript(sScript, oPC);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="execute_counter") // gui_tob_execute_counter.nss  void main(int nTarget, float fPosX, float fPosY, float fPosZ) - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","execute_counter",local:999,"","","","nTarget","fPosX","fPosY","fPosZ")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		//int nTarget;
		//float fPosX;
		//float fPosY;
		//float fPosZ;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sData = GetLocalString(oToB, "BlackBox");
		string sClass = GetStringRight(sData, 3);
		string sNumber;
	
		if ((GetCurrentHitPoints(oPC) < 1) || (IntToObject(nTarget) == OBJECT_INVALID) || (GetLocalInt(oToB, "RedCrusader") == 1))
		{
			return;
		}
	
		AssignCommand(oPC, TOBCheckStatus(oPC));
	
		int nStatus = GetLocalInt(oPC, "bot9s_status_check");
	
		if (nStatus == 1)
		{
			SendMessageToPC(oPC, "<color=red>You cannot take this action in your current state.</color>");
			return;
		}
	
		if (GetSubString(sData, 1, 1) == "_") // Number of Digits
		{
			sNumber = GetStringLeft(sData, 1);
		}
		else sNumber = GetStringLeft(sData, 2);
	
		int nRow = GetLocalInt(oToB, "BlueBoxC" + sNumber + sClass);
		string sScript = TOBGetManeuversDataScript(nRow);
	
		DeleteLocalInt(oPC, "bot9s_status_check");
	
		if ( hkGetCounter(oPC) != nRow) // Prevent multiple callback for the same maneuver.
		{
			hkSetCounter(nRow,oPC);
			SetLocalInt(oToB, "Target", nTarget);
			ExecuteScript(sScript, oPC);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="execute_sf") // gui_tob_execute_sf.nss  	void main(int nTarget) // this has xyz parameters???, perhaps not used - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","execute_sf",local:999,"","","","nTarget")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		
		//// added so it compiles
		//int nTarget;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sData = GetLocalString(oToB, "BlackBox");
		string sClass = GetStringRight(sData, 3);
		string sNumber;
	
		if ((GetCurrentHitPoints(oPC) < 1) || (GetLocalInt(oToB, "RedCrusader") == 1))
		{
			return;
		}
	
		int nCheck;
		effect eSuck;
	
		eSuck = GetFirstEffect(oPC);
	
		while (GetIsEffectValid(eSuck))
		{
			nCheck = GetEffectType(eSuck);
	
			if (nCheck == EFFECT_TYPE_CHARMED || nCheck == EFFECT_TYPE_CONFUSED || nCheck == EFFECT_TYPE_CUTSCENE_PARALYZE
			|| nCheck == EFFECT_TYPE_DAZED || nCheck == EFFECT_TYPE_DOMINATED
			|| nCheck == EFFECT_TYPE_ENTANGLE || nCheck == EFFECT_TYPE_FRIGHTENED
			|| nCheck == EFFECT_TYPE_PARALYZE || nCheck == EFFECT_TYPE_PETRIFY
			|| nCheck == EFFECT_TYPE_STUNNED || nCheck == EFFECT_TYPE_TIMESTOP)
			{
				SendMessageToPC(oPC, "<color=red>You cannot take this action in your current state.</color>");
				return;
			}
	
			eSuck = GetNextEffect(oPC);
		}
	
		if (GetSubString(sData, 1, 1) == "_") // Number of Digits
		{
			sNumber = GetStringLeft(sData, 1);
		}
		else sNumber = GetStringLeft(sData, 2);
	
		int nRow = GetLocalInt(oToB, "BlueBoxF" + sNumber + sClass);
		string sScript = TOBGetManeuversDataScript(nRow);
	
		SetLocalInt(oToB, "Target", nTarget);
		ExecuteScript(sScript, oPC);
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="execute_stance") // gui_tob_execute_stance.nss  	void main(int nTarget, float fPosX, float fPosY, float fPosZ) - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","execute_stance",local:999,"","","","nTarget","fPosX","fPosY","fPosZ")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		//int nTarget;
		//float fPosX;
		//float fPosY;
		//float fPosZ;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sData = GetLocalString(oToB, "BlackBox");
		string sClass = GetStringRight(sData, 3);
		string sNumber;
	
		if ((GetCurrentHitPoints(oPC) < 1) || (IntToObject(nTarget) == OBJECT_INVALID) || (GetLocalInt(oToB, "RedCrusader") == 1))
		{
			return;
		}
	
		AssignCommand(oPC, TOBCheckStatus(oPC));
	
		int nStatus = GetLocalInt(oPC, "bot9s_status_check");
	
		if (nStatus == 1)
		{
			SendMessageToPC(oPC, "<color=red>You cannot take this action in your current state.</color>");
			return;
		}
	
		if (GetSubString(sData, 1, 1) == "_") // Number of Digits
		{
			sNumber = GetStringLeft(sData, 1);
		}
		else sNumber = GetStringLeft(sData, 2);
	
		int nRow = GetLocalInt(oToB, "BlueBoxSTA" + sNumber + sClass);
		string sScript = TOBGetManeuversDataScript(nRow);
		
		int nStance = hkGetStance1( oPC );
		int nStance2 = hkGetStance2( oPC );
		
		if ( nRow == nStance )
		{
			hkSetStance1( 0, oPC );
			SendMessageToPC(oPC, "You have ended your current stance.");
		}
		else if ( !HkSwiftActionIsActive(oPC) )
		{
			if ( nRow == nStance2) // Check to prevent two identical stances from being run at the same time.
			{
				SendMessageToPC(oPC, "<color=red>This stance is already active, please choose another.</color>");
				return;
			}
			else
			{
				hkSetStance1( nRow, oPC );
				
				SetLocalInt(oToB, "Target", nTarget);
				SetLocalInt(oPC, "bot9s_status_check", 0);
	
				if (GetLevelByClass(71, oPC) > 7) //Swordsage Defensive Stance
				{
					TOBDefensiveStance(oPC, oToB, nRow);
				}
	
				ExecuteScript(sScript, oPC);
				TOBRunSwiftAction(nRow, "STA", oPC);
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="execute_stance2") // gui_tob_execute_stance2.nss  void main(int nTarget, float fPosX, float fPosY, float fPosZ) - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","execute_stance2",local:999,"","","","nTarget","fPosX","fPosY","fPosZ")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		//int nTarget;
		//float fPosX;
		//float fPosY;
		//float fPosZ;
		///
		
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sData = GetLocalString(oToB, "BlackBox");
		string sClass = GetStringRight(sData, 3);
		string sNumber;
	
		if ((GetCurrentHitPoints(oPC) < 1) || (IntToObject(nTarget) == OBJECT_INVALID) || (GetLocalInt(oToB, "RedCrusader") == 1))
		{
			return;
		}
	
		AssignCommand(oPC, TOBCheckStatus(oPC));
	
		int nStatus = GetLocalInt(oPC, "bot9s_status_check");
	
		if (nStatus == 1)
		{
			SendMessageToPC(oPC, "<color=red>You cannot take this action in your current state.</color>");
			return;
		}
	
		if (GetSubString(sData, 1, 1) == "_") // Number of Digits
		{
			sNumber = GetStringLeft(sData, 1);
		}
		else sNumber = GetStringLeft(sData, 2);
	
		int nRow = GetLocalInt(oToB, "BlueBoxDSTA" + sNumber + sClass);
		string sScript = TOBGetManeuversDataScript(nRow);
		
		int nStance = hkGetStance1(oPC);
		int nStance2 = hkGetStance2(oPC);
			
		if ( nRow == nStance2 )
		{
			hkSetStance2(0, oPC);
			SendMessageToPC(oPC, "You have ended your current stance.");
		}
		else if (!HkSwiftActionIsActive(oPC))
		{
			
			
			
	
			if ( nRow == nStance) // Check to prevent two identical stances from being run at the same time.
			{
				SendMessageToPC(oPC, "<color=red>This stance is already active, please choose another.</color>");
				return;
			}
			else
			{
				hkSetStance2(nRow, oPC);
				
				SetLocalInt(oToB, "Target", nTarget);
				SetLocalInt(oPC, "bot9s_status_check", 0);
	
				if (GetLevelByClass(71, oPC) > 7) //Swordsage Defensive Stance
				{
					TOBDefensiveStance(oPC, oToB, nRow);
				}
	
				ExecuteScript(sScript, oPC);
				TOBRunSwiftAction(nRow, "STA", oPC);
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="execute_strike") // gui_tob_execute_strike.nss  void main(int nTarget, float fPosX, float fPosY, float fPosZ) - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","execute_strike",local:999,"","","","nTarget","fPosX","fPosY","fPosZ")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		//int nTarget;
		///float fPosX;
		//float fPosY;
		//float fPosZ;
		///
		
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sData = GetLocalString(oToB, "BlackBox");
		string sClass = GetStringRight(sData, 3);
		string sNumber;
	
		//RedCrusader is designed to enforce Crusaders readying all of their maneuvers.
		//It should only be set to 1 if the Crusader's Martial Adept menu is open.
		if ((GetCurrentHitPoints(oPC) < 1) || (GetLocalInt(oToB, "RedCrusader") == 1))
		{
			return;
		}
	
		if (GetSubString(sData, 1, 1) == "_") // Number of Digits
		{
			sNumber = GetStringLeft(sData, 1);
		}
		else sNumber = GetStringLeft(sData, 2);
	
		int nRow = GetLocalInt(oToB, "BlueBoxSTR" + sNumber + sClass);
	
		// Action queue redundancy prevention. This is intended to prevent Crusaders from using two maneuvers in a row
		// if one of the maneuvers they currently have enqueued refreshes before the other expends. It's also a handy way to catch bugs in the action queue.
		if (nRow == GetLocalInt(oToB, "Strike1") || nRow == GetLocalInt(oToB, "Strike2") ||
		nRow == GetLocalInt(oToB, "Strike3") || nRow == GetLocalInt(oToB, "Strike4") ||
		nRow == GetLocalInt(oToB, "Strike5") || nRow == GetLocalInt(oToB, "Strike6") ||
		nRow == GetLocalInt(oToB, "Strike7") || nRow == GetLocalInt(oToB, "Strike8") ||
		nRow == GetLocalInt(oToB, "Strike9") || nRow == GetLocalInt(oToB, "Strike10") ||
		nRow == GetLocalInt(oToB, "Strike11") || nRow == GetLocalInt(oToB, "Strike12") ||
		nRow == GetLocalInt(oToB, "Strike13") || nRow == GetLocalInt(oToB, "Strike14"))
		{
			SendMessageToPC(oPC, "<color=red>This strike is currently enqueued. Please select another.</color>");
			return;
		}
	
		string sScript = TOBGetManeuversDataScript(nRow);
		string sManeuver = GetFirstName(oPC) + sScript;
		object oManeuver = GetObjectByTag(sManeuver); //Object and script names are intended to be identical.
		object oTarget = IntToObject(nTarget);
		int nMovement = GetLocalInt(oManeuver, "Movement");
		int nLocation = GetLocalInt(oManeuver, "Location");
	
		if (nMovement == 0) // Does the maneuver require us to move?
		{
			if (nLocation == 1) // Object or Location as the target?
			{
				TOBIndexManeuverPosition(oPC, nRow, fPosX, fPosY, fPosZ);
			}
			else if (!GetIsObjectValid(oTarget))
			{
				return;
			}
			else TOBIndexStrikeTarget(oToB, nRow, oTarget);
	
			TOBSetStrike(nRow);
			ActionUseFeat(FEAT_STUDENT_OF_THE_SUBLIME_WAY, oPC);
		}
		else if (nMovement == 2) // Is this a charge attack?
		{
			object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
			float fRange = CSLGetMeleeRange(oPC);
	
			if ((GetDistanceBetween(oPC, oTarget) >= FeetToMeters(10.0f)) && (!GetWeaponRanged(oWeapon)))
			{
				if (LineOfSightObject(oPC, oTarget) == TRUE)
				{
					vector vStart = GetPosition(oPC);
					float fStart = vStart.z;
					int nSupressAoO = GetLocalInt(oManeuver, "SupressAoO");
	
					if (nSupressAoO == 1)
					{
						if ((!IsInConversation(oPC)) || (GetNumCutsceneActionsPending() == 0))
						{
							SetCombatOverrides(oPC, OBJECT_INVALID, -1, -1, OVERRIDE_ATTACK_RESULT_DEFAULT, -1, -1, TRUE, FALSE, FALSE, FALSE);
						}
					}
	
					// Special Cases
	
					if (nRow == STRIKE_DOOM_CHARGE)
					{
						effect eDoom = EffectVisualEffect(VFX_TOB_DOOMCHARGE);
						HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDoom, oPC, 6.0f);
					}
					else if (nRow == STRIKE_LAW_BEARER)
					{
						effect eBearer = EffectVisualEffect(VFX_TOB_LAWBEARER);
						HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBearer, oPC, 6.0f);
					}
					else if (nRow == STRIKE_RADIANT_CHARGE)
					{
						effect eRadiant = EffectVisualEffect(VFX_TOB_RADIANT_CHARGE);
						HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRadiant, oPC, 6.0f);
					}
					else if (nRow == STRIKE_TIDE_OF_CHAOS)
					{
						effect eTide = EffectVisualEffect(VFX_TOB_TIDEOFCHAOS);
						HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTide, oPC, 6.0f);
					}
	
					ClearAllActions();
					AssignCommand(oPC, TOBClearStrikes()); // Just in case. Loops never seem to agree with me.
					SetLocalInt(oToB, "ChargeStatus", 1);
					DelayCommand(6.0f, SetLocalInt(oToB, "ChargeStatus", 0));
					DelayCommand(0.1f, TOBRunPCChargePosition(oPC, oToB));
					DelayCommand(0.5f, TOBChargeRules(oPC, oToB, oTarget, fStart, fRange, nTarget, nRow, nLocation, fPosX, fPosY, fPosZ));
					ActionMoveToObject(oTarget, TRUE, fRange);
				}
				else SendMessageToPC(oPC, "<color=red>You do not have line of sight to the target.</color>");
			}
			else SendMessageToPC(oPC, "<color=red>You must be at least ten feet away from the target and equipped with a melee weapon to make a charge.</color>");
		}
		else //Normal Movement.
		{
			object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
	
			if (GetWeaponRanged(oWeapon) && (!GetHasFeat(FEAT_AIM, oPC)))
			{
				SendMessageToPC(oPC, "<color=red>You cannot execute a ranged strike without training.</color>");
				return;
			}
	
			float fRange;
			float fDefaultRange = GetLocalFloat(oManeuver, "Range");
	
			if (fDefaultRange > 0.0f) // Is there a preferred attack range?
			{
				fRange = FeetToMeters(fDefaultRange);
			}
			else fRange = CSLGetMeleeRange(oPC);
	
			float fHitDist = CSLGetHitDistance(oTarget);
	
			// Special Cases
			if (nRow == STRIKE_BOUNDING_ASSAULT)
			{
				effect eSpeed = EffectMovementSpeedIncrease(99);
				eSpeed = ExtraordinaryEffect(eSpeed);
	
				HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed, oPC, 6.0f);
			}
			else if (nRow == STRIKE_DEVASTATING_THROW)
			{
				float fCheck = GetDistanceBetween(oPC, oTarget);
	
				if (fCheck < FeetToMeters(15.0f))
				{
					SendMessageToPC(oPC, "<color=red>You must be at least 15 feet away from your target to initiate a Devastating Throw.</color>");
					return;
				}
			}
			else if (nRow == STRIKE_DSRTTEMP)
			{
				float fDsrtTemp = CSLGetMeleeRange(oPC);
	
				SetLocalInt(oPC, "DesertTempestActive", 1);
				SetLocalInt(oToB, "DesertWindStrike", 1);
				DelayCommand(6.0f, SetLocalInt(oToB, "DesertWindStrike", 0));
				SetLocalLocation(oPC, "DesertTempestLoc", GetLocation(oPC));
				DelayCommand(0.1f, TOBDoDesertTempestLoc());
				TOBDoDesertTempest(oPC, oToB, fDsrtTemp);
				TOBExpendManeuver(5, "STR");// Too powerful if you can cancel the maneuver before it starts.
			}
			else if (nRow == STRIKE_SLMDRCHRG)
			{
				if ((GetDistanceBetween(oPC, oTarget) <= FeetToMeters(10.0f)) || (GetWeaponRanged(oWeapon)))
				{
					SendMessageToPC(oPC, "<color=red>You must be at least ten feet away from the target and equipped with a melee weapon to make a charge.</color>");
					return;
				}
	
				int nNumber = GetLocalInt(oPC, "SalamanderTopNumber");
				effect eSpeed = EffectMovementSpeedIncrease(99);
				effect eAC = EffectACDecrease(2);
				effect eCharge = EffectLinkEffects(eSpeed, eAC);
				eCharge = ExtraordinaryEffect(eCharge);
	
				if (nNumber > 0) // Reinitiating this maneuver ends previous effects.
				{
					int s;
	
					s = 1;
	
					while (s <= nNumber)
					{
						DeleteLocalLocation(oPC, "SalamanderLoc" + IntToString(s));
						s++;
					}
	
					effect eTest;
	
					eTest = GetFirstEffect(oPC);
	
					while (GetIsEffectValid(eTest))
					{
						if (GetEffectSpellId(eTest) == 6554)
						{
							RemoveEffect(oPC, eTest);
							break;
						}
						eTest = GetNextEffect(oPC);
					}
				}
	
				HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCharge, oPC, 6.0f);
				SetLocalLocation(oPC, "SalamanderLoc", GetLocation(oPC));
				DeleteLocalInt(oPC, "SalamanderTimer"); //Reset the timer that tracks the duration of the effect.
				SetLocalInt(oToB, "DesertWindStrike", 1);
				DelayCommand(6.0f, SetLocalInt(oToB, "DesertWindStrike", 0));
				DelayCommand(0.1f, ExecuteScript("TB_salamander_charge", oPC));
				TOBExpendManeuver(22, "STR");// Too powerful if you can cancel the maneuver before it starts.
			}
	
			if ((GetDistanceBetween(oPC, oTarget) - CSLGetGirth(oTarget)) <= (fRange + fHitDist)) // We're at the target and don't need to move.
			{
				if (nLocation == 1) // Object or Location as the target?
				{
					TOBIndexManeuverPosition(oPC, nRow, fPosX, fPosY, fPosZ);
				}
				else if (!GetIsObjectValid(oTarget))
				{
					return;
				}
				else TOBIndexStrikeTarget(oToB, nRow, oTarget);
	
				AssignCommand(oPC, TOBSetStrike(nRow));
				ActionUseFeat(FEAT_STUDENT_OF_THE_SUBLIME_WAY, oPC);
			}
			else
			{
				TOBSetStrike(nRow);
				DelayCommand(0.5f, TOBStrikeInRange(oPC, oToB, oTarget, fRange, nTarget, nRow, nLocation, fPosX, fPosY, fPosZ));
	
				if ((GetLocalInt(oToB, "StrikeMoveStatus") == 1) || (GetLocalInt(oToB, "ChargeStatus") == 1))//Already moving for a strike when this was called.
				{
					if (GetLocalInt(oToB, "ChargeStatus") == 1)
					{
						TOBRemoveChargeSpeed(oPC);
					}
	
					ClearAllActions();
					ActionMoveToObject(oTarget, TRUE, fRange + fHitDist);
				}
				else // We're not moving yet, so let's get going.
				{
					SetLocalInt(oToB, "StrikeMoveStatus", 1);
					DelayCommand(0.1f, TOBRunPCStrikePosition(oPC, oToB));
					ActionMoveToObject(oTarget, TRUE, fRange + fHitDist);
				}
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="finalize_lvlup") // gui_tob_finalize_lvlup.nss   void main() - fixed
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","finalize_lvlup",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nClass = GetLocalInt(oToB, "LevelupClass");
		int nLevel = GetLocalInt(oToB, "LevelupGate" + IntToString(nClass));
		int nMartialAdept;
	
		SetLocalInt(oToB, "HaltRetrainFeats", 1); // Kill any of the remaining retrain feat loops.
	
		if (nClass == 255) // Martial Study/Stance rules.
		{
			int nCrusader = GetLevelByClass(CLASS_TYPE_CRUSADER, oPC);
			int nSaint = GetLevelByClass(CLASS_TYPE_SAINT, oPC);
			int nSwordsage = GetLevelByClass(CLASS_TYPE_SWORDSAGE, oPC);
			int nWarblade = GetLevelByClass(CLASS_TYPE_WARBLADE, oPC);
	
			if (nCrusader > nSaint || nCrusader > nSwordsage || nCrusader > nWarblade)
			{
				nMartialAdept = CLASS_TYPE_CRUSADER;
			}
			else if (nSaint > nCrusader || nSaint > nSwordsage || nSaint > nWarblade)
			{
				nMartialAdept = CLASS_TYPE_SAINT;
			}
			else if (nSwordsage > nCrusader || nSwordsage > nSaint || nSwordsage > nWarblade)
			{
				nMartialAdept = CLASS_TYPE_SWORDSAGE;
			}
			else if (nWarblade > nCrusader || nWarblade > nSaint || nWarblade > nSwordsage)
			{
				nMartialAdept = CLASS_TYPE_WARBLADE;
			}
			else if (nCrusader > 0 || nSaint > 0 || nSwordsage > 0 || nWarblade > 0)
			{
				if (nCrusader == nSaint || nCrusader == nSwordsage || nCrusader == nWarblade)
				{
					nMartialAdept = CLASS_TYPE_CRUSADER; // Fyi, purely an alphabetical preferance.
				}
				else if (nSaint == nSwordsage || nSaint == nWarblade)
				{
					nMartialAdept = CLASS_TYPE_SAINT;
				}
				else if (nSwordsage == nWarblade)
				{
					nMartialAdept = CLASS_TYPE_SWORDSAGE;
				}
				else nMartialAdept = CLASS_TYPE_WARBLADE;
			}
			else nMartialAdept = 255; // CLASS_TYPE_INVALID
		}
		else nMartialAdept = GetLocalInt(oToB, "LevelupClass");
	
		SetLocalInt(oToB, "LevelupGate" + IntToString(nClass), nLevel + 1);
	
		string sMyName = GetFirstName(oPC);
		int nMax = GetNum2DARows("maneuvers");
	
		TOBCreateManeuverLoop(oPC, oToB, nMartialAdept, sMyName, nMax, 0, 50);
	
		string sClass;
	
		if (nClass == CLASS_TYPE_CRUSADER)
		{
			sClass = "CR";
		}
		else if (nClass == CLASS_TYPE_SAINT)
		{
			sClass = "SA";
		}
		else if (nClass == CLASS_TYPE_SWORDSAGE)
		{
			sClass = "SS";
		}
		else if (nClass == CLASS_TYPE_WARBLADE)
		{
			sClass = "WB";
		}
		else sClass = "";
	
		string sReadiedTotal = "ReadiedTotal" + "_" + sClass;
		int nReadiedTotal = GetLocalInt(oToB, sReadiedTotal);
	
		if (nClass == CLASS_TYPE_CRUSADER) //Manevers readied total per level for each class.
		{
			switch (nLevel)
			{
				case 1:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 5);	break;
				case 10:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 20:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 30:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
			}
		}
		else if (nClass == CLASS_TYPE_SAINT)
		{
			//To be continued...
		}
		else if (nClass == CLASS_TYPE_SWORDSAGE)
		{
			switch (nLevel)
			{
				case 1:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 4);	break;
				case 3:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 5:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 8:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 10:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 13:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 15:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 18:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 20:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 23:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 25:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 28:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 30:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
			}
		}
		else if (nClass == CLASS_TYPE_WARBLADE)
		{
			switch (nLevel)
			{
				case 1:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 3);	break;
				case 4:	SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 10:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 15:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 20:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 25:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
				case 30:SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);	break;
			}
		}
		else SetLocalInt(oToB, sReadiedTotal, nReadiedTotal + 1);// Martial Study and Stance.
	
		if (sClass == "")
		{
			if (GetLocalInt(oToB, "MStudy1Pending") == 1)
			{
				SetLocalInt(oToB, "MStudy1Used", 1);
			}
			else if (GetLocalInt(oToB, "MStudy2Pending") == 1)
			{
				SetLocalInt(oToB, "MStudy2Used", 1);
			}
			else if (GetLocalInt(oToB, "MStudy3Pending") == 1)
			{
				SetLocalInt(oToB, "MStudy3Used", 1);
			}
			else if (GetLocalInt(oToB, "MStance1Pending") == 1)
			{
				SetLocalInt(oToB, "MStance1Used", 1);
			}
			else if (GetLocalInt(oToB, "MStance2Pending") == 1)
			{
				SetLocalInt(oToB, "MStance2Used", 1);
			}
			else if (GetLocalInt(oToB, "MStance3Pending") == 1)
			{
				SetLocalInt(oToB, "MStance3Used", 1);
			}
		}
	
		AssignCommand(oPC, TOBClearBoxes(sClass)); // AssignCommand is used just in case the while loops start to pile up.
		AssignCommand(oPC, TOBClearManeuversReadied(sClass));
		AssignCommand(oPC, TOBClearManeuversKnown(sClass));
	
		int nRetrain1 = GetLocalInt(oToB, "FeatRetrain1");
		int nRetrain2 = GetLocalInt(oToB, "FeatRetrain2");
		int nPending1 = GetLocalInt(oToB, "PendingFeat1");
		int nPending2 = GetLocalInt(oToB, "PendingFeat2");
	
		if (nRetrain1 > 0)
		{
			FeatRemove(oPC, nRetrain1);
		}
	
		if (nRetrain2 > 0)
		{
			FeatRemove(oPC, nRetrain2);
		}
	
		// Tome of Battle specific issues. Prerequisite checks have already been made.
		if ((GetHitDice(oPC) == 1)	&& ((nPending1 == 6832 || nPending1 == 6833 || nPending1 == 6834 || nPending1 == 6835
		|| nPending1 == 6838 || nPending1 == 6839 || nPending1 == 6832 || nPending1 == 6840
		|| nPending1 == 6843 || nPending1 == 6844 || nPending1 == 6845 || nPending1 == 6847
		|| nPending1 == 6850)))
		{
			DelayCommand(0.1f, CSLWrapperFeatAdd(oPC, nPending1, FALSE, TRUE));
		}
		else if (nPending1 > 0)
		{
			DelayCommand(0.1f, CSLWrapperFeatAdd(oPC, nPending1, TRUE, TRUE));
		}
	
		if ((GetHitDice(oPC) == 1)	&& ((nPending2 == 6832 || nPending2 == 6833 || nPending2 == 6834 || nPending2 == 6835
		|| nPending2 == 6838 || nPending2 == 6839 || nPending2 == 6832 || nPending2 == 6840
		|| nPending2 == 6843 || nPending2 == 6844 || nPending2 == 6845 || nPending2 == 6847
		|| nPending2 == 6850)))
		{
			DelayCommand(0.1f, CSLWrapperFeatAdd(oPC, nPending2, FALSE, TRUE));
		}
		else if (nPending2 > 0)
		{
			DelayCommand(0.2f, CSLWrapperFeatAdd(oPC, nPending2, TRUE, TRUE));
		}
	
		DelayCommand(0.05, ExecuteScript("gui_tob_cancel_levelup", oPC));
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="gdivine_surge") // gui_tob_gdivine_surge.nss  void main()
	// not used ???
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","gdivine_surge",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nInit = TOBGetInitiatorLevel(oPC);
		int nMax = GetAbilityScore(oPC, ABILITY_CONSTITUTION);
		int nCon = GetLocalInt(oToB, "GDivineCon");
		int nInitiator;
	
		if (nMax > nInit)
		{
			nInitiator = nInit;
		}
		else nInitiator = nMax;
	
		if (nCon == nInitiator + 1)
		{
			SetLocalInt(oToB, "GDivineCon", 0);
			FloatingTextStringOnCreature("<color=cyan>You will take 0 Con damage when you use Greater Divine Surge.</color>", oPC, TRUE, 5.0f, COLOR_CYAN, FOG_COLOR_BLUE_DARK);
		}
		else
		{
			SetLocalInt(oToB, "GDivineCon", nCon + 1);
			FloatingTextStringOnCreature("<color=cyan>You will take " + IntToString(nCon + 1) + " Con damage when you use Greater Divine Surge.</color>", oPC, TRUE, 5.0f, COLOR_CYAN, FOG_COLOR_BLUE_DARK);
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="launch_bot9s") // gui_tob_launch_bot9s.nss  void main(string sData)  // sClass changed to sData
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","launch_bot9s",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sScreenKnown;
		string sScreenReadied;
	
		if (sData == "___")
		{
			sScreenKnown = "SCREEN_MANEUVERS_KNOWN";
		}
		else sScreenKnown = "SCREEN_MANEUVERS_KNOWN" + sData;
	
		if (sData == "___")
		{
			sScreenReadied = "SCREEN_MANEUVERS_READIED";
		}
		else sScreenReadied = "SCREEN_MANEUVERS_READIED" + sData;
	
		string sKnown;
		string sReadied;
	
		if (sData == "_CR")
		{
			sKnown = "maneuvers_known_cr.xml";
		}
		else if (sData == "_SA")
		{
			sKnown = "maneuvers_known_sa.xml";
		}
		else if (sData == "_SS")
		{
			sKnown = "maneuvers_known_ss.xml";
		}
		else if (sData == "_WB")
		{
			sKnown = "maneuvers_known_wb.xml";
		}
		else sKnown = "maneuvers_known.xml";
	
		if (sData == "_CR")
		{
			sReadied = "maneuvers_readied_cr.xml";
		}
		else if (sData == "_SA")
		{
			sReadied = "maneuvers_readied_sa.xml";
		}
		else if (sData == "_SS")
		{
			sReadied = "maneuvers_readied_ss.xml";
		}
		else if (sData == "_WB")
		{
			sReadied = "maneuvers_readied_wb.xml";
		}
		else sReadied = "maneuvers_readied.xml";
	
		int nAdaptive = GetLocalInt(oToB, "AdaptiveStyle");
	
		if ((GetIsObjectValid(oToB)) && (GetLocalInt(oToB, "Encounter") != 0) && (GetHasFeat(FEAT_ADAPTIVE_STYLE, oPC)) && (nAdaptive == 0) && (GetLocalInt(oToB, "Is9SMenuActive" + sData) == 0))
		{
			SetLocalString(oToB, "AS_Class", sData);
			SetLocalString(oToB, "AS_Known", sKnown);
			SetLocalString(oToB, "AS_Readied", sReadied);
			SetLocalString(oToB, "AS_ScreenKnown", sScreenKnown);
			SetLocalString(oToB, "AS_ScreenReadied", sScreenReadied);
	
			if (sData == "_CR")
			{
				SetLocalInt(oToB, "AS_HaltCrCycle", 1); // Red Light on the Crusader's recovery method.
				SetLocalInt(oToB, "RedCrusader", 1);
				SetLocalInt(oToB, "EncounterR1", 0);
			}
	
			ActionUseFeat(FEAT_ADAPTIVE_STYLE, oPC);
		}
		else if ((sData == "_CR") && (TOBCheckRedCrusader(oPC, oToB)) && (GetLocalInt(oToB, "Is9SMenuActive" + sData) == 1) && (nAdaptive == 1))
		{
			SetLocalInt(oToB, "Is9SMenuActive" + sData, 0);
			SetLocalInt(oToB, "RedCrusader", 0);
			SetLocalInt(oToB, "CR_ForcedClose", 0);
			CloseGUIScreen(oPC, sScreenKnown);
			CloseGUIScreen(oPC, sScreenReadied);
			SetLocalInt(oToB, "CrusaderActive", 0);
			SetLocalInt(oPC, "CrusaderActive", 0);
			SetLocalInt(oToB, "AdaptiveStyle", 0);
			SetLocalInt(oToB, "DisableQuickstrike", 0);
			SetLocalInt(oToB, "AS_HaltCrCycle", 0); // Green Light on the Crusader's recovery method.
			DelayCommand(0.1f, ExecuteScript("TB_crusaderecov", oPC));
		}
		else if ((sData != "_CR") && (GetLocalInt(oToB, "Is9SMenuActive" + sData) == 1) && (nAdaptive == 1))
		{
			SetLocalInt(oToB, "Is9SMenuActive" + sData, 0);
			CloseGUIScreen(oPC, sScreenKnown);
			CloseGUIScreen(oPC, sScreenReadied);
			SetLocalInt(oToB, "AdaptiveStyle", 0);
			SetLocalInt(oToB, "DisableQuickstrike", 0);
	
			string sScreen;
	
			if (sData == "___")
			{
				sScreen = "SCREEN_QUICK_STRIKE";
			}
			else sScreen = "SCREEN_QUICK_STRIKE" + sData;
	
			TOBRecoverAllMartialManeuvers(sScreen);
		}
		else if ((GetLocalInt(oToB, "Is9SMenuActive_CR") == 1) && (GetLocalInt(oToB, "Encounter") != 0) && (!TOBCheckRedCrusader(oPC, oToB)))
		{
			int nReadiedTotal = GetLocalInt(oToB, "ReadiedTotal_CR");
	
			SendMessageToPC(oPC, "<color=red>You must ready a total of " + IntToString(nReadiedTotal) + " maneuvers before you can close the menu.</color>");
		}
		else if (GetIsObjectValid(oToB) && (GetLocalInt(oToB, "Encounter") != 0))
		{
			SendMessageToPC(oPC, "<color=red>You cannot change maneuvers while in combat.</color>");
		}
		else if (GetIsObjectValid(oToB))
		{
			if (GetLocalInt(oToB, "Is9SMenuActive" + sData) == 0)
			{
				SetLocalInt(oToB, "Is9SMenuActive" + sData, 1);
				DisplayGuiScreen(oPC, sScreenReadied, FALSE, sReadied);
				DisplayGuiScreen(oPC, sScreenKnown, FALSE, sKnown);
	
				if (sData == "_CR")
				{
					SetLocalInt(oToB, "RedCrusader", 1);
				}
			}
			else if ((sData == "_CR") && (!TOBCheckRedCrusader(oPC, oToB)))
			{
				int nReadiedTotal = GetLocalInt(oToB, "ReadiedTotal_CR");
	
				SendMessageToPC(oPC, "<color=red>You must ready a total of " + IntToString(nReadiedTotal) + " maneuvers before you can close the menu.</color>");
			}
			else
			{
				CloseGUIScreen(oPC, sScreenReadied);
				CloseGUIScreen(oPC, sScreenKnown);
				SetLocalInt(oToB, "Is9SMenuActive" + sData, 0);
	
				if (sData == "_CR")
				{
					SetLocalInt(oToB, "RedCrusader", 0);
					SetLocalInt(oToB, "CR_ForcedClose", 0);
				}
			}
		}
		else SendMessageToPC(oPC, "<color=red>You must activate the training feat for your class before you can open the Martial Adept Menu.</color>");
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="level_row") // gui_tob_level_row.nss   void main(string sData,string sRow)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","level_row",local:999,"sData","sData2" )
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//// added so it compiles
		string sRow = sData2;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		int nLevel = StringToInt(GetStringLeft(sData, 1));
		string sClass = GetStringRight(sData, 3);
		int nRed = TOBGetRedNumber(sClass);
	
		if (nRed == 0)
		{
			return;
		}
	
		TOBAddLevelRow(oPC, nLevel, (StringToInt(sRow) + 1), nRed, sClass);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="mask") // gui_tob_mask.nss  void main()
	// not used
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","mask",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		string sScreen = "SCREEN_MARTIAL_MENU_SS";
		string sMaskScreen = "SCREEN_QUICK_STRIKE_SS";
	
		FloatingTextStringOnCreature("<color=cyan>*Select a maneuver to recover!*</color>", oPC, FALSE, 5.0f, COLOR_CYAN, COLOR_BLUE_DARK);
		TOBToggleMasks(FALSE, sMaskScreen, oPC);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="open_primer") // gui_tob_open_primer.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","open_primer",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		if (GetIsObjectValid(oToB) && (GetLocalInt(oToB, "Encounter") == 0))
		{
			DisplayGuiScreen(oPC, "SCREEN_TOB_PRIMER", TRUE, "tob_primer.xml");
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="open_rt") // gui_tob_open_rt.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","open_rt",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nSSWF = GetLocalInt(oToB, "SSWeaponFocus");
	
		SetPause(FALSE);
	
		CloseGUIScreen(oPC, "SCREEN_LEVELUP_MANEUVERS");
	
		if ((GetLevelByClass(CLASS_TYPE_SWORDSAGE, oPC) == 1) && (nSSWF == 0)) //Swordsage's Insightful Strike: Weapon Focus selection.
		{
			DisplayGuiScreen(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", TRUE, "retrain_feats.xml");
			SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_FINISH", TRUE);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TITLE", -1, "");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TEXT", -1, "");
			SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_NEXT", TRUE);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TEXT", 280688, "");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "POINT_POOL_TEXT", -1, "1");
			SetLocalInt(oToB, "SSWeaponFocus", 0); //Does the job of the cancel button without removing the data for future use.
			SetLocalInt(oToB, "SSInsightSwitch", 1);
			TOBDisplaySSInsightfulStrike(oPC, oToB);
		}
		else if (GetHitDice(oPC) == 1) // First level only until I can get some better checks for feat retraining.
		{
			DisplayGuiScreen(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", TRUE, "retrain_feats.xml");
			SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_FINISH", TRUE);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TITLE", -1, "");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "INFOPANE_TEXT", -1, "");
			SetLocalInt(oToB, "FeatRetrainPhase", 1);
			SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_NEXT", TRUE);
		}
		else
		{
			ExecuteScript("gui_tob_finalize_lvlup", oPC);
			return;
		}
	
		TOBCheckForPhaseOne(oPC, oToB);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="quickstrike") // gui_tob_quickstrike.nss   void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","quickstrike",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		if (GetLocalInt(oToB, "DisableQuickstrike") == 1)
		{
			return; // Bug prevention with Adaptive Style.
		}
	
		string sClass = GetStringRight(sData, 3);
		string sScreen;
	
		if (sClass != "___")
		{
			sScreen = "SCREEN_QUICK_STRIKE" + sClass;
		}
		else sScreen = "SCREEN_QUICK_STRIKE";
	
		string sXml;
	
		if (sClass == "_CR")
		{
			sXml = "quickstrike_cr.xml";
		}
		else if (sClass == "_SA")
		{
			sXml = "quickstrike_sa.xml";
		}
		else if (sClass == "_SS")
		{
			sXml = "quickstrike_ss.xml";
		}
		else if (sClass == "_WB")
		{
			sXml = "quickstrike_wb.xml";
		}
		else sXml = "quickstrike.xml";
	
		if (GetIsObjectValid(oToB))
		{
			SetLocalInt(oToB, "BlueBoxF1" + sClass, 211); // Charge Action.
	
			if (GetLocalInt(oToB, "SBTToggleIsSet") == 0)
			{
				int nSBT; // Beginning of support loop for Shadow Blade Technique.
	
				nSBT = 1;
	
				while (nSBT < 21)
				{
					if (GetLocalInt(oToB, "BlueBoxSTR" + IntToString(nSBT) + sClass) == 132)
					{
						string sSBTBox = TOBGetSwiftFeat(sClass);
						SetLocalInt(oToB, sSBTBox, 225);
						SetLocalInt(oToB, "SBTToggleIsSet", 1);
						break;
					}
					nSBT++;
				}
			}
	
			if (GetLocalInt(oToB, "SCToggleIsSet") == 0)
			{
				int nSC; // Beginning of support loop for Salamander Charge.
	
				nSC = 1;
	
				while (nSC < 21)
				{
					if (GetLocalInt(oToB, "BlueBoxSTR" + IntToString(nSC) + sClass) == 22)
					{
						string sSCBox = TOBGetSwiftFeat(sClass);
						SetLocalInt(oToB, sSCBox, 226);
						SetLocalInt(oToB, "SCToggleIsSet", 1);
						break;
					}
					nSC++;
				}
			}
	
			if (GetLocalInt(oToB, "GDSToggleIsSet") == 0)
			{
				int nGDS; // Beginning of support loop for Greater Divine Surge.
	
				nGDS = 1;
	
				while (nGDS < 21)
				{
					if (GetLocalInt(oToB, "BlueBoxSTR" + IntToString(nGDS) + sClass) == 37)
					{
						string sGDSBox = TOBGetSwiftFeat(sClass);
						SetLocalInt(oToB, sGDSBox, 227);
						SetLocalInt(oToB, "GDSToggleIsSet", 1);
						break;
					}
					nGDS++;
				}
			}
	
			if (GetLocalInt(oToB, "IsQStrikeActive" + sClass) == 0)
			{
				SetLocalInt(oToB, "IsQStrikeActive" + sClass, 1);
				DisplayGuiScreen(oPC, sScreen, FALSE, sXml);
	
				if (sScreen == "SCREEN_QUICK_STRIKE_CR")
				{
					if (!GetIsInCombat(oPC))
					{
						TOBDisableAll();
					}
					else
					{
						int nLimit = GetLocalInt(oToB, "CrLimit");
						string RRFlag;
						int i;
	
						i = 1;
	
						while (i <= nLimit)
						{
							RRFlag = GetLocalString(oToB, "RandomRecoveryFlag" + IntToString(i));
							SetGUIObjectDisabled(oPC, sScreen, RRFlag, TRUE);
							i++;
						}
					}
				}
				else if (GetLocalInt(oToB, "Encounter") == 0)
				{
					TOBRecoverAllQuickStrikeManeuvers(sScreen, oPC, sClass);
				}
			}
			else
			{
				SetLocalInt(oToB, "IsQStrikeActive" + sClass, 0);
				CloseGUIScreen(oPC, sScreen);
			}
		}
		else 
		{
			SendMessageToPC(oPC, "<color=red>You must activate the training feat for your class before you can open the Quickstrike Menu.</color>");
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="recovery") // gui_tob_recovery.nss  void main(string sClass, string sListBox)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","recovery",local:999,"sData","sData2" )
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		
		////// added so it compiles
		string sClass = sData;
		string sListBox = sData2;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sScreen;
	
		if (sClass == "___")
		{
			sScreen = "SCREEN_QUICK_STRIKE";
		}
		else sScreen = "SCREEN_QUICK_STRIKE" + sClass;
	
		SetGUIObjectDisabled(oPC, sScreen, sListBox, FALSE);
		TOBToggleMasks(TRUE, sScreen, oPC);
	
		if ((GetHasFeat(FEAT_VITAL_RECOVERY, oPC)) && (GetLocalInt(oToB, "VitalRecovery") == 0))
		{
			int nMax = GetMaxHitPoints(oPC);
			int nHP = GetCurrentHitPoints(oPC);
	
			if (nHP < nMax) // Won't heal when we're at full HP.
			{
				int nHitDice = GetHitDice(oPC);
				effect eHeal = TOBManeuverHealing(oPC, 3 + nHitDice);
	
				HkApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oPC);
				SetLocalInt(oToB, "VitalRecovery", 1);
			}
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="remove") // gui_tob_remove.nss  void main(string sClass, string sRed)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","remove",local:999,"sData","sData2" )
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		////// added so it compiles
		string sClass = sData;
		string sRed = sData2;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		string sScreen;
	
		if (sClass == "___")
		{
			sScreen = "SCREEN_MANEUVERS_READIED";
		}
		else sScreen = "SCREEN_MANEUVERS_READIED" + sClass;
	
		string sBox = "READIED_" + sRed;
	
		if (GetLocalInt(oToB, "RedBox" + sRed + sClass) == 0) //Sanity checks.
		{
			int i;
			string sRedBox;
			string sEmpty;
	
			i = 1;
	
			while (i < 18)
			{
				sRedBox = "READIED_" + IntToString(i);
	
				if (GetLocalInt(oToB, "RedBox" + IntToString(i) + sClass) == 0)
				{
					ClearListBox(oPC, sScreen, sRedBox);
					SetGUIObjectDisabled(oPC, sScreen, sRedBox, TRUE);
					DeleteLocalString(oToB, "Readied" + IntToString(i) + sClass);
					DeleteLocalInt(oToB, "ReadiedRow" + IntToString(i) + sClass);
					DeleteLocalInt(oToB, "Readied" + IntToString(i) + sClass + "Disabled");
				}
				i++;
			}
			DelayCommand(0.1f, TOBClearBoxes(sClass, oToB));
		}
		else
		{
			ClearListBox(oPC, sScreen, sBox);
			SetGUIObjectDisabled(oPC, sScreen, sBox, TRUE);
			TOBRemoveManeuver(StringToInt(sRed), sClass);
			DeleteLocalString(oToB, "Readied" + sRed + sClass);
			DeleteLocalInt(oToB, "ReadiedRow" + sRed + sClass);
			DeleteLocalInt(oToB, "Readied" + sRed + sClass + "Disabled");
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="rt_feat") // gui_tob_rt_feat.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","rt_feat",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nFeat = StringToInt(sData);
		int nLevel = GetLocalInt(oToB, "CurrentLevelupLevel");
		int nClass = GetLocalInt(oToB, "LevelupClass");
	
		int nRetrain = GetLocalInt(oToB, "FeatRetrainAmount");
		int nAvailable = GetLocalInt(oToB, "AvialableToRetrain");
	
		if (GetLocalInt(oToB, "RetrainLoopCheck") == 0)
		{
			SetLocalInt(oToB, "RetrainLoopCheck", 1);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "RETRAIN_POOL_TEXT", -1, IntToString(nRetrain - 1));
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "POINT_POOL_TEXT", -1, IntToString(nAvailable + 1));
			SetLocalInt(oToB, "FeatRetrainAmount", (nRetrain - 1));
			SetLocalInt(oToB, "AvialableToRetrain", nAvailable + 1);
	
			if (GetLocalInt(oToB, "FeatRetrain1") > 0)
			{
				SetLocalInt(oToB, "FeatRetrain2", nFeat);
			}
			else SetLocalInt(oToB, "FeatRetrain1", nFeat);
	
			if (GetLocalInt(oToB, "FeatRetrainAmount") == 0)
			{
				ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "RETRAIN_FEATS_LIST");
				ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "AVAILABLE_RETRAIN_LIST");
				TOBGetAllAvailableFeats2(oPC, oToB, 1, 25);
			}
			else
			{
				ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "RETRAIN_FEATS_LIST");
				ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "AVAILABLE_RETRAIN_LIST");
				TOBAddAllKnownFeats(oPC, oToB, 1, 50);
				TOBGetAllAvailableFeats2(oPC, oToB, 1, 25);
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="rt_maneuver") // gui_tob_rt_maneuver.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","rt_maneuver",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nManeuver = StringToInt(sData);
		int nLevel = GetLocalInt(oToB, "CurrentLevelupLevel");
		int nClass = GetLocalInt(oToB, "LevelupClass");
		int nLearn = GetLocalInt(oToB, "LevelupLearn");
		int nTotal = GetLocalInt(oToB, "LevelupTotal");
		int nLevelCap = GetLocalInt(oToB, "LevelupCap");
		int nInitLevel = TOBGetInitiatorLevelup(oPC, nClass, nLevelCap);
		int nDiscipline = TOBGetManeuversDataDiscipline(nManeuver);
	
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "RETRAIN_MANEUVER_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "AVAILABLE_MANEUVER_LIST");
	
		if (nManeuver == 0)
		{
			return;
		}
	
		SetLocalInt(oToB, "RetrainManeuver", nManeuver); // Never more than one of these.
		SetLocalInt(oToB, "LevelupRetrain", 0);
		SetLocalInt(oToB, "LevelupLearn", nLearn + 1); // Top number we can learn this level.
		SetLocalInt(oToB, "LevelupTotal", nTotal + 1); // Current number of maneuvers left to learn.
	
		int nNew = GetLocalInt(oToB, "LevelupTotal");
	
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "POINT_POOL_TEXT", -1, IntToString(nNew));
		SetGUIObjectText(oPC, "SCREEN_LEVELUP_MANEUVERS", "RETRAIN_POOL_TEXT", -1, "0");
	
		SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_MANEUVERS", "CHOICE_NEXT", TRUE);
		TOBGenerateKnownManeuvers(oPC, oToB);
		TOBPredictDisciplineStatus(nDiscipline, FALSE);
		TOBDisplayManeuversByClass(oPC, oToB, 1, 50, nLevel, nClass, nInitLevel);
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="run_charge") // gui_tob_run_charge.nss   void main(int nTarget)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","run_charge",local:999,"","","","nTarget")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		////// added so it compiles
		//int nTarget;
		///
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		object oTarget = IntToObject(nTarget);
		int nRow = 211;
		string sScript = TOBGetManeuversDataScript(nRow);
	
		TOBIndexStrikeTarget(oToB, nRow, oTarget);
		SetLocalInt(oToB, "Strike", nRow);
	
		if (TOBNotMyFoe(oPC, oTarget))
		{
			return;
		}
	
		object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
		int nWeapon = GetBaseItemType(oWeapon);
		float fRange = CSLGetMeleeRange(oPC) + CSLGetHitDistance(oTarget);
	
		if ((GetDistanceBetween(oPC, oTarget) >= FeetToMeters(10.0f)) && (!GetWeaponRanged(oWeapon)))
		{
			if (LineOfSightObject(oPC, oTarget))
			{
				vector vStart = GetPosition(oPC);
				float fStart = vStart.z;
	
				ClearAllActions();
				TOBClearStrikes();
				SetLocalInt(oToB, "ChargeStatus", 1);
				DelayCommand(6.0f, SetLocalInt(oToB, "ChargeStatus", 0));
				DelayCommand(0.1f, TOBRunPCChargePosition(oPC, oToB));
				DelayCommand(0.5f, TOBRunCharge(oPC, oToB, oTarget, fStart, fRange));
				ActionMoveToObject(oTarget, TRUE, fRange);
			}
			else SendMessageToPC(oPC, "<color=red>You do not have line of sight to the target.</color>");
		}
		else SendMessageToPC(oPC, "<color=red>You must be at least ten feet away from the target and equipped with a melee weapon to make a charge.</color>");
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="salamander") // gui_tob_salamander.nss   void main()
	// not used anywhere???
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","salamander",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		if (!HkSwiftActionIsActive(oPC))
		{
			DeleteLocalInt(oPC, "SalamanderActive");
			DeleteLocalInt(oPC, "SalamanderTimer");
			SetLocalInt(oPC, "End_Salamander", 1);
			TOBRunSwiftAction(226, "STR");
	
			int nNumber = GetLocalInt(oPC, "SalamanderTopNumber");
			int s;
	
			s = 1;
	
			while (s <= nNumber)
			{
				DeleteLocalLocation(oPC, "SalamanderLoc" + IntToString(s));
				s++;
			}
	
			effect eTest;
	
			eTest = GetFirstEffect(oPC);
	
			while (GetIsEffectValid(eTest))
			{
				if (GetEffectSpellId(eTest) == 6554)
				{
					RemoveEffect(oPC, eTest);
					break;
				}
				eTest = GetNextEffect(oPC);
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="select_maneuver") // gui_tob_select_maneuver.nss   void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","select_maneuver",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nManeuver = StringToInt(sData);
		int nKnown = GetLocalInt(oToB, "KnownManeuverTotal");
		int nLevel = GetLocalInt(oToB, "CurrentLevelupLevel");
		int nClass = GetLocalInt(oToB, "LevelupClass");
		int nTotal = GetLocalInt(oToB, "LevelupTotal");
		int nStance = GetLocalInt(oToB, "LevelupStance");
		int nLevelCap = GetLocalInt(oToB, "LevelupCap");
		int nInitLevel = TOBGetInitiatorLevelup(oPC, nClass, nLevelCap);
		int nDiscipline = TOBGetManeuversDataDiscipline(nManeuver);
		int nIsStance = TOBGetManeuversDataIsStance(nManeuver);
		int nNumber;
	
		if (GetLocalInt(oToB, "CurrentLevelupLevel") == 0)
		{
			nNumber = nStance;
		}
		else nNumber = nTotal;
	
		if (nNumber > 0)
		{
			ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "AVAILABLE_MANEUVER_LIST");
			ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "ADDED_MANEUVER_LIST");
			SetLocalString(oToB, "AddedManeuver" + sData, sData);
			TOBPredictDisciplineStatus(nDiscipline, TRUE);
			TOBDisplayAddedManeuvers(oPC, oToB);
			TOBDisplayManeuversByClass(oPC, oToB, 1, 50, nLevel, nClass, nInitLevel);
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="select_rt_feat") // gui_tob_select_rt_feat.nss   void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","select_rt_feat",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		if (GetLocalInt(oToB, "FeatRetrainPhase") == 0)
		{
			int nSwitch = GetLocalInt(oToB, "SSInsightSwitch");
	
			if (nSwitch > 0)
			{
				int nDiscipline = StringToInt(sData);
	
				SetLocalInt(oToB, "SSWeaponFocus", nDiscipline);
				TOBDisplaySSInsightfulStrike(oPC, oToB);
	
				string sPict;
				string sTitle;
	
				switch (nDiscipline)
				{
					case 1: sPict = "desertwind";	sTitle = "Desert Wind";		break;
					case 3: sPict = "diamondmind";	sTitle = "Diamond Mind";	break;
					case 5: sPict = "settingsun";	sTitle = "Setting Sun";		break;
					case 6: sPict = "greenhand";	sTitle = "Shadow Hand";		break;
					case 7: sPict = "stonedragon";	sTitle = "Stone Dragon";	break;
					case 8: sPict = "tigerclaw";	sTitle = "Tiger Claw";		break;
					default:sPict = "b_empty.tga";	sTitle = "";				break;
				}
	
				string sIcon = "RETRAIN_IMAGE=" + sPict + ".tga";
				string sName = "RETRAIN_TEXT=" + sTitle;
				string sVari = "7=" + IntToString(nDiscipline);
	
				SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_NEXT", FALSE);
				SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "POINT_POOL_TEXT", -1, "0");
				AddListBoxRow(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "ADDED_RETRAIN_LIST", "RETRAINPANE_PROTO" + IntToString(nDiscipline), sName, sIcon, sVari, "");
				SetLocalInt(oToB, "SSInsightSwitch", 0);
			}
		}
		else
		{
			int nPool = GetLocalInt(oToB, "AvialableToRetrain");
			int nData = StringToInt(sData);
	
			if ((nPool > 0) && (GetLocalInt(oToB, "RetrainLoopCheck") == 0))
			{
				if (GetLocalInt(oToB, "PendingFeat1") > 0)
				{
					SetLocalInt(oToB, "PendingFeat2", nData);
				}
				else SetLocalInt(oToB, "PendingFeat1", nData);
	
				SetLocalInt(oToB, "RetrainLoopCheck", 1);
				SetLocalInt(oToB, "AvialableToRetrain", nPool - 1);
				SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "POINT_POOL_TEXT", -1, IntToString(nPool - 1));
				TOBDisplayAddedFeats(oPC, oToB);
				ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "AVAILABLE_RETRAIN_LIST");
				TOBGetAllAvailableFeats2(oPC, oToB, 1, 25);
			}
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="setmaneuverlevel") // gui_tob_setmaneuverlevel.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","setmaneuverlevel",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		string sLevel = GetStringLeft(sData, 1);
		string sClass = GetStringRight(sData, 3);
		string sScreen;
	
		if (sClass == "___")
		{
			sScreen = "SCREEN_MANEUVERS_KNOWN";
		}
		else sScreen = "SCREEN_MANEUVERS_KNOWN" + sClass;
	
		string sStanceListBox = "STANCE_LIST";
		string sListBoxL1 = "LEVEL1_LIST";
		string sListBoxL2 = "LEVEL2_LIST";
		string sListBoxL3 = "LEVEL3_LIST";
		string sListBoxL4 = "LEVEL4_LIST";
		string sListBoxL5 = "LEVEL5_LIST";
		string sListBoxL6 = "LEVEL6_LIST";
		string sListBoxL7 = "LEVEL7_LIST";
		string sListBoxL8 = "LEVEL8_LIST";
		string sListBoxL9 = "LEVEL9_LIST";
	
		if (sLevel == "0")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "1")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "2")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "3")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "4")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "5")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "6")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "7")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "8")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, FALSE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, TRUE);
		}
		else if (sLevel == "9")
		{
			SetGUIObjectHidden(oPC, sScreen, sStanceListBox, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL1, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL2, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL3, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL4, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL5, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL6, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL7, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL8, TRUE);
			SetGUIObjectHidden(oPC, sScreen, sListBoxL9, FALSE);
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="shadowbt") // gui_tob_shadowbt.nss  void main()
	// this does not seem to be used anywhere
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","shadowbt",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nSBT = GetLocalInt(oToB, "SBTRollPref");
	
		if (nSBT == 0)
		{
			SetLocalInt(oToB, "SBTRollPref", 1);
			FloatingTextStringOnCreature("<color=cyan>Shadow Blade Technique Mode: High Roll</color>", oPC, TRUE, 5.0f, COLOR_CYAN, COLOR_BLUE_DARK);
		}
		else
		{
			SetLocalInt(oToB, "SBTRollPref", 0);
			FloatingTextStringOnCreature("<color=cyan>Shadow Blade Technique Mode: Low Roll</color>", oPC, TRUE, 5.0f, COLOR_CYAN, COLOR_BLUE_DARK);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="ss_next") // gui_tob_ss_next.nss void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","ss_next",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nSSWF = GetLocalInt(oToB, "SSWeaponFocus");
	
		switch (nSSWF)
		{
			case 1:
			{
				SetLocalInt(oToB, "ForbiddenRetrain1", FEAT_WEAPON_FOCUS_SCIMITAR);
				SetLocalInt(oToB, "ForbiddenRetrain2", FEAT_WEAPON_FOCUS_LIGHT_MACE);
				SetLocalInt(oToB, "ForbiddenRetrain3", FEAT_WEAPON_FOCUS_SPEAR);
				SetLocalInt(oToB, "ForbiddenRetrain4", FEAT_WEAPON_FOCUS_FALCHION);
				break;
			}
			case 3:
			{
				SetLocalInt(oToB, "ForbiddenRetrain1", FEAT_WEAPON_FOCUS_RAPIER);
				SetLocalInt(oToB, "ForbiddenRetrain2", FEAT_WEAPON_FOCUS_SICKLE);
				SetLocalInt(oToB, "ForbiddenRetrain3", FEAT_WEAPON_FOCUS_KATANA);
				SetLocalInt(oToB, "ForbiddenRetrain4", FEAT_WEAPON_FOCUS_BASTARD_SWORD);
				break;
			}
			case 5:
			{
				SetLocalInt(oToB, "ForbiddenRetrain1", 100);
				SetLocalInt(oToB, "ForbiddenRetrain2", FEAT_WEAPON_FOCUS_SHORT_SWORD);
				SetLocalInt(oToB, "ForbiddenRetrain3", FEAT_WEAPON_FOCUS_SLING);
				SetLocalInt(oToB, "ForbiddenRetrain4", FEAT_WEAPON_FOCUS_STAFF);
				break;
			}
			case 6:
			{
				SetLocalInt(oToB, "ForbiddenRetrain1", 100);
				SetLocalInt(oToB, "ForbiddenRetrain2", FEAT_WEAPON_FOCUS_SHORT_SWORD);
				SetLocalInt(oToB, "ForbiddenRetrain3", FEAT_WEAPON_FOCUS_DAGGER);
				SetLocalInt(oToB, "ForbiddenRetrain4", FEAT_WEAPON_FOCUS_SHORTBOW);
				SetLocalInt(oToB, "ForbiddenRetrain5", FEAT_WEAPON_FOCUS_SCYTHE);
				SetLocalInt(oToB, "ForbiddenRetrain6", FEAT_WEAPON_FOCUS_SHURIKEN);
				break;
			}
			case 7:
			{
				SetLocalInt(oToB, "ForbiddenRetrain1", 100);
				SetLocalInt(oToB, "ForbiddenRetrain2", FEAT_WEAPON_FOCUS_GREAT_SWORD);
				SetLocalInt(oToB, "ForbiddenRetrain3", FEAT_WEAPON_FOCUS_GREAT_AXE);
				SetLocalInt(oToB, "ForbiddenRetrain4", FEAT_WEAPON_FOCUS_WARMACE);
				break;
			}
			case 8:
			{
				SetLocalInt(oToB, "ForbiddenRetrain1", 100);
				SetLocalInt(oToB, "ForbiddenRetrain2", 291);
				SetLocalInt(oToB, "ForbiddenRetrain3", FEAT_WEAPON_FOCUS_GREAT_AXE);
				SetLocalInt(oToB, "ForbiddenRetrain4", FEAT_WEAPON_FOCUS_SHORTBOW);
				SetLocalInt(oToB, "ForbiddenRetrain5", FEAT_WEAPON_FOCUS_KUKRI);
				SetLocalInt(oToB, "ForbiddenRetrain6", FEAT_WEAPON_FOCUS_HAND_AXE);
				break;
			}
		}
	
		SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_NEXT", TRUE);
		ExecuteScript("TB_ssweaponfocu", oPC);
		DelayCommand(0.1f, SetLocalInt(oToB, "FeatRetrainPhase", 1));
		SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_FINISH", FALSE);
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="ss_recovery") // gui_tob_ss_recovery.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","ss_recovery",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		TOBSetStrike(221, oToB);
		ActionUseFeat(FEAT_STUDENT_OF_THE_SUBLIME_WAY, oPC);
	}
	// deprecated, no longer needed			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//else if (sInput=="switch") // gui_tob_switch.nss	void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","switch",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//{	
	//	DelayCommand(0.05f, TOBSwitchCharacters());
	//}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="test") // gui_tob_test.nss  void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","test",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		object oPC = OBJECT_SELF;
		object oMartialAdept = GetControlledCharacter(oPC);
		object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
		int nWeapon = GetBaseItemType(oWeapon);
		object oFoe = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, CREATURE_ALIVE_TRUE);
		object oToB = CSLGetDataStore(oMartialAdept);
		int nHp = GetMaxHitPoints(oPC);
		effect eHeal = EffectHeal(GetMaxHitPoints(oPC));
		effect eAttack = EffectAttackIncrease(20);
	
	//	HkApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oPC);
	//	HkApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTest, oPC, 15.0f);
		HkApplyEffectToObject(DURATION_TYPE_PERMANENT, eAttack, oPC);
	
	//	int nVar = GetVariableCount(oToB);
	//	string sVar = GetVariableName(oToB, 22);
	//	SendMessageToPC(oPC, IntToString(nVar));
		SetImmortal(oPC, TRUE);
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="unlearn_maneuver") // gui_tob_unlearn_maneuver.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","unlearn_maneuver",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
		int nManeuver = StringToInt(sData);
		int nLevel = GetLocalInt(oToB, "CurrentLevelupLevel");
		int nClass = GetLocalInt(oToB, "LevelupClass");
		int nLevelCap = GetLocalInt(oToB, "LevelupCap");
		int nInitLevel = TOBGetInitiatorLevelup(oPC, nClass, nLevelCap);
		int nDiscipline = TOBGetManeuversDataDiscipline(nManeuver);
	
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "AVAILABLE_MANEUVER_LIST");
		ClearListBox(oPC, "SCREEN_LEVELUP_MANEUVERS", "ADDED_MANEUVER_LIST");
		DeleteLocalString(oToB, "AddedManeuver" + sData);
		TOBPredictDisciplineStatus(nDiscipline, FALSE);
		TOBDisplayAddedManeuvers(oPC, oToB);
		TOBDisplayManeuversByClass(oPC, oToB, 1, 50, nLevel, nClass, nInitLevel);
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="unlearn_rt_feat") // gui_tob_unlearn_rt_feat.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","unlearn_rt_feat",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		if (GetLocalInt(oToB, "FeatRetrainPhase") == 0)
		{
			SetGUIObjectDisabled(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "CHOICE_NEXT", TRUE);
			ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "ADDED_RETRAIN_LIST");
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "POINT_POOL_TEXT", -1, "1");
			SetLocalInt(oToB, "SSInsightSwitch", 1);
			SetLocalInt(oToB, "SSWeaponFocus", 0);
			TOBDisplaySSInsightfulStrike(oPC, oToB);
		}
		else if (GetLocalInt(oToB, "RetrainLoopCheck") == 0)
		{
			int nPool = GetLocalInt(oToB, "AvialableToRetrain");
			int nData = StringToInt(sData);
			int nPending1 = GetLocalInt(oToB, "PendingFeat1");
			int nPending2 = GetLocalInt(oToB, "PendingFeat2");
	
			if (nPending1 == nData)
			{
				SetLocalInt(oToB, "PendingFeat1", 0);
			}
			else SetLocalInt(oToB, "PendingFeat2", 0);
	
			SetLocalInt(oToB, "RetrainLoopCheck", 1);
			SetLocalInt(oToB, "AvialableToRetrain", nPool + 1);
			SetGUIObjectText(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "POINT_POOL_TEXT", -1, IntToString(nPool + 1));
			ClearListBox(oPC, "SCREEN_LEVELUP_RETRAIN_FEATS", "AVAILABLE_RETRAIN_LIST");
			TOBGetAllAvailableFeats2(oPC, oToB, 1, 25);
			TOBDisplayAddedFeats(oPC, oToB);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="wbl_recovery") // gui_tob_wbl_recovery.nss void main()
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","wbl_recovery",local:999)
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{	
		
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
	
		if ((GetCurrentAction(oPC) == ACTION_ATTACKOBJECT) && (!GetWeaponRanged(oWeapon)))
		{
			//object oToB = CSLGetDataStore(oPC);
	
			if ( !HkSwiftActionIsActive(oPC) && (GetLocalInt(oToB, "Quicksilver") == 0))
			{
				SetLocalInt(oToB, "WarbladeRecovery", 1);
				DelayCommand(6.0f, SetLocalInt(oToB, "WarbladeRecovery", 0));
				TOBWarbladeRecovery(oPC, oToB);
			}
		}
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="wendersnaven") // gui_tob_wendersnaven.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","wendersnaven",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		object oPC = OBJECT_SELF;
		object oMartialAdept = GetControlledCharacter(oPC);
	
		TOBRunScreenCheck(oMartialAdept, sData);
	}			
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if (sInput=="xref") // gui_tob_xref.nss  void main(string sData)
	// UIObject_Misc_ExecuteServerScript("gui_csl_tomebattle","xref",local:999,"sData")
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		//object oPC = GetControlledCharacter(OBJECT_SELF);
		//object oToB = CSLGetDataStore(oPC);
	
		if (sData == "0" || sData == "1" || sData == "2" || sData == "3" || sData == "4" || sData == "5" || sData == "6"
		|| sData == "7" || sData == "8" || sData == "9")
		{
			SetLocalString(oToB, "PrimerNumber", sData);
		}
		else if (sData == "DW" || sData == "DS" || sData == "DM" || sData == "IH" || sData == "SS" || sData == "SH"
		|| sData == "SD" || sData == "TC" || sData == "WR")
		{
			SetLocalString(oToB, "PrimerDiscipline", sData);
		}
	
		string sNumber = GetLocalString(oToB, "PrimerNumber");
		string sDiscipline = GetLocalString(oToB, "PrimerDiscipline");
	
		if (sNumber == "" || sDiscipline == "")
		{// If either of these hasn't been set yet we can end the script.
			return;
		}
	
		ClearListBox(oPC, "SCREEN_TOB_PRIMER", "SHOWN_MANEUVER_LIST");
	
		if (sNumber == "0" && sDiscipline == "DW") // Stances
		{
			TOBShowManeuver(1, "12");
			TOBShowManeuver(2, "15");
			TOBShowManeuver(3, "9");
			TOBShowManeuver(4, "21");
		}
		else if (sNumber == "0" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "42");
			TOBShowManeuver(2, "44");
			TOBShowManeuver(3, "51");
			TOBShowManeuver(4, "28");
			TOBShowManeuver(5, "29");
			TOBShowManeuver(6, "30");
			TOBShowManeuver(7, "31");
			TOBShowManeuver(8, "41");
		}
		else if (sNumber == "0" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "74");
			TOBShowManeuver(2, "68");
			TOBShowManeuver(3, "61");
		}
		else if (sNumber == "0" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "90");
			TOBShowManeuver(2, "76");
			TOBShowManeuver(3, "78");
			TOBShowManeuver(4, "95");
		}
		else if (sNumber == "0" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "113");
			TOBShowManeuver(2, "105");
			TOBShowManeuver(3, "110");
			TOBShowManeuver(4, "104");
		}
		else if (sNumber == "0" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "119");
			TOBShowManeuver(2, "129");
			TOBShowManeuver(3, "116");
			TOBShowManeuver(4, "122");
			TOBShowManeuver(5, "139");
			TOBShowManeuver(6, "117");
		}
		else if (sNumber == "0" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "163");
			TOBShowManeuver(2, "149");
			TOBShowManeuver(3, "159");
			TOBShowManeuver(4, "152");
			TOBShowManeuver(5, "164");
		}
		else if (sNumber == "0" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "165");
			TOBShowManeuver(2, "174");
			TOBShowManeuver(3, "175");
			TOBShowManeuver(4, "187");
			TOBShowManeuver(5, "177");
			TOBShowManeuver(6, "186");
		}
		else if (sNumber == "0" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "189");
			TOBShowManeuver(2, "195");
			TOBShowManeuver(3, "202");
			TOBShowManeuver(4, "198");
			TOBShowManeuver(5, "199");
		}
		else if (sNumber == "1" && sDiscipline == "DW") // Level 1
		{
			TOBShowManeuver(1, "1");
			TOBShowManeuver(2, "2");
			TOBShowManeuver(3, "6");
			TOBShowManeuver(4, "25");
		}
		else if (sNumber == "1" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "33");
			TOBShowManeuver(2, "53");
		}
		else if (sNumber == "1" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "67");
			TOBShowManeuver(2, "72");
		}
		else if (sNumber == "1" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "92");
			TOBShowManeuver(2, "93");
		}
		else if (sNumber == "1" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "209");
			TOBShowManeuver(2, "107");
		}
		else if (sNumber == "1" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "120");
			TOBShowManeuver(2, "132");
		}
		else if (sNumber == "1" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "146");
			TOBShowManeuver(2, "160");
		}
		else if (sNumber == "1" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "182");
			TOBShowManeuver(2, "185");
		}
		else if (sNumber == "1" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "192");
			TOBShowManeuver(2, "208");
			TOBShowManeuver(3, "194");
		}
		else if (sNumber == "2" && sDiscipline == "DW") // Level 2
		{
			TOBShowManeuver(1, "3");
			TOBShowManeuver(2, "10");
			TOBShowManeuver(3, "13");
			TOBShowManeuver(4, "14");
		}
		else if (sNumber == "2" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "40");
			TOBShowManeuver(2, "48");
		}
		else if (sNumber == "2" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "54");
			TOBShowManeuver(2, "60");
		}
		else if (sNumber == "2" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "80");
			TOBShowManeuver(2, "96");
		}
		else if (sNumber == "2" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "97");
			TOBShowManeuver(2, "99");
		}
		else if (sNumber == "2" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "121");
			TOBShowManeuver(2, "124");
			TOBShowManeuver(3, "135");
		}
		else if (sNumber == "2" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "156");
			TOBShowManeuver(2, "162");
		}
		else if (sNumber == "2" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "166");
			TOBShowManeuver(2, "179");
		}
		else if (sNumber == "2" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "188");
			TOBShowManeuver(2, "201");
		}
		else if (sNumber == "3" && sDiscipline == "DW") // Level 3
		{
			TOBShowManeuver(1, "4");
			TOBShowManeuver(2, "8");
			TOBShowManeuver(3, "27");
		}
		else if (sNumber == "3" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "35");
			TOBShowManeuver(2, "47");
		}
		else if (sNumber == "3" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "62");
			TOBShowManeuver(2, "64");
		}
		else if (sNumber == "3" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "87");
			TOBShowManeuver(2, "85");
		}
		else if (sNumber == "3" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "101");
			TOBShowManeuver(2, "102");
		}
		else if (sNumber == "3" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "134");
			TOBShowManeuver(2, "140");
		}
		else if (sNumber == "3" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "144");
			TOBShowManeuver(2, "161");
		}
		else if (sNumber == "3" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "170");
			TOBShowManeuver(2, "181");
		}
		else if (sNumber == "3" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "196");
			TOBShowManeuver(2, "207");
		}
		else if (sNumber == "4" && sDiscipline == "DW") // Level 4
		{
			TOBShowManeuver(1, "11");
			TOBShowManeuver(2, "23");
			TOBShowManeuver(3, "24");
		}
		else if (sNumber == "4" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "36");
			TOBShowManeuver(2, "39");
		}
		else if (sNumber == "4" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "56");
			TOBShowManeuver(2, "65");
			TOBShowManeuver(3, "71");
		}
		else if (sNumber == "4" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "86");
			TOBShowManeuver(2, "89");
		}
		else if (sNumber == "4" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "100");
			TOBShowManeuver(2, "114");
		}
		else if (sNumber == "4" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "128");
			TOBShowManeuver(2, "130");
		}
		else if (sNumber == "4" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "143");
			TOBShowManeuver(2, "145");
			TOBShowManeuver(3, "158");
		}
		else if (sNumber == "4" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "168");
			TOBShowManeuver(2, "171");
		}
		else if (sNumber == "4" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "191");
			TOBShowManeuver(2, "206");
		}
		else if (sNumber == "5" && sDiscipline == "DW") // Level 5
		{
			TOBShowManeuver(1, "7");
			TOBShowManeuver(2, "18");
			TOBShowManeuver(3, "19");
		}
		else if (sNumber == "5" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "34");
			TOBShowManeuver(2, "38");
			TOBShowManeuver(3, "43");
			TOBShowManeuver(4, "45");
			TOBShowManeuver(5, "52");
		}
		else if (sNumber == "5" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "59");
			TOBShowManeuver(2, "70");
		}
		else if (sNumber == "5" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "79");
			TOBShowManeuver(2, "84");
		}
		else if (sNumber == "5" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "108");
			TOBShowManeuver(2, "111");
			TOBShowManeuver(3, "112");
		}
		else if (sNumber == "5" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "118");
			TOBShowManeuver(2, "137");
		}
		else if (sNumber == "5" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "151");
			TOBShowManeuver(2, "155");
		}
		else if (sNumber == "5" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "167");
			TOBShowManeuver(2, "176");
		}
		else if (sNumber == "5" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "193");
		}
		else if (sNumber == "6" && sDiscipline == "DW") // Level 6
		{
			TOBShowManeuver(1, "5");
			TOBShowManeuver(2, "20");
		}
		else if (sNumber == "6" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "46");
		}
		else if (sNumber == "6" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "63");
			TOBShowManeuver(2, "66");
		}
		else if (sNumber == "6" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "83");
			TOBShowManeuver(2, "88");
		}
		else if (sNumber == "6" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "98");
			TOBShowManeuver(2, "109");
		}
		else if (sNumber == "6" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "127");
			TOBShowManeuver(2, "136");
			TOBShowManeuver(3, "138");
		}
		else if (sNumber == "6" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "148");
			TOBShowManeuver(2, "153");
			TOBShowManeuver(3, "154");
		}
		else if (sNumber == "6" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "178");
			TOBShowManeuver(2, "184");
		}
		else if (sNumber == "6" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "197");
			TOBShowManeuver(2, "203");
		}
		else if (sNumber == "7" && sDiscipline == "DW") // Level 7
		{
			TOBShowManeuver(1, "16");
			TOBShowManeuver(2, "22");
		}
		else if (sNumber == "7" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "32");
			TOBShowManeuver(2, "49");
		}
		else if (sNumber == "7" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "55");
			TOBShowManeuver(2, "69");
		}
		else if (sNumber == "7" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "82");
			TOBShowManeuver(2, "91");
		}
		else if (sNumber == "7" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "106");
		}
		else if (sNumber == "7" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "123");
			TOBShowManeuver(2, "133");
		}
		else if (sNumber == "7" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "142");
			TOBShowManeuver(2, "147");
		}
		else if (sNumber == "7" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "173");
			TOBShowManeuver(2, "183");
		}
		else if (sNumber == "7" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "190");
			TOBShowManeuver(2, "200");
		}
		else if (sNumber == "8" && sDiscipline == "DW") // Level 8
		{
			TOBShowManeuver(1, "26");
		}
		else if (sNumber == "8" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "37");
		}
		else if (sNumber == "8" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "57");
			TOBShowManeuver(2, "58");
		}
		else if (sNumber == "8" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "77");
			TOBShowManeuver(2, "87");
		}
		else if (sNumber == "8" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "103");
		}
		else if (sNumber == "8" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "125");
			TOBShowManeuver(2, "131");
		}
		else if (sNumber == "8" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "141");
			TOBShowManeuver(2, "150");
		}
		else if (sNumber == "8" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "172");
			TOBShowManeuver(2, "180");
		}
		else if (sNumber == "8" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "199");
			TOBShowManeuver(2, "205");
		}
		else if (sNumber == "9" && sDiscipline == "DW") // Level 9
		{
			TOBShowManeuver(1, "17");
		}
		else if (sNumber == "9" && sDiscipline == "DS")
		{
			TOBShowManeuver(1, "50");
		}
		else if (sNumber == "9" && sDiscipline == "DM")
		{
			TOBShowManeuver(1, "75");
		}
		else if (sNumber == "9" && sDiscipline == "IH")
		{
			TOBShowManeuver(1, "94");
		}
		else if (sNumber == "9" && sDiscipline == "SS")
		{
			TOBShowManeuver(1, "115");
		}
		else if (sNumber == "9" && sDiscipline == "SH")
		{
			TOBShowManeuver(1, "126");
		}
		else if (sNumber == "9" && sDiscipline == "SD")
		{
			TOBShowManeuver(1, "157");
		}
		else if (sNumber == "9" && sDiscipline == "TC")
		{
			TOBShowManeuver(1, "169");
		}
		else if (sNumber == "9" && sDiscipline == "WR")
		{
			TOBShowManeuver(1, "204");
		}			
	}		
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}				