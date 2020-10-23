0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3PARAGR
0050*
0060* DESCRIPTION   This Program generates a paragraph
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
02201 #H3ALIGN    (A1) BY VALUE /* i /m : Align the paragraph to:
0230*                           /*        'L' Left (default)
0240*                           /*        'R' Right
0250*                           /*        'C' Center
02601 #H3VALUE    (A) DYNAMIC BY VALUE /* i /mH: HTML text after the paragraph
0270*
0280LOCAL USING W3CONST
0290END-DEFINE
0300*
0310DEFINE SUBROUTINE H3-PARAGRAPH
0320*
0330ON ERROR
0340  ##W3ERROR.SUBROUTINE := "H3-PARAGRAPH"
0350  PERFORM W3ERROR ##W3ERROR
0360  ESCAPE ROUTINE
0370END-ERROR
0380*
0390EXAMINE #H3ALIGN TRANSLATE INTO UPPER
0400*
0410DECIDE ON FIRST #H3ALIGN
0420  VALUE "L"
0430    PERFORM W3TEXTDYNAMIC '<P ALIGN="LEFT">'
0440  VALUE "R"
0450    PERFORM W3TEXTDYNAMIC '<P ALIGN="RIGHT">'
0460  VALUE "C"
0470    PERFORM W3TEXTDYNAMIC '<P ALIGN="CENTER">'
0480  NONE
0490    PERFORM W3TEXTDYNAMIC '<P>'
0500END-DECIDE
0510*
0520IF #H3VALUE NE " " THEN
0530  PERFORM W3HTMLLINE #H3VALUE
0540ELSE
0550   PERFORM W3TEXTDYNAMIC ##HTTP_NEWLINE
0560END-IF
0570*
0580END-SUBROUTINE
0590END
