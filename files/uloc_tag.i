# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"







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
# 9 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h" 1
# 27 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
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
# 28 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h" 2
# 52 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
struct UResourceBundle;




typedef struct UResourceBundle UResourceBundle;






typedef enum {

    URES_NONE=-1,


    URES_STRING=0,


    URES_BINARY=1,


    URES_TABLE=2,
# 84 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
    URES_ALIAS=3,
# 93 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
    URES_INT=7,


    URES_ARRAY=8,






    URES_INT_VECTOR = 14,


    RES_NONE=URES_NONE,

    RES_STRING=URES_STRING,

    RES_BINARY=URES_BINARY,

    RES_TABLE=URES_TABLE,

    RES_ALIAS=URES_ALIAS,

    RES_INT=URES_INT,

    RES_ARRAY=URES_ARRAY,

    RES_INT_VECTOR=URES_INT_VECTOR,

    RES_RESERVED=15,


    URES_LIMIT = 16
} UResType;
# 160 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResourceBundle*
ures_open_48(const char* packageName,
          const char* locale,
          UErrorCode* status);
# 183 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResourceBundle*
ures_openDirect_48(const char* packageName,
                const char* locale,
                UErrorCode* status);
# 206 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResourceBundle*
ures_openU_48(const UChar* packageName,
           const char* locale,
           UErrorCode* status);
# 227 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern int32_t
ures_countArrayItems_48(const UResourceBundle* resourceBundle,
                     const char* resourceKey,
                     UErrorCode* err);
# 239 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern void
ures_close_48(UResourceBundle* resourceBundle);
# 271 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char*
ures_getVersionNumber_48(const UResourceBundle* resourceBundle);
# 283 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern void
ures_getVersion_48(const UResourceBundle* resB,
                UVersionInfo versionInfo);
# 299 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char*
ures_getLocale_48(const UResourceBundle* resourceBundle,
               UErrorCode* status);
# 316 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char*
ures_getLocaleByType_48(const UResourceBundle* resourceBundle,
                     ULocDataLocaleType type,
                     UErrorCode* status);
# 338 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern void
ures_openFillIn_48(UResourceBundle *r,
                const char* packageName,
                const char* localeID,
                UErrorCode* status);
# 361 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const UChar*
ures_getString_48(const UResourceBundle* resourceBundle,
               int32_t* len,
               UErrorCode* status);
# 413 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char *
ures_getUTF8String_48(const UResourceBundle *resB,
                   char *dest, int32_t *length,
                   UBool forceCopy,
                   UErrorCode *status);
# 436 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const uint8_t*
ures_getBinary_48(const UResourceBundle* resourceBundle,
               int32_t* len,
               UErrorCode* status);
# 458 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const int32_t*
ures_getIntVector_48(const UResourceBundle* resourceBundle,
                  int32_t* len,
                  UErrorCode* status);
# 479 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern uint32_t
ures_getUInt_48(const UResourceBundle* resourceBundle,
             UErrorCode *status);
# 499 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern int32_t
ures_getInt_48(const UResourceBundle* resourceBundle,
            UErrorCode *status);
# 513 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern int32_t
ures_getSize_48(const UResourceBundle *resourceBundle);
# 524 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResType
ures_getType_48(const UResourceBundle *resourceBundle);
# 535 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char *
ures_getKey_48(const UResourceBundle *resourceBundle);
# 548 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern void
ures_resetIterator_48(UResourceBundle *resourceBundle);
# 558 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UBool
ures_hasNext_48(const UResourceBundle *resourceBundle);
# 573 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResourceBundle*
ures_getNextResource_48(UResourceBundle *resourceBundle,
                     UResourceBundle *fillIn,
                     UErrorCode *status);
# 590 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const UChar*
ures_getNextString_48(UResourceBundle *resourceBundle,
                   int32_t* len,
                   const char ** key,
                   UErrorCode *status);
# 608 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResourceBundle*
ures_getByIndex_48(const UResourceBundle *resourceBundle,
                int32_t indexR,
                UResourceBundle *fillIn,
                UErrorCode *status);
# 625 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const UChar*
ures_getStringByIndex_48(const UResourceBundle *resourceBundle,
                      int32_t indexS,
                      int32_t* len,
                      UErrorCode *status);
# 679 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char *
ures_getUTF8StringByIndex_48(const UResourceBundle *resB,
                          int32_t stringIndex,
                          char *dest, int32_t *pLength,
                          UBool forceCopy,
                          UErrorCode *status);
# 698 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UResourceBundle*
ures_getByKey_48(const UResourceBundle *resourceBundle,
              const char* key,
              UResourceBundle *fillIn,
              UErrorCode *status);
# 716 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const UChar*
ures_getStringByKey_48(const UResourceBundle *resB,
                    const char* key,
                    int32_t* len,
                    UErrorCode *status);
# 772 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern const char *
ures_getUTF8StringByKey_48(const UResourceBundle *resB,
                        const char *key,
                        char *dest, int32_t *pLength,
                        UBool forceCopy,
                        UErrorCode *status);
# 874 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
extern UEnumeration*
ures_openAvailableLocales_48(const char *packageName, UErrorCode *status);
# 10 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
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
# 11 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h" 1
# 12 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
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
# 13 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
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
# 14 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
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
# 15 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/putilimp.h" 1
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
# 16 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uinvchar.h" 1
# 35 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uinvchar.h"
extern UBool
uprv_isInvariantString_48(const char *s, int32_t length);
# 48 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uinvchar.h"
extern UBool
uprv_isInvariantUString_48(const UChar *s, int32_t length);
# 70 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uinvchar.h"
extern int32_t
uprv_compareInvEbcdicAsAscii_48(const char *s1, const char *s2);
# 90 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uinvchar.h"
extern char
uprv_ebcdicToLowercaseAscii_48(char c);
# 111 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uinvchar.h"
extern uint8_t*
uprv_aestrncpy_48(uint8_t *dst, const uint8_t *src, int32_t n);







extern uint8_t*
uprv_eastrncpy_48(uint8_t *dst, const uint8_t *src, int32_t n);
# 17 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2
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
# 18 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c" 2


typedef struct VariantListEntry {
    const char *variant;
    struct VariantListEntry *next;
} VariantListEntry;


typedef struct AttributeListEntry {
    const char *attribute;
    struct AttributeListEntry *next;
} AttributeListEntry;


typedef struct ExtensionListEntry {
    const char *key;
    const char *value;
    struct ExtensionListEntry *next;
} ExtensionListEntry;


typedef struct ULanguageTag {
    char *buf;
    const char *language;
    const char *extlang[3];
    const char *script;
    const char *region;
    VariantListEntry *variants;
    ExtensionListEntry *extensions;
    AttributeListEntry *attributes;
    const char *privateuse;
    const char *grandfathered;
} ULanguageTag;
# 65 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static const char* EMPTY = "";
static const char* LANG_UND = "und";
static const char* PRIVATEUSE_KEY = "x";
static const char* _POSIX = "_POSIX";
static const char* POSIX_KEY = "va";
static const char* POSIX_VALUE = "posix";
static const char* LOCALE_ATTRIBUTE_KEY = "attribute";
static const char* PRIVUSE_VARIANT_PREFIX = "lvariant";



static const char* GRANDFATHERED[] = {

    "art-lojban", "jbo",
    "cel-gaulish", "xtg-x-cel-gaulish",
    "en-GB-oed", "en-GB-x-oed",
    "i-ami", "ami",
    "i-bnn", "bnn",
    "i-default", "en-x-i-default",
    "i-enochian", "und-x-i-enochian",
    "i-hak", "hak",
    "i-klingon", "tlh",
    "i-lux", "lb",
    "i-mingo", "see-x-i-mingo",
    "i-navajo", "nv",
    "i-pwn", "pwn",
    "i-tao", "tao",
    "i-tay", "tay",
    "i-tsu", "tsu",
    "no-bok", "nb",
    "no-nyn", "nn",
    "sgn-be-fr", "sfb",
    "sgn-be-nl", "vgt",
    "sgn-ch-de", "sgg",
    "zh-guoyu", "cmn",
    "zh-hakka", "hak",
    "zh-min", "nan-x-zh-min",
    "zh-min-nan", "nan",
    "zh-xiang", "hsn",
    ((void *)0), ((void *)0)
};

static const char* DEPRECATEDLANGS[] = {

    "iw", "he",
    "ji", "yi",
    "in", "id",
    ((void *)0), ((void *)0)
};
# 123 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static ULanguageTag*
ultag_parse(const char* tag, int32_t tagLen, int32_t* parsedLen, UErrorCode* status);

static void
ultag_close(ULanguageTag* langtag);

static const char*
ultag_getLanguage(const ULanguageTag* langtag);






static const char*
ultag_getExtlang(const ULanguageTag* langtag, int32_t idx);

static int32_t
ultag_getExtlangSize(const ULanguageTag* langtag);

static const char*
ultag_getScript(const ULanguageTag* langtag);

static const char*
ultag_getRegion(const ULanguageTag* langtag);

static const char*
ultag_getVariant(const ULanguageTag* langtag, int32_t idx);

static int32_t
ultag_getVariantsSize(const ULanguageTag* langtag);







static int32_t
ultag_getAttributesSize(const ULanguageTag* langtag);

static const char*
ultag_getExtensionKey(const ULanguageTag* langtag, int32_t idx);

static const char*
ultag_getExtensionValue(const ULanguageTag* langtag, int32_t idx);

static int32_t
ultag_getExtensionsSize(const ULanguageTag* langtag);

static const char*
ultag_getPrivateUse(const ULanguageTag* langtag);
# 189 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static UBool
_isAlphaString(const char* s, int32_t len) {
    int32_t i;
    for (i = 0; i < len; i++) {
        if (!(((*(s + i))>='A' && (*(s + i))<='Z') || ((*(s + i))>='a' && (*(s + i))<='z'))) {
            return 0;
        }
    }
    return 1;
}

