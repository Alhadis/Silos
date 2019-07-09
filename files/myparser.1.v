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
# Time: 18:31:13
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : translation_unit $end

    1  primary_exp : ID
    2              | CONSTANT
    3              | STRING_LITERAL
    4              | '(' exp ')'
    5              | TRUE
    6              | FALSE

    7  postfix_pre_exp : postfix_exp '('

    8  postfix_exp : primary_exp
    9              | postfix_exp '[' exp ']'
   10              | postfix_pre_exp ')'
   11              | postfix_pre_exp argument_exp_list ')'
   12              | postfix_exp '.' ID
   13              | postfix_exp PTR_OP ID
   14              | postfix_exp INC_OP
   15              | postfix_exp DEC_OP

   16  argument_exp_list : assignment_exp
   17                    | argument_exp_list ',' assignment_exp

   18  unary_exp : postfix_exp
   19            | INC_OP unary_exp
   20            | DEC_OP unary_exp
   21            | unary_operator cast_exp
   22            | SIZEOF unary_exp
   23            | SIZEOF '(' type_name ')'

   24  unary_operator : '&'
   25                 | '*'
   26                 | '+'
   27                 | '-'
   28                 | '~'
   29                 | '!'

   30  cast_exp : unary_exp
   31           | '(' type_name ')' cast_exp

   32  multiplicative_exp : cast_exp
   33                     | multiplicative_exp '^' cast_exp
   34                     | multiplicative_exp '*' cast_exp
   35                     | multiplicative_exp '/' cast_exp
   36                     | multiplicative_exp '%' cast_exp

   37  additive_exp : multiplicative_exp
   38               | additive_exp '+' multiplicative_exp
   39               | additive_exp '-' multiplicative_exp

   40  shift_exp : additive_exp
   41            | shift_exp LEFT_OP additive_exp
   42            | shift_exp RIGHT_OP additive_exp

   43  relational_exp : shift_exp
   44                 | relational_exp '<' shift_exp
   45                 | relational_exp '>' shift_exp
   46                 | relational_exp LE_OP shift_exp
   47                 | relational_exp GE_OP shift_exp

   48  equality_exp : relational_exp
   49               | equality_exp EQ_OP relational_exp
   50               | equality_exp NE_OP relational_exp

   51  and_exp : equality_exp
   52          | and_exp '&' equality_exp

   53  exclusive_or_exp : and_exp
   54                   | exclusive_or_exp '^' and_exp

   55  inclusive_or_exp : exclusive_or_exp
   56                   | inclusive_or_exp '|' exclusive_or_exp

   57  logical_and_exp : inclusive_or_exp
   58                  | logical_and_exp AND_OP M inclusive_or_exp

   59  M :

   60  N :

   61  P :

   62  logical_or_exp : logical_and_exp
   63                 | logical_or_exp OR_OP M logical_and_exp

   64  conditional_exp : logical_or_exp
   65                  | logical_or_exp '?' exp ':' conditional_exp

   66  assignment_exp : conditional_exp
   67                 | unary_exp assignment_operator assignment_exp

   68  assignment_operator : '='
   69                      | MUL_ASSIGN
   70                      | DIV_ASSIGN
   71                      | MOD_ASSIGN
   72                      | ADD_ASSIGN
   73                      | SUB_ASSIGN
   74                      | LEFT_ASSIGN
   75                      | RIGHT_ASSIGN
   76                      | AND_ASSIGN
   77                      | XOR_ASSIGN
   78                      | OR_ASSIGN

   79  exp : assignment_exp
   80      | exp ',' assignment_exp

   81  constant_exp : conditional_exp

   82  declaration : declaration_specifiers ';'
   83              | declaration_specifiers init_declarator_list ';'

   84  declaration_specifiers : storage_class_specifier
   85                         | storage_class_specifier declaration_specifiers
   86                         | type_specifier
   87                         | type_specifier declaration_specifiers
   88                         | type_qualifier
   89                         | type_qualifier declaration_specifiers

   90  init_declarator_list : init_declarator
   91                       | init_declarator_list ',' init_declarator

   92  init_declarator : declarator
   93                  | declarator '=' initializer

   94  storage_class_specifier : TYPEDEF
   95                          | EXTERN
   96                          | STATIC
   97                          | AUTO
   98                          | REGISTER

   99  type_specifier : VOID
  100                 | CHAR
  101                 | SHORT
  102                 | INT
  103                 | LONG
  104                 | FLOAT
  105                 | DOUBLE
  106                 | SIGNED
  107                 | UNSIGNED
  108                 | struct_or_union_specifier
  109                 | enum_specifier
  110                 | TYPE_NAME
  111                 | type_specifier pointer

  112  struct_or_union_def : struct_or_union ID '{' declaration_list '}'
  113                      | struct_or_union '{' declaration_list '}'

  114  def_concat : ';'
  115             | init_declarator_list ';'

  116  struct_or_union_specifier : struct_or_union_def def_concat
  117                            | struct_or_union ID

  118  struct_or_union : STRUCT
  119                  | UNION

  120  struct_declaration_list : struct_declaration
  121                          | struct_declaration_list struct_declaration

  122  struct_declaration : specifier_qualifier_list struct_declarator_list ';'
  123                     | assignment_exp struct_declarator_list ';'

  124  specifier_qualifier_list : type_specifier specifier_qualifier_list
  125                           | type_specifier
  126                           | type_qualifier specifier_qualifier_list
  127                           | type_qualifier

  128  struct_declarator_list : struct_declarator
  129                         | struct_declarator_list ',' struct_declarator

  130  struct_declarator : declarator
  131                    | ':' constant_exp
  132                    | declarator ':' constant_exp

  133  enum_specifier : ENUM '{' enumerator_list '}'
  134                 | ENUM ID '{' enumerator_list '}'
  135                 | ENUM ID

  136  enumerator_list : enumerator
  137                  | enumerator_list ',' enumerator

  138  enumerator : ID
  139             | ID '=' constant_exp

  140  type_qualifier : CONST
  141                 | VOLATILE

  142  declarator : pointer direct_declarator
  143             | direct_declarator

  144  direct_pre_declarator : direct_declarator '('

  145  direct_declarator : ID
  146                    | '(' declarator ')'
  147                    | direct_declarator '[' constant_exp ']'
  148                    | direct_declarator '[' ']'
  149                    | direct_pre_declarator parameter_type_list ')'
  150                    | direct_pre_declarator identifier_list ')'
  151                    | direct_pre_declarator ')'

  152  pointer : '*'
  153          | '*' type_qualifier_list
  154          | '*' pointer
  155          | '*' type_qualifier_list pointer

  156  type_qualifier_list : type_qualifier
  157                      | type_qualifier_list type_qualifier

  158  parameter_type_list : parameter_list
  159                      | parameter_list ',' ELLIPSIS

  160  parameter_list : parameter_declaration
  161                 | parameter_list ',' parameter_declaration

  162  parameter_declaration : declaration_specifiers declarator
  163                        | declaration_specifiers abstract_declarator
  164                        | declaration_specifiers

  165  identifier_list : ID
  166                  | identifier_list ',' ID

  167  type_name : specifier_qualifier_list
  168            | specifier_qualifier_list abstract_declarator

  169  abstract_declarator : pointer
  170                      | direct_abstract_declarator
  171                      | pointer direct_abstract_declarator

  172  direct_abstract_declarator : '(' abstract_declarator ')'
  173                             | '[' ']'
  174                             | '[' constant_exp ']'
  175                             | direct_abstract_declarator '[' ']'
  176                             | direct_abstract_declarator '[' constant_exp ']'
  177                             | '(' ')'
  178                             | '(' parameter_type_list ')'
  179                             | direct_abstract_declarator '(' ')'
  180                             | direct_abstract_declarator '(' parameter_type_list ')'

  181  initializer : assignment_exp
  182              | '{' initializer_list '}'
  183              | '{' initializer_list ',' '}'

  184  initializer_list : initializer
  185                   | initializer_list ',' initializer

  186  other : compound_statement
  187        | exp_statement
  188        | iteration_statement
  189        | jump_statement

  190  statement : labeled_statement
  191            | other
  192            | selection_statement

  193  default_pre : DEFAULT ':'

  194  labeled_statement : ID ':' statement
  195                    | CASE constant_exp ':' M statement
  196                    | default_pre statement

  197  compound_statement : '{' '}'
  198                     | '{' statement_list '}'
  199                     | '{' declaration_list '}'
  200                     | '{' declaration_list statement_list '}'

  201  declaration_list : declaration
  202                   | declaration_list M declaration

  203  statement_list : statement
  204                 | statement_list M statement

  205  exp_statement : ';'
  206                | exp ';'

  207  stmt : matched_statement
  208       | open_statement

  209  matched_statement : IF '(' exp ')' M matched_statement P ELSE M matched_statement
  210                    | other

  211  open_statement : IF '(' exp ')' M stmt P
  212                 | IF '(' exp ')' M matched_statement P ELSE M open_statement

  213  selection_statement : stmt
  214                      | switch_pre statement

  215  switch_pre : SWITCH '(' exp ')'

  216  iteration_statement : WHILE M '(' exp ')' M statement
  217                      | DO M statement WHILE M '(' exp ')' ';'
  218                      | FOR '(' exp_statement M exp_statement ')' M statement
  219                      | FOR '(' exp_statement M exp_statement M exp P ')' M statement

  220  jump_statement : GOTO ID ';'
  221                 | CONTINUE ';'
  222                 | BREAK ';'
  223                 | RETURN ';'
  224                 | RETURN exp ';'

  225  translation_unit : external_declaration
  226                   | translation_unit external_declaration

  227  external_declaration : function_definition
  228                       | declaration

  229  function_definition : declaration_specifiers declarator declaration_list compound_statement
  230                      | declaration_specifiers declarator compound_statement
  231                      | declarator declaration_list compound_statement
  232                      | declarator compound_statement


