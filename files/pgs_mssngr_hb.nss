//::///////////////////////////////////////////////
//:: Name: pgs_mssngr_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Heartbeat event for PGS Messengers.  This
    script is to ensure the messenger remains close
    to the player - if not, they "fly away."
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem_cnfg"

void main()
{
    object oPlayer = GetLocalObject (OBJECT_SELF, "Temp_Player");
    float fMaxDistance;

    //--------------------------------------------
    //Determine distance type to check against.
    //--------------------------------------------
    if (GetLocalInt (OBJECT_SELF, "Messenger_Following") == TRUE)
        fMaxDistance = PGS_MAX_MESSENGER_FOLLOW_DISTANCE;
    else
        fMaxDistance = PGS_MAX_MESSENGER_STAND_DISTANCE;

    //--------------------------------------------
    //Check for out-of-bounds by messenger creature.
    //--------------------------------------------
    if (GetDistanceToObject (oPlayer) > fMaxDistance)
    {
        SetLocalInt (OBJECT_SELF, "Out_Of_Bounds_Count", GetLocalInt (OBJECT_SELF,
            "Out_Of_Bounds_Count") + 1);

        //--------------------------------------------
        //If out of bounds max number of times, fly away.
        //--------------------------------------------
        if (GetLocalInt (OBJECT_SELF, "Out_Of_Bounds_Count") >= PGS_MESSENGER_HEARTBEAT_COUNT)
        {
            //--------------------------------------------
            //Inform player, and remove messenger.
            //--------------------------------------------
            SendMessageToPC (oPlayer, "You're messenger creature was unable " +
                "to keep, and has fled to the sky.");
            DeleteLocalObject (oPlayer, "Temp_Messenger_Creature");
            ApplyEffectToObject (DURATION_TYPE_INSTANT, EffectDisappear(), OBJECT_SELF);
        }
    }
    else
        DeleteLocalInt (OBJECT_SELF, "Out_Of_Bounds_Count");
}
