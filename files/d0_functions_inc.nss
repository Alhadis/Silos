//::///////////////////////////////////////////////
//:: New Including functions
//:: "d0_functions_inc"
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////

//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: Last Updated: 09. September 2008
//:://////////////////////////////////////////////

#include "d0_const"
#include "aps_include"
#include "nbde_inc"
#include "x2_inc_itemprop"
#include "x3_inc_skin"
#include "x0_i0_position"

// *  Debugging sMessage to all DMs debug channel
void DCS_Debug(string sMessage, int iPrefix=TRUE, int iPostToAllPCs=FALSE);

//*--------------------------------------------------------------------------*\\
//                          Banning CD-Key Commands                           \\
//*--------------------------------------------------------------------------*\\

// *  Delete the whole list of Banned IPs and CD-Keys
void DeleteBanList(int iAccessDB=TRUE);

// *  Unban the Nth CD-Key in List and turn the list of banned CD-Keys
// *  higher than the Nth' CD-Key to a lower Position.
// *   - Nth: The Nth CD-Key, which should be unbanned.
void SetCDKeyUnbanned(int Nth=1, string sCDKey="", int iAccessDB=TRUE);

// *  Set sCDKey to the list of banned CD-Keys.
// *  The CD-Key MUST be a valid CD-Key.
void SetCDKeyBanned(string sCDKey, int iAccessDB=TRUE);

// *  Get the amount of CD-Keys that are currently banned.
int GetCDKeysBanned(int iAccessDB=TRUE);

// *  Returns TRUE, if sCDKey is on the list of banned CD-Keys
int GetIsCDKeyBanned(string sCDKey, int iAccessDB=TRUE);

// *  Get the first banned CD-Key in list.
// *  This resets the position in the CD-Key list for GetNextCDKeyBanned().
string GetFirstCDKeyBanned(int iAccessDB=TRUE);

// *  Get the next banned CD-Key in list.
// *  This picks up where the last GetFirstCDKeyBanned() or GetNextCDKeyBanned()
// *  left off.
string GetNextCDKeyBanned(int iAccessDB=TRUE);

// *  Get the Nth banned CD-Key
string GetNthBannedCDKey(int Nth=1, int iAccessDB=TRUE);

//*----------------------------------------------------------------------------*
//                      Writing Player Information to DB
//*----------------------------------------------------------------------------*

// *  Returns the amount of CDKeys currently written in Database
int GetCDKeysFromDB(int iAccessDB=TRUE);

// *  Get the first written CD-Key in list.
// *  This resets the position in the CD-Key list for GetNextCDKeyWritten().
string GetFirstCDKeyFromDB(int iAccessDB=TRUE);

// *  Get the next written CD-Key in list.
// *  This picks up where the last GetFirstCDKeyWritten() or GetNextCDKeyWritten()
// *  left off.
string GetNextCDKeyFromDB(int iAccessDB=TRUE);

// *  Get the nth written CD-Key in list.
// *  This sets the 'GetNextCDKeyFromDB()'-Poisition to nKey
string GetNthCDKeyFromDB(int nKey=1, int iAccessDB=TRUE);

// *  Returns the amount of written Accounts from sCDKey
int GetAccountsFromCDKey(string sCDKey, int iAccessDB=TRUE);

// *  Converts an account cluster (see example) into normal viewing form
// *  - example: "account1$account2$account3$" to "account1, account2, account3
// *  - with sColor as visualisation
string ConvertAccountCluster(string sCluster, string sSpacer="$", string sColor=nwcYellow);

// *  Returns account cluster from CDKey
// *  - example: "account1$account2$account3$"
string GetAccountClusterFromCDKey(string sCDKey, int iAccessDB=TRUE);

// *  Get the first written Account from sCDKey in list.
// *  This resets the position in the Account list for GetNextAccFromCDKey().
string GetFirstAccountFromCDKey(string sCDKey, int iAccessDB=TRUE);

// *  Get the next written Account from sCDKey in list.
// *  This picks up where the last GetFirstAccFromCDKey() or GetNextAccFromCDKey()
// *  left off.
string GetNextAccountFromCDKey(string sCDKey, int iAccessDB=TRUE);

// *  Get the nth written Account from sCDKey in list.
// *  This picks up where the last GetFirstAccFromCDKey() or GetNextAccFromCDKey()
// *  left off.
string GetNthAccFromCDKey(string sCDKey, int nNth=1, int iAccessDB=TRUE);

//------------------------------------------------------------------------------

// *  Debug sMessage To All DM's and oPC
void Debug(object oPC, string sM, int iFloat=TRUE);

// *  Debug sMessage to oPC
// *   - iFloat: if TRUE: FloatingTextStringOnCreature will be used
// *   - Notice: Advanced Debug needs to be Enabled in the SL-Tool to work.
void AdvDebug(object oPC, string sM, int iFloat=FALSE);

// *  Debug sMessage to all DMs
void AdvDebugDMs(string sM, object oPC=OBJECT_INVALID);

// *  Create a multibeam effect working like chain lightning
// *  - eChainEffect: You can add a Chain-effect that applies with the multibeam
// *  - Note: If you don't want to add a Chain-effect, put in EffectVisualEffect(VFX_NONE)
void ChainMultibeam(object oCaster, float fRange, float fDuration, effect eChainEffect, object oLastTarget=OBJECT_INVALID, int iNearest=0);

// *  Void command from  function DeathGetCreatePlayerCorpse()
void DeathCreatePlayerCorpse(object oPlayer, location lCreate);

// *  Deletes oPlayers current corpse location
void DeathDeleteCorpseLocation(object oPlayer);

// *  Deletes oPlayers current death area location
void DeathDeleteDeathAreaLocation(object oPlayer);

// *  Sets lDeath to the current death area location of oPlayer
void DeathSetDeathAreaLocation(object oPlayer, location lDeath);

// *  Sets lCorpse to the current corpse location of oPlayer
void DeathSetCorpseLocation(object oPlayer, location lCorpse);

// *  Sets oPlayers death marker to iMark (TRUE/FALSE)
void DeathSetIsDeadMarked(object oPlayer, int iMark, int iAccessDB=TRUE);

// *  Delete the whole list of written CD-Key and their assigned Accounts from the DB.
void DeleteWrittenKeyList(int iAccessDB=TRUE);

// *  removes the itemproperty with matching nItemPropertyType and nItemPropertyDuration
void IPRemoveMatchingItemProperty(object oItem, int nItemPropertyType, int nItemPropertyDuration = DURATION_TYPE_TEMPORARY, int nItemPropertySubType = -1);

// *  Remove a certain effect from oCreature
// *  - nEffectType -> EFFECT_TYPE_*
void RemoveCertainEffect(object oCreature, int nEffectType, int nSubType=0);

// *  Makes oPC's associate look like iAssociate
// *  - iAssociate: The Appearance Number of the Associate. Use 0 for default.
void SetAlternativeAssociate(object oPC, int iAssociate);

// *  Switch between SwitchConstant's value TRUE/FALSE
// *  This function's target is always GetModule()
void SetInternModuleSwitch(string SwitchConstant, int bValue);

// *  Switch between SwitchConstant's value TRUE/FALSE
void SetInternSwitch(string SwitchConstant, int bValue, object oTarget=OBJECT_SELF);

// *  Log the information about oPC.
void WritePlayerData(object oPC, int iAccessDB=TRUE);

// *  Returns TRUE, if oPC enabled advanced debugging
int AdvDebugStatus(object oPC);

// *  This is used to calculate the total damage done to oPC
// *  - nElementType: IP_CONST_DAMAGETYPE_*
int CalculateTotalDamage(object oTarget, int nDamageDone, int nDamageType);

// *  Returns oPlayers current death mark
int DeathGetIsDeadMarked(object oPlayer, int iAccessDB=TRUE);

// *  Get the total from rolling (nNumDice x dX dice).
// *  - nDiceValue: If this is less than 1, the value 1 will be used.
// *  - nNumDice: If this is less than 1, the value 1 will be used.
int diceX(int nDiceValue=1, int nNumDice=1);

// * Find the position of sSubstring inside sString
// * - nStart: The character position to start searching at (from the left end of the string).
// * - nIgnoreCaseSense: Ignores the case sensitivity when searching for the position of sSubstring inside sString
// * Return value on error: -1
int FindSubStringByCase(string sString, string sSubString, int nStart=0, int nIgnoreCaseSense=TRUE);

// *  Returns current alternative associate from oPC
// *  - default: 0
int GetAlternativeAssociate(object oPC);

// *  Returns the first inventory slot from the "INVENTORY_SLOT_*" constants
int GetFirstInventorySlot();

// *  Get First Skill in Row. Resets the Counter to 1
int GetFirstSkill();

int GetHasSLTool(object oPlayer=OBJECT_SELF);

// *  Returns the Class with the highest level
// *   - Returnvalue on Error: CLASS_TYPE_INVALID
int GetHighestLevelFromClasses(object oCreature, int iClass1, int iClass2, int iClass3=CLASS_TYPE_INVALID);

// *  Returns TRUE, if sAccountName is already written to sCDKeys Database
int GetIsAccountAssignedToCDKey(string sAccountName, string sCDKey, int iAccessDB=TRUE);

// *  Returns TRUE, if sCDKey is already written to Modules DB
int GetIsCDKeyWrittenToDB(string sCDKey, int iAccessDB=TRUE);

// *  Returns TRUE, if oPlayer is marked as dead
int GetIsDeadMarked(object oPlayer, int iAccessDB=TRUE);

// *  Returns TRUE, if oPC is in the arena of area "Silberbaum - Arena"
int GetIsInArena(object oPC);

// *  Returns TRUE, if the Inventory Slot is valid
int GetIsInventorySlotValid(int nInventorySlot);

// *  Returns TRUE, if oItem is a valid weapon
// *   - ALL baseitem types will count & all cep weapons included
// *   - Exceptions: STAFFS & RODS
int GetIsWeapon(object oItem, int NoStaffs=TRUE);

// *  Get module switch value from SwitchConstant
int GetInternModuleSwitch(string SwitchConstant);

// *  Get switch value from SwitchConstant
int GetInternSwitch(string SwitchConstant, object oTarget=OBJECT_SELF);

// *  Returns the next inventory slot from the "INVENTORY_SLOT_*" constants,
// *  starting from the last position.
int GetNextInventorySlot();

// *  Get Next Skill in Row. Returns where last GetNextSkill() or GetFirstSkill()
// *  was executed
int GetNextSkill();

// *  Get Nth Skill in Row. Sets the Counter to Nth
int GetNthSkill(int nNth=1);

// *  Get NWNX-module connection: ODBC
int GetNWNXModuleConnect_ODBC(int iInfoCreate=FALSE);

// *  Get NWNX database connection type
int GetNWNXDatabaseConnection(int iInfoCreate=FALSE);

// *  Get NWNX-module connection: Functions
int GetNWNXModuleConnect_Functions(int iInfoCreate=FALSE);

// *  Get NWNX-module connection: Profiler
int GetNWNXModuleConnect_Profiler(int iInfoCreate=FALSE);

// *  Get NWNX-module connection: Fixes
int GetNWNXModuleConnect_Fixes(int iInfoCreate=FALSE);

// *  Returns a valid POLYMORPH_TYPE_* to iAppearance (or other from the list not visible in constants)
// *  - if there's no polymorph type for this appearance, 0 will be returned
int GetPolymorphFromAppearance(int iAppearance);

// *  Returns an Int between nMinimum and nMaximum
int GetRandomInt(int nMinimum = 2, int nMaximum = 10);

// *  Get the total resistance of oPC against nElementType
int GetResistanceAgainst(object oPC, int nElementType);

// *  Returns current Setvar from oObject
int GetSetVar(object oObject=OBJECT_SELF);

// *  Returns current Subvar from oObject
int GetSubVar(object oObject=OBJECT_SELF);

// *  Get the total vulnerability of oPC against nElementType
int GetVulnerabiltyAgainst(object oPC, int nElementType);

// Maths operation: iValue is raised to the power of iExponent
// * Returns zero if iValue == 0 and iExponent < 0
int powInt(int iValue, int iExponent);

// *  Round fValue from a decimal to an integer
int RoundValue(float fValue);

// *  Color Text in Color
// *  Use the nwc**** constants as colors
string ColorText(string Text, string Color);

// *  Converts iNumber into a string signed with '.' at each '000'
// *  - 100000 = 100.000
string ConvertNumberToString(int iNumber);

// *  Returns the Itemproperty Name + Subtypes in a string, i.e: "Ability Charism +2"
string GetItemPropertyTypeName(itemproperty ipItemProperty);

// *  Returns the first valid skill name in row
string GetFirstSkillName();

// *  Returns the next valid skill name in row, starting at
// *  the last row ended
string GetNextSkillName();

// *  Returns the nth valid skill name in row
string GetNthSkillName(int nNth=1);

// *  Returns version information about SL-Tool
string GetSLToolVersionInfo();

// *  Inserts sInsert into sText at text position nPosition
string InsertTextPhraseByPosition(string sText, string sInsert, int nPosition=0);

// * Replace sPhrase with sReplaceWith in sText
// * - iReplaceAll: Replaces all phrases or just the first that is found
// * - iIgnoreCaseSense: Ignore case sensitivity of sPhrase while searching.
string ReplaceTextPhrase(string sText, string sPhrase, string sReplaceWith, int iReplaceAll=TRUE, int iIgnoreCaseSense=TRUE);

// *  Marks the text phrase in sText that begins at the position iLeft and ends at iRight
// *  and replaces it with sReplaceWith
string ReplaceTextPhraseByPosition(string sText, string sReplaceWith, int iLeft, int iRight);

// *  Create a multibeam effect
effect EffectMultibeam(object oEffector, int nBodypart, int bMissEffect=FALSE);

// *  Creates and returns a corpse for oPlayer at location lCreate
object DeathGetCreatePlayerCorpse(object oPlayer, location lCreate);

// *  Returns target player from corpse object
object DeathGetCorpsePlayer(object oCorpse);

// *  Returns target corpse object from player
object DeathGetPlayerCorpse(object oPlayer);

// *  Returns first Associate found from oPlayer
object FindAssociate(object oPlayer);

// *  Returns current SL-Tool target
object GetSLToolTarget(object oPlayer=OBJECT_SELF);

// *  Returns first neearest creature with sName as name
object GetNearestCreatureByName(string sName, object oTarget=OBJECT_SELF, int nNth=1);

// *  Returns first Player cahracter with the name sName
object GetPCByName(string sName, int nNth=1);

// *  Returns oPlayers current corpse location
location DeathGetCorpseLocation(object oPlayer);

// *  Returns oPlayers current death area location
location DeathGetDeathAreaLocation(object oPlayer);

// *  Returns the SL-Tool location for oPlayer
location GetSLToolLocation(object oPlayer=OBJECT_SELF);

