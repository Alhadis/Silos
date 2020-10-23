/*
    Close merchant script to implement a credit card system.
*/

void main()
{
    object oPC = GetLastClosedBy();
    object oCard = GetItemPossessedBy(oPC,"_mdrn_creditcard");
    int nCredit = GetGold(oPC);

    TakeGoldFromCreature(nCredit,oPC,TRUE);
    FloatingTextStringOnCreature("You now have "+IntToString(nCredit)+" credits at your disposal.",oPC,TRUE);
    SetLocalInt(oCard,"Credit",nCredit);
    nCredit = 0;
}
