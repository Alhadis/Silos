# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
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
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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


# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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
# 26 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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
# 27 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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
# 28 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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
# 29 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucol_swp.h" 1
# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ucol_swp.h"
extern UBool
ucol_looksLikeCollationBinary_48(const UDataSwapper *ds,
                              const void *inData, int32_t length);






extern int32_t
ucol_swapBinary_48(const UDataSwapper *ds,
                const void *inData, int32_t length, void *outData,
                UErrorCode *pErrorCode);





extern int32_t
ucol_swap_48(const UDataSwapper *ds,
          const void *inData, int32_t length, void *outData,
          UErrorCode *pErrorCode);





extern int32_t
ucol_swapInverseUCA_48(const UDataSwapper *ds,
                    const void *inData, int32_t length, void *outData,
                    UErrorCode *pErrorCode);
# 30 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
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
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h" 1
# 27 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ures.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h" 1
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uloc.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uenum.h" 1
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
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.h" 2
# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.h"
typedef enum {

    URES_INTERNAL_NONE=-1,


    URES_TABLE32=4,





    URES_TABLE16=5,


    URES_STRING_V2=6,





    URES_ARRAY16=9
} UResInternalType;






typedef uint32_t Resource;
# 80 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.h"
enum {
    URES_INDEX_LENGTH,





    URES_INDEX_KEYS_TOP,

    URES_INDEX_RESOURCES_TOP,
    URES_INDEX_BUNDLE_TOP,

    URES_INDEX_MAX_TABLE_LENGTH,
    URES_INDEX_ATTRIBUTES,
    URES_INDEX_16BIT_TOP,

    URES_INDEX_POOL_CHECKSUM,
    URES_INDEX_TOP
};
# 307 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.h"
typedef struct {
    UDataMemory *data;
    const int32_t *pRoot;
    const uint16_t *p16BitUnits;
    const char *poolBundleKeys;
    Resource rootRes;
    int32_t localKeyLimit;
    UBool noFallback;
    UBool isPoolBundle;
    UBool usesPoolBundle;
    UBool useNativeStrcmp;
} ResourceData;




extern void
res_read_48(ResourceData *pResData,
         const UDataInfo *pInfo, const void *inBytes, int32_t length,
         UErrorCode *errorCode);





extern void
res_load_48(ResourceData *pResData,
         const char *path, const char *name, UErrorCode *errorCode);





extern void
res_unload_48(ResourceData *pResData);

extern UResType
res_getPublicType_48(Resource res);






extern const UChar *
res_getString_48(const ResourceData *pResData, Resource res, int32_t *pLength);

extern const UChar *
res_getAlias_48(const ResourceData *pResData, Resource res, int32_t *pLength);

extern const uint8_t *
res_getBinary_48(const ResourceData *pResData, Resource res, int32_t *pLength);

extern const int32_t *
res_getIntVector_48(const ResourceData *pResData, Resource res, int32_t *pLength);

extern Resource
res_getResource_48(const ResourceData *pResData, const char *key);

extern int32_t
res_countArrayItems_48(const ResourceData *pResData, Resource res);

extern Resource
res_getArrayItem_48(const ResourceData *pResData, Resource array, int32_t indexS);

extern Resource
res_getTableItemByIndex_48(const ResourceData *pResData, Resource table, int32_t indexS, const char ** key);

extern Resource
res_getTableItemByKey_48(const ResourceData *pResData, Resource table, int32_t *indexS, const char* * key);





extern Resource res_findResource_48(const ResourceData *pResData, Resource r, char** path, const char** key);





extern int32_t
ures_swap_48(const UDataSwapper *ds,
          const void *inData, int32_t length, void *outData,
          UErrorCode *pErrorCode);
# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h" 1
# 44 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
struct UResourceDataEntry;
typedef struct UResourceDataEntry UResourceDataEntry;







struct UResourceDataEntry {
    char *fName;
    char *fPath;
    UResourceDataEntry *fParent;
    UResourceDataEntry *fAlias;
    UResourceDataEntry *fPool;
    ResourceData fData;
    char fNameBuffer[3];
    uint32_t fCountExisting;
    UErrorCode fBogus;

};





struct UResourceBundle {
    const char *fKey;
    UResourceDataEntry *fData;
    char *fVersion;
    UResourceDataEntry *fTopLevelData;
    char *fResPath;
    ResourceData fResData;
    char fResBuf[64];
    int32_t fResPathLen;
    Resource fRes;
    UBool fHasFallback;
    UBool fIsTopLevel;
    uint32_t fMagic1;
    uint32_t fMagic2;
    int32_t fIndex;
    int32_t fSize;


};

extern void ures_initStackObject_48(UResourceBundle* resB);


extern const char* ures_getName_48(const UResourceBundle* resB);
# 107 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern UResourceBundle *ures_copyResb_48(UResourceBundle *r, const UResourceBundle *original, UErrorCode *status);
# 124 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern UResourceBundle*
ures_findResource_48(const char* pathToResource,
                  UResourceBundle *fillIn, UErrorCode *status);
