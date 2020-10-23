0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3COMMEN
0050*
0060* DESCRIPTION   This Program generates a Comment Line
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
02201 #H3VALUE    (A) DYNAMIC BY VALUE /* i /m : Value to set as comment
0230LOCAL USING W3CONST
0240LOCAL
02501 #HTTP_VALUE (A) DYNAMIC
0260END-DEFINE
0270*
0280DEFINE SUBROUTINE H3-COMMENT
0290*
0300
0310PERFORM W3TEXTDYNAMIC #HTTP_VALUE
0320*
0330IF #H3VALUE NE " " THEN
0340  COMPRESS '<!--' #H3VALUE '-->' ##HTTP_NEWLINE INTO #HTTP_VALUE
0350ELSE
0360  COMPRESS '<!-- -->' ##HTTP_NEWLINE INTO #HTTP_VALUE
0370END-IF
0380*
0390PERFORM W3TEXTDYNAMIC #HTTP_VALUE
0400*
0410END-SUBROUTINE
0420END
