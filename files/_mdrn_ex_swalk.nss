/*
    Used as on_exit event for areas where there is 0 gravity
*/

#include "zep_inc_phenos"
void main()
{
    object oPC = GetExitingObject();
    SetFootstepType(FOOTSTEP_TYPE_DEFAULT, oPC);
    if (GetIsPC(oPC))
    {
        SetLocalInt(oPC,"Floating",0);
        zep_Fly_Land(oPC);
    }
}
