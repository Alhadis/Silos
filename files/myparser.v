#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 85 of your 30 day trial period.
# 
# This file was produced by an UNREGISTERED COPY of Parser Generator. It is
# for evaluation purposes only. If you continue to use Parser Generator 30
# days after installation then you are required to purchase a license. For
# more information see the online help or go to the Bumble-Bee Software
# homepage at:
# 
# http://www.bumblebeesoftware.com
# 
# This notice must remain present in the file. It cannot be removed.
#############################################################################

#############################################################################
# myparser.v
# YACC verbose file generated from myparser.y.
# 
# Date: 01/02/19
# Time: 17:24:14
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : program $end

    1  program :
    2          | program function_defi
    3          | function_defi
    4          |

    5  function_defi : function_decl stmt
    6                | struct_node
    7                |

    8  struct_node : STRUCT IDENTIFIER stmt ';'

    9  function_decl : type MAIN '(' ')'
   10                | expr_decl '(' ')'
   11                | expr_decl '(' parameter_list ')'

   12  function_call : IDENTIFIER '(' ')'
   13                | IDENTIFIER '(' real_parameter ')'

   14  real_parameter : real_parameter ',' expr
   15                 | expr

   16  parameter_list : parameter_list ',' expr_decl
   17                 | expr_decl

   18  stmt : ';'
   19       | expr ';'
   20       | expr_type ';'
   21       | PRINT '(' expr ')' ';'
   22       | PRINT '(' expr_set ')' ';'
   23       | SCANF '(' expr ')' ';'
   24       | SCANF '(' expr_set ')' ';'
   25       | FOR '(' expr_for_i ';' expr_for_ii ';' expr_for_iii ')' stmt
   26       | WHILE '(' expr_comp ')' stmt
   27       | DO stmt WHILE '(' expr_comp ')'
   28       | IF '(' expr_comp ')' stmt
   29       | IF '(' expr_comp ')' stmt ELSE stmt
   30       | RETURN stmt
   31       | '{' stmt_list '}'
   32       | '{' '}'
   33       | function_call ';'

   34  expr_for_i : expr_type
   35             |

   36  expr_for_ii : expr_comp
   37              |

   38  expr_for_iii : expr_set
   39               |

   40  stmt_list : stmt
   41            | stmt_list stmt

   42  vari : IDENTIFIER
   43       | array_expr
   44       | struct_call

   45  expr_set : vari '=' expr
   46           | array_expr '=' '{' numbers '}'
   47           | array_expr '=' '{' '}'
   48           | array_expr '=' expr
   49           | vari '=' expr_setself
   50           | vari ADD_ASSIGN expr
   51           | vari SUB_ASSIGN expr
   52           | vari MUL_ASSIGN expr
   53           | vari DIV_ASSIGN expr
   54           | vari MOD_ASSIGN expr
   55           | vari ADD_ASSIGN expr_setself
   56           | vari SUB_ASSIGN expr_setself
   57           | vari MUL_ASSIGN expr_setself
   58           | vari DIV_ASSIGN expr_setself
   59           | vari MOD_ASSIGN expr_setself
   60           | vari '=' function_call
   61           | expr_setself

   62  numbers : numbers ',' expr
   63          | expr
   64          | numbers ',' '{' numbers '}'
   65          | '{' numbers '}'

   66  struct_call : IDENTIFIER '.' IDENTIFIER
   67              | IDENTIFIER ARROW IDENTIFIER
   68              | pointer ARROW IDENTIFIER

   69  expr_decl : type IDENTIFIER
   70            | type pointer
   71            | type array_expr

   72  expr_type : expr_set
   73            | IDENTIFIER
   74            | type expr_set
   75            | expr_decl
   76            | expr_type ',' expr_set
   77            | expr_type ',' IDENTIFIER
   78            | expr_type ',' pointer
   79            | expr_type ',' array_expr

   80  pointer : '*' IDENTIFIER
   81          | '*' pointer

   82  type : INT
   83       | VOID
   84       | FLOAT
   85       | DOUBLE
   86       | BOOL
   87       | CHAR
   88       | STRUCT_ID

   89  expr_setself : DEC_OP vari
   90               | INC_OP vari
   91               | vari INC_OP
   92               | vari DEC_OP
   93               | '(' expr_setself ')'

   94  expr_comp : expr
   95            | '!' expr
   96            | expr_set
   97            | expr '<' expr
   98            | expr '>' expr
   99            | expr GE_OP expr
  100            | expr LE_OP expr
  101            | expr NE_OP expr
  102            | expr EQ_OP expr
  103            | expr_comp AND_OP expr_comp
  104            | expr_comp OR_OP expr_comp
  105            | '(' expr_comp AND_OP expr_comp ')'
  106            | '(' expr_comp OR_OP expr_comp ')'
  107            | '(' expr_comp ')'

  108  expr : NUMBER
  109       | IDENTIFIER
  110       | pointer
  111       | struct_call
  112       | array_expr
  113       | '&' IDENTIFIER
  114       | '-' NUMBER
  115       | expr '+' expr
  116       | expr '-' expr
  117       | expr '*' expr
  118       | expr '/' expr
  119       | '(' expr ')'

  120  array_expr : IDENTIFIER array_list

  121  array_list : '[' NUMBER ']' array_list
  122             | '[' NUMBER ']'
  123             | '[' ']'


##############################################################################
# States
##############################################################################

