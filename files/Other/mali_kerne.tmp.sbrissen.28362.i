# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/generated/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
# 10 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_common.h" 1
# 11 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2
# 1 "../../drivers/media/video/samsung/mali/common/mali_osk.h" 1
# 51 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
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



# 1 "../../include/linux/stddef.h" 1



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
# 5 "../../include/linux/stddef.h" 2
# 15 "../../include/linux/stddef.h"
enum {
 false = 0,
 true = 1
};
# 5 "../../include/linux/posix_types.h" 2
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
# 52 "../../drivers/media/video/samsung/mali/common/mali_osk.h" 2




 typedef unsigned long mali_bool;
# 79 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef enum
{
    _MALI_OSK_ERR_OK = 0,
    _MALI_OSK_ERR_FAULT = -1,
    _MALI_OSK_ERR_INVALID_FUNC = -2,
    _MALI_OSK_ERR_INVALID_ARGS = -3,
    _MALI_OSK_ERR_NOMEM = -4,
    _MALI_OSK_ERR_TIMEOUT = -5,
    _MALI_OSK_ERR_RESTARTSYSCALL = -6,
    _MALI_OSK_ERR_ITEM_NOT_FOUND = -7,
    _MALI_OSK_ERR_BUSY = -8,
 _MALI_OSK_ERR_UNSUPPORTED = -9,
} _mali_osk_errcode_t;
# 100 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef struct _mali_osk_irq_t_struct _mali_osk_irq_t;





typedef void (*_mali_osk_irq_trigger_t)( void * arg );






typedef _mali_osk_errcode_t (*_mali_osk_irq_ack_t)( void * arg );
# 137 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef _mali_osk_errcode_t (*_mali_osk_irq_uhandler_t)( void * arg );
# 156 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef void (*_mali_osk_irq_bhandler_t)( void * arg );
# 175 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef struct
{
    union
    {
        u32 val;
        void *obj;
    } u;
} _mali_osk_atomic_t;
# 233 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef enum
{
 _MALI_OSK_LOCKFLAG_SPINLOCK = 0x1,
 _MALI_OSK_LOCKFLAG_NONINTERRUPTABLE = 0x2,
 _MALI_OSK_LOCKFLAG_READERWRITER = 0x4,
 _MALI_OSK_LOCKFLAG_ORDERED = 0x8,
 _MALI_OSK_LOCKFLAG_ONELOCK = 0x10,
 _MALI_OSK_LOCKFLAG_SPINLOCK_IRQ = 0x20,




} _mali_osk_lock_flags_t;
# 262 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef enum
{
 _MALI_OSK_LOCKMODE_UNDEF = -1,
 _MALI_OSK_LOCKMODE_RW = 0x0,
 _MALI_OSK_LOCKMODE_RO,



} _mali_osk_lock_mode_t;


typedef struct _mali_osk_lock_t_struct _mali_osk_lock_t;
# 290 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef struct _mali_io_address * mali_io_address;
# 356 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef enum
{
 _MALI_OSK_MEM_MAPREGION_FLAG_OS_ALLOCATED_PHYSADDR = 0x1,
} _mali_osk_mem_mapregion_flags_t;






typedef struct _mali_osk_notification_queue_t_struct _mali_osk_notification_queue_t;


typedef struct _mali_osk_notification_t_struct
{
 u32 notification_type;
 u32 result_buffer_size;
 void * result_buffer;
} _mali_osk_notification_t;
# 398 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef void (*_mali_osk_timer_callback_t)(void * arg );


typedef struct _mali_osk_timer_t_struct _mali_osk_timer_t;
# 420 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef struct _mali_osk_list_s
{
 struct _mali_osk_list_s *next;
 struct _mali_osk_list_s *prev;
} _mali_osk_list_t;
# 526 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef enum _mali_osk_resource_type
{
 RESOURCE_TYPE_FIRST =0,
 MEMORY =0,
 OS_MEMORY =1,
 MALI200 =3,
 MALIGP2 =4,
 MMU =5,
 FPGA_FRAMEWORK =6,
 MALI400L2 =7,
 MALI300L2 =7,
 MALI400GP =8,
 MALI300GP =8,
 MALI400PP =9,
 MALI300PP =9,
 MEM_VALIDATION =10,
 PMU =11,
 RESOURCE_TYPE_COUNT
} _mali_osk_resource_type_t;
# 558 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
typedef struct _mali_osk_resource
{
 _mali_osk_resource_type_t type;
 const char * description;
 u32 base;
 s32 cpu_usage_adjust;
 u32 size;
 u32 irq;
 u32 flags;
 u32 mmu_id;
 u32 alloc_order;
} _mali_osk_resource_t;



# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_memory_engine.h" 1
# 14 "../../drivers/media/video/samsung/mali/common/mali_kernel_memory_engine.h"
typedef void * mali_allocation_engine;

typedef enum { MALI_MEM_ALLOC_FINISHED, MALI_MEM_ALLOC_PARTIAL, MALI_MEM_ALLOC_NONE, MALI_MEM_ALLOC_INTERNAL_FAILURE } mali_physical_memory_allocation_result;

typedef struct mali_physical_memory_allocation
{
 void (*release)(void * ctx, void * handle);
 void * ctx;
 void * handle;
 struct mali_physical_memory_allocation * next;
} mali_physical_memory_allocation;

struct mali_page_table_block;

typedef struct mali_page_table_block
{
 void (*release)(struct mali_page_table_block *page_table_block);
 void * ctx;
 void * handle;
 u32 size;
 u32 phys_base;
 mali_io_address mapping;
} mali_page_table_block;





typedef enum
{
 MALI_MEMORY_ALLOCATION_FLAG_MAP_INTO_USERSPACE = 0x1,
 MALI_MEMORY_ALLOCATION_FLAG_MAP_GUARD_PAGE = 0x2,
} mali_memory_allocation_flag;







typedef struct mali_memory_allocation
{

 void * mapping;
 u32 mali_address;
 u32 size;
 u32 permission;
 mali_memory_allocation_flag flags;

 _mali_osk_lock_t * lock;


 void * mali_addr_mapping_info;
 void * process_addr_mapping_info;

 mali_physical_memory_allocation physical_allocation;

 _mali_osk_list_t list;
} mali_memory_allocation;



typedef struct mali_physical_memory_allocator
{
 mali_physical_memory_allocation_result (*allocate)(void* ctx, mali_allocation_engine * engine, mali_memory_allocation * descriptor, u32* offset, mali_physical_memory_allocation * alloc_info);
 mali_physical_memory_allocation_result (*allocate_page_table_block)(void * ctx, mali_page_table_block * block);
 void (*destroy)(struct mali_physical_memory_allocator * allocator);
 void * ctx;
 const char * name;
 u32 alloc_order;
 struct mali_physical_memory_allocator * next;
} mali_physical_memory_allocator;

typedef struct mali_kernel_mem_address_manager
{
 _mali_osk_errcode_t (*allocate)(mali_memory_allocation *);
 void (*release)(mali_memory_allocation *);
# 107 "../../drivers/media/video/samsung/mali/common/mali_kernel_memory_engine.h"
  _mali_osk_errcode_t (*map_physical)(mali_memory_allocation * descriptor, u32 offset, u32 *phys_addr, u32 size);
# 127 "../../drivers/media/video/samsung/mali/common/mali_kernel_memory_engine.h"
 void (*unmap_physical)(mali_memory_allocation * descriptor, u32 offset, u32 size, _mali_osk_mem_mapregion_flags_t flags);

} mali_kernel_mem_address_manager;

mali_allocation_engine mali_allocation_engine_create(mali_kernel_mem_address_manager * mali_address_manager, mali_kernel_mem_address_manager * process_address_manager);

void mali_allocation_engine_destroy(mali_allocation_engine engine);

int mali_allocation_engine_allocate_memory(mali_allocation_engine engine, mali_memory_allocation * descriptor, mali_physical_memory_allocator * physical_provider, _mali_osk_list_t *tracking_list );
void mali_allocation_engine_release_memory(mali_allocation_engine engine, mali_memory_allocation * descriptor);

int mali_allocation_engine_map_physical(mali_allocation_engine engine, mali_memory_allocation * descriptor, u32 offset, u32 phys, u32 cpu_usage_adjust, u32 size);
void mali_allocation_engine_unmap_physical(mali_allocation_engine engine, mali_memory_allocation * descriptor, u32 offset, u32 size, _mali_osk_mem_mapregion_flags_t unmap_flags);

int mali_allocation_engine_allocate_page_tables(mali_allocation_engine, mali_page_table_block * descriptor, mali_physical_memory_allocator * physical_provider);

