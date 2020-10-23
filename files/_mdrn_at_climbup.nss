void main()
{
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM8, 2.0, 3.5));

}
