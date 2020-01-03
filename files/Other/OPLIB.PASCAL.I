;
;********************************************************
;*                                                      *
;*    LIBRARY SOURCE CODE for Kyan Pascal version 2.0   *
;*                                                      *
;*        Copyright (c) 1986 by Kyan Software, Inc.     *
;*                                                      *
;********************************************************
;
;
;--------------------------------------
;       Optimizer Macros:
;
_OpGcw Macro    ;Assign Global Constant Word
 lda #>&2
 sta _Global-&1
 lda #<&2
 sta _Global+1-&1
 EndM
;
_OpGcb Macro    ;Assign Global Constant Byte
 lda #&2
 sta _Global-&1
 EndM
;
_OpSgw Macro    ;Swap Global Words
 lda _Global-&2
 sta _Global-&1
 lda _Global+1-&2
 sta _Global+1-&1
 EndM
;
_OpSgb Macro    ;Swap Global Bytes
 lda _Global-&2
 sta _Global-&1
 EndM
;
_Opag  Macro    ;TOS:=TOS+Global &2=0,add &2=1,subtract
 IfNe &2        ;subtract
 sec
 lda 0,x
 sbc _Global-&1
 sta 0,x
 lda 1,x
 sbc _Global+1-&1
 sta 1,x
 else
 clc
 lda 0,x
 adc _Global-&1
 sta 0,x
 lda 1,x
 adc _Global+1-&1
 sta 1,x
 EndIf
 EndM
;
_Opac  Macro    ;Add Constant Word to TOS
 clc
 lda #>&1
 adc 0,x
 sta 0,x
 lda #<&1
 adc 1,x
 sta 1,x
 EndM
;
_Opgg  Macro    ;&1:=&2+&3 (&1:=&2-&3 &4<>0)
 ifne &4
 sec
 lda _Global-&2
 sbc _Global-&3
 sta _Global-&1
 lda _Global+1-&2
 sbc _Global+1-&3
 sta _Global+1-&1
 else
 clc
 lda _Global-&2
 adc _Global-&3
 sta _Global-&1
 lda _Global+1-&2
 adc _Global+1-&3
 sta _Global+1-&1
 EndIf
 EndM
;
_Opggg Macro    ;Global Triple: &5+/- &2,&3  &6+/-&3,&4
 ifne &5
 sec
 lda _Global-&2
 sbc _Global-&3
 pha
 lda _Global+1-&2
 sbc _Global+1-&3
 tay
 else
 clc
 lda _Global-&2
 adc _Global-&3
 pha
 lda _Global+1-&2
 adc _Global+1-&3
 tay
 endif
;
 ifne &6
 sec
 pla
 sbc _Global-&4
 sta _Global-&1
 tya
 sbc _Global+1-&4
 sta _Global+1-&1
 else
 clc
 pla
 adc _Global-&4
 sta _Global-&1
 tya
 adc _Global+1-&4
 sta _Global+1-&1
 EndIf
 EndM
;
_Opgc  Macro    ;Add Global and Constant Word (&4=0+,&4<>0 c-g)
 ifne &4        ;c-g
 sec
 lda #>&3
 sbc _Global-&2
 sta _Global-&1
 lda #<&3
 sbc _Global+1-&2 
 sta _Global+1-&1
 else
 clc
 lda #>&3
 adc _Global-&2
 sta _Global-&1
 lda #<&3
 adc _Global+1-&2
 sta _Global+1-&1
 endif
 EndM
;
_Opggc Macro    ;GGC:&5=0+
 ifne &5        ;c-g2
 sec
 lda #>&4
 sbc _Global-&2
 pha
 lda #<&4
 sbc _Global+1-&2
 tay
 else           ;c+g2
 clc
 lda #>&4
 adc _Global-&2
 pha
 lda #<&4
 adc _Global+1-&2
 tay
 endif
;
 ifne &6        ;intermed-g3
 sec
 pla
 sbc _Global-&3
 sta _Global-&1
 tya
 sbc _Global+1-&3
 sta _Global+1-&1
 else           ;intermed+g3
 clc
 pla
 adc _Global-&3
 sta _Global-&1
 tya
 adc _Global+1-&3
 sta _Global+1-&1
 endif
 EndM
;
_OpIav Macro    ;Index array by variable index
 lda _Global-&2
 sta _r0
 lda _Global+1-&2
 sta _r0+1
 ifne &3
 sec
 lda _r0
 sbc #>&3
 sta _r0
 lda _r0+1
 sbc #<&3
 sta _r0+1
 endif
 ifne &4
 asl _r0
 rol _r0+1
 endif
 dex
 dex
 clc
 lda #>_Global-&1
 adc _r0
 sta 0,x
 lda #<_Global-&1
 adc _r0+1
 sta 1,x
 EndM
