#include "dep_inc_class"
#include "dbk_include"
#include "dcs_inc_main"
#include "nwnx_chat"

void SetCorpse(object oPC)
{
    int iGetIsDead = DeathGetIsDeadMarked(oPC, GetNWNXModuleConnect_ODBC());
    int iHP        = GetLocalInt(GetModule(), GetPCPlayerName(oPC) + "|" + GetName(oPC));

    if(iGetIsDead)
    {
        location lLeiche = DeathGetCorpseLocation(oPC);
        object   oLeiche = DeathGetCreatePlayerCorpse(oPC, lLeiche);

        SendMessageToPC(oPC,"Leiche gesetzt!");
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iHP, DAMAGE_TYPE_DIVINE, DAMAGE_POWER_ENERGY), oPC);
    SetLocalString(oPC, "MP_PlayerName", GetPCPlayerName(oPC));
}

void main()
{
    object oPC = GetEnteringObject();

    // Ist der CD-Key, mit dem oPC einloggt nicht gebannt, laeuft das script normal weiter.
    // Sollte er gebannt sein, wird der Spieler sofort vom Server entfernt.
    if (GetIsCDKeyBanned(GetPCPublicCDKey(oPC)))
    {
        BootPC(oPC);
        return;
    }

    NWNXChat_PCEnter(oPC);

    if(!GetIsDM(oPC))
    {
        SetCorpse(oPC);

        /* Account and Key data */
        WritePlayerData(oPC, GetNWNXModuleConnect_ODBC());
        PCA_AddAccountToDatabase(oPC);
        DCS_SQLAddPlayerToDatabase(oPC, DCS_TABLE_TE_DATA);

        /* DCS, DEP and DBK data */
        DCS_OnClientEnter(oPC);
        DEP_OnClientEnter(oPC);
        DBK_BankOnClientEnter();

        /* Palemaster level restriction */
        CheckPalemaster(oPC);

        /* Pferde */
        ExecuteScript("x3_mod_def_enter", oPC);

        /* Second onClientEnter */
        ExecuteScript("d0_onclenter2", OBJECT_SELF);

        if(!PCA_GetPlayerCDKeyInAccount(oPC) && GetIsPC(oPC))
        {
            DelayCommand(5.0, FloatingTextStringOnCreature("* Dein CD-Key wurde für diesen Account noch nicht freigeschaltet, bitte kontaktiere einen Spielleiter, damit dieser dich freischalten kann! *", oPC));
            DelayCommand(7.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("d0_sperrgebiet")))));
        }
    }
}

