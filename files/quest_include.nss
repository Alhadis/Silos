#include "_CSLCore_Nwnx"
#include "seed_db_inc"
#include "_CSLCore_Nwnx"

string GetQuestID(object oNPC) {
   return GetLocalString(oNPC, "QU_QUID");
}

string GetQuestName(object oNPC) {
   return GetLocalString(oNPC, "QU_NAME");
}

string GetQuestDesc(object oNPC) {
   return GetLocalString(oNPC, "QU_DESC");
}

string GetQuestRequiredItems(object oNPC) {
   return GetLocalString(oNPC, "QU_REQUIRED");
}

int GetQuestAwardGold(object oNPC) {
   return GetLocalInt(oNPC, "QU_AWARDGOLD");
}

int GetQuestAwardXP(object oNPC) {
   return GetLocalInt(oNPC, "QU_AWARDXP");
}

string GetQuestAwardItem(object oNPC) {
   return GetLocalString(oNPC, "QU_AWARDITEM");
}

string GetQuestItemsPCHas(object oNPC) {
   return GetLocalString(oNPC, "QU_HAS");
}

int NPCHasQuest(object oNPC) {
   string sHasQuest = GetQuestID(oNPC);
   if (sHasQuest=="-1") return FALSE; // DATA LOADED, NO QUEST FOUND
   if (sHasQuest!="") return TRUE; // DATA LOADED, QUEST FOUND
   // DATA NOT YET CHECKED, LOAD IT NOW
   CSLNWNX_SQLExecDirect("select qu_quid, qu_name, qu_description, qu_required, qu_awardxp, qu_awardgold, qu_awarditem from quest where qu_npctag=" + CSLInQs(GetTag(oNPC)));
   if (CSLNWNX_SQLFetch()) {
      SetLocalString(oNPC, "QU_QUID", CSLNWNX_SQLGetData(1));
      SetLocalString(oNPC, "QU_NAME", CSLNWNX_SQLGetData(2));
      SetLocalString(oNPC, "QU_DESC", CSLNWNX_SQLGetData(3));
      SetLocalString(oNPC, "QU_REQUIRED", CSLNWNX_SQLGetData(4));
      SetLocalInt(oNPC, "QU_AWARDXP", CSLNWNX_SQLGetDataInt(5));
      SetLocalInt(oNPC, "QU_AWARDGOLD", CSLNWNX_SQLGetDataInt(6));
      SetLocalString(oNPC, "QU_AWARDITEM", CSLNWNX_SQLGetData(7));
      return TRUE;
   }
   SetLocalString(oNPC, "QU_QUID", "-1"); // FLAG AS NO QUEST
   return FALSE;
}

int PCAlreadyDidQuest(object oPC, string sQUID) {
   int nDidQuest = GetLocalInt(oPC, "QU_QUID" + sQUID);
   if (nDidQuest==1) return TRUE; // USER DID THIS ONE ALREADY
   if (nDidQuest==-1) return FALSE; // WE ALREADY CHECKED DB, THE USER DID NOT DO THE QUEST
   if (nDidQuest==0) { // DB NOT YET CHECKED, DO IT NOW
      CSLNWNX_SQLExecDirect("select qc_quid from questcomplete where qc_plid=" + SDB_GetPLID(oPC) + " and qc_quid=" + sQUID);
      if (CSLNWNX_SQLFetch()) nDidQuest = 1; // FOUND A RECORD THE QUEST WAS DONE
      else nDidQuest = -1; // NOT DONE
   }
   SetLocalInt(oPC, "QU_QUID" + sQUID, nDidQuest);
   return (nDidQuest==1);
}

void GiveQuestReward(object oPC, object oNPC) {
   string sList = GetQuestRequiredItems(oNPC);
   string sQUID = GetQuestID(oNPC);
   string sTag;
   string sHas;
   string sReward;
   object oItem;
   int nCnt = CSLNth_GetCount(sList);
   int nHas = 0;
   int i;
   for (i=1;i<=nCnt;i++) {
      sTag = CSLNth_GetNthElement(sList, i);
      oItem = GetItemPossessedBy(oPC, sTag);
      if (oItem!=OBJECT_INVALID) {
         nHas++;
         DestroyObject(oItem);
      }
   }
   if (nHas==nCnt) { // PC STILL HAS ALL ITEMS
      string sResRef = GetQuestAwardItem(oNPC);
      int nGold = GetQuestAwardGold(oNPC);
      int nXP = GetQuestAwardXP(oNPC);
      if (sResRef!="") {
         oItem = CreateItemOnObject(sResRef, oPC, 1);
         sReward = GetName(oItem);
      }
      if (nGold>0) {
         GiveGoldToCreature(oPC, nGold);
         PlaySound("it_coins");
         sReward = CSLAddAnd(sReward) + IntToString(nGold) + " gold pieces";
      }
      if (nXP>0) {
        int nCurrXP = GetXP(oPC);
         GiveXPToCreature (oPC, nXP);
         nXP = GetXP(oPC) - nCurrXP;
         sReward = CSLAddAnd(sReward) + IntToString(nXP) + " XP";
      }
      SendMessageToPC(oPC, GetName(oNPC) + " gives you " + sReward);
      //SDB_LogMsg("QUEST", "Completed", oPC);
      SetLocalInt(oPC, "QU_QUID" + sQUID, 1); // MARK QUEST DONE
      CSLNWNX_SQLExecDirect("insert into questcomplete (qc_quid, qc_plid) values (" + sQUID + "," + SDB_GetPLID(oPC) + ")");
      SDB_UpdatePlayerStatus(oPC); // SAVE PC STATUS
   } else {
      SpeakString("Sorry, you no longer meet the quest requirements.");
      SDB_LogMsg("QUEST", "MISSING ITEM IN REWARD", oPC);
   }
}

int PCHasQuestItems(object oPC, object oNPC) { // RETURNS 0=NO, 1=COMPLETE, 2=SOME
   string sList = GetQuestRequiredItems(oNPC);
   string sTag;
   string sHas;
   object oItem;
   int nCnt = CSLNth_GetCount(sList);
   int nHas = 0;
   int i;
   for (i=1;i<=nCnt;i++) {
      sTag = CSLNth_GetNthElement(sList, i);
      oItem = GetItemPossessedBy(oPC, sTag);
      if (oItem!=OBJECT_INVALID) {
         nHas++;
         sHas = CSLAddAnd(sHas) + GetName(oItem);
      }
   }
   SetLocalString(oNPC, "QU_HAS", sHas);
   if (nHas==0) return 0;
   if (nCnt==nHas) return 1;
   return 2;
}