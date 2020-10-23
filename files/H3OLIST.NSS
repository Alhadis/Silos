0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3OLIST
0050*
0060* DESCRIPTION   This Program generates the start of a list
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
0200DEFINE DATA
0210PARAMETER
02201 #H3TYPE        (A1) BY VALUE /* i /m: Set list as:
0230*                              /*       'O' Ordered list
0240*                              /*       'U' Unordered list
0250*                              /*       'D' Directory list
0260*                              /*       'M' Menu list
02701 #H3BULLET      (A1) BY VALUE /* i /m: Type of list if ordered list:
0280*                              /*       '1' Arabic numbers (default)
0290*                              /*           (1, 2, 3, ...)
0300*                              /*       'a' Alphanumeric, lowercase
0310*                              /*           (a, b, c, ...)
0320*                              /*       'A' Alphanumeric, uppercase
0330*                              /*           (A, B, C, ...)
0340*                              /*       'i' Roman numbers, lowercase
0350*                              /*           (i, ii, iii, ...)
0360*                              /*       'I' Roman numbers, uppercase
0370*                              /*           (I, II, III, ...)
0380*                              /* i /m: Type of bullet if unordered list:
0390*                              /*       'D' Disc
0400*                              /*       'S' Square
0410*                              /*       'C' Circle
0420*
0430LOCAL USING W3PINFO
0440LOCAL USING W3CONST
0450LOCAL
04601 #HTTP_VALUE        (A) DYNAMIC
04701 #H3BUL             (A6)
04801 #MAX               (N2)
04901 #NR                (A4)
0500END-DEFINE
0510*
0520DEFINE SUBROUTINE H3-OPEN-LIST
0530*
0540ON ERROR
0550##W3ERROR.SUBROUTINE := "H3-OPEN-LIST"
0560PERFORM W3ERROR ##W3ERROR
0570ESCAPE ROUTINE
0580END-ERROR
0590*
0600RESET ##W3INFO
0610PERFORM W3INFO ##W3INFO
0620ADD 1 TO ##W3INFO.LIST_MAX
0630* --- List nested too deep: ##W3INFO.LIST_MAX ---
0640IF ##W3INFO.LIST_MAX GT 10 THEN
0650  ##W3ERROR.SUBROUTINE := "H3-OPEN-LIST"
0660  ##W3ERROR.SUBPROGRAM := *PROGRAM
0670  ##W3ERROR.NR         := 20006
0680  PERFORM H3-ERROR-TEXT ##W3ERROR.NR ##W3ERROR.TEXT
0690  #NR := ##W3INFO.LIST_MAX
0700  EXAMINE ##W3ERROR.TEXT FOR '%1%' REPLACE WITH #NR
0710  PERFORM W3ERROR ##W3ERROR
0720  ESCAPE ROUTINE
0730END-IF
0740*
0750IF #H3TYPE EQ " " THEN
0760  #H3TYPE := "U"
0770END-IF
0780*
0790#H3BUL := #H3BULLET
0800#MAX := ##W3INFO.LIST_MAX
0810##W3INFO.LIST(#MAX) := #H3TYPE
0820*
0830EXAMINE #H3TYPE TRANSLATE INTO UPPER
0840*
0850DECIDE ON FIRST VALUE OF #H3TYPE
0860  VALUE "O"
0870    DECIDE ON FIRST VALUE #H3BUL
0880      VALUE "A", 'a', "I", 'i', "1"
0890        IGNORE
0900      NONE
0910        #H3BUL := " "
0920    END-DECIDE
0930*
0940    IF #H3BUL NE " " THEN
0950      COMPRESS '<OL TYPE="' #H3BUL '">' INTO #HTTP_VALUE LEAVING NO
0960    ELSE
0970      COMPRESS '<OL>' INTO #HTTP_VALUE LEAVING NO
0980    END-IF
0990  VALUE "U"
1000    DECIDE ON FIRST VALUE #H3BUL
1010      VALUE "D", "D"
1020        #H3BUL := "DISC"
1030      VALUE "C", "C"
1040        #H3BUL := "CIRCLE"
1050      VALUE "S", "S"
1060        #H3BUL := "SQUARE"
1070      NONE
1080        #H3BUL := " "
1090    END-DECIDE
1100    IF #H3BUL NE " " THEN
1110      COMPRESS '<UL TYPE="' #H3BUL '">' INTO #HTTP_VALUE LEAVING NO
1120    ELSE
1130      COMPRESS '<UL>' INTO #HTTP_VALUE LEAVING NO
1140    END-IF
1150  VALUE "D"
1160    COMPRESS '<DIR>'INTO #HTTP_VALUE LEAVING NO
1170  VALUE "M"
1180    COMPRESS '<MENU>' INTO #HTTP_VALUE LEAVING NO
1190  NONE
1200    IGNORE
1210END-DECIDE
1220*
1230PERFORM W3TEXTLINEDYNAMIC #HTTP_VALUE
1240*
1250##W3INFO.ACTION := "L"
1260PERFORM W3INFO ##W3INFO
1270ADD 1 TO ##W3INFO.LIST_MAX
1280END-SUBROUTINE
1290END
