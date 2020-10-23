/*
    Widget to add or remove floating effect, as if in space or underwater, to and from areas.
    DM needs to be in the area.
*/

#include "zep_inc_phenos"
void main()
{
    object oPC = OBJECT_SELF;

    if (!GetIsDM(oPC))
    {
        SendMessageToPC(oPC,"You must be a DM to use this item.");
        return;
    }
    object oArea = GetArea(oPC);
    if (GetLocalInt(oArea,"Float")==0)
    {
        SetLocalInt(oArea,"Float",1);
        oPC = GetFirstPC();
        while (GetIsObjectValid(oPC))
        {
            if(oArea == GetArea(oPC))
            {
                SetFootstepType(FOOTSTEP_TYPE_NONE,oPC);
                zep_Fly(oPC);
            }
            oPC = GetNextPC();
        }
    }
    else
    {
        SetLocalInt(oArea,"Float",0);
        oPC = GetFirstPC();
        while (GetIsObjectValid(oPC))
        {
            if(oArea == GetArea(oPC))
            {
                SetFootstepType(FOOTSTEP_TYPE_DEFAULT,oPC);
                zep_Fly_Land(oPC);
            }
            oPC = GetNextPC();
        }
    }
}
