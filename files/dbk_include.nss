#include "dcs_inc_database"

const int DBK_MAXIMUM_ENTRIES_PER_PAGE  = 8;
const int DBK_PLAYERLIST_TOKEN_BASE     = 45000;

const int DBK_PERCENTAGE_TOKEN          = 6001;

const string DBK_GOLD_STATUS_BEGIN      = "<cþþ>";
const string DBK_GOLD_STATUS_END        = "</c>";

const int DBK_TRANSFER_ITEM_TO_BANK     = 1;
const int DBK_TRANSFER_BANK_TO_ITEM     = 2;

const string DBK_LIST_POSITION      = "dbk_list_position";
const string DBK_NEXT_PAGE          = "dbk_next_page";
const string DBK_PREVIOUS_PAGE      = "dbk_prev_page";
const string DBK_CURRENT_PAGE       = "dbk_current_page";
const string DBK_PLAYERNAME         = "dbk_playername_GetPlayerList";
const string DBK_PLAYERACC          = "dbk_playeracc_";
const string DBK_CURRENT_AMOUNT     = "dbk_current_amount";
const string DBK_CHAT_ENABLED       = "dbk_chat_enabled";
const string DBK_STORED_PLAYER      = "dbk_stored_player_";
const string DBK_STORED_PLAYER_NUM  = "dbk_num_stored_players";

// Percentage that will be stored
const int   DBK_USE_PERCENTAGE = FALSE;
const float DBK_PERCENTAGE     = 1.0;
string DBK_PERCENTAGE_STRING   = IntToString(RoundValue((1 - DBK_PERCENTAGE) * 100))+"%";

const string DBK_STORAGE_ITEM = "d0_gold_storage";

// *  Returns the member card object of oPC
object DBK_GetMemberCard(object oPC);

// *  Returns a PC from oStores stored player list including current page
object DBK_GetPlayerByPosition(int iPosition=1, object oStore=OBJECT_SELF);

// *  Makes oPC a member of the banking society
void DBK_AddMember(object oPC);

// *  Function for OnClientEnter event
void DBK_BankOnClientEnter();

// *  Function for OnModuleLoad event
void DBK_BankOnLoad();

// *  Delete current stored player list from oStore
void DBK_DeletePlayerList(object oStore=OBJECT_SELF);

// *  Equalizes current Gold status from oPC on the Bank and on his member card
void DBK_EqualizeGoldStatus(object oPC, int iFirstAttempt=FALSE);

// *  Stores the current Playerlist to the local strings
// *  "dbk_playername_" & "dbk_playeracc_"
void DBK_GetPlayerList();

// *  Sets current gold amount in bank of oPC to iValue
void DBK_SetGoldAmountInBank(object oPC, int iValue, string sTable=DCS_TABLE_TE_DATA);

// *  Sets gold amount on the membercard to iValue
void DBK_SetGoldOnMemberCard(object oPC, int iValue);

// *  Stores iValue to the currently stored money of oPC
void DBK_StoreGold(object oPC, int iValue, int iTakeGold=TRUE);

// *  Store amount of gold to the currently stored money from oPC
void DBK_StoreGoldInBank(object oPC, int iValue, string sTable=DCS_TABLE_TE_DATA);

// *  Store iValue to the currently stored money on oPC's member card
void DBK_StoreGoldOnMemberCard(object oPC, int iValue);

// *  Store current player list (without DMs) on oStore
void DBK_StorePlayerList(object oStore=OBJECT_SELF);

// *  Makes the nearest creature to oPC take nAmount of his Gold
void DBK_TakePlayersGold(int nAmount, object oPC, int bDestroy=FALSE);

// *  Transfers iAmount to the player with charname sPlayername and account name sPlayeracc from oPlayer
void DBK_TransferGold(object oPlayer, string sPlayerName, string sPlayerAcc, int iAmount);

// *  Transfers gold via iTransfermode
// *  Stops, while found a lower amount
void DBK_TransferGoldStatus(object oPC, int iTransfermode, int iStopAtLowerAmount=TRUE);

// *  Transfers iAmount to oTarget from oPlayer
void DBK_TransferGoldToPlayer(object oPlayer, object oTarget, int iAmount);

// *  Withdraws iValue from the currently stored money of oPC
void DBK_WithdrawGold(object oPC, int iValue);

// *  Retrieve amount of gold to the currently stored money from oPC
void DBK_WithdrawGoldFromBank(object oPC, int iValue, string sTable=DCS_TABLE_TE_DATA);

