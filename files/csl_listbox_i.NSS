#include "csl_core_i"

const string LISTBOX_CREATED = "LISTBOX_CREATED";
const string LISTROW_OBJECTS = "LISTROW_OBJECTS";
const string HEADER_BUTTON = "HEADER_BUTTON";
const string HEADER_OPENED_IMAGE = "HEADER_OPENED_IMAGE";
const string HEADER_CLOSED_IMAGE = "HEADER_CLOSED_IMAGE";
const string LISTBOX_SCREEN = "LISTBOX_SCREEN";
const string LISTBOX_CHAR = "LISTBOX_CHAR";
const string LISTBOX_NAME = "LISTBOX_NAME";
const string HEADER_COUNT = "HEADER_COUNT";
const string NONHEADER_ROWCOUNT = "NONHEADER_ROWCOUNT";
const string HEADER_ROWNAME = "HEADER_ROWNAME";
const string HEADER_TEXT = "HEADER_TEXT";
const string HEADER_STATE = "HEADER_STATE";
const string HEADER_VISIBLE = "HEADER_VISIBLE";
const string HEADER_CHILD_ROWS = "HEADER_CHILD_ROWS";
const string HEADER = "HEADER";
const string CHILDROW = "CHILDROW";
const string CRNAME = "CRNAME";
const string TextFields = "sTextFields";
const string Textures = "sTextures";
const string Variables = "sVariables";
const string HideUnhide = "sHideUnhide";
const string CRVISIBLE = "CRVISIBLE";
const string PRIOR_LBINDEX = "PRIOR_LBINDEX";

object CSLGetListBoxObject(object oChar, string sScreen, string sListBox);
object CSLCreateListBoxObject(object oChar, string sScreen, string sListBox, string sListProtoTypeObjecNames);
void CSLDefineListBoxHeaders(object oListBoxObj, string sHeaderButtonName, string sClosedImage, string sOpenedImage);
void CSLAddListBoxHeader(object oListBoxObj, string sRowName, string sHeaderText);
void CSLAddListBoxRow(object oListBoxObj, string sRowName, string sTextFields, string sTextures, string sVariables, string sHideUnhide, int bVisible, string sHeader = "");
string CSLGetListBowRowName(object oListBoxObj, int nIndex, string sHeader = "");
int CSLGetListBoxRowVisible(object oListBoxObj, string sRowName);
void CSLSetListBoxRowVisible(object oListBoxObj, string sRowName, int bVisible);
void CSLRefreshListBox(object oListBoxObj);
void CSLToggleListBoxHeader(object oListBoxObj, string sHeader);

//Gets the listbox object unique to oChar's ID, the xml gui screen sScreen, and the xml listbox sListBox
//returns OBJECT_INVALID if oChar is invalid or sScreen  = "" or sListBox = "" or CSLCreatListBox has not yet been called.
object CSLGetListBoxObject(object oChar, string sScreen, string sListBox)
{
	if (sScreen == "" || sListBox == "" || GetIsObjectValid(oChar) == FALSE)
		return OBJECT_INVALID;
	string sUniqueID = sScreen + sListBox + IntToString(ObjectToInt(oChar));
	object oDP = CSLGetDataPoint(sUniqueID);
	if (GetLocalInt(oDP, LISTBOX_CREATED) == 0)
	{
		DestroyObject(oDP);
		return OBJECT_INVALID;
	}
	return oDP;
}

//Creates a listbox object unique to oChar's ID, the xml gui screen sScreen, and the xml listbox sListBox
//sListProtoTypeObjectNames is a comma delimited list of each prototype object defined by sListBox in the xml.
//The header button (if it exists) should not be included in the list of prototype objects.
object CSLCreateListBoxObject(object oChar, string sScreen, string sListBox, string sListProtoTypeObjectNames)
{
	string sUniqueID = sScreen + sListBox + IntToString(ObjectToInt(oChar));
	object oDP = CSLGetDataPoint(sUniqueID);
	SetLocalInt(oDP, LISTBOX_CREATED, 1);
	SetLocalObject(oDP, LISTBOX_CHAR, oChar);
	SetLocalString(oDP, LISTBOX_SCREEN, sScreen);
	SetLocalString(oDP, LISTBOX_NAME, sListBox);
	SetLocalString(oDP, LISTROW_OBJECTS, sListProtoTypeObjectNames);	
	SetLocalString(oDP, HEADER_BUTTON, "");
	SetLocalString(oDP, HEADER_OPENED_IMAGE, "");
	SetLocalString(oDP, HEADER_CLOSED_IMAGE, "");
	SetLocalInt(oDP, HEADER_COUNT, 0);
	SetLocalInt(oDP, NONHEADER_ROWCOUNT, 0);
	return oDP;
}