# 143 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern UResourceBundle*
ures_findSubResource_48(const UResourceBundle *resB,
                     char* pathToResource,
                     UResourceBundle *fillIn, UErrorCode *status);
# 164 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern int32_t
ures_getFunctionalEquivalent_48(char *result, int32_t resultCapacity,
                             const char *path, const char *resName, const char *keyword, const char *locid,
                             UBool *isAvailable, UBool omitDefault, UErrorCode *status);
# 176 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern UEnumeration*
ures_getKeywordValues_48(const char *path, const char *keyword, UErrorCode *status);
# 196 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern UResourceBundle*
ures_getByKeyWithFallback_48(const UResourceBundle *resB,
                          const char* inKey,
                          UResourceBundle *fillIn,
                          UErrorCode *status);
# 217 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern const UChar*
ures_getStringByKeyWithFallback_48(const UResourceBundle *resB,
                          const char* inKey,
                          int32_t* len,
                          UErrorCode *status);
# 230 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern void
ures_getVersionByKey_48(const UResourceBundle *resB,
                     const char *key,
                     UVersionInfo ver,
                     UErrorCode *status);
# 246 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern const char*
ures_getVersionNumberInternal_48(const UResourceBundle *resourceBundle);
# 262 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresimp.h"
extern const char*
ures_getLocaleInternal_48(const UResourceBundle* resourceBundle,
               UErrorCode* status);
# 33 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c" 2
# 54 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
static const uint16_t gEmpty16=0;
static const int32_t gEmpty32=0;
static const struct {
    int32_t length;
    UChar nul;
    UChar pad;
} gEmptyString={ 0, 0, 0 };






static int32_t
_res_findTableItem(const ResourceData *pResData, const uint16_t *keyOffsets, int32_t length,
                   const char *key, const char **realKey) {
    const char *tableKey;
    int32_t mid, start, limit;
    int result;


    start=0;
    limit=length;
    while(start<limit) {
        mid = (start + limit) / 2;
        tableKey = ((keyOffsets[mid])<(pResData)->localKeyLimit ? (const char *)(pResData)->pRoot+(keyOffsets[mid]) : (pResData)->poolBundleKeys+(keyOffsets[mid])-(pResData)->localKeyLimit);
        if (pResData->useNativeStrcmp) {
            result = strcmp(key, tableKey);
        } else {
            result = strcmp(key, tableKey);
        }
        if (result < 0) {
            limit = mid;
        } else if (result > 0) {
            start = mid + 1;
        } else {

            *realKey=tableKey;
            return mid;
        }
    }
    return -1;
}

static int32_t
_res_findTable32Item(const ResourceData *pResData, const int32_t *keyOffsets, int32_t length,
                     const char *key, const char **realKey) {
    const char *tableKey;
    int32_t mid, start, limit;
    int result;


    start=0;
    limit=length;
    while(start<limit) {
        mid = (start + limit) / 2;
        tableKey = ((keyOffsets[mid])>=0 ? (const char *)(pResData)->pRoot+(keyOffsets[mid]) : (pResData)->poolBundleKeys+((keyOffsets[mid])&0x7fffffff));
        if (pResData->useNativeStrcmp) {
            result = strcmp(key, tableKey);
        } else {
            result = strcmp(key, tableKey);
        }
        if (result < 0) {
            limit = mid;
        } else if (result > 0) {
            start = mid + 1;
        } else {

            *realKey=tableKey;
            return mid;
        }
    }
    return -1;
}



static UBool
isAcceptable(void *context,
             const char *type, const char *name,
             const UDataInfo *pInfo) {
    memcpy(context, pInfo->formatVersion, 4);
    return (UBool)(
        pInfo->size>=20 &&
        pInfo->isBigEndian==0 &&
        pInfo->charsetFamily==0 &&
        pInfo->sizeofUChar==2 &&
        pInfo->dataFormat[0]==0x52 &&
        pInfo->dataFormat[1]==0x65 &&
        pInfo->dataFormat[2]==0x73 &&
        pInfo->dataFormat[3]==0x42 &&
        (pInfo->formatVersion[0]==1 || pInfo->formatVersion[0]==2));
}



