# 1 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c"
# 24 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c"
# 1 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h" 1
# 49 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h"
# 1 "include/linux/version.h" 1
# 50 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h" 2
# 77 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h"
# 1 "include/linux/autoconf.h" 1
# 78 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h" 2



# 1 "include/linux/jiffies.h" 1



# 1 "include/linux/math64.h" 1



# 1 "include/linux/types.h" 1



# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/types.h" 1
# 18 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/types.h"
# 1 "include/asm-generic/int-ll64.h" 1
# 11 "include/asm-generic/int-ll64.h"
# 1 "include/asm-generic/bitsperlong.h" 1
# 12 "include/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 42 "include/asm-generic/int-ll64.h"
typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;
# 19 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/types.h" 2



typedef unsigned short umode_t;
# 35 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/types.h"
typedef u32 dma_addr_t;
typedef u64 dma64_addr_t;




typedef unsigned long phys_t;
# 5 "include/linux/types.h" 2
# 14 "include/linux/types.h"
# 1 "include/linux/posix_types.h" 1



# 1 "include/linux/stddef.h" 1



# 1 "include/linux/compiler.h" 1
# 40 "include/linux/compiler.h"
# 1 "include/linux/compiler-gcc.h" 1
# 86 "include/linux/compiler-gcc.h"
# 1 "include/linux/compiler-gcc4.h" 1
# 86 "include/linux/compiler-gcc.h" 2
# 41 "include/linux/compiler.h" 2
# 58 "include/linux/compiler.h"
struct ftrace_branch_data {
 const char *func;
 const char *file;
 unsigned line;
 union {
  struct {
   unsigned long correct;
   unsigned long incorrect;
  };
  struct {
   unsigned long miss;
   unsigned long hit;
  };
  unsigned long miss_hit[2];
 };
};
# 5 "include/linux/stddef.h" 2
# 15 "include/linux/stddef.h"
enum {
 false = 0,
 true = 1
};
# 5 "include/linux/posix_types.h" 2
# 36 "include/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits [(1024/(8 * sizeof(unsigned long)))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/posix_types.h" 1
# 12 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/posix_types.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/sgidefs.h" 1
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/posix_types.h" 2







typedef unsigned long __kernel_ino_t;
typedef unsigned int __kernel_mode_t;

typedef unsigned long __kernel_nlink_t;




typedef long __kernel_off_t;
typedef int __kernel_pid_t;
typedef int __kernel_ipc_pid_t;
typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;

typedef unsigned int __kernel_size_t;
typedef int __kernel_ssize_t;
typedef int __kernel_ptrdiff_t;






typedef long __kernel_time_t;
typedef long __kernel_suseconds_t;
typedef long __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef long __kernel_daddr_t;
typedef char * __kernel_caddr_t;

typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
typedef __kernel_uid_t __kernel_old_uid_t;
typedef __kernel_gid_t __kernel_old_gid_t;
typedef unsigned int __kernel_old_dev_t;


typedef long long __kernel_loff_t;


typedef struct {

 long val[2];




} __kernel_fsid_t;




static __inline__ __attribute__((always_inline)) void __FD_SET(unsigned long __fd, __kernel_fd_set *__fdsetp)
{
 unsigned long __tmp = __fd / (8 * sizeof(unsigned long));
 unsigned long __rem = __fd % (8 * sizeof(unsigned long));
 __fdsetp->fds_bits[__tmp] |= (1UL<<__rem);
}


static __inline__ __attribute__((always_inline)) void __FD_CLR(unsigned long __fd, __kernel_fd_set *__fdsetp)
{
 unsigned long __tmp = __fd / (8 * sizeof(unsigned long));
 unsigned long __rem = __fd % (8 * sizeof(unsigned long));
 __fdsetp->fds_bits[__tmp] &= ~(1UL<<__rem);
}


static __inline__ __attribute__((always_inline)) int __FD_ISSET(unsigned long __fd, const __kernel_fd_set *__p)
{
 unsigned long __tmp = __fd / (8 * sizeof(unsigned long));
 unsigned long __rem = __fd % (8 * sizeof(unsigned long));
 return (__p->fds_bits[__tmp] & (1UL<<__rem)) != 0;
}






static __inline__ __attribute__((always_inline)) void __FD_ZERO(__kernel_fd_set *__p)
{
 unsigned long *__tmp = __p->fds_bits;
 int __i;

 if (__builtin_constant_p((1024/(8 * sizeof(unsigned long))))) {
  switch ((1024/(8 * sizeof(unsigned long)))) {
  case 16:
   __tmp[ 0] = 0; __tmp[ 1] = 0;
   __tmp[ 2] = 0; __tmp[ 3] = 0;
   __tmp[ 4] = 0; __tmp[ 5] = 0;
   __tmp[ 6] = 0; __tmp[ 7] = 0;
   __tmp[ 8] = 0; __tmp[ 9] = 0;
   __tmp[10] = 0; __tmp[11] = 0;
   __tmp[12] = 0; __tmp[13] = 0;
   __tmp[14] = 0; __tmp[15] = 0;
   return;

  case 8:
   __tmp[ 0] = 0; __tmp[ 1] = 0;
   __tmp[ 2] = 0; __tmp[ 3] = 0;
   __tmp[ 4] = 0; __tmp[ 5] = 0;
   __tmp[ 6] = 0; __tmp[ 7] = 0;
   return;

  case 4:
   __tmp[ 0] = 0; __tmp[ 1] = 0;
   __tmp[ 2] = 0; __tmp[ 3] = 0;
   return;
  }
 }
 __i = (1024/(8 * sizeof(unsigned long)));
 while (__i) {
  __i--;
  *__tmp = 0;
  __tmp++;
 }
}
# 48 "include/linux/posix_types.h" 2
# 15 "include/linux/types.h" 2



typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef __kernel_nlink_t nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;

typedef _Bool bool;

typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;

typedef unsigned long uintptr_t;
# 50 "include/linux/types.h"
typedef __kernel_loff_t loff_t;
# 59 "include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 142 "include/linux/types.h"
typedef unsigned long sector_t;
typedef unsigned long blkcnt_t;
# 173 "include/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;


typedef unsigned gfp_t;
typedef unsigned fmode_t;




typedef u32 phys_addr_t;


typedef phys_addr_t resource_size_t;

typedef struct {
 volatile int counter;
} atomic_t;







struct ustat {
 __kernel_daddr_t f_tfree;
 __kernel_ino_t f_tinode;
 char f_fname[6];
 char f_fpack[6];
};
# 5 "include/linux/math64.h" 2
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/div64.h" 1
# 12 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/div64.h"
# 1 "include/asm-generic/div64.h" 1
# 35 "include/asm-generic/div64.h"
extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/div64.h" 2
# 6 "include/linux/math64.h" 2
# 41 "include/linux/math64.h"
static inline __attribute__((always_inline)) u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
{
 *remainder = ({ uint32_t __base = (divisor); uint32_t __rem; (void)(((typeof((dividend)) *)0) == ((uint64_t *)0)); if (__builtin_expect(!!(((dividend) >> 32) == 0), 1)) { __rem = (uint32_t)(dividend) % __base; (dividend) = (uint32_t)(dividend) / __base; } else __rem = __div64_32(&(dividend), __base); __rem; });
 return dividend;
}



extern s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder);



extern u64 div64_u64(u64 dividend, u64 divisor);
# 66 "include/linux/math64.h"
static inline __attribute__((always_inline)) u64 div_u64(u64 dividend, u32 divisor)
{
 u32 remainder;
 return div_u64_rem(dividend, divisor, &remainder);
}






static inline __attribute__((always_inline)) s64 div_s64(s64 dividend, s32 divisor)
{
 s32 remainder;
 return div_s64_rem(dividend, divisor, &remainder);
}


u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

static inline __attribute__((always_inline)) __attribute__((always_inline)) u32
__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
{
 u32 ret = 0;

 while (dividend >= divisor) {


  asm("" : "+rm"(dividend));

  dividend -= divisor;
  ret++;
 }

 *remainder = dividend;

 return ret;
}
# 5 "include/linux/jiffies.h" 2
# 1 "include/linux/kernel.h" 1
# 10 "include/linux/kernel.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/toolchain/rsdk-1.5.10-5281-EB-2.6.30-0.9.30-m32ub-130429/bin/../lib/gcc/mips-linux-uclibc/4.4.7/include/stdarg.h" 1 3 4
# 40 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/toolchain/rsdk-1.5.10-5281-EB-2.6.30-0.9.30-m32ub-130429/bin/../lib/gcc/mips-linux-uclibc/4.4.7/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 102 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/toolchain/rsdk-1.5.10-5281-EB-2.6.30-0.9.30-m32ub-130429/bin/../lib/gcc/mips-linux-uclibc/4.4.7/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 11 "include/linux/kernel.h" 2
# 1 "include/linux/linkage.h" 1




# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/linkage.h" 1
# 6 "include/linux/linkage.h" 2
# 12 "include/linux/kernel.h" 2



# 1 "include/linux/bitops.h" 1
# 17 "include/linux/bitops.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 1
# 17 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
# 1 "include/linux/irqflags.h" 1
# 14 "include/linux/irqflags.h"
# 1 "include/linux/typecheck.h" 1
# 15 "include/linux/irqflags.h" 2
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/irqflags.h" 1
# 17 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/irqflags.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/hazards.h" 1
# 17 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/hazards.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-features.h" 1
# 12 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-features.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu.h" 1
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-features.h" 2
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-info.h" 1
# 17 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-info.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cache.h" 1
# 12 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cache.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/mach-generic/kmalloc.h" 1
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cache.h" 2
# 18 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-info.h" 2




struct cache_desc {
 unsigned int waysize;
 unsigned short sets;
 unsigned char ways;
 unsigned char linesz;
 unsigned char waybit;
 unsigned char flags;
};
# 41 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-info.h"
struct cpuinfo_mips {
 unsigned int udelay_val;
 unsigned int asid_cache;




 unsigned long options;
 unsigned long ases;
 unsigned int processor_id;
 unsigned int fpu_id;
 unsigned int cputype;
 int isa_level;
 int tlbsize;
 struct cache_desc icache;
 struct cache_desc dcache;
 struct cache_desc scache;
 struct cache_desc tcache;
 int srsets;
 int core;
 void *data;
# 70 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-info.h"
} __attribute__((aligned((1 << 5))));

extern struct cpuinfo_mips cpu_data[];



extern void cpu_probe(void);
extern void cpu_report(void);

extern const char *__cpu_name[];
# 14 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-features.h" 2
# 1 "arch/rlx/bsp/bspcpu.h" 1
# 15 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cpu-features.h" 2
# 18 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/hazards.h" 2
# 29 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/hazards.h"
__asm__(".macro " "_ssnop" "; " "sll $0, $0, 1" "; .endm"); static inline __attribute__((always_inline)) void _ssnop(void) { __asm__ __volatile__ ("_ssnop"); }



__asm__(".macro " "_ehb" "; " "sll $0, $0, 3" "; .endm"); static inline __attribute__((always_inline)) void _ehb(void) { __asm__ __volatile__ ("_ehb"); }
# 46 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/hazards.h"
__asm__(".macro " "mtc0_tlbw_hazard" "; " "nop; nop" "; .endm"); static inline __attribute__((always_inline)) void mtc0_tlbw_hazard(void) { __asm__ __volatile__ ("mtc0_tlbw_hazard"); }


__asm__(".macro " "tlbw_use_hazard" "; " "nop; nop; nop" "; .endm"); static inline __attribute__((always_inline)) void tlbw_use_hazard(void) { __asm__ __volatile__ ("tlbw_use_hazard"); }


__asm__(".macro " "tlb_probe_hazard" "; " "nop; nop; nop" "; .endm"); static inline __attribute__((always_inline)) void tlb_probe_hazard(void) { __asm__ __volatile__ ("tlb_probe_hazard"); }


__asm__(".macro " "irq_enable_hazard" "; " "_ssnop; _ssnop; _ssnop;" "; .endm"); static inline __attribute__((always_inline)) void irq_enable_hazard(void) { __asm__ __volatile__ ("irq_enable_hazard"); }


__asm__(".macro " "irq_disable_hazard" "; " "nop; nop; nop" "; .endm"); static inline __attribute__((always_inline)) void irq_disable_hazard(void) { __asm__ __volatile__ ("irq_disable_hazard"); }


__asm__(".macro " "back_to_back_c0_hazard" "; " "_ssnop; _ssnop; _ssnop;" "; .endm"); static inline __attribute__((always_inline)) void back_to_back_c0_hazard(void) { __asm__ __volatile__ ("back_to_back_c0_hazard"); }
# 18 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/irqflags.h" 2

__asm__(
 "	.macro	raw_local_irq_enable				\n"
 "	.set	push						\n"
 "	.set	reorder						\n"
 "	.set	noat						\n"
 "	mfc0	$1,$12						\n"
 "	ori	$1,0x1f						\n"
 "	xori	$1,0x1e						\n"
 "	mtc0	$1,$12						\n"
 "	irq_enable_hazard					\n"
 "	.set	pop						\n"
 "	.endm");

static inline __attribute__((always_inline)) void raw_local_irq_enable(void)
{
 __asm__ __volatile__(
  "raw_local_irq_enable"
  :
  :
  : "memory");
}
# 59 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/irqflags.h"
__asm__(
 "	.macro	raw_local_irq_disable\n"
 "	.set	push						\n"
 "	.set	noat						\n"
 "	mfc0	$1,$12						\n"
 "	ori	$1,0x1f						\n"
 "	xori	$1,0x1f						\n"
 "	.set	noreorder					\n"
 "	mtc0	$1,$12						\n"
 "	irq_disable_hazard					\n"
 "	.set	pop						\n"
 "	.endm							\n");

