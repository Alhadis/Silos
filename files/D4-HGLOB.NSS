0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - New Demo Application
0030*
0040*        D4-HGLOB
0050*
0060* DESCRIPTION
0070*               Write "global" variables to the HTML Page
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
0260DEFINE SUBROUTINE D4-HGLOB
0270*
0280PERFORM H3-INPUT "H" "START"  #DEMO-PARM.#START  0 0
0290PERFORM H3-INPUT "H" "FROM"   #DEMO-PARM.#FROM   0 0
0300PERFORM H3-INPUT "H" "TO"     #DEMO-PARM.#TO     0 0
0310PERFORM H3-INPUT "H" "OT"     #DEMO-PARM.#OT     0 0
0320PERFORM H3-INPUT "H" "STATUS" #DEMO-PARM.#STATUS 0 0
0330*
0340IF #DEMO-PARM.#MSG NE " " THEN
0350  PERFORM H3-INPUT "H" "MSG"  #DEMO-PARM.#MSG    0 0
0360END-IF
0370*
0380END-SUBROUTINE
0390*
0400END
0410
