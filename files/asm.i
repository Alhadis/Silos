	IFD	__ArgAsm
	opt	L+,D+,O+,S+	; linkable, debuginfo, optimize (?)
	ENDC

	IFD	__M68
	DEBUG	ON,LATTICE4,CODE,DATA
	ENDC

jsrlib	MACRO
	IFND	_LVO\1
	XREF	_LVO\1
	ENDIF
	jsr	_LVO\1(a6)
	ENDM

jmplib	MACRO
	IFND	_LVO\1
	XREF	_LVO\1
	ENDIF
	jmp	_LVO\1(a6)
	ENDM

openlib	MACRO
	moveq.l	#0,d0		;LIBRARY_VERSION,d0
	move.l	#\1name,a1
	IFND	_LVOOpenLibrary
	XREF	_LVOOpenLibrary
	ENDIF
	jsr	_LVOOpenLibrary(a6)
	move.l	d0,\1base
	beq	no_\1
	ENDM

closlib	MACRO
	tst.l	\1base
	beq.s	cLIB\@
	move.l	\1base,a1
	IFND	_LVOCloseLibrary
	XREF	_LVOCloseLibrary
	ENDIF
	jsr	_LVOCloseLibrary(a6)
	clr.l	\1base
cLIB\@
	ENDM

setz	macro
	ori	#$4,ccr
	endm

clrz	macro
	andi	#$fb,ccr
	endm

notz	macro
	eori	#$4,ccr
	endm

clrzn	macro
	andi	#$f3,ccr
	endm

setzn	macro
	ori	#$c,ccr
	endm

setn	macro
	ori	#$8,ccr
	endm

clrn	macro
	andi	#$f7,ccr
	endm

notn	macro
	eori	#$8,ccr
	endm

push	macro	;* push <reg list | all>
	ifc	'\1','all'
	movem.l	d0-d7/a0-a6,-(sp)
	endc
	ifnc	'\1','all'
	movem.l	\1,-(sp)
	endc
	endm

pop	macro	;* pull <reg list | all>
	ifc	'\1','all'
	movem.l	(sp)+,d0-d7/a0-a6
	endc
	ifnc	'\1','all'
	movem.l	(sp)+,\1
	endc
	endm

peek	macro	;* peek <reg list | all>
	ifc	'\1','all'
	movem.l	(sp),d0-d7/a0-a6
	endc
	ifnc	'\1','all'
	movem.l	(sp),\1
	endc
	endm

musvent	MACRO
493673$	btst	#6,$bfe001
	bne.s	493673$
493674$	btst	#6,$bfe001
	beq.s	493674$
	ENDM

vmus	macro
	btst	#6,$bfe001
	endm			; Z = 1 -> Venstre musknapp nede

hmus	macro
	btst	#10,$dff016
	endm			; Z = 1 -> Høyre musknapp nede

true	equ	1
false	equ	0
NULL	equ	0
