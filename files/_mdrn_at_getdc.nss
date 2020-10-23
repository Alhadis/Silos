// Report Wealth DC of item
void main()
{
    object oPC = GetPCSpeaker();
    object oWealth = GetLocalObject(oPC, "oMdrnTarget");;
     int nGold = GetGoldPieceValue(oWealth);               // Value in dollars (gold)
    int nDC =  FloatToInt(log(nGold*1.0)*3.48-6.65);                    // Convert from dollars to DCs
    if (nDC < 5)
        nDC = 5;
    SendMessageToPC(oPC, "Weath DC of item: "+IntToString(nDC));

}