0: shift-reduce conflict (shift 1, reduce 1) on CHAR
0: shift-reduce conflict (shift 2, reduce 1) on INT
0: shift-reduce conflict (shift 3, reduce 1) on DOUBLE
0: shift-reduce conflict (shift 4, reduce 1) on VOID
0: shift-reduce conflict (shift 5, reduce 1) on BOOL
0: shift-reduce conflict (shift 6, reduce 1) on STRUCT_ID
0: shift-reduce conflict (shift 7, reduce 1) on FLOAT
0: shift-reduce conflict (shift 8, reduce 1) on STRUCT
0: reduce-reduce conflict (reduce 1, reduce 4) on $end
0: shift-reduce conflict (shift 1, reduce 4) on CHAR
0: shift-reduce conflict (shift 2, reduce 4) on INT
0: shift-reduce conflict (shift 3, reduce 4) on DOUBLE
0: shift-reduce conflict (shift 4, reduce 4) on VOID
0: shift-reduce conflict (shift 5, reduce 4) on BOOL
0: shift-reduce conflict (shift 6, reduce 4) on STRUCT_ID
0: shift-reduce conflict (shift 7, reduce 4) on FLOAT
0: shift-reduce conflict (shift 8, reduce 4) on STRUCT
0: reduce-reduce conflict (reduce 1, reduce 7) on $end
0: shift-reduce conflict (shift 1, reduce 7) on CHAR
0: shift-reduce conflict (shift 2, reduce 7) on INT
0: shift-reduce conflict (shift 3, reduce 7) on DOUBLE
0: shift-reduce conflict (shift 4, reduce 7) on VOID
0: shift-reduce conflict (shift 5, reduce 7) on BOOL
0: shift-reduce conflict (shift 6, reduce 7) on STRUCT_ID
0: shift-reduce conflict (shift 7, reduce 7) on FLOAT
0: shift-reduce conflict (shift 8, reduce 7) on STRUCT
state 0
	$accept : . program $end
	program : .  (1)
	program : .  (4)
	function_defi : .  (7)

	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	FLOAT  shift 7
	STRUCT  shift 8
	.  reduce 1

	function_defi  goto 9
	expr_decl  goto 10
	program  goto 11
	type  goto 12
	function_decl  goto 13
	struct_node  goto 14


state 1
	type : CHAR .  (87)

	.  reduce 87


state 2
	type : INT .  (82)

	.  reduce 82


state 3
	type : DOUBLE .  (85)

	.  reduce 85


state 4
	type : VOID .  (83)

	.  reduce 83


state 5
	type : BOOL .  (86)

	.  reduce 86


state 6
	type : STRUCT_ID .  (88)

	.  reduce 88


state 7
	type : FLOAT .  (84)

	.  reduce 84


state 8
	struct_node : STRUCT . IDENTIFIER stmt ';'

	IDENTIFIER  shift 15


state 9
	program : function_defi .  (3)

	.  reduce 3


state 10
	function_decl : expr_decl . '(' ')'
	function_decl : expr_decl . '(' parameter_list ')'

	'('  shift 16


11: accept-reduce conflict (accept, reduce 7) on $end
11: shift-reduce conflict (shift 1, reduce 7) on CHAR
11: shift-reduce conflict (shift 2, reduce 7) on INT
11: shift-reduce conflict (shift 3, reduce 7) on DOUBLE
11: shift-reduce conflict (shift 4, reduce 7) on VOID
11: shift-reduce conflict (shift 5, reduce 7) on BOOL
11: shift-reduce conflict (shift 6, reduce 7) on STRUCT_ID
11: shift-reduce conflict (shift 7, reduce 7) on FLOAT
11: shift-reduce conflict (shift 8, reduce 7) on STRUCT
state 11
	$accept : program . $end  (0)
	program : program . function_defi
	function_defi : .  (7)

	$end  accept
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	FLOAT  shift 7
	STRUCT  shift 8

	function_defi  goto 17
	expr_decl  goto 10
	type  goto 12
	function_decl  goto 13
	struct_node  goto 14


state 12
	function_decl : type . MAIN '(' ')'
	expr_decl : type . array_expr
	expr_decl : type . IDENTIFIER
	expr_decl : type . pointer

	'*'  shift 18
	IDENTIFIER  shift 19
	MAIN  shift 20

	pointer  goto 21
	array_expr  goto 22


state 13
	function_defi : function_decl . stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 40
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 14
	function_defi : struct_node .  (6)

	.  reduce 6


state 15
	struct_node : STRUCT IDENTIFIER . stmt ';'

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 51
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 16
	function_decl : expr_decl '(' . ')'
	function_decl : expr_decl '(' . parameter_list ')'

	')'  shift 52
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	FLOAT  shift 7

	expr_decl  goto 53
	type  goto 54
	parameter_list  goto 55


state 17
	program : program function_defi .  (2)

	.  reduce 2


state 18
	pointer : '*' . pointer
	pointer : '*' . IDENTIFIER

	'*'  shift 18
	IDENTIFIER  shift 56

	pointer  goto 57


state 19
	expr_decl : type IDENTIFIER .  (69)
	array_expr : IDENTIFIER . array_list

	'['  shift 58
	.  reduce 69

	array_list  goto 59


state 20
	function_decl : type MAIN . '(' ')'

	'('  shift 60


state 21
	expr_decl : type pointer .  (70)

	.  reduce 70


state 22
	expr_decl : type array_expr .  (71)

	.  reduce 71


state 23
	expr : '&' . IDENTIFIER

	IDENTIFIER  shift 61


state 24
	expr_setself : '(' . expr_setself ')'
	expr : '(' . expr ')'

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 63
	expr_setself  goto 64
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 25
	expr : '-' . NUMBER

	NUMBER  shift 67


state 26
	stmt : ';' .  (18)

	.  reduce 18


state 27
	stmt : '{' . stmt_list '}'
	stmt : '{' . '}'

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	'}'  shift 68
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 69
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	stmt_list  goto 70
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


