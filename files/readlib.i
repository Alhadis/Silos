# 1 "readlib.c"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/git/elf//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/libc-modules.h" 1
# 1 "<command-line>" 2
# 1 "./../include/libc-symbols.h" 1
# 85 "./../include/libc-symbols.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/config.h" 1
# 86 "./../include/libc-symbols.h" 2
# 847 "./../include/libc-symbols.h"
# 1 "../sysdeps/generic/symbol-hacks.h" 1
# 848 "./../include/libc-symbols.h" 2
# 1 "<command-line>" 2
# 1 "readlib.c"
# 24 "readlib.c"
# 1 "../sysdeps/unix/sysv/linux/a.out.h" 1



# 1 "../sysdeps/unix/sysv/linux/x86/bits/a.out.h" 1
# 5 "../sysdeps/unix/sysv/linux/a.out.h" 2



struct exec
{
  unsigned long a_info;
  unsigned int a_text;
  unsigned int a_data;
  unsigned int a_bss;
  unsigned int a_syms;
  unsigned int a_entry;
  unsigned int a_trsize;
  unsigned int a_drsize;
};

enum machine_type
{
  M_OLDSUN2 = 0,
  M_68010 = 1,
  M_68020 = 2,
  M_SPARC = 3,
  M_386 = 100,
  M_MIPS1 = 151,
  M_MIPS2 = 152
};
# 90 "../sysdeps/unix/sysv/linux/a.out.h"
struct nlist
{
  union
    {
      char *n_name;
      struct nlist *n_next;
      long n_strx;
    } n_un;
  unsigned char n_type;
  char n_other;
  short n_desc;
  unsigned long n_value;
};
# 127 "../sysdeps/unix/sysv/linux/a.out.h"
struct relocation_info
{
  int r_address;
  unsigned int r_symbolnum:24;
  unsigned int r_pcrel:1;
  unsigned int r_length:2;
  unsigned int r_extern:1;
  unsigned int r_pad:4;
};
# 25 "readlib.c" 2
# 1 "../include/elf.h" 1

# 1 "../elf/elf.h" 1
# 22 "../elf/elf.h"
# 1 "../include/features.h" 1
# 406 "../include/features.h"
# 1 "../include/stdc-predef.h" 1
# 407 "../include/features.h" 2
# 428 "../include/features.h"
# 1 "../include/sys/cdefs.h" 1


# 1 "../misc/sys/cdefs.h" 1
# 442 "../misc/sys/cdefs.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 443 "../misc/sys/cdefs.h" 2
# 1 "../sysdeps/ieee754/ldbl-96/bits/long-double.h" 1
# 444 "../misc/sys/cdefs.h" 2
# 4 "../include/sys/cdefs.h" 2
# 12 "../include/sys/cdefs.h"
extern void __chk_fail (void) __attribute__ ((__noreturn__));


# 429 "../include/features.h" 2
# 452 "../include/features.h"
# 1 "../include/gnu/stubs.h" 1
# 453 "../include/features.h" 2
# 23 "../elf/elf.h" 2





# 1 "../sysdeps/generic/stdint.h" 1
# 26 "../sysdeps/generic/stdint.h"
# 1 "../bits/libc-header-start.h" 1
# 27 "../sysdeps/generic/stdint.h" 2
# 1 "../include/bits/types.h" 1
# 1 "../posix/bits/types.h" 1
# 27 "../posix/bits/types.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 28 "../posix/bits/types.h" 2


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 140 "../posix/bits/types.h"
# 1 "../sysdeps/unix/sysv/linux/x86/bits/typesizes.h" 1
# 141 "../posix/bits/types.h" 2


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 1 "../include/bits/types.h" 2
# 28 "../sysdeps/generic/stdint.h" 2
# 1 "../bits/wchar.h" 1
# 29 "../sysdeps/generic/stdint.h" 2
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 30 "../sysdeps/generic/stdint.h" 2




# 1 "../bits/stdint-intn.h" 1
# 22 "../bits/stdint-intn.h"
# 1 "../include/bits/types.h" 1
# 23 "../bits/stdint-intn.h" 2

typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 35 "../sysdeps/generic/stdint.h" 2


# 1 "../bits/stdint-uintn.h" 1
# 22 "../bits/stdint-uintn.h"
# 1 "../include/bits/types.h" 1
# 23 "../bits/stdint-uintn.h" 2

typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
# 38 "../sysdeps/generic/stdint.h" 2





typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;


typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;





typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 71 "../sysdeps/generic/stdint.h"
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 87 "../sysdeps/generic/stdint.h"
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 101 "../sysdeps/generic/stdint.h"
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
# 29 "../elf/elf.h" 2


typedef uint16_t Elf32_Half;
typedef uint16_t Elf64_Half;


typedef uint32_t Elf32_Word;
typedef int32_t Elf32_Sword;
typedef uint32_t Elf64_Word;
typedef int32_t Elf64_Sword;


typedef uint64_t Elf32_Xword;
typedef int64_t Elf32_Sxword;
typedef uint64_t Elf64_Xword;
typedef int64_t Elf64_Sxword;


typedef uint32_t Elf32_Addr;
typedef uint64_t Elf64_Addr;


typedef uint32_t Elf32_Off;
typedef uint64_t Elf64_Off;


typedef uint16_t Elf32_Section;
typedef uint16_t Elf64_Section;


typedef Elf32_Half Elf32_Versym;
typedef Elf64_Half Elf64_Versym;






typedef struct
{
  unsigned char e_ident[(16)];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct
{
  unsigned char e_ident[(16)];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;
# 384 "../elf/elf.h"
typedef struct
{
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct
{
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 491 "../elf/elf.h"
typedef struct
{
  Elf32_Word ch_type;
  Elf32_Word ch_size;
  Elf32_Word ch_addralign;
} Elf32_Chdr;

typedef struct
{
  Elf64_Word ch_type;
  Elf64_Word ch_reserved;
  Elf64_Xword ch_size;
  Elf64_Xword ch_addralign;
} Elf64_Chdr;
# 518 "../elf/elf.h"
typedef struct
{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Section st_shndx;
} Elf32_Sym;

typedef struct
{
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Section st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct
{
  Elf32_Half si_boundto;
  Elf32_Half si_flags;
} Elf32_Syminfo;

typedef struct
{
  Elf64_Half si_boundto;
  Elf64_Half si_flags;
} Elf64_Syminfo;
# 633 "../elf/elf.h"
typedef struct
{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;






typedef struct
{
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;



typedef struct
{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct
{
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;
# 678 "../elf/elf.h"
typedef struct
{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct
{
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 819 "../elf/elf.h"
typedef struct
{
  Elf32_Sword d_tag;
  union
    {
      Elf32_Word d_val;
      Elf32_Addr d_ptr;
    } d_un;
} Elf32_Dyn;

typedef struct
{
  Elf64_Sxword d_tag;
  union
    {
      Elf64_Xword d_val;
      Elf64_Addr d_ptr;
    } d_un;
} Elf64_Dyn;
# 998 "../elf/elf.h"
typedef struct
{
  Elf32_Half vd_version;
  Elf32_Half vd_flags;
  Elf32_Half vd_ndx;
  Elf32_Half vd_cnt;
  Elf32_Word vd_hash;
  Elf32_Word vd_aux;
  Elf32_Word vd_next;

} Elf32_Verdef;

typedef struct
{
  Elf64_Half vd_version;
  Elf64_Half vd_flags;
  Elf64_Half vd_ndx;
  Elf64_Half vd_cnt;
  Elf64_Word vd_hash;
  Elf64_Word vd_aux;
  Elf64_Word vd_next;

} Elf64_Verdef;
# 1040 "../elf/elf.h"
typedef struct
{
  Elf32_Word vda_name;
  Elf32_Word vda_next;

} Elf32_Verdaux;

typedef struct
{
  Elf64_Word vda_name;
  Elf64_Word vda_next;

} Elf64_Verdaux;




typedef struct
{
  Elf32_Half vn_version;
  Elf32_Half vn_cnt;
  Elf32_Word vn_file;

  Elf32_Word vn_aux;
  Elf32_Word vn_next;

} Elf32_Verneed;

typedef struct
{
  Elf64_Half vn_version;
  Elf64_Half vn_cnt;
  Elf64_Word vn_file;

  Elf64_Word vn_aux;
  Elf64_Word vn_next;

} Elf64_Verneed;
# 1087 "../elf/elf.h"
typedef struct
{
  Elf32_Word vna_hash;
  Elf32_Half vna_flags;
  Elf32_Half vna_other;
  Elf32_Word vna_name;
  Elf32_Word vna_next;

} Elf32_Vernaux;

typedef struct
{
  Elf64_Word vna_hash;
  Elf64_Half vna_flags;
  Elf64_Half vna_other;
  Elf64_Word vna_name;
  Elf64_Word vna_next;

} Elf64_Vernaux;
# 1121 "../elf/elf.h"
typedef struct
{
  uint32_t a_type;
  union
    {
      uint32_t a_val;



    } a_un;
} Elf32_auxv_t;

typedef struct
{
  uint64_t a_type;
  union
    {
      uint64_t a_val;



    } a_un;
} Elf64_auxv_t;
# 1220 "../elf/elf.h"
typedef struct
{
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;

typedef struct
{
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;
# 1340 "../elf/elf.h"
typedef struct
{
  Elf32_Xword m_value;
  Elf32_Word m_info;
  Elf32_Word m_poffset;
  Elf32_Half m_repeat;
  Elf32_Half m_stride;
} Elf32_Move;

typedef struct
{
  Elf64_Xword m_value;
  Elf64_Xword m_info;
  Elf64_Xword m_poffset;
  Elf64_Half m_repeat;
  Elf64_Half m_stride;
} Elf64_Move;
# 1729 "../elf/elf.h"
typedef union
{
  struct
    {
      Elf32_Word gt_current_g_value;
      Elf32_Word gt_unused;
    } gt_header;
  struct
    {
      Elf32_Word gt_g_value;
      Elf32_Word gt_bytes;
    } gt_entry;
} Elf32_gptab;



typedef struct
{
  Elf32_Word ri_gprmask;
  Elf32_Word ri_cprmask[4];
  Elf32_Sword ri_gp_value;
} Elf32_RegInfo;



typedef struct
{
  unsigned char kind;

  unsigned char size;
  Elf32_Section section;

  Elf32_Word info;
} Elf_Options;
# 1805 "../elf/elf.h"
typedef struct
{
  Elf32_Word hwp_flags1;
  Elf32_Word hwp_flags2;
} Elf_Options_Hw;
# 1971 "../elf/elf.h"
typedef struct
{
  Elf32_Word l_name;
  Elf32_Word l_time_stamp;
  Elf32_Word l_checksum;
  Elf32_Word l_version;
  Elf32_Word l_flags;
} Elf32_Lib;

typedef struct
{
  Elf64_Word l_name;
  Elf64_Word l_time_stamp;
  Elf64_Word l_checksum;
  Elf64_Word l_version;
  Elf64_Word l_flags;
} Elf64_Lib;
# 2002 "../elf/elf.h"
typedef Elf32_Addr Elf32_Conflict;

typedef struct
{

  Elf32_Half version;

  unsigned char isa_level;

  unsigned char isa_rev;

  unsigned char gpr_size;

  unsigned char cpr1_size;

  unsigned char cpr2_size;

  unsigned char fp_abi;

  Elf32_Word isa_ext;

  Elf32_Word ases;

  Elf32_Word flags1;
  Elf32_Word flags2;
} Elf_MIPS_ABIFlags_v0;
# 2078 "../elf/elf.h"
enum
{

  Val_GNU_MIPS_ABI_FP_ANY = 0,

  Val_GNU_MIPS_ABI_FP_DOUBLE = 1,

  Val_GNU_MIPS_ABI_FP_SINGLE = 2,

  Val_GNU_MIPS_ABI_FP_SOFT = 3,

  Val_GNU_MIPS_ABI_FP_OLD_64 = 4,

  Val_GNU_MIPS_ABI_FP_XX = 5,

  Val_GNU_MIPS_ABI_FP_64 = 6,

  Val_GNU_MIPS_ABI_FP_64A = 7,

  Val_GNU_MIPS_ABI_FP_MAX = 7
};
# 3935 "../elf/elf.h"

# 3 "../include/elf.h" 2



# 1 "../include/libc-pointer-arith.h" 1
# 7 "../include/elf.h" 2
# 20 "../include/elf.h"
# 1 "../sysdeps/generic/dl-dtprocnum.h" 1
# 21 "../include/elf.h" 2
# 26 "readlib.c" 2
# 1 "../include/error.h" 1
# 1 "../misc/error.h" 1
# 25 "../misc/error.h"






extern void error (int __status, int __errnum, const char *__format, ...)
     __attribute__ ((__format__ (__printf__, 3, 4)));

extern void error_at_line (int __status, int __errnum, const char *__fname,
      unsigned int __lineno, const char *__format, ...)
     __attribute__ ((__format__ (__printf__, 5, 6)));




extern void (*error_print_progname) (void);


extern unsigned int error_message_count;



extern int error_one_per_line;



# 1 "../include/bits/error.h" 1
# 1 "../include/bits/../../misc/bits/error.h" 1
# 24 "../include/bits/../../misc/bits/error.h"
extern void __error_alias (int __status, int __errnum, const char *__format, ...) __asm__ ("" "error")


  __attribute__ ((__format__ (__printf__, 3, 4)));
extern void __error_noreturn (int __status, int __errnum, const char *__format, ...) __asm__ ("" "error")


  __attribute__ ((__noreturn__, __format__ (__printf__, 3, 4)));




extern __inline __attribute__ ((__always_inline__)) void
error (int __status, int __errnum, const char *__format, ...)
{
  if (__builtin_constant_p (__status) && __status != 0)
    __error_noreturn (__status, __errnum, __format, __builtin_va_arg_pack ());
  else
    __error_alias (__status, __errnum, __format, __builtin_va_arg_pack ());
}


extern void __error_at_line_alias (int __status, int __errnum, const char *__fname, unsigned int __line, const char *__format, ...) __asm__ ("" "error_at_line")




  __attribute__ ((__format__ (__printf__, 5, 6)));
extern void __error_at_line_noreturn (int __status, int __errnum, const char *__fname, unsigned int __line, const char *__format, ...) __asm__ ("" "error_at_line")





  __attribute__ ((__noreturn__, __format__ (__printf__, 5, 6)));




extern __inline __attribute__ ((__always_inline__)) void
error_at_line (int __status, int __errnum, const char *__fname,
        unsigned int __line, const char *__format, ...)
{
  if (__builtin_constant_p (__status) && __status != 0)
    __error_at_line_noreturn (__status, __errnum, __fname, __line, __format,
         __builtin_va_arg_pack ());
  else
    __error_at_line_alias (__status, __errnum, __fname, __line,
      __format, __builtin_va_arg_pack ());
}
# 1 "../include/bits/error.h" 2
# 53 "../misc/error.h" 2



# 1 "../include/error.h" 2
# 27 "readlib.c" 2
# 1 "../include/libintl.h" 1

# 1 "../intl/libintl.h" 1
# 34 "../intl/libintl.h"





extern char *gettext (const char *__msgid)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (1)));



extern char *dgettext (const char *__domainname, const char *__msgid)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));
extern char *__dgettext (const char *__domainname, const char *__msgid)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));



extern char *dcgettext (const char *__domainname,
   const char *__msgid, int __category)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));
extern char *__dcgettext (const char *__domainname,
     const char *__msgid, int __category)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));




extern char *ngettext (const char *__msgid1, const char *__msgid2,
         unsigned long int __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (1))) __attribute__ ((__format_arg__ (2)));



extern char *dngettext (const char *__domainname, const char *__msgid1,
   const char *__msgid2, unsigned long int __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));



extern char *dcngettext (const char *__domainname, const char *__msgid1,
    const char *__msgid2, unsigned long int __n,
    int __category)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));





extern char *textdomain (const char *__domainname) __attribute__ ((__nothrow__ ));



extern char *bindtextdomain (const char *__domainname,
        const char *__dirname) __attribute__ ((__nothrow__ ));



extern char *bind_textdomain_codeset (const char *__domainname,
          const char *__codeset) __attribute__ ((__nothrow__ ));







# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 101 "../intl/libintl.h" 2


# 1 "../include/locale.h" 1

# 1 "../locale/locale.h" 1
# 28 "../locale/locale.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 29 "../locale/locale.h" 2
# 1 "../include/bits/locale.h" 1
# 1 "../locale/bits/locale.h" 1
# 1 "../include/bits/locale.h" 2
# 30 "../locale/locale.h" 2


# 51 "../locale/locale.h"
struct lconv
{


  char *decimal_point;
  char *thousands_sep;





  char *grouping;





  char *int_curr_symbol;
  char *currency_symbol;
  char *mon_decimal_point;
  char *mon_thousands_sep;
  char *mon_grouping;
  char *positive_sign;
  char *negative_sign;
  char int_frac_digits;
  char frac_digits;

  char p_cs_precedes;

  char p_sep_by_space;

  char n_cs_precedes;

  char n_sep_by_space;






  char p_sign_posn;
  char n_sign_posn;


  char int_p_cs_precedes;

  char int_p_sep_by_space;

  char int_n_cs_precedes;

  char int_n_sep_by_space;






  char int_p_sign_posn;
  char int_n_sign_posn;
# 118 "../locale/locale.h"
};



extern char *setlocale (int __category, const char *__locale) __attribute__ ((__nothrow__ ));


extern struct lconv *localeconv (void) __attribute__ ((__nothrow__ ));
# 135 "../locale/locale.h"
# 1 "../include/bits/types/locale_t.h" 1
# 1 "../locale/bits/types/locale_t.h" 1
# 22 "../locale/bits/types/locale_t.h"
# 1 "../include/bits/types/__locale_t.h" 1
# 1 "../locale/bits/types/__locale_t.h" 1
# 28 "../locale/bits/types/__locale_t.h"
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 1 "../include/bits/types/__locale_t.h" 2
# 23 "../locale/bits/types/locale_t.h" 2

typedef __locale_t locale_t;
# 1 "../include/bits/types/locale_t.h" 2
# 136 "../locale/locale.h" 2





extern locale_t newlocale (int __category_mask, const char *__locale,
      locale_t __base) __attribute__ ((__nothrow__ ));
# 176 "../locale/locale.h"
extern locale_t duplocale (locale_t __dataset) __attribute__ ((__nothrow__ ));



extern void freelocale (locale_t __dataset) __attribute__ ((__nothrow__ ));






extern locale_t uselocale (locale_t __dataset) __attribute__ ((__nothrow__ ));








# 3 "../include/locale.h" 2


extern __typeof (uselocale) __uselocale;







extern struct loaded_l10nfile *_nl_locale_file_list[] ;


extern const struct __locale_struct _nl_C_locobj ;



extern struct lconv *__localeconv (void);


extern const char *__current_locale_name (int category) ;
# 104 "../intl/libintl.h" 2
# 121 "../intl/libintl.h"

# 3 "../include/libintl.h" 2






extern char *__gettext (const char *__msgid)
     __attribute__ ((__format_arg__ (1)));
extern char *__dgettext (const char *__domainname,
    const char *__msgid)
     __attribute__ ((__format_arg__ (2)));
extern char *__dcgettext (const char *__domainname,
     const char *__msgid, int __category)
     __attribute__ ((__format_arg__ (2)));


extern char *__ngettext (const char *__msgid1, const char *__msgid2,
    unsigned long int __n)
     __attribute__ ((__format_arg__ (1))) __attribute__ ((__format_arg__ (2)));
extern char *__dngettext (const char *__domainname,
     const char *__msgid1, const char *__msgid2,
     unsigned long int __n)
     __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));
extern char *__dcngettext (const char *__domainname,
      const char *__msgid1, const char *__msgid2,
      unsigned long int __n, int __category)
     __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));

extern char *__textdomain (const char *__domainname);
extern char *__bindtextdomain (const char *__domainname,
          const char *__dirname);
extern char *__bind_textdomain_codeset (const char *__domainname,
     const char *__codeset);

extern const char _libc_intl_domainname[];

# 28 "readlib.c" 2
# 1 "../include/link.h" 1
# 35 "../include/link.h"
# 1 "../elf/link.h" 1
# 25 "../elf/link.h"
# 1 "../include/dlfcn.h" 1

# 1 "../dlfcn/dlfcn.h" 1
# 24 "../dlfcn/dlfcn.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 221 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4

# 221 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 25 "../dlfcn/dlfcn.h" 2


# 1 "../include/bits/dlfcn.h" 1
# 1 "../bits/dlfcn.h" 1
# 57 "../bits/dlfcn.h"




# 60 "../bits/dlfcn.h"
extern void _dl_mcount_wrapper_check (void *__selfpc) __attribute__ ((__nothrow__ ));


# 2 "../include/bits/dlfcn.h" 2



# 28 "../dlfcn/dlfcn.h" 2
# 44 "../dlfcn/dlfcn.h"
typedef long int Lmid_t;











extern void *dlopen (const char *__file, int __mode) __attribute__ ((__nothrow__));



extern int dlclose (void *__handle) __attribute__ ((__nothrow__)) ;



extern void *dlsym (void *__restrict __handle,
      const char *__restrict __name) __attribute__ ((__nothrow__ )) ;



extern void *dlmopen (Lmid_t __nsid, const char *__file, int __mode) __attribute__ ((__nothrow__));



extern void *dlvsym (void *__restrict __handle,
       const char *__restrict __name,
       const char *__restrict __version)
     __attribute__ ((__nothrow__ )) ;





extern char *dlerror (void) __attribute__ ((__nothrow__ ));





typedef struct
{
  const char *dli_fname;
  void *dli_fbase;
  const char *dli_sname;
  void *dli_saddr;
} Dl_info;



extern int dladdr (const void *__address, Dl_info *__info)
     __attribute__ ((__nothrow__ )) ;


extern int dladdr1 (const void *__address, Dl_info *__info,
      void **__extra_info, int __flags) __attribute__ ((__nothrow__ )) ;




enum
  {

    RTLD_DL_SYMENT = 1,


    RTLD_DL_LINKMAP = 2
  };







extern int dlinfo (void *__restrict __handle,
     int __request, void *__restrict __arg)
     __attribute__ ((__nothrow__ )) ;


enum
  {

    RTLD_DI_LMID = 1,



    RTLD_DI_LINKMAP = 2,

    RTLD_DI_CONFIGADDR = 3,






    RTLD_DI_SERINFO = 4,
    RTLD_DI_SERINFOSIZE = 5,



    RTLD_DI_ORIGIN = 6,

    RTLD_DI_PROFILENAME = 7,
    RTLD_DI_PROFILEOUT = 8,




    RTLD_DI_TLS_MODID = 9,





    RTLD_DI_TLS_DATA = 10,

    RTLD_DI_MAX = 10
  };




typedef struct
{
  char *dls_name;
  unsigned int dls_flags;
} Dl_serpath;



typedef struct
{
  size_t dls_size;
  unsigned int dls_cnt;
  Dl_serpath dls_serpath[1];
} Dl_serinfo;




# 3 "../include/dlfcn.h" 2

# 1 "../include/link.h" 1
# 5 "../include/dlfcn.h" 2
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stdbool.h" 1 3 4
# 6 "../include/dlfcn.h" 2
# 24 "../include/dlfcn.h"
extern int __libc_argc ;
extern char **__libc_argv ;
# 57 "../include/dlfcn.h"
extern void *__libc_dlopen_mode (const char *__name, int __mode);
extern void *__libc_dlsym (void *__map, const char *__name);
extern void *__libc_dlvsym (void *map, const char *name, const char *version);
extern int __libc_dlclose (void *__map);




# 73 "../include/dlfcn.h"
struct link_map_public;


extern void _dl_close (void *map) ;


extern void _dl_close_worker (struct link_map_public *map, 
# 79 "../include/dlfcn.h" 3 4
                                                   _Bool 
# 79 "../include/dlfcn.h"
                                                        force)
    ;




extern void *_dl_sym (void *handle, const char *name, void *who);





extern void *_dl_vsym (void *handle, const char *name, const char *version,
         void *who);





extern int _dlerror_run (void (*operate) (void *), void *args)
    ;
# 109 "../include/dlfcn.h"
struct dlfcn_hook
{
  void *(*dlopen) (const char *file, int mode, void *dl_caller);
  int (*dlclose) (void *handle);
  void *(*dlsym) (void *handle, const char *name, void *dl_caller);
  void *(*dlvsym) (void *handle, const char *name, const char *version,
     void *dl_caller);
  char *(*dlerror) (void);
  int (*dladdr) (const void *address, Dl_info *info);
  int (*dladdr1) (const void *address, Dl_info *info,
    void **extra_info, int flags);
  int (*dlinfo) (void *handle, int request, void *arg, void *dl_caller);
  void *(*dlmopen) (Lmid_t nsid, const char *file, int mode, void *dl_caller);
  void *pad[4];
};

extern struct dlfcn_hook *_dlfcn_hook;


extern void *__dlopen (const char *file, int mode , void *dl_caller)
     ;
extern void *__dlmopen (Lmid_t nsid, const char *file, int mode , void *dl_caller)
     ;
extern int __dlclose (void *handle)
     ;
extern void *__dlsym (void *handle, const char *name , void *dl_caller)
     ;
extern void *__dlvsym (void *handle, const char *name, const char *version
         , void *dl_caller)
     ;
extern char *__dlerror (void)
     ;
extern int __dladdr (const void *address, Dl_info *info)
     ;
extern int __dladdr1 (const void *address, Dl_info *info,
        void **extra_info, int flags)
     ;
extern int __dlinfo (void *handle, int request, void *arg , void *dl_caller)
     ;


struct link_map_public;
extern void * __libc_dlsym_private (struct link_map_public *map, const char *name)
     ;
extern void __libc_register_dl_open_hook (struct link_map_public *map)
     ;
extern void __libc_register_dlfcn_hook (struct link_map_public *map)
     ;


extern void __dlerror_main_freeres (void) ;
# 26 "../elf/link.h" 2
# 1 "../include/sys/types.h" 1
# 1 "../posix/sys/types.h" 1
# 27 "../posix/sys/types.h"


# 1 "../include/bits/types.h" 1
# 30 "../posix/sys/types.h" 2



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __loff_t loff_t;




typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;




typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;




# 1 "../include/bits/types/clock_t.h" 1
# 1 "../time/bits/types/clock_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/clock_t.h" 2


typedef __clock_t clock_t;
# 1 "../include/bits/types/clock_t.h" 2
# 127 "../posix/sys/types.h" 2

# 1 "../include/bits/types/clockid_t.h" 1
# 1 "../time/bits/types/clockid_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/clockid_t.h" 2


typedef __clockid_t clockid_t;
# 1 "../include/bits/types/clockid_t.h" 2
# 129 "../posix/sys/types.h" 2
# 1 "../include/bits/types/time_t.h" 1
# 1 "../time/bits/types/time_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/time_t.h" 2


typedef __time_t time_t;
# 1 "../include/bits/types/time_t.h" 2
# 130 "../posix/sys/types.h" 2
# 1 "../include/bits/types/timer_t.h" 1
# 1 "../time/bits/types/timer_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/timer_t.h" 2


typedef __timer_t timer_t;
# 1 "../include/bits/types/timer_t.h" 2
# 131 "../posix/sys/types.h" 2



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 145 "../posix/sys/types.h" 2



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 177 "../posix/sys/types.h"
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 193 "../posix/sys/types.h"
# 1 "../include/endian.h" 1
# 1 "../string/endian.h" 1
# 36 "../string/endian.h"
# 1 "../sysdeps/x86/bits/endian.h" 1
# 37 "../string/endian.h" 2
# 60 "../string/endian.h"
# 1 "../bits/byteswap.h" 1
# 27 "../bits/byteswap.h"
# 1 "../include/bits/types.h" 1
# 28 "../bits/byteswap.h" 2





static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{

  return __builtin_bswap16 (__bsx);



}






static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{

  return __builtin_bswap32 (__bsx);



}
# 69 "../bits/byteswap.h"
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{

  return __builtin_bswap64 (__bsx);



}
# 61 "../string/endian.h" 2
# 1 "../bits/uintn-identity.h" 1
# 26 "../bits/uintn-identity.h"
# 1 "../include/bits/types.h" 1
# 27 "../bits/uintn-identity.h" 2





static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
# 62 "../string/endian.h" 2
# 2 "../include/endian.h" 2
# 194 "../posix/sys/types.h" 2


# 1 "../include/sys/select.h" 1

# 1 "../misc/sys/select.h" 1
# 27 "../misc/sys/select.h"
# 1 "../include/bits/types.h" 1
# 28 "../misc/sys/select.h" 2


# 1 "../sysdeps/x86/bits/select.h" 1
# 22 "../sysdeps/x86/bits/select.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 23 "../sysdeps/x86/bits/select.h" 2
# 31 "../misc/sys/select.h" 2


# 1 "../include/bits/types/sigset_t.h" 1
# 1 "../signal/bits/types/sigset_t.h" 1



# 1 "../sysdeps/unix/sysv/linux/bits/types/__sigset_t.h" 1




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "../signal/bits/types/sigset_t.h" 2


typedef __sigset_t sigset_t;
# 1 "../include/bits/types/sigset_t.h" 2
# 34 "../misc/sys/select.h" 2


# 1 "../include/bits/types/time_t.h" 1
# 37 "../misc/sys/select.h" 2
# 1 "../include/bits/types/struct_timeval.h" 1
# 1 "../time/bits/types/struct_timeval.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/struct_timeval.h" 2



struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};
# 1 "../include/bits/types/struct_timeval.h" 2
# 38 "../misc/sys/select.h" 2

# 1 "../include/bits/types/struct_timespec.h" 1
# 1 "../time/bits/types/struct_timespec.h" 1




# 1 "../include/bits/types.h" 1
# 6 "../time/bits/types/struct_timespec.h" 2



struct timespec
{
  __time_t tv_sec;
  __syscall_slong_t tv_nsec;
};
# 1 "../include/bits/types/struct_timespec.h" 2
# 40 "../misc/sys/select.h" 2
# 49 "../misc/sys/select.h"
typedef long int __fd_mask;
# 59 "../misc/sys/select.h"
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 91 "../misc/sys/select.h"

# 101 "../misc/sys/select.h"
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 113 "../misc/sys/select.h"
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 126 "../misc/sys/select.h"

# 3 "../include/sys/select.h" 2



extern int __pselect (int __nfds, fd_set *__readfds,
        fd_set *__writefds, fd_set *__exceptfds,
        const struct timespec *__timeout,
        const __sigset_t *__sigmask);

extern int __select (int __nfds, fd_set *__restrict __readfds,
       fd_set *__restrict __writefds,
       fd_set *__restrict __exceptfds,
       struct timeval *__restrict __timeout);

# 197 "../posix/sys/types.h" 2





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 236 "../posix/sys/types.h"
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "../sysdeps/nptl/bits/pthreadtypes.h" 1
# 23 "../sysdeps/nptl/bits/pthreadtypes.h"
# 1 "../sysdeps/nptl/bits/thread-shared-types.h" 1
# 77 "../sysdeps/nptl/bits/thread-shared-types.h"
# 1 "../sysdeps/x86/nptl/bits/pthreadtypes-arch.h" 1
# 21 "../sysdeps/x86/nptl/bits/pthreadtypes-arch.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 22 "../sysdeps/x86/nptl/bits/pthreadtypes-arch.h" 2
# 65 "../sysdeps/x86/nptl/bits/pthreadtypes-arch.h"
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];


  unsigned long int __pad2;


  unsigned int __flags;
# 99 "../sysdeps/x86/nptl/bits/pthreadtypes-arch.h"
};
# 78 "../sysdeps/nptl/bits/thread-shared-types.h" 2




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 118 "../sysdeps/nptl/bits/thread-shared-types.h"
struct __pthread_mutex_s
{
  int __lock ;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;
# 148 "../sysdeps/nptl/bits/thread-shared-types.h"
  int __kind;
 




  short __spins; short __elision;
  __pthread_list_t __list;
# 165 "../sysdeps/nptl/bits/thread-shared-types.h"
 
};




