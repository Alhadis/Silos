# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
# 1 "C:\\Users\\will\\Documents\\UtterSpeech\\marmalade\\icu\\common\\build_common_vc10//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/will/Documents/UtterSpeech/marmalade/icu/common/build_common_vc10/temp_defines_debug.h" 1
# 1 "<command-line>" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
# 29 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
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
# 30 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c" 2
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
# 31 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h" 1
# 21 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
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
# 22 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h" 2



struct UTrie;

typedef struct UTrie UTrie;
# 60 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
struct UTrie2;
typedef struct UTrie2 UTrie2;






enum UTrie2ValueBits {

    UTRIE2_16_VALUE_BITS,

    UTRIE2_32_VALUE_BITS,

    UTRIE2_COUNT_VALUE_BITS
};
typedef enum UTrie2ValueBits UTrie2ValueBits;
# 97 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UTrie2 *
utrie2_openFromSerialized_48(UTrie2ValueBits valueBits,
                          const void *data, int32_t length, int32_t *pActualLength,
                          UErrorCode *pErrorCode);
# 123 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UTrie2 *
utrie2_openDummy_48(UTrie2ValueBits valueBits,
                 uint32_t initialValue, uint32_t errorValue,
                 UErrorCode *pErrorCode);
# 138 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern uint32_t
utrie2_get32_48(const UTrie2 *trie, UChar32 c);
# 151 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
typedef uint32_t
UTrie2EnumValue(const void *context, uint32_t value);
# 167 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
typedef UBool
UTrie2EnumRange(const void *context, UChar32 start, UChar32 end, uint32_t value);
# 188 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern void
utrie2_enum_48(const UTrie2 *trie,
            UTrie2EnumValue *enumValue, UTrie2EnumRange *enumRange, const void *context);
# 205 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UTrie2 *
utrie2_open_48(uint32_t initialValue, uint32_t errorValue, UErrorCode *pErrorCode);
# 216 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UTrie2 *
utrie2_clone_48(const UTrie2 *other, UErrorCode *pErrorCode);
# 228 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UTrie2 *
utrie2_cloneAsThawed_48(const UTrie2 *other, UErrorCode *pErrorCode);






extern void
utrie2_close_48(UTrie2 *trie);
# 248 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern void
utrie2_set32_48(UTrie2 *trie, UChar32 c, uint32_t value, UErrorCode *pErrorCode);
# 264 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern void
utrie2_setRange32_48(UTrie2 *trie,
                  UChar32 start, UChar32 end,
                  uint32_t value, UBool overwrite,
                  UErrorCode *pErrorCode);
# 289 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern void
utrie2_freeze_48(UTrie2 *trie, UTrie2ValueBits valueBits, UErrorCode *pErrorCode);
# 299 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UBool
utrie2_isFrozen_48(const UTrie2 *trie);
# 320 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern int32_t
utrie2_serialize_48(UTrie2 *trie,
                 void *data, int32_t capacity,
                 UErrorCode *pErrorCode);
# 340 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern int32_t
utrie2_getVersion_48(const void *data, int32_t length, UBool anyEndianOk);





extern int32_t
utrie2_swap_48(const UDataSwapper *ds,
            const void *inData, int32_t length, void *outData,
            UErrorCode *pErrorCode);





extern int32_t
utrie2_swapAnyVersion_48(const UDataSwapper *ds,
                      const void *inData, int32_t length, void *outData,
                      UErrorCode *pErrorCode);
# 371 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern UTrie2 *
utrie2_fromUTrie_48(const UTrie *trie1, uint32_t errorValue, UErrorCode *pErrorCode);
# 530 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern uint32_t
utrie2_get32FromLeadSurrogateCodeUnit_48(const UTrie2 *trie, UChar32 c);
# 558 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern void
utrie2_enumForLeadSurrogate_48(const UTrie2 *trie, UChar32 lead,
                            UTrie2EnumValue *enumValue, UTrie2EnumRange *enumRange,
                            const void *context);
# 572 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern void
utrie2_set32ForLeadSurrogateCodeUnit_48(UTrie2 *trie,
                                     UChar32 lead, uint32_t value,
                                     UErrorCode *pErrorCode);
# 617 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"

# 679 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"



struct UNewTrie2;
typedef struct UNewTrie2 UNewTrie2;
# 694 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
struct UTrie2 {

    const uint16_t *index;
    const uint16_t *data16;
    const uint32_t *data32;

    int32_t indexLength, dataLength;
    uint16_t index2NullOffset;
    uint16_t dataNullOffset;
    uint32_t initialValue;

    uint32_t errorValue;


    UChar32 highStart;
    int32_t highValueIndex;


    void *memory;
    int32_t length;
    UBool isMemoryOwned;
    UBool padding1;
    int16_t padding2;
    UNewTrie2 *newTrie;
};







enum {

    UTRIE2_SHIFT_1=6+5,


    UTRIE2_SHIFT_2=5,





    UTRIE2_SHIFT_1_2=UTRIE2_SHIFT_1-UTRIE2_SHIFT_2,





    UTRIE2_OMITTED_BMP_INDEX_1_LENGTH=0x10000>>UTRIE2_SHIFT_1,


    UTRIE2_CP_PER_INDEX_1_ENTRY=1<<UTRIE2_SHIFT_1,


    UTRIE2_INDEX_2_BLOCK_LENGTH=1<<UTRIE2_SHIFT_1_2,


    UTRIE2_INDEX_2_MASK=UTRIE2_INDEX_2_BLOCK_LENGTH-1,


    UTRIE2_DATA_BLOCK_LENGTH=1<<UTRIE2_SHIFT_2,


    UTRIE2_DATA_MASK=UTRIE2_DATA_BLOCK_LENGTH-1,







    UTRIE2_INDEX_SHIFT=2,


    UTRIE2_DATA_GRANULARITY=1<<UTRIE2_INDEX_SHIFT,







    UTRIE2_INDEX_2_OFFSET=0,







    UTRIE2_LSCP_INDEX_2_OFFSET=0x10000>>UTRIE2_SHIFT_2,
    UTRIE2_LSCP_INDEX_2_LENGTH=0x400>>UTRIE2_SHIFT_2,


    UTRIE2_INDEX_2_BMP_LENGTH=UTRIE2_LSCP_INDEX_2_OFFSET+UTRIE2_LSCP_INDEX_2_LENGTH,





    UTRIE2_UTF8_2B_INDEX_2_OFFSET=UTRIE2_INDEX_2_BMP_LENGTH,
    UTRIE2_UTF8_2B_INDEX_2_LENGTH=0x800>>6,
# 810 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
    UTRIE2_INDEX_1_OFFSET=UTRIE2_UTF8_2B_INDEX_2_OFFSET+UTRIE2_UTF8_2B_INDEX_2_LENGTH,
    UTRIE2_MAX_INDEX_1_LENGTH=0x100000>>UTRIE2_SHIFT_1,
# 823 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
    UTRIE2_BAD_UTF8_DATA_OFFSET=0x80,


