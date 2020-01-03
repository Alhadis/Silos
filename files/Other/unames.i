# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
# 17 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 1
# 36 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h" 1
# 61 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h"
# 1 "c:/marmalade/5.2/s3e/h/std/sys/types.h" 1
# 15 "c:/marmalade/5.2/s3e/h/std/sys/types.h"
# 1 "c:/marmalade/5.2/s3e/h/s3eTypes.h" 1
# 37 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
typedef unsigned char s3e_uint8_t;
typedef signed char s3e_int8_t;
typedef unsigned short int s3e_uint16_t;
typedef signed short int s3e_int16_t;
typedef unsigned int s3e_uint32_t;
typedef signed int s3e_int32_t;
# 51 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
  typedef signed long long s3e_int64_t;
  typedef unsigned long long s3e_uint64_t;
# 74 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
typedef s3e_uint64_t uint64_t;
typedef s3e_int64_t int64_t;
typedef s3e_uint32_t uint32_t;
typedef s3e_int32_t int32_t;
typedef s3e_uint16_t uint16_t;
typedef s3e_int16_t int16_t;
typedef s3e_uint8_t uint8_t;
typedef s3e_int8_t int8_t;
# 96 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
    typedef int intptr_t;
    typedef unsigned int uintptr_t;
# 108 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
typedef unsigned int uint;
typedef unsigned short int ushort;
typedef unsigned long int ulong;
typedef unsigned char uint8;
typedef signed char int8;







typedef int64_t int64;
typedef uint64_t uint64;





typedef unsigned int uint32;






typedef signed int int32;






typedef uint16_t uint16;




typedef int16_t int16;
# 226 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
typedef enum s3eResult
{
    S3E_RESULT_SUCCESS = 0,
    S3E_RESULT_ERROR = 1
} s3eResult;




typedef uint8 s3eBool;
# 246 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
typedef unsigned short s3eWChar;
# 256 "c:/marmalade/5.2/s3e/h/s3eTypes.h"
typedef int32 (*s3eCallback) (void* systemData, void* userData);
# 16 "c:/marmalade/5.2/s3e/h/std/sys/types.h" 2
# 1 "c:/marmalade/5.2/s3e/h/std/stddef.h" 1
# 16 "c:/marmalade/5.2/s3e/h/std/stddef.h"
typedef signed int ptrdiff_t;


    typedef unsigned int wint_t;
    typedef unsigned long int wctype_t;



    typedef unsigned short wchar_t;



typedef unsigned int size_t;
# 17 "c:/marmalade/5.2/s3e/h/std/sys/types.h" 2
# 1 "c:/marmalade/5.2/s3e/h/std/stdint.h" 1
# 19 "c:/marmalade/5.2/s3e/h/std/stdint.h"
typedef signed char int_least8_t;
typedef short int_least16_t;
typedef long int_least32_t;
typedef int64_t int_least64_t;

typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned long uint_least32_t;
typedef uint64_t uint_least64_t;

typedef signed char int_fast8_t;
typedef short int_fast16_t;
typedef long int_fast32_t;
typedef int64_t int_fast64_t;

typedef unsigned char uint_fast8_t;
typedef unsigned short uint_fast16_t;
typedef unsigned long uint_fast32_t;
typedef uint64_t uint_fast64_t;

typedef int64_t intmax_t;
typedef uint64_t uintmax_t;
# 18 "c:/marmalade/5.2/s3e/h/std/sys/types.h" 2
# 1 "c:/marmalade/5.2/s3e/h/std/sys/select.h" 1
# 24 "c:/marmalade/5.2/s3e/h/std/sys/select.h"
struct timeval;

typedef struct fd_set
{
    char fds_bits[256/8];
} fd_set;
# 39 "c:/marmalade/5.2/s3e/h/std/sys/select.h"


int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);


# 19 "c:/marmalade/5.2/s3e/h/std/sys/types.h" 2



typedef long off_t;

typedef int64_t off64_t;
# 33 "c:/marmalade/5.2/s3e/h/std/sys/types.h"
typedef uint u_int;
typedef uint8_t u_int8_t;
typedef uint16_t u_int16_t;
typedef uint32_t u_int32_t;
typedef uint64_t u_int64_t;

typedef unsigned short u_short;
typedef unsigned long u_long;
typedef unsigned char u_char;

typedef int ssize_t;
typedef int pid_t;
typedef short uid_t;
typedef short gid_t;
typedef int idtype_t;
typedef int id_t;
typedef uint32 mode_t;
typedef short dev_t;
typedef short ino_t;
typedef int key_t;
typedef void* caddr_t;
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h" 2

# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/platform.h" 1
# 26 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h" 2
# 51 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h"
# 1 "c:/marmalade/5.2/s3e/h/std/inttypes.h" 1
# 17 "c:/marmalade/5.2/s3e/h/std/inttypes.h"
typedef struct
{
    long int quot;
    long int rem;
} imaxdiv_t;




imaxdiv_t imaxdiv(intmax_t numerator, intmax_t denominator);


# 52 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h" 2
# 62 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h" 2
# 231 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h"
typedef int8_t UBool;
# 322 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h"
    typedef wchar_t UChar;
# 349 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h"
typedef int32_t UChar32;
# 386 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/urename.h" 1
# 35 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/urename.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h" 1
# 36 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/urename.h" 2




# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uvernum.h" 1
# 41 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/urename.h" 2
# 387 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h" 2
# 37 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h" 1
# 111 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 1
# 112 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h" 2
# 230 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf8.h" 1
# 58 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf8.h"
extern const uint8_t



utf8_countTrailBytes_48[256];
# 91 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf8.h"
extern UChar32
utf8_nextCharSafeBody_48(const uint8_t *s, int32_t *pi, int32_t length, UChar32 c, UBool strict);
# 103 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf8.h"
extern int32_t
utf8_appendCharSafeBody_48(uint8_t *s, int32_t i, int32_t length, UChar32 c, UBool *pIsError);
# 115 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf8.h"
extern UChar32
utf8_prevCharSafeBody_48(const uint8_t *s, int32_t start, int32_t *pi, UChar32 c, UBool strict);
# 127 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf8.h"
extern int32_t
utf8_back1SafeBody_48(const uint8_t *s, int32_t start, int32_t i);
# 231 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf16.h" 1
# 232 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h" 2


# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf_old.h" 1
# 235 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utf.h" 2
# 38 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uversion.h" 1
# 57 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uversion.h"
typedef uint8_t UVersionInfo[4];
# 152 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uversion.h"
extern void
u_versionFromString_48(UVersionInfo versionArray, const char *versionString);
# 166 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uversion.h"
extern void
u_versionFromUString_48(UVersionInfo versionArray, const UChar *versionString);
# 182 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uversion.h"
extern void
u_versionToString_48(UVersionInfo versionArray, char *versionString);
# 193 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uversion.h"
extern void
u_getVersion_48(UVersionInfo versionArray);
# 39 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uconfig.h" 1
# 40 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 2
# 1 "c:/marmalade/5.2/s3e/h/std/float.h" 1
# 31 "c:/marmalade/5.2/s3e/h/std/float.h"
 
# 111 "c:/marmalade/5.2/s3e/h/std/float.h"
unsigned _controlfp(unsigned, unsigned);
unsigned _clearfp(void);
unsigned _statusfp(void);
# 150 "c:/marmalade/5.2/s3e/h/std/float.h"
   
# 41 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 2
# 314 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h"
typedef double UDate;
# 385 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h"
typedef void* UClassID;
# 639 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h"
typedef enum UErrorCode {





    U_USING_FALLBACK_WARNING = -128,

    U_ERROR_WARNING_START = -128,

    U_USING_DEFAULT_WARNING = -127,

    U_SAFECLONE_ALLOCATED_WARNING = -126,

    U_STATE_OLD_WARNING = -125,

    U_STRING_NOT_TERMINATED_WARNING = -124,

    U_SORT_KEY_TOO_SHORT_WARNING = -123,

    U_AMBIGUOUS_ALIAS_WARNING = -122,

    U_DIFFERENT_UCA_VERSION = -121,

    U_PLUGIN_CHANGED_LEVEL_WARNING = -120,

    U_ERROR_WARNING_LIMIT,


    U_ZERO_ERROR = 0,

    U_ILLEGAL_ARGUMENT_ERROR = 1,
    U_MISSING_RESOURCE_ERROR = 2,
    U_INVALID_FORMAT_ERROR = 3,
    U_FILE_ACCESS_ERROR = 4,
    U_INTERNAL_PROGRAM_ERROR = 5,
    U_MESSAGE_PARSE_ERROR = 6,
    U_MEMORY_ALLOCATION_ERROR = 7,
    U_INDEX_OUTOFBOUNDS_ERROR = 8,
    U_PARSE_ERROR = 9,
    U_INVALID_CHAR_FOUND = 10,
    U_TRUNCATED_CHAR_FOUND = 11,
    U_ILLEGAL_CHAR_FOUND = 12,
    U_INVALID_TABLE_FORMAT = 13,
    U_INVALID_TABLE_FILE = 14,
    U_BUFFER_OVERFLOW_ERROR = 15,
    U_UNSUPPORTED_ERROR = 16,
    U_RESOURCE_TYPE_MISMATCH = 17,
    U_ILLEGAL_ESCAPE_SEQUENCE = 18,
    U_UNSUPPORTED_ESCAPE_SEQUENCE = 19,
    U_NO_SPACE_AVAILABLE = 20,
    U_CE_NOT_FOUND_ERROR = 21,
    U_PRIMARY_TOO_LONG_ERROR = 22,
    U_STATE_TOO_OLD_ERROR = 23,
    U_TOO_MANY_ALIASES_ERROR = 24,

    U_ENUM_OUT_OF_SYNC_ERROR = 25,
    U_INVARIANT_CONVERSION_ERROR = 26,
    U_INVALID_STATE_ERROR = 27,
    U_COLLATOR_VERSION_MISMATCH = 28,
    U_USELESS_COLLATOR_ERROR = 29,
    U_NO_WRITE_PERMISSION = 30,

    U_STANDARD_ERROR_LIMIT,



    U_BAD_VARIABLE_DEFINITION=0x10000,
    U_PARSE_ERROR_START = 0x10000,
    U_MALFORMED_RULE,
    U_MALFORMED_SET,
    U_MALFORMED_SYMBOL_REFERENCE,
    U_MALFORMED_UNICODE_ESCAPE,
    U_MALFORMED_VARIABLE_DEFINITION,
    U_MALFORMED_VARIABLE_REFERENCE,
    U_MISMATCHED_SEGMENT_DELIMITERS,
    U_MISPLACED_ANCHOR_START,
    U_MISPLACED_CURSOR_OFFSET,
    U_MISPLACED_QUANTIFIER,
    U_MISSING_OPERATOR,
    U_MISSING_SEGMENT_CLOSE,
    U_MULTIPLE_ANTE_CONTEXTS,
    U_MULTIPLE_CURSORS,
    U_MULTIPLE_POST_CONTEXTS,
    U_TRAILING_BACKSLASH,
    U_UNDEFINED_SEGMENT_REFERENCE,
    U_UNDEFINED_VARIABLE,
    U_UNQUOTED_SPECIAL,
    U_UNTERMINATED_QUOTE,
    U_RULE_MASK_ERROR,
    U_MISPLACED_COMPOUND_FILTER,
    U_MULTIPLE_COMPOUND_FILTERS,
    U_INVALID_RBT_SYNTAX,
    U_INVALID_PROPERTY_PATTERN,
    U_MALFORMED_PRAGMA,
    U_UNCLOSED_SEGMENT,
    U_ILLEGAL_CHAR_IN_SEGMENT,
    U_VARIABLE_RANGE_EXHAUSTED,
    U_VARIABLE_RANGE_OVERLAP,
    U_ILLEGAL_CHARACTER,
    U_INTERNAL_TRANSLITERATOR_ERROR,
    U_INVALID_ID,
    U_INVALID_FUNCTION,
    U_PARSE_ERROR_LIMIT,




    U_UNEXPECTED_TOKEN=0x10100,
    U_FMT_PARSE_ERROR_START=0x10100,
    U_MULTIPLE_DECIMAL_SEPARATORS,
    U_MULTIPLE_DECIMAL_SEPERATORS = U_MULTIPLE_DECIMAL_SEPARATORS,
    U_MULTIPLE_EXPONENTIAL_SYMBOLS,
    U_MALFORMED_EXPONENTIAL_PATTERN,
    U_MULTIPLE_PERCENT_SYMBOLS,
    U_MULTIPLE_PERMILL_SYMBOLS,
    U_MULTIPLE_PAD_SPECIFIERS,
    U_PATTERN_SYNTAX_ERROR,
    U_ILLEGAL_PAD_POSITION,
    U_UNMATCHED_BRACES,
    U_UNSUPPORTED_PROPERTY,
    U_UNSUPPORTED_ATTRIBUTE,
    U_ARGUMENT_TYPE_MISMATCH,
    U_DUPLICATE_KEYWORD,
    U_UNDEFINED_KEYWORD,
    U_DEFAULT_KEYWORD_MISSING,
    U_DECIMAL_NUMBER_SYNTAX_ERROR,
    U_FORMAT_INEXACT_ERROR,
    U_FMT_PARSE_ERROR_LIMIT,




    U_BRK_INTERNAL_ERROR=0x10200,
    U_BRK_ERROR_START=0x10200,
    U_BRK_HEX_DIGITS_EXPECTED,
    U_BRK_SEMICOLON_EXPECTED,
    U_BRK_RULE_SYNTAX,
    U_BRK_UNCLOSED_SET,
    U_BRK_ASSIGN_ERROR,
    U_BRK_VARIABLE_REDFINITION,
    U_BRK_MISMATCHED_PAREN,
    U_BRK_NEW_LINE_IN_QUOTED_STRING,
    U_BRK_UNDEFINED_VARIABLE,
    U_BRK_INIT_ERROR,
    U_BRK_RULE_EMPTY_SET,
    U_BRK_UNRECOGNIZED_OPTION,
    U_BRK_MALFORMED_RULE_TAG,
    U_BRK_ERROR_LIMIT,




    U_REGEX_INTERNAL_ERROR=0x10300,
    U_REGEX_ERROR_START=0x10300,
    U_REGEX_RULE_SYNTAX,
    U_REGEX_INVALID_STATE,
    U_REGEX_BAD_ESCAPE_SEQUENCE,
    U_REGEX_PROPERTY_SYNTAX,
    U_REGEX_UNIMPLEMENTED,
    U_REGEX_MISMATCHED_PAREN,
    U_REGEX_NUMBER_TOO_BIG,
    U_REGEX_BAD_INTERVAL,
    U_REGEX_MAX_LT_MIN,
    U_REGEX_INVALID_BACK_REF,
    U_REGEX_INVALID_FLAG,
    U_REGEX_LOOK_BEHIND_LIMIT,
    U_REGEX_SET_CONTAINS_STRING,
    U_REGEX_OCTAL_TOO_BIG,
    U_REGEX_MISSING_CLOSE_BRACKET,
    U_REGEX_INVALID_RANGE,
    U_REGEX_STACK_OVERFLOW,
    U_REGEX_TIME_OUT,
    U_REGEX_STOPPED_BY_CALLER,
    U_REGEX_ERROR_LIMIT,




    U_IDNA_PROHIBITED_ERROR=0x10400,
    U_IDNA_ERROR_START=0x10400,
    U_IDNA_UNASSIGNED_ERROR,
    U_IDNA_CHECK_BIDI_ERROR,
    U_IDNA_STD3_ASCII_RULES_ERROR,
    U_IDNA_ACE_PREFIX_ERROR,
    U_IDNA_VERIFICATION_ERROR,
    U_IDNA_LABEL_TOO_LONG_ERROR,
    U_IDNA_ZERO_LENGTH_LABEL_ERROR,
    U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR,
    U_IDNA_ERROR_LIMIT,



    U_STRINGPREP_PROHIBITED_ERROR = U_IDNA_PROHIBITED_ERROR,
    U_STRINGPREP_UNASSIGNED_ERROR = U_IDNA_UNASSIGNED_ERROR,
    U_STRINGPREP_CHECK_BIDI_ERROR = U_IDNA_CHECK_BIDI_ERROR,




    U_PLUGIN_ERROR_START=0x10500,
    U_PLUGIN_TOO_HIGH=0x10500,
    U_PLUGIN_DIDNT_SET_LEVEL,
    U_PLUGIN_ERROR_LIMIT,

    U_ERROR_LIMIT=U_PLUGIN_ERROR_LIMIT
} UErrorCode;
# 882 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h"
extern const char *
u_errorName_48(UErrorCode code);
# 18 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h" 1
# 73 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h"
extern const char* u_getDataDirectory_48(void);
# 94 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h"
extern void u_setDataDirectory_48(const char *directory);
# 105 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h"
extern const char* uprv_getDefaultCodepage_48(void);
# 117 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h"
extern const char* uprv_getDefaultLocaleID_48(void);
# 168 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h"
extern void
u_charsToUChars_48(const char *cs, UChar *us, int32_t length);
# 190 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h"
extern void
u_UCharsToChars_48(const UChar *us, char *cs, int32_t length);
# 19 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h" 1
# 28 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"

