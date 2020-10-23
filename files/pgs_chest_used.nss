//::///////////////////////////////////////////////
//:: Name: pgs_chest_used
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnUsed event for storage chests.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem_terr"

void main()
{
    object oPlayer = GetLastUsedBy();

    if (GetLocalInt (OBJECT_SELF, "Currently_In_Use"))  /*Check if available.*/
    {
        SendMessageToPC (oPlayer, "This storage chest is currently in use.");
        return;
    }

    int iTerritory = GetPGSStorageTerritory (OBJECT_SELF);
    int iTerritoryGuild = GetTerritoryGuildNumber (iTerritory);
    object oCreature = GetTerritoryStorageCreature (iTerritory);
    vector vChest = GetPosition (OBJECT_SELF);
    int iCopyItems = FALSE;

    //--------------------------------------------
    //Create storage object - has actual storage.
    //--------------------------------------------
    object oUniqueStorage = CreateObject (OBJECT_TYPE_PLACEABLE, "storage_chest_u",
        Location (GetArea (OBJECT_SELF), Vector (vChest.x, vChest.y, vChest.z -
        10.0f), GetFacing (oPlayer)));

    //--------------------------------------------
    //Check for previous initialization of storage.
    //--------------------------------------------
    if (!GetIsObjectValid (oCreature))
        oCreature = CreateObject (OBJECT_TYPE_CREATURE, "storagecreature",
            GetLocation (OBJECT_SELF));

    else if (GetIsDM (oPlayer) || iTerritory == 0 || (GetLocalInt (oPlayer, "Player_Guild_Rank") == 4 && GetLocalInt (oPlayer, "Player_Guild_Number") == iTerritoryGuild))
        iCopyItems = TRUE;

    if (iCopyItems)
        PrintString ("DM has access to storage chests.");

    //--------------------------------------------
    //Make storage creature invis. to players.
    //--------------------------------------------
    ApplyEffectToObject (DURATION_TYPE_PERMANENT, EffectVisualEffect
        (VFX_DUR_CUTSCENE_INVISIBILITY), oCreature);

    //--------------------------------------------
    //Loop through items to calculate item count.
    //--------------------------------------------
    object oItem = GetFirstItemInInventory (oCreature);
    int iItemCount = 0;

    SetLocalInt (oPlayer, "Item_Transfer_In_Progress", TRUE);

    //--------------------------------------------
    //Copy storage items into storage chest.
    //--------------------------------------------
    while (GetIsObjectValid (oItem))
    {
        if (iCopyItems)
            CopyItem (oItem, oUniqueStorage);

        iItemCount++;
        oItem = GetNextItemInInventory (oCreature);
    }

    DeleteLocalInt (oPlayer, "Item_Transfer_In_Progress");
    SetLocalInt (OBJECT_SELF, "Item_Count", iItemCount);

    //--------------------------------------------
    //Store storage-related variables.
    //--------------------------------------------
    SetLocalInt (OBJECT_SELF, "Currently_In_Use", TRUE);
    SetLocalObject (oUniqueStorage, "Temp_Storage_Creature", oCreature);
    SetLocalObject (oUniqueStorage, "Temp_Storage_Chest", OBJECT_SELF);

    //--------------------------------------------
    //Give player access to storage inventory.
    //--------------------------------------------
    DelayCommand (1.0f, AssignCommand (oPlayer, ActionInteractObject
        (oUniqueStorage)));
}
