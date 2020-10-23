// Cycles through Modern heads for humans
void main()
{
    object oPC = GetPCSpeaker();
    int nHead = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC);
    if (nHead > 1)
        nHead --;
    else
        nHead = 199;

    SetCreatureBodyPart(CREATURE_PART_HEAD, nHead, oPC);
}
