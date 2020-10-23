void main()
{
    object oPC = GetLastUsedBy();
     GiveXPToCreature(oPC, 1000*GetHitDice(oPC));

}
