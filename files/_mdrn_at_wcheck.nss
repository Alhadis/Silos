// Generic Wealth check
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
    int nCheck = d20()+ nWealth;
    SendMessageToPC(oPC, "Wealth check: "+IntToString(nCheck));
    SendMessageToAllDMs(GetName(oPC)+" Wealth check: "+IntToString(nCheck));
}