# 174 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef enum UProperty {
# 186 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
    UCHAR_ALPHABETIC=0,

    UCHAR_BINARY_START=UCHAR_ALPHABETIC,

    UCHAR_ASCII_HEX_DIGIT=1,



    UCHAR_BIDI_CONTROL=2,




    UCHAR_BIDI_MIRRORED=3,

    UCHAR_DASH=4,



    UCHAR_DEFAULT_IGNORABLE_CODE_POINT=5,


    UCHAR_DEPRECATED=6,


    UCHAR_DIACRITIC=7,



    UCHAR_EXTENDER=8,



    UCHAR_FULL_COMPOSITION_EXCLUSION=9,



    UCHAR_GRAPHEME_BASE=10,



    UCHAR_GRAPHEME_EXTEND=11,


    UCHAR_GRAPHEME_LINK=12,


    UCHAR_HEX_DIGIT=13,


    UCHAR_HYPHEN=14,




    UCHAR_ID_CONTINUE=15,



    UCHAR_ID_START=16,


    UCHAR_IDEOGRAPHIC=17,



    UCHAR_IDS_BINARY_OPERATOR=18,



    UCHAR_IDS_TRINARY_OPERATOR=19,


    UCHAR_JOIN_CONTROL=20,



    UCHAR_LOGICAL_ORDER_EXCEPTION=21,


    UCHAR_LOWERCASE=22,

    UCHAR_MATH=23,



    UCHAR_NONCHARACTER_CODE_POINT=24,

    UCHAR_QUOTATION_MARK=25,



    UCHAR_RADICAL=26,




    UCHAR_SOFT_DOTTED=27,



    UCHAR_TERMINAL_PUNCTUATION=28,



    UCHAR_UNIFIED_IDEOGRAPH=29,


    UCHAR_UPPERCASE=30,



    UCHAR_WHITE_SPACE=31,



    UCHAR_XID_CONTINUE=32,


    UCHAR_XID_START=33,



   UCHAR_CASE_SENSITIVE=34,




    UCHAR_S_TERM=35,





    UCHAR_VARIATION_SELECTOR=36,






    UCHAR_NFD_INERT=37,






    UCHAR_NFKD_INERT=38,






    UCHAR_NFC_INERT=39,






    UCHAR_NFKC_INERT=40,
# 359 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
    UCHAR_SEGMENT_STARTER=41,




    UCHAR_PATTERN_SYNTAX=42,




    UCHAR_PATTERN_WHITE_SPACE=43,




    UCHAR_POSIX_ALNUM=44,




    UCHAR_POSIX_BLANK=45,




    UCHAR_POSIX_GRAPH=46,




    UCHAR_POSIX_PRINT=47,




    UCHAR_POSIX_XDIGIT=48,

    UCHAR_CASED=49,

    UCHAR_CASE_IGNORABLE=50,

    UCHAR_CHANGES_WHEN_LOWERCASED=51,

    UCHAR_CHANGES_WHEN_UPPERCASED=52,

    UCHAR_CHANGES_WHEN_TITLECASED=53,

    UCHAR_CHANGES_WHEN_CASEFOLDED=54,

    UCHAR_CHANGES_WHEN_CASEMAPPED=55,

    UCHAR_CHANGES_WHEN_NFKC_CASEFOLDED=56,

    UCHAR_BINARY_LIMIT=57,



    UCHAR_BIDI_CLASS=0x1000,

    UCHAR_INT_START=UCHAR_BIDI_CLASS,


    UCHAR_BLOCK=0x1001,


    UCHAR_CANONICAL_COMBINING_CLASS=0x1002,


    UCHAR_DECOMPOSITION_TYPE=0x1003,



    UCHAR_EAST_ASIAN_WIDTH=0x1004,


    UCHAR_GENERAL_CATEGORY=0x1005,


    UCHAR_JOINING_GROUP=0x1006,


    UCHAR_JOINING_TYPE=0x1007,


    UCHAR_LINE_BREAK=0x1008,


    UCHAR_NUMERIC_TYPE=0x1009,


    UCHAR_SCRIPT=0x100A,


    UCHAR_HANGUL_SYLLABLE_TYPE=0x100B,


    UCHAR_NFD_QUICK_CHECK=0x100C,


    UCHAR_NFKD_QUICK_CHECK=0x100D,


    UCHAR_NFC_QUICK_CHECK=0x100E,


    UCHAR_NFKC_QUICK_CHECK=0x100F,






    UCHAR_LEAD_CANONICAL_COMBINING_CLASS=0x1010,






    UCHAR_TRAIL_CANONICAL_COMBINING_CLASS=0x1011,




    UCHAR_GRAPHEME_CLUSTER_BREAK=0x1012,




    UCHAR_SENTENCE_BREAK=0x1013,




    UCHAR_WORD_BREAK=0x1014,

    UCHAR_INT_LIMIT=0x1015,
# 505 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
    UCHAR_GENERAL_CATEGORY_MASK=0x2000,

    UCHAR_MASK_START=UCHAR_GENERAL_CATEGORY_MASK,

    UCHAR_MASK_LIMIT=0x2001,



    UCHAR_NUMERIC_VALUE=0x3000,

    UCHAR_DOUBLE_START=UCHAR_NUMERIC_VALUE,

    UCHAR_DOUBLE_LIMIT=0x3001,



    UCHAR_AGE=0x4000,

    UCHAR_STRING_START=UCHAR_AGE,


    UCHAR_BIDI_MIRRORING_GLYPH=0x4001,


    UCHAR_CASE_FOLDING=0x4002,


    UCHAR_ISO_COMMENT=0x4003,


    UCHAR_LOWERCASE_MAPPING=0x4004,


    UCHAR_NAME=0x4005,


    UCHAR_SIMPLE_CASE_FOLDING=0x4006,


    UCHAR_SIMPLE_LOWERCASE_MAPPING=0x4007,


    UCHAR_SIMPLE_TITLECASE_MAPPING=0x4008,


    UCHAR_SIMPLE_UPPERCASE_MAPPING=0x4009,


    UCHAR_TITLECASE_MAPPING=0x400A,


    UCHAR_UNICODE_1_NAME=0x400B,


    UCHAR_UPPERCASE_MAPPING=0x400C,

    UCHAR_STRING_LIMIT=0x400D,
# 570 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
    UCHAR_SCRIPT_EXTENSIONS=0x7000,

    UCHAR_OTHER_PROPERTY_START=UCHAR_SCRIPT_EXTENSIONS,


    UCHAR_OTHER_PROPERTY_LIMIT=0x7001,


    UCHAR_INVALID_CODE = -1
} UProperty;






typedef enum UCharCategory
{



    U_UNASSIGNED = 0,

    U_GENERAL_OTHER_TYPES = 0,

    U_UPPERCASE_LETTER = 1,

    U_LOWERCASE_LETTER = 2,

    U_TITLECASE_LETTER = 3,

    U_MODIFIER_LETTER = 4,

    U_OTHER_LETTER = 5,

    U_NON_SPACING_MARK = 6,

    U_ENCLOSING_MARK = 7,

    U_COMBINING_SPACING_MARK = 8,

    U_DECIMAL_DIGIT_NUMBER = 9,

    U_LETTER_NUMBER = 10,

    U_OTHER_NUMBER = 11,

    U_SPACE_SEPARATOR = 12,

    U_LINE_SEPARATOR = 13,

    U_PARAGRAPH_SEPARATOR = 14,

    U_CONTROL_CHAR = 15,

    U_FORMAT_CHAR = 16,

    U_PRIVATE_USE_CHAR = 17,

    U_SURROGATE = 18,

    U_DASH_PUNCTUATION = 19,

    U_START_PUNCTUATION = 20,

    U_END_PUNCTUATION = 21,

    U_CONNECTOR_PUNCTUATION = 22,

    U_OTHER_PUNCTUATION = 23,

    U_MATH_SYMBOL = 24,

    U_CURRENCY_SYMBOL = 25,

    U_MODIFIER_SYMBOL = 26,

    U_OTHER_SYMBOL = 27,

    U_INITIAL_PUNCTUATION = 28,

    U_FINAL_PUNCTUATION = 29,

    U_CHAR_CATEGORY_COUNT
} UCharCategory;
# 772 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef enum UCharDirection {



    U_LEFT_TO_RIGHT = 0,

    U_RIGHT_TO_LEFT = 1,

    U_EUROPEAN_NUMBER = 2,

    U_EUROPEAN_NUMBER_SEPARATOR = 3,

    U_EUROPEAN_NUMBER_TERMINATOR = 4,

    U_ARABIC_NUMBER = 5,

    U_COMMON_NUMBER_SEPARATOR = 6,

    U_BLOCK_SEPARATOR = 7,

    U_SEGMENT_SEPARATOR = 8,

    U_WHITE_SPACE_NEUTRAL = 9,

    U_OTHER_NEUTRAL = 10,

    U_LEFT_TO_RIGHT_EMBEDDING = 11,

    U_LEFT_TO_RIGHT_OVERRIDE = 12,

    U_RIGHT_TO_LEFT_ARABIC = 13,

    U_RIGHT_TO_LEFT_EMBEDDING = 14,

    U_RIGHT_TO_LEFT_OVERRIDE = 15,

    U_POP_DIRECTIONAL_FORMAT = 16,

    U_DIR_NON_SPACING_MARK = 17,

    U_BOUNDARY_NEUTRAL = 18,

    U_CHAR_DIRECTION_COUNT
} UCharDirection;





enum UBlockCode {


    UBLOCK_NO_BLOCK = 0,


    UBLOCK_BASIC_LATIN = 1,


    UBLOCK_LATIN_1_SUPPLEMENT=2,


    UBLOCK_LATIN_EXTENDED_A =3,


    UBLOCK_LATIN_EXTENDED_B =4,


    UBLOCK_IPA_EXTENSIONS =5,


    UBLOCK_SPACING_MODIFIER_LETTERS =6,


    UBLOCK_COMBINING_DIACRITICAL_MARKS =7,





    UBLOCK_GREEK =8,


    UBLOCK_CYRILLIC =9,


    UBLOCK_ARMENIAN =10,


    UBLOCK_HEBREW =11,


    UBLOCK_ARABIC =12,


    UBLOCK_SYRIAC =13,


    UBLOCK_THAANA =14,


    UBLOCK_DEVANAGARI =15,


    UBLOCK_BENGALI =16,


    UBLOCK_GURMUKHI =17,


    UBLOCK_GUJARATI =18,


    UBLOCK_ORIYA =19,


    UBLOCK_TAMIL =20,


    UBLOCK_TELUGU =21,


    UBLOCK_KANNADA =22,


    UBLOCK_MALAYALAM =23,


    UBLOCK_SINHALA =24,


    UBLOCK_THAI =25,


    UBLOCK_LAO =26,


    UBLOCK_TIBETAN =27,


    UBLOCK_MYANMAR =28,


    UBLOCK_GEORGIAN =29,


    UBLOCK_HANGUL_JAMO =30,


    UBLOCK_ETHIOPIC =31,


    UBLOCK_CHEROKEE =32,


    UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS =33,


    UBLOCK_OGHAM =34,


    UBLOCK_RUNIC =35,


    UBLOCK_KHMER =36,


    UBLOCK_MONGOLIAN =37,


    UBLOCK_LATIN_EXTENDED_ADDITIONAL =38,


    UBLOCK_GREEK_EXTENDED =39,


    UBLOCK_GENERAL_PUNCTUATION =40,


    UBLOCK_SUPERSCRIPTS_AND_SUBSCRIPTS =41,


    UBLOCK_CURRENCY_SYMBOLS =42,





    UBLOCK_COMBINING_MARKS_FOR_SYMBOLS =43,


    UBLOCK_LETTERLIKE_SYMBOLS =44,


    UBLOCK_NUMBER_FORMS =45,


    UBLOCK_ARROWS =46,


    UBLOCK_MATHEMATICAL_OPERATORS =47,


    UBLOCK_MISCELLANEOUS_TECHNICAL =48,


    UBLOCK_CONTROL_PICTURES =49,


    UBLOCK_OPTICAL_CHARACTER_RECOGNITION =50,


    UBLOCK_ENCLOSED_ALPHANUMERICS =51,


    UBLOCK_BOX_DRAWING =52,


    UBLOCK_BLOCK_ELEMENTS =53,


    UBLOCK_GEOMETRIC_SHAPES =54,


    UBLOCK_MISCELLANEOUS_SYMBOLS =55,


    UBLOCK_DINGBATS =56,


    UBLOCK_BRAILLE_PATTERNS =57,


    UBLOCK_CJK_RADICALS_SUPPLEMENT =58,


    UBLOCK_KANGXI_RADICALS =59,


    UBLOCK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS =60,


    UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION =61,


    UBLOCK_HIRAGANA =62,


    UBLOCK_KATAKANA =63,


    UBLOCK_BOPOMOFO =64,


    UBLOCK_HANGUL_COMPATIBILITY_JAMO =65,


    UBLOCK_KANBUN =66,


    UBLOCK_BOPOMOFO_EXTENDED =67,


    UBLOCK_ENCLOSED_CJK_LETTERS_AND_MONTHS =68,


    UBLOCK_CJK_COMPATIBILITY =69,


    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A =70,


    UBLOCK_CJK_UNIFIED_IDEOGRAPHS =71,


    UBLOCK_YI_SYLLABLES =72,


    UBLOCK_YI_RADICALS =73,


    UBLOCK_HANGUL_SYLLABLES =74,


    UBLOCK_HIGH_SURROGATES =75,


    UBLOCK_HIGH_PRIVATE_USE_SURROGATES =76,


    UBLOCK_LOW_SURROGATES =77,
# 1072 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
    UBLOCK_PRIVATE_USE = 78,
# 1082 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
    UBLOCK_PRIVATE_USE_AREA =UBLOCK_PRIVATE_USE,


    UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS =79,


    UBLOCK_ALPHABETIC_PRESENTATION_FORMS =80,


    UBLOCK_ARABIC_PRESENTATION_FORMS_A =81,


    UBLOCK_COMBINING_HALF_MARKS =82,


    UBLOCK_CJK_COMPATIBILITY_FORMS =83,


    UBLOCK_SMALL_FORM_VARIANTS =84,


    UBLOCK_ARABIC_PRESENTATION_FORMS_B =85,


    UBLOCK_SPECIALS =86,


    UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS =87,




    UBLOCK_OLD_ITALIC = 88 ,

    UBLOCK_GOTHIC = 89 ,

    UBLOCK_DESERET = 90 ,

    UBLOCK_BYZANTINE_MUSICAL_SYMBOLS = 91 ,

    UBLOCK_MUSICAL_SYMBOLS = 92 ,

    UBLOCK_MATHEMATICAL_ALPHANUMERIC_SYMBOLS = 93 ,

    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B = 94 ,

    UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT = 95 ,

    UBLOCK_TAGS = 96,







    UBLOCK_CYRILLIC_SUPPLEMENTARY = 97,

    UBLOCK_CYRILLIC_SUPPLEMENT = UBLOCK_CYRILLIC_SUPPLEMENTARY,

    UBLOCK_TAGALOG = 98,

    UBLOCK_HANUNOO = 99,

    UBLOCK_BUHID = 100,

    UBLOCK_TAGBANWA = 101,

    UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A = 102,

    UBLOCK_SUPPLEMENTAL_ARROWS_A = 103,

    UBLOCK_SUPPLEMENTAL_ARROWS_B = 104,

    UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B = 105,

    UBLOCK_SUPPLEMENTAL_MATHEMATICAL_OPERATORS = 106,

    UBLOCK_KATAKANA_PHONETIC_EXTENSIONS = 107,

    UBLOCK_VARIATION_SELECTORS = 108,

    UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_A = 109,

    UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_B = 110,




    UBLOCK_LIMBU = 111,

    UBLOCK_TAI_LE = 112,

    UBLOCK_KHMER_SYMBOLS = 113,

    UBLOCK_PHONETIC_EXTENSIONS = 114,

    UBLOCK_MISCELLANEOUS_SYMBOLS_AND_ARROWS = 115,

    UBLOCK_YIJING_HEXAGRAM_SYMBOLS = 116,

    UBLOCK_LINEAR_B_SYLLABARY = 117,

    UBLOCK_LINEAR_B_IDEOGRAMS = 118,

    UBLOCK_AEGEAN_NUMBERS = 119,

    UBLOCK_UGARITIC = 120,

    UBLOCK_SHAVIAN = 121,

    UBLOCK_OSMANYA = 122,

    UBLOCK_CYPRIOT_SYLLABARY = 123,

    UBLOCK_TAI_XUAN_JING_SYMBOLS = 124,

    UBLOCK_VARIATION_SELECTORS_SUPPLEMENT = 125,




    UBLOCK_ANCIENT_GREEK_MUSICAL_NOTATION = 126,

    UBLOCK_ANCIENT_GREEK_NUMBERS = 127,

    UBLOCK_ARABIC_SUPPLEMENT = 128,

    UBLOCK_BUGINESE = 129,

    UBLOCK_CJK_STROKES = 130,

    UBLOCK_COMBINING_DIACRITICAL_MARKS_SUPPLEMENT = 131,

    UBLOCK_COPTIC = 132,

    UBLOCK_ETHIOPIC_EXTENDED = 133,

    UBLOCK_ETHIOPIC_SUPPLEMENT = 134,

    UBLOCK_GEORGIAN_SUPPLEMENT = 135,

    UBLOCK_GLAGOLITIC = 136,

    UBLOCK_KHAROSHTHI = 137,

    UBLOCK_MODIFIER_TONE_LETTERS = 138,

    UBLOCK_NEW_TAI_LUE = 139,

    UBLOCK_OLD_PERSIAN = 140,

    UBLOCK_PHONETIC_EXTENSIONS_SUPPLEMENT = 141,

    UBLOCK_SUPPLEMENTAL_PUNCTUATION = 142,