;
;
;--------------------------------------
;       Compiler Macros:
;
_abi Macro
_F.Abi Dflag
 jsr _P.Abi
 EndM

_abr Macro
_F.Abr Dflag
 jsr _P.Abr
 EndM

_adi Macro
_F.Adi Dflag
 jsr _P.Adi
 EndM

_adr Macro
_F.Adr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Adr
 EndM

* begin new
_ana Macro
_F.Ana Dflag
 jsr _P.Ana
 EndM
* end new

_and Macro
_F.And Dflag
 jsr _P.And
 EndM

_arc Macro
_F.Arctan Dflag
_F.Po Dflag
_F.Pu Dflag
_F.Gtr Dflag
_F.Adr Dflag
_F.Sbr DFlag
_F.Mpr Dflag
_F.Dvr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Arctan
 EndM

_beq Macro
_F.Beq Dflag
 jsr _P.Beq
 beq _&1
 EndM

_cgb Macro
 lda _Global-&1
 cmp _Global-&2
 beq _&3
 EndM

_cgw Macro
 lda _Global-&1
 cmp _Global-&2
 bne *+10
 lda _Global-&1+1
 cmp _Global-&2+1
 beq _&3
 EndM

_chk Macro
_F.CkLo Dflag
_F.CkHi Dflag
 lda #>&1
 ldy #<&1
 jsr _P.CkLo
 lda #>&2-&1
 ldy #<&2-&1
 jsr _P.CkHi
 EndM

_chn Macro
_F.Chain Dflag
_F.Cl Dflag
_F.Clo Dflag
_F.Dis Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Chain
 EndM

_clb Macro
_F.Llb Dflag
_F.Beq Dflag
 lda #>_&4+5-&1
 ldy #<_&4+5-&1
 jsr _P.Llb
 lda #>_&4+5-&2
 ldy #<_&4+5-&2
 jsr _P.Llb
 jsr _P.Beq
 beq _&3
 EndM

_clw Macro
_F.Llw Dflag
_F.Beq Dflag
 lda #>_&4+5-&1
 ldy #<_&4+5-&1
 jsr _P.Llw
 lda #>_&4+5-&2
 ldy #<_&4+5-&2
 jsr _P.Llw
 jsr _P.Beq
 beq _&3
 EndM

_cos Macro
_F.Cos Dflag
_F.Po Dflag
_F.Pu Dflag
_F.Pow Dflag
_F.Puw Dflag
_F.Adr DFlag
_F.Sbr Dflag
_F.Mpr Dflag
_F.Dvr Dflag
_F.Fix Dflag
_F.Flt Dflag
_F.Tru Dflag
_F.Cork Dflag
_F.UnCork Dflag
_F.BCD Dflag
_Float Dflag
_F.Sin Dflag
 jsr _P.Cos
 EndM

_ddo Macro
_F.Ddo Dflag
 lda #>_&1
 ldy #<_&1
 jsr _P.Ddo
 EndM

_dgb Macro
 dec _Global-&1
 EndM

_dgw Macro
 lda _Global-&1
 bne *+5
 dec _Global-&1+1
 dec _Global-&1
 EndM

_dis Macro
_F.Dis Dflag
 jsr _P.Dis
 EndM

_dlb Macro
_F.Dlb Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Dlb
 EndM

_dlw Macro
_F.Dlw Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Dlw
 EndM

_dvi Macro
_F.Dvi Dflag
_F.Io1 Dflag
_F.Io2 Dflag
 jsr _P.Dvi
 EndM

_dvr Macro
_F.Dvr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Dvr
 EndM

_end Macro
_F.End Dflag
_F.CL Dflag
_F.Clo Dflag
_F.Dis Dflag
_&1 equ &2
 lda #>&2+5
 ldy #<&2+5
 jmp _P.End
 EndM

_eof Macro
_F.Eof Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Eof
 EndM

_eol Macro
_F.Eoln Dflag
_F.get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Eoln
 EndM

_eq Macro
_F.Eq Dflag
 jsr _P.Eq
 EndM

_eqr Macro
_F.Eqr Dflag
_F.Sbr Dflag
_F.UnCork Dflag
_F.Cork Dflag
 jsr _P.Eqr
 EndM

_eqs Macro
_F.Eqs Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Eqs
 EndM

_equ Macro
_&1 equ &2
 EndM

_err Macro
 lda #&1
 jsr _P.Error
 EndM

