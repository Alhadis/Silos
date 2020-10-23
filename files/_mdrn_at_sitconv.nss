//Used in placeable conversations
//Put in action taken for node to make a creature sit on the placeable

void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(oPC, ActionSit(OBJECT_SELF));
}