void mali_allocation_engine_report_allocators(mali_physical_memory_allocator * physical_provider);
# 574 "../../drivers/media/video/samsung/mali/common/mali_osk.h" 2
# 618 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_irq_t *_mali_osk_irq_init( u32 irqnum, _mali_osk_irq_uhandler_t uhandler, _mali_osk_irq_bhandler_t bhandler, _mali_osk_irq_trigger_t trigger_func, _mali_osk_irq_ack_t ack_func, void *data, const char *description );
# 676 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_irq_schedulework( _mali_osk_irq_t *irq );
# 702 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_irq_term( _mali_osk_irq_t *irq );
# 714 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_atomic_dec( _mali_osk_atomic_t *atom );
# 725 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
u32 _mali_osk_atomic_dec_return( _mali_osk_atomic_t *atom );






void _mali_osk_atomic_inc( _mali_osk_atomic_t *atom );
# 742 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
u32 _mali_osk_atomic_inc_return( _mali_osk_atomic_t *atom );
# 757 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_errcode_t _mali_osk_atomic_init( _mali_osk_atomic_t *atom, u32 val );
# 770 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
u32 _mali_osk_atomic_read( _mali_osk_atomic_t *atom );





void _mali_osk_atomic_term( _mali_osk_atomic_t *atom );
# 803 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void *_mali_osk_calloc( u32 n, u32 size );
# 825 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void *_mali_osk_malloc( u32 size );
# 841 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_free( void *ptr );
# 856 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void *_mali_osk_memcpy( void *dst, const void *src, u32 len );
# 868 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void *_mali_osk_memset( void *s, u32 c, u32 n );
# 885 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
mali_bool _mali_osk_mem_check_allocated( u32 max_allocated );
# 912 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_lock_t *_mali_osk_lock_init( _mali_osk_lock_flags_t flags, u32 initial, u32 order );
# 939 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_errcode_t _mali_osk_lock_wait( _mali_osk_lock_t *lock, _mali_osk_lock_mode_t mode);
# 954 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_lock_signal( _mali_osk_lock_t *lock, _mali_osk_lock_mode_t mode );
# 965 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_lock_term( _mali_osk_lock_t *lock );
# 978 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_mem_barrier( void );
# 995 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
mali_io_address _mali_osk_mem_mapioregion( u32 phys, u32 size, const char *description );
# 1017 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_mem_unmapioregion( u32 phys, u32 size, mali_io_address mapping );
# 1044 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
mali_io_address _mali_osk_mem_allocioregion( u32 *phys, u32 size );
# 1066 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_mem_freeioregion( u32 phys, u32 size, mali_io_address mapping );
# 1086 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_errcode_t _mali_osk_mem_reqregion( u32 phys, u32 size, const char *description );
# 1106 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_mem_unreqregion( u32 phys, u32 size );
# 1120 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
u32 _mali_osk_mem_ioread32( volatile mali_io_address mapping, u32 offset );
# 1134 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_mem_iowrite32( volatile mali_io_address mapping, u32 offset, u32 val );






void _mali_osk_cache_flushall( void );
# 1152 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_cache_ensure_uncached_range_flushed( void *uncached_mapping, u32 offset, u32 size );
# 1217 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_notification_t *_mali_osk_notification_create( u32 type, u32 size );
# 1237 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_notification_delete( _mali_osk_notification_t *object );
# 1253 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_notification_queue_t *_mali_osk_notification_queue_init( void );
# 1283 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_notification_queue_term( _mali_osk_notification_queue_t *queue );
# 1304 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_notification_queue_send( _mali_osk_notification_queue_t *queue, _mali_osk_notification_t *object );
# 1314 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
mali_bool _mali_osk_notification_queue_is_empty( _mali_osk_notification_queue_t *queue );
# 1332 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_errcode_t _mali_osk_notification_queue_receive( _mali_osk_notification_queue_t *queue, _mali_osk_notification_t **result );
# 1347 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_errcode_t _mali_osk_notification_queue_dequeue( _mali_osk_notification_queue_t *queue, _mali_osk_notification_t **result );
# 1367 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
_mali_osk_timer_t *_mali_osk_timer_init(void);
# 1384 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_timer_add( _mali_osk_timer_t *tim, u32 ticks_to_expire );
# 1404 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_timer_mod( _mali_osk_timer_t *tim, u32 expiry_tick);
# 1425 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_timer_del( _mali_osk_timer_t *tim );
# 1439 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_timer_setcallback( _mali_osk_timer_t *tim, _mali_osk_timer_callback_t callback, void *data );
# 1451 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_timer_term( _mali_osk_timer_t *tim );
# 1488 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
int _mali_osk_time_after( u32 ticka, u32 tickb );






u32 _mali_osk_time_mstoticks( u32 ms );






u32 _mali_osk_time_tickstoms( u32 ticks );





u32 _mali_osk_time_tickcount( void );
# 1522 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_time_ubusydelay( u32 usecs );





u64 _mali_osk_time_get_ns( void );
# 1545 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
u32 _mali_osk_clz( u32 val );
# 1560 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_dbgmsg( const char *fmt, ... );
# 1573 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_abort(void);
# 1583 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
void _mali_osk_break(void);





u32 _mali_osk_get_pid(void);





u32 _mali_osk_get_tid(void);
# 1609 "../../drivers/media/video/samsung/mali/common/mali_osk.h"
# 1 "../../drivers/media/video/samsung/mali/linux/mali_osk_specific.h" 1
# 1610 "../../drivers/media/video/samsung/mali/common/mali_osk.h" 2
# 12 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2
# 1 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h" 1
# 24 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void __mali_osk_list_add(_mali_osk_list_t *new_entry, _mali_osk_list_t *prev, _mali_osk_list_t *next)
{
    next->prev = new_entry;
    new_entry->next = next;
    new_entry->prev = prev;
    prev->next = new_entry;
}

static inline __attribute__((always_inline)) void __mali_osk_list_del(_mali_osk_list_t *prev, _mali_osk_list_t *next)
{
    next->prev = prev;
    prev->next = next;
}
# 57 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_init( _mali_osk_list_t *list )
{
    list->next = list;
    list->prev = list;
}
# 76 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_add( _mali_osk_list_t *new_entry, _mali_osk_list_t *list )
{
    __mali_osk_list_add(new_entry, list, list->next);
}
# 93 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_addtail( _mali_osk_list_t *new_entry, _mali_osk_list_t *list )
{
    __mali_osk_list_add(new_entry, list->prev, list);
}
# 106 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_del( _mali_osk_list_t *list )
{
    __mali_osk_list_del(list->prev, list->next);
}
# 118 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_delinit( _mali_osk_list_t *list )
{
    __mali_osk_list_del(list->prev, list->next);
    _mali_osk_list_init(list);
}
# 131 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) int _mali_osk_list_empty( _mali_osk_list_t *list )
{
    return list->next == list;
}
# 147 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_move( _mali_osk_list_t *move_entry, _mali_osk_list_t *list )
{
    __mali_osk_list_del(move_entry->prev, move_entry->next);
    _mali_osk_list_add(move_entry, list);
}
# 162 "../../drivers/media/video/samsung/mali/common/mali_osk_list.h"
static inline __attribute__((always_inline)) void _mali_osk_list_splice( _mali_osk_list_t *list, _mali_osk_list_t *at )
{
    if (!_mali_osk_list_empty(list))
    {

        _mali_osk_list_t *first = list->next;
        _mali_osk_list_t *last = list->prev;
        _mali_osk_list_t *split = at->next;

        first->prev = at;
        at->next = first;

        last->next = split;
        split->prev = last;
    }
}
# 13 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2

# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h" 1
# 17 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h"
# 1 "../../drivers/media/video/samsung/mali/common/mali_ukk.h" 1
# 20 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
# 1 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h" 1
# 24 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
# 1 "../../drivers/media/video/samsung/mali/regs/mali_200_regs.h" 1
# 17 "../../drivers/media/video/samsung/mali/regs/mali_200_regs.h"
enum mali200_mgmt_reg
{
 MALI200_REG_ADDR_MGMT_VERSION = 0x1000,
 MALI200_REG_ADDR_MGMT_CURRENT_REND_LIST_ADDR = 0x1004,
 MALI200_REG_ADDR_MGMT_STATUS = 0x1008,
 MALI200_REG_ADDR_MGMT_CTRL_MGMT = 0x100c,

 MALI200_REG_ADDR_MGMT_INT_RAWSTAT = 0x1020,
 MALI200_REG_ADDR_MGMT_INT_CLEAR = 0x1024,
 MALI200_REG_ADDR_MGMT_INT_MASK = 0x1028,
 MALI200_REG_ADDR_MGMT_INT_STATUS = 0x102c,

 MALI200_REG_ADDR_MGMT_WRITE_BOUNDARY_LOW = 0x1044,

 MALI200_REG_ADDR_MGMT_BUS_ERROR_STATUS = 0x1050,

