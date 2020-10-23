// Iron Fist
#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    int nLevel = GetHitDice(oPC);
    int nMartial = GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC);
    if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==TRUE || GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC))==TRUE)
    {
        SendMessageToPC(oPC, "This must be used while unarmed.");
        return;

    }


    object oAP = GetItemPossessedBy(oPC, "ActionPoint");
    if (nLevel > 9)
    {
           int nSize = GetItemStackSize(oAP);
            if (GetLocalInt(oPC, "nAPUse")==1)
            {
                SendMessageToPC(oPC, "Action Boost or Action Points can be used only once per round.");
                return;

            }
            SetLocalInt(oPC, "nAPUse", 1);
            DelayCommand(6.0, SetLocalInt(oPC, "nAPUse", 0));

            if (GetIsObjectValid(oAP)==FALSE || nSize < 2)
            {
                SendMessageToPC(oPC, "You must have 2 Action Points in a stack to use this feat.");
                return;

            }
            SetPlotFlag(oAP, FALSE);
            if (nSize > 2)
                SetItemStackSize(oAP, nSize - 2);
            else
                DestroyObject(oAP);
            DelayCommand(0.5, SetPlotFlag(oAP, TRUE));
            int nRoll = d6(2);
            if (nLevel > 7)
                nRoll = nRoll + d6(2);
            if (nLevel > 14)
                nRoll = nRoll + d6(2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDamageIncrease(nRoll), oPC, 6.0);



    }
    else
    {
        if (GetLocalInt(oPC, "nAPUse")==1)
        {
            SendMessageToPC(oPC, "Only 1 AP can be used per round.");
            return;

        }
        SetLocalInt(oPC, "nAPUse", 1);
        DelayCommand(6.0, SetLocalInt(oPC, "nAPUse", 0));
        if (GetIsObjectValid(oAP)==FALSE)
        {
            SendMessageToPC(oPC, "No Action Points remaining.");
            return;

        }
        SetPlotFlag(oAP, FALSE);
        int nStack = GetItemStackSize(oAP);
        if (nStack > 1)
            SetItemStackSize(oAP, nStack - 1);
        else
            DestroyObject(oAP);
        DelayCommand(0.5, SetPlotFlag(oAP, TRUE));
        int nRoll = d6();
        if (nLevel > 7)
            nRoll = nRoll + d6();
        if (nLevel > 14)
            nRoll = nRoll + d6();
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDamageIncrease(nRoll), oPC, 6.0);
   }
}
