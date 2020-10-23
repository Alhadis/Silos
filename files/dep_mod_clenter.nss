#include "dep_inc_class"
#include "nwnx_funcs"
void main()
{
    object oPC = GetEnteringObject();
    SendMessageToPC(oPC, "ClientEnter");

    ExecuteScript("x3_mod_def_enter", OBJECT_SELF);
    DEP_OnClientEnter(oPC);
}
