#include "zdlg_include_i"
#include "seed_faction_inc"
#include "gen_inc_color"

// PERSIST VARIABLE STRINGS
const string ANI_TOKEN_LIST     = "ANI_TOKEN_LIST";
const string ANI_TOKEN_PAGE     = "ANI_TOKEN_PAGE";
const string ANI_ANIMOSITY      = "ANI_ANIMOSITY";
const string ANI_TOGGLE_BIT     = "ANI_TOGGLE_BIT";
//
const int ANI_TOKEN_NONE    = 0; // 000
const int ANI_TOKEN_NEUTRAL = 1; // 001
const int ANI_TOKEN_GOOD    = 2; // 010
const int ANI_TOKEN_EVIL    = 4; // 100
const int ANI_TOKEN_ALL     = 7; // 111
const int ANI_TOKEN_SET     = 1;
const int ANI_TOKEN_CLEAR   = 0;

// PAGES
const int PAGE_MAIN_MENU          = 0;  // View the list of options
const int PAGE_CONFIRM_ACTION     = 1;  // Page to Confirm Current Action (ok, cancel)
const int PAGE_SHOW_MESSAGE       = 2;  // Page to Show Result of Current Action (ok)

// ACTIONS
const int ACTION_CONFIRM          = 20; // CONFIRM CURRENT ACTION
const int ACTION_CANCEL           = 21; // CANCEL CURRENT ACTION
const int ACTION_END_CONVO        = 22; // END CONVERSATION
const int ACTION_PROCESS_CHANGES  = 23; //
const int ACTION_TOGGLE_SETTING   = 24; //

void   AddMenuSelectionInt(string sSelectionText, int nSelectionValue, int nSubValue = 0, string sList = ANI_TOKEN_LIST);
void   AddMenuSelectionObject(string sSelectionText, int nSelectionValue, object oSubValue, string sList = ANI_TOKEN_LIST);
void   AddMenuSelectionString(string sSelectionText, int nSelectionValue, string sSubValue, string sList = ANI_TOKEN_LIST);
void   BuildPage(int nPage);
void   CleanUp();
void   DoConfirmAction();
void   DoShowMessage();
int    GetConfirmedAction();
int    GetNextPage();
int    GetPageOptionSelected(string sList = ANI_TOKEN_LIST);
int    GetPageOptionSelectedInt(string sList = ANI_TOKEN_LIST);
object GetPageOptionSelectedObject(string sList = ANI_TOKEN_LIST);
string GetPageOptionSelectedString(string sList = ANI_TOKEN_LIST);
string GetTargetDiplomacy();
void   HandleSelection();
void   Init();
void   main();
string SendMsg(object oPC, string sMsg);
void   SetConfirmAction(string sPrompt, int nActionConfirm, int nActionCancel=PAGE_MAIN_MENU, string sConfirm="Yes", string sCancel="No");
void   SetNextPage(int nPage);
void   SetShowMessage(string sPrompt, int nOkAction = ACTION_END_CONVO);
void   SetTargetDiplomacy(string sDiplo);


object LIST_OWNER = GetPcDlgSpeaker(); // THE SPEAKER OWNS THE LIST

string GetAniColor(string sText, int nPlayer, int nSelection) {
   if (nPlayer & nSelection) return  RedText(sText); //"<cÎ>" + sText + "<cþþþ>";
   return GreenText(sText); //"<c‰ô>" + sText + "<cþþþ>";
}

int GetToggleBit() {
   return GetLocalInt(LIST_OWNER, ANI_TOGGLE_BIT);
}

void SetToggleBit(int nBit) {
   SetLocalInt(LIST_OWNER, ANI_TOGGLE_BIT, nBit);
}