static inline __attribute__((always_inline)) void raw_local_irq_disable(void)
{
 __asm__ __volatile__(
  "raw_local_irq_disable"
  :
  :
  : "memory");
}

__asm__(
 "	.macro	raw_local_save_flags flags			\n"
 "	.set	push						\n"
 "	.set	reorder						\n"
 "	mfc0	\\flags, $12					\n"
 "	.set	pop						\n"
 "	.endm							\n");






__asm__(
 "	.macro	raw_local_irq_save result			\n"
 "	.set	push						\n"
 "	.set	reorder						\n"
 "	.set	noat						\n"
 "	mfc0	\\result, $12					\n"
 "	ori	$1, \\result, 0x1f				\n"
 "	xori	$1, 0x1f					\n"
 "	.set	noreorder					\n"
 "	mtc0	$1, $12						\n"
 "	irq_disable_hazard					\n"
 "	.set	pop						\n"
 "	.endm							\n");
# 115 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/irqflags.h"
__asm__(
 "	.macro	raw_local_irq_restore flags			\n"
 "	.set	push						\n"
 "	.set	noreorder					\n"
 "	.set	noat						\n"
 "	mfc0	$1, $12						\n"
 "	andi	\\flags, 1					\n"
 "	ori	$1, 0x1f					\n"
 "	xori	$1, 0x1f					\n"
 "	or	\\flags, $1					\n"
 "	mtc0	\\flags, $12					\n"
 "	irq_disable_hazard					\n"
 "	.set	pop						\n"
 "	.endm							\n");

static inline __attribute__((always_inline)) void raw_local_irq_restore(unsigned long flags)
{
 unsigned long __tmp1;

 __asm__ __volatile__(
  "raw_local_irq_restore\t%0"
  : "=r" (__tmp1)
  : "0" (flags)
  : "memory");
}

static inline __attribute__((always_inline)) void __raw_local_irq_restore(unsigned long flags)
{
 unsigned long __tmp1;

 __asm__ __volatile__(
  "raw_local_irq_restore\t%0"
  : "=r" (__tmp1)
  : "0" (flags)
  : "memory");
}

static inline __attribute__((always_inline)) int raw_irqs_disabled_flags(unsigned long flags)
{
 return !(flags & 1);
}
# 16 "include/linux/irqflags.h" 2
# 18 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2

# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/barrier.h" 1
# 20 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bug.h" 1
# 43 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bug.h"
# 1 "include/asm-generic/bug.h" 1
# 44 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bug.h" 2
# 21 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/byteorder.h" 1
# 12 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/byteorder.h"
# 1 "include/linux/byteorder/big_endian.h" 1
# 12 "include/linux/byteorder/big_endian.h"
# 1 "include/linux/swab.h" 1





# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/swab.h" 1
# 7 "include/linux/swab.h" 2
# 46 "include/linux/swab.h"
static inline __attribute__((always_inline)) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) & (__u16)0xff00U) >> 8)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x000000ffUL) << 24) | (((__u32)(val) & (__u32)0x0000ff00UL) << 8) | (((__u32)(val) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(val) & (__u32)0xff000000UL) >> 24)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u64 __fswab64(__u64 val)
{



 __u32 h = val >> 32;
 __u32 l = val & ((1ULL << 32) - 1);
 return (((__u64)__fswab32(l)) << 32) | ((__u64)(__fswab32(h)));



}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(val) & (__u32)0xff00ff00UL) >> 8)));

}
# 148 "include/linux/swab.h"
static inline __attribute__((always_inline)) __u16 __swab16p(const __u16 *p)
{



 return (__builtin_constant_p((__u16)(*p)) ? ((__u16)( (((__u16)(*p) & (__u16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p));

}





static inline __attribute__((always_inline)) __u32 __swab32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((__u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000UL) >> 24))) : __fswab32(*p));

}





static inline __attribute__((always_inline)) __u64 __swab64p(const __u64 *p)
{



 return (__builtin_constant_p((__u64)(*p)) ? ((__u64)( (((__u64)(*p) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __attribute__((always_inline)) __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : __fswahw32(*p));

}







static inline __attribute__((always_inline)) __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __fswahb32(*p));

}





static inline __attribute__((always_inline)) void __swab16s(__u16 *p)
{



 *p = __swab16p(p);

}




static inline __attribute__((always_inline)) void __swab32s(__u32 *p)
{



 *p = __swab32p(p);

}





static inline __attribute__((always_inline)) void __swab64s(__u64 *p)
{



 *p = __swab64p(p);

}







static inline __attribute__((always_inline)) void __swahw32s(__u32 *p)
{



 *p = __swahw32p(p);

}







static inline __attribute__((always_inline)) void __swahb32s(__u32 *p)
{



 *p = __swahb32p(p);

}
# 13 "include/linux/byteorder/big_endian.h" 2
# 43 "include/linux/byteorder/big_endian.h"
static inline __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)__swab64p(p);
}
static inline __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)__swab32p(p);
}
static inline __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)__swab16p(p);
}
static inline __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
 return __swab16p((__u16 *)p);
}
static inline __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)*p;
}
static inline __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)*p;
}
static inline __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)*p;
}
static inline __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
 return ( __u16)*p;
}
# 105 "include/linux/byteorder/big_endian.h"
# 1 "include/linux/byteorder/generic.h" 1
# 143 "include/linux/byteorder/generic.h"
static inline __attribute__((always_inline)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val))) ? ((__u16)( (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__builtin_constant_p((__u16)(( __u16)(__le16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__le16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__le16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__le16)(*var))) + val))));
}

static inline __attribute__((always_inline)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val))) ? ((__u32)( (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__builtin_constant_p((__u32)(( __u32)(__le32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__le32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__le32)(*var))) + val))));
}

static inline __attribute__((always_inline)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val))) ? ((__u64)( (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__builtin_constant_p((__u64)(( __u64)(__le64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__le64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__le64)(*var))) + val))));
}

static inline __attribute__((always_inline)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__u16)((( __u16)(__be16)(*var)) + val));
}

static inline __attribute__((always_inline)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__u32)((( __u32)(__be32)(*var)) + val));
}

static inline __attribute__((always_inline)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__u64)((( __u64)(__be64)(*var)) + val));
}
# 106 "include/linux/byteorder/big_endian.h" 2
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/byteorder.h" 2
# 22 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 44 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) void set_bit(unsigned long nr, volatile unsigned long *addr)
{

 unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
 unsigned short bit = nr & 31UL;
 unsigned long temp;

  __asm__ __volatile__(
  "1:	ll      %0, %1			# set_bit	\n"

  "	nop						\n"

  "	or	    %0, %2					\n"
  "	sc	    %0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (1UL << bit), "m" (*m));
# 76 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
}
# 88 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) void clear_bit(unsigned long nr, volatile unsigned long *addr)
{

 unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
 unsigned short bit = nr & 31UL;
 unsigned long temp;

  __asm__ __volatile__(
  "1:	ll      %0, %1			# clear_bit	\n"

  "	nop						\n"

  "	and	%0, %2					\n"
  "	sc      %0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (~(1UL << bit)), "m" (*m));
# 120 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
}
# 130 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) void clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
{
 __asm__ __volatile__("   \n" : : : "memory");
 clear_bit(nr, addr);
}
# 145 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) void change_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned short bit = nr & 31UL;


  unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
  unsigned long temp;

  __asm__ __volatile__(
  "1:	ll      %0, %1		# change_bit	\n"

  "	nop						\n"

  "	xor	    %0, %2				\n"
  "	sc      %0, %1				\n"
  "	beqz	%0, 2f				\n"
  "	.subsection 2				\n"
  "2:	b	1b				\n"
  "	.previous				\n"
  : "=&r" (temp), "=m" (*m)
  : "ir" (1UL << bit), "m" (*m));
# 177 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
}
# 187 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_set_bit(unsigned long nr,
 volatile unsigned long *addr)
{

 unsigned short bit = nr & 31UL;
 unsigned long res;
    unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
    unsigned long temp;

 __asm__ __volatile__("   \n" : : : "memory");

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  ".align 2\n 1:	ll      %0, %1		# test_and_set_bit	\n"


  "	nop						\n"

  "	or   	%2, %0, %3				\n"
  "	sc      %2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  ".align 2\n 2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 235 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
 return res != 0;
}
# 246 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_set_bit_lock(unsigned long nr,
 volatile unsigned long *addr)
{

 unsigned short bit = nr & 31UL;
 unsigned long res;
 unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
 unsigned long temp;

 __asm__ __volatile__("   \n" : : : "memory");

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "1:	ll      %0, %1		# test_and_set_bit	\n"


  "	nop						\n"

  "	or	    %2, %0, %3				\n"
  "	sc      %2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 294 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
 return res != 0;
}
# 304 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_clear_bit(unsigned long nr,
 volatile unsigned long *addr)
{

 unsigned short bit = nr & 31UL;
 unsigned long res;
    unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
    unsigned long temp;

 __asm__ __volatile__("   \n" : : : "memory");

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "1:	ll      %0, %1		# test_and_clear_bit	\n"


  "	nop						\n"

  "	or	    %2, %0, %3				\n"
  "	xor	    %2, %3					\n"
  "	sc      %2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 353 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
 return res != 0;
}
# 364 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) int test_and_change_bit(unsigned long nr,
 volatile unsigned long *addr)
{

 unsigned short bit = nr & 31UL;
 unsigned long res;
 unsigned long *m = ((unsigned long *) addr) + (nr >> 5);
 unsigned long temp;

 __asm__ __volatile__("   \n" : : : "memory");

  __asm__ __volatile__(
  "	.set	push					\n"
  "	.set	noreorder				\n"
  "1:	ll      %0, %1		# test_and_change_bit	\n"


  "	nop						\n"

  "	xor	    %2, %0, %3				\n"
  "	sc      %2, %1				\n"
  "	beqz	%2, 2f					\n"
  "	 and	%2, %0, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	 nop						\n"
  "	.previous					\n"
  "	.set	pop					\n"
  : "=&r" (temp), "=m" (*m), "=&r" (res)
  : "r" (1UL << bit), "m" (*m)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 413 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
 return res != 0;
}

# 1 "include/asm-generic/bitops/non-atomic.h" 1
# 15 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) void __set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p |= mask;
}

static inline __attribute__((always_inline)) void __clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p &= ~mask;
}
# 40 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) void __change_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p ^= mask;
}
# 57 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) int __test_and_set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 76 "include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) int __test_and_clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old & ~mask;
 return (old & mask) != 0;
}


static inline __attribute__((always_inline)) int __test_and_change_bit(int nr,
         volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old ^ mask;
 return (old & mask) != 0;
}






static inline __attribute__((always_inline)) int test_bit(int nr, const volatile unsigned long *addr)
{
 return 1UL & (addr[((nr) / 32)] >> (nr & (32 -1)));
}
# 417 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 427 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
{
 __asm__ __volatile__("   \n" : : : "memory");
 __clear_bit(nr, addr);
}





static inline __attribute__((always_inline)) unsigned long __fls(unsigned long word)
{
 int num;
# 456 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
 num = 32 - 1;

 if (!(word & (~0ul << (32 -16)))) {
  num -= 16;
  word <<= 16;
 }
 if (!(word & (~0ul << (32 -8)))) {
  num -= 8;
  word <<= 8;
 }
 if (!(word & (~0ul << (32 -4)))) {
  num -= 4;
  word <<= 4;
 }
 if (!(word & (~0ul << (32 -2)))) {
  num -= 2;
  word <<= 2;
 }
 if (!(word & (~0ul << (32 -1))))
  num -= 1;
 return num;
}
# 486 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
 return __fls(word & -word);
}
# 498 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) int fls(int x)
{
 int r;
# 510 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
 r = 32;
 if (!x)
  return 0;
 if (!(x & 0xffff0000u)) {
  x <<= 16;
  r -= 16;
 }
 if (!(x & 0xff000000u)) {
  x <<= 8;
  r -= 8;
 }
 if (!(x & 0xf0000000u)) {
  x <<= 4;
  r -= 4;
 }
 if (!(x & 0xc0000000u)) {
  x <<= 2;
  r -= 2;
 }
 if (!(x & 0x80000000u)) {
  x <<= 1;
  r -= 1;
 }
 return r;
}

# 1 "include/asm-generic/bitops/fls64.h" 1
# 18 "include/asm-generic/bitops/fls64.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) int fls64(__u64 x)
{
 __u32 h = x >> 32;
 if (h)
  return fls(h) + 32;
 return fls(x);
}
# 537 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 546 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h"
static inline __attribute__((always_inline)) int ffs(int word)
{
 if (!word)
  return 0;

 return fls(word & -word);
}

# 1 "include/asm-generic/bitops/ffz.h" 1
# 555 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/find.h" 1
# 556 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2



# 1 "include/asm-generic/bitops/sched.h" 1
# 12 "include/asm-generic/bitops/sched.h"
static inline __attribute__((always_inline)) int sched_find_first_bit(const unsigned long *b)
{
 if (b[0])
  return __ffs(b[0]);
 if (b[1])
  return __ffs(b[1]) + 32;
 if (b[2])
  return __ffs(b[2]) + 64;
 return __ffs(b[3]) + 96;
}
# 560 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/hweight.h" 1





extern unsigned int hweight32(unsigned int w);
extern unsigned int hweight16(unsigned int w);
extern unsigned int hweight8(unsigned int w);
extern unsigned long hweight64(__u64 w);
# 561 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/ext2-non-atomic.h" 1



