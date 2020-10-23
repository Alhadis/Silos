#include "aps_include"
#include "seed_helper_func"
#include "seed_random_magi"

const int SDB_PLAYERNAME_UNIQUE = FALSE; // PC NAME MUST BE UNIQUE
const int SDB_PLAYERNAME_LENGTH = 40;    // PC MAX NAME LENGTH. 0 = ANY LENGTH
const int SDB_TRACK_PVM_DETAILS = 0;     // SAVE ALL PLAYERVSMONSTER DETAILS TO DB?

const int SDB_BANTYPE_TEMP = 0;
const int SDB_BANTYPE_CKID = 1;
const int SDB_BANTYPE_ACID = 2;
const int SDB_BANTYPE_CAID = 3;
const int SDB_BANTYPE_PLID = 4;

const int SDB_BANKTRANS_XP = 1;
const int SDB_BANKTRANS_GOLD = 2;

const string SDB_ACID            = "SDB_ACID";
const string SDB_ANIMOSITY       = "SDB_ANIMOSITY";
const string SDB_ARID            = "SDB_ARID";
const string SDB_BANK_GOLD       = "SDB_BANKGOLD";
const string SDB_BANK_XP         = "SDB_BANKXP";
const string SDB_BANNED          = "SDB_BANNED";
const string SDB_BIND            = "SDB_BIND";
const string SDB_CAID            = "SDB_CAID";
const string SDB_CKID            = "SDB_CKID";
const string SDB_DAMAGE          = "SDB_DAMAGE";
const string SDB_DEATHS          = "SDB_DEATHS";
const string SDB_KILLS           = "SDB_KILLS";
const string SDB_KILLS_NEW       = "SDB_KILLS_NEW";
const string SDB_LIID            = "SDB_LIID";
const string SDB_MOID            = "SDB_MOID_";
const string SDB_MONSTER_INSERT  = "SDB_MONSTER_INSERT";
const string SDB_NEW_CHAR        = "SDB_NEW";
const string SDB_NO_DEATH_PEN    = "SDB_NO_DEATH_PEN";
const string SDB_PC_CNT          = "SDB_PC_CNT";
const string SDB_PC_MAX          = "SDB_PC_MAX";
const string SDB_PLID            = "SDB_PLID";
const string SDB_PV_LVL          = "SDB_PV_LVL";
const string SDB_PVID            = "SDB_PVID";
const string SDB_SEID            = "SDB_SEID";
const string SDB_TIME            = "SDB_TIME";
const string SDB_XP              = "SDB_XP";

void     SDB_ApplyBan(object oPC,  int nBanType = SDB_BANTYPE_TEMP, int nBanLength = 1);
void     SDB_BootPC(object oPC, string sMsg, string sDMMsg);
void     SDB_BankTransaction(object oPC, int nAmount, int nTranType=SDB_BANKTRANS_GOLD);
int      SDB_CheckTempBan(object oPC);
void     SDB_Error(string sError);
string   SDB_GetACID(object oPC);
string   SDB_GetARID(object oArea);
int      SDB_GetBankGold(object oPC);
int      SDB_GetBankXP(object oPC);
string   SDB_GetCAID(object oPC);
string   SDB_GetCKID(object oPC);
string   SDB_GetLIID(object oPC);
string   SDB_GetMOID(object oMonster);
string   SDB_GetPLID(object oPC);
string   SDB_GetPVID(object oPC);
string   SDB_GetSEID(int nServer = 1);
void     SDB_JumpToBind(object oPC);
void     SDB_LogMsg(string sType, string sMsg, object oPC=OBJECT_INVALID);
int      SDB_NetWorth(object oPC);
void     SDB_OnAreaEnter(object oArea);
void     SDB_OnClientEnter(object oPC);
void     SDB_OnClientExit(object oPC);
void     SDB_OnModuleLoad();
void     SDB_OnMonsterDeath(object oMonster, object oPC, int nPartyCnt, int nTreasure=FALSE);
void     SDB_OnPCBind(object oPC, object oBind=OBJECT_INVALID);
void     SDB_OnPCDeath(object oPC, object oKiller);
void     SDB_OnPCLevelUp(object oPC);
void     SDB_OnPCRespawn(object oPC);
void     SDB_OnPCRest(object oPC);
void     SDB_SetBankGold(object oPC, int nGold);
void     SDB_SetBankXP(object oPC, int nXP);
void     SDB_SetBind(object oPC, location lBind);
string   SDB_SetField(string sFld, string sVal);
void     SDB_SetNewType(object oPC, string sType);
void     SDB_UpdateAnimosity(object oPC, int nAnimosity);
void     SDB_UpdatePlayerStatus(object oPC, string sActive="1");
void     SDB_UpdateSessionCnt(int nVal);
int      SDB_ValidName(object oPC);
location SDB_GetBind(object oPC);
void     SDB_CheckServer2(object oPC);
int      SDB_CheckDatabase();

string SDB_SetField(string sFld, string sVal) {
   return sFld + "=" + sVal;
}

void SDB_Error(string sError) {
   string sSQL = "insert into dberrors (de_error) values (" + InQs(sError) + ")";
   SQLExecDirect(sSQL);
   WriteTimestampedLogEntry("SDB ERROR: " + sError);
}

void SDB_BootPC(object oPC, string sMsg, string sDMMsg) {
   if (!GetIsObjectValid(oPC)) return;
   PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, sMsg + " You will be booted in 15 seconds.");
   DelayCommand(15.0f, BootPC(oPC));
   string sBoot = " Booted CDKey/Account/Player: " + DelimList(GetPCPublicCDKey(oPC), GetPCPlayerName(oPC), GetName(oPC));
   SendMessageToAllDMs("SDB MESSAGE: " + sDMMsg + sBoot);
   WriteTimestampedLogEntry("SDB MESSAGE: " + sDMMsg + sBoot);
}

void SDB_SetNewType(object oPC, string sType) {
   if (GetLocalString(oPC, SDB_NEW_CHAR)=="") SetLocalString(oPC, SDB_NEW_CHAR, sType);
}

string SDB_GetNewType(object oPC) {
   return GetLocalString(oPC, SDB_NEW_CHAR);
}

int SDB_NetWorth(object oPC) {
   int iSlot=0;
   int iGP = 0;
   object oItem;
   for(iSlot = 0; iSlot < NUM_INVENTORY_SLOTS; iSlot++) {
      oItem = GetItemInSlot(iSlot, oPC);
      if (GetIsObjectValid(oItem)) iGP = iGP + GetGoldPieceValue(oItem);
   }
   oItem=GetFirstItemInInventory(oPC);
   while(GetIsObjectValid(oItem)) {
      iGP = iGP + GetGoldPieceValue(oItem);
      oItem = GetNextItemInInventory(oPC);
   }
   return iGP;
}

