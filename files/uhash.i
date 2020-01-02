# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
# 13 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h" 1
# 16 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
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
# 17 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h" 2
# 76 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"

# 88 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
union UHashTok {
    void* pointer;
    int32_t integer;
};
typedef union UHashTok UHashTok;




struct UHashElement {

    int32_t hashcode;
    UHashTok value;
    UHashTok key;
};
typedef struct UHashElement UHashElement;






typedef int32_t UHashFunction(const UHashTok key);







typedef UBool UKeyComparator(const UHashTok key1,
                                        const UHashTok key2);






typedef UBool UValueComparator(const UHashTok val1,
                                          const UHashTok val2);







typedef void UObjectDeleter(void* obj);





enum UHashResizePolicy {
    U_GROW,
    U_GROW_AND_SHRINK,
    U_FIXED
};





struct UHashtable {



    UHashElement *elements;



    UHashFunction *keyHasher;

    UKeyComparator *keyComparator;

    UValueComparator *valueComparator;

    UObjectDeleter *keyDeleter;

    UObjectDeleter *valueDeleter;




    int32_t count;


    int32_t length;




    int32_t highWaterMark;
    int32_t lowWaterMark;
    float highWaterRatio;
    float lowWaterRatio;

    int8_t primeIndex;

    UBool allocated;
};
typedef struct UHashtable UHashtable;


# 207 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UHashtable*
uhash_open_48(UHashFunction *keyHash,
           UKeyComparator *keyComp,
           UValueComparator *valueComp,
           UErrorCode *status);
# 224 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UHashtable*
uhash_openSize_48(UHashFunction *keyHash,
               UKeyComparator *keyComp,
               UValueComparator *valueComp,
               int32_t size,
               UErrorCode *status);
# 241 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UHashtable*
uhash_init_48(UHashtable *hash,
           UHashFunction *keyHash,
           UKeyComparator *keyComp,
           UValueComparator *valueComp,
           UErrorCode *status);





extern void
uhash_close_48(UHashtable *hash);
# 263 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UHashFunction *
uhash_setKeyHasher_48(UHashtable *hash, UHashFunction *fn);
# 273 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UKeyComparator *
uhash_setKeyComparator_48(UHashtable *hash, UKeyComparator *fn);
# 283 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UValueComparator *
uhash_setValueComparator_48(UHashtable *hash, UValueComparator *fn);
# 296 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UObjectDeleter *
uhash_setKeyDeleter_48(UHashtable *hash, UObjectDeleter *fn);
# 309 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UObjectDeleter *
uhash_setValueDeleter_48(UHashtable *hash, UObjectDeleter *fn);
# 319 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void
uhash_setResizePolicy_48(UHashtable *hash, enum UHashResizePolicy policy);






extern int32_t
uhash_count_48(const UHashtable *hash);
# 343 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void*
uhash_put_48(UHashtable *hash,
          void *key,
          void *value,
          UErrorCode *status);
# 361 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void*
uhash_iput_48(UHashtable *hash,
           int32_t key,
           void* value,
           UErrorCode *status);
# 379 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_puti_48(UHashtable *hash,
           void* key,
           int32_t value,
           UErrorCode *status);
# 397 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_iputi_48(UHashtable *hash,
           int32_t key,
           int32_t value,
           UErrorCode *status);
# 410 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void*
uhash_get_48(const UHashtable *hash,
          const void *key);
# 421 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void*
uhash_iget_48(const UHashtable *hash,
           int32_t key);
# 432 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_geti_48(const UHashtable *hash,
           const void* key);







extern int32_t
uhash_igeti_48(const UHashtable *hash,
           int32_t key);







extern void*
uhash_remove_48(UHashtable *hash,
             const void *key);







extern void*
uhash_iremove_48(UHashtable *hash,
              int32_t key);







extern int32_t
uhash_removei_48(UHashtable *hash,
              const void* key);







extern int32_t
uhash_iremovei_48(UHashtable *hash,
               int32_t key);





