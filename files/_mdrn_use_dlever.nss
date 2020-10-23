/*
    unlocks and opens a door shuts and locks a door as placeable is activated
    tag of door to be LDR_<tagoflever>
*/
void main()
{
    object oDoor = GetNearestObjectByTag("LDR_"+GetTag(OBJECT_SELF));
    // * note that nActive == 1 does  not necessarily mean the placeable is active
    // * that depends on the initial state of the object
    int nActive = GetLocalInt (OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE");
    // * Play Appropriate Animation
    if (!nActive)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF, "on", 1);
        if (GetIsObjectValid(oDoor))
        {
            ActionUnlockObject(oDoor);
            ActionOpenDoor(oDoor);
        }
    }
    else
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF, "on", 0);
        if (GetIsObjectValid(oDoor))
        {
            ActionCloseDoor(oDoor);
            ActionLockObject(oDoor);
        }
    }
    // * Store New State
    SetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE",!nActive);
}
