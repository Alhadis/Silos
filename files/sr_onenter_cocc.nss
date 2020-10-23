#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 6);
    SetLocalString(OBJECT_SELF, "RR1", "longfangorc3");
    SetLocalInt(OBJECT_SELF, "nRR1", 4);
    SetLocalString(OBJECT_SELF, "RR2", "longfangorc1");
    SetLocalInt(OBJECT_SELF, "nRR2", 3);
    SetLocalString(OBJECT_SELF, "RR3", "longfangorc2");
    SetLocalInt(OBJECT_SELF, "nRR3", 3);
    SetLocalString(OBJECT_SELF, "RR4", "longfangorc4");
    SetLocalInt(OBJECT_SELF, "nRR4", 2);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