//oListBoxObj is the unique listbox object obtained from CSLGetListBoxObject
//sHeaderButtonName is the name of the prototype object which is used as the collapsable header button defined in the xml
//sClosedImage and sOpenedImage is the textures used by the header button to denote opened and closed states.
//You may recall this function to change the image textures.
//Only the header button name prototype object is set as visiable on a header row, all others are set as hidden,
void CSLDefineListBoxHeaders(object oListBoxObj, string sHeaderButtonName, string sClosedImage, string sOpenedImage)
{
	if (!GetIsObjectValid(oListBoxObj) || sHeaderButtonName == "")
		return;
	SetLocalString(oListBoxObj, HEADER_BUTTON, sHeaderButtonName);
	SetLocalString(oListBoxObj, HEADER_OPENED_IMAGE, sOpenedImage);
	SetLocalString(oListBoxObj, HEADER_CLOSED_IMAGE, sClosedImage);	
}

//Adds a listbox header row to the end of the header row list.
//oListBoxObj is the listbox object to add the header to. 
//sHeaderText is the display text of the header row.
//All header rows are added in the open state.
void CSLAddListBoxHeader(object oListBoxObj, string sRowName, string sHeaderText)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);	
	string sHeaderCount = IntToString(nHeaderCount);
	SetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderCount, sRowName);
	SetLocalString(oListBoxObj, HEADER_TEXT + sHeaderCount, sHeaderText);
	SetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderCount, 0);
	SetLocalInt(oListBoxObj, HEADER_STATE + sHeaderCount, 1);
	SetLocalInt(oListBoxObj, HEADER_VISIBLE + sHeaderCount, 1);
	SetLocalInt(oListBoxObj, HEADER_COUNT, nHeaderCount + 1);
}

// oListBoxObject, the listbox object to add a row to.
// sRowName - Name to give the new row
// sTextFields - List of text fields and text values to populate the row
// sTextures - List of texture objects and texture names to populate the row
// sVariables - List of variable indexes and variable values
// sHideUnHide - List of objects to hide or set unhidden
// sHeader the header row text that this row should belong to, leave blank if not using headers.
//The syntax for the text fields, textures, variables, and hide/unhide list is:
//<name of UI Object>=<value>, except in the case of variables where it is <index>=<value>
//Multiple entries are seperated by ; marks.
//And in order to affect the root level of the row itself, simply make an entry that starts with the = sign.
//For example, for setting text field contents, some options might be:
//  sTextFields = "textfield1=Row One Text1;textfield2=Row One Text2";//This will make it so the text field named 'textfield1'
//                will say 'Row One Text1' and the text field in that row named 'textfield2' will say 'Row One Text2'.
//  sTextFields = "=Row Text" will make the row itself (assuming it can display text) say 'Row Text'.
void CSLAddListBoxRow(object oListBoxObj, string sRowName, string sTextFields, string sTextures, string sVariables, string sHideUnhide, int bVisible, string sHeader = "")
{
	int nChildRows;
	if (sHeader != "")
	{
		int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
		int i;
		string sHeaderIndex;
		for(i = 0; i < nHeaderCount; i++)
		{
			sHeaderIndex = IntToString(i);
			if (GetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex) == sHeader)
				break;
		}
		if (i == nHeaderCount)
			return;
		sHeader = HEADER + sHeaderIndex;
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);				
		SetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex, nChildRows + 1);
	}
	else
	{
		nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);
		SetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT, nChildRows + 1);
	}
	string sVar = sHeader + CHILDROW + IntToString(nChildRows);
	SetLocalString(oListBoxObj, sVar + CRNAME, sRowName);
	SetLocalString(oListBoxObj, sVar + TextFields, sTextFields);
	SetLocalString(oListBoxObj, sVar + Textures, sTextures);
	SetLocalString(oListBoxObj, sVar + Variables, sVariables);
	SetLocalString(oListBoxObj, sVar + HideUnhide, sHideUnhide);
	SetLocalInt(oListBoxObj, sVar + CRVISIBLE, bVisible);
	SetLocalString(oListBoxObj, sRowName, sVar);
}

