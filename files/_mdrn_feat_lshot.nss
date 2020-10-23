// Lightning Shot
#include "_mdrn_rof"

void main()
{
    object oPC = OBJECT_SELF;
    object oTarg = GetSpellTargetObject();
    int nMode = GetLocalInt(oPC, "nLightShot");
    int nDam = 0;
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int iGunType = GetBaseItemType(oWeapon);

    //check gun type and set damage
    if (iGunType == 8)
        nDam = d8(2);
    if (iGunType ==  11)
        nDam = d6(2);
    if (nDam == 0)
    {
        SendMessageToPC(oPC, "Lightning Shot only works with personal firearms.");
        return;
    }
    //check ammunition
    int iAmmoType = GetAmmoType(iGunType);
    object oAmmo = GetItemInSlot(GetAmmoSlot(iAmmoType), oPC);
    int iAmmoCount = GetItemStackSize(oAmmo);
    if ( iAmmoCount <= 1 )
    {
        SendMessageToPC(oPC, "You need more ammo loaded for this.");
        return;
    }

    if( iAmmoCount==2)
        DestroyObject(oAmmo);
    else
        SetItemStackSize( oAmmo, iAmmoCount-2 );
    if (nMode == 0)
    {
        int nAC = GetAC(oTarg)-1;
        int nRoll = d20() + GetBaseAttackBonus(oPC) + GetAbilityModifier(ABILITY_DEXTERITY, oPC);
        if (nRoll > nAC)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam), oTarg);
        }
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackDecrease(2), oPC, 6.0);
        nRoll = d20() + GetBaseAttackBonus(oPC) + GetAbilityModifier(ABILITY_DEXTERITY, oPC);
        FloatingTextStringOnCreature(GetName(oPC)+" takes an extra shot at "+GetName(oTarg)+"; "+IntToString(nRoll)+" vs. AC: "+IntToString(nAC+1), oPC, TRUE);
        if (nRoll > nAC)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDam), oTarg);
        }
        SetLocalInt(oPC, "nLightShot", 1);
        DelayCommand(6.0, SetLocalInt(oPC, "nLightShot", 0));
    }
    else
        SendMessageToPC(oPC, "Lightning Shot can only be used once a round.");
}
