0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Demo Application
0030*
0040*        D3-END
0050*
0060* DESCRIPTION
0070*               Generate the "end" of a demo HTML Page
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
0260DEFINE SUBROUTINE D3-END
0270*
0280PERFORM D3-MENUBR #DEMO-MENU #DEMO-PARM
0290*
0300PERFORM D3-HGLOB #DEMO-MENU #DEMO-PARM
0310*
0320PERFORM H3-CLOSE-FORM
0330*
0340PERFORM H3-CLOSE-HTML
0350*
0360END-SUBROUTINE
0370*
0380END
