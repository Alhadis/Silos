

move_vram_addr	MACRO
	move.l	#((((\1)&$3fff)<<16)+(((\1)>>14)&3))|(1<<30),\2
	ENDM


move_cram_addr	MACRO
	move.l	#((((\1)&$3fff)<<16)+(((\1)>>14)&3))|(3<<30),\2
	ENDM


Z80_stopwait	MACRO
.\@	move.w	#$100,$a11100		; 
	btst	#1,$a11101
	bne.s	.\@
	ENDM

Z80_start		MACRO
	move.w	#$0,$a11100
	ENDM