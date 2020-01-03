# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
# 17 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 1
# 27 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h"
# 1 "c:/marmalade/5.2/s3e/h/std/stddef.h" 1
# 16 "c:/marmalade/5.2/s3e/h/std/stddef.h"
typedef signed int ptrdiff_t;


    typedef unsigned int wint_t;
    typedef unsigned long int wctype_t;



    typedef unsigned short wchar_t;



typedef unsigned int size_t;
# 28 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 2
# 1 "c:/marmalade/5.2/s3e/h/std/string.h" 1
# 15 "c:/marmalade/5.2/s3e/h/std/string.h"
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
# 16 "c:/marmalade/5.2/s3e/h/std/string.h" 2



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
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h" 1
# 36 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/utypes.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h" 1
# 61 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/umachine.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h" 1
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ptypes.h"
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
# 30 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/cmemory.h" 2
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
# 18 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2

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
# 20 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2
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





# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uchar.h" 1
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/localpointer.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h" 2
# 330 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
typedef uint8_t UBiDiLevel;
# 417 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
enum UBiDiDirection {
# 429 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
  UBIDI_LTR,
# 441 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
  UBIDI_RTL,






  UBIDI_MIXED,






  UBIDI_NEUTRAL
};


typedef enum UBiDiDirection UBiDiDirection;
# 471 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
struct UBiDi;


typedef struct UBiDi UBiDi;
# 491 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDi *
ubidi_open_48(void);
# 528 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDi *
ubidi_openSized_48(int32_t maxLength, int32_t maxRunCount, UErrorCode *pErrorCode);
# 551 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_close_48(UBiDi *pBiDi);
# 621 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setInverse_48(UBiDi *pBiDi, UBool isInverse);
# 640 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBool
ubidi_isInverse_48(UBiDi *pBiDi);
# 663 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_orderParagraphsLTR_48(UBiDi *pBiDi, UBool orderParagraphsLTR);
# 677 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBool
ubidi_isOrderParagraphsLTR_48(UBiDi *pBiDi);
# 687 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
typedef enum UBiDiReorderingMode {



    UBIDI_REORDER_DEFAULT = 0,



    UBIDI_REORDER_NUMBERS_SPECIAL,



    UBIDI_REORDER_GROUP_NUMBERS_WITH_R,







    UBIDI_REORDER_RUNS_ONLY,




    UBIDI_REORDER_INVERSE_NUMBERS_AS_L,



    UBIDI_REORDER_INVERSE_LIKE_DIRECT,



    UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL,


    UBIDI_REORDER_COUNT
} UBiDiReorderingMode;
# 877 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setReorderingMode_48(UBiDi *pBiDi, UBiDiReorderingMode reorderingMode);
# 888 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDiReorderingMode
ubidi_getReorderingMode_48(UBiDi *pBiDi);
# 898 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
typedef enum UBiDiReorderingOption {






    UBIDI_OPTION_DEFAULT = 0,
# 951 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
    UBIDI_OPTION_INSERT_MARKS = 1,
# 969 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
    UBIDI_OPTION_REMOVE_CONTROLS = 2,
# 1017 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
    UBIDI_OPTION_STREAMING = 4
} UBiDiReorderingOption;
# 1033 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setReorderingOptions_48(UBiDi *pBiDi, uint32_t reorderingOptions);
# 1044 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern uint32_t
ubidi_getReorderingOptions_48(UBiDi *pBiDi);
# 1131 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setContext_48(UBiDi *pBiDi,
                 const UChar *prologue, int32_t proLength,
                 const UChar *epilogue, int32_t epiLength,
                 UErrorCode *pErrorCode);
# 1216 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setPara_48(UBiDi *pBiDi, const UChar *text, int32_t length,
              UBiDiLevel paraLevel, UBiDiLevel *embeddingLevels,
              UErrorCode *pErrorCode);
# 1267 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setLine_48(const UBiDi *pParaBiDi,
              int32_t start, int32_t limit,
              UBiDi *pLineBiDi,
              UErrorCode *pErrorCode);
# 1288 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDiDirection
ubidi_getDirection_48(const UBiDi *pBiDi);
# 1318 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDiDirection
ubidi_getBaseDirection_48(const UChar *text, int32_t length );
# 1332 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern const UChar *
ubidi_getText_48(const UBiDi *pBiDi);
# 1343 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_getLength_48(const UBiDi *pBiDi);
# 1361 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDiLevel
ubidi_getParaLevel_48(const UBiDi *pBiDi);
# 1372 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_countParagraphs_48(UBiDi *pBiDi);
# 1409 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_getParagraph_48(const UBiDi *pBiDi, int32_t charIndex, int32_t *pParaStart,
                   int32_t *pParaLimit, UBiDiLevel *pParaLevel,
                   UErrorCode *pErrorCode);
# 1441 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_getParagraphByIndex_48(const UBiDi *pBiDi, int32_t paraIndex,
                          int32_t *pParaStart, int32_t *pParaLimit,
                          UBiDiLevel *pParaLevel, UErrorCode *pErrorCode);
# 1461 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDiLevel
ubidi_getLevelAt_48(const UBiDi *pBiDi, int32_t charIndex);
# 1482 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern const UBiDiLevel *
ubidi_getLevels_48(UBiDi *pBiDi, UErrorCode *pErrorCode);
# 1509 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_getLogicalRun_48(const UBiDi *pBiDi, int32_t logicalPosition,
                    int32_t *pLogicalLimit, UBiDiLevel *pLevel);
# 1528 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_countRuns_48(UBiDi *pBiDi, UErrorCode *pErrorCode);
# 1587 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UBiDiDirection
ubidi_getVisualRun_48(UBiDi *pBiDi, int32_t runIndex,
                   int32_t *pLogicalStart, int32_t *pLength);
# 1628 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_getVisualIndex_48(UBiDi *pBiDi, int32_t logicalIndex, UErrorCode *pErrorCode);
# 1663 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_getLogicalIndex_48(UBiDi *pBiDi, int32_t visualIndex, UErrorCode *pErrorCode);
# 1706 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_getLogicalMap_48(UBiDi *pBiDi, int32_t *indexMap, UErrorCode *pErrorCode);
# 1742 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_getVisualMap_48(UBiDi *pBiDi, int32_t *indexMap, UErrorCode *pErrorCode);
# 1765 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_reorderLogical_48(const UBiDiLevel *levels, int32_t length, int32_t *indexMap);
# 1788 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_reorderVisual_48(const UBiDiLevel *levels, int32_t length, int32_t *indexMap);
# 1823 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_invertMap_48(const int32_t *srcMap, int32_t *destMap, int32_t length);
# 1928 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_getProcessedLength_48(const UBiDi *pBiDi);
# 1958 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_getResultLength_48(const UBiDi *pBiDi);


# 1990 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
typedef UCharDirection
UBiDiClassCallback(const void *context, UChar32 c);


# 2010 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern UCharDirection
ubidi_getCustomizedClass_48(UBiDi *pBiDi, UChar32 c);
# 2040 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_setClassCallback_48(UBiDi *pBiDi, UBiDiClassCallback *newFn,
                       const void *newContext, UBiDiClassCallback **oldFn,
                       const void **oldContext, UErrorCode *pErrorCode);
# 2057 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern void
ubidi_getClassCallback_48(UBiDi *pBiDi, UBiDiClassCallback **fn, const void **context);
# 2125 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_writeReordered_48(UBiDi *pBiDi,
                     UChar *dest, int32_t destSize,
                     uint16_t options,
                     UErrorCode *pErrorCode);
# 2177 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/ubidi.h"
extern int32_t
ubidi_writeReverse_48(const UChar *src, int32_t srcLength,
                   UChar *dest, int32_t destSize,
                   uint16_t options,
                   UErrorCode *pErrorCode);
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h"
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h" 1
# 35 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/unicode/uset.h"
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
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h" 2
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


# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h" 2
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
# 26 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h" 2





struct UBiDiProps;
typedef struct UBiDiProps UBiDiProps;

extern const UBiDiProps *
ubidi_getSingleton_48(void);

extern void
ubidi_addPropertyStarts_48(const UBiDiProps *bdp, const USetAdder *sa, UErrorCode *pErrorCode);



extern int32_t
ubidi_getMaxValue_48(const UBiDiProps *bdp, UProperty which);

extern UCharDirection
ubidi_getClass_48(const UBiDiProps *bdp, UChar32 c);

extern UBool
ubidi_isMirrored_48(const UBiDiProps *bdp, UChar32 c);

extern UChar32
ubidi_getMirror_48(const UBiDiProps *bdp, UChar32 c);

extern UBool
ubidi_isBidiControl_48(const UBiDiProps *bdp, UChar32 c);

extern UBool
ubidi_isJoinControl_48(const UBiDiProps *bdp, UChar32 c);

extern UJoiningType
ubidi_getJoiningType_48(const UBiDiProps *bdp, UChar32 c);

extern UJoiningGroup
ubidi_getJoiningGroup_48(const UBiDiProps *bdp, UChar32 c);
# 78 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h"
enum {
    UBIDI_IX_INDEX_TOP,
    UBIDI_IX_LENGTH,
    UBIDI_IX_TRIE_SIZE,
    UBIDI_IX_MIRROR_LENGTH,

    UBIDI_IX_JG_START,
    UBIDI_IX_JG_LIMIT,

    UBIDI_MAX_VALUES_INDEX=15,
    UBIDI_IX_TOP=16
};



enum {

    UBIDI_JT_SHIFT=5,



    UBIDI_JOIN_CONTROL_SHIFT=10,
    UBIDI_BIDI_CONTROL_SHIFT=11,

    UBIDI_IS_MIRRORED_SHIFT=12,
    UBIDI_MIRROR_DELTA_SHIFT=13,

    UBIDI_MAX_JG_SHIFT=16
};
# 116 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi_props.h"
enum {
    UBIDI_ESC_MIRROR_DELTA=-4,
    UBIDI_MIN_MIRROR_DELTA=-3,
    UBIDI_MAX_MIRROR_DELTA=3
};



enum {

    UBIDI_MIRROR_INDEX_SHIFT=21,
    UBIDI_MAX_MIRROR_INDEX=0x7ff
};






# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidiimp.h" 1
# 29 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidiimp.h"
typedef uint8_t DirProp;
typedef uint32_t Flags;





enum {
    L= U_LEFT_TO_RIGHT,
    R= U_RIGHT_TO_LEFT,
    EN= U_EUROPEAN_NUMBER,
    ES= U_EUROPEAN_NUMBER_SEPARATOR,
    ET= U_EUROPEAN_NUMBER_TERMINATOR,
    AN= U_ARABIC_NUMBER,
    CS= U_COMMON_NUMBER_SEPARATOR,
    B= U_BLOCK_SEPARATOR,
    S= U_SEGMENT_SEPARATOR,
    WS= U_WHITE_SPACE_NEUTRAL,
    ON= U_OTHER_NEUTRAL,
    LRE=U_LEFT_TO_RIGHT_EMBEDDING,
    LRO=U_LEFT_TO_RIGHT_OVERRIDE,
    AL= U_RIGHT_TO_LEFT_ARABIC,
    RLE=U_RIGHT_TO_LEFT_EMBEDDING,
    RLO=U_RIGHT_TO_LEFT_OVERRIDE,
    PDF=U_POP_DIRECTIONAL_FORMAT,
    NSM=U_DIR_NON_SPACING_MARK,
    BN= U_BOUNDARY_NEUTRAL,
    dirPropCount
};
# 124 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidiimp.h"
typedef int32_t Para;





