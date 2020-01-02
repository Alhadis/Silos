;------------------------------------------------------------------------------
; MACROS
; $VER: macros.i v1.0 (Feb-10-1994)
;------------------------------------------------------------------------------

; "CALL EXEC LIBRARY FUNCTION"
; Result = CALLEXEC(LibraryOffset)

CALLEXEC:	MACRO
		move.l	4.w,a6
		jsr	_LVO\1(a6)
		ENDM

EXEC:		MACRO
		move.l	4.w,a6
		jsr	_LVO\1(a6)
		ENDM

;------------------------------------------------------------------------------

; "CALL A LIBRARY FUNCTION"
; Result = CALL(LibraryOffset,LibraryBase)

CALL:		MACRO
		move.l	\2,a6				; LibraryBase
		jsr	_LVO\1(a6)			; LibraryOffset
		ENDM

;------------------------------------------------------------------------------

; "OPEN A LIBRARY"
; LibraryBase = OPENLIB(LibraryNamePointer,LibraryVersion,LibraryBase)

OPENLIB:	MACRO
		lea	\1,a1				; LibraryNamePointer
		move.l	#\2,d0				; LibraryVersion
		CALLEXEC OpenLibrary
		move.l	d0,\3				; LibraryBase
		ENDM

;------------------------------------------------------------------------------

; "CLOSE A LIBRARY"
; CLOSELIB(LibraryBase)

CLOSELIB:	MACRO					; CLOSELIBRARY
		move.l	\1,a1				; LibraryBase
		CALLEXEC CloseLibrary
		ENDM

;------------------------------------------------------------------------------

; "WAIT FOR RASTERLINE"
; WRAST(Line)

WRAST:		MACRO					; WAITRASTER
		cmp.b	#\1,$DFF006			; RasterLine
		bne.s	*-8
		ENDM

;------------------------------------------------------------------------------

; "SET TAG TO VALUE"
; SETTAG(TagList,Tag,Value)

SETTAG:		MACRO
		move.l	\1,a0
		move.l	#\2,d0
.1:		cmp.l	ti_Tag(a0),d0
		beq.s	.2
		lea	ti_SIZEOF(a0),a0
		bra.s	.1
.2:		move.l	\3,ti_Data(a0)
		ENDM

;------------------------------------------------------------------------------

; "RETURN TAG VALUE"
; RETTAG(TagList,Tag)

RETTAG:		MACRO
		move.l	\1,a0
		move.l	#\2,d0
.1:		cmp.l	ti_Tag(a0),d0
		beq.s	.2
		lea	ti_SIZEOF(a0),a0
		bra.s	.1
.2:		move.l	ti_Data(a0),d0
		ENDM