string SDB_GetSEID(int nServer = 1) { // GET OR CREATE A SESSION ID
   string sSEID = GetLocalString(GetModule(), SDB_SEID);
   if (sSEID=="") { // NO VARIABLE YET, CREATE IT
      string sSQL;
      sSQL = "insert into session (se_added, se_module) values (now(), "+ InQs(GetModuleName()+" " + IntToString(nServer)) + ")";
      SQLExecDirect(sSQL);
      sSQL = "select last_insert_id() from session limit 1";
      SQLExecDirect(sSQL);
      if (SQLFetch() != SQL_ERROR) {
         sSEID = SQLGetData(1);
         SetLocalString(GetModule(), SDB_SEID, sSEID);
      } else {
         WriteTimestampedLogEntry("No database! Session variable not fetched.");
         return "-1";
      }
      // SET UP SOME SESSION VARIABLES
      SetLocalInt(GetModule(), SDB_PC_CNT, 0);
      SetLocalInt(GetModule(), SDB_PC_MAX, 0);
   }
   return sSEID;
}

string SDB_GetCKID(object oPC) { // GET OR CREATE A CDKEY ID
   string sCKID = GetLocalString(oPC, SDB_CKID);
   if (sCKID=="") { // NO VARIABLE YET, CREATE IT
      sCKID = "0";
      string sSQL;
      string sCDKey = GetPCPublicCDKey(oPC);
      sSQL = "select ck_ckid, ck_ban from cdkey where ck_cdkey = " + InQs(sCDKey);
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         SDB_SetNewType(oPC, "CDKEY");
         sSQL = "insert into cdkey (ck_cdkey) values (" + InQs(sCDKey) + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id(), 0 from cdkey limit 1"; // 0 = NOT BANNED BY DEFAULT
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
      }
      if (nRC != SQL_ERROR) {
         sCKID = SQLGetData(1);
         //SetLocalString(oPC, SDB_CKID, sCKID);
         if (SQLGetData(2)!="0") { // BANNED BY CDKEY!
            SetLocalString(oPC, SDB_BANNED, "CDKey");
         } else { // RECORD EXISTS AND ID FETCHED FROM THE DB SO UPDATE LOGIN INFO
            sSQL = "update cdkey set ck_dllogin=now(), ck_logins=ck_logins+1 where ck_ckid=" + sCKID;
            SQLExecDirect(sSQL);
         }
      } else { // OH NO - DB PROBLEM?
         // SDB_BootPC(oPC, "A Database Error has occurred.", "SDB_GetCKID: Record Not Found");
      }
      SetLocalString(oPC, SDB_CKID, sCKID);
   }
   return sCKID;
}

string SDB_GetACID(object oPC) { // GET OR CREATE AN ACCOUNT ID
   string sACID = GetLocalString(oPC, SDB_ACID);
   int bNew = FALSE;
   if (sACID=="") { // NO VARIABLE YET, CREATE IT
      sACID = "0";
      string sSQL;
      string sAccount = GetPCPlayerName(oPC);
      sSQL = "select ac_acid, ac_ban, ac_bankxp, ac_bankgold, ac_animosity from account where ac_name = " + InQs(sAccount);
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         SDB_SetNewType(oPC, "ACCOUNT"); // <- REDUNDANT! CANT HAVE NEW ACCOUNT W/O NEW CDKEYACCOUNT
         sSQL = "insert into account (ac_name) values (" + InQs(sAccount) + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id(), 0, 0, 0, 0 from account limit 1"; // 0 = NOT BANNED BY DEFAULT
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
         bNew = TRUE;
      }
      if (nRC != SQL_ERROR) {
         sACID = SQLGetData(1);
         //SetLocalString(oPC, SDB_ACID, sACID);
         if (SQLGetData(2)!="0") { // BANNED BY ACCOUNT!
            SetLocalString(oPC, SDB_BANNED, "Account");
         } else { // RECORD EXISTS AND ID FETCHED FROM THE DB SO UPDATE LOGIN INFO
            SetLocalInt(oPC, SDB_BANK_XP, StringToInt(SQLGetData(3)));
            SetLocalInt(oPC, SDB_BANK_GOLD, StringToInt(SQLGetData(4)));
            SetLocalInt(oPC, SDB_ANIMOSITY, StringToInt(SQLGetData(5)));
            sSQL = "update account set ac_dllogin=now(), ac_logins=ac_logins+1 where ac_acid=" + sACID;
            SQLExecDirect(sSQL);
         }
      } else { // OH NO - DB PROBLEM?
         //SDB_BootPC(oPC, "A Database Error has occurred.", "SDB_GetACID: Record Not Found");
      }
      SetLocalString(oPC, SDB_ACID, sACID);
   }
   return sACID;
}

string SDB_GetPLID(object oPC) { // GET OR CREATE AN PLAYER ID
   string sPLID = GetLocalString(oPC, SDB_PLID);
   if (sPLID=="") { // NO VARIABLE YET, CREATE IT
      sPLID = "0";
      string sSQL;
      string sPlayer = GetName(oPC);
      string sACID = SDB_GetACID(oPC); // GET ACCOUNT TABLE ID
      sSQL = "select pl_plid, pl_damage, pl_kills, pl_bind, pl_deaths, pl_ban from player where pl_acid = " + sACID + " and pl_name = " + InQs(sPlayer);
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         SDB_SetNewType(oPC, "PLAYER");
         sSQL = "insert into player (pl_acid, pl_name, pl_dm) values (" + sACID + "," + InQs(sPlayer) + "," + IntToString(GetIsDM(oPC)) + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id(), 0, 0, '', 0, 0 from player limit 1"; // 0 DAMAGE, 0 BAN BY DEFAULT
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
      }
      if (nRC != SQL_ERROR) {
         sPLID = SQLGetData(1);
         //SetLocalString(oPC, SDB_PLID, sPLID);
         SetLocalInt(oPC, SDB_DAMAGE, StringToInt(SQLGetData(2)));
         SetLocalInt(oPC, SDB_KILLS_NEW, 0); //StringToInt(SQLGetData(3)));
         SetLocalLocation(oPC, SDB_BIND, APSStringToLocation(SQLGetData(4)));
         SetLocalInt(oPC, SDB_DEATHS, StringToInt(SQLGetData(5)));
         if (SQLGetData(6)!="0") { // BANNED BY PLAYER!
            SetLocalString(oPC, SDB_BANNED, "Character");
         } else { // RECORD EXISTS AND ID FETCHED FROM THE DB SO UPDATE LOGIN INFO
            sSQL = "update player set pl_dllogin=now(), pl_logins=pl_logins+1 where pl_plid=" + sPLID;
            SQLExecDirect(sSQL);
         }

      } else { // OH NO - DB PROBLEM?
         //SDB_BootPC(oPC, "A Database Error has occurred.", "SDB_GetPLID: Record Not Found");
         SetLocalLocation(oPC, SDB_BIND, GetCampaignLocation("SDB_BIND", "BIND", oPC));
         SendMessageToPC(oPC, "Bioware Bound...");
      }
      SetLocalString(oPC, SDB_PLID, sPLID);
   }
   return sPLID;
}