    UBLOCK_SYLOTI_NAGRI = 143,

    UBLOCK_TIFINAGH = 144,

    UBLOCK_VERTICAL_FORMS = 145,




    UBLOCK_NKO = 146,

    UBLOCK_BALINESE = 147,

    UBLOCK_LATIN_EXTENDED_C = 148,

    UBLOCK_LATIN_EXTENDED_D = 149,

    UBLOCK_PHAGS_PA = 150,

    UBLOCK_PHOENICIAN = 151,

    UBLOCK_CUNEIFORM = 152,

    UBLOCK_CUNEIFORM_NUMBERS_AND_PUNCTUATION = 153,

    UBLOCK_COUNTING_ROD_NUMERALS = 154,




    UBLOCK_SUNDANESE = 155,

    UBLOCK_LEPCHA = 156,

    UBLOCK_OL_CHIKI = 157,

    UBLOCK_CYRILLIC_EXTENDED_A = 158,

    UBLOCK_VAI = 159,

    UBLOCK_CYRILLIC_EXTENDED_B = 160,

    UBLOCK_SAURASHTRA = 161,

    UBLOCK_KAYAH_LI = 162,

    UBLOCK_REJANG = 163,

    UBLOCK_CHAM = 164,

    UBLOCK_ANCIENT_SYMBOLS = 165,

    UBLOCK_PHAISTOS_DISC = 166,

    UBLOCK_LYCIAN = 167,

    UBLOCK_CARIAN = 168,

    UBLOCK_LYDIAN = 169,

    UBLOCK_MAHJONG_TILES = 170,

    UBLOCK_DOMINO_TILES = 171,




    UBLOCK_SAMARITAN = 172,

    UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED = 173,

    UBLOCK_TAI_THAM = 174,

    UBLOCK_VEDIC_EXTENSIONS = 175,

    UBLOCK_LISU = 176,

    UBLOCK_BAMUM = 177,

    UBLOCK_COMMON_INDIC_NUMBER_FORMS = 178,

    UBLOCK_DEVANAGARI_EXTENDED = 179,

    UBLOCK_HANGUL_JAMO_EXTENDED_A = 180,

    UBLOCK_JAVANESE = 181,

    UBLOCK_MYANMAR_EXTENDED_A = 182,

    UBLOCK_TAI_VIET = 183,

    UBLOCK_MEETEI_MAYEK = 184,

    UBLOCK_HANGUL_JAMO_EXTENDED_B = 185,

    UBLOCK_IMPERIAL_ARAMAIC = 186,

    UBLOCK_OLD_SOUTH_ARABIAN = 187,

    UBLOCK_AVESTAN = 188,

    UBLOCK_INSCRIPTIONAL_PARTHIAN = 189,

    UBLOCK_INSCRIPTIONAL_PAHLAVI = 190,

    UBLOCK_OLD_TURKIC = 191,

    UBLOCK_RUMI_NUMERAL_SYMBOLS = 192,

    UBLOCK_KAITHI = 193,

    UBLOCK_EGYPTIAN_HIEROGLYPHS = 194,

    UBLOCK_ENCLOSED_ALPHANUMERIC_SUPPLEMENT = 195,

    UBLOCK_ENCLOSED_IDEOGRAPHIC_SUPPLEMENT = 196,

    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C = 197,




    UBLOCK_MANDAIC = 198,

    UBLOCK_BATAK = 199,

    UBLOCK_ETHIOPIC_EXTENDED_A = 200,

    UBLOCK_BRAHMI = 201,

    UBLOCK_BAMUM_SUPPLEMENT = 202,

    UBLOCK_KANA_SUPPLEMENT = 203,

    UBLOCK_PLAYING_CARDS = 204,

    UBLOCK_MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS = 205,

    UBLOCK_EMOTICONS = 206,

    UBLOCK_TRANSPORT_AND_MAP_SYMBOLS = 207,

    UBLOCK_ALCHEMICAL_SYMBOLS = 208,

    UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D = 209,


    UBLOCK_COUNT = 210,


    UBLOCK_INVALID_CODE=-1
};


typedef enum UBlockCode UBlockCode;
# 1401 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef enum UEastAsianWidth {
    U_EA_NEUTRAL,
    U_EA_AMBIGUOUS,
    U_EA_HALFWIDTH,
    U_EA_FULLWIDTH,
    U_EA_NARROW,
    U_EA_WIDE,
    U_EA_COUNT
} UEastAsianWidth;
# 1426 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef enum UCharNameChoice {
    U_UNICODE_CHAR_NAME,
    U_UNICODE_10_CHAR_NAME,
    U_EXTENDED_CHAR_NAME,
    U_CHAR_NAME_ALIAS,
    U_CHAR_NAME_CHOICE_COUNT
} UCharNameChoice;
# 1447 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef enum UPropertyNameChoice {
    U_SHORT_PROPERTY_NAME,
    U_LONG_PROPERTY_NAME,
    U_PROPERTY_NAME_CHOICE_COUNT
} UPropertyNameChoice;







typedef enum UDecompositionType {
    U_DT_NONE,
    U_DT_CANONICAL,
    U_DT_COMPAT,
    U_DT_CIRCLE,
    U_DT_FINAL,
    U_DT_FONT,
    U_DT_FRACTION,
    U_DT_INITIAL,
    U_DT_ISOLATED,
    U_DT_MEDIAL,
    U_DT_NARROW,
    U_DT_NOBREAK,
    U_DT_SMALL,
    U_DT_SQUARE,
    U_DT_SUB,
    U_DT_SUPER,
    U_DT_VERTICAL,
    U_DT_WIDE,
    U_DT_COUNT
} UDecompositionType;







typedef enum UJoiningType {
    U_JT_NON_JOINING,
    U_JT_JOIN_CAUSING,
    U_JT_DUAL_JOINING,
    U_JT_LEFT_JOINING,
    U_JT_RIGHT_JOINING,
    U_JT_TRANSPARENT,
    U_JT_COUNT
} UJoiningType;







typedef enum UJoiningGroup {
    U_JG_NO_JOINING_GROUP,
    U_JG_AIN,
    U_JG_ALAPH,
    U_JG_ALEF,
    U_JG_BEH,
    U_JG_BETH,
    U_JG_DAL,
    U_JG_DALATH_RISH,
    U_JG_E,
    U_JG_FEH,
    U_JG_FINAL_SEMKATH,
    U_JG_GAF,
    U_JG_GAMAL,
    U_JG_HAH,
    U_JG_TEH_MARBUTA_GOAL,
    U_JG_HAMZA_ON_HEH_GOAL=U_JG_TEH_MARBUTA_GOAL,
    U_JG_HE,
    U_JG_HEH,
    U_JG_HEH_GOAL,
    U_JG_HETH,
    U_JG_KAF,
    U_JG_KAPH,
    U_JG_KNOTTED_HEH,
    U_JG_LAM,
    U_JG_LAMADH,
    U_JG_MEEM,
    U_JG_MIM,
    U_JG_NOON,
    U_JG_NUN,
    U_JG_PE,
    U_JG_QAF,
    U_JG_QAPH,
    U_JG_REH,
    U_JG_REVERSED_PE,
    U_JG_SAD,
    U_JG_SADHE,
    U_JG_SEEN,
    U_JG_SEMKATH,
    U_JG_SHIN,
    U_JG_SWASH_KAF,
    U_JG_SYRIAC_WAW,
    U_JG_TAH,
    U_JG_TAW,
    U_JG_TEH_MARBUTA,
    U_JG_TETH,
    U_JG_WAW,
    U_JG_YEH,
    U_JG_YEH_BARREE,
    U_JG_YEH_WITH_TAIL,
    U_JG_YUDH,
    U_JG_YUDH_HE,
    U_JG_ZAIN,
    U_JG_FE,
    U_JG_KHAPH,
    U_JG_ZHAIN,
    U_JG_BURUSHASKI_YEH_BARREE,
    U_JG_FARSI_YEH,
    U_JG_NYA,
    U_JG_COUNT
} UJoiningGroup;







typedef enum UGraphemeClusterBreak {
    U_GCB_OTHER = 0,
    U_GCB_CONTROL = 1,
    U_GCB_CR = 2,
    U_GCB_EXTEND = 3,
    U_GCB_L = 4,
    U_GCB_LF = 5,
    U_GCB_LV = 6,
    U_GCB_LVT = 7,
    U_GCB_T = 8,
    U_GCB_V = 9,
    U_GCB_SPACING_MARK = 10,
    U_GCB_PREPEND = 11,
    U_GCB_COUNT = 12
} UGraphemeClusterBreak;
# 1594 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef enum UWordBreakValues {
    U_WB_OTHER = 0,
    U_WB_ALETTER = 1,
    U_WB_FORMAT = 2,
    U_WB_KATAKANA = 3,
    U_WB_MIDLETTER = 4,
    U_WB_MIDNUM = 5,
    U_WB_NUMERIC = 6,
    U_WB_EXTENDNUMLET = 7,
    U_WB_CR = 8,
    U_WB_EXTEND = 9,
    U_WB_LF = 10,
    U_WB_MIDNUMLET =11,
    U_WB_NEWLINE =12,
    U_WB_COUNT = 13
} UWordBreakValues;







typedef enum USentenceBreak {
    U_SB_OTHER = 0,
    U_SB_ATERM = 1,
    U_SB_CLOSE = 2,
    U_SB_FORMAT = 3,
    U_SB_LOWER = 4,
    U_SB_NUMERIC = 5,
    U_SB_OLETTER = 6,
    U_SB_SEP = 7,
    U_SB_SP = 8,
    U_SB_STERM = 9,
    U_SB_UPPER = 10,
    U_SB_CR = 11,
    U_SB_EXTEND = 12,
    U_SB_LF = 13,
    U_SB_SCONTINUE = 14,
    U_SB_COUNT = 15
} USentenceBreak;







typedef enum ULineBreak {
    U_LB_UNKNOWN = 0,
    U_LB_AMBIGUOUS = 1,
    U_LB_ALPHABETIC = 2,
    U_LB_BREAK_BOTH = 3,
    U_LB_BREAK_AFTER = 4,
    U_LB_BREAK_BEFORE = 5,
    U_LB_MANDATORY_BREAK = 6,
    U_LB_CONTINGENT_BREAK = 7,
    U_LB_CLOSE_PUNCTUATION = 8,
    U_LB_COMBINING_MARK = 9,
    U_LB_CARRIAGE_RETURN = 10,
    U_LB_EXCLAMATION = 11,
    U_LB_GLUE = 12,
    U_LB_HYPHEN = 13,
    U_LB_IDEOGRAPHIC = 14,
    U_LB_INSEPERABLE = 15,

    U_LB_INSEPARABLE=U_LB_INSEPERABLE,
    U_LB_INFIX_NUMERIC = 16,
    U_LB_LINE_FEED = 17,
    U_LB_NONSTARTER = 18,
    U_LB_NUMERIC = 19,
    U_LB_OPEN_PUNCTUATION = 20,
    U_LB_POSTFIX_NUMERIC = 21,
    U_LB_PREFIX_NUMERIC = 22,
    U_LB_QUOTATION = 23,
    U_LB_COMPLEX_CONTEXT = 24,
    U_LB_SURROGATE = 25,
    U_LB_SPACE = 26,
    U_LB_BREAK_SYMBOLS = 27,
    U_LB_ZWSPACE = 28,
    U_LB_NEXT_LINE = 29,
    U_LB_WORD_JOINER = 30,
    U_LB_H2 = 31,
    U_LB_H3 = 32,
    U_LB_JL = 33,
    U_LB_JT = 34,
    U_LB_JV = 35,
    U_LB_CLOSE_PARENTHESIS = 36,
    U_LB_COUNT = 37
} ULineBreak;







typedef enum UNumericType {
    U_NT_NONE,
    U_NT_DECIMAL,
    U_NT_DIGIT,
    U_NT_NUMERIC,
    U_NT_COUNT
} UNumericType;







typedef enum UHangulSyllableType {
    U_HST_NOT_APPLICABLE,
    U_HST_LEADING_JAMO,
    U_HST_VOWEL_JAMO,
    U_HST_TRAILING_JAMO,
    U_HST_LV_SYLLABLE,
    U_HST_LVT_SYLLABLE,
    U_HST_COUNT
} UHangulSyllableType;
# 1741 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_hasBinaryProperty_48(UChar32 c, UProperty which);
# 1756 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isUAlphabetic_48(UChar32 c);
# 1771 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isULowercase_48(UChar32 c);
# 1786 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isUUppercase_48(UChar32 c);
# 1807 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isUWhiteSpace_48(UChar32 c);
# 1847 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_getIntPropertyValue_48(UChar32 c, UProperty which);
# 1868 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_getIntPropertyMinValue_48(UProperty which);
# 1897 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_getIntPropertyMaxValue_48(UProperty which);
# 1920 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern double
u_getNumericValue_48(UChar32 c);
# 1955 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_islower_48(UChar32 c);
# 1982 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isupper_48(UChar32 c);
# 1999 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_istitle_48(UChar32 c);
# 2020 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isdigit_48(UChar32 c);
# 2041 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isalpha_48(UChar32 c);
# 2062 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isalnum_48(UChar32 c);
# 2085 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isxdigit_48(UChar32 c);
# 2101 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_ispunct_48(UChar32 c);
# 2120 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isgraph_48(UChar32 c);
# 2149 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isblank_48(UChar32 c);
# 2174 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isdefined_48(UChar32 c);
# 2195 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isspace_48(UChar32 c);
# 2216 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isJavaSpaceChar_48(UChar32 c);
# 2256 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isWhitespace_48(UChar32 c);
# 2280 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_iscntrl_48(UChar32 c);
# 2295 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isISOControl_48(UChar32 c);
# 2313 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isprint_48(UChar32 c);
# 2334 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isbase_48(UChar32 c);
# 2353 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UCharDirection
u_charDirection_48(UChar32 c);
# 2371 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isMirrored_48(UChar32 c);
# 2393 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_charMirror_48(UChar32 c);
# 2407 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int8_t
u_charType_48(UChar32 c);
# 2442 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef UBool
UCharEnumTypeRange(const void *context, UChar32 start, UChar32 limit, UCharCategory type);
# 2464 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern void
u_enumCharTypes_48(UCharEnumTypeRange *enumRange, const void *context);
# 2476 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern uint8_t
u_getCombiningClass_48(UChar32 c);
# 2504 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_charDigitValue_48(UChar32 c);
# 2516 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBlockCode
ublock_getCode_48(UChar32 c);
# 2551 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_charName_48(UChar32 code, UCharNameChoice nameChoice,
           char *buffer, int32_t bufferLength,
           UErrorCode *pErrorCode);
# 2581 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_getISOComment_48(UChar32 c,
                char *dest, int32_t destCapacity,
                UErrorCode *pErrorCode);
# 2606 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_charFromName_48(UCharNameChoice nameChoice,
               const char *name,
               UErrorCode *pErrorCode);
# 2628 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
typedef UBool UEnumCharNamesFn(void *context,
                               UChar32 code,
                               UCharNameChoice nameChoice,
                               const char *name,
                               int32_t length);
# 2655 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern void
u_enumCharNames_48(UChar32 start, UChar32 limit,
                UEnumCharNamesFn *fn,
                void *context,
                UCharNameChoice nameChoice,
                UErrorCode *pErrorCode);
# 2693 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern const char*
u_getPropertyName_48(UProperty property,
                  UPropertyNameChoice nameChoice);
# 2716 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UProperty
u_getPropertyEnum_48(const char* alias);
# 2766 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern const char*
u_getPropertyValueName_48(UProperty property,
                       int32_t value,
                       UPropertyNameChoice nameChoice);
# 2802 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_getPropertyValueEnum_48(UProperty property,
                       const char* alias);
# 2823 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isIDStart_48(UChar32 c);
# 2847 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isIDPart_48(UChar32 c);
# 2870 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isIDIgnorable_48(UChar32 c);
# 2889 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isJavaIDStart_48(UChar32 c);
# 2910 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UBool
u_isJavaIDPart_48(UChar32 c);
# 2935 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_tolower_48(UChar32 c);
# 2960 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_toupper_48(UChar32 c);
# 2985 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_totitle_48(UChar32 c);
# 3031 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_foldCase_48(UChar32 c, uint32_t options);
# 3072 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_digit_48(UChar32 ch, int8_t radix);
# 3103 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern UChar32
u_forDigit_48(int32_t digit, int8_t radix);
# 3120 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern void
u_charAge_48(UChar32 c, UVersionInfo versionArray);
# 3134 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern void
u_getUnicodeVersion_48(UVersionInfo versionArray);
# 3159 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h"
extern int32_t
u_getFC_NFKC_Closure_48(UChar32 c, UChar *dest, int32_t destCapacity, UErrorCode *pErrorCode);





# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/localpointer.h" 1
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h" 2


# 106 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
typedef struct {


    uint16_t size;



    uint16_t reservedWord;




    uint8_t isBigEndian;



    uint8_t charsetFamily;



    uint8_t sizeofUChar;



    uint8_t reservedByte;



    uint8_t dataFormat[4];



    uint8_t formatVersion[4];



    uint8_t dataVersion[4];
} UDataInfo;







typedef struct UDataMemory UDataMemory;
# 166 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
typedef UBool
UDataMemoryIsAcceptable(void *context,
                        const char *type, const char *name,
                        const UDataInfo *pInfo);
# 193 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern UDataMemory *
udata_open_48(const char *path, const char *type, const char *name,
           UErrorCode *pErrorCode);