static void
res_init(ResourceData *pResData,
         UVersionInfo formatVersion, const void *inBytes, int32_t length,
         UErrorCode *errorCode) {
    UResType rootType;


    pResData->pRoot=(const int32_t *)inBytes;
    pResData->rootRes=(Resource)*pResData->pRoot;
    pResData->p16BitUnits=&gEmpty16;


    if(length>=0 && (length/4)<((formatVersion[0]==1 && formatVersion[1]==0) ? 1 : 1+5)) {
        *errorCode=U_INVALID_FORMAT_ERROR;
        res_unload_48(pResData);
        return;
    }


    rootType=((int32_t)((pResData->rootRes)>>28UL));
    if(!((int32_t)(rootType)==URES_TABLE || (int32_t)(rootType)==URES_TABLE16 || (int32_t)(rootType)==URES_TABLE32)) {
        *errorCode=U_INVALID_FORMAT_ERROR;
        res_unload_48(pResData);
        return;
    }

    if(formatVersion[0]==1 && formatVersion[1]==0) {
        pResData->localKeyLimit=0x10000;
    } else {

        const int32_t *indexes=pResData->pRoot+1;
        int32_t indexLength=indexes[URES_INDEX_LENGTH]&0xff;
        if(indexLength<=URES_INDEX_MAX_TABLE_LENGTH) {
            *errorCode=U_INVALID_FORMAT_ERROR;
            res_unload_48(pResData);
            return;
        }
        if( length>=0 &&
            (length<((1+indexLength)<<2) ||
             length<(indexes[URES_INDEX_BUNDLE_TOP]<<2))
        ) {
            *errorCode=U_INVALID_FORMAT_ERROR;
            res_unload_48(pResData);
            return;
        }
        if(indexes[URES_INDEX_KEYS_TOP]>(1+indexLength)) {
            pResData->localKeyLimit=indexes[URES_INDEX_KEYS_TOP]<<2;
        }
        if(indexLength>URES_INDEX_ATTRIBUTES) {
            int32_t att=indexes[URES_INDEX_ATTRIBUTES];
            pResData->noFallback=(UBool)(att&1);
            pResData->isPoolBundle=(UBool)((att&2)!=0);
            pResData->usesPoolBundle=(UBool)((att&4)!=0);
        }
        if((pResData->isPoolBundle || pResData->usesPoolBundle) && indexLength<=URES_INDEX_POOL_CHECKSUM) {
            *errorCode=U_INVALID_FORMAT_ERROR;
            res_unload_48(pResData);
            return;
        }
        if( indexLength>URES_INDEX_16BIT_TOP &&
            indexes[URES_INDEX_16BIT_TOP]>indexes[URES_INDEX_KEYS_TOP]
        ) {
            pResData->p16BitUnits=(const uint16_t *)(pResData->pRoot+indexes[URES_INDEX_KEYS_TOP]);
        }
    }

    if(formatVersion[0]==1 || 0==0) {




        pResData->useNativeStrcmp=1;
    }
}

extern void
res_read_48(ResourceData *pResData,
         const UDataInfo *pInfo, const void *inBytes, int32_t length,
         UErrorCode *errorCode) {
    UVersionInfo formatVersion;

    memset(pResData, 0, sizeof(ResourceData));
    if(((*errorCode)>U_ZERO_ERROR)) {
        return;
    }
    if(!isAcceptable(formatVersion, ((void *)0), ((void *)0), pInfo)) {
        *errorCode=U_INVALID_FORMAT_ERROR;
        return;
    }
    res_init(pResData, formatVersion, inBytes, length, errorCode);
}

extern void
res_load_48(ResourceData *pResData,
         const char *path, const char *name, UErrorCode *errorCode) {
    UVersionInfo formatVersion;

    memset(pResData, 0, sizeof(ResourceData));


    pResData->data=udata_openChoice_48(path, "res", name, isAcceptable, formatVersion, errorCode);
    if(((*errorCode)>U_ZERO_ERROR)) {
        return;
    }


    res_init(pResData, formatVersion, udata_getMemory_48(pResData->data), -1, errorCode);
}

extern void
res_unload_48(ResourceData *pResData) {
    if(pResData->data!=((void *)0)) {
        udata_close_48(pResData->data);
        pResData->data=((void *)0);
    }
}

static const int8_t gPublicTypes[URES_LIMIT] = {
    URES_STRING,
    URES_BINARY,
    URES_TABLE,
    URES_ALIAS,

    URES_TABLE,
    URES_TABLE,
    URES_STRING,
    URES_INT,

    URES_ARRAY,
    URES_ARRAY,
    URES_NONE,
    URES_NONE,

    URES_NONE,
    URES_NONE,
    URES_INT_VECTOR,
    URES_NONE
};

extern UResType
res_getPublicType_48(Resource res) {
    return (UResType)gPublicTypes[((int32_t)((res)>>28UL))];
}

extern const UChar *
res_getString_48(const ResourceData *pResData, Resource res, int32_t *pLength) {
    const UChar *p;
    uint32_t offset=((res)&0x0fffffff);
    int32_t length;
    if(((int32_t)((res)>>28UL))==URES_STRING_V2) {
        int32_t first;
        p=(const UChar *)(pResData->p16BitUnits+offset);
        first=*p;
        if(!(((first)&0xfffffc00)==0xdc00)) {
            length=u_strlen_48(p);
        } else if(first<0xdfef) {
            length=first&0x3ff;
            ++p;
        } else if(first<0xdfff) {
            length=((first-0xdfef)<<16)|p[1];
            p+=2;
        } else {
            length=((int32_t)p[1]<<16)|p[2];
            p+=3;
        }
    } else if(res==offset) {
        const int32_t *p32= res==0 ? &gEmptyString.length : pResData->pRoot+res;
        length=*p32++;
        p=(const UChar *)p32;
    } else {
        p=((void *)0);
        length=0;
    }
    if(pLength) {
        *pLength=length;
    }
    return p;
}