28: reduce-reduce conflict (reduce 73, reduce 109) on ';'
state 28
	function_call : IDENTIFIER . '(' ')'
	function_call : IDENTIFIER . '(' real_parameter ')'
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr_type : IDENTIFIER .  (73)
	expr : IDENTIFIER .  (109)
	array_expr : IDENTIFIER . array_list

	'('  shift 71
	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	'*'  reduce 109
	'+'  reduce 109
	','  reduce 73
	'-'  reduce 109
	'/'  reduce 109
	';'  reduce 73
	.  reduce 42

	array_list  goto 59


state 29
	expr : NUMBER .  (108)

	.  reduce 108


state 30
	expr_setself : INC_OP . vari

	'*'  shift 18
	IDENTIFIER  shift 74

	struct_call  goto 75
	pointer  goto 76
	array_expr  goto 77
	vari  goto 78


state 31
	expr_setself : DEC_OP . vari

	'*'  shift 18
	IDENTIFIER  shift 74

	struct_call  goto 75
	pointer  goto 76
	array_expr  goto 77
	vari  goto 79


state 32
	stmt : IF . '(' expr_comp ')' stmt
	stmt : IF . '(' expr_comp ')' stmt ELSE stmt

	'('  shift 80


state 33
	stmt : WHILE . '(' expr_comp ')' stmt

	'('  shift 81


state 34
	stmt : DO . stmt WHILE '(' expr_comp ')'

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 82
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 35
	stmt : FOR . '(' expr_for_i ';' expr_for_ii ';' expr_for_iii ')' stmt

	'('  shift 83


state 36
	stmt : RETURN . stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 84
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 37
	stmt : SCANF . '(' expr ')' ';'
	stmt : SCANF . '(' expr_set ')' ';'

	'('  shift 85


state 38
	stmt : PRINT . '(' expr_set ')' ';'
	stmt : PRINT . '(' expr ')' ';'

	'('  shift 86


state 39
	stmt : function_call . ';'

	';'  shift 87


state 40
	function_defi : function_decl stmt .  (5)

	.  reduce 5


state 41
	expr_type : expr_decl .  (75)

	.  reduce 75


state 42
	stmt : expr . ';'
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	';'  shift 92


state 43
	expr_type : expr_set .  (72)

	.  reduce 72


state 44
	expr_decl : type . array_expr
	expr_type : type . expr_set
	expr_decl : type . IDENTIFIER
	expr_decl : type . pointer

	'('  shift 93
	'*'  shift 18
	IDENTIFIER  shift 94
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_set  goto 95
	expr_setself  goto 46
	struct_call  goto 75
	pointer  goto 96
	array_expr  goto 97
	vari  goto 50


state 45
	stmt : expr_type . ';'
	expr_type : expr_type . ',' expr_set
	expr_type : expr_type . ',' pointer
	expr_type : expr_type . ',' array_expr
	expr_type : expr_type . ',' IDENTIFIER

	','  shift 98
	';'  shift 99


state 46
	expr_set : expr_setself .  (61)

	.  reduce 61


state 47
	vari : struct_call .  (44)
	expr : struct_call .  (111)

	'='  reduce 44
	INC_OP  reduce 44
	DEC_OP  reduce 44
	MUL_ASSIGN  reduce 44
	DIV_ASSIGN  reduce 44
	MOD_ASSIGN  reduce 44
	ADD_ASSIGN  reduce 44
	SUB_ASSIGN  reduce 44
	.  reduce 111


state 48
	struct_call : pointer . ARROW IDENTIFIER
	expr : pointer .  (110)

	ARROW  shift 100
	.  reduce 110


49: shift-reduce conflict (shift 101, reduce 43) on '='
state 49
	expr_set : array_expr . '=' expr
	vari : array_expr .  (43)
	expr_set : array_expr . '=' '{' '}'
	expr_set : array_expr . '=' '{' numbers '}'
	expr : array_expr .  (112)

	'='  shift 101
	INC_OP  reduce 43
	DEC_OP  reduce 43
	MUL_ASSIGN  reduce 43
	DIV_ASSIGN  reduce 43
	MOD_ASSIGN  reduce 43
	ADD_ASSIGN  reduce 43
	SUB_ASSIGN  reduce 43
	.  reduce 112


state 50
	expr_set : vari . MOD_ASSIGN expr_setself
	expr_set : vari . '=' expr_setself
	expr_set : vari . DIV_ASSIGN expr
	expr_set : vari . '=' expr
	expr_set : vari . SUB_ASSIGN expr_setself
	expr_set : vari . MUL_ASSIGN expr
	expr_set : vari . ADD_ASSIGN expr
	expr_set : vari . MOD_ASSIGN expr
	expr_set : vari . DIV_ASSIGN expr_setself
	expr_set : vari . '=' function_call
	expr_set : vari . SUB_ASSIGN expr
	expr_set : vari . MUL_ASSIGN expr_setself
	expr_set : vari . ADD_ASSIGN expr_setself
	expr_setself : vari . DEC_OP
	expr_setself : vari . INC_OP

	'='  shift 102
	INC_OP  shift 103
	DEC_OP  shift 104
	MUL_ASSIGN  shift 105
	DIV_ASSIGN  shift 106
	MOD_ASSIGN  shift 107
	ADD_ASSIGN  shift 108
	SUB_ASSIGN  shift 109


state 51
	struct_node : STRUCT IDENTIFIER stmt . ';'

	';'  shift 110


state 52
	function_decl : expr_decl '(' ')' .  (10)

	.  reduce 10


state 53
	parameter_list : expr_decl .  (17)

	.  reduce 17


state 54
	expr_decl : type . array_expr
	expr_decl : type . IDENTIFIER
	expr_decl : type . pointer

	'*'  shift 18
	IDENTIFIER  shift 19

	pointer  goto 21
	array_expr  goto 22


