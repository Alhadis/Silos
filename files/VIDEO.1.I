SetMediumRes:
	PUSHW	#1
	move.l	GFX_BASE,-(sp)
	move.l	GFX_LOGICAL_BASE,-(sp)
	PUSHW	#5
	TRAP	#14
	LEA	$C(sp),sp
	RTS

SetHighRes:
	PUSHW	#2
	move.l	GFX_BASE,-(sp)
	move.l	GFX_LOGICAL_BASE,-(sp)
	PUSHW	#5
	TRAP	#14
	LEA	$C(sp),sp
	RTS

GetPhysicalBase:
	PUSHW	#physbase
	TRAP	#14
	CORRECT	#2

	move.l	d0,a4
	move.l	d0,GFX_BASE
	rts

GetLogicalBase:
	PUSHW	#logbase
	TRAP	#14
	CORRECT	#2

	move.l	d0,GFX_LOGICAL_BASE
	rts
