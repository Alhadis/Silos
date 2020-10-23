0010* >Natural Source Header 000000
0020* :Mode S
0030* :CP
0040* <Natural Source Header
0050* ----------------------------------------------------------------------
0060* CLASS  NATURAL NJX INTERFACE - UTILITIES
0070*
0080*         FILE72-TO-DYNAMIC
0090*
0100* DESCRIPTION
0110*         Read natural source,
0120*         long lines marked with a + at the first collum will be joined
0130*
0140*
0150* AUTHOR        SAG   11.2000
0160*
0170* VERSION       6.3.1.
0180*
0190* (c) Copyright  Software AG 1997-2006. All rights reserved.
0200*
0210* HISTORY
0220* USER    DATE       REASON
0230* ------+------------+----------------------------------------------
0240* ESI   ! 13.06.2001 ! No Renumber if Text                      ESI1
0250* ESI   ! 13.06.2001 ! does not save last line                  ESI2
0260* ESI   ! 01.08.2001 ! Recalculate External Objecttype          ESI3
0270* ESI   ! 15.12.2006 ! Adapt for NJX
0280* ------+------------+----------------------------------------------
0290*
0300DEFINE DATA PARAMETER
03101 #TOLIBRARY  (A8) BY VALUE /* library the textfile is placed
03201 #TOSOURCE   (A8) BY VALUE /* name of the file
03301 #TOTYPE     (A1) BY VALUE /* type of the file
03401 #OUTSRC      (A) DYNAMIC  /* content of the text file
0350*
03601 #RESPONSE   (I4)          /* response
0370* -------------------------------------------------- parameter USR1057N
0380LOCAL USING USR-MSG   /* Data for message exchange
0390LOCAL USING USR-FLD   /* Description of the field in error
0400LOCAL
04101 V                  (I02)  CONST <100>
04201 USR1057L
0430  2 OBJECT-KEY
0440    3 LIBRARY        (A08)
0450    3 OBJECT-NAME    (A32)
0460    3 OBJECT-TYPE    (A02)
0470*
0480  2 INPUTS
0490    3 OPT-ACCESS     (A01)
0500    3 OPT-UNUSED-1   (L)
0510    3 OPT-UNUSED-2   (A01)
0520    3 OPT-LINE-NUM   (A01)
0530    3 OPT-UNUSED-3   (L)
0540    3 OPT-REDEF-DIR  (L)
0550    3 OPT-UNUSED-4   (A01)
0560    3 OPT-AMOUNT     (I02)
0570    3 OPT-LINESIZE   (I02)
0580*
0590  2 INPUT-OUTPUTS
0600    3 INT-HANDLE     (I04)
0610    3 NEXT-SEQ       (I04)
0620    3 NEXT-NUM       (I02)
0630*
0640  2 OUTPUTS
0650    3 RETURNED       (I02)
0660    3 SRC-NUM        (I02/1:V)
0670    3 SRC-TEXT       (A01/1:V,1:92)
0680    3 REDEFINE SRC-TEXT
0690      4 SRC-GROUP    (1:V)
0700        5 SRC-LINE   (A92)
0710        5 REDEFINE SRC-LINE
0720          6 SRC-LINE-1   (A1)
0730          6 SRC-LINE-71  (A71)
0740*
0750    3 REDEFINE SRC-TEXT
0760      4 DIR-OBJNAME      (A32)    /* Object Name
0770      4 DIR-LIBRARY      (A08)    /* Library ID
0780      4 DIR-OBJTYPE      (A02)    /* Object Type
0790      4 DIR-OBJKIND      (A01)    /* Source or Module
0800      4 DIR-DBID         (A05)    /* DBID of System File
0810      4 DIR-FNR          (A05)    /* FNR of System File
0820      4 DIR-DATN         (A08)    /* Date in Format (YYYYMMDD)
0830      4 DIR-TIMN         (A07)    /* Time in Format (HHIISST)
0840      4 DIR-USERID       (A08)    /* User ID
0850      4 DIR-PROGMODE     (A01)    /* Programming Mode
0860      4 DIR-SRCSIZE      (A10)    /* Source Area Size
0870      4 DIR-GPSIZE       (A10)    /* Size of Module
0880      4 DIR-UNIQUE-ID    (A32)    /* Unique ID
0890      4 DIR-DDM-DBID     (A05)    /* DBID the DDM is cataloged with
0900      4 DIR-DDM-FNR      (A05)    /* FNR the DDM is cataloged with
0910      4 DIR-NATVERS      (A04)    /* NATURAL Version
0920      4 DIR-NATSM        (A02)    /* NATURAL SM Level
0930      4 DIR-INIT-USER    (A08)    /* Init User ID
0940      4 DIR-TID          (A08)    /* Terminal ID
0950      4 DIR-TRANS-NAME   (A08)    /* TP Transcation Name
0960      4 DIR-OPSYS        (A08)    /* Operating System
0970      4 DIR-TPSYS        (A08)    /* TP System
0980      4 DIR-USED-GDA     (A08)    /* Used GDA
0990*
1000    3 SRC-SEQ        (I04/1:V)
1010    3 SRC-LONG       (A01/1:V)
1020*
10301 USR1057N
1040  2 VERSION          (I01)     INIT <0>
10501 REDEFINE USR1057N
1060  2 EXTENDED-PARMS
1070    3 EXTENDED-DATA   (A001/1:1)
1080* ----------------------------------------------
10901 IX                  (I002)
11001 IV                  (I002)
1110* -------------------------------------------------- parmeter W3READENV
11201 TEST-MF             (A001) INIT <"A">
1130*
11401 #ENVNAME            (A072)
11501 #SERVER             (A001)
11601 #LEN                (I004) INIT <0>
1170
1180*
11901 #VALUE              (A) DYNAMIC
12001 #SOURCE              (A) DYNAMIC
1210* #MAX-CGI            (I004)
12201 #PICTURES           (A100)
12301 #MAX-PICTURES       (I004)
1240*
12501 #MAX-EXPIRES        (I004) INIT <19>
12601 #EXPIRES  (A29)
12701 REDEFINE #EXPIRES
1280  2 RDATE   (A17)
1290  2 RTIME   (A8)
1300  2 RZONE   (A4)
1310*
13201 ATIME (T)
13301 ADATE (D)
1340*
13501 EXPIRES(A29)
13601 LANG (I4)
1370END-DEFINE
1380* ---------------------------------------------------- error handling
1390DEFINE SUBROUTINE FILE72-TO-DYNAMIC
1400* ------------------------------------------------- Name of the source
1410OBJECT-NAME  := #TOSOURCE
1420*
1430* ------------------------------------------------ Name of the library
1440IF #TOLIBRARY = " "
1450  LIBRARY  := *LIBRARY-ID
1460ELSE
1470  LIBRARY  := #TOLIBRARY
1480END-IF
1490EXAMINE LIBRARY TRANSLATE INTO UPPER
1500*
1510* ------------------------------ for MF only linesize of 92 is possible
1520* ------------------------- error at userexit, more then 92 may not run
1530* IF TEST-MF EQ H'41' THEN
1540*  OPT-LINESIZE  := 250
1550* ELSE
1560OPT-LINESIZE  := 92
1570* END-IF
1580* ----------------------------------------- Set Interface to 'USR1057N'
1590OPT-LINE-NUM  := 'Y'
1600OPT-REDEF-DIR := TRUE
1610OPT-AMOUNT    := V
1620OPT-ACCESS   := "O"
1630* ------------------------------------------- Set header for HTML page
1640*
1650* ----------------------------------------------------- Read all lines
1660REPEAT
1670  CALLNAT 'USR1057N' USR1057L  USR1057N.EXTENDED-PARMS NAD-MSG NAD-FLD
1680  OPT-ACCESS := "R"
1690  IF MSG-NR NE 0 AND MSG-NR NE 100 THEN
1700    IF MSG-NR EQ 1006 THEN
1710      COMPRESS 'Error: ' MSG-NR MSG 'or is locked.' INTO #OUTSRC
1720*
1730      COMPRESS "SOURCE='" OBJECT-NAME "'" INTO OBJECT-NAME LEAVING NO
1740      EXAMINE #OUTSRC FOR ":1:" REPLACE WITH OBJECT-NAME
1750    ELSE
1760      COMPRESS 'Error:' MSG-NR MSG'.' INTO #OUTSRC
1770    END-IF
1780  END-IF
1790* ------------------------------------------------------- display lines
1800  FOR IX = 1 TO RETURNED
1810    IF SRC-NUM(IX) NE 0 THEN
1820      IF SRC-LINE-1(IX) = "+"
1830        COMPRESS FULL #VALUE SRC-LINE-71(IX) INTO #VALUE LEAVING NO
1840      ELSE
1850        IF SRC-LINE-1(IX) = "-"
1860          COMPRESS FULL #VALUE SRC-LINE-71(IX) INTO #VALUE LEAVING NO
1870*          PERFORM W3TEXTLINEDYNAMIC #VALUE
1880          COMPRESS #OUTSRC #VALUE H'0D0A' INTO #OUTSRC
1890          COMPRESS " " INTO #VALUE LEAVING NO
1900        ELSE
1910*         PERFORM W3TEXTLINEDYNAMIC SRC-LINE-71(IX)
1920          COMPRESS #OUTSRC SRC-LINE-71(IX) INTO #OUTSRC
1930        END-IF
1940      END-IF
1950    END-IF
1960  END-FOR
1970* ------------------------------------------------- Error from USR1057N
1980  IF MSG-NR NE 0
1990    ESCAPE BOTTOM
2000  END-IF
2010END-REPEAT
2020* ------------------------------------------------------ close USR1057N
2030OPT-ACCESS := 'C'
2040CALLNAT 'USR1057N' USR1057L USR1057N.EXTENDED-PARMS NAD-MSG NAD-FLD
2050* ------------------------------------------------------ close HTTP Api
2060*
2070* ================================================================= End
2080END-SUBROUTINE
2090END
