/*********************************************************************/
/** Nom :              cose_mlod_main
/** Date de création : 12/07/2010
/** Version :          1.0.0
/** Créateur :         Peluso Loup
/***************************** ChangeLog *****************************/
/** V1.0.0 (par Peluso Loup) :
/**      Script lancé au chargement du module.
/*********************************************************************/

/***************************** INCLUDES ******************************/

#include "sqla_main"
#include "cosa_globalvar"
#include "cosa_log"

/************************** IMPLEMENTATIONS **************************/

void main() {
    SetLocalString(GetModule(), "NWNX!INIT", "1");

    // Systèmes principaux.
    sqlInit(); // ==== SYSTEM SQL ==== //

    // On a terminé l'initialisation du module.
    cosSetGlobalInt(COS_MOD_IS_INIT_VARNAME, TRUE);

    ExecuteScript("ts_cos_sys", OBJECT_SELF);
    ExecuteScript("ts_std_sys", OBJECT_SELF);
    ExecuteScript("ts_cmd_sys", OBJECT_SELF);
    ExecuteScript("ts_sql_sys", OBJECT_SELF);

    // On log le démarrage du module en BDD.
    cosLogModuleLoad();
}
