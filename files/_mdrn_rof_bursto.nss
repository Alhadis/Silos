// OLD Burst script - replaced by Forrestwolf

#include "_mdrn_rof"
#include "_mdrn_char_core"

void main()
{

    object oTarget = GetSpellTargetObject();

    SendDebugMessage("BurstFire by: " + GetName(OBJECT_SELF) + " On: " + GetName(oTarget) );
    if (oTarget==OBJECT_SELF){
        SendDebugMessage("FEAT-BurstFire: Invalid Target");
        return;
    }

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    GetGunRate(oWeapon);
    if (!GetIsObjectValid(oWeapon) ||
        GetGunRate(oWeapon) != IP_CONST_ROF_AUTOMATIC ){
        SendDebugMessage("BurstFire: Invalid Weapon");
        return;
    }

    SignalEvent(oTarget,EventSpellCastAt(OBJECT_SELF,GetSpellId(), TRUE));
    int iGunType = GetBaseItemType(oWeapon);
    int iAmmoType = GetAmmoType(iGunType);
    object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), OBJECT_SELF);
    int iAmmoCount = GetItemStackSize(oAmmo);
    if ( iAmmoCount < 5 ){
        SendDebugMessage("BurstFire: Invalid Ammo - " + IntToString(iAmmoCount));
        return;
    }
    if( (iAmmoCount-5)<1)
        DestroyObject(oAmmo);
    else
        SetItemStackSize( oAmmo, iAmmoCount-5 );


    effect eBurstAttackDecrease = SupernaturalEffect(EffectAttackDecrease(5,ATTACK_BONUS_ONHAND));
    if(!GetHasFeat(FEAT_BURST_FIRE, OBJECT_SELF)){
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBurstAttackDecrease, OBJECT_SELF, 2.0);
    }

    if(TouchAttackRanged(oTarget, TRUE)){
        effect eDamage;
        if(iGunType == BASE_ITEM_HEAVYARM_D10)
            eDamage = EffectDamage( d10(4), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
        else if(iGunType == BASE_ITEM_HEAVYARM_D12 )
            eDamage = EffectDamage( d12(4), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
        else if(iGunType == BASE_ITEM_SMALLARM_D6 )
                     eDamage = EffectDamage( d6(4), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
        else if(iGunType == BASE_ITEM_SMALLARM_D8)
            eDamage = EffectDamage( d8(4), DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);
        else
            eDamage = EffectDamage( 0, DAMAGE_TYPE_BALLISTIC,DAMAGE_POWER_NORMAL);

        effect eHit = EffectVisualEffect(VFX_COM_BLOOD_SPARK_MEDIUM);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHit, oTarget, 2.0);

        ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget);


    }


}

