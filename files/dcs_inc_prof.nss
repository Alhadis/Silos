#include "dcs_inc_database"
#include "dcs_inc_itemprop"

// *  Contains oPC's data about iProfession
struct DCS_PCData GetProfessionData(object oPC, int iProfession, int AccessDB=FALSE);

// *  This function checks, if iProfession is listed in the dcs_data entry from oPC,
// *  but oPC isn't listed in the profession specific table.
// *  If that's the case, the function will rewrite oPC into the profession specific column
void DCS_CheckPlayerProfession(object oPC, int iProfession);

// *  Gives iXP to oPlayer, integrating level up, etc.
// *  NOTE: if iProfession is -1, the function will use the current crafting profession
// *        from the function DCS_GetCraftingProfession();
void DCS_GiveXPToPlayer(object oPlayer, int iXPGain, int iProfession=-1);

// *  Adds a new RecipeID to the list of special recipes oPC has already learned
void DCS_LearnRecipe(object oPC, string sRecipeID, int iProfession);

// *  Remove first or Second Profession from oPC
// *  - iProfession: DCS_PROFESSION_*, Alt: 1 or 2
// *  - OnError: iProfession = 1
void DCS_RemoveProfession(object oPC, int iProfNum);

// *  Removes all profession related feats from oPC's Skin
void DCS_RemoveProfessionFeats(object oPC);

// *  Set iProfession to OBJECT_SELF as the current Crafting Profession
void DCS_SetCraftingProfession(int iProfession);

// *  Sets the the first or the second profession of PC to iProfession
// *  NOTE: If oPC already has 2 Professions then this function will do nothing
void DCS_SetPlayerProfession(object oPC, int iProfession);

// *  Sets the Rank of the first or second Profession [ProfessionNo] to NewRank
void DCS_SetProfessionRank(object oPC, int iProfession, int NewRank);

// *  Sets the Level of the first or second Profession [ProfessionNo] to NewLevel
void DCS_SetProfessionLevel(object oPC, int iProfession, int NewLevel);

// *  Sets current specialisation in iProfession to iNewSpecial
void DCS_SetProfessionSpecialisation(object oPC, int iProfession, int iNewSpecial);

// *  Sets the XP of the first or second Profession [ProfessionNo] to NewXP
void DCS_SetProfessionXP(object oPC, int iProfession, int NewXP);

void DCS_SetRecipeTypeXP(object oPC, string sRecipeType, int iXP, int iLocked=FALSE, int iLockDur=0, string sTable=DCS_TABLE_CRAFTING_LOCK);

// *  Stores XP gained from last recipe
void DCS_SetXPGained(int iValue, object oStation=OBJECT_SELF);

// *  Updates oPC's local profession status of his iProfNum profession (first or second)
void DCS_UpdateLocalProfessionStatus(object oPC, int iProfNum=1);

// *  Updates oPC's profession feat of his iProfNum profession (first or second)
void DCS_UpdateProfessionFeat(object oPC, int iProfNum=1);

// *  Returns current profession that is used by the Crafting-Station (OBJECT_SELF)
// *  - iStored: if this is TRUE, the script will access the stations stored profession
// *             variable, instead of reading it from its tag
// *  NOTE: This function will return valid values while an object is accessing a crafting
// *        station only! If a station has no variable stored, the function will search
// *        for a number in the stations tag an store it on the station
int DCS_GetCraftingProfession(int iStored=TRUE, object oStation=OBJECT_SELF);

// *  Returns TRUE, if oPC has learned the special recipe with sRecipeID in iProfession
int DCS_GetHasLearnedRecipe(object oPC, string sRecipeID, int iProfession, int AccessDB=FALSE);

// *  Returns TRUE, if oPC has already learned iProfession
// *   - iCheck: Put in these values for different functions
// *     x  0: Check, if oPC has got one profession or more
// *     x -1: Check, if oPC has got 2 professions
// *     x >0: Check, if oPC learned this profession
// *   - AccessDB: should the script access the database or local vars to check oPC's profession status?
int DCS_GetHasProfession(object oPC, int iCheck=0, int AccessDB=FALSE);

// *  Returns the next xp-limit for iCurrentLevel
int DCS_GetNextXPLimit(int iCurrentLevel);

