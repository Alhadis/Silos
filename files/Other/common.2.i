.ifndef COMMON__I__
COMMON__I__ = 1
; load A/X macro
	.macro ldax arg
	.if (.match (.left (1, arg), #))	; immediate mode
	lda #<(.right (.tcount (arg)-1, arg))
	ldx #>(.right (.tcount (arg)-1, arg))
	.else					; assume absolute or zero page
	lda arg
	ldx 1+(arg)
	.endif
	.endmacro

; store A/X macro
	.macro stax arg
	sta arg
	stx 1+(arg)
	.endmacro	


.macro phax
  pha
  txa
  pha
.endmacro

.macro plax
  pla
  tax
  pla
.endmacro


;use C64 Kernel ROM function to read a key
;inputs: none
;outputs: A contains ASCII value of key just pressed
get_key:
  jsr get_key_if_available
  beq get_key
  rts

;use C64 Kernel ROM function to read a key
;inputs: none
;outputs: A contains ASCII value of key just pressed (0 if no key pressed)
get_key_if_available=$f142 ;not officially documented - where F13E (GETIN) falls through to if device # is 0 (KEYBD)

print_a = $ffd2

print:
	sta pptr
	stx pptr + 1
	
@print_loop:
  ldy #0
  lda (pptr),y
	beq @done_print  
	jsr print_a
	inc pptr
	bne @print_loop
  inc pptr+1
  bne @print_loop ;if we ever get to $ffff, we've probably gone far enough ;-)
@done_print:
  rts

.endif


