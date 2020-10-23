/*
    When used look for a nearby waypoint, use a variable on the waypoint
    and jump the PC using the placeable to the destination named in the variable
*/


void main( )
{
    object oPortal = OBJECT_SELF;
    object oPC = GetLastUsedBy();
    object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT,oPortal);
    string sTag = GetLocalString(oWP,"Destination");

    oWP = GetObjectByTag(sTag);

    AssignCommand(oPC,ClearAllActions());
    DelayCommand(0.1,AssignCommand(oPC,ActionJumpToObject(oWP)));
}

