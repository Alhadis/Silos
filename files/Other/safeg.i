# 1 "safeg.S"
# 1 "/home/cylee/alps/final/kernel/secure/monitor/safeg//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "safeg.S"
# 39 "safeg.S"
# 1 "arm.h" 1
# 180 "arm.h"
.macro CP15_CONTROL_WRITE treg
  mcr p15, 0, \treg, c1, c0, 0
.endm
.macro CP15_CONTROL_READ treg
  mrc p15, 0, \treg, c1, c0, 0
.endm
.macro CP15_SCR_WRITE treg
  mcr p15, 0, \treg, c1, c1, 0
.endm
.macro CP15_SCR_READ treg
  mrc p15, 0, \treg, c1, c1, 0
.endm
.macro CP15_NSACR_WRITE treg
  mcr p15, 0, \treg, c1, c1, 2
.endm
.macro CP15_VBAR_READ treg
  mrc p15, 0, \treg, c12, c0, 0
.endm
.macro CP15_VBAR_WRITE treg
  mcr p15, 0, \treg, c12, c0, 0
.endm
.macro CP15_MVBAR_WRITE treg
  mcr p15, 0, \treg, c12, c0, 1
.endm
.macro CP15_Flush_BTAC treg
  mov \treg, #0
  mcr p15, 0, \treg, c7, c5, 6
.endm
# 40 "safeg.S" 2
# 1 "entry.h" 1
# 41 "safeg.S" 2
# 1 "safeg_syscalls.h" 1
# 42 "safeg.S" 2
# 1 "safeg_measures.h" 1
# 43 "safeg.S" 2
# 65 "safeg.S"
.macro mov32, reg, val
        movw \reg, #:lower16:\val
        movt \reg, #:upper16:\val
.endm


.macro mov32eq, reg, val
        movweq \reg, #:lower16:\val
        movteq \reg, #:upper16:\val
.endm


.macro mov32ne, reg, val
        movwne \reg, #:lower16:\val
        movtne \reg, #:upper16:\val
.endm


.macro cpu_id, rd
        mrc p15, 0, \rd, c0, c0, 5
        and \rd, \rd, #0xF
.endm
# 121 "safeg.S"
    .macro SaveState
        stmdb sp, {r0-lr}^
        add r6, sp, #(N_IRQ_SPSR_CORE0 - NtContextBase0)
        cps #0b10010
        mrs r12, spsr
        stmia r6!, {r12-lr}
        cps #0b10011
        mrs r12, spsr
        stmia r6!, {r12-lr}
        cps #0b10111
        mrs r12, spsr
        stmia r6!, {r12-lr}
        cps #0b11011
        mrs r12, spsr
        stmia r6!, {r12-lr}
        cps #0b10001
        mrs r7, spsr
        stmia r6, {r7-lr}
        cps #0b10110
    .endm