enum {
    LRM_BEFORE=1,
    LRM_AFTER=2,
    RLM_BEFORE=4,
    RLM_AFTER=8
};

typedef struct Run {
    int32_t logicalStart,
            visualLimit,
            insertRemove;

} Run;
# 156 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidiimp.h"
extern UBool
ubidi_getRuns_48(UBiDi *pBiDi, UErrorCode *pErrorCode);


enum {
    ZWNJ_CHAR=0x200c,
    ZWJ_CHAR,
    LRM_CHAR,
    RLM_CHAR,
    LRE_CHAR=0x202a,
    RLE_CHAR,
    PDF_CHAR,
    LRO_CHAR,
    RLO_CHAR
};





typedef struct Point {
    int32_t pos;
    int32_t flag;
} Point;

typedef struct InsertPoints {
    int32_t capacity;
    int32_t size;
    int32_t confirmed;
    UErrorCode errorCode;
    Point *points;
} InsertPoints;




struct UBiDi {




    const UBiDi * pParaBiDi;

    const UBiDiProps *bdp;


    const UChar *text;


    int32_t originalLength;






    int32_t length;





    int32_t resultLength;


    int32_t dirPropsSize, levelsSize, parasSize, runsSize;


    DirProp *dirPropsMemory;
    UBiDiLevel *levelsMemory;
    Para *parasMemory;
    Run *runsMemory;


    UBool mayAllocateText, mayAllocateRuns;


    const DirProp *dirProps;
    UBiDiLevel *levels;


    UBool isInverse;


    UBiDiReorderingMode reorderingMode;
# 249 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidiimp.h"
    uint32_t reorderingOptions;


    UBool orderParagraphsLTR;


    UBiDiLevel paraLevel;


    UBiDiLevel defaultParaLevel;


    const UChar *prologue;
    int32_t proLength;
    const UChar *epilogue;
    int32_t epiLength;


    const struct ImpTabPair * pImpTabPair;


    UBiDiDirection direction;


    Flags flags;


    int32_t lastArabicPos;



    int32_t trailingWSStart;


    int32_t paraCount;
    Para *paras;



    Para simpleParas[1];


    int32_t runCount;
    Run *runs;


    Run simpleRuns[1];


    InsertPoints insertPoints;


    int32_t controlCount;


    UBiDiClassCallback *fnClassCallback;
    const void *coClassCallback;
};




typedef union {
    DirProp *dirPropsMemory;
    UBiDiLevel *levelsMemory;
    Para *parasMemory;
    Run *runsMemory;
} BidiMemoryForAllocation;
# 356 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidiimp.h"
extern UBool
ubidi_getMemory_48(BidiMemoryForAllocation *pMemory, int32_t *pSize, UBool mayAllocate, int32_t sizeNeeded);
# 24 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/uassert.h" 1
# 25 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c" 2
# 108 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static const Flags flagLR[2]={ (1UL<<(L)), (1UL<<(R)) };
static const Flags flagE[2]={ (1UL<<(LRE)), (1UL<<(RLE)) };
static const Flags flagO[2]={ (1UL<<(LRO)), (1UL<<(RLO)) };







extern UBiDi *
ubidi_open_48(void)
{
    UErrorCode errorCode=U_ZERO_ERROR;
    return ubidi_openSized_48(0, 0, &errorCode);
}

extern UBiDi *
ubidi_openSized_48(int32_t maxLength, int32_t maxRunCount, UErrorCode *pErrorCode) {
    UBiDi *pBiDi;


    if(pErrorCode==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    } else if(maxLength<0 || maxRunCount<0) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return ((void *)0);
    }


    pBiDi=(UBiDi *)uprv_malloc_48(sizeof(UBiDi));
    if(pBiDi==((void *)0)) {
        *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        return ((void *)0);
    }


    memset(pBiDi, 0, sizeof(UBiDi));


    pBiDi->bdp=ubidi_getSingleton_48();


    if(maxLength>0) {
        if( !ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->dirPropsMemory, &(pBiDi)->dirPropsSize, 1, (maxLength)) ||
            !ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->levelsMemory, &(pBiDi)->levelsSize, 1, (maxLength))
        ) {
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        }
    } else {
        pBiDi->mayAllocateText=1;
    }

    if(maxRunCount>0) {
        if(maxRunCount==1) {

            pBiDi->runsSize=sizeof(Run);
        } else if(!ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->runsMemory, &(pBiDi)->runsSize, 1, (maxRunCount)*sizeof(Run))) {
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        }
    } else {
        pBiDi->mayAllocateRuns=1;
    }

    if(((*pErrorCode)<=U_ZERO_ERROR)) {
        return pBiDi;
    } else {
        ubidi_close_48(pBiDi);
        return ((void *)0);
    }
}
# 193 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
extern UBool
ubidi_getMemory_48(BidiMemoryForAllocation *bidiMem, int32_t *pSize, UBool mayAllocate, int32_t sizeNeeded) {
    void **pMemory = (void **)bidiMem;

    if(*pMemory==((void *)0)) {

        if(mayAllocate && (*pMemory=uprv_malloc_48(sizeNeeded))!=((void *)0)) {
            *pSize=sizeNeeded;
            return 1;
        } else {
            return 0;
        }
    } else {
        if(sizeNeeded<=*pSize) {

            return 1;
        }
        else if(!mayAllocate) {

            return 0;
        } else {

            void *memory;




            if((memory=uprv_realloc_48(*pMemory, sizeNeeded))!=((void *)0)) {
                *pMemory=memory;
                *pSize=sizeNeeded;
                return 1;
            } else {

                return 0;
            }
        }
    }
}

extern void
ubidi_close_48(UBiDi *pBiDi) {
    if(pBiDi!=((void *)0)) {
        pBiDi->pParaBiDi=((void *)0);
        if(pBiDi->dirPropsMemory!=((void *)0)) {
            uprv_free_48(pBiDi->dirPropsMemory);
        }
        if(pBiDi->levelsMemory!=((void *)0)) {
            uprv_free_48(pBiDi->levelsMemory);
        }
        if(pBiDi->runsMemory!=((void *)0)) {
            uprv_free_48(pBiDi->runsMemory);
        }
        if(pBiDi->parasMemory!=((void *)0)) {
            uprv_free_48(pBiDi->parasMemory);
        }
        if(pBiDi->insertPoints.points!=((void *)0)) {
            uprv_free_48(pBiDi->insertPoints.points);
        }

        uprv_free_48(pBiDi);
    }
}



extern void
ubidi_setInverse_48(UBiDi *pBiDi, UBool isInverse) {
    if(pBiDi!=((void *)0)) {
        pBiDi->isInverse=isInverse;
        pBiDi->reorderingMode = isInverse ? UBIDI_REORDER_INVERSE_NUMBERS_AS_L
                                          : UBIDI_REORDER_DEFAULT;
    }
}

extern UBool
ubidi_isInverse_48(UBiDi *pBiDi) {
    if(pBiDi!=((void *)0)) {
        return pBiDi->isInverse;
    } else {
        return 0;
    }
}
# 291 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
extern void
ubidi_setReorderingMode_48(UBiDi *pBiDi, UBiDiReorderingMode reorderingMode) {
    if ((pBiDi!=((void *)0)) && (reorderingMode >= UBIDI_REORDER_DEFAULT)
                        && (reorderingMode < UBIDI_REORDER_COUNT)) {
        pBiDi->reorderingMode = reorderingMode;
        pBiDi->isInverse = (UBool)(reorderingMode == UBIDI_REORDER_INVERSE_NUMBERS_AS_L);
    }
}

extern UBiDiReorderingMode
ubidi_getReorderingMode_48(UBiDi *pBiDi) {
    if (pBiDi!=((void *)0)) {
        return pBiDi->reorderingMode;
    } else {
        return UBIDI_REORDER_DEFAULT;
    }
}

extern void
ubidi_setReorderingOptions_48(UBiDi *pBiDi, uint32_t reorderingOptions) {
    if (reorderingOptions & UBIDI_OPTION_REMOVE_CONTROLS) {
        reorderingOptions&=~UBIDI_OPTION_INSERT_MARKS;
    }
    if (pBiDi!=((void *)0)) {
        pBiDi->reorderingOptions=reorderingOptions;
    }
}

extern uint32_t
ubidi_getReorderingOptions_48(UBiDi *pBiDi) {
    if (pBiDi!=((void *)0)) {
        return pBiDi->reorderingOptions;
    } else {
        return 0;
    }
}

extern UBiDiDirection
ubidi_getBaseDirection_48(const UChar *text,
int32_t length){

    int32_t i;
    UChar32 uchar;
    UCharDirection dir;

    if( text==((void *)0) || length<-1 ){
        return UBIDI_NEUTRAL;
    }

    if(length==-1) {
        length=u_strlen_48(text);
    }

    for( i = 0 ; i < length; ) {

        { (uchar)=(text)[(i)++]; if((((uchar)&0xfffffc00)==0xd800)) { uint16_t __c2; if((i)<(length) && (((__c2=(text)[(i)])&0xfffffc00)==0xdc00)) { ++(i); (uchar)=(((UChar32)((uchar))<<10UL)+(UChar32)(__c2)-((0xd800<<10UL)+0xdc00-0x10000)); } } };
        dir = u_charDirection_48(uchar);
        if( dir == U_LEFT_TO_RIGHT )
                return UBIDI_LTR;
        if( dir == U_RIGHT_TO_LEFT || dir ==U_RIGHT_TO_LEFT_ARABIC )
                return UBIDI_RTL;
    }
    return UBIDI_NEUTRAL;
}



static DirProp
firstL_R_AL(UBiDi *pBiDi) {

    const UChar *text=pBiDi->prologue;
    int32_t length=pBiDi->proLength;
    int32_t i;
    UChar32 uchar;
    DirProp dirProp, result=ON;
    for(i=0; i<length; ) {

        { (uchar)=(text)[(i)++]; if((((uchar)&0xfffffc00)==0xd800)) { uint16_t __c2; if((i)<(length) && (((__c2=(text)[(i)])&0xfffffc00)==0xdc00)) { ++(i); (uchar)=(((UChar32)((uchar))<<10UL)+(UChar32)(__c2)-((0xd800<<10UL)+0xdc00-0x10000)); } } };
        dirProp=(DirProp)ubidi_getCustomizedClass_48(pBiDi, uchar);
        if(result==ON) {
            if(dirProp==L || dirProp==R || dirProp==AL) {
                result=dirProp;
            }
        } else {
            if(dirProp==B) {
                result=ON;
            }
        }
    }
    return result;
}






