//:: Icequeen's Persistent Housing (10/28/08)
//:: On Disturbed Handler for "Doormat" (contains mortgage tool / key)

#include "iq_phs_db_inc"
#include "ginc_item"

void main()
{
object oPC = GetLastDisturbed();
object oItem = GetInventoryDisturbItem();
string sTag=GetTag(oItem);
if (GetInventoryDisturbType()== INVENTORY_DISTURB_TYPE_ADDED)
    {
    TransferItem(OBJECT_SELF, oPC, oItem);
    SendMessageToPC(oPC, "Items cannot be put into this container.");
    return;
    }

if (sTag == "iqphs_key")
    {
    object oDoor=GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF);
    DestroyObject(oItem);
    SetLocked(oDoor, FALSE);
    SendMessageToPC(oPC, "Your house door is now unlocked.");
    return;
    }

if (sTag == "iqphs_mrtg_tool")
    {
	DestroyObject(oItem);
	if (PHGetIsForSale(OBJECT_SELF)) SetLocalString(oPC, "Mortgage", "Buying");
	else SetLocalString(oPC, "Mortgage", "Selling");
    ActionStartConversation(oPC, "con_iqphs_mrtg");
    return;
    }
}