 MALI200_REG_ADDR_MGMT_PERF_CNT_0_ENABLE = 0x1080,
 MALI200_REG_ADDR_MGMT_PERF_CNT_0_SRC = 0x1084,
 MALI200_REG_ADDR_MGMT_PERF_CNT_0_VALUE = 0x108c,

 MALI200_REG_ADDR_MGMT_PERF_CNT_1_ENABLE = 0x10a0,
 MALI200_REG_ADDR_MGMT_PERF_CNT_1_SRC = 0x10a4,
 MALI200_REG_ADDR_MGMT_PERF_CNT_1_VALUE = 0x10ac,

 MALI200_REG_SIZEOF_REGISTER_BANK = 0x10f0

};



enum mali200_mgmt_ctrl_mgmt {
 MALI200_REG_VAL_CTRL_MGMT_STOP_BUS = (1<<0),



 MALI200_REG_VAL_CTRL_MGMT_FORCE_RESET = (1<<5),
 MALI200_REG_VAL_CTRL_MGMT_START_RENDERING = (1<<6),

 MALI400PP_REG_VAL_CTRL_MGMT_SOFT_RESET = (1<<7),

};

enum mali200_mgmt_irq {
 MALI200_REG_VAL_IRQ_END_OF_FRAME = (1<<0),
 MALI200_REG_VAL_IRQ_END_OF_TILE = (1<<1),
 MALI200_REG_VAL_IRQ_HANG = (1<<2),
 MALI200_REG_VAL_IRQ_FORCE_HANG = (1<<3),
 MALI200_REG_VAL_IRQ_BUS_ERROR = (1<<4),
 MALI200_REG_VAL_IRQ_BUS_STOP = (1<<5),
 MALI200_REG_VAL_IRQ_CNT_0_LIMIT = (1<<6),
 MALI200_REG_VAL_IRQ_CNT_1_LIMIT = (1<<7),
 MALI200_REG_VAL_IRQ_WRITE_BOUNDARY_ERROR = (1<<8),
 MALI400PP_REG_VAL_IRQ_INVALID_PLIST_COMMAND = (1<<9),
 MALI400PP_REG_VAL_IRQ_CALL_STACK_UNDERFLOW = (1<<10),
 MALI400PP_REG_VAL_IRQ_CALL_STACK_OVERFLOW = (1<<11),
 MALI400PP_REG_VAL_IRQ_RESET_COMPLETED = (1<<12),
};
# 129 "../../drivers/media/video/samsung/mali/regs/mali_200_regs.h"
enum mali200_mgmt_status {
 MALI200_REG_VAL_STATUS_RENDERING_ACTIVE = (1<<0),
 MALI200_REG_VAL_STATUS_BUS_STOPPED = (1<<4),
};

enum mali200_render_unit
{
 MALI200_REG_ADDR_FRAME = 0x0000,
};
# 147 "../../drivers/media/video/samsung/mali/regs/mali_200_regs.h"
enum mali200_wb_unit {
    MALI200_REG_ADDR_WB0 = 0x0100,
    MALI200_REG_ADDR_WB1 = 0x0200,
    MALI200_REG_ADDR_WB2 = 0x0300
};
# 25 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h" 2
# 50 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef enum
{
    _MALI_UK_CORE_SUBSYSTEM,
    _MALI_UK_MEMORY_SUBSYSTEM,
    _MALI_UK_PP_SUBSYSTEM,
    _MALI_UK_GP_SUBSYSTEM,
 _MALI_UK_PROFILING_SUBSYSTEM,
    _MALI_UK_PMM_SUBSYSTEM,
} _mali_uk_subsystem_t;







typedef enum
{


    _MALI_UK_OPEN = 0,
    _MALI_UK_CLOSE,
    _MALI_UK_GET_SYSTEM_INFO_SIZE,
    _MALI_UK_GET_SYSTEM_INFO,
    _MALI_UK_WAIT_FOR_NOTIFICATION,
    _MALI_UK_GET_API_VERSION,
    _MALI_UK_POST_NOTIFICATION,



    _MALI_UK_INIT_MEM = 0,
    _MALI_UK_TERM_MEM,
    _MALI_UK_GET_BIG_BLOCK,
    _MALI_UK_FREE_BIG_BLOCK,
    _MALI_UK_MAP_MEM,
    _MALI_UK_UNMAP_MEM,
    _MALI_UK_QUERY_MMU_PAGE_TABLE_DUMP_SIZE,
    _MALI_UK_DUMP_MMU_PAGE_TABLE,
    _MALI_UK_ATTACH_UMP_MEM,
    _MALI_UK_RELEASE_UMP_MEM,
    _MALI_UK_MAP_EXT_MEM,
    _MALI_UK_UNMAP_EXT_MEM,
    _MALI_UK_VA_TO_MALI_PA,



    _MALI_UK_START_JOB = 0,
 _MALI_UK_ABORT_JOB,
    _MALI_UK_GET_NUMBER_OF_CORES,
    _MALI_UK_GET_CORE_VERSION,



    _MALI_UK_PP_START_JOB = _MALI_UK_START_JOB,
    _MALI_UK_PP_ABORT_JOB = _MALI_UK_ABORT_JOB,
    _MALI_UK_GET_PP_NUMBER_OF_CORES = _MALI_UK_GET_NUMBER_OF_CORES,
    _MALI_UK_GET_PP_CORE_VERSION = _MALI_UK_GET_CORE_VERSION,



    _MALI_UK_GP_START_JOB = _MALI_UK_START_JOB,
    _MALI_UK_GP_ABORT_JOB = _MALI_UK_ABORT_JOB,
    _MALI_UK_GET_GP_NUMBER_OF_CORES = _MALI_UK_GET_NUMBER_OF_CORES,
    _MALI_UK_GET_GP_CORE_VERSION = _MALI_UK_GET_CORE_VERSION,
    _MALI_UK_GP_SUSPEND_RESPONSE,



 _MALI_UK_PROFILING_START = 0,
 _MALI_UK_PROFILING_ADD_EVENT,
 _MALI_UK_PROFILING_STOP,
 _MALI_UK_PROFILING_GET_EVENT,
 _MALI_UK_PROFILING_CLEAR,



    _MALI_UK_PMM_EVENT_MESSAGE = 0,

} _mali_uk_functions;





typedef struct
{
    void *ctx;
 u32 size;
} _mali_uk_get_system_info_size_s;
# 152 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef u32 _mali_core_version;
# 162 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef enum _mali_driver_mode
{
 _MALI_DRIVER_MODE_RAW = 1,
 _MALI_DRIVER_MODE_NORMAL = 2
} _mali_driver_mode;




typedef enum _mali_core_type
{
 _MALI_GP2 = 2,
 _MALI_200 = 5,
 _MALI_400_GP = 6,
 _MALI_400_PP = 7,

} _mali_core_type;
# 198 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct _mali_core_info
{
 _mali_core_type type;
 _mali_core_version version;
 u32 reg_address;
 u32 core_nr;
 u32 flags;
 struct _mali_core_info * next;
} _mali_core_info;
# 220 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef enum _mali_bus_usage
{

 _MALI_PP_READABLE = (1<<0),
 _MALI_PP_WRITEABLE = (1<<1),
 _MALI_GP_READABLE = (1<<2),
 _MALI_GP_WRITEABLE = (1<<3),
 _MALI_CPU_READABLE = (1<<4),
 _MALI_CPU_WRITEABLE = (1<<5),
 _MALI_MMU_READABLE = _MALI_PP_READABLE | _MALI_GP_READABLE,
 _MALI_MMU_WRITEABLE = _MALI_PP_WRITEABLE | _MALI_GP_WRITEABLE,
} _mali_bus_usage;
# 263 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct _mali_mem_info
{
 u32 size;
 _mali_bus_usage flags;
 u32 maximum_order_supported;
 u32 identifier;
 struct _mali_mem_info * next;
} _mali_mem_info;
# 282 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct _mali_system_info
{
 _mali_core_info * core_info;
 _mali_mem_info * mem_info;
 u32 has_mmu;
 _mali_driver_mode drivermode;
} _mali_system_info;
# 308 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
 u32 size;
 _mali_system_info * system_info;
 u32 ukk_private;
} _mali_uk_get_system_info_s;
# 343 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef enum _maligp_job_suspended_response_code
{
 _MALIGP_JOB_ABORT,
 _MALIGP_JOB_RESUME_WITH_NEW_HEAP
} _maligp_job_suspended_response_code;

typedef struct
{
    void *ctx;
 u32 cookie;
 _maligp_job_suspended_response_code code;
 u32 arguments[2];
} _mali_uk_gp_suspend_response_s;







typedef enum
{
    _MALI_UK_START_JOB_STARTED,
    _MALI_UK_START_JOB_STARTED_LOW_PRI_JOB_RETURNED,
    _MALI_UK_START_JOB_NOT_STARTED_DO_REQUEUE
} _mali_uk_start_job_status;



