0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Basic Subroutines
0030*
0040*        W3AS2XML
0050*
0060* DESCRIPTION
0070*               A conversion table ASCII to XML.
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
02501 ##XML_ASCII-XML (1:V)
0260  2 ASCII  (A1)
0270  2 XML    (A8)
02801 #COUNTER (I4)
0290END-DEFINE
0300*
0310DEFINE SUBROUTINE W3-ASCII-XML-TABLE
0320*
0330* ---- Ampersand
0340##XML_ASCII-XML.ASCII(001) := "&"        ##XML_ASCII-XML.XML(001) := '&#38;'
0350* ---- Greater than
0360##XML_ASCII-XML.ASCII(002) := ">"        ##XML_ASCII-XML.XML(002) := '&#62;'
0370* ---- Less than
0380##XML_ASCII-XML.ASCII(003) := "<"        ##XML_ASCII-XML.XML(003) := '&#60;'
0390* ---- Apostrophe
0400IF H'41' NE "A" THEN
0410  ##XML_ASCII-XML.ASCII(004) := H'7D' ##XML_ASCII-XML.XML(004) := "&#39;"
0420ELSE
0430  ##XML_ASCII-XML.ASCII(004) := H'27' ##XML_ASCII-XML.XML(004) := "&#39;"
0440END-IF
0450* ---- Quotation mark
0460IF H'41' NE "A" THEN
0470  ##XML_ASCII-XML.ASCII(005) := H'7F' ##XML_ASCII-XML.XML(005) := "&#34;"
0480ELSE
0490  ##XML_ASCII-XML.ASCII(005) := H'22' ##XML_ASCII-XML.XML(005) := "&#34;"
0500END-IF
0510* ---- Small u, dieresis or umlaut mark
0520##XML_ASCII-XML.ASCII(006) := 'ü'        ##XML_ASCII-XML.XML(006) := '&#252;'
0530* ---- Capital U, dieresis or umlaut mark
0540##XML_ASCII-XML.ASCII(007) := 'Ü'        ##XML_ASCII-XML.XML(007) := '&#220;'
0550* ---- Small a, dieresis or umlaut mark
0560##XML_ASCII-XML.ASCII(008) := 'ä'        ##XML_ASCII-XML.XML(008) := '&#228;'
0570* ---- Capital A, dieresis or umlaut mark
0580##XML_ASCII-XML.ASCII(009) := 'Ä'        ##XML_ASCII-XML.XML(009) := '&#196;'
0590* ---- Small o, dieresis or umlaut mark
0600##XML_ASCII-XML.ASCII(010) := 'ö'        ##XML_ASCII-XML.XML(010) := '&#246;'
0610* ---- Capital O, dieresis or umlaut mark
0620##XML_ASCII-XML.ASCII(011) := 'Ö'        ##XML_ASCII-XML.XML(011) := '&#214;'
0630* ---- Small sharp s, German (sz ligature)
0640##XML_ASCII-XML.ASCII(012) := 'ß'        ##XML_ASCII-XML.XML(012) := '&#223;'
0650*
0660#COUNTER := 12
0670END-SUBROUTINE
0680END
