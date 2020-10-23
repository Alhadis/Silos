DEFINE DATA
LOCAL
1 #CHGD-DATE(A1) INIT <'N'>
1 #BANK-DAYS(I2)
END-DEFINE
**********************************************************************
DEFINE SUBROUTINE CHECK-FOR-HOLIDAY
**********************************************************************
IF #CHGD-DATE = 'Y'
PERFORM CALC-DAY-OF-WEEK
PERFORM CHECK-FOR-HOLIDAY
ELSE
ADD 1 TO #BANK-DAYS
END-IF
END-SUBROUTINE 
END
