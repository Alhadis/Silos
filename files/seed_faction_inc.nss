#include "nw_i0_plot"
#include "seed_db_inc"
#include "pg_lists_i"

const string SDB_FACTION_TOMETAG      = "flel_it_factome";
const string SDB_FACTION_TOMERESREF   = "factiontoken";
const string SDB_TOME_OPTIONS = "SDB_TOME_OPTIONS";
const string SDB_TOME_LIST    = "SDB_TOME_LIST";
const string SDB_TOME_TARGET  = "SDB_TOME_TARGET";
const string SDB_TOME_PAGE    = "SDB_TOME_PAGE";
const string SDB_TOME_SPEAKER = "SDB_TOME_SPEAKER";
const string SDB_TOME_CONFIRM = "SDB_TOME_CONFIRM";

const int SDB_FACTION_COMMANDER_CNT   = 4;

const string SDB_FAID              = "SDB_FAID";
const string SDB_FAID_LIST         = "SDB_FAID_LIST";
const string SDB_FMID              = "SDB_FMID";
const string SDB_FACTION_AURA      = "SDB_FACTION_AURA_";
const string SDB_FACTION_AURA2     = "SDB_FACTION_AURA2_";
const string SDB_FACTION_NAME      = "SDB_FACTION_NAME_";
const string SDB_FACTION_RANK      = "SDB_FACTION_RANK";
const string SDB_FACTION_ANIMOSITY = "SDB_FACTION_ANIMOSITY";
const string SDB_FACTION_WP        = "SDB_FACTION_WP_";
const string SDB_FACTION_DIPLO     = "SDB_FACTION_DIPLO_";
const string SDB_FACTION_ARTIFACT  = "SDB_FACTION_ARTIFACT";
const string SDB_FACTION_ARTICOUNT = "SDB_FACTION_ARTICOUNT";
const string SDB_FACTION_BOSSNAME  = "SDB_FACTION_BOSSNAME";
const string SDB_FACTION_BOSSSKIN  = "SDB_FACTION_BOSSSKIN";
const string SDB_FACTION_ARTINAME  = "SDB_FACTION_ARTINAME";
const string SDB_FACTION_TITHE     = "SDB_FACTION_TITHE";

const string SDB_FACTION_MEMBER    = "Member";
const string SDB_FACTION_COMMANDER = "Commander";
const string SDB_FACTION_GENERAL   = "General";

const string SDB_DIPLO_FRIEND      = "Friend";
const string SDB_DIPLO_NEUTRAL     = "Neutral";
const string SDB_DIPLO_ENEMY       = "Enemy";

string SDB_FactionAdd(object oPC, object oTomer); // oTomer IS AN OFFICER INVITING oPC
void   SDB_FactionApplyAura(object oPC);
int    SDB_FactionGetAura(string sFAID, string sRank); // GET THE FACTION AURA
int    SDB_FactionGetAnimosity(string sFAID);
string SDB_FactionGetCastleWP(string sFAID);
string SDB_FactionGetFirst();
string SDB_FactionGetName(string sFAID); // GET THE FACTION NAME
string SDB_FactionGetNext();
string SDB_FactionGetRank(object oPC);
int    SDB_FactionHasRank(object oPC, string sRank = SDB_FACTION_MEMBER);
int    SDB_FactionIsMember(object oPC, string sFAID = "0"); // TRUE/FALSE IF IN FACTION, OPTIONALLY CHECK FOR SPECIFIC FACTION
void   SDB_FactionLoadData(); // LOAD MASTER FACTION DATA ON MODULE
void   SDB_FactionLoadDiplomacy(object oPC);
string SDB_FactionNewGeneral(object oCommander, object oGeneral);
void   SDB_FactionOnClientEnter(object oPC);
void   SDB_FactionOnModuleLoad();
void   SDB_FactionOnPCDeath(object oPC, object oKiller);
void   SDB_FactionOnPCRespawn(object oPC);
void   SDB_FactionOnPCRest(object oPC);
void   SDB_FactionReloadData(object oPC);
string SDB_FactionRemove(object oPC, object oTomer=OBJECT_INVALID); // oTomer IS AN OFFICER REMOVING oPC, ELSE REMOVING SELF
void   SDB_FactionSetDiplomacy(string sFAID, string sVsFAID, string sDiplomacy);
string SDB_FactionSetRank(object oPC, string sRank = SDB_FACTION_MEMBER);
string SDB_GetFAID(object oPC);
string SDB_GetFMID(object oPC); // GET THE FACTION MEMBER ID
int    SDB_InList(string sList, string sValue, string sDelim = "|");
void   SDB_ProcessAnimosity(object oPC, object oMember = OBJECT_INVALID);
string SDB_FactionDMAdd(object oPC, string sFAID, string sRank);
string SDB_FactionDMRemove(object oPC);

