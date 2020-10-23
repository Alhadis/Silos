void main()
{
    string sDestination = GetTag(OBJECT_SELF);
    object oWaypoint = GetWaypointByTag(sDestination);
    location lLocation = GetLocation(oWaypoint);
    AssignCommand(GetLastUsedBy(), JumpToLocation(lLocation));
}
