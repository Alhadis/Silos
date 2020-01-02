;//****************************************************************************//
;//**                                                                        **//
;//**  File:          Flow.i ($NAME=Flow.i)                                  **//
;//**                                                                        **//
;//**  Description:   Common code expressed as assembler macros              **//
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

	XREF		_SysBase

EXEC_SetSignal	EQU -$132
BREAKSIGNAL		EQU $1000

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO CHECKBREAK
;//
;//  If CTRL_C break checking is required, put this at top of function
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		CHECKBREAK
	move.l	a6,d3
	move.l	#BREAKSIGNAL,d2
	moveq		#0,d0
	move.l	d2,d1
	move.l	_SysBase,a6
	jsr		EXEC_SetSignal(a6)
	move.l	d3,a6
	and.l		d2,d0
	beq.b		NOBREAK\@
	move.l	#JASMINE_USER_BREAK, JASMINE_exitReg(a2)
	rts

NOBREAK\@
	ENDM
	
;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO BR_I x, cc
;//
;//  x = b/w/l
;//  cc = ne, lt, le, eq, ge, gt
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		BR_I
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","b"
	moveq		#1,d7
	ENDC
	IFC		"\1","w"
	moveq		#2,d7
	ENDC
	IFC		"\1","l"
	moveq		#4,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		BR_I_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		BR_I_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		BR_I_OP1_SMALL_LITERAL\@

BR_I_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		BR_I_DONE_OP1\@

BR_I_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		BR_I_DONE_OP1\@

BR_I_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		BR_I_DONE_OP1\@

BR_I_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
BR_I_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		BR_I_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		BR_I_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		BR_I_OP2_SMALL_LITERAL\@

BR_I_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	cmp.\1	(a0),d2
	b\2.b		BR_I_TAKE_BRANCH\@
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_I_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	cmp.\1	d5,d2
	b\2.b		BR_I_TAKE_BRANCH\@
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_I_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	cmp.\1	(a0),d2
	b\2.b		BR_I_TAKE_BRANCH\@
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_I_OP2_REG_DIRECT\@
	IFC		"\1","b"
	cmp.b		JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	cmp.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	cmp.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	b\2.b		BR_I_TAKE_BRANCH\@
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_I_TAKE_BRANCH\@	
	move.l	4(a4),d0
	lea		4(a4,d0.l*4),a4
	move.l	a4,JASMINE_instPtr(a2)
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO BR_F x, cc
;//
;//  x = s/d
;//  cc = ne, lt, le, eq, ge, gt
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		BR_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\d","d"
	moveq		#8,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		BR_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		BR_F_OP1_REG_INDIRECT\@
	cmp.w		#EA_literalZero,d5
	beq		BR_F_OP1_ZERO\@
	
BR_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	(a0),fp0
	bra.b		BR_F_DONE_OP1\@

BR_F_OP1_ZERO\@
	moveq		#0,d0
	fmove.l	d0,fp0
	bra.b		BR_F_DONE_OP1\@

BR_F_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	(a0),fp0
	bra.b		BR_F_DONE_OP1\@

BR_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmove.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
BR_F_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		BR_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		BR_F_OP2_REG_INDIRECT\@
	cmp.w		#EA_literalZero,d5
	beq		BR_F_OP2_ZERO\@
	
BR_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fcmp.\1	(a0),fp1
	fb\2.b	BR_F_TAKE_BRANCH\@	
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_F_OP2_ZERO\@
	fcmp.\1	#$0.0,fp0
	fb\2.b	BR_F_TAKE_BRANCH\@	
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fcmp.\1	(a0),fp1
	fb\2.b	BR_F_TAKE_BRANCH\@	
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	fcmp.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fcmp.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	fb\2.b	BR_F_TAKE_BRANCH\@	
	addq.l	#8,JASMINE_instPtr(a2)
;//	addq		#8,a4
	rts

BR_F_TAKE_BRANCH\@	
	move.l	4(a4),d0
	lea		4(a4,d0.l*4),a4
	move.l	a4,JASMINE_instPtr(a2)
	rts
	ENDM