string SDB_GetFMID(object oPC) { // GET THE FACTION MEMBER ID
   string sFMID = GetLocalString(oPC, SDB_FMID);
   if (sFMID=="") { // NO VARIABLE YET, CREATE IT
      sFMID = "0";
      string sFAID = "0";
      string sSQL;
      string sCKID = SDB_GetCKID(oPC); // GET CDKEY TABLE ID
      sSQL = "select fm_fmid, fm_faid, fm_rank from factionmember where fm_ckid = " + sCKID;
      SQLExecDirect(sSQL);
      if (SQLFetch()) { // IN A FACTION
         sFMID = SQLGetData(1);
         sFAID = SQLGetData(2);
         SetLocalString(oPC, SDB_FACTION_RANK, SQLGetData(3));
      }
      SetLocalString(oPC, SDB_FMID, sFMID);
      SetLocalString(oPC, SDB_FAID, sFAID);
   }
   return sFMID;
}

string SDB_GetFAID(object oPC) {
   SDB_GetFMID(oPC); // JUST TO BE SURE FACTION DATA LOADED
   return GetLocalString(oPC, SDB_FAID);
}

void SDB_FactionReloadData(object oPC) {
   DeleteLocalString(oPC, SDB_FMID);
   DeleteLocalString(oPC, SDB_FAID);
   SDB_GetFMID(oPC); // RELOAD FACTION DATA
}

int SDB_FactionIsMember(object oPC, string sFAID = "0") { // TRUE/FALSE IF IN FACTION, OPTIONALLY CHECK FOR SPECIFIC FACTION
   if (sFAID!="0") return (sFAID==SDB_GetFAID(oPC)); // CHECK SPECIFIC
   return (SDB_GetFMID(oPC)!="0"); // CHECK ANY
}

string SDB_FactionGetRank(object oPC) {
   SDB_GetFMID(oPC); // JUST TO BE SURE FACTION DATA LOADED
   return GetLocalString(oPC, SDB_FACTION_RANK);
}

int SDB_FactionHasRank(object oPC, string sRank = SDB_FACTION_MEMBER) {
   return (SDB_FactionGetRank(oPC)==sRank);
}

string SDB_FactionNewGeneral(object oCommander, object oGeneral) {
   string scFMID = SDB_GetFMID(oCommander);
   string sgFMID = SDB_GetFMID(oGeneral);
   string sSQL;
   if (SDB_FactionGetRank(oCommander)==SDB_FACTION_COMMANDER && SDB_FactionGetRank(oGeneral)==SDB_FACTION_GENERAL) {
      sSQL = "update factionmember set fm_rank=" + InQs(SDB_FACTION_COMMANDER) + " where fm_fmid=" + sgFMID;
      SQLExecDirect(sSQL);
      sSQL = "update factionmember set fm_rank=" + InQs(SDB_FACTION_GENERAL) + " where fm_fmid=" + scFMID;
      SQLExecDirect(sSQL);
      SDB_FactionReloadData(oCommander); // RELOAD FACTION DATA
      SDB_FactionReloadData(oGeneral); // RELOAD FACTION DATA
      return "Success! The torch has been passed. " + GetName(oCommander) + " is the new General of " + SDB_FactionGetName(SDB_GetFAID(oCommander));
   }
   return "Failure! The Faction General can only appoint an existing Commander to his position.";
}

