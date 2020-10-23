#include "sr_subracedark"
void main()
{
    if (GetIsOpen(GetObjectByTag("InsideCaveK")))
        DelayCommand(10.0, ActionCloseDoor(GetObjectByTag("InsideCaveK")));
    SetLocalInt(OBJECT_SELF, "InDark", TRUE);
    SetLocalInt(OBJECT_SELF, "Unsafe", 1);
    SetLocalInt(OBJECT_SELF, "Chance", 4);
    SetLocalString(OBJECT_SELF, "RR1", "cultist002");
    SetLocalInt(OBJECT_SELF, "nRR1", 2);
    SetLocalString(OBJECT_SELF, "RR2", "cultist003");
    SetLocalInt(OBJECT_SELF, "nRR2", 2);
    SetLocalString(OBJECT_SELF, "RR3", "cultist004");
    SetLocalInt(OBJECT_SELF, "nRR3", 2);
    SetLocalString(OBJECT_SELF, "RR4", "cultist005");
    SetLocalInt(OBJECT_SELF, "nRR4", 2);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