    UTRIE2_DATA_START_OFFSET=0xc0
};
# 836 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"
extern int32_t
utrie2_internalU8NextIndex_48(const UTrie2 *trie, UChar32 c,
                           const uint8_t *src, const uint8_t *limit);






extern int32_t
utrie2_internalU8PrevIndex_48(const UTrie2 *trie, UChar32 c,
                           const uint8_t *start, const uint8_t *src);
# 990 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2.h"

# 32 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c" 2
# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_impl.h" 1
# 50 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_impl.h"
typedef struct UTrie2Header {

    uint32_t signature;






    uint16_t options;


    uint16_t indexLength;


    uint16_t shiftedDataLength;


    uint16_t index2NullOffset, dataNullOffset;





    uint16_t shiftedHighStart;
} UTrie2Header;





enum {

    UTRIE2_OPTIONS_VALUE_BITS_MASK=0xf
};
# 93 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_impl.h"
enum {






    UNEWTRIE2_INDEX_GAP_OFFSET=UTRIE2_INDEX_2_BMP_LENGTH,
    UNEWTRIE2_INDEX_GAP_LENGTH=
        ((UTRIE2_UTF8_2B_INDEX_2_LENGTH+UTRIE2_MAX_INDEX_1_LENGTH)+UTRIE2_INDEX_2_MASK)&
        ~UTRIE2_INDEX_2_MASK,
# 112 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_impl.h"
    UNEWTRIE2_MAX_INDEX_2_LENGTH=
        (0x110000>>UTRIE2_SHIFT_2)+
        UTRIE2_LSCP_INDEX_2_LENGTH+
        UNEWTRIE2_INDEX_GAP_LENGTH+
        UTRIE2_INDEX_2_BLOCK_LENGTH,

    UNEWTRIE2_INDEX_1_LENGTH=0x110000>>UTRIE2_SHIFT_1
};
# 142 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_impl.h"
struct UNewTrie2 {
    int32_t index1[UNEWTRIE2_INDEX_1_LENGTH];
    int32_t index2[UNEWTRIE2_MAX_INDEX_2_LENGTH];
    uint32_t *data;

    uint32_t initialValue, errorValue;
    int32_t index2Length, dataCapacity, dataLength;
    int32_t firstFreeBlock;
    int32_t index2NullOffset, dataNullOffset;
    UChar32 highStart;
    UBool isCompacted;
# 169 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_impl.h"
    int32_t map[(0x110000+0x40+0x40+0x400)>>UTRIE2_SHIFT_2];
};
# 33 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c" 2

# 1 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h" 1
# 23 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"

# 51 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
enum {

    UTRIE_SHIFT=5,


    UTRIE_DATA_BLOCK_LENGTH=1<<UTRIE_SHIFT,


    UTRIE_MASK=UTRIE_DATA_BLOCK_LENGTH-1,





    UTRIE_LEAD_INDEX_DISP=0x2800>>UTRIE_SHIFT,
# 74 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
    UTRIE_INDEX_SHIFT=2,


    UTRIE_DATA_GRANULARITY=1<<UTRIE_INDEX_SHIFT,


    UTRIE_SURROGATE_BLOCK_BITS=10-UTRIE_SHIFT,






    UTRIE_SURROGATE_BLOCK_COUNT=(1<<UTRIE_SURROGATE_BLOCK_BITS),


    UTRIE_BMP_INDEX_LENGTH=0x10000>>UTRIE_SHIFT
};
# 138 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
typedef int32_t
UTrieGetFoldingOffset(uint32_t data);
# 150 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
struct UTrie {
    const uint16_t *index;
    const uint32_t *data32;
# 164 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
    UTrieGetFoldingOffset *getFoldingOffset;

    int32_t indexLength, dataLength;
    uint32_t initialValue;
    UBool isLatin1Linear;
};
# 452 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
typedef uint32_t
UTrieEnumValue(const void *context, uint32_t value);
# 468 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
typedef UBool
UTrieEnumRange(const void *context, UChar32 start, UChar32 limit, uint32_t value);
# 487 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern void
utrie_enum_48(const UTrie *trie,
           UTrieEnumValue *enumValue, UTrieEnumRange *enumRange, const void *context);
# 502 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern int32_t
utrie_unserialize_48(UTrie *trie, const void *data, int32_t length, UErrorCode *pErrorCode);
# 525 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern int32_t
utrie_unserializeDummy_48(UTrie *trie,
                       void *data, int32_t length,
                       uint32_t initialValue, uint32_t leadUnitValue,
                       UBool make16BitTrie,
                       UErrorCode *pErrorCode);
# 541 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern int32_t
utrie_defaultGetFoldingOffset_48(uint32_t data);
# 551 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
struct UNewTrie {




    int32_t index[(0x110000>>UTRIE_SHIFT)];
    uint32_t *data;

    uint32_t leadUnitValue;
    int32_t indexLength, dataCapacity, dataLength;
    UBool isAllocated, isDataAllocated;
    UBool isLatin1Linear, isCompacted;





    int32_t map[(0x110000+UTRIE_DATA_BLOCK_LENGTH+0x400)>>UTRIE_SHIFT];
};

typedef struct UNewTrie UNewTrie;
# 591 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
typedef uint32_t
UNewTrieGetFoldedValue(UNewTrie *trie, UChar32 start, int32_t offset);
# 620 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern UNewTrie *
utrie_open_48(UNewTrie *fillIn,
           uint32_t *aliasData, int32_t maxDataLength,
           uint32_t initialValue, uint32_t leadUnitValue,
           UBool latin1Linear);
# 636 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern UNewTrie *
utrie_clone_48(UNewTrie *fillIn, const UNewTrie *other, uint32_t *aliasData, int32_t aliasDataLength);







extern void
utrie_close_48(UNewTrie *trie);
# 658 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern uint32_t *
utrie_getData_48(UNewTrie *trie, int32_t *pLength);
# 669 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern UBool
utrie_set32_48(UNewTrie *trie, UChar32 c, uint32_t value);
# 682 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern uint32_t
utrie_get32_48(UNewTrie *trie, UChar32 c, UBool *pInBlockZero);
# 697 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern UBool
utrie_setRange32_48(UNewTrie *trie, UChar32 start, UChar32 limit, uint32_t value, UBool overwrite);
# 726 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
extern int32_t
utrie_serialize_48(UNewTrie *trie, void *data, int32_t capacity,
                UNewTrieGetFoldedValue *getFoldedValue,
                UBool reduceTo16Bits,
                UErrorCode *pErrorCode);





