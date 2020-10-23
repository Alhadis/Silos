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
int GetAmmoType(int iItemType);

//Returns the INVENTORY_SLOT_* a gun item type is held in
int GetAmmoSlot(int iItemType);

//Creates an ammunition "magazine" that contains either a set of arrows
//or bolts such that they are no greater than the MagSize
void CreateAmmoMag(object oTarget, object oCurAmmo, int iMagSize, int iAmmoType);

//When a mag is unequiped for example, destroys the "magazine" and puts it back into inventory
//as the miscelanions ammo rounds
void DestroyAmmoMag(object oTarget);

//Loads upon oTarget for oItem the Magazine needed for that gun
int ReloadAmmo( object oTarget, object oItem );

//When a gun is equiped remove the magazines equipted, and if not in combat, reload ammo
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

    if ( iBaseType == BASE_ITEM_HEAVYARM_D10 ||
         iBaseType == BASE_ITEM_HEAVYARM_D12 ||
         iBaseType == BASE_ITEM_SMALLARM_D6  ||
         iBaseType == BASE_ITEM_SMALLARM_D8 ){
            SendDebugMessage( "ROF-GetGun Type : "+
                DebugGet2DAString("baseitems","Label",iBaseType ));
            SendDebugMessage("ROF-GetGunRate for: " + GetName(oWeapon));
            return oWeapon;

     };
    return InvalidObject();
}

int GetGunRate(object oItem){
    itemproperty ipCurProp = GetFirstItemProperty( oItem );

    while ( GetIsItemPropertyValid(ipCurProp) )
    {
        if ( ( GetItemPropertyType(ipCurProp) == ITEM_PROPERTY_RATE_OF_FIRE ) ){
            int iSubType = GetItemPropertySubType(ipCurProp);
            SendDebugMessage("ROF-GetGunRate is: " +
                DebugGet2DAString("iprp_rateoffire", "Label", iSubType));
            return iSubType;
        }
        ipCurProp = GetNextItemProperty( oItem );
    }

    return -1;
}


int GetGunMagazine(object oItem){
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


int GetGunMagazineSize(object oItem){
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

int GetAmmoType(int iItemType){
    switch(iItemType){
        case BASE_ITEM_HEAVYARM_D10:
            return BASE_ITEM_AMMO_HEAVY;
        case BASE_ITEM_HEAVYARM_D12:
            return BASE_ITEM_AMMO_HEAVY;
        case BASE_ITEM_SMALLARM_D6:
            return BASE_ITEM_AMMO_SMALL;
        case BASE_ITEM_SMALLARM_D8:
            return BASE_ITEM_AMMO_SMALL;
    }
    return FALSE;
}

int GetAmmoSlot(int iItemType){
    SendDebugMessage("Getting Ammo Slot");
    switch(iItemType){
        case BASE_ITEM_AMMO_HEAVY:
            return INVENTORY_SLOT_AMMO_HEAVY;
        case BASE_ITEM_AMMO_SMALL:
            return INVENTORY_SLOT_AMMO_SMALL;
    }
    return FALSE;
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

void CreateAmmoMag(object oTarget, object oCurAmmo, int iMagSize, int iAmmoType){
    SendDebugMessage( "ROF-CreateAmmoMag: ");
    object oMagazine;

    if(iAmmoType == BASE_ITEM_AMMO_HEAVY){
        SendDebugMessage("Requires Heavy Ammo");
        SendDebugMessage("Creating Ammo: " + IntToString(iMagSize));
        oMagazine = CreateItemOnObject("_mdrn_rof_mag_ha", oTarget, iMagSize);
    }
    else if(iAmmoType == BASE_ITEM_AMMO_SMALL){
        SendDebugMessage("Requires Heavy Ammo");
        SendDebugMessage("Creating Ammo: " + IntToString(iMagSize));
        oMagazine = CreateItemOnObject("_mdrn_rof_mag_sa", oTarget, iMagSize);
    }
    itemproperty ip = GetFirstItemProperty(oCurAmmo);
    while (GetIsItemPropertyValid(ip)){
        AddItemProperty(DURATION_TYPE_PERMANENT, ip,oMagazine);
        ip = GetNextItemProperty(oCurAmmo);
    }
    AssignCommand(oTarget,ActionEquipItem(oMagazine, GetAmmoSlot(iAmmoType)));
}

void DestroyAmmoMag(object oTarget){
    SendDebugMessage( "ROF-DestroyAmmoMag: ");
    object oAmmo;
    object oMagazine = GetItemInSlot(INVENTORY_SLOT_AMMO_HEAVY, oTarget);
    if(GetIsObjectValid(oMagazine)){
        oAmmo = CreateItemOnObject("_mdrn_rof_rounds", oTarget, GetItemStackSize(oMagazine));
        itemproperty ip = GetFirstItemProperty(oMagazine);
        while (GetIsItemPropertyValid(ip)){
            AddItemProperty(DURATION_TYPE_PERMANENT, ip,oAmmo);
            ip = GetNextItemProperty(oMagazine);
        }
        DestroyObject(oMagazine);
    }
    oMagazine = GetItemInSlot(INVENTORY_SLOT_AMMO_SMALL, oTarget);
    if(GetIsObjectValid(oMagazine)){
        oAmmo = CreateItemOnObject("_mdrn_rof_rounds", oTarget, GetItemStackSize(oMagazine));
        itemproperty ip = GetFirstItemProperty(oMagazine);
        while (GetIsItemPropertyValid(ip)){
            AddItemProperty(DURATION_TYPE_PERMANENT, ip,oAmmo);
            ip = GetNextItemProperty(oMagazine);
        }
        DestroyObject(oMagazine);
    }

}

int ReloadAmmo( object oTarget, object oItem ){
    SendDebugMessage( "ROF-Reload: "+ GetName(oTarget) + " loading " +
                        GetName(oItem) );

    int iNeededAmmoType = GetAmmoType(GetBaseItemType( oItem ));
    int iMagSize = GetGunMagazineSize(oItem);

    object oCurAmmo = GetFirstItemInInventory(oTarget);
    int iMaxSize = 0;
    object oMaxAmmo;
    while(GetIsObjectValid(oCurAmmo) ){
        if( GetBaseItemType( oCurAmmo ) == BASE_ITEM_AMMO_ROUNDS )
        {

            if (GetItemStackSize(oCurAmmo)>iMaxSize)
            {
                oMaxAmmo = oCurAmmo;
                iMaxSize = GetItemStackSize(oCurAmmo);
            }
        }
        SendDebugMessage("Still looping after finding?");
        oCurAmmo = GetNextItemInInventory(oTarget);
    }
    if (GetIsObjectValid(oMaxAmmo))
    {
         oCurAmmo = oMaxAmmo;
         SendDebugMessage( "ROF-Reload: Found Usable Ammo " );

        int iStackSize = GetItemStackSize(oCurAmmo);

        SendDebugMessage( "ROF-Reload: Ammo Stack Size: " +
            IntToString(iStackSize));
        SendDebugMessage("MagSize: " + IntToString(iMagSize));

        if(iMagSize>iStackSize) iMagSize = iStackSize;
        else SetItemStackSize(oCurAmmo, (iStackSize - iMagSize) );

        SendDebugMessage("CurAmmoSize: " +
            IntToString(GetItemStackSize(oCurAmmo)));
        SetLocalInt(oTarget, "iROF_Reloading", TRUE);
        CreateAmmoMag(oTarget, oCurAmmo, iMagSize, iNeededAmmoType);
        if(iMagSize>=iStackSize) DestroyObject(oCurAmmo);
        return TRUE;
    }

    return FALSE;
}

void ManageEquipedGuns(object oTarget, object oItem){
    SendDebugMessage( "ROF-ManageEquipedGuns: "+ GetName(oTarget) );

    int iItemType = GetBaseItemType( oItem );
    if (iItemType == BASE_ITEM_HEAVYARM_D10 ||
        iItemType == BASE_ITEM_HEAVYARM_D12 ||
        iItemType == BASE_ITEM_SMALLARM_D6 ||
        iItemType == BASE_ITEM_SMALLARM_D8 ){
//        SetWeaponProfs(oTarget, oItem, iItemType );
        AssignCommand( oTarget,
                ActionUnequipItem( GetItemInSlot(INVENTORY_SLOT_AMMO_HEAVY, oTarget) ) );
        AssignCommand( oTarget,
                ActionUnequipItem( GetItemInSlot(INVENTORY_SLOT_AMMO_SMALL, oTarget) ) );
        if(!GetIsInCombat(oTarget))
            ReloadAmmo(oTarget, oItem);
        else if (GetHasFeat(FEAT_QUICK_RELOAD,oTarget))
            AssignCommand(oTarget,ActionUseFeat(FEAT_QUICK_RELOAD,oTarget));

    }

}

void ManageEquipedAmmo(object oTarget, object oItem){
    SendDebugMessage( "ROF-ManageEquipedAmmo: "+ GetName(oTarget) );

    int iROF_Reloading = GetLocalInt(oTarget, "iROF_Reloading");
    int iItemType = GetBaseItemType( oItem );

    if (!iROF_Reloading &&
       (iItemType == BASE_ITEM_AMMO_SMALL ||
        iItemType == BASE_ITEM_AMMO_HEAVY) ){
        SendDebugMessage( "ROF-ManageEquipedAmmo: "+ GetName(oTarget) + " destroying " +
                        GetName(oItem) );
        DestroyObject(oItem);
    }
    else if (iROF_Reloading &&
            (iItemType == BASE_ITEM_AMMO_SMALL ||
             iItemType == BASE_ITEM_AMMO_HEAVY) ){
        SendDebugMessage( "ROF-ManageEquipedAmmo: "+ GetName(oTarget) + " loading reloaded ammo " +
                        GetName(oItem) );
    }

    SetLocalInt(oTarget, "iROF_Reloading", FALSE);
}

void ManageUnequipedGuns(object oTarget, object oItem){
    SendDebugMessage( "ROF-ManageUnEquipedGuns: "+ GetName(oTarget) );
    int iItemType = GetBaseItemType( oItem );
    if(iItemType == BASE_ITEM_HEAVYARM_D10 ||
       iItemType == BASE_ITEM_HEAVYARM_D12 ||
       iItemType == BASE_ITEM_SMALLARM_D6 ||
       iItemType == BASE_ITEM_SMALLARM_D8){
        SendDebugMessage( "ROF-ManageUnEquipedGuns: Gun unequiped"+ GetName(oTarget) );
        DestroyAmmoMag(oTarget);
    }

}

void ManageUnequipedAmmo(object oTarget, object oItem){
    SendDebugMessage( "ROF-ManageUnEquipedAmmo: "+ GetName(oTarget) );
    int iItemType = GetBaseItemType( oItem );
    if(iItemType == BASE_ITEM_AMMO_HEAVY ||
       iItemType == BASE_ITEM_AMMO_SMALL ){
        if (GetItemStackSize(oItem)>1)
        {
        SendDebugMessage( "ROF-ManageUnEquipedAmmo: Ammo unequiped"+ GetName(oTarget) );
        DestroyAmmoMag(oTarget);
        }
    }

}

void ManageNPCAmmo(object oCreature){
    SendDebugMessage("ROF-ManageNPCAmmo");
    object oWeapon = GetGun(oCreature);
    int iWeaponType = GetBaseItemType(oWeapon);
    int iStackSize = GetItemStackSize(
                GetItemInSlot(GetAmmoSlot(GetAmmoType(iWeaponType)),oCreature));
    if( GetIsObjectValid(oWeapon) && iStackSize<1 ){
            SendDebugMessage("NPC Equiping Ammo " + IntToString(iStackSize));
            AssignCommand(oCreature,ActionUseFeat(FEAT_RELOAD, oCreature));
    }

}
