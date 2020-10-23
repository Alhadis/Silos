#include "dcs_inc_database"
#include "dcs_inc_forge"
#include "dcs_inc_skill"

// *  Assigns the previous recipe ID and type to the current one
void DCS_AssignPreviousRecipe(object oPC, object oStation=OBJECT_SELF);

// *  Clean the list entries from oStation before
// *  using them again in another process
void DCS_CleanListEntries(object oStation=OBJECT_SELF, int iMax=DCS_TOKEN_PER_PAGE_MENU);

// *  Deletes offset value from iOffset
void DCS_DeleteOffsetValue(int iOffset);

// *  Deletes the previous crafted recipe ID and station tag from the PC.
void DCS_DeletePreviousRecipe(object oPC);

// *  Saves the previous crafted recipe ID and station tag for the PC being able to return to
// *  his last crafted recipe in the menu.
void DCS_SavePreviousRecipe(object oPC, object oStation=OBJECT_SELF);

// *  Set the current menu to iCurrent
void DCS_SetCurrentMenu(int iCurrent);

// *  Set the current offset value to iOffset
void DCS_SetCurrentOffsetValue(int iOffset);

// *  Sets the enchanting mode to iStatus
void DCS_SetEnchantingMode(int iStatus);

// *  Set the current listing position to iPosition
void DCS_SetListingPosition(int iPosition, object oStation=OBJECT_SELF);

// *  Set menupage to iCurrent
void DCS_SetMenupage(int iCurrent);

// *  Set Offset value from iOffset to iValue
void DCS_SetOffsetValue(int iOffset, int iValue);

// *  Returns current menu
int DCS_GetCurrentMenu(object oTarget=OBJECT_SELF);

// *  Returns current offset value
int DCS_GetCurrentOffsetValue();

// *  Returns TRUE, if the crafting player is currently in disenchanting mode
int DCS_GetDisenchantingMode();

// *  Returns TRUE, if the crafting player is currently in enchanting mode
// *   - nByRecipeType: If This is TRUE, the function will check the recipe type itself instead of using a stored variable
// *   - nSingleType: This variable is in use when nByRecipeType=TRUE. It will check the recipetype for this single type only.
// *                  DCS_ID_ENCHANTING_ELEMENTAL
// *                  DCS_ID_ENCHANTING_MAGICAL
// *                  "" = Both
int DCS_GetEnchantingMode(int nByRecipeType=TRUE, string sSingleType="");

// *  Returns TRUE, if oPC is qualified for the recipe
int DCS_GetEntryShown(object oPC, int iLevel, int iRank, int iSpecial, int iCondition, string sIsExtra, string sRecipeID, int iProf=-1);

// *  Returns TRUE, if the crafting player is currently in gem binding mode
int DCS_GetGemBindingMode();

// *  Returns the current listing position for oStation
int DCS_GetListingPosition(object oStation=OBJECT_SELF);

// *  Returns the current menu counter value
int DCS_GetMenuCounter();

// *  Returns current menupage
int DCS_GetMenupage(object oTarget=OBJECT_SELF);

// *  Returns size for current menu
int DCS_GetMenuSize();

// *  Returns offset saved on iMenu
int DCS_GetOffsetValue(int iOffset);

// *  Returns ID of the current recipe by iPosition (if != -1)
// *  Otherwise by current MinorInt
int DCS_GetRecipeNumber(int iPosition = -1);

// *  Returns the identification number for the recipe with sRecipeType and iRecipeNumber
// *  - if iRecipeNumber = 0, DCS_GetRecipeNumber() is used here
// *  - if sRecipeType   = "", DCS_GetRecipeType() is used here
string DCS_GetRecipeID(int iRecipeNumber=0, string sRecipeType="");

// *  Returns the current main recipe type
// *  iNum: If this is -1, DCS_GetCraftingProfession() will be used
// *  bStore: If this is TRUE, the value will be stored for later uses
string DCS_GetMainRecipeType(int iProf=-1, int bStore=TRUE);

