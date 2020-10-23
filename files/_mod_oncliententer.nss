#include "_CSLCore_Nwnx"
//#include "_CSLCore_Nwnx"
#include "seed_db_inc"
#include "_SCInclude_faction"

//#include "_SCUtility"
//#include "_SCInclude_Chat"

void main()
{
   //DEBUGGING = GetLocalInt( GetModule(), "DEBUGLEVEL" );
   
   object oPC = GetEnteringObject();
   SetLocalInt(oPC, "LOADED", TRUE);
   CSLTimedFlag(oPC, "LOADING", 4.0);
   DeleteLocalInt(oPC, "TRANS");
   SetLocalInt(oPC, "X1_AllowSdThf", FALSE); // ALLOW SHADOW THIEF CLASS
   //SendMessageToPC( GetFirstPC(), "Client enter" );
   string sName = GetName(oPC);
   string sIPAddress = GetPCIPAddress(oPC);
   string sPublicCDKey = GetPCPublicCDKey(oPC);
   string sPlayerName = GetPCPlayerName(oPC);
   if ( GetIsDM( oPC ) )
   {
		sPublicCDKey += "_DM";
		sPlayerName += "_DM";
   }
   
   // these are fixes to allow certain players to share cdkeys and accounts
   if ( sPublicCDKey == "KA7JJJ4C" || sPublicCDKey == "KCM79G3Q"  ) // && sPlayerName == ""
   {
   		if ( sPlayerName == "T-Bug" )
   		{
   			// this is going to be for first old cdkey
   			sPublicCDKey == "KA7JJJ4C";
   		}
   		else if ( sPlayerName == "Pug_ski" )
   		{
   			sPublicCDKey = "KCM79G3Q";
   		}
   	
   	/*
   	783	T-Bug	0	1091	0	0	0	1	2010-07-03 01:21:11	2007-10-30 00:29:13	0000-00-00 00:00:00	pug21peach	1
   	783	4	783	0	1090	2010-07-03 01:21:11	2007-10-30 00:29:13	0
   	4	KA7JJJ4C	0	1317	2010-07-03 01:21:11	2007-10-12 09:15:00	0	0	0
   	
   	831	Pug_ski	0	431	0	0	0	0	2010-07-03 00:56:09	2007-11-02 03:26:03	0000-00-00 00:00:00	mehfs	0
   	831	800	831	0	427	2008-12-19 21:56:00	2007-11-02 03:26:03	0 
   		800	KCM79G3Q	0	502	2008-12-19 21:56:00	2007-11-02 03:26:00	0	0	0
   	*/
   }
   
   
   
   
   
   
   SetLocalString(oPC, "MyName", sName);
   SetLocalString(oPC, "IPAddress", sIPAddress);
   SetLocalString(oPC, "PublicCDKey", sPublicCDKey);
   SetLocalString(oPC, "PlayerName",  sPlayerName);
	//CSLTableShowListUI(oPC, CSL_PAGE_FIRST );
}