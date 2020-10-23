#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", FALSE);
    SetLocalInt(OBJECT_SELF, "Wilderness", FALSE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 0);
    SetLocalInt(OBJECT_SELF, "Chance", 0);
    SetLocalString(OBJECT_SELF, "RR1", "resref1");
    SetLocalInt(OBJECT_SELF, "nRR1", 1);
    SetLocalString(OBJECT_SELF, "RR2", "resref2");
    SetLocalInt(OBJECT_SELF, "nRR2", 1);
    SetLocalString(OBJECT_SELF, "RR3", "resref3");
    SetLocalInt(OBJECT_SELF, "nRR3", 1);
    SetLocalString(OBJECT_SELF, "RR4", "resref4");
    SetLocalInt(OBJECT_SELF, "nRR4", 1);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
