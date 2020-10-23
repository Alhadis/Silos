#include "_mdrn_include"
#include "_mdrn_char_core"

//Gets the gun the oTarget is wielding, if not wielding, returns invalid object
object GetGun(object oTarget);

//Returns IP_CONST_ROF_* of the oItem to determine gun rate
int GetGunRate(object oItem);

//Returns ITEM_PROPERTY_MAG_* of the oItem to determine the gun magazine type
int GetGunMagazine(object oItem);

//Returns the number of rounds a gun has, Returns -1 on invalid, 0 on linked
int GetGunMagazineSize(object oItem);

//Returns BASE_ITEM_AMMO_* for the gun item type iItemtype
int GetAmmoType (int iItemType);

//Returns the INVENTORY_SLOT_* a gun item type is held in
int GetAmmoSlot(int iItemType);

// Returns the tag of the desired ammo
string GetAmmoBoxTag(string sAmmoType);

// Returns the tag of the desired ammo
string GetAmmoTag(object oAmmoBox, int iHeavy = FALSE, int iSling = FALSE);

// Returns the preset local string AmmoType, from a gun/launcher
string GetAmmoString(object oItem);

//Creates an ammunition "magazine" that contains either a set of arrows
//or bolts such that they are no greater than the MagSize
void CreateAmmoMag(object oTarget, object oCurAmmo, int iMagSize, string sAmmoType);

//When a mag is unequiped for example, destroys the "magazine" and puts it back into inventory
//as the miscelanions ammo rounds
void DestroyAmmoMag(object oTarget);

//Loads upon oTarget for oItem the Magazine needed for that gun
void ReloadAmmo( object oTarget, object oItem );

//When a gun is equiped remove the magazines equiped, and if not in combat, reload ammo
void ManageEquipedGuns(object oTarget, object oItem);

//Destroy any arrows/bolts (AMMO_SMALL, AMMO_HEAVY that were not equiped via ReloadAmmo
void ManageEquipedAmmo(object oTarget, object oItem);

//When a gun is unequiped replace the magazine that was equiped as well
void ManageUnequipedGuns(object oTarget, object oItem);

//When ammo is unequiped relace the magazine with the rounds misc. item
void ManageUnequipedAmmo(object oTarget, object oItem);

//Deals NPCs running out of ammo while in combat.
void ManageNPCCombatRoundEnd(object oCreature);

object GetGun(object oTarget){
    SendDebugMessage( "ROF-GetGun of: "+ GetName(oTarget) );

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
    int iBaseType = GetBaseItemType(oWeapon);

    if ( iBaseType == BASE_ITEM_SHORTBOW ||
         iBaseType == BASE_ITEM_LONGBOW ||
         iBaseType == BASE_ITEM_LIGHTCROSSBOW  ||
         iBaseType == BASE_ITEM_HEAVYCROSSBOW || iBaseType == BASE_ITEM_SLING)
    {
        SendDebugMessage( "ROF-GetGun Type : "+
        DebugGet2DAString("baseitems","Label",iBaseType ));
        SendDebugMessage("ROF-GetGunRate for: " + GetName(oWeapon));
        return oWeapon;
    }
    return InvalidObject();
}

int GetGunRate(object oItem)
{
    itemproperty ipCurProp = GetFirstItemProperty( oItem );

    while ( GetIsItemPropertyValid(ipCurProp) )
    {
        if ( ( GetItemPropertyType(ipCurProp) == ITEM_PROPERTY_RATE_OF_FIRE ) )
        {
            int iSubType = GetItemPropertySubType(ipCurProp);
            SendDebugMessage("ROF-GetGunRate is: " +
                DebugGet2DAString("iprp_rateoffire", "Label", iSubType));
            return iSubType;
        }
        ipCurProp = GetNextItemProperty( oItem );
    }

    return -1;
}


int GetGunMagazine(object oItem)
{
    itemproperty ipCurProp = GetFirstItemProperty( oItem );

    while ( GetIsItemPropertyValid(ipCurProp) )
    {
        if ( ( GetItemPropertyType(ipCurProp) == ITEM_PROPERTY_MAGAZINE ) ){
            int iSubType = GetItemPropertySubType(ipCurProp);
            SendDebugMessage("ROF-GetMagazine is: " +
                DebugGet2DAString("iprp_magazine", "Label", iSubType));
            return iSubType;
        }
        ipCurProp = GetNextItemProperty( oItem );
    }

    return -1;
}