// *  Get Profession from Database by ProfessionNumber
// *  - ProfessionNumber needs to be between 1 and 2, otherwise 1 will be used
int DCS_GetProfession(object oPC, int iNthProfession=1, int AccessDB=FALSE);

// *  Returns the matching profession from sRecipeID
int DCS_GetProfessionFromRecipe(string sRecipeID);

// *  Get the actual Level of iProfession
int DCS_GetProfessionLevel(object oPC, int Profession, int AccessDB=FALSE);

// *  Get the actual Rank of iProfession
int DCS_GetProfessionRank(object oPC, int Profession, int AccessDB=FALSE);

int DCS_GetRecipeTypeLocked(object oPC, string sRecipeType, string sTable=DCS_TABLE_CRAFTING_LOCK);

int DCS_GetRecipeTypeXP(object oPC, string sRecipeType, string sTable=DCS_TABLE_CRAFTING_LOCK);

// * Get the slot number of iProfession from oPC (first or second)
int DCS_GetSlotFromProfession(object oPC, int iProfession, int AccessDB=FALSE);

// *  Returns the specialisation that oPC has currently in iProfession
int DCS_GetProfessionSpecialisation(object oPC, int iProfession, int AccessDB=FALSE);

// *  Get the actual XP of iProfession
int DCS_GetProfessionXP(object oPC, int Profession, int AccessDB=FALSE);

// *  Returns the amount of XP oPC needs for a level-up in iProfession
int DCS_GetXPNeededForNextLevel(object oPC, int iProfession);

// *  Returns the amount of XP that the crafting player will gain after a crafting attempt
int DCS_GetXPGained(object oStation=OBJECT_SELF);

// *  Returns all special recipes oPC has currently learned in iProfession
string DCS_GetLearnedRecipes(object oPC, int iProfession, int AccessDB=FALSE);

string DCS_GetRecipeTypeTimeLeft(object oPC, string sRecipeType, string sTable=DCS_TABLE_CRAFTING_LOCK);

/******************************************************************************/
/*                              Implementation                                */
/******************************************************************************/

void DCS_SetCraftingProfession(int iProfession)
{
    SetLocalInt(OBJECT_SELF, "DCS_Profession", iProfession);
}

/******************************************************************************/

int DCS_GetCraftingProfession(int iStored=TRUE, object oStation=OBJECT_SELF)
{
    if(iStored)
    {
        int iLocal = GetLocalInt(oStation, "DCS_Profession");

        if(!iLocal)
        {
            iLocal = DCS_GetCraftingProfession(FALSE, oStation);
            SetLocalInt(oStation, "DCS_Profession", iLocal);
        }

        return iLocal;
    }

    string Tag = GetTag(oStation);
    string Num = GetStringRight(Tag, 2);

    if(StringToInt(GetStringLeft(Num, 1)) == 0)
    return stInt(GetStringRight(Tag, 1));

    return stInt(Num);
}

/******************************************************************************/
/*                            Experience functions                            */
/******************************************************************************/