// *  Returns the previous recipe ID that oPC has attempted to craft, if it exists.
string DCS_GetPreviousRecipe(object oPC, object oStation=OBJECT_SELF);

// *  Returns the current recipe type
// *  iNum: If this is -1, DCS_GetMainInt() will be used
// *  bStore: If this is TRUE, the value will be stored for later uses
string DCS_GetRecipeType(int iNum=-1, int bStore=TRUE);

// *  Returns the matching token string for current crafting station
// *   - nTokenType: Current menupage (DCS_GetMenupage()) or DCS_TOKENTYPE_* constants
// *   - nToken:     Number of the token
// *   - On Error return: ""
string DCS_GetToken(int nTokenType, int nToken);

/******************************************************************************/
//*                             IMPLEMENTATION                               *\\
/******************************************************************************/

void DCS_SetListingPosition(int iPosition, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, DCS_VAR_LIST_POSITION, iPosition);
}

/******************************************************************************/

int DCS_GetListingPosition(object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, DCS_VAR_LIST_POSITION);
}

/******************************************************************************/

void DCS_SetCurrentMenu(int iCurrent)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_CURRENT_MENU, iCurrent);
}

/******************************************************************************/

int DCS_GetCurrentMenu(object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, DCS_VAR_CURRENT_MENU);
}

/******************************************************************************/

void DCS_SetMenupage(int iCurrent)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_MENUPAGE, iCurrent);
}

/******************************************************************************/

int DCS_GetMenupage(object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, DCS_VAR_MENUPAGE);
}

/******************************************************************************/

void DCS_SetCurrentOffsetValue(int iOffset)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_OFFSET_CURRENT, iOffset);
}

/******************************************************************************/

int DCS_GetCurrentOffsetValue()
{
    return GetLocalInt(OBJECT_SELF, DCS_VAR_OFFSET_CURRENT);
}

/******************************************************************************/

void DCS_SetOffsetValue(int iOffset, int iValue)
{
    object oStation = OBJECT_SELF;
    SetLocalInt(oStation, DCS_VAR_OFFSET+inStr(iOffset), iValue);
}

/******************************************************************************/

int DCS_GetOffsetValue(int iOffset)
{
    object oStation = OBJECT_SELF;
    return GetLocalInt(oStation, DCS_VAR_OFFSET+inStr(iOffset));
}

/******************************************************************************/

int DCS_GetOffsetsCount()
{
    int i;

    while(DCS_GetOffsetValue(i+1) != 0){i++;}

    return i;
}

/******************************************************************************/

int DCS_GetFullOffsetValue()
{
    object oPC        = DCS_GetCraftingPlayer();
    int iOffsetMulti  = 100;
    int iOffsetsCount = DCS_GetOffsetsCount();
    int iOffset, iValue, i;

    for(i=1;i <= iOffsetsCount; i++)
    {
        iOffset       = DCS_GetOffsetValue(i);
        iValue       += iOffset * iOffsetMulti;
        iOffsetMulti *= 10;
    }

    return iValue;
}

/******************************************************************************/

void DCS_DeleteOffsetValue(int iOffset)
{
    DeleteLocalInt(OBJECT_SELF, DCS_VAR_OFFSET+inStr(iOffset));
}

/******************************************************************************/

void DCS_DeleteOffsets()
{
    object oStation = OBJECT_SELF;
    int    iOffsets = DCS_GetOffsetsCount();
    int    i;

    for(i=1; i <= iOffsets; i++)
    {
        DeleteLocalInt(oStation, DCS_VAR_OFFSET+inStr(i));
    }

    DeleteLocalInt(oStation, DCS_VAR_OFFSET_CURRENT);
}

/******************************************************************************/

int DCS_GetRecipeNumber(int iPosition = -1)
{
    int iNum = GetLocalInt(OBJECT_SELF, DCS_VAR_RECIPE_NUMBER);
    if(!iNum)
    {
        if(iPosition  == -1) iPosition = DCS_GetMinorInt();

        int iOffsetValue = DCS_GetFullOffsetValue();
        int iMenuPage    = DCS_GetMenupage();
        int iMenuCounter = DCS_TOKEN_PER_PAGE_MENU * (iMenuPage - 1);

        if(iMenuCounter < 0)iMenuCounter = 0;

        iNum = iMenuCounter + iPosition + iOffsetValue;
    }

    return iNum;
}

