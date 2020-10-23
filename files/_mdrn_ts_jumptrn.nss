/*
    When trigger is entered jump the PC to a waypoint LOC_<tag of trigger>
*/

void main( )
{
    object oPC = GetEnteringObject();
    string sDestination = "LOC_"+GetTag(OBJECT_SELF);
    object oDestination = GetWaypointByTag(sDestination);

    AssignCommand(oPC,ClearAllActions());
    DelayCommand(0.1,AssignCommand(oPC,ActionJumpToObject(oDestination,FALSE)));
}
