/*
    When placeable is used jump the PC to a waypoint LOC_<tag of placeable>
*/

void main( )
{
    object oPC = GetLastUsedBy();
    string sDestination = "LOC_"+GetTag(OBJECT_SELF);
    object oDestination = GetObjectByTag(sDestination);

    AssignCommand(oPC,ClearAllActions());
    DelayCommand(0.1,AssignCommand(oPC,ActionJumpToObject(oDestination,FALSE)));
}