void DCS_SetRecipeTypeXP(object oPC, string sRecipeType, int iXP, int iLocked=FALSE, int iLockDur=0, string sTable=DCS_TABLE_CRAFTING_LOCK)
{
    string sAccount   = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sName      = SQLEncodeSpecialChars(GetName(oPC));
    string sPlayerID  = PlayerIDColumn(oPC, DCS_COL_CLOCK_ACCOUNT, DCS_COL_CLOCK_CHARACTER)+" and "+Col(DCS_COL_CLOCK_RECIPETYPE, sRecipeType);
    string sTimestamp = SQLGetTimestamp();
    string sLockDur;

    if(iLocked) sLockDur = iLockDur == 0 ? DCS_SQLGetDatabaseSettingString(DCS_COL_SETTING_DENCHANT_LOCKDUR) : inStr(iLockDur);

    SQLExecDirect("select * from "+sTable+sPlayerID);

    if(SQLFetch())
    {
        SQLExecDirect("update "+sTable+" set "+DCS_COL_CLOCK_XP+"="+inStr(iXP)+", "+DCS_COL_CLOCK_TIMESTAMP+"='"+sTimestamp+"'"+(iLocked ? ","+Col(DCS_COL_CLOCK_LOCKED,"", iLocked)+", "+Col(DCS_COL_CLOCK_DURATION, sLockDur) : "")+sPlayerID);
    }
    else
    {
        if(iLocked)
            SQLExecDirect("insert into "+sTable+" ("+DCS_COL_CLOCK_ACCOUNT+","+DCS_COL_CLOCK_CHARACTER+","+DCS_COL_CLOCK_RECIPETYPE+","+DCS_COL_CLOCK_XP+","+DCS_COL_CLOCK_LOCKED+","+DCS_COL_CLOCK_DURATION+","+DCS_COL_CLOCK_TIMESTAMP+") values ('"+sAccount+"','"+sName+"','"+sRecipeType+"','"+inStr(iXP)+"','"+inStr(iLocked)+"','"+sLockDur+"','"+sTimestamp+"')");
        else
            SQLExecDirect("insert into "+sTable+" ("+DCS_COL_CLOCK_ACCOUNT+","+DCS_COL_CLOCK_CHARACTER+","+DCS_COL_CLOCK_RECIPETYPE+","+DCS_COL_CLOCK_XP+","+DCS_COL_CLOCK_TIMESTAMP+") values ('"+sAccount+"','"+sName+"','"+sRecipeType+"','"+inStr(iXP)+"','"+sTimestamp+"')");
    }
}

/******************************************************************************/

int DCS_GetRecipeTypeXP(object oPC, string sRecipeType, string sTable=DCS_TABLE_CRAFTING_LOCK)
{
    string sPlayerID = PlayerIDColumn(oPC, DCS_COL_CLOCK_ACCOUNT, DCS_COL_CLOCK_CHARACTER)+" and "+Col(DCS_COL_CLOCK_RECIPETYPE, sRecipeType);

    SQLExecDirect("select "+DCS_COL_CLOCK_TIMESTAMP+","+DCS_COL_CLOCK_XP+" from "+sTable+sPlayerID);

    if(SQLFetch())
    {
        string sTime = SQLGetData(1);
        int    iXP   = SQLGetDataInt(2);

        if(DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_DENCHANT_LOCKDUR) - SQLGetTimestampDiff(sTime) <= 0)
        {
            SQLExecDirect("delete from "+sTable+sPlayerID);
            return 0;
        }

        return iXP;
    }

    return 0;
}

/******************************************************************************/

string DCS_GetRecipeTypeTimeLeft(object oPC, string sRecipeType, string sTable=DCS_TABLE_CRAFTING_LOCK)
{
    string sPlayerID = PlayerIDColumn(oPC, DCS_COL_CLOCK_ACCOUNT, DCS_COL_CLOCK_CHARACTER)+" and "+Col(DCS_COL_CLOCK_RECIPETYPE, sRecipeType);

    SQLExecDirect("select "+DCS_COL_CLOCK_DURATION+","+DCS_COL_CLOCK_TIMESTAMP+" from "+sTable+sPlayerID);

    if(SQLFetch())
    {
        float  fDuration  = stFloat(SQLGetData(1));
        string sTimestamp = SQLGetData(2);

        return DCS_GetTimeLeft(oPC, fDuration, sTimestamp);
    }

    return "";
}

/******************************************************************************/

int DCS_GetRecipeTypeLocked(object oPC, string sRecipeType, string sTable=DCS_TABLE_CRAFTING_LOCK)
{
    string sPlayerID = PlayerIDColumn(oPC, DCS_COL_CLOCK_ACCOUNT, DCS_COL_CLOCK_CHARACTER)+" and "+Col(DCS_COL_CLOCK_RECIPETYPE, sRecipeType);

    SQLExecDirect("select "+DCS_COL_CLOCK_LOCKED+","+DCS_COL_CLOCK_DURATION+","+DCS_COL_CLOCK_TIMESTAMP+" from "+sTable+sPlayerID);

    if(SQLFetch())
    {
        if(SQLGetDataInt(1))
        {
            if(SQLGetDataInt(2) - SQLGetTimestampDiff(SQLGetData(3)) <= 0)
            {
                SQLExecDirect("delete from "+sTable+sPlayerID);
                return FALSE;
            }

            return TRUE;
        }

        return FALSE;
    }

    return FALSE;
}

