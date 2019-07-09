Require Import Clightdefs.

Local Open Scope Z_scope.

Definition _HMAC_Final : ident := 65%positive.
Definition _HMAC_Init : ident := 63%positive.
Definition _HMAC_Update : ident := 64%positive.
Definition _HMAC_cleanup : ident := 66%positive.
Definition _Nh : ident := 14%positive.
Definition _Nl : ident := 13%positive.
Definition _SHA256state_st : ident := 17%positive.
Definition ___builtin_addl : ident := 4%positive.
Definition ___builtin_annot : ident := 187%positive.
Definition ___builtin_annot_intval : ident := 176%positive.
Definition ___builtin_bswap : ident := 193%positive.
Definition ___builtin_bswap16 : ident := 199%positive.
Definition ___builtin_bswap32 : ident := 177%positive.
Definition ___builtin_clz : ident := 212%positive.
Definition ___builtin_ctz : ident := 175%positive.
Definition ___builtin_fabs : ident := 190%positive.
Definition ___builtin_fmadd : ident := 174%positive.
Definition ___builtin_fmax : ident := 201%positive.
Definition ___builtin_fmin : ident := 164%positive.
Definition ___builtin_fmsub : ident := 202%positive.
Definition ___builtin_fnmadd : ident := 183%positive.
Definition ___builtin_fnmsub : ident := 188%positive.
Definition ___builtin_fsqrt : ident := 171%positive.
Definition ___builtin_membar : ident := 179%positive.
Definition ___builtin_memcpy_aligned : ident := 191%positive.
Definition ___builtin_mull : ident := 6%positive.
Definition ___builtin_negl : ident := 3%positive.
Definition ___builtin_read16_reversed : ident := 166%positive.
Definition ___builtin_read32_reversed : ident := 172%positive.
Definition ___builtin_subl : ident := 5%positive.
Definition ___builtin_va_arg : ident := 184%positive.
Definition ___builtin_va_copy : ident := 200%positive.
Definition ___builtin_va_end : ident := 203%positive.
Definition ___builtin_va_start : ident := 181%positive.
Definition ___builtin_write16_reversed : ident := 1%positive.
Definition ___builtin_write32_reversed : ident := 2%positive.
Definition ___compcert_va_composite : ident := 165%positive.
Definition ___compcert_va_float64 : ident := 169%positive.
Definition ___compcert_va_int32 : ident := 196%positive.
Definition ___compcert_va_int64 : ident := 168%positive.
Definition ___i64_dtos : ident := 204%positive.
Definition ___i64_dtou : ident := 205%positive.
Definition ___i64_sar : ident := 185%positive.
Definition ___i64_sdiv : ident := 178%positive.
Definition ___i64_shl : ident := 162%positive.
Definition ___i64_shr : ident := 173%positive.
Definition ___i64_smod : ident := 167%positive.
Definition ___i64_stod : ident := 197%positive.
Definition ___i64_stof : ident := 198%positive.
Definition ___i64_udiv : ident := 186%positive.
Definition ___i64_umod : ident := 182%positive.
Definition ___i64_utod : ident := 209%positive.
Definition ___i64_utof : ident := 207%positive.
Definition _buf : ident := 213%positive.
Definition _ctx : ident := 170%positive.
Definition _data : ident := 195%positive.
Definition _free : ident := 62%positive.
Definition _h : ident := 12%positive.
Definition _hmac : ident := 74%positive.
Definition _hmac_ctx : ident := 10%positive.
Definition _hmac_ctx_st : ident := 20%positive.
Definition _i_ctx : ident := 18%positive.
Definition _ilen : ident := 83%positive.
Definition _input : ident := 82%positive.
Definition _key : ident := 77%positive.
Definition _keylen : ident := 78%positive.
Definition _main : ident := 163%positive.
Definition _malloc : ident := 61%positive.
Definition _mbedtls_md_context_t : ident := 11%positive.
Definition _mbedtls_md_free : ident := 208%positive.
Definition _mbedtls_md_get_size : ident := 206%positive.
Definition _mbedtls_md_hmac_finish : ident := 192%positive.
Definition _mbedtls_md_hmac_reset : ident := 189%positive.
Definition _mbedtls_md_hmac_starts : ident := 194%positive.
Definition _mbedtls_md_hmac_update : ident := 211%positive.
Definition _mbedtls_md_info_from_string : ident := 69%positive.
Definition _mbedtls_md_info_from_type : ident := 180%positive.
Definition _mbedtls_md_info_t : ident := 7%positive.
Definition _mbedtls_md_setup : ident := 214%positive.
Definition _md_ctx : ident := 9%positive.
Definition _md_info : ident := 8%positive.
Definition _md_name : ident := 68%positive.
Definition _md_type : ident := 70%positive.
Definition _mocked_sha256_info : ident := 67%positive.
Definition _num : ident := 16%positive.
Definition _o_ctx : ident := 19%positive.
Definition _output : ident := 210%positive.
Definition _sha_ctx : ident := 75%positive.

