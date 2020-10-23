/** @file
* @brief Include file for Caching a players spell casting properties
*
* This is a system for Caching the stats of the player, and
* to a certain degree these can override the ingame rules.
*
* The stats after being run are stored on the character.
* 
*
* @ingroup scinclude
* @author Brian T. Meyer and others
*/




/////////////////////////////////////////////////////
//////////////// Includes ///////////////////////////
/////////////////////////////////////////////////////

#include "_CSLCore_Class"
#include "_CSLCore_Strings"
#include "_CSLCore_Info"
#include "_CSLCore_UI"


/////////////////////////////////////////////////////
//////////////// Implementation /////////////////////
/////////////////////////////////////////////////////

/**  
* Gets the correct spellcasting progression, requires _CSLCore_Class to have the progressions specified for each class
* @private
* @author
* @param 
* @see 
* @return 
*/
int SCPrep_GetSpellLevelsBasedOnClass( int iClass, object oCaster = OBJECT_SELF )
{
	if ( !GetIsObjectValid(oCaster) ) { return 0;} // make sure it's only run on a valid object
	
	int iProgressionTable = CSLGetProgrssionTable( iClass );
	
	int iClassLevel =  GetLevelByClass( iClass, oCaster );
	
	if ( iProgressionTable == SC_PROG_NONE )
	{
		return 0;
	}
	
	if ( iProgressionTable == SC_PROG_FULL )
	{
		return iClassLevel;
	}
	
	if ( iProgressionTable == SC_PROG_EVEN )
	{
		return iClassLevel / 2;
	}
	
	if ( iProgressionTable == SC_PROG_ODD )
	{
		return  ( iClassLevel+1 ) / 2;
	}
	
	if ( iProgressionTable == SC_PROG_SKIPFIRST )
	{
		return CSLGetMax( 0, iClassLevel-1);
	}
	
	//forest 1, 2, 3, 5, 6, 7, 9, and 10
	if ( iProgressionTable == SC_PROG_SACRED || iProgressionTable == SC_PROG_FORESTMASTER )
	{
		
		if ( iClassLevel == 1 ) { return  1; } //
		else if ( iClassLevel == 2 ) { return 2; }//
		else if ( iClassLevel == 3 ) { return 3; }//
		else if ( iClassLevel == 4 ) { return 3; }
		else if ( iClassLevel == 5 ) { return 4; }//
		else if ( iClassLevel == 6 ) { return 5; }//
		else if ( iClassLevel == 7 ) { return 6; }//
		else if ( iClassLevel == 8 ) { return 6; }
		else if ( iClassLevel == 9 ) { return 7; }//
		else if ( iClassLevel == 10) { return 8; }//
	}
	
	//swift 2,3,5,6,8, and 9
	if ( iProgressionTable == SC_PROG_SWIFTBLADE )
	{
		if ( iClassLevel == 1 ) { return 0; }
		else if ( iClassLevel == 2 ) { return 1; } //
		else if ( iClassLevel == 3 ) { return 2; } //
		else if ( iClassLevel == 4 ) { return 2; }
		else if ( iClassLevel == 5 ) { return 3; }//
		else if ( iClassLevel == 6 ) { return 4; }//
		else if ( iClassLevel == 7 ) { return 4; }
		else if ( iClassLevel == 8 ) { return 5; }//
		else if ( iClassLevel == 9 ) { return 6; }//
		else if ( iClassLevel == 10) { return 6; }
	}
	

	
	
	//hosp  2, 3, 4, 6, 7, 8, and 10
	if ( iProgressionTable == SC_PROG_HOSPITALER )
	{
		//SendMessageToPC(oCaster,"SC_PROG_HOSPITALER");
		if ( iClassLevel == 1 ) { return 0; }
		else if ( iClassLevel == 2 ) { return 1; }//
		else if ( iClassLevel == 3 ) { return 2; }//
		else if ( iClassLevel == 4 ) { return 3; }//
		else if ( iClassLevel == 5 ) { return 3; }
		else if ( iClassLevel == 6 ) { return 4; }//
		else if ( iClassLevel == 7 ) { return 5; }//
		else if ( iClassLevel == 8 ) { return 6; }//
		else if ( iClassLevel == 9 ) { return 6; }
		else if ( iClassLevel == 10) { return 7; }//
	}
	
	// shdstalker 1, 2, 3, 5, 6, 7, 8, 10  
	if ( iProgressionTable == SC_PROG_SHDSTALKER )
	{
		//SendMessageToPC(oCaster,"SC_PROG_HOSPITALER");
		if ( iClassLevel == 1 ) { return 1; }
		else if ( iClassLevel == 2 ) { return 2; }//
		else if ( iClassLevel == 3 ) { return 3; }//
		else if ( iClassLevel == 4 ) { return 3; }//
		else if ( iClassLevel == 5 ) { return 4; }
		else if ( iClassLevel == 6 ) { return 5; }//
		else if ( iClassLevel == 7 ) { return 6; }//
		else if ( iClassLevel == 8 ) { return 7; }//
		else if ( iClassLevel == 9 ) { return 7; }
		else if ( iClassLevel == 10) { return 8; }//
	}
	
	return 0;
}

/**  
* Gets the Base class a given PRC has been mapped to via a spellcasting progression feat
* @author 0100010
* @param 
* @see 
* @return 
*/
int SCGetBaseClassPRCIsMappedTo(object oPC, int nPRCClassID)
{
	int i = 0;
	for (i = 1; i < 5; i++)
	{
		int nBaseClass = GetClassByPosition(i, oPC);
		if (nBaseClass != nPRCClassID)
		{
			string sFeatMap = CSLGetClassesDataBonusCasterFeatByClassMap(nPRCClassID);
			int nSpellCasterFeat = StringToInt(Get2DAString(sFeatMap, "SpellCasterFeat", nBaseClass));
			if (nSpellCasterFeat > 0 && GetHasFeat(nSpellCasterFeat, oPC))
			{
				return nBaseClass;
			}
		}
	}	
	return CLASS_TYPE_INVALID;		
}


