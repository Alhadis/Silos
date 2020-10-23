/*! \file  bbs_include.nss
    \brief ANSCHLAGTAFEL SYSTEM VERSION 1.22\n
           -------------------------------------------------------------------\n
           Dies ist eine include Datei.\n
           Diese Datei erzeugt einen Kompilerfehler beim erstellen deines Moduls.\n
           Das ist normal und hat keine Auswirkung auf die Funktionsweise.\n
           Last Update: BDr 05.05.2009
           doxic: 25.11.2011
*/
#include "dcs_inc_database"

//const string sBBSDatabase = "BBS"; /*!< Name der Datenbank */
const int    BBS_PageSize = 10;    /*!< die Anzahl der Nachrichten pro Seite von 1-10 */
//const int    iMaxItem     = 200;    /*!< die maximale Anzahl der Nachrichten           */



//brief Laed den Status in die Benutzer Token der Anschlagtafel
void bbs_do_board_stats();

//Richtet die Anschlagtafel ein wenn noetig
void bbs_initiate(object oBBS);

//entscheidet welche Dialogoptionen in der Unterhaltung zu sehen sind
int bbs_can_show(int WhichEntry);


//wechselt die seite anhand des PageFlip
//0 seite neu laden, -1 vorherige Seite, 1 naechste seite
void bbs_change_page(int PageChange);

//Gibt die ausgewaehlte Nachricht aus.
void bbs_select_entry(int WhichEntry);

//Fuegt eine Nachricht zur Anschlagtafen hinzu.
//Diese kann jederzeit aufgerufen werden, um deine eigenen Nachrichten hinzuzufuegen..
void bbs_add_notice(object oPoster, string sTitle, string sMessage, int iExpire=31, int iPermanent=FALSE);

//Heftet eine Nachricht von der Anschlagtafel ab.
void bbs_get_notice( int iWichEntry );

//------------------------------------------------------------------------------