//Gets the Rowname of the listbox by the current index and header if provided
//Returns row name regardless if row is visible or not.
string CSLGetListBoxRowName(object oListBoxObj, int nIndex, string sHeader = "")
{
	string sVar = sHeader + CHILDROW + IntToString(nIndex);
	string sRowName = GetLocalString(oListBoxObj, sVar + CRNAME);
	return sRowName;
}

//Gets the value set with CSLAddListBoxRow or CSLSetListBoxRowValue by sValueType.
//valid sValueTypes are: 
//TextFields
//Textures
//Variables
//HideUnhide
//Only affects child rows (not header rows)
string CSLGetListBoxRowValue(object oListBoxObj, string sRowName, string sValueType)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i, j, nChildRows;
	string sHeaderIndex, sVar;

	string sPriorIndex = GetLocalString(oListBoxObj, PRIOR_LBINDEX);
	if (GetLocalString(oListBoxObj, sPriorIndex + CRNAME) == sRowName)
		return  GetLocalString(oListBoxObj, sPriorIndex + sValueType);
	
	for(i = 0; i < nHeaderCount; i++)
	{
		sHeaderIndex = IntToString(i);
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);
		for(j = 0; j < nChildRows; j++)
		{
			sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(j);
			if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)
			{
				SetLocalString(oListBoxObj, PRIOR_LBINDEX, sVar);
				return GetLocalString(oListBoxObj, sVar + sValueType);
			}
		}
	}
	nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);	
	for(i = 0; i < nChildRows; i++)
	{
		sVar = CHILDROW + IntToString(i);
		if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)	
		{
			SetLocalString(oListBoxObj, PRIOR_LBINDEX, sVar);	
			return GetLocalString(oListBoxObj, sVar + sValueType);			
		}
	}
	return "";
}

//Sets the listbox value of the chld row with sRowName of the sValueType.
//valid sValueTypes are: 
//TextFields
//Textures
//Variables
//HideUnhide
//Only affects child rows (not header rows)
void CSLSetListBoxRowValue(object oListBoxObj, string sRowName, string sValueType, string sTextFields)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i, j, nChildRows;
	string sHeaderIndex, sVar;
	
	string sPriorIndex = GetLocalString(oListBoxObj, PRIOR_LBINDEX);
	if (GetLocalString(oListBoxObj, sPriorIndex + CRNAME) == sRowName)
	{
		SetLocalString(oListBoxObj, sPriorIndex + sValueType, sTextFields);
		return;
	}
	
	for(i = 0; i < nHeaderCount; i++)
	{
		sHeaderIndex = IntToString(i);
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);
		for(j = 0; j < nChildRows; j++)
		{
			sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(j);
			if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)
			{
				SetLocalString(oListBoxObj, PRIOR_LBINDEX, sVar);
				SetLocalString(oListBoxObj, sVar + sValueType, sTextFields);
				return;
			}
		}
	}
	nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);	
	for(i = 0; i < nChildRows; i++)
	{
		sVar = CHILDROW + IntToString(i);
		if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)
		{		
			SetLocalString(oListBoxObj, PRIOR_LBINDEX, sVar);
			SetLocalString(oListBoxObj, sVar + sValueType, sTextFields);
			return;			
		}
	}
}