/**  
* Gets the total caster level, accounting for both base classes and PRC's with different progressions
* @private
* @author
* @param 
* @see 
* @return 
*/
int SCPrep_GetCasterLevel( int iClass, object oChar = OBJECT_SELF )
{
	if ( !GetIsObjectValid(oChar) ) { return 0;} // make sure it's only run on a valid object
	
	if ( GetAssociateType(oChar)==ASSOCIATE_TYPE_FAMILIAR )
	{
		oChar = GetMaster( oChar );
	}	
	//int iClass = GetLastSpellCastClass();
	// GetLevelByClass(int nClassType, object oCreature=OBJECT_SELF);
	
	// start with the engine default, and get the parameters initialized
	int iCasterLevel = 0;
	
	int iHD = GetHitDice(oChar);

	if ( iClass == -1 )
	{
		// We have a placeable, or an invalid caster level, just use the vanilla default
		iCasterLevel = GetCasterLevel( oChar );
	}
	//SendMessageToPC( GetFirstPC(), "Working on "+IntToString( iClass ) );
	iCasterLevel = iCasterLevel +  SCPrep_GetSpellLevelsBasedOnClass( iClass, oChar );
	
	string sSpellProgressClass1 = GetLocalString(oChar, "SC_sSpellProgressClass1" );	
	//SendMessageToPC( GetFirstPC(), "Picking up "+CSLNth_GetNthElement( sSpellProgressClass1, 1)+" Using Class Data "+IntToString(GetLocalInt(oChar, "SC_iClass1" ) ) );
	if ( sSpellProgressClass1 != "" && StringToInt( CSLNth_GetNthElement( sSpellProgressClass1, 1) ) == iClass ) 
	{
		iCasterLevel = iCasterLevel + SCPrep_GetSpellLevelsBasedOnClass( GetLocalInt(oChar, "SC_iClass1" ), oChar );
	}
	
	string sSpellProgressClass2 = GetLocalString(oChar, "SC_sSpellProgressClass2" );
	//SendMessageToPC( GetFirstPC(), "Picking up "+CSLNth_GetNthElement( sSpellProgressClass2, 1)+" Using Class Data "+IntToString(GetLocalInt(oChar, "SC_iClass2" ) ) );
	if ( sSpellProgressClass2 != "" && StringToInt( CSLNth_GetNthElement( sSpellProgressClass2, 1) ) == iClass ) 
	{
		iCasterLevel = iCasterLevel + SCPrep_GetSpellLevelsBasedOnClass( GetLocalInt(oChar, "SC_iClass2" ), oChar );
	}
	
	string sSpellProgressClass3 = GetLocalString(oChar, "SC_sSpellProgressClass3" );
	//SendMessageToPC( GetFirstPC(), "Picking up "+CSLNth_GetNthElement( sSpellProgressClass3, 1)+" Using Class Data "+IntToString(GetLocalInt(oChar, "SC_iClass3" ) ) );
	if ( sSpellProgressClass3 != "" && StringToInt( CSLNth_GetNthElement( sSpellProgressClass3, 1) ) == iClass ) 
	{
		iCasterLevel = iCasterLevel + SCPrep_GetSpellLevelsBasedOnClass( GetLocalInt(oChar, "SC_iClass3" ), oChar );
	}
	
	string sSpellProgressClass4 = GetLocalString(oChar, "SC_sSpellProgressClass4" );
	//SendMessageToPC( GetFirstPC(), "Picking up "+CSLNth_GetNthElement( sSpellProgressClass4, 1)+" Using Class Data "+IntToString(GetLocalInt(oChar, "SC_iClass4" ) ) );
	if ( sSpellProgressClass4 != "" && StringToInt( CSLNth_GetNthElement( sSpellProgressClass4, 1) ) == iClass ) 
	{
		iCasterLevel = iCasterLevel + SCPrep_GetSpellLevelsBasedOnClass( GetLocalInt(oChar, "SC_iClass4" ), oChar );
	}
	
	return iCasterLevel;
}

/**  
* Adds in the practiced levels to the character, which allow a caster to get a caster level higher their caster level, but not higher than their hit dice
* @private
* @author
* @param 
* @see 
* @return 
*/
int SCPrep_GetPracticedLevels( int iOrigLevel, int iClass, object oChar = OBJECT_SELF )
{
	if ( !GetIsObjectValid(oChar) ) { return iOrigLevel;} // make sure it's only run on a valid object
	// PRACTICED
	if ( GetAssociateType(oChar)==ASSOCIATE_TYPE_FAMILIAR )
	{
		oChar = GetMaster( oChar );
	}
	
	int bPracticed = FALSE;
	int iPracticedLevels = 0;
	if ( iClass == -1 )
	{
		// We have a placeable, or an invalid caster level, just use the vanilla default
		return iOrigLevel;
	}
	int iPracticedCasterFeat = GetLocalInt(oChar, "SC_sPracticeFeatClass"+IntToString(iClass) );
	if ( iPracticedCasterFeat > 0 && GetHasFeat( iPracticedCasterFeat )  )
	{
		bPracticed = TRUE;
	}
	else if (iClass == CLASS_TYPE_WARLOCK && GetHasFeat( FEAT_PRACTICED_INVOKER ) ) // pseudo spellcasting class
	{
		bPracticed = TRUE;
	}
	else if (iClass == CLASS_TYPE_BLACKGUARD && GetHasFeat( FEAT_PRACTICED_SPELLCASTER_BLACKGUARD ) ) // pseudo spellcasting class
	{
		bPracticed = TRUE;
	}
	else if (iClass == CLASS_TYPE_ASSASSIN && GetHasFeat( FEAT_PRACTICED_SPELLCASTER_ASSASSIN ) ) // pseudo spellcasting class
	{
		bPracticed = TRUE;
	}
	else if (iClass == CLASS_TYPE_AVENGER && GetHasFeat( FEAT_PRACTICED_SPELLCASTER_AVENGER ) ) // pseudo spellcasting class
	{
		bPracticed = TRUE;
	}
	
	if ( bPracticed )
	{
		int nHD = GetHitDice(oChar);
		if ( iOrigLevel < nHD )
		{
			iPracticedLevels = CSLGetMin( nHD-iOrigLevel, 4);
		}
	}
	
	// need to test for exceptions here
	/*
	else if (iClass == CLASS_TYPE_WARLOCK) //int CLASS_TYPE_WARLOCK = 39;
	{
	
	}
	// The following need to be further implemented - don't even have a way of testing yet.
	else if (iClass == CLASS_TYPE_ASSASSIN) //int CLASS_TYPE_ASSASSIN = 30; // repeat as needed, this is just to support adding this feature
	{
	
	}
	else if (iClass == CLASS_TYPE_BLACKGUARD) //int CLASS_TYPE_BLACKGUARD // for allowing Blackguard casting
	{
	
	
	}
	*/
	SetLocalInt(oChar, "SC_sPracticedLevels"+IntToString(iClass), iPracticedLevels );
	
	
	return iOrigLevel+iPracticedLevels;
}