int GetGunMagazineSize(object oItem)
{
    itemproperty ipCurProp = GetFirstItemProperty( oItem );

    while ( GetIsItemPropertyValid(ipCurProp) )
    {
        if ( ( GetItemPropertyType(ipCurProp) == ITEM_PROPERTY_MAGAZINE ) ){
            int iSubType = GetItemPropertyCostTableValue(ipCurProp);
            SendDebugMessage("ROF-GetMagazineSize is: " +
                DebugGet2DAString("iprp_magcapcost", "Label", iSubType));
            return iSubType;
        }
        ipCurProp = GetNextItemProperty( oItem );
    }

    return -1;
}

int GetAmmoType(int iItemType)
{
    switch(iItemType)
    {
        case BASE_ITEM_HEAVYARM_D12:
            return BASE_ITEM_AMMO_HEAVY;
        case BASE_ITEM_HEAVYARM_D10:
            return BASE_ITEM_AMMO_HEAVY;
        case BASE_ITEM_SMALLARM_D8:
            return BASE_ITEM_AMMO_SMALL;
        case BASE_ITEM_SMALLARM_D6:
            return BASE_ITEM_AMMO_SMALL;
        case BASE_ITEM_SLING:
            return BASE_ITEM_AMMO_SLING;
    }
    return FALSE;
}

int GetAmmoSlot(int iItemType)
{
    SendDebugMessage("Getting Ammo Slot");
    switch(iItemType)
    {
        case BASE_ITEM_AMMO_HEAVY:
            return INVENTORY_SLOT_AMMO_HEAVY;
        case BASE_ITEM_AMMO_SMALL:
            return INVENTORY_SLOT_AMMO_SMALL;
        case BASE_ITEM_AMMO_SLING:
            return INVENTORY_SLOT_BULLETS;
    }
    return FALSE;
}

string GetAmmoBoxTag(string sAmmoType)
{
    SendDebugMessage("Getting Ammo Box Tag");
    string sReturn;
    if (sAmmoType == "arrow")
        sReturn = "d20_arrows_001";
    else if (sAmmoType == "bolt")
        sReturn = "d20_bolts_001";
    else
        sReturn = "d20_ammo_box_" + sAmmoType;

    return sReturn;
}

string GetAmmoTag(object oAmmoBox, int iHeavy = FALSE, int iSling = FALSE)
{
    string sPrefix, sSuffix;
    string sResRef = GetResRef(oAmmoBox);
    string sAmmoType = GetAmmoString(oAmmoBox);

    if (sAmmoType == "arrow"
        || GetStringLeft(sResRef,10) == "d20_arrows")
    {
        sPrefix = "d20_arrow_";
        sSuffix = GetStringRight(sResRef,3);
        string sReturn = sPrefix + sSuffix;
        return sReturn;
    }
    else if (sAmmoType == "bolt"
             || GetStringLeft(sResRef,9) == "d20_bolts")
    {
        sPrefix = "d20_bolt_";
        sSuffix = GetStringRight(sResRef,3);
        string sReturn = sPrefix + sSuffix;
        return sReturn;
    }
    else if (GetResRef(oAmmoBox)=="_mdrn_rof_rounds" && iHeavy)
    {
        sPrefix = "_mdrn_rof_mag";
        sSuffix = "_ha";
        string sReturn = sPrefix + sSuffix;
        return sReturn;
    }
    else if (GetResRef(oAmmoBox)=="_mdrn_rof_rounds")
    {
        sPrefix = "_mdrn_rof_mag";
        sSuffix = "_sa";
        string sReturn = sPrefix + sSuffix;
        return sReturn;
    }
    else if (iHeavy)
    {
        sPrefix = "d20_ammo_";
        sSuffix = GetLocalString(oAmmoBox,"AmmoTypeHeavy");
        if (sSuffix == "")
        {
           sSuffix = GetStringRight(sResRef,3);
        }
        string sReturn = sPrefix + sSuffix;
        return sReturn;
    }
     else if (iSling)
    {
        sPrefix = "d20_ammo_";
        sSuffix = GetLocalString(oAmmoBox,"AmmoTypeSling");
        if (sSuffix == "")
        {
           sSuffix = GetStringRight(sResRef,3);
        }
        string sReturn = sPrefix + sSuffix;
        return sReturn;
    }
    sPrefix = "d20_ammo_";
    sSuffix = GetStringRight(sResRef,3);
    string sReturn = sPrefix + sSuffix;
    return sReturn;
}


string GetAmmoString(object oItem)
{
    string sAmmoType = GetLocalString(oItem,"AmmoType");
    return sAmmoType;
}