static void
getDirProps(UBiDi *pBiDi) {
    const UChar *text=pBiDi->text;
    DirProp *dirProps=pBiDi->dirPropsMemory;

    int32_t i=0, i1, length=pBiDi->originalLength;
    Flags flags=0;
    UChar32 uchar;
    DirProp dirProp=0, paraDirDefault=0;
    UBool isDefaultLevel=((pBiDi->paraLevel)>=0xfe);


    UBool isDefaultLevelInverse=isDefaultLevel && (UBool)
            (pBiDi->reorderingMode==UBIDI_REORDER_INVERSE_LIKE_DIRECT ||
             pBiDi->reorderingMode==UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL);
    int32_t lastArabicPos=-1;
    int32_t controlCount=0;
    UBool removeBiDiControls = (UBool)(pBiDi->reorderingOptions &
                                       UBIDI_OPTION_REMOVE_CONTROLS);

    typedef enum {
         NOT_CONTEXTUAL,
         LOOKING_FOR_STRONG,
         FOUND_STRONG_CHAR
    } State;
    State state;
    int32_t paraStart=0;
    DirProp paraDir;

    DirProp lastStrongDir=0;
    int32_t lastStrongLTR=0;

    if(pBiDi->reorderingOptions & UBIDI_OPTION_STREAMING) {
        pBiDi->length=0;
        lastStrongLTR=0;
    }
    if(isDefaultLevel) {
        DirProp lastStrong;
        paraDirDefault=pBiDi->paraLevel&1 ? 0x80 : 0;
        if(pBiDi->proLength>0 &&
           (lastStrong=firstL_R_AL(pBiDi))!=ON) {
            paraDir=(lastStrong==L) ? 0 : 0x80;
            state=FOUND_STRONG_CHAR;
        } else {
            paraDir=paraDirDefault;
            state=LOOKING_FOR_STRONG;
        }
        lastStrongDir=paraDir;
    } else {
        state=NOT_CONTEXTUAL;
        paraDir=0;
    }






    for( ; i<length; ) {

        { (uchar)=(text)[(i)++]; if((((uchar)&0xfffffc00)==0xd800)) { uint16_t __c2; if((i)<(length) && (((__c2=(text)[(i)])&0xfffffc00)==0xdc00)) { ++(i); (uchar)=(((UChar32)((uchar))<<10UL)+(UChar32)(__c2)-((0xd800<<10UL)+0xdc00-0x10000)); } } };
        flags|=(1UL<<(dirProp=(DirProp)ubidi_getCustomizedClass_48(pBiDi, uchar)));
        dirProps[i-1]=dirProp|paraDir;
        if(uchar>0xffff) {
            flags|=(1UL<<(BN));
            dirProps[i-2]=(DirProp)(BN|paraDir);
        }
        if(state==LOOKING_FOR_STRONG) {
            if(dirProp==L) {
                state=FOUND_STRONG_CHAR;
                if(paraDir) {
                    paraDir=0;
                    for(i1=paraStart; i1<i; i1++) {
                        dirProps[i1]&=~0x80;
                    }
                }
                continue;
            }
            if(dirProp==R || dirProp==AL) {
                state=FOUND_STRONG_CHAR;
                if(paraDir==0) {
                    paraDir=0x80;
                    for(i1=paraStart; i1<i; i1++) {
                        dirProps[i1]|=0x80;
                    }
                }
                continue;
            }
        }
        if(dirProp==L) {
            lastStrongDir=0;
            lastStrongLTR=i;
        }
        else if(dirProp==R) {
            lastStrongDir=0x80;
        }
        else if(dirProp==AL) {
            lastStrongDir=0x80;
            lastArabicPos=i-1;
        }
        else if(dirProp==B) {
            if(pBiDi->reorderingOptions & UBIDI_OPTION_STREAMING) {
                pBiDi->length=i;
            }
            if(isDefaultLevelInverse && (lastStrongDir==0x80) &&(paraDir!=lastStrongDir)) {
                for( ; paraStart<i; paraStart++) {
                    dirProps[paraStart]|=0x80;
                }
            }
            if(i<length) {
                if(!((uchar==0x000D) && (text[i]==0x000A))) {
                    pBiDi->paraCount++;
                }
                if(isDefaultLevel) {
                    state=LOOKING_FOR_STRONG;
                    paraStart=i;
                    paraDir=paraDirDefault;
                    lastStrongDir=paraDirDefault;
                }
            }
        }
        if(removeBiDiControls && (((uint32_t)(uchar)&0xfffffffc)==ZWNJ_CHAR || (uint32_t)((uchar)-LRE_CHAR)<5)) {
            controlCount++;
        }
    }
    if(isDefaultLevelInverse && (lastStrongDir==0x80) &&(paraDir!=lastStrongDir)) {
        for(i1=paraStart; i1<length; i1++) {
            dirProps[i1]|=0x80;
        }
    }
    if(isDefaultLevel) {
        pBiDi->paraLevel=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[0]>>7 : (pBiDi)->paraLevel);
    }
    if(pBiDi->reorderingOptions & UBIDI_OPTION_STREAMING) {
        if((lastStrongLTR>pBiDi->length) &&
           ((UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[lastStrongLTR]>>7 : (pBiDi)->paraLevel)==0)) {
            pBiDi->length = lastStrongLTR;
        }
        if(pBiDi->length<pBiDi->originalLength) {
            pBiDi->paraCount--;
        }
    }


    flags|=flagLR[(pBiDi->paraLevel)&1];

    if(pBiDi->orderParagraphsLTR && (flags&(1UL<<(B)))) {
        flags|=(1UL<<(L));
    }

    pBiDi->controlCount = controlCount;
    pBiDi->flags=flags;
    pBiDi->lastArabicPos=lastArabicPos;
}