/******************************************************************************/
/******************************************************************************/

void DCS_SetEnchantingMode(int iStatus)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_MODE_ENCHANTING, iStatus);
}

/******************************************************************************/

int DCS_GetEnchantingMode(int nByRecipeType=TRUE, string sSingleType="")
{
    if(nByRecipeType)
    {
        string sRecipeType = DCS_GetRecipeType();
        return (sSingleType == "" && (sRecipeType == DCS_ID_ENCHANTING_ELEMENTAL || sRecipeType == DCS_ID_ENCHANTING_MAGICAL)) ||
               (sSingleType == sRecipeType);
    }

    return GetLocalInt(OBJECT_SELF, DCS_VAR_MODE_ENCHANTING);
}

/******************************************************************************/

int DCS_GetDisenchantingMode()
{
    return DCS_GetRecipeType() == DCS_ID_ENCHANTING_DISENCHANT;
}

/******************************************************************************/

int DCS_GetGemBindingMode()
{
    return DCS_GetRecipeType() == DCS_ID_GOLDSMITH_BIND;
}

/******************************************************************************/

string DCS_GetRecipeType(int iNum=-1, int bStore=TRUE)
{
    string Type = GetLocalString(OBJECT_SELF, DCS_VAR_RECIPE_TYPE);

    if(Type == "")
    {
        if(iNum == -1)iNum = DCS_GetMainInt();

        Type = DCS_GetRecipeEntry(DCS_COL_RECIPE_TYPE, DCS_GetRecipeID(iNum, DCS_GetMainRecipeType()));
        /*
        switch(DCS_GetCraftingProfession())
        {
            case DCS_PROFESSION_ALCHEMIST:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_ALCHEMY_POTION;break;
                    case 2: Type=DCS_ID_ALCHEMY_ELIXIER;break;
                    case 3: Type=DCS_ID_ALCHEMY_POISON;break;
                    case 4: Type=DCS_ID_ALCHEMY_OILS;break;
                }
            break;
            case DCS_PROFESSION_CARPENTER:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_CARPENTER_WOODWORK;break;
                    case 2: Type=DCS_ID_CARPENTER_WEAPONS;break;
                    case 3: Type=DCS_ID_CARPENTER_SHIELDS;break;
                    case 4: Type=DCS_ID_CARPENTER_AMMO;break;
                    case 5: Type=DCS_ID_CARPENTER_COMPONENTS;break;
                }
            break;
            case DCS_PROFESSION_COOK:
            break;
            case DCS_PROFESSION_ENCHANTER:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_ENCHANTING_DISENCHANT;break;
                    case 2: Type=DCS_ID_ENCHANTING_ELEMENTAL;break;
                    case 3: Type=DCS_ID_ENCHANTING_MAGICAL;break;
                    case 4: Type=DCS_ID_ENCHANTING_OTHER;break;
                }
            break;
            case DCS_PROFESSION_ENGINEER:
            break;
            case DCS_PROFESSION_GOLDSMITH:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_GOLDSMITH_CUT;break;
                    case 2: Type=DCS_ID_GOLDSMITH_POLISH;break;
                    case 3: Type=DCS_ID_GOLDSMITH_BIND;break;
                    case 4: Type=DCS_ID_GOLDSMITH_JEW;break;
                    case 5: Type=DCS_ID_GOLDSMITH_COMPONENTS;break;
                 }
            break;
            case DCS_PROFESSION_SCRIBER:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_SCRIBING_SCROLLS;break;
                    case 2: Type=DCS_ID_SCRIBING_EPIC_SCROLLS;break;
                }
            break;
            case DCS_PROFESSION_SMELTER:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_SMELTING_ORE;break;
                    case 2: Type=DCS_ID_SMELTING_COMPONENTS;break;
                }
            break;
            case DCS_PROFESSION_SMITH:
                switch(iNum)
                {
                    case 1: Type=DCS_ID_SMITHING_ARMORS;break;
                    case 2: Type=DCS_ID_SMITHING_WEAPONS;break;
                    case 3: Type=DCS_ID_SMITHING_RANGEDWEAPONS;break;
                    case 4: Type=DCS_ID_SMITHING_COMPONENTS;break;
                }
            break;
            case DCS_PROFESSION_TAILOR:
            break;
            case DCS_PROFESSION_TANNER:
            break;

        }
        */

        if(bStore)
        SetLocalString(OBJECT_SELF, DCS_VAR_RECIPE_TYPE, Type);
    }
    return Type;
}

