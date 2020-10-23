////////////////////////////////////////////////////////////////////////////////
//  Olander's Realistic Systems - HTF System - Water Source Trigger
//  ohtf_enwater
//  Originally By Don Anderson
//  dandersonru@msn.com
//
//  Reworked by Meaglyn 
//
//  Place this script in the Trigger On Enter Event
//
//  The trigger NAME should be set to the type of water source the trigger encloses.
//  Lake        : allows fishing and filling water containers
//  Stream      : allows fishing, filling water containers and panning for gold
//  Fountain    : allows filling water containers 
//  Well        : allows filling water containers 
//  Salt Water  : allows fishing
//
//  For filling water containers the trigger can have a string variable Drink set to 
//  a system dependent value. If not using this you can ignore it. 
// 
//  fishingrod.nss  - activation script for fishing rod tool. See that script for any 
//                    fishing specific variables that could be set on the trigger
//  goldpan.nss     - activation script for gold panning tool. See that script for any 
//                    panning specific variables that could be set on the trigger
//  
////////////////////////////////////////////////////////////////////////////////
void htfThrottleMessage(string sMsg, object oPC) {
        if (GetLocalInt(oPC, "htf_water_source_throttle")) {
                return;
        } else {
                FloatingTextStringOnCreature(sMsg, oPC);
                SetLocalInt(oPC,  "htf_water_source_throttle", TRUE);
                DelayCommand(10.0, DeleteLocalInt(oPC, "htf_water_source_throttle"));
        }
}



void main() {
        object oPC      = GetEnteringObject();

        if (!GetIsPC(oPC))
                return;

        object oTrigger = OBJECT_SELF;
        string sTName   = GetName(oTrigger);
        string sTrigger = GetLocalString(oTrigger, "Drink");
        if (sTrigger == "")
            sTrigger = GetTag(oTrigger);

        //You can add more types of Triggers by adding more -> || (sTName == "NAME HERE")//sTName == "Stream") 
        if (sTName == "Lake" || sTName == "Pond" || FindSubString(sTName, "Stream") != -1) {
                SetLocalInt(oPC,"WSOURCE",TRUE);
		SetLocalInt(oPC,"WFISHING",TRUE);
                SetLocalString(oPC,"WSOURCE",sTrigger);
                SetLocalString(oPC,"WATERBODY",sTName);
		SetLocalObject(oPC, "WATERTRIGGER", OBJECT_SELF);
                //FloatingTextStringOnCreature("This is a " + sTName + " to do some fishing or fill my Canteen or Water Bucket.", oPC)
                //htfThrottleMessage("This is a " + sTName + " to do some fishing or fill my Canteen or Water Bucket.", oPC);
        } else if (sTName == "Fountain" || sTName == "Well") {
                SetLocalInt(oPC,"WSOURCE",TRUE);
                SetLocalString(oPC,"WSOURCE",sTrigger);
                //FloatingTextStringOnCreature("Looks like I can refill my Water Canteen or Water Bucket here.", oPC);
                //htfThrottleMessage("Looks like I can refill my Water Canteen or Water Bucket here.", oPC);
        } else if (sTName == "Salt Water") {
                SetLocalInt(oPC,"WSOURCE",TRUE);
		SetLocalInt(oPC,"WFISHING",TRUE);
                SetLocalString(oPC,"WSOURCE","SaltWater");
                SetLocalString(oPC,"WATERBODY",sTName);
                //FloatingTextStringOnCreature("This is Salt Water you can fish from.", oPC); 
                //htfThrottleMessage("This is Salt Water you can fish in it.", oPC);
        }
}