_exp Macro
_F.Exp Dflag
_F.Dvi Dflag
_F.Io1 Dflag
_F.Io2 Dflag
_F.BBD Dflag
_F.BCD Dflag
_F.Fix Dflag
_F.Po Dflag
_F.Pu Dflag
_F.Ler Dflag
_F.Gtr Dflag
_F.Adr Dflag
_F.Sbr Dflag
_F.Mpr Dflag
_F.Dvr Dflag
_F.UnCork Dflag
_F.Cork Dflag
_Float Dflag
_F.PoW Dflag
_F.PuW Dflag
_F.Adx Dflag
_F.Flt Dflag
 jsr _P.Exp
 EndM

_fld Macro
 clc
 lda 0,x
 adc #>&1
 sta 0,x
 lda 1,x
 adc #<&1
 sta 1,x
 EndM

_fln Macro
_F.Fln Dflag
_F.Flt Dflag
 jsr _P.Fln
 EndM

_flt Macro
_F.Flt Dflag
 jsr _P.Flt
 EndM

_fun Macro
 sec
 lda _Sp
 sbc #>&1
 sta _Sp
 lda _Sp+1
 sbc #<&1
 sta _Sp+1
 EndM

_gei Macro
_F.Gei Dflag
 jsr _P.Gei
 EndM

_ger Macro
_F.Ger Dflag
_F.Sbr Dflag
_F.UnCork Dflag
_F.Cork Dflag
 jsr _P.Ger
 EndM

_ges Macro
_F.Ges Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Ges
 EndM

_get Macro
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Get
 EndM

_go Macro
_F.Go Dflag
_F.Cl Dflag
_F.Clo Dflag
_F.Dis Dflag
 lda #&2
 jsr _P.Go
 jmp _&1
 EndM

_gti Macro
_F.Gti Dflag
 jsr _P.Gti
 EndM

_gtr Macro
_F.Gtr Dflag
 jsr _P.Gtr
 EndM

_gts Macro
_F.Gts Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Gts
 EndM

_fjp Macro
_F.Fjp Dflag
 lda #>_&1
 ldy #<_&1
 jsr _P.Fjp
 EndM

_igb Macro
 inc _Global-&1
 EndM

_igw Macro
 inc _Global-&1
 bne *+5
 inc _Global-&1+1
 EndM

_ilb Macro
_F.Ilb Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Ilb
 EndM

_ilw Macro
_F.Ilw Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Ilw
 EndM

_inp Macro
_F.Push Dflag
 lda #>_InpAdr
 ldy #<_InpAdr
 jsr _P.Push
 EndM

_jmp Macro
 jmp _&1
 EndM

_jsr Macro
 jsr _&1
 EndM

_lbl Macro
_&1 equ *
 EndM

_lcr Macro
_F.Lcr Dflag
 jsr _P.Lcr
 EndM

_lcw Macro
_F.Push Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Push
 EndM

_ldb Macro
 lda (0,x)
 sta 0,x
 lda #0
 sta 1,x
 EndM

_ldr Macro
_F.Ldr Dflag
 jsr _P.Ldr
 EndM

_ldw Macro
_F.Ldw Dflag
 jsr _P.Ldw
 EndM

_lei Macro
_F.Lei Dflag
 jsr _P.Lei
 EndM

_ler Macro
_F.Ler Dflag
_F.Sbr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Ler
 EndM

_les Macro
_F.Les Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Les
 EndM

_lga Macro
_F.Push Dflag
 lda #>_Global-&1
 ldy #<_Global-&1
 jsr _P.Push
 EndM

_lgb Macro
 dex
 dex
 lda _Global-&1
 sta 0,x
 lda #0
 sta 1,x
 EndM

_lgw Macro
 dex
 dex
 lda _Global-&1
 sta 0,x
 lda _Global-&1+1
 sta 1,x
 EndM

_lia Macro
 dex
 dex
 lda _Local
 sta _t
 lda _Local+1
 sta _t+1
 ldy #0
 lda (_t),y
 iny
 cmp #&2
 beq *+16
 lda (_t),y
 pha
 iny
 lda (_t),y
 sta _t+1
 pla
 sta _t
 jmp *-20
 clc
 lda _t
 adc #>_&3+5-&1
 sta 0,x
 iny
 lda _t+1
 adc #<_&3+5-&1
 sta 1,x
 EndM

_lin Macro
_F.Lin Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Lin
 EndM

_ln Macro
_F.Ln Dflag
_F.Adr Dflag
_F.Sbr Dflag
_F.Mpr Dflag
_F.Dvr Dflag
_F.Flt Dflag
_F.Cork Dflag
_F.UnCork Dflag
_F.Po Dflag
_F.Pu Dflag
_F.Pow Dflag
_F.Puw Dflag
_F.InXp Dflag
_F.Gtr Dflag
_F.BCD Dflag
 jsr _P.Ln
 EndM

