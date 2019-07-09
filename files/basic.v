Require Import Clightdefs.

Local Open Scope Z_scope.

Definition _mul3 : ident := 40%positive.
Definition ___builtin_read32_reversed : ident := 32%positive.
Definition ___compcert_va_int32 : ident := 16%positive.
Definition _i : ident := 38%positive.
Definition ___builtin_fsqrt : ident := 24%positive.
Definition ___builtin_clz : ident := 22%positive.
Definition ___compcert_va_int64 : ident := 17%positive.
Definition ___builtin_memcpy_aligned : ident := 8%positive.
Definition ___builtin_subl : ident := 5%positive.
Definition ___builtin_va_start : ident := 12%positive.
Definition ___builtin_annot_intval : ident := 10%positive.
Definition ___builtin_negl : ident := 3%positive.
Definition ___builtin_write32_reversed : ident := 2%positive.
Definition ___builtin_write16_reversed : ident := 1%positive.
Definition _mul : ident := 36%positive.
Definition ___builtin_read16_reversed : ident := 31%positive.
Definition ___builtin_va_copy : ident := 14%positive.
Definition ___builtin_mull : ident := 6%positive.
Definition ___builtin_fmin : ident := 26%positive.
Definition ___builtin_bswap : ident := 19%positive.
Definition _mul2 : ident := 39%positive.
Definition ___builtin_membar : ident := 11%positive.
Definition _c : ident := 37%positive.
Definition ___builtin_addl : ident := 4%positive.
Definition ___builtin_fmsub : ident := 28%positive.
Definition ___builtin_fabs : ident := 7%positive.
Definition _main : ident := 42%positive.
Definition ___builtin_bswap16 : ident := 21%positive.
Definition ___compcert_va_float64 : ident := 18%positive.
Definition ___builtin_annot : ident := 9%positive.
Definition _mul4 : ident := 41%positive.
Definition ___builtin_va_arg : ident := 13%positive.
Definition ___builtin_fmadd : ident := 27%positive.
Definition _a : ident := 33%positive.
Definition ___builtin_fmax : ident := 25%positive.
Definition ___builtin_va_end : ident := 15%positive.
Definition _b : ident := 34%positive.
Definition ___builtin_fnmadd : ident := 29%positive.
Definition _sum : ident := 35%positive.
Definition ___builtin_fnmsub : ident := 30%positive.
Definition ___builtin_ctz : ident := 23%positive.
Definition ___builtin_bswap32 : ident := 20%positive.


Definition f_sum := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_a, tuint) :: (_b, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Ebinop Oadd (Etempvar _a tuint) (Etempvar _b tuint) tuint)))
|}.

Definition f_mul := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_a, tuint) :: (_b, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Ebinop Omul (Etempvar _a tuint) (Etempvar _b tuint) tuint)))
|}.

Definition f_mul2 := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_a, tuint) :: (_b, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_c, tuint) :: (_i, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _c (Econst_int (Int.repr 0) tint))
  (Ssequence
    (Ssequence
      (Sset _i (Econst_int (Int.repr 0) tint))
      (Sloop
        (Ssequence
          (Sifthenelse (Ebinop Olt (Etempvar _i tint) (Etempvar _b tint)
                         tint)
            Sskip
            Sbreak)
          (Sset _c
            (Ebinop Oadd (Etempvar _c tuint) (Etempvar _a tuint) tuint)))
        (Sset _i
          (Ebinop Oadd (Etempvar _i tint) (Econst_int (Int.repr 1) tint)
            tint))))
    (Sreturn (Some (Etempvar _c tuint)))))
|}.

Definition f_mul3 := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_a, tuint) :: (_b, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_c, tuint) :: (_i, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _c (Econst_int (Int.repr 0) tint))
  (Ssequence
    (Sset _i (Econst_int (Int.repr 0) tint))
    (Ssequence
      (Swhile
        (Ebinop Olt (Etempvar _i tuint) (Etempvar _b tuint) tint)
        (Ssequence
          (Sset _c
            (Ebinop Oadd (Etempvar _c tuint) (Etempvar _a tuint) tuint))
          (Sset _i
            (Ebinop Oadd (Etempvar _i tuint) (Econst_int (Int.repr 1) tint)
              tuint))))
      (Sreturn (Some (Etempvar _c tuint))))))
|}.

