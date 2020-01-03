# 1 "../../drivers/regulator/fixed.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/generated/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "../../drivers/regulator/fixed.c"
# 21 "../../drivers/regulator/fixed.c"
# 1 "../../include/linux/err.h" 1



# 1 "../../include/linux/compiler.h" 1
# 42 "../../include/linux/compiler.h"
# 1 "../../include/linux/compiler-gcc.h" 1
# 91 "../../include/linux/compiler-gcc.h"
# 1 "../../include/linux/compiler-gcc4.h" 1
# 92 "../../include/linux/compiler-gcc.h" 2
# 43 "../../include/linux/compiler.h" 2
# 60 "../../include/linux/compiler.h"
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
# 5 "../../include/linux/err.h" 2

# 1 "../../arch/arm/include/asm/errno.h" 1



# 1 "../../include/asm-generic/errno.h" 1



# 1 "../../include/asm-generic/errno-base.h" 1
# 5 "../../include/asm-generic/errno.h" 2
# 5 "../../arch/arm/include/asm/errno.h" 2
# 7 "../../include/linux/err.h" 2
# 22 "../../include/linux/err.h"
static inline __attribute__((always_inline)) void * __attribute__((warn_unused_result)) ERR_PTR(long error)
{
 return (void *) error;
}

static inline __attribute__((always_inline)) long __attribute__((warn_unused_result)) PTR_ERR(const void *ptr)
{
 return (long) ptr;
}

static inline __attribute__((always_inline)) long __attribute__((warn_unused_result)) IS_ERR(const void *ptr)
{
 return __builtin_expect(!!(((unsigned long)ptr) >= (unsigned long)-4095), 0);
}

static inline __attribute__((always_inline)) long __attribute__((warn_unused_result)) IS_ERR_OR_NULL(const void *ptr)
{
 return !ptr || __builtin_expect(!!(((unsigned long)ptr) >= (unsigned long)-4095), 0);
}
# 49 "../../include/linux/err.h"
static inline __attribute__((always_inline)) void * __attribute__((warn_unused_result)) ERR_CAST(const void *ptr)
{

 return (void *) ptr;
}
# 22 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/mutex.h" 1
# 13 "../../include/linux/mutex.h"
# 1 "../../include/linux/list.h" 1



# 1 "../../include/linux/stddef.h" 1
# 15 "../../include/linux/stddef.h"
enum {
 false = 0,
 true = 1
};
# 5 "../../include/linux/list.h" 2
# 1 "../../include/linux/poison.h" 1
# 6 "../../include/linux/list.h" 2
# 1 "../../include/linux/prefetch.h" 1
# 13 "../../include/linux/prefetch.h"
# 1 "../../include/linux/types.h" 1



# 1 "../../arch/arm/include/asm/types.h" 1



# 1 "../../include/asm-generic/int-ll64.h" 1
# 11 "../../include/asm-generic/int-ll64.h"
# 1 "../../arch/arm/include/asm/bitsperlong.h" 1
# 1 "../../include/asm-generic/bitsperlong.h" 1
# 1 "../../arch/arm/include/asm/bitsperlong.h" 2
# 12 "../../include/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 42 "../../include/asm-generic/int-ll64.h"
typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;
# 5 "../../arch/arm/include/asm/types.h" 2



typedef unsigned short umode_t;
# 23 "../../arch/arm/include/asm/types.h"
typedef u32 dma_addr_t;
typedef u32 dma64_addr_t;
# 5 "../../include/linux/types.h" 2
# 14 "../../include/linux/types.h"
# 1 "../../include/linux/posix_types.h" 1
# 36 "../../include/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits [(1024/(8 * sizeof(unsigned long)))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "../../arch/arm/include/asm/posix_types.h" 1
# 22 "../../arch/arm/include/asm/posix_types.h"
typedef unsigned long __kernel_ino_t;
typedef unsigned short __kernel_mode_t;
typedef unsigned short __kernel_nlink_t;
typedef long __kernel_off_t;
typedef int __kernel_pid_t;
typedef unsigned short __kernel_ipc_pid_t;
typedef unsigned short __kernel_uid_t;
typedef unsigned short __kernel_gid_t;
typedef unsigned int __kernel_size_t;
typedef int __kernel_ssize_t;
typedef int __kernel_ptrdiff_t;
typedef long __kernel_time_t;
typedef long __kernel_suseconds_t;
typedef long __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef int __kernel_daddr_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;

typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;
typedef unsigned short __kernel_old_dev_t;


typedef long long __kernel_loff_t;


typedef struct {
 int val[2];
} __kernel_fsid_t;
# 48 "../../include/linux/posix_types.h" 2
# 15 "../../include/linux/types.h" 2



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



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;



typedef __kernel_loff_t loff_t;
# 59 "../../include/linux/types.h"
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
# 135 "../../include/linux/types.h"
typedef u64 sector_t;
typedef u64 blkcnt_t;
# 168 "../../include/linux/types.h"
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
 int counter;
} atomic_t;







struct ustat {
 __kernel_daddr_t f_tfree;
 __kernel_ino_t f_tinode;
 char f_fname[6];
 char f_fpack[6];
};
# 14 "../../include/linux/prefetch.h" 2
# 1 "../../arch/arm/include/asm/processor.h" 1
# 22 "../../arch/arm/include/asm/processor.h"
# 1 "../../arch/arm/include/asm/ptrace.h" 1
# 13 "../../arch/arm/include/asm/ptrace.h"
# 1 "../../arch/arm/include/asm/hwcap.h" 1
# 29 "../../arch/arm/include/asm/hwcap.h"
extern unsigned int elf_hwcap;
# 14 "../../arch/arm/include/asm/ptrace.h" 2
# 105 "../../arch/arm/include/asm/ptrace.h"
struct pt_regs {
 unsigned long uregs[18];
};
# 159 "../../arch/arm/include/asm/ptrace.h"
static inline __attribute__((always_inline)) int valid_user_regs(struct pt_regs *regs)
{
 unsigned long mode = regs->uregs[16] & 0x0000001f;




 regs->uregs[16] &= ~(0x00000040 | 0x00000100);

 if ((regs->uregs[16] & 0x00000080) == 0) {
  if (mode == 0x00000010)
   return 1;
  if (elf_hwcap & 8 && mode == 0x00000000)
   return 1;
 }




 regs->uregs[16] &= 0xff000000 | 0x00ff0000 | 0x0000ff00 | 0x00000020 | 0x00000010;
 if (!(elf_hwcap & 8))
  regs->uregs[16] |= 0x00000010;

 return 0;
}




extern unsigned long profile_pc(struct pt_regs *regs);
# 23 "../../arch/arm/include/asm/processor.h" 2
# 31 "../../arch/arm/include/asm/processor.h"
union debug_insn {
 u32 arm;
 u16 thumb;
};

struct debug_entry {
 u32 address;
 union debug_insn insn;
};

struct debug_info {
 int nsaved;
 struct debug_entry bp[2];
};

struct thread_struct {

 unsigned long address;
 unsigned long trap_no;
 unsigned long error_code;

 struct debug_info debug;
};
# 84 "../../arch/arm/include/asm/processor.h"
struct task_struct;


extern void release_thread(struct task_struct *);




unsigned long get_wchan(struct task_struct *p);
# 103 "../../arch/arm/include/asm/processor.h"
extern int kernel_thread(int (*fn)(void *), void *arg, unsigned long flags);
# 117 "../../arch/arm/include/asm/processor.h"
static inline __attribute__((always_inline)) void prefetch(const void *ptr)
{
 __asm__ __volatile__(
  "pld\t%a0"
  :
  : "p" (ptr)
  : "cc");
}
# 15 "../../include/linux/prefetch.h" 2
# 1 "../../arch/arm/include/asm/cache.h" 1
# 16 "../../include/linux/prefetch.h" 2
# 53 "../../include/linux/prefetch.h"
static inline __attribute__((always_inline)) void prefetch_range(void *addr, size_t len)
{

 char *cp;
 char *end = addr + len;

 for (cp = addr; cp < end; cp += (4*(1 << 5)))
  prefetch(cp);

}
# 7 "../../include/linux/list.h" 2
# 1 "../../arch/arm/include/asm/system.h" 1
# 60 "../../arch/arm/include/asm/system.h"
# 1 "../../include/linux/linkage.h" 1




# 1 "../../arch/arm/include/asm/linkage.h" 1
# 6 "../../include/linux/linkage.h" 2
# 61 "../../arch/arm/include/asm/system.h" 2
# 1 "../../include/linux/irqflags.h" 1
# 14 "../../include/linux/irqflags.h"
# 1 "../../include/linux/typecheck.h" 1
# 15 "../../include/linux/irqflags.h" 2
# 57 "../../include/linux/irqflags.h"
# 1 "../../arch/arm/include/asm/irqflags.h" 1
# 58 "../../include/linux/irqflags.h" 2
# 62 "../../arch/arm/include/asm/system.h" 2

# 1 "../../arch/arm/include/asm/outercache.h" 1
# 24 "../../arch/arm/include/asm/outercache.h"
struct outer_cache_fns {
 void (*inv_range)(unsigned long, unsigned long);
 void (*clean_range)(unsigned long, unsigned long);
 void (*flush_range)(unsigned long, unsigned long);
 void (*flush_all)(void);
 void (*inv_all)(void);
 void (*disable)(void);

 void (*sync)(void);

 void (*nolock_flush_all)(void);
 void (*nolock_clean_all)(void);
};



extern struct outer_cache_fns outer_cache;

static inline __attribute__((always_inline)) void outer_inv_range(unsigned long start, unsigned long end)
{
 if (outer_cache.inv_range)
  outer_cache.inv_range(start, end);
}
static inline __attribute__((always_inline)) void outer_clean_range(unsigned long start, unsigned long end)
{
 if (outer_cache.clean_range)
  outer_cache.clean_range(start, end);
}
static inline __attribute__((always_inline)) void outer_flush_range(unsigned long start, unsigned long end)
{
 if (outer_cache.flush_range)
  outer_cache.flush_range(start, end);
}
static inline __attribute__((always_inline)) void outer_flush_all(void)
{
 if (outer_cache.flush_all)
  outer_cache.flush_all();
}

static inline __attribute__((always_inline)) void outer_inv_all(void)
{
 if (outer_cache.inv_all)
  outer_cache.inv_all();
}

static inline __attribute__((always_inline)) void outer_disable(void)
{
 if (outer_cache.disable)
  outer_cache.disable();
}

static inline __attribute__((always_inline)) void outer_nolock_flush_all(void)
{
 if (outer_cache.nolock_flush_all)
  outer_cache.nolock_flush_all();
}

static inline __attribute__((always_inline)) void outer_nolock_clean_all(void)
{
 if (outer_cache.nolock_clean_all)
  outer_cache.nolock_clean_all();
}
# 104 "../../arch/arm/include/asm/outercache.h"
static inline __attribute__((always_inline)) void outer_sync(void)
{
 if (outer_cache.sync)
  outer_cache.sync();
}
# 64 "../../arch/arm/include/asm/system.h" 2



struct thread_info;
struct task_struct;


extern unsigned int system_rev;
extern unsigned int system_serial_low;
extern unsigned int system_serial_high;
extern unsigned int mem_fclk_21285;

struct pt_regs;

void die(const char *msg, struct pt_regs *regs, int err);

struct siginfo;
void arm_notify_die(const char *str, struct pt_regs *regs, struct siginfo *info,
  unsigned long err, unsigned long trap);

void hook_fault_code(int nr, int (*fn)(unsigned long, unsigned int,
           struct pt_regs *),
       int sig, const char *name);




extern void __backtrace(void);
extern void c_backtrace(unsigned long fp, int pmode);

struct mm_struct;
extern void show_pte(struct mm_struct *mm, unsigned long addr);
extern void __show_regs(struct pt_regs *);

extern int cpu_architecture(void);
extern void cpu_init(void);
extern void cpu_idle_wait(void);

void arm_machine_restart(char mode, const char *cmd);
extern void (*arm_pm_restart)(char str, const char *cmd);







extern unsigned int user_debug;
# 171 "../../arch/arm/include/asm/system.h"
extern unsigned long cr_no_alignment;
extern unsigned long cr_alignment;

static inline __attribute__((always_inline)) unsigned int get_cr(void)
{
 unsigned int val;
 asm("mrc p15, 0, %0, c1, c0, 0	@ get CR" : "=r" (val) : : "cc");
 return val;
}

static inline __attribute__((always_inline)) void set_cr(unsigned int val)
{
 asm volatile("mcr p15, 0, %0, c1, c0, 0	@ set CR"
   : : "r" (val) : "cc");
 __asm__ __volatile__ ("isb" : : : "memory");
}
# 196 "../../arch/arm/include/asm/system.h"
static inline __attribute__((always_inline)) unsigned int get_copro_access(void)
{
 unsigned int val;
 asm("mrc p15, 0, %0, c1, c0, 2 @ get copro access"
   : "=r" (val) : : "cc");
 return val;
}

static inline __attribute__((always_inline)) void set_copro_access(unsigned int val)
{
 asm volatile("mcr p15, 0, %0, c1, c0, 2 @ set copro access"
   : : "r" (val) : "cc");
 __asm__ __volatile__ ("isb" : : : "memory");
}
# 223 "../../arch/arm/include/asm/system.h"
extern struct task_struct *__switch_to(struct task_struct *, struct thread_info *, struct thread_info *);
# 249 "../../arch/arm/include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
{
 extern void __bad_xchg(volatile void *, int);
 unsigned long ret;




 unsigned int tmp;


 __asm__ __volatile__ ("dmb" : : : "memory");

 switch (size) {

 case 1:
  asm volatile("@	__xchg1\n"
  "1:	ldrexb	%0, [%3]\n"
  "	strexb	%1, %2, [%3]\n"
  "	teq	%1, #0\n"
  "	bne	1b"
   : "=&r" (ret), "=&r" (tmp)
   : "r" (x), "r" (ptr)
   : "memory", "cc");
  break;
 case 4:
  asm volatile("@	__xchg4\n"
  "1:	ldrex	%0, [%3]\n"
  "	strex	%1, %2, [%3]\n"
  "	teq	%1, #0\n"
  "	bne	1b"
   : "=&r" (ret), "=&r" (tmp)
   : "r" (x), "r" (ptr)
   : "memory", "cc");
  break;
# 317 "../../arch/arm/include/asm/system.h"
 default:
  __bad_xchg(ptr, size), ret = 0;
  break;
 }
 __asm__ __volatile__ ("dmb" : : : "memory");

 return ret;
}

extern void disable_hlt(void);
extern void enable_hlt(void);

# 1 "../../include/asm-generic/cmpxchg-local.h" 1





extern unsigned long wrong_size_cmpxchg(volatile void *ptr);





static inline __attribute__((always_inline)) unsigned long __cmpxchg_local_generic(volatile void *ptr,
  unsigned long old, unsigned long new, int size)
{
 unsigned long flags, prev;




 if (size == 8 && sizeof(unsigned long) != 8)
  wrong_size_cmpxchg(ptr);

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); }); do { } while (0); } while (0);
 switch (size) {
 case 1: prev = *(u8 *)ptr;
  if (prev == old)
   *(u8 *)ptr = (u8)new;
  break;
 case 2: prev = *(u16 *)ptr;
  if (prev == old)
   *(u16 *)ptr = (u16)new;
  break;
 case 4: prev = *(u32 *)ptr;
  if (prev == old)
   *(u32 *)ptr = (u32)new;
  break;
 case 8: prev = *(u64 *)ptr;
  if (prev == old)
   *(u64 *)ptr = (u64)new;
  break;
 default:
  wrong_size_cmpxchg(ptr);
 }
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (({ (int)((flags) & 0x00000080); })) { __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); do { } while (0); } else { do { } while (0); __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); } } while (0);
 return prev;
}




static inline __attribute__((always_inline)) u64 __cmpxchg64_local_generic(volatile void *ptr,
  u64 old, u64 new)
{
 u64 prev;
 unsigned long flags;

 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); }); do { } while (0); } while (0);
 prev = *(u64 *)ptr;
 if (prev == old)
  *(u64 *)ptr = new;
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (({ (int)((flags) & 0x00000080); })) { __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); do { } while (0); } else { do { } while (0); __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); } } while (0);
 return prev;
}
# 330 "../../arch/arm/include/asm/system.h" 2
# 352 "../../arch/arm/include/asm/system.h"
extern void __bad_cmpxchg(volatile void *ptr, int size);





static inline __attribute__((always_inline)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
          unsigned long new, int size)
{
 unsigned long oldval, res;

 switch (size) {

 case 1:
  do {
   asm volatile("@ __cmpxchg1\n"
   "	ldrexb	%1, [%2]\n"
   "	mov	%0, #0\n"
   "	teq	%1, %3\n"
   "	strexbeq %0, %4, [%2]\n"
    : "=&r" (res), "=&r" (oldval)
    : "r" (ptr), "Ir" (old), "r" (new)
    : "memory", "cc");
  } while (res);
  break;
 case 2:
  do {
   asm volatile("@ __cmpxchg1\n"
   "	ldrexh	%1, [%2]\n"
   "	mov	%0, #0\n"
   "	teq	%1, %3\n"
   "	strexheq %0, %4, [%2]\n"
    : "=&r" (res), "=&r" (oldval)
    : "r" (ptr), "Ir" (old), "r" (new)
    : "memory", "cc");
  } while (res);
  break;

 case 4:
  do {
   asm volatile("@ __cmpxchg4\n"
   "	ldrex	%1, [%2]\n"
   "	mov	%0, #0\n"
   "	teq	%1, %3\n"
   "	strexeq %0, %4, [%2]\n"
    : "=&r" (res), "=&r" (oldval)
    : "r" (ptr), "Ir" (old), "r" (new)
    : "memory", "cc");
  } while (res);
  break;
 default:
  __bad_cmpxchg(ptr, size);
  oldval = 0;
 }

 return oldval;
}

static inline __attribute__((always_inline)) unsigned long __cmpxchg_mb(volatile void *ptr, unsigned long old,
      unsigned long new, int size)
{
 unsigned long ret;

 __asm__ __volatile__ ("dmb" : : : "memory");
 ret = __cmpxchg(ptr, old, new, size);
 __asm__ __volatile__ ("dmb" : : : "memory");

 return ret;
}







static inline __attribute__((always_inline)) unsigned long __cmpxchg_local(volatile void *ptr,
         unsigned long old,
         unsigned long new, int size)
{
 unsigned long ret;

 switch (size) {






 default:
  ret = __cmpxchg(ptr, old, new, size);
 }

 return ret;
}
# 461 "../../arch/arm/include/asm/system.h"
static inline __attribute__((always_inline)) unsigned long long __cmpxchg64(volatile void *ptr,
          unsigned long long old,
          unsigned long long new)
{
 register unsigned long long oldval asm("r0");
 register unsigned long long __old asm("r2") = old;
 register unsigned long long __new asm("r4") = new;
 unsigned long res;

 do {
  asm volatile(
  "	@ __cmpxchg8\n"
  "	ldrexd	%1, %H1, [%2]\n"
  "	mov	%0, #0\n"
  "	teq	%1, %3\n"
  "	teqeq	%H1, %H3\n"
  "	strexdeq %0, %4, %H4, [%2]\n"
   : "=&r" (res), "=&r" (oldval)
   : "r" (ptr), "Ir" (__old), "r" (__new)
   : "memory", "cc");
 } while (res);

 return oldval;
}

static inline __attribute__((always_inline)) unsigned long long __cmpxchg64_mb(volatile void *ptr,
      unsigned long long old,
      unsigned long long new)
{
 unsigned long long ret;

 __asm__ __volatile__ ("dmb" : : : "memory");
 ret = __cmpxchg64(ptr, old, new);
 __asm__ __volatile__ ("dmb" : : : "memory");

 return ret;
}
# 8 "../../include/linux/list.h" 2
# 19 "../../include/linux/list.h"
struct list_head {
 struct list_head *next, *prev;
};






static inline __attribute__((always_inline)) void INIT_LIST_HEAD(struct list_head *list)
{
 list->next = list;
 list->prev = list;
}
# 41 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 next->prev = new;
 new->next = next;
 new->prev = prev;
 prev->next = new;
}
# 64 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 78 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}
# 90 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 prev->next = next;
}
# 103 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->next = ((void *) 0x00100100 + 0);
 entry->prev = ((void *) 0x00200200 + 0);
}
# 120 "../../include/linux/list.h"
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
# 202 "../../include/linux/list.h"
static inline __attribute__((always_inline)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next;
 return (next == head) && (next == head->prev);
}





static inline __attribute__((always_inline)) void list_rotate_left(struct list_head *head)
{
 struct list_head *first;

 if (!list_empty(head)) {
  first = head->next;
  list_move_tail(first, head);
 }
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
# 257 "../../include/linux/list.h"
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
# 316 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 333 "../../include/linux/list.h"
static inline __attribute__((always_inline)) void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}
# 569 "../../include/linux/list.h"
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
 n->next = ((void *) 0x00100100 + 0);
 n->pprev = ((void *) 0x00200200 + 0);
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
# 14 "../../include/linux/mutex.h" 2
# 1 "../../include/linux/spinlock_types.h" 1
# 13 "../../include/linux/spinlock_types.h"
# 1 "../../arch/arm/include/asm/spinlock_types.h" 1







typedef struct {
 volatile unsigned int lock;
} arch_spinlock_t;



typedef struct {
 volatile unsigned int lock;
} arch_rwlock_t;
# 14 "../../include/linux/spinlock_types.h" 2




# 1 "../../include/linux/lockdep.h" 1
# 12 "../../include/linux/lockdep.h"
struct task_struct;
struct lockdep_map;


extern int prove_locking;
extern int lock_stat;
# 337 "../../include/linux/lockdep.h"
static inline __attribute__((always_inline)) void lockdep_off(void)
{
}

static inline __attribute__((always_inline)) void lockdep_on(void)
{
}
# 378 "../../include/linux/lockdep.h"
struct lock_class_key { };
# 428 "../../include/linux/lockdep.h"
extern void early_init_irq_lock_class(void);
# 440 "../../include/linux/lockdep.h"
static inline __attribute__((always_inline)) void early_boot_irqs_off(void)
{
}
static inline __attribute__((always_inline)) void early_boot_irqs_on(void)
{
}
static inline __attribute__((always_inline)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 19 "../../include/linux/spinlock_types.h" 2

typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;

 unsigned int break_lock;
# 32 "../../include/linux/spinlock_types.h"
} raw_spinlock_t;
# 64 "../../include/linux/spinlock_types.h"
typedef struct spinlock {
 union {
  struct raw_spinlock rlock;
# 75 "../../include/linux/spinlock_types.h"
 };
} spinlock_t;
# 94 "../../include/linux/spinlock_types.h"
# 1 "../../include/linux/rwlock_types.h" 1
# 11 "../../include/linux/rwlock_types.h"
typedef struct {
 arch_rwlock_t raw_lock;

 unsigned int break_lock;
# 23 "../../include/linux/rwlock_types.h"
} rwlock_t;
# 95 "../../include/linux/spinlock_types.h" 2
# 15 "../../include/linux/mutex.h" 2



# 1 "../../arch/arm/include/asm/atomic.h" 1
# 37 "../../arch/arm/include/asm/atomic.h"
static inline __attribute__((always_inline)) void atomic_add(int i, atomic_t *v)
{
 unsigned long tmp;
 int result;

 __asm__ __volatile__("@ atomic_add\n"
"1:	ldrex	%0, [%3]\n"
"	add	%0, %0, %4\n"
"	strex	%1, %0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "Ir" (i)
 : "cc");
}

static inline __attribute__((always_inline)) int atomic_add_return(int i, atomic_t *v)
{
 unsigned long tmp;
 int result;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic_add_return\n"
"1:	ldrex	%0, [%3]\n"
"	add	%0, %0, %4\n"
"	strex	%1, %0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "Ir" (i)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");

 return result;
}

static inline __attribute__((always_inline)) void atomic_sub(int i, atomic_t *v)
{
 unsigned long tmp;
 int result;

 __asm__ __volatile__("@ atomic_sub\n"
"1:	ldrex	%0, [%3]\n"
"	sub	%0, %0, %4\n"
"	strex	%1, %0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "Ir" (i)
 : "cc");
}

static inline __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t *v)
{
 unsigned long tmp;
 int result;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic_sub_return\n"
"1:	ldrex	%0, [%3]\n"
"	sub	%0, %0, %4\n"
"	strex	%1, %0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "Ir" (i)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");

 return result;
}

static inline __attribute__((always_inline)) int atomic_cmpxchg(atomic_t *ptr, int old, int new)
{
 unsigned long oldval, res;

 __asm__ __volatile__ ("dmb" : : : "memory");

 do {
  __asm__ __volatile__("@ atomic_cmpxchg\n"
  "ldrex	%1, [%3]\n"
  "mov	%0, #0\n"
  "teq	%1, %4\n"
  "strexeq %0, %5, [%3]\n"
      : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
      : "r" (&ptr->counter), "Ir" (old), "r" (new)
      : "cc");
 } while (res);

 __asm__ __volatile__ ("dmb" : : : "memory");

 return oldval;
}

static inline __attribute__((always_inline)) void atomic_clear_mask(unsigned long mask, unsigned long *addr)
{
 unsigned long tmp, tmp2;

 __asm__ __volatile__("@ atomic_clear_mask\n"
"1:	ldrex	%0, [%3]\n"
"	bic	%0, %0, %4\n"
"	strex	%1, %0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (tmp), "=&r" (tmp2), "+Qo" (*addr)
 : "r" (addr), "Ir" (mask)
 : "cc");
}
# 211 "../../arch/arm/include/asm/atomic.h"
static inline __attribute__((always_inline)) int atomic_add_unless(atomic_t *v, int a, int u)
{
 int c, old;

 c = (*(volatile int *)&(v)->counter);
 while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
  c = old;
 return c != u;
}
# 239 "../../arch/arm/include/asm/atomic.h"
typedef struct {
 u64 __attribute__((aligned(8))) counter;
} atomic64_t;



static inline __attribute__((always_inline)) u64 atomic64_read(atomic64_t *v)
{
 u64 result;

 __asm__ __volatile__("@ atomic64_read\n"
"	ldrexd	%0, %H0, [%1]"
 : "=&r" (result)
 : "r" (&v->counter), "Qo" (v->counter)
 );

 return result;
}

static inline __attribute__((always_inline)) void atomic64_set(atomic64_t *v, u64 i)
{
 u64 tmp;

 __asm__ __volatile__("@ atomic64_set\n"
"1:	ldrexd	%0, %H0, [%2]\n"
"	strexd	%0, %3, %H3, [%2]\n"
"	teq	%0, #0\n"
"	bne	1b"
 : "=&r" (tmp), "=Qo" (v->counter)
 : "r" (&v->counter), "r" (i)
 : "cc");
}

static inline __attribute__((always_inline)) void atomic64_add(u64 i, atomic64_t *v)
{
 u64 result;
 unsigned long tmp;

 __asm__ __volatile__("@ atomic64_add\n"
"1:	ldrexd	%0, %H0, [%3]\n"
"	adds	%0, %0, %4\n"
"	adc	%H0, %H0, %H4\n"
"	strexd	%1, %0, %H0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "r" (i)
 : "cc");
}

static inline __attribute__((always_inline)) u64 atomic64_add_return(u64 i, atomic64_t *v)
{
 u64 result;
 unsigned long tmp;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic64_add_return\n"
"1:	ldrexd	%0, %H0, [%3]\n"
"	adds	%0, %0, %4\n"
"	adc	%H0, %H0, %H4\n"
"	strexd	%1, %0, %H0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "r" (i)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");

 return result;
}

static inline __attribute__((always_inline)) void atomic64_sub(u64 i, atomic64_t *v)
{
 u64 result;
 unsigned long tmp;

 __asm__ __volatile__("@ atomic64_sub\n"
"1:	ldrexd	%0, %H0, [%3]\n"
"	subs	%0, %0, %4\n"
"	sbc	%H0, %H0, %H4\n"
"	strexd	%1, %0, %H0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "r" (i)
 : "cc");
}

static inline __attribute__((always_inline)) u64 atomic64_sub_return(u64 i, atomic64_t *v)
{
 u64 result;
 unsigned long tmp;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic64_sub_return\n"
"1:	ldrexd	%0, %H0, [%3]\n"
"	subs	%0, %0, %4\n"
"	sbc	%H0, %H0, %H4\n"
"	strexd	%1, %0, %H0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "r" (i)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");

 return result;
}

static inline __attribute__((always_inline)) u64 atomic64_cmpxchg(atomic64_t *ptr, u64 old, u64 new)
{
 u64 oldval;
 unsigned long res;

 __asm__ __volatile__ ("dmb" : : : "memory");

 do {
  __asm__ __volatile__("@ atomic64_cmpxchg\n"
  "ldrexd		%1, %H1, [%3]\n"
  "mov		%0, #0\n"
  "teq		%1, %4\n"
  "teqeq		%H1, %H4\n"
  "strexdeq	%0, %5, %H5, [%3]"
  : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
  : "r" (&ptr->counter), "r" (old), "r" (new)
  : "cc");
 } while (res);

 __asm__ __volatile__ ("dmb" : : : "memory");

 return oldval;
}

static inline __attribute__((always_inline)) u64 atomic64_xchg(atomic64_t *ptr, u64 new)
{
 u64 result;
 unsigned long tmp;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic64_xchg\n"
"1:	ldrexd	%0, %H0, [%3]\n"
"	strexd	%1, %4, %H4, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (result), "=&r" (tmp), "+Qo" (ptr->counter)
 : "r" (&ptr->counter), "r" (new)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");

 return result;
}

static inline __attribute__((always_inline)) u64 atomic64_dec_if_positive(atomic64_t *v)
{
 u64 result;
 unsigned long tmp;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic64_dec_if_positive\n"
"1:	ldrexd	%0, %H0, [%3]\n"
"	subs	%0, %0, #1\n"
"	sbc	%H0, %H0, #0\n"
"	teq	%H0, #0\n"
"	bmi	2f\n"
"	strexd	%1, %0, %H0, [%3]\n"
"	teq	%1, #0\n"
"	bne	1b\n"
"2:"
 : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");

 return result;
}

static inline __attribute__((always_inline)) int atomic64_add_unless(atomic64_t *v, u64 a, u64 u)
{
 u64 val;
 unsigned long tmp;
 int ret = 1;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__("@ atomic64_add_unless\n"
"1:	ldrexd	%0, %H0, [%4]\n"
"	teq	%0, %5\n"
"	teqeq	%H0, %H5\n"
"	moveq	%1, #0\n"
"	beq	2f\n"
"	adds	%0, %0, %6\n"
"	adc	%H0, %H0, %H6\n"
"	strexd	%2, %0, %H0, [%4]\n"
"	teq	%2, #0\n"
"	bne	1b\n"
"2:"
 : "=&r" (val), "+r" (ret), "=&r" (tmp), "+Qo" (v->counter)
 : "r" (&v->counter), "r" (u), "r" (a)
 : "cc");

 if (ret)
  __asm__ __volatile__ ("dmb" : : : "memory");

 return ret;
}
# 466 "../../arch/arm/include/asm/atomic.h"
# 1 "../../include/asm-generic/atomic-long.h" 1
# 141 "../../include/asm-generic/atomic-long.h"
typedef atomic_t atomic_long_t;


static inline __attribute__((always_inline)) long atomic_long_read(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)(*(volatile int *)&(v)->counter);
}

static inline __attribute__((always_inline)) void atomic_long_set(atomic_long_t *l, long i)
{
 atomic_t *v = (atomic_t *)l;

 (((v)->counter) = (i));
}

static inline __attribute__((always_inline)) void atomic_long_inc(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_add(1, v);
}

