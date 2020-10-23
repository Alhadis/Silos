#include "inc_d20"
// Toggle curse on and off.
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetLocalObject(oPC, "oMdrnTarget");
    if (GetItemCursedFlag(oItem)==TRUE)
        SetItemCursedFlag(oItem, FALSE);
    else
        SetItemCursedFlag(oItem, TRUE);

}
