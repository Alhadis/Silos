// Name     : Avlis Persistence System include
// Purpose  : Various APS/NWNX2 related functions / Specifically tailored for ATS Player Vendors
// Authors  : Ingmar Stieger, Adam Colon, Josh Simon, Josh Dalton,Leigh Carpenter
// Modified : November  2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2


//NECESSARY ATS FUNCTIONS.
string APS_ATS_GetVendorOwnerID(object oVendor = OBJECT_SELF)
{
    return GetLocalString(oVendor, "ats_pvendor_owner_ID");
}

string APS_ATS_GetVendorNumber(object oVendor = OBJECT_SELF)
{
    return GetLocalString(oVendor, "ATS_Vendor_Number");
}

/************************************/
/* Return codes                     */
/************************************/

int SQL_ERROR = 0;
int SQL_SUCCESS = 1;
int USE_DATABASE = TRUE;

/************************************/
/* Function prototypes              */
/************************************/

// Check to be certain database is up and available
int SQLCheckDB();

// Execute statement in sSQL
void SQLExecDirect(string sSQL);

// Position cursor on next row of the resultset
// Call this before using SQLGetData().
// returns: SQL_SUCCESS if there is a row
//          SQL_ERROR if there are no more rows
int SQLFetch();

// * deprecated. Use SQLFetch instead.
// Position cursor on first row of the resultset and name it sResultSetName
// Call this before using SQLNextRow() and SQLGetData().
// returns: SQL_SUCCESS if result set is not empty
//          SQL_ERROR is result set is empty
int SQLFirstRow();

// * deprecated. Use SQLFetch instead.
// Position cursor on next row of the result set sResultSetName
// returns: SQL_SUCCESS if cursor could be advanced to next row
//          SQL_ERROR if there was no next row
int SQLNextRow();

// Return value of column iCol in the current row of result set sResultSetName
string SQLGetData(int iCol);

// Return a string value when given a location
string ats_LocationToString(location lLocation);

// Return a location value when given the string form of the location
location StringToLocation(string sLocation);

// Return a string value when given a vector
string ats_VectorToString(vector vVector);

// Return a vector value when given the string form of the vector
vector StringToVector(string sVector);

// Set oObject's persistent string variable sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: ats_vendor)
void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration=0, string sTable="ats_vendor");

// Set oObject's persistent integer variable sVarName to iValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: ats_vendor)
void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration=0, string sTable="ats_vendor");

// Set oObject's persistent float variable sVarName to fValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: ats_vendor)
void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration=0, string sTable="ats_vendor");

// Set oObject's persistent location variable sVarName to lLocation
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: ats_vendor)
//   This function converts location to a string for storage in the database.
void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration=0, string sTable="ats_vendor");

// Set oObject's persistent vector variable sVarName to vVector
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: ats_vendor)
//   This function converts vector to a string for storage in the database.
void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration=0, string sTable ="ats_vendor");

// Get oObject's persistent string variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: ats_vendor)
// * Return value on error: ""
string GetPersistentString(object oObject, string sVarName, string sTable="ats_vendor");

// Get oObject's persistent integer variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: ats_vendor)
// * Return value on error: 0
int GetPersistentInt(object oObject, string sVarName, string sTable="ats_vendor");

// Get oObject's persistent float variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: ats_vendor)
// * Return value on error: 0
float GetPersistentFloat(object oObject, string sVarName, string sTable="ats_vendor");

// Get oObject's persistent location variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: ats_vendor)
// * Return value on error: 0
location GetPersistentLocation(object oObject, string sVarname, string sTable="ats_vendor");

// Get oObject's persistent vector variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: ats_vendor)
// * Return value on error: 0
vector GetPersistentVector(object oObject, string sVarName, string sTable = "ats_vendor");

// Delete persistent variable sVarName stored on oObject
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: ats_vendor)
void DeletePersistentVariable(object oObject, string sVarName, string sTable="ats_vendor");

// (private function) Replace special character ' with ~
string SQLEncodeSpecialChars(string sString);

// (private function)Replace special character ' with ~
string SQLDecodeSpecialChars(string sString);

/************************************/
/* Implementation                   */
/************************************/

// Functions for initializing APS and working with result sets

int SQLCheckDB()
{
    if(!USE_DATABASE)
        return 0;
    string sSQL="select count(*) ats_vendor";
    SQLExecDirect(sSQL);
    if(SQLFirstRow()==SQL_SUCCESS)
        return 1;
    else
        return 0;
}

void SQLExecDirect(string sSQL)
{
    if(!USE_DATABASE)
        return;
    SetLocalString(GetModule(), "NWNX!ODBC!EXEC", sSQL);
}

