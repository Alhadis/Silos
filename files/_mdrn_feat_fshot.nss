// Far Shot - gives a single shot far away (or close).
#include "_mdrn_rof"
#include "_mdrn_include"
#include "x2_inc_itemprop"

void main()
{
    object oPC = OBJECT_SELF;
    object oTarg = GetSpellTargetObject();
    int nDam = 0;
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    //Check firearm type damage and reject if not firearm
    int iGunType = GetBaseItemType(oWeapon);
    if (iGunType == 6)
        nDam = d10(2);
    else if (iGunType == 8 || iGunType == 7)
        nDam = d8(2);
    else if (iGunType ==  11 || iGunType == BASE_ITEM_SLING)
        nDam = d6(2);
    if (nDam == 0)
    {
        SendMessageToPC(oPC, "Far Shot only works with firearms.");
        return;
    }
    //Deal with ammunition use
    int iAmmoType = GetAmmoType(iGunType);
    object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), oPC);
    int iAmmoCount = GetItemStackSize(oAmmo);
    if ( iAmmoCount == 0 ){
        SendMessageToPC(oPC, "You need ammo loaded for this.");
        return;
    }
    if( iAmmoCount==1)
        DestroyObject(oAmmo);
    else
        SetItemStackSize( oAmmo, iAmmoCount-1 );
    //Check for hit and deal any damage
    int nAC = GetAC(oTarg)-1;
    int nRoll = d20()+GetBaseAttackBonus(oPC)+GetAbilityModifier(ABILITY_DEXTERITY, oPC) -2;
    if (nRoll > nAC)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam, DAMAGE_TYPE_BALLISTIC), oTarg);
    }
}
