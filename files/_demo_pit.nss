void main()
{
    object oPC = GetEnteringObject();
    AssignCommand(oPC, ClearAllActions());
    location lTarg = GetLocation(GetWaypointByTag("wt_PitTarg"));

    AssignCommand(oPC, ActionJumpToLocation(lTarg));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 6.0));
}
