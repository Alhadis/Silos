//Put this script OnUsed to get a placeable to speak

void main()
{
    object oPC = GetLastUsedBy();

    if (!GetIsPC(oPC)) return;
    ActionStartConversation(oPC,"",TRUE);
}
