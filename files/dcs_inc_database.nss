#include "aps_include"
#include "dcs_inc_data"
#include "d0_functions_inc"

// *  Copy SourceRow into DestRow from SourceTable to DestinationTable
// *   - SourceRow2/DestRow2: Alternative for second entry that should be copied to DestinationTable
void DCS_CopyToDatabase(string SourceTable, string DestinationTable, string SourceRow, string DestRow, string SourceRow2="", string DestRow2="");

// *  Adds recipe gathered from the databaseinto local variables
void DCS_LocalAddRecipe(int iOffset=0);

// *  Stores the resources and the values needed for a Recipe into three arrays
// *  - ID: "DCS_GetRecipeID()
// *  - Resources: The resource cluster using the default spacer (dcsSpace)
// *  - Count: The resource value cluster using the default spacer (dcsSpace)
// *  - The names of the three arrays (Main Array, Sub Array);
// *    - ID, "value"     -> Resource value
// *    - ID, "resource"  -> Resource
// *    - ID, "size"      -> Number of resources in each array dimension
void DCS_SetRecipeResources(string ID, string Resources, string Count);

// *  Stores the itemproperty values for the recipe into four arrays
// *  - ID: DCS_GetRecipeID()
// *  - Itemprops: The itemproperty cluster using the default spacers
// *  - The names of the three arrays (Main Array, Sub Array);
// *    - ID, "type"      -> The itemproperty type
// *    - ID, "costtable" -> The itemproperty costtable value
// *    - ID, "subtype"   -> The itemproperty subtype
// *    - ID, "size"      -> Number of itemproperties in each array dimension
// *  NOTE: The array-prefix "ip" is being used in here. It's necessary, if you want to get
// *        the correct itemproperty values from the DCS_ArrayGet* functions
void DCS_SetRecipeItemprops(string ID, string Itemprops);

// *  Writes s2DA to the Database where s2DA is one of the DCS_TABLE_2DA_* constants
void DCS_SQLWrite2DAToDatabase(string s2DA, int iRow=0);

// *  Add Player to the database
void DCS_SQLAddPlayerToDatabase(object oPlayer, string Table);

// *  Add a rank requirement to the database
void DCS_SQLAddRankRequirement(int iProfession, int iRank, int iCost, int iRPT=0, string sProof="");

// *  Create a new Row or update an existing one
void DCS_SQLAddRecipe(string ID, string SubID, string IDNum, string Name, string ResRef, int DC, int Material, int HasQuality, string Amount, string Critical, string Resources, string Count, string Itemproperties, int Experimentation, int Level, int Rank, int Condition, int Specialisation, string Description, string Appearance, string Menutext="", string Remains="", int AlwaysIntegrateQuality=FALSE, string ColorTag="", string SpecialRecipe="");

// *  Creates a new SQL table in database, if constant is valid
// *  - Table: Use DCS_TABLE_* here
void DCS_SQLCreateTable(string Table, int DropOld=FALSE);

// *  Writes the crafting attempt from oCrafter with its recipe id and result to the database (includes timestamp)
void DCS_SQLWriteCraftingAttempt(object oCrafter, string sRecipeID, int iResult, int iDice);

// *  Writes a couple of settings to the database
void DCS_SQLWriteDatabaseSettings();

// *  Writes a single setting to the database with scolumn as setting name and svalue as the setting value to sTable
void DCS_SQLWriteSingleDatabaseSetting(string sColumn, string sValue, int iUpdateExisting=FALSE, string sTable=DCS_TABLE_SERVERSETTINGS);

void SetAccountFloat(float fValue, string sVar, string sAccData, object oTarget=OBJECT_SELF);

void SetAccountLocked(float fDuration, object oAccount, object oTarget=OBJECT_SELF);

void SetAccountString(string sValue, string sVar, string sAccData, object oTarget=OBJECT_SELF);

void SetAccountSwitch(int iValue, string sVar, string sAccData, object oTarget=OBJECT_SELF);

float GetAccountFloat(string sVar, string sAccData, object oTarget=OBJECT_SELF);

// *  Returns the minimum value of sRandomAmount where sRandomAmount must be a string containing x-y (1-2, 3-6, etc.)
int DCS_GetMinValue(string sRandomAmount);

// *  Returns the maximum value of sRandomAmount where sRandomAmount must be a string containing x-y (1-2, 3-6, etc.)
int DCS_GetMaxValue(string sRandomAmount);

// *  Returns entry from sColumn and sTable as integer
int DCS_SQLGetDatabaseEntryInt(string sTable, string sColumn);

// *  Returns an integer value for sSetting from the "settings" database, if the column sSettings exists.
// *  On error return: 0
int DCS_SQLGetDatabaseSetting(string sSetting, string sTable=DCS_TABLE_SERVERSETTINGS);

// *  Get max entries from Table
int DCS_SQLGetRowsCount(string Table, string Column="", string ColValue="");

// *  Returns TRUE, if Table exists
int DCS_SQLGetTableExists(string Table);

// *  Returns sColumn Value in the DCS_Recipe table, determined by RecipeID
// *   - Possible Values for Column: DCS_COL_*
// *   - AccessDB: should the script access the database or local vars to get the column entry?
// *   - RecipeIDEqualResRef: replaces RecipeID with RecipeResRef column
int DCS_GetRecipeEntryInt(string Column, string RecipeID, int AccessDB=FALSE, int RecipeIDEqualResRef=FALSE);

int GetAccountLocked(object oAccount, object oTarget=OBJECT_SELF);

int GetAccountSwitch(string sVar, string sAccData, object oTarget=OBJECT_SELF);

// *  Returns TRUE, if NWN is connected to the MySQL database
int SQLGetDatabaseConnection();

// *  Return value of column iCol in the current row of result set sResultSetName as an integer
int SQLGetDataInt(int iColumn);

// *  Returns time difference from 'TimestampFrom' to TimestampTo in Unit
int SQLGetTimestampDiff(string TimestampFrom, string TimestampTo="localtime()", string Unit="SECOND");

// *  Returns an integer value for sSetting from the "settings" database, if the column sSettings exists.
// *  On error return: 0.0
float DCS_SQLGetDatabaseSettingFloat(string sSetting, string sTable=DCS_TABLE_SERVERSETTINGS);

// *  Creates a SQL column query
// *  -> example: "select * from database where sColumn='sValue'"
// *  -> example: "select * from database where sColumn=iValue"
string Col(string sColumn, string sValue="", int iValue=-1);

// *  Converts iTimeInSecs into a variable timestamp with the format HH:MM including text
string DCS_CreateTimestamp(int iTimeInSeconds);

// *  Returns sColumn Value in the DCS_Recipe table, determined by RecipeID
// *   - Possible Values for Column: DCS_COL_*
// *   - AccessDB: should the script access the database or local vars to get the column entry?
// *   - RecipeIDEqualResRef: replaces RecipeID with RecipeResRef column
string DCS_GetRecipeEntry(string Column, string RecipeID, int AccessDB=FALSE, int RecipeIDEqualResRef=FALSE);

// *  Returns the RecipeID that has sSpecialID as special recipe ID
string DCS_GetSpecialIDRecipe(string sSpecialID);

// *  Returns the time difference between fDuration and sTimestamp (with the format 'YY-MM-DD HH:MM:SS')
// *  where sTimestamp is being compared to the local timestamp
// *  NOTE: if fDuration = 0.0 or sTimestamp = "", the local account variables from oPC will be used if available
string DCS_GetTimeLeft(object oPC, float fDuration=0.0, string sTimestamp="");

// *  Returns entry from sColumn and sTable
string DCS_SQLGetDatabaseEntry(string sTable, string sColumn);

// *  Returns a string value for sSetting from the "settings" database, if the column sSettings exists.
// *  On error return: ""
string DCS_SQLGetDatabaseSettingString(string sSetting, string sTable=DCS_TABLE_SERVERSETTINGS);

// *  Returns the current rank requirement value for iProfession and iRank
string DCS_GetRankRequirement(int iProfession, int iRank, string sRequirement=DCS_COL_RREQ_COST);

// *  Returns the SQL Database table for iProfession
string DCS_SQLGetTableName(int iProfession);

string GetAccountData(object oAccount);

string GetAccountString(string sVar, string sAccData, object oTarget=OBJECT_SELF);

// *  Returns current localtime timestamp
// *  sFormat: The default format is 'YY-MM-DD HH:MM:SS'.
// *           If sFormat contains any information it will be used as format instead.
string SQLGetTimestamp(string sFormat="");

// *  Converts iSeconds into default time format (00:00:00)
string SQLSecToTime(int iSeconds);

/******************************************************************************/
/*                       GENERAL DATABASE FUNCTIONS                           */
/******************************************************************************/

int SQLGetDatabaseConnection()
{
    return DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_VERSION_NUMBER);
}

/******************************************************************************/

int SQLGetDataInt(int iColumn)
{
    return stInt(SQLGetData(iColumn));
}

/******************************************************************************/