/**  
* Caches the players spellcasting properties onto their character as variables, used to sidestep the official spellcasting system
* @private
* @author
* @param 
* @see 
* @return 
*/
void SCCacheStats( object oChar = OBJECT_SELF, int iForce = FALSE )
{
	if ( !GetIsObjectValid(oChar) ) { return;} // make sure it's only run on a valid object
	
	
	// puts vars on the target describing classes, attributes and the like
	// will only run once, the iForce parameter is designed for level up
	// prepare things for later, need to make sure things jive with the hit dice.
	
	// Moving work to first cast, level up, or the like, make sure all data stored here does not vary by level.
	
	////////////////////////////////
	///      Get the hit Dice    ///
	////////////////////////////////
	int iHD = GetHitDice(oChar);
	
	int nOldHD = GetLocalInt( oChar ,"SC_HitDice");
	
	if ( iHD == nOldHD )
	{
		// we already ran this, don't waste horse power
		return;
	}
	
	////////////////////////////////
	///      Init Variables      ///
	////////////////////////////////
	
	int iNumClasses = 0;
	int iNumCastingClasses = 0;
	
	int iClass1 = 0;
	int iClass2 = 0;
	int iClass3 = 0;
	int iClass4 = 0;
	
	int iClassesBaseClass1 = 0;
	int iClassesBaseClass2 = 0;
	int iClassesBaseClass3 = 0;
	int iClassesBaseClass4 = 0;
	
	int iClassLevel1 = 0;
	int iClassLevel2 = 0;
	int iClassLevel3 = 0;
	int iClassLevel4 = 0;
	
	int iCasterLevel1 = 0;
	int iCasterLevel2 = 0;
	int iCasterLevel3 = 0;
	int iCasterLevel4 = 0;
	
	int iCasterRawLevel1 = 0;
	int iCasterRawLevel2 = 0;
	int iCasterRawLevel3 = 0;
	int iCasterRawLevel4 = 0;
	
	int iSpellPower1 = 0;
	int iSpellPower2 = 0;
	int iSpellPower3 = 0;
	int iSpellPower4 = 0;
	
	int iCurMaxSpellLevel1 = 0;
	int iCurMaxSpellLevel2 = 0;
	int iCurMaxSpellLevel3 = 0;
	int iCurMaxSpellLevel4 = 0;
	
	int iPrimCasterClass1 = 255;
	int iPrimCasterClass2 = 255;
	int iPrimCasterClass3 = 255;
	int iPrimCasterClass4 = 255;
	
	int iPrimCasterType1 = SC_SPELLTYPE_INVALID;
	int iPrimCasterType2 = SC_SPELLTYPE_INVALID;
	int iPrimCasterType3 = SC_SPELLTYPE_INVALID;
	int iPrimCasterType4 = SC_SPELLTYPE_INVALID;

	
	// summary info here, showing highest level in given class
	//int iCastingClasses = 0;
	int iCasterLevels = 0;
	int iArcaneLevels = 0;
	int iDivineLevels = 0;
	int iEldritchLevels = 0;
	int iPsionicLevels = 0;
	
	// the highest class in each category
	int iBestCasterClass = 255;
	int iBestArcaneClass = 255;
	int iBestDivineClass = 255;
	int iBestEldritchClass = 255;
	int iBestPsionicClass = 255;
		
	int iBestCasterMaxSpellLevel = 0;
	int iBestArcaneMaxSpellLevel = 0;
	int iBestDivineMaxSpellLevel = 0;
	int iBestEldritchMaxSpellLevel = 0;
	int iBestPsionicMaxSpellLevel = 0;
	////////////////////////////////
	///      Get the Classes    ///
	////////////////////////////////
	// this function looks at the characters 4 classes, and determines what level in which class
	// first lets look and see if we can fill out the positions
	
	// this function looks at the characters 4 classes, and determines what level in which class
	// first lets look and see if we can fill out the positions
	iClass1 = GetClassByPosition( 1, oChar);
	iClassLevel1 = GetLevelByClass( iClass1, oChar);
	iClass2 = GetClassByPosition( 2, oChar);
	iClassLevel2 = GetLevelByClass( iClass2, oChar);
	iClass3 = GetClassByPosition( 3, oChar);
	iClassLevel3 = GetLevelByClass( iClass3, oChar);
	iClass4 = GetClassByPosition( 4, oChar);
	iClassLevel4 = GetLevelByClass( iClass4, oChar);
	

	/////////////////////////////////////////
	/// Figure out the number of classes ///
	////////////////////////////////////////
	if ( iClass4 < 255 ) { iNumClasses = 4; }
	else if ( iClass3 < 255 ) { iNumClasses = 3; }
	else if ( iClass2 < 255 ) { iNumClasses = 2; }
	else if ( iClass1 < 255 ) { iNumClasses = 1; }
	
	SetLocalInt(oChar, "SC_HitDice", iHD);
	
	SetLocalInt(oChar, "SC_NumClasses", iNumClasses );
	
	SetLocalInt(oChar, "SC_NumCastingBaseClasses", iNumCastingClasses );

	SetLocalInt(oChar, "SC_iClass1", iClass1 );
	SetLocalInt(oChar, "SC_iClass2", iClass2 );
	SetLocalInt(oChar, "SC_iClass3", iClass3 );
	SetLocalInt(oChar, "SC_iClass4", iClass4 );
	
	
	////////////////////////////////////////
	/// Figure out the Progression Feats ///
	////////////////////////////////////////
	// need to figure this out so it works and removes need for lookup tables
	int h = 0;
	int i = 0;
	string sCurrent;
	
	string sSpellProgressClass1;
	string sSpellProgressClass2;
	string sSpellProgressClass3;
	string sSpellProgressClass4;
	int iPracticedCasterFeat;
	
	for (h = 1; h <= iNumClasses; h++)
	{
		
		int iMainCurClass = 255;
		int nSpellCasterFeat;
		switch ( h )
		{
			case 1:
				iMainCurClass = iClass1;
				break;
			case 2:
				iMainCurClass = iClass2;
				break;
			case 3:
				iMainCurClass = iClass3;
				break;
			case 4:
				iMainCurClass = iClass4;
				break;
		}
		
		iPracticedCasterFeat = CSLGetClassesDataFEATPracticedSpellcaster(iMainCurClass);
		if ( iPracticedCasterFeat > 0 ) { SetLocalInt(oChar, "SC_sPracticeFeatClass"+IntToString(iMainCurClass), iPracticedCasterFeat );  }
		
		string sFeatMap = Get2DAString("classes", "BonusCasterFeatByClassMap", iMainCurClass );
		
		
		if ( sFeatMap != "" )
		{
			//SendMessageToPC(GetFirstPC(),"Using Feat map "+sFeatMap);
			sCurrent = "";
			for (i = 1; i <= iNumClasses; i++)
			{
				switch ( i )
				{
					case 1: // will logically never happen but this won't affect anything ( will skip it entirely each time )
						nSpellCasterFeat = StringToInt(Get2DAString(sFeatMap, "SpellCasterFeat", iClass1));
						//SendMessageToPC(GetFirstPC(),"Getting Feat "+IntToString(nSpellCasterFeat)+" for Class "+IntToString( iClass1 ) );
						if (nSpellCasterFeat > 0 && GetHasFeat(nSpellCasterFeat, oChar))
						{
							sCurrent = CSLNth_Push( sCurrent, IntToString( iClass1 ) );
							//SendMessageToPC(GetFirstPC(),"Which Applies to "+IntToString(iClass1 ) );
						}
						break;
					case 2:
						nSpellCasterFeat = StringToInt(Get2DAString(sFeatMap, "SpellCasterFeat", iClass2));
						//SendMessageToPC(GetFirstPC(),"Getting Feat "+IntToString(nSpellCasterFeat)+" for Class "+IntToString( iClass2 ) );
						if (nSpellCasterFeat > 0 && GetHasFeat(nSpellCasterFeat, oChar))
						{
							sCurrent = CSLNth_Push( sCurrent, IntToString( iClass2 ) );
							//SendMessageToPC(GetFirstPC(),"Which Applies to "+IntToString(iClass2 ) );
						}
						break;
					case 3:
						nSpellCasterFeat = StringToInt(Get2DAString(sFeatMap, "SpellCasterFeat", iClass3));
						//SendMessageToPC(GetFirstPC(),"Getting Feat "+IntToString(nSpellCasterFeat)+" for Class "+IntToString( iClass3 ) );
						if (nSpellCasterFeat > 0 && GetHasFeat(nSpellCasterFeat, oChar))
						{
							sCurrent = CSLNth_Push( sCurrent, IntToString( iClass3 ) );
							//SendMessageToPC(GetFirstPC(),"Which Applies to "+IntToString(iClass3 ) );
						}
						break;
					case 4:
						nSpellCasterFeat = StringToInt(Get2DAString(sFeatMap, "SpellCasterFeat", iClass4));
						//SendMessageToPC(GetFirstPC(),"Getting Feat "+IntToString(nSpellCasterFeat)+" for Class "+IntToString( iClass4 ) );
						if (nSpellCasterFeat > 0 && GetHasFeat(nSpellCasterFeat, oChar))
						{
							sCurrent = CSLNth_Push( sCurrent, IntToString( iClass4 ) );
							//SendMessageToPC(GetFirstPC(),"Which Applies to "+IntToString(iClass4 ) );
						}
						break;
				}
				
		switch ( h )
		{
			case 1:
				SetLocalString(oChar, "SC_sSpellProgressClass1", sCurrent );
				//SendMessageToPC(GetFirstPC(),sCurrent+" Which Applies to "+IntToString( iClass1 ) );
				break;
			case 2:
				SetLocalString(oChar, "SC_sSpellProgressClass2", sCurrent );
				//SendMessageToPC(GetFirstPC(),sCurrent+" Which Applies to "+IntToString( iClass1 ) );
				break;
			case 3:
				SetLocalString(oChar, "SC_sSpellProgressClass3", sCurrent );
				//SendMessageToPC(GetFirstPC(),sCurrent+" Which Applies to "+IntToString( iClass1 ) );
				break;
			case 4:
				SetLocalString(oChar, "SC_sSpellProgressClass4", sCurrent );
				//SendMessageToPC(GetFirstPC(),sCurrent+" Which Applies to "+IntToString( iClass1 ) );
				break;
		}
				/*
							SendMessageToPC(GetFirstPC(),"Which Applies to "+sSpellProgressClass1);
				
				sSpellProgressClass2 = CSLNth_Push( sSpellProgressClass2, IntToString( iMainCurClass ) );
							SetLocalString(oChar, "SC_sSpellProgressClass2", sSpellProgressClass2 );
							SendMessageToPC(GetFirstPC(),"Which Applies to "+sSpellProgressClass2);
							
							sSpellProgressClass3 = CSLNth_Push( sSpellProgressClass3, IntToString( iMainCurClass ) );
							SetLocalString(oChar, "SC_sSpellProgressClass3", sSpellProgressClass3 );
							SendMessageToPC(GetFirstPC(),"Which Applies to "+sSpellProgressClass3);
							
							sSpellProgressClass4 = CSLNth_Push( sSpellProgressClass4, IntToString( iMainCurClass ) );
							SetLocalString(oChar, "SC_sSpellProgressClass4", sSpellProgressClass4 );
							SendMessageToPC(GetFirstPC(),"Which Applies to "+sSpellProgressClass4);
				*/
			}
		}
	}
	
	
	
	/////////////////////////////////////
	/// Figure out the caster classes ///
	/////////////////////////////////////
	int j = 0;
	
	for (j = 1; j <= iNumClasses; j++)
	{
		int iCurCasterType = -1;
		int iCurClass = 255;
		int iCurCasterLevel = 0;
		int iRawCasterLevel = 0;
		int iCurMaxSpellLevel = 0;
		int iCurSpellPower = 0;
		
		switch ( j )
		{
			case 1:
				iCurClass = iClass1;
				break;
			case 2:
				iCurClass = iClass2;
				break;
			case 3:
				iCurClass = iClass3;
				break;
			case 4:
				iCurClass = iClass4;
				break;
		}
		
		iCurCasterType = CSLGetBaseCasterType( iCurClass  );
		//iCurCasterLevel = 0;
		
		if ( iCurCasterType > 0 )
		{
			iRawCasterLevel = SCPrep_GetCasterLevel( iCurClass, oChar );
			iCurCasterLevel = SCPrep_GetPracticedLevels( iRawCasterLevel, iCurClass, oChar );
			
			iCurMaxSpellLevel = CSLMaxSpellLevelByClass( iCurClass, iRawCasterLevel ); // CSLMaxSpellLevel( iCurClass, iRawCasterLevel, oChar );
			iCurSpellPower = iCurCasterLevel;
			
			if ( iBestCasterMaxSpellLevel < iCurMaxSpellLevel )
			{
				iBestCasterMaxSpellLevel = iCurMaxSpellLevel;
			}
			
			
			
			if ( iCasterLevels < iCurCasterLevel ) // this will prefer those picked first if same amount
			{
				iBestCasterClass = iCurClass;
				iCasterLevels = iCurCasterLevel;
			}
			
			// get specific types of data per class
			if ( iCurCasterType == SC_SPELLTYPE_ARCANE  )
			{
				if ( iArcaneLevels < iCurCasterLevel )
				{
					iBestArcaneClass = iCurClass;
					iArcaneLevels = iCurCasterLevel;
				}
				if ( iBestArcaneMaxSpellLevel < iCurMaxSpellLevel )
				{
					iBestArcaneMaxSpellLevel = iCurMaxSpellLevel;
				}
			}
			else if ( iCurCasterType == SC_SPELLTYPE_DIVINE )
			{
				if ( iDivineLevels < iCurCasterLevel )
				{
					iBestDivineClass = iCurClass;
					iDivineLevels = iCurCasterLevel;
				}
				if ( iBestDivineMaxSpellLevel < iCurMaxSpellLevel )
				{
					iBestDivineMaxSpellLevel = iCurMaxSpellLevel;
				}
			}
			else if ( iCurCasterType == SC_SPELLTYPE_ELDRITCH )
			{
				if ( iEldritchLevels < iCurCasterLevel )
				{
					iBestEldritchClass = iCurClass;
					iEldritchLevels = iCurCasterLevel;
				}
				if ( iBestEldritchMaxSpellLevel < iCurMaxSpellLevel )
				{
					iBestEldritchMaxSpellLevel = iCurMaxSpellLevel;
				}
			}
			else if ( iCurCasterType == SC_SPELLTYPE_PSIONIC )
			{
				if ( iPsionicLevels < iCurCasterLevel )
				{
					iBestPsionicClass = iCurClass;
					iPsionicLevels = iCurCasterLevel;
				}
				if ( iBestPsionicMaxSpellLevel < iCurMaxSpellLevel )
				{
					iBestPsionicMaxSpellLevel = iCurMaxSpellLevel;
				}
			}
			
			iNumCastingClasses++;
			
		}
		else
		{
			iCurCasterLevel = 0;
			iCurCasterType = -1;
			iCurMaxSpellLevel = 0;
		}
		
		
		//if (DEBUGGING >= 6) { CSLDebug(  "Prep Level Class  " + IntToString( iCurClass ) + " Level is " + IntToString( iCurCasterLevel )+ " Max Spell Level is " + IntToString( iCurMaxSpellLevel ), oChar ); }
		
		// now save it to correct one
		switch ( j )
		{
			case 1:
				iCasterLevel1 = iCurCasterLevel;
				iCasterRawLevel4 = iRawCasterLevel;
				iPrimCasterType1 = iCurCasterType;
				iCurMaxSpellLevel1 = iCurMaxSpellLevel;
				iSpellPower1 = iCurSpellPower;
				break;
			case 2:
				iCasterLevel2 = iCurCasterLevel;
				iCasterRawLevel4 = iRawCasterLevel;
				iPrimCasterType2 = iCurCasterType;
				iCurMaxSpellLevel2 = iCurMaxSpellLevel;
				iSpellPower2 = iCurSpellPower;
				break;
			case 3:
				iCasterLevel3 = iCurCasterLevel;
				iCasterRawLevel4 = iRawCasterLevel;
				iPrimCasterType3 = iCurCasterType;
				iCurMaxSpellLevel3 = iCurMaxSpellLevel;
				iSpellPower3 = iCurSpellPower;
				break;
			case 4:
				iCasterLevel4 = iCurCasterLevel;
				iCasterRawLevel4 = iRawCasterLevel;
				iPrimCasterType4 = iCurCasterType;
				iCurMaxSpellLevel4 = iCurMaxSpellLevel;
				iSpellPower4 = iCurSpellPower;
				break;
		}
	
	}
	
	/////////////////////////////////////
	///   Store the Values for later  ///
	/////////////////////////////////////
	
	
	// for a cross reference when we only know the class
	SetLocalInt(oChar, "SC_Row"+IntToString(iClass1), 1 );
	SetLocalInt(oChar, "SC_Row"+IntToString(iClass2), 2 );
	SetLocalInt(oChar, "SC_Row"+IntToString(iClass3), 3 );
	SetLocalInt(oChar, "SC_Row"+IntToString(iClass4), 4 );
	
	SetLocalInt(oChar, "SC_iClassLevel1", iClassLevel1 );
	SetLocalInt(oChar, "SC_iClassLevel2", iClassLevel2 );
	SetLocalInt(oChar, "SC_iClassLevel3", iClassLevel3 );
	SetLocalInt(oChar, "SC_iClassLevel4", iClassLevel4 );
	
	SetLocalInt(oChar, "SC_iSpellPower1", iSpellPower1 );
	SetLocalInt(oChar, "SC_iSpellPower2", iSpellPower2 );
	SetLocalInt(oChar, "SC_iSpellPower3", iSpellPower3 );
	SetLocalInt(oChar, "SC_iSpellPower4", iSpellPower4 );
	
	
	// summary info here, showing highest level in given class
	//SetLocalInt(oChar, "SC_iCastingClasses",  iCastingClasses );
	SetLocalInt(oChar, "SC_iCasterLevels",  iCasterLevels );
	SetLocalInt(oChar, "SC_iArcaneLevels",  iArcaneLevels );
	SetLocalInt(oChar, "SC_iDivineLevels",  iDivineLevels );
	SetLocalInt(oChar, "SC_iEldritchLevels",  iEldritchLevels );
	SetLocalInt(oChar, "SC_iPsionicLevels",  iPsionicLevels );
	
	
	// the highest spellcasting level in each category
	SetLocalInt(oChar, "SC_iBestCasterMaxSpellLevel",  iBestCasterMaxSpellLevel );
	SetLocalInt(oChar, "SC_iBestArcaneMaxSpellLevel",iBestArcaneMaxSpellLevel );
	SetLocalInt(oChar, "SC_iBestDivineMaxSpellLevel",iBestDivineMaxSpellLevel );
	SetLocalInt(oChar, "SC_iBestEldritchMaxSpellLevel",iBestEldritchMaxSpellLevel );
	SetLocalInt(oChar, "SC_iBestPsionicMaxSpellLevel",iBestPsionicMaxSpellLevel );
	
	// the highest class in each category
	SetLocalInt(oChar, "SC_iBestCasterClass",  iBestCasterClass );
	SetLocalInt(oChar, "SC_iBestArcaneClass",  iBestArcaneClass );
	SetLocalInt(oChar, "SC_iBestDivineClass",  iBestDivineClass );
	SetLocalInt(oChar, "SC_iBestEldritchClass",  iBestEldritchClass );
	SetLocalInt(oChar, "SC_iBestPsionicClass",  iBestPsionicClass );
	
	// not sure if i need to do this, but it should help
	SetLocalString(oChar, "SC_sClassName1", CSLGetClassesDataName( iClass1 ) );
	SetLocalString(oChar, "SC_sClassName2", CSLGetClassesDataName( iClass2 ) );
	SetLocalString(oChar, "SC_sClassName3", CSLGetClassesDataName( iClass3 ) );
	SetLocalString(oChar, "SC_sClassName4", CSLGetClassesDataName( iClass4 ) );

	SetLocalInt(oChar, "SC_iCasterLevel1", iCasterLevel1 );
	SetLocalInt(oChar, "SC_iCasterLevel2", iCasterLevel2 );
	SetLocalInt(oChar, "SC_iCasterLevel3", iCasterLevel3 );
	SetLocalInt(oChar, "SC_iCasterLevel4", iCasterLevel4 );
	
		
	SetLocalInt(oChar, "SC_iCurMaxSpellLevel1", iCurMaxSpellLevel1 );
	SetLocalInt(oChar, "SC_iCurMaxSpellLevel2", iCurMaxSpellLevel2 );
	SetLocalInt(oChar, "SC_iCurMaxSpellLevel3", iCurMaxSpellLevel3 );
	SetLocalInt(oChar, "SC_iCurMaxSpellLevel4", iCurMaxSpellLevel4 );
	
	
	SetLocalInt(oChar, "SC_iPrimCasterType1", iPrimCasterType1 );
	SetLocalInt(oChar, "SC_iPrimCasterType2", iPrimCasterType2 );
	SetLocalInt(oChar, "SC_iPrimCasterType3", iPrimCasterType3 );
	SetLocalInt(oChar, "SC_iPrimCasterType4", iPrimCasterType4 );
	
	// SetLocalInt(oChar, "SC_iSpellSchool", 98 );
	
	
	///SetLocalInt(oChar, "SC_iSpellSchool", GetCasterClassSpellSchool( oChar, CLASS_TYPE_WIZARD ) );
	
	
	// Now finished, lets get attributes for hard to get data from the client GUI
	if ( GetIsPC( oChar ) && GetLevelByClass( CLASS_TYPE_WIZARD, oChar ) > 0 )
	{
		//if ( GetLocalInt( oChar, "SC_TESTER" ) )
		//{
		//	SpeakString( "About to Run Script");
		//}
		DisplayGuiScreen(oChar, SCREEN_CHARACTERDATA, FALSE, XML_CHARACTERDATA);
	}
	/*
	else
	{
		//if ( GetLocalInt( oChar, "SC_TESTER" ) )
		//{
		//	SpeakString( "Not to Run Script");
		//}
		SetLocalInt(oChar, "SC_iSpellSchool", -1 );
	}
	*/
}