/******************************************************************************/

string DCS_GetMainRecipeType(int iProf=-1, int bStore=TRUE)
{
    string Type = GetLocalString(OBJECT_SELF, DCS_VAR_MAIN_RECIPE_TYPE);

    if(Type == "")
    {
        if(iProf == -1) iProf = DCS_GetCraftingProfession();
        switch(iProf)
        {
            case DCS_PROFESSION_ALCHEMIST: Type = DCS_MAINID_ALCHEMY;break;
            case DCS_PROFESSION_CARPENTER: Type = DCS_MAINID_CARPENTING;break;
            case DCS_PROFESSION_COOK:      Type = DCS_MAINID_COOKING;break;
            case DCS_PROFESSION_ENCHANTER: Type = DCS_MAINID_ENCHANTING;break;
            case DCS_PROFESSION_ENGINEER:  Type = DCS_MAINID_ENGINEERING;break;
            case DCS_PROFESSION_GOLDSMITH: Type = DCS_MAINID_GOLDSMITH;break;
            case DCS_PROFESSION_SCRIBER:   Type = DCS_MAINID_SCRIBING;break;
            case DCS_PROFESSION_SMELTER:   Type = DCS_MAINID_SMELTING;break;
            case DCS_PROFESSION_SMITH:     Type = DCS_MAINID_SMITHING;break;
            case DCS_PROFESSION_TAILOR:    Type = DCS_MAINID_TAILORING;break;
            case DCS_PROFESSION_TANNER:    Type = DCS_MAINID_TANNING;break;
        }

        if(bStore)
        SetLocalString(OBJECT_SELF, DCS_VAR_MAIN_RECIPE_TYPE, Type);
    }
    return Type;
}

/******************************************************************************/

string DCS_GetRecipeID(int iRecipeNumber=0, string sRecipeType="")
{
    string sRecipeID = GetLocalString(OBJECT_SELF, DCS_VAR_RECIPE_ID);

    if(sRecipeID == "")
    {
        if(iRecipeNumber == 0) iRecipeNumber = DCS_GetRecipeNumber();
        if(sRecipeType   == "")sRecipeType   = DCS_GetRecipeType();

        return sRecipeType + inStr(iRecipeNumber);
    }

    return sRecipeID;
}

/******************************************************************************/

