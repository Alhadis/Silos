
#include "ginc_debug"
#include "inc_ai_planner"
#include "ftpath_library"


void main()
{
/*
	object oM = GetModule();
	
	SetLocalInt( oM,"a",1);
	SetLocalInt( oM,"b",2);
	PrettyDump( oM );
	SetLocalInt( oM,"a",2);
	PrettyDump( oM );
	DeleteLocalInt( oM,"a");
	PrettyDump( oM );

*/
// PrettyDebug( " start / ");
InitGoals();
//PrettyDump( GetStorage( GetCacheObject(), GOALS_STORAGE ) );
InitTasks();
//PrettyDump( GetStorage( GetCacheObject(), TASKS_STORAGE ) );


	// This is the standard NWN2 Module on load script
	ExecuteScript("x2_mod_def_load", GetModule() );

	// Build our Areas ID cache for Fast Transarea Pathfinding. YAY!
	ftp_BuildCache();
	
	
}