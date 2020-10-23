0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - HTML Extension
0030*
0040*        H3ERRTXT
0050*
0060* DESCRIPTION   This Program an error text for a given number
0070*
0080* AUTHOR        SAG   28.07.97
0090*
0100* Version       8.3
0110*
0120* Copyright (c) 1997-2016 Software AG, Germany.  All rights reserved.
0130*
0140* HISTORY
0150* USER    DATE       REASON
0160* ------+----------+----------------------------------------------
0170*       ! --.--.-- !
0180* ------+----------+----------------------------------------------
0190*
0200* ------ PARAMETER -----------------------------------------------
0210DEFINE DATA
0220PARAMETER
02301 #H3TYPE   (N5)   BY VALUE /*  i /m : Error Number
02401 #H3ERROR  (A250)          /*   o/  : Error Text
0250END-DEFINE
0260*
0270DEFINE SUBROUTINE H3-ERROR-TEXT
0280*
0290DECIDE ON FIRST VALUE OF #H3TYPE
0300VALUE 20002
0310  #H3ERROR := 'No elements defined.'
0320VALUE 20003
0330  #H3ERROR := 'Can only be used inside a FORM tag.'
0340VALUE 20004
0350  #H3ERROR := 'A FORM tag without ACTION is not allowed.'
0360VALUE 20005
0370  #H3ERROR := 'LI tag outside a list not allowed.'
0380VALUE 20006
0390  #H3ERROR := 'List nested too deep: %1%.'
0400VALUE 20007
0410  #H3ERROR := 'Radio Button Group has no name.'
0420VALUE 20009
0430  #H3ERROR := 'Element %1% has no name.'
0440VALUE 20010
0450  #H3ERROR := 'Textarea has no name.'
0460NONE
0470  #H3ERROR := 'No Error Text found.'
0480END-DECIDE
0490*
0500END-SUBROUTINE
0510*
0520END
