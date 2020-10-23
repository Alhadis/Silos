//::///////////////////////////////////////////////
//:: Name: pgs_mssngr_follw
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script, depending on the current state
    of the messenger will either start following,
    or stop following.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem_cnfg"

void main()
{
    if (GetLocalInt (OBJECT_SELF, "Messenger_Following"))
    {
        DeleteLocalInt (OBJECT_SELF, "Messenger_Following");

        //----------------------------------------
        //Stop following, and adjust max distance.
        //----------------------------------------
        AssignCommand (OBJECT_SELF, ClearAllActions());
        SetLocalFloat (OBJECT_SELF, "Max_Distance", PGS_MAX_MESSENGER_STAND_DISTANCE);
    }
    else
    {
        SetLocalInt (OBJECT_SELF, "Messenger_Following", TRUE);

        //----------------------------------------
        //Start following, and adjust max distance.
        //----------------------------------------
        AssignCommand (OBJECT_SELF, ActionForceFollowObject (GetLocalObject
            (OBJECT_SELF, "Temp_Player"), 3.0f));
        SetLocalFloat (OBJECT_SELF, "Max_Distance", PGS_MAX_MESSENGER_FOLLOW_DISTANCE);
    }
}