struct __pthread_cond_s
{
  __extension__ union
  {
    __extension__ unsigned long long int __wseq;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __wseq32;
  };
  __extension__ union
  {
    __extension__ unsigned long long int __g1_start;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __g1_start32;
  };
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
# 24 "../sysdeps/nptl/bits/pthreadtypes.h" 2



typedef unsigned long int pthread_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;




typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;





typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 245 "../posix/sys/types.h" 2



# 1 "../include/sys/types.h" 2
# 27 "../elf/link.h" 2







# 1 "../bits/elfclass.h" 1
# 9 "../bits/elfclass.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 10 "../bits/elfclass.h" 2




typedef uint32_t Elf_Symndx;
# 35 "../elf/link.h" 2
# 1 "../sysdeps/x86/bits/link.h" 1
# 68 "../sysdeps/x86/bits/link.h"
typedef float La_x86_64_xmm __attribute__ ((__vector_size__ (16)));
typedef float La_x86_64_ymm
    __attribute__ ((__vector_size__ (32), __aligned__ (16)));
typedef double La_x86_64_zmm
    __attribute__ ((__vector_size__ (64), __aligned__ (16)));




typedef union
{

  La_x86_64_ymm ymm[2];
  La_x86_64_zmm zmm[1];

  La_x86_64_xmm xmm[4];
} La_x86_64_vector __attribute__ ((__aligned__ (16)));

typedef struct La_x86_64_regs
{
  uint64_t lr_rdx;
  uint64_t lr_r8;
  uint64_t lr_r9;
  uint64_t lr_rcx;
  uint64_t lr_rsi;
  uint64_t lr_rdi;
  uint64_t lr_rbp;
  uint64_t lr_rsp;
  La_x86_64_xmm lr_xmm[8];
  La_x86_64_vector lr_vector[8];

  uint64_t lr_bnd[4];

} La_x86_64_regs;


typedef struct La_x86_64_retval
{
  uint64_t lrv_rax;
  uint64_t lrv_rdx;
  La_x86_64_xmm lrv_xmm0;
  La_x86_64_xmm lrv_xmm1;
  long double lrv_st0;
  long double lrv_st1;
  La_x86_64_vector lrv_vector0;
  La_x86_64_vector lrv_vector1;

  uint64_t lrv_bnd0;
  uint64_t lrv_bnd1;

} La_x86_64_retval;






extern Elf64_Addr la_x86_64_gnu_pltenter (Elf64_Sym *__sym,
       unsigned int __ndx,
       uintptr_t *__refcook,
       uintptr_t *__defcook,
       La_x86_64_regs *__regs,
       unsigned int *__flags,
       const char *__symname,
       long int *__framesizep);
extern unsigned int la_x86_64_gnu_pltexit (Elf64_Sym *__sym,
        unsigned int __ndx,
        uintptr_t *__refcook,
        uintptr_t *__defcook,
        const La_x86_64_regs *__inregs,
        La_x86_64_retval *__outregs,
        const char *__symname);

extern Elf32_Addr la_x32_gnu_pltenter (Elf32_Sym *__sym,
           unsigned int __ndx,
           uintptr_t *__refcook,
           uintptr_t *__defcook,
           La_x86_64_regs *__regs,
           unsigned int *__flags,
           const char *__symname,
           long int *__framesizep);
extern unsigned int la_x32_gnu_pltexit (Elf32_Sym *__sym,
     unsigned int __ndx,
     uintptr_t *__refcook,
     uintptr_t *__defcook,
     const La_x86_64_regs *__inregs,
     La_x86_64_retval *__outregs,
     const char *__symname);


# 36 "../elf/link.h" 2






struct r_debug
  {
    int r_version;

    struct link_map_public *r_map;






    Elf64_Addr r_brk;
    enum
      {


 RT_CONSISTENT,
 RT_ADD,
 RT_DELETE
      } r_state;

    Elf64_Addr r_ldbase;
  };


extern struct r_debug _r_debug;
# 76 "../elf/link.h"
extern Elf64_Dyn _DYNAMIC[];







struct link_map_public
  {



    Elf64_Addr l_addr;

    char *l_name;
    Elf64_Dyn *l_ld;
    struct link_map_public *l_next, *l_prev;
  };







enum
  {
    LA_ACT_CONSISTENT,
    LA_ACT_ADD,
    LA_ACT_DELETE
  };


enum
  {
    LA_SER_ORIG = 0x01,
    LA_SER_LIBPATH = 0x02,
    LA_SER_RUNPATH = 0x04,
    LA_SER_CONFIG = 0x08,
    LA_SER_DEFAULT = 0x40,
    LA_SER_SECURE = 0x80
  };


enum
  {
    LA_FLG_BINDTO = 0x01,
    LA_FLG_BINDFROM = 0x02
  };


enum
  {
    LA_SYMB_NOPLTENTER = 0x01,
    LA_SYMB_NOPLTEXIT = 0x02,
    LA_SYMB_STRUCTCALL = 0x04,
    LA_SYMB_DLSYM = 0x08,
    LA_SYMB_ALTVALUE = 0x10

  };

struct dl_phdr_info
  {
    Elf64_Addr dlpi_addr;
    const char *dlpi_name;
    const Elf64_Phdr *dlpi_phdr;
    Elf64_Half dlpi_phnum;







    __extension__ unsigned long long int dlpi_adds;

    __extension__ unsigned long long int dlpi_subs;



    size_t dlpi_tls_modid;




    void *dlpi_tls_data;
  };



extern int dl_iterate_phdr (int (*__callback) (struct dl_phdr_info *,
            size_t, void *),
       void *__data);





extern unsigned int la_version (unsigned int __version);
extern void la_activity (uintptr_t *__cookie, unsigned int __flag);
extern char *la_objsearch (const char *__name, uintptr_t *__cookie,
      unsigned int __flag);
extern unsigned int la_objopen_wrongproto (struct link_map_public *__map, Lmid_t __lmid,
    uintptr_t *__cookie);
extern void la_preinit (uintptr_t *__cookie);
extern uintptr_t la_symbind32 (Elf32_Sym *__sym, unsigned int __ndx,
          uintptr_t *__refcook, uintptr_t *__defcook,
          unsigned int *__flags, const char *__symname);
extern uintptr_t la_symbind64 (Elf64_Sym *__sym, unsigned int __ndx,
          uintptr_t *__refcook, uintptr_t *__defcook,
          unsigned int *__flags, const char *__symname);
extern unsigned int la_objclose (uintptr_t *__cookie);


# 36 "../include/link.h" 2






struct link_map;
extern unsigned int la_objopen (struct link_map *__map, Lmid_t __lmid,
    uintptr_t *__cookie);


# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 151 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4

# 151 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 336 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4
typedef int wchar_t;
# 435 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 446 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 3 4
} max_align_t;
# 48 "../include/link.h" 2
# 1 "../sysdeps/x86/linkmap.h" 1


# 2 "../sysdeps/x86/linkmap.h"
struct link_map_machine
  {
    Elf64_Addr plt;
    Elf64_Addr gotplt;
    void *tlsdesc_table;
  };
# 49 "../include/link.h" 2
# 1 "../sysdeps/posix/dl-fileid.h" 1
# 20 "../sysdeps/posix/dl-fileid.h"
# 1 "../include/sys/stat.h" 1

# 1 "../io/sys/stat.h" 1
# 27 "../io/sys/stat.h"
# 1 "../include/bits/types.h" 1
# 28 "../io/sys/stat.h" 2


# 1 "../include/bits/types/struct_timespec.h" 1
# 31 "../io/sys/stat.h" 2






# 1 "../include/bits/types/time_t.h" 1
# 38 "../io/sys/stat.h" 2
# 99 "../io/sys/stat.h"


# 1 "../sysdeps/unix/sysv/linux/x86/bits/stat.h" 1
# 46 "../sysdeps/unix/sysv/linux/x86/bits/stat.h"
struct stat
  {
    __dev_t st_dev;




    __ino_t st_ino;







    __nlink_t st_nlink;
    __mode_t st_mode;

    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;

    __dev_t st_rdev;




    __off_t st_size;



    __blksize_t st_blksize;

    __blkcnt_t st_blocks;
# 91 "../sysdeps/unix/sysv/linux/x86/bits/stat.h"
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 106 "../sysdeps/unix/sysv/linux/x86/bits/stat.h"
    __syscall_slong_t __glibc_reserved[3];
# 115 "../sysdeps/unix/sysv/linux/x86/bits/stat.h"
  };



struct stat64
  {
    __dev_t st_dev;

    __ino64_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;






    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;





    __blksize_t st_blksize;
    __blkcnt64_t st_blocks;







    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 164 "../sysdeps/unix/sysv/linux/x86/bits/stat.h"
    __syscall_slong_t __glibc_reserved[3];



  };
# 102 "../io/sys/stat.h" 2
# 205 "../io/sys/stat.h"
extern int stat (const char *__restrict __file,
   struct stat *__restrict __buf) __attribute__ ((__nothrow__ )) ;



extern int fstat (int __fd, struct stat *__buf) __attribute__ ((__nothrow__ )) ;
# 224 "../io/sys/stat.h"
extern int stat64 (const char *__restrict __file,
     struct stat64 *__restrict __buf) __attribute__ ((__nothrow__ )) ;
extern int fstat64 (int __fd, struct stat64 *__buf) __attribute__ ((__nothrow__ )) ;







extern int fstatat (int __fd, const char *__restrict __file,
      struct stat *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ )) ;
# 249 "../io/sys/stat.h"
extern int fstatat64 (int __fd, const char *__restrict __file,
        struct stat64 *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ )) ;







extern int lstat (const char *__restrict __file,
    struct stat *__restrict __buf) __attribute__ ((__nothrow__ )) ;
# 272 "../io/sys/stat.h"
extern int lstat64 (const char *__restrict __file,
      struct stat64 *__restrict __buf)
     __attribute__ ((__nothrow__ )) ;





extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ )) ;





extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ )) ;




extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ ));





extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
       int __flag)
     __attribute__ ((__nothrow__ )) ;






extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ ));




extern __mode_t getumask (void) __attribute__ ((__nothrow__ ));



extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ )) ;





extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ )) ;






extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ )) ;





extern int mknodat (int __fd, const char *__path, __mode_t __mode,
      __dev_t __dev) __attribute__ ((__nothrow__ )) ;





extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ )) ;





extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ )) ;





extern int utimensat (int __fd, const char *__path,
        const struct timespec __times[2],
        int __flags)
     __attribute__ ((__nothrow__ )) ;




extern int futimens (int __fd, const struct timespec __times[2]) __attribute__ ((__nothrow__ ));
# 395 "../io/sys/stat.h"
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf)
     __attribute__ ((__nothrow__ )) ;
extern int __xstat (int __ver, const char *__filename,
      struct stat *__stat_buf) __attribute__ ((__nothrow__ )) ;
extern int __lxstat (int __ver, const char *__filename,
       struct stat *__stat_buf) __attribute__ ((__nothrow__ )) ;
extern int __fxstatat (int __ver, int __fildes, const char *__filename,
         struct stat *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ )) ;
# 428 "../io/sys/stat.h"
extern int __fxstat64 (int __ver, int __fildes, struct stat64 *__stat_buf)
     __attribute__ ((__nothrow__ )) ;
extern int __xstat64 (int __ver, const char *__filename,
        struct stat64 *__stat_buf) __attribute__ ((__nothrow__ )) ;
extern int __lxstat64 (int __ver, const char *__filename,
         struct stat64 *__stat_buf) __attribute__ ((__nothrow__ )) ;
extern int __fxstatat64 (int __ver, int __fildes, const char *__filename,
    struct stat64 *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ )) ;

extern int __xmknod (int __ver, const char *__path, __mode_t __mode,
       __dev_t *__dev) __attribute__ ((__nothrow__ )) ;

extern int __xmknodat (int __ver, int __fd, const char *__path,
         __mode_t __mode, __dev_t *__dev)
     __attribute__ ((__nothrow__ )) ;


# 1 "../include/bits/statx.h" 1
# 1 "../io/bits/statx.h" 1
# 25 "../io/bits/statx.h"
struct statx_timestamp
{
  __int64_t tv_sec;
  __uint32_t tv_nsec;
  __int32_t __statx_timestamp_pad1[1];
};





struct statx
{
  __uint32_t stx_mask;
  __uint32_t stx_blksize;
  __uint64_t stx_attributes;
  __uint32_t stx_nlink;
  __uint32_t stx_uid;
  __uint32_t stx_gid;
  __uint16_t stx_mode;
  __uint16_t __statx_pad1[1];
  __uint64_t stx_ino;
  __uint64_t stx_size;
  __uint64_t stx_blocks;
  __uint64_t stx_attributes_mask;
  struct statx_timestamp stx_atime;
  struct statx_timestamp stx_btime;
  struct statx_timestamp stx_ctime;
  struct statx_timestamp stx_mtime;
  __uint32_t stx_rdev_major;
  __uint32_t stx_rdev_minor;
  __uint32_t stx_dev_major;
  __uint32_t stx_dev_minor;
  __uint64_t __statx_pad2[14];
};
# 84 "../io/bits/statx.h"



int statx (int __dirfd, const char *__restrict __path, int __flags,
           unsigned int __mask, struct statx *__restrict __buf)
  __attribute__ ((__nothrow__ )) ;


# 1 "../include/bits/statx.h" 2
# 447 "../io/sys/stat.h" 2





extern __inline int
__attribute__ ((__nothrow__ )) stat (const char *__path, struct stat *__statbuf)
{
  return __xstat (1, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ )) lstat (const char *__path, struct stat *__statbuf)
{
  return __lxstat (1, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ )) fstat (int __fd, struct stat *__statbuf)
{
  return __fxstat (1, __fd, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ )) fstatat (int __fd, const char *__filename, struct stat *__statbuf, int __flag)

{
  return __fxstatat (1, __fd, __filename, __statbuf, __flag);
}



extern __inline int
__attribute__ ((__nothrow__ )) mknod (const char *__path, __mode_t __mode, __dev_t __dev)
{
  return __xmknod (0, __path, __mode, &__dev);
}



extern __inline int
__attribute__ ((__nothrow__ )) mknodat (int __fd, const char *__path, __mode_t __mode, __dev_t __dev)

{
  return __xmknodat (0, __fd, __path, __mode, &__dev);
}





extern __inline int
__attribute__ ((__nothrow__ )) stat64 (const char *__path, struct stat64 *__statbuf)
{
  return __xstat64 (1, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ )) lstat64 (const char *__path, struct stat64 *__statbuf)
{
  return __lxstat64 (1, __path, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ )) fstat64 (int __fd, struct stat64 *__statbuf)
{
  return __fxstat64 (1, __fd, __statbuf);
}


extern __inline int
__attribute__ ((__nothrow__ )) fstatat64 (int __fd, const char *__filename, struct stat64 *__statbuf, int __flag)

{
  return __fxstatat64 (1, __fd, __filename, __statbuf, __flag);
}







# 3 "../include/sys/stat.h" 2



extern int __stat (const char *__file, struct stat *__buf);
extern int __fstat (int __fd, struct stat *__buf);
extern int __lstat (const char *__file, struct stat *__buf);
extern int __chmod (const char *__file, __mode_t __mode);

extern int __fchmod (int __fd, __mode_t __mode);
extern __mode_t __umask (__mode_t __mask);
extern int __mkdir (const char *__path, __mode_t __mode);

extern int __mknod (const char *__path,
      __mode_t __mode, __dev_t __dev);
# 25 "../include/sys/stat.h"
extern __inline__ int __stat (const char *__path, struct stat *__statbuf)
{
  return __xstat (1, __path, __statbuf);
}

extern __inline__ int __mknod (const char *__path, __mode_t __mode,
          __dev_t __dev)
{
  return __xmknod (0, __path, __mode, &__dev);
}




# 21 "../sysdeps/posix/dl-fileid.h" 2



struct r_file_id
  {
    dev_t dev;
    ino64_t ino;
  };



static inline 
# 32 "../sysdeps/posix/dl-fileid.h" 3 4
             _Bool

# 33 "../sysdeps/posix/dl-fileid.h"
_dl_get_file_id (int fd, struct r_file_id *id)
{
  struct stat64 st;

  if (__builtin_expect ((__fxstat64 (1, fd, &st) < 0), 0))
    return 
# 38 "../sysdeps/posix/dl-fileid.h" 3 4
          0
# 38 "../sysdeps/posix/dl-fileid.h"
               ;

  id->dev = st.st_dev;
  id->ino = st.st_ino;
  return 
# 42 "../sysdeps/posix/dl-fileid.h" 3 4
        1
# 42 "../sysdeps/posix/dl-fileid.h"
            ;
}


static inline 
# 46 "../sysdeps/posix/dl-fileid.h" 3 4
             _Bool

# 47 "../sysdeps/posix/dl-fileid.h"
_dl_file_id_match_p (const struct r_file_id *a, const struct r_file_id *b)
{
  return a->dev == b->dev && a->ino == b->ino;
}
# 50 "../include/link.h" 2
# 1 "../sysdeps/x86_64/dl-lookupcfg.h" 1
# 21 "../sysdeps/x86_64/dl-lookupcfg.h"
# 1 "../sysdeps/generic/dl-lookupcfg.h" 1
# 22 "../sysdeps/x86_64/dl-lookupcfg.h" 2





struct link_map;

extern void _dl_unmap (struct link_map *map) ;
# 51 "../include/link.h" 2
# 1 "../sysdeps/x86_64/nptl/tls.h" 1
# 23 "../sysdeps/x86_64/nptl/tls.h"
# 1 "../sysdeps/unix/sysv/linux/x86/include/asm/prctl.h" 1




# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/prctl.h" 1 3 4
# 6 "../sysdeps/unix/sysv/linux/x86/include/asm/prctl.h" 2
# 24 "../sysdeps/x86_64/nptl/tls.h" 2

# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 26 "../sysdeps/x86_64/nptl/tls.h" 2

# 1 "../include/stdlib.h" 1



# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 5 "../include/stdlib.h" 2

# 1 "../stdlib/stdlib.h" 1
# 25 "../stdlib/stdlib.h"
# 1 "../bits/libc-header-start.h" 1
# 26 "../stdlib/stdlib.h" 2





# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 32 "../stdlib/stdlib.h" 2







# 1 "../sysdeps/unix/sysv/linux/bits/waitflags.h" 1
# 40 "../stdlib/stdlib.h" 2
# 1 "../bits/waitstatus.h" 1
# 41 "../stdlib/stdlib.h" 2
# 55 "../stdlib/stdlib.h"
# 1 "../sysdeps/x86/bits/floatn.h" 1
# 119 "../sysdeps/x86/bits/floatn.h"
# 1 "../bits/floatn-common.h" 1
# 24 "../bits/floatn-common.h"
# 1 "../sysdeps/ieee754/ldbl-96/bits/long-double.h" 1
# 25 "../bits/floatn-common.h" 2
# 120 "../sysdeps/x86/bits/floatn.h" 2
# 56 "../stdlib/stdlib.h" 2


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;





__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
# 97 "../stdlib/stdlib.h"
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ )) ;



extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;



__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ )) ;

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;
# 140 "../stdlib/stdlib.h"
extern _Float32 strtof32 (const char *__restrict __nptr,
     char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;



extern _Float64 strtof64 (const char *__restrict __nptr,
     char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;



extern _Float128 strtof128 (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;



extern _Float32x strtof32x (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;



extern _Float64x strtof64x (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) ;
# 176 "../stdlib/stdlib.h"
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) ;

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) ;



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) ;

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) ;




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) ;

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) ;




extern int strfromd (char *__dest, size_t __size, const char *__format,
       double __f)
     __attribute__ ((__nothrow__ )) ;

extern int strfromf (char *__dest, size_t __size, const char *__format,
       float __f)
     __attribute__ ((__nothrow__ )) ;

extern int strfroml (char *__dest, size_t __size, const char *__format,
       long double __f)
     __attribute__ ((__nothrow__ )) ;
# 232 "../stdlib/stdlib.h"
extern int strfromf32 (char *__dest, size_t __size, const char * __format,
         _Float32 __f)
     __attribute__ ((__nothrow__ )) ;



extern int strfromf64 (char *__dest, size_t __size, const char * __format,
         _Float64 __f)
     __attribute__ ((__nothrow__ )) ;



extern int strfromf128 (char *__dest, size_t __size, const char * __format,
   _Float128 __f)
     __attribute__ ((__nothrow__ )) ;



extern int strfromf32x (char *__dest, size_t __size, const char * __format,
   _Float32x __f)
     __attribute__ ((__nothrow__ )) ;



extern int strfromf64x (char *__dest, size_t __size, const char * __format,
   _Float64x __f)
     __attribute__ ((__nothrow__ )) ;
# 272 "../stdlib/stdlib.h"
# 1 "../include/bits/types/locale_t.h" 1
# 273 "../stdlib/stdlib.h" 2

extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     locale_t __loc) __attribute__ ((__nothrow__ )) ;

extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, locale_t __loc)
     __attribute__ ((__nothrow__ )) ;

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    locale_t __loc)
     __attribute__ ((__nothrow__ )) ;

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, locale_t __loc)
     __attribute__ ((__nothrow__ )) ;

extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, locale_t __loc)
     __attribute__ ((__nothrow__ )) ;

extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, locale_t __loc)
     __attribute__ ((__nothrow__ )) ;

extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ )) ;
# 316 "../stdlib/stdlib.h"
extern _Float32 strtof32_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     __attribute__ ((__nothrow__ )) ;



extern _Float64 strtof64_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     __attribute__ ((__nothrow__ )) ;



extern _Float128 strtof128_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ )) ;



extern _Float32x strtof32x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ )) ;



extern _Float64x strtof64x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ )) ;
# 360 "../stdlib/stdlib.h"
extern __inline int
__attribute__ ((__nothrow__ )) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) 
# 363 "../stdlib/stdlib.h" 3 4
                                        ((void *)0)
# 363 "../stdlib/stdlib.h"
                                            , 10);
}
extern __inline long int
__attribute__ ((__nothrow__ )) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) 
# 368 "../stdlib/stdlib.h" 3 4
                                  ((void *)0)
# 368 "../stdlib/stdlib.h"
                                      , 10);
}


__extension__ extern __inline long long int
__attribute__ ((__nothrow__ )) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) 
# 375 "../stdlib/stdlib.h" 3 4
                                   ((void *)0)
# 375 "../stdlib/stdlib.h"
                                       , 10);
}
# 385 "../stdlib/stdlib.h"
extern char *l64a (long int __n) __attribute__ ((__nothrow__ )) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;




# 1 "../include/sys/types.h" 1
# 395 "../stdlib/stdlib.h" 2






extern long int random (void) __attribute__ ((__nothrow__ ));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ ));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ )) ;



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ )) ;







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ )) ;

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ )) ;

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) ;

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) ;





extern int rand (void) __attribute__ ((__nothrow__ ));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ ));



extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ ));







extern double drand48 (void) __attribute__ ((__nothrow__ ));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ )) ;


extern long int lrand48 (void) __attribute__ ((__nothrow__ ));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) ;


extern long int mrand48 (void) __attribute__ ((__nothrow__ ));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) ;


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ ));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ )) ;
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ )) ;





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) ;
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) ;


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) ;
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) ;


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) ;
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) ;


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) ;

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ )) ;

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) ;




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__));







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__));



extern void free (void *__ptr) __attribute__ ((__nothrow__ ));


# 1 "../include/alloca.h" 1


# 1 "../stdlib/alloca.h" 1
# 24 "../stdlib/alloca.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 25 "../stdlib/alloca.h" 2







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ ));






# 4 "../include/alloca.h" 2



# 1 "../include/stackinfo.h" 1
# 24 "../include/stackinfo.h"
# 1 "../sysdeps/x86_64/stackinfo.h" 1
# 25 "../include/stackinfo.h" 2
# 8 "../include/alloca.h" 2




extern void *__alloca (size_t __size);





extern int __libc_use_alloca (size_t size) __attribute__ ((const));
extern int __libc_alloca_cutoff (size_t size) __attribute__ ((const));




# 1 "../sysdeps/pthread/allocalim.h" 1
# 19 "../sysdeps/pthread/allocalim.h"
# 1 "../include/alloca.h" 1
# 20 "../sysdeps/pthread/allocalim.h" 2
# 1 "../include/limits.h" 1
# 26 "../include/limits.h"
# 1 "../bits/libc-header-start.h" 1
# 27 "../include/limits.h" 2
# 124 "../include/limits.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include-fixed/limits.h" 1 3 4
# 125 "../include/limits.h" 2
# 183 "../include/limits.h"
# 1 "../include/bits/posix1_lim.h" 1
# 1 "../posix/bits/posix1_lim.h" 1
# 27 "../posix/bits/posix1_lim.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 28 "../posix/bits/posix1_lim.h" 2
# 161 "../posix/bits/posix1_lim.h"
# 1 "../sysdeps/unix/sysv/linux/bits/local_lim.h" 1
# 38 "../sysdeps/unix/sysv/linux/bits/local_lim.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/linux/limits.h" 1 3 4
# 39 "../sysdeps/unix/sysv/linux/bits/local_lim.h" 2
# 162 "../posix/bits/posix1_lim.h" 2
# 1 "../include/bits/posix1_lim.h" 2
# 184 "../include/limits.h" 2



# 1 "../include/bits/posix2_lim.h" 1
# 1 "../posix/bits/posix2_lim.h" 1
# 1 "../include/bits/posix2_lim.h" 2
# 188 "../include/limits.h" 2



# 1 "../include/bits/xopen_lim.h" 1
# 64 "../include/bits/xopen_lim.h"
# 1 "../sysdeps/unix/sysv/linux/bits/uio_lim.h" 1
# 65 "../include/bits/xopen_lim.h" 2
# 192 "../include/limits.h" 2
# 21 "../sysdeps/pthread/allocalim.h" 2


extern __inline __attribute__ ((__always_inline__))
int
__libc_use_alloca (size_t size)
{
  return (__builtin_expect ((__libc_alloca_cutoff (size)), 1)

          || __builtin_expect ((size <= 16384 / 4), 1)

   );
}
# 25 "../include/alloca.h" 2
# 567 "../stdlib/stdlib.h" 2





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;



extern void abort (void) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ )) ;







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ )) ;






extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ )) ;





extern void exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));





extern void _Exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) __attribute__ ((__nothrow__ )) ;




extern char *secure_getenv (const char *__name)
     __attribute__ ((__nothrow__ )) ;






extern int putenv (char *__string) __attribute__ ((__nothrow__ )) ;





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ )) ;


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ )) ;






extern int clearenv (void) __attribute__ ((__nothrow__ ));
# 672 "../stdlib/stdlib.h"
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ )) ;
# 685 "../stdlib/stdlib.h"
extern int mkstemp (char *__template) ;
# 695 "../stdlib/stdlib.h"
extern int mkstemp64 (char *__template) ;
# 707 "../stdlib/stdlib.h"
extern int mkstemps (char *__template, int __suffixlen) ;
# 717 "../stdlib/stdlib.h"
extern int mkstemps64 (char *__template, int __suffixlen)
     ;
# 728 "../stdlib/stdlib.h"
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ )) ;
# 739 "../stdlib/stdlib.h"
extern int mkostemp (char *__template, int __flags) ;
# 749 "../stdlib/stdlib.h"
extern int mkostemp64 (char *__template, int __flags) ;
# 759 "../stdlib/stdlib.h"
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     ;
# 771 "../stdlib/stdlib.h"
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     ;
# 781 "../stdlib/stdlib.h"
extern int system (const char *__command) ;





extern char *canonicalize_file_name (const char *__name)
     __attribute__ ((__nothrow__ )) ;
# 797 "../stdlib/stdlib.h"
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ )) ;






typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);




extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     ;


# 1 "../bits/stdlib-bsearch.h" 1
# 19 "../bits/stdlib-bsearch.h"
extern __inline void *
bsearch (const void *__key, const void *__base, size_t __nmemb, size_t __size,
  __compar_fn_t __compar)
{
  size_t __l, __u, __idx;
  const void *__p;
  int __comparison;

  __l = 0;
  __u = __nmemb;
  while (__l < __u)
    {
      __idx = (__l + __u) / 2;
      __p = (void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
 __u = __idx;
      else if (__comparison > 0)
 __l = __idx + 1;
      else
 return (void *) __p;
    }

  return 
# 42 "../bits/stdlib-bsearch.h" 3 4
        ((void *)0)
# 42 "../bits/stdlib-bsearch.h"
            ;
}
# 823 "../stdlib/stdlib.h" 2




extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) ;

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  ;




extern int abs (int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;






extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
# 869 "../stdlib/stdlib.h"
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) ;
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) ;

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) ;
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) ;





extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ ));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ ));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ ));







extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ )) ;
# 954 "../stdlib/stdlib.h"
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ )) ;







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) __attribute__ ((__nothrow__ ));



extern int unlockpt (int __fd) __attribute__ ((__nothrow__ ));




extern char *ptsname (int __fd) __attribute__ ((__nothrow__ )) ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ )) ;


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ )) ;
# 1010 "../stdlib/stdlib.h"
# 1 "../include/bits/stdlib-float.h" 1





# 1 "../stdlib/bits/stdlib-float.h" 1
# 24 "../stdlib/bits/stdlib-float.h"
extern __inline double
__attribute__ ((__nothrow__ )) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) 
# 27 "../stdlib/bits/stdlib-float.h" 3 4
                                  ((void *)0)
# 27 "../stdlib/bits/stdlib-float.h"
                                      );
}
# 7 "../include/bits/stdlib-float.h" 2
# 1011 "../stdlib/stdlib.h" 2
# 1020 "../stdlib/stdlib.h"

# 7 "../include/stdlib.h" 2





extern __typeof (strtol_l) __strtol_l;
extern __typeof (strtoul_l) __strtoul_l;
extern __typeof (strtoll_l) __strtoll_l;
extern __typeof (strtoull_l) __strtoull_l;
extern __typeof (strtod_l) __strtod_l;
extern __typeof (strtof_l) __strtof_l;
extern __typeof (strtold_l) __strtold_l;











extern __typeof (secure_getenv) __libc_secure_getenv;



extern __typeof (qsort_r) __qsort_r;




extern long int __random (void) ;
extern void __srandom (unsigned int __seed);
extern char *__initstate (unsigned int __seed, char *__statebuf,
     size_t __statelen);
extern char *__setstate (char *__statebuf);
extern int __random_r (struct random_data *__buf, int32_t *__result)
     ;
extern int __srandom_r (unsigned int __seed, struct random_data *__buf)
     ;
extern int __initstate_r (unsigned int __seed, char *__statebuf,
     size_t __statelen, struct random_data *__buf)
     ;
extern int __setstate_r (char *__statebuf, struct random_data *__buf)
     ;
extern int __rand_r (unsigned int *__seed);
extern int __erand48_r (unsigned short int __xsubi[3],
   struct drand48_data *__buffer, double *__result)
     ;
extern int __nrand48_r (unsigned short int __xsubi[3],
   struct drand48_data *__buffer,
   long int *__result) ;
extern int __jrand48_r (unsigned short int __xsubi[3],
   struct drand48_data *__buffer,
   long int *__result) ;
extern int __srand48_r (long int __seedval,
   struct drand48_data *__buffer) ;
extern int __seed48_r (unsigned short int __seed16v[3],
         struct drand48_data *__buffer) ;
extern int __lcong48_r (unsigned short int __param[7],
   struct drand48_data *__buffer) ;


extern int __drand48_iterate (unsigned short int __xsubi[3],
         struct drand48_data *__buffer)
     ;


extern struct drand48_data __libc_drand48_data ;

extern int __setenv (const char *__name, const char *__value, int __replace)
     ;
extern int __unsetenv (const char *__name) ;
extern int __clearenv (void) ;
extern char *__mktemp (char *__template) __attribute__ ((__nothrow__ )) ;
extern char *__canonicalize_file_name (const char *__name);
extern char *__realpath (const char *__name, char *__resolved);

extern int __ptsname_r (int __fd, char *__buf, size_t __buflen)
     ;

extern int __ptsname_internal (int fd, char *buf, size_t buflen,
          struct stat64 *stp) ;

extern int __getpt (void);
extern int __posix_openpt (int __oflag) ;

extern int __add_to_environ (const char *name, const char *value,
        const char *combines, int replace)
     ;
extern void _quicksort (void *const pbase, size_t total_elems,
   size_t size, __compar_d_fn_t cmp, void *arg);

extern int __on_exit (void (*__func) (int __status, void *__arg), void *__arg);

extern int __cxa_atexit (void (*func) (void *), void *arg, void *d);
;

extern int __cxa_thread_atexit_impl (void (*func) (void *), void *arg,
         void *d);
extern void __call_tls_dtors (void)

  __attribute__ ((weak))

  ;


extern void __cxa_finalize (void *d);

extern int __posix_memalign (void **memptr, size_t alignment, size_t size);

extern void *__libc_memalign (size_t alignment, size_t size)
     __attribute__ ((__malloc__));

extern void *__libc_reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__));


extern int __libc_system (const char *line);


extern double __strtod_internal (const char *__restrict __nptr,
     char **__restrict __endptr, int __group)
     __attribute__ ((__nothrow__ )) ;
extern float __strtof_internal (const char *__restrict __nptr,
    char **__restrict __endptr, int __group)
     __attribute__ ((__nothrow__ )) ;
extern long double __strtold_internal (const char *__restrict __nptr,
           char **__restrict __endptr,
           int __group)
     __attribute__ ((__nothrow__ )) ;
extern long int __strtol_internal (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, int __group)
     __attribute__ ((__nothrow__ )) ;
extern unsigned long int __strtoul_internal (const char *__restrict __nptr,
          char **__restrict __endptr,
          int __base, int __group)
     __attribute__ ((__nothrow__ )) ;
__extension__
extern long long int __strtoll_internal (const char *__restrict __nptr,
      char **__restrict __endptr,
      int __base, int __group)
     __attribute__ ((__nothrow__ )) ;
__extension__
extern unsigned long long int __strtoull_internal (const char *
         __restrict __nptr,
         char **__restrict __endptr,
         int __base, int __group)
     __attribute__ ((__nothrow__ )) ;








extern double ____strtod_l_internal (const char *__restrict __nptr,
         char **__restrict __endptr, int __group,
         locale_t __loc);
extern float ____strtof_l_internal (const char *__restrict __nptr,
        char **__restrict __endptr, int __group,
        locale_t __loc);
extern long double ____strtold_l_internal (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __group, locale_t __loc);
extern long int ____strtol_l_internal (const char *__restrict __nptr,
           char **__restrict __endptr,
           int __base, int __group,
           locale_t __loc);
extern unsigned long int ____strtoul_l_internal (const char *
       __restrict __nptr,
       char **__restrict __endptr,
       int __base, int __group,
       locale_t __loc);
__extension__
extern long long int ____strtoll_l_internal (const char *__restrict __nptr,
          char **__restrict __endptr,
          int __base, int __group,
          locale_t __loc);