typedef enum
{
 _MALI_UK_JOB_STATUS_END_SUCCESS = 1<<(16+0),
 _MALI_UK_JOB_STATUS_END_OOM = 1<<(16+1),
 _MALI_UK_JOB_STATUS_END_ABORT = 1<<(16+2),
 _MALI_UK_JOB_STATUS_END_TIMEOUT_SW = 1<<(16+3),
 _MALI_UK_JOB_STATUS_END_HANG = 1<<(16+4),
 _MALI_UK_JOB_STATUS_END_SEG_FAULT = 1<<(16+5),
 _MALI_UK_JOB_STATUS_END_ILLEGAL_JOB = 1<<(16+6),
 _MALI_UK_JOB_STATUS_END_UNKNOWN_ERR = 1<<(16+7),
 _MALI_UK_JOB_STATUS_END_SHUTDOWN = 1<<(16+8),
 _MALI_UK_JOB_STATUS_END_SYSTEM_UNUSABLE = 1<<(16+9)
} _mali_uk_job_status;
# 444 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
    u32 user_job_ptr;
    u32 priority;
    u32 watchdog_msecs;
    u32 frame_registers[(6)];
    u32 perf_counter_flag;
    u32 perf_counter_src0;
    u32 perf_counter_src1;
    u32 returned_user_job_ptr;
    _mali_uk_start_job_status status;
 u32 abort_id;
 u32 perf_counter_l2_src0;
 u32 perf_counter_l2_src1;
} _mali_uk_gp_start_job_s;
# 469 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    u32 user_job_ptr;
    _mali_uk_job_status status;
    u32 irq_status;
    u32 status_reg_on_stop;
    u32 vscl_stop_addr;
    u32 plbcl_stop_addr;
    u32 heap_current_addr;
    u32 perf_counter_src0;
    u32 perf_counter_src1;
    u32 perf_counter0;
    u32 perf_counter1;
    u32 render_time;
 u32 perf_counter_l2_src0;
 u32 perf_counter_l2_src1;
 u32 perf_counter_l2_val0;
 u32 perf_counter_l2_val1;
} _mali_uk_gp_job_finished_s;

typedef enum _maligp_job_suspended_reason
{
 _MALIGP_JOB_SUSPENDED_OUT_OF_MEMORY
} _maligp_job_suspended_reason;

typedef struct
{
 u32 user_job_ptr;
 _maligp_job_suspended_reason reason;
 u32 cookie;
} _mali_uk_gp_job_suspended_s;
# 554 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
    u32 user_job_ptr;
    u32 priority;
    u32 watchdog_msecs;
    u32 frame_registers[((0x058/4)+1)];
    u32 wb0_registers[((0x02C/4)+1)];
    u32 wb1_registers[((0x02C/4)+1)];
    u32 wb2_registers[((0x02C/4)+1)];
    u32 perf_counter_flag;
    u32 perf_counter_src0;
    u32 perf_counter_src1;
    u32 returned_user_job_ptr;
    _mali_uk_start_job_status status;
 u32 abort_id;
 u32 perf_counter_l2_src0;
 u32 perf_counter_l2_src1;
} _mali_uk_pp_start_job_s;


typedef struct
{
    u32 user_job_ptr;
    _mali_uk_job_status status;
    u32 irq_status;
    u32 last_tile_list_addr;
    u32 perf_counter_src0;
    u32 perf_counter_src1;
    u32 perf_counter0;
    u32 perf_counter1;
    u32 render_time;
 u32 perf_counter_l2_src0;
 u32 perf_counter_l2_src1;
 u32 perf_counter_l2_val0;
 u32 perf_counter_l2_val1;
 u32 perf_counter_l2_val0_raw;
 u32 perf_counter_l2_val1_raw;
} _mali_uk_pp_job_finished_s;
# 612 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef enum
{


 _MALI_NOTIFICATION_CORE_TIMEOUT = (_MALI_UK_CORE_SUBSYSTEM << 16) | 0x10,
 _MALI_NOTIFICATION_CORE_SHUTDOWN_IN_PROGRESS = (_MALI_UK_CORE_SUBSYSTEM << 16) | 0x20,
 _MALI_NOTIFICATION_APPLICATION_QUIT = (_MALI_UK_CORE_SUBSYSTEM << 16) | 0x40,



 _MALI_NOTIFICATION_PP_FINISHED = (_MALI_UK_PP_SUBSYSTEM << 16) | 0x10,



 _MALI_NOTIFICATION_GP_FINISHED = (_MALI_UK_GP_SUBSYSTEM << 16) | 0x10,
 _MALI_NOTIFICATION_GP_STALLED = (_MALI_UK_GP_SUBSYSTEM << 16) | 0x20,
} _mali_uk_notification_type;
# 687 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
 _mali_uk_notification_type type;
    union
    {
        _mali_uk_gp_job_suspended_s gp_job_suspended;
        _mali_uk_gp_job_finished_s gp_job_finished;
        _mali_uk_pp_job_finished_s pp_job_finished;
    } data;
} _mali_uk_wait_for_notification_s;






typedef struct
{
    void *ctx;
 _mali_uk_notification_type type;
} _mali_uk_post_notification_s;
# 747 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef u32 _mali_uk_api_version;
# 763 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
 _mali_uk_api_version version;
 int compatible;
} _mali_uk_get_api_version_s;
# 778 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
 u32 mali_address_base;
 u32 memory_size;
} _mali_uk_init_mem_s;


typedef struct
{
    void *ctx;
} _mali_uk_term_mem_s;
# 808 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
 u32 type_id;
 u32 minimum_size_requested;
 u32 ukk_private;
 u32 mali_address;
 void *cpuptr;
 u32 block_size;
 u32 flags;
 u32 cookie;
} _mali_uk_get_big_block_s;






typedef struct
{
    void *ctx;
 u32 cookie;
} _mali_uk_free_big_block_s;


typedef struct
{
    void *ctx;
 u32 phys_addr;
 u32 size;
 u32 mali_address;
 u32 rights;
 u32 flags;
 u32 cookie;
} _mali_uk_map_external_mem_s;





typedef struct
{
    void *ctx;
 u32 cookie;
} _mali_uk_unmap_external_mem_s;


typedef struct
{
    void *ctx;
 u32 secure_id;
 u32 size;
 u32 mali_address;
 u32 rights;
 u32 flags;
 u32 cookie;
} _mali_uk_attach_ump_mem_s;


typedef struct
{
    void *ctx;
 u32 cookie;
} _mali_uk_release_ump_mem_s;
# 894 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
 void *ctx;
 void *va;
 u32 pa;
 u32 size;
} _mali_uk_va_to_mali_pa_s;


typedef struct
{
    void *ctx;
 u32 size;
} _mali_uk_query_mmu_page_table_dump_size_s;

typedef struct
{
    void *ctx;
 u32 size;
    void *buffer;
    u32 register_writes_size;
 u32 *register_writes;
 u32 page_table_dump_size;
 u32 *page_table_dump;
} _mali_uk_dump_mmu_page_table_s;
# 932 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
    u32 number_of_cores;
} _mali_uk_get_pp_number_of_cores_s;







typedef struct
{
    void *ctx;
    _mali_core_version version;
} _mali_uk_get_pp_core_version_s;

typedef struct
{
    void *ctx;
    u32 abort_id;
} _mali_uk_pp_abort_job_s;
# 968 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
    void *ctx;
    u32 number_of_cores;
} _mali_uk_get_gp_number_of_cores_s;







typedef struct
{
    void *ctx;
    _mali_core_version version;
} _mali_uk_get_gp_core_version_s;

typedef struct
{
    void *ctx;
    u32 abort_id;
} _mali_uk_gp_abort_job_s;

typedef struct
{
 void *ctx;
 u32 limit;
} _mali_uk_profiling_start_s;

typedef struct
{
 void *ctx;
 u32 event_id;
 u32 data[5];
} _mali_uk_profiling_add_event_s;

typedef struct
{
 void *ctx;
 u32 count;
} _mali_uk_profiling_stop_s;

typedef struct
{
 void *ctx;
 u32 index;
 u64 timestamp;
 u32 event_id;
 u32 data[5];
} _mali_uk_profiling_get_event_s;

typedef struct
{
 void *ctx;
} _mali_uk_profiling_clear_s;
# 1059 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
 void *ctx;
 void *mapping;
 u32 size;
 u32 phys_addr;
 u32 cookie;
 void *uku_private;
 void *ukk_private;
} _mali_uk_mem_mmap_s;
# 1080 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef struct
{
 void *ctx;
 void *mapping;
 u32 size;
 u32 cookie;
} _mali_uk_mem_munmap_s;
# 1103 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h"
typedef u32 mali_pmm_message_data;




