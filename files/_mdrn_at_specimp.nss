#include "inc_d20"
// Specific improvised item
void main()
{
    object oPC = GetPCSpeaker();
     object oAP = GetItemPossessedBy(oPC, "ActionPoint");
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

    int nDur = GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC);
    /*object oHench = CreateObject(OBJECT_TYPE_CREATURE, "_mdrn_ct_supply", GetLocation(oPC));
    AddHenchman(oPC, oHench);
    */
    object oHench = CreateObject(OBJECT_TYPE_PLACEABLE, "_mdrn_supply", GetLocation(oPC));
    AssignCommand(oPC, ActionInteractObject(oHench));
    DelayCommand(1.0, SetUseableFlag(oHench, FALSE));
    DelayCommand(60.0, ExecuteScript("_mdrn_exe_dsuppl", oHench));

    SendMessageToPC(oPC, "A supply container has been created for you - don't move; select a single item within one minute.");
}
