// Wealth check made by DM
void main()
{
    object oPC = GetPCSpeaker();
    object oTarg = GetLocalObject(oPC, "oMdrnTarget");
    int nWealth = 0;
    object oWealth = GetFirstItemInInventory(oTarg);
    while (GetIsObjectValid(oWealth))
    {
        if (GetTag(oWealth)=="wealth")
        nWealth = nWealth + GetItemStackSize(oWealth);
        oWealth = GetNextItemInInventory(oTarg);

    }
    int nCheck = d20()+ nWealth;
    SendMessageToPC(oPC, "Wealth check: "+IntToString(nCheck));

}