static UBiDiDirection
directionFromFlags(UBiDi *pBiDi) {
    Flags flags=pBiDi->flags;

    if(!(flags&((1UL<<(R))|(1UL<<(AL))|(1UL<<(RLE))|(1UL<<(RLO))) || ((flags&(1UL<<(AN))) && (flags&((1UL<<(CS))|(1UL<<(ES))|(1UL<<(ET))|((1UL<<(ON))|(((1UL<<(B))|(1UL<<(S)))|(1UL<<(WS))|((1UL<<(BN))|(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF))))))))))) {
        return UBIDI_LTR;
    } else if(!(flags&((1UL<<(L))|(1UL<<(EN))|(1UL<<(AN))|(1UL<<(LRE))|(1UL<<(LRO))))) {
        return UBIDI_RTL;
    } else {
        return UBIDI_MIXED;
    }
}
# 611 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static UBiDiDirection
resolveExplicitLevels(UBiDi *pBiDi) {
    const DirProp *dirProps=pBiDi->dirProps;
    UBiDiLevel *levels=pBiDi->levels;
    const UChar *text=pBiDi->text;

    int32_t i=0, length=pBiDi->length;
    Flags flags=pBiDi->flags;
    DirProp dirProp;
    UBiDiLevel level=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[0]>>7 : (pBiDi)->paraLevel);

    UBiDiDirection direction;
    int32_t paraIndex=0;


    direction=directionFromFlags(pBiDi);



    if((direction!=UBIDI_MIXED) && (pBiDi->paraCount==1)) {

    } else if((pBiDi->paraCount==1) &&
              (!(flags&(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF)))) ||
               (pBiDi->reorderingMode > UBIDI_REORDER_NUMBERS_SPECIAL))) {




        for(i=0; i<length; ++i) {
            levels[i]=level;
        }
    } else {




        UBiDiLevel embeddingLevel=level, newLevel, stackTop=0;

        UBiDiLevel stack[61];
        uint32_t countOver60=0, countOver61=0;


        flags=0;

        for(i=0; i<length; ++i) {
            dirProp=((dirProps[i])&~0x80);
            switch(dirProp) {
            case LRE:
            case LRO:

                newLevel=(UBiDiLevel)((embeddingLevel+2)&~(0x80|1));
                if(newLevel<=61) {
                    stack[stackTop]=embeddingLevel;
                    ++stackTop;
                    embeddingLevel=newLevel;
                    if(dirProp==LRO) {
                        embeddingLevel|=0x80;
                    }




                } else if((embeddingLevel&~0x80)==61) {
                    ++countOver61;
                } else {
                    ++countOver60;
                }
                flags|=(1UL<<(BN));
                break;
            case RLE:
            case RLO:

                newLevel=(UBiDiLevel)(((embeddingLevel&~0x80)+1)|1);
                if(newLevel<=61) {
                    stack[stackTop]=embeddingLevel;
                    ++stackTop;
                    embeddingLevel=newLevel;
                    if(dirProp==RLO) {
                        embeddingLevel|=0x80;
                    }




                } else {
                    ++countOver61;
                }
                flags|=(1UL<<(BN));
                break;
            case PDF:


                if(countOver61>0) {
                    --countOver61;
                } else if(countOver60>0 && (embeddingLevel&~0x80)!=61) {

                    --countOver60;
                } else if(stackTop>0) {

                    --stackTop;
                    embeddingLevel=stack[stackTop];

                }
                flags|=(1UL<<(BN));
                break;
            case B:
                stackTop=0;
                countOver60=countOver61=0;
                level=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[i]>>7 : (pBiDi)->paraLevel);
                if((i+1)<length) {
                    embeddingLevel=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[i+1]>>7 : (pBiDi)->paraLevel);
                    if(!((text[i]==0x000D) && (text[i+1]==0x000A))) {
                        pBiDi->paras[paraIndex++]=i+1;
                    }
                }
                flags|=(1UL<<(B));
                break;
            case BN:


                flags|=(1UL<<(BN));
                break;
            default:

                if(level!=embeddingLevel) {
                    level=embeddingLevel;
                    if(level&0x80) {
                        flags|=flagO[(level)&1]|(1UL<<31);
                    } else {
                        flags|=flagE[(level)&1]|(1UL<<31);
                    }
                }
                if(!(level&0x80)) {
                    flags|=(1UL<<(dirProp));
                }
                break;
            }





            levels[i]=level;
        }
        if(flags&((1UL<<(NSM))|((1UL<<(CS))|(1UL<<(ES))|(1UL<<(ET))|((1UL<<(ON))|(((1UL<<(B))|(1UL<<(S)))|(1UL<<(WS))|((1UL<<(BN))|(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF))))))))) {
            flags|=flagLR[(pBiDi->paraLevel)&1];
        }
        if(pBiDi->orderParagraphsLTR && (flags&(1UL<<(B)))) {
            flags|=(1UL<<(L));
        }




        pBiDi->flags=flags;
        direction=directionFromFlags(pBiDi);
    }

    return direction;
}
# 782 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static UBiDiDirection
checkExplicitLevels(UBiDi *pBiDi, UErrorCode *pErrorCode) {
    const DirProp *dirProps=pBiDi->dirProps;
    DirProp dirProp;
    UBiDiLevel *levels=pBiDi->levels;
    const UChar *text=pBiDi->text;

    int32_t i, length=pBiDi->length;
    Flags flags=0;
    UBiDiLevel level;
    uint32_t paraIndex=0;

    for(i=0; i<length; ++i) {
        level=levels[i];
        dirProp=((dirProps[i])&~0x80);
        if(level&0x80) {

            level&=~0x80;
            flags|=flagO[(level)&1];
        } else {

            flags|=flagE[(level)&1]|(1UL<<(dirProp));
        }
        if((level<(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[i]>>7 : (pBiDi)->paraLevel) &&
            !((0==level)&&(dirProp==B))) ||
           (61<level)) {

            *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
            return UBIDI_LTR;
        }
        if((dirProp==B) && ((i+1)<length)) {
            if(!((text[i]==0x000D) && (text[i+1]==0x000A))) {
                pBiDi->paras[paraIndex++]=i+1;
            }
        }
    }
    if(flags&((1UL<<(NSM))|((1UL<<(CS))|(1UL<<(ES))|(1UL<<(ET))|((1UL<<(ON))|(((1UL<<(B))|(1UL<<(S)))|(1UL<<(WS))|((1UL<<(BN))|(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF))))))))) {
        flags|=flagLR[(pBiDi->paraLevel)&1];
    }


    pBiDi->flags=flags;
    return directionFromFlags(pBiDi);
}
# 850 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static const uint8_t groupProp[] =
{

    0, 1, 2, 7, 8, 3, 9, 6, 5, 4, 4, 10, 10, 12, 10, 10, 10, 11, 10
};
enum { DirProp_L=0, DirProp_R=1, DirProp_EN=2, DirProp_AN=3, DirProp_ON=4, DirProp_S=5, DirProp_B=6 };
# 892 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static const uint8_t impTabProps[][14] =
{

                    { 1 , 2 , 4 , 5 , 7 , 15 , 17 , 7 , 9 , 7 , 0 , 7 , 3 , DirProp_ON },
                    { 1 , ((uint8_t)(2 +(1<<5))), ((uint8_t)(4 +(1<<5))), ((uint8_t)(5 +(1<<5))), ((uint8_t)(7 +(1<<5))),((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), ((uint8_t)(7 +(1<<5))), ((uint8_t)(9 +(1<<5))), ((uint8_t)(7 +(1<<5))), 1 , 1 , ((uint8_t)(3 +(1<<5))), DirProp_L },
                    { ((uint8_t)(1 +(1<<5))), 2 , ((uint8_t)(4 +(1<<5))), ((uint8_t)(5 +(1<<5))), ((uint8_t)(7 +(1<<5))),((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), ((uint8_t)(7 +(1<<5))), ((uint8_t)(9 +(1<<5))), ((uint8_t)(7 +(1<<5))), 2 , 2 , ((uint8_t)(3 +(1<<5))), DirProp_R },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(6 +(1<<5))), ((uint8_t)(6 +(1<<5))), ((uint8_t)(8 +(1<<5))),((uint8_t)(16 +(1<<5))),((uint8_t)(17 +(1<<5))), ((uint8_t)(8 +(1<<5))), ((uint8_t)(8 +(1<<5))), ((uint8_t)(8 +(1<<5))), 3 , 3 , 3 , DirProp_R },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), 4 , ((uint8_t)(5 +(1<<5))), ((uint8_t)(7 +(1<<5))),((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))),((uint8_t)(10 +(2<<5))), 11 ,((uint8_t)(10 +(2<<5))), 4 , 4 , ((uint8_t)(3 +(1<<5))), DirProp_EN },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(4 +(1<<5))), 5 , ((uint8_t)(7 +(1<<5))),((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), ((uint8_t)(7 +(1<<5))), ((uint8_t)(9 +(1<<5))),((uint8_t)(12 +(2<<5))), 5 , 5 , ((uint8_t)(3 +(1<<5))), DirProp_AN },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), 6 , 6 , ((uint8_t)(8 +(1<<5))),((uint8_t)(16 +(1<<5))),((uint8_t)(17 +(1<<5))), ((uint8_t)(8 +(1<<5))), ((uint8_t)(8 +(1<<5))),((uint8_t)(13 +(2<<5))), 6 , 6 , ((uint8_t)(3 +(1<<5))), DirProp_AN },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(4 +(1<<5))), ((uint8_t)(5 +(1<<5))), 7 ,((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), 7 ,((uint8_t)(14 +(2<<5))), 7 , 7 , 7 , ((uint8_t)(3 +(1<<5))), DirProp_ON },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(6 +(1<<5))), ((uint8_t)(6 +(1<<5))), 8 ,((uint8_t)(16 +(1<<5))),((uint8_t)(17 +(1<<5))), 8 , 8 , 8 , 8 , 8 , ((uint8_t)(3 +(1<<5))), DirProp_ON },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), 4 , ((uint8_t)(5 +(1<<5))), 7 ,((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), 7 , 9 , 7 , 9 , 9 , ((uint8_t)(3 +(1<<5))), DirProp_ON },
                    { ((uint8_t)(1 +(3<<5))), ((uint8_t)(2 +(3<<5))), 4 , ((uint8_t)(5 +(3<<5))), ((uint8_t)(7 +(4<<5))),((uint8_t)(15 +(3<<5))),((uint8_t)(17 +(3<<5))), ((uint8_t)(7 +(4<<5))),((uint8_t)(14 +(4<<5))), ((uint8_t)(7 +(4<<5))), 10 , ((uint8_t)(7 +(4<<5))), ((uint8_t)(3 +(3<<5))), DirProp_EN },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), 4 , ((uint8_t)(5 +(1<<5))), ((uint8_t)(7 +(1<<5))),((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), ((uint8_t)(7 +(1<<5))), 11 , ((uint8_t)(7 +(1<<5))), 11 , 11 , ((uint8_t)(3 +(1<<5))), DirProp_EN },
                    { ((uint8_t)(1 +(3<<5))), ((uint8_t)(2 +(3<<5))), ((uint8_t)(4 +(3<<5))), 5 , ((uint8_t)(7 +(4<<5))),((uint8_t)(15 +(3<<5))),((uint8_t)(17 +(3<<5))), ((uint8_t)(7 +(4<<5))),((uint8_t)(14 +(4<<5))), ((uint8_t)(7 +(4<<5))), 12 , ((uint8_t)(7 +(4<<5))), ((uint8_t)(3 +(3<<5))), DirProp_AN },
                    { ((uint8_t)(1 +(3<<5))), ((uint8_t)(2 +(3<<5))), 6 , 6 , ((uint8_t)(8 +(4<<5))),((uint8_t)(16 +(3<<5))),((uint8_t)(17 +(3<<5))), ((uint8_t)(8 +(4<<5))), ((uint8_t)(8 +(4<<5))), ((uint8_t)(8 +(4<<5))), 13 , ((uint8_t)(8 +(4<<5))), ((uint8_t)(3 +(3<<5))), DirProp_AN },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(4 +(4<<5))), ((uint8_t)(5 +(1<<5))), 7 ,((uint8_t)(15 +(1<<5))),((uint8_t)(17 +(1<<5))), 7 , 14 , 7 , 14 , 14 , ((uint8_t)(3 +(1<<5))), DirProp_ON },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(4 +(1<<5))), ((uint8_t)(5 +(1<<5))), ((uint8_t)(7 +(1<<5))), 15 ,((uint8_t)(17 +(1<<5))), ((uint8_t)(7 +(1<<5))), ((uint8_t)(9 +(1<<5))), ((uint8_t)(7 +(1<<5))), 15 , ((uint8_t)(7 +(1<<5))), ((uint8_t)(3 +(1<<5))), DirProp_S },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(6 +(1<<5))), ((uint8_t)(6 +(1<<5))), ((uint8_t)(8 +(1<<5))), 16 ,((uint8_t)(17 +(1<<5))), ((uint8_t)(8 +(1<<5))), ((uint8_t)(8 +(1<<5))), ((uint8_t)(8 +(1<<5))), 16 , ((uint8_t)(8 +(1<<5))), ((uint8_t)(3 +(1<<5))), DirProp_S },
                    { ((uint8_t)(1 +(1<<5))), ((uint8_t)(2 +(1<<5))), ((uint8_t)(4 +(1<<5))), ((uint8_t)(5 +(1<<5))), ((uint8_t)(7 +(1<<5))),((uint8_t)(15 +(1<<5))), 17 , ((uint8_t)(7 +(1<<5))), ((uint8_t)(9 +(1<<5))), ((uint8_t)(7 +(1<<5))), 17 , ((uint8_t)(7 +(1<<5))), ((uint8_t)(3 +(1<<5))), DirProp_B }
};
# 945 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
typedef uint8_t ImpTab[][(DirProp_B + 2)];
typedef uint8_t ImpAct[];




typedef struct ImpTabPair {
    const void * pImpTab[2];
    const void * pImpAct[2];
} ImpTabPair;
# 993 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static const ImpTab impTabL_DEFAULT =



{

                     { 0 , 1 , 0 , 2 , 0 , 0 , 0 , 0 },
                     { 0 , 1 , 3 , 3 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), 0 , 1 },
                     { 0 , 1 , 0 , 2 , ((uint8_t)(5 +(1<<4))), ((uint8_t)(5 +(1<<4))), 0 , 2 },
                     { 0 , 1 , 3 , 3 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), 0 , 2 },
                     { ((uint8_t)(0 +(2<<4))), 1 , 3 , 3 , 4 , 4 , ((uint8_t)(0 +(2<<4))), 1 },
                     { ((uint8_t)(0 +(2<<4))), 1 , ((uint8_t)(0 +(2<<4))), 2 , 5 , 5 , ((uint8_t)(0 +(2<<4))), 1 }
};
static const ImpTab impTabR_DEFAULT =



{

                     { 1 , 0 , 2 , 2 , 0 , 0 , 0 , 0 },
                     { 1 , 0 , 1 , 3 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), 0 , 1 },
                     { 1 , 0 , 2 , 2 , 0 , 0 , 0 , 1 },
                     { 1 , 0 , 1 , 3 , 5 , 5 , 0 , 1 },
                     { ((uint8_t)(1 +(2<<4))), 0 , ((uint8_t)(1 +(2<<4))), 3 , 4 , 4 , 0 , 0 },
                     { 1 , 0 , 1 , 3 , 5 , 5 , 0 , 0 }
};
static const ImpAct impAct0 = {0,1,2,3,4,5,6};
static const ImpTabPair impTab_DEFAULT = {{&impTabL_DEFAULT,
                                           &impTabR_DEFAULT},
                                          {&impAct0, &impAct0}};

static const ImpTab impTabL_NUMBERS_SPECIAL =



{

                     { 0 , 2 , 1 , 1 , 0 , 0 , 0 , 0 },
                     { 0 , 2 , 1 , 1 , 0 , 0 , 0 , 2 },
                     { 0 , 2 , 4 , 4 , ((uint8_t)(3 +(1<<4))), 0 , 0 , 1 },
                     { ((uint8_t)(0 +(2<<4))), 2 , 4 , 4 , 3 , 3 , ((uint8_t)(0 +(2<<4))), 1 },
                     { 0 , 2 , 4 , 4 , ((uint8_t)(3 +(1<<4))), ((uint8_t)(3 +(1<<4))), 0 , 2 }
  };
static const ImpTabPair impTab_NUMBERS_SPECIAL = {{&impTabL_NUMBERS_SPECIAL,
                                                   &impTabR_DEFAULT},
                                                  {&impAct0, &impAct0}};

static const ImpTab impTabL_GROUP_NUMBERS_WITH_R =



{

                     { 0 , 3 , ((uint8_t)(1 +(1<<4))), ((uint8_t)(1 +(1<<4))), 0 , 0 , 0 , 0 },
                     { ((uint8_t)(0 +(2<<4))), 3 , 1 , 1 , 2 , ((uint8_t)(0 +(2<<4))), ((uint8_t)(0 +(2<<4))), 2 },
                     { ((uint8_t)(0 +(2<<4))), 3 , 1 , 1 , 2 , ((uint8_t)(0 +(2<<4))), ((uint8_t)(0 +(2<<4))), 1 },
                     { 0 , 3 , 5 , 5 , ((uint8_t)(4 +(1<<4))), 0 , 0 , 1 },
                     { ((uint8_t)(0 +(2<<4))), 3 , 5 , 5 , 4 , ((uint8_t)(0 +(2<<4))), ((uint8_t)(0 +(2<<4))), 1 },
                     { 0 , 3 , 5 , 5 , ((uint8_t)(4 +(1<<4))), 0 , 0 , 2 }
};
static const ImpTab impTabR_GROUP_NUMBERS_WITH_R =



{

                     { 2 , 0 , 1 , 1 , 0 , 0 , 0 , 0 },
                     { 2 , 0 , 1 , 1 , 0 , 0 , 0 , 1 },
                     { 2 , 0 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), ((uint8_t)(3 +(1<<4))), 0 , 0 , 1 },
                     { ((uint8_t)(2 +(2<<4))), 0 , 4 , 4 , 3 , 0 , 0 , 0 },
                     { ((uint8_t)(2 +(2<<4))), 0 , 4 , 4 , 3 , 0 , 0 , 1 }
};
static const ImpTabPair impTab_GROUP_NUMBERS_WITH_R = {
                        {&impTabL_GROUP_NUMBERS_WITH_R,
                         &impTabR_GROUP_NUMBERS_WITH_R},
                        {&impAct0, &impAct0}};


static const ImpTab impTabL_INVERSE_NUMBERS_AS_L =



{

                     { 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 },
                     { 0 , 1 , 0 , 0 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), 0 , 1 },
                     { 0 , 1 , 0 , 0 , ((uint8_t)(5 +(1<<4))), ((uint8_t)(5 +(1<<4))), 0 , 2 },
                     { 0 , 1 , 0 , 0 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), 0 , 2 },
                     { ((uint8_t)(0 +(2<<4))), 1 , ((uint8_t)(0 +(2<<4))), ((uint8_t)(0 +(2<<4))), 4 , 4 , ((uint8_t)(0 +(2<<4))), 1 },
                     { ((uint8_t)(0 +(2<<4))), 1 , ((uint8_t)(0 +(2<<4))), ((uint8_t)(0 +(2<<4))), 5 , 5 , ((uint8_t)(0 +(2<<4))), 1 }
};
static const ImpTab impTabR_INVERSE_NUMBERS_AS_L =



{

                     { 1 , 0 , 1 , 1 , 0 , 0 , 0 , 0 },
                     { 1 , 0 , 1 , 1 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(4 +(1<<4))), 0 , 1 },
                     { 1 , 0 , 1 , 1 , 0 , 0 , 0 , 1 },
                     { 1 , 0 , 1 , 1 , 5 , 5 , 0 , 1 },
                     { ((uint8_t)(1 +(2<<4))), 0 , ((uint8_t)(1 +(2<<4))), ((uint8_t)(1 +(2<<4))), 4 , 4 , 0 , 0 },
                     { 1 , 0 , 1 , 1 , 5 , 5 , 0 , 0 }
};
static const ImpTabPair impTab_INVERSE_NUMBERS_AS_L = {
                        {&impTabL_INVERSE_NUMBERS_AS_L,
                         &impTabR_INVERSE_NUMBERS_AS_L},
                        {&impAct0, &impAct0}};

static const ImpTab impTabR_INVERSE_LIKE_DIRECT =



{

                     { 1 , 0 , 2 , 2 , 0 , 0 , 0 , 0 },
                     { 1 , 0 , 1 , 2 , ((uint8_t)(3 +(1<<4))), ((uint8_t)(3 +(1<<4))), 0 , 1 },
                     { 1 , 0 , 2 , 2 , 0 , 0 , 0 , 1 },
                     { ((uint8_t)(1 +(2<<4))), ((uint8_t)(0 +(3<<4))), 6 , 4 , 3 , 3 , ((uint8_t)(0 +(3<<4))), 0 },
                     { ((uint8_t)(1 +(2<<4))), ((uint8_t)(0 +(3<<4))), 6 , 4 , 5 , 5 , ((uint8_t)(0 +(3<<4))), 3 },
                     { ((uint8_t)(1 +(2<<4))), ((uint8_t)(0 +(3<<4))), 6 , 4 , 5 , 5 , ((uint8_t)(0 +(3<<4))), 2 },
                     { ((uint8_t)(1 +(2<<4))), ((uint8_t)(0 +(3<<4))), 6 , 4 , 3 , 3 , ((uint8_t)(0 +(3<<4))), 1 }
};
static const ImpAct impAct1 = {0,1,11,12};


static const ImpTabPair impTab_INVERSE_LIKE_DIRECT = {
                        {&impTabL_DEFAULT,
                         &impTabR_INVERSE_LIKE_DIRECT},
                        {&impAct0, &impAct1}};

static const ImpTab impTabL_INVERSE_LIKE_DIRECT_WITH_MARKS =


{

                     { 0 , ((uint8_t)(3 +(6<<4))), 0 , 1 , 0 , 0 , 0 , 0 },
                     { 0 , ((uint8_t)(3 +(6<<4))), 0 , 1 , ((uint8_t)(2 +(1<<4))), ((uint8_t)(0 +(3<<4))), 0 , 4 },
                     { ((uint8_t)(0 +(2<<4))), ((uint8_t)(3 +(6<<4))), ((uint8_t)(0 +(2<<4))), 1 , 2 , ((uint8_t)(0 +(3<<4))), ((uint8_t)(0 +(2<<4))), 3 },
                     { 0 , ((uint8_t)(3 +(6<<4))), ((uint8_t)(5 +(5<<4))), ((uint8_t)(6 +(5<<4))), ((uint8_t)(4 +(1<<4))), ((uint8_t)(0 +(3<<4))), 0 , 3 },
                     { ((uint8_t)(0 +(3<<4))), ((uint8_t)(3 +(4<<4))), ((uint8_t)(5 +(5<<4))), ((uint8_t)(6 +(5<<4))), 4 , ((uint8_t)(0 +(3<<4))), ((uint8_t)(0 +(3<<4))), 3 },
                     { ((uint8_t)(0 +(3<<4))), ((uint8_t)(3 +(4<<4))), 5 , ((uint8_t)(6 +(5<<4))), ((uint8_t)(4 +(1<<4))), ((uint8_t)(0 +(3<<4))), ((uint8_t)(0 +(3<<4))), 4 },
                     { ((uint8_t)(0 +(3<<4))), ((uint8_t)(3 +(4<<4))), ((uint8_t)(5 +(5<<4))), 6 , ((uint8_t)(4 +(1<<4))), ((uint8_t)(0 +(3<<4))), ((uint8_t)(0 +(3<<4))), 4 }
};
static const ImpTab impTabR_INVERSE_LIKE_DIRECT_WITH_MARKS =



{

                     { ((uint8_t)(3 +(1<<4))), 0 , 1 , 1 , 0 , 0 , 0 , 0 },
                     { ((uint8_t)(3 +(2<<4))), 0 , 1 , 1 , 2 , ((uint8_t)(0 +(4<<4))), 0 , 1 },
                     { ((uint8_t)(3 +(2<<4))), 0 , 1 , 1 , 2 , ((uint8_t)(0 +(4<<4))), 0 , 0 },
                     { 3 , 0 , 3 , ((uint8_t)(6 +(3<<4))), ((uint8_t)(4 +(1<<4))), ((uint8_t)(0 +(4<<4))), 0 , 1 },
                     { ((uint8_t)(3 +(5<<4))), ((uint8_t)(0 +(4<<4))), 5 , ((uint8_t)(6 +(3<<4))), 4 , ((uint8_t)(0 +(4<<4))), ((uint8_t)(0 +(4<<4))), 0 },
                     { ((uint8_t)(3 +(5<<4))), ((uint8_t)(0 +(4<<4))), 5 , ((uint8_t)(6 +(3<<4))), 4 , ((uint8_t)(0 +(4<<4))), ((uint8_t)(0 +(4<<4))), 1 },
                     { ((uint8_t)(3 +(5<<4))), ((uint8_t)(0 +(4<<4))), 6 , 6 , 4 , ((uint8_t)(0 +(4<<4))), ((uint8_t)(0 +(4<<4))), 3 }
};
static const ImpAct impAct2 = {0,1,7,8,9,10};
static const ImpTabPair impTab_INVERSE_LIKE_DIRECT_WITH_MARKS = {
                        {&impTabL_INVERSE_LIKE_DIRECT_WITH_MARKS,
                         &impTabR_INVERSE_LIKE_DIRECT_WITH_MARKS},
                        {&impAct0, &impAct2}};

static const ImpTabPair impTab_INVERSE_FOR_NUMBERS_SPECIAL = {
                        {&impTabL_NUMBERS_SPECIAL,
                         &impTabR_INVERSE_LIKE_DIRECT},
                        {&impAct0, &impAct1}};

static const ImpTab impTabL_INVERSE_FOR_NUMBERS_SPECIAL_WITH_MARKS =


{

                     { 0 , ((uint8_t)(2 +(6<<4))), 1 , 1 , 0 , 0 , 0 , 0 },
                     { 0 , ((uint8_t)(2 +(6<<4))), 1 , 1 , 0 , ((uint8_t)(0 +(3<<4))), 0 , 4 },
                     { 0 , ((uint8_t)(2 +(6<<4))), ((uint8_t)(4 +(5<<4))), ((uint8_t)(4 +(5<<4))), ((uint8_t)(3 +(1<<4))), ((uint8_t)(0 +(3<<4))), 0 , 3 },
                     { ((uint8_t)(0 +(3<<4))), ((uint8_t)(2 +(4<<4))), ((uint8_t)(4 +(5<<4))), ((uint8_t)(4 +(5<<4))), 3 , ((uint8_t)(0 +(3<<4))), ((uint8_t)(0 +(3<<4))), 3 },
                     { ((uint8_t)(0 +(3<<4))), ((uint8_t)(2 +(4<<4))), 4 , 4 , ((uint8_t)(3 +(1<<4))), ((uint8_t)(0 +(3<<4))), ((uint8_t)(0 +(3<<4))), 4 }
};
static const ImpTabPair impTab_INVERSE_FOR_NUMBERS_SPECIAL_WITH_MARKS = {
                        {&impTabL_INVERSE_FOR_NUMBERS_SPECIAL_WITH_MARKS,
                         &impTabR_INVERSE_LIKE_DIRECT_WITH_MARKS},
                        {&impAct0, &impAct2}};



typedef struct {
    const ImpTab * pImpTab;
    const ImpAct * pImpAct;
    int32_t startON;
    int32_t startL2EN;
    int32_t lastStrongRTL;
    int32_t state;
    UBiDiLevel runLevel;
} LevState;



static void
addPoint(UBiDi *pBiDi, int32_t pos, int32_t flag)