extern const UChar *
res_getAlias_48(const ResourceData *pResData, Resource res, int32_t *pLength) {
    const UChar *p;
    uint32_t offset=((res)&0x0fffffff);
    int32_t length;
    if(((int32_t)((res)>>28UL))==URES_ALIAS) {
        const int32_t *p32= offset==0 ? &gEmptyString.length : pResData->pRoot+offset;
        length=*p32++;
        p=(const UChar *)p32;
    } else {
        p=((void *)0);
        length=0;
    }
    if(pLength) {
        *pLength=length;
    }
    return p;
}

extern const uint8_t *
res_getBinary_48(const ResourceData *pResData, Resource res, int32_t *pLength) {
    const uint8_t *p;
    uint32_t offset=((res)&0x0fffffff);
    int32_t length;
    if(((int32_t)((res)>>28UL))==URES_BINARY) {
        const int32_t *p32= offset==0 ? &gEmpty32 : pResData->pRoot+offset;
        length=*p32++;
        p=(const uint8_t *)p32;
    } else {
        p=((void *)0);
        length=0;
    }
    if(pLength) {
        *pLength=length;
    }
    return p;
}


extern const int32_t *
res_getIntVector_48(const ResourceData *pResData, Resource res, int32_t *pLength) {
    const int32_t *p;
    uint32_t offset=((res)&0x0fffffff);
    int32_t length;
    if(((int32_t)((res)>>28UL))==URES_INT_VECTOR) {
        p= offset==0 ? &gEmpty32 : pResData->pRoot+offset;
        length=*p++;
    } else {
        p=((void *)0);
        length=0;
    }
    if(pLength) {
        *pLength=length;
    }
    return p;
}

extern int32_t
res_countArrayItems_48(const ResourceData *pResData, Resource res) {
    uint32_t offset=((res)&0x0fffffff);
    switch(((int32_t)((res)>>28UL))) {
    case URES_STRING:
    case URES_STRING_V2:
    case URES_BINARY:
    case URES_ALIAS:
    case URES_INT:
    case URES_INT_VECTOR:
        return 1;
    case URES_ARRAY:
    case URES_TABLE32:
        return offset==0 ? 0 : *(pResData->pRoot+offset);
    case URES_TABLE:
        return offset==0 ? 0 : *((const uint16_t *)(pResData->pRoot+offset));
    case URES_ARRAY16:
    case URES_TABLE16:
        return pResData->p16BitUnits[offset];
    default:
        return 0;
    }
}

extern Resource
res_getTableItemByKey_48(const ResourceData *pResData, Resource table,
                      int32_t *indexR, const char **key) {
    uint32_t offset=((table)&0x0fffffff);
    int32_t length;
    int32_t idx;
    if(key == ((void *)0) || *key == ((void *)0)) {
        return 0xffffffff;
    }
    switch(((int32_t)((table)>>28UL))) {
    case URES_TABLE: {
        const uint16_t *p= offset==0 ? &gEmpty16 : (const uint16_t *)(pResData->pRoot+offset);
        length=*p++;
        *indexR=idx=_res_findTableItem(pResData, p, length, *key, key);
        if(idx>=0) {
            const Resource *p32=(const Resource *)(p+length+(~length&1));
            return p32[idx];
        }
        break;
    }
    case URES_TABLE16: {
        const uint16_t *p=pResData->p16BitUnits+offset;
        length=*p++;
        *indexR=idx=_res_findTableItem(pResData, p, length, *key, key);
        if(idx>=0) {
            return (((Resource)(URES_STRING_V2)<<28)|(Resource)(p[length+idx]));
        }
        break;
    }
    case URES_TABLE32: {
        const int32_t *p= offset==0 ? &gEmpty32 : pResData->pRoot+offset;
        length=*p++;
        *indexR=idx=_res_findTable32Item(pResData, p, length, *key, key);
        if(idx>=0) {
            return (Resource)p[length+idx];
        }
        break;
    }
    default:
        break;
    }
    return 0xffffffff;
}

