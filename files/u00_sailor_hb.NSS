// u00_sailor_hb
// 10.07.08 - Jesse Farrell
// This script runs every heartbeat for those npcs that will animate

void main() {

	object oPC = GetFactionLeader(GetFirstPC());
	
	if (GetArea(OBJECT_SELF) != GetArea(oPC))
		return;
		
	if (OBJECT_SELF == GetObjectByTag("u00_luaire")) {				// Luaire - looks nervous
		PlayCustomAnimation(OBJECT_SELF, "dejected", 1);
	} else if (OBJECT_SELF == GetObjectByTag("u00_passenger04")) {	// Dalin - looks around
		
		// Make Dalin face the sea again
		SetFacing(DIRECTION_WEST, FALSE);
		
		int nMood = Random(4);
		if (nMood == 3) {	
			PlayCustomAnimation(OBJECT_SELF, "scratchhead", 0);
		}
	} else if (OBJECT_SELF == GetObjectByTag("u00_passenger02")) {	// Durln - looks queasy
	
		PlayCustomAnimation(OBJECT_SELF, "idleinj", 1);
		SetOrientOnDialog(OBJECT_SELF, FALSE);
		
	} else if (OBJECT_SELF == GetObjectByTag("u00_sailor03")) {		// Doluwil - seated on a bench, fidgeting
	
		PlayCustomAnimation(OBJECT_SELF, "sitfidget", 1);
		SetOrientOnDialog(OBJECT_SELF, FALSE);
		
	} else if (OBJECT_SELF == GetObjectByTag("u00_sailor00")) {		// Rienur - crouched, messing with some crates
	
		PlayCustomAnimation(OBJECT_SELF, "kneeltalk", 1);
		SetOrientOnDialog(OBJECT_SELF, FALSE);
		
	} else if (OBJECT_SELF == GetObjectByTag("u00_sailor06")) {		// Ulegar - looks impatient
		int nMood = Random(4);
		if (nMood == 3) {	
			PlayCustomAnimation(OBJECT_SELF, "annoyed", 0);
		}
		
	} else if (OBJECT_SELF == GetObjectByTag("u00_sailor04")) {		// Saldee - prays
	
		PlayCustomAnimation(OBJECT_SELF, "meditate", 1);\
		SetOrientOnDialog(OBJECT_SELF, FALSE);
		
	}
}