# 245 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern UDataMemory *
udata_openChoice_48(const char *path, const char *type, const char *name,
                 UDataMemoryIsAcceptable *isAcceptable, void *context,
                 UErrorCode *pErrorCode);
# 257 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern void
udata_close_48(UDataMemory *pData);
# 285 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern const void *
udata_getMemory_48(UDataMemory *pData);
# 306 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern void
udata_getInfo_48(UDataMemory *pData, UDataInfo *pInfo);
# 349 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern void
udata_setCommonData_48(const void *data, UErrorCode *err);
# 377 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern void
udata_setAppData_48(const char *packageName, const void *data, UErrorCode *err);






typedef enum UDataFileAccess {

    UDATA_FILES_FIRST,

    UDATA_ONLY_PACKAGES,


    UDATA_PACKAGES_FIRST,

    UDATA_NO_FILES,

    UDATA_DEFAULT_ACCESS = UDATA_FILES_FIRST,
    UDATA_FILE_ACCESS_COUNT
} UDataFileAccess;
# 410 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/udata.h"
extern void
udata_setFileAccess_48(UDataFileAccess access, UErrorCode *status);


# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h" 1
# 19 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h" 1
# 38 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"


struct UCharIterator;
typedef struct UCharIterator UCharIterator;







typedef enum UCharIteratorOrigin {
    UITER_START, UITER_CURRENT, UITER_LIMIT, UITER_ZERO, UITER_LENGTH
} UCharIteratorOrigin;


enum {
# 69 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UITER_UNKNOWN_INDEX=-2
};
# 104 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef int32_t
UCharIteratorGetIndex(UCharIterator *iter, UCharIteratorOrigin origin);
# 141 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef int32_t
UCharIteratorMove(UCharIterator *iter, int32_t delta, UCharIteratorOrigin origin);
# 156 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef UBool
UCharIteratorHasNext(UCharIterator *iter);
# 170 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef UBool
UCharIteratorHasPrevious(UCharIterator *iter);
# 185 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef UChar32
UCharIteratorCurrent(UCharIterator *iter);
# 201 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef UChar32
UCharIteratorNext(UCharIterator *iter);
# 217 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef UChar32
UCharIteratorPrevious(UCharIterator *iter);
# 231 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef int32_t
UCharIteratorReserved(UCharIterator *iter, int32_t something);
# 278 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef uint32_t
UCharIteratorGetState(const UCharIterator *iter);
# 306 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
typedef void
UCharIteratorSetState(UCharIterator *iter, uint32_t state, UErrorCode *pErrorCode);
# 339 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
struct UCharIterator {





    const void *context;






    int32_t length;






    int32_t start;






    int32_t index;






    int32_t limit;





    int32_t reservedField;
# 388 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorGetIndex *getIndex;
# 399 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorMove *move;
# 408 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorHasNext *hasNext;







    UCharIteratorHasPrevious *hasPrevious;
# 425 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorCurrent *current;
# 435 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorNext *next;
# 445 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorPrevious *previous;







    UCharIteratorReserved *reservedFn;
# 462 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorGetState *getState;
# 472 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
    UCharIteratorSetState *setState;
};
# 493 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern UChar32
uiter_current32_48(UCharIterator *iter);
# 510 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern UChar32
uiter_next32_48(UCharIterator *iter);
# 527 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern UChar32
uiter_previous32_48(UCharIterator *iter);
# 548 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern uint32_t
uiter_getState_48(const UCharIterator *iter);
# 566 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern void
uiter_setState_48(UCharIterator *iter, uint32_t state, UErrorCode *pErrorCode);
# 591 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern void
uiter_setString_48(UCharIterator *iter, const UChar *s, int32_t length);
# 614 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern void
uiter_setUTF16BE_48(UCharIterator *iter, const char *s, int32_t length);
# 650 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"
extern void
uiter_setUTF8_48(UCharIterator *iter, const char *s, int32_t length);
# 705 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h"

# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h" 1
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h" 1
# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h" 2



struct USet;





typedef struct USet USet;







enum {




    USET_IGNORE_SPACE = 1,
# 82 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
    USET_CASE_INSENSITIVE = 2,
# 92 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
    USET_ADD_CASE_MAPPINGS = 4,





    USET_SERIALIZED_STATIC_ARRAY_CAPACITY=8
};
# 156 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
typedef enum USetSpanCondition {
# 168 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
    USET_SPAN_NOT_CONTAINED = 0,
# 183 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
    USET_SPAN_CONTAINED = 1,
# 202 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
    USET_SPAN_SIMPLE = 2,




    USET_SPAN_CONDITION_COUNT
} USetSpanCondition;






typedef struct USerializedSet {




    const uint16_t *array;




    int32_t bmpLength;




    int32_t length;




    uint16_t staticArray[USET_SERIALIZED_STATIC_ARRAY_CAPACITY];
} USerializedSet;
# 249 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern USet*
uset_openEmpty_48();
# 262 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern USet*
uset_open_48(UChar32 start, UChar32 end);
# 274 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern USet*
uset_openPattern_48(const UChar* pattern, int32_t patternLength,
                 UErrorCode* ec);
# 289 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern USet*
uset_openPatternOptions_48(const UChar* pattern, int32_t patternLength,
                 uint32_t options,
                 UErrorCode* ec);







extern void
uset_close_48(USet* set);
# 331 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern USet *
uset_clone_48(const USet *set);
# 343 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_isFrozen_48(const USet *set);
# 360 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_freeze_48(USet *set);
# 373 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern USet *
uset_cloneAsThawed_48(const USet *set);
# 385 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_set_48(USet* set,
         UChar32 start, UChar32 end);
# 410 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_applyPattern_48(USet *set,
                  const UChar *pattern, int32_t patternLength,
                  uint32_t options,
                  UErrorCode *status);
# 438 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_applyIntPropertyValue_48(USet* set,
                           UProperty prop, int32_t value, UErrorCode* ec);
# 477 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_applyPropertyAlias_48(USet* set,
                        const UChar *prop, int32_t propLength,
                        const UChar *value, int32_t valueLength,
                        UErrorCode* ec);
# 492 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_resemblesPattern_48(const UChar *pattern, int32_t patternLength,
                      int32_t pos);
# 511 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_toPattern_48(const USet* set,
               UChar* result, int32_t resultCapacity,
               UBool escapeUnprintable,
               UErrorCode* ec);
# 525 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_add_48(USet* set, UChar32 c);
# 540 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_addAll_48(USet* set, const USet *additionalSet);
# 552 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_addRange_48(USet* set, UChar32 start, UChar32 end);
# 564 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_addString_48(USet* set, const UChar* str, int32_t strLen);
# 576 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_addAllCodePoints_48(USet* set, const UChar *str, int32_t strLen);
# 587 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_remove_48(USet* set, UChar32 c);
# 599 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_removeRange_48(USet* set, UChar32 start, UChar32 end);
# 611 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_removeString_48(USet* set, const UChar* str, int32_t strLen);
# 625 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_removeAll_48(USet* set, const USet* removeSet);
# 642 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_retain_48(USet* set, UChar32 start, UChar32 end);
# 657 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_retainAll_48(USet* set, const USet* retain);
# 668 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_compact_48(USet* set);
# 679 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_complement_48(USet* set);
# 693 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_complementAll_48(USet* set, const USet* complement);
# 703 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_clear_48(USet* set);
# 732 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_closeOver_48(USet* set, int32_t attributes);







extern void
uset_removeAllStrings_48(USet* set);
# 751 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_isEmpty_48(const USet* set);
# 762 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_contains_48(const USet* set, UChar32 c);
# 774 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_containsRange_48(const USet* set, UChar32 start, UChar32 end);
# 785 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_containsString_48(const USet* set, const UChar* str, int32_t strLen);
# 798 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_indexOf_48(const USet* set, UChar32 c);
# 811 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UChar32
uset_charAt_48(const USet* set, int32_t charIndex);
# 822 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_size_48(const USet* set);
# 833 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_getItemCount_48(const USet* set);
# 854 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_getItem_48(const USet* set, int32_t itemIndex,
             UChar32* start, UChar32* end,
             UChar* str, int32_t strCapacity,
             UErrorCode* ec);
# 868 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_containsAll_48(const USet* set1, const USet* set2);
# 881 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_containsAllCodePoints_48(const USet* set, const UChar *str, int32_t strLen);
# 892 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_containsNone_48(const USet* set1, const USet* set2);
# 903 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_containsSome_48(const USet* set1, const USet* set2);
# 925 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_span_48(const USet *set, const UChar *s, int32_t length, USetSpanCondition spanCondition);
# 946 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_spanBack_48(const USet *set, const UChar *s, int32_t length, USetSpanCondition spanCondition);
# 968 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_spanUTF8_48(const USet *set, const char *s, int32_t length, USetSpanCondition spanCondition);
# 989 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_spanBackUTF8_48(const USet *set, const char *s, int32_t length, USetSpanCondition spanCondition);
# 1000 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_equals_48(const USet* set1, const USet* set2);
# 1056 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_serialize_48(const USet* set, uint16_t* dest, int32_t destCapacity, UErrorCode* pErrorCode);
# 1067 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_getSerializedSet_48(USerializedSet* fillSet, const uint16_t* src, int32_t srcLength);
# 1077 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern void
uset_setSerializedToOne_48(USerializedSet* fillSet, UChar32 c);
# 1088 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_serializedContains_48(const USerializedSet* set, UChar32 c);
# 1100 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern int32_t
uset_getSerializedRangeCount_48(const USerializedSet* set);
# 1116 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
extern UBool
uset_getSerializedRange_48(const USerializedSet* set, int32_t rangeIndex,
                        UChar32* pStart, UChar32* pEnd);
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uset_imp.h" 1
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uset_imp.h"


typedef void
USetAdd(USet *set, UChar32 c);

typedef void
USetAddRange(USet *set, UChar32 start, UChar32 end);

typedef void
USetAddString(USet *set, const UChar *str, int32_t length);

typedef void
USetRemove(USet *set, UChar32 c);

typedef void
USetRemoveRange(USet *set, UChar32 start, UChar32 end);






struct USetAdder {
    USet *set;
    USetAdd *add;
    USetAddRange *addRange;
    USetAddString *addString;
    USetRemove *remove;
    USetRemoveRange *removeRange;
};
typedef struct USetAdder USetAdder;


# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h" 1
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
# 1 "c:/marmalade/5.2/s3e/h/std/stdarg.h" 1
# 54 "c:/marmalade/5.2/s3e/h/std/stdarg.h"
typedef __builtin_va_list va_list;
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h" 2






struct UDataSwapper;
typedef struct UDataSwapper UDataSwapper;
# 87 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
typedef int32_t
UDataSwapFn(const UDataSwapper *ds,
            const void *inData, int32_t length, void *outData,
            UErrorCode *pErrorCode);





typedef uint16_t
UDataReadUInt16(uint16_t x);





typedef uint32_t
UDataReadUInt32(uint32_t x);





typedef void
UDataWriteUInt16(uint16_t *p, uint16_t x);





typedef void
UDataWriteUInt32(uint32_t *p, uint32_t x);
# 130 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
typedef int32_t
UDataCompareInvChars(const UDataSwapper *ds,
                     const char *outString, int32_t outLength,
                     const UChar *localString, int32_t localLength);
# 146 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
typedef void
UDataPrintError(void *context, const char *fmt, va_list args);

struct UDataSwapper {

    UBool inIsBigEndian;

    uint8_t inCharset;

    UBool outIsBigEndian;

    uint8_t outCharset;




    UDataReadUInt16 *readUInt16;

    UDataReadUInt32 *readUInt32;

    UDataCompareInvChars *compareInvChars;




    UDataWriteUInt16 *writeUInt16;

    UDataWriteUInt32 *writeUInt32;




    UDataSwapFn *swapArray16;

    UDataSwapFn *swapArray32;

    UDataSwapFn *swapInvChars;






    UDataPrintError *printError;

    void *printErrorContext;
};



extern UDataSwapper *
udata_openSwapper_48(UBool inIsBigEndian, uint8_t inCharset,
                  UBool outIsBigEndian, uint8_t outCharset,
                  UErrorCode *pErrorCode);
# 210 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
extern UDataSwapper *
udata_openSwapperForInputData_48(const void *data, int32_t length,
                              UBool outIsBigEndian, uint8_t outCharset,
                              UErrorCode *pErrorCode);

extern void
udata_closeSwapper_48(UDataSwapper *ds);
# 227 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
extern int32_t
udata_swapDataHeader_48(const UDataSwapper *ds,
                     const void *inData, int32_t length, void *outData,
                     UErrorCode *pErrorCode);





extern int16_t
udata_readInt16_48(const UDataSwapper *ds, int16_t x);





extern int32_t
udata_readInt32_48(const UDataSwapper *ds, int32_t x);






extern int32_t
udata_swapInvStringBlock_48(const UDataSwapper *ds,
                         const void *inData, int32_t length, void *outData,
                         UErrorCode *pErrorCode);

extern void
udata_printError_48(const UDataSwapper *ds,
                 const char *fmt,
                 ...);
# 269 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/udataswp.h"
extern int32_t
uprv_ebcdicFromAscii_48(const UDataSwapper *ds,
                     const void *inData, int32_t length, void *outData,
                     UErrorCode *pErrorCode);





extern int32_t
uprv_copyAscii_48(const UDataSwapper *ds,
               const void *inData, int32_t length, void *outData,
               UErrorCode *pErrorCode);





extern int32_t
uprv_asciiFromEbcdic_48(const UDataSwapper *ds,
                     const void *inData, int32_t length, void *outData,
                     UErrorCode *pErrorCode);





extern int32_t
uprv_copyEbcdic_48(const UDataSwapper *ds,
                const void *inData, int32_t length, void *outData,
                UErrorCode *pErrorCode);





extern int32_t
uprv_compareInvAscii_48(const UDataSwapper *ds,
                     const char *outString, int32_t outLength,
                     const UChar *localString, int32_t localLength);





extern int32_t
uprv_compareInvEbcdic_48(const UDataSwapper *ds,
                      const char *outString, int32_t outLength,
                      const UChar *localString, int32_t localLength);
# 26 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h" 2





struct UCaseProps;
typedef struct UCaseProps UCaseProps;

extern const UCaseProps *
ucase_getSingleton_48(void);

extern void
ucase_addPropertyStarts_48(const UCaseProps *csp, const USetAdder *sa, UErrorCode *pErrorCode);






extern int32_t
ucase_getCaseLocale_48(const char *locale, int32_t *locCache);


enum {
    UCASE_LOC_UNKNOWN,
    UCASE_LOC_ROOT,
    UCASE_LOC_TURKISH,
    UCASE_LOC_LITHUANIAN,
    UCASE_LOC_DUTCH
};
# 75 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
extern UChar32
ucase_tolower_48(const UCaseProps *csp, UChar32 c);

extern UChar32
ucase_toupper_48(const UCaseProps *csp, UChar32 c);

extern UChar32
ucase_totitle_48(const UCaseProps *csp, UChar32 c);

extern UChar32
ucase_fold_48(const UCaseProps *csp, UChar32 c, uint32_t options);
# 96 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
extern void
ucase_addCaseClosure_48(const UCaseProps *csp, UChar32 c, const USetAdder *sa);
# 111 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
extern UBool
ucase_addStringCaseClosure_48(const UCaseProps *csp, const UChar *s, int32_t length, const USetAdder *sa);


extern int32_t
ucase_getType_48(const UCaseProps *csp, UChar32 c);


extern int32_t
ucase_getTypeOrIgnorable_48(const UCaseProps *csp, UChar32 c);

extern UBool
ucase_isSoftDotted_48(const UCaseProps *csp, UChar32 c);

extern UBool
ucase_isCaseSensitive_48(const UCaseProps *csp, UChar32 c);
# 148 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
typedef UChar32
UCaseContextIterator(void *context, int8_t dir);





struct UCaseContext {
    void *p;
    int32_t start, index, limit;
    int32_t cpStart, cpLimit;
    int8_t dir;
    int8_t b1, b2, b3;
};
typedef struct UCaseContext UCaseContext;

enum {
# 179 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
    UCASE_MAX_STRING_LENGTH=0x1f
};
# 203 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
extern int32_t
ucase_toFullLower_48(const UCaseProps *csp, UChar32 c,
                  UCaseContextIterator *iter, void *context,
                  const UChar **pString,
                  const char *locale, int32_t *locCache);

extern int32_t
ucase_toFullUpper_48(const UCaseProps *csp, UChar32 c,
                  UCaseContextIterator *iter, void *context,
                  const UChar **pString,
                  const char *locale, int32_t *locCache);

extern int32_t
ucase_toFullTitle_48(const UCaseProps *csp, UChar32 c,
                  UCaseContextIterator *iter, void *context,
                  const UChar **pString,
                  const char *locale, int32_t *locCache);

extern int32_t
ucase_toFullFolding_48(const UCaseProps *csp, UChar32 c,
                    const UChar **pString,
                    uint32_t options);

extern int32_t
ucase_hasBinaryProperty_48(UChar32 c, UProperty which);







typedef int32_t
UCaseMapFull(const UCaseProps *csp, UChar32 c,
             UCaseContextIterator *iter, void *context,
             const UChar **pString,
             const char *locale, int32_t *locCache);


# 255 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
enum {
    UCASE_IX_INDEX_TOP,
    UCASE_IX_LENGTH,
    UCASE_IX_TRIE_SIZE,
    UCASE_IX_EXC_LENGTH,
    UCASE_IX_UNFOLD_LENGTH,