string SDB_GetCAID(object oPC) { // GET OR CREATE A CDKEY/ACCOUNT ID
   string sCAID = GetLocalString(oPC, SDB_CAID);
   if (sCAID=="") { // NO VARIABLE YET, CREATE IT
      sCAID=="0";
      string sSQL;
      string sCKID = SDB_GetCKID(oPC); // GET CDKEY TABLE ID
      string sACID = SDB_GetACID(oPC); // GET ACCOUNT TABLE ID
      sSQL = "select ca_caid, ca_ban from cdkeyaccount where ca_ckid = " + sCKID + " and ca_acid = " + sACID;
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         SDB_SetNewType(oPC, "CDKEYACCOUNT");
         sSQL = "insert into cdkeyaccount (ca_ckid, ca_acid) values (" + sCKID + "," + sACID + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id(), 0 from cdkeyaccount limit 1"; // 0 = NOT BANNED BY DEFAULT
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
      }
      if (nRC != SQL_ERROR) {
         sCAID = SQLGetData(1);
         WriteTimestampedLogEntry("New sCAID = " + sCAID);
         //SetLocalString(oPC, SDB_CAID, sCAID);
         if (SQLGetData(2)!="0") { // BANNED BY CDKEYACCOUNT!
            SetLocalString(oPC, SDB_BANNED, "CDKey/Account");
         } else { // RECORD EXISTS AND ID FETCHED FROM THE DB SO UPDATE LOGIN INFO
            sSQL = "update cdkeyaccount set ca_dllogin=now(), ca_logins=ca_logins+1 where ca_caid=" + sCAID;
            SQLExecDirect(sSQL);
         }
      } else { // OH NO - DB PROBLEM?
         //SDB_BootPC(oPC, "A Database Error has occurred.", "SDB_GetCAID: Record Not Found");
      }
      SetLocalString(oPC, SDB_CAID, sCAID);
   }
   return sCAID;
}

string SDB_GetPVID(object oPC) { // GET OR CREATE A PLAYER LEVEL RECORD
   if (GetIsDM(oPC)) return "0";

   string sPVID = GetLocalString(oPC, SDB_PVID);
   int nPVLVL = GetLocalInt(oPC, SDB_PV_LVL);
   if (sPVID=="" || nPVLVL!=GetHitDice(oPC)) { // NO VARIABLE YET OR PLAYER HAS LEVELED, CREATE NEW
      sPVID = "0";
      string sSQL;
      string sPLID = SDB_GetPLID(oPC); // GET PLAYER TABLE ID
      nPVLVL = GetHitDice(oPC);
      string sLevel = IntToString(GetHitDice(oPC));
      sSQL = "select pv_pvid from playerlevel where pv_plid = " + sPLID + " AND PV_LEVEL = " + sLevel + " ORDER BY PV_ADDED DESC LIMIT 1"; // GET THE LATEST LEVEL RECORD IN CASE OF DELEVELING
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         string sSEID = SDB_GetSEID();    // GET SESSION ID
         string sTag = GetTag(oPC);
         string sName = GetName(oPC);
         string sCR = IntToString(FloatToInt(GetChallengeRating(oPC)));
         string sHP = IntToString(GetMaxHitPoints(oPC));
         string sAC = IntToString(GetAC(oPC));
         string sAB = IntToString(GetBaseAttackBonus(oPC));
         string sC1 = IntToString(GetClassByPosition(1, oPC));
         string sC1L = IntToString(GetLevelByClass(GetClassByPosition(1, oPC),oPC));
         string sC2 = IntToString(GetClassByPosition(2, oPC));
         string sC2L = IntToString(GetLevelByClass(GetClassByPosition(2, oPC),oPC));
         string sC3 = IntToString(GetClassByPosition(3, oPC));
         string sC3L = IntToString(GetLevelByClass(GetClassByPosition(3, oPC),oPC));
         string sGold = IntToString(SDB_NetWorth(oPC));
         sSQL = "insert into playerlevel (pv_seid, pv_plid, pv_level, pv_hp, pv_ac, pv_ab, pv_class1, pv_class1level, pv_class2, pv_class2level, pv_class3, pv_class3level, pv_gold) " +
                   "values (" + DelimList(sSEID, sPLID, sLevel, sHP, sAC, sAB)  +
                          "," + DelimList(sC1, sC1L, sC2, sC2L, sC3, sC3L, sGold) + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id() from playerlevel limit 1";
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
      }
      if (nRC != SQL_ERROR) {
         sPVID = SQLGetData(1);
      }

      SetLocalString(oPC, SDB_PVID, sPVID);
      SetLocalInt(oPC, SDB_PV_LVL, nPVLVL);
   }
   return sPVID;
}

string SDB_GetLIID(object oPC) { // GET OR CREATE A LOGIN ID
   string sLIID = GetLocalString(oPC, SDB_LIID);
   if (sLIID=="") { // NO VARIABLE YET, CREATE IT - PLAYER JUST LOGGED IN
      SDB_CheckServer2(oPC);
      sLIID = "0";
      string sSQL;
      string sSEID = SDB_GetSEID();    // GET SESSION ID
      string sCKID = SDB_GetCKID(oPC); // GET CDKEY TABLE ID
      string sACID = SDB_GetACID(oPC); // GET ACCOUNT TABLE ID
      string sPLID = SDB_GetPLID(oPC); // GET PLAYER TABLE ID
      string sCAID = SDB_GetCAID(oPC); // GET CDKEY-ACCOUNT LINK TABLE ID
      string sIP   = GetPCIPAddress(oPC);
      string sGold = IntToString(SDB_NetWorth(oPC));
      string sXP   = IntToString(GetXP(oPC));
      string sSts  = (GetCurrentHitPoints(oPC)>0) ? "OK" : "DEAD";
      sSts = GetIsDM(oPC) ? "DM" : (GetLocalString(oPC, SDB_BANNED)!="") ? "BAN" : sSts;
      sSQL = "insert into login (li_seid, li_ckid, li_acid, li_plid, li_caid, li_stsin, li_goldin, li_xpin, li_ip) " +
                "values (" + DelimList(sSEID, sCKID, sACID, sPLID, sCAID, InQs(sSts), sGold, sXP, InQs(sIP))  + ")";
      SQLExecDirect(sSQL);
      sSQL = "select last_insert_id() from login limit 1";
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC!=SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         sLIID = SQLGetData(1);
         //SetLocalString(oPC, SDB_LIID, sLIID);
      } else { // OH NO - DB PROBLEM?
         //SDB_BootPC(oPC, "A Database Error has occurred.", "SDB_GetLIID: Record Not Found");
      }
      SetLocalString(oPC, SDB_LIID, sLIID);
   }
   return sLIID;
}

