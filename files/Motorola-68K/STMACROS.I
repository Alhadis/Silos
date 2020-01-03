;push something onto the stack
PUSHB 	MACRO
	MOVE.B	\1,-(sp)
	ENDM

POPB	MACRO
	MOVE.B	(sp)+,\1
	ENDM

PUSHW	MACRO
	MOVE.W	\1,-(sp)
	ENDM

;pop something from the stack
POPW	MACRO
	MOVE.W	(sp)+,\1
	ENDM

PUSHL	MACRO
	MOVE.L  \1,-(sp)
	ENDM

POPL	MACRO
	MOVE.L	(sp)+,\1
	ENDM

PUSHREG	MACRO
	MOVEM.L	\1,-(sp)
	ENDM

POPREG	MACRO
	MOVEM.L	(sp)+,\1
	ENDM

;Correct the stack after a BIOS/XBIOS/GEMDOS/C function call.
CORRECT	MACRO
	add.l	\1,sp 
	ENDM

XBIOS	MACRO
	PUSHW	\1
	TRAP	#14
	ENDM

PrintString MACRO
			PEA	\1
			GEMDOS	9,6
			ENDM

PrintStringToLocation MACRO
					PEA	\1
					GEMDOS 	9,6
					ENDM

;Reposition the VT-52 cursor. Remember, the top left is (32,32) so add 32 first!
M_CursorPosition	MACRO
					PrintString PositionCursor
					PUSHW	#\1
					GEMDOS	c_conout, 4
					PUSHW	#\2
					GEMDOS	c_conout, 4
					ENDM

;This macro calls a GEMDOS function.
;\1 = function name
;\2 = offset to correct the stack by after returning
GEMDOS	MACRO
	PUSHW   #\1 ;gem function
	trap	#1
	lea		\2(a7),a7 ;correct stack
	ENDM