state 55
	function_decl : expr_decl '(' parameter_list . ')'
	parameter_list : parameter_list . ',' expr_decl

	')'  shift 111
	','  shift 112


state 56
	pointer : '*' IDENTIFIER .  (80)

	.  reduce 80


state 57
	pointer : '*' pointer .  (81)

	.  reduce 81


state 58
	array_list : '[' . ']'
	array_list : '[' . NUMBER ']'
	array_list : '[' . NUMBER ']' array_list

	']'  shift 113
	NUMBER  shift 114


state 59
	array_expr : IDENTIFIER array_list .  (120)

	.  reduce 120


state 60
	function_decl : type MAIN '(' . ')'

	')'  shift 115


state 61
	expr : '&' IDENTIFIER .  (113)

	.  reduce 113


state 62
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr : IDENTIFIER .  (109)
	array_expr : IDENTIFIER . array_list

	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	'='  reduce 42
	INC_OP  reduce 42
	DEC_OP  reduce 42
	MUL_ASSIGN  reduce 42
	DIV_ASSIGN  reduce 42
	MOD_ASSIGN  reduce 42
	ADD_ASSIGN  reduce 42
	SUB_ASSIGN  reduce 42
	.  reduce 109

	array_list  goto 59


state 63
	expr : expr . '/' expr
	expr : '(' expr . ')'
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	')'  shift 116
	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91


state 64
	expr_setself : '(' expr_setself . ')'

	')'  shift 117


state 65
	vari : array_expr .  (43)
	expr : array_expr .  (112)

	INC_OP  reduce 43
	DEC_OP  reduce 43
	.  reduce 112


state 66
	expr_setself : vari . DEC_OP
	expr_setself : vari . INC_OP

	INC_OP  shift 103
	DEC_OP  shift 104


state 67
	expr : '-' NUMBER .  (114)

	.  reduce 114


state 68
	stmt : '{' '}' .  (32)

	.  reduce 32


state 69
	stmt_list : stmt .  (40)

	.  reduce 40


state 70
	stmt : '{' stmt_list . '}'
	stmt_list : stmt_list . stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	'}'  shift 118
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 119
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 71
	function_call : IDENTIFIER '(' . ')'
	function_call : IDENTIFIER '(' . real_parameter ')'

	'&'  shift 23
	'('  shift 120
	')'  shift 121
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 123
	struct_call  goto 124
	real_parameter  goto 125
	pointer  goto 48
	array_expr  goto 126


state 72
	struct_call : IDENTIFIER '.' . IDENTIFIER

	IDENTIFIER  shift 127


state 73
	struct_call : IDENTIFIER ARROW . IDENTIFIER

	IDENTIFIER  shift 128


state 74
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	array_expr : IDENTIFIER . array_list

	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	.  reduce 42

	array_list  goto 59


state 75
	vari : struct_call .  (44)

	.  reduce 44


state 76
	struct_call : pointer . ARROW IDENTIFIER

	ARROW  shift 100


state 77
	vari : array_expr .  (43)

	.  reduce 43


state 78
	expr_setself : INC_OP vari .  (90)

	.  reduce 90


state 79
	expr_setself : DEC_OP vari .  (89)

	.  reduce 89


state 80
	stmt : IF '(' . expr_comp ')' stmt
	stmt : IF '(' . expr_comp ')' stmt ELSE stmt

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 131
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 81
	stmt : WHILE '(' . expr_comp ')' stmt

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 134
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 82
	stmt : DO stmt . WHILE '(' expr_comp ')'

	WHILE  shift 135


state 83
	stmt : FOR '(' . expr_for_i ';' expr_for_ii ';' expr_for_iii ')' stmt
	expr_for_i : .  (35)

	'('  shift 93
	'*'  shift 18
	IDENTIFIER  shift 136
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	FLOAT  shift 7
	.  reduce 35

	expr_decl  goto 41
	expr_set  goto 43
	type  goto 44
	expr_type  goto 137
	expr_setself  goto 46
	struct_call  goto 75
	pointer  goto 76
	array_expr  goto 138
	expr_for_i  goto 139
	vari  goto 50


state 84
	stmt : RETURN stmt .  (30)

	.  reduce 30


state 85
	stmt : SCANF '(' . expr ')' ';'
	stmt : SCANF '(' . expr_set ')' ';'

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 140
	expr_set  goto 141
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 86
	stmt : PRINT '(' . expr_set ')' ';'
	stmt : PRINT '(' . expr ')' ';'

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 142
	expr_set  goto 143
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 87
	stmt : function_call ';' .  (33)

	.  reduce 33


state 88
	expr : expr '*' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 144
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 89
	expr : expr '+' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 145
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 90
	expr : expr '-' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 146
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 91
	expr : expr '/' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 147
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 92
	stmt : expr ';' .  (19)

	.  reduce 19


state 93
	expr_setself : '(' . expr_setself ')'

	'('  shift 93
	'*'  shift 18
	IDENTIFIER  shift 74
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_setself  goto 64
	struct_call  goto 75
	pointer  goto 76
	array_expr  goto 77
	vari  goto 66


state 94
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr_decl : type IDENTIFIER .  (69)
	array_expr : IDENTIFIER . array_list

	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	','  reduce 69
	';'  reduce 69
	.  reduce 42

	array_list  goto 59


state 95
	expr_type : type expr_set .  (74)

	.  reduce 74


state 96
	struct_call : pointer . ARROW IDENTIFIER
	expr_decl : type pointer .  (70)

	ARROW  shift 100
	.  reduce 70


