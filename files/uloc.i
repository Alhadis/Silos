# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
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
# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h" 1
# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
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
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h" 2
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

# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h" 2




    typedef struct UBreakIterator UBreakIterator;
# 85 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strlen_48(const UChar *s);
# 102 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_countChar32_48(const UChar *s, int32_t length);
# 123 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UBool
u_strHasMoreChar32Than_48(const UChar *s, int32_t length, int32_t number);
# 136 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strcat_48(UChar *dst,
    const UChar *src);
# 154 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strncat_48(UChar *dst,
     const UChar *src,
     int32_t n);
# 179 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strstr_48(const UChar *s, const UChar *substring);
# 203 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strFindFirst_48(const UChar *s, int32_t length, const UChar *substring, int32_t subLength);
# 223 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strchr_48(const UChar *s, UChar c);
# 243 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strchr32_48(const UChar *s, UChar32 c);
# 266 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strrstr_48(const UChar *s, const UChar *substring);
# 290 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strFindLast_48(const UChar *s, int32_t length, const UChar *substring, int32_t subLength);
# 310 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strrchr_48(const UChar *s, UChar c);
# 330 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strrchr32_48(const UChar *s, UChar32 c);
# 345 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strpbrk_48(const UChar *string, const UChar *matchSet);
# 361 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strcspn_48(const UChar *string, const UChar *matchSet);
# 377 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strspn_48(const UChar *string, const UChar *matchSet);
# 405 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strtok_r_48(UChar *src,
     const UChar *delim,
           UChar **saveState);
# 420 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strcmp_48(const UChar *s1,
         const UChar *s2);
# 435 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strcmpCodePointOrder_48(const UChar *s1, const UChar *s2);
# 465 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strCompare_48(const UChar *s1, int32_t length1,
             const UChar *s2, int32_t length2,
             UBool codePointOrder);
# 490 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strCompareIter_48(UCharIterator *iter1, UCharIterator *iter2, UBool codePointOrder);
# 543 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strCaseCompare_48(const UChar *s1, int32_t length1,
                 const UChar *s2, int32_t length2,
                 uint32_t options,
                 UErrorCode *pErrorCode);
# 561 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strncmp_48(const UChar *ucs1,
     const UChar *ucs2,
     int32_t n);
# 579 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strncmpCodePointOrder_48(const UChar *s1, const UChar *s2, int32_t n);
# 601 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strcasecmp_48(const UChar *s1, const UChar *s2, uint32_t options);
# 625 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strncasecmp_48(const UChar *s1, const UChar *s2, int32_t n, uint32_t options);
# 649 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_memcasecmp_48(const UChar *s1, const UChar *s2, int32_t length, uint32_t options);
# 660 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strcpy_48(UChar *dst,
    const UChar *src);
# 675 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strncpy_48(UChar *dst,
     const UChar *src,
     int32_t n);
# 692 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar* u_uastrcpy_48(UChar *dst,
               const char *src );
# 707 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar* u_uastrncpy_48(UChar *dst,
            const char *src,
            int32_t n);
# 721 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern char* u_austrcpy_48(char *dst,
            const UChar *src );
# 736 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern char* u_austrncpy_48(char *dst,
            const UChar *src,
            int32_t n );
# 750 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memcpy_48(UChar *dest, const UChar *src, int32_t count);
# 761 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memmove_48(UChar *dest, const UChar *src, int32_t count);
# 773 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memset_48(UChar *dest, UChar c, int32_t count);
# 787 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_memcmp_48(const UChar *buf1, const UChar *buf2, int32_t count);
# 803 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_memcmpCodePointOrder_48(const UChar *s1, const UChar *s2, int32_t count);
# 823 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memchr_48(const UChar *s, UChar c, int32_t count);
# 843 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memchr32_48(const UChar *s, UChar32 c, int32_t count);
# 863 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memrchr_48(const UChar *s, UChar c, int32_t count);
# 883 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_memrchr32_48(const UChar *s, UChar32 c, int32_t count);
# 1001 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_unescape_48(const char *src,
           UChar *dest, int32_t destCapacity);


# 1018 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
typedef UChar ( *UNESCAPE_CHAR_AT)(int32_t offset, void *context);

# 1049 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar32
u_unescapeAt_48(UNESCAPE_CHAR_AT charAt,
             int32_t *offset,
             int32_t length,
             void *context);
# 1075 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strToUpper_48(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             const char *locale,
             UErrorCode *pErrorCode);
# 1101 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strToLower_48(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             const char *locale,
             UErrorCode *pErrorCode);
# 1147 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strToTitle_48(UChar *dest, int32_t destCapacity,
             const UChar *src, int32_t srcLength,
             UBreakIterator *titleIter,
             const char *locale,
             UErrorCode *pErrorCode);
# 1178 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern int32_t
u_strFoldCase_48(UChar *dest, int32_t destCapacity,
              const UChar *src, int32_t srcLength,
              uint32_t options,
              UErrorCode *pErrorCode);
# 1207 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern wchar_t*
u_strToWCS_48(wchar_t *dest,
           int32_t destCapacity,
           int32_t *pDestLength,
           const UChar *src,
           int32_t srcLength,
           UErrorCode *pErrorCode);
# 1236 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strFromWCS_48(UChar *dest,
             int32_t destCapacity,
             int32_t *pDestLength,
             const wchar_t *src,
             int32_t srcLength,
             UErrorCode *pErrorCode);
# 1267 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern char*
u_strToUTF8_48(char *dest,
            int32_t destCapacity,
            int32_t *pDestLength,
            const UChar *src,
            int32_t srcLength,
            UErrorCode *pErrorCode);
# 1297 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strFromUTF8_48(UChar *dest,
              int32_t destCapacity,
              int32_t *pDestLength,
              const char *src,
              int32_t srcLength,
              UErrorCode *pErrorCode);
# 1341 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern char*
u_strToUTF8WithSub_48(char *dest,
            int32_t destCapacity,
            int32_t *pDestLength,
            const UChar *src,
            int32_t srcLength,
            UChar32 subchar, int32_t *pNumSubstitutions,
            UErrorCode *pErrorCode);
# 1387 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strFromUTF8WithSub_48(UChar *dest,
              int32_t destCapacity,
              int32_t *pDestLength,
              const char *src,
              int32_t srcLength,
              UChar32 subchar, int32_t *pNumSubstitutions,
              UErrorCode *pErrorCode);
# 1447 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar *
u_strFromUTF8Lenient_48(UChar *dest,
                     int32_t destCapacity,
                     int32_t *pDestLength,
                     const char *src,
                     int32_t srcLength,
                     UErrorCode *pErrorCode);
# 1477 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar32*
u_strToUTF32_48(UChar32 *dest,
             int32_t destCapacity,
             int32_t *pDestLength,
             const UChar *src,
             int32_t srcLength,
             UErrorCode *pErrorCode);
# 1507 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strFromUTF32_48(UChar *dest,
               int32_t destCapacity,
               int32_t *pDestLength,
               const UChar32 *src,
               int32_t srcLength,
               UErrorCode *pErrorCode);
# 1551 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar32*
u_strToUTF32WithSub_48(UChar32 *dest,
             int32_t destCapacity,
             int32_t *pDestLength,
             const UChar *src,
             int32_t srcLength,
             UChar32 subchar, int32_t *pNumSubstitutions,
             UErrorCode *pErrorCode);
# 1596 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strFromUTF32WithSub_48(UChar *dest,
               int32_t destCapacity,
               int32_t *pDestLength,
               const UChar32 *src,
               int32_t srcLength,
               UChar32 subchar, int32_t *pNumSubstitutions,
               UErrorCode *pErrorCode);
# 1637 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern char*
u_strToJavaModifiedUTF8_48(
        char *dest,
        int32_t destCapacity,
        int32_t *pDestLength,
        const UChar *src,
        int32_t srcLength,
        UErrorCode *pErrorCode);
# 1686 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ustring.h"
extern UChar*
u_strFromJavaModifiedUTF8WithSub_48(
        UChar *dest,
        int32_t destCapacity,
        int32_t *pDestLength,
        const char *src,
        int32_t srcLength,
        UChar32 subchar, int32_t *pNumSubstitutions,
        UErrorCode *pErrorCode);
# 33 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h" 1
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/localpointer.h" 1
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h" 2
# 37 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
struct UEnumeration;

typedef struct UEnumeration UEnumeration;
# 48 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
extern void
uenum_close_48(UEnumeration* en);
# 84 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
extern int32_t
uenum_count_48(UEnumeration* en, UErrorCode* status);
# 108 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
extern const UChar*
uenum_unext_48(UEnumeration* en,
            int32_t* resultLength,
            UErrorCode* status);
# 141 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
extern const char*
uenum_next_48(UEnumeration* en,
           int32_t* resultLength,
           UErrorCode* status);
# 155 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h"
extern void
uenum_reset_48(UEnumeration* en, UErrorCode* status);
# 26 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h" 2
# 336 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
typedef enum {



  ULOC_ACTUAL_LOCALE = 0,



  ULOC_VALID_LOCALE = 1,





  ULOC_REQUESTED_LOCALE = 2,


  ULOC_DATA_LOCALE_TYPE_LIMIT = 3
} ULocDataLocaleType ;
# 368 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern const char*
uloc_getDefault_48(void);
# 388 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern void
uloc_setDefault_48(const char* localeID,
        UErrorCode* status);
# 404 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getLanguage_48(const char* localeID,
         char* language,
         int32_t languageCapacity,
         UErrorCode* err);
# 422 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getScript_48(const char* localeID,
         char* script,
         int32_t scriptCapacity,
         UErrorCode* err);
# 440 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getCountry_48(const char* localeID,
        char* country,
        int32_t countryCapacity,
        UErrorCode* err);
# 458 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getVariant_48(const char* localeID,
        char* variant,
        int32_t variantCapacity,
        UErrorCode* err);
# 481 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getName_48(const char* localeID,
         char* name,
         int32_t nameCapacity,
         UErrorCode* err);
# 504 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_canonicalize_48(const char* localeID,
         char* name,
         int32_t nameCapacity,
         UErrorCode* err);
# 517 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern const char*
uloc_getISO3Language_48(const char* localeID);
# 528 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern const char*
uloc_getISO3Country_48(const char* localeID);
# 539 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern uint32_t
uloc_getLCID_48(const char* localeID);
# 558 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayLanguage_48(const char* locale,
            const char* displayLocale,
            UChar* language,
            int32_t languageCapacity,
            UErrorCode* status);
# 581 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayScript_48(const char* locale,
            const char* displayLocale,
            UChar* script,
            int32_t scriptCapacity,
            UErrorCode* status);
# 604 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayCountry_48(const char* locale,
                       const char* displayLocale,
                       UChar* country,
                       int32_t countryCapacity,
                       UErrorCode* status);
# 628 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayVariant_48(const char* locale,
                       const char* displayLocale,
                       UChar* variant,
                       int32_t variantCapacity,
                       UErrorCode* status);
# 675 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayKeyword_48(const char* keyword,
                       const char* displayLocale,
                       UChar* dest,
                       int32_t destCapacity,
                       UErrorCode* status);
# 701 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayKeywordValue_48( const char* locale,
                               const char* keyword,
                               const char* displayLocale,
                               UChar* dest,
                               int32_t destCapacity,
                               UErrorCode* status);
# 724 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getDisplayName_48(const char* localeID,
            const char* inLocaleID,
            UChar* result,
            int32_t maxResultSize,
            UErrorCode* err);
# 742 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern const char*
uloc_getAvailable_48(int32_t n);







extern int32_t uloc_countAvailable_48(void);
# 762 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern const char* const*
uloc_getISOLanguages_48(void);
# 774 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern const char* const*
uloc_getISOCountries_48(void);
# 790 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getParent_48(const char* localeID,
                 char* parent,
                 int32_t parentCapacity,
                 UErrorCode* err);
# 818 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getBaseName_48(const char* localeID,
         char* name,
         int32_t nameCapacity,
         UErrorCode* err);
# 833 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern UEnumeration*
uloc_openKeywords_48(const char* localeID,
                        UErrorCode* status);
# 848 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getKeywordValue_48(const char* localeID,
                     const char* keywordName,
                     char* buffer, int32_t bufferCapacity,
                     UErrorCode* status);
