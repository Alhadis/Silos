
Require Import Clightdefs.
Local Open Scope Z_scope.
Definition _C : ident := 66%positive.
Definition _L : ident := 67%positive.
Definition _R : ident := 68%positive.
Definition _W : ident := 69%positive.
Definition _X : ident := 70%positive.
Definition ___builtin_annot : ident := 14%positive.
Definition ___builtin_annot_intval : ident := 15%positive.
Definition ___builtin_bswap : ident := 40%positive.
Definition ___builtin_bswap16 : ident := 43%positive.
Definition ___builtin_bswap32 : ident := 42%positive.
Definition ___builtin_bswap64 : ident := 41%positive.
Definition ___builtin_clz : ident := 44%positive.
Definition ___builtin_clzl : ident := 45%positive.
Definition ___builtin_clzll : ident := 46%positive.
Definition ___builtin_ctz : ident := 47%positive.
Definition ___builtin_ctzl : ident := 48%positive.
Definition ___builtin_ctzll : ident := 49%positive.
Definition ___builtin_debug : ident := 62%positive.
Definition ___builtin_fabs : ident := 12%positive.
Definition ___builtin_fmadd : ident := 53%positive.
Definition ___builtin_fmax : ident := 51%positive.
Definition ___builtin_fmin : ident := 52%positive.
Definition ___builtin_fmsub : ident := 54%positive.
Definition ___builtin_fnmadd : ident := 55%positive.
Definition ___builtin_fnmsub : ident := 56%positive.
Definition ___builtin_fsqrt : ident := 50%positive.
Definition ___builtin_membar : ident := 16%positive.
Definition ___builtin_memcpy_aligned : ident := 13%positive.
Definition ___builtin_nop : ident := 61%positive.
Definition ___builtin_read16_reversed : ident := 57%positive.
Definition ___builtin_read32_reversed : ident := 58%positive.
Definition ___builtin_va_arg : ident := 18%positive.
Definition ___builtin_va_copy : ident := 19%positive.
Definition ___builtin_va_end : ident := 20%positive.
Definition ___builtin_va_start : ident := 17%positive.
Definition ___builtin_write16_reversed : ident := 59%positive.
Definition ___builtin_write32_reversed : ident := 60%positive.
Definition ___compcert_va_composite : ident := 24%positive.
Definition ___compcert_va_float64 : ident := 23%positive.
Definition ___compcert_va_int32 : ident := 21%positive.
Definition ___compcert_va_int64 : ident := 22%positive.
Definition ___i64_dtos : ident := 25%positive.
Definition ___i64_dtou : ident := 26%positive.
Definition ___i64_sar : ident := 37%positive.
Definition ___i64_sdiv : ident := 31%positive.
Definition ___i64_shl : ident := 35%positive.
Definition ___i64_shr : ident := 36%positive.
Definition ___i64_smod : ident := 33%positive.
Definition ___i64_smulh : ident := 38%positive.
Definition ___i64_stod : ident := 27%positive.
Definition ___i64_stof : ident := 29%positive.
Definition ___i64_udiv : ident := 32%positive.
Definition ___i64_umod : ident := 34%positive.
Definition ___i64_umulh : ident := 39%positive.
Definition ___i64_utod : ident := 28%positive.
Definition ___i64_utof : ident := 30%positive.
Definition _a : ident := 1%positive.
Definition _acquire : ident := 63%positive.
Definition _b : ident := 71%positive.
Definition _c : ident := 90%positive.
Definition _check_le : ident := 76%positive.
Definition _check_le_e : ident := 81%positive.
Definition _choice : ident := 8%positive.
Definition _ct : ident := 88%positive.
Definition _cx : ident := 93%positive.
Definition _data : ident := 10%positive.
Definition _e : ident := 6%positive.
Definition _e1 : ident := 77%positive.
Definition _eorvc : ident := 11%positive.
Definition _epoch : ident := 5%positive.
Definition _exit : ident := 65%positive.
Definition _i : ident := 75%positive.
Definition _i1 : ident := 79%positive.
Definition _instr_acquire : ident := 100%positive.
Definition _instr_fork : ident := 102%positive.
Definition _instr_join : ident := 103%positive.
Definition _instr_read : ident := 92%positive.
Definition _instr_release : ident := 101%positive.
Definition _instr_write : ident := 95%positive.
Definition _lock_t : ident := 2%positive.
Definition _lx : ident := 84%positive.
Definition _m : ident := 99%positive.
Definition _main : ident := 104%positive.
Definition _max : ident := 72%positive.
Definition _r : ident := 85%positive.
Definition _re : ident := 89%positive.
Definition _release : ident := 64%positive.
Definition _src : ident := 97%positive.
Definition _t : ident := 82%positive.
Definition _t1 : ident := 78%positive.
Definition _t2 : ident := 80%positive.
Definition _tag : ident := 9%positive.
Definition _tgt : ident := 96%positive.
Definition _thread : ident := 4%positive.
Definition _time : ident := 3%positive.
Definition _tx : ident := 94%positive.
Definition _ty : ident := 87%positive.
Definition _u : ident := 91%positive.
Definition _v1 : ident := 73%positive.
Definition _v2 : ident := 74%positive.
Definition _vc : ident := 7%positive.
Definition _vc_join : ident := 98%positive.
Definition _w : ident := 86%positive.
Definition _x : ident := 83%positive.
Definition _t'1 : ident := 105%positive.
Definition _t'2 : ident := 106%positive.
Definition _t'3 : ident := 107%positive.
Definition _t'4 : ident := 108%positive.