extern int32_t
utrie_swap_48(const UDataSwapper *ds,
           const void *inData, int32_t length, void *outData,
           UErrorCode *pErrorCode);
# 751 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
typedef struct UTrieHeader {

    uint32_t signature;
# 762 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie.h"
    uint32_t options;


    int32_t indexLength;


    int32_t dataLength;
} UTrieHeader;





enum {

    UTRIE_OPTIONS_SHIFT_MASK=0xf,


    UTRIE_OPTIONS_INDEX_SHIFT=4,


    UTRIE_OPTIONS_DATA_IS_32_BIT=0x100,





    UTRIE_OPTIONS_LATIN1_IS_LINEAR=0x200
};


# 35 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c" 2
# 73 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
enum {

    UNEWTRIE2_INDEX_2_NULL_OFFSET=UNEWTRIE2_INDEX_GAP_OFFSET+UNEWTRIE2_INDEX_GAP_LENGTH,


    UNEWTRIE2_INDEX_2_START_OFFSET=UNEWTRIE2_INDEX_2_NULL_OFFSET+UTRIE2_INDEX_2_BLOCK_LENGTH,






    UNEWTRIE2_DATA_NULL_OFFSET=UTRIE2_DATA_START_OFFSET,


    UNEWTRIE2_DATA_START_OFFSET=UNEWTRIE2_DATA_NULL_OFFSET+0x40,







    UNEWTRIE2_DATA_0800_OFFSET=UNEWTRIE2_DATA_START_OFFSET+0x780
};







static int32_t
allocIndex2Block(UNewTrie2 *trie);

extern UTrie2 *
utrie2_open_48(uint32_t initialValue, uint32_t errorValue, UErrorCode *pErrorCode) {
    UTrie2 *trie;
    UNewTrie2 *newTrie;
    uint32_t *data;
    int32_t i, j;

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    }

    trie=(UTrie2 *)uprv_malloc_48(sizeof(UTrie2));
    newTrie=(UNewTrie2 *)uprv_malloc_48(sizeof(UNewTrie2));
    data=(uint32_t *)uprv_malloc_48(((int32_t)1<<14)*4);
    if(trie==((void *)0) || newTrie==((void *)0) || data==((void *)0)) {
        uprv_free_48(trie);
        uprv_free_48(newTrie);
        uprv_free_48(data);
        *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        return 0;
    }

    memset(trie, 0, sizeof(UTrie2));
    trie->initialValue=initialValue;
    trie->errorValue=errorValue;
    trie->highStart=0x110000;
    trie->newTrie=newTrie;

    newTrie->data=data;
    newTrie->dataCapacity=((int32_t)1<<14);
    newTrie->initialValue=initialValue;
    newTrie->errorValue=errorValue;
    newTrie->highStart=0x110000;
    newTrie->firstFreeBlock=0;
    newTrie->isCompacted=0;







    for(i=0; i<0x80; ++i) {
        newTrie->data[i]=initialValue;
    }
    for(; i<0xc0; ++i) {
        newTrie->data[i]=errorValue;
    }
    for(i=UNEWTRIE2_DATA_NULL_OFFSET; i<UNEWTRIE2_DATA_START_OFFSET; ++i) {
        newTrie->data[i]=initialValue;
    }
    newTrie->dataNullOffset=UNEWTRIE2_DATA_NULL_OFFSET;
    newTrie->dataLength=UNEWTRIE2_DATA_START_OFFSET;


    for(i=0, j=0; j<0x80; ++i, j+=UTRIE2_DATA_BLOCK_LENGTH) {
        newTrie->index2[i]=j;
        newTrie->map[i]=1;
    }

    for(; j<0xc0; ++i, j+=UTRIE2_DATA_BLOCK_LENGTH) {
        newTrie->map[i]=0;
    }






    newTrie->map[i++]=
        (0x110000>>UTRIE2_SHIFT_2)-
        (0x80>>UTRIE2_SHIFT_2)+
        1+
        UTRIE2_LSCP_INDEX_2_LENGTH;
    j+=UTRIE2_DATA_BLOCK_LENGTH;
    for(; j<UNEWTRIE2_DATA_START_OFFSET; ++i, j+=UTRIE2_DATA_BLOCK_LENGTH) {
        newTrie->map[i]=0;
    }





    for(i=0x80>>UTRIE2_SHIFT_2; i<UTRIE2_INDEX_2_BMP_LENGTH; ++i) {
        newTrie->index2[i]=UNEWTRIE2_DATA_NULL_OFFSET;
    }





    for(i=0; i<UNEWTRIE2_INDEX_GAP_LENGTH; ++i) {
        newTrie->index2[UNEWTRIE2_INDEX_GAP_OFFSET+i]=-1;
    }


    for(i=0; i<UTRIE2_INDEX_2_BLOCK_LENGTH; ++i) {
        newTrie->index2[UNEWTRIE2_INDEX_2_NULL_OFFSET+i]=UNEWTRIE2_DATA_NULL_OFFSET;
    }
    newTrie->index2NullOffset=UNEWTRIE2_INDEX_2_NULL_OFFSET;
    newTrie->index2Length=UNEWTRIE2_INDEX_2_START_OFFSET;


    for(i=0, j=0;
        i<UTRIE2_OMITTED_BMP_INDEX_1_LENGTH;
        ++i, j+=UTRIE2_INDEX_2_BLOCK_LENGTH
    ) {
        newTrie->index1[i]=j;
    }


    for(; i<UNEWTRIE2_INDEX_1_LENGTH; ++i) {
        newTrie->index1[i]=UNEWTRIE2_INDEX_2_NULL_OFFSET;
    }






    for(i=0x80; i<0x800; i+=UTRIE2_DATA_BLOCK_LENGTH) {
        utrie2_set32_48(trie, i, initialValue, pErrorCode);
    }

    return trie;
}

static UNewTrie2 *
cloneBuilder(const UNewTrie2 *other) {
    UNewTrie2 *trie;

    trie=(UNewTrie2 *)uprv_malloc_48(sizeof(UNewTrie2));
    if(trie==((void *)0)) {
        return ((void *)0);
    }

    trie->data=(uint32_t *)uprv_malloc_48(other->dataCapacity*4);
    if(trie->data==((void *)0)) {
        uprv_free_48(trie);
        return ((void *)0);
    }
    trie->dataCapacity=other->dataCapacity;


    memcpy(trie->index1, other->index1, sizeof(trie->index1));
    memcpy(trie->index2, other->index2, other->index2Length*4);
    trie->index2NullOffset=other->index2NullOffset;
    trie->index2Length=other->index2Length;

    memcpy(trie->data, other->data, other->dataLength*4);
    trie->dataNullOffset=other->dataNullOffset;
    trie->dataLength=other->dataLength;


    if(other->isCompacted) {
        trie->firstFreeBlock=0;
    } else {
        memcpy(trie->map, other->map, (other->dataLength>>UTRIE2_SHIFT_2)*4);
        trie->firstFreeBlock=other->firstFreeBlock;
    }

    trie->initialValue=other->initialValue;
    trie->errorValue=other->errorValue;
    trie->highStart=other->highStart;
    trie->isCompacted=other->isCompacted;

    return trie;
}