string SDB_FactionSetRank(object oPC, string sRank = SDB_FACTION_MEMBER) {
   string sFMID = SDB_GetFMID(oPC);
   string sFAID = SDB_GetFAID(oPC);
   string sOldRank = SDB_FactionGetRank(oPC);
   string sSQL;
   string sMsg = "";
   int nCnt = 0;
   if (sRank==SDB_FACTION_MEMBER && sOldRank==SDB_FACTION_COMMANDER) { // DEMOTING COMMANDER TO MEMBER
      SendMessageToPC(oPC, "You have been demoted from Faction Commander to Member.");
      sMsg = GetName(oPC) + " has been demoted from Faction Commander to Member.";
   } else if (sRank==SDB_FACTION_COMMANDER && sOldRank==SDB_FACTION_MEMBER) { // PROMOTING MEMBER TO COMMANDER, COUNT EXISTING FIRST
      sSQL = "select count(*) from factionmember where fm_faid=" + sFAID + " and fm_rank=" + InQs(SDB_FACTION_COMMANDER);
      SQLExecDirect(sSQL);
      if (SQLFetch()) nCnt = StringToInt(SQLGetData(1));
      if (nCnt==SDB_FACTION_COMMANDER_CNT) {
         return "Failure! " + SDB_FactionGetName(sFAID) + " already has the maximum of " + IntToString(SDB_FACTION_COMMANDER_CNT) + " Commanders";
      } else {
         SendMessageToPC(oPC, "Congratulations! You have been promoted to Faction Commander.");
         sMsg =  "Success! " + GetName(oPC) + " has been promoted to Faction Commander.";
      }
   }
   sSQL = "update factionmember set fm_rank=" + InQs(sRank) + " where fm_fmid=" + sFMID;
   SQLExecDirect(sSQL);
   SDB_FactionReloadData(oPC); // RELOAD FACTION DATA
   return sMsg;
}

string SDB_FactionGetName(string sFAID) { // GET THE FACTION NAME
   return GetLocalString(GetModule(), SDB_FACTION_NAME + sFAID);
}

string SDB_FactionGetCastleWP(string sFAID) { // GET THE FACTION CASTLE PORT WP
   return GetLocalString(GetModule(), SDB_FACTION_WP + sFAID);
}

int SDB_FactionGetAnimosityBit(string sFAID) { // GET THE FACTION ANI BIT
   return GetLocalInt(GetModule(), SDB_FAID + "_ANIBIT_" + sFAID);
}

int SDB_FactionGetAura(string sFAID, string sRank) { // GET THE FACTION AURA
   if (sRank==SDB_FACTION_GENERAL) return GetLocalInt(GetModule(), SDB_FACTION_AURA2 + sFAID);
   return GetLocalInt(GetModule(), SDB_FACTION_AURA + sFAID);
}

void SDB_FactionApplyAura(object oPC) {
   if (!SDB_FactionIsMember(oPC) || GetIsDM(oPC)) return;
   int nAura = SDB_FactionGetAura(SDB_GetFAID(oPC), SDB_FactionGetRank(oPC));
   ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectVisualEffect(nAura), oPC);
}

void SDB_FactionSetArtifact(string sFAID, string sArtiFAID) { // SET THE FACTION ARTIFACT OWNER
   SetLocalString(GetModule(), SDB_FACTION_ARTIFACT + sFAID, sArtiFAID);
   string sSQL = "update faction set fa_artifact=" + sArtiFAID + " where fa_faid=" + sFAID;
   SQLExecDirect(sSQL);
}

string SDB_FactionGetArtifact(string sFAID) { // GET THE FACTION ARTIFACT POSSESSING FACTION
   return GetLocalString(GetModule(), SDB_FACTION_ARTIFACT + sFAID);
}