_lnk Macro
_F.Lnk Dflag
 lda #>_&2+5-&3
 ldy #<_&2+5-&3
 jsr _P.Lnk
 ldy #0
 lda #&1
 sta (_Sp),y
 EndM

_lla Macro
_F.Lla Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Lla
 EndM

_lpa Macro
_F.Lpa Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Lpa
 EndM

_lsa Macro
_F.Push Dflag
 lda #>*+10
 ldy #<*+8
 jsr _P.Push
 jmp *+&1+3
 EndM

_lti Macro
_F.Lti Dflag
 jsr _P.Lti
 EndM

_ltr Macro
_F.Ltr Dflag
_F.Sbr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Ltr
 EndM

_lts Macro
_F.Lts Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Lts
 EndM

_max Macro
 lda #>&1
 cmp 0,x
 lda #<&1
 sbc 1,x
 bcs *+7
 lda #2
 jsr _P.Error
 EndM

_min Macro
 sec
 lda 0,x
 sbc #>&1
 sta 0,x
 lda 1,x
 sbc #<&1
 sta 1,x
 EndM

_mod Macro
_F.Mod Dflag
_F.Io1 Dflag
_F.Io2 Dflag
 jsr _P.Mod
 EndM

_mov Macro
_F.Stm Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Stm
 EndM

_mpi Macro
_F.Mpi Dflag
_F.Io1 Dflag
_F.Io2 Dflag
 jsr _P.Mpi
 EndM

_mpr Macro
_F.Mpr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Mpr
 EndM

_ndx Macro
_F.Ixm Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Ixm
 EndM

_ndxb Macro
 clc
 lda 2,x
 adc 0,x
 sta 2,x
 lda 3,x
 adc 1,x
 sta 3,x
 inx
 inx
 EndM

_ndxw Macro
 asl 0,x
 rol 1,x
 clc
 lda 2,x
 adc 0,x
 sta 2,x
 lda 3,x
 adc 1,x
 sta 3,x
 inx
 inx
 EndM

_ne Macro
_F.Ne Dflag
 jsr _P.Ne
 EndM

_ner Macro
_F.Ner Dflag
_F.Sbr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Ner
 EndM

_nes Macro
_F.Nes Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Nes
 EndM

_new Macro
_F.New Dflag
 lda #>&1
 ldy #<&1
 jsr _P.New
 EndM

_ngi Macro
_F.Ngi Dflag
 jsr _P.Ngi
 EndM

_ngr Macro
_F.Ngr Dflag
 jsr _P.Ngr
 EndM

_odd Macro
_F.Odd Dflag
 jsr _P.Odd
 EndM

_not Macro
_F.Not Dflag
 jsr _P.Not
 EndM

_or Macro
_F.Or Dflag
 jsr _P.Or
 EndM

* begin new
_ora Macro
_F.Ora Dflag
 jsr _P.Ora
 EndM
* end new

_out Macro
_F.Push Dflag
 lda #>_OutAdr
 ldy #<_OutAdr
 jsr _P.Push
 EndM

_pag Macro
_F.Pag Dflag
_F.PuA Dflag
_F.Wrf Dflag
_F.FParm Dflag
 jsr _P.Pag
 EndM

_prd Macro
_F.Prd Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Prd
 EndM

_put Macro
_F.Put Dflag
_F.FParm Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Put
 EndM

_rdc Macro
_F.Rdc Dflag
_F.EoA Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Rdc
 EndM

_rdf Macro
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Rdf
 EndM

_rdi Macro
_F.Rdi Dflag
_F.EoA Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Rdi
 EndM

_rdl Macro
_F.Rdl Dflag
_F.ENA Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Rdl
 EndM

_rdr Macro
_F.Rdr Dflag
_F.EoA Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Rdr
 EndM

_rdv Macro
_F.Rdv Dflag
_F.Stm Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Rdv
 EndM

_res Macro
_F.Res Dflag
_F.Fil Dflag
_F.New Dflag
_F.Dis Dflag
_F.Sup Dflag
_F.Open Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
 jsr _P.Res
 EndM

_rew Macro
_F.Rew Dflag
_F.Sup Dflag
_F.New Dflag
_F.Dis Dflag
_F.Fil Dflag
_F.Open Dflag
_F.Create Dflag
_F.Fcl Dflag
 jsr _P.Rew
 EndM

_rds Macro
_F.Rds Dflag
_F.ENA Dflag
_F.EoA Dflag
_F.Get Dflag
_F.Rdf Dflag
_F.FParm Dflag
_F.Eol Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Rds
 EndM

_rou Macro
_F.Rou Dflag
_F.Adr Dflag
_F.Cork Dflag
_F.UnCork Dflag
_F.Fix Dflag
_F.Lcr Dflag
 jsr _P.Rou
 EndM

