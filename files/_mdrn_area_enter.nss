/*
    Used as on_enter event for area. If area is to have a enter effect
    place the name of the script in the variable Enter on the area.
*/

#include "zep_inc_phenos"
#include "nw_i0_spells"

void main()
{
    object oEnter = GetEnteringObject();

    //get spellhooking to work for NPCs
    SetLocalInt(OBJECT_SELF,"X2_L_WILD_MAGIC",1);

    //keep count of PCs in area
    if (GetIsPC(oEnter))
    {
        int nPCs = GetLocalInt(OBJECT_SELF,"NumPCs");
        nPCs = nPCs+1;
        SetLocalInt(OBJECT_SELF,"NumPCs",nPCs);
    }

    //check if PC needs to float in space or swim underwater from area variable and if so do it
    if ((GetLocalInt(OBJECT_SELF,"Float")==1)&&(GetIsPC(oEnter)))
    {
        SetFootstepType(FOOTSTEP_TYPE_NONE,oEnter);
        zep_Fly(oEnter);
    }

    //check if PC needs to move slowly from area variable and if so do it
    if ((GetLocalInt(OBJECT_SELF,"Slow")==1)&&(GetIsPC(oEnter)))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSlow(), oEnter);
    }

    //check for specific area enter script and run if there is one
    string sScript = GetLocalString(OBJECT_SELF,"Enter");
    if (sScript!="") ExecuteScript(sScript,OBJECT_SELF);
}
