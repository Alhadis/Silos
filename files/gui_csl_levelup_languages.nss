////////////////////////////////////////////////////////////////////////////////
// gui_csl_levelup_languages.nss
#include "_SCInclude_Language"


// * sInput is the relevant command or button hit
// * sCommand is the stored variable               sCommand
void main(string sInput, string sPlayerID = "", string sLanguageVar = "" )
{
	object oPC = GetControlledCharacter(OBJECT_SELF);
	//DEBUGGING = 10;
	//SendMessageToPC(oPC,"dmappear sInput="+sInput+" sPlayerID="+sPlayerID+" sLanguageVar="+sLanguageVar);
	
	sInput = GetStringLowerCase( sInput );
	string sPageTitle;
	object oTarget;
	if ( sPlayerID == "targeted" )
	{
		oTarget = GetPlayerCurrentTarget( OBJECT_SELF );
		//if ( !GetIsObjectValid( oTarget )  )
		//{		
		//	oTarget == OBJECT_SELF;
		//}
		
		sPageTitle = "Current Target";
	}
	else
	{
		oTarget = IntToObject(StringToInt(sPlayerID));
		sPageTitle = "Target: "+GetName(oTarget);
	}
	
	

	//string sNum, sPage, sValue, sTest, sScreen;
	//int nPage, nCurrent, n;
	
	//string sCategory = GetLocalString( oPC, "CSL_TABLE_CURRENTCATEGORY" );

	//SendMessageToPC(oPC,"dmappear"+sPageTitle);
	
	if ( sInput=="update")
	{
		//SetLocalString( oPC, "CSL_TABLE_CURRENTCATEGORY", sCommand );
		//CSLDMAppear_Build(oPC, oTarget, CSL_PAGE_FIRST, sCommand, sPageTitle );
	}
	else if (sInput=="select")
	{
		object oLanguageTable = CSLDataObjectGet( "languages" );
		int iRow = CSLDataTableGetRowByValue( oLanguageTable, sLanguageVar );
		if ( iRow > -1 )
		{
			// string sLabel = GetStringLowerCase( CSLDataTableGetStringByRow( oLanguageTable, "Label", iRow ) );
			string sName = CSLDataTableGetStringByRow( oLanguageTable, "Name", iRow ) ;
			string sIcon = CSLDataTableGetStringByRow( oLanguageTable, "Icon", iRow )+".tga";
			SetGUITexture(oPC, SCREEN_LEVELUPLANGUAGES, "INFOPANE_IMAGE",sIcon);
			
			SetGUIObjectText(oPC, SCREEN_LEVELUPLANGUAGES, "INFOPANE_TITLE", -1, sName );
			int iDescription = StringToInt(Get2DAString("csl_languages","Description",iRow));
			SetGUIObjectText(oPC, SCREEN_LEVELUPLANGUAGES, "INFOPANE_TEXT", iDescription, "" );
		}
	}
	else if (sInput=="add" || sInput=="remove" )
	{
		int iLanguagePointsUsed = GetLocalInt(oPC, DMFI_LANGUAGE_POINTSUSED );
		int iLanguagePointsTotal = CSLLanguageGetLanguagePoints( oPC );
		string sLanguageLearnable = GetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST );
		string sLanguageLearning = GetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST );
		string sType;
		//SendMessageToPC( GetFirstPC(),"sLanguageLearnable="+sLanguageLearnable+"  sLanguageLearning="+sLanguageLearning);
		object oLanguageTable = CSLDataObjectGet( "languages" );
		int iRow = CSLDataTableGetRowByValue( oLanguageTable, sLanguageVar );
		if ( iRow > -1 )
		{
			sType = CSLDataTableGetStringByRow( oLanguageTable, "Type", iRow );
			if ( sType != "Accent" )
			{
				string sLabel = GetStringLowerCase( CSLDataTableGetStringByRow( oLanguageTable, "Label", iRow ) );
				string sName = CSLDataTableGetStringByRow( oLanguageTable, "Name", iRow ) ;
				int iLanguageCost = StringToInt(CSLDataTableGetStringByRow( oLanguageTable, "Difficulty", iRow ));
				if ( GetHasFeat( FEAT_LANG_LINGUIST, oPC) )
				{
					iLanguageCost = CSLGetMax(iLanguageCost-1,1);
				}
				else
				{
					iLanguageCost = CSLGetMax(iLanguageCost,1);
				}
				string sFields="LANGUAGE_TEXTENABLED="+sName;
				string sVariables="25="+sLabel;
				string sTextures = "LANGUAGE_IMAGE="+CSLDataTableGetStringByRow( oLanguageTable, "Icon", iRow )+".tga";;
				string sHide = "LANGUAGE_ACTION=unhide";
				
				if ( sInput=="remove" )
				{
					RemoveListBoxRow( oPC,SCREEN_LEVELUPLANGUAGES,"ADDED_LANGUAGE_LIST",sLabel );
					AddListBoxRow(oPC,SCREEN_LEVELUPLANGUAGES,"AVAILABLE_LANGUAGE_LIST",sLabel,sFields,sTextures,sVariables,sHide); 
					
					sLanguageLearning = CSLNth_Replace( sLanguageLearning, sLabel, "" );
					sLanguageLearnable = CSLNth_Push(sLanguageLearnable, sLabel, ",", TRUE ); // appends item
					SetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST, sLanguageLearnable );
					SetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST, sLanguageLearning );
					
					iLanguagePointsUsed -= iLanguageCost;
				}
				else if ( iLanguagePointsTotal >= (iLanguagePointsUsed+iLanguageCost) ) //( sInput=="add" )
				{
					RemoveListBoxRow( oPC,SCREEN_LEVELUPLANGUAGES,"AVAILABLE_LANGUAGE_LIST",sLabel );
					AddListBoxRow(oPC,SCREEN_LEVELUPLANGUAGES,"ADDED_LANGUAGE_LIST",sLabel,sFields,sTextures,sVariables,sHide);
					
					sLanguageLearnable = CSLNth_Replace( sLanguageLearnable, sLabel, "" );
					sLanguageLearning = CSLNth_Push(sLanguageLearning, sLabel, ",", TRUE ); // appends item
					SetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST, sLanguageLearnable );
					SetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST, sLanguageLearning );
					
					iLanguagePointsUsed += iLanguageCost;
				}
				else
				{
					// don't have enough to take this language, display an error message perhaps
				}
				SetLocalInt(oPC, DMFI_LANGUAGE_POINTSUSED, iLanguagePointsUsed );
				int iLanguagePoints = CSLGetMax(iLanguagePointsTotal-iLanguagePointsUsed,0);
				SetGUIObjectText(oPC, SCREEN_LEVELUPLANGUAGES, "POINT_POOL_TEXT", -1, IntToString( iLanguagePoints ) );
			}
		}
	}
	else if (sInput=="recommend")
	{
		int iLanguagePointsUsed = GetLocalInt(oPC, DMFI_LANGUAGE_POINTSUSED );
		int iLanguagePointsTotal = CSLLanguageGetLanguagePoints( oPC );
		string sLanguageLearnable = GetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST );
		string sLanguageLearning = GetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST );
		
		
		//if ( DEBUGGING > 3 ) { SendMessageToPC(oPC,CSLColorText( " hit recommend  sLanguageLearnable="+sLanguageLearnable ,-1,CHAT_COLOR_DEBUG) ); }
		//if ( DEBUGGING > 3 ) { SendMessageToPC(oPC,CSLColorText( " hit recommend  sLanguageLearning="+sLanguageLearning ,-1,CHAT_COLOR_DEBUG) ); }
		
		int iLanguageCost, iLearnableCount, i, iRow;
		string sLabel, sName, sFields, sVariables, sTextures, sHide, sNewLanguage, sFeatId;
		if ( sLanguageLearnable != "" )
		{
			object oLanguageTable = CSLDataObjectGet( "languages" );
			string sType;
			string sLanguageLearnableOrig = sLanguageLearnable; // put into a new variable so i can safely iterate, i am adjusting the list when i hit recommend
			iLearnableCount = CSLNth_GetCount( sLanguageLearnableOrig, "," );
			for ( i=1; i <= iLearnableCount; i++ )
			{
				sNewLanguage = CSLNth_GetNthElement(sLanguageLearnableOrig, i, ",");
				
				//iLanguageFeat = CSLLanguageGetFeatFor( sNewLanguage );
				iRow = CSLDataTableGetRowByValue( oLanguageTable, sNewLanguage );
				//SendMessageToPC(GetFirstPC(),"***** Working on sNewLanguage="+sNewLanguage+" iRow"+IntToString(iRow)+"*****");
				if ( iRow != -1 )
				{			
					sType = CSLDataTableGetStringByRow( oLanguageTable, "Type", iRow );
					//SendMessageToPC(GetFirstPC()," sType="+sType );

					if ( sType != "Accent" )
					{
						sFeatId = CSLDataTableGetStringByRow( oLanguageTable, "FeatId", iRow );
						iLanguageCost = StringToInt(CSLDataTableGetStringByRow( oLanguageTable, "Difficulty", iRow ));
						if ( GetHasFeat( FEAT_LANG_LINGUIST, oPC) )
						{
							iLanguageCost = CSLGetMax(iLanguageCost-1,1);
						}
						else
						{
							iLanguageCost = CSLGetMax(iLanguageCost,1);
						}
						//if ( DEBUGGING > 3 ) { SendMessageToPC(GetFirstPC(),"sFeatId="+sFeatId+" if ( iLanguagePointsTotal="+IntToString(iLanguagePointsTotal)+" >= iLanguagePointsUsed="+IntToString(iLanguageCost)+") + iLanguageCost="+IntToString(iLanguagePointsTotal)+") equals "+IntToString(iLanguagePointsUsed+iLanguageCost) ); }
						if ( iLanguagePointsTotal >= (iLanguagePointsUsed+iLanguageCost))
						{
							if ( sFeatId != "" && !GetHasFeat( StringToInt( sFeatId ) , oPC ) )
							{
								sLabel = GetStringLowerCase( CSLDataTableGetStringByRow( oLanguageTable, "Label", iRow ) );
								sName = CSLDataTableGetStringByRow( oLanguageTable, "Name", iRow ) ;
								//if ( DEBUGGING > 3 ) { SendMessageToPC(GetFirstPC(),"Moving sName="+sName ); }
								sFields="LANGUAGE_TEXTENABLED="+sName;
								sVariables="25="+sLabel;
								sTextures = "LANGUAGE_IMAGE="+CSLDataTableGetStringByRow( oLanguageTable, "Icon", iRow )+".tga";;
								sHide = "LANGUAGE_ACTION=unhide";
								
								RemoveListBoxRow( oPC,SCREEN_LEVELUPLANGUAGES,"AVAILABLE_LANGUAGE_LIST",sLabel );
								AddListBoxRow(oPC,SCREEN_LEVELUPLANGUAGES,"ADDED_LANGUAGE_LIST",sLabel,sFields,sTextures,sVariables,sHide);
								
								sLanguageLearnable = CSLNth_Replace( sLanguageLearnable, sLabel, "" );
								sLanguageLearning = CSLNth_Push(sLanguageLearning, sLabel, ",", TRUE ); // appends item
								SetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST, sLanguageLearnable );
								SetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST, sLanguageLearning );
								
								iLanguagePointsUsed += iLanguageCost;
								//if ( DEBUGGING > 3 ) { SendMessageToPC(GetFirstPC(),"Moving iLanguageCost="+IntToString(iLanguageCost)+" iLanguagePointsUsed="+IntToString(iLanguagePointsUsed) ); }
							}
						}
					}
				}
			}
		}
		SetLocalInt(oPC, DMFI_LANGUAGE_POINTSUSED, iLanguagePointsUsed );
		int iLanguagePoints = CSLGetMax(iLanguagePointsTotal-iLanguagePointsUsed,0);
		SetGUIObjectText(oPC, SCREEN_LEVELUPLANGUAGES, "POINT_POOL_TEXT", -1, IntToString( iLanguagePoints ) );
		
		//if ( DEBUGGING > 3 ) { SendMessageToPC(oPC,CSLColorText( " finished recommend  sLanguageLearnable="+sLanguageLearnable ,-1,CHAT_COLOR_DEBUG) ); }
		//if ( DEBUGGING > 3 ) { SendMessageToPC(oPC,CSLColorText( " finished recommend  sLanguageLearning="+sLanguageLearning ,-1,CHAT_COLOR_DEBUG) ); }
		
		//CSLDMAppear_Build(oPC, oTarget, CSL_PAGE_LAST, sCommand, sPageTitle );
		//return;
	}
	else if (sInput=="cancel")
	{
		//CSLDMAppear_Build(oPC, oTarget, CSL_PAGE_LAST, sCommand, sPageTitle );
		//return;
		SetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST, "" );
		SetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST, "" );
		CloseGUIScreen(oPC, SCREEN_LEVELUPLANGUAGES );
	}
	else if (sInput=="finish")
	{
		//CSLDMAppear_Build(oPC, oTarget, CSL_PAGE_LAST, sCommand, sPageTitle );
		//return;
		
		CloseGUIScreen(oPC, SCREEN_LEVELUPLANGUAGES );
		object oLanguageTable = CSLDataObjectGet( "languages" );
		
		int i;
		int iRow, iLanguageCost, iLanguageTotalCost, iAutomaticCount;
		string sNewLanguage, sFeatId;
		string sLangAutomatic = GetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST );
		int iLanguagePointsTotal = CSLLanguageGetLanguagePoints( oPC );
		string sType;
		//int iLanguageFeat;
		// SendMessageToPC(GetFirstPC(),"sLangAutomatic="+sLangAutomatic);
		if ( sLangAutomatic != "" )
		{
			iAutomaticCount = CSLNth_GetCount( sLangAutomatic );
			for ( i=1; i <= iAutomaticCount; i++ )
			{
				sNewLanguage = CSLNth_GetNthElement(sLangAutomatic, i);
				//SendMessageToPC(GetFirstPC(),"sNewLanguage="+sNewLanguage);
				//iLanguageFeat = CSLLanguageGetFeatFor( sNewLanguage );
				iRow = CSLDataTableGetRowByValue( oLanguageTable, sNewLanguage );
				if ( iRow != -1 )
				{			
					sType = CSLDataTableGetStringByRow( oLanguageTable, "Type", iRow );
					if ( sType != "Accent" )
					{
						sFeatId = CSLDataTableGetStringByRow( oLanguageTable, "FeatId", iRow );
						iLanguageCost = StringToInt(CSLDataTableGetStringByRow( oLanguageTable, "Difficulty", iRow ));
						if ( GetHasFeat( FEAT_LANG_LINGUIST, oPC) )
						{
							iLanguageCost = CSLGetMax(iLanguageCost-1,1);
						}
						else
						{
							iLanguageCost = CSLGetMax(iLanguageCost,1);
						}
						//SendMessageToPC(GetFirstPC(),"sFeatId="+sFeatId+" if ( iLanguageTotalCost="+IntToString(iLanguageTotalCost)+" + iLanguageCost="+IntToString(iLanguageCost)+") <= iLanguagePointsTotal="+IntToString(iLanguagePointsTotal) );
						if ( ( iLanguageTotalCost + iLanguageCost ) <= iLanguagePointsTotal )
						{
							if ( sFeatId != "" && !GetHasFeat( StringToInt( sFeatId ) , oPC ) )
							{
								iLanguageTotalCost += iLanguageCost;
								FeatAdd( oPC, StringToInt( sFeatId ) , TRUE, FALSE );
								//SendMessageToPC(GetFirstPC(),"Adding Feat "+sFeatId+" label="+sNewLanguage);
							}
							//else
							//{
							//	SendMessageToPC(GetFirstPC(),"Not Feat "+sFeatId+" label="+sNewLanguage);
							//}
						}
					}
					//else
					//{
					//	SendMessageToPC(GetFirstPC(),"Not "+sFeatId+" label="+sNewLanguage);
					//}
				}
			}
		}
		
		CSLLanguageAdjustLanguagePoints( -iLanguageTotalCost, oPC );
		
		SetLocalString(oPC, DMFI_LANGUAGE_LEARNABLELIST, "" );
		SetLocalString(oPC, DMFI_LANGUAGE_LEARNINGLIST, "" );
		
		// update options in chat
		SetLocalString(oPC, DMFI_LANGUAGE_HOTBARLIST, "" );
		CSLLanguageUIChatIconRow( oPC );
		
	}

}				