static UBool
_isNumericString(const char* s, int32_t len) {
    int32_t i;
    for (i = 0; i < len; i++) {
        if (!((*(s + i))>='0' && (*(s + i))<='9')) {
            return 0;
        }
    }
    return 1;
}

static UBool
_isAlphaNumericString(const char* s, int32_t len) {
    int32_t i;
    for (i = 0; i < len; i++) {
        if (!(((*(s + i))>='A' && (*(s + i))<='Z') || ((*(s + i))>='a' && (*(s + i))<='z')) && !((*(s + i))>='0' && (*(s + i))<='9')) {
            return 0;
        }
    }
    return 1;
}

static UBool
_isLanguageSubtag(const char* s, int32_t len) {







    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 2 && len <= 8 && _isAlphaString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isExtlangSubtag(const char* s, int32_t len) {




    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len == 3 && _isAlphaString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isScriptSubtag(const char* s, int32_t len) {



    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len == 4 && _isAlphaString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isRegionSubtag(const char* s, int32_t len) {




    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len == 2 && _isAlphaString(s, len)) {
        return 1;
    }
    if (len == 3 && _isNumericString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isVariantSubtag(const char* s, int32_t len) {




    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 5 && len <= 8 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    if (len == 4 && ((*s)>='0' && (*s)<='9') && _isAlphaNumericString(s + 1, 3)) {
        return 1;
    }
    return 0;
}

static UBool
_isPrivateuseVariantSubtag(const char* s, int32_t len) {




    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 1 && len <= 8 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isAttributeSubtag(const char* s, int32_t len) {



    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 3 && len <= 8 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isExtensionSingleton(const char* s, int32_t len) {



    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len == 1 && (((*s)>='A' && (*s)<='Z') || ((*s)>='a' && (*s)<='z')) && (uprv_asciitolower_48(*s) != 'x')) {
        return 1;
    }
    return 0;
}

static UBool
_isExtensionSubtag(const char* s, int32_t len) {



    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 2 && len <= 8 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isExtensionSubtags(const char* s, int32_t len) {
    const char *p = s;
    const char *pSubtag = ((void *)0);

    if (len < 0) {
        len = (int32_t) strlen(s);
    }

    while ((p - s) < len) {
        if (*p == '-') {
            if (pSubtag == ((void *)0)) {
                return 0;
            }
            if (!_isExtensionSubtag(pSubtag, (int32_t)(p - pSubtag))) {
                return 0;
            }
            pSubtag = ((void *)0);
        } else if (pSubtag == ((void *)0)) {
            pSubtag = p;
        }
        p++;
    }
    if (pSubtag == ((void *)0)) {
        return 0;
    }
    return _isExtensionSubtag(pSubtag, (int32_t)(p - pSubtag));
}

static UBool
_isPrivateuseValueSubtag(const char* s, int32_t len) {



    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 1 && len <= 8 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isPrivateuseValueSubtags(const char* s, int32_t len) {
    const char *p = s;
    const char *pSubtag = ((void *)0);

    if (len < 0) {
        len = (int32_t) strlen(s);
    }

    while ((p - s) < len) {
        if (*p == '-') {
            if (pSubtag == ((void *)0)) {
                return 0;
            }
            if (!_isPrivateuseValueSubtag(pSubtag, (int32_t)(p - pSubtag))) {
                return 0;
            }
            pSubtag = ((void *)0);
        } else if (pSubtag == ((void *)0)) {
            pSubtag = p;
        }
        p++;
    }
    if (pSubtag == ((void *)0)) {
        return 0;
    }
    return _isPrivateuseValueSubtag(pSubtag, (int32_t)(p - pSubtag));
}

static UBool
_isLDMLKey(const char* s, int32_t len) {
    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len == 2 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    return 0;
}

static UBool
_isLDMLType(const char* s, int32_t len) {
    if (len < 0) {
        len = (int32_t) strlen(s);
    }
    if (len >= 3 && len <= 8 && _isAlphaNumericString(s, len)) {
        return 1;
    }
    return 0;
}
# 464 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static UBool
_addVariantToList(VariantListEntry **first, VariantListEntry *var) {
    UBool bAdded = 1;

    if (*first == ((void *)0)) {
        var->next = ((void *)0);
        *first = var;
    } else {
        VariantListEntry *prev, *cur;
        int32_t cmp;


        prev = ((void *)0);
        cur = *first;
        while (1) {
            if (cur == ((void *)0)) {
                prev->next = var;
                var->next = ((void *)0);
                break;
            }


            cmp = strcmp(var->variant, cur->variant);
            if (cmp == 0) {

                bAdded = 0;
                break;
            }
            prev = cur;
            cur = cur->next;
        }
    }

    return bAdded;
}

static UBool
_addAttributeToList(AttributeListEntry **first, AttributeListEntry *attr) {
    UBool bAdded = 1;

    if (*first == ((void *)0)) {
        attr->next = ((void *)0);
        *first = attr;
    } else {
        AttributeListEntry *prev, *cur;
        int32_t cmp;


        prev = ((void *)0);
        cur = *first;
        while (1) {
            if (cur == ((void *)0)) {
                prev->next = attr;
                attr->next = ((void *)0);
                break;
            }
            cmp = strcmp(attr->attribute, cur->attribute);
            if (cmp < 0) {
                if (prev == ((void *)0)) {
                    *first = attr;
                } else {
                    prev->next = attr;
                }
                attr->next = cur;
                break;
            }
            if (cmp == 0) {

                bAdded = 0;
                break;
            }
            prev = cur;
            cur = cur->next;
        }
    }

    return bAdded;
}


static UBool
_addExtensionToList(ExtensionListEntry **first, ExtensionListEntry *ext, UBool localeToBCP) {
    UBool bAdded = 1;

    if (*first == ((void *)0)) {
        ext->next = ((void *)0);
        *first = ext;
    } else {
        ExtensionListEntry *prev, *cur;
        int32_t cmp;


        prev = ((void *)0);
        cur = *first;
        while (1) {
            if (cur == ((void *)0)) {
                prev->next = ext;
                ext->next = ((void *)0);
                break;
            }
            if (localeToBCP) {

                int32_t len, curlen;

                len = (int32_t) strlen(ext->key);
                curlen = (int32_t) strlen(cur->key);

                if (len == 1 && curlen == 1) {
                    if (*(ext->key) == *(cur->key)) {
                        cmp = 0;
                    } else if (*(ext->key) == 'x') {
                        cmp = 1;
                    } else if (*(cur->key) == 'x') {
                        cmp = -1;
                    } else {
                        cmp = *(ext->key) - *(cur->key);
                    }
                } else if (len == 1) {
                    cmp = *(ext->key) - 'u';
                } else if (curlen == 1) {
                    cmp = 'u' - *(cur->key);
                } else {
                    cmp = strcmp(ext->key, cur->key);
                }
            } else {
                cmp = strcmp(ext->key, cur->key);
            }
            if (cmp < 0) {
                if (prev == ((void *)0)) {
                    *first = ext;
                } else {
                    prev->next = ext;
                }
                ext->next = cur;
                break;
            }
            if (cmp == 0) {

                bAdded = 0;
                break;
            }
            prev = cur;
            cur = cur->next;
        }
    }

    return bAdded;
}

static void
_initializeULanguageTag(ULanguageTag* langtag) {
    int32_t i;

    langtag->buf = ((void *)0);

    langtag->language = EMPTY;
    for (i = 0; i < 3; i++) {
        langtag->extlang[i] = ((void *)0);
    }

    langtag->script = EMPTY;
    langtag->region = EMPTY;

    langtag->variants = ((void *)0);
    langtag->extensions = ((void *)0);

    langtag->attributes = ((void *)0);

    langtag->grandfathered = EMPTY;
    langtag->privateuse = EMPTY;
}
# 644 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static int32_t
_ldmlKeyToBCP47(const char* key, int32_t keyLen,
                char* bcpKey, int32_t bcpKeyCapacity,
                UErrorCode *status) {
    UResourceBundle *rb;
    char keyBuf[22];
    char bcpKeyBuf[9];
    int32_t resultLen = 0;
    int32_t i;
    UErrorCode tmpStatus = U_ZERO_ERROR;
    const UChar *uBcpKey;
    int32_t bcpKeyLen;

    if (keyLen < 0) {
        keyLen = (int32_t) strlen(key);
    }

    if (keyLen >= sizeof(keyBuf)) {

        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }

    memcpy(keyBuf, key, keyLen);
    keyBuf[keyLen] = 0;


    for (i = 0; i < keyLen; i++) {
        keyBuf[i] = uprv_asciitolower_48(keyBuf[i]);
    }

    rb = ures_openDirect_48(((void *)0), "keyTypeData", status);
    ures_getByKey_48(rb, "keyMap", rb, status);

    if (((*status)>U_ZERO_ERROR)) {
        ures_close_48(rb);
        return 0;
    }

    uBcpKey = ures_getStringByKey_48(rb, keyBuf, &bcpKeyLen, &tmpStatus);
    if (((tmpStatus)<=U_ZERO_ERROR)) {
        u_UCharsToChars_48(uBcpKey, bcpKeyBuf, bcpKeyLen);
        bcpKeyBuf[bcpKeyLen] = 0;
        resultLen = bcpKeyLen;
    } else {
        if (_isLDMLKey(key, keyLen)) {
            memcpy(bcpKeyBuf, key, keyLen);
            bcpKeyBuf[keyLen] = 0;
            resultLen = keyLen;
        } else {

            *status = U_ILLEGAL_ARGUMENT_ERROR;
        }
    }
    ures_close_48(rb);

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    memcpy(bcpKey, bcpKeyBuf, uprv_min_48(resultLen, bcpKeyCapacity));
    return u_terminateChars_48(bcpKey, bcpKeyCapacity, resultLen, status);
}

static int32_t
_bcp47ToLDMLKey(const char* bcpKey, int32_t bcpKeyLen,
                char* key, int32_t keyCapacity,
                UErrorCode *status) {
    UResourceBundle *rb;
    char bcpKeyBuf[9];
    int32_t resultLen = 0;
    int32_t i;
    const char *resKey = ((void *)0);
    UResourceBundle *mapData;

    if (bcpKeyLen < 0) {
        bcpKeyLen = (int32_t) strlen(bcpKey);
    }

    if (bcpKeyLen >= sizeof(bcpKeyBuf)) {
        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }

    memcpy(bcpKeyBuf, bcpKey, bcpKeyLen);
    bcpKeyBuf[bcpKeyLen] = 0;


    for (i = 0; i < bcpKeyLen; i++) {
        bcpKeyBuf[i] = uprv_asciitolower_48(bcpKeyBuf[i]);
    }

    rb = ures_openDirect_48(((void *)0), "keyTypeData", status);
    ures_getByKey_48(rb, "keyMap", rb, status);
    if (((*status)>U_ZERO_ERROR)) {
        ures_close_48(rb);
        return 0;
    }

    mapData = ures_getNextResource_48(rb, ((void *)0), status);
    while (((*status)<=U_ZERO_ERROR)) {
        const UChar *uBcpKey;
        char tmpBcpKeyBuf[9];
        int32_t tmpBcpKeyLen;

        uBcpKey = ures_getString_48(mapData, &tmpBcpKeyLen, status);
        if (((*status)>U_ZERO_ERROR)) {
            break;
        }
        u_UCharsToChars_48(uBcpKey, tmpBcpKeyBuf, tmpBcpKeyLen);
        tmpBcpKeyBuf[tmpBcpKeyLen] = 0;
        if ( strcmp(bcpKeyBuf, tmpBcpKeyBuf) == 0) {

            resKey = ures_getKey_48(mapData);
            resultLen = (int32_t) strlen(resKey);
            break;
        }
        if (!ures_hasNext_48(rb)) {
            break;
        }
        ures_getNextResource_48(rb, mapData, status);
    }
    ures_close_48(mapData);
    ures_close_48(rb);

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    if (resKey == ((void *)0)) {
        resKey = bcpKeyBuf;
        resultLen = bcpKeyLen;
    }

    memcpy(key, resKey, uprv_min_48(resultLen, keyCapacity));
    return u_terminateChars_48(key, keyCapacity, resultLen, status);
}

static int32_t
_ldmlTypeToBCP47(const char* key, int32_t keyLen,
                 const char* type, int32_t typeLen,
                 char* bcpType, int32_t bcpTypeCapacity,
                 UErrorCode *status) {
    UResourceBundle *rb, *keyTypeData, *typeMapForKey;
    char keyBuf[22];
    char typeBuf[32];
    char bcpTypeBuf[9];
    int32_t resultLen = 0;
    int32_t i;
    UErrorCode tmpStatus = U_ZERO_ERROR;
    const UChar *uBcpType, *uCanonicalType;
    int32_t bcpTypeLen, canonicalTypeLen;
    UBool isTimezone = 0;

    if (keyLen < 0) {
        keyLen = (int32_t) strlen(key);
    }
    if (keyLen >= sizeof(keyBuf)) {

        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }
    memcpy(keyBuf, key, keyLen);
    keyBuf[keyLen] = 0;


    for (i = 0; i < keyLen; i++) {
        keyBuf[i] = uprv_asciitolower_48(keyBuf[i]);
    }
    if ( strcmp(keyBuf, "timezone") == 0) {
        isTimezone = 1;
    }

    if (typeLen < 0) {
        typeLen = (int32_t) strlen(type);
    }
    if (typeLen >= sizeof(typeBuf)) {
        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }

    if (isTimezone) {

        for (i = 0; i < typeLen; i++) {
            if (*(type + i) == '/') {
                typeBuf[i] = ':';
            } else {
                typeBuf[i] = *(type + i);
            }
        }
        typeBuf[typeLen] = 0;
        type = &typeBuf[0];
    }

    keyTypeData = ures_openDirect_48(((void *)0), "keyTypeData", status);
    rb = ures_getByKey_48(keyTypeData, "typeMap", ((void *)0), status);
    if (((*status)>U_ZERO_ERROR)) {
        ures_close_48(rb);
        ures_close_48(keyTypeData);
        return 0;
    }

    typeMapForKey = ures_getByKey_48(rb, keyBuf, ((void *)0), &tmpStatus);
    uBcpType = ures_getStringByKey_48(typeMapForKey, type, &bcpTypeLen, &tmpStatus);
    if (((tmpStatus)<=U_ZERO_ERROR)) {
        u_UCharsToChars_48(uBcpType, bcpTypeBuf, bcpTypeLen);
        resultLen = bcpTypeLen;
    } else if (tmpStatus == U_MISSING_RESOURCE_ERROR) {

        tmpStatus = U_ZERO_ERROR;
        ures_getByKey_48(keyTypeData, "typeAlias", rb, &tmpStatus);
        ures_getByKey_48(rb, keyBuf, rb, &tmpStatus);
        uCanonicalType = ures_getStringByKey_48(rb, type, &canonicalTypeLen, &tmpStatus);
        if (((tmpStatus)<=U_ZERO_ERROR)) {
            u_UCharsToChars_48(uCanonicalType, typeBuf, canonicalTypeLen);
            if (isTimezone) {

                for (i = 0; i < canonicalTypeLen; i++) {
                    if (typeBuf[i] == '/') {
                        typeBuf[i] = ':';
                    }
                }
            }
            typeBuf[canonicalTypeLen] = 0;


            uBcpType = ures_getStringByKey_48(typeMapForKey, typeBuf, &bcpTypeLen, &tmpStatus);
            if (((tmpStatus)<=U_ZERO_ERROR)) {
                u_UCharsToChars_48(uBcpType, bcpTypeBuf, bcpTypeLen);
                resultLen = bcpTypeLen;
            }
        }
        if (tmpStatus == U_MISSING_RESOURCE_ERROR) {
            if (_isLDMLType(type, typeLen)) {
                memcpy(bcpTypeBuf, type, typeLen);
                resultLen = typeLen;
            } else {

                *status = U_ILLEGAL_ARGUMENT_ERROR;
            }
        }
    } else {
        *status = tmpStatus;
    }
    ures_close_48(rb);
    ures_close_48(typeMapForKey);
    ures_close_48(keyTypeData);

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    memcpy(bcpType, bcpTypeBuf, uprv_min_48(resultLen, bcpTypeCapacity));
    return u_terminateChars_48(bcpType, bcpTypeCapacity, resultLen, status);
}

static int32_t
_bcp47ToLDMLType(const char* key, int32_t keyLen,
                 const char* bcpType, int32_t bcpTypeLen,
                 char* type, int32_t typeCapacity,
                 UErrorCode *status) {
    UResourceBundle *rb;
    char keyBuf[22];
    char bcpTypeBuf[50];
    int32_t resultLen = 0;
    int32_t i, typeSize;
    const char *resType = ((void *)0);
    UResourceBundle *mapData;
    UErrorCode tmpStatus = U_ZERO_ERROR;
    int32_t copyLen;

    if (keyLen < 0) {
        keyLen = (int32_t) strlen(key);
    }

    if (keyLen >= sizeof(keyBuf)) {

        *status = U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }
    memcpy(keyBuf, key, keyLen);
    keyBuf[keyLen] = 0;


    for (i = 0; i < keyLen; i++) {
        keyBuf[i] = uprv_asciitolower_48(keyBuf[i]);
    }


    if (bcpTypeLen < 0) {
        bcpTypeLen = (int32_t) strlen(bcpType);
    }

    typeSize = 0;
    for (i = 0; i < bcpTypeLen; i++) {
        if (bcpType[i] == '-') {
            if (typeSize >= 9) {
                *status = U_ILLEGAL_ARGUMENT_ERROR;
                return 0;
            }
            typeSize = 0;
        } else {
            typeSize++;
        }
    }

    memcpy(bcpTypeBuf, bcpType, bcpTypeLen);
    bcpTypeBuf[bcpTypeLen] = 0;


    for (i = 0; i < bcpTypeLen; i++) {
        bcpTypeBuf[i] = uprv_asciitolower_48(bcpTypeBuf[i]);
    }

    rb = ures_openDirect_48(((void *)0), "keyTypeData", status);
    ures_getByKey_48(rb, "typeMap", rb, status);
    if (((*status)>U_ZERO_ERROR)) {
        ures_close_48(rb);
        return 0;
    }

    ures_getByKey_48(rb, keyBuf, rb, &tmpStatus);
    mapData = ures_getNextResource_48(rb, ((void *)0), &tmpStatus);
    while (((tmpStatus)<=U_ZERO_ERROR)) {
        const UChar *uBcpType;
        char tmpBcpTypeBuf[9];
        int32_t tmpBcpTypeLen;

        uBcpType = ures_getString_48(mapData, &tmpBcpTypeLen, &tmpStatus);
        if (((tmpStatus)>U_ZERO_ERROR)) {
            break;
        }
        u_UCharsToChars_48(uBcpType, tmpBcpTypeBuf, tmpBcpTypeLen);
        tmpBcpTypeBuf[tmpBcpTypeLen] = 0;
        if ( strcmp(bcpTypeBuf, tmpBcpTypeBuf) == 0) {

            resType = ures_getKey_48(mapData);
            resultLen = (int32_t) strlen(resType);
            break;
        }
        if (!ures_hasNext_48(rb)) {
            break;
        }
        ures_getNextResource_48(rb, mapData, &tmpStatus);
    }
    ures_close_48(mapData);
    ures_close_48(rb);

    if (((tmpStatus)>U_ZERO_ERROR) && tmpStatus != U_MISSING_RESOURCE_ERROR) {
        *status = tmpStatus;
        return 0;
    }

    if (resType == ((void *)0)) {
        resType = bcpTypeBuf;
        resultLen = bcpTypeLen;
    }

    copyLen = uprv_min_48(resultLen, typeCapacity);
    memcpy(type, resType, copyLen);

    if ( strcmp(keyBuf, "timezone") == 0) {
        for (i = 0; i < copyLen; i++) {
            if (*(type + i) == ':') {
                *(type + i) = '/';
            }
        }
    }

    return u_terminateChars_48(type, typeCapacity, resultLen, status);
}

static int32_t
_appendLanguageToLanguageTag(const char* localeID, char* appendAt, int32_t capacity, UBool strict, UErrorCode* status) {
    char buf[12];
    UErrorCode tmpStatus = U_ZERO_ERROR;
    int32_t len, i;
    int32_t reslen = 0;

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    len = uloc_getLanguage_48(localeID, buf, sizeof(buf), &tmpStatus);
    if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
        if (strict) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
            return 0;
        }
        len = 0;
    }



    if (len == 0) {
        if (reslen < capacity) {
            memcpy(appendAt + reslen, LANG_UND, uprv_min_48(3, capacity - reslen));
        }
        reslen += 3;
    } else if (!_isLanguageSubtag(buf, len)) {

        if (strict) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
            return 0;
        }
        if (reslen < capacity) {
            memcpy(appendAt + reslen, LANG_UND, uprv_min_48(3, capacity - reslen));
        }
        reslen += 3;
    } else {

        for (i = 0; DEPRECATEDLANGS[i] != ((void *)0); i += 2) {
            if ( strcmp(buf, DEPRECATEDLANGS[i]) == 0) {
                strcpy(buf, DEPRECATEDLANGS[i + 1]);
                len = (int32_t) strlen(buf);
                break;
            }
        }
        if (reslen < capacity) {
            memcpy(appendAt + reslen, buf, uprv_min_48(len, capacity - reslen));
        }
        reslen += len;
    }
    u_terminateChars_48(appendAt, capacity, reslen, status);
    return reslen;
}

static int32_t
_appendScriptToLanguageTag(const char* localeID, char* appendAt, int32_t capacity, UBool strict, UErrorCode* status) {
    char buf[6];
    UErrorCode tmpStatus = U_ZERO_ERROR;
    int32_t len;
    int32_t reslen = 0;

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    len = uloc_getScript_48(localeID, buf, sizeof(buf), &tmpStatus);
    if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
        if (strict) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
        }
        return 0;
    }

    if (len > 0) {
        if (!_isScriptSubtag(buf, len)) {

            if (strict) {
                *status = U_ILLEGAL_ARGUMENT_ERROR;
            }
            return 0;
        } else {
            if (reslen < capacity) {
                *(appendAt + reslen) = '-';
            }
            reslen++;

            if (reslen < capacity) {
                memcpy(appendAt + reslen, buf, uprv_min_48(len, capacity - reslen));
            }
            reslen += len;
        }
    }
    u_terminateChars_48(appendAt, capacity, reslen, status);
    return reslen;
}

static int32_t
_appendRegionToLanguageTag(const char* localeID, char* appendAt, int32_t capacity, UBool strict, UErrorCode* status) {
    char buf[4];
    UErrorCode tmpStatus = U_ZERO_ERROR;
    int32_t len;
    int32_t reslen = 0;

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    len = uloc_getCountry_48(localeID, buf, sizeof(buf), &tmpStatus);
    if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
        if (strict) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
        }
        return 0;
    }

    if (len > 0) {
        if (!_isRegionSubtag(buf, len)) {

            if (strict) {
                *status = U_ILLEGAL_ARGUMENT_ERROR;
            }
            return 0;
        } else {
            if (reslen < capacity) {
                *(appendAt + reslen) = '-';
            }
            reslen++;

            if (reslen < capacity) {
                memcpy(appendAt + reslen, buf, uprv_min_48(len, capacity - reslen));
            }
            reslen += len;
        }
    }
    u_terminateChars_48(appendAt, capacity, reslen, status);
    return reslen;
}

