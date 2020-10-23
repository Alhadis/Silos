// =============================================================
//
//    File: row_fp_door_open
//    Desc: Rowell's Fair Play Door - Open Event
//  Author: Michael Marzilli
//    Site: http://www.engliton.org
//
// Created: Oct 02, 2006
// Updated: Oct 02, 2006
// Version: 1.0.0
//
// =============================================================

void main() {
	object oDoor = OBJECT_SELF;
	
	// CHECK IF DOOR IS INITIALIZED
	if (GetLocalInt(oDoor, "IsInitialized") != 1) {
		SetLocalInt(oDoor, "IsTrapped", GetIsTrapped(oDoor));
		SetLocalInt(oDoor, "IsLocked", GetLocked(oDoor));
		SetLocalInt(oDoor, "CurHP", GetMaxHitPoints(oDoor));
		SetLocalInt(oDoor, "IsInitialized", 1);
	}

	SetLocalInt(oDoor, "CurHP", GetMaxHitPoints(oDoor));
	
	// If DOOR_STYLE = 0  (default), then close the door after 30 seconds
	if (GetLocalInt(oDoor, "DOOR_STYLE") == 0)
		DelayCommand(30.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
	
}