97: shift-reduce conflict (shift 101, reduce 43) on '='
state 97
	expr_set : array_expr . '=' expr
	vari : array_expr .  (43)
	expr_set : array_expr . '=' '{' '}'
	expr_set : array_expr . '=' '{' numbers '}'
	expr_decl : type array_expr .  (71)

	'='  shift 101
	','  reduce 71
	';'  reduce 71
	.  reduce 43


state 98
	expr_type : expr_type ',' . expr_set
	expr_type : expr_type ',' . pointer
	expr_type : expr_type ',' . array_expr
	expr_type : expr_type ',' . IDENTIFIER

	'('  shift 93
	'*'  shift 18
	IDENTIFIER  shift 148
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_set  goto 149
	expr_setself  goto 46
	struct_call  goto 75
	pointer  goto 150
	array_expr  goto 151
	vari  goto 50


state 99
	stmt : expr_type ';' .  (20)

	.  reduce 20


state 100
	struct_call : pointer ARROW . IDENTIFIER

	IDENTIFIER  shift 152


state 101
	expr_set : array_expr '=' . expr
	expr_set : array_expr '=' . '{' '}'
	expr_set : array_expr '=' . '{' numbers '}'

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	'{'  shift 153
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 154
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 102
	expr_set : vari '=' . expr_setself
	expr_set : vari '=' . expr
	expr_set : vari '=' . function_call

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 155
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	function_call  goto 156
	expr  goto 157
	expr_setself  goto 158
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 103
	expr_setself : vari INC_OP .  (91)

	.  reduce 91


state 104
	expr_setself : vari DEC_OP .  (92)

	.  reduce 92


state 105
	expr_set : vari MUL_ASSIGN . expr
	expr_set : vari MUL_ASSIGN . expr_setself

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 159
	expr_setself  goto 160
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 106
	expr_set : vari DIV_ASSIGN . expr
	expr_set : vari DIV_ASSIGN . expr_setself

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 161
	expr_setself  goto 162
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 107
	expr_set : vari MOD_ASSIGN . expr_setself
	expr_set : vari MOD_ASSIGN . expr

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 163
	expr_setself  goto 164
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 108
	expr_set : vari ADD_ASSIGN . expr
	expr_set : vari ADD_ASSIGN . expr_setself

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 165
	expr_setself  goto 166
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 109
	expr_set : vari SUB_ASSIGN . expr_setself
	expr_set : vari SUB_ASSIGN . expr

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr  goto 167
	expr_setself  goto 168
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 65
	vari  goto 66


state 110
	struct_node : STRUCT IDENTIFIER stmt ';' .  (8)

	.  reduce 8


state 111
	function_decl : expr_decl '(' parameter_list ')' .  (11)

	.  reduce 11


state 112
	parameter_list : parameter_list ',' . expr_decl

	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	FLOAT  shift 7

	expr_decl  goto 169
	type  goto 54


state 113
	array_list : '[' ']' .  (123)

	.  reduce 123


state 114
	array_list : '[' NUMBER . ']'
	array_list : '[' NUMBER . ']' array_list

	']'  shift 170


state 115
	function_decl : type MAIN '(' ')' .  (9)

	.  reduce 9


state 116
	expr : '(' expr ')' .  (119)

	.  reduce 119


state 117
	expr_setself : '(' expr_setself ')' .  (93)

	.  reduce 93


state 118
	stmt : '{' stmt_list '}' .  (31)

	.  reduce 31


state 119
	stmt_list : stmt_list stmt .  (41)

	.  reduce 41


state 120
	expr : '(' . expr ')'

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 63
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 121
	function_call : IDENTIFIER '(' ')' .  (12)

	.  reduce 12


state 122
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr : IDENTIFIER .  (109)
	array_expr : IDENTIFIER . array_list

	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	.  reduce 109

	array_list  goto 59


state 123
	real_parameter : expr .  (15)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 15


state 124
	expr : struct_call .  (111)

	.  reduce 111


state 125
	function_call : IDENTIFIER '(' real_parameter . ')'
	real_parameter : real_parameter . ',' expr

	')'  shift 171
	','  shift 172


state 126
	expr : array_expr .  (112)

	.  reduce 112


state 127
	struct_call : IDENTIFIER '.' IDENTIFIER .  (66)

	.  reduce 66


state 128
	struct_call : IDENTIFIER ARROW IDENTIFIER .  (67)

	.  reduce 67


state 129
	expr_comp : '!' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 173
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 130
	expr_setself : '(' . expr_setself ')'
	expr : '(' . expr ')'
	expr_comp : '(' . expr_comp AND_OP expr_comp ')'
	expr_comp : '(' . expr_comp OR_OP expr_comp ')'
	expr_comp : '(' . expr_comp ')'

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 174
	expr  goto 175
	expr_set  goto 133
	expr_setself  goto 176
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 131
	stmt : IF '(' expr_comp . ')' stmt
	stmt : IF '(' expr_comp . ')' stmt ELSE stmt
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp

	')'  shift 177
	AND_OP  shift 178
	OR_OP  shift 179


state 132
	expr_comp : expr .  (94)
	expr_comp : expr . '<' expr
	expr_comp : expr . '>' expr
	expr_comp : expr . GE_OP expr
	expr_comp : expr . LE_OP expr
	expr_comp : expr . EQ_OP expr
	expr_comp : expr . NE_OP expr
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	'<'  shift 180
	'>'  shift 181
	LE_OP  shift 182
	GE_OP  shift 183
	EQ_OP  shift 184
	NE_OP  shift 185
	.  reduce 94


state 133
	expr_comp : expr_set .  (96)

	.  reduce 96


state 134
	stmt : WHILE '(' expr_comp . ')' stmt
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp

	')'  shift 186
	AND_OP  shift 178
	OR_OP  shift 179


state 135
	stmt : DO stmt WHILE . '(' expr_comp ')'

	'('  shift 187


