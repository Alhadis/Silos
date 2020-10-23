#include "inc_d20"
// Blanket Protection
void main()
{
    object oPC = OBJECT_SELF;
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

        float fDur =18.0;


            object oTarg = GetFirstFactionMember(oPC);
            while (GetIsObjectValid(oTarg))
            {
                if (GetDistanceToObject(oTarg) < 20.0 && GetLocalInt(oTarg, "nMdrnBProt")==0)
                {
                    SetLocalInt(oTarg, "nMdrnBProt", 1);
                    DelayCommand(fDur, SetLocalInt(oTarg, "nMdrnBProt", 0));

                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectACIncrease(1), oTarg, fDur);
                }
                oTarg = GetNextFactionMember(oPC, TRUE);
            }







}
