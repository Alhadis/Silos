;
;------------------------------------
;
 ifdef _F.Chain
_P.Chain pha
 lda #$ff
 sta _sp
 sta _sp+1
 jsr _clo
 pla
 sta _r1
 lda 0,x
 sta _r0
 lda 1,x
 sta _r0+1
 ldy #0
_Cha1 lda (_r0),y
 sta $200,y
 iny
 cpy #127
 beq _Cha2
 cpy _r1
 bne _Cha1
_Cha2 lda #$8d
 sta $200,y
 bit $c083
 ldy #0
_Cha3 lda $d139,y
 sta $bc00,y
 lda $d239,y
 sta $bd00,y
 lda $d339,y
 sta $be00,y
 iny
 bne _Cha3
 bit $c082
 jmp $bc0d
 endif
;
;--------------------
;
 ifdef _F.Seek
_P.Seek lda #$80
 sta _UseSeek
 lda 1,x
 pha
 lda 0,x
 pha
 inx
 inx
 jsr _FParam
 lda #0
 ldy #_yeof
 sta (_filadr),y
 dex
 dex
 dex
 dex
 ldy #_yBufSiz
 lda (_filadr),y
 sta 2,x
 iny
 lda (_filadr),y
 sta 3,x
 pla
 sta 0,x
 pla
 sta 1,x
 jsr _imul
 lda #2
 sta _cmdlist
 ldy #_yrefnum
 lda (_filadr),y
 sta _cmdlist+1
 lda 0,x
 sta _cmdlist+2
 lda 1,x
 sta _cmdlist+3
 lda _seekbyte
 sta _cmdlist+4
 jsr _mli
 db $ce
 dw _cmdlist
 beq *+5
 jmp _mlierr
 sta _useseek
 inx
 inx
 rts
 endif
;
;----------------------------------
;
 ifdef _F.Rdv
_P.Rdv pha
 tya
 pha
 dex
 dex
 ldy #_yBufAdr
 lda (_FilAdr),y
 sta 0,x
 iny
 lda (_FilAdr),y
 sta 1,x
 pla
 tay
 pla
 jsr _P.Stm
 dex
 dex
 ldy #_yBufAdr
 lda (_FilAdr),y
 sta 0,x
 iny
 lda (_FilAdr),y
 sta 1,x
 jsr _P.Get
 rts
 endif
;
;-----------------------
;
 ifdef _F.Wrv
_P.Wrv pha
 tya
 pha
 dex
 dex
 lda 2,x
 sta 0,x
 lda 3,x
 sta 1,x
 ldy #_yBufAdr
 lda (_FilAdr),y
 sta 2,x
 iny
 lda (_FilAdr),y
 sta 3,x
 pla
 tay
 pla
 jsr _P.Stm
 dex
 dex
 ldy #_yBufAdr
 lda (_FilAdr),y
 sta 0,x
 iny
 lda (_FilAdr),y
 sta 1,x
 jsr _P.Put
 rts
 endif
;
;------------------------------
;
 ifdef _F.Wre
_P.Wre sta _r0
 ldy #_yBufAdr
 lda (_FilAdr),y
 sta _r1
 iny
 lda (_FilAdr),y
 sta _r1+1
 ldy #0
_wre1 lda 0,x
 inx
 sta (_r1),y
 iny
 cpy _r0
 bne _wre1
 cpy #1
 bne *+3
 inx
 dex
 dex
 ldy #_yBufAdr
 lda (_FilAdr),y
 sta 0,x
 iny
 lda (_FilAdr),y
 sta 1,x
 jsr _P.Put
 rts
 endif
;
;---------------------
;
 ifdef _F.Pag
_P.Pag jsr _P.Wrf
 lda _FilAdr
 cmp #>_OutAdr
 bne _pag1
 lda _FilAdr+1
 cmp #<_OutAdr
 bne _pag1
 lda $bf98
 and #2
 bne _pag1
 jsr $fc58
 rts
_pag1 lda #12
 jsr _PutA
 rts
 endif
;
;---------------------
;
 ifdef _F.CL
_Clo lda #>_FilLst
 sta _FilAdr
 lda #<_FilLst
 sta _FilAdr+1
_clo1 lda _FilAdr
 sta _r0
 lda _FilAdr+1
 sta _r0+1
 ldy #0
 lda (_r0),y
 sta _FilAdr
 iny
 lda (_r0),y
 sta _FilAdr+1
 lda _FilAdr
 ora _FilAdr+1
 bne _clo2
 rts
_clo2 ldy #_yBufAdr
 lda (_FilAdr),y
 cmp _sp
 iny
 lda (_FilAdr),y
 sbc _sp+1
 bcs _clo1
 ldy #0
 lda (_FilAdr),y
 sta (_r0),y
 iny
 lda (_FilAdr),y
 sta (_r0),y
 lda _r0+1
 pha
 lda _r0
 pha
 jsr _close
 pla
 sta _FilAdr
 pla
 sta _FilAdr+1
 jmp _clo1
 endif
;
;----------------------------
;
 ifdef _F.Rdf
_P.Rdf jsr _Fparam
 lda _BufAdr
 cmp #>_OutAdr
 bne _rdf1
 lda _BufAdr+1
 cmp #<_OutAdr
 bne _rdf1
 lda #12
 jsr _P.Error
_rdf1 rts
 endif
;
;------------------------
;
 ifdef _F.Wrf
_P.Wrf jsr _Fparam
 lda _BufAdr
 cmp #>_InpAdr
 bne _wrf1
 lda _BufAdr+1
 cmp #<_InpAdr
 bne _wrf1
 lda #13
 jsr _P.Error
_wrf1 rts
 endif
;
;----------------------
;
 ifdef _F.FParm
_Fparam sta _BufSiz
 sty _BufSiz+1
 lda 0,x
 sta _BufAdr
 lda 1,x
 sta _BufAdr+1
 inx
 inx
 lda _BufAdr
 cmp #>_InpAdr
 bne _fpar1
 lda _BufAdr+1
 cmp #<_InpAdr
 bne _fpar1
 rts
_fpar1 lda _BufAdr
 cmp #>_OutAdr
 bne _fpar2
 lda _BufAdr+1
 cmp #<_OutAdr
 bne _fpar2
 rts
_fpar2 lda #>_FilLst
 sta _FilAdr
 lda #<_FilLst+1
 sta _FilAdr+1
_fpar3 ldy #0
 lda (_FilAdr),y
 pha
 iny
 lda (_FilAdr),y
 sta _FilAdr+1
 pla
 sta _FilAdr
 lda _FilAdr
 ora _FilAdr+1
 bne _fpar4
 lda #4
 jmp _P.Error