// *  Withdraw iValue from the currently stored money on oPC's member card
void DBK_WithdrawGoldFromMemberCard(object oPC, int iValue);

// *  Returns the current gold amount of oPlayer, including the amount stored in the bank
int DBK_GetGold(object oPlayer);

// *  Returns TRUE, if the current page entry is valid and stores it to the proper token
int DBK_GetPageEntry();

// *  Returns current amount of gold, oPC has stored
int DBK_GetGoldStored(object oPC);

// *  Get current amount of gold, currently stored inf oPC's bank
int DBK_GetGoldStoredInBank(object oPC, string sTable=DCS_TABLE_TE_DATA);

// *  Get current amount of gold, stored on the member card
int DBK_GetGoldStoredOnMemberCard(object oPC);

// *  Returns TRUE, if oPC is currently inside a bank
int DBK_GetIsInBank(object oPC);

// *  Returns TRUE, if oPC is a member of the banks
int DBK_GetIsMember(object oPC);

//*--------------------------------------------------------------------------*//
//*--------------------------------------------------------------------------*//

object DBK_GetMemberCard(object oPC)
{
    return GetItemPossessedBy(oPC, DBK_STORAGE_ITEM);
}

//*--------------------------------------------------------------------------*//

void DBK_AddMember(object oPC)
{
    SetItemCursedFlag(CreateItemOnObject(DBK_STORAGE_ITEM, oPC), TRUE);

    FloatingTextStringOnCreature("* Ihr seid der vereinigten Bänkergesellschaft beigetreten *", oPC, FALSE);
    DelayCommand(1.5, DBK_EqualizeGoldStatus(oPC, TRUE));
}

//*--------------------------------------------------------------------------*//

int DBK_GetIsMember(object oPC)
{
    return GetIsObjectValid(DBK_GetMemberCard(oPC));
}

//*--------------------------------------------------------------------------*//

void DBK_TransferGoldStatus(object oPC, int iTransfermode, int iStopAtLowerAmount=TRUE)
{
    int iGoldBank = DBK_GetGoldStoredInBank(oPC);
    int iGoldCard = DBK_GetGoldStoredOnMemberCard(oPC);

    if(iTransfermode == DBK_TRANSFER_ITEM_TO_BANK)
    {
        if(iGoldBank < iGoldCard && iStopAtLowerAmount)return;

        DBK_SetGoldAmountInBank(oPC, iGoldCard);
    }
    else if(iTransfermode == DBK_TRANSFER_BANK_TO_ITEM)
    {
        if(iGoldCard < iGoldBank && iStopAtLowerAmount)return;

        DBK_SetGoldOnMemberCard(oPC, iGoldBank);
    }
}

//*--------------------------------------------------------------------------*//

void DBK_EqualizeGoldStatus(object oPC, int iFirstAttempt=FALSE)
{
    int iGoldBank = DBK_GetGoldStoredInBank(oPC);
    int iGoldCard = DBK_GetGoldStoredOnMemberCard(oPC);

    if(iGoldBank != iGoldCard)
    {
        if(iFirstAttempt)
            DBK_SetGoldOnMemberCard(oPC, iGoldBank);
        else
            DBK_SetGoldOnMemberCard(oPC, iGoldBank);
    }
}

//*--------------------------------------------------------------------------*//

void DBK_SetGoldAmountInBank(object oPC, int iValue, string sTable=DCS_TABLE_TE_DATA)
{
    string sColumn   = DCS_COL_GETGOLD;
    string sAccname  = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sCharname = SQLEncodeSpecialChars(GetName(oPC));
    string sGold     = IntToString(iValue);

    SQLExecDirect("select "+DCS_COL_DB_ACCNAME+" from " + sTable + " where "+DCS_COL_DB_ACCNAME+"='" + sAccname + "' and "+DCS_COL_DB_CHARNAME+"='" + sCharname + "'");

    if(SQLFetch())
    {
        SQLExecDirect("update "+sTable+" set "+DCS_COL_GETGOLD+"='"+sGold+"' where "+DCS_COL_DB_ACCNAME+"='"+sAccname+"' and "+DCS_COL_DB_CHARNAME+"='" + sCharname + "'");
    }
}

//*--------------------------------------------------------------------------*//