/*
string GetAmmoTemplate(int iItemType){
    SendDebugMessage("Getting Ammo Template");
    switch(iItemType){
        case BASE_ITEM_AMMO_HEAVY:
            return "_mdrn_rof_mag_ha";
        case BASE_ITEM_AMMO_SMALL:
            return "_mdrn_rof_mag_sa";
    }
    return FALSE;
}
*/

void CreateAmmoMag(object oTarget, object oCurAmmo, int iMagSize, string sAmmoType)
{
    SendDebugMessage( "ROF-CreateAmmoMag: ");
    object oMagazine = CreateItemOnObject(sAmmoType, oTarget, iMagSize);
    itemproperty ip = GetFirstItemProperty(oCurAmmo);
    while (GetIsItemPropertyValid(ip))
    {
        int iPropType = GetItemPropertyType(ip);
        itemproperty ipMag = GetFirstItemProperty(oMagazine);
        int iFound = FALSE;
        while (GetIsItemPropertyValid(ipMag))
        {
            int iAmmoType = GetItemPropertyType(ipMag);
            if (iAmmoType == iPropType)
            {
                iFound = TRUE;
                break;
            }
            ipMag = GetNextItemProperty(oMagazine);
        }
        if (!iFound)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ip,oMagazine);
        }
        ip = GetNextItemProperty(oCurAmmo);
    }
    int iAmmoType = GetBaseItemType(oMagazine);
    int iInvSlot;
    if (iAmmoType == BASE_ITEM_ARROW)
        iInvSlot = INVENTORY_SLOT_ARROWS;
    else if (iAmmoType == BASE_ITEM_BOLT)
        iInvSlot = INVENTORY_SLOT_BOLTS;
    else if (iAmmoType == BASE_ITEM_BULLET)
        iInvSlot = INVENTORY_SLOT_BULLETS;
    AssignCommand(oTarget, ClearAllActions());
    AssignCommand(oTarget,ActionEquipItem(oMagazine, iInvSlot));

}