_fpar4 ldy #_yBufAdr
 lda (_FilAdr),y
 cmp _BufAdr
 bne _fpar3
 iny
 lda (_FilAdr),y
 cmp _BufAdr+1
 bne _fpar3
 rts
 endif
;
;------------------------
;
 ifdef _F.PuA
_F.Put Dflag
_PutA sty _savey
 ldy #0
 sta (_BufAdr),y
 jsr _Put1
 ldy _Savey
 rts
 endif
;
;----------------------
;
 ifdef _F.Put
_P.Put jsr _Fparam
_put1 lda _BufAdr
 cmp #>_outadr
 bne _put100
 lda _bufadr+1
 cmp #<_outadr
 bne _put100
 ldy #0
 lda (_bufadr),y
 ora #$80
 jsr _cout
 rts
_put100 lda #4
 sta _cmdlist
 ldy #_yrefnum
 lda (_filadr),y
 sta _cmdlist+1
 lda _bufadr
 sta _cmdlist+2
 lda _bufadr+1
 sta _cmdlist+3
 ldy #_yBufSiz
 lda (_filadr),y
 sta _cmdlist+4
 iny
 lda (_filadr),y
 sta _cmdlist+5
 jsr _mli
 db $cb
 dw _cmdlist
 beq *+5
 jmp _mlierr
 rts
 endif
;
;-----------------------
;
 ifdef _F.Open
_Open lda #3
 sta _cmdlist
 ldy #_yFilNam
 lda (_FilAdr),y
 sta _cmdlist+1
 iny
 lda (_FilAdr),y
 sta _cmdlist+2
 ldy #_yDosBuf
 lda (_FilAdr),y
 sta _cmdlist+3
 iny
 lda (_FilAdr),y
 sta _cmdlist+4
 lda _cmdlist+3
 beq _open1
 lda #0
 sta _cmdlist+3
 inc _cmdlist+4
_open1 jsr _mli
 db $c8
 dw _cmdlist
 beq *+5
 jmp _mlierr
 ldy #_yRefNum
 lda _cmdlist+5
 sta (_FilAdr),y
 rts
 endif
;
;----------------------
;
 ifdef _F.Create
_Create lda #1
 sta _cmdlist
 ldy #_yFilNam
 lda (_FilAdr),y
 sta _cmdlist+1
 iny
 lda (_FilAdr),y
 sta _cmdlist+2
 jsr _mli
 db $c1
 dw _cmdlist
 beq _crea1
 cmp #$46
 beq _crea1
 jmp _mlierr
_crea1 jsr _mli
 db $82
 dw _cmdlist
 lda #7
 sta _cmdlist
 ldy #_yFilNam
 lda (_FilAdr),y
 sta _cmdlist+1
 iny
 lda (_FilAdr),y
 sta _cmdlist+2
 lda #$c3
 sta _cmdlist+3
 lda #4
 sta _cmdlist+4
 ldy #_ytext
 lda (_filadr),y
 bne _crea2
 lda #6
 sta _cmdlist+4
_crea2 lda #0
 sta _cmdlist+5
 sta _cmdlist+6
 lda #1
 sta _cmdlist+7
 lda $bf90
 sta _cmdlist+8
 lda $bf91
 sta _cmdlist+9
 lda $bf92
 sta _cmdlist+10
 lda $bf93
 sta _cmdlist+11
 jsr _mli
 db $c0
 dw _cmdlist
 beq *+5
 jmp _mlierr
 rts
 endif
;
;---------------------------
;
 ifdef _F.Res
_P.Res jsr _Setup
 jsr _Open
 dex
 dex
 lda _BufAdr
 sta 0,x
 lda _BufAdr+1
 sta 1,x
 lda _BufSiz
 ldy _BufSiz+1
 jsr _P.Get
 rts
 endif
;
;---------------------------
;
 ifdef _F.Rew
_P.Rew jsr _Setup
 ldy #_yRewrite
 lda #1
 sta (_FilAdr),y
 jsr _Create
 jsr _Open
 ldy #_yeof
 lda #1
 sta (_FilAdr),y
 rts
 endif
;
;---------------------------
;
 ifdef _F.Sup
_F.Fcl Dflag
_Setup lda 0,x
 sta _StrLen
 lda 1,x
 sta _StrLen+1
 lda 2,x
 sta _StrAdr
 lda 3,x
 sta _StrAdr+1
 lda 4,x
 sta _BufSiz
 lda 5,x
 sta _BufSiz+1
 lda 6,x
 sta _BufAdr
 lda 7,x
 sta _BufAdr+1
 inx
 inx
 inx
 inx
 inx
 inx
 inx
 inx
 jsr _fclose
 dex
 dex
 lda #>_FilAdr
 sta 0,x
 lda #<_FilAdr
 sta 1,x
 lda #>_RecSiz
 ldy #<_RecSiz
 jsr _P.New
 dex
 dex
 lda #>_DosBuf
 sta 0,x
 lda #<_DosBuf
 sta 1,x
 lda #>1024+255
 ldy #<1024+255
 jsr _P.New
 lda #0
 tay
_res1 sta (_FilAdr),y
 iny
 cpy #_RecSiz
 bne _res1
 ldy #_yBufAdr
 lda _BufAdr
 sta (_FilAdr),y
 iny
 lda _BufAdr+1
 sta (_FilAdr),y
 ldy #_yBufSiz
 lda _BufSiz
 sta (_FilAdr),y
 iny
 lda _BufSiz+1
 sta (_FilAdr),y
 lda _BufSiz
 ora _BufSiz+1
 bne _setu1
 ldy #_ytext
 lda #1
 sta (_FilAdr),y
 ldy #_yBufSiz
 lda #>1
 sta (_FilAdr),y
 iny
 lda #<1
 sta (_FilAdr),y
_setu1 ldy #_yDosBuf
 lda _DosBuf
 sta (_FilAdr),y
 iny
 lda _DosBuf+1
 sta (_FilAdr),y
 ldy #0
 lda _FilLst
 sta (_FilAdr),y
 iny
 lda _FilLst+1
 sta (_FilAdr),y
 lda _FilAdr
 sta _FilLst
 lda _FilAdr+1
 sta _FilLst+1
 jsr _Fil
 rts
 endif
;
;---------------------------
;
 ifdef _F.Fcl
_F.Clo Dflag
_FClose lda #>_FilLst
 sta _FilAdr
 lda #<_FilLst+1
 sta _FilAdr+1
_fclo1 lda _FilAdr
 sta _r0
 lda _FilAdr+1
 sta _r0+1
 ldy #0
 lda (_r0),y
 sta _FilAdr
 iny
 lda (_r0),y
 sta _FilAdr+1
 lda _FilAdr
 ora _FilAdr+1
 beq _fclo2
 ldy #_yBufAdr
 lda (_FilAdr),y
 cmp _BufAdr
 bne _fclo1
 iny
 lda (_FilAdr),y
 cmp _BufAdr+1
 bne _fclo1
 ldy #0
 lda (_FilAdr),y
 sta (_r0),y
 iny
 lda (_FilAdr),y
 sta (_r0),y
 jsr _close
_fclo2 rts
 endif
;
;---------------------
;
 ifdef _F.Clo
_P.Clo
_Close ldy #_yRewrite
 lda (_FilAdr),y
 beq _clos1
 lda #2
 sta _cmdlist
 ldy #_yRefNum
 lda (_FilAdr),y
 sta _cmdlist+1
 jsr _mli
 db $cf
 dw _cmdlist
 beq *+5
 jmp _Mlierr
 jsr _mli
 db $d0
 dw _cmdlist
 beq *+5
 jmp _mlierr
_clos1 lda #1
 sta _cmdlist
 ldy #_yRefNum
 lda (_FilAdr),y
 sta _cmdlist+1
 jsr _mli
 db $cc
 dw _cmdlist
 beq *+5
 jmp _mlierr
 dex
 dex
 clc
 lda _FilAdr
 adc #>_yDosBuf
 sta 0,x
 lda _FilAdr+1
 adc #<_yDosBuf
 sta 1,x
 lda #>1024+255
 ldy #<1024+255
 jsr _P.Dis
 dex
 dex
 clc
 lda _FilAdr
 adc #>_yFilNam
 sta 0,x
 lda _FilAdr+1
 adc #<_yFilNam
 sta 1,x
 lda #>65
 ldy #<65
 jsr _P.Dis
 dex
 dex
 lda #>_FilAdr
 sta 0,x
 lda #<_FilAdr
 sta 1,x
 lda #>_RecSiz
 ldy #<_RecSiz
 jsr _P.Dis
 rts
 endif
;
;------------------------
;
 ifdef _F.EoA
_F.Eof Dflag
_EofA jsr _Eof1
 inx
 inx
 lda $fe,x
 rts
 endif
;
;-------------------
;
 ifdef _F.Eof
_P.Eof jsr _Fparam
_Eof1 lda _BufAdr
 cmp #>_InpAdr
 bne _Eof100
 lda _BufAdr+1
 cmp #<_InpAdr
 bne _Eof100
 lda _KbdStat
 bne *+5
 jsr _Get1
 lda _KbdEof
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
_Eof100 lda _BufAdr
 cmp #>_Outadr
 bne _Eof200
 lda _BufAdr+1
 cmp #<_OutAdr
 bne _Eof200
 jmp _PushTrue
_Eof200 dex
 dex
 ldy #_Yeof
 lda (_FilAdr),y
 sta 0,x
 lda #0
 sta 1,x
 rts
 endif
;
;---------------------
;
 ifdef _F.ENA
_F.Eoln Dflag
_EolnA jsr _Eoln1
 inx
 inx
 lda $fe,x
 rts
 endif
;
;
;
 ifdef _F.Eoln
_P.Eoln jsr _FParam
_Eoln1 lda _BufAdr
 cmp #>_InpAdr
 bne _Eoln2
 lda _BufAdr+1
 cmp #<_InpAdr
 bne _Eoln2
 lda _KbdStat
 bne *+5
 jsr _Get1
 lda _KbdEln
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
_Eoln2 dex
 dex
 ldy #_Yeoln
 lda (_FilAdr),y
 sta 0,x
 lda #0
 sta 1,x
 rts
 endif
;
;-----------------------
;
 ifdef _F.Fil
_Fil dex
 dex
 lda #>_FilNam
 sta 0,x
 lda #<_FilNam
 sta 1,x
 lda #>65
 ldy #<65
 jsr _P.New
 ldy #_yFilNam
 lda _FilNam
 sta (_FilAdr),y
 iny
 lda _FilNam+1
 sta (_FilAdr),y
 lda _StrAdr
 ora _StrAdr+1
 bne *+5
 jmp _fil4
 clc
 lda _StrAdr
 adc _StrLen
 sta _r0
 lda _StrAdr+1
 adc _StrLen+1
 sta _r0+1
_fil1 sec
 lda _r0
 sbc #>1
 sta _r0
 lda _r0+1
 sbc #<1
 sta _r0+1
 lda _r0
 cmp _StrAdr
 lda _r0+1
 sbc _StrAdr+1
 bcc _fil4
 ldy #0
 lda (_r0),y
 cmp #32
 beq _fil1
 sec
 lda _r0
 sbc _StrAdr
 sta _r0
 lda _r0+1
 sbc _StrAdr+1
 sta _r0+1
 clc
 lda _r0
 adc #>1
 sta _r0
 lda _r0+1
 adc #<1
 sta _r0+1
 lda #>64
 cmp _r0
 lda #<64
 sbc _r0+1
 bcc _fil3
 lda _StrAdr
 sta _r1
 lda _StrAdr+1
 sta _r1+1
 lda _FilNam
 sta _r2
 lda _FilNam+1
 sta _r2+1
 ldy #0
_fil2 lda (_r1),y
 iny
 sta (_r2),y
 cpy _r0
 bne _fil2
 tya
 ldy #0
 sta (_r2),y
 rts
_fil3 lda #7
 jmp _P.Error
_fil4 ldy #_yanon
 lda #1
 sta (_FilAdr),y
 lda _FilNam
 sta _r0
 lda _FilNam+1
 sta _r0+1
 ldy #0
 lda #8
 sta (_r0),y
 iny
 lda #'t
 sta (_r0),y
 iny
 lda #'e
 sta (_r0),y
 iny
 lda #'m
 sta (_r0),y
 iny
 lda #'p
 sta (_r0),y
 iny
 lda _BufAdr+1
 lsr
 lsr
 lsr
 lsr
 clc
 adc #'a
 sta (_r0),y
 iny
 lda _BufAdr+1
 and #15
 clc
 adc #'a
 sta (_r0),y
 iny
 lda _BufAdr
 lsr
 lsr
 lsr
 lsr
 clc
 adc #'a
 sta (_r0),y
 iny
 lda _BufAdr
 and #15
 adc #'a
 sta (_r0),y
 rts
 endif
;
;-------------------------
;
 ifdef _F.Wrb
_P.Wrb dex
 lda 1,x
 sta 0,x
 lda 2,x
 sta 1,x
 lda 3,x
 beq _Wrb1
 lda #>_S.True
 sta 2,x
 lda #<_S.True
 sta 3,x
 lda #4
 jmp _P.Wrs
_Wrb1 lda #>_S.False
 sta 2,x
 lda #<_S.False
 sta 3,x
 lda #5
 jmp _P.Wrs
_S.True asc 'TRUE'
_S.False asc 'FALSE'
 endif
;
;----------------------------
;
 ifdef _F.Wrc
_P.Wrc lda 0,x
 sta _Temp
_Wrc1 lda #1
 cmp _Temp
 bcs _Wrc2
 lda #32
 jsr _PutA
 dec _Temp
 jmp _Wrc1
_Wrc2 lda 2,x
 jsr _PutA
 inx
 inx
 inx
 inx
 rts
 endif
;
;--------------------------
;
 ifdef _F.Wrs
_P.Wrs sta _Temp+2
 lda 0,x
 sta _Temp+3
 lda 2,x
 sta _Temp
 lda 3,x
 sta _Temp+1
 inx
 inx
 inx
 inx
 lda _Temp+3
 bne _Wrs1
 lda _Temp+2
 sta _Temp+3
_Wrs1 lda _Temp+2
 cmp _Temp+3
 bcs _Wrs2
 lda #32
 jsr _PutA
 dec _Temp+3
 jmp _Wrs1
_Wrs2 ldy #0
_Wrs3 cpy _Temp+3
 bne *+3
 rts
 lda (_Temp),y
 jsr _PutA
 iny
 jmp _Wrs3
 endif
;
;------------------------
;
 ifdef _F.Wrr
_F.Wdig Dflag
_P.Wrr lda 1,x
 beq *+7
 lda #5
 jmp _P.Error
 lda 0,x
 cmp #8
 bcs *+4
 lda #8
 sec
 sbc #7
 sta _r1
 inx
 inx
 jsr _DupQ
 jsr _IntXp
 sec
 lda 0,x
 sbc _r1
 sta 0,x
 lda 1,x
 sbc #0
 sta 1,x
 jsr _RoundE
 ldy #32
 lda 0,x
 sta _r1+1
 and #$20
 beq *+4
 ldy #'-
 tya
 jsr _PutA
 jsr _WrDigit
 lda #'.
 jsr _PutA
_Wrr1 jsr _WrDigit
 dec _r1
 bne _Wrr1
 lda #'E
 jsr _PutA
 ldy #'+
 lda _r1+1
 and #$10
 beq *+4
 ldy #'-
 tya
 jsr _PutA
 lda 7,x
 lsr
 lsr
 lsr
 lsr
 ora #'0
 jsr _PutA
 lda 7,x
 and #15
 ora #'0
 jsr _PutA
 clc
 txa
 adc #8
 tax
 rts
 endif
;
;--------------------
;
 ifdef _F.Wrx
_F.Wdig Dflag
_P.Wrx lda 0,x
 cmp #>154
 lda 1,x
 sbc #<154
 bcc *+7
 lda #5
 jmp _P.Error
 lda 3,x
 beq *+7
 lda #5
 jmp _P.Error
 lda 0,x
 sta _r1
 lda 2,x
 sta _r1+1
 sec
 lda #>0
 sbc 0,x
 sta 2,x
 lda #<0
 sbc 1,x
 sta 3,x
 inx
 inx
 jsr _RoundE
 lda 7,x
 jsr _BcdBin
 sta 7,x
 lda 0,x
 and #$10
 bne _Wrx2
 lda 7,x
 jsr _Wrx6
_Wrx1 jsr _WrDigit
 dec 7,x
 bpl _Wrx1
 lda #'.
 jsr _PutA
 jmp _Wrx4
_Wrx2 lda #0
 jsr _Wrx6
 lda #'0
 jsr _PutA
 lda #'.
 jsr _PutA
_Wrx3 dec 7,x
 beq _Wrx4
 dec _r1
 bmi _Wrx5
 lda #'0
 jsr _PutA
 jmp _Wrx3
_Wrx4 dec _r1
 bmi _Wrx5
 jsr _WrDigit
 jmp _Wrx4
_Wrx5 clc
 txa
 adc #8
 tax
 rts
_Wrx6 clc
 adc _r1
 tay
 iny
 iny
 lda 0,x
 and #$20
 beq *+3
 iny
_Wrx7 cpy _r1+1
 bcs _Wrx8
 lda #32
 jsr _PutA
 iny
 jmp _Wrx7
_Wrx8 lda 0,x
 and #$20
 beq _Wrx9
 lda #'-
 jsr _PutA
_Wrx9 rts
 endif
;
;------------------
;
 ifdef _F.Wdig
_WrDigit lda 0,x
 and #15
 ora #'0
 jsr _PutA
 ldy #4
_WrD1 asl 6,x
 rol 5,x
 rol 4,x
 rol 3,x
 rol 2,x
 rol 1,x
 rol 0,x
 dey
 bne _Wrd1
 rts
 endif
;
;----------------------
;
 ifdef _F.Get
_P.Get jsr _P.Rdf
_Get1 lda _BufAdr
 cmp #>_inpadr
 bne _get10
 lda _BufAdr+1
 cmp #<_inpadr
 bne _get10
 lda _KbdStat
 beq _Get2
 lda _KbdEln
 beq _Get3
_Get2 txa
 pha
 jsr _Getln1
 lda #13
 sta $200,x
 pla
 tax
 lda #$ff
 sta _KbdStat
 lda #0
 sta _kbdptr
 lda #0
 sta _KbdEln
_Get3 lda #0
 sta _KbdEof
 ldy _KbdPtr
 lda $200,y
 and #$7f
 cmp #13
 bne _Get4
 lda #32
 ldy #0
 sta (_BufAdr),y
 lda #$ff
 sta _KbdEln
 rts
_Get4 cmp #$1a
 bne _Get5
 lda #$ff
 sta _KbdEof
_Get5 ldy #0
 sta (_BufAdr),y
 inc _KbdPtr
 rts
_Get10 ldy #_yeof
 lda (_FilAdr),y
 beq *+7
 lda #8
 jmp _P.Error
 lda #4
 sta _cmdlist
 ldy #_yrefnum
 lda (_FilAdr),y
 sta _cmdlist+1
 lda _BufAdr
 sta _cmdlist+2
 lda _BufAdr+1
 sta _cmdlist+3
 ldy #_yBufSiz
 lda (_filadr),y
 sta _cmdlist+4
 iny
 lda (_filadr),y
 sta _cmdlist+5
 jsr _mli
 db $ca
 dw _cmdlist
 beq _get11
 cmp #$4c
 beq *+5
 jmp _mlierr
 lda #1
 ldy #_yeof
 sta (_filadr),y
 rts
_get11 ldy #_ytext
 lda (_filadr),y
 beq _get12
 lda #0
 ldy #_yeoln
 sta (_filadr),y
 ldy #0
 lda (_bufadr),y
 cmp #13
 bne _get12
 lda #32
 sta (_bufadr),y
 lda #1
 ldy #_yeoln
 sta (_filadr),y
_get12 rts
 endif
;
;------------------------
;
 ifdef _F.Rds
_P.Rds sta _r0
 lda 0,x
 sta _r1
 lda 1,x
 sta _r1+1
 inx
 inx
 lda #32
 ldy #0
_Rds1 sta (_r1),y
 iny
 cpy _r0
 bne _Rds1
 lda #0
 sta _r0+1
 jsr _EofA
 beq *+7
 lda #8
 jmp _P.Error
_Rds2 jsr _EolnA
 beq *+3
 rts
 ldy #0
 lda (_BufAdr),y
 ldy _r0+1
 sta (_r1),y
 jsr _Get1
 jsr _EofA
 beq *+3
 rts
 inc _r0+1
 lda _r0+1
 cmp _r0
 bne _Rds2
 rts
 endif
;
;--------------------------
;
 ifdef _F.Rdc
_P.Rdc jsr _EofA
 beq *+7
 lda #8
 jmp _P.Error
 dex
 dex
 ldy #0
 lda (_BufAdr),y
 sta 0,x
 lda #0
 sta 1,x
 jsr _Get1
 rts
 endif
;
;-----------------------
;
 ifdef _F.Wri
_P.Wri lda 2,x
 sta _Temp
 lda 3,x
 sta _Temp+1
 bpl _Wri1
 sec
 lda #0
 sbc _Temp
 sta _Temp
 lda #0
 sbc _Temp+1
 sta _Temp+1
_Wri1 lda #0
 sta _Temp+2
 sta _Temp+3
 sta _Temp+4
 ldy #16
 sed
_Wri2 asl _Temp
 rol _Temp+1
 lda _Temp+2
 adc _Temp+2
 sta _Temp+2
 lda _Temp+3
 adc _Temp+3
 sta _Temp+3
 lda _Temp+4
 adc _Temp+4
 sta _Temp+4
 dey
 bne _Wri2
 cld
 lda _Temp+2
 and #15
 ora #'0
 sta _Temp
 lda _Temp+2
 lsr
 lsr
 lsr
 lsr
 ora #'0
 sta _Temp+1
 lda _Temp+3
 and #15
 ora #'0
 sta _Temp+2
 lda _Temp+3
 lsr
 lsr
 lsr
 lsr
 ora #'0
 sta _Temp+3
 lda _Temp+4
 and #15
 ora #'0
 sta _Temp+4
 ldy #5
_Wri3 lda _Temp-1,y
 cmp #'0
 bne _Wri4
 dey
 cpy #1
 bne _Wri3
_Wri4 lda 3,x
 bpl _Wri5
 iny
_Wri5 sty _Temp+5
 lda _Temp+5
 cmp 0,x
 bcs _Wri7
 sec
 lda 0,x
 sbc _Temp+5
 tay
_Wri6 lda #32
 jsr _PutA
 dey
 bne _Wri6
_Wri7 lda 3,x
 bpl _Wri8
 lda #'-
 jsr _PutA
 dec _Temp+5
_Wri8 ldy _Temp+5
 lda _Temp-1,y
 jsr _PutA
 dec _Temp+5
 bne _Wri8
 inx
 inx
 inx
 inx
 rts
 endif
;
;-----------------------
;
 ifdef _F.Rdi
_P.Rdi lda #0
 sta _Temp
 sta _Temp+1
 sta _Temp+2
 sta _Temp+3
_Rdi1 jsr _EofA
 beq _Rdi2
 lda #8
 jmp _P.Error
_Rdi2 ldy #0
 lda (_BufAdr),y
 cmp #32
 bne _Rdi3
 jsr _Get1
 jmp _Rdi1
_Rdi3 cmp #'+
 beq _Rdi4
 ifndef mayFix
 cmp #'-
 beq _Rdi3a
 jsr _Rdi8
 bcc _Rdi5
 lda #3
 jmp _P.Error
_Rdi3a
 else
 cmp #'-
 bne _Rdi4a
 endif
 lda #$ff
 sta _Temp+3
_Rdi4 jsr _Get1
 jsr _Eofa
 beq _Rdi4a
 ifndef mayFix
 lda #8
 jmp _P.Error
 else
 jmp _Rdi8
 endif
_Rdi4a ldy #0
 lda (_BufAdr),y
 ifndef mayFix
 jsr _Rdi8
 bcc _Rdi5a
 lda #3
 jmp _P.Error
_Rdi5 ldy #0
 lda (_BufAdr),y
 jsr _Rdi8
 bcs _Rdi6
 else
 cmp #'0
 bge _Rdi5n
 jmp _Rdi8
_Rdi5n cmp #'9+1
 bcc _Rdi5a
 jmp _Rdi8
 endif
_Rdi5a lda _Temp+1
 pha
 lda _Temp
 pha
 asl _Temp
 rol _Temp+1
 rol _Temp+2
 asl _Temp
 rol _Temp+1
 rol _Temp+2
 clc
 pla
 adc _Temp
 sta _Temp
 pla
 adc _Temp+1
 sta _Temp+1
 lda #0
 adc _Temp+2
 sta _Temp+2
 asl _Temp
 rol _Temp+1
 rol _Temp+2
 ldy #0
 lda (_BufAdr),y
 and #15
 clc
 adc _Temp
 sta _Temp
 lda #0
 adc _Temp+1
 sta _Temp+1
 lda #0
 adc _Temp+2
 sta _Temp+2
 sec
 lda #>32768
 sbc _Temp
 lda #<32768
 sbc _Temp+1
 lda #0
 sbc _Temp+2
 ifndef mayFix
 bcc _Rdi6
 else
 bcc _Rdi8
 endif
 jsr _Get1
 jsr _Eofa
 bne _Rdi6
 ifndef mayFix
 jmp _Rdi5
 else
 ldy #0
 lda (_BufAdr),Y
 cmp #$20
 bne _Rdi4a
 endif
_Rdi6 lda _Temp+3
 beq _Rdi7
 sec
 lda #0
 sbc _Temp
 sta _Temp
 lda #0
 sbc _Temp+1
 sta _Temp+1
_Rdi7 dex
 dex
 lda _Temp
 sta 0,x
 lda _Temp+1
 sta 1,x
 rts
 ifndef mayFix
_Rdi8 cmp #'0
 bcs *+4
 sec
 rts
 cmp #'9+1
 rts
 else
_Rdi8 jsr _EofA
 bne _Rdi8n
 ldy #0
 lda (_BufAdr),Y
 cmp #$20
 beq _Rdi8n
 jsr _Get1
 jmp _Rdi8
_Rdi8n lda #3
 jmp _Error
 endif
 endif
;
;-----------------------
;
 ifdef _F.Wrl
_P.Wrl lda #13
 jmp _PutA
 endif
;
;------------------------
;
 ifdef _F.Rdl
_P.Rdl ifndef B4Fix
 lda _BufAdr
 cmp #>_inpadr
 bne _Rln3
 lda _BufAdr+1
 cmp #<_inpadr
 bne _Rln3
 endif
 jsr _EolnA
 ifdef B4Fix
 bne _Rln1
 ldy #0
 lda (_BufAdr),y
 cmp #32
 bne _Rln2
 jsr _Get1
 jmp _P.Rdl
_Rln1 endif
 lda #0
 sta _KbdStat
 sta _KbdEof
 sta _KbdEln
 rts
 ifdef B4Fix
_Rln2 lda #3
 jmp _P.Error
 else
_Rln3 jsr _EolnA
 bne _Rln4
 jsr _Get1
 jmp _Rln3
_Rln4 jsr _Get1
 rts
 endif
 endif
;
;-----------------------
;
 ifdef _F.Abi
_P.Abi lda 1,x
 bpl _abi1
 sec
 lda #0
 sbc 0,x
 sta 0,x
 lda #0
 sbc 1,x
 sta 1,x
 bvc _abi1
 lda #6
 jmp _P.Error
_abi1 rts
 endif
;
;---------------------------------
;
 ifdef _F.Abr
_P.Abr lda 0,x
 and #$1f
 sta 0,x
 rts
 endif
;
;----------------------------------
;
 ifdef _F.Adi
_P.Adi clc
 lda 2,x
 adc 0,x
 sta 2,x
 lda 3,x
 adc 1,x
 sta 3,x
 bvc *+7
 lda #6
 jmp _P.Error
 inx
 inx
 rts
 endif
* begin new
;
;-----------------------------------
;
 ifdef _F.Ana
_P.Ana lda 2,x
 and 0,x
 sta 2,x
 lda 3,x
 and 1,x
 sta 3,x
 inx
 inx
 rts
 endif
* end new
;
;-----------------------------------
;
 ifdef _F.And
_P.And lda 2,x
 and 0,x
 sta 2,x
 inx
 inx
 rts
 endif
;
;----------------------------------
;
 ifdef _F.Beq
_P.Beq inx
 inx
 inx
 inx
 lda $fc,x
 cmp $fe,x
 bne _beq1
 lda $fd,x
 cmp $ff,x
_beq1 rts
 endif
;
;-------------------------------
;
 ifdef _F.CkLo
_P.CkLo sta _r0
 sty _r0+1
 sec
 lda 0,x
 sbc _r0
 sta _r0
 lda 1,x
 sbc _r0+1
 sta _r0+1
 rts
 endif
;
;---------------------------------
;
 ifdef _F.CkHi
_P.CkHi cmp _r0
 tya
 sbc _r0+1
 bcs _chk3
 lda #5
 jmp _P.Error
_chk3 rts
 endif
;
;---------------------------------
;
 ifdef _F.Ddo
_P.Ddo sta _r0
 sty _r0+1
 lda 2,x
 cmp 0,x
 lda 1,x
 eor #$80
 sta _r1
 lda 3,x
 eor #$80
 sbc _r1
 bcc *+3
 rts
 inx
 inx
 inx
 inx
 pla
 pla
 jmp (_r0)
 endif
;
;--------------------------------
;
 ifdef _F.Dlb
_P.Dlb clc
 adc _Local
 sta _r0
 tya
 adc _Local+1
 sta _r0+1
 ldy #0
 lda (_r0),y
 sec
 sbc #1
 sta (_r0),y
 rts
 endif
;
;----------------------------------
;
 ifdef _F.Dlw
_P.Dlw clc
 adc _Local
 sta _r0
 tya
 adc _Local+1
 sta _r0+1
 ldy #0
 lda (_r0),y
 sec
 sbc #1
 sta (_r0),y
 bcs *+9
 iny
 lda (_r0),y
 sbc #0
 sta (_r0),y
 rts
 endif
;
;-------------------------------
;
 ifdef _F.End
_P.End clc
 adc _Sp
 sta _Sp
 tya
 adc _Sp+1
 sta _Sp+1
 ldy #4
 lda (_local),y
 pha
 dey
 lda (_local),y
 pha
 ldy #1
 lda (_local),y
 pha
 iny
 lda (_local),y
 sta _local+1
 pla
 sta _local
 jsr _clo
 lda _FailSafe
 sta _FilAdr
 lda _FailSafe+1
 sta _FilAdr+1
 rts
 endif
;
;--------------------------
;
 ifdef _F.Eq
_P.Eq ldy #0
 lda 0,x
 cmp 2,x
 bne *+10
 lda 1,x
 cmp 3,x
 bne *+4
 ldy #1
 sty 2,x
 lda #0
 sta 3,x
 inx
 inx
 rts
 endif
;
;---------------------------------
;
 ifdef _F.Fjp
_P.Fjp sta _r0
 sty _r0+1
 inx
 inx
 lda $fe,x
 beq *+3
 rts
 pla
 pla
 jmp (_r0)
 endif
;
;---------------------------------
;
 ifdef _F.Go
_P.Go sta _r0
_go1 ldy #0
 lda (_local),y
 cmp _r0
 beq _go2
 iny
 lda (_local),y
 pha
 iny
 lda (_local),y
 sta _local+1
 pla
 sta _local
 jmp _go1
_go2 lda _local
 sta _sp
 lda _local+1
 sta _sp+1
 jsr _clo
 lda _FailSafe
 sta _FilAdr
 lda _FailSafe+1
 sta _FilAdr+1
 rts
 endif
;
;---------------------------------------
;
 ifdef _F.Ilb
_P.Ilb clc
 adc _local
 sta _r0
 tya
 adc _local+1
 sta _r0+1
 clc
 ldy #0
 lda (_r0),y
 adc #1
 sta (_r0),y
 rts
 endif
;
;-------------------------------------
;
 ifdef _F.Ilw
_P.Ilw clc
 adc _local
 sta _r0
 tya
 adc _local+1
 sta _r0+1
 clc
 ldy #0
 lda (_r0),y
 adc #1
 sta (_r0),y
 bcc _ilw1
 iny
 lda (_r0),y
 adc #0
 sta (_r0),y
_ilw1 rts
 endif
;
;--------------------------
;
 ifdef _F.Ldw
_P.Ldw lda (0,x)
 tay
 inc 0,x
 bne *+4
 inc 1,x
 lda (0,x)
 sty 0,x
 sta 1,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Lin
_P.Lin sta _LineNumber
 sty _LineNumber+1
 rts
 endif
;
;-------------------------
;
 ifdef _F.Lla
_P.Lla dex
 dex
 clc
 adc _local
 sta 0,x
 tya
 adc _local+1
 sta 1,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Llb
_P.Llb clc
 adc _local
 sta _r0
 tya
 adc _local+1
 sta _r0+1
 dex
 dex
 ldy #0
 lda (_r0),y
 sta 0,x
 lda #0
 sta 1,x
 rts
 endif
;
;------------------------
;
 ifdef _F.Llw
_P.Llw clc
 adc _local
 sta _r0
 tya
 adc _local+1
 sta _r0+1
 dex
 dex
 ldy #0
 lda (_r0),y
 sta 0,x
 iny
 lda (_r0),y
 sta 1,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Lnk
_P.Lnk sta _r0
 sty _r0+1
 lda _FilAdr
 sta _FailSafe
 lda _FilAdr+1
 sta _FailSafe+1
 pla
 sta _r1
 pla
 sta _r1+1
 pla
 sta _r2
 pla
 sta _r2+1
 lda _r1+1
 pha
 lda _r1
 pha
 sec
 lda _sp
 sbc _r0
 sta _sp
 lda _sp+1
 sbc _r0+1
 sta _sp+1
 ldy #1
 lda _local
 sta (_sp),y
 iny
 lda _local+1
 sta (_sp),y
 iny
 lda _r2
 sta (_sp),y
 iny
 lda _r2+1
 sta (_sp),y
 lda _sp
 sta _local
 lda _sp+1
 sta _local+1
 rts
 endif
;
;-------------------------------
;
 ifdef _F.Lpa
_P.Lpa clc
 adc _sp
 sta _sp
 tya
 adc _sp+1
 sta _sp+1
 dex
 dex
 lda _sp
 sta 0,x
 lda _sp+1
 sta 1,x
 rts
 endif
;
;----------------------------
;
 ifdef _F.Max
_P.Max cmp 0,x
 tya
 sbc 1,x
 bvs _max1
 bmi _max2
 rts
_max1 bpl _max2
 rts
_max2 lda #5
 jmp _P.Error
 endif
;
;----------------------------
;
 ifdef _F.Min
_P.Min cmp 0,x
 tya
 sbc 1,x
 bvs _min1
 bpl _min2
 rts
_min1 bmi _min2
 rts
_min2 lda #5
 jmp _P.Error
 endif
;
;------------------------------
;
 ifdef _F.Ne
_P.Ne ldy #1
 lda 0,x
 cmp 2,x
 bne _ne1
 lda 1,x
 cmp 3,x
 bne _ne1
 ldy #0
_ne1 sty 2,x
 lda #0
 sta 3,x
 inx
 inx
 rts
 endif
;
;--------------------------
;
 ifdef _F.Ngi
_P.Ngi sec
 lda #0
 sbc 0,x
 sta 0,x
 lda #0
 sbc 1,x
 sta 1,x
 bvc *+7
 lda #6
 jmp _P.Error
 rts
 endif
;
;--------------------------
;
 ifdef _F.Not
_P.Not lda 0,x
 eor #1
 sta 0,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Odd
_P.Odd inx
 inx
 lda $fe,x
 and #1
 beq *+5
 jmp _PushTrue
 jmp _PushFalse
 endif
;
;------------------------
;
 ifdef _F.Or
_P.Or lda 2,x
 ora 0,x
 sta 2,x
 inx
 inx
 rts
 endif
* begin new
;
;------------------------
;
 ifdef _F.Ora
_P.Ora lda 2,x
 ora 0,x
 sta 2,x
 lda 3,x
 ora 1,x
 sta 3,x
 inx
 inx
 rts
 endif
* end new
;
;------------------------
;
 ifdef _F.Prd
_P.Prd cmp 0,x
 bne _prd1
 tya
 cmp 1,x
 bne _prd1
 lda #5
 jmp _P.Error
_prd1 sec
 lda 0,x
 sbc #>1
 sta 0,x
 lda 1,x
 sbc #<1
 sta 1,x
 rts
 endif
;
;------------------------
;
 ifdef _F.Push
_P.Push dex
 dex
 sta 0,x
 sty 1,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Sbi
_P.Sbi sec
 lda 2,x
 sbc 0,x
 sta 2,x
 lda 3,x
 sbc 1,x
 sta 3,x
 bvc *+7
 lda #6
 jmp _P.Error
 inx
 inx
 rts
 endif
;
;------------------------
;
 ifdef _F.Slb
_P.Slb clc
 adc _local
 sta _r0
 tya
 adc _local+1
 sta _r0+1
 ldy #0
 lda 0,x
 sta (_r0),y
 inx
 inx
 rts
 endif
;
;-------------------------
;
 ifdef _F.Slw
_P.Slw clc
 adc _local
 sta _r0
 tya
 adc _local+1
 sta _r0+1
 ldy #0
 lda 0,x
 sta (_r0),y
 iny
 lda 1,x
 sta (_r0),y
 inx
 inx
 rts
 endif
;
;-------------------------
;
 ifdef _F.Stb
_P.Stb lda 0,x
 sta (2,x)
 inx
 inx
 inx
 inx
 rts
 endif
;
;-------------------------
;
 ifdef _F.Stw
_P.Stw lda 0,x
 sta (2,x)
 inc 2,x
 bne *+4
 inc 3,x
 lda 1,x
 sta (2,x)
 inx
 inx
 inx
 inx
 rts
 endif
;
;--------------------------
;
 ifdef _F.Scc
_P.Scc cmp 0,x
 bne _scc1
 tya
 cmp 1,x
 bne _scc1
 lda #5
 jmp _P.Error
_scc1 clc
 lda 0,x
 adc #>1
 sta 0,x
 lda 1,x
 adc #<1
 sta 1,x
 rts
 endif
;
;-------------------------
;
 ifdef _F.Lti
_P.Lti ldy #0
 lda 2,x
 cmp 0,x
 lda 3,x
 sbc 1,x
 bpl *+4
 ldy #1
 tya
 bvc *+4
 eor #1
 sta 2,x
 lda #0
 sta 3,x
 inx
 inx
 rts
 endif
;
;------------------------
;
 ifdef _F.Gei
_P.Gei ldy #0
 lda 2,x
 cmp 0,x
 lda 3,x
 sbc 1,x
 bmi *+4
 ldy #1
 tya
 bvc *+4
 eor #1
 sta 2,x
 lda #0
 sta 3,x
 inx
 inx
 rts
 endif
;
;-----------------------
;
 ifdef _F.Gti
