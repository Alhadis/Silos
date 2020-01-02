# 1 "../system/src/cortexm/exception_handlers.c"
# 1 "/Users/ganghyeontae/eclipse-workspace/CryptOptimization/optimized//"
# 1 "<built-in>"
#define __STDC__ 1
#define __STDC_VERSION__ 201112L
#define __STDC_UTF_16__ 1
#define __STDC_UTF_32__ 1
#define __STDC_HOSTED__ 1
#define __GNUC__ 7
#define __GNUC_MINOR__ 3
#define __GNUC_PATCHLEVEL__ 1
#define __VERSION__ "7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
#define __ATOMIC_RELAXED 0
#define __ATOMIC_SEQ_CST 5
#define __ATOMIC_ACQUIRE 2
#define __ATOMIC_RELEASE 3
#define __ATOMIC_ACQ_REL 4
#define __ATOMIC_CONSUME 1
#define __OPTIMIZE__ 1
#define __FINITE_MATH_ONLY__ 0
#define __SIZEOF_INT__ 4
#define __SIZEOF_LONG__ 4
#define __SIZEOF_LONG_LONG__ 8
#define __SIZEOF_SHORT__ 2
#define __SIZEOF_FLOAT__ 4
#define __SIZEOF_DOUBLE__ 8
#define __SIZEOF_LONG_DOUBLE__ 8
#define __SIZEOF_SIZE_T__ 4
#define __CHAR_BIT__ 8
#define __BIGGEST_ALIGNMENT__ 8
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_PDP_ENDIAN__ 3412
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __SIZEOF_POINTER__ 4
#define __SIZE_TYPE__ unsigned int
#define __PTRDIFF_TYPE__ int
#define __WCHAR_TYPE__ unsigned int
#define __WINT_TYPE__ unsigned int
#define __INTMAX_TYPE__ long long int
#define __UINTMAX_TYPE__ long long unsigned int
#define __CHAR16_TYPE__ short unsigned int
#define __CHAR32_TYPE__ long unsigned int
#define __SIG_ATOMIC_TYPE__ int
#define __INT8_TYPE__ signed char
#define __INT16_TYPE__ short int
#define __INT32_TYPE__ long int
#define __INT64_TYPE__ long long int
#define __UINT8_TYPE__ unsigned char
#define __UINT16_TYPE__ short unsigned int
#define __UINT32_TYPE__ long unsigned int
#define __UINT64_TYPE__ long long unsigned int
#define __INT_LEAST8_TYPE__ signed char
#define __INT_LEAST16_TYPE__ short int
#define __INT_LEAST32_TYPE__ long int
#define __INT_LEAST64_TYPE__ long long int
#define __UINT_LEAST8_TYPE__ unsigned char
#define __UINT_LEAST16_TYPE__ short unsigned int
#define __UINT_LEAST32_TYPE__ long unsigned int
#define __UINT_LEAST64_TYPE__ long long unsigned int
#define __INT_FAST8_TYPE__ int
#define __INT_FAST16_TYPE__ int
#define __INT_FAST32_TYPE__ int
#define __INT_FAST64_TYPE__ long long int
#define __UINT_FAST8_TYPE__ unsigned int
#define __UINT_FAST16_TYPE__ unsigned int
#define __UINT_FAST32_TYPE__ unsigned int
#define __UINT_FAST64_TYPE__ long long unsigned int
#define __INTPTR_TYPE__ int
#define __UINTPTR_TYPE__ unsigned int
#define __has_include(STR) __has_include__(STR)
#define __has_include_next(STR) __has_include_next__(STR)
#define __GXX_ABI_VERSION 1011
#define __SCHAR_MAX__ 0x7f
#define __SHRT_MAX__ 0x7fff
#define __INT_MAX__ 0x7fffffff
#define __LONG_MAX__ 0x7fffffffL
#define __LONG_LONG_MAX__ 0x7fffffffffffffffLL
#define __WCHAR_MAX__ 0xffffffffU
#define __WCHAR_MIN__ 0U
#define __WINT_MAX__ 0xffffffffU
#define __WINT_MIN__ 0U
#define __PTRDIFF_MAX__ 0x7fffffff
#define __SIZE_MAX__ 0xffffffffU
#define __SCHAR_WIDTH__ 8
#define __SHRT_WIDTH__ 16
#define __INT_WIDTH__ 32
#define __LONG_WIDTH__ 32
#define __LONG_LONG_WIDTH__ 64
#define __WCHAR_WIDTH__ 32
#define __WINT_WIDTH__ 32
#define __PTRDIFF_WIDTH__ 32
#define __SIZE_WIDTH__ 32
#define __INTMAX_MAX__ 0x7fffffffffffffffLL
#define __INTMAX_C(c) c ## LL
#define __UINTMAX_MAX__ 0xffffffffffffffffULL
#define __UINTMAX_C(c) c ## ULL
#define __INTMAX_WIDTH__ 64
#define __SIG_ATOMIC_MAX__ 0x7fffffff
#define __SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)
#define __SIG_ATOMIC_WIDTH__ 32
#define __INT8_MAX__ 0x7f
#define __INT16_MAX__ 0x7fff
#define __INT32_MAX__ 0x7fffffffL
#define __INT64_MAX__ 0x7fffffffffffffffLL
#define __UINT8_MAX__ 0xff
#define __UINT16_MAX__ 0xffff
#define __UINT32_MAX__ 0xffffffffUL
#define __UINT64_MAX__ 0xffffffffffffffffULL
#define __INT_LEAST8_MAX__ 0x7f
#define __INT8_C(c) c
#define __INT_LEAST8_WIDTH__ 8
#define __INT_LEAST16_MAX__ 0x7fff
#define __INT16_C(c) c
#define __INT_LEAST16_WIDTH__ 16
#define __INT_LEAST32_MAX__ 0x7fffffffL
#define __INT32_C(c) c ## L
#define __INT_LEAST32_WIDTH__ 32
#define __INT_LEAST64_MAX__ 0x7fffffffffffffffLL
#define __INT64_C(c) c ## LL
#define __INT_LEAST64_WIDTH__ 64
#define __UINT_LEAST8_MAX__ 0xff
#define __UINT8_C(c) c
#define __UINT_LEAST16_MAX__ 0xffff
#define __UINT16_C(c) c
#define __UINT_LEAST32_MAX__ 0xffffffffUL
#define __UINT32_C(c) c ## UL
#define __UINT_LEAST64_MAX__ 0xffffffffffffffffULL
#define __UINT64_C(c) c ## ULL
#define __INT_FAST8_MAX__ 0x7fffffff
#define __INT_FAST8_WIDTH__ 32
#define __INT_FAST16_MAX__ 0x7fffffff
#define __INT_FAST16_WIDTH__ 32
#define __INT_FAST32_MAX__ 0x7fffffff
#define __INT_FAST32_WIDTH__ 32
#define __INT_FAST64_MAX__ 0x7fffffffffffffffLL
#define __INT_FAST64_WIDTH__ 64
#define __UINT_FAST8_MAX__ 0xffffffffU
#define __UINT_FAST16_MAX__ 0xffffffffU
#define __UINT_FAST32_MAX__ 0xffffffffU
#define __UINT_FAST64_MAX__ 0xffffffffffffffffULL
#define __INTPTR_MAX__ 0x7fffffff
#define __INTPTR_WIDTH__ 32
#define __UINTPTR_MAX__ 0xffffffffU
#define __GCC_IEC_559 0
#define __GCC_IEC_559_COMPLEX 0
#define __FLT_EVAL_METHOD__ 0
#define __FLT_EVAL_METHOD_TS_18661_3__ 0
#define __DEC_EVAL_METHOD__ 2
#define __FLT_RADIX__ 2
#define __FLT_MANT_DIG__ 24
#define __FLT_DIG__ 6
#define __FLT_MIN_EXP__ (-125)
#define __FLT_MIN_10_EXP__ (-37)
#define __FLT_MAX_EXP__ 128
#define __FLT_MAX_10_EXP__ 38
#define __FLT_DECIMAL_DIG__ 9
#define __FLT_MAX__ 3.4028234663852886e+38F
#define __FLT_MIN__ 1.1754943508222875e-38F
#define __FLT_EPSILON__ 1.1920928955078125e-7F
#define __FLT_DENORM_MIN__ 1.4012984643248171e-45F
#define __FLT_HAS_DENORM__ 1
#define __FLT_HAS_INFINITY__ 1
#define __FLT_HAS_QUIET_NAN__ 1
#define __DBL_MANT_DIG__ 53
#define __DBL_DIG__ 15
#define __DBL_MIN_EXP__ (-1021)
#define __DBL_MIN_10_EXP__ (-307)
#define __DBL_MAX_EXP__ 1024
#define __DBL_MAX_10_EXP__ 308
#define __DBL_DECIMAL_DIG__ 17
#define __DBL_MAX__ ((double)1.7976931348623157e+308L)
#define __DBL_MIN__ ((double)2.2250738585072014e-308L)
#define __DBL_EPSILON__ ((double)2.2204460492503131e-16L)
#define __DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)
#define __DBL_HAS_DENORM__ 1
#define __DBL_HAS_INFINITY__ 1
#define __DBL_HAS_QUIET_NAN__ 1
#define __LDBL_MANT_DIG__ 53
#define __LDBL_DIG__ 15
#define __LDBL_MIN_EXP__ (-1021)
#define __LDBL_MIN_10_EXP__ (-307)
#define __LDBL_MAX_EXP__ 1024
#define __LDBL_MAX_10_EXP__ 308
#define __DECIMAL_DIG__ 17
#define __LDBL_DECIMAL_DIG__ 17
#define __LDBL_MAX__ 1.7976931348623157e+308L
#define __LDBL_MIN__ 2.2250738585072014e-308L
#define __LDBL_EPSILON__ 2.2204460492503131e-16L
#define __LDBL_DENORM_MIN__ 4.9406564584124654e-324L
#define __LDBL_HAS_DENORM__ 1
#define __LDBL_HAS_INFINITY__ 1
#define __LDBL_HAS_QUIET_NAN__ 1
#define __FLT32_MANT_DIG__ 24
#define __FLT32_DIG__ 6
#define __FLT32_MIN_EXP__ (-125)
#define __FLT32_MIN_10_EXP__ (-37)
#define __FLT32_MAX_EXP__ 128
#define __FLT32_MAX_10_EXP__ 38
#define __FLT32_DECIMAL_DIG__ 9
#define __FLT32_MAX__ 3.4028234663852886e+38F32
#define __FLT32_MIN__ 1.1754943508222875e-38F32
#define __FLT32_EPSILON__ 1.1920928955078125e-7F32
#define __FLT32_DENORM_MIN__ 1.4012984643248171e-45F32
#define __FLT32_HAS_DENORM__ 1
#define __FLT32_HAS_INFINITY__ 1
#define __FLT32_HAS_QUIET_NAN__ 1
#define __FLT64_MANT_DIG__ 53
#define __FLT64_DIG__ 15
#define __FLT64_MIN_EXP__ (-1021)
#define __FLT64_MIN_10_EXP__ (-307)
#define __FLT64_MAX_EXP__ 1024
#define __FLT64_MAX_10_EXP__ 308
#define __FLT64_DECIMAL_DIG__ 17
#define __FLT64_MAX__ 1.7976931348623157e+308F64
#define __FLT64_MIN__ 2.2250738585072014e-308F64
#define __FLT64_EPSILON__ 2.2204460492503131e-16F64
#define __FLT64_DENORM_MIN__ 4.9406564584124654e-324F64
#define __FLT64_HAS_DENORM__ 1
#define __FLT64_HAS_INFINITY__ 1
#define __FLT64_HAS_QUIET_NAN__ 1
#define __FLT32X_MANT_DIG__ 53
#define __FLT32X_DIG__ 15
#define __FLT32X_MIN_EXP__ (-1021)
#define __FLT32X_MIN_10_EXP__ (-307)
#define __FLT32X_MAX_EXP__ 1024
#define __FLT32X_MAX_10_EXP__ 308
#define __FLT32X_DECIMAL_DIG__ 17
#define __FLT32X_MAX__ 1.7976931348623157e+308F32x
#define __FLT32X_MIN__ 2.2250738585072014e-308F32x
#define __FLT32X_EPSILON__ 2.2204460492503131e-16F32x
#define __FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x
#define __FLT32X_HAS_DENORM__ 1
#define __FLT32X_HAS_INFINITY__ 1
#define __FLT32X_HAS_QUIET_NAN__ 1
#define __DEC32_MANT_DIG__ 7
#define __DEC32_MIN_EXP__ (-94)
#define __DEC32_MAX_EXP__ 97
#define __DEC32_MIN__ 1E-95DF
#define __DEC32_MAX__ 9.999999E96DF
#define __DEC32_EPSILON__ 1E-6DF
#define __DEC32_SUBNORMAL_MIN__ 0.000001E-95DF
#define __DEC64_MANT_DIG__ 16
#define __DEC64_MIN_EXP__ (-382)
#define __DEC64_MAX_EXP__ 385
#define __DEC64_MIN__ 1E-383DD
#define __DEC64_MAX__ 9.999999999999999E384DD
#define __DEC64_EPSILON__ 1E-15DD
#define __DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD
#define __DEC128_MANT_DIG__ 34
#define __DEC128_MIN_EXP__ (-6142)
#define __DEC128_MAX_EXP__ 6145
#define __DEC128_MIN__ 1E-6143DL
#define __DEC128_MAX__ 9.999999999999999999999999999999999E6144DL
#define __DEC128_EPSILON__ 1E-33DL
#define __DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL
#define __SFRACT_FBIT__ 7
#define __SFRACT_IBIT__ 0
#define __SFRACT_MIN__ (-0.5HR-0.5HR)
#define __SFRACT_MAX__ 0X7FP-7HR
#define __SFRACT_EPSILON__ 0x1P-7HR
#define __USFRACT_FBIT__ 8
#define __USFRACT_IBIT__ 0
#define __USFRACT_MIN__ 0.0UHR
#define __USFRACT_MAX__ 0XFFP-8UHR
#define __USFRACT_EPSILON__ 0x1P-8UHR
#define __FRACT_FBIT__ 15
#define __FRACT_IBIT__ 0
#define __FRACT_MIN__ (-0.5R-0.5R)
#define __FRACT_MAX__ 0X7FFFP-15R
#define __FRACT_EPSILON__ 0x1P-15R
#define __UFRACT_FBIT__ 16
#define __UFRACT_IBIT__ 0
#define __UFRACT_MIN__ 0.0UR
#define __UFRACT_MAX__ 0XFFFFP-16UR
#define __UFRACT_EPSILON__ 0x1P-16UR
#define __LFRACT_FBIT__ 31
#define __LFRACT_IBIT__ 0
#define __LFRACT_MIN__ (-0.5LR-0.5LR)
#define __LFRACT_MAX__ 0X7FFFFFFFP-31LR
#define __LFRACT_EPSILON__ 0x1P-31LR
#define __ULFRACT_FBIT__ 32
#define __ULFRACT_IBIT__ 0
#define __ULFRACT_MIN__ 0.0ULR
#define __ULFRACT_MAX__ 0XFFFFFFFFP-32ULR
#define __ULFRACT_EPSILON__ 0x1P-32ULR
#define __LLFRACT_FBIT__ 63
#define __LLFRACT_IBIT__ 0
#define __LLFRACT_MIN__ (-0.5LLR-0.5LLR)
#define __LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR
#define __LLFRACT_EPSILON__ 0x1P-63LLR
#define __ULLFRACT_FBIT__ 64
#define __ULLFRACT_IBIT__ 0
#define __ULLFRACT_MIN__ 0.0ULLR
#define __ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR
#define __ULLFRACT_EPSILON__ 0x1P-64ULLR
#define __SACCUM_FBIT__ 7
#define __SACCUM_IBIT__ 8
#define __SACCUM_MIN__ (-0X1P7HK-0X1P7HK)
#define __SACCUM_MAX__ 0X7FFFP-7HK
#define __SACCUM_EPSILON__ 0x1P-7HK
#define __USACCUM_FBIT__ 8
#define __USACCUM_IBIT__ 8
#define __USACCUM_MIN__ 0.0UHK
#define __USACCUM_MAX__ 0XFFFFP-8UHK
#define __USACCUM_EPSILON__ 0x1P-8UHK
#define __ACCUM_FBIT__ 15
#define __ACCUM_IBIT__ 16
#define __ACCUM_MIN__ (-0X1P15K-0X1P15K)
#define __ACCUM_MAX__ 0X7FFFFFFFP-15K
#define __ACCUM_EPSILON__ 0x1P-15K
#define __UACCUM_FBIT__ 16
#define __UACCUM_IBIT__ 16
#define __UACCUM_MIN__ 0.0UK
#define __UACCUM_MAX__ 0XFFFFFFFFP-16UK
#define __UACCUM_EPSILON__ 0x1P-16UK
#define __LACCUM_FBIT__ 31
#define __LACCUM_IBIT__ 32
#define __LACCUM_MIN__ (-0X1P31LK-0X1P31LK)
#define __LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK
#define __LACCUM_EPSILON__ 0x1P-31LK
#define __ULACCUM_FBIT__ 32
#define __ULACCUM_IBIT__ 32
#define __ULACCUM_MIN__ 0.0ULK
#define __ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK
#define __ULACCUM_EPSILON__ 0x1P-32ULK
#define __LLACCUM_FBIT__ 31
#define __LLACCUM_IBIT__ 32
#define __LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)
#define __LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK
#define __LLACCUM_EPSILON__ 0x1P-31LLK
#define __ULLACCUM_FBIT__ 32
#define __ULLACCUM_IBIT__ 32
#define __ULLACCUM_MIN__ 0.0ULLK
#define __ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK
#define __ULLACCUM_EPSILON__ 0x1P-32ULLK
#define __QQ_FBIT__ 7
#define __QQ_IBIT__ 0
#define __HQ_FBIT__ 15
#define __HQ_IBIT__ 0
#define __SQ_FBIT__ 31
#define __SQ_IBIT__ 0
#define __DQ_FBIT__ 63
#define __DQ_IBIT__ 0
#define __TQ_FBIT__ 127
#define __TQ_IBIT__ 0
#define __UQQ_FBIT__ 8
#define __UQQ_IBIT__ 0
#define __UHQ_FBIT__ 16
#define __UHQ_IBIT__ 0
#define __USQ_FBIT__ 32
#define __USQ_IBIT__ 0
#define __UDQ_FBIT__ 64
#define __UDQ_IBIT__ 0
#define __UTQ_FBIT__ 128
#define __UTQ_IBIT__ 0
#define __HA_FBIT__ 7
#define __HA_IBIT__ 8
#define __SA_FBIT__ 15
#define __SA_IBIT__ 16
#define __DA_FBIT__ 31
#define __DA_IBIT__ 32
#define __TA_FBIT__ 63
#define __TA_IBIT__ 64
#define __UHA_FBIT__ 8
#define __UHA_IBIT__ 8
#define __USA_FBIT__ 16
#define __USA_IBIT__ 16
#define __UDA_FBIT__ 32
#define __UDA_IBIT__ 32
#define __UTA_FBIT__ 64
#define __UTA_IBIT__ 64
#define __REGISTER_PREFIX__ 
#define __USER_LABEL_PREFIX__ 
#define __GNUC_STDC_INLINE__ 1
#define __CHAR_UNSIGNED__ 1
#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR32_T_LOCK_FREE 1
#define __GCC_ATOMIC_WCHAR_T_LOCK_FREE 1
#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
#define __GCC_ATOMIC_INT_LOCK_FREE 1
#define __GCC_ATOMIC_LONG_LOCK_FREE 1
#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
#define __GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1
#define __GCC_ATOMIC_POINTER_LOCK_FREE 1
#define __GCC_HAVE_DWARF2_CFI_ASM 1
#define __PRAGMA_REDEFINE_EXTNAME 1
#define __SIZEOF_WCHAR_T__ 4
#define __SIZEOF_WINT_T__ 4
#define __SIZEOF_PTRDIFF_T__ 4
#undef __ARM_FEATURE_DSP
# 1 "<built-in>"
#undef __ARM_FEATURE_QBIT
# 1 "<built-in>"
#undef __ARM_FEATURE_SAT
# 1 "<built-in>"
#undef __ARM_FEATURE_CRYPTO
# 1 "<built-in>"
#undef __ARM_FEATURE_UNALIGNED
# 1 "<built-in>"
#undef __ARM_FEATURE_QRDMX
# 1 "<built-in>"
#undef __ARM_32BIT_STATE
# 1 "<built-in>"
#undef __ARM_FEATURE_LDREX
# 1 "<built-in>"
#undef __ARM_FEATURE_CLZ
# 1 "<built-in>"
#undef __ARM_FEATURE_NUMERIC_MAXMIN
# 1 "<built-in>"
#undef __ARM_FEATURE_SIMD32
# 1 "<built-in>"
#define __ARM_SIZEOF_MINIMAL_ENUM 1
#define __ARM_SIZEOF_WCHAR_T 4
#define __ARM_ARCH_PROFILE 77
#define __arm__ 1
#define __ARM_ARCH 6
#define __APCS_32__ 1
#define __thumb__ 1
#undef __thumb2__
# 1 "<built-in>"
#define __THUMBEL__ 1
#define __ARM_ARCH_ISA_THUMB 1
#define __ARMEL__ 1
#define __SOFTFP__ 1
#define __VFP_FP__ 1
#undef __ARM_FP
# 1 "<built-in>"
#undef __ARM_FP16_FORMAT_IEEE
# 1 "<built-in>"
#undef __ARM_FP16_FORMAT_ALTERNATIVE
# 1 "<built-in>"
#undef __ARM_FP16_ARGS
# 1 "<built-in>"
#undef __ARM_FEATURE_FP16_SCALAR_ARITHMETIC
# 1 "<built-in>"
#undef __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
# 1 "<built-in>"
#undef __ARM_FEATURE_FMA
# 1 "<built-in>"
#undef __ARM_NEON__
# 1 "<built-in>"
#undef __ARM_NEON
# 1 "<built-in>"
#undef __ARM_NEON_FP
# 1 "<built-in>"
#define __THUMB_INTERWORK__ 1
#define __ARM_ARCH_6M__ 1
#define __ARM_PCS 1
#define __ARM_EABI__ 1
#undef __ARM_ARCH_EXT_IDIV__
# 1 "<built-in>"
#undef __ARM_FEATURE_IDIV
# 1 "<built-in>"
#undef __ARM_ASM_SYNTAX_UNIFIED__
# 1 "<built-in>"
#undef __ARM_FEATURE_COPROC
# 1 "<built-in>"
#define __GXX_TYPEINFO_EQUALITY_INLINE 0
#define __ELF__ 1
# 1 "<command-line>"
#define __USES_INITFINI__ 1
#define DEBUG 1
#define MBEDTLS_CONFIG_FILE <myconfig.h>
#define OS_USE_SEMIHOSTING 1
#define TRACE 1
#define OS_USE_TRACE_SEMIHOSTING_DEBUG 1
# 1 "../system/src/cortexm/exception_handlers.c"
# 30 "../system/src/cortexm/exception_handlers.c"
# 1 "../system/include/cortexm/ExceptionHandlers.h" 1
# 29 "../system/include/cortexm/ExceptionHandlers.h"
#define CORTEXM_EXCEPTION_HANDLERS_H_ 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 1 3 4
# 9 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 3 4
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 1 3 4
# 10 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define _STDINT_H 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 1 3 4