__extension__
extern unsigned long long int ____strtoull_l_internal (const char *
             __restrict __nptr,
             char **
             __restrict __endptr,
             int __base, int __group,
             locale_t __loc);



















extern float __strtof_nan (const char *, char **, char);
extern double __strtod_nan (const char *, char **, char);
extern long double __strtold_nan (const char *, char **, char);
extern float __wcstof_nan (const wchar_t *, wchar_t **, wchar_t);
extern double __wcstod_nan (const wchar_t *, wchar_t **, wchar_t);
extern long double __wcstold_nan (const wchar_t *, wchar_t **, wchar_t);












extern __typeof (strtof128_l) __strtof128_l;




extern _Float128 __strtof128_nan (const char *, char **, char);
extern _Float128 __wcstof128_nan (const wchar_t *, wchar_t **, wchar_t);




extern _Float128 __strtof128_internal (const char *__restrict __nptr,
           char **__restrict __endptr,
           int __group);


extern _Float128 ____strtof128_l_internal (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __group, locale_t __loc);




extern char *__ecvt (double __value, int __ndigit, int *__restrict __decpt,
       int *__restrict __sign);
extern char *__fcvt (double __value, int __ndigit, int *__restrict __decpt,
       int *__restrict __sign);
extern char *__gcvt (double __value, int __ndigit, char *__buf);
extern int __ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
       int *__restrict __sign, char *__restrict __buf,
       size_t __len);

extern int __fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
       int *__restrict __sign, char *__restrict __buf,
       size_t __len);

extern char *__qecvt (long double __value, int __ndigit,
        int *__restrict __decpt, int *__restrict __sign);
extern char *__qfcvt (long double __value, int __ndigit,
        int *__restrict __decpt, int *__restrict __sign);
extern char *__qgcvt (long double __value, int __ndigit, char *__buf);
extern int __qecvt_r (long double __value, int __ndigit,
        int *__restrict __decpt, int *__restrict __sign,
        char *__restrict __buf, size_t __len);

extern int __qfcvt_r (long double __value, int __ndigit,
        int *__restrict __decpt, int *__restrict __sign,
        char *__restrict __buf, size_t __len);







extern void *__default_morecore (ptrdiff_t) __attribute__ ((__nothrow__ ));


struct abort_msg_s
{
  unsigned int size;
  char msg[0];
};
extern struct abort_msg_s *__abort_msg;

# 28 "../sysdeps/x86_64/nptl/tls.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86_64/sysdep.h" 1
# 22 "../sysdeps/unix/sysv/linux/x86_64/sysdep.h"
# 1 "../sysdeps/unix/sysv/linux/sysdep.h" 1
# 18 "../sysdeps/unix/sysv/linux/sysdep.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 19 "../sysdeps/unix/sysv/linux/sysdep.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h"
# 1 "../sysdeps/unix/sysv/linux/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 2
# 20 "../sysdeps/unix/sysv/linux/sysdep.h" 2
# 23 "../sysdeps/unix/sysv/linux/x86_64/sysdep.h" 2
# 1 "../sysdeps/unix/x86_64/sysdep.h" 1
# 18 "../sysdeps/unix/x86_64/sysdep.h"
# 1 "../sysdeps/unix/sysdep.h" 1
# 18 "../sysdeps/unix/sysdep.h"
# 1 "../sysdeps/generic/sysdep.h" 1
# 97 "../sysdeps/generic/sysdep.h"
# 1 "../sysdeps/generic/dwarf2.h" 1
# 38 "../sysdeps/generic/dwarf2.h"
enum dwarf_tag
  {
    DW_TAG_padding = 0x00,
    DW_TAG_array_type = 0x01,
    DW_TAG_class_type = 0x02,
    DW_TAG_entry_point = 0x03,
    DW_TAG_enumeration_type = 0x04,
    DW_TAG_formal_parameter = 0x05,
    DW_TAG_imported_declaration = 0x08,
    DW_TAG_label = 0x0a,
    DW_TAG_lexical_block = 0x0b,
    DW_TAG_member = 0x0d,
    DW_TAG_pointer_type = 0x0f,
    DW_TAG_reference_type = 0x10,
    DW_TAG_compile_unit = 0x11,
    DW_TAG_string_type = 0x12,
    DW_TAG_structure_type = 0x13,
    DW_TAG_subroutine_type = 0x15,
    DW_TAG_typedef = 0x16,
    DW_TAG_union_type = 0x17,
    DW_TAG_unspecified_parameters = 0x18,
    DW_TAG_variant = 0x19,
    DW_TAG_common_block = 0x1a,
    DW_TAG_common_inclusion = 0x1b,
    DW_TAG_inheritance = 0x1c,
    DW_TAG_inlined_subroutine = 0x1d,
    DW_TAG_module = 0x1e,
    DW_TAG_ptr_to_member_type = 0x1f,
    DW_TAG_set_type = 0x20,
    DW_TAG_subrange_type = 0x21,
    DW_TAG_with_stmt = 0x22,
    DW_TAG_access_declaration = 0x23,
    DW_TAG_base_type = 0x24,
    DW_TAG_catch_block = 0x25,
    DW_TAG_const_type = 0x26,
    DW_TAG_constant = 0x27,
    DW_TAG_enumerator = 0x28,
    DW_TAG_file_type = 0x29,
    DW_TAG_friend = 0x2a,
    DW_TAG_namelist = 0x2b,
    DW_TAG_namelist_item = 0x2c,
    DW_TAG_packed_type = 0x2d,
    DW_TAG_subprogram = 0x2e,
    DW_TAG_template_type_param = 0x2f,
    DW_TAG_template_value_param = 0x30,
    DW_TAG_thrown_type = 0x31,
    DW_TAG_try_block = 0x32,
    DW_TAG_variant_part = 0x33,
    DW_TAG_variable = 0x34,
    DW_TAG_volatile_type = 0x35,

    DW_TAG_MIPS_loop = 0x4081,

    DW_TAG_format_label = 0x4101,
    DW_TAG_function_template = 0x4102,
    DW_TAG_class_template = 0x4103,
    DW_TAG_GNU_BINCL = 0x4104,
    DW_TAG_GNU_EINCL = 0x4105
  };
# 106 "../sysdeps/generic/dwarf2.h"
enum dwarf_form
  {
    DW_FORM_addr = 0x01,
    DW_FORM_block2 = 0x03,
    DW_FORM_block4 = 0x04,
    DW_FORM_data2 = 0x05,
    DW_FORM_data4 = 0x06,
    DW_FORM_data8 = 0x07,
    DW_FORM_string = 0x08,
    DW_FORM_block = 0x09,
    DW_FORM_block1 = 0x0a,
    DW_FORM_data1 = 0x0b,
    DW_FORM_flag = 0x0c,
    DW_FORM_sdata = 0x0d,
    DW_FORM_strp = 0x0e,
    DW_FORM_udata = 0x0f,
    DW_FORM_ref_addr = 0x10,
    DW_FORM_ref1 = 0x11,
    DW_FORM_ref2 = 0x12,
    DW_FORM_ref4 = 0x13,
    DW_FORM_ref8 = 0x14,
    DW_FORM_ref_udata = 0x15,
    DW_FORM_indirect = 0x16
  };



enum dwarf_attribute
  {
    DW_AT_sibling = 0x01,
    DW_AT_location = 0x02,
    DW_AT_name = 0x03,
    DW_AT_ordering = 0x09,
    DW_AT_subscr_data = 0x0a,
    DW_AT_byte_size = 0x0b,
    DW_AT_bit_offset = 0x0c,
    DW_AT_bit_size = 0x0d,
    DW_AT_element_list = 0x0f,
    DW_AT_stmt_list = 0x10,
    DW_AT_low_pc = 0x11,
    DW_AT_high_pc = 0x12,
    DW_AT_language = 0x13,
    DW_AT_member = 0x14,
    DW_AT_discr = 0x15,
    DW_AT_discr_value = 0x16,
    DW_AT_visibility = 0x17,
    DW_AT_import = 0x18,
    DW_AT_string_length = 0x19,
    DW_AT_common_reference = 0x1a,
    DW_AT_comp_dir = 0x1b,
    DW_AT_const_value = 0x1c,
    DW_AT_containing_type = 0x1d,
    DW_AT_default_value = 0x1e,
    DW_AT_inline = 0x20,
    DW_AT_is_optional = 0x21,
    DW_AT_lower_bound = 0x22,
    DW_AT_producer = 0x25,
    DW_AT_prototyped = 0x27,
    DW_AT_return_addr = 0x2a,
    DW_AT_start_scope = 0x2c,
    DW_AT_stride_size = 0x2e,
    DW_AT_upper_bound = 0x2f,
    DW_AT_abstract_origin = 0x31,
    DW_AT_accessibility = 0x32,
    DW_AT_address_class = 0x33,
    DW_AT_artificial = 0x34,
    DW_AT_base_types = 0x35,
    DW_AT_calling_convention = 0x36,
    DW_AT_count = 0x37,
    DW_AT_data_member_location = 0x38,
    DW_AT_decl_column = 0x39,
    DW_AT_decl_file = 0x3a,
    DW_AT_decl_line = 0x3b,
    DW_AT_declaration = 0x3c,
    DW_AT_discr_list = 0x3d,
    DW_AT_encoding = 0x3e,
    DW_AT_external = 0x3f,
    DW_AT_frame_base = 0x40,
    DW_AT_friend = 0x41,
    DW_AT_identifier_case = 0x42,
    DW_AT_macro_info = 0x43,
    DW_AT_namelist_items = 0x44,
    DW_AT_priority = 0x45,
    DW_AT_segment = 0x46,
    DW_AT_specification = 0x47,
    DW_AT_static_link = 0x48,
    DW_AT_type = 0x49,
    DW_AT_use_location = 0x4a,
    DW_AT_variable_parameter = 0x4b,
    DW_AT_virtuality = 0x4c,
    DW_AT_vtable_elem_location = 0x4d,

    DW_AT_MIPS_fde = 0x2001,
    DW_AT_MIPS_loop_begin = 0x2002,
    DW_AT_MIPS_tail_loop_begin = 0x2003,
    DW_AT_MIPS_epilog_begin = 0x2004,
    DW_AT_MIPS_loop_unroll_factor = 0x2005,
    DW_AT_MIPS_software_pipeline_depth = 0x2006,
    DW_AT_MIPS_linkage_name = 0x2007,
    DW_AT_MIPS_stride = 0x2008,
    DW_AT_MIPS_abstract_name = 0x2009,
    DW_AT_MIPS_clone_origin = 0x200a,
    DW_AT_MIPS_has_inlines = 0x200b,

    DW_AT_sf_names = 0x2101,
    DW_AT_src_info = 0x2102,
    DW_AT_mac_info = 0x2103,
    DW_AT_src_coords = 0x2104,
    DW_AT_body_begin = 0x2105,
    DW_AT_body_end = 0x2106
  };






enum dwarf_location_atom
  {
    DW_OP_addr = 0x03,
    DW_OP_deref = 0x06,
    DW_OP_const1u = 0x08,
    DW_OP_const1s = 0x09,
    DW_OP_const2u = 0x0a,
    DW_OP_const2s = 0x0b,
    DW_OP_const4u = 0x0c,
    DW_OP_const4s = 0x0d,
    DW_OP_const8u = 0x0e,
    DW_OP_const8s = 0x0f,
    DW_OP_constu = 0x10,
    DW_OP_consts = 0x11,
    DW_OP_dup = 0x12,
    DW_OP_drop = 0x13,
    DW_OP_over = 0x14,
    DW_OP_pick = 0x15,
    DW_OP_swap = 0x16,
    DW_OP_rot = 0x17,
    DW_OP_xderef = 0x18,
    DW_OP_abs = 0x19,
    DW_OP_and = 0x1a,
    DW_OP_div = 0x1b,
    DW_OP_minus = 0x1c,
    DW_OP_mod = 0x1d,
    DW_OP_mul = 0x1e,
    DW_OP_neg = 0x1f,
    DW_OP_not = 0x20,
    DW_OP_or = 0x21,
    DW_OP_plus = 0x22,
    DW_OP_plus_uconst = 0x23,
    DW_OP_shl = 0x24,
    DW_OP_shr = 0x25,
    DW_OP_shra = 0x26,
    DW_OP_xor = 0x27,
    DW_OP_bra = 0x28,
    DW_OP_eq = 0x29,
    DW_OP_ge = 0x2a,
    DW_OP_gt = 0x2b,
    DW_OP_le = 0x2c,
    DW_OP_lt = 0x2d,
    DW_OP_ne = 0x2e,
    DW_OP_skip = 0x2f,
    DW_OP_lit0 = 0x30,
    DW_OP_lit1 = 0x31,
    DW_OP_lit2 = 0x32,
    DW_OP_lit3 = 0x33,
    DW_OP_lit4 = 0x34,
    DW_OP_lit5 = 0x35,
    DW_OP_lit6 = 0x36,
    DW_OP_lit7 = 0x37,
    DW_OP_lit8 = 0x38,
    DW_OP_lit9 = 0x39,
    DW_OP_lit10 = 0x3a,
    DW_OP_lit11 = 0x3b,
    DW_OP_lit12 = 0x3c,
    DW_OP_lit13 = 0x3d,
    DW_OP_lit14 = 0x3e,
    DW_OP_lit15 = 0x3f,
    DW_OP_lit16 = 0x40,
    DW_OP_lit17 = 0x41,
    DW_OP_lit18 = 0x42,
    DW_OP_lit19 = 0x43,
    DW_OP_lit20 = 0x44,
    DW_OP_lit21 = 0x45,
    DW_OP_lit22 = 0x46,
    DW_OP_lit23 = 0x47,
    DW_OP_lit24 = 0x48,
    DW_OP_lit25 = 0x49,
    DW_OP_lit26 = 0x4a,
    DW_OP_lit27 = 0x4b,
    DW_OP_lit28 = 0x4c,
    DW_OP_lit29 = 0x4d,
    DW_OP_lit30 = 0x4e,
    DW_OP_lit31 = 0x4f,
    DW_OP_reg0 = 0x50,
    DW_OP_reg1 = 0x51,
    DW_OP_reg2 = 0x52,
    DW_OP_reg3 = 0x53,
    DW_OP_reg4 = 0x54,
    DW_OP_reg5 = 0x55,
    DW_OP_reg6 = 0x56,
    DW_OP_reg7 = 0x57,
    DW_OP_reg8 = 0x58,
    DW_OP_reg9 = 0x59,
    DW_OP_reg10 = 0x5a,
    DW_OP_reg11 = 0x5b,
    DW_OP_reg12 = 0x5c,
    DW_OP_reg13 = 0x5d,
    DW_OP_reg14 = 0x5e,
    DW_OP_reg15 = 0x5f,
    DW_OP_reg16 = 0x60,
    DW_OP_reg17 = 0x61,
    DW_OP_reg18 = 0x62,
    DW_OP_reg19 = 0x63,
    DW_OP_reg20 = 0x64,
    DW_OP_reg21 = 0x65,
    DW_OP_reg22 = 0x66,
    DW_OP_reg23 = 0x67,
    DW_OP_reg24 = 0x68,
    DW_OP_reg25 = 0x69,
    DW_OP_reg26 = 0x6a,
    DW_OP_reg27 = 0x6b,
    DW_OP_reg28 = 0x6c,
    DW_OP_reg29 = 0x6d,
    DW_OP_reg30 = 0x6e,
    DW_OP_reg31 = 0x6f,
    DW_OP_breg0 = 0x70,
    DW_OP_breg1 = 0x71,
    DW_OP_breg2 = 0x72,
    DW_OP_breg3 = 0x73,
    DW_OP_breg4 = 0x74,
    DW_OP_breg5 = 0x75,
    DW_OP_breg6 = 0x76,
    DW_OP_breg7 = 0x77,
    DW_OP_breg8 = 0x78,
    DW_OP_breg9 = 0x79,
    DW_OP_breg10 = 0x7a,
    DW_OP_breg11 = 0x7b,
    DW_OP_breg12 = 0x7c,
    DW_OP_breg13 = 0x7d,
    DW_OP_breg14 = 0x7e,
    DW_OP_breg15 = 0x7f,
    DW_OP_breg16 = 0x80,
    DW_OP_breg17 = 0x81,
    DW_OP_breg18 = 0x82,
    DW_OP_breg19 = 0x83,
    DW_OP_breg20 = 0x84,
    DW_OP_breg21 = 0x85,
    DW_OP_breg22 = 0x86,
    DW_OP_breg23 = 0x87,
    DW_OP_breg24 = 0x88,
    DW_OP_breg25 = 0x89,
    DW_OP_breg26 = 0x8a,
    DW_OP_breg27 = 0x8b,
    DW_OP_breg28 = 0x8c,
    DW_OP_breg29 = 0x8d,
    DW_OP_breg30 = 0x8e,
    DW_OP_breg31 = 0x8f,
    DW_OP_regx = 0x90,
    DW_OP_fbreg = 0x91,
    DW_OP_bregx = 0x92,
    DW_OP_piece = 0x93,
    DW_OP_deref_size = 0x94,
    DW_OP_xderef_size = 0x95,
    DW_OP_nop = 0x96
  };






enum dwarf_type
  {
    DW_ATE_void = 0x0,
    DW_ATE_address = 0x1,
    DW_ATE_boolean = 0x2,
    DW_ATE_complex_float = 0x3,
    DW_ATE_float = 0x4,
    DW_ATE_signed = 0x5,
    DW_ATE_signed_char = 0x6,
    DW_ATE_unsigned = 0x7,
    DW_ATE_unsigned_char = 0x8
  };





enum dwarf_array_dim_ordering
  {
    DW_ORD_row_major = 0,
    DW_ORD_col_major = 1
  };


enum dwarf_access_attribute
  {
    DW_ACCESS_public = 1,
    DW_ACCESS_protected = 2,
    DW_ACCESS_private = 3
  };


enum dwarf_visibility_attribute
  {
    DW_VIS_local = 1,
    DW_VIS_exported = 2,
    DW_VIS_qualified = 3
  };


enum dwarf_virtuality_attribute
  {
    DW_VIRTUALITY_none = 0,
    DW_VIRTUALITY_virtual = 1,
    DW_VIRTUALITY_pure_virtual = 2
  };


enum dwarf_id_case
  {
    DW_ID_case_sensitive = 0,
    DW_ID_up_case = 1,
    DW_ID_down_case = 2,
    DW_ID_case_insensitive = 3
  };


enum dwarf_calling_convention
  {
    DW_CC_normal = 0x1,
    DW_CC_program = 0x2,
    DW_CC_nocall = 0x3
  };





enum dwarf_inline_attribute
  {
    DW_INL_not_inlined = 0,
    DW_INL_inlined = 1,
    DW_INL_declared_not_inlined = 2,
    DW_INL_declared_inlined = 3
  };


enum dwarf_discrim_list
  {
    DW_DSC_label = 0,
    DW_DSC_range = 1
  };


enum dwarf_line_number_ops
  {
    DW_LNS_extended_op = 0,
    DW_LNS_copy = 1,
    DW_LNS_advance_pc = 2,
    DW_LNS_advance_line = 3,
    DW_LNS_set_file = 4,
    DW_LNS_set_column = 5,
    DW_LNS_negate_stmt = 6,
    DW_LNS_set_basic_block = 7,
    DW_LNS_const_add_pc = 8,
    DW_LNS_fixed_advance_pc = 9
  };


enum dwarf_line_number_x_ops
  {
    DW_LNE_end_sequence = 1,
    DW_LNE_set_address = 2,
    DW_LNE_define_file = 3
  };


enum dwarf_call_frame_info
  {
    DW_CFA_advance_loc = 0x40,
    DW_CFA_offset = 0x80,
    DW_CFA_restore = 0xc0,
    DW_CFA_nop = 0x00,
    DW_CFA_set_loc = 0x01,
    DW_CFA_advance_loc1 = 0x02,
    DW_CFA_advance_loc2 = 0x03,
    DW_CFA_advance_loc4 = 0x04,
    DW_CFA_offset_extended = 0x05,
    DW_CFA_restore_extended = 0x06,
    DW_CFA_undefined = 0x07,
    DW_CFA_same_value = 0x08,
    DW_CFA_register = 0x09,
    DW_CFA_remember_state = 0x0a,
    DW_CFA_restore_state = 0x0b,
    DW_CFA_def_cfa = 0x0c,
    DW_CFA_def_cfa_register = 0x0d,
    DW_CFA_def_cfa_offset = 0x0e,
    DW_CFA_def_cfa_expression = 0x0f,
    DW_CFA_expression = 0x10,

    DW_CFA_offset_extended_sf = 0x11,
    DW_CFA_def_cfa_sf = 0x12,
    DW_CFA_def_cfa_offset_sf = 0x13,


    DW_CFA_MIPS_advance_loc8 = 0x1d,


    DW_CFA_GNU_window_save = 0x2d,
    DW_CFA_GNU_args_size = 0x2e,
    DW_CFA_GNU_negative_offset_extended = 0x2f
  };
# 534 "../sysdeps/generic/dwarf2.h"
enum dwarf_source_language
  {
    DW_LANG_C89 = 0x0001,
    DW_LANG_C = 0x0002,
    DW_LANG_Ada83 = 0x0003,
    DW_LANG_C_plus_plus = 0x0004,
    DW_LANG_Cobol74 = 0x0005,
    DW_LANG_Cobol85 = 0x0006,
    DW_LANG_Fortran77 = 0x0007,
    DW_LANG_Fortran90 = 0x0008,
    DW_LANG_Pascal83 = 0x0009,
    DW_LANG_Modula2 = 0x000a,
    DW_LANG_Java = 0x000b,
    DW_LANG_Mips_Assembler = 0x8001
  };







enum dwarf_macinfo_record_type
  {
    DW_MACINFO_define = 1,
    DW_MACINFO_undef = 2,
    DW_MACINFO_start_file = 3,
    DW_MACINFO_end_file = 4,
    DW_MACINFO_vendor_ext = 255
  };
# 97 "../sysdeps/generic/sysdep.h" 2
# 19 "../sysdeps/unix/sysdep.h" 2

# 1 "../sysdeps/unix/sysv/linux/sys/syscall.h" 1
# 24 "../sysdeps/unix/sysv/linux/sys/syscall.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/unistd.h" 1 3 4
# 13 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/unistd.h" 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/unistd_64.h" 1 3 4
# 14 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/unistd.h" 2 3 4
# 25 "../sysdeps/unix/sysv/linux/sys/syscall.h" 2
# 21 "../sysdeps/unix/sysdep.h" 2
# 19 "../sysdeps/unix/x86_64/sysdep.h" 2
# 1 "../sysdeps/x86_64/sysdep.h" 1
# 22 "../sysdeps/x86_64/sysdep.h"
# 1 "../sysdeps/x86/sysdep.h" 1
# 22 "../sysdeps/x86/sysdep.h"
# 1 "../sysdeps/generic/sysdep.h" 1
# 23 "../sysdeps/x86/sysdep.h" 2
# 23 "../sysdeps/x86_64/sysdep.h" 2
# 20 "../sysdeps/unix/x86_64/sysdep.h" 2
# 24 "../sysdeps/unix/sysv/linux/x86_64/sysdep.h" 2
# 1 "../sysdeps/x86_64/nptl/tls.h" 1
# 25 "../sysdeps/unix/sysv/linux/x86_64/sysdep.h" 2


# 1 "../sysdeps/unix/sysv/linux/dl-sysdep.h" 1
# 19 "../sysdeps/unix/sysv/linux/dl-sysdep.h"
# 1 "../sysdeps/generic/dl-sysdep.h" 1
# 20 "../sysdeps/unix/sysv/linux/dl-sysdep.h" 2
# 31 "../sysdeps/unix/sysv/linux/dl-sysdep.h"
extern int _dl_discover_osversion (void) ;
# 28 "../sysdeps/unix/sysv/linux/x86_64/sysdep.h" 2
# 29 "../sysdeps/x86_64/nptl/tls.h" 2

# 1 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h"
# 1 "../sysdeps/unix/sysv/linux/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 2
# 31 "../sysdeps/x86_64/nptl/tls.h" 2
# 1 "../sysdeps/generic/dl-dtv.h" 1
# 22 "../sysdeps/generic/dl-dtv.h"
struct dtv_pointer
{
  void *val;
  void *to_free;
};


typedef union dtv
{
  size_t counter;
  struct dtv_pointer pointer;
} dtv_t;
# 32 "../sysdeps/x86_64/nptl/tls.h" 2




typedef struct
{
  int i[4];
} __128bits;


typedef struct
{
  void *tcb;

  dtv_t *dtv;
  void *self;
  int multiple_threads;
  int gscope_flag;
  uintptr_t sysinfo;
  uintptr_t stack_guard;
  uintptr_t pointer_guard;
  unsigned long int vgetcpu_cache[2];



  unsigned int feature_1;
  int __glibc_unused1;

  void *__private_tm[4];

  void *__private_ss;

  unsigned long long int ssp_base;


  __128bits __glibc_unused2[8][4] __attribute__ ((aligned (32)));

  void *__padding[8];
} tcbhead_t;
# 83 "../sysdeps/x86_64/nptl/tls.h"
_Static_assert (
# 83 "../sysdeps/x86_64/nptl/tls.h" 3 4
               __builtin_offsetof (
# 83 "../sysdeps/x86_64/nptl/tls.h"
               tcbhead_t
# 83 "../sysdeps/x86_64/nptl/tls.h" 3 4
               , 
# 83 "../sysdeps/x86_64/nptl/tls.h"
               __private_ss
# 83 "../sysdeps/x86_64/nptl/tls.h" 3 4
               ) 
# 83 "../sysdeps/x86_64/nptl/tls.h"
                                                  == 0x70,
  "offset of __private_ss != 0x70");
_Static_assert (
# 85 "../sysdeps/x86_64/nptl/tls.h" 3 4
               __builtin_offsetof (
# 85 "../sysdeps/x86_64/nptl/tls.h"
               tcbhead_t
# 85 "../sysdeps/x86_64/nptl/tls.h" 3 4
               , 
# 85 "../sysdeps/x86_64/nptl/tls.h"
               __glibc_unused2
# 85 "../sysdeps/x86_64/nptl/tls.h" 3 4
               ) 
# 85 "../sysdeps/x86_64/nptl/tls.h"
                                                     == 0x80,
  "offset of __glibc_unused2 != 0x80");
# 130 "../sysdeps/x86_64/nptl/tls.h"
# 1 "../nptl/descr.h" 1
# 22 "../nptl/descr.h"
# 1 "../include/limits.h" 1
# 183 "../include/limits.h"
# 1 "../include/bits/posix1_lim.h" 1
# 184 "../include/limits.h" 2



# 1 "../include/bits/posix2_lim.h" 1
# 188 "../include/limits.h" 2
# 23 "../nptl/descr.h" 2
# 1 "../include/sched.h" 1

# 1 "../posix/sched.h" 1
# 25 "../posix/sched.h"
# 1 "../include/bits/types.h" 1
# 26 "../posix/sched.h" 2



# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 30 "../posix/sched.h" 2

# 1 "../include/bits/types/time_t.h" 1
# 32 "../posix/sched.h" 2
# 1 "../include/bits/types/struct_timespec.h" 1
# 33 "../posix/sched.h" 2
# 43 "../posix/sched.h"
# 1 "../sysdeps/unix/sysv/linux/bits/sched.h" 1
# 74 "../sysdeps/unix/sysv/linux/bits/sched.h"
# 1 "../bits/types/struct_sched_param.h" 1
# 23 "../bits/types/struct_sched_param.h"
struct sched_param
{
  int sched_priority;
};
# 75 "../sysdeps/unix/sysv/linux/bits/sched.h" 2





extern int clone (int (*__fn) (void *__arg), void *__child_stack,
    int __flags, void *__arg, ...) __attribute__ ((__nothrow__ ));


extern int unshare (int __flags) __attribute__ ((__nothrow__ ));


extern int sched_getcpu (void) __attribute__ ((__nothrow__ ));


extern int setns (int __fd, int __nstype) __attribute__ ((__nothrow__ ));



# 44 "../posix/sched.h" 2
# 1 "../include/bits/cpu-set.h" 1
# 1 "../posix/bits/cpu-set.h" 1
# 32 "../posix/bits/cpu-set.h"
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 115 "../posix/bits/cpu-set.h"


extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
     __attribute__ ((__nothrow__ ));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ )) ;
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ ));


# 1 "../include/bits/cpu-set.h" 2
# 45 "../posix/sched.h" 2









extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ ));


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ ));


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) __attribute__ ((__nothrow__ ));


extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ ));


extern int sched_yield (void) __attribute__ ((__nothrow__ ));


extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ ));


extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ ));


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ ));
# 121 "../posix/sched.h"
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
         const cpu_set_t *__cpuset) __attribute__ ((__nothrow__ ));


extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
         cpu_set_t *__cpuset) __attribute__ ((__nothrow__ ));



# 3 "../include/sched.h" 2



extern int __sched_setparam (__pid_t __pid,
        const struct sched_param *__param);

extern int __sched_getparam (__pid_t __pid, struct sched_param *__param);
extern int __sched_setscheduler (__pid_t __pid, int __policy,
     const struct sched_param *__param);

extern int __sched_getscheduler (__pid_t __pid);
extern int __sched_yield (void);

extern int __sched_get_priority_max (int __algorithm);

extern int __sched_get_priority_min (int __algorithm);

extern int __sched_rr_get_interval (__pid_t __pid, struct timespec *__t);


extern int __clone (int (*__fn) (void *__arg), void *__child_stack,
      int __flags, void *__arg, ...);

extern int __clone2 (int (*__fn) (void *__arg), void *__child_stack_base,
       size_t __child_stack_size, int __flags, void *__arg, ...);

# 24 "../nptl/descr.h" 2
# 1 "../include/setjmp.h" 1

# 1 "../setjmp/setjmp.h" 1
# 27 "../setjmp/setjmp.h"


# 1 "../sysdeps/x86/bits/setjmp.h" 1
# 26 "../sysdeps/x86/bits/setjmp.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 27 "../sysdeps/x86/bits/setjmp.h" 2




typedef long int __jmp_buf[8];
# 30 "../setjmp/setjmp.h" 2



struct __jmp_buf_tag
  {




    __jmp_buf __jmpbuf;
    int __mask_was_saved;
    __sigset_t __saved_mask;
  };


typedef struct __jmp_buf_tag jmp_buf[1];



extern int setjmp (jmp_buf __env) __attribute__ ((__nothrow__));




extern int __sigsetjmp (struct __jmp_buf_tag __env[1], int __savemask) __attribute__ ((__nothrow__));



extern int _setjmp (struct __jmp_buf_tag __env[1]) __attribute__ ((__nothrow__));
# 67 "../setjmp/setjmp.h"
extern void longjmp (struct __jmp_buf_tag __env[1], int __val)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));





extern void _longjmp (struct __jmp_buf_tag __env[1], int __val)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));







typedef struct __jmp_buf_tag sigjmp_buf[1];
# 93 "../setjmp/setjmp.h"
extern void siglongjmp (sigjmp_buf __env, int __val)
     __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
# 103 "../setjmp/setjmp.h"

# 3 "../include/setjmp.h" 2





extern void __longjmp (__jmp_buf __env, int __val)
     __attribute__ ((__noreturn__)) ;

extern void ____longjmp_chk (__jmp_buf __env, int __val)
     __attribute__ ((__noreturn__)) ;





extern int __sigjmp_save (jmp_buf __env, int __savemask);

extern void _longjmp_unwind (jmp_buf env, int val);

extern void __libc_siglongjmp (sigjmp_buf env, int val)
   __attribute__ ((noreturn));
extern void __libc_longjmp (sigjmp_buf env, int val)
     __attribute__ ((noreturn));









# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 36 "../include/setjmp.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86_64/64/jmp_buf-macros.h" 1
# 37 "../include/setjmp.h" 2
# 55 "../include/setjmp.h"
_Static_assert (sizeof (jmp_buf) == 200, "size of " "jmp_buf" " != " "200");
_Static_assert (sizeof (sigjmp_buf) == 200, "size of " "sigjmp_buf" " != " "200");


_Static_assert (__alignof__ (jmp_buf) == 8 , "align of " "jmp_buf" " != " "8");
_Static_assert (__alignof__ (sigjmp_buf) == 8 , "align of " "sigjmp_buf" " != " "8");


_Static_assert (
# 63 "../include/setjmp.h" 3 4
__builtin_offsetof (
# 63 "../include/setjmp.h"
struct __jmp_buf_tag
# 63 "../include/setjmp.h" 3 4
, 
# 63 "../include/setjmp.h"
__mask_was_saved
# 63 "../include/setjmp.h" 3 4
) 
# 63 "../include/setjmp.h"
== 64, "offset of " "__mask_was_saved" " field of " "struct __jmp_buf_tag" " != " "64")
                            ;
_Static_assert (
# 65 "../include/setjmp.h" 3 4
__builtin_offsetof (
# 65 "../include/setjmp.h"
struct __jmp_buf_tag
# 65 "../include/setjmp.h" 3 4
, 
# 65 "../include/setjmp.h"
__saved_mask
# 65 "../include/setjmp.h" 3 4
) 
# 65 "../include/setjmp.h"
== 72, "offset of " "__saved_mask" " field of " "struct __jmp_buf_tag" " != " "72")
                        ;
# 25 "../nptl/descr.h" 2

# 1 "../include/sys/types.h" 1
# 27 "../nptl/descr.h" 2
# 1 "../sysdeps/x86_64/hp-timing.h" 1
# 30 "../sysdeps/x86_64/hp-timing.h"
typedef unsigned long long int hp_timing_t;







