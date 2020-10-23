//::///////////////////////////////////////////////
//:: Name ohs_i0_commands
//:: Copyright (c) 2004 OldMansBeard
//:://////////////////////////////////////////////
/*
   Scripts for linkboy OHS commands in OldMansBeards' Henchman system.
   #included in default, ohs_lb_onconv, ohs_d1_ohps, ohs_d2_ohaf0,
   ohs_d1_status35, ohs_d1_status99, ohs_mod_heart and ohs_d2_ohum.
*/
//:://////////////////////////////////////////////
//:: Created By:    OldMansBeard
//:: Created On:    2004-10-25
//:://////////////////////////////////////////////
//:: Modified By:   DonTheDime
//:: Last Modified: 2005-03-14
//:: Comments:
//::     Added a new local variable (OHS_MELEE_PREF) to both KeepLocals
//::     and RecallLocals functions to track melee style preferences
//:://////////////////////////////////////////////
//:: Last Modified: 2006-02-25
//:://////////////////////////////////////////////

#include "ohs_i0_common"
// V1.4.4: ohs_i0_toolkit now included in ohs_i0_goals
#include "ohs_i0_goals"
// V1.5.1: Message strings are taken out of scripts for i18n.
#include "ohs_i0_messages"
#include "x0_i0_henchman"
#include "inc_debug_dac"

// Store oPC's current OHS_HEN* henchmen in oPC's personal database.
// Fire before and Hire afterwards, so they are stored unhired.
// Delete pre-existing database first and recreate it afresh.
void KeepHenchmen(object oPC, int bUsePlayerVault=FALSE);

// Store (update overwrite) oHenchman in database "sDatabaseName".
// Fire before and Hire afterwards, so they are stored unhired.
// Ensure that their name is in the index list in the database.
// Returns TRUE if the store succeeds, FALSE if it fails for any reason.
// If oHenchman has no master, does nothing and returns FALSE.
int KeepThisHenchman(object oHenchman, string sDatabaseName);

// Copy tactical local variables from database:
//   int NW_ASSOCIATE_MASTER       <= AM+Suffix
//   int OHS_LEVELUP_POLICY        <= LU+Suffix
//   string sMasterName            <= MN+Suffix
//   int OHS_FLIRTED_<sMasterName> <= FL+Suffix
//   int OHS_L_R2_FLAGS            <= R2+Suffix
//   string OHS_S_PLAYER_OWNER     <= PO+Suffix
//   string OHS_DIALOGUE           <= DG+Suffix
//   int OHS_MELEE_PREF            <= MP+Suffix (Added by DonTheDime)
//   string OHS_S_ENAMOUR          <= EN+Suffix (V1.4.1)
//   string OHS_LIST_NOFLIRT       <= F0+Suffix
//   string OHS_LIST_FLIRT_1       <= F1+Suffix
//   string OHS_LIST_FLIRT_2       <= F2+Suffix
//   string OHS_LIST_FLIRT_3       <= F3+Suffix
//   string OHS_S_LINKBOY_RESREF   <= LB+Suffix (V1.4.4)
//   int OHS_SHARE_LOOT            <= SL+Suffix (@DUG)
//   int NW_ASC_USE_RANGED_WEAPON  <= RW+Suffix (@DUG)
//   int NW_ASC_DISARM_TRAPS       <= DT+Suffix (@DUG)
//   int NW_ASC_RETRY_OPEN_LOCKS   <= OL+Suffix (@DUG)
// where Suffix is derived from GetTag(oHenchman).
// If bTransfer is set to TRUE, the locals are also copied onto oPC
void RecallLocals(string sDatabaseName, object oHenchman, object oPC, int bTransfer=FALSE);

// Restore any OHS_HEN* henchmen apparently missing from oPC's
// current party, from their entries in oPC's personal database.
// Recalled henchmen have to be hired again.
// If bUsePlayerVault is set TRUE, it will use the PARTY SAVE file
// otherwise (default) it uses the KEEP file
// Returns the number recalled.
// V1.4.1: In addition, if bRefreshExisting is set to TRUE, any companions who
// are already present in the game will have their OHS locals updated from the database
int RecallHenchmen(object oPC, int bUsePlayerVault=FALSE, int bRefreshExisting=FALSE);

// Fire all OHS_HEN* henchman and your linkboy
void DropAllHenchmen(object oPC);

// Fix a problem with XP2 module transitions whereby henchmen restored
// via the database have the wrong faction id's for the new module
// and their master loses the locals that referenced them
void FixFactions(object oMaster);

// Make an OHS henchman out of the PC and store it in sDatabaseName.
// Then delete the copy object from the game. Return TRUE if successful.
// Stored clones are ipso facto companions belonging to the current player.
int SaveCloneToDatabase(object oPC, string sDatabaseName);

// Save the PC and Companions into player's personal vault
// Update the pre-existing database rather than deleting it first (bloat!)
// N.B. Companions remember their last flirtation even if it was not with this PC
void PartySave(object oPC, int bUsePlayerVault=FALSE);

// Reload all absent companions from the player's personal vault.
// Everyone will come except the PC himself and companions already in the game.
// Returns the number coming.
int AbsentFriends(object oPC);

// Remove all trace of oHenchman from campaign database sDatabaseName
void DeleteHenchmanFromDatabase(object oHenchman, string sDatabaseName);