static inline __attribute__((always_inline)) void atomic_long_dec(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 atomic_sub(1, v);
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

 return (atomic_sub_return(i, v) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_dec_and_test(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_sub_return(1, v) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_inc_and_test(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_add_return(1, v) == 0);
}

static inline __attribute__((always_inline)) int atomic_long_add_negative(long i, atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (atomic_add_return(i, v) < 0);
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

 return (long)(atomic_add_return(1, v));
}

static inline __attribute__((always_inline)) long atomic_long_dec_return(atomic_long_t *l)
{
 atomic_t *v = (atomic_t *)l;

 return (long)(atomic_sub_return(1, v));
}

static inline __attribute__((always_inline)) long atomic_long_add_unless(atomic_long_t *l, long a, long u)
{
 atomic_t *v = (atomic_t *)l;

 return (long)atomic_add_unless(v, a, u);
}
# 467 "../../arch/arm/include/asm/atomic.h" 2
# 19 "../../include/linux/mutex.h" 2
# 48 "../../include/linux/mutex.h"
struct mutex {

 atomic_t count;
 spinlock_t wait_lock;
 struct list_head wait_list;

 struct thread_info *owner;
# 63 "../../include/linux/mutex.h"
};





struct mutex_waiter {
 struct list_head list;
 struct task_struct *task;



};
# 107 "../../include/linux/mutex.h"
extern void __mutex_init(struct mutex *lock, const char *name,
    struct lock_class_key *key);







static inline __attribute__((always_inline)) int mutex_is_locked(struct mutex *lock)
{
 return (*(volatile int *)&(&lock->count)->counter) != 1;
}
# 136 "../../include/linux/mutex.h"
extern void mutex_lock(struct mutex *lock);
extern int __attribute__((warn_unused_result)) mutex_lock_interruptible(struct mutex *lock);
extern int __attribute__((warn_unused_result)) mutex_lock_killable(struct mutex *lock);
# 151 "../../include/linux/mutex.h"
extern int mutex_trylock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);
extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
# 23 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/platform_device.h" 1
# 14 "../../include/linux/platform_device.h"
# 1 "../../include/linux/device.h" 1
# 16 "../../include/linux/device.h"
# 1 "../../include/linux/ioport.h" 1
# 18 "../../include/linux/ioport.h"
struct resource {
 resource_size_t start;
 resource_size_t end;
 const char *name;
 unsigned long flags;
 struct resource *parent, *sibling, *child;
};

struct resource_list {
 struct resource_list *next;
 struct resource *res;
 struct pci_dev *dev;
};
# 113 "../../include/linux/ioport.h"
extern struct resource ioport_resource;
extern struct resource iomem_resource;

extern struct resource *request_resource_conflict(struct resource *root, struct resource *new);
extern int request_resource(struct resource *root, struct resource *new);
extern int release_resource(struct resource *new);
void release_child_resources(struct resource *new);
extern void reserve_region_with_split(struct resource *root,
        resource_size_t start, resource_size_t end,
        const char *name);
extern struct resource *insert_resource_conflict(struct resource *parent, struct resource *new);
extern int insert_resource(struct resource *parent, struct resource *new);
extern void insert_resource_expand_to_fit(struct resource *root, struct resource *new);
extern int allocate_resource(struct resource *root, struct resource *new,
        resource_size_t size, resource_size_t min,
        resource_size_t max, resource_size_t align,
        resource_size_t (*alignf)(void *,
             const struct resource *,
             resource_size_t,
             resource_size_t),
        void *alignf_data);
int adjust_resource(struct resource *res, resource_size_t start,
      resource_size_t size);
resource_size_t resource_alignment(struct resource *res);
static inline __attribute__((always_inline)) resource_size_t resource_size(const struct resource *res)
{
 return res->end - res->start + 1;
}
static inline __attribute__((always_inline)) unsigned long resource_type(const struct resource *res)
{
 return res->flags & 0x00001f00;
}
# 155 "../../include/linux/ioport.h"
extern struct resource * __request_region(struct resource *,
     resource_size_t start,
     resource_size_t n,
     const char *name, int flags);






extern int __check_region(struct resource *, resource_size_t, resource_size_t);
extern void __release_region(struct resource *, resource_size_t,
    resource_size_t);

static inline __attribute__((always_inline)) int __attribute__((deprecated)) check_region(resource_size_t s,
      resource_size_t n)
{
 return __check_region(&ioport_resource, s, n);
}


struct device;





extern struct resource * __devm_request_region(struct device *dev,
    struct resource *parent, resource_size_t start,
    resource_size_t n, const char *name);






extern void __devm_release_region(struct device *dev, struct resource *parent,
      resource_size_t start, resource_size_t n);
extern int iomem_map_sanity_check(resource_size_t addr, unsigned long size);
extern int iomem_is_exclusive(u64 addr);

extern int
walk_system_ram_range(unsigned long start_pfn, unsigned long nr_pages,
  void *arg, int (*func)(unsigned long, unsigned long, void *));
# 17 "../../include/linux/device.h" 2
# 1 "../../include/linux/kobject.h" 1
# 21 "../../include/linux/kobject.h"
# 1 "../../include/linux/sysfs.h" 1
# 16 "../../include/linux/sysfs.h"
# 1 "../../include/linux/errno.h" 1
# 17 "../../include/linux/sysfs.h" 2




struct kobject;
struct module;
enum kobj_ns_type;






struct attribute {
 const char *name;
 struct module *owner;
 mode_t mode;




};
# 61 "../../include/linux/sysfs.h"
struct attribute_group {
 const char *name;
 mode_t (*is_visible)(struct kobject *,
           struct attribute *, int);
 struct attribute **attrs;
};
# 90 "../../include/linux/sysfs.h"
struct file;
struct vm_area_struct;

struct bin_attribute {
 struct attribute attr;
 size_t size;
 void *private;
 ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
   char *, loff_t, size_t);
 ssize_t (*write)(struct file *,struct kobject *, struct bin_attribute *,
    char *, loff_t, size_t);
 int (*mmap)(struct file *, struct kobject *, struct bin_attribute *attr,
      struct vm_area_struct *vma);
};
# 117 "../../include/linux/sysfs.h"
struct sysfs_ops {
 ssize_t (*show)(struct kobject *, struct attribute *,char *);
 ssize_t (*store)(struct kobject *,struct attribute *,const char *, size_t);
};

struct sysfs_dirent;



int sysfs_schedule_callback(struct kobject *kobj, void (*func)(void *),
       void *data, struct module *owner);

int __attribute__((warn_unused_result)) sysfs_create_dir(struct kobject *kobj);
void sysfs_remove_dir(struct kobject *kobj);
int __attribute__((warn_unused_result)) sysfs_rename_dir(struct kobject *kobj, const char *new_name);
int __attribute__((warn_unused_result)) sysfs_move_dir(struct kobject *kobj,
    struct kobject *new_parent_kobj);

int __attribute__((warn_unused_result)) sysfs_create_file(struct kobject *kobj,
       const struct attribute *attr);
int __attribute__((warn_unused_result)) sysfs_create_files(struct kobject *kobj,
       const struct attribute **attr);
int __attribute__((warn_unused_result)) sysfs_chmod_file(struct kobject *kobj, struct attribute *attr,
      mode_t mode);
void sysfs_remove_file(struct kobject *kobj, const struct attribute *attr);
void sysfs_remove_files(struct kobject *kobj, const struct attribute **attr);

int __attribute__((warn_unused_result)) sysfs_create_bin_file(struct kobject *kobj,
           const struct bin_attribute *attr);
void sysfs_remove_bin_file(struct kobject *kobj,
      const struct bin_attribute *attr);

int __attribute__((warn_unused_result)) sysfs_create_link(struct kobject *kobj, struct kobject *target,
       const char *name);
int __attribute__((warn_unused_result)) sysfs_create_link_nowarn(struct kobject *kobj,
       struct kobject *target,
       const char *name);
void sysfs_remove_link(struct kobject *kobj, const char *name);

int sysfs_rename_link(struct kobject *kobj, struct kobject *target,
   const char *old_name, const char *new_name);

void sysfs_delete_link(struct kobject *dir, struct kobject *targ,
   const char *name);

int __attribute__((warn_unused_result)) sysfs_create_group(struct kobject *kobj,
        const struct attribute_group *grp);
int sysfs_update_group(struct kobject *kobj,
         const struct attribute_group *grp);
void sysfs_remove_group(struct kobject *kobj,
   const struct attribute_group *grp);
int sysfs_add_file_to_group(struct kobject *kobj,
   const struct attribute *attr, const char *group);
void sysfs_remove_file_from_group(struct kobject *kobj,
   const struct attribute *attr, const char *group);

void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr);
void sysfs_notify_dirent(struct sysfs_dirent *sd);
struct sysfs_dirent *sysfs_get_dirent(struct sysfs_dirent *parent_sd,
          const void *ns,
          const unsigned char *name);
struct sysfs_dirent *sysfs_get(struct sysfs_dirent *sd);
void sysfs_put(struct sysfs_dirent *sd);
void sysfs_printk_last_file(void);


void sysfs_exit_ns(enum kobj_ns_type type, const void *tag);

int __attribute__((warn_unused_result)) sysfs_init(void);
# 22 "../../include/linux/kobject.h" 2

# 1 "../../include/linux/spinlock.h" 1
# 50 "../../include/linux/spinlock.h"
# 1 "../../include/linux/preempt.h" 1
# 9 "../../include/linux/preempt.h"
# 1 "../../include/linux/thread_info.h" 1
# 12 "../../include/linux/thread_info.h"
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
   u32 *uaddr2;
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

# 1 "../../include/linux/bitops.h" 1
# 13 "../../include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);





# 1 "../../arch/arm/include/asm/bitops.h" 1
# 37 "../../arch/arm/include/asm/bitops.h"
static inline __attribute__((always_inline)) void ____atomic_set_bit(unsigned int bit, volatile unsigned long *p)
{
 unsigned long flags;
 unsigned long mask = 1UL << (bit & 31);

 p += bit >> 5;

 ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); });
 *p |= mask;
 __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc");
}

static inline __attribute__((always_inline)) void ____atomic_clear_bit(unsigned int bit, volatile unsigned long *p)
{
 unsigned long flags;
 unsigned long mask = 1UL << (bit & 31);

 p += bit >> 5;

 ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); });
 *p &= ~mask;
 __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc");
}

static inline __attribute__((always_inline)) void ____atomic_change_bit(unsigned int bit, volatile unsigned long *p)
{
 unsigned long flags;
 unsigned long mask = 1UL << (bit & 31);

 p += bit >> 5;

 ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); });
 *p ^= mask;
 __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc");
}

static inline __attribute__((always_inline)) int
____atomic_test_and_set_bit(unsigned int bit, volatile unsigned long *p)
{
 unsigned long flags;
 unsigned int res;
 unsigned long mask = 1UL << (bit & 31);

 p += bit >> 5;

 ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); });
 res = *p;
 *p = res | mask;
 __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc");

 return (res & mask) != 0;
}

static inline __attribute__((always_inline)) int
____atomic_test_and_clear_bit(unsigned int bit, volatile unsigned long *p)
{
 unsigned long flags;
 unsigned int res;
 unsigned long mask = 1UL << (bit & 31);

 p += bit >> 5;

 ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); });
 res = *p;
 *p = res & ~mask;
 __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc");

 return (res & mask) != 0;
}

static inline __attribute__((always_inline)) int
____atomic_test_and_change_bit(unsigned int bit, volatile unsigned long *p)
{
 unsigned long flags;
 unsigned int res;
 unsigned long mask = 1UL << (bit & 31);

 p += bit >> 5;

 ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_irq_save\n" "cpsid	i" : "=r" (flags) : : "memory", "cc"); });
 res = *p;
 *p = res ^ mask;
 __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc");

 return (res & mask) != 0;
}

# 1 "../../include/asm-generic/bitops/non-atomic.h" 1
# 15 "../../include/asm-generic/bitops/non-atomic.h"
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
# 40 "../../include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) void __change_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);

 *p ^= mask;
}
# 57 "../../include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline)) int __test_and_set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 32));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 32);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 76 "../../include/asm-generic/bitops/non-atomic.h"
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
# 125 "../../arch/arm/include/asm/bitops.h" 2
# 154 "../../arch/arm/include/asm/bitops.h"
extern void _set_bit_le(int nr, volatile unsigned long * p);
extern void _clear_bit_le(int nr, volatile unsigned long * p);
extern void _change_bit_le(int nr, volatile unsigned long * p);
extern int _test_and_set_bit_le(int nr, volatile unsigned long * p);
extern int _test_and_clear_bit_le(int nr, volatile unsigned long * p);
extern int _test_and_change_bit_le(int nr, volatile unsigned long * p);
extern int _find_first_zero_bit_le(const void * p, unsigned size);
extern int _find_next_zero_bit_le(const void * p, int size, int offset);
extern int _find_first_bit_le(const unsigned long *p, unsigned size);
extern int _find_next_bit_le(const unsigned long *p, int size, int offset);




extern void _set_bit_be(int nr, volatile unsigned long * p);
extern void _clear_bit_be(int nr, volatile unsigned long * p);
extern void _change_bit_be(int nr, volatile unsigned long * p);
extern int _test_and_set_bit_be(int nr, volatile unsigned long * p);
extern int _test_and_clear_bit_be(int nr, volatile unsigned long * p);
extern int _test_and_change_bit_be(int nr, volatile unsigned long * p);
extern int _find_first_zero_bit_be(const void * p, unsigned size);
extern int _find_next_zero_bit_be(const void * p, int size, int offset);
extern int _find_first_bit_be(const unsigned long *p, unsigned size);
extern int _find_next_bit_be(const unsigned long *p, int size, int offset);
# 247 "../../arch/arm/include/asm/bitops.h"
static inline __attribute__((always_inline)) int constant_fls(int x)
{
 int r = 32;

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






static inline __attribute__((always_inline)) int fls(int x)
{
 int ret;

 if (__builtin_constant_p(x))
        return constant_fls(x);

 asm("clz\t%0, %1" : "=r" (ret) : "r" (x) : "cc");
        ret = 32 - ret;
 return ret;
}
# 300 "../../arch/arm/include/asm/bitops.h"
# 1 "../../include/asm-generic/bitops/fls64.h" 1
# 18 "../../include/asm-generic/bitops/fls64.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) int fls64(__u64 x)
{
 __u32 h = x >> 32;
 if (h)
  return fls(h) + 32;
 return fls(x);
}
# 301 "../../arch/arm/include/asm/bitops.h" 2

# 1 "../../include/asm-generic/bitops/sched.h" 1
# 12 "../../include/asm-generic/bitops/sched.h"
static inline __attribute__((always_inline)) int sched_find_first_bit(const unsigned long *b)
{





 if (b[0])
  return (({ unsigned long __t = (b[0]); fls(__t & -__t); }) - 1);
 if (b[1])
  return (({ unsigned long __t = (b[1]); fls(__t & -__t); }) - 1) + 32;
 if (b[2])
  return (({ unsigned long __t = (b[2]); fls(__t & -__t); }) - 1) + 64;
 return (({ unsigned long __t = (b[3]); fls(__t & -__t); }) - 1) + 96;



}
# 303 "../../arch/arm/include/asm/bitops.h" 2
# 1 "../../include/asm-generic/bitops/hweight.h" 1



# 1 "../../include/asm-generic/bitops/arch_hweight.h" 1





static inline __attribute__((always_inline)) unsigned int __arch_hweight32(unsigned int w)
{
 return __sw_hweight32(w);
}

static inline __attribute__((always_inline)) unsigned int __arch_hweight16(unsigned int w)
{
 return __sw_hweight16(w);
}

static inline __attribute__((always_inline)) unsigned int __arch_hweight8(unsigned int w)
{
 return __sw_hweight8(w);
}

static inline __attribute__((always_inline)) unsigned long __arch_hweight64(__u64 w)
{
 return __sw_hweight64(w);
}
# 5 "../../include/asm-generic/bitops/hweight.h" 2
# 1 "../../include/asm-generic/bitops/const_hweight.h" 1
# 6 "../../include/asm-generic/bitops/hweight.h" 2
# 304 "../../arch/arm/include/asm/bitops.h" 2
# 1 "../../include/asm-generic/bitops/lock.h" 1
# 305 "../../arch/arm/include/asm/bitops.h" 2
# 23 "../../include/linux/bitops.h" 2






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
 return sizeof(w) == 4 ? (__builtin_constant_p(w) ? ((( (!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))) ) + ( (!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7))) )) + (( (!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))) ) + ( (!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))) ))) : __arch_hweight32(w)) : (__builtin_constant_p(w) ? (((( (!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))) ) + ( (!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7))) )) + (( (!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))) ) + ( (!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))) ))) + ((( (!!(((w) >> 32) & (1ULL << 0))) + (!!(((w) >> 32) & (1ULL << 1))) + (!!(((w) >> 32) & (1ULL << 2))) + (!!(((w) >> 32) & (1ULL << 3))) + (!!(((w) >> 32) & (1ULL << 4))) + (!!(((w) >> 32) & (1ULL << 5))) + (!!(((w) >> 32) & (1ULL << 6))) + (!!(((w) >> 32) & (1ULL << 7))) ) + ( (!!((((w) >> 32) >> 8) & (1ULL << 0))) + (!!((((w) >> 32) >> 8) & (1ULL << 1))) + (!!((((w) >> 32) >> 8) & (1ULL << 2))) + (!!((((w) >> 32) >> 8) & (1ULL << 3))) + (!!((((w) >> 32) >> 8) & (1ULL << 4))) + (!!((((w) >> 32) >> 8) & (1ULL << 5))) + (!!((((w) >> 32) >> 8) & (1ULL << 6))) + (!!((((w) >> 32) >> 8) & (1ULL << 7))) )) + (( (!!((((w) >> 32) >> 16) & (1ULL << 0))) + (!!((((w) >> 32) >> 16) & (1ULL << 1))) + (!!((((w) >> 32) >> 16) & (1ULL << 2))) + (!!((((w) >> 32) >> 16) & (1ULL << 3))) + (!!((((w) >> 32) >> 16) & (1ULL << 4))) + (!!((((w) >> 32) >> 16) & (1ULL << 5))) + (!!((((w) >> 32) >> 16) & (1ULL << 6))) + (!!((((w) >> 32) >> 16) & (1ULL << 7))) ) + ( (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 0))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 1))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 2))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 3))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 4))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 5))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 6))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 7))) )))) : __arch_hweight64(w));
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
# 127 "../../include/linux/bitops.h"
static inline __attribute__((always_inline)) unsigned long __ffs64(u64 word)
{

 if (((u32)word) == 0UL)
  return (({ unsigned long __t = ((u32)(word >> 32)); fls(__t & -__t); }) - 1) + 32;



 return (({ unsigned long __t = ((unsigned long)word); fls(__t & -__t); }) - 1);
}
# 170 "../../include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 56 "../../include/linux/thread_info.h" 2
# 1 "../../arch/arm/include/asm/thread_info.h" 1
# 16 "../../arch/arm/include/asm/thread_info.h"
# 1 "../../arch/arm/include/asm/fpstate.h" 1
# 26 "../../arch/arm/include/asm/fpstate.h"
struct vfp_hard_struct {

 __u64 fpregs[32];






 __u32 fpexc;
 __u32 fpscr;



 __u32 fpinst;
 __u32 fpinst2;


 __u32 cpu;

};

union vfp_state {
 struct vfp_hard_struct hard;
};

extern void vfp_flush_thread(union vfp_state *);
extern void vfp_release_thread(union vfp_state *);



struct fp_hard_struct {
 unsigned int save[35];
};



struct fp_soft_struct {
 unsigned int save[35];
};



struct iwmmxt_struct {
 unsigned int save[0x98 / sizeof(unsigned int)];
};

union fp_state {
 struct fp_hard_struct hard;
 struct fp_soft_struct soft;



};



struct crunch_state {
 unsigned int mvdx[16][2];
 unsigned int mvax[4][3];
 unsigned int dspsc[2];
};
# 17 "../../arch/arm/include/asm/thread_info.h" 2







struct task_struct;
struct exec_domain;


# 1 "../../arch/arm/include/asm/domain.h" 1
# 29 "../../arch/arm/include/asm/thread_info.h" 2

typedef unsigned long mm_segment_t;

struct cpu_context_save {
 __u32 r4;
 __u32 r5;
 __u32 r6;
 __u32 r7;
 __u32 r8;
 __u32 r9;
 __u32 sl;
 __u32 fp;
 __u32 sp;
 __u32 pc;
 __u32 extra[2];
};





struct thread_info {
 unsigned long flags;
 int preempt_count;
 mm_segment_t addr_limit;
 struct task_struct *task;
 struct exec_domain *exec_domain;
 __u32 cpu;
 __u32 cpu_domain;
 struct cpu_context_save cpu_context;
 __u32 syscall;
 __u8 used_cp[16];
 unsigned long tp_value;
 struct crunch_state crunchstate;
 union fp_state fpstate __attribute__((aligned(8)));
 union vfp_state vfpstate;



 struct restart_block restart_block;
};
# 92 "../../arch/arm/include/asm/thread_info.h"
static inline __attribute__((always_inline)) struct thread_info *current_thread_info(void) __attribute__((__const__));

static inline __attribute__((always_inline)) struct thread_info *current_thread_info(void)
{
 register unsigned long sp asm ("sp");
 return (struct thread_info *)(sp & ~(8192 - 1));
}
# 107 "../../arch/arm/include/asm/thread_info.h"
extern void crunch_task_disable(struct thread_info *);
extern void crunch_task_copy(struct thread_info *, void *);
extern void crunch_task_restore(struct thread_info *, void *);
extern void crunch_task_release(struct thread_info *);

extern void iwmmxt_task_disable(struct thread_info *);
extern void iwmmxt_task_copy(struct thread_info *, void *);
extern void iwmmxt_task_restore(struct thread_info *, void *);
extern void iwmmxt_task_release(struct thread_info *);
extern void iwmmxt_task_switch(struct thread_info *);

extern void vfp_sync_hwstate(struct thread_info *);
extern void vfp_flush_hwstate(struct thread_info *);
# 57 "../../include/linux/thread_info.h" 2
# 65 "../../include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
 _set_bit_le(flag,(unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 _clear_bit_le(flag,(unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
 return _test_and_set_bit_le(flag,(unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 return _test_and_clear_bit_le(flag,(unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_bit(flag, (unsigned long *)&ti->flags);
}
# 122 "../../include/linux/thread_info.h"
static inline __attribute__((always_inline)) void set_restore_sigmask(void)
{
 set_ti_thread_flag(current_thread_info(), 20);
 set_ti_thread_flag(current_thread_info(), 0);
}
# 10 "../../include/linux/preempt.h" 2
# 28 "../../include/linux/preempt.h"
 void preempt_schedule(void);
# 51 "../../include/linux/spinlock.h" 2



# 1 "../../include/linux/kernel.h" 1
# 12 "../../include/linux/kernel.h"
# 1 "/drive2/files/Android/ICS/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include/stdarg.h" 1 3 4
# 40 "/drive2/files/Android/ICS/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 102 "/drive2/files/Android/ICS/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 13 "../../include/linux/kernel.h" 2





# 1 "../../include/linux/log2.h" 1
# 21 "../../include/linux/log2.h"
extern __attribute__((const, noreturn))
int ____ilog2_NaN(void);
# 31 "../../include/linux/log2.h"
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
# 19 "../../include/linux/kernel.h" 2

# 1 "../../include/linux/dynamic_debug.h" 1







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
# 76 "../../include/linux/dynamic_debug.h"
static inline __attribute__((always_inline)) int ddebug_remove_module(const char *mod)
{
 return 0;
}
# 21 "../../include/linux/kernel.h" 2
# 1 "../../arch/arm/include/asm/byteorder.h" 1
# 21 "../../arch/arm/include/asm/byteorder.h"
# 1 "../../include/linux/byteorder/little_endian.h" 1
# 12 "../../include/linux/byteorder/little_endian.h"
# 1 "../../include/linux/swab.h" 1





# 1 "../../arch/arm/include/asm/swab.h" 1
# 27 "../../arch/arm/include/asm/swab.h"
static inline __attribute__((always_inline)) __attribute__((__const__)) __u16 __arch_swab16(__u16 x)
{
 __asm__ ("rev16 %0, %1" : "=r" (x) : "r" (x));
 return x;
}


static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __arch_swab32(__u32 x)
{
 __asm__ ("rev %0, %1" : "=r" (x) : "r" (x));
 return x;
}
# 7 "../../include/linux/swab.h" 2
# 46 "../../include/linux/swab.h"
static inline __attribute__((always_inline)) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{

 return __arch_swab16(val);



}

static inline __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{

 return __arch_swab32(val);



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
# 148 "../../include/linux/swab.h"
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
# 13 "../../include/linux/byteorder/little_endian.h" 2
# 43 "../../include/linux/byteorder/little_endian.h"
static inline __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)*p;
}
static inline __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)*p;
}
static inline __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)*p;
}
static inline __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
 return ( __u16)*p;
}
static inline __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)__swab64p(p);
}
static inline __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)__swab32p(p);
}
static inline __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)__swab16p(p);
}
static inline __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
 return __swab16p((__u16 *)p);
}
# 105 "../../include/linux/byteorder/little_endian.h"
# 1 "../../include/linux/byteorder/generic.h" 1
# 143 "../../include/linux/byteorder/generic.h"
static inline __attribute__((always_inline)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__u16)((( __u16)(__le16)(*var)) + val));
}

static inline __attribute__((always_inline)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__u32)((( __u32)(__le32)(*var)) + val));
}

static inline __attribute__((always_inline)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__u64)((( __u64)(__le64)(*var)) + val));
}

static inline __attribute__((always_inline)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))) ? ((__u16)( (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))));
}

static inline __attribute__((always_inline)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))) ? ((__u32)( (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))));
}

static inline __attribute__((always_inline)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))) ? ((__u64)( (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))));
}
# 106 "../../include/linux/byteorder/little_endian.h" 2
# 22 "../../arch/arm/include/asm/byteorder.h" 2
# 22 "../../include/linux/kernel.h" 2
# 1 "../../arch/arm/include/asm/bug.h" 1
# 22 "../../arch/arm/include/asm/bug.h"
# 1 "../../include/asm-generic/bug.h" 1
# 64 "../../include/asm-generic/bug.h"
extern void warn_slowpath_fmt(const char *file, const int line,
  const char *fmt, ...) __attribute__((format(printf, 3, 4)));
extern void warn_slowpath_fmt_taint(const char *file, const int line,
        unsigned taint, const char *fmt, ...)
 __attribute__((format(printf, 4, 5)));
extern void warn_slowpath_null(const char *file, const int line);
# 23 "../../arch/arm/include/asm/bug.h" 2
# 23 "../../include/linux/kernel.h" 2

extern const char linux_banner[];
extern const char linux_proc_banner[];
# 73 "../../include/linux/kernel.h"
# 1 "../../arch/arm/include/asm/div64.h" 1
# 74 "../../include/linux/kernel.h" 2
# 120 "../../include/linux/kernel.h"
extern int console_printk[];






struct completion;
struct pt_regs;
struct user;
# 153 "../../include/linux/kernel.h"
  static inline __attribute__((always_inline)) void __might_sleep(const char *file, int line,
       int preempt_offset) { }
# 168 "../../include/linux/kernel.h"
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
# 251 "../../include/linux/kernel.h"
 int vprintk(const char *fmt, va_list args)
 __attribute__ ((format (printf, 1, 0)));
 int printk(const char * fmt, ...)
 __attribute__ ((format (printf, 1, 2))) __attribute__((__cold__));

extern int __printk_ratelimit(const char *func);

extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);

extern int printk_delay_msec;
# 275 "../../include/linux/kernel.h"
void log_buf_kexec_setup(void);
# 296 "../../include/linux/kernel.h"
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
extern int panic_on_io_nmi;
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
# 351 "../../include/linux/kernel.h"
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

extern int hex_to_bin(char ch);
# 488 "../../include/linux/kernel.h"
void tracing_on(void);
void tracing_off(void);

void tracing_off_permanent(void);
int tracing_is_on(void);







enum ftrace_dump_mode {
 DUMP_NONE,
 DUMP_ALL,
 DUMP_ORIG,
};
# 589 "../../include/linux/kernel.h"
static inline __attribute__((always_inline)) void
ftrace_special(unsigned long arg1, unsigned long arg2, unsigned long arg3) { }
static inline __attribute__((always_inline)) int
trace_printk(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));

static inline __attribute__((always_inline)) void tracing_start(void) { }
static inline __attribute__((always_inline)) void tracing_stop(void) { }
static inline __attribute__((always_inline)) void ftrace_off_permanent(void) { }
static inline __attribute__((always_inline)) void trace_dump_stack(void) { }
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
static inline __attribute__((always_inline)) void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
# 726 "../../include/linux/kernel.h"
struct sysinfo;
extern int do_sysinfo(struct sysinfo *info);
# 738 "../../include/linux/kernel.h"
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
# 55 "../../include/linux/spinlock.h" 2
# 1 "../../include/linux/stringify.h" 1
# 56 "../../include/linux/spinlock.h" 2
# 1 "../../include/linux/bottom_half.h" 1



extern void local_bh_disable(void);
extern void _local_bh_enable(void);
extern void local_bh_enable(void);
extern void local_bh_enable_ip(unsigned long ip);
# 57 "../../include/linux/spinlock.h" 2
# 86 "../../include/linux/spinlock.h"
# 1 "../../arch/arm/include/asm/spinlock.h" 1