void DCS_AssignPreviousRecipe(object oPC, object oStation=OBJECT_SELF)
{
    string sPrevRecipeID = GetLocalString(oPC, DCS_VAR_PREVIOUS_RECIPE_ID);
    string sPrevStation  = GetLocalString(oPC, DCS_VAR_PREVIOUS_STATION_RESREF);
    string sRecipeNum    = GetSubString(sPrevRecipeID, DCS_RECIPE_ID_LENGTH, GetStringLength(sPrevRecipeID)-DCS_RECIPE_ID_LENGTH);
    int    iLen          = GetStringLength(sRecipeNum);
    int    iPos, iMenuCounter;

    // Saving the recipe type
    SetLocalString(oStation, DCS_VAR_RECIPE_TYPE, GetStringLeft(sPrevRecipeID, DCS_RECIPE_ID_LENGTH));
    AdvDebug(oPC, "Prev ID: "+sPrevRecipeID+", Recipenum: "+sRecipeNum+", len: "+inStr(iLen)+", left: "+GetStringLeft(sPrevRecipeID, DCS_RECIPE_ID_LENGTH)+", RecipeType: "+DCS_GetRecipeType());

    if(iLen == 1)
    {
        iMenuCounter = DCS_GetMenuCounter();
        DCS_SetMinorInt(stInt(sRecipeNum));
        AdvDebug(oPC, "Minor Int: "+inStr(DCS_GetMinorInt())+", Recipenum: "+inStr(DCS_GetRecipeNumber())+", Recipeid: "+DCS_GetRecipeID());
    }
    else
    {
        for(iPos = 2; iPos <= iLen; iPos++)
        {
            iMenuCounter = DCS_GetMenuCounter();
            DCS_SetCurrentMenu(DCS_GetCurrentMenu() + 1);
            DCS_SetMinorInt(stInt(GetSubStringRight(sRecipeNum, iPos, 1)));
            AdvDebug(oPC, "Minor Int: "+inStr(DCS_GetMinorInt())+", Recipenum: "+inStr(DCS_GetRecipeNumber())+", Recipeid: "+DCS_GetRecipeID());
        }

        iMenuCounter = DCS_GetMenuCounter();
        DCS_SetCurrentMenu(DCS_GetCurrentMenu() + 1);
        DCS_SetMinorInt(stInt(GetStringRight(sRecipeNum, 2)));
        AdvDebug(oPC, "Menu Counter: "+inStr(iMenuCounter)+", CurrentMenu: "+inStr(DCS_GetCurrentMenu()));
    }
}


/******************************************************************************/

void DCS_DeletePreviousRecipe(object oPC)
{
    DeleteLocalString(oPC, DCS_VAR_PREVIOUS_RECIPE_ID);
    DeleteLocalString(oPC, DCS_VAR_PREVIOUS_STATION_RESREF);
}

/******************************************************************************/

string DCS_GetPreviousRecipe(object oPC, object oStation=OBJECT_SELF)
{
    string sPrevRecipeID = GetLocalString(oPC, DCS_VAR_PREVIOUS_RECIPE_ID);
    string sPrevStation  = GetLocalString(oPC, DCS_VAR_PREVIOUS_STATION_RESREF);

    if(sPrevRecipeID == "" || sPrevStation == "" || GetResRef(oStation) != sPrevStation)
    return "";

    return sPrevRecipeID;
}

/******************************************************************************/
/******************************************************************************/

void DCS_CleanListEntries(object oStation=OBJECT_SELF, int iMax=DCS_TOKEN_PER_PAGE_MENU)
{
    int i;
    string sI;

    for(i=1; i <= iMax; i++)
    {
        sI = inStr(i);
        DeleteLocalString(oStation, DCS_VAR_LIST_COLOR       + sI);
        DeleteLocalString(oStation, DCS_VAR_LIST_ENTRY       + sI);
        DeleteLocalObject(oStation, DCS_VAR_LIST_OBJECT      + sI);
        DeleteLocalString(oStation, DCS_VAR_LIST_OFFSET      + sI);
        DeleteLocalString(oStation, DCS_VAR_EXPERIMENT_ENTRY + sI);
    }

    DeleteLocalInt(oStation, DCS_VAR_LIST_PREV);
    DeleteLocalInt(oStation, DCS_VAR_LIST_NEXT);
    DeleteLocalInt(oStation, DCS_VAR_LIST_POSITION);
}

/******************************************************************************/

