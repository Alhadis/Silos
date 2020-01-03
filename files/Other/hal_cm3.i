#line 1 "rtx_src\\HAL_CM3.c"









 

#line 1 "rtx_src\\rt_TypeDef.h"









 




#line 21 "rtx_src\\rt_TypeDef.h"

#line 29 "rtx_src\\rt_TypeDef.h"




 
typedef char               S8;
typedef unsigned char      U8;
typedef short              S16;
typedef unsigned short     U16;
typedef int                S32;
typedef unsigned int       U32;
typedef long long          S64;
typedef unsigned long long U64;
typedef unsigned char      BIT;
typedef unsigned int       BOOL;
typedef void               (*FUNCP)(void);

typedef U32     OS_TID;
typedef void    *OS_ID;
typedef U32     OS_RESULT;
typedef S16			mqd_t;
typedef unsigned int			size_t;


 



typedef struct OS_TCB {
   
  U8     cb_type;                  
  U8     state;                    
  U8     prio;                     
  U8     task_id;                  
  struct OS_TCB *p_lnk;            
  struct OS_TCB *p_rlnk;           
  struct OS_TCB *p_dlnk;           
  struct OS_TCB *p_blnk;           
  U16    delta_time;               
  U16    interval_time;            
  U16    events;                   
  U16    waits;                    
  void   **msg;                    
  U8     ret_val;                  

   
  U8     ret_upd;                  
  U16    priv_stack;               
  U32    tsk_stack;                
  U32    *stack;                   

   
  FUNCP  ptask;                    
} *P_TCB;




typedef struct OS_PSFE {           
  void  *id;                       
  U32    arg;                      
} *P_PSFE;

typedef struct OS_PSQ {            
  U8     first;                    
  U8     last;                     
  U8     count;                    
  U8     size;                     
  struct OS_PSFE q[1];             
} *P_PSQ;

typedef struct OS_TSK {
  P_TCB  run;                      
  P_TCB  new;                      
} *P_TSK;

typedef struct OS_ROBIN {          
  P_TCB  task;                     
  U16    time;                     
  U16    tout;                     
} *P_ROBIN;

typedef struct OS_XCB {
  U8     cb_type;                  
  struct OS_TCB *p_lnk;            
  struct OS_TCB *p_rlnk;           
  struct OS_TCB *p_dlnk;           
  struct OS_TCB *p_blnk;           
  U16    delta_time;               
} *P_XCB;

typedef struct OS_MCB {
  U8     cb_type;                  
  U8     isr_st;                   
  struct OS_TCB *p_lnk;            
  U16    first;                    
  U16    last;                     
  U16    count;                    
  U16    size;                     
  void   *msg[1];                  
} *P_MCB;

typedef struct OS_SCB {
  U8     cb_type;                  
  U16    tokens;                   
  struct OS_TCB *p_lnk;            
} *P_SCB;

typedef struct OS_MUCB {
  U8     cb_type;                  
  U8     prio;                     
  U16    level;                    
  struct OS_TCB *p_lnk;            
  struct OS_TCB *owner;            
} *P_MUCB;

typedef struct OS_XTMR {
  struct OS_TMR  *next;
  U16    tcnt;
} *P_XTMR;

typedef struct OS_TMR {
  struct OS_TMR  *next;            
  U16    tcnt;                     
  U16    info;                     
} *P_TMR;

typedef struct OS_BM {
  void *free;                      
  void *end;                       
  U32  blk_size;                   
} *P_BM;

 






 