_sbi Macro
_F.Sbi Dflag
 jsr _P.Sbi
 EndM

_sbr Macro
_F.Sbr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Sbr
 EndM

_see Macro
_F.Seek Dflag
_F.Mpi Dflag
_F.Io1 Dflag
_F.Io2 Dflag
_F.FParm Dflag
 jsr _P.Seek
 EndM

_sgb Macro
 lda 0,x
 sta _Global-&1
 inx
 inx
 EndM

_sgw Macro
 lda 0,x
 sta _Global-&1
 lda 1,x
 sta _Global-&1+1
 inx
 inx
 EndM

_sin Macro
_F.Sin Dflag
_F.Po Dflag
_F.Pu Dflag
_F.Float Dflag
_F.Sbr Dflag
_F.Adr Dflag
_F.Mpr Dflag
_F.Cork Dflag
_F.UnCork Dflag
_F.Fix Dflag
_F.Tru Dflag
_F.BCD Dflag
 jsr _P.Sin
 EndM

_slb Macro
_F.Slb Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Slb
 EndM

_slw Macro
_F.Slw Dflag
 lda #>_&2+5-&1
 ldy #<_&2+5-&1
 jsr _P.Slw
 EndM

_sqi Macro
_F.Sqi Dflag
_F.Mpi Dflag
_F.Io1 Dflag
_F.Io2 Dflag
 jsr _P.Sqi
 EndM

_sqr Macro
_F.Sqr Dflag
_F.Mpr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Sqr
 EndM

_sqt Macro
_F.Sqt Dflag
_F.Po Dflag
_F.Pu Dflag
_F.Adx Dflag
_F.Adr Dflag
_F.Dvr Dflag
_F.Mpr Dflag
_F.InXP Dflag
_F.PoW Dflag
_F.PuW Dflag
_F.Float Dflag
_F.Cork Dflag
_F.UnCork Dflag
_F.BBD Dflag
_F.BCD Dflag
 jsr _P.Sqt
 EndM

_stb Macro
_F.Stb Dflag
 jsr _P.Stb
 EndM

_str Macro
_F.Str Dflag
 jsr _P.Str
 EndM

_stw Macro
_F.Stw Dflag
 jsr _P.Stw
 EndM

_scc Macro
_F.Scc Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Scc
 EndM

_tdo Macro
 lda 0,x
 cmp 2,x
 lda 3,x
 eor #$80
 sta _t
 lda 1,x
 eor #$80
 sbc _t
 bcs *+9
 inx
 inx
 inx
 inx
 jmp _&1
 EndM

_tru Macro
_F.Fix Dflag
 jsr _P.Fix
 EndM

_wrb Macro
_F.Wrb Dflag
_F.Wrs Dflag
_F.PuA Dflag
_F.FParm Dflag
 jsr _P.Wrb
 EndM

_wrc Macro
_F.Wrc Dflag
_F.PuA Dflag
_F.FParm Dflag
 jsr _P.Wrc
 EndM

_wre Macro
_F.Wre Dflag
_F.Put Dflag
_F.FParm Dflag
 lda #&1
 jsr _P.Wre
 EndM

_wrf Macro
_F.Wrf Dflag
_F.FParm Dflag
 jsr _P.Wrf
 EndM

_wri Macro
_F.Wri Dflag
_F.PuA Dflag
_F.FParm Dflag
 jsr _P.Wri
 EndM

_wrl Macro
_F.Wrl Dflag
_F.PuA Dflag
_F.FParm Dflag
 jsr _P.Wrl
 EndM

_wrr Macro
_F.Wrr Dflag
_F.PuA Dflag
_F.FParm Dflag
_F.InXP Dflag
_F.RnE Dflag
_F.Dup Dflag
_F.Lcr Dflag
_F.Adr Dflag
_F.Cork Dflag
_F.UnCork Dflag
_F.Fix Dflag
_F.BBD Dflag
_F.BCD Dflag
_F.Adx Dflag
 jsr _P.Wrr
 EndM

_wrs Macro
_F.Wrs Dflag
_F.PuA Dflag
_F.FParm Dflag
 lda #>&1
 ldy #<&1
 jsr _P.Wrs
 EndM

_wrv Macro
_F.Wrv Dflag
_F.Stm Dflag
_F.Put Dflag
_F.FParm Dflag
 lda #>0-&1
 ldy #<0-&1
 jsr _P.Wrv
 EndM

_wrx Macro
_F.Wrx Dflag
_F.PuA Dflag
_F.FParm Dflag
_F.BCD Dflag
_F.RnE Dflag
_F.Adx Dflag
_F.BBD Dflag
_F.Lcr Dflag
_F.Adr Dflag
_F.Cork Dflag
_F.UnCork Dflag
 jsr _P.Wrx
 EndM