extern Resource
res_getTableItemByIndex_48(const ResourceData *pResData, Resource table,
                        int32_t indexR, const char **key) {
    uint32_t offset=((table)&0x0fffffff);
    int32_t length;
    switch(((int32_t)((table)>>28UL))) {
    case URES_TABLE: {
        const uint16_t *p= offset==0 ? &gEmpty16 : (const uint16_t *)(pResData->pRoot+offset);
        length=*p++;
        if(indexR<length) {
            const Resource *p32=(const Resource *)(p+length+(~length&1));
            if(key!=((void *)0)) {
                *key=((p[indexR])<(pResData)->localKeyLimit ? (const char *)(pResData)->pRoot+(p[indexR]) : (pResData)->poolBundleKeys+(p[indexR])-(pResData)->localKeyLimit);
            }
            return p32[indexR];
        }
        break;
    }
    case URES_TABLE16: {
        const uint16_t *p=pResData->p16BitUnits+offset;
        length=*p++;
        if(indexR<length) {
            if(key!=((void *)0)) {
                *key=((p[indexR])<(pResData)->localKeyLimit ? (const char *)(pResData)->pRoot+(p[indexR]) : (pResData)->poolBundleKeys+(p[indexR])-(pResData)->localKeyLimit);
            }
            return (((Resource)(URES_STRING_V2)<<28)|(Resource)(p[length+indexR]));
        }
        break;
    }
    case URES_TABLE32: {
        const int32_t *p= offset==0 ? &gEmpty32 : pResData->pRoot+offset;
        length=*p++;
        if(indexR<length) {
            if(key!=((void *)0)) {
                *key=((p[indexR])>=0 ? (const char *)(pResData)->pRoot+(p[indexR]) : (pResData)->poolBundleKeys+((p[indexR])&0x7fffffff));
            }
            return (Resource)p[length+indexR];
        }
        break;
    }
    default:
        break;
    }
    return 0xffffffff;
}

extern Resource
res_getResource_48(const ResourceData *pResData, const char *key) {
    const char *realKey=key;
    int32_t idx;
    return res_getTableItemByKey_48(pResData, pResData->rootRes, &idx, &realKey);
}

extern Resource
res_getArrayItem_48(const ResourceData *pResData, Resource array, int32_t indexR) {
    uint32_t offset=((array)&0x0fffffff);
    switch(((int32_t)((array)>>28UL))) {
    case URES_ARRAY: {
        const int32_t *p= offset==0 ? &gEmpty32 : pResData->pRoot+offset;
        if(indexR<*p) {
            return (Resource)p[1+indexR];
        }
        break;
    }
    case URES_ARRAY16: {
        const uint16_t *p=pResData->p16BitUnits+offset;
        if(indexR<*p) {
            return (((Resource)(URES_STRING_V2)<<28)|(Resource)(p[1+indexR]));
        }
        break;
    }
    default:
        break;
    }
    return 0xffffffff;
}

extern Resource
res_findResource_48(const ResourceData *pResData, Resource r, char** path, const char** key) {





  char *pathP = *path, *nextSepP = *path;
  char *closeIndex = ((void *)0);
  Resource t1 = r;
  Resource t2;
  int32_t indexR = 0;
  UResType type = ((int32_t)((t1)>>28UL));


  if(! strlen(pathP)) {
      return r;
  }


  if(!(((int32_t)(type)==URES_TABLE || (int32_t)(type)==URES_TABLE16 || (int32_t)(type)==URES_TABLE32) || ((int32_t)(type)==URES_ARRAY || (int32_t)(type)==URES_ARRAY16))) {
      return 0xffffffff;
  }

  while(nextSepP && *pathP && t1 != 0xffffffff && (((int32_t)(type)==URES_TABLE || (int32_t)(type)==URES_TABLE16 || (int32_t)(type)==URES_TABLE32) || ((int32_t)(type)==URES_ARRAY || (int32_t)(type)==URES_ARRAY16))) {



    nextSepP = strchr(pathP, '/');



    if(nextSepP != ((void *)0)) {
      *nextSepP = 0;
      *path = nextSepP+1;
    } else {
      *path = strchr(pathP, 0);
    }



    if(((int32_t)(type)==URES_TABLE || (int32_t)(type)==URES_TABLE16 || (int32_t)(type)==URES_TABLE32)) {
      *key = pathP;
      t2 = res_getTableItemByKey_48(pResData, t1, &indexR, key);
      if(t2 == 0xffffffff) {

        indexR = strtol(pathP, &closeIndex, 10);
        if(closeIndex != pathP) {

          t2 = res_getTableItemByIndex_48(pResData, t1, indexR, key);
        }
      }
    } else if(((int32_t)(type)==URES_ARRAY || (int32_t)(type)==URES_ARRAY16)) {
      indexR = strtol(pathP, &closeIndex, 10);
      if(closeIndex != pathP) {
        t2 = res_getArrayItem_48(pResData, t1, indexR);
      } else {
        t2 = 0xffffffff;
      }
      *key = ((void *)0);
    } else {
      t2 = 0xffffffff;
    }
    t1 = t2;
    type = ((int32_t)((t1)>>28UL));

    pathP = *path;
  }

  return t1;
}
# 636 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
typedef struct Row {
    int32_t keyIndex, sortIndex;
} Row;

static int32_t
ures_compareRows(const void *context, const void *left, const void *right) {
    const char *keyChars=(const char *)context;
    return (int32_t) strcmp(keyChars+((const Row *)left)->keyIndex, keyChars+((const Row *)right)->keyIndex);

}

typedef struct TempTable {
    const char *keyChars;
    Row *rows;
    int32_t *resort;
    uint32_t *resFlags;
    int32_t localKeyLimit;
    uint8_t majorFormatVersion;
} TempTable;

