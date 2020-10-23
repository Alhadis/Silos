#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 6);
    SetLocalString(OBJECT_SELF, "RR1", "lizardfolk1");
    SetLocalInt(OBJECT_SELF, "nRR1", 2);
    SetLocalString(OBJECT_SELF, "RR2", "lizardfolk2");
    SetLocalInt(OBJECT_SELF, "nRR2", 3);
    SetLocalString(OBJECT_SELF, "RR3", "lizardfolk3");
    SetLocalInt(OBJECT_SELF, "nRR3", 1);
    SetLocalString(OBJECT_SELF, "RR4", "lizardfolk002");
    SetLocalInt(OBJECT_SELF, "nRR4", 1);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
