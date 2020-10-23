//::///////////////////////////////////////////////
//:: Name: pgs_chest_dsturb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnDisturb event for guild storage chests.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetLastDisturbed();

    //--------------------------------------------
    //Check if the script should proceed.
    //--------------------------------------------
    if (((!GetIsPC (oPlayer)) && (!GetIsDM (oPlayer))) || (GetLocalInt (OBJECT_SELF, "Item_Transfer_In_Progress")))
        return;

    object oChest = GetLocalObject (OBJECT_SELF, "Temp_Storage_Chest");
    object oItem = GetInventoryDisturbItem();
    int iItemCount = GetLocalInt (oChest, "Item_Count");

    //--------------------------------------------
    //Determine if item was added or removed.
    //--------------------------------------------
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        if (iItemCount == GetMaxHitPoints (oChest))  /*Check for more room.*/
        {
            SendMessageToPC (oPlayer, "This storage chest is currently at " +
                "maximum capacity.");
            CopyItem (oItem, oPlayer);  /*Bypass OnDisturbed event again.*/
            DestroyObject (oItem);
        }
        else if (GetHasInventory (oItem))
        {
            SendMessageToPC (oPlayer, "Containers may not be stored in here.");
            CopyItem (oItem, oPlayer);  /*Bypass OnDisturbed event again.*/
            DestroyObject (oItem);
        }
        else if (GetTag (oItem) == "NW_IT_GOLD001")
        {
            int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");

            if (iGuild != 0)
            {
                int iAmount = GetItemStackSize (oItem);

                //---------------------------------------------
                //Take player gold and add it to guild account.
                //---------------------------------------------
                SetModuleGuildAccountValue (iGuild, GetModuleGuildAccountValue
                    (iGuild) + iAmount);
                SendPGSGuildNotice (iGuild, GetName (oPlayer) + " has donated " +
                    IntToString (iAmount) + " gold piece(s) to the guild account.");
                DestroyObject (oItem);
            }
        }
        else  /*Valid item to store in chest.*/
        {
            //---------------------------------------------
            //Store item on storage creature for persistency.
            //---------------------------------------------
            CopyItem (oItem, GetLocalObject (OBJECT_SELF, "Temp_Storage_Creature"));

            //---------------------------------------------
            //Increment storage count and inform player.
            //---------------------------------------------
            SetLocalInt (oChest, "Item_Count", iItemCount + 1);
            SendMessageToPC (oPlayer, "Item has succesfully been added to " +
                "the storage chest.");
        }
    }
    else  /*Item has been removed.*/
    {
        object oStorage = GetLocalObject (OBJECT_SELF, "Temp_Storage_Creature");
        object oItemLoop = GetFirstItemInInventory (oStorage);

        //--------------------------------------------
        //Find item on storage creature and remove it.
        //--------------------------------------------
        while (GetIsObjectValid (oItemLoop))
        {
            //--------------------------------------------
            //Check item resref and stack count for match.
            //--------------------------------------------
            if ((GetResRef (oItem) == GetResRef (oItemLoop)) && (GetItemStackSize (oItem) == GetItemStackSize (oItemLoop)))
            {
                DestroyObject (oItemLoop);
                break;
            }

            oItemLoop = GetNextItemInInventory (oStorage);
        }

        //--------------------------------------------
        //Decrement item count, and inform player.
        //--------------------------------------------
        SetLocalInt (oChest, "Item_Count", iItemCount - 1);
        SendMessageToPC (oPlayer, "Item has succesfully been removed from the " +
            "storage chest.");
    }
}
