//rs_onarea_enter
//sets up spawn wp's to start spawning
void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) && !GetIsDM(oPC))  //only run for PC's, not DM's nor NPC's
    {
        int iRunning = GetLocalInt(OBJECT_SELF, "Running");
        if(iRunning != 1)ExecuteScript("rs_spawn", OBJECT_SELF);//only run if not already running
    }
}