string SDB_FactionGetArtifactName(string sFAID) { // GET THE FACTION ARTIFACT NAME
   return GetLocalString(GetModule(), SDB_FACTION_ARTINAME + sFAID);
}

int SDB_FactionGetArtifactCount(string sFAID) { // GET THE FACTION ARTIFACT COUNT
   return GetLocalInt(GetModule(), SDB_FACTION_ARTICOUNT + sFAID);
}

string SDB_FactionGetBossName(string sFAID) { // GET THE FACTION BOSS NAME
   return GetLocalString(GetModule(), SDB_FACTION_BOSSNAME + sFAID);
}

int SDB_FactionGetBossSkin(string sFAID) { // GET THE FACTION BOSS NAME
   return GetLocalInt(GetModule(), SDB_FACTION_BOSSSKIN + sFAID);
}

int SDB_FactionGetTithe(string sFAID) { // GET THE FACTION BOSS NAME
   return GetLocalInt(GetModule(), SDB_FACTION_TITHE + sFAID);
}

void SDB_FactionLoadData() { // LOAD MASTER FACTION DATA ON MODULE
   object oModule = GetModule();
   DeleteList(SDB_FAID_LIST, oModule);
   string sFAList = "";
   string sSQL;
   int nAnimosityBit = 8; // START IN 4TH BIT (FIRST 3 BITS FACTIONLESS ALIGNMENT TYPES)
   sSQL = "update faction set fa_artifact=fa_faid where fa_artifact=0";  // REBOOTED WITH NO OWNERS
   SQLExecDirect(sSQL);
   sSQL = "select fa_faid, fa_name, fa_aura, fa_aura2, fa_castlewp, fa_artifact, fa_bossname, fa_bossskin, fa_artifactname, fa_tithepct from faction order by fa_faid";
   SQLExecDirect(sSQL);
   while(SQLFetch() == SQL_SUCCESS) {
      string sFAID = SQLGetData(1);
      SetLocalString(oModule, SDB_FAID + "_" + sFAID, sFAID);
      SetLocalString(oModule, SDB_FACTION_NAME + sFAID, SQLGetData(2));
      SetLocalInt(oModule, SDB_FACTION_AURA + sFAID, StringToInt(SQLGetData(3)));
      SetLocalInt(oModule, SDB_FACTION_AURA2 + sFAID, StringToInt(SQLGetData(4)));
      SetLocalString(oModule, SDB_FACTION_WP + sFAID, SQLGetData(5));
      SetLocalString(oModule, SDB_FACTION_ARTIFACT + sFAID, SQLGetData(6));
      SetLocalString(oModule, SDB_FACTION_BOSSNAME + sFAID, SQLGetData(7));
      SetLocalInt(oModule, SDB_FACTION_BOSSSKIN + sFAID, StringToInt(SQLGetData(8)));
      SetLocalString(oModule, SDB_FACTION_ARTINAME + sFAID, SQLGetData(9));
      SetLocalInt(oModule, SDB_FACTION_TITHE + sFAID, StringToInt(SQLGetData(10)));
      SetLocalInt(oModule, SDB_FAID + "_ANIBIT_" + sFAID, nAnimosityBit);
      int nEle = AddStringElement(sFAID, SDB_FAID_LIST, oModule);
      nAnimosityBit *= 2;
   }
}

string SDB_FactionAdd(object oPC, object oTomer) { // oTomer IS AN OFFICER INVITING oPC
   string sFMID = SDB_GetFMID(oPC);
   string sFAID = SDB_GetFAID(oTomer); // NEW FACTION
   string sFactionName = SDB_FactionGetName(sFAID);
   if (sFMID!="0") { // SHOULD NOT HAPPEN, BUT IN CASE
      string sFAIDOld = SDB_GetFAID(oPC);
      string sFactionRankOld = SDB_FactionGetRank(oPC);
      SendMessageToPC(oTomer, "Sorry, " + GetName(oPC) + " is already a " + sFactionRankOld + " in " + SDB_FactionGetName(sFAIDOld));
      return "Sorry, you are already a " + sFactionRankOld + " in " + SDB_FactionGetName(sFAIDOld);
   }
   string sCKID = SDB_GetCKID(oPC);
   string sSQL = "insert into factionmember (fm_faid, fm_ckid) values (" + sFAID + "," + sCKID + ")";
   SQLExecDirect(sSQL);
   SDB_FactionReloadData(oPC); // RELOAD FACTION DATA
   SendMessageToPC(oTomer, "Success! " + GetName(oPC) + " is the newest member of " + sFactionName);
   if (!HasItem(oPC, SDB_FACTION_TOMETAG)) CreateItemOnObject(SDB_FACTION_TOMERESREF, oPC); // GIVE TOME
   return "Success! You are the newest member of " + sFactionName;
}