// Triggers a dialogue with options to weed out (i.e. delete) unwanted
// characters from the player's OHPS vault and automatically compacts
// the file at the end (if I can think of a way of doing it).
// **** NOT IMPLEMENTED YET ****
void WeedVault(object oPC);

// Summon the Voice of Ohum
void InvokeOhum(object oPC);

/*********************/
/* Implementation    */
/*********************/

// Store oPC's current OHS_HEN* henchmen in oPC's personal database.
// Fire before and Hire afterwards, so they are stored unhired.
// Delete pre-existing database first and recreate it afresh.
void KeepHenchmen(object oPC, int bUsePlayerVault=FALSE)
{
   //debugVarObject("KeepHenchmen()", OBJECT_SELF);
   //debugVarObject("oPC", oPC);
   //debugVarBoolean("bUsePlayerVault", bUsePlayerVault);

   // In case SetMaxHenchmen() has somehow been reset to be less than the
   // number of henchmen we actually have, we need to restore it otherwise
   // re-hiring after keeping will fail.
   ForceMaxHenchmen(oPC);

   // Count the henchmen so we can work in reverse order
   // V1.5.1: Fixed so this still works correctly if you have non-OHS henchmen
   int nHenchmen = 0;
   int nOHS_Henchmen = 0;
   object oHenchman = GetHenchman(oPC,nHenchmen+1);
   while (GetIsObjectValid(oHenchman))
   {
      nHenchmen++;
      if (FindSubString(GetTag(oHenchman),"OHS_HEN")==0) nOHS_Henchmen++;
      oHenchman = GetHenchman(oPC,nHenchmen+1);
   }
   if (nOHS_Henchmen==0)
   {
      string sNoOne = OHS_GetStringByLanguage(120,oPC);           // V1.5.1
      SendMessageToPC(oPC,sNoOne);
   }
   else
   {
      string sDatabaseName;
      if (bUsePlayerVault)
      {
         sDatabaseName = "OHS_PLAYER_"+GetPCPlayerName(oPC);
      }
      else
      {
         sDatabaseName = "OHS_PARTY_"+GetName(oPC);
      }
      //debugVarString("sDatabaseName", sDatabaseName);
      DestroyCampaignDatabase(sDatabaseName);
      int nNth;
      int nStored = 0;
      for (nNth=nHenchmen;nNth>=1;nNth--)
      {
         oHenchman = GetHenchman(oPC,nNth);
         if (FindSubString(GetTag(oHenchman),"OHS_HEN")==0 &&
             KeepThisHenchman(oHenchman,sDatabaseName))
         {
            nStored++;
         }
      }
      if (nStored==1)
      {
         string sStored1 = OHS_GetStringByLanguage(122,oPC);       // V1.5.1
         SendMessageToPC(oPC,sStored1);
      }
      else
      {
         string sStored = OHS_GetStringByLanguage(124,oPC);        // V1.5.1
         string sCompanions = OHS_GetStringByLanguage(126,oPC);    // V1.5.1
         SendMessageToPC(oPC,sStored+IntToString(nStored)+sCompanions);
      }
   }
}

