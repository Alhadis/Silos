0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Exapmle Programs
0030*
0040*        E3EXAEND
0050*
0060* DESCRIPTION   Generates the bottom line for the example Programs.
0070*
0080* AUTHOR        SAG   08.09.1998
0090*
0100* VERSION       6.2.
0110*
0120* (c) Copyright  Software AG 1997-2005. All rights reserved.
0130*
0140* HISTORY
0150* USER    DATE       REASON
0160* ------+----------+----------------------------------------------
0170*       ! --.--.-- !
0180* ------+----------+----------------------------------------------
0190*
0200* ------ PARAMETER -----------------------------------------------
0210DEFINE DATA
0220LOCAL USING W3PINFO
0230LOCAL USING W3CONST
0240LOCAL
02501 #VALUE (A) DYNAMIC
0260END-DEFINE
0270*
0280DEFINE SUBROUTINE E3-EXAMPLE-END
0290*
0300ON ERROR
0310  ##W3ERROR.SUBROUTINE := "E3-EXAMPLE-END"
0320  PERFORM W3ERROR ##W3ERROR
0330  ESCAPE ROUTINE
0340END-ERROR
0350*
0360RESET ##W3INFO
0370PERFORM W3INFO ##W3INFO
0380COMPRESS "<TABLE BORDER='0' WIDTH='100%' CELLSPACING='0' "-
0390  "CELLPADDING='5'>"
0400  '<TR BGCOLOR="#00cc66"><TD>' ##W3INFO.LOG-TIME
0410  "</TD><TD ALIGN='RIGHT'>" 'Natural'
0420  "</TD></TR></TABLE>"
0430  INTO #VALUE LEAVING NO
0440PERFORM W3TEXT #VALUE
0450*
0460END-SUBROUTINE
0470END