typedef struct
{
 void *ctx;
 u32 id;
 mali_pmm_message_data data;
} _mali_uk_pmm_message_s;
# 21 "../../drivers/media/video/samsung/mali/common/mali_ukk.h" 2
# 204 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_open( void **context );
# 215 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_close( void **context );
# 239 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_get_system_info_size( _mali_uk_get_system_info_size_s *args );
# 276 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_get_system_info( _mali_uk_get_system_info_s *args );
# 285 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_wait_for_notification( _mali_uk_wait_for_notification_s *args );






_mali_osk_errcode_t _mali_ukk_post_notification( _mali_uk_post_notification_s *args );






_mali_osk_errcode_t _mali_ukk_get_api_version( _mali_uk_get_api_version_s *args );
# 331 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_init_mem( _mali_uk_init_mem_s *args );
# 347 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_term_mem( _mali_uk_term_mem_s *args );
# 359 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_get_big_block( _mali_uk_get_big_block_s *args );
# 371 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_free_big_block( _mali_uk_free_big_block_s *args );
# 409 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_mem_mmap( _mali_uk_mem_mmap_s *args );
# 419 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_mem_munmap( _mali_uk_mem_munmap_s *args );





_mali_osk_errcode_t _mali_ukk_query_mmu_page_table_dump_size( _mali_uk_query_mmu_page_table_dump_size_s *args );




_mali_osk_errcode_t _mali_ukk_dump_mmu_page_table( _mali_uk_dump_mmu_page_table_s * args );





_mali_osk_errcode_t _mali_ukk_map_external_mem( _mali_uk_map_external_mem_s *args );





_mali_osk_errcode_t _mali_ukk_unmap_external_mem( _mali_uk_unmap_external_mem_s *args );






_mali_osk_errcode_t _mali_ukk_attach_ump_mem( _mali_uk_attach_ump_mem_s *args );




_mali_osk_errcode_t _mali_ukk_release_ump_mem( _mali_uk_release_ump_mem_s *args );
# 498 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_va_to_mali_pa( _mali_uk_va_to_mali_pa_s * args );
# 531 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_pp_start_job( _mali_uk_pp_start_job_s *args );






_mali_osk_errcode_t _mali_ukk_get_pp_number_of_cores( _mali_uk_get_pp_number_of_cores_s *args );
# 548 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_get_pp_core_version( _mali_uk_get_pp_core_version_s *args );
# 560 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
void _mali_ukk_pp_abort_job( _mali_uk_pp_abort_job_s *args );
# 592 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_gp_start_job( _mali_uk_gp_start_job_s *args );






_mali_osk_errcode_t _mali_ukk_get_gp_number_of_cores( _mali_uk_get_gp_number_of_cores_s *args );
# 609 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_get_gp_core_version( _mali_uk_get_gp_core_version_s *args );
# 619 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
_mali_osk_errcode_t _mali_ukk_gp_suspend_response( _mali_uk_gp_suspend_response_s *args );
# 631 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
void _mali_ukk_gp_abort_job( _mali_uk_gp_abort_job_s *args );
# 645 "../../drivers/media/video/samsung/mali/common/mali_ukk.h"
void _mali_ukk_pmm_event_message( _mali_uk_pmm_message_s *args );
# 18 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h" 2
# 1 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h" 1
# 20 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
# 1 "../../drivers/media/video/samsung/mali/common/mali_uk_types.h" 1
# 21 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h" 2
# 58 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
typedef enum mali_pmm_event_id
{
 MALI_PMM_EVENT_OS_POWER_UP = 0,
 MALI_PMM_EVENT_OS_POWER_DOWN = 1,
 MALI_PMM_EVENT_JOB_SCHEDULED = 2,
 MALI_PMM_EVENT_JOB_QUEUED = 3,
 MALI_PMM_EVENT_JOB_FINISHED = 4,
 MALI_PMM_EVENT_TIMEOUT = 5,
 MALI_PMM_EVENT_DVFS_PAUSE = 6,
 MALI_PMM_EVENT_DVFS_RESUME = 7,

 MALI_PMM_EVENT_UKS = 200,
 MALI_PMM_EVENT_UK_EXAMPLE = 201,

 MALI_PMM_EVENT_INTERNALS = 1000,
 MALI_PMM_EVENT_INTERNAL_POWER_UP_ACK = 1001,
 MALI_PMM_EVENT_INTERNAL_POWER_DOWN_ACK = 1002,
} mali_pmm_event_id;
# 86 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
typedef enum mali_pmm_core_id_tag
{
 MALI_PMM_CORE_SYSTEM = 0x00000000,
 MALI_PMM_CORE_GP = 0x00000001,
 MALI_PMM_CORE_L2 = 0x00000002,
 MALI_PMM_CORE_PP0 = 0x00000004,
 MALI_PMM_CORE_PP1 = 0x00000008,
 MALI_PMM_CORE_PP2 = 0x00000010,
 MALI_PMM_CORE_PP3 = 0x00000020,
 MALI_PMM_CORE_PP_ALL = 0x0000003C
} mali_pmm_core_id;



typedef u32 mali_pmm_core_mask;



typedef u32 mali_pmm_timestamp;



typedef struct _mali_pmm_message
{
 mali_pmm_event_id id;
 mali_pmm_message_data data;
 mali_pmm_timestamp ts;
} mali_pmm_message_t;






typedef enum mali_pmm_state_tag
{
 MALI_PMM_STATE_UNAVAILABLE = 0,
 MALI_PMM_STATE_SYSTEM_ON = 1,
 MALI_PMM_STATE_SYSTEM_OFF = 2,
 MALI_PMM_STATE_SYSTEM_TRANSITION = 3
} mali_pmm_state;





typedef enum mali_pmm_policy_tag
{
 MALI_PMM_POLICY_NONE = 0,
 MALI_PMM_POLICY_ALWAYS_ON = 1,
 MALI_PMM_POLICY_JOB_CONTROL = 2,
 MALI_PMM_POLICY_RUNTIME_JOB_CONTROL = 3
} mali_pmm_policy;





void _mali_osk_pmm_power_down_done(mali_pmm_message_data data);





void _mali_osk_pmm_power_up_done(mali_pmm_message_data data);





void _mali_osk_pmm_dvfs_operation_done(mali_pmm_message_data data);
# 171 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
_mali_osk_errcode_t _mali_osk_pmm_dev_idle( void );





void _mali_osk_pmm_dev_activate( void );







mali_pmm_state _mali_pmm_state( void );
# 197 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
mali_pmm_core_mask _mali_pmm_cores_list( void );
# 209 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
mali_pmm_core_mask _mali_pmm_cores_powered( void );
# 238 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
_mali_osk_errcode_t _mali_pmm_list_policies(
  u32 policy_list_size,
  mali_pmm_policy *policy_list,
  u32 *policies_available );
# 255 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
_mali_osk_errcode_t _mali_pmm_set_policy( mali_pmm_policy policy );
# 271 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
_mali_osk_errcode_t _mali_pmm_get_policy( mali_pmm_policy *policy );
# 308 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm.h"
void mali_pmm_dump_os_thread_state( void );





void malipmm_state_dump( void );
# 19 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h" 2
# 1 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm_system.h" 1
# 29 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm_system.h"
extern struct mali_kernel_subsystem mali_subsystem_pmm;







_mali_osk_errcode_t malipmm_core_register( mali_pmm_core_id core );





void malipmm_core_unregister( mali_pmm_core_id core );
# 52 "../../drivers/media/video/samsung/mali/common/pmm/mali_pmm_system.h"
void malipmm_core_power_down_okay( mali_pmm_core_id core );
# 20 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h" 2


_mali_osk_errcode_t mali_kernel_constructor( void );
void mali_kernel_destructor( void );
# 54 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h"
_mali_osk_errcode_t mali_kernel_core_translate_cpu_to_mali_phys_range( u32 *phys_base, u32 size );
# 84 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h"
_mali_osk_errcode_t mali_kernel_core_validate_mali_phys_range( u32 phys_base, u32 size );
# 104 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h"
_mali_osk_errcode_t mali_core_signal_power_up( mali_pmm_core_id core, mali_bool queue_only );
# 123 "../../drivers/media/video/samsung/mali/common/mali_kernel_core.h"
_mali_osk_errcode_t mali_core_signal_power_down( mali_pmm_core_id core, mali_bool immediate_only );






extern int mali_benchmark;
# 15 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2
# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_pp.h" 1
# 14 "../../drivers/media/video/samsung/mali/common/mali_kernel_pp.h"
extern struct mali_kernel_subsystem mali_subsystem_mali200;


