# 1 "src/start.S"
# 1 "<built-in>"
# 1 "<命令行>"
# 1 "src/start.S"





.section .text.init

.global _start
_start:

    mrs x1, MPIDR_EL1
    and x1, x1, #3
    cbz x1, setup

halt:

    wfe
    b halt

setup:

    adr x1, _start


    mrs x0, CurrentEL
    and x0, x0, #0b1100
    lsr x0, x0, #2

switch_to_el2:

    cmp x0, 0b11
    bne switch_to_el1
# 42 "src/start.S"
    mov x2, #0x5b1
    msr SCR_EL3, x2






    mov x2, #0x3c9
    msr SPSR_EL3, x2
    adr x2, switch_to_el1
    msr ELR_EL3, x2
    eret

switch_to_el1:

    cmp x0, 0b01
    beq set_stack




    msr SP_EL1, x1




    mrs x0, CNTHCTL_EL2
    orr x0, x0, #0b11
    msr CNTHCTL_EL2, x0
    msr CNTVOFF_EL2, xzr


    mov x0, #(1 << 31)
    orr x0, x0, #(1 << 1)
    msr HCR_EL2, x0
    mrs x0, HCR_EL2


    msr CPTR_EL2, xzr
    mrs x0, CPACR_EL1
    orr x0, x0, #(0b11 << 20)
    msr CPACR_EL1, x0


    mov x2, #0x0800
    movk x2, #0x30d0, lsl #16
    msr SCTLR_EL1, x2





    mov x2, #0x3c5
    msr SPSR_EL2, x2


    adr x2, set_stack
    msr ELR_EL2, x2
    eret

set_stack:

    mov sp, x1

zero_bss:

    ldr x1, =__bss_start
    ldr x2, =__bss_length

zero_bss_loop:

    cbz x2, go_kmain
    str xzr, [x1], #8
    sub x2, x2, #8
    cbnz x2, zero_bss_loop

go_kmain:

    bl kmain
    b halt

context_save:

 stp lr, x1, [SP, #-32]!
 str x2, [SP, #16]
 mrs x1, ESR_EL1
 mov x2, #0
 bl handle_exception

.global context_restore
context_restore:

 ldr x2, [SP, #16]
 ldp lr, x1, [SP], #32
    ret
# 148 "src/start.S"
.align 11
_vectors:

 .align 7; stp lr, x0, [SP, #-16]!; mov x0,0; movk x0, 0, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,0; movk x0, 1, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,0; movk x0, 2, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,0; movk x0, 3, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,1; movk x0, 0, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,1; movk x0, 1, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,1; movk x0, 2, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,1; movk x0, 3, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,2; movk x0, 0, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,2; movk x0, 1, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,2; movk x0, 2, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,2; movk x0, 3, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,3; movk x0, 0, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,3; movk x0, 1, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,3; movk x0, 2, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
 .align 7; stp lr, x0, [SP, #-16]!; mov x0,3; movk x0, 3, LSL #16; bl context_save; ldp lr, x0, [SP], #16; eret;