int SQLFetch()
{
    if(!USE_DATABASE)
        return SQL_ERROR;
    string sRow;
    object oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", GetLocalString(oModule, "NWNX!ODBC!SPACER"));
    sRow = GetLocalString(oModule, "NWNX!ODBC!FETCH");
    if (GetStringLength(sRow) > 0)
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", sRow);
        return SQL_SUCCESS;
    }
    else
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", "");
        return SQL_ERROR;
    }
}

// deprecated. use SQLFetch().
int SQLFirstRow()
{
    return SQLFetch();
}

// deprecated. use SQLFetch().
int SQLNextRow()
{
    return SQLFetch();
}

string SQLGetData(int iCol)
{
    if(!USE_DATABASE)
        return "";
    int iPos;
    string sResultSet = GetLocalString(GetModule(), "NWNX_ODBC_CurrentRow");

    // find column in current row
    int iCount = 0;
    string sColValue = "";

    iPos = FindSubString(sResultSet, "¬");
    if ((iPos == -1) && (iCol == 1))
    {
        // only one column, return value immediately
        sColValue = sResultSet;
    }
    else if (iPos == -1)
    {
        // only one column but requested column > 1
        sColValue = "";
    }
    else
    {
        // loop through columns until found
        while (iCount != iCol)
        {
            iCount++;
            if (iCount == iCol)
                sColValue = GetStringLeft(sResultSet, iPos);
            else
            {
                sResultSet = GetStringRight(sResultSet,GetStringLength(sResultSet) - iPos - 1);
                iPos = FindSubString(sResultSet, "¬");
            }

            // special case: last column in row
            if (iPos == -1)
                iPos = GetStringLength(sResultSet);
        }
    }

    return sColValue;
}

// These functions deal with various data types. Ultimately, all information
// must be stored in the database as strings, and converted back to the proper
// form when retrieved.

string ats_VectorToString(vector vVector)
{
    return "#POSITION_X#" + FloatToString(vVector.x) + "#POSITION_Y#" + FloatToString(vVector.y) + "#POSITION_Z#" + FloatToString(vVector.z) + "#END#";
}

vector StringToVector(string sVector)
{
    float fX, fY, fZ;
    int iPos, iCount;
    int iLen = GetStringLength(sVector);

    if (iLen > 0)
    {
        iPos = FindSubString(sVector, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sVector, iPos, iCount));
    }

    return Vector(fX, fY, fZ);
}

string ats_LocationToString(location lLocation)
{
    object oArea = GetAreaFromLocation(lLocation);
    vector vPosition = GetPositionFromLocation(lLocation);
    float fOrientation = GetFacingFromLocation(lLocation);
    string sReturnValue;

    if (GetIsObjectValid(oArea))
        sReturnValue = "#AREA#" + GetTag(oArea) + "#POSITION_X#" + FloatToString(vPosition.x) + "#POSITION_Y#" + FloatToString(vPosition.y) + "#POSITION_Z#" + FloatToString(vPosition.z) + "#ORIENTATION#" + FloatToString(fOrientation) + "#END#";

    return sReturnValue;
}

location StringToLocation(string sLocation)
{
    location lReturnValue;
    object oArea;
    vector vPosition;
    float fOrientation, fX, fY, fZ;

    int iPos, iCount;
    int iLen = GetStringLength(sLocation);

    if (iLen > 0)
    {
        iPos = FindSubString(sLocation, "#AREA#") + 6;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        oArea = GetObjectByTag(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sLocation, iPos, iCount));

        vPosition = Vector(fX, fY, fZ);

        iPos = FindSubString(sLocation, "#ORIENTATION#") + 13;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fOrientation = StringToFloat(GetSubString(sLocation, iPos, iCount));

        lReturnValue = Location(oArea, vPosition, fOrientation);
    }

    return lReturnValue;
}

// These functions are responsible for transporting the various data types back
// and forth to the database.
//this function has been altered to use the ats player vendor ID to store data.
void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration=0, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
    {
        SetLocalString(oObject, sVarName, sValue);
        return;
    }
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = SQLEncodeSpecialChars(APS_ATS_GetVendorOwnerID(oObject));
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    sValue = SQLEncodeSpecialChars(sValue);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
                  "' AND tag='" + sTag + "' AND name='" + sVarName + APS_ATS_GetVendorNumber(oObject) + "'";
    SQLExecDirect(sSQL);

    if (SQLFirstRow() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val='" + sValue +
               "',expire=" + IntToString(iExpiration) + " WHERE player='"+ sPlayer +
               "' AND tag='" + sTag + "' AND name='" + sVarName + APS_ATS_GetVendorNumber(oObject) + "'";
        SQLExecDirect(sSQL);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
               "('" + sPlayer + "','" + sTag + "','" + sVarName + APS_ATS_GetVendorNumber(oObject) + "','" +
               sValue + "'," + IntToString(iExpiration) + ")";
        SQLExecDirect(sSQL);
    }
}