_mali_osk_errcode_t malipp_signal_power_up( u32 core_num, mali_bool queue_only );
_mali_osk_errcode_t malipp_signal_power_down( u32 core_num, mali_bool immediate_only );
# 16 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2
# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_subsystem.h" 1
# 21 "../../drivers/media/video/samsung/mali/common/mali_kernel_subsystem.h"
# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_session_manager.h" 1
# 15 "../../drivers/media/video/samsung/mali/common/mali_kernel_session_manager.h"
struct mali_session_data;

void * mali_kernel_session_manager_slot_get(struct mali_session_data * session, int id);
# 22 "../../drivers/media/video/samsung/mali/common/mali_kernel_subsystem.h" 2


typedef void * mali_kernel_subsystem_session_slot;
typedef int mali_kernel_subsystem_identifier;
typedef _mali_osk_errcode_t (*mali_kernel_resource_registrator)(_mali_osk_resource_t *);




typedef enum mali_core_notification_message
{
 MMU_KILL_STEP0_LOCK_SUBSYSTEM,
 MMU_KILL_STEP1_STOP_BUS_FOR_ALL_CORES,
 MMU_KILL_STEP2_RESET_ALL_CORES_AND_ABORT_THEIR_JOBS,
 MMU_KILL_STEP3_CONTINUE_JOB_HANDLING,
 MMU_KILL_STEP4_UNLOCK_SUBSYSTEM
} mali_core_notification_message;




typedef struct mali_kernel_subsystem
{

 _mali_osk_errcode_t (*startup)(mali_kernel_subsystem_identifier id);
 void (*shutdown)(mali_kernel_subsystem_identifier id);





 _mali_osk_errcode_t (*load_complete)(mali_kernel_subsystem_identifier id);


 _mali_osk_errcode_t (*system_info_fill)(_mali_system_info* info);
# 65 "../../drivers/media/video/samsung/mali/common/mali_kernel_subsystem.h"
 _mali_osk_errcode_t (*session_begin)(struct mali_session_data * mali_session_data, mali_kernel_subsystem_session_slot * slot, _mali_osk_notification_queue_t * queue);




 void (*session_end)(struct mali_session_data * mali_session_data, mali_kernel_subsystem_session_slot * slot);


 void (*broadcast_notification)(mali_core_notification_message message, u32 data);



 void (*dump_state)(void);

} mali_kernel_subsystem;
# 88 "../../drivers/media/video/samsung/mali/common/mali_kernel_subsystem.h"
_mali_osk_errcode_t _mali_kernel_core_register_resource_handler(_mali_osk_resource_type_t type, mali_kernel_resource_registrator handler);
# 97 "../../drivers/media/video/samsung/mali/common/mali_kernel_subsystem.h"
void _mali_kernel_core_broadcast_subsystem_message(mali_core_notification_message message, u32 data);





void _mali_kernel_core_dump_state(void);
# 17 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2

# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_rendercore.h" 1
# 24 "../../drivers/media/video/samsung/mali/common/mali_kernel_rendercore.h"
typedef enum
{
 CORE_IDLE,
 CORE_WORKING,
 CORE_WATCHDOG_TIMEOUT,
 CORE_POLL,
 CORE_HANG_CHECK_TIMEOUT,
 CORE_OFF
} mali_core_status;

typedef enum
{
 SUBSYSTEM_RESCHEDULE,
 SUBSYSTEM_WAIT
} mali_subsystem_reschedule_option;

typedef enum
{
 MALI_CORE_RESET_STYLE_RUNABLE,
 MALI_CORE_RESET_STYLE_DISABLE,
 MALI_CORE_RESET_STYLE_HARD
} mali_core_reset_style;

typedef enum
{
 JOB_STATUS_CONTINUE_RUN = 0x01,
 JOB_STATUS_END_SUCCESS = 1<<(16+0),
 JOB_STATUS_END_OOM = 1<<(16+1),
 JOB_STATUS_END_ABORT = 1<<(16+2),
 JOB_STATUS_END_TIMEOUT_SW = 1<<(16+3),
 JOB_STATUS_END_HANG = 1<<(16+4),
 JOB_STATUS_END_SEG_FAULT = 1<<(16+5),
 JOB_STATUS_END_ILLEGAL_JOB = 1<<(16+6),
 JOB_STATUS_END_UNKNOWN_ERR = 1<<(16+7),
 JOB_STATUS_END_SHUTDOWN = 1<<(16+8),
 JOB_STATUS_END_SYSTEM_UNUSABLE = 1<<(16+9)
} mali_subsystem_job_end_code;


struct mali_core_job;
struct mali_core_subsystem;
struct mali_core_renderunit;
struct mali_core_session;


typedef struct mali_core_subsystem
{
 struct mali_core_renderunit ** mali_core_array;
 u32 number_of_cores;

 _mali_core_type core_type;

 u32 magic_nr;

 _mali_osk_list_t renderunit_idle_head;
 _mali_osk_list_t renderunit_off_head;


 _mali_osk_list_t awaiting_sessions_head[3];
 u32 awaiting_sessions_sum_all_priorities;


 _mali_osk_list_t all_sessions_head;


    struct _mali_osk_notification_queue_t * notification_queue;

 const char * name;
 mali_kernel_subsystem_identifier id;



 _mali_osk_errcode_t (*start_job)(struct mali_core_job * job, struct mali_core_renderunit * core);


 u32 (*irq_handler_upper_half)(struct mali_core_renderunit * core);






 int (*irq_handler_bottom_half)(struct mali_core_renderunit* core);



 _mali_osk_errcode_t (*get_new_job_from_user)(struct mali_core_session * session, void * argument);

 _mali_osk_errcode_t (*suspend_response)(struct mali_core_session * session, void * argument);




 void (*return_job_to_user)(struct mali_core_job * job, mali_subsystem_job_end_code end_status);






 void (*renderunit_delete)(struct mali_core_renderunit * core);



 void (*reset_core)(struct mali_core_renderunit * core, mali_core_reset_style style);


 void (*probe_core_irq_trigger)(struct mali_core_renderunit* core);


 _mali_osk_errcode_t (*probe_core_irq_acknowledge)(struct mali_core_renderunit* core);


 void (*stop_bus)(struct mali_core_renderunit* core);
} mali_core_subsystem;



typedef struct mali_core_renderunit
{
 struct mali_core_subsystem * subsystem;
 _mali_osk_list_t list;
 mali_core_status state;
 mali_bool error_recovery;
 mali_bool in_detach_function;
 struct mali_core_job * current_job;
 u32 magic_nr;
  _mali_osk_timer_t * timer;
 _mali_osk_timer_t * timer_hang_detection;

 mali_io_address registers_mapped;
 u32 registers_base_addr;
 u32 size;
 const char * description;
 u32 irq_nr;
 u32 core_version;

 u32 mmu_id;
 void * mmu;


 mali_pmm_core_id pmm_id;
 mali_bool pend_power_down;


 u32 core_number;

    _mali_osk_irq_t *irq;
} mali_core_renderunit;




typedef struct mali_core_session
{
 struct mali_core_subsystem * subsystem;
 _mali_osk_list_t renderunits_working_head;
 struct mali_core_job *job_waiting_to_run;

 _mali_osk_list_t awaiting_sessions_list;
 _mali_osk_list_t all_sessions_list;

    _mali_osk_notification_queue_t * notification_queue;

 struct mali_session_data * mmu_session;

 u32 magic_nr;

        _mali_osk_atomic_t jobs_received;
        _mali_osk_atomic_t jobs_started;
        _mali_osk_atomic_t jobs_ended;
        _mali_osk_atomic_t jobs_returned;
 u32 pid;

} mali_core_session;




typedef struct mali_core_job
{
 _mali_osk_list_t list;
 struct mali_core_session *session;
 u32 magic_nr;
 u32 priority;
 u32 watchdog_msecs;
 u32 render_time_msecs ;
 u32 start_time_jiffies;
 unsigned long watchdog_jiffies;
 u32 abort_id;
 u32 job_nr;
} mali_core_job;




extern struct mali_kernel_subsystem mali_subsystem_rendercore;

void subsystem_flush_mapped_mem_cache(void);
# 253 "../../drivers/media/video/samsung/mali/common/mali_kernel_rendercore.h"
static inline __attribute__((always_inline)) int job_has_higher_priority(mali_core_job * job_a, mali_core_job * job_b)
{

 return (int) (job_a->priority < job_b->priority);
}

static inline __attribute__((always_inline)) void job_priority_set(mali_core_job * job, u32 priority)
{
 if (priority > (0 +3 -1)) job->priority = (0 +3 -1);
 else job->priority = priority;
}

void job_watchdog_set(mali_core_job * job, u32 watchdog_msecs);


typedef struct register_address_and_value
{
 u32 address;
 u32 value;
} register_address_and_value ;



typedef struct register_address_and_value_list
{
 _mali_osk_list_t list;
 register_address_and_value item;
} register_address_and_value_list ;


