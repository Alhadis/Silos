/*
    Script to jump PC to a specified waypoint or creature
    Facilitates changeable exit point such as for a vehicle
*/

void main( )
{
    object oPC = GetClickingObject();
    object oTarget;
    string sTag = GetLocalString(OBJECT_SELF,"Target");

    if (sTag != "")
    {
        //if specified use the tag on the door/placeable
        oTarget = GetObjectByTag(sTag);
    }
    else
    {
        //if not use the default creature instead
        oTarget = GetObjectByTag("_mdrn_cr_jumpto");
    }
    if (oTarget!=OBJECT_INVALID)
    {
        AssignCommand(oPC,ClearAllActions());
        DelayCommand(1.0,AssignCommand(oPC,ActionJumpToObject(oTarget)));
    }
    else
    {
        FloatingTextStringOnCreature("The vehicle cannot be exited.",oPC,FALSE);
        SendMessageToAllDMs("Jump creature is not placed.");
    }
}