void DCS_SQLWrite2DAToDatabase(string s2DA, int iRow=0)
{
    if(s2DA == DCS_2DA_IPRP_SPELLS)
    {
        int iCasterLvl, iSpellIndex;
        string sLabel, sName;

        sLabel = GetCached2DAString(s2DA, "Label", iRow);

        //WriteTimestampedLogEntry("iRow: "+inStr(iRow)+", sLabel: "+sLabel);

        // Checking for validity of the 2da row
        if(sLabel != "")
        {
            sName       = GetCached2DAString(s2DA, "Name", iRow);
            iCasterLvl  = GetCached2DAInt   (s2DA, "CasterLvl", iRow);
            iSpellIndex = GetCached2DAInt   (s2DA, "SpellIndex", iRow);

            SQLExecDirect("insert into "+s2DA+" ("+DCS_COL_2DA_LABEL+", "+DCS_COL_2DA_NAME+", "+DCS_COL_2DA_CASTERLVL+", "+DCS_COL_2DA_SPELLINDEX+") values ('"+sLabel+"', '"+(sName == "" ? "****" : sName)+"', '"+(iCasterLvl == 0 ? "****" : inStr(iCasterLvl))+"', '"+(iSpellIndex == 0 ? "****" : inStr(iSpellIndex))+"')");
            DelayCommand(DCS_COPYING_DELAY, DCS_SQLWrite2DAToDatabase(s2DA, iRow+1));
        }

    }
}

/******************************************************************************/

/******************************************************************************/

string GetAccountData(object oAccount)
{
    if(!DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_SPAWNER_ACCDATA))
    return SQLEncodeSpecialChars(GetPCPlayerName(oAccount))+"|"+SQLEncodeSpecialChars(GetName(oAccount));

    return SQLEncodeSpecialChars(GetPCPlayerName(oAccount));
}

/******************************************************************************/

int GetAccountSwitch(string sVar, string sAccData, object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, sVar+"_"+sAccData);
}

/******************************************************************************/

string GetAccountString(string sVar, string sAccData, object oTarget=OBJECT_SELF)
{
    return GetLocalString(oTarget, sVar+"_"+sAccData);
}

/******************************************************************************/

float GetAccountFloat(string sVar, string sAccData, object oTarget=OBJECT_SELF)
{
    return GetLocalFloat(oTarget, sVar+"_"+sAccData);
}

/******************************************************************************/

void SetAccountSwitch(int iValue, string sVar, string sAccData, object oTarget=OBJECT_SELF)
{
    if(iValue == 0)
        DeleteLocalInt(oTarget, sVar+"_"+sAccData);
    else
        SetLocalInt(oTarget, sVar+"_"+sAccData, iValue);
}

/******************************************************************************/

void SetAccountString(string sValue, string sVar, string sAccData, object oTarget=OBJECT_SELF)
{
    if(sValue == "")
        DeleteLocalString(oTarget, sVar+"_"+sAccData);
    else
        SetLocalString(oTarget, sVar+"_"+sAccData, sValue);
}

/******************************************************************************/

void SetAccountFloat(float fValue, string sVar, string sAccData, object oTarget=OBJECT_SELF)
{
    if(fValue == 0.0)
        DeleteLocalFloat(oTarget, sVar+"_"+sAccData);
    else
        SetLocalFloat(oTarget, sVar+"_"+sAccData, fValue);
}

/******************************************************************************/

int GetAccountLocked(object oAccount, object oTarget=OBJECT_SELF)
{
    AdvDebug(oAccount, "Account Locked: "+inStr(GetAccountSwitch(DCS_ACCOUNT_IS_LOCKED, GetAccountData(oAccount), oTarget)));
    return GetAccountSwitch(DCS_ACCOUNT_IS_LOCKED, GetAccountData(oAccount), oTarget);
}

/******************************************************************************/

void SetAccountLocked(float fDuration, object oAccount, object oTarget=OBJECT_SELF)
{
    string sAccount = GetAccountData(oAccount);
    AdvDebug(oAccount, "Duration: "+flStr(fDuration)+", Timestamp: "+SQLGetTimestamp());
    SetAccountString(SQLGetTimestamp(), DCS_ACCOUNT_LOCK_TIMESTAMP, sAccount, oTarget);
    SetAccountFloat(fDuration, DCS_ACCOUNT_LOCK_DURATION, sAccount, oTarget);
    SetAccountSwitch(1, DCS_ACCOUNT_IS_LOCKED, sAccount, oTarget);
    DelayCommand(fDuration, SetAccountSwitch(0, DCS_ACCOUNT_IS_LOCKED, sAccount, oTarget));
}

/******************************************************************************/

string DCS_GetTimeLeft(object oPC, float fDuration=0.0, string sTimestamp="")
{
    string sAccount = GetAccountData(oPC);

    if(sTimestamp == "")sTimestamp = GetAccountString(DCS_ACCOUNT_LOCK_TIMESTAMP, sAccount);
    if(fDuration == 0.0)fDuration  = GetAccountFloat(DCS_ACCOUNT_LOCK_DURATION, sAccount);

    AdvDebug(oPC, "Account Lock: "+flStr(GetAccountFloat(DCS_ACCOUNT_LOCK_DURATION, sAccount))+", Timestamp: "+sTimestamp+", Timestampdiff: "+inStr(SQLGetTimestampDiff(sTimestamp))+", SecToTime: "+SQLSecToTime(flInt(fDuration - SQLGetTimestampDiff(sTimestamp))));
    return SQLSecToTime(flInt(fDuration - SQLGetTimestampDiff(sTimestamp)));
}

/******************************************************************************/

string DCS_CreateTimestamp(int iTimeInSeconds)
{
    string sHours, sMinutes;
    float fDiff;

    fDiff   = (iTimeInSeconds / 60.0) / 60.0;
    sHours  = inStr(flInt(fDiff));

    fDiff    = (fDiff - flInt(fDiff)) * 60.0;
    sMinutes = inStr(flInt(fDiff));

    if(stInt(sHours) > 0 && stInt(sMinutes) > 0)
        return sHours+" Stunden und "+sMinutes+" Minuten";
    else if(stInt(sHours) == 0 && stInt(sMinutes) > 0)
        return sMinutes+" Minuten";
    else if(stInt(sHours) > 0 && stInt(sMinutes) == 0)
        return sHours+" Stunden";

    return "";
}

/******************************************************************************/

string SQLGetTimestamp(string sFormat="")
{
    if(sFormat == "")
        SQLExecDirect("select localtime()");
    else
        SQLExecDirect("select DATE_FORMAT(localtime(), '"+sFormat+"')");

    if(SQLFetch())
    return SQLGetData(1);

    return "";
}

/******************************************************************************/

int SQLGetTimestampDiff(string TimestampFrom, string TimestampTo="localtime()", string Unit="SECOND")
{
    SQLExecDirect("select timestampdiff("+Unit+", '"+TimestampFrom+"', "+TimestampTo+")");

    if(SQLFetch())
    return SQLGetDataInt(1);

    return 0;
}

/******************************************************************************/

string SQLSecToTime(int iSeconds)
{
    SQLExecDirect("select sec_to_time("+inStr(iSeconds)+")+0");

    if(SQLFetch())
    {
        string sTime = SQLGetData(1);
        string sDetail;
        int    iLen;

        sTime = GetStringLeft(sTime, FindSubString(sTime, "."));
        iLen  = GetStringLength(sTime);

        if(iLen > 4)
        {
            sDetail = " Stunden";
            sTime = InsertTextPhraseByPosition(sTime, ":", iLen - 2);
            sTime = InsertTextPhraseByPosition(sTime, ":", iLen - 4);
        }
        else if(iLen > 2 && iLen <= 4)
        {
            sDetail = " Minuten";
            sTime = InsertTextPhraseByPosition(sTime, ":", iLen - 2);
        }
        else if(iLen <= 2)
        sDetail = " Sekunden";

        return sTime + sDetail;
    }

    return "";
}

/******************************************************************************/

string Col(string sColumn, string sValue="", int iValue=-1)
{
    if(sColumn == "")return "";

    if(sValue != "")
    return ""+sColumn+"='"+sValue+"'";

    if(iValue != -1)
    return ""+sColumn+"="+inStr(iValue);

    return "";
}

string PlayerIDColumn(object oPC, string AccountCol=DCS_COL_DB_ACCNAME, string CharCol=DCS_COL_DB_CHARNAME)
{
    string Account   = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string Character = SQLEncodeSpecialChars(GetName(oPC));

    return " where "+Col(AccountCol, Account)+" and "+Col(CharCol, Character);
}

/******************************************************************************/
/*                            Database functions                              */
/******************************************************************************/

int DCS_SQLGetDatabaseEntryInt(string sTable, string sColumn)
{
    SQLExecDirect("select "+sColumn+" from "+sTable);

    if(SQLFetch())
    {
        return SQLGetDataInt(1);
    }

    return 0;
}

/******************************************************************************/

string DCS_SQLGetDatabaseEntry(string sTable, string sColumn)
{
    SQLExecDirect("select "+sColumn+" from "+sTable);

    if(SQLFetch())
    {
        return SQLGetData(1);
    }

    return "";
}

/******************************************************************************/
/******************************************************************************/

void DCS_SQLWriteCraftingAttempt(object oCrafter, string sRecipeID, int iResult, int iDice)
{
    if(!GetIsObjectValid(oCrafter) || sRecipeID == "")
    return;

    string sAccount   = SQLEncodeSpecialChars(GetPCPlayerName(oCrafter));
    string sCharacter = SQLEncodeSpecialChars(GetName(oCrafter));
    string sName      = DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeID);
    string sRecipe    = (sName == "" || sName == dcsEmpty ? DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sRecipeID) : sName) + " ("+sRecipeID+")";
    string sResult    = iResult == 1 ? "Wurf: "+inStr(iDice)+", Erfolg" : "Wurf: "+inStr(iDice)+", Fehlschlag";
    string sTimestamp = SQLGetTimestamp("%d.%m.%Y --- %H:%i:%S Uhr");

    SQLExecDirect("insert into "+DCS_TABLE_CRAFTING_STATISTIC+" ("+DCS_COL_CSTAT_TIMESTAMP+","+DCS_COL_CSTAT_ACCOUNT+","+DCS_COL_CSTAT_CHARACTER+","+DCS_COL_CSTAT_RECIPE+","+DCS_COL_CSTAT_RESULT+") values ('"+sTimestamp+"','"+sAccount+"','"+sCharacter+"','"+sRecipe+"','"+sResult+"')");
}