#define _MACHINE__DEFAULT_TYPES_H 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 1 3 4
# 22 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#define _SYS_FEATURES_H 





# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_newlib_version.h" 1 3 4



#define _NEWLIB_VERSION_H__ 1

#define _NEWLIB_VERSION "3.0.0"
#define __NEWLIB__ 3
#define __NEWLIB_MINOR__ 0
#define __NEWLIB_PATCHLEVEL__ 0
# 29 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 2 3 4




#define __GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))






#define __GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)
# 131 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#undef _DEFAULT_SOURCE
#define _DEFAULT_SOURCE 1



#undef _POSIX_SOURCE
#define _POSIX_SOURCE 1
#undef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200809L
# 158 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#undef _ATFILE_SOURCE
#define _ATFILE_SOURCE 1
# 247 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#define __ATFILE_VISIBLE 1





#define __BSD_VISIBLE 1







#define __GNU_VISIBLE 0




#define __ISO_C_VISIBLE 2011
# 277 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#define __LARGEFILE_VISIBLE 0



#define __MISC_VISIBLE 1





#define __POSIX_VISIBLE 200809
# 303 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#define __SVID_VISIBLE 1
# 319 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#define __XSI_VISIBLE 0
# 330 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/features.h" 3 4
#define __SSP_FORTIFY_LEVEL 0
# 9 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 2 3 4






#define __EXP(x) __ ##x ##__
# 26 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
#define __have_longlong64 1






#define __have_long32 1








# 41 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;



#define ___int8_t_defined 1







typedef short int __int16_t;

typedef short unsigned int __uint16_t;



#define ___int16_t_defined 1
# 77 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;



#define ___int32_t_defined 1
# 103 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;



#define ___int64_t_defined 1
# 134 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;



#define ___int_least8_t_defined 1
# 160 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;



#define ___int_least16_t_defined 1
# 182 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;



#define ___int_least32_t_defined 1
# 200 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;



#define ___int_least64_t_defined 1







typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 244 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_default_types.h" 3 4
#undef __EXP
# 13 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 10 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define _SYS__INTSUP_H 





#define __STDINT_EXP(x) __ ##x ##__
# 35 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef __int20
#undef long
#define signed +0
#define unsigned +0
#define char +0
#define short +1
#define __int20 +2
#define int +2
#define long +4
# 64 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define _INTPTR_EQ_INT 






#define _INT32_EQ_LONG 







#define __INT8 "hh"
# 90 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT16 "h"
# 101 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT32 "l"
# 110 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __INT64 "ll"






#define __FAST8 
# 126 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __FAST16 






#define __FAST32 
# 144 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __FAST64 "ll"



#define __LEAST8 "hh"
# 159 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST16 "h"
# 170 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST32 "l"
# 179 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#define __LEAST64 "ll"

#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef long
       
       
       
       
       
# 191 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_intsup.h" 3 4
#undef __int20
       
       
# 14 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 10 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_stdint.h" 3 4
#define _SYS__STDINT_H 
# 20 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;
#define _INT8_T_DECLARED 


typedef __uint8_t uint8_t ;
#define _UINT8_T_DECLARED 