# 1 "include/asm-generic/bitops/le.h" 1
# 45 "include/asm-generic/bitops/le.h"
extern unsigned long generic_find_next_zero_le_bit(const unsigned long *addr,
  unsigned long size, unsigned long offset);
extern unsigned long generic_find_next_le_bit(const unsigned long *addr,
  unsigned long size, unsigned long offset);
# 5 "include/asm-generic/bitops/ext2-non-atomic.h" 2
# 562 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/ext2-atomic.h" 1
# 563 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 1 "include/asm-generic/bitops/minix.h" 1
# 564 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/bitops.h" 2
# 18 "include/linux/bitops.h" 2







static __inline__ __attribute__((always_inline)) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static __inline__ __attribute__((always_inline)) int get_count_order(unsigned int count)
{
 int order;

 order = fls(count) - 1;
 if (count & (count - 1))
  order++;
 return order;
}

static inline __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? hweight32(w) : hweight64(w);
}






static inline __attribute__((always_inline)) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << shift) | (word >> (32 - shift));
}






static inline __attribute__((always_inline)) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> shift) | (word << (32 - shift));
}






static inline __attribute__((always_inline)) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << shift) | (word >> (16 - shift));
}






static inline __attribute__((always_inline)) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> shift) | (word << (16 - shift));
}






static inline __attribute__((always_inline)) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << shift) | (word >> (8 - shift));
}






static inline __attribute__((always_inline)) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> shift) | (word << (8 - shift));
}

static inline __attribute__((always_inline)) unsigned fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}
# 123 "include/linux/bitops.h"
static inline __attribute__((always_inline)) unsigned long __ffs64(u64 word)
{

 if (((u32)word) == 0UL)
  return __ffs((u32)(word >> 32)) + 32;



 return __ffs((unsigned long)word);
}
# 166 "include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 178 "include/linux/bitops.h"
extern unsigned long find_next_bit(const unsigned long *addr,
       unsigned long size, unsigned long offset);
# 188 "include/linux/bitops.h"
extern unsigned long find_next_zero_bit(const unsigned long *addr,
     unsigned long size,
     unsigned long offset);
# 16 "include/linux/kernel.h" 2
# 1 "include/linux/log2.h" 1
# 21 "include/linux/log2.h"
extern __attribute__((const, noreturn))
int ____ilog2_NaN(void);
# 31 "include/linux/log2.h"
static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((always_inline)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}







static inline __attribute__((always_inline)) __attribute__((const))
bool is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}




static inline __attribute__((always_inline)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}




static inline __attribute__((always_inline)) __attribute__((const))
unsigned long __rounddown_pow_of_two(unsigned long n)
{
 return 1UL << (fls_long(n) - 1);
}
# 17 "include/linux/kernel.h" 2

# 1 "include/linux/ratelimit.h" 1


# 1 "include/linux/param.h" 1



# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/param.h" 1
# 5 "include/linux/param.h" 2
# 4 "include/linux/ratelimit.h" 2




struct ratelimit_state {
 int interval;
 int burst;
 int printed;
 int missed;
 unsigned long begin;
};




extern int __ratelimit(struct ratelimit_state *rs);
# 19 "include/linux/kernel.h" 2
# 1 "include/linux/dynamic_debug.h" 1







extern long long dynamic_debug_enabled;
extern long long dynamic_debug_enabled2;






struct _ddebug {




 const char *modname;
 const char *function;
 const char *filename;
 const char *format;
 char primary_hash;
 char secondary_hash;
 unsigned int lineno:24;







 unsigned int flags:8;
} __attribute__((aligned(8)));


int ddebug_add_module(struct _ddebug *tab, unsigned int n,
    const char *modname);
# 79 "include/linux/dynamic_debug.h"
static inline __attribute__((always_inline)) int ddebug_remove_module(char *mod)
{
 return 0;
}
# 20 "include/linux/kernel.h" 2



extern const char linux_banner[];
extern const char linux_proc_banner[];
# 107 "include/linux/kernel.h"
extern int console_printk[];






struct completion;
struct pt_regs;
struct user;
# 153 "include/linux/kernel.h"
static inline __attribute__((always_inline)) void might_fault(void)
{
 do { do { } while (0); } while (0);
}


extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(long time);
 void panic(const char * fmt, ...)
 __attribute__ ((noreturn, format (printf, 1, 2))) __attribute__((__cold__));
extern void oops_enter(void);
extern void oops_exit(void);
extern int oops_may_print(void);
 void do_exit(long error_code)
 __attribute__((noreturn));
 void complete_and_exit(struct completion *, long)
 __attribute__((noreturn));
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);
extern int strict_strtoul(const char *, unsigned int, unsigned long *);
extern int strict_strtol(const char *, unsigned int, long *);
extern int strict_strtoull(const char *, unsigned int, unsigned long long *);
extern int strict_strtoll(const char *, unsigned int, long long *);
extern int sprintf(char * buf, const char * fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern int vsprintf(char *buf, const char *, va_list)
 __attribute__ ((format (printf, 2, 0)));
extern int snprintf(char * buf, size_t size, const char * fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 __attribute__ ((format (printf, 3, 0)));
extern int scnprintf(char * buf, size_t size, const char * fmt, ...)
 __attribute__ ((format (printf, 3, 4)));
extern int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
 __attribute__ ((format (printf, 3, 0)));
extern char *kasprintf(gfp_t gfp, const char *fmt, ...)
 __attribute__ ((format (printf, 2, 3)));
extern char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);

extern int sscanf(const char *, const char *, ...)
 __attribute__ ((format (scanf, 2, 3)));
extern int vsscanf(const char *, const char *, va_list)
 __attribute__ ((format (scanf, 2, 0)));

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(const char *ptr, char **retptr);

extern int core_kernel_text(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int func_ptr_is_kernel_text(void *ptr);

struct pid;
extern struct pid *session_of_pgrp(struct pid *pgrp);
# 236 "include/linux/kernel.h"
 int scrlog_printk(const char *fmt, ...);


 int vprintk(const char *fmt, va_list args)
 __attribute__ ((format (printf, 1, 0)));



 int printk(const char * fmt, ...)
 __attribute__ ((format (printf, 1, 2))) __attribute__((__cold__));
 int panic_printk(const char * fmt, ...)
 __attribute__ ((format (printf, 1, 2))) __attribute__((__cold__));

extern struct ratelimit_state printk_ratelimit_state;
extern int printk_ratelimit(void);
extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);
# 266 "include/linux/kernel.h"
void log_buf_kexec_setup(void);
# 291 "include/linux/kernel.h"
extern int printk_needs_cpu(int cpu);
extern void printk_tick(void);

extern void __attribute__((format(printf, 1, 2)))
 early_printk(const char *fmt, ...);

unsigned long int_sqrt(unsigned long);

static inline __attribute__((always_inline)) void console_silent(void)
{
 (console_printk[0]) = 0;
}

static inline __attribute__((always_inline)) void console_verbose(void)
{
 if ((console_printk[0]))
  (console_printk[0]) = 15;
}

extern void bust_spinlocks(int yes);
extern void wake_up_klogd(void);
extern int oops_in_progress;
extern int panic_timeout;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern const char *print_tainted(void);
extern void add_taint(unsigned flag);
extern int test_taint(unsigned flag);
extern unsigned long get_taint(void);
extern int root_mountflags;


extern enum system_states {
 SYSTEM_BOOTING,
 SYSTEM_RUNNING,
 SYSTEM_HALT,
 SYSTEM_POWER_OFF,
 SYSTEM_RESTART,
 SYSTEM_SUSPEND_DISK,
} system_state;
# 344 "include/linux/kernel.h"
extern void dump_stack(void) __attribute__((__cold__));

enum {
 DUMP_PREFIX_NONE,
 DUMP_PREFIX_ADDRESS,
 DUMP_PREFIX_OFFSET
};
extern void hex_dump_to_buffer(const void *buf, size_t len,
    int rowsize, int groupsize,
    char *linebuf, size_t linebuflen, bool ascii);
extern void print_hex_dump(const char *level, const char *prefix_str,
    int prefix_type, int rowsize, int groupsize,
    const void *buf, size_t len, bool ascii);
extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
   const void *buf, size_t len);

extern const char hex_asc[];



static inline __attribute__((always_inline)) char *pack_hex_byte(char *buf, u8 byte)
{
 *buf++ = hex_asc[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc[((byte) & 0x0f)];
 return buf;
}
# 441 "include/linux/kernel.h"
static inline __attribute__((always_inline)) void tracing_on(void) { }
static inline __attribute__((always_inline)) void tracing_off(void) { }
static inline __attribute__((always_inline)) void tracing_off_permanent(void) { }
static inline __attribute__((always_inline)) int tracing_is_on(void) { return 0; }
# 527 "include/linux/kernel.h"
static inline __attribute__((always_inline)) void
ftrace_special(unsigned long arg1, unsigned long arg2, unsigned long arg3) { }
static inline __attribute__((always_inline)) int
trace_printk(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));

static inline __attribute__((always_inline)) void tracing_start(void) { }
static inline __attribute__((always_inline)) void tracing_stop(void) { }
static inline __attribute__((always_inline)) void ftrace_off_permanent(void) { }
static inline __attribute__((always_inline)) int
trace_printk(const char *fmt, ...)
{
 return 0;
}
static inline __attribute__((always_inline)) int
ftrace_vprintk(const char *fmt, va_list ap)
{
 return 0;
}
static inline __attribute__((always_inline)) void ftrace_dump(void) { }
# 663 "include/linux/kernel.h"
struct sysinfo;
extern int do_sysinfo(struct sysinfo *info);




struct sysinfo {
 long uptime;
 unsigned long loads[3];
 unsigned long totalram;
 unsigned long freeram;
 unsigned long sharedram;
 unsigned long bufferram;
 unsigned long totalswap;
 unsigned long freeswap;
 unsigned short procs;
 unsigned short pad;
 unsigned long totalhigh;
 unsigned long freehigh;
 unsigned int mem_unit;
 char _f[20-2*sizeof(long)-sizeof(int)];
};
# 6 "include/linux/jiffies.h" 2

# 1 "include/linux/time.h" 1






# 1 "include/linux/cache.h" 1
# 8 "include/linux/time.h" 2
# 1 "include/linux/seqlock.h" 1
# 29 "include/linux/seqlock.h"
# 1 "include/linux/spinlock.h" 1
# 50 "include/linux/spinlock.h"
# 1 "include/linux/preempt.h" 1
# 9 "include/linux/preempt.h"
# 1 "include/linux/thread_info.h" 1
# 12 "include/linux/thread_info.h"
struct timespec;
struct compat_timespec;




struct restart_block {
 long (*fn)(struct restart_block *);
 union {
  struct {
   unsigned long arg0, arg1, arg2, arg3;
  };

  struct {
   u32 *uaddr;
   u32 val;
   u32 flags;
   u32 bitset;
   u64 time;
  } futex;

  struct {
   clockid_t index;
   struct timespec *rmtp;



   u64 expires;
  } nanosleep;

  struct {
   struct pollfd *ufds;
   int nfds;
   int has_timeout;
   unsigned long tv_sec;
   unsigned long tv_nsec;
  } poll;
 };
};

extern long do_no_restart_syscall(struct restart_block *parm);


# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/thread_info.h" 1
# 15 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/thread_info.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h" 1
# 14 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h"
# 1 "include/linux/cpumask.h" 1
# 141 "include/linux/cpumask.h"
# 1 "include/linux/threads.h" 1
# 142 "include/linux/cpumask.h" 2
# 1 "include/linux/bitmap.h" 1







# 1 "include/linux/string.h" 1
# 15 "include/linux/string.h"
extern char *strndup_user(const char *, long);
extern void *memdup_user(const void *, size_t);
extern char * strtok(char *,const char *);




# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/string.h" 1
# 21 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/string.h"
static __inline__ __attribute__((always_inline)) char *strcpy(char *__dest, __const__ char *__src)
{
  char *__xdest = __dest;

  __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n"
 "1:\tlbu\t$1,(%1)\n\t"
 "addiu\t%1,1\n\t"
 "sb\t$1,(%0)\n\t"
 "bnez\t$1,1b\n\t"
 "addiu\t%0,1\n\t"
 ".set\tat\n\t"
 ".set\treorder"
 : "=r" (__dest), "=r" (__src)
        : "0" (__dest), "1" (__src)
 : "memory");

  return __xdest;
}


static __inline__ __attribute__((always_inline)) char *strncpy(char *__dest, __const__ char *__src, size_t __n)
{
  char *__xdest = __dest;

  if (__n == 0)
    return __xdest;

  __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n"
 "1:\tlbu\t$1,(%1)\n\t"
 "subu\t%2,1\n\t"
 "sb\t$1,(%0)\n\t"
 "beqz\t$1,2f\n\t"
 "addiu\t%0,1\n\t"
 "bnez\t%2,1b\n\t"
 "addiu\t%1,1\n"
 "2:\n\t"
 ".set\tat\n\t"
 ".set\treorder"
        : "=r" (__dest), "=r" (__src), "=r" (__n)
        : "0" (__dest), "1" (__src), "2" (__n)
        : "memory");

  return __xdest;
}


static __inline__ __attribute__((always_inline)) int strcmp(__const__ char *__cs, __const__ char *__ct)
{
  int __res;

  __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n\t"
 "lbu\t%2,(%0)\n"
 "1:\tlbu\t$1,(%1)\n\t"
 "addiu\t%0,1\n\t"
 "bne\t$1,%2,2f\n\t"
 "addiu\t%1,1\n\t"
 "bnez\t%2,1b\n\t"
 "lbu\t%2,(%0)\n\t"



 "move\t%2,$1\n"
 "2:\tsubu\t%2,$1\n"
 "3:\t.set\tat\n\t"
 ".set\treorder"
 : "=r" (__cs), "=r" (__ct), "=r" (__res)
 : "0" (__cs), "1" (__ct), "m" (*__cs), "m" (*__ct));

  return __res;
}




