;//****************************************************************************//
;//**                                                                        **//
;//**  File:          Int32Logic.i ($NAME=Int32Logic.i)                      **//
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
;//  MACRO AND_X x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		AND_X
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
	bmi		AND_X_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		AND_X_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		AND_X_OP1_SMALL_LITERAL\@

AND_X_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		AND_X_DONE_OP1\@

AND_X_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		AND_X_DONE_OP1\@

AND_X_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		AND_X_DONE_OP1\@

AND_X_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
AND_X_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		AND_X_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		AND_X_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		AND_X_OP2_SMALL_LITERAL\@

AND_X_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	and.\1	(a0),d2
	bra.b		AND_X_DONE_OP2\@

AND_X_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	and.\1	d5,d2
	bra.b		AND_X_DONE_OP2\@

AND_X_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	and.\1	(a0),d2
	bra.b		AND_X_DONE_OP2\@

AND_X_OP2_REG_DIRECT\@
	IFC		"\1","b"
	and.b		JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	and.w		JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	and.l		JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
AND_X_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		AND_X_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		AND_X_OP3_REG_INDIRECT\@

AND_X_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

AND_X_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
AND_X_OP3_REG_DIRECT\@
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
;//  MACRO OR_X x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		OR_X
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
	bmi		OR_X_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		OR_X_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		OR_X_OP1_SMALL_LITERAL\@

OR_X_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		OR_X_DONE_OP1\@

OR_X_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.l	d5,d2
	bra.b		OR_X_DONE_OP1\@

OR_X_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		OR_X_DONE_OP1\@

OR_X_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
OR_X_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		OR_X_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		OR_X_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge		OR_X_OP2_SMALL_LITERAL\@

OR_X_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	or.\1		(a0),d2
	bra.b		OR_X_DONE_OP2\@

OR_X_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	or.\1		d5,d2
	bra.b		OR_X_DONE_OP2\@

OR_X_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	or.\1		(a0),d2
	bra.b		OR_X_DONE_OP2\@

OR_X_OP2_REG_DIRECT\@
	IFC		"\1","b"
	or.b		JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	or.w		JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	or.l		JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC
	
OR_X_DONE_OP2\@
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi		OR_X_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi		OR_X_OP3_REG_INDIRECT\@

OR_X_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

OR_X_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
OR_X_OP3_REG_DIRECT\@
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
;//  MACRO XOR_X.x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		XOR_X
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
	bmi.b		XOR_X_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		XOR_X_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		XOR_X_OP1_SMALL_LITERAL\@

XOR_X_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d2
	bra.b		XOR_X_DONE_OP1\@

XOR_X_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.\1	d5,d2
	bra.b		XOR_X_DONE_OP1\@

XOR_X_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	bra.b		XOR_X_DONE_OP1\@

XOR_X_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

XOR_X_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		XOR_X_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		XOR_X_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		XOR_X_OP2_SMALL_LITERAL\@

XOR_X_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		XOR_X_DONE_OP2\@

XOR_X_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.\1	d5,d3
	bra.b		XOR_X_DONE_OP2\@

XOR_X_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		XOR_X_DONE_OP2\@

XOR_X_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

XOR_X_DONE_OP2\@
	eor.\1	d3,d2
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		XOR_X_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		XOR_X_OP3_REG_INDIRECT\@

XOR_X_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

XOR_X_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
XOR_X_OP3_REG_DIRECT\@
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
;//  MACRO NOT_X x
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		NOT_X
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
	bmi.b		NOT_X_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		NOT_X_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		NOT_X_OP1_SMALL_LITERAL\@	

NOT_X_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.l	(a0),d2
	bra.b		NOT_X_DONE_OP1\@

NOT_X_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.\1	d5,d2
	bra.b		NOT_X_DONE_OP1\@

NOT_X_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.l	(a0),d2
	bra.b		NOT_X_DONE_OP1\@

NOT_X_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

NOT_X_DONE_OP1\@
	not.\1	d2
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		NOT_X_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		NOT_X_OP2_REG_INDIRECT\@

NOT_X_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts	

NOT_X_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

NOT_X_OP2_REG_DIRECT\@
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
;//  MACRO SHX_X x l/r
;//
;//  x = b/w/l
;//
;//////////////////////////////////////////////////////////////////////////////

	MACRO		SHX_X
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
	bmi.b		SHX_X_OP1_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SHX_X_OP1_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		SHX_X_OP1_SMALL_LITERAL\@

SHX_X_OP1_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(d0),d2
	bra.b		SHX_X_DONE_OP1\@

SHX_X_OP1_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.\1	d5,d2
	bra.b		SHX_X_DONE_OP1\@

SHX_X_OP1_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d2
	bra.b		SHX_X_DONE_OP1\@

SHX_X_OP1_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d2
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d2
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d2
	ENDC

SHX_X_DONE_OP1\@
	move.b	2(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SHX_X_OP2_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SHX_X_OP2_REG_INDIRECT\@
	cmp.w		#EA_smallLiteral,d5
	bge.b		SHX_X_OP2_SMALL_LITERAL\@

SHX_X_OP2_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	(a0),d3
	bra.b		SHX_X_DONE_OP2\@

SHX_X_OP2_SMALL_LITERAL\@
	and.w		#$1F, d5
	move.\1	d5,d3
	bra.b		SHX_X_DONE_OP2\@

SHX_X_OP2_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	(a0),d3
	bra.b		SHX_X_DONE_OP2\@

SHX_X_OP2_REG_DIRECT\@
	IFC		"\1","b"
	move.b	JASMINE_gpRegs+7(a2,d5.w*8),d3
	ENDC
	IFC		"\1","w"
	move.w	JASMINE_gpRegs+6(a2,d5.w*8),d3
	ENDC
	IFC		"\1","l"
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),d3
	ENDC

SHX_X_DONE_OP2\@
	ls\2.\1	d3,d2
	move.b	3(a4),d5
	cmp.w		#EA_regDirect,d5
	bmi.b		SHX_X_OP3_REG_DIRECT\@
	cmp.w		#EA_regIndirect,d5
	bmi.b		SHX_X_OP3_REG_INDIRECT\@

SHX_X_OP3_EAFUNC\@
	move.l	(a3,d5.w*4),a0
	jsr		(a0)
	move.l	d0,a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts

SHX_X_OP3_REG_INDIRECT\@
	and.w		#$1F, d5
	move.l	JASMINE_gpRegs+4(a2,d5.w*8),a0
	move.\1	d2,(a0)
	addq.l	#4,JASMINE_instPtr(a2)
;//	addq		#4,a4
	rts
	
SHX_X_OP3_REG_DIRECT\@
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