{

    Point point;
    InsertPoints * pInsertPoints=&(pBiDi->insertPoints);

    if (pInsertPoints->capacity == 0)
    {
        pInsertPoints->points=uprv_malloc_48(sizeof(Point)*10);
        if (pInsertPoints->points == ((void *)0))
        {
            pInsertPoints->errorCode=U_MEMORY_ALLOCATION_ERROR;
            return;
        }
        pInsertPoints->capacity=10;
    }
    if (pInsertPoints->size >= pInsertPoints->capacity)
    {
        void * savePoints=pInsertPoints->points;
        pInsertPoints->points=uprv_realloc_48(pInsertPoints->points,
                                           pInsertPoints->capacity*2*sizeof(Point));
        if (pInsertPoints->points == ((void *)0))
        {
            pInsertPoints->points=savePoints;
            pInsertPoints->errorCode=U_MEMORY_ALLOCATION_ERROR;
            return;
        }
        else pInsertPoints->capacity*=2;
    }
    point.pos=pos;
    point.flag=flag;
    pInsertPoints->points[pInsertPoints->size]=point;
    pInsertPoints->size++;

}
# 1247 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static void
processPropertySeq(UBiDi *pBiDi, LevState *pLevState, uint8_t _prop,
                   int32_t start, int32_t limit) {
    uint8_t cell, oldStateSeq, actionSeq;
    const ImpTab * pImpTab=pLevState->pImpTab;
    const ImpAct * pImpAct=pLevState->pImpAct;
    UBiDiLevel * levels=pBiDi->levels;
    UBiDiLevel level, addLevel;
    InsertPoints * pInsertPoints;
    int32_t start0, k;

    start0=start;
    oldStateSeq=(uint8_t)pLevState->state;
    cell=(*pImpTab)[oldStateSeq][_prop];
    pLevState->state=((cell)&0x0f);
    actionSeq=(*pImpAct)[((cell)>>4)];
    addLevel=(*pImpTab)[pLevState->state][((DirProp_B + 2) - 1)];

    if(actionSeq) {
        switch(actionSeq) {
        case 1:
            pLevState->startON=start0;
            break;

        case 2:
            start=pLevState->startON;
            break;

        case 3:

            if (pLevState->startL2EN >= 0) {
                addPoint(pBiDi, pLevState->startL2EN, LRM_BEFORE);
            }
            pLevState->startL2EN=-1;

            pInsertPoints=&(pBiDi->insertPoints);
            if ((pInsertPoints->capacity == 0) ||
                (pInsertPoints->size <= pInsertPoints->confirmed))
            {

                pLevState->lastStrongRTL=-1;

                level=(*pImpTab)[oldStateSeq][((DirProp_B + 2) - 1)];
                if ((level & 1) && (pLevState->startON > 0)) {
                    start=pLevState->startON;
                }
                if (_prop == DirProp_S)
                {
                    addPoint(pBiDi, start0, LRM_BEFORE);
                    pInsertPoints->confirmed=pInsertPoints->size;
                }
                break;
            }

            for (k=pLevState->lastStrongRTL+1; k<start0; k++)
            {

                levels[k]=(levels[k] - 2) & ~1;
            }

            pInsertPoints->confirmed=pInsertPoints->size;
            pLevState->lastStrongRTL=-1;
            if (_prop == DirProp_S)
            {
                addPoint(pBiDi, start0, LRM_BEFORE);
                pInsertPoints->confirmed=pInsertPoints->size;
            }
            break;

        case 4:

            pInsertPoints=&(pBiDi->insertPoints);
            if (pInsertPoints->capacity > 0)

                pInsertPoints->size=pInsertPoints->confirmed;
            pLevState->startON=-1;
            pLevState->startL2EN=-1;
            pLevState->lastStrongRTL=limit - 1;
            break;

        case 5:

            if ((_prop == DirProp_AN) && (((pBiDi->dirProps[start0])&~0x80) == AN) &&
                (pBiDi->reorderingMode!=UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL))
            {

                if (pLevState->startL2EN == -1)
                {

                    pLevState->lastStrongRTL=limit - 1;
                    break;
                }
                if (pLevState->startL2EN >= 0)
                {
                    addPoint(pBiDi, pLevState->startL2EN, LRM_BEFORE);
                    pLevState->startL2EN=-2;
                }

                addPoint(pBiDi, start0, LRM_BEFORE);
                break;
            }

            if (pLevState->startL2EN == -1) {
                pLevState->startL2EN=start0;
            }
            break;

        case 6:
            pLevState->lastStrongRTL=limit - 1;
            pLevState->startON=-1;
            break;

        case 7:

            for (k=start0-1; k>=0 && !(levels[k]&1); k--);
            if(k>=0) {
                addPoint(pBiDi, k, RLM_BEFORE);
                pInsertPoints=&(pBiDi->insertPoints);
                pInsertPoints->confirmed=pInsertPoints->size;
            }
            pLevState->startON=start0;
            break;

        case 8:


            addPoint(pBiDi, start0, LRM_BEFORE);
            addPoint(pBiDi, start0, LRM_AFTER);
            break;

        case 9:

            pInsertPoints=&(pBiDi->insertPoints);
            pInsertPoints->size=pInsertPoints->confirmed;
            if (_prop == DirProp_S)
            {
                addPoint(pBiDi, start0, RLM_BEFORE);
                pInsertPoints->confirmed=pInsertPoints->size;
            }
            break;

        case 10:
            level=pLevState->runLevel + addLevel;
            for(k=pLevState->startON; k<start0; k++) {
                if (levels[k]<level)
                    levels[k]=level;
            }
            pInsertPoints=&(pBiDi->insertPoints);
            pInsertPoints->confirmed=pInsertPoints->size;
            pLevState->startON=start0;
            break;

        case 11:
            level=pLevState->runLevel;
            for(k=start0-1; k>=pLevState->startON; k--) {
                if(levels[k]==level+3) {
                    while(levels[k]==level+3) {
                        levels[k--]-=2;
                    }
                    while(levels[k]==level) {
                        k--;
                    }
                }
                if(levels[k]==level+2) {
                    levels[k]=level;
                    continue;
                }
                levels[k]=level+1;
            }
            break;

        case 12:
            level=pLevState->runLevel+1;
            for(k=start0-1; k>=pLevState->startON; k--) {
                if(levels[k]>level) {
                    levels[k]-=2;
                }
            }
            break;

        default:
            ;
            break;
        }
    }
    if((addLevel) || (start < start0)) {
        level=pLevState->runLevel + addLevel;
        for(k=start; k<limit; k++) {
            levels[k]=level;
        }
    }
}

static DirProp
lastL_R_AL(UBiDi *pBiDi) {

    const UChar *text=pBiDi->prologue;
    int32_t length=pBiDi->proLength;
    int32_t i;
    UChar32 uchar;
    DirProp dirProp;
    for(i=length; i>0; ) {

        { (uchar)=(text)[--(i)]; if((((uchar)&0xfffffc00)==0xdc00)) { uint16_t __c2; if((i)>(0) && (((__c2=(text)[(i)-1])&0xfffffc00)==0xd800)) { --(i); (uchar)=(((UChar32)(__c2)<<10UL)+(UChar32)((uchar))-((0xd800<<10UL)+0xdc00-0x10000)); } } };
        dirProp=(DirProp)ubidi_getCustomizedClass_48(pBiDi, uchar);
        if(dirProp==L) {
            return DirProp_L;
        }
        if(dirProp==R || dirProp==AL) {
            return DirProp_R;
        }
        if(dirProp==B) {
            return DirProp_ON;
        }
    }
    return DirProp_ON;
}

static DirProp
firstL_R_AL_EN_AN(UBiDi *pBiDi) {

    const UChar *text=pBiDi->epilogue;
    int32_t length=pBiDi->epiLength;
    int32_t i;
    UChar32 uchar;
    DirProp dirProp;
    for(i=0; i<length; ) {

        { (uchar)=(text)[(i)++]; if((((uchar)&0xfffffc00)==0xd800)) { uint16_t __c2; if((i)<(length) && (((__c2=(text)[(i)])&0xfffffc00)==0xdc00)) { ++(i); (uchar)=(((UChar32)((uchar))<<10UL)+(UChar32)(__c2)-((0xd800<<10UL)+0xdc00-0x10000)); } } };
        dirProp=(DirProp)ubidi_getCustomizedClass_48(pBiDi, uchar);
        if(dirProp==L) {
            return DirProp_L;
        }
        if(dirProp==R || dirProp==AL) {
            return DirProp_R;
        }
        if(dirProp==EN) {
            return DirProp_EN;
        }
        if(dirProp==AN) {
            return DirProp_AN;
        }
    }
    return DirProp_ON;
}

static void
resolveImplicitLevels(UBiDi *pBiDi,
                      int32_t start, int32_t limit,
                      DirProp sor, DirProp eor) {
    const DirProp *dirProps=pBiDi->dirProps;

    LevState levState;
    int32_t i, start1, start2;
    uint8_t oldStateImp, stateImp, actionImp;
    uint8_t gprop, resProp, cell;
    UBool inverseRTL;
    DirProp nextStrongProp=R;
    int32_t nextStrongPos=-1;

    levState.startON = -1;
# 1516 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
    inverseRTL=(UBool)
        ((start<pBiDi->lastArabicPos) && ((UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[start]>>7 : (pBiDi)->paraLevel) & 1) &&
         (pBiDi->reorderingMode==UBIDI_REORDER_INVERSE_LIKE_DIRECT ||
          pBiDi->reorderingMode==UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL));

    levState.startL2EN=-1;
    levState.lastStrongRTL=-1;
    levState.state=0;
    levState.runLevel=pBiDi->levels[start];
    levState.pImpTab=(const ImpTab*)((pBiDi->pImpTabPair)->pImpTab)[levState.runLevel&1];
    levState.pImpAct=(const ImpAct*)((pBiDi->pImpTabPair)->pImpAct)[levState.runLevel&1];
    if(start==0 && pBiDi->proLength>0) {
        DirProp lastStrong=lastL_R_AL(pBiDi);
        if(lastStrong!=DirProp_ON) {
            sor=lastStrong;
        }
    }
    processPropertySeq(pBiDi, &levState, sor, start, start);

    if(((dirProps[start])&~0x80)==NSM) {
        stateImp = 1 + sor;
    } else {
        stateImp=0;
    }
    start1=start;
    start2=start;

    for(i=start; i<=limit; i++) {
        if(i>=limit) {
            gprop=eor;
        } else {
            DirProp prop, prop1;
            prop=((dirProps[i])&~0x80);
            if(inverseRTL) {
                if(prop==AL) {

                    prop=R;
                } else if(prop==EN) {
                    if(nextStrongPos<=i) {

                        int32_t j;
                        nextStrongProp=R;
                        nextStrongPos=limit;
                        for(j=i+1; j<limit; j++) {
                            prop1=((dirProps[j])&~0x80);
                            if(prop1==L || prop1==R || prop1==AL) {
                                nextStrongProp=prop1;
                                nextStrongPos=j;
                                break;
                            }
                        }
                    }
                    if(nextStrongProp==AL) {
                        prop=AN;
                    }
                }
            }
            gprop=groupProp[prop];
        }
        oldStateImp=stateImp;
        cell=impTabProps[oldStateImp][gprop];
        stateImp=((cell)&0x1f);
        actionImp=((cell)>>5);
        if((i==limit) && (actionImp==0)) {

            actionImp=1;
        }
        if(actionImp) {
            resProp=impTabProps[oldStateImp][(14 - 1)];
            switch(actionImp) {
            case 1:
                processPropertySeq(pBiDi, &levState, resProp, start1, i);
                start1=i;
                break;
            case 2:
                start2=i;
                break;
            case 3:
                processPropertySeq(pBiDi, &levState, resProp, start1, start2);
                processPropertySeq(pBiDi, &levState, DirProp_ON, start2, i);
                start1=i;
                break;
            case 4:
                processPropertySeq(pBiDi, &levState, resProp, start1, start2);
                start1=start2;
                start2=i;
                break;
            default:
                ;
                break;
            }
        }
    }

    if(limit==pBiDi->length && pBiDi->epiLength>0) {
        DirProp firstStrong=firstL_R_AL_EN_AN(pBiDi);
        if(firstStrong!=DirProp_ON) {
            eor=firstStrong;
        }
    }
    processPropertySeq(pBiDi, &levState, eor, limit, limit);
}
# 1627 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
static void
adjustWSLevels(UBiDi *pBiDi) {
    const DirProp *dirProps=pBiDi->dirProps;
    UBiDiLevel *levels=pBiDi->levels;
    int32_t i;

    if(pBiDi->flags&(((1UL<<(B))|(1UL<<(S)))|(1UL<<(WS))|((1UL<<(BN))|(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF)))))) {
        UBool orderParagraphsLTR=pBiDi->orderParagraphsLTR;
        Flags flag;

        i=pBiDi->trailingWSStart;
        while(i>0) {

            while(i>0 && (flag=(1UL<<(((dirProps[--i])&~0x80))))&(((1UL<<(B))|(1UL<<(S)))|(1UL<<(WS))|((1UL<<(BN))|(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF)))))) {
                if(orderParagraphsLTR&&(flag&(1UL<<(B)))) {
                    levels[i]=0;
                } else {
                    levels[i]=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[i]>>7 : (pBiDi)->paraLevel);
                }
            }



            while(i>0) {
                flag=(1UL<<(((dirProps[--i])&~0x80)));
                if(flag&((1UL<<(BN))|(((1UL<<(LRE))|(1UL<<(LRO)))|((1UL<<(RLE))|(1UL<<(RLO)))|(1UL<<(PDF))))) {
                    levels[i]=levels[i+1];
                } else if(orderParagraphsLTR&&(flag&(1UL<<(B)))) {
                    levels[i]=0;
                    break;
                } else if(flag&((1UL<<(B))|(1UL<<(S)))) {
                    levels[i]=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[i]>>7 : (pBiDi)->paraLevel);
                    break;
                }
            }
        }
    }
}