static __inline__ __attribute__((always_inline)) int
strncmp(__const__ char *__cs, __const__ char *__ct, size_t __count)
{
 int __res;

 __asm__ __volatile__(
 ".set\tnoreorder\n\t"
 ".set\tnoat\n"
 "1:\tlbu\t%3,(%0)\n\t"
 "beqz\t%2,2f\n\t"
 "lbu\t$1,(%1)\n\t"
 "subu\t%2,1\n\t"
 "bne\t$1,%3,3f\n\t"
 "addiu\t%0,1\n\t"
 "bnez\t%3,1b\n\t"
 "addiu\t%1,1\n"
 "2:\n\t"



 "move\t%3,$1\n"
 "3:\tsubu\t%3,$1\n\t"
 ".set\tat\n\t"
 ".set\treorder"
 : "=r" (__cs), "=r" (__ct), "=r" (__count), "=r" (__res)
 : "0" (__cs), "1" (__ct), "2" (__count), "m" (*__cs), "m" (*__ct));

 return __res;
}


extern void *memset(void *__s, int __c, size_t __count);


extern void *memcpy(void *__to, __const__ void *__from, size_t __n);


extern void *memmove(void *__dest, __const__ void *__src, size_t __n);
# 23 "include/linux/string.h" 2
# 31 "include/linux/string.h"
size_t strlcpy(char *, const char *, size_t);


extern char * strcat(char *, const char *);


extern char * strncat(char *, const char *, __kernel_size_t);


extern size_t strlcat(char *, const char *, __kernel_size_t);
# 49 "include/linux/string.h"
extern int strnicmp(const char *, const char *, __kernel_size_t);


extern int strcasecmp(const char *s1, const char *s2);


extern int strncasecmp(const char *s1, const char *s2, size_t n);


extern char * strchr(const char *,int);


extern char * strnchr(const char *, size_t, int);


extern char * strrchr(const char *,int);

extern char * strstrip(char *);

extern char * strstr(const char *,const char *);


extern __kernel_size_t strlen(const char *);


extern __kernel_size_t strnlen(const char *,__kernel_size_t);


extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);
# 99 "include/linux/string.h"
extern void * memscan(void *,int,__kernel_size_t);


extern int memcmp(const void *,const void *,__kernel_size_t);


extern void * memchr(const void *,int,__kernel_size_t);


extern char *kstrdup(const char *s, gfp_t gfp);
extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
extern void *kmemdup(const void *src, size_t len, gfp_t gfp);

extern char **argv_split(gfp_t gfp, const char *str, int *argcp);
extern void argv_free(char **argv);

extern bool sysfs_streq(const char *s1, const char *s2);







extern ssize_t memory_read_from_buffer(void *to, size_t count, loff_t *ppos,
   const void *from, size_t available);






static inline __attribute__((always_inline)) bool strstarts(const char *str, const char *prefix)
{
 return strncmp(str, prefix, strlen(prefix)) == 0;
}
# 9 "include/linux/bitmap.h" 2
# 87 "include/linux/bitmap.h"
extern int __bitmap_empty(const unsigned long *bitmap, int bits);
extern int __bitmap_full(const unsigned long *bitmap, int bits);
extern int __bitmap_equal(const unsigned long *bitmap1,
                 const unsigned long *bitmap2, int bits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
   int bits);
extern void __bitmap_shift_right(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern void __bitmap_shift_left(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_intersects(const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_subset(const unsigned long *bitmap1,
   const unsigned long *bitmap2, int bits);
extern int __bitmap_weight(const unsigned long *bitmap, int bits);

extern int bitmap_scnprintf(char *buf, unsigned int len,
   const unsigned long *src, int nbits);
extern int __bitmap_parse(const char *buf, unsigned int buflen, int is_user,
   unsigned long *dst, int nbits);
extern int bitmap_parse_user(const char *ubuf, unsigned int ulen,
   unsigned long *dst, int nbits);
extern int bitmap_scnlistprintf(char *buf, unsigned int len,
   const unsigned long *src, int nbits);
extern int bitmap_parselist(const char *buf, unsigned long *maskp,
   int nmaskbits);
extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
  const unsigned long *old, const unsigned long *new, int bits);
extern int bitmap_bitremap(int oldbit,
  const unsigned long *old, const unsigned long *new, int bits);
extern void bitmap_onto(unsigned long *dst, const unsigned long *orig,
  const unsigned long *relmap, int bits);
extern void bitmap_fold(unsigned long *dst, const unsigned long *orig,
  int sz, int bits);
extern int bitmap_find_free_region(unsigned long *bitmap, int bits, int order);
extern void bitmap_release_region(unsigned long *bitmap, int pos, int order);
extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
extern void bitmap_copy_le(void *dst, const unsigned long *src, int nbits);
# 143 "include/linux/bitmap.h"
static inline __attribute__((always_inline)) void bitmap_zero(unsigned long *dst, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = 0UL;
 else {
  int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memset(dst, 0, len);
 }
}

static inline __attribute__((always_inline)) void bitmap_fill(unsigned long *dst, int nbits)
{
 size_t nlongs = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)));
 if (!(__builtin_constant_p(nbits) && (nbits) <= 32)) {
  int len = (nlongs - 1) * sizeof(unsigned long);
  memset(dst, 0xff, len);
 }
 dst[nlongs - 1] = ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
}

static inline __attribute__((always_inline)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
   int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src;
 else {
  int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memcpy(dst, src, len);
 }
}