/******************************************************************************/

void DCS_SQLWriteSingleDatabaseSetting(string sColumn, string sValue, int iUpdateExisting=FALSE, string sTable=DCS_TABLE_SERVERSETTINGS)
{
    SQLExecDirect("select "+DCS_COL_SI_VALUE+" from "+sTable+" where "+DCS_COL_SI_SETTING+"='"+sColumn+"'");

    if(!SQLFetch())
        SQLExecDirect("insert into "+sTable+" ("+DCS_COL_SI_SETTING+", "+DCS_COL_SI_VALUE+") values ('"+sColumn+"', '"+sValue+"')");
    else if(iUpdateExisting)
    {
        if(sColumn == DCS_COL_SETTING_VERSION_NUMBER)
        {
            int iVersion = SQLGetDataInt(1);

            if(DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_VERSION_UPDATE))
            SQLExecDirect("update "+sTable+" set "+DCS_COL_SI_VALUE+"='"+inStr(iVersion + 1)+"' where "+DCS_COL_SI_SETTING+"='"+sColumn+"'");
        }
        else
            SQLExecDirect("update "+sTable+" set "+DCS_COL_SI_VALUE+"='"+sValue+"' where "+DCS_COL_SI_SETTING+"='"+sColumn+"'");
    }
}

/******************************************************************************/

void DCS_SQLWriteDatabaseSettings()
{
    DCS_SQLCreateTable(DCS_TABLE_SERVERSETTINGS);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_UPDATE_ONCE_ONLY, "1");
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_DATABASE_UPDATE,  "1");
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_ANIM_ENABLED,     inStr(DCS_SETTING_ANIMATIONS_ENABLED));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_EXPERIMENTATION,  inStr(DCS_SETTING_EXPERIMENTATION_ENABLED));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_FEAT_FOR_DIALOG,  inStr(DCS_SETTING_USE_FEAT_FOR_DIALOG));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_RESET_CRAFTSTAT,  inStr(DCS_SETTING_RESET_STATISTIC_ON_STARTUP));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_SPAWNER_ACCDATA,  inStr(DCS_SPAWNER_COMPLETE_ACC_DATA));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_SPAWNER_RESDUR,   DCS_RearrangeFloat(DCS_SPAWNER_DURATION_RESET));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_SPAWNER_TICKDUR,  DCS_RearrangeFloat(DCS_SPAWNER_DURATION_TICK));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_VERSION_UPDATE,   inStr(DCS_SETTING_VERSION_UPDATE));
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_CRAFT_PLAYER_TAG, "1");

    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_VERSION_NUMBER,   inStr(DCS_PRE_COMPILED), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_XP_BASE,          inStr(DCS_SETTING_XP_BASE), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_XP_MAXIMUM,       inStr(DCS_SETTING_XP_MAXIMUM), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_XP_ABOVE_LEVEL,   inStr(DCS_SETTING_XP_ABOVE_LEVELUP), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_XP_GAIN_BASE,     DCS_RearrangeFloat(DCS_SETTING_XP_GAIN_BASE, 2), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_XP_FROM_FAIL,     DCS_RearrangeFloat(DCS_SETTING_EXPERIENCE_GAIN_FROM_FAILURE), TRUE);

    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_MULTI_ITEM_CRAFT, inStr(DCS_SETTING_ENABLE_MULTIPLE_CRAFTING), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_MAX_CRAFT_ITEMS,  inStr(DCS_SETTING_MAXIMUM_CRAFTABLE_ITEMS), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_RESOURCE_CHECK,   inStr(DCS_SETTING_CHECK_FOR_RESOURCES_IN_MENU), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_TAG_ENCHANT_ITEM, inStr(DCS_SETTING_TAG_ENCHANTED_ITEMS), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_DENCHANT_MAX_XP,  DCS_RearrangeFloat(DCS_SETTING_DISENCHANT_MAX_XP), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_DENCHANT_LOCKDUR, inStr(DCS_SETTING_DISENCHANT_LOCK_DURATION), TRUE);
    DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_ANIM_CUTSCENE,    inStr(DCS_SETTING_ANIMATIONS_CUTSCENE), TRUE);
}

/******************************************************************************/

int DCS_SQLGetDatabaseSetting(string sSetting, string sTable=DCS_TABLE_SERVERSETTINGS)
{
    SQLExecDirect("select "+DCS_COL_SI_VALUE+" from "+sTable+" where "+DCS_COL_SI_SETTING+"='"+sSetting+"'");

    if(SQLFetch())
    {
        return SQLGetDataInt(1);
    }

    return 0;
}

/******************************************************************************/

float DCS_SQLGetDatabaseSettingFloat(string sSetting, string sTable=DCS_TABLE_SERVERSETTINGS)
{
    SQLExecDirect("select "+DCS_COL_SI_VALUE+" from "+sTable+" where "+DCS_COL_SI_SETTING+"='"+sSetting+"'");

    if(SQLFetch())
    {
        return stFloat(SQLGetData(1));
    }

    return 0.0;
}

/******************************************************************************/

string DCS_SQLGetDatabaseSettingString(string sSetting, string sTable=DCS_TABLE_SERVERSETTINGS)
{
    SQLExecDirect("select "+DCS_COL_SI_VALUE+" from "+sTable+" where "+DCS_COL_SI_SETTING+"='"+sSetting+"'");

    if(SQLFetch())
    {
        return SQLGetData(1);
    }

    return "";
}

/******************************************************************************/

int DCS_SQLGetTableExists(string Table)
{
    SQLExecDirect("select count(*) from "+Table);

    return SQLFetch();
}

/******************************************************************************/

string DCS_SQLGetTableName(int iProfession)
{
    return "DCS_Database_"+DCS_GetProfessionName(iProfession);
}

/******************************************************************************/

