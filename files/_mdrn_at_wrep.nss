// Report Wealth
void main()
{
    object oPC = GetPCSpeaker();
    int nWealth = 0;
    object oWealth = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oWealth))
    {
        if (GetTag(oWealth)=="wealth")
        nWealth = nWealth + GetItemStackSize(oWealth);
        oWealth = GetNextItemInInventory(oPC);

    }
    SendMessageToPC(oPC, "Current Wealth: "+IntToString(nWealth));
    SendMessageToAllDMs(GetName(oPC)+" current Wealth: "+IntToString(nWealth));
}