# 1 "../sysdeps/generic/hp-timing-common.h" 1
# 40 "../sysdeps/generic/hp-timing-common.h"
# 1 "../include/string.h" 1





# 1 "../include/sys/types.h" 1
# 7 "../include/string.h" 2

extern void *__memccpy (void *__dest, const void *__src,
   int __c, size_t __n);

extern size_t __strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__pure__));

extern char *__strsep (char **__stringp, const char *__delim);


extern int __strverscmp (const char *__s1, const char *__s2)
     __attribute__ ((__pure__));

extern int __strncasecmp (const char *__s1, const char *__s2,
     size_t __n)
     __attribute__ ((__pure__));

extern int __strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__pure__));

extern char *__strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__pure__));

extern char *__strdup (const char *__string)
     __attribute__ ((__malloc__));
extern char *__strndup (const char *__string, size_t __n)
     __attribute__ ((__malloc__));

extern void *__rawmemchr (const void *__s, int __c)
     __attribute__ ((__pure__));

extern char *__strchrnul (const char *__s, int __c)
     __attribute__ ((__pure__));

extern void *__memrchr (const void *__s, int __c, size_t __n)
     __attribute__ ((__pure__));

extern void *__memchr (const void *__s, int __c, size_t __n)
     __attribute__ ((__pure__));

extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) ;

extern int __ffs (int __i) __attribute__ ((const));

extern char *__strerror_r (int __errnum, char *__buf, size_t __buflen);


void __strerror_thread_freeres (void) ;


# 1 "../sysdeps/x86/string_private.h" 1
# 58 "../include/string.h" 2


# 1 "../string/string.h" 1
# 26 "../string/string.h"
# 1 "../bits/libc-header-start.h" 1
# 27 "../string/string.h" 2






# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 34 "../string/string.h" 2
# 42 "../string/string.h"
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ )) ;


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ )) ;





extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ )) ;




extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ )) ;


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 90 "../string/string.h"
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 103 "../string/string.h"
extern void *rawmemchr (const void *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 114 "../string/string.h"
extern void *memrchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;





extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) ;

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) ;


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) ;

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ )) ;


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) ;



# 1 "../include/bits/types/locale_t.h" 1
# 153 "../string/string.h" 2


extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;


extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) __attribute__ ((__nothrow__ )) ;





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;
# 225 "../string/string.h"
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 252 "../string/string.h"
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 265 "../string/string.h"
extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;





extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 302 "../string/string.h"
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 329 "../string/string.h"
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) ;



extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) ;

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) ;
# 359 "../string/string.h"
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;







extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) ;
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) ;




extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;




extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;




extern char *strerror (int __errnum) __attribute__ ((__nothrow__ ));
# 420 "../string/string.h"
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ )) ;





extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ ));



# 1 "../include/strings.h" 1
# 1 "../string/strings.h" 1
# 23 "../string/strings.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 24 "../string/strings.h" 2










extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;


extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ )) ;


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) ;
# 68 "../string/strings.h"
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;
# 96 "../string/strings.h"
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;






extern int ffs (int __i) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));





extern int ffsl (long int __l) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;



# 1 "../include/bits/types/locale_t.h" 1
# 126 "../string/strings.h" 2


extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;



extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;



# 1 "../include/strings.h" 2
# 432 "../string/string.h" 2



extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) ;



extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) ;




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ ));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) ;
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) ;



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) ;
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) ;




extern int strverscmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) ;


extern char *strfry (char *__string) __attribute__ ((__nothrow__ )) ;


extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__ )) ;
# 486 "../string/string.h"
extern char *basename (const char *__filename) __attribute__ ((__nothrow__ )) ;
# 498 "../string/string.h"

# 61 "../include/string.h" 2


extern __typeof (strcoll_l) __strcoll_l;
extern __typeof (strxfrm_l) __strxfrm_l;
extern __typeof (strcasecmp_l) __strcasecmp_l;
extern __typeof (strncasecmp_l) __strncasecmp_l;
# 82 "../include/string.h"













extern __typeof (strncat) __strncat;






extern char *__basename (const char *__filename) __attribute__ ((__nothrow__ )) ;





extern char *__strsep_g (char **__stringp, const char *__delim);




extern __typeof (memmem) __memmem;


# 128 "../include/string.h"




















# 173 "../include/string.h"
extern __typeof (mempcpy) mempcpy __asm__ ("__mempcpy");
extern __typeof (stpcpy) stpcpy __asm__ ("__stpcpy");


extern void *__memcpy_chk (void *__restrict __dest,
      const void *__restrict __src, size_t __len,
      size_t __destlen) __attribute__ ((__nothrow__ ));
extern void *__memmove_chk (void *__dest, const void *__src, size_t __len,
       size_t __destlen) __attribute__ ((__nothrow__ ));
extern void *__mempcpy_chk (void *__restrict __dest,
       const void *__restrict __src, size_t __len,
       size_t __destlen) __attribute__ ((__nothrow__ ));
extern void *__memset_chk (void *__dest, int __ch, size_t __len,
      size_t __destlen) __attribute__ ((__nothrow__ ));
extern char *__strcpy_chk (char *__restrict __dest,
      const char *__restrict __src,
      size_t __destlen) __attribute__ ((__nothrow__ ));
extern char *__stpcpy_chk (char *__restrict __dest,
      const char *__restrict __src,
      size_t __destlen) __attribute__ ((__nothrow__ ));
extern char *__strncpy_chk (char *__restrict __dest,
       const char *__restrict __src,
       size_t __len, size_t __destlen) __attribute__ ((__nothrow__ ));
extern char *__strcat_chk (char *__restrict __dest,
      const char *__restrict __src,
      size_t __destlen) __attribute__ ((__nothrow__ ));
extern char *__strncat_chk (char *__restrict __dest,
       const char *__restrict __src,
       size_t __len, size_t __destlen) __attribute__ ((__nothrow__ ));
# 41 "../sysdeps/generic/hp-timing-common.h" 2
# 1 "../include/sys/param.h" 1
# 1 "../misc/sys/param.h" 1
# 23 "../misc/sys/param.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 24 "../misc/sys/param.h" 2

# 1 "../include/sys/types.h" 1
# 26 "../misc/sys/param.h" 2
# 1 "../include/limits.h" 1
# 183 "../include/limits.h"
# 1 "../include/bits/posix1_lim.h" 1
# 184 "../include/limits.h" 2



# 1 "../include/bits/posix2_lim.h" 1
# 188 "../include/limits.h" 2
# 27 "../misc/sys/param.h" 2
# 1 "../include/endian.h" 1
# 28 "../misc/sys/param.h" 2
# 1 "../include/signal.h" 1

# 1 "../signal/signal.h" 1
# 27 "../signal/signal.h"


# 1 "../include/bits/types.h" 1
# 30 "../signal/signal.h" 2
# 1 "../sysdeps/unix/sysv/linux/bits/signum.h" 1
# 26 "../sysdeps/unix/sysv/linux/bits/signum.h"
# 1 "../bits/signum-generic.h" 1
# 27 "../sysdeps/unix/sysv/linux/bits/signum.h" 2
# 31 "../signal/signal.h" 2

# 1 "../include/bits/types/sig_atomic_t.h" 1
# 1 "../signal/bits/types/sig_atomic_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../signal/bits/types/sig_atomic_t.h" 2



typedef __sig_atomic_t sig_atomic_t;
# 1 "../include/bits/types/sig_atomic_t.h" 2
# 33 "../signal/signal.h" 2


# 1 "../include/bits/types/sigset_t.h" 1
# 36 "../signal/signal.h" 2
# 53 "../signal/signal.h"
# 1 "../include/bits/types/struct_timespec.h" 1
# 54 "../signal/signal.h" 2



# 1 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h" 1



# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 5 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h" 2
# 1 "../include/bits/types.h" 1
# 6 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h" 2
# 1 "../include/bits/types/__sigval_t.h" 1
# 1 "../signal/bits/types/__sigval_t.h" 1
# 24 "../signal/bits/types/__sigval_t.h"
union sigval
{
  int sival_int;
  void *sival_ptr;
};

typedef union sigval __sigval_t;
# 1 "../include/bits/types/__sigval_t.h" 2
# 7 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h" 2
# 16 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h"
# 1 "../sysdeps/unix/sysv/linux/x86/bits/siginfo-arch.h" 1
# 17 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h" 2
# 36 "../sysdeps/unix/sysv/linux/bits/types/siginfo_t.h"
typedef struct
  {
    int si_signo;

    int si_errno;

    int si_code;





    int __pad0;


    union
      {
 int _pad[((128 / sizeof (int)) - 4)];


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
   } _kill;


 struct
   {
     int si_tid;
     int si_overrun;
     __sigval_t si_sigval;
   } _timer;


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
     __sigval_t si_sigval;
   } _rt;


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
     int si_status;
     __clock_t si_utime;
     __clock_t si_stime;
   } _sigchld;


 struct
   {
     void *si_addr;
    
     short int si_addr_lsb;
     union
       {

  struct
    {
      void *_lower;
      void *_upper;
    } _addr_bnd;

  __uint32_t _pkey;
       } _bounds;
   } _sigfault;


 struct
   {
     long int si_band;
     int si_fd;
   } _sigpoll;



 struct
   {
     void *_call_addr;
     int _syscall;
     unsigned int _arch;
   } _sigsys;

      } _sifields;
  } siginfo_t ;
# 58 "../signal/signal.h" 2
# 1 "../sysdeps/unix/sysv/linux/bits/siginfo-consts.h" 1
# 35 "../sysdeps/unix/sysv/linux/bits/siginfo-consts.h"
enum
{
  SI_ASYNCNL = -60,
  SI_TKILL = -6,
  SI_SIGIO,

  SI_ASYNCIO,
  SI_MESGQ,
  SI_TIMER,





  SI_QUEUE,
  SI_USER,
  SI_KERNEL = 0x80
# 63 "../sysdeps/unix/sysv/linux/bits/siginfo-consts.h"
};




enum
{
  ILL_ILLOPC = 1,

  ILL_ILLOPN,

  ILL_ILLADR,

  ILL_ILLTRP,

  ILL_PRVOPC,

  ILL_PRVREG,

  ILL_COPROC,

  ILL_BADSTK

};


enum
{
  FPE_INTDIV = 1,

  FPE_INTOVF,

  FPE_FLTDIV,

  FPE_FLTOVF,

  FPE_FLTUND,

  FPE_FLTRES,

  FPE_FLTINV,

  FPE_FLTSUB

};


enum
{
  SEGV_MAPERR = 1,

  SEGV_ACCERR,

  SEGV_BNDERR,

  SEGV_PKUERR

};


enum
{
  BUS_ADRALN = 1,

  BUS_ADRERR,

  BUS_OBJERR,

  BUS_MCEERR_AR,

  BUS_MCEERR_AO

};




enum
{
  TRAP_BRKPT = 1,

  TRAP_TRACE,

  TRAP_BRANCH,

  TRAP_HWBKPT

};




enum
{
  CLD_EXITED = 1,

  CLD_KILLED,

  CLD_DUMPED,

  CLD_TRAPPED,

  CLD_STOPPED,

  CLD_CONTINUED

};


enum
{
  POLL_IN = 1,

  POLL_OUT,

  POLL_MSG,

  POLL_ERR,

  POLL_PRI,

  POLL_HUP

};





# 1 "../sysdeps/unix/sysv/linux/bits/siginfo-consts-arch.h" 1
# 193 "../sysdeps/unix/sysv/linux/bits/siginfo-consts.h" 2
# 59 "../signal/signal.h" 2



# 1 "../include/bits/types/sigval_t.h" 1
# 1 "../signal/bits/types/sigval_t.h" 1



# 1 "../include/bits/types/__sigval_t.h" 1
# 5 "../signal/bits/types/sigval_t.h" 2
# 16 "../signal/bits/types/sigval_t.h"
typedef __sigval_t sigval_t;
# 1 "../include/bits/types/sigval_t.h" 2
# 63 "../signal/signal.h" 2



# 1 "../sysdeps/unix/sysv/linux/bits/types/sigevent_t.h" 1



# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 5 "../sysdeps/unix/sysv/linux/bits/types/sigevent_t.h" 2
# 1 "../include/bits/types.h" 1
# 6 "../sysdeps/unix/sysv/linux/bits/types/sigevent_t.h" 2
# 1 "../include/bits/types/__sigval_t.h" 1
# 7 "../sysdeps/unix/sysv/linux/bits/types/sigevent_t.h" 2
# 22 "../sysdeps/unix/sysv/linux/bits/types/sigevent_t.h"
typedef struct sigevent
  {
    __sigval_t sigev_value;
    int sigev_signo;
    int sigev_notify;

    union
      {
 int _pad[((64 / sizeof (int)) - 4)];



 __pid_t _tid;

 struct
   {
     void (*_function) (__sigval_t);
     pthread_attr_t *_attribute;
   } _sigev_thread;
      } _sigev_un;
  } sigevent_t;
# 67 "../signal/signal.h" 2
# 1 "../sysdeps/unix/sysv/linux/bits/sigevent-consts.h" 1
# 27 "../sysdeps/unix/sysv/linux/bits/sigevent-consts.h"
enum
{
  SIGEV_SIGNAL = 0,

  SIGEV_NONE,

  SIGEV_THREAD,


  SIGEV_THREAD_ID = 4


};
# 68 "../signal/signal.h" 2




typedef void (*__sighandler_t) (int);




extern __sighandler_t __sysv_signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));

extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));






extern __sighandler_t signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));
# 112 "../signal/signal.h"
extern int kill (__pid_t __pid, int __sig) __attribute__ ((__nothrow__ ));






extern int killpg (__pid_t __pgrp, int __sig) __attribute__ ((__nothrow__ ));



extern int raise (int __sig) __attribute__ ((__nothrow__ ));



extern __sighandler_t ssignal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));
extern int gsignal (int __sig) __attribute__ ((__nothrow__ ));




extern void psignal (int __sig, const char *__s);


extern void psiginfo (const siginfo_t *__pinfo, const char *__s);
# 151 "../signal/signal.h"
extern int sigpause (int __sig) __asm__ ("__xpg_sigpause");
# 170 "../signal/signal.h"
extern int sigblock (int __mask) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));


extern int sigsetmask (int __mask) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));


extern int siggetmask (void) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
# 185 "../signal/signal.h"
typedef __sighandler_t sighandler_t;




typedef __sighandler_t sig_t;





extern int sigemptyset (sigset_t *__set) __attribute__ ((__nothrow__ )) ;


extern int sigfillset (sigset_t *__set) __attribute__ ((__nothrow__ )) ;


extern int sigaddset (sigset_t *__set, int __signo) __attribute__ ((__nothrow__ )) ;


extern int sigdelset (sigset_t *__set, int __signo) __attribute__ ((__nothrow__ )) ;


extern int sigismember (const sigset_t *__set, int __signo)
     __attribute__ ((__nothrow__ )) ;



extern int sigisemptyset (const sigset_t *__set) __attribute__ ((__nothrow__ )) ;


extern int sigandset (sigset_t *__set, const sigset_t *__left,
        const sigset_t *__right) __attribute__ ((__nothrow__ )) ;


extern int sigorset (sigset_t *__set, const sigset_t *__left,
       const sigset_t *__right) __attribute__ ((__nothrow__ )) ;




# 1 "../sysdeps/unix/sysv/linux/bits/sigaction.h" 1
# 27 "../sysdeps/unix/sysv/linux/bits/sigaction.h"
struct sigaction
  {


    union
      {

 __sighandler_t sa_handler;

 void (*sa_sigaction) (int, siginfo_t *, void *);
      }
    __sigaction_handler;







    __sigset_t sa_mask;


    int sa_flags;


    void (*sa_restorer) (void);
  };
# 227 "../signal/signal.h" 2


extern int sigprocmask (int __how, const sigset_t *__restrict __set,
   sigset_t *__restrict __oset) __attribute__ ((__nothrow__ ));






extern int sigsuspend (const sigset_t *__set) ;


extern int sigaction (int __sig, const struct sigaction *__restrict __act,
        struct sigaction *__restrict __oact) __attribute__ ((__nothrow__ ));


extern int sigpending (sigset_t *__set) __attribute__ ((__nothrow__ )) ;







extern int sigwait (const sigset_t *__restrict __set, int *__restrict __sig)
     ;







extern int sigwaitinfo (const sigset_t *__restrict __set,
   siginfo_t *__restrict __info) ;






extern int sigtimedwait (const sigset_t *__restrict __set,
    siginfo_t *__restrict __info,
    const struct timespec *__restrict __timeout)
     ;



extern int sigqueue (__pid_t __pid, int __sig, const union sigval __val)
     __attribute__ ((__nothrow__ ));
# 286 "../signal/signal.h"
extern const char *const _sys_siglist[(64 + 1)];
extern const char *const sys_siglist[(64 + 1)];



# 1 "../sysdeps/unix/sysv/linux/x86/bits/sigcontext.h" 1
# 25 "../sysdeps/unix/sysv/linux/x86/bits/sigcontext.h"
# 1 "../include/bits/types.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86/bits/sigcontext.h" 2





struct _fpx_sw_bytes
{
  __uint32_t magic1;
  __uint32_t extended_size;
  __uint64_t xstate_bv;
  __uint32_t xstate_size;
  __uint32_t __glibc_reserved1[7];
};

struct _fpreg
{
  unsigned short significand[4];
  unsigned short exponent;
};

struct _fpxreg
{
  unsigned short significand[4];
  unsigned short exponent;
  unsigned short __glibc_reserved1[3];
};

struct _xmmreg
{
  __uint32_t element[4];
};
# 123 "../sysdeps/unix/sysv/linux/x86/bits/sigcontext.h"
struct _fpstate
{

  __uint16_t cwd;
  __uint16_t swd;
  __uint16_t ftw;
  __uint16_t fop;
  __uint64_t rip;
  __uint64_t rdp;
  __uint32_t mxcsr;
  __uint32_t mxcr_mask;
  struct _fpxreg _st[8];
  struct _xmmreg _xmm[16];
  __uint32_t __glibc_reserved1[24];
};

struct sigcontext
{
  __uint64_t r8;
  __uint64_t r9;
  __uint64_t r10;
  __uint64_t r11;
  __uint64_t r12;
  __uint64_t r13;
  __uint64_t r14;
  __uint64_t r15;
  __uint64_t rdi;
  __uint64_t rsi;
  __uint64_t rbp;
  __uint64_t rbx;
  __uint64_t rdx;
  __uint64_t rax;
  __uint64_t rcx;
  __uint64_t rsp;
  __uint64_t rip;
  __uint64_t eflags;
  unsigned short cs;
  unsigned short gs;
  unsigned short fs;
  unsigned short __pad0;
  __uint64_t err;
  __uint64_t trapno;
  __uint64_t oldmask;
  __uint64_t cr2;
  __extension__ union
    {
      struct _fpstate * fpstate;
      __uint64_t __fpstate_word;
    };
  __uint64_t __reserved1 [8];
};



struct _xsave_hdr
{
  __uint64_t xstate_bv;
  __uint64_t __glibc_reserved1[2];
  __uint64_t __glibc_reserved2[5];
};

struct _ymmh_state
{
  __uint32_t ymmh_space[64];
};

struct _xstate
{
  struct _fpstate fpstate;
  struct _xsave_hdr xstate_hdr;
  struct _ymmh_state ymmh;
};
# 292 "../signal/signal.h" 2


extern int sigreturn (struct sigcontext *__scp) __attribute__ ((__nothrow__ ));






# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 302 "../signal/signal.h" 2

# 1 "../sysdeps/unix/sysv/linux/bits/types/stack_t.h" 1
# 23 "../sysdeps/unix/sysv/linux/bits/types/stack_t.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 24 "../sysdeps/unix/sysv/linux/bits/types/stack_t.h" 2


typedef struct
  {
    void *ss_sp;
    int ss_flags;
    size_t ss_size;
  } stack_t;
# 304 "../signal/signal.h" 2


# 1 "../sysdeps/unix/sysv/linux/x86/sys/ucontext.h" 1
# 23 "../sysdeps/unix/sysv/linux/x86/sys/ucontext.h"
# 1 "../include/bits/types.h" 1
# 24 "../sysdeps/unix/sysv/linux/x86/sys/ucontext.h" 2
# 1 "../include/bits/types/sigset_t.h" 1
# 25 "../sysdeps/unix/sysv/linux/x86/sys/ucontext.h" 2
# 37 "../sysdeps/unix/sysv/linux/x86/sys/ucontext.h"
__extension__ typedef long long int greg_t;
# 46 "../sysdeps/unix/sysv/linux/x86/sys/ucontext.h"
typedef greg_t gregset_t[23];



enum
{
  REG_R8 = 0,

  REG_R9,

  REG_R10,

  REG_R11,

  REG_R12,

  REG_R13,

  REG_R14,

  REG_R15,

  REG_RDI,

  REG_RSI,

  REG_RBP,

  REG_RBX,

  REG_RDX,

  REG_RAX,

  REG_RCX,

  REG_RSP,

  REG_RIP,

  REG_EFL,

  REG_CSGSFS,

  REG_ERR,

  REG_TRAPNO,

  REG_OLDMASK,

  REG_CR2

};


struct _libc_fpxreg
{
  unsigned short int significand[4];
  unsigned short int exponent;
  unsigned short int __glibc_reserved1[3];
};

struct _libc_xmmreg
{
  __uint32_t element[4];
};

struct _libc_fpstate
{

  __uint16_t cwd;
  __uint16_t swd;
  __uint16_t ftw;
  __uint16_t fop;
  __uint64_t rip;
  __uint64_t rdp;
  __uint32_t mxcsr;
  __uint32_t mxcr_mask;
  struct _libc_fpxreg _st[8];
  struct _libc_xmmreg _xmm[16];
  __uint32_t __glibc_reserved1[24];
};


typedef struct _libc_fpstate *fpregset_t;


typedef struct
  {
    gregset_t gregs;

    fpregset_t fpregs;
    __extension__ unsigned long long __reserved1 [8];
} mcontext_t;


typedef struct ucontext_t
  {
    unsigned long int uc_flags;
    struct ucontext_t *uc_link;
    stack_t uc_stack;
    mcontext_t uc_mcontext;
    sigset_t uc_sigmask;
    struct _libc_fpstate __fpregs_mem;
    __extension__ unsigned long long int __ssp[4];
  } ucontext_t;
# 307 "../signal/signal.h" 2







extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__nothrow__ ));

# 1 "../sysdeps/unix/sysv/linux/bits/sigstack.h" 1
# 317 "../signal/signal.h" 2
# 1 "../sysdeps/unix/sysv/linux/bits/ss_flags.h" 1
# 27 "../sysdeps/unix/sysv/linux/bits/ss_flags.h"
enum
{
  SS_ONSTACK = 1,

  SS_DISABLE

};
# 318 "../signal/signal.h" 2



extern int sigaltstack (const stack_t *__restrict __ss,
   stack_t *__restrict __oss) __attribute__ ((__nothrow__ ));




# 1 "../include/bits/types/struct_sigstack.h" 1
# 1 "../signal/bits/types/struct_sigstack.h" 1
# 23 "../signal/bits/types/struct_sigstack.h"
struct sigstack
  {
    void *ss_sp;
    int ss_onstack;
  };
# 1 "../include/bits/types/struct_sigstack.h" 2
# 328 "../signal/signal.h" 2







extern int sigstack (struct sigstack *__ss, struct sigstack *__oss)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));






extern int sighold (int __sig) __attribute__ ((__nothrow__ ));


extern int sigrelse (int __sig) __attribute__ ((__nothrow__ ));


extern int sigignore (int __sig) __attribute__ ((__nothrow__ ));


extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __attribute__ ((__nothrow__ ));






# 1 "../sysdeps/pthread/bits/sigthread.h" 1
# 31 "../sysdeps/pthread/bits/sigthread.h"
extern int pthread_sigmask (int __how,
       const __sigset_t *__restrict __newmask,
       __sigset_t *__restrict __oldmask)__attribute__ ((__nothrow__ ));


extern int pthread_kill (pthread_t __threadid, int __signo) __attribute__ ((__nothrow__ ));



extern int pthread_sigqueue (pthread_t __threadid, int __signo,
        const union sigval __value) __attribute__ ((__nothrow__ ));
# 360 "../signal/signal.h" 2






extern int __libc_current_sigrtmin (void) __attribute__ ((__nothrow__ ));

extern int __libc_current_sigrtmax (void) __attribute__ ((__nothrow__ ));





# 3 "../include/signal.h" 2







extern int __sigpause (int sig_or_mask, int is_sig);







extern __sighandler_t __bsd_signal (int __sig, __sighandler_t __handler);
extern int __kill (__pid_t __pid, int __sig);

extern int __sigaction (int __sig, const struct sigaction *__restrict __act,
   struct sigaction *__restrict __oact);

extern int __sigblock (int __mask);

extern int __sigsetmask (int __mask);
extern int __sigprocmask (int __how,
     const sigset_t *__set, sigset_t *__oset);

extern int __sigsuspend (const sigset_t *__set);

extern int __sigwait (const sigset_t *__set, int *__sig);

extern int __sigwaitinfo (const sigset_t *__set, siginfo_t *__info);

extern int __sigtimedwait (const sigset_t *__set, siginfo_t *__info,
      const struct timespec *__timeout);

extern int __sigqueue (__pid_t __pid, int __sig,
         const union sigval __val);

extern int __sigreturn (struct sigcontext *__scp);

extern int __sigaltstack (const stack_t *__ss,
     stack_t *__oss);

extern int __libc_sigaction (int sig, const struct sigaction *act,
        struct sigaction *oact);


extern int __default_sigpause (int mask);
extern int __xpg_sigpause (int sig);


extern int __libc_allocate_rtsig (int __high);
# 29 "../misc/sys/param.h" 2


# 1 "../sysdeps/unix/sysv/linux/bits/param.h" 1
# 28 "../sysdeps/unix/sysv/linux/bits/param.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/linux/param.h" 1 3 4




# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/param.h" 1 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm-generic/param.h" 1 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/param.h" 2 3 4
# 6 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/linux/param.h" 2 3 4
# 29 "../sysdeps/unix/sysv/linux/bits/param.h" 2
# 32 "../misc/sys/param.h" 2
# 1 "../include/sys/param.h" 2
# 42 "../sysdeps/generic/hp-timing-common.h" 2
# 1 "../sysdeps/generic/_itoa.h" 1
# 22 "../sysdeps/generic/_itoa.h"
# 1 "../include/limits.h" 1
# 183 "../include/limits.h"
# 1 "../include/bits/posix1_lim.h" 1
# 184 "../include/limits.h" 2



# 1 "../include/bits/posix2_lim.h" 1
# 188 "../include/limits.h" 2
# 23 "../sysdeps/generic/_itoa.h" 2
# 44 "../sysdeps/generic/_itoa.h"
extern char *_itoa (unsigned long long int value, char *buflim,
      unsigned int base, int upper_case) ;

extern const char _itoa_upper_digits[];
extern const char _itoa_lower_digits[];
# 59 "../sysdeps/generic/_itoa.h"
static inline char * __attribute__ ((unused, always_inline))
_itoa_word (unsigned long int value, char *buflim,
     unsigned int base, int upper_case)
{
  const char *digits = (upper_case
   ? _itoa_upper_digits
   : _itoa_lower_digits);

  switch (base)
    {







      case 10: do *--buflim = digits[value % 10]; while ((value /= 10) != 0); break;
      case 16: do *--buflim = digits[value % 16]; while ((value /= 16) != 0); break;
      case 8: do *--buflim = digits[value % 8]; while ((value /= 8) != 0); break;
    default:
      do
 *--buflim = digits[value % base];
      while ((value /= base) != 0);
    }
  return buflim;
}





extern char *_fitoa_word (unsigned long int value, char *buf,
     unsigned int base,
     int upper_case) ;
extern char *_fitoa (unsigned long long value, char *buf, unsigned int base,
       int upper_case) ;
# 43 "../sysdeps/generic/hp-timing-common.h" 2
# 39 "../sysdeps/x86_64/hp-timing.h" 2
# 28 "../nptl/descr.h" 2
# 1 "../include/list_t.h" 1
# 25 "../include/list_t.h"
typedef struct list_head
{
  struct list_head *next;
  struct list_head *prev;
} list_t;
# 29 "../nptl/descr.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h" 1
# 22 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h"
# 1 "../include/stap-probe.h" 1
# 23 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h" 2


# 1 "../include/time.h" 1

# 1 "../time/time.h" 1
# 29 "../time/time.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 30 "../time/time.h" 2



# 1 "../sysdeps/unix/sysv/linux/bits/time.h" 1
# 26 "../sysdeps/unix/sysv/linux/bits/time.h"
# 1 "../include/bits/types.h" 1
# 27 "../sysdeps/unix/sysv/linux/bits/time.h" 2
# 73 "../sysdeps/unix/sysv/linux/bits/time.h"
# 1 "../sysdeps/unix/sysv/linux/bits/timex.h" 1
# 21 "../sysdeps/unix/sysv/linux/bits/timex.h"
# 1 "../include/bits/types.h" 1
# 22 "../sysdeps/unix/sysv/linux/bits/timex.h" 2
# 1 "../include/bits/types/struct_timeval.h" 1
# 23 "../sysdeps/unix/sysv/linux/bits/timex.h" 2



struct timex
{
  unsigned int modes;
  __syscall_slong_t offset;
  __syscall_slong_t freq;
  __syscall_slong_t maxerror;
  __syscall_slong_t esterror;
  int status;
  __syscall_slong_t constant;
  __syscall_slong_t precision;
  __syscall_slong_t tolerance;
  struct timeval time;
  __syscall_slong_t tick;
  __syscall_slong_t ppsfreq;
  __syscall_slong_t jitter;
  int shift;
  __syscall_slong_t stabil;
  __syscall_slong_t jitcnt;
  __syscall_slong_t calcnt;
  __syscall_slong_t errcnt;
  __syscall_slong_t stbcnt;

  int tai;


  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32;
};
# 74 "../sysdeps/unix/sysv/linux/bits/time.h" 2




extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) __attribute__ ((__nothrow__ ));


# 34 "../time/time.h" 2



# 1 "../include/bits/types/clock_t.h" 1
# 38 "../time/time.h" 2
# 1 "../include/bits/types/time_t.h" 1
# 39 "../time/time.h" 2
# 1 "../include/bits/types/struct_tm.h" 1
# 1 "../time/bits/types/struct_tm.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/struct_tm.h" 2


struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};
# 1 "../include/bits/types/struct_tm.h" 2
# 40 "../time/time.h" 2


# 1 "../include/bits/types/struct_timespec.h" 1
# 43 "../time/time.h" 2



# 1 "../include/bits/types/clockid_t.h" 1
# 47 "../time/time.h" 2
# 1 "../include/bits/types/timer_t.h" 1
# 48 "../time/time.h" 2
# 1 "../include/bits/types/struct_itimerspec.h" 1
# 1 "../time/bits/types/struct_itimerspec.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../time/bits/types/struct_itimerspec.h" 2
# 1 "../include/bits/types/struct_timespec.h" 1
# 6 "../time/bits/types/struct_itimerspec.h" 2


struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };
# 1 "../include/bits/types/struct_itimerspec.h" 2
# 49 "../time/time.h" 2
struct sigevent;
# 60 "../time/time.h"
# 1 "../include/bits/types/locale_t.h" 1
# 61 "../time/time.h" 2











extern clock_t clock (void) __attribute__ ((__nothrow__ ));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ ));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ ));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ ));




extern char *strptime (const char *__restrict __s,
         const char *__restrict __fmt, struct tm *__tp)
     __attribute__ ((__nothrow__ ));






extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     locale_t __loc) __attribute__ ((__nothrow__ ));



extern char *strptime_l (const char *__restrict __s,
    const char *__restrict __fmt, struct tm *__tp,
    locale_t __loc) __attribute__ ((__nothrow__ ));





extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ ));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ ));




extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ ));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ ));




extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ ));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ ));






extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ ));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ ));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ ));



extern int daylight;
extern long int timezone;





extern int stime (const time_t *__when) __attribute__ ((__nothrow__ ));
# 196 "../time/time.h"
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ ));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ ));


extern int dysize (int __year) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
# 211 "../time/time.h"
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ ));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ ));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ ));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ ));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ ));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ ));


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ ));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ ));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ ));





extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ )) ;
# 280 "../time/time.h"
extern int getdate_err;
# 289 "../time/time.h"
extern struct tm *getdate (const char *__string);
# 303 "../time/time.h"
extern int getdate_r (const char *__restrict __string,
        struct tm *__restrict __resbufp);



# 3 "../include/time.h" 2


# 1 "../include/bits/types/locale_t.h" 1
# 6 "../include/time.h" 2

extern __typeof (strftime_l) __strftime_l;

extern __typeof (strptime_l) __strptime_l;









extern __typeof (clock_getres) __clock_getres;
extern __typeof (clock_gettime) __clock_gettime;

extern __typeof (clock_settime) __clock_settime;
extern __typeof (clock_nanosleep) __clock_nanosleep;
extern __typeof (clock_getcpuclockid) __clock_getcpuclockid;


struct tm;



typedef __int64_t internal_time_t;


extern const unsigned short int __mon_yday[2][13] ;


extern struct tm _tmbuf ;


extern char *__tzstring (const char *string) ;

extern int __use_tzfile ;

extern void __tzfile_read (const char *file, size_t extra,
      char **extrap) ;
extern void __tzfile_compute (internal_time_t timer, int use_localtime,
         long int *leap_correct, int *leap_hit,
         struct tm *tp) ;