void DBK_StoreGoldInBank(object oPC, int iValue, string sTable=DCS_TABLE_TE_DATA)
{
    int    iCurrent  = DBK_GetGoldStoredInBank(oPC) + iValue;
    string sColumn   = DCS_COL_GETGOLD;
    string sAccname  = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sCharname = SQLEncodeSpecialChars(GetName(oPC));
    string sGold     = IntToString(iCurrent);

    SQLExecDirect("select "+DCS_COL_DB_ACCNAME+" from " + sTable + " where "+DCS_COL_DB_ACCNAME+"='" + sAccname + "' and "+DCS_COL_DB_CHARNAME+"='" + sCharname + "'");

    if(SQLFetch())
    {
        SQLExecDirect("update "+sTable+" set "+DCS_COL_GETGOLD+"='"+sGold+"' where "+DCS_COL_DB_ACCNAME+"='"+sAccname+"' and "+DCS_COL_DB_CHARNAME+"='" + sCharname + "'");
    }
}

//*--------------------------------------------------------------------------*//

void DBK_WithdrawGoldFromBank(object oPC, int iValue, string sTable=DCS_TABLE_TE_DATA)
{
    DBK_StoreGoldInBank(oPC, iValue * -1, sTable);
}

//*--------------------------------------------------------------------------*//

int DBK_GetGoldStoredInBank(object oPC, string sTable=DCS_TABLE_TE_DATA)
{
    string sAccname  = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sCharname = SQLEncodeSpecialChars(GetName(oPC));

    SQLExecDirect("select "+DCS_COL_GETGOLD+" from " + sTable + " where "+DCS_COL_DB_ACCNAME+"='" + sAccname + "' and "+DCS_COL_DB_CHARNAME+"='" + sCharname + "'");

    if (SQLFetch())
        return StringToInt(SQLGetData(1));
    else
        return 0;
}

//*--------------------------------------------------------------------------*//

void DBK_WithdrawGoldFromMemberCard(object oPC, int iValue)
{
    DBK_StoreGoldOnMemberCard(oPC, iValue * -1);
}

//*--------------------------------------------------------------------------*//

void DBK_StoreGoldOnMemberCard(object oPC, int iValue)
{
    DBK_SetGoldOnMemberCard(oPC, DBK_GetGoldStoredOnMemberCard(oPC) + iValue);
}

//*--------------------------------------------------------------------------*//

void DBK_SetGoldOnMemberCard(object oPC, int iValue)
{
    object oMemberCard = DBK_GetMemberCard(oPC);
    string sDesc       = GetDescription(oMemberCard);
    int iBegin         = FindSubString(sDesc, DBK_GOLD_STATUS_BEGIN) + GetStringLength(DBK_GOLD_STATUS_BEGIN);
    int iCount         = FindSubString(sDesc, DBK_GOLD_STATUS_END);

    SetDescription(oMemberCard, ReplaceTextPhraseByPosition(sDesc, IntToString(iValue), iBegin, iCount));
}

//*--------------------------------------------------------------------------*//

int DBK_GetGoldStoredOnMemberCard(object oPC)
{
    object oMemberCard = DBK_GetMemberCard(oPC);
    string sDesc       = GetDescription(oMemberCard);
    int iBegin         = FindSubString(sDesc, DBK_GOLD_STATUS_BEGIN) + GetStringLength(DBK_GOLD_STATUS_BEGIN);
    int iCount         = FindSubString(sDesc, DBK_GOLD_STATUS_END)-iBegin;

    return StringToInt(GetSubString(sDesc, iBegin, iCount));
}

//*--------------------------------------------------------------------------*//

void DBK_StoreGold(object oPC, int iValue, int iTakeGold=TRUE)
{
    if(iValue > GetGold(oPC) && iTakeGold)return;

    int iStore = FloatToInt(iValue * DBK_PERCENTAGE);

    if(!DBK_USE_PERCENTAGE)iStore = iValue;

    DBK_StoreGoldOnMemberCard(oPC, iStore);
    DBK_StoreGoldInBank(oPC, iStore);

    if(iTakeGold)
    DBK_TakePlayersGold(iValue, oPC, TRUE);
}

//*--------------------------------------------------------------------------*//

void DBK_WithdrawGold(object oPC, int iValue)
{
    DBK_WithdrawGoldFromMemberCard(oPC, iValue);
    DBK_WithdrawGoldFromBank(oPC, iValue);
}

//*--------------------------------------------------------------------------*//

