#include "dcs_inc_database"

const int OVERWRITE_EXISTING_IF_VALUE_GREATER = TRUE;

void DCS_AddCDKeyToDatabase(string CDKey, string AccountCluster)
{
    string Table = DCS_TABLE_TE_DATA_KEYS;

    SQLExecDirect("select "+DCS_COL_ACCOUNTS+" from " + Table + " where "+DCS_COL_CDKEY+"='"+CDKey+"'");

    if (SQLFetch())
    {
        int iDataLen    = GetStringLength(SQLGetData(1));
        int iClusterLen = GetStringLength(AccountCluster);

        if(iDataLen < iClusterLen && OVERWRITE_EXISTING_IF_VALUE_GREATER)
        {
            SQLExecDirect("update " + Table +" set "+ DCS_COL_ACCOUNTS +"='"+AccountCluster+"'");
        }
    }
    else
    {
        SQLExecDirect("insert into " + Table + " ("+DCS_COL_CDKEY+","+DCS_COL_ACCOUNTS+") values ('"+CDKey+"','"+AccountCluster+"')");
    }
}

void ConvertCDKeys(object oPC, int iCount=1)
{
    string CDKey  = GetNthCDKeyFromDB(iCount, FALSE);
    string Spacer = "$";
    string AccountCluster, KeyAccount;

    if(CDKey != "")
    {
        AdvDebug(oPC, "*------------*");
        AdvDebug(oPC, "CDKey: "+CDKey);

        KeyAccount = GetFirstAccountFromCDKey(CDKey, FALSE);

        while(KeyAccount != "")
        {
            //AdvDebug(oPC, "KeyAccount: "+KeyAccount);
            AccountCluster += KeyAccount+Spacer;
            KeyAccount      = GetNextAccountFromCDKey(CDKey, FALSE);
        }

        AdvDebug(oPC, "Account Cluster ("+CDKey+"): "+AccountCluster);

        SetLocalString(GetModule(), SQL_KEYLOGGER_KEY+IntToString(iCount), CDKey);
        SetLocalString(GetModule(), CDKey+SQL_KEYLOGGER_ACCOUNTS, AccountCluster);
        SetLocalInt(GetModule(),    CDKey+SQL_KEYLOGGER_BANNED, FALSE);

        DCS_AddCDKeyToDatabase(CDKey, AccountCluster);
        DelayCommand(0.2, ConvertCDKeys(oPC, iCount+1));
    }
    else
    SendMessageToPC(oPC, "All Keys converted into SQL DB");
}

void main()
{
    ConvertCDKeys(GetPCSpeaker());
}
