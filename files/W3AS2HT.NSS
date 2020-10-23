0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Basic Subroutines
0030*
0040*        W3AS2HT
0050*
0060* DESCRIPTION
0070*               A conversion table ASCII to HTML.
0080*
0090*
0100* AUTHOR        SAG   28.07.2002
0110*
0120* VERSION       6.2.
0130*
0140* (c) Copyright  Software AG 2002-2005. All rights reserved.
0150*
0160* HISTORY
0170* USER    DATE       REASON
0180* ------+----------+----------------------------------------------
0190*       ! --.--.-- !
0200* ------+----------+----------------------------------------------
0210*
0220* ------ PARAMETER -----------------------------------------------
0230DEFINE DATA
0240PARAMETER
02501 ##ASCII_HTML (1:V)
0260  2 ASCII (A1)
0270  2 HTML  (A8)
02801 #COUNTER (I4)
0290END-DEFINE
0300*
0310DEFINE SUBROUTINE W3-ASCII-HTML-TABLE
0320*
0330* ---- Ampersand
0340##ASCII_HTML.ASCII(001) := "&"     ##ASCII_HTML.HTML(001) := '&amp;'
0350* ---- Greater than
0360##ASCII_HTML.ASCII(002) := ">"     ##ASCII_HTML.HTML(002) := '&gt;'
0370* ---- Less than
0380##ASCII_HTML.ASCII(003) := "<"     ##ASCII_HTML.HTML(003) := '&lt;'
0390* ---- Apostrophe
0400IF H'41' NE "A" THEN
0410  ##ASCII_HTML.ASCII(004) := H'7D' ##ASCII_HTML.HTML(004) := '&#39;'
0420ELSE
0430  ##ASCII_HTML.ASCII(004) := H'27' ##ASCII_HTML.HTML(004) := '&#39;'
0440END-IF
0450* ---- Quotation mark
0460IF H'41' NE "A" THEN
0470  ##ASCII_HTML.ASCII(005) := H'7F' ##ASCII_HTML.HTML(005) := '&quot;'
0480ELSE
0490  ##ASCII_HTML.ASCII(005) := H'22' ##ASCII_HTML.HTML(005) := '&quot;'
0500END-IF
0510* ---- Small u, dieresis or umlaut mark
0520##ASCII_HTML.ASCII(006) := 'ü'     ##ASCII_HTML.HTML(006) := '&uuml;'
0530* ---- Capital U, dieresis or umlaut mark
0540##ASCII_HTML.ASCII(007) := 'Ü'     ##ASCII_HTML.HTML(007) := '&Uuml;'
0550* ---- Small a, dieresis or umlaut mark
0560##ASCII_HTML.ASCII(008) := 'ä'     ##ASCII_HTML.HTML(008) := '&auml;'
0570* ---- Capital A, dieresis or umlaut mark
0580##ASCII_HTML.ASCII(009) := 'Ä'     ##ASCII_HTML.HTML(009) := '&Auml;'
0590* ---- Small o, dieresis or umlaut mark
0600##ASCII_HTML.ASCII(010) := 'ö'     ##ASCII_HTML.HTML(010) := '&ouml;'
0610* ---- Capital O, dieresis or umlaut mark
0620##ASCII_HTML.ASCII(011) := 'Ö'     ##ASCII_HTML.HTML(011) := '&Ouml;'
0630* ---- Small sharp s, German (sz ligature)
0640##ASCII_HTML.ASCII(012) := 'ß'     ##ASCII_HTML.HTML(012) := '&szlig;'
0650*
0660#COUNTER := 12
0670END-SUBROUTINE
0680END