#line 13 "rtx_src\\HAL_CM3.c"
#line 1 "rtx_src\\RTX_Config.h"









 


 




 





 
extern U32 mp_tcb[];
extern U64 mp_stk[];
extern U32 os_fifo[];
extern void *os_active_TCB[];

 
extern U16 const os_maxtaskrun;
extern U32 const os_trv;
extern U8  const os_flags;
extern U32 const os_stackinfo;
extern U32 const os_rrobin;
extern U32 const os_clockrate;
extern U32 const os_timernum;
extern U16 const mp_tcb_size;
extern U32 const mp_stk_size;
extern U32 const *m_tmr;
extern U16 const mp_tmr_size;
extern U8  const os_fifo_size;

 
extern void os_idle_demon   (void);
extern void os_tmr_call     (U16  info);
extern void os_error        (U32 err_code);



 
#line 14 "rtx_src\\HAL_CM3.c"
#line 1 "rtx_src\\rt_System.h"









 

 


 
extern void rt_tsk_lock   (void);
extern void rt_tsk_unlock (void);
extern void rt_psh_req    (void);
extern void rt_pop_req    (void);
extern void rt_systick    (void);
extern void rt_stk_check  (void);



 

#line 15 "rtx_src\\HAL_CM3.c"
#line 1 "rtx_src\\rt_HAL_CM.h"









 

 





 
#line 25 "rtx_src\\rt_HAL_CM.h"

#line 34 "rtx_src\\rt_HAL_CM.h"

 


 
#line 45 "rtx_src\\rt_HAL_CM.h"

 
extern BIT dbg_msg;

 
#line 57 "rtx_src\\rt_HAL_CM.h"
__inline U32 rt_inc_qi (U32 size, U8 *count, U8 *first) {
  U32 cnt,c2;

  do {
    if ((cnt = __ldrex(count)) == size) {
      __clrex();
      return (cnt); }
  } while (__strex(cnt+1, count));
  do {
    c2 = (cnt = __ldrex(first)) + 1;
    if (c2 == size) c2 = 0;
  } while (__strex(c2, first));
#line 79 "rtx_src\\rt_HAL_CM.h"
  return (cnt);
}


extern void rt_init_stack (P_TCB p_TCB, FUNCP task_body);
extern void rt_set_PSP (U32 stack);
extern void os_set_env (void);
extern void *_alloc_box (void *box_mem);
extern int  _free_box (void *box_mem, void *box);

extern void dbg_init (void);
extern void dbg_task_notify (P_TCB p_tcb, BOOL create);
extern void dbg_task_switch (U32 task_id);

#line 103 "rtx_src\\rt_HAL_CM.h"



 

#line 16 "rtx_src\\HAL_CM3.c"
#line 1 "rtx_src\\rt_Task.h"









 

 

 
#line 25 "rtx_src\\rt_Task.h"

 









 
extern struct OS_TSK os_tsk;
extern struct OS_TCB os_idle_TCB;

 
extern void      rt_switch_req (P_TCB p_new);
extern void      rt_dispatch   (P_TCB next_TCB);
extern void      rt_block      (U16 timeout, U8 block_state);
extern void      rt_tsk_pass   (void);
extern OS_TID    rt_tsk_self   (void);
extern OS_RESULT rt_tsk_prio   (OS_TID task_id, U8 new_prio);
extern OS_TID    rt_tsk_create (FUNCP task, U32 prio_stksz, void *stk, void *argv);
extern OS_RESULT rt_tsk_delete (OS_TID task_id);
extern void      rt_sys_init   (FUNCP first_task, U32 prio_stksz, void *stk);




 






#line 17 "rtx_src\\HAL_CM3.c"
#line 1 "rtx_src\\rt_List.h"









 

 

 






 
extern struct OS_XCB os_rdy;
extern struct OS_XCB os_dly;

 
extern void  rt_put_prio      (P_XCB p_CB, P_TCB p_task);
extern P_TCB rt_get_first     (P_XCB p_CB);
extern void  rt_put_rdy_first (P_TCB p_task);
extern P_TCB rt_get_same_rdy_prio (void);
extern void  rt_resort_prio   (P_TCB p_task);
extern void  rt_put_dly       (P_TCB p_task, U16 delay);
extern void  rt_dec_dly       (void);
extern void  rt_rmv_list      (P_TCB p_task);
extern void  rt_rmv_dly       (P_TCB p_task);
extern void  rt_psq_enq       (OS_ID entry, U32 arg);

 





 

