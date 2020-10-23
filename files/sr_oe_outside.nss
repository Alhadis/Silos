#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "Wilderness", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 10);
    SetLocalString(OBJECT_SELF, "RR1", "ruffian");
    SetLocalInt(OBJECT_SELF, "nRR1", 2);
    SetLocalString(OBJECT_SELF, "RR2", "direrat");
    SetLocalInt(OBJECT_SELF, "nRR2", 6);
    SetLocalString(OBJECT_SELF, "RR3", "sskeleton");
    SetLocalInt(OBJECT_SELF, "nRR3", 3);
    SetLocalString(OBJECT_SELF, "RR4", "ruffian");
    SetLocalInt(OBJECT_SELF, "nRR4", 3);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