Definition v_mocked_sha256_info := {|
  gvar_info := (Tstruct _mbedtls_md_info_t noattr);
  gvar_init := (Init_space 0 :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition f_mbedtls_md_info_from_string := {|
  fn_return := (tptr (Tstruct _mbedtls_md_info_t noattr));
  fn_callconv := cc_default;
  fn_params := ((_md_name, (tptr tschar)) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Eaddrof
                 (Evar _mocked_sha256_info (Tstruct _mbedtls_md_info_t noattr))
                 (tptr (Tstruct _mbedtls_md_info_t noattr)))))
|}.

Definition f_mbedtls_md_info_from_type := {|
  fn_return := (tptr (Tstruct _mbedtls_md_info_t noattr));
  fn_callconv := cc_default;
  fn_params := ((_md_type, tint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Eaddrof
                 (Evar _mocked_sha256_info (Tstruct _mbedtls_md_info_t noattr))
                 (tptr (Tstruct _mbedtls_md_info_t noattr)))))
|}.

Definition f_mbedtls_md_get_size := {|
  fn_return := tuchar;
  fn_callconv := cc_default;
  fn_params := ((_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
                nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Econst_int (Int.repr 32) tint)))
|}.

Definition f_mbedtls_md_setup := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
                (_hmac, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_sha_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) ::
               (89%positive, (tptr tvoid)) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Scall (Some 89%positive)
      (Evar _malloc (Tfunction (Tcons tuint Tnil) (tptr tvoid) cc_default))
      ((Esizeof (Tstruct _hmac_ctx_st noattr) tuint) :: nil))
    (Sset _sha_ctx
      (Ecast (Etempvar 89%positive (tptr tvoid))
        (tptr (Tstruct _hmac_ctx_st noattr)))))
  (Ssequence
    (Sifthenelse (Ebinop Oeq
                   (Etempvar _sha_ctx (tptr (Tstruct _hmac_ctx_st noattr)))
                   (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
      (Sreturn (Some (Eunop Oneg (Econst_int (Int.repr 20864) tint) tint)))
      Sskip)
    (Ssequence
      (Sassign
        (Efield
          (Ederef
            (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
            (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid))
        (Etempvar _sha_ctx (tptr (Tstruct _hmac_ctx_st noattr))))
      (Sreturn (Some (Econst_int (Int.repr 0) tint))))))
|}.

Definition f_mbedtls_md_hmac_starts := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_key, (tptr tuchar)) :: (_keylen, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Scall None
    (Evar _HMAC_Init (Tfunction
                       (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                         (Tcons (tptr tuchar) (Tcons tint Tnil))) tvoid
                       cc_default))
    ((Efield
       (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
         (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)) ::
     (Ecast (Etempvar _key (tptr tuchar)) (tptr tuchar)) ::
     (Etempvar _keylen tuint) :: nil))
  (Sreturn (Some (Econst_int (Int.repr 0) tint))))
|}.

