0010* ----------------------------------------------------------------------
0020* CLASS  NATURAL HTTP API
0030*
0040*        W3AS2URL
0050*
0060* DESCRIPTION
0070*               A conversion table from ASCII to URL encoded.
0080*
0090*
0100* AUTHOR        SAG   28.07.1997
0110*
0120* VERSION       6.2.
0130*
0140* (c) Copyright  Software AG 1997-2005. All rights reserved.
0150*
0160* HISTORY
0170* USER    DATE       REASON
0180* ------+------------+----------------------------------------------
0190*       !            !
0200* ------+------------+----------------------------------------------
0210*
0220* ------ PARAMETER -----------------------------------------------
0230DEFINE DATA PARAMETER
02401 ##ASCII-URL (1:V)
0250  2 ASCII     (A1)
0260  2 URL       (A3)
02701 #COUNTER    (I4)
0280END-DEFINE
0290*
0300DEFINE SUBROUTINE W3-ASCII-URL-TABLE
0310* ---- Ampersand
0320##ASCII-URL.ASCII(001) := '%'   ##ASCII-URL.URL(001) := '%25'
0330* ---- Greater than
0340##ASCII-URL.ASCII(002) := '>'   ##ASCII-URL.URL(002) := '%3E'
0350* ---- Less than
0360##ASCII-URL.ASCII(003) := '<'   ##ASCII-URL.URL(003) := '%3C'
0370* ---- Apostrophe
0380IF H'41' NE 'A' THEN
0390  ##ASCII-URL.ASCII(004) := H'7D'  ##ASCII-URL.URL(004) := '%27'
0400ELSE
0410  ##ASCII-URL.ASCII(004) := H'27'  ##ASCII-URL.URL(004) := '%27'
0420END-IF
0430* ---- Quotation mark
0440IF H'41' NE 'A' THEN
0450  ##ASCII-URL.ASCII(005) := H'7F' ##ASCII-URL.URL(005) := '%22'
0460ELSE
0470  ##ASCII-URL.ASCII(005) := H'22' ##ASCII-URL.URL(005) := '%22'
0480END-IF
0490* ---- Small u, dieresis or umlaut mark
0500##ASCII-URL.ASCII(006) := 'ü'   ##ASCII-URL.URL(006) := '%FC'
0510* ---- Capital U, dieresis or umlaut mark
0520##ASCII-URL.ASCII(007) := 'Ü'   ##ASCII-URL.URL(007) := '%DC'
0530* ---- Small a, dieresis or umlaut mark
0540##ASCII-URL.ASCII(008) := 'ä'   ##ASCII-URL.URL(008) := '%E4'
0550* ---- Capital A, dieresis or umlaut mark
0560##ASCII-URL.ASCII(009) := 'Ä'   ##ASCII-URL.URL(009) := '%C4'
0570* ---- Small o, dieresis or umlaut mark
0580##ASCII-URL.ASCII(010) := 'ö'   ##ASCII-URL.URL(010) := '%F6'
0590* ---- Capital O, dieresis or umlaut mark
0600##ASCII-URL.ASCII(011) := 'Ö'   ##ASCII-URL.URL(011) := '%D6'
0610* ---- Small sharp s, German (sz ligature)
0620##ASCII-URL.ASCII(012) := 'ß'   ##ASCII-URL.URL(012) := '%DF'
0630* ---- Percent sign
0640##ASCII-URL.ASCII(013) := '&'   ##ASCII-URL.URL(013) := '%26'
0650* ---- Question mark
0660##ASCII-URL.ASCII(014) := '?'   ##ASCII-URL.URL(014) := '%3F'
0670* ---- Exclamation mark
0680##ASCII-URL.ASCII(015) := '!'   ##ASCII-URL.URL(015) := '%21'
0690* ---- Period (fullstop)
0700##ASCII-URL.ASCII(016) := '.'   ##ASCII-URL.URL(016) := '%2E'
0710* ---- Comma
0720##ASCII-URL.ASCII(017) := ','   ##ASCII-URL.URL(017) := '%2C'
0730* ---- Plus sign
0740##ASCII-URL.ASCII(018) := '+'   ##ASCII-URL.URL(018) := '%2B'
0750* ---- Space
0760##ASCII-URL.ASCII(019) := ' '   ##ASCII-URL.URL(019) := '%20'
0770* ---- Left parenthesis
0780##ASCII-URL.ASCII(020) := '('   ##ASCII-URL.URL(020) := '%28'
0790* ---- Right parenthesis
0800##ASCII-URL.ASCII(021) := ')'   ##ASCII-URL.URL(021) := '%29'
0810* ---- Tilde
0820##ASCII-URL.ASCII(022) := 'ß'   ##ASCII-URL.URL(022) := '%7E'
0830* ---- Equals sign
0840##ASCII-URL.ASCII(023) := '='   ##ASCII-URL.URL(023) := '%3D'
0850* ---- Number sign
0860##ASCII-URL.ASCII(024) := '#'   ##ASCII-URL.URL(024) := '%23'
0870* ---- Commercial at
0880IF H'41' NE 'A' THEN
0890  ##ASCII-URL.ASCII(025) := H'48'   ##ASCII-URL.URL(025) := '%40'
0900ELSE
0910  ##ASCII-URL.ASCII(025) := H'40'   ##ASCII-URL.URL(025) := '%40'
0920END-IF
0930* ---- Reverse solidus (backslash)
0940IF H'41' NE 'A' THEN
0950  ##ASCII-URL.ASCII(026) := H'BA'   ##ASCII-URL.URL(026) := '%40'
0960ELSE
0970  ##ASCII-URL.ASCII(026) := H'5C' ##ASCII-URL.URL(026) := '%5C'
0980END-IF
0990* ---- Semi-colon
1000##ASCII-URL.ASCII(027) := ';'   ##ASCII-URL.URL(027) := '%3B'
1010*
1020#COUNTER := 27
1030END-SUBROUTINE
1040END