static inline __attribute__((always_inline)) void dsb_sev(void)
{

 __asm__ __volatile__ (
  "dsb\n"
  "sev"
 );







}
# 42 "../../arch/arm/include/asm/spinlock.h"
static inline __attribute__((always_inline)) void arch_spin_lock(arch_spinlock_t *lock)
{
 unsigned long tmp;

 __asm__ __volatile__(
"1:	ldrex	%0, [%1]\n"
"	teq	%0, #0\n"

"	wfene\n"

"	strexeq	%0, %2, [%1]\n"
"	teqeq	%0, #0\n"
"	bne	1b"
 : "=&r" (tmp)
 : "r" (&lock->lock), "r" (1)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");
}

static inline __attribute__((always_inline)) int arch_spin_trylock(arch_spinlock_t *lock)
{
 unsigned long tmp;

 __asm__ __volatile__(
"	ldrex	%0, [%1]\n"
"	teq	%0, #0\n"
"	strexeq	%0, %2, [%1]"
 : "=&r" (tmp)
 : "r" (&lock->lock), "r" (1)
 : "cc");

 if (tmp == 0) {
  __asm__ __volatile__ ("dmb" : : : "memory");
  return 1;
 } else {
  return 0;
 }
}

static inline __attribute__((always_inline)) void arch_spin_unlock(arch_spinlock_t *lock)
{
 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__(
"	str	%1, [%0]\n"
 :
 : "r" (&lock->lock), "r" (0)
 : "cc");

 dsb_sev();
}
# 103 "../../arch/arm/include/asm/spinlock.h"
static inline __attribute__((always_inline)) void arch_write_lock(arch_rwlock_t *rw)
{
 unsigned long tmp;

 __asm__ __volatile__(
"1:	ldrex	%0, [%1]\n"
"	teq	%0, #0\n"

"	wfene\n"

"	strexeq	%0, %2, [%1]\n"
"	teq	%0, #0\n"
"	bne	1b"
 : "=&r" (tmp)
 : "r" (&rw->lock), "r" (0x80000000)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");
}

static inline __attribute__((always_inline)) int arch_write_trylock(arch_rwlock_t *rw)
{
 unsigned long tmp;

 __asm__ __volatile__(
"1:	ldrex	%0, [%1]\n"
"	teq	%0, #0\n"
"	strexeq	%0, %2, [%1]"
 : "=&r" (tmp)
 : "r" (&rw->lock), "r" (0x80000000)
 : "cc");

 if (tmp == 0) {
  __asm__ __volatile__ ("dmb" : : : "memory");
  return 1;
 } else {
  return 0;
 }
}

static inline __attribute__((always_inline)) void arch_write_unlock(arch_rwlock_t *rw)
{
 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__(
 "str	%1, [%0]\n"
 :
 : "r" (&rw->lock), "r" (0)
 : "cc");

 dsb_sev();
}
# 171 "../../arch/arm/include/asm/spinlock.h"
static inline __attribute__((always_inline)) void arch_read_lock(arch_rwlock_t *rw)
{
 unsigned long tmp, tmp2;

 __asm__ __volatile__(
"1:	ldrex	%0, [%2]\n"
"	adds	%0, %0, #1\n"
"	strexpl	%1, %0, [%2]\n"

"	wfemi\n"

"	rsbpls	%0, %1, #0\n"
"	bmi	1b"
 : "=&r" (tmp), "=&r" (tmp2)
 : "r" (&rw->lock)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");
}

static inline __attribute__((always_inline)) void arch_read_unlock(arch_rwlock_t *rw)
{
 unsigned long tmp, tmp2;

 __asm__ __volatile__ ("dmb" : : : "memory");

 __asm__ __volatile__(
"1:	ldrex	%0, [%2]\n"
"	sub	%0, %0, #1\n"
"	strex	%1, %0, [%2]\n"
"	teq	%1, #0\n"
"	bne	1b"
 : "=&r" (tmp), "=&r" (tmp2)
 : "r" (&rw->lock)
 : "cc");

 if (tmp == 0)
  dsb_sev();
}

static inline __attribute__((always_inline)) int arch_read_trylock(arch_rwlock_t *rw)
{
 unsigned long tmp, tmp2 = 1;

 __asm__ __volatile__(
"1:	ldrex	%0, [%2]\n"
"	adds	%0, %0, #1\n"
"	strexpl	%1, %0, [%2]\n"
 : "=&r" (tmp), "+r" (tmp2)
 : "r" (&rw->lock)
 : "cc");

 __asm__ __volatile__ ("dmb" : : : "memory");
 return tmp2 == 0;
}
# 87 "../../include/linux/spinlock.h" 2
# 121 "../../include/linux/spinlock.h"
static inline __attribute__((always_inline)) void smp_mb__after_lock(void) { __asm__ __volatile__ ("dmb" : : : "memory"); }
# 136 "../../include/linux/spinlock.h"
static inline __attribute__((always_inline)) void do_raw_spin_lock(raw_spinlock_t *lock)
{
 (void)0;
 arch_spin_lock(&lock->raw_lock);
}

static inline __attribute__((always_inline)) void
do_raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long *flags)
{
 (void)0;
 arch_spin_lock(&lock->raw_lock);
}

static inline __attribute__((always_inline)) int do_raw_spin_trylock(raw_spinlock_t *lock)
{
 return arch_spin_trylock(&(lock)->raw_lock);
}

static inline __attribute__((always_inline)) void do_raw_spin_unlock(raw_spinlock_t *lock)
{
 arch_spin_unlock(&lock->raw_lock);
 (void)0;
}
# 256 "../../include/linux/spinlock.h"
# 1 "../../include/linux/rwlock.h" 1
# 257 "../../include/linux/spinlock.h" 2





# 1 "../../include/linux/spinlock_api_smp.h" 1
# 18 "../../include/linux/spinlock_api_smp.h"
int in_lock_functions(unsigned long addr);



void __attribute__((section(".spinlock.text"))) _raw_spin_lock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_nested(raw_spinlock_t *lock, int subclass)
        ;
void __attribute__((section(".spinlock.text")))
_raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
        ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_irq(raw_spinlock_t *lock)
        ;

unsigned long __attribute__((section(".spinlock.text"))) _raw_spin_lock_irqsave(raw_spinlock_t *lock)
        ;
unsigned long __attribute__((section(".spinlock.text")))
_raw_spin_lock_irqsave_nested(raw_spinlock_t *lock, int subclass)
        ;
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock(raw_spinlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock_bh(raw_spinlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_irq(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
        ;
# 86 "../../include/linux/spinlock_api_smp.h"
static inline __attribute__((always_inline)) int __raw_spin_trylock(raw_spinlock_t *lock)
{
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
 return 0;
}
# 149 "../../include/linux/spinlock_api_smp.h"
static inline __attribute__((always_inline)) void __raw_spin_unlock(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
         unsigned long flags)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (({ (int)((flags) & 0x00000080); })) { __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); do { } while (0); } else { do { } while (0); __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); } } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_spin_unlock_irq(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { do { } while (0); __asm__("cpsie i	@ __sti" : : : "memory", "cc"); } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_spin_unlock_bh(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
}

static inline __attribute__((always_inline)) int __raw_spin_trylock_bh(raw_spinlock_t *lock)
{
 local_bh_disable();
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
 return 0;
}

# 1 "../../include/linux/rwlock_api_smp.h" 1
# 18 "../../include/linux/rwlock_api_smp.h"
void __attribute__((section(".spinlock.text"))) _raw_read_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_irq(rwlock_t *lock) ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_read_lock_irqsave(rwlock_t *lock)
       ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_write_lock_irqsave(rwlock_t *lock)
       ;
int __attribute__((section(".spinlock.text"))) _raw_read_trylock(rwlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_write_trylock(rwlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_read_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
void __attribute__((section(".spinlock.text")))
_raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
# 117 "../../include/linux/rwlock_api_smp.h"
static inline __attribute__((always_inline)) int __raw_read_trylock(rwlock_t *lock)
{
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
 if (arch_read_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
 return 0;
}

static inline __attribute__((always_inline)) int __raw_write_trylock(rwlock_t *lock)
{
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
 if (arch_write_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
 return 0;
}
# 218 "../../include/linux/rwlock_api_smp.h"
static inline __attribute__((always_inline)) void __raw_write_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void
__raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (({ (int)((flags) & 0x00000080); })) { __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); do { } while (0); } else { do { } while (0); __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); } } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { } while (0); __asm__("cpsie i	@ __sti" : : : "memory", "cc"); } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_read_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
}

static inline __attribute__((always_inline)) void __raw_write_unlock_irqrestore(rwlock_t *lock,
          unsigned long flags)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); if (({ (int)((flags) & 0x00000080); })) { __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); do { } while (0); } else { do { } while (0); __asm__ __volatile__( "msr	cpsr_c, %0		@ local_irq_restore\n" : : "r" (flags) : "memory", "cc"); } } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_write_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { } while (0); __asm__("cpsie i	@ __sti" : : : "memory", "cc"); } while (0);
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}

static inline __attribute__((always_inline)) void __raw_write_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0);
 local_bh_enable_ip((unsigned long)__builtin_return_address(0));
}
# 195 "../../include/linux/spinlock_api_smp.h" 2
# 263 "../../include/linux/spinlock.h" 2
# 271 "../../include/linux/spinlock.h"
static inline __attribute__((always_inline)) raw_spinlock_t *spinlock_check(spinlock_t *lock)
{
 return &lock->rlock;
}







static inline __attribute__((always_inline)) void spin_lock(spinlock_t *lock)
{
 _raw_spin_lock(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_lock_bh(spinlock_t *lock)
{
 _raw_spin_lock_bh(&lock->rlock);
}

static inline __attribute__((always_inline)) int spin_trylock(spinlock_t *lock)
{
 return (_raw_spin_trylock(&lock->rlock));
}
# 307 "../../include/linux/spinlock.h"
static inline __attribute__((always_inline)) void spin_lock_irq(spinlock_t *lock)
{
 _raw_spin_lock_irq(&lock->rlock);
}
# 322 "../../include/linux/spinlock.h"
static inline __attribute__((always_inline)) void spin_unlock(spinlock_t *lock)
{
 _raw_spin_unlock(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_unlock_bh(spinlock_t *lock)
{
 _raw_spin_unlock_bh(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_unlock_irq(spinlock_t *lock)
{
 _raw_spin_unlock_irq(&lock->rlock);
}

static inline __attribute__((always_inline)) void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
{
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); _raw_spin_unlock_irqrestore(&lock->rlock, flags); } while (0);
}

static inline __attribute__((always_inline)) int spin_trylock_bh(spinlock_t *lock)
{
 return (_raw_spin_trylock_bh(&lock->rlock));
}

static inline __attribute__((always_inline)) int spin_trylock_irq(spinlock_t *lock)
{
 return ({ do { __asm__("cpsid i	@ __cli" : : : "memory", "cc"); do { } while (0); } while (0); (_raw_spin_trylock(&lock->rlock)) ? 1 : ({ do { do { } while (0); __asm__("cpsie i	@ __sti" : : : "memory", "cc"); } while (0); 0; }); });
}






static inline __attribute__((always_inline)) void spin_unlock_wait(spinlock_t *lock)
{
 do { while (((&(&lock->rlock)->raw_lock)->lock != 0)) __asm__ __volatile__("": : :"memory"); } while (0);
}

static inline __attribute__((always_inline)) int spin_is_locked(spinlock_t *lock)
{
 return ((&(&lock->rlock)->raw_lock)->lock != 0);
}

static inline __attribute__((always_inline)) int spin_is_contended(spinlock_t *lock)
{
 return ((&lock->rlock)->break_lock);
}

static inline __attribute__((always_inline)) int spin_can_lock(spinlock_t *lock)
{
 return (!((&(&lock->rlock)->raw_lock)->lock != 0));
}

static inline __attribute__((always_inline)) void assert_spin_locked(spinlock_t *lock)
{
 do { if (__builtin_expect(!!(!((&(&lock->rlock)->raw_lock)->lock != 0)), 0)) do { *(int *)0 = 0; } while (1); } while(0);
}
# 395 "../../include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 24 "../../include/linux/kobject.h" 2
# 1 "../../include/linux/kref.h" 1
# 20 "../../include/linux/kref.h"
struct kref {
 atomic_t refcount;
};

void kref_init(struct kref *kref);
void kref_get(struct kref *kref);
int kref_put(struct kref *kref, void (*release) (struct kref *kref));
# 25 "../../include/linux/kobject.h" 2

# 1 "../../include/linux/wait.h" 1
# 26 "../../include/linux/wait.h"
# 1 "../../arch/arm/include/asm/current.h" 1





static inline __attribute__((always_inline)) struct task_struct *get_current(void) __attribute__((__const__));

static inline __attribute__((always_inline)) struct task_struct *get_current(void)
{
 return current_thread_info()->task;
}
# 27 "../../include/linux/wait.h" 2

typedef struct __wait_queue wait_queue_t;
typedef int (*wait_queue_func_t)(wait_queue_t *wait, unsigned mode, int flags, void *key);
int default_wake_function(wait_queue_t *wait, unsigned mode, int flags, void *key);

struct __wait_queue {
 unsigned int flags;

 void *private;
 wait_queue_func_t func;
 struct list_head task_list;
};

struct wait_bit_key {
 void *flags;
 int bit_nr;
};

struct wait_bit_queue {
 struct wait_bit_key key;
 wait_queue_t wait;
};

struct __wait_queue_head {
 spinlock_t lock;
 struct list_head task_list;
};
typedef struct __wait_queue_head wait_queue_head_t;

struct task_struct;
# 80 "../../include/linux/wait.h"
extern void __init_waitqueue_head(wait_queue_head_t *q, struct lock_class_key *);
# 98 "../../include/linux/wait.h"
static inline __attribute__((always_inline)) void init_waitqueue_entry(wait_queue_t *q, struct task_struct *p)
{
 q->flags = 0;
 q->private = p;
 q->func = default_wake_function;
}

static inline __attribute__((always_inline)) void init_waitqueue_func_entry(wait_queue_t *q,
     wait_queue_func_t func)
{
 q->flags = 0;
 q->private = ((void *)0);
 q->func = func;
}

static inline __attribute__((always_inline)) int waitqueue_active(wait_queue_head_t *q)
{
 return !list_empty(&q->task_list);
}

extern void add_wait_queue(wait_queue_head_t *q, wait_queue_t *wait);
extern void add_wait_queue_exclusive(wait_queue_head_t *q, wait_queue_t *wait);
extern void remove_wait_queue(wait_queue_head_t *q, wait_queue_t *wait);

static inline __attribute__((always_inline)) void __add_wait_queue(wait_queue_head_t *head, wait_queue_t *new)
{
 list_add(&new->task_list, &head->task_list);
}




static inline __attribute__((always_inline)) void __add_wait_queue_exclusive(wait_queue_head_t *q,
           wait_queue_t *wait)
{
 wait->flags |= 0x01;
 __add_wait_queue(q, wait);
}

static inline __attribute__((always_inline)) void __add_wait_queue_tail(wait_queue_head_t *head,
      wait_queue_t *new)
{
 list_add_tail(&new->task_list, &head->task_list);
}

static inline __attribute__((always_inline)) void __add_wait_queue_tail_exclusive(wait_queue_head_t *q,
           wait_queue_t *wait)
{
 wait->flags |= 0x01;
 __add_wait_queue_tail(q, wait);
}

static inline __attribute__((always_inline)) void __remove_wait_queue(wait_queue_head_t *head,
       wait_queue_t *old)
{
 list_del(&old->task_list);
}

void __wake_up(wait_queue_head_t *q, unsigned int mode, int nr, void *key);
void __wake_up_locked_key(wait_queue_head_t *q, unsigned int mode, void *key);
void __wake_up_sync_key(wait_queue_head_t *q, unsigned int mode, int nr,
   void *key);
void __wake_up_locked(wait_queue_head_t *q, unsigned int mode);
void __wake_up_sync(wait_queue_head_t *q, unsigned int mode, int nr);
void __wake_up_bit(wait_queue_head_t *, void *, int);
int __wait_on_bit(wait_queue_head_t *, struct wait_bit_queue *, int (*)(void *), unsigned);
int __wait_on_bit_lock(wait_queue_head_t *, struct wait_bit_queue *, int (*)(void *), unsigned);
void wake_up_bit(void *, int);
int out_of_line_wait_on_bit(void *, int, int (*)(void *), unsigned);
int out_of_line_wait_on_bit_lock(void *, int, int (*)(void *), unsigned);
wait_queue_head_t *bit_waitqueue(void *, int);
# 574 "../../include/linux/wait.h"
extern void sleep_on(wait_queue_head_t *q);
extern long sleep_on_timeout(wait_queue_head_t *q,
          signed long timeout);
extern void interruptible_sleep_on(wait_queue_head_t *q);
extern long interruptible_sleep_on_timeout(wait_queue_head_t *q,
        signed long timeout);




void prepare_to_wait(wait_queue_head_t *q, wait_queue_t *wait, int state);
void prepare_to_wait_exclusive(wait_queue_head_t *q, wait_queue_t *wait, int state);
void finish_wait(wait_queue_head_t *q, wait_queue_t *wait);
void abort_exclusive_wait(wait_queue_head_t *q, wait_queue_t *wait,
   unsigned int mode, void *key);
int autoremove_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
int wake_bit_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
# 633 "../../include/linux/wait.h"
static inline __attribute__((always_inline)) int wait_on_bit(void *word, int bit,
    int (*action)(void *), unsigned mode)
{
 if (!test_bit(bit, word))
  return 0;
 return out_of_line_wait_on_bit(word, bit, action, mode);
}
# 657 "../../include/linux/wait.h"
static inline __attribute__((always_inline)) int wait_on_bit_lock(void *word, int bit,
    int (*action)(void *), unsigned mode)
{
 if (!_test_and_set_bit_le(bit,word))
  return 0;
 return out_of_line_wait_on_bit_lock(word, bit, action, mode);
}
# 27 "../../include/linux/kobject.h" 2







extern char uevent_helper[];


extern u64 uevent_seqnum;
# 49 "../../include/linux/kobject.h"
enum kobject_action {
 KOBJ_ADD,
 KOBJ_REMOVE,
 KOBJ_CHANGE,
 KOBJ_MOVE,
 KOBJ_ONLINE,
 KOBJ_OFFLINE,
 KOBJ_MAX
};

struct kobject {
 const char *name;
 struct list_head entry;
 struct kobject *parent;
 struct kset *kset;
 struct kobj_type *ktype;
 struct sysfs_dirent *sd;
 struct kref kref;
 unsigned int state_initialized:1;
 unsigned int state_in_sysfs:1;
 unsigned int state_add_uevent_sent:1;
 unsigned int state_remove_uevent_sent:1;
 unsigned int uevent_suppress:1;
};

extern int kobject_set_name(struct kobject *kobj, const char *name, ...)
       __attribute__((format(printf, 2, 3)));
extern int kobject_set_name_vargs(struct kobject *kobj, const char *fmt,
      va_list vargs);

static inline __attribute__((always_inline)) const char *kobject_name(const struct kobject *kobj)
{
 return kobj->name;
}

extern void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
extern int __attribute__((warn_unused_result)) kobject_add(struct kobject *kobj,
        struct kobject *parent,
        const char *fmt, ...);
extern int __attribute__((warn_unused_result)) kobject_init_and_add(struct kobject *kobj,
          struct kobj_type *ktype,
          struct kobject *parent,
          const char *fmt, ...);

extern void kobject_del(struct kobject *kobj);

extern struct kobject * __attribute__((warn_unused_result)) kobject_create(void);
extern struct kobject * __attribute__((warn_unused_result)) kobject_create_and_add(const char *name,
      struct kobject *parent);

extern int __attribute__((warn_unused_result)) kobject_rename(struct kobject *, const char *new_name);
extern int __attribute__((warn_unused_result)) kobject_move(struct kobject *, struct kobject *);

extern struct kobject *kobject_get(struct kobject *kobj);
extern void kobject_put(struct kobject *kobj);

extern char *kobject_get_path(struct kobject *kobj, gfp_t flag);

struct kobj_type {
 void (*release)(struct kobject *kobj);
 const struct sysfs_ops *sysfs_ops;
 struct attribute **default_attrs;
 const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
 const void *(*namespace)(struct kobject *kobj);
};

struct kobj_uevent_env {
 char *envp[32];
 int envp_idx;
 char buf[2048];
 int buflen;
};

struct kset_uevent_ops {
 int (* const filter)(struct kset *kset, struct kobject *kobj);
 const char *(* const name)(struct kset *kset, struct kobject *kobj);
 int (* const uevent)(struct kset *kset, struct kobject *kobj,
        struct kobj_uevent_env *env);
};

struct kobj_attribute {
 struct attribute attr;
 ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
   char *buf);
 ssize_t (*store)(struct kobject *kobj, struct kobj_attribute *attr,
    const char *buf, size_t count);
};

extern const struct sysfs_ops kobj_sysfs_ops;





enum kobj_ns_type {
 KOBJ_NS_TYPE_NONE = 0,
 KOBJ_NS_TYPE_NET,
 KOBJ_NS_TYPES
};

struct sock;







struct kobj_ns_type_operations {
 enum kobj_ns_type type;
 const void *(*current_ns)(void);
 const void *(*netlink_ns)(struct sock *sk);
 const void *(*initial_ns)(void);
};

int kobj_ns_type_register(const struct kobj_ns_type_operations *ops);
int kobj_ns_type_registered(enum kobj_ns_type type);
const struct kobj_ns_type_operations *kobj_child_ns_ops(struct kobject *parent);
const struct kobj_ns_type_operations *kobj_ns_ops(struct kobject *kobj);

const void *kobj_ns_current(enum kobj_ns_type type);
const void *kobj_ns_netlink(enum kobj_ns_type type, struct sock *sk);
const void *kobj_ns_initial(enum kobj_ns_type type);
void kobj_ns_exit(enum kobj_ns_type type, const void *ns);
# 192 "../../include/linux/kobject.h"
struct kset {
 struct list_head list;
 spinlock_t list_lock;
 struct kobject kobj;
 const struct kset_uevent_ops *uevent_ops;
};

extern void kset_init(struct kset *kset);
extern int __attribute__((warn_unused_result)) kset_register(struct kset *kset);
extern void kset_unregister(struct kset *kset);
extern struct kset * __attribute__((warn_unused_result)) kset_create_and_add(const char *name,
      const struct kset_uevent_ops *u,
      struct kobject *parent_kobj);

static inline __attribute__((always_inline)) struct kset *to_kset(struct kobject *kobj)
{
 return kobj ? ({ const typeof( ((struct kset *)0)->kobj ) *__mptr = (kobj); (struct kset *)( (char *)__mptr - __builtin_offsetof(struct kset,kobj) );}) : ((void *)0);
}

static inline __attribute__((always_inline)) struct kset *kset_get(struct kset *k)
{
 return k ? to_kset(kobject_get(&k->kobj)) : ((void *)0);
}

static inline __attribute__((always_inline)) void kset_put(struct kset *k)
{
 kobject_put(&k->kobj);
}

static inline __attribute__((always_inline)) struct kobj_type *get_ktype(struct kobject *kobj)
{
 return kobj->ktype;
}

extern struct kobject *kset_find_obj(struct kset *, const char *);


extern struct kobject *kernel_kobj;

extern struct kobject *mm_kobj;

extern struct kobject *hypervisor_kobj;

extern struct kobject *power_kobj;

extern struct kobject *firmware_kobj;


int kobject_uevent(struct kobject *kobj, enum kobject_action action);
int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
   char *envp[]);

int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 __attribute__((format (printf, 2, 3)));

int kobject_action_type(const char *buf, size_t count,
   enum kobject_action *type);
# 18 "../../include/linux/device.h" 2
# 1 "../../include/linux/klist.h" 1
# 19 "../../include/linux/klist.h"
struct klist_node;
struct klist {
 spinlock_t k_lock;
 struct list_head k_list;
 void (*get)(struct klist_node *);
 void (*put)(struct klist_node *);
} __attribute__ ((aligned (4)));
# 36 "../../include/linux/klist.h"
extern void klist_init(struct klist *k, void (*get)(struct klist_node *),
         void (*put)(struct klist_node *));

struct klist_node {
 void *n_klist;
 struct list_head n_node;
 struct kref n_ref;
};

extern void klist_add_tail(struct klist_node *n, struct klist *k);
extern void klist_add_head(struct klist_node *n, struct klist *k);
extern void klist_add_after(struct klist_node *n, struct klist_node *pos);
extern void klist_add_before(struct klist_node *n, struct klist_node *pos);

extern void klist_del(struct klist_node *n);
extern void klist_remove(struct klist_node *n);

extern int klist_node_attached(struct klist_node *n);


struct klist_iter {
 struct klist *i_klist;
 struct klist_node *i_cur;
};


extern void klist_iter_init(struct klist *k, struct klist_iter *i);
extern void klist_iter_init_node(struct klist *k, struct klist_iter *i,
     struct klist_node *n);
extern void klist_iter_exit(struct klist_iter *i);
extern struct klist_node *klist_next(struct klist_iter *i);
# 19 "../../include/linux/device.h" 2




# 1 "../../include/linux/module.h" 1
# 10 "../../include/linux/module.h"
# 1 "../../include/linux/stat.h" 1





# 1 "../../arch/arm/include/asm/stat.h" 1



struct __old_kernel_stat {
 unsigned short st_dev;
 unsigned short st_ino;
 unsigned short st_mode;
 unsigned short st_nlink;
 unsigned short st_uid;
 unsigned short st_gid;
 unsigned short st_rdev;
 unsigned long st_size;
 unsigned long st_atime;
 unsigned long st_mtime;
 unsigned long st_ctime;
};



struct stat {




 unsigned long st_dev;

 unsigned long st_ino;
 unsigned short st_mode;
 unsigned short st_nlink;
 unsigned short st_uid;
 unsigned short st_gid;




 unsigned long st_rdev;

 unsigned long st_size;
 unsigned long st_blksize;
 unsigned long st_blocks;
 unsigned long st_atime;
 unsigned long st_atime_nsec;
 unsigned long st_mtime;
 unsigned long st_mtime_nsec;
 unsigned long st_ctime;
 unsigned long st_ctime_nsec;
 unsigned long __unused4;
 unsigned long __unused5;
};






struct stat64 {
 unsigned long long st_dev;
 unsigned char __pad0[4];


 unsigned long __st_ino;
 unsigned int st_mode;
 unsigned int st_nlink;

 unsigned long st_uid;
 unsigned long st_gid;

 unsigned long long st_rdev;
 unsigned char __pad3[4];

 long long st_size;
 unsigned long st_blksize;
 unsigned long long st_blocks;

 unsigned long st_atime;
 unsigned long st_atime_nsec;

 unsigned long st_mtime;
 unsigned long st_mtime_nsec;

 unsigned long st_ctime;
 unsigned long st_ctime_nsec;

 unsigned long long st_ino;
};
# 7 "../../include/linux/stat.h" 2
# 60 "../../include/linux/stat.h"
# 1 "../../include/linux/time.h" 1






# 1 "../../include/linux/cache.h" 1
# 8 "../../include/linux/time.h" 2
# 1 "../../include/linux/seqlock.h" 1
# 32 "../../include/linux/seqlock.h"
typedef struct {
 unsigned sequence;
 spinlock_t lock;
} seqlock_t;
# 60 "../../include/linux/seqlock.h"
static inline __attribute__((always_inline)) void write_seqlock(seqlock_t *sl)
{
 spin_lock(&sl->lock);
 ++sl->sequence;
 __asm__ __volatile__ ("dmb" : : : "memory");
}

static inline __attribute__((always_inline)) void write_sequnlock(seqlock_t *sl)
{
 __asm__ __volatile__ ("dmb" : : : "memory");
 sl->sequence++;
 spin_unlock(&sl->lock);
}

static inline __attribute__((always_inline)) int write_tryseqlock(seqlock_t *sl)
{
 int ret = spin_trylock(&sl->lock);

 if (ret) {
  ++sl->sequence;
  __asm__ __volatile__ ("dmb" : : : "memory");
 }
 return ret;
}


static inline __attribute__((always_inline)) __attribute__((always_inline)) unsigned read_seqbegin(const seqlock_t *sl)
{
 unsigned ret;

repeat:
 ret = sl->sequence;
 __asm__ __volatile__ ("dmb" : : : "memory");
 if (__builtin_expect(!!(ret & 1), 0)) {
  __asm__ __volatile__("": : :"memory");
  goto repeat;
 }

 return ret;
}






static inline __attribute__((always_inline)) __attribute__((always_inline)) int read_seqretry(const seqlock_t *sl, unsigned start)
{
 __asm__ __volatile__ ("dmb" : : : "memory");

 return (sl->sequence != start);
}
# 121 "../../include/linux/seqlock.h"
typedef struct seqcount {
 unsigned sequence;
} seqcount_t;





static inline __attribute__((always_inline)) unsigned read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret;

repeat:
 ret = s->sequence;
 __asm__ __volatile__ ("dmb" : : : "memory");
 if (__builtin_expect(!!(ret & 1), 0)) {
  __asm__ __volatile__("": : :"memory");
  goto repeat;
 }
 return ret;
}




static inline __attribute__((always_inline)) int read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 __asm__ __volatile__ ("dmb" : : : "memory");

 return s->sequence != start;
}






static inline __attribute__((always_inline)) void write_seqcount_begin(seqcount_t *s)
{
 s->sequence++;
 __asm__ __volatile__ ("dmb" : : : "memory");
}

static inline __attribute__((always_inline)) void write_seqcount_end(seqcount_t *s)
{
 __asm__ __volatile__ ("dmb" : : : "memory");
 s->sequence++;
}
# 9 "../../include/linux/time.h" 2
# 1 "../../include/linux/math64.h" 1
# 41 "../../include/linux/math64.h"
static inline __attribute__((always_inline)) u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
{
 *remainder = ({ unsigned int __r, __b = (divisor); if (!__builtin_constant_p(__b) || __b == 0 || (7 < 4 && (__b & (__b - 1)) != 0)) { __r = ({ register unsigned int __base asm("r4") = __b; register unsigned long long __n asm("r0") = dividend; register unsigned long long __res asm("r2"); register unsigned int __rem asm("r1"); asm( ".ifnc " "%0" "," "r1" " ; .err ; .endif\n\t" ".ifnc " "%1" "," "r2" " ; .err ; .endif\n\t" ".ifnc " "%2" "," "r0" " ; .err ; .endif\n\t" ".ifnc " "%3" "," "r4" " ; .err ; .endif\n\t" "bl	__do_div64" : "=r" (__rem), "=r" (__res) : "r" (__n), "r" (__base) : "ip", "lr", "cc"); dividend = __res; __rem; }); } else if ((__b & (__b - 1)) == 0) { __r = dividend; __r &= (__b - 1); dividend /= __b; } else { unsigned long long __res, __x, __t, __m, __n = dividend; unsigned int __c, __p, __z = 0; __r = __n; __p = 1 << ({ unsigned int __left = (__b), __nr = 0; if (__left & 0xffff0000) __nr += 16, __left >>= 16; if (__left & 0x0000ff00) __nr += 8, __left >>= 8; if (__left & 0x000000f0) __nr += 4, __left >>= 4; if (__left & 0x0000000c) __nr += 2, __left >>= 2; if (__left & 0x00000002) __nr += 1; __nr; }); __m = (~0ULL / __b) * __p; __m += (((~0ULL % __b + 1) * __p) + __b - 1) / __b; __x = ~0ULL / __b * __b - 1; __res = (__m & 0xffffffff) * (__x & 0xffffffff); __res >>= 32; __res += (__m & 0xffffffff) * (__x >> 32); __t = __res; __res += (__x & 0xffffffff) * (__m >> 32); __t = (__res < __t) ? (1ULL << 32) : 0; __res = (__res >> 32) + __t; __res += (__m >> 32) * (__x >> 32); __res /= __p; if (~0ULL % (__b / (__b & -__b)) == 0) { __n /= (__b & -__b); __m = ~0ULL / (__b / (__b & -__b)); __p = 1; __c = 1; } else if (__res != __x / __b) { __c = 1; __m = (~0ULL / __b) * __p; __m += ((~0ULL % __b + 1) * __p) / __b; } else { unsigned int __bits = -(__m & -__m); __bits |= __m >> 32; __bits = (~__bits) << 1; if (!__bits) { __p /= (__m & -__m); __m /= (__m & -__m); } else { __p >>= ({ unsigned int __left = (__bits), __nr = 0; if (__left & 0xffff0000) __nr += 16, __left >>= 16; if (__left & 0x0000ff00) __nr += 8, __left >>= 8; if (__left & 0x000000f0) __nr += 4, __left >>= 4; if (__left & 0x0000000c) __nr += 2, __left >>= 2; if (__left & 0x00000002) __nr += 1; __nr; }); __m >>= ({ unsigned int __left = (__bits), __nr = 0; if (__left & 0xffff0000) __nr += 16, __left >>= 16; if (__left & 0x0000ff00) __nr += 8, __left >>= 8; if (__left & 0x000000f0) __nr += 4, __left >>= 4; if (__left & 0x0000000c) __nr += 2, __left >>= 2; if (__left & 0x00000002) __nr += 1; __nr; }); } __c = 0; } if (!__c) { asm ( "umull	%Q0, %R0, %1, %Q2\n\t" "mov	%Q0, #0" : "=&r" (__res) : "r" (__m), "r" (__n) : "cc" ); } else if (!(__m & ((1ULL << 63) | (1ULL << 31)))) { __res = __m; asm ( "umlal	%Q0, %R0, %Q1, %Q2\n\t" "mov	%Q0, #0" : "+&r" (__res) : "r" (__m), "r" (__n) : "cc" ); } else { asm ( "umull	%Q0, %R0, %Q1, %Q2\n\t" "cmn	%Q0, %Q1\n\t" "adcs	%R0, %R0, %R1\n\t" "adc	%Q0, %3, #0" : "=&r" (__res) : "r" (__m), "r" (__n), "r" (__z) : "cc" ); } if (!(__m & ((1ULL << 63) | (1ULL << 31)))) { asm ( "umlal	%R0, %Q0, %R1, %Q2\n\t" "umlal	%R0, %Q0, %Q1, %R2\n\t" "mov	%R0, #0\n\t" "umlal	%Q0, %R0, %R1, %R2" : "+&r" (__res) : "r" (__m), "r" (__n) : "cc" ); } else { asm ( "umlal	%R0, %Q0, %R2, %Q3\n\t" "umlal	%R0, %1, %Q2, %R3\n\t" "mov	%R0, #0\n\t" "adds	%Q0, %1, %Q0\n\t" "adc	%R0, %R0, #0\n\t" "umlal	%Q0, %R0, %R2, %R3" : "+&r" (__res), "+&r" (__z) : "r" (__m), "r" (__n) : "cc" ); } __res /= __p; { unsigned int __res0 = __res; unsigned int __b0 = __b; __r -= __res0 * __b0; } dividend = __res; } __r; });
 return dividend;
}



extern s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder);



extern u64 div64_u64(u64 dividend, u64 divisor);
# 66 "../../include/linux/math64.h"
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
# 10 "../../include/linux/time.h" 2




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
# 45 "../../include/linux/time.h"
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

extern void set_normalized_timespec(struct timespec *ts, time_t sec, s64 nsec);
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

extern void read_persistent_clock(struct timespec *ts);
extern void read_boot_clock(struct timespec *ts);
extern int update_persistent_clock(struct timespec now);
extern int no_sync_cmos_clock ;
void timekeeping_init(void);
extern int timekeeping_suspended;

unsigned long get_seconds(void);
struct timespec current_kernel_time(void);
struct timespec __current_kernel_time(void);
struct timespec get_monotonic_coarse(void);
# 131 "../../include/linux/time.h"
static inline __attribute__((always_inline)) u32 arch_gettimeoffset(void) { return 0; }


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
extern u64 timekeeping_max_deferment(void);
extern void update_wall_time(void);
extern void timekeeping_leap_insert(int leapsecond);

struct tms;
extern void do_sys_times(struct tms *);





struct tm {




 int tm_sec;

 int tm_min;

 int tm_hour;

 int tm_mday;

 int tm_mon;

 long tm_year;

 int tm_wday;

 int tm_yday;
};

