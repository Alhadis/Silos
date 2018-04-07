# $Id: autoconf.sed,v 1.18 2004/06/17 21:10:22 dm Exp $

1i\
#ifndef _DC_AUTOCONF_H_\
#define _DC_AUTOCONF_H_ 1
$a\
\
#endif /* !_DC_AUTOCONF_H_ */

/^#define inline/b skip
/^#define xdr_ops_t/b skip
/^#define [a-z]/b pdefine

/ TIME_WITH_SYS_TIME/b pdefine
/ HAVE_SYS_TIME_H/b pdefine
/ HAVE_TIMES/b pdefine
/ HAVE_SYS_STAT_H/b pdefine
/ HAVE_SYS_TYPES_H/b pdefine
/ HAVE_SYS_FILE_H/b pdefine
/ STDC_HEADERS/b pdefine
/ DMALLOC/b pdefine
/ DMALLOC_VERSION_MAJOR/b pdefine
/ HAVE_STRCHR/b pdefine
/ HAVE_STRRCHR/b pdefine
/ HAVE_MEMCPY/b pdefine
/ HAVE_BZERO/b pdefine
/ HAVE_MEMORY_H/b pdefine
/ HAVE_ISXDIGIT/b pdefine
/ HAVE_SSIZE_T/b pdefine
/ HAVE_INT32_T/b pdefine
/ HAVE_U_INT32_T/b pdefine
/ HAVE_U_INT16_T/b pdefine
/ HAVE_U_INT8_T/b pdefine
/ HAVE_MODE_T/b pdefine
/ HAVE_U_CHAR/b pdefine
/ HAVE_U_INT/b pdefine
/ HAVE_U_LONG/b pdefine
/ HAVE_INT64_T/b pdefine
/ SIZEOF_LONG/b pdefine
/ SIZEOF_LONG_LONG/b pdefine
/ HAVE_U_INT64_T/b pdefine


/ HAVE_GMP_CXX_OPS/b pdefine
/ SIZEOF_SHORT/b pdefine
/ SIZEOF_INT/b pdefine
/ HAVE_OFF_T_64/b pdefine
/ HAVE_STDLIB_H/b pdefine
/ HAVE_STDINT_H/b pdefine
/ HAVE_UNISTD_H/b pdefine
/ HAVE_SYS_FILIO_H/b pdefine
/ HAVE_SYS_RUSAGE_H/b pdefine
/ HAVE_SYS_SOCKIO_H/b pdefine
/ HAVE_SYS_WAIT_H/b pdefine
/ HAVE_TIMESPEC/b pdefine
/ WORDS_BIGENDIAN/b pdefine

:skip
d
n

:pdefine
s/#define \([^ ]*\).*/\
#ifndef \1\
&\
#endif/p
d