#define __int8_t_defined 1




typedef __int16_t int16_t ;
#define _INT16_T_DECLARED 


typedef __uint16_t uint16_t ;
#define _UINT16_T_DECLARED 

#define __int16_t_defined 1




typedef __int32_t int32_t ;
#define _INT32_T_DECLARED 


typedef __uint32_t uint32_t ;
#define _UINT32_T_DECLARED 

#define __int32_t_defined 1




typedef __int64_t int64_t ;
#define _INT64_T_DECLARED 


typedef __uint64_t uint64_t ;
#define _UINT64_T_DECLARED 

#define __int64_t_defined 1



typedef __intmax_t intmax_t;
#define _INTMAX_T_DECLARED 



typedef __uintmax_t uintmax_t;
#define _UINTMAX_T_DECLARED 



typedef __intptr_t intptr_t;
#define _INTPTR_T_DECLARED 



typedef __uintptr_t uintptr_t;
#define _UINTPTR_T_DECLARED 
# 15 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;
#define __int_least8_t_defined 1



typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;
#define __int_least16_t_defined 1



typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;
#define __int_least32_t_defined 1



typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
#define __int_least64_t_defined 1
# 51 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
#define __int_fast8_t_defined 1







  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
#define __int_fast16_t_defined 1







  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
#define __int_fast32_t_defined 1







  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
#define __int_fast64_t_defined 1
# 128 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INTPTR_MIN (-__INTPTR_MAX__ - 1)
#define INTPTR_MAX (__INTPTR_MAX__)
#define UINTPTR_MAX (__UINTPTR_MAX__)
# 152 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT8_MIN (-__INT8_MAX__ - 1)
#define INT8_MAX (__INT8_MAX__)
#define UINT8_MAX (__UINT8_MAX__)







#define INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)
#define INT_LEAST8_MAX (__INT_LEAST8_MAX__)
#define UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)
# 174 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT16_MIN (-__INT16_MAX__ - 1)
#define INT16_MAX (__INT16_MAX__)
#define UINT16_MAX (__UINT16_MAX__)







#define INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)
#define INT_LEAST16_MAX (__INT_LEAST16_MAX__)
#define UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)
# 196 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT32_MIN (-__INT32_MAX__ - 1)
#define INT32_MAX (__INT32_MAX__)
#define UINT32_MAX (__UINT32_MAX__)
# 212 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)
#define INT_LEAST32_MAX (__INT_LEAST32_MAX__)
#define UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)
# 230 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT64_MIN (-__INT64_MAX__ - 1)
#define INT64_MAX (__INT64_MAX__)
#define UINT64_MAX (__UINT64_MAX__)
# 246 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)
#define INT_LEAST64_MAX (__INT_LEAST64_MAX__)
#define UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)
# 262 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)
#define INT_FAST8_MAX (__INT_FAST8_MAX__)
#define UINT_FAST8_MAX (__UINT_FAST8_MAX__)
# 278 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)
#define INT_FAST16_MAX (__INT_FAST16_MAX__)
#define UINT_FAST16_MAX (__UINT_FAST16_MAX__)
# 294 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)
#define INT_FAST32_MAX (__INT_FAST32_MAX__)
#define UINT_FAST32_MAX (__UINT_FAST32_MAX__)
# 310 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)
#define INT_FAST64_MAX (__INT_FAST64_MAX__)
#define UINT_FAST64_MAX (__UINT_FAST64_MAX__)
# 326 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INTMAX_MAX (__INTMAX_MAX__)
#define INTMAX_MIN (-INTMAX_MAX - 1)







#define UINTMAX_MAX (__UINTMAX_MAX__)







#define SIZE_MAX (__SIZE_MAX__)





#define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
#define SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))



#define PTRDIFF_MAX (__PTRDIFF_MAX__)



#define PTRDIFF_MIN (-PTRDIFF_MAX - 1)




#define WCHAR_MIN (__WCHAR_MIN__)
# 374 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define WCHAR_MAX (__WCHAR_MAX__)
# 384 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define WINT_MAX (__WINT_MAX__)




#define WINT_MIN (__WINT_MIN__)






#define INT8_C(x) __INT8_C(x)
#define UINT8_C(x) __UINT8_C(x)
# 408 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT16_C(x) __INT16_C(x)
#define UINT16_C(x) __UINT16_C(x)
# 420 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT32_C(x) __INT32_C(x)
#define UINT32_C(x) __UINT32_C(x)
# 433 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INT64_C(x) __INT64_C(x)
#define UINT64_C(x) __UINT64_C(x)
# 449 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/stdint.h" 3 4
#define INTMAX_C(x) __INTMAX_C(x)
#define UINTMAX_C(x) __UINTMAX_C(x)
# 10 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h" 2 3 4



#define _GCC_WRAP_STDINT_H 
# 32 "../system/include/cortexm/ExceptionHandlers.h" 2


#define __DEBUG_BKPT() asm volatile ("bkpt 0")
# 46 "../system/include/cortexm/ExceptionHandlers.h"
  
# 46 "../system/include/cortexm/ExceptionHandlers.h"
 extern void
  Reset_Handler (void);
  extern void
  NMI_Handler (void);
  extern void
  HardFault_Handler (void);
# 64 "../system/include/cortexm/ExceptionHandlers.h"
  extern void
  SVC_Handler (void);

  extern void
  PendSV_Handler (void);
  extern void
  SysTick_Handler (void);


  typedef struct
  {
    uint32_t r0;
    uint32_t r1;
    uint32_t r2;
    uint32_t r3;
    uint32_t r12;
    uint32_t lr;
    uint32_t pc;
    uint32_t psr;



  } ExceptionStackFrame;
# 95 "../system/include/cortexm/ExceptionHandlers.h"
  void
  dumpExceptionStack (ExceptionStackFrame* frame, uint32_t lr);



  void
  HardFault_Handler_C (ExceptionStackFrame* frame, uint32_t lr);
# 31 "../system/src/cortexm/exception_handlers.c" 2
# 1 "../system/include/cmsis/cmsis_device.h" 1

#define _CMSIS_H_ 

# 1 "../system/include/cmsis/DEVICE.h" 1
# 40 "../system/include/cmsis/DEVICE.h"
#define Device_H 
# 71 "../system/include/cmsis/DEVICE.h"
typedef enum IRQn
{





  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  SVCall_IRQn = -5,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,
# 102 "../system/include/cmsis/DEVICE.h"
  DeviceInterrupt_IRQn = 0,
} IRQn_Type;
# 120 "../system/include/cmsis/DEVICE.h"
#define __CM0_REV 0x0201






#define __NVIC_PRIO_BITS 2
#define __Vendor_SysTickConfig 0
#define __MPU_PRESENT 0

#define __FPU_PRESENT 0
# 143 "../system/include/cmsis/DEVICE.h"
# 1 "../system/include/cmsis/core_cm0.h" 1
# 42 "../system/include/cmsis/core_cm0.h"
#define __CORE_CM0_H_GENERIC 



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 82 "../system/include/cmsis/core_cm0.h"
#define __CM0_CMSIS_VERSION_MAIN (0x04U)
#define __CM0_CMSIS_VERSION_SUB (0x1EU)
#define __CM0_CMSIS_VERSION ((__CM0_CMSIS_VERSION_MAIN << 16U) | __CM0_CMSIS_VERSION_SUB )


#define __CORTEX_M (0x00U)
# 101 "../system/include/cmsis/core_cm0.h"
#define __ASM __asm
#define __INLINE inline
#define __STATIC_INLINE static inline
# 132 "../system/include/cmsis/core_cm0.h"
#define __FPU_USED 0U
# 171 "../system/include/cmsis/core_cm0.h"
# 1 "../system/include/cmsis/core_cmInstr.h" 1
# 42 "../system/include/cmsis/core_cmInstr.h"
#define __CORE_CMINSTR_H 
# 61 "../system/include/cmsis/core_cmInstr.h"
# 1 "../system/include/cmsis/cmsis_gcc.h" 1
# 36 "../system/include/cmsis/cmsis_gcc.h"
#define __CMSIS_GCC_H 



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 58 "../system/include/cmsis/cmsis_gcc.h"
__attribute__( ( always_inline ) ) static inline void __enable_irq(void)
{
  __asm volatile ("cpsie i" : : : "memory");
}







__attribute__( ( always_inline ) ) static inline void __disable_irq(void)
{
  __asm volatile ("cpsid i" : : : "memory");
}







__attribute__( ( always_inline ) ) static inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}







__attribute__( ( always_inline ) ) static inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}







__attribute__( ( always_inline ) ) static inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__( ( always_inline ) ) static inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}
# 134 "../system/include/cmsis/cmsis_gcc.h"
__attribute__( ( always_inline ) ) static inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__( ( always_inline ) ) static inline uint32_t __get_PSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, psp\n" : "=r" (result) );
  return(result);
}







__attribute__( ( always_inline ) ) static inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0\n" : : "r" (topOfProcStack) : "sp");
}







__attribute__( ( always_inline ) ) static inline uint32_t __get_MSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, msp\n" : "=r" (result) );
  return(result);
}
# 188 "../system/include/cmsis/cmsis_gcc.h"
__attribute__( ( always_inline ) ) static inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0\n" : : "r" (topOfMainStack) : "sp");
}







__attribute__( ( always_inline ) ) static inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}







__attribute__( ( always_inline ) ) static inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 362 "../system/include/cmsis/cmsis_gcc.h"
#define __CMSIS_GCC_OUT_REG(r) "=l" (r)
#define __CMSIS_GCC_USE_REG(r) "l" (r)
# 373 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __NOP(void)
{
  __asm volatile ("nop");
}






__attribute__((always_inline)) static inline void __WFI(void)
{
  __asm volatile ("wfi");
}







__attribute__((always_inline)) static inline void __WFE(void)
{
  __asm volatile ("wfe");
}






