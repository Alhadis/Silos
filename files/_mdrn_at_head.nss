// Cycles through Modern heads for humans
void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "nMdrnStartHeadRec")==0)
    {
        SetLocalInt(oPC, "nMdrnStartHeadRec", 1);
        SetLocalInt(oPC, "nMdrnStartHead", GetCreatureBodyPart(CREATURE_PART_HEAD, oPC));
    }
    int nHead = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC);
    //if (nHead < 100)
    //    nHead = 100;
    //else
    if (nHead < 199)
        nHead ++;
    else
        nHead = 1;
    SetCreatureBodyPart(CREATURE_PART_HEAD, nHead, oPC);
}
