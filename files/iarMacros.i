/**************************************************
 *
 * Macros used by the IAR library.
 *
 * Copyright 2007-2008 IAR Systems. All rights reserved.
 *
 * $Revision: 21565 $
 *
 **************************************************/

#ifndef IARMACROS_I
#define IARMACROS_I

EXTH    MACRO   Rd,Rs
#if __ARM6__
        UXTH    Rd,Rs
#else
        LSLS    Rd,Rs,#16
        LSRS    Rd,Rd,#16
#endif
        ENDM

EXTB    MACRO   Rd,Rs
#if __ARM6__
        UXTB    Rd,Rs
#else
        LSLS    Rd,Rs,#24
        LSRS    Rd,Rd,#24
#endif
        ENDM



#ifdef __NO_STACK_ALIGN__
PUSHR   MACRO   reg,reg2
        PUSH    {reg}
        ENDM

POPR    MACRO   reg,reg2
        POP     {reg}
        ENDM

PUSHLR  MACRO   reg
        PUSH    {lr}
        ENDM

POPLR   MACRO   reg
        POP     {lr}
        ENDM

RETLR   MACRO   reg
#if __ARM5__
        POP     {pc}
#else
#ifdef THUMB_MODE
        POP     {pc}
#else
        POP     {lr}
        BX      lr
#endif
#endif
        ENDM
#else
PUSHR   MACRO   reg,reg2
        PUSH    {reg,reg2}
        ENDM

POPR    MACRO   reg,reg2
        POP     {reg,reg2}
        ENDM

PUSHLR  MACRO   reg
        PUSH    {reg,lr}
        ENDM

POPLR   MACRO   reg
        POP     {reg,lr}
        ENDM

RETLR   MACRO   reg
#if __ARM5__
        POP     {reg,pc}
#else
#ifdef THUMB_MODE
        POP     {reg,pc}
#else
        POP     {reg,lr}
        BX      lr
#endif
#endif
        ENDM
#endif /*__NO_STACK_ALIGN__ */



RETR    MACRO   reg
#if __ARM5__
        POP     {reg,pc}
#else
#ifdef THUMB_MODE
        POP     {reg,pc}
#else
        POP     {reg,lr}
        BX      lr
#endif
#endif
        ENDM



NRMLZ   MACRO   dHi,dLo,dEx,dTa,dTb,Op
#ifdef THUMB_MODE
        BICS    dHi,dHi,#0x80000000     ; Clear sign and test zero
        CLZ     dTb,dHi
        ITT     EQ
        CLZEQ   dTa,dLo
        ADDEQ   dTb,dTb,dTa
        SUBS    dTb,dTb,#11
        Op      dEx,dEx,dTb
        
        SUBS    dTa,dTb,#32             ; Normalize the sub-normal mantissa
        ITEEE   HS                      ;
        LSLHS   dHi,dLo,dTa             ;
        LSLLO   dHi,dHi,dTb             ;
        RSBLO   dTa,dTb,#32             ;
        LSRLO   dTa,dLo,dTa             ;
        IT      LO
        ORRLO   dHi,dHi,dTa             ;
        LSLS    dLo,dLo,dTb             ;
#else
#if __ARM5__
        BICS    dHi,dHi,#0x80000000     ; Clear sign and test zero
        CLZ     dTb,dHi
        CLZEQ   dTa,dLo
        ADDEQ   dTb,dTb,dTa
        SUB     dTb,dTb,#11
        Op      dEx,dEx,dTb
        
        SUBS    dTa,dTb,#32             ; Normalize the sub-normal mantissa
        LSLHS   dHi,dLo,dTa             ;
        LSLLO   dHi,dHi,dTb             ;
        RSBLO   dTa,dTb,#32             ;
        ORRLO   dHi,dHi,dLo,LSR dTa     ;
        LSL     dLo,dLo,dTb             ;
#else
        LOCAL   Loop
Loop:   Op      dEx,dEx,#1              ; Count down the exponent
        MOVS    dLo,dLo,LSL #1          ; Shift up the mantissa
        ADC     dHi,dHi,dHi             ;
        TST     dHi,#0x00100000         ; Check if msb is set
        BEQ     Loop                    ; => Continue until msb is set
#endif
#endif
        ENDM


#endif /* IARMACROS_I */
