#include "ginc_item"
#include "nw_i0_plot"
#include "ginc_var_ops"
#include "ginc_param_const"
// /////////////////////////////////////////////////////////////////////////////////////////////////////
// SYSTEM CONSTANTS
// /////////////////////////////////////////////////////////////////////////////////////////////////////
/*
const string COLOUR_WHITE = "<color=#FFFFFF>";        // RGB 255, 255, 255 
const string COLOUR_LIGHT_GREY = "<color=#C0C0C0>";   // RGB 192, 192, 192 
const string COLOUR_GREY = "<color=#808080>";         // RGB 128, 128, 128 
const string COLOUR_DARK_GREY = "<color=#404040>";    // RGB 64, 64, 64 
const string COLOUR_BLACK = "<color=#000000>";        // RGB 0, 0, 0 
const string COLOUR_LIGHT_RED = "<color=#FF8080>";    // RGB 255, 128, 128 
const string COLOUR_LIGHT_GREEN = "<color=#80FF80>";  // RGB 128, 255, 128 
const string COLOUR_LIGHT_BLUE = "<color=#8080FF>";   // RGB 128, 128, 255 
const string COLOUR_LIGHT_YELLOW = "<color=#FFFF80>"; // RGB 255, 255, 128 
const string COLOUR_LIGHT_PURPLE = "<color=#FF80FF>"; // RGB 255, 128, 255 
const string COLOUR_LIGHT_CYAN = "<color=#80FFFF>";   // RGB 128, 255, 255 
const string COLOUR_RED = "<color=#FF0000>";          // RGB 255, 0, 0 
const string COLOUR_GREEN = "<color=#00FF00>";        // RGB 0, 255, 0 
const string COLOUR_BLUE = "<color=#0000FF>";         // RGB 0, 0, 255 
const string COLOUR_YELLOW = "<color=#FFFF00>";       // RGB 255, 255, 0 
const string COLOUR_PURPLE = "<color=#FF00FF>";       // RGB 255, 0, 255 
const string COLOUR_CYAN =  "<color=#00FFFF>";        // RGB 0, 255, 255 
const string COLOUR_ORANGE = "<color=#FF9900>";       // RGB 255, 153, 0 
const string COLOUR_DARK_RED = "<color=#800000>";     // RGB 128, 0, 0 
const string COLOUR_DARK_GREEN = "<color=#008000>";   // RGB 0, 128, 0 
const string COLOUR_DARK_BLUE = "<color=#000080>";    // RGB 0, 0, 128 
const string COLOUR_DARK_YELLOW = "<color=#808000>";  // RGB 128, 128, 0 
const string COLOUR_DARK_PURPLE = "<color=#800080>";  // RGB 128, 0, 128 
const string COLOUR_DARK_CYAN = "<color=#008080>";    // RGB 0, 128, 128 
*/
//color functions

