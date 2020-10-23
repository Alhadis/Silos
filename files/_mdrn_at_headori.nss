// Cylces through Modern heads for humans
void main()
{
    object oPC = GetPCSpeaker();

    SetCreatureBodyPart(CREATURE_PART_HEAD, GetLocalInt(oPC, "nMdrnStartHead"), oPC);
}