Definition v_C := {|
  gvar_info := (tarray (tarray tint 10) 10);
  gvar_init := (Init_space 400 :: nil);
  gvar_readonly := false;
  gvar_volatile := false
|}.

Definition v_L := {|
  gvar_info := (tarray (tarray tint 10) 10);
  gvar_init := (Init_space 400 :: nil);
  gvar_readonly := false;
  gvar_volatile := false
|}.

Definition v_R := {|
  gvar_info := (tarray (tptr (Tstruct _eorvc noattr)) 10);
  gvar_init := (Init_space 40 :: nil);
  gvar_readonly := false;
  gvar_volatile := false
|}.

Definition v_W := {|
  gvar_info := (tarray (tptr (Tstruct _epoch noattr)) 10);
  gvar_init := (Init_space 40 :: nil);
  gvar_readonly := false;
  gvar_volatile := false
|}.

Definition v_X := {|
  gvar_info := (tarray (tptr (Tstruct _lock_t noattr)) 10);
  gvar_init := (Init_space 40 :: nil);
  gvar_readonly := false;
  gvar_volatile := false
|}.

Definition f_max := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_a, tint) :: (_b, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oge (Etempvar _a tint) (Etempvar _b tint) tint)
    (Sset _t'1 (Ecast (Etempvar _a tint) tint))
    (Sset _t'1 (Ecast (Etempvar _b tint) tint)))
  (Sreturn (Some (Etempvar _t'1 tint))))
|}.

Definition f_check_le := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_v1, (tptr tint)) :: (_v2, (tptr tint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tint) :: (_a, tint) :: (_b, tint) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Sset _i (Econst_int (Int.repr 0) tint))
    (Sloop
      (Ssequence
        (Sifthenelse (Ebinop Olt (Etempvar _i tint)
                       (Econst_int (Int.repr 10) tint) tint)
          Sskip
          Sbreak)
        (Ssequence
          (Sset _a
            (Ederef
              (Ebinop Oadd (Etempvar _v1 (tptr tint)) (Etempvar _i tint)
                (tptr tint)) tint))
          (Ssequence
            (Sset _b
              (Ederef
                (Ebinop Oadd (Etempvar _v2 (tptr tint)) (Etempvar _i tint)
                  (tptr tint)) tint))
            (Sifthenelse (Ebinop Olt (Etempvar _b tint) (Etempvar _a tint)
                           tint)
              (Sreturn (Some (Econst_int (Int.repr 0) tint)))
              Sskip))))
      (Sset _i
        (Ebinop Oadd (Etempvar _i tint) (Econst_int (Int.repr 1) tint) tint))))
  (Sreturn (Some (Econst_int (Int.repr 1) tint))))
|}.

Definition f_check_le_e := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_e1, (tptr (Tstruct _epoch noattr))) ::
                (_v2, (tptr tint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_t1, tint) :: (_i1, tint) :: (_t2, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _t1
    (Efield
      (Ederef (Etempvar _e1 (tptr (Tstruct _epoch noattr)))
        (Tstruct _epoch noattr)) _time tint))
  (Ssequence
    (Sset _i1
      (Efield
        (Ederef (Etempvar _e1 (tptr (Tstruct _epoch noattr)))
          (Tstruct _epoch noattr)) _thread tint))
    (Ssequence
      (Sset _t2
        (Ederef
          (Ebinop Oadd (Etempvar _v2 (tptr tint)) (Etempvar _i1 tint)
            (tptr tint)) tint))
      (Sreturn (Some (Ebinop Ole (Etempvar _t1 tint) (Etempvar _t2 tint)
                       tint))))))
|}.