string SDB_FactionRemove(object oPC, object oTomer=OBJECT_INVALID) { // oTomer IS AN OFFICER REMOVING oPC, ELSE REMOVING SELF
   string sFMID = SDB_GetFMID(oPC);
   string sFAID = SDB_GetFAID(oPC);
   string sFactionRank = SDB_FactionGetRank(oPC);
   string sFactionName = SDB_FactionGetName(sFAID);
   if (sFactionRank==SDB_FACTION_GENERAL) { // GENERAL REMOVING SELF!
      return "Failure! Please promote a new General before quitting " + sFactionName;
   }
   string sSQL = "delete from factionmember where fm_fmid=" + sFMID;
   SQLExecDirect(sSQL);
   DeleteLocalString(oPC, SDB_FMID);
   DeleteLocalString(oPC, SDB_FAID);
   DeleteLocalString(oPC, SDB_FACTION_RANK);
   RemoveEffect(oPC, EffectVisualEffect(SDB_FactionGetAura(sFAID, sFactionRank)));
   DestroyObject(GetItemPossessedBy(oPC, SDB_FACTION_TOMETAG)); // REMOVE TOME
   if (GetIsObjectValid(oTomer)) { // FORCED REMOVAL BY OFFICER
      SendMessageToPC(oPC, "You have been removed as a member of " + sFactionName + " by " + GetName(oTomer));
      return "Success! " + GetName(oPC) + " is no longer a member of " + sFactionName;
   }
   return "Success! You are no longer a member of " + sFactionName;
}

void SDB_FactionOnPCDeath(object oPC, object oKiller) {
   if (!GetIsPC(oPC) || !GetIsPC(oKiller)) return;
   string sSQL;
   string skFAID = SDB_GetFAID(oKiller);
   string sFAID = SDB_GetFAID(oPC);
   string sFARankSQL;
   string sFARank = SDB_FactionGetRank(oPC); // RANK OF THE DEAD GUY
   if (skFAID!="0") { // A FACTION KILL
      sFARankSQL = (sFARank==SDB_FACTION_GENERAL) ? "fa_killsgen=fa_killsgen+1, " : (sFARank==SDB_FACTION_COMMANDER) ? "fa_killscom=fa_killscom+1, " : "";
      sSQL = "update faction set " + sFARankSQL + "fa_kills=fa_kills+1 where fa_faid=" + skFAID;
      SQLExecDirect(sSQL);
   }
   if (sFAID!="0") { // A FACTION DEATH
      sFARankSQL = (sFARank==SDB_FACTION_GENERAL) ? "fa_deathsgen=fa_deathsgen+1, " : (sFARank==SDB_FACTION_COMMANDER) ? "fa_deathscom=fa_deathscom+1, " : "";
      sSQL = "update faction set " + sFARankSQL + "fa_deaths=fa_deaths+1 where fa_faid=" + sFAID;
      SQLExecDirect(sSQL);
   }
   if (sFAID!="0" && skFAID!="0") { // A FACTION VS FACTION ACTION
      sFARankSQL = (sFARank==SDB_FACTION_GENERAL) ? "ff_deathsgen=ff_deathsgen+1, " : (sFARank==SDB_FACTION_COMMANDER) ? "ff_deathscom=ff_deathscom+1, " : "";
      sSQL = "update factionvsfaction set ff_dldeath=now(), " + sFARankSQL + "ff_deaths=ff_deaths+1 where ff_faid=" + sFAID + " and ff_faidvs=" + skFAID;
      SQLExecDirect(sSQL);
      sFARankSQL = (sFARank==SDB_FACTION_GENERAL) ? "ff_killsgen=ff_killsgen+1, " : (sFARank==SDB_FACTION_COMMANDER) ? "ff_killscom=ff_killscom+1, " : "";
      sSQL = "update factionvsfaction set ff_dlkill=now(), " + sFARankSQL + "ff_kills=ff_kills+1 where ff_faid=" + skFAID + " and ff_faidvs=" + sFAID;
      SQLExecDirect(sSQL);
   }
}