/*
// //////////////////////////////////////////////////
// LEGENDS SCRIPT
// //////////////////////////////////////////////////
void LEG_COMMON_DisplayInfoBox(object oPC, string sText, int iTextMessage = 1, int iShout = 0, int iBoxType = 0)
{
	// Display the GUI screen message.
	string sBoxType, sBox;
	switch (iBoxType)
	{
		case 0:	sBoxType = "leg_info_infobox"; break;
		case 1:	sBoxType = "leg_info_infoboxalert"; sText = "<color=red>" + sText + "</color>"; break;
		case 2:	sBoxType = "leg_info_infoboxdetail"; break;	
	}
	DisplayGuiScreen(oPC, sBoxType, FALSE, sBoxType + ".xml");
	SetGUIObjectText(oPC, sBoxType, "info", -1, sText);
	
	// If we're supposed to also send the text to the PC's chat box.
	if (iTextMessage)
		SendMessageToPC(oPC, sText);
	else if (iShout)
		AssignCommand(oPC, SpeakString(sText, TALKVOLUME_SHOUT));
}
void LEG_COMMON_ClearArray(object oObject, string sArrayName)
{
    int iArrayCount = GetLocalInt(oObject, sArrayName + "_Count");
    int iCounter;

    while (iCounter < iArrayCount)
    {
        DeleteLocalString(oObject, sArrayName + "_Value" + IntToString(iCounter));
        iCounter++;
    }
    DeleteLocalInt(oObject, sArrayName + "_Count");
    DeleteLocalInt(oObject, sArrayName + "_Position");
}
string LEG_COMMON_GetArrayElement(object oObject, string sArrayName, int iIndex)
{
	// Get's the array element at a specific index.
	string sElement;
	int iCounter;
	int iArrayCount = GetLocalInt(oObject, sArrayName + "_Count");
	if (iIndex > iArrayCount)
		return "#OUTOFBOUNDS#";
	
    SetLocalInt(oObject, sArrayName + "_Position", iIndex);
	return sElement = GetLocalString(oObject, sArrayName + "_Value" + IntToString(iIndex));
}
// //////////////////////////////////////////////////
// LEG_COMMON_GetArrayElementCount
// //////////////////////////////////////////////////
int LEG_COMMON_GetArrayElementCount(object oObject, string sArrayName)
{
	return GetLocalInt(oObject, sArrayName + "_Count");
}
void LEG_COMMON_AddArrayElement(object oObject, string sArrayName, string sValue)
{
    int iArrayCount = GetLocalInt(oObject, sArrayName + "_Count");
    iArrayCount++;
    SetLocalString(oObject, sArrayName + "_Value" + IntToString(iArrayCount), sValue);
    SetLocalInt(oObject, sArrayName + "_Count", iArrayCount);
	SetLocalString(oObject, sArrayName + "_Value" + IntToString(iArrayCount + 1), "#EOA#");
}
string LEG_COMMON_GetNextArrayElement(object oObject, string sArrayName)
{
	// Get the current position and count
	int iPosition = GetLocalInt(oObject, sArrayName + "_Position");
	int iArrayCount = GetLocalInt(oObject, sArrayName + "_Count");
    iPosition++;

	// If adding one more position puts us outside the array, return EOA.
	if (iPosition > iArrayCount)
		return "#EOA#";

	SetLocalInt(oObject, sArrayName + "_Position", iPosition);
    string sElement = GetLocalString(oObject, sArrayName + "_Value" + IntToString(iPosition));
	while (sElement == "LEG_DELETED_ARRAY_ELEMENT")
	{
	    iPosition++;
    	SetLocalInt(oObject, sArrayName + "_Position", iPosition);
    	sElement = GetLocalString(oObject, sArrayName + "_Value" + IntToString(iPosition));
	}

	return sElement;
}
string LEG_COMMON_GetFirstArrayElement(object oObject, string sArrayName)
{
	// If there are no elements in the array, return EOA.
	if (GetLocalInt(oObject, sArrayName + "_Count") == 0)
		return "#EOA#";

    SetLocalInt(oObject, sArrayName + "_Position", 1);
	string sElement = GetLocalString(oObject, sArrayName + "_Value1");
	while(sElement == "LEG_DELETED_ARRAY_ELEMENT")
    {
		sElement = LEG_COMMON_GetNextArrayElement(oObject, sArrayName);
	}
	return sElement;
}
int LEG_COMMON_SearchArrayElement(object oObject, string sArrayName, string sValue)
{
	string sResult = LEG_COMMON_GetFirstArrayElement(oObject, sArrayName);
	int iIndex = 1;
	while (sResult != "#EOA#")
	{
		if (sResult == sValue)
			return iIndex;
		iIndex++;
		sResult = LEG_COMMON_GetNextArrayElement(oObject, sArrayName);
	}
	return -1;
}


//				Extraneous


// //////////////////////////////////////////////////
// LEG_COMMON_RenameArray
// //////////////////////////////////////////////////
void LEG_COMMON_RenameArray(object oObject, string sOldName, string sNewName)
{
    int iArrayCount = GetLocalInt(oObject, sOldName + "_Count");
    int iCounter;
	string sValue;

    while (iCounter < iArrayCount)
    {
		iCounter++;
		sValue = GetLocalString(oObject, sOldName + "_Value" + IntToString(iCounter));		
        SetLocalString(oObject, sNewName + "_Value" + IntToString(iCounter), sValue);
    }
	LEG_COMMON_ClearArray(oObject, sOldName);
}
// //////////////////////////////////////////////////
// LEG_COMMON_CompressArray
// //////////////////////////////////////////////////
void LEG_COMMON_CompressArray(object oObject, string sArrayName)
{
	// Reindex the array removing deleted elements.
	string sValue;
	string sTempArrayName = sArrayName + "_tmp";
    int iArrayCount = GetLocalInt(oObject, sArrayName + "_Count");
    int iCounter, iNewIndex, iNewCount;
	iNewCount = iArrayCount;
	
    while (iCounter < iArrayCount)
    {
		iCounter++;
        sValue = GetLocalString(oObject, sArrayName + "_Value" + IntToString(iCounter));
		if (sValue != "LEG_DELETED_ARRAY_ELEMENT")
		{
			// Anything that's not deleted, add to the new temp array.
			iNewIndex++;
			SetLocalString(oObject, sTempArrayName + "_Value" + IntToString(iNewIndex), sValue);
		}
	}
	
	// Now that we have a new temporary array, we need to delete the old array and rename this one.
	SetLocalInt(oObject, sTempArrayName + "_Count", iNewIndex);
	SetLocalInt(oObject, sTempArrayName + "_Position", 1);
	LEG_COMMON_ClearArray(oObject, sArrayName);
	LEG_COMMON_RenameArray(oObject, sTempArrayName, sArrayName);
	SetLocalString(oObject, sArrayName + "_Value" + IntToString(iNewIndex + 1), "#EOA#");
	SetLocalInt(oObject, sArrayName + "_Count", iNewIndex);
	SetLocalInt(oObject, sArrayName + "_Position", 1);
}
// //////////////////////////////////////////////////
// LEG_COMMON_DeleteCurrentArrayElement
// //////////////////////////////////////////////////
void LEG_COMMON_DeleteArrayElement(object oObject, string sArrayName, int iIndex)
{
    SetLocalString(oObject, sArrayName + "_Value" + IntToString(iIndex), "LEG_DELETED_ARRAY_ELEMENT");
	LEG_COMMON_CompressArray(oObject, sArrayName);
}
*/