extern UTrie2 *
utrie2_clone_48(const UTrie2 *other, UErrorCode *pErrorCode) {
    UTrie2 *trie;

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    }
    if(other==((void *)0) || (other->memory==((void *)0) && other->newTrie==((void *)0))) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return ((void *)0);
    }

    trie=(UTrie2 *)uprv_malloc_48(sizeof(UTrie2));
    if(trie==((void *)0)) {
        return ((void *)0);
    }
    memcpy(trie, other, sizeof(UTrie2));

    if(other->memory!=((void *)0)) {
        trie->memory=uprv_malloc_48(other->length);
        if(trie->memory!=((void *)0)) {
            trie->isMemoryOwned=1;
            memcpy(trie->memory, other->memory, other->length);


            trie->index=(uint16_t *)trie->memory+(other->index-(uint16_t *)other->memory);
            if(other->data16!=((void *)0)) {
                trie->data16=(uint16_t *)trie->memory+(other->data16-(uint16_t *)other->memory);
            }
            if(other->data32!=((void *)0)) {
                trie->data32=(uint32_t *)trie->memory+(other->data32-(uint32_t *)other->memory);
            }
        }
    } else {
        trie->newTrie=cloneBuilder(other->newTrie);
    }

    if(trie->memory==((void *)0) && trie->newTrie==((void *)0)) {
        uprv_free_48(trie);
        trie=((void *)0);
    }
    return trie;
}

typedef struct NewTrieAndStatus {
    UTrie2 *trie;
    UErrorCode errorCode;
    UBool exclusiveLimit;
} NewTrieAndStatus;

static UBool
copyEnumRange(const void *context, UChar32 start, UChar32 end, uint32_t value) {
    NewTrieAndStatus *nt=(NewTrieAndStatus *)context;
    if(value!=nt->trie->initialValue) {
        if(nt->exclusiveLimit) {
            --end;
        }
        if(start==end) {
            utrie2_set32_48(nt->trie, start, value, &nt->errorCode);
        } else {
            utrie2_setRange32_48(nt->trie, start, end, value, 1, &nt->errorCode);
        }
        return ((nt->errorCode)<=U_ZERO_ERROR);
    } else {
        return 1;
    }
}
# 365 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
extern UTrie2 *
utrie2_cloneAsThawed_48(const UTrie2 *other, UErrorCode *pErrorCode) {
    NewTrieAndStatus context;
    UChar lead;

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    }
    if(other==((void *)0) || (other->memory==((void *)0) && other->newTrie==((void *)0))) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return ((void *)0);
    }
    if(other->newTrie!=((void *)0) && !other->newTrie->isCompacted) {
        return utrie2_clone_48(other, pErrorCode);
    }


    context.trie=utrie2_open_48(other->initialValue, other->errorValue, pErrorCode);
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    }
    context.exclusiveLimit=0;
    context.errorCode=*pErrorCode;
    utrie2_enum_48(other, ((void *)0), copyEnumRange, &context);
    *pErrorCode=context.errorCode;
    for(lead=0xd800; lead<0xdc00; ++lead) {
        uint32_t value;
        if(other->data32==((void *)0)) {
            value=((other))->index[(((int32_t)((((other))->index)[(0)+((lead)>>UTRIE2_SHIFT_2)]) <<UTRIE2_INDEX_SHIFT)+ ((lead)&UTRIE2_DATA_MASK))];
        } else {
            value=((other))->data32[(((int32_t)((((other))->index)[(0)+((lead)>>UTRIE2_SHIFT_2)]) <<UTRIE2_INDEX_SHIFT)+ ((lead)&UTRIE2_DATA_MASK))];
        }
        if(value!=other->initialValue) {
            utrie2_set32ForLeadSurrogateCodeUnit_48(context.trie, lead, value, pErrorCode);
        }
    }
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        utrie2_close_48(context.trie);
        context.trie=((void *)0);
    }
    return context.trie;
}


extern UTrie2 *
utrie2_fromUTrie_48(const UTrie *trie1, uint32_t errorValue, UErrorCode *pErrorCode) {
    NewTrieAndStatus context;
    UChar lead;

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    }
    if(trie1==((void *)0)) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return ((void *)0);
    }
    context.trie=utrie2_open_48(trie1->initialValue, errorValue, pErrorCode);
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return ((void *)0);
    }
    context.exclusiveLimit=1;
    context.errorCode=*pErrorCode;
    utrie_enum_48(trie1, ((void *)0), copyEnumRange, &context);
    *pErrorCode=context.errorCode;
    for(lead=0xd800; lead<0xdc00; ++lead) {
        uint32_t value;
        if(trie1->data32==((void *)0)) {
            value=(trie1)->index[ ((int32_t)((trie1)->index[(0)+((lead)>>UTRIE_SHIFT)])<<UTRIE_INDEX_SHIFT)+ ((lead)&UTRIE_MASK) ];
        } else {
            value=(trie1)->data32[ ((int32_t)((trie1)->index[(0)+((lead)>>UTRIE_SHIFT)])<<UTRIE_INDEX_SHIFT)+ ((lead)&UTRIE_MASK) ];
        }
        if(value!=trie1->initialValue) {
            utrie2_set32ForLeadSurrogateCodeUnit_48(context.trie, lead, value, pErrorCode);
        }
    }
    if(((*pErrorCode)<=U_ZERO_ERROR)) {
        utrie2_freeze_48(context.trie,
                      trie1->data32!=((void *)0) ? UTRIE2_32_VALUE_BITS : UTRIE2_16_VALUE_BITS,
                      pErrorCode);
    }






    if(((*pErrorCode)>U_ZERO_ERROR)) {
        utrie2_close_48(context.trie);
        context.trie=((void *)0);
    }
    return context.trie;
}

static __inline UBool
isInNullBlock(UNewTrie2 *trie, UChar32 c, UBool forLSCP) {
    int32_t i2, block;

    if((((c)&0xfffffc00)==0xd800) && forLSCP) {
        i2=(UTRIE2_LSCP_INDEX_2_OFFSET-(0xd800>>UTRIE2_SHIFT_2))+
            (c>>UTRIE2_SHIFT_2);
    } else {
        i2=trie->index1[c>>UTRIE2_SHIFT_1]+
            ((c>>UTRIE2_SHIFT_2)&UTRIE2_INDEX_2_MASK);
    }
    block=trie->index2[i2];
    return (UBool)(block==trie->dataNullOffset);
}