extern void
uhash_removeAll_48(UHashtable *hash);
# 504 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern const UHashElement*
uhash_find_48(const UHashtable *hash, const void* key);
# 520 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern const UHashElement*
uhash_nextElement_48(const UHashtable *hash,
                  int32_t *pos);
# 535 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void*
uhash_removeElement_48(UHashtable *hash, const UHashElement* e);
# 569 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_hashUChars_48(const UHashTok key);
# 579 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_hashChars_48(const UHashTok key);


extern int32_t
uhash_hashUCharsN_48(const UChar *key, int32_t length);

extern int32_t
uhash_hashCharsN_48(const char *key, int32_t length);
# 596 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_hashIChars_48(const UHashTok key);
# 606 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UBool
uhash_compareUChars_48(const UHashTok key1, const UHashTok key2);
# 616 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UBool
uhash_compareChars_48(const UHashTok key1, const UHashTok key2);
# 626 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UBool
uhash_compareIChars_48(const UHashTok key1, const UHashTok key2);
# 638 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_hashUnicodeString_48(const UHashTok key);







extern int32_t
uhash_hashCaselessUnicodeString_48(const UHashTok key);







extern UBool
uhash_compareUnicodeString_48(const UHashTok key1, const UHashTok key2);
# 666 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern UBool
uhash_compareCaselessUnicodeString_48(const UHashTok key1, const UHashTok key2);





extern void
uhash_deleteUnicodeString_48(void *obj);
# 685 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern int32_t
uhash_hashLong_48(const UHashTok key);







extern UBool
uhash_compareLong_48(const UHashTok key1, const UHashTok key2);
# 705 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.h"
extern void
uhash_deleteHashtable_48(void *obj);





extern void
uhash_deleteUObject_48(void *obj);






extern void
uhash_freeBlock_48(void *obj);







extern UBool
uhash_equals_48(const UHashtable* hash1, const UHashtable* hash2);
# 14 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c" 2
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
# 15 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c" 2
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
# 16 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c" 2
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
# 17 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uassert.h" 1
# 18 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c" 2
# 78 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
static const int32_t PRIMES[] = {
    13, 31, 61, 127, 251, 509, 1021, 2039, 4093, 8191, 16381, 32749,
    65521, 131071, 262139, 524287, 1048573, 2097143, 4194301, 8388593,
    16777213, 33554393, 67108859, 134217689, 268435399, 536870909,
    1073741789, 2147483647
};
# 94 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
static const float RESIZE_POLICY_RATIO_TABLE[6] = {

    0.0F, 0.5F,
    0.1F, 0.5F,
    0.0F, 1.0F
};
# 139 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
static UHashTok
_uhash_setElement(UHashtable *hash, UHashElement* e,
                  int32_t hashcode,
                  UHashTok key, UHashTok value, int8_t hint) {

    UHashTok oldValue = e->value;
    if (hash->keyDeleter != ((void *)0) && e->key.pointer != ((void *)0) &&
        e->key.pointer != key.pointer) {
        (*hash->keyDeleter)(e->key.pointer);
    }
    if (hash->valueDeleter != ((void *)0)) {
        if (oldValue.pointer != ((void *)0) &&
            oldValue.pointer != value.pointer) {
            (*hash->valueDeleter)(oldValue.pointer);
        }
        oldValue.pointer = ((void *)0);
    }






    if (hint & (1)) {
        e->key.pointer = key.pointer;
    } else {
        e->key = key;
    }
    if (hint & (2)) {
        e->value.pointer = value.pointer;
    } else {
        e->value = value;
    }
    e->hashcode = hashcode;
    return oldValue;
}




static UHashTok
_uhash_internalRemoveElement(UHashtable *hash, UHashElement* e) {
    UHashTok empty;
    ;
    --hash->count;
    empty.pointer = ((void *)0); empty.integer = 0;
    return _uhash_setElement(hash, e, ((int32_t) 0x80000000), empty, empty, 0);
}