__attribute__((always_inline)) static inline void __SEV(void)
{
  __asm volatile ("sev");
}
# 416 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline void __ISB(void)
{
  __asm volatile ("isb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void __DSB(void)
{
  __asm volatile ("dsb 0xF":::"memory");
}







__attribute__((always_inline)) static inline void __DMB(void)
{
  __asm volatile ("dmb 0xF":::"memory");
}
# 450 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __REV(uint32_t value)
{

  return __builtin_bswap32(value);






}
# 469 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __REV16(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rev16 %0, %1" : "=l" (result) : "l" (value) );
  return(result);
}
# 484 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline int32_t __REVSH(int32_t value)
{

  return (short)__builtin_bswap16(value);






}
# 504 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 517 "../system/include/cmsis/cmsis_gcc.h"
#define __BKPT(value) __ASM volatile ("bkpt "#value)
# 526 "../system/include/cmsis/cmsis_gcc.h"
__attribute__((always_inline)) static inline uint32_t __RBIT(uint32_t value)
{
  uint32_t result;




  int32_t s = 4 * 8 - 1;

  result = value;
  for (value >>= 1U; value; value >>= 1U)
  {
    result <<= 1U;
    result |= value & 1U;
    s--;
  }
  result <<= s;

  return(result);
}
# 554 "../system/include/cmsis/cmsis_gcc.h"
#define __CLZ __builtin_clz
# 1370 "../system/include/cmsis/cmsis_gcc.h"
#pragma GCC diagnostic pop
# 62 "../system/include/cmsis/core_cmInstr.h" 2
# 172 "../system/include/cmsis/core_cm0.h" 2
# 1 "../system/include/cmsis/core_cmFunc.h" 1
# 42 "../system/include/cmsis/core_cmFunc.h"
#define __CORE_CMFUNC_H 
# 173 "../system/include/cmsis/core_cm0.h" 2
# 183 "../system/include/cmsis/core_cm0.h"
#define __CORE_CM0_H_DEPENDANT 
# 218 "../system/include/cmsis/core_cm0.h"
#define __I volatile const

#define __O volatile
#define __IO volatile


#define __IM volatile const
#define __OM volatile
#define __IOM volatile
# 255 "../system/include/cmsis/core_cm0.h"
typedef union
{
  struct
  {
    uint32_t _reserved0:28;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;


#define APSR_N_Pos 31U
#define APSR_N_Msk (1UL << APSR_N_Pos)

#define APSR_Z_Pos 30U
#define APSR_Z_Msk (1UL << APSR_Z_Pos)

#define APSR_C_Pos 29U
#define APSR_C_Msk (1UL << APSR_C_Pos)

#define APSR_V_Pos 28U
#define APSR_V_Msk (1UL << APSR_V_Pos)





typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;


#define IPSR_ISR_Pos 0U
#define IPSR_ISR_Msk (0x1FFUL )





typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:15;
    uint32_t T:1;
    uint32_t _reserved1:3;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;


#define xPSR_N_Pos 31U
#define xPSR_N_Msk (1UL << xPSR_N_Pos)

#define xPSR_Z_Pos 30U
#define xPSR_Z_Msk (1UL << xPSR_Z_Pos)

#define xPSR_C_Pos 29U
#define xPSR_C_Msk (1UL << xPSR_C_Pos)

#define xPSR_V_Pos 28U
#define xPSR_V_Msk (1UL << xPSR_V_Pos)

#define xPSR_T_Pos 24U
#define xPSR_T_Msk (1UL << xPSR_T_Pos)

#define xPSR_ISR_Pos 0U
#define xPSR_ISR_Msk (0x1FFUL )





typedef union
{
  struct
  {
    uint32_t _reserved0:1;
    uint32_t SPSEL:1;
    uint32_t _reserved1:30;
  } b;
  uint32_t w;
} CONTROL_Type;


#define CONTROL_SPSEL_Pos 1U
#define CONTROL_SPSEL_Msk (1UL << CONTROL_SPSEL_Pos)
# 370 "../system/include/cmsis/core_cm0.h"
typedef struct
{
  volatile uint32_t ISER[1U];
        uint32_t RESERVED0[31U];
  volatile uint32_t ICER[1U];
        uint32_t RSERVED1[31U];
  volatile uint32_t ISPR[1U];
        uint32_t RESERVED2[31U];
  volatile uint32_t ICPR[1U];
        uint32_t RESERVED3[31U];
        uint32_t RESERVED4[64U];
  volatile uint32_t IP[8U];
} NVIC_Type;
# 397 "../system/include/cmsis/core_cm0.h"
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
        uint32_t RESERVED0;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
        uint32_t RESERVED1;
  volatile uint32_t SHP[2U];
  volatile uint32_t SHCSR;
} SCB_Type;


#define SCB_CPUID_IMPLEMENTER_Pos 24U
#define SCB_CPUID_IMPLEMENTER_Msk (0xFFUL << SCB_CPUID_IMPLEMENTER_Pos)

#define SCB_CPUID_VARIANT_Pos 20U
#define SCB_CPUID_VARIANT_Msk (0xFUL << SCB_CPUID_VARIANT_Pos)

#define SCB_CPUID_ARCHITECTURE_Pos 16U
#define SCB_CPUID_ARCHITECTURE_Msk (0xFUL << SCB_CPUID_ARCHITECTURE_Pos)

#define SCB_CPUID_PARTNO_Pos 4U
#define SCB_CPUID_PARTNO_Msk (0xFFFUL << SCB_CPUID_PARTNO_Pos)

#define SCB_CPUID_REVISION_Pos 0U
#define SCB_CPUID_REVISION_Msk (0xFUL )


#define SCB_ICSR_NMIPENDSET_Pos 31U
#define SCB_ICSR_NMIPENDSET_Msk (1UL << SCB_ICSR_NMIPENDSET_Pos)

#define SCB_ICSR_PENDSVSET_Pos 28U
#define SCB_ICSR_PENDSVSET_Msk (1UL << SCB_ICSR_PENDSVSET_Pos)

#define SCB_ICSR_PENDSVCLR_Pos 27U
#define SCB_ICSR_PENDSVCLR_Msk (1UL << SCB_ICSR_PENDSVCLR_Pos)

#define SCB_ICSR_PENDSTSET_Pos 26U
#define SCB_ICSR_PENDSTSET_Msk (1UL << SCB_ICSR_PENDSTSET_Pos)

#define SCB_ICSR_PENDSTCLR_Pos 25U
#define SCB_ICSR_PENDSTCLR_Msk (1UL << SCB_ICSR_PENDSTCLR_Pos)

#define SCB_ICSR_ISRPREEMPT_Pos 23U
#define SCB_ICSR_ISRPREEMPT_Msk (1UL << SCB_ICSR_ISRPREEMPT_Pos)

#define SCB_ICSR_ISRPENDING_Pos 22U
#define SCB_ICSR_ISRPENDING_Msk (1UL << SCB_ICSR_ISRPENDING_Pos)

#define SCB_ICSR_VECTPENDING_Pos 12U
#define SCB_ICSR_VECTPENDING_Msk (0x1FFUL << SCB_ICSR_VECTPENDING_Pos)

#define SCB_ICSR_VECTACTIVE_Pos 0U
#define SCB_ICSR_VECTACTIVE_Msk (0x1FFUL )


#define SCB_AIRCR_VECTKEY_Pos 16U
#define SCB_AIRCR_VECTKEY_Msk (0xFFFFUL << SCB_AIRCR_VECTKEY_Pos)

#define SCB_AIRCR_VECTKEYSTAT_Pos 16U
#define SCB_AIRCR_VECTKEYSTAT_Msk (0xFFFFUL << SCB_AIRCR_VECTKEYSTAT_Pos)

#define SCB_AIRCR_ENDIANESS_Pos 15U
#define SCB_AIRCR_ENDIANESS_Msk (1UL << SCB_AIRCR_ENDIANESS_Pos)

#define SCB_AIRCR_SYSRESETREQ_Pos 2U
#define SCB_AIRCR_SYSRESETREQ_Msk (1UL << SCB_AIRCR_SYSRESETREQ_Pos)

#define SCB_AIRCR_VECTCLRACTIVE_Pos 1U
#define SCB_AIRCR_VECTCLRACTIVE_Msk (1UL << SCB_AIRCR_VECTCLRACTIVE_Pos)


#define SCB_SCR_SEVONPEND_Pos 4U
#define SCB_SCR_SEVONPEND_Msk (1UL << SCB_SCR_SEVONPEND_Pos)

#define SCB_SCR_SLEEPDEEP_Pos 2U
#define SCB_SCR_SLEEPDEEP_Msk (1UL << SCB_SCR_SLEEPDEEP_Pos)

#define SCB_SCR_SLEEPONEXIT_Pos 1U
#define SCB_SCR_SLEEPONEXIT_Msk (1UL << SCB_SCR_SLEEPONEXIT_Pos)


#define SCB_CCR_STKALIGN_Pos 9U
#define SCB_CCR_STKALIGN_Msk (1UL << SCB_CCR_STKALIGN_Pos)

#define SCB_CCR_UNALIGN_TRP_Pos 3U
#define SCB_CCR_UNALIGN_TRP_Msk (1UL << SCB_CCR_UNALIGN_TRP_Pos)


#define SCB_SHCSR_SVCALLPENDED_Pos 15U
#define SCB_SHCSR_SVCALLPENDED_Msk (1UL << SCB_SHCSR_SVCALLPENDED_Pos)
# 504 "../system/include/cmsis/core_cm0.h"
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;


#define SysTick_CTRL_COUNTFLAG_Pos 16U
#define SysTick_CTRL_COUNTFLAG_Msk (1UL << SysTick_CTRL_COUNTFLAG_Pos)

#define SysTick_CTRL_CLKSOURCE_Pos 2U
#define SysTick_CTRL_CLKSOURCE_Msk (1UL << SysTick_CTRL_CLKSOURCE_Pos)

#define SysTick_CTRL_TICKINT_Pos 1U
#define SysTick_CTRL_TICKINT_Msk (1UL << SysTick_CTRL_TICKINT_Pos)

#define SysTick_CTRL_ENABLE_Pos 0U
#define SysTick_CTRL_ENABLE_Msk (1UL )


#define SysTick_LOAD_RELOAD_Pos 0U
#define SysTick_LOAD_RELOAD_Msk (0xFFFFFFUL )


#define SysTick_VAL_CURRENT_Pos 0U
#define SysTick_VAL_CURRENT_Msk (0xFFFFFFUL )


#define SysTick_CALIB_NOREF_Pos 31U
#define SysTick_CALIB_NOREF_Msk (1UL << SysTick_CALIB_NOREF_Pos)

#define SysTick_CALIB_SKEW_Pos 30U
#define SysTick_CALIB_SKEW_Msk (1UL << SysTick_CALIB_SKEW_Pos)

#define SysTick_CALIB_TENMS_Pos 0U
#define SysTick_CALIB_TENMS_Msk (0xFFFFFFUL )
# 569 "../system/include/cmsis/core_cm0.h"
#define _VAL2FLD(field,value) ((value << field ## _Pos) & field ## _Msk)







#define _FLD2VAL(field,value) ((value & field ## _Msk) >> field ## _Pos)
# 590 "../system/include/cmsis/core_cm0.h"
#define SCS_BASE (0xE000E000UL)
#define SysTick_BASE (SCS_BASE + 0x0010UL)
#define NVIC_BASE (SCS_BASE + 0x0100UL)
#define SCB_BASE (SCS_BASE + 0x0D00UL)

#define SCB ((SCB_Type *) SCB_BASE )
#define SysTick ((SysTick_Type *) SysTick_BASE )
#define NVIC ((NVIC_Type *) NVIC_BASE )
# 627 "../system/include/cmsis/core_cm0.h"
#define _BIT_SHIFT(IRQn) ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL)
#define _SHP_IDX(IRQn) ( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )
#define _IP_IDX(IRQn) ( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )







static inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}







static inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}
# 661 "../system/include/cmsis/core_cm0.h"
static inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0U] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
}







static inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}







static inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}
# 696 "../system/include/cmsis/core_cm0.h"
static inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) < 0)
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )] = ((uint32_t)(((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )] & ~(0xFFUL << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL))) |
       (((priority << (8U - 2)) & (uint32_t)0xFFUL) << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL)));
  }
  else
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )] = ((uint32_t)(((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )] & ~(0xFFUL << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL))) |
       (((priority << (8U - 2)) & (uint32_t)0xFFUL) << ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL)));
  }
}
# 720 "../system/include/cmsis/core_cm0.h"
static inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) < 0)
  {
    return((uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( (((((uint32_t)(int32_t)(IRQn)) & 0x0FUL)-8UL) >> 2UL) )] >> ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL) ) & (uint32_t)0xFFUL) >> (8U - 2)));
  }
  else
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[ ( (((uint32_t)(int32_t)(IRQn)) >> 2UL) )] >> ( ((((uint32_t)(int32_t)(IRQn)) ) & 0x03UL) * 8UL) ) & (uint32_t)0xFFUL) >> (8U - 2)));
  }
}