    UCASE_IX_MAX_FULL_LENGTH=15,
    UCASE_IX_TOP=16
};





enum {
    UCASE_NONE,
    UCASE_LOWER,
    UCASE_UPPER,
    UCASE_TITLE
};







enum {
    UCASE_NO_DOT=0,
    UCASE_SOFT_DOTTED=0x10,
    UCASE_ABOVE=0x20,
    UCASE_OTHER_ACCENT=0x30
};
# 309 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
enum {
    UCASE_EXC_LOWER,
    UCASE_EXC_FOLD,
    UCASE_EXC_UPPER,
    UCASE_EXC_TITLE,
    UCASE_EXC_4,
    UCASE_EXC_5,
    UCASE_EXC_CLOSURE,
    UCASE_EXC_FULL_MAPPINGS,
    UCASE_EXC_ALL_SLOTS
};
# 333 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
enum {
    UCASE_EXC_NO_DOT=0,
    UCASE_EXC_SOFT_DOTTED=0x1000,
    UCASE_EXC_ABOVE=0x2000,
    UCASE_EXC_OTHER_ACCENT=0x3000
};
# 355 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
enum {
    UCASE_UNFOLD_ROWS,
    UCASE_UNFOLD_ROW_WIDTH,
    UCASE_UNFOLD_STRING_WIDTH
};


# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h" 2




    typedef struct UBreakIterator UBreakIterator;
# 49 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h"
extern int32_t
uprv_strCompare_48(const UChar *s1, int32_t length1,
                const UChar *s2, int32_t length2,
                UBool strncmpStyle, UBool codePointOrder);






extern int32_t
u_strcmpFold_48(const UChar *s1, int32_t length1,
             const UChar *s2, int32_t length2,
             uint32_t options,
             UErrorCode *pErrorCode);







extern UBool
uprv_haveProperties_48(UErrorCode *pErrorCode);
# 88 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h"
struct UCaseMap {
    const UCaseProps *csp;

    UBreakIterator *iter;

    char locale[32];
    int32_t locCache;
    uint32_t options;
};


typedef struct UCaseMap UCaseMap;


enum {
    TO_LOWER,
    TO_UPPER,
    TO_TITLE,
    FOLD_CASE
};

extern int32_t
ustr_toLower_48(const UCaseProps *csp,
             UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             const char *locale,
             UErrorCode *pErrorCode);

extern int32_t
ustr_toUpper_48(const UCaseProps *csp,
             UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             const char *locale,
             UErrorCode *pErrorCode);



extern int32_t
ustr_toTitle_48(const UCaseProps *csp,
             UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             UBreakIterator *titleIter,
             const char *locale, uint32_t options,
             UErrorCode *pErrorCode);






extern int32_t
ustr_foldCase_48(const UCaseProps *csp,
              UChar *dest, int32_t destCapacity,
              const UChar *src, int32_t srcLength,
              uint32_t options,
              UErrorCode *pErrorCode);
# 157 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h"
extern int32_t
u_terminateUChars_48(UChar *dest, int32_t destCapacity, int32_t length, UErrorCode *pErrorCode);





extern int32_t
u_terminateChars_48(char *dest, int32_t destCapacity, int32_t length, UErrorCode *pErrorCode);





extern int32_t
u_terminateUChar32s_48(UChar32 *dest, int32_t destCapacity, int32_t length, UErrorCode *pErrorCode);





extern int32_t
u_terminateWChars_48(wchar_t *dest, int32_t destCapacity, int32_t length, UErrorCode *pErrorCode);
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h" 1
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h" 1
# 52 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
extern void
u_init_48(UErrorCode *status);
# 100 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
extern void
u_cleanup_48(void);
# 113 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef void *UMTX;
# 131 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef void UMtxInitFn (const void *context, UMTX *mutex, UErrorCode* status);
# 143 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef void UMtxFn (const void *context, UMTX *mutex);
# 165 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
extern void
u_setMutexFunctions_48(const void *context, UMtxInitFn *init, UMtxFn *destroy, UMtxFn *lock, UMtxFn *unlock,
                    UErrorCode *status);
# 178 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef int32_t UMtxAtomicFn(const void *context, int32_t *p);
# 195 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
extern void
u_setAtomicIncDecFunctions_48(const void *context, UMtxAtomicFn *inc, UMtxAtomicFn *dec,
                    UErrorCode *status);
# 209 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef void * UMemAllocFn(const void *context, size_t size);
# 218 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef void * UMemReallocFn(const void *context, void *mem, size_t size);
# 229 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
typedef void UMemFreeFn (const void *context, void *mem);
# 247 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uclean.h"
extern void
u_setMemoryFunctions_48(const void *context, UMemAllocFn *a, UMemReallocFn *r, UMemFreeFn *f,
                    UErrorCode *status);
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h" 2
# 141 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h"
extern void umtx_lock_48 ( UMTX* mutex );






extern void umtx_unlock_48 ( UMTX* mutex );
# 159 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h"
extern void umtx_init_48 ( UMTX* mutex );
# 169 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h"
extern void umtx_destroy_48( UMTX *mutex );
# 180 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/umutex.h"
extern int32_t umtx_atomic_inc_48(int32_t *);
extern int32_t umtx_atomic_dec_48(int32_t *);
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 1
# 28 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h"
# 1 "c:/marmalade/5.2/s3e/h/std/string.h" 1
# 17 "c:/marmalade/5.2/s3e/h/std/string.h"


void *memcpy(void *dest, const void *src, size_t n);
void *memset(void *s, int c, size_t n);
int memcmp(const void *s1, const void *s2, size_t n);
void *memmove(void *dest, const void *src, size_t n);
void *memchr(const void *s, int c, size_t n);
void *memrchr(const void *s, int c, size_t n);







int strcmp(const char *s1, const char *s2);
int strncmp(const char *s1, const char *s2, size_t n);
char *strsep(char **stringp, const char *delim);
char *strcpy(char *dest, const char *src);
char *strncpy(char *dest, const char *src, size_t n);
char *strchr(const char *s, int c);
char *strstr(const char *haystack, const char *needle);
char *strrchr(const char *s, int c);
char *strdup(const char *s);
char *strtok(char *str, const char *delim);
char *strtok_r(char *str, const char *delim, char **saveptr);
char *strcat(char *dest, const char *src);
char *strncat(char *dest, const char *src, size_t n);
size_t strlen(const char *s);
size_t strnlen(const char *s, size_t n);
int strcasecmp(const char *s1, const char *s2);
int strncasecmp(const char *s1, const char *s2, size_t n);
size_t strspn(const char *s, const char *accept);
size_t strcspn(const char *s, const char *reject);
char *strpbrk(const char *s, const char *accept);
int strcoll(const char *s1, const char *s2);
char *strerror(int errnum);
size_t strxfrm(char *dest, const char *src, size_t n);

int strerror_r(int errnum, char *buf, size_t buflen);





size_t strlcpy(char* dest, const char* src, size_t len);
size_t strlcat(char* dest, const char* src, size_t len);


# 29 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 2

# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/localpointer.h" 1
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 2






extern void *
uprv_malloc_48(size_t s);

extern void *
uprv_realloc_48(void *mem, size_t size);

extern void
uprv_free_48(void *mem);





typedef union {
    long t1;
    double t2;
    void *t3;
} UAlignedMemory;
# 83 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h"
extern UBool
cmemory_inUse_48(void);






extern UBool
cmemory_cleanup_48(void);
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h" 1
# 30 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h"
# 1 "c:/marmalade/5.2/s3e/h/std/stdlib.h" 1
# 16 "c:/marmalade/5.2/s3e/h/std/stdlib.h"
# 1 "c:/marmalade/5.2/s3e/h/std/malloc.h" 1
# 16 "c:/marmalade/5.2/s3e/h/std/malloc.h"
# 1 "c:/marmalade/5.2/s3e/h/std/alloca.h" 1
# 17 "c:/marmalade/5.2/s3e/h/std/alloca.h"



    extern void *alloca(size_t __size);
# 35 "c:/marmalade/5.2/s3e/h/std/alloca.h"

# 17 "c:/marmalade/5.2/s3e/h/std/malloc.h" 2



void *calloc(size_t nmemb, size_t size);
void *malloc(size_t size);
void free(void *ptr);
void *realloc(void *ptr, size_t size);


# 17 "c:/marmalade/5.2/s3e/h/std/stdlib.h" 2
# 28 "c:/marmalade/5.2/s3e/h/std/stdlib.h"


double atof(const char* string);
int atoi(const char *nptr);
long atol(const char *nptr);
int64_t atoll(const char *nptr);
int64_t atoq(const char *nptr);
int abs(int j);
long int labs(long int j);
int64_t llabs(int64_t j);
void qsort(void *base, size_t nmemb, size_t size, int(*compar)(const void *, const void *));
void *bsearch(const void *key, const void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *));
void abort(void);
int putenv(char *string);
char *getenv(const char *name);
int setenv(const char *name, const char *value, int overwrite);
int unsetenv(const char *name);
void exit(int status) __attribute__ ((noreturn));
void _exit(int status) __attribute__ ((noreturn));
void _Exit(int status) __attribute__ ((noreturn));
unsigned long int strtoul(const char *nptr, char **endptr, int base);
uint64_t strtoull(const char *nptr, char **endptr, int base);
long int strtol(const char *nptr, char **endptr, int base);
int64_t strtoll(const char *nptr, char **endptr, int base);
double strtod(const char *nptr, char **endptr);
float strtof(const char *nptr, char **endptr);
long double strtold(const char *nptr, char **endptr);
int atexit(void (*function)(void));
int system(const char *command);
int posix_memalign(void **memptr, size_t alignment, size_t size);
char *mktemp(char *templ);
int mkstemp(char *templ);



int rand(void);
void srand(unsigned int seed);

long int random(void);
void srandom(unsigned int seed);

size_t __ctype_get_mb_cur_max();


int mblen(const char *s, size_t n);
int mbtowc(wchar_t *pwc, const char *s, size_t n);
int wctomb(char *s, wchar_t wc);
size_t mbstowcs(wchar_t *dest, const char *src, size_t n);
size_t wcstombs(char *dest, const wchar_t *src, size_t n);

typedef struct
{
    int quot;
    int rem;
} div_t;

typedef struct
{
    int quot;
    int rem;
} ldiv_t;

typedef struct
{
    int64_t quot;
    int64_t rem;
} lldiv_t;

div_t div(int numerator, int denominator);
ldiv_t ldiv(long numerator, long denominator);
lldiv_t lldiv(int64_t numerator, int64_t denominator);
# 112 "c:/marmalade/5.2/s3e/h/std/stdlib.h"

# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h" 2
# 1 "c:/marmalade/5.2/s3e/h/std/ctype.h" 1
# 17 "c:/marmalade/5.2/s3e/h/std/ctype.h"

# 31 "c:/marmalade/5.2/s3e/h/std/ctype.h"
int toupper(int c);
int tolower(int c);
int isalnum(int c);
int isalpha(int c);

int isblank(int c);
int iscntrl(int c);
int isdigit(int c);
int isgraph(int c);
int islower(int c);
int isprint(int c);
int ispunct(int c);
int isspace(int c);
int isupper(int c);
int isxdigit(int c);


# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h" 2
# 44 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h"
extern char
uprv_toupper_48(char c);


extern char
uprv_asciitolower_48(char c);

extern char
uprv_ebcdictolower_48(char c);
# 85 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h"
extern char*
uprv_strdup_48(const char *src);
# 96 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h"
extern char*
uprv_strndup_48(const char *src, int32_t n);

extern char*
T_CString_toLowerCase_48(char* str);

extern char*
T_CString_toUpperCase_48(char* str);

extern int32_t
T_CString_integerToString_48(char *buffer, int32_t n, int32_t radix);

extern int32_t
T_CString_int64ToString_48(char *buffer, int64_t n, uint32_t radix);

extern int32_t
T_CString_stringToInteger_48(const char *integerString, int32_t radix);

extern int
T_CString_stricmp_48(const char *str1, const char *str2);

extern int
T_CString_strnicmp_48(const char *str1, const char *str2, uint32_t n);
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucln_cmn.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucln_cmn.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucln.h" 1
# 53 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucln.h"
typedef enum ECleanupLibraryType {
    UCLN_START = -1,
    UCLN_UPLUG,
    UCLN_CUSTOM,
    UCLN_CTESTFW,
    UCLN_TOOLUTIL,
    UCLN_LAYOUTEX,
    UCLN_LAYOUT,
    UCLN_IO,
    UCLN_I18N,
    UCLN_COMMON
} ECleanupLibraryType;





typedef UBool cleanupFunc(void);







extern void ucln_registerCleanup_48(ECleanupLibraryType type,
                                           cleanupFunc *func);







extern void ucln_cleanupOne_48(ECleanupLibraryType type);
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucln_cmn.h" 2



extern UBool umtx_cleanup_48(void);

extern UBool utrace_cleanup_48(void);

extern UBool ucln_lib_cleanup_48(void);




typedef enum ECleanupCommonType {
    UCLN_COMMON_START = -1,
    UCLN_COMMON_USPREP,
    UCLN_COMMON_BREAKITERATOR,
    UCLN_COMMON_BREAKITERATOR_DICT,
    UCLN_COMMON_SERVICE,
    UCLN_COMMON_URES,
    UCLN_COMMON_LOCALE,
    UCLN_COMMON_LOCALE_AVAILABLE,
    UCLN_COMMON_ULOC,
    UCLN_COMMON_NORMALIZER2,
    UCLN_COMMON_USET,
    UCLN_COMMON_UNAMES,
    UCLN_COMMON_UPROPS,
    UCLN_COMMON_UCNV,
    UCLN_COMMON_UCNV_IO,
    UCLN_COMMON_UDATA,
    UCLN_COMMON_PUTIL,
    UCLN_COMMON_COUNT
} ECleanupCommonType;



extern void ucln_common_registerCleanup_48(ECleanupCommonType type,
                                                   cleanupFunc *func);
# 26 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2

# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h" 1
# 29 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
enum {
    UPROPS_PROPS32_INDEX,
    UPROPS_EXCEPTIONS_INDEX,
    UPROPS_EXCEPTIONS_TOP_INDEX,

    UPROPS_ADDITIONAL_TRIE_INDEX,
    UPROPS_ADDITIONAL_VECTORS_INDEX,
    UPROPS_ADDITIONAL_VECTORS_COLUMNS_INDEX,

    UPROPS_SCRIPT_EXTENSIONS_INDEX,

    UPROPS_RESERVED_INDEX_7,
    UPROPS_RESERVED_INDEX_8,


    UPROPS_DATA_TOP_INDEX,


    UPROPS_MAX_VALUES_INDEX=10,

    UPROPS_MAX_VALUES_2_INDEX,

    UPROPS_INDEX_COUNT=16
};


enum {


    UPROPS_NUMERIC_TYPE_VALUE_SHIFT=6
};







enum {
    UPROPS_NTV_NONE=0,
    UPROPS_NTV_DECIMAL_START=1,
    UPROPS_NTV_DIGIT_START=11,
    UPROPS_NTV_NUMERIC_START=21,
    UPROPS_NTV_FRACTION_START=0xb0,
    UPROPS_NTV_LARGE_START=0x1e0,
    UPROPS_NTV_RESERVED_START=0x300,

    UPROPS_NTV_MAX_SMALL_INT=UPROPS_NTV_FRACTION_START-UPROPS_NTV_NUMERIC_START-1
};
# 135 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
enum {
    UPROPS_WHITE_SPACE,
    UPROPS_DASH,
    UPROPS_HYPHEN,
    UPROPS_QUOTATION_MARK,
    UPROPS_TERMINAL_PUNCTUATION,
    UPROPS_MATH,
    UPROPS_HEX_DIGIT,
    UPROPS_ASCII_HEX_DIGIT,
    UPROPS_ALPHABETIC,
    UPROPS_IDEOGRAPHIC,
    UPROPS_DIACRITIC,
    UPROPS_EXTENDER,
    UPROPS_NONCHARACTER_CODE_POINT,
    UPROPS_GRAPHEME_EXTEND,
    UPROPS_GRAPHEME_LINK,
    UPROPS_IDS_BINARY_OPERATOR,
    UPROPS_IDS_TRINARY_OPERATOR,
    UPROPS_RADICAL,
    UPROPS_UNIFIED_IDEOGRAPH,
    UPROPS_DEFAULT_IGNORABLE_CODE_POINT,
    UPROPS_DEPRECATED,
    UPROPS_LOGICAL_ORDER_EXCEPTION,
    UPROPS_XID_START,
    UPROPS_XID_CONTINUE,
    UPROPS_ID_START,
    UPROPS_ID_CONTINUE,
    UPROPS_GRAPHEME_BASE,
    UPROPS_S_TERM,
    UPROPS_VARIATION_SELECTOR,
    UPROPS_PATTERN_SYNTAX,
    UPROPS_PATTERN_WHITE_SPACE,
    UPROPS_RESERVED,
    UPROPS_BINARY_1_TOP
};
# 201 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
extern uint32_t
u_getUnicodeProperties_48(UChar32 c, int32_t column);
# 217 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
extern int32_t
uprv_getMaxValues_48(int32_t column);





extern UBool
u_isalnumPOSIX_48(UChar32 c);
# 234 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
extern UBool
u_isgraphPOSIX_48(UChar32 c);