void time_to_tm(time_t totalsecs, int offset, struct tm *result);
# 193 "../../include/linux/time.h"
static inline __attribute__((always_inline)) s64 timespec_to_ns(const struct timespec *ts)
{
 return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}
# 205 "../../include/linux/time.h"
static inline __attribute__((always_inline)) s64 timeval_to_ns(const struct timeval *tv)
{
 return ((s64) tv->tv_sec * 1000000000L) +
  tv->tv_usec * 1000L;
}







extern struct timespec ns_to_timespec(const s64 nsec);







extern struct timeval ns_to_timeval(const s64 nsec);
# 235 "../../include/linux/time.h"
static inline __attribute__((always_inline)) __attribute__((always_inline)) void timespec_add_ns(struct timespec *a, u64 ns)
{
 a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, 1000000000L, &ns);
 a->tv_nsec = ns;
}
# 258 "../../include/linux/time.h"
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};

struct itimerval {
 struct timeval it_interval;
 struct timeval it_value;
};
# 61 "../../include/linux/stat.h" 2

struct kstat {
 u64 ino;
 dev_t dev;
 umode_t mode;
 unsigned int nlink;
 uid_t uid;
 gid_t gid;
 dev_t rdev;
 loff_t size;
 struct timespec atime;
 struct timespec mtime;
 struct timespec ctime;
 unsigned long blksize;
 unsigned long long blocks;
};
# 11 "../../include/linux/module.h" 2


# 1 "../../include/linux/kmod.h" 1
# 22 "../../include/linux/kmod.h"
# 1 "../../include/linux/gfp.h" 1



# 1 "../../include/linux/mmzone.h" 1
# 12 "../../include/linux/mmzone.h"
# 1 "../../include/linux/threads.h" 1
# 13 "../../include/linux/mmzone.h" 2
# 1 "../../include/linux/numa.h" 1
# 14 "../../include/linux/mmzone.h" 2
# 1 "../../include/linux/init.h" 1
# 131 "../../include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);

extern initcall_t __con_initcall_start[], __con_initcall_end[];
extern initcall_t __security_initcall_start[], __security_initcall_end[];


typedef void (*ctor_fn_t)(void);


extern int do_one_initcall(initcall_t fn);
extern char __attribute__ ((__section__(".init.data"))) boot_command_line[];
extern char *saved_command_line;
extern unsigned int reset_devices;


void setup_arch(char **);
void prepare_namespace(void);

extern void (*late_time_init)(void);

extern int initcall_debug;
# 218 "../../include/linux/init.h"
struct obs_kernel_param {
 const char *str;
 int (*setup_func)(char *);
 int early;
};
# 247 "../../include/linux/init.h"
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) parse_early_param(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) parse_early_options(char *cmdline);
# 15 "../../include/linux/mmzone.h" 2

# 1 "../../include/linux/nodemask.h" 1
# 93 "../../include/linux/nodemask.h"
# 1 "../../include/linux/bitmap.h" 1







# 1 "../../include/linux/string.h" 1
# 15 "../../include/linux/string.h"
extern char *strndup_user(const char *, long);
extern void *memdup_user(const void *, size_t);




# 1 "../../arch/arm/include/asm/string.h" 1
# 10 "../../arch/arm/include/asm/string.h"
extern char * strrchr(const char * s, int c);


extern char * strchr(const char * s, int c);


extern void * memcpy(void *, const void *, __kernel_size_t);


extern void * memmove(void *, const void *, __kernel_size_t);


extern void * memchr(const void *, int, __kernel_size_t);


extern void * memset(void *, int, __kernel_size_t);

extern void __memzero(void *ptr, __kernel_size_t n);
# 22 "../../include/linux/string.h" 2


extern char * strcpy(char *,const char *);


extern char * strncpy(char *,const char *, __kernel_size_t);


size_t strlcpy(char *, const char *, size_t);


extern char * strcat(char *, const char *);


extern char * strncat(char *, const char *, __kernel_size_t);


extern size_t strlcat(char *, const char *, __kernel_size_t);


extern int strcmp(const char *,const char *);


extern int strncmp(const char *,const char *,__kernel_size_t);


extern int strnicmp(const char *, const char *, __kernel_size_t);


extern int strcasecmp(const char *s1, const char *s2);


extern int strncasecmp(const char *s1, const char *s2, size_t n);





extern char * strnchr(const char *, size_t, int);




extern char * __attribute__((warn_unused_result)) skip_spaces(const char *);

extern char *strim(char *);

static inline __attribute__((always_inline)) __attribute__((warn_unused_result)) char *strstrip(char *str)
{
 return strim(str);
}


extern char * strstr(const char *, const char *);


extern char * strnstr(const char *, const char *, size_t);


extern __kernel_size_t strlen(const char *);


extern __kernel_size_t strnlen(const char *,__kernel_size_t);


extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);
# 109 "../../include/linux/string.h"
extern void * memscan(void *,int,__kernel_size_t);


extern int memcmp(const void *,const void *,__kernel_size_t);





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
# 9 "../../include/linux/bitmap.h" 2
# 90 "../../include/linux/bitmap.h"
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

extern void bitmap_set(unsigned long *map, int i, int len);
extern void bitmap_clear(unsigned long *map, int start, int nr);
extern unsigned long bitmap_find_next_zero_area(unsigned long *map,
      unsigned long size,
      unsigned long start,
      unsigned int nr,
      unsigned long align_mask);

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
# 154 "../../include/linux/bitmap.h"
static inline __attribute__((always_inline)) void bitmap_zero(unsigned long *dst, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 32))
  *dst = 0UL;
 else {
  int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  ({ void *__p = (dst); size_t __n = len; if ((__n) != 0) { if (__builtin_constant_p((0)) && (0) == 0) __memzero((__p),(__n)); else memset((__p),(0),(__n)); } (__p); });
 }
}

static inline __attribute__((always_inline)) void bitmap_fill(unsigned long *dst, int nbits)
{
 size_t nlongs = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)));
 if (!(__builtin_constant_p(nbits) && (nbits) <= 32)) {
  int len = (nlongs - 1) * sizeof(unsigned long);
  ({ void *__p = (dst); size_t __n = len; if ((__n) != 0) { if (__builtin_constant_p((0xff)) && (0xff) == 0) __memzero((__p),(__n)); else memset((__p),(0xff),(__n)); } (__p); });
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
# 94 "../../include/linux/nodemask.h" 2


typedef struct { unsigned long bits[((((1 << 0)) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } nodemask_t;
extern nodemask_t _unused_nodemask_arg_;


static inline __attribute__((always_inline)) void __node_set(int node, volatile nodemask_t *dstp)
{
 _set_bit_le(node,dstp->bits);
}


static inline __attribute__((always_inline)) void __node_clear(int node, volatile nodemask_t *dstp)
{
 _clear_bit_le(node,dstp->bits);
}


static inline __attribute__((always_inline)) void __nodes_setall(nodemask_t *dstp, int nbits)
{
 bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline)) void __nodes_clear(nodemask_t *dstp, int nbits)
{
 bitmap_zero(dstp->bits, nbits);
}






static inline __attribute__((always_inline)) int __node_test_and_set(int node, nodemask_t *addr)
{
 return _test_and_set_bit_le(node,addr->bits);
}



static inline __attribute__((always_inline)) void __nodes_and(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_or(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_xor(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_andnot(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_complement(nodemask_t *dstp,
     const nodemask_t *srcp, int nbits)
{
 bitmap_complement(dstp->bits, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_equal(const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 return bitmap_equal(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_intersects(const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodes_subset(const nodemask_t *src1p,
     const nodemask_t *src2p, int nbits)
{
 return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_empty(const nodemask_t *srcp, int nbits)
{
 return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_full(const nodemask_t *srcp, int nbits)
{
 return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodes_weight(const nodemask_t *srcp, int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_shift_right(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((always_inline)) void __nodes_shift_left(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}





static inline __attribute__((always_inline)) int __first_node(const nodemask_t *srcp)
{
 return ({ int __min1 = ((1 << 0)); int __min2 = (_find_first_bit_le(srcp->bits,(1 << 0))); __min1 < __min2 ? __min1: __min2; });
}


static inline __attribute__((always_inline)) int __next_node(int n, const nodemask_t *srcp)
{
 return ({ int __min1 = ((1 << 0)); int __min2 = (_find_next_bit_le(srcp->bits,(1 << 0),n+1)); __min1 < __min2 ? __min1: __min2; });
}

static inline __attribute__((always_inline)) void init_nodemask_of_node(nodemask_t *mask, int node)
{
 __nodes_clear(&(*mask), (1 << 0));
 __node_set((node), &(*mask));
}
# 264 "../../include/linux/nodemask.h"
static inline __attribute__((always_inline)) int __first_unset_node(const nodemask_t *maskp)
{
 return ({ int __min1 = ((1 << 0)); int __min2 = (_find_first_zero_bit_le(maskp->bits,(1 << 0))); __min1 < __min2 ? __min1: __min2; });

}
# 298 "../../include/linux/nodemask.h"
static inline __attribute__((always_inline)) int __nodemask_scnprintf(char *buf, int len,
     const nodemask_t *srcp, int nbits)
{
 return bitmap_scnprintf(buf, len, srcp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodemask_parse_user(const char *buf, int len,
     nodemask_t *dstp, int nbits)
{
 return bitmap_parse_user(buf, len, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __nodelist_scnprintf(char *buf, int len,
     const nodemask_t *srcp, int nbits)
{
 return bitmap_scnlistprintf(buf, len, srcp->bits, nbits);
}


static inline __attribute__((always_inline)) int __nodelist_parse(const char *buf, nodemask_t *dstp, int nbits)
{
 return bitmap_parselist(buf, dstp->bits, nbits);
}



static inline __attribute__((always_inline)) int __node_remap(int oldbit,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_remap(nodemask_t *dstp, const nodemask_t *srcp,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_onto(nodemask_t *dstp, const nodemask_t *origp,
  const nodemask_t *relmapp, int nbits)
{
 bitmap_onto(dstp->bits, origp->bits, relmapp->bits, nbits);
}



static inline __attribute__((always_inline)) void __nodes_fold(nodemask_t *dstp, const nodemask_t *origp,
  int sz, int nbits)
{
 bitmap_fold(dstp->bits, origp->bits, sz, nbits);
}
# 372 "../../include/linux/nodemask.h"
enum node_states {
 N_POSSIBLE,
 N_ONLINE,
 N_NORMAL_MEMORY,

 N_HIGH_MEMORY,



 N_CPU,
 NR_NODE_STATES
};






extern nodemask_t node_states[NR_NODE_STATES];
# 435 "../../include/linux/nodemask.h"
static inline __attribute__((always_inline)) int node_state(int node, enum node_states state)
{
 return node == 0;
}

static inline __attribute__((always_inline)) void node_set_state(int node, enum node_states state)
{
}

static inline __attribute__((always_inline)) void node_clear_state(int node, enum node_states state)
{
}

static inline __attribute__((always_inline)) int num_node_state(enum node_states state)
{
 return 1;
}
# 491 "../../include/linux/nodemask.h"
struct nodemask_scratch {
 nodemask_t mask1;
 nodemask_t mask2;
};
# 17 "../../include/linux/mmzone.h" 2
# 1 "../../include/linux/pageblock-flags.h" 1
# 29 "../../include/linux/pageblock-flags.h"
enum pageblock_bits {
 PB_migrate,
 PB_migrate_end = PB_migrate + 3 - 1,

 NR_PAGEBLOCK_BITS
};
# 60 "../../include/linux/pageblock-flags.h"
struct page;


unsigned long get_pageblock_flags_group(struct page *page,
     int start_bitidx, int end_bitidx);
void set_pageblock_flags_group(struct page *page, unsigned long flags,
     int start_bitidx, int end_bitidx);
# 18 "../../include/linux/mmzone.h" 2
# 1 "include/generated/bounds.h" 1
# 19 "../../include/linux/mmzone.h" 2

# 1 "../../arch/arm/include/asm/page.h" 1
# 26 "../../arch/arm/include/asm/page.h"
# 1 "../../arch/arm/include/asm/glue.h" 1
# 27 "../../arch/arm/include/asm/page.h" 2
# 119 "../../arch/arm/include/asm/page.h"
struct page;
struct vm_area_struct;

struct cpu_user_fns {
 void (*cpu_clear_user_highpage)(struct page *page, unsigned long vaddr);
 void (*cpu_copy_user_highpage)(struct page *to, struct page *from,
   unsigned long vaddr, struct vm_area_struct *vma);
};


extern struct cpu_user_fns cpu_user;
# 152 "../../arch/arm/include/asm/page.h"
extern void copy_page(void *to, const void *from);
# 178 "../../arch/arm/include/asm/page.h"
typedef unsigned long pte_t;
typedef unsigned long pmd_t;
typedef unsigned long pgd_t[2];
typedef unsigned long pgprot_t;
# 196 "../../arch/arm/include/asm/page.h"
typedef struct page *pgtable_t;





# 1 "../../arch/arm/include/asm/memory.h" 1
# 17 "../../arch/arm/include/asm/memory.h"
# 1 "../../include/linux/const.h" 1
# 18 "../../arch/arm/include/asm/memory.h" 2
# 1 "../../arch/arm/mach-s5pv310/include/mach/memory.h" 1
# 19 "../../arch/arm/include/asm/memory.h" 2
# 1 "../../arch/arm/include/asm/sizes.h" 1
# 20 "../../arch/arm/include/asm/memory.h" 2
# 182 "../../arch/arm/include/asm/memory.h"
static inline __attribute__((always_inline)) unsigned long virt_to_phys(void *x)
{
 return (((unsigned long)(x)) - (0xC0000000UL) + (0x40000000UL));
}

static inline __attribute__((always_inline)) void *phys_to_virt(unsigned long x)
{
 return (void *)((((unsigned long)(x)) - (0x40000000UL) + (0xC0000000UL)));
}
# 212 "../../arch/arm/include/asm/memory.h"
static inline __attribute__((always_inline)) __attribute__((deprecated)) unsigned long virt_to_bus(void *x)
{
 return (((unsigned long)x) - (0xC0000000UL) + (0x40000000UL));
}

static inline __attribute__((always_inline)) __attribute__((deprecated)) void *bus_to_virt(unsigned long x)
{
 return (void *)((x) - (0x40000000UL) + (0xC0000000UL));
}
# 317 "../../arch/arm/include/asm/memory.h"
# 1 "../../include/asm-generic/memory_model.h" 1
# 318 "../../arch/arm/include/asm/memory.h" 2
# 203 "../../arch/arm/include/asm/page.h" 2







# 1 "../../include/asm-generic/getorder.h" 1
# 9 "../../include/asm-generic/getorder.h"
static inline __attribute__((always_inline)) __attribute__((__const__)) int get_order(unsigned long size)
{
 int order;

 size = (size - 1) >> (12 - 1);
 order = -1;
 do {
  size >>= 1;
  order++;
 } while (size);
 return order;
}
# 211 "../../arch/arm/include/asm/page.h" 2
# 21 "../../include/linux/mmzone.h" 2
# 50 "../../include/linux/mmzone.h"
extern int page_group_by_mobility_disabled;

static inline __attribute__((always_inline)) int get_pageblock_migratetype(struct page *page)
{
 return get_pageblock_flags_group(page, PB_migrate, PB_migrate_end);
}

struct free_area {
 struct list_head free_list[5];
 unsigned long nr_free;
};

struct pglist_data;
# 71 "../../include/linux/mmzone.h"
struct zone_padding {
 char x[0];
} __attribute__((__aligned__(1 << (5))));





enum zone_stat_item {

 NR_FREE_PAGES,
 NR_LRU_BASE,
 NR_INACTIVE_ANON = NR_LRU_BASE,
 NR_ACTIVE_ANON,
 NR_INACTIVE_FILE,
 NR_ACTIVE_FILE,
 NR_UNEVICTABLE,
 NR_MLOCK,
 NR_ANON_PAGES,
 NR_FILE_MAPPED,

 NR_FILE_PAGES,
 NR_FILE_DIRTY,
 NR_WRITEBACK,
 NR_SLAB_RECLAIMABLE,
 NR_SLAB_UNRECLAIMABLE,
 NR_PAGETABLE,
 NR_KERNEL_STACK,

 NR_UNSTABLE_NFS,
 NR_BOUNCE,
 NR_VMSCAN_WRITE,
 NR_WRITEBACK_TEMP,
 NR_ISOLATED_ANON,
 NR_ISOLATED_FILE,
 NR_SHMEM,
# 115 "../../include/linux/mmzone.h"
 NR_VM_ZONE_STAT_ITEMS };
# 130 "../../include/linux/mmzone.h"
enum lru_list {
 LRU_INACTIVE_ANON = 0,
 LRU_ACTIVE_ANON = 0 + 1,
 LRU_INACTIVE_FILE = 0 + 2,
 LRU_ACTIVE_FILE = 0 + 2 + 1,
 LRU_UNEVICTABLE,
 NR_LRU_LISTS
};





static inline __attribute__((always_inline)) int is_file_lru(enum lru_list l)
{
 return (l == LRU_INACTIVE_FILE || l == LRU_ACTIVE_FILE);
}

static inline __attribute__((always_inline)) int is_active_lru(enum lru_list l)
{
 return (l == LRU_ACTIVE_ANON || l == LRU_ACTIVE_FILE);
}

static inline __attribute__((always_inline)) int is_unevictable_lru(enum lru_list l)
{
 return (l == LRU_UNEVICTABLE);
}

enum zone_watermarks {
 WMARK_MIN,
 WMARK_LOW,
 WMARK_HIGH,
 NR_WMARK
};





struct per_cpu_pages {
 int count;
 int high;
 int batch;


 struct list_head lists[3];
};

struct per_cpu_pageset {
 struct per_cpu_pages pcp;




 s8 stat_threshold;
 s8 vm_stat_diff[NR_VM_ZONE_STAT_ITEMS];

};



enum zone_type {
# 226 "../../include/linux/mmzone.h"
 ZONE_NORMAL,
# 236 "../../include/linux/mmzone.h"
 ZONE_HIGHMEM,

 ZONE_MOVABLE,
 __MAX_NR_ZONES
};
# 262 "../../include/linux/mmzone.h"
struct zone_reclaim_stat {
# 271 "../../include/linux/mmzone.h"
 unsigned long recent_rotated[2];
 unsigned long recent_scanned[2];




 unsigned long nr_saved_scan[NR_LRU_LISTS];
};

struct zone {



 unsigned long watermark[NR_WMARK];






 unsigned long percpu_drift_mark;
# 301 "../../include/linux/mmzone.h"
 unsigned long lowmem_reserve[3];
# 311 "../../include/linux/mmzone.h"
 struct per_cpu_pageset *pageset;



 spinlock_t lock;
 int all_unreclaimable;




 struct free_area free_area[11];
# 341 "../../include/linux/mmzone.h"
 struct zone_padding _pad1_;


 spinlock_t lru_lock;
 struct zone_lru {
  struct list_head list;
 } lru[NR_LRU_LISTS];

 struct zone_reclaim_stat reclaim_stat;

 unsigned long pages_scanned;
 unsigned long flags;


 atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
# 370 "../../include/linux/mmzone.h"
 int prev_priority;





 unsigned int inactive_ratio;


 struct zone_padding _pad2_;
# 406 "../../include/linux/mmzone.h"
 wait_queue_head_t * wait_table;
 unsigned long wait_table_hash_nr_entries;
 unsigned long wait_table_bits;




 struct pglist_data *zone_pgdat;

 unsigned long zone_start_pfn;
# 427 "../../include/linux/mmzone.h"
 unsigned long spanned_pages;
 unsigned long present_pages;




 const char *name;
} __attribute__((__aligned__(1 << (5))));

typedef enum {
 ZONE_RECLAIM_LOCKED,
 ZONE_OOM_LOCKED,
} zone_flags_t;

static inline __attribute__((always_inline)) void zone_set_flag(struct zone *zone, zone_flags_t flag)
{
 _set_bit_le(flag,&zone->flags);
}

static inline __attribute__((always_inline)) int zone_test_and_set_flag(struct zone *zone, zone_flags_t flag)
{
 return _test_and_set_bit_le(flag,&zone->flags);
}

static inline __attribute__((always_inline)) void zone_clear_flag(struct zone *zone, zone_flags_t flag)
{
 _clear_bit_le(flag,&zone->flags);
}

static inline __attribute__((always_inline)) int zone_is_reclaim_locked(const struct zone *zone)
{
 return test_bit(ZONE_RECLAIM_LOCKED, &zone->flags);
}

static inline __attribute__((always_inline)) int zone_is_oom_locked(const struct zone *zone)
{
 return test_bit(ZONE_OOM_LOCKED, &zone->flags);
}


unsigned long zone_nr_free_pages(struct zone *zone);
# 560 "../../include/linux/mmzone.h"
struct zonelist_cache;






struct zoneref {
 struct zone *zone;
 int zone_idx;
};
# 589 "../../include/linux/mmzone.h"
struct zonelist {
 struct zonelist_cache *zlcache_ptr;
 struct zoneref _zonerefs[((1 << 0) * 3) + 1];



};
# 607 "../../include/linux/mmzone.h"
extern struct page *mem_map;
# 621 "../../include/linux/mmzone.h"
struct bootmem_data;
typedef struct pglist_data {
 struct zone node_zones[3];
 struct zonelist node_zonelists[1];
 int nr_zones;







 struct bootmem_data *bdata;
# 645 "../../include/linux/mmzone.h"
 unsigned long node_start_pfn;
 unsigned long node_present_pages;
 unsigned long node_spanned_pages;

 int node_id;
 wait_queue_head_t kswapd_wait;
 struct task_struct *kswapd;
 int kswapd_max_order;
} pg_data_t;
# 664 "../../include/linux/mmzone.h"
# 1 "../../include/linux/memory_hotplug.h" 1



# 1 "../../include/linux/mmzone.h" 1
# 5 "../../include/linux/memory_hotplug.h" 2

# 1 "../../include/linux/notifier.h" 1
# 14 "../../include/linux/notifier.h"
# 1 "../../include/linux/rwsem.h" 1
# 17 "../../include/linux/rwsem.h"
struct rw_semaphore;


# 1 "../../include/linux/rwsem-spinlock.h" 1
# 22 "../../include/linux/rwsem-spinlock.h"
struct rwsem_waiter;
# 31 "../../include/linux/rwsem-spinlock.h"
struct rw_semaphore {
 __s32 activity;
 spinlock_t wait_lock;
 struct list_head wait_list;



};
# 53 "../../include/linux/rwsem-spinlock.h"
extern void __init_rwsem(struct rw_semaphore *sem, const char *name,
    struct lock_class_key *key);
# 63 "../../include/linux/rwsem-spinlock.h"
extern void __down_read(struct rw_semaphore *sem);
extern int __down_read_trylock(struct rw_semaphore *sem);
extern void __down_write(struct rw_semaphore *sem);
extern void __down_write_nested(struct rw_semaphore *sem, int subclass);
extern int __down_write_trylock(struct rw_semaphore *sem);
extern void __up_read(struct rw_semaphore *sem);
extern void __up_write(struct rw_semaphore *sem);
extern void __downgrade_write(struct rw_semaphore *sem);
extern int rwsem_is_locked(struct rw_semaphore *sem);
# 21 "../../include/linux/rwsem.h" 2







extern void down_read(struct rw_semaphore *sem);




extern int down_read_trylock(struct rw_semaphore *sem);




extern void down_write(struct rw_semaphore *sem);




extern int down_write_trylock(struct rw_semaphore *sem);




extern void up_read(struct rw_semaphore *sem);




extern void up_write(struct rw_semaphore *sem);




extern void downgrade_write(struct rw_semaphore *sem);
# 15 "../../include/linux/notifier.h" 2
# 1 "../../include/linux/srcu.h" 1
# 32 "../../include/linux/srcu.h"
struct srcu_struct_array {
 int c[2];
};

struct srcu_struct {
 int completed;
 struct srcu_struct_array *per_cpu_ref;
 struct mutex mutex;



};
# 70 "../../include/linux/srcu.h"
int init_srcu_struct(struct srcu_struct *sp);






void cleanup_srcu_struct(struct srcu_struct *sp);
int __srcu_read_lock(struct srcu_struct *sp) ;
void __srcu_read_unlock(struct srcu_struct *sp, int idx) ;
void synchronize_srcu(struct srcu_struct *sp);
void synchronize_srcu_expedited(struct srcu_struct *sp);
long srcu_batches_completed(struct srcu_struct *sp);
# 103 "../../include/linux/srcu.h"
static inline __attribute__((always_inline)) int srcu_read_lock_held(struct srcu_struct *sp)
{
 return 1;
}
# 125 "../../include/linux/srcu.h"
static inline __attribute__((always_inline)) int srcu_read_lock(struct srcu_struct *sp)
{
 int retval = __srcu_read_lock(sp);

 do { } while (0);
 return retval;
}
# 140 "../../include/linux/srcu.h"
static inline __attribute__((always_inline)) void srcu_read_unlock(struct srcu_struct *sp, int idx)

{
 do { } while (0);
 __srcu_read_unlock(sp, idx);
}
# 16 "../../include/linux/notifier.h" 2
# 50 "../../include/linux/notifier.h"
struct notifier_block {
 int (*notifier_call)(struct notifier_block *, unsigned long, void *);
 struct notifier_block *next;
 int priority;
};

struct atomic_notifier_head {
 spinlock_t lock;
 struct notifier_block *head;
};

struct blocking_notifier_head {
 struct rw_semaphore rwsem;
 struct notifier_block *head;
};

struct raw_notifier_head {
 struct notifier_block *head;
};

struct srcu_notifier_head {
 struct mutex mutex;
 struct srcu_struct srcu;
 struct notifier_block *head;
};
# 89 "../../include/linux/notifier.h"
extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
# 115 "../../include/linux/notifier.h"
extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int blocking_notifier_chain_cond_register(
  struct blocking_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
  unsigned long val, void *v);
extern int __atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
  unsigned long val, void *v);
extern int __blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
  unsigned long val, void *v);
extern int __raw_notifier_call_chain(struct raw_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
  unsigned long val, void *v);
extern int __srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
# 165 "../../include/linux/notifier.h"
static inline __attribute__((always_inline)) int notifier_from_errno(int err)
{
 if (err)
  return 0x8000 | (0x0001 - err);

 return 0x0001;
}


static inline __attribute__((always_inline)) int notifier_to_errno(int ret)
{
 ret &= ~0x8000;
 return ret > 0x0001 ? 0x0001 - ret : 0;
}
# 271 "../../include/linux/notifier.h"
extern struct blocking_notifier_head reboot_notifier_list;
# 7 "../../include/linux/memory_hotplug.h" 2

struct page;
struct zone;
struct pglist_data;
struct mem_section;
# 164 "../../include/linux/memory_hotplug.h"
static inline __attribute__((always_inline)) void pgdat_resize_lock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline)) void pgdat_resize_unlock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline)) void pgdat_resize_init(struct pglist_data *pgdat) {}

static inline __attribute__((always_inline)) unsigned zone_span_seqbegin(struct zone *zone)
{
 return 0;
}
static inline __attribute__((always_inline)) int zone_span_seqretry(struct zone *zone, unsigned iv)
{
 return 0;
}
static inline __attribute__((always_inline)) void zone_span_writelock(struct zone *zone) {}
static inline __attribute__((always_inline)) void zone_span_writeunlock(struct zone *zone) {}
static inline __attribute__((always_inline)) void zone_seqlock_init(struct zone *zone) {}

static inline __attribute__((always_inline)) int mhp_notimplemented(const char *func)
{
 printk("<4>" "%s() called, with CONFIG_MEMORY_HOTPLUG disabled\n", func);
 dump_stack();
 return -38;
}

static inline __attribute__((always_inline)) void register_page_bootmem_info_node(struct pglist_data *pgdat)
{
}
# 198 "../../include/linux/memory_hotplug.h"
static inline __attribute__((always_inline)) int is_mem_section_removable(unsigned long pfn,
     unsigned long nr_pages)
{
 return 0;
}


extern int mem_online_node(int nid);
extern int add_memory(int nid, u64 start, u64 size);
extern int arch_add_memory(int nid, u64 start, u64 size);
extern int remove_memory(u64 start, u64 size);
extern int sparse_add_one_section(struct zone *zone, unsigned long start_pfn,
        int nr_pages);
extern void sparse_remove_one_section(struct zone *zone, struct mem_section *ms);
extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
       unsigned long pnum);
# 665 "../../include/linux/mmzone.h" 2

extern struct mutex zonelists_mutex;
void get_zone_counts(unsigned long *active, unsigned long *inactive,
   unsigned long *free);
void build_all_zonelists(void *data);
void wakeup_kswapd(struct zone *zone, int order);
int zone_watermark_ok(struct zone *z, int order, unsigned long mark,
  int classzone_idx, int alloc_flags);
enum memmap_context {
 MEMMAP_EARLY,
 MEMMAP_HOTPLUG,
};
extern int init_currently_empty_zone(struct zone *zone, unsigned long start_pfn,
         unsigned long size,
         enum memmap_context context);


void memory_present(int nid, unsigned long start, unsigned long end);







static inline __attribute__((always_inline)) int local_memory_node(int node_id) { return node_id; };
# 702 "../../include/linux/mmzone.h"
static inline __attribute__((always_inline)) int populated_zone(struct zone *zone)
{
 return (!!zone->present_pages);
}

extern int movable_zone;

static inline __attribute__((always_inline)) int zone_movable_is_highmem(void)
{



 return 0;

}

static inline __attribute__((always_inline)) int is_highmem_idx(enum zone_type idx)
{

 return (idx == ZONE_HIGHMEM ||
  (idx == ZONE_MOVABLE && zone_movable_is_highmem()));



}

static inline __attribute__((always_inline)) int is_normal_idx(enum zone_type idx)
{
 return (idx == ZONE_NORMAL);
}







static inline __attribute__((always_inline)) int is_highmem(struct zone *zone)
{

 int zone_off = (char *)zone - (char *)zone->zone_pgdat->node_zones;
 return zone_off == ZONE_HIGHMEM * sizeof(*zone) ||
        (zone_off == ZONE_MOVABLE * sizeof(*zone) &&
  zone_movable_is_highmem());



}

static inline __attribute__((always_inline)) int is_normal(struct zone *zone)
{
 return zone == zone->zone_pgdat->node_zones + ZONE_NORMAL;
}

static inline __attribute__((always_inline)) int is_dma32(struct zone *zone)
{



 return 0;

}

static inline __attribute__((always_inline)) int is_dma(struct zone *zone)
{



 return 0;

}


struct ctl_table;
int min_free_kbytes_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int sysctl_lowmem_reserve_ratio[3 -1];
int lowmem_reserve_ratio_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int percpu_pagelist_fraction_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int sysctl_min_unmapped_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
int sysctl_min_slab_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);

extern int numa_zonelist_order_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
extern char numa_zonelist_order[];




extern struct pglist_data contig_page_data;
# 805 "../../include/linux/mmzone.h"
extern struct pglist_data *first_online_pgdat(void);
extern struct pglist_data *next_online_pgdat(struct pglist_data *pgdat);
extern struct zone *next_zone(struct zone *zone);
# 837 "../../include/linux/mmzone.h"
static inline __attribute__((always_inline)) struct zone *zonelist_zone(struct zoneref *zoneref)
{
 return zoneref->zone;
}

static inline __attribute__((always_inline)) int zonelist_zone_idx(struct zoneref *zoneref)
{
 return zoneref->zone_idx;
}

static inline __attribute__((always_inline)) int zonelist_node_idx(struct zoneref *zoneref)
{




 return 0;

}
# 870 "../../include/linux/mmzone.h"
struct zoneref *next_zones_zonelist(struct zoneref *z,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes,
     struct zone **zone);
# 887 "../../include/linux/mmzone.h"
static inline __attribute__((always_inline)) struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes,
     struct zone **zone)
{
 return next_zones_zonelist(zonelist->_zonerefs, highest_zoneidx, nodes,
        zone);
}
# 925 "../../include/linux/mmzone.h"
# 1 "../../arch/arm/include/asm/sparsemem.h" 1
# 926 "../../include/linux/mmzone.h" 2




static inline __attribute__((always_inline)) unsigned long early_pfn_to_nid(unsigned long pfn)
{
 return 0;
}
# 968 "../../include/linux/mmzone.h"
struct page;
struct page_cgroup;
struct mem_section {
# 983 "../../include/linux/mmzone.h"
 unsigned long section_mem_map;


 unsigned long *pageblock_flags;
# 995 "../../include/linux/mmzone.h"
};
# 1008 "../../include/linux/mmzone.h"
extern struct mem_section *mem_section[((((1UL << (32 - 28))) + ((((1UL) << 12) / sizeof (struct mem_section))) - 1) / ((((1UL) << 12) / sizeof (struct mem_section))))];




static inline __attribute__((always_inline)) struct mem_section *__nr_to_section(unsigned long nr)
{
 if (!mem_section[((nr) / (((1UL) << 12) / sizeof (struct mem_section)))])
  return ((void *)0);
 return &mem_section[((nr) / (((1UL) << 12) / sizeof (struct mem_section)))][nr & ((((1UL) << 12) / sizeof (struct mem_section)) - 1)];
}
extern int __section_nr(struct mem_section* ms);
extern unsigned long usemap_size(void);
# 1033 "../../include/linux/mmzone.h"
static inline __attribute__((always_inline)) struct page *__section_mem_map_addr(struct mem_section *section)
{
 unsigned long map = section->section_mem_map;
 map &= (~((1UL<<2)-1));
 return (struct page *)map;
}

static inline __attribute__((always_inline)) int present_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<0)));
}

static inline __attribute__((always_inline)) int present_section_nr(unsigned long nr)
{
 return present_section(__nr_to_section(nr));
}

static inline __attribute__((always_inline)) int valid_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<1)));
}

static inline __attribute__((always_inline)) int valid_section_nr(unsigned long nr)
{
 return valid_section(__nr_to_section(nr));
}

static inline __attribute__((always_inline)) struct mem_section *__pfn_to_section(unsigned long pfn)
{
 return __nr_to_section(((pfn) >> (28 - 12)));
}

static inline __attribute__((always_inline)) int pfn_valid(unsigned long pfn)
{
 if (((pfn) >> (28 - 12)) >= (1UL << (32 - 28)))
  return 0;
 return valid_section(__nr_to_section(((pfn) >> (28 - 12))));
}

static inline __attribute__((always_inline)) int pfn_present(unsigned long pfn)
{
 if (((pfn) >> (28 - 12)) >= (1UL << (32 - 28)))
  return 0;
 return present_section(__nr_to_section(((pfn) >> (28 - 12))));
}
# 1095 "../../include/linux/mmzone.h"
void sparse_init(void);
# 1111 "../../include/linux/mmzone.h"
void memory_present(int nid, unsigned long start, unsigned long end);
unsigned long __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) node_memmap_size_bytes(int, unsigned long, unsigned long);
# 1145 "../../include/linux/mmzone.h"
static inline __attribute__((always_inline)) int memmap_valid_within(unsigned long pfn,
     struct page *page, struct zone *zone)
{
 return 1;
}
# 5 "../../include/linux/gfp.h" 2


# 1 "../../include/linux/topology.h" 1
# 30 "../../include/linux/topology.h"
# 1 "../../include/linux/cpumask.h" 1
# 13 "../../include/linux/cpumask.h"
typedef struct cpumask { unsigned long bits[(((2) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } cpumask_t;
# 27 "../../include/linux/cpumask.h"
extern int nr_cpu_ids;
# 78 "../../include/linux/cpumask.h"
extern const struct cpumask *const cpu_possible_mask;
extern const struct cpumask *const cpu_online_mask;
extern const struct cpumask *const cpu_present_mask;
extern const struct cpumask *const cpu_active_mask;
# 104 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_check(unsigned int cpu)
{



 return cpu;
}
# 157 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_first(const struct cpumask *srcp)
{
 return _find_first_bit_le(((srcp)->bits),2);
}
# 169 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_next(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return _find_next_bit_le(((srcp)->bits),2,n+1);
}
# 184 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) unsigned int cpumask_next_zero(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return _find_next_zero_bit_le(((srcp)->bits),2,n+1);
}

int cpumask_next_and(int n, const struct cpumask *, const struct cpumask *);
int cpumask_any_but(const struct cpumask *mask, unsigned int cpu);
# 254 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 _set_bit_le(cpumask_check(cpu),((dstp)->bits));
}






static inline __attribute__((always_inline)) void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 _clear_bit_le(cpumask_check(cpu),((dstp)->bits));
}
# 286 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_test_and_set_cpu(int cpu, struct cpumask *cpumask)
{
 return _test_and_set_bit_le(cpumask_check(cpu),((cpumask)->bits));
}
# 298 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
{
 return _test_and_clear_bit_le(cpumask_check(cpu),((cpumask)->bits));
}





static inline __attribute__((always_inline)) void cpumask_setall(struct cpumask *dstp)
{
 bitmap_fill(((dstp)->bits), 2);
}





static inline __attribute__((always_inline)) void cpumask_clear(struct cpumask *dstp)
{
 bitmap_zero(((dstp)->bits), 2);
}







static inline __attribute__((always_inline)) int cpumask_and(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 return bitmap_and(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 2);
}







static inline __attribute__((always_inline)) void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 bitmap_or(((dstp)->bits), ((src1p)->bits),
          ((src2p)->bits), 2);
}







static inline __attribute__((always_inline)) void cpumask_xor(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 bitmap_xor(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), 2);
}







static inline __attribute__((always_inline)) int cpumask_andnot(struct cpumask *dstp,
      const struct cpumask *src1p,
      const struct cpumask *src2p)
{
 return bitmap_andnot(((dstp)->bits), ((src1p)->bits),
       ((src2p)->bits), 2);
}






static inline __attribute__((always_inline)) void cpumask_complement(struct cpumask *dstp,
          const struct cpumask *srcp)
{
 bitmap_complement(((dstp)->bits), ((srcp)->bits),
           2);
}






static inline __attribute__((always_inline)) bool cpumask_equal(const struct cpumask *src1p,
    const struct cpumask *src2p)
{
 return bitmap_equal(((src1p)->bits), ((src2p)->bits),
       2);
}






static inline __attribute__((always_inline)) bool cpumask_intersects(const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 return bitmap_intersects(((src1p)->bits), ((src2p)->bits),
            2);
}






static inline __attribute__((always_inline)) int cpumask_subset(const struct cpumask *src1p,
     const struct cpumask *src2p)
{
 return bitmap_subset(((src1p)->bits), ((src2p)->bits),
        2);
}





static inline __attribute__((always_inline)) bool cpumask_empty(const struct cpumask *srcp)
{
 return bitmap_empty(((srcp)->bits), 2);
}





static inline __attribute__((always_inline)) bool cpumask_full(const struct cpumask *srcp)
{
 return bitmap_full(((srcp)->bits), 2);
}





static inline __attribute__((always_inline)) unsigned int cpumask_weight(const struct cpumask *srcp)
{
 return bitmap_weight(((srcp)->bits), 2);
}







static inline __attribute__((always_inline)) void cpumask_shift_right(struct cpumask *dstp,
           const struct cpumask *srcp, int n)
{
 bitmap_shift_right(((dstp)->bits), ((srcp)->bits), n,
            2);
}







static inline __attribute__((always_inline)) void cpumask_shift_left(struct cpumask *dstp,
          const struct cpumask *srcp, int n)
{
 bitmap_shift_left(((dstp)->bits), ((srcp)->bits), n,
           2);
}






static inline __attribute__((always_inline)) void cpumask_copy(struct cpumask *dstp,
    const struct cpumask *srcp)
{
 bitmap_copy(((dstp)->bits), ((srcp)->bits), 2);
}
# 529 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_scnprintf(char *buf, int len,
        const struct cpumask *srcp)
{
 return bitmap_scnprintf(buf, len, ((srcp)->bits), 2);
}
# 543 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpumask_parse_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parse_user(buf, len, ((dstp)->bits), 2);
}
# 558 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpulist_scnprintf(char *buf, int len,
        const struct cpumask *srcp)
{
 return bitmap_scnlistprintf(buf, len, ((srcp)->bits),
        2);
}
# 573 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int cpulist_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parselist(buf, ((dstp)->bits), 2);
}