static inline __attribute__((always_inline)) int bitmap_and(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return (*dst = *src1 & *src2) != 0;
 return __bitmap_and(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src1 | *src2;
 else
  __bitmap_or(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src1 ^ *src2;
 else
  __bitmap_xor(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_andnot(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return (*dst = *src1 & ~(*src2)) != 0;
 return __bitmap_andnot(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
   int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = ~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
 else
  __bitmap_complement(dst, src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_equal(const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! ((*src1 ^ *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_equal(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_intersects(const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ((*src1 & *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL )) != 0;
 else
  return __bitmap_intersects(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_subset(const unsigned long *src1,
   const unsigned long *src2, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! ((*src1 & ~(*src2)) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_subset(src1, src2, nbits);
}

static inline __attribute__((always_inline)) int bitmap_empty(const unsigned long *src, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! (*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_empty(src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_full(const unsigned long *src, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return ! (~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 else
  return __bitmap_full(src, nbits);
}

static inline __attribute__((always_inline)) int bitmap_weight(const unsigned long *src, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  return hweight_long(*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
 return __bitmap_weight(src, nbits);
}

static inline __attribute__((always_inline)) void bitmap_shift_right(unsigned long *dst,
   const unsigned long *src, int n, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = *src >> n;
 else
  __bitmap_shift_right(dst, src, n, nbits);
}

static inline __attribute__((always_inline)) void bitmap_shift_left(unsigned long *dst,
   const unsigned long *src, int n, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = (*src << n) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
 else
  __bitmap_shift_left(dst, src, n, nbits);
}

static inline __attribute__((always_inline)) int bitmap_parse(const char *buf, unsigned int buflen,
   unsigned long *maskp, int nmaskbits)
{
 return __bitmap_parse(buf, buflen, 0, maskp, nmaskbits);
}
# 143 "include/linux/cpumask.h" 2

typedef struct cpumask { unsigned long bits[(((1) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } cpumask_t;
extern cpumask_t _unused_cpumask_arg_;



static inline __attribute__((always_inline)) void __cpu_set(int cpu, volatile cpumask_t *dstp)
{
 set_bit(cpu, dstp->bits);
}


static inline __attribute__((always_inline)) void __cpu_clear(int cpu, volatile cpumask_t *dstp)
{
 clear_bit(cpu, dstp->bits);
}


static inline __attribute__((always_inline)) void __cpus_setall(cpumask_t *dstp, int nbits)
{
 bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_clear(cpumask_t *dstp, int nbits)
{
 bitmap_zero(dstp->bits, nbits);
}





static inline __attribute__((always_inline)) int __cpu_test_and_set(int cpu, cpumask_t *addr)
{
 return test_and_set_bit(cpu, addr->bits);
}


static inline __attribute__((always_inline)) int __cpus_and(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_or(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_xor(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __cpus_andnot(cpumask_t *dstp, const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) void __cpus_complement(cpumask_t *dstp,
     const cpumask_t *srcp, int nbits)
{
 bitmap_complement(dstp->bits, srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_equal(const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_equal(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_intersects(const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_subset(const cpumask_t *src1p,
     const cpumask_t *src2p, int nbits)
{
 return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_empty(const cpumask_t *srcp, int nbits)
{
 return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_full(const cpumask_t *srcp, int nbits)
{
 return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __cpus_weight(const cpumask_t *srcp, int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_shift_right(cpumask_t *dstp,
     const cpumask_t *srcp, int n, int nbits)
{
 bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((always_inline)) void __cpus_shift_left(cpumask_t *dstp,
     const cpumask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}
# 287 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int __check_is_bitmap(const unsigned long *bitmap)
{
 return 1;
}
# 299 "include/linux/cpumask.h"
extern const unsigned long
 cpu_bit_bitmap[32 +1][(((1) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];

static inline __attribute__((always_inline)) const struct cpumask *get_cpu_mask(unsigned int cpu)
{
 const unsigned long *p = cpu_bit_bitmap[1 + cpu % 32];
 p -= cpu / 32;
 return ((struct cpumask *)(1 ? (p) : (void *)sizeof(__check_is_bitmap(p))));
}
# 366 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int __cpu_remap(int oldbit,
  const cpumask_t *oldp, const cpumask_t *newp, int nbits)
{
 return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_remap(cpumask_t *dstp, const cpumask_t *srcp,
  const cpumask_t *oldp, const cpumask_t *newp, int nbits)
{
 bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_onto(cpumask_t *dstp, const cpumask_t *origp,
  const cpumask_t *relmapp, int nbits)
{
 bitmap_onto(dstp->bits, origp->bits, relmapp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_fold(cpumask_t *dstp, const cpumask_t *origp,
  int sz, int nbits)
{
 bitmap_fold(dstp->bits, origp->bits, sz, nbits);
}
# 485 "include/linux/cpumask.h"
extern const struct cpumask *const cpu_possible_mask;
extern const struct cpumask *const cpu_online_mask;
extern const struct cpumask *const cpu_present_mask;
extern const struct cpumask *const cpu_active_mask;
# 544 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_check(unsigned int cpu)
{



 return cpu;
}



static inline __attribute__((always_inline)) unsigned int cpumask_first(const struct cpumask *srcp)
{
 return 0;
}


static inline __attribute__((always_inline)) unsigned int cpumask_next(int n, const struct cpumask *srcp)
{
 return n+1;
}

static inline __attribute__((always_inline)) unsigned int cpumask_next_zero(int n, const struct cpumask *srcp)
{
 return n+1;
}

static inline __attribute__((always_inline)) unsigned int cpumask_next_and(int n,
         const struct cpumask *srcp,
         const struct cpumask *andp)
{
 return n+1;
}


static inline __attribute__((always_inline)) unsigned int cpumask_any_but(const struct cpumask *mask,
        unsigned int cpu)
{
 return 1;
}
# 680 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 set_bit(cpumask_check(cpu), ((dstp)->bits));
}






static inline __attribute__((always_inline)) void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 clear_bit(cpumask_check(cpu), ((dstp)->bits));
}
# 712 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_test_and_set_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_set_bit(cpumask_check(cpu), ((cpumask)->bits));
}





static inline __attribute__((always_inline)) void cpumask_setall(struct cpumask *dstp)
{
 bitmap_fill(((dstp)->bits), 1);
}





static inline __attribute__((always_inline)) void cpumask_clear(struct cpumask *dstp)
{
 bitmap_zero(((dstp)->bits), 1);
}







static inline __attribute__((always_inline)) int cpumask_and(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 return bitmap_and(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 1);
}







static inline __attribute__((always_inline)) void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 bitmap_or(((dstp)->bits), ((src1p)->bits),
          ((src2p)->bits), 1);
}







static inline __attribute__((always_inline)) void cpumask_xor(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 bitmap_xor(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 1);
}







static inline __attribute__((always_inline)) int cpumask_andnot(struct cpumask *dstp,
      const struct cpumask *src1p,
      const struct cpumask *src2p)
{
 return bitmap_andnot(((dstp)->bits), ((src1p)->bits),
       ((src2p)->bits), 1);
}






static inline __attribute__((always_inline)) void cpumask_complement(struct cpumask *dstp,
          const struct cpumask *srcp)
{
 bitmap_complement(((dstp)->bits), ((srcp)->bits),
           1);
}






static inline __attribute__((always_inline)) bool cpumask_equal(const struct cpumask *src1p,
    const struct cpumask *src2p)
{
 return bitmap_equal(((src1p)->bits), ((src2p)->bits),
       1);
}






static inline __attribute__((always_inline)) bool cpumask_intersects(const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 return bitmap_intersects(((src1p)->bits), ((src2p)->bits),
            1);
}






static inline __attribute__((always_inline)) int cpumask_subset(const struct cpumask *src1p,
     const struct cpumask *src2p)
{
 return bitmap_subset(((src1p)->bits), ((src2p)->bits),
        1);
}





static inline __attribute__((always_inline)) bool cpumask_empty(const struct cpumask *srcp)
{
 return bitmap_empty(((srcp)->bits), 1);
}





static inline __attribute__((always_inline)) bool cpumask_full(const struct cpumask *srcp)
{
 return bitmap_full(((srcp)->bits), 1);
}





static inline __attribute__((always_inline)) unsigned int cpumask_weight(const struct cpumask *srcp)
{
 return bitmap_weight(((srcp)->bits), 1);
}







static inline __attribute__((always_inline)) void cpumask_shift_right(struct cpumask *dstp,
           const struct cpumask *srcp, int n)
{
 bitmap_shift_right(((dstp)->bits), ((srcp)->bits), n,
            1);
}







static inline __attribute__((always_inline)) void cpumask_shift_left(struct cpumask *dstp,
          const struct cpumask *srcp, int n)
{
 bitmap_shift_left(((dstp)->bits), ((srcp)->bits), n,
           1);
}






static inline __attribute__((always_inline)) void cpumask_copy(struct cpumask *dstp,
    const struct cpumask *srcp)
{
 bitmap_copy(((dstp)->bits), ((srcp)->bits), 1);
}
# 943 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_scnprintf(char *buf, int len,
        const struct cpumask *srcp)
{
 return bitmap_scnprintf(buf, len, ((srcp)->bits), 1);
}
# 957 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_parse_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parse_user(buf, len, ((dstp)->bits), 1);
}
# 972 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpulist_scnprintf(char *buf, int len,
        const struct cpumask *srcp)
{
 return bitmap_scnlistprintf(buf, len, ((srcp)->bits),
        1);
}
# 987 "include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpulist_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parselist(buf, ((dstp)->bits), 1);
}






static inline __attribute__((always_inline)) size_t cpumask_size(void)
{


 return (((1) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(long);
}
# 1032 "include/linux/cpumask.h"
typedef struct cpumask cpumask_var_t[1];

static inline __attribute__((always_inline)) bool alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 return true;
}

static inline __attribute__((always_inline)) bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 return true;
}

static inline __attribute__((always_inline)) bool zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((always_inline)) bool zalloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((always_inline)) void alloc_bootmem_cpumask_var(cpumask_var_t *mask)
{
}

static inline __attribute__((always_inline)) void free_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((always_inline)) void free_bootmem_cpumask_var(cpumask_var_t mask)
{
}




extern const unsigned long cpu_all_bits[(((1) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
# 1084 "include/linux/cpumask.h"
void set_cpu_possible(unsigned int cpu, bool possible);
void set_cpu_present(unsigned int cpu, bool present);
void set_cpu_online(unsigned int cpu, bool online);
void set_cpu_active(unsigned int cpu, bool active);
void init_cpu_present(const struct cpumask *src);
void init_cpu_possible(const struct cpumask *src);
void init_cpu_online(const struct cpumask *src);
# 15 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h" 2


# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cachectl.h" 1
# 18 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h" 2


# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/rlxregs.h" 1
# 557 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/rlxregs.h"
static inline __attribute__((always_inline)) void tlb_probe(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbp\n\t"
  ".set reorder");
}

static inline __attribute__((always_inline)) void tlb_read(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbr\n\t"
  ".set reorder");
}

static inline __attribute__((always_inline)) void tlb_write_indexed(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbwi\n\t"
  ".set reorder");
}

static inline __attribute__((always_inline)) void tlb_write_random(void)
{
 __asm__ __volatile__(
  ".set noreorder\n\t"
  "tlbwr\n\t"
  ".set reorder");
}
# 630 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/rlxregs.h"
static inline __attribute__((always_inline)) unsigned int set_c0_status(unsigned int set) { unsigned int res; res = ({ int __res; __asm__ __volatile__( "mfc0\t%0, " "$12" ", " "0" "\n\t" : "=r" (__res)); __res; }); res |= set; do { __asm__ __volatile__( "mtc0\t%z0, " "$12" ", " "0" "\n\t" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_status(unsigned int clear) { unsigned int res; res = ({ int __res; __asm__ __volatile__( "mfc0\t%0, " "$12" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~clear; do { __asm__ __volatile__( "mtc0\t%z0, " "$12" ", " "0" "\n\t" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_status(unsigned int change, unsigned int new) { unsigned int res; res = ({ int __res; __asm__ __volatile__( "mfc0\t%0, " "$12" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~change; res |= (new & change); do { __asm__ __volatile__( "mtc0\t%z0, " "$12" ", " "0" "\n\t" : : "Jr" ((unsigned int)(res))); } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_c0_cause(unsigned int set) { unsigned int res; res = ({ int __res; __asm__ __volatile__( "mfc0\t%0, " "$13" ", " "0" "\n\t" : "=r" (__res)); __res; }); res |= set; do { __asm__ __volatile__( "mtc0\t%z0, " "$13" ", " "0" "\n\t" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_c0_cause(unsigned int clear) { unsigned int res; res = ({ int __res; __asm__ __volatile__( "mfc0\t%0, " "$13" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~clear; do { __asm__ __volatile__( "mtc0\t%z0, " "$13" ", " "0" "\n\t" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_c0_cause(unsigned int change, unsigned int new) { unsigned int res; res = ({ int __res; __asm__ __volatile__( "mfc0\t%0, " "$13" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~change; res |= (new & change); do { __asm__ __volatile__( "mtc0\t%z0, " "$13" ", " "0" "\n\t" : : "Jr" ((unsigned int)(res))); } while (0); return res; }
# 825 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/rlxregs.h"
static inline __attribute__((always_inline)) unsigned int set_lxc0_intvec(unsigned int set) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$2" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$2" ", " "0" "\n\t" : "=r" (__res)); __res; }); res |= set; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$2" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$2" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_lxc0_intvec(unsigned int clear) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$2" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$2" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~clear; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$2" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$2" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_lxc0_intvec(unsigned int change, unsigned int new) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$2" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$2" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~change; res |= (new & change); do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$2" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$2" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_lxc0_estatus(unsigned int set) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$0" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$0" ", " "0" "\n\t" : "=r" (__res)); __res; }); res |= set; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$0" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$0" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_lxc0_estatus(unsigned int clear) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$0" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$0" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~clear; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$0" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$0" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_lxc0_estatus(unsigned int change, unsigned int new) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$0" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$0" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~change; res |= (new & change); do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$0" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$0" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_lxc0_ecause(unsigned int set) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$1" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$1" ", " "0" "\n\t" : "=r" (__res)); __res; }); res |= set; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$1" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$1" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_lxc0_ecause(unsigned int clear) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$1" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$1" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~clear; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$1" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$1" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_lxc0_ecause(unsigned int change, unsigned int new) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$1" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$1" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~change; res |= (new & change); do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$1" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$1" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; }
static inline __attribute__((always_inline)) unsigned int set_lxc0_wmpctl(unsigned int set) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$5" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$5" ", " "0" "\n\t" : "=r" (__res)); __res; }); res |= set; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$5" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$5" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int clear_lxc0_wmpctl(unsigned int clear) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$5" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$5" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~clear; do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$5" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$5" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; } static inline __attribute__((always_inline)) unsigned int change_lxc0_wmpctl(unsigned int change, unsigned int new) { unsigned int res; res = ({ int __res; if (0 == 0) __asm__ __volatile__( "mflxc0\t%0, " "$5" "\n\t" : "=r" (__res)); else __asm__ __volatile__( "mflxc0\t%0, " "$5" ", " "0" "\n\t" : "=r" (__res)); __res; }); res &= ~change; res |= (new & change); do { if (0 == 0) __asm__ __volatile__( "mtlxc0\t%z0, " "$5" "\n\t" : : "Jr" ((unsigned int)(res))); else __asm__ __volatile__( "mtlxc0\t%z0, " "$5" ", " "0" "\n" : : "Jr" ((unsigned int)(res))); } while (0); return res; }
# 21 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h" 2
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/system.h" 1
# 19 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/system.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/addrspace.h" 1
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/addrspace.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/mach-generic/spaces.h" 1
# 13 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/mach-generic/spaces.h"
# 1 "include/linux/const.h" 1
# 14 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/mach-generic/spaces.h" 2
# 14 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/addrspace.h" 2
# 20 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/system.h" 2

# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/cmpxchg.h" 1
# 22 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/system.h" 2

# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/watch.h" 1
# 15 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/watch.h"
void rlx_install_watch_registers(void);
void rlx_read_watch_registers(void);
void rlx_clear_watch_registers(void);
void rlx_probe_watch_registers(struct cpuinfo_mips *c);
# 24 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/system.h" 2






extern void *resume(void *last, void *next, void *next_ti);

struct task_struct;







static inline __attribute__((always_inline)) unsigned long __xchg_u32(volatile int * m, unsigned int val)
{
 __u32 retval;


  unsigned long dummy;

  __asm__ __volatile__(
  "1:	ll	%0, %3			# xchg_u32	\n"
  "	move	%2, %z4					\n"
  "	sc	%2, %1					\n"
  "	beqz	%2, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (retval), "=m" (*m), "=&r" (dummy)
  : "R" (*m), "Jr" (val)
  : "memory");
# 67 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/system.h"
 __asm__ __volatile__("   \n" : : : "memory");
 return retval;
}

extern __u64 __xchg_u64_unsupported_on_32bit_kernels(volatile __u64 * m, __u64 val);




extern void __xchg_called_with_bad_pointer(void);

static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
{
 switch (size) {
 case 4:
  return __xchg_u32(ptr, x);
 case 8:
  return __xchg_u64_unsupported_on_32bit_kernels(ptr, x);
 }
 __xchg_called_with_bad_pointer();
 return x;
}



extern void set_handler(unsigned long offset, void *addr, unsigned long len);
extern void set_uncached_handler(unsigned long offset, void *addr, unsigned long len);

extern void *set_except_vector(int n, void *addr);
extern unsigned long ebase;
extern void per_cpu_trap_init(void);







extern unsigned long arch_align_stack(unsigned long sp);
# 22 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h" 2
# 54 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h"
static inline __attribute__((always_inline)) void cpu_wait(void)
{
# 70 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h"
 extern int cpu_can_suspend, cpu_can_suspend_check_init;
 extern void suspend_check_interrupt_init(void);

 if (cpu_can_suspend_check_init) {
  if (!cpu_can_suspend){
             return;
         }
 }
 else {
  suspend_check_interrupt_init();
  cpu_can_suspend_check_init = 1;
 }




 { __asm__ __volatile__( "sleep         \n" "nop           \n" "nop           \n"); };
};
# 128 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h"
typedef struct {
 unsigned long seg;
} mm_segment_t;



struct mips_abi;




struct thread_struct {

 unsigned long reg16;
 unsigned long reg17, reg18, reg19, reg20, reg21, reg22, reg23;
 unsigned long reg29, reg30, reg31;


 unsigned long cp0_status;





 unsigned long cp0_badvaddr;
 unsigned long cp0_baduaddr;
 unsigned long error_code;
 unsigned long trap_no;
 struct mips_abi *abi;
};
# 221 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/processor.h"
struct task_struct;







extern long kernel_thread(int (*fn)(void *), void * arg, unsigned long flags);

extern unsigned long thread_saved_pc(struct task_struct *tsk);




extern void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp);

unsigned long get_wchan(struct task_struct *p);
# 16 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/thread_info.h" 2
# 24 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/thread_info.h"
struct thread_info {
 struct task_struct *task;
 struct exec_domain *exec_domain;
 unsigned long flags;
 unsigned long tp_value;
 __u32 cpu;
 int preempt_count;

 mm_segment_t addr_limit;



 struct restart_block restart_block;
 struct pt_regs *regs;
};
# 60 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/thread_info.h"
register struct thread_info *__current_thread_info __asm__("$28");
# 56 "include/linux/thread_info.h" 2
# 64 "include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
 set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_bit(flag, (unsigned long *)&ti->flags);
}
# 121 "include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_restore_sigmask(void)
{
 set_ti_thread_flag(__current_thread_info, 9);
 set_ti_thread_flag(__current_thread_info, 1);
}
# 10 "include/linux/preempt.h" 2

# 1 "include/linux/list.h" 1




# 1 "include/linux/poison.h" 1
# 6 "include/linux/list.h" 2
# 1 "include/linux/prefetch.h" 1
# 53 "include/linux/prefetch.h"
static inline __attribute__((always_inline)) void prefetch_range(void *addr, size_t len)
{







}
# 7 "include/linux/list.h" 2
# 19 "include/linux/list.h"
struct list_head {
 struct list_head *next, *prev;
};






static inline __attribute__((always_inline)) void INIT_LIST_HEAD(struct list_head *list)
{
 list->next = list;
 list->prev = list;
}
# 41 "include/linux/list.h"
static inline __attribute__((always_inline)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 next->prev = new;
 new->next = next;
 new->prev = prev;
 prev->next = new;
}
# 64 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 78 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}
# 90 "include/linux/list.h"
static inline __attribute__((always_inline)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 prev->next = next;
}
# 103 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->next = ((void *) 0x00100100);
 entry->prev = ((void *) 0x00200200);
}
# 120 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->next->prev = new;
 new->prev = old->prev;
 new->prev->next = new;
}

static inline __attribute__((always_inline)) void list_replace_init(struct list_head *old,
     struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}





static inline __attribute__((always_inline)) void list_del_init(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 INIT_LIST_HEAD(entry);
}






static inline __attribute__((always_inline)) void list_move(struct list_head *list, struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add(list, head);
}






static inline __attribute__((always_inline)) void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add_tail(list, head);
}






static inline __attribute__((always_inline)) int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next == head;
}





static inline __attribute__((always_inline)) int list_empty(const struct list_head *head)
{
 return head->next == head;
}
# 202 "include/linux/list.h"
static inline __attribute__((always_inline)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next;
 return (next == head) && (next == head->prev);
}





static inline __attribute__((always_inline)) int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next == head->prev);
}

static inline __attribute__((always_inline)) void __list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 struct list_head *new_first = entry->next;
 list->next = head->next;
 list->next->prev = list;
 list->prev = entry;
 entry->next = list;
 head->next = new_first;
 new_first->prev = head;
}
# 243 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 if (list_empty(head))
  return;
 if (list_is_singular(head) &&
  (head->next != entry && head != entry))
  return;
 if (entry == head)
  INIT_LIST_HEAD(list);
 else
  __list_cut_position(list, head, entry);
}

static inline __attribute__((always_inline)) void __list_splice(const struct list_head *list,
     struct list_head *prev,
     struct list_head *next)
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;

 first->prev = prev;
 prev->next = first;

 last->next = next;
 next->prev = last;
}






static inline __attribute__((always_inline)) void list_splice(const struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head, head->next);
}






static inline __attribute__((always_inline)) void list_splice_tail(struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head->prev, head);
}
# 302 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 319 "include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}
# 540 "include/linux/list.h"
struct hlist_head {
 struct hlist_node *first;
};

struct hlist_node {
 struct hlist_node *next, **pprev;
};




static inline __attribute__((always_inline)) void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next = ((void *)0);
 h->pprev = ((void *)0);
}

static inline __attribute__((always_inline)) int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}

static inline __attribute__((always_inline)) int hlist_empty(const struct hlist_head *h)
{
 return !h->first;
}

static inline __attribute__((always_inline)) void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next = n->next;
 struct hlist_node **pprev = n->pprev;
 *pprev = next;
 if (next)
  next->pprev = pprev;
}

static inline __attribute__((always_inline)) void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next = ((void *) 0x00100100);
 n->pprev = ((void *) 0x00200200);
}

static inline __attribute__((always_inline)) void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}

static inline __attribute__((always_inline)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 n->next = first;
 if (first)
  first->pprev = &n->next;
 h->first = n;
 n->pprev = &h->first;
}


static inline __attribute__((always_inline)) void hlist_add_before(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 next->pprev = &n->next;
 *(n->pprev) = n;
}

static inline __attribute__((always_inline)) void hlist_add_after(struct hlist_node *n,
     struct hlist_node *next)
{
 next->next = n->next;
 n->next = next;
 next->pprev = &n->next;

 if(next->next)
  next->next->pprev = &next->next;
}





static inline __attribute__((always_inline)) void hlist_move_list(struct hlist_head *old,
       struct hlist_head *new)
{
 new->first = old->first;
 if (new->first)
  new->first->pprev = &new->first;
 old->first = ((void *)0);
}
# 12 "include/linux/preempt.h" 2
# 51 "include/linux/spinlock.h" 2




# 1 "include/linux/stringify.h" 1
# 56 "include/linux/spinlock.h" 2
# 1 "include/linux/bottom_half.h" 1



extern void local_bh_disable(void);
extern void _local_bh_enable(void);
extern void local_bh_enable(void);
extern void local_bh_enable_ip(unsigned long ip);
# 57 "include/linux/spinlock.h" 2
# 80 "include/linux/spinlock.h"
# 1 "include/linux/spinlock_types.h" 1
# 15 "include/linux/spinlock_types.h"
# 1 "include/linux/spinlock_types_up.h" 1
# 25 "include/linux/spinlock_types_up.h"
typedef struct { } raw_spinlock_t;





typedef struct {

} raw_rwlock_t;
# 16 "include/linux/spinlock_types.h" 2


# 1 "include/linux/lockdep.h" 1
# 12 "include/linux/lockdep.h"
struct task_struct;
struct lockdep_map;
# 304 "include/linux/lockdep.h"
static inline __attribute__((always_inline)) void lockdep_off(void)
{
}

static inline __attribute__((always_inline)) void lockdep_on(void)
{
}
# 337 "include/linux/lockdep.h"
struct lock_class_key { };
# 385 "include/linux/lockdep.h"
extern void early_init_irq_lock_class(void);
# 397 "include/linux/lockdep.h"
static inline __attribute__((always_inline)) void early_boot_irqs_off(void)
{
}
static inline __attribute__((always_inline)) void early_boot_irqs_on(void)
{
}
static inline __attribute__((always_inline)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 19 "include/linux/spinlock_types.h" 2

typedef struct {
 raw_spinlock_t raw_lock;
# 32 "include/linux/spinlock_types.h"
} spinlock_t;



typedef struct {
 raw_rwlock_t raw_lock;
# 48 "include/linux/spinlock_types.h"
} rwlock_t;
# 81 "include/linux/spinlock.h" 2

extern int __attribute__((section(".spinlock.text"))) generic__raw_read_trylock(raw_rwlock_t *lock);







# 1 "include/linux/spinlock_up.h" 1
# 91 "include/linux/spinlock.h" 2
# 147 "include/linux/spinlock.h"
# 1 "include/linux/spinlock_api_up.h" 1
# 148 "include/linux/spinlock.h" 2
# 359 "include/linux/spinlock.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h" 1
# 51 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_add(int i, atomic_t * v)
{

 int temp;

    __asm__ __volatile__("   \n" : : : "memory");

 __asm__ __volatile__(
  "1:	ll	%0, %1		# atomic_add    \n"

                "       nop                                             \n"

  "	addu	%0, %2					\n"
  "	sc	%0, %1                      \n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b                          \n"
  "	.previous                       \n"
  : "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter));

    __asm__ __volatile__("   \n" : : : "memory");







}
# 89 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_sub(int i, atomic_t * v)
{

 int temp;

    __asm__ __volatile__("   \n" : : : "memory");

 __asm__ __volatile__(
  "1:	ll	    %0, %1		# atomic_sub		\n"

                "       nop                                             \n"

  "	subu	%0, %2					\n"
  "	sc	    %0, %1					\n"
  "	beqz	%0, 2f					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter));

    __asm__ __volatile__("   \n" : : : "memory");







}




static __inline__ __attribute__((always_inline)) int atomic_add_return(int i, atomic_t * v)
{

 int result;
    int temp;
 __asm__ __volatile__("   \n" : : : "memory");

 __asm__ __volatile__(
  "1:	ll	%1, %2		# atomic_add_return	\n"

                "       nop                                             \n"

  "	addu	%0, %1, %3				\n"
  "	sc	%0, %2					\n"
  "	beqz	%0, 2f					\n"
  "	addu	%0, %1, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 158 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
 return result;
}

static __inline__ __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t * v)
{

 int result;
    int temp;

 __asm__ __volatile__("   \n" : : : "memory");

 __asm__ __volatile__(
  "1:	ll	%1, %2		# atomic_sub_return	\n"

                "       nop                                             \n"

  "	subu	%0, %1, %3				\n"
  "	sc	%0, %2					\n"
  "	beqz	%0, 2f					\n"
  "	subu	%0, %1, %3				\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 198 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
 return result;
}
# 209 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_sub_if_positive(int i, atomic_t * v)
{

 int result;
    int temp;

 __asm__ __volatile__("   \n" : : : "memory");

 __asm__ __volatile__(
  "1:	ll	%1, %2		# atomic_sub_if_positive\n"

                "       nop                                             \n"

  "	subu	%0, %1, %3				\n"
  "	bltz	%0, 1f					\n"
  "	sc	%0, %2					\n"
  "	.set	noreorder				\n"
  "	beqz	%0, 2f					\n"
  "	 subu	%0, %1, %3				\n"
  "	.set	reorder					\n"
  "	.subsection 2					\n"
  "2:	b	1b					\n"
  "	.previous					\n"
  "1:							\n"
  : "=&r" (result), "=&r" (temp), "=m" (v->counter)
  : "Ir" (i), "m" (v->counter)
  : "memory");

 __asm__ __volatile__("   \n" : : : "memory");
# 250 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
 return result;
}
# 265 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_add_unless(atomic_t *v, int a, int u)
{
 int c, old;
 c = ((v)->counter);
 for (;;) {
  if (__builtin_expect(!!(c == (u)), 0))
   break;
  old = (({ __typeof__(&(((v))->counter)) __ptr = (&(((v))->counter)); __typeof__(*(&(((v))->counter))) __old = ((c)); __typeof__(*(&(((v))->counter))) __new = ((c + (a))); __typeof__(*(&(((v))->counter))) __res = 0; __asm__ __volatile__("   \n" : : : "memory"); __res = ({ __typeof(*(__ptr)) __ret; __asm__ __volatile__( "       .set    push                            \n" "       .set    noat                            \n" "1:     " "ll" "  %0, %2          # __cmpxchg_asm \n" "	nop					\n" "       bne     %0, %z3, 2f                     \n" "       move    $1, %z4                         \n" "       " "sc" "  $1, %1                          \n" "       beqz    $1, 3f                          \n" "2:                                             \n" "       .subsection 2                           \n" "3:     b       1b                              \n" "       .previous                               \n" "       .set    pop                             \n" : "=&r" (__ret), "=R" (*__ptr) : "R" (*__ptr), "Jr" (__old), "Jr" (__new) : "memory"); __ret; }); __asm__ __volatile__("   \n" : : : "memory"); __res; }));
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return c != (u);
}
# 357 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h"
# 1 "include/asm-generic/atomic-long.h" 1
# 141 "include/asm-generic/atomic-long.h"
typedef atomic_t atomic_long_t;


static inline __attribute__((always_inline)) long atomic_long_read(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)((v)->counter);
}

static inline __attribute__((always_inline)) void atomic_long_set(atomic_long_t *l, long i)
{
 atomic_t *v = (atomic_t *)l;

 ((v)->counter = (i));
}

static inline __attribute__((always_inline)) void atomic_long_inc(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_add(1, (v));
}

static inline __attribute__((always_inline)) void atomic_long_dec(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_sub(1, (v));
}

static inline __attribute__((always_inline)) void atomic_long_add(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_add(i, v);
}

static inline __attribute__((always_inline)) void atomic_long_sub(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_sub(i, v);
}

static inline __attribute__((always_inline)) int atomic_long_sub_and_test(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_sub_return((i), (v)) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_dec_and_test(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_sub_return(1, (v)) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_inc_and_test(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_add_return(1, (v)) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_add_negative(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_add_return(i, (v)) < 0);
}

static inline __attribute__((always_inline)) long atomic_long_add_return(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_return(i, v);
}

static inline __attribute__((always_inline)) long atomic_long_sub_return(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_sub_return(i, v);
}

static inline __attribute__((always_inline)) long atomic_long_inc_return(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_return(1, (v));
}

static inline __attribute__((always_inline)) long atomic_long_dec_return(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_sub_return(1, (v));
}

static inline __attribute__((always_inline)) long atomic_long_add_unless(atomic_long_t *l, long a, long u)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_unless(v, a, u);
}
# 358 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/atomic.h" 2
# 360 "include/linux/spinlock.h" 2
# 368 "include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 30 "include/linux/seqlock.h" 2


typedef struct {
 unsigned sequence;
 spinlock_t lock;
} seqlock_t;
# 60 "include/linux/seqlock.h"
static inline __attribute__((always_inline)) void write_seqlock(seqlock_t *sl)
{
 do { do { } while (0); (void)0; (void)(&sl->lock); } while (0);
 ++sl->sequence;
 __asm__ __volatile__("   \n" : : : "memory");
}

static inline __attribute__((always_inline)) void write_sequnlock(seqlock_t *sl)
{
 __asm__ __volatile__("   \n" : : : "memory");
 sl->sequence++;
 do { do { } while (0); (void)0; (void)(&sl->lock); } while (0);
}

static inline __attribute__((always_inline)) int write_tryseqlock(seqlock_t *sl)
{
 int ret = (({ do { do { } while (0); (void)0; (void)(&sl->lock); } while (0); 1; }));

 if (ret) {
  ++sl->sequence;
  __asm__ __volatile__("   \n" : : : "memory");
 }
 return ret;
}


static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned read_seqbegin(const seqlock_t *sl)
{
 unsigned ret;

repeat:
 ret = sl->sequence;
 __asm__ __volatile__("   \n" : : : "memory");
 if (__builtin_expect(!!(ret & 1), 0)) {
  __asm__ __volatile__("": : :"memory");
  goto repeat;
 }

 return ret;
}






static inline __attribute__((always_inline)) __attribute__((always_inline)) int read_seqretry(const seqlock_t *sl, unsigned start)
{
 __asm__ __volatile__("   \n" : : : "memory");

 return (sl->sequence != start);
}
# 121 "include/linux/seqlock.h"
typedef struct seqcount {
 unsigned sequence;
} seqcount_t;





static inline __attribute__((always_inline)) unsigned read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret;

repeat:
 ret = s->sequence;
 __asm__ __volatile__("   \n" : : : "memory");
 if (__builtin_expect(!!(ret & 1), 0)) {
  __asm__ __volatile__("": : :"memory");
  goto repeat;
 }
 return ret;
}




static inline __attribute__((always_inline)) int read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 __asm__ __volatile__("   \n" : : : "memory");

 return s->sequence != start;
}






static inline __attribute__((always_inline)) void write_seqcount_begin(seqcount_t *s)
{
 s->sequence++;
 __asm__ __volatile__("   \n" : : : "memory");
}

static inline __attribute__((always_inline)) void write_seqcount_end(seqcount_t *s)
{
 __asm__ __volatile__("   \n" : : : "memory");
 s->sequence++;
}
# 9 "include/linux/time.h" 2





struct timespec {
 __kernel_time_t tv_sec;
 long tv_nsec;
};


struct timeval {
 __kernel_time_t tv_sec;
 __kernel_suseconds_t tv_usec;
};

struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};



extern struct timezone sys_tz;
# 45 "include/linux/time.h"
static inline __attribute__((always_inline)) int timespec_equal(const struct timespec *a,
                                 const struct timespec *b)
{
 return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}






static inline __attribute__((always_inline)) int timespec_compare(const struct timespec *lhs, const struct timespec *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_nsec - rhs->tv_nsec;
}

static inline __attribute__((always_inline)) int timeval_compare(const struct timeval *lhs, const struct timeval *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_usec - rhs->tv_usec;
}

extern unsigned long mktime(const unsigned int year, const unsigned int mon,
       const unsigned int day, const unsigned int hour,
       const unsigned int min, const unsigned int sec);

extern void set_normalized_timespec(struct timespec *ts, time_t sec, long nsec);
extern struct timespec timespec_add_safe(const struct timespec lhs,
      const struct timespec rhs);




static inline __attribute__((always_inline)) struct timespec timespec_sub(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec - rhs.tv_sec,
    lhs.tv_nsec - rhs.tv_nsec);
 return ts_delta;
}







extern struct timespec xtime;
extern struct timespec wall_to_monotonic;
extern seqlock_t xtime_lock;

extern unsigned long read_persistent_clock(void);
extern int update_persistent_clock(struct timespec now);
extern int no_sync_cmos_clock ;
void timekeeping_init(void);
extern int timekeeping_suspended;

unsigned long get_seconds(void);
struct timespec current_kernel_time(void);




extern void do_gettimeofday(struct timeval *tv);
extern int do_settimeofday(struct timespec *tv);
extern int do_sys_settimeofday(struct timespec *tv, struct timezone *tz);

extern long do_utimes(int dfd, char *filename, struct timespec *times, int flags);
struct itimerval;
extern int do_setitimer(int which, struct itimerval *value,
   struct itimerval *ovalue);
extern unsigned int alarm_setitimer(unsigned int seconds);
extern int do_getitimer(int which, struct itimerval *value);
extern void getnstimeofday(struct timespec *tv);
extern void getrawmonotonic(struct timespec *ts);
extern void getboottime(struct timespec *ts);
extern void monotonic_to_bootbased(struct timespec *ts);

extern struct timespec timespec_trunc(struct timespec t, unsigned gran);
extern int timekeeping_valid_for_hres(void);
extern void update_wall_time(void);
extern void update_xtime_cache(u64 nsec);

struct tms;
extern void do_sys_times(struct tms *);
# 146 "include/linux/time.h"
static inline __attribute__((always_inline)) s64 timespec_to_ns(const struct timespec *ts)
{
 return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}
# 158 "include/linux/time.h"
static inline __attribute__((always_inline)) s64 timeval_to_ns(const struct timeval *tv)
{
 return ((s64) tv->tv_sec * 1000000000L) +
  tv->tv_usec * 1000L;
}







extern struct timespec ns_to_timespec(const s64 nsec);







extern struct timeval ns_to_timeval(const s64 nsec);
# 188 "include/linux/time.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) void timespec_add_ns(struct timespec *a, u64 ns)
{
 a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, 1000000000L, &ns);
 a->tv_nsec = ns;
}
# 211 "include/linux/time.h"
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};

struct itimerval {
 struct timeval it_interval;
 struct timeval it_value;
};
# 8 "include/linux/jiffies.h" 2
# 1 "include/linux/timex.h" 1
# 64 "include/linux/timex.h"
struct timex {
 unsigned int modes;
 long offset;
 long freq;
 long maxerror;
 long esterror;
 int status;
 long constant;
 long precision;
 long tolerance;


 struct timeval time;
 long tick;

 long ppsfreq;
 long jitter;
 int shift;
 long stabil;
 long jitcnt;
 long calcnt;
 long errcnt;
 long stbcnt;

 int tai;

 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32;
};
# 170 "include/linux/timex.h"
# 1 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/timex.h" 1
# 34 "/home/rtlac/RTL3.4/rtl819x_3.4.6.5/linux-2.6.30/arch/rlx/include/asm/timex.h"
typedef unsigned int cycles_t;

static inline __attribute__((always_inline)) cycles_t get_cycles(void)
{
 return 0;
}
# 171 "include/linux/timex.h" 2
# 210 "include/linux/timex.h"
extern unsigned long tick_usec;
extern unsigned long tick_nsec;
extern int tickadj;




extern int time_status;
extern long time_maxerror;
extern long time_esterror;

extern long time_adjust;

extern void ntp_init(void);
extern void ntp_clear(void);





static inline __attribute__((always_inline)) int ntp_synced(void)
{
 return !(time_status & 0x0040);
}
# 252 "include/linux/timex.h"
extern u64 tick_length;

extern void second_overflow(void);
extern void update_ntp_one_tick(void);
extern int do_adjtimex(struct timex *);




int read_current_timer(unsigned long *timer_val);
# 9 "include/linux/jiffies.h" 2
# 85 "include/linux/jiffies.h"
extern u64 __attribute__((section(".dram-gen"))) jiffies_64;
extern unsigned long volatile __attribute__((section(".dram-gen"))) jiffies;


u64 get_jiffies_64(void);
# 187 "include/linux/jiffies.h"
extern unsigned long preset_lpj;
# 300 "include/linux/jiffies.h"
extern unsigned int jiffies_to_msecs(const unsigned long j);
extern unsigned int jiffies_to_usecs(const unsigned long j);
extern unsigned long msecs_to_jiffies(const unsigned int m);
extern unsigned long usecs_to_jiffies(const unsigned int u);
extern unsigned long timespec_to_jiffies(const struct timespec *value);
extern void jiffies_to_timespec(const unsigned long jiffies,
    struct timespec *value);
extern unsigned long timeval_to_jiffies(const struct timeval *value);
extern void jiffies_to_timeval(const unsigned long jiffies,
          struct timeval *value);
extern clock_t jiffies_to_clock_t(long x);
extern unsigned long clock_t_to_jiffies(unsigned long x);
extern u64 jiffies_64_to_clock_t(u64 x);
extern u64 nsec_to_clock_t(u64 x);
# 82 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h" 2
# 91 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h"
# 1 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./typedef.h" 1
# 12 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./typedef.h"
typedef void VOID,*PVOID;
typedef unsigned char BOOLEAN,*PBOOLEAN;

typedef unsigned char u1Byte,*pu1Byte;
typedef unsigned short u2Byte,*pu2Byte;
typedef unsigned int u4Byte,*pu4Byte;
typedef unsigned long long u8Byte,*pu8Byte;




    typedef signed char s1Byte,*ps1Byte;



typedef short s2Byte,*ps2Byte;
typedef long s4Byte,*ps4Byte;
typedef long long s8Byte,*ps8Byte;

typedef unsigned long UINT32,*pUINT32;
typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef signed char INT8;
typedef signed short INT16;
typedef signed long INT32;
typedef unsigned int UINT;
typedef signed int INT;
typedef unsigned long long UINT64;
typedef signed long long INT64;
# 297 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./typedef.h"
typedef enum _WIRELESS_MODE {
 WIRELESS_MODE_UNKNOWN = 0x00,
 WIRELESS_MODE_A = 0x01,
 WIRELESS_MODE_B = 0x02,
 WIRELESS_MODE_G = 0x04,
 WIRELESS_MODE_AUTO = 0x08,
 WIRELESS_MODE_N_24G = 0x10,
 WIRELESS_MODE_N_5G = 0x20,
 WIRELESS_MODE_AC_5G = 0x40,
 WIRELESS_MODE_AC_24G = 0x80
} WIRELESS_MODE;
# 92 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h" 2
# 1686 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/./8192cd_cfg.h"
 extern int scrlog_printk(const char * fmt, ...);
# 25 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c" 2



# 1 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.h" 1
# 35 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.h"
typedef unsigned char *POINTER;


typedef unsigned short int UINT2;


typedef unsigned long int UINT4;
# 51 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.h"
typedef struct {
  UINT4 state[4];
  UINT4 count[2];
  unsigned char buffer[64];
} MD5_CTX;

void wlan_MD5_Init(MD5_CTX *);
void wlan_MD5_Update(MD5_CTX *, UINT8 *, UINT32);
void wlan_MD5_Final(unsigned char [16], MD5_CTX *);
# 29 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c" 2
# 47 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c"
static void MD5Transform(UINT4 [4], UINT8 [64]);
static void Encode(UINT8 *, UINT4 *, UINT32);
static void Decode(UINT4 *, UINT8 *, UINT32);
static void MD5_memcpy(POINTER, POINTER, UINT32);
static void MD5_memset(POINTER, int, UINT32);

static UINT8 PADDING[64] = {
  0x80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
# 96 "drivers/net/wireless/rtl8192cd_3.4.6.4_8881AN_HIGHPOWER_PATCH/1x_md5c.c"
void wlan_MD5_Init (context)
MD5_CTX *context;
{
  context->count[0] = context->count[1] = 0;


  context->state[0] = 0x67452301;
  context->state[1] = 0xefcdab89;
  context->state[2] = 0x98badcfe;
  context->state[3] = 0x10325476;
}





void wlan_MD5_Update (context, input, inputLen)
MD5_CTX *context;
UINT8 *input;
UINT32 inputLen;
{
  UINT32 i, index, partLen;


  index = (UINT32)((context->count[0] >> 3) & 0x3F);


  if ((context->count[0] += ((UINT4)inputLen << 3))

   < ((UINT4)inputLen << 3))
 context->count[1]++;
  context->count[1] += ((UINT4)inputLen >> 29);

  partLen = 64 - index;



  if (inputLen >= partLen) {
 MD5_memcpy
   ((POINTER)&context->buffer[index], (POINTER)input, partLen);
 MD5Transform (context->state, context->buffer);

 for (i = partLen; i + 63 < inputLen; i += 64)
   MD5Transform (context->state, &input[i]);

 index = 0;
  }
  else
 i = 0;


  MD5_memcpy
 ((POINTER)&context->buffer[index], (POINTER)&input[i],
  inputLen-i);
}




void wlan_MD5_Final (digest, context)
UINT8 digest[16];
MD5_CTX *context;
{
  UINT8 bits[8];
  UINT32 index, padLen;


  Encode (bits, context->count, 8);



  index = (UINT32)((context->count[0] >> 3) & 0x3f);
  padLen = (index < 56) ? (56 - index) : (120 - index);
  wlan_MD5_Update (context, PADDING, padLen);


  wlan_MD5_Update (context, bits, 8);


  Encode (digest, context->state, 16);



  MD5_memset ((POINTER)context, 0, sizeof (*context));
}



static void MD5Transform (state, block)
UINT4 state[4];
UINT8 block[64];
{
  UINT4 a = state[0], b = state[1], c = state[2], d = state[3], x[16];

  Decode (x, block, 64);


  { (a) += ((((b)) & ((c))) | ((~(b)) & ((d)))) + (x[ 0]) + (UINT4)(0xd76aa478); (a) = ((((a)) << ((7))) | (((a)) >> (32-((7))))); (a) += (b); };
  { (d) += ((((a)) & ((b))) | ((~(a)) & ((c)))) + (x[ 1]) + (UINT4)(0xe8c7b756); (d) = ((((d)) << ((12))) | (((d)) >> (32-((12))))); (d) += (a); };
  { (c) += ((((d)) & ((a))) | ((~(d)) & ((b)))) + (x[ 2]) + (UINT4)(0x242070db); (c) = ((((c)) << ((17))) | (((c)) >> (32-((17))))); (c) += (d); };
  { (b) += ((((c)) & ((d))) | ((~(c)) & ((a)))) + (x[ 3]) + (UINT4)(0xc1bdceee); (b) = ((((b)) << ((22))) | (((b)) >> (32-((22))))); (b) += (c); };
  { (a) += ((((b)) & ((c))) | ((~(b)) & ((d)))) + (x[ 4]) + (UINT4)(0xf57c0faf); (a) = ((((a)) << ((7))) | (((a)) >> (32-((7))))); (a) += (b); };
  { (d) += ((((a)) & ((b))) | ((~(a)) & ((c)))) + (x[ 5]) + (UINT4)(0x4787c62a); (d) = ((((d)) << ((12))) | (((d)) >> (32-((12))))); (d) += (a); };
  { (c) += ((((d)) & ((a))) | ((~(d)) & ((b)))) + (x[ 6]) + (UINT4)(0xa8304613); (c) = ((((c)) << ((17))) | (((c)) >> (32-((17))))); (c) += (d); };
  { (b) += ((((c)) & ((d))) | ((~(c)) & ((a)))) + (x[ 7]) + (UINT4)(0xfd469501); (b) = ((((b)) << ((22))) | (((b)) >> (32-((22))))); (b) += (c); };
  { (a) += ((((b)) & ((c))) | ((~(b)) & ((d)))) + (x[ 8]) + (UINT4)(0x698098d8); (a) = ((((a)) << ((7))) | (((a)) >> (32-((7))))); (a) += (b); };
  { (d) += ((((a)) & ((b))) | ((~(a)) & ((c)))) + (x[ 9]) + (UINT4)(0x8b44f7af); (d) = ((((d)) << ((12))) | (((d)) >> (32-((12))))); (d) += (a); };
  { (c) += ((((d)) & ((a))) | ((~(d)) & ((b)))) + (x[10]) + (UINT4)(0xffff5bb1); (c) = ((((c)) << ((17))) | (((c)) >> (32-((17))))); (c) += (d); };
  { (b) += ((((c)) & ((d))) | ((~(c)) & ((a)))) + (x[11]) + (UINT4)(0x895cd7be); (b) = ((((b)) << ((22))) | (((b)) >> (32-((22))))); (b) += (c); };
  { (a) += ((((b)) & ((c))) | ((~(b)) & ((d)))) + (x[12]) + (UINT4)(0x6b901122); (a) = ((((a)) << ((7))) | (((a)) >> (32-((7))))); (a) += (b); };
  { (d) += ((((a)) & ((b))) | ((~(a)) & ((c)))) + (x[13]) + (UINT4)(0xfd987193); (d) = ((((d)) << ((12))) | (((d)) >> (32-((12))))); (d) += (a); };
  { (c) += ((((d)) & ((a))) | ((~(d)) & ((b)))) + (x[14]) + (UINT4)(0xa679438e); (c) = ((((c)) << ((17))) | (((c)) >> (32-((17))))); (c) += (d); };
  { (b) += ((((c)) & ((d))) | ((~(c)) & ((a)))) + (x[15]) + (UINT4)(0x49b40821); (b) = ((((b)) << ((22))) | (((b)) >> (32-((22))))); (b) += (c); };


  { (a) += ((((b)) & ((d))) | (((c)) & (~(d)))) + (x[ 1]) + (UINT4)(0xf61e2562); (a) = ((((a)) << ((5))) | (((a)) >> (32-((5))))); (a) += (b); };
  { (d) += ((((a)) & ((c))) | (((b)) & (~(c)))) + (x[ 6]) + (UINT4)(0xc040b340); (d) = ((((d)) << ((9))) | (((d)) >> (32-((9))))); (d) += (a); };
  { (c) += ((((d)) & ((b))) | (((a)) & (~(b)))) + (x[11]) + (UINT4)(0x265e5a51); (c) = ((((c)) << ((14))) | (((c)) >> (32-((14))))); (c) += (d); };
  { (b) += ((((c)) & ((a))) | (((d)) & (~(a)))) + (x[ 0]) + (UINT4)(0xe9b6c7aa); (b) = ((((b)) << ((20))) | (((b)) >> (32-((20))))); (b) += (c); };
  { (a) += ((((b)) & ((d))) | (((c)) & (~(d)))) + (x[ 5]) + (UINT4)(0xd62f105d); (a) = ((((a)) << ((5))) | (((a)) >> (32-((5))))); (a) += (b); };
  { (d) += ((((a)) & ((c))) | (((b)) & (~(c)))) + (x[10]) + (UINT4)(0x2441453); (d) = ((((d)) << ((9))) | (((d)) >> (32-((9))))); (d) += (a); };
  { (c) += ((((d)) & ((b))) | (((a)) & (~(b)))) + (x[15]) + (UINT4)(0xd8a1e681); (c) = ((((c)) << ((14))) | (((c)) >> (32-((14))))); (c) += (d); };
  { (b) += ((((c)) & ((a))) | (((d)) & (~(a)))) + (x[ 4]) + (UINT4)(0xe7d3fbc8); (b) = ((((b)) << ((20))) | (((b)) >> (32-((20))))); (b) += (c); };
  { (a) += ((((b)) & ((d))) | (((c)) & (~(d)))) + (x[ 9]) + (UINT4)(0x21e1cde6); (a) = ((((a)) << ((5))) | (((a)) >> (32-((5))))); (a) += (b); };
  { (d) += ((((a)) & ((c))) | (((b)) & (~(c)))) + (x[14]) + (UINT4)(0xc33707d6); (d) = ((((d)) << ((9))) | (((d)) >> (32-((9))))); (d) += (a); };
  { (c) += ((((d)) & ((b))) | (((a)) & (~(b)))) + (x[ 3]) + (UINT4)(0xf4d50d87); (c) = ((((c)) << ((14))) | (((c)) >> (32-((14))))); (c) += (d); };

  { (b) += ((((c)) & ((a))) | (((d)) & (~(a)))) + (x[ 8]) + (UINT4)(0x455a14ed); (b) = ((((b)) << ((20))) | (((b)) >> (32-((20))))); (b) += (c); };
  { (a) += ((((b)) & ((d))) | (((c)) & (~(d)))) + (x[13]) + (UINT4)(0xa9e3e905); (a) = ((((a)) << ((5))) | (((a)) >> (32-((5))))); (a) += (b); };
  { (d) += ((((a)) & ((c))) | (((b)) & (~(c)))) + (x[ 2]) + (UINT4)(0xfcefa3f8); (d) = ((((d)) << ((9))) | (((d)) >> (32-((9))))); (d) += (a); };
  { (c) += ((((d)) & ((b))) | (((a)) & (~(b)))) + (x[ 7]) + (UINT4)(0x676f02d9); (c) = ((((c)) << ((14))) | (((c)) >> (32-((14))))); (c) += (d); };
  { (b) += ((((c)) & ((a))) | (((d)) & (~(a)))) + (x[12]) + (UINT4)(0x8d2a4c8a); (b) = ((((b)) << ((20))) | (((b)) >> (32-((20))))); (b) += (c); };


  { (a) += (((b)) ^ ((c)) ^ ((d))) + (x[ 5]) + (UINT4)(0xfffa3942); (a) = ((((a)) << ((4))) | (((a)) >> (32-((4))))); (a) += (b); };
  { (d) += (((a)) ^ ((b)) ^ ((c))) + (x[ 8]) + (UINT4)(0x8771f681); (d) = ((((d)) << ((11))) | (((d)) >> (32-((11))))); (d) += (a); };
  { (c) += (((d)) ^ ((a)) ^ ((b))) + (x[11]) + (UINT4)(0x6d9d6122); (c) = ((((c)) << ((16))) | (((c)) >> (32-((16))))); (c) += (d); };
  { (b) += (((c)) ^ ((d)) ^ ((a))) + (x[14]) + (UINT4)(0xfde5380c); (b) = ((((b)) << ((23))) | (((b)) >> (32-((23))))); (b) += (c); };
  { (a) += (((b)) ^ ((c)) ^ ((d))) + (x[ 1]) + (UINT4)(0xa4beea44); (a) = ((((a)) << ((4))) | (((a)) >> (32-((4))))); (a) += (b); };
  { (d) += (((a)) ^ ((b)) ^ ((c))) + (x[ 4]) + (UINT4)(0x4bdecfa9); (d) = ((((d)) << ((11))) | (((d)) >> (32-((11))))); (d) += (a); };
  { (c) += (((d)) ^ ((a)) ^ ((b))) + (x[ 7]) + (UINT4)(0xf6bb4b60); (c) = ((((c)) << ((16))) | (((c)) >> (32-((16))))); (c) += (d); };
  { (b) += (((c)) ^ ((d)) ^ ((a))) + (x[10]) + (UINT4)(0xbebfbc70); (b) = ((((b)) << ((23))) | (((b)) >> (32-((23))))); (b) += (c); };
  { (a) += (((b)) ^ ((c)) ^ ((d))) + (x[13]) + (UINT4)(0x289b7ec6); (a) = ((((a)) << ((4))) | (((a)) >> (32-((4))))); (a) += (b); };
  { (d) += (((a)) ^ ((b)) ^ ((c))) + (x[ 0]) + (UINT4)(0xeaa127fa); (d) = ((((d)) << ((11))) | (((d)) >> (32-((11))))); (d) += (a); };
  { (c) += (((d)) ^ ((a)) ^ ((b))) + (x[ 3]) + (UINT4)(0xd4ef3085); (c) = ((((c)) << ((16))) | (((c)) >> (32-((16))))); (c) += (d); };
  { (b) += (((c)) ^ ((d)) ^ ((a))) + (x[ 6]) + (UINT4)(0x4881d05); (b) = ((((b)) << ((23))) | (((b)) >> (32-((23))))); (b) += (c); };
  { (a) += (((b)) ^ ((c)) ^ ((d))) + (x[ 9]) + (UINT4)(0xd9d4d039); (a) = ((((a)) << ((4))) | (((a)) >> (32-((4))))); (a) += (b); };
  { (d) += (((a)) ^ ((b)) ^ ((c))) + (x[12]) + (UINT4)(0xe6db99e5); (d) = ((((d)) << ((11))) | (((d)) >> (32-((11))))); (d) += (a); };
  { (c) += (((d)) ^ ((a)) ^ ((b))) + (x[15]) + (UINT4)(0x1fa27cf8); (c) = ((((c)) << ((16))) | (((c)) >> (32-((16))))); (c) += (d); };
  { (b) += (((c)) ^ ((d)) ^ ((a))) + (x[ 2]) + (UINT4)(0xc4ac5665); (b) = ((((b)) << ((23))) | (((b)) >> (32-((23))))); (b) += (c); };


  { (a) += (((c)) ^ (((b)) | (~(d)))) + (x[ 0]) + (UINT4)(0xf4292244); (a) = ((((a)) << ((6))) | (((a)) >> (32-((6))))); (a) += (b); };
  { (d) += (((b)) ^ (((a)) | (~(c)))) + (x[ 7]) + (UINT4)(0x432aff97); (d) = ((((d)) << ((10))) | (((d)) >> (32-((10))))); (d) += (a); };
  { (c) += (((a)) ^ (((d)) | (~(b)))) + (x[14]) + (UINT4)(0xab9423a7); (c) = ((((c)) << ((15))) | (((c)) >> (32-((15))))); (c) += (d); };
  { (b) += (((d)) ^ (((c)) | (~(a)))) + (x[ 5]) + (UINT4)(0xfc93a039); (b) = ((((b)) << ((21))) | (((b)) >> (32-((21))))); (b) += (c); };
  { (a) += (((c)) ^ (((b)) | (~(d)))) + (x[12]) + (UINT4)(0x655b59c3); (a) = ((((a)) << ((6))) | (((a)) >> (32-((6))))); (a) += (b); };
  { (d) += (((b)) ^ (((a)) | (~(c)))) + (x[ 3]) + (UINT4)(0x8f0ccc92); (d) = ((((d)) << ((10))) | (((d)) >> (32-((10))))); (d) += (a); };
  { (c) += (((a)) ^ (((d)) | (~(b)))) + (x[10]) + (UINT4)(0xffeff47d); (c) = ((((c)) << ((15))) | (((c)) >> (32-((15))))); (c) += (d); };
  { (b) += (((d)) ^ (((c)) | (~(a)))) + (x[ 1]) + (UINT4)(0x85845dd1); (b) = ((((b)) << ((21))) | (((b)) >> (32-((21))))); (b) += (c); };
  { (a) += (((c)) ^ (((b)) | (~(d)))) + (x[ 8]) + (UINT4)(0x6fa87e4f); (a) = ((((a)) << ((6))) | (((a)) >> (32-((6))))); (a) += (b); };
  { (d) += (((b)) ^ (((a)) | (~(c)))) + (x[15]) + (UINT4)(0xfe2ce6e0); (d) = ((((d)) << ((10))) | (((d)) >> (32-((10))))); (d) += (a); };
  { (c) += (((a)) ^ (((d)) | (~(b)))) + (x[ 6]) + (UINT4)(0xa3014314); (c) = ((((c)) << ((15))) | (((c)) >> (32-((15))))); (c) += (d); };
  { (b) += (((d)) ^ (((c)) | (~(a)))) + (x[13]) + (UINT4)(0x4e0811a1); (b) = ((((b)) << ((21))) | (((b)) >> (32-((21))))); (b) += (c); };
  { (a) += (((c)) ^ (((b)) | (~(d)))) + (x[ 4]) + (UINT4)(0xf7537e82); (a) = ((((a)) << ((6))) | (((a)) >> (32-((6))))); (a) += (b); };
  { (d) += (((b)) ^ (((a)) | (~(c)))) + (x[11]) + (UINT4)(0xbd3af235); (d) = ((((d)) << ((10))) | (((d)) >> (32-((10))))); (d) += (a); };
  { (c) += (((a)) ^ (((d)) | (~(b)))) + (x[ 2]) + (UINT4)(0x2ad7d2bb); (c) = ((((c)) << ((15))) | (((c)) >> (32-((15))))); (c) += (d); };
  { (b) += (((d)) ^ (((c)) | (~(a)))) + (x[ 9]) + (UINT4)(0xeb86d391); (b) = ((((b)) << ((21))) | (((b)) >> (32-((21))))); (b) += (c); };

  state[0] += a;
  state[1] += b;
  state[2] += c;
  state[3] += d;




  MD5_memset ((POINTER)x, 0, sizeof (x));
}




static void Encode (output, input, len)
UINT8 *output;
UINT4 *input;
UINT32 len;
{
  UINT32 i, j;

  for (i = 0, j = 0; j < len; i++, j += 4) {
 output[j] = (UINT8)(input[i] & 0xff);
 output[j+1] = (UINT8)((input[i] >> 8) & 0xff);
 output[j+2] = (UINT8)((input[i] >> 16) & 0xff);
 output[j+3] = (UINT8)((input[i] >> 24) & 0xff);
  }
}




static void Decode (output, input, len)
UINT4 *output;
UINT8 *input;
UINT32 len;
{
  UINT32 i, j;

  for (i = 0, j = 0; j < len; i++, j += 4)
 output[i] = ((UINT4)input[j]) | (((UINT4)input[j+1]) << 8) |
   (((UINT4)input[j+2]) << 16) | (((UINT4)input[j+3]) << 24);
}




static void MD5_memcpy (output, input, len)
POINTER output;
POINTER input;
UINT32 len;
{
  UINT32 i;

  for (i = 0; i < len; i++)

 output[i] = input[i];
}



static void MD5_memset (output, value, len)
POINTER output;
int value;
UINT32 len;
{
  UINT32 i;

  for (i = 0; i < len; i++)
 ((char *)output)[i] = (char)value;
}
