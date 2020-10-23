// Sharpshooting

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarg = GetSpellTargetObject();
    float fRange = GetDistanceToObject(oTarg);
    if (fRange < 200.0)
    {
        SendMessageToPC(oPC, "Target is too close to benefit; Far Shot is only useful at ranges greater than 200 meters.");
        return;
    }
    int nBonus = 0;
    int nDam = 0;
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int iBaseType = GetBaseItemType(oWeapon);
    if (iBaseType == 6)
        nDam = d8(2);
    if (iBaseType == 7)

        nDam = d8(2);

    if (iBaseType == 8)
        nDam = d8(2);
    if (iBaseType ==  11)
        nDam = d6(2);
    if (nDam == 0)
    {
        SendMessageToPC(oPC, "Far Shot only works with firearms.");
        return;

    }
    int nMode = GetLocalInt(oPC, "nFarShotMode");
    if (nMode == 0)
    {
        if (fRange < 300.0)
            nBonus = 2;
        if (fRange < 600.0)
            nBonus = 3;

        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(nBonus), oPC, 6.0));
        FloatingTextStringOnCreature(GetName(oPC)+" aims over a long distance at "+GetName(oTarg), oPC, TRUE);
        SetLocalInt(oPC, "nFarShotMode", 1);
        DelayCommand(6.0, SetLocalInt(oPC, "nFarShotMode", 0));
     }
     else
     {
        SendMessageToPC(oPC, "You must designate a Far Shot target once a round.");

     }

}