static int32_t
_appendVariantsToLanguageTag(const char* localeID, char* appendAt, int32_t capacity, UBool strict, UBool *hadPosix, UErrorCode* status) {
    char buf[157];
    UErrorCode tmpStatus = U_ZERO_ERROR;
    int32_t len, i;
    int32_t reslen = 0;

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    len = uloc_getVariant_48(localeID, buf, sizeof(buf), &tmpStatus);
    if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
        if (strict) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
        }
        return 0;
    }

    if (len > 0) {
        char *p, *pVar;
        UBool bNext = 1;
        VariantListEntry *var;
        VariantListEntry *varFirst = ((void *)0);

        pVar = ((void *)0);
        p = buf;
        while (bNext) {
            if (*p == '-' || *p == '_' || *p == 0) {
                if (*p == 0) {
                    bNext = 0;
                } else {
                    *p = 0;
                }
                if (pVar == ((void *)0)) {
                    if (strict) {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        break;
                    }

                } else {


                    for (i = 0; *(pVar + i) != 0; i++) {
                        *(pVar + i) = uprv_asciitolower_48(*(pVar + i));
                    }


                    if (_isVariantSubtag(pVar, -1)) {
                        if ( strcmp(pVar, POSIX_VALUE) || len != strlen(POSIX_VALUE)) {

                            var = uprv_malloc_48(sizeof(VariantListEntry));
                            if (var == ((void *)0)) {
                                *status = U_MEMORY_ALLOCATION_ERROR;
                                break;
                            }
                            var->variant = pVar;
                            if (!_addVariantToList(&varFirst, var)) {

                                uprv_free_48(var);
                                if (strict) {
                                    *status = U_ILLEGAL_ARGUMENT_ERROR;
                                    break;
                                }
                            }
                        } else {


                            *hadPosix = 1;
                        }
                    } else if (strict) {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        break;
                    } else if (_isPrivateuseValueSubtag(pVar, -1)) {

                        break;
                    }
                }

                pVar = ((void *)0);
            } else if (pVar == ((void *)0)) {
                pVar = p;
            }
            p++;
        }

        if (((*status)<=U_ZERO_ERROR)) {
            if (varFirst != ((void *)0)) {
                int32_t varLen;


                var = varFirst;
                while (var != ((void *)0)) {
                    if (reslen < capacity) {
                        *(appendAt + reslen) = '-';
                    }
                    reslen++;
                    varLen = (int32_t) strlen(var->variant);
                    if (reslen < capacity) {
                        memcpy(appendAt + reslen, var->variant, uprv_min_48(varLen, capacity - reslen));
                    }
                    reslen += varLen;
                    var = var->next;
                }
            }
        }


        var = varFirst;
        while (var != ((void *)0)) {
            VariantListEntry *tmpVar = var->next;
            uprv_free_48(var);
            var = tmpVar;
        }

        if (((*status)>U_ZERO_ERROR)) {
            return 0;
        }
    }

    u_terminateChars_48(appendAt, capacity, reslen, status);
    return reslen;
}

