//******************************************************************************
//******************************************************************************
// FILE: 'e_areacliententer'     PW System area enter event demo code
//
// By Grumalg  Version 0.1.8 beta
//******************************************************************************
//******************************************************************************

#include "inc_pwcore_event"
#include "alu_inc"

void main()
{   object oPC = GetEnteringObject();
	
	// Set locSpecified to a valid location to override
	// restoring DB stored location at login if desired.
	// Leave locSpecified uninitialized to get DB location.
	// At login location is restored to the first valid
	// location found in this order:
	// (1) locSpecified
	// (2) DB stored location
	// (3) module start location (as failsafe)
    if (GetIsDM(oPC))return;
    if (!GetIsPC(oPC)) return;
    location locSpecified;
    int bNewLogin = EV_AreaClientEnter(oPC, locSpecified);
	
    if (bNewLogin) {
        // Your module's code for new login processing here if needed...
    }
    // Your module's code for area enter processing here if needed...
		if(GetFugue(oPC, TRUE) == TRUE){
	   AssignCommand(oPC,ActionJumpToObject(GetWaypointByTag("FUGUE")));
	                                   }
}