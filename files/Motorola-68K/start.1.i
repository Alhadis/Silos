    JUMPPTR start
    INCDIR  "git/"
    INCLUDE "wmacro.i"
    INCLUDE "hwdefs.i"

    SECTION main,CODE
    CNOP    0,4
start:
    movem.l d1-d6/a0-a6,-(sp)   ; save system regs
    move.l  4.w,a6              ; get execbase
    sub.l   a4,a4               ; clear a4 (default vbr)
    btst    #0,297(a6)          ; 68000 CPU?
    beq.s   .yes68k
    lea     .GetVBR(pc),a5      ; else fetch vector base address to a4:
    jsr     -30(a6)             ; enter supervisor mode
.yes68k:
    clr.l   d0                  ; start lib calls
    lea     .GfxLib(pc),a1
    jsr     -552(a6)            ; openlibrary
    move.l  d0,a5               ; a5 = gfxbase
    move.l  a5,a6 
    move.l  34(a6),-(sp)        ; save view
    move.w  _INTENAR,-(sp)  
    move.w  _INTREQR,-(sp)
    move.w  _DMACONR,-(sp)      ; save control regs
    move.w  _ADKCONR,-(sp)
    move.l  $68(a4),-(sp)       ; save int lvl2,3,6
    move.l  $6c(a4),-(sp)
    move.l  $78(a4),-(sp) 
    IFND DEBUG
    lea     CIAB,a3             ; a3 = ciab
    move.b  CIAICR(a3),-(sp)
    move.b  CIACRA(a3),-(sp)
    move.b  CIACRB(a3),-(sp)
    move.b  CIATALO(a3),-(sp)
    move.b  CIATAHI(a3),-(sp)
    move.b  CIATBLO(a3),-(sp)
    move.b  CIATBHI(a3),-(sp)
    lea     CIAA,a2             ; a2 = ciaa
    move.b  CIAICR(a2),-(sp)
    move.b  CIACRA(a2),-(sp)
    move.b  CIACRB(a2),-(sp)
    move.b  CIATALO(a2),-(sp)
    move.b  CIATAHI(a2),-(sp)
    move.b  CIATBLO(a2),-(sp)
    move.b  CIATBHI(a2),-(sp)
    move.l  a5,a6               ; load gfxbase
    move.l  #0,a1               ; graceful exit prep
    jsr     -222(a6)            ; LoadView
    jsr     -270(a6)            ; WaitTOF (x2)
    jsr     -270(a6)      
    jsr     -456(a6)            ; OwnBlitter
    jsr     -228(a6)            ; WaitBlit - yes, _after_ own
    move.l  4.w,a6              ; execbase
    jsr     -132(a6)            ; Forbid MT
    ENDC

    IFND DEBUG
    move.w  #$7FFF,_INTENA      ; turn off interrupts
    ENDC
    movem.l a2-a6,-(sp)         ; save system ptrs
    move.w  #15,d6
.getppt
    jsr     AllocMiscResources  ; own ppt
    bne     .ownppt
    dbra    d6,.getppt
    bra     .noppt
.ownppt:
    jsr     main                ; call main routine
    jsr     FreeMiscResources
.noppt:
    movem.l (sp)+,a2-a6         ; restore

    IFND DEBUG
    move.w  #$7FFF,_INTENA      ; turn off interrupts
    move.b  #$7F,CIAICR(a2)     ; clear CIA-A interrupts
    move.b  #$7F,CIAICR(a3)     ; clear CIA-B interrupts
    bclr.b  #0,CIACRB(a3)       ; stop timer b
    ENDC

    IFND DEBUG
    move.b  (sp)+,CIATBHI(a2)   ; restore ciaa
    move.b  (sp)+,CIATBLO(a2)
    move.b  (sp)+,CIATAHI(a2)
    move.b  (sp)+,CIATALO(a2)
    move.b  (sp)+,CIACRB(a2)
    move.b  (sp)+,CIACRA(a2)
    or.b    #$80,(sp)
    move.b  (sp)+,CIAICR(a2)
    move.b  (sp)+,CIATBHI(a3)   ; restore ciab
    move.b  (sp)+,CIATBLO(a3)
    move.b  (sp)+,CIATAHI(a3)
    move.b  (sp)+,CIATALO(a3)
    move.b  (sp)+,CIACRB(a3)
    move.b  (sp)+,CIACRA(a3)
    or.b    #$80,(sp)
    move.b  (sp)+,CIAICR(a3)
    ENDC
    move.l  (sp)+,$78(a4)       ; restore lvl6,3,2
    move.l  (sp)+,$6c(a4)
    move.l  (sp)+,$68(a4)
    move.w  #$7FFF,_ADKCON      ; restore ADK
    or.w    #$8000,(sp)
    move.w  (sp)+,_ADKCON
    move.w  #$7FFF,_DMACON      ; restore DMA
    or.w    #$8000,(sp)
    move.w  (sp)+,_DMACON
    move.w  #$7FFF,_INTREQ      ; restore INTREQ
    move.w  #$7FFF,_INTREQ
    or.w    #$8000,(sp)
    move.w  (sp)+,_INTREQ
    or.w    #$8000,(sp)         ; restore INTENA
    move.w  (sp)+,_INTENA
    move.l  (sp)+,a1            ; pop view
    IFND DEBUG
    move.l  a5,a6               ; get gfxbase
    jsr     -222(a6)            ; LoadView
    jsr     -270(a6)            ; WaitTOF (x2)
    jsr     -228(a6)            ; WaitBlit
    jsr     -462(a6)            ; Disown
    move.l  38(a5),_COP1LCH     ; restore copper
    move.l  50(a5),_COP2LCH     ; restore copper
    ENDC
    move.l  4.w,a6              ; get execbase
    move.l  a5,a1               ; gfx ptr
    jsr     -414(a6)            ; closelibrary
    IFND DEBUG
    jsr     -132(a6)            ; permit MT
    ENDC

.return:
    move.l  d6,d0               ; RC from main
    movem.l (sp)+,d1-d6/a0-a6   ; restore regs
    rts

.GetVBR:
    dc.w    $4e7a,$c801         ; hex for "movec VBR,a4"
    rte                         ; return from Supervisor mode
.GfxLib     dc.b  'graphics.library',0
    CNOP    0,4

AllocMiscResources:
    jsr     OpenMiscResource
    beq     .end
    move.l  #2,d0       ; get parallel port
    move.l  #-1,a1
    jsr     -6(a6)
    move.l  #3,d0       ; get parallel bits
    move.l  #-1,a1
    jsr     -6(a6)
.end:
    rts 
   
FreeMiscResources:
    jsr     OpenMiscResource 
    beq     .done
    move.l  #3,d0
    jsr     -12(a6)
    move.l  #2,d0
    jsr     -12(a6)
.done:
    rts

    ; set Z flag on failure
    ; return in d0,a6, save in MiscRes
OpenMiscResource:
    move.l  4.w,a6
    move.l  .MiscRes(pc),d0
    bne     .omr10
    lea     .MiscName(pc),a1
    jsr     -498(a6)          ; LVOOpenResource
.omr10:
    move.l  d0,a6             ; save in a6
    tst.l   d0
    rts

    CNOP    0,4
.MiscRes    dc.l  0
.MiscName   dc.b  'misc.resource',0

    CNOP    0,4
main:
    ; main code follows