int DCS_GetCompliesSingleCondition(int iCondition)
{
    switch(iCondition)
    {
        case DCS_CONDITION_SMITH_FORGE:
            return DCS_GetIsForgeActivated(DCS_GetAnvilForge(OBJECT_SELF)) == 1;break;
        case DCS_CONDITION_GOLDSMITH_FORGE:
            return DCS_GetIsForgeActivated(DCS_GetAnvilForge(OBJECT_SELF)) > 1;break;// we need another forge here
        case DCS_CONDITION_GOLDSMITH_TABLE:
            return GetTag(OBJECT_SELF) == DCS_STATION_GOLDSMITH_TABLE;break;
        case DCS_CONDITION_GOLDSMITH_BASIN:
            return GetTag(OBJECT_SELF) == DCS_STATION_GOLDSMITH_BASIN;break;
        case DCS_CONDITION_CARPENTER_SAWHORSE:
            return GetTag(OBJECT_SELF) == DCS_STATION_CARP_SAW;break;
        case DCS_CONDITION_CARPENTER_TABLE:
            return GetTag(OBJECT_SELF) == DCS_STATION_CARP_BANK;break;
    }

    return TRUE;
}

/******************************************************************************/

int DCS_GetCompliesConditions(int iConditions)
{
    int iReturn = iConditions;
    int iMulti, iBitAnd;

    for(iMulti = 1; iMulti <= iConditions; iMulti *= 2)
    {
        iBitAnd = iConditions & iMulti;

        if(iBitAnd == iMulti && DCS_GetCompliesSingleCondition(iMulti))
         iReturn -= iMulti;
     }

    return iReturn == 0;
}

/******************************************************************************/

int DCS_GetEntryShown(object oPC, int iLevel, int iRank, int iSpecial, int iCondition, string sIsExtra, string sRecipeID, int iProf=-1)
{
    if(iProf == -1)
    iProf = DCS_GetCraftingProfession();

    int iInfoMode      = DCS_GetInformationMode(oPC);
    int iProfLevel     = DCS_GetProfessionLevel(oPC, iProf);
    int iProfRank      = DCS_GetProfessionRank(oPC, iProf);
    int iProfSpec      = DCS_GetProfessionSpecialisation(oPC, iProf);
    int iRecipeLearned = TRUE;

    if(sIsExtra != "")
    iRecipeLearned = DCS_GetHasLearnedRecipe(oPC, sIsExtra, iProf);
    iSpecial       = iSpecial   == iProfSpec || !iSpecial;
    iLevel         = iProfLevel >= iLevel;
    iRank          = iProfRank  >= iRank;

    return iRecipeLearned && iLevel && iRank && iSpecial && (DCS_GetCompliesConditions(iCondition) || iInfoMode);
}

/******************************************************************************/

string DCS_GetEntry(int nMenupage, int nPosition, int nEntryType=DCS_ENTRY_TYPE_DEFAULT)
{
    object oStation = OBJECT_SELF;
    object oPC      = DCS_GetCraftingPlayer();
    int    iLevel, iRank, iSpecial, iCondition, iNumPos;
    string sRecipeID, sIsExtra, sEntry;

    AdvDebug(oPC, "nPosition: "+inStr(nPosition)+", nEntryType: "+inStr(nEntryType));

    if(nEntryType == DCS_ENTRY_TYPE_DEFAULT)
    {
        sRecipeID  = DCS_GetRecipeID(DCS_GetRecipeNumber(nPosition));
        sEntry     = DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sRecipeID);
        sIsExtra   = DCS_GetRecipeEntry(DCS_COL_RECIPE_IS_EXTRA, sRecipeID);
        iLevel     = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_LEVEL, sRecipeID);
        iRank      = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_RANK, sRecipeID);
        iCondition = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_CONDITION, sRecipeID);
        iSpecial   = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_SPECIAL, sRecipeID);

        AdvDebug(oPC, "Default // RecipeID: "+sRecipeID+", rType: "+DCS_GetRecipeType()+", sEntry: "+sEntry+", iLevel: "+inStr(iLevel)+", iRank: "+inStr(iRank)+", Extra: "+sIsExtra);
    }
    else if(nEntryType == DCS_ENTRY_TYPE_MAINMENU)
    {
        sRecipeID  = DCS_GetRecipeID(nPosition, DCS_GetMainRecipeType());
        sEntry     = DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sRecipeID);
        iLevel     = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_LEVEL, sRecipeID);
        iRank      = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_RANK, sRecipeID);
        iCondition = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_CONDITION, sRecipeID);

        AdvDebug(oPC, "Main // RecipeID: "+sRecipeID+", Level: "+inStr(iLevel)+", Rank: "+inStr(iRank)+", sEntry: "+sEntry+", iCondition: "+inStr(iCondition));
    }
    else if(nEntryType == DCS_ENTRY_TYPE_TITLE)
    {
        if(DCS_GetChooseItemMode() == DCS_MODE_CHOOSE_GEM)
        {
            sRecipeID = DCS_GetRecipeID(-98);
            sEntry    = DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sRecipeID);
            AdvDebug(oPC, "Titel: Choose Gem Mode // sEntry: "+sEntry+", sRecipeID: "+sRecipeID);
        }
        else
        {
            iNumPos   = DCS_GetRecipeNumber(nPosition);
            sRecipeID = DCS_GetRecipeID(stInt("-99"+inStr(iNumPos >= 10 ? DCS_GetOffsetValue(1) : iNumPos)));
            sEntry    = DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sRecipeID);
            AdvDebug(oPC, "Titel // nPos: "+inStr(nPosition)+", iNumPos: "+inStr(iNumPos)+", rID: "+sRecipeID+", rType: "+DCS_GetRecipeType()+", sEntry: "+sEntry);
        }
    }

    //AdvDebug(oPC, "------------------------------------------------");

    // Return string to skip this entry
    if(!GetIsDM(oPC) && !DCS_GetEntryShown(oPC, iLevel, iRank, iSpecial, iCondition, sIsExtra, sRecipeID))
    return DCS_TOKEN_SKIP;

    return sEntry;
}