// /////////////////////////////////////////////////////////////////////////////////////////////////////
// TECHNICAL GAME FUNCTIONS
// /////////////////////////////////////////////////////////////////////////////////////////////////////
void DestroyItems(object oTarget, string sItem, int nNumItems)
{
    int nCount = 0;
    object oItem = GetFirstItemInInventory(oTarget);
	
    while (GetIsObjectValid(oItem) == TRUE && nCount < nNumItems)
    {
        if (GetTag(oItem) == sItem)
        {
            int nRemainingToDestroy = nNumItems - nCount;
			int nStackSize = GetItemStackSize(oItem);
			
			if(nStackSize <= nRemainingToDestroy)
			{
				DestroyObject(oItem,0.1f);
				nCount += nStackSize;
			}
            else
			{
				int nNewStackSize = nStackSize - nRemainingToDestroy;
				SetItemStackSize(oItem, nNewStackSize);
				break;
			}
        }
        oItem = GetNextItemInInventory(oTarget);
    }
   return;
}
// /////////////////////////////////////////////////////////////////////////////////////////////////////
// TECHNICAL FUNCTIONS
// /////////////////////////////////////////////////////////////////////////////////////////////////////
string subS1;
string subS2;
string subS3;
string subS4;
string subS5;
string subS6;
void SplitString(string text)
{
	if (text == "") {subS1 = ""; subS2 = ""; subS3 = ""; subS4 = ""; subS5 = ""; subS6 = "";}
	//input ex. = "Hi,I'm,Triston,Chrystar"; has 4 subs
	string char;
	string str;
	int count = 0;
	int ix;
	text+=","; //so it can find last entry
	for(ix = 0; ix < GetStringLength(text); ix++)
	{
		char = GetSubString(text, ix, 1);
		if (char == ",")
		{
			count++;
			if (count == 1) {subS1 =str;}
			if (count == 2) {subS2 =str;}
			if (count == 3) {subS3 =str;}
			if (count == 4) {subS4 =str;}
			if (count == 5) {subS5 =str;}
			if (count == 6) {subS6 =str;}
			//if (count == index) { break; }
			str = "";
		}
		else
		{
			str += char;
		}
	}
}
/*
// /////////////////////////////////////////////////////////////////////////////////////////////////////
// TECHNICAL FUNCTIONS	- Package attempt, may not be worth the time
// /////////////////////////////////////////////////////////////////////////////////////////////////////
const string PACKAGE_TAGS = "TBpackages";
int ExistsPackageID(object oPC, string objTag)
{
	string results = LEG_COMMON_GetArrayElement(oPC, PACKAGE_TAGS, LEG_COMMON_SearchArrayElement(oPC, PACKAGE_TAGS, objTag));
	return (results == objTag);
}
void AddPackageID(object oPC, string objTag)
{
	LEG_COMMON_AddArrayElement(oPC, PACKAGE_TAGS, objTag);
}
void RemovePackageID(object oPC, string objTag)
{
	LEG_COMMON_DeleteArrayElement(oPC, PACKAGE_TAGS, LEG_COMMON_SearchArrayElement(oPC, PACKAGE_TAGS, objTag));
}
string GetPackage(object oPC, string idTag, int jobNum)
{
	return GetLocalString(oPC, idTag+"TBPackage"+IntToString(jobNum));
}
void SetPackage(object oPC, string idTag, string typeTag, int jobNum, string params)
{
	oPC = oPC;
	//string targetTag, int quantity, string feedback = ""
	if (!ExistsPackageID(oPC, idTag)) {AddPackageID(oPC, idTag);}
	//incomplete objType+","+tag+","+IntToString(quantity)
	//complete	 "objcomplete"
	SetLocalString(oPC, idTag+"TBPackage"+IntToString(jobNum), params);
	//SendMessageToPC(oPC, "SetPackage "+GetLocalString(oPC, idTag+"obj"+IntToString(objNum)));
	//do some cleanup, remove any job in the array that doesn't have params
	while (ExistsPackageID(oPC, idTag)) 
	{
		if (GetLocalString(oPC, idTag+"TBPackage"+IntToString(jobNum)) == "")
		{
			RemovePackageID(oPC, idTag);
		}
		else break;
	}
}
*/