// Private function used by KeepThisHenchman and SaveCloneToDatabase
// Copy tactical local variables to database:
//   int NW_ASSOCIATE_MASTER       => AM+Suffix
//   int OHS_LEVELUP_POLICY        => LU+Suffix
//   int OHS_L_R2_FLAGS            => R2+Suffix
//   string OHS_S_PLAYER_OWNER     => PO+Suffix
//   string OHS_DIALOGUE           => DG+Suffix
//   int OHS_MELEE_PREF            => MP+Suffix (Added by DonTheDime)
//   string OHS_S_ENAMOUR          => EN+Suffix (V1.4.1)
//   string OHS_LIST_NOFLIRT       => F0+Suffix (V1.4.1)
//   string OHS_LIST_FLIRT_1       => F1+Suffix (V1.4.1)
//   string OHS_LIST_FLIRT_2       => F2+Suffix (V1.4.1)
//   string OHS_LIST_FLIRT_3       => F3+Suffix (V1.4.4)
//   string OHS_S_LINKBOY_RESREF   => LB+Suffix (V1.4.4)
//   int OHS_SHARE_LOOT            <= SL+Suffix (@DUG)
//   int NW_ASC_USE_RANGED_WEAPON  <= RW+Suffix (@DUG)
//   int NW_ASC_DISARM_TRAPS       <= DT+Suffix (@DUG)
//   int NW_ASC_RETRY_OPEN_LOCKS   <= OL+Suffix (@DUG)
// where Suffix is derived from GetTag(oHenchman)
void KeepLocals(string sDatabaseName, object oHenchman, object oMaster)
{
   //debugVarObject("KeepLocals()", OBJECT_SELF);
   //debugVarString("sDatabaseName", sDatabaseName);
   //debugVarObject("oHenchman", oHenchman);
   //debugVarObject("oMaster", oMaster);

   string sVarName, sValue;
   int nValue;
   string sSuffix = GetSubString(GetTag(oHenchman),7,30);

   sVarName = "AM"+sSuffix;
   nValue = GetLocalInt(oHenchman,"NW_ASSOCIATE_MASTER");
   SetCampaignInt(sDatabaseName,sVarName,nValue);

   sVarName = "LU"+sSuffix;
   nValue = GetLocalInt(oHenchman,"OHS_LEVELUP_POLICY");
   SetCampaignInt(sDatabaseName,sVarName,nValue);

   sVarName = "R2"+sSuffix;
   nValue = GetLocalInt(oHenchman,"OHS_L_R2_FLAGS");
   SetCampaignInt(sDatabaseName,sVarName,nValue);

   sVarName = "PO"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_S_PLAYER_OWNER");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   sVarName = "DG"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_DIALOGUE");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   //New local variable added by DonTheDime (2005-03-14) to track melee
   // style preferences
   sVarName = "MP"+sSuffix;
   nValue = GetLocalInt(oHenchman,"OHS_MELEE_PREF");
   SetCampaignInt(sDatabaseName,sVarName,nValue);

   sVarName = "EN"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_S_ENAMOUR");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   // Retrofix for pre-V1.4.1 games
   if (GetIsObjectValid(oMaster))
   {
      nValue = OHS_GetFlirtLevel(oHenchman,oMaster);
      OHS_SetFlirtLevel(oHenchman,oMaster,nValue);
   }

   sVarName = "F0"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_LIST_NOFLIRT");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   sVarName = "F1"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_LIST_FLIRT_1");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   sVarName = "F2"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_LIST_FLIRT_2");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   sVarName = "F3"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_LIST_FLIRT_3");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   sVarName = "LB"+sSuffix;
   sValue = GetLocalString(oHenchman,"OHS_S_LINKBOY_RESREF");
   SetCampaignString(sDatabaseName,sVarName,sValue);

   sVarName = "SL"+sSuffix;
   nValue = GetLocalInt(oHenchman,"OHS_SHARE_LOOT");
   SetCampaignInt(sDatabaseName,sVarName,nValue);

   sVarName = "RW"+sSuffix;
   nValue = GetLocalInt(oHenchman,"NW_ASC_USE_RANGED_WEAPON");
   SetCampaignInt(sDatabaseName,sVarName,nValue);

   sVarName = "DT"+sSuffix;
   nValue = GetLocalInt(oHenchman,"NW_ASC_DISARM_TRAPS");
   //debugVarInt(sVarName, nValue);
   SetCampaignInt(sDatabaseName, sVarName, nValue);

   sVarName = "OL"+sSuffix;
   nValue = GetLocalInt(oHenchman,"NW_ASC_RETRY_OPEN_LOCKS");
   //debugVarInt(sVarName, nValue);
   SetCampaignInt(sDatabaseName, sVarName, nValue);
}

// Store (update overwrite) oHenchman in database "sDatabaseName".
// Fire before and Hire afterwards, so they are stored unhired.
// Ensure that their name & tag are in the index lists in the database.
// Returns TRUE if the store succeeds, FALSE if it fails for any reason.
// If oHenchman has no master, does nothing and returns FALSE.
int KeepThisHenchman(object oHenchman, string sDatabaseName)
{
   //debugVarObject("KeepThisHenchman()", OBJECT_SELF);
   //debugVarObject("oHenchman", oHenchman);
   //debugVarString("sDatabaseName", sDatabaseName);

   object oMaster = GetMaster(oHenchman);
   if (!GetIsObjectValid(oMaster)) return FALSE;

   string sName = GetTrueName(oHenchman);
   string sTag = GetTag(oHenchman);
   string sVarName = sName;
   string sNameList = GetCampaignString(sDatabaseName,"sNameList");
   //debugVarString("sNameList", sNameList);
   if (GetStringLength(sNameList)==0) sNameList += ",";
   string sTagList = GetCampaignString(sDatabaseName,"sTagList");
   //debugVarString("sTagList", sTagList);
   if (GetStringLength(sTagList)==0) sTagList += ",";

   FireHenchman(oMaster,oHenchman);
   ChangeToStandardFaction(oHenchman,STANDARD_FACTION_MERCHANT);
   // V1.4.4: Exceptionally, if Defenders are hostile to Merchants
   // (e.g. in PotSC) join the Defenders instead
   if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER,oHenchman)<=10)
   {
      ChangeToStandardFaction(oHenchman,STANDARD_FACTION_DEFENDER);
   }
   DeleteCampaignVariable(sDatabaseName,sVarName);
   int bOkay = StoreCampaignObject(sDatabaseName,sVarName,oHenchman);
   if (bOkay)
   {
      if (FindSubString(sNameList,","+sName+",")==-1)
      {
         sNameList += sName+",";
         DeleteCampaignVariable(sDatabaseName,"sNameList");
         //debugVarString("saving sNameList", sNameList);
         SetCampaignString(sDatabaseName,"sNameList",sNameList);
         sTagList += sTag+",";
         DeleteCampaignVariable(sDatabaseName,"sTagList");
         //debugVarString("saving sTagList", sTagList);
         SetCampaignString(sDatabaseName,"sTagList",sTagList);
      }
      KeepLocals(sDatabaseName,oHenchman,oMaster);
      string sStored = OHS_GetStringByLanguage(106,oMaster);      // V1.5.1
      if (GetName(oHenchman)==sName)
      {
         SendMessageToPC(oMaster,sName+sStored);
      }
      else
      {
         SendMessageToPC(oMaster,GetName(oHenchman)+" ("+sName+")"+sStored);
      }
   }
   else
   {
      string sFailed = OHS_GetStringByLanguage(127,oMaster);      // V1.5.1
      SendMessageToPC(oMaster,sFailed+sName+".");
   }
   HireHenchman(oMaster,oHenchman,FALSE);
   AddHenchman(oMaster,oHenchman);
   return bOkay;
}