// *  Returns a random number between fMinimum and fMaximum
float GetRandomFloat(float fMinimum = 0.2, float fMaximum = 1.0);

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

void DCS_Debug(string sMessage, int iPrefix=TRUE, int iPostToAllPCs=FALSE)
{
    object oDM = GetFirstPC();
    string Prefix;

    if(iPrefix)Prefix = "<cð> *** </c>";

    while(GetIsObjectValid(oDM))
    {
        if(GetIsDM(oDM) || iPostToAllPCs)
        SendMessageToPC(oDM, Prefix+sMessage);

        oDM = GetNextPC();
    }
}

//*-----------------------------------------------------------------------------
// Ban CD-Key Commands and listing them
//*-----------------------------------------------------------------------------

string GetFirstCDKeyBanned(int iAccessDB=TRUE)
{
    SetLocalInt(GetModule(), "GET_BAN_KEYPOS", 1);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_CDKEY+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_BANNED+"=1 limit 1");

        if(SQLFetch())
        {
            return SQLGetData(1);
        }
    }
    //AdvDebugDMs("GET_BAN_KEYPOS: "+IntToString(GetLocalInt(GetModule(), "GET_BAN_KEYPOS"))+", Banned CD-Key: "+sKey);

    return NBDE_GetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(1), GetObjectByTag("d0_dbase_keyban"));
}

//------------------------------------------------------------------------------

string GetNextCDKeyBanned(int iAccessDB=TRUE)
{
    int nPos = GetLocalInt(GetModule(), "GET_BAN_KEYPOS")+1;
    SetLocalInt(GetModule(), "GET_BAN_KEYPOS", nPos);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_CDKEY+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_BANNED+"=1 limit "+inStr(GetCDKeysBanned())+" offset "+IntToString(nPos-1));

        if(SQLFetch())
        {
            return SQLGetData(1);
        }
    }
    //AdvDebugDMs("GET_BAN_KEYPOS: "+IntToString(GetLocalInt(GetModule(), "GET_BAN_KEYPOS"))+", Banned CD-Key: "+sKey);

    return NBDE_GetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(nPos), GetObjectByTag("d0_dbase_keyban"));
}

//------------------------------------------------------------------------------

string GetNthBannedCDKey(int Nth=1, int iAccessDB=TRUE)
{
    SetLocalInt(GetModule(), "GET_BAN_KEYPOS", Nth);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_CDKEY+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_BANNED+"=1 limit "+inStr(GetCDKeysBanned())+" offset "+IntToString(Nth-1));

        if(SQLFetch())
        {
            return SQLGetData(1);
        }
    }
    //AdvDebugDMs("GET_BAN_KEYPOS: "+IntToString(GetLocalInt(GetModule(), "GET_BAN_KEYPOS"))+", Banned CD-Key: "+sKey);

    return NBDE_GetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(Nth), GetObjectByTag("d0_dbase_keyban"));
}

//------------------------------------------------------------------------------

int GetCDKeysBanned(int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("select count(*) from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_BANNED+"=1");

        if(SQLFetch())
        {
            return StringToInt(SQLGetData(1));
        }
    }

    return NBDE_GetCampaignInt("TerraEquilibrium", "GET_BANNED_CDKEYS", GetObjectByTag("d0_dbase_keyban"));
}

//------------------------------------------------------------------------------

int GetIsCDKeyBanned(string sCDKey, int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_BANNED+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            return StringToInt(SQLGetData(1));
        }

        return FALSE;
    }

    string sMatchKey = NBDE_GetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_1", GetObjectByTag("d0_dbase_keyban"));
    int iMaxKeys     = GetCDKeysBanned();
    int i            = 1;

    while(i <= iMaxKeys)
    {
        if(sCDKey == sMatchKey)
        {
            return TRUE;
            break;
        }

        i++;
        sMatchKey = NBDE_GetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(i), GetObjectByTag("d0_dbase_keyban"));
    }

    return FALSE;
}

//------------------------------------------------------------------------------

void SetCDKeyUnbanned(int Nth=1, string sCDKey="", int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("update "+DCS_TABLE_TE_DATA_KEYS+" set "+DCS_COL_BANNED+"=0 where "+DCS_COL_CDKEY+"='"+sCDKey+"'");
    }
    else
    {
        int nMax = GetCDKeysBanned();
        string sKey = GetNthBannedCDKey(Nth);

        if(Nth == nMax)
        {
            NBDE_DeleteCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(Nth), GetObjectByTag("d0_dbase_keyban"));
        }
        else if(Nth < nMax)
        {
          while (Nth < nMax)
          {
              NBDE_SetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(Nth), GetNthBannedCDKey(Nth+1), GetObjectByTag("d0_dbase_keyban"));

              Nth++;
          }
        }

        if(nMax > 1)
        {
            NBDE_SetCampaignInt("TerraEquilibrium", "GET_BANNED_CDKEYS", GetCDKeysBanned()-1, GetObjectByTag("d0_dbase_keyban"));
        }
        else if(nMax <= 1)
        {
            NBDE_DeleteCampaignInt("TerraEquilibrium", "GET_BANNED_CDKEYS", GetObjectByTag("d0_dbase_keyban"));
        }

        //Debug(oFloatString, nwcDebug+"CD-Key "+sKey+" has been successfully unbanned</c>");
        DelayCommand(1.0, NBDE_FlushCampaignDatabase("TerraEquilibrium"));
    }
}

//------------------------------------------------------------------------------

void SetCDKeyBanned(string sCDKey, int iAccessDB=TRUE)
{
    if(sCDKey != "")
    {
        if(iAccessDB)
        {
            SQLExecDirect("update "+DCS_TABLE_TE_DATA_KEYS+" set "+DCS_COL_BANNED+"=1 where "+DCS_COL_CDKEY+"='"+sCDKey+"'");
        }
        else
        {
            int nCDKeys = GetCDKeysBanned() + 1;
            NBDE_SetCampaignInt("TerraEquilibrium", "GET_BANNED_CDKEYS", nCDKeys, GetObjectByTag("d0_dbase_keyban"));
            NBDE_SetCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(nCDKeys), sCDKey, GetObjectByTag("d0_dbase_keyban"));

            DelayCommand(1.0, NBDE_FlushCampaignDatabase("TerraEquilibrium"));
            AdvDebugDMs("CD-Key No. "+IntToString(nCDKeys)+" Banned: "+sCDKey);
        }
    }
}

//------------------------------------------------------------------------------

void DeleteBanList(int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("update "+DCS_TABLE_TE_DATA_KEYS+" set "+DCS_COL_BANNED+"=0");
    }
    else
    {
        int i=1;
        int iMaxKeys = GetCDKeysBanned();

        while(i <= iMaxKeys)
        {
            NBDE_DeleteCampaignString("TerraEquilibrium", "GET_BANNED_CDKEY_"+IntToString(i), GetObjectByTag("d0_dbase_keyban"));

            i++;
        }

        NBDE_DeleteCampaignInt("TerraEquilibrium", "GET_BANNED_CDKEYS", GetObjectByTag("d0_dbase_keyban"));
    }
}

//*-----------------------------------------------------------------------------
// Writing Player Information to DB and listing them
//*-----------------------------------------------------------------------------

string SQLDecodeStringValue(string sValue, int nNth, string sSpacer="$")
{
    string sSavedString;
    int iSubString = FindSubString(sValue, sSpacer);
    int iSpaceLen  = GetStringLength(sSpacer);
    int iLength    = GetStringLength(sValue);
    int i;

    for(i=1; i <= nNth; i++)
    {
        sSavedString = GetStringLeft(sValue, iSubString+iSpaceLen);
        sValue       = GetStringRight(sValue, iLength-(iSubString+iSpaceLen));
        iLength      = GetStringLength(sValue);
        iSubString   = FindSubString(sValue, sSpacer);
    }

    return GetStringLeft(sSavedString, GetStringLength(sSavedString)-iSpaceLen);
}

//*-----------------------------------------------------------------------------

int SQLDecodeStringValueCount(string sValue, string sSpacer="$")
{
    int iSubString = FindSubString(sValue, sSpacer);
    int iSpaceLen  = GetStringLength(sSpacer);
    int iLength    = GetStringLength(sValue);
    int i;

    for(i=0; sValue != ""; i++)
    {
        sValue      = GetStringRight(sValue, iLength-(iSubString+iSpaceLen));
        iLength     = GetStringLength(sValue);
        iSubString  = FindSubString(sValue, sSpacer);
    }
    return i;
}

//*-----------------------------------------------------------------------------

int GetCDKeysFromDB(int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("select count(*) from "+DCS_TABLE_TE_DATA_KEYS);

        if(SQLFetch())
        {
            return StringToInt(SQLGetData(1));
        }
    }

    return NBDE_GetCampaignInt("TerraEquilibrium", "KL_MAX_CDKEYS_LOGGED", GetObjectByTag("d0_dbase_keylog"));

}

//------------------------------------------------------------------------------

string GetFirstCDKeyFromDB(int iAccessDB=TRUE)
{
    SetLocalInt(GetModule(), "KL_GET_KEYPOS", 1);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_CDKEY+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_ROWID+"=1");

        if(SQLFetch())
        {
            return SQLGetData(1);
        }
        //return GetLocalString(GetModule(), SQL_KEYLOGGER_KEY+"1");
    }

    return NBDE_GetCampaignString("TerraEquilibrium", "KL_WRITE_KEY_"+IntToString(1), GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

string GetNextCDKeyFromDB(int iAccessDB=TRUE)
{
    int nPos = GetLocalInt(GetModule(), "KL_GET_KEYPOS")+1;
    SetLocalInt(GetModule(), "KL_GET_KEYPOS", nPos);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_CDKEY+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_ROWID+"="+IntToString(nPos));

        if(SQLFetch())
        {
            return SQLGetData(1);
        }

        //return GetLocalString(GetModule(), SQL_KEYLOGGER_KEY+IntToString(nPos));
    }

    return NBDE_GetCampaignString("TerraEquilibrium", "KL_WRITE_KEY_"+IntToString(nPos), GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

string GetNthCDKeyFromDB(int nKey=1, int iAccessDB=TRUE)
{
    SetLocalInt(GetModule(), "KL_GET_KEYPOS", nKey);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_CDKEY+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_ROWID+"="+IntToString(nKey));

        if(SQLFetch())
        {
            return SQLGetData(1);
        }

        //return GetLocalString(GetModule(), SQL_KEYLOGGER_KEY+IntToString(nKey));
    }

    return NBDE_GetCampaignString("TerraEquilibrium", "KL_WRITE_KEY_"+IntToString(nKey), GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

int GetAccountsFromCDKey(string sCDKey, int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            return SQLDecodeStringValueCount(SQLGetData(1));
        }

        //return SQLDecodeStringValueCount(GetLocalString(GetModule(), sCDKey+SQL_KEYLOGGER_ACCOUNTS));
    }

    return NBDE_GetCampaignInt("TerraEquilibrium", sCDKey+"_ACCS_LOGGED", GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

string GetFirstAccountFromCDKey(string sCDKey, int iAccessDB=TRUE)
{
    SetLocalInt(GetModule(), "KL_GET_ACCPOS", 1);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            return SQLDecodeStringValue(SQLGetData(1), 1);
        }

        //return SQLDecodeStringValue(GetLocalString(GetModule(), sCDKey+SQL_KEYLOGGER_ACCOUNTS), 1);
    }

    return NBDE_GetCampaignString("TerraEquilibrium", sCDKey+"_ACC_"+IntToString(1), GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

string GetNextAccountFromCDKey(string sCDKey, int iAccessDB=TRUE)
{
    int nPos = GetLocalInt(GetModule(), "KL_GET_ACCPOS")+1;
    SetLocalInt(GetModule(), "KL_GET_ACCPOS", nPos);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            return SQLDecodeStringValue(SQLGetData(1), nPos);
        }

        //return SQLDecodeStringValue(GetLocalString(GetModule(), sCDKey+SQL_KEYLOGGER_ACCOUNTS), nPos);
    }

   return NBDE_GetCampaignString("TerraEquilibrium", sCDKey+"_ACC_"+IntToString(nPos), GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

string GetNthAccFromCDKey(string sCDKey, int nNth=1, int iAccessDB=TRUE)
{
    SetLocalInt(GetModule(), "KL_GET_ACCPOS", nNth);

    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            return SQLDecodeStringValue(SQLGetData(1), nNth);
        }

        //return SQLDecodeStringValue(GetLocalString(GetModule(), sCDKey+SQL_KEYLOGGER_ACCOUNTS), nNth);
    }

    return NBDE_GetCampaignString("TerraEquilibrium", sCDKey+"_ACC_"+IntToString(nNth), GetObjectByTag("d0_dbase_keylog"));
}

//------------------------------------------------------------------------------

string ConvertAccountCluster(string sCluster, string sSpacer="$", string sColor=nwcYellow)
{
    int iStart;
    int iFindSpacer = FindSubString(sCluster, sSpacer);
    string sReturn  = "'"+ColorText(GetSubString(sCluster, iStart, iFindSpacer), sColor)+"'";

    //AdvDebug(GetFirstPC(), "iStart: "+IntToString(iStart)+", iFindSpacer: "+IntToString(iFindSpacer)+", sReturn: "+sReturn);

    while(iFindSpacer != -1)
    {
        if(iStart != 0)
        {
            sReturn += ", '"+ColorText(GetSubString(sCluster, iStart, iFindSpacer-iStart), sColor)+"'";
            //AdvDebug(GetFirstPC(), "iStart: "+IntToString(iStart)+", iFindSpacer: "+IntToString(iFindSpacer)+", sReturn: "+sReturn);
        }

        iStart      = iFindSpacer+1;
        iFindSpacer = FindSubString(sCluster, sSpacer, iStart);
    }

    return sReturn;
}

//------------------------------------------------------------------------------

string GetAccountClusterFromCDKey(string sCDKey, int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        string sTable = DCS_TABLE_TE_DATA_KEYS;
        SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from "+sTable+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            return SQLGetData(1);
        }
    }

    return "";
}

//------------------------------------------------------------------------------

int GetIsCDKeyWrittenToDB(string sCDKey, int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ROWID+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        return SQLFetch();
    }

    string sKey = GetNthCDKeyFromDB(1);
    int nMaxKey = GetCDKeysFromDB();
    int i       = 1;
    int iRet    = FALSE;

    while(i <= nMaxKey)
    {
        if(sKey == sCDKey)
        {
            iRet = TRUE;
            break;
        }

        i++;
        sKey = GetNthCDKeyFromDB(i);
    }

    return iRet;
}

//------------------------------------------------------------------------------

