#include "sr_subracedark"

void main()
{
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(GetEnteringObject(), "HallsGold", GetGold(GetEnteringObject()));
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