extern UBool
u_isprintPOSIX_48(UChar32 c);
# 281 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
enum {
    TAB =0x0009,
    LF =0x000a,
    FF =0x000c,
    CR =0x000d,
    U_A =0x0041,
    U_F =0x0046,
    U_Z =0x005a,
    U_a =0x0061,
    U_f =0x0066,
    U_z =0x007a,
    DEL =0x007f,
    NL =0x0085,
    NBSP =0x00a0,
    CGJ =0x034f,
    FIGURESP=0x2007,
    HAIRSP =0x200a,
    ZWNJ =0x200c,
    ZWJ =0x200d,
    RLM =0x200f,
    NNBSP =0x202f,
    WJ =0x2060,
    INHSWAP =0x206a,
    NOMDIG =0x206f,
    U_FW_A =0xff21,
    U_FW_F =0xff26,
    U_FW_Z =0xff3a,
    U_FW_a =0xff41,
    U_FW_f =0xff46,
    U_FW_z =0xff5a,
    ZWNBSP =0xfeff
};





extern int32_t
uprv_getMaxCharNameLength_48(void);







extern void
uprv_getCharNameCharacters_48(const USetAdder *sa);






enum UPropertySource {

    UPROPS_SRC_NONE,

    UPROPS_SRC_CHAR,

    UPROPS_SRC_PROPSVEC,

    UPROPS_SRC_NAMES,

    UPROPS_SRC_CASE,

    UPROPS_SRC_BIDI,

    UPROPS_SRC_CHAR_AND_PROPSVEC,

    UPROPS_SRC_CASE_AND_NORM,

    UPROPS_SRC_NFC,

    UPROPS_SRC_NFKC,

    UPROPS_SRC_NFKC_CF,

    UPROPS_SRC_NFC_CANON_ITER,

    UPROPS_SRC_COUNT
};
typedef enum UPropertySource UPropertySource;





extern UPropertySource
uprops_getSource_48(UProperty which);






extern void
uchar_addPropertyStarts_48(const USetAdder *sa, UErrorCode *pErrorCode);






extern void
upropsvec_addPropertyStarts_48(const USetAdder *sa, UErrorCode *pErrorCode);
# 404 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uprops.h"
extern int32_t
uchar_swapNames_48(const UDataSwapper *ds,
                const void *inData, int32_t length, void *outData,
                UErrorCode *pErrorCode);
# 28 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c" 2





static const char DATA_NAME[] = "unames";
static const char DATA_TYPE[] = "icu";
# 56 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
enum {
    GROUP_MSB,
    GROUP_OFFSET_HIGH,
    GROUP_OFFSET_LOW,
    GROUP_LENGTH
};
# 73 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
typedef struct {
    uint32_t start, end;
    uint8_t type, variant;
    uint16_t size;
} AlgorithmicRange;

typedef struct {
    uint32_t tokenStringOffset, groupsOffset, groupStringOffset, algNamesOffset;
} UCharNames;
# 94 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
typedef struct {
    const char *otherName;
    UChar32 code;
} FindName;



static UDataMemory *uCharNamesData=((void *)0);
static UCharNames *uCharNames=((void *)0);
static UErrorCode gLoadErrorCode=U_ZERO_ERROR;




static int32_t gMaxNameLength=0;





static uint32_t gNameSet[8]={ 0 };







static const char * const charCatNames[(U_CHAR_CATEGORY_COUNT + 3)] = {
    "unassigned",
    "uppercase letter",
    "lowercase letter",
    "titlecase letter",
    "modifier letter",
    "other letter",
    "non spacing mark",
    "enclosing mark",
    "combining spacing mark",
    "decimal digit number",
    "letter number",
    "other number",
    "space separator",
    "line separator",
    "paragraph separator",
    "control",
    "format",
    "private use area",
    "surrogate",
    "dash punctuation",
    "start punctuation",
    "end punctuation",
    "connector punctuation",
    "other punctuation",
    "math symbol",
    "currency symbol",
    "modifier symbol",
    "other symbol",
    "initial punctuation",
    "final punctuation",
    "noncharacter",
    "lead surrogate",
    "trail surrogate"
};



static UBool unames_cleanup(void)
{
    if(uCharNamesData) {
        udata_close_48(uCharNamesData);
        uCharNamesData = ((void *)0);
    }
    if(uCharNames) {
        uCharNames = ((void *)0);
    }
    gMaxNameLength=0;
    return 1;
}

static UBool
isAcceptable(void *context,
             const char *type, const char *name,
             const UDataInfo *pInfo) {
    return (UBool)(
        pInfo->size>=20 &&
        pInfo->isBigEndian==0 &&
        pInfo->charsetFamily==0 &&
        pInfo->dataFormat[0]==0x75 &&
        pInfo->dataFormat[1]==0x6e &&
        pInfo->dataFormat[2]==0x61 &&
        pInfo->dataFormat[3]==0x6d &&
        pInfo->formatVersion[0]==1);
}

static UBool
isDataLoaded(UErrorCode *pErrorCode) {

    UBool isCached;


    { (isCached)=((uCharNames!=((void *)0))); { umtx_lock_48(((void *)0)); umtx_unlock_48(((void *)0)); }; };

    if(!isCached) {
        UCharNames *names;
        UDataMemory *data;


        if(((gLoadErrorCode)>U_ZERO_ERROR)) {
            *pErrorCode=gLoadErrorCode;
            return 0;
        }


        data=udata_openChoice_48(((void *)0), DATA_TYPE, DATA_NAME, isAcceptable, ((void *)0), pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            gLoadErrorCode=*pErrorCode;
            return 0;
        }

        names=(UCharNames *)udata_getMemory_48(data);


        {
            umtx_lock_48(((void *)0));
            if(uCharNames==((void *)0)) {
                uCharNamesData=data;
                uCharNames=names;
                data=((void *)0);
                names=((void *)0);
                ucln_common_registerCleanup_48(UCLN_COMMON_UNAMES, unames_cleanup);
            }
            umtx_unlock_48(((void *)0));
        }


        if(data!=((void *)0)) {
            udata_close_48(data);
        }
    }
    return 1;
}
# 258 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
static uint16_t
expandName(UCharNames *names,
           const uint8_t *name, uint16_t nameLength, UCharNameChoice nameChoice,
           char *buffer, uint16_t bufferLength) {
    uint16_t *tokens=(uint16_t *)names+8;
    uint16_t token, tokenCount=*tokens++, bufferPos=0;
    uint8_t *tokenStrings=(uint8_t *)names+names->tokenStringOffset;
    uint8_t c;

    if(nameChoice!=U_UNICODE_CHAR_NAME && nameChoice!=U_EXTENDED_CHAR_NAME) {




        if((uint8_t)';'>=tokenCount || tokens[(uint8_t)';']==(uint16_t)(-1)) {
            int fieldIndex= nameChoice==U_CHAR_NAME_CHOICE_COUNT ? 2 : nameChoice;
            do {
                while(nameLength>0) {
                    --nameLength;
                    if(*name++==';') {
                        break;
                    }
                }
            } while(--fieldIndex>0);
        } else {





            nameLength=0;
        }
    }


    while(nameLength>0) {
        --nameLength;
        c=*name++;

        if(c>=tokenCount) {
            if(c!=';') {

                { if((bufferLength)>0) { *(buffer)++=c; --(bufferLength); } ++(bufferPos); };
            } else {

                break;
            }
        } else {
            token=tokens[c];
            if(token==(uint16_t)(-2)) {

                token=tokens[c<<8|*name++];
                --nameLength;
            }
            if(token==(uint16_t)(-1)) {
                if(c!=';') {

                    { if((bufferLength)>0) { *(buffer)++=c; --(bufferLength); } ++(bufferPos); };
                } else {



                    if(!bufferPos && nameChoice == U_EXTENDED_CHAR_NAME) {
                        if ((uint8_t)';'>=tokenCount || tokens[(uint8_t)';']==(uint16_t)(-1)) {
                            continue;
                        }
                    }

                    break;
                }
            } else {

                uint8_t *tokenString=tokenStrings+token;
                while((c=*tokenString++)!=0) {
                    { if((bufferLength)>0) { *(buffer)++=c; --(bufferLength); } ++(bufferPos); };
                }
            }
        }
    }


    if(bufferLength>0) {
        *buffer=0;
    }

    return bufferPos;
}






static UBool
compareName(UCharNames *names,
            const uint8_t *name, uint16_t nameLength, UCharNameChoice nameChoice,
            const char *otherName) {
    uint16_t *tokens=(uint16_t *)names+8;
    uint16_t token, tokenCount=*tokens++;
    uint8_t *tokenStrings=(uint8_t *)names+names->tokenStringOffset;
    uint8_t c;
    const char *origOtherName = otherName;

    if(nameChoice!=U_UNICODE_CHAR_NAME && nameChoice!=U_EXTENDED_CHAR_NAME) {




        if((uint8_t)';'>=tokenCount || tokens[(uint8_t)';']==(uint16_t)(-1)) {
            int fieldIndex= nameChoice==U_CHAR_NAME_CHOICE_COUNT ? 2 : nameChoice;
            do {
                while(nameLength>0) {
                    --nameLength;
                    if(*name++==';') {
                        break;
                    }
                }
            } while(--fieldIndex>0);
        } else {





            nameLength=0;
        }
    }


    while(nameLength>0) {
        --nameLength;
        c=*name++;

        if(c>=tokenCount) {
            if(c!=';') {

                if((char)c!=*otherName++) {
                    return 0;
                }
            } else {

                break;
            }
        } else {
            token=tokens[c];
            if(token==(uint16_t)(-2)) {

                token=tokens[c<<8|*name++];
                --nameLength;
            }
            if(token==(uint16_t)(-1)) {
                if(c!=';') {

                    if((char)c!=*otherName++) {
                        return 0;
                    }
                } else {



                    if(otherName == origOtherName && nameChoice == U_EXTENDED_CHAR_NAME) {
                        if ((uint8_t)';'>=tokenCount || tokens[(uint8_t)';']==(uint16_t)(-1)) {
                            continue;
                        }
                    }

                    break;
                }
            } else {

                uint8_t *tokenString=tokenStrings+token;
                while((c=*tokenString++)!=0) {
                    if((char)c!=*otherName++) {
                        return 0;
                    }
                }
            }
        }
    }


    return (UBool)(*otherName==0);
}

static uint8_t getCharCat(UChar32 cp) {
    uint8_t cat;

    if (((cp)>=0xfdd0 && ((uint32_t)(cp)<=0xfdef || ((cp)&0xfffe)==0xfffe) && (uint32_t)(cp)<=0x10ffff)) {
        return U_CHAR_CATEGORY_COUNT;
    }

    if ((cat = u_charType_48(cp)) == U_SURROGATE) {
        cat = (((cp)&0xfffffc00)==0xd800) ? U_CHAR_CATEGORY_COUNT + 1 : U_CHAR_CATEGORY_COUNT + 2;
    }

    return cat;
}

static const char *getCharCatName(UChar32 cp) {
    uint8_t cat = getCharCat(cp);




    if (cat >= (sizeof(charCatNames)/sizeof((charCatNames)[0]))) {
        return "unknown";
    } else {
        return charCatNames[cat];
    }
}

static uint16_t getExtName(uint32_t code, char *buffer, uint16_t bufferLength) {
    const char *catname = getCharCatName(code);
    uint16_t length = 0;

    UChar32 cp;
    int ndigits, i;

    { if((bufferLength)>0) { *(buffer)++='<'; --(bufferLength); } ++(length); };
    while (catname[length - 1]) {
        { if((bufferLength)>0) { *(buffer)++=catname[length - 1]; --(bufferLength); } ++(length); };
    }
    { if((bufferLength)>0) { *(buffer)++='-'; --(bufferLength); } ++(length); };
    for (cp = code, ndigits = 0; cp; ++ndigits, cp >>= 4)
        ;
    if (ndigits < 4)
        ndigits = 4;
    for (cp = code, i = ndigits; (cp || i > 0) && bufferLength; cp >>= 4, bufferLength--) {
        uint8_t v = (uint8_t)(cp & 0xf);
        buffer[--i] = (v < 10 ? '0' + v : 'A' + v - 10);
    }
    buffer += ndigits;
    length += ndigits;
    { if((bufferLength)>0) { *(buffer)++='>'; --(bufferLength); } ++(length); };

    return length;
}
# 503 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
static const uint16_t *
getGroup(UCharNames *names, uint32_t code) {
    const uint16_t *groups=(const uint16_t *)((const char *)names+names->groupsOffset);
    uint16_t groupMSB=(uint16_t)(code>>5),
             start=0,
             limit=*groups++,
             number;


    while(start<limit-1) {
        number=(uint16_t)((start+limit)/2);
        if(groupMSB<groups[number*GROUP_LENGTH+GROUP_MSB]) {
            limit=number;
        } else {
            start=number;
        }
    }


    return groups+start*GROUP_LENGTH;
}
# 535 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
static const uint8_t *
expandGroupLengths(const uint8_t *s,
                   uint16_t offsets[(1UL<<5)+1], uint16_t lengths[(1UL<<5)+1]) {

    uint16_t i=0, offset=0, length=0;
    uint8_t lengthByte;


    while(i<(1UL<<5)) {
        lengthByte=*s++;


        if(length>=12) {

            length=(uint16_t)(((length&0x3)<<4|lengthByte>>4)+12);
            lengthByte&=0xf;
        } else if((lengthByte )>=0xc0) {

            length=(uint16_t)((lengthByte&0x3f)+12);
        } else {

            length=(uint16_t)(lengthByte>>4);
            lengthByte&=0xf;
        }

        *offsets++=offset;
        *lengths++=length;

        offset+=length;
        ++i;


        if((lengthByte&0xf0)==0) {

            length=lengthByte;
            if(length<12) {

                *offsets++=offset;
                *lengths++=length;

                offset+=length;
                ++i;
            }
        } else {
            length=0;
        }
    }


    return s;
}

static uint16_t
expandGroupName(UCharNames *names, const uint16_t *group,
                uint16_t lineNumber, UCharNameChoice nameChoice,
                char *buffer, uint16_t bufferLength) {
    uint16_t offsets[(1UL<<5)+2], lengths[(1UL<<5)+2];
    const uint8_t *s=(uint8_t *)names+names->groupStringOffset+((int32_t)(group)[GROUP_OFFSET_HIGH]<<16|(group)[GROUP_OFFSET_LOW]);
    s=expandGroupLengths(s, offsets, lengths);
    return expandName(names, s+offsets[lineNumber], lengths[lineNumber], nameChoice,
                      buffer, bufferLength);
}

static uint16_t
getName(UCharNames *names, uint32_t code, UCharNameChoice nameChoice,
        char *buffer, uint16_t bufferLength) {
    const uint16_t *group=getGroup(names, code);
    if((uint16_t)(code>>5)==group[GROUP_MSB]) {
        return expandGroupName(names, group, (uint16_t)(code&((1UL<<5)-1)), nameChoice,
                               buffer, bufferLength);
    } else {


        if(bufferLength>0) {
            *buffer=0;
        }
        return 0;
    }
}





static UBool
enumGroupNames(UCharNames *names, const uint16_t *group,
               UChar32 start, UChar32 end,
               UEnumCharNamesFn *fn, void *context,
               UCharNameChoice nameChoice) {
    uint16_t offsets[(1UL<<5)+2], lengths[(1UL<<5)+2];
    const uint8_t *s=(uint8_t *)names+names->groupStringOffset+((int32_t)(group)[GROUP_OFFSET_HIGH]<<16|(group)[GROUP_OFFSET_LOW]);

    s=expandGroupLengths(s, offsets, lengths);
    if(fn!=((void *)0)) {
        char buffer[200];
        uint16_t length;

        while(start<=end) {
            length=expandName(names, s+offsets[start&((1UL<<5)-1)], lengths[start&((1UL<<5)-1)], nameChoice, buffer, sizeof(buffer));
            if (!length && nameChoice == U_EXTENDED_CHAR_NAME) {
                buffer[length = getExtName(start, buffer, sizeof(buffer))] = 0;
            }

            if(length>0) {
                if(!fn(context, start, nameChoice, buffer, length)) {
                    return 0;
                }
            }
            ++start;
        }
    } else {
        const char *otherName=((FindName *)context)->otherName;
        while(start<=end) {
            if(compareName(names, s+offsets[start&((1UL<<5)-1)], lengths[start&((1UL<<5)-1)], nameChoice, otherName)) {
                ((FindName *)context)->code=start;
                return 0;
            }
            ++start;
        }
    }
    return 1;
}







static UBool
enumExtNames(UChar32 start, UChar32 end,
             UEnumCharNamesFn *fn, void *context)
{
    if(fn!=((void *)0)) {
        char buffer[200];
        uint16_t length;

        while(start<=end) {
            buffer[length = getExtName(start, buffer, sizeof(buffer))] = 0;

            if(length>0) {
                if(!fn(context, start, U_EXTENDED_CHAR_NAME, buffer, length)) {
                    return 0;
                }
            }
            ++start;
        }
    }

    return 1;
}

