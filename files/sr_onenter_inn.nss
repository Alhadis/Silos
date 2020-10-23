#include "sr_subracedark"
void main()
{
  string sPC = GetName(GetEnteringObject());
  object oMod = GetModule();
  SetLocalInt(oMod, ("LastHourRest" + sPC), 0);
  SetLocalInt(oMod, ("LastDayRest" + sPC), 0);
  SetLocalInt(oMod, ("LastMonthRest" + sPC), 0);
  SetLocalInt(oMod, ("LastYearRest" + sPC), 0);
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
