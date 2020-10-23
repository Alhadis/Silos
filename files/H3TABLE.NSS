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
02501 H3ARRAYVALUE    (A/1:V,1:V) DYNAMIC BY VALUE /* i /mH: Table elements
02601 H3ARRAYALIGN    (A1/1:V,1:V)  BY VALUE /* i /  : Alignment of the
0270*                                        /*        table cells
0280*                                        /*        'L' Left (default)
0290*                                        /*        'R' Right
0300*                                        /*        'C' Center
03101 H3ARRAYNOWRAP   (L/1:V,1:V)   BY VALUE /* i /  : No automatic
0320*                                        /*        wrapping
03301 H3HEADLINE      (L)           BY VALUE /* i /  : 1st line as
0340*                                        /*        Headline
03501 H3ALIGN         (A1)          BY VALUE /* i /  : Alignment of the
0360*                                        /*        table
0370*                                        /*        'L' Left (default)
0380*                                        /*        'R' Right
0390*                                        /*        'C' Center
04001 H3SUPPRESSEMPTY (L)           BY VALUE /* i /  : Set to TRUE if cell
0410*                                        /* s to be displayed
0420*                                        /* espite being empty
04301 H3HTML          (L)           BY VALUE /* i /  : Transform Value
0440*                                        /*        to HTML
04501 H3BORDER        (N4)          BY VALUE /* i /  : Set Border size
0460*
0470LOCAL  USING W3CONST
0480LOCAL
04901 II (I4)
05001 IK (I4)
05101 IJ (I4)
05201 REST (I4)
05301 #H3VALUE       (A) DYNAMIC
05401 #NOWRAP        (A6)
0550END-DEFINE
0560*
0570DEFINE SUBROUTINE H3-TABLE
0580* ------ ERROR HANDLING ------------------------------------------
0590ON ERROR
0600##W3ERROR.SUBROUTINE := "H3-TABLE"
0610PERFORM W3ERROR ##W3ERROR
0620ESCAPE ROUTINE
0630END-ERROR
0640*
0650* ------ MAIN PROGRAM --------------------------------------------
0660* --- No elements defined. ---
0670IF H3COLUM LE 0  OR H3ROW LE 0 THEN
0680  ##W3ERROR.SUBROUTINE := "H3-TABLE"
0690  ##W3ERROR.SUBPROGRAM := *PROGRAM
0700  ##W3ERROR.NR         := 20002
0710  ##W3ERROR.LINE       := 0
0720  PERFORM H3-ERROR-TEXT ##W3ERROR.NR ##W3ERROR.TEXT
0730  PERFORM W3ERROR ##W3ERROR
0740  ESCAPE ROUTINE
0750END-IF
0760*
0770IF H3BORDER >= 0 THEN
0780  COMPRESS 'BORDER="' H3BORDER '"> ' INTO #H3VALUE LEAVING NO
0790ELSE
0800  COMPRESS '>' INTO #H3VALUE LEAVING NO
0810END-IF
0820*
0830EXAMINE H3ALIGN TRANSLATE INTO UPPER
0840DECIDE ON FIRST H3ALIGN
0850  VALUE  "L"
0860    COMPRESS 'ALIGN="LEFT"' #H3VALUE INTO #H3VALUE
0870  VALUE  "C"
0880    COMPRESS 'ALIGN="CENTER"' #H3VALUE INTO #H3VALUE
0890  VALUE  "R"
0900    COMPRESS 'ALIGN="RIGHT"' #H3VALUE INTO #H3VALUE
0910  NONE
0920    IGNORE
0930END-DECIDE
0940*
0950COMPRESS '<TABLE' #H3VALUE INTO #H3VALUE
0960PERFORM W3TEXTDYNAMIC #H3VALUE
0970IK := 0
0980IJ := 0
0990*
1000FOR II = 1 TO H3ROW
1010  COMPRESS '<TR>' INTO #H3VALUE LEAVING NO
1020  PERFORM W3TEXTDYNAMIC #H3VALUE
1030  FOR IJ = 1 TO H3COLUM
1040    EXAMINE H3ARRAYALIGN(II,IJ) TRANSLATE INTO UPPER
1050    IF II EQ 1 AND H3HEADLINE THEN
1060      COMPRESS '<TH>' INTO #H3VALUE LEAVING NO
1070    ELSE
1080      IF H3ARRAYNOWRAP(II,IJ) THEN
1090        #NOWRAP := "NOWRAP"
1100      ELSE
1110        #NOWRAP := " "
1120      END-IF
1130      DECIDE ON FIRST H3ARRAYALIGN(II,IJ)
1140        VALUE  "L"
1150          COMPRESS 'ALIGN="LEFT">' INTO #H3VALUE LEAVING NO
1160          COMPRESS "<TD" #NOWRAP #H3VALUE INTO #H3VALUE
1170        VALUE  "C"
1180          COMPRESS 'ALIGN="CENTER">'
1190            INTO #H3VALUE LEAVING NO
1200          COMPRESS "<TD" #NOWRAP #H3VALUE INTO #H3VALUE
1210        VALUE  "R"
1220          COMPRESS 'ALIGN="RIGHT">' INTO #H3VALUE LEAVING NO
1230          COMPRESS "<TD" #NOWRAP #H3VALUE INTO #H3VALUE
1240        NONE
1250          IF #NOWRAP EQ " " THEN
1260            COMPRESS '<TD>' INTO #H3VALUE LEAVING NO
1270          ELSE
1280            COMPRESS '<TD NOWRAP>' INTO #H3VALUE LEAVING NO
1290          END-IF
1300      END-DECIDE
1310    END-IF
1320    PERFORM W3TEXTDYNAMIC #H3VALUE
1330*
1340    IF H3HTML THEN
1350      IF H3ARRAYVALUE(II,IJ) EQ " "  AND  H3SUPPRESSEMPTY THEN
1360        COMPRESS '&nbsp;' INTO #H3VALUE LEAVING NO
1370        PERFORM W3HTMLDYNAMIC #H3VALUE
1380      ELSE
1390        COMPRESS H3ARRAYVALUE(II,IJ) INTO #H3VALUE
1400        PERFORM W3HTMLDYNAMIC #H3VALUE
1410      END-IF
1420    ELSE
1430      IF H3ARRAYVALUE(II,IJ) EQ " "  AND  H3SUPPRESSEMPTY THEN
1440        COMPRESS '&nbsp;' INTO #H3VALUE LEAVING NO
1450        PERFORM W3TEXTDYNAMIC #H3VALUE
1460      ELSE
1470        COMPRESS H3ARRAYVALUE(II,IJ) INTO #H3VALUE
1480        PERFORM W3TEXTDYNAMIC #H3VALUE
1490      END-IF
1500    END-IF
1510*
1520    IF II EQ 1 AND H3HEADLINE THEN
1530      PERFORM W3TEXTDYNAMIC '</TH>'
1540    ELSE
1550      PERFORM W3TEXTDYNAMIC '</TD>'
1560    END-IF
1570*
1580  END-FOR
1590  PERFORM W3TEXTLINEDYNAMIC '</TR>'
1600END-FOR
1610*
1620PERFORM W3TEXTLINEDYNAMIC '</TABLE>'
1630*
1640END-SUBROUTINE
1650END