/******************************************************************************/

void DCS_SetXPGained(int iValue, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, "DCS_XPGained", iValue);
}

/******************************************************************************/

int DCS_GetXPGained(object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, "DCS_XPGained");
}

/************************************************************************** ****/

int DCS_GetNextXPLimit(int iCurrentLevel)
{
    int iXPBase = DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_XP_BASE);

    if(iCurrentLevel == DCS_SETTING_MAXIMUM_LEVEL)
    return flInt(iXPBase * (DCS_SETTING_MAXIMUM_LEVEL * (DCS_SETTING_MAXIMUM_LEVEL - 1) / 3.0));

    return flInt(iXPBase * (iCurrentLevel * (iCurrentLevel + 1) / 3.0));
}

/******************************************************************************/

int DCS_GetXPNeededForNextLevel(object oPC, int iProfession)
{
    int iLevel = DCS_GetProfessionLevel(oPC, iProfession);
    int iXP    = DCS_GetProfessionXP(oPC, iProfession);

    if(iLevel == DCS_SETTING_MAXIMUM_LEVEL)
    return 0;

    return DCS_GetNextXPLimit(iLevel) - iXP;
}

/******************************************************************************/

void DCS_GiveXPToPlayer(object oPlayer, int iXPGain, int iProfession=-1)
{
    if(!GetIsPC(oPlayer) || iXPGain <= 0)return;
    if(iProfession == -1)iProfession = DCS_GetCraftingProfession();

    int iXPAboveLev = DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_XP_ABOVE_LEVEL);
    int iXP         = DCS_GetProfessionXP(oPlayer, iProfession);
    int iLevel      = DCS_GetProfessionLevel(oPlayer, iProfession);
    int iLimit      = DCS_GetNextXPLimit(iLevel);

    iXPGain += iXP;

    if(iXPGain > iXP)
    {
        // oPC reached the maximum XP limit included xp above the levelup
        if(iXPGain > iLimit + iXPAboveLev)
        iXPGain = iLimit + iXPAboveLev;

        // Changing XP to new value (if crafting was a success) and oPC didn't reach the maximum Level
        // Otherwise it will stay at it's current value
        if(iLevel < DCS_SETTING_MAXIMUM_LEVEL)
        DCS_SetProfessionXP(oPlayer, iProfession, iXPGain);

        // Telling the PC he may do a level up after gaining xp
        if(iXP < iLimit && iXPGain >= iLimit)
        {
            DCS_Display(oPlayer, ColorText(DCS_TEXT_LEVEL_UP, nwcOrange), TRUE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_SND_LEVEL_UP), oPlayer);
        }
    }
}

/******************************************************************************/
/*                            Structure definition                            */
/******************************************************************************/

struct DCS_PCData GetProfessionData(object oPC, int iProfession, int AccessDB=FALSE)
{
    struct DCS_PCData Def;

    Def.First  = DCS_GetProfession(oPC, 1, AccessDB);
    Def.Second = DCS_GetProfession(oPC, 2, AccessDB);
    Def.Level  = DCS_GetProfessionLevel(oPC, iProfession, AccessDB);
    Def.XP     = DCS_GetProfessionXP(oPC, iProfession, AccessDB);
    Def.Rank   = DCS_GetProfessionRank(oPC, iProfession, AccessDB);
    Def.Name   = DCS_GetProfessionName(iProfession);

    return Def;
}

/******************************************************************************/
/*                            Profession functions                            */
/******************************************************************************/

int DCS_GetProfession(object oPC, int iNthProfession=1, int AccessDB=FALSE)
{
    if(iNthProfession <= 0) return 0;

    if(AccessDB)
    {
        string Account   = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
        string Character = SQLEncodeSpecialChars(GetName(oPC));
        string Column    = DCS_COL_DB_PROFESSION+inStr(iNthProfession);

        SQLExecDirect("select "+Column+" from "+DCS_TABLE_DATA+" where "+DCS_COL_DB_ACCNAME+"='"+Account+"' and "+DCS_COL_DB_CHARNAME+"='"+Character+"'");

        if(SQLFetch())
        {
            return stInt(SQLGetData(1));
        }

        return 0;
    }

    return GetLocalInt(oPC, DCS_COL_PROF+inStr(iNthProfession));
}