typedef struct register_array_user
{
 u32 entries_in_array;
 u32 start_address;
 void * reg_array;
}register_array_user;
# 318 "../../drivers/media/video/samsung/mali/common/mali_kernel_rendercore.h"
u32 mali_core_renderunit_register_read(struct mali_core_renderunit *core, u32 relative_address);
void mali_core_renderunit_register_read_array(struct mali_core_renderunit *core, u32 relative_address, u32 * result_array, u32 nr_of_regs);
void mali_core_renderunit_register_write(struct mali_core_renderunit *core, u32 relative_address, u32 new_val);
void mali_core_renderunit_register_write_array(struct mali_core_renderunit *core, u32 relative_address, u32 * write_array, u32 nr_of_regs);

_mali_osk_errcode_t mali_core_renderunit_init(struct mali_core_renderunit * core);
void mali_core_renderunit_term(struct mali_core_renderunit * core);
int mali_core_renderunit_map_registers(struct mali_core_renderunit *core);
void mali_core_renderunit_unmap_registers(struct mali_core_renderunit *core);
int mali_core_renderunit_irq_handler_add(struct mali_core_renderunit *core);
mali_core_renderunit * mali_core_renderunit_get_mali_core_nr(mali_core_subsystem *subsys, u32 mali_core_nr);

int mali_core_subsystem_init(struct mali_core_subsystem * new_subsys);

void mali_core_subsystem_attach_mmu(mali_core_subsystem* subsys);

int mali_core_subsystem_register_renderunit(struct mali_core_subsystem * subsys, struct mali_core_renderunit * core);
int mali_core_subsystem_system_info_fill(mali_core_subsystem* subsys, _mali_system_info* info);
void mali_core_subsystem_cleanup(struct mali_core_subsystem * subsys);

void mali_core_subsystem_broadcast_notification(struct mali_core_subsystem * subsys, mali_core_notification_message message, u32 data);

void mali_core_session_begin(mali_core_session *session);
void mali_core_session_close(mali_core_session * session);
int mali_core_session_add_job(mali_core_session * session, mali_core_job *job, mali_core_job **job_return);
u32 mali_core_hang_check_timeout_get(void);

_mali_osk_errcode_t mali_core_subsystem_ioctl_start_job(mali_core_session * session, void *job_data);
_mali_osk_errcode_t mali_core_subsystem_ioctl_number_of_cores_get(mali_core_session * session, u32 *number_of_cores);
_mali_osk_errcode_t mali_core_subsystem_ioctl_core_version_get(mali_core_session * session, _mali_core_version *version);
_mali_osk_errcode_t mali_core_subsystem_ioctl_suspend_response(mali_core_session * session, void* argument);
void mali_core_subsystem_ioctl_abort_job(mali_core_session * session, u32 id);


_mali_osk_errcode_t mali_core_subsystem_signal_power_down(mali_core_subsystem *subsys, u32 mali_core_nr, mali_bool immediate_only);
_mali_osk_errcode_t mali_core_subsystem_signal_power_up(mali_core_subsystem *subsys, u32 mali_core_nr, mali_bool queue_only);



void mali_core_renderunit_dump_state(mali_core_subsystem* subsystem);
# 19 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2
# 1 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.h" 1
# 16 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.h"
extern struct mali_kernel_subsystem mali_subsystem_l2_cache;

_mali_osk_errcode_t mali_kernel_l2_cache_invalidate_all(void);
_mali_osk_errcode_t mali_kernel_l2_cache_invalidate_page(u32 page);

void mali_kernel_l2_cache_do_enable(void);
void mali_kernel_l2_cache_set_perf_counters(u32 src0, u32 src1, int force_reset);
void mali_kernel_l2_cache_get_perf_counters(u32 *src0, u32 *val0, u32 *src1, u32 *val1);
# 20 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c" 2
# 31 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
typedef enum mali_l2_cache_register {
 MALI400_L2_CACHE_REGISTER_STATUS = 0x0002,

 MALI400_L2_CACHE_REGISTER_COMMAND = 0x0004,
 MALI400_L2_CACHE_REGISTER_CLEAR_PAGE = 0x0005,
 MALI400_L2_CACHE_REGISTER_ENABLE = 0x0007,
 MALI400_L2_CACHE_REGISTER_PERFCNT_SRC0 = 0x0008,
 MALI400_L2_CACHE_REGISTER_PERFCNT_VAL0 = 0x0009,
 MALI400_L2_CACHE_REGISTER_PERFCNT_SRC1 = 0x000A,
 MALI400_L2_CACHE_REGISTER_PERFCNT_VAL1 = 0x000B,
} mali_l2_cache_register;






typedef enum mali_l2_cache_command
{
 MALI400_L2_CACHE_COMMAND_CLEAR_ALL = 0x01,

} mali_l2_cache_command;





typedef enum mali_l2_cache_enable
{
 MALI400_L2_CACHE_ENABLE_DEFAULT = 0x0,
 MALI400_L2_CACHE_ENABLE_ACCESS = 0x01,
 MALI400_L2_CACHE_ENABLE_READ_ALLOCATE = 0x02,
} mali_l2_cache_enable;




typedef enum mali_l2_cache_status
{
 MALI400_L2_CACHE_STATUS_COMMAND_BUSY = 0x01,
 MALI400_L2_CACHE_STATUS_DATA_BUSY = 0x02,
} mali_l2_cache_status;







typedef struct mali_kernel_l2_cache_core
{
 unsigned long base;
 mali_io_address mapped_registers;
 u32 mapping_size;
 _mali_osk_list_t list;
 _mali_osk_lock_t *lock;
} mali_kernel_l2_cache_core;
# 98 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
static _mali_osk_errcode_t mali_l2_cache_initialize(mali_kernel_subsystem_identifier id);







static void mali_l2_cache_terminate(mali_kernel_subsystem_identifier id);







static _mali_osk_errcode_t mali_l2_cache_load_complete(mali_kernel_subsystem_identifier id);
# 123 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
static _mali_osk_errcode_t mali_l2_cache_core_create(_mali_osk_resource_t * resource);
# 132 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
static void mali_l2_cache_register_write(mali_kernel_l2_cache_core * unit, mali_l2_cache_register reg, u32 val);
# 141 "../../drivers/media/video/samsung/mali/common/mali_kernel_l2_cache.c"
static _mali_osk_errcode_t mali_kernel_l2_cache_invalidate_all_cache(mali_kernel_l2_cache_core *cache);






struct mali_kernel_subsystem mali_subsystem_l2_cache =
{
 mali_l2_cache_initialize,
 mali_l2_cache_terminate,
 mali_l2_cache_load_complete,
 ((void *)0),
 ((void *)0),
 ((void *)0),
 ((void *)0),

 ((void *)0),

};



static _mali_osk_list_t caches_head;





static _mali_osk_errcode_t mali_l2_cache_initialize(mali_kernel_subsystem_identifier id)
{
 _mali_osk_errcode_t err;

 id=id;

 do {} while(0);

 _mali_osk_list_init(&caches_head);


 err = _mali_kernel_core_register_resource_handler(MALI400L2, mali_l2_cache_core_create);

 return (err);
}




static void mali_l2_cache_terminate(mali_kernel_subsystem_identifier id)
{
 mali_kernel_l2_cache_core * cache, *temp_cache;

 do {} while(0);


 for (cache = ((mali_kernel_l2_cache_core *)( ((char *)(&caches_head)->next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )), temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )); &cache->list != (&caches_head); cache = temp_cache, temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)temp_cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )))
 {

  mali_l2_cache_register_write(cache, MALI400_L2_CACHE_REGISTER_ENABLE, (u32)MALI400_L2_CACHE_ENABLE_DEFAULT);


  _mali_osk_list_del( &cache->list );


  _mali_osk_mem_unmapioregion( cache->base, cache->mapping_size, cache->mapped_registers );
  _mali_osk_mem_unreqregion( cache->base, cache->mapping_size );
  _mali_osk_lock_term( cache->lock );
  _mali_osk_free( cache );



   malipmm_core_unregister( MALI_PMM_CORE_L2 );

 }
}

