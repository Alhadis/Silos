// Everything is done via onareaclient enter now.
#include "inc_pwcore_event"
#include "alu_inc"

void main()
{  /* object oPC = GetEnteringObject();

	// Set locSpecified to a valid location to override
	// restoring DB stored location at login if desired.
	// Leave locSpecified uninitialized to get DB location.
	// At login location is restored to the first valid
	// location found in this order:
	// (1) locSpecified
	// (2) DB stored location
	// (3) module start location (as failsafe)
    location locSpecified;
    if (GetIsDM(oPC))return;
    if (!GetIsPC(oPC)) return;      // ignore area entry unless it's a PC
    int bNewLogin = EV_AreaClientEnter(oPC, locSpecified);
    if (bNewLogin) {
        // Your module's code for new login processing here if needed...
		
    }
    // Your module's code for area enter processing here if needed...
	if(GetFugue(oPC, TRUE) == TRUE){
	   AssignCommand(oPC,ActionJumpToObject(GetWaypointByTag("FUGUE")));
	                                   }
*/	
}