enum {
    STACK_ROW_CAPACITY=200
};


static const char *const gUnknownKey="";


static const UChar gCollationBinKey[]={
    0x25, 0x25,
    0x43, 0x6f, 0x6c, 0x6c, 0x61, 0x74, 0x69, 0x6f, 0x6e,
    0x42, 0x69, 0x6e,
    0
};




static void
ures_swapResource(const UDataSwapper *ds,
                  const Resource *inBundle, Resource *outBundle,
                  Resource res,
                  const char *key,
                  TempTable *pTempTable,
                  UErrorCode *pErrorCode) {
    const Resource *p;
    Resource *q;
    int32_t offset, count;

    switch(((int32_t)((res)>>28UL))) {
    case URES_TABLE16:
    case URES_STRING_V2:
    case URES_INT:
    case URES_ARRAY16:

        return;
    default:
        break;
    }


    offset=(int32_t)((res)&0x0fffffff);
    if(offset==0) {

        return;
    }
    if(pTempTable->resFlags[offset>>5]&((uint32_t)1<<(offset&0x1f))) {

        return;
    } else {

        pTempTable->resFlags[offset>>5]|=((uint32_t)1<<(offset&0x1f));
    }

    p=inBundle+offset;
    q=outBundle+offset;

    switch(((int32_t)((res)>>28UL))) {
    case URES_ALIAS:

    case URES_STRING:
        count=udata_readInt32_48(ds, (int32_t)*p);

        ds->swapArray32(ds, p, 4, q, pErrorCode);

        ds->swapArray16(ds, p+1, 2*count, q+1, pErrorCode);
        break;
    case URES_BINARY:
        count=udata_readInt32_48(ds, (int32_t)*p);

        ds->swapArray32(ds, p, 4, q, pErrorCode);




        if( key!=((void *)0) &&
            (key!=gUnknownKey ?

                0==ds->compareInvChars(ds, key, -1,
                                       gCollationBinKey, (int32_t)(sizeof(gCollationBinKey)/sizeof((gCollationBinKey)[0]))-1) :

                ucol_looksLikeCollationBinary_48(ds, p+1, count))
        ) {
            ucol_swapBinary_48(ds, p+1, count, q+1, pErrorCode);
        }

        break;
    case URES_TABLE:
    case URES_TABLE32:
        {
            const uint16_t *pKey16;
            uint16_t *qKey16;

            const int32_t *pKey32;
            int32_t *qKey32;

            Resource item;
            int32_t i, oldIndex;

            if(((int32_t)((res)>>28UL))==URES_TABLE) {

                pKey16=(const uint16_t *)p;
                qKey16=(uint16_t *)q;
                count=ds->readUInt16(*pKey16);

                pKey32=qKey32=((void *)0);


                ds->swapArray16(ds, pKey16++, 2, qKey16++, pErrorCode);

                offset+=((1+count)+1)/2;
            } else {

                pKey32=(const int32_t *)p;
                qKey32=(int32_t *)q;
                count=udata_readInt32_48(ds, *pKey32);

                pKey16=qKey16=((void *)0);


                ds->swapArray32(ds, pKey32++, 4, qKey32++, pErrorCode);

                offset+=1+count;
            }

            if(count==0) {
                break;
            }

            p=inBundle+offset;
            q=outBundle+offset;


            for(i=0; i<count; ++i) {
                const char *itemKey=gUnknownKey;
                if(pKey16!=((void *)0)) {
                    int32_t keyOffset=ds->readUInt16(pKey16[i]);
                    if(keyOffset<pTempTable->localKeyLimit) {
                        itemKey=(const char *)outBundle+keyOffset;
                    }
                } else {
                    int32_t keyOffset=udata_readInt32_48(ds, pKey32[i]);
                    if(keyOffset>=0) {
                        itemKey=(const char *)outBundle+keyOffset;
                    }
                }
                item=ds->readUInt32(p[i]);
                ures_swapResource(ds, inBundle, outBundle, item, itemKey, pTempTable, pErrorCode);
                if(((*pErrorCode)>U_ZERO_ERROR)) {
                    udata_printError_48(ds, "ures_swapResource(table res=%08x)[%d].recurse(%08x) failed\n",
                                     res, i, item);
                    return;
                }
            }

            if(pTempTable->majorFormatVersion>1 || ds->inCharset==ds->outCharset) {

                if(pKey16!=((void *)0)) {
                    ds->swapArray16(ds, pKey16, count*2, qKey16, pErrorCode);
                    ds->swapArray32(ds, p, count*4, q, pErrorCode);
                } else {

                    ds->swapArray32(ds, pKey32, count*2*4, qKey32, pErrorCode);
                }
                break;
            }
# 831 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
            if(pKey16!=((void *)0)) {
                for(i=0; i<count; ++i) {
                    pTempTable->rows[i].keyIndex=ds->readUInt16(pKey16[i]);
                    pTempTable->rows[i].sortIndex=i;
                }
            } else {
                for(i=0; i<count; ++i) {
                    pTempTable->rows[i].keyIndex=udata_readInt32_48(ds, pKey32[i]);
                    pTempTable->rows[i].sortIndex=i;
                }
            }
            uprv_sortArray_48(pTempTable->rows, count, sizeof(Row),
                           ures_compareRows, pTempTable->keyChars,
                           0, pErrorCode);
            if(((*pErrorCode)>U_ZERO_ERROR)) {
                udata_printError_48(ds, "ures_swapResource(table res=%08x).uprv_sortArray(%d items) failed\n",
                                 res, count);
                return;
            }
# 859 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
            if(pKey16!=((void *)0)) {
                uint16_t *rKey16;

                if(pKey16!=qKey16) {
                    rKey16=qKey16;
                } else {
                    rKey16=(uint16_t *)pTempTable->resort;
                }
                for(i=0; i<count; ++i) {
                    oldIndex=pTempTable->rows[i].sortIndex;
                    ds->swapArray16(ds, pKey16+oldIndex, 2, rKey16+i, pErrorCode);
                }
                if(qKey16!=rKey16) {
                    memcpy(qKey16, rKey16, 2*count);
                }
            } else {
                int32_t *rKey32;

                if(pKey32!=qKey32) {
                    rKey32=qKey32;
                } else {
                    rKey32=pTempTable->resort;
                }
                for(i=0; i<count; ++i) {
                    oldIndex=pTempTable->rows[i].sortIndex;
                    ds->swapArray32(ds, pKey32+oldIndex, 4, rKey32+i, pErrorCode);
                }
                if(qKey32!=rKey32) {
                    memcpy(qKey32, rKey32, 4*count);
                }
            }


            {
                Resource *r;


                if(p!=q) {
                    r=q;
                } else {
                    r=(Resource *)pTempTable->resort;
                }
                for(i=0; i<count; ++i) {
                    oldIndex=pTempTable->rows[i].sortIndex;
                    ds->swapArray32(ds, p+oldIndex, 4, r+i, pErrorCode);
                }
                if(q!=r) {
                    memcpy(q, r, 4*count);
                }
            }
        }
        break;
    case URES_ARRAY:
        {
            Resource item;
            int32_t i;

            count=udata_readInt32_48(ds, (int32_t)*p);

            ds->swapArray32(ds, p++, 4, q++, pErrorCode);


            for(i=0; i<count; ++i) {
                item=ds->readUInt32(p[i]);
                ures_swapResource(ds, inBundle, outBundle, item, ((void *)0), pTempTable, pErrorCode);
                if(((*pErrorCode)>U_ZERO_ERROR)) {
                    udata_printError_48(ds, "ures_swapResource(array res=%08x)[%d].recurse(%08x) failed\n",
                                     res, i, item);
                    return;
                }
            }


            ds->swapArray32(ds, p, 4*count, q, pErrorCode);
        }
        break;
    case URES_INT_VECTOR:
        count=udata_readInt32_48(ds, (int32_t)*p);

        ds->swapArray32(ds, p, 4*(1+count), q, pErrorCode);
        break;
    default:

        *pErrorCode=U_UNSUPPORTED_ERROR;
        break;
    }
}