##############################################################################
# States
##############################################################################

state 0
	$accept : . translation_unit $end

	'('  shift 1
	'*'  shift 2
	ID  shift 3
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declarator  goto 27
	declaration_specifiers  goto 28
	enum_specifier  goto 29
	pointer  goto 30
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	direct_declarator  goto 33
	struct_or_union  goto 34
	declaration  goto 35
	translation_unit  goto 36
	direct_pre_declarator  goto 37
	function_definition  goto 38
	external_declaration  goto 39


state 1
	direct_declarator : '(' . declarator ')'

	'('  shift 1
	'*'  shift 2
	ID  shift 3

	declarator  goto 40
	pointer  goto 30
	direct_declarator  goto 33
	direct_pre_declarator  goto 37


2: shift-reduce conflict (shift 2, reduce 152) on '*'
2: shift-reduce conflict (shift 18, reduce 152) on CONST
2: shift-reduce conflict (shift 19, reduce 152) on VOLATILE
state 2
	pointer : '*' . type_qualifier_list
	pointer : '*' . type_qualifier_list pointer
	pointer : '*' .  (152)
	pointer : '*' . pointer

	'*'  shift 2
	CONST  shift 18
	VOLATILE  shift 19
	.  reduce 152

	pointer  goto 41
	type_qualifier  goto 42
	type_qualifier_list  goto 43


state 3
	direct_declarator : ID .  (145)

	.  reduce 145


state 4
	type_specifier : TYPE_NAME .  (110)

	.  reduce 110


state 5
	storage_class_specifier : TYPEDEF .  (94)

	.  reduce 94


state 6
	storage_class_specifier : EXTERN .  (95)

	.  reduce 95


state 7
	storage_class_specifier : STATIC .  (96)

	.  reduce 96


state 8
	storage_class_specifier : AUTO .  (97)

	.  reduce 97


state 9
	storage_class_specifier : REGISTER .  (98)

	.  reduce 98


state 10
	type_specifier : CHAR .  (100)

	.  reduce 100


state 11
	type_specifier : SHORT .  (101)

	.  reduce 101


state 12
	type_specifier : INT .  (102)

	.  reduce 102


state 13
	type_specifier : LONG .  (103)

	.  reduce 103


state 14
	type_specifier : SIGNED .  (106)

	.  reduce 106


state 15
	type_specifier : UNSIGNED .  (107)

	.  reduce 107


state 16
	type_specifier : FLOAT .  (104)

	.  reduce 104


state 17
	type_specifier : DOUBLE .  (105)

	.  reduce 105


state 18
	type_qualifier : CONST .  (140)

	.  reduce 140


state 19
	type_qualifier : VOLATILE .  (141)

	.  reduce 141


state 20
	type_specifier : VOID .  (99)

	.  reduce 99


state 21
	struct_or_union : STRUCT .  (118)

	.  reduce 118


state 22
	struct_or_union : UNION .  (119)

	.  reduce 119


state 23
	enum_specifier : ENUM . '{' enumerator_list '}'
	enum_specifier : ENUM . ID '{' enumerator_list '}'
	enum_specifier : ENUM . ID

	'{'  shift 44
	ID  shift 45


state 24
	struct_or_union_specifier : struct_or_union_def . def_concat

	'('  shift 1
	'*'  shift 2
	';'  shift 46
	ID  shift 3

	def_concat  goto 47
	declarator  goto 48
	init_declarator  goto 49
	pointer  goto 30
	direct_declarator  goto 33
	init_declarator_list  goto 50
	direct_pre_declarator  goto 37


25: shift-reduce conflict (shift 2, reduce 86) on '*'
state 25
	declaration_specifiers : type_specifier .  (86)
	declaration_specifiers : type_specifier . declaration_specifiers
	type_specifier : type_specifier . pointer

	'*'  shift 2
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	.  reduce 86

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 51
	enum_specifier  goto 29
	pointer  goto 52
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34


state 26
	declaration_specifiers : storage_class_specifier .  (84)
	declaration_specifiers : storage_class_specifier . declaration_specifiers

	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	.  reduce 84

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 53
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34


state 27
	function_definition : declarator . declaration_list compound_statement
	function_definition : declarator . compound_statement

	'{'  shift 54
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 55
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	declaration  goto 56
	compound_statement  goto 57
	declaration_list  goto 58


state 28
	declaration : declaration_specifiers . ';'
	declaration : declaration_specifiers . init_declarator_list ';'
	function_definition : declaration_specifiers . declarator declaration_list compound_statement
	function_definition : declaration_specifiers . declarator compound_statement

	'('  shift 1
	'*'  shift 2
	';'  shift 59
	ID  shift 3

	declarator  goto 60
	init_declarator  goto 49
	pointer  goto 30
	direct_declarator  goto 33
	init_declarator_list  goto 61
	direct_pre_declarator  goto 37


state 29
	type_specifier : enum_specifier .  (109)

	.  reduce 109


state 30
	declarator : pointer . direct_declarator

	'('  shift 1
	ID  shift 3

	direct_declarator  goto 62
	direct_pre_declarator  goto 37


state 31
	declaration_specifiers : type_qualifier . declaration_specifiers
	declaration_specifiers : type_qualifier .  (88)

	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	.  reduce 88

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 63
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34


state 32
	type_specifier : struct_or_union_specifier .  (108)

	.  reduce 108


state 33
	direct_declarator : direct_declarator . '[' constant_exp ']'
	direct_pre_declarator : direct_declarator . '('
	direct_declarator : direct_declarator . '[' ']'
	declarator : direct_declarator .  (143)

	'('  shift 64
	'['  shift 65
	.  reduce 143


state 34
	struct_or_union_def : struct_or_union . '{' declaration_list '}'
	struct_or_union_specifier : struct_or_union . ID
	struct_or_union_def : struct_or_union . ID '{' declaration_list '}'

	'{'  shift 66
	ID  shift 67


state 35
	external_declaration : declaration .  (228)

	.  reduce 228


state 36
	$accept : translation_unit . $end  (0)
	translation_unit : translation_unit . external_declaration

	$end  accept
	'('  shift 1
	'*'  shift 2
	ID  shift 3
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declarator  goto 27
	declaration_specifiers  goto 28
	enum_specifier  goto 29
	pointer  goto 30
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	direct_declarator  goto 33
	struct_or_union  goto 34
	declaration  goto 35
	direct_pre_declarator  goto 37
	function_definition  goto 38
	external_declaration  goto 68


state 37
	direct_declarator : direct_pre_declarator . identifier_list ')'
	direct_declarator : direct_pre_declarator . ')'
	direct_declarator : direct_pre_declarator . parameter_type_list ')'

	')'  shift 69
	ID  shift 70
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 71
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	parameter_declaration  goto 72
	parameter_type_list  goto 73
	identifier_list  goto 74
	parameter_list  goto 75


state 38
	external_declaration : function_definition .  (227)

	.  reduce 227


state 39
	translation_unit : external_declaration .  (225)

	.  reduce 225


state 40
	direct_declarator : '(' declarator . ')'

	')'  shift 76


state 41
	pointer : '*' pointer .  (154)

	.  reduce 154


state 42
	type_qualifier_list : type_qualifier .  (156)

	.  reduce 156


43: shift-reduce conflict (shift 2, reduce 153) on '*'
43: shift-reduce conflict (shift 18, reduce 153) on CONST
43: shift-reduce conflict (shift 19, reduce 153) on VOLATILE
state 43
	pointer : '*' type_qualifier_list .  (153)
	pointer : '*' type_qualifier_list . pointer
	type_qualifier_list : type_qualifier_list . type_qualifier

	'*'  shift 2
	CONST  shift 18
	VOLATILE  shift 19
	.  reduce 153

	pointer  goto 77
	type_qualifier  goto 78


state 44
	enum_specifier : ENUM '{' . enumerator_list '}'

	ID  shift 79

	enumerator_list  goto 80
	enumerator  goto 81


state 45
	enum_specifier : ENUM ID . '{' enumerator_list '}'
	enum_specifier : ENUM ID .  (135)

	'{'  shift 82
	.  reduce 135


state 46
	def_concat : ';' .  (114)

	.  reduce 114


state 47
	struct_or_union_specifier : struct_or_union_def def_concat .  (116)

	.  reduce 116


state 48
	init_declarator : declarator .  (92)
	init_declarator : declarator . '=' initializer

	'='  shift 83
	.  reduce 92


state 49
	init_declarator_list : init_declarator .  (90)

	.  reduce 90


state 50
	init_declarator_list : init_declarator_list . ',' init_declarator
	def_concat : init_declarator_list . ';'

	','  shift 84
	';'  shift 85


state 51
	declaration_specifiers : type_specifier declaration_specifiers .  (87)

	.  reduce 87


state 52
	type_specifier : type_specifier pointer .  (111)

	.  reduce 111