static inline __attribute__((always_inline)) size_t cpumask_size(void)
{


 return (((2) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(long);
}
# 618 "../../include/linux/cpumask.h"
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




extern const unsigned long cpu_all_bits[(((2) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
# 670 "../../include/linux/cpumask.h"
void set_cpu_possible(unsigned int cpu, bool possible);
void set_cpu_present(unsigned int cpu, bool present);
void set_cpu_online(unsigned int cpu, bool online);
void set_cpu_active(unsigned int cpu, bool active);
void init_cpu_present(const struct cpumask *src);
void init_cpu_possible(const struct cpumask *src);
void init_cpu_online(const struct cpumask *src);
# 692 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) int __check_is_bitmap(const unsigned long *bitmap)
{
 return 1;
}
# 704 "../../include/linux/cpumask.h"
extern const unsigned long
 cpu_bit_bitmap[32 +1][(((2) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];

static inline __attribute__((always_inline)) const struct cpumask *get_cpu_mask(unsigned int cpu)
{
 const unsigned long *p = cpu_bit_bitmap[1 + cpu % 32];
 p -= cpu / 32;
 return ((struct cpumask *)(1 ? (p) : (void *)sizeof(__check_is_bitmap(p))));
}
# 781 "../../include/linux/cpumask.h"
int __first_cpu(const cpumask_t *srcp);
int __next_cpu(int n, const cpumask_t *srcp);
int __any_online_cpu(const cpumask_t *mask);
# 811 "../../include/linux/cpumask.h"
static inline __attribute__((always_inline)) void __cpu_set(int cpu, volatile cpumask_t *dstp)
{
 _set_bit_le(cpu,dstp->bits);
}


static inline __attribute__((always_inline)) void __cpu_clear(int cpu, volatile cpumask_t *dstp)
{
 _clear_bit_le(cpu,dstp->bits);
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
 return _test_and_set_bit_le(cpu,addr->bits);
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


static inline __attribute__((always_inline)) int __cpus_weight(const cpumask_t *srcp, int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline)) void __cpus_shift_left(cpumask_t *dstp,
     const cpumask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}
# 31 "../../include/linux/topology.h" 2


# 1 "../../include/linux/smp.h" 1
# 14 "../../include/linux/smp.h"
extern void cpu_idle(void);

struct call_single_data {
 struct list_head list;
 void (*func) (void *info);
 void *info;
 u16 flags;
 u16 priv;
};


extern unsigned int total_cpus;

int smp_call_function_single(int cpuid, void (*func) (void *info), void *info,
    int wait);







# 1 "../../arch/arm/include/asm/smp.h" 1
# 17 "../../arch/arm/include/asm/smp.h"
# 1 "../../arch/arm/mach-s5pv310/include/mach/smp.h" 1
# 9 "../../arch/arm/mach-s5pv310/include/mach/smp.h"
# 1 "../../arch/arm/include/asm/hardware/gic.h" 1
# 36 "../../arch/arm/include/asm/hardware/gic.h"
void gic_dist_init(unsigned int gic_nr, void *base, unsigned int irq_start);
void gic_cpu_init(unsigned int gic_nr, void *base);
void gic_cascade_irq(unsigned int gic_nr, unsigned int irq);
void gic_raise_softirq(const struct cpumask *mask, unsigned int irq);
# 10 "../../arch/arm/mach-s5pv310/include/mach/smp.h" 2

extern void *gic_cpu_base_addr;
# 24 "../../arch/arm/mach-s5pv310/include/mach/smp.h"
static inline __attribute__((always_inline)) void smp_cross_call(const struct cpumask *mask)
{
 gic_raise_softirq(mask, 1);
}
# 18 "../../arch/arm/include/asm/smp.h" 2
# 31 "../../arch/arm/include/asm/smp.h"
struct seq_file;




extern void show_ipi_list(struct seq_file *p);




 void do_IPI(struct pt_regs *regs);




extern void smp_init_cpus(void);




extern void smp_store_cpu_info(unsigned int cpuid);




extern void smp_cross_call(const struct cpumask *mask);





extern int boot_secondary(unsigned int cpu, struct task_struct *);





 void secondary_start_kernel(void);




extern void platform_secondary_init(unsigned int cpu);




struct secondary_data {
 unsigned long pgdir;
 void *stack;
};
extern struct secondary_data secondary_data;

extern int __cpu_disable(void);
extern int platform_cpu_disable(unsigned int cpu);

extern void __cpu_die(unsigned int cpu);
extern void cpu_die(void);

extern void platform_cpu_die(unsigned int cpu);
extern int platform_cpu_kill(unsigned int cpu);
extern void platform_cpu_enable(unsigned int cpu);

extern void arch_send_call_function_single_ipi(int cpu);
extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);




extern void show_local_irqs(struct seq_file *);
# 37 "../../include/linux/smp.h" 2
# 46 "../../include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum);




extern void smp_cpus_done(unsigned int max_cpus);




int smp_call_function(void(*func)(void *info), void *info, int wait);
void smp_call_function_many(const struct cpumask *mask,
       void (*func)(void *info), void *info, bool wait);

void __smp_call_function_single(int cpuid, struct call_single_data *data,
    int wait);

int smp_call_function_any(const struct cpumask *mask,
     void (*func)(void *info), void *info, int wait);





void generic_smp_call_function_single_interrupt(void);
void generic_smp_call_function_interrupt(void);
void ipi_call_lock(void);
void ipi_call_unlock(void);
void ipi_call_lock_irq(void);
void ipi_call_unlock_irq(void);





int on_each_cpu(void (*func) (void *info), void *info, int wait);
# 113 "../../include/linux/smp.h"
void smp_prepare_boot_cpu(void);

extern unsigned int setup_max_cpus;
# 183 "../../include/linux/smp.h"
extern void arch_disable_smp_support(void);

void smp_setup_processor_id(void);
# 34 "../../include/linux/topology.h" 2
# 1 "../../include/linux/percpu.h" 1






# 1 "../../include/linux/pfn.h" 1
# 8 "../../include/linux/percpu.h" 2


# 1 "../../arch/arm/include/asm/percpu.h" 1



# 1 "../../include/asm-generic/percpu.h" 1





# 1 "../../include/linux/percpu-defs.h" 1
# 7 "../../include/asm-generic/percpu.h" 2
# 18 "../../include/asm-generic/percpu.h"
extern unsigned long __per_cpu_offset[2];
# 5 "../../arch/arm/include/asm/percpu.h" 2
# 11 "../../include/linux/percpu.h" 2
# 64 "../../include/linux/percpu.h"
extern void *pcpu_base_addr;
extern const unsigned long *pcpu_unit_offsets;

struct pcpu_group_info {
 int nr_units;
 unsigned long base_offset;
 unsigned int *cpu_map;

};

struct pcpu_alloc_info {
 size_t static_size;
 size_t reserved_size;
 size_t dyn_size;
 size_t unit_size;
 size_t atom_size;
 size_t alloc_size;
 size_t __ai_size;
 int nr_groups;
 struct pcpu_group_info groups[];
};

enum pcpu_fc {
 PCPU_FC_AUTO,
 PCPU_FC_EMBED,
 PCPU_FC_PAGE,

 PCPU_FC_NR,
};
extern const char *pcpu_fc_names[PCPU_FC_NR];

extern enum pcpu_fc pcpu_chosen_fc;

typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size,
         size_t align);
typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);

extern struct pcpu_alloc_info * __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_alloc_alloc_info(int nr_groups,
            int nr_units);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_free_alloc_info(struct pcpu_alloc_info *ai);

extern struct pcpu_alloc_info * __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_build_alloc_info(
    size_t reserved_size, ssize_t dyn_size,
    size_t atom_size,
    pcpu_fc_cpu_distance_fn_t cpu_distance_fn);

extern int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
      void *base_addr);
# 137 "../../include/linux/percpu.h"
extern void *__alloc_reserved_percpu(size_t size, size_t align);
extern bool is_kernel_percpu_address(unsigned long addr);


extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) setup_per_cpu_areas(void);
# 163 "../../include/linux/percpu.h"
extern void *__alloc_percpu(size_t size, size_t align);
extern void free_percpu(void *__pdata);
extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
# 229 "../../include/linux/percpu.h"
extern void __bad_size_call_parameter(void);
# 35 "../../include/linux/topology.h" 2
# 1 "../../arch/arm/include/asm/topology.h" 1



# 1 "../../include/asm-generic/topology.h" 1
# 5 "../../arch/arm/include/asm/topology.h" 2
# 36 "../../include/linux/topology.h" 2
# 49 "../../include/linux/topology.h"
int arch_update_cpu_topology(void);
# 246 "../../include/linux/topology.h"
static inline __attribute__((always_inline)) int numa_node_id(void)
{
 return ((void)((current_thread_info()->cpu)),0);
}
# 294 "../../include/linux/topology.h"
static inline __attribute__((always_inline)) void set_numa_mem(int node) {}

static inline __attribute__((always_inline)) void set_cpu_numa_mem(int cpu, int node) {}



static inline __attribute__((always_inline)) int numa_mem_id(void)
{
 return numa_node_id();
}
# 8 "../../include/linux/gfp.h" 2
# 1 "../../include/linux/mmdebug.h" 1
# 9 "../../include/linux/gfp.h" 2

struct vm_area_struct;
# 121 "../../include/linux/gfp.h"
static inline __attribute__((always_inline)) int allocflags_to_migratetype(gfp_t gfp_flags)
{
 ({ int __ret_warn_on = !!((gfp_flags & ((( gfp_t)0x80000u)|(( gfp_t)0x08u))) == ((( gfp_t)0x80000u)|(( gfp_t)0x08u))); if (__builtin_expect(!!(__ret_warn_on), 0)) warn_slowpath_null("../../include/linux/gfp.h", 123); __builtin_expect(!!(__ret_warn_on), 0); });

 if (__builtin_expect(!!(page_group_by_mobility_disabled), 0))
  return 0;


 return (((gfp_flags & (( gfp_t)0x08u)) != 0) << 1) |
  ((gfp_flags & (( gfp_t)0x80000u)) != 0);
}
# 216 "../../include/linux/gfp.h"
static inline __attribute__((always_inline)) enum zone_type gfp_zone(gfp_t flags)
{
 enum zone_type z;
 int bit = flags & ((( gfp_t)0x01u)|(( gfp_t)0x02u)|(( gfp_t)0x04u)|(( gfp_t)0x08u));

 z = (( (ZONE_NORMAL << 0 * 2) | (ZONE_NORMAL << (( gfp_t)0x01u) * 2) | (ZONE_HIGHMEM << (( gfp_t)0x02u) * 2) | (ZONE_NORMAL << (( gfp_t)0x04u) * 2) | (ZONE_NORMAL << (( gfp_t)0x08u) * 2) | (ZONE_NORMAL << ((( gfp_t)0x08u) | (( gfp_t)0x01u)) * 2) | (ZONE_MOVABLE << ((( gfp_t)0x08u) | (( gfp_t)0x02u)) * 2) | (ZONE_NORMAL << ((( gfp_t)0x08u) | (( gfp_t)0x04u)) * 2)) >> (bit * 2)) &
      ((1 << 2) - 1);

 if (__builtin_constant_p(bit))
  ((void)sizeof(char[1 - 2 * !!((( 1 << ((( gfp_t)0x01u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x01u) | (( gfp_t)0x04u)) | 1 << ((( gfp_t)0x04u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x01u) | (( gfp_t)0x04u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x02u) | (( gfp_t)0x01u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x04u) | (( gfp_t)0x01u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x04u) | (( gfp_t)0x02u)) | 1 << ((( gfp_t)0x08u) | (( gfp_t)0x04u) | (( gfp_t)0x01u) | (( gfp_t)0x02u))) >> bit) & 1)]));
 else {



 }
 return z;
}
# 241 "../../include/linux/gfp.h"
static inline __attribute__((always_inline)) int gfp_zonelist(gfp_t flags)
{
 if (0 && __builtin_expect(!!(flags & (( gfp_t)0x40000u)), 0))
  return 1;

 return 0;
}
# 258 "../../include/linux/gfp.h"
static inline __attribute__((always_inline)) struct zonelist *node_zonelist(int nid, gfp_t flags)
{
 return (&contig_page_data)->node_zonelists + gfp_zonelist(flags);
}


static inline __attribute__((always_inline)) void arch_free_page(struct page *page, int order) { }


static inline __attribute__((always_inline)) void arch_alloc_page(struct page *page, int order) { }


struct page *
__alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order,
         struct zonelist *zonelist, nodemask_t *nodemask);

static inline __attribute__((always_inline)) struct page *
__alloc_pages(gfp_t gfp_mask, unsigned int order,
  struct zonelist *zonelist)
{
 return __alloc_pages_nodemask(gfp_mask, order, zonelist, ((void *)0));
}

static inline __attribute__((always_inline)) struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
      unsigned int order)
{

 if (nid < 0)
  nid = numa_node_id();

 return __alloc_pages(gfp_mask, order, node_zonelist(nid, gfp_mask));
}

static inline __attribute__((always_inline)) struct page *alloc_pages_exact_node(int nid, gfp_t gfp_mask,
      unsigned int order)
{
 do { } while (0);

 return __alloc_pages(gfp_mask, order, node_zonelist(nid, gfp_mask));
}
# 316 "../../include/linux/gfp.h"
extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
extern unsigned long get_zeroed_page(gfp_t gfp_mask);

void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
void free_pages_exact(void *virt, size_t size);







extern void __free_pages(struct page *page, unsigned int order);
extern void free_pages(unsigned long addr, unsigned int order);
extern void free_hot_cold_page(struct page *page, int cold);




void page_alloc_init(void);
void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
void drain_all_pages(void);
void drain_local_pages(void *dummy);

extern gfp_t gfp_allowed_mask;

extern void set_gfp_allowed_mask(gfp_t mask);
extern gfp_t clear_gfp_allowed_mask(gfp_t mask);
# 23 "../../include/linux/kmod.h" 2



# 1 "../../include/linux/workqueue.h" 1







# 1 "../../include/linux/timer.h" 1




# 1 "../../include/linux/ktime.h" 1
# 25 "../../include/linux/ktime.h"
# 1 "../../include/linux/jiffies.h" 1







# 1 "../../include/linux/timex.h" 1
# 64 "../../include/linux/timex.h"
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
# 171 "../../include/linux/timex.h"
# 1 "../../include/linux/param.h" 1



# 1 "../../arch/arm/include/asm/param.h" 1
# 5 "../../include/linux/param.h" 2
# 172 "../../include/linux/timex.h" 2

# 1 "../../arch/arm/include/asm/timex.h" 1
# 15 "../../arch/arm/include/asm/timex.h"
# 1 "../../arch/arm/mach-s5pv310/include/mach/timex.h" 1
# 16 "../../arch/arm/include/asm/timex.h" 2

typedef unsigned long cycles_t;

static inline __attribute__((always_inline)) cycles_t get_cycles (void)
{
 return 0;
}
# 174 "../../include/linux/timex.h" 2
# 233 "../../include/linux/timex.h"
extern unsigned long tick_usec;
extern unsigned long tick_nsec;




extern int time_status;

extern void ntp_init(void);
extern void ntp_clear(void);





static inline __attribute__((always_inline)) int ntp_synced(void)
{
 return !(time_status & 0x0040);
}
# 266 "../../include/linux/timex.h"
extern u64 tick_length;

extern void second_overflow(void);
extern void update_ntp_one_tick(void);
extern int do_adjtimex(struct timex *);

int read_current_timer(unsigned long *timer_val);
# 9 "../../include/linux/jiffies.h" 2
# 81 "../../include/linux/jiffies.h"
extern u64 __attribute__((section(".data"))) jiffies_64;
extern unsigned long volatile __attribute__((section(".data"))) jiffies;


u64 get_jiffies_64(void);
# 183 "../../include/linux/jiffies.h"
extern unsigned long preset_lpj;
# 296 "../../include/linux/jiffies.h"
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
extern unsigned long nsecs_to_jiffies(u64 n);
# 26 "../../include/linux/ktime.h" 2
# 46 "../../include/linux/ktime.h"
union ktime {
 s64 tv64;

 struct {



 s32 nsec, sec;

 } tv;

};

typedef union ktime ktime_t;
# 151 "../../include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_set(const long secs, const unsigned long nsecs)
{
 return (ktime_t) { .tv = { .sec = secs, .nsec = nsecs } };
}
# 163 "../../include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_sub(const ktime_t lhs, const ktime_t rhs)
{
 ktime_t res;

 res.tv64 = lhs.tv64 - rhs.tv64;
 if (res.tv.nsec < 0)
  res.tv.nsec += 1000000000L;

 return res;
}
# 181 "../../include/linux/ktime.h"
static inline __attribute__((always_inline)) ktime_t ktime_add(const ktime_t add1, const ktime_t add2)
{
 ktime_t res;

 res.tv64 = add1.tv64 + add2.tv64;
# 194 "../../include/linux/ktime.h"
 if (res.tv.nsec >= 1000000000L)
  res.tv64 += (u32)-1000000000L;

 return res;
}
# 207 "../../include/linux/ktime.h"
extern ktime_t ktime_add_ns(const ktime_t kt, u64 nsec);
# 216 "../../include/linux/ktime.h"
extern ktime_t ktime_sub_ns(const ktime_t kt, u64 nsec);







static inline __attribute__((always_inline)) ktime_t timespec_to_ktime(const struct timespec ts)
{
 return (ktime_t) { .tv = { .sec = (s32)ts.tv_sec,
          .nsec = (s32)ts.tv_nsec } };
}







static inline __attribute__((always_inline)) ktime_t timeval_to_ktime(const struct timeval tv)
{
 return (ktime_t) { .tv = { .sec = (s32)tv.tv_sec,
       .nsec = (s32)tv.tv_usec * 1000 } };
}







static inline __attribute__((always_inline)) struct timespec ktime_to_timespec(const ktime_t kt)
{
 return (struct timespec) { .tv_sec = (time_t) kt.tv.sec,
       .tv_nsec = (long) kt.tv.nsec };
}







static inline __attribute__((always_inline)) struct timeval ktime_to_timeval(const ktime_t kt)
{
 return (struct timeval) {
  .tv_sec = (time_t) kt.tv.sec,
  .tv_usec = (suseconds_t) (kt.tv.nsec / 1000L) };
}







static inline __attribute__((always_inline)) s64 ktime_to_ns(const ktime_t kt)
{
 return (s64) kt.tv.sec * 1000000000L + kt.tv.nsec;
}
# 287 "../../include/linux/ktime.h"
static inline __attribute__((always_inline)) int ktime_equal(const ktime_t cmp1, const ktime_t cmp2)
{
 return cmp1.tv64 == cmp2.tv64;
}

static inline __attribute__((always_inline)) s64 ktime_to_us(const ktime_t kt)
{
 struct timeval tv = ktime_to_timeval(kt);
 return (s64) tv.tv_sec * 1000000L + tv.tv_usec;
}

static inline __attribute__((always_inline)) s64 ktime_to_ms(const ktime_t kt)
{
 struct timeval tv = ktime_to_timeval(kt);
 return (s64) tv.tv_sec * 1000L + tv.tv_usec / 1000L;
}

static inline __attribute__((always_inline)) s64 ktime_us_delta(const ktime_t later, const ktime_t earlier)
{
       return ktime_to_us(ktime_sub(later, earlier));
}

static inline __attribute__((always_inline)) ktime_t ktime_add_us(const ktime_t kt, const u64 usec)
{
 return ktime_add_ns(kt, usec * 1000);
}

static inline __attribute__((always_inline)) ktime_t ktime_sub_us(const ktime_t kt, const u64 usec)
{
 return ktime_sub_ns(kt, usec * 1000);
}

extern ktime_t ktime_add_safe(const ktime_t lhs, const ktime_t rhs);
# 331 "../../include/linux/ktime.h"
extern void ktime_get_ts(struct timespec *ts);




static inline __attribute__((always_inline)) ktime_t ns_to_ktime(u64 ns)
{
 static const ktime_t ktime_zero = { .tv64 = 0 };
 return ktime_add_ns(ktime_zero, ns);
}
# 6 "../../include/linux/timer.h" 2

# 1 "../../include/linux/debugobjects.h" 1






enum debug_obj_state {
 ODEBUG_STATE_NONE,
 ODEBUG_STATE_INIT,
 ODEBUG_STATE_INACTIVE,
 ODEBUG_STATE_ACTIVE,
 ODEBUG_STATE_DESTROYED,
 ODEBUG_STATE_NOTAVAILABLE,
 ODEBUG_STATE_MAX,
};

struct debug_obj_descr;
# 27 "../../include/linux/debugobjects.h"
struct debug_obj {
 struct hlist_node node;
 enum debug_obj_state state;
 unsigned int astate;
 void *object;
 struct debug_obj_descr *descr;
};
# 47 "../../include/linux/debugobjects.h"
struct debug_obj_descr {
 const char *name;

