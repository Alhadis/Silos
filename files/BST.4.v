From Coq Require Import String List ZArith.
From compcert Require Import Coqlib Integers Floats AST Ctypes Cop Clight Clightdefs.
Local Open Scope Z_scope.

Module Info.
  Definition version := "3.5"%string.
  Definition build_number := ""%string.
  Definition build_tag := ""%string.
  Definition arch := "x86"%string.
  Definition model := "32sse2"%string.
  Definition abi := "standard"%string.
  Definition bitsize := 32.
  Definition big_endian := false.
  Definition source_file := "BST.c"%string.
  Definition normalized := true.
End Info.

Definition ___builtin_ais_annot : ident := 7%positive.
Definition ___builtin_annot : ident := 14%positive.
Definition ___builtin_annot_intval : ident := 15%positive.
Definition ___builtin_bswap : ident := 8%positive.
Definition ___builtin_bswap16 : ident := 10%positive.
Definition ___builtin_bswap32 : ident := 9%positive.
Definition ___builtin_bswap64 : ident := 40%positive.
Definition ___builtin_clz : ident := 41%positive.
Definition ___builtin_clzl : ident := 42%positive.
Definition ___builtin_clzll : ident := 43%positive.
Definition ___builtin_ctz : ident := 44%positive.
Definition ___builtin_ctzl : ident := 45%positive.
Definition ___builtin_ctzll : ident := 46%positive.
Definition ___builtin_debug : ident := 58%positive.
Definition ___builtin_fabs : ident := 11%positive.
Definition ___builtin_fmadd : ident := 49%positive.
Definition ___builtin_fmax : ident := 47%positive.
Definition ___builtin_fmin : ident := 48%positive.
Definition ___builtin_fmsub : ident := 50%positive.
Definition ___builtin_fnmadd : ident := 51%positive.
Definition ___builtin_fnmsub : ident := 52%positive.
Definition ___builtin_fsqrt : ident := 12%positive.
Definition ___builtin_membar : ident := 16%positive.
Definition ___builtin_memcpy_aligned : ident := 13%positive.
Definition ___builtin_nop : ident := 57%positive.
Definition ___builtin_read16_reversed : ident := 53%positive.
Definition ___builtin_read32_reversed : ident := 54%positive.
Definition ___builtin_va_arg : ident := 18%positive.
Definition ___builtin_va_copy : ident := 19%positive.
Definition ___builtin_va_end : ident := 20%positive.
Definition ___builtin_va_start : ident := 17%positive.
Definition ___builtin_write16_reversed : ident := 55%positive.
Definition ___builtin_write32_reversed : ident := 56%positive.
Definition ___compcert_i64_dtos : ident := 25%positive.
Definition ___compcert_i64_dtou : ident := 26%positive.
Definition ___compcert_i64_sar : ident := 37%positive.
Definition ___compcert_i64_sdiv : ident := 31%positive.
Definition ___compcert_i64_shl : ident := 35%positive.
Definition ___compcert_i64_shr : ident := 36%positive.
Definition ___compcert_i64_smod : ident := 33%positive.
Definition ___compcert_i64_smulh : ident := 38%positive.
Definition ___compcert_i64_stod : ident := 27%positive.
Definition ___compcert_i64_stof : ident := 29%positive.
Definition ___compcert_i64_udiv : ident := 32%positive.
Definition ___compcert_i64_umod : ident := 34%positive.
Definition ___compcert_i64_umulh : ident := 39%positive.
Definition ___compcert_i64_utod : ident := 28%positive.
Definition ___compcert_i64_utof : ident := 30%positive.
Definition ___compcert_va_composite : ident := 24%positive.
Definition ___compcert_va_float64 : ident := 23%positive.
Definition ___compcert_va_int32 : ident := 21%positive.
Definition ___compcert_va_int64 : ident := 22%positive.
Definition ___print_tree : ident := 73%positive.
Definition ___stringlit_1 : ident := 74%positive.
Definition ___stringlit_2 : ident := 75%positive.
Definition ___stringlit_3 : ident := 79%positive.
Definition ___stringlit_4 : ident := 80%positive.
Definition ___stringlit_5 : ident := 81%positive.
Definition ___stringlit_6 : ident := 82%positive.
Definition ___stringlit_7 : ident := 83%positive.
Definition ___stringlit_8 : ident := 84%positive.
Definition ___stringlit_9 : ident := 85%positive.
Definition __node : ident := 3%positive.
Definition _begin : ident := 71%positive.
Definition _bst : ident := 77%positive.
Definition _current : ident := 68%positive.
Definition _end : ident := 72%positive.
Definition _insert : ident := 62%positive.
Definition _k : ident := 1%positive.
Definition _left : ident := 4%positive.
Definition _main : ident := 86%positive.
Definition _malloc : ident := 60%positive.
Definition _next : ident := 69%positive.
Definition _p : ident := 66%positive.
Definition _parent : ident := 6%positive.
Definition _prev : ident := 70%positive.
Definition _print_tree : ident := 76%positive.
Definition _printf : ident := 59%positive.
Definition _query_addr : ident := 64%positive.
Definition _query_value : ident := 63%positive.
Definition _right : ident := 5%positive.
Definition _root : ident := 61%positive.
Definition _set_by_addr : ident := 67%positive.
Definition _set_by_key : ident := 65%positive.
Definition _temp : ident := 78%positive.
Definition _v : ident := 2%positive.
Definition _t'1 : ident := 87%positive.
Definition _t'10 : ident := 96%positive.
Definition _t'11 : ident := 97%positive.
Definition _t'12 : ident := 98%positive.
Definition _t'13 : ident := 99%positive.
Definition _t'14 : ident := 100%positive.
Definition _t'15 : ident := 101%positive.
Definition _t'16 : ident := 102%positive.
Definition _t'17 : ident := 103%positive.
Definition _t'18 : ident := 104%positive.
Definition _t'19 : ident := 105%positive.
Definition _t'2 : ident := 88%positive.
Definition _t'20 : ident := 106%positive.
Definition _t'21 : ident := 107%positive.
Definition _t'22 : ident := 108%positive.
Definition _t'23 : ident := 109%positive.
Definition _t'24 : ident := 110%positive.
Definition _t'25 : ident := 111%positive.
Definition _t'26 : ident := 112%positive.
Definition _t'27 : ident := 113%positive.
Definition _t'28 : ident := 114%positive.
Definition _t'29 : ident := 115%positive.
Definition _t'3 : ident := 89%positive.
Definition _t'30 : ident := 116%positive.
Definition _t'31 : ident := 117%positive.
Definition _t'32 : ident := 118%positive.
Definition _t'33 : ident := 119%positive.
Definition _t'34 : ident := 120%positive.
Definition _t'35 : ident := 121%positive.
Definition _t'36 : ident := 122%positive.
Definition _t'37 : ident := 123%positive.
Definition _t'38 : ident := 124%positive.
Definition _t'39 : ident := 125%positive.
Definition _t'4 : ident := 90%positive.
Definition _t'40 : ident := 126%positive.
Definition _t'41 : ident := 127%positive.
Definition _t'42 : ident := 128%positive.
Definition _t'43 : ident := 129%positive.
Definition _t'44 : ident := 130%positive.
Definition _t'45 : ident := 131%positive.
Definition _t'46 : ident := 132%positive.
Definition _t'47 : ident := 133%positive.
Definition _t'5 : ident := 91%positive.
Definition _t'6 : ident := 92%positive.
Definition _t'7 : ident := 93%positive.
Definition _t'8 : ident := 94%positive.
Definition _t'9 : ident := 95%positive.

