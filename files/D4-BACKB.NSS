0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - New Demo Application
0030*
0040*        D4-BACKB
0050*
0060* DESCRIPTION
0070*               Define the "back" button to LIST/BROWSE/SELECT
0080*
0090*
0100* AUTHOR        SAG   08.09.1998
0110*
0120* Version       8.3
0130*
0140* Copyright (c) 1997-2016 Software AG, Germany.  All rights reserved.
0150*
0160* HISTORY
0170* USER    DATE       REASON
0180* ------+----------+----------------------------------------------
0190*       ! --.--.-- !
0200* ------+----------+----------------------------------------------
0210*
0220* ------ PARAMETER -----------------------------------------------
0230DEFINE DATA
0240PARAMETER USING D4-PARM
0250END-DEFINE
0260*
0270*
0280DEFINE SUBROUTINE D4-BACKB
0290*
0300IF #DEMO-PARM.#STATUS EQ "S" THEN
0310  #DEMO-MENU.#SE :="T"
0320END-IF
0330*
0340IF #DEMO-PARM.#STATUS EQ "B" THEN
0350  #DEMO-MENU.#BR :="T"
0360END-IF
0370*
0380IF #DEMO-PARM.#STATUS EQ "L" THEN
0390  #DEMO-MENU.#LI :="T"
0400END-IF
0410END-SUBROUTINE
0420*
0430END
0440