void DCS_SQLCreateTable(string TableData, int DropOld=FALSE)
{
    string DropExtension, AutoIncrement;
    if(SQL_CONNECTION_MYSQL)
    {
        DropExtension = "if exists ";
        AutoIncrement = DCS_COL_AUTOINCREMENT+DCS_COL_AUTOINCREMENT_KEY;
    }

    if(DropOld || !DCS_SQLGetTableExists(TableData))
    {
        if(TableData == DCS_TABLE_RECIPES)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_RECIPE_ID              +" Varchar(16) not NULL default '', "+
                DCS_COL_RECIPE_NAME            +" Varchar(64) not NULL default '', "+
                DCS_COL_RECIPE_MENUTEXT        +" Varchar(256) not NULL default '', "+
                DCS_COL_RECIPE_TYPE            +" Varchar(8) not NULL default '', "+
                DCS_COL_RECIPE_IS_EXTRA        +" Varchar(32) not NULL default '', "+
                //AutoIncrement                  +
                "Primary Key ("+DCS_COL_RECIPE_ID+"))");

            /*SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_RECIPE_ID              +" Varchar(16) not NULL default '', "+
                DCS_COL_RECIPE_NAME            +" Varchar(64) not NULL default '', "+
                DCS_COL_RECIPE_MENUTEXT        +" Varchar(256) not NULL default '', "+
                DCS_COL_RECIPE_RESREF          +" Varchar(32) not NULL default '', "+
                DCS_COL_RECIPE_DC              +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_MATERIAL        +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_QUALITY         +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_AMOUNT          +" Varchar(16) not NULL default '',"+
                DCS_COL_RECIPE_CRITICAL        +" Varchar(64) not NULL default '',"+
                DCS_COL_RECIPE_RESOURCES       +" Varchar(256) not NULL default '', "+
                DCS_COL_RECIPE_RESCOUNT        +" Varchar(128) not NULL default '', "+
                DCS_COL_RECIPE_REMAINS         +" Varchar(32) not NULL default '', "+
                DCS_COL_RECIPE_ITEMPROPS       +" Varchar(256) not NULL default '', "+
                DCS_COL_RECIPE_EXPERIMENT      +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_LEVEL           +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_RANK            +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_CONDITION       +" Smallint not NULL default 0, "+
                DCS_COL_RECIPE_SPECIAL         +" Smallint not NULL default 0, "+
                DCS_COL_RECIPE_COLOR           +" Varchar(16) not NULL default '', "+
                DCS_COL_RECIPE_TYPE            +" Varchar(8) not NULL default '', "+
                DCS_COL_RECIPE_QUALITY_IN_NAME +" Tinyint unsigned not Null default 1, "+
                DCS_COL_RECIPE_IS_EXTRA        +" Varchar(32) not NULL default '', "+
                AutoIncrement                  +
                "Primary Key ("+DCS_COL_RECIPE_ID+"))");*/
            return;
        }
        else if(TableData == DCS_TABLE_RECIPE_OBJECT)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_RECIPE_ID              +" Varchar(16) not NULL default '', "+
                DCS_COL_RECIPE_RESREF          +" Varchar(32) not NULL default '', "+
                DCS_COL_RECIPE_MATERIAL        +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_QUALITY         +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_AMOUNT          +" Varchar(16) not NULL default '',"+
                DCS_COL_RECIPE_ITEMPROPS       +" Varchar(256) not NULL default '', "+
                DCS_COL_RECIPE_COLOR           +" Varchar(16) not NULL default '', "+
                DCS_COL_RECIPE_APPEARANCE      +" Varchar(128) not NULL default '', "+
                DCS_COL_RECIPE_QUALITY_IN_NAME +" Tinyint unsigned not Null default 1, "+
                //AutoIncrement                  +
                "Foreign Key ("+DCS_COL_RECIPE_ID+") references "+DCS_TABLE_RECIPES+" ("+DCS_COL_RECIPE_ID+"))");
            return;
        }
        else if(TableData == DCS_TABLE_RECIPE_DATA)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_RECIPE_ID              +" Varchar(16) not NULL default '', "+
                DCS_COL_RECIPE_DC              +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_CRITICAL        +" Varchar(64) not NULL default '',"+
                DCS_COL_RECIPE_RESOURCES       +" Varchar(512) not NULL default '', "+
                DCS_COL_RECIPE_RESCOUNT        +" Varchar(256) not NULL default '', "+
                DCS_COL_RECIPE_REMAINS         +" Varchar(32) not NULL default '', "+
                DCS_COL_RECIPE_EXPERIMENT      +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_LEVEL           +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_RANK            +" Tinyint unsigned not NULL default 0, "+
                DCS_COL_RECIPE_CONDITION       +" Smallint not NULL default 0, "+
                DCS_COL_RECIPE_SPECIAL         +" Smallint not NULL default 0, "+
                //AutoIncrement                  +
                "Foreign Key ("+DCS_COL_RECIPE_ID+") references "+DCS_TABLE_RECIPES+" ("+DCS_COL_RECIPE_ID+"))");
            return;
        }
        else if(TableData == DCS_TABLE_PROFESSIONS)
        {
            int iCount;
            string sTableName;

            for(iCount = 1; iCount <= DCS_PROFESSIONS_COUNT; iCount++)
            {
                sTableName = DCS_COL_DB_DATABASE+DCS_GetProfessionName(iCount);

                if(DropOld)
                DelayCommand(iCount - 0.5, SQLExecDirect("Drop Table "+DropExtension+sTableName));

                if(!DCS_SQLGetTableExists(sTableName))
                DelayCommand(iCount * 0.5, SQLExecDirect("Create Table "+sTableName+"( "+
                    DCS_COL_DB_ACCNAME          +" Varchar(64) not NULL,"+
                    DCS_COL_DB_CHARNAME         +" Varchar(64) not NULL, "+
                    DCS_COL_DB_LEVEL            +" Tinyint not NULL default 1, "+
                    DCS_COL_DB_RANK             +" Tinyint not NULL default 1, "+
                    DCS_COL_DB_XP               +" Integer not NULL default 0, "+
                    DCS_COL_DB_SPECIALISATION   +" Tinyint default 0, "+
                    DCS_COL_DB_SUCCESS_CHANCE   +" Tinyint default 0, "+
                    DCS_COL_DB_EXPM_CHANCE      +" Tinyint not NULL default 0, "+
                    DCS_COL_DB_EXPM_POINTS      +" Tinyint not NULL default 0, "+
                    DCS_COL_DB_MORE_ITEM_CHANCE +" Tinyint not NULL default 0, "+
                    DCS_COL_DB_SPECIAL_RECIPES  +" Varchar(1024) not NULL default '', "+
                    "Primary Key ("+DCS_COL_DB_ACCNAME+","+DCS_COL_DB_CHARNAME+"))"));
            }

            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+DCS_TABLE_DATA);

            if(!DCS_SQLGetTableExists(DCS_TABLE_DATA))
            SQLExecDirect("Create Table "+DCS_TABLE_DATA+"( "+
                DCS_COL_DB_ACCNAME           +" Varchar(64) not NULL,"+
                DCS_COL_DB_CHARNAME          +" Varchar(64) not NULL, "+
                DCS_COL_DB_FIRST_PROFESSION  +" Tinyint not NULL default 0, "+
                DCS_COL_DB_SECOND_PROFESSION +" Tinyint not NULL default 0, "+
                "Primary Key ("+DCS_COL_DB_ACCNAME+","+DCS_COL_DB_CHARNAME+"))");

            return;
        }
        // TE-tables
        else if(TableData == DCS_TABLE_TE_DATA)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_DB_ACCNAME  +" Varchar(64) not NULL,"+
                DCS_COL_DB_CHARNAME +" Varchar(64) not NULL, "+
                DCS_COL_GETGOLD     +" Integer unsigned default 0,"+
                DCS_COL_TIP         +" Varchar(256) default '',"+
                DCS_COL_ASSOC       +" Integer unsigned default 0,"+
                DCS_COL_ISDEAD      +" Tinyint unsigned default 0, "+
                "Primary Key ("+DCS_COL_DB_ACCNAME+","+DCS_COL_DB_CHARNAME+"))");
            return;
        }
        else if(TableData == DCS_TABLE_TE_DATA_KEYS)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_CDKEY    +" Varchar(32) not NULL default '', "+
                DCS_COL_ACCOUNTS +" Varchar(256) not NULL default '', "+
                DCS_COL_BANNED   +" Tinyint not NULL default 0,"+
				DCS_COL_IPADDRESS+" Varchar(132) default NULL, "+
				DCS_COL_LASTONLINE+" Timestamp default NULL, "+
                DCS_COL_AUTOINCREMENT +
                "Primary Key (`rowid`, "+DCS_COL_CDKEY+"))");
            return;
        }
        else if(TableData == DCS_TABLE_TE_DATA_KEYS_UNLOCKED)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_ACCOUNTS      +" Varchar(64) not NULL default '', "+
                DCS_COL_CDKEY         +" Varchar(256) not NULL default '', "+
                DCS_COL_AUTOINCREMENT +
                "Primary Key (`rowid`, "+DCS_COL_ACCOUNTS+"))");
            return;
        }
        else if(TableData == DCS_TABLE_SERVERSETTINGS)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_SI_SETTING +" Varchar(128) not NULL, "+
                DCS_COL_SI_VALUE   +" Varchar(64) not NULL, "+
                "Primary Key ("+DCS_COL_SI_SETTING+"))");
            return;
        }
        else if(TableData == DCS_TABLE_RANK_REQUIREMENTS)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_RREQ_NAME              +" Varchar(64) not NULL default '', "+
                DCS_COL_RREQ_PROFESSION        +" Tinyint unsigned not NULL, "+
                DCS_COL_RREQ_RANK              +" Tinyint unsigned not NULL, "+
                DCS_COL_RREQ_COST              +" Integer unsigned not NULL default 0, "+
                DCS_COL_RREQ_RPT               +" Integer unsigned not NULL default 0, "+
                DCS_COL_RREQ_PROOF             +" Varchar(128) not NULL default '', "+
                "Primary Key ("+DCS_COL_RREQ_NAME+"))");
            return;
        }
        else if(TableData == DCS_TABLE_CRAFTING_STATISTIC)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_CSTAT_TIMESTAMP        +" Varchar(128) not NULL default '', "+
                DCS_COL_CSTAT_ACCOUNT          +" Varchar(64)  not NULL default '', "+
                DCS_COL_CSTAT_CHARACTER        +" Varchar(64)  not NULL default '', "+
                DCS_COL_CSTAT_RECIPE           +" Varchar(128) not NULL default '', "+
                DCS_COL_CSTAT_RESULT           +" Varchar(32)  not NULL default '', "+
                DCS_COL_AUTOINCREMENT          +
                "Primary Key (`rowid`))");
            return;
        }
        else if(TableData == DCS_TABLE_CRAFTING_LOCK)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_CSTAT_ACCOUNT          +" Varchar(64) not NULL default '', "+
                DCS_COL_CSTAT_CHARACTER        +" Varchar(64) not NULL default '', "+
                DCS_COL_CLOCK_RECIPETYPE       +" Varchar(16) not NULL default '', "+
                DCS_COL_CLOCK_XP               +" Integer not NULL default 0, "+
                DCS_COL_CLOCK_LOCKED           +" Tinyint not NULL default 0, "+
                DCS_COL_CLOCK_DURATION         +" Integer not NULL default 0, "+
                DCS_COL_CLOCK_TIMESTAMP        +" Varchar(128) not NULL default '', "+
                DCS_COL_AUTOINCREMENT          +
                "Primary Key (`rowid`))");
            return;
        }
        else if(TableData == DCS_TABLE_2DA_IPRP_SPELLS)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_AUTOINCREMENT        +
                DCS_COL_2DA_LABEL            +" Varchar(128) not NULL default '****', "+
                DCS_COL_2DA_NAME             +" Varchar(16)  not NULL default '****', "+
                DCS_COL_2DA_CASTERLVL        +" Varchar(16)  not NULL default '****', "+
                DCS_COL_2DA_SPELLINDEX       +" Varchar(16)  not NULL default '****', "+
                "Primary Key (`rowid`))");
            return;
        }
        else if(TableData == BBS_TABLE)
        {
            if(DropOld)
            SQLExecDirect("Drop Table "+DropExtension+TableData);

            SQLExecDirect("Create Table "+TableData+"( "+
                DCS_COL_AUTOINCREMENT +
                BBS_COL_BOARD         +" Varchar(128) not NULL default '', "+
                BBS_COL_POSTER        +" Varchar(128) not NULL default '', "+
                BBS_COL_TITLE         +" Varchar(32)  not NULL default '', "+
                BBS_COL_NACHRICHT     +" Varchar(256) not NULL default '', "+
                BBS_COL_DATE          +" Varchar(32)  not NULL default '', "+
                BBS_COL_EXPIRE        +" Varchar(32)  not NULL default '', "+
                BBS_COL_PERMANENT     +" Tinyint(1)   not NULL default 0, "+
                "Primary Key (`rowid`))");
        }
    }
}

/******************************************************************************/