state 53
	declaration_specifiers : storage_class_specifier declaration_specifiers .  (85)

	.  reduce 85


state 54
	compound_statement : '{' . statement_list '}'
	compound_statement : '{' . declaration_list '}'
	compound_statement : '{' . declaration_list statement_list '}'
	compound_statement : '{' . '}'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'}'  shift 93
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TYPE_NAME  shift 4
	TRUE  shift 101
	FALSE  shift 102
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	declaration_specifiers  goto 55
	exclusive_or_exp  goto 129
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	logical_or_exp  goto 130
	struct_or_union  goto 34
	conditional_exp  goto 131
	declaration  goto 56
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 134
	statement_list  goto 135
	iteration_statement  goto 136
	labeled_statement  goto 137
	declaration_list  goto 138
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 55
	declaration : declaration_specifiers . ';'
	declaration : declaration_specifiers . init_declarator_list ';'

	'('  shift 1
	'*'  shift 2
	';'  shift 59
	ID  shift 3

	declarator  goto 48
	init_declarator  goto 49
	pointer  goto 30
	direct_declarator  goto 33
	init_declarator_list  goto 61
	direct_pre_declarator  goto 37


state 56
	declaration_list : declaration .  (201)

	.  reduce 201


state 57
	function_definition : declarator compound_statement .  (232)

	.  reduce 232


state 58
	declaration_list : declaration_list . M declaration
	function_definition : declarator declaration_list . compound_statement
	M : .  (59)

	'{'  shift 54
	.  reduce 59

	compound_statement  goto 148
	M  goto 149


state 59
	declaration : declaration_specifiers ';' .  (82)

	.  reduce 82


state 60
	init_declarator : declarator .  (92)
	init_declarator : declarator . '=' initializer
	function_definition : declaration_specifiers declarator . declaration_list compound_statement
	function_definition : declaration_specifiers declarator . compound_statement

	'='  shift 83
	'{'  shift 54
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	.  reduce 92

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 55
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	declaration  goto 56
	compound_statement  goto 150
	declaration_list  goto 151


state 61
	init_declarator_list : init_declarator_list . ',' init_declarator
	declaration : declaration_specifiers init_declarator_list . ';'

	','  shift 84
	';'  shift 152


state 62
	direct_declarator : direct_declarator . '[' constant_exp ']'
	declarator : pointer direct_declarator .  (142)
	direct_pre_declarator : direct_declarator . '('
	direct_declarator : direct_declarator . '[' ']'

	'('  shift 64
	'['  shift 65
	.  reduce 142


state 63
	declaration_specifiers : type_qualifier declaration_specifiers .  (89)

	.  reduce 89


state 64
	direct_pre_declarator : direct_declarator '(' .  (144)

	.  reduce 144


state 65
	direct_declarator : direct_declarator '[' . constant_exp ']'
	direct_declarator : direct_declarator '[' . ']'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	']'  shift 153
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	constant_exp  goto 156
	logical_and_exp  goto 127
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 157
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 66
	struct_or_union_def : struct_or_union '{' . declaration_list '}'

	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 55
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	declaration  goto 56
	declaration_list  goto 158


state 67
	struct_or_union_specifier : struct_or_union ID .  (117)
	struct_or_union_def : struct_or_union ID . '{' declaration_list '}'

	'{'  shift 159
	.  reduce 117


state 68
	translation_unit : translation_unit external_declaration .  (226)

	.  reduce 226


state 69
	direct_declarator : direct_pre_declarator ')' .  (151)

	.  reduce 151


state 70
	identifier_list : ID .  (165)

	.  reduce 165


state 71
	parameter_declaration : declaration_specifiers . declarator
	parameter_declaration : declaration_specifiers .  (164)
	parameter_declaration : declaration_specifiers . abstract_declarator

	'('  shift 160
	'*'  shift 2
	'['  shift 161
	ID  shift 3
	.  reduce 164

	declarator  goto 162
	pointer  goto 163
	direct_declarator  goto 33
	direct_abstract_declarator  goto 164
	abstract_declarator  goto 165
	direct_pre_declarator  goto 37


state 72
	parameter_list : parameter_declaration .  (160)

	.  reduce 160


state 73
	direct_declarator : direct_pre_declarator parameter_type_list . ')'

	')'  shift 166


state 74
	direct_declarator : direct_pre_declarator identifier_list . ')'
	identifier_list : identifier_list . ',' ID

	')'  shift 167
	','  shift 168


state 75
	parameter_type_list : parameter_list . ',' ELLIPSIS
	parameter_list : parameter_list . ',' parameter_declaration
	parameter_type_list : parameter_list .  (158)

	','  shift 169
	.  reduce 158


state 76
	direct_declarator : '(' declarator ')' .  (146)

	.  reduce 146


state 77
	pointer : '*' type_qualifier_list pointer .  (155)

	.  reduce 155


state 78
	type_qualifier_list : type_qualifier_list type_qualifier .  (157)

	.  reduce 157


state 79
	enumerator : ID .  (138)
	enumerator : ID . '=' constant_exp

	'='  shift 170
	.  reduce 138


state 80
	enum_specifier : ENUM '{' enumerator_list . '}'
	enumerator_list : enumerator_list . ',' enumerator

	','  shift 171
	'}'  shift 172


state 81
	enumerator_list : enumerator .  (136)

	.  reduce 136


state 82
	enum_specifier : ENUM ID '{' . enumerator_list '}'

	ID  shift 79

	enumerator_list  goto 173
	enumerator  goto 81


state 83
	init_declarator : declarator '=' . initializer

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'{'  shift 174
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 175
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	initializer  goto 176
	postfix_pre_exp  goto 147


state 84
	init_declarator_list : init_declarator_list ',' . init_declarator

	'('  shift 1
	'*'  shift 2
	ID  shift 3

	declarator  goto 48
	init_declarator  goto 177
	pointer  goto 30
	direct_declarator  goto 33
	direct_pre_declarator  goto 37


state 85
	def_concat : init_declarator_list ';' .  (115)

	.  reduce 115


state 86
	unary_operator : '!' .  (29)

	.  reduce 29


state 87
	unary_operator : '&' .  (24)

	.  reduce 24


state 88
	primary_exp : '(' . exp ')'
	cast_exp : '(' . type_name ')' cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TYPE_NAME  shift 4
	TRUE  shift 101
	FALSE  shift 102
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	struct_or_union_def  goto 24
	type_specifier  goto 178
	exp  goto 179
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	enum_specifier  goto 29
	type_qualifier  goto 180
	struct_or_union_specifier  goto 32
	specifier_qualifier_list  goto 181
	logical_or_exp  goto 130
	struct_or_union  goto 34
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	type_name  goto 182
	postfix_pre_exp  goto 147


state 89
	unary_operator : '*' .  (25)

	.  reduce 25


state 90
	unary_operator : '+' .  (26)

	.  reduce 26


state 91
	unary_operator : '-' .  (27)

	.  reduce 27


state 92
	exp_statement : ';' .  (205)

	.  reduce 205


state 93
	compound_statement : '{' '}' .  (197)

	.  reduce 197


state 94
	unary_operator : '~' .  (28)

	.  reduce 28


state 95
	primary_exp : ID .  (1)
	labeled_statement : ID . ':' statement

	':'  shift 183
	.  reduce 1


state 96
	primary_exp : CONSTANT .  (2)

	.  reduce 2


state 97
	primary_exp : STRING_LITERAL .  (3)

	.  reduce 3


state 98
	unary_exp : SIZEOF . '(' type_name ')'
	unary_exp : SIZEOF . unary_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 184
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 185
	postfix_pre_exp  goto 147


state 99
	unary_exp : INC_OP . unary_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 186
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 187
	postfix_pre_exp  goto 147


state 100
	unary_exp : DEC_OP . unary_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 186
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 188
	postfix_pre_exp  goto 147


state 101
	primary_exp : TRUE .  (5)

	.  reduce 5


state 102
	primary_exp : FALSE .  (6)

	.  reduce 6


state 103
	labeled_statement : CASE . constant_exp ':' M statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	constant_exp  goto 189
	logical_and_exp  goto 127
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 157
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 104
	default_pre : DEFAULT . ':'

	':'  shift 190


state 105
	open_statement : IF . '(' exp ')' M matched_statement P ELSE M open_statement
	open_statement : IF . '(' exp ')' M stmt P
	matched_statement : IF . '(' exp ')' M matched_statement P ELSE M matched_statement

	'('  shift 191


state 106
	switch_pre : SWITCH . '(' exp ')'

	'('  shift 192


state 107
	iteration_statement : WHILE . M '(' exp ')' M statement
	M : .  (59)

	.  reduce 59

	M  goto 193


state 108
	iteration_statement : DO . M statement WHILE M '(' exp ')' ';'
	M : .  (59)

	.  reduce 59

	M  goto 194


state 109
	iteration_statement : FOR . '(' exp_statement M exp_statement ')' M statement
	iteration_statement : FOR . '(' exp_statement M exp_statement M exp P ')' M statement

	'('  shift 195


state 110
	jump_statement : GOTO . ID ';'

	ID  shift 196


state 111
	jump_statement : CONTINUE . ';'

	';'  shift 197


state 112
	jump_statement : BREAK . ';'

	';'  shift 198


state 113
	jump_statement : RETURN . ';'
	jump_statement : RETURN . exp ';'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 199
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 200
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


