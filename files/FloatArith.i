;//****************************************************************************//
;//**                                                                        **//
;//**  File:          FloatArith.i ($NAME=FloatArith.i)                      **//
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

	XREF	_fmod__r

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO ADD_F.x
;//
;//  x = s/d
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		ADD_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\1","d"
	moveq		#8,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		ADD_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		ADD_F_OP1_REG_INDIRECT\@

ADD_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	(a0),fp0
	bra.b		ADD_F_DONE_OP1\@

ADD_F_OP1_REG_INDIRECT\@
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	(a0),fp0
	bra.b		ADD_F_DONE_OP1\@

ADD_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmove.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
ADD_F_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		ADD_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		ADD_F_OP2_REG_INDIRECT\@

ADD_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fadd.\1	(a0),fp0
	bra.b		ADD_F_DONE_OP2\@

ADD_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fadd.\1	(a0),fp0
	bra.b		ADD_F_DONE_OP2\@

ADD_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	fadd.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fadd.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
ADD_F_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		ADD_F_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		ADD_F_OP3_REG_INDIRECT\@

ADD_F_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

ADD_F_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	
ADD_F_OP3_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	fp0, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	IFC		"\1","d"
	fmove.d	fp0, JASMINE_gpRegs(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO SUB_F.x
;//
;//  x = s/d
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		SUB_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\1","d"
	moveq		#8,d7
	ENDC

	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SUB_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SUB_F_OP1_REG_INDIRECT\@

SUB_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	(a0),fp0
	bra.b		SUB_F_DONE_OP1\@

SUB_F_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	(a0),fp0
	bra.b		SUB_F_DONE_OP1\@

SUB_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmove.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
SUB_F_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SUB_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SUB_F_OP2_REG_INDIRECT\@

SUB_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fsub.\1	(a0),fp0
	bra.b		SUB_F_DONE_OP2\@

SUB_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fsub.\1	(a0),fp0
	bra.b		SUB_F_DONE_OP2\@

SUB_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	fsub.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fsub.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
SUB_F_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SUB_F_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SUB_F_OP3_REG_INDIRECT\@

SUB_F_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

SUB_F_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	
SUB_F_OP3_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	fp0, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	IFC		"\1","d"
	fmove.d	fp0, JASMINE_gpRegs(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	ENDM

;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO MUL_F.x
;//
;//  x = s/d
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		MUL_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\1","d"
	moveq		#8,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_F_OP1_REG_INDIRECT\@

MUL_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	(a0),fp0
	bra.b		MUL_F_DONE_OP1\@

MUL_F_OP1_REG_INDIRECT\@
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	(a0),fp0
	bra.b		MUL_F_DONE_OP1\@

MUL_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmove.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
MUL_F_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_F_OP2_REG_INDIRECT\@

MUL_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmul.\1	(a0),fp0
	bra.b		MUL_F_DONE_OP2\@

MUL_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmul.\1	(a0),fp0
	bra.b		MUL_F_DONE_OP2\@

MUL_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	fmul.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmul.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
MUL_F_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MUL_F_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MUL_F_OP3_REG_INDIRECT\@

MUL_F_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

MUL_F_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	
MUL_F_OP3_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	fp0, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	IFC		"\1","d"
	fmove.d	fp0, JASMINE_gpRegs(a2,d5.w*8),a0
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	ENDM


;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO DIV_F.x
;//
;//  x = s/d
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		DIV_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\1","d"
	moveq		#8,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_F_OP1_REG_INDIRECT\@

DIV_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	(a0),fp0
	bra.b		DIV_F_DONE_OP1\@

DIV_F_OP1_REG_INDIRECT\@
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	(a0),fp0
	bra.b		DIV_F_DONE_OP1\@

DIV_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmove.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
DIV_F_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_F_OP2_REG_INDIRECT\@

DIV_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fdiv.\1	(a0),fp0
	bra.b		DIV_F_DONE_OP2\@

DIV_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fdiv.\1	(a0),fp0
	bra.b		DIV_F_DONE_OP2\@

DIV_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	fdiv.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fdiv.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC
	
DIV_F_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		DIV_F_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		DIV_F_OP3_REG_INDIRECT\@

DIV_F_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

DIV_F_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	
DIV_F_OP3_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	fp0, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	IFC		"\1","d"
	fmove.d	fp0, JASMINE_gpRegs(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	ENDM


;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO MOD_F.x
;//
;//  x = s/d
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		MOD_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\1","d"
	moveq		#8,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_F_OP1_REG_INDIRECT\@

MOD_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	bra.b		MOD_F_DONE_OP1\@

MOD_F_OP1_REG_INDIRECT\@
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	bra.b		MOD_F_DONE_OP1\@

MOD_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	lea		JASMINE_gpRegs+4(a2,d5.w*8),a0
	ENDC
	IFC		"\1","d"
	lea		JASMINE_gpRegs(a2,d5.w*8),a0
	ENDC
	
MOD_F_DONE_OP1\@
	IFC		"\1","d"
	move.l	4(a0),-(a7)
	move.l	(a0), -(a7);// push double on stack
	ENDC
	IFC		"\1","s"
	fmove.s	(a0),fp0
	fmove.d	fp0,-(a7)	;// convert and push stack
	ENDC
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_F_OP2_REG_INDIRECT\@

MOD_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	bra.b		MOD_F_DONE_OP2\@

MOD_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	bra.b		MOD_F_DONE_OP2\@

MOD_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	lea		JASMINE_gpRegs+4(a2,d5.w*8),a0
	ENDC
	IFC		"\1","d"
	lea		JASMINE_gpRegs(a2,d5.w*8),a0
	ENDC
	
MOD_F_DONE_OP2\@
	IFC		"\1","d"
	move.l	4(a0),-(a7)
	move.l	(a0), -(a7);// push double on stack	
	ENDC
	IFC		"\1","s"
	fmove.\1	(a0),fp0
	fmove.d	fp0,-(a7)	;// convert and push
	ENDC
	jsr		_fmod__r		;// double fmod(double,double)
	add.w		#$10,a7		;// restore stack
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		MOD_F_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		MOD_F_OP3_REG_INDIRECT\@

MOD_F_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

MOD_F_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	
MOD_F_OP3_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	fp0, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	IFC		"\1","d"
	fmove.d	fp0, JASMINE_gpRegs(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	ENDM


;//////////////////////////////////////////////////////////////////////////////
;//
;//  MACRO NEG_F.x
;//
;//  x = s/d
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		NEG_F
;//	move.l	JASMINE_instPtr(a2),a4
	IFC		"\1","s"
	moveq		#4,d7
	ENDC
	IFC		"\1","d"
	moveq		#8,d7
	ENDC
	move.b	1(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		NEG_F_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		NEG_F_OP1_REG_INDIRECT\@

NEG_F_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	(a0),fp0
	bra.b		NEG_F_DONE_OP1\@

NEG_F_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	(a0),fp0
	bra.b		NEG_F_DONE_OP1\@

NEG_F_OP1_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	JASMINE_gpRegs+4(a2,d5.w*8),fp0
	ENDC
	IFC		"\1","d"
	fmove.d	JASMINE_gpRegs(a2,d5.w*8),fp0
	ENDC

NEG_F_DONE_OP1\@
	fneg.x	fp0
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		NEG_F_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		NEG_F_OP2_REG_INDIRECT\@

NEG_F_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts	

NEG_F_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	fmove.\1	fp0,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
	rts

NEG_F_OP2_REG_DIRECT\@
	IFC		"\1","s"
	fmove.s	fp0, JASMINE_gpRegs+4(a2,d5.w*8)
	ENDC
	IFC		"\1","d"
	fmove.d	fp0, JASMINE_gpRegs(a2,d5.w*8)
	ENDC
	addq.l	#4,JASMINE_instPtr(a2)
	rts
	ENDM