/******************************************************************************/

int DCS_GetHasProfession(object oPC, int iCheck=0, int AccessDB=FALSE)
{
    if(iCheck == 0)
    {
        return DCS_GetProfession(oPC, 1, AccessDB) > 0 ||
               DCS_GetProfession(oPC, 2, AccessDB) > 0;
    }
    else if(iCheck <= -1)
    {
        return DCS_GetProfession(oPC, 1, AccessDB) > 0 &&
               DCS_GetProfession(oPC, 2, AccessDB) > 0;
    }

    return DCS_GetProfession(oPC, 1, AccessDB) == iCheck ||
           DCS_GetProfession(oPC, 2, AccessDB) == iCheck;
}

/******************************************************************************/

int GetEmptyProfessionSlot(object oPC)
{
    if(DCS_GetProfession(oPC, 1) == 0) return 1;
    if(DCS_GetProfession(oPC, 2) == 0) return 2;

    return 0;
}

/******************************************************************************/

int DCS_GetSlotFromProfession(object oPC, int iProfession, int AccessDB=FALSE)
{
    if(iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return 0;

    if(DCS_GetProfession(oPC, 1, AccessDB) == iProfession) return 1;
    if(DCS_GetProfession(oPC, 2, AccessDB) == iProfession) return 2;

    return 0;
}

/******************************************************************************/

void DCS_SetPlayerProfession(object oPC, int iProfession)
{
    if(DCS_GetHasProfession(oPC, -1) || DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return;

    object oSkin       = SKIN_SupportGetSkin(oPC);
    int    iSlot       = GetEmptyProfessionSlot(oPC);
    string sAccount    = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sCharacter  = SQLEncodeSpecialChars(GetName(oPC));
    string sProfession = inStr(iProfession);
    string sColumn     = DCS_COL_DB_PROFESSION+inStr(iSlot);
    string sTable      = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

    SQLExecDirect("update "+DCS_TABLE_DATA+" set "+Col(sColumn, sProfession)+PlayerIDColumn(oPC));
    SQLExecDirect("insert into "+sTable+" ("+DCS_COL_DB_ACCNAME+","+DCS_COL_DB_CHARNAME+", "+DCS_COL_DB_SPECIALISATION+") values ('"+sAccount+"','"+sCharacter+"', '"+sProfession+"')");

       SetLocalInt(oPC, DCS_COL_PROF        +inStr(iSlot), iProfession);
    SetLocalString(oPC, DCS_COL_PROF_NAME   +inStr(iSlot), DCS_GetProfessionName(iProfession));

       SetLocalInt(oPC, DCS_COL_PROF_LEVEL  +sProfession, 1);
       SetLocalInt(oPC, DCS_COL_PROF_XP     +sProfession, 0);
       SetLocalInt(oPC, DCS_COL_PROF_RANK   +sProfession, DCS_RANK_NOVICE);
       SetLocalInt(oPC, DCS_COL_PROF_SPEC   +sProfession, iProfession);
    SetLocalString(oPC, DCS_COL_PROF_NAME   +sProfession, DCS_GetProfessionName(iProfession));

       SetLocalInt(oPC, DCS_COL_PROF_SUCCESSCHANCE +sProfession, 0);
       SetLocalInt(oPC, DCS_COL_PROF_EXPMCHANCE    +sProfession, 0);
       SetLocalInt(oPC, DCS_COL_PROF_EXPMPOINTS    +sProfession, 0);

    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyBonusFeat(DCS_PROFESSION_RADIAL_BASE+iProfession), oSkin, 56000.0);
}

/******************************************************************************/

void DCS_CheckPlayerProfession(object oPC, int iProfession)
{
    if(iProfession == 0)
    return;

    string sCharacter  = SQLEncodeSpecialChars(GetName(oPC));
    string sTable = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

    SQLExecDirect("select "+DCS_COL_DB_CHARNAME+" from "+sTable+" where "+DCS_COL_DB_CHARNAME+"='"+sCharacter+"'");

    if(!SQLFetch())
    {
        object oSkin       = SKIN_SupportGetSkin(oPC);
        int    iSlot       = GetEmptyProfessionSlot(oPC);
        string sAccount    = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
        string sProfession = inStr(iProfession);
        string sColumn     = DCS_COL_DB_PROFESSION+inStr(iSlot);

        SQLExecDirect("insert into "+sTable+" ("+DCS_COL_DB_ACCNAME+","+DCS_COL_DB_CHARNAME+", "+DCS_COL_DB_SPECIALISATION+") values ('"+sAccount+"','"+sCharacter+"', '"+sProfession+"')");

           SetLocalInt(oPC, DCS_COL_PROF        +inStr(iSlot), iProfession);
        SetLocalString(oPC, DCS_COL_PROF_NAME   +inStr(iSlot), DCS_GetProfessionName(iProfession));

           SetLocalInt(oPC, DCS_COL_PROF_LEVEL  +sProfession, 1);
           SetLocalInt(oPC, DCS_COL_PROF_XP     +sProfession, 0);
           SetLocalInt(oPC, DCS_COL_PROF_RANK   +sProfession, DCS_RANK_NOVICE);
           SetLocalInt(oPC, DCS_COL_PROF_SPEC   +sProfession, iProfession);
        SetLocalString(oPC, DCS_COL_PROF_NAME   +sProfession, DCS_GetProfessionName(iProfession));

           SetLocalInt(oPC, DCS_COL_PROF_SUCCESSCHANCE +sProfession, 0);
           SetLocalInt(oPC, DCS_COL_PROF_EXPMCHANCE    +sProfession, 0);
           SetLocalInt(oPC, DCS_COL_PROF_EXPMPOINTS    +sProfession, 0);

        AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyBonusFeat(DCS_PROFESSION_RADIAL_BASE+iProfession), oSkin, 56000.0);
    }
}