// sDiplo = 'Neutral','Friendly','Enemy'
void SDB_FactionSetDiplomacy(string sFAID, string sVsFAID, string sDiplomacy) {
   string sSQL;
   sSQL = "update factionvsfaction set ff_diplomacy=" + InQs(sDiplomacy) + " where ff_faid=" + sFAID + " and ff_faidvs=" + sVsFAID;
   SQLExecDirect(sSQL);
}

int SDB_InList(string sList, string sValue, string sDelim = "|") {
   return (FindSubString(sList, sDelim + sValue + sDelim)!=-1);
}

void SDB_FactionLoadDiplomacy(object oPC) {
   string sFAID = SDB_GetFAID(oPC);
   string sFAIDVs;
   string sSQL;
   string sEnemyList = "|";
   string sFriendList = "|";
   string sNeutralList = "|";
   sSQL = "select ff_diplomacy+0, ff_faidvs from factionvsfaction where ff_faid = " + sFAID;
   SQLExecDirect(sSQL);
   while(SQLFetch()) { // LOOPS OVER FAID'S AND CREATE A LIST
      int nDiplo = StringToInt(SQLGetData(1));
      sFAIDVs = SQLGetData(2);
      switch (nDiplo) {
         case REPUTATION_TYPE_NEUTRAL:
            sNeutralList = sNeutralList + sFAIDVs + "|";
            break;
         case REPUTATION_TYPE_FRIEND:
            sFriendList = sFriendList + sFAIDVs + "|";
            break;
         case REPUTATION_TYPE_ENEMY:
            sEnemyList = sEnemyList + sFAIDVs + "|";
            break;
      }
   }
   object oMember = GetFirstPC();
   while (GetIsObjectValid(oMember)) { // LOOP OVER ALL PC'S AND CHECK WHICH LIST THEIR FACTION IS IN
      string sFAIDMember = SDB_GetFAID(oMember);
      if (!GetIsDM(oMember) && sFAIDMember!="0") { // SKIP DM'S & UNFACTIONED
         if (SDB_InList(sNeutralList, sFAIDMember)) {
            //AssignCommand(oPC,SetIsTemporaryNeutral(oMember));
         } else if (SDB_InList(sFriendList, sFAIDMember)) {
            //AssignCommand(oPC,SetIsTemporaryFriend(oMember));
            //SetPCLike(oPC,oMember); // THIS CHANGES ENEMYS TO LIKE IF THEY WERE ON DISLIKE, NOT A DESIRED BEHAVIOR
         } else if (SDB_InList(sEnemyList, sFAIDMember)) {
            AssignCommand(oPC,SetIsTemporaryEnemy(oMember));
            SetPCDislike(oPC,oMember);
         }
      }
      oMember = GetNextPC();
   }
}

