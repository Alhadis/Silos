//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 02-06-2019
//:://////////////////////////////////////////////

#include "x2_inc_itemprop"
#include "x3_inc_string"
#include "inc_combat"

void main()
{
    object oPC = GetEnteringObject(),
           oBanker = GetWaypointByTag("NW_GENERALSTORE"),
           oModule = GetModule();

    int iGPValue;

    //  Clear oPC action que
    AssignCommand(oPC, ClearAllActions(TRUE));

    //  Do a var check to reset the socket items var count.  If item doesn't have
    //  the var then we destroy it for GP.
    object oItem = GetFirstItemInInventory(oPC);

    while (GetIsObjectValid(oItem))
    {
        if (GetLocalInt(oItem, "SF_SOCKETS"))
        {
            SetLocalInt(oItem, "SF_SOCKETS", 8);
            IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);
        }
        else
        {
            iGPValue = GetGoldPieceValue(oItem);
            GiveGoldToCreature(oPC, iGPValue / 100);
            DestroyObject(oItem);
        }

        oItem = GetNextItemInInventory(oPC);
    }
    //  Spawn in NPC's
    if (!GetIsObjectValid(GetNearestObjectByTag("GENERALSTORE", oBanker)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "generalstore", GetLocation(oBanker));
    }

    //  Check if we are ready to start combat
    if (CheckCombatReady() == TRUE)
    {
        SetLocalInt(oModule, "COMBAT_READY", TRUE);
        SpeakString("COMBAT " +
        StringToRGBString("will commence in two minutes.", STRING_COLOR_WHITE), TALKVOLUME_SHOUT);
    }

    else
    {
        SpeakString("COMBAT " +
        StringToRGBString("will commence when two players enter the lobby", STRING_COLOR_WHITE), TALKVOLUME_SHOUT);
    }
}
