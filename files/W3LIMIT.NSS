0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Basic Subroutines
0030*
0040*        W3LIMIT
0050*
0060* DESCRIPTION
0070*               This Program sets a upperbound for the return page
0080*
0090* AUTHOR        ESI   15.09.2004
0100*
0110* VERSION       6.2.
0120*
0130* (c) Copyright  Software AG 2004-2005. All rights reserved.
0140*
0150* HISTORY
0160* USER    DATE       REASON
0170* ------+------------+----------------------------------------------
0180*       !            !
0190* ------+------------+----------------------------------------------
0200*
0210* ------ PARAMETER -----------------------------------------------
0220DEFINE DATA
0230PARAMETER
02401 W3COUNTERMAX (I4)  /* OUT: MAXIMUM FOR COUNTER
0250LOCAL USING W3CONST
0260END-DEFINE
0270*
0280DEFINE SUBROUTINE W3LIMIT
0290*
0300* ------ ERROR HANDLING ------------------------------------------
0310ON ERROR
0320  ##W3ERROR.SUBROUTINE := "W3LIMIT"
0330  PERFORM W3ERROR ##W3ERROR
0340  ESCAPE ROUTINE
0350END-ERROR
0360*
0370* ------ MAIN PROGRAM --------------------------------------------
0380*  1MB -> may take >  8s   /* 2 ** 20
0390*  2MB -> may take > 15s   /* 2 ** 21
0400*  4MB -> may take > 30s   /* 2 ** 22
0410*  8MB -> may take > 60s   /* 2 ** 23
0420* 16MB -> may take > 120s  /* 2 ** 24
0430*
0440* NOTE:
0450* ----------------------------------------------------------------
0460* it is may necessary modify the broker settings
0470* if this value is increaded.
0480W3COUNTERMAX :=  2 ** 21        /* 1200000
0490*
0500END-SUBROUTINE
0510END
