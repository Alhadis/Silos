/*
    On use the door will play the open animation and will jump the user only when that is done.
    This allows for locks and traps to be set on a placeable.

    When used look for a nearby waypoint, use a variable on the waypoint
    and jump the PC using the placeable to the destination named in the variable
*/

#include "x0_i0_secret"

void main()
{
    object oUser = GetLastUsedBy();

    // Allow for traps and locks
    if (GetIsTrapped(OBJECT_SELF)) {return;}

    if (GetLocked(OBJECT_SELF))
    {
        // See if we have the key and unlock if so
        string sKey = GetTrapKeyTag(OBJECT_SELF);
        object oKey = GetItemPossessedBy(oUser, sKey);
        if (sKey != "" && GetIsObjectValid(oKey))
        {
            SendMessageToPC(oUser, GetStringByStrRef(7945));
            SetLocked(OBJECT_SELF, FALSE);
        }
        else
        {
            // Print '*locked*' message and play sound
            DelayCommand(0.1, PlaySound("as_dr_locked2"));
            FloatingTextStringOnCreature("*"
                                         + GetStringByStrRef(8307)
                                         + "*",
                                         oUser);
            SendMessageToPC(oUser, GetStringByStrRef(8296));
            return;
        }
    }

    // Handle opening/closing
    if (!GetIsSecretItemOpen(OBJECT_SELF))
    {
        // play animation of user opening it
        AssignCommand(oUser, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
        DelayCommand(1.0, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
        SetIsSecretItemOpen(OBJECT_SELF, TRUE);
    }
    else
    {
        // it's open -- go through and then close
        object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT,OBJECT_SELF);
        string sTag = GetLocalString(oWP,"Destination");

        oWP = GetObjectByTag(sTag);

        AssignCommand(oUser,ClearAllActions());
        DelayCommand(0.1,AssignCommand(oUser,ActionJumpToObject(oWP)));
        ActionPlayAnimation(ANIMATION_PLACEABLE_CLOSE);
        SetIsSecretItemOpen(OBJECT_SELF, FALSE);
    }
}