114: shift-reduce conflict (shift 204, reduce 37) on '^'
state 114
	multiplicative_exp : multiplicative_exp . '^' cast_exp
	multiplicative_exp : multiplicative_exp . '%' cast_exp
	additive_exp : multiplicative_exp .  (37)
	multiplicative_exp : multiplicative_exp . '*' cast_exp
	multiplicative_exp : multiplicative_exp . '/' cast_exp

	'%'  shift 201
	'*'  shift 202
	'/'  shift 203
	'^'  shift 204
	.  reduce 37


state 115
	shift_exp : additive_exp .  (40)
	additive_exp : additive_exp . '-' multiplicative_exp
	additive_exp : additive_exp . '+' multiplicative_exp

	'+'  shift 205
	'-'  shift 206
	.  reduce 40


state 116
	shift_exp : shift_exp . RIGHT_OP additive_exp
	shift_exp : shift_exp . LEFT_OP additive_exp
	relational_exp : shift_exp .  (43)

	LEFT_OP  shift 207
	RIGHT_OP  shift 208
	.  reduce 43


state 117
	postfix_pre_exp : postfix_exp . '('
	postfix_exp : postfix_exp . '[' exp ']'
	postfix_exp : postfix_exp . '.' ID
	postfix_exp : postfix_exp . PTR_OP ID
	postfix_exp : postfix_exp . INC_OP
	postfix_exp : postfix_exp . DEC_OP
	unary_exp : postfix_exp .  (18)

	'('  shift 209
	'.'  shift 210
	'['  shift 211
	PTR_OP  shift 212
	INC_OP  shift 213
	DEC_OP  shift 214
	.  reduce 18


state 118
	equality_exp : relational_exp .  (48)
	relational_exp : relational_exp . LE_OP shift_exp
	relational_exp : relational_exp . '<' shift_exp
	relational_exp : relational_exp . GE_OP shift_exp
	relational_exp : relational_exp . '>' shift_exp

	'<'  shift 215
	'>'  shift 216
	LE_OP  shift 217
	GE_OP  shift 218
	.  reduce 48


state 119
	equality_exp : equality_exp . EQ_OP relational_exp
	equality_exp : equality_exp . NE_OP relational_exp
	and_exp : equality_exp .  (51)

	EQ_OP  shift 219
	NE_OP  shift 220
	.  reduce 51


state 120
	exclusive_or_exp : and_exp .  (53)
	and_exp : and_exp . '&' equality_exp

	'&'  shift 221
	.  reduce 53


state 121
	labeled_statement : default_pre . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 222
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 122
	postfix_exp : primary_exp .  (8)

	.  reduce 8


state 123
	unary_exp : unary_operator . cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 223
	postfix_pre_exp  goto 147


state 124
	cast_exp : unary_exp .  (30)
	assignment_exp : unary_exp . assignment_operator assignment_exp

	'='  shift 224
	MUL_ASSIGN  shift 225
	DIV_ASSIGN  shift 226
	MOD_ASSIGN  shift 227
	ADD_ASSIGN  shift 228
	SUB_ASSIGN  shift 229
	LEFT_ASSIGN  shift 230
	RIGHT_ASSIGN  shift 231
	AND_ASSIGN  shift 232
	XOR_ASSIGN  shift 233
	OR_ASSIGN  shift 234
	.  reduce 30

	assignment_operator  goto 235


state 125
	multiplicative_exp : cast_exp .  (32)

	.  reduce 32


state 126
	exp : exp . ',' assignment_exp
	exp_statement : exp . ';'

	','  shift 236
	';'  shift 237


state 127
	logical_or_exp : logical_and_exp .  (62)
	logical_and_exp : logical_and_exp . AND_OP M inclusive_or_exp

	AND_OP  shift 238
	.  reduce 62


state 128
	exp : assignment_exp .  (79)

	.  reduce 79


state 129
	exclusive_or_exp : exclusive_or_exp . '^' and_exp
	inclusive_or_exp : exclusive_or_exp .  (55)

	'^'  shift 239
	.  reduce 55


state 130
	logical_or_exp : logical_or_exp . OR_OP M logical_and_exp
	conditional_exp : logical_or_exp .  (64)
	conditional_exp : logical_or_exp . '?' exp ':' conditional_exp

	'?'  shift 240
	OR_OP  shift 241
	.  reduce 64


state 131
	assignment_exp : conditional_exp .  (66)

	.  reduce 66


state 132
	inclusive_or_exp : inclusive_or_exp . '|' exclusive_or_exp
	logical_and_exp : inclusive_or_exp .  (57)

	'|'  shift 242
	.  reduce 57


state 133
	other : compound_statement .  (186)

	.  reduce 186


state 134
	statement_list : statement .  (203)

	.  reduce 203


state 135
	compound_statement : '{' statement_list . '}'
	statement_list : statement_list . M statement
	M : .  (59)

	'}'  shift 243
	.  reduce 59

	M  goto 244


state 136
	other : iteration_statement .  (188)

	.  reduce 188


state 137
	statement : labeled_statement .  (190)

	.  reduce 190


state 138
	compound_statement : '{' declaration_list . '}'
	declaration_list : declaration_list . M declaration
	compound_statement : '{' declaration_list . statement_list '}'
	M : .  (59)

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'}'  shift 245
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113
	.  reduce 59

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 134
	statement_list  goto 246
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	M  goto 149
	postfix_pre_exp  goto 147


state 139
	other : exp_statement .  (187)

	.  reduce 187


state 140
	other : jump_statement .  (189)

	.  reduce 189


state 141
	stmt : matched_statement .  (207)

	.  reduce 207


142: reduce-reduce conflict (reduce 191, reduce 210) on '!'
142: reduce-reduce conflict (reduce 191, reduce 210) on '&'
142: reduce-reduce conflict (reduce 191, reduce 210) on '('
142: reduce-reduce conflict (reduce 191, reduce 210) on '*'
142: reduce-reduce conflict (reduce 191, reduce 210) on '+'
142: reduce-reduce conflict (reduce 191, reduce 210) on '-'
142: reduce-reduce conflict (reduce 191, reduce 210) on ';'
142: reduce-reduce conflict (reduce 191, reduce 210) on '{'
142: reduce-reduce conflict (reduce 191, reduce 210) on '}'
142: reduce-reduce conflict (reduce 191, reduce 210) on '~'
142: reduce-reduce conflict (reduce 191, reduce 210) on ID
142: reduce-reduce conflict (reduce 191, reduce 210) on CONSTANT
142: reduce-reduce conflict (reduce 191, reduce 210) on STRING_LITERAL
142: reduce-reduce conflict (reduce 191, reduce 210) on SIZEOF
142: reduce-reduce conflict (reduce 191, reduce 210) on INC_OP
142: reduce-reduce conflict (reduce 191, reduce 210) on DEC_OP
142: reduce-reduce conflict (reduce 191, reduce 210) on TRUE
142: reduce-reduce conflict (reduce 191, reduce 210) on FALSE
142: reduce-reduce conflict (reduce 191, reduce 210) on CASE
142: reduce-reduce conflict (reduce 191, reduce 210) on DEFAULT
142: reduce-reduce conflict (reduce 191, reduce 210) on IF
142: reduce-reduce conflict (reduce 191, reduce 210) on ELSE
142: reduce-reduce conflict (reduce 191, reduce 210) on SWITCH
142: reduce-reduce conflict (reduce 191, reduce 210) on WHILE
142: reduce-reduce conflict (reduce 191, reduce 210) on DO
142: reduce-reduce conflict (reduce 191, reduce 210) on FOR
142: reduce-reduce conflict (reduce 191, reduce 210) on GOTO
142: reduce-reduce conflict (reduce 191, reduce 210) on CONTINUE
142: reduce-reduce conflict (reduce 191, reduce 210) on BREAK
142: reduce-reduce conflict (reduce 191, reduce 210) on RETURN
state 142
	statement : other .  (191)
	matched_statement : other .  (210)

	.  reduce 191


state 143
	stmt : open_statement .  (208)

	.  reduce 208


state 144
	statement : selection_statement .  (192)

	.  reduce 192


state 145
	selection_statement : switch_pre . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 247
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 146
	selection_statement : stmt .  (213)

	.  reduce 213


state 147
	postfix_exp : postfix_pre_exp . ')'
	postfix_exp : postfix_pre_exp . argument_exp_list ')'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	')'  shift 248
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	argument_exp_list  goto 249
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 250
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 148
	function_definition : declarator declaration_list compound_statement .  (231)

	.  reduce 231


state 149
	declaration_list : declaration_list M . declaration

	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 55
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	declaration  goto 251


state 150
	function_definition : declaration_specifiers declarator compound_statement .  (230)

	.  reduce 230


state 151
	declaration_list : declaration_list . M declaration
	function_definition : declaration_specifiers declarator declaration_list . compound_statement
	M : .  (59)

	'{'  shift 54
	.  reduce 59

	compound_statement  goto 252
	M  goto 149


state 152
	declaration : declaration_specifiers init_declarator_list ';' .  (83)

	.  reduce 83


state 153
	direct_declarator : direct_declarator '[' ']' .  (148)

	.  reduce 148


state 154
	primary_exp : ID .  (1)

	.  reduce 1


state 155
	cast_exp : unary_exp .  (30)

	.  reduce 30