int DBK_GetGoldStored(object oPC)
{
    int iGoldCard = DBK_GetGoldStoredOnMemberCard(oPC);
    int iGoldBank = DBK_GetGoldStoredInBank(oPC);

    if(iGoldCard >= iGoldBank) return iGoldCard;

    return iGoldBank;
}

//*--------------------------------------------------------------------------*//

int DBK_GetGold(object oPlayer)
{
    if(GetIsPC(oPlayer) || GetIsDM(oPlayer))
    return DBK_GetGoldStored(oPlayer) + GetGold(oPlayer);

    return 0;
}

//*--------------------------------------------------------------------------*//

int DBK_GetIsInBank(object oPC)
{
    return GetIsObjectValid(GetNearestObjectByTag("D0_IN_BANK", oPC));
}

//*--------------------------------------------------------------------------*//

void DBK_TakePlayersGold(int nAmount, object oPC, int bDestroy=FALSE)
{
    object oToTake = GetNearestObject(OBJECT_TYPE_CREATURE, oPC);

    AssignCommand(oToTake, TakeGoldFromCreature(nAmount, oPC, bDestroy));
}

//*--------------------------------------------------------------------------*//

void DBK_StorePlayerList(object oStore=OBJECT_SELF)
{
    object oPC = GetFirstPC();
    int iCount = 1;

    while(GetIsObjectValid(oPC))
    {
        if(!GetIsDM(oPC) && GetIsPC(oPC) && GetPCSpeaker() != oPC)
        {
            SetLocalObject(oStore, DBK_STORED_PLAYER+inStr(iCount), oPC);
            iCount++;
        }

        oPC = GetNextPC();
    }

    SetLocalInt(oStore, DBK_STORED_PLAYER_NUM, iCount);
}

//*--------------------------------------------------------------------------*//

void DBK_DeletePlayerList(object oStore=OBJECT_SELF)
{
    object oPC  = DBK_GetPlayerByPosition(1, oStore);
    int    iNum = GetLocalInt(oStore, DBK_STORED_PLAYER_NUM);
    int    iCount;

    for(iCount = 1; iCount <= iNum; iCount++)
    {
        DeleteLocalObject(oStore, DBK_STORED_PLAYER+inStr(iCount));
    }

    DeleteLocalInt(oStore, DBK_STORED_PLAYER_NUM);
}

//*--------------------------------------------------------------------------*//

object DBK_GetPlayerByPosition(int iPosition=1, object oStore=OBJECT_SELF)
{
    int iPage = GetInternSwitch(DBK_CURRENT_PAGE);
    int iMax  = iPage * DBK_MAXIMUM_ENTRIES_PER_PAGE;
    int iCount;
    object oPC;

    SetInternSwitch(DBK_LIST_POSITION, 0);
    SetInternSwitch(DBK_PREVIOUS_PAGE, FALSE);
    SetInternSwitch(DBK_NEXT_PAGE, FALSE);

    if(iPage >= 1)
    SetInternSwitch(DBK_PREVIOUS_PAGE, TRUE);

    return GetLocalObject(oStore, DBK_STORED_PLAYER+inStr(iMax+iPosition));
}

//*--------------------------------------------------------------------------*//

void DBK_GetPlayerList()
{
    object oPC    = DBK_GetPlayerByPosition();
    int    iCount = 1;
    string sCount = IntToString(iCount);

    while(GetIsObjectValid(oPC))
    {
        if(iCount > DBK_MAXIMUM_ENTRIES_PER_PAGE)
        {
            SetInternSwitch(DBK_NEXT_PAGE, TRUE);
            return;
        }

        SetLocalString(OBJECT_SELF, DBK_PLAYERNAME + sCount, GetName(oPC));
        SetLocalString(OBJECT_SELF, DBK_PLAYERACC  + sCount, GetPCPlayerName(oPC));

        iCount++;
        sCount = IntToString(iCount);

        oPC = DBK_GetPlayerByPosition(iCount);
    }
}

//*--------------------------------------------------------------------------*//

int DBK_GetPageEntry()
{
    int iPage    = GetInternSwitch(DBK_CURRENT_PAGE);
    int iPos     = GetInternSwitch(DBK_LIST_POSITION) + 1;
    string sPos  = IntToString(iPos);
    string sName = GetLocalString(OBJECT_SELF, DBK_PLAYERNAME + sPos);
    string sAcc  = GetLocalString(OBJECT_SELF, DBK_PLAYERACC  + sPos);

    if(iPos > DBK_MAXIMUM_ENTRIES_PER_PAGE)
    return FALSE;

    SetInternSwitch(DBK_LIST_POSITION, iPos);

    if(sName != "" && sAcc != "")
    {
        SetCustomToken(DBK_PLAYERLIST_TOKEN_BASE+iPos, ColorText(sName, nwcYellow)+" ('"+ColorText(sAcc, nwcYellow)+"')");
        return TRUE;
    }

    return FALSE;
}