string SDB_JoinFactionParty(object oPC) {
   string sRank;
   string sFAID = SDB_GetFAID(oPC);
   object oObjectSelected = OBJECT_INVALID;
   object oMember = GetFirstPC();
   while (GetIsObjectValid(oMember)) {
      string stFAID = SDB_GetFAID(oMember);
      if (oPC!=oMember && !GetIsDM(oMember) && sFAID==stFAID) {
         sRank = SDB_FactionGetRank(oMember);
         if (oObjectSelected==OBJECT_INVALID) { // TAKE FIRST FACTION MEMBER FOUND
            oObjectSelected = oMember;
         } else if (sRank==SDB_FACTION_GENERAL) { // FOUND THE GENERAL, PICK HIM
            oObjectSelected = oMember; // SAVE & EXIT LOOP
            break;
         } else if (sRank==SDB_FACTION_COMMANDER) { // FOUND A COMMANDER
            if (SDB_FactionGetRank(oObjectSelected)==SDB_FACTION_MEMBER) oObjectSelected = oMember; // TAKE COMMANDER OVER A MEMBER
         }
      }
      oMember = GetNextPC();
   }
   if (oObjectSelected==OBJECT_INVALID) {
      return "Sorry, no " + SDB_FactionGetName(sFAID) + " members are logged in right now.";
   } else {
      AddToParty(oPC, oObjectSelected);
      sRank = SDB_FactionGetRank(oObjectSelected);
      if (sRank==SDB_FACTION_GENERAL)        return "You have joined your General's party.";
      else if (sRank==SDB_FACTION_COMMANDER) return "You have joined your Commander's party.";
      else                                   return "You have joined your Faction's party.";
   }
}

void SDB_FactionOnClientEnter(object oPC) {
   SDB_GetFMID(oPC); // LOAD FACTION DATA
   if (SDB_FactionIsMember(oPC)) {
      // SDB_FactionLoadDiplomacy(oPC); SKIP THIS HERE, WE DO IT IN PROCESSANIMOSITY NOW
      SendMessageToPC(oPC, SDB_JoinFactionParty(oPC));
      SDB_FactionApplyAura(oPC);
      if (!HasItem(oPC, SDB_FACTION_TOMETAG)) CreateItemOnObject(SDB_FACTION_TOMERESREF, oPC); // GIVE IF NOT THERE

   }
   DelayCommand(5.0,SDB_ProcessAnimosity(oPC));
}

void SDB_FactionOnModuleLoad() {
   SDB_FactionLoadData();
}

void SDB_FactionOnPCRest(object oPC) {
   SDB_FactionApplyAura(oPC);
}

void SDB_FactionOnPCRespawn(object oPC) {
   SDB_FactionApplyAura(oPC);
}

int SDB_FactionGetAnimosity(string sFAID) {
    string sAnimosity = GetLocalString(GetModule(), SDB_FACTION_ANIMOSITY);
    int nAnimosity = StringToInt(sAnimosity);
    if (sAnimosity=="") {
      string sSQL = "select ff_diplomacy+0, ff_faidvs from factionvsfaction where ff_faid = " + sFAID + " order by ff_faid";
      SQLExecDirect(sSQL);
      while(SQLFetch()) { // LOOPS OVER FAID'S AND SET THE BITS
         if (StringToInt(SQLGetData(1))==REPUTATION_TYPE_ENEMY) nAnimosity = nAnimosity | SDB_FactionGetAnimosityBit(sFAID);
      }
      SetLocalString(GetModule(), SDB_FACTION_ANIMOSITY, IntToString(nAnimosity));
    }
    return nAnimosity;
}