// Copy tactical local variables from database:
//   int NW_ASSOCIATE_MASTER       <= AM+Suffix
//   int OHS_LEVELUP_POLICY        <= LU+Suffix
//   string sMasterName            <= MN+Suffix
//   int OHS_FLIRTED_<sMasterName> <= FL+Suffix
//   int OHS_L_R2_FLAGS            <= R2+Suffix
//   string OHS_S_PLAYER_OWNER     <= PO+Suffix
//   string OHS_DIALOGUE           <= DG+Suffix
//   int OHS_MELEE_PREF            <= MP+Suffix (Added by DonTheDime)
//   string OHS_S_ENAMOUR          <= EN+Suffix (V1.4.1)
//   string OHS_LIST_NOFLIRT       <= F0+Suffix
//   string OHS_LIST_FLIRT_1       <= F1+Suffix
//   string OHS_LIST_FLIRT_2       <= F2+Suffix
//   string OHS_LIST_FLIRT_3       <= F3+Suffix (V1.4.4)
//   string OHS_S_LINKBOY_RESREF   <= LB+Suffix (V1.4.4)
//   int OHS_SHARE_LOOT            <= SL+Suffix (@DUG)
//   int NW_ASC_USE_RANGED_WEAPON  <= RW+Suffix (@DUG)
//   int NW_ASC_DISARM_TRAPS       <= DT+Suffix (@DUG)
//   int NW_ASC_RETRY_OPEN_LOCKS   <= OL+Suffix (@DUG)
// where Suffix is derived from GetTag(oHenchman).
// If bTransfer is set to TRUE, the locals are also copied onto oPC
void RecallLocals(string sDatabaseName, object oHenchman, object oPC, int bTransfer=FALSE)
{
   //debugVarObject("RecallLocals()", OBJECT_SELF);
   //debugVarString("sDatabaseName", sDatabaseName);
   //debugVarObject("oHenchman", oHenchman);
   //debugVarObject("oPC", oPC);
   //debugVarBoolean("bTransfer", bTransfer);

   string sVarName, sValue, sMasterName;
   int nValue;
   string sSuffix = GetSubString(GetTag(oHenchman),7,30);

   sVarName = "AM"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   SetLocalInt(oHenchman,"NW_ASSOCIATE_MASTER",nValue);
   if (bTransfer) SetLocalInt(oPC,"NW_ASSOCIATE_MASTER",nValue);

   sVarName = "LU"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   SetLocalInt(oHenchman,"OHS_LEVELUP_POLICY",nValue);
   if (bTransfer) SetLocalInt(oPC,"OHS_LEVELUP_POLICY",nValue);

   sVarName = "R2"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   SetLocalInt(oHenchman,"OHS_L_R2_FLAGS",nValue);
   if (bTransfer) SetLocalInt(oPC,"OHS_L_R2_FLAGS",nValue);

   sVarName = "PO"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_S_PLAYER_OWNER",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_S_PLAYER_OWNER",sValue);

   sVarName = "DG"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_DIALOGUE",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_DIALOGUE",sValue);

   //New local variable added by DonTheDime (2005-03-14) to track melee
   // style preferences
   sVarName = "MP"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   SetLocalInt(oHenchman,"OHS_MELEE_PREF",nValue);
   if (bTransfer) SetLocalInt(oPC,"OHS_MELEE_PREF",nValue);

   sVarName = "EN"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_S_ENAMOUR",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_S_ENAMOUR",sValue);

   // Retrofix for pre-V1.4.1 databases
   sVarName = "MN"+sSuffix;
   sMasterName = GetCampaignString(sDatabaseName,sVarName);
   if (GetStringLength(sMasterName)>0)
   {
      sVarName = "FL"+sSuffix;
      nValue = GetCampaignInt(sDatabaseName,sVarName);
      SetLocalInt(oHenchman,"OHS_FLIRTED_"+sMasterName,nValue);
      if (bTransfer)
      {
         SetLocalInt(oPC,"OHS_FLIRTED_"+sMasterName,nValue);
      }
      else if (GetIsObjectValid(oPC) && sMasterName==GetName(oPC))
      {
         SetLocalInt(oPC,"OHS_FLIRTED_"+GetTrueName(oHenchman),nValue);
      }
   }

   sVarName = "F0"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_LIST_NOFLIRT",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_LIST_NOFLIRT",sValue);

   sVarName = "F1"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_LIST_FLIRT_1",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_LIST_FLIRT_1",sValue);

   sVarName = "F2"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_LIST_FLIRT_2",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_LIST_FLIRT_2",sValue);

   sVarName = "F3"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_LIST_FLIRT_3",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_LIST_FLIRT_3",sValue);

   sVarName = "LB"+sSuffix;
   sValue = GetCampaignString(sDatabaseName,sVarName);
   SetLocalString(oHenchman,"OHS_S_LINKBOY_RESREF",sValue);
   if (bTransfer) SetLocalString(oPC,"OHS_S_LINKBOY_RESREF",sValue);

   sVarName = "SL"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   SetLocalInt(oHenchman,"OHS_SHARE_LOOT",nValue);
   if (bTransfer) SetLocalInt(oPC,"OHS_SHARE_LOOT",nValue);

   sVarName = "RW"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   SetLocalInt(oHenchman,"NW_ASC_DISARM_TRAPS",nValue);
   if (bTransfer) SetLocalInt(oPC,"NW_ASC_DISARM_TRAPS",nValue);

   sVarName = "DT"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   //debugVarInt(sVarName, nValue);
   SetLocalInt(oHenchman,"NW_ASC_DISARM_TRAPS",nValue);
   if (bTransfer) SetLocalInt(oPC,"NW_ASC_DISARM_TRAPS",nValue);

   sVarName = "OL"+sSuffix;
   nValue = GetCampaignInt(sDatabaseName,sVarName);
   //debugVarInt(sVarName, nValue);
   SetLocalInt(oHenchman,"NW_ASC_RETRY_OPEN_LOCKS",nValue);
   if (bTransfer) SetLocalInt(oPC,"NW_ASC_RETRY_OPEN_LOCKS",nValue);
}