extern int32_t
ures_swap_48(const UDataSwapper *ds,
          const void *inData, int32_t length, void *outData,
          UErrorCode *pErrorCode) {
    const UDataInfo *pInfo;
    const Resource *inBundle;
    Resource rootRes;
    int32_t headerSize, maxTableLength;

    Row rows[STACK_ROW_CAPACITY];
    int32_t resort[STACK_ROW_CAPACITY];
    TempTable tempTable;

    const int32_t *inIndexes;


    int32_t bundleLength, indexLength, keysBottom, keysTop, resBottom, top;


    headerSize=udata_swapDataHeader_48(ds, inData, length, outData, pErrorCode);
    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return 0;
    }


    pInfo=(const UDataInfo *)((const char *)inData+4);
    if(!(
        pInfo->dataFormat[0]==0x52 &&
        pInfo->dataFormat[1]==0x65 &&
        pInfo->dataFormat[2]==0x73 &&
        pInfo->dataFormat[3]==0x42 &&
        ((pInfo->formatVersion[0]==1 && pInfo->formatVersion[1]>=1) ||
         pInfo->formatVersion[0]==2)
    )) {
        udata_printError_48(ds, "ures_swap(): data format %02x.%02x.%02x.%02x (format version %02x.%02x) is not a resource bundle\n",
                         pInfo->dataFormat[0], pInfo->dataFormat[1],
                         pInfo->dataFormat[2], pInfo->dataFormat[3],
                         pInfo->formatVersion[0], pInfo->formatVersion[1]);
        *pErrorCode=U_UNSUPPORTED_ERROR;
        return 0;
    }
    tempTable.majorFormatVersion=pInfo->formatVersion[0];


    if(length<0) {
        bundleLength=-1;
    } else {
        bundleLength=(length-headerSize)/4;


        if(bundleLength<(1+5)) {
            udata_printError_48(ds, "ures_swap(): too few bytes (%d after header) for a resource bundle\n",
                             length-headerSize);
            *pErrorCode=U_INDEX_OUTOFBOUNDS_ERROR;
            return 0;
        }
    }

    inBundle=(const Resource *)((const char *)inData+headerSize);
    rootRes=ds->readUInt32(*inBundle);


    inIndexes=(const int32_t *)(inBundle+1);

    indexLength=udata_readInt32_48(ds, inIndexes[URES_INDEX_LENGTH])&0xff;
    if(indexLength<=URES_INDEX_MAX_TABLE_LENGTH) {
        udata_printError_48(ds, "ures_swap(): too few indexes for a 1.1+ resource bundle\n");
        *pErrorCode=U_INDEX_OUTOFBOUNDS_ERROR;
        return 0;
    }
    keysBottom=1+indexLength;
    keysTop=udata_readInt32_48(ds, inIndexes[URES_INDEX_KEYS_TOP]);
    if(indexLength>URES_INDEX_16BIT_TOP) {
        resBottom=udata_readInt32_48(ds, inIndexes[URES_INDEX_16BIT_TOP]);
    } else {
        resBottom=keysTop;
    }
    top=udata_readInt32_48(ds, inIndexes[URES_INDEX_BUNDLE_TOP]);
    maxTableLength=udata_readInt32_48(ds, inIndexes[URES_INDEX_MAX_TABLE_LENGTH]);

    if(0<=bundleLength && bundleLength<top) {
        udata_printError_48(ds, "ures_swap(): resource top %d exceeds bundle length %d\n",
                         top, bundleLength);
        *pErrorCode=U_INDEX_OUTOFBOUNDS_ERROR;
        return 0;
    }
    if(keysTop>(1+indexLength)) {
        tempTable.localKeyLimit=keysTop<<2;
    } else {
        tempTable.localKeyLimit=0;
    }

    if(length>=0) {
        Resource *outBundle=(Resource *)((char *)outData+headerSize);


        uint32_t stackResFlags[STACK_ROW_CAPACITY];
        int32_t resFlagsLength;
# 1054 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uresdata.c"
        resFlagsLength=(length+31)>>5;
        resFlagsLength=(resFlagsLength+3)&~3;
        if(resFlagsLength<=sizeof(stackResFlags)) {
            tempTable.resFlags=stackResFlags;
        } else {
            tempTable.resFlags=(uint32_t *)uprv_malloc_48(resFlagsLength);
            if(tempTable.resFlags==((void *)0)) {
                udata_printError_48(ds, "ures_swap(): unable to allocate memory for tracking resources\n");
                *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
                return 0;
            }
        }
        memset(tempTable.resFlags, 0, resFlagsLength);


        if(inData!=outData) {
            memcpy(outBundle, inBundle, 4*top);
        }


        udata_swapInvStringBlock_48(ds, inBundle+keysBottom, 4*(keysTop-keysBottom),
                                    outBundle+keysBottom, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            udata_printError_48(ds, "ures_swap().udata_swapInvStringBlock(keys[%d]) failed\n", 4*(keysTop-keysBottom));
            return 0;
        }


        if(keysTop<resBottom) {
            ds->swapArray16(ds, inBundle+keysTop, (resBottom-keysTop)*4, outBundle+keysTop, pErrorCode);
            if(((*pErrorCode)>U_ZERO_ERROR)) {
                udata_printError_48(ds, "ures_swap().swapArray16(16-bit units[%d]) failed\n", 2*(resBottom-keysTop));
                return 0;
            }
        }


        tempTable.keyChars=(const char *)outBundle;
        if(tempTable.majorFormatVersion>1 || maxTableLength<=STACK_ROW_CAPACITY) {
            tempTable.rows=rows;
            tempTable.resort=resort;
        } else {
            tempTable.rows=(Row *)uprv_malloc_48(maxTableLength*sizeof(Row)+maxTableLength*4);
            if(tempTable.rows==((void *)0)) {
                udata_printError_48(ds, "ures_swap(): unable to allocate memory for sorting tables (max length: %d)\n",
                                 maxTableLength);
                *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
                if(tempTable.resFlags!=stackResFlags) {
                    uprv_free_48(tempTable.resFlags);
                }
                return 0;
            }
            tempTable.resort=(int32_t *)(tempTable.rows+maxTableLength);
        }


        ures_swapResource(ds, inBundle, outBundle, rootRes, ((void *)0), &tempTable, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            udata_printError_48(ds, "ures_swapResource(root res=%08x) failed\n",
                             rootRes);
        }

        if(tempTable.rows!=rows) {
            uprv_free_48(tempTable.rows);
        }
        if(tempTable.resFlags!=stackResFlags) {
            uprv_free_48(tempTable.resFlags);
        }


        ds->swapArray32(ds, inBundle, keysBottom*4, outBundle, pErrorCode);
    }

    return headerSize+4*top;
}