Definition f_mbedtls_md_hmac_reset := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) :: nil);
  fn_vars := ((_buf, (tarray tuchar 32)) :: nil);
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Scall None
    (Evar _HMAC_Final (Tfunction
                        (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                          (Tcons (tptr tuchar) Tnil)) tvoid cc_default))
    ((Efield
       (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
         (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)) ::
     (Evar _buf (tarray tuchar 32)) :: nil))
  (Sreturn (Some (Econst_int (Int.repr 0) tint))))
|}.

Definition f_mbedtls_md_hmac_update := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_input, (tptr tuchar)) :: (_ilen, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Scall None
    (Evar _HMAC_Update (Tfunction
                         (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                           (Tcons (tptr tvoid) (Tcons tuint Tnil))) tvoid
                         cc_default))
    ((Efield
       (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
         (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)) ::
     (Etempvar _input (tptr tuchar)) :: (Etempvar _ilen tuint) :: nil))
  (Sreturn (Some (Econst_int (Int.repr 0) tint))))
|}.

Definition f_mbedtls_md_hmac_finish := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_output, (tptr tuchar)) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Scall None
    (Evar _HMAC_Final (Tfunction
                        (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                          (Tcons (tptr tuchar) Tnil)) tvoid cc_default))
    ((Efield
       (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
         (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)) ::
     (Etempvar _output (tptr tuchar)) :: nil))
  (Sreturn (Some (Econst_int (Int.repr 0) tint))))
|}.

Definition f_mbedtls_md_free := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Scall None
    (Evar _HMAC_cleanup (Tfunction
                          (Tcons (tptr (Tstruct _hmac_ctx_st noattr)) Tnil)
                          tvoid cc_default))
    ((Efield
       (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
         (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)) ::
     nil))
  (Scall None
    (Evar _free (Tfunction (Tcons (tptr tvoid) Tnil) tvoid cc_default))
    ((Efield
       (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
         (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)) ::
     nil)))
|}.

