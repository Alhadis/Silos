/*
    Open merchant script to implement a credit card system.
*/

void main()
{
    object oPC = GetLastOpenedBy();
    object oCard = GetItemPossessedBy(oPC,"_mdrn_creditcard");
    int nCredit = GetLocalInt(oCard,"Credit");

    GiveGoldToCreature(oPC,nCredit);
    FloatingTextStringOnCreature("You currently have "+IntToString(nCredit)+" credits at your disposal.",oPC,TRUE);
    nCredit = 0;
    SetLocalInt(oCard,"Credit",nCredit);
}
