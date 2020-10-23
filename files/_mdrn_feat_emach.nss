//Extreme Machine

#include "_mdrn_const"
#include "nw_i0_spells"
#include "x2_i0_spells"
#include "dmfi_dmw_inc"

void  AddGreaterEnhancementEffectToItem(object oMyWeapon, float fDuration, int nBonus)
{
   IPSafeAddItemProperty(oMyWeapon,ItemPropertyAttackBonus(nBonus), fDuration, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,TRUE);
   return;
}

void main()
{
    //Declare major variables
    object oItem;

    if (GetObjectType(GetSpellTargetObject()) == OBJECT_TYPE_CREATURE)
        oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, GetSpellTargetObject());
    else if (GetObjectType(GetSpellTargetObject())== OBJECT_TYPE_ITEM)
        oItem = GetSpellTargetObject();

    if(!GetIsObjectValid(oItem))
    {
        FloatingTextStringOnCreature("No item is available for use.", OBJECT_SELF, FALSE);
        return;
    }
    if (GetLocalInt(oItem,"nExtremeMach")==1)
    {
        FloatingTextStringOnCreature("You have already worked on this item.", OBJECT_SELF, FALSE);
        return;
    }
    //items must have electronic or mechanical elements
    if (GetLocalString(oItem, "Craft")!="Electronic" && GetLocalString(oItem, "Craft")!="Mechanical")
    {
        FloatingTextStringOnCreature("This item has no working parts.", OBJECT_SELF, FALSE);
        return;
    }

    //test for level of success
    int nRoll = d20();
    int nDuration = GetLevelByClass(CLASS_TYPE_TECHIE,OBJECT_SELF);
    int nTechLvl;
    if (GetLocalString(oItem, "Craft")=="Electronic")
        nTechLvl = GetSkillRank(SKILL_CRAFT_ELECTRONIC,OBJECT_SELF);
    else
        nTechLvl = GetSkillRank(SKILL_CRAFT_MECHANICAL,OBJECT_SELF);
    string sString = "Check, Roll 1d20:" + IntToString(nRoll) + " + Modifier:" + IntToString(nTechLvl) + " = Total:" + IntToString(nRoll + nTechLvl);
    sString = ColorText(sString, "cyan");
    nRoll = nRoll + nTechLvl;
    if (nRoll<15)
    {
        FloatingTextStringOnCreature(sString + "Your attempt to improve the item failed.", OBJECT_SELF);
        return;
    }
    //set bonus to a maximum bonus
    nTechLvl = 1;
    if (nRoll >= 20 && nDuration >= 6)
    {
        nTechLvl = 2;
    }
    if (nRoll >= 25 && nDuration >= 9)
    {
        nTechLvl = 3;
    }
    FloatingTextStringOnCreature(sString + "Your attempt improves the item for a while.", OBJECT_SELF);

    int nType = GetBaseItemType(oItem);
    if (GetMeleeWeapon(oItem) || GetWeaponRanged(oItem) || nType == 201 || nType == 212 || nType == 213
        || (nType >= 300 && nType <= 305) || (nType >= 308 && nType <= 310) || nType == 312 || nType == 313
        || (nType >= 316 && nType <= 324) || (nType >= 330 && nType <= 340) || (nType >= 342 && nType <= 344) || nType == 347)
    {
        SignalEvent(GetItemPossessor(oItem), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
        if (nDuration>0)
        {
            AddGreaterEnhancementEffectToItem(oItem, IntToFloat(nDuration*600), nTechLvl);
        }
        SetLocalInt(oItem,"nExtremeMach",1);
        DelayCommand(IntToFloat(nDuration*600),SetLocalInt(oItem,"nExtremeMach",0));
        //will it need repair
        if (d100()<25)
        {
            DelayCommand(IntToFloat(nDuration*600),AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackPenalty(4), oItem));
            DelayCommand(IntToFloat(nDuration*600),FloatingTextStringOnCreature("Your weapon appears to be misfiring.",GetItemPossessor(oItem)));
        }
    }
    else
    {
        itemproperty ipAdd;
        itemproperty ipProp = GetFirstItemProperty(oItem);
        while (GetIsItemPropertyValid(ipProp))
        {
            nType = GetItemPropertyType(ipProp);
            if (nType == ITEM_PROPERTY_AC_BONUS)
                ipAdd=ItemPropertyACBonus(nTechLvl);
            else if (nType == ITEM_PROPERTY_DAMAGE_REDUCTION)
                ipAdd=ItemPropertyDamageReduction(nTechLvl,nTechLvl);
            else if (nType == ITEM_PROPERTY_DAMAGE_RESISTANCE)
            {
                int nSubType = GetItemPropertySubType(ipProp);
                ipAdd=ItemPropertyDamageResistance(nSubType,nTechLvl);
            }
            else if (nType == ITEM_PROPERTY_SKILL_BONUS)
            {
                int nSubType = GetItemPropertySubType(ipProp);
                ipAdd=ItemPropertySkillBonus(nSubType,nTechLvl);
            }
            else if (nType == ITEM_PROPERTY_ABILITY_BONUS)
            {
                int nSubType = GetItemPropertySubType(ipProp);
                ipAdd=ItemPropertyAbilityBonus(nSubType,nTechLvl);
            }
            ipProp = GetNextItemProperty(oItem);
        }
        if (GetIsItemPropertyValid(ipAdd))
            AddItemProperty(DURATION_TYPE_TEMPORARY, ipAdd, oItem, IntToFloat(nDuration*600));
        else
        {
            FloatingTextStringOnCreature("The item's function cannot be improved.",OBJECT_SELF);
            return;
        }
    }

    //burn an action point
    object oPoint = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oPoint))
    {
        if (GetTag(oPoint) == "ActionPoint")
        {
            int nPoint = GetItemStackSize(oPoint);
            if (nPoint == 1)
                DestroyObject(oPoint);
            else
                SetItemStackSize(oPoint,nPoint - 1);
            break;
        }
        oPoint = GetNextItemInInventory(OBJECT_SELF);
    }
}