# 874 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_setKeywordValue_48(const char* keywordName,
                     const char* keywordValue,
                     char* buffer, int32_t bufferCapacity,
                     UErrorCode* status);






typedef enum {
  ULOC_LAYOUT_LTR = 0,
  ULOC_LAYOUT_RTL = 1,
  ULOC_LAYOUT_TTB = 2,
  ULOC_LAYOUT_BTT = 3,
  ULOC_LAYOUT_UNKNOWN
} ULayoutType;
# 901 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern ULayoutType
uloc_getCharacterOrientation_48(const char* localeId,
                             UErrorCode *status);
# 913 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern ULayoutType
uloc_getLineOrientation_48(const char* localeId,
                        UErrorCode *status);







typedef enum {
  ULOC_ACCEPT_FAILED = 0,
  ULOC_ACCEPT_VALID = 1,
  ULOC_ACCEPT_FALLBACK = 2


} UAcceptResult;
# 944 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_acceptLanguageFromHTTP_48(char *result, int32_t resultAvailable,
                            UAcceptResult *outResult,
                            const char *httpAcceptLanguage,
                            UEnumeration* availableLocales,
                            UErrorCode *status);
# 964 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_acceptLanguage_48(char *result, int32_t resultAvailable,
                    UAcceptResult *outResult, const char **acceptList,
                    int32_t acceptListCount,
                    UEnumeration* availableLocales,
                    UErrorCode *status);
# 984 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_getLocaleForLCID_48(uint32_t hostID, char *locale, int32_t localeCapacity,
                    UErrorCode *status);
# 1022 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_addLikelySubtags_48(const char* localeID,
         char* maximizedLocaleID,
         int32_t maximizedLocaleIDCapacity,
         UErrorCode* err);
# 1062 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_minimizeSubtags_48(const char* localeID,
         char* minimizedLocaleID,
         int32_t minimizedLocaleIDCapacity,
         UErrorCode* err);
# 1091 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_forLanguageTag_48(const char* langtag,
                    char* localeID,
                    int32_t localeIDCapacity,
                    int32_t* parsedLength,
                    UErrorCode* err);
# 1119 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
extern int32_t
uloc_toLanguageTag_48(const char* localeID,
                   char* langtag,
                   int32_t langtagCapacity,
                   UBool strict,
                   UErrorCode* err);
# 34 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2

# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h" 1
# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/putil.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h" 2
# 36 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
extern UBool uprv_isNaN_48(double d);




extern UBool uprv_isInfinite_48(double d);




extern UBool uprv_isPositiveInfinity_48(double d);




extern UBool uprv_isNegativeInfinity_48(double d);




extern double uprv_getNaN_48(void);




extern double uprv_getInfinity_48(void);





extern double uprv_trunc_48(double d);




extern double uprv_floor_48(double d);




extern double uprv_ceil_48(double d);




extern double uprv_fabs_48(double d);




extern double uprv_modf_48(double d, double* pinteger);




extern double uprv_fmod_48(double d, double y);




extern double uprv_pow_48(double d, double exponent);




extern double uprv_pow10_48(int32_t exponent);




extern double uprv_fmax_48(double d, double y);




extern double uprv_fmin_48(double d, double y);




extern int32_t uprv_max_48(int32_t d, int32_t y);




extern int32_t uprv_min_48(int32_t d, int32_t y);
# 135 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
extern double uprv_maxMantissa_48(void);





extern double uprv_log_48(double d);







extern double uprv_round_48(double x);
# 194 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
extern void uprv_tzset_48(void);







extern int32_t uprv_timezone_48(void);
# 212 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
extern const char* uprv_tzname_48(int n);







extern UDate uprv_getUTCtime_48(void);
# 229 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
extern UDate uprv_getRawUTCtime_48(void);







extern UBool uprv_pathIsAbsolute_48(const char *path);







extern void * uprv_maximumPtr_48(void *base);
# 294 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h"
typedef void (UVoidFunction)(void);





extern void * uprv_dl_open_48(const char *libName, UErrorCode *status);





extern void uprv_dl_close_48( void *lib, UErrorCode *status);





extern UVoidFunction* uprv_dlsym_func_48( void *lib, const char *symbolName, UErrorCode *status);
# 36 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h" 1
# 19 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uiter.h" 1
# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ustr_imp.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucase.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h" 1
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
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
# 37 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ulocimp.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ulocimp.h"
extern UEnumeration*
uloc_openKeywordList_48(const char *keywordList, int32_t keywordListSize, UErrorCode* status);





extern const UChar *
uloc_getTableStringWithFallback_48(
    const char *path,
    const char *locale,
    const char *tableKey,
    const char *subTableKey,
    const char *itemKey,
    int32_t *pLength,
    UErrorCode *pErrorCode);




extern const char*
uloc_getCurrentCountryID_48(const char* oldID);

extern const char*
uloc_getCurrentLanguageID_48(const char* oldID);

extern int32_t
ulocimp_getLanguage_48(const char *localeID,
                    char *language, int32_t languageCapacity,
                    const char **pEnd);

extern int32_t
ulocimp_getScript_48(const char *localeID,
                   char *script, int32_t scriptCapacity,
                   const char **pEnd);

extern int32_t
ulocimp_getCountry_48(const char *localeID,
                   char *country, int32_t countryCapacity,
                   const char **pEnd);

extern const char *
locale_getKeywordsStart_48(const char *localeID);
# 38 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
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
# 39 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h" 1
# 29 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h"
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


# 30 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cstring.h" 2
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
# 40 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 1
# 30 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h"
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
# 41 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
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
# 42 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/locmap.h" 1
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/locmap.h"
extern const char *uprv_convertToPosix_48(uint32_t hostid, UErrorCode* status);


extern uint32_t uprv_convertToLCID_48(const char *langID, const char* posixID, UErrorCode* status);
# 43 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uarrsort.h" 1
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uarrsort.h"

# 39 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uarrsort.h"
typedef int32_t
UComparator(const void *context, const void *left, const void *right);

# 58 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uarrsort.h"
extern void
uprv_sortArray_48(void *array, int32_t length, int32_t itemSize,
               UComparator *cmp, const void *context,
               UBool sortStable, UErrorCode *pErrorCode);





extern int32_t
uprv_uint16Comparator_48(const void *context, const void *left, const void *right);





extern int32_t
uprv_int32Comparator_48(const void *context, const void *left, const void *right);





extern int32_t
uprv_uint32Comparator_48(const void *context, const void *left, const void *right);
# 44 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h" 1
# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h" 2


# 42 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h"
typedef void
UEnumClose(UEnumeration *en);
# 55 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h"
typedef int32_t
UEnumCount(UEnumeration *en, UErrorCode *status);
# 70 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h"
typedef const UChar*
UEnumUNext(UEnumeration* en,
            int32_t* resultLength,
            UErrorCode* status);
# 87 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h"
typedef const char*
UEnumNext(UEnumeration* en,
           int32_t* resultLength,
           UErrorCode* status);
# 101 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uenumimp.h"
typedef void
UEnumReset(UEnumeration* en,
            UErrorCode* status);


struct UEnumeration {

    void *baseContext;


    void *context;






    UEnumClose *close;

    UEnumCount *count;

    UEnumUNext *uNext;

    UEnumNext *next;

    UEnumReset *reset;
};









extern const UChar*
uenum_unextDefault_48(UEnumeration* en,
            int32_t* resultLength,
            UErrorCode* status);







extern const char*
uenum_nextDefault_48(UEnumeration* en,
            int32_t* resultLength,
            UErrorCode* status);
# 45 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uassert.h" 1
# 46 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2

# 1 "c:/marmalade/5.2/s3e/h/std/stdio.h" 1
# 19 "c:/marmalade/5.2/s3e/h/std/stdio.h"
struct __XXFILE;
typedef struct __XXFILE FILE;

typedef uint32 fpos_t;
# 38 "c:/marmalade/5.2/s3e/h/std/stdio.h"




struct _reent
{
  int _errno;
  void *_stdin, *_stdout, *_stderr;
};
extern struct _reent *_impure_ptr;
# 66 "c:/marmalade/5.2/s3e/h/std/stdio.h"
FILE *fopen(const char *path, const char *mode);
int fclose(FILE *fp);
int fcloseall();
int fflush(FILE *stream);

FILE *fopen(const char *path, const char *mode);
FILE *fdopen(int fildes, const char *mode);
FILE *freopen(const char *path, const char *mode, FILE *stream);

size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);

int fputc(int c, FILE *stream);
int fputs(const char *s, FILE *stream);
int putc(int c, FILE *stream);
int putchar(int c);
int puts(const char *s);

int fgetc(FILE *stream);
char *fgets(char *s, int size, FILE *stream);
int getc(FILE *stream);
int getchar(void);
char *gets(char *s);
int ungetc(int c, FILE *stream);

int fseek(FILE *stream, long offset, int whence);
long ftell(FILE *stream);
void rewind(FILE *stream);
int fgetpos(FILE *stream, fpos_t *pos);
int fsetpos(FILE *stream, fpos_t *pos);

void flockfile(FILE *filehandle);
int ftrylockfile(FILE *filehandle);
void funlockfile(FILE *filehandle);

int getc_unlocked(FILE *stream);
int getchar_unlocked(void);
int putc_unlocked(int c, FILE *stream);
int putchar_unlocked(int c);

FILE *popen(const char *command, const char *type);
int pclose(FILE *stream);

char *tempnam(const char *dir, const char *pfx);




int printf(const char *format, ...) __attribute__((format(printf, 1, 2)));



int fprintf(FILE *stream, const char* format, ...) __attribute__((format(printf, 2, 3)));



int sprintf(char *str, const char* format, ...) __attribute__((format(printf, 2, 3)));



int snprintf(char *str, size_t size, const char *format, ...) __attribute__((format(printf, 3, 4)));




int scanf(const char *format, ...);



int fscanf(FILE *stream, const char *format, ...);



int sscanf(const char *str, const char *format, ...);

void clearerr(FILE *stream);
int feof(FILE *stream);
int ferror(FILE *stream);
int fileno(FILE *stream);

int remove(const char *pathname);
int rename(const char *oldpath, const char *newpath);

void perror(const char *s);



FILE *tmpfile(void);
char *tmpnam(char *s);

void setbuf(FILE *stream, char *buf);
void setbuffer(FILE *stream, char *buf, size_t size);
void setlinebuf(FILE *stream);
int setvbuf(FILE *stream, char *buf, int mode , size_t size);



int vfprintf(FILE *stream, const char *format, va_list ap);
int vsprintf(char *str, const char *format, va_list ap);
int vsnprintf(char *str, size_t size, const char *format, va_list ap);
int vprintf(const char *format, va_list ap);
int asprintf(char **strp, const char *fmt, ...);
int vasprintf(char **strp, const char *fmt, va_list ap);

int vscanf(const char *format, va_list ap);
int vsscanf(const char *str, const char *format, va_list ap);
int vfscanf(FILE *stream, const char *format, va_list ap);


# 48 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c" 2




extern void locale_set_default_48(const char *id);
extern const char *locale_get_default_48(void);
extern int32_t
locale_getKeywords_48(const char *localeID,
            char prev,
            char *keywords, int32_t keywordCapacity,
            char *values, int32_t valuesCapacity, int32_t *valLen,
            UBool valuesToo,
            UErrorCode *status);