// Restore any OHS_HEN* henchmen apparently missing from oPC's
// current party, from their entries in oPC's personal database.
// Recalled henchmen have to be hired again.
// If bUsePlayerVault is set TRUE, it will use the PARTY SAVE file
// otherwise (default) it uses the KEEP file.
// Returns the number recalled.
// V1.4.1: In addition, if bRefreshExisting is set to TRUE, any companions who
// are already present in the game will have their OHS locals updated from the database
int RecallHenchmen(object oPC, int bUsePlayerVault=FALSE, int bRefreshExisting=FALSE)
{
   //debugVarObject("RecallHenchmen()", OBJECT_SELF);
   //debugVarObject("oPC", oPC);
   //debugVarBoolean("bUsePlayerVault", bUsePlayerVault);
   //debugVarBoolean("bRefreshExisting", bRefreshExisting);

   string sDatabaseName;
   if (bUsePlayerVault)
   {
      sDatabaseName = "OHS_PLAYER_"+GetPCPlayerName(oPC);
   }
   else
   {
      sDatabaseName = "OHS_PARTY_"+GetName(oPC);
   }
   //debugVarString("sDatabaseName", sDatabaseName);

   string sNameList = GetCampaignString(sDatabaseName,"sNameList");
   //debugVarString("sNameList", sNameList);
   string sTagList = GetCampaignString(sDatabaseName,"sTagList");
   //debugVarString("sTagList", sTagList);
   if (GetStringLength(sNameList)<3)
   {
      string sEmpty = OHS_GetStringByLanguage(129,oPC);       // V1.5.1
      SendMessageToPC(oPC,sEmpty);
      return 0;
   }

   // Create a spot 1.8m in front of oPC
   float fFacing = GetFacing(oPC);
   float fOpposite = (fFacing>=180.0f)?(fFacing-180.0f):(fFacing+180.0f);
   vector vSpot = GetPosition(oPC)+1.8f*AngleToVector(fFacing);
   location lSpot = Location(GetArea(oPC),vSpot,fOpposite);

   // Scroll through the names in the list, restoring
   // any that do not match existing henchmen of oPC
   int iBreak, nNth;
   int bFound;
   int nRestored = 0;
   string sName, sTag;
   object oTestObject, oHenchman;
   sNameList = GetStringRight(sNameList,GetStringLength(sNameList)-1);
   sTagList = GetStringRight(sTagList,GetStringLength(sTagList)-1);
   while (GetStringLength(sNameList)>1)
   {
      iBreak = FindSubString(sNameList,",");
      sName = GetStringLeft(sNameList,iBreak);
      sNameList = GetStringRight(sNameList,GetStringLength(sNameList)-iBreak-1);
      iBreak = FindSubString(sTagList,",");
      sTag = GetStringLeft(sTagList,iBreak);
      sTagList = GetStringRight(sTagList,GetStringLength(sTagList)-iBreak-1);

      // Set bFound to TRUE if there is a matching object already in play
      object oMatch;
      bFound = FALSE;
      // New in V1.1.10: Check against the PC (by name, not tag)
      if (GetName(oPC)==sName) bFound=TRUE;
      // V1.4: Companions of a given player must be unique in the game
      int nNth = 0;
      oMatch = GetObjectByTag(sTag,nNth);
      while (!bFound && GetIsObjectValid(oMatch))
      {
         string sPN = GetLocalString(oMatch,"OHS_S_PLAYER_OWNER");
         if (sPN==GetPCPlayerName(oPC))
         {
            bFound = TRUE;
         }
         else
         {
            nNth++;
            oMatch = GetObjectByTag(sTag,nNth);
         }
      }

      if (bFound && bRefreshExisting)
      {
         //debugVarObject("found", oMatch);
         RecallLocals(sDatabaseName,oMatch,oPC);
         string sRefreshed = OHS_GetStringByLanguage(130,oPC);       // V1.5.1
         if (GetName(oMatch)==sName)
         {
            SendMessageToPC(oPC,sRefreshed+sName+".");
         }
         else
         {
            SendMessageToPC(oPC,sRefreshed+GetName(oMatch)+" ("+sName+").");
         }
      }
      else if (!bFound)
      {
         //debugVarString("retrieving from database", sName);
         oHenchman = RetrieveCampaignObject(sDatabaseName,sName,lSpot);
         if (GetIsObjectValid(oHenchman))
         {
            string sRestored = OHS_GetStringByLanguage(125,oPC);       // V1.5.1
            if (GetName(oHenchman)==sName)
            {
               SendMessageToPC(oPC,sRestored+sName+".");
            }
            else
            {
               SendMessageToPC(oPC,sRestored+GetName(oHenchman)+" ("+sName+").");
            }
            SetPlayerHasHired(oPC,oHenchman,TRUE);
            SetRespawnLocation(oHenchman);
            AssignCommand(oHenchman,SetAssociateStartLocation());
            ChangeToStandardFaction(oHenchman,STANDARD_FACTION_MERCHANT);
            // V1.4.4: Exceptionally, if Defenders are hostile to Merchants
            // (e.g. in PotSC) join the Defenders instead
            if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER,oHenchman)<=10)
            {
               ChangeToStandardFaction(oHenchman,STANDARD_FACTION_DEFENDER);
            }
            AssignCommand(oHenchman,RecallLocals(sDatabaseName,oHenchman,oPC));
            nRestored++;
            // Retrofix for pre-V1.4 databases
            OHS_SetCompanion(oHenchman,TRUE,oPC);
         }
         else
         {
            string sFailed = OHS_GetStringByLanguage(128,oPC);       // V1.5.1
            SendMessageToPC(oPC,sFailed+sName+".");
         }
      }
   }

   if (nRestored==1)
   {
      string sRestored1 = OHS_GetStringByLanguage(123,oPC);        // V1.5.1
      SendMessageToPC(oPC,sRestored1);
   }
   else
   {
      string sRestored = OHS_GetStringByLanguage(125,oPC);         // V1.5.1
      string sCompanions = OHS_GetStringByLanguage(126,oPC);       // V1.5.1
      SendMessageToPC(oPC,sRestored+IntToString(nRestored)+sCompanions);
   }
   return nRestored;
}