Definition f_mul4 := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_a, tuint) :: (_b, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_c, tuint) :: (_i, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _c (Econst_int (Int.repr 0) tint))
  (Ssequence
    (Ssequence
      (Sset _i (Econst_int (Int.repr 0) tint))
      (Sloop
        (Ssequence
          (Sifthenelse (Ebinop Olt (Etempvar _i tuint) (Etempvar _b tuint)
                         tint)
            Sskip
            Sbreak)
          (Sset _c
            (Ebinop Oadd (Etempvar _c tuint) (Etempvar _a tuint) tuint)))
        (Sset _i
          (Ebinop Oadd (Etempvar _i tuint) (Econst_int (Int.repr 1) tint)
            tuint))))
    (Sreturn (Some (Etempvar _c tuint)))))
|}.

Definition prog : Clight.program := {|
prog_defs :=
((___builtin_fabs,
   Gfun(External (EF_builtin ___builtin_fabs
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_memcpy_aligned,
   Gfun(External (EF_builtin ___builtin_memcpy_aligned
                   (mksignature
                     (AST.Tint :: AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     None cc_default))
     (Tcons (tptr tvoid)
       (Tcons (tptr tvoid) (Tcons tuint (Tcons tuint Tnil)))) tvoid
     cc_default)) ::
 (___builtin_annot,
   Gfun(External (EF_builtin ___builtin_annot
                   (mksignature (AST.Tint :: nil) None
                     {|cc_vararg:=true; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=true; cc_structret:=false|})) ::
 (___builtin_annot_intval,
   Gfun(External (EF_builtin ___builtin_annot_intval
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tschar) (Tcons tint Tnil))
     tint cc_default)) ::
 (___builtin_membar,
   Gfun(External (EF_builtin ___builtin_membar
                   (mksignature nil None cc_default)) Tnil tvoid cc_default)) ::
 (___builtin_va_start,
   Gfun(External (EF_builtin ___builtin_va_start
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___builtin_va_arg,
   Gfun(External (EF_builtin ___builtin_va_arg
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_va_copy,
   Gfun(External (EF_builtin ___builtin_va_copy
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil)) tvoid cc_default)) ::
 (___builtin_va_end,
   Gfun(External (EF_builtin ___builtin_va_end
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___compcert_va_int32,
   Gfun(External (EF_external ___compcert_va_int32
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tvoid) Tnil) tuint cc_default)) ::
 (___compcert_va_int64,
   Gfun(External (EF_external ___compcert_va_int64
                   (mksignature (AST.Tint :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons (tptr tvoid) Tnil) tulong
     cc_default)) ::
 (___compcert_va_float64,
   Gfun(External (EF_external ___compcert_va_float64
                   (mksignature (AST.Tint :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons (tptr tvoid) Tnil) tdouble
     cc_default)) ::
 (___builtin_bswap,
   Gfun(External (EF_builtin ___builtin_bswap
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap32,
   Gfun(External (EF_builtin ___builtin_bswap32
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap16,
   Gfun(External (EF_builtin ___builtin_bswap16
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tushort Tnil) tushort cc_default)) ::
 (___builtin_clz,
   Gfun(External (EF_builtin ___builtin_clz
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_ctz,
   Gfun(External (EF_builtin ___builtin_ctz
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_fsqrt,
   Gfun(External (EF_builtin ___builtin_fsqrt
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_fmax,
   Gfun(External (EF_builtin ___builtin_fmax
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble Tnil)) tdouble cc_default)) ::
 (___builtin_fmin,
   Gfun(External (EF_builtin ___builtin_fmin
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble Tnil)) tdouble cc_default)) ::
 (___builtin_fmadd,
   Gfun(External (EF_builtin ___builtin_fmadd
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fmsub,
   Gfun(External (EF_builtin ___builtin_fmsub
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmadd,
   Gfun(External (EF_builtin ___builtin_fnmadd
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmsub,
   Gfun(External (EF_builtin ___builtin_fnmsub
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_read16_reversed,
   Gfun(External (EF_builtin ___builtin_read16_reversed
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tushort) Tnil) tushort cc_default)) ::
 (___builtin_read32_reversed,
   Gfun(External (EF_builtin ___builtin_read32_reversed
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tuint) Tnil) tuint cc_default)) ::
 (___builtin_write16_reversed,
   Gfun(External (EF_builtin ___builtin_write16_reversed
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tushort) (Tcons tushort Tnil))
     tvoid cc_default)) ::
 (___builtin_write32_reversed,
   Gfun(External (EF_builtin ___builtin_write32_reversed
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tuint) (Tcons tuint Tnil))
     tvoid cc_default)) :: (_sum, Gfun(Internal f_sum)) ::
 (_mul, Gfun(Internal f_mul)) :: (_mul2, Gfun(Internal f_mul2)) ::
 (_mul3, Gfun(Internal f_mul3)) :: (_mul4, Gfun(Internal f_mul4)) :: nil);
prog_main := _main
|}.