/**  
* Summarizes cached system stats as a string, it will make sure any caching is up to date, useful in debugging or DM inspection
* @author
* @param 
* @see 
* @return 
*/
string SCCacheStatsToString( object oChar  )
{
	if ( !GetIsObjectValid(oChar) ) { return "";} // make sure it's only run on a valid object
	
	if ( GetAssociateType(oChar)==ASSOCIATE_TYPE_FAMILIAR )
	{
		oChar = GetMaster( oChar );
	}
	
	// changing iMsgLevel is for when we want to show this to snooping DM's as well as a later feature...
	// Probably going to consider making this just return a string soas to allow the messages
	// Need to determine which other information is useful when this is run - current stats, hps, spell resistance, ac, ab, and saves
	// perhaps also some code to check what spells and buffs are present on the character for the aforementioned dm's looking at the player
	
	SCCacheStats( oChar );
	// lists stored character information on a player for debugging
	int iHD = GetLocalInt(oChar, "SC_HitDice" );
	
	int iNumClasses = GetLocalInt(oChar, "SC_NumClasses" );
	
	int iNumCastingClasses = GetLocalInt(oChar, "SC_NumCastingBaseClasses" );

	int iClass1 = GetLocalInt(oChar, "SC_iClass1" );
	int iClass2 = GetLocalInt(oChar, "SC_iClass2" );
	int iClass3 = GetLocalInt(oChar, "SC_iClass3" );
	int iClass4 = GetLocalInt(oChar, "SC_iClass4" );
	
	int iClassLevel1 = GetLocalInt(oChar, "SC_iClassLevel1" );
	int iClassLevel2 = GetLocalInt(oChar, "SC_iClassLevel2" );
	int iClassLevel3 = GetLocalInt(oChar, "SC_iClassLevel3" );
	int iClassLevel4 = GetLocalInt(oChar, "SC_iClassLevel4" );

	int iSpellPower1 = GetLocalInt(oChar, "SC_iSpellPower1" );
	int iSpellPower2 = GetLocalInt(oChar, "SC_iSpellPower2" );
	int iSpellPower3 = GetLocalInt(oChar, "SC_iSpellPower3" );
	int iSpellPower4 = GetLocalInt(oChar, "SC_iSpellPower4" );
		
	// summary info here, showing highest level in given class
	//int iCastingClass = GetLocalInt(oChar, "SC_iCastingClasses" ); need to get rid of this
	int iCasterLevels = GetLocalInt(oChar, "SC_iCasterLevels" );
	int iArcaneLevels = GetLocalInt(oChar, "SC_iArcaneLevels" );
	int iDivineLevels = GetLocalInt(oChar, "SC_iDivineLevels" );
	int iEldritchLevels = GetLocalInt(oChar, "SC_iEldritchLevels" );
	int iPsionicLevels = GetLocalInt(oChar, "SC_iPsionicLevels" );
	
	// the highest class in each category
	int iBestCasterClass = GetLocalInt(oChar, "SC_iBestCasterClass" );
	int iBestArcaneClass = GetLocalInt(oChar, "SC_iBestArcaneClass" );
	int iBestDivineClass = GetLocalInt(oChar, "SC_iBestDivineClass" );
	int iBestEldritchClass = GetLocalInt(oChar, "SC_iBestEldritchClass" );
	int iBestPsionicClass = GetLocalInt(oChar, "SC_iBestPsionicClass" );
	
	// not sure if i need to do this, but it should help
	string sClassName1 = GetLocalString(oChar, "SC_sClassName1" );
	string sClassName2 = GetLocalString(oChar, "SC_sClassName2" );
	string sClassName3 = GetLocalString(oChar, "SC_sClassName3" );
	string sClassName4 = GetLocalString(oChar, "SC_sClassName4" );

	int iCasterLevel1 = GetLocalInt(oChar, "SC_iCasterLevel1" );
	int iCasterLevel2 = GetLocalInt(oChar, "SC_iCasterLevel2" );
	int iCasterLevel3 = GetLocalInt(oChar, "SC_iCasterLevel3" );
	int iCasterLevel4 = GetLocalInt(oChar, "SC_iCasterLevel4" );
	
	int iCurMaxSpellLevel1 = GetLocalInt(oChar, "SC_iCurMaxSpellLevel1" );
	int iCurMaxSpellLevel2 = GetLocalInt(oChar, "SC_iCurMaxSpellLevel2" );
	int iCurMaxSpellLevel3 = GetLocalInt(oChar, "SC_iCurMaxSpellLevel3" );
	int iCurMaxSpellLevel4 = GetLocalInt(oChar, "SC_iCurMaxSpellLevel4" );
	
	
	int iPrimCasterType1 = GetLocalInt(oChar, "SC_iPrimCasterType1" );
	int iPrimCasterType2 = GetLocalInt(oChar, "SC_iPrimCasterType2" );
	int iPrimCasterType3 = GetLocalInt(oChar, "SC_iPrimCasterType3" );
	int iPrimCasterType4 = GetLocalInt(oChar, "SC_iPrimCasterType4" );
	
	int iPracticedCasterFeat1 = GetLocalInt(oChar, "SC_sPracticeFeatClass"+IntToString(iClass1) );
	int iPracticedCasterFeat2 = GetLocalInt(oChar, "SC_sPracticeFeatClass"+IntToString(iClass2) );
	int iPracticedCasterFeat3 = GetLocalInt(oChar, "SC_sPracticeFeatClass"+IntToString(iClass3) );
	int iPracticedCasterFeat4 = GetLocalInt(oChar, "SC_sPracticeFeatClass"+IntToString(iClass4) );
	
	string sSpellProgressClass1 = GetLocalString(oChar, "SC_sSpellProgressClass1" );
	string sSpellProgressClass2 = GetLocalString(oChar, "SC_sSpellProgressClass2" );
	string sSpellProgressClass3 = GetLocalString(oChar, "SC_sSpellProgressClass3" );
	string sSpellProgressClass4 = GetLocalString(oChar, "SC_sSpellProgressClass4" );
	
	int iBestCasterMaxSpellLevel = GetLocalInt(oChar, "SC_iBestCasterMaxSpellLevel" );
	int iBestArcaneMaxSpellLevel = GetLocalInt(oChar, "SC_iBestArcaneMaxSpellLevel" );
	int iBestDivineMaxSpellLevel = GetLocalInt(oChar, "SC_iBestDivineMaxSpellLevel" );
	int iBestEldritchMaxSpellLevel = GetLocalInt(oChar, "SC_iBestEldritchMaxSpellLevel" );
	int iBestPsionicMaxSpellLevel = GetLocalInt(oChar, "SC_iBestPsionicMaxSpellLevel" );
	
	int iSpellSchool = GetLocalInt(oChar, "SC_iSpellSchool" );
	string sMessage = "";

	sMessage += " Character Information HD:" + IntToString(iHD) + " No Classes:" + IntToString(iNumClasses) + " No Caster Classes:" + IntToString(iNumCastingClasses);
	sMessage += "\n\n<b>Class Information:</b>\n";
	if ( iClass1 != 255 )
	{
		sMessage += "\nClass: " + sClassName1 + "\n";
		sMessage += "  2da Row: " + IntToString( iClass1 ) + "\n";
		sMessage += "  Level: " + IntToString( iClassLevel1 ) + "\n";
		if ( iPrimCasterType1 > 0 )
		{
			sMessage += "  Caster Level: " + IntToString( iCasterLevel1 ) + "\n";
			sMessage += "  Spell Power: " + IntToString( iSpellPower1 ) + "\n";
			sMessage += "  Max Spell: " + IntToString( iCurMaxSpellLevel1 ) + "\n";
			sMessage += "  Type: " + CSLGetBaseCasterTypeDescription( iPrimCasterType1 ) + "\n";
		}
		if ( sSpellProgressClass1 != "" )
		{
			sMessage += "  Boosts: " + CSLGetClassesDataName( StringToInt( sSpellProgressClass1 ) )+ "\n";
		}
		if ( iPracticedCasterFeat1 > 0 )
		{
			if ( GetHasFeat( iPracticedCasterFeat1, oChar ) )
			{
				sMessage += "  Practiced: Has " + IntToString( iPracticedCasterFeat1 )+ "\n";
			}
			else
			{
				sMessage += "  Practiced: Not Taken " + IntToString( iPracticedCasterFeat1 )+ "\n";
			}
		}
	}
	if ( iClass2 != 255 )
	{
		sMessage += "\nClass: " + sClassName2 + "\n";
		sMessage += "  2da Row: " + IntToString( iClass2 ) + "\n";
		sMessage += "  Level: " + IntToString( iClassLevel2 ) + "\n";
		if ( iPrimCasterType2 > 0 )
		{
			sMessage += "  Caster Level: " + IntToString( iCasterLevel2 ) + "\n";
			sMessage += "  Spell Power: " + IntToString( iSpellPower2 ) + "\n";
			sMessage += "  Max Spell: " + IntToString( iCurMaxSpellLevel2 ) + "\n";
			sMessage += "  Type: " + CSLGetBaseCasterTypeDescription( iPrimCasterType2 )+ "\n";
		}
		if ( sSpellProgressClass2 != "" )
		{
			sMessage += "  Boosts: " + CSLGetClassesDataName( StringToInt( sSpellProgressClass2 ))+ "\n";
		}
		if ( iPracticedCasterFeat2 > 0 )
		{
			if ( GetHasFeat( iPracticedCasterFeat2, oChar ) )
			{
				sMessage += "  Practiced: Has " + IntToString( iPracticedCasterFeat2 )+ "\n";
			}
			else
			{
				sMessage += "  Practiced: Not Taken " + IntToString( iPracticedCasterFeat2 )+ "\n";
			}
		}
	}
	if ( iClass3 != 255 )
	{
		sMessage += "\nClass: " + sClassName3 + "\n";
		sMessage += "  2da Row: " + IntToString( iClass3 ) + "\n";
		sMessage += "  Level: " + IntToString( iClassLevel3 ) + "\n";
		if ( iPrimCasterType3 > 0 )
		{
			sMessage += "  Caster Level: " + IntToString( iCasterLevel3 ) + "\n";
			sMessage += "  Spell Power: " + IntToString( iSpellPower3 ) + "\n";
			sMessage += "  Max Spell: " + IntToString( iCurMaxSpellLevel3 ) + "\n";
			sMessage += "  Type: " + CSLGetBaseCasterTypeDescription( iPrimCasterType3 )+ "\n";
		}
		if ( sSpellProgressClass3 != "" )
		{
			sMessage += "  Boosts: " + CSLGetClassesDataName( StringToInt( sSpellProgressClass3 ) )+ "\n";
		}
		if ( iPracticedCasterFeat3 > 0 )
		{
			if ( GetHasFeat( iPracticedCasterFeat3, oChar ) )
			{
				sMessage += "  Practiced: Has " + IntToString( iPracticedCasterFeat3 )+ "\n";
			}
			else
			{
				sMessage += "  Practiced: Not Taken " + IntToString( iPracticedCasterFeat3 )+ "\n";
			}
		}
	}
	if ( iClass4 != 255 )
	{
		sMessage += "\nClass: " + sClassName4 + "\n";
		sMessage += "  2da Row: " + IntToString( iClass4 ) + "\n";
		sMessage += "  Level: " + IntToString( iClassLevel4 ) + "\n";
		if ( iPrimCasterType4 > 0 )
		{
			sMessage += "  Caster Level: " + IntToString( iCasterLevel4 ) + "\n";
			sMessage += "  Spell Power: " + IntToString( iSpellPower4 ) + "\n";
			sMessage += "  MaxSpellLevel: " + IntToString( iCurMaxSpellLevel4 ) + "\n";
			sMessage += "  Type: " + CSLGetBaseCasterTypeDescription( iPrimCasterType4 )+ "\n";
		}
		if ( sSpellProgressClass4 != "" )
		{
			sMessage += "  Boosts: " + CSLGetClassesDataName( StringToInt( sSpellProgressClass4 ) )+ "\n";
		}
		if ( iPracticedCasterFeat4 > 0 )
		{
			if ( GetHasFeat( iPracticedCasterFeat4, oChar ) )
			{
				sMessage += "  Practiced: Has " + IntToString( iPracticedCasterFeat4 )+ "\n";
			}
			else
			{
				sMessage += "  Practiced: Not Taken " + IntToString( iPracticedCasterFeat4 )+ "\n";
			}
		}
	}

	 sMessage += "\n";
	if ( iCasterLevels > 0 ){ sMessage += "\nCaster: " + CSLGetClassesDataName( iBestCasterClass )  + " Levels: " + IntToString( iCasterLevels )+ " Max Spell: " + IntToString( iBestCasterMaxSpellLevel );}
	if ( iArcaneLevels > 0 ){ sMessage += "\nArcane: " + CSLGetClassesDataName( iBestArcaneClass ) + " Levels: " + IntToString( iArcaneLevels )+ " Max Spell: " + IntToString( iBestArcaneMaxSpellLevel );}
	if ( iDivineLevels > 0 ){ sMessage += "\nDivine: " + CSLGetClassesDataName( iBestDivineClass ) + " Levels: " + IntToString( iDivineLevels )+ " Max Spell: " + IntToString( iBestDivineMaxSpellLevel );}
	if ( iEldritchLevels > 0 ){ sMessage += "\nEldritch: " + CSLGetClassesDataName( iBestEldritchClass ) + " Levels: " + IntToString( iEldritchLevels )+ " Max Spell: " + IntToString( iBestEldritchMaxSpellLevel );}
	if ( iPsionicLevels > 0 ){ sMessage += "\nPsionic: " + CSLGetClassesDataName( iBestPsionicClass ) + " Levels: " + IntToString( iPsionicLevels )+ " Max Spell: " + IntToString( iBestPsionicMaxSpellLevel );}
	
	if ( iSpellSchool > -1 ){ sMessage += "\nSchool: " + IntToString( iSpellSchool );}
	
	return sMessage;
}


/**  
* Internal function that Gets the correct row in the cache for the provided class, opposite of getclassbyposition
* @private
* @author
* @param 
* @see 
* @replaces SCPrep_GetClassRowFromCache, HkGetClassRowFromCache
* @return row the class is using in the cache
*/
int SCPrep_GetClassRowFromCache( object oChar, int iClass )
{
	if ( !GetIsObjectValid(oChar) ) { return 0;} // make sure it's only run on a valid object
	
	//if ( GetAssociateType(oChar)==ASSOCIATE_TYPE_FAMILIAR )
	//{
	//	oChar = GetMaster( oChar );
	//}
	
	//SendMessageToPC( OBJECT_SELF, GetName(oChar)+" with Class: "+IntToString( iClass )+ " with stored class row of " +IntToString( GetLocalInt(oChar, "SC_Row"+IntToString(iClass) ) ) );
	// assuming we alread have the vars set up on the character
	// this should not be called by inside functions
	if ( iClass == 255 )
	{
		return 0;
	}
	return GetLocalInt(oChar, "SC_Row"+IntToString(iClass) );
}