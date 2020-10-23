//::///////////////////////////////////////////////
//:: Name
//:: FileName : rp_poxmer_sc2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This routine is invoked as a starting conditional
in the ox merchants conversation script. If it
returns TRUE then the merchant knows he has gotten
his gold and created the pack ox for the buyer.
*/
//:://////////////////////////////////////////////
//:: Created By: Rogers Pessin
//:: Created On: August 4, 2002
//:://////////////////////////////////////////////

#include "rp_poxmer_inc"

// If possible, sell an ox to the player and return the success or failure.
int StartingConditional()
{
    object oBuyer = GetPCSpeaker();

    if (!GetIsPC(oBuyer) || (oBuyer==OBJECT_INVALID)) return FALSE; // Let the merchant know the transaction failed.

    // If the speaker is "cute" (has a charisma >12) and is female, the
    // pack ox merchant will give her a discount... the flirt :)
    if((GetAbilityScore(oBuyer, ABILITY_CHARISMA) > 12) &&
        (GetGender(oBuyer)==GENDER_FEMALE))
    {
        iPriceForOx = iDiscountOxPrice;
    }

    // Check for enough gold.
    if (GetGold(oBuyer)<iPriceForOx) return FALSE; // Let the merchant know the transaction failed.

    // Take the gold and make a new ox for the buyer.
    TakeGoldFromCreature(iPriceForOx,oBuyer,TRUE);

    // Spawn new ox
        // The new ox will be spawned wherever the "rp_pox_sp2" waypoint has been set.
        object oSpawnPoint = GetNearestObjectByTag("rp_pox_sp2");

        // Make sure the waypoint has been placed, and if not, spawn on the selling merchant instead.
        if (oSpawnPoint==OBJECT_INVALID) oSpawnPoint=OBJECT_SELF;

        // Determine the actual location to spawn at.
        location lSpawnLocation = GetLocation(oSpawnPoint);

        // Spawn the new ox.
        object oNewOx = CreateObject(OBJECT_TYPE_CREATURE,"rp_pox002",lSpawnLocation, FALSE);

        // Setup the packs on the ox.
        int iCount = 0;
        object oPack = GetFirstItemInInventory(oNewOx);
        while (GetIsObjectValid(oPack))
        {
            if (GetTag(oPack)=="ATS_S_L901_N_SLH")
            {
                iCount++;
                SetLocalObject(oNewOx,"RP_PACK_NUM_"+IntToString(iCount),oPack);
            }
            oPack = GetNextItemInInventory(oNewOx);
        }
        SetLocalInt(oNewOx,"RP_PACK_COUNT",iCount);

    /* Give Pack Ox to PC
       Set a local variable on the ox to track its owner. The public portion of
       the owners CD Key is used to track owners, which means the player could
       log in with any of their characters and access the ox. */
    string sOwnerCDK = GetPCPublicCDKey(oBuyer);
    SetLocalString(oNewOx,"RP_OWNER_CDK",sOwnerCDK);
    SetLocalObject(oNewOx,"RP_OWNER",oBuyer);

    // Force the pack ox to follow its new owner at 10 feet.
    AssignCommand(oNewOx,ActionForceFollowObject(oBuyer,FeetToMeters(10.0)));
    SetLocalInt(oNewOx,"RP_OX_STATUS",10);

    return TRUE; // Let the merchant know the transaction went well.
}
