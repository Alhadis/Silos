0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3TABLE
0050*
0060* DESCRIPTION   This Program generates a Table
0070*
0080* AUTHOR        SAG   28.07.97
0090*
0100* Version       8.3
0110*
0120* Copyright (c) 1997-2016 Software AG, Germany.  All rights reserved.
0130*
0140* HISTORY
0150* USER    DATE       REASON
0160* ------+----------+----------------------------------------------
0170*       ! --.--.-- !
0180* ------+----------+----------------------------------------------
0190*
0200* ------ PARAMETER -----------------------------------------------
0210DEFINE DATA
0220PARAMETER
02301 H3ROW           (N4)          BY VALUE /* i /m : Number of rows
02401 H3COLUM         (N4)          BY VALUE /* i /m : Number of colums
02501 H3TITLECOLOR    (A32)         BY VALUE /* i /  : color of the Title
02601 H3LINECOLOR     (A32)         BY VALUE /* i /  : color of the Title
02701 H3ARRAYVALUE    (A/1:V,1:V) DYNAMIC BY VALUE /* i /mH: Table elements
02801 H3ARRAYALIGN    (A1/1:V,1:V)  BY VALUE /* i /  : Alignment of the
0290*                                        /*        table cells
0300*                                        /*        'L' Left (default)
0310*                                        /*        'R' Right
0320*                                        /*        'C' Center
03301 H3ARRAYNOWRAP   (L/1:V,1:V)   BY VALUE /* i /  : No automatic
0340*                                        /*        wrapping
03501 H3HEADLINE      (L)           BY VALUE /* i /  : 1st line as
0360*                                        /*        Headline
03701 H3ALIGN         (A1)          BY VALUE /* i /  : Alignment of the
0380*                                        /*        table
0390*                                        /*        'L' Left (default)
0400*                                        /*        'R' Right
0410*                                        /*        'C' Center
04201 H3SUPPRESSEMPTY (L)           BY VALUE /* i /  : Set to TRUE if cell
0430*                                        /* s to be displayed
0440*                                        /* espite being empty
04501 H3HTML          (L)           BY VALUE /* i /  : Transform Value
0460*                                        /*        to HTML
04701 H3BORDER        (N4)          BY VALUE /* i /  : Set Border size
0480*
0490LOCAL  USING W3CONST
0500LOCAL
05101 II (I4)
05201 IK (I4)
05301 IJ (I4)
05401 IL (I4)
05501 REST (I4)
05601 #H3VALUE       (A) DYNAMIC
05701 #NOWRAP        (A6)
0580END-DEFINE
0590*
0600DEFINE SUBROUTINE H3-TABLE-COLOR
0610* ------ ERROR HANDLING ------------------------------------------
0620ON ERROR
0630  ##W3ERROR.SUBROUTINE := "H3-TABLE-COLOR"
0640  PERFORM W3ERROR ##W3ERROR
0650  ESCAPE ROUTINE
0660END-ERROR
0670*
0680* ------ MAIN PROGRAM --------------------------------------------
0690* --- No elements defined. ---
0700IF H3COLUM LE 0  OR H3ROW LE 0 THEN
0710  ##W3ERROR.SUBROUTINE := "H3-TABLE-COLOR"
0720  ##W3ERROR.SUBPROGRAM := *PROGRAM
0730  ##W3ERROR.NR         := 20002
0740  ##W3ERROR.LINE       := 0
0750  PERFORM H3-ERROR-TEXT ##W3ERROR.NR ##W3ERROR.TEXT
0760  PERFORM W3ERROR ##W3ERROR
0770  ESCAPE ROUTINE
0780END-IF
0790*
0800IF H3BORDER >= 0 THEN
0810  COMPRESS 'BORDER="' H3BORDER '"> ' INTO #H3VALUE LEAVING NO
0820ELSE
0830  COMPRESS '>' INTO #H3VALUE LEAVING NO
0840END-IF
0850*
0860EXAMINE H3ALIGN TRANSLATE INTO UPPER
0870DECIDE ON FIRST H3ALIGN
0880  VALUE  "L"
0890    COMPRESS 'ALIGN="LEFT"' #H3VALUE INTO #H3VALUE
0900  VALUE  "C"
0910    COMPRESS 'ALIGN="CENTER"' #H3VALUE INTO #H3VALUE
0920  VALUE  "R"
0930    COMPRESS 'ALIGN="RIGHT"' #H3VALUE INTO #H3VALUE
0940  NONE
0950    IGNORE
0960END-DECIDE
0970*
0980COMPRESS '<TABLE' #H3VALUE INTO #H3VALUE
0990PERFORM W3TEXTDYNAMIC #H3VALUE
1000IK := 0
1010IJ := 0
1020*
1030FOR II = 1 TO H3ROW
1040*
1050  IF II = 1 AND H3TITLECOLOR NE " "
1060    COMPRESS '<TR BGCOLOR="' H3TITLECOLOR '">' INTO #H3VALUE LEAVING NO
1070  ELSE
1080    ADD 1 TO IL
1090    IF H3LINECOLOR NE " "  AND IL GE 2 THEN
1100      COMPRESS '<TR BGCOLOR="' H3LINECOLOR '">' INTO #H3VALUE LEAVING NO
1110      IL := 0
1120    ELSE
1130      COMPRESS '<TR>' INTO #H3VALUE LEAVING NO
1140    END-IF
1150  END-IF
1160  PERFORM W3TEXTDYNAMIC #H3VALUE
1170*
1180  FOR IJ = 1 TO H3COLUM
1190    EXAMINE H3ARRAYALIGN(II,IJ) TRANSLATE INTO UPPER
1200    IF II EQ 1 AND H3HEADLINE THEN
1210      COMPRESS '<TH>' INTO #H3VALUE LEAVING NO
1220    ELSE
1230      IF H3ARRAYNOWRAP(II,IJ) THEN
1240         #NOWRAP := "NOWRAP"
1250      ELSE
1260         #NOWRAP := " "
1270      END-IF
1280*
1290      DECIDE ON FIRST H3ARRAYALIGN(II,IJ)
1300        VALUE  "L"
1310          COMPRESS 'ALIGN="LEFT">' INTO #H3VALUE LEAVING NO
1320          COMPRESS "<TD" #NOWRAP #H3VALUE INTO #H3VALUE
1330        VALUE  "C"
1340          COMPRESS 'ALIGN="CENTER">' INTO #H3VALUE LEAVING NO
1350          COMPRESS "<TD" #NOWRAP #H3VALUE INTO #H3VALUE
1360        VALUE  "R"
1370          COMPRESS 'ALIGN="RIGHT">' INTO #H3VALUE LEAVING NO
1380          COMPRESS "<TD" #NOWRAP #H3VALUE INTO #H3VALUE
1390        NONE
1400          IF #NOWRAP EQ " " THEN
1410           COMPRESS '<TD>' INTO #H3VALUE LEAVING NO
1420          ELSE
1430           COMPRESS '<TD NOWRAP>' INTO #H3VALUE LEAVING NO
1440          END-IF
1450      END-DECIDE
1460    END-IF
1470    PERFORM W3TEXTDYNAMIC #H3VALUE
1480*
1490    IF H3HTML THEN
1500      IF H3ARRAYVALUE(II,IJ) EQ " "  AND  H3SUPPRESSEMPTY THEN
1510        PERFORM W3TEXTDYNAMIC '&nbsp;'
1520      ELSE
1530        PERFORM W3HTMLDYNAMIC H3ARRAYVALUE(II,IJ)
1540      END-IF
1550    ELSE
1560      IF H3ARRAYVALUE(II,IJ) EQ " " AND H3SUPPRESSEMPTY THEN
1570        PERFORM W3TEXTDYNAMIC '&nbsp;'
1580      ELSE
1590        PERFORM W3TEXTDYNAMIC H3ARRAYVALUE(II,IJ)
1600      END-IF
1610    END-IF
1620*
1630    IF II EQ 1 AND H3HEADLINE THEN
1640      COMPRESS '</TH>' INTO #H3VALUE LEAVING NO
1650    ELSE
1660      COMPRESS '</TD>' INTO #H3VALUE LEAVING NO
1670    END-IF
1680    PERFORM W3TEXTDYNAMIC #H3VALUE
1690*
1700  END-FOR
1710  PERFORM W3TEXTLINEDYNAMIC '</TR>'
1720END-FOR
1730*
1740PERFORM W3TEXTLINEDYNAMIC '</TABLE>'
1750*
1760END-SUBROUTINE
1770END