_zdf Macro
_F.Zdf Dflag
 jsr _P.Zdf
 EndM

_zem Macro
_F.Zem Dflag
 jsr _P.Zem
 EndM

_zeq Macro
_F.Zeq Dflag
 jsr _P.Zeq
 EndM

_zin Macro
_F.Zin Dflag
 jsr _P.Zin
 EndM

_zld Macro
_F.Zld Dflag
 jsr _P.Zld
 EndM

_zne Macro
_F.Zne Dflag
_F.Zeq Dflag
_F.Not Dflag
 jsr _P.Zne
 EndM

_znt Macro
_F.Znt Dflag
 jsr _P.Znt
 EndM

_zsb Macro
_F.Zsb Dflag
 jsr _P.Zsb
 EndM

_zsg Macro
_F.Zsg Dflag
 jsr _P.Zsg
 EndM

_zsp Macro
_F.Zsp Dflag
 jsr _P.Zsp
 EndM

_zsr Macro
_F.Zsr Dflag
 jsr _P.Zsr
 EndM

_zst Macro
_F.Zst Dflag
 jsr _P.Zst
 EndM

_zun Macro
_F.Zun Dflag
 jsr _P.Zun
 EndM
;
;
;==========================================================
; Initialize system, based on values found in source file:
;
 ifndef _SystemFile
 ifndef _UsesHires
_Global equ $bf00
 org $800
 endif
 endif

 ifndef _SystemFile
 ifdef _UsesHires
_Global equ $2000
 org $4000
 endif
 endif

 ifdef _SystemFile
 ifndef _UsesHires
 ldx #0
_am1 lda $2000,x
 sta $be00,x
 inx
 bne _am1
 jmp $be0e
 lda #>$2000+_am3
 sta _r0
 lda #<$2000+_am3
 sta _r0+1
 lda #>$800
 sta _r1
 lda #<$800
 sta _r1+1
 ldx #<_lomem-_start+255
 ldy #0
_am2 lda (_r0),y
 sta (_r1),y
 iny
 bne _am2
 inc _r0+1
 inc _r1+1
 dex
 bne _am2
 jmp $800
_am3
_Global equ $bf00
 sys
 org $800
 endif
 endif

 ifdef _SystemFile
 ifdef _UsesHires
 lda #>_lomem-$4000+$2000+_mov3
 sta _r0
 lda #<_lomem-$4000+$2000+_mov3
 sta _r0+1
 lda #>_lomem
 sta _r1
 lda #<_lomem
 sta _r1+1
 ldx #<_lomem-$4000+255
 ldy #$ff
_bmov1 dec _r0+1
 dec _r1+1
_bmov2 lda (_r0),y
 sta (_r1),y
 dey
 cpy #$ff
 bne _bmov2
 dex
 bne _bmov1
 jmp $4000
_bmov3
_Global equ $2000
 sys
 org $4000
 endif
 endif

_start ldx #$ff
 txs

 ifdef _UsesHires
 lda #>$800
 ldy #<$800
 else
 lda #>_lomem
 ldy #<_lomem
 endif

 jsr _P.Init       ;initialize heap/stack Space

 ldx #0         ;eval stack init
 jsr _1         ;execute the Pascal program

_quit equ *
 jsr _mli  ;when done, return to KIX
 db $65
 dw *+2
 db 4
 db 0
 dw 0
 db 0
 dw 0
;
;
;
;===========================================================
;
_P.Init equ *
 sta _First.Free
 sty _First.Free+1
 lda #0
 tay
 sta (_First.free),y
 iny
 sta (_First.free),y
 clc
 lda _First.free
 adc #>2
 sta _Heap.top
 lda _First.free+1
 adc #<2
 sta _Heap.top+1
 lda #0
 sta _KbdStat
 sta _LineNumber
 sta _LineNumber+1
 sta _FilLst
 sta _FilLst+1
 lda #>_Global
 sta _Sp
 lda #<_Global
 sta _Sp+1
 lda #>_Quit
 sta $3f2
 lda #<_Quit
 sta $3f3
 eor #$a5
 sta $3f4
 rts
