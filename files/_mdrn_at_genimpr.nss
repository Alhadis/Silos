#include "inc_d20"

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
     SendMessageToAllDMs(GetName(oPC)+" is trying to improvise something.  Remember, the DC = 5+the purchase DC of the item, and it should last "+IntToString(nDur)+" rounds before breaking.");
    SendMessageToPC(oPC, "The DM's have been informed that you are trying to make something.  You should let them know the details.");

}