/******************************************************************************/

void DCS_SetProfessionXP(object oPC, int iProfession, int iNewXP)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return;

    string Table = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

    SQLExecDirect("update "+Table+" set "+Col(DCS_COL_DB_XP, "", iNewXP)+PlayerIDColumn(oPC));

    SetLocalInt(oPC, DCS_COL_PROF_XP + inStr(iProfession), iNewXP);
}

/******************************************************************************/

void DCS_SetProfessionRank(object oPC, int iProfession, int iNewRank)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return;

    string Table = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

    SQLExecDirect("update "+Table+" set "+Col(DCS_COL_DB_RANK, "", iNewRank)+PlayerIDColumn(oPC));

    SetLocalInt(oPC, DCS_COL_PROF_RANK + inStr(iProfession), iNewRank);
}

/******************************************************************************/

void DCS_SetProfessionLevel(object oPC, int iProfession, int iNewLevel)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return;

    string Table = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

    SQLExecDirect("update "+Table+" set "+Col(DCS_COL_DB_LEVEL, "", iNewLevel)+PlayerIDColumn(oPC));

    SetLocalInt(oPC, DCS_COL_PROF_LEVEL + inStr(iProfession), iNewLevel);
}

/******************************************************************************/

void DCS_SetProfessionSpecialisation(object oPC, int iProfession, int iNewSpecial)
{
    if(iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return;
    if(!DCS_GetHasProfession(oPC, iProfession)) return;

    string Account    = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string Character  = SQLEncodeSpecialChars(GetName(oPC));
    string Profession = inStr(iProfession);
    string Table      = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

    SQLExecDirect("update "+Table+" set "+DCS_COL_DB_SPECIALISATION+"='"+inStr(iNewSpecial)+"' where "+DCS_COL_DB_ACCNAME+"='"+Account+"' and "+DCS_COL_DB_CHARNAME+"='"+Character+"'");

    SetLocalInt(oPC, DCS_COL_PROF_SPEC + Profession, iNewSpecial);
}

/******************************************************************************/

int DCS_GetProfessionLevel(object oPC, int iProfession, int AccessDB=FALSE)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return 0;

    if(AccessDB)
    {
        string Table = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

        SQLExecDirect("select "+DCS_COL_DB_LEVEL+" from "+Table+PlayerIDColumn(oPC));

        if(SQLFetch())
        {
            return stInt(SQLGetData(1));
        }
    }

    return GetLocalInt(oPC, DCS_COL_PROF_LEVEL + inStr(iProfession));
}