int bbs_get_totalitems()
{
    string sBoard = SQLEncodeSpecialChars(GetTag(OBJECT_SELF));
    SQLExecDirect("select count(*) from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"'");

    if(SQLFetch())
    return SQLGetDataInt(1);

    return 0;
}

//------------------------------------------------------------------------------

/*! \fn    void bbs_do_board_stats()
    \brief Laed den Status in die Benutzer Token der Anschlagtafel
*/
void bbs_do_board_stats()
{
    int iPageIndex = GetLocalInt(GetPCSpeaker(), "bbs_PageIndex");
    int iTotalItems = bbs_get_totalitems();

    if(iTotalItems == 0 || iPageIndex == 0)
    iPageIndex = 1;

    SetCustomToken( 3671, IntToString( iTotalItems ) );
    SetCustomToken( 3672, IntToString( iPageIndex ) );
    SetCustomToken( 3673, IntToString((iTotalItems + BBS_PageSize) / BBS_PageSize));// (iTotalItems + BBS_PageSize - 1) / BBS_PageSize)
    SetLocalInt( GetPCSpeaker(), "show_notice", 0 );
}

/*! \fn    void bbs_initiate( object oBBS )
    \brief Richtet die Anschlagtafel ein wenn noetig
    \param oBBS Anschlagtafel
*/

void bbs_initiate( object oBBS )
{
    SQLExecDirect("delete from "+BBS_TABLE+" where "+BBS_COL_PERMANENT+"=0 and DATEDIFF(localtime(), "+BBS_COL_EXPIRE+") >= 0");
    SetLocalInt( GetPCSpeaker(), "show_notice", 0 );
}

/*! \fn    int bbs_can_show( int WhichEntry )
    \brief entscheidet welche Dialogoptionen in der Unterhaltung zu sehen sind
    \param WhichEntry Index des Eintrages
*/
int bbs_can_show( int iWhichEntry )
{
    int iSpot = GetLocalInt(GetPCSpeaker(), "bbs_PageIndex") * BBS_PageSize + iWhichEntry;
    return iSpot <= bbs_get_totalitems() && iWhichEntry <= BBS_PageSize;
}

/*! \fn void bbs_change_page( int PageFlip )
    \brief wechselt die Seite anhand des PageFlip\n
           0 seite neu laden, -1 vorherige Seite, 1 naechste seite
    \param PageFlip was soll gemacht werden
*/
void bbs_change_page( int PageFlip )
{
    string sBoard = SQLEncodeSpecialChars(GetTag(OBJECT_SELF));
    int iPageIndex = GetLocalInt(GetPCSpeaker(), "bbs_PageIndex") + PageFlip;
    int iTotalItems = bbs_get_totalitems();
    int iLoop;
    int iNotice;

    if( iPageIndex < 0 )
    { iPageIndex = 0; }

    SetLocalInt(GetPCSpeaker(), "bbs_PageIndex", iPageIndex);

    for( iLoop = 0; iLoop < BBS_PageSize; iLoop++ )
    {
        string sPoster, sTitle;
        iNotice = iPageIndex * BBS_PageSize + iLoop;

        if(iNotice + 1 > iTotalItems)
        break;

        SQLExecDirect("select "+BBS_COL_POSTER+","+BBS_COL_TITLE+" from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"' order by `rowid` desc limit 1 offset "+inStr(iNotice));

        if(SQLFetch())
        {
            SetCustomToken( 3690 + iLoop, SQLDecodeSpecialChars(SQLGetData(1)) );
            SetCustomToken( 3680 + iLoop, SQLGetData(2));
        }

    }

    bbs_do_board_stats();
    SetCustomToken( 3674, "" );
    SetCustomToken( 3675, "" );
    SetCustomToken( 3676, "" );
    SetCustomToken( 3677, "" );
    SetCustomToken( 3678, "" );
    SetLocalInt( GetPCSpeaker(), "show_notice", 0 );
}

/*! \fn void bbs_select_entry( int WhichEntry )
    \brief Gibt die ausgewaehlte Nachricht aus.
    \param WhichEntry Index der Nachricht
*/
void bbs_select_entry( int WhichEntry )
{
    string sBoard = SQLEncodeSpecialChars(GetTag(OBJECT_SELF));
    int PageIndex = GetLocalInt(GetPCSpeaker(), "bbs_PageIndex");
    int iNotice = PageIndex * BBS_PageSize + WhichEntry - 1;

    if( iNotice < 0 )
    iNotice = 0;

    bbs_do_board_stats();
                                                          //SUBSTRING_INDEX(Datum, ' ', 1), DATE_FORMAT("+BBS_COL_DATE+", 'um %H:%i Uhr')
    SQLExecDirect("select "+BBS_COL_TITLE+","+BBS_COL_POSTER+",SUBSTRING_INDEX("+BBS_COL_DATE+", ' ', 1), DATE_FORMAT("+BBS_COL_DATE+", 'um %H:%i Uhr'), "+BBS_COL_NACHRICHT+", DATEDIFF(localtime(), "+BBS_COL_EXPIRE+"), "+BBS_COL_PERMANENT+" from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"' order by `rowid` desc limit 1 offset "+inStr(iNotice));

    if(SQLFetch())
    {
        string Title = SQLGetData(1);
        string Poster = SQLGetData(2);
        string Date = SQLGetData(3);
        string Time = SQLGetData(4);
        string Note = SQLGetData(5);
        int Expire = SQLGetDataInt(6);
        int Perm = SQLGetDataInt(7);

        SetCustomToken(3674, "\n\n" + Title + "\nVon: ");
        SetCustomToken(3675, SQLDecodeSpecialChars(Poster));
        SetCustomToken(3676, "\nAm:   ");
        SetCustomToken(3677, Date + " "+ Time);
        SetCustomToken(3678, "\n\n" + Note + (!Perm ? "\n\nDie Nachricht bleibt noch "+inStr(abs(Expire))+" Tage hängen" : ""));

        SetLocalInt( GetPCSpeaker(), "show_notice", 1 );
        SetLocalInt( GetPCSpeaker(), "shown_notice", WhichEntry );
    }
}

/*! \fn    void bbs_add_notice( object oBBS, string sPoster, string sTitle,
                                string sMessage, string sDate,
                                string sBBStag = "", int iInitialise = 0 )
    \brief Fuegt eine Nachricht zur Anschlagtafel hinzu.\n
           Sie kann jederzeit aufgerufen werden, um deine eigenen Nachrichten hinzuzufuegen.\n
           Wenn kein Datum angegeben ist, wird die aktuelle Spielzeit genommen.\n
           Das Datumsformat ist "30.6.1373 11:58".\n
    \param oBBS        Anschlagtafel
    \param sPoster     Verfasser
    \param sTitle      Titel
    \param sMessage    Nachricht
    \param sDate       Datum
    \param sBBStag     Tag(Standart Leerstring)
    \param iInitialise Initialisierung(Standart 0)
*/
void bbs_add_notice(object oPoster, string sTitle, string sMessage, int iExpire=31, int iPermanent=FALSE)
{
    string sBoard = SQLEncodeSpecialChars(GetTag(OBJECT_SELF));
    string sPoster = SQLEncodeSpecialChars(GetName(oPoster));
    string sExpire = "(select DATE_ADD(localtime(), INTERVAL "+inStr(iExpire)+" DAYS))";

    if(iExpire % 31 == 0 && iExpire > 0)
    sExpire = "(select DATE_ADD(localtime(), INTERVAL "+inStr(iExpire / 31)+" MONTH))";

    SQLExecDirect("select * from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"' and "+BBS_COL_POSTER+"='"+sPoster+"' and "+BBS_COL_TITLE+"='"+sTitle+"' and "+BBS_COL_NACHRICHT+"='"+sMessage+"'");

    // Update Expiration Date by sExpire
    if(SQLFetch())
        SQLExecDirect("update "+BBS_TABLE+" set "+BBS_COL_EXPIRE+"="+sExpire+" where "+BBS_COL_BOARD+"='"+sBoard+"' and "+BBS_COL_POSTER+"='"+sPoster+"' and "+BBS_COL_TITLE+"='"+sTitle+"' and "+BBS_COL_NACHRICHT+"='"+sMessage+"' and "+BBS_COL_PERMANENT+"="+IntToString(iPermanent));
    else
        SQLExecDirect("insert into "+BBS_TABLE+" ("+BBS_COL_POSTER+","+BBS_COL_BOARD+","+BBS_COL_TITLE+","+BBS_COL_NACHRICHT+","+BBS_COL_DATE+","+BBS_COL_EXPIRE+","+BBS_COL_PERMANENT+") values ('"+sPoster+"','"+sBoard+"','"+sTitle+"','"+sMessage+"','"+SQLGetTimestamp("%d.%m.%y %T")+"',"+sExpire+", "+IntToString(iPermanent)+")");

   SetLocalInt(oPoster, "show_notice", 0 );

   //schreibt die Nachricht ins logfile
   //string sQuote = GetSubString( GetStringByStrRef( 464 ), 13, 1 );
   //PrintString( "bbs_add_notice(OBJECT_SELF, " + sQuote + sPoster + sQuote + ", " + sQuote + sTitle + sQuote + ", " + sQuote + sMessage + sQuote + ", " + sQuote + sDate + sQuote + ", " + sQuote + GetTag(oBBS) + sQuote + "); //:::BBS:::");
}

/*! \fn void bbs_get_notice( int WhichEntry )
    \brief Heftet eine Nachricht von der Anschlagtafel ab.
    \param WhichEntry Index der Nachricht
*/
void bbs_get_notice( int WhichEntry )
{
    string sBoard = SQLEncodeSpecialChars(GetTag(OBJECT_SELF));
    string sPoster, sTitle, sMessage;
    int iPageIndex = GetLocalInt(GetPCSpeaker(), "bbs_PageIndex");
    int iNotice = iPageIndex * BBS_PageSize + WhichEntry - 1;
    int iTotalItems = bbs_get_totalitems();
    int iMaxItems;

    SQLExecDirect("select "+BBS_COL_POSTER+","+BBS_COL_TITLE+","+BBS_COL_NACHRICHT+" from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"' order by `rowid` desc limit 1 offset "+inStr(iNotice));

    if(SQLFetch())
    {
        sPoster  = SQLDecodeSpecialChars(SQLGetData(1));
        sTitle   = SQLGetData(2);
        sMessage = SQLGetData(3);
    }

    SQLExecDirect("select count(*) from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"' and "+BBS_COL_POSTER+"='"+sPoster+"'");

    if(SQLFetch())
    iMaxItems = SQLGetDataInt(1);

    object oNotice = CreateItemOnObject( "bbs_notice", GetPCSpeaker() );

    if( GetIsObjectValid(oNotice) )
    {
        SetLocalString( oNotice, "Title",   sTitle);
        SetLocalString( oNotice, "Message", sMessage);

        SetDescription( oNotice, sMessage);
        SetName( oNotice, "Nachricht: '"+ColorText(sTitle, nwcRed)+"'");

        SQLExecDirect("Delete from "+BBS_TABLE+" where "+BBS_COL_BOARD+"='"+sBoard+"' and "+BBS_COL_POSTER+"='"+sPoster+"' and "+BBS_COL_TITLE+"='"+sTitle+"' and "+BBS_COL_NACHRICHT+"='"+sMessage+"'");
        bbs_change_page( -1000 );
    }
}

void bbs_validate_notice(object oNotice)
{
    if(GetLocalString(oNotice, "Title") == "")
    SetLocalString(oNotice, "Title", GetSubString(GetName(oNotice), 12, GetStringLength(GetName(oNotice)) - 13));

    if(GetLocalString(oNotice, "Message") == "")
    SetLocalString(oNotice, "Message", GetDescription(oNotice));
}

object bbs_GetActiveNotice()
{
    return GetLocalObject(GetPCSpeaker(), "bbs_notice_act");
}

//void main(){}
