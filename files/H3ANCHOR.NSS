0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3ANCHOR
0050*
0060* DESCRIPTION   This Program generates a Anchor
0070*
0080* AUTHOR        SAG   28.07.97
0090*
0100* VERSION       6.2.
0110*
0120* (c) Copyright  Software AG 1997-2005. All rights reserved.
0130*
0140* HISTORY
0150* USER    DATE       REASON
0160* ------+----------+----------------------------------------------
0170*       ! --.--.-- !
0180* ------+----------+----------------------------------------------
0190*
0200DEFINE DATA
0210PARAMETER
02201 #H3URL             (A) DYNAMIC BY VALUE /* i /m : URL of the Link. Enter
0230*                                         /*        'THIS' to reference
0240*                                         /*        he current page as URL
02501 #H3NAME            (A) DYNAMIC BY VALUE /* i /  : Name of the Anchor
02601 #H3VALUE           (A) DYNAMIC BY VALUE /* i / H: To be displayed as
0270*                                         /*        anchor text
0280LOCAL USING W3CONST
0290LOCAL
03001 #HTTP_VALUE        (A) DYNAMIC
03101 #TEMP              (A) DYNAMIC
0320END-DEFINE
0330*
0340DEFINE SUBROUTINE H3-ANCHOR
0350*
0360ON ERROR
0370  ##W3ERROR.SUBROUTINE := "H3-ANCHOR"
0380  PERFORM W3ERROR ##W3ERROR
0390  ESCAPE ROUTINE
0400END-ERROR
0410* ------ MAIN PROGRAM --------------------------------------------
0420*
0430IF #H3URL NE " " THEN
0440  COMPRESS "<A HREF='" INTO #HTTP_VALUE LEAVING NO
0450  IF #H3NAME EQ " " THEN
0460    COMPRESS #HTTP_VALUE #H3URL "'>" INTO #HTTP_VALUE LEAVING NO
0470  ELSE
0480    #TEMP := #H3URL
0490    EXAMINE #TEMP TRANSLATE INTO UPPER
0500    IF #TEMP EQ "THIS" THEN
0510      COMPRESS #HTTP_VALUE "#" #H3NAME "'>" INTO #HTTP_VALUE LEAVING NO
0520    ELSE
0530      COMPRESS #HTTP_VALUE #H3URL '#' #H3NAME "'>" INTO #HTTP_VALUE LEAVING NO
0540    END-IF
0550  END-IF
0560ELSE
0570  COMPRESS "<A NAME='" #H3NAME "'>" INTO #HTTP_VALUE LEAVING NO
0580END-IF
0590PERFORM W3TEXTDYNAMIC #HTTP_VALUE
0600*
0610IF #H3VALUE NE " " THEN
0620  PERFORM W3HTML #H3VALUE
0630END-IF
0640*
0650PERFORM W3TEXTLINEDYNAMIC "</A>"
0660*
0670END-SUBROUTINE
0680END
