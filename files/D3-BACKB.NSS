0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Demo Application
0030*
0040*        D3-BACKB
0050*
0060* DESCRIPTION
0070*               Define the "back" button to LIST/BROWSE/SELECT
0080*
0090* AUTHOR        SAG   11.04.97
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
0230PARAMETER USING D3-PARM
0240END-DEFINE
0250*
0260DEFINE SUBROUTINE D3-BACKB
0270*
0280IF #DEMO-PARM.#STATUS EQ "S" THEN
0290  #DEMO-MENU.#SE :="T"
0300END-IF
0310*
0320IF #DEMO-PARM.#STATUS EQ "B" THEN
0330  #DEMO-MENU.#BR :="T"
0340END-IF
0350*
0360IF #DEMO-PARM.#STATUS EQ "L" THEN
0370  #DEMO-MENU.#LI :="T"
0380END-IF
0390END-SUBROUTINE
0400*
0410END