Definition composites : list composite_definition :=
(Composite _mbedtls_md_context_t Struct
   ((_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
    (_md_ctx, (tptr tvoid)) :: (_hmac_ctx, (tptr tvoid)) :: nil)
   noattr ::
 Composite _SHA256state_st Struct
   ((_h, (tarray tuint 8)) :: (_Nl, tuint) :: (_Nh, tuint) ::
    (_data, (tarray tuchar 64)) :: (_num, tuint) :: nil)
   noattr ::
 Composite _hmac_ctx_st Struct
   ((_md_ctx, (Tstruct _SHA256state_st noattr)) ::
    (_i_ctx, (Tstruct _SHA256state_st noattr)) ::
    (_o_ctx, (Tstruct _SHA256state_st noattr)) :: nil)
   noattr :: Composite _mbedtls_md_info_t Struct nil noattr :: nil).

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
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
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
 (___compcert_va_composite,
   Gfun(External (EF_external ___compcert_va_composite
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     (tptr tvoid) cc_default)) ::
 (___i64_dtos,
   Gfun(External (EF_external ___i64_dtos
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tlong cc_default)) ::
 (___i64_dtou,
   Gfun(External (EF_external ___i64_dtou
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tulong cc_default)) ::
 (___i64_stod,
   Gfun(External (EF_external ___i64_stod
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tlong Tnil) tdouble cc_default)) ::
 (___i64_utod,
   Gfun(External (EF_external ___i64_utod
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tulong Tnil) tdouble cc_default)) ::
 (___i64_stof,
   Gfun(External (EF_external ___i64_stof
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tlong Tnil) tfloat cc_default)) ::
 (___i64_utof,
   Gfun(External (EF_external ___i64_utof
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tulong Tnil) tfloat cc_default)) ::
 (___i64_sdiv,
   Gfun(External (EF_external ___i64_sdiv
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___i64_udiv,
   Gfun(External (EF_external ___i64_udiv
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___i64_smod,
   Gfun(External (EF_external ___i64_smod
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___i64_umod,
   Gfun(External (EF_external ___i64_umod
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___i64_shl,
   Gfun(External (EF_external ___i64_shl
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___i64_shr,
   Gfun(External (EF_external ___i64_shr
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tint Tnil)) tulong cc_default)) ::
 (___i64_sar,
   Gfun(External (EF_external ___i64_sar
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
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
     tvoid cc_default)) ::
 (_malloc,
   Gfun(External EF_malloc (Tcons tuint Tnil) (tptr tvoid) cc_default)) ::
 (_free, Gfun(External EF_free (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (_HMAC_Init,
   Gfun(External (EF_external _HMAC_Init
                   (mksignature (AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     None cc_default))
     (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
       (Tcons (tptr tuchar) (Tcons tint Tnil))) tvoid cc_default)) ::
 (_HMAC_Update,
   Gfun(External (EF_external _HMAC_Update
                   (mksignature (AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     None cc_default))
     (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
       (Tcons (tptr tvoid) (Tcons tuint Tnil))) tvoid cc_default)) ::
 (_HMAC_Final,
   Gfun(External (EF_external _HMAC_Final
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default))
     (Tcons (tptr (Tstruct _hmac_ctx_st noattr)) (Tcons (tptr tuchar) Tnil))
     tvoid cc_default)) ::
 (_HMAC_cleanup,
   Gfun(External (EF_external _HMAC_cleanup
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr (Tstruct _hmac_ctx_st noattr)) Tnil) tvoid cc_default)) ::
 (_mocked_sha256_info, Gvar v_mocked_sha256_info) ::
 (_mbedtls_md_info_from_string, Gfun(Internal f_mbedtls_md_info_from_string)) ::
 (_mbedtls_md_info_from_type, Gfun(Internal f_mbedtls_md_info_from_type)) ::
 (_mbedtls_md_get_size, Gfun(Internal f_mbedtls_md_get_size)) ::
 (_mbedtls_md_setup, Gfun(Internal f_mbedtls_md_setup)) ::
 (_mbedtls_md_hmac_starts, Gfun(Internal f_mbedtls_md_hmac_starts)) ::
 (_mbedtls_md_hmac_reset, Gfun(Internal f_mbedtls_md_hmac_reset)) ::
 (_mbedtls_md_hmac_update, Gfun(Internal f_mbedtls_md_hmac_update)) ::
 (_mbedtls_md_hmac_finish, Gfun(Internal f_mbedtls_md_hmac_finish)) ::
 (_mbedtls_md_free, Gfun(Internal f_mbedtls_md_free)) :: nil);
prog_public :=
(_mbedtls_md_free :: _mbedtls_md_hmac_finish :: _mbedtls_md_hmac_update ::
 _mbedtls_md_hmac_reset :: _mbedtls_md_hmac_starts :: _mbedtls_md_setup ::
 _mbedtls_md_get_size :: _mbedtls_md_info_from_type ::
 _mbedtls_md_info_from_string :: _HMAC_cleanup :: _HMAC_Final ::
 _HMAC_Update :: _HMAC_Init :: _free :: _malloc ::
 ___builtin_write32_reversed :: ___builtin_write16_reversed ::
 ___builtin_read32_reversed :: ___builtin_read16_reversed ::
 ___builtin_fnmsub :: ___builtin_fnmadd :: ___builtin_fmsub ::
 ___builtin_fmadd :: ___builtin_fmin :: ___builtin_fmax ::
 ___builtin_fsqrt :: ___builtin_ctz :: ___builtin_clz ::
 ___builtin_bswap16 :: ___builtin_bswap32 :: ___builtin_bswap ::
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