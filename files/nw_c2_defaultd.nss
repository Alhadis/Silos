//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

#include "_mdrn_rof"

void main()
{
    switch(GetUserDefinedEventNumber()){
        case EVENT_END_COMBAT_ROUND:
            SendDebugMessage("CreatureEvent-EndCombatRoundUserDef");
            ManageNPCAmmo(OBJECT_SELF);
            break;
    }

    return;

}
