0010* ----------------------------------------------------------------------
0020* CLASS  NATURAL HTTP API
0030*
0040*        H3TX2HTM
0050*
0060* DESCRIPTION   This program writes a line to the return page
0070*               A conversion form ASCII to HTML will be done.
0080*
0090*
0100* AUTHOR        SAG   28.07.97
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
0240PARAMETER
02501 H3COUNT   (I4)   /*  o/  : Length of the converted string
02601 H3HTML    (A250) /* io/mH: HTML text after conversion
0270*
0280LOCAL USING W3CONST
0290LOCAL
03001 #H3RETURN_PAGE (A) DYNAMIC
0310END-DEFINE
0320DEFINE SUBROUTINE H3-TEXT-TO-HTML
0330*
0340* ------ ERROR HANDLING ------------------------------------------
0350ON ERROR
0360##W3ERROR.SUBROUTINE := "H3-TEXT-TO-HTML"
0370PERFORM W3ERROR ##W3ERROR
0380ESCAPE ROUTINE
0390END-ERROR
0400*
0410* ------ MAIN PROGRAM --------------------------------------------
0420#H3RETURN_PAGE := H3HTML
0430PERFORM W3TEXT-TO-HTML #H3RETURN_PAGE
0440*
0450H3COUNT := *LENGTH(#H3RETURN_PAGE)
0460H3HTML  := #H3RETURN_PAGE
0470*
0480END-SUBROUTINE
0490END