static void
_uhash_internalSetResizePolicy(UHashtable *hash, enum UHashResizePolicy policy) {
    ;
    ;
    ;
    hash->lowWaterRatio = RESIZE_POLICY_RATIO_TABLE[policy * 2];
    hash->highWaterRatio = RESIZE_POLICY_RATIO_TABLE[policy * 2 + 1];
}
# 206 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
static void
_uhash_allocate(UHashtable *hash,
                int32_t primeIndex,
                UErrorCode *status) {

    UHashElement *p, *limit;
    UHashTok emptytok;

    if (((*status)>U_ZERO_ERROR)) return;

    ;

    hash->primeIndex = primeIndex;
    hash->length = PRIMES[primeIndex];

    p = hash->elements = (UHashElement*)
        uprv_malloc_48(sizeof(UHashElement) * hash->length);

    if (hash->elements == ((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        return;
    }

    emptytok.pointer = ((void *)0);
    emptytok.integer = 0;

    limit = p + hash->length;
    while (p < limit) {
        p->key = emptytok;
        p->value = emptytok;
        p->hashcode = ((int32_t) ((int32_t) 0x80000000) + 1);
        ++p;
    }

    hash->count = 0;
    hash->lowWaterMark = (int32_t)(hash->length * hash->lowWaterRatio);
    hash->highWaterMark = (int32_t)(hash->length * hash->highWaterRatio);
}

static UHashtable*
_uhash_init(UHashtable *result,
              UHashFunction *keyHash,
              UKeyComparator *keyComp,
              UValueComparator *valueComp,
              int32_t primeIndex,
              UErrorCode *status)
{
    if (((*status)>U_ZERO_ERROR)) return ((void *)0);
    ;
    ;

    result->keyHasher = keyHash;
    result->keyComparator = keyComp;
    result->valueComparator = valueComp;
    result->keyDeleter = ((void *)0);
    result->valueDeleter = ((void *)0);
    result->allocated = 0;
    _uhash_internalSetResizePolicy(result, U_GROW);

    _uhash_allocate(result, primeIndex, status);

    if (((*status)>U_ZERO_ERROR)) {
        return ((void *)0);
    }

    return result;
}

static UHashtable*
_uhash_create(UHashFunction *keyHash,
              UKeyComparator *keyComp,
              UValueComparator *valueComp,
              int32_t primeIndex,
              UErrorCode *status) {
    UHashtable *result;

    if (((*status)>U_ZERO_ERROR)) return ((void *)0);

    result = (UHashtable*) uprv_malloc_48(sizeof(UHashtable));
    if (result == ((void *)0)) {
        *status = U_MEMORY_ALLOCATION_ERROR;
        return ((void *)0);
    }

    _uhash_init(result, keyHash, keyComp, valueComp, primeIndex, status);
    result->allocated = 1;

    if (((*status)>U_ZERO_ERROR)) {
        uprv_free_48(result);
        return ((void *)0);
    }

    return result;
}
# 329 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
static UHashElement*
_uhash_find(const UHashtable *hash, UHashTok key,
            int32_t hashcode) {

    int32_t firstDeleted = -1;
    int32_t theIndex, startIndex;
    int32_t jump = 0;
    int32_t tableHash;
    UHashElement *elements = hash->elements;

    hashcode &= 0x7FFFFFFF;
    startIndex = theIndex = (hashcode ^ 0x4000000) % hash->length;

    do {
        tableHash = elements[theIndex].hashcode;
        if (tableHash == hashcode) {
            if ((*hash->keyComparator)(key, elements[theIndex].key)) {
                return &(elements[theIndex]);
            }
        } else if (!((tableHash) < 0)) {




        } else if (tableHash == ((int32_t) ((int32_t) 0x80000000) + 1)) {
            break;
        } else if (firstDeleted < 0) {
            firstDeleted = theIndex;
        }
        if (jump == 0) {




            jump = (hashcode % (hash->length - 1)) + 1;
        }
        theIndex = (theIndex + jump) % hash->length;
    } while (theIndex != startIndex);

    if (firstDeleted >= 0) {
        theIndex = firstDeleted;
    } else if (tableHash != ((int32_t) ((int32_t) 0x80000000) + 1)) {





        ;
        return ((void *)0);
    }
    return &(elements[theIndex]);
}
# 391 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
static void
_uhash_rehash(UHashtable *hash, UErrorCode *status) {

    UHashElement *old = hash->elements;
    int32_t oldLength = hash->length;
    int32_t newPrimeIndex = hash->primeIndex;
    int32_t i;

    if (hash->count > hash->highWaterMark) {
        if (++newPrimeIndex >= (sizeof(PRIMES) / sizeof(PRIMES[0]))) {
            return;
        }
    } else if (hash->count < hash->lowWaterMark) {
        if (--newPrimeIndex < 0) {
            return;
        }
    } else {
        return;
    }

    _uhash_allocate(hash, newPrimeIndex, status);

    if (((*status)>U_ZERO_ERROR)) {
        hash->elements = old;
        hash->length = oldLength;
        return;
    }

    for (i = oldLength - 1; i >= 0; --i) {
        if (!((old[i].hashcode) < 0)) {
            UHashElement *e = _uhash_find(hash, old[i].key, old[i].hashcode);
            ;
            ;
            e->key = old[i].key;
            e->value = old[i].value;
            e->hashcode = old[i].hashcode;
            ++hash->count;
        }
    }

    uprv_free_48(old);
}

static UHashTok
_uhash_remove(UHashtable *hash,
              UHashTok key) {







    UHashTok result;
    UHashElement* e = _uhash_find(hash, key, hash->keyHasher(key));
    ;
    result.pointer = ((void *)0);
    result.integer = 0;
    if (!((e->hashcode) < 0)) {
        result = _uhash_internalRemoveElement(hash, e);
        if (hash->count < hash->lowWaterMark) {
            UErrorCode status = U_ZERO_ERROR;
            _uhash_rehash(hash, &status);
        }
    }
    return result;
}

static UHashTok
_uhash_put(UHashtable *hash,
           UHashTok key,
           UHashTok value,
           int8_t hint,
           UErrorCode *status) {






    int32_t hashcode;
    UHashElement* e;
    UHashTok emptytok;

    if (((*status)>U_ZERO_ERROR)) {
        goto err;
    }
    ;

    if ((hint & (2)) && value.pointer == ((void *)0)) {



        return _uhash_remove(hash, key);
    }
    if (hash->count > hash->highWaterMark) {
        _uhash_rehash(hash, status);
        if (((*status)>U_ZERO_ERROR)) {
            goto err;
        }
    }

    hashcode = (*hash->keyHasher)(key);
    e = _uhash_find(hash, key, hashcode);
    ;

    if (((e->hashcode) < 0)) {







        ++hash->count;
        if (hash->count == hash->length) {

            --hash->count;
            *status = U_MEMORY_ALLOCATION_ERROR;
            goto err;
        }
    }





    return _uhash_setElement(hash, e, hashcode & 0x7FFFFFFF, key, value, hint);

 err:




    if (hash->keyDeleter != ((void *)0) && key.pointer != ((void *)0)) { (*hash->keyDeleter)(key.pointer); } if (hash->valueDeleter != ((void *)0) && value.pointer != ((void *)0)) { (*hash->valueDeleter)(value.pointer); };
    emptytok.pointer = ((void *)0); emptytok.integer = 0;
    return emptytok;
}






extern UHashtable*
uhash_open_48(UHashFunction *keyHash,
           UKeyComparator *keyComp,
           UValueComparator *valueComp,
           UErrorCode *status) {

    return _uhash_create(keyHash, keyComp, valueComp, 3, status);
}

extern UHashtable*
uhash_openSize_48(UHashFunction *keyHash,
               UKeyComparator *keyComp,
               UValueComparator *valueComp,
               int32_t size,
               UErrorCode *status) {


    int32_t i = 0;
    while (i<((sizeof(PRIMES) / sizeof(PRIMES[0]))-1) && PRIMES[i]<size) {
        ++i;
    }

    return _uhash_create(keyHash, keyComp, valueComp, i, status);
}

extern UHashtable*
uhash_init_48(UHashtable *fillinResult,
           UHashFunction *keyHash,
           UKeyComparator *keyComp,
           UValueComparator *valueComp,
           UErrorCode *status) {

    return _uhash_init(fillinResult, keyHash, keyComp, valueComp, 3, status);
}

extern void
uhash_close_48(UHashtable *hash) {
    if (hash == ((void *)0)) {
        return;
    }
    if (hash->elements != ((void *)0)) {
        if (hash->keyDeleter != ((void *)0) || hash->valueDeleter != ((void *)0)) {
            int32_t pos=-1;
            UHashElement *e;
            while ((e = (UHashElement*) uhash_nextElement_48(hash, &pos)) != ((void *)0)) {
                if (hash->keyDeleter != ((void *)0) && e->key.pointer != ((void *)0)) { (*hash->keyDeleter)(e->key.pointer); } if (hash->valueDeleter != ((void *)0) && e->value.pointer != ((void *)0)) { (*hash->valueDeleter)(e->value.pointer); };
            }
        }
        uprv_free_48(hash->elements);
        hash->elements = ((void *)0);
    }
    if (hash->allocated) {
        uprv_free_48(hash);
    }
}

extern UHashFunction *
uhash_setKeyHasher_48(UHashtable *hash, UHashFunction *fn) {
    UHashFunction *result = hash->keyHasher;
    hash->keyHasher = fn;
    return result;
}

extern UKeyComparator *
uhash_setKeyComparator_48(UHashtable *hash, UKeyComparator *fn) {
    UKeyComparator *result = hash->keyComparator;
    hash->keyComparator = fn;
    return result;
}
extern UValueComparator *
uhash_setValueComparator_48(UHashtable *hash, UValueComparator *fn){
    UValueComparator *result = hash->valueComparator;
    hash->valueComparator = fn;
    return result;
}

extern UObjectDeleter *
uhash_setKeyDeleter_48(UHashtable *hash, UObjectDeleter *fn) {
    UObjectDeleter *result = hash->keyDeleter;
    hash->keyDeleter = fn;
    return result;
}

extern UObjectDeleter *
uhash_setValueDeleter_48(UHashtable *hash, UObjectDeleter *fn) {
    UObjectDeleter *result = hash->valueDeleter;
    hash->valueDeleter = fn;
    return result;
}

extern void
uhash_setResizePolicy_48(UHashtable *hash, enum UHashResizePolicy policy) {
    UErrorCode status = U_ZERO_ERROR;
    _uhash_internalSetResizePolicy(hash, policy);
    hash->lowWaterMark = (int32_t)(hash->length * hash->lowWaterRatio);
    hash->highWaterMark = (int32_t)(hash->length * hash->highWaterRatio);
    _uhash_rehash(hash, &status);
}

extern int32_t
uhash_count_48(const UHashtable *hash) {
    return hash->count;
}

extern void*
uhash_get_48(const UHashtable *hash,
          const void* key) {
    UHashTok keyholder;
    keyholder.pointer = (void*) key;
    return _uhash_find(hash, keyholder, hash->keyHasher(keyholder))->value.pointer;
}

extern void*
uhash_iget_48(const UHashtable *hash,
           int32_t key) {
    UHashTok keyholder;
    keyholder.integer = key;
    return _uhash_find(hash, keyholder, hash->keyHasher(keyholder))->value.pointer;
}

extern int32_t
uhash_geti_48(const UHashtable *hash,
           const void* key) {
    UHashTok keyholder;
    keyholder.pointer = (void*) key;
    return _uhash_find(hash, keyholder, hash->keyHasher(keyholder))->value.integer;
}

extern int32_t
uhash_igeti_48(const UHashtable *hash,
           int32_t key) {
    UHashTok keyholder;
    keyholder.integer = key;
    return _uhash_find(hash, keyholder, hash->keyHasher(keyholder))->value.integer;
}

extern void*
uhash_put_48(UHashtable *hash,
          void* key,
          void* value,
          UErrorCode *status) {
    UHashTok keyholder, valueholder;
    keyholder.pointer = key;
    valueholder.pointer = value;
    return _uhash_put(hash, keyholder, valueholder,
                      (1) | (2),
                      status).pointer;
}

extern void*
uhash_iput_48(UHashtable *hash,
           int32_t key,
           void* value,
           UErrorCode *status) {
    UHashTok keyholder, valueholder;
    keyholder.integer = key;
    valueholder.pointer = value;
    return _uhash_put(hash, keyholder, valueholder,
                      (2),
                      status).pointer;
}

extern int32_t
uhash_puti_48(UHashtable *hash,
           void* key,
           int32_t value,
           UErrorCode *status) {
    UHashTok keyholder, valueholder;
    keyholder.pointer = key;
    valueholder.integer = value;
    return _uhash_put(hash, keyholder, valueholder,
                      (1),
                      status).integer;
}


extern int32_t
uhash_iputi_48(UHashtable *hash,
           int32_t key,
           int32_t value,
           UErrorCode *status) {
    UHashTok keyholder, valueholder;
    keyholder.integer = key;
    valueholder.integer = value;
    return _uhash_put(hash, keyholder, valueholder,
                      0,
                      status).integer;
}

extern void*
uhash_remove_48(UHashtable *hash,
             const void* key) {
    UHashTok keyholder;
    keyholder.pointer = (void*) key;
    return _uhash_remove(hash, keyholder).pointer;
}

extern void*
uhash_iremove_48(UHashtable *hash,
              int32_t key) {
    UHashTok keyholder;
    keyholder.integer = key;
    return _uhash_remove(hash, keyholder).pointer;
}

extern int32_t
uhash_removei_48(UHashtable *hash,
              const void* key) {
    UHashTok keyholder;
    keyholder.pointer = (void*) key;
    return _uhash_remove(hash, keyholder).integer;
}

extern int32_t
uhash_iremovei_48(UHashtable *hash,
               int32_t key) {
    UHashTok keyholder;
    keyholder.integer = key;
    return _uhash_remove(hash, keyholder).integer;
}

extern void
uhash_removeAll_48(UHashtable *hash) {
    int32_t pos = -1;
    const UHashElement *e;
    ;
    if (hash->count != 0) {
        while ((e = uhash_nextElement_48(hash, &pos)) != ((void *)0)) {
            uhash_removeElement_48(hash, e);
        }
    }
    ;
}

extern const UHashElement*
uhash_find_48(const UHashtable *hash, const void* key) {
    UHashTok keyholder;
    const UHashElement *e;
    keyholder.pointer = (void*) key;
    e = _uhash_find(hash, keyholder, hash->keyHasher(keyholder));
    return ((e->hashcode) < 0) ? ((void *)0) : e;
}

extern const UHashElement*
uhash_nextElement_48(const UHashtable *hash, int32_t *pos) {



    int32_t i;
    ;
    for (i = *pos + 1; i < hash->length; ++i) {
        if (!((hash->elements[i].hashcode) < 0)) {
            *pos = i;
            return &(hash->elements[i]);
        }
    }


    return ((void *)0);
}

extern void*
uhash_removeElement_48(UHashtable *hash, const UHashElement* e) {
    ;
    ;
    if (!((e->hashcode) < 0)) {
        UHashElement *nce = (UHashElement *)e;
        return _uhash_internalRemoveElement(hash, nce).pointer;
    }
    return ((void *)0);
}
# 858 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
extern int32_t
uhash_hashUChars_48(const UHashTok key) {
    int32_t hash = 0; const UChar *p = (const UChar*) key.pointer; if (p != ((void *)0)) { int32_t len = (int32_t)(u_strlen_48(p)); int32_t inc = ((len - 32) / 32) + 1; const UChar *limit = p + len; while (p<limit) { hash = (hash * 37) + *p; p += inc; } } return hash;
}


extern int32_t
uhash_hashUCharsN_48(const UChar *str, int32_t length) {
    int32_t hash = 0; const UChar *p = (const UChar*) str; if (p != ((void *)0)) { int32_t len = (int32_t)(length); int32_t inc = ((len - 32) / 32) + 1; const UChar *limit = p + len; while (p<limit) { hash = (hash * 37) + *p; p += inc; } } return hash;
}

extern int32_t
uhash_hashCharsN_48(const char *str, int32_t length) {
    int32_t hash = 0; const char *p = (const char*) str; if (p != ((void *)0)) { int32_t len = (int32_t)(length); int32_t inc = ((len - 32) / 32) + 1; const char *limit = p + len; while (p<limit) { hash = (hash * 37) + *p; p += inc; } } return hash;
}

extern int32_t
uhash_hashChars_48(const UHashTok key) {
    int32_t hash = 0; const uint8_t *p = (const uint8_t*) key.pointer; if (p != ((void *)0)) { int32_t len = (int32_t)( strlen((char*)p)); int32_t inc = ((len - 32) / 32) + 1; const uint8_t *limit = p + len; while (p<limit) { hash = (hash * 37) + *p; p += inc; } } return hash;
}

extern int32_t
uhash_hashIChars_48(const UHashTok key) {
    int32_t hash = 0; const uint8_t *p = (const uint8_t*) key.pointer; if (p != ((void *)0)) { int32_t len = (int32_t)( strlen((char*)p)); int32_t inc = ((len - 32) / 32) + 1; const uint8_t *limit = p + len; while (p<limit) { hash = (hash * 37) + uprv_asciitolower_48(*p); p += inc; } } return hash;
}

extern UBool
uhash_equals_48(const UHashtable* hash1, const UHashtable* hash2){

    int32_t count1, count2, pos, i;

    if(hash1==hash2){
        return 1;
    }
# 901 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uhash.c"
    if (hash1==((void *)0) || hash2==((void *)0) ||
        hash1->keyComparator != hash2->keyComparator ||
        hash1->valueComparator != hash2->valueComparator ||
        hash1->valueComparator == ((void *)0))
    {




        return 0;
    }

    count1 = uhash_count_48(hash1);
    count2 = uhash_count_48(hash2);
    if(count1!=count2){
        return 0;
    }

    pos=-1;
    for(i=0; i<count1; i++){
        const UHashElement* elem1 = uhash_nextElement_48(hash1, &pos);
        const UHashTok key1 = elem1->key;
        const UHashTok val1 = elem1->value;




        const UHashElement* elem2 = _uhash_find(hash2, key1, hash2->keyHasher(key1));
        const UHashTok val2 = elem2->value;
        if(hash1->valueComparator(val1, val2)==0){
            return 0;
        }
    }
    return 1;
}





extern UBool
uhash_compareUChars_48(const UHashTok key1, const UHashTok key2) {
    const UChar *p1 = (const UChar*) key1.pointer;
    const UChar *p2 = (const UChar*) key2.pointer;
    if (p1 == p2) {
        return 1;
    }
    if (p1 == ((void *)0) || p2 == ((void *)0)) {
        return 0;
    }
    while (*p1 != 0 && *p1 == *p2) {
        ++p1;
        ++p2;
    }
    return (UBool)(*p1 == *p2);
}

extern UBool
uhash_compareChars_48(const UHashTok key1, const UHashTok key2) {
    const char *p1 = (const char*) key1.pointer;
    const char *p2 = (const char*) key2.pointer;
    if (p1 == p2) {
        return 1;
    }
    if (p1 == ((void *)0) || p2 == ((void *)0)) {
        return 0;
    }
    while (*p1 != 0 && *p1 == *p2) {
        ++p1;
        ++p2;
    }
    return (UBool)(*p1 == *p2);
}

extern UBool
uhash_compareIChars_48(const UHashTok key1, const UHashTok key2) {
    const char *p1 = (const char*) key1.pointer;
    const char *p2 = (const char*) key2.pointer;
    if (p1 == p2) {
        return 1;
    }
    if (p1 == ((void *)0) || p2 == ((void *)0)) {
        return 0;
    }
    while (*p1 != 0 && uprv_asciitolower_48(*p1) == uprv_asciitolower_48(*p2)) {
        ++p1;
        ++p2;
    }
    return (UBool)(*p1 == *p2);
}





extern int32_t
uhash_hashLong_48(const UHashTok key) {
    return key.integer;
}

extern UBool
uhash_compareLong_48(const UHashTok key1, const UHashTok key2) {
    return (UBool)(key1.integer == key2.integer);
}





extern void
uhash_freeBlock_48(void *obj) {
    uprv_free_48(obj);
}
