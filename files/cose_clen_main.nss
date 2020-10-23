#include "cosa_globalvar"
#include "cosa_pcmanips"
#include "cosa_log"

void main() {
    object oPC;

    oPC = GetEnteringObject();

    if (!(cosGetGlobalInt(COS_MOD_IS_INIT_VARNAME) &&
          GetIsObjectValid(oPC) &&
          GetIsPC(oPC) &&
          (GetPCPublicCDKey(oPC) != ""))) {
        BootPC(oPC);
        return;
    }

    if (cosIsNewPC(oPC)) {
        cosCreatePCId(oPC);
    }

    cosUpdateLastConnexion(oPC);
    cosLogClientEnter(oPC);
    cosGivePlayerTools(oPC);
    cosStartLocationManager(oPC);

    ExecuteScript("ts_cos_sys", OBJECT_SELF);
    ExecuteScript("ts_std_sys", OBJECT_SELF);
    ExecuteScript("ts_cmd_sys", OBJECT_SELF);
    ExecuteScript("ts_sql_sys", OBJECT_SELF);

    FloatingTextStringOnCreature(COS_M_WELCOME_ONTO_SERVER+" "+GetName(oPC)+" !", oPC);
}