# 95 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static const char * const LANGUAGES[] = {
    "aa", "ab", "ace", "ach", "ada", "ady", "ae", "af", "afa",
    "afh", "agq", "ain", "ak", "akk", "ale", "alg", "alt", "am", "an",
    "ang", "anp", "apa",
    "ar", "arc", "arn", "arp", "art", "arw", "as", "asa", "ast",
    "ath", "aus", "av", "awa", "ay", "az", "ba", "bad",
    "bai", "bal", "ban", "bas", "bat", "be", "bej",
    "bem", "ber", "bez", "bg", "bh", "bho", "bi", "bik", "bin",
    "bla", "bm", "bn", "bnt", "bo", "br", "bra", "brx", "bs",
    "btk", "bua", "bug", "byn", "ca", "cad", "cai", "car", "cau",
    "cch", "ce", "ceb", "cel", "cgg", "ch", "chb", "chg", "chk", "chm",
    "chn", "cho", "chp", "chr", "chy", "cmc", "co", "cop",
    "cpe", "cpf", "cpp", "cr", "crh", "crp", "cs", "csb", "cu", "cus",
    "cv", "cy", "da", "dak", "dar", "dav", "day", "de", "del", "den",
    "dgr", "din", "dje", "doi", "dra", "dsb", "dua", "dum", "dv", "dyo", "dyu",
    "dz", "ebu", "ee", "efi", "egy", "eka", "el", "elx", "en",
    "enm", "eo", "es", "et", "eu", "ewo", "fa",
    "fan", "fat", "ff", "fi", "fil", "fiu", "fj", "fo", "fon",
    "fr", "frm", "fro", "frr", "frs", "fur", "fy",
    "ga", "gaa", "gay", "gba", "gd", "gem", "gez", "gil",
    "gl", "gmh", "gn", "goh", "gon", "gor", "got", "grb",
    "grc", "gsw", "gu", "guz", "gv", "gwi",
    "ha", "hai", "haw", "he", "hi", "hil", "him",
    "hit", "hmn", "ho", "hr", "hsb", "ht", "hu", "hup", "hy", "hz",
    "ia", "iba", "id", "ie", "ig", "ii", "ijo", "ik",
    "ilo", "inc", "ine", "inh", "io", "ira", "iro", "is", "it",
    "iu", "ja", "jbo", "jmc", "jpr", "jrb", "jv", "ka", "kaa", "kab",
    "kac", "kaj", "kam", "kar", "kaw", "kbd", "kcg", "kde", "kea", "kfo", "kg", "kha", "khi",
    "kho", "khq", "ki", "kj", "kk", "kl", "kln", "km", "kmb", "kn",
    "ko", "kok", "kos", "kpe", "kr", "krc", "krl", "kro", "kru", "ks", "ksb", "ksf",
    "ku", "kum", "kut", "kv", "kw", "ky", "la", "lad", "lag",
    "lah", "lam", "lb", "lez", "lg", "li", "ln", "lo", "lol",
    "loz", "lt", "lu", "lua", "lui", "lun", "luo", "lus", "luy",
    "lv", "mad", "mag", "mai", "mak", "man", "map", "mas",
    "mdf", "mdr", "men", "mer", "mfe", "mg", "mga", "mgh", "mh", "mi", "mic", "min",
    "mis", "mk", "mkh", "ml", "mn", "mnc", "mni", "mno",
    "mo", "moh", "mos", "mr", "ms", "mt", "mua", "mul", "mun",
    "mus", "mwl", "mwr", "my", "myn", "myv", "na", "nah", "nai", "nap", "naq",
    "nb", "nd", "nds", "ne", "new", "ng", "nia", "nic",
    "niu", "nl", "nmg", "nn", "no", "nog", "non", "nqo", "nr", "nso", "nub", "nus",
    "nv", "nwc", "ny", "nym", "nyn", "nyo", "nzi", "oc", "oj",
    "om", "or", "os", "osa", "ota", "oto", "pa", "paa",
    "pag", "pal", "pam", "pap", "pau", "peo", "phi", "phn",
    "pi", "pl", "pon", "pra", "pro", "ps", "pt", "qu",
    "raj", "rap", "rar", "rm", "rn", "ro", "roa", "rof", "rom",
    "ru", "rup", "rw", "rwk", "sa", "sad", "sah", "sai", "sal", "sam", "saq",
    "sas", "sat", "sbp", "sc", "scn", "sco", "sd", "se", "seh", "sel", "sem", "ses",
    "sg", "sga", "sgn", "shi", "shn", "si", "sid", "sio", "sit",
    "sk", "sl", "sla", "sm", "sma", "smi", "smj", "smn",
    "sms", "sn", "snk", "so", "sog", "son", "sq", "sr",
    "srn", "srr", "ss", "ssa", "st", "su", "suk", "sus", "sux",
    "sv", "sw", "swc", "syc", "syr", "ta", "tai", "te", "tem", "teo", "ter",
    "tet", "tg", "th", "ti", "tig", "tiv", "tk", "tkl",
    "tl", "tlh", "tli", "tmh", "tn", "to", "tog", "tpi", "tr", "trv",
    "ts", "tsi", "tt", "tum", "tup", "tut", "tvl", "tw", "twq",
    "ty", "tyv", "tzm", "udm", "ug", "uga", "uk", "umb", "und", "ur",
    "uz", "vai", "ve", "vi", "vo", "vot", "vun", "wa", "wak",
    "wal", "war", "was", "wen", "wo", "xal", "xh", "xog", "yao", "yap", "yav",
    "yi", "yo", "ypk", "za", "zap", "zbl", "zen", "zh", "znd",
    "zu", "zun", "zxx", "zza",
((void *)0),
    "in", "iw", "ji", "jw", "sh",
((void *)0)
};
static const char* const DEPRECATED_LANGUAGES[]={
    "in", "iw", "ji", "jw", ((void *)0), ((void *)0)
};
static const char* const REPLACEMENT_LANGUAGES[]={
    "id", "he", "yi", "jv", ((void *)0), ((void *)0)
};
# 182 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static const char * const LANGUAGES_3[] = {

    "aar", "abk", "ace", "ach", "ada", "ady", "ave", "afr", "afa",

    "afh", "agq", "ain", "aka", "akk", "ale", "alg", "alt", "amh", "arg", "ang", "anp", "apa",

    "ara", "arc", "arn", "arp", "art", "arw", "asm", "asa", "ast",

    "ath", "aus", "ava", "awa", "aym", "aze", "bak", "bad",

    "bai", "bal", "ban", "bas", "bat", "bel", "bej",

    "bem", "ber", "bez", "bul", "bih", "bho", "bis", "bik", "bin",

    "bla", "bam", "ben", "bnt", "bod", "bre", "bra", "brx", "bos",

    "btk", "bua", "bug", "byn", "cat", "cad", "cai", "car", "cau",

    "cch", "che", "ceb", "cel", "cgg", "cha", "chb", "chg", "chk", "chm",

    "chn", "cho", "chp", "chr", "chy", "cmc", "cos", "cop",

    "cpe", "cpf", "cpp", "cre", "crh", "crp", "ces", "csb", "chu", "cus",

    "chv", "cym", "dan", "dak", "dar", "dav", "day", "deu", "del", "den",

    "dgr", "din", "dje", "doi", "dra", "dsb", "dua", "dum", "div", "dyo", "dyu",

    "dzo", "ebu", "ewe", "efi", "egy", "eka", "ell", "elx", "eng",

    "enm", "epo", "spa", "est", "eus", "ewo", "fas",

    "fan", "fat", "ful", "fin", "fil", "fiu", "fij", "fao", "fon",

    "fra", "frm", "fro", "frr", "frs", "fur", "fry", "gle", "gaa", "gay",

    "gba", "gla", "gem", "gez", "gil", "glg", "gmh", "grn",

    "goh", "gon", "gor", "got", "grb", "grc", "gsw", "guj", "guz", "glv",

    "gwi", "hau", "hai", "haw", "heb", "hin", "hil", "him",

    "hit", "hmn", "hmo", "hrv", "hsb", "hat", "hun", "hup", "hye", "her",

    "ina", "iba", "ind", "ile", "ibo", "iii", "ijo", "ipk",

    "ilo", "inc", "ine", "inh", "ido", "ira", "iro", "isl", "ita",

    "iku", "jpn", "jbo", "jmc", "jpr", "jrb", "jav", "kat", "kaa", "kab",

    "kac", "kaj", "kam", "kar", "kaw", "kbd", "kcg", "kde", "kea", "kfo", "kg", "kha", "khi",

    "kho", "khq", "kik", "kua", "kaz", "kal", "kln", "khm", "kmb", "kan",

    "kor", "kok", "kos", "kpe", "kau", "krc", "krl", "kro", "kru", "kas", "ksb", "ksf",

    "kur", "kum", "kut", "kom", "cor", "kir", "lat", "lad", "lag",

    "lah", "lam", "ltz", "lez", "lug", "lim", "lin", "lao", "lol",

    "loz", "lit", "lub", "lua", "lui", "lun", "luo", "lus", "luy",

    "lav", "mad", "mag", "mai", "mak", "man", "map", "mas",

    "mdf", "mdr", "men", "mer", "mfe", "mlg", "mga", "mgh", "mah", "mri", "mic", "min",

    "mis", "mkd", "mkh", "mal", "mon", "mnc", "mni", "mno",

    "mol", "moh", "mos", "mar", "msa", "mlt", "mua", "mul", "mun",

    "mus", "mwl", "mwr", "mya", "myn", "myv", "nau", "nah", "nai", "nap", "naq",

    "nob", "nde", "nds", "nep", "new", "ndo", "nia", "nic",

    "niu", "nld", "nmg", "nno", "nor", "nog", "non", "nqo", "nbl", "nso", "nub", "nus",

    "nav", "nwc", "nya", "nym", "nyn", "nyo", "nzi", "oci", "oji",

    "orm", "ori", "oss", "osa", "ota", "oto", "pan", "paa",

    "pag", "pal", "pam", "pap", "pau", "peo", "phi", "phn",

    "pli", "pol", "pon", "pra", "pro", "pus", "por", "que",

    "raj", "rap", "rar", "roh", "run", "ron", "roa", "rof", "rom",

    "rus", "rup", "kin", "rwk", "san", "sad", "sah", "sai", "sal", "sam", "saq",

    "sas", "sat", "sbp", "srd", "scn", "sco", "snd", "sme", "seh", "sel", "sem", "ses",

    "sag", "sga", "sgn", "shi", "shn", "sin", "sid", "sio", "sit",

    "slk", "slv", "sla", "smo", "sma", "smi", "smj", "smn",

    "sms", "sna", "snk", "som", "sog", "son", "sqi", "srp",

    "srn", "srr", "ssw", "ssa", "sot", "sun", "suk", "sus", "sux",

    "swe", "swa", "swc", "syc", "syr", "tam", "tai", "tel", "tem", "teo", "ter",

    "tet", "tgk", "tha", "tir", "tig", "tiv", "tuk", "tkl",

    "tgl", "tlh", "tli", "tmh", "tsn", "ton", "tog", "tpi", "tur", "trv",

    "tso", "tsi", "tat", "tum", "tup", "tut", "tvl", "twi", "twq",

    "tah", "tyv", "tzm", "udm", "uig", "uga", "ukr", "umb", "und", "urd",

    "uzb", "vai", "ven", "vie", "vol", "vot", "vun", "wln", "wak",

    "wal", "war", "was", "wen", "wol", "xal", "xho", "xog", "yao", "yap", "yav",

    "yid", "yor", "ypk", "zha", "zap", "zbl", "zen", "zho", "znd",

    "zul", "zun", "zxx", "zza",
((void *)0),

    "ind", "heb", "yid", "jaw", "srp",
((void *)0)
};
# 327 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static const char * const COUNTRIES[] = {
    "AD", "AE", "AF", "AG", "AI", "AL", "AM", "AN",
    "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ",
    "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI",
    "BJ", "BL", "BM", "BN", "BO", "BR", "BS", "BT", "BV",
    "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG",
    "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CR",
    "CU", "CV", "CX", "CY", "CZ", "DE", "DJ", "DK",
    "DM", "DO", "DZ", "EC", "EE", "EG", "EH", "ER",
    "ES", "ET", "FI", "FJ", "FK", "FM", "FO", "FR",
    "GA", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL",
    "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU",
    "GW", "GY", "HK", "HM", "HN", "HR", "HT", "HU",
    "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS",
    "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI",
    "KM", "KN", "KP", "KR", "KW", "KY", "KZ", "LA",
    "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU",
    "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK",
    "ML", "MM", "MN", "MO", "MP", "MQ", "MR", "MS",
    "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA",
    "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP",
    "NR", "NU", "NZ", "OM", "PA", "PE", "PF", "PG",
    "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT",
    "PW", "PY", "QA", "RE", "RO", "RS", "RU", "RW", "SA",
    "SB", "SC", "SD", "SE", "SG", "SH", "SI", "SJ",
    "SK", "SL", "SM", "SN", "SO", "SR", "ST", "SV",
    "SY", "SZ", "TC", "TD", "TF", "TG", "TH", "TJ",
    "TK", "TL", "TM", "TN", "TO", "TR", "TT", "TV",
    "TW", "TZ", "UA", "UG", "UM", "US", "UY", "UZ",
    "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF",
    "WS", "YE", "YT", "ZA", "ZM", "ZW",