string GetPersistentString(object oObject, string sVarName, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        return GetLocalString(oObject, sVarName);
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = SQLEncodeSpecialChars(APS_ATS_GetVendorOwnerID(oObject));
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
               "' AND tag='" + sTag + "' AND name='" + sVarName + APS_ATS_GetVendorNumber(oObject) + "'";
    SQLExecDirect(sSQL);

    if (SQLFirstRow() == SQL_SUCCESS)
        return SQLDecodeSpecialChars(SQLGetData(1));
    else
    {
        return "";
        // If you want to convert your existing persistent data to APS, this
        // would be the place to do it. The requested variable was not found
        // in the database, you should
        // 1) query it's value using your existing persistence functions
        // 2) save the value to the database using SetPersistentString()
        // 3) return the string value here.
    }
}

void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration=0, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        SetLocalInt(oObject, sVarName, iValue);
    else
        SetPersistentString(oObject, sVarName, IntToString(iValue), iExpiration, sTable);
}

int GetPersistentInt(object oObject, string sVarName, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        return GetLocalInt(oObject, sVarName);
    else
        return StringToInt(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration=0, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        SetLocalFloat(oObject, sVarName, fValue);
    else
        SetPersistentString(oObject, sVarName, FloatToString(fValue), iExpiration, sTable);
}

float GetPersistentFloat(object oObject, string sVarName, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        return GetLocalFloat(oObject, sVarName);
    else
        return StringToFloat(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration=0, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        SetLocalLocation(oObject, sVarName, lLocation);
    else
        SetPersistentString(oObject, sVarName, ats_LocationToString(lLocation), iExpiration, sTable);
}

location GetPersistentLocation(object oObject, string sVarName, string sTable="ats_vendor")
{
    if(!USE_DATABASE)
        return GetLocalLocation(oObject, sVarName);
    else
        return StringToLocation(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration=0, string sTable ="ats_vendor")
{
    if(USE_DATABASE)
        SetPersistentString(oObject, sVarName, ats_VectorToString(vVector), iExpiration, sTable);
    else
        SetLocalString(oObject, sVarName, ats_VectorToString(vVector));
}

vector GetPersistentVector(object oObject, string sVarName, string sTable = "ats_vendor")
{
    if(USE_DATABASE)
        return StringToVector(GetPersistentString(oObject, sVarName, sTable));
    else
        return StringToVector(GetLocalString(oObject, sVarName));
}

void DeletePersistentVariable(object oObject, string sVarName, string sTable="ats_vendor")
{
    if(!USE_DATABASE)   //try all 5 types to be certain.  unfortunate side effect of killing shared name vars.
    {
        DeleteLocalFloat(oObject, sVarName + APS_ATS_GetVendorNumber(oObject));
        DeleteLocalInt(oObject, sVarName + APS_ATS_GetVendorNumber(oObject));
        DeleteLocalLocation(oObject, sVarName + APS_ATS_GetVendorNumber(oObject));
        DeleteLocalObject(oObject, sVarName + APS_ATS_GetVendorNumber(oObject));
        DeleteLocalString(oObject, sVarName + APS_ATS_GetVendorNumber(oObject));
    }
    else
    {
        string sPlayer;
        string sTag;

        if (GetIsPC(oObject))
        {
            sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
            sTag = SQLEncodeSpecialChars(GetName(oObject));
        }
        else
        {
            sPlayer = SQLEncodeSpecialChars(APS_ATS_GetVendorOwnerID(oObject));
            sTag = GetTag(oObject);
        }

        sVarName = SQLEncodeSpecialChars(sVarName);
        string sSQL = "DELETE FROM " + sTable + " WHERE player='" + sPlayer +
                      "' AND tag='" + sTag + "' AND name='" + sVarName + APS_ATS_GetVendorNumber(oObject) + "'";
        SQLExecDirect(sSQL);
    }
}

// Problems can arise with SQL commands if variables or values have single quotes
// in their names. These functions are a replace these quote with the tilde character

string SQLEncodeSpecialChars(string sString)
{
    if (FindSubString(sString, "'") == -1) // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "'")
            sReturn += "~";
        else
            sReturn += sChar;
    }
    return sReturn;
}

string SQLDecodeSpecialChars(string sString)
{
    if (FindSubString(sString, "~") == -1) // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "~")
            sReturn += "'";
        else
            sReturn += sChar;
    }
    return sReturn;
}
