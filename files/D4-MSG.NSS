0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - New Demo Application
0030*
0040*        D4-MENUB
0050*
0060* DESCRIPTION
0070*               generate the menu bar for the demo HTML page
0080*
0090* AUTHOR        SAG   08.09.1998
0100*
0110* Version       8.3
0120*
0130* Copyright (c) 1997-2016 Software AG, Germany.  All rights reserved.
0140*
0150* HISTORY
0160* USER    DATE       REASON
0170* ------+----------+----------------------------------------------
0180*       ! --.--.-- !
0190* ------+----------+----------------------------------------------
0200*
0210* ------ PARAMETER -----------------------------------------------
0220DEFINE DATA
0230PARAMETER USING D4-PARM
0240END-DEFINE
0250*
0260DEFINE SUBROUTINE D4-MSG
0270*
0280IF #DEMO-PARM.#MSG NE " " THEN
0290  PERFORM W3TEXTDYNAMIC "<FONT COLOR='red' SIZE='3'>"
0300  PERFORM W3HTMLDYNAMIC #DEMO-PARM.#MSG
0310  PERFORM W3TEXTLINEDYNAMIC "</FONT>"
0320*
0330  RESET #DEMO-PARM.#MSG
0340END-IF
0350*
0360END-SUBROUTINE
0370*
0380END
