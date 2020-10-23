** Example 'ATBREX01': AT BREAK OF (with database field)
************************************************************************
DEFINE DATA 
LOCAL 
1 MYVIEW VIEW OF EMPLOYEES
  2 NAME
  2 CITY
  2 COUNTRY
  2 JOB-TITLE
  2 SALARY (1:1)
END-DEFINE
*
DEFINE SUBROUTINE PR1748S-SUB  
READ(20) MYVIEW BY CITY WHERE COUNTRY = 'USA'
   END DATA  
   write 'bad stuff'
   escape bottom immediate
   END-ENDDATA  
  WRITE 'BEFORE BREAK' CITY
  PERFORM BREAK
  AT BREAK OF CITY
    WRITE / 'BREAK OF CITY'   OLD(CITY) 
  END-BREAK
END-READ
END-SUBROUTINE
END