extern void
ubidi_setContext_48(UBiDi *pBiDi,
                 const UChar *prologue, int32_t proLength,
                 const UChar *epilogue, int32_t epiLength,
                 UErrorCode *pErrorCode) {

    if((pErrorCode)==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) return;
    if(pBiDi==((void *)0) || proLength<-1 || epiLength<-1 ||
       (prologue==((void *)0) && proLength!=0) || (epilogue==((void *)0) && epiLength!=0)) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }

    if(proLength==-1) {
        pBiDi->proLength=u_strlen_48(prologue);
    } else {
        pBiDi->proLength=proLength;
    }
    if(epiLength==-1) {
        pBiDi->epiLength=u_strlen_48(epilogue);
    } else {
        pBiDi->epiLength=epiLength;
    }
    pBiDi->prologue=prologue;
    pBiDi->epilogue=epilogue;
}

static void
setParaSuccess(UBiDi *pBiDi) {
    pBiDi->proLength=0;
    pBiDi->epiLength=0;
    pBiDi->pParaBiDi=pBiDi;
}



static void
setParaRunsOnly(UBiDi *pBiDi, const UChar *text, int32_t length,
                UBiDiLevel paraLevel, UErrorCode *pErrorCode) {
    void *runsOnlyMemory;
    int32_t *visualMap;
    UChar *visualText;
    int32_t saveLength, saveTrailingWSStart;
    const UBiDiLevel *levels;
    UBiDiLevel *saveLevels;
    UBiDiDirection saveDirection;
    UBool saveMayAllocateText;
    Run *runs;
    int32_t visualLength, i, j, visualStart, logicalStart,
            runCount, runLength, addedRuns, insertRemove,
            start, limit, step, indexOddBit, logicalPos,
            index0, index1;
    uint32_t saveOptions;

    pBiDi->reorderingMode=UBIDI_REORDER_DEFAULT;
    if(length==0) {
        ubidi_setPara_48(pBiDi, text, length, paraLevel, ((void *)0), pErrorCode);
        goto cleanup3;
    }

    runsOnlyMemory=uprv_malloc_48(length*(sizeof(int32_t)+sizeof(UChar)+sizeof(UBiDiLevel)));
    if(runsOnlyMemory==((void *)0)) {
        *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        goto cleanup3;
    }
    visualMap=runsOnlyMemory;
    visualText=(UChar *)&visualMap[length];
    saveLevels=(UBiDiLevel *)&visualText[length];
    saveOptions=pBiDi->reorderingOptions;
    if(saveOptions & UBIDI_OPTION_INSERT_MARKS) {
        pBiDi->reorderingOptions&=~UBIDI_OPTION_INSERT_MARKS;
        pBiDi->reorderingOptions|=UBIDI_OPTION_REMOVE_CONTROLS;
    }
    paraLevel&=1;
    ubidi_setPara_48(pBiDi, text, length, paraLevel, ((void *)0), pErrorCode);
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        goto cleanup3;
    }



    levels=ubidi_getLevels_48(pBiDi, pErrorCode);
    memcpy(saveLevels, levels, pBiDi->length*sizeof(UBiDiLevel));
    saveTrailingWSStart=pBiDi->trailingWSStart;
    saveLength=pBiDi->length;
    saveDirection=pBiDi->direction;







    visualLength=ubidi_writeReordered_48(pBiDi, visualText, length,
                                      2, pErrorCode);
    ubidi_getVisualMap_48(pBiDi, visualMap, pErrorCode);
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        goto cleanup2;
    }
    pBiDi->reorderingOptions=saveOptions;

    pBiDi->reorderingMode=UBIDI_REORDER_INVERSE_LIKE_DIRECT;
    paraLevel^=1;







    saveMayAllocateText=pBiDi->mayAllocateText;
    pBiDi->mayAllocateText=0;
    ubidi_setPara_48(pBiDi, visualText, visualLength, paraLevel, ((void *)0), pErrorCode);
    pBiDi->mayAllocateText=saveMayAllocateText;
    ubidi_getRuns_48(pBiDi, pErrorCode);
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        goto cleanup1;
    }

    addedRuns=0;
    runCount=pBiDi->runCount;
    runs=pBiDi->runs;
    visualStart=0;
    for(i=0; i<runCount; i++, visualStart+=runLength) {
        runLength=runs[i].visualLimit-visualStart;
        if(runLength<2) {
            continue;
        }
        logicalStart=((runs[i].logicalStart)&~(1UL<<31));
        for(j=logicalStart+1; j<logicalStart+runLength; j++) {
            index0=visualMap[j];
            index1=visualMap[j-1];
            if((((index0-index1)>=0 ? (index0-index1) : (-(index0-index1)))!=1) || (saveLevels[index0]!=saveLevels[index1])) {
                addedRuns++;
            }
        }
    }
    if(addedRuns) {
        if(ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->runsMemory, &(pBiDi)->runsSize, (pBiDi)->mayAllocateRuns, (runCount+addedRuns)*sizeof(Run))) {
            if(runCount==1) {

                pBiDi->runsMemory[0]=runs[0];
            }
            runs=pBiDi->runs=pBiDi->runsMemory;
            pBiDi->runCount+=addedRuns;
        } else {
            goto cleanup1;
        }
    }

    for(i=runCount-1; i>=0; i--) {
        runLength= i==0 ? runs[0].visualLimit :
                          runs[i].visualLimit-runs[i-1].visualLimit;
        logicalStart=runs[i].logicalStart;
        indexOddBit=((uint32_t)(logicalStart)>>31);
        logicalStart=((logicalStart)&~(1UL<<31));
        if(runLength<2) {
            if(addedRuns) {
                runs[i+addedRuns]=runs[i];
            }
            logicalPos=visualMap[logicalStart];
            runs[i+addedRuns].logicalStart=((logicalPos)|((int32_t)(saveLevels[logicalPos]^indexOddBit)<<31));

            continue;
        }
        if(indexOddBit) {
            start=logicalStart;
            limit=logicalStart+runLength-1;
            step=1;
        } else {
            start=logicalStart+runLength-1;
            limit=logicalStart;
            step=-1;
        }
        for(j=start; j!=limit; j+=step) {
            index0=visualMap[j];
            index1=visualMap[j+step];
            if((((index0-index1)>=0 ? (index0-index1) : (-(index0-index1)))!=1) || (saveLevels[index0]!=saveLevels[index1])) {
                logicalPos=((visualMap[start])<(index0) ? (visualMap[start]) : (index0));
                runs[i+addedRuns].logicalStart=((logicalPos)|((int32_t)(saveLevels[logicalPos]^indexOddBit)<<31));

                runs[i+addedRuns].visualLimit=runs[i].visualLimit;
                runs[i].visualLimit-=((j-start)>=0 ? (j-start) : (-(j-start)))+1;
                insertRemove=runs[i].insertRemove&(LRM_AFTER|RLM_AFTER);
                runs[i+addedRuns].insertRemove=insertRemove;
                runs[i].insertRemove&=~insertRemove;
                start=j+step;
                addedRuns--;
            }
        }
        if(addedRuns) {
            runs[i+addedRuns]=runs[i];
        }
        logicalPos=((visualMap[start])<(visualMap[limit]) ? (visualMap[start]) : (visualMap[limit]));
        runs[i+addedRuns].logicalStart=((logicalPos)|((int32_t)(saveLevels[logicalPos]^indexOddBit)<<31));

    }

  cleanup1:

    pBiDi->paraLevel^=1;
  cleanup2:

    pBiDi->text=text;
    pBiDi->length=saveLength;
    pBiDi->originalLength=length;
    pBiDi->direction=saveDirection;

    if(saveLength>pBiDi->levelsSize) {
        saveLength=pBiDi->levelsSize;
    }
    memcpy(pBiDi->levels, saveLevels, saveLength*sizeof(UBiDiLevel));
    pBiDi->trailingWSStart=saveTrailingWSStart;

    uprv_free_48(runsOnlyMemory);
    if(pBiDi->runCount>1) {
        pBiDi->direction=UBIDI_MIXED;
    }
  cleanup3:
    pBiDi->reorderingMode=UBIDI_REORDER_RUNS_ONLY;
}



