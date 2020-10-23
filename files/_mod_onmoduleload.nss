#include "x2_inc_switches"
//#include "x2_inc_restsys"
#include "_CSLCore_Nwnx"
#include "seed_db_inc"
// This
#include "_SCInclude_faction"
#include "_SCInclude_Events"

//#include "_SCInclude_Chat"


void main()
{
	object oModule = GetModule();
	CSLSetDebuggingLevel( 0 ); // sets the amount of warnings and debug info displayed
	CSLSetDebugToTestersOnly(TRUE); // makes it so only those with a var set ( names "DEBUGGING" ) on them will see any messages, note this is set on pc loaded for dm's and those in single player, can be added to others as needed via dm_Debuglevel chat command
	
	DelayCommand(2.0f, SCLoadDataObjects() );
	
	//DelayCommand(60.0f, SendMessageToPC(GetFirstPC(),"Ran on module load 60 secs ago") );
	
	SetModuleSwitch(MODULE_SWITCH_ENABLE_INVISIBLE_GLYPH_OF_WARDING, TRUE);
	SetModuleSwitch(MODULE_SWITCH_RESTRICT_USE_POISON_TO_FEAT, TRUE);
	SetModuleSwitch(MODULE_SWITCH_ENABLE_UMD_SCROLLS, TRUE);
	SetModuleSwitch(MODULE_VAR_AI_STOP_EXPERTISE_ABUSE, TRUE);
		
	SetLocalString( oModule, "SC_BATTLE_CASTLE_NE_FACTION", IntToString( Random(5)+1) );
	SetLocalString( oModule, "SC_BATTLE_CASTLE_NW_FACTION", IntToString( Random(5)+1) );
	
	//	SetModuleOverrideSpellscript("_mod_spell_overides"); // THIS RUNS BEFORE ANY SPELL IS CAST AND ALLOWS YOU TO ABORT THE CALL
	SetModuleOverrideSpellscript("_SCDexSpellHooks"); // THIS RUNS BEFORE ANY SPELL IS CAST AND ALLOWS YOU TO ABORT THE CALL
	// same as the above, you can set the following in the module properties directly
	//SetLocalString(oModule, "X2_S_UD_SPELLSCRIPT", "_SCDexSpellHooks");
	// set up the messages system
	// Change this to 7-9 to see lot of debug data, plan on making this settable via dialog later
	SetLocalInt( oModule, "SC_MESSAGES_TO_SHOW_PLAYER", 0 );
	SetLocalInt( oModule, "SC_MESSAGES_TO_SHOW_TESTER", 0 );
	
	SetLocalInt( oModule, "CSL_HIDEDMONINVIS", TRUE );
	
	
	SetLocalInt( oModule, "SC_MPINVISFIX", FALSE );
	
	SetLocalString( oModule, "SC_SESSIONNUMBER", SDB_GetSEID() );
	
	
	//if (CSLNWNX_Installed())
	//{
		//int iMinutes = 0; // this adjusts things so it lands on a given hour, so if time is 10:33 this gets the value 33, and by subtracting that the server tends to restart at given hour intervals
		
		//SetLocalInt(oModule, "SC_SERVER_MAX_UPTIME", 360 - iMinutes); // time in minutes, now 6 hours, look at moving to the cslpreferences system actually
	//}
	
	
	SetLocalString(oModule, "SERVERMSG", GetServerMsg());
	//DelayCommand( 30.0, SetEventHandler( oModule, SCRIPT_MODULE_ON_HEARTBEAT, "_SCModule_Heartbeat") );
	
	// * Item Event Scripts: Check "x2_it_example.nss" for an example.
	SetModuleSwitch (MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE);
	
	DelayCommand( 1.0f, CSLsetTimeBasedOnRealTime()  );
	
	CSLEnviroGetControl();
	
	
	//DelayCommand(30.0f, CSLServerRebootTimer(SDB_GetSEID(), TRUE));
	//DelayCommand(60.0f, BootInactivePlayers());
	DelayCommand(10.0f, SCMakeThemWalk());
	//SCMakeThemWalk(); // CREATURES WANDER AROUND THEIR AREA
	
	ExecuteScript("nwnx_craft_set_constants", oModule );
	
	SDB_OnModuleLoad();
	DelayCommand(2.0f, SDB_FactionOnModuleLoad() );
	
	
	
	object oClancy = GetObjectByTag("QUEST_LOFT");
	//SetLocalString(oClancy, "QU_AWARDITEM", "dex_bootsvelocity");
	
	CSLAssignMainShouter(oClancy);
	ExecuteScript("towngossip", oClancy);

	DestroyObject(GetObjectByTag("loftpond_fakebridge"));
	
	
	//DelayCommand(2.0, InitSpeech() );
}