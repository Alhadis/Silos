*LIST "aList"
1: Item list 01
2: Item list 02
3: Item list 03
4: Item list 04
5: Item list 05
8: Item list 08

*QUESTION 1 *NUMBER 61L1
A numeric question

*QUESTION 10 *NUMBER 62L3 *BUT 999 "Don't know"
A numeric question + but

*QUESTION 20 *ALPHA 65L20
An alpha question

*QUESTION 30 *CODES 85L1 *BUT 9 "Don't know"
A single codes question no list + but
1: s answer 01
2: s answer 02
3: s answer 03
4: s answer 04
5: s answer 05
8: s answer 08

*QUESTION 35 *CODES 86L1
A single codes question - list
*USELIST "aList"

*QUESTION 40 *CODES 87L8 *MULTI *ROT
A multi codes question no list and ROT
1: m answer 01
2: m answer 02
3: m answer 03
4: m answer 04
5: m answer 05 
8: m answer 08 

*QUESTION 45 *CODES 95L8 *MULTI
A multi codes question - list
*USELIST "aList"

*TEXTVARS varRepeat

*REPEAT 3 *FIELD 103L3

  *IF [?R = 1] *PUT varRepeat "01"
  *IF [?R = 2] *PUT varRepeat "02"
  *IF [?R = 3] *PUT varRepeat "03"

  *TABLE "Rrrepeat *? varRepeat"
  
*QUESTION 60 *CODES 1L1
  Number *? varRepeat is:

  1: 1 Good
  2: 2 Average
  3: 3 Bad
  8: 8

*ENDREP

*QUESTION 70 *OPEN 106L1
An open question

*QUESTION 99 *CODES 107L1
How do we end this thing?
1: end               *END
2: endngb            *ENDNGB
3: 200               *ENDST 200
4: dropped-out (101) *ENDST 101
