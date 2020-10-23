0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Basic Subroutines
0030*
0040*        W3ERROR-TEMPLATE
0050*
0060* DESCRIPTION
0070*               This Program generates the error return page.
0080*
0090*
0100* AUTHOR        SAG   19.03.97
0110*
0120* VERSION       6.2.
0130*
0140* (c) Copyright  Software AG 1997-2005. All rights reserved.
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
02501 ##ERROR-NR          (I4) BY VALUE
02601 ##ERROR-LINE        (I4) BY VALUE
02701 ##ERROR-SUBPROGRAM  (A) DYNAMIC BY VALUE
02801 ##ERROR-SUBROUTINE  (A) DYNAMIC BY VALUE
02901 ##ERROR-TEXT        (A) DYNAMIC BY VALUE
03001 ##NATWEB_LOG-TIME   (A30) BY VALUE
03101 ##NATWEB_EWWVER     (A) DYNAMIC BY VALUE
03201 ##NATWEB_NWWVER     (A) DYNAMIC BY VALUE
0330*
0340LOCAL USING W3CONST
0350LOCAL
03601 W3VALUE             (A) DYNAMIC
03701 LOGTIME             (A40)
03801 ERR                 (N6)
03901 REDEFINE ERR
0400  2 FILLER            2X
0410  2 ERR-A             (A4)
0420END-DEFINE
0430*
0440DEFINE SUBROUTINE W3ERROR-TEMPLATE-XML
0450* ------ ERROR HANDLING ------------------------------------------
0460ON ERROR
0470  ##W3ERROR.SUBROUTINE := "W3ERROR-TEMPLATE-XML"
0480  ##W3ERROR.NR         := *ERROR-NR
0490  ##W3ERROR.LINE       := *ERROR-LINE
0500*
0510  PERFORM W3CLEAR
0520*
0530  COMPRESS 'FATAL: Error at external subroutine W3ERROR-TEMPLATE'
0540           '(W3ERRTEMP)' ##HTTP_NEWLINE
0550           '##HTTP_ERROR_API : W3ERROR'     ##HTTP_NEWLINE
0560           '##HTTP_ERROR_NR  :' *ERROR-NR   ##HTTP_NEWLINE
0570           '##HTTP_ERROR_LINE:' *ERROR-LINE ##HTTP_NEWLINE
0580           INTO W3VALUE
0590  PERFORM W3TEXTLINE W3VALUE
0600*
0610  ESCAPE ROUTINE
0620END-ERROR
0630*
0640* ------ MAIN PROGRAM --------------------------------------------
0650*
0660PERFORM W3CLEAR
0670COMPRESS "&#91;" ##NATWEB_LOG-TIME "&#93;" INTO LOGTIME LEAVING NO
0680*
0690PERFORM W3CONTENT-TYPE 'text/html'
0700*
0710COMPRESS '<?xml version="1.0"?>' ##HTTP_NEWLINE
0720  '<html xmlns="http://www.w3.org/TR/REC-html40"><head>'
0730  ##HTTP_NEWLINE '<meta http-equiv="Content-Type" content="text/'-
0740  'html; charset="iso-8859-1">' ##HTTP_NEWLINE
0750  INTO W3VALUE LEAVING NO
0760PERFORM W3TEXTDYNAMIC W3VALUE
0770*
0780COMPRESS '<title>NWW Error Report - ' ##NATWEB_LOG-TIME '</title>'
0790  ##HTTP_NEWLINE INTO W3VALUE
0800PERFORM W3TEXTDYNAMIC W3VALUE
0810*
0820PERFORM W3TEXTLINEDYNAMIC '</head><body><table border="0" width="100%" '-
0830         'cellspacing="0" cellpadding="5">'
0840COMPRESS '<tr bgcolor="#CCFFCC"><td><h2 align="center">'-
0850         'NWW Error Report</h2>' ##HTTP_NEWLINE
0860         '<p align="center"><i><small>Natural Web Interface:'
0870         ##NATWEB_NWWVER
0880         '<br />HTTP Server Extension:' ##NATWEB_EWWVER
0890         '</small></i></p></td></tr>' ##HTTP_NEWLINE INTO W3VALUE
0900PERFORM W3TEXTDYNAMIC W3VALUE
0910*
0920PERFORM W3TEXTLINEDYNAMIC '<tr><td><b>The following error has been '-
0930                 'logged in the error log file:</b></td></tr></table>'
0940*
0950PERFORM W3TEXTLINEDYNAMIC '<table border="0" width="100%" cellspacing="15" '-
0960                   'cellpadding="0">'
0970IF ##ERROR-SUBROUTINE NE " " THEN
0980  PERFORM W3TEXTDYNAMIC '<tr><td align="right"><b>Subroutine:'
0990              -'</b></td><td align="left"><tt>'
1000  PERFORM W3TEXTLINE ##ERROR-SUBROUTINE
1010*
1020  PERFORM W3TEXTDYNAMIC '</tt></td></tr><tr><td align="right"><b>'
1030                 -'Source:</b></td><td align="left"><tt>'
1040  PERFORM W3TEXTDYNAMIC ##ERROR-SUBPROGRAM
1050ELSE
1060  PERFORM W3TEXTDYNAMIC '<tr><td align="right"><b>'
1070                 -'Subprogram:</b></td><td align="left"><tt>'
1080  PERFORM W3TEXTDYNAMIC ##ERROR-SUBPROGRAM
1090END-IF
1100*
1110IF ##ERROR-LINE GT 0 THEN
1120  PERFORM W3TEXTDYNAMIC '</tt></td></tr><tr><td align="right"><b>Error Line:'
1130                 -'</b></td><td align="left"><tt>'
1140  PERFORM W3TEXTLINE ##ERROR-LINE
1150END-IF
1160*
1170W3VALUE := '</tt></td></tr><tr><td align="right"><b>Error Nr:'
1180              -'</b></td><td align="left"><tt>'
1190IF ##ERROR-NR LT 20000 THEN
1200  ERR := ##ERROR-NR
1210  COMPRESS W3VALUE "NAT" ERR-A '</tt></td></tr>'
1220  INTO W3VALUE LEAVING NO
1230ELSE
1240  ERR := ##ERROR-NR - 20000
1250  COMPRESS W3VALUE "NWW" ERR-A '</tt></td></tr>'
1260  INTO W3VALUE LEAVING NO
1270END-IF
1280PERFORM W3TEXTLINE W3VALUE
1290*
1300PERFORM W3TEXTDYNAMIC '<tr valign="top"><td align="right"><b>Error Text:'
1310              -'</b></td><td align="left"><tt>'
1320PERFORM W3TEXTLINE ##ERROR-TEXT
1330*
1340PERFORM W3TEXTLINEDYNAMIC '</tt></td></tr></table><table border="0" '-
1350                   'width="100%" cellspacing="0" cellpadding="5">'
1360COMPRESS '<tr bgcolor="#CCFFCC"><td>NWW ERROR -' ##NATWEB_LOG-TIME
1370         '</td>' ##HTTP_NEWLINE INTO W3VALUE
1380PERFORM W3TEXTDYNAMIC W3VALUE
1390*
1400PERFORM W3TEXTLINEDYNAMIC '<td align="right">Natural'-
1410                   '</td></tr></table>'
1420PERFORM W3TEXTDYNAMIC '</body></html>'
1430*
1440END-SUBROUTINE
1450END