void DestroyAmmoMag(object oTarget)
{
    SendDebugMessage( "ROF-DestroyAmmoMag: ");
    object oAmmo;
    object oMagazine = GetItemInSlot(INVENTORY_SLOT_BOLTS, oTarget);
    if(GetIsObjectValid(oMagazine))
    {
        string sResRef = GetResRef(oMagazine);
        string sPrefix;
        if (GetStringLeft(sResRef,9) == "d20_arrow")
            sPrefix = "d20_arrows_";
        else if (sResRef == "_mdrn_rof_mag_sa")
            sPrefix = "_mdrn_rof_rounds";
        else if (sResRef == "_mdrn_rof_mag_ha")
            sPrefix = "_mdrn_rof_rounds";

        else if (GetStringLeft(sResRef,8) == "d20_bolt")
            sPrefix = "d20_bolts_";
        else
            sPrefix = "d20_ammo_box_";

        string sSuffix = GetLocalString(oMagazine,"AmmoType");
        if (sSuffix == "")
            sSuffix = GetStringRight(sResRef,3);
        if (sSuffix == "_ha" || sSuffix == "_sa")
            sSuffix = "";
        oAmmo = CreateItemOnObject(sPrefix + sSuffix, oTarget, GetItemStackSize(oMagazine));
        itemproperty ip = GetFirstItemProperty(oMagazine);
        while (GetIsItemPropertyValid(ip))
        {
            int iPropType = GetItemPropertyType(ip);
            itemproperty ipAmmo = GetFirstItemProperty(oAmmo);
            int iFound = FALSE;
            while (GetIsItemPropertyValid(ipAmmo))
            {
                int iAmmoType = GetItemPropertyType(ipAmmo);
                if (iAmmoType == iPropType)
                {
                    iFound = TRUE;
                    break;
                }
                ipAmmo = GetNextItemProperty(oAmmo);
            }
            if (!iFound)
            {
                AddItemProperty(DURATION_TYPE_PERMANENT, ip,oAmmo);
            }
            ip = GetNextItemProperty(oMagazine);
        }
        DestroyObject(oMagazine);
    }
    oMagazine = GetItemInSlot(INVENTORY_SLOT_ARROWS, oTarget);
    if(GetIsObjectValid(oMagazine))
    {
        string sResRef = GetResRef(oMagazine);
        string sPrefix;
        if (GetStringLeft(sResRef,9) == "d20_arrow")
            sPrefix = "d20_arrows_";
        else if (sResRef == "_mdrn_rof_mag_sa")
            sPrefix = "_mdrn_rof_rounds";
        else if (sResRef == "_mdrn_rof_mag_ha")
            sPrefix = "_mdrn_rof_rounds";
        else if (GetStringLeft(sResRef,8) == "d20_bolt")
            sPrefix = "d20_bolts_";
        else
            sPrefix = "d20_ammo_box_";

        string sSuffix = GetLocalString(oMagazine,"AmmoType");
        if (sSuffix == "" || sSuffix == "arrow" || sSuffix == "bolt")
            sSuffix = GetStringRight(sResRef,3);
        if (sSuffix == "_ha" || sSuffix == "_sa")
            sSuffix = "";
        oAmmo = CreateItemOnObject(sPrefix + sSuffix, oTarget, GetItemStackSize(oMagazine));
        itemproperty ip = GetFirstItemProperty(oMagazine);
        while (GetIsItemPropertyValid(ip))
        {
            int iPropType = GetItemPropertyType(ip);
            itemproperty ipAmmo = GetFirstItemProperty(oAmmo);
            int iFound = FALSE;
            while (GetIsItemPropertyValid(ipAmmo))
            {
                int iAmmoType = GetItemPropertyType(ipAmmo);
                if (iAmmoType == iPropType)
                {
                    iFound = TRUE;
                    break;
                }
                ipAmmo = GetNextItemProperty(oAmmo);
            }
            if (!iFound)
            {
                AddItemProperty(DURATION_TYPE_PERMANENT, ip,oAmmo);
            }
            ip = GetNextItemProperty(oMagazine);
        }
        DestroyObject(oMagazine);
    }
    oMagazine = GetItemInSlot(INVENTORY_SLOT_BULLETS, oTarget);
    if(GetIsObjectValid(oMagazine))
    {
        string sResRef = GetResRef(oMagazine);
        string sPrefix;
        if (GetStringLeft(sResRef,9) == "d20_arrow")
            sPrefix = "d20_arrows_";
        else if (GetStringLeft(sResRef,8) == "d20_bolt")
            sPrefix = "d20_bolts_";
        else
            sPrefix = "d20_ammo_box_";

        string sSuffix = GetLocalString(oMagazine,"AmmoType");
        if (sSuffix == "" || sSuffix == "arrow" || sSuffix == "bolt")
            sSuffix = GetStringRight(sResRef,3);

        oAmmo = CreateItemOnObject(sPrefix + sSuffix, oTarget, GetItemStackSize(oMagazine));
        itemproperty ip = GetFirstItemProperty(oMagazine);
        while (GetIsItemPropertyValid(ip))
        {
            int iPropType = GetItemPropertyType(ip);
            itemproperty ipAmmo = GetFirstItemProperty(oAmmo);
            int iFound = FALSE;
            while (GetIsItemPropertyValid(ipAmmo))
            {
                int iAmmoType = GetItemPropertyType(ipAmmo);
                if (iAmmoType == iPropType)
                {
                    iFound = TRUE;
                    break;
                }
                ipAmmo = GetNextItemProperty(oAmmo);
            }
            if (!iFound)
            {
                AddItemProperty(DURATION_TYPE_PERMANENT, ip,oAmmo);
            }
            ip = GetNextItemProperty(oMagazine);
        }
        DestroyObject(oMagazine);
    }
}