void AddMenuSelectionInt(string sSelectionText, int nSelectionValue, int nSubValue = 0, string sList = ANI_TOKEN_LIST) {
   ReplaceIntElement(AddStringElement(sSelectionText, sList, LIST_OWNER)-1, nSelectionValue, sList, LIST_OWNER);
   AddIntElement(nSubValue, ANI_TOKEN_LIST + "_SUB", LIST_OWNER);
}
void AddMenuSelectionString(string sSelectionText, int nSelectionValue, string sSubValue, string sList = ANI_TOKEN_LIST) {
   ReplaceIntElement(AddStringElement(sSelectionText, sList, LIST_OWNER)-1, nSelectionValue, sList, LIST_OWNER);
   AddStringElement(sSubValue, ANI_TOKEN_LIST + "_SUB", LIST_OWNER);
}
void AddMenuSelectionObject(string sSelectionText, int nSelectionValue, object oSubValue, string sList = ANI_TOKEN_LIST) {
   ReplaceIntElement(AddStringElement(sSelectionText, sList, LIST_OWNER)-1, nSelectionValue, sList, LIST_OWNER);
   AddObjectElement(oSubValue, ANI_TOKEN_LIST + "_SUB", LIST_OWNER);
}

int GetPageOptionSelected(string sList = ANI_TOKEN_LIST) {
   return GetIntElement(GetDlgSelection(), sList, LIST_OWNER);
}

int GetPageOptionSelectedInt(string sList = ANI_TOKEN_LIST) {
   return GetIntElement(GetDlgSelection(), sList + "_SUB", LIST_OWNER);
}

string GetPageOptionSelectedString(string sList = ANI_TOKEN_LIST) {
   return GetStringElement(GetDlgSelection(), sList + "_SUB", LIST_OWNER);
}

object GetPageOptionSelectedObject(string sList = ANI_TOKEN_LIST) {
   return GetObjectElement(GetDlgSelection(), sList + "_SUB", LIST_OWNER);
}

int GetNextPage() {
   return GetLocalInt(LIST_OWNER, ANI_TOKEN_PAGE);
}

void SetNextPage(int nPage) {
   SetLocalInt(LIST_OWNER, ANI_TOKEN_PAGE, nPage);
}

int GetAnimosity() {
   return GetLocalInt(LIST_OWNER, ANI_ANIMOSITY);
}

void SetAnimosity(int nAni) {
   SetLocalInt(LIST_OWNER, ANI_ANIMOSITY, nAni);
}

void SetTargetDiplomacy(string sDiplo) {
   SetLocalString(LIST_OWNER, ANI_TOKEN_LIST+"_D", sDiplo);
}

string GetTargetDiplomacy() {
   return GetLocalString(LIST_OWNER, ANI_TOKEN_LIST+"_D");
}

void SetTargetFaction(string sText) {
   SetLocalString(LIST_OWNER, ANI_TOKEN_LIST+"_F", sText);
}

string GetTargetFaction() {
   return GetLocalString(LIST_OWNER, ANI_TOKEN_LIST+"_F");
}

void SetShowMessage(string sPrompt, int nOkAction = ACTION_END_CONVO) {
   SetLocalString(LIST_OWNER, SDB_TOME_CONFIRM, sPrompt);
   SetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM, nOkAction);
   SetNextPage(PAGE_SHOW_MESSAGE);
}

void DoShowMessage() {
   SetDlgPrompt(GetLocalString(LIST_OWNER, SDB_TOME_CONFIRM));
   int nOkAction = GetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM);
   if (nOkAction!=ACTION_END_CONVO) AddMenuSelectionInt("Ok", nOkAction); // DON'T SHOW OK IF WE ARE ENDING CONVO, DEFAULT "END" WILL HANDLE IT
}