state 136
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr_type : IDENTIFIER .  (73)
	array_expr : IDENTIFIER . array_list

	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	','  reduce 73
	';'  reduce 73
	.  reduce 42

	array_list  goto 59


state 137
	expr_for_i : expr_type .  (34)
	expr_type : expr_type . ',' expr_set
	expr_type : expr_type . ',' pointer
	expr_type : expr_type . ',' array_expr
	expr_type : expr_type . ',' IDENTIFIER

	','  shift 98
	.  reduce 34


138: shift-reduce conflict (shift 101, reduce 43) on '='
state 138
	expr_set : array_expr . '=' expr
	vari : array_expr .  (43)
	expr_set : array_expr . '=' '{' '}'
	expr_set : array_expr . '=' '{' numbers '}'

	'='  shift 101
	.  reduce 43


state 139
	stmt : FOR '(' expr_for_i . ';' expr_for_ii ';' expr_for_iii ')' stmt

	';'  shift 188


state 140
	stmt : SCANF '(' expr . ')' ';'
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	')'  shift 189
	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91


state 141
	stmt : SCANF '(' expr_set . ')' ';'

	')'  shift 190


state 142
	stmt : PRINT '(' expr . ')' ';'
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	')'  shift 191
	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91


state 143
	stmt : PRINT '(' expr_set . ')' ';'

	')'  shift 192


state 144
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr '*' expr .  (117)
	expr : expr . '*' expr

	.  reduce 117


state 145
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr '+' expr .  (115)
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'/'  shift 91
	.  reduce 115


state 146
	expr : expr . '/' expr
	expr : expr '-' expr .  (116)
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'/'  shift 91
	.  reduce 116


state 147
	expr : expr '/' expr .  (118)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	.  reduce 118


state 148
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr_type : expr_type ',' IDENTIFIER .  (77)
	array_expr : IDENTIFIER . array_list

	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	','  reduce 77
	';'  reduce 77
	.  reduce 42

	array_list  goto 59


state 149
	expr_type : expr_type ',' expr_set .  (76)

	.  reduce 76


state 150
	struct_call : pointer . ARROW IDENTIFIER
	expr_type : expr_type ',' pointer .  (78)

	ARROW  shift 100
	.  reduce 78


151: shift-reduce conflict (shift 101, reduce 43) on '='
state 151
	expr_set : array_expr . '=' expr
	vari : array_expr .  (43)
	expr_set : array_expr . '=' '{' '}'
	expr_set : array_expr . '=' '{' numbers '}'
	expr_type : expr_type ',' array_expr .  (79)

	'='  shift 101
	','  reduce 79
	';'  reduce 79
	.  reduce 43


state 152
	struct_call : pointer ARROW IDENTIFIER .  (68)

	.  reduce 68


state 153
	expr_set : array_expr '=' '{' . '}'
	expr_set : array_expr '=' '{' . numbers '}'

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	'{'  shift 193
	'}'  shift 194
	IDENTIFIER  shift 122
	NUMBER  shift 29

	numbers  goto 195
	expr  goto 196
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 154
	expr_set : array_expr '=' expr .  (48)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 48


state 155
	function_call : IDENTIFIER . '(' ')'
	function_call : IDENTIFIER . '(' real_parameter ')'
	vari : IDENTIFIER .  (42)
	struct_call : IDENTIFIER . '.' IDENTIFIER
	struct_call : IDENTIFIER . ARROW IDENTIFIER
	expr : IDENTIFIER .  (109)
	array_expr : IDENTIFIER . array_list

	'('  shift 71
	'.'  shift 72
	'['  shift 58
	ARROW  shift 73
	INC_OP  reduce 42
	DEC_OP  reduce 42
	.  reduce 109

	array_list  goto 59


state 156
	expr_set : vari '=' function_call .  (60)

	.  reduce 60


state 157
	expr_set : vari '=' expr .  (45)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 45


state 158
	expr_set : vari '=' expr_setself .  (49)

	.  reduce 49


state 159
	expr_set : vari MUL_ASSIGN expr .  (52)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 52


state 160
	expr_set : vari MUL_ASSIGN expr_setself .  (57)

	.  reduce 57


state 161
	expr_set : vari DIV_ASSIGN expr .  (53)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 53


state 162
	expr_set : vari DIV_ASSIGN expr_setself .  (58)

	.  reduce 58


state 163
	expr_set : vari MOD_ASSIGN expr .  (54)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 54


state 164
	expr_set : vari MOD_ASSIGN expr_setself .  (59)

	.  reduce 59


state 165
	expr_set : vari ADD_ASSIGN expr .  (50)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 50


state 166
	expr_set : vari ADD_ASSIGN expr_setself .  (55)

	.  reduce 55


state 167
	expr_set : vari SUB_ASSIGN expr .  (51)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 51


state 168
	expr_set : vari SUB_ASSIGN expr_setself .  (56)

	.  reduce 56


state 169
	parameter_list : parameter_list ',' expr_decl .  (16)

	.  reduce 16


state 170
	array_list : '[' NUMBER ']' .  (122)
	array_list : '[' NUMBER ']' . array_list

	'['  shift 58
	.  reduce 122

	array_list  goto 197


state 171
	function_call : IDENTIFIER '(' real_parameter ')' .  (13)

	.  reduce 13


state 172
	real_parameter : real_parameter ',' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 198
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 173
	expr_comp : '!' expr .  (95)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 95


state 174
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp
	expr_comp : '(' expr_comp . AND_OP expr_comp ')'
	expr_comp : '(' expr_comp . OR_OP expr_comp ')'
	expr_comp : '(' expr_comp . ')'

	')'  shift 199
	AND_OP  shift 200
	OR_OP  shift 201