((void *)0),
    "FX", "CS", "RO", "TP", "YU", "ZR",
((void *)0)
};

static const char* const DEPRECATED_COUNTRIES[] ={
    "BU", "CS", "DY", "FX", "HV", "NH", "RH", "TP", "YU", "ZR", ((void *)0), ((void *)0)
};
static const char* const REPLACEMENT_COUNTRIES[] = {

    "MM", "RS", "BJ", "FR", "BF", "VU", "ZW", "TL", "RS", "CD", ((void *)0), ((void *)0)
};
# 384 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static const char * const COUNTRIES_3[] = {

    "AND", "ARE", "AFG", "ATG", "AIA", "ALB", "ARM", "ANT",

    "AGO", "ATA", "ARG", "ASM", "AUT", "AUS", "ABW", "ALA", "AZE",

    "BIH", "BRB", "BGD", "BEL", "BFA", "BGR", "BHR", "BDI",

    "BEN", "BLM", "BMU", "BRN", "BOL", "BRA", "BHS", "BTN", "BVT",

    "BWA", "BLR", "BLZ", "CAN", "CCK", "COD", "CAF", "COG",

    "CHE", "CIV", "COK", "CHL", "CMR", "CHN", "COL", "CRI",

    "CUB", "CPV", "CXR", "CYP", "CZE", "DEU", "DJI", "DNK",

    "DMA", "DOM", "DZA", "ECU", "EST", "EGY", "ESH", "ERI",

    "ESP", "ETH", "FIN", "FJI", "FLK", "FSM", "FRO", "FRA",

    "GAB", "GBR", "GRD", "GEO", "GUF", "GGY", "GHA", "GIB", "GRL",

    "GMB", "GIN", "GLP", "GNQ", "GRC", "SGS", "GTM", "GUM",

    "GNB", "GUY", "HKG", "HMD", "HND", "HRV", "HTI", "HUN",

    "IDN", "IRL", "ISR", "IMN", "IND", "IOT", "IRQ", "IRN", "ISL",

    "ITA", "JEY", "JAM", "JOR", "JPN", "KEN", "KGZ", "KHM", "KIR",

    "COM", "KNA", "PRK", "KOR", "KWT", "CYM", "KAZ", "LAO",

    "LBN", "LCA", "LIE", "LKA", "LBR", "LSO", "LTU", "LUX",

    "LVA", "LBY", "MAR", "MCO", "MDA", "MNE", "MAF", "MDG", "MHL", "MKD",

    "MLI", "MMR", "MNG", "MAC", "MNP", "MTQ", "MRT", "MSR",

    "MLT", "MUS", "MDV", "MWI", "MEX", "MYS", "MOZ", "NAM",

    "NCL", "NER", "NFK", "NGA", "NIC", "NLD", "NOR", "NPL",

    "NRU", "NIU", "NZL", "OMN", "PAN", "PER", "PYF", "PNG",

    "PHL", "PAK", "POL", "SPM", "PCN", "PRI", "PSE", "PRT",

    "PLW", "PRY", "QAT", "REU", "ROU", "SRB", "RUS", "RWA", "SAU",

    "SLB", "SYC", "SDN", "SWE", "SGP", "SHN", "SVN", "SJM",

    "SVK", "SLE", "SMR", "SEN", "SOM", "SUR", "STP", "SLV",

    "SYR", "SWZ", "TCA", "TCD", "ATF", "TGO", "THA", "TJK",

    "TKL", "TLS", "TKM", "TUN", "TON", "TUR", "TTO", "TUV",

    "TWN", "TZA", "UKR", "UGA", "UMI", "USA", "URY", "UZB",

    "VAT", "VCT", "VEN", "VGB", "VIR", "VNM", "VUT", "WLF",

    "WSM", "YEM", "MYT", "ZAF", "ZMB", "ZWE",
((void *)0),

    "FXX", "SCG", "ROM", "TMP", "YUG", "ZAR",
((void *)0)
};

typedef struct CanonicalizationMap {
    const char *id;
    const char *canonicalID;
    const char *keyword;
    const char *value;
} CanonicalizationMap;





static const CanonicalizationMap CANONICALIZE_MAP[] = {
    { "", "en_US_POSIX", ((void *)0), ((void *)0) },
    { "c", "en_US_POSIX", ((void *)0), ((void *)0) },
    { "posix", "en_US_POSIX", ((void *)0), ((void *)0) },
    { "art_LOJBAN", "jbo", ((void *)0), ((void *)0) },
    { "az_AZ_CYRL", "az_Cyrl_AZ", ((void *)0), ((void *)0) },
    { "az_AZ_LATN", "az_Latn_AZ", ((void *)0), ((void *)0) },
    { "ca_ES_PREEURO", "ca_ES", "currency", "ESP" },
    { "cel_GAULISH", "cel__GAULISH", ((void *)0), ((void *)0) },
    { "de_1901", "de__1901", ((void *)0), ((void *)0) },
    { "de_1906", "de__1906", ((void *)0), ((void *)0) },
    { "de__PHONEBOOK", "de", "collation", "phonebook" },
    { "de_AT_PREEURO", "de_AT", "currency", "ATS" },
    { "de_DE_PREEURO", "de_DE", "currency", "DEM" },
    { "de_LU_PREEURO", "de_LU", "currency", "LUF" },
    { "el_GR_PREEURO", "el_GR", "currency", "GRD" },
    { "en_BOONT", "en__BOONT", ((void *)0), ((void *)0) },
    { "en_SCOUSE", "en__SCOUSE", ((void *)0), ((void *)0) },
    { "en_BE_PREEURO", "en_BE", "currency", "BEF" },
    { "en_IE_PREEURO", "en_IE", "currency", "IEP" },
    { "es__TRADITIONAL", "es", "collation", "traditional" },
    { "es_ES_PREEURO", "es_ES", "currency", "ESP" },
    { "eu_ES_PREEURO", "eu_ES", "currency", "ESP" },
    { "fi_FI_PREEURO", "fi_FI", "currency", "FIM" },
    { "fr_BE_PREEURO", "fr_BE", "currency", "BEF" },
    { "fr_FR_PREEURO", "fr_FR", "currency", "FRF" },
    { "fr_LU_PREEURO", "fr_LU", "currency", "LUF" },
    { "ga_IE_PREEURO", "ga_IE", "currency", "IEP" },
    { "gl_ES_PREEURO", "gl_ES", "currency", "ESP" },
    { "hi__DIRECT", "hi", "collation", "direct" },
    { "it_IT_PREEURO", "it_IT", "currency", "ITL" },
    { "ja_JP_TRADITIONAL", "ja_JP", "calendar", "japanese" },
    { "nb_NO_NY", "nn_NO", ((void *)0), ((void *)0) },
    { "nl_BE_PREEURO", "nl_BE", "currency", "BEF" },
    { "nl_NL_PREEURO", "nl_NL", "currency", "NLG" },
    { "pt_PT_PREEURO", "pt_PT", "currency", "PTE" },
    { "sl_ROZAJ", "sl__ROZAJ", ((void *)0), ((void *)0) },
    { "sr_SP_CYRL", "sr_Cyrl_RS", ((void *)0), ((void *)0) },
    { "sr_SP_LATN", "sr_Latn_RS", ((void *)0), ((void *)0) },
    { "sr_YU_CYRILLIC", "sr_Cyrl_RS", ((void *)0), ((void *)0) },
    { "th_TH_TRADITIONAL", "th_TH", "calendar", "buddhist" },
    { "uz_UZ_CYRILLIC", "uz_Cyrl_UZ", ((void *)0), ((void *)0) },
    { "uz_UZ_CYRL", "uz_Cyrl_UZ", ((void *)0), ((void *)0) },
    { "uz_UZ_LATN", "uz_Latn_UZ", ((void *)0), ((void *)0) },
    { "zh_CHS", "zh_Hans", ((void *)0), ((void *)0) },
    { "zh_CHT", "zh_Hant", ((void *)0), ((void *)0) },
    { "zh_GAN", "zh__GAN", ((void *)0), ((void *)0) },
    { "zh_GUOYU", "zh", ((void *)0), ((void *)0) },
    { "zh_HAKKA", "zh__HAKKA", ((void *)0), ((void *)0) },
    { "zh_MIN", "zh__MIN", ((void *)0), ((void *)0) },
    { "zh_MIN_NAN", "zh__MINNAN", ((void *)0), ((void *)0) },
    { "zh_WUU", "zh__WUU", ((void *)0), ((void *)0) },
    { "zh_XIANG", "zh__XIANG", ((void *)0), ((void *)0) },
    { "zh_YUE", "zh__YUE", ((void *)0), ((void *)0) },
};

typedef struct VariantMap {
    const char *variant;
    const char *keyword;
    const char *value;
} VariantMap;

static const VariantMap VARIANT_MAP[] = {
    { "EURO", "currency", "EUR" },
    { "PINYIN", "collation", "pinyin" },
    { "STROKE", "collation", "stroke" }
};
# 541 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static int32_t getShortestSubtagLength(const char *localeID) {
    int32_t localeIDLength = strlen(localeID);
    int32_t length = localeIDLength;
    int32_t tmpLength = 0;
    int32_t i;
    UBool reset = 1;

    for (i = 0; i < localeIDLength; i++) {
        if (localeID[i] != '_' && localeID[i] != '-') {
            if (reset) {
                tmpLength = 0;
                reset = 0;
            }
            tmpLength++;
        } else {
            if (tmpLength != 0 && tmpLength < length) {
                length = tmpLength;
            }
            reset = 1;
        }
    }

    return length;
}






extern const char *
locale_getKeywordsStart_48(const char *localeID) {
    const char *result = ((void *)0);
    if((result = strchr(localeID, '@')) != ((void *)0)) {
        return result;
    }
# 592 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
    return ((void *)0);
}







static int32_t locale_canonKeywordName(char *buf, const char *keywordName, UErrorCode *status)
{
  int32_t i;
  int32_t keywordNameLen = (int32_t) strlen(keywordName);

  if(keywordNameLen >= 25) {

    *status = U_INTERNAL_PROGRAM_ERROR;
          return 0;
  }


  for(i = 0; i < keywordNameLen; i++) {
    buf[i] = uprv_asciitolower_48(keywordName[i]);
  }
  buf[i] = 0;

  return keywordNameLen;
}

typedef struct {
    char keyword[25];
    int32_t keywordLen;
    const char *valueStart;
    int32_t valueLen;
} KeywordStruct;

static int32_t
compareKeywordStructs(const void *context, const void *left, const void *right) {
    const char* leftString = ((const KeywordStruct *)left)->keyword;
    const char* rightString = ((const KeywordStruct *)right)->keyword;
    return strcmp(leftString, rightString);
}







