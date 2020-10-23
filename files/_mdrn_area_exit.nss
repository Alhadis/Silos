/*
    Used as on_exit event for areas
*/

#include "zep_inc_phenos"
#include "nw_i0_spells"

void main()
{
    object oExit = GetExitingObject();

    //keep count of PCs in area
    if (GetIsPC(oExit))
    {
        int nPCs = GetLocalInt(OBJECT_SELF,"NumPCs");
        nPCs = nPCs-1;
        SetLocalInt(OBJECT_SELF,"NumPCs",nPCs);
    }

    //check if PC needs to stop floating in space or swimming underwater from area variable and if so do it
    if (GetLocalInt(OBJECT_SELF,"Float")==1)
    {
        SetFootstepType(FOOTSTEP_TYPE_DEFAULT,oExit);
        zep_Fly_Land(oExit);
    }

    //in case they were slowed, remove it
    RemoveSpecificEffect(EFFECT_TYPE_SLOW,oExit);

    //check for specific area exit script and run if there is one
    string sScript = GetLocalString(OBJECT_SELF,"Exit");
    if (sScript!="") ExecuteScript(sScript,OBJECT_SELF);
}