extern void __tzfile_default (const char *std, const char *dst,
         long int stdoff, long int dstoff)
  ;
extern void __tzset_parse_tz (const char *tz) ;
extern void __tz_compute (time_t timer, struct tm *tm, int use_localtime)
  __attribute__ ((__nothrow__ )) ;




extern time_t __mktime_internal (struct tm *__tp,
     struct tm *(*__func) (const time_t *,
             struct tm *),
     time_t *__offset) ;
extern struct tm *__localtime_r (const time_t *__timer,
     struct tm *__tp) ;

extern struct tm *__gmtime_r (const time_t *__restrict __timer,
         struct tm *__restrict __tp);






extern int __offtime (const time_t *__timer,
        long int __offset,
        struct tm *__tp) ;

extern char *__asctime_r (const struct tm *__tp, char *__buf)
  ;
extern void __tzset (void) ;


extern struct tm *__tz_convert (const time_t *timer, int use_localtime,
    struct tm *tp) ;

extern int __nanosleep (const struct timespec *__requested_time,
   struct timespec *__remaining);

extern int __getdate_r (const char *__string, struct tm *__resbufp)
  ;



extern int __getclktck (void) ;



extern char * __strptime_internal (const char *rp, const char *fmt,
       struct tm *tm, void *statep,
       locale_t locparam) ;

extern double __difftime (time_t time1, time_t time0);
# 26 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h" 2
# 1 "../include/sys/param.h" 1
# 27 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h" 2

# 1 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h"
# 1 "../sysdeps/unix/sysv/linux/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 2
# 29 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h" 2
# 47 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h"
# 1 "../sysdeps/unix/sysv/linux/lowlevellock-futex.h" 1
# 25 "../sysdeps/unix/sysv/linux/lowlevellock-futex.h"
# 1 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h"
# 1 "../sysdeps/unix/sysv/linux/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 2
# 26 "../sysdeps/unix/sysv/linux/lowlevellock-futex.h" 2
# 48 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h" 2
# 175 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h"
extern int __lll_timedlock_elision (int *futex, short *adapt_count,
      const struct timespec *timeout,
      int private) ;
# 240 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h"
extern int __lll_timedwait_tid (int *, const struct timespec *)
     ;
# 254 "../sysdeps/unix/sysv/linux/x86_64/lowlevellock.h"
extern int __lll_lock_elision (int *futex, short *adapt_count, int private)
  ;

extern int __lll_unlock_elision (int *lock, int private)
  ;

extern int __lll_trylock_elision (int *lock, short *adapt_count)
  ;
# 30 "../nptl/descr.h" 2
# 1 "../sysdeps/x86_64/nptl/pthreaddef.h" 1
# 31 "../nptl/descr.h" 2
# 1 "../sysdeps/unix/sysv/linux/dl-sysdep.h" 1
# 19 "../sysdeps/unix/sysv/linux/dl-sysdep.h"
# 1 "../sysdeps/generic/dl-sysdep.h" 1
# 20 "../sysdeps/unix/sysv/linux/dl-sysdep.h" 2
# 31 "../sysdeps/unix/sysv/linux/dl-sysdep.h"
extern int _dl_discover_osversion (void) ;
# 32 "../nptl/descr.h" 2
# 1 "../nptl/../nptl_db/thread_db.h" 1
# 25 "../nptl/../nptl_db/thread_db.h"
# 1 "../include/pthread.h" 1
# 1 "../sysdeps/nptl/pthread.h" 1
# 22 "../sysdeps/nptl/pthread.h"
# 1 "../include/endian.h" 1
# 23 "../sysdeps/nptl/pthread.h" 2





# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 29 "../sysdeps/nptl/pthread.h" 2
# 1 "../include/bits/types/struct_timespec.h" 1
# 30 "../sysdeps/nptl/pthread.h" 2



enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL



  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 115 "../sysdeps/nptl/pthread.h"
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 156 "../sysdeps/nptl/pthread.h"
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 191 "../sysdeps/nptl/pthread.h"
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 229 "../sysdeps/nptl/pthread.h"





extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) ;





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);




extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) __attribute__ ((__nothrow__ ));







extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
     const struct timespec *__abstime);






extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ ));



extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ )) __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ )) ;




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ )) ;




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) __attribute__ ((__nothrow__ )) ;





extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
     size_t __cpusetsize,
     const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_attr_getaffinity_np (const pthread_attr_t *__attr,
     size_t __cpusetsize,
     cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_getattr_default_np (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_setattr_default_np (const pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ )) ;




extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ )) ;







extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ ));




extern int pthread_getname_np (pthread_t __target_thread, char *__buf,
          size_t __buflen)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_setname_np (pthread_t __target_thread, const char *__name)
     __attribute__ ((__nothrow__ )) ;





extern int pthread_getconcurrency (void) __attribute__ ((__nothrow__ ));


extern int pthread_setconcurrency (int __level) __attribute__ ((__nothrow__ ));







extern int pthread_yield (void) __attribute__ ((__nothrow__ ));




extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
       const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
       cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ )) ;
# 495 "../sysdeps/nptl/pthread.h"
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) ;
# 507 "../sysdeps/nptl/pthread.h"
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 541 "../sysdeps/nptl/pthread.h"
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};
# 681 "../sysdeps/nptl/pthread.h"
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
     ;
# 693 "../sysdeps/nptl/pthread.h"
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
  ;
# 716 "../sysdeps/nptl/pthread.h"
extern void __pthread_register_cancel_defer (__pthread_unwind_buf_t *__buf)
     ;
# 729 "../sysdeps/nptl/pthread.h"
extern void __pthread_unregister_cancel_restore (__pthread_unwind_buf_t *__buf)
  ;



extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;



struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __attribute__ ((__nothrow__));





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) ;


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) ;



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) __attribute__ ((__nothrow__)) ;



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) ;



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ )) ;




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ )) ;

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ )) ;
# 807 "../sysdeps/nptl/pthread.h"
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     __attribute__ ((__nothrow__ )) ;




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     __attribute__ ((__nothrow__ )) ;

extern int pthread_mutexattr_getrobust_np (const pthread_mutexattr_t *__attr,
        int *__robustness)
     __attribute__ ((__nothrow__ )) ;



extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     __attribute__ ((__nothrow__ )) ;

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
        int __robustness)
     __attribute__ ((__nothrow__ )) ;
# 889 "../sysdeps/nptl/pthread.h"
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) ;


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  __attribute__ ((__nothrow__)) ;



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) ;



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) ;


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) ;



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) ;



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) ;





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) __attribute__ ((__nothrow__ )) ;







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) ;


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) ;






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     ;
# 1001 "../sysdeps/nptl/pthread.h"
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     ;




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) __attribute__ ((__nothrow__ )) ;



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     __attribute__ ((__nothrow__ )) ;
# 1045 "../sysdeps/nptl/pthread.h"
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) ;


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) ;


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) ;






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) ;



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) ;


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     __attribute__ ((__nothrow__ )) ;
# 1112 "../sysdeps/nptl/pthread.h"
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ )) ;


extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ ));


extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ ));


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) __attribute__ ((__nothrow__ )) ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     __attribute__ ((__nothrow__ )) ;
# 1146 "../sysdeps/nptl/pthread.h"
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) __attribute__ ((__nothrow__ ));




extern __inline int
__attribute__ ((__nothrow__ )) pthread_equal (pthread_t __thread1, pthread_t __thread2)
{
  return __thread1 == __thread2;
}



# 2 "../include/pthread.h" 2





extern int __pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ )) ;
extern int __pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) ;


extern void __pthread_initialize (void) __attribute__ ((weak));
# 26 "../nptl/../nptl_db/thread_db.h" 2

# 1 "../include/sys/types.h" 1
# 28 "../nptl/../nptl_db/thread_db.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h" 1
# 31 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h"
# 1 "../include/sys/time.h" 1
# 20 "../include/sys/time.h"
# 1 "../time/sys/time.h" 1
# 23 "../time/sys/time.h"
# 1 "../include/bits/types.h" 1
# 24 "../time/sys/time.h" 2
# 1 "../include/bits/types/time_t.h" 1
# 25 "../time/sys/time.h" 2
# 1 "../include/bits/types/struct_timeval.h" 1
# 26 "../time/sys/time.h" 2
# 34 "../time/sys/time.h"

# 52 "../time/sys/time.h"
struct timezone
  {
    int tz_minuteswest;
    int tz_dsttime;
  };

typedef struct timezone *__restrict __timezone_ptr_t;
# 68 "../time/sys/time.h"
extern int gettimeofday (struct timeval *__restrict __tv,
    __timezone_ptr_t __tz) __attribute__ ((__nothrow__ )) ;




extern int settimeofday (const struct timeval *__tv,
    const struct timezone *__tz)
     __attribute__ ((__nothrow__ ));





extern int adjtime (const struct timeval *__delta,
      struct timeval *__olddelta) __attribute__ ((__nothrow__ ));




enum __itimer_which
  {

    ITIMER_REAL = 0,


    ITIMER_VIRTUAL = 1,



    ITIMER_PROF = 2

  };



struct itimerval
  {

    struct timeval it_interval;

    struct timeval it_value;
  };




typedef enum __itimer_which __itimer_which_t;






extern int getitimer (__itimer_which_t __which,
        struct itimerval *__value) __attribute__ ((__nothrow__ ));




extern int setitimer (__itimer_which_t __which,
        const struct itimerval *__restrict __new,
        struct itimerval *__restrict __old) __attribute__ ((__nothrow__ ));




extern int utimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ )) ;



extern int lutimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ )) ;


extern int futimes (int __fd, const struct timeval __tvp[2]) __attribute__ ((__nothrow__ ));






extern int futimesat (int __fd, const char *__file,
        const struct timeval __tvp[2]) __attribute__ ((__nothrow__ ));
# 186 "../time/sys/time.h"

# 21 "../include/sys/time.h" 2


extern int __gettimeofday (struct timeval *__tv,
      struct timezone *__tz);


extern int __settimeofday (const struct timeval *__tv,
      const struct timezone *__tz)
 ;
extern int __adjtime (const struct timeval *__delta,
        struct timeval *__olddelta);
extern int __getitimer (enum __itimer_which __which,
   struct itimerval *__value);
extern int __setitimer (enum __itimer_which __which,
   const struct itimerval *__restrict __new,
   struct itimerval *__restrict __old)
 ;
extern int __utimes (const char *__file, const struct timeval __tvp[2])
 ;
extern int __futimes (int fd, const struct timeval tvp[2]) ;
# 32 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h" 2
# 1 "../include/sys/types.h" 1
# 33 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86/sys/user.h" 1
# 27 "../sysdeps/unix/sysv/linux/x86/sys/user.h"
struct user_fpregs_struct
{
  unsigned short int cwd;
  unsigned short int swd;
  unsigned short int ftw;
  unsigned short int fop;
  __extension__ unsigned long long int rip;
  __extension__ unsigned long long int rdp;
  unsigned int mxcsr;
  unsigned int mxcr_mask;
  unsigned int st_space[32];
  unsigned int xmm_space[64];
  unsigned int padding[24];
};

struct user_regs_struct
{
  __extension__ unsigned long long int r15;
  __extension__ unsigned long long int r14;
  __extension__ unsigned long long int r13;
  __extension__ unsigned long long int r12;
  __extension__ unsigned long long int rbp;
  __extension__ unsigned long long int rbx;
  __extension__ unsigned long long int r11;
  __extension__ unsigned long long int r10;
  __extension__ unsigned long long int r9;
  __extension__ unsigned long long int r8;
  __extension__ unsigned long long int rax;
  __extension__ unsigned long long int rcx;
  __extension__ unsigned long long int rdx;
  __extension__ unsigned long long int rsi;
  __extension__ unsigned long long int rdi;
  __extension__ unsigned long long int orig_rax;
  __extension__ unsigned long long int rip;
  __extension__ unsigned long long int cs;
  __extension__ unsigned long long int eflags;
  __extension__ unsigned long long int rsp;
  __extension__ unsigned long long int ss;
  __extension__ unsigned long long int fs_base;
  __extension__ unsigned long long int gs_base;
  __extension__ unsigned long long int ds;
  __extension__ unsigned long long int es;
  __extension__ unsigned long long int fs;
  __extension__ unsigned long long int gs;
};

struct user
{
  struct user_regs_struct regs;
  int u_fpvalid;
  struct user_fpregs_struct i387;
  __extension__ unsigned long long int u_tsize;
  __extension__ unsigned long long int u_dsize;
  __extension__ unsigned long long int u_ssize;
  __extension__ unsigned long long int start_code;
  __extension__ unsigned long long int start_stack;
  __extension__ long long int signal;
  int reserved;
  __extension__ union
    {
      struct user_regs_struct* u_ar0;
      __extension__ unsigned long long int __u_ar0_word;
    };
  __extension__ union
    {
      struct user_fpregs_struct* u_fpstate;
      __extension__ unsigned long long int __u_fpstate_word;
    };
  __extension__ unsigned long long int magic;
  char u_comm [32];
  __extension__ unsigned long long int u_debugreg [8];
};
# 34 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h" 2





__extension__ typedef unsigned long long elf_greg_t;
# 49 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h"
typedef elf_greg_t elf_gregset_t[(sizeof (struct user_regs_struct) / sizeof(elf_greg_t))];
# 63 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h"
typedef struct user_fpregs_struct elf_fpregset_t;



struct elf_siginfo
  {
    int si_signo;
    int si_code;
    int si_errno;
  };
# 82 "../sysdeps/unix/sysv/linux/x86/sys/procfs.h"
struct elf_prstatus
  {
    struct elf_siginfo pr_info;
    short int pr_cursig;
    unsigned long int pr_sigpend;
    unsigned long int pr_sighold;
    __pid_t pr_pid;
    __pid_t pr_ppid;
    __pid_t pr_pgrp;
    __pid_t pr_sid;
    struct timeval pr_utime;
    struct timeval pr_stime;
    struct timeval pr_cutime;
    struct timeval pr_cstime;
    elf_gregset_t pr_reg;
    int pr_fpvalid;
  };




struct elf_prpsinfo
  {
    char pr_state;
    char pr_sname;
    char pr_zomb;
    char pr_nice;
    unsigned long int pr_flag;




    unsigned int pr_uid;
    unsigned int pr_gid;

    int pr_pid, pr_ppid, pr_pgrp, pr_sid;

    char pr_fname[16];
    char pr_psargs[(80)];
  };







typedef void *psaddr_t;


typedef elf_gregset_t prgregset_t;
typedef elf_fpregset_t prfpregset_t;



typedef __pid_t lwpid_t;


typedef struct elf_prstatus prstatus_t;
typedef struct elf_prpsinfo prpsinfo_t;


# 29 "../nptl/../nptl_db/thread_db.h" 2



typedef enum
{
  TD_OK,
  TD_ERR,
  TD_NOTHR,
  TD_NOSV,
  TD_NOLWP,
  TD_BADPH,
  TD_BADTH,
  TD_BADSH,
  TD_BADTA,
  TD_BADKEY,
  TD_NOMSG,
  TD_NOFPREGS,
  TD_NOLIBTHREAD,
  TD_NOEVENT,
  TD_NOCAPAB,
  TD_DBERR,
  TD_NOAPLIC,
  TD_NOTSD,
  TD_MALLOC,
  TD_PARTIALREG,
  TD_NOXREGS,
  TD_TLSDEFER,
  TD_NOTALLOC = TD_TLSDEFER,
  TD_VERSION,
  TD_NOTLS
} td_err_e;




typedef enum
{
  TD_THR_ANY_STATE,
  TD_THR_UNKNOWN,
  TD_THR_STOPPED,
  TD_THR_RUN,
  TD_THR_ACTIVE,
  TD_THR_ZOMBIE,
  TD_THR_SLEEP,
  TD_THR_STOPPED_ASLEEP
} td_thr_state_e;



typedef enum
{
  TD_THR_ANY_TYPE,
  TD_THR_USER,
  TD_THR_SYSTEM
} td_thr_type_e;





typedef struct td_thragent td_thragent_t;


typedef struct td_thrhandle
{
  td_thragent_t *th_ta_p;
  psaddr_t th_unique;
} td_thrhandle_t;



struct link_map;
# 115 "../nptl/../nptl_db/thread_db.h"
typedef struct td_thr_events
{
  uint32_t event_bits[2];
} td_thr_events_t;
# 154 "../nptl/../nptl_db/thread_db.h"
typedef enum
{
  TD_ALL_EVENTS,
  TD_EVENT_NONE = TD_ALL_EVENTS,
  TD_READY,
  TD_SLEEP,
  TD_SWITCHTO,
  TD_SWITCHFROM,
  TD_LOCK_TRY,
  TD_CATCHSIG,
  TD_IDLE,
  TD_CREATE,
  TD_DEATH,
  TD_PREEMPT,
  TD_PRI_INHERIT,
  TD_REAP,
  TD_CONCURRENCY,
  TD_TIMEOUT,
  TD_MIN_EVENT_NUM = TD_READY,
  TD_MAX_EVENT_NUM = TD_TIMEOUT,
  TD_EVENTS_ENABLE = 31
} td_event_e;


typedef enum
{
  NOTIFY_BPT,
  NOTIFY_AUTOBPT,

  NOTIFY_SYSCALL
} td_notify_e;


typedef struct td_notify
{
  td_notify_e type;
  union
  {
    psaddr_t bptaddr;
    int syscallno;
  } u;
} td_notify_t;


typedef struct td_event_msg
{
  td_event_e event;
  const td_thrhandle_t *th_p;
  union
  {



    uintptr_t data;
  } msg;
} td_event_msg_t;


typedef struct
{
  td_thr_events_t eventmask;
  td_event_e eventnum;
  void *eventdata;
} td_eventbuf_t;



typedef struct td_ta_stats
{
  int nthreads;
  int r_concurrency;
  int nrunnable_num;
  int nrunnable_den;
  int a_concurrency_num;
  int a_concurrency_den;
  int nlwps_num;

  int nlwps_den;

  int nidle_num;

  int nidle_den;

} td_ta_stats_t;




typedef pthread_t thread_t;
typedef pthread_key_t thread_key_t;



typedef int td_thr_iter_f (const td_thrhandle_t *, void *);


typedef int td_key_iter_f (thread_key_t, void (*) (void *), void *);




struct ps_prochandle;



typedef struct td_thrinfo
{
  td_thragent_t *ti_ta_p;
  unsigned int ti_user_flags;
  thread_t ti_tid;

  char *ti_tls;
  psaddr_t ti_startfunc;

  psaddr_t ti_stkbase;
  long int ti_stksize;
  psaddr_t ti_ro_area;
  int ti_ro_size;
  td_thr_state_e ti_state;
  unsigned char ti_db_suspended;
  td_thr_type_e ti_type;

  intptr_t ti_pc;
  intptr_t ti_sp;
  short int ti_flags;
  int ti_pri;
  lwpid_t ti_lid;
  sigset_t ti_sigmask;
  unsigned char ti_traceme;

  unsigned char ti_preemptflag;
  unsigned char ti_pirecflag;
  sigset_t ti_pending;
  td_thr_events_t ti_events;
} td_thrinfo_t;






extern td_err_e td_init (void);


extern td_err_e td_log (void);


extern const char **td_symbol_list (void);


extern td_err_e td_ta_new (struct ps_prochandle *__ps, td_thragent_t **__ta);


extern td_err_e td_ta_delete (td_thragent_t *__ta);


extern td_err_e td_ta_get_nthreads (const td_thragent_t *__ta, int *__np);



extern td_err_e td_ta_get_ph (const td_thragent_t *__ta,
         struct ps_prochandle **__ph);



extern td_err_e td_ta_map_id2thr (const td_thragent_t *__ta, pthread_t __pt,
      td_thrhandle_t *__th);



extern td_err_e td_ta_map_lwp2thr (const td_thragent_t *__ta, lwpid_t __lwpid,
       td_thrhandle_t *__th);




extern td_err_e td_ta_thr_iter (const td_thragent_t *__ta,
    td_thr_iter_f *__callback, void *__cbdata_p,
    td_thr_state_e __state, int __ti_pri,
    sigset_t *__ti_sigmask_p,
    unsigned int __ti_user_flags);


extern td_err_e td_ta_tsd_iter (const td_thragent_t *__ta, td_key_iter_f *__ki,
    void *__p);



extern td_err_e td_ta_event_addr (const td_thragent_t *__ta,
      td_event_e __event, td_notify_t *__ptr);


extern td_err_e td_ta_set_event (const td_thragent_t *__ta,
     td_thr_events_t *__event);


extern td_err_e td_ta_clear_event (const td_thragent_t *__ta,
       td_thr_events_t *__event);


extern td_err_e td_ta_event_getmsg (const td_thragent_t *__ta,
        td_event_msg_t *__msg);



extern td_err_e td_ta_setconcurrency (const td_thragent_t *__ta, int __level);



extern td_err_e td_ta_enable_stats (const td_thragent_t *__ta, int __enable);


extern td_err_e td_ta_reset_stats (const td_thragent_t *__ta);


extern td_err_e td_ta_get_stats (const td_thragent_t *__ta,
     td_ta_stats_t *__statsp);



extern td_err_e td_thr_validate (const td_thrhandle_t *__th);


extern td_err_e td_thr_get_info (const td_thrhandle_t *__th,
     td_thrinfo_t *__infop);


extern td_err_e td_thr_getfpregs (const td_thrhandle_t *__th,
      prfpregset_t *__regset);


extern td_err_e td_thr_getgregs (const td_thrhandle_t *__th,
     prgregset_t __gregs);


extern td_err_e td_thr_getxregs (const td_thrhandle_t *__th, void *__xregs);


extern td_err_e td_thr_getxregsize (const td_thrhandle_t *__th, int *__sizep);


extern td_err_e td_thr_setfpregs (const td_thrhandle_t *__th,
      const prfpregset_t *__fpregs);


extern td_err_e td_thr_setgregs (const td_thrhandle_t *__th,
     prgregset_t __gregs);


extern td_err_e td_thr_setxregs (const td_thrhandle_t *__th,
     const void *__addr);



extern td_err_e td_thr_tlsbase (const td_thrhandle_t *__th,
    unsigned long int __modid,
    psaddr_t *__base);


extern td_err_e td_thr_tls_get_addr (const td_thrhandle_t *__th,
         psaddr_t __map_address, size_t __offset,
         psaddr_t *__address);



extern td_err_e td_thr_event_enable (const td_thrhandle_t *__th, int __event);


extern td_err_e td_thr_set_event (const td_thrhandle_t *__th,
      td_thr_events_t *__event);


extern td_err_e td_thr_clear_event (const td_thrhandle_t *__th,
        td_thr_events_t *__event);


extern td_err_e td_thr_event_getmsg (const td_thrhandle_t *__th,
         td_event_msg_t *__msg);



extern td_err_e td_thr_setprio (const td_thrhandle_t *__th, int __prio);



extern td_err_e td_thr_setsigpending (const td_thrhandle_t *__th,
          unsigned char __n, const sigset_t *__ss);


extern td_err_e td_thr_sigsetmask (const td_thrhandle_t *__th,
       const sigset_t *__ss);



extern td_err_e td_thr_tsd (const td_thrhandle_t *__th,
       const thread_key_t __tk, void **__data);



extern td_err_e td_thr_dbsuspend (const td_thrhandle_t *__th);


extern td_err_e td_thr_dbresume (const td_thrhandle_t *__th);
# 33 "../nptl/descr.h" 2

# 1 "../sysdeps/generic/unwind.h" 1
# 34 "../sysdeps/generic/unwind.h"
typedef unsigned _Unwind_Word __attribute__((__mode__(__unwind_word__)));
typedef signed _Unwind_Sword __attribute__((__mode__(__unwind_word__)));



typedef unsigned _Unwind_Ptr __attribute__((__mode__(__pointer__)));

typedef unsigned _Unwind_Internal_Ptr __attribute__((__mode__(__pointer__)));





typedef unsigned _Unwind_Exception_Class __attribute__((__mode__(__DI__)));



typedef enum
{
  _URC_NO_REASON = 0,
  _URC_FOREIGN_EXCEPTION_CAUGHT = 1,
  _URC_FATAL_PHASE2_ERROR = 2,
  _URC_FATAL_PHASE1_ERROR = 3,
  _URC_NORMAL_STOP = 4,
  _URC_END_OF_STACK = 5,
  _URC_HANDLER_FOUND = 6,
  _URC_INSTALL_CONTEXT = 7,
  _URC_CONTINUE_UNWIND = 8
} _Unwind_Reason_Code;
# 71 "../sysdeps/generic/unwind.h"
struct _Unwind_Exception;

typedef void (*_Unwind_Exception_Cleanup_Fn) (_Unwind_Reason_Code,
           struct _Unwind_Exception *);

struct _Unwind_Exception
{
  _Unwind_Exception_Class exception_class;
  _Unwind_Exception_Cleanup_Fn exception_cleanup;
  _Unwind_Word private_1;
  _Unwind_Word private_2;




} __attribute__((__aligned__));




typedef int _Unwind_Action;
# 103 "../sysdeps/generic/unwind.h"
struct _Unwind_Context;


extern _Unwind_Reason_Code _Unwind_RaiseException (struct _Unwind_Exception *);



typedef _Unwind_Reason_Code (*_Unwind_Stop_Fn)
     (int, _Unwind_Action, _Unwind_Exception_Class,
      struct _Unwind_Exception *, struct _Unwind_Context *, void *);

extern _Unwind_Reason_Code _Unwind_ForcedUnwind (struct _Unwind_Exception *,
       _Unwind_Stop_Fn,
       void *);


extern void _Unwind_DeleteException (struct _Unwind_Exception *);



extern void _Unwind_Resume (struct _Unwind_Exception *);




typedef _Unwind_Reason_Code (*_Unwind_Trace_Fn)
     (struct _Unwind_Context *, void *);

extern _Unwind_Reason_Code _Unwind_Backtrace (_Unwind_Trace_Fn, void *);






extern _Unwind_Word _Unwind_GetGR (struct _Unwind_Context *, int);
extern void _Unwind_SetGR (struct _Unwind_Context *, int, _Unwind_Word);

extern _Unwind_Ptr _Unwind_GetIP (struct _Unwind_Context *);
extern void _Unwind_SetIP (struct _Unwind_Context *, _Unwind_Ptr);


extern _Unwind_Word _Unwind_GetCFA (struct _Unwind_Context *);

extern void *_Unwind_GetLanguageSpecificData (struct _Unwind_Context *);

extern _Unwind_Ptr _Unwind_GetRegionStart (struct _Unwind_Context *);
# 166 "../sysdeps/generic/unwind.h"
typedef _Unwind_Reason_Code (*_Unwind_Personality_Fn)
     (int, _Unwind_Action, _Unwind_Exception_Class,
      struct _Unwind_Exception *, struct _Unwind_Context *);




struct SjLj_Function_Context;
extern void _Unwind_SjLj_Register (struct SjLj_Function_Context *);
extern void _Unwind_SjLj_Unregister (struct SjLj_Function_Context *);

extern _Unwind_Reason_Code _Unwind_SjLj_RaiseException
     (struct _Unwind_Exception *);
extern _Unwind_Reason_Code _Unwind_SjLj_ForcedUnwind
     (struct _Unwind_Exception *, _Unwind_Stop_Fn, void *);
extern void _Unwind_SjLj_Resume (struct _Unwind_Exception *);
# 207 "../sysdeps/generic/unwind.h"
extern _Unwind_Ptr _Unwind_GetDataRelBase (struct _Unwind_Context *);
extern _Unwind_Ptr _Unwind_GetTextRelBase (struct _Unwind_Context *);




extern void * _Unwind_FindEnclosingFunction (void *pc);
# 35 "../nptl/descr.h" 2
# 1 "../include/bits/types/res_state.h" 1
# 1 "../resolv/bits/types/res_state.h" 1



# 1 "../include/sys/types.h" 1
# 5 "../resolv/bits/types/res_state.h" 2
# 1 "../include/netinet/in.h" 1


# 1 "../inet/netinet/in.h" 1
# 23 "../inet/netinet/in.h"
# 1 "../include/sys/socket.h" 1

# 1 "../socket/sys/socket.h" 1
# 24 "../socket/sys/socket.h"


# 1 "../include/bits/types/struct_iovec.h" 1
# 1 "../misc/bits/types/struct_iovec.h" 1
# 23 "../misc/bits/types/struct_iovec.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 24 "../misc/bits/types/struct_iovec.h" 2


struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
# 1 "../include/bits/types/struct_iovec.h" 2
# 27 "../socket/sys/socket.h" 2

# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 29 "../socket/sys/socket.h" 2




# 1 "../sysdeps/unix/sysv/linux/bits/socket.h" 1
# 27 "../sysdeps/unix/sysv/linux/bits/socket.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 28 "../sysdeps/unix/sysv/linux/bits/socket.h" 2

# 1 "../include/sys/types.h" 1
# 30 "../sysdeps/unix/sysv/linux/bits/socket.h" 2



typedef __socklen_t socklen_t;




# 1 "../sysdeps/unix/sysv/linux/bits/socket_type.h" 1
# 24 "../sysdeps/unix/sysv/linux/bits/socket_type.h"
enum __socket_type
{
  SOCK_STREAM = 1,


  SOCK_DGRAM = 2,


  SOCK_RAW = 3,

  SOCK_RDM = 4,

  SOCK_SEQPACKET = 5,


  SOCK_DCCP = 6,

  SOCK_PACKET = 10,







  SOCK_CLOEXEC = 02000000,


  SOCK_NONBLOCK = 00004000


};
# 39 "../sysdeps/unix/sysv/linux/bits/socket.h" 2
# 172 "../sysdeps/unix/sysv/linux/bits/socket.h"
# 1 "../bits/sockaddr.h" 1
# 28 "../bits/sockaddr.h"
typedef unsigned short int sa_family_t;
# 173 "../sysdeps/unix/sysv/linux/bits/socket.h" 2


struct sockaddr
  {
    sa_family_t sa_family;
    char sa_data[14];
  };
# 188 "../sysdeps/unix/sysv/linux/bits/socket.h"
struct sockaddr_storage
  {
    sa_family_t ss_family;
    char __ss_padding[(128 - (sizeof (unsigned short int)) - sizeof (unsigned long int))];
    unsigned long int __ss_align;
  };



enum
  {
    MSG_OOB = 0x01,

    MSG_PEEK = 0x02,

    MSG_DONTROUTE = 0x04,



    MSG_TRYHARD = MSG_DONTROUTE,


    MSG_CTRUNC = 0x08,

    MSG_PROXY = 0x10,

    MSG_TRUNC = 0x20,

    MSG_DONTWAIT = 0x40,

    MSG_EOR = 0x80,

    MSG_WAITALL = 0x100,

    MSG_FIN = 0x200,

    MSG_SYN = 0x400,

    MSG_CONFIRM = 0x800,

    MSG_RST = 0x1000,

    MSG_ERRQUEUE = 0x2000,

    MSG_NOSIGNAL = 0x4000,

    MSG_MORE = 0x8000,

    MSG_WAITFORONE = 0x10000,

    MSG_BATCH = 0x40000,

    MSG_ZEROCOPY = 0x4000000,

    MSG_FASTOPEN = 0x20000000,


    MSG_CMSG_CLOEXEC = 0x40000000



  };




struct msghdr
  {
    void *msg_name;
    socklen_t msg_namelen;

    struct iovec *msg_iov;
    size_t msg_iovlen;

    void *msg_control;
    size_t msg_controllen;




    int msg_flags;
  };


struct cmsghdr
  {
    size_t cmsg_len;




    int cmsg_level;
    int cmsg_type;

    __extension__ unsigned char __cmsg_data [];

  };
# 302 "../sysdeps/unix/sysv/linux/bits/socket.h"
extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
          struct cmsghdr *__cmsg) __attribute__ ((__nothrow__ ));




extern __inline struct cmsghdr *
__attribute__ ((__nothrow__ )) __cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg)
{
  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))

    return (struct cmsghdr *) 0;

  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
          + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1)));
  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_control
     + __mhdr->msg_controllen)
      || ((unsigned char *) __cmsg + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1))
   > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))

    return (struct cmsghdr *) 0;
  return __cmsg;
}




enum
  {
    SCM_RIGHTS = 0x01


    , SCM_CREDENTIALS = 0x02


  };



struct ucred
{
  pid_t pid;
  uid_t uid;
  gid_t gid;
};
# 390 "../sysdeps/unix/sysv/linux/bits/socket.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/socket.h" 1 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm-generic/socket.h" 1 3 4




# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/sockios.h" 1 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm-generic/sockios.h" 1 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/sockios.h" 2 3 4
# 6 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm-generic/socket.h" 2 3 4
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot/usr/include/asm/socket.h" 2 3 4
# 391 "../sysdeps/unix/sysv/linux/bits/socket.h" 2
# 444 "../sysdeps/unix/sysv/linux/bits/socket.h"
struct linger
  {
    int l_onoff;
    int l_linger;
  };
# 34 "../socket/sys/socket.h" 2


# 1 "../include/bits/types/struct_osockaddr.h" 1
# 1 "../socket/bits/types/struct_osockaddr.h" 1





struct osockaddr
{
  unsigned short int sa_family;
  unsigned char sa_data[14];
};
# 1 "../include/bits/types/struct_osockaddr.h" 2
# 37 "../socket/sys/socket.h" 2




enum
{
  SHUT_RD = 0,

  SHUT_WR,