state 156
	direct_declarator : direct_declarator '[' constant_exp . ']'

	']'  shift 253


state 157
	constant_exp : conditional_exp .  (81)

	.  reduce 81


state 158
	struct_or_union_def : struct_or_union '{' declaration_list . '}'
	declaration_list : declaration_list . M declaration
	M : .  (59)

	'}'  shift 254
	.  reduce 59

	M  goto 149


state 159
	struct_or_union_def : struct_or_union ID '{' . declaration_list '}'

	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 55
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	declaration  goto 56
	declaration_list  goto 255


state 160
	direct_declarator : '(' . declarator ')'
	direct_abstract_declarator : '(' . abstract_declarator ')'
	direct_abstract_declarator : '(' . ')'
	direct_abstract_declarator : '(' . parameter_type_list ')'

	'('  shift 160
	')'  shift 256
	'*'  shift 2
	'['  shift 161
	ID  shift 3
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declarator  goto 40
	declaration_specifiers  goto 71
	enum_specifier  goto 29
	pointer  goto 163
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	direct_declarator  goto 33
	struct_or_union  goto 34
	direct_abstract_declarator  goto 164
	parameter_declaration  goto 72
	abstract_declarator  goto 257
	parameter_type_list  goto 258
	parameter_list  goto 75
	direct_pre_declarator  goto 37


state 161
	direct_abstract_declarator : '[' . ']'
	direct_abstract_declarator : '[' . constant_exp ']'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	']'  shift 259
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	constant_exp  goto 260
	logical_and_exp  goto 127
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 157
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 162
	parameter_declaration : declaration_specifiers declarator .  (162)

	.  reduce 162


state 163
	declarator : pointer . direct_declarator
	abstract_declarator : pointer .  (169)
	abstract_declarator : pointer . direct_abstract_declarator

	'('  shift 160
	'['  shift 161
	ID  shift 3
	.  reduce 169

	direct_declarator  goto 62
	direct_abstract_declarator  goto 261
	direct_pre_declarator  goto 37


state 164
	abstract_declarator : direct_abstract_declarator .  (170)
	direct_abstract_declarator : direct_abstract_declarator . '(' parameter_type_list ')'
	direct_abstract_declarator : direct_abstract_declarator . '(' ')'
	direct_abstract_declarator : direct_abstract_declarator . '[' constant_exp ']'
	direct_abstract_declarator : direct_abstract_declarator . '[' ']'

	'('  shift 262
	'['  shift 263
	.  reduce 170


state 165
	parameter_declaration : declaration_specifiers abstract_declarator .  (163)

	.  reduce 163


state 166
	direct_declarator : direct_pre_declarator parameter_type_list ')' .  (149)

	.  reduce 149


state 167
	direct_declarator : direct_pre_declarator identifier_list ')' .  (150)

	.  reduce 150


state 168
	identifier_list : identifier_list ',' . ID

	ID  shift 264


state 169
	parameter_type_list : parameter_list ',' . ELLIPSIS
	parameter_list : parameter_list ',' . parameter_declaration

	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	ELLIPSIS  shift 265

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 71
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	parameter_declaration  goto 266


state 170
	enumerator : ID '=' . constant_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	constant_exp  goto 267
	logical_and_exp  goto 127
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 157
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 171
	enumerator_list : enumerator_list ',' . enumerator

	ID  shift 79

	enumerator  goto 268


state 172
	enum_specifier : ENUM '{' enumerator_list '}' .  (133)

	.  reduce 133


state 173
	enum_specifier : ENUM ID '{' enumerator_list . '}'
	enumerator_list : enumerator_list . ',' enumerator

	','  shift 171
	'}'  shift 269


state 174
	initializer : '{' . initializer_list ',' '}'
	initializer : '{' . initializer_list '}'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'{'  shift 174
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 175
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	initializer  goto 270
	initializer_list  goto 271
	postfix_pre_exp  goto 147


state 175
	initializer : assignment_exp .  (181)

	.  reduce 181


state 176
	init_declarator : declarator '=' initializer .  (93)

	.  reduce 93


state 177
	init_declarator_list : init_declarator_list ',' init_declarator .  (91)

	.  reduce 91


178: shift-reduce conflict (shift 2, reduce 125) on '*'
state 178
	type_specifier : type_specifier . pointer
	specifier_qualifier_list : type_specifier . specifier_qualifier_list
	specifier_qualifier_list : type_specifier .  (125)

	'*'  shift 2
	TYPE_NAME  shift 4
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	.  reduce 125

	struct_or_union_def  goto 24
	type_specifier  goto 178
	enum_specifier  goto 29
	pointer  goto 52
	type_qualifier  goto 180
	struct_or_union_specifier  goto 32
	specifier_qualifier_list  goto 272
	struct_or_union  goto 34


state 179
	primary_exp : '(' exp . ')'
	exp : exp . ',' assignment_exp

	')'  shift 273
	','  shift 236


state 180
	specifier_qualifier_list : type_qualifier . specifier_qualifier_list
	specifier_qualifier_list : type_qualifier .  (127)

	TYPE_NAME  shift 4
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23
	.  reduce 127

	struct_or_union_def  goto 24
	type_specifier  goto 178
	enum_specifier  goto 29
	type_qualifier  goto 180
	struct_or_union_specifier  goto 32
	specifier_qualifier_list  goto 274
	struct_or_union  goto 34


state 181
	type_name : specifier_qualifier_list .  (167)
	type_name : specifier_qualifier_list . abstract_declarator

	'('  shift 275
	'*'  shift 2
	'['  shift 161
	.  reduce 167

	pointer  goto 276
	direct_abstract_declarator  goto 164
	abstract_declarator  goto 277


state 182
	cast_exp : '(' type_name . ')' cast_exp

	')'  shift 278


state 183
	labeled_statement : ID ':' . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 279
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 184
	primary_exp : '(' . exp ')'
	unary_exp : SIZEOF '(' . type_name ')'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TYPE_NAME  shift 4
	TRUE  shift 101
	FALSE  shift 102
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	struct_or_union_def  goto 24
	type_specifier  goto 178
	exp  goto 179
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	enum_specifier  goto 29
	type_qualifier  goto 180
	struct_or_union_specifier  goto 32
	specifier_qualifier_list  goto 181
	logical_or_exp  goto 130
	struct_or_union  goto 34
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	type_name  goto 280
	postfix_pre_exp  goto 147


state 185
	unary_exp : SIZEOF unary_exp .  (22)

	.  reduce 22


state 186
	primary_exp : '(' . exp ')'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 179
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 187
	unary_exp : INC_OP unary_exp .  (19)

	.  reduce 19


state 188
	unary_exp : DEC_OP unary_exp .  (20)

	.  reduce 20


state 189
	labeled_statement : CASE constant_exp . ':' M statement

	':'  shift 281


state 190
	default_pre : DEFAULT ':' .  (193)

	.  reduce 193


state 191
	open_statement : IF '(' . exp ')' M matched_statement P ELSE M open_statement
	open_statement : IF '(' . exp ')' M stmt P
	matched_statement : IF '(' . exp ')' M matched_statement P ELSE M matched_statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 282
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 192
	switch_pre : SWITCH '(' . exp ')'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 283
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 193
	iteration_statement : WHILE M . '(' exp ')' M statement

	'('  shift 284


state 194
	iteration_statement : DO M . statement WHILE M '(' exp ')' ';'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 285
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 195
	iteration_statement : FOR '(' . exp_statement M exp_statement ')' M statement
	iteration_statement : FOR '(' . exp_statement M exp_statement M exp P ')' M statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	exp_statement  goto 286
	postfix_pre_exp  goto 147


state 196
	jump_statement : GOTO ID . ';'

	';'  shift 287


state 197
	jump_statement : CONTINUE ';' .  (221)

	.  reduce 221


state 198
	jump_statement : BREAK ';' .  (222)

	.  reduce 222


state 199
	jump_statement : RETURN ';' .  (223)

	.  reduce 223


state 200
	exp : exp . ',' assignment_exp
	jump_statement : RETURN exp . ';'

	','  shift 236
	';'  shift 288


state 201
	multiplicative_exp : multiplicative_exp '%' . cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 289
	postfix_pre_exp  goto 147


state 202
	multiplicative_exp : multiplicative_exp '*' . cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 290
	postfix_pre_exp  goto 147


state 203
	multiplicative_exp : multiplicative_exp '/' . cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 291
	postfix_pre_exp  goto 147


state 204
	multiplicative_exp : multiplicative_exp '^' . cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 292
	postfix_pre_exp  goto 147


state 205
	additive_exp : additive_exp '+' . multiplicative_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 293
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 206
	additive_exp : additive_exp '-' . multiplicative_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 294
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 207
	shift_exp : shift_exp LEFT_OP . additive_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 295
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 208
	shift_exp : shift_exp RIGHT_OP . additive_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 296
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 209
	postfix_pre_exp : postfix_exp '(' .  (7)

	.  reduce 7


state 210
	postfix_exp : postfix_exp '.' . ID

	ID  shift 297


state 211
	postfix_exp : postfix_exp '[' . exp ']'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 298
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 212
	postfix_exp : postfix_exp PTR_OP . ID

	ID  shift 299


state 213
	postfix_exp : postfix_exp INC_OP .  (14)

	.  reduce 14


state 214
	postfix_exp : postfix_exp DEC_OP .  (15)

	.  reduce 15


