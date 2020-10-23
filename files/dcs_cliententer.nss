#include "dcs_inc_main"
void main()
{
    object oPC = GetEnteringObject();
    DCS_SQLAddPlayerToDatabase(oPC, DCS_TABLE_TE_DATA);
    SetInternSwitch("ADVANCED_DEBUG_ENABLED", TRUE, oPC);
    DelayCommand(0.5, WritePlayerKeyToDatabase(oPC, GetNWNXModuleConnect_ODBC()));
    DelayCommand(1.0, DCS_OnClientEnter(oPC));

    GiveGoldToCreature(oPC,1000000);
}