string SDB_GetARID(object oArea) { // GET OR CREATE AN AREA ID
   string sARID = GetLocalString(oArea, SDB_ARID);
   if (sARID=="") { // NO VARIABLE YET, CREATE IT
      sARID = "0";
      string sSQL;
      string sTag = GetTag(oArea);
      string sName = GetName(oArea);
      if (sTag=="") return "0";
      sSQL = "select ar_arid from area where ar_tag = " + InQs(sTag);
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         sSQL = "insert into area (ar_tag, ar_name) values (" + InQs(sTag) + "," + InQs(sName) + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id() from area limit 1";
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
      }
      if (nRC != SQL_ERROR) {
         sARID = SQLGetData(1);
      }
      SetLocalString(oArea, SDB_ARID, sARID);
   }
   return sARID;
}

string SDB_GetMOID(object oMonster) { // GET OR CREATE A MONSTER ID
   string sRes = GetResRef(oMonster);
   if (sRes=="") return "0"; // no resref, bail
   string sMOID = GetLocalString(GetModule(), SDB_MOID + sRes);
   if (sMOID=="") { // NO VARIABLE YET, CREATE IT
      sMOID = "0";
      string sTag = GetTag(oMonster);
      string sName = GetName(oMonster);
      string sCR = IntToString(FloatToInt(GetChallengeRating(oMonster)));
      string sHP = IntToString(GetMaxHitPoints(oMonster));
      string sAC = IntToString(GetAC(oMonster));
      string sAB = IntToString(GetBaseAttackBonus(oMonster));
      string sXP = "0";
      string sLevel = IntToString(GetHitDice(oMonster));
      string sC1 = IntToString(GetClassByPosition(1, oMonster));
      string sC1L = IntToString(GetLevelByClass(GetClassByPosition(1, oMonster),oMonster));
      string sC2 = IntToString(GetClassByPosition(2, oMonster));
      string sC2L = IntToString(GetLevelByClass(GetClassByPosition(2, oMonster),oMonster));
      string sC3 = IntToString(GetClassByPosition(3, oMonster));
      string sC3L = IntToString(GetLevelByClass(GetClassByPosition(3, oMonster),oMonster));
      string sSQL = "select mo_moid from monster where mo_resref = " + InQs(sRes);
      SQLExecDirect(sSQL);
      int nRC = SQLFetch();
      if (nRC==SQL_ERROR) { // GOT NO RECORD IN DB, CREATE ONE
         sSQL = "insert into monster (mo_resref) values (" + InQs(sRes) + ")";
         SQLExecDirect(sSQL);
         sSQL = "select last_insert_id() from monster limit 1";
         SQLExecDirect(sSQL);
         nRC = SQLFetch();
      }
      if (nRC != SQL_ERROR) {
         sMOID = SQLGetData(1);
      }
      SetLocalString(GetModule(), SDB_MOID + sRes, sMOID);

      sSQL = "update monster set " +
          DelimList(SDB_SetField("mo_tag", InQs(sTag)),
                    SDB_SetField("mo_name", InQs(sName)),
                    SDB_SetField("mo_cr", sCR),
                    SDB_SetField("mo_hp", sHP),
                    SDB_SetField("mo_ac", sAC),
                    SDB_SetField("mo_ab", sAB),
                    SDB_SetField("mo_xpatcr", sXP),
                    SDB_SetField("mo_level", sLevel)
                    ) + "," +
          DelimList(SDB_SetField("mo_class1", sC1),
                    SDB_SetField("mo_class1level", sC1L),
                    SDB_SetField("mo_class2", sC2),
                    SDB_SetField("mo_class2level", sC2L),
                    SDB_SetField("mo_class3", sC3),
                    SDB_SetField("mo_class3level", sC3L),
                    SDB_SetField("mo_dlkilled", "now()")
                    ) +
            " where mo_moid = " + sMOID;
      SQLExecDirect(sSQL);

   }
   return sMOID;
}

int SDB_GetBankXP(object oPC) {
   return GetLocalInt(oPC, SDB_BANK_XP);
}

void SDB_SetBankXP(object oPC, int nXP) {
   SDB_BankTransaction(oPC, nXP, SDB_BANKTRANS_XP);
   SetLocalInt(oPC, SDB_BANK_XP, nXP);
   string sSQL = "update account set ac_bankxp=" + IntToString(nXP) + " where ac_acid = " + SDB_GetACID(oPC);
   SQLExecDirect(sSQL);
}

int SDB_GetBankGold(object oPC) {
   return GetLocalInt(oPC, SDB_BANK_GOLD);
}

void SDB_SetBankGold(object oPC, int nGold) {
   SDB_BankTransaction(oPC, nGold, SDB_BANKTRANS_GOLD);
   SetLocalInt(oPC, SDB_BANK_GOLD, nGold);
   string sSQL = "update account set ac_bankgold=" + IntToString(nGold) + " where ac_acid = " + SDB_GetACID(oPC);
   SQLExecDirect(sSQL);
}