state 215
	relational_exp : relational_exp '<' . shift_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 300
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 216
	relational_exp : relational_exp '>' . shift_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 301
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 217
	relational_exp : relational_exp LE_OP . shift_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 302
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 218
	relational_exp : relational_exp GE_OP . shift_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 303
	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 219
	equality_exp : equality_exp EQ_OP . relational_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 304
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 220
	equality_exp : equality_exp NE_OP . relational_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 305
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 221
	and_exp : and_exp '&' . equality_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 306
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 222
	labeled_statement : default_pre statement .  (196)

	.  reduce 196


state 223
	unary_exp : unary_operator cast_exp .  (21)

	.  reduce 21


state 224
	assignment_operator : '=' .  (68)

	.  reduce 68


state 225
	assignment_operator : MUL_ASSIGN .  (69)

	.  reduce 69


state 226
	assignment_operator : DIV_ASSIGN .  (70)

	.  reduce 70


state 227
	assignment_operator : MOD_ASSIGN .  (71)

	.  reduce 71


state 228
	assignment_operator : ADD_ASSIGN .  (72)

	.  reduce 72


state 229
	assignment_operator : SUB_ASSIGN .  (73)

	.  reduce 73


state 230
	assignment_operator : LEFT_ASSIGN .  (74)

	.  reduce 74


state 231
	assignment_operator : RIGHT_ASSIGN .  (75)

	.  reduce 75


state 232
	assignment_operator : AND_ASSIGN .  (76)

	.  reduce 76


state 233
	assignment_operator : XOR_ASSIGN .  (77)

	.  reduce 77


state 234
	assignment_operator : OR_ASSIGN .  (78)

	.  reduce 78


state 235
	assignment_exp : unary_exp assignment_operator . assignment_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 307
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 236
	exp : exp ',' . assignment_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 308
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 237
	exp_statement : exp ';' .  (206)

	.  reduce 206


state 238
	logical_and_exp : logical_and_exp AND_OP . M inclusive_or_exp
	M : .  (59)

	.  reduce 59

	M  goto 309


state 239
	exclusive_or_exp : exclusive_or_exp '^' . and_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 310
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	postfix_pre_exp  goto 147


state 240
	conditional_exp : logical_or_exp '?' . exp ':' conditional_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 311
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 241
	logical_or_exp : logical_or_exp OR_OP . M logical_and_exp
	M : .  (59)

	.  reduce 59

	M  goto 312


state 242
	inclusive_or_exp : inclusive_or_exp '|' . exclusive_or_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	exclusive_or_exp  goto 313
	postfix_pre_exp  goto 147


state 243
	compound_statement : '{' statement_list '}' .  (198)

	.  reduce 198


state 244
	statement_list : statement_list M . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 314
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 245
	compound_statement : '{' declaration_list '}' .  (199)

	.  reduce 199


state 246
	compound_statement : '{' declaration_list statement_list . '}'
	statement_list : statement_list . M statement
	M : .  (59)

	'}'  shift 315
	.  reduce 59

	M  goto 244


state 247
	selection_statement : switch_pre statement .  (214)

	.  reduce 214


state 248
	postfix_exp : postfix_pre_exp ')' .  (10)

	.  reduce 10


state 249
	postfix_exp : postfix_pre_exp argument_exp_list . ')'
	argument_exp_list : argument_exp_list . ',' assignment_exp

	')'  shift 316
	','  shift 317


state 250
	argument_exp_list : assignment_exp .  (16)

	.  reduce 16


state 251
	declaration_list : declaration_list M declaration .  (202)

	.  reduce 202


state 252
	function_definition : declaration_specifiers declarator declaration_list compound_statement .  (229)

	.  reduce 229


state 253
	direct_declarator : direct_declarator '[' constant_exp ']' .  (147)

	.  reduce 147


state 254
	struct_or_union_def : struct_or_union '{' declaration_list '}' .  (113)

	.  reduce 113


state 255
	struct_or_union_def : struct_or_union ID '{' declaration_list . '}'
	declaration_list : declaration_list . M declaration
	M : .  (59)

	'}'  shift 318
	.  reduce 59

	M  goto 149


state 256
	direct_abstract_declarator : '(' ')' .  (177)

	.  reduce 177


state 257
	direct_abstract_declarator : '(' abstract_declarator . ')'

	')'  shift 319


state 258
	direct_abstract_declarator : '(' parameter_type_list . ')'

	')'  shift 320


state 259
	direct_abstract_declarator : '[' ']' .  (173)

	.  reduce 173


state 260
	direct_abstract_declarator : '[' constant_exp . ']'

	']'  shift 321


state 261
	abstract_declarator : pointer direct_abstract_declarator .  (171)
	direct_abstract_declarator : direct_abstract_declarator . '(' parameter_type_list ')'
	direct_abstract_declarator : direct_abstract_declarator . '(' ')'
	direct_abstract_declarator : direct_abstract_declarator . '[' constant_exp ']'
	direct_abstract_declarator : direct_abstract_declarator . '[' ']'

	'('  shift 262
	'['  shift 263
	.  reduce 171


state 262
	direct_abstract_declarator : direct_abstract_declarator '(' . parameter_type_list ')'
	direct_abstract_declarator : direct_abstract_declarator '(' . ')'

	')'  shift 322
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 71
	enum_specifier  goto 29
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	parameter_declaration  goto 72
	parameter_type_list  goto 323
	parameter_list  goto 75


state 263
	direct_abstract_declarator : direct_abstract_declarator '[' . constant_exp ']'
	direct_abstract_declarator : direct_abstract_declarator '[' . ']'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	']'  shift 324
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	constant_exp  goto 325
	logical_and_exp  goto 127
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 157
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 264
	identifier_list : identifier_list ',' ID .  (166)

	.  reduce 166


state 265
	parameter_type_list : parameter_list ',' ELLIPSIS .  (159)

	.  reduce 159


state 266
	parameter_list : parameter_list ',' parameter_declaration .  (161)

	.  reduce 161


state 267
	enumerator : ID '=' constant_exp .  (139)

	.  reduce 139


state 268
	enumerator_list : enumerator_list ',' enumerator .  (137)

	.  reduce 137


state 269
	enum_specifier : ENUM ID '{' enumerator_list '}' .  (134)

	.  reduce 134


state 270
	initializer_list : initializer .  (184)

	.  reduce 184


state 271
	initializer : '{' initializer_list . ',' '}'
	initializer : '{' initializer_list . '}'
	initializer_list : initializer_list . ',' initializer

	','  shift 326
	'}'  shift 327


state 272
	specifier_qualifier_list : type_specifier specifier_qualifier_list .  (124)

	.  reduce 124


state 273
	primary_exp : '(' exp ')' .  (4)

	.  reduce 4


state 274
	specifier_qualifier_list : type_qualifier specifier_qualifier_list .  (126)

	.  reduce 126


state 275
	direct_abstract_declarator : '(' . abstract_declarator ')'
	direct_abstract_declarator : '(' . ')'
	direct_abstract_declarator : '(' . parameter_type_list ')'

	'('  shift 275
	')'  shift 256
	'*'  shift 2
	'['  shift 161
	TYPE_NAME  shift 4
	TYPEDEF  shift 5
	EXTERN  shift 6
	STATIC  shift 7
	AUTO  shift 8
	REGISTER  shift 9
	CHAR  shift 10
	SHORT  shift 11
	INT  shift 12
	LONG  shift 13
	SIGNED  shift 14
	UNSIGNED  shift 15
	FLOAT  shift 16
	DOUBLE  shift 17
	CONST  shift 18
	VOLATILE  shift 19
	VOID  shift 20
	STRUCT  shift 21
	UNION  shift 22
	ENUM  shift 23

	struct_or_union_def  goto 24
	type_specifier  goto 25
	storage_class_specifier  goto 26
	declaration_specifiers  goto 71
	enum_specifier  goto 29
	pointer  goto 276
	type_qualifier  goto 31
	struct_or_union_specifier  goto 32
	struct_or_union  goto 34
	direct_abstract_declarator  goto 164
	parameter_declaration  goto 72
	abstract_declarator  goto 257
	parameter_type_list  goto 258
	parameter_list  goto 75


state 276
	abstract_declarator : pointer .  (169)
	abstract_declarator : pointer . direct_abstract_declarator

	'('  shift 275
	'['  shift 161
	.  reduce 169

	direct_abstract_declarator  goto 261


state 277
	type_name : specifier_qualifier_list abstract_declarator .  (168)

	.  reduce 168


state 278
	cast_exp : '(' type_name ')' . cast_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	postfix_exp  goto 117
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 328
	postfix_pre_exp  goto 147


state 279
	labeled_statement : ID ':' statement .  (194)

	.  reduce 194


state 280
	unary_exp : SIZEOF '(' type_name . ')'

	')'  shift 329


state 281
	labeled_statement : CASE constant_exp ':' . M statement
	M : .  (59)

	.  reduce 59

	M  goto 330


state 282
	exp : exp . ',' assignment_exp
	open_statement : IF '(' exp . ')' M matched_statement P ELSE M open_statement
	open_statement : IF '(' exp . ')' M stmt P
	matched_statement : IF '(' exp . ')' M matched_statement P ELSE M matched_statement

	')'  shift 331
	','  shift 236


state 283
	exp : exp . ',' assignment_exp
	switch_pre : SWITCH '(' exp . ')'

	')'  shift 332
	','  shift 236