static int32_t
allocIndex2Block(UNewTrie2 *trie) {
    int32_t newBlock, newTop;

    newBlock=trie->index2Length;
    newTop=newBlock+UTRIE2_INDEX_2_BLOCK_LENGTH;
    if(newTop>(int32_t)(sizeof(trie->index2)/sizeof((trie->index2)[0]))) {





        return -1;
    }
    trie->index2Length=newTop;
    memcpy(trie->index2+newBlock, trie->index2+trie->index2NullOffset, UTRIE2_INDEX_2_BLOCK_LENGTH*4);
    return newBlock;
}

static int32_t
getIndex2Block(UNewTrie2 *trie, UChar32 c, UBool forLSCP) {
    int32_t i1, i2;

    if((((c)&0xfffffc00)==0xd800) && forLSCP) {
        return UTRIE2_LSCP_INDEX_2_OFFSET;
    }

    i1=c>>UTRIE2_SHIFT_1;
    i2=trie->index1[i1];
    if(i2==trie->index2NullOffset) {
        i2=allocIndex2Block(trie);
        if(i2<0) {
            return -1;
        }
        trie->index1[i1]=i2;
    }
    return i2;
}

static int32_t
allocDataBlock(UNewTrie2 *trie, int32_t copyBlock) {
    int32_t newBlock, newTop;

    if(trie->firstFreeBlock!=0) {

        newBlock=trie->firstFreeBlock;
        trie->firstFreeBlock=-trie->map[newBlock>>UTRIE2_SHIFT_2];
    } else {

        newBlock=trie->dataLength;
        newTop=newBlock+UTRIE2_DATA_BLOCK_LENGTH;
        if(newTop>trie->dataCapacity) {

            int32_t capacity;
            uint32_t *data;

            if(trie->dataCapacity<((int32_t)1<<17)) {
                capacity=((int32_t)1<<17);
            } else if(trie->dataCapacity<(0x110000+0x40+0x40+0x400)) {
                capacity=(0x110000+0x40+0x40+0x400);
            } else {





                return -1;
            }
            data=(uint32_t *)uprv_malloc_48(capacity*4);
            if(data==((void *)0)) {
                return -1;
            }
            memcpy(data, trie->data, trie->dataLength*4);
            uprv_free_48(trie->data);
            trie->data=data;
            trie->dataCapacity=capacity;
        }
        trie->dataLength=newTop;
    }
    memcpy(trie->data+newBlock, trie->data+copyBlock, UTRIE2_DATA_BLOCK_LENGTH*4);
    trie->map[newBlock>>UTRIE2_SHIFT_2]=0;
    return newBlock;
}


static void
releaseDataBlock(UNewTrie2 *trie, int32_t block) {

    trie->map[block>>UTRIE2_SHIFT_2]=-trie->firstFreeBlock;
    trie->firstFreeBlock=block;
}

static __inline UBool
isWritableBlock(UNewTrie2 *trie, int32_t block) {
    return (UBool)(block!=trie->dataNullOffset && 1==trie->map[block>>UTRIE2_SHIFT_2]);
}

static __inline void
setIndex2Entry(UNewTrie2 *trie, int32_t i2, int32_t block) {
    int32_t oldBlock;
    ++trie->map[block>>UTRIE2_SHIFT_2];
    oldBlock=trie->index2[i2];
    if(0 == --trie->map[oldBlock>>UTRIE2_SHIFT_2]) {
        releaseDataBlock(trie, oldBlock);
    }
    trie->index2[i2]=block;
}







static int32_t
getDataBlock(UNewTrie2 *trie, UChar32 c, UBool forLSCP) {
    int32_t i2, oldBlock, newBlock;

    i2=getIndex2Block(trie, c, forLSCP);
    if(i2<0) {
        return -1;
    }

    i2+=(c>>UTRIE2_SHIFT_2)&UTRIE2_INDEX_2_MASK;
    oldBlock=trie->index2[i2];
    if(isWritableBlock(trie, oldBlock)) {
        return oldBlock;
    }


    newBlock=allocDataBlock(trie, oldBlock);
    if(newBlock<0) {

        return -1;
    }
    setIndex2Entry(trie, i2, newBlock);
    return newBlock;
}




static void
set32(UNewTrie2 *trie,
      UChar32 c, UBool forLSCP, uint32_t value,
      UErrorCode *pErrorCode) {
    int32_t block;

    if(trie==((void *)0) || trie->isCompacted) {
        *pErrorCode=U_NO_WRITE_PERMISSION;
        return;
    }

    block=getDataBlock(trie, c, forLSCP);
    if(block<0) {
        *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        return;
    }

    trie->data[block+(c&UTRIE2_DATA_MASK)]=value;
}

extern void
utrie2_set32_48(UTrie2 *trie, UChar32 c, uint32_t value, UErrorCode *pErrorCode) {
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return;
    }
    if((uint32_t)c>0x10ffff) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }
    set32(trie->newTrie, c, 1, value, pErrorCode);
}

extern void
utrie2_set32ForLeadSurrogateCodeUnit_48(UTrie2 *trie,
                                     UChar32 c, uint32_t value,
                                     UErrorCode *pErrorCode) {
    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return;
    }
    if(!(((c)&0xfffffc00)==0xd800)) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }
    set32(trie->newTrie, c, 0, value, pErrorCode);
}

static void
writeBlock(uint32_t *block, uint32_t value) {
    uint32_t *limit=block+UTRIE2_DATA_BLOCK_LENGTH;
    while(block<limit) {
        *block++=value;
    }
}





static void
fillBlock(uint32_t *block, UChar32 start, UChar32 limit,
          uint32_t value, uint32_t initialValue, UBool overwrite) {
    uint32_t *pLimit;

    pLimit=block+limit;
    block+=start;
    if(overwrite) {
        while(block<pLimit) {
            *block++=value;
        }
    } else {
        while(block<pLimit) {
            if(*block==initialValue) {
                *block=value;
            }
            ++block;
        }
    }
}