static int32_t
_appendKeywordsToLanguageTag(const char* localeID, char* appendAt, int32_t capacity, UBool strict, UBool hadPosix, UErrorCode* status) {
    char buf[100];
    char attrBuf[100];
    int32_t attrBufLength = 0;
    UBool isAttribute = 0;
    UEnumeration *keywordEnum = ((void *)0);
    int32_t reslen = 0;

    keywordEnum = uloc_openKeywords_48(localeID, status);
    if (((*status)>U_ZERO_ERROR) && !hadPosix) {
        uenum_close_48(keywordEnum);
        return 0;
    }
    if (keywordEnum != ((void *)0) || hadPosix) {

        int32_t len;
        const char *key;
        ExtensionListEntry *firstExt = ((void *)0);
        ExtensionListEntry *ext;
        AttributeListEntry *firstAttr = ((void *)0);
        AttributeListEntry *attr;
        char *attrValue;
        char extBuf[100];
        char *pExtBuf = extBuf;
        int32_t extBufCapacity = sizeof(extBuf);
        const char *bcpKey, *bcpValue;
        UErrorCode tmpStatus = U_ZERO_ERROR;
        int32_t keylen;
        UBool isLDMLKeyword;

        while (1) {
            isAttribute = 0;
            key = uenum_next_48(keywordEnum, ((void *)0), status);
            if (key == ((void *)0)) {
                break;
            }
            len = uloc_getKeywordValue_48(localeID, key, buf, sizeof(buf), &tmpStatus);
            if (((tmpStatus)>U_ZERO_ERROR)) {
                if (strict) {
                    *status = U_ILLEGAL_ARGUMENT_ERROR;
                    break;
                }

                tmpStatus = U_ZERO_ERROR;
                continue;
            }

            keylen = (int32_t) strlen(key);
            isLDMLKeyword = (keylen > 1);


            if ( strcmp(key, LOCALE_ATTRIBUTE_KEY) == 0) {
                isAttribute = 1;
                if (len > 0) {
                    int32_t i = 0;
                    while (1) {
                        attrBufLength = 0;
                        for (; i < len; i++) {
                            if (buf[i] != '-') {
                                attrBuf[attrBufLength++] = buf[i];
                            } else {
                                i++;
                                break;
                            }
                        }
                        if (attrBufLength > 0) {
                            attrBuf[attrBufLength] = 0;

                        } else if (i >= len){
                            break;
                        }


                        attr = uprv_malloc_48(sizeof(AttributeListEntry));
                        if (attr == ((void *)0)) {
                            *status = U_MEMORY_ALLOCATION_ERROR;
                            break;
                        }
                        attrValue = uprv_malloc_48(attrBufLength + 1);
                        if (attrValue == ((void *)0)) {
                            *status = U_MEMORY_ALLOCATION_ERROR;
                            break;
                        }
                        strcpy(attrValue, attrBuf);
                        attr->attribute = attrValue;

                        if (!_addAttributeToList(&firstAttr, attr)) {
                            uprv_free_48(attr);
                            uprv_free_48(attrValue);
                            if (strict) {
                                *status = U_ILLEGAL_ARGUMENT_ERROR;
                                break;
                            }
                        }
                    }
                }
            } else if (isLDMLKeyword) {
                int32_t modKeyLen;


                modKeyLen = _ldmlKeyToBCP47(key, keylen, pExtBuf, extBufCapacity, &tmpStatus);
                if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
                    if (strict) {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        break;
                    }
                    tmpStatus = U_ZERO_ERROR;
                    continue;
                }

                bcpKey = pExtBuf;
                pExtBuf += (modKeyLen + 1);
                extBufCapacity -= (modKeyLen + 1);

                len = _ldmlTypeToBCP47(key, keylen, buf, len, pExtBuf, extBufCapacity, &tmpStatus);
                if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
                    if (strict) {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        break;
                    }
                    tmpStatus = U_ZERO_ERROR;
                    continue;
                }
                bcpValue = pExtBuf;
                pExtBuf += (len + 1);
                extBufCapacity -= (len + 1);
            } else {
                if (*key == 'x') {
                    if (!_isPrivateuseValueSubtags(buf, len)) {
                        if (strict) {
                            *status = U_ILLEGAL_ARGUMENT_ERROR;
                            break;
                        }
                        continue;
                    }
                } else {
                    if (!_isExtensionSingleton(key, keylen) || !_isExtensionSubtags(buf, len)) {
                        if (strict) {
                            *status = U_ILLEGAL_ARGUMENT_ERROR;
                            break;
                        }
                        continue;
                    }
                }
                bcpKey = key;
                if ((len + 1) < extBufCapacity) {
                    memcpy(pExtBuf, buf, len);
                    bcpValue = pExtBuf;

                    pExtBuf += len;

                    *pExtBuf = 0;
                    pExtBuf++;

                    extBufCapacity -= (len + 1);
                } else {
                    *status = U_ILLEGAL_ARGUMENT_ERROR;
                    break;
                }
            }

            if (!isAttribute) {

                ext = uprv_malloc_48(sizeof(ExtensionListEntry));
                if (ext == ((void *)0)) {
                    *status = U_MEMORY_ALLOCATION_ERROR;
                    break;
                }
                ext->key = bcpKey;
                ext->value = bcpValue;

                if (!_addExtensionToList(&firstExt, ext, 1)) {
                    uprv_free_48(ext);
                    if (strict) {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        break;
                    }
                }
            }
        }


        if (hadPosix) {

            ext = uprv_malloc_48(sizeof(ExtensionListEntry));
            if (ext == ((void *)0)) {
                *status = U_MEMORY_ALLOCATION_ERROR;
                goto cleanup;
            }
            ext->key = POSIX_KEY;
            ext->value = POSIX_VALUE;

            if (!_addExtensionToList(&firstExt, ext, 1)) {
                uprv_free_48(ext);
            }
        }

        if (((*status)<=U_ZERO_ERROR) && (firstExt != ((void *)0) || firstAttr != ((void *)0))) {
            UBool startLDMLExtension = 0;

            attr = firstAttr;
            ext = firstExt;
            do {
                if (!startLDMLExtension && (ext && strlen(ext->key) > 1)) {

                   if (reslen < capacity) {
                       *(appendAt + reslen) = '-';
                   }
                   reslen++;
                   if (reslen < capacity) {
                       *(appendAt + reslen) = 'u';
                   }
                   reslen++;

                   startLDMLExtension = 1;
                }


                if (ext && ( strlen(ext->key) == 1 || attr == ((void *)0))) {
                    if (reslen < capacity) {
                        *(appendAt + reslen) = '-';
                    }
                    reslen++;
                    len = (int32_t) strlen(ext->key);
                    if (reslen < capacity) {
                        memcpy(appendAt + reslen, ext->key, uprv_min_48(len, capacity - reslen));
                    }
                    reslen += len;
                    if (reslen < capacity) {
                        *(appendAt + reslen) = '-';
                    }
                    reslen++;
                    len = (int32_t) strlen(ext->value);
                    if (reslen < capacity) {
                        memcpy(appendAt + reslen, ext->value, uprv_min_48(len, capacity - reslen));
                    }
                    reslen += len;

                    ext = ext->next;
                } else if (attr) {

                    if (reslen < capacity) {
                        *(appendAt + reslen) = '-';
                    }
                    reslen++;
                    len = (int32_t) strlen(attr->attribute);
                    if (reslen < capacity) {
                        memcpy(appendAt + reslen, attr->attribute, uprv_min_48(len, capacity - reslen));
                    }
                    reslen += len;

                    attr = attr->next;
                }
            } while (attr != ((void *)0) || ext != ((void *)0));
        }