static UBool
enumNames(UCharNames *names,
          UChar32 start, UChar32 limit,
          UEnumCharNamesFn *fn, void *context,
          UCharNameChoice nameChoice) {
    uint16_t startGroupMSB, endGroupMSB, groupCount;
    const uint16_t *group, *groupLimit;

    startGroupMSB=(uint16_t)(start>>5);
    endGroupMSB=(uint16_t)((limit-1)>>5);


    group=getGroup(names, start);

    if(startGroupMSB==endGroupMSB) {
        if(startGroupMSB==group[GROUP_MSB]) {

            return enumGroupNames(names, group, start, limit-1, fn, context, nameChoice);
        }
    } else {
        const uint16_t *groups=(const uint16_t *)((const char *)names+names->groupsOffset);
        groupCount=*groups++;
        groupLimit=groups+groupCount*GROUP_LENGTH;

        if(startGroupMSB==group[GROUP_MSB]) {

            if((start&((1UL<<5)-1))!=0) {
                if(!enumGroupNames(names, group,
                                   start, ((UChar32)startGroupMSB<<5)+(1UL<<5)-1,
                                   fn, context, nameChoice)) {
                    return 0;
                }
                group=((group)+GROUP_LENGTH);
            }
        } else if(startGroupMSB>group[GROUP_MSB]) {

            const uint16_t *nextGroup=((group)+GROUP_LENGTH);
            if (nextGroup < groupLimit && nextGroup[GROUP_MSB] > startGroupMSB && nameChoice == U_EXTENDED_CHAR_NAME) {
                UChar32 end = nextGroup[GROUP_MSB] << 5;
                if (end > limit) {
                    end = limit;
                }
                if (!enumExtNames(start, end - 1, fn, context)) {
                    return 0;
                }
            }
            group=nextGroup;
        }


        while(group<groupLimit && group[GROUP_MSB]<endGroupMSB) {
            const uint16_t *nextGroup;
            start=(UChar32)group[GROUP_MSB]<<5;
            if(!enumGroupNames(names, group, start, start+(1UL<<5)-1, fn, context, nameChoice)) {
                return 0;
            }
            nextGroup=((group)+GROUP_LENGTH);
            if (nextGroup < groupLimit && nextGroup[GROUP_MSB] > group[GROUP_MSB] + 1 && nameChoice == U_EXTENDED_CHAR_NAME) {
                UChar32 end = nextGroup[GROUP_MSB] << 5;
                if (end > limit) {
                    end = limit;
                }
                if (!enumExtNames((group[GROUP_MSB] + 1) << 5, end - 1, fn, context)) {
                    return 0;
                }
            }
            group=nextGroup;
        }


        if(group<groupLimit && group[GROUP_MSB]==endGroupMSB) {
            return enumGroupNames(names, group, (limit-1)&~((1UL<<5)-1), limit-1, fn, context, nameChoice);
        } else if (nameChoice == U_EXTENDED_CHAR_NAME && group == groupLimit) {
            UChar32 next = (((group)-GROUP_LENGTH)[GROUP_MSB] + 1) << 5;
            if (next > start) {
                start = next;
            }
        } else {
            return 1;
        }
    }



    if (nameChoice == U_EXTENDED_CHAR_NAME) {
        if (limit > 0x10ffff + 1) {
            limit = 0x10ffff + 1;
        }
        return enumExtNames(start, limit - 1, fn, context);
    }

    return 1;
}

static uint16_t
writeFactorSuffix(const uint16_t *factors, uint16_t count,
                  const char *s,
                  uint32_t code,
                  uint16_t indexes[8],
                  const char *elementBases[8], const char *elements[8],
                  char *buffer, uint16_t bufferLength) {
    uint16_t i, factor, bufferPos=0;
    char c;
# 799 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
    --count;
    for(i=count; i>0; --i) {
        factor=factors[i];
        indexes[i]=(uint16_t)(code%factor);
        code/=factor;
    }




    indexes[0]=(uint16_t)code;


    for(;;) {
        if(elementBases!=((void *)0)) {
            *elementBases++=s;
        }


        factor=indexes[i];
        while(factor>0) {
            while(*s++!=0) {}
            --factor;
        }
        if(elements!=((void *)0)) {
            *elements++=s;
        }


        while((c=*s++)!=0) {
            { if((bufferLength)>0) { *(buffer)++=c; --(bufferLength); } ++(bufferPos); };
        }


        if(i>=count) {
            break;
        }


        factor=(uint16_t)(factors[i]-indexes[i]-1);
        while(factor>0) {
            while(*s++!=0) {}
            --factor;
        }

        ++i;
    }


    if(bufferLength>0) {
        *buffer=0;
    }

    return bufferPos;
}






static uint16_t
getAlgName(AlgorithmicRange *range, uint32_t code, UCharNameChoice nameChoice,
        char *buffer, uint16_t bufferLength) {
    uint16_t bufferPos=0;


    if(nameChoice!=U_UNICODE_CHAR_NAME && nameChoice!=U_EXTENDED_CHAR_NAME) {

        if(bufferLength>0) {
            *buffer=0;
        }
        return 0;
    }

    switch(range->type) {
    case 0: {

        const char *s=(const char *)(range+1);
        char c;

        uint16_t i, count;


        while((c=*s++)!=0) {
            { if((bufferLength)>0) { *(buffer)++=c; --(bufferLength); } ++(bufferPos); };
        }


        count=range->variant;


        if(count<bufferLength) {
            buffer[count]=0;
        }

        for(i=count; i>0;) {
            if(--i<bufferLength) {
                c=(char)(code&0xf);
                if(c<10) {
                    c+='0';
                } else {
                    c+='A'-10;
                }
                buffer[i]=c;
            }
            code>>=4;
        }

        bufferPos+=count;
        break;
    }
    case 1: {

        uint16_t indexes[8];
        const uint16_t *factors=(const uint16_t *)(range+1);
        uint16_t count=range->variant;
        const char *s=(const char *)(factors+count);
        char c;


        while((c=*s++)!=0) {
            { if((bufferLength)>0) { *(buffer)++=c; --(bufferLength); } ++(bufferPos); };
        }

        bufferPos+=writeFactorSuffix(factors, count,
                                     s, code-range->start, indexes, ((void *)0), ((void *)0), buffer, bufferLength);
        break;
    }
    default:


        if(bufferLength>0) {
            *buffer=0;
        }
        break;
    }

    return bufferPos;
}





static UBool
enumAlgNames(AlgorithmicRange *range,
             UChar32 start, UChar32 limit,
             UEnumCharNamesFn *fn, void *context,
             UCharNameChoice nameChoice) {
    char buffer[200];
    uint16_t length;

    if(nameChoice!=U_UNICODE_CHAR_NAME && nameChoice!=U_EXTENDED_CHAR_NAME) {
        return 1;
    }

    switch(range->type) {
    case 0: {
        char *s, *end;
        char c;


        length=getAlgName(range, (uint32_t)start, nameChoice, buffer, sizeof(buffer));
        if(length<=0) {
            return 1;
        }


        if(!fn(context, start, nameChoice, buffer, length)) {
            return 0;
        }


        end=buffer;
        while(*end!=0) {
            ++end;
        }


        while(++start<limit) {

            s=end;
            for (;;) {
                c=*--s;
                if(('0'<=c && c<'9') || ('A'<=c && c<'F')) {
                    *s=(char)(c+1);
                    break;
                } else if(c=='9') {
                    *s='A';
                    break;
                } else if(c=='F') {
                    *s='0';
                }
            }

            if(!fn(context, start, nameChoice, buffer, length)) {
                return 0;
            }
        }
        break;
    }
    case 1: {
        uint16_t indexes[8];
        const char *elementBases[8], *elements[8];
        const uint16_t *factors=(const uint16_t *)(range+1);
        uint16_t count=range->variant;
        const char *s=(const char *)(factors+count);
        char *suffix, *t;
        uint16_t prefixLength, i, idx;

        char c;




        suffix=buffer;
        prefixLength=0;
        while((c=*s++)!=0) {
            *suffix++=c;
            ++prefixLength;
        }


        length=(uint16_t)(prefixLength+writeFactorSuffix(factors, count,
                                              s, (uint32_t)start-range->start,
                                              indexes, elementBases, elements,
                                              suffix, (uint16_t)(sizeof(buffer)-prefixLength)));


        if(!fn(context, start, nameChoice, buffer, length)) {
            return 0;
        }


        while(++start<limit) {

            i=count;
            for (;;) {
                idx=(uint16_t)(indexes[--i]+1);
                if(idx<factors[i]) {

                    indexes[i]=idx;
                    s=elements[i];
                    while(*s++!=0) {
                    }
                    elements[i]=s;
                    break;
                } else {

                    indexes[i]=0;
                    elements[i]=elementBases[i];
                }
            }


            t=suffix;
            length=prefixLength;
            for(i=0; i<count; ++i) {
                s=elements[i];
                while((c=*s++)!=0) {
                    *t++=c;
                    ++length;
                }
            }

            *t=0;

            if(!fn(context, start, nameChoice, buffer, length)) {
                return 0;
            }
        }
        break;
    }
    default:

        break;
    }

    return 1;
}






static UChar32
findAlgName(AlgorithmicRange *range, UCharNameChoice nameChoice, const char *otherName) {
    UChar32 code;

    if(nameChoice!=U_UNICODE_CHAR_NAME && nameChoice!=U_EXTENDED_CHAR_NAME) {
        return 0xffff;
    }

    switch(range->type) {
    case 0: {

        const char *s=(const char *)(range+1);
        char c;

        uint16_t i, count;


        while((c=*s++)!=0) {
            if((char)c!=*otherName++) {
                return 0xffff;
            }
        }


        count=range->variant;
        code=0;
        for(i=0; i<count; ++i) {
            c=*otherName++;
            if('0'<=c && c<='9') {
                code=(code<<4)|(c-'0');
            } else if('A'<=c && c<='F') {
                code=(code<<4)|(c-'A'+10);
            } else {
                return 0xffff;
            }
        }


        if(*otherName==0 && range->start<=(uint32_t)code && (uint32_t)code<=range->end) {
            return code;
        }
        break;
    }
    case 1: {
        char buffer[64];
        uint16_t indexes[8];
        const char *elementBases[8], *elements[8];
        const uint16_t *factors=(const uint16_t *)(range+1);
        uint16_t count=range->variant;
        const char *s=(const char *)(factors+count), *t;
        UChar32 start, limit;
        uint16_t i, idx;

        char c;




        while((c=*s++)!=0) {
            if((char)c!=*otherName++) {
                return 0xffff;
            }
        }

        start=(UChar32)range->start;
        limit=(UChar32)(range->end+1);


        writeFactorSuffix(factors, count, s, 0,
                          indexes, elementBases, elements, buffer, sizeof(buffer));


        if(0== strcmp(otherName, buffer)) {
            return start;
        }


        while(++start<limit) {

            i=count;
            for (;;) {
                idx=(uint16_t)(indexes[--i]+1);
                if(idx<factors[i]) {

                    indexes[i]=idx;
                    s=elements[i];
                    while(*s++!=0) {}
                    elements[i]=s;
                    break;
                } else {

                    indexes[i]=0;
                    elements[i]=elementBases[i];
                }
            }


            t=otherName;
            for(i=0; i<count; ++i) {
                s=elements[i];
                while((c=*s++)!=0) {
                    if(c!=*t++) {
                        s="";
                        i=99;
                    }
                }
            }
            if(i<99 && *t==0) {
                return start;
            }
        }
        break;
    }
    default:

        break;
    }

    return 0xffff;
}






static int32_t
calcStringSetLength(uint32_t set[8], const char *s) {
    int32_t length=0;
    char c;

    while((c=*s++)!=0) {
        ((set)[(uint8_t)c>>5]|=((uint32_t)1<<((uint8_t)c&0x1f)));
        ++length;
    }
    return length;
}

static int32_t
calcAlgNameSetsLengths(int32_t maxNameLength) {
    AlgorithmicRange *range;
    uint32_t *p;
    uint32_t rangeCount;
    int32_t length;


    p=(uint32_t *)((uint8_t *)uCharNames+uCharNames->algNamesOffset);
    rangeCount=*p;
    range=(AlgorithmicRange *)(p+1);
    while(rangeCount>0) {
        switch(range->type) {
        case 0:


            length=calcStringSetLength(gNameSet, (const char *)(range+1))+range->variant;
            if(length>maxNameLength) {
                maxNameLength=length;
            }
            break;
        case 1: {

            const uint16_t *factors=(const uint16_t *)(range+1);
            const char *s;
            int32_t i, count=range->variant, factor, factorLength, maxFactorLength;


            s=(const char *)(factors+count);
            length=calcStringSetLength(gNameSet, s);
            s+=length+1;


            for(i=0; i<count; ++i) {
                maxFactorLength=0;
                for(factor=factors[i]; factor>0; --factor) {
                    factorLength=calcStringSetLength(gNameSet, s);
                    s+=factorLength+1;
                    if(factorLength>maxFactorLength) {
                        maxFactorLength=factorLength;
                    }
                }
                length+=maxFactorLength;
            }

            if(length>maxNameLength) {
                maxNameLength=length;
            }
            break;
        }
        default:

            break;
        }

        range=(AlgorithmicRange *)((uint8_t *)range+range->size);
        --rangeCount;
    }
    return maxNameLength;
}

static int32_t
calcExtNameSetsLengths(int32_t maxNameLength) {
    int32_t i, length;

    for(i=0; i<(sizeof(charCatNames)/sizeof((charCatNames)[0])); ++i) {







        length=9+calcStringSetLength(gNameSet, charCatNames[i]);
        if(length>maxNameLength) {
            maxNameLength=length;
        }
    }
    return maxNameLength;
}

static int32_t
calcNameSetLength(const uint16_t *tokens, uint16_t tokenCount, const uint8_t *tokenStrings, int8_t *tokenLengths,
                  uint32_t set[8],
                  const uint8_t **pLine, const uint8_t *lineLimit) {
    const uint8_t *line=*pLine;
    int32_t length=0, tokenLength;
    uint16_t c, token;

    while(line!=lineLimit && (c=*line++)!=(uint8_t)';') {
        if(c>=tokenCount) {

            ((set)[(uint8_t)c>>5]|=((uint32_t)1<<((uint8_t)c&0x1f)));
            ++length;
        } else {
            token=tokens[c];
            if(token==(uint16_t)(-2)) {

                c=c<<8|*line++;
                token=tokens[c];
            }
            if(token==(uint16_t)(-1)) {

                ((set)[(uint8_t)c>>5]|=((uint32_t)1<<((uint8_t)c&0x1f)));
                ++length;
            } else {

                if(tokenLengths!=((void *)0)) {

                    tokenLength=tokenLengths[c];
                    if(tokenLength==0) {
                        tokenLength=calcStringSetLength(set, (const char *)tokenStrings+token);
                        tokenLengths[c]=(int8_t)tokenLength;
                    }
                } else {
                    tokenLength=calcStringSetLength(set, (const char *)tokenStrings+token);
                }
                length+=tokenLength;
            }
        }
    }

    *pLine=line;
    return length;
}

static void
calcGroupNameSetsLengths(int32_t maxNameLength) {
    uint16_t offsets[(1UL<<5)+2], lengths[(1UL<<5)+2];

    uint16_t *tokens=(uint16_t *)uCharNames+8;
    uint16_t tokenCount=*tokens++;
    uint8_t *tokenStrings=(uint8_t *)uCharNames+uCharNames->tokenStringOffset;

    int8_t *tokenLengths;

    const uint16_t *group;
    const uint8_t *s, *line, *lineLimit;

    int32_t groupCount, lineNumber, length;

    tokenLengths=(int8_t *)uprv_malloc_48(tokenCount);
    if(tokenLengths!=((void *)0)) {
        memset(tokenLengths, 0, tokenCount);
    }

    group=(const uint16_t *)((const char *)uCharNames+uCharNames->groupsOffset);
    groupCount=*group++;


    while(groupCount>0) {
        s=(uint8_t *)uCharNames+uCharNames->groupStringOffset+((int32_t)(group)[GROUP_OFFSET_HIGH]<<16|(group)[GROUP_OFFSET_LOW]);
        s=expandGroupLengths(s, offsets, lengths);


        for(lineNumber=0; lineNumber<(1UL<<5); ++lineNumber) {
            line=s+offsets[lineNumber];
            length=lengths[lineNumber];
            if(length==0) {
                continue;
            }

            lineLimit=line+length;


            length=calcNameSetLength(tokens, tokenCount, tokenStrings, tokenLengths, gNameSet, &line, lineLimit);
            if(length>maxNameLength) {
                maxNameLength=length;
            }
            if(line==lineLimit) {
                continue;
            }


            length=calcNameSetLength(tokens, tokenCount, tokenStrings, tokenLengths, gNameSet, &line, lineLimit);
            if(length>maxNameLength) {
                maxNameLength=length;
            }
            if(line==lineLimit) {
                continue;
            }



        }

        group=((group)+GROUP_LENGTH);
        --groupCount;
    }

    if(tokenLengths!=((void *)0)) {
        uprv_free_48(tokenLengths);
    }


    gMaxNameLength=maxNameLength;
}

static UBool
calcNameSetsLengths(UErrorCode *pErrorCode) {
    static const char extChars[]="0123456789ABCDEF<>-";
    int32_t i, maxNameLength;

    if(gMaxNameLength!=0) {
        return 1;
    }

    if(!isDataLoaded(pErrorCode)) {
        return 0;
    }


    for(i=0; i<sizeof(extChars)-1; ++i) {
        ((gNameSet)[(uint8_t)extChars[i]>>5]|=((uint32_t)1<<((uint8_t)extChars[i]&0x1f)));
    }


    maxNameLength=calcAlgNameSetsLengths(0);


    maxNameLength=calcExtNameSetsLengths(maxNameLength);


    calcGroupNameSetsLengths(maxNameLength);

    return 1;
}