static int32_t
_getKeywords(const char *localeID,
             char prev,
             char *keywords, int32_t keywordCapacity,
             char *values, int32_t valuesCapacity, int32_t *valLen,
             UBool valuesToo,
             const char* addKeyword,
             const char* addValue,
             UErrorCode *status)
{
    KeywordStruct keywordList[25];

    int32_t maxKeywords = 25;
    int32_t numKeywords = 0;
    const char* pos = localeID;
    const char* equalSign = ((void *)0);
    const char* semicolon = ((void *)0);
    int32_t i = 0, j, n;
    int32_t keywordsLen = 0;
    int32_t valuesLen = 0;

    if(prev == '@') {

        do {
            UBool duplicate = 0;

            while(*pos == ' ') {
                pos++;
            }
            if (!*pos) {
                break;
            }
            if(numKeywords == maxKeywords) {
                *status = U_INTERNAL_PROGRAM_ERROR;
                return 0;
            }
            equalSign = strchr(pos, '=');
            semicolon = strchr(pos, ';');


            if(!equalSign || (semicolon && semicolon<equalSign)) {
                *status = U_INVALID_FORMAT_ERROR;
                return 0;
            }

            if(equalSign - pos >= 25) {

                *status = U_INTERNAL_PROGRAM_ERROR;
                return 0;
            }
            for(i = 0, n = 0; i < equalSign - pos; ++i) {
                if (pos[i] != ' ') {
                    keywordList[numKeywords].keyword[n++] = uprv_asciitolower_48(pos[i]);
                }
            }
            keywordList[numKeywords].keyword[n] = 0;
            keywordList[numKeywords].keywordLen = n;

            equalSign++;

            while(*equalSign == ' ') {
                equalSign++;
            }
            keywordList[numKeywords].valueStart = equalSign;

            pos = semicolon;
            i = 0;
            if(pos) {
                while(*(pos - i - 1) == ' ') {
                    i++;
                }
                keywordList[numKeywords].valueLen = (int32_t)(pos - equalSign - i);
                pos++;
            } else {
                i = (int32_t) strlen(equalSign);
                while(equalSign[i-1] == ' ') {
                    i--;
                }
                keywordList[numKeywords].valueLen = i;
            }

            for (j=0; j<numKeywords; ++j) {
                if ( strcmp(keywordList[j].keyword, keywordList[numKeywords].keyword) == 0) {
                    duplicate = 1;
                    break;
                }
            }
            if (!duplicate) {
                ++numKeywords;
            }
        } while(pos);


        if (addKeyword != ((void *)0)) {
            UBool duplicate = 0;
            ;


            for (j=0; j<numKeywords; ++j) {
                if ( strcmp(keywordList[j].keyword, addKeyword) == 0) {
                    duplicate = 1;
                    break;
                }
            }
            if (!duplicate) {
                if (numKeywords == maxKeywords) {
                    *status = U_INTERNAL_PROGRAM_ERROR;
                    return 0;
                }
                strcpy(keywordList[numKeywords].keyword, addKeyword);
                keywordList[numKeywords].keywordLen = (int32_t) strlen(addKeyword);
                keywordList[numKeywords].valueStart = addValue;
                keywordList[numKeywords].valueLen = (int32_t) strlen(addValue);
                ++numKeywords;
            }
        } else {
            ;
        }



        uprv_sortArray_48(keywordList, numKeywords, sizeof(KeywordStruct), compareKeywordStructs, ((void *)0), 0, status);


        for(i = 0; i < numKeywords; i++) {
            if(keywordsLen + keywordList[i].keywordLen + 1< keywordCapacity) {
                strcpy(keywords+keywordsLen, keywordList[i].keyword);
                if(valuesToo) {
                    keywords[keywordsLen + keywordList[i].keywordLen] = '=';
                } else {
                    keywords[keywordsLen + keywordList[i].keywordLen] = 0;
                }
            }
            keywordsLen += keywordList[i].keywordLen + 1;
            if(valuesToo) {
                if(keywordsLen + keywordList[i].valueLen < keywordCapacity) {
                    strncpy(keywords+keywordsLen, keywordList[i].valueStart, keywordList[i].valueLen);
                }
                keywordsLen += keywordList[i].valueLen;

                if(i < numKeywords - 1) {
                    if(keywordsLen < keywordCapacity) {
                        keywords[keywordsLen] = ';';
                    }
                    keywordsLen++;
                }
            }
            if(values) {
                if(valuesLen + keywordList[i].valueLen + 1< valuesCapacity) {
                    strcpy(values+valuesLen, keywordList[i].valueStart);
                    values[valuesLen + keywordList[i].valueLen] = 0;
                }
                valuesLen += keywordList[i].valueLen + 1;
            }
        }
        if(values) {
            values[valuesLen] = 0;
            if(valLen) {
                *valLen = valuesLen;
            }
        }
        return u_terminateChars_48(keywords, keywordCapacity, keywordsLen, status);
    } else {
        return 0;
    }
}

extern int32_t
locale_getKeywords_48(const char *localeID,
                   char prev,
                   char *keywords, int32_t keywordCapacity,
                   char *values, int32_t valuesCapacity, int32_t *valLen,
                   UBool valuesToo,
                   UErrorCode *status) {
    return _getKeywords(localeID, prev, keywords, keywordCapacity,
                        values, valuesCapacity, valLen, valuesToo,
                        ((void *)0), ((void *)0), status);
}

extern int32_t
uloc_getKeywordValue_48(const char* localeID,
                     const char* keywordName,
                     char* buffer, int32_t bufferCapacity,
                     UErrorCode* status)
{
    const char* startSearchHere = ((void *)0);
    const char* nextSeparator = ((void *)0);
    char keywordNameBuffer[25];
    char localeKeywordNameBuffer[25];
    int32_t i = 0;
    int32_t result = 0;

    if(status && ((*status)<=U_ZERO_ERROR) && localeID) {
      char tempBuffer[157];
      const char* tmpLocaleID;

      if ((localeID && strstr(localeID, "@") == ((void *)0) && getShortestSubtagLength(localeID) == 1)) {
          if (uloc_forLanguageTag_48(localeID, tempBuffer, sizeof(tempBuffer), ((void *)0), status) <= 0 || ((*status)>U_ZERO_ERROR)) { tmpLocaleID=localeID; } else { tmpLocaleID=tempBuffer; };
      } else {
          tmpLocaleID=localeID;
      }

      startSearchHere = strchr(tmpLocaleID, '@');
      if(startSearchHere == ((void *)0)) {

          return 0;
      }

      locale_canonKeywordName(keywordNameBuffer, keywordName, status);
      if(((*status)>U_ZERO_ERROR)) {
        return 0;
      }


      while(startSearchHere) {
          startSearchHere++;

          while(*startSearchHere == ' ') {
              startSearchHere++;
          }
          nextSeparator = strchr(startSearchHere, '=');

          if(!nextSeparator) {
              break;
          }
          if(nextSeparator - startSearchHere >= 25) {

              *status = U_INTERNAL_PROGRAM_ERROR;
              return 0;
          }
          for(i = 0; i < nextSeparator - startSearchHere; i++) {
              localeKeywordNameBuffer[i] = uprv_asciitolower_48(startSearchHere[i]);
          }

          while(startSearchHere[i-1] == ' ') {
              i--;
          }
          localeKeywordNameBuffer[i] = 0;

          startSearchHere = strchr(nextSeparator, ';');

          if( strcmp(keywordNameBuffer, localeKeywordNameBuffer) == 0) {
              nextSeparator++;
              while(*nextSeparator == ' ') {
                  nextSeparator++;
              }

              if(startSearchHere && startSearchHere - nextSeparator < bufferCapacity) {
                  while(*(startSearchHere-1) == ' ') {
                      startSearchHere--;
                  }
                  strncpy(buffer, nextSeparator, startSearchHere - nextSeparator);
                  result = u_terminateChars_48(buffer, bufferCapacity, (int32_t)(startSearchHere - nextSeparator), status);
              } else if(!startSearchHere && (int32_t) strlen(nextSeparator) < bufferCapacity) {
                  i = (int32_t) strlen(nextSeparator);
                  while(nextSeparator[i - 1] == ' ') {
                      i--;
                  }
                  strncpy(buffer, nextSeparator, i);
                  result = u_terminateChars_48(buffer, bufferCapacity, i, status);
              } else {

                  *status = U_BUFFER_OVERFLOW_ERROR;
                  if(startSearchHere) {
                      result = (int32_t)(startSearchHere - nextSeparator);
                  } else {
                      result = (int32_t) strlen(nextSeparator);
                  }
              }
              return result;
          }
      }
    }
    return 0;
}

extern int32_t
uloc_setKeywordValue_48(const char* keywordName,
                     const char* keywordValue,
                     char* buffer, int32_t bufferCapacity,
                     UErrorCode* status)
{

    int32_t keywordNameLen;
    int32_t keywordValueLen;
    int32_t bufLen;
    int32_t needLen = 0;
    int32_t foundValueLen;
    int32_t keywordAtEnd = 0;
    char keywordNameBuffer[25];
    char localeKeywordNameBuffer[25];
    int32_t i = 0;
    int32_t rc;
    char* nextSeparator = ((void *)0);
    char* nextEqualsign = ((void *)0);
    char* startSearchHere = ((void *)0);
    char* keywordStart = ((void *)0);
    char *insertHere = ((void *)0);
    if(((*status)>U_ZERO_ERROR)) {
        return -1;
    }
    if(bufferCapacity>1) {
        bufLen = (int32_t) strlen(buffer);
    } else {
        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }
    if(bufferCapacity<bufLen) {

        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }
    if(keywordValue && !*keywordValue) {
        keywordValue = ((void *)0);
    }
    if(keywordValue) {
        keywordValueLen = (int32_t) strlen(keywordValue);
    } else {
        keywordValueLen = 0;
    }
    keywordNameLen = locale_canonKeywordName(keywordNameBuffer, keywordName, status);
    if(((*status)>U_ZERO_ERROR)) {
        return 0;
    }
    startSearchHere = (char*)locale_getKeywordsStart_48(buffer);
    if(startSearchHere == ((void *)0) || (startSearchHere[1]==0)) {
        if(!keywordValue) {
            return bufLen;
        }

        needLen = bufLen+1+keywordNameLen+1+keywordValueLen;
        if(startSearchHere) {
            needLen--;

        } else {
            startSearchHere=buffer+bufLen;
        }
        if(needLen >= bufferCapacity) {
            *status = U_BUFFER_OVERFLOW_ERROR;
            return needLen;
        }
        *startSearchHere = '@';
        startSearchHere++;
        strcpy(startSearchHere, keywordNameBuffer);
        startSearchHere += keywordNameLen;
        *startSearchHere = '=';
        startSearchHere++;
        strcpy(startSearchHere, keywordValue);
        startSearchHere+=keywordValueLen;
        return needLen;
    }

    keywordStart = startSearchHere;

    while(keywordStart) {
        keywordStart++;

        while(*keywordStart == ' ') {
            keywordStart++;
        }
        nextEqualsign = strchr(keywordStart, '=');

        if(!nextEqualsign) {
            break;
        }
        if(nextEqualsign - keywordStart >= 25) {

            *status = U_INTERNAL_PROGRAM_ERROR;
            return 0;
        }
        for(i = 0; i < nextEqualsign - keywordStart; i++) {
            localeKeywordNameBuffer[i] = uprv_asciitolower_48(keywordStart[i]);
        }

        while(keywordStart[i-1] == ' ') {
            i--;
        }
        localeKeywordNameBuffer[i] = 0;

        nextSeparator = strchr(nextEqualsign, ';');
        rc = strcmp(keywordNameBuffer, localeKeywordNameBuffer);
        if(rc == 0) {
            nextEqualsign++;
            while(*nextEqualsign == ' ') {
                nextEqualsign++;
            }

            if (nextSeparator) {
                keywordAtEnd = 0;
                foundValueLen = (int32_t)(nextSeparator - nextEqualsign);
            } else {
                keywordAtEnd = 1;
                foundValueLen = (int32_t) strlen(nextEqualsign);
            }
            if(keywordValue) {
              if(foundValueLen == keywordValueLen) {
                strncpy(nextEqualsign, keywordValue, keywordValueLen);
                return bufLen;
              } else if(foundValueLen > keywordValueLen) {
                int32_t delta = foundValueLen - keywordValueLen;
                if(nextSeparator) {
                  memmove(nextSeparator - delta, nextSeparator, bufLen-(nextSeparator-buffer));
                }
                strncpy(nextEqualsign, keywordValue, keywordValueLen);
                bufLen -= delta;
                buffer[bufLen]=0;
                return bufLen;
              } else {
                int32_t delta = keywordValueLen - foundValueLen;
                if((bufLen+delta) >= bufferCapacity) {
                  *status = U_BUFFER_OVERFLOW_ERROR;
                  return bufLen+delta;
                }
                if(nextSeparator) {
                  memmove(nextSeparator+delta, nextSeparator, bufLen-(nextSeparator-buffer));
                }
                strncpy(nextEqualsign, keywordValue, keywordValueLen);
                bufLen += delta;
                buffer[bufLen]=0;
                return bufLen;
              }
            } else {
              if(keywordAtEnd) {

                keywordStart[-1] = 0;
                return (int32_t)((keywordStart-buffer)-1);
              } else {
                memmove(keywordStart, nextSeparator+1, bufLen-((nextSeparator+1)-buffer));
                keywordStart[bufLen-((nextSeparator+1)-buffer)]=0;
                return (int32_t)(bufLen-((nextSeparator+1)-keywordStart));
              }
            }
        } else if(rc<0){

          insertHere = keywordStart;
        }
        keywordStart = nextSeparator;
    }

    if(!keywordValue) {
      return bufLen;
    }


    needLen = bufLen+1+keywordNameLen+1+keywordValueLen;
    if(needLen >= bufferCapacity) {
        *status = U_BUFFER_OVERFLOW_ERROR;
        return needLen;
    }

    if(insertHere) {
      memmove(insertHere+(1+keywordNameLen+1+keywordValueLen), insertHere, bufLen-(insertHere-buffer));
      keywordStart = insertHere;
    } else {
      keywordStart = buffer+bufLen;
      *keywordStart = ';';
      keywordStart++;
    }
    strncpy(keywordStart, keywordNameBuffer, keywordNameLen);
    keywordStart += keywordNameLen;
    *keywordStart = '=';
    keywordStart++;
    strncpy(keywordStart, keywordValue, keywordValueLen);
    keywordStart+=keywordValueLen;
    if(insertHere) {
      *keywordStart = ';';
      keywordStart++;
    }
    buffer[needLen]=0;
    return needLen;
}
# 1126 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static char* _strnchr(const char* str, int32_t len, char c) {
    ;
    while (len-- != 0) {
        char d = *str;
        if (d == c) {
            return (char*) str;
        } else if (d == 0) {
            break;
        }
        ++str;
    }
    return ((void *)0);
}
# 1147 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static int16_t _findIndex(const char* const* list, const char* key)
{
    const char* const* anchor = list;
    int32_t pass = 0;


    while (pass++ < 2) {
        while (*list) {
            if ( strcmp(key, *list) == 0) {
                return (int16_t)(list - anchor);
            }
            list++;
        }
        ++list;
    }
    return -1;
}