cleanup:

        ext = firstExt;
        while (ext != ((void *)0)) {
            ExtensionListEntry *tmpExt = ext->next;
            uprv_free_48(ext);
            ext = tmpExt;
        }

        attr = firstAttr;
        while (attr != ((void *)0)) {
            AttributeListEntry *tmpAttr = attr->next;
            char *pValue = (char *)attr->attribute;
            uprv_free_48(pValue);
            uprv_free_48(attr);
            attr = tmpAttr;
        }

        uenum_close_48(keywordEnum);

        if (((*status)>U_ZERO_ERROR)) {
            return 0;
        }
    }

    return u_terminateChars_48(appendAt, capacity, reslen, status);
}






static void
_appendLDMLExtensionAsKeywords(const char* ldmlext, ExtensionListEntry** appendTo, char* buf, int32_t bufSize, UBool *posixVariant, UErrorCode *status) {
    const char *p, *pNext, *pSep, *pTmp, *pTmpStart;
    const char *pBcpKey, *pBcpType;
    const char *pKey, *pType;
    int32_t bcpKeyLen = 0, bcpTypeLen;
    ExtensionListEntry *kwd, *nextKwd;
    ExtensionListEntry *kwdFirst = ((void *)0);
    int32_t bufIdx = 0;
    int32_t len;
    UBool variantExists = *posixVariant;
    UBool searchFurther;


    *posixVariant = 0;

    pNext = ldmlext;
    pBcpKey = pBcpType = ((void *)0);
    while (pNext) {
        p = pSep = pNext;


        while (*pSep) {
            if (*pSep == '-') {
                searchFurther = 0;
                if (pBcpKey != ((void *)0)) {
                    pTmpStart = (pSep + 1);
                    pTmp = pTmpStart;

                    while (*pTmp) {
                        if (*pTmp == '-' || *(pTmp + 1) == 0) {
                            if (!_isLDMLKey(pTmpStart, (int32_t)(pTmp - pTmpStart))) {
                                searchFurther = 1;
                            }
                            break;
                        }
                        pTmp++;
                    }
                }
                if (searchFurther) {
                    pSep++;
                    continue;
                } else {
                    break;
                }
            }
            pSep++;
        }
        if (*pSep == 0) {

            pNext = ((void *)0);
        } else {
            pNext = pSep + 1;
        }

        if (pBcpKey == ((void *)0)) {
            pBcpKey = p;
            bcpKeyLen = (int32_t)(pSep - p);
        } else {
            pBcpType = p;
            bcpTypeLen = (int32_t)(pSep - p);


            len = _bcp47ToLDMLKey(pBcpKey, bcpKeyLen, buf + bufIdx, bufSize - bufIdx - 1, status);
            if (((*status)>U_ZERO_ERROR)) {
                goto cleanup;
            }
            pKey = buf + bufIdx;
            bufIdx += len;
            *(buf + bufIdx) = 0;
            bufIdx++;


            len = _bcp47ToLDMLType(pKey, -1, pBcpType, bcpTypeLen, buf + bufIdx, bufSize - bufIdx - 1, status);
            if (((*status)>U_ZERO_ERROR)) {
                goto cleanup;
            }
            pType = buf + bufIdx;
            bufIdx += len;
            *(buf + bufIdx) = 0;
            bufIdx++;




            if (!variantExists && ! strcmp(pKey, POSIX_KEY) && ! strcmp(pType, POSIX_VALUE) ) {
                *posixVariant = 1;
            } else {

                kwd = uprv_malloc_48(sizeof(ExtensionListEntry));
                if (kwd == ((void *)0)) {
                    *status = U_MEMORY_ALLOCATION_ERROR;
                    goto cleanup;
                }

                kwd->key = pKey;
                kwd->value = pType;

                if (!_addExtensionToList(&kwdFirst, kwd, 0)) {
                    *status = U_ILLEGAL_ARGUMENT_ERROR;
                    uprv_free_48(kwd);
                    goto cleanup;
                }
            }


            pBcpKey = ((void *)0);
            pBcpType = ((void *)0);
        }
    }

    if (pBcpKey != ((void *)0)) {
        *status = U_ILLEGAL_ARGUMENT_ERROR;
        goto cleanup;
    }

    kwd = kwdFirst;
    while (kwd != ((void *)0)) {
        nextKwd = kwd->next;
        _addExtensionToList(appendTo, kwd, 0);
        kwd = nextKwd;
    }

    return;

cleanup:
    kwd = kwdFirst;
    while (kwd != ((void *)0)) {
        nextKwd = kwd->next;
        uprv_free_48(kwd);
        kwd = nextKwd;
    }
}