static inline void NVIC_SystemReset(void)
{
  __DSB();

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = ((0x5FAUL << 16U) |
                 (1UL << 2U));
  __DSB();

  for(;;)
  {
    __NOP();
  }
}
# 777 "../system/include/cmsis/core_cm0.h"
static inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  NVIC_SetPriority (SysTick_IRQn, (1UL << 2) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 808 "../system/include/cmsis/core_cm0.h"
#pragma GCC diagnostic pop
# 144 "../system/include/cmsis/DEVICE.h" 2
# 152 "../system/include/cmsis/DEVICE.h"
# 1 "../system/include/cmsis/system_DEVICE.h" 1
# 40 "../system/include/cmsis/system_DEVICE.h"
#define SYSTEM_Device_H 







extern uint32_t SystemCoreClock;
# 60 "../system/include/cmsis/system_DEVICE.h"
extern void SystemInit (void);
# 71 "../system/include/cmsis/system_DEVICE.h"
extern void SystemCoreClockUpdate (void);
# 153 "../system/include/cmsis/DEVICE.h" 2
# 174 "../system/include/cmsis/DEVICE.h"
typedef struct
{
  volatile uint32_t EN;
  volatile uint32_t RUN;
  volatile uint32_t CR;
  volatile uint32_t MOD;
       uint32_t RESERVED0[1];
  volatile uint32_t ST;
  volatile uint32_t IM;
  volatile uint32_t UC;
  volatile uint32_t RG0;
       uint32_t RESERVED1[2];
  volatile uint32_t CP;
} DeviceAbbreviation_TMR_TypeDef;
# 208 "../system/include/cmsis/DEVICE.h"
#define DeviceAbbreviation_FLASH_BASE (0x00000000UL)
#define DeviceAbbreviation_SRAM_BASE (0x20000000UL)
#define DeviceAbbreviation_PERIPH_BASE (0x40000000UL)


#define DeviceAbbreviationTIM0_BASE (DeviceAbbreviation_PERIPH_BASE)
#define DeviceAbbreviationTIM1_BASE (DeviceAbbreviation_PERIPH_BASE + 0x0800)
#define DeviceAbbreviationTIM2_BASE (DeviceAbbreviation_PERIPH_BASE + 0x1000)
# 229 "../system/include/cmsis/DEVICE.h"
#define DeviceAbbreviation_TIM0 ((DeviceAbbreviation_TMR_TypeDef *) DeviceAbbreviationTIM0_BASE)
#define DeviceAbbreviation_TIM1 ((DeviceAbbreviation_TMR_TypeDef *) DeviceAbbreviationTIM0_BASE)
#define DeviceAbbreviation_TIM2 ((DeviceAbbreviation_TMR_TypeDef *) DeviceAbbreviationTIM0_BASE)
# 5 "../system/include/cmsis/cmsis_device.h" 2
# 32 "../system/src/cortexm/exception_handlers.c" 2
# 1 "../system/include/arm/semihosting.h" 1
# 29 "../system/include/arm/semihosting.h"
#define ARM_SEMIHOSTING_H_ 




enum OperationNumber
{

  SEMIHOSTING_EnterSVC = 0x17,
  SEMIHOSTING_ReportException = 0x18,
  SEMIHOSTING_SYS_CLOSE = 0x02,
  SEMIHOSTING_SYS_CLOCK = 0x10,
  SEMIHOSTING_SYS_ELAPSED = 0x30,
  SEMIHOSTING_SYS_ERRNO = 0x13,
  SEMIHOSTING_SYS_FLEN = 0x0C,
  SEMIHOSTING_SYS_GET_CMDLINE = 0x15,
  SEMIHOSTING_SYS_HEAPINFO = 0x16,
  SEMIHOSTING_SYS_ISERROR = 0x08,
  SEMIHOSTING_SYS_ISTTY = 0x09,
  SEMIHOSTING_SYS_OPEN = 0x01,
  SEMIHOSTING_SYS_READ = 0x06,
  SEMIHOSTING_SYS_READC = 0x07,
  SEMIHOSTING_SYS_REMOVE = 0x0E,
  SEMIHOSTING_SYS_RENAME = 0x0F,
  SEMIHOSTING_SYS_SEEK = 0x0A,
  SEMIHOSTING_SYS_SYSTEM = 0x12,
  SEMIHOSTING_SYS_TICKFREQ = 0x31,
  SEMIHOSTING_SYS_TIME = 0x11,
  SEMIHOSTING_SYS_TMPNAM = 0x0D,
  SEMIHOSTING_SYS_WRITE = 0x05,
  SEMIHOSTING_SYS_WRITEC = 0x03,
  SEMIHOSTING_SYS_WRITE0 = 0x04,


  ADP_Stopped_ApplicationExit = ((2 << 16) + 38),
  ADP_Stopped_RunTimeError = ((2 << 16) + 35),

};




#define AngelSWI_ARM 0x123456

#define AngelSWI 0xAB







#define AngelSWIInsn "bkpt"
#define AngelSWIAsm bkpt
# 97 "../system/include/arm/semihosting.h"
static inline int
__attribute__ ((always_inline))
call_host (int reason, void* arg)
{
  int value;
  asm volatile (

      " mov r0, %[rsn]  \n"
      " mov r1, %[arg]  \n"



      " " "bkpt" " %[swi] \n"

      " mov %[val], r0"

      : [val] "=r" (value)
      : [rsn] "r" (reason), [arg] "r" (arg), [swi] "i" (0xAB)
      : "r0", "r1", "r2", "r3", "ip", "lr", "memory", "cc"

  );






  return value;
}




static inline void
__attribute__ ((always_inline,noreturn))
report_exception (int reason)
{
  call_host (SEMIHOSTING_ReportException, (void*) reason);

  for (;;)
    ;
}
# 33 "../system/src/cortexm/exception_handlers.c" 2
# 1 "../system/include/diag/Trace.h" 1
# 29 "../system/include/diag/Trace.h"
#define DIAG_TRACE_H_ 



# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/unistd.h" 1 3

#define _UNISTD_H_ 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 1 3

#define _SYS_UNISTD_H 





# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_ansi.h" 1 3







#define _ANSIDECL_H_ 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/newlib.h" 1 3







#define __NEWLIB_H__ 1
# 18 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/newlib.h" 3
#define _WANT_IO_C99_FORMATS 1


#define _WANT_IO_LONG_LONG 1


#define _WANT_REGISTER_FINI 1
# 40 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/newlib.h" 3
#define _MB_LEN_MAX 1
# 50 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/newlib.h" 3
#define HAVE_INITFINI_ARRAY 1



#define _ATEXIT_DYNAMIC_ALLOC 1


#define _HAVE_LONG_DOUBLE 1


#define _HAVE_CC_INHIBIT_LOOP_TO_LIBCALL 1


#define _LDBL_EQ_DBL 1


#define _FVWRITE_IN_STREAMIO 1


#define _FSEEK_OPTIMIZATION 1


#define _WIDE_ORIENT 1


#define _UNBUF_STREAM_OPT 1
# 92 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/newlib.h" 3
#define _RETARGETABLE_LOCKING 1
# 11 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/config.h" 1 3

#define __SYS_CONFIG_H__ 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 77 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/ieeefp.h" 3
#define __IEEE_LITTLE_ENDIAN 
# 453 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/ieeefp.h" 3
#define __OBSOLETE_MATH_DEFAULT 1


#define __OBSOLETE_MATH __OBSOLETE_MATH_DEFAULT
# 5 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/config.h" 2 3
# 220 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/config.h" 3
#define _POINTER_INT long





#undef __RAND_MAX



#define __RAND_MAX 0x7fffffff
# 246 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/config.h" 3
#define __EXPORT 



#define __IMPORT 






#define _READ_WRITE_RETURN_TYPE int





#define _READ_WRITE_BUFSIZE_TYPE int
# 12 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_ansi.h" 2 3
# 31 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_ansi.h" 3
#define _BEGIN_STD_C 
#define _END_STD_C 
#define _NOTHROW 



#define _LONG_DOUBLE long double





#define _ATTRIBUTE(attrs) __attribute__ (attrs)
# 69 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_ansi.h" 3
#define _ELIDABLE_INLINE static __inline__



#define _NOINLINE __attribute__ ((__noinline__))
#define _NOINLINE_STATIC _NOINLINE static
# 9 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 2 3
#define __need_size_t 
#define __need_ptrdiff_t 
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 1 3
# 41 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define _SYS_CDEFS_H_ 



# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 137 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define _PTRDIFF_T 
#define _T_PTRDIFF_ 
#define _T_PTRDIFF 
#define __PTRDIFF_T 
#define _PTRDIFF_T_ 
#define _BSD_PTRDIFF_T_ 
#define ___int_ptrdiff_t_h 
#define _GCC_PTRDIFF_T 
#define _PTRDIFF_T_DECLARED 




# 149 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 161 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 187 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define __size_t__ 
#define __SIZE_T__ 
#define _SIZE_T 
#define _SYS_SIZE_T_H 
#define _T_SIZE_ 
#define _T_SIZE 
#define __SIZE_T 
#define _SIZE_T_ 
#define _BSD_SIZE_T_ 
#define _SIZE_T_DEFINED_ 
#define _SIZE_T_DEFINED 
#define _BSD_SIZE_T_DEFINED_ 
#define _SIZE_T_DECLARED 
#define ___int_size_t_h 
#define _GCC_SIZE_T 
#define _SIZET_ 







#define __size_t 





typedef unsigned int size_t;
# 238 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 412 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_NULL
# 46 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 2 3

#define __PMT(args) args
#define __DOTS , ...
#define __THROW 


#define __ASMNAME(cname) __XSTRING (__USER_LABEL_PREFIX__) cname


#define __ptr_t void *
#define __long_double_t long double

#define __attribute_malloc__ 
#define __attribute_pure__ 
#define __attribute_format_strfmon__(a,b) 
#define __flexarr [0]


#define __bounded 
#define __unbounded 
#define __ptrvalue 
# 76 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __has_extension __has_feature


#define __has_feature(x) 0





#define __has_builtin(x) 0






#define __BEGIN_DECLS 
#define __END_DECLS 
# 105 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __GNUCLIKE_ASM 3
#define __GNUCLIKE_MATH_BUILTIN_CONSTANTS 



#define __GNUCLIKE___TYPEOF 1
#define __GNUCLIKE___OFFSETOF 1
#define __GNUCLIKE___SECTION 1


#define __GNUCLIKE_CTOR_SECTION_HANDLING 1


#define __GNUCLIKE_BUILTIN_CONSTANT_P 1






#define __GNUCLIKE_BUILTIN_VARARGS 1
#define __GNUCLIKE_BUILTIN_STDARG 1
#define __GNUCLIKE_BUILTIN_VAALIST 1



#define __GNUC_VA_LIST_COMPATIBILITY 1






#define __compiler_membar() __asm __volatile(" " : : : "memory")



#define __GNUCLIKE_BUILTIN_NEXT_ARG 1
#define __GNUCLIKE_MATH_BUILTIN_RELOPS 


#define __GNUCLIKE_BUILTIN_MEMCPY 1


#define __CC_SUPPORTS_INLINE 1
#define __CC_SUPPORTS___INLINE 1
#define __CC_SUPPORTS___INLINE__ 1

#define __CC_SUPPORTS___FUNC__ 1
#define __CC_SUPPORTS_WARNING 1

#define __CC_SUPPORTS_VARADIC_XXX 1

#define __CC_SUPPORTS_DYNAMIC_ARRAY_INIT 1
# 175 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __P(protos) protos
#define __CONCAT1(x,y) x ## y
#define __CONCAT(x,y) __CONCAT1(x,y)
#define __STRING(x) #x
#define __XSTRING(x) __STRING(x)

#define __const const
#define __signed signed
#define __volatile volatile
# 239 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __weak_symbol __attribute__((__weak__))
# 252 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __dead2 __attribute__((__noreturn__))
#define __pure2 __attribute__((__const__))
#define __unused __attribute__((__unused__))
#define __used __attribute__((__used__))
#define __packed __attribute__((__packed__))
#define __aligned(x) __attribute__((__aligned__(x)))
#define __section(x) __attribute__((__section__(x)))


#define __alloc_size(x) __attribute__((__alloc_size__(x)))




#define __alloc_align(x) __attribute__((__alloc_align__(x)))
# 356 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __generic(expr,t,yes,no) _Generic(expr, t: yes, default: no)
# 374 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __min_size(x) static (x)





#define __malloc_like __attribute__((__malloc__))
#define __pure __attribute__((__pure__))






#define __always_inline __inline__ __attribute__((__always_inline__))





#define __noinline __attribute__ ((__noinline__))





#define __nonnull(x) __attribute__((__nonnull__ x))
#define __nonnull_all __attribute__((__nonnull__))






#define __fastcall __attribute__((__fastcall__))
#define __result_use_check __attribute__((__warn_unused_result__))






#define __returns_twice __attribute__((__returns_twice__))





#define __unreachable() __builtin_unreachable()
# 442 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __restrict restrict
# 475 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __predict_true(exp) __builtin_expect((exp), 1)
#define __predict_false(exp) __builtin_expect((exp), 0)






#define __null_sentinel __attribute__((__sentinel__))
#define __exported __attribute__((__visibility__("default")))


#define __hidden __attribute__((__visibility__("hidden")))
# 497 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __offsetof(type,field) offsetof(type, field)
#define __rangeof(type,start,end) (__offsetof(type, end) - __offsetof(type, start))
# 508 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __containerof(x,s,m) ({ const volatile __typeof(((s *)0)->m) *__x = (x); __DEQUALIFY(s *, (const volatile char *)__x - __offsetof(s, m));})
# 530 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __printflike(fmtarg,firstvararg) __attribute__((__format__ (__printf__, fmtarg, firstvararg)))

#define __scanflike(fmtarg,firstvararg) __attribute__((__format__ (__scanf__, fmtarg, firstvararg)))

#define __format_arg(fmtarg) __attribute__((__format_arg__ (fmtarg)))
#define __strfmonlike(fmtarg,firstvararg) __attribute__((__format__ (__strfmon__, fmtarg, firstvararg)))

#define __strftimelike(fmtarg,firstvararg) __attribute__((__format__ (__strftime__, fmtarg, firstvararg)))
# 547 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __printf0like(fmtarg,firstvararg) 




#define __strong_reference(sym,aliassym) extern __typeof (sym) aliassym __attribute__ ((__alias__ (#sym)))




#define __weak_reference(sym,alias) __asm__(".weak " #alias); __asm__(".equ " #alias ", " #sym)


#define __warn_references(sym,msg) __asm__(".section .gnu.warning." #sym); __asm__(".asciz \"" msg "\""); __asm__(".previous")



#define __sym_compat(sym,impl,verid) __asm__(".symver " #impl ", " #sym "@" #verid)

#define __sym_default(sym,impl,verid) __asm__(".symver " #impl ", " #sym "@@" #verid)
# 601 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __FBSDID(s) struct __hack



#define __RCSID(s) struct __hack



#define __RCSID_SOURCE(s) struct __hack



#define __SCCSID(s) struct __hack



#define __COPYRIGHT(s) struct __hack



#define __DECONST(type,var) ((type)(__uintptr_t)(const void *)(var))



#define __DEVOLATILE(type,var) ((type)(__uintptr_t)(volatile void *)(var))



#define __DEQUALIFY(type,var) ((type)(__uintptr_t)(const volatile void *)(var))






#define _Nonnull 
#define _Nullable 
#define _Null_unspecified 
#define __NULLABILITY_PRAGMA_PUSH 
#define __NULLABILITY_PRAGMA_POP 
# 661 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __arg_type_tag(arg_kind,arg_idx,type_tag_idx) 
#define __datatype_type_tag(kind,type) 
# 680 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/cdefs.h" 3
#define __lock_annotate(x) 





#define __lockable __lock_annotate(lockable)


#define __locks_exclusive(...) __lock_annotate(exclusive_lock_function(__VA_ARGS__))

#define __locks_shared(...) __lock_annotate(shared_lock_function(__VA_ARGS__))



#define __trylocks_exclusive(...) __lock_annotate(exclusive_trylock_function(__VA_ARGS__))

#define __trylocks_shared(...) __lock_annotate(shared_trylock_function(__VA_ARGS__))



#define __unlocks(...) __lock_annotate(unlock_function(__VA_ARGS__))


#define __asserts_exclusive(...) __lock_annotate(assert_exclusive_lock(__VA_ARGS__))

#define __asserts_shared(...) __lock_annotate(assert_shared_lock(__VA_ARGS__))



#define __requires_exclusive(...) __lock_annotate(exclusive_locks_required(__VA_ARGS__))

#define __requires_shared(...) __lock_annotate(shared_locks_required(__VA_ARGS__))

#define __requires_unlocked(...) __lock_annotate(locks_excluded(__VA_ARGS__))



#define __no_lock_analysis __lock_annotate(no_thread_safety_analysis)


#define __guarded_by(x) __lock_annotate(guarded_by(x))
#define __pt_guarded_by(x) __lock_annotate(pt_guarded_by(x))
# 12 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 1 3
# 22 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_types.h" 1 3





#define _MACHINE__TYPES_H 
# 23 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3





typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
#define __BIT_TYPES_DEFINED__ 1
# 60 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 3
#define _SYS_TYPES_H 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 39 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define _STDDEF_H 
#define _STDDEF_H_ 

#define _ANSI_STDDEF_H 
# 161 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 267 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#define __wchar_t__ 
#define __WCHAR_T__ 
#define _WCHAR_T 
#define _T_WCHAR_ 
#define _T_WCHAR 
#define __WCHAR_T 
#define _WCHAR_T_ 
#define _BSD_WCHAR_T_ 
#define _WCHAR_T_DEFINED_ 
#define _WCHAR_T_DEFINED 
#define _WCHAR_T_H 
#define ___int_wchar_t_h 
#define __INT_WCHAR_T_H 
#define _GCC_WCHAR_T 
#define _WCHAR_T_DECLARED 
# 294 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef _BSD_WCHAR_T_
# 328 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 347 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 401 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)




#define _GCC_MAX_ALIGN_T 



typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 437 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
} max_align_t;
# 63 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 1 3
# 20 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 3
#define _SYS__TYPES_H 




# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/lock.h" 1 3

#define __SYS_LOCK_H__ 
# 33 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/lock.h" 3
struct __lock;
typedef struct __lock * _LOCK_T;
#define _LOCK_RECURSIVE_T _LOCK_T

#define __LOCK_INIT(class,lock) extern struct __lock __lock_ ## lock; class _LOCK_T lock = &__lock_ ## lock

#define __LOCK_INIT_RECURSIVE(class,lock) __LOCK_INIT(class,lock)

extern void __retarget_lock_init(_LOCK_T *lock);
#define __lock_init(lock) __retarget_lock_init(&lock)
extern void __retarget_lock_init_recursive(_LOCK_T *lock);
#define __lock_init_recursive(lock) __retarget_lock_init_recursive(&lock)
extern void __retarget_lock_close(_LOCK_T lock);
#define __lock_close(lock) __retarget_lock_close(lock)
extern void __retarget_lock_close_recursive(_LOCK_T lock);
#define __lock_close_recursive(lock) __retarget_lock_close_recursive(lock)
extern void __retarget_lock_acquire(_LOCK_T lock);
#define __lock_acquire(lock) __retarget_lock_acquire(lock)
extern void __retarget_lock_acquire_recursive(_LOCK_T lock);
#define __lock_acquire_recursive(lock) __retarget_lock_acquire_recursive(lock)
extern int __retarget_lock_try_acquire(_LOCK_T lock);
#define __lock_try_acquire(lock) __retarget_lock_try_acquire(lock)
extern int __retarget_lock_try_acquire_recursive(_LOCK_T lock);
#define __lock_try_acquire_recursive(lock) __retarget_lock_try_acquire_recursive(lock)

extern void __retarget_lock_release(_LOCK_T lock);
#define __lock_release(lock) __retarget_lock_release(lock)
extern void __retarget_lock_release_recursive(_LOCK_T lock);
#define __lock_release_recursive(lock) __retarget_lock_release_recursive(lock)
# 26 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;



typedef long _off_t;





typedef int __pid_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;







typedef unsigned short __ino_t;
# 88 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;







typedef long _fpos_t;
# 125 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 3
#undef __size_t



typedef unsigned int __size_t;
# 144 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 3
#define unsigned signed
typedef signed int _ssize_t;
#undef unsigned
# 156 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;

#define __need_wint_t 
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 161 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 347 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t




#define _WINT_T 




typedef unsigned int wint_t;

#undef __need_wint_t
# 401 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 160 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_T _flock_t;




typedef void *_iconv_t;



#define _CLOCK_T_ unsigned long


typedef unsigned long __clock_t;




#define _TIME_T_ __int_least64_t

typedef __int_least64_t __time_t;


#define _CLOCKID_T_ unsigned long


typedef unsigned long __clockid_t;

#define _TIMER_T_ unsigned long
typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 64 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3



# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/endian.h" 1 3

#define __MACHINE_ENDIAN_H__ 



# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_endian.h" 1 3
# 31 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/_endian.h" 3
#define _LITTLE_ENDIAN 1234
#define _BIG_ENDIAN 4321
#define _PDP_ENDIAN 3412




#define _BYTE_ORDER _LITTLE_ENDIAN
# 7 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/endian.h" 2 3


#define _QUAD_HIGHWORD 1
#define _QUAD_LOWWORD 0






#define LITTLE_ENDIAN _LITTLE_ENDIAN
#define BIG_ENDIAN _BIG_ENDIAN
#define PDP_ENDIAN _PDP_ENDIAN
#define BYTE_ORDER _BYTE_ORDER



#define __bswap16(_x) __builtin_bswap16(_x)
#define __bswap32(_x) __builtin_bswap32(_x)
#define __bswap64(_x) __builtin_bswap64(_x)
# 57 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/endian.h" 3
#define __htonl(_x) __bswap32(_x)
#define __htons(_x) __bswap16(_x)
#define __ntohl(_x) __bswap32(_x)
#define __ntohs(_x) __bswap16(_x)
# 68 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/select.h" 1 3

#define _SYS_SELECT_H 
# 14 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/select.h" 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_sigset.h" 1 3
# 39 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_sigset.h" 3
#define _SYS__SIGSET_H_ 

typedef unsigned long __sigset_t;
# 15 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/select.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_timeval.h" 1 3
# 30 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_timeval.h" 3
#define _SYS__TIMEVAL_H_ 




typedef __suseconds_t suseconds_t;
#define _SUSECONDS_T_DECLARED 



typedef __int_least64_t time_t;
#define __time_t_defined 
#define _TIME_T_DECLARED 




#define _TIMEVAL_DEFINED 




struct timeval {
 time_t tv_sec;
 suseconds_t tv_usec;
};




#define timerclear(tvp) ((tvp)->tv_sec = (tvp)->tv_usec = 0)
#define timerisset(tvp) ((tvp)->tv_sec || (tvp)->tv_usec)
#define timercmp(tvp,uvp,cmp) (((tvp)->tv_sec == (uvp)->tv_sec) ? ((tvp)->tv_usec cmp (uvp)->tv_usec) : ((tvp)->tv_sec cmp (uvp)->tv_sec))



#define timeradd(tvp,uvp,vvp) do { (vvp)->tv_sec = (tvp)->tv_sec + (uvp)->tv_sec; (vvp)->tv_usec = (tvp)->tv_usec + (uvp)->tv_usec; if ((vvp)->tv_usec >= 1000000) { (vvp)->tv_sec++; (vvp)->tv_usec -= 1000000; } } while (0)
# 75 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_timeval.h" 3
#define timersub(tvp,uvp,vvp) do { (vvp)->tv_sec = (tvp)->tv_sec - (uvp)->tv_sec; (vvp)->tv_usec = (tvp)->tv_usec - (uvp)->tv_usec; if ((vvp)->tv_usec < 0) { (vvp)->tv_sec--; (vvp)->tv_usec += 1000000; } } while (0)
# 16 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/select.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/timespec.h" 1 3
# 35 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/timespec.h" 3
#define _SYS_TIMESPEC_H_ 


# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_timespec.h" 1 3
# 35 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_timespec.h" 3
#define _SYS__TIMESPEC_H_ 
# 45 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_timespec.h" 3
struct timespec {
 time_t tv_sec;
 long tv_nsec;
};
# 39 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/timespec.h" 2 3


#define TIMEVAL_TO_TIMESPEC(tv,ts) do { (ts)->tv_sec = (tv)->tv_sec; (ts)->tv_nsec = (tv)->tv_usec * 1000; } while (0)




#define TIMESPEC_TO_TIMEVAL(tv,ts) do { (tv)->tv_sec = (ts)->tv_sec; (tv)->tv_usec = (ts)->tv_nsec / 1000; } while (0)
# 58 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/timespec.h" 3
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};
# 17 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/select.h" 2 3


#define _SIGSET_T_DECLARED 
typedef __sigset_t sigset_t;


#define _SYS_TYPES_FD_SET 







#define FD_SETSIZE 64


typedef unsigned long fd_mask;
#define NFDBITS (sizeof (fd_mask) * 8)

#define _howmany(x,y) (((x)+((y)-1))/(y))




typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;

#define fd_set _types_fd_set

#define FD_SET(n,p) ((p)->fds_bits[(n)/NFDBITS] |= (1L << ((n) % NFDBITS)))
#define FD_CLR(n,p) ((p)->fds_bits[(n)/NFDBITS] &= ~(1L << ((n) % NFDBITS)))
#define FD_ISSET(n,p) ((p)->fds_bits[(n)/NFDBITS] & (1L << ((n) % NFDBITS)))
#define FD_ZERO(p) (__extension__ (void)({ size_t __i; char *__tmp = (char *)p; for (__i = 0; __i < sizeof (*(p)); ++__i) *__tmp++ = 0; }))
# 60 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/select.h" 3


int select (int __n, _types_fd_set *__readfds, _types_fd_set *__writefds, _types_fd_set *__exceptfds, struct timeval *__timeout)
                                                   ;

int pselect (int __n, _types_fd_set *__readfds, _types_fd_set *__writefds, _types_fd_set *__exceptfds, const struct timespec *__timeout, const sigset_t *__set)

                           ;



# 69 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3
#define physadr physadr_t
#define quad quad_t


typedef __uint32_t in_addr_t;
#define _IN_ADDR_T_DECLARED 



typedef __uint16_t in_port_t;
#define _IN_PORT_T_DECLARED 







typedef unsigned char u_char;
#define __u_char_defined 


typedef unsigned short u_short;
#define __u_short_defined 


typedef unsigned int u_int;
#define __u_int_defined 


typedef unsigned long u_long;
#define __u_long_defined 

#define _BSDTYPES_DEFINED 




typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef __blkcnt_t blkcnt_t;
#define _BLKCNT_T_DECLARED 



typedef __blksize_t blksize_t;
#define _BLKSIZE_T_DECLARED 



typedef unsigned long clock_t;
#define __clock_t_defined 
#define _CLOCK_T_DECLARED 
# 135 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 3
typedef long daddr_t;
#define __daddr_t_defined 


typedef char * caddr_t;
#define __caddr_t_defined 



typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
#define _FSBLKCNT_T_DECLARED 



typedef __id_t id_t;
#define _ID_T_DECLARED 



typedef __ino_t ino_t;
#define _INO_T_DECLARED 
# 173 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;
#define _OFF_T_DECLARED 


typedef __dev_t dev_t;
#define _DEV_T_DECLARED 


typedef __uid_t uid_t;
#define _UID_T_DECLARED 


typedef __gid_t gid_t;
#define _GID_T_DECLARED 



typedef __pid_t pid_t;
#define _PID_T_DECLARED 



typedef __key_t key_t;
#define _KEY_T_DECLARED 



typedef _ssize_t ssize_t;
#define _SSIZE_T_DECLARED 



typedef __mode_t mode_t;
#define _MODE_T_DECLARED 



typedef __nlink_t nlink_t;
#define _NLINK_T_DECLARED 



typedef __clockid_t clockid_t;
#define __clockid_t_defined 
#define _CLOCKID_T_DECLARED 



typedef __timer_t timer_t;
#define __timer_t_defined 
#define _TIMER_T_DECLARED 



typedef __useconds_t useconds_t;
#define _USECONDS_T_DECLARED 







typedef __int64_t sbintime_t;


# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 19 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 3
#define _SYS__PTHREADTYPES_H_ 



# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/sched.h" 1 3
# 22 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/sched.h" 3
#define _SYS_SCHED_H_ 
# 35 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/sched.h" 3
#define SCHED_OTHER 0


#define SCHED_FIFO 1
#define SCHED_RR 2
# 48 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/sched.h" 3
struct sched_param {
  int sched_priority;
# 61 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/sched.h" 3
};
# 24 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 2 3
# 32 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef __uint32_t pthread_t;



#define PTHREAD_SCOPE_PROCESS 0
#define PTHREAD_SCOPE_SYSTEM 1


#define PTHREAD_INHERIT_SCHED 1


#define PTHREAD_EXPLICIT_SCHED 2


#define PTHREAD_CREATE_DETACHED 0
#define PTHREAD_CREATE_JOINABLE 1
# 61 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef struct {
  int is_initialized;
  void *stackaddr;
  int stacksize;
  int contentionscope;
  int inheritsched;
  int schedpolicy;
  struct sched_param schedparam;





  int detachstate;
} pthread_attr_t;
# 154 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 3
typedef __uint32_t pthread_mutex_t;

typedef struct {
  int is_initialized;
# 168 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/_pthreadtypes.h" 3
  int recursive;
} pthread_mutexattr_t;


#define _PTHREAD_MUTEX_INITIALIZER ((pthread_mutex_t) 0xFFFFFFFF)



typedef __uint32_t pthread_cond_t;

#define _PTHREAD_COND_INITIALIZER ((pthread_cond_t) 0xFFFFFFFF)

typedef struct {
  int is_initialized;
  clock_t clock;



} pthread_condattr_t;



typedef __uint32_t pthread_key_t;

typedef struct {
  int is_initialized;
  int init_executed;
} pthread_once_t;

#define _PTHREAD_ONCE_INIT { 1, 0 }
# 240 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/types.h" 2 3