  SHUT_RDWR

};
# 79 "../socket/sys/socket.h"
typedef union { struct sockaddr *__restrict __sockaddr__; struct sockaddr_at *__restrict __sockaddr_at__; struct sockaddr_ax25 *__restrict __sockaddr_ax25__; struct sockaddr_dl *__restrict __sockaddr_dl__; struct sockaddr_eon *__restrict __sockaddr_eon__; struct sockaddr_in *__restrict __sockaddr_in__; struct sockaddr_in6 *__restrict __sockaddr_in6__; struct sockaddr_inarp *__restrict __sockaddr_inarp__; struct sockaddr_ipx *__restrict __sockaddr_ipx__; struct sockaddr_iso *__restrict __sockaddr_iso__; struct sockaddr_ns *__restrict __sockaddr_ns__; struct sockaddr_un *__restrict __sockaddr_un__; struct sockaddr_x25 *__restrict __sockaddr_x25__;
       } __SOCKADDR_ARG __attribute__ ((__transparent_union__));


typedef union { const struct sockaddr *__restrict __sockaddr__; const struct sockaddr_at *__restrict __sockaddr_at__; const struct sockaddr_ax25 *__restrict __sockaddr_ax25__; const struct sockaddr_dl *__restrict __sockaddr_dl__; const struct sockaddr_eon *__restrict __sockaddr_eon__; const struct sockaddr_in *__restrict __sockaddr_in__; const struct sockaddr_in6 *__restrict __sockaddr_in6__; const struct sockaddr_inarp *__restrict __sockaddr_inarp__; const struct sockaddr_ipx *__restrict __sockaddr_ipx__; const struct sockaddr_iso *__restrict __sockaddr_iso__; const struct sockaddr_ns *__restrict __sockaddr_ns__; const struct sockaddr_un *__restrict __sockaddr_un__; const struct sockaddr_x25 *__restrict __sockaddr_x25__;
       } __CONST_SOCKADDR_ARG __attribute__ ((__transparent_union__));





struct mmsghdr
  {
    struct msghdr msg_hdr;
    unsigned int msg_len;

  };






extern int socket (int __domain, int __type, int __protocol) __attribute__ ((__nothrow__ ));





extern int socketpair (int __domain, int __type, int __protocol,
         int __fds[2]) __attribute__ ((__nothrow__ ));


extern int bind (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len)
     __attribute__ ((__nothrow__ ));


extern int getsockname (int __fd, __SOCKADDR_ARG __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ ));
# 126 "../socket/sys/socket.h"
extern int connect (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len);



extern int getpeername (int __fd, __SOCKADDR_ARG __addr,
   socklen_t *__restrict __len) __attribute__ ((__nothrow__ ));






extern ssize_t send (int __fd, const void *__buf, size_t __n, int __flags);






extern ssize_t recv (int __fd, void *__buf, size_t __n, int __flags);






extern ssize_t sendto (int __fd, const void *__buf, size_t __n,
         int __flags, __CONST_SOCKADDR_ARG __addr,
         socklen_t __addr_len);
# 163 "../socket/sys/socket.h"
extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
    int __flags, __SOCKADDR_ARG __addr,
    socklen_t *__restrict __addr_len);







extern ssize_t sendmsg (int __fd, const struct msghdr *__message,
   int __flags);







extern int sendmmsg (int __fd, struct mmsghdr *__vmessages,
       unsigned int __vlen, int __flags);







extern ssize_t recvmsg (int __fd, struct msghdr *__message, int __flags);







extern int recvmmsg (int __fd, struct mmsghdr *__vmessages,
       unsigned int __vlen, int __flags,
       struct timespec *__tmo);






extern int getsockopt (int __fd, int __level, int __optname,
         void *__restrict __optval,
         socklen_t *__restrict __optlen) __attribute__ ((__nothrow__ ));




extern int setsockopt (int __fd, int __level, int __optname,
         const void *__optval, socklen_t __optlen) __attribute__ ((__nothrow__ ));





extern int listen (int __fd, int __n) __attribute__ ((__nothrow__ ));
# 232 "../socket/sys/socket.h"
extern int accept (int __fd, __SOCKADDR_ARG __addr,
     socklen_t *__restrict __addr_len);






extern int accept4 (int __fd, __SOCKADDR_ARG __addr,
      socklen_t *__restrict __addr_len, int __flags);
# 250 "../socket/sys/socket.h"
extern int shutdown (int __fd, int __how) __attribute__ ((__nothrow__ ));




extern int sockatmark (int __fd) __attribute__ ((__nothrow__ ));







extern int isfdtype (int __fd, int __fdtype) __attribute__ ((__nothrow__ ));
# 272 "../socket/sys/socket.h"

# 3 "../include/sys/socket.h" 2







extern int __socket (int __domain, int __type,
       int __protocol);






extern int __socketpair (int __domain, int __type, int __protocol,
    int __fds[2]) ;



extern int __opensock (void) ;



extern int __getpeername (int __fd, __SOCKADDR_ARG __addr,
     socklen_t *__len) ;


extern ssize_t __libc_send (int __fd, const void *__buf, size_t __n,
       int __flags);
extern ssize_t __send (int __fd, const void *__buf, size_t __n, int __flags);




extern ssize_t __libc_recv (int __fd, void *__buf, size_t __n, int __flags);



extern ssize_t __libc_sendto (int __fd, const void *__buf, size_t __n,
         int __flags, __CONST_SOCKADDR_ARG __addr,
         socklen_t __addr_len);





extern ssize_t __libc_recvfrom (int __fd, void *__restrict __buf, size_t __n,
    int __flags, __SOCKADDR_ARG __addr,
    socklen_t *__restrict __addr_len);





extern int __libc_connect (int __fd, __CONST_SOCKADDR_ARG __addr,
      socklen_t __len);
extern int __connect (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len);







extern ssize_t __recv (int __fd, void *__buf, size_t __n, int __flags);




extern ssize_t __libc_sendto (int __fd, const void *__buf, size_t __n,
         int __flags, __CONST_SOCKADDR_ARG __addr,
         socklen_t __addr_len);
extern ssize_t __sendto (int __fd, const void *__buf, size_t __n,
    int __flags, __CONST_SOCKADDR_ARG __addr,
    socklen_t __addr_len) ;





extern ssize_t __recvfrom (int __fd, void *__restrict __buf, size_t __n,
      int __flags, __SOCKADDR_ARG __addr,
      socklen_t *__restrict __addr_len) ;



extern ssize_t __libc_sendmsg (int __fd, const struct msghdr *__message,
          int __flags);
extern ssize_t __sendmsg (int __fd, const struct msghdr *__message,
     int __flags) ;


extern int __sendmmsg (int __fd, struct mmsghdr *__vmessages,
                       unsigned int __vlen, int __flags);





extern ssize_t __libc_recvmsg (int __fd, struct msghdr *__message,
          int __flags);
extern ssize_t __recvmsg (int __fd, struct msghdr *__message,
     int __flags) ;




extern int __setsockopt (int __fd, int __level, int __optname,
    const void *__optval,
    socklen_t __optlen) ;




extern int __getsockopt (int __fd, int __level, int __optname,
    void *__restrict __optval,
    socklen_t *__restrict __optlen) ;


extern int __getsockname (int __fd, __SOCKADDR_ARG __addr,
     socklen_t *__restrict __len) ;


extern int __bind (int __fd, __CONST_SOCKADDR_ARG __addr,
     socklen_t __len) ;




extern int __listen (int __fd, int __n) ;






extern int __libc_accept (int __fd, __SOCKADDR_ARG __addr,
     socklen_t *__restrict __addr_len)
     __attribute__ ((__nothrow__ )) ;

extern int __libc_accept4 (int __fd, __SOCKADDR_ARG __addr,
      socklen_t *__restrict __addr_len, int __flags)
     __attribute__ ((__nothrow__ )) ;





extern int __libc_sa_len (sa_family_t __af);





# 24 "../inet/netinet/in.h" 2
# 1 "../include/bits/types.h" 1
# 25 "../inet/netinet/in.h" 2





typedef uint32_t in_addr_t;
struct in_addr
  {
    in_addr_t s_addr;
  };


# 1 "../sysdeps/unix/sysv/linux/bits/in.h" 1
# 142 "../sysdeps/unix/sysv/linux/bits/in.h"
struct ip_opts
  {
    struct in_addr ip_dst;
    char ip_opts[40];
  };


struct ip_mreqn
  {
    struct in_addr imr_multiaddr;
    struct in_addr imr_address;
    int imr_ifindex;
  };


struct in_pktinfo
  {
    int ipi_ifindex;
    struct in_addr ipi_spec_dst;
    struct in_addr ipi_addr;
  };
# 38 "../inet/netinet/in.h" 2


enum
  {
    IPPROTO_IP = 0,

    IPPROTO_ICMP = 1,

    IPPROTO_IGMP = 2,

    IPPROTO_IPIP = 4,

    IPPROTO_TCP = 6,

    IPPROTO_EGP = 8,

    IPPROTO_PUP = 12,

    IPPROTO_UDP = 17,

    IPPROTO_IDP = 22,

    IPPROTO_TP = 29,

    IPPROTO_DCCP = 33,

    IPPROTO_IPV6 = 41,

    IPPROTO_RSVP = 46,

    IPPROTO_GRE = 47,

    IPPROTO_ESP = 50,

    IPPROTO_AH = 51,

    IPPROTO_MTP = 92,

    IPPROTO_BEETPH = 94,

    IPPROTO_ENCAP = 98,

    IPPROTO_PIM = 103,

    IPPROTO_COMP = 108,

    IPPROTO_SCTP = 132,

    IPPROTO_UDPLITE = 136,

    IPPROTO_MPLS = 137,

    IPPROTO_RAW = 255,

    IPPROTO_MAX
  };





enum
  {
    IPPROTO_HOPOPTS = 0,

    IPPROTO_ROUTING = 43,

    IPPROTO_FRAGMENT = 44,

    IPPROTO_ICMPV6 = 58,

    IPPROTO_NONE = 59,

    IPPROTO_DSTOPTS = 60,

    IPPROTO_MH = 135

  };



typedef uint16_t in_port_t;


enum
  {
    IPPORT_ECHO = 7,
    IPPORT_DISCARD = 9,
    IPPORT_SYSTAT = 11,
    IPPORT_DAYTIME = 13,
    IPPORT_NETSTAT = 15,
    IPPORT_FTP = 21,
    IPPORT_TELNET = 23,
    IPPORT_SMTP = 25,
    IPPORT_TIMESERVER = 37,
    IPPORT_NAMESERVER = 42,
    IPPORT_WHOIS = 43,
    IPPORT_MTP = 57,

    IPPORT_TFTP = 69,
    IPPORT_RJE = 77,
    IPPORT_FINGER = 79,
    IPPORT_TTYLINK = 87,
    IPPORT_SUPDUP = 95,


    IPPORT_EXECSERVER = 512,
    IPPORT_LOGINSERVER = 513,
    IPPORT_CMDSERVER = 514,
    IPPORT_EFSSERVER = 520,


    IPPORT_BIFFUDP = 512,
    IPPORT_WHOSERVER = 513,
    IPPORT_ROUTESERVER = 520,


    IPPORT_RESERVED = 1024,


    IPPORT_USERRESERVED = 5000
  };
# 211 "../inet/netinet/in.h"
struct in6_addr
  {
    union
      {
 uint8_t __u6_addr8[16];
 uint16_t __u6_addr16[8];
 uint32_t __u6_addr32[4];
      } __in6_u;





  };


extern const struct in6_addr in6addr_any;
extern const struct in6_addr in6addr_loopback;
# 237 "../inet/netinet/in.h"
struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;
    struct in_addr sin_addr;


    unsigned char sin_zero[sizeof (struct sockaddr) -
      (sizeof (unsigned short int)) -
      sizeof (in_port_t) -
      sizeof (struct in_addr)];
  };



struct sockaddr_in6
  {
    sa_family_t sin6_family;
    in_port_t sin6_port;
    uint32_t sin6_flowinfo;
    struct in6_addr sin6_addr;
    uint32_t sin6_scope_id;
  };




struct ip_mreq
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;
  };

struct ip_mreq_source
  {

    struct in_addr imr_multiaddr;


    struct in_addr imr_interface;


    struct in_addr imr_sourceaddr;
  };




struct ipv6_mreq
  {

    struct in6_addr ipv6mr_multiaddr;


    unsigned int ipv6mr_interface;
  };




struct group_req
  {

    uint32_t gr_interface;


    struct sockaddr_storage gr_group;
  };

struct group_source_req
  {

    uint32_t gsr_interface;


    struct sockaddr_storage gsr_group;


    struct sockaddr_storage gsr_source;
  };



struct ip_msfilter
  {

    struct in_addr imsf_multiaddr;


    struct in_addr imsf_interface;


    uint32_t imsf_fmode;


    uint32_t imsf_numsrc;

    struct in_addr imsf_slist[1];
  };





struct group_filter
  {

    uint32_t gf_interface;


    struct sockaddr_storage gf_group;


    uint32_t gf_fmode;


    uint32_t gf_numsrc;

    struct sockaddr_storage gf_slist[1];
};
# 374 "../inet/netinet/in.h"
extern uint32_t ntohl (uint32_t __netlong) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
extern uint16_t ntohs (uint16_t __netshort)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
extern uint32_t htonl (uint32_t __hostlong)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
extern uint16_t htons (uint16_t __hostshort)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));

# 1 "../include/endian.h" 1
# 383 "../inet/netinet/in.h" 2


# 1 "../bits/byteswap.h" 1
# 386 "../inet/netinet/in.h" 2
# 1 "../bits/uintn-identity.h" 1
# 387 "../inet/netinet/in.h" 2
# 502 "../inet/netinet/in.h"
extern int bindresvport (int __sockfd, struct sockaddr_in *__sock_in) __attribute__ ((__nothrow__ ));


extern int bindresvport6 (int __sockfd, struct sockaddr_in6 *__sock_in)
     __attribute__ ((__nothrow__ ));
# 532 "../inet/netinet/in.h"
struct cmsghdr;



struct in6_pktinfo
  {
    struct in6_addr ipi6_addr;
    unsigned int ipi6_ifindex;
  };


struct ip6_mtuinfo
  {
    struct sockaddr_in6 ip6m_addr;
    uint32_t ip6m_mtu;
  };



extern int inet6_option_space (int __nbytes)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
extern int inet6_option_init (void *__bp, struct cmsghdr **__cmsgp,
         int __type) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
extern int inet6_option_append (struct cmsghdr *__cmsg,
    const uint8_t *__typep, int __multx,
    int __plusy) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
extern uint8_t *inet6_option_alloc (struct cmsghdr *__cmsg, int __datalen,
        int __multx, int __plusy)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
extern int inet6_option_next (const struct cmsghdr *__cmsg,
         uint8_t **__tptrp)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
extern int inet6_option_find (const struct cmsghdr *__cmsg,
         uint8_t **__tptrp, int __type)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));



extern int inet6_opt_init (void *__extbuf, socklen_t __extlen) __attribute__ ((__nothrow__ ));
extern int inet6_opt_append (void *__extbuf, socklen_t __extlen, int __offset,
        uint8_t __type, socklen_t __len, uint8_t __align,
        void **__databufp) __attribute__ ((__nothrow__ ));
extern int inet6_opt_finish (void *__extbuf, socklen_t __extlen, int __offset)
     __attribute__ ((__nothrow__ ));
extern int inet6_opt_set_val (void *__databuf, int __offset, void *__val,
         socklen_t __vallen) __attribute__ ((__nothrow__ ));
extern int inet6_opt_next (void *__extbuf, socklen_t __extlen, int __offset,
      uint8_t *__typep, socklen_t *__lenp,
      void **__databufp) __attribute__ ((__nothrow__ ));
extern int inet6_opt_find (void *__extbuf, socklen_t __extlen, int __offset,
      uint8_t __type, socklen_t *__lenp,
      void **__databufp) __attribute__ ((__nothrow__ ));
extern int inet6_opt_get_val (void *__databuf, int __offset, void *__val,
         socklen_t __vallen) __attribute__ ((__nothrow__ ));



extern socklen_t inet6_rth_space (int __type, int __segments) __attribute__ ((__nothrow__ ));
extern void *inet6_rth_init (void *__bp, socklen_t __bp_len, int __type,
        int __segments) __attribute__ ((__nothrow__ ));
extern int inet6_rth_add (void *__bp, const struct in6_addr *__addr) __attribute__ ((__nothrow__ ));
extern int inet6_rth_reverse (const void *__in, void *__out) __attribute__ ((__nothrow__ ));
extern int inet6_rth_segments (const void *__bp) __attribute__ ((__nothrow__ ));
extern struct in6_addr *inet6_rth_getaddr (const void *__bp, int __index)
     __attribute__ ((__nothrow__ ));





extern int getipv4sourcefilter (int __s, struct in_addr __interface_addr,
    struct in_addr __group, uint32_t *__fmode,
    uint32_t *__numsrc, struct in_addr *__slist)
     __attribute__ ((__nothrow__ ));


extern int setipv4sourcefilter (int __s, struct in_addr __interface_addr,
    struct in_addr __group, uint32_t __fmode,
    uint32_t __numsrc,
    const struct in_addr *__slist)
     __attribute__ ((__nothrow__ ));



extern int getsourcefilter (int __s, uint32_t __interface_addr,
       const struct sockaddr *__group,
       socklen_t __grouplen, uint32_t *__fmode,
       uint32_t *__numsrc,
       struct sockaddr_storage *__slist) __attribute__ ((__nothrow__ ));


extern int setsourcefilter (int __s, uint32_t __interface_addr,
       const struct sockaddr *__group,
       socklen_t __grouplen, uint32_t __fmode,
       uint32_t __numsrc,
       const struct sockaddr_storage *__slist) __attribute__ ((__nothrow__ ));



# 4 "../include/netinet/in.h" 2




extern __typeof (in6addr_loopback) __in6addr_loopback;


extern __typeof (in6addr_any) __in6addr_any;

# 6 "../resolv/bits/types/res_state.h" 2







struct __res_state {
 int retrans;
 int retry;
 unsigned long options;
 int nscount;
 struct sockaddr_in
  nsaddr_list[3];
 unsigned short id;

 char *dnsrch[6 +1];
 char defdname[256];
 unsigned long pfcode;
 unsigned ndots:4;
 unsigned nsort:4;
 unsigned ipv6_unavail:1;
 unsigned unused:23;
 struct {
  struct in_addr addr;
  uint32_t mask;
 } sort_list[10];

 void * __glibc_unused_qhook;
 void * __glibc_unused_rhook;
 int res_h_errno;
 int _vcsock;
 unsigned int _flags;

 union {
  char pad[52];
  struct {
   uint16_t nscount;
   uint16_t nsmap[3];
   int nssocks[3];
   uint16_t nscount6;
   uint16_t nsinit;
   struct sockaddr_in6 *nsaddrs[3];

   unsigned long long int __glibc_extension_index
     __attribute__((packed));



  } _ext;
 } _u;
};

typedef struct __res_state *res_state;
# 1 "../include/bits/types/res_state.h" 2
# 36 "../nptl/descr.h" 2
# 1 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h"
# 1 "../sysdeps/unix/sysv/linux/kernel-features.h" 1
# 26 "../sysdeps/unix/sysv/linux/x86_64/kernel-features.h" 2
# 37 "../nptl/descr.h" 2
# 62 "../nptl/descr.h"
struct pthread_unwind_buf
{
  struct
  {
    __jmp_buf jmp_buf;
    int mask_was_saved;
  } cancel_jmp_buf[1];

  union
  {

    void *pad[4];

    struct
    {

      struct pthread_unwind_buf *prev;




      struct _pthread_cleanup_buffer *cleanup;


      int canceltype;
    } data;
  } priv;
};




struct xid_command
{
  int syscall_no;
  long int id[3];
  volatile int cntr;
  volatile int error;
};



struct robust_list_head
{
  void *list;
  long int futex_offset;
  void *list_op_pending;
};



struct priority_protection_data
{
  int priomax;
  unsigned int priomap[];
};



struct pthread
{
  union
  {


    tcbhead_t header;
# 155 "../nptl/descr.h"
    void *__padding[24];
  };


  list_t list;



  pid_t tid;


  pid_t pid_ununsed;



  void *robust_prev;
  struct robust_list_head robust_head;
# 264 "../nptl/descr.h"
  struct _pthread_cleanup_buffer *cleanup;


  struct pthread_unwind_buf *cleanup_jmp_buf;



  int cancelhandling;
# 305 "../nptl/descr.h"
  int flags;



  struct pthread_key_data
  {



    uintptr_t seq;


    void *data;
  } specific_1stblock[32];


  struct pthread_key_data *specific[((1024 + 32 - 1) / 32)];


  
# 324 "../nptl/descr.h" 3 4
 _Bool 
# 324 "../nptl/descr.h"
      specific_used;


  
# 327 "../nptl/descr.h" 3 4
 _Bool 
# 327 "../nptl/descr.h"
      report_events;


  
# 330 "../nptl/descr.h" 3 4
 _Bool 
# 330 "../nptl/descr.h"
      user_stack;


  
# 333 "../nptl/descr.h" 3 4
 _Bool 
# 333 "../nptl/descr.h"
      stopped_start;



  int parent_cancelhandling;


  int lock;


  unsigned int setxid_futex;



  hp_timing_t cpuclock_offset;
# 356 "../nptl/descr.h"
  struct pthread *joinid;




  void *result;


  struct sched_param schedparam;
  int schedpolicy;



  void *(*start_routine) (void *);
  void *arg;


  td_eventbuf_t eventbuf;

  struct pthread *nextevent;


  struct _Unwind_Exception exc;


  void *stackblock;

  size_t stackblock_size;

  size_t guardsize;

  size_t reported_guardsize;


  struct priority_protection_data *tpp;


  struct __res_state res;


  
# 396 "../nptl/descr.h" 3 4
 _Bool 
# 396 "../nptl/descr.h"
      c11;


  char end_padding[];



} __attribute ((aligned (64)));
# 131 "../sysdeps/x86_64/nptl/tls.h" 2
# 52 "../include/link.h" 2
# 1 "../sysdeps/nptl/libc-lock.h" 1
# 22 "../sysdeps/nptl/libc-lock.h"
# 1 "../include/pthread.h" 1






extern int __pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ )) ;
extern int __pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) ;


extern void __pthread_initialize (void) __attribute__ ((weak));
# 23 "../sysdeps/nptl/libc-lock.h" 2

# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 25 "../sysdeps/nptl/libc-lock.h" 2





typedef struct { pthread_mutex_t mutex; } __libc_lock_recursive_t;
# 150 "../sysdeps/nptl/libc-lock.h"
extern void _pthread_cleanup_push_defer (struct _pthread_cleanup_buffer *buffer,
      void (*routine) (void *), void *arg);
extern void _pthread_cleanup_pop_restore (struct _pthread_cleanup_buffer *buffer,
       int execute);
# 184 "../sysdeps/nptl/libc-lock.h"
# 1 "../sysdeps/nptl/libc-lockP.h" 1
# 22 "../sysdeps/nptl/libc-lockP.h"
# 1 "../include/pthread.h" 1






extern int __pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ )) ;
extern int __pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) ;


extern void __pthread_initialize (void) __attribute__ ((weak));
# 23 "../sysdeps/nptl/libc-lockP.h" 2

# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 25 "../sysdeps/nptl/libc-lockP.h" 2
# 35 "../sysdeps/nptl/libc-lockP.h"
# 1 "../sysdeps/nptl/pthread-functions.h" 1
# 22 "../sysdeps/nptl/pthread-functions.h"
# 1 "../include/pthread.h" 1






extern int __pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ )) ;
extern int __pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) ;


extern void __pthread_initialize (void) __attribute__ ((weak));
# 23 "../sysdeps/nptl/pthread-functions.h" 2

# 1 "../sysdeps/nptl/internaltypes.h" 1
# 23 "../sysdeps/nptl/internaltypes.h"
# 1 "../include/atomic.h" 1
# 50 "../include/atomic.h"
# 1 "../sysdeps/x86_64/atomic-machine.h" 1
# 26 "../sysdeps/x86_64/atomic-machine.h"
typedef int8_t atomic8_t;
typedef uint8_t uatomic8_t;
typedef int_fast8_t atomic_fast8_t;
typedef uint_fast8_t uatomic_fast8_t;

typedef int16_t atomic16_t;
typedef uint16_t uatomic16_t;
typedef int_fast16_t atomic_fast16_t;
typedef uint_fast16_t uatomic_fast16_t;

typedef int32_t atomic32_t;
typedef uint32_t uatomic32_t;
typedef int_fast32_t atomic_fast32_t;
typedef uint_fast32_t uatomic_fast32_t;

typedef int64_t atomic64_t;
typedef uint64_t uatomic64_t;
typedef int_fast64_t atomic_fast64_t;
typedef uint_fast64_t uatomic_fast64_t;

typedef intptr_t atomicptr_t;
typedef uintptr_t uatomicptr_t;
typedef intmax_t atomic_max_t;
typedef uintmax_t uatomic_max_t;
# 51 "../include/atomic.h" 2
# 543 "../include/atomic.h"
void __atomic_link_error (void);
# 24 "../sysdeps/nptl/internaltypes.h" 2
# 1 "../include/endian.h" 1
# 25 "../sysdeps/nptl/internaltypes.h" 2


struct pthread_attr
{

  struct sched_param schedparam;
  int schedpolicy;

  int flags;

  size_t guardsize;

  void *stackaddr;
  size_t stacksize;

  cpu_set_t *cpuset;
  size_t cpusetsize;
};
# 54 "../sysdeps/nptl/internaltypes.h"
struct pthread_mutexattr
{






  int mutexkind;
};



struct pthread_condattr
{






  int value;
};




struct pthread_rwlockattr
{
  int lockkind;
  int pshared;
};




struct pthread_barrier
{
  unsigned int in;
  unsigned int current_round;
  unsigned int count;
  int shared;
  unsigned int out;
};





struct pthread_barrierattr
{
  int pshared;
};



struct pthread_key_struct
{




  uintptr_t seq;


  void (*destr) (void *);
};
# 140 "../sysdeps/nptl/internaltypes.h"
struct new_sem
{
# 154 "../sysdeps/nptl/internaltypes.h"
  uint64_t data;
  int private;
  int pad;
# 165 "../sysdeps/nptl/internaltypes.h"
};

struct old_sem
{
  unsigned int value;
};



typedef struct
{
  pthread_cond_t *cond;
} pthread_cond_2_0_t;
# 25 "../sysdeps/nptl/pthread-functions.h" 2


struct xid_command;



struct pthread_functions
{
  int (*ptr_pthread_attr_destroy) (pthread_attr_t *);
  int (*ptr___pthread_attr_init_2_0) (pthread_attr_t *);
  int (*ptr___pthread_attr_init_2_1) (pthread_attr_t *);
  int (*ptr_pthread_attr_getdetachstate) (const pthread_attr_t *, int *);
  int (*ptr_pthread_attr_setdetachstate) (pthread_attr_t *, int);
  int (*ptr_pthread_attr_getinheritsched) (const pthread_attr_t *, int *);
  int (*ptr_pthread_attr_setinheritsched) (pthread_attr_t *, int);
  int (*ptr_pthread_attr_getschedparam) (const pthread_attr_t *,
      struct sched_param *);
  int (*ptr_pthread_attr_setschedparam) (pthread_attr_t *,
      const struct sched_param *);
  int (*ptr_pthread_attr_getschedpolicy) (const pthread_attr_t *, int *);
  int (*ptr_pthread_attr_setschedpolicy) (pthread_attr_t *, int);
  int (*ptr_pthread_attr_getscope) (const pthread_attr_t *, int *);
  int (*ptr_pthread_attr_setscope) (pthread_attr_t *, int);
  int (*ptr_pthread_condattr_destroy) (pthread_condattr_t *);
  int (*ptr_pthread_condattr_init) (pthread_condattr_t *);
  int (*ptr___pthread_cond_broadcast) (pthread_cond_t *);
  int (*ptr___pthread_cond_destroy) (pthread_cond_t *);
  int (*ptr___pthread_cond_init) (pthread_cond_t *,
      const pthread_condattr_t *);
  int (*ptr___pthread_cond_signal) (pthread_cond_t *);
  int (*ptr___pthread_cond_wait) (pthread_cond_t *, pthread_mutex_t *);
  int (*ptr___pthread_cond_timedwait) (pthread_cond_t *, pthread_mutex_t *,
           const struct timespec *);
  int (*ptr___pthread_cond_broadcast_2_0) (pthread_cond_2_0_t *);
  int (*ptr___pthread_cond_destroy_2_0) (pthread_cond_2_0_t *);
  int (*ptr___pthread_cond_init_2_0) (pthread_cond_2_0_t *,
          const pthread_condattr_t *);
  int (*ptr___pthread_cond_signal_2_0) (pthread_cond_2_0_t *);
  int (*ptr___pthread_cond_wait_2_0) (pthread_cond_2_0_t *, pthread_mutex_t *);
  int (*ptr___pthread_cond_timedwait_2_0) (pthread_cond_2_0_t *,
        pthread_mutex_t *,
        const struct timespec *);
  int (*ptr_pthread_equal) (pthread_t, pthread_t);
  void (*ptr___pthread_exit) (void *) __attribute__ ((__noreturn__));
  int (*ptr_pthread_getschedparam) (pthread_t, int *, struct sched_param *);
  int (*ptr_pthread_setschedparam) (pthread_t, int,
        const struct sched_param *);
  int (*ptr_pthread_mutex_destroy) (pthread_mutex_t *);
  int (*ptr_pthread_mutex_init) (pthread_mutex_t *,
     const pthread_mutexattr_t *);
  int (*ptr_pthread_mutex_lock) (pthread_mutex_t *);
  int (*ptr_pthread_mutex_unlock) (pthread_mutex_t *);
  int (*ptr___pthread_setcancelstate) (int, int *);
  int (*ptr_pthread_setcanceltype) (int, int *);
  void (*ptr___pthread_cleanup_upto) (__jmp_buf, char *);
  int (*ptr___pthread_once) (pthread_once_t *, void (*) (void));
  int (*ptr___pthread_rwlock_rdlock) (pthread_rwlock_t *);
  int (*ptr___pthread_rwlock_wrlock) (pthread_rwlock_t *);
  int (*ptr___pthread_rwlock_unlock) (pthread_rwlock_t *);
  int (*ptr___pthread_key_create) (pthread_key_t *, void (*) (void *));
  void *(*ptr___pthread_getspecific) (pthread_key_t);
  int (*ptr___pthread_setspecific) (pthread_key_t, const void *);
  void (*ptr__pthread_cleanup_push_defer) (struct _pthread_cleanup_buffer *,
        void (*) (void *), void *);
  void (*ptr__pthread_cleanup_pop_restore) (struct _pthread_cleanup_buffer *,
         int);

  unsigned int *ptr_nthreads;
  void (*ptr___pthread_unwind) (__pthread_unwind_buf_t *)
       __attribute ((noreturn)) ;
  void (*ptr__nptl_deallocate_tsd) (void);
  int (*ptr__nptl_setxid) (struct xid_command *);
  void (*ptr_set_robust) (struct pthread *);
};


extern struct pthread_functions __libc_pthread_functions ;
extern int __libc_pthread_functions_init ;
# 36 "../sysdeps/nptl/libc-lockP.h" 2
# 45 "../sysdeps/nptl/libc-lockP.h"
typedef pthread_mutex_t __libc_lock_t;



typedef struct { pthread_mutex_t mutex; } __rtld_lock_recursive_t;
typedef pthread_rwlock_t __libc_rwlock_t;


typedef pthread_key_t __libc_key_t;
# 269 "../sysdeps/nptl/libc-lockP.h"
extern void _pthread_cleanup_push (struct _pthread_cleanup_buffer *buffer,
       void (*routine) (void *), void *arg);
extern void _pthread_cleanup_pop (struct _pthread_cleanup_buffer *buffer,
      int execute);
extern void _pthread_cleanup_push_defer (struct _pthread_cleanup_buffer *buffer,
      void (*routine) (void *), void *arg);
extern void _pthread_cleanup_pop_restore (struct _pthread_cleanup_buffer *buffer,
       int execute);
# 287 "../sysdeps/nptl/libc-lockP.h"
extern __inline void
__libc_cleanup_routine (struct __pthread_cleanup_frame *f)
{
  if (f->__do_it)
    f->__cancel_routine (f->__cancel_arg);
}
# 322 "../sysdeps/nptl/libc-lockP.h"
extern int __register_atfork (void (*__prepare) (void),
         void (*__parent) (void),
         void (*__child) (void),
         void *__dso_handle);




extern int __pthread_mutex_init (pthread_mutex_t *__mutex,
     const pthread_mutexattr_t *__mutex_attr);

extern int __pthread_mutex_destroy (pthread_mutex_t *__mutex);

extern int __pthread_mutex_trylock (pthread_mutex_t *__mutex);

extern int __pthread_mutex_lock (pthread_mutex_t *__mutex);

extern int __pthread_mutex_unlock (pthread_mutex_t *__mutex);

extern int __pthread_mutexattr_init (pthread_mutexattr_t *__attr);

extern int __pthread_mutexattr_destroy (pthread_mutexattr_t *__attr);

extern int __pthread_mutexattr_settype (pthread_mutexattr_t *__attr,
     int __kind);

extern int __pthread_rwlock_init (pthread_rwlock_t *__rwlock,
      const pthread_rwlockattr_t *__attr);

extern int __pthread_rwlock_destroy (pthread_rwlock_t *__rwlock);

extern int __pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock);

extern int __pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock);

extern int __pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock);

extern int __pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock);

extern int __pthread_rwlock_unlock (pthread_rwlock_t *__rwlock);