void SetConfirmAction(string sPrompt, int nActionConfirm, int nActionCancel=PAGE_MAIN_MENU, string sConfirm="Yes", string sCancel="No") {
   SetLocalString(LIST_OWNER, SDB_TOME_CONFIRM, sPrompt);
   SetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM + "_Y", nActionConfirm);
   SetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM + "_N", nActionCancel);
   SetLocalString(LIST_OWNER, SDB_TOME_CONFIRM + "_Y", sConfirm);
   SetLocalString(LIST_OWNER, SDB_TOME_CONFIRM + "_N", sCancel);
   SetNextPage(PAGE_CONFIRM_ACTION);
}

void DoConfirmAction() {
   SetDlgPrompt(GetLocalString(LIST_OWNER, SDB_TOME_CONFIRM));
   AddMenuSelectionInt(GetLocalString(LIST_OWNER, SDB_TOME_CONFIRM + "_Y"), ACTION_CONFIRM, GetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM+"_Y"));
   AddMenuSelectionInt(GetLocalString(LIST_OWNER, SDB_TOME_CONFIRM + "_N"), GetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM+"_N"));
}

int GetConfirmedAction() {
   return GetLocalInt(LIST_OWNER, SDB_TOME_CONFIRM);
}

string SendMsg(object oPC, string sMsg) {
   SendMessageToPC(oPC, sMsg);
   return sMsg+"\n";
}

void Init() {
   object oPC = GetPcDlgSpeaker();
   SetAnimosity(GetLocalInt(oPC, SDB_ANIMOSITY)); // SAVE A TEMP COPY OF CURRENT SETTINGS
   SetNextPage(PAGE_MAIN_MENU);
}

void HandleSelection() {
   object oPC = GetPcDlgSpeaker();
   int iSelection = GetDlgSelection();
   object oMember;
   int iOptionSelected = GetPageOptionSelected(); // RETURN THE KEY VALUE ASSOCIATED WITH THE SELECTION
   int nAnimosity = GetAnimosity(); // TEMP VAR OF SETTINGS
   int nToggleBit = 0;
   string sOptionSelected;
   string sFactionName;
   string sFeelings = ""; // NOTHING MORE THAN...
   string sSQL;
   string sText;
   int nConfirmed;
   switch (iOptionSelected) {
      // ********************************
      // HANDLE SIMPLE PAGE TURNING FIRST
      // ********************************
      case PAGE_MAIN_MENU:
         SetNextPage(iOptionSelected); // TURN TO NEW PAGE
         return;
      // ************************
      // HANDLE PAGE ACTIONS NEXT
      // ************************
      case ACTION_END_CONVO:
         EndDlg();
         return;
      case ACTION_TOGGLE_SETTING:
         sOptionSelected = GetPageOptionSelectedString(); // EITHER TEXT OF FACTIONLESS OR FAID
         if (iSelection > 3) sFactionName = SDB_FactionGetName(sOptionSelected);
         else sFactionName = sOptionSelected;
         SetTargetFaction(sFactionName);
         nToggleBit = FloatToInt(pow(2.0, IntToFloat(iSelection)));
         sFeelings = GetAniColor(sFactionName, nAnimosity, nToggleBit) + "\n\nToggle Animosity setting to ";
         if (nAnimosity & nToggleBit) sFeelings += "Like?"; // CURRENTLY A HATER
         else  sFeelings += "Dislike?";
         SetToggleBit(nToggleBit);
         SetConfirmAction(sFeelings, ACTION_TOGGLE_SETTING, PAGE_MAIN_MENU);
         return;

      case ACTION_PROCESS_CHANGES:
         SetConfirmAction("Process your Animosity changes and exit?", ACTION_PROCESS_CHANGES);
         return;

      // *****************************************
      // HANDLE CONFIRMED PAGE ACTIONS AND WE DONE
      // *****************************************
      case ACTION_CONFIRM: // THEY SAID YES TO SOMETHING (OR IT WAS AUTO-CONFIRMED ACTION)
         nConfirmed = GetPageOptionSelectedInt(); // THIS IS THE ACTION THEY CONFIRMED
         switch (nConfirmed) {
            case ACTION_TOGGLE_SETTING:
               nToggleBit = GetToggleBit();
               nAnimosity = nAnimosity ^ nToggleBit;
               sFactionName = GetTargetFaction();
               sFeelings = sFactionName + "\n\nAnimosity set to ";
               if (nAnimosity & nToggleBit) sFeelings += "Dislike"; // CURRENTLY A HATER
               else  sFeelings += "Like";
               sFeelings = GetAniColor(sFeelings, nAnimosity, nToggleBit);
               SetAnimosity(nAnimosity);
               SetShowMessage(sFeelings, PAGE_MAIN_MENU);
               return;
            case ACTION_PROCESS_CHANGES:
               SDB_UpdateAnimosity(oPC, nAnimosity);
               SDB_ProcessAnimosity(oPC);
               SetShowMessage("Your Animosity has been processed and stored in the database.");
               return;
       }
    }
    SetNextPage(PAGE_MAIN_MENU); // If broken, send to main menu
}