int SDB_ValidName(object oPC) {
   if (GetXP(oPC)>0) return TRUE; // ONLY VALIDATE NEW CHARS
   string sAccount = GetPCPlayerName(oPC);
   string sPlayer = GetName(oPC);
   string sMsg = "";
   string sDMMsg = "";
   string sBanSQL = "update player set pl_ban=1 where pl_plid=" + SDB_GetPLID(oPC);
   int bBanAccount = FALSE;
   int iLen = GetStringLength(sPlayer);
   if (FindSubString(sAccount, "~")!=-1 || FindSubString(sAccount, "¬")!=-1) {
      sMsg = "Sorry, Account and Player Names cannot contain the tilde (~) or separator (¬) character.";
      sBanSQL = "update account set ac_ban=1 where ac_acid=" + SDB_GetACID(oPC);
      sDMMsg = "Account Banned: Invalid Name (~ or ¬)";
   } else if (FindSubString(sPlayer, "~")!=-1 || FindSubString(sPlayer, "¬")!=-1) {
      sMsg = "Sorry, Player and Account Names cannot contain the tilde (~) or separator (¬) character.";
      sDMMsg = "Player Banned: Invalid Name (~ or ¬)";
   } else if (SDB_PLAYERNAME_LENGTH>0 && iLen > SDB_PLAYERNAME_LENGTH) {
      sMsg = "Sorry, Player Names cannot be longer than " + IntToString(SDB_PLAYERNAME_LENGTH) + " characters.";
      sDMMsg = "Player Banned: " + IntToString(SDB_PLAYERNAME_LENGTH) + " char name limit exceeded";
   } else if (SDB_PLAYERNAME_UNIQUE) {
      SQLExecDirect("select pl_plid from player where pl_name=" + InQs(sPlayer) + " and pl_acid!=" + SDB_GetACID(oPC));
      if (SQLFetch() != SQL_ERROR) { // This name is used by another account
         sMsg = "Sorry, Another account is using that player name. Please pick a new one.";
         sDMMsg = "Player Ban: Non-Unique name";
      }
   }
   if (sMsg!="") {
      SQLExecDirect(sBanSQL);
      SDB_BootPC(oPC, sMsg, sDMMsg);
      return FALSE;
   }
   return TRUE;
}

void SDB_UpdateSessionCnt(int nVal) {
   string sSEID = SDB_GetSEID();
   int nPCCnt = IncLocalInt(GetModule(), SDB_PC_CNT, nVal);
   int nPCMax = GetMax(nPCCnt, GetLocalInt(GetModule(), SDB_PC_MAX));
   SetLocalInt(GetModule(), SDB_PC_MAX, nPCCnt);
   string sSQL = "update session set " +
        DelimList(SDB_SetField("se_pccnt", IntToString(nPCCnt)),
                      SDB_SetField("se_pcmax", IntToString(nPCMax))) +
                 " where se_seid = " + sSEID;
   SQLExecDirect(sSQL);
}

void SDB_UpdatePlayerStatus(object oPC, string sActive="1") { // CALL THIS AS OFTEN AS NEEDED
   string sPLID = SDB_GetPLID(oPC); // GET PLAYER TABLE ID
   string sSQL;
   string sDamage = IntToString(!GetIsDead(oPC) ? GetMaxHitPoints(oPC)-GetCurrentHitPoints(oPC) : GetMaxHitPoints(oPC)+420);
   string sTime = "pl_time+" + IntToString(GetTick() - GetLocalInt(oPC, SDB_TIME)); // GAME HOURS SINCE LAST SAVE
   SetLocalInt(oPC, SDB_TIME, GetTick());
   string sPos = APSLocationToString(GetLocation(oPC));
   string sNewKills = "pl_kills+" + IntToString(GetLocalInt(oPC, SDB_KILLS_NEW));
   SetLocalInt(oPC, SDB_KILLS_NEW, 0);
   string sDeaths = IntToString(GetLocalInt(oPC, SDB_DEATHS));
   if (sActive!="0") sActive = IntToString(GetLocalInt(GetModule(), "SERVER"));
   //if (GetModuleName()!="deX-port1") sActive="2";
   sSQL = "update player set " +
             DelimList(SDB_SetField("pl_active", sActive),
                           SDB_SetField("pl_damage", sDamage),
                           SDB_SetField("pl_time", sTime),
                           SDB_SetField("pl_kills", sNewKills),
                           SDB_SetField("pl_deaths", sDeaths)) +
           " WHERE PL_PLID = " + sPLID;
   SQLExecDirect(sSQL);
}

void SDB_OnModuleLoad() {
   // IF BOB.BIC IS IN THE ROOT FOR THIS SERVER, CONSIDER IT 1
   int nServer = 2;
   SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", "%bob = 'bob.bic' or die $!; print /Firstname;");
   if (GetLocalString(GetModule(), "NWNX!LETO!SCRIPT")=="Bob") nServer = 1;
   SetLocalInt(GetModule(), "SERVER", nServer);
   WriteTimestampedLogEntry("Started Server #" + IntToString(nServer));

   // FRESHEN UP FOR OUR DATE
   //SQLExecDirect("repair table account, area, cdkey, cdkeyaccount, dberrors, faction, factionmember, factionvsfaction, login, monster, monstervsplayer, playerlevel, player, playervsmonster, playervsplayer, session, temporaryban");
   //SQLExecDirect("optimize table account, area, cdkey, cdkeyaccount, dberrors, faction, factionmember, factionvsfaction, login, monster, monstervsplayer, playerlevel, player, playervsmonster, playervsplayer, session, temporaryban");
   SDB_GetSEID(nServer); // CREATE A NEW SESSION
   SQLExecDirect("delete from temporaryban where tb_expires<=now()"); // UNBAN THE TEMPS
   SQLExecDirect("DELETE FROM pwdata WHERE ADDDATE(last, expire)<now() and expire > 0"); // PURGE PW DATA
   SQLExecDirect("update player set pl_active=0 where pl_active<>0");

   SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", "%win = 'windows.bic' or die $!; print /Firstname;");
   if (GetLocalString(GetModule(), "NWNX!LETO!SCRIPT")=="Bob") SetLocalInt(GetModule(), "WINDOWS", 1);


}