void SDB_ProcessAnimosity(object oPC, object oMember = OBJECT_INVALID) { // PASS A SINGLE PERSON IN oMember TO PROCESS JUST THEM - CALLED RECURSIVELY IN PC LOOP TO HANDLE DISLIKING NEW LOGINS
   if (GetIsDM(oMember)) return; // GET OUT!
   string sFAID = SDB_GetFAID(oPC);
   string stFAID;
   int nToggleBit;
   object oTarget;
   int nAnimosity = GetLocalInt(oPC, SDB_ANIMOSITY);
   if (sFAID!="0") { // FACTION, USE FVF SETTINGS FOR ANIMOSITY
      nAnimosity = nAnimosity & 7; // TURN OFF EVERYTHING OVER POSITION 3 (FACTION BITS)
      nAnimosity = nAnimosity | SDB_FactionGetAnimosity(sFAID); // MERGE PERSONAL & FACTION BITS
   }
   if (oMember!=OBJECT_INVALID) {
      oTarget = oMember;
   } else {
      oTarget = GetFirstPC();
   }
   while (GetIsObjectValid(oTarget)) { // LOOP OVER ALL PC'S
      if (!GetIsDM(oTarget) && oTarget!=oPC) { // DON'T DO DM'S & DON'T DO SELF
         string stFAID = SDB_GetFAID(oTarget);
         if (stFAID!="0") { // FACTIONED
            nToggleBit = SDB_FactionGetAnimosityBit(stFAID); // GET THIS FACTION'S BIT
         } else { // NON-FACTIONED, CHECK ALIGNMENT
            nToggleBit = GetAlignbits(GetAlignmentGoodEvil(oTarget)); // GET THIS ALIGNMENT'S BIT
         }
         if (nAnimosity & nToggleBit) {
            SetPCDislike(oPC,oTarget); // IF IT'S ON I HATE THEM, AND WE DONE WITH THIS GUY
         } else if (oMember==OBJECT_INVALID) {
            SDB_ProcessAnimosity(oTarget, oPC); // I LIKE YOU, NOW YOU DO ME, BUT JUST ME
         }
      }
      if (oMember!=OBJECT_INVALID) return; // JUST DOING ME, NO LOOP HERE, GTF OUTTA DODGE
      oTarget = GetNextPC();
   }
}

string SDB_FactionGetFirst() {
   return GetFirstStringElement(SDB_FAID_LIST, GetModule());
}
string SDB_FactionGetNext() {
   return GetNextStringElement();
}

string SDB_FactionDMAdd(object oPC, string sFAID, string sRank) {
   string sFactionName = SDB_FactionGetName(sFAID);
   string sSQL;
   if (sRank==SDB_FACTION_GENERAL) { // DEMOTE OLD GENERAL
      sSQL = "update factionmember set fm_rank=" + InQs(SDB_FACTION_MEMBER) + " where fm_rank=" + InQs(SDB_FACTION_GENERAL) + " and fm_faid=" + sFAID;
      SQLExecDirect(sSQL);
   }
   string sCKID = SDB_GetCKID(oPC);
   sSQL = "insert into factionmember (fm_faid, fm_ckid, fm_rank) values (" + DelimList(sFAID, sCKID, InQs(sRank)) + ")";
   SQLExecDirect(sSQL);
   SDB_FactionReloadData(oPC); // RELOAD FACTION DATA
   SendMessageToPC(oPC, "Success! You are the newest " + sRank + " of " + sFactionName );
   if (!HasItem(oPC, SDB_FACTION_TOMETAG)) CreateItemOnObject(SDB_FACTION_TOMERESREF, oPC); // GIVE TOME
   return "Success! " + GetName(oPC) + " is a " + sRank + " of " + sFactionName;
}

string SDB_FactionDMRemove(object oPC) {
   string sFMID = SDB_GetFMID(oPC);
   string sFAID = SDB_GetFAID(oPC);
   string sFactionRank = SDB_FactionGetRank(oPC);
   string sFactionName = SDB_FactionGetName(sFAID);
   string sSQL = "delete from factionmember where fm_fmid=" + sFMID;
   SQLExecDirect(sSQL);
   DeleteLocalString(oPC, SDB_FMID);
   DeleteLocalString(oPC, SDB_FAID);
   DeleteLocalString(oPC, SDB_FACTION_RANK);
   RemoveEffect(oPC, EffectVisualEffect(SDB_FactionGetAura(sFAID, sFactionRank)));
   DestroyObject(GetItemPossessedBy(oPC, SDB_FACTION_TOMETAG)); // REMOVE TOME
   SendMessageToPC(oPC, "You have been removed as a " + sFactionRank + " of " + sFactionName + " by a DM");
   return "Success! " + GetName(oPC) + " is no longer a " + sFactionRank + " of " + sFactionName;
}


//void main() {}