static _mali_osk_errcode_t mali_l2_cache_core_create(_mali_osk_resource_t * resource)
{
 _mali_osk_errcode_t err = _MALI_OSK_ERR_FAULT ;
 mali_kernel_l2_cache_core * cache = ((void *)0);

 do {} while(0);



 err = malipmm_core_register( MALI_PMM_CORE_L2 );
 if( _MALI_OSK_ERR_OK != err )
 {
  do {} while(0);
  return err;
 }


 err = _mali_osk_mem_reqregion( resource->base, 0x30, resource->description);

 do { if(!(_MALI_OSK_ERR_OK == err)) goto err_cleanup_requestmem_failed; } while(0);


 err = _MALI_OSK_ERR_FAULT;

 cache = _mali_osk_malloc(sizeof(mali_kernel_l2_cache_core));

 do { if(!(((void *)0) != cache)) goto err_cleanup; } while(0);

 cache->lock = _mali_osk_lock_init( _MALI_OSK_LOCKFLAG_ORDERED | _MALI_OSK_LOCKFLAG_SPINLOCK | _MALI_OSK_LOCKFLAG_NONINTERRUPTABLE, 0, 104 );

 do { if(!(((void *)0) != cache->lock)) goto err_cleanup; } while(0);


 _mali_osk_list_init(&cache->list);

 cache->base = resource->base;
 cache->mapping_size = 0x30;


 cache->mapped_registers = _mali_osk_mem_mapioregion( cache->base, cache->mapping_size, resource->description );

 do { if(!(((void *)0) != cache->mapped_registers)) goto err_cleanup; } while(0);


 err = mali_kernel_l2_cache_invalidate_all_cache(cache);

 do { if(!(_MALI_OSK_ERR_OK == err)) goto err_cleanup; } while(0);


 _mali_osk_list_add( &cache->list, &caches_head );

 return (_MALI_OSK_ERR_OK);

err_cleanup:


 if ( ((void *)0) != cache )
 {
  if (((void *)0) != cache->mapped_registers)
  {
   _mali_osk_mem_unmapioregion( cache->base, cache->mapping_size, cache->mapped_registers);
  }
  else
  {
   do {} while(0);
  }

  if( ((void *)0) != cache->lock )
  {
   _mali_osk_lock_term( cache->lock );
  }
  else
  {
   do {} while(0);
  }

  _mali_osk_free( cache );
 }
 else
 {
  do {} while(0);
 }


 _mali_osk_mem_unreqregion( resource->base, 0x30);

 malipmm_core_unregister( MALI_PMM_CORE_L2 );

 return err;

err_cleanup_requestmem_failed:
 do {} while(0);


 malipmm_core_unregister( MALI_PMM_CORE_L2 );

 return err;

}


static void mali_l2_cache_register_write(mali_kernel_l2_cache_core * unit, mali_l2_cache_register reg, u32 val)
{
 _mali_osk_mem_iowrite32(unit->mapped_registers, (u32)reg * sizeof(u32), val);
}


static u32 mali_l2_cache_register_read(mali_kernel_l2_cache_core * unit, mali_l2_cache_register reg)
{
 return _mali_osk_mem_ioread32(unit->mapped_registers, (u32)reg * sizeof(u32));
}

void mali_kernel_l2_cache_do_enable(void)
{
 mali_kernel_l2_cache_core * cache, *temp_cache;



 for (cache = ((mali_kernel_l2_cache_core *)( ((char *)(&caches_head)->next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )), temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )); &cache->list != (&caches_head); cache = temp_cache, temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)temp_cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )))
 {
  mali_l2_cache_register_write(cache, MALI400_L2_CACHE_REGISTER_ENABLE, (u32)MALI400_L2_CACHE_ENABLE_ACCESS | (u32)MALI400_L2_CACHE_ENABLE_READ_ALLOCATE);
 }
}


static _mali_osk_errcode_t mali_l2_cache_load_complete(mali_kernel_subsystem_identifier id)
{
 mali_kernel_l2_cache_do_enable();
 do {} while(0);

 return (_MALI_OSK_ERR_OK);
}

static _mali_osk_errcode_t mali_kernel_l2_cache_send_command(mali_kernel_l2_cache_core *cache, u32 reg, u32 val)
{
 int i = 0;
 const int loop_count = 100000;





 _mali_osk_lock_wait(cache->lock, _MALI_OSK_LOCKMODE_RW);



 for (i = 0; i < loop_count; i++)
 {
  if (!(_mali_osk_mem_ioread32(cache->mapped_registers , (u32)MALI400_L2_CACHE_REGISTER_STATUS * sizeof(u32)) & (u32)MALI400_L2_CACHE_STATUS_COMMAND_BUSY))
  {
   break;
  }
 }

 if (i == loop_count)
 {
  _mali_osk_lock_signal(cache->lock, _MALI_OSK_LOCKMODE_RW);
  do {} while(0);
  return (_MALI_OSK_ERR_FAULT);
 }


 mali_l2_cache_register_write(cache, reg, val);

 _mali_osk_lock_signal(cache->lock, _MALI_OSK_LOCKMODE_RW);
 return (_MALI_OSK_ERR_OK);
}


static _mali_osk_errcode_t mali_kernel_l2_cache_invalidate_all_cache(mali_kernel_l2_cache_core *cache)
{
 return mali_kernel_l2_cache_send_command(cache, MALI400_L2_CACHE_REGISTER_COMMAND, MALI400_L2_CACHE_COMMAND_CLEAR_ALL);
}

_mali_osk_errcode_t mali_kernel_l2_cache_invalidate_all(void)
{
 mali_kernel_l2_cache_core * cache, *temp_cache;



 for (cache = ((mali_kernel_l2_cache_core *)( ((char *)(&caches_head)->next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )), temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )); &cache->list != (&caches_head); cache = temp_cache, temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)temp_cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )))
 {
  do { _mali_osk_errcode_t _check_no_error_result=(mali_kernel_l2_cache_invalidate_all_cache(cache)); if(_check_no_error_result != _MALI_OSK_ERR_OK) return (_check_no_error_result); } while(0);
 }

 return (_MALI_OSK_ERR_OK);
}


static _mali_osk_errcode_t mali_kernel_l2_cache_invalidate_page_cache(mali_kernel_l2_cache_core *cache, u32 page)
{
 return mali_kernel_l2_cache_send_command(cache, MALI400_L2_CACHE_REGISTER_CLEAR_PAGE, page);
}

_mali_osk_errcode_t mali_kernel_l2_cache_invalidate_page(u32 page)
{
 mali_kernel_l2_cache_core * cache, *temp_cache;



 for (cache = ((mali_kernel_l2_cache_core *)( ((char *)(&caches_head)->next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )), temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )); &cache->list != (&caches_head); cache = temp_cache, temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)temp_cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )))
 {
  do { _mali_osk_errcode_t _check_no_error_result=(mali_kernel_l2_cache_invalidate_page_cache(cache, page)); if(_check_no_error_result != _MALI_OSK_ERR_OK) return (_check_no_error_result); } while(0);
 }

 return (_MALI_OSK_ERR_OK);
}


void mali_kernel_l2_cache_set_perf_counters(u32 src0, u32 src1, int force_reset)
{
 mali_kernel_l2_cache_core * cache, *temp_cache;
 int reset0 = force_reset;
 int reset1 = force_reset;






 for (cache = ((mali_kernel_l2_cache_core *)( ((char *)(&caches_head)->next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )), temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )); &cache->list != (&caches_head); cache = temp_cache, temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)temp_cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )))
 {
  u32 cur_src0 = mali_l2_cache_register_read(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_SRC0);
  u32 cur_src1 = mali_l2_cache_register_read(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_SRC1);

  if (src0 != cur_src0)
  {
   mali_l2_cache_register_write(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_SRC0, src0);
  
   reset0 = 1;
  }

  if (src1 != cur_src1)
  {
   mali_l2_cache_register_write(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_SRC1, src1);
  
   reset1 = 1;
  }

  if (reset0)
  {
   mali_l2_cache_register_write(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_VAL0, 0);
  }

  if (reset1)
  {
   mali_l2_cache_register_write(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_VAL1, 0);
  }

  do {} while(0);


 }
}


void mali_kernel_l2_cache_get_perf_counters(u32 *src0, u32 *val0, u32 *src1, u32 *val1)
{
 mali_kernel_l2_cache_core * cache, *temp_cache;
 int first_time = 1;
 *src0 = 0;
 *src1 = 0;
 *val0 = 0;
 *val1 = 0;


 for (cache = ((mali_kernel_l2_cache_core *)( ((char *)(&caches_head)->next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )), temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )); &cache->list != (&caches_head); cache = temp_cache, temp_cache = ((mali_kernel_l2_cache_core *)( ((char *)temp_cache->list.next) - __builtin_offsetof(mali_kernel_l2_cache_core,list) )))
 {
  u32 cur_src0 = mali_l2_cache_register_read(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_SRC0);
  u32 cur_src1 = mali_l2_cache_register_read(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_SRC1);
  u32 cur_val0 = mali_l2_cache_register_read(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_VAL0);
  u32 cur_val1 = mali_l2_cache_register_read(cache, MALI400_L2_CACHE_REGISTER_PERFCNT_VAL1);

  do {} while(0);

  if (first_time)
  {
   *src0 = cur_src0;
   *src1 = cur_src1;
   first_time = 0;
  }

  if (*src0 == cur_src0 && *src1 == cur_src1)
  {
   *val0 += cur_val0;
   *val1 += cur_val1;
  }
  else
  {
   do {} while(0);
  }
 }
}