Definition f_instr_read := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_t, tint) :: (_x, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_lx, (tptr (Tstruct _lock_t noattr))) ::
               (_r, (tptr (Tstruct _eorvc noattr))) ::
               (_w, (tptr (Tstruct _epoch noattr))) :: (_ty, tint) ::
               (_ct, tint) :: (_re, (tptr (Tstruct _epoch noattr))) ::
               (_c, tint) :: (_u, tint) :: (_i, tint) :: (_t'4, tint) ::
               (_t'3, tint) :: (_t'2, tint) :: (_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _lx
    (Ederef
      (Ebinop Oadd (Evar _X (tarray (tptr (Tstruct _lock_t noattr)) 10))
        (Etempvar _x tint) (tptr (tptr (Tstruct _lock_t noattr))))
      (tptr (Tstruct _lock_t noattr))))
  (Ssequence
    (Scall None
      (Evar _acquire (Tfunction (Tcons (tptr tvoid) Tnil) tvoid cc_default))
      ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) :: nil))
    (Ssequence
      (Sset _r
        (Ederef
          (Ebinop Oadd (Evar _R (tarray (tptr (Tstruct _eorvc noattr)) 10))
            (Etempvar _x tint) (tptr (tptr (Tstruct _eorvc noattr))))
          (tptr (Tstruct _eorvc noattr))))
      (Ssequence
        (Sset _w
          (Ederef
            (Ebinop Oadd (Evar _W (tarray (tptr (Tstruct _epoch noattr)) 10))
              (Etempvar _x tint) (tptr (tptr (Tstruct _epoch noattr))))
            (tptr (Tstruct _epoch noattr))))
        (Ssequence
          (Sset _ty
            (Efield
              (Ederef (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                (Tstruct _eorvc noattr)) _tag tint))
          (Ssequence
            (Sset _ct
              (Ederef
                (Ebinop Oadd
                  (Ederef
                    (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
                      (Etempvar _t tint) (tptr (tarray tint 10)))
                    (tarray tint 10)) (Etempvar _t tint) (tptr tint)) tint))
            (Sifthenelse (Ebinop Oeq (Etempvar _ty tint)
                           (Econst_int (Int.repr 0) tint) tint)
              (Ssequence
                (Sset _re
                  (Eaddrof
                    (Efield
                      (Efield
                        (Ederef (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                          (Tstruct _eorvc noattr)) _data
                        (Tunion _choice noattr)) _e (Tstruct _epoch noattr))
                    (tptr (Tstruct _epoch noattr))))
                (Ssequence
                  (Sset _c
                    (Efield
                      (Ederef (Etempvar _re (tptr (Tstruct _epoch noattr)))
                        (Tstruct _epoch noattr)) _time tint))
                  (Ssequence
                    (Sset _u
                      (Efield
                        (Ederef (Etempvar _re (tptr (Tstruct _epoch noattr)))
                          (Tstruct _epoch noattr)) _thread tint))
                    (Ssequence
                      (Ssequence
                        (Sifthenelse (Ebinop Oeq (Etempvar _c tint)
                                       (Etempvar _ct tint) tint)
                          (Sset _t'1
                            (Ecast
                              (Ebinop Oeq (Etempvar _u tint)
                                (Etempvar _t tint) tint) tbool))
                          (Sset _t'1 (Econst_int (Int.repr 0) tint)))
                        (Sifthenelse (Etempvar _t'1 tint)
                          (Ssequence
                            (Scall None
                              (Evar _release (Tfunction
                                               (Tcons (tptr tvoid) Tnil)
                                               tvoid cc_default))
                              ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                               nil))
                            (Sreturn None))
                          Sskip))
                      (Ssequence
                        (Ssequence
                          (Scall (Some _t'2)
                            (Evar _check_le_e (Tfunction
                                                (Tcons
                                                  (tptr (Tstruct _epoch noattr))
                                                  (Tcons (tptr tint) Tnil))
                                                tint cc_default))
                            ((Etempvar _w (tptr (Tstruct _epoch noattr))) ::
                             (Ederef
                               (Ebinop Oadd
                                 (Evar _C (tarray (tarray tint 10) 10))
                                 (Etempvar _t tint) (tptr (tarray tint 10)))
                               (tarray tint 10)) :: nil))
                          (Sifthenelse (Eunop Onotbool (Etempvar _t'2 tint)
                                         tint)
                            (Scall None
                              (Evar _exit (Tfunction (Tcons tint Tnil) tvoid
                                            cc_default))
                              ((Econst_int (Int.repr 1) tint) :: nil))
                            Sskip))
                        (Ssequence
                          (Ssequence
                            (Scall (Some _t'3)
                              (Evar _check_le_e (Tfunction
                                                  (Tcons
                                                    (tptr (Tstruct _epoch noattr))
                                                    (Tcons (tptr tint) Tnil))
                                                  tint cc_default))
                              ((Etempvar _re (tptr (Tstruct _epoch noattr))) ::
                               (Ederef
                                 (Ebinop Oadd
                                   (Evar _C (tarray (tarray tint 10) 10))
                                   (Etempvar _t tint)
                                   (tptr (tarray tint 10))) (tarray tint 10)) ::
                               nil))
                            (Sifthenelse (Etempvar _t'3 tint)
                              (Ssequence
                                (Sassign
                                  (Efield
                                    (Ederef
                                      (Etempvar _re (tptr (Tstruct _epoch noattr)))
                                      (Tstruct _epoch noattr)) _time tint)
                                  (Etempvar _ct tint))
                                (Ssequence
                                  (Sassign
                                    (Efield
                                      (Ederef
                                        (Etempvar _re (tptr (Tstruct _epoch noattr)))
                                        (Tstruct _epoch noattr)) _thread
                                      tint) (Etempvar _t tint))
                                  (Ssequence
                                    (Scall None
                                      (Evar _release (Tfunction
                                                       (Tcons (tptr tvoid)
                                                         Tnil) tvoid
                                                       cc_default))
                                      ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                                       nil))
                                    (Sreturn None))))
                              Sskip))
                          (Ssequence
                            (Sassign
                              (Efield
                                (Ederef
                                  (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                  (Tstruct _eorvc noattr)) _tag tint)
                              (Econst_int (Int.repr 1) tint))
                            (Ssequence
                              (Ssequence
                                (Sset _i (Econst_int (Int.repr 0) tint))
                                (Sloop
                                  (Ssequence
                                    (Sifthenelse (Ebinop Olt
                                                   (Etempvar _i tint)
                                                   (Econst_int (Int.repr 10) tint)
                                                   tint)
                                      Sskip
                                      Sbreak)
                                    (Sifthenelse (Ebinop Oeq
                                                   (Etempvar _i tint)
                                                   (Etempvar _t tint) tint)
                                      (Sassign
                                        (Ederef
                                          (Ebinop Oadd
                                            (Efield
                                              (Efield
                                                (Ederef
                                                  (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                                  (Tstruct _eorvc noattr))
                                                _data
                                                (Tunion _choice noattr)) _vc
                                              (tarray tint 10))
                                            (Etempvar _i tint) (tptr tint))
                                          tint) (Etempvar _ct tint))
                                      (Sifthenelse (Ebinop Oeq
                                                     (Etempvar _i tint)
                                                     (Etempvar _u tint) tint)
                                        (Sassign
                                          (Ederef
                                            (Ebinop Oadd
                                              (Efield
                                                (Efield
                                                  (Ederef
                                                    (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                                    (Tstruct _eorvc noattr))
                                                  _data
                                                  (Tunion _choice noattr))
                                                _vc (tarray tint 10))
                                              (Etempvar _i tint) (tptr tint))
                                            tint) (Etempvar _c tint))
                                        (Sassign
                                          (Ederef
                                            (Ebinop Oadd
                                              (Efield
                                                (Efield
                                                  (Ederef
                                                    (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                                    (Tstruct _eorvc noattr))
                                                  _data
                                                  (Tunion _choice noattr))
                                                _vc (tarray tint 10))
                                              (Etempvar _i tint) (tptr tint))
                                            tint)
                                          (Econst_int (Int.repr 0) tint)))))
                                  (Sset _i
                                    (Ebinop Oadd (Etempvar _i tint)
                                      (Econst_int (Int.repr 1) tint) tint))))
                              (Ssequence
                                (Scall None
                                  (Evar _release (Tfunction
                                                   (Tcons (tptr tvoid) Tnil)
                                                   tvoid cc_default))
                                  ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                                   nil))
                                (Sreturn None))))))))))
              (Ssequence
                (Ssequence
                  (Scall (Some _t'4)
                    (Evar _check_le_e (Tfunction
                                        (Tcons (tptr (Tstruct _epoch noattr))
                                          (Tcons (tptr tint) Tnil)) tint
                                        cc_default))
                    ((Etempvar _w (tptr (Tstruct _epoch noattr))) ::
                     (Ederef
                       (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
                         (Etempvar _t tint) (tptr (tarray tint 10)))
                       (tarray tint 10)) :: nil))
                  (Sifthenelse (Etempvar _t'4 tint)
                    (Ssequence
                      (Sassign
                        (Ederef
                          (Ebinop Oadd
                            (Efield
                              (Efield
                                (Ederef
                                  (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                  (Tstruct _eorvc noattr)) _data
                                (Tunion _choice noattr)) _vc
                              (tarray tint 10)) (Etempvar _t tint)
                            (tptr tint)) tint) (Etempvar _ct tint))
                      (Ssequence
                        (Scall None
                          (Evar _release (Tfunction (Tcons (tptr tvoid) Tnil)
                                           tvoid cc_default))
                          ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                           nil))
                        (Sreturn None)))
                    Sskip))
                (Scall None
                  (Evar _exit (Tfunction (Tcons tint Tnil) tvoid cc_default))
                  ((Econst_int (Int.repr 1) tint) :: nil))))))))))
|}.

Definition f_instr_write := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_t, tint) :: (_x, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_lx, (tptr (Tstruct _lock_t noattr))) ::
               (_r, (tptr (Tstruct _eorvc noattr))) ::
               (_w, (tptr (Tstruct _epoch noattr))) :: (_cx, tint) ::
               (_tx, tint) :: (_ct, tint) :: (_ty, tint) :: (_t'4, tint) ::
               (_t'3, tint) :: (_t'2, tint) :: (_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _lx
    (Ederef
      (Ebinop Oadd (Evar _X (tarray (tptr (Tstruct _lock_t noattr)) 10))
        (Etempvar _x tint) (tptr (tptr (Tstruct _lock_t noattr))))
      (tptr (Tstruct _lock_t noattr))))
  (Ssequence
    (Scall None
      (Evar _acquire (Tfunction (Tcons (tptr tvoid) Tnil) tvoid cc_default))
      ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) :: nil))
    (Ssequence
      (Sset _r
        (Ederef
          (Ebinop Oadd (Evar _R (tarray (tptr (Tstruct _eorvc noattr)) 10))
            (Etempvar _x tint) (tptr (tptr (Tstruct _eorvc noattr))))
          (tptr (Tstruct _eorvc noattr))))
      (Ssequence
        (Sset _w
          (Ederef
            (Ebinop Oadd (Evar _W (tarray (tptr (Tstruct _epoch noattr)) 10))
              (Etempvar _x tint) (tptr (tptr (Tstruct _epoch noattr))))
            (tptr (Tstruct _epoch noattr))))
        (Ssequence
          (Sset _cx
            (Efield
              (Ederef (Etempvar _w (tptr (Tstruct _epoch noattr)))
                (Tstruct _epoch noattr)) _time tint))
          (Ssequence
            (Sset _tx
              (Efield
                (Ederef (Etempvar _w (tptr (Tstruct _epoch noattr)))
                  (Tstruct _epoch noattr)) _thread tint))
            (Ssequence
              (Sset _ct
                (Ederef
                  (Ebinop Oadd
                    (Ederef
                      (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
                        (Etempvar _t tint) (tptr (tarray tint 10)))
                      (tarray tint 10)) (Etempvar _t tint) (tptr tint)) tint))
              (Ssequence
                (Ssequence
                  (Sifthenelse (Ebinop Oeq (Etempvar _cx tint)
                                 (Etempvar _ct tint) tint)
                    (Sset _t'1
                      (Ecast
                        (Ebinop Oeq (Etempvar _tx tint) (Etempvar _t tint)
                          tint) tbool))
                    (Sset _t'1 (Econst_int (Int.repr 0) tint)))
                  (Sifthenelse (Etempvar _t'1 tint)
                    (Ssequence
                      (Scall None
                        (Evar _release (Tfunction (Tcons (tptr tvoid) Tnil)
                                         tvoid cc_default))
                        ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                         nil))
                      (Sreturn None))
                    Sskip))
                (Ssequence
                  (Ssequence
                    (Scall (Some _t'2)
                      (Evar _check_le_e (Tfunction
                                          (Tcons
                                            (tptr (Tstruct _epoch noattr))
                                            (Tcons (tptr tint) Tnil)) tint
                                          cc_default))
                      ((Etempvar _w (tptr (Tstruct _epoch noattr))) ::
                       (Ederef
                         (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
                           (Etempvar _t tint) (tptr (tarray tint 10)))
                         (tarray tint 10)) :: nil))
                    (Sifthenelse (Eunop Onotbool (Etempvar _t'2 tint) tint)
                      (Scall None
                        (Evar _exit (Tfunction (Tcons tint Tnil) tvoid
                                      cc_default))
                        ((Econst_int (Int.repr 1) tint) :: nil))
                      Sskip))
                  (Ssequence
                    (Sset _ty
                      (Efield
                        (Ederef (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                          (Tstruct _eorvc noattr)) _tag tint))
                    (Sifthenelse (Ebinop Oeq (Etempvar _ty tint)
                                   (Econst_int (Int.repr 0) tint) tint)
                      (Ssequence
                        (Ssequence
                          (Scall (Some _t'3)
                            (Evar _check_le_e (Tfunction
                                                (Tcons
                                                  (tptr (Tstruct _epoch noattr))
                                                  (Tcons (tptr tint) Tnil))
                                                tint cc_default))
                            ((Eaddrof
                               (Efield
                                 (Efield
                                   (Ederef
                                     (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                     (Tstruct _eorvc noattr)) _data
                                   (Tunion _choice noattr)) _e
                                 (Tstruct _epoch noattr))
                               (tptr (Tstruct _epoch noattr))) ::
                             (Ederef
                               (Ebinop Oadd
                                 (Evar _C (tarray (tarray tint 10) 10))
                                 (Etempvar _t tint) (tptr (tarray tint 10)))
                               (tarray tint 10)) :: nil))
                          (Sifthenelse (Etempvar _t'3 tint)
                            (Ssequence
                              (Sassign
                                (Efield
                                  (Ederef
                                    (Etempvar _w (tptr (Tstruct _epoch noattr)))
                                    (Tstruct _epoch noattr)) _time tint)
                                (Etempvar _ct tint))
                              (Ssequence
                                (Sassign
                                  (Efield
                                    (Ederef
                                      (Etempvar _w (tptr (Tstruct _epoch noattr)))
                                      (Tstruct _epoch noattr)) _thread tint)
                                  (Etempvar _t tint))
                                (Ssequence
                                  (Scall None
                                    (Evar _release (Tfunction
                                                     (Tcons (tptr tvoid)
                                                       Tnil) tvoid
                                                     cc_default))
                                    ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                                     nil))
                                  (Sreturn None))))
                            Sskip))
                        (Scall None
                          (Evar _exit (Tfunction (Tcons tint Tnil) tvoid
                                        cc_default))
                          ((Econst_int (Int.repr 1) tint) :: nil)))
                      (Ssequence
                        (Scall (Some _t'4)
                          (Evar _check_le (Tfunction
                                            (Tcons (tptr tint)
                                              (Tcons (tptr tint) Tnil)) tint
                                            cc_default))
                          ((Efield
                             (Efield
                               (Ederef
                                 (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                 (Tstruct _eorvc noattr)) _data
                               (Tunion _choice noattr)) _vc (tarray tint 10)) ::
                           (Ederef
                             (Ebinop Oadd
                               (Evar _C (tarray (tarray tint 10) 10))
                               (Etempvar _t tint) (tptr (tarray tint 10)))
                             (tarray tint 10)) :: nil))
                        (Sifthenelse (Etempvar _t'4 tint)
                          (Ssequence
                            (Sassign
                              (Efield
                                (Ederef
                                  (Etempvar _w (tptr (Tstruct _epoch noattr)))
                                  (Tstruct _epoch noattr)) _time tint)
                              (Etempvar _ct tint))
                            (Ssequence
                              (Sassign
                                (Efield
                                  (Ederef
                                    (Etempvar _w (tptr (Tstruct _epoch noattr)))
                                    (Tstruct _epoch noattr)) _thread tint)
                                (Etempvar _t tint))
                              (Ssequence
                                (Sassign
                                  (Efield
                                    (Ederef
                                      (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                      (Tstruct _eorvc noattr)) _tag tint)
                                  (Econst_int (Int.repr 0) tint))
                                (Ssequence
                                  (Sassign
                                    (Efield
                                      (Efield
                                        (Efield
                                          (Ederef
                                            (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                            (Tstruct _eorvc noattr)) _data
                                          (Tunion _choice noattr)) _e
                                        (Tstruct _epoch noattr)) _time tint)
                                    (Econst_int (Int.repr 0) tint))
                                  (Ssequence
                                    (Sassign
                                      (Efield
                                        (Efield
                                          (Efield
                                            (Ederef
                                              (Etempvar _r (tptr (Tstruct _eorvc noattr)))
                                              (Tstruct _eorvc noattr)) _data
                                            (Tunion _choice noattr)) _e
                                          (Tstruct _epoch noattr)) _thread
                                        tint) (Econst_int (Int.repr 0) tint))
                                    (Ssequence
                                      (Scall None
                                        (Evar _release (Tfunction
                                                         (Tcons (tptr tvoid)
                                                           Tnil) tvoid
                                                         cc_default))
                                        ((Etempvar _lx (tptr (Tstruct _lock_t noattr))) ::
                                         nil))
                                      (Sreturn None)))))))
                          (Scall None
                            (Evar _exit (Tfunction (Tcons tint Tnil) tvoid
                                          cc_default))
                            ((Econst_int (Int.repr 1) tint) :: nil)))))))))))))))
|}.

Definition f_vc_join := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_tgt, (tptr tint)) :: (_src, (tptr tint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tint) :: (_t'1, tint) :: (_t'3, tint) :: (_t'2, tint) ::
               nil);
  fn_body :=
(Ssequence
  (Sset _i (Econst_int (Int.repr 0) tint))
  (Sloop
    (Ssequence
      (Sifthenelse (Ebinop Olt (Etempvar _i tint)
                     (Econst_int (Int.repr 10) tint) tint)
        Sskip
        Sbreak)
      (Ssequence
        (Ssequence
          (Sset _t'2
            (Ederef
              (Ebinop Oadd (Etempvar _tgt (tptr tint)) (Etempvar _i tint)
                (tptr tint)) tint))
          (Ssequence
            (Sset _t'3
              (Ederef
                (Ebinop Oadd (Etempvar _src (tptr tint)) (Etempvar _i tint)
                  (tptr tint)) tint))
            (Scall (Some _t'1)
              (Evar _max (Tfunction (Tcons tint (Tcons tint Tnil)) tint
                           cc_default))
              ((Etempvar _t'2 tint) :: (Etempvar _t'3 tint) :: nil))))
        (Sassign
          (Ederef
            (Ebinop Oadd (Etempvar _tgt (tptr tint)) (Etempvar _i tint)
              (tptr tint)) tint) (Etempvar _t'1 tint))))
    (Sset _i
      (Ebinop Oadd (Etempvar _i tint) (Econst_int (Int.repr 1) tint) tint))))
|}.

Definition f_instr_acquire := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_t, tint) :: (_m, tint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Scall None
  (Evar _vc_join (Tfunction (Tcons (tptr tint) (Tcons (tptr tint) Tnil))
                   tvoid cc_default))
  ((Ederef
     (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10)) (Etempvar _t tint)
       (tptr (tarray tint 10))) (tarray tint 10)) ::
   (Ederef
     (Ebinop Oadd (Evar _L (tarray (tarray tint 10) 10)) (Etempvar _m tint)
       (tptr (tarray tint 10))) (tarray tint 10)) :: nil))
|}.

Definition f_instr_release := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_t, tint) :: (_m, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tint) :: (_t'2, tint) :: (_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Sset _i (Econst_int (Int.repr 0) tint))
    (Sloop
      (Ssequence
        (Sifthenelse (Ebinop Olt (Etempvar _i tint)
                       (Econst_int (Int.repr 10) tint) tint)
          Sskip
          Sbreak)
        (Ssequence
          (Sset _t'2
            (Ederef
              (Ebinop Oadd
                (Ederef
                  (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
                    (Etempvar _t tint) (tptr (tarray tint 10)))
                  (tarray tint 10)) (Etempvar _i tint) (tptr tint)) tint))
          (Sassign
            (Ederef
              (Ebinop Oadd
                (Ederef
                  (Ebinop Oadd (Evar _L (tarray (tarray tint 10) 10))
                    (Etempvar _m tint) (tptr (tarray tint 10)))
                  (tarray tint 10)) (Etempvar _i tint) (tptr tint)) tint)
            (Etempvar _t'2 tint))))
      (Sset _i
        (Ebinop Oadd (Etempvar _i tint) (Econst_int (Int.repr 1) tint) tint))))
  (Ssequence
    (Sset _t'1
      (Ederef
        (Ebinop Oadd
          (Ederef
            (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
              (Etempvar _t tint) (tptr (tarray tint 10))) (tarray tint 10))
          (Etempvar _t tint) (tptr tint)) tint))
    (Sassign
      (Ederef
        (Ebinop Oadd
          (Ederef
            (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
              (Etempvar _t tint) (tptr (tarray tint 10))) (tarray tint 10))
          (Etempvar _t tint) (tptr tint)) tint)
      (Ebinop Oadd (Etempvar _t'1 tint) (Econst_int (Int.repr 1) tint) tint))))
|}.

Definition f_instr_fork := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_t, tint) :: (_u, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Scall None
    (Evar _vc_join (Tfunction (Tcons (tptr tint) (Tcons (tptr tint) Tnil))
                     tvoid cc_default))
    ((Ederef
       (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10)) (Etempvar _u tint)
         (tptr (tarray tint 10))) (tarray tint 10)) ::
     (Ederef
       (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10)) (Etempvar _t tint)
         (tptr (tarray tint 10))) (tarray tint 10)) :: nil))
  (Ssequence
    (Sset _t'1
      (Ederef
        (Ebinop Oadd
          (Ederef
            (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
              (Etempvar _t tint) (tptr (tarray tint 10))) (tarray tint 10))
          (Etempvar _t tint) (tptr tint)) tint))
    (Sassign
      (Ederef
        (Ebinop Oadd
          (Ederef
            (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
              (Etempvar _t tint) (tptr (tarray tint 10))) (tarray tint 10))
          (Etempvar _t tint) (tptr tint)) tint)
      (Ebinop Oadd (Etempvar _t'1 tint) (Econst_int (Int.repr 1) tint) tint))))
|}.

Definition f_instr_join := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_t, tint) :: (_u, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Scall None
    (Evar _vc_join (Tfunction (Tcons (tptr tint) (Tcons (tptr tint) Tnil))
                     tvoid cc_default))
    ((Ederef
       (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10)) (Etempvar _t tint)
         (tptr (tarray tint 10))) (tarray tint 10)) ::
     (Ederef
       (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10)) (Etempvar _u tint)
         (tptr (tarray tint 10))) (tarray tint 10)) :: nil))
  (Ssequence
    (Sset _t'1
      (Ederef
        (Ebinop Oadd
          (Ederef
            (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
              (Etempvar _u tint) (tptr (tarray tint 10))) (tarray tint 10))
          (Etempvar _u tint) (tptr tint)) tint))
    (Sassign
      (Ederef
        (Ebinop Oadd
          (Ederef
            (Ebinop Oadd (Evar _C (tarray (tarray tint 10) 10))
              (Etempvar _u tint) (tptr (tarray tint 10))) (tarray tint 10))
          (Etempvar _u tint) (tptr tint)) tint)
      (Ebinop Oadd (Etempvar _t'1 tint) (Econst_int (Int.repr 1) tint) tint))))
|}.

Definition composites : list composite_definition :=
(Composite _lock_t Struct ((_a, (tarray (tptr tvoid) 4)) :: nil) noattr ::
 Composite _epoch Struct ((_time, tint) :: (_thread, tint) :: nil) noattr ::
 Composite _choice Union
   ((_e, (Tstruct _epoch noattr)) :: (_vc, (tarray tint 10)) :: nil)
   noattr ::
 Composite _eorvc Struct
   ((_tag, tint) :: (_data, (Tunion _choice noattr)) :: nil)
   noattr :: nil).

Definition prog : Clight.program := {|
prog_defs :=
((___builtin_fabs,
   Gfun(External (EF_builtin "__builtin_fabs"
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
 (___i64_dtos,
   Gfun(External (EF_runtime "__i64_dtos"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tlong cc_default)) ::
 (___i64_dtou,
   Gfun(External (EF_runtime "__i64_dtou"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tulong cc_default)) ::
 (___i64_stod,
   Gfun(External (EF_runtime "__i64_stod"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tlong Tnil) tdouble cc_default)) ::
 (___i64_utod,
   Gfun(External (EF_runtime "__i64_utod"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tulong Tnil) tdouble cc_default)) ::
 (___i64_stof,
   Gfun(External (EF_runtime "__i64_stof"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tlong Tnil) tfloat cc_default)) ::
 (___i64_utof,
   Gfun(External (EF_runtime "__i64_utof"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tulong Tnil) tfloat cc_default)) ::
 (___i64_sdiv,
   Gfun(External (EF_runtime "__i64_sdiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___i64_udiv,
   Gfun(External (EF_runtime "__i64_udiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___i64_smod,
   Gfun(External (EF_runtime "__i64_smod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___i64_umod,
   Gfun(External (EF_runtime "__i64_umod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___i64_shl,
   Gfun(External (EF_runtime "__i64_shl"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___i64_shr,
   Gfun(External (EF_runtime "__i64_shr"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tint Tnil)) tulong cc_default)) ::
 (___i64_sar,
   Gfun(External (EF_runtime "__i64_sar"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___i64_smulh,
   Gfun(External (EF_runtime "__i64_smulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___i64_umulh,
   Gfun(External (EF_runtime "__i64_umulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___builtin_bswap,
   Gfun(External (EF_builtin "__builtin_bswap"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap64,
   Gfun(External (EF_builtin "__builtin_bswap64"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tulong Tnil) tulong cc_default)) ::
 (___builtin_bswap32,
   Gfun(External (EF_builtin "__builtin_bswap32"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap16,
   Gfun(External (EF_builtin "__builtin_bswap16"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tushort Tnil) tushort cc_default)) ::
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
 (___builtin_fsqrt,
   Gfun(External (EF_builtin "__builtin_fsqrt"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
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
 (_acquire,
   Gfun(External (EF_external "acquire"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (_release,
   Gfun(External (EF_external "release"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (_exit,
   Gfun(External (EF_external "exit"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons tint Tnil) tvoid cc_default)) :: (_C, Gvar v_C) ::
 (_L, Gvar v_L) :: (_R, Gvar v_R) :: (_W, Gvar v_W) :: (_X, Gvar v_X) ::
 (_max, Gfun(Internal f_max)) :: (_check_le, Gfun(Internal f_check_le)) ::
 (_check_le_e, Gfun(Internal f_check_le_e)) ::
 (_instr_read, Gfun(Internal f_instr_read)) ::
 (_instr_write, Gfun(Internal f_instr_write)) ::
 (_vc_join, Gfun(Internal f_vc_join)) ::
 (_instr_acquire, Gfun(Internal f_instr_acquire)) ::
 (_instr_release, Gfun(Internal f_instr_release)) ::
 (_instr_fork, Gfun(Internal f_instr_fork)) ::
 (_instr_join, Gfun(Internal f_instr_join)) :: nil);
prog_public :=
(_instr_join :: _instr_fork :: _instr_release :: _instr_acquire ::
 _vc_join :: _instr_write :: _instr_read :: _check_le_e :: _check_le ::
 _max :: _X :: _W :: _R :: _L :: _C :: _exit :: _release :: _acquire ::
 ___builtin_debug :: ___builtin_nop :: ___builtin_write32_reversed ::
 ___builtin_write16_reversed :: ___builtin_read32_reversed ::
 ___builtin_read16_reversed :: ___builtin_fnmsub :: ___builtin_fnmadd ::
 ___builtin_fmsub :: ___builtin_fmadd :: ___builtin_fmin ::
 ___builtin_fmax :: ___builtin_fsqrt :: ___builtin_ctzll ::
 ___builtin_ctzl :: ___builtin_ctz :: ___builtin_clzll :: ___builtin_clzl ::
 ___builtin_clz :: ___builtin_bswap16 :: ___builtin_bswap32 ::
 ___builtin_bswap64 :: ___builtin_bswap :: ___i64_umulh :: ___i64_smulh ::
 ___i64_sar :: ___i64_shr :: ___i64_shl :: ___i64_umod :: ___i64_smod ::
 ___i64_udiv :: ___i64_sdiv :: ___i64_utof :: ___i64_stof :: ___i64_utod ::
 ___i64_stod :: ___i64_dtou :: ___i64_dtos :: ___compcert_va_composite ::
 ___compcert_va_float64 :: ___compcert_va_int64 :: ___compcert_va_int32 ::
 ___builtin_va_end :: ___builtin_va_copy :: ___builtin_va_arg ::
 ___builtin_va_start :: ___builtin_membar :: ___builtin_annot_intval ::
 ___builtin_annot :: ___builtin_memcpy_aligned :: ___builtin_fabs :: nil);
prog_main := _main;
prog_types := composites;
prog_comp_env := make_composite_env composites;
prog_comp_env_eq := refl_equal _
|}.