extern void
utrie2_setRange32_48(UTrie2 *trie,
                  UChar32 start, UChar32 end,
                  uint32_t value, UBool overwrite,
                  UErrorCode *pErrorCode) {





    UNewTrie2 *newTrie;
    int32_t block, rest, repeatBlock;
    UChar32 limit;

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return;
    }
    if((uint32_t)start>0x10ffff || (uint32_t)end>0x10ffff || start>end) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }
    newTrie=trie->newTrie;
    if(newTrie==((void *)0) || newTrie->isCompacted) {
        *pErrorCode=U_NO_WRITE_PERMISSION;
        return;
    }
    if(!overwrite && value==newTrie->initialValue) {
        return;
    }

    limit=end+1;
    if(start&UTRIE2_DATA_MASK) {
        UChar32 nextStart;


        block=getDataBlock(newTrie, start, 1);
        if(block<0) {
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
            return;
        }

        nextStart=(start+UTRIE2_DATA_BLOCK_LENGTH)&~UTRIE2_DATA_MASK;
        if(nextStart<=limit) {
            fillBlock(newTrie->data+block, start&UTRIE2_DATA_MASK, UTRIE2_DATA_BLOCK_LENGTH,
                      value, newTrie->initialValue, overwrite);
            start=nextStart;
        } else {
            fillBlock(newTrie->data+block, start&UTRIE2_DATA_MASK, limit&UTRIE2_DATA_MASK,
                      value, newTrie->initialValue, overwrite);
            return;
        }
    }


    rest=limit&UTRIE2_DATA_MASK;


    limit&=~UTRIE2_DATA_MASK;


    if(value==newTrie->initialValue) {
        repeatBlock=newTrie->dataNullOffset;
    } else {
        repeatBlock=-1;
    }

    while(start<limit) {
        int32_t i2;
        UBool setRepeatBlock=0;

        if(value==newTrie->initialValue && isInNullBlock(newTrie, start, 1)) {
            start+=UTRIE2_DATA_BLOCK_LENGTH;
            continue;
        }


        i2=getIndex2Block(newTrie, start, 1);
        if(i2<0) {
            *pErrorCode=U_INTERNAL_PROGRAM_ERROR;
            return;
        }
        i2+=(start>>UTRIE2_SHIFT_2)&UTRIE2_INDEX_2_MASK;
        block=newTrie->index2[i2];
        if(isWritableBlock(newTrie, block)) {

            if(overwrite && block>=UNEWTRIE2_DATA_0800_OFFSET) {





                setRepeatBlock=1;
            } else {

                fillBlock(newTrie->data+block,
                          0, UTRIE2_DATA_BLOCK_LENGTH,
                          value, newTrie->initialValue, overwrite);
            }
        } else if(newTrie->data[block]!=value && (overwrite || block==newTrie->dataNullOffset)) {
# 809 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
            setRepeatBlock=1;
        }
        if(setRepeatBlock) {
            if(repeatBlock>=0) {
                setIndex2Entry(newTrie, i2, repeatBlock);
            } else {

                repeatBlock=getDataBlock(newTrie, start, 1);
                if(repeatBlock<0) {
                    *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
                    return;
                }
                writeBlock(newTrie->data+repeatBlock, value);
            }
        }

        start+=UTRIE2_DATA_BLOCK_LENGTH;
    }

    if(rest>0) {

        block=getDataBlock(newTrie, start, 1);
        if(block<0) {
            *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
            return;
        }

        fillBlock(newTrie->data+block, 0, rest, value, newTrie->initialValue, overwrite);
    }

    return;
}



static __inline UBool
equal_int32(const int32_t *s, const int32_t *t, int32_t length) {
    while(length>0 && *s==*t) {
        ++s;
        ++t;
        --length;
    }
    return (UBool)(length==0);
}

static __inline UBool
equal_uint32(const uint32_t *s, const uint32_t *t, int32_t length) {
    while(length>0 && *s==*t) {
        ++s;
        ++t;
        --length;
    }
    return (UBool)(length==0);
}

static int32_t
findSameIndex2Block(const int32_t *idx, int32_t index2Length, int32_t otherBlock) {
    int32_t block;


    index2Length-=UTRIE2_INDEX_2_BLOCK_LENGTH;

    for(block=0; block<=index2Length; ++block) {
        if(equal_int32(idx+block, idx+otherBlock, UTRIE2_INDEX_2_BLOCK_LENGTH)) {
            return block;
        }
    }
    return -1;
}

static int32_t
findSameDataBlock(const uint32_t *data, int32_t dataLength, int32_t otherBlock, int32_t blockLength) {
    int32_t block;


    dataLength-=blockLength;

    for(block=0; block<=dataLength; block+=UTRIE2_DATA_GRANULARITY) {
        if(equal_uint32(data+block, data+otherBlock, blockLength)) {
            return block;
        }
    }
    return -1;
}





