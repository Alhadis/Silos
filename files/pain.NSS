string CSLVarIndex_Prefix( int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	switch(iType)
	{
		case CSLDATAARRAY_TYPE_INTEGER: 
			return "CSLVARINDEX_I_";
			break;
		case CSLDATAARRAY_TYPE_FLOAT: 
			return "CSLVARINDEX_F_";
			break;
		case CSLDATAARRAY_TYPE_STRING: 
			return "CSLVARINDEX_S_";
			break;
		case CSLDATAARRAY_TYPE_OBJECT: 
			return "CSLVARINDEX_O_";
			break;
		case CSLDATAARRAY_TYPE_LOCATION: 
			return "CSLVARINDEX_L_";
			break;
	}
	return "CSLVARINDEX_X_"; // invalid
}


int CSLVarIndex_Count( object oObject, int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	return GetLocalInt(oObject, CSLVarIndex_Prefix( iType )+"COUNT");
}


string CSLVarIndex_VarNameByIndex( object oObject, int iIndex, int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	int iCount = CSLVarIndex_Count(oObject,iType );
	if ( iIndex <= iCount )
	{
		return GetLocalString( oObject, CSLVarIndex_Prefix( iType )+IntToString( iIndex ) );
	}
	return "";
}


// this is for working with random pieces of data, initially designed for integers only
// this is one based, 1 to whatever ( 0 does not exist )
void CSLVarIndex_Register( object oObject, string sVariableName, int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	string sPrefix = CSLVarIndex_Prefix( iType );
	
	int iFound = FindSubString( sVariableName, GetLocalString(oObject, sPrefix+"REGISTERED" ) );
	if ( iFound == -1 )
	{
		int iCount = CSLVarIndex_Count(oObject,iType )+1;
		string sList = CSLNth_Push( GetLocalString(oObject, sPrefix+"REGISTERED"), sVariableName );
		SetLocalString(oObject, sPrefix+"REGISTERED", sList);
		
		SetLocalString( oObject, sPrefix+IntToString(iCount), sVariableName );	
		
		SetLocalInt(oObject, sPrefix+"COUNT", iCount );
	}
}


void CSLVarIndex_UnRegister( object oObject, string sVariableName, int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	string sPrefix = CSLVarIndex_Prefix( iType );
	string sList = GetLocalString(oObject, sPrefix+"REGISTERED" );
	int iFound = FindSubString( sVariableName, sList );
	
	
	if ( iFound != -1 )
	{
		int iCount = CSLVarIndex_Count(oObject,iType );
		int bFound = FALSE;
		int iCurrent;
		for( iCurrent = 1; iCurrent <= iCount; iCurrent++)
		{
			if ( bFound || CSLVarIndex_VarNameByIndex( oObject, iCurrent, iType ) == sVariableName )
			{
				SetLocalString( oObject, "CSLVARINDEX_I_"+IntToString( iCurrent ), "CSLVARINDEX_I_"+IntToString( iCurrent+1 ) );
				bFound == TRUE;
			}
		}
		
		int iOccurance = CSLNth_Find( sList, sVariableName );
		if ( iOccurance > 0 )
		{
			sList = CSLNth_RemoveElement(sList, iOccurance );
			SetLocalString(oObject, sPrefix+"REGISTERED", sList);
		}
		SetLocalInt(oObject, sPrefix+"COUNT", iCount-1 );
	}
}



// returns true if 2 values need to be swapped
int CSLVarIndex_Compare( object oObject, int iIndex1, int iIndex2, int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	int iCount = CSLVarIndex_Count(oObject,iType );
	if ( iIndex2 > iCount ||  iIndex2 <= iIndex1 )
	{
		return FALSE;
	}
	
	string sPrefix = CSLVarIndex_Prefix( iType );
	
	string sPreviousVar = sPrefix+IntToString( iIndex1 );
	string sCurrentVar = sPrefix+IntToString( iIndex2 );
	
	
	
	if ( iType == CSLDATAARRAY_TYPE_INTEGER )
	{
		int iPrevious = GetLocalInt( oObject, GetLocalString( oObject, sPreviousVar ) );
		int iCurrent = GetLocalInt( oObject, GetLocalString( oObject, sCurrentVar ) );
		if ( iPrevious < iCurrent )
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	else if ( iType == CSLDATAARRAY_TYPE_FLOAT )
	{ 
		float fPrevious = GetLocalFloat( oObject, GetLocalString( oObject, sPreviousVar ) );
		float fCurrent = GetLocalFloat( oObject, GetLocalString( oObject, sCurrentVar ) );
		if ( fPrevious < fCurrent )
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}			
	}
	else if ( iType == CSLDATAARRAY_TYPE_STRING )
	{
		string sPrevious = GetLocalString( oObject, GetLocalString( oObject, sPreviousVar ) );
		string sCurrent = GetLocalString( oObject, GetLocalString( oObject, sCurrentVar ) );
		if ( StringCompare( sPrevious,sCurrent, FALSE ) > 0 )
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}	
	}
	/*
	else if ( iType == CSLDATAARRAY_TYPE_OBJECT )
	{
		return FALSE;		
	}
	else if ( iType == CSLDATAARRAY_TYPE_LOCATION )
	{
		return FALSE;
	}
	*/
	
	return FALSE;
}



void CSLVarIndex_Sort( object oObject, int iType = CSLDATAARRAY_TYPE_INTEGER )
{
	int iCount = CSLVarIndex_Count(oObject,iType );
	if ( iCount < 2 )
	{
		return;
	} 
	int iCurrent, iPrevious;
	string sCurrent, sPrevious;
	int bSwappedValue = FALSE;
	string sPrefix = CSLVarIndex_Prefix( iType );
	
	for( iCurrent = 2; iCurrent <= iCount; iCurrent++)
	{
		if ( CSLVarIndex_Compare(oObject,iCurrent-1, iCurrent, iType) )
		{
			SetLocalString( oObject, sPrefix+IntToString( iCurrent-1 ), CSLVarIndex_VarNameByIndex( oObject, iCurrent, iType ) );
			SetLocalString( oObject, sPrefix+IntToString( iCurrent ), CSLVarIndex_VarNameByIndex( oObject, iCurrent-1, iType ) );
			bSwappedValue = TRUE;
		}
	}
	if ( bSwappedValue )
	{
		CSLVarIndex_Sort( oObject, iType );
	}
}