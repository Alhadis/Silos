#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 6);
    SetLocalString(OBJECT_SELF, "RR1", "moonbugbear1");
    SetLocalInt(OBJECT_SELF, "nRR1", 2);
    SetLocalString(OBJECT_SELF, "RR2", "moonbugbear2");
    SetLocalInt(OBJECT_SELF, "nRR2", 2);
    SetLocalString(OBJECT_SELF, "RR3", "moonbugbear005");
    SetLocalInt(OBJECT_SELF, "nRR3", 1);
    SetLocalString(OBJECT_SELF, "RR4", "moonbugbear004");
    SetLocalInt(OBJECT_SELF, "nRR4", 3);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