int DCS_SQLGetRowsCount(string Table, string Column="", string ColValue="")
{
    string Addition = " where "+Column+"='"+ColValue+"'";

    if(Column == "" || ColValue == "")Addition="";

    SQLExecDirect("select count(*) from "+Table+Addition);

    if(SQLFetch())
    {
        return StringToInt(SQLGetData(1));
    }

    return 0;
}

/******************************************************************************/

void DCS_SQLAddPlayerToDatabase(object oPlayer, string Table)
{
    if(!GetIsDM(oPlayer))
    {
        string AccountName   = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));
        string CharacterName = SQLEncodeSpecialChars(GetName(oPlayer));

        SQLExecDirect("select "+DCS_COL_DB_ACCNAME+" from " + Table + " where "+DCS_COL_DB_ACCNAME+"='" + AccountName +"' and "+DCS_COL_DB_CHARNAME+"='" + CharacterName + "'");

        // row doesn't exist
        if(!SQLFetch())
        SQLExecDirect("insert into " + Table + " ("+DCS_COL_DB_ACCNAME+","+DCS_COL_DB_CHARNAME+") values ('"+ AccountName +"','"+ CharacterName +"')");
    }
}

/******************************************************************************/

string GetEndingChar(string Char, int AtEnd)
{
    if(!AtEnd)return Char;

    return "";
}

/******************************************************************************/

void SQLCheckAndExecute(string sState)
{
    int iSearch = FindSubString(sState, ", where");

    if(iSearch)
    sState = GetStringLeft(sState, iSearch) + GetSubString(sState, iSearch+1, GetStringLength(sState)-(iSearch+1));

    SQLExecDirect(sState);
}

/******************************************************************************/

string GetUpdateEntry(string Column, string Entry, int AtEnd=FALSE, string EndChar=",")
{
    EndChar = GetEndingChar(EndChar, AtEnd);

    if(Entry != "")
    {
        return Column+"='"+Entry+"'"+EndChar;
    }

    return "";
}

/******************************************************************************/

string GetInsertColumn(string Column, string Entry, int AtEnd=FALSE, string EndChar=",")
{
    EndChar = GetEndingChar(EndChar, AtEnd);

    if(Entry != "")
    {
        return Column+EndChar;
    }

    return "";
}

/******************************************************************************/

string GetInsertEntry(string Column, string Entry, int AtEnd=FALSE, string EndChar=",")
{
    EndChar = GetEndingChar(EndChar, AtEnd);

    if(Entry != "")
    {
        return "'"+Entry+"'"+EndChar;
    }

    return "";
}

/******************************************************************************/

string GetInt(int iValue)
{
    if(iValue != -1)
    return IntToString(iValue);

    return "";
}

/******************************************************************************/

int DCS_GetMinValue(string sRandomAmount)
{
    return stInt(GetStringLeft(sRandomAmount, FindSubString(sRandomAmount, "-")));
}

/******************************************************************************/

int DCS_GetMaxValue(string sRandomAmount)
{
    int iSub = FindSubString(sRandomAmount, "-") + 1;
    return stInt(GetSubString(sRandomAmount, iSub, GetStringLength(sRandomAmount)-iSub));
}

/******************************************************************************/
/*                              Array functions                               */
/******************************************************************************/

string ArrayDim(int iEntry)
{
    if(iEntry < 0)return "";

    return "["+IntToString(iEntry)+"]";
}

int DCS_ArrayGetInt(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
int DCS_ArrayGetInt(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1 || iEntry < 1 || iEntry > DCS_SETTING_ARRAY_MAXIMUM)return 0;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "" && FindSubString(sArrayPrefix, "#") == -1)
    sArrayPrefix = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    return GetLocalInt(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));
}

float DCS_ArrayGetFloat(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
float DCS_ArrayGetFloat(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1 || iEntry < 1 || iEntry > DCS_SETTING_ARRAY_MAXIMUM)return 0.0;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "" && FindSubString(sArrayPrefix, "#") == -1)
    sArrayPrefix = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    return GetLocalFloat(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));
}

string DCS_ArrayGetString(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
string DCS_ArrayGetString(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1 || iEntry < 1 || iEntry > DCS_SETTING_ARRAY_MAXIMUM)return "";
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "" && FindSubString(sArrayPrefix, "#") == -1)
    sArrayPrefix = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;

    //WriteTimestampedLogEntry("o Get string from array "+sArray+ArrayDim(iEntry)+ArrayDim(iDimension)+": "+GetLocalString(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension)));
    return GetLocalString(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));
}

int DCS_ArrayGetDimensions(string sMainArray, string sArrayPrefix="", object oArray=OBJECT_INVALID);
int DCS_ArrayGetDimensions(string sMainArray, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "" && FindSubString(sArrayPrefix, "#") == -1)
    sArrayPrefix = "#"+sArrayPrefix;

    return GetLocalInt(oArray, sMainArray+sArrayPrefix+"#dimsize");
}

int DCS_ArrayGetSize(string sMainArray, string sSubArray, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
int DCS_ArrayGetSize(string sMainArray, string sSubArray, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1)return 0;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "" && FindSubString(sArrayPrefix, "#") == -1)
    sArrayPrefix = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    return GetLocalInt(oArray, sArray+ArrayDim(iDimension)+"#size");
}

int DCS_ArrayGetType(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
int DCS_ArrayGetType(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1 || iEntry < 1 || iEntry > DCS_SETTING_ARRAY_MAXIMUM)return 0;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "" && FindSubString(sArrayPrefix, "#") == -1)
    sArrayPrefix = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    return GetLocalInt(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension)+"#type");
}

int DCS_ArrayGetExists(string sMainArray, string sSubArray, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
int DCS_ArrayGetExists(string sMainArray, string sSubArray, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1)return FALSE;
    if(!GetIsObjectValid(oArray))oArray = GetModule();

    int iDim = DCS_ArrayGetDimensions(sMainArray, sArrayPrefix, oArray);
    return DCS_ArrayGetSize(sMainArray, sSubArray, iDimension, sArrayPrefix, oArray) >= 1 && iDimension <= iDim && iDim > 0;
}

void DCS_ArrayAddInt(string sMainArray, string sSubArray, int iValue, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
void DCS_ArrayAddInt(string sMainArray, string sSubArray, int iValue, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1)return;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "")sArrayPrefix  = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    int    iSize  = DCS_ArrayGetSize(sMainArray, sSubArray, iDimension, sArrayPrefix, oArray) + 1;

    //WriteTimestampedLogEntry("o Adding integer to array "+sArray+ArrayDim(iSize)+ArrayDim(iDimension)+": "+IntToString(iValue));

    if(DCS_ArrayGetDimensions(sMainArray, sArrayPrefix, oArray) < iDimension)
    SetLocalInt(oArray, sMainArray+sArrayPrefix+"#dimsize", iDimension);
    SetLocalInt(oArray, sArray+ArrayDim(iDimension)+"#size", iSize);
    SetLocalInt(oArray, sArray+ArrayDim(iSize)+ArrayDim(iDimension)+"#type", 1);
    SetLocalInt(oArray, sArray+ArrayDim(iSize)+ArrayDim(iDimension), iValue);
}

void DCS_ArrayAddFloat(string sMainArray, string sSubArray, float fValue, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
void DCS_ArrayAddFloat(string sMainArray, string sSubArray, float fValue, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1)return;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "")sArrayPrefix  = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    int    iSize  = DCS_ArrayGetSize(sMainArray, sSubArray, iDimension, sArrayPrefix, oArray) + 1;

    //WriteTimestampedLogEntry("o Adding float   to array "+sArray+ArrayDim(iSize)+ArrayDim(iDimension)+": "+FloatToString(fValue));

    if(DCS_ArrayGetDimensions(sMainArray, sArrayPrefix, oArray) < iDimension)
    SetLocalInt  (oArray, sMainArray+sArrayPrefix+"#dimsize", iDimension);
    SetLocalInt  (oArray, sArray+ArrayDim(iDimension)+"#size", iSize);
    SetLocalInt  (oArray, sArray+ArrayDim(iSize)+ArrayDim(iDimension)+"#type", 2);
    SetLocalFloat(oArray, sArray+ArrayDim(iSize)+ArrayDim(iDimension), fValue);
}

void DCS_ArrayAddString(string sMainArray, string sSubArray, string sValue, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
void DCS_ArrayAddString(string sMainArray, string sSubArray, string sValue, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1)return;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "")sArrayPrefix  = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    int    iSize  = DCS_ArrayGetSize(sMainArray, sSubArray, iDimension, sArrayPrefix, oArray) + 1;

    //WriteTimestampedLogEntry("o Adding string  to array "+sArray+ArrayDim(iSize)+ArrayDim(iDimension)+": "+sValue);

    if(DCS_ArrayGetDimensions(sMainArray, sArrayPrefix, oArray) < iDimension)
    SetLocalInt   (oArray, sMainArray+sArrayPrefix+"#dimsize", iDimension);
    SetLocalInt   (oArray, sArray+ArrayDim(iDimension)+"#size", iSize);
    SetLocalInt   (oArray, sArray+ArrayDim(iSize)+ArrayDim(iDimension)+"#type", 3);
    SetLocalString(oArray, sArray+ArrayDim(iSize)+ArrayDim(iDimension), sValue);
}

