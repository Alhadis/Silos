#include "inc_setitm_utils"
#include "inc_loglevel"
const int BASE_ITEM_HEAVYPICKAXE = 301;

void MineOre(object oVein);
void VoidCreateItemOnObject(string sItemTemplate, object oTarget=OBJECT_SELF, int nStackSize=1, string sNewTag="");
int GetHasItemOfBaseType(object oCreature, int iBaseType);


void main()
{
    object oMiner = GetLastUsedBy();
    object oVein = OBJECT_SELF;
    object oEquipedWeaponR = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oMiner);
    //if oMiner has a pickaxe.

    if(GetHasItemOfBaseType(oMiner, BASE_ITEM_HEAVYPICKAXE)){
        trace("Equiped weapon: " + IntToString(GetBaseItemType(oEquipedWeaponR)));
        trace("BASE_ITEM_HEAVYPICKAXE: " + IntToString(BASE_ITEM_HEAVYPICKAXE));
        if(GetBaseItemType(oEquipedWeaponR) == BASE_ITEM_HEAVYPICKAXE){
            trace("Is depleted? " + IntToString(GetLocalInt(oVein, "DEPLETED")));
            if(!GetLocalInt(oVein, "DEPLETED")){
                AssignCommand(oMiner, MineOre(oVein));
                SetLocalInt(oVein, "DEPLETED", TRUE);
                DelayCommand(
                    10.0, 
                    ActionDoCommand(
                        SetLocalInt(oVein, "DEPLETED", FALSE)
                    )
                );
            } else {
                SpeakString("This vein has been depeleted.");
            }
        } else {
            SpeakString("I would be a waste to try and mine this without a pickaxe equiped.");
        }
    } else {
        SpeakString("You do not have the proper tool to do this.");
    }
}

void MineOre(object oVein)
{
    ActionMoveToObject(oVein, FALSE, 0.5);
    ActionAttack(oVein, TRUE);
    DelayCommand(5.0, ClearAllActions(TRUE));

    DelayCommand(
        5.0,
        VoidCreateItemOnObject(
            GetLocalString(oVein, "MINING_REWARD"),
            OBJECT_SELF,
            d3()
        )
    );
    DelayCommand(
        5.0,
        AssignCommand(
            oVein,
            ActionSpeakString("This vein is depeleted.")
        )
    );
}

void VoidCreateItemOnObject(string sItemTemplate, object oTarget=OBJECT_SELF, int nStackSize=1, string sNewTag="")
{
    trace("creating " + sItemTemplate + " on " + GetName(oTarget));
    CreateItemOnObject(sItemTemplate, oTarget, nStackSize, sNewTag);
}

int GetHasItemOfBaseType(object oCreature, int iBaseType)
{
    object oItem = GetFirstItemInInventory(oCreature);
    while(GetIsObjectValid(oItem)){
        if(GetBaseItemType(oItem) == iBaseType){
            return TRUE;
        }
        oItem = GetNextItemInInventory(oCreature);
    }

    struct EquipedItems equipedItems = GetEquipedItems(oCreature);
    if(GetBaseItemType(equipedItems.oArms) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oArrows) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oBelt) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oBolts) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oBoots) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oBullets) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oCarmour) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oChest) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oCloak) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oCweaponb) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oCweaponl) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oCweaponr) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oHead) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oLefthand) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oLeftring) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oNeck) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oRighthand) == iBaseType){
        return TRUE;
    }
    if(GetBaseItemType(equipedItems.oRightring) == iBaseType){
        return TRUE;
    }

    return FALSE;
}
