0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - New Demo Application
0030*
0040*        D4-HPERS
0050*
0060* DESCRIPTION
0070*               Write the "global" variable PERSON to the HTML Page
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
0260DEFINE SUBROUTINE D4-HPERS
0270PERFORM H3-INPUT "H" "ID" #DEMO-PARM.#PERSON 0 0
0280END-SUBROUTINE
0290*
0300END
0310
