void main()
{
    location lLoc;
    object oWP = GetWaypointByTag("WPTELE1");
    lLoc = GetLocation(oWP);
    object oC = GetEnteringObject();
    if(!ReflexSave(oC,22))
        AssignCommand(oC,JumpToLocation(lLoc));

}