extern int32_t
u_charName_48(UChar32 code, UCharNameChoice nameChoice,
           char *buffer, int32_t bufferLength,
           UErrorCode *pErrorCode) {
    AlgorithmicRange *algRange;
    uint32_t *p;
    uint32_t i;
    int32_t length;


    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return 0;
    } else if(nameChoice>=U_CHAR_NAME_CHOICE_COUNT ||
              bufferLength<0 || (bufferLength>0 && buffer==((void *)0))
    ) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }

    if((uint32_t)code>0x10ffff || !isDataLoaded(pErrorCode)) {
        return u_terminateChars_48(buffer, bufferLength, 0, pErrorCode);
    }

    length=0;


    p=(uint32_t *)((uint8_t *)uCharNames+uCharNames->algNamesOffset);
    i=*p;
    algRange=(AlgorithmicRange *)(p+1);
    while(i>0) {
        if(algRange->start<=(uint32_t)code && (uint32_t)code<=algRange->end) {
            length=getAlgName(algRange, (uint32_t)code, nameChoice, buffer, (uint16_t)bufferLength);
            break;
        }
        algRange=(AlgorithmicRange *)((uint8_t *)algRange+algRange->size);
        --i;
    }

    if(i==0) {
        if (nameChoice == U_EXTENDED_CHAR_NAME) {
            length = getName(uCharNames, (uint32_t )code, U_EXTENDED_CHAR_NAME, buffer, (uint16_t) bufferLength);
            if (!length) {

                length = getExtName((uint32_t) code, buffer, (uint16_t) bufferLength);
            }
        } else {

            length=getName(uCharNames, (uint32_t)code, nameChoice, buffer, (uint16_t)bufferLength);
        }
    }

    return u_terminateChars_48(buffer, bufferLength, length, pErrorCode);
}

extern int32_t
u_getISOComment_48(UChar32 c,
                char *dest, int32_t destCapacity,
                UErrorCode *pErrorCode) {
    int32_t length;


    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return 0;
    } else if(destCapacity<0 || (destCapacity>0 && dest==((void *)0))) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }

    if((uint32_t)c>0x10ffff || !isDataLoaded(pErrorCode)) {
        return u_terminateChars_48(dest, destCapacity, 0, pErrorCode);
    }


    length=getName(uCharNames, (uint32_t)c, U_CHAR_NAME_CHOICE_COUNT, dest, (uint16_t)destCapacity);
    return u_terminateChars_48(dest, destCapacity, length, pErrorCode);
}

extern UChar32
u_charFromName_48(UCharNameChoice nameChoice,
               const char *name,
               UErrorCode *pErrorCode) {
    char upper[120], lower[120];
    FindName findName;
    AlgorithmicRange *algRange;
    uint32_t *p;
    uint32_t i;
    UChar32 cp = 0;
    char c0;
    UChar32 error = 0xffff;

    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return error;
    }

    if(nameChoice>=U_CHAR_NAME_CHOICE_COUNT || name==((void *)0) || *name==0) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return error;
    }

    if(!isDataLoaded(pErrorCode)) {
        return error;
    }


    for(i=0; i<sizeof(upper); ++i) {
        if((c0=*name++)!=0) {
            upper[i]=uprv_toupper_48(c0);
            lower[i]=uprv_asciitolower_48(c0);
        } else {
            upper[i]=lower[i]=0;
            break;
        }
    }
    if(i==sizeof(upper)) {

        *pErrorCode = U_ILLEGAL_CHAR_FOUND;
        return error;
    }


    if (lower[0] == '<') {
        if (nameChoice == U_EXTENDED_CHAR_NAME) {
            if (lower[--i] == '>') {
                for (--i; lower[i] && lower[i] != '-'; --i) {
                }

                if (lower[i] == '-') {
                    uint32_t cIdx;

                    lower[i] = 0;

                    for (++i; lower[i] != '>'; ++i) {
                        if (lower[i] >= '0' && lower[i] <= '9') {
                            cp = (cp << 4) + lower[i] - '0';
                        } else if (lower[i] >= 'a' && lower[i] <= 'f') {
                            cp = (cp << 4) + lower[i] - 'a' + 10;
                        } else {
                            *pErrorCode = U_ILLEGAL_CHAR_FOUND;
                            return error;
                        }
                    }





                    for (lower[i] = 0, cIdx = 0; cIdx < (sizeof(charCatNames)/sizeof((charCatNames)[0])); ++cIdx) {

                        if (! strcmp(lower + 1, charCatNames[cIdx])) {
                            if (getCharCat(cp) == cIdx) {
                                return cp;
                            }
                            break;
                        }
                    }
                }
            }
        }

        *pErrorCode = U_ILLEGAL_CHAR_FOUND;
        return error;
    }


    p=(uint32_t *)((uint8_t *)uCharNames+uCharNames->algNamesOffset);
    i=*p;
    algRange=(AlgorithmicRange *)(p+1);
    while(i>0) {
        if((cp=findAlgName(algRange, nameChoice, upper))!=0xffff) {
            return cp;
        }
        algRange=(AlgorithmicRange *)((uint8_t *)algRange+algRange->size);
        --i;
    }


    findName.otherName=upper;
    findName.code=error;
    enumNames(uCharNames, 0, 0x10ffff + 1, ((void *)0), &findName, nameChoice);
    if (findName.code == error) {
         *pErrorCode = U_ILLEGAL_CHAR_FOUND;
    }
    return findName.code;
}

extern void
u_enumCharNames_48(UChar32 start, UChar32 limit,
                UEnumCharNamesFn *fn,
                void *context,
                UCharNameChoice nameChoice,
                UErrorCode *pErrorCode) {
    AlgorithmicRange *algRange;
    uint32_t *p;
    uint32_t i;

    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return;
    }

    if(nameChoice>=U_CHAR_NAME_CHOICE_COUNT || fn==((void *)0)) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }

    if((uint32_t) limit > 0x10ffff + 1) {
        limit = 0x10ffff + 1;
    }
    if((uint32_t)start>=(uint32_t)limit) {
        return;
    }

    if(!isDataLoaded(pErrorCode)) {
        return;
    }



    p=(uint32_t *)((uint8_t *)uCharNames+uCharNames->algNamesOffset);
    i=*p;
    algRange=(AlgorithmicRange *)(p+1);
    while(i>0) {


        if((uint32_t)start<algRange->start) {
            if((uint32_t)limit<=algRange->start) {
                enumNames(uCharNames, start, limit, fn, context, nameChoice);
                return;
            }
            if(!enumNames(uCharNames, start, (UChar32)algRange->start, fn, context, nameChoice)) {
                return;
            }
            start=(UChar32)algRange->start;
        }


        if((uint32_t)start<=algRange->end) {
            if((uint32_t)limit<=(algRange->end+1)) {
                enumAlgNames(algRange, start, limit, fn, context, nameChoice);
                return;
            }
            if(!enumAlgNames(algRange, start, (UChar32)algRange->end+1, fn, context, nameChoice)) {
                return;
            }
            start=(UChar32)algRange->end+1;
        }

        algRange=(AlgorithmicRange *)((uint8_t *)algRange+algRange->size);
        --i;
    }

    enumNames(uCharNames, start, limit, fn, context, nameChoice);
}

extern int32_t
uprv_getMaxCharNameLength_48() {
    UErrorCode errorCode=U_ZERO_ERROR;
    if(calcNameSetsLengths(&errorCode)) {
        return gMaxNameLength;
    } else {
        return 0;
    }
}






static void
charSetToUSet(uint32_t cset[8], const USetAdder *sa) {
    UChar us[256];
    char cs[256];

    int32_t i, length;
    UErrorCode errorCode;

    errorCode=U_ZERO_ERROR;

    if(!calcNameSetsLengths(&errorCode)) {
        return;
    }


    length=0;
    for(i=0; i<256; ++i) {
        if((((cset)[(uint8_t)i>>5]&((uint32_t)1<<((uint8_t)i&0x1f)))!=0)) {
            cs[length++]=(char)i;
        }
    }


    u_charsToUChars_48(cs, us, length);


    for(i=0; i<length; ++i) {
        if(us[i]!=0 || cs[i]==0) {
            sa->add(sa->set, us[i]);
        }
    }
}





extern void
uprv_getCharNameCharacters_48(const USetAdder *sa) {
    charSetToUSet(gNameSet, sa);
}
# 1777 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unames.c"
static void
makeTokenMap(const UDataSwapper *ds,
             int16_t tokens[], uint16_t tokenCount,
             uint8_t map[256],
             UErrorCode *pErrorCode) {
    UBool usedOutChar[256];
    uint16_t i, j;
    uint8_t c1, c2;

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return;
    }

    if(ds->inCharset==ds->outCharset) {

        for(i=0; i<256; ++i) {
            map[i]=(uint8_t)i;
        }
    } else {
        memset(map, 0, 256);
        memset(usedOutChar, 0, 256);

        if(tokenCount>256) {
            tokenCount=256;
        }


        for(i=1; i<tokenCount; ++i) {
            if(tokens[i]==-1) {

                c1=(uint8_t)i;
                ds->swapInvChars(ds, &c1, 1, &c2, pErrorCode);
                if(((*pErrorCode)>U_ZERO_ERROR)) {
                    udata_printError_48(ds, "unames/makeTokenMap() finds variant character 0x%02x used (input charset family %d)\n",
                                     i, ds->inCharset);
                    return;
                }


                map[c1]=c2;
                usedOutChar[c2]=1;
            }
        }


        for(i=j=1; i<tokenCount; ++i) {

            if(map[i]==0) {

                while(usedOutChar[j]) {
                    ++j;
                }
                map[i]=(uint8_t)j++;
            }
        }





    }
}

extern int32_t
uchar_swapNames_48(const UDataSwapper *ds,
                const void *inData, int32_t length, void *outData,
                UErrorCode *pErrorCode) {
    const UDataInfo *pInfo;
    int32_t headerSize;

    const uint8_t *inBytes;
    uint8_t *outBytes;

    uint32_t tokenStringOffset, groupsOffset, groupStringOffset, algNamesOffset,
             offset, i, count, stringsCount;

    const AlgorithmicRange *inRange;
    AlgorithmicRange *outRange;


    headerSize=udata_swapDataHeader_48(ds, inData, length, outData, pErrorCode);
    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return 0;
    }


    pInfo=(const UDataInfo *)((const char *)inData+4);
    if(!(
        pInfo->dataFormat[0]==0x75 &&
        pInfo->dataFormat[1]==0x6e &&
        pInfo->dataFormat[2]==0x61 &&
        pInfo->dataFormat[3]==0x6d &&
        pInfo->formatVersion[0]==1
    )) {
        udata_printError_48(ds, "uchar_swapNames(): data format %02x.%02x.%02x.%02x (format version %02x) is not recognized as unames.icu\n",
                         pInfo->dataFormat[0], pInfo->dataFormat[1],
                         pInfo->dataFormat[2], pInfo->dataFormat[3],
                         pInfo->formatVersion[0]);
        *pErrorCode=U_UNSUPPORTED_ERROR;
        return 0;
    }

    inBytes=(const uint8_t *)inData+headerSize;
    outBytes=(uint8_t *)outData+headerSize;
    if(length<0) {
        algNamesOffset=ds->readUInt32(((const uint32_t *)inBytes)[3]);
    } else {
        length-=headerSize;
        if( length<20 ||
            (uint32_t)length<(algNamesOffset=ds->readUInt32(((const uint32_t *)inBytes)[3]))
        ) {
            udata_printError_48(ds, "uchar_swapNames(): too few bytes (%d after header) for unames.icu\n",
                             length);
            *pErrorCode=U_INDEX_OUTOFBOUNDS_ERROR;
            return 0;
        }
    }

    if(length<0) {

        offset=algNamesOffset;
        count=ds->readUInt32(*((const uint32_t *)(inBytes+offset)));
        offset+=4;

        for(i=0; i<count; ++i) {
            inRange=(const AlgorithmicRange *)(inBytes+offset);
            offset+=ds->readUInt16(inRange->size);
        }
    } else {

        const uint16_t *p;
        uint16_t *q, *temp;

        int16_t tokens[512];
        uint16_t tokenCount;

        uint8_t map[256], trailMap[256];


        if(inBytes!=outBytes) {
            memcpy(outBytes, inBytes, length);
        }


        tokenStringOffset=ds->readUInt32(((const uint32_t *)inBytes)[0]);
        groupsOffset=ds->readUInt32(((const uint32_t *)inBytes)[1]);
        groupStringOffset=ds->readUInt32(((const uint32_t *)inBytes)[2]);
        ds->swapArray32(ds, inBytes, 16, outBytes, pErrorCode);





        p=(const uint16_t *)(inBytes+16);
        q=(uint16_t *)(outBytes+16);


        tokenCount=ds->readUInt16(*p);
        ds->swapArray16(ds, p, 2, q, pErrorCode);
        ++p;
        ++q;


        if(tokenCount<=512) {
            count=tokenCount;
        } else {
            count=512;
        }
        for(i=0; i<count; ++i) {
            tokens[i]=udata_readInt16_48(ds, p[i]);
        }
        for(; i<512; ++i) {
            tokens[i]=0;
        }
        makeTokenMap(ds, tokens, tokenCount, map, pErrorCode);
        makeTokenMap(ds, tokens+256, (uint16_t)(tokenCount>256 ? tokenCount-256 : 0), trailMap, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            return 0;
        }





        temp=(uint16_t *)uprv_malloc_48(tokenCount*2);
        if(temp==((void *)0)) {
            udata_printError_48(ds, "out of memory swapping %u unames.icu tokens\n",
                             tokenCount);
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
            return 0;
        }


        for(i=0; i<tokenCount && i<256; ++i) {
            ds->swapArray16(ds, p+i, 2, temp+map[i], pErrorCode);
        }


        for(; i<tokenCount; ++i) {
            ds->swapArray16(ds, p+i, 2, temp+(i&0xffffff00)+trailMap[i&0xff], pErrorCode);
        }


        memcpy(q, temp, tokenCount*2);
        uprv_free_48(temp);





        udata_swapInvStringBlock_48(ds, inBytes+tokenStringOffset, (int32_t)(groupsOffset-tokenStringOffset),
                                    outBytes+tokenStringOffset, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            udata_printError_48(ds, "uchar_swapNames(token strings) failed\n");
            return 0;
        }


        count=ds->readUInt16(*((const uint16_t *)(inBytes+groupsOffset)));
        ds->swapArray16(ds, inBytes+groupsOffset, (int32_t)((1+count*3)*2),
                           outBytes+groupsOffset, pErrorCode);





        if(ds->inCharset!=ds->outCharset) {
            uint16_t offsets[(1UL<<5)+1], lengths[(1UL<<5)+1];

            const uint8_t *inStrings, *nextInStrings;
            uint8_t *outStrings;

            uint8_t c;

            inStrings=inBytes+groupStringOffset;
            outStrings=outBytes+groupStringOffset;

            stringsCount=algNamesOffset-groupStringOffset;


            while(stringsCount>32) {
                nextInStrings=expandGroupLengths(inStrings, offsets, lengths);


                stringsCount-=(uint32_t)(nextInStrings-inStrings);
                outStrings+=nextInStrings-inStrings;
                inStrings=nextInStrings;

                count=offsets[31]+lengths[31];
                stringsCount-=count;


                while(count>0) {
                    c=*inStrings++;
                    *outStrings++=map[c];
                    if(tokens[c]!=-2) {
                        --count;
                    } else {

                        *outStrings++=trailMap[*inStrings++];
                        count-=2;
                    }
                }
            }
        }


        offset=algNamesOffset;
        count=ds->readUInt32(*((const uint32_t *)(inBytes+offset)));
        ds->swapArray32(ds, inBytes+offset, 4, outBytes+offset, pErrorCode);
        offset+=4;

        for(i=0; i<count; ++i) {
            if(offset>(uint32_t)length) {
                udata_printError_48(ds, "uchar_swapNames(): too few bytes (%d after header) for unames.icu algorithmic range %u\n",
                                 length, i);
                *pErrorCode=U_INDEX_OUTOFBOUNDS_ERROR;
                return 0;
            }

            inRange=(const AlgorithmicRange *)(inBytes+offset);
            outRange=(AlgorithmicRange *)(outBytes+offset);
            offset+=ds->readUInt16(inRange->size);

            ds->swapArray32(ds, inRange, 8, outRange, pErrorCode);
            ds->swapArray16(ds, &inRange->size, 2, &outRange->size, pErrorCode);
            switch(inRange->type) {
            case 0:

                ds->swapInvChars(ds, inRange+1, (int32_t) strlen((const char *)(inRange+1)),
                                    outRange+1, pErrorCode);
                if(((*pErrorCode)>U_ZERO_ERROR)) {
                    udata_printError_48(ds, "uchar_swapNames(prefix string of algorithmic range %u) failed\n",
                                     i);
                    return 0;
                }
                break;
            case 1:
                {

                    uint32_t factorsCount;

                    factorsCount=inRange->variant;
                    p=(const uint16_t *)(inRange+1);
                    q=(uint16_t *)(outRange+1);
                    ds->swapArray16(ds, p, (int32_t)(factorsCount*2), q, pErrorCode);


                    p+=factorsCount;
                    q+=factorsCount;
                    stringsCount=(uint32_t)((inBytes+offset)-(const uint8_t *)p);
                    while(stringsCount>0 && ((const uint8_t *)p)[stringsCount-1]!=0) {
                        --stringsCount;
                    }
                    ds->swapInvChars(ds, p, (int32_t)stringsCount, q, pErrorCode);
                }
                break;
            default:
                udata_printError_48(ds, "uchar_swapNames(): unknown type %u of algorithmic range %u\n",
                                 inRange->type, i);
                *pErrorCode=U_UNSUPPORTED_ERROR;
                return 0;
            }
        }
    }

    return headerSize+(int32_t)offset;
}