//*--------------------------------------------------------------------------*//

void DBK_TransferGoldToPlayer(object oPlayer, object oTarget, int iAmount)
{
    if(iAmount <= 0 || !GetIsObjectValid(oTarget) || !GetIsObjectValid(oPlayer))return;

    int iGoldBank = DBK_GetGoldStored(oPlayer);
    int iGoldPC   = GetGold(oPlayer);
    if(iGoldBank >= iAmount)
    {
        iGoldBank = iAmount;
        iGoldPC   = 0;
    }
    else if(iGoldBank < iAmount)
    iGoldPC = iAmount - iGoldBank;

    if(iGoldPC > 0)
    DBK_TakePlayersGold(iGoldPC, oPlayer, TRUE);
    DBK_WithdrawGold(oPlayer, iGoldBank);
    DBK_EqualizeGoldStatus(oPlayer);

    FloatingTextStringOnCreature("Ihr habt "+ConvertNumberToString(iAmount)+" Goldmünzen auf das Bankkonto von "+ColorText(GetName(oTarget), nwcYellow)+" ("+GetPCPlayerName(oTarget)+") überwiesen!", oPlayer, FALSE);
    FloatingTextStringOnCreature("Ihr habt "+ConvertNumberToString(iAmount)+" Goldmünzen von "+ColorText(GetName(oPlayer), nwcYellow)+" ("+GetPCPlayerName(oPlayer)+") auf eurer Bankkonto überwiesen bekommen!", oTarget, FALSE);
    DBK_StoreGold(oTarget, iAmount, FALSE);
    DelayCommand(1.5, DBK_EqualizeGoldStatus(oPlayer));
}

//*--------------------------------------------------------------------------*//

void DBK_TransferGold(object oPlayer, string sPlayerName, string sPlayerAcc, int iAmount)
{
    if(!GetNWNXModuleConnect_ODBC() || iAmount <= 0 || !GetIsObjectValid(oPlayer))return;

    if(SQLEncodeSpecialChars(GetPCPlayerName(oPlayer)) == sPlayerAcc)
    {
        FloatingTextStringOnCreature("Ihr könnt kein Gold an euren eigenen Account schicken!", oPlayer, FALSE);
        return;
    }

    int iGoldPC, iGoldBank;
    string sTransfer;

    sPlayerName = SQLEncodeSpecialChars(sPlayerName);
    sPlayerAcc  = SQLEncodeSpecialChars(sPlayerAcc);

    SQLExecDirect("select rowid from "+DCS_TABLE_TE_DATA+" where "+DCS_COL_DB_CHARNAME+"='"+sPlayerName+"' and "+DCS_COL_DB_ACCNAME+"='"+sPlayerAcc+"'");

    if(!SQLFetch())
    {
        FloatingTextStringOnCreature("Es existiert kein Charakter mit diesem Namen und Account in der Datenbank!", oPlayer, FALSE);
        return;
    }

    // Momentane ueberweisungen
    SQLExecDirect("select "+DCS_COL_TIP+" from "+DCS_TABLE_TE_DATA+" where "+DCS_COL_DB_CHARNAME+"='"+sPlayerName+"' and "+DCS_COL_DB_ACCNAME+"='"+sPlayerAcc+"'");

    if(SQLFetch())
    sTransfer  = SQLGetData(1);
    sTransfer += GetName(oPlayer)+dcsLocalMid+SQLEncodeSpecialChars(GetPCPlayerName(oPlayer))+dcsLocalMid+IntToString(iAmount)+dcsLocalMid+dcsLocalEnd;

    SQLExecDirect("update "+DCS_TABLE_TE_DATA+" set "+DCS_COL_TIP+"='"+sTransfer+"' where "+DCS_COL_DB_CHARNAME+"='"+sPlayerName+"' and "+DCS_COL_DB_ACCNAME+"='"+sPlayerAcc+"'");

    iGoldBank = DBK_GetGoldStored(oPlayer);
    iGoldPC   = GetGold(oPlayer);
    if(iGoldBank >= iAmount)
    {
        iGoldBank = iAmount;
        iGoldPC   = 0;
    }
    else if(iGoldBank < iAmount)
    iGoldPC = iAmount - iGoldBank;

    if(iGoldPC > 0)
    DBK_TakePlayersGold(iGoldPC, oPlayer, TRUE);
    DBK_WithdrawGold(oPlayer, iGoldBank);

    FloatingTextStringOnCreature("Ihr habt "+ConvertNumberToString(iAmount)+" Goldmünzen auf das Bankkonto von "+ColorText(sPlayerName, nwcYellow)+" ("+sPlayerAcc+") überwiesen!", oPlayer, FALSE);
}

