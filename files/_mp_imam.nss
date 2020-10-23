#include "nbde_inc"
#include "pwfse_inc"

void main()
{
    object oPC = GetEnteringObject();

    NBDE_SetCampaignLocation("TerraEquilibrium","MP_lPC",GetLocation(oPC),oPC);
    NBDE_FlushCampaignDatabase("TerraEquilibrium");

    if(GetIsPC(oPC))
    {
    //    ExecuteScript("lts_emitter_oae", OBJECT_SELF);

    // only PC in the area ?
        if(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,GetFirstObjectInArea(OBJECT_SELF),2) == OBJECT_INVALID)
        {
            // yes , thus, area was empty before
            // activate spawns
            // SendMessageToPC(GetFirstPC(),"Reactivate all spawns");
            PWFSE_ActivateAllSpawnsInArea(OBJECT_SELF);
        }
    }
}
