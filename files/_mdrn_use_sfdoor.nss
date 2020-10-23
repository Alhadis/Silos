/*
    removes and places a blocking placeable to act as a force field, standard is red light bars VFX
    template of placeable to be supplied in variable Template
    if previously placed tag of door to be LDR_<tagofswitch>
    requires waypoint with LOC_<tagofswitch> at door location and orientation
*/
void main()
{
    // find the door if it exists
    object oDoor = GetNearestObjectByTag("LDR_"+GetTag(OBJECT_SELF));
    if (GetIsObjectValid(oDoor))
    {
        //if it exists remove it
        DestroyObject(oDoor);
    }
    else
    {
        //if it doesn't find the waypoint and place it
        location lLocation = GetLocation(GetNearestObjectByTag("LOC_"+GetTag(OBJECT_SELF)));
        CreateObject(OBJECT_TYPE_PLACEABLE,GetLocalString(OBJECT_SELF,"Template"),lLocation,FALSE,"LDR_"+GetTag(OBJECT_SELF));
    }
}