Definition v___stringlit_4 := {|
  gvar_info := (tarray tschar 20);
  gvar_init := (Init_int8 (Int.repr 81) :: Init_int8 (Int.repr 117) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 121) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 118) :: Init_int8 (Int.repr 97) ::
                Init_int8 (Int.repr 108) :: Init_int8 (Int.repr 117) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 37) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 58) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 37) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_7 := {|
  gvar_info := (tarray tschar 20);
  gvar_init := (Init_int8 (Int.repr 70) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 111) :: Init_int8 (Int.repr 109) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 98) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 103) ::
                Init_int8 (Int.repr 105) :: Init_int8 (Int.repr 110) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 116) ::
                Init_int8 (Int.repr 111) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 110) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 58) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_3 := {|
  gvar_info := (tarray tschar 34);
  gvar_init := (Init_int8 (Int.repr 83) :: Init_int8 (Int.repr 116) ::
                Init_int8 (Int.repr 97) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 116) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 116) :: Init_int8 (Int.repr 111) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 105) ::
                Init_int8 (Int.repr 110) :: Init_int8 (Int.repr 115) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 116) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 118) :: Init_int8 (Int.repr 97) ::
                Init_int8 (Int.repr 108) :: Init_int8 (Int.repr 117) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 115) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 105) ::
                Init_int8 (Int.repr 110) :: Init_int8 (Int.repr 116) ::
                Init_int8 (Int.repr 111) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 98) :: Init_int8 (Int.repr 115) ::
                Init_int8 (Int.repr 116) :: Init_int8 (Int.repr 46) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_5 := {|
  gvar_info := (tarray tschar 48);
  gvar_init := (Init_int8 (Int.repr 81) :: Init_int8 (Int.repr 117) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 121) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 97) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 115) ::
                Init_int8 (Int.repr 115) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 97) :: Init_int8 (Int.repr 110) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 116) :: Init_int8 (Int.repr 104) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 110) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 115) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 116) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 98) ::
                Init_int8 (Int.repr 121) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 97) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 115) ::
                Init_int8 (Int.repr 115) :: Init_int8 (Int.repr 58) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 40) ::
                Init_int8 (Int.repr 37) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 44) :: Init_int8 (Int.repr 37) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 41) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_8 := {|
  gvar_info := (tarray tschar 10);
  gvar_init := (Init_int8 (Int.repr 9) :: Init_int8 (Int.repr 40) ::
                Init_int8 (Int.repr 37) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 44) :: Init_int8 (Int.repr 37) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 41) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_2 := {|
  gvar_info := (tarray tschar 2);
  gvar_init := (Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_6 := {|
  gvar_info := (tarray tschar 19);
  gvar_init := (Init_int8 (Int.repr 83) :: Init_int8 (Int.repr 101) ::
                Init_int8 (Int.repr 116) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 98) :: Init_int8 (Int.repr 121) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 107) ::
                Init_int8 (Int.repr 101) :: Init_int8 (Int.repr 121) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 37) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 44) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 37) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 10) ::
                Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_9 := {|
  gvar_info := (tarray tschar 20);
  gvar_init := (Init_int8 (Int.repr 70) :: Init_int8 (Int.repr 114) ::
                Init_int8 (Int.repr 111) :: Init_int8 (Int.repr 109) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 101) ::
                Init_int8 (Int.repr 110) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 32) :: Init_int8 (Int.repr 116) ::
                Init_int8 (Int.repr 111) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 98) :: Init_int8 (Int.repr 101) ::
                Init_int8 (Int.repr 103) :: Init_int8 (Int.repr 105) ::
                Init_int8 (Int.repr 110) :: Init_int8 (Int.repr 58) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition v___stringlit_1 := {|
  gvar_info := (tarray tschar 9);
  gvar_init := (Init_int8 (Int.repr 40) :: Init_int8 (Int.repr 37) ::
                Init_int8 (Int.repr 100) :: Init_int8 (Int.repr 44) ::
                Init_int8 (Int.repr 37) :: Init_int8 (Int.repr 100) ::
                Init_int8 (Int.repr 41) :: Init_int8 (Int.repr 32) ::
                Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition f_insert := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (tptr (Tstruct __node noattr)))) ::
                (_k, tint) :: (_v, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'6, (tptr (Tstruct __node noattr))) ::
               (_t'5, (tptr tvoid)) ::
               (_t'4, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr tvoid)) ::
               (_t'2, (tptr (Tstruct __node noattr))) ::
               (_t'1, (tptr tvoid)) ::
               (_t'47, (tptr (Tstruct __node noattr))) ::
               (_t'46, (tptr (Tstruct __node noattr))) ::
               (_t'45, (tptr (Tstruct __node noattr))) ::
               (_t'44, (tptr (Tstruct __node noattr))) ::
               (_t'43, (tptr (Tstruct __node noattr))) ::
               (_t'42, (tptr (Tstruct __node noattr))) ::
               (_t'41, (tptr (Tstruct __node noattr))) ::
               (_t'40, (tptr (Tstruct __node noattr))) ::
               (_t'39, (tptr (Tstruct __node noattr))) ::
               (_t'38, (tptr (Tstruct __node noattr))) ::
               (_t'37, (tptr (Tstruct __node noattr))) ::
               (_t'36, (tptr (Tstruct __node noattr))) ::
               (_t'35, (tptr (Tstruct __node noattr))) ::
               (_t'34, (tptr (Tstruct __node noattr))) ::
               (_t'33, (tptr (Tstruct __node noattr))) ::
               (_t'32, (tptr (Tstruct __node noattr))) ::
               (_t'31, (tptr (Tstruct __node noattr))) ::
               (_t'30, (tptr (Tstruct __node noattr))) ::
               (_t'29, (tptr (Tstruct __node noattr))) ::
               (_t'28, (tptr (Tstruct __node noattr))) ::
               (_t'27, (tptr (Tstruct __node noattr))) ::
               (_t'26, (tptr (Tstruct __node noattr))) ::
               (_t'25, (tptr (Tstruct __node noattr))) ::
               (_t'24, (tptr (Tstruct __node noattr))) ::
               (_t'23, (tptr (Tstruct __node noattr))) ::
               (_t'22, (tptr (Tstruct __node noattr))) ::
               (_t'21, (tptr (Tstruct __node noattr))) ::
               (_t'20, (tptr (Tstruct __node noattr))) ::
               (_t'19, (tptr (Tstruct __node noattr))) ::
               (_t'18, (tptr (Tstruct __node noattr))) ::
               (_t'17, (tptr (Tstruct __node noattr))) ::
               (_t'16, (tptr (Tstruct __node noattr))) ::
               (_t'15, (tptr (Tstruct __node noattr))) ::
               (_t'14, (tptr (Tstruct __node noattr))) ::
               (_t'13, (tptr (Tstruct __node noattr))) ::
               (_t'12, (tptr (Tstruct __node noattr))) ::
               (_t'11, (tptr (Tstruct __node noattr))) :: (_t'10, tint) ::
               (_t'9, (tptr (Tstruct __node noattr))) :: (_t'8, tint) ::
               (_t'7, (tptr (Tstruct __node noattr))) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Sset _t'42
      (Ederef (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
        (tptr (Tstruct __node noattr))))
    (Sifthenelse (Ebinop Oeq (Etempvar _t'42 (tptr (Tstruct __node noattr)))
                   (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
      (Ssequence
        (Ssequence
          (Scall (Some _t'1)
            (Evar _malloc (Tfunction (Tcons tuint Tnil) (tptr tvoid)
                            cc_default))
            ((Esizeof (Tstruct __node noattr) tuint) :: nil))
          (Sassign
            (Ederef (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
              (tptr (Tstruct __node noattr)))
            (Ecast (Etempvar _t'1 (tptr tvoid))
              (tptr (Tstruct __node noattr)))))
        (Ssequence
          (Ssequence
            (Sset _t'47
              (Ederef (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                (tptr (Tstruct __node noattr))))
            (Sassign
              (Efield
                (Ederef (Etempvar _t'47 (tptr (Tstruct __node noattr)))
                  (Tstruct __node noattr)) _k tint) (Etempvar _k tint)))
          (Ssequence
            (Ssequence
              (Sset _t'46
                (Ederef
                  (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                  (tptr (Tstruct __node noattr))))
              (Sassign
                (Efield
                  (Ederef (Etempvar _t'46 (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _v tint) (Etempvar _v tint)))
            (Ssequence
              (Ssequence
                (Ssequence
                  (Sset _t'2
                    (Ecast
                      (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))
                      (tptr (Tstruct __node noattr))))
                  (Ssequence
                    (Sset _t'45
                      (Ederef
                        (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                        (tptr (Tstruct __node noattr))))
                    (Sassign
                      (Efield
                        (Ederef
                          (Etempvar _t'45 (tptr (Tstruct __node noattr)))
                          (Tstruct __node noattr)) _right
                        (tptr (Tstruct __node noattr)))
                      (Etempvar _t'2 (tptr (Tstruct __node noattr))))))
                (Ssequence
                  (Sset _t'44
                    (Ederef
                      (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                      (tptr (Tstruct __node noattr))))
                  (Sassign
                    (Efield
                      (Ederef (Etempvar _t'44 (tptr (Tstruct __node noattr)))
                        (Tstruct __node noattr)) _left
                      (tptr (Tstruct __node noattr)))
                    (Etempvar _t'2 (tptr (Tstruct __node noattr))))))
              (Ssequence
                (Ssequence
                  (Sset _t'43
                    (Ederef
                      (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                      (tptr (Tstruct __node noattr))))
                  (Sassign
                    (Efield
                      (Ederef (Etempvar _t'43 (tptr (Tstruct __node noattr)))
                        (Tstruct __node noattr)) _parent
                      (tptr (Tstruct __node noattr)))
                    (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))))
                (Sreturn None))))))
      Sskip))
  (Ssequence
    (Sset _t'7
      (Ederef (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
        (tptr (Tstruct __node noattr))))
    (Ssequence
      (Sset _t'8
        (Efield
          (Ederef (Etempvar _t'7 (tptr (Tstruct __node noattr)))
            (Tstruct __node noattr)) _k tint))
      (Sifthenelse (Ebinop Oeq (Etempvar _t'8 tint) (Etempvar _k tint) tint)
        (Ssequence
          (Sset _t'41
            (Ederef (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
              (tptr (Tstruct __node noattr))))
          (Sassign
            (Efield
              (Ederef (Etempvar _t'41 (tptr (Tstruct __node noattr)))
                (Tstruct __node noattr)) _v tint) (Etempvar _v tint)))
        (Ssequence
          (Sset _t'9
            (Ederef (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
              (tptr (Tstruct __node noattr))))
          (Ssequence
            (Sset _t'10
              (Efield
                (Ederef (Etempvar _t'9 (tptr (Tstruct __node noattr)))
                  (Tstruct __node noattr)) _k tint))
            (Sifthenelse (Ebinop Ogt (Etempvar _t'10 tint) (Etempvar _k tint)
                           tint)
              (Ssequence
                (Sset _t'26
                  (Ederef
                    (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                    (tptr (Tstruct __node noattr))))
                (Ssequence
                  (Sset _t'27
                    (Efield
                      (Ederef (Etempvar _t'26 (tptr (Tstruct __node noattr)))
                        (Tstruct __node noattr)) _left
                      (tptr (Tstruct __node noattr))))
                  (Sifthenelse (Ebinop Oeq
                                 (Etempvar _t'27 (tptr (Tstruct __node noattr)))
                                 (Ecast (Econst_int (Int.repr 0) tint)
                                   (tptr tvoid)) tint)
                    (Ssequence
                      (Ssequence
                        (Scall (Some _t'3)
                          (Evar _malloc (Tfunction (Tcons tuint Tnil)
                                          (tptr tvoid) cc_default))
                          ((Esizeof (Tstruct __node noattr) tuint) :: nil))
                        (Ssequence
                          (Sset _t'40
                            (Ederef
                              (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                              (tptr (Tstruct __node noattr))))
                          (Sassign
                            (Efield
                              (Ederef
                                (Etempvar _t'40 (tptr (Tstruct __node noattr)))
                                (Tstruct __node noattr)) _left
                              (tptr (Tstruct __node noattr)))
                            (Ecast (Etempvar _t'3 (tptr tvoid))
                              (tptr (Tstruct __node noattr))))))
                      (Ssequence
                        (Ssequence
                          (Sset _t'38
                            (Ederef
                              (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                              (tptr (Tstruct __node noattr))))
                          (Ssequence
                            (Sset _t'39
                              (Efield
                                (Ederef
                                  (Etempvar _t'38 (tptr (Tstruct __node noattr)))
                                  (Tstruct __node noattr)) _left
                                (tptr (Tstruct __node noattr))))
                            (Sassign
                              (Efield
                                (Ederef
                                  (Etempvar _t'39 (tptr (Tstruct __node noattr)))
                                  (Tstruct __node noattr)) _k tint)
                              (Etempvar _k tint))))
                        (Ssequence
                          (Ssequence
                            (Sset _t'36
                              (Ederef
                                (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                (tptr (Tstruct __node noattr))))
                            (Ssequence
                              (Sset _t'37
                                (Efield
                                  (Ederef
                                    (Etempvar _t'36 (tptr (Tstruct __node noattr)))
                                    (Tstruct __node noattr)) _left
                                  (tptr (Tstruct __node noattr))))
                              (Sassign
                                (Efield
                                  (Ederef
                                    (Etempvar _t'37 (tptr (Tstruct __node noattr)))
                                    (Tstruct __node noattr)) _v tint)
                                (Etempvar _v tint))))
                          (Ssequence
                            (Ssequence
                              (Ssequence
                                (Sset _t'4
                                  (Ecast
                                    (Ecast (Econst_int (Int.repr 0) tint)
                                      (tptr tvoid))
                                    (tptr (Tstruct __node noattr))))
                                (Ssequence
                                  (Sset _t'34
                                    (Ederef
                                      (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                      (tptr (Tstruct __node noattr))))
                                  (Ssequence
                                    (Sset _t'35
                                      (Efield
                                        (Ederef
                                          (Etempvar _t'34 (tptr (Tstruct __node noattr)))
                                          (Tstruct __node noattr)) _left
                                        (tptr (Tstruct __node noattr))))
                                    (Sassign
                                      (Efield
                                        (Ederef
                                          (Etempvar _t'35 (tptr (Tstruct __node noattr)))
                                          (Tstruct __node noattr)) _right
                                        (tptr (Tstruct __node noattr)))
                                      (Etempvar _t'4 (tptr (Tstruct __node noattr)))))))
                              (Ssequence
                                (Sset _t'32
                                  (Ederef
                                    (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                    (tptr (Tstruct __node noattr))))
                                (Ssequence
                                  (Sset _t'33
                                    (Efield
                                      (Ederef
                                        (Etempvar _t'32 (tptr (Tstruct __node noattr)))
                                        (Tstruct __node noattr)) _left
                                      (tptr (Tstruct __node noattr))))
                                  (Sassign
                                    (Efield
                                      (Ederef
                                        (Etempvar _t'33 (tptr (Tstruct __node noattr)))
                                        (Tstruct __node noattr)) _left
                                      (tptr (Tstruct __node noattr)))
                                    (Etempvar _t'4 (tptr (Tstruct __node noattr)))))))
                            (Ssequence
                              (Sset _t'29
                                (Ederef
                                  (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                  (tptr (Tstruct __node noattr))))
                              (Ssequence
                                (Sset _t'30
                                  (Efield
                                    (Ederef
                                      (Etempvar _t'29 (tptr (Tstruct __node noattr)))
                                      (Tstruct __node noattr)) _left
                                    (tptr (Tstruct __node noattr))))
                                (Ssequence
                                  (Sset _t'31
                                    (Ederef
                                      (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                      (tptr (Tstruct __node noattr))))
                                  (Sassign
                                    (Efield
                                      (Ederef
                                        (Etempvar _t'30 (tptr (Tstruct __node noattr)))
                                        (Tstruct __node noattr)) _parent
                                      (tptr (Tstruct __node noattr)))
                                    (Etempvar _t'31 (tptr (Tstruct __node noattr)))))))))))
                    (Ssequence
                      (Sset _t'28
                        (Ederef
                          (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                          (tptr (Tstruct __node noattr))))
                      (Scall None
                        (Evar _insert (Tfunction
                                        (Tcons
                                          (tptr (tptr (Tstruct __node noattr)))
                                          (Tcons tint (Tcons tint Tnil)))
                                        tvoid cc_default))
                        ((Eaddrof
                           (Efield
                             (Ederef
                               (Etempvar _t'28 (tptr (Tstruct __node noattr)))
                               (Tstruct __node noattr)) _left
                             (tptr (Tstruct __node noattr)))
                           (tptr (tptr (Tstruct __node noattr)))) ::
                         (Etempvar _k tint) :: (Etempvar _v tint) :: nil))))))
              (Ssequence
                (Sset _t'11
                  (Ederef
                    (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                    (tptr (Tstruct __node noattr))))
                (Ssequence
                  (Sset _t'12
                    (Efield
                      (Ederef (Etempvar _t'11 (tptr (Tstruct __node noattr)))
                        (Tstruct __node noattr)) _right
                      (tptr (Tstruct __node noattr))))
                  (Sifthenelse (Ebinop Oeq
                                 (Etempvar _t'12 (tptr (Tstruct __node noattr)))
                                 (Ecast (Econst_int (Int.repr 0) tint)
                                   (tptr tvoid)) tint)
                    (Ssequence
                      (Ssequence
                        (Scall (Some _t'5)
                          (Evar _malloc (Tfunction (Tcons tuint Tnil)
                                          (tptr tvoid) cc_default))
                          ((Esizeof (Tstruct __node noattr) tuint) :: nil))
                        (Ssequence
                          (Sset _t'25
                            (Ederef
                              (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                              (tptr (Tstruct __node noattr))))
                          (Sassign
                            (Efield
                              (Ederef
                                (Etempvar _t'25 (tptr (Tstruct __node noattr)))
                                (Tstruct __node noattr)) _right
                              (tptr (Tstruct __node noattr)))
                            (Ecast (Etempvar _t'5 (tptr tvoid))
                              (tptr (Tstruct __node noattr))))))
                      (Ssequence
                        (Ssequence
                          (Sset _t'23
                            (Ederef
                              (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                              (tptr (Tstruct __node noattr))))
                          (Ssequence
                            (Sset _t'24
                              (Efield
                                (Ederef
                                  (Etempvar _t'23 (tptr (Tstruct __node noattr)))
                                  (Tstruct __node noattr)) _right
                                (tptr (Tstruct __node noattr))))
                            (Sassign
                              (Efield
                                (Ederef
                                  (Etempvar _t'24 (tptr (Tstruct __node noattr)))
                                  (Tstruct __node noattr)) _k tint)
                              (Etempvar _k tint))))
                        (Ssequence
                          (Ssequence
                            (Sset _t'21
                              (Ederef
                                (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                (tptr (Tstruct __node noattr))))
                            (Ssequence
                              (Sset _t'22
                                (Efield
                                  (Ederef
                                    (Etempvar _t'21 (tptr (Tstruct __node noattr)))
                                    (Tstruct __node noattr)) _right
                                  (tptr (Tstruct __node noattr))))
                              (Sassign
                                (Efield
                                  (Ederef
                                    (Etempvar _t'22 (tptr (Tstruct __node noattr)))
                                    (Tstruct __node noattr)) _v tint)
                                (Etempvar _v tint))))
                          (Ssequence
                            (Ssequence
                              (Ssequence
                                (Sset _t'6
                                  (Ecast
                                    (Ecast (Econst_int (Int.repr 0) tint)
                                      (tptr tvoid))
                                    (tptr (Tstruct __node noattr))))
                                (Ssequence
                                  (Sset _t'19
                                    (Ederef
                                      (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                      (tptr (Tstruct __node noattr))))
                                  (Ssequence
                                    (Sset _t'20
                                      (Efield
                                        (Ederef
                                          (Etempvar _t'19 (tptr (Tstruct __node noattr)))
                                          (Tstruct __node noattr)) _right
                                        (tptr (Tstruct __node noattr))))
                                    (Sassign
                                      (Efield
                                        (Ederef
                                          (Etempvar _t'20 (tptr (Tstruct __node noattr)))
                                          (Tstruct __node noattr)) _right
                                        (tptr (Tstruct __node noattr)))
                                      (Etempvar _t'6 (tptr (Tstruct __node noattr)))))))
                              (Ssequence
                                (Sset _t'17
                                  (Ederef
                                    (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                    (tptr (Tstruct __node noattr))))
                                (Ssequence
                                  (Sset _t'18
                                    (Efield
                                      (Ederef
                                        (Etempvar _t'17 (tptr (Tstruct __node noattr)))
                                        (Tstruct __node noattr)) _right
                                      (tptr (Tstruct __node noattr))))
                                  (Sassign
                                    (Efield
                                      (Ederef
                                        (Etempvar _t'18 (tptr (Tstruct __node noattr)))
                                        (Tstruct __node noattr)) _left
                                      (tptr (Tstruct __node noattr)))
                                    (Etempvar _t'6 (tptr (Tstruct __node noattr)))))))
                            (Ssequence
                              (Sset _t'14
                                (Ederef
                                  (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                  (tptr (Tstruct __node noattr))))
                              (Ssequence
                                (Sset _t'15
                                  (Efield
                                    (Ederef
                                      (Etempvar _t'14 (tptr (Tstruct __node noattr)))
                                      (Tstruct __node noattr)) _right
                                    (tptr (Tstruct __node noattr))))
                                (Ssequence
                                  (Sset _t'16
                                    (Ederef
                                      (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                                      (tptr (Tstruct __node noattr))))
                                  (Sassign
                                    (Efield
                                      (Ederef
                                        (Etempvar _t'15 (tptr (Tstruct __node noattr)))
                                        (Tstruct __node noattr)) _parent
                                      (tptr (Tstruct __node noattr)))
                                    (Etempvar _t'16 (tptr (Tstruct __node noattr)))))))))))
                    (Ssequence
                      (Sset _t'13
                        (Ederef
                          (Etempvar _root (tptr (tptr (Tstruct __node noattr))))
                          (tptr (Tstruct __node noattr))))
                      (Scall None
                        (Evar _insert (Tfunction
                                        (Tcons
                                          (tptr (tptr (Tstruct __node noattr)))
                                          (Tcons tint (Tcons tint Tnil)))
                                        tvoid cc_default))
                        ((Eaddrof
                           (Efield
                             (Ederef
                               (Etempvar _t'13 (tptr (Tstruct __node noattr)))
                               (Tstruct __node noattr)) _right
                             (tptr (Tstruct __node noattr)))
                           (tptr (tptr (Tstruct __node noattr)))) ::
                         (Etempvar _k tint) :: (Etempvar _v tint) :: nil)))))))))))))
|}.

Definition f_query_value := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: (_k, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'2, tint) :: (_t'1, tint) :: (_t'7, tint) ::
               (_t'6, (tptr (Tstruct __node noattr))) ::
               (_t'5, (tptr (Tstruct __node noattr))) :: (_t'4, tint) ::
               (_t'3, tint) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq (Etempvar _root (tptr (Tstruct __node noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn (Some (Eunop Oneg (Econst_int (Int.repr 1) tint) tint)))
    Sskip)
  (Ssequence
    (Sset _t'3
      (Efield
        (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _k tint))
    (Sifthenelse (Ebinop Oeq (Etempvar _t'3 tint) (Etempvar _k tint) tint)
      (Ssequence
        (Sset _t'7
          (Efield
            (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _v tint))
        (Sreturn (Some (Etempvar _t'7 tint))))
      (Ssequence
        (Sset _t'4
          (Efield
            (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _k tint))
        (Sifthenelse (Ebinop Ogt (Etempvar _t'4 tint) (Etempvar _k tint)
                       tint)
          (Ssequence
            (Ssequence
              (Sset _t'6
                (Efield
                  (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _left
                  (tptr (Tstruct __node noattr))))
              (Scall (Some _t'1)
                (Evar _query_value (Tfunction
                                     (Tcons (tptr (Tstruct __node noattr))
                                       (Tcons tint Tnil)) tint cc_default))
                ((Etempvar _t'6 (tptr (Tstruct __node noattr))) ::
                 (Etempvar _k tint) :: nil)))
            (Sreturn (Some (Etempvar _t'1 tint))))
          (Ssequence
            (Ssequence
              (Sset _t'5
                (Efield
                  (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _right
                  (tptr (Tstruct __node noattr))))
              (Scall (Some _t'2)
                (Evar _query_value (Tfunction
                                     (Tcons (tptr (Tstruct __node noattr))
                                       (Tcons tint Tnil)) tint cc_default))
                ((Etempvar _t'5 (tptr (Tstruct __node noattr))) ::
                 (Etempvar _k tint) :: nil)))
            (Sreturn (Some (Etempvar _t'2 tint)))))))))
|}.

Definition f_query_addr := {|
  fn_return := (tptr (Tstruct __node noattr));
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: (_k, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'2, (tptr (Tstruct __node noattr))) ::
               (_t'1, (tptr (Tstruct __node noattr))) ::
               (_t'6, (tptr (Tstruct __node noattr))) ::
               (_t'5, (tptr (Tstruct __node noattr))) :: (_t'4, tint) ::
               (_t'3, tint) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq (Etempvar _root (tptr (Tstruct __node noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn (Some (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))))
    Sskip)
  (Ssequence
    (Sset _t'3
      (Efield
        (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _k tint))
    (Sifthenelse (Ebinop Oeq (Etempvar _t'3 tint) (Etempvar _k tint) tint)
      (Sreturn (Some (Etempvar _root (tptr (Tstruct __node noattr)))))
      (Ssequence
        (Sset _t'4
          (Efield
            (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _k tint))
        (Sifthenelse (Ebinop Ogt (Etempvar _t'4 tint) (Etempvar _k tint)
                       tint)
          (Ssequence
            (Ssequence
              (Sset _t'6
                (Efield
                  (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _left
                  (tptr (Tstruct __node noattr))))
              (Scall (Some _t'1)
                (Evar _query_addr (Tfunction
                                    (Tcons (tptr (Tstruct __node noattr))
                                      (Tcons tint Tnil))
                                    (tptr (Tstruct __node noattr))
                                    cc_default))
                ((Etempvar _t'6 (tptr (Tstruct __node noattr))) ::
                 (Etempvar _k tint) :: nil)))
            (Sreturn (Some (Etempvar _t'1 (tptr (Tstruct __node noattr))))))
          (Ssequence
            (Ssequence
              (Sset _t'5
                (Efield
                  (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _right
                  (tptr (Tstruct __node noattr))))
              (Scall (Some _t'2)
                (Evar _query_addr (Tfunction
                                    (Tcons (tptr (Tstruct __node noattr))
                                      (Tcons tint Tnil))
                                    (tptr (Tstruct __node noattr))
                                    cc_default))
                ((Etempvar _t'5 (tptr (Tstruct __node noattr))) ::
                 (Etempvar _k tint) :: nil)))
            (Sreturn (Some (Etempvar _t'2 (tptr (Tstruct __node noattr)))))))))))
|}.

Definition f_set_by_key := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: (_k, tint) ::
                (_v, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'4, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr (Tstruct __node noattr))) :: (_t'2, tint) ::
               (_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq (Etempvar _root (tptr (Tstruct __node noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn None)
    Sskip)
  (Ssequence
    (Sset _t'1
      (Efield
        (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _k tint))
    (Sifthenelse (Ebinop Oeq (Etempvar _t'1 tint) (Etempvar _k tint) tint)
      (Sassign
        (Efield
          (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
            (Tstruct __node noattr)) _v tint) (Etempvar _v tint))
      (Ssequence
        (Sset _t'2
          (Efield
            (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _k tint))
        (Sifthenelse (Ebinop Ogt (Etempvar _t'2 tint) (Etempvar _k tint)
                       tint)
          (Ssequence
            (Sset _t'4
              (Efield
                (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                  (Tstruct __node noattr)) _left
                (tptr (Tstruct __node noattr))))
            (Scall None
              (Evar _set_by_key (Tfunction
                                  (Tcons (tptr (Tstruct __node noattr))
                                    (Tcons tint (Tcons tint Tnil))) tvoid
                                  cc_default))
              ((Etempvar _t'4 (tptr (Tstruct __node noattr))) ::
               (Etempvar _k tint) :: (Etempvar _v tint) :: nil)))
          (Ssequence
            (Sset _t'3
              (Efield
                (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                  (Tstruct __node noattr)) _right
                (tptr (Tstruct __node noattr))))
            (Scall None
              (Evar _set_by_key (Tfunction
                                  (Tcons (tptr (Tstruct __node noattr))
                                    (Tcons tint (Tcons tint Tnil))) tvoid
                                  cc_default))
              ((Etempvar _t'3 (tptr (Tstruct __node noattr))) ::
               (Etempvar _k tint) :: (Etempvar _v tint) :: nil))))))))
|}.

Definition f_set_by_addr := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_p, (tptr (Tstruct __node noattr))) :: (_v, tint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sifthenelse (Ebinop One (Etempvar _p (tptr (Tstruct __node noattr)))
               (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
  (Sassign
    (Efield
      (Ederef (Etempvar _p (tptr (Tstruct __node noattr)))
        (Tstruct __node noattr)) _v tint) (Etempvar _v tint))
  Sskip)
|}.

Definition f_next := {|
  fn_return := (tptr (Tstruct __node noattr));
  fn_callconv := cc_default;
  fn_params := ((_current, (tptr (Tstruct __node noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tint) :: (_t'7, (tptr (Tstruct __node noattr))) ::
               (_t'6, (tptr (Tstruct __node noattr))) ::
               (_t'5, (tptr (Tstruct __node noattr))) ::
               (_t'4, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr (Tstruct __node noattr))) ::
               (_t'2, (tptr (Tstruct __node noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq (Etempvar _current (tptr (Tstruct __node noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn (Some (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))))
    Sskip)
  (Ssequence
    (Sset _t'2
      (Efield
        (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _right (tptr (Tstruct __node noattr))))
    (Sifthenelse (Ebinop One (Etempvar _t'2 (tptr (Tstruct __node noattr)))
                   (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
      (Ssequence
        (Sset _current
          (Efield
            (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _right (tptr (Tstruct __node noattr))))
        (Ssequence
          (Sloop
            (Ssequence
              (Ssequence
                (Sset _t'7
                  (Efield
                    (Ederef
                      (Etempvar _current (tptr (Tstruct __node noattr)))
                      (Tstruct __node noattr)) _left
                    (tptr (Tstruct __node noattr))))
                (Sifthenelse (Ebinop One
                               (Etempvar _t'7 (tptr (Tstruct __node noattr)))
                               (Ecast (Econst_int (Int.repr 0) tint)
                                 (tptr tvoid)) tint)
                  Sskip
                  Sbreak))
              (Sset _current
                (Efield
                  (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _left
                  (tptr (Tstruct __node noattr)))))
            Sskip)
          (Sreturn (Some (Etempvar _current (tptr (Tstruct __node noattr)))))))
      (Ssequence
        (Sloop
          (Ssequence
            (Ssequence
              (Ssequence
                (Sset _t'4
                  (Efield
                    (Ederef
                      (Etempvar _current (tptr (Tstruct __node noattr)))
                      (Tstruct __node noattr)) _parent
                    (tptr (Tstruct __node noattr))))
                (Sifthenelse (Ebinop One
                               (Etempvar _t'4 (tptr (Tstruct __node noattr)))
                               (Ecast (Econst_int (Int.repr 0) tint)
                                 (tptr tvoid)) tint)
                  (Ssequence
                    (Sset _t'5
                      (Efield
                        (Ederef
                          (Etempvar _current (tptr (Tstruct __node noattr)))
                          (Tstruct __node noattr)) _parent
                        (tptr (Tstruct __node noattr))))
                    (Ssequence
                      (Sset _t'6
                        (Efield
                          (Ederef
                            (Etempvar _t'5 (tptr (Tstruct __node noattr)))
                            (Tstruct __node noattr)) _right
                          (tptr (Tstruct __node noattr))))
                      (Sset _t'1
                        (Ecast
                          (Ebinop Oeq
                            (Etempvar _current (tptr (Tstruct __node noattr)))
                            (Etempvar _t'6 (tptr (Tstruct __node noattr)))
                            tint) tbool))))
                  (Sset _t'1 (Econst_int (Int.repr 0) tint))))
              (Sifthenelse (Etempvar _t'1 tint) Sskip Sbreak))
            (Sset _current
              (Efield
                (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
                  (Tstruct __node noattr)) _parent
                (tptr (Tstruct __node noattr)))))
          Sskip)
        (Ssequence
          (Sset _t'3
            (Efield
              (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
                (Tstruct __node noattr)) _parent
              (tptr (Tstruct __node noattr))))
          (Sreturn (Some (Etempvar _t'3 (tptr (Tstruct __node noattr))))))))))
|}.

Definition f_prev := {|
  fn_return := (tptr (Tstruct __node noattr));
  fn_callconv := cc_default;
  fn_params := ((_current, (tptr (Tstruct __node noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tint) :: (_t'7, (tptr (Tstruct __node noattr))) ::
               (_t'6, (tptr (Tstruct __node noattr))) ::
               (_t'5, (tptr (Tstruct __node noattr))) ::
               (_t'4, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr (Tstruct __node noattr))) ::
               (_t'2, (tptr (Tstruct __node noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq (Etempvar _current (tptr (Tstruct __node noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn (Some (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))))
    Sskip)
  (Ssequence
    (Sset _t'2
      (Efield
        (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _left (tptr (Tstruct __node noattr))))
    (Sifthenelse (Ebinop One (Etempvar _t'2 (tptr (Tstruct __node noattr)))
                   (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
      (Ssequence
        (Sset _current
          (Efield
            (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _left (tptr (Tstruct __node noattr))))
        (Ssequence
          (Sloop
            (Ssequence
              (Ssequence
                (Sset _t'7
                  (Efield
                    (Ederef
                      (Etempvar _current (tptr (Tstruct __node noattr)))
                      (Tstruct __node noattr)) _right
                    (tptr (Tstruct __node noattr))))
                (Sifthenelse (Ebinop One
                               (Etempvar _t'7 (tptr (Tstruct __node noattr)))
                               (Ecast (Econst_int (Int.repr 0) tint)
                                 (tptr tvoid)) tint)
                  Sskip
                  Sbreak))
              (Sset _current
                (Efield
                  (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
                    (Tstruct __node noattr)) _right
                  (tptr (Tstruct __node noattr)))))
            Sskip)
          (Sreturn (Some (Etempvar _current (tptr (Tstruct __node noattr)))))))
      (Ssequence
        (Sloop
          (Ssequence
            (Ssequence
              (Ssequence
                (Sset _t'4
                  (Efield
                    (Ederef
                      (Etempvar _current (tptr (Tstruct __node noattr)))
                      (Tstruct __node noattr)) _parent
                    (tptr (Tstruct __node noattr))))
                (Sifthenelse (Ebinop One
                               (Etempvar _t'4 (tptr (Tstruct __node noattr)))
                               (Ecast (Econst_int (Int.repr 0) tint)
                                 (tptr tvoid)) tint)
                  (Ssequence
                    (Sset _t'5
                      (Efield
                        (Ederef
                          (Etempvar _current (tptr (Tstruct __node noattr)))
                          (Tstruct __node noattr)) _parent
                        (tptr (Tstruct __node noattr))))
                    (Ssequence
                      (Sset _t'6
                        (Efield
                          (Ederef
                            (Etempvar _t'5 (tptr (Tstruct __node noattr)))
                            (Tstruct __node noattr)) _left
                          (tptr (Tstruct __node noattr))))
                      (Sset _t'1
                        (Ecast
                          (Ebinop Oeq
                            (Etempvar _current (tptr (Tstruct __node noattr)))
                            (Etempvar _t'6 (tptr (Tstruct __node noattr)))
                            tint) tbool))))
                  (Sset _t'1 (Econst_int (Int.repr 0) tint))))
              (Sifthenelse (Etempvar _t'1 tint) Sskip Sbreak))
            (Sset _current
              (Efield
                (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
                  (Tstruct __node noattr)) _parent
                (tptr (Tstruct __node noattr)))))
          Sskip)
        (Ssequence
          (Sset _t'3
            (Efield
              (Ederef (Etempvar _current (tptr (Tstruct __node noattr)))
                (Tstruct __node noattr)) _parent
              (tptr (Tstruct __node noattr))))
          (Sreturn (Some (Etempvar _t'3 (tptr (Tstruct __node noattr))))))))))
|}.

Definition f_begin := {|
  fn_return := (tptr (Tstruct __node noattr));
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr (Tstruct __node noattr))) ::
               (_t'2, (tptr (Tstruct __node noattr))) :: nil);
  fn_body :=
(Sifthenelse (Ebinop Oeq (Etempvar _root (tptr (Tstruct __node noattr)))
               (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
  (Sreturn (Some (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))))
  (Ssequence
    (Sset _t'2
      (Efield
        (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _left (tptr (Tstruct __node noattr))))
    (Sifthenelse (Ebinop Oeq (Etempvar _t'2 (tptr (Tstruct __node noattr)))
                   (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
      (Sreturn (Some (Etempvar _root (tptr (Tstruct __node noattr)))))
      (Ssequence
        (Ssequence
          (Sset _t'3
            (Efield
              (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                (Tstruct __node noattr)) _left
              (tptr (Tstruct __node noattr))))
          (Scall (Some _t'1)
            (Evar _begin (Tfunction
                           (Tcons (tptr (Tstruct __node noattr)) Tnil)
                           (tptr (Tstruct __node noattr)) cc_default))
            ((Etempvar _t'3 (tptr (Tstruct __node noattr))) :: nil)))
        (Sreturn (Some (Etempvar _t'1 (tptr (Tstruct __node noattr)))))))))
|}.

Definition f_end := {|
  fn_return := (tptr (Tstruct __node noattr));
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr (Tstruct __node noattr))) ::
               (_t'2, (tptr (Tstruct __node noattr))) :: nil);
  fn_body :=
(Sifthenelse (Ebinop Oeq (Etempvar _root (tptr (Tstruct __node noattr)))
               (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
  (Sreturn (Some (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid))))
  (Ssequence
    (Sset _t'2
      (Efield
        (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
          (Tstruct __node noattr)) _right (tptr (Tstruct __node noattr))))
    (Sifthenelse (Ebinop Oeq (Etempvar _t'2 (tptr (Tstruct __node noattr)))
                   (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
      (Sreturn (Some (Etempvar _root (tptr (Tstruct __node noattr)))))
      (Ssequence
        (Ssequence
          (Sset _t'3
            (Efield
              (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                (Tstruct __node noattr)) _right
              (tptr (Tstruct __node noattr))))
          (Scall (Some _t'1)
            (Evar _end (Tfunction (Tcons (tptr (Tstruct __node noattr)) Tnil)
                         (tptr (Tstruct __node noattr)) cc_default))
            ((Etempvar _t'3 (tptr (Tstruct __node noattr))) :: nil)))
        (Sreturn (Some (Etempvar _t'1 (tptr (Tstruct __node noattr)))))))))
|}.

Definition f___print_tree := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'4, (tptr (Tstruct __node noattr))) :: (_t'3, tint) ::
               (_t'2, tint) :: (_t'1, (tptr (Tstruct __node noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq (Etempvar _root (tptr (Tstruct __node noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn None)
    Sskip)
  (Ssequence
    (Ssequence
      (Sset _t'4
        (Efield
          (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
            (Tstruct __node noattr)) _left (tptr (Tstruct __node noattr))))
      (Scall None
        (Evar ___print_tree (Tfunction
                              (Tcons (tptr (Tstruct __node noattr)) Tnil)
                              tvoid cc_default))
        ((Etempvar _t'4 (tptr (Tstruct __node noattr))) :: nil)))
    (Ssequence
      (Ssequence
        (Sset _t'2
          (Efield
            (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _k tint))
        (Ssequence
          (Sset _t'3
            (Efield
              (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
                (Tstruct __node noattr)) _v tint))
          (Scall None
            (Evar _printf (Tfunction (Tcons (tptr tschar) Tnil) tint
                            {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
            ((Evar ___stringlit_1 (tarray tschar 9)) ::
             (Etempvar _t'2 tint) :: (Etempvar _t'3 tint) :: nil))))
      (Ssequence
        (Sset _t'1
          (Efield
            (Ederef (Etempvar _root (tptr (Tstruct __node noattr)))
              (Tstruct __node noattr)) _right (tptr (Tstruct __node noattr))))
        (Scall None
          (Evar ___print_tree (Tfunction
                                (Tcons (tptr (Tstruct __node noattr)) Tnil)
                                tvoid cc_default))
          ((Etempvar _t'1 (tptr (Tstruct __node noattr))) :: nil))))))
|}.

Definition f_print_tree := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_root, (tptr (Tstruct __node noattr))) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Scall None
    (Evar ___print_tree (Tfunction
                          (Tcons (tptr (Tstruct __node noattr)) Tnil) tvoid
                          cc_default))
    ((Etempvar _root (tptr (Tstruct __node noattr))) :: nil))
  (Scall None
    (Evar _printf (Tfunction (Tcons (tptr tschar) Tnil) tint
                    {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
    ((Evar ___stringlit_2 (tarray tschar 2)) :: nil)))
|}.

Definition f_main := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := nil;
  fn_vars := ((_bst, (tptr (Tstruct __node noattr))) :: nil);
  fn_temps := ((_temp, (tptr (Tstruct __node noattr))) ::
               (_t'7, (tptr (Tstruct __node noattr))) ::
               (_t'6, (tptr (Tstruct __node noattr))) ::
               (_t'5, (tptr (Tstruct __node noattr))) ::
               (_t'4, (tptr (Tstruct __node noattr))) ::
               (_t'3, (tptr (Tstruct __node noattr))) :: (_t'2, tint) ::
               (_t'1, tint) :: (_t'26, (tptr (Tstruct __node noattr))) ::
               (_t'25, (tptr (Tstruct __node noattr))) ::
               (_t'24, (tptr (Tstruct __node noattr))) ::
               (_t'23, (tptr (Tstruct __node noattr))) ::
               (_t'22, (tptr (Tstruct __node noattr))) ::
               (_t'21, (tptr (Tstruct __node noattr))) ::
               (_t'20, (tptr (Tstruct __node noattr))) ::
               (_t'19, (tptr (Tstruct __node noattr))) ::
               (_t'18, (tptr (Tstruct __node noattr))) ::
               (_t'17, (tptr (Tstruct __node noattr))) ::
               (_t'16, (tptr (Tstruct __node noattr))) ::
               (_t'15, (tptr (Tstruct __node noattr))) ::
               (_t'14, (tptr (Tstruct __node noattr))) ::
               (_t'13, (tptr (Tstruct __node noattr))) :: (_t'12, tint) ::
               (_t'11, tint) :: (_t'10, (tptr (Tstruct __node noattr))) ::
               (_t'9, tint) :: (_t'8, tint) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Sassign (Evar _bst (tptr (Tstruct __node noattr)))
      (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)))
    (Ssequence
      (Scall None
        (Evar _printf (Tfunction (Tcons (tptr tschar) Tnil) tint
                        {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
        ((Evar ___stringlit_3 (tarray tschar 34)) :: nil))
      (Ssequence
        (Scall None
          (Evar _insert (Tfunction
                          (Tcons (tptr (tptr (Tstruct __node noattr)))
                            (Tcons tint (Tcons tint Tnil))) tvoid cc_default))
          ((Eaddrof (Evar _bst (tptr (Tstruct __node noattr)))
             (tptr (tptr (Tstruct __node noattr)))) ::
           (Econst_int (Int.repr 1) tint) ::
           (Econst_int (Int.repr 2) tint) :: nil))
        (Ssequence
          (Ssequence
            (Sset _t'26 (Evar _bst (tptr (Tstruct __node noattr))))
            (Scall None
              (Evar _print_tree (Tfunction
                                  (Tcons (tptr (Tstruct __node noattr)) Tnil)
                                  tvoid cc_default))
              ((Etempvar _t'26 (tptr (Tstruct __node noattr))) :: nil)))
          (Ssequence
            (Scall None
              (Evar _insert (Tfunction
                              (Tcons (tptr (tptr (Tstruct __node noattr)))
                                (Tcons tint (Tcons tint Tnil))) tvoid
                              cc_default))
              ((Eaddrof (Evar _bst (tptr (Tstruct __node noattr)))
                 (tptr (tptr (Tstruct __node noattr)))) ::
               (Econst_int (Int.repr 5) tint) ::
               (Econst_int (Int.repr 10) tint) :: nil))
            (Ssequence
              (Ssequence
                (Sset _t'25 (Evar _bst (tptr (Tstruct __node noattr))))
                (Scall None
                  (Evar _print_tree (Tfunction
                                      (Tcons (tptr (Tstruct __node noattr))
                                        Tnil) tvoid cc_default))
                  ((Etempvar _t'25 (tptr (Tstruct __node noattr))) :: nil)))
              (Ssequence
                (Scall None
                  (Evar _insert (Tfunction
                                  (Tcons
                                    (tptr (tptr (Tstruct __node noattr)))
                                    (Tcons tint (Tcons tint Tnil))) tvoid
                                  cc_default))
                  ((Eaddrof (Evar _bst (tptr (Tstruct __node noattr)))
                     (tptr (tptr (Tstruct __node noattr)))) ::
                   (Econst_int (Int.repr 3) tint) ::
                   (Econst_int (Int.repr 6) tint) :: nil))
                (Ssequence
                  (Ssequence
                    (Sset _t'24 (Evar _bst (tptr (Tstruct __node noattr))))
                    (Scall None
                      (Evar _print_tree (Tfunction
                                          (Tcons
                                            (tptr (Tstruct __node noattr))
                                            Tnil) tvoid cc_default))
                      ((Etempvar _t'24 (tptr (Tstruct __node noattr))) ::
                       nil)))
                  (Ssequence
                    (Scall None
                      (Evar _insert (Tfunction
                                      (Tcons
                                        (tptr (tptr (Tstruct __node noattr)))
                                        (Tcons tint (Tcons tint Tnil))) tvoid
                                      cc_default))
                      ((Eaddrof (Evar _bst (tptr (Tstruct __node noattr)))
                         (tptr (tptr (Tstruct __node noattr)))) ::
                       (Eunop Oneg (Econst_int (Int.repr 4) tint) tint) ::
                       (Econst_int (Int.repr 6) tint) :: nil))
                    (Ssequence
                      (Ssequence
                        (Sset _t'23
                          (Evar _bst (tptr (Tstruct __node noattr))))
                        (Scall None
                          (Evar _print_tree (Tfunction
                                              (Tcons
                                                (tptr (Tstruct __node noattr))
                                                Tnil) tvoid cc_default))
                          ((Etempvar _t'23 (tptr (Tstruct __node noattr))) ::
                           nil)))
                      (Ssequence
                        (Scall None
                          (Evar _insert (Tfunction
                                          (Tcons
                                            (tptr (tptr (Tstruct __node noattr)))
                                            (Tcons tint (Tcons tint Tnil)))
                                          tvoid cc_default))
                          ((Eaddrof
                             (Evar _bst (tptr (Tstruct __node noattr)))
                             (tptr (tptr (Tstruct __node noattr)))) ::
                           (Econst_int (Int.repr 17) tint) ::
                           (Econst_int (Int.repr 6) tint) :: nil))
                        (Ssequence
                          (Ssequence
                            (Sset _t'22
                              (Evar _bst (tptr (Tstruct __node noattr))))
                            (Scall None
                              (Evar _print_tree (Tfunction
                                                  (Tcons
                                                    (tptr (Tstruct __node noattr))
                                                    Tnil) tvoid cc_default))
                              ((Etempvar _t'22 (tptr (Tstruct __node noattr))) ::
                               nil)))
                          (Ssequence
                            (Ssequence
                              (Ssequence
                                (Sset _t'21
                                  (Evar _bst (tptr (Tstruct __node noattr))))
                                (Scall (Some _t'1)
                                  (Evar _query_value (Tfunction
                                                       (Tcons
                                                         (tptr (Tstruct __node noattr))
                                                         (Tcons tint Tnil))
                                                       tint cc_default))
                                  ((Etempvar _t'21 (tptr (Tstruct __node noattr))) ::
                                   (Econst_int (Int.repr 3) tint) :: nil)))
                              (Scall None
                                (Evar _printf (Tfunction
                                                (Tcons (tptr tschar) Tnil)
                                                tint
                                                {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                ((Evar ___stringlit_4 (tarray tschar 20)) ::
                                 (Econst_int (Int.repr 3) tint) ::
                                 (Etempvar _t'1 tint) :: nil)))
                            (Ssequence
                              (Ssequence
                                (Ssequence
                                  (Sset _t'20
                                    (Evar _bst (tptr (Tstruct __node noattr))))
                                  (Scall (Some _t'2)
                                    (Evar _query_value (Tfunction
                                                         (Tcons
                                                           (tptr (Tstruct __node noattr))
                                                           (Tcons tint Tnil))
                                                         tint cc_default))
                                    ((Etempvar _t'20 (tptr (Tstruct __node noattr))) ::
                                     (Econst_int (Int.repr 2) tint) :: nil)))
                                (Scall None
                                  (Evar _printf (Tfunction
                                                  (Tcons (tptr tschar) Tnil)
                                                  tint
                                                  {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                  ((Evar ___stringlit_4 (tarray tschar 20)) ::
                                   (Econst_int (Int.repr 2) tint) ::
                                   (Etempvar _t'2 tint) :: nil)))
                              (Ssequence
                                (Scall None
                                  (Evar _printf (Tfunction
                                                  (Tcons (tptr tschar) Tnil)
                                                  tint
                                                  {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                  ((Evar ___stringlit_5 (tarray tschar 48)) ::
                                   (Econst_int (Int.repr 3) tint) ::
                                   (Econst_int (Int.repr 333) tint) :: nil))
                                (Ssequence
                                  (Ssequence
                                    (Ssequence
                                      (Sset _t'19
                                        (Evar _bst (tptr (Tstruct __node noattr))))
                                      (Scall (Some _t'3)
                                        (Evar _query_addr (Tfunction
                                                            (Tcons
                                                              (tptr (Tstruct __node noattr))
                                                              (Tcons tint
                                                                Tnil))
                                                            (tptr (Tstruct __node noattr))
                                                            cc_default))
                                        ((Etempvar _t'19 (tptr (Tstruct __node noattr))) ::
                                         (Econst_int (Int.repr 3) tint) ::
                                         nil)))
                                    (Sset _temp
                                      (Etempvar _t'3 (tptr (Tstruct __node noattr)))))
                                  (Ssequence
                                    (Scall None
                                      (Evar _set_by_addr (Tfunction
                                                           (Tcons
                                                             (tptr (Tstruct __node noattr))
                                                             (Tcons tint
                                                               Tnil)) tvoid
                                                           cc_default))
                                      ((Etempvar _temp (tptr (Tstruct __node noattr))) ::
                                       (Econst_int (Int.repr 333) tint) ::
                                       nil))
                                    (Ssequence
                                      (Ssequence
                                        (Sset _t'18
                                          (Evar _bst (tptr (Tstruct __node noattr))))
                                        (Scall None
                                          (Evar _print_tree (Tfunction
                                                              (Tcons
                                                                (tptr (Tstruct __node noattr))
                                                                Tnil) tvoid
                                                              cc_default))
                                          ((Etempvar _t'18 (tptr (Tstruct __node noattr))) ::
                                           nil)))
                                      (Ssequence
                                        (Scall None
                                          (Evar _printf (Tfunction
                                                          (Tcons
                                                            (tptr tschar)
                                                            Tnil) tint
                                                          {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                          ((Evar ___stringlit_6 (tarray tschar 19)) ::
                                           (Econst_int (Int.repr 5) tint) ::
                                           (Econst_int (Int.repr 55) tint) ::
                                           nil))
                                        (Ssequence
                                          (Ssequence
                                            (Sset _t'17
                                              (Evar _bst (tptr (Tstruct __node noattr))))
                                            (Scall None
                                              (Evar _set_by_key (Tfunction
                                                                  (Tcons
                                                                    (tptr (Tstruct __node noattr))
                                                                    (Tcons
                                                                    tint
                                                                    (Tcons
                                                                    tint
                                                                    Tnil)))
                                                                  tvoid
                                                                  cc_default))
                                              ((Etempvar _t'17 (tptr (Tstruct __node noattr))) ::
                                               (Econst_int (Int.repr 5) tint) ::
                                               (Econst_int (Int.repr 55) tint) ::
                                               nil)))
                                          (Ssequence
                                            (Ssequence
                                              (Sset _t'16
                                                (Evar _bst (tptr (Tstruct __node noattr))))
                                              (Scall None
                                                (Evar _print_tree (Tfunction
                                                                    (Tcons
                                                                    (tptr (Tstruct __node noattr))
                                                                    Tnil)
                                                                    tvoid
                                                                    cc_default))
                                                ((Etempvar _t'16 (tptr (Tstruct __node noattr))) ::
                                                 nil)))
                                            (Ssequence
                                              (Scall None
                                                (Evar _printf (Tfunction
                                                                (Tcons
                                                                  (tptr tschar)
                                                                  Tnil) tint
                                                                {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                                ((Evar ___stringlit_6 (tarray tschar 19)) ::
                                                 (Econst_int (Int.repr 2) tint) ::
                                                 (Econst_int (Int.repr 55) tint) ::
                                                 nil))
                                              (Ssequence
                                                (Ssequence
                                                  (Sset _t'15
                                                    (Evar _bst (tptr (Tstruct __node noattr))))
                                                  (Scall None
                                                    (Evar _set_by_key 
                                                    (Tfunction
                                                      (Tcons
                                                        (tptr (Tstruct __node noattr))
                                                        (Tcons tint
                                                          (Tcons tint Tnil)))
                                                      tvoid cc_default))
                                                    ((Etempvar _t'15 (tptr (Tstruct __node noattr))) ::
                                                     (Econst_int (Int.repr 2) tint) ::
                                                     (Econst_int (Int.repr 55) tint) ::
                                                     nil)))
                                                (Ssequence
                                                  (Ssequence
                                                    (Sset _t'14
                                                      (Evar _bst (tptr (Tstruct __node noattr))))
                                                    (Scall None
                                                      (Evar _print_tree 
                                                      (Tfunction
                                                        (Tcons
                                                          (tptr (Tstruct __node noattr))
                                                          Tnil) tvoid
                                                        cc_default))
                                                      ((Etempvar _t'14 (tptr (Tstruct __node noattr))) ::
                                                       nil)))
                                                  (Ssequence
                                                    (Scall None
                                                      (Evar _printf (Tfunction
                                                                    (Tcons
                                                                    (tptr tschar)
                                                                    Tnil)
                                                                    tint
                                                                    {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                                      ((Evar ___stringlit_7 (tarray tschar 20)) ::
                                                       nil))
                                                    (Ssequence
                                                      (Ssequence
                                                        (Ssequence
                                                          (Sset _t'13
                                                            (Evar _bst (tptr (Tstruct __node noattr))))
                                                          (Scall (Some _t'4)
                                                            (Evar _begin 
                                                            (Tfunction
                                                              (Tcons
                                                                (tptr (Tstruct __node noattr))
                                                                Tnil)
                                                              (tptr (Tstruct __node noattr))
                                                              cc_default))
                                                            ((Etempvar _t'13 (tptr (Tstruct __node noattr))) ::
                                                             nil)))
                                                        (Sset _temp
                                                          (Etempvar _t'4 (tptr (Tstruct __node noattr)))))
                                                      (Ssequence
                                                        (Swhile
                                                          (Etempvar _temp (tptr (Tstruct __node noattr)))
                                                          (Ssequence
                                                            (Ssequence
                                                              (Sset _t'11
                                                                (Efield
                                                                  (Ederef
                                                                    (Etempvar _temp (tptr (Tstruct __node noattr)))
                                                                    (Tstruct __node noattr))
                                                                  _k tint))
                                                              (Ssequence
                                                                (Sset _t'12
                                                                  (Efield
                                                                    (Ederef
                                                                    (Etempvar _temp (tptr (Tstruct __node noattr)))
                                                                    (Tstruct __node noattr))
                                                                    _v tint))
                                                                (Scall None
                                                                  (Evar _printf 
                                                                  (Tfunction
                                                                    (Tcons
                                                                    (tptr tschar)
                                                                    Tnil)
                                                                    tint
                                                                    {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                                                  ((Evar ___stringlit_8 (tarray tschar 10)) ::
                                                                   (Etempvar _t'11 tint) ::
                                                                   (Etempvar _t'12 tint) ::
                                                                   nil))))
                                                            (Ssequence
                                                              (Scall (Some _t'5)
                                                                (Evar _next 
                                                                (Tfunction
                                                                  (Tcons
                                                                    (tptr (Tstruct __node noattr))
                                                                    Tnil)
                                                                  (tptr (Tstruct __node noattr))
                                                                  cc_default))
                                                                ((Etempvar _temp (tptr (Tstruct __node noattr))) ::
                                                                 nil))
                                                              (Sset _temp
                                                                (Etempvar _t'5 (tptr (Tstruct __node noattr)))))))
                                                        (Ssequence
                                                          (Scall None
                                                            (Evar _printf 
                                                            (Tfunction
                                                              (Tcons
                                                                (tptr tschar)
                                                                Tnil) tint
                                                              {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                                            ((Evar ___stringlit_9 (tarray tschar 20)) ::
                                                             nil))
                                                          (Ssequence
                                                            (Ssequence
                                                              (Ssequence
                                                                (Sset _t'10
                                                                  (Evar _bst (tptr (Tstruct __node noattr))))
                                                                (Scall (Some _t'6)
                                                                  (Evar _end 
                                                                  (Tfunction
                                                                    (Tcons
                                                                    (tptr (Tstruct __node noattr))
                                                                    Tnil)
                                                                    (tptr (Tstruct __node noattr))
                                                                    cc_default))
                                                                  ((Etempvar _t'10 (tptr (Tstruct __node noattr))) ::
                                                                   nil)))
                                                              (Sset _temp
                                                                (Etempvar _t'6 (tptr (Tstruct __node noattr)))))
                                                            (Ssequence
                                                              (Swhile
                                                                (Etempvar _temp (tptr (Tstruct __node noattr)))
                                                                (Ssequence
                                                                  (Ssequence
                                                                    (Sset _t'8
                                                                    (Efield
                                                                    (Ederef
                                                                    (Etempvar _temp (tptr (Tstruct __node noattr)))
                                                                    (Tstruct __node noattr))
                                                                    _k tint))
                                                                    (Ssequence
                                                                    (Sset _t'9
                                                                    (Efield
                                                                    (Ederef
                                                                    (Etempvar _temp (tptr (Tstruct __node noattr)))
                                                                    (Tstruct __node noattr))
                                                                    _v tint))
                                                                    (Scall None
                                                                    (Evar _printf 
                                                                    (Tfunction
                                                                    (Tcons
                                                                    (tptr tschar)
                                                                    Tnil)
                                                                    tint
                                                                    {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                                                                    ((Evar ___stringlit_8 (tarray tschar 10)) ::
                                                                    (Etempvar _t'8 tint) ::
                                                                    (Etempvar _t'9 tint) ::
                                                                    nil))))
                                                                  (Ssequence
                                                                    (Scall (Some _t'7)
                                                                    (Evar _prev 
                                                                    (Tfunction
                                                                    (Tcons
                                                                    (tptr (Tstruct __node noattr))
                                                                    Tnil)
                                                                    (tptr (Tstruct __node noattr))
                                                                    cc_default))
                                                                    ((Etempvar _temp (tptr (Tstruct __node noattr))) ::
                                                                    nil))
                                                                    (Sset _temp
                                                                    (Etempvar _t'7 (tptr (Tstruct __node noattr)))))))
                                                              (Sreturn (Some (Econst_int (Int.repr 0) tint)))))))))))))))))))))))))))))))))
  (Sreturn (Some (Econst_int (Int.repr 0) tint))))
|}.

Definition composites : list composite_definition :=
(Composite __node Struct
   ((_k, tint) :: (_v, tint) :: (_left, (tptr (Tstruct __node noattr))) ::
    (_right, (tptr (Tstruct __node noattr))) ::
    (_parent, (tptr (Tstruct __node noattr))) :: nil)
   noattr :: nil).

Definition global_definitions : list (ident * globdef fundef type) :=
((___stringlit_4, Gvar v___stringlit_4) ::
 (___stringlit_7, Gvar v___stringlit_7) ::
 (___stringlit_3, Gvar v___stringlit_3) ::
 (___stringlit_5, Gvar v___stringlit_5) ::
 (___stringlit_8, Gvar v___stringlit_8) ::
 (___stringlit_2, Gvar v___stringlit_2) ::
 (___stringlit_6, Gvar v___stringlit_6) ::
 (___stringlit_9, Gvar v___stringlit_9) ::
 (___stringlit_1, Gvar v___stringlit_1) ::
 (___builtin_ais_annot,
   Gfun(External (EF_builtin "__builtin_ais_annot"
                   (mksignature (AST.Tint :: nil) None
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_bswap,
   Gfun(External (EF_builtin "__builtin_bswap"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap32,
   Gfun(External (EF_builtin "__builtin_bswap32"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap16,
   Gfun(External (EF_builtin "__builtin_bswap16"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tushort Tnil) tushort cc_default)) ::
 (___builtin_fabs,
   Gfun(External (EF_builtin "__builtin_fabs"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_fsqrt,
   Gfun(External (EF_builtin "__builtin_fsqrt"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_memcpy_aligned,
   Gfun(External (EF_builtin "__builtin_memcpy_aligned"
                   (mksignature
                     (AST.Tint :: AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     None cc_default))
     (Tcons (tptr tvoid)
       (Tcons (tptr tvoid) (Tcons tuint (Tcons tuint Tnil)))) tvoid
     cc_default)) ::
 (___builtin_annot,
   Gfun(External (EF_builtin "__builtin_annot"
                   (mksignature (AST.Tint :: nil) None
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_annot_intval,
   Gfun(External (EF_builtin "__builtin_annot_intval"
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tschar) (Tcons tint Tnil))
     tint cc_default)) ::
 (___builtin_membar,
   Gfun(External (EF_builtin "__builtin_membar"
                   (mksignature nil None cc_default)) Tnil tvoid cc_default)) ::
 (___builtin_va_start,
   Gfun(External (EF_builtin "__builtin_va_start"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___builtin_va_arg,
   Gfun(External (EF_builtin "__builtin_va_arg"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_va_copy,
   Gfun(External (EF_builtin "__builtin_va_copy"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil)) tvoid cc_default)) ::
 (___builtin_va_end,
   Gfun(External (EF_builtin "__builtin_va_end"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___compcert_va_int32,
   Gfun(External (EF_external "__compcert_va_int32"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tvoid) Tnil) tuint cc_default)) ::
 (___compcert_va_int64,
   Gfun(External (EF_external "__compcert_va_int64"
                   (mksignature (AST.Tint :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons (tptr tvoid) Tnil) tulong
     cc_default)) ::
 (___compcert_va_float64,
   Gfun(External (EF_external "__compcert_va_float64"
                   (mksignature (AST.Tint :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons (tptr tvoid) Tnil) tdouble
     cc_default)) ::
 (___compcert_va_composite,
   Gfun(External (EF_external "__compcert_va_composite"
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     (tptr tvoid) cc_default)) ::
 (___compcert_i64_dtos,
   Gfun(External (EF_runtime "__compcert_i64_dtos"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tlong cc_default)) ::
 (___compcert_i64_dtou,
   Gfun(External (EF_runtime "__compcert_i64_dtou"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tulong cc_default)) ::
 (___compcert_i64_stod,
   Gfun(External (EF_runtime "__compcert_i64_stod"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tlong Tnil) tdouble cc_default)) ::
 (___compcert_i64_utod,
   Gfun(External (EF_runtime "__compcert_i64_utod"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tulong Tnil) tdouble cc_default)) ::
 (___compcert_i64_stof,
   Gfun(External (EF_runtime "__compcert_i64_stof"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tlong Tnil) tfloat cc_default)) ::
 (___compcert_i64_utof,
   Gfun(External (EF_runtime "__compcert_i64_utof"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tulong Tnil) tfloat cc_default)) ::
 (___compcert_i64_sdiv,
   Gfun(External (EF_runtime "__compcert_i64_sdiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___compcert_i64_udiv,
   Gfun(External (EF_runtime "__compcert_i64_udiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___compcert_i64_smod,
   Gfun(External (EF_runtime "__compcert_i64_smod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___compcert_i64_umod,
   Gfun(External (EF_runtime "__compcert_i64_umod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___compcert_i64_shl,
   Gfun(External (EF_runtime "__compcert_i64_shl"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___compcert_i64_shr,
   Gfun(External (EF_runtime "__compcert_i64_shr"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tint Tnil)) tulong cc_default)) ::
 (___compcert_i64_sar,
   Gfun(External (EF_runtime "__compcert_i64_sar"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___compcert_i64_smulh,
   Gfun(External (EF_runtime "__compcert_i64_smulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___compcert_i64_umulh,
   Gfun(External (EF_runtime "__compcert_i64_umulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___builtin_bswap64,
   Gfun(External (EF_builtin "__builtin_bswap64"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tulong Tnil) tulong cc_default)) ::
 (___builtin_clz,
   Gfun(External (EF_builtin "__builtin_clz"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzl,
   Gfun(External (EF_builtin "__builtin_clzl"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzll,
   Gfun(External (EF_builtin "__builtin_clzll"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tint)
                     cc_default)) (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_ctz,
   Gfun(External (EF_builtin "__builtin_ctz"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzl,
   Gfun(External (EF_builtin "__builtin_ctzl"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzll,
   Gfun(External (EF_builtin "__builtin_ctzll"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tint)
                     cc_default)) (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_fmax,
   Gfun(External (EF_builtin "__builtin_fmax"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble Tnil)) tdouble cc_default)) ::
 (___builtin_fmin,
   Gfun(External (EF_builtin "__builtin_fmin"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble Tnil)) tdouble cc_default)) ::
 (___builtin_fmadd,
   Gfun(External (EF_builtin "__builtin_fmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fmsub,
   Gfun(External (EF_builtin "__builtin_fmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmadd,
   Gfun(External (EF_builtin "__builtin_fnmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmsub,
   Gfun(External (EF_builtin "__builtin_fnmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_read16_reversed,
   Gfun(External (EF_builtin "__builtin_read16_reversed"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tushort) Tnil) tushort cc_default)) ::
 (___builtin_read32_reversed,
   Gfun(External (EF_builtin "__builtin_read32_reversed"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tuint) Tnil) tuint cc_default)) ::
 (___builtin_write16_reversed,
   Gfun(External (EF_builtin "__builtin_write16_reversed"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tushort) (Tcons tushort Tnil))
     tvoid cc_default)) ::
 (___builtin_write32_reversed,
   Gfun(External (EF_builtin "__builtin_write32_reversed"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tuint) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_nop,
   Gfun(External (EF_builtin "__builtin_nop"
                   (mksignature nil None cc_default)) Tnil tvoid cc_default)) ::
 (___builtin_debug,
   Gfun(External (EF_external "__builtin_debug"
                   (mksignature (AST.Tint :: nil) None
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons tint Tnil) tvoid
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (_printf,
   Gfun(External (EF_external "printf"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint)
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tint
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (_malloc,
   Gfun(External EF_malloc (Tcons tuint Tnil) (tptr tvoid) cc_default)) ::
 (_insert, Gfun(Internal f_insert)) ::
 (_query_value, Gfun(Internal f_query_value)) ::
 (_query_addr, Gfun(Internal f_query_addr)) ::
 (_set_by_key, Gfun(Internal f_set_by_key)) ::
 (_set_by_addr, Gfun(Internal f_set_by_addr)) ::
 (_next, Gfun(Internal f_next)) :: (_prev, Gfun(Internal f_prev)) ::
 (_begin, Gfun(Internal f_begin)) :: (_end, Gfun(Internal f_end)) ::
 (___print_tree, Gfun(Internal f___print_tree)) ::
 (_print_tree, Gfun(Internal f_print_tree)) ::
 (_main, Gfun(Internal f_main)) :: nil).

Definition public_idents : list ident :=
(_main :: _print_tree :: ___print_tree :: _end :: _begin :: _prev :: _next ::
 _set_by_addr :: _set_by_key :: _query_addr :: _query_value :: _insert ::
 _malloc :: _printf :: ___builtin_debug :: ___builtin_nop ::
 ___builtin_write32_reversed :: ___builtin_write16_reversed ::
 ___builtin_read32_reversed :: ___builtin_read16_reversed ::
 ___builtin_fnmsub :: ___builtin_fnmadd :: ___builtin_fmsub ::
 ___builtin_fmadd :: ___builtin_fmin :: ___builtin_fmax ::
 ___builtin_ctzll :: ___builtin_ctzl :: ___builtin_ctz :: ___builtin_clzll ::
 ___builtin_clzl :: ___builtin_clz :: ___builtin_bswap64 ::
 ___compcert_i64_umulh :: ___compcert_i64_smulh :: ___compcert_i64_sar ::
 ___compcert_i64_shr :: ___compcert_i64_shl :: ___compcert_i64_umod ::
 ___compcert_i64_smod :: ___compcert_i64_udiv :: ___compcert_i64_sdiv ::
 ___compcert_i64_utof :: ___compcert_i64_stof :: ___compcert_i64_utod ::
 ___compcert_i64_stod :: ___compcert_i64_dtou :: ___compcert_i64_dtos ::
 ___compcert_va_composite :: ___compcert_va_float64 ::
 ___compcert_va_int64 :: ___compcert_va_int32 :: ___builtin_va_end ::
 ___builtin_va_copy :: ___builtin_va_arg :: ___builtin_va_start ::
 ___builtin_membar :: ___builtin_annot_intval :: ___builtin_annot ::
 ___builtin_memcpy_aligned :: ___builtin_fsqrt :: ___builtin_fabs ::
 ___builtin_bswap16 :: ___builtin_bswap32 :: ___builtin_bswap ::
 ___builtin_ais_annot :: nil).

Definition prog : Clight.program := 
  mkprogram composites global_definitions public_idents _main Logic.I.