;
;
;
;===============================================================
;The following storage locations are used by the LIB routines.
;
;Only locations _t thru _t+14 are "safe" when assembly language
;programs are executing instead of Pascal.  ALL OTHER LOCATIONS
;ARE OFF LIMITS!!!!  TAMPERING WITH ANY OF THE POINTERS IN LOCATIONS
;$00 THRU $0D WILL CAUSE PASCAL TO BECOME HOPELESSLY LOST AND WANDER
;ABOUT AIMLESSLY
;
_InpAdr equ $101
_OutAdr equ $103
_SaveA ds 1
_SaveX ds 1
_SaveY ds 1
_P ds 10
_Q ds 10
_Work ds 8
_KbdStat ds 1
_KbdEln ds 1
_KbdEof ds 1
_KbdPtr ds 1
_Rdrx ds 1
_Buf ds 32
_CmdList ds 18
_X0 ds 8
_X1 ds 8
_X2 ds 8
_Xn ds 8
_F ds 8
_G ds 8
_Sgn ds 1
_N ds 2
_S ds 8
_W ds 8
_ExpP ds 8
_ExpQ ds 8
_R ds 8
_Z ds 8
_ExpX ds 8
_Yz ds 8
_N1 ds 1
_StrLen ds 2
_StrAdr ds 2
_BufSiz ds 2
_FilRec ds 2
_FilLst ds 2
_FilNam ds 2
_DosBuf ds 2
_FailSafe   ds 2
_LineNumber ds 2
_SeekByte   ds 1
_UseSeek    ds 1
_ISign      ds 1
;
_Unused equ 0
_Local  equ 2
_Sp     equ 4
_First.free equ 6
_BufAdr     equ 8
_FilAdr     equ 10
_Heap.Top   equ 12
;
_i      equ 14
_j      equ 16
_k      equ 18
_temp   equ 20
;
_t      equ 16
_r0     equ _temp
_r1     equ _temp+2
_r2     equ _temp+4
_r3     equ _temp+6
;
_size   equ _temp+2
_previous equ _temp+4
_pointer equ _temp+6
_flag   equ _temp+8
;
_RecSiz equ 22
_yBufAdr equ 2
_yBufSiz equ 4
_yDosBuf equ 6
_yFilNam equ 8
_yanon equ 10
_yeof equ 12
_yeoln equ 14
_yRefNum equ 16
_ytext equ 18
_yRewrite equ 20
;
;------------------------------------------
; Labels used by LIB routines:
;
_Cout   equ $fded
_Prntax equ $f941
_Crout  equ $fd8e
_GetLn1 equ $fd6f
_iobufr equ $0c00
_mli    equ $bf00
_prbyte equ $fdda
_prblnk equ $f948
;
;-----------------------------------------------
; Constants used by trig routines:
;
_One    db $01,$00,$00,$00,$00,$00,$00,$00
_Half   db $15,$00,$00,$00,$00,$00,$00,$01
_HalfPi db $01,$57,$07,$96,$32,$67,$95,$00
;
;-----------------------------------------------
; Table used by set routines:
;
_Bits   db 1,2,4,8,16,32,64,128
;
;-------------------------------------------------------
;The following routines are used often enough to be
;included by 'default' in the Pascal object code:
;
_PushTrue equ *
 dex
 dex
 lda #>1
 sta 0,x
 lda #<1
 sta 1,x
 rts
;
;
;
_PushFalse equ *
 dex
 dex
 lda #0
 sta 0,x
 sta 1,x
 rts
;
;
;
;=================================================
;This code handles run-time errors
;
; Error codes:
;
;  1 case index error
;  2 array index error
;  3 input error
;  4 file not open
;  5 range error
;  6 arithmetic overflow
;  7 pathname too long
;  8 end of file
;  9 cannot dispose
; 10 heap overflow
; 11 too many open files
; 12 cannot read from "output"
; 13 cannot write to "input"
;
;
_P.Error equ *
 pha
 jsr _ErrBanner
 pla
 asl
 tay
 lda _err0-2,y
 sta _r0
 lda _err0-1,y
 sta _r0+1
 jsr _Pstrout
 jsr _Crout
 jmp _Quit
;
;
;
_ErrBanner equ *
 jsr _errb1
 lda #':+$80
 jsr _cout
 lda #$a0
 jsr _cout
 rts
_errb1 equ *
 lda _LineNumber
 ora _LineNumber+1
 bne _errb2
 lda #>_errb3
 sta _r0
 lda #<_errb3
 sta _r0+1
 jsr _pstrout
 sec
 lda $1fe
 sbc #>2
 tax
 lda $1ff
 sbc #<2
 jsr _prntax
 rts
_errb2 equ *
 lda #>_errb4
 sta _r0
 lda #<_errb4
 sta _r0+1
 jsr _pstrout
 ldx _LineNumber
 ldy _LineNumber+1
 jsr _ErrInt
 rts
_errb3 str 'Stop at Address $'
_errb4 str 'Stop at Line '
;
;
;
_pstrout equ *
 ldy #0
 lda (_r0),y
 beq _pstr2
 tax
