;//****************************************************************************//
;//**                                                                        **//
;//**  File:          Int32Arith.i ($NAME=Int32Arith.i)                      **//
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

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO ADD_I x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		ADD_I
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
	bmi		ADD_I_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		ADD_I_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		ADD_I_OP1_SMALL_LITERAL\@

ADD_I_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		ADD_I_DONE_OP1\@

ADD_I_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		ADD_I_DONE_OP1\@

ADD_I_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		ADD_I_DONE_OP1\@

ADD_I_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
ADD_I_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		ADD_I_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		ADD_I_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		ADD_I_OP2_SMALL_LITERAL\@

ADD_I_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	add.\1	(a0),d2
	bra.b		ADD_I_DONE_OP2\@

ADD_I_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	add.\1	d5,d2
	bra.b		ADD_I_DONE_OP2\@

ADD_I_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	add.\1	(a0),d2
	bra.b		ADD_I_DONE_OP2\@

ADD_I_OP2_REG_DIRECT\@
	IFC		"\1","b"
	add.b		JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	add.w		JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	add.l		JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
ADD_I_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		ADD_I_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		ADD_I_OP3_REG_INDIRECT\@

ADD_I_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

ADD_I_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
ADD_I_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2,JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2,JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2,JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO SUB_I.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		SUB_I
;//	move.l	JASMINE_instPtr(a2),a4
	IFC	"\1","b"
	moveq		#1,d7
	ENDC
	IFC	"\1","w"
	moveq		#2,d7
	ENDC
	IFC	"\1","l"
	moveq		#4,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SUB_I_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SUB_I_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		SUB_I_OP1_SMALL_LITERAL\@

SUB_I_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		SUB_I_DONE_OP1\@

SUB_I_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		SUB_I_DONE_OP1\@

SUB_I_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		SUB_I_DONE_OP1\@

SUB_I_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

SUB_I_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SUB_I_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SUB_I_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		SUB_I_OP2_SMALL_LITERAL\@

SUB_I_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	sub.\1	(a0),d2
	bra.b		SUB_I_DONE_OP2\@

SUB_I_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	sub.\1	d5,d2
	bra.b		SUB_I_DONE_OP2\@

SUB_I_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	sub.\1	(a0),d2
	bra.b		SUB_I_DONE_OP2\@

SUB_I_OP2_REG_DIRECT\@
	IFC		"\1","b"
	sub.b		JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	sub.w		JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	sub.l		JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

SUB_I_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SUB_I_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SUB_I_OP3_REG_INDIRECT\@

SUB_I_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

SUB_I_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
SUB_I_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2,JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2,JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2,JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO MUL_S.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		MUL_S
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
	bmi.b		MUL_S_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_S_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MUL_S_OP1_SMALL_LITERAL\@

MUL_S_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		MUL_S_DONE_OP1\@

MUL_S_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		MUL_S_DONE_OP1\@

MUL_S_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		MUL_S_DONE_OP1\@

MUL_S_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

MUL_S_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_S_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_S_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MUL_S_OP2_SMALL_LITERAL\@

MUL_S_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		MUL_S_DONE_OP2\@

MUL_S_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		MUL_S_DONE_OP2\@

MUL_S_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		MUL_S_DONE_OP2\@

MUL_S_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

MUL_S_DONE_OP2\@
	IFC		"\1","b"
	ext.w		d2
	ext.w		d3
	muls		d3,d2
	ENDC
	IFC		"\1","w"
	muls		d3,d2
	ENDC
	IFC		"\1","l"
	muls.l	d3,d2
	ENDC
	
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_S_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_S_OP3_REG_INDIRECT\@

MUL_S_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

MUL_S_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
MUL_S_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO DIV_S.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		DIV_S
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
	bmi.b		DIV_S_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_S_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		DIV_S_OP1_SMALL_LITERAL\@

DIV_S_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		DIV_S_DONE_OP1\@

DIV_S_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		DIV_S_DONE_OP1\@