175: shift-reduce conflict (shift 116, reduce 94) on ')'
state 175
	expr_comp : expr .  (94)
	expr_comp : expr . '<' expr
	expr_comp : expr . '>' expr
	expr_comp : expr . GE_OP expr
	expr_comp : expr . LE_OP expr
	expr_comp : expr . EQ_OP expr
	expr_comp : expr . NE_OP expr
	expr : expr . '/' expr
	expr : '(' expr . ')'
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	')'  shift 116
	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	'<'  shift 180
	'>'  shift 181
	LE_OP  shift 182
	GE_OP  shift 183
	EQ_OP  shift 184
	NE_OP  shift 185
	.  reduce 94


176: shift-reduce conflict (shift 117, reduce 61) on ')'
state 176
	expr_set : expr_setself .  (61)
	expr_setself : '(' expr_setself . ')'

	')'  shift 117
	.  reduce 61


state 177
	stmt : IF '(' expr_comp ')' . stmt
	stmt : IF '(' expr_comp ')' . stmt ELSE stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 202
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 178
	expr_comp : expr_comp AND_OP . expr_comp

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 203
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 179
	expr_comp : expr_comp OR_OP . expr_comp

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 204
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 180
	expr_comp : expr '<' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 205
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 181
	expr_comp : expr '>' . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 206
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 182
	expr_comp : expr LE_OP . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 207
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 183
	expr_comp : expr GE_OP . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 208
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 184
	expr_comp : expr EQ_OP . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 209
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 185
	expr_comp : expr NE_OP . expr

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 210
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 186
	stmt : WHILE '(' expr_comp ')' . stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 211
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 187
	stmt : DO stmt WHILE '(' . expr_comp ')'

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 212
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 188
	stmt : FOR '(' expr_for_i ';' . expr_for_ii ';' expr_for_iii ')' stmt
	expr_for_ii : .  (37)

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	.  reduce 37

	expr_comp  goto 213
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	expr_for_ii  goto 214
	vari  goto 50


state 189
	stmt : SCANF '(' expr ')' . ';'

	';'  shift 215


state 190
	stmt : SCANF '(' expr_set ')' . ';'

	';'  shift 216


state 191
	stmt : PRINT '(' expr ')' . ';'

	';'  shift 217


state 192
	stmt : PRINT '(' expr_set ')' . ';'

	';'  shift 218


state 193
	numbers : '{' . numbers '}'

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	'{'  shift 193
	IDENTIFIER  shift 122
	NUMBER  shift 29

	numbers  goto 219
	expr  goto 196
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 194
	expr_set : array_expr '=' '{' '}' .  (47)

	.  reduce 47


state 195
	numbers : numbers . ',' expr
	numbers : numbers . ',' '{' numbers '}'
	expr_set : array_expr '=' '{' numbers . '}'

	','  shift 220
	'}'  shift 221


state 196
	numbers : expr .  (63)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 63


state 197
	array_list : '[' NUMBER ']' array_list .  (121)

	.  reduce 121


state 198
	real_parameter : real_parameter ',' expr .  (14)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 14


state 199
	expr_comp : '(' expr_comp ')' .  (107)

	.  reduce 107


state 200
	expr_comp : expr_comp AND_OP . expr_comp
	expr_comp : '(' expr_comp AND_OP . expr_comp ')'

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 222
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 201
	expr_comp : expr_comp OR_OP . expr_comp
	expr_comp : '(' expr_comp OR_OP . expr_comp ')'

	'!'  shift 129
	'&'  shift 23
	'('  shift 130
	'*'  shift 18
	'-'  shift 25
	IDENTIFIER  shift 62
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31

	expr_comp  goto 223
	expr  goto 132
	expr_set  goto 133
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


202: shift-reduce conflict (shift 224, reduce 28) on ELSE
state 202
	stmt : IF '(' expr_comp ')' stmt .  (28)
	stmt : IF '(' expr_comp ')' stmt . ELSE stmt

	ELSE  shift 224
	.  reduce 28


state 203
	expr_comp : expr_comp AND_OP expr_comp .  (103)
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp

	.  reduce 103


state 204
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp OR_OP expr_comp .  (104)
	expr_comp : expr_comp . OR_OP expr_comp

	AND_OP  shift 178
	.  reduce 104


state 205
	expr_comp : expr '<' expr .  (97)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 97


state 206
	expr_comp : expr '>' expr .  (98)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 98


state 207
	expr_comp : expr LE_OP expr .  (100)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 100


state 208
	expr_comp : expr GE_OP expr .  (99)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 99


state 209
	expr_comp : expr EQ_OP expr .  (102)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 102


state 210
	expr_comp : expr NE_OP expr .  (101)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 101


state 211
	stmt : WHILE '(' expr_comp ')' stmt .  (26)

	.  reduce 26


state 212
	stmt : DO stmt WHILE '(' expr_comp . ')'
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp

	')'  shift 225
	AND_OP  shift 178
	OR_OP  shift 179


state 213
	expr_for_ii : expr_comp .  (36)
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp

	AND_OP  shift 178
	OR_OP  shift 179
	.  reduce 36


state 214
	stmt : FOR '(' expr_for_i ';' expr_for_ii . ';' expr_for_iii ')' stmt

	';'  shift 226


state 215
	stmt : SCANF '(' expr ')' ';' .  (23)

	.  reduce 23


state 216
	stmt : SCANF '(' expr_set ')' ';' .  (24)

	.  reduce 24


state 217
	stmt : PRINT '(' expr ')' ';' .  (21)

	.  reduce 21


state 218
	stmt : PRINT '(' expr_set ')' ';' .  (22)

	.  reduce 22


state 219
	numbers : numbers . ',' expr
	numbers : numbers . ',' '{' numbers '}'
	numbers : '{' numbers . '}'

	','  shift 220
	'}'  shift 227


