*PAGE
Welcome

This is a welcome page

I hope you like it

*QUESTION 10 *CODES 61L1 *RANDOM *LABEL "Single coded (default)" *UIOPTIONS "columns=1"
This is a single coded question.

1:First answer
2:Second answer
3:Third answer
4:Fourth answer
5:Fifth answer

*QUESTION 20 *CODES 62L10 *RANDOM *MULTI *MIN 4 *MAX 6 *LABEL "Multi coded (default)" *UIOPTIONS "instruction=Select between 4 and 6 answers;columns=1"
This is a multi category question

01:Answer the first
02:Answer the second
03:Answer the third
04:Answer the fourth
05:Answer the fifth
06:Answer the sixth
07:Answer the seventh
08:Answer the eighth
09:Answer the nineth
10:Answer the tenth

*QUESTION 30 *ALPHA 72L12 *LABEL "Single line open (default)"
Please enter some text

*QUESTION 40 *OPEN 84L1 *MULTI *LABEL "Multi line open (default)"
Please elaborate

*QUESTION 50 *NUMBER 85L2 *MIN [5] *MAX [15] *LABEL "Numeric (default)"
Please enter a nice round number

*TEMPLATE "NfieldChicago"

*PAGE
[title]Welcome[/title]

[salutation]This is a welcome page[/salutation]

I hope you like it

*QUESTION 60 *CODES 87L1 *RANDOM *LABEL "Single coded (chicago)" *UIOPTIONS "columns=1"
This is a single coded question.

1:First answer
2:Second answer
3:Third answer
4:Fourth answer
5:Fifth answer

*QUESTION 70 *CODES 88L10 *RANDOM *MULTI *MIN 4 *MAX 6 *LABEL "Multi coded (chicago)" *UIOPTIONS "instruction=Select between 4 and 6 answers;columns=1"
This is a multi category question

01:Answer the first
02:Answer the second
03:Answer the third
04:Answer the fourth
05:Answer the fifth
06:Answer the sixth
07:Answer the seventh
08:Answer the eighth
09:Answer the nineth
10:Answer the tenth

*QUESTION 80 *ALPHA 98L12 *LABEL "Single line open (chicago)"
Please enter some text

*QUESTION 90 *OPEN 110L1 *MULTI *LABEL "Multi line open (chicago)"
Please elaborate

*QUESTION 100 *NUMBER 111L2 *MIN [5] *MAX [15] *LABEL "Numeric (chicago)"
Please enter a nice round number

*END