void DCS_ArrayDeleteEntry(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID);
void DCS_ArrayDeleteEntry(string sMainArray, string sSubArray, int iEntry=1, int iDimension=1, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(iDimension < 1 || iEntry < 1 || iEntry > DCS_SETTING_ARRAY_MAXIMUM)return;
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "")sArrayPrefix  = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    switch(DCS_ArrayGetType(sMainArray, sSubArray, iEntry, iDimension, sArrayPrefix, oArray))
    {
        case -1:
            DeleteLocalInt   (oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));
            DeleteLocalFloat (oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));
            DeleteLocalString(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));
        break;

        case 1: DeleteLocalInt   (oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));break;
        case 2: DeleteLocalFloat (oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));break;
        case 3: DeleteLocalString(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension));break;
    }

    DeleteLocalInt(oArray, sArray+ArrayDim(iEntry)+ArrayDim(iDimension)+"#type");
}

void DCS_ArrayDestroy(string sMainArray, string sSubArray, string sArrayPrefix="", object oArray=OBJECT_INVALID);
void DCS_ArrayDestroy(string sMainArray, string sSubArray, string sArrayPrefix="", object oArray=OBJECT_INVALID)
{
    if(!GetIsObjectValid(oArray))oArray = GetModule();
    if(sArrayPrefix != "")sArrayPrefix  = "#"+sArrayPrefix;

    string sArray = sMainArray+sArrayPrefix+"_"+sSubArray;
    int    iDim   = DCS_ArrayGetDimensions(sMainArray, sArrayPrefix, oArray) + 1;
    int    iSize, iDimCount, iCount;

    for(iDimCount=1; iDimCount <= iDim; iDimCount++)
    {
        iSize = DCS_ArrayGetSize(sMainArray, sSubArray, iDimCount, sArrayPrefix, oArray);
        for(iCount=1; iCount <= iSize; iCount++)
        {
            DCS_ArrayDeleteEntry(sMainArray, sSubArray, iCount, iDimCount, sArrayPrefix, oArray);
        }
        DeleteLocalInt(oArray, sArray+ArrayDim(iDimCount)+"#size");
    }
    DeleteLocalInt(oArray, sMainArray+sArrayPrefix+"#dimsize");
}

/******************************************************************************/
/*                             Recipe functions                               */
/******************************************************************************/

/*
    dcs_recipe: DCS_COL_RECIPE_NAME, DCS_COL_RECIPE_MENUTEXT, DCS_COL_RECIPE_TYPE, DCS_COL_RECIPE_IS_EXTRA
    dcs_recipe_data:
    DCS_COL_RECIPE_DC, DCS_COL_RECIPE_CRITICAL, DCS_COL_RECIPE_RESOURCES, DCS_COL_RECIPE_RESCOUNT, DCS_COL_RECIPE_REMAINS,DCS_COL_RECIPE_EXPERIMENT,
    DCS_COL_RECIPE_LEVEL, DCS_COL_RECIPE_RANK, DCS_COL_RECIPE_CONDITION, DCS_COL_RECIPE_SPECIAL
    dcs_recipe_object:
    DCS_COL_RECIPE_RESREF, DCS_COL_RECIPE_MATERIAL, DCS_COL_RECIPE_QUALITY, DCS_COL_RECIPE_AMOUNT, DCS_COL_RECIPE_ITEMPROPS, DCS_COL_RECIPE_COLOR, DCS_COL_RECIPE_QUALITY_IN_NAME
*/
void DCS_SQLAddRecipe(string ID, string SubID, string IDNum, string Name, string ResRef, int DC, int Material, int HasQuality, string Amount, string Critical, string Resources, string Count, string Itemproperties, int Experimentation, int Level, int Rank, int Condition, int Specialisation, string Description, string Appearance, string Menutext="", string Remains="", int AlwaysIntegrateQuality=FALSE, string ColorTag="", string SpecialRecipe="")
{
    string Type = SubID != "" ? SubID : ID; //GetStringLeft(ID, DCS_RECIPE_MAINID_LENGTH);

    if(Menutext == "")Menutext = Name;

    SQLExecDirect("insert into "+DCS_TABLE_RECIPES+" ("+
        GetInsertColumn(DCS_COL_RECIPE_NAME, Name)+
        GetInsertColumn(DCS_COL_RECIPE_MENUTEXT, Menutext)+
        GetInsertColumn(DCS_COL_RECIPE_TYPE, Type)+
        GetInsertColumn(DCS_COL_RECIPE_IS_EXTRA, SpecialRecipe)+
        GetInsertColumn(DCS_COL_RECIPE_ID, ID+IDNum, TRUE)+") values ("+
        GetInsertEntry(DCS_COL_RECIPE_NAME, Name)+
        GetInsertEntry(DCS_COL_RECIPE_MENUTEXT, Menutext)+
        GetInsertEntry(DCS_COL_RECIPE_TYPE, Type)+
        GetInsertEntry(DCS_COL_RECIPE_IS_EXTRA, SpecialRecipe)+
        GetInsertEntry(DCS_COL_RECIPE_ID, ID+IDNum, TRUE)+")");

    SQLExecDirect("insert into "+DCS_TABLE_RECIPE_DATA+" ("+
        GetInsertColumn(DCS_COL_RECIPE_DC, GetInt(DC))+
        GetInsertColumn(DCS_COL_RECIPE_CRITICAL, Critical)+
        GetInsertColumn(DCS_COL_RECIPE_RESOURCES, Resources)+
        GetInsertColumn(DCS_COL_RECIPE_RESCOUNT, Count)+
        GetInsertColumn(DCS_COL_RECIPE_REMAINS, Remains)+
        GetInsertColumn(DCS_COL_RECIPE_EXPERIMENT, GetInt(Experimentation))+
        GetInsertColumn(DCS_COL_RECIPE_LEVEL, GetInt(Level))+
        GetInsertColumn(DCS_COL_RECIPE_RANK, GetInt(Rank))+
        GetInsertColumn(DCS_COL_RECIPE_CONDITION, GetInt(Condition))+
        GetInsertColumn(DCS_COL_RECIPE_SPECIAL, GetInt(Specialisation))+
        GetInsertColumn(DCS_COL_RECIPE_ID, ID+IDNum, TRUE)+") values ("+
        GetInsertEntry(DCS_COL_RECIPE_DC, GetInt(DC))+
        GetInsertEntry(DCS_COL_RECIPE_CRITICAL, Critical)+
        GetInsertEntry(DCS_COL_RECIPE_RESOURCES, Resources)+
        GetInsertEntry(DCS_COL_RECIPE_RESCOUNT, Count)+
        GetInsertEntry(DCS_COL_RECIPE_REMAINS, Remains)+
        GetInsertEntry(DCS_COL_RECIPE_EXPERIMENT, GetInt(Experimentation))+
        GetInsertEntry(DCS_COL_RECIPE_LEVEL, GetInt(Level))+
        GetInsertEntry(DCS_COL_RECIPE_RANK, GetInt(Rank))+
        GetInsertEntry(DCS_COL_RECIPE_CONDITION, GetInt(Condition))+
        GetInsertEntry(DCS_COL_RECIPE_SPECIAL, GetInt(Specialisation))+
        GetInsertEntry(DCS_COL_RECIPE_ID, ID+IDNum, TRUE)+")");

    SQLExecDirect("insert into "+DCS_TABLE_RECIPE_OBJECT+" ("+
        GetInsertColumn(DCS_COL_RECIPE_RESREF, ResRef)+
        GetInsertColumn(DCS_COL_RECIPE_MATERIAL, GetInt(Material))+
        GetInsertColumn(DCS_COL_RECIPE_QUALITY, GetInt(HasQuality))+
        GetInsertColumn(DCS_COL_RECIPE_AMOUNT, Amount)+
        GetInsertColumn(DCS_COL_RECIPE_ITEMPROPS, Itemproperties)+
        GetInsertColumn(DCS_COL_RECIPE_COLOR, ColorTag)+
        GetInsertColumn(DCS_COL_RECIPE_APPEARANCE, Appearance)+
        GetInsertColumn(DCS_COL_RECIPE_QUALITY_IN_NAME, GetInt(AlwaysIntegrateQuality))+
        GetInsertColumn(DCS_COL_RECIPE_ID, ID+IDNum, TRUE)+") values ("+
        GetInsertEntry(DCS_COL_RECIPE_RESREF, ResRef)+
        GetInsertEntry(DCS_COL_RECIPE_MATERIAL, GetInt(Material))+
        GetInsertEntry(DCS_COL_RECIPE_QUALITY, GetInt(HasQuality))+
        GetInsertEntry(DCS_COL_RECIPE_AMOUNT, Amount)+
        GetInsertEntry(DCS_COL_RECIPE_ITEMPROPS, Itemproperties)+
        GetInsertEntry(DCS_COL_RECIPE_COLOR, ColorTag)+
        GetInsertEntry(DCS_COL_RECIPE_APPEARANCE, Appearance)+
        GetInsertEntry(DCS_COL_RECIPE_QUALITY_IN_NAME, GetInt(AlwaysIntegrateQuality))+
        GetInsertEntry(DCS_COL_RECIPE_ID, ID+IDNum, TRUE)+")");

        /*Entries = DCS_COL_RECIPE_NAME            + dcsLocalMid + Name          + dcsLocalEnd +
                  DCS_COL_RECIPE_MENUTEXT        + dcsLocalMid + Menutext      + dcsLocalEnd +
                  DCS_COL_RECIPE_RESREF          + dcsLocalMid + ResRef        + dcsLocalEnd +
                  DCS_COL_RECIPE_DC              + dcsLocalMid + DC            + dcsLocalEnd +
                  DCS_COL_RECIPE_MATERIAL        + dcsLocalMid + Material      + dcsLocalEnd +
                  DCS_COL_RECIPE_QUALITY         + dcsLocalMid + Quality       + dcsLocalEnd +
                  DCS_COL_RECIPE_AMOUNT          + dcsLocalMid + Amount        + dcsLocalEnd +
                  DCS_COL_RECIPE_CRITICAL        + dcsLocalMid + Critical      + dcsLocalEnd +
                  DCS_COL_RECIPE_RESOURCES       + dcsLocalMid + Resources     + dcsLocalEnd +
                  DCS_COL_RECIPE_RESCOUNT        + dcsLocalMid + ResCount      + dcsLocalEnd +
                  DCS_COL_RECIPE_REMAINS         + dcsLocalMid + Remains       + dcsLocalEnd +
                  DCS_COL_RECIPE_ITEMPROPS       + dcsLocalMid + Itemprop      + dcsLocalEnd +
                  DCS_COL_RECIPE_EXPERIMENT      + dcsLocalMid + Experiment    + dcsLocalEnd +
                  DCS_COL_RECIPE_LEVEL           + dcsLocalMid + Level         + dcsLocalEnd +
                  DCS_COL_RECIPE_RANK            + dcsLocalMid + Rank          + dcsLocalEnd +
                  DCS_COL_RECIPE_CONDITION       + dcsLocalMid + Condition     + dcsLocalEnd +
                  DCS_COL_RECIPE_SPECIAL         + dcsLocalMid + Specialize    + dcsLocalEnd +
                  DCS_COL_RECIPE_COLOR           + dcsLocalMid + Color         + dcsLocalEnd +
                  DCS_COL_RECIPE_TYPE            + dcsLocalMid + Type          + dcsLocalEnd +
                  DCS_COL_RECIPE_QUALITY_IN_NAME + dcsLocalMid + QIN           + dcsLocalEnd +
                  DCS_COL_RECIPE_IS_EXTRA        + dcsLocalMid + IsExtra       + dcsLocalEnd;

        SetLocalString(oStore, ID, Entries);

        DelayCommand(0.2, DCS_SetRecipeItemprops(ID, Itemprop));
        DelayCommand(0.5, DCS_SetRecipeResources(ID, Resources, ResCount));     */


}