extern void
ubidi_setPara_48(UBiDi *pBiDi, const UChar *text, int32_t length,
              UBiDiLevel paraLevel, UBiDiLevel *embeddingLevels,
              UErrorCode *pErrorCode) {
    UBiDiDirection direction;


    if((pErrorCode)==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) return;
    if(pBiDi==((void *)0) || text==((void *)0) || length<-1 ||
       (paraLevel>61 && paraLevel<0xfe)) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }

    if(length==-1) {
        length=u_strlen_48(text);
    }


    if(pBiDi->reorderingMode==UBIDI_REORDER_RUNS_ONLY) {
        setParaRunsOnly(pBiDi, text, length, paraLevel, pErrorCode);
        return;
    }


    pBiDi->pParaBiDi=((void *)0);
    pBiDi->text=text;
    pBiDi->length=pBiDi->originalLength=pBiDi->resultLength=length;
    pBiDi->paraLevel=paraLevel;
    pBiDi->direction=UBIDI_LTR;
    pBiDi->paraCount=1;

    pBiDi->dirProps=((void *)0);
    pBiDi->levels=((void *)0);
    pBiDi->runs=((void *)0);
    pBiDi->insertPoints.size=0;
    pBiDi->insertPoints.confirmed=0;




    if(((paraLevel)>=0xfe)) {
        pBiDi->defaultParaLevel=paraLevel;
    } else {
        pBiDi->defaultParaLevel=0;
    }

    if(length==0) {





        if(((paraLevel)>=0xfe)) {
            pBiDi->paraLevel&=1;
            pBiDi->defaultParaLevel=0;
        }
        if(paraLevel&1) {
            pBiDi->flags=(1UL<<(R));
            pBiDi->direction=UBIDI_RTL;
        } else {
            pBiDi->flags=(1UL<<(L));
            pBiDi->direction=UBIDI_LTR;
        }

        pBiDi->runCount=0;
        pBiDi->paraCount=0;
        setParaSuccess(pBiDi);
        return;
    }

    pBiDi->runCount=-1;






    if(ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->dirPropsMemory, &(pBiDi)->dirPropsSize, (pBiDi)->mayAllocateText, (length))) {
        pBiDi->dirProps=pBiDi->dirPropsMemory;
        getDirProps(pBiDi);
    } else {
        *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        return;
    }

    length= pBiDi->length;
    pBiDi->trailingWSStart=length;

    if(pBiDi->paraCount>1) {
        if(ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->parasMemory, &(pBiDi)->parasSize, 1, (pBiDi->paraCount)*sizeof(Para))) {
            pBiDi->paras=pBiDi->parasMemory;
            pBiDi->paras[pBiDi->paraCount-1]=length;
        } else {
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
            return;
        }
    } else {

        pBiDi->paras=pBiDi->simpleParas;
        pBiDi->simpleParas[0]=length;
    }


    if(embeddingLevels==((void *)0)) {

        if(ubidi_getMemory_48((BidiMemoryForAllocation *)&(pBiDi)->levelsMemory, &(pBiDi)->levelsSize, (pBiDi)->mayAllocateText, (length))) {
            pBiDi->levels=pBiDi->levelsMemory;
            direction=resolveExplicitLevels(pBiDi);
        } else {
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
            return;
        }
    } else {

        pBiDi->levels=embeddingLevels;
        direction=checkExplicitLevels(pBiDi, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            return;
        }
    }





    pBiDi->direction=direction;
    switch(direction) {
    case UBIDI_LTR:

        pBiDi->paraLevel=(UBiDiLevel)((pBiDi->paraLevel+1)&~1);


        pBiDi->trailingWSStart=0;
        break;
    case UBIDI_RTL:

        pBiDi->paraLevel|=1;


        pBiDi->trailingWSStart=0;
        break;
    default:



        switch(pBiDi->reorderingMode) {
        case UBIDI_REORDER_DEFAULT:
            pBiDi->pImpTabPair=&impTab_DEFAULT;
            break;
        case UBIDI_REORDER_NUMBERS_SPECIAL:
            pBiDi->pImpTabPair=&impTab_NUMBERS_SPECIAL;
            break;
        case UBIDI_REORDER_GROUP_NUMBERS_WITH_R:
            pBiDi->pImpTabPair=&impTab_GROUP_NUMBERS_WITH_R;
            break;
        case UBIDI_REORDER_INVERSE_NUMBERS_AS_L:
            pBiDi->pImpTabPair=&impTab_INVERSE_NUMBERS_AS_L;
            break;
        case UBIDI_REORDER_INVERSE_LIKE_DIRECT:
            if (pBiDi->reorderingOptions & UBIDI_OPTION_INSERT_MARKS) {
                pBiDi->pImpTabPair=&impTab_INVERSE_LIKE_DIRECT_WITH_MARKS;
            } else {
                pBiDi->pImpTabPair=&impTab_INVERSE_LIKE_DIRECT;
            }
            break;
        case UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL:
            if (pBiDi->reorderingOptions & UBIDI_OPTION_INSERT_MARKS) {
                pBiDi->pImpTabPair=&impTab_INVERSE_FOR_NUMBERS_SPECIAL_WITH_MARKS;
            } else {
                pBiDi->pImpTabPair=&impTab_INVERSE_FOR_NUMBERS_SPECIAL;
            }
            break;
        default:

            ;
            break;
        }
# 2079 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/ubidi.c"
        if(embeddingLevels==((void *)0) && pBiDi->paraCount<=1 &&
                                   !(pBiDi->flags&(1UL<<31))) {
            resolveImplicitLevels(pBiDi, 0, length,
                                    ((DirProp)(((UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[0]>>7 : (pBiDi)->paraLevel))&1)),
                                    ((DirProp)(((UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[length-1]>>7 : (pBiDi)->paraLevel))&1)));
        } else {

            UBiDiLevel *levels=pBiDi->levels;
            int32_t start, limit=0;
            UBiDiLevel level, nextLevel;
            DirProp sor, eor;


            level=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[0]>>7 : (pBiDi)->paraLevel);
            nextLevel=levels[0];
            if(level<nextLevel) {
                eor=((DirProp)((nextLevel)&1));
            } else {
                eor=((DirProp)((level)&1));
            }

            do {



                start=limit;
                level=nextLevel;
                if((start>0) && (((pBiDi->dirProps[start-1])&~0x80)==B)) {

                    sor=((DirProp)(((UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[start]>>7 : (pBiDi)->paraLevel))&1));
                } else {
                    sor=eor;
                }


                while(++limit<length && levels[limit]==level) {}


                if(limit<length) {
                    nextLevel=levels[limit];
                } else {
                    nextLevel=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[length-1]>>7 : (pBiDi)->paraLevel);
                }


                if((level&~0x80)<(nextLevel&~0x80)) {
                    eor=((DirProp)((nextLevel)&1));
                } else {
                    eor=((DirProp)((level)&1));
                }



                if(!(level&0x80)) {
                    resolveImplicitLevels(pBiDi, start, limit, sor, eor);
                } else {

                    do {
                        levels[start++]&=~0x80;
                    } while(start<limit);
                }
            } while(limit<length);
        }

        if (((pBiDi->insertPoints.errorCode)>U_ZERO_ERROR))
        {
            *pErrorCode=pBiDi->insertPoints.errorCode;
            return;
        }

        adjustWSLevels(pBiDi);
        break;
    }



    if((pBiDi->defaultParaLevel>0) &&
       (pBiDi->reorderingOptions & UBIDI_OPTION_INSERT_MARKS) &&
       ((pBiDi->reorderingMode==UBIDI_REORDER_INVERSE_LIKE_DIRECT) ||
        (pBiDi->reorderingMode==UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL))) {
        int32_t i, j, start, last;
        DirProp dirProp;
        for(i=0; i<pBiDi->paraCount; i++) {
            last=pBiDi->paras[i]-1;
            if((pBiDi->dirProps[last] & 0x80)==0) {
                continue;
            }
            start= i==0 ? 0 : pBiDi->paras[i - 1];
            for(j=last; j>=start; j--) {
                dirProp=((pBiDi->dirProps[j])&~0x80);
                if(dirProp==L) {
                    if(j<last) {
                        while(((pBiDi->dirProps[last])&~0x80)==B) {
                            last--;
                        }
                    }
                    addPoint(pBiDi, last, RLM_BEFORE);
                    break;
                }
                if((1UL<<(dirProp)) & ((1UL<<(R))|(1UL<<(AL)))) {
                    break;
                }
            }
        }
    }

    if(pBiDi->reorderingOptions & UBIDI_OPTION_REMOVE_CONTROLS) {
        pBiDi->resultLength -= pBiDi->controlCount;
    } else {
        pBiDi->resultLength += pBiDi->insertPoints.size;
    }
    setParaSuccess(pBiDi);
}

extern void
ubidi_orderParagraphsLTR_48(UBiDi *pBiDi, UBool orderParagraphsLTR) {
    if(pBiDi!=((void *)0)) {
        pBiDi->orderParagraphsLTR=orderParagraphsLTR;
    }
}

extern UBool
ubidi_isOrderParagraphsLTR_48(UBiDi *pBiDi) {
    if(pBiDi!=((void *)0)) {
        return pBiDi->orderParagraphsLTR;
    } else {
        return 0;
    }
}

extern UBiDiDirection
ubidi_getDirection_48(const UBiDi *pBiDi) {
    if(((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return pBiDi->direction;
    } else {
        return UBIDI_LTR;
    }
}

extern const UChar *
ubidi_getText_48(const UBiDi *pBiDi) {
    if(((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return pBiDi->text;
    } else {
        return ((void *)0);
    }
}

extern int32_t
ubidi_getLength_48(const UBiDi *pBiDi) {
    if(((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return pBiDi->originalLength;
    } else {
        return 0;
    }
}

extern int32_t
ubidi_getProcessedLength_48(const UBiDi *pBiDi) {
    if(((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return pBiDi->length;
    } else {
        return 0;
    }
}

extern int32_t
ubidi_getResultLength_48(const UBiDi *pBiDi) {
    if(((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return pBiDi->resultLength;
    } else {
        return 0;
    }
}



extern UBiDiLevel
ubidi_getParaLevel_48(const UBiDi *pBiDi) {
    if(((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return pBiDi->paraLevel;
    } else {
        return 0;
    }
}

extern int32_t
ubidi_countParagraphs_48(UBiDi *pBiDi) {
    if(!((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) {
        return 0;
    } else {
        return pBiDi->paraCount;
    }
}

extern void
ubidi_getParagraphByIndex_48(const UBiDi *pBiDi, int32_t paraIndex,
                          int32_t *pParaStart, int32_t *pParaLimit,
                          UBiDiLevel *pParaLevel, UErrorCode *pErrorCode) {
    int32_t paraStart;


    if((pErrorCode)==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) return;
    if(!((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) { *pErrorCode=U_INVALID_STATE_ERROR; return; };
    if((paraIndex)<(0) || (paraIndex)>=(pBiDi->paraCount)) { (*pErrorCode)=U_ILLEGAL_ARGUMENT_ERROR; return; };

    pBiDi=pBiDi->pParaBiDi;
    if(paraIndex) {
        paraStart=pBiDi->paras[paraIndex-1];
    } else {
        paraStart=0;
    }
    if(pParaStart!=((void *)0)) {
        *pParaStart=paraStart;
    }
    if(pParaLimit!=((void *)0)) {
        *pParaLimit=pBiDi->paras[paraIndex];
    }
    if(pParaLevel!=((void *)0)) {
        *pParaLevel=(UBiDiLevel)((pBiDi)->defaultParaLevel ? (pBiDi)->dirProps[paraStart]>>7 : (pBiDi)->paraLevel);
    }
}

extern int32_t
ubidi_getParagraph_48(const UBiDi *pBiDi, int32_t charIndex,
                          int32_t *pParaStart, int32_t *pParaLimit,
                          UBiDiLevel *pParaLevel, UErrorCode *pErrorCode) {
    uint32_t paraIndex;



    if((pErrorCode)==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) return -1;
    if(!((pBiDi) && ((pBiDi)->pParaBiDi==(pBiDi) || (((pBiDi)->pParaBiDi) && (pBiDi)->pParaBiDi->pParaBiDi==(pBiDi)->pParaBiDi)))) { *pErrorCode=U_INVALID_STATE_ERROR; return -1; };
    pBiDi=pBiDi->pParaBiDi;
    if((charIndex)<(0) || (charIndex)>=(pBiDi->length)) { (*pErrorCode)=U_ILLEGAL_ARGUMENT_ERROR; return -1; };

    for(paraIndex=0; charIndex>=pBiDi->paras[paraIndex]; paraIndex++);
    ubidi_getParagraphByIndex_48(pBiDi, paraIndex, pParaStart, pParaLimit, pParaLevel, pErrorCode);
    return paraIndex;
}

extern void
ubidi_setClassCallback_48(UBiDi *pBiDi, UBiDiClassCallback *newFn,
                       const void *newContext, UBiDiClassCallback **oldFn,
                       const void **oldContext, UErrorCode *pErrorCode)
{
    if((pErrorCode)==((void *)0) || ((*pErrorCode)>U_ZERO_ERROR)) return;
    if(pBiDi==((void *)0)) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }
    if( oldFn )
    {
        *oldFn = pBiDi->fnClassCallback;
    }
    if( oldContext )
    {
        *oldContext = pBiDi->coClassCallback;
    }
    pBiDi->fnClassCallback = newFn;
    pBiDi->coClassCallback = newContext;
}

extern void
ubidi_getClassCallback_48(UBiDi *pBiDi, UBiDiClassCallback **fn, const void **context)
{
    if(pBiDi==((void *)0)) {
        return;
    }
    if( fn )
    {
        *fn = pBiDi->fnClassCallback;
    }
    if( context )
    {
        *context = pBiDi->coClassCallback;
    }
}

extern UCharDirection
ubidi_getCustomizedClass_48(UBiDi *pBiDi, UChar32 c)
{
    UCharDirection dir;

    if( pBiDi->fnClassCallback == ((void *)0) ||
        (dir = (*pBiDi->fnClassCallback)(pBiDi->coClassCallback, c)) == U_CHAR_DIRECTION_COUNT )
    {
        return ubidi_getClass_48(pBiDi->bdp, c);
    } else {
        return dir;
    }
}
