0010* ----------------------------------------------------------------------
0020* CLASS  NATURAL HTTP API
0030*
0040*        H3ASURL
0050*
0060* DESCRIPTION   This program writes a line to the return page
0070*               A conversion form ASCII to HTML will be done.
0080*
0090*               german ebcdic is used!!!
0100*
0110* AUTHOR        SAG   28.07.1997
0120*
0130* Version       8.3
0140*
0150* Copyright (c) 1997-2016 Software AG, Germany.  All rights reserved.
0160*
0170* HISTORY
0180* USER    DATE       REASON
0190* ------+------------+----------------------------------------------
0200* SAG   ! 17.01.2003 ! Use w3 table
0210* ------+------------+----------------------------------------------
0220*
0230* ------ PARAMETER -----------------------------------------------
0240DEFINE DATA PARAMETER
02501 H3_ASCII-URL (1:255)
0260  2 ASCII (A1)
0270  2 URL   (A3)
0280LOCAL
02901 #COUNTER (I4)
0300*
03101 URLDYN   (A/1:255) DYNAMIC
0320END-DEFINE
0330*
0340DEFINE SUBROUTINE H3-ASCII-URL-TABLE
0350*
0360PERFORM W3-ASCII-URL-TABLE ASCII(*) URLDYN(*) #COUNTER
0370*
0380MOVE URLDYN(1:255) TO  URL(1:255)
0390*
0400END-SUBROUTINE
0410END
