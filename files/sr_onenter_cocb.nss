#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 6);
    SetLocalString(OBJECT_SELF, "RR1", "gnashgoblin3");
    SetLocalInt(OBJECT_SELF, "nRR1", 4);
    SetLocalString(OBJECT_SELF, "RR2", "goblina002");
    SetLocalInt(OBJECT_SELF, "nRR2", 2);
    SetLocalString(OBJECT_SELF, "RR3", "goblinb001");
    SetLocalInt(OBJECT_SELF, "nRR3", 3);
    SetLocalString(OBJECT_SELF, "RR4", "gnashgoblin5");
    SetLocalInt(OBJECT_SELF, "nRR4", 2);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
