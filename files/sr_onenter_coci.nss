#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 6);
    SetLocalString(OBJECT_SELF, "RR1", "hellhound001");
    SetLocalInt(OBJECT_SELF, "nRR1", 3);
    SetLocalString(OBJECT_SELF, "RR2", "cavebear");
    SetLocalInt(OBJECT_SELF, "nRR2", 1);
    SetLocalString(OBJECT_SELF, "RR3", "btlfire001");
    SetLocalInt(OBJECT_SELF, "nRR3", 8);
    SetLocalString(OBJECT_SELF, "RR4", "direbat");
    SetLocalInt(OBJECT_SELF, "nRR4", 2);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