// Fire all OHS_HEN* henchman and your linkboy
void DropAllHenchmen(object oPC)
{
   //debugVarObject("DropAllHenchmen()", OBJECT_SELF);
   //debugVarObject("oPC", oPC);
   int nNth = 1;
   object oHenchman = GetHenchman(oPC,nNth);
   while (GetIsObjectValid(oHenchman))
   {
      //debugVarObject("oHenchman", oHenchman);
      if (FindSubString(GetTag(oHenchman),"OHS_")==0)
      {
         //debugVarObject("firing", oHenchman);
         FireHenchman(oPC,oHenchman);
         ChangeToStandardFaction(oHenchman,STANDARD_FACTION_MERCHANT);
         // V1.4.4: Exceptionally, if Defenders are hostile to Merchants
         // (e.g. in PotSC) join the Defenders instead
         if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER,oHenchman)<=10)
         {
            ChangeToStandardFaction(oHenchman,STANDARD_FACTION_DEFENDER);
         }
      }
      else
      {
         nNth++;
      }
      oHenchman = GetHenchman(oPC,nNth);
   }
}

// Fix a problem with XP2 module transitions whereby henchmen restored
// via the database have the wrong faction id's for the new module
// and their master loses the locals that referenced them.
void FixFactions(object oMaster)
{
   //debugVarObject("FixFactions()", OBJECT_SELF);
   //debugVarObject("oMaster", oMaster);

   string sDatabaseName = "OHS_PARTY_"+GetName(oMaster);
   int nNth = 1;
   object oHenchman = GetHenchman(oMaster,nNth);
   object oFactionMember = GetFirstFactionMember(oMaster,FALSE);
   oFactionMember = GetNextFactionMember(oMaster,FALSE);
   if (!GetIsObjectValid(oFactionMember))
   {
      string sNoValid = OHS_GetStringByLanguage(133,oMaster);      // V1.5.1
      SendMessageToPC(oMaster,sNoValid);
   }
   else
   {
      string sMember = OHS_GetStringByLanguage(131,oMaster);       // V1.5.1
      SendMessageToPC(oMaster,sMember+GetName(oFactionMember));
      while (GetIsObjectValid(oHenchman))
      {
         if (!GetFactionEqual(oHenchman,oFactionMember))
         {
            ChangeFaction(oHenchman,oFactionMember);
            string sChanged = OHS_GetStringByLanguage(132,oMaster); // V1.5.1
            SendMessageToPC(oMaster,sChanged+GetName(oHenchman));
            HireHenchman(oMaster,oHenchman,FALSE);
         }
         nNth++;
         oHenchman = GetHenchman(oMaster,nNth);
      }
   }
}

// Test to see if oHenchman is registered
int GetIsRegistered(object oHenchman)
{
   return OHS_GetIsRegistered(oHenchman);
}

