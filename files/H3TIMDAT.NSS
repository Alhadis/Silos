0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3TIMDAT
0050*
0060* DESCRIPTION   This Program generates a 'generated time' string
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
0210LOCAL USING W3PINFO
0220LOCAL USING W3CONST
0230LOCAL
02401 #HTTP_VALUE (A) DYNAMIC
0250END-DEFINE
0260*
0270DEFINE SUBROUTINE H3-TIME_DATE
0280*
0290ON ERROR
0300  ##W3ERROR.SUBROUTINE := "H3-TIME_DATE"
0310  PERFORM W3ERROR ##W3ERROR
0320  ESCAPE ROUTINE
0330END-ERROR
0340*
0350RESET ##W3INFO
0360PERFORM W3INFO ##W3INFO
0370COMPRESS 'generated:' ##W3INFO.LOG-TIME INTO #HTTP_VALUE
0380PERFORM W3TEXTDYNAMIC #HTTP_VALUE
0390*
0400END-SUBROUTINE
0410END
