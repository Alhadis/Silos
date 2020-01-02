;------------------------------------------------------------------------------
; MACROS
; $VER: macros.i v1.1 (Torsdag, 30. November 1995, kl. 15:09)
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

;--------------------------------------------------------------------

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
WR\@:		cmp.b	#\1,$DFF006			; RasterLine
		bne.s	WR\@
		ENDM

;------------------------------------------------------------------------------

; "SET TAG TO VALUE" -> returns NULL if tag not found, else address of item!!
; SETTAG(TagList,Tag,Value)

SETTAG:		MACRO
		move.l	\1,a0
		move.l	#\2,d0
S1\@:		cmp.l	#TAG_DONE,ti_Tag(a0)
		beq.s	S3\@
		cmp.l	ti_Tag(a0),d0
		beq.s	S2\@
		lea	ti_SIZEOF(a0),a0
		bra.s	S1\@
S3\@:		moveq	#0,d0
		bra.s	S4\@
S2\@:		move.l	\3,ti_Data(a0)
		lea	ti_Data(a0),a0
		move.l	a0,d0
S4\@:	
		ENDM

;------------------------------------------------------------------------------

; "RETURN TAG VALUE" -> returns NULL if tag not found.
; RETTAG(TagList,Tag)

RETTAG:		MACRO
		move.l	\1,a0
		move.l	#\2,d0
R1\@:		cmp.l	#TAG_DONE,ti_Tag(a0)
		beq.s	R3\@
		cmp.l	ti_Tag(a0),d0
		beq.s	R2\@
		lea	ti_SIZEOF(a0),a0
		bra.s	R1\@
R3\@:		moveq	#0,d0
		bra.s	R4\@
R2\@:		move.l	ti_Data(a0),d0
R4\@:
		ENDM

;------------------------------------------------------------------------------
;
; "RETURN TAG VALUE" -> returns 'DefaultVal' if tag not found.
; RETTAG2(TagList,Tag,DefaultVal)

RETTAG2:	MACRO
		move.l	\1,a0
		move.l	#\2,d0
R21\@:		cmp.l	#TAG_DONE,ti_Tag(a0)
		beq.s	R23\@
		cmp.l	ti_Tag(a0),d0
		beq.s	R22\@
		lea	ti_SIZEOF(a0),a0
		bra.s	R21\@
R23\@:		move.l	\3,d0
		bra.s	R24\@
R22\@:		move.l	ti_Data(a0),d0
R24\@:
		ENDM

