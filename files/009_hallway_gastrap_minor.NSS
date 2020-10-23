// Gas Trap in Hall or Small Room between 2 Doors
//
// Place on a generic trigger "On Enter" script
//
// Other Items Required:
//  2 Doors Tag "GasTrap1" and "GasTrap2"
//  2 Waypoints Tag "waypt1" and "waypt2"
//  1 Placeable Invisible object Tag "DoorLocker" in vicinity of 2 doors
//  1 or more Keys that the players can find Tag "GasTrapKey"
//
// By Mordrake of COR
// 17 Sept 02
// Lots of help from:
// Wolfe13 , IceBerg , Tcoz , tjm
//
// Note: if you want this trap to spawn gas that can harm Monsters as well, edit factions to have a
// "Placeable" faction, which is hostile towards them. Then set the trigger for this trap to
// faction "Placeable".
//
#include "acr_hazards_i"
#include "acr_trigger_i"

void RunTrap(float fDelay = 0.0);
void main()
    {
	
    object oPC          = GetEnteringObject();
    object oDoorLocker  = GetObjectByTag("DoorLocker");
    object oKeyCheck;
    string sMessage1    = "The Key you have glows bright green and humms softly";
    float fDelay        = 30.0; // Ammount in seconds to wait before setting off
                                // trap for PC or Monster with key
    // This will keep the trap from being set off again while it is set off and while
    // the PC or Monster has the key
    if ((GetLocalInt(oDoorLocker, "Triggered") != 1) || // This is an "OR" this || that
        GetLocalInt(oDoorLocker, "HasKey") != 1)        // If either side is true it will
    {                                                   // run the "if" line
        oKeyCheck = GetItemPossessedBy(oPC, "009_it_plot_r26_ruin1-2");
        if (oKeyCheck != OBJECT_INVALID)  // PC or Monster has key
        {
            SetLocalInt(oDoorLocker, "HasKey", 1);
            SetLocalInt(oDoorLocker, "NoDelay", 0);
            RunTrap(fDelay);  // run delay (fDelay)
            // Inform PC key has prevented trap from triggering
            AssignCommand(oPC, SpeakString(sMessage1, TALKVOLUME_TALK));
        }
        else  // Entering object doesn't have key - run trap no delay
        {
            SetLocalInt(oDoorLocker, "NoDelay", 1);
            RunTrap();
        }
    }
    else // One of the ints has been set. Either the trap is already triggered,
         // or the object with the key is in the house :lol:  
    {
        SetLocalInt(oDoorLocker, "NoDelay", 1);
        RunTrap();
    }
     
}
void RunTrap(float fDelay)
{
    //// Trap varables ////
    // Gas effect can be changed with "NW_T1_GasDeadC1", "NW_T1_GasAvgC1" or
    // "NW_T1_GasMinoC1", "NW_T1_GasStrC1"
    effect eTrap        = EffectAreaOfEffect (AOE_PER_FOGACID,"NW_T1_GasMinoC1");
    // Gas stays for 6 seconds times this number
    int nCastDuration   = 3;
    // Float for delaying of the int
    float fCastDur      = IntToFloat(nCastDuration);
    // Re-define entering object and set up string to inform of trap going off
    object oPC          = GetEnteringObject();
    string sMessage2    = "Green Gas starts to billow from two vents on the floor!";
    // Gas eminates from these 2 waypoints...........
    location lTrap1     = GetLocation (GetNearestObjectByTag ("gaswaypt1"));
    location lTrap2     = GetLocation (GetNearestObjectByTag ("gaswaypt2"));
    // The 2 doors that lock you in this area
    object oDoor1       = GetNearestObjectByTag ("GasTrap1");
    object oDoor2       = GetNearestObjectByTag ("GasTrap2");
    // Defines invisible object tagged "DoorLocker" to code for use to
    // close the doors
   // object oDoorLocker  = GetObjectByTag("DoorLocker");
    // This sets off gas at the 2 waypoints
    DelayCommand(fDelay, ApplyEffectAtLocation ( DURATION_TYPE_TEMPORARY, eTrap,
        lTrap1, RoundsToSeconds ( nCastDuration)));
    DelayCommand(fDelay, ApplyEffectAtLocation ( DURATION_TYPE_TEMPORARY, eTrap,
        lTrap2, RoundsToSeconds( nCastDuration)));
   	AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
		SetLocked(oDoor1, TRUE);	
		AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
		SetLocked(oDoor2, TRUE);
    // Has invisible object tell PCs about the gas vents opening
    DelayCommand(fDelay, AssignCommand(oPC, SpeakString(sMessage2, TALKVOLUME_TALK)));
    // Locks both the now Closed doors trapping the hapless PC's in with the Gas MUHAHAHA
    DelayCommand(fDelay, SetLocked(oDoor1, TRUE));
    DelayCommand(fDelay, SetLocked(oDoor2, TRUE));
  {
object oSelf = OBJECT_SELF;
    // Only fire for (real) PCs.
   // if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
     //  return;

    // Destroy an object (not fully effective until this script ends).
   // DelayCommand(fDelay,DestroyObject(oSelf, TRUE));
	DestroyObject(oSelf);

}
    // If there was a casting delay then use the delay comm with both delays

 // if (GetLocalInt(oDoorLocker, "NoDelay") != 1)
    //{   // Ok this will delay 150secs long enough for casting delay and fdelay
        // Then the int will be set to 0 and the trap will reset.
       // DelayCommand((fDelay + fCastDur), SetLocalInt(oDoorLocker, "Triggered", 0));
 // }
    // If there was not a delay just use the length of the gas as the delay
 // else
 //{
   //   DelayCommand(fCastDur, SetLocalInt(oDoorLocker, "Triggered", 0));
  // }
 
 
   }