int GetIsAccountAssignedToCDKey(string sAccountName, string sCDKey, int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from "+DCS_TABLE_TE_DATA_KEYS+" where "+DCS_COL_CDKEY+"='"+sCDKey+"'");

        if(SQLFetch())
        {
            string Data = SQLGetData(1);
            return FindSubString(Data, sAccountName) != -1;
        }

        return FALSE;
    }

    string sAcc = GetFirstAccountFromCDKey(sCDKey);
    int nMaxAcc = GetAccountsFromCDKey(sCDKey);
    int i       = 1;
    int iRet    = FALSE;

    while(i <= nMaxAcc)
    {
        if(sAccountName == sAcc)
        {
            iRet = TRUE;
            break;
        }

        sAcc = GetNextAccountFromCDKey(sCDKey);
        i++;
    }

    return iRet;
}

//------------------------------------------------------------------------------

void WriteCDKeyToDB(string sCDKey, int iAccessDB=TRUE)
{
    int nKeys = GetCDKeysFromDB()+1;
    if(!GetIsCDKeyWrittenToDB(sCDKey, iAccessDB))
    {
        DCS_Debug(SystemMsg+"CD-Key "+ColorText(sCDKey, nwcRed)+" in Datenbank geschrieben");

        if(iAccessDB)
        {
            SQLExecDirect("insert into "+DCS_TABLE_TE_DATA_KEYS+" ("+DCS_COL_CDKEY+") values ('"+sCDKey+"')");
        }
        else
        {
            NBDE_SetCampaignString("TerraEquilibrium", "KL_WRITE_KEY_"+IntToString(nKeys), sCDKey, GetObjectByTag("d0_dbase_keylog"));
            NBDE_SetCampaignInt("TerraEquilibrium", "KL_MAX_CDKEYS_LOGGED", nKeys, GetObjectByTag("d0_dbase_keylog"));
            DelayCommand(1.0, NBDE_FlushCampaignDatabase("TerraEquilibrium"));
        }
    }
}

//------------------------------------------------------------------------------

void AssignAccountToCDKey(string sAccountName, string sCDKey, int iAccessDB=TRUE)
{
    if(!GetIsAccountAssignedToCDKey(sAccountName, sCDKey, iAccessDB))
    {
        DCS_Debug(SystemMsg+"Account ''"+ColorText(sAccountName, nwcRed)+"'' wurde zum CD-Key "+ColorText(sCDKey, nwcRed)+" hinzugefügt");

        if(iAccessDB)
        {
            string sTable    = DCS_TABLE_TE_DATA_KEYS;
            string sAccounts = GetAccountClusterFromCDKey(sCDKey)+sAccountName+"$";
            SQLExecDirect("update "+sTable+" set "+DCS_COL_ACCOUNTS+"='"+sAccounts+"' where "+DCS_COL_CDKEY+"='"+sCDKey+"'");
        }
        else
        {
            // Write Account to CDKey and increment written account number.
            NBDE_SetCampaignString("TerraEquilibrium", sCDKey+"_ACC_"+IntToString(GetAccountsFromCDKey(sCDKey)+1), sAccountName, GetObjectByTag("d0_dbase_keylog"));
            NBDE_SetCampaignInt("TerraEquilibrium", sCDKey+"_ACCS_LOGGED", GetAccountsFromCDKey(sCDKey)+1, GetObjectByTag("d0_dbase_keylog"));
            DelayCommand(1.0, NBDE_FlushCampaignDatabase("TerraEquilibrium"));
        }
    }
}

//------------------------------------------------------------------------------

void DeleteAccList(string sCDKey, int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        SQLExecDirect("update "+DCS_TABLE_TE_DATA_KEYS+" set "+DCS_COL_ACCOUNTS+"='' where "+DCS_COL_CDKEY+"='"+sCDKey+"'");
    }
    else
    {
        int i=1;
        int iMaxAccs = GetAccountsFromCDKey(sCDKey);

        while(i <= iMaxAccs)
        {
            NBDE_DeleteCampaignInt("TerraEquilibrium", sCDKey+"_ACC_"+IntToString(i), GetObjectByTag("d0_dbase_keylog"));
            i++;
        }
        NBDE_DeleteCampaignInt("TerraEquilibrium", sCDKey+"_ACCS_LOGGED", GetObjectByTag("d0_dbase_keylog"));
    }
}

//------------------------------------------------------------------------------

void DeleteWrittenKeyList(int iAccessDB=TRUE)
{
    if(iAccessDB)
    {
        string sTable = DCS_TABLE_TE_DATA_KEYS;
        SQLExecDirect("delete from "+sTable);
    }
    else
    {
        int    i        = 1;
        int    iMaxKeys = GetCDKeysFromDB();
        string sKey     = GetFirstCDKeyFromDB();

        while(i <= iMaxKeys)
        {
            DeleteAccList(sKey);
            NBDE_DeleteCampaignString("TerraEquilibrium", "KL_WRITE_KEY_"+IntToString(i), GetObjectByTag("d0_dbase_keylog"));

            i++;
            sKey = GetNextCDKeyFromDB();
        }

        NBDE_DeleteCampaignInt("TerraEquilibrium", "KL_MAX_CDKEYS_LOGGED", GetObjectByTag("d0_dbase_keylog"));
    }
}

//------------------------------------------------------------------------------

void WritePlayerKeyToDatabase(object oPC, int iAccessDB=TRUE)
{
    if(!GetInternModuleSwitch("KEYLOGGER_OFF"))
    {
        string sAcc = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
        WriteCDKeyToDB(GetPCPublicCDKey(oPC), iAccessDB);
        DelayCommand(1.5, AssignAccountToCDKey(sAcc, GetPCPublicCDKey(oPC), iAccessDB));
    }
}

//------------------------------------------------------------------------------

void WritePlayerData(object oPC, int iAccessDB=TRUE)
{
    if(!GetInternModuleSwitch("KEYLOGGER_OFF"))
    {
        string sAcc = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
        string sKey = GetPCPublicCDKey(oPC);
        string sIP = GetPCIPAddress(oPC);

        WritePlayerKeyToDatabase(oPC, iAccessDB);
        SQLExecDirect("update "+DCS_TABLE_TE_DATA_KEYS+" set "+DCS_COL_IPADDRESS+"='"+sIP+"', "+DCS_COL_LASTONLINE+"=(select localtime()) where "+DCS_COL_CDKEY+"='"+sKey+"'");
    }
}

//------------------------------------------------------------------------------

void PCA_AddAccountToDatabase(object oPlayer)
{
    string sTable  = DCS_TABLE_TE_DATA_KEYS_UNLOCKED;
    string sPCName = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));

    SQLExecDirect("select * from "+sTable+" where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");

    if(!SQLFetch())
    SQLExecDirect("insert into "+sTable+" ("+DCS_COL_ACCOUNTS+") values ('"+sPCName+"')");
}

//*-----------------------------------------------------------------------------

void PCA_UnlockPlayerCDKeyInAccount(object oPlayer)
{
    string sTable  = DCS_TABLE_TE_DATA_KEYS_UNLOCKED;
    string sSpace  = dcsSpace;
    string sPCName = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));

    SQLExecDirect("select "+DCS_COL_CDKEY+" from "+sTable+" where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");

    if(SQLFetch())
    {
        string sCDKeys = SQLGetData(1);

        SQLExecDirect("update "+sTable+" set "+DCS_COL_CDKEY+"='"+sCDKeys+GetPCPublicCDKey(oPlayer)+sSpace+"' where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");
    }
    else
        SQLExecDirect("update "+sTable+" set "+DCS_COL_CDKEY+"='"+GetPCPublicCDKey(oPlayer)+sSpace+"' where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");
}

//*-----------------------------------------------------------------------------

void PCA_LockPlayerCDKeyInAccount(object oPlayer)
{
    string sPCName = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));
    string sTable  = DCS_TABLE_TE_DATA_KEYS_UNLOCKED;
    string sCDKey, sKeyLeft, sKeyRight;
    int iKeyPos;

    SQLExecDirect("select "+DCS_COL_CDKEY+" from "+sTable+" where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");

    if(SQLFetch())
    {
        sCDKey    = SQLGetData(1);
        iKeyPos   = FindSubString(sCDKey, GetPCPublicCDKey(oPlayer));
        sKeyLeft  = GetStringLeft(sCDKey, iKeyPos);
        sKeyRight = GetStringRight(sCDKey,GetStringLength(sCDKey) - (iKeyPos + GetStringLength(GetPCPublicCDKey(oPlayer)) + 1));

        SQLExecDirect("update "+sTable+" set "+DCS_COL_CDKEY+"='"+sKeyLeft+sKeyRight+"' where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");
    }
}

//*-----------------------------------------------------------------------------

int PCA_GetPlayerCDKeyInAccount(object oPlayer)
{
    string sPCName = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));
    string sTable  = DCS_TABLE_TE_DATA_KEYS_UNLOCKED;
    string sSpace  = dcsSpace;

    SQLExecDirect("select "+DCS_COL_CDKEY+" from "+sTable+" where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");

    if(SQLFetch())
    {
        string sCDKey = SQLGetData(1);
        return FindSubString(sCDKey, GetPCPublicCDKey(oPlayer)) != -1;
    }
    else
    {
        SQLExecDirect("update "+sTable+" set "+DCS_COL_CDKEY+"='"+GetPCPublicCDKey(oPlayer)+sSpace+"' where "+DCS_COL_ACCOUNTS+"='"+sPCName+"'");
        return TRUE;
    }

    return FALSE;
}

//*-----------------------------------------------------------------------------
// Other Commands
//*-----------------------------------------------------------------------------