#line 18 "rtx_src\\HAL_CM3.c"
#line 1 "rtx_src\\rt_MemBox.h"









 

 


extern int     _init_box   (void *box_mem, U32 box_size, U32 blk_size);
extern void *rt_alloc_box  (void *box_mem);
extern void *  _calloc_box (void *box_mem);
extern int   rt_free_box   (void *box_mem, void *box);



 

#line 19 "rtx_src\\HAL_CM3.c"




 

BIT dbg_msg;



 


 

__asm void rt_set_PSP (U32 stack) {
        MSR     PSP,R0
        BX      LR
}


 

__asm void os_set_env (void) {
    
        MOV     R0,SP                   ; PSP = MSP
        MSR     PSP,R0
        LDR     R0,=__cpp(&os_flags)
        LDRB    R0,[R0]
        LSLS    R0,#31
        MOVNE   R0,#0x02                ; Priviliged Thread mode, use PSP
        MOVEQ   R0,#0x03                ; Unpriviliged Thread mode, use PSP
        MSR     CONTROL,R0
        BX      LR

        ALIGN
}


 

__asm void *_alloc_box (void *box_mem) {
    
        LDR     R12,=__cpp(rt_alloc_box)
        MRS     R3,IPSR
        LSLS    R3,#24
        BXNE    R12
        MRS     R3,CONTROL
        LSLS    R3,#31
        BXEQ    R12
        SVC     0
        BX      LR

        ALIGN
}


 

__asm int _free_box (void *box_mem, void *box) {
    
        LDR     R12,=__cpp(rt_free_box)
        MRS     R3,IPSR
        LSLS    R3,#24
        BXNE    R12
        MRS     R3,CONTROL
        LSLS    R3,#31
        BXEQ    R12
        SVC     0
        BX      LR

        ALIGN
}


 

