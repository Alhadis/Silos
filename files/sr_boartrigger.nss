void main()
{
    if (GetHitDice(GetEnteringObject()) > 1 && !GetLocalInt(OBJECT_SELF, "Tripped")) {
        SetLocalInt(OBJECT_SELF, "Tripped", TRUE);
        FloatingTextStringOnCreature("You see an old fisherman to the south trying to get your attention",
                GetEnteringObject());
    }
}
