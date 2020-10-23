// sr6.1 added text to message to all pcs who enter area.
//sr 5.3
// use this script in a area on_enter event to allow rest in the area
// without timer resting restrictions. Can also do this when the module loads
// in the hc_setareavars script.
// note: this could be abused by players casting buffs on friends and reresting.
//       use with hc_allwrest_exit in area exit event to remove magical
//       effects on area exit.
#include "hc_inc_pwdb_func"
#include "hc_text_rest"



void main()
{
object oPC = GetEnteringObject();
if (GetIsPC(oPC))
 {
    SendMessageToPC(oPC, ENTERREST);
    SetPersistentInt(GetArea(oPC), "ALLOWREST", TRUE);
 }
}
