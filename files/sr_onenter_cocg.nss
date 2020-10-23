#include "sr_subracedark"
void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 12);
    SetLocalString(OBJECT_SELF, "RR1", "lwaterelement");
    SetLocalInt(OBJECT_SELF, "nRR1", 1);
    SetLocalString(OBJECT_SELF, "RR2", "giantwaterspider");
    SetLocalInt(OBJECT_SELF, "nRR2", 1);
    SetLocalString(OBJECT_SELF, "RR3", "mwaterelemental");
    SetLocalInt(OBJECT_SELF, "nRR3", 1);
    SetLocalString(OBJECT_SELF, "RR4", "rottingghoul");
    SetLocalInt(OBJECT_SELF, "nRR4", 4);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