void ReloadAmmo( object oTarget, object oItem )
{
    string sAmmoType = GetAmmoString(oItem);
    string sAmmoBoxTag = GetAmmoBoxTag(sAmmoType);
    if (sAmmoType == "")
    {
        // Legacy gun.
        sAmmoBoxTag = "legacy";
        sAmmoType = "legacy";
    }
    int iMagSize = GetGunMagazineSize(oItem);
    iMagSize = iMagSize + iMagSize*GetLocalInt(oTarget, "nDualMode");
    int iMaxSize = 0;
    object oMaxAmmo;

    object oCurAmmo = GetFirstItemInInventory(oTarget);
    int iCurSize = GetItemStackSize(oCurAmmo);
    string sResRef = GetResRef(oCurAmmo);
    while(GetIsObjectValid(oCurAmmo))
    {
        sResRef = GetResRef(oCurAmmo);

        if ( sAmmoType == "arrow")
        {
            if ( GetStringLeft( sResRef,10) == "d20_arrows" && iCurSize > iMaxSize)
            {
                oMaxAmmo = oCurAmmo;
                iMaxSize = iCurSize;
            }
        }
        else if ( sAmmoType == "bolt")
        {
            if( GetStringLeft( sResRef,9) == "d20_bolts"&& iCurSize > iMaxSize)
            {
                oMaxAmmo = oCurAmmo;
                iMaxSize = iCurSize;
            }
        }
        else if (sAmmoType == "legacy")
        {
            if( sResRef == "_mdrn_rof_rounds"&& iCurSize > iMaxSize)
            {
                oMaxAmmo = oCurAmmo;
                iMaxSize = iCurSize;
            }
        }
        else if ( sResRef == sAmmoBoxTag && iCurSize > iMaxSize)
            {
                oMaxAmmo = oCurAmmo;
                iMaxSize = iCurSize;
            }

        oCurAmmo = GetNextItemInInventory(oTarget);
        iCurSize = GetItemStackSize(oCurAmmo);
    }
    if (GetIsObjectValid(oMaxAmmo))
    {
        oCurAmmo=oMaxAmmo;
        sResRef = GetResRef(oCurAmmo);

        if ( sAmmoType == "arrow")
        {
            if ( GetStringLeft( sResRef,10) == "d20_arrows")
            {
                int iStackSize = GetItemStackSize(oCurAmmo);
                if(iMagSize>iStackSize)
                    iMagSize = iStackSize;
                else
                    SetItemStackSize(oCurAmmo, (iStackSize - iMagSize) );
                SetLocalInt(oTarget, "iROF_Reloading", TRUE);
                string sAmmoTag = GetAmmoTag(oCurAmmo, FALSE);
                CreateAmmoMag(oTarget, oCurAmmo, iMagSize, sAmmoTag);
                if(iMagSize>=iStackSize)
                    DestroyObject(oCurAmmo);
                return;

            }
        }
        else if ( sAmmoType == "legacy")
        {
            if ( sResRef == "_mdrn_rof_rounds")
            {
                int iStackSize = GetItemStackSize(oCurAmmo);
                if(iMagSize>iStackSize)
                    iMagSize = iStackSize;
                else
                    SetItemStackSize(oCurAmmo, (iStackSize - iMagSize) );
                SetLocalInt(oTarget, "iROF_Reloading", TRUE);
                string sAmmoTag = GetAmmoTag(oCurAmmo, FALSE);
                CreateAmmoMag(oTarget, oCurAmmo, iMagSize, sAmmoTag);
                if(iMagSize>=iStackSize)
                    DestroyObject(oCurAmmo);
                return;

            }
        }
        else if ( sAmmoType == "bolt")
        {
            if( GetStringLeft( sResRef,9) == "d20_bolts")
            {
                int iStackSize = GetItemStackSize(oCurAmmo);
                if(iMagSize>iStackSize)
                    iMagSize = iStackSize;
                else
                    SetItemStackSize(oCurAmmo, (iStackSize - iMagSize) );
                SetLocalInt(oTarget, "iROF_Reloading", TRUE);
                string sAmmoTag = GetAmmoTag(oCurAmmo, FALSE);
                CreateAmmoMag(oTarget, oCurAmmo, iMagSize, sAmmoTag);
                if(iMagSize>=iStackSize)
                    DestroyObject(oCurAmmo);
                return;

            }
        }
        else if ( sResRef == sAmmoBoxTag)
        {
            int iStackSize = GetItemStackSize(oCurAmmo);
            if(iMagSize>iStackSize)
                iMagSize = iStackSize;
            else
                SetItemStackSize(oCurAmmo, (iStackSize - iMagSize) );
            SetLocalInt(oTarget, "iROF_Reloading", TRUE);
            int iHeavy = FALSE;
            int iSling = FALSE;
            int iGunType = GetBaseItemType(oItem);
            if (  iGunType == BASE_ITEM_HEAVYARM_D12
                 || iGunType == BASE_ITEM_HEAVYARM_D10)
            {
                iHeavy = TRUE;
            }
            if (  iGunType == BASE_ITEM_SLING)
            {
                iSling = TRUE;
            }
            string sAmmoTag = GetAmmoTag(oCurAmmo, iHeavy, iSling);
            CreateAmmoMag(oTarget, oCurAmmo, iMagSize, sAmmoTag);
            if(iMagSize>=iStackSize)
                DestroyObject(oCurAmmo);
            return;

        }


    }
    if (GetIsPC(oTarget))
        SendMessageToPC(oTarget,"You have no ammunition for the "+GetName(oItem)+".");
    return;
}