void Debug(object oPC, string sM, int iFloat=TRUE)
{
    if(iFloat)
    FloatingTextStringOnCreature(sM, oPC, FALSE);
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int AdvDebugStatus(object oPC)
{
    return GetInternSwitch("ADVANCED_DEBUG_ENABLED", oPC);
}

//------------------------------------------------------------------------------

void AdvDebug(object oPC, string sM, int iFloat=FALSE)
{
    if(GetInternSwitch("ADVANCED_DEBUG_ENABLED", oPC))
    {
        if(iFloat)FloatingTextStringOnCreature(sM, oPC, FALSE);
        else SendMessageToPC(oPC, sM);
    }
}

//------------------------------------------------------------------------------

void AdvDebugDMs(string sM, object oPC=OBJECT_INVALID)
{
    if(GetInternModuleSwitch("ADVANCED_DEBUG_ENABLED"))
    {
        SendMessageToAllDMs(sM);
        SendMessageToPC(oPC, sM);
    }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetFirstInventorySlot()
{
    SetLocalInt(GetModule(), "INVENTORY_SLOT_POS", 0);

    return INVENTORY_SLOT_HEAD;
}

//------------------------------------------------------------------------------

int GetNextInventorySlot()
{
    int nPos = GetLocalInt(GetModule(), "INVENTORY_SLOT_POS")+1;
    int nRet;
    SetLocalInt(GetModule(), "INVENTORY_SLOT_POS", nPos);

    switch(nPos)
    {
        case 0: nRet=INVENTORY_SLOT_HEAD;break;
        case 1: nRet=INVENTORY_SLOT_CHEST;break;
        case 2: nRet=INVENTORY_SLOT_BOOTS;break;
        case 3: nRet=INVENTORY_SLOT_ARMS;break;
        case 4: nRet=INVENTORY_SLOT_RIGHTHAND;break;
        case 5: nRet=INVENTORY_SLOT_LEFTHAND;break;
        case 6: nRet=INVENTORY_SLOT_CLOAK;break;
        case 7: nRet=INVENTORY_SLOT_LEFTRING;break;
        case 8: nRet=INVENTORY_SLOT_RIGHTRING;break;
        case 9: nRet=INVENTORY_SLOT_NECK;break;
        case 10:nRet=INVENTORY_SLOT_BELT;break;
        case 11:nRet=INVENTORY_SLOT_ARROWS;break;
        case 12:nRet=INVENTORY_SLOT_BULLETS;break;
        case 13:nRet=INVENTORY_SLOT_BOLTS;break;
        case 14:nRet=INVENTORY_SLOT_CWEAPON_L;break;
        case 15:nRet=INVENTORY_SLOT_CWEAPON_R;break;
        case 16:nRet=INVENTORY_SLOT_CWEAPON_B;break;
        case 17:nRet=INVENTORY_SLOT_CARMOUR;break;
        default: nRet=18;
    }

    return nRet;
}

//------------------------------------------------------------------------------

int GetIsInventorySlotValid(int nInventorySlot)
{
    if(nInventorySlot >= 18)
    return FALSE;

    return TRUE;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetResistanceAgainst(object oPC, int nElementType)
{
  int nResistance;
  int nSlot = GetFirstInventorySlot();
  object oWpn = GetItemInSlot(nSlot, oPC);
  itemproperty ipProp = GetFirstItemProperty(oWpn);

  while(GetIsInventorySlotValid(nSlot))
  {
     while(GetIsItemPropertyValid(ipProp))
     {
        if(GetItemPropertyType(ipProp) == ITEM_PROPERTY_DAMAGE_RESISTANCE &&
           GetItemPropertySubType(ipProp) == nElementType)
        {
           if(GetItemPropertyCostTableValue(ipProp) > nResistance)
           nResistance = GetItemPropertyCostTableValue(ipProp);
        }

        ipProp = GetNextItemProperty(oWpn);
     }

     nSlot  = GetNextInventorySlot();
     oWpn   = GetItemInSlot(nSlot, oPC);
     ipProp = GetFirstItemProperty(oWpn);
  }


  switch (nResistance)
  {
      case 1:nResistance=5;break;
      case 2:nResistance=10;break;
      case 3:nResistance=15;break;
      case 4:nResistance=20;break;
      case 5:nResistance=25;break;
      case 6:nResistance=30;break;
      case 7:nResistance=35;break;
      case 8:nResistance=40;break;
      case 9:nResistance=45;break;
      case 10:nResistance=50;break;
  }
  //AdvDebug(oPC, "nResistance: "+IntToString(nResistance));

 return nResistance;
}

//------------------------------------------------------------------------------

int GetVulnerabiltyAgainst(object oPC, int nElementType)
{
  int nVuln;
  int nSlot = GetFirstInventorySlot();
  object oWpn = GetItemInSlot(nSlot, oPC);
  itemproperty ipProp = GetFirstItemProperty(oWpn);

  while(GetIsInventorySlotValid(nSlot))
  {
     while(GetIsItemPropertyValid(ipProp))
     {
        if(GetItemPropertyType(ipProp) == ITEM_PROPERTY_DAMAGE_VULNERABILITY &&
           GetItemPropertySubType(ipProp) == nElementType)
        {
           if(GetItemPropertyCostTableValue(ipProp) > nVuln)
           nVuln = GetItemPropertyCostTableValue(ipProp);
        }

        ipProp = GetNextItemProperty(oWpn);
     }

    nSlot  = GetNextInventorySlot();
    oWpn   = GetItemInSlot(nSlot, oPC);
    ipProp = GetFirstItemProperty(oWpn);
  }

  //AdvDebug(oPC, "nVuln: "+IntToString(nVuln));
  switch(nVuln)
  {
    case 1: nVuln = 5;break;
    case 2: nVuln = 10;break;
    case 3: nVuln = 25;break;
    case 4: nVuln = 50;break;
    case 5: nVuln = 75;break;
    case 6: nVuln = 90;break;
    case 7: nVuln = 100;break;
  }
  //AdvDebug(oPC, "nVuln: "+IntToString(nVuln));

  return nVuln;
}

//------------------------------------------------------------------------------

int GetImmunityAgainst(object oPC, int nElementType)
{
  int nImmu;
  int nSlot = GetFirstInventorySlot();
  object oWpn = GetItemInSlot(nSlot, oPC);
  itemproperty ipProp = GetFirstItemProperty(oWpn);

  while(GetIsInventorySlotValid(nSlot))
  {
     while(GetIsItemPropertyValid(ipProp))
     {
        if(GetItemPropertyType(ipProp) == ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE &&
           GetItemPropertySubType(ipProp) == nElementType)
        {
           if(GetItemPropertyCostTableValue(ipProp) > nImmu)
           nImmu = GetItemPropertyCostTableValue(ipProp);
        }

        ipProp = GetNextItemProperty(oWpn);
     }

    nSlot  = GetNextInventorySlot();
    oWpn   = GetItemInSlot(nSlot, oPC);
    ipProp = GetFirstItemProperty(oWpn);
  }

  //AdvDebug(oPC, "nImmu: "+IntToString(nImmu));
  switch(nImmu)
  {
    case 1: nImmu = -5;break;
    case 2: nImmu = -10;break;
    case 3: nImmu = -25;break;
    case 4: nImmu = -50;break;
    case 5: nImmu = -75;break;
    case 6: nImmu = -90;break;
    case 7: nImmu = -100;break;
  }
  //AdvDebug(oPC, "nImmu: "+IntToString(nImmu));

  return nImmu;
}

void 
//------------------------------------------------------------------------------

int CalculateTotalDamage(object oTarget, int nDamageDone, int nDamageType)
{
   //6:  Acid / IP_CONST_DAMAGETYPE_*
   //10: Fire
   float fMulti       = 1.00;
   float fTotalDamage;
   int   nTotalDamage;
   int   nMulti;
   int   nVuln        = GetVulnerabiltyAgainst(oTarget, nDamageType);
   int   nImmu        = GetImmunityAgainst(oTarget, nDamageType);
   int   nRes         = GetResistanceAgainst(oTarget, nDamageType);

   if(nVuln >= nImmu)
   {
     nMulti = nVuln+nImmu;
     fMulti += (nMulti*0.01);
     //AdvDebug(oTarget, "nMulti: "+IntToString(nVuln)+"+("+IntToString(nImmu)+")="+IntToString(nMulti));
     //AdvDebug(oTarget, "fMulti +=  ("+IntToString(nMulti)+"*0.01) = 1.00 + ("+IntToString(nMulti)+"*0.01) = "+FloatToString(fMulti));
   }
   else if(nImmu >= nVuln)
   {
     nMulti = nImmu+nVuln;
     fMulti += (nMulti*0.01);
     //AdvDebug(oTarget, "nMulti: "+IntToString(nImmu)+"+("+IntToString(nVuln)+")="+IntToString(nMulti));
     //AdvDebug(oTarget, "fMulti +=  ("+IntToString(nMulti)+"*0.01) = 1.00 + ("+IntToString(nMulti)+"*0.01) = "+FloatToString(fMulti));
   }

   //AdvDebug(oTarget, "Calculation: "+IntToString(nDamageDone)+"*"+FloatToString(fMulti)+"-"+IntToString(nRes)+"="+IntToString(RoundValue((nDamageDone * fMulti) - nRes)));
   fTotalDamage = nDamageDone * fMulti - nRes;

   if(fTotalDamage > IntToFloat(FloatToInt(fTotalDamage))) fTotalDamage+=1.0;
   nTotalDamage = FloatToInt(fTotalDamage);

   if(nTotalDamage < 0) nTotalDamage=0;

  return nTotalDamage;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetIsInArena(object oPC)
{
    return GetLocalInt(oPC, "d0_arena_status");
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetHighestLevelFromClasses(object oCreature, int iClass1, int iClass2, int iClass3=CLASS_TYPE_INVALID)
{
    int iLevel1 = GetLevelByClass(iClass1, oCreature);
    int iLevel2 = GetLevelByClass(iClass2, oCreature);
    int iLevel3 = GetLevelByClass(iClass3, oCreature);

    if(iLevel1 > iLevel2 & iLevel3)
        return iLevel1;
    else if(iLevel2 > iLevel1 & iLevel3)
        return iLevel2;
    else if(iLevel3 > iLevel1 & iLevel2)
        return iLevel3;


    return CLASS_TYPE_INVALID;
}

//------------------------------------------------------------------------------

string GetItemPropertyTypeName(itemproperty ipItemProperty)
{
    int iType = GetItemPropertyType(ipItemProperty); // Row number in itempropdef.2da
    int iSubType = GetItemPropertySubType(ipItemProperty); // Row number in defined table in itempropdef.2da(column: SubTypeResRef)
    int iCT = GetItemPropertyCostTable(ipItemProperty); // Row number in iprp_costtable.2da
    //int iP1 = GetCached2DAInt("itempropdef", "Param1ResRef", iType);// GetItemPropertyParam1(ipItemProperty);Row number in iprp_paramtable.2da -> doesn't work!

    int iCTValue = GetItemPropertyCostTableValue(ipItemProperty); // Row number in the defined costtable from iprp_costtable.2da
    int iP1Value = GetItemPropertyParam1Value(ipItemProperty); // Row number in the defined param1 table from iprp_paramtable.2da (coumn: TableResRef)

    string sName = GetStringByStrRef(GetCached2DAInt("itempropdef", "GameStrRef", iType)); // itemproperty name

    string sCostTable = iCT != 0 ? GetCached2DAString("iprp_costtable", "Name", iCT) : ""; // costtable name
    string sCost = sCostTable != "" ? " " + GetStringByStrRef(GetCached2DAInt(sCostTable, "Name", iCTValue)) : ""; // e.g value "+2"

    string sSubTypeTable = GetCached2DAString("itempropdef", "SubTypeResRef", iType); // subtype table reference
    string sSubType = sSubTypeTable != "****" && sSubTypeTable != "" ? " " + GetStringByStrRef(GetCached2DAInt(sSubTypeTable, "Name", iSubType)) : ""; // e.g Ability name

    string sParam1Ref = GetCached2DAString("itempropdef", "Param1ResRef", iType); //Row number in iprp_paramtable.2da
    string sParam1Table = sParam1Ref != "****" && sParam1Ref != "" ? GetCached2DAString("iprp_paramtable", "TableResRef", StringToInt(sParam1Ref)) : ""; // param1 table reference
    string sParam1Value = sParam1Ref != "****" && sParam1Ref != "" ? " " + GetStringByStrRef(GetCached2DAInt(sParam1Table, "Name", iP1Value)) : ""; // param1 value name

    return sName + sSubType + sCost + sParam1Value;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

string GetFirstSkillName()
{
    SetLocalInt(GetModule(), "SKILLS_STRING_POS", 1);

    return "Gefühl für Tiere";
}

//------------------------------------------------------------------------------

string GetNextSkillName()
{
    int nCounterPos = GetLocalInt(GetModule(), "SKILLS_STRING_POS")+1;
    string sRetString;
    switch(nCounterPos)
    {
        case 1: sRetString="Gefühl für Tiere";break;
        case 2: sRetString="Konzentration";break;
        case 3: sRetString="Falle entschärfen";break;
        case 4: sRetString="Disziplin";break;
        case 5: sRetString="Heilen";break;
        case 6: sRetString="Verstecken";break;
        case 7: sRetString="Lauschen";break;
        case 8: sRetString="Sagenkunde";break;
        case 9: sRetString="Leise bewegen";break;
        case 10: sRetString="Schlösser öffnen";break;
        case 11: sRetString="Parieren";break;
        case 12: sRetString="Auftreten";break;
        case 13: sRetString="Überreden";break;
        case 14: sRetString="Taschendiebstahl";break;
        case 15: sRetString="Suchen";break;
        case 16: sRetString="Fallen stellen";break;
        case 17: sRetString="Zauberkunde";break;
        case 18: sRetString="Entdecken";break;
        case 19: sRetString="Provozieren";break;
        case 20: sRetString="Magischen Gegenstand benutzen";break;
        case 21: sRetString="Schätzen";break;
        case 22: sRetString="Turnen";break;
        case 23: sRetString="Falle anfertigen";break;
        case 24: sRetString="Bluffen";break;
        case 25: sRetString="Einschüchtern";break;
        case 26: sRetString="Handwerk (Rüstungsschmied)";break;
        case 27: sRetString="Waffe anfertigen";break;
        case 28: sRetString="Reiten";break;
        case 29: sRetString="Schnelle Metamagie";break;
    }
    SetLocalInt(GetModule(), "SKILLS_STRING_POS", nCounterPos);

    return sRetString;
}

//------------------------------------------------------------------------------

string GetNthSkillName(int nNth=1)
{
    string sRetString;
    switch(nNth)
    {
        case 1: sRetString="Gefühl für Tiere";break;
        case 2: sRetString="Konzentration";break;
        case 3: sRetString="Falle entschärfen";break;
        case 4: sRetString="Disziplin";break;
        case 5: sRetString="Heilen";break;
        case 6: sRetString="Verstecken";break;
        case 7: sRetString="Lauschen";break;
        case 8: sRetString="Sagenkunde";break;
        case 9: sRetString="Leise bewegen";break;
        case 10: sRetString="Schlösser öffnen";break;
        case 11: sRetString="Parieren";break;
        case 12: sRetString="Auftreten";break;
        case 13: sRetString="Überreden";break;
        case 14: sRetString="Taschendiebstahl";break;
        case 15: sRetString="Suchen";break;
        case 16: sRetString="Fallen stellen";break;
        case 17: sRetString="Zauberkunde";break;
        case 18: sRetString="Entdecken";break;
        case 19: sRetString="Provozieren";break;
        case 20: sRetString="Magischen Gegenstand benutzen";break;
        case 21: sRetString="Schätzen";break;
        case 22: sRetString="Turnen";break;
        case 23: sRetString="Falle anfertigen";break;
        case 24: sRetString="Bluffen";break;
        case 25: sRetString="Einschüchtern";break;
        case 26: sRetString="Handwerk (Rüstungsschmied)";break;
        case 27: sRetString="Waffe anfertigen";break;
        case 28: sRetString="Reiten";break;
        case 29: sRetString="Schnelle Metamagie";break;
    }
    SetLocalInt(GetModule(), "SKILLS_STRING_POS", nNth);

    return sRetString;
}

//------------------------------------------------------------------------------

int GetFirstSkill()
{
    SetLocalInt(GetModule(), "SKILLS_COUNTER_POS", 1);

    return SKILL_ANIMAL_EMPATHY;
}

//------------------------------------------------------------------------------

int GetNextSkill()
{
  int iPos = GetLocalInt(GetModule(), "SKILLS_COUNTER_POS")+1;
  int iReturn;
  switch(iPos)
  {
     case 1: iReturn=SKILL_ANIMAL_EMPATHY;break;
     case 2: iReturn=SKILL_CONCENTRATION;break;
     case 3: iReturn=SKILL_DISABLE_TRAP;break;
     case 4: iReturn=SKILL_DISCIPLINE;break;
     case 5: iReturn=SKILL_HEAL;break;
     case 6: iReturn=SKILL_HIDE;break;
     case 7: iReturn=SKILL_LISTEN;break;
     case 8: iReturn=SKILL_LORE;break;
     case 9: iReturn=SKILL_MOVE_SILENTLY;break;
     case 10: iReturn=SKILL_OPEN_LOCK;break;
     case 11: iReturn=SKILL_PARRY;break;
     case 12: iReturn=SKILL_PERFORM;break;
     case 13: iReturn=SKILL_PERSUADE;break;
     case 14: iReturn=SKILL_PICK_POCKET;break;
     case 15: iReturn=SKILL_SEARCH;break;
     case 16: iReturn=SKILL_SET_TRAP;break;
     case 17: iReturn=SKILL_SPELLCRAFT;break;
     case 18: iReturn=SKILL_SPOT;break;
     case 19: iReturn=SKILL_TAUNT;break;
     case 20: iReturn=SKILL_USE_MAGIC_DEVICE;break;
     case 21: iReturn=SKILL_APPRAISE;break;
     case 22: iReturn=SKILL_TUMBLE;break;
     case 23: iReturn=SKILL_CRAFT_TRAP;break;
     case 24: iReturn=SKILL_BLUFF;break;
     case 25: iReturn=SKILL_INTIMIDATE;break;
     case 26: iReturn=SKILL_CRAFT_ARMOR;break;
     case 27: iReturn=SKILL_CRAFT_WEAPON;break;
     case 28: iReturn=SKILL_RIDE;break;
     case 29: iReturn=28;break;//SKILL_QUICK_METAMAGIC;break;
  }
  SetLocalInt(GetModule(), "SKILLS_COUNTER_POS", iPos);

 return iReturn;
}

//------------------------------------------------------------------------------

int GetNthSkill(int nNth=1)
{
  int iReturn;
  switch(nNth)
  {
     case 1: iReturn=SKILL_ANIMAL_EMPATHY;break;
     case 2: iReturn=SKILL_CONCENTRATION;break;
     case 3: iReturn=SKILL_DISABLE_TRAP;break;
     case 4: iReturn=SKILL_DISCIPLINE;break;
     case 5: iReturn=SKILL_HEAL;break;
     case 6: iReturn=SKILL_HIDE;break;
     case 7: iReturn=SKILL_LISTEN;break;
     case 8: iReturn=SKILL_LORE;break;
     case 9: iReturn=SKILL_MOVE_SILENTLY;break;
     case 10: iReturn=SKILL_OPEN_LOCK;break;
     case 11: iReturn=SKILL_PARRY;break;
     case 12: iReturn=SKILL_PERFORM;break;
     case 13: iReturn=SKILL_PERSUADE;break;
     case 14: iReturn=SKILL_PICK_POCKET;break;
     case 15: iReturn=SKILL_SEARCH;break;
     case 16: iReturn=SKILL_SET_TRAP;break;
     case 17: iReturn=SKILL_SPELLCRAFT;break;
     case 18: iReturn=SKILL_SPOT;break;
     case 19: iReturn=SKILL_TAUNT;break;
     case 20: iReturn=SKILL_USE_MAGIC_DEVICE;break;
     case 21: iReturn=SKILL_APPRAISE;break;
     case 22: iReturn=SKILL_TUMBLE;break;
     case 23: iReturn=SKILL_CRAFT_TRAP;break;
     case 24: iReturn=SKILL_BLUFF;break;
     case 25: iReturn=SKILL_INTIMIDATE;break;
     case 26: iReturn=SKILL_CRAFT_ARMOR;break;
     case 27: iReturn=SKILL_CRAFT_WEAPON;break;
     case 28: iReturn=SKILL_RIDE;break;
     case 29: iReturn=28;break;//SKILL_QUICK_METAMAGIC;break;
  }
  SetLocalInt(GetModule(), "SKILLS_COUNTER_POS", nNth);

 return iReturn;
}

//------------------------------------------------------------------------------
// ** Round Value
//------------------------------------------------------------------------------

int RoundValue(float fValue)
{
    int iFirstNumber, iSecondNumber, iThirdNumber, i=1;
    int iValue          = FloatToInt(fValue);
    int iLength         = GetStringLength(FloatToString(fValue));
    string sFirstNumber = GetSubString(FloatToString(fValue), i, 1);
    string sSecondNumber, sThirdNumber;

    while(i <= iLength)
    {
        if(sFirstNumber == ".")
        {
            sFirstNumber  = GetSubString(FloatToString(fValue), i+1, 1);
            sSecondNumber = GetSubString(FloatToString(fValue), i+2, 1);
            sThirdNumber  = GetSubString(FloatToString(fValue), i+3, 1);
            break;
        }

        i++;
        sFirstNumber = GetSubString(FloatToString(fValue), i, 1);
    }

    iFirstNumber  = StringToInt(sFirstNumber);
    iSecondNumber = StringToInt(sSecondNumber);
    iThirdNumber  = StringToInt(sThirdNumber);

    if(iThirdNumber >= 5)
    iSecondNumber++;

    if(iSecondNumber >= 5)
    iFirstNumber++;

    if(iFirstNumber >= 5)
    iValue++;

    return iValue;
}


//------------------------------------------------------------------------------
// ** Clean-Up all marked Stores
//------------------------------------------------------------------------------

int GetItemValueLowerMaxValue(object oItem)
{
    int iItemValue = GetGoldPieceValue(oItem) / powInt(GetItemStackSize(oItem), 2);
    int iValue;

    switch(GetBaseItemType(oItem))
    {
        case BASE_ITEM_POTIONS:          return FALSE; break;
        case BASE_ITEM_SCROLL:
        case BASE_ITEM_SPELLSCROLL:
        case BASE_ITEM_ENCHANTED_SCROLL: iValue=D0_STORE_MAX_SCROLL_VALUE; break;
        default:                         iValue=D0_STORE_MAX_DEFAULT_VALUE;break;
    }

    if(iItemValue <= iValue)
    return TRUE;

    return FALSE;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetMaxItemValueInStore(object oItem, object oStore)
{
    int iItemValue;
    object oStoreItem = GetFirstItemInInventory(oStore);
    while(GetIsObjectValid(oStoreItem))
    {
        if(GetTag(oItem) == GetTag(oStoreItem))
        iItemValue++;

        oItem = GetNextItemInInventory(oStore);
    }

    return iItemValue;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Returns TRUE, if oStore needs a cleanup
int GetStoreNeedsCleanUp(object oStore)
{
    object oItem = GetFirstItemInInventory(oStore);
    while(GetIsObjectValid(oItem))
    {
        if(!GetLocalInt(oItem, "D0_ORIGINAL_ITEM"))
        {
            if(GetItemValueLowerMaxValue(oItem))
            return TRUE;
        }
        oItem = GetNextItemInInventory(oStore);
    }

    return FALSE;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Count All Non-Original Objects in Store that are going to be destroyed
int CountNonOriginalStoreObjects(object oStore)
{
    int iObjectCounter;
    object oItem = GetFirstItemInInventory(oStore);
    while(GetIsObjectValid(oItem))
    {
        if(!GetLocalInt(oItem, "D0_ORIGINAL_ITEM"))
        {
            if(GetItemValueLowerMaxValue(oItem))
            iObjectCounter++;
        }
        oItem = GetNextItemInInventory(oStore);
    }

    return iObjectCounter;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Clean-Up a single Store
void CleanUpSingleStore(object oStore, int iMarkStore=FALSE)
{
   object oItem = GetFirstItemInInventory(oStore);
   while(GetIsObjectValid(oItem))
   {
      // Destroy Item, if Value is lower than defined Cleanup-value and
      // its not an object that is marked as "original"
      if(!GetLocalInt(oItem, "D0_ORIGINAL_ITEM"))
      {
         if(GetItemValueLowerMaxValue(oItem))
         DestroyObject(oItem);
      }
      oItem = GetNextItemInInventory(oStore);
   }

   SetLocalInt(oStore, "D0_STORE_CLEANED_UP", TRUE);
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Clean-Up all Stores
void CleanUpStores(int iContinuous=TRUE)
{
    int i = 0;
    int i2 = 1;
    int iDelay = 1;
    int iCurrentStoreCounter  = GetLocalInt(GetModule(), "CLEAN_COUNTED_STORES");
    int iCurrentObjectCounter = GetLocalInt(GetModule(), "CLEAN_COUNTED_OBJECTS");
    int iStoreCounter;
    int iNewStoreCounter;
    int iObjectCounter;
    int iAlreadyCleanedUp;
    object oStoreCheck = GetObjectByTag(D0_STORE_CHECK_TAG);
    object oStore      = GetNearestObject(OBJECT_TYPE_STORE, oStoreCheck);
    object oItem;
    string sMessage;

    DCS_Debug(SystemMsg+"Starte Händler-reinigungsscript...");

    while(GetIsObjectValid(oStoreCheck))
    {
      AdvDebugDMs("Area: "+IntToString(i+1));

         while(GetIsObjectValid(oStore))
         {
            if(GetStoreNeedsCleanUp(oStore))
            {
               AdvDebugDMs("Store: "+IntToString(iDelay));

               iAlreadyCleanedUp = GetLocalInt(oStore, "D0_STORE_CLEANED_UP");
               iObjectCounter   += CountNonOriginalStoreObjects(oStore);
               DelayCommand(iDelay*1.5, CleanUpSingleStore(oStore, TRUE));

               iDelay++;
               iStoreCounter++;

               // Add Store to new cleaned Stores.
               if(!iAlreadyCleanedUp)
               iNewStoreCounter++;
            }
            i2++;
            oStore = GetNearestObject(OBJECT_TYPE_STORE, oStoreCheck, i2);
         }

      i++;
      i2     = 1;
      iDelay = 1;
      oStoreCheck = GetObjectByTag(D0_STORE_CHECK_TAG, i);
      oStore      = GetNearestObject(OBJECT_TYPE_STORE, oStoreCheck, i2);
    }

    // Empty everyone's garbage can
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        if(GetIsPC(oPC))
        {
            object oGarbCan = GetItemPossessedBy(oPC, "d0_garbage_can");
            object oItemChest = GetObjectByTag("d0_garbcan_save");
            object oItem = GetFirstItemInInventory(oGarbCan);

            while(GetIsObjectValid(oItem))
            {
                SetPlotFlag(oItem, FALSE);

                SafeCopyItem(oItem, oItemChest);
                DestroyObject(oItem, 0.25);

                oItem = GetNextItemInInventory(oGarbCan);
            }
         }
         oPC = GetNextPC();
    }

    if(iStoreCounter == 0 && iObjectCounter == 0)
    {
        DCS_Debug(SystemMsg+"Händler reinigungsscript fehlgeschlagen:");
        DCS_Debug("-> Keine Reinigung benötigt");
    }
    else
    {
        DCS_Debug(SystemMsg+"Händler reinigungsscript erfolgreich:");
        DCS_Debug("-> Händler bereinigt: "+ColorText(IntToString(iStoreCounter), nwcRed));
        DCS_Debug("-> Items entfernt: "+ColorText(IntToString(iObjectCounter), nwcRed));
        DCS_Debug(ColorText("Die Händler wurden bereinigt!", nwcLightBlue), TRUE, TRUE);
    }

    if(iContinuous)
    {
        string sRestart = IntToString(FloatToInt((D0_CLEANUP_RESTART/60)/60));
        DCS_Debug("-> Script wird in "+ColorText(sRestart, nwcRed)+" Stunden erneut gestartet");

        DelayCommand(D0_CLEANUP_RESTART - D0_CLEANUP_RESTART * 0.05555, DCS_Debug(ColorText("Die Händler werden in ca. "+IntToString(FloatToInt(D0_CLEANUP_RESTART * 0.056 / 60))+" Minuten bereinigt!", nwcLightBlue), TRUE, TRUE));
        DelayCommand(D0_CLEANUP_RESTART, CleanUpStores());
    }

    if(iStoreCounter != 0 && iObjectCounter != 0)
    {
        SetLocalInt(GetModule(), "CLEAN_COUNTED_OBJECTS", iObjectCounter+iCurrentObjectCounter);
        SetLocalInt(GetModule(), "CLEAN_COUNTED_STORES", iStoreCounter+iNewStoreCounter);
    }

}


//------------------------------------------------------------------------------
// ** Save Store Items
//------------------------------------------------------------------------------

int CountSingleStoreItems(object oStore)
{
    int iObjectCounter;
    object oItem = GetFirstItemInInventory(oStore);
    while(GetIsObjectValid(oItem))
    {
       iObjectCounter++;
       oItem = GetNextItemInInventory(oStore);
    }

  return iObjectCounter;
}

// Mark every original Object assigned to the store in the toolset
// so that it wont be deleted in a cleanup session.
void SaveSingleStoreItems(object oStore)
{
    object oItem = GetFirstItemInInventory(oStore);
    while(GetIsObjectValid(oItem))
    {
       SetLocalInt(oItem, "D0_ORIGINAL_ITEM", TRUE);
       oItem = GetNextItemInInventory(oStore);
    }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Save all original Objects from important Stores
void SaveStoreObjects()
{
  SendMessageToAllDMs(nwcDebug+"Starting to save Store items</c>");
  int n  = 0;
  int n2 = 1;
  int iObjectCounter;
  object oStoreCheck = GetObjectByTag(D0_STORE_CHECK_TAG);
  object oStore      = GetNearestObject(OBJECT_TYPE_STORE, oStoreCheck);

    while(GetIsObjectValid(oStoreCheck))
    {
      AdvDebugDMs("Area :"+IntToString(n+1));

         while(GetIsObjectValid(oStore))
         {
           AdvDebugDMs("Store :"+IntToString(n2));
           DelayCommand(IntToFloat(n2), SaveSingleStoreItems(oStore));

           n2++;
           iObjectCounter += CountSingleStoreItems(oStore);
           oStore = GetNearestObject(OBJECT_TYPE_STORE, oStoreCheck, n2);
         }

      n++;
      n2 = 1;
      oStoreCheck = GetObjectByTag(D0_STORE_CHECK_TAG,n);
      oStore      = GetNearestObject(OBJECT_TYPE_STORE, oStoreCheck, n2);
    }

   SendMessageToAllDMs(nwcDebug+IntToString(iObjectCounter)+" objects successfully saved</c>");
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

// Applies the Effect of the object "Mythallar Splitter" to oPlayer
void ApplyMythallarSplitter(object oPlayer)
{
    effect eBad = GetFirstEffect(oPlayer);
    effect eVis = EffectVisualEffect(VFX_IMP_DISPEL);
    while(GetIsEffectValid(eBad))
    {
        if (GetEffectType(eBad) != EFFECT_TYPE_ABILITY_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_AC_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_ATTACK_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_DAMAGE_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_SAVING_THROW_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_SPELL_RESISTANCE_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_SKILL_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_BLINDNESS &&
            GetEffectType(eBad) != EFFECT_TYPE_DEAF &&
            GetEffectType(eBad) != EFFECT_TYPE_CURSE &&
            GetEffectType(eBad) != EFFECT_TYPE_STUNNED &&
            GetEffectType(eBad) != EFFECT_TYPE_PETRIFY &&
            GetEffectType(eBad) != EFFECT_TYPE_DARKNESS &&
            GetEffectType(eBad) != EFFECT_TYPE_CONFUSED &&
            GetEffectType(eBad) != EFFECT_TYPE_SILENCE &&
            GetEffectType(eBad) != EFFECT_TYPE_POISON &&
            GetEffectType(eBad) != EFFECT_TYPE_DAZED &&
            GetEffectType(eBad) != EFFECT_TYPE_TIMESTOP &&
            GetEffectType(eBad) != EFFECT_TYPE_TURN_RESISTANCE_DECREASE &&
            GetEffectType(eBad) != EFFECT_TYPE_DISEASE &&
            GetEffectType(eBad) != EFFECT_TYPE_SLOW &&
            GetEffectType(eBad) != EFFECT_TYPE_SWARM &&
            GetEffectType(eBad) != EFFECT_TYPE_DOMINATED &&
            GetEffectType(eBad) != EFFECT_TYPE_MISS_CHANCE &&
            GetEffectType(eBad) != EFFECT_TYPE_FRIGHTENED &&
            GetEffectType(eBad) != EFFECT_TYPE_PARALYZE &&
            GetEffectType(eBad) != EFFECT_TYPE_ARCANE_SPELL_FAILURE &&
            GetEffectType(eBad) != EFFECT_TYPE_SPELL_FAILURE &&
            GetEffectType(eBad) != EFFECT_TYPE_NEGATIVELEVEL &&

            // Spezifikation Horn
          !(GetEffectSubType(eBad) == SUBTYPE_SUPERNATURAL &&
           (GetEffectType(eBad) == EFFECT_TYPE_VISUALEFFECT ||
            GetEffectType(eBad) == EFFECT_TYPE_SKILL_INCREASE)))
        {
            RemoveEffect(oPlayer, eBad);
        }
        eBad = GetNextEffect(oPlayer);
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPlayer);
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

void RemoveCertainEffect(object oCreature, int nEffectType, int nSubType=0)
{
    effect eEffect = GetFirstEffect(oCreature);

    // Do not ask for the SubType, if it's not given
    if(nSubType == 0)
    nSubType = GetEffectSubType(eEffect);

    while(GetIsEffectValid(eEffect))
    {
        if(GetEffectType(eEffect) == nEffectType &&
           GetEffectSubType(eEffect) == nSubType)
        {
           RemoveEffect(oCreature, eEffect);
           break;
        }

        eEffect = GetNextEffect(oCreature);

        if(nSubType == 0)
        nSubType = GetEffectSubType(eEffect);
    }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int diceX(int nDiceValue=1, int nNumDice=1)
{
    if(nDiceValue < 0)nDiceValue = 1;
    if(nNumDice   < 0)nNumDice   = 1;

    int i = 1;
    int nDamage;

    while(i <= nNumDice)
    {
        nDamage += Random(nDiceValue)+1;

        i++;
    }

   return nDamage;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

effect EffectMultibeam(object oEffector, int nBodypart, int bMissEffect=FALSE)
{
    effect eMultiBeam;
    eMultiBeam = EffectBeam(VFX_BEAM_COLD, oEffector, nBodypart, FALSE);
    eMultiBeam = EffectLinkEffects(EffectBeam(VFX_BEAM_EVIL, oEffector, nBodypart, bMissEffect), eMultiBeam);
    eMultiBeam = EffectLinkEffects(EffectBeam(VFX_BEAM_FIRE, oEffector, nBodypart, bMissEffect), eMultiBeam);
    eMultiBeam = EffectLinkEffects(EffectBeam(VFX_BEAM_HOLY, oEffector, nBodypart, bMissEffect), eMultiBeam);
    eMultiBeam = EffectLinkEffects(EffectBeam(VFX_BEAM_LIGHTNING, oEffector, nBodypart, bMissEffect), eMultiBeam);
    eMultiBeam = EffectLinkEffects(EffectBeam(VFX_BEAM_MIND, oEffector, nBodypart, bMissEffect), eMultiBeam);
    eMultiBeam = EffectLinkEffects(EffectBeam(VFX_BEAM_ODD, oEffector, nBodypart, bMissEffect), eMultiBeam);

    return eMultiBeam;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

void ChainMultibeam(object oCaster, float fRange, float fDuration, effect eChainEffect, object oLastTarget=OBJECT_INVALID, int iNearest=0)
{
   int i = 1;
   if(iNearest > 0)i=iNearest;
   if(!GetIsObjectValid(oLastTarget))oLastTarget=oCaster;

   effect eBeam   = EffectMultibeam(oLastTarget, BODY_NODE_CHEST);
   object oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oCaster, i);

   // Cast effect once without delay, then delay every effect after this
   if(GetDistanceBetween(oCaster, oTarget) <= fRange)
   {
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, fDuration);
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eChainEffect, oTarget, fDuration);
   }

   DelayCommand(0.3, ChainMultibeam(oCaster, fRange, fDuration, eChainEffect, oTarget, i+1));
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

float GetRandomFloat(float fMinimum = 0.2, float fMaximum = 1.0)
{
    float fMulti = fMaximum - fMinimum;
    if(fMulti < 0.0)
    {
        return 0.0;
    }
    else
    {
        int nRandom;
        nRandom = FloatToInt(fMulti * 10);
        nRandom = Random(nRandom) + 1;
        fMulti  = nRandom / 10.0;
        return fMulti + fMinimum;
    }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetRandomInt(int nMinimum = 2, int nMaximum = 10)
{
    int nMulti = nMaximum - nMinimum;
    if(nMulti < 0)
    {
        return 0;
    }
    else
    {
        int nRandom;
        nRandom = nMulti * 10;
        nRandom = Random(nRandom) + 1;
        nMulti  = FloatToInt(nRandom/10.0);
        return nMulti + nMinimum;
    }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

itemproperty GetNthItemProperty(object oItem, int Nth)
{
        itemproperty ipProp = GetFirstItemProperty(oItem);
        int i;
        for (i=1;i < Nth; i++)
        {
            ipProp   = GetNextItemProperty(oItem);
        }

   return ipProp;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetItemPossessedBy_ResRef(object oTarget, string sItemResRef)
{
    int nReturn;
    int nInventorySlot = GetFirstInventorySlot();
    object oItem = GetFirstItemInInventory(oTarget);

    while (GetIsObjectValid(oItem))
    {
        if (GetResRef(oItem) == sItemResRef)
        {
            nReturn = TRUE;
            break;
        }

        oItem = GetNextItemInInventory(oTarget);
    }

    oItem = GetItemInSlot(nInventorySlot, oTarget);
    while(GetIsInventorySlotValid(nInventorySlot))
    {
        if(GetResRef(oItem) == sItemResRef)
        {
            nReturn = TRUE;
            break;
        }

        nInventorySlot = GetNextInventorySlot();
        oItem = GetItemInSlot(nInventorySlot, oTarget);
    }

   return nReturn;
}

int GetIsGuard(object oNPC=OBJECT_SELF)
{
    if(FindSubString(GetName(oNPC), "Stadtwächter") != -1 ||
       FindSubString(GetName(oNPC), "Stadtwache")   != -1)
    return TRUE;

  return FALSE;
}

int GetIsGuardAIEnabled()
{
    return GetLocalInt(GetModule(), "GUARD_AI");
}

int GetIsWeapon(object oItem, int NoStaffs=TRUE)
{
   int nItem = GetBaseItemType(oItem);

   //Default Melee Weapons
   if((nItem == BASE_ITEM_BASTARDSWORD) ||
      (nItem == BASE_ITEM_BATTLEAXE) ||
      (nItem == BASE_ITEM_DOUBLEAXE) ||
      (nItem == BASE_ITEM_GREATAXE) ||
      (nItem == BASE_ITEM_GREATSWORD) ||
      (nItem == BASE_ITEM_HALBERD) ||
      (nItem == BASE_ITEM_HANDAXE) ||
      (nItem == BASE_ITEM_KAMA) ||
      (nItem == BASE_ITEM_KATANA) ||
      (nItem == BASE_ITEM_KUKRI) ||
      (nItem == BASE_ITEM_LONGSWORD) ||
      (nItem == BASE_ITEM_SCIMITAR) ||
      (nItem == BASE_ITEM_SCYTHE) ||
      (nItem == BASE_ITEM_SICKLE) ||
      (nItem == BASE_ITEM_TWOBLADEDSWORD) ||
      (nItem == BASE_ITEM_CLUB) ||
      (nItem == BASE_ITEM_DAGGER) ||
      (nItem == BASE_ITEM_DIREMACE) ||
      (nItem == BASE_ITEM_HEAVYFLAIL) ||
      (nItem == BASE_ITEM_LIGHTFLAIL) ||
      (nItem == BASE_ITEM_LIGHTHAMMER) ||
      (nItem == BASE_ITEM_LIGHTMACE) ||
      (nItem == BASE_ITEM_MORNINGSTAR) ||
      (nItem == BASE_ITEM_RAPIER) ||
      (nItem == BASE_ITEM_WHIP) ||
      (nItem == BASE_ITEM_SHORTSPEAR) ||
      (nItem == BASE_ITEM_SHORTSWORD) ||
      (nItem == BASE_ITEM_WARHAMMER)  ||
      (nItem == BASE_ITEM_DWARVENWARAXE) ||
      (nItem == BASE_ITEM_TRIDENT) ||

      // Default Ranged Weapons:
      (nItem == BASE_ITEM_HEAVYCROSSBOW) ||
      (nItem == BASE_ITEM_LIGHTCROSSBOW) ||
      (nItem == BASE_ITEM_LONGBOW) ||
      (nItem == BASE_ITEM_SHORTBOW) ||
      (nItem == BASE_ITEM_SHURIKEN) ||
      (nItem == BASE_ITEM_SLING) ||
      (nItem == BASE_ITEM_THROWINGAXE) ||

      // CEP Weapons:
      (nItem == BASE_ITEM_DAGGERASSASSIN) ||
      (nItem == BASE_ITEM_DOUBLESCIMITAR) ||
      (nItem == BASE_ITEM_FALCHION1) ||
      (nItem == BASE_ITEM_FALCHION2) ||
      (nItem == BASE_ITEM_GOAD) ||
      (nItem == BASE_ITEM_HEAVYMACE) ||
      (nItem == BASE_ITEM_HEAVYPICK) ||
      (nItem == BASE_ITEM_KATAR) ||
      (nItem == BASE_ITEM_KUKRI2) ||
      (nItem == BASE_ITEM_LIGHTMACE2) ||
      (nItem == BASE_ITEM_LIGHTPICK) ||
      (nItem == BASE_ITEM_MAUL) ||
      (nItem == BASE_ITEM_MERCURIALGREATSWORD) ||
      (nItem == BASE_ITEM_MERCURIALLONGSWORD) ||
      (nItem == BASE_ITEM_NUNCHAKU) ||
      (nItem == BASE_ITEM_SAI) ||
      (nItem == BASE_ITEM_SAP) ||
      (nItem == BASE_ITEM_TRIDENT_1H) ||
      (nItem == BASE_ITEM_WINDFIREWHEEL))
   {
       return TRUE;
   }

   if(!NoStaffs &&
     ((nItem == BASE_ITEM_MAGICSTAFF) ||
      (nItem == BASE_ITEM_QUARTERSTAFF) ||
      (nItem == BASE_ITEM_MAGICROD)))
   {
       return TRUE;
   }

   return FALSE;
}

//------------------------------------------------------------------------------

object GetNextGuardInRange(object oPC, float fRange)
{
    object oGuard = GetNearestObject(OBJECT_TYPE_CREATURE, oPC);
    int i         = 1;

    while(GetIsObjectValid(oGuard))
    {
        if((FindSubString(GetName(oGuard), "Stadtwächter") != -1  ||
            FindSubString(GetName(oGuard), "Stadtwache") != -1) &&
            GetDistanceBetween(oPC, oGuard) <= fRange)
        break;

        i++;
        oGuard = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, i);
    }

    return oGuard;
}

//------------------------------------------------------------------------------

void GuardAI_StorePlayerWeapon(object oWeapon)
{
    int iStoredWeapons = NBDE_GetCampaignInt("TerraEquilibrium", "TE_MAX_STORED_WEAPONS");
}

//------------------------------------------------------------------------------

void ExecuteGuardAIByPCEvent(int iPCEvent, object oPC)
{
  int nPercieved = GetLocalInt(oPC, "GUARD_AI_PC_PERCIEVED_BY_GUARD");
  object oWSlot1 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
  object oWSlot2 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

  AdvDebug(oPC, "GuardAI Enabled?: "+IntToString(GetIsGuardAIEnabled())+"\n PC Got Percieved: "+IntToString(nPercieved)+"\nIsSlot1Weapon?: "+IntToString(IPGetIsMeleeWeapon(oWSlot1))+"\nIsSlot2Weapon?: "+IntToString(IPGetIsMeleeWeapon(oWSlot2)));

  // OnEquip event from PC for GuardAI
  if(iPCEvent == EVENT_GUARD_AI_EQUIP)
  {
    if(GetIsGuardAIEnabled() &&
      !nPercieved &&
      (GetIsWeapon(oWSlot1) ||
       GetIsWeapon(oWSlot2)))
    {
        object oGuard  = GetNextGuardInRange(oPC, GUARD_AI_MAX_GUARD_RANGE);

        if(GetIsObjectValid(oGuard))
        {
            AssignCommand(oGuard, SetFacingPoint(GetPosition(oPC)));
            AssignCommand(oPC, SetFacingPoint(GetPosition(oGuard)));

            // Start the UserDefined perceive event
            SetLocalObject(oGuard, "EVENT_OBJECT_PERCEPT", oPC);
            SignalEvent(oGuard, EventUserDefined(EVENT_PERCEIVE));

            AdvDebug(oPC, "Guard In Range: Starting Event");
        }
        else
        {
            AdvDebug(oPC, "Error: No Guard in Range");
        }
    }
  }
  // OnUnequip event from PC for GuardAI
  else if(iPCEvent == EVENT_GUARD_AI_UNEQUIP)
  {
        // PC had weapons out and put them in after that
    if(GetIsGuardAIEnabled() &&
       nPercieved &&
      !GetIsWeapon(oWSlot1) &&
      !GetIsWeapon(oWSlot2))
    {
        object oGuard  = GetNextGuardInRange(oPC, GUARD_AI_MAX_GUARD_RANGE);

        if(GetIsObjectValid(oGuard))
        {
            AdvDebug(oPC, "Guard In Range");
            AssignCommand(oGuard, SpeakString("* Die Wache nickt als sie sieht, dass ihr eure Waffe weggesteckt habt und signalisiert euch weiter zu gehen *"));
        }
        else
        {
            AdvDebug(oPC, "Error: No Guard in Range");
        }

        // Stop Event on PC
        SetLocalInt(oPC, "GUARD_AI_PC_HAS_NO_WEAPON_OUT", TRUE);

        AdvDebug(oPC, "Has No WeaponOut: 1");
    }
  }
}

//------------------------------------------------------------------------------

int EventGetInventorySlot(object oItem)
{
    switch(GetBaseItemType(oItem))
    {
        case BASE_ITEM_ARROW:  return INVENTORY_SLOT_ARROWS;break;
        case BASE_ITEM_BOLT:   return INVENTORY_SLOT_BOLTS;break;
        case BASE_ITEM_BULLET: return INVENTORY_SLOT_BULLETS;break;
        case BASE_ITEM_SHURIKEN: return INVENTORY_SLOT_RIGHTHAND;break;
        case BASE_ITEM_THROWINGAXE: return INVENTORY_SLOT_RIGHTHAND;break;
    }

    return 0;
}

void EventWait(object oPC, object oItem, string sQuiverAmmo, int iUseDCSQuiver=FALSE)
{
    if(!GetIsObjectValid(oItem) && !GetIsObjectValid(GetItemPossessedBy(oPC, sQuiverAmmo)))
    {
        if(!iUseDCSQuiver)
            oItem = CreateItemOnObject(sQuiverAmmo, oPC, 1000);
        else
        {
            ExecuteScript("dcs_create_ammo", oPC);
            return;
        }
        AdvDebug(oPC, "No ammo found - Creating Ammo");
    }
    else if(!GetIsObjectValid(oItem))
    {
        oItem = GetItemPossessedBy(oPC, sQuiverAmmo);
        AdvDebug(oPC, "PC possessing other ammo: "+IntToString(GetIsObjectValid(oItem)));
    }

    int iSlot = EventGetInventorySlot(oItem);

    if(GetResRef(GetItemInSlot(iSlot, oPC)) != GetResRef(oItem))
    {
        AssignCommand(oPC, ActionEquipItem(oItem, iSlot));
        AdvDebug(oPC, "Quiver ammo unequipped - reequipping");
    }
}

void HandleEnhancedAmmunationByEvent(int iPCEvent, object oItem, string sItemResRef, object oPC)
{
    object Quiver        = GetLocalObject(oPC, D0_QUIVER_AMMO);
    int    QuiverConfig  = GetLocalInt(oPC, D0_QUIVER_CONFIG);
    string QuiverAmmo    = GetLocalString(oPC, D0_QUIVER_AMMO);

    AdvDebug(oPC, "Event: "+IntToString(iPCEvent)+", Automatic quivers enabled - Ammo: "+QuiverAmmo+", Resref: "+sItemResRef);

    // Manual quivers enabled and item is quiver ammo
    if(QuiverConfig || QuiverAmmo != GetResRef(oItem) || QuiverAmmo == "")
    return;

    if(iPCEvent == EVENT_QUIVER_UNEQUIP)
    {
        if(GetIsObjectValid(Quiver) && GetTag(oItem) == QuiverAmmo)
        {
            AdvDebug(oPC, "Special Quiver ammo unequipped - waiting for status");
            DelayCommand(1.0, EventWait(oPC, oItem, QuiverAmmo, TRUE));
        }

        // Unequipped item is current quiver ammo
        else if(QuiverAmmo == GetResRef(oItem))
        {
            AdvDebug(oPC, "Quiver ammo unequipped - waiting for status");
            DelayCommand(1.0, EventWait(oPC, oItem, QuiverAmmo));
        }
    }

    /*
    if(iPCEvent == EVENT_QUIVER_UNACQUIRE)
    {
        oItem = GetItemPossessedBy(oPC, QuiverAmmo);
        AdvDebug(oPC, "PC possessing other ammo: "+IntToString(GetIsObjectValid(oItem)));

        if(!GetIsObjectValid(oItem))
        {
            AdvDebug(oPC, "No ammo found - Creating Ammo");
            oItem = CreateItemOnObject(QuiverAmmo, oPC, 99);
        }

        DelayCommand(0.5, AssignCommand(oPC, ActionEquipItem(oItem, EventGetInventorySlot(oItem))));
    }
    else
    */
}

//------------------------------------------------------------------------------

object GetEnhancedAmmoByActivatedQuiver(string sQuiverAmmo, object oObject)
{
    object oAmmo;

    if(GetStringLeft(sQuiverAmmo, 7) == "d0_bolt")oAmmo = GetItemInSlot(INVENTORY_SLOT_BOLTS, oObject);
    if(GetStringLeft(sQuiverAmmo, 8) == "d0_arrow")oAmmo = GetItemInSlot(INVENTORY_SLOT_ARROWS, oObject);
    if(GetStringLeft(sQuiverAmmo, 9) == "d0_bullet")oAmmo = GetItemInSlot(INVENTORY_SLOT_BULLETS, oObject);

    return oAmmo;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

void AI_SetPerceptionTarget(object oSource, object oTarget)
{
    SetLocalObject(oSource, "EVENT_OBJECT_PERCEPT", oTarget);
}

void AI_DeletePerceptionTarget(object oSource)
{
    DeleteLocalObject(oSource, "EVENT_OBJECT_PERCEPT");
}

object AI_GetPerceptionTarget(object oSource)
{
   return GetLocalObject(oSource, "EVENT_OBJECT_PERCEPT");
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetNWNXModuleConnect_Functions(int iInfoCreate=FALSE)
{
    object oModule     = GetModule();
    object oConCheckWP = GetObjectByTag(d0_connection_check);
    object oDBConCheck = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oConCheckWP));
    string sNewTag     = "db_concheck";
    string NWNXInfo    = GetLocalString(oModule, "NWNX_MODULES_INFO");
    int    bReturn;
    SetUseableFlag(oDBConCheck, FALSE);
    //SetTag_(oDBConCheck, sNewTag);

    AdvDebug(GetPCSpeaker(), "ConCheckTag: "+GetTag(oDBConCheck));

    if(GetTag(oDBConCheck) == sNewTag)
    {
        if(iInfoCreate)
        SetLocalString(oModule, "NWNX_MODULES_INFO", NWNXInfo+"o  Plugin "+Chr(7)+"Functions"+Chr(7)+" loaded\n");

        bReturn = TRUE;
    }

    DestroyObject(oDBConCheck);

  return bReturn;
}

//------------------------------------------------------------------------------

int GetNWNXModuleConnect_ODBC(int iInfoCreate=FALSE)
{
    object oModule  = GetModule();
    string NWNXInfo = GetLocalString(oModule, "NWNX_MODULES_INFO");
    int bReturn;

    SQLExecDirect("select 1");
    if(SQLFetch())
    {
        bReturn = TRUE;

        if(iInfoCreate)
        SetLocalString(oModule, "NWNX_MODULES_INFO", NWNXInfo+"o  Plugin "+tQuote("ODBC")+" loaded\n");
    }

    return bReturn;
}

//------------------------------------------------------------------------------

int GetNWNXDatabaseConnection(int iInfoCreate=FALSE)
{
    string NWNXInfo = GetLocalString(GetModule(), "NWNX_MODULES_INFO");

    SQLExecDirect("select date('now')"); //SQLite

    if(SQLFetch())
    {
        if(iInfoCreate)
        SetLocalString(GetModule(), "NWNX_MODULES_INFO", NWNXInfo+" - Using SQLite connection\n\n");

        return NWNX_CONNECTION_SQLITE;
    }

    SQLExecDirect("select date(now())"); //MySQL

    if(SQLFetch())
    {
        if(iInfoCreate)
        SetLocalString(GetModule(), "NWNX_MODULES_INFO", NWNXInfo+" - Using MySQL connection\n\n");

        return NWNX_CONNECTION_MYSQL;
    }

    return NWNX_CONNECTION_NONE;
}

//------------------------------------------------------------------------------

int GetNWNXModuleConnect_Profiler(int iInfoCreate=FALSE)
{
    object oModule  = GetModule();
    string NWNXInfo = GetLocalString(oModule, "NWNX_MODULES_INFO");

    if(iInfoCreate)
    SetLocalString(oModule, "NWNX_MODULES_INFO", NWNXInfo+"o  Plugin "+tQuote("Profiler")+" loaded\n");

    return TRUE;
}

//------------------------------------------------------------------------------

int GetNWNXModuleConnect_Fixes(int iInfoCreate=FALSE)
{
    object oModule  = GetModule();
    string NWNXInfo = GetLocalString(oModule, "NWNX_MODULES_INFO");

    if(iInfoCreate)
    SetLocalString(oModule, "NWNX_MODULES_INFO", NWNXInfo+"o  Plugin "+tQuote("Fixes")+" loaded\n");

    return TRUE;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

int GetSetVar(object oObject=OBJECT_SELF)
{
    return GetLocalInt(oObject, "sTool_SetVar");
}

//------------------------------------------------------------------------------

int GetSubVar(object oObject=OBJECT_SELF)
{
    return GetLocalInt(oObject, "sTool_SubVar");
}

//------------------------------------------------------------------------------

void SetSetVar(int iVar, object oObject=OBJECT_SELF)
{
    SetLocalInt(oObject, "sTool_SetVar", iVar);
}

//------------------------------------------------------------------------------

void SetSubVar(int iVar, object oObject=OBJECT_SELF)
{
    SetLocalInt(oObject, "sTool_SubVar", iVar);
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

string ConvertNumberToString(int iNumber)
{
    string sNumber = IntToString(iNumber);
    string sRight, sLeft;
    int iMinCount     = 4;
    int iCurrentCount = 3;
    int iLength       = GetStringLength(sNumber);
    float fI          = 1.0;
    float fLength     = iLength / 3.0;

    while(fI < fLength)
    {
        //AdvDebug(oPC, "--------\nfI: "+FloatToString(fI)+"\nfLength: "+FloatToString(fLength)+"\nsRight: "+sRight+"\nsLeft: "+sLeft+"\nsNumber: "+sNumber+"\niCurrentCount: "+IntToString(iCurrentCount)+"\niLength: "+IntToString(iLength));

        sRight  = GetStringRight(sNumber, iCurrentCount);
        sLeft   = GetStringLeft(sNumber, GetStringLength(sNumber)-iCurrentCount);
        sNumber = sLeft+"."+sRight;

        iCurrentCount += iMinCount;
        iLength = GetStringLength(sNumber);
        fI += 1.0;

        //AdvDebug(oPC, "fI: "+FloatToString(fI)+"\nfLength: "+FloatToString(fLength)+"\nsRight: "+sRight+"\nsLeft: "+sLeft+"\nsNumber: "+sNumber+"\niCurrentCount: "+IntToString(iCurrentCount)+"\niLength: "+IntToString(iLength)+"\n--------");
    }

    return sNumber;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

itemproperty GetSLToolProp(object oSkin)
{
    itemproperty ipProp = GetFirstItemProperty(oSkin);

    while(GetIsItemPropertyValid(ipProp))
    {
        if(GetItemPropertyType(ipProp) == ITEM_PROPERTY_BONUS_FEAT && (GetItemPropertySubType(ipProp) == 1115 || GetItemPropertySubType(ipProp) == 1096))
        return ipProp;

        ipProp = GetNextItemProperty(oSkin);
    }

    return ipProp;
}

int GetHasSLTool(object oPlayer=OBJECT_SELF)
{
    object oSkin = SKIN_SupportGetSkin(oPlayer);
    return GetIsObjectValid(GetItemPossessedBy(oPlayer, "_sl_tool")) || GetIsItemPropertyValid(GetSLToolProp(oSkin));
}

object GetSLToolTarget(object oPlayer=OBJECT_SELF)
{
    return GetLocalObject(oPlayer, "stool_fix_object");
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

location GetSLToolLocation(object oPlayer=OBJECT_SELF)
{
    return GetLocalLocation(oPlayer, "stool_target_loc");
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

string ColorText(string Text, string Color)
{
    if(Color == "")
    return Text;

    return Color+Text+nwcEnd;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

void CreateModuleLoadTimestamp()
{
    int Connect = GetNWNXDatabaseConnection();

    if(Connect == NWNX_CONNECTION_MYSQL)
        SQLExecDirect("select date(localtime()), time(localtime())");
    else if(Connect == NWNX_CONNECTION_SQLITE)
        SQLExecDirect("select date('now'), time('now', 'localtime')");

    if(SQLFetch())
    {
        SetLocalString(GetModule(), "Timestamp_Date", SQLGetData(1));
        SetLocalString(GetModule(), "Timestamp_Time", SQLGetData(2));
    }
}

//------------------------------------------------------------------------------

// * Calculates time in seconds between Timestamp_From to Timestamp_To
// *  - Timestamps should in be in format: 'YYYY-MM-DD HH:MM:SS'
int GetTimeBygone(string Timestamp_From, string Timestamp_To="now")
{
    int Connect = GetNWNXDatabaseConnection();

    if(Connect == NWNX_CONNECTION_MYSQL)
    {
        if(Timestamp_To == "now")Timestamp_To="now()";
        SQLExecDirect("select TIMESTAMPDIFF(second, '"+Timestamp_From+"', "+Timestamp_To+")");
    }
    else if(Connect == NWNX_CONNECTION_SQLITE)
    {
        if(Timestamp_To == "now")Timestamp_To="'now'";
        SQLExecDirect("select strftime('%s',"+Timestamp_To+") - strftime('%s','"+Timestamp_From+"')");
    }

    if(SQLFetch())
    {
        return StringToInt(SQLGetData(1));
    }

    return 0;
}

//------------------------------------------------------------------------------

int GetTimepart(int iTimeInSecs, string Timepart="Hours")
{
    int   Days, Hours, Minutes, Seconds;
    float fDiff;

    fDiff   = ((iTimeInSecs/60.0) / 60.0) / 24.0;
    Days    = FloatToInt(fDiff);

    if(Timepart == "Days")return Days;

    fDiff   = (fDiff - FloatToInt(fDiff)) * 24.0;
    Hours   = FloatToInt(fDiff);

    if(Timepart == "Hours")return Hours;

    fDiff   = (fDiff - FloatToInt(fDiff)) * 60.0;
    Minutes = FloatToInt(fDiff);

    if(Timepart == "Minutes")return Minutes;

    fDiff   = (fDiff - FloatToInt(fDiff)) * 60.0;
    Seconds = FloatToInt(fDiff);

    if(Timepart == "Seconds")return Seconds;

    return 0;
}

//------------------------------------------------------------------------------

string ConvertTimestampTime(int iTimeInSecs)
{
    string Days, Hours, Minutes, Seconds;
    string day    = " Tage";
    string hour   = " Stunden";
    string minute = " Minuten";
    string second = " Sekunden";
    float fDiff;

    fDiff   = ((iTimeInSecs/60.0) / 60.0) / 24.0;
    Days    = IntToString(FloatToInt(fDiff));

    fDiff   = (fDiff - FloatToInt(fDiff)) * 24.0;
    Hours   = IntToString(FloatToInt(fDiff));

    fDiff   = (fDiff - FloatToInt(fDiff)) * 60.0;
    Minutes = IntToString(FloatToInt(fDiff));

    fDiff   = (fDiff - FloatToInt(fDiff)) * 60.0;
    Seconds = IntToString(FloatToInt(fDiff));

    if(StringToInt(Days)    == 1)day    = " Tag";
    if(StringToInt(Hours)   == 1)hour   = " Stunde";
    if(StringToInt(Minutes) == 1)minute = " Minute";
    if(StringToInt(Seconds) == 1)second = " Sekunde";

    return Days+day+", "+Hours+hour+", "+Minutes+minute+", "+Seconds+second;
}

//------------------------------------------------------------------------------

string ConvertTimestampDate(string TimestampDate)
{
    string Year  = SQLDecodeStringValue(TimestampDate, 1, "-");
    string Month = SQLDecodeStringValue(TimestampDate, 2, "-");
    string Day   = GetStringRight(TimestampDate, 2);

    return Day+"."+Month+"."+Year;
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

object GetNearestCreatureByDistance(int nFirstCriteriaType, int nFirstCriteriaValue, object oTarget=OBJECT_SELF, float fMaxDist=20.0, int nNth=1, int nSecondCriteriaType=-1, int nSecondCriteriaValue=-1, int nThirdCriteriaType=-1, int nThirdCriteriaValue=-1)
{
    object oTemp;
    object oReturn;
    int i;
    float fDistance;

    for(i=1; i<= nNth; i++)
    {
        oReturn   = GetNearestCreature(nFirstCriteriaType, nFirstCriteriaValue, oTarget, i, nSecondCriteriaType, nSecondCriteriaValue, nThirdCriteriaType, nThirdCriteriaValue);
        fDistance = GetDistanceBetween(oReturn, oTarget);

        if(fDistance <= fMaxDist)
        {
            if(i == nNth)
                break;
            else
                oTemp = oReturn;
        }
        else
        {
            oReturn = oTemp;
            break;
        }
    }
    return oReturn;
}

//------------------------------------------------------------------------------

void SetInternSwitch(string SwitchConstant, int bValue, object oTarget=OBJECT_SELF)
{
    SetLocalInt(oTarget, SwitchConstant, bValue);
}

void SetInternModuleSwitch(string SwitchConstant, int bValue)
{
    SetLocalInt(GetModule(), SwitchConstant, bValue);
}

//------------------------------------------------------------------------------

int GetInternSwitch(string SwitchConstant, object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, SwitchConstant);
}

int GetInternModuleSwitch(string SwitchConstant)
{
    return GetLocalInt(GetModule(), SwitchConstant);
}

//------------------------------------------------------------------------------

int powInt(int iValue, int iExponent)
{
    float fValue    = IntToFloat(iValue);
    float fExponent = IntToFloat(iExponent);

    return FloatToInt(pow(fValue, fExponent));
}

//----------------------------------------------------------------------------//
//*                             Objektsuche                                   */
//----------------------------------------------------------------------------//

object GetNearestCreatureByName(string sName, object oTarget=OBJECT_SELF, int nNth=1)
{
    object oNear    = GetNearestObject(OBJECT_TYPE_CREATURE, oTarget);
    string sTarName = GetStringLowerCase(GetName(oNear));
    int iCount      = 1, i = 1;

    sName = GetStringLowerCase(sName);

    while(GetIsObjectValid(oNear))
    {
        if(sTarName == sName || FindSubString(sTarName, sName) != -1)
        {
            if(iCount == nNth)break;

            iCount++;
        }

        i++;
        oNear    = GetNearestObject(OBJECT_TYPE_CREATURE, oTarget, i);
        sTarName = GetStringLowerCase(GetName(oNear));
    }

    return oNear;
}

//----------------------------------------------------------------------------//

object GetPCByName(string sName, int nNth=1)
{
    object oPC     = GetFirstPC();
    string sPCName = GetStringLowerCase(GetName(oPC));
    int iCount     = 1, i = 1;

    sName = GetStringLowerCase(sName);

    while(GetIsObjectValid(oPC))
    {
        if(sPCName == sName || FindSubString(sPCName, sName) != -1)
        {
            if(iCount == nNth)break;

            iCount++;
        }

        i++;
        oPC     = GetNextPC();
        sPCName = GetStringLowerCase(GetName(oPC));
    }

    return oPC;
}

//----------------------------------------------------------------------------//

object FindAssociate(object oPlayer)
{
    object oAssociate;
    int iAssocType;

    for(iAssocType=1; iAssocType <= 5; iAssocType++)
    {
        oAssociate = GetAssociate(iAssocType, oPlayer);

        if(GetIsObjectValid(oAssociate))
        break;
    }

    return oAssociate;
}

//----------------------------------------------------------------------------//
/*                              Textformatierung                              */
//----------------------------------------------------------------------------//

string InsertTextPhraseByPosition(string sText, string sInsert, int nPosition=0)
{
    int    iLen   = GetStringLength(sText);
    string sLeft  = GetStringLeft(sText, nPosition);
    string sRight = GetStringRight(sText, iLen-nPosition);

    return sLeft + sInsert + sRight;
}

//----------------------------------------------------------------------------//

int FindSubStringByCase(string sString, string sSubString, int nStart=0, int nIgnoreCaseSense=TRUE)
{
    if(nIgnoreCaseSense)
        return FindSubString(GetStringLowerCase(sString), GetStringLowerCase(sSubString), nStart);
    else
        return FindSubString(sString, sSubString, nStart);
}

//----------------------------------------------------------------------------//

string ReplaceTextPhraseByPosition(string sText, string sReplaceWith, int iLeft, int iRight)
{
    string sLeft, sRight;
    sLeft  = GetStringLeft(sText, iLeft);
    sRight = GetStringRight(sText, GetStringLength(sText)-iRight);

    return sLeft+sReplaceWith+sRight;
}

//----------------------------------------------------------------------------//

string ReplaceTextPhrase(string sText, string sPhrase, string sReplaceWith, int iReplaceAll=TRUE, int iIgnoreCaseSense=TRUE)
{
    int iPhraseLen = GetStringLength(sPhrase);
    int iPos       = FindSubStringByCase(sText, sPhrase, 0, iIgnoreCaseSense);

    while(iPos != -1)
    {
        sText = GetStringLeft(sText, iPos) + sReplaceWith + GetStringRight(sText, GetStringLength(sText)-(iPos+iPhraseLen));

        if(!iReplaceAll) break; // Stop after first replace, if just one should be replaced

        iPos = FindSubStringByCase(sText, sPhrase, iPos+iPhraseLen, iIgnoreCaseSense);
    }

    return sText;
}

//----------------------------------------------------------------------------//

string GetLowerStringLeft(string sString, int nCount)
{
    return GetStringLowerCase(GetStringLeft(sString, nCount));
}

//----------------------------------------------------------------------------//

string GetLowerStringRight(string sString, int nCount)
{
    return GetStringLowerCase(GetStringRight(sString, nCount));
}

//----------------------------------------------------------------------------//

int CompareStrings(string sCommand, string sCompareWith)
{
    if(sCommand == sCompareWith)
    return TRUE;

    int iLen = GetStringLength(sCommand);
    int iRet, i;
    string sSingleCmd, sSingleCompare;

    //Debug(GetFirstPC(), "cmd: "+sCommand+", compare: "+sCompareWith+", iLen: "+IntToString(iLen));

    if(sCommand != sCompareWith)
    {
        // Too short
        if(iLen < NEEDED_CHAR_LENGTH)
        return FALSE;

        for(i=0; i < iLen; i++)
        {
            sSingleCmd     = GetSubString(sCommand, i, 1);
            sSingleCompare = GetSubString(sCompareWith, i, 1);

            //Debug(GetFirstPC(), "i: "+IntToString(i)+", Cmd: "+sSingleCmd+", Compare: "+sSingleCompare);

            if(sSingleCmd != sSingleCompare)
            {
                iRet = TRUE;
                break;
            }
        }
    }

    return !iRet;
}

//----------------------------------------------------------------------------//

int DeathGetIsDeadMarked(object oPlayer, int iAccessDB=TRUE)
{
    string sAcc  = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));
    string sName = SQLEncodeSpecialChars(GetName(oPlayer));
    if(iAccessDB)
    {
        SQLExecDirect("select "+DCS_COL_ISDEAD+" from "+DCS_TABLE_TE_DATA+" where "+DCS_COL_DB_ACCNAME+"='"+sAcc+"' and "+DCS_COL_DB_CHARNAME+"='"+sName+"'");

        if(SQLFetch())
        {
            return StringToInt(SQLGetData(1));
        }
    }

    return NBDE_GetCampaignInt("TerraEquilibrium", "GET_PLAYER_IS_DEAD", oPlayer);
}

location DeathGetCorpseLocation(object oPlayer)
{
    return NBDE_GetCampaignLocation("TerraEquilibrium", "MP_lLeiche", oPlayer);
}

location DeathGetDeathAreaLocation(object oPlayer)
{
    return NBDE_GetCampaignLocation("TerraEquilibrium", "MP_lPC", oPlayer);
}

object DeathGetPlayerCorpse(object oPlayer)
{
    return GetLocalObject(oPlayer, "MP_oLeiche");
}

object DeathGetCorpsePlayer(object oCorpse)
{
    return GetLocalObject(oCorpse, "MP_oPC");
}

object DeathGetCreatePlayerCorpse(object oPlayer, location lCreate)
{
    object oLeiche = DeathGetPlayerCorpse(oPlayer);

    if(GetIsObjectValid(oLeiche))
    DestroyObject(oLeiche);

    oLeiche = CreateObject(OBJECT_TYPE_PLACEABLE, "mp_leiche", lCreate, FALSE, "leiche");
    SetName(oLeiche, GetName(oPlayer)+"'s Leiche");
    SetLocalObject(oLeiche,"MP_oPC",oPlayer);
    SetLocalObject(oPlayer,"MP_oLeiche",oLeiche);

    return oLeiche;
}

void DeathCreatePlayerCorpse(object oPlayer, location lCreate)
{
    object oLeiche = DeathGetPlayerCorpse(oPlayer);

    if(GetIsObjectValid(oLeiche))
    DestroyObject(oLeiche);

    oLeiche = CreateObject(OBJECT_TYPE_PLACEABLE, "mp_leiche", lCreate, FALSE, "leiche");
    SetName(oLeiche, GetName(oPlayer)+"'s Leiche");
    SetLocalObject(oLeiche,"MP_oPC",oPlayer);
    SetLocalObject(oPlayer,"MP_oLeiche",oLeiche);
}

void DeathSetIsDeadMarked(object oPlayer, int iMark, int iAccessDB=TRUE)
{
    string sAcc  = SQLEncodeSpecialChars(GetPCPlayerName(oPlayer));
    string sName = SQLEncodeSpecialChars(GetName(oPlayer));

    if(iAccessDB)
    {
        SQLExecDirect("update "+DCS_TABLE_TE_DATA+" set "+DCS_COL_ISDEAD+"='"+IntToString(iMark)+"' where "+DCS_COL_DB_ACCNAME+"='"+sAcc+"' and "+DCS_COL_DB_CHARNAME+"='"+sName+"'");
    }
    else
    {
        NBDE_SetCampaignInt("TerraEquilibrium", "GET_PLAYER_IS_DEAD", iMark, oPlayer);
    }
}

void DeathSetCorpseLocation(object oPlayer, location lCorpse)
{
    NBDE_SetCampaignLocation("TerraEquilibrium", "MP_lLeiche", lCorpse, oPlayer);
}

void DeathSetDeathAreaLocation(object oPlayer, location lDeath)
{
    NBDE_SetCampaignLocation("TerraEquilibrium", "MP_lPC", lDeath, oPlayer);
}

void DeathDeleteCorpseLocation(object oPlayer)
{
    NBDE_DeleteCampaignLocation("TerraEquilibrium", "MP_lLeiche", oPlayer);
}

void DeathDeleteDeathAreaLocation(object oPlayer)
{
    NBDE_DeleteCampaignLocation("TerraEquilibrium", "MP_lPC", oPlayer);
}

//----------------------------------------------------------------------------//

void SetAlternativeAssociate(object oPC, int iAssociate)
{
    if(!GetIsObjectValid(oPC) || !GetIsPC(oPC) || !GetIsDM(oPC) || iAssociate < 0)return;

    string sAcc  = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sName = SQLEncodeSpecialChars(GetName(oPC));

    SQLExecDirect("update "+DCS_TABLE_TE_DATA+" set "+DCS_COL_ASSOC+"="+IntToString(iAssociate)+" where "+DCS_COL_DB_ACCNAME+"='"+sAcc+"' and "+DCS_COL_DB_CHARNAME+"='"+sName+"'");
}

//----------------------------------------------------------------------------//

int GetAlternativeAssociate(object oPC)
{
    if(!GetIsObjectValid(oPC) || !GetIsPC(oPC) || !GetIsDM(oPC))return 0;

    string sAcc  = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sName = SQLEncodeSpecialChars(GetName(oPC));

    SQLExecDirect("select "+DCS_COL_ASSOC+" from "+DCS_TABLE_TE_DATA+" where "+DCS_COL_DB_ACCNAME+"='"+sAcc+"' and "+DCS_COL_DB_CHARNAME+"='"+sName+"'");

    if(SQLFetch())
    {
        return StringToInt(SQLGetData(1));
    }

    return 0;
}

//----------------------------------------------------------------------------//

int GetPolymorphFromAppearance(int iAppearance)
{
    switch(iAppearance)
    {
        default: iAppearance = 0;break;
    }

    return iAppearance;
}

//----------------------------------------------------------------------------//

int GetDigitValue(string sDigit)
{
    string sDiglow = GetStringLowerCase(sDigit);

    if(sDiglow == "a")return 10;
    if(sDiglow == "b")return 11;
    if(sDiglow == "c")return 12;
    if(sDiglow == "d")return 13;
    if(sDiglow == "e")return 14;
    if(sDiglow == "f")return 15;

    return StringToInt(sDigit);
}

//----------------------------------------------------------------------------//

int HexStringToInt(string sHex)
{
    string sTemp;
    int iValue, iDigit, iLen, iCount;

    if(GetStringLeft(sHex, 1) == "#")
    sTemp = GetStringRight(sHex, GetStringLength(sHex)-1);
    else if(GetStringLeft(sHex, 1) == "x")
    sTemp = GetStringRight(sHex, GetStringLength(sHex)-1);
    else if(GetStringLeft(sHex, 2) == "0x")
    sTemp = GetStringRight(sHex, GetStringLength(sHex)-2);
    else
    sTemp = sHex;
    iLen = GetStringLength(sTemp);
    for(iCount=1; iCount <= iLen; iCount++)
    {
        iDigit  = GetDigitValue(GetSubString(sTemp, iLen-iCount, 1)) * powInt(16, iCount-1);
        iValue += iDigit;
    }
    return iValue;
}

//----------------------------------------------------------------------------//

int GetItemLevelRestrict(object oItem)
{
    // =========================================================================
    // Item Levelanforderungen Abfrage
    // =========================================================================
    int iWert      = GetGoldPieceValue(oItem);
    float fBasis   = IntToFloat(iWert / 11);
    float fLvl     = pow(fBasis, 0.31);
    int iStats;
    itemproperty ipProp = GetFirstItemProperty(oItem);

    if(iWert > 150000) fLvl = pow(fBasis, 0.3);
    if(iWert > 300000) fLvl = pow(fBasis, 0.29);

    if(fLvl > 30.0) fLvl=30.0;

    return FloatToInt(fLvl);
}

void ModuleInit()
{
    // Erstellt Zeitstempel beim Serverstart
    CreateModuleLoadTimestamp();

    // Aktiviert die externe Waechter-KI
    //SetInternModuleSwitch("GUARD_AI", TRUE);

    // Speichert die aktuelle SL-Tool Version
    SetCustomToken(SLTOOL_VERSION_TOKEN, SLTOOL_VERSION_INFO);

    DelayCommand(30.0, SaveStoreObjects());
    DelayCommand(D0_CLEANUP_RESTART, CleanUpStores());
}


// Returns location directly ahead of the target and facing
// same direction as the target
location GetFrontLocation(object oTarget, float fDist);
location GetFrontLocation(object oTarget, float fDist)
{
    float fDir = GetFacing(oTarget);
    return GenerateNewLocation(oTarget,
                               fDist,
                               fDir,
                               fDir);
}

// Returns location to the forward right and facing the target.
// (useful for one of two people facing off against the target)
location GetFrontRightLocation(object oTarget, float fDist);
location GetFrontRightLocation(object oTarget, float fDist)
{
    float fDir = GetFacing(oTarget);
    float fAngle = GetHalfRightDirection(fDir);
    float fFaceAngle = GetOppositeDirection(fAngle);
    return GenerateNewLocation(oTarget,
                               fDist,
                               fAngle,
                               fFaceAngle);
}

// Returns location to the forward left and facing the target.
// (useful for one of two people facing off against the target)
location GetFrontLeftLocation(object oTarget, float fDist);
location GetFrontLeftLocation(object oTarget, float fDist)
{
    float fDir = GetFacing(oTarget);
    float fAngle = GetHalfLeftDirection(fDir);
    float fFaceAngle = GetOppositeDirection(fAngle);
    return GenerateNewLocation(oTarget,
                               fDist,
                               fAngle,
                               fFaceAngle);
}

void CheckPalemaster(object oPC)
{
    int iHXM = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);
    int iMage = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int iCleric = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);
    int iBard = GetLevelByClass(CLASS_TYPE_BARD, oPC);

    SetLocalInt(oPC, "X2_AllowPalema", TRUE); // Blocks palemaster levelup

    if((iHXM >= 20 || iMage >= 20) ||
       (iCleric >= 17 && iBard + iHXM + iMage >= 3) ||
       (iCleric >= 16 && iBard + iHXM + iMage >= 4))
    {
        DeleteLocalInt(oPC, "X2_AllowPalema");
    }
}
//void main(){}