DIV_S_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		DIV_S_DONE_OP1\@

DIV_S_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

DIV_S_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_S_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_S_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		DIV_S_OP1_SMALL_LITERAL\@

DIV_S_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		DIV_S_DONE_OP2\@

DIV_S_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		DIV_S_DONE_OP2\@

DIV_S_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		DIV_S_DONE_OP2\@

DIV_S_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

DIV_S_DONE_OP2\@
	tst.\1	d3
	bne		DIV_S_DENOM_OK\@
	move.l	#JASMINE_MATH_DIVBYZERO,JASMINE_exitReg(a2)
	rts

DIV_S_DENOM_OK\@
	IFC		"\1","b"
	extb.l	d3
	ext.w		d2
	divs		d3,d2
	ENDC
	IFC		"\1","w"
	ext.l		d3
	divs		d3,d2
	ENDC
	IFC		"\1","l"
	divsl.l	d3,d2
	ENDC
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_S_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_S_OP3_REG_INDIRECT\@

DIV_S_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

DIV_S_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

DIV_S_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO MOD_S.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		MOD_S
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
	bmi.b		MOD_S_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_S_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MOD_S_OP1_SMALL_LITERAL\@

MOD_S_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		MOD_S_DONE_OP1\@

MOD_S_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		MOD_S_DONE_OP1\@

MOD_S_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		MOD_S_DONE_OP1\@

MOD_S_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

MOD_S_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_S_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_S_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MOD_S_OP1_SMALL_LITERAL\@

MOD_S_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		MOD_S_DONE_OP2\@

MOD_S_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		MOD_S_DONE_OP2\@

MOD_S_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		MOD_S_DONE_OP2\@

MOD_S_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

MOD_S_DONE_OP2\@
	tst.\1	d3
	bne		MOD_S_DENOM_OK\@
	move.l	#JASMINE_MATH_DIVBYZERO,JASMINE_exitReg(a2)
	rts

MOD_S_DENOM_OK\@
	IFC		"\1","b"
	extb.l	d3
	ext.w		d2
	divs		d3,d2
	swap		d2
	ENDC
	IFC		"\1","w"
	ext.l		d3
	divs		d3,d2
	swap		d2
	ENDC
	IFC		"\1","l"
	divsl.l	d3,d2:d0
	ENDC
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_S_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_S_OP3_REG_INDIRECT\@

MOD_S_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

MOD_S_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

MOD_S_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO MUL_U.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		MUL_U
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
	bmi.b		MUL_U_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_U_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MUL_U_OP1_SMALL_LITERAL\@

MUL_U_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		MUL_U_DONE_OP1\@

MUL_U_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		MUL_U_DONE_OP1\@

MUL_U_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		MUL_U_DONE_OP1\@

MUL_U_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

MUL_U_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_U_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_U_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MUL_U_OP2_SMALL_LITERAL\@

MUL_U_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		MUL_U_DONE_OP2\@

MUL_U_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		MUL_U_DONE_OP2\@

MUL_U_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		MUL_U_DONE_OP2\@

MUL_U_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

MUL_U_DONE_OP2\@
	IFC		"\1","b"
	mulu		d3,d2
	ENDC
	IFC		"\1","w"
	mulu		d3,d2
	ENDC
	IFC		"\1","l"
	mulu.l	d3,d2
	ENDC
	
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_U_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_U_OP3_REG_INDIRECT\@

MUL_U_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

MUL_U_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
MUL_U_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO DIV_U.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		DIV_U
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
	bmi.b		DIV_U_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_U_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		DIV_U_OP1_SMALL_LITERAL\@

DIV_U_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		DIV_U_DONE_OP1\@

DIV_U_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		DIV_U_DONE_OP1\@

DIV_U_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		DIV_U_DONE_OP1\@

DIV_U_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

DIV_U_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_U_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_U_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		DIV_U_OP1_SMALL_LITERAL\@

DIV_U_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		DIV_U_DONE_OP2\@