 int (*fixup_init) (void *addr, enum debug_obj_state state);
 int (*fixup_activate) (void *addr, enum debug_obj_state state);
 int (*fixup_destroy) (void *addr, enum debug_obj_state state);
 int (*fixup_free) (void *addr, enum debug_obj_state state);
};
# 77 "../../include/linux/debugobjects.h"
static inline __attribute__((always_inline)) void
debug_object_init (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_init_on_stack(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_activate (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_deactivate(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_destroy (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline)) void
debug_object_free (void *addr, struct debug_obj_descr *descr) { }

static inline __attribute__((always_inline)) void debug_objects_early_init(void) { }
static inline __attribute__((always_inline)) void debug_objects_mem_init(void) { }





static inline __attribute__((always_inline)) void
debug_check_no_obj_freed(const void *address, unsigned long size) { }
# 8 "../../include/linux/timer.h" 2


struct tvec_base;

struct timer_list {




 struct list_head entry;
 unsigned long expires;
 struct tvec_base *base;

 void (*function)(unsigned long);
 unsigned long data;

 int slack;
# 34 "../../include/linux/timer.h"
};

extern struct tvec_base boot_tvec_bases;
# 65 "../../include/linux/timer.h"
void init_timer_key(struct timer_list *timer,
      const char *name,
      struct lock_class_key *key);
void init_timer_deferrable_key(struct timer_list *timer,
          const char *name,
          struct lock_class_key *key);
# 122 "../../include/linux/timer.h"
static inline __attribute__((always_inline)) void destroy_timer_on_stack(struct timer_list *timer) { }
static inline __attribute__((always_inline)) void init_timer_on_stack_key(struct timer_list *timer,
        const char *name,
        struct lock_class_key *key)
{
 init_timer_key(timer, name, key);
}


static inline __attribute__((always_inline)) void setup_timer_key(struct timer_list * timer,
    const char *name,
    struct lock_class_key *key,
    void (*function)(unsigned long),
    unsigned long data)
{
 timer->function = function;
 timer->data = data;
 init_timer_key(timer, name, key);
}

static inline __attribute__((always_inline)) void setup_timer_on_stack_key(struct timer_list *timer,
     const char *name,
     struct lock_class_key *key,
     void (*function)(unsigned long),
     unsigned long data)
{
 timer->function = function;
 timer->data = data;
 init_timer_on_stack_key(timer, name, key);
}
# 163 "../../include/linux/timer.h"
static inline __attribute__((always_inline)) int timer_pending(const struct timer_list * timer)
{
 return timer->entry.next != ((void *)0);
}

extern void add_timer_on(struct timer_list *timer, int cpu);
extern int del_timer(struct timer_list * timer);
extern int mod_timer(struct timer_list *timer, unsigned long expires);
extern int mod_timer_pending(struct timer_list *timer, unsigned long expires);
extern int mod_timer_pinned(struct timer_list *timer, unsigned long expires);

extern void set_timer_slack(struct timer_list *time, int slack_hz);
# 189 "../../include/linux/timer.h"
extern unsigned long get_next_timer_interrupt(unsigned long now);
# 221 "../../include/linux/timer.h"
static inline __attribute__((always_inline)) void init_timer_stats(void)
{
}

static inline __attribute__((always_inline)) void timer_stats_timer_set_start_info(struct timer_list *timer)
{
}

static inline __attribute__((always_inline)) void timer_stats_timer_clear_start_info(struct timer_list *timer)
{
}


extern void add_timer(struct timer_list *timer);


  extern int try_to_del_timer_sync(struct timer_list *timer);
  extern int del_timer_sync(struct timer_list *timer);







extern void init_timers(void);
extern void run_local_timers(void);
struct hrtimer;
extern enum hrtimer_restart it_real_fn(struct hrtimer *);

unsigned long __round_jiffies(unsigned long j, int cpu);
unsigned long __round_jiffies_relative(unsigned long j, int cpu);
unsigned long round_jiffies(unsigned long j);
unsigned long round_jiffies_relative(unsigned long j);

unsigned long __round_jiffies_up(unsigned long j, int cpu);
unsigned long __round_jiffies_up_relative(unsigned long j, int cpu);
unsigned long round_jiffies_up(unsigned long j);
unsigned long round_jiffies_up_relative(unsigned long j);
# 9 "../../include/linux/workqueue.h" 2





struct workqueue_struct;

struct work_struct;
typedef void (*work_func_t)(struct work_struct *work);







struct work_struct {
 atomic_long_t data;




 struct list_head entry;
 work_func_t func;



};




struct delayed_work {
 struct work_struct work;
 struct timer_list timer;
};

static inline __attribute__((always_inline)) struct delayed_work *to_delayed_work(struct work_struct *work)
{
 return ({ const typeof( ((struct delayed_work *)0)->work ) *__mptr = (work); (struct delayed_work *)( (char *)__mptr - __builtin_offsetof(struct delayed_work,work) );});
}

struct execute_work {
 struct work_struct work;
};
# 100 "../../include/linux/workqueue.h"
static inline __attribute__((always_inline)) void __init_work(struct work_struct *work, int onstack) { }
static inline __attribute__((always_inline)) void destroy_work_on_stack(struct work_struct *work) { }
# 183 "../../include/linux/workqueue.h"
extern struct workqueue_struct *
__create_workqueue_key(const char *name, int singlethread,
         int freezeable, int rt, struct lock_class_key *key,
         const char *lock_name);
# 214 "../../include/linux/workqueue.h"
extern void destroy_workqueue(struct workqueue_struct *wq);

extern int queue_work(struct workqueue_struct *wq, struct work_struct *work);
extern int queue_work_on(int cpu, struct workqueue_struct *wq,
   struct work_struct *work);
extern int queue_delayed_work(struct workqueue_struct *wq,
   struct delayed_work *work, unsigned long delay);
extern int queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
   struct delayed_work *work, unsigned long delay);

extern void flush_workqueue(struct workqueue_struct *wq);
extern void flush_scheduled_work(void);
extern void flush_delayed_work(struct delayed_work *work);

extern int schedule_work(struct work_struct *work);
extern int schedule_work_on(int cpu, struct work_struct *work);
extern int schedule_delayed_work(struct delayed_work *work, unsigned long delay);
extern int schedule_delayed_work_on(int cpu, struct delayed_work *work,
     unsigned long delay);
extern int schedule_on_each_cpu(work_func_t func);
extern int current_is_keventd(void);
extern int keventd_up(void);

extern void init_workqueues(void);
int execute_in_process_context(work_func_t fn, struct execute_work *);

extern int flush_work(struct work_struct *work);

extern int cancel_work_sync(struct work_struct *work);







static inline __attribute__((always_inline)) int cancel_delayed_work(struct delayed_work *work)
{
 int ret;

 ret = del_timer_sync(&work->timer);
 if (ret)
  _clear_bit_le(0,((unsigned long *)(&(&work->work)->data)));
 return ret;
}






static inline __attribute__((always_inline)) int __cancel_delayed_work(struct delayed_work *work)
{
 int ret;

 ret = del_timer(&work->timer);
 if (ret)
  _clear_bit_le(0,((unsigned long *)(&(&work->work)->data)));
 return ret;
}

extern int cancel_delayed_work_sync(struct delayed_work *work);


static inline __attribute__((always_inline))
void cancel_rearming_delayed_workqueue(struct workqueue_struct *wq,
     struct delayed_work *work)
{
 cancel_delayed_work_sync(work);
}


static inline __attribute__((always_inline))
void cancel_rearming_delayed_work(struct delayed_work *work)
{
 cancel_delayed_work_sync(work);
}







long work_on_cpu(unsigned int cpu, long (*fn)(void *), void *arg);
# 27 "../../include/linux/kmod.h" 2




extern char modprobe_path[];


extern int __request_module(bool wait, const char *name, ...) __attribute__((format(printf, 2, 3)));
# 47 "../../include/linux/kmod.h"
struct key;
struct file;

enum umh_wait {
 UMH_NO_WAIT = -1,
 UMH_WAIT_EXEC = 0,
 UMH_WAIT_PROC = 1,
};

struct subprocess_info {
 struct work_struct work;
 struct completion *complete;
 char *path;
 char **argv;
 char **envp;
 enum umh_wait wait;
 int retval;
 int (*init)(struct subprocess_info *info);
 void (*cleanup)(struct subprocess_info *info);
 void *data;
};


struct subprocess_info *call_usermodehelper_setup(char *path, char **argv,
        char **envp, gfp_t gfp_mask);


void call_usermodehelper_setfns(struct subprocess_info *info,
      int (*init)(struct subprocess_info *info),
      void (*cleanup)(struct subprocess_info *info),
      void *data);


int call_usermodehelper_exec(struct subprocess_info *info, enum umh_wait wait);



void call_usermodehelper_freeinfo(struct subprocess_info *info);

static inline __attribute__((always_inline)) int
call_usermodehelper_fns(char *path, char **argv, char **envp,
   enum umh_wait wait,
   int (*init)(struct subprocess_info *info),
   void (*cleanup)(struct subprocess_info *), void *data)
{
 struct subprocess_info *info;
 gfp_t gfp_mask = (wait == UMH_NO_WAIT) ? ((( gfp_t)0x20u)) : ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u));

 info = call_usermodehelper_setup(path, argv, envp, gfp_mask);

 if (info == ((void *)0))
  return -12;

 call_usermodehelper_setfns(info, init, cleanup, data);

 return call_usermodehelper_exec(info, wait);
}

static inline __attribute__((always_inline)) int
call_usermodehelper(char *path, char **argv, char **envp, enum umh_wait wait)
{
 return call_usermodehelper_fns(path, argv, envp, wait,
           ((void *)0), ((void *)0), ((void *)0));
}

extern void usermodehelper_init(void);

extern int usermodehelper_disable(void);
extern void usermodehelper_enable(void);
# 14 "../../include/linux/module.h" 2
# 1 "../../include/linux/elf.h" 1




# 1 "../../include/linux/elf-em.h" 1
# 6 "../../include/linux/elf.h" 2

# 1 "../../arch/arm/include/asm/elf.h" 1
# 10 "../../arch/arm/include/asm/elf.h"
# 1 "../../arch/arm/include/asm/user.h" 1
# 33 "../../arch/arm/include/asm/user.h"
struct user_fp {
 struct fp_reg {
  unsigned int sign1:1;
  unsigned int unused:15;
  unsigned int sign2:1;
  unsigned int exponent:14;
  unsigned int j:1;
  unsigned int mantissa1:31;
  unsigned int mantissa0:32;
 } fpregs[8];
 unsigned int fpsr:32;
 unsigned int fpcr:32;
 unsigned char ftype[8];
 unsigned int init_flag;
};




struct user{


  struct pt_regs regs;

  int u_fpvalid;


  unsigned long int u_tsize;
  unsigned long int u_dsize;
  unsigned long int u_ssize;
  unsigned long start_code;
  unsigned long start_stack;



  long int signal;
  int reserved;
  unsigned long u_ar0;

  unsigned long magic;
  char u_comm[32];
  int u_debugreg[8];
  struct user_fp u_fp;
  struct user_fp_struct * u_fp0;

};
# 88 "../../arch/arm/include/asm/user.h"
struct user_vfp {
 unsigned long long fpregs[32];
 unsigned long fpscr;
};





struct user_vfp_exc {
 unsigned long fpexc;
 unsigned long fpinst;
 unsigned long fpinst2;
};
# 11 "../../arch/arm/include/asm/elf.h" 2

struct task_struct;

typedef unsigned long elf_greg_t;
typedef unsigned long elf_freg_t[3];


typedef elf_greg_t elf_gregset_t[(sizeof (struct pt_regs) / sizeof(elf_greg_t))];

typedef struct user_fp elf_fpregset_t;
# 90 "../../arch/arm/include/asm/elf.h"
extern char elf_platform[];

struct elf32_hdr;




extern int elf_check_arch(const struct elf32_hdr *);


extern int arm_elf_read_implies_exec(const struct elf32_hdr *, int);


struct task_struct;
int dump_task_regs(struct task_struct *t, elf_gregset_t *elfregs);
# 121 "../../arch/arm/include/asm/elf.h"
extern void elf_set_personality(const struct elf32_hdr *);
# 8 "../../include/linux/elf.h" 2


struct file;
# 20 "../../include/linux/elf.h"
typedef __u32 Elf32_Addr;
typedef __u16 Elf32_Half;
typedef __u32 Elf32_Off;
typedef __s32 Elf32_Sword;
typedef __u32 Elf32_Word;


typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __s16 Elf64_SHalf;
typedef __u64 Elf64_Off;
typedef __s32 Elf64_Sword;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
typedef __s64 Elf64_Sxword;
# 149 "../../include/linux/elf.h"
typedef struct dynamic{
  Elf32_Sword d_tag;
  union{
    Elf32_Sword d_val;
    Elf32_Addr d_ptr;
  } d_un;
} Elf32_Dyn;