extern int __pthread_key_create (pthread_key_t *__key,
     void (*__destr_function) (void *));

extern int __pthread_setspecific (pthread_key_t __key,
      const void *__pointer);

extern void *__pthread_getspecific (pthread_key_t __key);

extern int __pthread_once (pthread_once_t *__once_control,
      void (*__init_routine) (void));

extern int __pthread_atfork (void (*__prepare) (void),
        void (*__parent) (void),
        void (*__child) (void));

extern int __pthread_setcancelstate (int state, int *oldstate);







# 385 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutex_init
# 385 "../sysdeps/nptl/libc-lockP.h"


# 386 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutex_destroy
# 386 "../sysdeps/nptl/libc-lockP.h"


# 387 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutex_lock
# 387 "../sysdeps/nptl/libc-lockP.h"


# 388 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutex_trylock
# 388 "../sysdeps/nptl/libc-lockP.h"


# 389 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutex_unlock
# 389 "../sysdeps/nptl/libc-lockP.h"


# 390 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutexattr_init
# 390 "../sysdeps/nptl/libc-lockP.h"


# 391 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutexattr_destroy
# 391 "../sysdeps/nptl/libc-lockP.h"


# 392 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_mutexattr_settype
# 392 "../sysdeps/nptl/libc-lockP.h"


# 393 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_init
# 393 "../sysdeps/nptl/libc-lockP.h"


# 394 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_destroy
# 394 "../sysdeps/nptl/libc-lockP.h"


# 395 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_rdlock
# 395 "../sysdeps/nptl/libc-lockP.h"


# 396 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_tryrdlock
# 396 "../sysdeps/nptl/libc-lockP.h"


# 397 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_wrlock
# 397 "../sysdeps/nptl/libc-lockP.h"


# 398 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_trywrlock
# 398 "../sysdeps/nptl/libc-lockP.h"


# 399 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_rwlock_unlock
# 399 "../sysdeps/nptl/libc-lockP.h"


# 400 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_key_create
# 400 "../sysdeps/nptl/libc-lockP.h"


# 401 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_setspecific
# 401 "../sysdeps/nptl/libc-lockP.h"


# 402 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_getspecific
# 402 "../sysdeps/nptl/libc-lockP.h"


# 403 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_once
# 403 "../sysdeps/nptl/libc-lockP.h"


# 404 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_initialize
# 404 "../sysdeps/nptl/libc-lockP.h"


# 405 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_atfork
# 405 "../sysdeps/nptl/libc-lockP.h"


# 406 "../sysdeps/nptl/libc-lockP.h"
#pragma weak __pthread_setcancelstate
# 406 "../sysdeps/nptl/libc-lockP.h"


# 407 "../sysdeps/nptl/libc-lockP.h"
#pragma weak _pthread_cleanup_push_defer
# 407 "../sysdeps/nptl/libc-lockP.h"


# 408 "../sysdeps/nptl/libc-lockP.h"
#pragma weak _pthread_cleanup_pop_restore
# 408 "../sysdeps/nptl/libc-lockP.h"

# 185 "../sysdeps/nptl/libc-lock.h" 2
# 53 "../include/link.h" 2




struct libname_list;
struct r_found_version;
struct r_search_path_elem;


struct link_map;



struct r_scope_elem
{

  struct link_map **r_list;

  unsigned int r_nlist;
};



struct r_search_path_struct
  {
    struct r_search_path_elem **dirs;
    int malloced;
  };
# 92 "../include/link.h"
struct link_map
  {



    Elf64_Addr l_addr;

    char *l_name;
    Elf64_Dyn *l_ld;
    struct link_map *l_next, *l_prev;







    struct link_map *l_real;


    Lmid_t l_ns;

    struct libname_list *l_libname;
# 130 "../include/link.h"
    Elf64_Dyn *l_info[35 + 0 + 16
        + 3 + 12 + 11];
    const Elf64_Phdr *l_phdr;
    Elf64_Addr l_entry;
    Elf64_Half l_phnum;
    Elf64_Half l_ldnum;





    struct r_scope_elem l_searchlist;



    struct r_scope_elem l_symbolic_searchlist;


    struct link_map *l_loader;


    struct r_found_version *l_versions;
    unsigned int l_nversions;


    Elf_Symndx l_nbuckets;
    Elf32_Word l_gnu_bitmask_idxbits;
    Elf32_Word l_gnu_shift;
    const Elf64_Addr *l_gnu_bitmask;
    union
    {
      const Elf32_Word *l_gnu_buckets;
      const Elf_Symndx *l_chain;
    };
    union
    {
      const Elf32_Word *l_gnu_chain_zero;
      const Elf_Symndx *l_buckets;
    };

    unsigned int l_direct_opencount;
    enum
      {
 lt_executable,
 lt_library,
 lt_loaded
      } l_type:2;
    unsigned int l_relocated:1;
    unsigned int l_init_called:1;
    unsigned int l_global:1;
    unsigned int l_reserved:2;
    unsigned int l_phdr_allocated:1;

    unsigned int l_soname_added:1;

    unsigned int l_faked:1;

    unsigned int l_need_tls_init:1;


    unsigned int l_auditing:1;
    unsigned int l_audit_any_plt:1;

    unsigned int l_removed:1;

    unsigned int l_contiguous:1;


    unsigned int l_symbolic_in_local_scope:1;



    unsigned int l_free_initfini:1;



# 1 "../sysdeps/x86/link_map.h" 1
# 20 "../sysdeps/x86/link_map.h"
enum
  {
    lc_unknown = 0,
    lc_none = 1 << 0,
    lc_ibt = 1 << 1,
    lc_shstk = 1 << 2,
    lc_ibt_and_shstk = lc_ibt | lc_shstk
  } l_cet:3;
# 207 "../include/link.h" 2


    struct r_search_path_struct l_rpath_dirs;


    struct reloc_result
    {
      Elf64_Addr addr;
      struct link_map *bound;
      unsigned int boundndx;
      uint32_t enterexit;
      unsigned int flags;



      unsigned int init;
    } *l_reloc_result;


    Elf64_Versym *l_versyms;


    const char *l_origin;



    Elf64_Addr l_map_start, l_map_end;

    Elf64_Addr l_text_end;


    struct r_scope_elem *l_scope_mem[4];

    size_t l_scope_max;


    struct r_scope_elem **l_scope;



    struct r_scope_elem *l_local_scope[2];



    struct r_file_id l_file_id;


    struct r_search_path_struct l_runpath_dirs;


    struct link_map **l_initfini;


    struct link_map_reldeps
      {
 unsigned int act;
 struct link_map *list[];
      } *l_reldeps;
    unsigned int l_reldepsmax;


    unsigned int l_used;


    Elf64_Word l_feature_1;
    Elf64_Word l_flags_1;
    Elf64_Word l_flags;


    int l_idx;

    struct link_map_machine l_mach;

    struct
    {
      const Elf64_Sym *sym;
      int type_class;
      struct link_map *value;
      const Elf64_Sym *ret;
    } l_lookup_cache;




    void *l_tls_initimage;

    size_t l_tls_initimage_size;

    size_t l_tls_blocksize;

    size_t l_tls_align;

    size_t l_tls_firstbyte_offset;
# 313 "../include/link.h"
    ptrdiff_t l_tls_offset;

    size_t l_tls_modid;




    size_t l_tls_dtor_count;



    Elf64_Addr l_relro_addr;
    size_t l_relro_size;

    unsigned long long int l_serial;



    struct auditstate
    {
      uintptr_t cookie;
      unsigned int bindflags;
    } l_audit[0];
  };
# 347 "../include/link.h"
extern int __dl_iterate_phdr (int (*callback) (struct dl_phdr_info *info,
            size_t size, void *data),
         void *data);

# 29 "readlib.c" 2
# 1 "../include/stdio.h" 1




# 1 "../libio/stdio.h" 1
# 27 "../libio/stdio.h"
# 1 "../bits/libc-header-start.h" 1
# 28 "../libio/stdio.h" 2





# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 34 "../libio/stdio.h" 2


# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stdarg.h" 1 3 4
# 40 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stdarg.h" 3 4

# 40 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 37 "../libio/stdio.h" 2

# 1 "../include/bits/types.h" 1
# 39 "../libio/stdio.h" 2
# 1 "../include/bits/types/__fpos_t.h" 1
# 1 "../libio/bits/types/__fpos_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../libio/bits/types/__fpos_t.h" 2
# 1 "../include/bits/types/__mbstate_t.h" 1
# 1 "../wcsmbs/bits/types/__mbstate_t.h" 1
# 13 "../wcsmbs/bits/types/__mbstate_t.h"

# 13 "../wcsmbs/bits/types/__mbstate_t.h"
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 1 "../include/bits/types/__mbstate_t.h" 2
# 6 "../libio/bits/types/__fpos_t.h" 2




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 1 "../include/bits/types/__fpos_t.h" 2
# 40 "../libio/stdio.h" 2
# 1 "../include/bits/types/__fpos64_t.h" 1
# 1 "../libio/bits/types/__fpos64_t.h" 1



# 1 "../include/bits/types.h" 1
# 5 "../libio/bits/types/__fpos64_t.h" 2
# 1 "../include/bits/types/__mbstate_t.h" 1
# 6 "../libio/bits/types/__fpos64_t.h" 2




typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 1 "../include/bits/types/__fpos64_t.h" 2
# 41 "../libio/stdio.h" 2
# 1 "../include/bits/types/__FILE.h" 1
# 1 "../libio/bits/types/__FILE.h" 1



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 1 "../include/bits/types/__FILE.h" 2
# 42 "../libio/stdio.h" 2
# 1 "../include/bits/types/FILE.h" 1
# 1 "../libio/bits/types/FILE.h" 1



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 1 "../include/bits/types/FILE.h" 2
# 43 "../libio/stdio.h" 2
# 1 "../include/bits/types/struct_FILE.h" 1
# 1 "../libio/bits/types/struct_FILE.h" 1
# 33 "../libio/bits/types/struct_FILE.h"
# 1 "../include/bits/types.h" 1
# 34 "../libio/bits/types/struct_FILE.h" 2

struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
# 1 "../include/bits/types/struct_FILE.h" 2
# 44 "../libio/stdio.h" 2


# 1 "../include/bits/types/cookie_io_functions_t.h" 1
# 1 "../libio/bits/types/cookie_io_functions_t.h" 1
# 21 "../libio/bits/types/cookie_io_functions_t.h"
# 1 "../include/bits/types.h" 1
# 22 "../libio/bits/types/cookie_io_functions_t.h" 2





typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);







typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);







typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);


typedef int cookie_close_function_t (void *__cookie);






typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
# 1 "../include/bits/types/cookie_io_functions_t.h" 2
# 47 "../libio/stdio.h" 2





typedef __gnuc_va_list va_list;
# 84 "../libio/stdio.h"
typedef __fpos_t fpos_t;




typedef __fpos64_t fpos64_t;
# 133 "../libio/stdio.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/bits/stdio_lim.h" 1
# 134 "../libio/stdio.h" 2



extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ ));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ ));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ ));
# 164 "../libio/stdio.h"
extern int renameat2 (int __oldfd, const char *__old, int __newfd,
        const char *__new, unsigned int __flags) __attribute__ ((__nothrow__ ));







extern FILE *tmpfile (void) ;
# 183 "../libio/stdio.h"
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ )) ;




extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ )) ;
# 204 "../libio/stdio.h"
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;







extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);
# 227 "../libio/stdio.h"
extern int fflush_unlocked (FILE *__stream);
# 237 "../libio/stdio.h"
extern int fcloseall (void);
# 246 "../libio/stdio.h"
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 270 "../libio/stdio.h"
extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ )) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ )) ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ )) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ )) ;





extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ ));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ ));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ ));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ ));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));





extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ ));
# 434 "../libio/stdio.h"
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 491 "../libio/stdio.h"
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);






extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 516 "../libio/stdio.h"
extern int fgetc_unlocked (FILE *__stream);
# 527 "../libio/stdio.h"
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);
# 543 "../libio/stdio.h"
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 593 "../libio/stdio.h"
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 609 "../libio/stdio.h"
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) ;







extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
# 668 "../libio/stdio.h"
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 679 "../libio/stdio.h"
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);







extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);
# 713 "../libio/stdio.h"
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 737 "../libio/stdio.h"
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 756 "../libio/stdio.h"
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);



extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ ));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ )) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ )) ;



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ ));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) ;







extern void perror (const char *__s);





# 1 "../sysdeps/unix/sysv/linux/bits/sys_errlist.h" 1
# 26 "../sysdeps/unix/sysv/linux/bits/sys_errlist.h"
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 788 "../libio/stdio.h" 2




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ )) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) ;
# 806 "../libio/stdio.h"
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ ));





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ ));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ )) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ ));
# 864 "../libio/stdio.h"
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);




# 1 "../libio/bits/stdio.h" 1
# 38 "../libio/bits/stdio.h"
extern __inline int
vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}



extern __inline int
getchar (void)
{
  return getc (stdin);
}




extern __inline int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline int
putchar (int __c)
{
  return putc (__c, stdout);
}




extern __inline int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}





extern __inline __ssize_t
getline (char **__lineptr, size_t *__n, FILE *__stream)
{
  return __getdelim (__lineptr, __n, '\n', __stream);
}





extern __inline int
__attribute__ ((__nothrow__ )) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0010) != 0);
}


extern __inline int
__attribute__ ((__nothrow__ )) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0020) != 0);
}
# 871 "../libio/stdio.h" 2
# 879 "../libio/stdio.h"

# 6 "../include/stdio.h" 2


# 1 "../libio/libio.h" 1
# 38 "../libio/libio.h"
# 1 "../include/stdio.h" 1
# 39 "../libio/libio.h" 2






# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 46 "../libio/libio.h" 2

# 1 "../include/bits/types/__mbstate_t.h" 1
# 48 "../libio/libio.h" 2
# 1 "../include/bits/types/wint_t.h" 1
# 1 "../wcsmbs/bits/types/wint_t.h" 1
# 20 "../wcsmbs/bits/types/wint_t.h"
typedef unsigned int wint_t;
# 1 "../include/bits/types/wint_t.h" 2
# 49 "../libio/libio.h" 2
# 1 "../include/gconv.h" 1
# 1 "../iconv/gconv.h" 1
# 26 "../iconv/gconv.h"
# 1 "../include/bits/types/__mbstate_t.h" 1
# 27 "../iconv/gconv.h" 2
# 1 "../include/bits/types/wint_t.h" 1
# 28 "../iconv/gconv.h" 2



# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 32 "../iconv/gconv.h" 2





enum
{
  __GCONV_OK = 0,
  __GCONV_NOCONV,
  __GCONV_NODB,
  __GCONV_NOMEM,

  __GCONV_EMPTY_INPUT,
  __GCONV_FULL_OUTPUT,
  __GCONV_ILLEGAL_INPUT,
  __GCONV_INCOMPLETE_INPUT,

  __GCONV_ILLEGAL_DESCRIPTOR,
  __GCONV_INTERNAL_ERROR
};



enum
{
  __GCONV_IS_LAST = 0x0001,
  __GCONV_IGNORE_ERRORS = 0x0002,
  __GCONV_SWAP = 0x0004,
  __GCONV_TRANSLIT = 0x0008
};



struct __gconv_step;
struct __gconv_step_data;
struct __gconv_loaded_object;



typedef int (*__gconv_fct) (struct __gconv_step *, struct __gconv_step_data *,
       const unsigned char **, const unsigned char *,
       unsigned char **, size_t *, int, int);


typedef wint_t (*__gconv_btowc_fct) (struct __gconv_step *, unsigned char);


typedef int (*__gconv_init_fct) (struct __gconv_step *);
typedef void (*__gconv_end_fct) (struct __gconv_step *);



struct __gconv_step
{
  struct __gconv_loaded_object *__shlib_handle;
  const char *__modname;

  int __counter;

  char *__from_name;
  char *__to_name;

  __gconv_fct __fct;
  __gconv_btowc_fct __btowc_fct;
  __gconv_init_fct __init_fct;
  __gconv_end_fct __end_fct;



  int __min_needed_from;
  int __max_needed_from;
  int __min_needed_to;
  int __max_needed_to;


  int __stateful;

  void *__data;
};



struct __gconv_step_data
{
  unsigned char *__outbuf;
  unsigned char *__outbufend;



  int __flags;



  int __invocation_counter;



  int __internal_use;

  __mbstate_t *__statep;
  __mbstate_t __state;

};



typedef struct __gconv_info
{
  size_t __nsteps;
  struct __gconv_step *__steps;
  __extension__ struct __gconv_step_data __data[0];
} *__gconv_t;


extern int __gconv_transliterate (struct __gconv_step *step,
      struct __gconv_step_data *step_data,
      const unsigned char *inbufstart,
      const unsigned char **inbufp,
      const unsigned char *inbufend,
      unsigned char **outbufstart,
      size_t *irreversible);
# 1 "../include/gconv.h" 2
# 50 "../libio/libio.h" 2

typedef union
{
  struct __gconv_info __cd;
  struct
  {
    struct __gconv_info __cd;
    struct __gconv_step_data __data;
  } __combined;
} _IO_iconv_t;

# 1 "../include/shlib-compat.h" 1
# 22 "../include/shlib-compat.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/abi-versions.h" 1
# 23 "../include/shlib-compat.h" 2
# 62 "../libio/libio.h" 2
# 109 "../libio/libio.h"
struct _IO_jump_t;


struct _IO_marker {
  struct _IO_marker *_next;
  FILE *_sbuf;



  int _pos;
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};



struct _IO_codecvt
{
  void (*__codecvt_destr) (struct _IO_codecvt *);
  enum __codecvt_result (*__codecvt_do_out) (struct _IO_codecvt *,
          __mbstate_t *,
          const wchar_t *,
          const wchar_t *,
          const wchar_t **, char *,
          char *, char **);
  enum __codecvt_result (*__codecvt_do_unshift) (struct _IO_codecvt *,
       __mbstate_t *, char *,
       char *, char **);
  enum __codecvt_result (*__codecvt_do_in) (struct _IO_codecvt *,
         __mbstate_t *,
         const char *, const char *,
         const char **, wchar_t *,
         wchar_t *, wchar_t **);
  int (*__codecvt_do_encoding) (struct _IO_codecvt *);
  int (*__codecvt_do_always_noconv) (struct _IO_codecvt *);
  int (*__codecvt_do_length) (struct _IO_codecvt *, __mbstate_t *,
         const char *, const char *, size_t);
  int (*__codecvt_do_max_length) (struct _IO_codecvt *);

  _IO_iconv_t __cd_in;
  _IO_iconv_t __cd_out;
};


struct _IO_wide_data
{
  wchar_t *_IO_read_ptr;
  wchar_t *_IO_read_end;
  wchar_t *_IO_read_base;
  wchar_t *_IO_write_base;
  wchar_t *_IO_write_ptr;
  wchar_t *_IO_write_end;
  wchar_t *_IO_buf_base;
  wchar_t *_IO_buf_end;

  wchar_t *_IO_save_base;
  wchar_t *_IO_backup_base;

  wchar_t *_IO_save_end;

  __mbstate_t _IO_state;
  __mbstate_t _IO_last_state;
  struct _IO_codecvt _codecvt;

  wchar_t _shortbuf[1];

  const struct _IO_jump_t *_wide_vtable;
};

struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
extern FILE *_IO_stdin ;
extern FILE *_IO_stdout ;
extern FILE *_IO_stderr ;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, cookie_io_functions_t __fns);

extern int __underflow (FILE *);
extern wint_t __wunderflow (FILE *);
extern wint_t __wuflow (FILE *);
extern wint_t __woverflow (FILE *, wint_t);
# 228 "../libio/libio.h"
extern int _IO_getc (FILE *__fp);
extern int _IO_putc (int __c, FILE *__fp);
extern int _IO_feof (FILE *__fp) __attribute__ ((__nothrow__ ));
extern int _IO_ferror (FILE *__fp) __attribute__ ((__nothrow__ ));

extern int _IO_peekc_locked (FILE *__fp);





extern void _IO_flockfile (FILE *) __attribute__ ((__nothrow__ ));
extern void _IO_funlockfile (FILE *) __attribute__ ((__nothrow__ ));
extern int _IO_ftrylockfile (FILE *) __attribute__ ((__nothrow__ ));
# 257 "../libio/libio.h"
extern int _IO_vfscanf (FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (FILE *, int, __ssize_t);
extern size_t _IO_sgetn (FILE *, void *, size_t);

extern off64_t _IO_seekoff (FILE *, off64_t, int, int);
extern off64_t _IO_seekpos (FILE *, off64_t, int);

extern void _IO_free_backup_area (FILE *) __attribute__ ((__nothrow__ ));


extern wint_t _IO_getwc (FILE *__fp);
extern wint_t _IO_putwc (wchar_t __wc, FILE *__fp);
extern int _IO_fwide (FILE *__fp, int __mode) __attribute__ ((__nothrow__ ));
# 300 "../libio/libio.h"
extern int _IO_vfwscanf (FILE * __restrict, const wchar_t * __restrict,
    __gnuc_va_list, int *__restrict);
extern int _IO_vfwprintf (FILE *__restrict, const wchar_t *__restrict,
     __gnuc_va_list);
extern __ssize_t _IO_wpadn (FILE *, wint_t, __ssize_t);
extern void _IO_free_wbackup_area (FILE *) __attribute__ ((__nothrow__ ));



















# 9 "../include/stdio.h" 2



extern int __fcloseall (void) ;
extern int __snprintf (char *__restrict __s, size_t __maxlen,
         const char *__restrict __format, ...)
     __attribute__ ((__format__ (__printf__, 3, 4)));

extern int __vsnprintf (char *__restrict __s, size_t __maxlen,
   const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 3, 0)));
extern int __vfscanf (FILE *__restrict __s,
        const char *__restrict __format,
        __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0)));

extern int __vscanf (const char *__restrict __format,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0)));
extern __ssize_t __getline (char **__lineptr, size_t *__n,
                            FILE *__stream) ;
extern int __vsscanf (const char *__restrict __s,
        const char *__restrict __format,
        __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0)));

extern int __sprintf_chk (char *, int, size_t, const char *, ...) __attribute__ ((__nothrow__ ));
extern int __snprintf_chk (char *, size_t, int, size_t, const char *, ...)
     __attribute__ ((__nothrow__ ));
extern int __vsprintf_chk (char *, int, size_t, const char *,
      __gnuc_va_list) __attribute__ ((__nothrow__ ));
extern int __vsnprintf_chk (char *, size_t, int, size_t, const char *,
       __gnuc_va_list) __attribute__ ((__nothrow__ ));
extern int __printf_chk (int, const char *, ...);
extern int __fprintf_chk (FILE *, int, const char *, ...);
extern int __vprintf_chk (int, const char *, __gnuc_va_list);
extern int __vfprintf_chk (FILE *, int, const char *, __gnuc_va_list);
extern char *__fgets_unlocked_chk (char *buf, size_t size, int n, FILE *fp);
extern char *__fgets_chk (char *buf, size_t size, int n, FILE *fp);
extern int __asprintf_chk (char **, int, const char *, ...) __attribute__ ((__nothrow__ ));
extern int __vasprintf_chk (char **, int, const char *, __gnuc_va_list) __attribute__ ((__nothrow__ ));
extern int __dprintf_chk (int, int, const char *, ...);
extern int __vdprintf_chk (int, int, const char *, __gnuc_va_list);
extern int __obstack_printf_chk (struct obstack *, int, const char *, ...)
     __attribute__ ((__nothrow__ ));
extern int __obstack_vprintf_chk (struct obstack *, int, const char *,
      __gnuc_va_list) __attribute__ ((__nothrow__ ));

extern int __isoc99_fscanf (FILE *__restrict __stream,
       const char *__restrict __format, ...) ;
extern int __isoc99_scanf (const char *__restrict __format, ...) ;
extern int __isoc99_sscanf (const char *__restrict __s,
       const char *__restrict __format, ...) __attribute__ ((__nothrow__ ));
extern int __isoc99_vfscanf (FILE *__restrict __s,
        const char *__restrict __format,
        __gnuc_va_list __arg) ;
extern int __isoc99_vscanf (const char *__restrict __format,
       __gnuc_va_list __arg) ;
extern int __isoc99_vsscanf (const char *__restrict __s,
        const char *__restrict __format,
        __gnuc_va_list __arg) __attribute__ ((__nothrow__ ));




extern FILE *__new_tmpfile (void);
extern FILE *__old_tmpfile (void);


# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 79 "../include/stdio.h" 2

# 1 "../include/bits/types/wint_t.h" 1
# 81 "../include/stdio.h" 2


extern int __path_search (char *__tmpl, size_t __tmpl_len,
     const char *__dir, const char *__pfx,
     int __try_tempdir) ;

extern int __gen_tempname (char *__tmpl, int __suffixlen, int __flags,
      int __kind) ;





enum __libc_message_action
{
  do_message = 0,
  do_abort = 1 << 0,
  do_backtrace = 1 << 1
};



extern void __libc_fatal (const char *__message)
     __attribute__ ((__noreturn__));
extern void __libc_message (enum __libc_message_action action,
       const char *__fnt, ...) ;
extern void __fortify_fail (const char *msg) __attribute__ ((__noreturn__));
extern void __fortify_fail_abort (_Bool, const char *msg)
  __attribute__ ((__noreturn__)) ;




extern void __flockfile (FILE *__stream) ;


extern void __funlockfile (FILE *__stream) ;



extern int __ftrylockfile (FILE *__stream);

extern int __getc_unlocked (FILE *__fp) ;
extern wint_t __getwc_unlocked (FILE *__fp);

extern int __fxprintf (FILE *__fp, const char *__fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int __fxprintf_nocancel (FILE *__fp, const char *__fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3))) ;
# 141 "../include/stdio.h"
ssize_t __libc_readline_unlocked (FILE *fp, char *buffer, size_t length);
;

extern const char *const _sys_errlist_internal[] ;
extern int _sys_nerr_internal ;


# 168 "../include/stdio.h"

extern __typeof (dprintf) __dprintf
     __attribute__ ((__format__ (__printf__, 2, 3)));










extern __typeof (fileno) __fileno;



extern __typeof (ftello) __ftello;

extern __typeof (fseeko64) __fseeko64;

extern __typeof (ftello64) __ftello64;



extern __typeof (fflush_unlocked) __fflush_unlocked;

extern __typeof (fread_unlocked) __fread_unlocked;



extern __typeof (fgets_unlocked) __fgets_unlocked;


extern __typeof (fputs_unlocked) __fputs_unlocked;


extern __typeof (feof_unlocked) __feof_unlocked ;

extern __typeof (ferror_unlocked) __ferror_unlocked ;



extern __typeof (putc_unlocked) __putc_unlocked ;



extern FILE *__open_memstream (char **, size_t *) __attribute__ ((__nothrow__ )) ;










extern FILE * __fmemopen (void *buf, size_t len, const char *mode);


extern int __gen_tempfd (int flags);



extern __inline int
__attribute__ ((__nothrow__ )) __feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0010) != 0);
}

extern __inline int
__attribute__ ((__nothrow__ )) __ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0020) != 0);
}

extern __inline int
__getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}

extern __inline int
__putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __typeof (renameat) __renameat;

# 30 "readlib.c" 2

# 1 "../include/unistd.h" 1

# 1 "../posix/unistd.h" 1
# 27 "../posix/unistd.h"

# 202 "../posix/unistd.h"
# 1 "../sysdeps/unix/sysv/linux/bits/posix_opt.h" 1
# 203 "../posix/unistd.h" 2



# 1 "../sysdeps/unix/sysv/linux/x86/bits/environments.h" 1
# 22 "../sysdeps/unix/sysv/linux/x86/bits/environments.h"
# 1 "../sysdeps/x86/bits/wordsize.h" 1
# 23 "../sysdeps/unix/sysv/linux/x86/bits/environments.h" 2
# 207 "../posix/unistd.h" 2
# 217 "../posix/unistd.h"
# 1 "../include/bits/types.h" 1
# 218 "../posix/unistd.h" 2
# 226 "../posix/unistd.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 227 "../posix/unistd.h" 2
# 287 "../posix/unistd.h"
extern int access (const char *__name, int __type) __attribute__ ((__nothrow__ )) ;




extern int euidaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ )) ;


extern int eaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ )) ;






extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ )) ;
# 334 "../posix/unistd.h"
extern __off_t lseek (int __fd, __off_t __offset, int __whence) __attribute__ ((__nothrow__ ));
# 345 "../posix/unistd.h"
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     __attribute__ ((__nothrow__ ));






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 376 "../posix/unistd.h"
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset) ;
# 404 "../posix/unistd.h"
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ )) ;




extern int pipe2 (int __pipedes[2], int __flags) __attribute__ ((__nothrow__ )) ;
# 432 "../posix/unistd.h"
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__ ));
# 444 "../posix/unistd.h"
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ ));






extern int usleep (__useconds_t __useconds);
# 469 "../posix/unistd.h"
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ )) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__ )) ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ )) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ )) ;



extern int chdir (const char *__path) __attribute__ ((__nothrow__ )) ;



extern int fchdir (int __fd) __attribute__ ((__nothrow__ )) ;
# 511 "../posix/unistd.h"
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__ )) ;





extern char *get_current_dir_name (void) __attribute__ ((__nothrow__ ));







extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) __attribute__ ((__nothrow__ )) ;


extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ ));




extern int dup3 (int __fd, int __fd2, int __flags) __attribute__ ((__nothrow__ ));



extern char **__environ;

extern char **environ;





extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) __attribute__ ((__nothrow__ )) ;




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ )) ;




extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ )) ;



extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ )) ;



extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ )) ;



extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ )) ;




extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ )) ;




extern int execvpe (const char *__file, char *const __argv[],
      char *const __envp[])
     __attribute__ ((__nothrow__ )) ;





extern int nice (int __inc) __attribute__ ((__nothrow__ )) ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "../bits/confname.h" 1
# 24 "../bits/confname.h"
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 610 "../posix/unistd.h" 2


extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ )) ;


extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__ ));


extern long int sysconf (int __name) __attribute__ ((__nothrow__ ));



extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__ ));




extern __pid_t getpid (void) __attribute__ ((__nothrow__ ));


extern __pid_t getppid (void) __attribute__ ((__nothrow__ ));


extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ ));


extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ ));

extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ ));






extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__ ));
# 660 "../posix/unistd.h"
extern int setpgrp (void) __attribute__ ((__nothrow__ ));






extern __pid_t setsid (void) __attribute__ ((__nothrow__ ));



extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ ));



extern __uid_t getuid (void) __attribute__ ((__nothrow__ ));


extern __uid_t geteuid (void) __attribute__ ((__nothrow__ ));


extern __gid_t getgid (void) __attribute__ ((__nothrow__ ));


extern __gid_t getegid (void) __attribute__ ((__nothrow__ ));




extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__ )) ;



extern int group_member (__gid_t __gid) __attribute__ ((__nothrow__ ));






extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ )) ;




extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__ )) ;




extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ )) ;






extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ )) ;




extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__ )) ;




extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ )) ;





extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     __attribute__ ((__nothrow__ ));



extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     __attribute__ ((__nothrow__ ));



extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     __attribute__ ((__nothrow__ )) ;



extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     __attribute__ ((__nothrow__ )) ;






extern __pid_t fork (void) __attribute__ ((__nothrow__));







extern __pid_t vfork (void) __attribute__ ((__nothrow__ ));





extern char *ttyname (int __fd) __attribute__ ((__nothrow__ ));



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ )) ;



extern int isatty (int __fd) __attribute__ ((__nothrow__ ));




extern int ttyslot (void) __attribute__ ((__nothrow__ ));




extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ )) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     __attribute__ ((__nothrow__ )) ;




extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ )) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) __attribute__ ((__nothrow__ )) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) ;



extern int unlink (const char *__name) __attribute__ ((__nothrow__ )) ;



extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ )) ;



extern int rmdir (const char *__path) __attribute__ ((__nothrow__ )) ;



extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ ));


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__ ));






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) ;




extern int setlogin (const char *__name) __attribute__ ((__nothrow__ )) ;







# 1 "../include/bits/getopt_posix.h" 1
# 1 "../posix/bits/getopt_posix.h" 1
# 27 "../posix/bits/getopt_posix.h"
# 1 "../include/bits/getopt_core.h" 1
# 1 "../posix/bits/getopt_core.h" 1
# 28 "../posix/bits/getopt_core.h"








extern char *optarg;
# 50 "../posix/bits/getopt_core.h"
extern int optind;




extern int opterr;



extern int optopt;
# 91 "../posix/bits/getopt_core.h"
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__ )) ;


# 1 "../include/bits/getopt_core.h" 2
# 28 "../posix/bits/getopt_posix.h" 2


# 49 "../posix/bits/getopt_posix.h"

# 1 "../include/bits/getopt_posix.h" 2
# 870 "../posix/unistd.h" 2







extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__ )) ;






extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ )) ;



extern int sethostid (long int __id) __attribute__ ((__nothrow__ )) ;





extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ )) ;
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ )) ;





extern int vhangup (void) __attribute__ ((__nothrow__ ));


extern int revoke (const char *__file) __attribute__ ((__nothrow__ )) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ )) ;





extern int acct (const char *__name) __attribute__ ((__nothrow__ ));



extern char *getusershell (void) __attribute__ ((__nothrow__ ));
extern void endusershell (void) __attribute__ ((__nothrow__ ));
extern void setusershell (void) __attribute__ ((__nothrow__ ));





extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__ )) ;






