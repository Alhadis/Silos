/*********************************************************************/
/** Nom :              sqla_main
/** Date de création : 12/07/2010
/** Version :          1.0.0
/** Createur :         Loup Peluso
/***************************** ChangeLog *****************************/
/** V1.0.0 :
/**      Mise en place des fonctions de base n cessaires au bon
/**   fonctionnement des accès   la base de donnée MySQL. Ce script
/**   contient le strict minimum pour une connection   la BDD.
/*********************************************************************/

/***************************** INCLUDES ******************************/

#include "stda_locmanips"
#include "sqla_constants"

/***************************** PROTOTYPES ****************************/

// DEF IN "sqla_main"
// Fonction d'initialisation de MySQL.
void sqlInit();

// DEF IN "sqla_main"
// Renvoie l'objet correspondant au Waypoint SQL.
//   o object - Waypoint SQL.
object sqlGetWaypoint();

// DEF IN "sqla_main"
// Fonction qui ex cute une requ te SQL.
//   > string sQuery - Requête à exécuter.
void sqlExecDirect(string sQuery);

// DEF IN "sqla_main"
// Fonction qui place le curseur sur la ligne suivante (en commençant par la première).
//   o int - SQL_SUCCESS si le curseur à été déplacé, SQL_ERROR sinon (fin des lignes).
int sqlFetch();

// DEF IN "sqla_main"
// Fonction qui permet de récupérer les données préalablement fetchées.
//   > int iCol - Numéro de la colonne de la ligne actuelle qui contient la valeur à récupérer.
//   o string - Donnée récupère.
string sqlGetData(int iCol);

// DEF IN "sqla_main"
// Fonction qui permet d'exécuter et de récupérer directement la valeur de la requ te sous
// la forme d'un entier unique (à utiliser pour récupérer l'Identifiant d'un personnage par exemple).
// EAFD signifie ExecAndFetchDirect.
//   > string sQuery - Requête à exécuter.
//   o int - Entier récupéré, résultat de la requête.
int sqlEAFDSingleInt(string sQuery);

// DEF IN "sqla_main"
// Fonction qui permet d'exécuter et de récupérer directement la valeur de la requête sous
// la forme d'un entier unique (à utiliser pour récupérer l'Identifiant d'un personnage par exemple).
// EAFD signifie ExecAndFetchDirect.
//   > string sQuery - Requête à exécuter.
//   o string - Entier récupéré, résultat de la requête.
string sqlEAFDSingleString(string sQuery);

// DEF IN "sqla_main"
// Cette fonction crée une structure sub_query.
//   > string sQuery - Select correspondant   la sous-requ te d sir e.
//   > string sAlias - Alias de la sous-requ te.
//   o struct sub_query - Structure de sous-requ te.
struct sub_query sqlSetSubQuery(string sQuery, string sAlias);

// DEF IN "sqla_main"
// Cette fonction rajoute les caractères de quotation en début et en fin de chaîne.
//   > string sString - Chaîne   quoter.
//   o string - Chaîne modifi e.
string sqlQuote(string sString);

/***************************** STRUCTURES ****************************/

// Structure permettant de g rer les sous-requêtes SQL.
struct sub_query {
    string sQuery;
    string sAlias;
};

/************************** IMPLEMENTATIONS **************************/

void sqlInit() {
    int i;
    string sStringBuffer;

    // Réservation de 128 bits de m moire.
    for (i = 0; i < 8; i++) {
        sStringBuffer += "................................................................................................................................";
    }
    // Laisse de l'espace entre chaque résultat de requêtes.
    SetLocalString(sqlGetWaypoint(), "NWNX!ODBC!SPACER", sStringBuffer);
}

object sqlGetWaypoint() {
    object oSQLWP = GetWaypointByTag(SQL_WP_BUFFER_TAG);
    if (oSQLWP == OBJECT_INVALID) {
        oSQLWP = CreateObject(OBJECT_TYPE_WAYPOINT, SQL_WP_BUFFER_RESREF, GetStartingLocation(), FALSE, SQL_WP_BUFFER_TAG);
    }
    return oSQLWP;
}

void sqlExecDirect(string sQuery) {
    // Envoie la requête au module NWNX pour l'exécuter.
    SetLocalString(sqlGetWaypoint(), "NWNX!ODBC!EXEC", sQuery);
}

// TODO : Placer les string NWNX!XXX dans des constantes.
int sqlFetch()
{
    string sRow;
    object oWP = sqlGetWaypoint();

    SetLocalString(oWP, "NWNX!ODBC!FETCH", GetLocalString(oWP, "NWNX!ODBC!SPACER"));
    sRow = GetLocalString(oWP, "NWNX!ODBC!FETCH");
    if (GetStringLength(sRow) > 0)
    {
        SetLocalString(oWP, "NWNX_ODBC_CurrentRow", sRow);
        return SQL_SUCCESS;
    }
    else
    {
        SetLocalString(oWP, "NWNX_ODBC_CurrentRow", "");
        return SQL_ERROR;
    }
}

string sqlGetData(int iCol) {
    int iPos;
    string sResultSet = GetLocalString(sqlGetWaypoint(), "NWNX_ODBC_CurrentRow");

    // find column in current row
    int iCount = 0;
    string sColValue = "";

    iPos = FindSubString(sResultSet, "o");
    if ((iPos == -1) && (iCol == 1))
    {
        // only one column, return value immediately
        sColValue = sResultSet;
    }
    else if (iPos == -1)
    {
        // only one column but requested column > 1
        sColValue = "";
    }
    else
    {
        // loop through columns until found
        while (iCount != iCol)
        {
            iCount++;
            if (iCount == iCol)
                sColValue = GetStringLeft(sResultSet, iPos);
            else
            {
                sResultSet = GetStringRight(sResultSet, GetStringLength(sResultSet) - iPos - 1);
                iPos = FindSubString(sResultSet, "o");
            }

            // special case: last column in row
            if (iPos == -1)
                iPos = GetStringLength(sResultSet);
        }
    }

    return sColValue;
}

int sqlEAFDSingleInt(string sQuery) {
    sqlExecDirect(sQuery);
    sqlFetch();
    string sRes = sqlGetData(1);
    if (sRes == "") {
        return SQL_ERROR;
    } else {
        return StringToInt(sRes);
    }
}

// TODO : Faire une fonction de test.
string sqlEAFDSingleString(string sQuery) {
    sqlExecDirect(sQuery);
    sqlFetch();
    return sqlGetData(1);
}

struct sub_query sqlSetSubQuery(string sQuery, string sAlias) {
    struct sub_query sqlRes;
    sqlRes.sQuery = sQuery;
    sqlRes.sAlias = sAlias;
    return sqlRes;
}

string sqlQuote(string sString) {
    return SQL_QUOTE+sString+SQL_QUOTE;
}