void SDB_OnClientEnter(object oPC) { // CALL ON CLIENT ENTER
   if (GetPCPublicCDKey(oPC)=="") return; // LOCAL MODE, SKIP THIS CRAP
   // CLEAR ALL OLD ID'S - THIS WILL RELOAD ACCOUNT DATA THAT MAY BE IN THE DATABASE BUT STORED LOCALLY - IT MAY HAVE BEEN ACCESSED BY ANOTHER CHAR
   DeleteLocalString(oPC, SDB_LIID);
   DeleteLocalString(oPC, SDB_CKID);
   DeleteLocalString(oPC, SDB_ACID);
   DeleteLocalString(oPC, SDB_PLID);
   DeleteLocalString(oPC, SDB_CAID);
   DeleteLocalString(oPC, SDB_PVID);
   DeleteLocalString(oPC, SDB_BANNED);
   // SET UP THE ID'S
   SDB_GetLIID(oPC); // DOES ALL DB WORK FOR CHARACTER, GETS EXISTING ID ELSE CREATES NEW
   SDB_GetPVID(oPC); // GET PLAYER LEVEL RECORD (it's not used now but we'll need it) OTHER GOTTEN IN GETLIID
   // CHECK PERMANENT BAN
   if (!SDB_ValidName(oPC)) return; // VALIDATE ACCOUNT & PC NAME OR BOOT
   string sBan = GetLocalString(oPC, SDB_BANNED);
   if (sBan!="" && SDB_GetSEID()!="-1") { // BAD PLAYER! BAD!
      SDB_BootPC(oPC, "Sorry, this " + sBan + " is banned. Your login attempt has been recorded.", "SDB_PCLogIn: Banned " + sBan + " attempted log in.");
      return;
   }
   if (SDB_CheckTempBan(oPC) && SDB_GetSEID()!="-1") {
      sBan = GetLocalString(oPC, SDB_BANNED);
      SDB_BootPC(oPC, "Sorry, you are temporarily banned until " + sBan + ". Your login attempt has been recorded.", "SDB_PCLogIn: Temp Ban expiring on" + sBan + " attempted log in.");
      return;
   }
   // UP SESSION COUNT
   SDB_UpdateSessionCnt(1);
   // SET UP SESSION VARS
   SetLocalInt(oPC, SDB_TIME, GetTick());    // SAVE TIME FOR RECORDING HOW LONG PLAYER PLAYED CHARACTER
   SetLocalInt(oPC, SDB_XP, GetXP(oPC)); // VAR TO ACCUM XP
   SetLocalInt(oPC, SDB_KILLS, 0);       // VAR TO ACCUM KILLS
   SetLocalInt(oPC, SDB_KILLS_NEW, 0);
   int nDamage = GetLocalInt(oPC, SDB_DAMAGE);
   if (nDamage > 0) { // PLAYER LOGGED OUT WITH DAMAGE, REAPPLY NOW
      if (GetMaxHitPoints(oPC)<=nDamage) { // KILL EM
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, TRUE), oPC);
         SetLocalInt(oPC, SDB_NO_DEATH_PEN, TRUE);
      } else if (nDamage>0) { // HURT EM
         ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE), oPC);
      }
   }
   DeleteLocalInt(oPC, SDB_DAMAGE);
   SDB_UpdatePlayerStatus(oPC);

   string sSQL = "select sk_skid from skins where sk_plid=" + SDB_GetPLID(oPC);
   SQLExecDirect(sSQL);
   if (SQLFetch()==SQL_SUCCESS) {
      SetCreatureAppearanceType(oPC, StringToInt(SQLGetData(1)));
   }
}

void SDB_OnClientExit(object oPC) { // CALL ON CLIENT EXIT
   if (GetLocalString(oPC, SDB_BANNED)!="") return;   // DON'T DO ANYTHING IF BOOTING A BANNED PLAYER CAUSE WE DIDN'T WHEN THEY ENTERED
   string sLIID = SDB_GetLIID(oPC);
   string sKills= IntToString(GetLocalInt(oPC, SDB_KILLS));
   string sGold = IntToString(SDB_NetWorth(oPC));
   string sXP   = IntToString(GetXP(oPC));
   string sSts  = (GetCurrentHitPoints(oPC)>0) ? "OK" : "DEAD";
   string sAPLID= "0";
   if (GetIsInCombat(oPC)) {
      object oLHA = GetLastHostileActor(oPC);
      if (GetIsPC(oLHA)) {
         sSts = "ATTACK";
         sAPLID = SDB_GetPLID(GetLastHostileActor(oPC));
      }
   }
   string sSQL  = "update login set li_logout=now(), " +
        DelimList(SDB_SetField("li_kills",   sKills),
                      SDB_SetField("li_xpout",   sXP),
                      SDB_SetField("li_stsout",  InQs(sSts)),
                      SDB_SetField("li_goldout", sGold),
                      SDB_SetField("li_attackplid", sAPLID)) +
                   " where li_liid=" + sLIID;
   SQLExecDirect(sSQL);
   SDB_UpdateSessionCnt(-1);
   SDB_UpdatePlayerStatus(oPC, "0");
}

void SDB_OnAreaEnter(object oArea) {
   object oPC = GetEnteringObject();
   if (!GetIsPC(oPC)) return;
   string sARID = SDB_GetARID(oArea);
   if (sARID=="0") return;
   IncLocalInt(oArea, "ENTERED" + sARID);
   if (GetLocalInt(oArea, "ENTERED" + sARID)>3) {
      string sSQL = "update area set ar_entered=ar_entered+3 where ar_arid=" + sARID;
      SQLExecDirect(sSQL);
      IncLocalInt(oArea, "ENTERED" + sARID, -3);
   }
   // SDB_UpdatePlayerStatus(oPC);
}

void SDB_OnPCDeath(object oPC, object oKiller) { // CALL ON PLAYER DEATH
   if (GetIsDM(oKiller)) return;
   string sSQL;
   string sSEID = SDB_GetSEID();
   string sARID = SDB_GetARID(GetArea(oPC));
   string sPLID = SDB_GetPLID(oPC);
   string sPVID = SDB_GetPVID(oPC);
   string sLevel = IntToString(GetHitDice(oPC));
   if (GetLocalInt(oPC, SDB_NO_DEATH_PEN)) { // MODULE KILLED THEM FOR SOME REASON, SO DONT INC DEATH COUNT
      DeleteLocalInt(oPC, SDB_NO_DEATH_PEN);
   } else {
      IncLocalInt(oPC, SDB_DEATHS);
   }
   if (GetIsPC(oKiller)) {
      string skPLID = SDB_GetPLID(oKiller);
      string skPVID = SDB_GetPVID(oKiller);
      string skLevel = IntToString(GetHitDice(oKiller));
      sSQL = "insert into playervsplayer (pp_seid, pp_arid, pp_plid, pp_pvid, pp_plevel, pp_kplid, pp_kpvid, pp_klevel) " +
           "values (" + DelimList(sSEID, sARID, sPLID, sPVID, sLevel, skPLID, skPVID, skLevel) + ")";
      SQLExecDirect(sSQL);
      sSQL = "update player set pl_pked=pl_pked+1, pl_dlpked=now() where pl_plid=" + sPLID;
      SQLExecDirect(sSQL);
      sSQL = "update player set pl_pker=pl_pker+1, pl_dlpker=now() where pl_plid=" + skPLID;
      SQLExecDirect(sSQL);
   } else {
      string sMOID = SDB_GetMOID(oKiller);
      if (sMOID!="0") {
         sSQL = "insert into monstervsplayer (mp_seid, mp_arid, mp_moid, mp_plid, mp_pvid, mp_plevel)" +
              "values (" + DelimList(sSEID, sARID, sMOID, sPLID, sPVID, sLevel) + ")";
         SQLExecDirect(sSQL);
         sSQL = "update monster set mo_kills=mo_kills+1 where mo_moid=" + sMOID;
         SQLExecDirect(sSQL);
      } else {
         WriteTimestampedLogEntry("No MOID on " + GetResRef(oKiller));
      }
   }
   SDB_UpdatePlayerStatus(oPC); // SAVE PC STATUS
}