extern int chroot (const char *__path) __attribute__ ((__nothrow__ )) ;



extern char *getpass (const char *__prompt) ;







extern int fsync (int __fd);





extern int syncfs (int __fd) __attribute__ ((__nothrow__ ));






extern long int gethostid (void);


extern void sync (void) __attribute__ ((__nothrow__ ));





extern int getpagesize (void) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));




extern int getdtablesize (void) __attribute__ ((__nothrow__ ));
# 991 "../posix/unistd.h"
extern int truncate (const char *__file, __off_t __length)
     __attribute__ ((__nothrow__ )) ;
# 1003 "../posix/unistd.h"
extern int truncate64 (const char *__file, __off64_t __length)
     __attribute__ ((__nothrow__ )) ;
# 1014 "../posix/unistd.h"
extern int ftruncate (int __fd, __off_t __length) __attribute__ ((__nothrow__ )) ;
# 1024 "../posix/unistd.h"
extern int ftruncate64 (int __fd, __off64_t __length) __attribute__ ((__nothrow__ )) ;
# 1035 "../posix/unistd.h"
extern int brk (void *__addr) __attribute__ ((__nothrow__ )) ;





extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ ));
# 1056 "../posix/unistd.h"
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__ ));
# 1079 "../posix/unistd.h"
extern int lockf (int __fd, int __cmd, __off_t __len) ;
# 1089 "../posix/unistd.h"
extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
# 1107 "../posix/unistd.h"
ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
    int __outfd, __off64_t *__poutoff,
    size_t __length, unsigned int __flags);





extern int fdatasync (int __fildes);
# 1124 "../posix/unistd.h"
extern char *crypt (const char *__key, const char *__salt)
     __attribute__ ((__nothrow__ )) ;







extern void swab (const void *__restrict __from, void *__restrict __to,
    ssize_t __n) __attribute__ ((__nothrow__ )) ;
# 1161 "../posix/unistd.h"
int getentropy (void *__buffer, size_t __length) ;








# 3 "../include/unistd.h" 2














extern __typeof (getlogin_r) __getlogin_r ;








extern int __access (const char *__name, int __type) ;
extern int __euidaccess (const char *__name, int __type);
extern int __faccessat (int __fd, const char *__file, int __type, int __flag);
extern int __faccessat_noerrno (int __fd, const char *__file, int __type,
           int __flag);
extern __off64_t __lseek64 (int __fd, __off64_t __offset, int __whence)
     ;
extern __off_t __lseek (int __fd, __off_t __offset, int __whence);

extern __off_t __libc_lseek (int __fd, __off_t __offset, int __whence);
extern __off64_t __libc_lseek64 (int __fd, __off64_t __offset, int __whence);
extern ssize_t __pread (int __fd, void *__buf, size_t __nbytes,
   __off_t __offset);
;
extern ssize_t __libc_pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset);
extern ssize_t __pread64 (int __fd, void *__buf, size_t __nbytes,
     __off64_t __offset);
;
extern ssize_t __libc_pread64 (int __fd, void *__buf, size_t __nbytes,
          __off64_t __offset) ;
extern ssize_t __pwrite (int __fd, const void *__buf, size_t __n,
    __off_t __offset);

extern ssize_t __libc_pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset);
extern ssize_t __pwrite64 (int __fd, const void *__buf, size_t __n,
      __off64_t __offset);

extern ssize_t __libc_pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;
extern ssize_t __libc_read (int __fd, void *__buf, size_t __n);


extern ssize_t __libc_write (int __fd, const void *__buf, size_t __n);


extern int __pipe (int __pipedes[2]);

extern int __pipe2 (int __pipedes[2], int __flags) ;
extern unsigned int __sleep (unsigned int __seconds) ;
extern int __chown (const char *__file,
      __uid_t __owner, __gid_t __group);

extern int __fchown (int __fd,
       __uid_t __owner, __gid_t __group);
extern int __lchown (const char *__file, __uid_t __owner,
       __gid_t __group);
extern int __chdir (const char *__path) ;
extern int __fchdir (int __fd) ;
extern char *__getcwd (char *__buf, size_t __size) ;
extern int __rmdir (const char *__path) ;
extern int __execvpe (const char *file, char *const argv[],
        char *const envp[]) ;
extern int __execvpex (const char *file, char *const argv[],
         char *const envp[]) ;







char *__canonicalize_directory_name_internal (const char *__thisdir,
           char *__buf,
           size_t __size) ;

extern int __dup (int __fd);

extern int __dup2 (int __fd, int __fd2);

extern int __dup3 (int __fd, int __fd2, int flags);

extern int __execve (const char *__path, char *const __argv[],
       char *const __envp[]) ;
extern long int __pathconf (const char *__path, int __name);
extern long int __fpathconf (int __fd, int __name);
extern long int __sysconf (int __name);

extern __pid_t __getpid (void);

extern __pid_t __getppid (void);
extern __pid_t __setsid (void) ;
extern __uid_t __getuid (void) ;
extern __uid_t __geteuid (void) ;
extern __gid_t __getgid (void) ;
extern __gid_t __getegid (void) ;
extern int __getgroups (int __size, __gid_t __list[]) ;

extern int __group_member (__gid_t __gid) ;
extern int __setuid (__uid_t __uid);
extern int __setreuid (__uid_t __ruid, __uid_t __euid);
extern int __setgid (__gid_t __gid);
extern int __setpgid (__pid_t __pid, __pid_t __pgid);

extern int __setregid (__gid_t __rgid, __gid_t __egid);
extern int __getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid);
extern int __getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid);
extern int __setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid);
extern int __setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid);




extern __pid_t __vfork (void);

extern int __ttyname_r (int __fd, char *__buf, size_t __buflen)
     ;
extern int __isatty (int __fd) ;
extern int __link (const char *__from, const char *__to);
extern int __symlink (const char *__from, const char *__to);
extern ssize_t __readlink (const char *__path, char *__buf, size_t __len)
     ;
extern int __unlink (const char *__name) ;
extern int __gethostname (char *__name, size_t __len) ;
extern int __revoke (const char *__file);
extern int __profil (unsigned short int *__sample_buffer, size_t __size,
       size_t __offset, unsigned int __scale)
     ;
extern int __getdtablesize (void) ;
extern int __brk (void *__addr) ;
extern int __close (int __fd);

extern int __libc_close (int __fd);
extern ssize_t __read (int __fd, void *__buf, size_t __nbytes);

extern ssize_t __write (int __fd, const void *__buf, size_t __n);

extern __pid_t __fork (void);

extern int __getpagesize (void) __attribute__ ((__const__));

extern int __ftruncate (int __fd, __off_t __length) ;
extern int __ftruncate64 (int __fd, __off64_t __length) ;
extern int __truncate (const char *path, __off_t __length);
extern void *__sbrk (intptr_t __delta);








extern int __libc_enable_secure __attribute__ ((section (".data.rel.ro")));
extern int __libc_enable_secure_decided;




extern void __libc_check_standard_fds (void) ;



extern __pid_t __libc_fork (void);



extern int __libc_pause (void);

extern int __getlogin_r_loginuid (char *name, size_t namesize)
     ;
# 32 "readlib.c" 2
# 1 "../include/sys/mman.h" 1

# 1 "../misc/sys/mman.h" 1
# 23 "../misc/sys/mman.h"
# 1 "../include/bits/types.h" 1
# 24 "../misc/sys/mman.h" 2

# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 26 "../misc/sys/mman.h" 2
# 41 "../misc/sys/mman.h"
# 1 "../sysdeps/unix/sysv/linux/x86/bits/mman.h" 1
# 49 "../sysdeps/unix/sysv/linux/x86/bits/mman.h"
# 1 "../sysdeps/unix/sysv/linux/bits/mman-linux.h" 1
# 117 "../sysdeps/unix/sysv/linux/bits/mman-linux.h"
# 1 "../sysdeps/unix/sysv/linux/bits/mman-shared.h" 1
# 42 "../sysdeps/unix/sysv/linux/bits/mman-shared.h"




int memfd_create (const char *__name, unsigned int __flags) __attribute__ ((__nothrow__ ));



int mlock2 (const void *__addr, size_t __length, unsigned int __flags) __attribute__ ((__nothrow__ ));





int pkey_alloc (unsigned int __flags, unsigned int __access_rights) __attribute__ ((__nothrow__ ));



int pkey_set (int __key, unsigned int __access_rights) __attribute__ ((__nothrow__ ));



int pkey_get (int __key) __attribute__ ((__nothrow__ ));



int pkey_free (int __key) __attribute__ ((__nothrow__ ));



int pkey_mprotect (void *__addr, size_t __len, int __prot, int __pkey) __attribute__ ((__nothrow__ ));


# 117 "../sysdeps/unix/sysv/linux/bits/mman-linux.h" 2
# 49 "../sysdeps/unix/sysv/linux/x86/bits/mman.h" 2
# 42 "../misc/sys/mman.h" 2





# 57 "../misc/sys/mman.h"
extern void *mmap (void *__addr, size_t __len, int __prot,
     int __flags, int __fd, __off_t __offset) __attribute__ ((__nothrow__ ));
# 70 "../misc/sys/mman.h"
extern void *mmap64 (void *__addr, size_t __len, int __prot,
       int __flags, int __fd, __off64_t __offset) __attribute__ ((__nothrow__ ));




extern int munmap (void *__addr, size_t __len) __attribute__ ((__nothrow__ ));




extern int mprotect (void *__addr, size_t __len, int __prot) __attribute__ ((__nothrow__ ));







extern int msync (void *__addr, size_t __len, int __flags);




extern int madvise (void *__addr, size_t __len, int __advice) __attribute__ ((__nothrow__ ));



extern int posix_madvise (void *__addr, size_t __len, int __advice) __attribute__ ((__nothrow__ ));




extern int mlock (const void *__addr, size_t __len) __attribute__ ((__nothrow__ ));


extern int munlock (const void *__addr, size_t __len) __attribute__ ((__nothrow__ ));




extern int mlockall (int __flags) __attribute__ ((__nothrow__ ));



extern int munlockall (void) __attribute__ ((__nothrow__ ));







extern int mincore (void *__start, size_t __len, unsigned char *__vec)
     __attribute__ ((__nothrow__ ));
# 133 "../misc/sys/mman.h"
extern void *mremap (void *__addr, size_t __old_len, size_t __new_len,
       int __flags, ...) __attribute__ ((__nothrow__ ));



extern int remap_file_pages (void *__start, size_t __size, int __prot,
        size_t __pgoff, int __flags) __attribute__ ((__nothrow__ ));




extern int shm_open (const char *__name, int __oflag, mode_t __mode);


extern int shm_unlink (const char *__name);


# 3 "../include/sys/mman.h" 2



extern void *__mmap (void *__addr, size_t __len, int __prot,
       int __flags, int __fd, __off_t __offset);

extern void *__mmap64 (void *__addr, size_t __len, int __prot,
         int __flags, int __fd, __off64_t __offset);

extern int __munmap (void *__addr, size_t __len);

extern int __mprotect (void *__addr, size_t __len, int __prot);


extern int __madvise (void *__addr, size_t __len, int __advice);



extern void *__mremap (void *__addr, size_t __old_len,
         size_t __new_len, int __flags, ...);

# 33 "readlib.c" 2
# 1 "../include/sys/param.h" 1
# 34 "readlib.c" 2

# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/gnu/lib-names.h" 1
# 11 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/gnu/lib-names.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/gnu/lib-names-64.h" 1
# 12 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/build-x86_64-poky-linux/gnu/lib-names.h" 2
# 36 "readlib.c" 2

# 1 "../sysdeps/unix/sysv/linux/x86_64/ldconfig.h" 1
# 18 "../sysdeps/unix/sysv/linux/x86_64/ldconfig.h"
# 1 "../sysdeps/generic/ldconfig.h" 1
# 52 "../sysdeps/generic/ldconfig.h"
extern void print_cache (const char *cache_name);

extern void init_cache (void);

extern void save_cache (const char *cache_name);

extern void add_to_cache (const char *path, const char *lib, int flags,
     unsigned int osversion, uint64_t hwcap);

extern void init_aux_cache (void);

extern void load_aux_cache (const char *aux_cache_name);

extern int search_aux_cache (struct stat64 *stat_buf, int *flags,
        unsigned int *osversion, char **soname);

extern void add_to_aux_cache (struct stat64 *stat_buf, int flags,
         unsigned int osversion, const char *soname);

extern void save_aux_cache (const char *aux_cache_name);


extern int process_file (const char *real_file_name, const char *file_name,
    const char *lib, int *flag, unsigned int *osversion,
    char **soname, int is_link, struct stat64 *stat_buf);

extern char *implicit_soname (const char *lib, int flag);


extern int process_elf_file (const char *file_name, const char *lib, int *flag,
        unsigned int *osversion, char **soname,
        void *file_contents, size_t file_length);


extern char *chroot_canon (const char *chroot, const char *name);


extern int opt_verbose;

extern int opt_format;


# 1 "../include/programs/xmalloc.h" 1
# 22 "../include/programs/xmalloc.h"
# 1 "/home/flaig/EB_2.1/build/tmp/work/corei7-64-poky-linux/glibc/2.28-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/8.3.0/include/stddef.h" 1 3 4
# 23 "../include/programs/xmalloc.h" 2


extern void *xmalloc (size_t n)
  __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (1)));
extern void *xcalloc (size_t n, size_t s)
  __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (1, 2)));
extern void *xrealloc (void *o, size_t n)
  __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2)));
extern char *xstrdup (const char *) __attribute__ ((__malloc__));
# 95 "../sysdeps/generic/ldconfig.h" 2
# 19 "../sysdeps/unix/sysv/linux/x86_64/ldconfig.h" 2
# 38 "readlib.c" 2




struct known_names
{
  const char *soname;
  int flag;
};

static struct known_names interpreters[] =
{
  { "/lib/" "ld-linux-x86-64.so.2", 0x0003 },

  { "/lib/ld-linux.so.2", 0x0003 }, { "/libx32/ld-linux-x32.so.2", 0x0003 }, { "/lib64/ld-linux-x86-64.so.2", 0x0003 },

  {"/lib/ld-linux-x86-64.so.2",0x0003 }
};

static struct known_names known_libs[] =
{
  { "libc.so.6", 0x0003 },
  { "libm.so.6", 0x0003 },

  { "libc.so.6", 0x0003 }, { "libm.so.6", 0x0003 },

};



static 
# 68 "readlib.c" 3 4
      _Bool

# 69 "readlib.c"
is_gdb_python_file (const char *name)
{
  size_t len = strlen (name);
  return len > 7 && strcmp (name + len - 7, "-gdb.py") == 0;
}


int
process_file (const char *real_file_name, const char *file_name,
       const char *lib, int *flag, unsigned int *osversion,
       char **soname, int is_link, struct stat64 *stat_buf)
{
  FILE *file;
  struct stat64 statbuf;
  void *file_contents;
  int ret;
  Elf64_Ehdr *elf_header;
  struct exec *aout_header;

  ret = 0;
  *flag = -1;
  *soname = 
# 90 "readlib.c" 3 4
           ((void *)0)
# 90 "readlib.c"
               ;

  file = fopen (real_file_name, "rb");
  if (file == 
# 93 "readlib.c" 3 4
             ((void *)0)
# 93 "readlib.c"
                 )
    {

      if (is_link && strstr (file_name, ".so") != 
# 96 "readlib.c" 3 4
                                                 ((void *)0)
# 96 "readlib.c"
                                                     )
 return 1;
      error (0, 0, __dcgettext (_libc_intl_domainname, "Input file %s not found.\n", 5), file_name);
      return 1;
    }

  if (__fxstat64 (1, fileno (file), &statbuf) < 0)
    {
      error (0, 0, __dcgettext (_libc_intl_domainname, "Cannot fstat file %s.\n", 5), file_name);
      fclose (file);
      return 1;
    }



  if ((size_t) statbuf.st_size < sizeof (struct exec)
      || (size_t) statbuf.st_size < sizeof (Elf64_Ehdr))
    {
      if (statbuf.st_size == 0)
 error (0, 0, __dcgettext (_libc_intl_domainname, "File %s is empty, not checked.", 5), file_name);
      else
 {
   char buf[4];
   size_t n = (((statbuf.st_size)<(4))?(statbuf.st_size):(4));
   if (fread (buf, n, 1, file) == 1 && memcmp (buf, "\177ELF", n) == 0)
     error (0, 0, __dcgettext (_libc_intl_domainname, "File %s is too small, not checked.", 5), file_name);
 }
      fclose (file);
      return 1;
    }

  file_contents = mmap (0, statbuf.st_size, 0x1, 0x01,
   fileno (file), 0);
  if (file_contents == ((void *) -1))
    {
      error (0, 0, __dcgettext (_libc_intl_domainname, "Cannot mmap file %s.\n", 5), file_name);
      fclose (file);
      return 1;
    }


  aout_header = (struct exec *) file_contents;
  if (((*aout_header).a_info & 0xffff) == 0413

      || ((*aout_header).a_info & 0xffff) == 0314

      )
    {


      char *copy, *major, *dot;
      copy = xstrdup (lib);
      major = strstr (copy, ".so.");
      if (major)
 {
   dot = strstr (major + 4, ".");
   if (dot)
     *dot = '\0';
 }
      *soname = copy;
      *flag = 0x0000;
      goto done;
    }

  elf_header = (Elf64_Ehdr *) file_contents;
  if (memcmp (elf_header->e_ident, "\177ELF", 4) != 0)
    {



      size_t len = (((statbuf.st_size)<(512))?(statbuf.st_size):(512));
      if (memmem (file_contents, len, "GROUP", 5) == 
# 167 "readlib.c" 3 4
                                                    ((void *)0)
   
# 168 "readlib.c"
  && memmem (file_contents, len, "GNU ld script", 13) == 
# 168 "readlib.c" 3 4
                                                         ((void *)0)
   
# 169 "readlib.c"
  && !is_gdb_python_file (file_name))
 error (0, 0, __dcgettext (_libc_intl_domainname, "%s is not an ELF file - it has the wrong magic bytes at the start.\n", 5),
        file_name);
      ret = 1;
    }

  else if (elf_header->e_type != 3)
    ret = 1;
  else if (process_elf_file (file_name, lib, flag, osversion, soname,
        file_contents, statbuf.st_size))
    ret = 1;

 done:

  munmap (file_contents, statbuf.st_size);
  fclose (file);

  *stat_buf = statbuf;
  return ret;
}



char *
implicit_soname (const char *lib, int flag)
{
  char *soname = xstrdup (lib);

  if ((flag & 0x00ff) != 0x0000)
    return soname;



  char *major = strstr (soname, ".so.");
  if (major)
    {
      char *dot = strstr (major + 4, ".");
      if (dot)
 *dot = '\0';
    }
  return soname;
}


# 1 "../sysdeps/unix/sysv/linux/x86_64/readelflib.c" 1

# 1 "../sysdeps/unix/sysv/linux/i386/readelflib.c" 1
# 21 "../sysdeps/unix/sysv/linux/i386/readelflib.c"
int process_elf32_file (const char *file_name, const char *lib, int *flag,
   unsigned int *osversion, char **soname,
   void *file_contents, size_t file_length);
int process_elf64_file (const char *file_name, const char *lib, int *flag,
   unsigned int *osversion, char **soname,
   void *file_contents, size_t file_length);


int
process_elf_file (const char *file_name, const char *lib, int *flag,
    unsigned int *osversion, char **soname, void *file_contents,
    size_t file_length)
{
  Elf64_Ehdr *elf_header = (Elf64_Ehdr *) file_contents;
  int ret, file_flag = 0;

  switch (elf_header->e_machine)
    {
    case 62:
      if (elf_header->e_ident[4] == 2)

 file_flag = 0x0300|0x0003;
      else

 file_flag = 0x0800|0x0003;
      break;
# 57 "../sysdeps/unix/sysv/linux/i386/readelflib.c"
    case 3:
      if (elf_header->e_ident[4] == 1)
 break;

    default:



      error (0, 0, __dcgettext (_libc_intl_domainname, "%s is for unknown machine %d.\n", 5),
      file_name, elf_header->e_machine);
      return 1;
    }

  if (elf_header->e_ident[4] == 1)
    ret = process_elf32_file (file_name, lib, flag, osversion, soname,
         file_contents, file_length);
  else
    ret = process_elf64_file (file_name, lib, flag, osversion, soname,
         file_contents, file_length);

  if (!ret && file_flag)
    *flag = file_flag;

  return ret;
}





# 1 "../elf/readelflib.c" 1
# 41 "../elf/readelflib.c"
int
process_elf32_file (const char *file_name, const char *lib, int *flag,
    unsigned int *osversion, char **soname, void *file_contents,
    size_t file_length)
{
  int i;
  unsigned int j;
  Elf32_Addr loadaddr;
  unsigned int dynamic_addr;
  size_t dynamic_size;
  char *program_interpreter;

  Elf32_Ehdr *elf_header;
  Elf32_Phdr *elf_pheader, *segment;
  Elf32_Dyn *dynamic_segment, *dyn_entry;
  char *dynamic_strings;

  elf_header = (Elf32_Ehdr *) file_contents;
  *osversion = 0;

  if (elf_header->e_ident [4] != 1)
    {
      if (opt_verbose)
 {
   if (elf_header->e_ident [4] == 1)
     error (0, 0, __dcgettext (_libc_intl_domainname, "%s is a 32 bit ELF file.\n", 5), file_name);
   else if (elf_header->e_ident [4] == 2)
     error (0, 0, __dcgettext (_libc_intl_domainname, "%s is a 64 bit ELF file.\n", 5), file_name);
   else
     error (0, 0, __dcgettext (_libc_intl_domainname, "Unknown ELFCLASS in file %s.\n", 5), file_name);
 }
      return 1;
    }

  if (elf_header->e_type != 3)
    {
      error (0, 0, __dcgettext (_libc_intl_domainname, "%s is not a shared object file (Type: %d).\n", 5), file_name,
      elf_header->e_type);
      return 1;
    }


  elf_pheader = (Elf32_Phdr *) (elf_header->e_phoff + file_contents);
  do { if ((void *)(elf_pheader) < file_contents || (void *)(elf_pheader) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;



  *flag = 0x0001;

  loadaddr = -1;
  dynamic_addr = 0;
  dynamic_size = 0;
  program_interpreter = 
# 93 "../elf/readelflib.c" 3 4
                       ((void *)0)
# 93 "../elf/readelflib.c"
                           ;
  for (i = 0, segment = elf_pheader;
       i < elf_header->e_phnum; i++, segment++)
    {
      do { if ((void *)(segment) < file_contents || (void *)(segment) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;

      switch (segment->p_type)
 {
 case 1:
   if (loadaddr == (Elf32_Addr) -1)
     loadaddr = segment->p_vaddr - segment->p_offset;
   break;

 case 2:
   if (dynamic_addr)
     error (0, 0, __dcgettext (_libc_intl_domainname, "more than one dynamic segment\n", 5));

   dynamic_addr = segment->p_offset;
   dynamic_size = segment->p_filesz;
   break;

 case 3:
   program_interpreter = (char *) (file_contents + segment->p_offset);
   do { if ((void *)(program_interpreter) < file_contents || (void *)(program_interpreter) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;


   for (j = 0; j < sizeof (interpreters) / sizeof (interpreters [0]);
        ++j)
     if (strcmp (program_interpreter, interpreters[j].soname) == 0)
       {
  *flag = interpreters[j].flag;
  break;
       }
   break;

 case 4:
   if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
     {
       Elf32_Word *abi_note = (Elf32_Word *) (file_contents
           + segment->p_offset);
       Elf32_Addr size = segment->p_filesz;







       Elf32_Addr align = segment->p_align;
       if (align < 4)
  align = 4;
       else if (align != 4 && align != 8)
  continue;

       while (abi_note [0] != 4 || abi_note [1] != 16
       || abi_note [2] != 1
       || memcmp (abi_note + 3, "GNU", 4) != 0)
  {
    Elf32_Addr note_size
      = ((((((sizeof (Elf32_Nhdr) + ((abi_note[0]))) + (((align))) - 1) & -((__typeof__ ((sizeof (Elf32_Nhdr) + ((abi_note[0]))) + (((align))) - 1)) ((((align)))))) + (abi_note[1])) + ((align)) - 1) & -((__typeof__ (((((sizeof (Elf32_Nhdr) + ((abi_note[0]))) + (((align))) - 1) & -((__typeof__ ((sizeof (Elf32_Nhdr) + ((abi_note[0]))) + (((align))) - 1)) ((((align)))))) + (abi_note[1])) + ((align)) - 1)) (((align)))))
               ;

    if (size - 32 < note_size || note_size == 0)
      {
        size = 0;
        break;
      }
    size -= note_size;
    abi_note = (void *) abi_note + note_size;
  }

       if (size == 0)
  break;

       *osversion = (abi_note [4] << 24) |
      ((abi_note [5] & 0xff) << 16) |
      ((abi_note [6] & 0xff) << 8) |
      (abi_note [7] & 0xff);
     }
   break;

 default:
   break;
 }

    }
  if (loadaddr == (Elf32_Addr) -1)
    {

      loadaddr = 0;
    }


  if (dynamic_size == 0)
    return 1;

  dynamic_segment = (Elf32_Dyn *) (file_contents + dynamic_addr);
  do { if ((void *)(dynamic_segment) < file_contents || (void *)(dynamic_segment) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;


  dynamic_strings = 
# 193 "../elf/readelflib.c" 3 4
                   ((void *)0)
# 193 "../elf/readelflib.c"
                       ;
  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != 0;
       ++dyn_entry)
    {
      do { if ((void *)(dyn_entry) < file_contents || (void *)(dyn_entry) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;
      if (dyn_entry->d_tag == 5)
 {
   dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
   do { if ((void *)(dynamic_strings) < file_contents || (void *)(dynamic_strings) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;
   break;
 }
    }

  if (dynamic_strings == 
# 206 "../elf/readelflib.c" 3 4
                        ((void *)0)
# 206 "../elf/readelflib.c"
                            )
    return 1;


  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != 0;
       ++dyn_entry)
    {
      if (dyn_entry->d_tag == 1 || dyn_entry->d_tag == 14)
 {
   char *name = dynamic_strings + dyn_entry->d_un.d_val;
   do { if ((void *)(name) < file_contents || (void *)(name) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;

   if (dyn_entry->d_tag == 1)
     {

       if (*flag == 0x0001)
  {

    for (j = 0;
         j < sizeof (known_libs) / sizeof (known_libs [0]);
         ++j)
      if (strcmp (name, known_libs [j].soname) == 0)
        {
   *flag = known_libs [j].flag;
   break;
        }
  }
     }

   else if (dyn_entry->d_tag == 14)
     *soname = xstrdup (name);


   if (*soname && *flag != 0x0001)
     return 0;
 }
    }

  return 0;
}
# 88 "../sysdeps/unix/sysv/linux/i386/readelflib.c" 2





# 1 "../elf/readelflib.c" 1
# 41 "../elf/readelflib.c"
int
process_elf64_file (const char *file_name, const char *lib, int *flag,
    unsigned int *osversion, char **soname, void *file_contents,
    size_t file_length)
{
  int i;
  unsigned int j;
  Elf64_Addr loadaddr;
  unsigned int dynamic_addr;
  size_t dynamic_size;
  char *program_interpreter;

  Elf64_Ehdr *elf_header;
  Elf64_Phdr *elf_pheader, *segment;
  Elf64_Dyn *dynamic_segment, *dyn_entry;
  char *dynamic_strings;

  elf_header = (Elf64_Ehdr *) file_contents;
  *osversion = 0;

  if (elf_header->e_ident [4] != 2)
    {
      if (opt_verbose)
 {
   if (elf_header->e_ident [4] == 1)
     error (0, 0, __dcgettext (_libc_intl_domainname, "%s is a 32 bit ELF file.\n", 5), file_name);
   else if (elf_header->e_ident [4] == 2)
     error (0, 0, __dcgettext (_libc_intl_domainname, "%s is a 64 bit ELF file.\n", 5), file_name);
   else
     error (0, 0, __dcgettext (_libc_intl_domainname, "Unknown ELFCLASS in file %s.\n", 5), file_name);
 }
      return 1;
    }

  if (elf_header->e_type != 3)
    {
      error (0, 0, __dcgettext (_libc_intl_domainname, "%s is not a shared object file (Type: %d).\n", 5), file_name,
      elf_header->e_type);
      return 1;
    }


  elf_pheader = (Elf64_Phdr *) (elf_header->e_phoff + file_contents);
  do { if ((void *)(elf_pheader) < file_contents || (void *)(elf_pheader) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;



  *flag = 0x0001;

  loadaddr = -1;
  dynamic_addr = 0;
  dynamic_size = 0;
  program_interpreter = 
# 93 "../elf/readelflib.c" 3 4
                       ((void *)0)
# 93 "../elf/readelflib.c"
                           ;
  for (i = 0, segment = elf_pheader;
       i < elf_header->e_phnum; i++, segment++)
    {
      do { if ((void *)(segment) < file_contents || (void *)(segment) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;

      switch (segment->p_type)
 {
 case 1:
   if (loadaddr == (Elf64_Addr) -1)
     loadaddr = segment->p_vaddr - segment->p_offset;
   break;

 case 2:
   if (dynamic_addr)
     error (0, 0, __dcgettext (_libc_intl_domainname, "more than one dynamic segment\n", 5));

   dynamic_addr = segment->p_offset;
   dynamic_size = segment->p_filesz;
   break;

 case 3:
   program_interpreter = (char *) (file_contents + segment->p_offset);
   do { if ((void *)(program_interpreter) < file_contents || (void *)(program_interpreter) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;


   for (j = 0; j < sizeof (interpreters) / sizeof (interpreters [0]);
        ++j)
     if (strcmp (program_interpreter, interpreters[j].soname) == 0)
       {
  *flag = interpreters[j].flag;
  break;
       }
   break;

 case 4:
   if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
     {
       Elf64_Word *abi_note = (Elf64_Word *) (file_contents
           + segment->p_offset);
       Elf64_Addr size = segment->p_filesz;







       Elf64_Addr align = segment->p_align;
       if (align < 4)
  align = 4;
       else if (align != 4 && align != 8)
  continue;

       while (abi_note [0] != 4 || abi_note [1] != 16
       || abi_note [2] != 1
       || memcmp (abi_note + 3, "GNU", 4) != 0)
  {
    Elf64_Addr note_size
      = ((((((sizeof (Elf64_Nhdr) + ((abi_note[0]))) + (((align))) - 1) & -((__typeof__ ((sizeof (Elf64_Nhdr) + ((abi_note[0]))) + (((align))) - 1)) ((((align)))))) + (abi_note[1])) + ((align)) - 1) & -((__typeof__ (((((sizeof (Elf64_Nhdr) + ((abi_note[0]))) + (((align))) - 1) & -((__typeof__ ((sizeof (Elf64_Nhdr) + ((abi_note[0]))) + (((align))) - 1)) ((((align)))))) + (abi_note[1])) + ((align)) - 1)) (((align)))))
               ;

    if (size - 32 < note_size || note_size == 0)
      {
        size = 0;
        break;
      }
    size -= note_size;
    abi_note = (void *) abi_note + note_size;
  }

       if (size == 0)
  break;

       *osversion = (abi_note [4] << 24) |
      ((abi_note [5] & 0xff) << 16) |
      ((abi_note [6] & 0xff) << 8) |
      (abi_note [7] & 0xff);
     }
   break;

 default:
   break;
 }

    }
  if (loadaddr == (Elf64_Addr) -1)
    {

      loadaddr = 0;
    }


  if (dynamic_size == 0)
    return 1;

  dynamic_segment = (Elf64_Dyn *) (file_contents + dynamic_addr);
  do { if ((void *)(dynamic_segment) < file_contents || (void *)(dynamic_segment) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;


  dynamic_strings = 
# 193 "../elf/readelflib.c" 3 4
                   ((void *)0)
# 193 "../elf/readelflib.c"
                       ;
  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != 0;
       ++dyn_entry)
    {
      do { if ((void *)(dyn_entry) < file_contents || (void *)(dyn_entry) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;
      if (dyn_entry->d_tag == 5)
 {
   dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
   do { if ((void *)(dynamic_strings) < file_contents || (void *)(dynamic_strings) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;
   break;
 }
    }

  if (dynamic_strings == 
# 206 "../elf/readelflib.c" 3 4
                        ((void *)0)
# 206 "../elf/readelflib.c"
                            )
    return 1;


  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != 0;
       ++dyn_entry)
    {
      if (dyn_entry->d_tag == 1 || dyn_entry->d_tag == 14)
 {
   char *name = dynamic_strings + dyn_entry->d_un.d_val;
   do { if ((void *)(name) < file_contents || (void *)(name) > (file_contents+file_length)) { error (0, 0, __dcgettext (_libc_intl_domainname, "file %s is truncated\n", 5), file_name); return 1; } } while (0);;

   if (dyn_entry->d_tag == 1)
     {

       if (*flag == 0x0001)
  {

    for (j = 0;
         j < sizeof (known_libs) / sizeof (known_libs [0]);
         ++j)
      if (strcmp (name, known_libs [j].soname) == 0)
        {
   *flag = known_libs [j].flag;
   break;
        }
  }
     }

   else if (dyn_entry->d_tag == 14)
     *soname = xstrdup (name);


   if (*soname && *flag != 0x0001)
     return 0;
 }
    }

  return 0;
}
# 93 "../sysdeps/unix/sysv/linux/i386/readelflib.c" 2
# 2 "../sysdeps/unix/sysv/linux/x86_64/readelflib.c" 2
# 213 "readlib.c" 2