//Gets the bVisible value set with CSLAddListBoxRow or CSLSetListBoxRowVisible.
int CSLGetListBoxRowVisible(object oListBoxObj, string sRowName)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i, j, nChildRows;
	string sHeaderIndex, sVar;
	for(i = 0; i < nHeaderCount; i++)
	{
		sHeaderIndex = IntToString(i);
		if (GetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex) == sRowName)
			return GetLocalInt(oListBoxObj, HEADER_VISIBLE + sHeaderIndex);
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);
		for(j = 0; j < nChildRows; j++)
		{
			sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(j);
			if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)
				return GetLocalInt(oListBoxObj, sVar + CRVISIBLE);
		}
	}
	nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);	
	for(i = 0; i < nChildRows; i++)
	{
		string sIndex =  IntToString(i);
		if (GetLocalString(oListBoxObj, CHILDROW + sIndex + CRNAME) == sRowName)		
			return GetLocalInt(oListBoxObj, CHILDROW + sIndex + CRVISIBLE);			
	}
	return 0;
}


//Sets the listbox row sRowName on the oListBoxObj as visible (bVisible = TRUE) or not visible (bVisible = FALSE)
//Note that if you hide/unhide a header row then all child rows will be set to the same visibility as the header row.
void CSLSetListBoxRowVisible(object oListBoxObj, string sRowName, int bVisible)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i, bHideAll, nChildRows;
	string sHeaderIndex;
	for(i = 0; i < nHeaderCount; i++)
	{
		sHeaderIndex = IntToString(i);
		if (GetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex) == sRowName)
			bHideAll = TRUE;
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);
		int j;
		for(j = 0; j < nChildRows; j++)
		{	
			string sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(j);	
			if (bHideAll)				
				SetLocalInt(oListBoxObj, sVar + CRVISIBLE, bVisible);
			else if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)
			{
				SetLocalInt(oListBoxObj, sVar + CRVISIBLE, bVisible);
				return;
			}
		}
		if (bHideAll)
			return;
	}
	nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);	
	for(i = 0; i < nChildRows; i++)
	{
		string sIndex =  IntToString(i);
		if (GetLocalString(oListBoxObj, CHILDROW + sIndex + CRNAME) == sRowName)
		{
			SetLocalInt(oListBoxObj, CHILDROW + sIndex + CRVISIBLE, bVisible);
			return;
		}
	}					
}