/******************************************************************************/

void DCS_SQLAddRankRequirement(int iProfession, int iRank, int iCost, int iRPT=0, string sProof="")
{
    string sTable = DCS_TABLE_RANK_REQUIREMENTS;
    string sName  = DCS_GetProfessionName(iProfession)+": "+DCS_GetRankName(iRank);

    if(iRank > DCS_RANK_GRANDMASTER)
    sName = DCS_GetProfessionName(iProfession)+": "+DCS_GetSpecialisationName(iRank);

    SQLExecDirect("select "+DCS_COL_RREQ_NAME+" from "+sTable+" where "+DCS_COL_RREQ_NAME+"='"+sName+"'");

    if(SQLFetch())
    {
        SQLCheckAndExecute("update "+sTable+" set "+
        GetUpdateEntry(DCS_COL_RREQ_PROFESSION, GetInt(iProfession))+
        GetUpdateEntry(DCS_COL_RREQ_RANK, GetInt(iRank))+
        GetUpdateEntry(DCS_COL_RREQ_COST, GetInt(iCost))+
        GetUpdateEntry(DCS_COL_RREQ_RPT,  GetInt(iRPT))+
        GetUpdateEntry(DCS_COL_RREQ_PROOF, sProof, TRUE)+
        " where "+
        GetUpdateEntry(DCS_COL_RREQ_NAME, sName, TRUE));
    }
    else
    {
        SQLExecDirect("insert into "+sTable+" ("+
        GetInsertColumn(DCS_COL_RREQ_PROFESSION, GetInt(iProfession))+
        GetInsertColumn(DCS_COL_RREQ_RANK, GetInt(iRank))+
        GetInsertColumn(DCS_COL_RREQ_COST, GetInt(iCost))+
        GetInsertColumn(DCS_COL_RREQ_RPT,  GetInt(iRPT))+
        GetInsertColumn(DCS_COL_RREQ_PROOF, sProof)+
        GetInsertColumn(DCS_COL_RREQ_NAME, sName, TRUE)+") values ("+
        GetInsertEntry(DCS_COL_RREQ_PROFESSION, GetInt(iProfession))+
        GetInsertEntry(DCS_COL_RREQ_RANK, GetInt(iRank))+
        GetInsertEntry(DCS_COL_RREQ_COST, GetInt(iCost))+
        GetInsertEntry(DCS_COL_RREQ_RPT,  GetInt(iRPT))+
        GetInsertEntry(DCS_COL_RREQ_PROOF, sProof)+
        GetInsertEntry(DCS_COL_RREQ_NAME, sName, TRUE)+")");
    }
}

/******************************************************************************/

void DCS_LocalAddRecipe(int iOffset=0)
{
    object oStore  = GetObjectByTag(dcsRecipeInit);
    string Entries, ID, Name, Menutext, Type, IsExtra, DC, Critical, Resources, ResCount, Remains, Experiment, Level, Rank, Condition, Specialize, ResRef, Material, Quality, Amount, Itemprop, Color, QIN;
    //, RecipeType, RecipeQualityInName, RecipeIsExtra, RecipeNumber, RecipeRemains, RecipeQuality, RecipeName, RecipeDC, RecipeAmount, RecipeResources, RecipeCount, RecipeResRef, RecipeExperiment, RecipeColor, RecipeLevel, RecipeRank, RecipeCondition, RecipeSpecial, RecipeMenutext, RecipeItemprops, RecipeMaterial, RecipeCritical;

    SQLExecDirect("select * from "+DCS_TABLE_RECIPES+" left join "+DCS_TABLE_RECIPE_DATA+" using (ID) left join "+DCS_TABLE_RECIPE_OBJECT+" using (ID) limit 1 offset "+inStr(iOffset));

    if(SQLFetch())
    {
        ID = SQLGetData(1);
        Name = SQLGetData(2);
        Menutext = SQLGetData(3);
        Type = SQLGetData(4);
        IsExtra = SQLGetData(5);
        DC = SQLGetData(6);
        Critical = SQLGetData(7);
        Resources = SQLGetData(8);
        ResCount = SQLGetData(9);
        Remains = SQLGetData(10);
        Experiment = SQLGetData(11);
        Level  = SQLGetData(12);
        Rank = SQLGetData(13);
        Condition = SQLGetData(14);
        Specialize = SQLGetData(15);
        ResRef = SQLGetData(16);
        Material = SQLGetData(17);
        Quality = SQLGetData(18);
        Amount = SQLGetData(19);
        Itemprop = SQLGetData(20);
        Color = SQLGetData(21);
        QIN = SQLGetData(22);

        Entries = DCS_COL_RECIPE_NAME            + dcsLocalMid + Name          + dcsLocalEnd +
                  DCS_COL_RECIPE_MENUTEXT        + dcsLocalMid + Menutext      + dcsLocalEnd +
                  DCS_COL_RECIPE_RESREF          + dcsLocalMid + ResRef        + dcsLocalEnd +
                  DCS_COL_RECIPE_DC              + dcsLocalMid + DC            + dcsLocalEnd +
                  DCS_COL_RECIPE_MATERIAL        + dcsLocalMid + Material      + dcsLocalEnd +
                  DCS_COL_RECIPE_QUALITY         + dcsLocalMid + Quality       + dcsLocalEnd +
                  DCS_COL_RECIPE_AMOUNT          + dcsLocalMid + Amount        + dcsLocalEnd +
                  DCS_COL_RECIPE_CRITICAL        + dcsLocalMid + Critical      + dcsLocalEnd +
                  DCS_COL_RECIPE_RESOURCES       + dcsLocalMid + Resources     + dcsLocalEnd +
                  DCS_COL_RECIPE_RESCOUNT        + dcsLocalMid + ResCount      + dcsLocalEnd +
                  DCS_COL_RECIPE_REMAINS         + dcsLocalMid + Remains       + dcsLocalEnd +
                  DCS_COL_RECIPE_ITEMPROPS       + dcsLocalMid + Itemprop      + dcsLocalEnd +
                  DCS_COL_RECIPE_EXPERIMENT      + dcsLocalMid + Experiment    + dcsLocalEnd +
                  DCS_COL_RECIPE_LEVEL           + dcsLocalMid + Level         + dcsLocalEnd +
                  DCS_COL_RECIPE_RANK            + dcsLocalMid + Rank          + dcsLocalEnd +
                  DCS_COL_RECIPE_CONDITION       + dcsLocalMid + Condition     + dcsLocalEnd +
                  DCS_COL_RECIPE_SPECIAL         + dcsLocalMid + Specialize    + dcsLocalEnd +
                  DCS_COL_RECIPE_COLOR           + dcsLocalMid + Color         + dcsLocalEnd +
                  DCS_COL_RECIPE_TYPE            + dcsLocalMid + Type          + dcsLocalEnd +
                  DCS_COL_RECIPE_QUALITY_IN_NAME + dcsLocalMid + QIN           + dcsLocalEnd +
                  DCS_COL_RECIPE_IS_EXTRA        + dcsLocalMid + IsExtra       + dcsLocalEnd;

        SetLocalString(oStore, ID, Entries);

        DelayCommand(0.2, DCS_SetRecipeItemprops(ID, Itemprop));
        DelayCommand(0.5, DCS_SetRecipeResources(ID, Resources, ResCount));
        //WriteTimestampedLogEntry(RecipeNumber+" --> "+Entries);
    }
}

/******************************************************************************/