#undef __need_inttypes
# 13 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 2 3

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 15 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 2 3

extern char **environ;

void _exit (int __status) __attribute__ ((__noreturn__));

int access (const char *__path, int __amode);
unsigned alarm (unsigned __secs);
int chdir (const char *__path);
int chmod (const char *__path, mode_t __mode);

int chown (const char *__path, uid_t __owner, gid_t __group);


int chroot (const char *__path);

int close (int __fildes);

size_t confstr (int __name, char *__buf, size_t __len);
# 44 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 3
int daemon (int nochdir, int noclose);

int dup (int __fildes);
int dup2 (int __fildes, int __fildes2);
# 56 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 3
void endusershell (void);




int execl (const char *__path, const char *, ...);
int execle (const char *__path, const char *, ...);
int execlp (const char *__file, const char *, ...);

int execlpe (const char *__file, const char *, ...);

int execv (const char *__path, char * const __argv[]);
int execve (const char *__path, char * const __argv[], char * const __envp[]);
int execvp (const char *__file, char * const __argv[]);




int faccessat (int __dirfd, const char *__path, int __mode, int __flags);


int fchdir (int __fildes);


int fchmod (int __fildes, mode_t __mode);



int fchown (int __fildes, uid_t __owner, gid_t __group);



int fchownat (int __dirfd, const char *__path, uid_t __owner, gid_t __group, int __flags);


int fexecve (int __fd, char * const __argv[], char * const __envp[]);

pid_t fork (void);
long fpathconf (int __fd, int __name);
int fsync (int __fd);

int fdatasync (int __fd);




char * getcwd (char *__buf, size_t __size);

int getdomainname (char *__name, size_t __len);


int getentropy (void *, size_t);


gid_t getegid (void);
uid_t geteuid (void);
gid_t getgid (void);

int getgroups (int __gidsetsize, gid_t __grouplist[]);

long gethostid (void);

char * getlogin (void);




char * getpass (const char *__prompt);
int getpagesize (void);


int getpeereid (int, uid_t *, gid_t *);


pid_t getpgid (pid_t);

pid_t getpgrp (void);
pid_t getpid (void);
pid_t getppid (void);

pid_t getsid (pid_t);


uid_t getuid (void);


char * getusershell (void);


char * getwd (char *__buf);


int iruserok (unsigned long raddr, int superuser, const char *ruser, const char *luser);

int isatty (int __fildes);

int issetugid (void);



int lchown (const char *__path, uid_t __owner, gid_t __group);


int link (const char *__path1, const char *__path2);

int linkat (int __dirfd1, const char *__path1, int __dirfd2, const char *__path2, int __flags);


int nice (int __nice_value);


off_t lseek (int __fildes, off_t __offset, int __whence);


#define F_ULOCK 0
#define F_LOCK 1
#define F_TLOCK 2
#define F_TEST 3
int lockf (int __fd, int __cmd, off_t __len);

long pathconf (const char *__path, int __name);
int pause (void);

int pthread_atfork (void (*)(void), void (*)(void), void (*)(void));

int pipe (int __fildes[2]);




ssize_t pread (int __fd, void *__buf, size_t __nbytes, off_t __offset);
ssize_t pwrite (int __fd, const void *__buf, size_t __nbytes, off_t __offset);

int read (int __fd, void *__buf, size_t __nbyte);

int rresvport (int *__alport);
int revoke (char *__path);

int rmdir (const char *__path);

int ruserok (const char *rhost, int superuser, const char *ruser, const char *luser);


void * sbrk (ptrdiff_t __incr);



int setegid (gid_t __gid);
int seteuid (uid_t __uid);

int setgid (gid_t __gid);


int setgroups (int ngroups, const gid_t *grouplist);


int sethostname (const char *, size_t);

int setpgid (pid_t __pid, pid_t __pgid);

int setpgrp (void);


int setregid (gid_t __rgid, gid_t __egid);
int setreuid (uid_t __ruid, uid_t __euid);

pid_t setsid (void);

int setuid (uid_t __uid);


void setusershell (void);

unsigned sleep (unsigned int __seconds);



long sysconf (int __name);
pid_t tcgetpgrp (int __fildes);
int tcsetpgrp (int __fildes, pid_t __pgrp_id);
char * ttyname (int __fildes);
int ttyname_r (int, char *, size_t);
int unlink (const char *__path);

int usleep (useconds_t __useconds);


int vhangup (void);

int write (int __fd, const void *__buf, size_t __nbyte);






extern char *optarg;
extern int optind, opterr, optopt;
int getopt(int, char * const [], const char *);
extern int optreset;



pid_t vfork (void);
# 283 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/unistd.h" 3
int ftruncate (int __fd, off_t __length);


int truncate (const char *, off_t __length);




int getdtablesize (void);


useconds_t ualarm (useconds_t __useconds, useconds_t __interval);





 int gethostname (char *__name, size_t __len);




int setdtablesize (int);



void sync (void);



ssize_t readlink (const char *restrict __path,
                          char *restrict __buf, size_t __buflen);
int symlink (const char *__name1, const char *__name2);


ssize_t readlinkat (int __dirfd1, const char *restrict __path,
                            char *restrict __buf, size_t __buflen);
int symlinkat (const char *, int, const char *);
int unlinkat (int, const char *, int);


#define F_OK 0
#define R_OK 4
#define W_OK 2
#define X_OK 1

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2



#define STDIN_FILENO 0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2





#define _SC_ARG_MAX 0
#define _SC_CHILD_MAX 1
#define _SC_CLK_TCK 2
#define _SC_NGROUPS_MAX 3
#define _SC_OPEN_MAX 4
#define _SC_JOB_CONTROL 5
#define _SC_SAVED_IDS 6
#define _SC_VERSION 7
#define _SC_PAGESIZE 8
#define _SC_PAGE_SIZE _SC_PAGESIZE


#define _SC_NPROCESSORS_CONF 9
#define _SC_NPROCESSORS_ONLN 10
#define _SC_PHYS_PAGES 11
#define _SC_AVPHYS_PAGES 12

#define _SC_MQ_OPEN_MAX 13
#define _SC_MQ_PRIO_MAX 14
#define _SC_RTSIG_MAX 15
#define _SC_SEM_NSEMS_MAX 16
#define _SC_SEM_VALUE_MAX 17
#define _SC_SIGQUEUE_MAX 18
#define _SC_TIMER_MAX 19
#define _SC_TZNAME_MAX 20
#define _SC_ASYNCHRONOUS_IO 21
#define _SC_FSYNC 22
#define _SC_MAPPED_FILES 23
#define _SC_MEMLOCK 24
#define _SC_MEMLOCK_RANGE 25
#define _SC_MEMORY_PROTECTION 26
#define _SC_MESSAGE_PASSING 27
#define _SC_PRIORITIZED_IO 28
#define _SC_REALTIME_SIGNALS 29
#define _SC_SEMAPHORES 30
#define _SC_SHARED_MEMORY_OBJECTS 31
#define _SC_SYNCHRONIZED_IO 32
#define _SC_TIMERS 33
#define _SC_AIO_LISTIO_MAX 34
#define _SC_AIO_MAX 35
#define _SC_AIO_PRIO_DELTA_MAX 36
#define _SC_DELAYTIMER_MAX 37
#define _SC_THREAD_KEYS_MAX 38
#define _SC_THREAD_STACK_MIN 39
#define _SC_THREAD_THREADS_MAX 40
#define _SC_TTY_NAME_MAX 41
#define _SC_THREADS 42
#define _SC_THREAD_ATTR_STACKADDR 43
#define _SC_THREAD_ATTR_STACKSIZE 44
#define _SC_THREAD_PRIORITY_SCHEDULING 45
#define _SC_THREAD_PRIO_INHERIT 46

#define _SC_THREAD_PRIO_PROTECT 47
#define _SC_THREAD_PRIO_CEILING _SC_THREAD_PRIO_PROTECT
#define _SC_THREAD_PROCESS_SHARED 48
#define _SC_THREAD_SAFE_FUNCTIONS 49
#define _SC_GETGR_R_SIZE_MAX 50
#define _SC_GETPW_R_SIZE_MAX 51
#define _SC_LOGIN_NAME_MAX 52
#define _SC_THREAD_DESTRUCTOR_ITERATIONS 53
#define _SC_ADVISORY_INFO 54
#define _SC_ATEXIT_MAX 55
#define _SC_BARRIERS 56
#define _SC_BC_BASE_MAX 57
#define _SC_BC_DIM_MAX 58
#define _SC_BC_SCALE_MAX 59
#define _SC_BC_STRING_MAX 60
#define _SC_CLOCK_SELECTION 61
#define _SC_COLL_WEIGHTS_MAX 62
#define _SC_CPUTIME 63
#define _SC_EXPR_NEST_MAX 64
#define _SC_HOST_NAME_MAX 65
#define _SC_IOV_MAX 66
#define _SC_IPV6 67
#define _SC_LINE_MAX 68
#define _SC_MONOTONIC_CLOCK 69
#define _SC_RAW_SOCKETS 70
#define _SC_READER_WRITER_LOCKS 71
#define _SC_REGEXP 72
#define _SC_RE_DUP_MAX 73
#define _SC_SHELL 74
#define _SC_SPAWN 75
#define _SC_SPIN_LOCKS 76
#define _SC_SPORADIC_SERVER 77
#define _SC_SS_REPL_MAX 78
#define _SC_SYMLOOP_MAX 79
#define _SC_THREAD_CPUTIME 80
#define _SC_THREAD_SPORADIC_SERVER 81
#define _SC_TIMEOUTS 82
#define _SC_TRACE 83
#define _SC_TRACE_EVENT_FILTER 84
#define _SC_TRACE_EVENT_NAME_MAX 85
#define _SC_TRACE_INHERIT 86
#define _SC_TRACE_LOG 87
#define _SC_TRACE_NAME_MAX 88
#define _SC_TRACE_SYS_MAX 89
#define _SC_TRACE_USER_EVENT_MAX 90
#define _SC_TYPED_MEMORY_OBJECTS 91
#define _SC_V7_ILP32_OFF32 92
#define _SC_V6_ILP32_OFF32 _SC_V7_ILP32_OFF32
#define _SC_XBS5_ILP32_OFF32 _SC_V7_ILP32_OFF32
#define _SC_V7_ILP32_OFFBIG 93
#define _SC_V6_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG
#define _SC_XBS5_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG
#define _SC_V7_LP64_OFF64 94
#define _SC_V6_LP64_OFF64 _SC_V7_LP64_OFF64
#define _SC_XBS5_LP64_OFF64 _SC_V7_LP64_OFF64
#define _SC_V7_LPBIG_OFFBIG 95
#define _SC_V6_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG
#define _SC_XBS5_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG
#define _SC_XOPEN_CRYPT 96
#define _SC_XOPEN_ENH_I18N 97
#define _SC_XOPEN_LEGACY 98
#define _SC_XOPEN_REALTIME 99
#define _SC_STREAM_MAX 100
#define _SC_PRIORITY_SCHEDULING 101
#define _SC_XOPEN_REALTIME_THREADS 102
#define _SC_XOPEN_SHM 103
#define _SC_XOPEN_STREAMS 104
#define _SC_XOPEN_UNIX 105
#define _SC_XOPEN_VERSION 106
#define _SC_2_CHAR_TERM 107
#define _SC_2_C_BIND 108
#define _SC_2_C_DEV 109
#define _SC_2_FORT_DEV 110
#define _SC_2_FORT_RUN 111
#define _SC_2_LOCALEDEF 112
#define _SC_2_PBS 113
#define _SC_2_PBS_ACCOUNTING 114
#define _SC_2_PBS_CHECKPOINT 115
#define _SC_2_PBS_LOCATE 116
#define _SC_2_PBS_MESSAGE 117
#define _SC_2_PBS_TRACK 118
#define _SC_2_SW_DEV 119
#define _SC_2_UPE 120
#define _SC_2_VERSION 121
#define _SC_THREAD_ROBUST_PRIO_INHERIT 122
#define _SC_THREAD_ROBUST_PRIO_PROTECT 123
#define _SC_XOPEN_UUCP 124
#define _SC_LEVEL1_ICACHE_SIZE 125
#define _SC_LEVEL1_ICACHE_ASSOC 126
#define _SC_LEVEL1_ICACHE_LINESIZE 127
#define _SC_LEVEL1_DCACHE_SIZE 128
#define _SC_LEVEL1_DCACHE_ASSOC 129
#define _SC_LEVEL1_DCACHE_LINESIZE 130
#define _SC_LEVEL2_CACHE_SIZE 131
#define _SC_LEVEL2_CACHE_ASSOC 132
#define _SC_LEVEL2_CACHE_LINESIZE 133
#define _SC_LEVEL3_CACHE_SIZE 134
#define _SC_LEVEL3_CACHE_ASSOC 135
#define _SC_LEVEL3_CACHE_LINESIZE 136
#define _SC_LEVEL4_CACHE_SIZE 137
#define _SC_LEVEL4_CACHE_ASSOC 138
#define _SC_LEVEL4_CACHE_LINESIZE 139
#define _SC_POSIX_26_VERSION 140