state 220
	numbers : numbers ',' . expr
	numbers : numbers ',' . '{' numbers '}'

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	'{'  shift 228
	IDENTIFIER  shift 122
	NUMBER  shift 29

	expr  goto 229
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 221
	expr_set : array_expr '=' '{' numbers '}' .  (46)

	.  reduce 46


222: shift-reduce conflict (shift 230, reduce 103) on ')'
state 222
	expr_comp : expr_comp AND_OP expr_comp .  (103)
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp . OR_OP expr_comp
	expr_comp : '(' expr_comp AND_OP expr_comp . ')'

	')'  shift 230
	.  reduce 103


223: shift-reduce conflict (shift 231, reduce 104) on ')'
state 223
	expr_comp : expr_comp . AND_OP expr_comp
	expr_comp : expr_comp OR_OP expr_comp .  (104)
	expr_comp : expr_comp . OR_OP expr_comp
	expr_comp : '(' expr_comp OR_OP expr_comp . ')'

	')'  shift 231
	AND_OP  shift 178
	.  reduce 104


state 224
	stmt : IF '(' expr_comp ')' stmt ELSE . stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 232
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 225
	stmt : DO stmt WHILE '(' expr_comp ')' .  (27)

	.  reduce 27


state 226
	stmt : FOR '(' expr_for_i ';' expr_for_ii ';' . expr_for_iii ')' stmt
	expr_for_iii : .  (39)

	'('  shift 93
	'*'  shift 18
	IDENTIFIER  shift 74
	INC_OP  shift 30
	DEC_OP  shift 31
	.  reduce 39

	expr_set  goto 233
	expr_setself  goto 46
	struct_call  goto 75
	pointer  goto 76
	array_expr  goto 138
	vari  goto 50
	expr_for_iii  goto 234


state 227
	numbers : '{' numbers '}' .  (65)

	.  reduce 65


state 228
	numbers : numbers ',' '{' . numbers '}'

	'&'  shift 23
	'('  shift 120
	'*'  shift 18
	'-'  shift 25
	'{'  shift 193
	IDENTIFIER  shift 122
	NUMBER  shift 29

	numbers  goto 235
	expr  goto 196
	struct_call  goto 124
	pointer  goto 48
	array_expr  goto 126


state 229
	numbers : numbers ',' expr .  (62)
	expr : expr . '/' expr
	expr : expr . '-' expr
	expr : expr . '+' expr
	expr : expr . '*' expr

	'*'  shift 88
	'+'  shift 89
	'-'  shift 90
	'/'  shift 91
	.  reduce 62


state 230
	expr_comp : '(' expr_comp AND_OP expr_comp ')' .  (105)

	.  reduce 105


state 231
	expr_comp : '(' expr_comp OR_OP expr_comp ')' .  (106)

	.  reduce 106


state 232
	stmt : IF '(' expr_comp ')' stmt ELSE stmt .  (29)

	.  reduce 29


state 233
	expr_for_iii : expr_set .  (38)

	.  reduce 38


state 234
	stmt : FOR '(' expr_for_i ';' expr_for_ii ';' expr_for_iii . ')' stmt

	')'  shift 236


state 235
	numbers : numbers . ',' expr
	numbers : numbers . ',' '{' numbers '}'
	numbers : numbers ',' '{' numbers . '}'

	','  shift 220
	'}'  shift 237


state 236
	stmt : FOR '(' expr_for_i ';' expr_for_ii ';' expr_for_iii ')' . stmt

	'&'  shift 23
	'('  shift 24
	'*'  shift 18
	'-'  shift 25
	';'  shift 26
	'{'  shift 27
	IDENTIFIER  shift 28
	NUMBER  shift 29
	INC_OP  shift 30
	DEC_OP  shift 31
	CHAR  shift 1
	INT  shift 2
	DOUBLE  shift 3
	VOID  shift 4
	BOOL  shift 5
	STRUCT_ID  shift 6
	IF  shift 32
	WHILE  shift 33
	DO  shift 34
	FOR  shift 35
	RETURN  shift 36
	FLOAT  shift 7
	SCANF  shift 37
	PRINT  shift 38

	function_call  goto 39
	stmt  goto 238
	expr_decl  goto 41
	expr  goto 42
	expr_set  goto 43
	type  goto 44
	expr_type  goto 45
	expr_setself  goto 46
	struct_call  goto 47
	pointer  goto 48
	array_expr  goto 49
	vari  goto 50


state 237
	numbers : numbers ',' '{' numbers '}' .  (64)

	.  reduce 64


state 238
	stmt : FOR '(' expr_for_i ';' expr_for_ii ';' expr_for_iii ')' stmt .  (25)

	.  reduce 25


Rules never reduced
	program :  (4)
	function_defi :  (7)


##############################################################################
# Summary
##############################################################################

State 0 contains 24 shift-reduce conflict(s)
State 0 contains 2 reduce-reduce conflict(s)
State 11 contains 1 accept-reduce conflict(s)
State 11 contains 8 shift-reduce conflict(s)
State 28 contains 1 reduce-reduce conflict(s)
State 49 contains 1 shift-reduce conflict(s)
State 97 contains 1 shift-reduce conflict(s)
State 138 contains 1 shift-reduce conflict(s)
State 151 contains 1 shift-reduce conflict(s)
State 175 contains 1 shift-reduce conflict(s)
State 176 contains 1 shift-reduce conflict(s)
State 202 contains 1 shift-reduce conflict(s)
State 222 contains 1 shift-reduce conflict(s)
State 223 contains 1 shift-reduce conflict(s)


54 token(s), 26 nonterminal(s)
124 grammar rule(s), 239 state(s)


##############################################################################
# End of File
##############################################################################