static __inline int32_t
_copyCount(char *dest, int32_t destCapacity, const char *src) {
    const char *anchor;
    char c;

    anchor=src;
    for(;;) {
        if((c=*src)==0) {
            return (int32_t)(src-anchor);
        }
        if(destCapacity<=0) {
            return (int32_t)((src-anchor)+ strlen(src));
        }
        ++src;
        *dest++=c;
        --destCapacity;
    }
}

extern const char*
uloc_getCurrentCountryID_48(const char* oldID){
    int32_t offset = _findIndex(DEPRECATED_COUNTRIES, oldID);
    if (offset >= 0) {
        return REPLACEMENT_COUNTRIES[offset];
    }
    return oldID;
}
extern const char*
uloc_getCurrentLanguageID_48(const char* oldID){
    int32_t offset = _findIndex(DEPRECATED_LANGUAGES, oldID);
    if (offset >= 0) {
        return REPLACEMENT_LANGUAGES[offset];
    }
    return oldID;
}
# 1209 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
extern int32_t
ulocimp_getLanguage_48(const char *localeID,
                    char *language, int32_t languageCapacity,
                    const char **pEnd) {
    int32_t i=0;
    int32_t offset;
    char lang[4]={ 0, 0, 0, 0 };


    if((((localeID[0]=='x')||(localeID[0]=='X')||(localeID[0]=='i')||(localeID[0]=='I'))&&(localeID[1] == '_' || localeID[1] == '-'))) {
        if(i<languageCapacity) {
            language[i]=(char)uprv_asciitolower_48(*localeID);
        }
        if(i<languageCapacity) {
            language[i+1]='-';
        }
        i+=2;
        localeID+=2;
    }


    while(!((*localeID==0)||(*localeID=='.')||(*localeID=='@')) && !(*localeID == '_' || *localeID == '-')) {
        if(i<languageCapacity) {
            language[i]=(char)uprv_asciitolower_48(*localeID);
        }
        if(i<3) {
            lang[i]=(char)uprv_asciitolower_48(*localeID);
        }
        i++;
        localeID++;
    }

    if(i==3) {

        offset=_findIndex(LANGUAGES_3, lang);
        if(offset>=0) {
            i=_copyCount(language, languageCapacity, LANGUAGES[offset]);
        }
    }

    if(pEnd!=((void *)0)) {
        *pEnd=localeID;
    }
    return i;
}

extern int32_t
ulocimp_getScript_48(const char *localeID,
                  char *script, int32_t scriptCapacity,
                  const char **pEnd)
{
    int32_t idLen = 0;

    if (pEnd != ((void *)0)) {
        *pEnd = localeID;
    }


    while(!((localeID[idLen]==0)||(localeID[idLen]=='.')||(localeID[idLen]=='@')) && !(localeID[idLen] == '_' || localeID[idLen] == '-')) {
        idLen++;
    }


    if (idLen == 4) {
        int32_t i;
        if (pEnd != ((void *)0)) {
            *pEnd = localeID+idLen;
        }
        if(idLen > scriptCapacity) {
            idLen = scriptCapacity;
        }
        if (idLen >= 1) {
            script[0]=(char)uprv_toupper_48(*(localeID++));
        }
        for (i = 1; i < idLen; i++) {
            script[i]=(char)uprv_asciitolower_48(*(localeID++));
        }
    }
    else {
        idLen = 0;
    }
    return idLen;
}

extern int32_t
ulocimp_getCountry_48(const char *localeID,
                   char *country, int32_t countryCapacity,
                   const char **pEnd)
{
    int32_t idLen=0;
    char cnty[4]={ 0, 0, 0, 0 };
    int32_t offset;


    while(!((localeID[idLen]==0)||(localeID[idLen]=='.')||(localeID[idLen]=='@')) && !(localeID[idLen] == '_' || localeID[idLen] == '-')) {
        if(idLen<(4 -1)) {
            cnty[idLen]=(char)uprv_toupper_48(localeID[idLen]);
        }
        idLen++;
    }


    if (idLen == 2 || idLen == 3) {
        UBool gotCountry = 0;

        if(idLen==3) {
            offset=_findIndex(COUNTRIES_3, cnty);
            if(offset>=0) {
                idLen=_copyCount(country, countryCapacity, COUNTRIES[offset]);
                gotCountry = 1;
            }
        }
        if (!gotCountry) {
            int32_t i = 0;
            for (i = 0; i < idLen; i++) {
                if (i < countryCapacity) {
                    country[i]=(char)uprv_toupper_48(localeID[i]);
                }
            }
        }
        localeID+=idLen;
    } else {
        idLen = 0;
    }

    if(pEnd!=((void *)0)) {
        *pEnd=localeID;
    }

    return idLen;
}





static int32_t
_getVariantEx(const char *localeID,
              char prev,
              char *variant, int32_t variantCapacity,
              UBool needSeparator) {
    int32_t i=0;


    if((prev == '_' || prev == '-')) {

        while(!((*localeID==0)||(*localeID=='.')||(*localeID=='@'))) {
            if (needSeparator) {
                if (i<variantCapacity) {
                    variant[i] = '_';
                }
                ++i;
                needSeparator = 0;
            }
            if(i<variantCapacity) {
                variant[i]=(char)uprv_toupper_48(*localeID);
                if(variant[i]=='-') {
                    variant[i]='_';
                }
            }
            i++;
            localeID++;
        }
    }


    if(i==0) {
        if(prev=='@') {

        } else if((localeID=locale_getKeywordsStart_48(localeID))!=((void *)0)) {
            ++localeID;
        } else {
            return 0;
        }
        while(!((*localeID==0)||(*localeID=='.')||(*localeID=='@'))) {
            if (needSeparator) {
                if (i<variantCapacity) {
                    variant[i] = '_';
                }
                ++i;
                needSeparator = 0;
            }
            if(i<variantCapacity) {
                variant[i]=(char)uprv_toupper_48(*localeID);
                if(variant[i]=='-' || variant[i]==',') {
                    variant[i]='_';
                }
            }
            i++;
            localeID++;
        }
    }

    return i;
}

static int32_t
_getVariant(const char *localeID,
            char prev,
            char *variant, int32_t variantCapacity) {
    return _getVariantEx(localeID, prev, variant, variantCapacity, 0);
}
# 1424 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static int32_t
_deleteVariant(char* variants, int32_t variantsLen,
               const char* toDelete, int32_t toDeleteLen)
{
    int32_t delta = 0;
    for (;;) {
        UBool flag = 0;
        if (variantsLen < toDeleteLen) {
            return delta;
        }
        if ( strncmp(variants, toDelete, toDeleteLen) == 0 &&
            (variantsLen == toDeleteLen ||
             (flag=(variants[toDeleteLen] == '_'))))
        {
            int32_t d = toDeleteLen + (flag?1:0);
            variantsLen -= d;
            delta += d;
            if (variantsLen > 0) {
                memmove(variants, variants+d, variantsLen);
            }
        } else {
            char* p = _strnchr(variants, variantsLen, '_');
            if (p == ((void *)0)) {
                return delta;
            }
            ++p;
            variantsLen -= (int32_t)(p - variants);
            variants = p;
        }
    }
}



typedef struct UKeywordsContext {
    char* keywords;
    char* current;
} UKeywordsContext;

static void
uloc_kw_closeKeywords(UEnumeration *enumerator) {
    uprv_free_48(((UKeywordsContext *)enumerator->context)->keywords);
    uprv_free_48(enumerator->context);
    uprv_free_48(enumerator);
}

static int32_t
uloc_kw_countKeywords(UEnumeration *en, UErrorCode *status) {
    char *kw = ((UKeywordsContext *)en->context)->keywords;
    int32_t result = 0;
    while(*kw) {
        result++;
        kw += strlen(kw)+1;
    }
    return result;
}

static const char*
uloc_kw_nextKeyword(UEnumeration* en,
                    int32_t* resultLength,
                    UErrorCode* status) {
    const char* result = ((UKeywordsContext *)en->context)->current;
    int32_t len = 0;
    if(*result) {
        len = (int32_t) strlen(((UKeywordsContext *)en->context)->current);
        ((UKeywordsContext *)en->context)->current += len+1;
    } else {
        result = ((void *)0);
    }
    if (resultLength) {
        *resultLength = len;
    }
    return result;
}

static void
uloc_kw_resetKeywords(UEnumeration* en,
                      UErrorCode* status) {
    ((UKeywordsContext *)en->context)->current = ((UKeywordsContext *)en->context)->keywords;
}

static const UEnumeration gKeywordsEnum = {
    ((void *)0),
    ((void *)0),
    uloc_kw_closeKeywords,
    uloc_kw_countKeywords,
    uenum_unextDefault_48,
    uloc_kw_nextKeyword,
    uloc_kw_resetKeywords
};

