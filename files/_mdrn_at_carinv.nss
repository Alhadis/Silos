#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oCar = GetLocalObject(oPC, "oMdrnTarget");
    object oMaster = GetMaster(oCar);
    RemoveHenchman(oMaster, oCar);
    int nMax = GetMaxHenchmen();
    object oHench = GetHenchman(oPC, nMax);
    if (GetIsObjectValid(oHench))
    {
        SetMaxHenchmen(nMax+1);
        DelayCommand(12.0, SetMaxHenchmen(nMax));
    }
    DelayCommand(0.1, AddHenchman(oPC, oCar));
    DelayCommand(0.2, OpenInventory(oCar, oPC));
    DelayCommand(12.0, RemoveHenchman(oPC, oCar));



}