# 154 "safeg.S"
    .macro LoadState
        add r6, sp, #(N_IRQ_SPSR_CORE0 - NtContextBase0)
        cps #0b10010
        ldmia r6!, {r12-lr}
        msr spsr_fsxc, r12
        cps #0b10011
        ldmia r6!, {r12-lr}
        msr spsr_fsxc, r12
        cps #0b10111
        ldmia r6!, {r12-lr}
        msr spsr_fsxc, r12
        cps #0b11011
        ldmia r6!, {r12-lr}
        msr spsr_fsxc, r12
        cps #0b10001
        ldmia r6, {r7-lr}
        msr spsr_fsxc, r7
        cps #0b10110
        ldmdb sp, {r0-lr}^
    .endm





    .macro GetCtBase table
 cpu_id sp

        cmp sp, #0
        ldreq sp, =_smm_stack_0
        cmp sp, #1
        ldreq sp, =_smm_stack_1
        cmp sp, #2
        ldreq sp, =_smm_stack_2
        cmp sp, #3
        ldreq sp, =_smm_stack_3

        add sp, sp, #0x72000000
        ldr sp, [sp]
        add sp, sp, #0x72000000
        sub sp, sp, #4

        stmfd sp!, {r0, r1}


        mrc p15, 0, r0, c0, c0, 5
        and r0, r0, #0x0f
        ldr r1, =\table
   add r1, r1, #0x72000000
        ldr r0, [r1, r0, asl #2]
        str r0, [sp, #8]
        ldmfd sp!, {r0, r1}
        ldr sp, [sp]
 add sp, sp, #0x72000000
    .endm
# 219 "safeg.S"
    .section .vector, "a"
    .align 5
    .globl MonitorVectorTableBase
MonitorVectorTableBase:
    ldr pc, reset_vector
    ldr pc, undef_vector
    ldr pc, smc_vector
    ldr pc, prefech_vector
    ldr pc, data_abort_vector
    ldr pc, reset_vector
    ldr pc, irq_vector
    ldr pc, fiq_vector





    .global monitor_vector_ref_tbl
monitor_vector_ref_tbl:
reset_vector:
    .long disaster + 0x72000000
undef_vector:
    .long disaster + 0x72000000
smc_vector:
    .long smc_handler + 0x72000000
prefech_vector:
    .long disaster + 0x72000000
data_abort_vector:
    .long data_abort_handler + 0x72000000
irq_vector:
    .long irq_handler + 0x72000000
fiq_vector:
    .long fiq_handler + 0x72000000
disaster:
    b disaster
# 275 "safeg.S"
    .text
    .align 5
    .global irq_handler
irq_handler:

    CP15_SCR_READ sp
    tst sp, #0b0000001
    beq trusted_irq




    cpu_id sp

    cmp sp, #0
    ldreq sp, =_smm_stack_0
    cmp sp, #1
    ldreq sp, =_smm_stack_1
    cmp sp, #2
    ldreq sp, =_smm_stack_2
    cmp sp, #3
    ldreq sp, =_smm_stack_3

    add sp, sp, #0x72000000
    ldr sp, [sp]
    add sp, sp, #0x72000000

    stmfd sp!, {r0-r1}
# 313 "safeg.S"
    CP15_CONTROL_READ r0
    tst r0, #0x00002000


    ldrne r0, =0xffff0018
    bne highvec


    CP15_VBAR_READ r0
    add r0, r0, #0x18

highvec:





    mov r1, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE r1
# 348 "safeg.S"
    str r0, [sp, #8]





    mov r0, lr
    mrs r1, spsr
    cps #0b10010
    mov lr, r0
    msr spsr_cxsf, r1
    cps #0b10110


    mov r1, #0b0000001 | 0b0000010 | 0b0000100 | 0b0001000 | 0b0100000
    CP15_SCR_WRITE r1


    mov r0, #(0b10010 | 0b00000000000000000000000010000000)
    msr spsr_fsxc, r0
# 382 "safeg.S"
    ldmfd sp!, {r0-r1, pc}^





trusted_irq:
    ldr r0, =trusted_irq_handler
    ldr r0, [r0]
    cmp r0, #0
    movne pc, r0
    b disaster







    .text
    .align 5
    .global fiq_handler
fiq_handler:
    cpu_id sp
    cmp sp, #1
    beq t_smc_wfi

    CP15_SCR_READ sp
    tst sp, #0b0000001
    bne non_trusted_fiq


trusted_fiq:
    cpu_id sp
    cmp sp, #0
    ldreq sp, =_smm_stack_0
    cmp sp, #1
    ldreq sp, =_smm_stack_1
    add sp, sp, #0x72000000
    ldr sp, [sp]
    add sp, sp, #0x72000000

    stmfd sp!, {r0,r1,r2}


    mrs r0, spsr
    and r1, r0, #0x0f
    cmp r1, #0
    beq 1f
    cmp r1, #3
    beq 2f
    orr r0, r0, #0b00000000000000000000000001000000
    orr r0, r0, #0b00000000000000000000000010000000
    msr spsr, r0

    ldmia sp!, {r0,r1,r2}
    sub lr, lr, #4
    movs pc, lr


2:
    mov r1, lr
    ldr r2, =0xffff000c
    cmp r2, r1
    bne 2f
    orr r0, r0, #0b00000000000000000000000001000000
    orr r0, r0, #0b00000000000000000000000010000000
    msr spsr, r0
    ldmia sp!, {r0,r1,r2}
    sub lr, lr, #4
    movs pc, lr

2:
    ldr r2, =0x8003ff84
    cmp r2, r1
    bne 1f
    orr r0, r0, #0b00000000000000000000000001000000
    orr r0, r0, #0b00000000000000000000000010000000
    msr spsr, r0
    ldmia sp!, {r0,r1,r2}
    sub lr, lr, #4
    movs pc, lr

1:
    ldmia sp!, {r0,r1,r2}

    stmfd sp!, {r0-r1}
# 477 "safeg.S"
    mov r0, lr
    mrs r1, spsr
    cps #0b10010
    mov lr, r0
    msr spsr_fsxc, r1
    cps #0b10110







    ldmfd sp!, {r0-r1}

    b fiq_exit


non_trusted_fiq:

    mov sp, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE sp

    sub lr, lr, #4



    GetCtBase nt_base_table




    srsia #0b10110

    SaveState
# 521 "safeg.S"
    GetCtBase t_base_table




    ldmfd sp, {r0, r1}
    add r0, r0, #4
    str r1, [sp, #0xc]
    str r0, [sp, #0x14]
    LoadState

    ldr sp, =_smm_stack_0
    add sp, sp, #0x72000000
    ldr sp, [sp]
    add sp, sp, #0x72000000
# 547 "safeg.S"
fiq_exit:

    mov lr, #(0b10010 | 0b00000000000000000000000001000000 | 0b00000000000000000000000010000000)
    str lr, [sp, #-4]!

    CP15_VBAR_READ lr
    add lr, lr, #0x18
    str lr, [sp, #-4]!

    rfeia sp






    .text
    .align 5
    .global smc_handler
smc_handler:

    CP15_SCR_READ sp
    tst sp, #0b0000001


    bne nt_smc_handler

t_smc_handler:

    cmp r0, #6
    beq nt_smc_tzipc




    GetCtBase t_base_table



    srsia #0b10110
    SaveState


    cmp r0, #1
    beq t_smc_reboot

t_smc_switch:



    GetCtBase t_base_table



    srsia #0b10110
    SaveState

t_smc_set:


    ldr r1, =0xf41c0020
    ldr r0, =0x00bb00bb
    str r0, [r1]
    add r1, r1, #4
    str r0, [r1]
    add r1, r1, #4
    ldr r0, =0x003f00bb
    str r0, [r1]
    ldr r1, =0xf41c006c
    ldr r0, =0x003300bb
    str r0, [r1]
    add r1, r1, #4
    ldr r0, =0x00bb003f
    str r0, [r1]



    ldr r1, =0xf2a01084
    ldr r2, =0xf2a01094
    ldr r0, =0xffffffff
1: str r0, [r1]
    add r1, r1, #0x4
    cmp r1, r2
    bne 1b


    ldr r1, =0xf2a01084
    ldr r0, =0xdefffdff
    str r0, [r1]
    add r1, r1, #8
    ldr r0, =0xfff3ffff
    str r0, [r1]


    ldr r1, =0xf2a01000
    ldr r0, =0x3
    str r0, [r1]


    ldr r1, =0xf2a01104
    ldr r0, =0x10400004
    str r0, [r1]


    ldr r1, =0xf2a01184
    ldr r0, =0x21000200
    str r0, [r1]
    add r1, r1, #8
    ldr r0, =0xfff3ffff
    str r0, [r1]

    mov pc, lr

t_smc_wfi_2:
    sub lr, lr, #4
    movs pc, lr

t_smc_wfi:

    ldr sp, =0xf2a01200
    ldr sp, [sp]
    tst sp, #0x100
    bne 1f

    tst sp, #0x80
    beq t_smc_wfi_2


    ldr sp, =_smm_stack_1
    add sp, sp, #0x72000000
    ldr sp, [sp]
    add sp, sp, #0x72000000
    push {r0, r1}
    ldr r0, =0xf2a01080
    ldr r1, =0xfffffffe
    str r1, [r0]
    mrs r0, spsr
    tst r0, #0x80
    ldm sp!, {r0, r1}

    bne t_smc_wfi_2

    b irq_handler

1:



    GetCtBase t_base_table



    srsia #0b10110
    SaveState


    mrc p15, 0, sp, c0, c0, 5
    and sp, sp, #0x0f
    ldr r5, =nt_base_table
    add r5, r5, #0x72000000
    ldr sp, [r5, sp, asl #2]
    add sp, sp, #0x72000000




    ldr r0, =0xf2a0010c
    ldr r0, [r0]


    ldr r1, =0xf2a00110
    str r0, [r1]


    ldr r1, =0xf2a01080
    ldr r0, =0xffffff7e
    str r0, [r1]


    ldr r1, =0xf2a00100
    ldr r0, =0xF
    str r0, [r1]

    bl t_smc_set
    b NTSecondaryBoot

t_smc_switch_exit:

    rfeia sp

t_smc_reboot:







    mrc p15, 0, r4, c0, c0, 5
    and r4, r4, #0x0f
    ldr r5, =nt_base_table
    ldr r4, [r5, r4, asl #2]



    ldr r2, =0b00000000000000000000000100000000 | 0b00000000000000000000000010000000 | 0b00000000000000000000000001000000 | 0b10011
    stmea r4, {r1, r2}


    mov r1, #0
    mov r2, #0x5e0
    mov r3, #0x100

    mrc p15, 0, r4, c0, c0, 5
    and r4, r4, #0x0f
    ldr r5, =nt_area_table
    ldr r4, [r5, r4, asl #2]



    stmea r4, {r1-r3}


    mov r2, #0b0000001 | 0b0000010 | 0b0000100 | 0b0001000 | 0b0100000
    CP15_SCR_WRITE r2


    ldr r1, =0x50078
    mcr p15, 0, r1, c1, c0, 0


    mov r2, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE r2
    b t_smc_switch

t_smc_boot:

    mrs r0, cpsr
    bic r0, r0, #0xC0
    msr cpsr, r0


    mov32 r0, 0x00a00100
    mov r1, #0xF
    str r1, [r0]


    add r0, r0, #4
    mov r1, #0xF0
    str r1, [r0]


    mov32 r0, 0x10004000
    mov32 r1, 0x1ffc
    add r0, r0, r1
    mov32 r2, 0x7ff11c0e
    str r2, [r0]

    mov r0, #0x15
    mcr p15, 0, r0, c3, c0, 0

    mov32 r0, 0x10004000
    mcr p15, 0, r0, c2, c0, 0

    mov32 r0, 0x10c53c7d
    mcr p15, 0, r0, c1, c0, 0

    mov r0, #0x41
    mcr p15, 0, r0, c1, c0, 1

    mov32 r0, 0xff0a81a8
    mcr p15, 0, r0, c10, c2, 0

    mov32 r0, 0x00f00000
    mcr p15, 0, r0, c1, c0, 2

    mov r0, #0x0
    mcr p15, 0, r0, c7, c5, 0

    mov r0, #0
    mcr p15, 2, r0, c0, c0, 0
    mrc p15, 1, r0, c0, c0, 0
    ldr r1, =0x7fff
    and r2, r1, r0, lsr #13
    ldr r1, =0x3ff
    and r3, r1, r0, lsr #3 @ NumWays - 1
    add r2, r2, #1 @ NumSets
    and r0, r0, #0x7
    add r0, r0, #4 @ SetShift
    clz r1, r3 @ WayShift
    add r4, r3, #1 @ NumWays
1: sub r2, r2, #1 @ NumSets--
    mov r3, r4 @ Temp = NumWays
2: subs r3, r3, #1 @ Temp--
    mov r5, r3, lsl r1
    mov r6, r2, lsl r0
    orr r5, r5, r6 @ Reg = (Temp<<WayShift)|(NumSets<<SetShift)
    mcr p15, 0, r5, c7, c6, 2
    bgt 2b
    cmp r2, #0
    bgt 1b

t_smc_boot_2:
    wfi
    b t_smc_boot_2

nt_smc_handler:
    ldr sp, =_smm_stack_1
    add sp, sp, #0x72000000
    ldr sp, [sp]
    add sp, sp, #0x72000000


    cmp r0, #0
    beq nt_smc_switch

    cmp r0, #2
    addeq lr, lr, #4
    beq non_trusted_fiq

    cmp r0, #1
    beq nt_smc_cache


    cmp r0, #6
    beq nt_smc_tzipc

    cmp r0, #7
    beq nt_smc_set_ipi

    cmp r0, #8
    beq nt_smc_ipi


    mov r1, #1
    b nt_smc_return_to_nt

nt_smc_switch:

    mov sp, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE sp



    mrc p15, 0, sp, c0, c0, 5
    and sp, sp, #0x0f

    ldr sp, =nt_base_table
    ldr sp, [sp]



    srsia #0b10110

    SaveState






    mrc p15, 0, r6, c0, c0, 5
    and r6, r6, #0x0f
    ldr r5, =t_area_table
    add r5, r5, #0x72000000
    ldr r6, [r5, r6, asl #2]
    add r6, r6, #0x72000000







    b nt_smc_switch_exit

nt_smc_ipi:

    mov r0, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE r0


    ldr r0, =0xf2a01084
    ldr sp, =0xdefff01f
    str sp, [r0]


    ldr r0, =0xf2a01104
    ldr sp, =0x21000fe0
    str sp, [r0]
    add r0, r0, #8
    ldr sp, =0x000c0000
    str sp, [r0]


    ldr r0, =0xf2a01824
    ldr sp, =0x0101010f
    str sp, [r0]
    add r0, r0, #4
    ldr sp, =0x01010101
    str sp, [r0]
    add r0, r0, #0x10
    ldr sp, =0x0f0f0f01
    str sp, [r0]
    add r0, r0, #4
    ldr sp, =0x0f0f010f
    str sp, [r0]
    add r0, r0, #0x34
    ldr sp, =0x01010f0f
    str sp, [r0]

    mov r0, #0b0000001 | 0b0000010 | 0b0000100 | 0b0001000 | 0b0100000
    CP15_SCR_WRITE r0
    movs pc, lr

nt_smc_switch_exit:



    mrc p15, 0, sp, c0, c0, 5
    and sp, sp, #0x0f
    ldr r5, =t_base_table
    add r5, r5, #0x72000000
    ldr sp, [r5, sp, asl #2]
    add sp, sp, #0x72000000



    LoadState
    rfeia sp

nt_smc_switch_raise_handler:


    mrc p15, 0, sp, c0, c0, 5
    and sp, sp, #0x0f
    ldr r5, =t_base_table
    ldr sp, [r5, sp, asl #2]



    ldmfd sp, {r0, r1}
    add r0, r0, #4
    str r1, [sp, #0xc]
      str r0, [sp, #0x14]
    LoadState
    ldr sp, =_smm_stack_0
    ldr sp, [sp]
    mov lr, #(0b10010 | 0b00000000000000000000000001000000 | 0b00000000000000000000000010000000)
    str lr, [sp, #-4]!

    CP15_VBAR_READ lr
    add lr, lr, #0x20
    str lr, [sp, #-4]!

    rfeia sp

nt_smc_cache:

    cmp r1, #2
    beq nt_smc_cache_invalidate_dcache
    cmp r1, #3
    beq nt_smc_cache_invalidate_icache
    cmp r1, #4
    beq nt_smc_cache_invalidate_allcache


    mov r1, #1
    b nt_smc_return_to_nt

nt_smc_cache_invalidate_dcache:

    mov r0, #0
    mcr p15, 0, r0, c7, c6, 0
    b nt_smc_return_to_nt

nt_smc_cache_invalidate_icache:

    mov r0, #0
    mcr p15, 0, r0, c7, c5, 0
    b nt_smc_return_to_nt

nt_smc_cache_invalidate_allcache:

    mov r0, #0
    mcr p15, 0, r0, c7, c14, 0
    mcr p15, 0, r0, c7, c5, 0
    b nt_smc_return_to_nt

nt_smc_set_ipi:

    push {r0, r1}
    ldr r0, =0xf2a01080
    ldr r1, =0xfffffd7e
    str r1, [r0]
    ldm sp!, {r0, r1}
    b nt_smc_return_to_nt

nt_smc_tzipc:

    mov32 r0, 0xf2a01f00
    str r1, [r0]
    b nt_smc_return_to_nt

nt_smc_return_to_nt:
    movs pc, lr
# 1062 "safeg.S"
    .text
    .align 5
    .global data_abort_handler
data_abort_handler:

    mov sp, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE sp
# 1079 "safeg.S"
    mrc p15, 0, sp, c0, c0, 5
    and sp, sp, #0x0f
    ldr r5, =t_base_table
    ldr sp, [r5, sp, asl #2]



    ldmia sp, {r0, r1}

    mrc p15, 0, sp, c0, c0, 5
 and sp, sp, #0x0f
    cmp sp, #0
    ldreq sp, =S_SVC_LR_CORE0
    cmp sp, #1
    ldreq sp, =S_SVC_LR_CORE1
    cmp sp, #2
    ldreq sp, =S_SVC_LR_CORE2
    cmp sp, #3
    ldreq sp, =S_SVC_LR_CORE3



    str r0, [sp]
    str r1, [sp, #-8]






    mrc p15, 0, sp, c0, c0, 5
    and sp, sp, #0x0f
    ldr r5, =t_base_table
    ldr sp, [r5, sp, asl #2]




    CP15_VBAR_READ r0
    add r0, r0, #0x8
    mov r1, #(0b10011 | 0b00000000000000000000000010000000)
    stmia sp, {r0, r1}




    LoadState


    rfeia sp
# 1139 "safeg.S"
    .text
    .align 5
    .global SafeGStart
SafeGStart:



    mrc p15, 0, r2, c0, c0, 5
    and r2, r2, #0x0f
    ldr r5, =nt_base_table
    ldr r2, [r5, r2, asl #2]



    ldr r3, =0b00000000000000000000000100000000 | 0b00000000000000000000000010000000 | 0b00000000000000000000000001000000 | 0b10011
    stmea r2, {r0, r3}


    cps #0b10011


    mov pc, r1

    .text
    .align 5
    .global SafeGSecondaryBoot
SafeGSecondaryBoot:

    cps #0b10110
    mov r0, #0b0000010 | 0b0000100 | 0b0010000 | 0b0100000
    CP15_SCR_WRITE r0

    cpu_id sp
    cmp sp, #1
    ldreq sp, =_smm_stack_1
    cmp sp, #2
    ldreq sp, =_smm_stack_2
    cmp sp, #3
    ldreq sp, =_smm_stack_3
    ldr sp, [sp]

    ldr r1, =MonitorVectorTableBase
    add r1, r1, #0x72000000
    CP15_MVBAR_WRITE r1
    ldr r1, =((1 << 18)|(1 << 17)|(1 << 16)|(1 << 11)|(1 << 10))
    CP15_NSACR_WRITE r1
    ldr r0, =normal_secondary
    ldr r0, [r0]
    ldr r1, =t_smc_boot

    b SafeGStart

    .text
    .align 5
    .global NTSecondaryBoot
NTSecondaryBoot:
    cps #0b10110

    LoadState


    CP15_Flush_BTAC lr


    CP15_SCR_READ lr
    mov lr, #0b0000001 | 0b0000010 | 0b0000100 | 0b0001000 | 0b0100000
    CP15_SCR_WRITE lr

    mov lr, #0x15
    mcr p15, 0, lr, c3, c0, 0


    rfeia sp

    .align 5
safeg_now_init_core:
    .long 0x1
safeg_irq_handler_sp_core_1:
    .long 0x0
safeg_irq_handler_sp_core_2:
    .long 0x0
safeg_irq_handler_sp_core_3:
    .long 0x0

    .data
normal_secondary:
    .word 0x678006e0
secure_secondary:
    .word 0x104eef9c

    .data
    .align 5
T_RR_ratio : .long 0x3
NT_RR_ratio : .long 0x1

S_quantum:
S_quantum0 : .long 0x3
S_quantum1 : .long 0x3
S_quantum2 : .long 0x3
S_quantum3 : .long 0x3

NS_quantum:
NS_quantum0 : .long 0x1
NS_quantum1 : .long 0x1
NS_quantum2 : .long 0x1
NS_quantum3 : .long 0x1

LR_save_area:
LR_save_area0 : .long 0x0
LR_save_area1 : .long 0x0
LR_save_area2 : .long 0x0
LR_save_area3 : .long 0x0

R0_save_area:
R0_save_area0 : .long 0x0
R0_save_area1 : .long 0x0
R0_save_area2 : .long 0x0
R0_save_area3 : .long 0x0

Sched_flag: .long 0x0





current_world:
current_world0 : .long 0x1
current_world1 : .long 0x1
current_world2 : .long 0x1
current_world3 : .long 0x1
current_world_all : .long 0x1

nt_save_IPI:
nt_save_IPI0 : .long 0x0
nt_save_IPI1 : .long 0x0
nt_save_IPI2 : .long 0x0
nt_save_IPI3 : .long 0x0

t_save_IPI:
t_save_IPI0 : .long 0x0
t_save_IPI1 : .long 0x0
t_save_IPI2 : .long 0x0
t_save_IPI3 : .long 0x0
# 1295 "safeg.S"
    .bss
    .align 5
    .global NtContextSavedArea0
    .global NtContextSavedAreaEnd0
    .global TContextSavedArea0
    .global TContextSavedAreaEnd0
    .global NtContextBase0
    .global TContextBase0
NtContextSavedArea0:
N_USR_R0_CORE0 : .long 0x00
N_USR_R1_CORE0 : .long 0x00
N_USR_R2_CORE0 : .long 0x00
N_USR_R3_CORE0 : .long 0x00
N_USR_R4_CORE0 : .long 0x00
N_USR_R5_CORE0 : .long 0x00
N_USR_R6_CORE0 : .long 0x00
N_USR_R7_CORE0 : .long 0x00
N_USR_R8_CORE0 : .long 0x00
N_USR_R9_CORE0 : .long 0x00
N_USR_R10_CORE0 : .long 0x00
N_USR_R11_CORE0 : .long 0x00
N_USR_R12_CORE0 : .long 0x00
N_USR_SP_CORE0 : .long 0x00
N_USR_LR_CORE0 : .long 0x00

NtContextBase0:
N_PC_CORE0 : .long 0x00
N_CPSR_CORE0 : .long 0x00
N_SCRATCH_CORE0 : .long 0x00
N_IRQ_SPSR_CORE0 : .long 0x00
N_IRQ_SP_CORE0 : .long 0x00
N_IRQ_LR_CORE0 : .long 0x00
N_SVC_SPSR_CORE0 : .long 0x00
N_SVC_SP_CORE0 : .long 0x00
N_SVC_LR_CORE0 : .long 0x00
N_ABT_SPSR_CORE0 : .long 0x00
N_ABT_SP_CORE0 : .long 0x00
N_ABT_LR_CORE0 : .long 0x00
N_UND_SPSR_CORE0 : .long 0x00
N_UND_SP_CORE0 : .long 0x00
N_UND_LR_CORE0 : .long 0x00
N_FIQ_SPSR_CORE0 : .long 0x00
N_FIQ_R8_CORE0 : .long 0x00
N_FIQ_R9_CORE0 : .long 0x00
N_FIQ_R10_CORE0 : .long 0x00
N_FIQ_R11_CORE0 : .long 0x00
N_FIQ_R12_CORE0 : .long 0x00
N_FIQ_SP_CORE0 : .long 0x00
N_FIQ_LR_CORE0 : .long 0x00
NtContextSavedAreaEnd0:

TContextSavedArea0:
S_USR_R0_CORE0 : .long 0x00
S_USR_R1_CORE0 : .long 0x00
S_USR_R2_CORE0 : .long 0x00
S_USR_R3_CORE0 : .long 0x00
S_USR_R4_CORE0 : .long 0x00
S_USR_R5_CORE0 : .long 0x00
S_USR_R6_CORE0 : .long 0x00
S_USR_R7_CORE0 : .long 0x00
S_USR_R8_CORE0 : .long 0x00
S_USR_R9_CORE0 : .long 0x00
S_USR_R10_CORE0 : .long 0x00
S_USR_R11_CORE0 : .long 0x00
S_USR_R12_CORE0 : .long 0x00
S_USR_SP_CORE0 : .long 0x00
S_USR_LR_CORE0 : .long 0x00

TContextBase0:
S_PC_CORE0 : .long 0x00
S_CPSR_CORE0 : .long 0x00
S_SCRATCH_CORE0 : .long 0x00
S_IRQ_SPSR_CORE0 : .long 0x00
S_IRQ_SP_CORE0 : .long 0x00
S_IRQ_LR_CORE0 : .long 0x00
S_SVC_SPSR_CORE0 : .long 0x00
S_SVC_SP_CORE0 : .long 0x00
S_SVC_LR_CORE0 : .long 0x00
S_ABT_SPSR_CORE0 : .long 0x00
S_ABT_SP_CORE0 : .long 0x00
S_ABT_LR_CORE0 : .long 0x00
S_UND_SPSR_CORE0 : .long 0x00
S_UND_SP_CORE0 : .long 0x00
S_UND_LR_CORE0 : .long 0x00
S_FIQ_SPSR_CORE0 : .long 0x00
S_FIQ_R8_CORE0 : .long 0x00
S_FIQ_R9_CORE0 : .long 0x00
S_FIQ_R10_CORE0 : .long 0x00
S_FIQ_R11_CORE0 : .long 0x00
S_FIQ_R12_CORE0 : .long 0x00
S_FIQ_SP_CORE0 : .long 0x00
S_FIQ_LR_CORE0 : .long 0x00
TContextSavedAreaEnd0:






    .bss
    .align 5
    .global NtContextSavedArea1
    .global NtContextSavedAreaEnd1
    .global TContextSavedArea1
    .global TContextSavedAreaEnd1
    .global NtContextBase1
    .global TContextBase1
NtContextSavedArea1:
N_USR_R0_CORE1 : .long 0x00
N_USR_R1_CORE1 : .long 0x00
N_USR_R2_CORE1 : .long 0x00
N_USR_R3_CORE1 : .long 0x00
N_USR_R4_CORE1 : .long 0x00
N_USR_R5_CORE1 : .long 0x00
N_USR_R6_CORE1 : .long 0x00
N_USR_R7_CORE1 : .long 0x00
N_USR_R8_CORE1 : .long 0x00
N_USR_R9_CORE1 : .long 0x00
N_USR_R10_CORE1 : .long 0x00
N_USR_R11_CORE1 : .long 0x00
N_USR_R12_CORE1 : .long 0x00
N_USR_SP_CORE1 : .long 0x00
N_USR_LR_CORE1 : .long 0x00

NtContextBase1:
N_PC_CORE1 : .long 0x00
N_CPSR_CORE1 : .long 0x00
N_SCRATCH_CORE1 : .long 0x00
N_IRQ_SPSR_CORE1 : .long 0x00
N_IRQ_SP_CORE1 : .long 0x00
N_IRQ_LR_CORE1 : .long 0x00
N_SVC_SPSR_CORE1 : .long 0x00
N_SVC_SP_CORE1 : .long 0x00
N_SVC_LR_CORE1 : .long 0x00
N_ABT_SPSR_CORE1 : .long 0x00
N_ABT_SP_CORE1 : .long 0x00
N_ABT_LR_CORE1 : .long 0x00
N_UND_SPSR_CORE1 : .long 0x00
N_UND_SP_CORE1 : .long 0x00
N_UND_LR_CORE1 : .long 0x00
N_FIQ_SPSR_CORE1 : .long 0x00
N_FIQ_R8_CORE1 : .long 0x00
N_FIQ_R9_CORE1 : .long 0x00
N_FIQ_R10_CORE1 : .long 0x00
N_FIQ_R11_CORE1 : .long 0x00
N_FIQ_R12_CORE1 : .long 0x00
N_FIQ_SP_CORE1 : .long 0x00
N_FIQ_LR_CORE1 : .long 0x00
NtContextSavedAreaEnd1:

TContextSavedArea1:
S_USR_R0_CORE1 : .long 0x00
S_USR_R1_CORE1 : .long 0x00
S_USR_R2_CORE1 : .long 0x00
S_USR_R3_CORE1 : .long 0x00
S_USR_R4_CORE1 : .long 0x00
S_USR_R5_CORE1 : .long 0x00
S_USR_R6_CORE1 : .long 0x00
S_USR_R7_CORE1 : .long 0x00
S_USR_R8_CORE1 : .long 0x00
S_USR_R9_CORE1 : .long 0x00
S_USR_R10_CORE1 : .long 0x00
S_USR_R11_CORE1 : .long 0x00
S_USR_R12_CORE1 : .long 0x00
S_USR_SP_CORE1 : .long 0x00
S_USR_LR_CORE1 : .long 0x00

TContextBase1:
S_PC_CORE1 : .long 0x00
S_CPSR_CORE1 : .long 0x00
S_SCRATCH_CORE1 : .long 0x00
S_IRQ_SPSR_CORE1 : .long 0x00
S_IRQ_SP_CORE1 : .long 0x00
S_IRQ_LR_CORE1 : .long 0x00
S_SVC_SPSR_CORE1 : .long 0x00
S_SVC_SP_CORE1 : .long 0x00
S_SVC_LR_CORE1 : .long 0x00
S_ABT_SPSR_CORE1 : .long 0x00
S_ABT_SP_CORE1 : .long 0x00
S_ABT_LR_CORE1 : .long 0x00
S_UND_SPSR_CORE1 : .long 0x00
S_UND_SP_CORE1 : .long 0x00
S_UND_LR_CORE1 : .long 0x00
S_FIQ_SPSR_CORE1 : .long 0x00
S_FIQ_R8_CORE1 : .long 0x00
S_FIQ_R9_CORE1 : .long 0x00
S_FIQ_R10_CORE1 : .long 0x00
S_FIQ_R11_CORE1 : .long 0x00
S_FIQ_R12_CORE1 : .long 0x00
S_FIQ_SP_CORE1 : .long 0x00
S_FIQ_LR_CORE1 : .long 0x00
TContextSavedAreaEnd1:







    .bss
    .align 5
    .global NtContextSavedArea2
    .global NtContextSavedAreaEnd2
    .global TContextSavedArea2
    .global TContextSavedAreaEnd2
    .global NtContextBase2
    .global TContextBase2
NtContextSavedArea2:
N_USR_R0_CORE2 : .long 0x00
N_USR_R1_CORE2 : .long 0x00
N_USR_R2_CORE2 : .long 0x00
N_USR_R3_CORE2 : .long 0x00
N_USR_R4_CORE2 : .long 0x00
N_USR_R5_CORE2 : .long 0x00
N_USR_R6_CORE2 : .long 0x00
N_USR_R7_CORE2 : .long 0x00
N_USR_R8_CORE2 : .long 0x00
N_USR_R9_CORE2 : .long 0x00
N_USR_R10_CORE2 : .long 0x00
N_USR_R11_CORE2 : .long 0x00
N_USR_R12_CORE2 : .long 0x00
N_USR_SP_CORE2 : .long 0x00
N_USR_LR_CORE2 : .long 0x00

NtContextBase2:
N_PC_CORE2 : .long 0x00
N_CPSR_CORE2 : .long 0x00
N_SCRATCH_CORE2 : .long 0x00
N_IRQ_SPSR_CORE2 : .long 0x00
N_IRQ_SP_CORE2 : .long 0x00
N_IRQ_LR_CORE2 : .long 0x00
N_SVC_SPSR_CORE2 : .long 0x00
N_SVC_SP_CORE2 : .long 0x00
N_SVC_LR_CORE2 : .long 0x00
N_ABT_SPSR_CORE2 : .long 0x00
N_ABT_SP_CORE2 : .long 0x00
N_ABT_LR_CORE2 : .long 0x00
N_UND_SPSR_CORE2 : .long 0x00
N_UND_SP_CORE2 : .long 0x00
N_UND_LR_CORE2 : .long 0x00
N_FIQ_SPSR_CORE2 : .long 0x00
N_FIQ_R8_CORE2 : .long 0x00
N_FIQ_R9_CORE2 : .long 0x00
N_FIQ_R10_CORE2 : .long 0x00
N_FIQ_R11_CORE2 : .long 0x00
N_FIQ_R12_CORE2 : .long 0x00
N_FIQ_SP_CORE2 : .long 0x00
N_FIQ_LR_CORE2 : .long 0x00
NtContextSavedAreaEnd2:

TContextSavedArea2:
S_USR_R0_CORE2 : .long 0x00
S_USR_R1_CORE2 : .long 0x00
S_USR_R2_CORE2 : .long 0x00
S_USR_R3_CORE2 : .long 0x00
S_USR_R4_CORE2 : .long 0x00
S_USR_R5_CORE2 : .long 0x00
S_USR_R6_CORE2 : .long 0x00
S_USR_R7_CORE2 : .long 0x00
S_USR_R8_CORE2 : .long 0x00
S_USR_R9_CORE2 : .long 0x00
S_USR_R10_CORE2 : .long 0x00
S_USR_R11_CORE2 : .long 0x00
S_USR_R12_CORE2 : .long 0x00
S_USR_SP_CORE2 : .long 0x00
S_USR_LR_CORE2 : .long 0x00

TContextBase2:
S_PC_CORE2 : .long 0x00
S_CPSR_CORE2 : .long 0x00
S_SCRATCH_CORE2 : .long 0x00
S_IRQ_SPSR_CORE2 : .long 0x00
S_IRQ_SP_CORE2 : .long 0x00
S_IRQ_LR_CORE2 : .long 0x00
S_SVC_SPSR_CORE2 : .long 0x00
S_SVC_SP_CORE2 : .long 0x00
S_SVC_LR_CORE2 : .long 0x00
S_ABT_SPSR_CORE2 : .long 0x00
S_ABT_SP_CORE2 : .long 0x00
S_ABT_LR_CORE2 : .long 0x00
S_UND_SPSR_CORE2 : .long 0x00
S_UND_SP_CORE2 : .long 0x00
S_UND_LR_CORE2 : .long 0x00
S_FIQ_SPSR_CORE2 : .long 0x00
S_FIQ_R8_CORE2 : .long 0x00
S_FIQ_R9_CORE2 : .long 0x00
S_FIQ_R10_CORE2 : .long 0x00
S_FIQ_R11_CORE2 : .long 0x00
S_FIQ_R12_CORE2 : .long 0x00
S_FIQ_SP_CORE2 : .long 0x00
S_FIQ_LR_CORE2 : .long 0x00
TContextSavedAreaEnd2:







    .bss
    .align 5
    .global NtContextSavedArea3
    .global NtContextSavedAreaEnd3
    .global TContextSavedArea3
    .global TContextSavedAreaEnd3
    .global NtContextBase3
    .global TContextBase3
NtContextSavedArea3:
N_USR_R0_CORE3 : .long 0x00
N_USR_R1_CORE3 : .long 0x00
N_USR_R2_CORE3 : .long 0x00
N_USR_R3_CORE3 : .long 0x00
N_USR_R4_CORE3 : .long 0x00
N_USR_R5_CORE3 : .long 0x00
N_USR_R6_CORE3 : .long 0x00
N_USR_R7_CORE3 : .long 0x00
N_USR_R8_CORE3 : .long 0x00
N_USR_R9_CORE3 : .long 0x00
N_USR_R10_CORE3 : .long 0x00
N_USR_R11_CORE3 : .long 0x00
N_USR_R12_CORE3 : .long 0x00
N_USR_SP_CORE3 : .long 0x00
N_USR_LR_CORE3 : .long 0x00

NtContextBase3:
N_PC_CORE3 : .long 0x00
N_CPSR_CORE3 : .long 0x00
N_SCRATCH_CORE3 : .long 0x00
N_IRQ_SPSR_CORE3 : .long 0x00
N_IRQ_SP_CORE3 : .long 0x00
N_IRQ_LR_CORE3 : .long 0x00
N_SVC_SPSR_CORE3 : .long 0x00
N_SVC_SP_CORE3 : .long 0x00
N_SVC_LR_CORE3 : .long 0x00
N_ABT_SPSR_CORE3 : .long 0x00
N_ABT_SP_CORE3 : .long 0x00
N_ABT_LR_CORE3 : .long 0x00
N_UND_SPSR_CORE3 : .long 0x00
N_UND_SP_CORE3 : .long 0x00
N_UND_LR_CORE3 : .long 0x00
N_FIQ_SPSR_CORE3 : .long 0x00
N_FIQ_R8_CORE3 : .long 0x00
N_FIQ_R9_CORE3 : .long 0x00
N_FIQ_R10_CORE3 : .long 0x00
N_FIQ_R11_CORE3 : .long 0x00
N_FIQ_R12_CORE3 : .long 0x00
N_FIQ_SP_CORE3 : .long 0x00
N_FIQ_LR_CORE3 : .long 0x00
NtContextSavedAreaEnd3:

TContextSavedArea3:
S_USR_R0_CORE3 : .long 0x00
S_USR_R1_CORE3 : .long 0x00
S_USR_R2_CORE3 : .long 0x00
S_USR_R3_CORE3 : .long 0x00
S_USR_R4_CORE3 : .long 0x00
S_USR_R5_CORE3 : .long 0x00
S_USR_R6_CORE3 : .long 0x00
S_USR_R7_CORE3 : .long 0x00
S_USR_R8_CORE3 : .long 0x00
S_USR_R9_CORE3 : .long 0x00
S_USR_R10_CORE3 : .long 0x00
S_USR_R11_CORE3 : .long 0x00
S_USR_R12_CORE3 : .long 0x00
S_USR_SP_CORE3 : .long 0x00
S_USR_LR_CORE3 : .long 0x00

TContextBase3:
S_PC_CORE3 : .long 0x00
S_CPSR_CORE3 : .long 0x00
S_SCRATCH_CORE3 : .long 0x00
S_IRQ_SPSR_CORE3 : .long 0x00
S_IRQ_SP_CORE3 : .long 0x00
S_IRQ_LR_CORE3 : .long 0x00
S_SVC_SPSR_CORE3 : .long 0x00
S_SVC_SP_CORE3 : .long 0x00
S_SVC_LR_CORE3 : .long 0x00
S_ABT_SPSR_CORE3 : .long 0x00
S_ABT_SP_CORE3 : .long 0x00
S_ABT_LR_CORE3 : .long 0x00
S_UND_SPSR_CORE3 : .long 0x00
S_UND_SP_CORE3 : .long 0x00
S_UND_LR_CORE3 : .long 0x00
S_FIQ_SPSR_CORE3 : .long 0x00
S_FIQ_R8_CORE3 : .long 0x00
S_FIQ_R9_CORE3 : .long 0x00
S_FIQ_R10_CORE3 : .long 0x00
S_FIQ_R11_CORE3 : .long 0x00
S_FIQ_R12_CORE3 : .long 0x00
S_FIQ_SP_CORE3 : .long 0x00
S_FIQ_LR_CORE3 : .long 0x00
TContextSavedAreaEnd3:
