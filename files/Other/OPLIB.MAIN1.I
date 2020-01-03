;
;----------------------------------
;
 ifdef _F.Zdf
_P.Zdf ldy #32
_zdf1 lda 0,x
 eor #$ff
 and 32,x
 sta 32,x
 inx
 dey
 bne _zdf1
 rts
 endif
;
;-----------------------
;
 ifdef _F.Zem
_P.Zem ldy #32
 lda #0
_zem1 dex
 sta 0,x
 dey
 bne _zem1
 rts
 endif
;
;----------------------
;
 ifdef _F.Zeq
_P.Zeq lda #0
 sta _r0
 ldy #32
_zeq1 lda 32,x
 eor 0,x
 ora _r0
 sta _r0
 inx
 dey
 bne _zeq1
 clc
 txa
 adc #32
 tax
 lda _r0
 beq _zeq2
 jmp _PushFalse
_zeq2 jmp _PushTrue
 endif
;
;---------------------
;
 ifdef _F.Zin
_P.Zin lda 32,x
 lsr
 lsr
 lsr
 sta _r0
 lda 32,x
 and #7
 tay
 lda _bits,y
 sta _r0+1
 clc
 txa
 adc _r0
 tay
 clc
 txa
 adc #34
 tax
 lda 0,y
 and _r0+1
 beq _zin1
 jmp _PushTrue
_zin1 jmp _PushFalse
 endif
;
;---------------------
;
 ifdef _F.Zld
_P.Zld lda 0,x
 sta _r0
 lda 1,x
 sta _r0+1
 inx
 inx
 ldy #31
_zld1 dex
 lda (_r0),y
 sta 0,x
 dey
 bpl _zld1
 rts
 endif
;
;-----------------------
;
 ifdef _F.Zne
_P.Zne jsr _P.Zeq
 jmp _P.Not
 endif
;
;-------------------
;
 ifdef _F.Znt
_P.Znt ldy #32
_znt1 lda 32,x
 and 0,x
 sta 32,x
 inx
 dey
 bne _znt1
 rts
 endif
;
;-------------------
;
 ifdef _F.Zun
_P.Zun ldy #32
_zun1 lda 32,x
 ora 0,x
 sta 32,x
 inx
 dey
 bne _zun1
 rts
 endif
;
;--------------------
;
 ifdef _F.Zsb
_P.Zsb lda #0
 sta _r0
 ldy #32
_zsb1 lda 0,x
 eor #$ff
 and 32,x
 ora _r0
 sta _r0
 inx
 dey
 bne _zsb1
 clc
 txa
 adc #32
 tax
 lda _r0
 beq _zsb2
 jmp _PushFalse
_zsb2 jmp _PushTrue
 endif
;
;--------------------
;
 ifdef _F.Zsg
_P.Zsg lda 0,x
 lsr
 lsr
 lsr
 sta _r0
 lda 0,x
 and #7
 tay
 lda _bits,y
 sta _r0+1
 inx
 inx
 clc
 txa
 adc _r0
 tay
 lda 0,y
 ora _r0+1
 sta 0,y
 rts
 endif
;
;-----------------------
;
 ifdef _F.Zsp
_P.Zsp lda #0
 sta _r0
 ldy #32
_zsp1 lda 32,x
 eor #$ff
 and 0,x
 ora _r0
 sta _r0
 inx
 dey
 bne _zsp1
 clc
 txa
 adc #32
 tax
 lda _r0
 beq _zsp2
 jmp _PushFalse
_zsp2 jmp _PushTrue
 endif
;
;----------------------
;
 ifdef _F.Zsr
_P.Zsr lda 0,x
 sta _r1
 lda 2,x
 sta _r0
 inx
 inx
 inx
 inx
 lda _r1
 cmp _r0
 bcc _zsr2
_zsr1 lda _r0
 lsr
 lsr
 lsr
 sta _r2
 lda _r0
 and #7
 tay
 lda _bits,y
 sta _r2+1
 clc
 txa
 adc _r2
 tay
 lda 0,y
 ora _r2+1
 sta 0,y
 lda _r0
 cmp _r1
 beq _zsr2
 inc _r0
 jmp _zsr1
_zsr2 rts
 endif
;
;---------------------
;
 ifdef _F.Zst
_P.Zst lda 32,x
 sta _r0
 lda 33,x
 sta _r0+1
 ldy #0
_zst1 lda 0,x
 inx
 sta (_r0),y
 iny
 cpy #32
 bne _zst1
 inx
 inx
 rts
 endif
;
;--------------------------------
;
 ifdef _F.New
_P.New sta _Size
 sty _Size+1
 lda #>_First.Free
 sta _Previous
 lda #<_First.Free
 sta _Previous+1
 lda _First.Free
 sta _Pointer
 lda _First.Free+1
 sta _Pointer+1
 clc
 lda _Size
 adc #>4
 sta _Size
 lda _Size+1
 adc #<4
 sta _Size+1
_New1 ldy #0
 lda (_Pointer),y
 bne _New2
 iny
 lda (_Pointer),y
 bne _New2
 clc
 ldy #0
 lda _Size
 adc _Pointer
 sta (_Previous),y
 sta _Temp
 lda _Size+1
 adc _Pointer+1
 iny
 sta (_Previous),y
 sta _Temp+1
 ldy #0
 lda #0
 sta (_Temp),y
 iny
 sta (_Temp),y
 clc
 lda #2
 adc _Temp
 sta _Heap.Top
 lda #0
 adc _Temp+1
 sta _Heap.Top+1
 cmp _Sp+1
 bcc _New10
 beq *+7
_New9 lda #10
 jmp _P.Error
 lda _Sp
 cmp _Heap.Top
 bcc _New9
_New10 ldy #0
 lda _Pointer
 sta (_Pointer),y
 iny
 lda _Pointer+1
 sta (_Pointer),y
 iny
 lda _Size
 sta (_Pointer),y
 iny
 lda _Size+1
 sta (_Pointer),y
_New.Exit lda 0,x
 sta _Temp
 lda 1,x
 sta _Temp+1
 inx
 inx
 ldy #0
 clc
 lda _Pointer
 adc #4
 sta (_Temp),y
 lda _Pointer+1
 adc #0
 iny
 sta (_Temp),y
 rts
_New2 clc
 lda _Size
 adc #4
 sta _Temp
 lda _Size+1
 adc #0
 sta _Temp+1
 ldy #3
 lda (_Pointer),y
 cmp _Temp+1
 bcc _New5
 bne _New3
 ldy #2
 lda (_Pointer),y
 cmp _Temp
 bcc _New5
_New3 clc
 lda _Size
 adc _Pointer
 sta _Temp
 lda _Size+1
 adc _Pointer+1
 sta _Temp+1
 ldy #0
 lda (_Pointer),y
 sta (_Temp),y
 iny
 lda (_Pointer),y
 sta (_Temp),y
 ldy #0
 lda _Temp
 sta (_Previous),y
 iny
 lda _Temp+1
 sta (_Previous),y
 sec
 ldy #2
 lda (_Pointer),y
 sbc _Size
 sta (_Temp),y
 iny
 lda (_Pointer),y
 sbc _Size+1
 sta (_Temp),y
 jmp _New10
_New5 ldy #3
 lda (_Pointer),y
 cmp _Size+1
 bcc _New8
 bne _New6
 ldy #2
 lda (_Pointer),y
 cmp _Size
 bcc _New8
_New6 ldy #0
 lda (_Pointer),y
 sta (_Previous),y
 lda _Pointer
 sta (_Pointer),y
 iny
 lda (_Pointer),y
 sta (_Previous),y
 lda _Pointer+1
 sta (_Pointer),y
 jmp _New.Exit
_New8 lda _Pointer
 sta _Previous
 lda _Pointer+1
 sta _Previous+1
 ldy #0
 lda (_Previous),y
 sta _Pointer
 iny
 lda (_Previous),y
 sta _Pointer+1
 jmp _New1
 endif
;
;-----------------------------------
;
 ifdef _F.Dis
_P.Dis lda #0
 sta _Flag
 lda #>_First.Free
 sta _Previous
 lda #<_First.Free
 sta _Previous+1
 lda 0,X
 sta _Temp
 lda 1,X
 sta _Temp+1
 inx
 inx
 sec
 ldy #0
 lda (_Temp),Y
 sbc #4
 sta _Pointer
 iny
 lda (_Temp),Y
 sbc #0
 sta _Pointer+1
 cmp (_Pointer),Y
 beq *+7
 lda #9
 jmp _P.Error
 dey
 lda _Pointer
 cmp (_Pointer),Y
 beq _Dis1
 lda #9
 jmp _P.Error
_Dis1 ldy #1
 lda _Pointer+1
 cmp (_Previous),Y
 bcc _Dis3
 bne _Dis2
 ldy #0
 lda _Pointer
 cmp (_Previous),Y
 bcc _Dis3
_Dis2 lda #$ff
 sta _Flag
 ldy #0
 lda (_Previous),y
 sta _Temp
 iny
 lda (_Previous),y
 sta _Previous+1
 lda _Temp
 sta _Previous
 jmp _Dis1
_Dis3 ldy #0
 lda (_Previous),y
 sta (_Pointer),y
 iny
 lda (_Previous),y
 sta (_Pointer),y
 ldy #0
 lda _Pointer
 sta (_Previous),y
 iny
 lda _Pointer+1
 sta (_Previous),y
 ldy #2
 clc
 lda _Pointer
 adc (_Pointer),y
 sta _Temp
 iny
 lda _Pointer+1
 adc (_Pointer),y
 ldy #1
 cmp (_Pointer),y
 bne _Dis4
 ldy #0
 lda _Temp
 cmp (_Pointer),y
 bne _Dis4
 ldy #0
 lda (_Pointer),y
 sta _Temp
 iny
 lda (_Pointer),y
 sta _Temp+1
 ldy #0
 lda (_Temp),y
 sta (_Pointer),y
 iny
 lda (_Temp),y
 sta (_Pointer),y
 ldy #0
 lda (_Pointer),y
 iny
 ora (_Pointer),y
 bne _Dis10
 lda _Pointer
 sta _Heap.Top
 lda _Pointer+1
 sta _Heap.Top+1
_Dis10 ldy #2
 clc
 lda (_Pointer),y
 adc (_Temp),y
 sta (_Pointer),y
 iny
 lda (_Pointer),y
 adc (_Temp),y
 sta (_Pointer),y
_Dis4 lda _Flag
 bne _Dis5
_Dis6 rts
_Dis5 ldy #2
 clc
 lda _Previous
 adc (_Previous),y
 sta _Temp
 iny
 lda _Previous+1
 adc (_Previous),y
 sta _Temp+1
 ldy #0
 lda (_Previous),y
 cmp _Temp
 bne _Dis6
 iny
 lda (_Previous),y
 cmp _Temp+1
 bne _Dis6
 ldy #0
 lda (_Pointer),y
 sta (_Previous),y
 iny
 lda (_Pointer),y
 sta (_Previous),y
 ldy #0
 lda (_Previous),y
 iny
 ora (_Previous),y
 bne _Dis11
 lda _Previous
 sta _Heap.Top
 lda _Previous+1
 sta _Heap.Top+1
_Dis11 clc
 ldy #2
 lda (_Pointer),y
 adc (_Previous),y
 sta (_Previous),y
 iny
 lda (_Pointer),y
 adc (_Previous),y
 sta (_Previous),y
 rts
 endif
;
;---------------------------
;
 ifdef _F.Eqs
_F.Cpm Dflag
_P.Eqs jsr _Cpm
 cmp #0
 bne *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;-----------------
;
 ifdef _F.Nes
_F.Cpm Dflag
_P.Nes jsr _Cpm
 cmp #0
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;----------------
;
 ifdef _F.Lts
_F.Cpm Dflag
_P.Lts jsr _Cpm
 cmp #$ff
 bne *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;-----------------
;
 ifdef _F.Ges
_F.Cpm Dflag
_P.Ges jsr _Cpm
 cmp #$ff
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;---------------
;
 ifdef _F.Gts
_F.Cpm Dflag
_P.Gts jsr _Cpm
 cmp #1
 bne *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;---------------
;
 ifdef _F.Les
_F.Cpm Dflag
_P.Les jsr _Cpm
 cmp #1
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;----------------
;
 ifdef _F.Cpm
_Cpm sta _k
 sty _k+1
 lda 0,x
 sta _j
 lda 1,x
 sta _j+1
 lda 2,x
 sta _i
 lda 3,x
 sta _i+1
 inx
 inx
 inx
 inx
 ldy #0
_Cpm1 lda (_i),y
 cmp (_j),y
 bne _Cpm2
 inc _i
 bne *+4
 inc _i+1
 inc _j
 bne *+4
 inc _j+1
 inc _k
 bne _Cpm1
 inc _k+1
 bne _Cpm1
 lda #0
 rts
_Cpm2 bcs _Cmp3
 lda #$ff
 rts
_Cmp3 lda #1
 rts
 endif
;
;--------------------------
;
 ifdef _F.Stm
_P.Stm sta _k
 sty _k+1
 lda 0,x
 sta _j
 lda 1,x
 sta _j+1
 lda 2,x
 sta _i
 lda 3,x
 sta _i+1
 inx
 inx
 inx
 inx
 ldy #0
_Stm1 lda (_j),y
 sta (_i),y
 inc _i
 bne *+4
 inc _i+1
 inc _j
 bne *+4
 inc _j+1
 inc _k
 bne _Stm1
 inc _k+1
 bne _Stm1
 rts
 endif
;
;------------------------
;
 ifdef _F.Ixm
_P.Ixm sta _i
 sty _i+1
_Ixm1 lsr _i+1
 ror _i
 bcc _Ixm2
 clc
 lda 2,x
 adc 0,x
 sta 2,x
 lda 3,x
 adc 1,x
 sta 3,x
_Ixm2 asl 0,x
 rol 1,x
 lda _i
 ora _i+1
 bne _Ixm1
 inx
 inx
 rts
 endif
;
;----------------------------
;
 ifdef _F.Sqi
_P.Sqi dex
 dex
 lda 2,x
 sta 0,x
 lda 3,x
 sta 1,x
 jmp _IMul
 endif
;
;---------------------------
;
 ifdef _F.Sqr
_P.Sqr ldy #8
_Sqr1 dex
 lda 8,x
 sta 0,x
 dey
 bne _Sqr1
 jmp _FMul
 endif
;
;------------------------
;
 ifdef _F.Sqt
_P.Sqt lda 0,x
 bne *+3
 rts
 and #$20
 beq *+7
 lda #6
 jmp _P.Error
 jsr _Pop
 dw _f
 jsr _Push
 dw _f
 jsr _IntXp
 jsr _Popw
 dw _n
 clc
 lda _n
 adc #>1
 sta _n
 lda _n+1
 adc #<1
 sta _n+1
 lda _f
 ora #$10
 sta _f
 lda #1
 sta _f+7
 jsr _Push
 dw _Sqrt7
 jsr _Push
 dw _f
 jsr _FMul
 jsr _Push
 dw _Sqrt8
 jsr _FAdd
 jsr _Pop
 dw _yz
 lda #4
 sta _n1
_Sqrt2 jsr _Push
 dw _f
 jsr _Push
 dw _yz
 jsr _FDiv
 jsr _Push
 dw _yz
 jsr _FAdd
 jsr _Push
 dw _Half
 jsr _FMul
 jsr _Pop
 dw _yz
 dec _n1
 bne _Sqrt2
 lda _n
 and #1
 beq _Sqrt3
 clc
 lda _n
 adc #>1
 sta _n
 lda _n+1
 adc #<1
 sta _n+1
 jsr _Push
 dw _yz
 jsr _Push
 dw _Sqrt9
 jsr _FMul
 jsr _Pop
 dw _yz
_Sqrt3 clc
 lda _n+1
 bpl *+3
 sec
 ror _n+1
 ror _n
 jsr _Push
 dw _yz
 jsr _PushW
 dw _n
 jsr _Adx
 rts
_Sqrt7 db $18,$94,$42,$70,$00,$00,$00,$01
_Sqrt8 db $12,$23,$60,$70,$00,$00,$00,$01
_Sqrt9 db $13,$16,$22,$77,$66,$01,$68,$01
 endif
;
;-----------------------------------
;
 ifdef _F.Rou
_P.Rou jsr _P.Lcr
 db $15,0,0,0,0,0,0,1
 lda 8,x
 and #$20
 ora 0,x
 sta 0,x
 jsr _FAdd
 jmp _P.Fix
 endif
;
;---------------------------------
;
 ifdef _F.Cos
_P.Cos lda #0
 sta _Sgn
 jsr _Pop
 dw _x0
 lda _x0
 and #$df
 sta _x0
 jsr _Push
 dw _x0
 jsr _Push
 dw _HalfPi
 jsr _FAdd
 jsr _Push
 dw _Pi1
 jsr _FMul
 jsr _P.Fix
 jsr _PopW
 dw _n
 jsr _PushW
 dw _n
 jsr _P.Flt
 jsr _Pop
 dw _xn
 lda _n
 and #1
 beq _Cos1
 lda #$20
 sta _Sgn
_Cos1 jsr _Push
 dw _Xn
 jsr _Push
 dw _Half
 jsr _FSub
 jsr _Pop
 dw _Xn
 jmp _Sin2
 endif
;
;---------------------------
;
 ifdef _F.Sin
_P.Sin jsr _Pop
 dw _x0
 lda _x0
 and #$20
 sta _Sgn
 lda _x0
 and #$df
 sta _x0
 jsr _Push
 dw _x0
 jsr _Push
 dw _pi1
 jsr _Fmul
 jsr _TruncE
 jsr _Pop
 dw _Xn
 jsr _Push
 dw _xn
 jsr _P.Fix
 lda 0,x
 and #1
 beq _Sin1
 lda _Sgn
 eor #$20
 sta _Sgn
_Sin1 inx
 inx
_Sin2 jsr _Push
 dw _x0
 jsr _TruncE
 jsr _Pop
 dw _x1
 jsr _Push
 dw _x0
 jsr _Push
 dw _x1
 jsr _FSub
 jsr _Pop
 dw _x2
 jsr _Push
 dw _x1
 jsr _Push
 dw _xn
 jsr _Push
 dw _c1
 jsr _FMul
 jsr _FSub
 jsr _Push
 dw _x2
 jsr _FAdd
 jsr _Push
 dw _xn
 jsr _Push
 dw _c2
 jsr _FMul
 jsr _FSub
 jsr _Pop
 dw _f
 jsr _Push
 dw _f
 jsr _Push
 dw _f
 jsr _FMul
 jsr _Pop
 dw _g
 jsr _Push
 dw _r7
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _r6
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _r5
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _r4
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _r3.
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _r2.
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _r1.
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _f
 jsr _FMul
 jsr _Push
 dw _f
 jsr _FAdd
 lda 0,x
 eor _Sgn
 sta 0,x
 rts
;
_Pi1 db $13,$18,$30,$98,$86,$18,$38,$01
_c1  db $03,$14,$00,$00,$00,$00,$00,$00
_c2  db $11,$59,$26,$53,$58,$97,$93,$03
_r1. db $31,$66,$66,$66,$66,$66,$66,$01
_r2. db $18,$33,$33,$33,$33,$32,$76,$03 
_r3. db $31,$98,$41,$26,$98,$23,$22,$04 
_r4  db $12,$75,$57,$31,$64,$21,$29,$06
_r5  db $32,$50,$51,$87,$08,$83,$47,$08
_r6  db $11,$60,$47,$84,$46,$32,$38,$10
_r7  db $37,$37,$06,$62,$77,$50,$71,$13
 endif
;
;-----------------------------
;
 ifdef _F.Arctan
_P.Arctan Jsr _Pop
 dw _f
 lda _f
 and #$20
 sta _Sgn
 lda _f
 and #$df
 sta _f
;
 lda #0
 sta _n
 jsr _Push
 dw _f
 jsr _Push
 dw _One
 jsr _P.Gtr
 inx
 inx
 lda $fe,x
 beq _Arc1
 jsr _Push
 dw _One
 jsr _Push
 dw _f
 jsr _FDiv
 jsr _Pop
 dw _f
 lda #2
 sta _n
;
_Arc1 jsr _Push
 dw _f
 jsr _Push
 dw _Cons1
 jsr _P.Gtr
 inx
 inx
 lda $fe,x
 beq _Arc2
 jsr _Push
 dw _Cons2
 jsr _Push
 dw _f
 jsr _FMul
 jsr _Push
 dw _Half
 jsr _FSub
 jsr _Push
 dw _Half
 jsr _FSub
 jsr _Push
 dw _f
 jsr _FAdd
 jsr _Push
 dw _Atn10
 jsr _Push
 dw _f
 jsr _FAdd
 jsr _FDiv
 jsr _Pop
 dw _f
 inc _n
;
_Arc2 jsr _Push
 dw _f
 jsr _Push
 dw _f
 jsr _FMul
 jsr _Pop
 dw _g
 jsr _Push
 dw _P2
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _P1
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _P0
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _g
 jsr _Push
 dw _q2
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _q1
 jsr _FAdd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Push
 dw _q0
 jsr _FAdd
 jsr _FDiv
 jsr _Push
 dw _f
 jsr _FMul
 jsr _Push
 dw _f
 jsr _Fadd
 lda _n
 cmp #2
 bcc _Arc3
 lda 0,x
 eor #$20
 sta 0,x
_Arc3 lda _n
 cmp #0
 bne _Arc4
 jsr _Push
 dw _a0
_Arc4 lda _n
 cmp #1
 bne _Arc5
 jsr _Push
 dw _a1
_Arc5 lda _n
 cmp #2
 bne _Arc6
 jsr _Push
 dw _a2
_Arc6 lda _n
 cmp #3
 bne _Arc7
 jsr _Push
 dw _a3
_Arc7 jsr _FAdd
 lda 0,x
 eor _Sgn
 sta 0,x
 rts
;
_Cons1  db $12,$67,$94,$91,$92,$43,$11,$01
_Cons2  db $17,$32,$05,$08,$07,$56,$89,$01 
_Atn10  db $01,$73,$20,$50,$80,$75,$69,$00
_p0     db $24,$27,$43,$26,$72,$02,$62,$00
_p1     db $24,$27,$44,$49,$85,$36,$79,$00
_p2     db $37,$94,$39,$12,$95,$40,$83,$01
_q0     db $01,$28,$22,$98,$01,$60,$79,$01
_q1     db $02,$05,$17,$13,$76,$56,$42,$01
_q2     db $09,$19,$78,$93,$64,$83,$50,$00
_a0     db $00,$00,$00,$00,$00,$00,$00,$00
_a1     db $15,$23,$59,$87,$75,$59,$83,$01
_a2     db $01,$57,$07,$96,$32,$67,$95,$00
_a3     db $01,$04,$71,$97,$55,$11,$97,$00
 endif
;
;----------------------------------
;
 ifdef _F.Ln
_P.Ln lda 0,x
 beq _ln1
 and #$20
 beq _ln2
_ln1 lda #6
 jmp _P.Error
_ln2 jsr _Pop
 dw _f
 jsr _Push
 dw _f
 jsr _IntXp
 jsr _PopW
 dw _n
 clc
 lda _n
 adc #>1
 sta _n
 lda _n+1
 adc #<1
 sta _n+1
 lda _f
 ora #$10
 sta _f
 lda #1
 sta _f+7
 jsr _Push
 dw _f
 jsr _Push
 dw _Lnc0
 jsr _P.Gtr
 inx
 inx
 lda $fe,x
 bne _ln3
 lda _f
 and #15
 sta _f
 lda #0
 sta _f+7
 sec
 lda _n
 sbc #>1
 sta _n
 lda _n+1
 sbc #<1
 sta _n+1
_ln3 jsr _Push
 dw _f
 jsr _Push
 dw _Half
 jsr _FSub
 jsr _Push
 dw _Half
 jsr _FSub
 jsr _Push
 dw _f
 jsr _Push
 dw _Lnc1
 jsr _FAdd
 jsr _FDiv
 jsr _Pop
 dw _s
 jsr _Push
 dw _s
 jsr _Push
 dw _s
 jsr _FMul
 jsr _Pop
 dw _w
 jsr _Push
 dw _Lna3
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lna2
 jsr _FAdd
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lna1
 jsr _FAdd
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lna0
 jsr _FAdd
 jsr _Push
 dw _w
 jsr _Push
 dw _Lnb3
 jsr _FAdd
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lnb2
 jsr _FAdd
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lnb1
 jsr _FAdd
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lnb0
 jsr _FAdd
 jsr _FDiv
 jsr _Push
 dw _w
 jsr _FMul
 jsr _Push
 dw _Lnc
 jsr _FAdd
 jsr _Push
 dw _s
 jsr _FMul
 jsr _PushW
 dw _n
_Ln4 jsr _P.Flt
 jsr _FAdd
 jsr _Push
 dw _Lnc3
 jsr _FMul
 rts
_Lnc0 db $13,$16,$22,$77,$66,$01,$68,$01
_Lnc  db $18,$68,$58,$89,$63,$80,$65,$01
_Lnc3 db $02,$30,$25,$85,$09,$29,$94,$00
_Lna0 db $08,$51,$67,$31,$98,$72,$38,$00
_Lna1 db $21,$36,$82,$37,$02,$41,$50,$01
_Lna2 db $06,$25,$03,$65,$11,$27,$90,$00
_Lna3 db $37,$14,$33,$38,$21,$53,$22,$01
_Lnb0 db $02,$94,$15,$75,$01,$72,$32,$01
_Lnb1 db $26,$49,$06,$68,$27,$40,$94,$01
_Lnb2 db $04,$79,$25,$25,$60,$43,$87,$01 
_Lnb3 db $21,$32,$10,$47,$83,$50,$15,$01
_Lnc1 db $01,$00,$00,$00,$00,$00,$00,$00
 endif
;
;-------------------------------
;
 ifdef _F.Exp
_P.Exp jsr _Pop
 dw _Expx
 jsr _Push
 dw _Expx
 lda 0,x
 and #$1f
 sta 0,x
 jsr _Push
 dw _Exp.Max
 jsr _P.Gtr
 inx
 inx
 lda $fe,x
 beq _Exp1
 lda #6
 jmp _P.Error
_Exp1 jsr _Push
 dw _Expx
 lda 0,x
 and #$1f
 sta 0,x
 jsr _Push
 dw _Exp.Eps
 jsr _P.Ler
 inx
 inx
 lda $fe,x
 beq _Exp2
 jsr _Push
 dw _One
 rts
_Exp2 jsr _Push
 dw _Expx
 jsr _Push
 dw _Expc
 jsr _FMul
 jsr _P.Fix
 jsr _PopW
 dw _n
 jsr _PushW
 dw _n
 jsr _P.Flt
 jsr _Pop
 dw _xn
 jsr _Push
 dw _expx
 jsr _P.Fix
 jsr _P.Flt
 jsr _Pop
 dw _x1
 jsr _Push
 dw _Expx
 jsr _Push
 dw _x1
 jsr _FSub
 jsr _Pop
 dw _x2
 jsr _Push
 dw _x1
 jsr _Push
 dw _xn
 jsr _Push
 dw _Expc1
 jsr _FMul
 jsr _FSub
 jsr _Push
 dw _x2
 jsr _FAdd
 jsr _Push
 dw _xn
 jsr _Push
 dw _Expc2
 jsr _FMul
 jsr _FSub
 jsr _Pop
 dw _g
 jsr _Push
 dw _g
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Pop
 dw _z
 jsr _Push
 dw _Expp2
 jsr _Push
 dw _z
 jsr _FMul
 jsr _Push
 dw _Expp1
 jsr _FAdd
 jsr _Push
 dw _z
 jsr _FMul
 jsr _Push
 dw _Expp0
 jsr _Fadd
 jsr _Push
 dw _g
 jsr _FMul
 jsr _Pop
 dw _Expp
 jsr _Push
 dw _z
 jsr _Push
 dw _Expq1
 jsr _FAdd
 jsr _Push
 dw _z
 jsr _Fmul
 jsr _Push
 dw _Expq0
 jsr _FAdd
 jsr _Pop
 dw _Expq
 jsr _Push
 dw _Expp
 jsr _Push
 dw _Expq
 jsr _Push
 dw _Expp
 jsr _FSub
 jsr _FDiv
 jsr _Push
 dw _Half
 jsr _FAdd
 jsr _Pop
 dw _r
 jsr _Push
 dw _r
 jsr _Push
 dw _r
 jsr _FAdd
 jsr _Pop
 dw _r
 jsr _Push
 dw _r
 lda _n
 and #1
 beq _Exp4
 jsr _Push
 dw _Expc3
 lda _n+1
 bmi _Exp3
 jsr _FMul
 jmp _Exp4
_Exp3 jsr _FDiv
_Exp4 jsr _PushW
 dw _n
 jsr _PushW
 dw _Expi2
 jsr _IDiv
 jsr _Adx
 rts
_Exp.Max db $02,$00,$00,$00,$00,$00,$00,$02
_Exp.eps db $15,$00,$00,$00,$00,$00,$00,$14
_Expc    db $18,$68,$58,$89,$63,$80,$65,$01
_Expc1   db $01,$15,$10,$00,$00,$00,$00,$00
_Expc2   db $12,$92,$54,$64,$97,$02,$28,$04
_Expp0   db $05,$04,$46,$48,$89,$50,$58,$02
_Expp1   db $01,$40,$08,$29,$97,$56,$28,$01
_Expp2   db $13,$32,$87,$36,$46,$51,$64,$02
_Expq0   db $01,$00,$89,$29,$77,$90,$11,$03
_Expq1   db $01,$12,$09,$40,$81,$09,$66,$02
_Expc3   db $03,$16,$22,$77,$66,$01,$68,$00
_ExpI2   dw 2
 endif
;
;-----------------------------------------
;
 ifdef _F.Ldr
_P.Ldr lda 0,x
 sta _r0
 lda 1,x
 sta _r0+1
 inx
 inx
 ldy #7
_Ldr1 dex
 lda (_r0),y
 sta 0,x
 dey
 bpl _Ldr1
 rts
 endif
;
;----------------------
;
 ifdef _F.Str
_P.Str lda 8,x
 sta _r0
 lda 9,x
 sta _r0+1
 ldy #0
_Str1 lda 0,x
 inx
 sta (_r0),y
 iny
 cpy #8
 bne _Str1
 inx
 inx
 rts
 endif
;
;--------------------
;
 ifdef _F.Lcr
_P.Lcr clc
 pla
 sta _r0
 adc #>8
 tay
 pla
 sta _r0+1
 adc #<8
 pha
 tya
 pha
 ldy #8
_Lcr1 dex
 lda (_r0),y
 sta 0,x
 dey
 bne _Lcr1
 rts
 endif
;
;---------------------
;
 ifdef _F.Ngr
_P.Ngr lda 0,x
 eor #$20
 sta 0,x
 rts
 endif
;
;---------------------
;
 ifdef _F.Adr
_Float Dflag
_P.Adr
_FAdd jsr _UnCork
 lda #1
 jsr _Fpp
 jsr _Cork
 rts
 endif
;
;-----------------------
;
 IFDef _F.Sbr
_Float Dflag
_P.Sbr
_FSub jsr _UnCork
 lda #2
 jsr _Fpp
 jsr _Cork
 rts
 endif
;
;------------------------
;
 ifdef _F.Mpr
_Float Dflag
_P.Mpr
_FMul jsr _UnCork
 lda #3
 jsr _Fpp
 jsr _Cork
 rts
 endif
;
;--------------------------
;
 ifdef _F.Dvr
_Float Dflag
_P.Dvr
_FDiv jsr _UnCork
 lda #4
 jsr _Fpp
 jsr _Cork
 rts
 endif
;
;---------------------------
;
 ifdef _Float
_Fpp sta _Work
 lda _p
 cmp #$99
 beq _Fpp2
 lda _q
 cmp #$99
 bne *+5
 jmp _Ferr
 php
 sed
 jsr _FdCod
 lda _Work
 jsr _FFunc
 jsr _FNorm
 lda _p
 beq _Fpp1
 jsr _FnCod
_Fpp1 plp
_Fpp2 rts
;
;
;
_FFunc cmp #1
 bne *+5
 jmp _GAdd
 cmp #2
 bne *+5
 jmp _GSub
 cmp #3
 bne *+5
 jmp _GMul
 cmp #4
 bne *+5
 jmp _GDiv
 rts
;
;
;
_GSub lda _q+9
 eor #$20
 sta _q+9
;
;
;
_GAdd lda _q
 beq _GAdd0
 lda _p
 bne *+5
 jmp _FSwap
 sec
 lda _q+7
 sbc _p+7
 lda _q+8
 sbc _p+8
 bpl *+5
 jsr _FSwap
 sec
 lda _q+7
 sbc _p+7
 sta _Work
 lda _q+8
 sbc _p+8
 sta _Work+1
 lda _Work
 ora _Work+1
 beq _GAdd2
 sec
 lda _Work
 sbc #$13
 lda _Work+1
 sbc #0
 bcc _GAdd1
 jsr _FSwap
_GAdd0 rts
_GAdd1 jsr _FSrd
 sec
 lda _Work
 sbc #1
 sta _Work
 bne _GAdd1
 jsr _FSwap
_GAdd2 lda _p+9
 cmp _q+9
 bne *+5
 jmp _GAddm
 jsr _GSubM
 bcs _GAdd4
 sec
 ldx #6
_GAdd3 lda #0
 sbc _p,x
 sta _p,x
 dex
 bpl _GAdd3
 lda _p+9
 eor #$20
 sta _p+9
_GAdd4 rts
;
;
;
_GMul clc
 lda _p+7
 adc _q+7
 sta _p+7
 lda _p+8
 adc _q+8
 sta _p+8
 lda _p+9
 eor _q+9
 sta _p+9
 ldx #6
_GMul1 lda _p,x
 sta _Work,x
 lda #0
 sta _p,x
 dex
 bpl _GMul1
 ldx #6
 stx _Work+7
_GMul2 ldx _Work+7
 lda _Work,x
 and #15
 jsr _GMul3
 ldx _Work+7
 lda _Work,x
 lsr
 lsr
 lsr
 lsr
 jsr _GMul3
 dec _Work+7
 bne _GMul2
 lda _Work
 jsr _GMul3
 rts
_GMul3 jsr _FSrd
 tay
 beq _GMul5
_GMul4 jsr _GAddm
 dey
 bne _GMul4
_GMul5 rts
;
;
;
_GDiv lda _q
 bne *+5
 jmp _FErr
 clc
 lda _p+7
 sbc _q+7
 sta _p+7
 lda _p+8
 sbc _q+8
 sta _p+8
 lda _p+9
 eor _q+9
 sta _p+9
 ldx #0
_GDiv1 stx _Work+7
 jsr _GDiv3
 asl
 asl
 asl
 asl
 ldx _Work+7
 sta _Work,x
 jsr _GDiv3
 ldx _Work+7
 ora _Work,x
 sta _Work,x
 inx
 cpx #7
 bne _GDiv1
 ldx #6
_GDiv2 lda _Work,x
 sta _p,x
 dex
 bpl _GDiv2
 rts
_GDiv3 ldy #$ff
_GDiv4 iny
 jsr _GSubM
 bcs _GDiv4
 jsr _GAddm
 tya
 jsr _FSld
 rts
;
;
;
_GAddM clc
 lda _p+6
 adc _q+6
 sta _p+6
 lda _p+5
 adc _q+5
 sta _p+5
 lda _p+4
 adc _q+4
 sta _p+4
 lda _p+3
 adc _q+3
 sta _p+3
 lda _p+2
 adc _q+2
 sta _p+2
 lda _p+1
 adc _q+1
 sta _p+1
 lda _p
 adc _q
 sta _p
 rts
;
;
_GSubM sec
 lda _p+6
 sbc _q+6
 sta _p+6
 lda _p+5
 sbc _q+5
 sta _p+5
 lda _p+4
 sbc _q+4
 sta _p+4
 lda _p+3
 sbc _q+3
 sta _p+3
 lda _p+2
 sbc _q+2
 sta _p+2
 lda _p+1
 sbc _q+1
 sta _p+1
 lda _p
 sbc _q
 sta _p
 rts
;
;
;
_FSld asl _p+6
 rol _p+5
 rol _p+4
 rol _p+3
 rol _p+2
 rol _p+1
 rol _p
 asl _p+6
 rol _p+5
 rol _p+4
 rol _p+3
 rol _p+2
 rol _p+1
 rol _p
 asl _p+6
 rol _p+5
 rol _p+4
 rol _p+3
 rol _p+2
 rol _p+1
 rol _p
 asl _p+6
 rol _p+5
 rol _p+4
 rol _p+3
 rol _p+2
 rol _p+1
 rol _p
 rts
;
;
;
_FSrd lsr _p
 ror _p+1
 ror _p+2
 ror _p+3
 ror _p+4
 ror _p+5
 ror _p+6
 lsr _p
 ror _p+1
 ror _p+2
 ror _p+3
 ror _p+4
 ror _p+5
 ror _p+6
 lsr _p
 ror _p+1
 ror _p+2
 ror _p+3
 ror _p+4
 ror _p+5
 ror _p+6
 lsr _p
 ror _p+1
 ror _p+2
 ror _p+3
 ror _p+4
 ror _p+5
 ror _p+6
 rts 
;
;
;
_FSwap ldx #9
_FSwp1 lda _p,x
 tay
 lda _q,x
 sta _p,x
 tya
 sta _q,x
 dex
 bpl _FSwp1
 rts
;
;
;
_FErr lda #6
 jmp _P.Error
;
;
;
_FNorm lda _p
 beq _FNor2
 and #$f0
 beq _FNor1
 jsr _FSrd
 clc
 lda _p+7
 adc #1
 sta _p+7
 lda _p+8
 adc #0
 sta _p+8
_FNor1 rts
_FNor2 ldx #6
_FNor3 ora _p,x
 dex
 bne _FNor3
 cmp #0
 bne _FNor4
 sta _p+7
 rts
_FNor4 jsr _FSld
 sec
 lda _p+7
 sbc #1
 sta _p+7
 lda _p+8
 sbc #0
 sta _p+8
 lda _p
 beq _FNor4
 rts
;
;
;
_FnCod sec
 lda _p+7
 sbc #0
 lda _p+8
 sbc #1
 bcc _Fnc02
 sec
 lda _p+7
 sbc #1
 lda _p+8
 sbc #$99
 bcs _Fnc01
 jmp _FErr
_Fnc01 sec
 lda #0
 sbc _p+7
 sta _p+7
 lda _p
 ora #$10
 sta _p
_Fnc02 lda _p
 ora _p+9
 sta _p
 rts
;
;
;
_FdCod lda _p
 and #$20
 sta _p+9
 lda #0
 sta _p+8
 lda _p
 and #$10
 beq _Fdc01
 lda #$99
 sta _p+8
 sec
 lda #0
 sbc _p+7
 sta _p+7
_FdC01 lda _p
 and #15
 sta _p
 lda _q
 and #$20
 sta _q+9
 lda #0
 sta _q+8
 lda _q
 and #$10
 beq _FdC02
 lda #$99
 sta _q+8
 sec
 lda #0
 sbc _q+7
 sta _q+7
_FdC02 lda _q
 and #15
 sta _q
 rts
 endif
;
;------------------------
;
 ifdef _F.UnCork
_UnCork ldy #0
_UnCo1 lda 0,x
 inx
 sta _q,y
 iny
 cpy #8
 bne _UnCo1
 ldy #0
_UnCo2 lda 0,x
 inx
 sta _p,y
 iny
 cpy #8
 bne _UnCo2
 stx _Savex
 rts
 endif
;
;-----------------------
;
 ifdef _F.Cork
_Cork ldx _SaveX
 ldy #7
_Cork1 dex
 lda _p,y
 sta 0,x
 dey
 bpl _Cork1
 rts
 endif
;
;
;----------------------------------------
;
;
 ifdef _F.Eqr
_F.Cpr Dflag
_P.Eqr jsr _Cpr
 cmp #0
 bne *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;--------------------
;
 ifdef _F.Ner
_F.Cpr Dflag
_P.Ner jsr _Cpr
 cmp #0
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;-------------------
;
 ifdef _F.Ltr
_F.Cpr Dflag
_P.Ltr jsr _Cpr
 cmp #$ff
 bne *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;-------------------
;
 ifdef _F.Gtr
_F.Cpr Dflag
_P.Gtr jsr _Cpr
 cmp #1
 bne *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;------------------
;
 ifdef _F.Ler
_F.Cpr Dflag
_P.Ler jsr _Cpr
 cmp #1
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;-----------------
;
 ifdef _F.Ger
_F.Cpr Dflag
_P.Ger jsr _Cpr
 cmp #$ff
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;-----------------
;
 ifdef _F.Cpr
_Cpr lda 8,x
 eor 0,x
 and #$20
 beq _Cpr2
 clc
 txa
 adc #16
 tax
 lda $f8,x
 and #$20
 bne _Cpr1
 lda #1
 rts
_Cpr1 lda #$ff
 rts
_Cpr2 jsr _P.Sbr
 clc
 txa
 adc #8
 tax
 lda $f8,x
 bne *+3
 rts
 and #$20
 bne _Cpr3
 lda #1
 rts
_Cpr3 lda #$ff
 rts
 endif
;
;--------------------------
;
 ifdef _F.Rdr
_P.Rdr lda 0,x
 sta _i
 lda 1,x
 sta _i+1
 inx
 inx
 stx _Rdrx
 jsr _Rdr99
 ldx _Rdrx
 rts
_Rdr99 lda #0
 ldy #7
_Rdr1 sta (_i),y
 dey
 bpl _Rdr1
 lda #0
 ldy #14 
_Rdr9 sta _p-1,y
 dey
 bne _Rdr9
_Rdr8 jsr _EofA
 beq *+7
 lda #8
 jmp _P.Error
 ldy #0
 lda (_bufadr),y
 cmp #32
 bne _rdr7
 jsr _get1
 jmp _rdr8
_rdr7 sta _p+9
 ldx #6 
 cmp #32
 bne *+4
 ldx #0
 cmp #'.
 bne *+4
 ldx #2
 cmp #'e
 bne *+4
 ldx #3
 cmp #'+
 bne *+4
 ldx #4
 cmp #'-
 bne *+4
 ldx #4 
 cmp #13
 bne *+4
 ldx #5 
 cmp #'0
 bcc *+8 
 cmp #'9+1
 bcs *+4
 ldx #1
 txa 
_rdr6 asl _p+8 
 asl _p+8 
 asl _p+8 
 ora _p+8 
 tax
 lda _rdr3,x
 sta _p+8 
 asl
 tax
 lda _rdr4,x
 sta _j
 lda _rdr4+1,x
 sta _j+1
 jmp (_j)
_rdr2 ldx _rdrx
 jsr _get1
 jsr _eofa
 beq *+7
 lda #0
 jmp _rdr6
 ldy #0
 lda (_bufadr),y
 jmp _rdr7
_rdr3 db 0,2,7,8,1,9,8,0
 db 8,2,7,8,8,8,8,0
 db 9,2,7,4,8,9,8,0
 db 9,3,8,4,8,9,8,0
 db 8,6,8,8,5,8,8,0
 db 8,6,8,8,8,8,8,0
 db 9,6,8,8,8,9,8,0
 db 9,3,8,4,8,9,8,0
_rdr4 dw _rdr10
 dw _rdr11 
 dw _rdr12 
 dw _rdr13 
 dw _rdr14 
 dw _rdr15 
 dw _rdr16 
 dw _rdr10
 dw _rdr18
 dw _rdr17
_rdr10  jmp _rdr2
_rdr11 lda _p+9 
 sta _p+10
 jmp _rdr2
_rdr12 lda #0
 ldx #7
_rda12 ora _p-1,x
 dex
 bne _rda12
 cmp #0
 beq _rdb12
 inc _p+12
_rdb12 lda _p
 bne _rdd12
 jsr _rdr20
 lda _p+9
 and #15
 ora _p+6
 sta _p+6
_rdd12 jmp _rdr2
_rdr13 lda #0
 ldx #7
_rda13 ora _p-1,x
 dex
 bne _rda13
 cmp #0
 bne _rdb13
 dec _p+12
_rdb13 lda _p
 bne _rdd13
 jsr _rdr20
 lda _p+9
 and #15
 ora _p+6
 sta _p+6
_rdd13 jmp _rdr2
_rdr14 jmp _rdr2
_rdr15 lda _p+9
 sta _p+11
 jmp _rdr2
_rdr16 lda _p+13
 asl
 asl
 adc _p+13
 asl
 sta _p+13
 lda _p+9
 and #15
 adc _p+13
 sta _p+13
 jmp _rdr2
_rdr17 lda #0
 ldx #7
_rda17 ora _p-1,x
 dex
 bne _rda17
 cmp #0
 bne *+3
 rts
_rdb17 lda _p
 bne _rdd17
 jsr _rdr20
 jmp _rdb17
_rdd17 lda _p+11
 cmp #45
 bne _rde17
 sec
 lda #0
 sbc _p+13
 sta _p+13
_rde17 clc
 lda _p+12
 adc _p+13
 sta _p+12
 bpl _rdf17
 sec
 lda #0
 sbc _p+12
 sta _p+12
 lda _p
 ora #$10
 sta _p
_rdf175 ldx #8
 sed
_rdg17 asl _p+12
 lda _p+7
 adc _p+7
 sta _p+7
 dex
 bne _rdg17
 cld
 lda _p+10
 cmp #45
 bne _rdh17
 lda _p
 ora #$20
 sta _p
_rdh17 ldy #7
_rdj17 lda _p,y
 sta (_i),y
 dey
 bpl _rdj17
 rts
_rdr18 ldx _rdrx
 jsr _eofa
 bne _rda18
 ldy #0
 lda (_bufadr),y
 cmp #32
 beq _rda18 
 jsr _get1
 jmp _rdr18
_rda18 ldy #0
 lda #$39 
 sta (_i),y
 ldy #7
 lda #$99
 sta (_i),y
 rts
_rdr20 ldy #4
_rda20 ldx #7
 clc
_rdb20 rol _p-1,x
 dex
 bne _rdb20
 dey
 bne _rda20
 rts
 endif
;
;-------------------
;
 ifdef _F.Fix
_P.Fix lda #0
 sta _Temp
 sta _Temp+1
 lda 0,x
 beq _Fix3
 and #$10
 bne _Fix3
 lda 7,x
 cmp #5
 bcc *+5
 jmp _Fix4
 sta _Temp+2
 lda 0,x
 sta _Temp+3
 lda 1,x
 sta _Temp+4
 lda 2,x
 sta _Temp+5
_Fix1 lda _Temp
 sta _Temp+6
 lda _Temp+1
 sta _Temp+7
 asl _Temp
 rol _Temp+1
 bmi _Fix4
 asl _Temp
 rol _Temp+1
 bmi _Fix4
 clc
 lda _Temp
 adc _Temp+6
 sta _Temp
 lda _Temp+1
 adc _Temp+7
 sta _Temp+1
 bmi _Fix4
 asl _Temp
 rol _Temp+1
 bmi _Fix4
 clc
 lda _Temp+3
 and #15
 adc _Temp
 sta _Temp
 lda #0
 adc _Temp+1
 sta _Temp+1
 bmi _Fix4
 ldy #4
_Fix2 rol _Temp+5
 rol _Temp+4
 rol _Temp+3
 dey
 bne _Fix2
 dec _Temp+2
 bpl _Fix1
 lda 0,x
 and #$20
 beq _Fix3
 sec
 lda #0
 sbc _Temp
 sta _Temp
 lda #0
 sbc _Temp+1
 sta _Temp+1
_Fix3 clc
 txa
 adc #6
 tax
 lda _Temp
 sta 0,x
 lda _Temp+1
 sta 1,x
 rts
_Fix4 lda #6
 jmp _P.Error
 endif
;
;-------------------------
;
 ifdef _F.Adx
_Adx lda 2,x
 beq _Adx3
 lda 9,x
 jsr _BcdBin
 sta _r0
 lda #0
 sta _r0+1
 lda 2,x
 and #$10
 beq _Adx1
 sec
 lda #0
 sbc _r0
 sta _r0
 lda #0
 sbc _r0+1
 sta _r0+1
_Adx1 clc
 lda 0,x
 adc _r0
 sta _r0
 lda 1,x
 adc _r0+1
 sta _r0+1
 bvc *+7
 lda #6
 jmp _P.Error
 lda 2,x
 and #$ef
 sta 2,x
 lda _r0+1
 bpl _Adx2
 lda 2,x
 ora #$10
 sta 2,x
 sec
 lda #0
 sbc _r0
 sta _r0
 lda #0
 sbc _r0+1
 sta _r0+1
_Adx2 lda _r0
 cmp #>100
 lda _r0+1
 sbc #<100
 bcc *+7
 lda #6
 jmp _P.Error
 lda _r0
 jsr _BinBcd
 sta 9,x
_Adx3 inx
 inx
 rts
 endif
;
;--------------------
;
 ifdef _F.InXp
_Intxp lda 7,x
 jsr _BcdBin
 sta 6,x
 lda #0
 sta 7,x
 lda 0,x
 and #$10
 beq _Intx1
 sec
 lda #0
 sbc 6,x
 sta 6,x
 lda #0
 sbc 7,x
 sta 7,x
_Intx1 clc
 txa
 adc #6
 tax
 rts
 endif
;
;--------------------
;
 ifdef _F.Rne
_RoundE lda 2,x
 bne *+5
 inx
 inx
 rts
 lda 1,x
 beq _Roun1
 lda 0,x
 cmp #>0-98
 lda 1,x
 sbc #<0-98
 bcs _Roun1
 inx
 inx
 rts
_Roun1 lda 0,x
 sta $f8,x
 lda 1,x
 sta $f9,x
 inx
 inx
 jsr _P.Lcr
 db $15,0,0,0,0,0,0,1
 dex
 dex
 jsr _Adx
 lda 8,x
 and #$20
 ora 0,x
 sta 0,x
 jsr _FAdd
 rts
 endif
;
;--------------------------
;
 ifdef _F.BBD
_BinBcd tay
 lda _BinB1,y
 rts
_BinB1 db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09
 db $10,$11,$12,$13,$14,$15,$16,$17,$18,$19
 db $20,$21,$22,$23,$24,$25,$26,$27,$28,$29
 db $30,$31,$32,$33,$34,$35,$36,$37,$38,$39
 db $40,$41,$42,$43,$44,$45,$46,$47,$48,$49
 db $50,$51,$52,$53,$54,$55,$56,$57,$58,$59
 db $60,$61,$62,$63,$64,$65,$66,$67,$68,$69
 db $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
 db $80,$81,$82,$83,$84,$85,$86,$87,$88,$89
 db $90,$91,$92,$93,$94,$95,$96,$97,$98,$99
 endif
;
;---------------------
;
 ifdef _F.BCD
_BcdBin sta _r0
 and #$f0
 lsr
 sta _r0+1
 lsr
 lsr
 adc _r0+1
 sta _r0+1
 lda _r0
 and #15
 clc
 adc _r0+1
 rts
 endif
;
;--------------------------
;
 ifdef _F.Flt
_P.Flt lda #0
 sta _Temp
 sta _Temp+1
 sta _Temp+2
 sta _Temp+3
 lda 0,x
 sta _Temp+4
 lda 1,x
 sta _Temp+5
 bpl _Flt1
 sec
 lda #0
 sbc _Temp+4
 sta _Temp+4
 lda #0
 sbc _Temp+5
 sta _Temp+5
_Flt1 ldy #16
 sed
_Flt2 asl _Temp+4
 rol _Temp+5
 lda _Temp+2
 adc _Temp+2
 sta _Temp+2
 lda _Temp+1
 adc _Temp+1
 sta _Temp+1
 lda _Temp
 adc _Temp
 sta _Temp
 dey
 bne _Flt2
 cld
 lda #4
 sta _Temp+3
_Flt3 lda _Temp
 bne _Flt5
 ldy #4
_Flt4 asl _Temp+2
 rol _Temp+1
 rol _Temp
 dey
 bne _Flt4
 dec _Temp+3
 bne _Flt3
_Flt5 lda 1,x
 bpl _Flt6
 lda _Temp
 ora #$20
 sta _Temp
_Flt6 sec
 txa
 sbc #6
 tax
 lda _Temp
 sta 0,x
 lda _Temp+1
 sta 1,x
 lda _Temp+2
 sta 2,x
 lda #0
 sta 3,x
 sta 4,x
 sta 5,x
 sta 6,x
 lda _Temp+3
 sta 7,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Fln
_P.Fln ldy #8
_Fln1 lda 0,x
 sta $fa,x
 inx
 dey
 bne _Fln1
 jsr _P.Flt
 sec
 txa
 sbc #8
 tax
 rts
 endif
;
;----------------------------
;