void BuildPage(int nPage) {
   object oPC = GetPcDlgSpeaker();
   string sFAID = SDB_GetFAID(oPC);
   DeleteList(ANI_TOKEN_LIST, LIST_OWNER);
   DeleteList(ANI_TOKEN_LIST+"_SUB", LIST_OWNER);
   int nFactionCnt = 0;
   int nAnimosity = GetAnimosity(); // TEMP VAR OF SETTINGS
   int i = 0;
   switch (nPage) {
      case PAGE_MAIN_MENU:
         SetDlgPrompt("Animosity On-Line\n\nYou've Got Enemies!\n\nSelect the faction to change:");
         i = 1;
         AddMenuSelectionString(GetAniColor("Factionless - Neutral", nAnimosity, i), ACTION_TOGGLE_SETTING, "Factionless - Neutral"); i *= 2;
         AddMenuSelectionString(GetAniColor("Factionless - Good", nAnimosity, i),    ACTION_TOGGLE_SETTING, "Factionless - Good"); i *= 2;
         AddMenuSelectionString(GetAniColor("Factionless - Evil", nAnimosity, i),    ACTION_TOGGLE_SETTING, "Factionless - Evil"); i *= 2;
         if (sFAID=="0") { // NOT A FACTION MEMBER, ALLOW THEM TO DO BY FACTION SETTINGS
            sFAID = SDB_FactionGetFirst();
            while (sFAID!="") {
               AddMenuSelectionString(GetAniColor(SDB_FactionGetName(sFAID), nAnimosity, i), ACTION_TOGGLE_SETTING, sFAID); i *= 2;
               sFAID = SDB_FactionGetNext();
            }
         }
         //if (nAnimosity!=GetLocalInt(oPC, SDB_ANIMOSITY))
         AddMenuSelectionInt("Process Changes and End", ACTION_PROCESS_CHANGES); // MADE CHANGES
         break;
      case PAGE_SHOW_MESSAGE:
         DoShowMessage();
         break;
      case PAGE_CONFIRM_ACTION:
         DoConfirmAction();
         break;
    }
}

void CleanUp() {
    DeleteLocalInt(LIST_OWNER, ANI_TOKEN_PAGE);
    DeleteList(ANI_TOKEN_LIST, LIST_OWNER);
    DeleteList(ANI_TOKEN_LIST+"_SUB", LIST_OWNER);
}

void main() {
   object oPC = GetPcDlgSpeaker();
   int iEvent = GetDlgEventType();
   switch(iEvent) {
      case DLG_INIT:
         Init();
         break;
      case DLG_PAGE_INIT:
         BuildPage(GetNextPage());
         SetShowEndSelection(TRUE);
         SetDlgResponseList(ANI_TOKEN_LIST, LIST_OWNER);
         break;
      case DLG_SELECTION:
         HandleSelection();
         break;
      case DLG_ABORT:
      case DLG_END:
         CleanUp();
         break;
   }
}