/******************************************************************************/

string DCS_GetToken(int nTokenType, int nToken)
{
    // Convert nToken to a normal number, if its not the source-token
    if(nToken > DCS_TOKEN_MENU_SOURCE)
    nToken -= DCS_TOKEN_MENU_SOURCE;

    // Get main menu entries
    if(nTokenType == DCS_TOKENTYPE_MAINPAGE)
    return DCS_GetEntry(nTokenType, nToken, DCS_ENTRY_TYPE_MAINMENU);

    // Get menu titles
    else if(nTokenType == DCS_TOKENTYPE_GETTITLE)
    return DCS_GetEntry(nTokenType, nToken, DCS_ENTRY_TYPE_TITLE);

    // Get menu entries
    else
    return DCS_GetEntry(nTokenType, nToken);
}

/******************************************************************************/
/******************************************************************************/

int DCS_GetMenuCounter()
{
    int iClicked     = DCS_GetMinorInt();
    int iMenusize    = DCS_GetMenuSize();
    int iMenupage    = DCS_GetMenupage();
    int iCurrentMenu = DCS_GetCurrentMenu() + 1;
    int iReturn;

    // Enable "Previous Page" selection
    if(iCurrentMenu > 1)
    SetLocalInt(OBJECT_SELF, DCS_VAR_LIST_PREV, TRUE);

    if(iMenupage == 0)
    {
        if(iCurrentMenu >= iMenusize)
        DCS_SetMenupage(1);

        // This is to pretend saving the first call of this script in the offsets
        // (In this case offset 0)
        if(iCurrentMenu > 1 || iMenusize <= 0)
        {
            DCS_SetOffsetValue(iCurrentMenu-1, iClicked);
            DCS_SetCurrentOffsetValue(iClicked);
        }

        return 1;
    }

    return (iMenupage - 1) * DCS_TOKEN_PER_PAGE_MENU + 1;
}

/******************************************************************************/
/******************************************************************************/

void DCS_SetMenuSize(int iSize)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_MENUS_COUNT, iSize);
}

/******************************************************************************/

int DCS_GetMenuSize()
{
    object oStation = OBJECT_SELF;
    int    iSize    = GetLocalInt(oStation, DCS_VAR_MENUS_COUNT);

    if(!iSize)
    {
        iSize = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_MENUTEXT, DCS_GetRecipeID(-2));
        DCS_SetMenuSize(iSize);
    }

    return iSize;
}


//void main(){}