//Removes a listbox row from oListBoxObj with the given sRowName
//If sRowName specifies a header row, all child rows of that header will be removed.
void CSLRemoveListBoxRow(object oListBoxObj, string sRowName)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i, bRemoveAll, nChildRows;
	string sHeaderIndex;
	DeleteLocalString(oListBoxObj, sRowName);
	for(i = 0; i < nHeaderCount; i++)
	{
		sHeaderIndex = IntToString(i);
		if (GetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex) == sRowName)
		{
			SetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex, "");
			SetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex, 0);			
			return;
		}
		int bFound= FALSE;
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);
		int j;
		for(j = 0; j < nChildRows; j++)
		{			
			string sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(j);				
			if (GetLocalString(oListBoxObj, sVar + CRNAME) == sRowName)
				bFound = TRUE;
			
			if (bFound)
			{
				if (j < nChildRows - 1)
				{
					string sVar1 = HEADER + sHeaderIndex + CHILDROW + IntToString(j+1); 
					SetLocalString(oListBoxObj, sVar + CRNAME, GetLocalString(oListBoxObj, sVar1 + CRNAME));
					SetLocalString(oListBoxObj, sVar + TextFields, GetLocalString(oListBoxObj, sVar1 + TextFields));
					SetLocalString(oListBoxObj, sVar + Textures, GetLocalString(oListBoxObj, sVar1 + Textures));
					SetLocalString(oListBoxObj, sVar + Variables, GetLocalString(oListBoxObj, sVar1 + Variables));
					SetLocalString(oListBoxObj, sVar + HideUnhide, GetLocalString(oListBoxObj, sVar1 + HideUnhide));
					SetLocalInt(oListBoxObj, sVar + CRVISIBLE, GetLocalInt(oListBoxObj, sVar1 + CRVISIBLE));				
				}
				else
				{										
					DeleteLocalString(oListBoxObj, sVar + CRNAME);
					DeleteLocalString(oListBoxObj, sVar + TextFields);
					DeleteLocalString(oListBoxObj, sVar + Textures);
					DeleteLocalString(oListBoxObj, sVar + Variables);
					DeleteLocalString(oListBoxObj, sVar + HideUnhide);
					DeleteLocalInt(oListBoxObj, sVar + CRVISIBLE);
					nChildRows--;
					SetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex, nChildRows);
				}
			}
		}
		if (bFound)
			return;
	}
	
	nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);	
	for(i = 0; i < nChildRows; i++)
	{
		int bFound= FALSE;
		string sIndex =  IntToString(i);
		if (GetLocalString(oListBoxObj, CHILDROW + sIndex + CRNAME) == sRowName)
			bFound = TRUE;
		if (bFound)
		{
			if (i < nChildRows - 1)
			{
				string sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(i);
				string sVar1 = HEADER + sHeaderIndex + CHILDROW + IntToString(i+1); 
				SetLocalString(oListBoxObj, sVar + CRNAME, GetLocalString(oListBoxObj, sVar1 + CRNAME));
				SetLocalString(oListBoxObj, sVar + TextFields, GetLocalString(oListBoxObj, sVar1 + TextFields));
				SetLocalString(oListBoxObj, sVar + Textures, GetLocalString(oListBoxObj, sVar1 + Textures));
				SetLocalString(oListBoxObj, sVar + Variables, GetLocalString(oListBoxObj, sVar1 + Variables));
				SetLocalString(oListBoxObj, sVar + HideUnhide, GetLocalString(oListBoxObj, sVar1 + HideUnhide));
				SetLocalInt(oListBoxObj, sVar + CRVISIBLE, GetLocalInt(oListBoxObj, sVar1 + CRVISIBLE));				
			}
			else
			{
				string sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(i);					
				DeleteLocalString(oListBoxObj, sVar + CRNAME);
				DeleteLocalString(oListBoxObj, sVar + TextFields);
				DeleteLocalString(oListBoxObj, sVar + Textures);
				DeleteLocalString(oListBoxObj, sVar + Variables);
				DeleteLocalString(oListBoxObj, sVar + HideUnhide);
				DeleteLocalInt(oListBoxObj, sVar + CRVISIBLE);
				nChildRows--;
				SetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT, nChildRows);
			}
		}		
	}						
}

