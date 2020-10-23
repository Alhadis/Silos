//::///////////////////////////////////////////////
//:: Example XP2 OnItemEquipped
//:: x2_mod_def_unequ
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnUnEquip Event
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

// Modified by Forrestwolf for D20 Modern.  Be sure to include all new lines below if adding to your own script.

// Begin D20 Modern additions.

#include "_mdrn_const"
#include "_mdrn_include"
#include "_mdrn_char_core"
#include "_mdrn_rof"
#include "x2_inc_switches"
#include "x2_inc_intweapon"

void main()
{
    ExecuteScript("x2_mod_def_unequ",OBJECT_SELF); // Default Bioware


    ExecuteScript("torch_onunequip",OBJECT_SELF); // Realistic Torches
    ExecuteScript("mr_unequip",OBJECT_SELF); //
    object oItem = GetPCItemLastUnequipped();
    object oPC   = GetPCItemLastUnequippedBy();
    if (GetLocalInt(oItem, "nMdrnChainsaw")==1)
            AssignCommand(oPC, PlaySound("dssawidl"));

    SendDebugMessage( "ModEvent Unequip: " +
                    GetName(oPC) +
                    " - " +
                    GetTag(oItem) );

    // Keeps bullets from getting pulled out of slot
    int iBaseType = GetBaseItemType(oItem);
    if ( iBaseType == BASE_ITEM_AMMO_SMALL
         || iBaseType == BASE_ITEM_AMMO_HEAVY || iBaseType == BASE_ITEM_BULLET)
    {
        if (GetLocalInt(oPC,"iROF_Reloading") == FALSE && GetIsPC(oPC))
        {
            int nSlot = GetAmmoSlot(iBaseType);
            //if (GetItemStackSize(oItem) > 0)
            //    SendMessageToPC(oPC, "You cannot remove a magazine in this way!");
            AssignCommand(oPC,ActionEquipItem(oItem,nSlot));
            return;
        }
    }

    //Deal with unlimited ammunition weapons
    int nInfCheck = 0;
    object oGun1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oGun2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    if (GetItemHasItemProperty(oGun1, ITEM_PROPERTY_UNLIMITED_AMMUNITION))
       nInfCheck = 1;
    if (GetItemHasItemProperty(oGun2, ITEM_PROPERTY_UNLIMITED_AMMUNITION))
        nInfCheck = 1;
    if (GetLocalInt(oPC, "nd20Unequip")==0 && nInfCheck == 0 && GetItemHasItemProperty(oItem, ITEM_PROPERTY_UNLIMITED_AMMUNITION)==FALSE)
    {
        SetLocalInt(oPC, "nd20Unequip", 1);
        DelayCommand(0.2, SetLocalInt(oPC, "nd20Unequip", 0));
        ManageUnequipedGuns(oPC,oItem);
        ManageUnequipedAmmo(oPC, oItem);
    }

    // Stop occupation ring and skins being removed
    if (GetTag(oItem)=="occupation" && GetLocalInt(oPC, "nMdrnOccuSet")==0)
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_LEFTRING));
    }
    if (GetResRef(oItem) == "_mdrn_pc_skin")
        EquipPCCore( GetPCItemLastUnequippedBy() );

    //handle dual wield weapon exchange
    if (GetBaseItemType(oItem)==BASE_ITEM_SLING && GetLocalInt(oPC, "nMdrnDual")==0)
    {
        SetLocalInt(oPC, "nMdrnDual", 1);
        DelayCommand(0.2, SetLocalInt(oPC, "nMdrnDual", 0));
        SetLocalInt(oPC, "nDualMode", 0);
        SetLocalObject(oItem, "oPC", oPC);
        ExecuteScript("_mdrn_exe_udual", oItem);
        CreateItemOnObject(GetTag(oItem), oPC);
        object oItem2 =GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
        if (GetBaseItemType(oItem2)==213)
        {
            CreateItemOnObject(GetTag(oItem2), oPC);
            DestroyObject(oItem2);
        }
        DestroyObject(oItem);
    }
    else if (GetBaseItemType(oItem)==213&& GetLocalInt(oPC, "nMdrnDual")==0)
    {
        SetLocalInt(oPC, "nMdrnDual", 1);
        DelayCommand(0.2, SetLocalInt(oPC, "nMdrnDual", 0));
        SetLocalInt(oPC, "nDualMode", 0);

        CreateItemOnObject(GetTag(oItem), oPC);
        object oItem2 =GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        if (GetBaseItemType(oItem2)==BASE_ITEM_SLING)
        {
            SetLocalObject(oItem2, "oPC", oPC);
            ExecuteScript("_mdrn_exe_udual", oItem2);
            CreateItemOnObject(GetTag(oItem2), oPC);
            DestroyObject(oItem2);
        }
        DestroyObject(oItem);

    }

    // reassess damage for unarmed fighting bonus feats
    if (GetHasFeat(FEAT_LIVINGWEAPON, oPC) || GetHasFeat(FEAT_MELEESMASH, oPC) || GetHasFeat(FEAT_IMPROVEDMELEESMASH, oPC) || GetHasFeat(FEAT_ADVANCEDMELEESMASH, oPC))
    {
        DelayCommand(2.0, ExecuteScript("_mdrn_exe_livwea", oPC));

    }

    // add penalty back onto improvised weapons where appropriate
    if (GetLocalInt(oItem, "nImprovised")==1)
    {
        itemproperty iRem = GetFirstItemProperty(oItem);
        while (GetIsItemPropertyValid(iRem))
        {
            if (GetItemPropertyType(iRem)==ITEM_PROPERTY_ATTACK_BONUS || GetItemPropertyType(iRem)==ITEM_PROPERTY_DAMAGE_BONUS)
                RemoveItemProperty(oItem, iRem);
            iRem = GetNextItemProperty(oItem);
        }
    }

    // remove any attack decrease penalties
    effect eRem = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRem))
    {
        if (GetEffectCreator(eRem) == oItem && GetEffectType(eRem) == EFFECT_TYPE_ATTACK_DECREASE)
            RemoveEffect(oPC, eRem);

        eRem = GetNextEffect(oPC);
    }

    // remove burst mode effect decreases
    if (GetLocalInt(oPC, "nBurstMode")==1 && GetWeaponRanged(oItem))
    {
        while (GetIsEffectValid(eRem))
        {
            if (GetEffectCreator(eRem) == oPC && GetEffectType(eRem) == EFFECT_TYPE_ATTACK_DECREASE)
                RemoveEffect(oPC, eRem);

            eRem = GetNextEffect(oPC);
        }
        SetLocalInt(oPC, "nBurstMode", 0);
    }

    // reinstate AC bonus reduction from armour profficiency issues for modern AC related items
    if (GetLocalInt(oItem,"OldACBonus") != 0)
    {
        itemproperty ipAdd=ItemPropertyACBonus(GetLocalInt(oItem,"OldACBonus"));
        IPSafeAddItemProperty(oItem, ipAdd);
        SetLocalInt(oItem,"OldACBonus",0);
    }

    //destroy unequipped psi-blade
    if (GetTag(oItem) == "_mdrn_it_psiblad")
    {
        SendMessageToPC(oPC, "Psi-blade manifestation ended.");
        DestroyObject(oItem,0.5);
    }

    // End D20 Modern Rules additions

    // -------------------------------------------------------------------------
    //  Intelligent Weapon System
    // -------------------------------------------------------------------------
    if (IPGetIsIntelligentWeapon(oItem))
    {
            IWSetIntelligentWeaponEquipped(oPC,OBJECT_INVALID);
            IWPlayRandomUnequipComment(oPC,oItem);
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
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNEQUIP);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }
}
