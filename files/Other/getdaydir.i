
FUNCTION getDayDir RETURNS CHARACTER (INPUT prefix AS CHARACTER,INPUT iMove AS INTEGER):
 DEFINE VARIABLE cResult AS CHARACTER.

 cResult = prefix + '/' + STRING(YEAR(TODAY - iMove)) + '/'.

 IF MONTH(TODAY - iMove) < 10 THEN
   DO:
     cResult = cResult + '0' + STRING(MONTH(TODAY - iMove)).
   END.
   ELSE
     DO:
      cResult = cResult + STRING(MONTH(TODAY - iMove)).
     END.

 IF DAY(TODAY - iMove) < 10 THEN 
   DO:
     cResult = cResult + '/0' + STRING(DAY(TODAY - iMove)).
   END.
   ELSE
     DO:
     cResult = cResult + '/' + STRING(DAY(TODAY - iMove)).
     END.
RETURN cResult.
END FUNCTION.