/******************************************************************************/

int DCS_GetProfessionRank(object oPC, int iProfession, int AccessDB=FALSE)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return 0;

    if(AccessDB)
    {
        string Table = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

        SQLExecDirect("select "+DCS_COL_DB_RANK+" from "+Table+PlayerIDColumn(oPC));

        if(SQLFetch())
        {
            return stInt(SQLGetData(1));
        }
    }

    return GetLocalInt(oPC, DCS_COL_PROF_RANK + inStr(iProfession));
}

/******************************************************************************/

int DCS_GetProfessionXP(object oPC, int iProfession, int AccessDB=FALSE)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return 0;

    if(AccessDB)
    {
        string Table = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

        SQLExecDirect("select "+DCS_COL_DB_XP+" from "+Table+PlayerIDColumn(oPC));

        if(SQLFetch())
        {
            return stInt(SQLGetData(1));
        }
    }

    return GetLocalInt(oPC, DCS_COL_PROF_XP + inStr(iProfession));
}

/******************************************************************************/

int DCS_GetProfessionSpecialisation(object oPC, int iProfession, int AccessDB=FALSE)
{
    if(iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return 0;
    if(!DCS_GetHasProfession(oPC, iProfession, AccessDB)) return 0;

    string Profession = inStr(iProfession);

    if(AccessDB)
    {
        string Account    = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
        string Character  = SQLEncodeSpecialChars(GetName(oPC));
        string Table      = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

        SQLExecDirect("select "+DCS_COL_DB_SPECIALISATION+" from "+Table+" where "+DCS_COL_DB_ACCNAME+"='"+Account+"' and "+DCS_COL_DB_CHARNAME+"='"+Character+"'");

        if(SQLFetch())
        {
            return stInt(SQLGetData(1));
        }
    }

    return GetLocalInt(oPC, DCS_COL_PROF_SPEC + Profession);
}

/******************************************************************************/

void DCS_RemoveProfession(object oPC, int iProfNum)
{
    object oSkin      = SKIN_SupportGetSkin(oPC);
    int    iProf      = DCS_GetProfession(oPC, iProfNum);
    string Profession = inStr(iProf);
    string Column     = DCS_COL_DB_PROFESSION+inStr(iProfNum);
    string Table      = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProf);
    SQLExecDirect("update "+DCS_TABLE_DATA+" set "+Col(Column, "", 0)+PlayerIDColumn(oPC));
    SQLExecDirect("delete from "+Table+PlayerIDColumn(oPC));

    SetLocalString(oPC, DCS_COL_PROF_NAME   +inStr(iProfNum), "");
       SetLocalInt(oPC, DCS_COL_PROF        +inStr(iProfNum), 0);

    SetLocalString(oPC, DCS_COL_PROF_RECIPES+Profession, "");
    SetLocalString(oPC, DCS_COL_PROF_NAME   +Profession, "");
       SetLocalInt(oPC, DCS_COL_PROF_LEVEL  +Profession, 0);
       SetLocalInt(oPC, DCS_COL_PROF_XP     +Profession, 0);
       SetLocalInt(oPC, DCS_COL_PROF_RANK   +Profession, 0);
}

/******************************************************************************/

void DCS_UpdateLocalProfessionStatus(object oPC, int iProfNum=1)
{
    int    iProf    = DCS_GetProfession(oPC, iProfNum, TRUE);
    string sProf    = inStr(iProf);
    string sProfNum = inStr(iProfNum);

    if(iProf == 0)
    return;

    SetLocalString(oPC, DCS_COL_PROF_NAME    +sProfNum, DCS_GetProfessionName(iProf));
       SetLocalInt(oPC, DCS_COL_PROF         +sProfNum, iProf);

    SetLocalString(oPC, DCS_COL_PROF_RECIPES +sProf, DCS_GetLearnedRecipes(oPC, iProf, TRUE));
    SetLocalString(oPC, DCS_COL_PROF_NAME    +sProf, DCS_GetProfessionName(iProf));
       SetLocalInt(oPC, DCS_COL_PROF_LEVEL   +sProf, DCS_GetProfessionLevel(oPC, iProf, TRUE));
       SetLocalInt(oPC, DCS_COL_PROF_XP      +sProf, DCS_GetProfessionXP(oPC, iProf, TRUE));
       SetLocalInt(oPC, DCS_COL_PROF_RANK    +sProf, DCS_GetProfessionRank(oPC, iProf, TRUE));
}