state 284
	iteration_statement : WHILE M '(' . exp ')' M statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 333
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 285
	iteration_statement : DO M statement . WHILE M '(' exp ')' ';'

	WHILE  shift 334


state 286
	iteration_statement : FOR '(' exp_statement . M exp_statement ')' M statement
	iteration_statement : FOR '(' exp_statement . M exp_statement M exp P ')' M statement
	M : .  (59)

	.  reduce 59

	M  goto 335


state 287
	jump_statement : GOTO ID ';' .  (220)

	.  reduce 220


state 288
	jump_statement : RETURN exp ';' .  (224)

	.  reduce 224


state 289
	multiplicative_exp : multiplicative_exp '%' cast_exp .  (36)

	.  reduce 36


state 290
	multiplicative_exp : multiplicative_exp '*' cast_exp .  (34)

	.  reduce 34


state 291
	multiplicative_exp : multiplicative_exp '/' cast_exp .  (35)

	.  reduce 35


state 292
	multiplicative_exp : multiplicative_exp '^' cast_exp .  (33)

	.  reduce 33


293: shift-reduce conflict (shift 204, reduce 38) on '^'
state 293
	multiplicative_exp : multiplicative_exp . '^' cast_exp
	multiplicative_exp : multiplicative_exp . '%' cast_exp
	additive_exp : additive_exp '+' multiplicative_exp .  (38)
	multiplicative_exp : multiplicative_exp . '*' cast_exp
	multiplicative_exp : multiplicative_exp . '/' cast_exp

	'%'  shift 201
	'*'  shift 202
	'/'  shift 203
	'^'  shift 204
	.  reduce 38


294: shift-reduce conflict (shift 204, reduce 39) on '^'
state 294
	multiplicative_exp : multiplicative_exp . '^' cast_exp
	additive_exp : additive_exp '-' multiplicative_exp .  (39)
	multiplicative_exp : multiplicative_exp . '%' cast_exp
	multiplicative_exp : multiplicative_exp . '*' cast_exp
	multiplicative_exp : multiplicative_exp . '/' cast_exp

	'%'  shift 201
	'*'  shift 202
	'/'  shift 203
	'^'  shift 204
	.  reduce 39


state 295
	additive_exp : additive_exp . '-' multiplicative_exp
	additive_exp : additive_exp . '+' multiplicative_exp
	shift_exp : shift_exp LEFT_OP additive_exp .  (41)

	'+'  shift 205
	'-'  shift 206
	.  reduce 41


state 296
	shift_exp : shift_exp RIGHT_OP additive_exp .  (42)
	additive_exp : additive_exp . '-' multiplicative_exp
	additive_exp : additive_exp . '+' multiplicative_exp

	'+'  shift 205
	'-'  shift 206
	.  reduce 42


state 297
	postfix_exp : postfix_exp '.' ID .  (12)

	.  reduce 12


state 298
	postfix_exp : postfix_exp '[' exp . ']'
	exp : exp . ',' assignment_exp

	','  shift 236
	']'  shift 336


state 299
	postfix_exp : postfix_exp PTR_OP ID .  (13)

	.  reduce 13


state 300
	shift_exp : shift_exp . RIGHT_OP additive_exp
	shift_exp : shift_exp . LEFT_OP additive_exp
	relational_exp : relational_exp '<' shift_exp .  (44)

	LEFT_OP  shift 207
	RIGHT_OP  shift 208
	.  reduce 44


state 301
	shift_exp : shift_exp . RIGHT_OP additive_exp
	shift_exp : shift_exp . LEFT_OP additive_exp
	relational_exp : relational_exp '>' shift_exp .  (45)

	LEFT_OP  shift 207
	RIGHT_OP  shift 208
	.  reduce 45


state 302
	shift_exp : shift_exp . RIGHT_OP additive_exp
	relational_exp : relational_exp LE_OP shift_exp .  (46)
	shift_exp : shift_exp . LEFT_OP additive_exp

	LEFT_OP  shift 207
	RIGHT_OP  shift 208
	.  reduce 46


state 303
	shift_exp : shift_exp . RIGHT_OP additive_exp
	shift_exp : shift_exp . LEFT_OP additive_exp
	relational_exp : relational_exp GE_OP shift_exp .  (47)

	LEFT_OP  shift 207
	RIGHT_OP  shift 208
	.  reduce 47


state 304
	equality_exp : equality_exp EQ_OP relational_exp .  (49)
	relational_exp : relational_exp . LE_OP shift_exp
	relational_exp : relational_exp . '<' shift_exp
	relational_exp : relational_exp . GE_OP shift_exp
	relational_exp : relational_exp . '>' shift_exp

	'<'  shift 215
	'>'  shift 216
	LE_OP  shift 217
	GE_OP  shift 218
	.  reduce 49


state 305
	relational_exp : relational_exp . LE_OP shift_exp
	relational_exp : relational_exp . '<' shift_exp
	equality_exp : equality_exp NE_OP relational_exp .  (50)
	relational_exp : relational_exp . GE_OP shift_exp
	relational_exp : relational_exp . '>' shift_exp

	'<'  shift 215
	'>'  shift 216
	LE_OP  shift 217
	GE_OP  shift 218
	.  reduce 50


state 306
	equality_exp : equality_exp . EQ_OP relational_exp
	and_exp : and_exp '&' equality_exp .  (52)
	equality_exp : equality_exp . NE_OP relational_exp

	EQ_OP  shift 219
	NE_OP  shift 220
	.  reduce 52


state 307
	assignment_exp : unary_exp assignment_operator assignment_exp .  (67)

	.  reduce 67


state 308
	exp : exp ',' assignment_exp .  (80)

	.  reduce 80


state 309
	logical_and_exp : logical_and_exp AND_OP M . inclusive_or_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	exclusive_or_exp  goto 129
	inclusive_or_exp  goto 337
	postfix_pre_exp  goto 147


state 310
	and_exp : and_exp . '&' equality_exp
	exclusive_or_exp : exclusive_or_exp '^' and_exp .  (54)

	'&'  shift 221
	.  reduce 54


state 311
	conditional_exp : logical_or_exp '?' exp . ':' conditional_exp
	exp : exp . ',' assignment_exp

	','  shift 236
	':'  shift 338


state 312
	logical_or_exp : logical_or_exp OR_OP M . logical_and_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	logical_and_exp  goto 339
	exclusive_or_exp  goto 129
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 313
	exclusive_or_exp : exclusive_or_exp . '^' and_exp
	inclusive_or_exp : inclusive_or_exp '|' exclusive_or_exp .  (56)

	'^'  shift 239
	.  reduce 56


state 314
	statement_list : statement_list M statement .  (204)

	.  reduce 204


state 315
	compound_statement : '{' declaration_list statement_list '}' .  (200)

	.  reduce 200


state 316
	postfix_exp : postfix_pre_exp argument_exp_list ')' .  (11)

	.  reduce 11


state 317
	argument_exp_list : argument_exp_list ',' . assignment_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 340
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 318
	struct_or_union_def : struct_or_union ID '{' declaration_list '}' .  (112)

	.  reduce 112


state 319
	direct_abstract_declarator : '(' abstract_declarator ')' .  (172)

	.  reduce 172


state 320
	direct_abstract_declarator : '(' parameter_type_list ')' .  (178)

	.  reduce 178


state 321
	direct_abstract_declarator : '[' constant_exp ']' .  (174)

	.  reduce 174


state 322
	direct_abstract_declarator : direct_abstract_declarator '(' ')' .  (179)

	.  reduce 179


state 323
	direct_abstract_declarator : direct_abstract_declarator '(' parameter_type_list . ')'

	')'  shift 341


state 324
	direct_abstract_declarator : direct_abstract_declarator '[' ']' .  (175)

	.  reduce 175


state 325
	direct_abstract_declarator : direct_abstract_declarator '[' constant_exp . ']'

	']'  shift 342


state 326
	initializer : '{' initializer_list ',' . '}'
	initializer_list : initializer_list ',' . initializer

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'{'  shift 174
	'}'  shift 343
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	logical_and_exp  goto 127
	assignment_exp  goto 175
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	initializer  goto 344
	postfix_pre_exp  goto 147


state 327
	initializer : '{' initializer_list '}' .  (182)

	.  reduce 182


state 328
	cast_exp : '(' type_name ')' cast_exp .  (31)

	.  reduce 31


state 329
	unary_exp : SIZEOF '(' type_name ')' .  (23)

	.  reduce 23


state 330
	labeled_statement : CASE constant_exp ':' M . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 345
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 331
	open_statement : IF '(' exp ')' . M matched_statement P ELSE M open_statement
	open_statement : IF '(' exp ')' . M stmt P
	matched_statement : IF '(' exp ')' . M matched_statement P ELSE M matched_statement
	M : .  (59)

	.  reduce 59

	M  goto 346


state 332
	switch_pre : SWITCH '(' exp ')' .  (215)

	.  reduce 215


state 333
	exp : exp . ',' assignment_exp
	iteration_statement : WHILE M '(' exp . ')' M statement

	')'  shift 347
	','  shift 236


state 334
	iteration_statement : DO M statement WHILE . M '(' exp ')' ';'
	M : .  (59)

	.  reduce 59

	M  goto 348