void ManageEquipedGuns(object oTarget, object oItem)
{
    SendDebugMessage( "ROF-ManageEquipedGuns: "+ GetName(oTarget) );
    int iItemType = GetBaseItemType( oItem );
    if (iItemType == BASE_ITEM_HEAVYARM_D10 ||
        iItemType == BASE_ITEM_HEAVYARM_D12 ||
        iItemType == BASE_ITEM_SMALLARM_D6 ||
        iItemType == BASE_ITEM_SMALLARM_D8 || iItemType == BASE_ITEM_SLING)
    {
        DestroyAmmoMag(oTarget);
        if(!GetIsInCombat(oTarget))
            ReloadAmmo(oTarget, oItem);
        else if (GetHasFeat(FEAT_QUICK_RELOAD,oTarget))
           AssignCommand(oTarget,ActionUseFeat(FEAT_QUICK_RELOAD,oTarget));
    }
}

void ManageEquipedAmmo(object oTarget, object oItem)
{
    SendDebugMessage( "ROF-ManageEquipedAmmo: "+ GetName(oTarget) );
    int iROF_Reloading = GetLocalInt(oTarget, "iROF_Reloading");
    int iItemType = GetBaseItemType( oItem );

    if (!iROF_Reloading &&
       (iItemType == BASE_ITEM_AMMO_SMALL ||
        iItemType == BASE_ITEM_AMMO_HEAVY || iItemType == BASE_ITEM_BULLET) )
    {
        SendDebugMessage( "ROF-ManageEquipedAmmo: "+ GetName(oTarget) + " destroying " +
                GetName(oItem) );
        DestroyObject(oItem);
    }
    else if (iROF_Reloading &&
            (iItemType == BASE_ITEM_AMMO_SMALL ||
             iItemType == BASE_ITEM_AMMO_HEAVY || iItemType == BASE_ITEM_BULLET) )
    {
        SendDebugMessage( "ROF-ManageEquipedAmmo: "+ GetName(oTarget) + " loading reloaded ammo " +
                        GetName(oItem) );
    }
    SetLocalInt(oTarget, "iROF_Reloading", FALSE);
}

void ManageUnequipedGuns(object oTarget, object oItem)
{
    SendDebugMessage( "ROF-ManageUnEquipedGuns: "+ GetName(oTarget) );
    int iItemType = GetBaseItemType( oItem );
    if(iItemType == BASE_ITEM_HEAVYARM_D10 ||
       iItemType == BASE_ITEM_HEAVYARM_D12 ||
       iItemType == BASE_ITEM_SMALLARM_D6 ||
       iItemType == BASE_ITEM_SMALLARM_D8 || iItemType == BASE_ITEM_SLING || iItemType == 213)
    {
        SendDebugMessage( "ROF-ManageUnEquipedGuns: Gun unequiped"+ GetName(oTarget) );
        DestroyAmmoMag(oTarget);
    }
}

void ManageUnequipedAmmo(object oTarget, object oItem)
{
    SendDebugMessage( "ROF-ManageUnEquipedAmmo: "+ GetName(oTarget) );
    int iItemType = GetBaseItemType( oItem );
    if(iItemType == BASE_ITEM_AMMO_HEAVY ||
       iItemType == BASE_ITEM_AMMO_SMALL || iItemType == BASE_ITEM_BULLET)
    {
         if (GetItemStackSize(oItem)>1)
         {
             SendDebugMessage( "ROF-ManageUnEquipedAmmo: Ammo unequiped"+ GetName(oTarget) );
             DestroyAmmoMag(oTarget);
         }
    }

}

void ManageNPCAmmo(object oCreature)
{
    SendDebugMessage("ROF-ManageNPCAmmo");
    object oWeapon = GetGun(oCreature);
    int iWeaponType = GetBaseItemType(oWeapon);
    int iStackSize = GetItemStackSize(
                GetItemInSlot(GetAmmoSlot(GetAmmoType(iWeaponType)),oCreature));
    if( GetIsObjectValid(oWeapon) && iStackSize<2 ){
            SendDebugMessage("NPC Equiping Ammo " + IntToString(iStackSize));
            AssignCommand(oCreature, ClearAllActions());
            //SendMessageToAllDMs(GetName(oCreature)+" tries to reload.");
            AssignCommand(oCreature,ActionUseFeat(FEAT_RELOAD, oCreature));
            SetLocalInt(oCreature, "nMdrnNPCAmmo", 1);
            DelayCommand(12.0, SetLocalInt(oCreature, "nMdrnNPCAmmo", 0));
    }

}