// Make an OHS henchman out of the PC and store it in sDatabaseName.
// Then delete the copy object from the game. Return TRUE if successful.
// Stored clones are ipso facto companions belonging to the current player.
int SaveCloneToDatabase(object oPC, string sDatabaseName)
{
   //debugVarObject("SaveCloneToDatabase()", OBJECT_SELF);
   //debugVarObject("oPC", oPC);
   //debugVarString("sDatabaseName", sDatabaseName);

   // Create a clone with a unique tag
   location lClone = GetLocation(OBJECT_SELF); // Superimpose it on the linkboy
   string sNameTag = "OHS_HEN_"+GetName(oPC);
   object oClone = CopyObject(oPC,lClone,OBJECT_INVALID,sNameTag);

   // Store the clone in the database
   string sName = GetName(oClone);
   string sTag  = GetTag(oClone);
   int bOkay = StoreCampaignObject(sDatabaseName,sName,oClone);
   if (bOkay)
   {
      // Make sure the name is indexed
      string sNameList = GetCampaignString(sDatabaseName,"sNameList");
      if (GetStringLength(sNameList)==0) sNameList += ",";
      string sTagList = GetCampaignString(sDatabaseName,"sTagList");
      if (GetStringLength(sTagList)==0) sTagList += ",";

      if (FindSubString(sNameList,","+sName+",")==-1)
      {
         sNameList += sName+",";
         DeleteCampaignVariable(sDatabaseName,"sNameList");
         SetCampaignString(sDatabaseName,"sNameList",sNameList);
         sTagList += sTag+",";
         DeleteCampaignVariable(sDatabaseName,"sTagList");
         SetCampaignString(sDatabaseName,"sTagList",sTagList);
      }
      // Store locals, insofar as they are meaningful.
      SetLocalInt(oClone,"NW_ASSOCIATE_MASTER",GetLocalInt(oPC,"NW_ASSOCIATE_MASTER"));
      SetLocalInt(oClone,"OHS_LEVELUP_POLICY",GetLocalInt(oPC,"OHS_LEVELUP_POLICY"));
      SetLocalInt(oClone,"OHS_L_R2_FLAGS",GetLocalInt(oPC,"OHS_L_R2_FLAGS"));
      SetLocalString(oClone,"OHS_DIALOGUE",GetLocalString(oPC,"OHS_DIALOGUE"));
      SetLocalInt(oClone,"OHS_MELEE_PREF",GetLocalInt(oPC,"OHS_MELEE_PREF"));
      SetLocalString(oClone,"OHS_S_ENAMOUR",GetLocalString(oPC,"OHS_S_ENAMOUR"));
      SetLocalString(oClone,"OHS_LIST_NOFLIRT",GetLocalString(oPC,"OHS_LIST_NOFLIRT"));
      SetLocalString(oClone,"OHS_LIST_FLIRT_1",GetLocalString(oPC,"OHS_LIST_FLIRT_1"));
      SetLocalString(oClone,"OHS_LIST_FLIRT_2",GetLocalString(oPC,"OHS_LIST_FLIRT_2"));
      SetLocalString(oClone,"OHS_LIST_FLIRT_3",GetLocalString(oPC,"OHS_LIST_FLIRT_3"));
      SetLocalString(oClone,"OHS_S_LINKBOY_RESREF",GetLocalString(oPC,"OHS_S_LINKBOY_RESREF"));
      SetLocalInt(oClone,"OHS_SHARE_LOOT",GetLocalInt(oPC,"OHS_SHARE_LOOT"));
      SetLocalInt(oClone,"NW_ASC_USE_RANGED_WEAPON",GetLocalInt(oPC,"NW_ASC_USE_RANGED_WEAPON"));
      SetLocalInt(oClone,"NW_ASC_DISARM_TRAPS",GetLocalInt(oPC,"NW_ASC_DISARM_TRAPS"));
      SetLocalInt(oClone,"NW_ASC_RETRY_OPEN_LOCKS",GetLocalInt(oPC,"NW_ASC_RETRY_OPEN_LOCKS"));
      // Stored clones of PC's are ipso facto Companions belonging to the current player.
      OHS_SetCompanion(oClone,TRUE,oPC);
      KeepLocals(sDatabaseName,oClone,OBJECT_INVALID);
   }
   // Destroy the clone again
   AssignCommand(oClone,SetIsDestroyable(TRUE,FALSE,FALSE));
   AssignCommand(oClone,SetCommandable(TRUE));
   AssignCommand(oClone,ActionDoCommand(DestroyObject(OBJECT_SELF)));
   return bOkay;
}

// Save the PC and Companions into player's personal vault
// Update the pre-existing database rather than deleting it first (bloat!)
// N.B. Companions remember their last flirtation even if it was not with this PC
void PartySave(object oPC, int bUsePlayerVault=FALSE)
{
   //debugVarObject("PartySave()", OBJECT_SELF);
   //debugVarObject("oPC", oPC);

   string sDatabaseName;
   if (bUsePlayerVault)
   {
      sDatabaseName = "OHS_PLAYER_"+GetPCPlayerName(oPC);
   }
   else
   {
      sDatabaseName = "OHS_PARTY_"+GetName(oPC);
   }
   //debugVarString("sDatabaseName", sDatabaseName);

   // @DUG Delete current list so fired henchmen don't reappear.
   DeleteCampaignVariable(sDatabaseName, "sNameList");
   DeleteCampaignVariable(sDatabaseName, "sTagList");

   // Store oPC's current OHS_HEN* Companions into player's personal database.
   // Fire before and Hire afterwards, so they are stored unhired.

   // In case SetMaxHenchmen() has somehow been reset to be less than the
   // number of henchmen we actually have, we need to restore it otherwise
   // re-hiring after keeping will fail.
   ForceMaxHenchmen(oPC);

   // Count the henchmen so we can work in reverse order
   // V1.5.1: Fixed so this still works correctly if you have non-OHS henchmen
   int nHenchmen = 0;
   int nOHS_Henchmen = 0;
   object oHenchman = GetHenchman(oPC,nHenchmen+1);
   while (GetIsObjectValid(oHenchman))
   {
      nHenchmen++;
      if (FindSubString(GetTag(oHenchman),"OHS_HEN")==0) nOHS_Henchmen++;
      oHenchman = GetHenchman(oPC,nHenchmen+1);
   }
   if (nOHS_Henchmen==0)
   {
      string sNoCompanions = OHS_GetStringByLanguage(121,oPC);        // V1.5.1
      SendMessageToPC(oPC,sNoCompanions);
   }
   else
   {
      int nNth;
      int nStored = 0;
      for (nNth=nHenchmen;nNth>=1;nNth--)
      {
         oHenchman = GetHenchman(oPC,nNth);
         if (FindSubString(GetTag(oHenchman),"OHS_HEN") == 0 &&
             KeepThisHenchman(oHenchman,sDatabaseName))
         {
            nStored++;
         }
      }
      if (nStored==1)
      {
         string sStored1 = OHS_GetStringByLanguage(122,oPC);          // V1.5.1
         SendMessageToPC(oPC,sStored1);
      }
      else
      {
         string sStored = OHS_GetStringByLanguage(124,oPC);              // V1.5.1
         string sCompanions = OHS_GetStringByLanguage(126,oPC);          // V1.5.1
         SendMessageToPC(oPC,sStored+IntToString(nStored)+sCompanions);
      }
   }

/* @DUG
  if (SaveCloneToDatabase(oPC,sDatabaseName))
  {
    string sPossible = OHS_GetStringByLanguage(134,oPC);              // V1.5.1
    SendMessageToPC(oPC,sPossible);
  }
  else
  {
    string sProblem = OHS_GetStringByLanguage(135,oPC);               // V1.5.1
    SendMessageToPC(oPC,sProblem);
  }
@DUG */
}