static UChar32
findHighStart(UNewTrie2 *trie, uint32_t highValue) {
    const uint32_t *data32;

    uint32_t value, initialValue;
    UChar32 c, prev;
    int32_t i1, i2, j, i2Block, prevI2Block, index2NullOffset, block, prevBlock, nullBlock;

    data32=trie->data;
    initialValue=trie->initialValue;

    index2NullOffset=trie->index2NullOffset;
    nullBlock=trie->dataNullOffset;


    if(highValue==initialValue) {
        prevI2Block=index2NullOffset;
        prevBlock=nullBlock;
    } else {
        prevI2Block=-1;
        prevBlock=-1;
    }
    prev=0x110000;


    i1=UNEWTRIE2_INDEX_1_LENGTH;
    c=prev;
    while(c>0) {
        i2Block=trie->index1[--i1];
        if(i2Block==prevI2Block) {

            c-=UTRIE2_CP_PER_INDEX_1_ENTRY;
            continue;
        }
        prevI2Block=i2Block;
        if(i2Block==index2NullOffset) {

            if(highValue!=initialValue) {
                return c;
            }
            c-=UTRIE2_CP_PER_INDEX_1_ENTRY;
        } else {

            for(i2=UTRIE2_INDEX_2_BLOCK_LENGTH; i2>0;) {
                block=trie->index2[i2Block+ --i2];
                if(block==prevBlock) {

                    c-=UTRIE2_DATA_BLOCK_LENGTH;
                    continue;
                }
                prevBlock=block;
                if(block==nullBlock) {

                    if(highValue!=initialValue) {
                        return c;
                    }
                    c-=UTRIE2_DATA_BLOCK_LENGTH;
                } else {
                    for(j=UTRIE2_DATA_BLOCK_LENGTH; j>0;) {
                        value=data32[block+ --j];
                        if(value!=highValue) {
                            return c;
                        }
                        --c;
                    }
                }
            }
        }
    }


    return 0;
}
# 984 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
static void
compactData(UNewTrie2 *trie) {
    int32_t start, newStart, movedStart;
    int32_t blockLength, overlap;
    int32_t i, mapIndex, blockCount;


    newStart=UTRIE2_DATA_START_OFFSET;
    for(start=0, i=0; start<newStart; start+=UTRIE2_DATA_BLOCK_LENGTH, ++i) {
        trie->map[i]=start;
    }





    blockLength=64;
    blockCount=blockLength>>UTRIE2_SHIFT_2;
    for(start=newStart; start<trie->dataLength;) {





        if(start==UNEWTRIE2_DATA_0800_OFFSET) {
            blockLength=UTRIE2_DATA_BLOCK_LENGTH;
            blockCount=1;
        }


        if(trie->map[start>>UTRIE2_SHIFT_2]<=0) {

            start+=blockLength;


            continue;
        }


        if( (movedStart=findSameDataBlock(trie->data, newStart, start, blockLength))
             >=0
        ) {

            for(i=blockCount, mapIndex=start>>UTRIE2_SHIFT_2; i>0; --i) {
                trie->map[mapIndex++]=movedStart;
                movedStart+=UTRIE2_DATA_BLOCK_LENGTH;
            }


            start+=blockLength;


            continue;
        }



        for(overlap=blockLength-UTRIE2_DATA_GRANULARITY;
            overlap>0 && !equal_uint32(trie->data+(newStart-overlap), trie->data+start, overlap);
            overlap-=UTRIE2_DATA_GRANULARITY) {}

        if(overlap>0 || newStart<start) {

            movedStart=newStart-overlap;
            for(i=blockCount, mapIndex=start>>UTRIE2_SHIFT_2; i>0; --i) {
                trie->map[mapIndex++]=movedStart;
                movedStart+=UTRIE2_DATA_BLOCK_LENGTH;
            }


            start+=overlap;
            for(i=blockLength-overlap; i>0; --i) {
                trie->data[newStart++]=trie->data[start++];
            }
        } else {
            for(i=blockCount, mapIndex=start>>UTRIE2_SHIFT_2; i>0; --i) {
                trie->map[mapIndex++]=start;
                start+=UTRIE2_DATA_BLOCK_LENGTH;
            }
            newStart=start;
        }
    }


    for(i=0; i<trie->index2Length; ++i) {
        if(i==UNEWTRIE2_INDEX_GAP_OFFSET) {

            i+=UNEWTRIE2_INDEX_GAP_LENGTH;
        }
        trie->index2[i]=trie->map[trie->index2[i]>>UTRIE2_SHIFT_2];
    }
    trie->dataNullOffset=trie->map[trie->dataNullOffset>>UTRIE2_SHIFT_2];


    while((newStart&(UTRIE2_DATA_GRANULARITY-1))!=0) {
        trie->data[newStart++]=trie->initialValue;
    }







    trie->dataLength=newStart;
}

static void
compactIndex2(UNewTrie2 *trie) {
    int32_t i, start, newStart, movedStart, overlap;


    newStart=UTRIE2_INDEX_2_BMP_LENGTH;
    for(start=0, i=0; start<newStart; start+=UTRIE2_INDEX_2_BLOCK_LENGTH, ++i) {
        trie->map[i]=start;
    }


    newStart+=UTRIE2_UTF8_2B_INDEX_2_LENGTH+((trie->highStart-0x10000)>>UTRIE2_SHIFT_1);

    for(start=UNEWTRIE2_INDEX_2_NULL_OFFSET; start<trie->index2Length;) {







        if( (movedStart=findSameIndex2Block(trie->index2, newStart, start))
             >=0
        ) {

            trie->map[start>>UTRIE2_SHIFT_1_2]=movedStart;


            start+=UTRIE2_INDEX_2_BLOCK_LENGTH;


            continue;
        }



        for(overlap=UTRIE2_INDEX_2_BLOCK_LENGTH-1;
            overlap>0 && !equal_int32(trie->index2+(newStart-overlap), trie->index2+start, overlap);
            --overlap) {}

        if(overlap>0 || newStart<start) {

            trie->map[start>>UTRIE2_SHIFT_1_2]=newStart-overlap;


            start+=overlap;
            for(i=UTRIE2_INDEX_2_BLOCK_LENGTH-overlap; i>0; --i) {
                trie->index2[newStart++]=trie->index2[start++];
            }
        } else {
            trie->map[start>>UTRIE2_SHIFT_1_2]=start;
            start+=UTRIE2_INDEX_2_BLOCK_LENGTH;
            newStart=start;
        }
    }


    for(i=0; i<UNEWTRIE2_INDEX_1_LENGTH; ++i) {
        trie->index1[i]=trie->map[trie->index1[i]>>UTRIE2_SHIFT_1_2];
    }
    trie->index2NullOffset=trie->map[trie->index2NullOffset>>UTRIE2_SHIFT_1_2];







    while((newStart&((UTRIE2_DATA_GRANULARITY-1)|1))!=0) {

        trie->index2[newStart++]=(int32_t)0xffff<<UTRIE2_INDEX_SHIFT;
    }







    trie->index2Length=newStart;
}

