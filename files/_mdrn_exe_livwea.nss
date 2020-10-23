#include "inc_d20"

void main()
{
    object oPC = OBJECT_SELF;
    //check for and re-apply feat based unarmed damage increases and recalculate
    effect eEff = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEff))
    {
        if (GetEffectType(eEff)==EFFECT_TYPE_DAMAGE_INCREASE && GetEffectCreator(eEff)==oPC)
        {
            RemoveEffect(oPC, eEff);
        }
        eEff = GetNextEffect(oPC);
    }
    int nDamB = 0;
    if (GetHasFeat(FEAT_LIVINGWEAPON, oPC) && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE  && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC))==FALSE)
    {
        int nLivingLevel = GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC);
        nDamB = nDamB + 2;
        if (nLivingLevel > 3)
            nDamB = nDamB + 2;
        if (nLivingLevel > 7)
            nDamB = nDamB + 2;
    }
    if (GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
    {
        if (GetHasFeat(FEAT_MELEESMASH, oPC) && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
        {
            nDamB = nDamB + 1;
        }
        if (GetHasFeat(FEAT_IMPROVEDMELEESMASH, oPC) && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
        {
            nDamB = nDamB + 1;
        }
        if (GetHasFeat(FEAT_ADVANCEDMELEESMASH, oPC) && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
        {
            nDamB = nDamB + 1;
        }
    }
    if (nDamB > 0)
    {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageIncrease(nDamB, DAMAGE_TYPE_BLUDGEONING), oPC));
        SetLocalInt(oPC, "nDamB", nDamB);
    }
}