_pstr1 equ *
 iny
 lda (_r0),y
 jsr _chrout
 dex
 bne _pstr1
_pstr2 equ *
 rts
_err0 equ *
 dw _err01,_err02,_err03,_err04,_err05,_err06
 dw _err07,_err08,_err09,_err10,_err11
 dw _err12,_err13
;
;
_ErrInt equ *
 stx _r0
 sty _r0+1
_erri1 equ *
 ldx #4
_erri2 equ *
 lda _r0
 cmp _erri7-1,x
 lda _r0+1
 sbc _erri8-1,x
 bcs _erri3
 dex
 bne _erri2
 jmp _erri6
_erri3 equ *
 ldy #0
_erri4 equ *
 lda _r0
 cmp _erri7-1,x
 lda _r0+1
 sbc _erri8-1,x
 bcc _erri5
 lda _r0
 sbc _erri7-1,x
 sta _r0
 lda _r0+1
 sbc _erri8-1,x
 sta _r0+1
 iny
 jmp _erri4
_erri5 equ *
 tya
 ora #'0+$80
 jsr _cout
 dex
 bne _erri3
_erri6 equ *
 lda _r0
 ora #'0+$80
 jsr _cout
 rts
_erri7 equ *
 db >10,>100,>1000,>10000
_erri8 equ *
 db <10,<100,<1000,<10000
;
;
;
_mlierr equ *
 pha
 jsr _ErrBanner
 pla
 ldx #3
_mlir1 equ *
 cmp _mli4,x
 beq _mlir2
 inx
 inx
 inx
 cpx #69
 bne _mlir1
 pha
 lda #'$+$80
 jsr _cout
 pla
 jsr $fdda
 ldx #0
_mlir2 equ *
 lda _mli4+1,x
 sta _r0
 lda _mli4+2,x
 sta _r0+1
 jsr _pstrout
 jmp _Quit
_mli4 equ *
 db 0
 dw _mli00
 db $27
 dw _mli27
 db $28
 dw _mli28
 db $2b
 dw _mli2b
 db $40
 dw _mli40
 db $42
 dw _mli42
 db $43
 dw _mli43
 db $44
 dw _mli44
 db $45
 dw _mli45
 db $46
 dw _mli46
 db $47
 dw _mli47
 db $48
 dw _mli48
 db $49
 dw _mli49
 db $4a
 dw _mli4a
 db $4b
 dw _mli4b
 db $4c
 dw _mli4c
 db $4d
 dw _mli4d
 db $4e
 dw _mli4e
 db $50
 dw _mli50
 db $51
 dw _mli51
 db $52
 dw _mli52
 db $57
 dw _mli57
 db $5a
 dw _mli5a
;
;
_chrout equ *
 pha
 lda $fbb3
 cmp #6
 beq _chr2
 pla
 cmp #'a
 bcc _chr1
 cmp #'z+1
 bcs _chr1
 adc #32
_chr1 equ *
 pha
_chr2 equ *
 pla
 eor #$80
 jmp _cout
;
;
;-----------------------------------------
;Strings used by error handlers:
;
_err01  str 'Case Index Error'
_err02  str 'Array Index Error'
_err03  str 'Input Error'
_err04  str 'File Not Open'
_err05  str 'Range Error'
_err06  str 'Arithmetic Overflow'
_err07  str 'Pathname Too Long'
_err08  str 'End of File'
_err09  str 'Cannot Dispose'
_err10  str 'Heap Overflow'
_err11  str 'Too Many Open Files'
_err12  str 'Cannot READ from "output"'
_err13  str 'Cannot WRITE to "input"'
;
_mli00  str ' ProDOS Error'
_mli27  str 'I/O Error'
_mli28  str 'No Device Connected'
_mli2b  str 'Disk Write Protected'
_mli40  str 'Invalid Pathname'
_mli42  str 'Maximum Number of Files Open'
_mli43  str 'Invalid Reference Number'
_mli44  str 'Directory Not Found'
_mli45  str 'Volume Not Found'
_mli46  str 'File Not Found'
_mli47  str 'Duplicate Filename'
_mli48  str 'Volume Full'
_mli49  str 'Volume Directory Full'
_mli4a  str 'Incompatible File Format'
_mli4b  str 'Unsupported Storage Type'
_mli4c  str 'End of File Encountered'
_mli4d  str 'Position Out of Range'
_mli4e  str 'File Access Error'
_mli50  str 'File is Open'
_mli51  str 'Directory Structure Damage'
_mli52  str 'Not a ProDOS Volume'
_mli57  str 'Duplicate Volume'
_mli5a  str 'File Structure Damage'
;
;
;=====================================================
;