__asm void SVC_Handler (void) {
        PRESERVE8

        IMPORT  SVC_Count
        IMPORT  SVC_Table
        IMPORT  rt_stk_check

        MRS     R0,PSP                  ; Read PSP
        LDR     R1,[R0,#24]             ; Read Saved PC from Stack
        LDRH    R1,[R1,#-2]             ; Load Halfword
        BICS    R1,R1,#0xFF00           ; Extract SVC Number
        BNE     SVC_User

        LDM     R0,{R0-R3,R12}          ; Read R0-R3,R12 from stack
        BLX     R12                     ; Call SVC Function 

        MRS     R12,PSP                 ; Read PSP
        LDR     R3,=__cpp(&os_tsk)
        LDM     R3,{R1,R2}              ; os_tsk.run, os_tsk.new
        CMP     R1,R2
        BEQ     SVC_Exit                ; no task switch

        PUSH    {R2,R3}
        MOV     R3,#1
        CMP     R1,#0                   ; Runtask deleted?
        STRBNE  R3,[R1,#33]     ; os_tsk.run->ret_upd = 1
        STMDBNE R12!,{R4-R11}           ; Save Old context
        STRNE   R12,[R1,#36]    ; Update os_tsk.run->tsk_stack
        BLNE    rt_stk_check            ; Check for Stack overflow

        POP     {R2,R3}
        STR     R2,[R3]                 ; os_tsk.run = os_tsk.new

        LDR     R12,[R2,#36]    ; os_tsk.new->tsk_stack
        LDMIA   R12!,{R4-R11}           ; Restore New Context
        LDRH    R3,[R2,#33]     ; Update ret_val?
        MSR     PSP,R12                 ; Write PSP

        CBZ     R3,SVC_Return
        LDRB    R0,[R2,#32]     ; Write os_tsk.new->ret_val

SVC_Exit
        STR     R0,[R12]                ; Function return value

SVC_Return
        MVN     LR,#:NOT:0xFFFFFFFD     ; set EXC_RETURN value
        BX      LR

         

SVC_User
        PUSH    {R4,LR}                 ; Save Registers
        LDR     R2,=SVC_Count
        LDR     R2,[R2]
        CMP     R1,R2
        BHI     SVC_Done                ; Overflow

        LDR     R4,=SVC_Table-4
        LDR     R4,[R4,R1,LSL #2]       ; Load SVC Function Address

        LDM     R0,{R0-R3,R12}          ; Read R0-R3,R12 from stack
        BLX     R4                      ; Call SVC Function

        MRS     R12,PSP
        STM     R12,{R0-R3}             ; Function return values
SVC_Done
        POP     {R4,PC}                 ; RETI

        ALIGN
}


 

__asm void Sys_Handler (void) {
        PRESERVE8

        EXPORT  SysTick_Handler
        EXPORT  PendSV_Handler

PendSV_Handler
        BL      __cpp(rt_pop_req)

Sys_Switch
        LDR     R3,=__cpp(&os_tsk)
        LDM     R3,{R1,R2}              ; os_tsk.run, os_tsk.new
        CMP     R1,R2
        BEQ     SysExit

        PUSH    {R2,R3}
        MOV     R3,#0
        STRB    R3,[R1,#33]     ; os_tsk.run->ret_upd = 0
        MRS     R12,PSP                 ; Read PSP
        STMDB   R12!,{R4-R11}           ; Save Old context
        STR     R12,[R1,#36]    ; Update os_tsk.run->tsk_stack
        BL      rt_stk_check            ; Check for Stack overflow

        POP     {R2,R3}
        STR     R2,[R3]                 ; os_tsk.run = os_tsk.new

        LDR     R12,[R2,#36]    ; os_tsk.new->tsk_stack
        LDMIA   R12!,{R4-R11}           ; Restore New Context
        MSR     PSP,R12                 ; Write PSP

        LDRB    R3,[R2,#33]     ; Update ret_val?
        CBZ     R3,SysExit
        LDRB    R3,[R2,#32]     ; Write os_tsk.new->ret_val
        STR     R3,[R12]
SysExit
        MVN     LR,#:NOT:0xFFFFFFFD     ; set EXC_RETURN value
        BX      LR                      ; Return to Thread Mode

SysTick_Handler
        BL      __cpp(rt_systick)
        B       Sys_Switch

        ALIGN
}


 

void rt_init_stack (P_TCB p_TCB, FUNCP task_body) {
   
  U32 *stk,i,size;

   
  size = p_TCB->priv_stack >> 2;
  if (size == 0) {
    size = (U16)os_stackinfo >> 2;
  }

   
  stk = &p_TCB->stack[size];

   
  if ((U32)stk & 0x04) {
    stk--;
  }

  stk -= 16;

   
  stk[15] = 0x01000000;
  stk[14] = (U32)task_body;

   
  for (i = 0; i < 14; i++) {
    stk[i] = 0;
  }

   
  stk[8] = (U32)p_TCB->msg;

   
  p_TCB->tsk_stack = (U32)stk;

   
  p_TCB->ptask = task_body;

   
  p_TCB->stack[0] = 0xE25A2EA5;
}


 

void dbg_init (void) {
  if (((*((volatile U32 *)0xE000EDFC)) & 0x01000000)     && 
      ((*((volatile U32 *)0xE0000E80)) & 0x00000001) &&
      ((*((volatile U32 *)0xE0000E00)) & (1UL << 31))) {
    dbg_msg = 1;
  }
}


 

void dbg_task_notify (P_TCB p_tcb, BOOL create) {
  while ((*((volatile U32 *)0xE000007C)) == 0);
  (*((volatile U32 *)0xE000007C)) = (U32)p_tcb->ptask;
  while ((*((volatile U32 *)0xE000007C)) == 0);
  (*((volatile U16 *)0xE000007C)) = (create << 8) | p_tcb->task_id;
}


 

void dbg_task_switch (U32 task_id) {
  while ((*((volatile U32 *)0xE000007C)) == 0);
  (*((volatile U8 *)0xE000007C)) = task_id;
}




 