state 335
	iteration_statement : FOR '(' exp_statement M . exp_statement ')' M statement
	iteration_statement : FOR '(' exp_statement M . exp_statement M exp P ')' M statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	exp_statement  goto 349
	postfix_pre_exp  goto 147


state 336
	postfix_exp : postfix_exp '[' exp ']' .  (9)

	.  reduce 9


state 337
	inclusive_or_exp : inclusive_or_exp . '|' exclusive_or_exp
	logical_and_exp : logical_and_exp AND_OP M inclusive_or_exp .  (58)

	'|'  shift 242
	.  reduce 58


state 338
	conditional_exp : logical_or_exp '?' exp ':' . conditional_exp

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 155
	cast_exp  goto 125
	logical_and_exp  goto 127
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 350
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 339
	logical_or_exp : logical_or_exp OR_OP M logical_and_exp .  (63)
	logical_and_exp : logical_and_exp . AND_OP M inclusive_or_exp

	AND_OP  shift 238
	.  reduce 63


state 340
	argument_exp_list : argument_exp_list ',' assignment_exp .  (17)

	.  reduce 17


state 341
	direct_abstract_declarator : direct_abstract_declarator '(' parameter_type_list ')' .  (180)

	.  reduce 180


state 342
	direct_abstract_declarator : direct_abstract_declarator '[' constant_exp ']' .  (176)

	.  reduce 176


state 343
	initializer : '{' initializer_list ',' '}' .  (183)

	.  reduce 183


state 344
	initializer_list : initializer_list ',' initializer .  (185)

	.  reduce 185


state 345
	labeled_statement : CASE constant_exp ':' M statement .  (195)

	.  reduce 195


state 346
	open_statement : IF '(' exp ')' M . matched_statement P ELSE M open_statement
	open_statement : IF '(' exp ')' M . stmt P
	matched_statement : IF '(' exp ')' M . matched_statement P ELSE M matched_statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	IF  shift 105
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	iteration_statement  goto 136
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 351
	other  goto 352
	open_statement  goto 143
	stmt  goto 353
	postfix_pre_exp  goto 147


state 347
	iteration_statement : WHILE M '(' exp ')' . M statement
	M : .  (59)

	.  reduce 59

	M  goto 354


state 348
	iteration_statement : DO M statement WHILE M . '(' exp ')' ';'

	'('  shift 355


state 349
	iteration_statement : FOR '(' exp_statement M exp_statement . ')' M statement
	iteration_statement : FOR '(' exp_statement M exp_statement . M exp P ')' M statement
	M : .  (59)

	')'  shift 356
	.  reduce 59

	M  goto 357


state 350
	conditional_exp : logical_or_exp '?' exp ':' conditional_exp .  (65)

	.  reduce 65


351: reduce-reduce conflict (reduce 61, reduce 207) on ELSE
state 351
	stmt : matched_statement .  (207)
	open_statement : IF '(' exp ')' M matched_statement . P ELSE M open_statement
	matched_statement : IF '(' exp ')' M matched_statement . P ELSE M matched_statement
	P : .  (61)

	ELSE  reduce 61
	.  reduce 207

	P  goto 358


state 352
	matched_statement : other .  (210)

	.  reduce 210


state 353
	open_statement : IF '(' exp ')' M stmt . P
	P : .  (61)

	.  reduce 61

	P  goto 359


state 354
	iteration_statement : WHILE M '(' exp ')' M . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 360
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 355
	iteration_statement : DO M statement WHILE M '(' . exp ')' ';'

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 361
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 356
	iteration_statement : FOR '(' exp_statement M exp_statement ')' . M statement
	M : .  (59)

	.  reduce 59

	M  goto 362


state 357
	iteration_statement : FOR '(' exp_statement M exp_statement M . exp P ')' M statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 363
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	postfix_pre_exp  goto 147


state 358
	open_statement : IF '(' exp ')' M matched_statement P . ELSE M open_statement
	matched_statement : IF '(' exp ')' M matched_statement P . ELSE M matched_statement

	ELSE  shift 364


state 359
	open_statement : IF '(' exp ')' M stmt P .  (211)

	.  reduce 211


state 360
	iteration_statement : WHILE M '(' exp ')' M statement .  (216)

	.  reduce 216


state 361
	exp : exp . ',' assignment_exp
	iteration_statement : DO M statement WHILE M '(' exp . ')' ';'

	')'  shift 365
	','  shift 236


state 362
	iteration_statement : FOR '(' exp_statement M exp_statement ')' M . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 366
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 363
	exp : exp . ',' assignment_exp
	iteration_statement : FOR '(' exp_statement M exp_statement M exp . P ')' M statement
	P : .  (61)

	','  shift 236
	.  reduce 61

	P  goto 367


state 364
	open_statement : IF '(' exp ')' M matched_statement P ELSE . M open_statement
	matched_statement : IF '(' exp ')' M matched_statement P ELSE . M matched_statement
	M : .  (59)

	.  reduce 59

	M  goto 368


state 365
	iteration_statement : DO M statement WHILE M '(' exp ')' . ';'

	';'  shift 369


state 366
	iteration_statement : FOR '(' exp_statement M exp_statement ')' M statement .  (218)

	.  reduce 218


state 367
	iteration_statement : FOR '(' exp_statement M exp_statement M exp P . ')' M statement

	')'  shift 370


state 368
	open_statement : IF '(' exp ')' M matched_statement P ELSE M . open_statement
	matched_statement : IF '(' exp ')' M matched_statement P ELSE M . matched_statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 154
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	IF  shift 105
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	iteration_statement  goto 136
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 371
	other  goto 352
	open_statement  goto 372
	postfix_pre_exp  goto 147


state 369
	iteration_statement : DO M statement WHILE M '(' exp ')' ';' .  (217)

	.  reduce 217


state 370
	iteration_statement : FOR '(' exp_statement M exp_statement M exp P ')' . M statement
	M : .  (59)

	.  reduce 59

	M  goto 373


state 371
	matched_statement : IF '(' exp ')' M matched_statement P ELSE M matched_statement .  (209)

	.  reduce 209


state 372
	open_statement : IF '(' exp ')' M matched_statement P ELSE M open_statement .  (212)

	.  reduce 212


state 373
	iteration_statement : FOR '(' exp_statement M exp_statement M exp P ')' M . statement

	'!'  shift 86
	'&'  shift 87
	'('  shift 88
	'*'  shift 89
	'+'  shift 90
	'-'  shift 91
	';'  shift 92
	'{'  shift 54
	'~'  shift 94
	ID  shift 95
	CONSTANT  shift 96
	STRING_LITERAL  shift 97
	SIZEOF  shift 98
	INC_OP  shift 99
	DEC_OP  shift 100
	TRUE  shift 101
	FALSE  shift 102
	CASE  shift 103
	DEFAULT  shift 104
	IF  shift 105
	SWITCH  shift 106
	WHILE  shift 107
	DO  shift 108
	FOR  shift 109
	GOTO  shift 110
	CONTINUE  shift 111
	BREAK  shift 112
	RETURN  shift 113

	multiplicative_exp  goto 114
	additive_exp  goto 115
	shift_exp  goto 116
	postfix_exp  goto 117
	relational_exp  goto 118
	equality_exp  goto 119
	and_exp  goto 120
	default_pre  goto 121
	primary_exp  goto 122
	unary_operator  goto 123
	unary_exp  goto 124
	cast_exp  goto 125
	exp  goto 126
	logical_and_exp  goto 127
	assignment_exp  goto 128
	exclusive_or_exp  goto 129
	logical_or_exp  goto 130
	conditional_exp  goto 131
	inclusive_or_exp  goto 132
	compound_statement  goto 133
	statement  goto 374
	iteration_statement  goto 136
	labeled_statement  goto 137
	exp_statement  goto 139
	jump_statement  goto 140
	matched_statement  goto 141
	other  goto 142
	open_statement  goto 143
	selection_statement  goto 144
	switch_pre  goto 145
	stmt  goto 146
	postfix_pre_exp  goto 147


state 374
	iteration_statement : FOR '(' exp_statement M exp_statement M exp P ')' M statement .  (219)

	.  reduce 219


Rules never reduced
	N :  (60)
	struct_declaration_list : struct_declaration  (120)
	struct_declaration_list : struct_declaration_list struct_declaration  (121)
	struct_declaration : specifier_qualifier_list struct_declarator_list ';'  (122)
	struct_declaration : assignment_exp struct_declarator_list ';'  (123)
	struct_declarator_list : struct_declarator  (128)
	struct_declarator_list : struct_declarator_list ',' struct_declarator  (129)
	struct_declarator : declarator  (130)
	struct_declarator : ':' constant_exp  (131)
	struct_declarator : declarator ':' constant_exp  (132)


##############################################################################
# Summary
##############################################################################

State 2 contains 3 shift-reduce conflict(s)
State 25 contains 1 shift-reduce conflict(s)
State 43 contains 3 shift-reduce conflict(s)
State 114 contains 1 shift-reduce conflict(s)
State 142 contains 30 reduce-reduce conflict(s)
State 178 contains 1 shift-reduce conflict(s)
State 293 contains 1 shift-reduce conflict(s)
State 294 contains 1 shift-reduce conflict(s)
State 351 contains 1 reduce-reduce conflict(s)


86 token(s), 77 nonterminal(s)
233 grammar rule(s), 375 state(s)


##############################################################################
# End of File
##############################################################################