//*--------------------------------------------------------------------------*//

void DBK_FinishActiveTransactions(object oPC)
{
    if(!GetIsPC(oPC) && !GetIsDM(oPC))return;

    int iTransfers, iCount, iAmount, iFull;
    string sTransfers, sCurrent, sPlayerName, sPlayerAcc, sPName, sPAcc, sDebug, sAdd;

    sPName = SQLEncodeSpecialChars(GetName(oPC));
    sPAcc  = SQLEncodeSpecialChars(GetPCPlayerName(oPC));

    SQLExecDirect("select "+DCS_COL_TIP+" from "+DCS_TABLE_TE_DATA+" where "+DCS_COL_DB_CHARNAME+"='"+sPName+"' and "+DCS_COL_DB_ACCNAME+"='"+sPAcc+"'");

    if(SQLFetch())
    sTransfers = SQLGetData(1);

    if(sTransfers == "")return;

    iTransfers = SplitStringSize(sTransfers, dcsLocalEnd);

    for(iCount=1; iCount <= iTransfers; iCount++)
    {
        sCurrent    = SplitStringValue(sTransfers, iCount, dcsLocalEnd);
        sPlayerName = SQLDecodeSpecialChars(SplitStringValue(sCurrent, 1, dcsLocalMid));
        sPlayerAcc  = SQLDecodeSpecialChars(SplitStringValue(sCurrent, 2, dcsLocalMid));
        iAmount     = StringToInt(SplitStringValue(sCurrent, 3, dcsLocalMid));
        iFull      += iAmount;

        if(iTransfers > 1)
        {
            sAdd    = "überwiesen";
            sDebug += ", "+nwCrLf+ConvertNumberToString(iAmount)+" von "+ColorText(sPlayerName, nwcRed)+" ("+sPlayerAcc+")";
        }
        else
        {
            sDebug = "von "+ColorText(sPlayerName, nwcRed)+" ("+sPlayerAcc+") überwiesen";
        }
    }

    SQLExecDirect("update "+DCS_TABLE_TE_DATA+" set "+DCS_COL_TIP+"='' where "+DCS_COL_DB_CHARNAME+"='"+sPName+"' and "+DCS_COL_DB_ACCNAME+"='"+sPAcc+"'");

    if(iFull > 0)
    {
        FloatingTextStringOnCreature("Euch wurden "+ConvertNumberToString(iFull)+" Goldmünzen auf euer Bankkonto "+sAdd+sDebug+"!", oPC, FALSE);
        DBK_StoreGold(oPC, iFull, FALSE);
    }

    DelayCommand(1.5, DBK_EqualizeGoldStatus(oPC));
}

//*--------------------------------------------------------------------------*//

void DBK_ResetTransferPage()
{
    int iMax = DBK_MAXIMUM_ENTRIES_PER_PAGE;
    int iCount;

    for(iCount=1; iCount <= iMax; iCount++)
    {
        DeleteLocalFloat(OBJECT_SELF, DBK_PLAYERNAME+IntToString(iCount));
        DeleteLocalFloat(OBJECT_SELF, DBK_PLAYERACC+IntToString(iCount));
    }
}

//*--------------------------------------------------------------------------*//

void DBK_BankOnLoad()
{
    SetCustomToken(DBK_PERCENTAGE_TOKEN, DBK_PERCENTAGE_STRING);
}

//*--------------------------------------------------------------------------*//

void DBK_BankOnClientEnter()
{
    object oPC = GetEnteringObject();

    if(!DBK_GetIsMember(oPC))
    DBK_AddMember(oPC);

    DelayCommand(6.0, DBK_FinishActiveTransactions(oPC));
    DelayCommand(8.0, DBK_EqualizeGoldStatus(oPC));
}

//void main(){}