#define _PC_LINK_MAX 0
#define _PC_MAX_CANON 1
#define _PC_MAX_INPUT 2
#define _PC_NAME_MAX 3
#define _PC_PATH_MAX 4
#define _PC_PIPE_BUF 5
#define _PC_CHOWN_RESTRICTED 6
#define _PC_NO_TRUNC 7
#define _PC_VDISABLE 8
#define _PC_ASYNC_IO 9
#define _PC_PRIO_IO 10
#define _PC_SYNC_IO 11
#define _PC_FILESIZEBITS 12
#define _PC_2_SYMLINKS 13
#define _PC_SYMLINK_MAX 14
#define _PC_ALLOC_SIZE_MIN 15
#define _PC_REC_INCR_XFER_SIZE 16
#define _PC_REC_MAX_XFER_SIZE 17
#define _PC_REC_MIN_XFER_SIZE 18
#define _PC_REC_XFER_ALIGN 19
#define _PC_TIMESTAMP_RESOLUTION 20
# 5 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/unistd.h" 2 3
# 34 "../system/include/diag/Trace.h" 2
# 66 "../system/include/diag/Trace.h"
  
# 66 "../system/include/diag/Trace.h"
 void
  trace_initialize(void);


  ssize_t
  trace_write(const char* buf, size_t nbyte);



  int
  trace_printf(const char* format, ...);

  int
  trace_puts(const char *s);

  int
  trace_putchar(int c);

  void
  trace_dump_args(int argc, char* argv[]);
# 34 "../system/src/cortexm/exception_handlers.c" 2
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 1 3







#define _STRING_H_ 

# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/_ansi.h" 1 3
# 11 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 2 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 1 3
# 11 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
#define _SYS_REENT_H_ 


# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 15 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 2 3


#define _NULL 0



#define __Long long

# 22 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
typedef unsigned long __ULong;
# 38 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};





#define _ATEXIT_SIZE 32

struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
#define _ATEXIT_INIT {_NULL, 0, {_NULL}, {{_NULL}, {_NULL}, 0, 0}}





#define _REENT_INIT_ATEXIT _NULL, _ATEXIT_INIT,
# 117 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 178 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
#define _REENT_SMALL_CHECK_INIT(ptr) 


struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 312 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
#define _RAND48_SEED_0 (0x330e)
#define _RAND48_SEED_1 (0xabcd)
#define _RAND48_SEED_2 (0x1234)
#define _RAND48_MULT_0 (0xe66d)
#define _RAND48_MULT_1 (0xdeec)
#define _RAND48_MULT_2 (0x0005)
#define _RAND48_ADD (0x000b)
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};


#define _REENT_EMERGENCY_SIZE 25
#define _REENT_ASCTIME_SIZE 26
#define _REENT_SIGNAL_SIZE 24
# 608 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {
#define _N_LISTS 30
          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

};





#define _REENT_STDIO_STREAM(var,index) &(var)->__sf[index]


#define _REENT_INIT(var) { 0, _REENT_STDIO_STREAM(&(var), 0), _REENT_STDIO_STREAM(&(var), 1), _REENT_STDIO_STREAM(&(var), 2), 0, "", 0, _NULL, 0, _NULL, _NULL, 0, _NULL, _NULL, 0, _NULL, { { 0, _NULL, "", {0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, 1, { {_RAND48_SEED_0, _RAND48_SEED_1, _RAND48_SEED_2}, {_RAND48_MULT_0, _RAND48_MULT_1, _RAND48_MULT_2}, _RAND48_ADD }, {0, {0}}, {0, {0}}, {0, {0}}, "", "", 0, {0, {0}}, {0, {0}}, {0, {0}}, {0, {0}}, {0, {0}} } }, _REENT_INIT_ATEXIT _NULL, {_NULL, 0, _NULL} }
# 746 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
#define _REENT_INIT_PTR_ZEROED(var) { (var)->_stdin = _REENT_STDIO_STREAM(var, 0); (var)->_stdout = _REENT_STDIO_STREAM(var, 1); (var)->_stderr = _REENT_STDIO_STREAM(var, 2); (var)->_new._reent._rand_next = 1; (var)->_new._reent._r48._seed[0] = _RAND48_SEED_0; (var)->_new._reent._r48._seed[1] = _RAND48_SEED_1; (var)->_new._reent._r48._seed[2] = _RAND48_SEED_2; (var)->_new._reent._r48._mult[0] = _RAND48_MULT_0; (var)->_new._reent._r48._mult[1] = _RAND48_MULT_1; (var)->_new._reent._r48._mult[2] = _RAND48_MULT_2; (var)->_new._reent._r48._add = _RAND48_ADD; }
# 760 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
#define _REENT_CHECK_RAND48(ptr) 
#define _REENT_CHECK_MP(ptr) 
#define _REENT_CHECK_TM(ptr) 
#define _REENT_CHECK_ASCTIME_BUF(ptr) 
#define _REENT_CHECK_EMERGENCY(ptr) 
#define _REENT_CHECK_MISC(ptr) 
#define _REENT_CHECK_SIGNAL_BUF(ptr) 

#define _REENT_SIGNGAM(ptr) ((ptr)->_new._reent._gamma_signgam)
#define _REENT_RAND_NEXT(ptr) ((ptr)->_new._reent._rand_next)
#define _REENT_RAND48_SEED(ptr) ((ptr)->_new._reent._r48._seed)
#define _REENT_RAND48_MULT(ptr) ((ptr)->_new._reent._r48._mult)
#define _REENT_RAND48_ADD(ptr) ((ptr)->_new._reent._r48._add)
#define _REENT_MP_RESULT(ptr) ((ptr)->_result)
#define _REENT_MP_RESULT_K(ptr) ((ptr)->_result_k)
#define _REENT_MP_P5S(ptr) ((ptr)->_p5s)
#define _REENT_MP_FREELIST(ptr) ((ptr)->_freelist)
#define _REENT_ASCTIME_BUF(ptr) ((ptr)->_new._reent._asctime_buf)
#define _REENT_TM(ptr) (&(ptr)->_new._reent._localtime_buf)
#define _REENT_EMERGENCY(ptr) ((ptr)->_emergency)
#define _REENT_STRTOK_LAST(ptr) ((ptr)->_new._reent._strtok_last)
#define _REENT_MBLEN_STATE(ptr) ((ptr)->_new._reent._mblen_state)
#define _REENT_MBTOWC_STATE(ptr) ((ptr)->_new._reent._mbtowc_state)
#define _REENT_WCTOMB_STATE(ptr) ((ptr)->_new._reent._wctomb_state)
#define _REENT_MBRLEN_STATE(ptr) ((ptr)->_new._reent._mbrlen_state)
#define _REENT_MBRTOWC_STATE(ptr) ((ptr)->_new._reent._mbrtowc_state)
#define _REENT_MBSRTOWCS_STATE(ptr) ((ptr)->_new._reent._mbsrtowcs_state)
#define _REENT_WCRTOMB_STATE(ptr) ((ptr)->_new._reent._wcrtomb_state)
#define _REENT_WCSRTOMBS_STATE(ptr) ((ptr)->_new._reent._wcsrtombs_state)
#define _REENT_L64A_BUF(ptr) ((ptr)->_new._reent._l64a_buf)
#define _REENT_SIGNAL_BUF(ptr) ((ptr)->_new._reent._signal_buf)
#define _REENT_GETDATE_ERR_P(ptr) (&((ptr)->_new._reent._getdate_err))



#define _REENT_INIT_PTR(var) { memset((var), 0, sizeof(*(var))); _REENT_INIT_PTR_ZEROED(var); }







#define _Kmax (sizeof (size_t) << 3)







#define __ATTRIBUTE_IMPURE_PTR__ 


extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 827 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/reent.h" 3
#define _REENT _impure_ptr


#define _GLOBAL_REENT _global_impure_ptr





#define _GLOBAL_ATEXIT (_GLOBAL_REENT->_atexit)
# 12 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 2 3



#define __need_size_t 
#define __need_NULL 
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 1 3 4
# 161 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 347 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 401 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/lib/gcc/arm-none-eabi/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 18 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 2 3


# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/xlocale.h" 1 3



#define _XLOCALE_H 




struct __locale_t;
typedef struct __locale_t *locale_t;
# 21 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 2 3



# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/strings.h" 1 3
# 30 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/strings.h" 3
#define _STRINGS_H_ 
# 44 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/strings.h" 3


int bcmp(const void *, const void *, size_t) __attribute__((__pure__));
void bcopy(const void *, void *, size_t);
void bzero(void *, size_t);


void explicit_bzero(void *, size_t);


int ffs(int) __attribute__((__const__));


int ffsl(long) __attribute__((__const__));
int ffsll(long long) __attribute__((__const__));
int fls(int) __attribute__((__const__));
int flsl(long) __attribute__((__const__));
int flsll(long long) __attribute__((__const__));


char *index(const char *, int) __attribute__((__pure__));
char *rindex(const char *, int) __attribute__((__pure__));

int strcasecmp(const char *, const char *) __attribute__((__pure__));
int strncasecmp(const char *, const char *, size_t) __attribute__((__pure__));


int strcasecmp_l (const char *, const char *, locale_t);
int strncasecmp_l (const char *, const char *, size_t, locale_t);


# 25 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 2 3




void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *restrict, const void *restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);


int strcoll_l (const char *, const char *, locale_t);
char *strerror_l (int, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);


char *strtok_r (char *restrict, const char *restrict, char **restrict);


int timingsafe_bcmp (const void *, const void *, size_t);
int timingsafe_memcmp (const void *, const void *, size_t);


void * memccpy (void *restrict, const void *restrict, int, size_t);
# 76 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 3
char *stpcpy (char *restrict, const char *restrict);
char *stpncpy (char *restrict, const char *restrict, size_t);






char *strdup (const char *);

char *_strdup_r (struct _reent *, const char *);

char *strndup (const char *, size_t);

char *_strndup_r (struct _reent *, const char *, size_t);
# 100 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 3
int strerror_r (int, char *, size_t)

             __asm__ ("" "__xpg_strerror_r")

  ;







char * _strerror_r (struct _reent *, int, int, int *);


size_t strlcat (char *, const char *, size_t);
size_t strlcpy (char *, const char *, size_t);


size_t strnlen (const char *, size_t);


char *strsep (char **, const char *);


char *strnstr(const char *, const char *, size_t) __attribute__((__pure__));



char *strlwr (char *);
char *strupr (char *);



char *strsignal (int __signo);
# 175 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 3
# 1 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/sys/string.h" 1 3
# 176 "/Users/ganghyeontae/Downloads/gcc-arm-none-eabi-7-2018-q2-update/arm-none-eabi/include/string.h" 2 3


# 35 "../system/src/cortexm/exception_handlers.c" 2




# 38 "../system/src/cortexm/exception_handlers.c"
extern void
__attribute__((noreturn,weak))
_start (void);
# 51 "../system/src/cortexm/exception_handlers.c"
void __attribute__ ((section(".after_vectors"),noreturn))
Reset_Handler (void)
{
  _start ();
}
# 75 "../system/src/cortexm/exception_handlers.c"
void __attribute__ ((section(".after_vectors"),weak))
NMI_Handler (void)
{

  asm volatile ("bkpt 0");

  while (1)
    {
    }
}
# 139 "../system/src/cortexm/exception_handlers.c"
void
dumpExceptionStack (ExceptionStackFrame* frame, uint32_t lr)
{
  trace_printf ("Stack frame:\n");
  trace_printf (" R0 =  %08X\n", frame->r0);
  trace_printf (" R1 =  %08X\n", frame->r1);
  trace_printf (" R2 =  %08X\n", frame->r2);
  trace_printf (" R3 =  %08X\n", frame->r3);
  trace_printf (" R12 = %08X\n", frame->r12);
  trace_printf (" LR =  %08X\n", frame->lr);
  trace_printf (" PC =  %08X\n", frame->pc);
  trace_printf (" PSR = %08X\n", frame->psr);
  trace_printf ("Misc\n");
  trace_printf (" LR/EXC_RETURN= %08X\n", lr);
}
# 422 "../system/src/cortexm/exception_handlers.c"
void __attribute__ ((section(".after_vectors"),weak,naked))
HardFault_Handler (void)
{
  asm volatile(
      " movs r0,#4      \n"
      " mov r1,lr       \n"
      " tst r0,r1       \n"
      " beq 1f          \n"
      " mrs r0,psp      \n"
      " b   2f          \n"
      "1:               \n"
      " mrs r0,msp      \n"
      "2:"
      " mov r1,lr       \n"
      " ldr r2,=HardFault_Handler_C \n"
      " bx r2"

      :
      :
      :
  );
}

void __attribute__ ((section(".after_vectors"),weak,used))
HardFault_Handler_C (ExceptionStackFrame* frame __attribute__((unused)),
                     uint32_t lr __attribute__((unused)))
{




  trace_printf ("[HardFault]\n");
  dumpExceptionStack (frame, lr);



  asm volatile ("bkpt 0");

  while (1)
    {
    }
}
# 576 "../system/src/cortexm/exception_handlers.c"
void __attribute__ ((section(".after_vectors"),weak))
SVC_Handler (void)
{

  asm volatile ("bkpt 0");

  while (1)
    {
    }
}
# 602 "../system/src/cortexm/exception_handlers.c"
void __attribute__ ((section(".after_vectors"),weak))
PendSV_Handler (void)
{

  asm volatile ("bkpt 0");

  while (1)
    {
    }
}

void __attribute__ ((section(".after_vectors"),weak))
SysTick_Handler (void)
{


  ;
}