_P.Gti ldy #0
 lda 0,x
 cmp 2,x
 lda 1,x
 sbc 3,x
 bpl *+4
 ldy #1
 tya
 bvc *+4
 eor #1
 sta 2,x
 lda #0
 sta 3,x
 inx
 inx
 rts
 endif
;
;--------------------------
;
 ifdef _F.Lei
_P.Lei ldy #0
 lda 0,x
 cmp 2,x
 lda 1,x
 sbc 3,x
 bmi *+4
 ldy #1
 tya
 bvc *+4
 eor #1
 sta 2,x
 lda #0
 sta 3,x
 inx
 inx
 rts
 endif
;
;----------------------------------------
;
 ifdef _F.Dup
_DupQ ldy #8
_Dupq1 dex
 lda 8,x
 sta 0,x
 dey
 bne _Dupq1
 rts
 endif
;
;--------------------------
;
 ifdef _F.Mpi
_P.Mpi
_IMul jsr _Iop1
 lda #0
 sta _seekbyte
 lda _i+1
 eor _j+1
 sta _ISign
 ldy #16
_IMul1 asl _Temp
 rol _Temp+1
 rol _SeekByte
 rol _j
 rol _j+1
 bcc _IMul2
 clc
 lda _Temp
 adc _i
 sta _Temp
 lda _Temp+1
 adc _i+1
 sta _Temp+1
 lda #0
 adc _seekbyte
 sta _seekbyte
_Imul2 dey
 bne _Imul1
 bit _useseek
 bmi _Imul3
 lda _seekbyte
 bne _Imulerr
 lda _Temp+1
 bpl _Imul3
 lda _ISign
 bmi _Imul3
_imulerr lda #6
 jmp _P.Error
_imul3 lda _Temp
 sta _i
 lda _Temp+1
 sta _i+1
 jsr _Iop2
 rts
 endif
;
;--------------------
;
 ifdef _F.Dvi
_P.Dvi
_IDiv jsr _Iop1
 ldy #16
_Idiv1 asl _i
 rol _i+1
 rol _Temp
 rol _Temp+1
 sec
 lda _Temp
 sbc _j
 lda _Temp+1
 sbc _j+1
 bcc _IDiv2
 lda _Temp
 sbc _j
 sta _Temp
 lda _Temp+1
 sbc _j+1
 sta _Temp+1
 inc _i
_IDiv2 dey
 bne _IDiv1
 jsr _Iop2
 rts
 EndIF
;
;------------------
;
 ifdef _F.Mod
_P.Mod jsr _Iop1
 ldy #16
_Mod1 asl _i
 rol _i+1
 rol _Temp
 rol _Temp+1
 lda _Temp
 cmp _j
 lda _Temp+1
 sbc _j+1
 bcc _Mod2
 lda _Temp
 sbc _j
 sta _Temp
 lda _Temp+1
 sbc _j+1
 sta _Temp+1
_Mod2 dey
 bne _Mod1
 lda _Temp
 sta _i
 lda _Temp+1
 sta _i+1
 lda 3,x
 sta _Temp+2
 jmp _Iop2
 endif
;
;------------------
;
 ifdef _F.Io1
_Iop1 lda 0,x
 sta _j
 lda 1,x
 sta _j+1
 lda 2,x
 sta _i
 lda 3,x
 sta _i+1
 lda _i+1
 eor _j+1
 sta _Temp+2
 lda _i+1
 bpl _Iop1a
 sec
 lda #0
 sbc _i
 sta _i
 lda #0
 sbc _i+1
 sta _i+1
_Iop1a lda _j+1
 bpl _Iop1b
 sec
 lda #0
 sbc _j
 sta _j
 lda #0
 sbc _j+1
 sta _j+1
_Iop1b lda #0
 sta _Temp
 sta _Temp+1
 rts
 endif
;
;----------------------
;
 ifdef _F.Io2
_Iop2 lda _Temp+2
 bpl _Iop2a
 sec
 lda #0
 sbc _i
 sta _i
 lda #0
 sbc _i+1
 sta _i+1
_Iop2a lda _i
 sta 2,x
 lda _i+1
 sta 3,x
 inx
 inx
 rts
 endif
;
;---------------------------
;
 ifdef _F.Puw
_PushW clc
 pla
 sta _i
 adc #>2
 tay
 pla
 sta _i+1
 adc #<2
 pha
 tya
 pha
 ldy #1
 lda (_i),y
 sta _j
 iny
 lda (_i),y
 sta _j+1
 dex
 dex
 ldy #0
 lda (_j),y
 sta 0,x
 iny
 lda (_j),y
 sta 1,x
 rts
 endif
;
;----------------------
;
 ifdef _F.Pow
_PopW clc
 pla
 sta _i
 adc #>2
 tay
 pla
 sta _i+1
 adc #<2
 pha
 tya
 pha
 ldy #1
 lda (_i),y
 sta _j
 iny
 lda (_i),y
 sta _j+1
 ldy #0
 lda 0,x
 sta (_j),y
 iny
 lda 1,x
 sta (_j),y
 inx
 inx
 rts
 endif
;
;----------------------
;
 ifdef _F.Pu
_Push pla
 sta _i
 pla
 sta _i+1
 clc
 lda _i
 adc #>2
 tay
 lda _i+1
 adc #<2
 pha
 tya
 pha
 ldy #1
 lda (_i),y
 sta _j
 iny
 lda (_i),y
 sta _j+1
 ldy #7
_Push1 dex
 lda (_j),y
 sta 0,x
 dey
 bpl _Push1
 rts
 endif
;
;--------------------
;
 ifdef _F.Po
_Pop pla
 sta _i
 pla
 sta _i+1
 clc
 lda _i
 adc #>2
 tay
 lda _i+1
 adc #<2
 pha
 tya
 pha
 ldy #1
 lda (_i),y
 sta _j
 iny
 lda (_i),y
 sta _j+1
 ldy #0
_Pop1 lda 0,x
 inx
 sta (_j),y
 iny
 cpy #8
 bne _Pop1
 rts
 endif
;
;----------------------
;
 ifdef _F.Tru
_Trunc lda 0,x
 and #$10
 beq _Trun1
 lda #0
 sta 0,x
 sta 1,x
 sta 2,x
 sta 3,x
 sta 4,x
 sta 5,x
 sta 6,x
 sta 7,x
 rts
_Trun1 lda 7,x
 jsr _BcdBin
 sta _i
 txa
 tay
_Trun2 inc _i
 lda _i
 cmp #13
 bcc *+3
 rts
 lda 6,y
 and #$f0
 sta 6,y
 inc _i
 lda _i
 cmp #13
 bcc *+3
 rts
 lda #0
 sta 6,y
 dey
 jmp _Trun2
 endif
;
