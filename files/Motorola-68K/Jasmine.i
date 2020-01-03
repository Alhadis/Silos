;//****************************************************************************//
;//**                                                                        **//
;//**  File:          Jasmine.i ($NAME=Jasmine.i)                            **//
;//**                                                                        **//
;//**  Description:   Class data description and required XREFS              **//
;//**  Comment(s):                                                           **//
;//**                                                                        **//
;//**  First Started: 2002-08-04                                             **//
;//**  Last Updated:  2002-08-24                                             **//
;//**                                                                        **//
;//**  Author(s):     Karl Churchill                                         **//
;//**                                                                        **//
;//**  Copyright:     (C)1998-2002, eXtropia Studios                         **//
;//**                 Serkan YAZICI, Karl Churchill                          **//
;//**                 All Rights Reserved.                                   **//
;//**                                                                        **//
;//****************************************************************************//

;//////////////////////////////////////////////////////////////////////////////
;//
;//  JASMINE MC680x0 definitions
;//
;//////////////////////////////////////////////////////////////////////////////

;// Target

	mc68040

;// Imported symbols

	XREF	Neg64
	XREF	Add64
	XREF	Sub64
	XREF	SMult64
	XREF	UMult64
	XREF	SDiv64
	XREF	UDiv64
	XREF	SMod64
	XREF	UMod64
	XREF	lib_64bit_shl
	XREF	lib_64bit_shr
	XREF	lib_64bit_shrS
	XREF	_eaTable__JASMINE_EA
	XREF	_instTable__JASMINE_OP
	XREF	_sysTable__JASMINE_OP

;// Class member offsets

JASMINE_gpRegs				EQU $0
JASMINE_imReg_0			EQU $100
JASMINE_imReg_1			EQU $108
JASMINE_instPtr			EQU $110
JASMINE_op_0				EQU $114
JASMINE_op_1				EQU $118
JASMINE_op_2				EQU $11C
JASMINE_regStack			EQU $120
JASMINE_stack				EQU $124
JASMINE_methodStack		EQU $128
JASMINE_dataSectPtr		EQU $12C
JASMINE_constSectPtr		EQU $130
JASMINE_exitReg			EQU $134
JASMINE_countReg			EQU $138
JASMINE_machineReg		EQU $13C
JASMINE_stackTrace		EQU $140

JASMINE_RUNNING			EQU 0
JASMINE_END_OF_CODE		EQU 1
JASMINE_USER_BREAK		EQU 2
JASMINE_MATH_DIVBYZERO	EQU 3
JASMINE_STACK_OVERFLOW	EQU 4
JASMINE_STACK_UNDERFLOW	EQU 5
JASMINE_METHD_OVERFLOW	EQU 6
JASMINE_METHD_UNDERFLOW	EQU 7
JASMINE_REGS_OVERFLOW	EQU 8
JASMINE_REGS_UNDERFLOW	EQU 9
JASMINE_ILLEGAL_OPCODE	EQU 10
JASMINE_ILLEGAL_EATYPE	EQU 11

;// EA modes

EA_regDirect				EQU 32
EA_regIndirect				EQU 64
EA_smallLiteral			EQU 224
EA_literalZero				EQU 224

	MACRO OP_DONE
	rts
	ENDM

	MACRO THREAD_BEGIN
	moveq		#0,d5
	moveq		#0,d6
	move.l	JASMINE_instPtr(a2), a4
	move.b	(a4),d6
	move.l	(a6,d6.w*4),a0	
	jmp		(a0)	

	ENDM

	MACRO THREAD_NEXT
	tst.l		JASMINE_exitReg(a2)
	beq.b		NEXT_FETCH\@
	move.l	a4,JASMINE_instPtr(a2)
	rts
	
NEXT_FETCH\@
	move.b	(a4),d6
	move.l	(a6,d6.w*4),a0
	jmp(a0)

	ENDM