void SDB_OnPCLevelUp(object oPC) {
   SDB_GetPVID(oPC); // SAVE THE NEW LEVEL, FETCH IT'S ID
   SDB_UpdatePlayerStatus(oPC); // SAVE PC STATUS
}

void SDB_OnPCRest(object oPC) {
   SDB_UpdatePlayerStatus(oPC); // SAVE PC STATUS
   SendMessageToPC(oPC, "Server reboots in " + RemainingUpTime()+ ".");
   int nXP = GetXP(oPC) - GetLocalInt(oPC, SDB_XP);
   int nKills = GetLocalInt(oPC, SDB_KILLS);
   if (nKills!=0) {
       int nAvg = (nXP/nKills)+1;
       SendMessageToPC(oPC, "Since log in, you gained " + IntToString(nXP) + " xp for " + IntToString(nKills) + " kills.\nPer Kill Average (PKA) = " + IntToString(nAvg));

       nXP = GetHitDice(oPC)+1;
       nXP = ((nXP * (nXP - 1)) / 2) * 1000 - GetXP(oPC);
       nKills = nXP / nAvg;
       if (GetHitDice(oPC)<40) {
          if (nKills<420) SendMessageToPC(oPC, "You need " + IntToString(nXP) + " xp to level, or about " + IntToString(nKills) + " kills based on your PKA");
          else SendMessageToPC(oPC, "You need " + IntToString(nXP) + " xp to level. Kill something worth more XP if you ever want to level!");
       }
       if (nXP > 0) FloatingTextStringOnCreature(IntToString(nXP) + " xp TNL", oPC, TRUE);
   }

}

void SDB_OnPCRespawn(object oPC) {
   SDB_UpdatePlayerStatus(oPC); // SAVE PC STATUS
}

location SDB_GetBind(object oPC) {
   return GetLocalLocation(oPC, SDB_BIND);
}

void SDB_SetBind(object oPC, location lBind) {
   string sLoc = APSLocationToString(lBind);
   SetLocalLocation(oPC, SDB_BIND, lBind);
   string sSQL = "update player set pl_bind = " + InQs(sLoc) + " where pl_plid = " + SDB_GetPLID(oPC);
   SQLExecDirect(sSQL);
   if (!SQLFetch()) {
      SetCampaignLocation("SDB_BIND", "BIND", lBind, oPC);
      SendMessageToPC(oPC, "Bioware Bound...");
   }
   DelayCommand(2.5, FloatingTextStringOnCreature("You are now bound in: "+GetName(GetArea(oPC)), oPC, FALSE));
}

void SDB_OnPCBind(object oPC, object oBind=OBJECT_INVALID) {
   if (oBind==OBJECT_INVALID) oBind=oPC;
   string sPLID = SDB_GetPLID(oPC);
   location lBind = GetLocation(oBind);
   SDB_SetBind(oPC, lBind);
}

void SDB_JumpToBind(object oPC) {
   AssignCommand(oPC, ClearAllActions());
   AssignCommand(oPC, JumpToLocation(GetLocalLocation(oPC, SDB_BIND)));
}

void SDB_OnMonsterDeath(object oMonster, object oPC, int nPartyCnt, int nTreasure=FALSE) { // PUT IN LOOP THAT AWARDS XP TO PC'S
   string sMOID = SDB_GetMOID(oMonster);
   string sSQL;
   IncLocalInt(oPC, SDB_KILLS);
   IncLocalInt(oPC, SDB_KILLS_NEW);
   int nMonsterKills = IncLocalInt(GetModule(), SDB_KILLS_NEW+sMOID);
   if (!GetLocalInt(oMonster, SDB_MONSTER_INSERT)) { // HAVE WE RECORDED THIS KILL YET?
      SetLocalInt(oMonster, SDB_MONSTER_INSERT, 1);
      int nModulus = 5;
      if (GetLocalInt(oMonster, "BOSS")) nModulus = 1;
      if (nTreasure) {
         SRM_GenerateTreasure(oMonster, oPC);
      }
      if (nMonsterKills>=nModulus) {
         IncLocalInt(GetModule(), SDB_KILLS_NEW+sMOID, -nModulus);
         sSQL = "update monster set mo_killed=mo_killed+" + IntToString(nModulus) + " where mo_moid = " + sMOID;
         SQLExecDirect(sSQL);
      }
      if (SDB_TRACK_PVM_DETAILS) { // ARE WE TRACKING THE NITTY GRITTY PVM DETAILS?
         string sSEID = SDB_GetSEID();
         string sARID = SDB_GetARID(GetArea(oPC));
         string sPLID = SDB_GetPLID(oPC);
         string sPVID = SDB_GetPVID(oPC);
         string sLevel = IntToString(GetHitDice(oPC));
         sSQL = "insert into playervsmonster (pm_seid, pm_arid, pm_moid, pm_plid, pm_pvid, pm_level,pm_partycnt) " +
                   "values (" + DelimList(sSEID, sARID, sMOID, sPLID, sPVID, sLevel, IntToString(nPartyCnt)) + ")";
        SQLExecDirect(sSQL);
     }
  }
}

int SDB_CheckTempBan(object oPC) {
   string sCKIDList = "";
   string sACID = SDB_GetACID(oPC); // GET ACCOUNT TABLE ID
   string sSQL = "select ca_ckid from cdkeyaccount where ca_acid=" + sACID; // FIND CD KEYS THIS ACCOUNT HAS EVER USED
   SQLExecDirect(sSQL);
   while(SQLFetch() == SQL_SUCCESS) {
      sCKIDList = DelimList(SQLGetData(1), sCKIDList); // BUILD A COMMA DELIM LIST OF CDKEYS FOR THIS CHARACTER
   }
   sSQL = "select tb_expires from temporaryban where tb_ckid in (" + sCKIDList + ")";
   SQLExecDirect(sSQL);
   if (SQLFetch()==SQL_SUCCESS) {
      string sDateTime = SQLGetData(1);
      SetLocalString(oPC, SDB_BANNED, sDateTime);
      return TRUE;
   }
   return FALSE;
}

void SDB_ApplyBan(object oPC,  int nBanType = SDB_BANTYPE_TEMP, int nBanLength = 1) {
   string sCKID = SDB_GetCKID(oPC); // GET CDKEY TABLE ID
   string sACID = SDB_GetACID(oPC); // GET ACCOUNT TABLE ID
   string sPLID = SDB_GetPLID(oPC); // GET PLAYER TABLE ID
   string sCAID = SDB_GetCAID(oPC); // GET CDKEY-ACCOUNT LINK TABLE ID
   string sSQL;
   string sTime;
   switch (nBanType) {
      case SDB_BANTYPE_TEMP:
         sTime = HoursInDays(nBanLength);
         sSQL = "insert into temporaryban (tb_acid, tb_ckid, tb_expires) values (" + DelimList(sACID, sCKID, "DATE_ADD(NOW(), INTERVAL " + IntToString(nBanLength) + " HOUR))");
         SDB_BootPC(oPC, "You have been temporarily banned for " + sTime + ", during which time you can reflect upon your actions.", "Banned! Temp Ban applied to expire on" + sTime);
         break;
      case SDB_BANTYPE_CKID:
         sSQL = "update cdkey set ck_ban = 1 where ck_ckid=" + sCKID;
         SDB_BootPC(oPC, "Your CDKey has been permanently banned from the module. All future attempts to log in with this CDKey will be denied.", "Perma-Banned! CDkey Ban delivered.");
         break;
      case SDB_BANTYPE_ACID:
         sSQL = "update account set ac_ban = 1 where ac_acid=" + sACID;
         SDB_BootPC(oPC, "This Account has been permanently banned from the module. All future attempts to log in with this Account will be denied.", "Perma-Banned! Account Ban delivered.");
         break;
      case SDB_BANTYPE_PLID:
         sSQL = "update player set pl_ban = 1 where pl_plid=" + sPLID;
         SDB_BootPC(oPC, "This Character has been permanently banned from the module. All future attempts to log in with this Character will be denied.", "Perma-Banned! Character Ban delivered.");
         break;
      case SDB_BANTYPE_CAID:
         sSQL = "update cdkeyaccount set ca_ban = 1 where ca_caid=" + sCAID;
         SDB_BootPC(oPC, "This CDKey/Account combination has been permanently banned from the module. All future attempts to log into this account using this CDKey will be denied.", "Perma-Banned! CDkey/Account Ban delivered.");
         break;
   }
   SQLExecDirect(sSQL);
}

void SDB_UpdateAnimosity(object oPC, int nAnimosity) {
   SetLocalInt(oPC, SDB_ANIMOSITY, nAnimosity); // SAVE TO LOCAL
   string sSQL = "update account set ac_animosity=" + IntToString(nAnimosity) + " where ac_acid=" + SDB_GetACID(oPC);
   SQLExecDirect(sSQL);
}

void SDB_LogMsg(string sType, string sMsg, object oPC=OBJECT_INVALID) {
   string sLIID = "0";
   if (oPC!=OBJECT_INVALID) {
      sLIID = SDB_GetLIID(oPC);
      sMsg = "CK(" + SDB_GetCKID(oPC) + ") " + "AC(" + SDB_GetACID(oPC) + ") "+ "PL(" + SDB_GetPLID(oPC) + ") " + GetPCPlayerName(oPC) + "/" + GetName(oPC) + " : " + sMsg;
   }
   string sSQL = "insert into logmsg (lm_type, lm_msg, lm_liid) values (" + DelimList(InQs(sType), InQs(sMsg), sLIID) + ")";
   SQLExecDirect(sSQL);
   WriteTimestampedLogEntry("SDB LOGMSG: " + sType + ": " + sMsg);
}

void SDB_SetXP(object oPC, int nXP, string sSource) {
   string sMsg = sSource + ": Changing XP from " + IntToString(GetXP(oPC)) + " to " + IntToString(nXP);
   SDB_LogMsg("XPCHANGE", sMsg, oPC);
   SetXP(oPC, nXP);
}

void SDB_BankTransaction(object oPC, int nAmount, int nTranType=SDB_BANKTRANS_GOLD) {
   int nGold = -1;
   int nXP = -1;
   if (nTranType==SDB_BANKTRANS_GOLD) {
      nGold = nAmount;
      nXP = SDB_GetBankXP(oPC); // NOT PASSED, NO CHANGE, KEEP SAME
   } else {
      nXP = nAmount;
      nGold = SDB_GetBankGold(oPC); // NOT PASSED, NO CHANGE, KEEP SAME
   }
   string sLIID = SDB_GetLIID(oPC); // GET LOG ID
   string sACID = SDB_GetACID(oPC); // GET ACCOUNT TABLE ID
   string sGold = IntToString(nGold);
   string sXP   = IntToString(nXP);
   string sSQL = "insert into banktransactions(bt_bankxpold, bt_bankgoldold, bt_liid, bt_bankgoldnew, bt_bankxpnew) " +
      "select ac_bankxp, ac_bankgold, " + DelimList(sLIID, sGold, sXP) + " from account where ac_acid=" + sACID;
   SQLExecDirect(sSQL);
}

void SDB_CheckServer2(object oPC) {
   int nServer = GetLocalInt(GetModule(), "SERVER");
   if (nServer==2) {
      SQLExecDirect("select count(*) from player where pl_active=1");
      if (SQLFetch()==SQL_SUCCESS) {
         int nCnt = StringToInt(SQLGetData(1));
         if (nCnt < 30 ) {

         }
      }
   }
}

int SDB_CheckDatabase() {
   SQLExecDirect("select count(*) from session");
   if (SQLFetch()==SQL_SUCCESS) {
      int nCnt = StringToInt(SQLGetData(1));
      if (nCnt) return TRUE;
   }
   return FALSE;
}

string SDB_GetNextToken(object oDM, object oPC, string sMsg) {
   string sToken;
   string sSQL = "insert into tokentracker (tt_dmplid, tt_plid, tt_msg) values ("+ DelimList(InQs(SDB_GetPLID(oDM)), InQs(SDB_GetPLID(oPC)), InQs(sMsg)) + ")";
   SQLExecDirect(sSQL);
   sSQL = "select last_insert_id() from tokentracker limit 1";
   SQLExecDirect(sSQL);
   if (SQLFetch() != SQL_ERROR) {
      sToken = SQLGetData(1);
      WriteTimestampedLogEntry("Kewpie #" + sToken + " " + sMsg);
   } else {
      WriteTimestampedLogEntry("No database! Token not fetched.");
      return "Invalid";
   }
   return sToken;
}

//void main(){}


