//::///////////////////////////////////////////////
//:: Example XP2 OnItemEquipped
//:: x2_mod_def_equ
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnEquip Event
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

// Modified by Forrestwolf for the D20 Modern system.  This processes several things,
// and you should be sure to include all new lines below if adding to your own script.

// Begin new Modern material

#include "_mdrn_include"
#include "_mdrn_const"
#include "_mdrn_char_core"
#include "_mdrn_rof"
#include "x2_inc_switches"
#include "x2_inc_intweapon"
#include "inventoryhelpers"

void main()
{
    ExecuteScript("x2_mod_def_equ",OBJECT_SELF); // Default Bioware

    ExecuteScript("torch_onequip",OBJECT_SELF); // Realistic Torches
    ExecuteScript("mr_equip",OBJECT_SELF); //
    object oItem = GetPCItemLastEquipped();
    object oPC = GetPCItemLastEquippedBy();
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);

    // Chainsaw sound
    if (GetLocalInt(oItem, "nMdrnChainsaw")==1)
        AssignCommand(oPC, PlaySound("dssawup"));

    // You can't crawl in heavy armour
    if (GetPhenoType(oPC)==5 && GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_ROBE)>0)
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oItem));
        SendMessageToPC(oPC, "It's too hard to crawl in that outfit.");
        return;
    }

    // Work out where ammo should be
    int iBaseType = GetBaseItemType(oItem);
    if ( iBaseType == BASE_ITEM_AMMO_SMALL
         || iBaseType == BASE_ITEM_AMMO_HEAVY || iBaseType == BASE_ITEM_BULLET)
    {
        SetLocalInt(oItem, "InventorySlot", GetItemSlot(oItem, oPC));
    }

    SendDebugMessage( "ModEvent Equip: " +
                    GetName( oPC ) +
                    " - " +
                    GetTag( oItem ) );

    //Deal with unlimited ammunition weapons
    int nInfCheck = 0;
    object oGun1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oGun2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    if (GetItemHasItemProperty(oGun1, ITEM_PROPERTY_UNLIMITED_AMMUNITION))
        nInfCheck = 1;
    if (GetItemHasItemProperty(oGun2, ITEM_PROPERTY_UNLIMITED_AMMUNITION))
        nInfCheck = 1;
    if (GetLocalInt(oPC, "nd20Equip")==0 && nInfCheck == 0 && GetItemHasItemProperty(oItem, ITEM_PROPERTY_UNLIMITED_AMMUNITION)==FALSE)
    {
        SetLocalInt(oPC, "nd20Equip", 1);
        DelayCommand(2.0, SetLocalInt(oPC, "nd20Equip", 0));
        ManageEquipedAmmo( oPC, oItem );
        ManageEquipedGuns( oPC, oItem );
    }

    // reassess damage for unarmed fighting bonus feats
    if (GetHasFeat(FEAT_LIVINGWEAPON, oPC) || GetHasFeat(FEAT_MELEESMASH, oPC) || GetHasFeat(FEAT_IMPROVEDMELEESMASH, oPC) || GetHasFeat(FEAT_ADVANCEDMELEESMASH, oPC))
    {
        DelayCommand(2.0, ExecuteScript("_mdrn_exe_livwea", oPC));
    }

    // remove penalty from improvised weapon where appropriate
    object oGun = oItem;
    if (GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC))
    {
        itemproperty iRem = GetFirstItemProperty(oGun);
        while (GetIsItemPropertyValid(iRem))
        {
            if (GetItemPropertyType(iRem)==ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER)
            {
                int nCancel = 4;
                AssignCommand(oGun, AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonus(nCancel), oGun));
                if (GetHasFeat(FEAT_IMPROVISEDWEAPONDAMAGE, oPC))
                    AssignCommand(oGun, AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_MAGICAL, IP_CONST_DAMAGEBONUS_2), oGun));
                SetLocalInt(oGun, "nImprovised", 1);
            }
            iRem = GetNextItemProperty(oGun);
        }
    }

    // speed them up temporarily if quick on the draw
    if (GetWeaponRanged(oItem))
        if (GetHasFeat(FEAT_QUICKDRAW, oPC) && GetLocalInt(oPC, "nMdrnQuickDraw")==0)
        {
            SetLocalInt(oPC, "nMdrnQuickDraw", 1);
            DelayCommand(60.0, SetLocalInt(oPC, "nMdrnQuickDraw", 0));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectHaste(), oPC, 6.0);
        }

    // Set unfamiliar weapon attack reductions
    int nType = GetBaseItemType(oItem);
    if (nType == 8 || nType == 11 || nType == 7 || nType == 61)
    {
        if (GetHasFeat(FEAT_PERSONAL_FIREARMS_PROFICIENCY, oPC)==FALSE)
            AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(4), oPC));
    }
    if (nType == 6)
    {
        if (GetHasFeat(FEAT_EXOTIC_FIREARMS_PROFICIENCY, oPC)==FALSE)
            AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(4), oPC));
    }
    if (nType == BASE_ITEM_LONGSWORD || nType == BASE_ITEM_BATTLEAXE || nType == BASE_ITEM_BASTARDSWORD || nType == BASE_ITEM_HALBERD
        || nType == BASE_ITEM_GREATSWORD || nType == BASE_ITEM_GREATAXE || nType == BASE_ITEM_KATANA || nType == BASE_ITEM_MORNINGSTAR
        || nType == BASE_ITEM_RAPIER || nType == BASE_ITEM_SCIMITAR || nType == BASE_ITEM_DWARVENWARAXE || nType == 305 || nType == 316
        || nType == 318 || nType == 319 || nType == 320 || nType == 330)
    {
            if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ARCHAIC, oPC)==FALSE)
                AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(4), oPC));
    }
    if (nType == 12 || nType == BASE_ITEM_DIREMACE || nType == BASE_ITEM_DOUBLEAXE || nType == BASE_ITEM_HEAVYFLAIL || nType == BASE_ITEM_KAMA
        || nType == 42 || nType == BASE_ITEM_SHURIKEN || nType == 92 || nType == BASE_ITEM_WHIP || nType == 303 || nType == 304
        || nType == 321 || nType == 323 || nType == 324)
    {
        if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC, oPC)==FALSE)
            AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(4), oPC));
    }

    // Deal with armour profficiency issues for vests and other modern AC related items
    if (GetItemACValue(oItem) > 0 && GetItemACValue(oItem) < 4 && GetLocalInt(oItem, "ARMOR")==1)
    {
        if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_LIGHT, oPC)==FALSE)
        {
            AssignCommand(oPC, ClearAllActions());
            //AssignCommand(oPC, ActionUnequipItem(oItem));
            SendMessageToPC(oPC, "You do not have the required proficiency to equip this item, its benefit is reduced.");
            SetLocalInt(oItem,"OldACBonus",GetItemACValue(oItem));
            itemproperty ipAdd=ItemPropertyACBonus(1);
            IPSafeAddItemProperty(oItem, ipAdd);
        }
    }
    else if (GetItemACValue(oItem) > 3 && GetItemACValue(oItem) < 7 && GetLocalInt(oItem, "ARMOR")==1)
    {
        if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_MEDIUM, oPC)==FALSE)
        {
            AssignCommand(oPC, ClearAllActions());
            //AssignCommand(oPC, ActionUnequipItem(oItem));
            SendMessageToPC(oPC, "You do not have the required proficiency to equip this item, its benefit is reduced.");
            SetLocalInt(oItem,"OldACBonus",GetItemACValue(oItem));
            itemproperty ipAdd=ItemPropertyACBonus(2);
            IPSafeAddItemProperty(oItem, ipAdd);
        }
    }
    else if (GetItemACValue(oItem) > 7 && GetLocalInt(oItem, "ARMOR")==1)
    {
        if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_HEAVY, oPC)==FALSE)
        {
            AssignCommand(oPC, ClearAllActions());
            //AssignCommand(oPC, ActionUnequipItem(oItem));
            SendMessageToPC(oPC, "You do not have the required proficiency to equip this item, its benefit is reduced.");
            SetLocalInt(oItem,"OldACBonus",GetItemACValue(oItem));
            itemproperty ipAdd=ItemPropertyACBonus(3);
            IPSafeAddItemProperty(oItem, ipAdd);
        }
    }
    // Done D20 Modern Rules additions


    // -------------------------------------------------------------------------
    // Intelligent Weapon System
    // -------------------------------------------------------------------------
    if (IPGetIsIntelligentWeapon(oItem))
    {
        IWSetIntelligentWeaponEquipped(oPC,oItem);
        // prevent players from reequipping their weapon in
        if (IWGetIsInIntelligentWeaponConversation(oPC))
        {
                object oConv =   GetLocalObject(oPC,"X2_O_INTWEAPON_SPIRIT");
                IWEndIntelligentWeaponConversation(oConv, oPC);
        }
        else
        {
            //------------------------------------------------------------------
            // Trigger Drain Health Event
            //------------------------------------------------------------------
            if (GetLocalInt(oPC,"X2_L_ENSERRIC_ASKED_Q3")==1)
            {
                ExecuteScript ("x2_ens_dodrain",oPC);
            }
            else
            {
                IWPlayRandomEquipComment(oPC,oItem);
            }
        }
    }


     // -------------------------------------------------------------------------
     // Generic Item Script Execution Code
     // If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // it will execute a script that has the same name as the item's tag
     // inside this script you can manage scripts for all events by checking against
     // GetUserDefinedItemEventNumber(). See x2_it_example.nss
     // -------------------------------------------------------------------------
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_EQUIP);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }
     }
}