static int32_t
_appendKeywords(ULanguageTag* langtag, char* appendAt, int32_t capacity, UErrorCode* status) {
    int32_t reslen = 0;
    int32_t i, n;
    int32_t len;
    ExtensionListEntry *kwdFirst = ((void *)0);
    ExtensionListEntry *kwd;
    AttributeListEntry *attrFirst = ((void *)0);
    AttributeListEntry *attr;
    const char *key, *type;
    char *kwdBuf = ((void *)0);
    int32_t kwdBufLength = capacity;
    UBool posixVariant = 0;

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    kwdBuf = (char *)uprv_malloc_48(kwdBufLength);
    if (kwdBuf == ((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        return 0;
    }


    if (ultag_getVariantsSize(langtag)) {
        posixVariant = 1;
    }

    n = ultag_getExtensionsSize(langtag);


    for (i = 0; i < n; i++) {
        key = ultag_getExtensionKey(langtag, i);
        type = ultag_getExtensionValue(langtag, i);
        if (*key == 'u') {
            _appendLDMLExtensionAsKeywords(type, &kwdFirst, kwdBuf, kwdBufLength, &posixVariant, status);
            if (((*status)>U_ZERO_ERROR)) {
                break;
            }
        } else {
            kwd = uprv_malloc_48(sizeof(ExtensionListEntry));
            if (kwd == ((void *)0)) {
                *status = U_MEMORY_ALLOCATION_ERROR;
                break;
            }
            kwd->key = key;
            kwd->value = type;
            if (!_addExtensionToList(&kwdFirst, kwd, 0)) {
                uprv_free_48(kwd);
                *status = U_ILLEGAL_ARGUMENT_ERROR;
                break;
            }
        }
    }

    if (((*status)<=U_ZERO_ERROR)) {
        type = ultag_getPrivateUse(langtag);
        if ((int32_t) strlen(type) > 0) {

            kwd = uprv_malloc_48(sizeof(ExtensionListEntry));
            if (kwd == ((void *)0)) {
                *status = U_MEMORY_ALLOCATION_ERROR;
            } else {
                kwd->key = PRIVATEUSE_KEY;
                kwd->value = type;
                if (!_addExtensionToList(&kwdFirst, kwd, 0)) {
                    uprv_free_48(kwd);
                    *status = U_ILLEGAL_ARGUMENT_ERROR;
                }
            }
        }
    }



    if (((*status)<=U_ZERO_ERROR) && posixVariant) {
        len = (int32_t) strlen(_POSIX);
        if (reslen < capacity) {
            memcpy(appendAt + reslen, _POSIX, uprv_min_48(len, capacity - reslen));
        }
        reslen += len;
    }

    attrFirst = langtag->attributes;
    if (((*status)<=U_ZERO_ERROR) && (kwdFirst != ((void *)0) || attrFirst != ((void *)0))) {

        UBool firstValue = 1;
        UBool firstAttr = 1;
        kwd = kwdFirst;
        attr = attrFirst;
        do {
            if (reslen < capacity) {
                if (firstValue) {

                    *(appendAt + reslen) = '@';
                    firstValue = 0;
                } else if (attr) {

                    *(appendAt + reslen) = '-';
                }else {

                    *(appendAt + reslen) = ';';
                }
            }
            reslen++;

            if (attr) {
                if (firstAttr) {
                    len = (int32_t) strlen(LOCALE_ATTRIBUTE_KEY);
                    if (reslen < capacity) {
                        memcpy(appendAt + reslen, LOCALE_ATTRIBUTE_KEY, uprv_min_48(len, capacity - reslen));
                    }
                    reslen += len;


                    if (reslen < capacity) {
                        *(appendAt + reslen) = '=';
                    }

                    reslen++;

                    firstAttr = 0;
                }

                len = (int32_t) strlen(attr->attribute);
                if (reslen < capacity) {
                    memcpy(appendAt + reslen, attr->attribute, uprv_min_48(len, capacity - reslen));
                }
                reslen += len;

                attr = attr->next;
            } else if (kwd) {

                len = (int32_t) strlen(kwd->key);
                if (reslen < capacity) {
                    memcpy(appendAt + reslen, kwd->key, uprv_min_48(len, capacity - reslen));
                }
                reslen += len;


                if (reslen < capacity) {
                    *(appendAt + reslen) = '=';
                }
                reslen++;


                len = (int32_t) strlen(kwd->value);
                if (reslen < capacity) {
                    memcpy(appendAt + reslen, kwd->value, uprv_min_48(len, capacity - reslen));
                }
                reslen += len;

                kwd = kwd->next;
            }
        } while (kwd || attr);
    }


    kwd = kwdFirst;
    while (kwd != ((void *)0)) {
        ExtensionListEntry *tmpKwd = kwd->next;
        uprv_free_48(kwd);
        kwd = tmpKwd;
    }

    uprv_free_48(kwdBuf);

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    return u_terminateChars_48(appendAt, capacity, reslen, status);
}

static int32_t
_appendPrivateuseToLanguageTag(const char* localeID, char* appendAt, int32_t capacity, UBool strict, UBool hadPosix, UErrorCode* status) {
    char buf[157];
    char tmpAppend[157];
    UErrorCode tmpStatus = U_ZERO_ERROR;
    int32_t len, i;
    int32_t reslen = 0;

    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }

    len = uloc_getVariant_48(localeID, buf, sizeof(buf), &tmpStatus);
    if (((tmpStatus)>U_ZERO_ERROR) || tmpStatus == U_STRING_NOT_TERMINATED_WARNING) {
        if (strict) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
        }
        return 0;
    }

    if (len > 0) {
        char *p, *pPriv;
        UBool bNext = 1;
        UBool firstValue = 1;
        UBool writeValue;

        pPriv = ((void *)0);
        p = buf;
        while (bNext) {
            writeValue = 0;
            if (*p == '-' || *p == '_' || *p == 0) {
                if (*p == 0) {
                    bNext = 0;
                } else {
                    *p = 0;
                }
                if (pPriv != ((void *)0)) {

                    for (i = 0; *(pPriv + i) != 0; i++) {
                        *(pPriv + i) = uprv_asciitolower_48(*(pPriv + i));
                    }


                    if (_isPrivateuseValueSubtag(pPriv, -1)) {
                        if (firstValue) {
                            if (!_isVariantSubtag(pPriv, -1)) {
                                writeValue = 1;
                            }
                        } else {
                            writeValue = 1;
                        }
                    } else if (strict) {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        break;
                    } else {
                        break;
                    }

                    if (writeValue) {
                        if (reslen < capacity) {
                            tmpAppend[reslen++] = '-';
                        }

                        if (firstValue) {
                            if (reslen < capacity) {
                                tmpAppend[reslen++] = *PRIVATEUSE_KEY;
                            }

                            if (reslen < capacity) {
                                tmpAppend[reslen++] = '-';
                            }

                            len = (int32_t) strlen(PRIVUSE_VARIANT_PREFIX);
                            if (reslen < capacity) {
                                memcpy(tmpAppend + reslen, PRIVUSE_VARIANT_PREFIX, uprv_min_48(len, capacity - reslen));
                            }
                            reslen += len;

                            if (reslen < capacity) {
                                tmpAppend[reslen++] = '-';
                            }

                            firstValue = 0;
                        }

                        len = (int32_t) strlen(pPriv);
                        if (reslen < capacity) {
                            memcpy(tmpAppend + reslen, pPriv, uprv_min_48(len, capacity - reslen));
                        }
                        reslen += len;
                    }
                }

                pPriv = ((void *)0);
            } else if (pPriv == ((void *)0)) {
                pPriv = p;
            }
            p++;
        }

        if (((*status)>U_ZERO_ERROR)) {
            return 0;
        }
    }

    if (((*status)<=U_ZERO_ERROR)) {
        len = reslen;
        if (reslen < capacity) {
            memcpy(appendAt, tmpAppend, uprv_min_48(len, capacity - reslen));
        }
    }

    u_terminateChars_48(appendAt, capacity, reslen, status);

    return reslen;
}
# 2014 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static ULanguageTag*
ultag_parse(const char* tag, int32_t tagLen, int32_t* parsedLen, UErrorCode* status) {
    ULanguageTag *t;
    char *tagBuf;
    int16_t next;
    char *pSubtag, *pNext, *pLastGoodPosition;
    int32_t subtagLen;
    int32_t extlangIdx;
    ExtensionListEntry *pExtension;
    AttributeListEntry *pAttribute;
    char *pExtValueSubtag, *pExtValueSubtagEnd;
    char *pAttrValue;
    int32_t i;
    UBool isLDMLExtension, reqLDMLType, privateuseVar = 0;

    if (parsedLen != ((void *)0)) {
        *parsedLen = 0;
    }

    if (((*status)>U_ZERO_ERROR)) {
        return ((void *)0);
    }

    if (tagLen < 0) {
        tagLen = (int32_t) strlen(tag);
    }


    tagBuf = (char*)uprv_malloc_48(tagLen + 1);
    if (tagBuf == ((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        return ((void *)0);
    }
    memcpy(tagBuf, tag, tagLen);
    *(tagBuf + tagLen) = 0;


    t = (ULanguageTag*)uprv_malloc_48(sizeof(ULanguageTag));
    if (t == ((void *)0)) {
        uprv_free_48(tagBuf);
        *status = U_MEMORY_ALLOCATION_ERROR;
        return ((void *)0);
    }
    _initializeULanguageTag(t);
    t->buf = tagBuf;

    if (tagLen < 2) {

        return t;
    }


    for (i = 0; GRANDFATHERED[i] != ((void *)0); i += 2) {
        if (T_CString_stricmp_48(GRANDFATHERED[i], tagBuf) == 0) {

            int32_t newTagLength = strlen(GRANDFATHERED[i+1]);
            if (tagLen < newTagLength) {
                uprv_free_48(tagBuf);
                tagBuf = (char*)uprv_malloc_48(newTagLength + 1);
                if (tagBuf == ((void *)0)) {
                    *status = U_MEMORY_ALLOCATION_ERROR;
                    return ((void *)0);
                }
                t->buf = tagBuf;
                tagLen = newTagLength;
            }
            strcpy(t->buf, GRANDFATHERED[i + 1]);

            break;
        }
    }
# 2095 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
    next = 0x0001 | 0x0080;
    pNext = pLastGoodPosition = tagBuf;
    extlangIdx = 0;
    pExtension = ((void *)0);
    pExtValueSubtag = ((void *)0);
    pExtValueSubtagEnd = ((void *)0);
    pAttribute = ((void *)0);
    pAttrValue = ((void *)0);
    isLDMLExtension = 0;
    reqLDMLType = 0;

    while (pNext) {
        char *pSep;

        pSubtag = pNext;


        pSep = pSubtag;
        while (*pSep) {
            if (*pSep == '-') {
                break;
            }
            pSep++;
        }
        if (*pSep == 0) {

            pNext = ((void *)0);
        } else {
            pNext = pSep + 1;
        }
        subtagLen = (int32_t)(pSep - pSubtag);

        if (next & 0x0001) {
            if (_isLanguageSubtag(pSubtag, subtagLen)) {
                *pSep = 0;
                t->language = T_CString_toLowerCase_48(pSubtag);

                pLastGoodPosition = pSep;
                next = 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0080;
                continue;
            }
        }
        if (next & 0x0002) {
            if (_isExtlangSubtag(pSubtag, subtagLen)) {
                *pSep = 0;
                t->extlang[extlangIdx++] = T_CString_toLowerCase_48(pSubtag);

                pLastGoodPosition = pSep;
                if (extlangIdx < 3) {
                    next = 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0080;
                } else {
                    next = 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0080;
                }
                continue;
            }
        }
        if (next & 0x0004) {
            if (_isScriptSubtag(pSubtag, subtagLen)) {
                char *p = pSubtag;

                *pSep = 0;


                *p = uprv_toupper_48(*p);
                p++;
                for (; *p; p++) {
                    *p = uprv_asciitolower_48(*p);
                }

                t->script = pSubtag;

                pLastGoodPosition = pSep;
                next = 0x0008 | 0x0010 | 0x0020 | 0x0080;
                continue;
            }
        }
        if (next & 0x0008) {
            if (_isRegionSubtag(pSubtag, subtagLen)) {
                *pSep = 0;
                t->region = T_CString_toUpperCase_48(pSubtag);

                pLastGoodPosition = pSep;
                next = 0x0010 | 0x0020 | 0x0080;
                continue;
            }
        }
        if (next & 0x0010) {
            if (_isVariantSubtag(pSubtag, subtagLen) ||
               (privateuseVar && _isPrivateuseVariantSubtag(pSubtag, subtagLen))) {
                VariantListEntry *var;
                UBool isAdded;

                var = (VariantListEntry*)uprv_malloc_48(sizeof(VariantListEntry));
                if (var == ((void *)0)) {
                    *status = U_MEMORY_ALLOCATION_ERROR;
                    goto error;
                }
                *pSep = 0;
                var->variant = T_CString_toUpperCase_48(pSubtag);
                isAdded = _addVariantToList(&(t->variants), var);
                if (!isAdded) {

                    uprv_free_48(var);
                    break;
                }
                pLastGoodPosition = pSep;
                next = 0x0010 | 0x0020 | 0x0080;
                continue;
            }
        }
        if (next & 0x0020) {
            if (_isExtensionSingleton(pSubtag, subtagLen)) {
                if (pExtension != ((void *)0)) {
                    if (pExtValueSubtag == ((void *)0) || pExtValueSubtagEnd == ((void *)0)) {

                        uprv_free_48(pExtension);
                        pExtension = ((void *)0);
                        break;
                    }


                    *pExtValueSubtagEnd = 0;
                    pExtension->value = T_CString_toLowerCase_48(pExtValueSubtag);


                    if (_addExtensionToList(&(t->extensions), pExtension, 0)) {
                        pLastGoodPosition = pExtValueSubtagEnd;
                    } else {

                        uprv_free_48(pExtension);
                        pExtension = ((void *)0);
                        break;
                    }

                    if (isLDMLExtension && reqLDMLType) {

                        pExtension = ((void *)0);
                        break;
                    }
                }

                isLDMLExtension = (uprv_asciitolower_48(*pSubtag) == 'u');


                pExtension = uprv_malloc_48(sizeof(ExtensionListEntry));
                if (pExtension == ((void *)0)) {
                    *status = U_MEMORY_ALLOCATION_ERROR;
                    goto error;
                }
                *pSep = 0;
                pExtension->key = T_CString_toLowerCase_48(pSubtag);
                pExtension->value = ((void *)0);





                pExtValueSubtag = ((void *)0);
                pExtValueSubtagEnd = ((void *)0);

                next = 0x0040;
                continue;
            }
        }
        if (next & 0x0040) {
            if (_isExtensionSubtag(pSubtag, subtagLen)) {
                if (isLDMLExtension) {
                    if (reqLDMLType) {

                        if (!_isLDMLType(pSubtag, subtagLen)) {


                            break;
                        }
                        pExtValueSubtagEnd = pSep;
                        reqLDMLType = 0;
                        next = 0x0020 | 0x0040 | 0x0080;
                    } else {

                        if (!_isLDMLKey(pSubtag, subtagLen)) {

                            if (pExtValueSubtag != ((void *)0)) {
                                if (_isLDMLType(pSubtag, subtagLen)) {
                                    pExtValueSubtagEnd = pSep;
                                    reqLDMLType = 0;
                                    next = 0x0020 | 0x0040 | 0x0080;
                                }
                            } else if (pExtValueSubtag == ((void *)0) && _isAttributeSubtag(pSubtag, subtagLen)) {

                                next = 0x0100;
                            } else {


                                break;
                            }
                        } else {
                            reqLDMLType = 1;
                            next = 0x0040;
                        }
                    }
                } else {

                    pExtValueSubtagEnd = pSep;
                    next = 0x0020 | 0x0040 | 0x0080;
                }

                if (next != 0x0100) {
                    if (pExtValueSubtag == ((void *)0)) {


                        pExtValueSubtag = pSubtag;
                    }

                    continue;
                }
            }
        }
        if (next & 0x0080) {
            if (uprv_asciitolower_48(*pSubtag) == 'x') {
                char *pPrivuseVal;

                if (pExtension != ((void *)0)) {

                    if (pExtValueSubtag == ((void *)0) || pExtValueSubtagEnd == ((void *)0)) {

                        uprv_free_48(pExtension);
                        pExtension = ((void *)0);
                        break;
                    } else {

                        *pExtValueSubtagEnd = 0;
                        pExtension->value = T_CString_toLowerCase_48(pExtValueSubtag);


                        if (_addExtensionToList(&(t->extensions), pExtension, 0)) {
                            pLastGoodPosition = pExtValueSubtagEnd;
                            pExtension = ((void *)0);
                        } else {

                            uprv_free_48(pExtension);
                            pExtension = ((void *)0);
                            break;
                        }
                    }
                }


                if (pNext == ((void *)0)) {

                    break;
                }

                pPrivuseVal = pNext;


                while (pNext) {
                    pSubtag = pNext;
                    pSep = pSubtag;
                    while (*pSep) {
                        if (*pSep == '-') {
                            break;
                        }
                        pSep++;
                    }
                    if (*pSep == 0) {

                        pNext = ((void *)0);
                    } else {
                        pNext = pSep + 1;
                    }
                    subtagLen = (int32_t)(pSep - pSubtag);

                    if ( strncmp(pSubtag, PRIVUSE_VARIANT_PREFIX, strlen(PRIVUSE_VARIANT_PREFIX)) == 0) {
                        *pSep = 0;
                        next = 0x0010;
                        privateuseVar = 1;
                        break;
                    } else if (_isPrivateuseValueSubtag(pSubtag, subtagLen)) {
                        pLastGoodPosition = pSep;
                    } else {
                        break;
                    }
                }

                if (next == 0x0010) {
                    continue;
                }

                if (pLastGoodPosition - pPrivuseVal > 0) {
                    *pLastGoodPosition = 0;
                    t->privateuse = T_CString_toLowerCase_48(pPrivuseVal);
                }

                break;
            }
            break;
        }

        if (next & 0x0100) {

            pAttribute = uprv_malloc_48(sizeof(AttributeListEntry));
            if (pAttribute == ((void *)0)) {
                *status = U_MEMORY_ALLOCATION_ERROR;
                goto error;
            }

            *pSep = 0;
            pAttribute->attribute =T_CString_toLowerCase_48(pSubtag);

            if (!_addAttributeToList(&(t->attributes), pAttribute)) {
                uprv_free_48(pAttribute);
            }

            next = 0x0020 | 0x0040 | 0x0080;
            continue;
        }

        break;
    }

    if (pExtension != ((void *)0)) {

        if (pExtValueSubtag == ((void *)0) || pExtValueSubtagEnd == ((void *)0)) {

            uprv_free_48(pExtension);
        } else {

            *pExtValueSubtagEnd = 0;
            pExtension->value = T_CString_toLowerCase_48(pExtValueSubtag);

            if (_addExtensionToList(&(t->extensions), pExtension, 0)) {
                pLastGoodPosition = pExtValueSubtagEnd;
            } else {
                uprv_free_48(pExtension);
            }
        }
    }

    if (parsedLen != ((void *)0)) {
        *parsedLen = (int32_t)(pLastGoodPosition - t->buf);
    }

    return t;

error:
    uprv_free_48(t);
    return ((void *)0);
}

static void
ultag_close(ULanguageTag* langtag) {

    if (langtag == ((void *)0)) {
        return;
    }

    uprv_free_48(langtag->buf);

    if (langtag->variants) {
        VariantListEntry *curVar = langtag->variants;
        while (curVar) {
            VariantListEntry *nextVar = curVar->next;
            uprv_free_48(curVar);
            curVar = nextVar;
        }
    }

    if (langtag->extensions) {
        ExtensionListEntry *curExt = langtag->extensions;
        while (curExt) {
            ExtensionListEntry *nextExt = curExt->next;
            uprv_free_48(curExt);
            curExt = nextExt;
        }
    }

    if (langtag->attributes) {
        AttributeListEntry *curAttr = langtag->attributes;
        while (curAttr) {
            AttributeListEntry *nextAttr = curAttr->next;
            uprv_free_48(curAttr);
            curAttr = nextAttr;
        }
    }

    uprv_free_48(langtag);
}

static const char*
ultag_getLanguage(const ULanguageTag* langtag) {
    return langtag->language;
}
# 2501 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static const char*
ultag_getExtlang(const ULanguageTag* langtag, int32_t idx) {
    if (idx >= 0 && idx < 3) {
        return langtag->extlang[idx];
    }
    return ((void *)0);
}

static int32_t
ultag_getExtlangSize(const ULanguageTag* langtag) {
    int32_t size = 0;
    int32_t i;
    for (i = 0; i < 3; i++) {
        if (langtag->extlang[i]) {
            size++;
        }
    }
    return size;
}

static const char*
ultag_getScript(const ULanguageTag* langtag) {
    return langtag->script;
}

static const char*
ultag_getRegion(const ULanguageTag* langtag) {
    return langtag->region;
}

static const char*
ultag_getVariant(const ULanguageTag* langtag, int32_t idx) {
    const char *var = ((void *)0);
    VariantListEntry *cur = langtag->variants;
    int32_t i = 0;
    while (cur) {
        if (i == idx) {
            var = cur->variant;
            break;
        }
        cur = cur->next;
        i++;
    }
    return var;
}

static int32_t
ultag_getVariantsSize(const ULanguageTag* langtag) {
    int32_t size = 0;
    VariantListEntry *cur = langtag->variants;
    while (1) {
        if (cur == ((void *)0)) {
            break;
        }
        size++;
        cur = cur->next;
    }
    return size;
}
# 2580 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
static int32_t
ultag_getAttributesSize(const ULanguageTag* langtag) {
    int32_t size = 0;
    AttributeListEntry *cur = langtag->attributes;
    while (1) {
        if (cur == ((void *)0)) {
            break;
        }
        size++;
        cur = cur->next;
    }
    return size;
}

static const char*
ultag_getExtensionKey(const ULanguageTag* langtag, int32_t idx) {
    const char *key = ((void *)0);
    ExtensionListEntry *cur = langtag->extensions;
    int32_t i = 0;
    while (cur) {
        if (i == idx) {
            key = cur->key;
            break;
        }
        cur = cur->next;
        i++;
    }
    return key;
}

static const char*
ultag_getExtensionValue(const ULanguageTag* langtag, int32_t idx) {
    const char *val = ((void *)0);
    ExtensionListEntry *cur = langtag->extensions;
    int32_t i = 0;
    while (cur) {
        if (i == idx) {
            val = cur->value;
            break;
        }
        cur = cur->next;
        i++;
    }
    return val;
}

static int32_t
ultag_getExtensionsSize(const ULanguageTag* langtag) {
    int32_t size = 0;
    ExtensionListEntry *cur = langtag->extensions;
    while (1) {
        if (cur == ((void *)0)) {
            break;
        }
        size++;
        cur = cur->next;
    }
    return size;
}

static const char*
ultag_getPrivateUse(const ULanguageTag* langtag) {
    return langtag->privateuse;
}
# 2660 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uloc_tag.c"
extern int32_t
uloc_toLanguageTag_48(const char* localeID,
                   char* langtag,
                   int32_t langtagCapacity,
                   UBool strict,
                   UErrorCode* status) {

    char canonical[256];
    int32_t reslen = 0;
    UErrorCode tmpStatus = U_ZERO_ERROR;
    UBool hadPosix = 0;
    const char* pKeywordStart;


    canonical[0] = 0;
    if ( strlen(localeID) > 0) {
        uloc_canonicalize_48(localeID, canonical, sizeof(canonical), &tmpStatus);
        if (tmpStatus != U_ZERO_ERROR) {
            *status = U_ILLEGAL_ARGUMENT_ERROR;
            return 0;
        }
    }


    pKeywordStart = locale_getKeywordsStart_48(canonical);
    if (pKeywordStart == canonical) {
        UEnumeration *kwdEnum;
        int kwdCnt = 0;
        UBool done = 0;

        kwdEnum = uloc_openKeywords_48((const char*)canonical, &tmpStatus);
        if (kwdEnum != ((void *)0)) {
            kwdCnt = uenum_count_48(kwdEnum, &tmpStatus);
            if (kwdCnt == 1) {
                const char *key;
                int32_t len = 0;

                key = uenum_next_48(kwdEnum, &len, &tmpStatus);
                if (len == 1 && *key == 'x') {
                    char buf[100];
                    buf[0] = 'x';
                    buf[1] = '-';
                    len = uloc_getKeywordValue_48(localeID, key, &buf[2], sizeof(buf) - 2, &tmpStatus);
                    if (((tmpStatus)<=U_ZERO_ERROR)) {
                        if (_isPrivateuseValueSubtags(&buf[2], len)) {

                            reslen = len + 2;
                            memcpy(langtag, buf, uprv_min_48(reslen, langtagCapacity));
                            u_terminateChars_48(langtag, langtagCapacity, reslen, status);
                            done = 1;
                        } else if (strict) {
                            *status = U_ILLEGAL_ARGUMENT_ERROR;
                            done = 1;
                        }

                    } else {
                        *status = U_ILLEGAL_ARGUMENT_ERROR;
                        done = 1;
                    }
                }
            }
            uenum_close_48(kwdEnum);
            if (done) {
                return reslen;
            }
        }
    }

    reslen += _appendLanguageToLanguageTag(canonical, langtag, langtagCapacity, strict, status);
    reslen += _appendScriptToLanguageTag(canonical, langtag + reslen, langtagCapacity - reslen, strict, status);
    reslen += _appendRegionToLanguageTag(canonical, langtag + reslen, langtagCapacity - reslen, strict, status);
    reslen += _appendVariantsToLanguageTag(canonical, langtag + reslen, langtagCapacity - reslen, strict, &hadPosix, status);
    reslen += _appendKeywordsToLanguageTag(canonical, langtag + reslen, langtagCapacity - reslen, strict, hadPosix, status);
    reslen += _appendPrivateuseToLanguageTag(canonical, langtag + reslen, langtagCapacity - reslen, strict, hadPosix, status);

    return reslen;
}


extern int32_t
uloc_forLanguageTag_48(const char* langtag,
                    char* localeID,
                    int32_t localeIDCapacity,
                    int32_t* parsedLength,
                    UErrorCode* status) {
    ULanguageTag *lt;
    int32_t reslen = 0;
    const char *subtag, *p;
    int32_t len;
    int32_t i, n, m;
    UBool noRegion = 1;

    lt = ultag_parse(langtag, -1, parsedLength, status);
    if (((*status)>U_ZERO_ERROR)) {
        return 0;
    }


    subtag = ultag_getExtlangSize(lt) > 0 ? ultag_getExtlang(lt, 0) : ultag_getLanguage(lt);
    if ( strcmp(subtag, LANG_UND) != 0) {
        len = (int32_t) strlen(subtag);
        if (len > 0) {
            if (reslen < localeIDCapacity) {
                memcpy(localeID, subtag, uprv_min_48(len, localeIDCapacity - reslen));
            }
            reslen += len;
        }
    }


    subtag = ultag_getScript(lt);
    len = (int32_t) strlen(subtag);
    if (len > 0) {
        if (reslen < localeIDCapacity) {
            *(localeID + reslen) = '_';
        }
        reslen++;


        p = subtag;
        while (*p) {
            if (reslen < localeIDCapacity) {
                if (p == subtag) {
                    *(localeID + reslen) = uprv_toupper_48(*p);
                } else {
                    *(localeID + reslen) = *p;
                }
            }
            reslen++;
            p++;
        }
    }


    subtag = ultag_getRegion(lt);
    len = (int32_t) strlen(subtag);
    if (len > 0) {
        if (reslen < localeIDCapacity) {
            *(localeID + reslen) = '_';
        }
        reslen++;

        p = subtag;
        while (*p) {
            if (reslen < localeIDCapacity) {
                *(localeID + reslen) = uprv_toupper_48(*p);
            }
            reslen++;
            p++;
        }
        noRegion = 0;
    }


    n = ultag_getVariantsSize(lt);
    if (n > 0) {
        if (noRegion) {
            if (reslen < localeIDCapacity) {
                *(localeID + reslen) = '_';
            }
            reslen++;
        }

        for (i = 0; i < n; i++) {
            subtag = ultag_getVariant(lt, i);
            if (reslen < localeIDCapacity) {
                *(localeID + reslen) = '_';
            }
            reslen++;

            p = subtag;
            while (*p) {
                if (reslen < localeIDCapacity) {
                    *(localeID + reslen) = uprv_toupper_48(*p);
                }
                reslen++;
                p++;
            }
        }
    }


    n = ultag_getExtensionsSize(lt);
    m = ultag_getAttributesSize(lt);
    subtag = ultag_getPrivateUse(lt);
    if (n > 0 || m > 0 || strlen(subtag) > 0) {
        if (reslen == 0 && (n > 0 || m > 0)) {

            if (reslen < localeIDCapacity) {
                memcpy(localeID + reslen, LANG_UND, uprv_min_48(3, localeIDCapacity - reslen));
            }
            reslen += 3;
        }
        len = _appendKeywords(lt, localeID + reslen, localeIDCapacity - reslen, status);
        reslen += len;
    }

    ultag_close(lt);
    return u_terminateChars_48(localeID, localeIDCapacity, reslen, status);
}