static void
compactTrie(UTrie2 *trie, UErrorCode *pErrorCode) {
    UNewTrie2 *newTrie;
    UChar32 highStart, suppHighStart;
    uint32_t highValue;

    newTrie=trie->newTrie;


    highValue=utrie2_get32_48(trie, 0x10ffff);
    highStart=findHighStart(newTrie, highValue);
    highStart=(highStart+(UTRIE2_CP_PER_INDEX_1_ENTRY-1))&~(UTRIE2_CP_PER_INDEX_1_ENTRY-1);
    if(highStart==0x110000) {
        highValue=trie->errorValue;
    }





    trie->highStart=newTrie->highStart=highStart;






    if(highStart<0x110000) {

        suppHighStart= highStart<=0x10000 ? 0x10000 : highStart;
        utrie2_setRange32_48(trie, suppHighStart, 0x10ffff, trie->initialValue, 1, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            return;
        }
    }

    compactData(newTrie);
    if(highStart>0x10000) {
        compactIndex2(newTrie);





    }






    newTrie->data[newTrie->dataLength++]=highValue;
    while((newTrie->dataLength&(UTRIE2_DATA_GRANULARITY-1))!=0) {
        newTrie->data[newTrie->dataLength++]=trie->initialValue;
    }

    newTrie->isCompacted=1;
}
# 1250 "c:/users/will/documents/utterspeech/marmalade/icu/common/source/utrie2_builder.c"
extern void
utrie2_freeze_48(UTrie2 *trie, UTrie2ValueBits valueBits, UErrorCode *pErrorCode) {
    UNewTrie2 *newTrie;
    UTrie2Header *header;
    uint32_t *p;
    uint16_t *dest16;
    int32_t i, length;
    int32_t allIndexesLength;
    int32_t dataMove;
    UChar32 highStart;


    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return;
    }
    if( trie==((void *)0) ||
        valueBits<0 || UTRIE2_COUNT_VALUE_BITS<=valueBits
    ) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }
    newTrie=trie->newTrie;
    if(newTrie==((void *)0)) {

        UTrie2ValueBits frozenValueBits=
            trie->data16!=((void *)0) ? UTRIE2_16_VALUE_BITS : UTRIE2_32_VALUE_BITS;
        if(valueBits!=frozenValueBits) {
            *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        }
        return;
    }


    if(!newTrie->isCompacted) {
        compactTrie(trie, pErrorCode);
        if(((*pErrorCode)>U_ZERO_ERROR)) {
            return;
        }
    }
    highStart=trie->highStart;

    if(highStart<=0x10000) {
        allIndexesLength=UTRIE2_INDEX_1_OFFSET;
    } else {
        allIndexesLength=newTrie->index2Length;
    }
    if(valueBits==UTRIE2_16_VALUE_BITS) {
        dataMove=allIndexesLength;
    } else {
        dataMove=0;
    }


    if(
        allIndexesLength>0xffff ||

        (dataMove+newTrie->dataNullOffset)>0xffff ||

        (dataMove+UNEWTRIE2_DATA_0800_OFFSET)>0xffff ||

        (dataMove+newTrie->dataLength)>(0xffff<<UTRIE2_INDEX_SHIFT)
    ) {
        *pErrorCode=U_INDEX_OUTOFBOUNDS_ERROR;
        return;
    }


    length=sizeof(UTrie2Header)+allIndexesLength*2;
    if(valueBits==UTRIE2_16_VALUE_BITS) {
        length+=newTrie->dataLength*2;
    } else {
        length+=newTrie->dataLength*4;
    }

    trie->memory=uprv_malloc_48(length);
    if(trie->memory==((void *)0)) {
        *pErrorCode=U_MEMORY_ALLOCATION_ERROR;
        return;
    }
    trie->length=length;
    trie->isMemoryOwned=1;

    trie->indexLength=allIndexesLength;
    trie->dataLength=newTrie->dataLength;
    if(highStart<=0x10000) {
        trie->index2NullOffset=0xffff;
    } else {
        trie->index2NullOffset=UTRIE2_INDEX_2_OFFSET+newTrie->index2NullOffset;
    }
    trie->dataNullOffset=(uint16_t)(dataMove+newTrie->dataNullOffset);
    trie->highValueIndex=dataMove+trie->dataLength-UTRIE2_DATA_GRANULARITY;


    header=(UTrie2Header *)trie->memory;

    header->signature=0x54726932;
    header->options=(uint16_t)valueBits;

    header->indexLength=(uint16_t)trie->indexLength;
    header->shiftedDataLength=(uint16_t)(trie->dataLength>>UTRIE2_INDEX_SHIFT);
    header->index2NullOffset=trie->index2NullOffset;
    header->dataNullOffset=trie->dataNullOffset;
    header->shiftedHighStart=(uint16_t)(highStart>>UTRIE2_SHIFT_1);


    dest16=(uint16_t *)(header+1);
    trie->index=dest16;


    p=(uint32_t *)newTrie->index2;
    for(i=UTRIE2_INDEX_2_BMP_LENGTH; i>0; --i) {
        *dest16++=(uint16_t)((dataMove + *p++)>>UTRIE2_INDEX_SHIFT);
    }


    for(i=0; i<(0xc2-0xc0); ++i) {
        *dest16++=(uint16_t)(dataMove+UTRIE2_BAD_UTF8_DATA_OFFSET);
    }
    for(; i<(0xe0-0xc0); ++i) {
        *dest16++=(uint16_t)(dataMove+newTrie->index2[i<<(6-UTRIE2_SHIFT_2)]);
    }

    if(highStart>0x10000) {
        int32_t index1Length=(highStart-0x10000)>>UTRIE2_SHIFT_1;
        int32_t index2Offset=UTRIE2_INDEX_2_BMP_LENGTH+UTRIE2_UTF8_2B_INDEX_2_LENGTH+index1Length;


        p=(uint32_t *)newTrie->index1+UTRIE2_OMITTED_BMP_INDEX_1_LENGTH;
        for(i=index1Length; i>0; --i) {
            *dest16++=(uint16_t)(UTRIE2_INDEX_2_OFFSET + *p++);
        }





        p=(uint32_t *)newTrie->index2+index2Offset;
        for(i=newTrie->index2Length-index2Offset; i>0; --i) {
            *dest16++=(uint16_t)((dataMove + *p++)>>UTRIE2_INDEX_SHIFT);
        }
    }


    switch(valueBits) {
    case UTRIE2_16_VALUE_BITS:

        trie->data16=dest16;
        trie->data32=((void *)0);
        p=newTrie->data;
        for(i=newTrie->dataLength; i>0; --i) {
            *dest16++=(uint16_t)*p++;
        }
        break;
    case UTRIE2_32_VALUE_BITS:

        trie->data16=((void *)0);
        trie->data32=(uint32_t *)dest16;
        memcpy(dest16, newTrie->data, newTrie->dataLength*4);
        break;
    default:
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return;
    }


    uprv_free_48(newTrie->data);
    uprv_free_48(newTrie);
    trie->newTrie=((void *)0);
}

extern UBool
utrie2_isFrozen_48(const UTrie2 *trie) {
    return (UBool)(trie->newTrie==((void *)0));
}

extern int32_t
utrie2_serialize_48(UTrie2 *trie,
                 void *data, int32_t capacity,
                 UErrorCode *pErrorCode) {

    if(((*pErrorCode)>U_ZERO_ERROR)) {
        return 0;
    }

    if( trie==((void *)0) || trie->memory==((void *)0) || trie->newTrie!=((void *)0) ||
        capacity<0 || (capacity>0 && (data==((void *)0) || ((((ptrdiff_t)(char *)(data)) & (3))!=0)))
    ) {
        *pErrorCode=U_ILLEGAL_ARGUMENT_ERROR;
        return 0;
    }

    if(capacity>=trie->length) {
        memcpy(data, trie->memory, trie->length);
    } else {
        *pErrorCode=U_BUFFER_OVERFLOW_ERROR;
    }
    return trie->length;
}






extern int32_t
utrie2_swapAnyVersion_48(const UDataSwapper *ds,
                      const void *inData, int32_t length, void *outData,
                      UErrorCode *pErrorCode) {
    if(((*pErrorCode)<=U_ZERO_ERROR)) {
        switch(utrie2_getVersion_48(inData, length, 1)) {
        case 1:
            return utrie_swap_48(ds, inData, length, outData, pErrorCode);
        case 2:
            return utrie2_swap_48(ds, inData, length, outData, pErrorCode);
        default:
            *pErrorCode=U_INVALID_FORMAT_ERROR;
            return 0;
        }
    }
    return 0;
}
