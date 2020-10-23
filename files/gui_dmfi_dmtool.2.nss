////////////////////////////////////////////////////////////////////////////////
// gui_dmfi_dmtool - DM Friendly Initiative - GUI script for running "tool" level commands
// Original Scripter:  Demetrious      Design: DMFI Design Team
//------------------------------------------------------------------------------
// Last Modified By:   Demetrious           12/28/6
//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////


#include "_SCInclude_DMFI"
#include "_SCInclude_DMFIComm"
#include "_SCInclude_DMAppear"

void main(string sInput)
{
	object oPC = OBJECT_SELF;
	object oTool = CSLDMFI_GetTool(oPC);
	object oPossess, oTarget;
	string sTest;
	string sCommand;
	string sList;
	string sTitle;
	string sScreen;
	int n;
	
	// COMMANDS RUN VIA THIS CODE - INDEPENDENT OF UI		
	if (GetStringLeft(sInput, 1)==".")
	{
		sInput = GetStringRight(sInput, GetStringLength(sInput)-1);
		sInput = CSLStringSwapChars(sInput, "_", " ");
			
		oPC = DMFI_UITarget(oPC, oTool);
		DMFI_DefineStructure(oPC, sInput);
		DMFI_RunCommandCode(oTool, oPC, sInput);
	}	
	
	// A few special commands so that the context UI can share this script.
	else if (sInput=="context_time")
	{
		CSLDMFI_ClearUIData(oPC);
		SetLocalString(oPC, DMFI_LAST_UI_COM, "time" + " ");
		SetLocalString(oPC, DMFI_UI_PAGE, "LIST_24");
		SetLocalString(oPC, DMFI_UI_LIST_TITLE, CV_PROMPT_TIME);
		DMFI_ShowDMListUI(oPC);
	}
	else if (sInput=="context_grant")
	{
		CSLDMFI_ClearUIData(oPC);
		SetLocalString(oPC, DMFI_LAST_UI_COM, "grant ");
		SetLocalString(oPC, DMFI_UI_PAGE, "LIST_DMLANGUAGE");
		SetLocalString(oPC, DMFI_UI_LIST_TITLE, CV_PROMPT_GRANT);
		DMFI_ShowDMListUI(oPC);
	}
	else if (sInput=="context_remove")
	{
		CSLDMFI_ClearUIData(oPC);
		CSLDataArray_DeleteEntire( oTool, "LIST_LANGUAGE" );
		SetLocalObject(oTool, "DLG_HOLDER", oTool);  // Required for new CTDS functions
		DMFI_UITarget(oPC, oTool);
		oTarget = GetLocalObject(oTool, DMFI_TARGET);
		//DMFI_BuildLanguageList(oTool, oTarget);
		
		SetLocalString(oPC, DMFI_LAST_UI_COM, "remove language ");
		SetLocalString(oPC, DMFI_UI_PAGE, "LIST_LANGUAGE");
		SetLocalString(oPC, DMFI_UI_LIST_TITLE, CV_PROMPT_REMOVE);
		DMFI_ShowDMListUI(oPC);	
	}
	else if (sInput=="context_effects")
	{
		CSLDMFI_ClearUIData(oPC);
		CSLDataArray_DeleteEntire( oTool, "TARGET_EFFECT" );
		SetLocalObject(oTool, "DLG_HOLDER", oTool);  // Required for new CTDS functions
		DMFI_UITarget(oPC, oTool);
		oTarget = GetLocalObject(oTool, DMFI_TARGET);
		DMFI_BuildEffectList(oTool, oTarget);
		
		SetLocalString(oPC, DMFI_LAST_UI_COM, "remove effect ");
		SetLocalString(oPC, DMFI_UI_PAGE, "TARGET_EFFECT");
		SetLocalString(oPC, DMFI_UI_LIST_TITLE, CV_PROMPT_EFFECTS);
		SetLocalInt(oPC, DMFI_REQ_INT, 2);
		DMFI_ShowDMListUI(oPC);	
	}
	else if (sInput=="context_scale")
	{
		CSLDMFI_ClearUIData(oPC);
		SetLocalString(oPC, DMFI_LAST_UI_COM, "scale" + " ");
		SetLocalString(oPC, DMFI_UI_PAGE, "LIST_300");
		SetLocalString(oPC, DMFI_UI_LIST_TITLE, CV_PROMPT_SCALE);
		DMFI_ShowDMListUI(oPC);
	}
	else if (sInput=="context_appearance")
	{
		//CSLDMFI_ClearUIData(oPC);
		//SetLocalString(oPC, DMFI_LAST_UI_COM, PRM_APPEARANCE + " ");
		//SetLocalString(oPC, DMFI_UI_PAGE, PG_LIST_APPEARANCE);
		//SetLocalString(oPC, DMFI_UI_LIST_TITLE, CV_PROMPT_APPEARANCE);
		//SetLocalInt(oPC, DMFI_REQ_INT, 1);
		//DMFI_ShowDMListUI(oPC);
		//SetLocalString( oPC, "CSL_TABLE_CURRENTCATEGORY", "" );
		//CSLTableShowListUI(oPC, CSL_PAGE_FIRST, "", "Appearance", "Change Appearance" );
		
		CSLDMAppear_Display( oPC );

	}	
	
		
	
	// UPDATE NUMBER COMMANDS - Custom Page and Header Info
	else if (FindSubString(sInput,"update_")!=-1)
	{
		CSLDMFI_ClearUIData(oPC);
		SetLocalString(oPC, DMFI_LAST_UI_COM, sInput);
		
		if (FindSubString(sInput, "dc")!=-1)
		{
			sList = "LIST_50";
			sTitle = CV_PROMPT_DC;
		}
		else if (FindSubString(sInput, "delay")!=-1)
		{
			sList = "LIST_50";
			sTitle = CV_PROMPT_DELAY;
		}	
		else if (FindSubString(sInput, "dur")!=-1)
		{
			sList = "LIST_DURATIONS";
			sTitle = CV_PROMPT_DURATION;
		}	
		else if (FindSubString(sInput, "vol")!=-1)
		{
			sList = "LIST_100";
			sTitle = CV_PROMPT_VOLUME;
		}	
							
		SetLocalString(oPC, DMFI_UI_PAGE, sList);
		SetLocalString(oPC, DMFI_UI_LIST_TITLE, sTitle);
		DMFI_ShowDMListUI(oPC);
	}	
		
	else if (FindSubString(sInput,"toggle_")!=-1)
	{
		sScreen = GetLocalString(oPC, "DMFI_UI_USE");
		sScreen = SCREEN_DMFI_ + sScreen;	
		
		sCommand = GetStringRight(sInput, GetStringLength(sInput)-7);
		sTest = DMFI_TogglePreferences(oTool, sCommand);
		SetGUIObjectText(oPC, sScreen, "toggle_"+sCommand, -1, CSLStringToProper(sTest));
	
		if (sCommand == "musictime")
		{
			// Special exception code to add the music type to the prompt for the list.
			sTest = CSLStringToProper(GetLocalString(oTool, DMFI_MUSIC_TIME));
			sTest = CSLColorText("Music " + sTest, COLOR_CYAN);
			SetGUIObjectText(oPC, SCREEN_DMFI_DMLIST, "DMListTitle", -1, sTest + CV_PROMPT_MS_TRACK);
		}	
	}
	
	else
	{
		sScreen = GetLocalString(oPC, "DMFI_UI_USE");
		sScreen = SCREEN_DMFI_ + sScreen;	
	
		if (sInput=="close")
		{
			CloseGUIScreen(oPC, sScreen);
			CloseGUIScreen(oPC, SCREEN_DMFI_DMLIST);
			return;
		}
		else if (FindSubString(sInput, "sub")!=-1)
		{	
			CSLDMFI_ClearUIData(oPC);
			
			if (sScreen==SCREEN_DMFI_DICETOOL)
			{
				if (sInput=="sub1")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_ABILITY");
					sTest = CV_PROMPT_ABILITY;
				}	
				else if (sInput=="sub2")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST SKILL");
					sTest = CV_PROMPT_SV;
				}	
				else if (sInput=="sub3")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_10");
					sTest = CV_PROMPT_DICE;
				}
				SetLocalString(oPC, DMFI_LAST_UI_COM, "roll ");
			}
			else if (sScreen==SCREEN_DMFI_MUSICTOOL)
			{		
				if (sInput=="sub1")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_MUSIC_NWN2");
				else if (sInput=="sub2")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_MUSIC_NWN1");
				else if (sInput=="sub3")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_MUSIC_XP");
				else if (sInput=="sub4")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_MUSIC_BATTLE");
				else if (sInput=="sub5")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_MUSIC_MOTB");	
				
				sTest = CSLStringToProper(GetLocalString(oTool, DMFI_MUSIC_TIME));
				sTest = CSLColorText("Music " + sTest, COLOR_CYAN);
				sTest = sTest + CV_PROMPT_MS_TRACK;
				SetLocalString(oPC, DMFI_LAST_UI_COM, "set music "); 
				SetLocalInt(oPC, DMFI_REQ_INT, 1);
			}
			else if (sScreen==SCREEN_DMFI_VFXTOOL)
			{
				if (sInput=="sub1")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_VFX_SPELL");
				else if (sInput=="sub2")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_VFX_IMP");
				else if (sInput=="sub3")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_VFX_DUR");
				else if (sInput=="sub4")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_VFX_MISC");
				else if (sInput=="sub5")
				{//Special code to build the list dynamically
					CSLDataArray_DeleteEntire( oTool, "LIST_VFX_RECENT" );
					SetLocalObject(oTool, "DLG_HOLDER", oTool);  // Required for new CTDS functions
					DMFI_BuildRecentVFXList(oTool);
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_VFX_RECENT");
				}
				sTest = CV_PROMPT_VFX;
				SetLocalString(oPC, DMFI_LAST_UI_COM, "vfx ");
				SetLocalInt(oPC, DMFI_REQ_INT, 1);
			}	
			else if (sScreen==SCREEN_DMFI_AMBTOOL)
			{
				if (sInput=="sub1")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_AMBIENT_CAVE");
				else if (sInput=="sub2")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_AMBIENT_MAGIC");
				else if (sInput=="sub3")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_AMBIENT_PEOPLE");
				else if (sInput=="sub4")
					SetLocalString(oPC, DMFI_UI_PAGE, "LIST_AMBIENT_MISC");
				
				sTest =  CV_PROMPT_VOLUME;
				SetLocalString(oPC, DMFI_LAST_UI_COM, "set ambient "); 
				SetLocalInt(oPC, DMFI_REQ_INT, 1);
			}
			else if (sScreen==SCREEN_DMFI_SNDTOOL)
			{
				if (sInput=="sub1")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "DISPLAY" + "LIST_SOUND_CITY");
					sCommand = "city";
				}	
				else if (sInput=="sub2")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "DISPLAY" + "LIST_SOUND_MAGIC");
					sCommand = "magical";
				}	
				else if (sInput=="sub3")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "DISPLAY" + "LIST_SOUND_NATURE");
					sCommand = "nature";
				}
				else if (sInput=="sub4")
				{
					SetLocalString(oPC, DMFI_UI_PAGE, "DISPLAY" + "LIST_SOUND_PEOPLE");
					sCommand = "people";
				}	
				sTest = CV_PROMPT_SOUND;
				SetLocalString(oPC, DMFI_LAST_UI_COM, "sound" + " " + sCommand + " "); 
				SetLocalInt(oPC, DMFI_REQ_INT, 2);  // 2 use THE actual selction - not ref int - not string
			}		
			
			SetLocalString(oPC, DMFI_UI_LIST_TITLE, sTest);
			DMFI_ShowDMListUI(oPC);
		}
	}
}