typedef struct {
  Elf64_Sxword d_tag;
  union {
    Elf64_Xword d_val;
    Elf64_Addr d_ptr;
  } d_un;
} Elf64_Dyn;
# 172 "../../include/linux/elf.h"
typedef struct elf32_rel {
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;

typedef struct elf64_rel {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;

typedef struct elf32_rela{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct elf64_rela {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;

typedef struct elf32_sym{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Half st_shndx;
} Elf32_Sym;

typedef struct elf64_sym {
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Half st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct elf32_hdr{
  unsigned char e_ident[16];
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

typedef struct elf64_hdr {
  unsigned char e_ident[16];
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







typedef struct elf32_phdr{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct elf64_phdr {
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 311 "../../include/linux/elf.h"
typedef struct elf32_shdr {
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

typedef struct elf64_shdr {
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
# 401 "../../include/linux/elf.h"
typedef struct elf32_note {
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;


typedef struct elf64_note {
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;




extern Elf32_Dyn _DYNAMIC [];
# 439 "../../include/linux/elf.h"
static inline __attribute__((always_inline)) int elf_coredump_extra_notes_size(void) { return 0; }
static inline __attribute__((always_inline)) int elf_coredump_extra_notes_write(struct file *file,
   loff_t *foffset) { return 0; }
# 15 "../../include/linux/module.h" 2


# 1 "../../include/linux/moduleparam.h" 1
# 32 "../../include/linux/moduleparam.h"
struct kernel_param;


typedef int (*param_set_fn)(const char *val, struct kernel_param *kp);

typedef int (*param_get_fn)(char *buffer, struct kernel_param *kp);




struct kernel_param {
 const char *name;
 u16 perm;
 u16 flags;
 param_set_fn set;
 param_get_fn get;
 union {
  void *arg;
  const struct kparam_string *str;
  const struct kparam_array *arr;
 };
};


struct kparam_string {
 unsigned int maxlen;
 char *string;
};


struct kparam_array
{
 unsigned int max;
 unsigned int *num;
 param_set_fn set;
 param_get_fn get;
 unsigned int elemsize;
 void *elem;
};
# 143 "../../include/linux/moduleparam.h"
extern int parse_args(const char *name,
        char *args,
        struct kernel_param *params,
        unsigned num,
        int (*unknown)(char *param, char *val));



extern void destroy_params(const struct kernel_param *params, unsigned num);
# 165 "../../include/linux/moduleparam.h"
extern int param_set_byte(const char *val, struct kernel_param *kp);
extern int param_get_byte(char *buffer, struct kernel_param *kp);


extern int param_set_short(const char *val, struct kernel_param *kp);
extern int param_get_short(char *buffer, struct kernel_param *kp);


extern int param_set_ushort(const char *val, struct kernel_param *kp);
extern int param_get_ushort(char *buffer, struct kernel_param *kp);


extern int param_set_int(const char *val, struct kernel_param *kp);
extern int param_get_int(char *buffer, struct kernel_param *kp);


extern int param_set_uint(const char *val, struct kernel_param *kp);
extern int param_get_uint(char *buffer, struct kernel_param *kp);


extern int param_set_long(const char *val, struct kernel_param *kp);
extern int param_get_long(char *buffer, struct kernel_param *kp);


extern int param_set_ulong(const char *val, struct kernel_param *kp);
extern int param_get_ulong(char *buffer, struct kernel_param *kp);


extern int param_set_charp(const char *val, struct kernel_param *kp);
extern int param_get_charp(char *buffer, struct kernel_param *kp);



extern int param_set_bool(const char *val, struct kernel_param *kp);
extern int param_get_bool(char *buffer, struct kernel_param *kp);
# 208 "../../include/linux/moduleparam.h"
extern int param_set_invbool(const char *val, struct kernel_param *kp);
extern int param_get_invbool(char *buffer, struct kernel_param *kp);
# 226 "../../include/linux/moduleparam.h"
extern int param_array_set(const char *val, struct kernel_param *kp);
extern int param_array_get(char *buffer, struct kernel_param *kp);

extern int param_set_copystring(const char *val, struct kernel_param *kp);
extern int param_get_string(char *buffer, struct kernel_param *kp);



struct module;


extern int module_param_sysfs_setup(struct module *mod,
        struct kernel_param *kparam,
        unsigned int num_params);

extern void module_param_sysfs_remove(struct module *mod);
# 18 "../../include/linux/module.h" 2
# 1 "../../include/linux/tracepoint.h" 1
# 19 "../../include/linux/tracepoint.h"
# 1 "../../include/linux/rcupdate.h" 1
# 42 "../../include/linux/rcupdate.h"
# 1 "../../include/linux/completion.h" 1
# 25 "../../include/linux/completion.h"
struct completion {
 unsigned int done;
 wait_queue_head_t wait;
};
# 73 "../../include/linux/completion.h"
static inline __attribute__((always_inline)) void init_completion(struct completion *x)
{
 x->done = 0;
 do { static struct lock_class_key __key; __init_waitqueue_head((&x->wait), &__key); } while (0);
}

extern void wait_for_completion(struct completion *);
extern int wait_for_completion_interruptible(struct completion *x);
extern int wait_for_completion_killable(struct completion *x);
extern unsigned long wait_for_completion_timeout(struct completion *x,
         unsigned long timeout);
extern unsigned long wait_for_completion_interruptible_timeout(
   struct completion *x, unsigned long timeout);
extern unsigned long wait_for_completion_killable_timeout(
   struct completion *x, unsigned long timeout);
extern bool try_wait_for_completion(struct completion *x);
extern bool completion_done(struct completion *x);

extern void complete(struct completion *);
extern void complete_all(struct completion *);
# 43 "../../include/linux/rcupdate.h" 2
# 53 "../../include/linux/rcupdate.h"
struct rcu_head {
 struct rcu_head *next;
 void (*func)(struct rcu_head *head);
};


extern void rcu_barrier(void);
extern void rcu_barrier_bh(void);
extern void rcu_barrier_sched(void);
extern void synchronize_sched_expedited(void);
extern int sched_expedited_torture_stats(char *page);


extern void rcu_init(void);


# 1 "../../include/linux/rcutree.h" 1
# 33 "../../include/linux/rcutree.h"
struct notifier_block;

extern void rcu_sched_qs(int cpu);
extern void rcu_bh_qs(int cpu);
extern void rcu_note_context_switch(int cpu);
extern int rcu_needs_cpu(int cpu);
# 55 "../../include/linux/rcutree.h"
static inline __attribute__((always_inline)) void __rcu_read_lock(void)
{
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
}

static inline __attribute__((always_inline)) void __rcu_read_unlock(void)
{
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}



static inline __attribute__((always_inline)) void exit_rcu(void)
{
}

static inline __attribute__((always_inline)) int rcu_preempt_depth(void)
{
 return 0;
}



static inline __attribute__((always_inline)) void __rcu_read_lock_bh(void)
{
 local_bh_disable();
}
static inline __attribute__((always_inline)) void __rcu_read_unlock_bh(void)
{
 local_bh_enable();
}

extern void call_rcu_sched(struct rcu_head *head,
      void (*func)(struct rcu_head *rcu));
extern void synchronize_rcu_bh(void);
extern void synchronize_sched(void);
extern void synchronize_rcu_expedited(void);

static inline __attribute__((always_inline)) void synchronize_rcu_bh_expedited(void)
{
 synchronize_sched_expedited();
}

extern void rcu_check_callbacks(int cpu, int user);

extern long rcu_batches_completed(void);
extern long rcu_batches_completed_bh(void);
extern long rcu_batches_completed_sched(void);
extern void rcu_force_quiescent_state(void);
extern void rcu_bh_force_quiescent_state(void);
extern void rcu_sched_force_quiescent_state(void);


void rcu_enter_nohz(void);
void rcu_exit_nohz(void);
# 120 "../../include/linux/rcutree.h"
static inline __attribute__((always_inline)) int rcu_blocking_is_gp(void)
{
 return cpumask_weight(cpu_online_mask) == 1;
}

extern void rcu_scheduler_starting(void);
extern int rcu_scheduler_active ;
# 70 "../../include/linux/rcupdate.h" 2
# 82 "../../include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void init_rcu_head_on_stack(struct rcu_head *head)
{
}

static inline __attribute__((always_inline)) void destroy_rcu_head_on_stack(struct rcu_head *head)
{
}
# 174 "../../include/linux/rcupdate.h"
static inline __attribute__((always_inline)) int rcu_read_lock_held(void)
{
 return 1;
}

static inline __attribute__((always_inline)) int rcu_read_lock_bh_held(void)
{
 return 1;
}


static inline __attribute__((always_inline)) int rcu_read_lock_sched_held(void)
{
 return (current_thread_info()->preempt_count) != 0 || ({ unsigned long _flags; ({ __asm__ __volatile__( "mrs	%0, cpsr		@ local_save_flags" : "=r" (_flags) : : "memory", "cc"); }); ({ (int)((_flags) & 0x00000080); }); });
}
# 310 "../../include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_lock(void)
{
 __rcu_read_lock();
 (void)0;
 do { } while (0);
}
# 332 "../../include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_unlock(void)
{
 do { } while (0);
 (void)0;
 __rcu_read_unlock();
}
# 350 "../../include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_lock_bh(void)
{
 __rcu_read_lock_bh();
 (void)0;
 do { } while (0);
}






static inline __attribute__((always_inline)) void rcu_read_unlock_bh(void)
{
 do { } while (0);
 (void)0;
 __rcu_read_unlock_bh();
}
# 378 "../../include/linux/rcupdate.h"
static inline __attribute__((always_inline)) void rcu_read_lock_sched(void)
{
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
 (void)0;
 do { } while (0);
}


static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) void rcu_read_lock_sched_notrace(void)
{
 do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
 (void)0;
}






static inline __attribute__((always_inline)) void rcu_read_unlock_sched(void)
{
 do { } while (0);
 (void)0;
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}


static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) void rcu_read_unlock_sched_notrace(void)
{
 (void)0;
 do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
}
# 478 "../../include/linux/rcupdate.h"
struct rcu_synchronize {
 struct rcu_head head;
 struct completion completion;
};

extern void wakeme_after_rcu(struct rcu_head *head);
# 496 "../../include/linux/rcupdate.h"
extern void call_rcu(struct rcu_head *head,
         void (*func)(struct rcu_head *head));
# 517 "../../include/linux/rcupdate.h"
extern void call_rcu_bh(struct rcu_head *head,
   void (*func)(struct rcu_head *head));
# 20 "../../include/linux/tracepoint.h" 2

struct module;
struct tracepoint;

struct tracepoint_func {
 void *func;
 void *data;
};

struct tracepoint {
 const char *name;
 int state;
 void (*regfunc)(void);
 void (*unregfunc)(void);
 struct tracepoint_func *funcs;
} __attribute__((aligned(32)));
# 46 "../../include/linux/tracepoint.h"
extern int tracepoint_probe_register(const char *name, void *probe, void *data);





extern int
tracepoint_probe_unregister(const char *name, void *probe, void *data);

extern int tracepoint_probe_register_noupdate(const char *name, void *probe,
           void *data);
extern int tracepoint_probe_unregister_noupdate(const char *name, void *probe,
      void *data);
extern void tracepoint_probe_update_all(void);

struct tracepoint_iter {
 struct module *module;
 struct tracepoint *tracepoint;
};

extern void tracepoint_iter_start(struct tracepoint_iter *iter);
extern void tracepoint_iter_next(struct tracepoint_iter *iter);
extern void tracepoint_iter_stop(struct tracepoint_iter *iter);
extern void tracepoint_iter_reset(struct tracepoint_iter *iter);
extern int tracepoint_get_iter_range(struct tracepoint **tracepoint,
 struct tracepoint *begin, struct tracepoint *end);






static inline __attribute__((always_inline)) void tracepoint_synchronize_unregister(void)
{
 synchronize_sched();
}







static inline __attribute__((always_inline)) void tracepoint_update_probe_range(struct tracepoint *begin,
 struct tracepoint *end)
{ }
# 19 "../../include/linux/module.h" 2


# 1 "../../arch/arm/include/asm/module.h" 1







struct unwind_table;

struct mod_arch_specific
{
# 23 "../../arch/arm/include/asm/module.h"
};
# 22 "../../include/linux/module.h" 2

# 1 "../../include/trace/events/module.h" 1






# 1 "../../include/linux/tracepoint.h" 1
# 8 "../../include/trace/events/module.h" 2



struct module;






static inline __attribute__((always_inline)) void trace_module_load(struct module *mod) { } static inline __attribute__((always_inline)) int register_trace_module_load(void (*probe)(void *__data, struct module *mod), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_module_load(void (*probe)(void *__data, struct module *mod), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_load(void (*cb)(void *__data, struct module *mod)) { };
# 37 "../../include/trace/events/module.h"
static inline __attribute__((always_inline)) void trace_module_free(struct module *mod) { } static inline __attribute__((always_inline)) int register_trace_module_free(void (*probe)(void *__data, struct module *mod), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_module_free(void (*probe)(void *__data, struct module *mod), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_free(void (*cb)(void *__data, struct module *mod)) { };
# 57 "../../include/trace/events/module.h"
;
# 79 "../../include/trace/events/module.h"
static inline __attribute__((always_inline)) void trace_module_get(struct module *mod, unsigned long ip) { } static inline __attribute__((always_inline)) int register_trace_module_get(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_module_get(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_get(void (*cb)(void *__data, struct module *mod, unsigned long ip)) { };






static inline __attribute__((always_inline)) void trace_module_put(struct module *mod, unsigned long ip) { } static inline __attribute__((always_inline)) int register_trace_module_put(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_module_put(void (*probe)(void *__data, struct module *mod, unsigned long ip), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_put(void (*cb)(void *__data, struct module *mod, unsigned long ip)) { };







static inline __attribute__((always_inline)) void trace_module_request(char *name, bool wait, unsigned long ip) { } static inline __attribute__((always_inline)) int register_trace_module_request(void (*probe)(void *__data, char *name, bool wait, unsigned long ip), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_module_request(void (*probe)(void *__data, char *name, bool wait, unsigned long ip), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_module_request(void (*cb)(void *__data, char *name, bool wait, unsigned long ip)) { };
# 121 "../../include/trace/events/module.h"
# 1 "../../include/trace/define_trace.h" 1
# 122 "../../include/trace/events/module.h" 2
# 24 "../../include/linux/module.h" 2
# 37 "../../include/linux/module.h"
struct kernel_symbol
{
 unsigned long value;
 const char *name;
};

struct modversion_info
{
 unsigned long crc;
 char name[(64 - sizeof(unsigned long))];
};

struct module;

struct module_attribute {
        struct attribute attr;
        ssize_t (*show)(struct module_attribute *, struct module *, char *);
        ssize_t (*store)(struct module_attribute *, struct module *,
    const char *, size_t count);
 void (*setup)(struct module *, const char *);
 int (*test)(struct module *);
 void (*free)(struct module *);
};

struct module_kobject
{
 struct kobject kobj;
 struct module *mod;
 struct kobject *drivers_dir;
 struct module_param_attrs *mp;
};


extern int init_module(void);
extern void cleanup_module(void);


struct exception_table_entry;

const struct exception_table_entry *
search_extable(const struct exception_table_entry *first,
        const struct exception_table_entry *last,
        unsigned long value);
void sort_extable(struct exception_table_entry *start,
    struct exception_table_entry *finish);
void sort_main_extable(void);
void trim_init_extable(struct module *m);
# 172 "../../include/linux/module.h"
const struct exception_table_entry *search_exception_tables(unsigned long add);

struct notifier_block;



extern int modules_disabled;

void *__symbol_get(const char *symbol);
void *__symbol_get_gpl(const char *symbol);



struct module_use {
 struct list_head source_list;
 struct list_head target_list;
 struct module *source, *target;
};
# 237 "../../include/linux/module.h"
enum module_state
{
 MODULE_STATE_LIVE,
 MODULE_STATE_COMING,
 MODULE_STATE_GOING,
};

struct module
{
 enum module_state state;


 struct list_head list;


 char name[(64 - sizeof(unsigned long))];


 struct module_kobject mkobj;
 struct module_attribute *modinfo_attrs;
 const char *version;
 const char *srcversion;
 struct kobject *holders_dir;


 const struct kernel_symbol *syms;
 const unsigned long *crcs;
 unsigned int num_syms;


 struct kernel_param *kp;
 unsigned int num_kp;


 unsigned int num_gpl_syms;
 const struct kernel_symbol *gpl_syms;
 const unsigned long *gpl_crcs;
# 288 "../../include/linux/module.h"
 const struct kernel_symbol *gpl_future_syms;
 const unsigned long *gpl_future_crcs;
 unsigned int num_gpl_future_syms;


 unsigned int num_exentries;
 struct exception_table_entry *extable;


 int (*init)(void);


 void *module_init;


 void *module_core;


 unsigned int init_size, core_size;


 unsigned int init_text_size, core_text_size;


 struct mod_arch_specific arch;

 unsigned int taints;
# 329 "../../include/linux/module.h"
 Elf32_Sym *symtab, *core_symtab;
 unsigned int num_symtab, core_num_syms;
 char *strtab, *core_strtab;


 struct module_sect_attrs *sect_attrs;


 struct module_notes_attrs *notes_attrs;




 void *percpu;
 unsigned int percpu_size;




 char *args;
# 369 "../../include/linux/module.h"
 struct list_head source_list;

 struct list_head target_list;


 struct task_struct *waiter;


 void (*exit)(void);

 struct module_ref {
  unsigned int incs;
  unsigned int decs;
 } *refptr;




 ctor_fn_t *ctors;
 unsigned int num_ctors;

};




extern struct mutex module_mutex;




static inline __attribute__((always_inline)) int module_is_live(struct module *mod)
{
 return mod->state != MODULE_STATE_GOING;
}

struct module *__module_text_address(unsigned long addr);
struct module *__module_address(unsigned long addr);
bool is_module_address(unsigned long addr);
bool is_module_percpu_address(unsigned long addr);
bool is_module_text_address(unsigned long addr);

static inline __attribute__((always_inline)) int within_module_core(unsigned long addr, struct module *mod)
{
 return (unsigned long)mod->module_core <= addr &&
        addr < (unsigned long)mod->module_core + mod->core_size;
}

static inline __attribute__((always_inline)) int within_module_init(unsigned long addr, struct module *mod)
{
 return (unsigned long)mod->module_init <= addr &&
        addr < (unsigned long)mod->module_init + mod->init_size;
}


struct module *find_module(const char *name);

struct symsearch {
 const struct kernel_symbol *start, *stop;
 const unsigned long *crcs;
 enum {
  NOT_GPL_ONLY,
  GPL_ONLY,
  WILL_BE_GPL_ONLY,
 } licence;
 bool unused;
};


const struct kernel_symbol *find_symbol(const char *name,
     struct module **owner,
     const unsigned long **crc,
     bool gplok,
     bool warn);


bool each_symbol(bool (*fn)(const struct symsearch *arr, struct module *owner,
       unsigned int symnum, void *data), void *data);



int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
   char *name, char *module_name, int *exported);


unsigned long module_kallsyms_lookup_name(const char *name);

int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
          struct module *, unsigned long),
       void *data);

extern void __module_put_and_exit(struct module *mod, long code)
 __attribute__((noreturn));



unsigned int module_refcount(struct module *mod);
void __symbol_put(const char *symbol);

void symbol_put_addr(void *addr);



static inline __attribute__((always_inline)) void __module_get(struct module *module)
{
 if (module) {
  do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
  do { do { const void *__vpp_verify = (typeof(&(((module->refptr->incs)))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(((module->refptr->incs)))) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
  trace_module_get(module, ({ __label__ __here; __here: (unsigned long)&&__here; }));
  do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
 }
}

static inline __attribute__((always_inline)) int try_module_get(struct module *module)
{
 int ret = 1;

 if (module) {
  do { do { (current_thread_info()->preempt_count) += (1); } while (0); __asm__ __volatile__("": : :"memory"); } while (0);

  if (__builtin_expect(!!(module_is_live(module)), 1)) {
   do { do { const void *__vpp_verify = (typeof(&(((module->refptr->incs)))))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(((module->refptr->incs)))) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&((((module->refptr->incs)))))))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))); (typeof((typeof(*(&((((module->refptr->incs)))))) *)(&((((module->refptr->incs))))))) (__ptr + (((__per_cpu_offset[(current_thread_info()->cpu)])))); }); }) += ((1)); } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
   trace_module_get(module, ({ __label__ __here; __here: (unsigned long)&&__here; }));
  } else
   ret = 0;

  do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count) -= (1); } while (0); } while (0); __asm__ __volatile__("": : :"memory"); do { if (__builtin_expect(!!(test_ti_thread_flag(current_thread_info(), 1)), 0)) preempt_schedule(); } while (0); } while (0);
 }
 return ret;
}

extern void module_put(struct module *module);
# 517 "../../include/linux/module.h"
int use_module(struct module *a, struct module *b);
# 529 "../../include/linux/module.h"
const char *module_address_lookup(unsigned long addr,
       unsigned long *symbolsize,
       unsigned long *offset,
       char **modname,
       char *namebuf);
int lookup_module_symbol_name(unsigned long addr, char *symname);
int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name);


const struct exception_table_entry *search_module_extables(unsigned long addr);

int register_module_notifier(struct notifier_block * nb);
int unregister_module_notifier(struct notifier_block * nb);

extern void print_modules(void);

extern void module_update_tracepoints(void);
extern int module_get_iter_tracepoints(struct tracepoint_iter *iter);
# 676 "../../include/linux/module.h"
extern struct kset *module_kset;
extern struct kobj_type module_ktype;
extern int module_sysfs_initialized;
# 695 "../../include/linux/module.h"
static inline __attribute__((always_inline)) int module_bug_finalize(const Elf32_Ehdr *hdr,
     const Elf32_Shdr *sechdrs,
     struct module *mod)
{
 return 0;
}
static inline __attribute__((always_inline)) void module_bug_cleanup(struct module *mod) {}
# 24 "../../include/linux/device.h" 2
# 1 "../../include/linux/pm.h" 1
# 34 "../../include/linux/pm.h"
extern void (*pm_idle)(void);
extern void (*pm_power_off)(void);
extern void (*pm_power_off_prepare)(void);





struct device;

typedef struct pm_message {
 int event;
} pm_message_t;
# 198 "../../include/linux/pm.h"
struct dev_pm_ops {
 int (*prepare)(struct device *dev);
 void (*complete)(struct device *dev);
 int (*suspend)(struct device *dev);
 int (*resume)(struct device *dev);
 int (*freeze)(struct device *dev);
 int (*thaw)(struct device *dev);
 int (*poweroff)(struct device *dev);
 int (*restore)(struct device *dev);
 int (*suspend_noirq)(struct device *dev);
 int (*resume_noirq)(struct device *dev);
 int (*freeze_noirq)(struct device *dev);
 int (*thaw_noirq)(struct device *dev);
 int (*poweroff_noirq)(struct device *dev);
 int (*restore_noirq)(struct device *dev);
 int (*runtime_suspend)(struct device *dev);
 int (*runtime_resume)(struct device *dev);
 int (*runtime_idle)(struct device *dev);
};
# 265 "../../include/linux/pm.h"
extern struct dev_pm_ops generic_subsys_pm_ops;
# 392 "../../include/linux/pm.h"
enum dpm_state {
 DPM_INVALID,
 DPM_ON,
 DPM_PREPARING,
 DPM_RESUMING,
 DPM_SUSPENDING,
 DPM_OFF,
 DPM_OFF_IRQ,
};
# 425 "../../include/linux/pm.h"
enum rpm_status {
 RPM_ACTIVE = 0,
 RPM_RESUMING,
 RPM_SUSPENDED,
 RPM_SUSPENDING,
};
# 444 "../../include/linux/pm.h"
enum rpm_request {
 RPM_REQ_NONE = 0,
 RPM_REQ_IDLE,
 RPM_REQ_SUSPEND,
 RPM_REQ_RESUME,
};

struct dev_pm_info {
 pm_message_t power_state;
 unsigned int can_wakeup:1;
 unsigned int should_wakeup:1;
 unsigned async_suspend:1;
 enum dpm_state status;

 struct list_head entry;
 struct completion completion;


 struct timer_list suspend_timer;
 unsigned long timer_expires;
 struct work_struct work;
 wait_queue_head_t wait_queue;
 spinlock_t lock;
 atomic_t usage_count;
 atomic_t child_count;
 unsigned int disable_depth:3;
 unsigned int ignore_children:1;
 unsigned int idle_notification:1;
 unsigned int request_pending:1;
 unsigned int deferred_resume:1;
 unsigned int run_wake:1;
 unsigned int runtime_auto:1;
 enum rpm_request request;
 enum rpm_status runtime_status;
 int runtime_error;

};
# 537 "../../include/linux/pm.h"
extern void device_pm_lock(void);
extern int sysdev_resume(void);
extern void dpm_resume_noirq(pm_message_t state);
extern void dpm_resume_end(pm_message_t state);

extern void device_pm_unlock(void);
extern int sysdev_suspend(pm_message_t state);
extern int dpm_suspend_noirq(pm_message_t state);
extern int dpm_suspend_start(pm_message_t state);

extern void __suspend_report_result(const char *function, void *fn, int ret);






extern void device_pm_wait_for_dev(struct device *sub, struct device *dev);
# 571 "../../include/linux/pm.h"
enum dpm_order {
 DPM_ORDER_NONE,
 DPM_ORDER_DEV_AFTER_PARENT,
 DPM_ORDER_PARENT_BEFORE_DEV,
 DPM_ORDER_DEV_LAST,
};





extern unsigned int pm_flags;
# 25 "../../include/linux/device.h" 2

# 1 "../../arch/arm/include/asm/device.h" 1
# 9 "../../arch/arm/include/asm/device.h"
struct dev_archdata {



};

struct pdev_archdata {
};
# 27 "../../include/linux/device.h" 2

struct device;
struct device_private;
struct device_driver;
struct driver_private;
struct class;
struct class_private;
struct bus_type;
struct bus_type_private;
struct device_node;

struct bus_attribute {
 struct attribute attr;
 ssize_t (*show)(struct bus_type *bus, char *buf);
 ssize_t (*store)(struct bus_type *bus, const char *buf, size_t count);
};




extern int __attribute__((warn_unused_result)) bus_create_file(struct bus_type *,
     struct bus_attribute *);
extern void bus_remove_file(struct bus_type *, struct bus_attribute *);

struct bus_type {
 const char *name;
 struct bus_attribute *bus_attrs;
 struct device_attribute *dev_attrs;
 struct driver_attribute *drv_attrs;

 int (*match)(struct device *dev, struct device_driver *drv);
 int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
 int (*probe)(struct device *dev);
 int (*remove)(struct device *dev);
 void (*shutdown)(struct device *dev);

 int (*suspend)(struct device *dev, pm_message_t state);
 int (*resume)(struct device *dev);

 const struct dev_pm_ops *pm;

 struct bus_type_private *p;
};

extern int __attribute__((warn_unused_result)) bus_register(struct bus_type *bus);
extern void bus_unregister(struct bus_type *bus);

extern int __attribute__((warn_unused_result)) bus_rescan_devices(struct bus_type *bus);



int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
       int (*fn)(struct device *dev, void *data));
struct device *bus_find_device(struct bus_type *bus, struct device *start,
          void *data,
          int (*match)(struct device *dev, void *data));
struct device *bus_find_device_by_name(struct bus_type *bus,
           struct device *start,
           const char *name);

int __attribute__((warn_unused_result)) bus_for_each_drv(struct bus_type *bus,
      struct device_driver *start, void *data,
      int (*fn)(struct device_driver *, void *));

void bus_sort_breadthfirst(struct bus_type *bus,
      int (*compare)(const struct device *a,
       const struct device *b));






struct notifier_block;

extern int bus_register_notifier(struct bus_type *bus,
     struct notifier_block *nb);
extern int bus_unregister_notifier(struct bus_type *bus,
       struct notifier_block *nb);
# 119 "../../include/linux/device.h"
extern struct kset *bus_get_kset(struct bus_type *bus);
extern struct klist *bus_get_device_klist(struct bus_type *bus);

struct device_driver {
 const char *name;
 struct bus_type *bus;

 struct module *owner;
 const char *mod_name;

 bool suppress_bind_attrs;





 int (*probe) (struct device *dev);
 int (*remove) (struct device *dev);
 void (*shutdown) (struct device *dev);
 int (*suspend) (struct device *dev, pm_message_t state);
 int (*resume) (struct device *dev);
 const struct attribute_group **groups;

 const struct dev_pm_ops *pm;

 struct driver_private *p;
};


extern int __attribute__((warn_unused_result)) driver_register(struct device_driver *drv);
extern void driver_unregister(struct device_driver *drv);

extern struct device_driver *get_driver(struct device_driver *drv);
extern void put_driver(struct device_driver *drv);
extern struct device_driver *driver_find(const char *name,
      struct bus_type *bus);
extern int driver_probe_done(void);
extern void wait_for_device_probe(void);




struct driver_attribute {
 struct attribute attr;
 ssize_t (*show)(struct device_driver *driver, char *buf);
 ssize_t (*store)(struct device_driver *driver, const char *buf,
    size_t count);
};





extern int __attribute__((warn_unused_result)) driver_create_file(struct device_driver *driver,
     const struct driver_attribute *attr);
extern void driver_remove_file(struct device_driver *driver,
          const struct driver_attribute *attr);

extern int __attribute__((warn_unused_result)) driver_add_kobj(struct device_driver *drv,
     struct kobject *kobj,
     const char *fmt, ...);

extern int __attribute__((warn_unused_result)) driver_for_each_device(struct device_driver *drv,
            struct device *start,
            void *data,
            int (*fn)(struct device *dev,
        void *));
struct device *driver_find_device(struct device_driver *drv,
      struct device *start, void *data,
      int (*match)(struct device *dev, void *data));




struct class {
 const char *name;
 struct module *owner;

 struct class_attribute *class_attrs;
 struct device_attribute *dev_attrs;
 struct kobject *dev_kobj;

 int (*dev_uevent)(struct device *dev, struct kobj_uevent_env *env);
 char *(*devnode)(struct device *dev, mode_t *mode);

 void (*class_release)(struct class *class);
 void (*dev_release)(struct device *dev);

 int (*suspend)(struct device *dev, pm_message_t state);
 int (*resume)(struct device *dev);

 const struct kobj_ns_type_operations *ns_type;
 const void *(*namespace)(struct device *dev);

 const struct dev_pm_ops *pm;

 struct class_private *p;
};

struct class_dev_iter {
 struct klist_iter ki;
 const struct device_type *type;
};

extern struct kobject *sysfs_dev_block_kobj;
extern struct kobject *sysfs_dev_char_kobj;
extern int __attribute__((warn_unused_result)) __class_register(struct class *class,
      struct lock_class_key *key);
extern void class_unregister(struct class *class);
# 237 "../../include/linux/device.h"
struct class_compat;
struct class_compat *class_compat_register(const char *name);
void class_compat_unregister(struct class_compat *cls);
int class_compat_create_link(struct class_compat *cls, struct device *dev,
        struct device *device_link);
void class_compat_remove_link(struct class_compat *cls, struct device *dev,
         struct device *device_link);

extern void class_dev_iter_init(struct class_dev_iter *iter,
    struct class *class,
    struct device *start,
    const struct device_type *type);
extern struct device *class_dev_iter_next(struct class_dev_iter *iter);
extern void class_dev_iter_exit(struct class_dev_iter *iter);

extern int class_for_each_device(struct class *class, struct device *start,
     void *data,
     int (*fn)(struct device *dev, void *data));
extern struct device *class_find_device(struct class *class,
     struct device *start, void *data,
     int (*match)(struct device *, void *));

struct class_attribute {
 struct attribute attr;
 ssize_t (*show)(struct class *class, struct class_attribute *attr,
   char *buf);
 ssize_t (*store)(struct class *class, struct class_attribute *attr,
   const char *buf, size_t count);
};




extern int __attribute__((warn_unused_result)) class_create_file(struct class *class,
       const struct class_attribute *attr);
extern void class_remove_file(struct class *class,
         const struct class_attribute *attr);



struct class_attribute_string {
 struct class_attribute attr;
 char *str;
};
# 289 "../../include/linux/device.h"
extern ssize_t show_class_attr_string(struct class *class, struct class_attribute *attr,
                        char *buf);

struct class_interface {
 struct list_head node;
 struct class *class;

 int (*add_dev) (struct device *, struct class_interface *);
 void (*remove_dev) (struct device *, struct class_interface *);
};

extern int __attribute__((warn_unused_result)) class_interface_register(struct class_interface *);
extern void class_interface_unregister(struct class_interface *);

extern struct class * __attribute__((warn_unused_result)) __class_create(struct module *owner,
        const char *name,
        struct lock_class_key *key);
extern void class_destroy(struct class *cls);
# 325 "../../include/linux/device.h"
struct device_type {
 const char *name;
 const struct attribute_group **groups;
 int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
 char *(*devnode)(struct device *dev, mode_t *mode);
 void (*release)(struct device *dev);

 const struct dev_pm_ops *pm;
};


struct device_attribute {
 struct attribute attr;
 ssize_t (*show)(struct device *dev, struct device_attribute *attr,
   char *buf);
 ssize_t (*store)(struct device *dev, struct device_attribute *attr,
    const char *buf, size_t count);
};




extern int __attribute__((warn_unused_result)) device_create_file(struct device *device,
     const struct device_attribute *entry);
extern void device_remove_file(struct device *dev,
          const struct device_attribute *attr);
extern int __attribute__((warn_unused_result)) device_create_bin_file(struct device *dev,
     const struct bin_attribute *attr);
extern void device_remove_bin_file(struct device *dev,
       const struct bin_attribute *attr);
extern int device_schedule_callback_owner(struct device *dev,
  void (*func)(struct device *dev), struct module *owner);






typedef void (*dr_release_t)(struct device *dev, void *res);
typedef int (*dr_match_t)(struct device *dev, void *res, void *match_data);







extern void *devres_alloc(dr_release_t release, size_t size, gfp_t gfp);

extern void devres_free(void *res);
extern void devres_add(struct device *dev, void *res);
extern void *devres_find(struct device *dev, dr_release_t release,
    dr_match_t match, void *match_data);
extern void *devres_get(struct device *dev, void *new_res,
   dr_match_t match, void *match_data);
extern void *devres_remove(struct device *dev, dr_release_t release,
      dr_match_t match, void *match_data);
extern int devres_destroy(struct device *dev, dr_release_t release,
     dr_match_t match, void *match_data);


extern void * __attribute__((warn_unused_result)) devres_open_group(struct device *dev, void *id,
          gfp_t gfp);
extern void devres_close_group(struct device *dev, void *id);
extern void devres_remove_group(struct device *dev, void *id);
extern int devres_release_group(struct device *dev, void *id);


extern void *devm_kzalloc(struct device *dev, size_t size, gfp_t gfp);
extern void devm_kfree(struct device *dev, void *p);

struct device_dma_parameters {




 unsigned int max_segment_size;
 unsigned long segment_boundary_mask;
};

struct device {
 struct device *parent;

 struct device_private *p;

 struct kobject kobj;
 const char *init_name;
 struct device_type *type;

 struct mutex mutex;



 struct bus_type *bus;
 struct device_driver *driver;

 void *platform_data;

 struct dev_pm_info power;




 u64 *dma_mask;
 u64 coherent_dma_mask;





 struct device_dma_parameters *dma_parms;

 struct list_head dma_pools;

 struct dma_coherent_mem *dma_mem;


 struct dev_archdata archdata;




 dev_t devt;

 spinlock_t devres_lock;
 struct list_head devres_head;

 struct klist_node knode_class;
 struct class *class;
 const struct attribute_group **groups;

 void (*release)(struct device *dev);
};


# 1 "../../include/linux/pm_wakeup.h" 1
# 35 "../../include/linux/pm_wakeup.h"
static inline __attribute__((always_inline)) void device_init_wakeup(struct device *dev, bool val)
{
 dev->power.can_wakeup = dev->power.should_wakeup = val;
}

static inline __attribute__((always_inline)) void device_set_wakeup_capable(struct device *dev, bool capable)
{
 dev->power.can_wakeup = capable;
}

static inline __attribute__((always_inline)) bool device_can_wakeup(struct device *dev)
{
 return dev->power.can_wakeup;
}

static inline __attribute__((always_inline)) void device_set_wakeup_enable(struct device *dev, bool enable)
{
 dev->power.should_wakeup = enable;
}

static inline __attribute__((always_inline)) bool device_may_wakeup(struct device *dev)
{
 return dev->power.can_wakeup && dev->power.should_wakeup;
}
# 461 "../../include/linux/device.h" 2

static inline __attribute__((always_inline)) const char *dev_name(const struct device *dev)
{

 if (dev->init_name)
  return dev->init_name;

 return kobject_name(&dev->kobj);
}

extern int dev_set_name(struct device *dev, const char *name, ...)
   __attribute__((format(printf, 2, 3)));
# 484 "../../include/linux/device.h"
static inline __attribute__((always_inline)) int dev_to_node(struct device *dev)
{
 return -1;
}
static inline __attribute__((always_inline)) void set_dev_node(struct device *dev, int node)
{
}


static inline __attribute__((always_inline)) unsigned int dev_get_uevent_suppress(const struct device *dev)
{
 return dev->kobj.uevent_suppress;
}

static inline __attribute__((always_inline)) void dev_set_uevent_suppress(struct device *dev, int val)
{
 dev->kobj.uevent_suppress = val;
}

static inline __attribute__((always_inline)) int device_is_registered(struct device *dev)
{
 return dev->kobj.state_in_sysfs;
}

static inline __attribute__((always_inline)) void device_enable_async_suspend(struct device *dev)
{
 if (dev->power.status == DPM_ON)
  dev->power.async_suspend = true;
}

static inline __attribute__((always_inline)) void device_disable_async_suspend(struct device *dev)
{
 if (dev->power.status == DPM_ON)
  dev->power.async_suspend = false;
}

static inline __attribute__((always_inline)) bool device_async_suspend_enabled(struct device *dev)
{
 return !!dev->power.async_suspend;
}

static inline __attribute__((always_inline)) void device_lock(struct device *dev)
{
 mutex_lock(&dev->mutex);
}

static inline __attribute__((always_inline)) int device_trylock(struct device *dev)
{
 return mutex_trylock(&dev->mutex);
}

static inline __attribute__((always_inline)) void device_unlock(struct device *dev)
{
 mutex_unlock(&dev->mutex);
}

void driver_init(void);




extern int __attribute__((warn_unused_result)) device_register(struct device *dev);
extern void device_unregister(struct device *dev);
extern void device_initialize(struct device *dev);
extern int __attribute__((warn_unused_result)) device_add(struct device *dev);
extern void device_del(struct device *dev);
extern int device_for_each_child(struct device *dev, void *data,
       int (*fn)(struct device *dev, void *data));
extern struct device *device_find_child(struct device *dev, void *data,
    int (*match)(struct device *dev, void *data));
extern int device_rename(struct device *dev, char *new_name);
extern int device_move(struct device *dev, struct device *new_parent,
         enum dpm_order dpm_order);
extern const char *device_get_devnode(struct device *dev,
          mode_t *mode, const char **tmp);
extern void *dev_get_drvdata(const struct device *dev);
extern void dev_set_drvdata(struct device *dev, void *data);




extern struct device *__root_device_register(const char *name,
          struct module *owner);
static inline __attribute__((always_inline)) struct device *root_device_register(const char *name)
{
 return __root_device_register(name, ((struct module *)0));
}
extern void root_device_unregister(struct device *root);

static inline __attribute__((always_inline)) void *dev_get_platdata(const struct device *dev)
{
 return dev->platform_data;
}





extern int __attribute__((warn_unused_result)) device_bind_driver(struct device *dev);
extern void device_release_driver(struct device *dev);
extern int __attribute__((warn_unused_result)) device_attach(struct device *dev);
extern int __attribute__((warn_unused_result)) driver_attach(struct device_driver *drv);
extern int __attribute__((warn_unused_result)) device_reprobe(struct device *dev);




extern struct device *device_create_vargs(struct class *cls,
       struct device *parent,
       dev_t devt,
       void *drvdata,
       const char *fmt,
       va_list vargs);
extern struct device *device_create(struct class *cls, struct device *parent,
        dev_t devt, void *drvdata,
        const char *fmt, ...)
        __attribute__((format(printf, 5, 6)));
extern void device_destroy(struct class *cls, dev_t devt);







extern int (*platform_notify)(struct device *dev);

extern int (*platform_notify_remove)(struct device *dev);






extern struct device *get_device(struct device *dev);
extern void put_device(struct device *dev);

extern void wait_for_device_probe(void);






static inline __attribute__((always_inline)) int devtmpfs_create_node(struct device *dev) { return 0; }
static inline __attribute__((always_inline)) int devtmpfs_delete_node(struct device *dev) { return 0; }
static inline __attribute__((always_inline)) int devtmpfs_mount(const char *mountpoint) { return 0; }



extern void device_shutdown(void);


extern void sysdev_shutdown(void);


extern const char *dev_driver_string(const struct device *dev);
# 15 "../../include/linux/platform_device.h" 2
# 1 "../../include/linux/mod_devicetable.h" 1
# 12 "../../include/linux/mod_devicetable.h"
typedef unsigned long kernel_ulong_t;




struct pci_device_id {
 __u32 vendor, device;
 __u32 subvendor, subdevice;
 __u32 class, class_mask;
 kernel_ulong_t driver_data;
};







struct ieee1394_device_id {
 __u32 match_flags;
 __u32 vendor_id;
 __u32 model_id;
 __u32 specifier_id;
 __u32 version;
 kernel_ulong_t driver_data
  __attribute__((aligned(sizeof(kernel_ulong_t))));
};
# 98 "../../include/linux/mod_devicetable.h"
struct usb_device_id {

 __u16 match_flags;


 __u16 idVendor;
 __u16 idProduct;
 __u16 bcdDevice_lo;
 __u16 bcdDevice_hi;


 __u8 bDeviceClass;
 __u8 bDeviceSubClass;
 __u8 bDeviceProtocol;


 __u8 bInterfaceClass;
 __u8 bInterfaceSubClass;
 __u8 bInterfaceProtocol;


 kernel_ulong_t driver_info;
};
# 136 "../../include/linux/mod_devicetable.h"
struct hid_device_id {
 __u16 bus;
 __u16 pad1;
 __u32 vendor;
 __u32 product;
 kernel_ulong_t driver_data
  __attribute__((aligned(sizeof(kernel_ulong_t))));
};


struct ccw_device_id {
 __u16 match_flags;

 __u16 cu_type;
 __u16 dev_type;
 __u8 cu_model;
 __u8 dev_model;

 kernel_ulong_t driver_info;
};







struct ap_device_id {
 __u16 match_flags;
 __u8 dev_type;
 __u8 pad1;
 __u32 pad2;
 kernel_ulong_t driver_info;
};




struct css_device_id {
 __u8 match_flags;
 __u8 type;
 __u16 pad2;
 __u32 pad3;
 kernel_ulong_t driver_data;
};




struct acpi_device_id {
 __u8 id[16];
 kernel_ulong_t driver_data;
};




struct pnp_device_id {
 __u8 id[8];
 kernel_ulong_t driver_data;
};

struct pnp_card_device_id {
 __u8 id[8];
 kernel_ulong_t driver_data;
 struct {
  __u8 id[8];
 } devs[8];
};




struct serio_device_id {
 __u8 type;
 __u8 extra;
 __u8 id;
 __u8 proto;
};




struct of_device_id
{
 char name[32];
 char type[32];
 char compatible[128];

 void *data;



};


struct vio_device_id {
 char type[32];
 char compat[32];
};



struct pcmcia_device_id {
 __u16 match_flags;

 __u16 manf_id;
 __u16 card_id;

 __u8 func_id;


 __u8 function;


 __u8 device_no;

 __u32 prod_id_hash[4]
  __attribute__((aligned(sizeof(__u32))));



 const char * prod_id[4];






 kernel_ulong_t driver_info;

 char * cisfile;



};
# 312 "../../include/linux/mod_devicetable.h"
struct input_device_id {

 kernel_ulong_t flags;

 __u16 bustype;
 __u16 vendor;
 __u16 product;
 __u16 version;

 kernel_ulong_t evbit[0x1f / 32 + 1];
 kernel_ulong_t keybit[0x2ff / 32 + 1];
 kernel_ulong_t relbit[0x0f / 32 + 1];
 kernel_ulong_t absbit[0x3f / 32 + 1];
 kernel_ulong_t mscbit[0x07 / 32 + 1];
 kernel_ulong_t ledbit[0x0f / 32 + 1];
 kernel_ulong_t sndbit[0x07 / 32 + 1];
 kernel_ulong_t ffbit[0x7f / 32 + 1];
 kernel_ulong_t swbit[0x0f / 32 + 1];

 kernel_ulong_t driver_info;
};






struct eisa_device_id {
 char sig[8];
 kernel_ulong_t driver_data;
};



struct parisc_device_id {
 __u8 hw_type;
 __u8 hversion_rev;
 __u16 hversion;
 __u32 sversion;
};
# 362 "../../include/linux/mod_devicetable.h"
struct sdio_device_id {
 __u8 class;
 __u16 vendor;
 __u16 device;
 kernel_ulong_t driver_data
  __attribute__((aligned(sizeof(kernel_ulong_t))));
};


struct ssb_device_id {
 __u16 vendor;
 __u16 coreid;
 __u8 revision;
};
# 385 "../../include/linux/mod_devicetable.h"
struct virtio_device_id {
 __u32 device;
 __u32 vendor;
};







struct i2c_device_id {
 char name[20];
 kernel_ulong_t driver_data
   __attribute__((aligned(sizeof(kernel_ulong_t))));
};






struct spi_device_id {
 char name[32];
 kernel_ulong_t driver_data
   __attribute__((aligned(sizeof(kernel_ulong_t))));
};


enum dmi_field {
 DMI_NONE,
 DMI_BIOS_VENDOR,
 DMI_BIOS_VERSION,
 DMI_BIOS_DATE,
 DMI_SYS_VENDOR,
 DMI_PRODUCT_NAME,
 DMI_PRODUCT_VERSION,
 DMI_PRODUCT_SERIAL,
 DMI_PRODUCT_UUID,
 DMI_BOARD_VENDOR,
 DMI_BOARD_NAME,
 DMI_BOARD_VERSION,
 DMI_BOARD_SERIAL,
 DMI_BOARD_ASSET_TAG,
 DMI_CHASSIS_VENDOR,
 DMI_CHASSIS_TYPE,
 DMI_CHASSIS_VERSION,
 DMI_CHASSIS_SERIAL,
 DMI_CHASSIS_ASSET_TAG,
 DMI_STRING_MAX,
};

struct dmi_strmatch {
 unsigned char slot;
 char substr[79];
};
# 451 "../../include/linux/mod_devicetable.h"
struct dmi_system_id {
 int (*callback)(const struct dmi_system_id *);
 const char *ident;
 struct dmi_strmatch matches[4];
 void *driver_data;
};
# 471 "../../include/linux/mod_devicetable.h"
struct platform_device_id {
 char name[20];
 kernel_ulong_t driver_data
   __attribute__((aligned(sizeof(kernel_ulong_t))));
};
# 498 "../../include/linux/mod_devicetable.h"
struct mdio_device_id {
 __u32 phy_id;
 __u32 phy_id_mask;
};

struct zorro_device_id {
 __u32 id;
 kernel_ulong_t driver_data;
};






struct isapnp_device_id {
 unsigned short card_vendor, card_device;
 unsigned short vendor, function;
 kernel_ulong_t driver_data;
};
# 16 "../../include/linux/platform_device.h" 2

struct platform_device {
 const char * name;
 int id;
 struct device dev;
 u32 num_resources;
 struct resource * resource;

 const struct platform_device_id *id_entry;


 struct pdev_archdata archdata;
};





extern int platform_device_register(struct platform_device *);
extern void platform_device_unregister(struct platform_device *);

extern struct bus_type platform_bus_type;
extern struct device platform_bus;

extern struct resource *platform_get_resource(struct platform_device *, unsigned int, unsigned int);
extern int platform_get_irq(struct platform_device *, unsigned int);
extern struct resource *platform_get_resource_byname(struct platform_device *, unsigned int, const char *);
extern int platform_get_irq_byname(struct platform_device *, const char *);
extern int platform_add_devices(struct platform_device **, int);

extern struct platform_device *platform_device_register_simple(const char *, int id,
     const struct resource *, unsigned int);
extern struct platform_device *platform_device_register_data(struct device *,
  const char *, int, const void *, size_t);

extern struct platform_device *platform_device_alloc(const char *name, int id);
extern int platform_device_add_resources(struct platform_device *pdev,
      const struct resource *res,
      unsigned int num);
extern int platform_device_add_data(struct platform_device *pdev, const void *data, size_t size);
extern int platform_device_add(struct platform_device *pdev);
extern void platform_device_del(struct platform_device *pdev);
extern void platform_device_put(struct platform_device *pdev);

struct platform_driver {
 int (*probe)(struct platform_device *);
 int (*remove)(struct platform_device *);
 void (*shutdown)(struct platform_device *);
 int (*suspend)(struct platform_device *, pm_message_t state);
 int (*resume)(struct platform_device *);
 struct device_driver driver;
 const struct platform_device_id *id_table;
};

extern int platform_driver_register(struct platform_driver *);
extern void platform_driver_unregister(struct platform_driver *);




extern int platform_driver_probe(struct platform_driver *driver,
  int (*probe)(struct platform_device *));




extern struct platform_device *platform_create_bundle(struct platform_driver *driver,
     int (*probe)(struct platform_device *),
     struct resource *res, unsigned int n_res,
     const void *data, size_t size);


struct early_platform_driver {
 const char *class_str;
 struct platform_driver *pdrv;
 struct list_head list;
 int requested_id;
 char *buffer;
 int bufsize;
};




extern int early_platform_driver_register(struct early_platform_driver *epdrv,
       char *buf);
extern void early_platform_add_devices(struct platform_device **devs, int num);

static inline __attribute__((always_inline)) int is_early_platform_device(struct platform_device *pdev)
{
 return !pdev->dev.driver;
}

extern void early_platform_driver_register_all(char *class_str);
extern int early_platform_driver_probe(char *class_str,
           int nr_probe, int user_only);
extern void early_platform_cleanup(void);
# 24 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/regulator/driver.h" 1
# 19 "../../include/linux/regulator/driver.h"
# 1 "../../include/linux/regulator/consumer.h" 1
# 108 "../../include/linux/regulator/consumer.h"
struct regulator;
# 122 "../../include/linux/regulator/consumer.h"
struct regulator_bulk_data {
 const char *supply;
 struct regulator *consumer;
};




struct regulator *__attribute__((warn_unused_result)) regulator_get(struct device *dev,
          const char *id);
struct regulator *__attribute__((warn_unused_result)) regulator_get_exclusive(struct device *dev,
             const char *id);
void regulator_put(struct regulator *regulator);


int regulator_enable(struct regulator *regulator);
int regulator_disable(struct regulator *regulator);
int regulator_force_disable(struct regulator *regulator);
int regulator_is_enabled(struct regulator *regulator);

int regulator_bulk_get(struct device *dev, int num_consumers,
         struct regulator_bulk_data *consumers);
int regulator_bulk_enable(int num_consumers,
     struct regulator_bulk_data *consumers);
int regulator_bulk_disable(int num_consumers,
      struct regulator_bulk_data *consumers);
void regulator_bulk_free(int num_consumers,
    struct regulator_bulk_data *consumers);

int regulator_count_voltages(struct regulator *regulator);
int regulator_list_voltage(struct regulator *regulator, unsigned selector);
int regulator_is_supported_voltage(struct regulator *regulator,
       int min_uV, int max_uV);
int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV);
int regulator_get_voltage(struct regulator *regulator);
int regulator_set_current_limit(struct regulator *regulator,
          int min_uA, int max_uA);
int regulator_get_current_limit(struct regulator *regulator);

int regulator_set_mode(struct regulator *regulator, unsigned int mode);
unsigned int regulator_get_mode(struct regulator *regulator);
int regulator_set_optimum_mode(struct regulator *regulator, int load_uA);


int regulator_register_notifier(struct regulator *regulator,
         struct notifier_block *nb);
int regulator_unregister_notifier(struct regulator *regulator,
    struct notifier_block *nb);


void *regulator_get_drvdata(struct regulator *regulator);
void regulator_set_drvdata(struct regulator *regulator, void *data);
# 20 "../../include/linux/regulator/driver.h" 2

struct regulator_dev;
struct regulator_init_data;

enum regulator_status {
 REGULATOR_STATUS_OFF,
 REGULATOR_STATUS_ON,
 REGULATOR_STATUS_ERROR,

 REGULATOR_STATUS_FAST,
 REGULATOR_STATUS_NORMAL,
 REGULATOR_STATUS_IDLE,
 REGULATOR_STATUS_STANDBY,
};
# 76 "../../include/linux/regulator/driver.h"
struct regulator_ops {


 int (*list_voltage) (struct regulator_dev *, unsigned selector);


 int (*set_voltage) (struct regulator_dev *, int min_uV, int max_uV);
 int (*get_voltage) (struct regulator_dev *);


 int (*set_current_limit) (struct regulator_dev *,
     int min_uA, int max_uA);
 int (*get_current_limit) (struct regulator_dev *);


 int (*enable) (struct regulator_dev *);
 int (*disable) (struct regulator_dev *);
 int (*is_enabled) (struct regulator_dev *);


 int (*set_mode) (struct regulator_dev *, unsigned int mode);
 unsigned int (*get_mode) (struct regulator_dev *);


 int (*enable_time) (struct regulator_dev *);






 int (*get_status)(struct regulator_dev *);


 unsigned int (*get_optimum_mode) (struct regulator_dev *, int input_uV,
       int output_uV, int load_uA);





 int (*set_suspend_voltage) (struct regulator_dev *, int uV);


 int (*set_suspend_enable) (struct regulator_dev *);
 int (*set_suspend_disable) (struct regulator_dev *);


 int (*set_suspend_mode) (struct regulator_dev *, unsigned int mode);
};




enum regulator_type {
 REGULATOR_VOLTAGE,
 REGULATOR_CURRENT,
};
# 149 "../../include/linux/regulator/driver.h"
struct regulator_desc {
 const char *name;
 int id;
 unsigned n_voltages;
 struct regulator_ops *ops;
 int irq;
 enum regulator_type type;
 struct module *owner;
};
# 169 "../../include/linux/regulator/driver.h"
struct regulator_dev {
 struct regulator_desc *desc;
 int use_count;
 int open_count;
 int exclusive;


 struct list_head list;
 struct list_head slist;


 struct list_head consumer_list;
 struct list_head supply_list;

 struct blocking_notifier_head notifier;
 struct mutex mutex;
 struct module *owner;
 struct device dev;
 struct regulation_constraints *constraints;
 struct regulator_dev *supply;

 void *reg_data;
};

struct regulator_dev *regulator_register(struct regulator_desc *regulator_desc,
 struct device *dev, struct regulator_init_data *init_data,
 void *driver_data);
void regulator_unregister(struct regulator_dev *rdev);

int regulator_notifier_call_chain(struct regulator_dev *rdev,
      unsigned long event, void *data);

void *rdev_get_drvdata(struct regulator_dev *rdev);
struct device *rdev_get_dev(struct regulator_dev *rdev);
int rdev_get_id(struct regulator_dev *rdev);

int regulator_mode_to_status(unsigned int);

void *regulator_get_init_drvdata(struct regulator_init_data *reg_init_data);
# 25 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/regulator/fixed.h" 1
# 20 "../../include/linux/regulator/fixed.h"
struct regulator_init_data;
# 41 "../../include/linux/regulator/fixed.h"
struct fixed_voltage_config {
 const char *supply_name;
 int microvolts;
 int gpio;
 unsigned startup_delay;
 unsigned enable_high:1;
 unsigned enabled_at_boot:1;
 struct regulator_init_data *init_data;
};
# 26 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/gpio.h" 1






# 1 "../../arch/arm/include/asm/gpio.h" 1




# 1 "../../arch/arm/mach-s5pv310/include/mach/gpio.h" 1
# 71 "../../arch/arm/mach-s5pv310/include/mach/gpio.h"
enum s5p_gpio_number {
 S5PV310_GPIO_A0_START = 0,
 S5PV310_GPIO_A1_START = ((S5PV310_GPIO_A0_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_B_START = ((S5PV310_GPIO_A1_START) + ((6)) + 0 + 1),
 S5PV310_GPIO_C0_START = ((S5PV310_GPIO_B_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_C1_START = ((S5PV310_GPIO_C0_START) + ((5)) + 0 + 1),
 S5PV310_GPIO_D0_START = ((S5PV310_GPIO_C1_START) + ((5)) + 0 + 1),
 S5PV310_GPIO_D1_START = ((S5PV310_GPIO_D0_START) + ((4)) + 0 + 1),
 S5PV310_GPIO_E0_START = ((S5PV310_GPIO_D1_START) + ((4)) + 0 + 1),
 S5PV310_GPIO_E1_START = ((S5PV310_GPIO_E0_START) + ((5)) + 0 + 1),
 S5PV310_GPIO_E2_START = ((S5PV310_GPIO_E1_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_E3_START = ((S5PV310_GPIO_E2_START) + ((6)) + 0 + 1),
 S5PV310_GPIO_E4_START = ((S5PV310_GPIO_E3_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_F0_START = ((S5PV310_GPIO_E4_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_F1_START = ((S5PV310_GPIO_F0_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_F2_START = ((S5PV310_GPIO_F1_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_F3_START = ((S5PV310_GPIO_F2_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_J0_START = ((S5PV310_GPIO_F3_START) + ((6)) + 0 + 1),
 S5PV310_GPIO_J1_START = ((S5PV310_GPIO_J0_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_K0_START = ((S5PV310_GPIO_J1_START) + ((5)) + 0 + 1),
 S5PV310_GPIO_K1_START = ((S5PV310_GPIO_K0_START) + ((7)) + 0 + 1),
 S5PV310_GPIO_K2_START = ((S5PV310_GPIO_K1_START) + ((7)) + 0 + 1),
 S5PV310_GPIO_K3_START = ((S5PV310_GPIO_K2_START) + ((7)) + 0 + 1),
 S5PV310_GPIO_L0_START = ((S5PV310_GPIO_K3_START) + ((7)) + 0 + 1),
 S5PV310_GPIO_L1_START = ((S5PV310_GPIO_L0_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_L2_START = ((S5PV310_GPIO_L1_START) + ((3)) + 0 + 1),
 S5PV310_GPIO_Y0_START = ((S5PV310_GPIO_L2_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_Y1_START = ((S5PV310_GPIO_Y0_START) + ((6)) + 0 + 1),
 S5PV310_GPIO_Y2_START = ((S5PV310_GPIO_Y1_START) + ((4)) + 0 + 1),
 S5PV310_GPIO_Y3_START = ((S5PV310_GPIO_Y2_START) + ((6)) + 0 + 1),
 S5PV310_GPIO_Y4_START = ((S5PV310_GPIO_Y3_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_Y5_START = ((S5PV310_GPIO_Y4_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_Y6_START = ((S5PV310_GPIO_Y5_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_X0_START = ((S5PV310_GPIO_Y6_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_X1_START = ((S5PV310_GPIO_X0_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_X2_START = ((S5PV310_GPIO_X1_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_X3_START = ((S5PV310_GPIO_X2_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_Z_START = ((S5PV310_GPIO_X3_START) + ((8)) + 0 + 1),
 S5PV310_GPIO_MP00_START = ((S5PV310_GPIO_Z_START) + ((7)) + 0 + 1),
 S5PV310_GPIO_MP01_START = ((S5PV310_GPIO_MP00_START) + ((6)) + 0 + 1),
 S5PV310_GPIO_MP02_START = ((S5PV310_GPIO_MP01_START) + ((4)) + 0 + 1),
};
# 171 "../../arch/arm/mach-s5pv310/include/mach/gpio.h"
# 1 "../../include/asm-generic/gpio.h" 1
# 25 "../../include/asm-generic/gpio.h"
static inline __attribute__((always_inline)) int gpio_is_valid(int number)
{

 return ((unsigned)number) < ((S5PV310_GPIO_MP02_START + ((6))) + 0 + 1);
}

struct device;
struct seq_file;
struct module;
# 77 "../../include/asm-generic/gpio.h"
struct gpio_chip {
 const char *label;
 struct device *dev;
 struct module *owner;

 int (*request)(struct gpio_chip *chip,
      unsigned offset);
 void (*free)(struct gpio_chip *chip,
      unsigned offset);

 int (*direction_input)(struct gpio_chip *chip,
      unsigned offset);
 int (*get)(struct gpio_chip *chip,
      unsigned offset);
 int (*direction_output)(struct gpio_chip *chip,
      unsigned offset, int value);
 int (*set_debounce)(struct gpio_chip *chip,
      unsigned offset, unsigned debounce);

 void (*set)(struct gpio_chip *chip,
      unsigned offset, int value);

 int (*to_irq)(struct gpio_chip *chip,
      unsigned offset);

 void (*dbg_show)(struct seq_file *s,
      struct gpio_chip *chip);
 int base;
 u16 ngpio;
 const char *const *names;
 unsigned can_sleep:1;
 unsigned exported:1;
};

extern const char *gpiochip_is_requested(struct gpio_chip *chip,
   unsigned offset);
extern int __attribute__((warn_unused_result)) gpiochip_reserve(int start, int ngpio);


extern int gpiochip_add(struct gpio_chip *chip);
extern int __attribute__((warn_unused_result)) gpiochip_remove(struct gpio_chip *chip);





extern int gpio_request(unsigned gpio, const char *label);
extern void gpio_free(unsigned gpio);

extern int gpio_direction_input(unsigned gpio);
extern int gpio_direction_output(unsigned gpio, int value);

extern int gpio_set_debounce(unsigned gpio, unsigned debounce);

extern int gpio_get_value_cansleep(unsigned gpio);
extern void gpio_set_value_cansleep(unsigned gpio, int value);






extern int __gpio_get_value(unsigned gpio);
extern void __gpio_set_value(unsigned gpio, int value);

extern int __gpio_cansleep(unsigned gpio);

extern int __gpio_to_irq(unsigned gpio);
# 162 "../../include/asm-generic/gpio.h"
struct gpio {
 unsigned gpio;
 unsigned long flags;
 const char *label;
};

extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
extern int gpio_request_array(struct gpio *array, size_t num);
extern void gpio_free_array(struct gpio *array, size_t num);







extern int gpio_export(unsigned gpio, bool direction_may_change);
extern int gpio_export_link(struct device *dev, const char *name,
   unsigned gpio);
extern int gpio_sysfs_set_active_low(unsigned gpio, int value);
extern void gpio_unexport(unsigned gpio);
# 172 "../../arch/arm/mach-s5pv310/include/mach/gpio.h" 2


# 1 "../../arch/arm/mach-s5pv310/include/mach/gpio-c1.h" 1
# 19 "../../arch/arm/mach-s5pv310/include/mach/gpio-c1.h"
# 1 "../../arch/arm/mach-s5pv310/include/mach/gpio-c1-na-spr-rev05.h" 1
# 20 "../../arch/arm/mach-s5pv310/include/mach/gpio-c1.h" 2
# 175 "../../arch/arm/mach-s5pv310/include/mach/gpio.h" 2
# 6 "../../arch/arm/include/asm/gpio.h" 2
# 8 "../../include/linux/gpio.h" 2
# 27 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/delay.h" 1
# 12 "../../include/linux/delay.h"
extern unsigned long loops_per_jiffy;

# 1 "../../arch/arm/include/asm/delay.h" 1
# 11 "../../arch/arm/include/asm/delay.h"
extern void __delay(int loops);
# 20 "../../arch/arm/include/asm/delay.h"
extern void __bad_udelay(void);
# 32 "../../arch/arm/include/asm/delay.h"
extern void __udelay(unsigned long usecs);
extern void __const_udelay(unsigned long);
# 15 "../../include/linux/delay.h" 2
# 37 "../../include/linux/delay.h"
static inline __attribute__((always_inline)) void ndelay(unsigned long x)
{
 (__builtin_constant_p((((x) + (1000) - 1) / (1000))) ? (((((x) + (1000) - 1) / (1000))) > (2 * 1000) ? __bad_udelay() : __const_udelay(((((x) + (1000) - 1) / (1000))) * ((2199023U*200)>>11))) : __udelay((((x) + (1000) - 1) / (1000))));
}



extern unsigned long lpj_fine;
void calibrate_delay(void);
void msleep(unsigned int msecs);
unsigned long msleep_interruptible(unsigned int msecs);

static inline __attribute__((always_inline)) void ssleep(unsigned int seconds)
{
 msleep(seconds * 1000);
}
# 28 "../../drivers/regulator/fixed.c" 2
# 1 "../../include/linux/slab.h" 1
# 98 "../../include/linux/slab.h"
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) kmem_cache_init(void);
int slab_is_available(void);

struct kmem_cache *kmem_cache_create(const char *, size_t, size_t,
   unsigned long,
   void (*)(void *));
void kmem_cache_destroy(struct kmem_cache *);
int kmem_cache_shrink(struct kmem_cache *);
void kmem_cache_free(struct kmem_cache *, void *);
unsigned int kmem_cache_size(struct kmem_cache *);
const char *kmem_cache_name(struct kmem_cache *);
int kern_ptr_validate(const void *ptr, unsigned long size);
int kmem_ptr_validate(struct kmem_cache *cachep, const void *ptr);
# 142 "../../include/linux/slab.h"
void * __attribute__((warn_unused_result)) __krealloc(const void *, size_t, gfp_t);
void * __attribute__((warn_unused_result)) krealloc(const void *, size_t, gfp_t);
void kfree(const void *);
void kzfree(const void *);
size_t ksize(const void *);
# 168 "../../include/linux/slab.h"
# 1 "../../include/linux/slub_def.h" 1
# 13 "../../include/linux/slub_def.h"
# 1 "../../include/linux/kmemtrace.h" 1
# 12 "../../include/linux/kmemtrace.h"
# 1 "../../include/trace/events/kmem.h" 1







# 1 "../../include/linux/tracepoint.h" 1
# 9 "../../include/trace/events/kmem.h" 2
# 47 "../../include/trace/events/kmem.h"
;
# 81 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kmalloc(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags) { } static inline __attribute__((always_inline)) int register_trace_kmalloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_kmalloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmalloc(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags)) { };







static inline __attribute__((always_inline)) void trace_kmem_cache_alloc(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags) { } static inline __attribute__((always_inline)) int register_trace_kmem_cache_alloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_kmem_cache_alloc(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmem_cache_alloc(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags)) { };







;
# 135 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kmalloc_node(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node) { } static inline __attribute__((always_inline)) int register_trace_kmalloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_kmalloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmalloc_node(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node)) { };
# 144 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kmem_cache_alloc_node(unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node) { } static inline __attribute__((always_inline)) int register_trace_kmem_cache_alloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_kmem_cache_alloc_node(void (*probe)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmem_cache_alloc_node(void (*cb)(void *__data, unsigned long call_site, const void *ptr, size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags, int node)) { };
# 153 "../../include/trace/events/kmem.h"
;
# 172 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_kfree(unsigned long call_site, const void *ptr) { } static inline __attribute__((always_inline)) int register_trace_kfree(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_kfree(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_kfree(void (*cb)(void *__data, unsigned long call_site, const void *ptr)) { };






static inline __attribute__((always_inline)) void trace_kmem_cache_free(unsigned long call_site, const void *ptr) { } static inline __attribute__((always_inline)) int register_trace_kmem_cache_free(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_kmem_cache_free(void (*probe)(void *__data, unsigned long call_site, const void *ptr), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_kmem_cache_free(void (*cb)(void *__data, unsigned long call_site, const void *ptr)) { };






static inline __attribute__((always_inline)) void trace_mm_page_free_direct(struct page *page, unsigned int order) { } static inline __attribute__((always_inline)) int register_trace_mm_page_free_direct(void (*probe)(void *__data, struct page *page, unsigned int order), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_free_direct(void (*probe)(void *__data, struct page *page, unsigned int order), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_free_direct(void (*cb)(void *__data, struct page *page, unsigned int order)) { };
# 208 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_pagevec_free(struct page *page, int cold) { } static inline __attribute__((always_inline)) int register_trace_mm_pagevec_free(void (*probe)(void *__data, struct page *page, int cold), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_mm_pagevec_free(void (*probe)(void *__data, struct page *page, int cold), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_pagevec_free(void (*cb)(void *__data, struct page *page, int cold)) { };
# 230 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_page_alloc(struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_alloc(void (*probe)(void *__data, struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_alloc(void (*probe)(void *__data, struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_alloc(void (*cb)(void *__data, struct page *page, unsigned int order, gfp_t gfp_flags, int migratetype)) { };
# 259 "../../include/trace/events/kmem.h"
;
# 285 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_page_alloc_zone_locked(struct page *page, unsigned int order, int migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_alloc_zone_locked(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_alloc_zone_locked(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_alloc_zone_locked(void (*cb)(void *__data, struct page *page, unsigned int order, int migratetype)) { };






static inline __attribute__((always_inline)) void trace_mm_page_pcpu_drain(struct page *page, unsigned int order, int migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_pcpu_drain(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_pcpu_drain(void (*probe)(void *__data, struct page *page, unsigned int order, int migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_pcpu_drain(void (*cb)(void *__data, struct page *page, unsigned int order, int migratetype)) { };
# 303 "../../include/trace/events/kmem.h"
static inline __attribute__((always_inline)) void trace_mm_page_alloc_extfrag(struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype) { } static inline __attribute__((always_inline)) int register_trace_mm_page_alloc_extfrag(void (*probe)(void *__data, struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) int unregister_trace_mm_page_alloc_extfrag(void (*probe)(void *__data, struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype), void *data) { return -38; } static inline __attribute__((always_inline)) void check_trace_callback_type_mm_page_alloc_extfrag(void (*cb)(void *__data, struct page *page, int alloc_order, int fallback_order, int alloc_migratetype, int fallback_migratetype)) { };
# 344 "../../include/trace/events/kmem.h"
# 1 "../../include/trace/define_trace.h" 1
# 344 "../../include/trace/events/kmem.h" 2
# 13 "../../include/linux/kmemtrace.h" 2




static inline __attribute__((always_inline)) void kmemtrace_init(void)
{
}
# 14 "../../include/linux/slub_def.h" 2
# 1 "../../include/linux/kmemleak.h" 1
# 59 "../../include/linux/kmemleak.h"
static inline __attribute__((always_inline)) void kmemleak_init(void)
{
}
static inline __attribute__((always_inline)) void kmemleak_alloc(const void *ptr, size_t size, int min_count,
      gfp_t gfp)
{
}
static inline __attribute__((always_inline)) void kmemleak_alloc_recursive(const void *ptr, size_t size,
         int min_count, unsigned long flags,
         gfp_t gfp)
{
}
static inline __attribute__((always_inline)) void kmemleak_free(const void *ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_free_part(const void *ptr, size_t size)
{
}
static inline __attribute__((always_inline)) void kmemleak_free_recursive(const void *ptr, unsigned long flags)
{
}
static inline __attribute__((always_inline)) void kmemleak_not_leak(const void *ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_ignore(const void *ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp)
{
}
static inline __attribute__((always_inline)) void kmemleak_erase(void **ptr)
{
}
static inline __attribute__((always_inline)) void kmemleak_no_scan(const void *ptr)
{
}
# 15 "../../include/linux/slub_def.h" 2

enum stat_item {
 ALLOC_FASTPATH,
 ALLOC_SLOWPATH,
 FREE_FASTPATH,
 FREE_SLOWPATH,
 FREE_FROZEN,
 FREE_ADD_PARTIAL,
 FREE_REMOVE_PARTIAL,
 ALLOC_FROM_PARTIAL,
 ALLOC_SLAB,
 ALLOC_REFILL,
 FREE_SLAB,
 CPUSLAB_FLUSH,
 DEACTIVATE_FULL,
 DEACTIVATE_EMPTY,
 DEACTIVATE_TO_HEAD,
 DEACTIVATE_TO_TAIL,
 DEACTIVATE_REMOTE_FREES,
 ORDER_FALLBACK,
 NR_SLUB_STAT_ITEMS };

struct kmem_cache_cpu {
 void **freelist;
 struct page *page;
 int node;



};

struct kmem_cache_node {
 spinlock_t list_lock;
 unsigned long nr_partial;
 struct list_head partial;





};






struct kmem_cache_order_objects {
 unsigned long x;
};




struct kmem_cache {
 struct kmem_cache_cpu *cpu_slab;

 unsigned long flags;
 int size;
 int objsize;
 int offset;
 struct kmem_cache_order_objects oo;


 struct kmem_cache_order_objects max;
 struct kmem_cache_order_objects min;
 gfp_t allocflags;
 int refcount;
 void (*ctor)(void *);
 int inuse;
 int align;
 unsigned long min_partial;
 const char *name;
 struct list_head list;
# 101 "../../include/linux/slub_def.h"
 struct kmem_cache_node local_node;

};
# 151 "../../include/linux/slub_def.h"
extern struct kmem_cache kmalloc_caches[(12 + 2)];





static inline __attribute__((always_inline)) __attribute__((always_inline)) int kmalloc_index(size_t size)
{
 if (!size)
  return 0;

 if (size <= (1 << 5))
  return ( __builtin_constant_p((1 << 5)) ? ( ((1 << 5)) < 1 ? ____ilog2_NaN() : ((1 << 5)) & (1ULL << 63) ? 63 : ((1 << 5)) & (1ULL << 62) ? 62 : ((1 << 5)) & (1ULL << 61) ? 61 : ((1 << 5)) & (1ULL << 60) ? 60 : ((1 << 5)) & (1ULL << 59) ? 59 : ((1 << 5)) & (1ULL << 58) ? 58 : ((1 << 5)) & (1ULL << 57) ? 57 : ((1 << 5)) & (1ULL << 56) ? 56 : ((1 << 5)) & (1ULL << 55) ? 55 : ((1 << 5)) & (1ULL << 54) ? 54 : ((1 << 5)) & (1ULL << 53) ? 53 : ((1 << 5)) & (1ULL << 52) ? 52 : ((1 << 5)) & (1ULL << 51) ? 51 : ((1 << 5)) & (1ULL << 50) ? 50 : ((1 << 5)) & (1ULL << 49) ? 49 : ((1 << 5)) & (1ULL << 48) ? 48 : ((1 << 5)) & (1ULL << 47) ? 47 : ((1 << 5)) & (1ULL << 46) ? 46 : ((1 << 5)) & (1ULL << 45) ? 45 : ((1 << 5)) & (1ULL << 44) ? 44 : ((1 << 5)) & (1ULL << 43) ? 43 : ((1 << 5)) & (1ULL << 42) ? 42 : ((1 << 5)) & (1ULL << 41) ? 41 : ((1 << 5)) & (1ULL << 40) ? 40 : ((1 << 5)) & (1ULL << 39) ? 39 : ((1 << 5)) & (1ULL << 38) ? 38 : ((1 << 5)) & (1ULL << 37) ? 37 : ((1 << 5)) & (1ULL << 36) ? 36 : ((1 << 5)) & (1ULL << 35) ? 35 : ((1 << 5)) & (1ULL << 34) ? 34 : ((1 << 5)) & (1ULL << 33) ? 33 : ((1 << 5)) & (1ULL << 32) ? 32 : ((1 << 5)) & (1ULL << 31) ? 31 : ((1 << 5)) & (1ULL << 30) ? 30 : ((1 << 5)) & (1ULL << 29) ? 29 : ((1 << 5)) & (1ULL << 28) ? 28 : ((1 << 5)) & (1ULL << 27) ? 27 : ((1 << 5)) & (1ULL << 26) ? 26 : ((1 << 5)) & (1ULL << 25) ? 25 : ((1 << 5)) & (1ULL << 24) ? 24 : ((1 << 5)) & (1ULL << 23) ? 23 : ((1 << 5)) & (1ULL << 22) ? 22 : ((1 << 5)) & (1ULL << 21) ? 21 : ((1 << 5)) & (1ULL << 20) ? 20 : ((1 << 5)) & (1ULL << 19) ? 19 : ((1 << 5)) & (1ULL << 18) ? 18 : ((1 << 5)) & (1ULL << 17) ? 17 : ((1 << 5)) & (1ULL << 16) ? 16 : ((1 << 5)) & (1ULL << 15) ? 15 : ((1 << 5)) & (1ULL << 14) ? 14 : ((1 << 5)) & (1ULL << 13) ? 13 : ((1 << 5)) & (1ULL << 12) ? 12 : ((1 << 5)) & (1ULL << 11) ? 11 : ((1 << 5)) & (1ULL << 10) ? 10 : ((1 << 5)) & (1ULL << 9) ? 9 : ((1 << 5)) & (1ULL << 8) ? 8 : ((1 << 5)) & (1ULL << 7) ? 7 : ((1 << 5)) & (1ULL << 6) ? 6 : ((1 << 5)) & (1ULL << 5) ? 5 : ((1 << 5)) & (1ULL << 4) ? 4 : ((1 << 5)) & (1ULL << 3) ? 3 : ((1 << 5)) & (1ULL << 2) ? 2 : ((1 << 5)) & (1ULL << 1) ? 1 : ((1 << 5)) & (1ULL << 0) ? 0 : ____ilog2_NaN() ) : (sizeof((1 << 5)) <= 4) ? __ilog2_u32((1 << 5)) : __ilog2_u64((1 << 5)) );

 if ((1 << 5) <= 32 && size > 64 && size <= 96)
  return 1;
 if ((1 << 5) <= 64 && size > 128 && size <= 192)
  return 2;
 if (size <= 8) return 3;
 if (size <= 16) return 4;
 if (size <= 32) return 5;
 if (size <= 64) return 6;
 if (size <= 128) return 7;
 if (size <= 256) return 8;
 if (size <= 512) return 9;
 if (size <= 1024) return 10;
 if (size <= 2 * 1024) return 11;
 if (size <= 4 * 1024) return 12;




 if (size <= 8 * 1024) return 13;
 if (size <= 16 * 1024) return 14;
 if (size <= 32 * 1024) return 15;
 if (size <= 64 * 1024) return 16;
 if (size <= 128 * 1024) return 17;
 if (size <= 256 * 1024) return 18;
 if (size <= 512 * 1024) return 19;
 if (size <= 1024 * 1024) return 20;
 if (size <= 2 * 1024 * 1024) return 21;
 return -1;
# 201 "../../include/linux/slub_def.h"
}







static inline __attribute__((always_inline)) __attribute__((always_inline)) struct kmem_cache *kmalloc_slab(size_t size)
{
 int index = kmalloc_index(size);

 if (index == 0)
  return ((void *)0);

 return &kmalloc_caches[index];
}

void *kmem_cache_alloc(struct kmem_cache *, gfp_t);
void *__kmalloc(size_t size, gfp_t flags);




static inline __attribute__((always_inline)) __attribute__((always_inline)) void *
kmem_cache_alloc_notrace(struct kmem_cache *s, gfp_t gfpflags)
{
 return kmem_cache_alloc(s, gfpflags);
}


static inline __attribute__((always_inline)) __attribute__((always_inline)) void *kmalloc_large(size_t size, gfp_t flags)
{
 unsigned int order = get_order(size);
 void *ret = (void *) __get_free_pages(flags | (( gfp_t)0x4000u), order);

 kmemleak_alloc(ret, size, 1, flags);
 trace_kmalloc(({ __label__ __here; __here: (unsigned long)&&__here; }), ret, size, ((1UL) << 12) << order, flags);

 return ret;
}

static inline __attribute__((always_inline)) __attribute__((always_inline)) void *kmalloc(size_t size, gfp_t flags)
{
 void *ret;

 if (__builtin_constant_p(size)) {
  if (size > (2 * ((1UL) << 12)))
   return kmalloc_large(size, flags);

  if (!(flags & ( gfp_t)0)) {
   struct kmem_cache *s = kmalloc_slab(size);

   if (!s)
    return ((void *)16);

   ret = kmem_cache_alloc_notrace(s, flags);

   trace_kmalloc(({ __label__ __here; __here: (unsigned long)&&__here; }), ret, size, s->size, flags);

   return ret;
  }
 }
 return __kmalloc(size, flags);
}
# 169 "../../include/linux/slab.h" 2
# 226 "../../include/linux/slab.h"
static inline __attribute__((always_inline)) void *kcalloc(size_t n, size_t size, gfp_t flags)
{
 if (size != 0 && n > (~0UL) / size)
  return ((void *)0);
 return __kmalloc(n * size, flags | (( gfp_t)0x8000u));
}
# 244 "../../include/linux/slab.h"
static inline __attribute__((always_inline)) void *kmalloc_node(size_t size, gfp_t flags, int node)
{
 return kmalloc(size, flags);
}

static inline __attribute__((always_inline)) void *__kmalloc_node(size_t size, gfp_t flags, int node)
{
 return __kmalloc(size, flags);
}

void *kmem_cache_alloc(struct kmem_cache *, gfp_t);

static inline __attribute__((always_inline)) void *kmem_cache_alloc_node(struct kmem_cache *cachep,
     gfp_t flags, int node)
{
 return kmem_cache_alloc(cachep, flags);
}
# 272 "../../include/linux/slab.h"
extern void *__kmalloc_track_caller(size_t, gfp_t, unsigned long);
# 309 "../../include/linux/slab.h"
static inline __attribute__((always_inline)) void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
{
 return kmem_cache_alloc(k, flags | (( gfp_t)0x8000u));
}






static inline __attribute__((always_inline)) void *kzalloc(size_t size, gfp_t flags)
{
 return kmalloc(size, flags | (( gfp_t)0x8000u));
}







static inline __attribute__((always_inline)) void *kzalloc_node(size_t size, gfp_t flags, int node)
{
 return kmalloc_node(size, flags | (( gfp_t)0x8000u), node);
}

void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) kmem_cache_init_late(void);
# 29 "../../drivers/regulator/fixed.c" 2

struct fixed_voltage_data {
 struct regulator_desc desc;
 struct regulator_dev *dev;
 int microvolts;
 int gpio;
 unsigned startup_delay;
 bool enable_high;
 bool is_enabled;
};

static int fixed_voltage_is_enabled(struct regulator_dev *dev)
{
 struct fixed_voltage_data *data = rdev_get_drvdata(dev);

 return data->is_enabled;
}

static int fixed_voltage_enable(struct regulator_dev *dev)
{
 struct fixed_voltage_data *data = rdev_get_drvdata(dev);

 if (gpio_is_valid(data->gpio)) {
  gpio_set_value_cansleep(data->gpio, data->enable_high);
  data->is_enabled = true;
 }

 return 0;
}

static int fixed_voltage_disable(struct regulator_dev *dev)
{
 struct fixed_voltage_data *data = rdev_get_drvdata(dev);

 if (gpio_is_valid(data->gpio)) {
  gpio_set_value_cansleep(data->gpio, !data->enable_high);
  data->is_enabled = false;
 }

 return 0;
}

static int fixed_voltage_enable_time(struct regulator_dev *dev)
{
 struct fixed_voltage_data *data = rdev_get_drvdata(dev);

 return data->startup_delay;
}

static int fixed_voltage_get_voltage(struct regulator_dev *dev)
{
 struct fixed_voltage_data *data = rdev_get_drvdata(dev);

 return data->microvolts;
}

static int fixed_voltage_list_voltage(struct regulator_dev *dev,
          unsigned selector)
{
 struct fixed_voltage_data *data = rdev_get_drvdata(dev);

 if (selector != 0)
  return -22;

 return data->microvolts;
}

static struct regulator_ops fixed_voltage_ops = {
 .is_enabled = fixed_voltage_is_enabled,
 .enable = fixed_voltage_enable,
 .disable = fixed_voltage_disable,
 .enable_time = fixed_voltage_enable_time,
 .get_voltage = fixed_voltage_get_voltage,
 .list_voltage = fixed_voltage_list_voltage,
};

static int __attribute__ ((__section__(".devinit.text"))) __attribute__((__cold__)) reg_fixed_voltage_probe(struct platform_device *pdev)
{
 struct fixed_voltage_config *config = pdev->dev.platform_data;
 struct fixed_voltage_data *drvdata;
 int ret;

 drvdata = kzalloc(sizeof(struct fixed_voltage_data), ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u)));
 if (drvdata == ((void *)0)) {
  printk("<3>" "%s %s: " "Failed to allocate device data\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev));
  ret = -12;
  goto err;
 }

 drvdata->desc.name = kstrdup(config->supply_name, ((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u)));
 if (drvdata->desc.name == ((void *)0)) {
  printk("<3>" "%s %s: " "Failed to allocate supply name\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev));
  ret = -12;
  goto err;
 }
 drvdata->desc.type = REGULATOR_VOLTAGE;
 drvdata->desc.owner = ((struct module *)0);
 drvdata->desc.ops = &fixed_voltage_ops;
 drvdata->desc.n_voltages = 1;

 drvdata->microvolts = config->microvolts;
 drvdata->gpio = config->gpio;
 drvdata->startup_delay = config->startup_delay;

 if (gpio_is_valid(config->gpio)) {
  drvdata->enable_high = config->enable_high;
# 147 "../../drivers/regulator/fixed.c"
  if (!config->gpio)
   printk("<4>" "%s %s: " "using GPIO 0 for regulator enable control\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev));


  ret = gpio_request(config->gpio, config->supply_name);
  if (ret) {
   printk("<3>" "%s %s: " "Could not obtain regulator enable GPIO %d: %d\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev) , config->gpio, ret);


   goto err_name;
  }




  drvdata->is_enabled = config->enabled_at_boot;
  ret = drvdata->is_enabled ?
    config->enable_high : !config->enable_high;

  ret = gpio_direction_output(config->gpio, ret);
  if (ret) {
   printk("<3>" "%s %s: " "Could not configure regulator enable GPIO %d direction: %d\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev) , config->gpio, ret);


   goto err_gpio;
  }

 } else {



  drvdata->is_enabled = true;
 }

 drvdata->dev = regulator_register(&drvdata->desc, &pdev->dev,
       config->init_data, drvdata);
 if (IS_ERR(drvdata->dev)) {
  ret = PTR_ERR(drvdata->dev);
  printk("<3>" "%s %s: " "Failed to register regulator: %d\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev) , ret);
  goto err_gpio;
 }

 dev_set_drvdata(&(pdev)->dev, (drvdata));

 ({ if (0) printk("<7>" "%s %s: " "%s supplying %duV\n" , dev_driver_string(&pdev->dev) , dev_name(&pdev->dev) , drvdata->desc.name, drvdata->microvolts); 0; });


 return 0;

err_gpio:
 if (gpio_is_valid(config->gpio))
  gpio_free(config->gpio);
err_name:
 kfree(drvdata->desc.name);
err:
 kfree(drvdata);
 return ret;
}

static int __attribute__ ((__section__(".devexit.text"))) __attribute__((__used__)) __attribute__((__cold__)) reg_fixed_voltage_remove(struct platform_device *pdev)
{
 struct fixed_voltage_data *drvdata = dev_get_drvdata(&(pdev)->dev);

 regulator_unregister(drvdata->dev);
 if (gpio_is_valid(drvdata->gpio))
  gpio_free(drvdata->gpio);
 kfree(drvdata->desc.name);
 kfree(drvdata);

 return 0;
}

static struct platform_driver regulator_fixed_voltage_driver = {
 .probe = reg_fixed_voltage_probe,
 .remove = reg_fixed_voltage_remove,
 .driver = {
  .name = "reg-fixed-voltage",
  .owner = ((struct module *)0),
 },
};

static int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) regulator_fixed_voltage_init(void)
{
 return platform_driver_register(&regulator_fixed_voltage_driver);
}
static initcall_t __initcall_regulator_fixed_voltage_init4 __attribute__((__used__)) __attribute__((__section__(".initcall" "4" ".init"))) = regulator_fixed_voltage_init;

static void __attribute__ ((__section__(".exit.text"))) __attribute__((__used__)) __attribute__((__cold__)) regulator_fixed_voltage_exit(void)
{
 platform_driver_unregister(&regulator_fixed_voltage_driver);
}
static exitcall_t __exitcall_regulator_fixed_voltage_exit __attribute__((__used__)) __attribute__ ((__section__(".exitcall.exit"))) = regulator_fixed_voltage_exit;;

;
;
;
;
