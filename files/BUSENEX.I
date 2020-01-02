*********************************************************************************
* Bus access macros for Falcon Expansion Port for register base hardware	*
* Version for Martin Hodge's interface hardware for the	Falcon Expansion port   *
* This hardware supports only fast "newer" RTL8019AS controller chip.		*
*										*
*	Copyright 2002 Dr. Thomas Redelberger					*
*	Copyright 2015 Martin Hodge						*
*	Use it under the terms of the GNU General Public License		*
*	(See file COPYING.TXT)							*
*										*
* processor registers are used as follows:					*
*	a5:	will point to EXPANSION at $F10600;	do not change it!	*
*	a6:	will point to EXPANSION at $F10600;	do not change it!	*
*										*
*										*
* Tabsize 8, developed with DEVPAC assembler 2.0.				*
*										*
*********************************************************************************

*
* manifest constants
*

WORD_TRANSFER	EQU	1		; if defined enables 16-bit DMA

*
* hardware addresses
*

rom4		EQU	$00f10600	; EXP base address
rom3		EQU	$00f10600	; EXP base address

*
* macros
*

lockBUS		MACRO
		moveq	#-1,d0			; preset error code
		tas	DVS+lcl_irqlock		; check for race about EXP Port and
		bne	.doNothing		; if somebody owns the bus we quit
		ENDM


lockBUSWait	MACRO
* there should be a timeout based on _hz_200 (and then branch to .doNothing)

.lt1\@		tas	DVS+lcl_irqlock		; check for race about EXP Port and
		beq.b	.lc1\@			; if somebody owns the bus we *wait*

		bsr	_appl_yield		; wait
		bra.b	.lt1\@

.lc1\@						; proceed
		ENDM


unlockBUS	MACRO
		sf	DVS+lcl_irqlock		; let other tasks access EXP Port
		ENDM


unlockBUSWait	MACRO
		sf	DVS+lcl_irqlock		; let other tasks access Cartridge Port
		ENDM

RxBUS		EQUR	d7
RyBUS		EQUR	d6
RcBUS		EQUR	a5
RdBUS		EQUR	a6


ldBUSRegs	MACRO				; for faster access to hardware
		lea	rom3,RcBUS
		lea	rom4,RdBUS
		ENDM


putBUS		MACRO
		move.b	\1,(\2)<<1(RcBUS)
		ENDM


putMore		MACRO
		putBUS \1,\2
		ENDM

putBUSW		MACRO
                move.w	\1,(\2)<<1(RcBUS)
		ENDM


putMoreW	MACRO
                putBUSW \1,\2
		ENDM


putBUSi		MACRO
		putBUS	#\1,\2
		ENDM


getBUS		MACRO
		move.b	(\1)<<1(RdBUS),\2
		ENDM


getMore		MACRO
		getBUS	\1,\2
		ENDM


getBUSW		MACRO
                move.w	(\1)<<1(RdBUS),\2
		ENDM


getMoreW	MACRO
                getBUSW	\1,\2
		ENDM

*
* macro to deselect an interface
*
deselBUS	MACRO
* empty as the EXP port does not need deselecting
		ENDM



******** RAM2NE *****************************************************************
* This is a macro for speed
* put # of bytes in register arg2 to NE from location pointed to by arg1.
*
* in:	arg1	address register source address
*	arg2	data register (w) # of bytes to put; must not be d0!
*
* both registers plus d0 get destroyed.
* Assembler inst. REPT does not work inside a macro, we repeate explicitly

RAM2NE		MACRO
		ext.l	\2			; clear upper word
		ble	.doNothing\@		; nothing to do?
	IFD	WORD_TRANSFER
		move.l	\2,d0
		lsr.l	#1,\2
	ENDC
		bra.b	.Rb1\@

	IFD	WORD_TRANSFER
.Rt1\@		putMoreW (\1)+,NE_DATAPORT
	ELSE
.Rt1\@		putMore (\1)+,NE_DATAPORT
	ENDC
.Rb1\@		dbra	\2,.Rt1\@

	IFD	WORD_TRANSFER
		lsr.l	#1,d0
		bcc.b	.doNothing\@
		putMore	(\1)+,NE_DATAPORT
	ENDC

.doNothing\@
		ENDM



******** NE2RAM *****************************************************************
* This is a macro for speed
* get # of bytes in register arg2 to RAM location pointed to by arg1.
*
* in:	arg1	address register destination address; MUST be even
*	arg2	data register (w) # of bytes to get; must not be d0!
*		MUST be even!
*
* both registers plus d0 get destroyed.
* Assembler inst. REPT does not work inside a macro, we repeate explicitly

NE2RAM		MACRO
		ext.l	\2			; clear upper word
		ble.b	.doNothing\@		; nothing to do?
	IFD	WORD_TRANSFER
		lsr.l	#1,\2
	ENDC
		bra.b	.Nb1\@

	IFD	WORD_TRANSFER
.Nt1\@		getMoreW NE_DATAPORT,(\1)+
	ELSE
.Nt1\@		getMore NE_DATAPORT,(\1)+
	ENDC
.Nb1\@		dbra	\2,.Nt1\@

.doNothing\@
		ENDM



*********************************************************************************