//Causes the oListBoxObject to clear and repulate the GUI listbox on the user's screen
//Call this after all visibility and row manipulation functions are complete.
void CSLRefreshListBox(object oListBoxObj)
{
	if (!GetIsObjectValid(oListBoxObj))
	{
		WriteTimestampedLogEntry("ERROR: CSLRefreshListBox, oListBoxObject was not valid.");
		return;
	}

	object oPC = GetOwnedCharacter(GetLocalObject(oListBoxObj, LISTBOX_CHAR));
	string sScreen = GetLocalString(oListBoxObj, LISTBOX_SCREEN);
	string sListBox = GetLocalString(oListBoxObj, LISTBOX_NAME);
	string sListProtoTypeObjectNames = GetLocalString(oListBoxObj, LISTROW_OBJECTS);	
	string sHeaderButton = GetLocalString(oListBoxObj, HEADER_BUTTON);
	string sHeaderOpenedImg = GetLocalString(oListBoxObj, HEADER_OPENED_IMAGE);
	string sHeaderClosedImg = GetLocalString(oListBoxObj, HEADER_CLOSED_IMAGE);
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i, nChildRows, bVisible;
	string sHeaderIndex, sRowName, sHeaderText, sTextFields, sTextures, sVariables, sHideUnhide;
	ClearListBox(oPC, sScreen, sListBox);
	for(i = 0; i < nHeaderCount; i++)
	{
		sHeaderIndex = IntToString(i);
		sRowName = GetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex);
		sHeaderText = GetLocalString(oListBoxObj, HEADER_TEXT + sHeaderIndex);
		nChildRows = GetLocalInt(oListBoxObj, HEADER_CHILD_ROWS + sHeaderIndex);
		bVisible = GetLocalInt(oListBoxObj, HEADER_VISIBLE + sHeaderIndex);
		if (!bVisible || sRowName == "")		
			continue;
		if (nChildRows > 0)
		{			
			sTextFields = sHeaderButton + "=" + sHeaderText;
			sTextures = sHeaderButton + "=" + sHeaderOpenedImg + ";";			 
			string sOpen = IntToString(GetLocalInt(oListBoxObj, HEADER_STATE + sHeaderIndex));
			if (sOpen == "0")			
				sTextures = sHeaderButton + "=" + sHeaderClosedImg + ";";				
			sVariables = "0=" + sRowName + ";1=-1;";
			sHideUnhide = sHeaderButton + "=unhide;";
			string s = sListProtoTypeObjectNames;
			int nIndex = FindSubString(s, ",");
			while (nIndex != -1)
			{				
				sHideUnhide += GetSubString(s, 0, nIndex) + "=hide;";
				s = GetSubString(s, nIndex + 1, GetStringLength(s) - (nIndex + 1));
				nIndex = FindSubString(s, ",");
			}
			string sHeaderRow = sRowName;
			AddListBoxRow(oPC, sScreen, sListBox, sHeaderRow, sTextFields, sTextures, sVariables, sHideUnhide);
								
			int j;
			int bChildRowsVisible = FALSE;
			for(j = 0; j < nChildRows; j++)
			{
				string sVar = HEADER + sHeaderIndex + CHILDROW + IntToString(j);
				bVisible = GetLocalInt(oListBoxObj, sVar + CRVISIBLE);
				if (bVisible)
				{
					bChildRowsVisible = TRUE;
					if (sOpen == "1")
					{
						sRowName = GetLocalString(oListBoxObj, sVar + CRNAME);
						sTextFields = GetLocalString(oListBoxObj, sVar + TextFields);
						sTextures = GetLocalString(oListBoxObj, sVar + Textures);
						sVariables = GetLocalString(oListBoxObj, sVar + Variables);
						sHideUnhide = GetLocalString(oListBoxObj, sVar + HideUnhide) + (sHeaderButton == "" ? "" : sHeaderButton + "=hide;"); 
						AddListBoxRow(oPC, sScreen, sListBox, sRowName, sTextFields, sTextures, sVariables, sHideUnhide);
					}
				}
			}
			if (bChildRowsVisible == FALSE)	//No child rows for this header were set to visible				
				RemoveListBoxRow(oPC, sScreen, sListBox, sHeaderRow);							
		}
	}
	nChildRows = GetLocalInt(oListBoxObj, NONHEADER_ROWCOUNT);	
	
	for(i = 0; i < nChildRows; i++)
	{
		string sVar = CHILDROW + IntToString(i);
		bVisible = GetLocalInt(oListBoxObj, sVar + CRVISIBLE);
		if (bVisible)
		{
			sRowName = GetLocalString(oListBoxObj, sVar + CRNAME);
			sTextFields = GetLocalString(oListBoxObj, sVar + TextFields);
			sTextures = GetLocalString(oListBoxObj, sVar + Textures);
			sVariables = GetLocalString(oListBoxObj, sVar + Variables);
			sHideUnhide = GetLocalString(oListBoxObj, sVar + HideUnhide) + (sHeaderButton == "" ? "" : sHeaderButton + "=hide;"); 
			AddListBoxRow(oPC, sScreen, sListBox, sRowName, sTextFields, sTextures, sVariables, sHideUnhide);
		}
	}
}

//Toggle the collapsable state of the header row sHeader in oListBoxObj
void CSLToggleListBoxHeader(object oListBoxObj, string sHeader)
{
	int nHeaderCount = GetLocalInt(oListBoxObj, HEADER_COUNT);
	int i;
	for(i = 0; i < nHeaderCount; i++)
	{
		string sHeaderIndex = IntToString(i);
		if (GetLocalString(oListBoxObj, HEADER_ROWNAME + sHeaderIndex) == sHeader)
		{
			int bState = GetLocalInt(oListBoxObj, HEADER_STATE + sHeaderIndex);
			bState = !bState;
			SetLocalInt(oListBoxObj, HEADER_STATE + sHeaderIndex, bState);
			CSLRefreshListBox(oListBoxObj);
			return;
		}
	}
}