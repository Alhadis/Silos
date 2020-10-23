#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 4);
    SetLocalString(OBJECT_SELF, "RR1", "skeleton001");
    SetLocalInt(OBJECT_SELF, "nRR1", 6);
    SetLocalString(OBJECT_SELF, "RR2", "ghoul001");
    SetLocalInt(OBJECT_SELF, "nRR2", 3);
    SetLocalString(OBJECT_SELF, "RR3", "zombie001");
    SetLocalInt(OBJECT_SELF, "nRR3", 4);
    SetLocalString(OBJECT_SELF, "RR4", "ghast001");
    SetLocalInt(OBJECT_SELF, "nRR4", 2);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