// Reload all absent companions from the player's personal vault.
// Everyone will come except the PC himself and companions already in the game.
// Returns the number coming.
int AbsentFriends(object oPC)
{
   return RecallHenchmen(oPC,TRUE);
}

// Remove all trace of oHenchman from campaign database sDatabaseName
void DeleteHenchmanFromDatabase(object oHenchman, string sDatabaseName)
{
   string sVarName = GetTrueName(oHenchman);
   string sTag = GetTag(oHenchman);
   DeleteCampaignVariable(sDatabaseName, sVarName); // Gone.
   // Remove the local variables that are stored separately
   string sSuffix = GetSubString(GetTag(oHenchman),7,30);
   DeleteCampaignVariable(sDatabaseName,"AM"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"LU"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"MN"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"FL"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"R2"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"PO"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"DG"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"MP"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"EN"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"F0"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"F1"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"F2"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"F3"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"LB"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"DT"+sSuffix);
   DeleteCampaignVariable(sDatabaseName,"OL"+sSuffix);
   // Remove from the NameList and TagList
   // N.B. All goes horribly wrong if not present
   string sNameList = GetCampaignString(sDatabaseName,"sNameList");
   int iLeft = FindSubString(sNameList,","+sVarName+",");
   int iRight = GetStringLength(sNameList)-iLeft-GetStringLength(sVarName)-1;
   sNameList = GetStringLeft(sNameList,iLeft)+GetStringRight(sNameList,iRight);
   DeleteCampaignVariable(sDatabaseName,"sNameList");
   SetCampaignString(sDatabaseName,"sNameList",sNameList);
   string sTagList = GetCampaignString(sDatabaseName,"sTagList");
   iLeft = FindSubString(sTagList,","+sTag+",");
   iRight = GetStringLength(sTagList)-iLeft-GetStringLength(sTag)-1;
   sTagList = GetStringLeft(sTagList,iLeft)+GetStringRight(sTagList,iRight);
   DeleteCampaignVariable(sDatabaseName,"sTagList");
   SetCampaignString(sDatabaseName,"sTagList",sTagList);
}

// Triggers a dialogue with options to weed out (i.e. delete) unwanted
// characters from the player's OHPS vault and automatically compacts
// the file at the end (if I can think of a way of doing it).
// **** NOT IMPLEMENTED YET ****
void WeedVault(object oPC)
{
     string sNotYet = OHS_GetStringByLanguage(136,oPC);    // V1.5.1
     SendMessageToPC(oPC,sNotYet);
}

// Summon the Voice of Ohum
void InvokeOhum(object oPC)
{
   object oOhum = CreateObject(OBJECT_TYPE_CREATURE,"ohs_voice_ohum",GetLocation(oPC));
   ChangeToStandardFaction(oOhum,STANDARD_FACTION_MERCHANT);
   // V1.4.4: Exceptionally, join the Defender Faction instead
   if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER,oOhum)<=10)
   {
      ChangeToStandardFaction(oOhum,STANDARD_FACTION_DEFENDER);
   }
   AssignCommand(oOhum,ActionWait(2.0f));
   AssignCommand(oOhum,ActionStartConversation(oPC,"",FALSE,FALSE));
}


////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
// (C) 2004, 2005, 2006 by bob@minors-ranton.fsnet.co.uk (aka "OldMansBeard")         //
//                                                                                    //
// The NWScript source code file to which this notice is attached is copyright.       //
// It may not be published or passed to a third party in part or in whole
// modified or unmodified without the express consent of the copyright holder.                 //
//                                                                                    //
// NWN byte code generated by compiling it or variations of it may be published       //
// or otherwise distributed notwithstanding under the terms of the Bioware EULA.      //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////

//void main() {} // Testing/compiling purposes