DIV_U_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		DIV_U_DONE_OP2\@

DIV_U_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		DIV_U_DONE_OP2\@

DIV_U_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

DIV_U_DONE_OP2\@
	tst.\1	d3
	bne		DIV_U_DENOM_OK\@
	move.l	#JASMINE_MATH_DIVBYZERO,JASMINE_exitReg(a2)
	rts

DIV_U_DENOM_OK\@
	IFC		"\1","b"
	divu		d3,d2
	ENDC
	IFC		"\1","w"
	divu		d3,d2
	ENDC
	IFC		"\1","l"
	divul.l	d3,d2
	ENDC
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_U_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_U_OP3_REG_INDIRECT\@

DIV_U_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

DIV_U_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

DIV_U_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO MOD_U.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		MOD_U
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
	bmi.b		MOD_U_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_U_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MOD_U_OP1_SMALL_LITERAL\@

MOD_U_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		MOD_U_DONE_OP1\@

MOD_U_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		MOD_U_DONE_OP1\@

MOD_U_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		MOD_U_DONE_OP1\@

MOD_U_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

MOD_U_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_U_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_U_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		MOD_U_OP1_SMALL_LITERAL\@

MOD_U_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		MOD_U_DONE_OP2\@

MOD_U_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		MOD_U_DONE_OP2\@

MOD_U_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		MOD_U_DONE_OP2\@

MOD_U_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

MOD_U_DONE_OP2\@
	tst.\1	d3
	bne		MOD_U_DENOM_OK\@
	move.l	#JASMINE_MATH_DIVBYZERO,JASMINE_exitReg(a2)
	rts

MOD_U_DENOM_OK\@
	IFC		"\1","b"
	divu		d3,d2
	swap		d2
	ENDC
	IFC		"\1","w"
	divu		d3,d2
	swap		d2
	ENDC
	IFC		"\1","l"
	divul.l	d3,d2:d0
	ENDC
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_U_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_U_OP3_REG_INDIRECT\@

MOD_U_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

MOD_U_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

MOD_U_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM


;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO NEG_I x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		NEG_I
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
	bmi.b		NEG_I_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		NEG_I_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		NEG_I_OP1_SMALL_LITERAL\@	

NEG_I_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		NEG_I_DONE_OP1\@

NEG_I_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		NEG_I_DONE_OP1\@

NEG_I_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		NEG_I_DONE_OP1\@

NEG_I_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

NEG_I_DONE_OP1\@
	neg.\1	d2
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		NEG_I_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		NEG_I_OP2_REG_INDIRECT\@

NEG_I_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts	

NEG_I_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

NEG_I_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO SHX_S.x l/r sizeof(x)
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		SHX_S
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
	bmi.b		SHX_S_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SHX_S_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		SHX_S_OP1_SMALL_LITERAL\@

SHX_S_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		SHX_S_DONE_OP1\@

SHX_S_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		SHX_S_DONE_OP1\@

SHX_S_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		SHX_S_DONE_OP1\@

SHX_S_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

SHX_S_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SHX_S_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SHX_S_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		SHX_S_OP2_SMALL_LITERAL\@

SHX_S_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		SHX_S_DONE_OP2\@

SHX_S_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d3
	bra.b		SHX_S_DONE_OP2\@

SHX_S_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		SHX_S_DONE_OP2\@

SHX_S_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

SHX_S_DONE_OP2\@
	as\2.\1	d3,d2
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SHX_S_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SHX_S_OP3_REG_INDIRECT\@

SHX_S_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

SHX_S_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
SHX_S_OP3_REG_DIRECT\@
	IFC		"\1","b"
	move.b	d2, JASMINE_gpRegs+7(a2,d5.w*8)
	ENDC
	IFC		"\1","w"
	move.w	d2, JASMINE_gpRegs+6(a2,d5.w*8)
	ENDC
	IFC		"\1","l"
	move.l	d2, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	ENDM

