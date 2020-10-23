void main()
{
    if (GetHitDice(GetEnteringObject())<2 && GetIsPC(GetEnteringObject()))
        FloatingTextStringOnCreature("You get a feeling of forboding and the feeling that the Northern Forest might be unwise to enter at this stage.", GetEnteringObject());
}
