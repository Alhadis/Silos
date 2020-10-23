//gb_hydra_sp - Hydra On Spawn script
//
//Add regen (10 + HD) to hide if no regen property already there

void main()
{
object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, OBJECT_SELF);
int iHD = GetHitDice(OBJECT_SELF);
int iRegen = 10 + iHD;
if (iRegen > 20) iRegen = 20;
itemproperty ipRegen = ItemPropertyRegeneration(iRegen);
int iHasRegen = GetItemHasItemProperty(oHide, ITEM_PROPERTY_REGENERATION);
SetLocalInt(OBJECT_SELF, "Wait", -1);
SetLocalInt(OBJECT_SELF, "Counter", -1);

if (GetIsObjectValid(oHide) == FALSE || iHasRegen == TRUE) return;

AddItemProperty(DURATION_TYPE_PERMANENT, ipRegen, oHide);
}