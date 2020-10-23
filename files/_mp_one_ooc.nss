#include "nbde_inc"

void main()
{
    object oPC = GetEnteringObject();

    location lTarget = NBDE_GetCampaignLocation("TerraEquilibrium","MP_lPC",oPC);

    if(GetIsPC(oPC)) AssignCommand(oPC, ActionJumpToLocation(lTarget));
}