/******************************************************************************/

void DCS_RemoveProfessionFeats(object oPC)
{
    object oSkin        = SKIN_SupportGetSkin(oPC);
    itemproperty ipSkin = GetFirstItemProperty(oSkin);
    int iBase           = DCS_PROFESSION_RADIAL_BASE;
    int ipSubType;

    while(GetIsItemPropertyValid(ipSkin))
    {
        ipSubType = GetItemPropertySubType(ipSkin);
        AdvDebug(oPC, "Skin ipSubType: "+inStr(ipSubType)+", IPDuration: "+inStr(GetItemPropertyDurationType(ipSkin)));

        if(GetItemPropertyDurationType(ipSkin) == DURATION_TYPE_TEMPORARY && ipSubType > iBase && ipSubType <= iBase + DCS_PROFESSIONS_COUNT)
        {
            AdvDebug(oPC, "Removing IP: "+inStr(ipSubType));
            RemoveItemProperty(oSkin, ipSkin);
        }

        ipSkin = GetNextItemProperty(oSkin);
    }
}

/******************************************************************************/

void DCS_UpdateProfessionFeat(object oPC, int iProfNum=1)
{
    object oSkin = SKIN_SupportGetSkin(oPC);
    int    iProf = DCS_GetProfession(oPC, iProfNum);
    int    iFeat = DCS_PROFESSION_RADIAL_BASE+iProf;

    AdvDebug(oPC, "Updating Profession Feat "+inStr(iProfNum));

    if(iProf && !GetIsItemPropertyValid(DCS_IPFindItemProperty(oSkin, ITEM_PROPERTY_BONUS_FEAT, -1, iFeat)))
    {
        AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyBonusFeat(iFeat), oSkin, 56000.0);
        AdvDebug(oPC, "Adding Itemproperty "+inStr(iFeat));
    }
}

/******************************************************************************/
/*                              Recipe functions                              */
/******************************************************************************/

string DCS_GetLearnedRecipes(object oPC, int iProfession, int AccessDB=FALSE)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return "";

    if(AccessDB)
    {
        string Account    = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
        string Character  = SQLEncodeSpecialChars(GetName(oPC));
        string Table      = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);

        SQLExecDirect("select "+DCS_COL_DB_SPECIAL_RECIPES+" from "+Table+PlayerIDColumn(oPC));

        if(SQLFetch())
        return SQLGetData(1);
    }

    return GetLocalString(oPC, DCS_COL_PROF_RECIPES + inStr(iProfession));
}

/******************************************************************************/

int DCS_GetHasLearnedRecipe(object oPC, string sRecipeID, int iProfession, int AccessDB=FALSE)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return 0;
    return FindSubString(DCS_GetLearnedRecipes(oPC, iProfession, AccessDB), sRecipeID) != -1;
}

/******************************************************************************/

void DCS_LearnRecipe(object oPC, string sRecipeID, int iProfession)
{
    if(!DCS_GetHasProfession(oPC, iProfession) || iProfession < 1 || iProfession > DCS_PROFESSIONS_COUNT) return;

    string Table   = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iProfession);
    string Recipes = DCS_GetLearnedRecipes(oPC, iProfession, TRUE)+sRecipeID+dcsSpace;

    AdvDebug(oPC, "Learning new recipe: "+sRecipeID+", Profession: "+inStr(iProfession)+". Current Recipe list: "+Recipes);
    SQLExecDirect("update "+Table+" set "+Col(DCS_COL_DB_SPECIAL_RECIPES, Recipes)+PlayerIDColumn(oPC));
    SetLocalString(oPC, DCS_COL_PROF_RECIPES + inStr(iProfession), Recipes);
}

/******************************************************************************/

int DCS_GetProfessionFromRecipe(string sRecipeID)
{
    if(sRecipeID == "")return 0;

    return DCS_GetProfessionFromMainID(GetStringLeft(sRecipeID, DCS_RECIPE_MAINID_LENGTH));
}

//void main(){}