string DCS_GetRankRequirement(int iProfession, int iRank, string sRequirement=DCS_COL_RREQ_COST)
{
    SQLExecDirect("select " + sRequirement + " from " + DCS_TABLE_RANK_REQUIREMENTS + " where "+Col(DCS_COL_RREQ_RANK, "", iRank)+" and "+Col(DCS_COL_RREQ_PROFESSION, "", iProfession));

    if(SQLFetch())
    return SQLGetData(1);

    return "";
}

/******************************************************************************/

string DCS_GetRecipeEntry(string Column, string RecipeID, int AccessDB=FALSE, int RecipeIDEqualResRef=FALSE)
{
    if(AccessDB)
    {
        if(!RecipeIDEqualResRef)
            SQLExecDirect("select " + Column + " from " + DCS_TABLE_RECIPES + " left join "+DCS_TABLE_RECIPE_DATA+" using (ID) left join "+DCS_TABLE_RECIPE_OBJECT+" using (ID) where "+DCS_COL_RECIPE_ID+"='" + RecipeID + "'");
        else
            SQLExecDirect("select " + Column + " from " + DCS_TABLE_RECIPES + " left join "+DCS_TABLE_RECIPE_DATA+" using (ID) left join "+DCS_TABLE_RECIPE_OBJECT+" using (ID) where "+DCS_COL_RECIPE_RESREF+"='" + RecipeID + "'");

        if(SQLFetch())
            return SQLGetData(1);
        else
            return "";
    }
    else
    {
        object oRecipeStorer = GetObjectByTag(dcsRecipeInit);
        string StoredRecipe  = GetLocalString(oRecipeStorer, RecipeID);

        return SplitRecipeText(StoredRecipe, Column);
    }
}

/******************************************************************************/

int DCS_GetRecipeEntryInt(string Column, string RecipeID, int AccessDB=FALSE, int RecipeIDEqualResRef=FALSE)
{
    if(AccessDB)
    {
        if(!RecipeIDEqualResRef)
            SQLExecDirect("select " + Column + " from " + DCS_TABLE_RECIPES + " left join "+DCS_TABLE_RECIPE_DATA+" using (ID) left join "+DCS_TABLE_RECIPE_OBJECT+" using (ID) where "+DCS_COL_RECIPE_ID+"='" + RecipeID + "'");
        else
            SQLExecDirect("select " + Column + " from " + DCS_TABLE_RECIPES + " left join "+DCS_TABLE_RECIPE_DATA+" using (ID) left join "+DCS_TABLE_RECIPE_OBJECT+" using (ID) where "+DCS_COL_RECIPE_RESREF+"='" + RecipeID + "'");

        if(SQLFetch())
            return StringToInt(SQLGetData(1));
        else
            return 0;
    }
    else
    {
        object oRecipeStorer = GetObjectByTag(dcsRecipeInit);
        string StoredRecipe  = GetLocalString(oRecipeStorer, RecipeID);

        return StringToInt(SplitRecipeText(StoredRecipe, Column));
    }
}

/******************************************************************************/

void DCS_SetRecipeResources(string ID, string Resources, string Count)
{
    if(Resources == "" || Count == "")return;

    int iSizeRes = SplitStringSize(Count);
    int iCountRes;

    //WriteTimestampedLogEntry("ID: "+ID+", size: "+IntToString(iSizeRes)+", Count: "+Count);

    for(iCountRes=1; iCountRes <= iSizeRes; iCountRes++)
    {
        string sValue = SplitStringValue(Count, iCountRes);
        string sResource = SplitStringValue(Resources, iCountRes);
        int iSizeMRes = SplitStringSize(sValue, dcsLocalMid2, 1);

        //WriteTimestampedLogEntry("Count: "+IntToString(iCountRes)+", sValue: "+sValue+", sResource: "+sResource+", multi res size: "+IntToString(iSizeMRes));

        if(iSizeMRes)
        {
            int iCountMRes;

            for(iCountMRes=1; iCountMRes <= iSizeMRes; iCountMRes++)
            {
                DCS_ArrayAddInt   (ID, "value", SplitStringValueInt(sValue, iCountMRes, dcsLocalMid2), 1, "alt"+inStr(iCountRes));
                DCS_ArrayAddString(ID, "resource", SplitStringValue(sResource, iCountMRes, dcsLocalMid2), 1, "alt"+inStr(iCountRes));

                //WriteTimestampedLogEntry("iCountMRes: "+IntToString(iCountMRes)+", sValue: "+IntToString(SplitStringValueInt(sValue, iCountMRes, dcsLocalMid2))+", sResource: "+SplitStringValue(sResource, iCountMRes, dcsLocalMid2));
            }

            DCS_ArrayAddInt   (ID, "size", iSizeMRes, 1, "alt"+inStr(iCountRes));
            DCS_ArrayAddInt   (ID, "value", SplitStringValueInt(sValue, 1, dcsLocalMid2));
            DCS_ArrayAddString(ID, "resource", SplitStringValue(sResource, 1, dcsLocalMid2));
        }
        else
        {
            DCS_ArrayAddInt   (ID, "value", stInt(sValue));
            DCS_ArrayAddString(ID, "resource", sResource);
        }
    }

    DCS_ArrayAddInt(ID, "size", iSizeRes, 1);

}

/******************************************************************************/

void DCS_SetRecipeItemprops(string ID, string Itemprops)
{
    if(Itemprops == "")return;

    int    iSize = SplitStringSize(Itemprops);
    int    iCount;
    string sProps;

    for(iCount=1; iCount <= iSize; iCount++)
    {
        if(iSize == 1)
            sProps = Itemprops;
        else
            sProps = SplitStringValue(Itemprops, iCount);

        DCS_ArrayAddString(ID, "type",      SplitStringValue(sProps, 1, dcsIPSpace), 1, "ip");
        DCS_ArrayAddString(ID, "costtable", SplitStringValue(sProps, 2, dcsIPSpace), 1, "ip");
        DCS_ArrayAddString(ID, "subtype",   SplitStringValue(sProps, 3, dcsIPSpace), 1, "ip");
    }
    DCS_ArrayAddInt(ID, "size", iSize, 1, "ip");
}

/******************************************************************************/

string GetResourceData(string sResources, string sResourceCount)
{
    int iSizeOut = SplitStringSize(sResources, dcsLocalMid);
    int iCountIn, iCountOut, iSizeIn;
    string sSplitVal, sSplitRes, Data;

    if(!iSizeOut)
    iSizeOut++;

    for(iCountOut=1; iCountOut <= iSizeOut; iCountOut++)
    {
        if(iSizeOut == 1)
        {
            sSplitVal = sResourceCount;
            sSplitRes = sResources;
        }
        else
        {
            sSplitVal = SplitStringValue(sResourceCount, iCountOut, dcsLocalMid);
            sSplitRes = SplitStringValue(sResources, iCountOut, dcsLocalMid);
        }

        iSizeIn = SplitStringSize(sSplitVal);

        for(iCountIn=1; iCountIn <= iSizeIn; iCountIn++)
        {
            Data += nwCrLf+"    "+DCS_GetResourceName(SplitStringValue(sSplitRes, iCountIn))+" x"+inStr(SplitStringValueInt(sSplitVal, iCountIn));
        }
    }
    return Data;
}


/******************************************************************************/

string DCS_GetSpecialIDRecipe(string sSpecialID)
{
    SQLExecDirect("select "+DCS_COL_RECIPE_ID+" from "+DCS_TABLE_RECIPES+" where "+Col(DCS_COL_RECIPE_IS_EXTRA, sSpecialID));

    if(SQLFetch())
    return SQLGetData(1);

    return "";
}

/******************************************************************************/

void DCS_WriteRecipesToLog(object oPC, string RecipeType, int iRowID=0)
{
    string Name, Menutext, SG, Anzahl, Resourcen, ResAnzahl, Level;
    int Rang;

    SQLExecDirect("select "+DCS_COL_RECIPE_NAME+","+DCS_COL_RECIPE_MENUTEXT+","+DCS_COL_RECIPE_DC+","+DCS_COL_RECIPE_AMOUNT+","+DCS_COL_RECIPE_RESOURCES+","+DCS_COL_RECIPE_RESCOUNT+","+DCS_COL_RECIPE_LEVEL+","+DCS_COL_RECIPE_RANK+" from "+DCS_TABLE_RECIPES+" left join "+DCS_TABLE_RECIPE_DATA+" using (ID) left join "+DCS_TABLE_RECIPE_OBJECT+" using (ID) where Typ='"+RecipeType+"' and Name not like '%Menue%' limit 1 offset "+inStr(iRowID));

    if(iRowID==0)
    SendMessageToPC(oPC, "Starting to write "+RecipeType+"!");

    if(SQLFetch())
    {
        Name      = SQLGetData(1);
        Menutext  = SQLGetData(2);
        SG        = SQLGetData(3);
        Anzahl    = SQLGetData(4);
        Resourcen = SQLGetData(5);
        ResAnzahl = SQLGetData(6);
        Level     = SQLGetData(7);
        Rang      = SQLGetDataInt(8);

        WriteTimestampedLogEntry(nwCrLf+">>  "+(Name == "" || Name == "-" ? Menutext : Name)+"  <<\nSG: "+SG+"\nErstellte Anzahl: "+Anzahl+"\nBenötigte Resourcen:"+GetResourceData(Resourcen, ResAnzahl)+"\nBenötigte Stufe: "+Level+"\nBenötigter Rang: "+DCS_GetRankName(Rang)+nwCrLf+nwCrLf+"----------------"+nwCrLf);
        DelayCommand(0.2, DCS_WriteRecipesToLog(oPC, RecipeType, iRowID+1));
    }
    else
    SendMessageToPC(oPC, "Recipes written to log!");
}

/******************************************************************************/

//void main(){}
