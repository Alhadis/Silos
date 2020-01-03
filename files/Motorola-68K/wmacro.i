;-----waitr(a,d0,d1,d2)----
; uses given ar,dr1,dr2,dr3
waitr       MACRO
    IFND DEBUG
    move.w  #$CB,\2             ; $138 PAL, $CB NTSC
    move.l  #$1ff00,\4
    lsl.l   #8,\2
    and.l   \4,\2
    lea     $dff004,\1
.waitr\@:
    move.l  (\1),\3
    and.l   \4,\3
    cmp.l   \3,\2
    bne.s   .waitr\@
    ENDC
    ENDM

;-----waitb()--------------
; FIXME - this seems to hang in some cases?
waitb       MACRO
    IFND DEBUG
    move.w  #$7FFF,_DMACON
    move.w  #DMAF_ALLN,_DMACON
    tst     _DMACONR            ; for compatibility - prime DMACONR
.waitb\@
    btst    #6,_DMACONR
	  bne.s   .waitb\@
    move.w  #$7FFF,_DMACON
    move.w  #DMAF_ALL,_DMACON
    ENDC
    ENDM

;-----waitblit()-----------
; alternate blitter wait?
waitblt     MACRO
    IFND DEBUG
    btst.b  #6,_DMACONR
.waitblt\@
    btst.b  #6,_DMACONR
    bne     .waitblt\@
    ENDC
    ENDM

; library call, uses a6
waitbltr    MACRO
    IFND DEBUG
    move.l  gfxbase,a6
    jsr     -228(a6)
    ENDC
    ENDM

; set SPMODE bit to acknowledge
; data read. registers holds CIA-A base, CIA-B base.
; alternative method just burns 3 cycles.
ppack       MACRO
    bset    #0,CIAPRA(\2) ; set BUSY
.waitp\@:
;   bset    #6,CIACRA(\1)
;   tst.b   CIAPRA(\1)
    btst    #3,CIAPRA(\2) ; wait for SEL
    bne     .waitp\@
    bclr    #0,CIAPRA(\2) ; clear BUSY
    ENDM

; poll FLAG interrupt bit to acknowledge
; read of sent data. registers holds CIA-A base, CIA-B base
; alternative method just burns 3 cycles.
ppwait      MACRO
    bclr    #2,CIAPRA(\2) ; clear SEL
.waitp\@:
;   btst    #4,CIAICR(\1)
;   beq     .waitp\@
;   tst.b   CIAPRA(\2)
    btst    #0,CIAPRA(\2) ; wait for BUSY
    bne     .waitp\@
    bset    #2,CIAPRA(\2) ; set SEL
    ENDM

;-----setblt(a)------------
; uses given ar
; uses/sets bltset variable
setblt      MACRO
    lea     bltset(pc),\1
    btst    #1,(\1)
    beq     .setblt\@
    rts
.setblt\@:
    move.l  #-1,_BLTAFWM        ; set word mask for source a = 1s
    move.w  #$8000,_BLTADAT
    move.w  #$FFFF,_BLTBDAT    
    move.w  #bplwidth,_BLTCMOD 
    move.w  #bplwidth,_BLTDMOD
    move.w  #$F,(\1)
    ENDM

;-----incmod(a,m)----------
; increment given dr modulo
; immediate m (word)
incmod      MACRO
    addq    #1,\1
    cmp.w   #(\2),\1
    blt.b   .nowrap\@
    sub.w   #(\2),\1
.nowrap\@:
    ENDM
decmod      MACRO
    add.w   #(\2-1),\1
    cmp.w   #(\2),\1
    blt.b   .nowrap\@
    sub.w   #(\2),\1
.nowrap\@:
    ENDM
addmod      MACRO
    add.w   #(\2),\1
    cmp.w   #(\3),\1
    blt.b   .nowrap\@
    sub.w   #(\3),\1
.nowrap\@:
    ENDM

;-----setaud(c,a,len,vol,per)--
; set audio chan c params
; uses given ar (a)
setaud      MACRO
    move.w  \3,CUSTOM+aud\1+$04 ; set length
    move.l  \2,CUSTOM+aud\1     ; set pointer
    move.w  \4,CUSTOM+aud\1+$08 ; set volume
    move.w  \5,CUSTOM+aud\1+$06 ; set period
    ENDM

