/*
    Used as on_enter event for areas where there is 0 gravity
*/

#include "zep_inc_phenos"
void main()
{
    object oPC = GetEnteringObject();
    SetFootstepType(FOOTSTEP_TYPE_NONE, oPC);
    if (GetIsPC(oPC))
    {
        SetLocalInt(oPC,"Floating",1);
        zep_Fly(oPC);
    }
}