extern UEnumeration*
uloc_openKeywordList_48(const char *keywordList, int32_t keywordListSize, UErrorCode* status)
{
    UKeywordsContext *myContext = ((void *)0);
    UEnumeration *result = ((void *)0);

    if(((*status)>U_ZERO_ERROR)) {
        return ((void *)0);
    }
    result = (UEnumeration *)uprv_malloc_48(sizeof(UEnumeration));

    if (result == ((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        return ((void *)0);
    }
    memcpy(result, &gKeywordsEnum, sizeof(UEnumeration));
    myContext = uprv_malloc_48(sizeof(UKeywordsContext));
    if (myContext == ((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        uprv_free_48(result);
        return ((void *)0);
    }
    myContext->keywords = (char *)uprv_malloc_48(keywordListSize+1);
    memcpy(myContext->keywords, keywordList, keywordListSize);
    myContext->keywords[keywordListSize] = 0;
    myContext->current = myContext->keywords;
    result->context = myContext;
    return result;
}

extern UEnumeration*
uloc_openKeywords_48(const char* localeID,
                        UErrorCode* status)
{
    int32_t i=0;
    char keywords[256];
    int32_t keywordsCapacity = 256;
    char tempBuffer[157];
    const char* tmpLocaleID;

    if(status==((void *)0) || ((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    if ((localeID && strstr(localeID, "@") == ((void *)0) && getShortestSubtagLength(localeID) == 1)) {
        if (uloc_forLanguageTag_48(localeID, tempBuffer, sizeof(tempBuffer), ((void *)0), status) <= 0 || ((*status)>U_ZERO_ERROR)) { tmpLocaleID=localeID; } else { tmpLocaleID=tempBuffer; };
    } else {
        if (localeID==((void *)0)) {
           localeID=uloc_getDefault_48();
        }
        tmpLocaleID=localeID;
    }


    ulocimp_getLanguage_48(tmpLocaleID, ((void *)0), 0, &tmpLocaleID);
    if((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
        const char *scriptID;

        ulocimp_getScript_48(tmpLocaleID+1, ((void *)0), 0, &scriptID);
        if(scriptID != tmpLocaleID+1) {

            tmpLocaleID = scriptID;
        }

        if ((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
            ulocimp_getCountry_48(tmpLocaleID+1, ((void *)0), 0, &tmpLocaleID);
            if((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
                _getVariant(tmpLocaleID+1, *tmpLocaleID, ((void *)0), 0);
            }
        }
    }


    if((tmpLocaleID = locale_getKeywordsStart_48(tmpLocaleID)) != ((void *)0)) {
        i=locale_getKeywords_48(tmpLocaleID+1, '@', keywords, keywordsCapacity, ((void *)0), 0, ((void *)0), 0, status);
    }

    if(i) {
        return uloc_openKeywordList_48(keywords, i, status);
    } else {
        return ((void *)0);
    }
}
# 1606 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static const char i_default[] = {'i', '-', 'd', 'e', 'f', 'a', 'u', 'l', 't'};
# 1616 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
static int32_t
_canonicalize(const char* localeID,
              char* result,
              int32_t resultCapacity,
              uint32_t options,
              UErrorCode* err) {
    int32_t j, len, fieldCount=0, scriptSize=0, variantSize=0, nameCapacity;
    char localeBuffer[157];
    char tempBuffer[157];
    const char* origLocaleID;
    const char* tmpLocaleID;
    const char* keywordAssign = ((void *)0);
    const char* separatorIndicator = ((void *)0);
    const char* addKeyword = ((void *)0);
    const char* addValue = ((void *)0);
    char* name;
    char* variant = ((void *)0);

    if (((*err)>U_ZERO_ERROR)) {
        return 0;
    }

    if ((localeID && strstr(localeID, "@") == ((void *)0) && getShortestSubtagLength(localeID) == 1)) {
        if (uloc_forLanguageTag_48(localeID, tempBuffer, sizeof(tempBuffer), ((void *)0), err) <= 0 || ((*err)>U_ZERO_ERROR)) { tmpLocaleID=localeID; } else { tmpLocaleID=tempBuffer; };
    } else {
        if (localeID==((void *)0)) {
           localeID=uloc_getDefault_48();
        }
        tmpLocaleID=localeID;
    }

    origLocaleID=tmpLocaleID;



    if (
        (result == ((void *)0) || resultCapacity < sizeof(localeBuffer))) {
        name = localeBuffer;
        nameCapacity = sizeof(localeBuffer);
    } else {
        name = result;
        nameCapacity = resultCapacity;
    }


    len=ulocimp_getLanguage_48(tmpLocaleID, name, nameCapacity, &tmpLocaleID);

    if(len == (sizeof i_default / sizeof i_default[0]) && strncmp(origLocaleID, i_default, len) == 0) {
        const char *d = uloc_getDefault_48();

        len = (int32_t) strlen(d);

        if (name != ((void *)0)) {
            strncpy(name, d, len);
        }
    } else if((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
        const char *scriptID;

        ++fieldCount;
        if(len<nameCapacity) {
            name[len]='_';
        }
        ++len;

        scriptSize=ulocimp_getScript_48(tmpLocaleID+1, name+len, nameCapacity-len, &scriptID);
        if(scriptSize > 0) {

            tmpLocaleID = scriptID;
            ++fieldCount;
            len+=scriptSize;
            if ((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {

                if(len<nameCapacity) {
                    name[len]='_';
                }
                ++len;
            }
        }

        if ((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
            const char *cntryID;
            int32_t cntrySize = ulocimp_getCountry_48(tmpLocaleID+1, name+len, nameCapacity-len, &cntryID);
            if (cntrySize > 0) {

                tmpLocaleID = cntryID;
                len+=cntrySize;
            }
            if((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {

                if (cntrySize > 0) {
                    ++fieldCount;
                    if(len<nameCapacity) {
                        name[len]='_';
                    }
                    ++len;
                }

                variantSize = _getVariant(tmpLocaleID+1, *tmpLocaleID, name+len, nameCapacity-len);
                if (variantSize > 0) {
                    variant = name+len;
                    len += variantSize;
                    tmpLocaleID += variantSize + 1;
                }
            }
        }
    }


    if (!((options & 0x1) != 0) && *tmpLocaleID == '.') {
        UBool done = 0;
        do {
            char c = *tmpLocaleID;
            switch (c) {
            case 0:
            case '@':
                done = 1;
                break;
            default:
                if (len<nameCapacity) {
                    name[len] = c;
                }
                ++len;
                ++tmpLocaleID;
                break;
            }
        } while (!done);
    }



    if ((tmpLocaleID=locale_getKeywordsStart_48(tmpLocaleID))!=((void *)0)) {
        keywordAssign = strchr(tmpLocaleID, '=');
        separatorIndicator = strchr(tmpLocaleID, ';');
    }


    if (!((options & 0x1) != 0) &&
        tmpLocaleID != ((void *)0) && keywordAssign == ((void *)0)) {
        for (;;) {
            char c = *tmpLocaleID;
            if (c == 0) {
                break;
            }
            if (len<nameCapacity) {
                name[len] = c;
            }
            ++len;
            ++tmpLocaleID;
        }
    }

    if (((options & 0x1) != 0)) {

        if (tmpLocaleID!=((void *)0) && keywordAssign==((void *)0)) {
            int32_t posixVariantSize;

            if (fieldCount < 2 || (fieldCount < 3 && scriptSize > 0)) {
                do {
                    if(len<nameCapacity) {
                        name[len]='_';
                    }
                    ++len;
                    ++fieldCount;
                } while(fieldCount<2);
            }
            posixVariantSize = _getVariantEx(tmpLocaleID+1, '@', name+len, nameCapacity-len,
                                             (UBool)(variantSize > 0));
            if (posixVariantSize > 0) {
                if (variant == ((void *)0)) {
                    variant = name+len;
                }
                len += posixVariantSize;
                variantSize += posixVariantSize;
            }
        }


        if (variant) {
            for (j=0; j<(int32_t)(sizeof(VARIANT_MAP)/sizeof(VARIANT_MAP[0])); j++) {
                const char* variantToCompare = VARIANT_MAP[j].variant;
                int32_t n = (int32_t) strlen(variantToCompare);
                int32_t variantLen = _deleteVariant(variant, uprv_min_48(variantSize, (nameCapacity-len)), variantToCompare, n);
                len -= variantLen;
                if (variantLen > 0) {
                    if (name[len-1] == '_') {
                        --len;
                    }
                    addKeyword = VARIANT_MAP[j].keyword;
                    addValue = VARIANT_MAP[j].value;
                    break;
                }
            }
            if (name[len-1] == '_') {
                --len;
            }
        }


        for (j=0; j<(int32_t)(sizeof(CANONICALIZE_MAP)/sizeof(CANONICALIZE_MAP[0])); j++) {
            const char* id = CANONICALIZE_MAP[j].id;
            int32_t n = (int32_t) strlen(id);
            if (len == n && strncmp(name, id, n) == 0) {
                if (n == 0 && tmpLocaleID != ((void *)0)) {
                    break;
                }
                len = _copyCount(name, nameCapacity, CANONICALIZE_MAP[j].canonicalID);
                if (CANONICALIZE_MAP[j].keyword) {
                    addKeyword = CANONICALIZE_MAP[j].keyword;
                    addValue = CANONICALIZE_MAP[j].value;
                }
                break;
            }
        }
    }

    if (!((options & 0x2) != 0)) {
        if (tmpLocaleID!=((void *)0) && keywordAssign!=((void *)0) &&
            (!separatorIndicator || separatorIndicator > keywordAssign)) {
            if(len<nameCapacity) {
                name[len]='@';
            }
            ++len;
            ++fieldCount;
            len += _getKeywords(tmpLocaleID+1, '@', name+len, nameCapacity-len, ((void *)0), 0, ((void *)0), 1,
                                addKeyword, addValue, err);
        } else if (addKeyword != ((void *)0)) {
            ;

            len += _copyCount(name+len, nameCapacity-len, "@");
            len += _copyCount(name+len, nameCapacity-len, addKeyword);
            len += _copyCount(name+len, nameCapacity-len, "=");
            len += _copyCount(name+len, nameCapacity-len, addValue);
        }
    }

    if (((*err)<=U_ZERO_ERROR) && result != ((void *)0) && name == localeBuffer) {
        strncpy(result, localeBuffer, (len > resultCapacity) ? resultCapacity : len);
    }

    return u_terminateChars_48(result, resultCapacity, len, err);
}



extern int32_t
uloc_getParent_48(const char* localeID,
               char* parent,
               int32_t parentCapacity,
               UErrorCode* err)
{
    const char *lastUnderscore;
    int32_t i;

    if (((*err)>U_ZERO_ERROR))
        return 0;

    if (localeID == ((void *)0))
        localeID = uloc_getDefault_48();

    lastUnderscore= strrchr(localeID, '_');
    if(lastUnderscore!=((void *)0)) {
        i=(int32_t)(lastUnderscore-localeID);
    } else {
        i=0;
    }

    if(i>0 && parent != localeID) {
        memcpy(parent, localeID, uprv_min_48(i, parentCapacity));
    }
    return u_terminateChars_48(parent, parentCapacity, i, err);
}

extern int32_t
uloc_getLanguage_48(const char* localeID,
         char* language,
         int32_t languageCapacity,
         UErrorCode* err)
{

    int32_t i=0;

    if (err==((void *)0) || ((*err)>U_ZERO_ERROR)) {
        return 0;
    }

    if(localeID==((void *)0)) {
        localeID=uloc_getDefault_48();
    }

    i=ulocimp_getLanguage_48(localeID, language, languageCapacity, ((void *)0));
    return u_terminateChars_48(language, languageCapacity, i, err);
}

extern int32_t
uloc_getScript_48(const char* localeID,
         char* script,
         int32_t scriptCapacity,
         UErrorCode* err)
{
    int32_t i=0;

    if(err==((void *)0) || ((*err)>U_ZERO_ERROR)) {
        return 0;
    }

    if(localeID==((void *)0)) {
        localeID=uloc_getDefault_48();
    }


    ulocimp_getLanguage_48(localeID, ((void *)0), 0, &localeID);
    if((*localeID == '_' || *localeID == '-')) {
        i=ulocimp_getScript_48(localeID+1, script, scriptCapacity, ((void *)0));
    }
    return u_terminateChars_48(script, scriptCapacity, i, err);
}

extern int32_t
uloc_getCountry_48(const char* localeID,
            char* country,
            int32_t countryCapacity,
            UErrorCode* err)
{
    int32_t i=0;

    if(err==((void *)0) || ((*err)>U_ZERO_ERROR)) {
        return 0;
    }

    if(localeID==((void *)0)) {
        localeID=uloc_getDefault_48();
    }


    ulocimp_getLanguage_48(localeID, ((void *)0), 0, &localeID);
    if((*localeID == '_' || *localeID == '-')) {
        const char *scriptID;

        ulocimp_getScript_48(localeID+1, ((void *)0), 0, &scriptID);
        if(scriptID != localeID+1) {

            localeID = scriptID;
        }
        if((*localeID == '_' || *localeID == '-')) {
            i=ulocimp_getCountry_48(localeID+1, country, countryCapacity, ((void *)0));
        }
    }
    return u_terminateChars_48(country, countryCapacity, i, err);
}

extern int32_t
uloc_getVariant_48(const char* localeID,
                char* variant,
                int32_t variantCapacity,
                UErrorCode* err)
{
    char tempBuffer[157];
    const char* tmpLocaleID;
    int32_t i=0;

    if(err==((void *)0) || ((*err)>U_ZERO_ERROR)) {
        return 0;
    }

    if ((localeID && strstr(localeID, "@") == ((void *)0) && getShortestSubtagLength(localeID) == 1)) {
        if (uloc_forLanguageTag_48(localeID, tempBuffer, sizeof(tempBuffer), ((void *)0), err) <= 0 || ((*err)>U_ZERO_ERROR)) { tmpLocaleID=localeID; } else { tmpLocaleID=tempBuffer; };
    } else {
        if (localeID==((void *)0)) {
           localeID=uloc_getDefault_48();
        }
        tmpLocaleID=localeID;
    }


    ulocimp_getLanguage_48(tmpLocaleID, ((void *)0), 0, &tmpLocaleID);
    if((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
        const char *scriptID;

        ulocimp_getScript_48(tmpLocaleID+1, ((void *)0), 0, &scriptID);
        if(scriptID != tmpLocaleID+1) {

            tmpLocaleID = scriptID;
        }

        if ((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {
            const char *cntryID;
            ulocimp_getCountry_48(tmpLocaleID+1, ((void *)0), 0, &cntryID);
            if (cntryID != tmpLocaleID+1) {

                tmpLocaleID = cntryID;
            }
            if((*tmpLocaleID == '_' || *tmpLocaleID == '-')) {

                if (tmpLocaleID != cntryID && (tmpLocaleID[1] == '_' || tmpLocaleID[1] == '-')) {
                    tmpLocaleID++;
                }
                i=_getVariant(tmpLocaleID+1, *tmpLocaleID, variant, variantCapacity);
            }
        }
    }
# 2024 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
    return u_terminateChars_48(variant, variantCapacity, i, err);
}

extern int32_t
uloc_getName_48(const char* localeID,
             char* name,
             int32_t nameCapacity,
             UErrorCode* err)
{
    return _canonicalize(localeID, name, nameCapacity, 0, err);
}

extern int32_t
uloc_getBaseName_48(const char* localeID,
                 char* name,
                 int32_t nameCapacity,
                 UErrorCode* err)
{
    return _canonicalize(localeID, name, nameCapacity, 0x2, err);
}

extern int32_t
uloc_canonicalize_48(const char* localeID,
                  char* name,
                  int32_t nameCapacity,
                  UErrorCode* err)
{
    return _canonicalize(localeID, name, nameCapacity, 0x1, err);
}

extern const char*
uloc_getISO3Language_48(const char* localeID)
{
    int16_t offset;
    char lang[12];
    UErrorCode err = U_ZERO_ERROR;

    if (localeID == ((void *)0))
    {
        localeID = uloc_getDefault_48();
    }
    uloc_getLanguage_48(localeID, lang, 12, &err);
    if (((err)>U_ZERO_ERROR))
        return "";
    offset = _findIndex(LANGUAGES, lang);
    if (offset < 0)
        return "";
    return LANGUAGES_3[offset];
}

extern const char*
uloc_getISO3Country_48(const char* localeID)
{
    int16_t offset;
    char cntry[12];
    UErrorCode err = U_ZERO_ERROR;

    if (localeID == ((void *)0))
    {
        localeID = uloc_getDefault_48();
    }
    uloc_getCountry_48(localeID, cntry, 12, &err);
    if (((err)>U_ZERO_ERROR))
        return "";
    offset = _findIndex(COUNTRIES, cntry);
    if (offset < 0)
        return "";

    return COUNTRIES_3[offset];
}

extern uint32_t
uloc_getLCID_48(const char* localeID)
{
    UErrorCode status = U_ZERO_ERROR;
    char langID[157];

    uloc_getLanguage_48(localeID, langID, sizeof(langID), &status);
    if (((status)>U_ZERO_ERROR)) {
        return 0;
    }

    return uprv_convertToLCID_48(langID, localeID, &status);
}

extern int32_t
uloc_getLocaleForLCID_48(uint32_t hostid, char *locale, int32_t localeCapacity,
                UErrorCode *status)
{
    int32_t length;
    const char *posix = uprv_convertToPosix_48(hostid, status);
    if (((*status)>U_ZERO_ERROR) || posix == ((void *)0)) {
        return 0;
    }
    length = (int32_t) strlen(posix);
    if (length+1 > localeCapacity) {
        *status = U_BUFFER_OVERFLOW_ERROR;
    }
    else {
        strcpy(locale, posix);
    }
    return length;
}



extern const char*
uloc_getDefault_48()
{
    return locale_get_default_48();
}

extern void
uloc_setDefault_48(const char* newDefaultLocale,
             UErrorCode* err)
{
    if (((*err)>U_ZERO_ERROR))
        return;



    locale_set_default_48(newDefaultLocale);
}







extern const char* const*
uloc_getISOLanguages_48()
{
    return LANGUAGES;
}







extern const char* const*
uloc_getISOCountries_48()
{
    return COUNTRIES;
}



static char gDecimal = 0;

static
double

_uloc_strtod(const char *start, char **end) {
    char *decimal;
    char *myEnd;
    char buf[30];
    double rv;
    if (!gDecimal) {
        char rep[5];



        sprintf(rep, "%+1.1f", 1.0);
        gDecimal = rep[2];
    }

    if(gDecimal == '.') {
        return strtod(start, end);
    } else {
        strncpy(buf, start, 29);
        buf[29]=0;
        decimal = strchr(buf, '.');
        if(decimal) {
            *decimal = gDecimal;
        } else {
            return strtod(start, end);
        }
        rv = strtod(buf, &myEnd);
        if(end) {
            *end = (char*)(start+(myEnd-buf));
        }
        return rv;
    }
}

typedef struct {
    float q;
    int32_t dummy;
    char *locale;
} _acceptLangItem;

static int32_t
uloc_acceptLanguageCompare(const void *context, const void *a, const void *b)
{
    const _acceptLangItem *aa = (const _acceptLangItem*)a;
    const _acceptLangItem *bb = (const _acceptLangItem*)b;

    int32_t rc = 0;
    if(bb->q < aa->q) {
        rc = -1;
    } else if(bb->q > aa->q) {
        rc = 1;
    } else {
        rc = 0;
    }

    if(rc==0) {
        rc = T_CString_stricmp_48(aa->locale, bb->locale);
    }
# 2244 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc.c"
    return rc;
}





extern int32_t
uloc_acceptLanguageFromHTTP_48(char *result, int32_t resultAvailable, UAcceptResult *outResult,
                            const char *httpAcceptLanguage,
                            UEnumeration* availableLocales,
                            UErrorCode *status)
{
    _acceptLangItem *j;
    _acceptLangItem smallBuffer[30];
    char **strs;
    char tmp[157 +1];
    int32_t n = 0;
    const char *itemEnd;
    const char *paramEnd;
    const char *s;
    const char *t;
    int32_t res;
    int32_t i;
    int32_t l = (int32_t) strlen(httpAcceptLanguage);
    int32_t jSize;
    char *tempstr;

    j = smallBuffer;
    jSize = sizeof(smallBuffer)/sizeof(smallBuffer[0]);
    if(((*status)>U_ZERO_ERROR)) {
        return -1;
    }

    for(s=httpAcceptLanguage;s&&*s;) {
        while(isspace(*s))
            s++;
        itemEnd= strchr(s, ',');
        paramEnd= strchr(s, ';');
        if(!itemEnd) {
            itemEnd = httpAcceptLanguage+l;
        }
        if(paramEnd && paramEnd<itemEnd) {

            t = paramEnd+1;
            if(*t=='q') {
                t++;
            }
            while(isspace(*t)) {
                t++;
            }
            if(*t=='=') {
                t++;
            }
            while(isspace(*t)) {
                t++;
            }
            j[n].q = (float)_uloc_strtod(t,((void *)0));
        } else {

            j[n].q = 1.0f;
            paramEnd = itemEnd;
        }
        j[n].dummy=0;

        for(t=(paramEnd-1);(paramEnd>s)&&isspace(*t);t--)
            ;

        tempstr = uprv_strndup_48(s,(int32_t)((t+1)-s));
        if (tempstr == ((void *)0)) {
            *status = U_MEMORY_ALLOCATION_ERROR;
            return -1;
        }
        j[n].locale = tempstr;
        uloc_canonicalize_48(j[n].locale,tmp,sizeof(tmp)/sizeof(tmp[0]),status);
        if(strcmp(j[n].locale,tmp)) {
            uprv_free_48(j[n].locale);
            j[n].locale=uprv_strdup_48(tmp);
        }



        n++;
        s = itemEnd;
        while(*s==',') {
            s++;
        }
        if(n>=jSize) {
            if(j==smallBuffer) {
                j = uprv_malloc_48(sizeof(j[0])*(jSize*2));
                if(j!=((void *)0)) {
                    memcpy(j, smallBuffer, sizeof(j[0])*jSize);
                }



            } else {
                j = uprv_realloc_48(j, sizeof(j[0])*jSize*2);



            }
            jSize *= 2;
            if(j==((void *)0)) {
                *status = U_MEMORY_ALLOCATION_ERROR;
                return -1;
            }
        }
    }
    uprv_sortArray_48(j, n, sizeof(j[0]), uloc_acceptLanguageCompare, ((void *)0), 1, status);
    if(((*status)>U_ZERO_ERROR)) {
        if(j != smallBuffer) {



            uprv_free_48(j);
        }
        return -1;
    }
    strs = uprv_malloc_48((size_t)(sizeof(strs[0])*n));

    if (strs == ((void *)0)) {
        uprv_free_48(j);
        *status = U_MEMORY_ALLOCATION_ERROR;
        return -1;
    }
    for(i=0;i<n;i++) {



        strs[i]=j[i].locale;
    }
    res = uloc_acceptLanguage_48(result, resultAvailable, outResult,
        (const char**)strs, n, availableLocales, status);
    for(i=0;i<n;i++) {
        uprv_free_48(strs[i]);
    }
    uprv_free_48(strs);
    if(j != smallBuffer) {



        uprv_free_48(j);
    }
    return res;
}


extern int32_t
uloc_acceptLanguage_48(char *result, int32_t resultAvailable,
                    UAcceptResult *outResult, const char **acceptList,
                    int32_t acceptListCount,
                    UEnumeration* availableLocales,
                    UErrorCode *status)
{
    int32_t i,j;
    int32_t len;
    int32_t maxLen=0;
    char tmp[157 +1];
    const char *l;
    char **fallbackList;
    if(((*status)>U_ZERO_ERROR)) {
        return -1;
    }
    fallbackList = uprv_malloc_48((size_t)(sizeof(fallbackList[0])*acceptListCount));
    if(fallbackList==((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        return -1;
    }
    for(i=0;i<acceptListCount;i++) {



        while((l=uenum_next_48(availableLocales, ((void *)0), status))) {



            len = (int32_t) strlen(l);
            if(! strcmp(acceptList[i], l)) {
                if(outResult) {
                    *outResult = ULOC_ACCEPT_VALID;
                }



                if(len>0) {
                    strncpy(result, l, uprv_min_48(len, resultAvailable));
                }
                for(j=0;j<i;j++) {
                    uprv_free_48(fallbackList[j]);
                }
                uprv_free_48(fallbackList);
                return u_terminateChars_48(result, resultAvailable, len, status);
            }
            if(len>maxLen) {
                maxLen = len;
            }
        }
        uenum_reset_48(availableLocales, status);

        if(uloc_getParent_48(acceptList[i], tmp, sizeof(tmp)/sizeof(tmp[0]), status)!=0) {
            fallbackList[i] = uprv_strdup_48(tmp);
        } else {
            fallbackList[i]=0;
        }
    }

    for(maxLen--;maxLen>0;maxLen--) {
        for(i=0;i<acceptListCount;i++) {
            if(fallbackList[i] && ((int32_t) strlen(fallbackList[i])==maxLen)) {



                while((l=uenum_next_48(availableLocales, ((void *)0), status))) {



                    len = (int32_t) strlen(l);
                    if(! strcmp(fallbackList[i], l)) {
                        if(outResult) {
                            *outResult = ULOC_ACCEPT_FALLBACK;
                        }



                        if(len>0) {
                            strncpy(result, l, uprv_min_48(len, resultAvailable));
                        }
                        for(j=0;j<acceptListCount;j++) {
                            uprv_free_48(fallbackList[j]);
                        }
                        uprv_free_48(fallbackList);
                        return u_terminateChars_48(result, resultAvailable, len, status);
                    }
                }
                uenum_reset_48(availableLocales, status);

                if(uloc_getParent_48(fallbackList[i], tmp, sizeof(tmp)/sizeof(tmp[0]), status)!=0) {
                    uprv_free_48(fallbackList[i]);
                    fallbackList[i] = uprv_strdup_48(tmp);
                } else {
                    uprv_free_48(fallbackList[i]);
                    fallbackList[i]=0;
                }
            }
        }
        if(outResult) {
            *outResult = ULOC_ACCEPT_FAILED;
        }
    }
    for(i=0;i<acceptListCount;i++) {
        uprv_free_48(fallbackList[i]);
    }
    uprv_free_48(fallbackList);
    return -1;
}
